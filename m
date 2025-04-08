Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D86C369A2
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 17:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355F210E1DC;
	Tue,  8 Apr 2025 17:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5B4SpOB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2570E10E1DC
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 17:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744131852; x=1775667852;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZNzCXFMZP5+rinG9tZZlWTUKXonZNdvNaMAL+Ua/qNA=;
 b=C5B4SpOBvvfDexb91DH71yTYjGTYlfwgft6DFdaBvvf8Yh+sBpsrbCVt
 zz99kUpfTW2DOFhRFciKSBBVPiaZ/mqso79I6kwsaSElsSaLhZ1OhexIe
 Y1X8rJbW+5cjfWgo+qmusDzR0beIh64rfjuZ7Wcw9PYgqr/qTAyVSTzW5
 cFwsmuPBWOGGBJSozyha/ozHqyvhQbWZQBpDb91GiqMZyhm9H1mEXEwzV
 s+e6kOXLUuKGxx+GVuJZEqNFb7KLAWBQN2NCDfrsd+qLyb9uFQSLCcisH
 NOXlsFBBC6hvlSh7KWeBt+LTkfXAx0EEDPBaSBAkloGuV7WbVWqr6XQSR w==;
X-CSE-ConnectionGUID: xhLQwBcxTROqmlGJSO2Lkw==
X-CSE-MsgGUID: 8s6CnpQoT8KqvHmUaHCIDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45742018"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45742018"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 10:03:50 -0700
X-CSE-ConnectionGUID: 1/OX7nyUSwiD0HgbY2rPUg==
X-CSE-MsgGUID: HypOxMcMRaqJXfcEcEP83w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128226550"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 10:03:48 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 0/3] Reduce scaling tests log size
Date: Tue,  8 Apr 2025 22:33:26 +0530
Message-ID: <20250408170329.523539-1-ramanaidu.naladala@intel.com>
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

Reducing scaling tests log size by bypass the unsupported modes.

Naladala Ramanaidu (3):
  lib/igt_kms: Add mode restriction check for Intel scaling
  tests/kms_plane_scaling: Reduce Log Level by Skipping Unsupported
    Modes in Scaling Tests
  HAX patch do not merge

 lib/igt_kms.c                            |  23 ++
 lib/igt_kms.h                            |   1 +
 tests/intel-ci/fast-feedback.testlist    | 196 +++------------
 tests/intel-ci/xe-fast-feedback.testlist | 301 +++--------------------
 tests/kms_plane_scaling.c                |  23 +-
 5 files changed, 102 insertions(+), 442 deletions(-)

-- 
2.43.0

