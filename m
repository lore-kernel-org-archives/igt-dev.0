Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969A910FB8D
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 07:23:42 +0000 (UTC)
Date: Fri, 29 Apr 2022 10:23:50 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Alex Hung <alex.hung@amd.com>
Message-ID: <YmuShjl2kI4G8MNJ@platvala-desk.ger.corp.intel.com>
References: <20220415003328.514267-1-alex.hung@amd.com>
 <20220415003328.514267-2-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220415003328.514267-2-alex.hung@amd.com>
Subject: Re: [igt-dev] [PATCH 2/2] tests/kms_panel_fitting: Skip
 atomic-fastset for non-i915
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

On Thu, Apr 14, 2022 at 06:33:28PM -0600, Alex Hung wrote:
> In kernel function drm_atomic_check_only checks allow_modeset,
> and it can return -EINVAL (-22) for non-i915 devices.
> 
> Therefore, let's skip atomic-fastset subtest for non-i915 until
> specific implementation is added for each gpu driver.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_panel_fitting.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> index 7ed0d196..9f607376 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -242,6 +242,7 @@ static void test_atomic_fastset(data_t *data)
>  	int valid_tests = 0;
>  	struct stat sb;
>  
> +	igt_require_f(is_i915_device(display->drm_fd), "not valid for non-i915 devices\n");
>  
>  	if (is_i915_device(display->drm_fd)) {

This if becomes redundant now.


-- 
Petri Latvala



>  		/* Until this is force enabled, force modeset evasion. */
> -- 
> 2.35.1
> 
