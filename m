Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFE1C83F0A
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 17:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A6510E6B5;
	Tue,  8 Jul 2025 17:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d46kajWs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB88E10E6B5
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 17:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751994092; x=1783530092;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=616DmsNbfoswBMG8DQnfwJg5GMzqzXdDY6fEzwr+wuA=;
 b=d46kajWsernILKyQ9LPU7IfhjhGjmrcoOOv4+7uTxZkZhi68iiN3JsfC
 Klim5TiRFRDzUZRrdi5cc5oEg7e3SvUx53N+oGAjDTcTQTPD1cPOOlYYv
 a78E0KJzErDDvovUlCQUlOUUOxov9FIWC34v4lc99MSXPTvBhWh4yfxfc
 B3faQQSWOMFuEmdudAN2txWfuL3bYvtgYR2nT7b0VbnVed7AbRJO1popU
 vprWtvX7Crs/o+vwjadEFidOJaO0CMcSIDqHTQTVPFEJtLGSJppbmxcY1
 mwKuudVDEeZR0K+9oDiNIzTP78P/Xds3f8yLafqfVdAUt8Er54YoC0gIl A==;
X-CSE-ConnectionGUID: bRlQ5tQdQf6ROjgfGlAYPg==
X-CSE-MsgGUID: /N8W95buTGuHVb8Jik1DfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54370810"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="54370810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 10:01:31 -0700
X-CSE-ConnectionGUID: XjVyF434QDybcYBGLs8mOA==
X-CSE-MsgGUID: +3xEBkBdQ3y27S1BCBCbqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="159866118"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 10:01:29 -0700
Date: Tue, 8 Jul 2025 19:01:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com, ewelina.musial@intel.com
Subject: Re: [PATCH v5,resend i-g-t 0/6] Replace intel_sysfs_debugfs
Message-ID: <20250708170127.dkvxow3s43gtd2dc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com, ewelina.musial@intel.com
References: <20250708144039.53482-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708144039.53482-1-peter.senna@linux.intel.com>
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
On 2025-07-08 at 16:40:32 +0200, Peter Senna Tschudin wrote:
> This series:
>  - moves shared function to lib/igt_dir
>  - creates gpu agnostic tests
>    - core_debugfs
>    - core_sysfs
>    - kms_debugfs
>  - creates xe_debugfs (complementary to core_debugfs and kms_debugfs)
>  - Updates testlists and scripts
>  - deletes tests/intel_sysfs_debugfs
> 

Please provide here simple and short summary what changed,
also a reason for quick resend, why do you need it instead
of a new version? Maybe not now but when (and if) you will
send new versions.

Regards,
Kamil

> Cc: lucas.demarchi@intel.com
> Cc: rodrigo.vivi@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: katarzyna.piecielska@intel.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: michal.wajdeczko@intel.com
> Cc: karthik.b.s@intel.com
> Cc: ewelina.musial@intel.com
> 
> Peter Senna Tschudin (6):
>   lib/igt_dir: Directory processing and flexible file handling
>   tests: Add core_debugfs
>   tests: Add kms_debugfs
>   tests: Add core_sysfs
>   tests: Add xe_debugfs
>   tests/intel: Remove intel_sysfs_debugfs
> 
>  docs/code_coverage.md                    |  18 +-
>  lib/igt_dir.c                            | 287 +++++++++++++++
>  lib/igt_dir.h                            |  62 ++++
>  lib/meson.build                          |   1 +
>  scripts/code_cov_selftest.sh             |   2 +-
>  tests/core_debugfs.c                     |  48 +++
>  tests/core_sysfs.c                       |  49 +++
>  tests/intel-ci/fast-feedback.testlist    |   4 +-
>  tests/intel-ci/xe-fast-feedback.testlist |   8 +-
>  tests/intel/intel_sysfs_debugfs.c        | 430 -----------------------
>  tests/intel/xe_debugfs.c                 | 208 +++++++++++
>  tests/intel/xe_test_config.json          |   2 +-
>  tests/kms_debugfs.c                      | 151 ++++++++
>  tests/meson.build                        |   5 +-
>  14 files changed, 827 insertions(+), 448 deletions(-)
>  create mode 100644 lib/igt_dir.c
>  create mode 100644 lib/igt_dir.h
>  create mode 100644 tests/core_debugfs.c
>  create mode 100644 tests/core_sysfs.c
>  delete mode 100644 tests/intel/intel_sysfs_debugfs.c
>  create mode 100644 tests/intel/xe_debugfs.c
>  create mode 100644 tests/kms_debugfs.c
> 
> -- 
> 2.43.0
> 
