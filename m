Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742BD6EC54
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2020 03:20:09 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
Date: Fri, 6 Mar 2020 03:20:04 +0000
Message-ID: <5734061626B4B34D8BE569E3846B57A2C218DE@BGSMSX107.gar.corp.intel.com>
References: <20200218121549.12917-1-sai.gowtham.ch@intel.com>
 <20200305124250.GA32109@kdec5-desk.ger.corp.intel.com>
In-Reply-To: <20200305124250.GA32109@kdec5-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t]tests/i915/gem_exec_create:
 Added __for_each_physical_engine to utilize all available engines.
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
To: "Dec, Katarzyna" <katarzyna.dec@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

After fork we need to transfer the engine map from parent fd default 
context. (gem_context_copy_engines)

Also, since we have __for_each_physical_engine in the top level 
igt_fixture, I think _all_ subtests run with default ctx engine map. So 
all which submit to one from either all_engines or ppgtt_engines need to 
make sure engine maps are aligned.

it was suggested by tvrtko in one of the patch: https://patchwork.freedesktop.org/patch/351622/?series=72889&rev=1

Thanks,
Gowtham

-----Original Message-----
From: Dec, Katarzyna <katarzyna.dec@intel.com> 
Sent: Thursday, March 5, 2020 6:13 PM
To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t]tests/i915/gem_exec_create: Added __for_each_physical_engine to utilize all available engines.

On Tue, Feb 18, 2020 at 05:45:49PM +0530, sai gowtham wrote:
> From: saigowth <sai.gowtham.ch@intel.com>
> 
> Replaced the legacy for_each_engine* defines with the ones implemented 
> in the gem_engine_topology library.
> 
> Cc: Dec Katarzyna <katarzyna.dec@intel.com>
> Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
> Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_exec_create.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_create.c 
> b/tests/i915/gem_exec_create.c index 102a161d..c70572af 100644
> --- a/tests/i915/gem_exec_create.c
> +++ b/tests/i915/gem_exec_create.c
> @@ -58,14 +58,15 @@ static double elapsed(const struct timespec 
> *start, const struct timespec *end)
>  
>  static void all(int fd, unsigned flags, int timeout, int ncpus)  {
> +	const struct intel_execution_engine2 *e;
>  	const uint32_t bbe = MI_BATCH_BUFFER_END;
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	struct drm_i915_gem_exec_object2 obj;
>  	unsigned engines[16], nengine;
>  
>  	nengine = 0;
> -	for_each_physical_engine(e, fd)
> -		engines[nengine++] = eb_ring(e);
> +	__for_each_physical_engine(fd, e)
> +		engines[nengine++] = e->flags;
>  	igt_require(nengine);
>  
>  	memset(&obj, 0, sizeof(obj));
> @@ -86,38 +87,40 @@ static void all(int fd, unsigned flags, int 
> timeout, int ncpus)
>  
>  	intel_detect_and_clear_missed_interrupts(fd);
>  	igt_fork(child, ncpus) {
> +		int i915;
>  		struct timespec start, now;
>  		unsigned long count;
>  		double time;
> -
> +		i915 = gem_reopen_driver(fd);
> +		gem_context_copy_engines(fd, 0, i915, 0);
Why do we need to reopen device and copy it's context? What's the purpose?
Kasia
>  		count = 0;
>  		clock_gettime(CLOCK_MONOTONIC, &start);
>  		do {
>  			for (int loop = 0; loop < 1024; loop++) {
>  				for (int n = 0; n < nengine; n++) {
> -					obj.handle =  gem_create(fd, 4096);
> -					gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
> +					obj.handle =  gem_create(i915, 4096);
> +					gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
>  					execbuf.flags &= ~ENGINE_FLAGS;
>  					execbuf.flags |= engines[n];
> -					gem_execbuf(fd, &execbuf);
> +					gem_execbuf(i915, &execbuf);
>  					if (flags & LEAK)
> -						gem_madvise(fd, obj.handle, I915_MADV_DONTNEED);
> +						gem_madvise(i915, obj.handle, I915_MADV_DONTNEED);
>  					else
> -						gem_close(fd, obj.handle);
> +						gem_close(i915, obj.handle);
>  				}
>  			}
>  			count += nengine * 1024;
>  			clock_gettime(CLOCK_MONOTONIC, &now);
>  		} while (elapsed(&start, &now) < timeout); /* Hang detection ~120s */
> -		obj.handle =  gem_create(fd, 4096);
> -		gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
> +		obj.handle =  gem_create(i915, 4096);
> +		gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
>  		for (int n = 0; n < nengine; n++) {
>  			execbuf.flags &= ~ENGINE_FLAGS;
>  			execbuf.flags |= engines[n];
> -			gem_execbuf(fd, &execbuf);
> +			gem_execbuf(i915, &execbuf);
>  		}
> -		gem_sync(fd, obj.handle);
> -		gem_close(fd, obj.handle);
> +		gem_sync(i915, obj.handle);
> +		gem_close(i915, obj.handle);
>  		clock_gettime(CLOCK_MONOTONIC, &now);
>  
>  		time = elapsed(&start, &now) / count;
> --
> 2.25.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
