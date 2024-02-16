Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA312C48BF8
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 23:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DD110ECF2;
	Fri, 16 Feb 2024 23:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lj5zpgf5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF6410ECE9
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2024 23:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708125431; x=1739661431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TTtvY+85kidKio6i9bja2aMZXpUEYnZqK5KoAEU576s=;
 b=Lj5zpgf5qJOkKeJ/0Mr0BcIxy5Nq5LdDhgY7c+9RQiZwC3W6tsFhNKk5
 j8Kccc5L0ES3Lx3Mpl+xEdWjVN+/u/UBTcOzC/yf3C9gRATegQDxIO9O2
 V1Cuc6Llhy8bLj+qOiyGVGcBkdtSQZeC53Bina7YExFmc6unsLDW0Gt8V
 Ky2fEgrbCJRIJlBsRlMEOk6WzLdtDx4u5d35yKeHnFSV8OFdPrPoD7Xir
 /xoW7hz0OUpmUMJuLlmiR/NmvK57tzq/6H4JgabCQfnKUuvtOfkaWC59V
 KLAcYosSknB7zIDv2ocyqx7EFXp4LV5BHtILg5oMRs6M2Wn2+9c/DAgkW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="27724272"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; d="scan'208";a="27724272"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8626846"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:08 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 00/18] Intel Xe OA IGT's
Date: Fri, 16 Feb 2024 15:16:45 -0800
Message-ID: <20240216231703.845644-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
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

This series adds OA IGT's for Intel Xe KMD. These tests are for the kernel
series posted here:

https://patchwork.freedesktop.org/series/121084/

This series is also available at:

https://gitlab.freedesktop.org/adixit/igt-gpu-tools/-/tree/xe-oa.prep

Only LNL support is included in this series. Xe1 support has not been
included because Metrics XML's for those platforms are large and cannot be
sent over mail.

The complete series, with Xe1 support, is available here:

https://gitlab.freedesktop.org/adixit/igt-gpu-tools/-/tree/xe-oa

Ashutosh Dixit (18):
  lib/xe/oa: Import OA metric generation files from i915
  lib/xe/oa: Add LNL metric guids
  lib/xe/oa: Add OA LNL metrics (oa_lnl.xml)
  lib/xe/oa: Generate LNL metrics/registers files
  drm-uapi/xe: Sync with Perf/OA changes
  lib/xe: Complete xe_oa lib changes
  tests/intel/xe_query: Add OA units query test
  tests/intel/xe_oa: Add first tests
  tests/intel/xe_oa: Add some negative tests
  tests/intel/xe_oa: Add "oa-formats" subtest
  tests/intel/xe_oa: Add oa exponent tests
  tests/intel/xe_oa: buffer-fill, non-zero-reason, enable-disable
  tests/intel/xe_oa: blocking and polling tests
  tests/intel/xe_oa: OAR/OAC tests
  tests/intel/xe_oa: Exclusive/concurrent access, rc6 and stress open
    close
  tests/intel/xe_oa: add remove OA config tests
  tests/intel/xe_oa: OA buffer mmap tests
  tests/intel/xe_oa: Register whitelisting and MMIO trigger tests

 include/drm-uapi/xe_drm.h                 |  321 +-
 lib/intel_device_info.c                   |    1 +
 lib/meson.build                           |   74 +
 lib/xe/oa-configs/README.md               |  115 +
 lib/xe/oa-configs/codegen.py              |  444 ++
 lib/xe/oa-configs/guids.xml               | 2763 ++++++++++++
 lib/xe/oa-configs/mdapi-xml-convert.py    | 1221 +++++
 lib/xe/oa-configs/oa-equations-codegen.py |  261 ++
 lib/xe/oa-configs/oa-lnl.xml              | 2799 ++++++++++++
 lib/xe/oa-configs/oa-metricset-codegen.py |  304 ++
 lib/xe/oa-configs/oa-registers-codegen.py |  118 +
 lib/xe/oa-configs/oa_guid_registry.py     |  131 +
 lib/xe/oa-configs/update-guids.py         |  223 +
 lib/xe/xe_oa.c                            |  699 +++
 lib/xe/xe_oa.h                            |  328 ++
 lib/xe/xe_query.c                         |   38 +
 lib/xe/xe_query.h                         |    5 +
 tests/intel/xe_oa.c                       | 4924 +++++++++++++++++++++
 tests/intel/xe_query.c                    |   53 +
 tests/meson.build                         |    2 +
 20 files changed, 14823 insertions(+), 1 deletion(-)
 create mode 100644 lib/xe/oa-configs/README.md
 create mode 100644 lib/xe/oa-configs/codegen.py
 create mode 100644 lib/xe/oa-configs/guids.xml
 create mode 100755 lib/xe/oa-configs/mdapi-xml-convert.py
 create mode 100644 lib/xe/oa-configs/oa-equations-codegen.py
 create mode 100644 lib/xe/oa-configs/oa-lnl.xml
 create mode 100644 lib/xe/oa-configs/oa-metricset-codegen.py
 create mode 100644 lib/xe/oa-configs/oa-registers-codegen.py
 create mode 100644 lib/xe/oa-configs/oa_guid_registry.py
 create mode 100755 lib/xe/oa-configs/update-guids.py
 create mode 100644 lib/xe/xe_oa.c
 create mode 100644 lib/xe/xe_oa.h
 create mode 100644 tests/intel/xe_oa.c

-- 
2.41.0

