Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D44C531FA
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 09:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B1010E051;
	Fri, 24 Jul 2026 09:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdcMQlst";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0E410E051
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784884122; x=1816420122;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=U73r6MH8XsXLnECwZ+m7o5X1K13PJXdQhFVwfh1lRtw=;
 b=cdcMQlstiZqIzqkyfMDgiCdP/rapFOaS8lYDf54HjapFxnk0R0kBfT1j
 HmncwyXtWh4P6zmhHjb8X64W2Q1XdkoUrnDJWtSCATg2iZ6nNYUKwEVOW
 TtoXmPcDtz7kWOzol6ZxNlTmTwRHhallKz/PhU5m8EPRSxbF4gBR1P2lx
 RijO+2VXRQRsbkfWRb9FIu4ARjdfIHrQg46ALXB5NzgdGf3qXsWW2/Ojq
 Ml/d58ilVDd32iNHO8BC2RajHlgzWAiEbrHjka6nTqKRtnoyIJazkkERN
 bagkz9BO6a/DDYXdoueBLL1SRrLJ5MDY0fc2h5vSVn0RCNKZTBF+XpIu2 A==;
X-CSE-ConnectionGUID: UqMof00wRv62KARruHNXoA==
X-CSE-MsgGUID: PW8ehKwRRKqAON061TZuqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96921206"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="96921206"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 02:08:41 -0700
X-CSE-ConnectionGUID: SxaXT7+oQ5edjynJmIQULg==
X-CSE-MsgGUID: KzVPPZnyR/eLxTWd9IvH4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="262448154"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 02:08:40 -0700
Date: Fri, 24 Jul 2026 11:08:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org, Sobin Thomas <sobin.thomas@intel.com>
Subject: Re: [PATCH] tests/intel/xe_gt_debugfs: Add GT-level Xe debugfs
 coverage
Message-ID: <20260724090838.p4yn2goy2pjib5vr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>,
 igt-dev@lists.freedesktop.org,
 Sobin Thomas <sobin.thomas@intel.com>
References: <20260717083335.1219429-1-smitha.balasubramanyam@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717083335.1219429-1-smitha.balasubramanyam@intel.com>
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

Hi Smitha,
On 2026-07-17 at 14:03:35 +0530, Smitha Balasubramanyam wrote:
> Add a new test exercising the GT-level debugfs attributes
> exposed by the Xe driver.

Why new test? imho this should be in xe_debugfs.c

> 
> The following kernel show/store handlers are covered:
> 
>  - hw_engines, steering (PF-only)
>  - register-save-restore, hwconfig, default_lrc_{rcs,ccs,bcs,vcs,vecs}
>    (VF-safe)

Please split these into more patches, add SRIOV developers to Cc
for any VF/PF changes.

>  - stats store handler: valid boolean input accepted, invalid input
>    rejected
> 
> force_reset and force_reset_sync are present in the VF-safe node list
> but their show handlers trigger live GT resets and are intentionally not
> read. Presence is verified via openat-only check in gt-dir-vf-safe.
> 
> Subtests:
>  - gt-dir-vf-safe: presence check for unconditional VF-safe nodes
>  - gt-dir-pf-only: presence check for PF-only nodes (skipped on VF)
>  - gt-hw-engines: read hw_engines (PF only)
>  - gt-steering: read steering (PF only)
>  - gt-register-save-restore: read register-save-restore
>  - gt-default-lrc: read per engine class, skips absent engines
>  - gt-hwconfig: read hwconfig
>  - gt-stats-write: verify stats accepts valid input and rejects
>    malformed input

Can you reuse existing infra in xe_debugfs? +cc Sobin
Cc: Sobin Thomas <sobin.thomas@intel.com>


Regards,
Kamil

> Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
> ---
>  tests/intel/xe_gt_debugfs.c | 359 ++++++++++++++++++++++++++++++++++++
>  tests/meson.build           |   1 +
>  2 files changed, 360 insertions(+)
>  create mode 100644 tests/intel/xe_gt_debugfs.c
> 
> diff --git a/tests/intel/xe_gt_debugfs.c b/tests/intel/xe_gt_debugfs.c
> new file mode 100644
> index 000000000..afb3ff4bd
> --- /dev/null
> +++ b/tests/intel/xe_gt_debugfs.c
> @@ -0,0 +1,359 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_debugfs.h"
> +#include "igt_sysfs.h"
> +#include "igt_sriov_device.h"
> +#include "xe/xe_query.h"
> +
> +IGT_TEST_DESCRIPTION("Validate GT-level Xe debugfs attributes and their content");
> +
> +/**
> + * TEST: Xe GT debugfs
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: debugfs
> + * Feature: core
> + * Test category: functionality test
> + * Description: Validate that GT-level Xe debugfs attributes are readable or
> + * writable and return valid content.  Covers both PF-only and VF-safe
> + * attributes, and the stats write path.
> + */
> +
> +/**
> + * SUBTEST: gt-dir-vf-safe
> + * Description: Check that unconditional GT debugfs attrs accessible from
> + * both PF and VF contexts are present for each GT.
> + *
> + * SUBTEST: gt-dir-pf-only
> + * Description: Check that PF-only GT debugfs attrs are present for each GT on PF.
> + *
> + * SUBTEST: gt-hw-engines
> + * Description: Read hw_engines debugfs attribute for each GT.
> + *
> + * SUBTEST: gt-steering
> + * Description: Read steering debugfs attribute for each GT.
> + *
> + * SUBTEST: gt-register-save-restore
> + * Description: Read register-save-restore debugfs attribute for each GT.
> + *
> + * SUBTEST: gt-default-lrc
> + * Description: Validate default LRC content for each engine class present on each GT.
> + * Engine classes absent on the GT are skipped.
> + *
> + * SUBTEST: gt-hwconfig
> + * Description: Read hwconfig debugfs attribute for each GT.
> + *
> + * SUBTEST: gt-stats-write
> + * Description: Write an invalid payload to the stats debugfs attribute for
> + * each GT to verify the kernel rejects malformed input without modifying
> + * counter state.
> + */
> +
> +static int *gt_dirs;
> +
> +static bool attr_exists(int dirfd, const char *name, int mode)
> +{
> +	int fd = openat(dirfd, name, mode);
> +
> +	if (fd < 0)
> +		return false;
> +
> +	close(fd);
> +	return true;
> +}
> +
> +static void test_gt_dir_vf_safe(unsigned int gt)
> +{
> +	/*
> +	 * Unconditionally registered on every GT for both PF and VF contexts.
> +	 */
> +	static const char * const attrs[] = {
> +		"register-save-restore",
> +		"hwconfig",
> +		"stats",
> +		"force_reset",
> +		"force_reset_sync",
> +	};
> +	/* Engine-conditional: absent when that engine class is not on this GT. */
> +	static const char * const lrc_attrs[] = {
> +		"default_lrc_rcs",
> +		"default_lrc_ccs",
> +		"default_lrc_bcs",
> +		"default_lrc_vcs",
> +		"default_lrc_vecs",
> +	};
> +	int dir = gt_dirs[gt];
> +	int missing_attr = 0;
> +	int lrc_present = 0;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(attrs); i++) {
> +		if (!attr_exists(dir, attrs[i], O_RDONLY)) {
> +			igt_warn("GT%u: missing attr: %s\n", gt, attrs[i]);
> +			missing_attr++;
> +		}
> +	}
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(lrc_attrs); i++) {
> +		if (attr_exists(dir, lrc_attrs[i], O_RDONLY))
> +			lrc_present++;
> +		else
> +			igt_info("GT%u: %s absent (engine class not present on this GT)\n",
> +				 gt, lrc_attrs[i]);
> +	}
> +
> +	igt_assert_f(missing_attr == 0,
> +		     "GT%u: %d unconditional GT debugfs attrs missing (see warnings above)\n",
> +		     gt, missing_attr);
> +	igt_assert_f(lrc_present > 0,
> +		     "GT%u: no default_lrc_* entries found; expected at least one engine\n",
> +		     gt);
> +}
> +
> +static void test_gt_dir_pf_only(unsigned int gt)
> +{
> +	static const char * const attrs[] = {
> +		"hw_engines",
> +		"steering",
> +	};
> +	int dir = gt_dirs[gt];
> +	int missing_attr = 0;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(attrs); i++) {
> +		if (!attr_exists(dir, attrs[i], O_RDONLY)) {
> +			igt_warn("GT%u: missing PF-only attr: %s\n",
> +				 gt, attrs[i]);
> +			missing_attr++;
> +		}
> +	}
> +
> +	igt_assert_f(missing_attr == 0,
> +		     "GT%u: %d missing PF-only GT debugfs attrs (see warnings above)\n",
> +		     gt, missing_attr);
> +}
> +
> +static void test_gt_hw_engines(unsigned int gt)
> +{
> +	/*
> +	 * Read 4 bytes to confirm the attribute returns non-empty output.
> +	 * Content correctness is not currently validated.
> +	 */
> +	char buf[4];
> +
> +	igt_assert_f(igt_sysfs_read(gt_dirs[gt], "hw_engines", buf, sizeof(buf)) > 0,
> +		     "GT%u: hw_engines is empty or unreadable\n", gt);
> +}
> +
> +static void test_gt_steering(unsigned int gt)
> +{
> +	/*
> +	 * Read 4 bytes to confirm the attribute returns non-empty output.
> +	 * Content correctness is not currently validated.
> +	 */
> +	char buf[4];
> +
> +	igt_assert_f(igt_sysfs_read(gt_dirs[gt], "steering", buf, sizeof(buf)) > 0,
> +		     "GT%u: steering is empty or unreadable\n", gt);
> +}
> +
> +static void test_gt_register_save_restore(unsigned int gt)
> +{
> +	/*
> +	 * Read 4 bytes to confirm the attribute returns non-empty output.
> +	 * Content correctness is not currently validated.
> +	 */
> +	char buf[4];
> +
> +	igt_assert_f(igt_sysfs_read(gt_dirs[gt], "register-save-restore",
> +				    buf, sizeof(buf)) > 0,
> +		     "GT%u: register-save-restore is empty or unreadable\n", gt);
> +}
> +
> +static void test_gt_default_lrc(unsigned int gt)
> +{
> +	static const struct {
> +		const char *attr;
> +		const char *engine;
> +	} lrc_attrs[] = {
> +		{ "default_lrc_rcs",  "RCS"  },
> +		{ "default_lrc_ccs",  "CCS"  },
> +		{ "default_lrc_bcs",  "BCS"  },
> +		{ "default_lrc_vcs",  "VCS"  },
> +		{ "default_lrc_vecs", "VECS" },
> +	};
> +
> +	int engines_found = 0;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(lrc_attrs); i++) {
> +		/*
> +		 * Read 4 bytes to confirm the attribute returns non-empty output.
> +		 * Content correctness is not currently validated.
> +		 */
> +		char buf[4];
> +		int ret = igt_sysfs_read(gt_dirs[gt],
> +					 lrc_attrs[i].attr,
> +					 buf, sizeof(buf));
> +
> +		if (ret == -ENOENT) {
> +			igt_info("GT%u: %s absent (no %s engine)\n",
> +				 gt, lrc_attrs[i].attr, lrc_attrs[i].engine);
> +			continue;
> +		}
> +
> +		igt_assert_f(ret > 0,
> +			     "GT%u: %s is empty or unreadable (%d)\n",
> +			     gt, lrc_attrs[i].attr, ret);
> +		igt_debug("GT%u %s: readable\n", gt, lrc_attrs[i].attr);
> +		engines_found++;
> +	}
> +
> +	igt_assert_f(engines_found > 0,
> +		     "GT%u: no default_lrc_* attrs readable; expected at least one engine\n",
> +		     gt);
> +}
> +
> +static void test_gt_hwconfig(unsigned int gt)
> +{
> +	/*
> +	 * Read 4 bytes to confirm the attribute returns non-empty output.
> +	 * Content correctness is not currently validated.
> +	 */
> +	char buf[4];
> +
> +	igt_assert_f(igt_sysfs_read(gt_dirs[gt], "hwconfig", buf, sizeof(buf)) > 0,
> +		     "GT%u: hwconfig is empty or unreadable\n", gt);
> +}
> +
> +static void test_gt_stats_write(unsigned int gt)
> +{
> +	char buf[4096];
> +	int len, wret;
> +
> +	len = igt_sysfs_read(gt_dirs[gt], "stats", buf, sizeof(buf) - 1);
> +	igt_assert_f(len > 0,
> +		     "GT%u: pre-write stats read failed or empty (%d)\n", gt, len);
> +	buf[len] = '\0';
> +	igt_debug("GT%u stats before write:\n%s\n", gt, buf);
> +
> +	/*
> +	 * Write "0" — a valid boolean input that does NOT trigger
> +	 * xe_gt_stats_clear. Confirms the
> +	 * write handler accepts well-formed input without modifying state.
> +	 */
> +	wret = igt_sysfs_write(gt_dirs[gt], "stats", "0", 1);
> +	igt_assert_f(wret > 0,
> +		     "GT%u: stats_write rejected valid input \"0\" (%d)\n",
> +		     gt, wret);
> +
> +	/*
> +	 * Write an invalid payload — the kernel returns -EINVAL for input
> +	 * that cannot be parsed as a boolean, without modifying counter state.
> +	 */
> +	wret = igt_sysfs_write(gt_dirs[gt], "stats", "invalid_key 0\n", 14);
> +	igt_assert_f(wret == -EINVAL,
> +		     "GT%u: stats_write did not reject invalid key with EINVAL (returned %d)\n",
> +		     gt, wret);
> +	igt_debug("GT%u stats_write correctly rejected invalid payload (%d)\n",
> +		  gt, wret);
> +
> +	len = igt_sysfs_read(gt_dirs[gt], "stats", buf, sizeof(buf) - 1);
> +	igt_assert_f(len > 0,
> +		     "GT%u: post-write stats read failed or empty (%d)\n",
> +		     gt, len);
> +	igt_debug("GT%u stats after write attempts: %d bytes\n", gt, len);
> +}
> +
> +int igt_main()
> +{
> +	struct xe_device *xe_dev;
> +	unsigned int gt;
> +	bool is_vf;
> +	int fd = -1;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver_master(DRIVER_XE);
> +		xe_dev = xe_device_get(fd);
> +		igt_assert_f(xe_dev, "Failed to get xe device\n");
> +		is_vf = intel_is_vf_device(fd);
> +
> +		gt_dirs = calloc(xe_dev_max_gt(fd) + 1, sizeof(*gt_dirs));
> +		igt_assert(gt_dirs);
> +		xe_for_each_gt(fd, gt) {
> +			gt_dirs[gt] = igt_debugfs_gt_dir(fd, gt);
> +			igt_assert_f(gt_dirs[gt] >= 0,
> +				     "GT%u: failed to open GT debugfs directory\n",
> +				     gt);
> +		}
> +	}
> +
> +	igt_describe("Check that unconditional GT debugfs attrs accessible from both PF and VF contexts are present for each GT.");
> +	igt_subtest_with_dynamic("gt-dir-vf-safe")
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt-%u", gt)
> +				test_gt_dir_vf_safe(gt);
> +
> +	igt_describe("Check that PF-only GT debugfs attrs are present for each GT on PF.");
> +	igt_subtest_with_dynamic("gt-dir-pf-only") {
> +		igt_skip_on_f(is_vf, "PF-only attributes not present on VF\n");
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt-%u", gt)
> +				test_gt_dir_pf_only(gt);
> +	}
> +
> +	igt_describe("Read hw_engines debugfs attribute for each GT.");
> +	igt_subtest_with_dynamic("gt-hw-engines") {
> +		igt_skip_on_f(is_vf, "hw_engines not present on VF\n");
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt-%u", gt)
> +				test_gt_hw_engines(gt);
> +	}
> +
> +	igt_describe("Read steering debugfs attribute for each GT.");
> +	igt_subtest_with_dynamic("gt-steering") {
> +		igt_skip_on_f(is_vf, "steering not present on VF\n");
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt-%u", gt)
> +				test_gt_steering(gt);
> +	}
> +
> +	igt_describe("Read register-save-restore debugfs attribute for each GT.");
> +	igt_subtest_with_dynamic("gt-register-save-restore")
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt-%u", gt)
> +				test_gt_register_save_restore(gt);
> +
> +	igt_describe("Validate default LRC content for each engine class present on each GT.");
> +	igt_subtest_with_dynamic("gt-default-lrc")
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt-%u", gt)
> +				test_gt_default_lrc(gt);
> +
> +	igt_describe("Read hwconfig debugfs attribute for each GT.");
> +	igt_subtest_with_dynamic("gt-hwconfig")
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt-%u", gt)
> +				test_gt_hwconfig(gt);
> +
> +	igt_describe("Write an invalid payload to the stats debugfs attribute for each GT to verify the kernel rejects malformed input without modifying counter state.  Root only.");
> +	igt_subtest_with_dynamic("gt-stats-write") {
> +		igt_require(geteuid() == 0);
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt-%u", gt)
> +				test_gt_stats_write(gt);
> +	}
> +
> +	igt_fixture() {
> +		xe_for_each_gt(fd, gt)
> +			close(gt_dirs[gt]);
> +		free(gt_dirs);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index d73aaecd9..984a88c21 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -312,6 +312,7 @@ intel_xe_progs = [
>  	'xe_exercise_blt',
>  	'xe_fault_injection',
>  	'xe_gpgpu_fill',
> +        'xe_gt_debugfs',
>  	'xe_gt_freq',
>  	'xe_huc_copy',
>  	'xe_intel_bb',
> -- 
> 2.43.0
> 
