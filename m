Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05889C83F09
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 16:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC9110E6C1;
	Tue,  8 Jul 2025 16:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aL1MEFw5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4712589C05
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 16:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751993872; x=1783529872;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Sv6cJMd0EI3JzVvAh4nMHvO5FVQog8kwRgnaD4JyD5c=;
 b=aL1MEFw58W7ofAdwSFekiMNHLHg8ISRlTPdGKigFbNumQAyDkmMUb9R9
 vD+d7gLP+zH9l/cC47rBjAD+zd/dLJ9Wf3ZRDFjWl5WwvSB05w6G8HvEo
 RnzX+VmZg9abfFkoA1xpvmdDwMHQN3H5L9xogMFpmVi90abbjeW4mP3Fy
 /Ww4hrCE9khYoJh+gHv14ejSkgD384IN5D3JKoT6pV4Or6NIRdqs5cu0t
 OkIwG2x/6sqLp3+JmGWFGpDRu6XJFV6lbV8BSjiin/f4Q3KDQOSQMncxE
 DTpJHdg4t3BBoU52sYgZqjs8qeUx2zsZI2GsYQhaoQ5yQqXq0CMjTyoAJ Q==;
X-CSE-ConnectionGUID: XBLwFSkcRxiwIlv5Q1ncWg==
X-CSE-MsgGUID: 2Q0VJ1wiRuSTNNRtXF7vxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65301779"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="65301779"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 09:57:52 -0700
X-CSE-ConnectionGUID: N6VaGM9eRNWo4thIWz6ARg==
X-CSE-MsgGUID: m+jIuXiaTgSVSNST2TBwJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="160081438"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 09:57:50 -0700
Date: Tue, 8 Jul 2025 18:57:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com
Subject: Re: [PATCH v5,resend i-g-t 4/6] tests: Add core_sysfs
Message-ID: <20250708165734.n6473k3uqp77xxhi@kamilkon-DESK.igk.intel.com>
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

Why not just drm_open_driver()?

> +		sysfs = igt_sysfs_open(fd);
> +		igt_require(sysfs >= 0);
> +
> +		kmstest_set_vt_graphics_mode();

Why KMS-related stuff here?

Same questions for core_debugfs where there are also
those calls in fixture.

Regards,
Kamil

> +	}
> +
> +	igt_describe("Read all entries from sysfs path.");
> +	igt_subtest("read-all-entries") {
> +		igt_dir_process_files_simple(sysfs);
> +	}
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
