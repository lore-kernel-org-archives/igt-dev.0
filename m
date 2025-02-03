Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9A9C02193
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 07:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBFB10E3EB;
	Mon,  3 Feb 2025 07:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKJLPCn+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FB710E3EB
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 07:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738569427; x=1770105427;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CpPa/q2xklyVNp+znZH8CIGtx4gOEOYlRzWllKa39Nk=;
 b=bKJLPCn+1xOXofFT5OxsT4k7RZ0OsB2h27zZ4bOtGTGypU6+0WT+xOtG
 XQDlXkDEcQqMDRJaohqXugvKKAc9n69Eg8w4Jc1td7wVt3NUXSqsJqSz+
 e0r0X3baWywUFCRru8euz65dy1fR8oxX1rQlMDXdsh8h7bSBbV7qc655e
 yKSMsjMWu7EyS9ay4x8V05TiY4hKoIud3XbAaAzHPnK1ZpZIODTNyyvrp
 HmQlRCcnBiQ7Lu7hYYaHOp6r7lmPs2OYzDSIBV6cUtulJFVZt8sJk5hWm
 1vHt4VT5ojkQ/81l/z70Kd5ddUMtWXntvLe2os3cdX6Nqil5hHbJIGjW5 g==;
X-CSE-ConnectionGUID: A15VKuiTSd2Ca//1QrB64Q==
X-CSE-MsgGUID: RhUvVi3STcO3+Ue+D/aoyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49652701"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49652701"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 23:57:07 -0800
X-CSE-ConnectionGUID: PLRUDuaqRGaX7IMiUYIcaA==
X-CSE-MsgGUID: rESV3LFrTiS4ZRwpF4PxXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110786360"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 23:57:05 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/5] add test to validate uhbr/non-uhbr over sst/mst
Date: Mon,  3 Feb 2025 13:42:36 +0530
Message-Id: <20250203081241.659139-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add new test subtests kms_dp_linktraining to validate both
UHBR and non-UHBR link rates over SST and MST configurations.
Add four new subtests (uhbr-sst, uhbr-mst, non-uhbr-sst, non-uhbr-mst)
to check if the link rates match the expected UHBR or NON-UHBR capability
and whether the outputs are MST or SST.

Kunal Joshi (5):
  tests/intel/kms_joiner_helper: add helper for joiner-related functions
  tests/intel/kms_mst_helper: add helper for MST-related functions
  lib/igt_kms: add function to set link params
  tests/intel/kms_dp_linktraining: add tests for UHBR/NON-UHBR over
    SST/MST
  HAX: DO NOT MERGE

 lib/igt_kms.c                            |  33 ++
 lib/igt_kms.h                            |   2 +
 tests/intel-ci/fast-feedback.testlist    |  14 +
 tests/intel-ci/xe-fast-feedback.testlist |  14 +
 tests/intel/kms_dp_linktrain_fallback.c  |  28 +-
 tests/intel/kms_dp_linktraining.c        | 372 +++++++++++++++++++++++
 tests/intel/kms_joiner.c                 |  15 +-
 tests/intel/kms_joiner_helper.c          | 176 +++++++++++
 tests/intel/kms_joiner_helper.h          |  15 +
 tests/intel/kms_mst_helper.c             |  48 +++
 tests/intel/kms_mst_helper.h             |  10 +
 tests/meson.build                        |   6 +
 12 files changed, 696 insertions(+), 37 deletions(-)
 create mode 100644 tests/intel/kms_dp_linktraining.c
 create mode 100644 tests/intel/kms_joiner_helper.c
 create mode 100644 tests/intel/kms_joiner_helper.h
 create mode 100644 tests/intel/kms_mst_helper.c
 create mode 100644 tests/intel/kms_mst_helper.h

-- 
2.25.1

