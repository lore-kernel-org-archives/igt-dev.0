Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CE3C83F1D
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 09:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0094A10E05A;
	Thu, 10 Jul 2025 09:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bz+BdtAk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBE210E05A
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 09:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752140497; x=1783676497;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sarOhvYqbrVLuiMkcLwLklPHOIZVp3Lcb5mPaAEJ8Do=;
 b=bz+BdtAknJuDv/nkWPs8C9D/D2Ffst7WVFXUNhiMBoKRTLqh5GUdGWMK
 MyqYluEV31QDnNqTr3Q7Gbb1daReFPSp1g7IODzifeWBiqbeJhDuvWKsX
 KTQmI+3+bjoyRoa1x7nzkFdW7COFZrTe7LVw++AzpnrLhB9yi5mF+bb6n
 ISB9XXwl+uWw8BatOYJQjbm/i0gn2PB4KY9l0NJ7UL2xIpPEQTumk8Pen
 /WM8tZbI/Xu+zx/yXhhP2lbnKpg6fyEaxdLAIikiZ+RJCfz+jqunvoBYA
 kwuyYqpeHwa0IRzhwDa4KHoU8Zs5Qu4MsZhiOClDYau5KWcss3nsrcdGk A==;
X-CSE-ConnectionGUID: aLvq+gXKQGmtMzgq+xLdEA==
X-CSE-MsgGUID: Jo1ANvqPTEq3tXLAjhE3Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65114820"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="65114820"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 02:41:37 -0700
X-CSE-ConnectionGUID: /GpmJYZMTJqB3iEpFnESMQ==
X-CSE-MsgGUID: AaZTOdiGQt6yaTogi/OSHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160313843"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 02:41:35 -0700
Date: Thu, 10 Jul 2025 11:41:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com
Subject: Re: [PATCH v5,resend i-g-t 4/6] tests: Add core_sysfs
Message-ID: <20250710094132.nilml7cpqh46qbhs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com
References: <20250708144039.53482-1-peter.senna@linux.intel.com>
 <20250708144039.53482-5-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250708144039.53482-5-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-07-08 at 16:40:36 +0200, Peter Senna Tschudin wrote:
> core_sysfs is GPU-agnostic test designed to work with any GPU, not
> limited to i915 and Xe. The test scans the sysfs directory associated
> with the GPU, reads all files, and discards the content.
> 
> Cc: lucas.demarchi@intel.com
> Cc: rodrigo.vivi@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: katarzyna.piecielska@intel.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: michal.wajdeczko@intel.com
> Cc: karthik.b.s@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
> v5:
>  - use igt_dir_process_files_simple()
> v4:
>  - unchanged from v3
> v3:
>  - removed "sysfs" from the name of subtest (Thanks Michal Wajdeczko)
> v2:
>  - changed style of comparison to NULL
> 
>  tests/core_sysfs.c                       | 49 ++++++++++++++++++++++++
>  tests/intel-ci/fast-feedback.testlist    |  1 +
>  tests/intel-ci/xe-fast-feedback.testlist |  1 +
>  tests/meson.build                        |  1 +
>  4 files changed, 52 insertions(+)
>  create mode 100644 tests/core_sysfs.c
> 
> diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
> new file mode 100644
> index 000000000..5ac3ed901
> --- /dev/null
> +++ b/tests/core_sysfs.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_dir.h"
> +#include "igt_sysfs.h"
> +
> +/**
> + * TEST: sysfs test
> + * Description: Read entries from sysfs path.
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: sysfs
> + * Feature: core
> + * Test category: uapi
> + *
> + * SUBTEST: read-all-entries
> + * Description: Read all entries from sysfs path
> + *
> + */
> +
> +IGT_TEST_DESCRIPTION("Read entries from sysfs paths.");
> +
> +igt_main
> +{
> +	int fd = -1;
> +	int sysfs = -1;
> +
> +	igt_fixture {
> +		fd = drm_open_driver_master(DRIVER_ANY);
> +		sysfs = igt_sysfs_open(fd);
> +		igt_require(sysfs >= 0);
> +
> +		kmstest_set_vt_graphics_mode();
> +	}
> +
> +	igt_describe("Read all entries from sysfs path.");
> +	igt_subtest("read-all-entries") {
> +		igt_dir_process_files_simple(sysfs);
> +	}

Please remove braces here, they are not needed, so:
	igt_subtest("read-all-entries")
		igt_dir_process_files_simple(sysfs);

With this fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +
> +	igt_fixture {
> +		close(sysfs);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 3ec1b95cf..5d4d101ef 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -4,6 +4,7 @@ igt@i915_module_load@load
>  # Keep alphabetically sorted by default
>  igt@core_auth@basic-auth
>  igt@core_debugfs@read-all-entries
> +igt@core_sysfs@read-all-entries
>  igt@fbdev@eof
>  igt@fbdev@info
>  igt@fbdev@nullptr
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index ac3177ae9..a5f799f6b 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -8,6 +8,7 @@ igt@fbdev@read
>  igt@fbdev@write
>  
>  igt@core_debugfs@read-all-entries
> +igt@core_sysfs@read-all-entries
>  igt@intel_sysfs_debugfs@xe-base
>  igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries
>  igt@intel_sysfs_debugfs@xe-forcewake
> diff --git a/tests/meson.build b/tests/meson.build
> index 1009bef2e..4976f2d91 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -7,6 +7,7 @@ test_progs = [
>  	'core_hotunplug',
>  	'core_setmaster',
>  	'core_setmaster_vs_auth',
> +	'core_sysfs',
>  	'dmabuf',
>  	'dmabuf_sync_file',
>  	'device_reset',
> -- 
> 2.43.0
> 
