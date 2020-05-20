Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80E36E580
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2020 06:56:49 +0000 (UTC)
Date: Wed, 20 May 2020 09:56:42 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200520065642.GA26240@ideak-desk.fi.intel.com>
References: <20200520063541.24829-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520063541.24829-1-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_pm_rpm: Fix plane_subtest
 assertion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, May 20, 2020 at 12:05:41PM +0530, Anshuman Gupta wrote:
> I have added igt_assert_lte() assertion on planes_tested
> unintentionally by mistake, while applying the patch and fixing
> the conflicts.
> 
> Fixes: 32498f12ab04 ("tests/i915_pm_rpm: Fix the universal-plane cap setting in plane tests")
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  tests/i915/i915_pm_rpm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index 0a641640..6d46c320 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -1786,7 +1786,7 @@ static void test_one_plane(bool dpms, uint32_t plane_id,
>  /* This one also triggered WARNs on our driver at some point in time. */
>  static void planes_subtest(bool universal, bool dpms)
>  {
> -	int i, planes_tested = 0, crtc_idx;
> +	int i, crtc_idx;
>  	drmModePlaneResPtr planes;
>  
>  	igt_require(default_mode_params);
> @@ -1817,7 +1817,6 @@ static void planes_subtest(bool universal, bool dpms)
>  
>  	igt_assert_eq(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES,
>  				      1), 0);
> -	igt_assert_lte(universal ? 3 : 1, planes_tested);
>  }
>  
>  static void pm_test_tiling(void)
> -- 
> 2.26.0
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
