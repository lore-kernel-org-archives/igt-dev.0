Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E518CA5FE7
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 23:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1C210E18B;
	Sat, 17 Jan 2026 23:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwDUD7Ar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBE510E107
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 23:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768693714; x=1800229714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y0IWkJ5wyzwPXTcMZre9/2TiXQojiB/MvO/tQyPc3DA=;
 b=hwDUD7ArfTnQIASYJcP70IJVkqDFS4nye/DjdLjinIU04zXyV2Lo/RFB
 f8rCD2Tx+C4A/SbZR2SHjuXPeI08RtZ1kGmyGmBTrVcsKOm7GgBSfAWVK
 /f9JMRO8GUfhIZId+LMdBe/V201b219KUSizPsbv3jfjvBsBbjPiXmdIn
 6+QLZuhACJ376TwckX8r0WNQ+I9xgc++bFVGxQ3lHAF6WGZ0EUHae+2lF
 Fr5EtLTmEiGUqYdnV2lidXVqkXdeHc5IWCzWiyzLwCiHwApY4WFJby5XH
 oQh3uoiantpQD/wkEjaapoCA8McUqrF9XJ+l9gQJJR4svKgPYTC+rkDoO w==;
X-CSE-ConnectionGUID: igqpMrIARf69EeDk/x1d8A==
X-CSE-MsgGUID: /M7YG6ecTuWvI3P5sg/7wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="81073819"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="81073819"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2026 15:48:33 -0800
X-CSE-ConnectionGUID: bEK2bgADSMS7ForqHYAuLw==
X-CSE-MsgGUID: FHmu2ftLRkCELH2TkYCGKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="205150362"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2026 15:48:32 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, ravi.kumar.vodapalli@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH v12 4/4] lib/intel_device_info: remove the graphcs_rel from
 xe2+ devices
Date: Sat, 17 Jan 2026 23:48:20 +0000
Message-ID: <20260117234821.929209-5-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117234821.929209-1-x.wang@intel.com>
References: <20260117234821.929209-1-x.wang@intel.com>
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

On Xe2+ platforms, the graphics/media IP version is no longer a stable
property of a PCI ID "device type". After IP disaggregation, devices
sharing the same PCI ID can potentially report different IP versions, so
encoding graphics_rel in the static PCI-ID table is misleading.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_device_info.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 15f9afdf2..dff2f33a9 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -508,7 +508,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
 
 static const struct intel_device_info intel_lunarlake_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 4,
 	.display_ver = 20,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -520,7 +519,6 @@ static const struct intel_device_info intel_lunarlake_info = {
 
 static const struct intel_device_info intel_battlemage_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 1,
 	.display_ver = 14,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -532,7 +530,6 @@ static const struct intel_device_info intel_battlemage_info = {
 
 static const struct intel_device_info intel_pantherlake_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 0,
 	.display_ver = 30,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -544,7 +541,6 @@ static const struct intel_device_info intel_pantherlake_info = {
 
 static const struct intel_device_info intel_novalake_s_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 04,
 	.display_ver = 35,
 	.has_4tile = true,
 	.has_oam = true,
@@ -556,7 +552,6 @@ static const struct intel_device_info intel_novalake_s_info = {
 
 static const struct intel_device_info intel_crescentisland_info = {
 	.graphics_ver = 35,
-	.graphics_rel = 11,
 	.display_ver = 0,
 	.has_oam = true,
 	.is_crescentisland = true,
-- 
2.43.0

