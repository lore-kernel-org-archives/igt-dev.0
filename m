Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713D5CFC60F
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 07:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F8710E124;
	Fri, 11 Oct 2024 07:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTee5PDV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9754910EA6D
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 07:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728632841; x=1760168841;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=05uChQojo2KWku93vwq2JGsXh5ku5HH4bVJfao2eaKE=;
 b=WTee5PDVnsxFw+XxQq98SSUoqJTav13/5/wxIof0JQTmID14FiY5BT94
 HJPEdNuoijYchksi7CQs1QcdQ1axzObrcbKSQ02CZ4H4R5h3CiIF3QJth
 z5yYembWr7m3DIphIgah2ZHcGYCfnvKxUfpVfszhnxBeqzIfwysgxZ2B0
 9RyWfCK3BV0SzlVA6yxq7LPFhgXqWvFqvI91X+vm/ckcEUNTJl/kvCfPp
 /7o/x7Fe2o8KtvGeJXe1D9P8gEuTlCZtpQUWbl3SkY4sNa1d7WnHJK9pV
 8tb+6BzjotKMmyhMUmSIKuKXi824gQwhru6WgjvFx9RNJ4VHVrW48caN6 w==;
X-CSE-ConnectionGUID: WbU6BEkwSOOgrNg+hq+7gg==
X-CSE-MsgGUID: WhRGDEWyR+qjj5PheCcylA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38672294"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="38672294"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 00:47:20 -0700
X-CSE-ConnectionGUID: cW380wWUR8GODVXWFYvgAw==
X-CSE-MsgGUID: jvUJTDCHQCy+0rRlWAo2Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="107701116"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 00:47:19 -0700
Date: Fri, 11 Oct 2024 09:47:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sk.anirban@intel.com, anshuman.gupta@intel.com, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com
Subject: Re: [i-g-t, v2, 1/2] tests/xe: Add tests to validate GT coarse power
 gating status and toggle coarse power gating states
Message-ID: <20241011074716.url6r7gx34sz6ky7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, sk.anirban@intel.com,
 anshuman.gupta@intel.com, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com
References: <20241010065312.1988533-1-sk.anirban@intel.com>
 <20241010065312.1988533-2-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241010065312.1988533-2-sk.anirban@intel.com>
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

Hi sk.anirban,
On 2024-10-10 at 12:23:11 +0530, sk.anirban@intel.com wrote:
> From: Sk Anirban <sk.anirban@intel.com>

please make subject short, like:

tests/intel/xe_pm_residency: Add coarse power gating validation

> 
> Implement test test-cpg-basic to validate coarse power gating status
> using a suspend cycle.
> Add test toggle-gt-cpg to check if GT coarse power gating is up when
> forcewake is acquired and down when released.
> 
> v2: Address cosmetic review comments (Riana)
>     Fix suspend state (Riana)
>     Add exit handler for this test toggle_gt_cpg (Riana)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  tests/intel/xe_pm_residency.c | 98 +++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 772fe9b57..54a8c62f7 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -63,6 +63,12 @@ enum test_type {
>   * SUBTEST: toggle-gt-c6
>   * Description: toggles GT C states by acquiring/releasing forcewake,
>   *		also validates power consumed by GPU in GT C6 is lesser than that of GT C0.
> + *
> + * SUBTEST: cpg-basic
> + * Description: Validate GT coarse power gating status with a suspend cycle.
> + *
> + * SUBTEST: toggle-gt-cpg

imho better:
 * SUBTEST: cpg-gt-toggle

Regards,
Kamil

> + * Description: Toggle GT coarse power gating states by acquiring/releasing forcewake.
>   */
>  IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>  
> @@ -317,6 +323,87 @@ static void toggle_gt_c6(int fd, int n)
>  			     "Power consumed in GT C6 should be lower than GT C0\n");
>  }
>  
> +#define RENDER_POWER_GATING "Render Power Gating Enabled: "
> +#define MEDIA_POWER_GATING "Media Power Gating Enabled: "
> +#define POWER_GATE_STATUS "Power Gate Status: "
> +
> +static void powergate_info(int fd, int gt)
> +{
> +	int dir;
> +	char *str;
> +	char *render_substr;
> +	char *media_substr;
> +
> +	dir = igt_debugfs_gt_dir(fd, gt);
> +	igt_assert(dir >= 0);
> +
> +	str = igt_sysfs_get(dir, "powergate_info");
> +	igt_assert_f(str, "Failed to read sysfs attribute\n");
> +	render_substr = strstr(str, RENDER_POWER_GATING);
> +	if (render_substr) {
> +		igt_assert_f(strncmp(render_substr + strlen(RENDER_POWER_GATING), "yes", 3) == 0,
> +			     "Render Power Gating should be enabled");
> +	}
> +
> +	media_substr = strstr(str, MEDIA_POWER_GATING);
> +	if (media_substr) {
> +		igt_assert_f(strncmp(media_substr + strlen(MEDIA_POWER_GATING), "yes", 3) == 0,
> +			     "Media Power Gating should be enabled");
> +	}
> +
> +	free(str);
> +	close(dir);
> +}
> +
> +
> +static void powergate_status(int fd, int gt, const char *expected_status)
> +{
> +	int dir;
> +	char *str;
> +	char *status_substr;
> +
> +	dir = igt_debugfs_gt_dir(fd, gt);
> +	igt_assert(dir >= 0);
> +
> +	str = igt_sysfs_get(dir, "powergate_info");
> +	igt_assert_f(str, "Failed to read sysfs attribute\n");
> +	status_substr = strstr(str, POWER_GATE_STATUS);
> +	while (status_substr) {
> +		igt_assert_f((strncmp(status_substr + strlen(POWER_GATE_STATUS), expected_status,
> +		strlen(expected_status)) == 0), "Power Gate Status Should be %s\n %s\n",
> +		expected_status, str);
> +
> +		status_substr = strstr(status_substr + strlen(POWER_GATE_STATUS),
> +		POWER_GATE_STATUS);
> +	}
> +	close(dir);
> +}
> +
> +static void cpg_basic(int fd, int gt)
> +{
> +	powergate_info(fd, gt);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_S3, SUSPEND_TEST_NONE);
> +	powergate_info(fd, gt);
> +}
> +
> +static void toggle_gt_cpg(int fd)
> +{
> +	int gt;
> +
> +	xe_for_each_gt(fd, gt)
> +		powergate_info(fd, gt);
> +
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
> +	xe_for_each_gt(fd, gt)
> +		powergate_status(fd, gt, "up");
> +
> +	close(fw_handle);
> +	sleep(1);
> +	xe_for_each_gt(fd, gt)
> +		powergate_status(fd, gt, "down");
> +}
> +
>  igt_main
>  {
>  	uint32_t d3cold_allowed;
> @@ -380,6 +467,17 @@ igt_main
>  		toggle_gt_c6(fd, NUM_REPS);
>  	}
>  
> +	igt_describe("Validate Coarse power gating status during suspend cycle");
> +	igt_subtest("cpg-basic")
> +		xe_for_each_gt(fd, gt)
> +			cpg_basic(fd, gt);
> +
> +	igt_describe("Toggle GT coarse power gating states by managing forcewake");
> +	igt_subtest("toggle-gt-cpg") {
> +		igt_install_exit_handler(close_fw_handle);
> +		toggle_gt_cpg(fd);
> +	}
> +
>  	igt_fixture {
>  		close(fd);
>  	}
> -- 
> 2.34.1
> 
