Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20200303141842.1575190-1-chris@chris-wilson.co.uk>
References: <20200303141842.1575190-1-chris@chris-wilson.co.uk>
Date: Tue, 03 Mar 2020 16:34:09 +0200
Message-ID: <87o8td5wym.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_exec_create: Trim
 loop counters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Chris Wilson <chris@chris-wilson.co.uk> writes:

> gem_create + gem_execbuf should be long enough that the accuracy of
> gettime is insignificant; and this is a test not a benchmark! Remove the
> 1024 loop so that we check for timeout more frequently.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  tests/i915/gem_exec_create.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
> index 102a161d5..e3ceb3f5c 100644
> --- a/tests/i915/gem_exec_create.c
> +++ b/tests/i915/gem_exec_create.c
> @@ -93,23 +93,21 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
>  		count = 0;
>  		clock_gettime(CLOCK_MONOTONIC, &start);
>  		do {
> -			for (int loop = 0; loop < 1024; loop++) {
> -				for (int n = 0; n < nengine; n++) {
> -					obj.handle =  gem_create(fd, 4096);
> -					gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
> -					execbuf.flags &= ~ENGINE_FLAGS;
> -					execbuf.flags |= engines[n];
> -					gem_execbuf(fd, &execbuf);
> -					if (flags & LEAK)
> -						gem_madvise(fd, obj.handle, I915_MADV_DONTNEED);
> -					else
> -						gem_close(fd, obj.handle);
> -				}
> +			for (int n = 0; n < nengine; n++) {
> +				obj.handle = gem_create(fd, 4096);
> +				gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
> +				execbuf.flags &= ~ENGINE_FLAGS;
> +				execbuf.flags |= engines[n];
> +				gem_execbuf(fd, &execbuf);
> +				if (flags & LEAK)
> +					gem_madvise(fd, obj.handle, I915_MADV_DONTNEED);
> +				else
> +					gem_close(fd, obj.handle);
>  			}
> -			count += nengine * 1024;
> +			count += nengine;
>  			clock_gettime(CLOCK_MONOTONIC, &now);
>  		} while (elapsed(&start, &now) < timeout); /* Hang detection ~120s */
> -		obj.handle =  gem_create(fd, 4096);
> +		obj.handle = gem_create(fd, 4096);
>  		gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
>  		for (int n = 0; n < nengine; n++) {
>  			execbuf.flags &= ~ENGINE_FLAGS;
> -- 
> 2.25.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
