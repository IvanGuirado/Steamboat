@if ($paginator->hasPages())
    <nav class="paginacion">
        <div class="pagination-container">
            <ul class="pagination">
                {{-- Previous Page Link --}}
                @if ($paginator->onFirstPage())
                    <li class="disabled" aria-disabled="true"><span>@lang('pagination.previous')</span></li>
                @else
                    <li><a href="{{ $paginator->previousPageUrl() }}" rel="prev" class="enlaces">@lang('pagination.previous')</a></li>
                @endif

                {{-- Next Page Link --}}
                @if ($paginator->hasMorePages())
                    <li><a href="{{ $paginator->nextPageUrl() }}" rel="next" class="enlaces">@lang('pagination.next')</a></li>
                @else
                    <li class="disabled" aria-disabled="true"><span>@lang('pagination.next')</span></li>
                @endif
            </ul>

        </div>

    </nav>
@endif
