Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80126FCC9C1
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 04:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332FA10E64A;
	Tue, 10 Mar 2026 04:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I25Gz/PT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CEF10E1E9
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 04:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773117981; x=1804653981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W70V2rV1yREGzLeFoYqxCL0CA4upNf3svvfOBQ6Go1Y=;
 b=I25Gz/PTV1A3PXkv/d6qY2V0uRcr20bpgWjyuvkQhUIkkTjXq89GaI/W
 t9oPWI5vcxLt/VUfhVm25oM2Ybp3gvTao/7/crsnqkt/BREDWwPBiZimz
 6q6GtAMBvDd8Rh2VkZUMBVKQIrfE27j9GvRGALlQVDSv+03Rx4Qru8atk
 oTcWlx7MHFqo0ohhDKWuqFarqdy1DshAkfJhyK9zie+SnTtA3TrJBZqAg
 nJ6kjuELwOMMA4X+wrbKEn1BsHCxUjxd+ZyHChap+szaPReXmNOiietRN
 Vlb9LFhHv8M4S2MP/rK3IqUbLh10RQmtg1u53B0e5KbREq2uK5TGkp1Jh w==;
X-CSE-ConnectionGUID: B7ze8EfbTCyKkCvriKddxQ==
X-CSE-MsgGUID: VMs5r7HtQnKxa8kZIA0JmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85509939"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="85509939"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 21:46:21 -0700
X-CSE-ConnectionGUID: 36m+L14xTU20srF9w33zAA==
X-CSE-MsgGUID: EBKGhlN8SMa4dS+XRplg/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="219199397"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa010.jf.intel.com with ESMTP; 09 Mar 2026 21:46:20 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v3 4/4] lib/intel_device_info: remove the graphcs_rel from
 xe2+ devices
Date: Mon,  9 Mar 2026 21:46:16 -0700
Message-ID: <20260310044616.1466628-5-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310044616.1466628-1-x.wang@intel.com>
References: <20260310044616.1466628-1-x.wang@intel.com>
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

