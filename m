Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578BBC982FD
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 03:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D6B10E02D;
	Thu, 24 Sep 2026 03:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpsgJ3k2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB2E10F2BF
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 03:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790222148; x=1821758148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aQUNZNtfqIImSlFmzNAFjRXtmwzJDCfksI5C0VVFbgM=;
 b=hpsgJ3k2PhpSxYIPRiSJn80j4ZpMpndd8gjz0IkeXNvmpXO8IVZX4/4z
 Apu3hspO5VxgPrlZtsq7FO5rGWPAuzeeQbtBL09SmnUNjbpet6rk+svKv
 352vkB34902/UJyeamU7vS4kH44dxEd6ER6YXCxHae5AW3u5yk3t4piUj
 6TkBLqRwmftdw0pM4kJigOlLq65yFYefdF2/K5c695bm0nwX10NKSmZfF
 MY/E2JuUQyC+uZ5uH7XFIuk9TiO1hmcmsaVjUNidgHvtGTtDgIp5YUJ61
 Qmv2cd7I6LVTUZ939Hv2YZpA0KEUg2ZcpIZeMaI1aF82nzCSSW3qraoJP w==;
X-CSE-ConnectionGUID: IWoNVKR8TBSQsg0fVaEfCg==
X-CSE-MsgGUID: Gy8KW/SaRzGpDztuyVlB9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101639490"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="101639490"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 20:55:47 -0700
X-CSE-ConnectionGUID: WQEMw5fTQxGo+HpJQpnC9Q==
X-CSE-MsgGUID: x+gVSnUaRx2EgHsQM9l29g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="270399278"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 20:55:48 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, matthew.d.roper@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 ravi.kumar.vodapalli@intel.com, stuart.summers@intel.com
Subject: [PATCH i-g-t v13 4/4] lib/intel_device_info: remove the graphics_rel
 from xe2+ devices
Date: Wed, 23 Sep 2026 20:55:40 -0700
Message-ID: <20260924035545.710985-5-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924035545.710985-1-x.wang@intel.com>
References: <20260924035545.710985-1-x.wang@intel.com>
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

On Xe2+ platforms, the graphics IP version is no longer a stable
property of a PCI ID "device type". After IP disaggregation, devices
sharing the same PCI ID can report different IP versions via GMD_ID, so
encoding graphics_rel in the static PCI-ID table gives wrong minor
versions on such devices.

Drop graphics_rel for these platforms and rely on the runtime value
that xe_device_get() reads from GMD_ID.

v2:
 - also drop graphics_rel from WCL and NVL-P.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_device_info.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 096cf6eb7a..afeb3b6df2 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -510,7 +510,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
 
 static const struct intel_device_info intel_lunarlake_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 4,
 	.display_ver = 20,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -522,7 +521,6 @@ static const struct intel_device_info intel_lunarlake_info = {
 
 static const struct intel_device_info intel_battlemage_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 1,
 	.display_ver = 14,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -534,7 +532,6 @@ static const struct intel_device_info intel_battlemage_info = {
 
 static const struct intel_device_info intel_pantherlake_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 0,
 	.display_ver = 30,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -546,7 +543,6 @@ static const struct intel_device_info intel_pantherlake_info = {
 
 static const struct intel_device_info intel_wildcatlake_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 3,
 	.display_ver = 30,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -558,7 +554,6 @@ static const struct intel_device_info intel_wildcatlake_info = {
 
 static const struct intel_device_info intel_novalake_s_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 04,
 	.display_ver = 35,
 	.has_4tile = true,
 	.has_oam = true,
@@ -570,7 +565,6 @@ static const struct intel_device_info intel_novalake_s_info = {
 
 static const struct intel_device_info intel_novalake_p_info = {
 	.graphics_ver = 35,
-	.graphics_rel = 10,
 	.display_ver = 35,
 	.has_4tile = true,
 	.has_oam = true,
@@ -582,7 +576,6 @@ static const struct intel_device_info intel_novalake_p_info = {
 
 static const struct intel_device_info intel_crescentisland_info = {
 	.graphics_ver = 35,
-	.graphics_rel = 11,
 	.display_ver = 0,
 	.has_oam = true,
 	.is_crescentisland = true,
-- 
2.43.0

