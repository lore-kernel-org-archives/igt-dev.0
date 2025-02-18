Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B6BC021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 21:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252D610E77F;
	Tue, 18 Feb 2025 21:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XaqggZna";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC0410E780
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 21:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739915646; x=1771451646;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wpbTNMXhGBD/CqFw1UQRE9oH7FnuRJMnN8yPOedacBM=;
 b=XaqggZnayEA6ySlahzkcdEq5myEhnCWxW0o8ezpT9yOTXqvvURSF+NlF
 OglI73EsWQVlPaJxLyGfVHBSdq7kWBeD5YUQnb6QAsIQetkQFCIxl/+M9
 t2Bkll/n/1F9eyWZBs+mq+jaJIR38aC0mY27oLxnezng4ZwdPmroDm2It
 YKiLDNHuZmoF5WQSLqy4ge7uhqmaCucaDKvZtnGkrIq0uJesA605mQD5v
 7ayQqQqQivkaVZGwcp/R/oGP5TrUdZDxlU7ws70qbs5FpAniCOJuwBk1k
 1G3vXReKKbwTsstLrNHrpX2erlNnFzZa+UVnKQcTSk2iHQ/raLapwphkv g==;
X-CSE-ConnectionGUID: ZjHN76TiTpW/+FojlPeWZA==
X-CSE-MsgGUID: utePCvkaRKuGBgCWBycqaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="58170172"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="58170172"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 13:54:05 -0800
X-CSE-ConnectionGUID: 7g6FdZpVQ8u0I3bwz+Q4fQ==
X-CSE-MsgGUID: M5eS0TB4SNC0eUAmh4SYgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="119465897"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 13:54:04 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, swati2.sharma@intel.com,
 santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 0/5] Update image assets
Date: Wed, 19 Feb 2025 03:23:44 +0530
Message-ID: <20250218215349.1063788-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Update image assets and improve file handling.

Naladala Ramanaidu (5):
  data: Move PNG images to new data directory
  runner/settings: Constify absolute_path parameter
  runner/settings: Add function to set IGT_DATA_PATH environment
    variable
  lib/igt_core: Enhance __igt_fopen_data to support additional
    directories
  HAX patch do not merge

 {tests => data}/1080p-left.png           | Bin
 {tests => data}/1080p-right.png          | Bin
 data/meson.build                         |  11 +
 {tests => data}/pass.png                 | Bin
 lib/igt_core.c                           |  31 ++-
 lib/igt_core.h                           |   6 +-
 lib/meson.build                          |   1 +
 meson.build                              |   2 +
 runner/settings.c                        |  15 +-
 runner/settings.h                        |   3 +-
 tests/intel-ci/fast-feedback.testlist    | 168 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 273 +----------------------
 tests/meson.build                        |   7 -
 13 files changed, 50 insertions(+), 467 deletions(-)
 rename {tests => data}/1080p-left.png (100%)
 rename {tests => data}/1080p-right.png (100%)
 create mode 100644 data/meson.build
 rename {tests => data}/pass.png (100%)

-- 
2.43.0

