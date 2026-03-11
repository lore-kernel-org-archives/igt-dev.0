Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29914FD0620
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 06:23:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D187510E32A;
	Wed, 11 Mar 2026 06:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4jhl8dv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7253C10E327
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 06:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773210207; x=1804746207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W70V2rV1yREGzLeFoYqxCL0CA4upNf3svvfOBQ6Go1Y=;
 b=b4jhl8dvG3JP79GQwpl9CgFz5OHELztAPV5/sPTRE5r1hqeBilTVwi3p
 vTPUltR35MB3HkIOO47szUw/cZwSKbmki0Fqqakn8cX1x16XVHime+eJ3
 WVX3/fo9y65b+YXe3QfOD66LBZ+eZEiF8ZXdTqo7pMtS9dXfFGWd3mm2a
 L5feC8dhovy6fcZtBYIDso2B5IZhO0dybFu9Twj9O7I0LQqqsc6imqHAA
 ar06v6wenue1bM8gvmBummf9QZwkpZfDoQ4UZfXnIITT5HWQ2u1+ivhQ6
 Cu90Cdfp/i91evYl+v5KFmWeTfG4JfnNR+CQSaqAZp5OKQ5XNFRHMz1Cr A==;
X-CSE-ConnectionGUID: MoS/l1WJTUqO90+RwIeQtg==
X-CSE-MsgGUID: kaBPdUowSWuWC5coQzHUag==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77875556"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="77875556"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:23:26 -0700
X-CSE-ConnectionGUID: vnc1qKspTYeX4lkbkclGeA==
X-CSE-MsgGUID: vAW1gVS9REqApOHrCdhCPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220309080"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa009.jf.intel.com with ESMTP; 10 Mar 2026 23:23:15 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v5 4/4] lib/intel_device_info: remove the graphcs_rel from
 xe2+ devices
Date: Tue, 10 Mar 2026 23:23:09 -0700
Message-ID: <20260311062311.1623823-5-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311062311.1623823-1-x.wang@intel.com>
References: <20260311062311.1623823-1-x.wang@intel.com>
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
index c0fde6182..2a9c09d01 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -505,7 +505,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
 
 static const struct intel_device_info intel_lunarlake_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 4,
 	.display_ver = 20,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -517,7 +516,6 @@ static const struct intel_device_info intel_lunarlake_info = {
 
 static const struct intel_device_info intel_battlemage_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 1,
 	.display_ver = 14,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -529,7 +527,6 @@ static const struct intel_device_info intel_battlemage_info = {
 
 static const struct intel_device_info intel_pantherlake_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 0,
 	.display_ver = 30,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -541,7 +538,6 @@ static const struct intel_device_info intel_pantherlake_info = {
 
 static const struct intel_device_info intel_novalake_s_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 04,
 	.display_ver = 35,
 	.has_4tile = true,
 	.has_oam = true,
@@ -553,7 +549,6 @@ static const struct intel_device_info intel_novalake_s_info = {
 
 static const struct intel_device_info intel_crescentisland_info = {
 	.graphics_ver = 35,
-	.graphics_rel = 11,
 	.display_ver = 0,
 	.has_oam = true,
 	.is_crescentisland = true,
-- 
2.43.0

