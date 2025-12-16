Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703C9D5E13D
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 18:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB2610E2DD;
	Tue, 16 Dec 2025 18:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h4vn0z7u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA97210E2DD
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 18:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765910711; x=1797446711;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IiKet71Q3N/1GAN6FfIpdvb95ZQR6Nt/utUmoNZvG00=;
 b=h4vn0z7uC4TV+pwaL3YBZcgEYZ3DR+aVL2Vi0O2OPloEoJo5ePTjZ3aS
 7iMbahcpfoHj9Fb1/sAQw6ot1ZgdDQjvOwOrTLT8m+aHBF7DQtvNGpIdb
 v9sIVK9Jwd/MHKqU2lO1g71/DiSyrbnxJD/Np73UzIhPHOqCS7gM9N2Jp
 GWqkNjIvEaZgoprTNYda8FZ+pVzWvOrAr3MjloaGEKt2ghlN9zP1ruC7R
 PsjDCAWAayTJHxhmKAXLAduSJKHCkGk4sNKJYVdJzH+Vv96iVNRXzcnr4
 gz8sXpUlav/4H/uFcwfvLD1WT+Otg+s7JvZTgqZREemPB7iqY02BwlEFS A==;
X-CSE-ConnectionGUID: OckGiu8FQCybEAviPlIYPw==
X-CSE-MsgGUID: Zg6DgIZmTfeuvm5hSFF/cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70416019"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="70416019"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 10:45:10 -0800
X-CSE-ConnectionGUID: 8qj3DjlRSLitDYfzqjLO3w==
X-CSE-MsgGUID: HabGC3ZDQa2IDMxcfUQX1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="198148594"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 10:45:09 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/7] Add NVL display related test updates
Date: Wed, 17 Dec 2025 00:22:08 +0530
Message-Id: <20251216185215.1281390-1-swati2.sharma@intel.com>
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

This patch series adds NVL display related test updates.

Heikkila, Juha-pekka (2):
  tests/intel/kms_flip_scaled_crc: add flip to reflect-x tests
  tests/kms_plane: add test and limitations for odd height planar tests

Nemesa Garg (1):
  tests/kms_plane: Modify the condition for odd pan

Pranay Samala (1):
  tests/intel/kms_frontbuffer_tracking: Add FBC support to FP16 formats

Sai Teja Pottumuttu (1):
  tests/intel/kms_big_fb: NVL supports horizontal flip with linear
    surfaces

Swati Sharma (2):
  intel-ci: Add NVL display blocklist
  tests/intel/kms_test_config: Add NVL display blocklist entry

 tests/intel-ci/xe.nvl.display.blocklist.txt | 128 ++++++++++++++++
 tests/intel/kms_big_fb.c                    |  20 ++-
 tests/intel/kms_flip_scaled_crc.c           | 158 ++++++++++++++++++++
 tests/intel/kms_frontbuffer_tracking.c      |  58 ++++++-
 tests/intel/kms_test_config.json            |   1 +
 tests/kms_plane.c                           |  73 ++++++++-
 6 files changed, 420 insertions(+), 18 deletions(-)
 create mode 100644 tests/intel-ci/xe.nvl.display.blocklist.txt

-- 
2.25.1

