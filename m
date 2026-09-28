Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5733FCA5FA2
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 17:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0210510E951;
	Mon, 28 Sep 2026 17:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UPivBcdw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C8210E93E
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 17:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790616437; x=1822152437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9b5bWT2knQ28fPTS0EawO3pFRGToFJsrNB4cL65dDh8=;
 b=UPivBcdwamuaSwlIjlVgjtVrBZYjdBm9E8qLqfsPTJOAWrh0Ut1yZxq+
 YP3THJ62nvi6Fk7mncimnDHVxprp2Fc6xH960ImETyMtswW61wHGI9E45
 Clzyx40YD5v5MymIVkt+EwYwAH/01aBa+36SJR8D8+kIeV9FcAMXhcel/
 /nQPfZG9b7P6qmR2VGQcYr8nDxvXnqP5HRgZ4vIY7/r54O0yu36f+RumS
 CD53LfYNtFe30QF8JuHkOTPiwBJZ61GiGnM7VZLDGRm2X3AfPG4DrQ8uo
 Pveg2w1eFRHgBvEfT2n8WK4l3rij+FT06IGBrmxsw4p83q/AG3CUp4HWl w==;
X-CSE-ConnectionGUID: rH9mVXSPTQKm+/Vv1+S5SA==
X-CSE-MsgGUID: fD0haeldQl+ObXa2LmMepA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="78889477"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="78889477"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 10:27:16 -0700
X-CSE-ConnectionGUID: WM3pKyXaRO6LGaStgt/y7Q==
X-CSE-MsgGUID: 8l55M2ScRJG9Nj5q5Y73AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="274616960"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa007.fm.intel.com with ESMTP; 28 Sep 2026 10:27:15 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, matthew.d.roper@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 stuart.summers@intel.com
Subject: [PATCH i-g-t v14 4/4] lib/intel_device_info: remove the graphics_rel
 from xe2+ devices
Date: Mon, 28 Sep 2026 10:27:07 -0700
Message-ID: <20260928172713.1341060-5-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928172713.1341060-1-x.wang@intel.com>
References: <20260928172713.1341060-1-x.wang@intel.com>
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
index 9201ca806c..0879f49038 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -512,7 +512,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
 
 static const struct intel_device_info intel_lunarlake_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 4,
 	.display_ver = 20,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -524,7 +523,6 @@ static const struct intel_device_info intel_lunarlake_info = {
 
 static const struct intel_device_info intel_battlemage_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 1,
 	.display_ver = 14,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -536,7 +534,6 @@ static const struct intel_device_info intel_battlemage_info = {
 
 static const struct intel_device_info intel_pantherlake_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 0,
 	.display_ver = 30,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -548,7 +545,6 @@ static const struct intel_device_info intel_pantherlake_info = {
 
 static const struct intel_device_info intel_wildcatlake_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 3,
 	.display_ver = 30,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -560,7 +556,6 @@ static const struct intel_device_info intel_wildcatlake_info = {
 
 static const struct intel_device_info intel_novalake_s_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 04,
 	.display_ver = 35,
 	.has_4tile = true,
 	.has_oam = true,
@@ -572,7 +567,6 @@ static const struct intel_device_info intel_novalake_s_info = {
 
 static const struct intel_device_info intel_novalake_p_info = {
 	.graphics_ver = 35,
-	.graphics_rel = 10,
 	.display_ver = 35,
 	.has_4tile = true,
 	.has_oam = true,
@@ -584,7 +578,6 @@ static const struct intel_device_info intel_novalake_p_info = {
 
 static const struct intel_device_info intel_crescentisland_info = {
 	.graphics_ver = 35,
-	.graphics_rel = 11,
 	.display_ver = 0,
 	.has_oam = true,
 	.is_crescentisland = true,
-- 
2.43.0

