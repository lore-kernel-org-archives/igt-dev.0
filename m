Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4993C83F0F
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 09:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7506210E169;
	Tue,  8 Jul 2025 09:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCK0qg+T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083FE10E169
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 09:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751965770; x=1783501770;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sTxFYeBvEjMqDre/4rKHdDYSuhXqHCutFfzX/dvy1zU=;
 b=XCK0qg+T4X8Oueq87bsmTtfp3J9yWBB3CubeveP1sbITnfw08+trdeCj
 wDV4jpFVlQeNFd+ZAWNh5OJCU9chwuWJa24JSFI2gF/4Zp2TDjjyfWFat
 DIUhQhrc0dErSXXHJjReDAMgVHf+tH3eda9bELPhm1ROGkvexdJLbLJjU
 2vX5Anipki/iV7k4VJvw8uj4G3Ddh7vzd3BKVGnBPy3hUhdXIkSUX7tFd
 CU5ICMYMYbNLzTjsmdiVHKYCEbvG/gDFMv5+Vc2dHGn+q9sPCKE8bBr1y
 u+VVYNkh5Gsjb/bF85eOps2Bo2mdX7klueftPdSMjq6zpgA4+KFf6uMaP A==;
X-CSE-ConnectionGUID: AlGtaCUBSg2BQGOYmMJtuA==
X-CSE-MsgGUID: Jh20zMeZRSOobs7I0+Gsdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54291568"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="54291568"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 02:09:27 -0700
X-CSE-ConnectionGUID: TxHFkU9uRw+WIssPTI5t1Q==
X-CSE-MsgGUID: tu1DH02JS7i1JfD6NXxjng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="155534504"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 02:09:25 -0700
Message-ID: <513a8da8-fe2d-488d-9ba5-a063a8ab6f91@linux.intel.com>
Date: Tue, 8 Jul 2025 11:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 i-g-t 4/6] tests: Add core_sysfs
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com
References: <20250707210726.55334-1-peter.senna@linux.intel.com>
 <20250707210726.55334-5-peter.senna@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250707210726.55334-5-peter.senna@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 7/7/2025 11:07 PM, Peter Senna Tschudin wrote:
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
> v4:
>  - unchanged from v3
> v3:
>  - removed "sysfs" from the name of subtest (Thanks Michal Wajdeczko)
> v2:
>  - changed style of comparison to NULL
> 
>  tests/core_sysfs.c                       | 58 ++++++++++++++++++++++++
>  tests/intel-ci/fast-feedback.testlist    |  1 +
>  tests/intel-ci/xe-fast-feedback.testlist |  1 +
>  tests/meson.build                        |  1 +
>  4 files changed, 61 insertions(+)
>  create mode 100644 tests/core_sysfs.c
> 
> diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
> new file mode 100644
> index 000000000..db70e940b
> --- /dev/null
> +++ b/tests/core_sysfs.c
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_dir.h"
> +#include "igt_sysfs.h"
> +
> +struct {
> +	bool warn_on_not_hit;
> +} opt = { 0 };

This is unneeded. Will remove.

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
> +	igt_dir_t *igt_dir = NULL;
> +
> +	igt_fixture {
> +		fd = drm_open_driver_master(DRIVER_ANY);
> +		sysfs = igt_sysfs_open(fd);
> +		igt_require(sysfs >= 0);
> +
> +		igt_dir = igt_dir_create(sysfs);
> +		igt_require(igt_dir);
> +
> +		kmstest_set_vt_graphics_mode();
> +	}
> +
> +	igt_describe("Read all entries from sysfs path.");
> +	igt_subtest("read-all-entries") {
> +		igt_dir_scan_dirfd(igt_dir, -1);
> +		igt_dir_process_files(igt_dir, NULL, NULL);
> +	}
> +
> +	igt_fixture {
Missing a call to igt_dir_destroy(igt_dir) here

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

