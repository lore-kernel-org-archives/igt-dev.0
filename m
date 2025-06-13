Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3CAC71136
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 13:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909B010E028;
	Fri, 13 Jun 2025 13:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ez2YRawg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606AB10E028
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 13:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749822591; x=1781358591;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZT5Qh4v3dJkYyl5mFkhzD6e7B9CZVxhqt7QbJVkvkms=;
 b=ez2YRawgVnHeuDrv/6z436wATpVOE50RnEZ5F5X9QCWHPoghPxwp6ubB
 A+or0MmKVUuo/hu3JOyoTHjfZm7uOgH7VsRAWA3MGHHZ3OE/gtrKHCX6h
 YSY4nal9HWnH5yBBueqHu56nkN8Jru8lcxp1Mn9F1VjL1VZta+d4cxxX4
 SrfJx9Dq1xUpmWtLDqtsYAg5RC5hQgPuqdb+/dtARtKcts7818VkeULoF
 Fx1LpJISMd0bwa2TPR3KjrihsvxvTuXqGn5LKHCTDcaTp+Du0ZcLNdNw3
 Iouv2zF+wTX62xmcHqel39tg7J+g9/NcrZhG9UKav6kVAJkvC21+jPWPR w==;
X-CSE-ConnectionGUID: 5REktVaSRaOrKj0ngEjFEg==
X-CSE-MsgGUID: mL77fuSBSZKP8CR2bX8hcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55711098"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="55711098"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 06:49:51 -0700
X-CSE-ConnectionGUID: giRWF8blTqqqxyfWeHESlQ==
X-CSE-MsgGUID: +Xs5Hck1QAuUV7NtL3EORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="152803730"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 13 Jun 2025 06:49:50 -0700
Received: from [10.245.96.176] (unknown [10.245.96.176])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1E6AB33EA0;
 Fri, 13 Jun 2025 14:49:44 +0100 (IST)
Message-ID: <1f504373-8b2f-4889-926f-10c56e9e31ad@intel.com>
Date: Fri, 13 Jun 2025 15:49:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 2/6] tests: Add core_debugfs
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 ewelina.musial@intel.com
References: <20250613105146.106581-1-peter.senna@linux.intel.com>
 <20250613105146.106581-3-peter.senna@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250613105146.106581-3-peter.senna@linux.intel.com>
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

Hi,

some drive-by comments...

On 13.06.2025 12:51, Peter Senna Tschudin wrote:
> Introduce core_debugfs that is expected to work with any GPU, not
> limited to i915 and Xe. The test attempts to open every file in debugfs
> associated with the GPU.
> 

...

> --- /dev/null
> +++ b/tests/core_debugfs.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_debugfs.h"
> +#include "igt_dir.h"
> +
> +/**
> + * TEST: debugfs test
> + * Description: Read entries from debugfs
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: debugfs
> + * Feature: core
> + * Test category: uapi
> + *
> + * SUBTEST: debugfs-read-all-entries
> + * Description: Read all entries from debugfs path validating debugfs entries
> + */
> +
> +IGT_TEST_DESCRIPTION("Read entries from debugfs");
> +
> +igt_main
> +{
> +	int debugfs = -1;
> +	int fd = -1;
> +	igt_dir_t *igt_dir = NULL;
> +
> +	igt_fixture {
> +		fd = drm_open_driver_master(DRIVER_ANY);
> +		debugfs = igt_debugfs_dir(fd);
> +		igt_require(debugfs >= 0);
> +
> +		igt_dir = igt_dir_create(debugfs);
> +		igt_require(igt_dir);
> +
> +		kmstest_set_vt_graphics_mode();
> +	}
> +
> +	igt_describe("Read all entries from debugfs path.");
> +	igt_subtest("debugfs-read-all-entries") {

since this test is named "core_debugfs" then there is no need to repeat
"debugfs" in the subtest/case name, and this could be just:

	igt@core_debugfs@read-all-entries


> +		igt_dir_scan_dirfd(igt_dir, -1);
> +		igt_dir_process_files(igt_dir, NULL, NULL);
> +	}
> +
> +	igt_fixture {
> +		igt_dir_destroy(igt_dir);
> +		close(debugfs);
> +		drm_close_driver(fd);
> +	}
> +}
