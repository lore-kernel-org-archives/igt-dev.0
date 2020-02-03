Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20200203105401.17340-1-chris@chris-wilson.co.uk>
References: <20200203105401.17340-1-chris@chris-wilson.co.uk>
Date: Mon, 03 Feb 2020 15:04:32 +0200
Message-ID: <87k153akkf.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH i-g-t] i915/gem_eio: Don't mix INVALID_CS
 and the cmdparser
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Chris Wilson <chris@chris-wilson.co.uk> writes:

> Since the cmdparser causes it to discard the batch with INVALID_CS, we
> are not being as thorough in our testing on gen9/bcs as we expect.
> Furthermore, snb just dies, so don't.

snb funny

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  tests/i915/gem_eio.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index aa4accc9d..d226d7428 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -187,10 +187,13 @@ static igt_spin_t * __spin_poll(int fd, uint32_t ctx, unsigned long flags)
>  		.engine = flags,
>  		.flags = (IGT_SPIN_FAST |
>  			  IGT_SPIN_NO_PREEMPTION |
> -			  IGT_SPIN_INVALID_CS |
>  			  IGT_SPIN_FENCE_OUT),
>  	};
>  
> +	if (!gem_has_cmdparser(fd, opts.engine) &&
> +	    intel_gen(intel_get_drm_devid(fd)) != 6)
> +		opts.flags |= IGT_SPIN_INVALID_CS;
> +
>  	if (gem_can_store_dword(fd, opts.engine))
>  		opts.flags |= IGT_SPIN_POLL_RUN;
>  
> -- 
> 2.25.0
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
