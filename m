Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3554EDF17D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 17:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755EC10E2FB;
	Fri, 13 Feb 2026 17:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccIlIc/R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE9B10E2FB
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 17:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771004753; x=1802540753;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=mRejxId5AzuN/Zo4F8ihJsZ+hLw9DJG/sMGUi+2ZCBk=;
 b=ccIlIc/RHTaSPQ2/Xf8U/zNkJUGs9jp+grnXhaYuhT+5lkt0g9lzAlcl
 EAWYFAiujLIG4c4JEALSinbOYMv4PQCCjqlO2ip1+aUz84CWMtAKEOY07
 oDkVtN91Nr24Pm9Xz5OtBp3PwwnbgNzdTqVTNpgB0jXbAdHPnvSfPEfPc
 Z4CNDod5nPq3ypgduJB/YNrNGTnbWB4wBrhPZxd4p3FrTSF9N7/2TlcMd
 WOOY/6zScv6e1vtfAOtAJyg0jvSgjmyiJ7y0mTgT6i0mrZYVitORwY7Bo
 pXk/uxhDLIGRROiKz90/ADRJrRbCHToCqf+qEjF/ZeJ0x7HcsS1jTAHlU g==;
X-CSE-ConnectionGUID: l865/S2zRzOs9Na41JtDdg==
X-CSE-MsgGUID: GYuYcoSkSR2+mHObgNMaCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="82918651"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="82918651"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 09:45:52 -0800
X-CSE-ConnectionGUID: EClQn45cS4CG7UTpB4qtCQ==
X-CSE-MsgGUID: shJq2NJcQeqJEq2DZgAPOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="212103909"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.40])
 ([10.245.244.40])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 09:45:51 -0800
Message-ID: <7a733c76-76c1-4bc8-8f22-cfba6173e332@intel.com>
Date: Fri, 13 Feb 2026 18:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] DONT_MERGE:tests/intel/xe_compute: Robust
 SR-IOV/VF/PF and per-GT ccs_mode attribute handling
To: nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 stuart.summers@intel.com
References: <20260205041640.1357478-1-nishit.sharma@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260205041640.1357478-1-nishit.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Nishit,

On 2/5/26 05:16, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Add explicit checks for VF devices using intel_is_vf_device().
> Changed test skip logic based on PF with enabled VFs
> Remove global sriov_enabled flag and always check device state at runtime.
> For multi-GT systems, only run ccs_mode tests on GTs where the ccs_mode
> sysfs attribute is present. This ensures tests are robust on all platforms
> and configurations.
> Once the KMD changes are merged this patch will be aligned and merged
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>   tests/intel/xe_compute.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 310093fc5..47d4b49dd 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -26,8 +26,6 @@
>   #define DURATION_MARGIN		0.2
>   #define MIN_BUSYNESS		95.0
>   
> -bool sriov_enabled;
> -
>   struct thread_data {
>   	pthread_t thread;
>   	pthread_mutex_t *mutex;
> @@ -101,6 +99,10 @@ test_ccs_mode(void)
>   
>   		num_gt_with_ccs_mode++;

We count the gt as having ccs_mode...

>   		gt_fd = gt_sysfs_open(gt);
> +		if (!igt_sysfs_has_attr(gt_fd, "ccs_mode")) {
> +			close(gt_fd);
> +			continue;
> +		}

and then we check if it has ccs mode? Even when we move this check, is 
it even needed here? Can there be no ccs_mode entry if the gt supports 
ccs mode (just asking, I don't know much about this feature).


>   		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 0) < 0);
>   		for (m = 1; m <= num_slices; m++) {
>   			/* compute slices are to be equally distributed among enabled engines */
> @@ -177,6 +179,11 @@ test_compute_kernel_with_ccs_mode(void)
>   
>   		num_gt_with_ccs_mode++;
>   		gt_fd = gt_sysfs_open(gt);
> +		if (!igt_sysfs_has_attr(gt_fd, "ccs_mode")) {
> +			close(gt_fd);
> +			continue;
> +		}
> +

Same as above.

>   		for (m = 1; m <= num_slices; m++) {
>   			if (num_slices % m)
>   				continue;
> @@ -354,7 +361,7 @@ static bool is_sriov_mode(int fd)
>   {
>   	bool is_sriov = false;
>   
> -	if (igt_sriov_is_pf(fd) && igt_sriov_vfs_supported(fd))
> +	if (intel_is_vf_device(fd) || (igt_sriov_is_pf(fd) && igt_sriov_get_enabled_vfs(fd) > 0))

this function could just return the if condition.

>   		is_sriov = true;
>   
>   	return is_sriov;
> @@ -422,6 +429,10 @@ test_eu_busy(uint64_t duration_sec)
>   			continue;

This continue

>   
>   		gt_fd = gt_sysfs_open(gt);
> +		if (!igt_sysfs_has_attr(gt_fd, "ccs_mode")) {
> +			close(gt_fd);
> +			continue;
and this one, can lead to the skip after the loop checking unitialized 
ccs_mode variable.

> +		}
>   		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", num_slices) > 0);
>   		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
>   		close(gt_fd);
> @@ -514,6 +525,7 @@ int igt_main()
>   {
>   	int xe, ccs_mode[4];
>   	unsigned int ip_ver;
> +	bool sriov_enabled;
>   
>   	igt_fixture() {
>   		xe = drm_open_driver(DRIVER_XE);
> @@ -530,14 +542,12 @@ int igt_main()
>   
>   	/* ccs mode tests should be run without open gpu file handles */
>   	igt_subtest("ccs-mode-basic") {
> -		/* skip if sriov enabled */
>   		if (sriov_enabled)
>   			igt_skip("Skipping test when SRIOV is enabled\n");
>   		test_ccs_mode();
>   	}
>   
>   	igt_subtest("ccs-mode-compute-kernel") {
> -		/* skip if sriov enabled */
>   		if (sriov_enabled)
>   			igt_skip("Skipping test when SRIOV is enabled\n");
>   		test_compute_kernel_with_ccs_mode();
> @@ -554,7 +564,6 @@ int igt_main()
>   
>   	/* test to check available EU utilisation in multi-ccs case */
>   	igt_subtest("eu-busy-10s") {
> -		/* skip if sriov enabled */
>   		if (sriov_enabled)
>   			igt_skip("Skipping test when SRIOV is enabled\n");
>   
> @@ -566,7 +575,7 @@ int igt_main()
>   	}
>   
>   	igt_fixture() {
> -		if (!sriov_enabled)
> +		if (sriov_enabled)

Why?
>   			igt_restore_ccs_mode(ccs_mode, ARRAY_SIZE(ccs_mode));
>   	}
>   }

