Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89379C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 19:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D9610E050;
	Tue, 11 Mar 2025 19:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZbgjQgP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFAA10E050
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 19:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741722836; x=1773258836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=McbauSS36fDb8431YjneiZuvvP5Viy06B0LODPgMPCo=;
 b=LZbgjQgPhoo1Rk7EKAWQnzZFErbFIxKdhyMayHtbiH/7Bx+MGimt8uZC
 Z5t/8A98fijApsE3ZDoHHVPTO5b0NE8mWZIHvszGmsUzaPflg253SHCUP
 /Cb7kAf45IdpHyl7qOeVok7jyHbChIgG84Y007sksD0E3hDOJguIDeYQT
 SstCQo/NLF6otm3gu7POawD5kqRcqbK/SqYfVdHJg7Z0WRVDwfG+9PfFo
 plNAONd7Uqf0qfSiap3vCbB8zdYYIXKoZulh56hqS3G4A83IqRuvlH9nX
 543rFq5mn2s+Bn6/AMUx0a2rdXfjjDxArOAzti8up72Udt0G2qePQo/8t w==;
X-CSE-ConnectionGUID: wmdDQVgwSmKvGUc3hpInuA==
X-CSE-MsgGUID: H9ppjoF1TlyNPPXfEIZ/PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42034592"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="42034592"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 12:53:56 -0700
X-CSE-ConnectionGUID: KCo8Mc91T0q0c36QbPjF8w==
X-CSE-MsgGUID: Kl481zIZQnyrMk2IOXEZew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="151221968"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 12:53:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/i915_module_load: Do not skip on snd
Date: Tue, 11 Mar 2025 12:53:39 -0700
Message-ID: <20250311195339.1206647-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
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

The fact that snd_hda_* is loaded doesn't mean i915 is. It used to be
the case that loading e.g. snd_hda_intel would load i915 because of a
request_module("i915") in the kernel. However that changed in
commit e6d0c13e9f46 ("ALSA: hda: i915: Remove extra argument from
snd_hdac_i915_init").

Drop the snd_* modules from unwanted_drivers.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/i915_module_load.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index b3752a19c..2047d1886 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -368,8 +368,6 @@ igt_main
 		const char * unwanted_drivers[] = {
 			"i915",
 			"intel-gtt",
-			"snd_hda_intel",
-			"snd_hdmi_lpe_audio",
 			NULL
 		};
 
-- 
2.48.1

