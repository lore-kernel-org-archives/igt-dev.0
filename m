Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51950C98316
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 07:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5896E10E251;
	Sat, 17 Jan 2026 07:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGtJv6S4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C877D10E029
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 07:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768634156; x=1800170156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jnl20jEN90XxuSq7XqxwdRcf5kHF6kftJy4u10Rx/7E=;
 b=LGtJv6S45VWokiynNnrcM3R33TSQSGmnKwoa6qT1qLjPChafkmx4Qi7V
 Otoay1EIMMRaKxKTlngrdkxTIsxwDhpwYFT6x0QZBKwWVTw69Wl8XCqMk
 cJwPsDM2ubGgwuX6kkjItQd3y9/VS0XIPMK1w1+hbY/f108OaTKsaypv7
 u5sTn704QToqZaxtwDxhvPZeaTfotToqVFJiHLqFiN/c0HERSQ49mDL0h
 U1S73MwfU1YuAmDO0CKWADDC4R2z1QxU86vzul/uE3HK0Xzs6hYNmOw+E
 W5pgjxHkKx0ftmrBLx/q35NC5Pi3fkW/FOk0JWpKNlLbBwdko+BS0rgmn Q==;
X-CSE-ConnectionGUID: D3k92tv1RBGGPhLysaFkyg==
X-CSE-MsgGUID: HX5FOKbdQ2GoYZhEkuf3kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73786311"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; d="scan'208";a="73786311"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 23:15:55 -0800
X-CSE-ConnectionGUID: u+s3L8JiSzC7kGa7UOx4Hg==
X-CSE-MsgGUID: GyJmP4cTQZOlrY4uPbFVXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; d="scan'208";a="205842663"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2026 23:15:55 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, ravi.kumar.vodapalli@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH 4/4] lib/intel_device_info: remove the graphcs_rel from xe2+
 devices
Date: Sat, 17 Jan 2026 07:14:59 +0000
Message-ID: <20260117071459.892532-5-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117071459.892532-1-x.wang@intel.com>
References: <20260117071459.892532-1-x.wang@intel.com>
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
index 7ae2a642a..52aef5140 100644
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

