Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C9D18AF5C
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 18:36:41 +0000 (UTC)
Date: Tue, 26 Jul 2022 11:36:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Message-ID: <YuA0M3POar9L7Gqj@mdroper-desk1.amr.corp.intel.com>
References: <20220726090930.1512191-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220726090930.1512191-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_frontbuffer_tracking:
 Skip fbcpsr testcases as needed
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jul 26, 2022 at 12:09:30PM +0300, Jouni Högander wrote:
> Driver is not using fbc for display versions 12 and 13 if PSR is
> enabled. This is currently causing failures on fbcpsr_* subtests.
> 
> Fix this by checking display version and skipping fbcpsc_* subtests as
> needed.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/160
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>

You may want to mention that Wa_14016291713 is the reason for this in
the commit message and/or code comment.  But otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> ---
>  tests/i915/kms_frontbuffer_tracking.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
> index 248ff36b..9518c706 100644
> --- a/tests/i915/kms_frontbuffer_tracking.c
> +++ b/tests/i915/kms_frontbuffer_tracking.c
> @@ -1788,6 +1788,8 @@ static bool enable_features_for_test(const struct test_mode *t)
>  
>  static void check_test_requirements(const struct test_mode *t)
>  {
> +	int ver;
> +
>  	if (t->pipes == PIPE_DUAL)
>  		igt_require_f(scnd_mode_params.output,
>  			    "Can't test dual pipes with the current outputs\n");
> @@ -1815,6 +1817,14 @@ static void check_test_requirements(const struct test_mode *t)
>  
>  	if (opt.only_pipes != PIPE_COUNT)
>  		igt_require(t->pipes == opt.only_pipes);
> +
> +	/* Kernel disables fbc for display versions 12 and 13 if psr is enabled. */
> +	ver = intel_display_ver(intel_get_drm_devid(drm.fd));
> +	if (ver >= 12 && ver <= 13)
> +		igt_require_f(!((t->feature & FEATURE_PSR) &&
> +				(t->feature & FEATURE_FBC)),
> +			      "Can't test PSR and FBC together\n");
> +
>  }
>  
>  static void set_crtc_fbs(const struct test_mode *t)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
