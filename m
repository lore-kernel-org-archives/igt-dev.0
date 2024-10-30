Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A185BD6B6C4
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 19:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5600A10E7F5;
	Wed, 30 Oct 2024 19:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CvMmYo0Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F1910E7F5
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 19:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730316998; x=1761852998;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/JkXB1b9aFigmPcyjzpNJOTS0XJQUK/GxskjgIyCbic=;
 b=CvMmYo0ZzoS1pRSxOljzQA4GwakOEZhgexu7W8UekvS9JULiGZLSnsNv
 zU7s1eBPtc/BDBjzAh/BfKJbPy4JQR0pvK9i8eg2jr1AiXavSuYHjvnwi
 W+M1mXk8HFIxsbTbPeCnmcTjuKlRIzTaMVIjnP2NIqIJ9brDinjSCn61M
 HVFtONUJLuIqRe9tkLEPV0ZCbgVUfoMq3V3iDUvCYOGDRsXUQ9yHkvWRT
 qrxrHnPhu8PzSxeQUzvnF4NC4+ACntyzH0d3pF3uCp8z1vJLhtnSzxFCm
 2w2NwUU8oLAVbM262s0ZRSzNzajGNx7Ai8srX1biZDRCLOpiNRRmC6fVB Q==;
X-CSE-ConnectionGUID: q20TahpgTwCjV4Tz01czJw==
X-CSE-MsgGUID: BlLsiOoOSH+mZ43odqetsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47499943"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47499943"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 12:36:38 -0700
X-CSE-ConnectionGUID: rSXkwtxVTAGcwDhYQ3lOug==
X-CSE-MsgGUID: ioCXaQAbS/SPkvC8vTd9mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="82578414"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.84.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 12:36:35 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, narasimha.c.v@intel.com,
 piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/5] Add debugfs SR-IOV helpers; Improve clear-lmem check
Date: Wed, 30 Oct 2024 20:36:24 +0100
Message-Id: <20241030193629.1238637-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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

This patch series introduces SR-IOV debugfs and provisioning helpers
to allow enhance test coverage.

The following changes are included:

1. Add helper for opening SR-IOV debugfs attributes:
   Helper allows to open SR-IOV debugfs attributes corresponding to
   specified PF device, VF number, and GT number.

2. Define shared resource types and provisioned range structure:
   Add shared resource enumeration, provisioned range structure definition,
   and provide a function to convert shared resource enums to their string
   representation.

3. Add function to read provisioned ranges from debugfs:
   Implement xe_sriov_pf_debugfs_read_provisioned_ranges() to read and
   parse VFs provisioned shared resource ranges from the debug filesystem.
   Introduce xe_sriov_debugfs_provisioned_attr_name() to get the debugfs
   attribute name for a given shared resource type.

4. Improved clear-lmem subcheck in xe_sriov_flr test:
   Read and verify full LMEM ranges using the lmem_provisioned debugfs
   attribute in the clear-lmem subcheck.

5. Extract the function to search for GGTT provisioned PTE ranges for each
   VF from test/xe_sriov_flr to a library file lib/xe/xe_sriov_provisioning.
   This refactoring improves code reusability and will allow to prepare a
   test comparing debugfs exposed ggtt_provisioned attribute.

Lukasz Laguna (1):
  lib/xe_sriov_debugfs: add helper for opening attributes

Marcin Bernatowicz (4):
  lib/xe/xe_sriov_provisioning: Define resource types and provisioned
    range structure
  lib/xe/xe_sriov_debugfs: Add function to read provisioned ranges
  tests/intel/xe_sriov_flr: Verify full LMEM range
  lib/xe/xe_sriov_provisioning: Extract function to search provisioned
    PTE ranges

 lib/meson.build                |   2 +
 lib/xe/xe_sriov_debugfs.c      | 206 +++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_debugfs.h      |  20 ++++
 lib/xe/xe_sriov_provisioning.c | 124 ++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h |  50 ++++++++
 tests/intel/xe_sriov_flr.c     | 189 ++++++++++++++----------------
 6 files changed, 488 insertions(+), 103 deletions(-)
 create mode 100644 lib/xe/xe_sriov_debugfs.c
 create mode 100644 lib/xe/xe_sriov_debugfs.h
 create mode 100644 lib/xe/xe_sriov_provisioning.c
 create mode 100644 lib/xe/xe_sriov_provisioning.h

-- 
2.31.1

