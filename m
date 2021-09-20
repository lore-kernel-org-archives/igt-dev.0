Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3336E4EA
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 13:33:09 +0000 (UTC)
Date: Mon, 20 Sep 2021 15:33:03 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210920133303.GC58558@zkempczy-mobl2>
References: <20210920063059.10079-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210920063059.10079-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_sync.c : Add allocator
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 20, 2021 at 12:00:59PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> When relocations are not available tests must assign addresses to objects
> by themselves instead of relying on the driver. We use allocator for
> that purpose.
> 
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/gem_sync.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> index 6cb00c40..7c669e08 100644
> --- a/tests/i915/gem_sync.c
> +++ b/tests/i915/gem_sync.c
> @@ -249,6 +249,7 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  		double end, this, elapsed, now, baseline;
>  		unsigned long cycles;
>  		igt_spin_t *spin;
> +		uint64_t ahnd;
>  
>  		memset(&object, 0, sizeof(object));
>  		object.handle = gem_create(fd, 4096);
> @@ -260,7 +261,8 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  		execbuf.flags = ied_flags(&ied, child);
>  		execbuf.rsvd1 = ctx->id;
>  
> -		spin = __igt_spin_new(fd,
> +		ahnd = get_reloc_ahnd(fd, ctx->id);
> +		spin = __igt_spin_new(fd, .ahnd = ahnd,
>  				      .ctx = ctx,
>  				      .engine = execbuf.flags,
>  				      .flags = (IGT_SPIN_POLL_RUN |
> @@ -323,6 +325,7 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  
>  		igt_spin_free(fd, spin);
>  		gem_close(fd, object.handle);
> +		put_ahnd(ahnd);
>  	}
>  	igt_waitchildren_timeout(2*timeout, NULL);
>  	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
> @@ -341,13 +344,16 @@ static void active_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
>  		double start, end, elapsed;
>  		unsigned long cycles;
>  		igt_spin_t *spin[2];
> +		uint64_t ahnd[2];
>  
> -		spin[0] = __igt_spin_new(fd,
> +		ahnd[0] = get_reloc_ahnd(fd, ctx->id);
> +		spin[0] = __igt_spin_new(fd, .ahnd = ahnd[0],
>  					 .ctx = ctx,
>  					 .engine = ied_flags(&ied, child),
>  					 .flags = IGT_SPIN_FAST);
>  
> -		spin[1] = __igt_spin_new(fd,
> +		ahnd[1] = get_reloc_ahnd(fd, ctx->id);
> +		spin[1] = __igt_spin_new(fd, .ahnd = ahnd[1],

Same context, so same ahnd should be used.

>  					 .ctx = ctx,
>  					 .engine = ied_flags(&ied, child),
>  					 .flags = IGT_SPIN_FAST);
> @@ -370,6 +376,8 @@ static void active_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
>  		} while ((elapsed = gettime()) < end);
>  		igt_spin_free(fd, spin[1]);
>  		igt_spin_free(fd, spin[0]);
> +		put_ahnd(ahnd[0]);
> +		put_ahnd(ahnd[1]);
>  
>  		igt_info("%s %ld cycles: %.3f us\n",
>  			 ied_name(&ied, child),
> @@ -396,6 +404,7 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  		double end, this, elapsed, now, baseline;
>  		unsigned long cycles;
>  		igt_spin_t *spin[2];
> +		uint64_t ahnd[2];
>  
>  		memset(&object, 0, sizeof(object));
>  		object.handle = gem_create(fd, 4096);
> @@ -407,13 +416,15 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  		execbuf.flags = ied_flags(&ied, child);
>  		execbuf.rsvd1 = ctx->id;
>  
> -		spin[0] = __igt_spin_new(fd,
> +		ahnd[0] = get_reloc_ahnd(fd, 0);
> +		spin[0] = __igt_spin_new(fd, .ahnd = ahnd[0],
>  					 .engine = execbuf.flags,
>  					 .flags = (IGT_SPIN_POLL_RUN |
>  						   IGT_SPIN_FAST));
>  		igt_assert(igt_spin_has_poll(spin[0]));
>  
> -		spin[1] = __igt_spin_new(fd,
> +		ahnd[1] = get_reloc_ahnd(fd, 0);
> +		spin[1] = __igt_spin_new(fd, .ahnd = ahnd[1],

Same as above.

>  					 .engine = execbuf.flags,
>  					 .flags = (IGT_SPIN_POLL_RUN |
>  						   IGT_SPIN_FAST));
> @@ -490,6 +501,8 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  		igt_spin_free(fd, spin[1]);
>  		igt_spin_free(fd, spin[0]);
>  		gem_close(fd, object.handle);
> +		put_ahnd(ahnd[0]);
> +		put_ahnd(ahnd[1]);
>  	}
>  	igt_waitchildren_timeout(2*timeout, NULL);
>  	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
> @@ -1109,11 +1122,13 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
>  		struct drm_i915_gem_execbuffer2 execbuf;
>  		double start, elapsed;
>  		unsigned long cycles;
> +		uint64_t ahnd;
>  
>  		memset(&object, 0, sizeof(object));
>  		object.handle = gem_create(fd, 4096);
>  		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
>  
> +		ahnd = get_reloc_ahnd(fd, tmp_ctx[0]->id);
>  		memset(&execbuf, 0, sizeof(execbuf));
>  		execbuf.buffers_ptr = to_user_pointer(&object);
>  		execbuf.buffer_count = 1;
> @@ -1126,7 +1141,7 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
>  		cycles = 0;
>  		do {
>  			igt_spin_t *spin =
> -				__igt_spin_new(fd,
> +				__igt_spin_new(fd, .ahnd = ahnd,
>  					       .ctx = tmp_ctx[0],
>  					       .engine = execbuf.flags);
>  
> @@ -1142,6 +1157,7 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
>  			 ied_name(&ied, child), cycles, elapsed * 1e6/cycles);
>  
>  		gem_close(fd, object.handle);
> +		put_ahnd(ahnd);
>  	}
>  	igt_waitchildren_timeout(timeout+10, NULL);
>  	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
> -- 
> 2.32.0
> 

Have you tried to run this on active/wakeup/preempt tests? 
That doesn't work for me - hint: there's some missing puzzle here.
BTW you don't get fail on CI - it just runs "basic" tests.

--
Zbigniew
