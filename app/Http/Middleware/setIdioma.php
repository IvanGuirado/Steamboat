<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\App;
class setIdioma
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
    
        $lang = session()->get('lang');
        \Log::info("lang:$lang");
        if ($lang) {
           App::setLocale($lang);
        }

        $user = auth()->user();

        if ($user != null) {
            App::setLocale($user->language);
        }

        return $next($request);
    }
}
