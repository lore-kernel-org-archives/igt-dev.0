Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE47AC5B549
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 08:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5856410E7CF;
	Fri, 30 May 2025 08:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gmSdEmWj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B78F10E0A9
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 08:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748594647; x=1780130647;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=biX7UoY1s9n0RIVawjC2Xrn6glKChaQrhh96RLw07hY=;
 b=gmSdEmWj7nEPtzsYDjBXQnLEXbRoq2ag5MqXjfX2qmKREAFZm0IhmdcE
 X+S9nqlI0wlnVHPgqn4yPGqjH5N3nYVA3+FSjIzAuWylyRIJo12uzbniH
 dIfv9cwt2HNw3vHNXj8RViscTI6m48E4Gk/aPxMmAJJ0+3So6OBlZMqkZ
 2TX7lnvMFMGNk5urB91tUrOlaqR4L6swjdYO6VV6JnYrR7foil1vpLsrM
 0qs6+/bwkl96pqTOD/oTJoOge9Ti35cZWzkZvJMldyIU3/YR2ZMQ2SHIY
 XOpTF4jz9CUSBhWbKQ9h1yv6rfaL6VlAYXwOFAyuWat4rjSmREeEX51KW w==;
X-CSE-ConnectionGUID: wiyfSP8wQACQ6foGJ9c/AA==
X-CSE-MsgGUID: 7fDJxRwjTcitdvyxykYPhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61307843"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="61307843"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 01:44:05 -0700
X-CSE-ConnectionGUID: N+p9d+6DRm2zYrVfftJEXw==
X-CSE-MsgGUID: C/NthBajTjKSBYOUusLs/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143777008"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 01:44:04 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t,v2] tests/intel-ci: Update xe blocklist
Date: Fri, 30 May 2025 14:19:36 +0530
Message-Id: <20250530084936.1436922-1-swati2.sharma@intel.com>
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

Update xe CI blocklist with KMS tests which are either missing
driver support or are i915 specific.

v2: -sort alphabetically (Kamil)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 3cb10296d..ebe1ff006 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -62,6 +62,7 @@ igt@kms_addfb_basic@clobberred-modifier
 igt@kms_addfb_basic@.*framebuffer-vs-set-tiling
 igt@kms_addfb_basic@tile-pitch-mismatch
 igt@kms_busy@.*
+igt@kms_cursor_legacy@basic-busy-flip-before-cursor-(atomic|legacy|varying-size)
 igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
 igt@kms_fence_pin_leak
 igt@kms_flip@.*flip-vs-fences.*
@@ -79,7 +80,11 @@ igt@kms_pm_rpm@cursor.*
 ##################################################################
 # KMS: Yet to add/missing XE support
 ##################################################################
+igt@kms_atomic@plane-primary-overlay-mutable-zpos
+igt@kms_plane_scaling@.*downscale-factor-0-25.*
 igt@kms_prime@.*
+igt@kms_scaling_modes@scaling-mode-none
+igt@kms_writeback@writeback.*
 ##################################################################
 # KMS: Test was written with the idea that edid read shouldn't take an
 # unreasonable amount of time. The timeout is an arbitrary value
-- 
2.25.1

