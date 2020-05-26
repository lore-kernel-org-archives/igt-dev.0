Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0BF8996E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2020 13:05:04 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20200519063411.1541230-1-chris@chris-wilson.co.uk>
References: <20200519063411.1541230-1-chris@chris-wilson.co.uk>
Date: Tue, 26 May 2020 16:04:55 +0300
Message-ID: <87wo4y26fc.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] i915/gem_ctx_persistence: Use "%u"
 for -1u conversion
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 19 May 2020, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> The debugfs modparams are more picky and refuse to do the implicit
> unsigned conversion.

I was wondering about this until I realized "reset" in i915_params.h has
type unsigned int, while the module param in i915_params.c has type
int. It's not that the debugfs is more picky, it's just that they have
different types!

BR,
Jani.


>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/i915/gem_ctx_persistence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index ce9f02350..4a1ef0f27 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -1127,7 +1127,7 @@ igt_main
>  		igt_require_gem(i915);
>  
>  		/* Restore the reset modparam if left clobbered */
> -		igt_assert(igt_params_set(i915, "reset", "%d", -1));
> +		igt_assert(igt_params_set(i915, "reset", "%u", -1));
>  
>  		enable_hangcheck(i915);
>  		igt_install_exit_handler(exit_handler);

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
