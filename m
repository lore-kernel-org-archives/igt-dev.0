Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F9AC2BA16
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 07:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1427910E293;
	Mon, 17 Jun 2024 07:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hcp91XBn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350FF10E2CD
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 07:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718610727; x=1750146727;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=6pHLTveTnf829gYVBTAUjkM3YH/w2UZM7pIc9wepze0=;
 b=Hcp91XBnuXTYDbGBLIFuwVfh6bi5JFlSijXfw4F9fOlxKzO0H/8mioMU
 c5V+7cD63zuK0coOaz2RNoQ8wYF4CKzBX6Uyfkg3DqMPCL4HLdAisF3de
 CXRnACPhzfbIJcKO0YTtt2ZrgLxy5UTpmNO+YRUzeM9xKlwxah8XajuFa
 rW6/uL2kpkyX5W6hOli0RWJrdNIak49XNDGv/tVx/npMJKmAfY79aZiIG
 t7mm/uvhCR/VlM0kZYhkdV0zowHWA4xuH4m38/AlI1AdQ4nb94ZPiz3tu
 ZvHTwQNLymx8y5NAvxOatsF+pD6ldKV+1elXO9whdCpM3VoUH9YDZ3PDP A==;
X-CSE-ConnectionGUID: ZBfVPdblQPKTtPCyuTFkwA==
X-CSE-MsgGUID: Hgl1rdg7QpmP8+SirB4ngA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="37950946"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="37950946"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 00:52:07 -0700
X-CSE-ConnectionGUID: bHPB0J54SmeZ5GdQlfTyMA==
X-CSE-MsgGUID: eUtrVM+KRMKiSXRMSvAuaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41249546"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 00:52:06 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 17 Jun 2024 09:51:45 +0200
Subject: [PATCH 2/2] lib/intel_chipset: add Battlemage support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-bmg_chipset_info-v1-2-289e3215141e@intel.com>
References: <20240617-bmg_chipset_info-v1-0-289e3215141e@intel.com>
In-Reply-To: <20240617-bmg_chipset_info-v1-0-289e3215141e@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ewelina Musial <ewelina.musial@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2147;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=6pHLTveTnf829gYVBTAUjkM3YH/w2UZM7pIc9wepze0=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmb+sixOjmilSYkTPQjMVDc0BheOH81wBdgdTeMf7d
 S5cQlpCJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZm/rIgAKCRAjYrKT3hD91zNbC/
 9So0z78EVoav+TQ0V/xXriZy79UMSDI7IHGFUMTTdamPtLy64lHtA6v8dHqoEqtaglHS/Uirw+oSdT
 F9w3IDlwDe1o7VcReqDxKBtR67V2ssgUCuUPuAs/SO6ThG9TpKzA4J7Rd3QOd/miTxvmp7D0dydoR+
 LQiXEtVKWTR3gCbb0zoGEWbjqU/E97CBbND7yqzC5xLJrZF0EVYgRXDC90fmu28HGLpeQZxqYNj7SR
 xdGKdBK8Dd4pBA6N/qIlquE8NLmqUZ9K16KyTuMPX6nbcm71sZnNVcSj+roeGhjOiSiZYn5EYUsU67
 fnOmRxK4ND0Vq+6YhF+7JT2WxXtNdzAHdPENbFIyUflE4qEetlLyuPY0I1a6fn2OZ4WV68SM2s8djD
 9OK+0yCSSqbmsraBmFmFh9qgmTh1qF/tGmzekRAx9WW73ZMCOBMp18NwksZnnykVQthvRiikabTHuN
 ZYub+Ilu51MIDWi7ufxJsSm4yIhxg+/S1BKWF7NCct94A=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Add basic definition for the Battlemage platform.
Follow Lunar Lake convention.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 3f25345199b6..270392c83c2a 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -91,6 +91,7 @@ struct intel_device_info {
 	bool is_meteorlake : 1;
 	bool is_pontevecchio : 1;
 	bool is_lunarlake : 1;
+	bool is_battlemage : 1;
 	const struct intel_cmds_info *cmds_info;
 	const char *codename;
 };
@@ -205,6 +206,7 @@ void intel_check_pch(void);
 #define IS_METEORLAKE(devid)	(intel_get_device_info(devid)->is_meteorlake)
 #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
 #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
+#define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
 #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index e80ea54707de..9250abd444db 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -515,6 +515,16 @@ static const struct intel_device_info intel_lunarlake_info = {
 	.cmds_info = &xe2_cmds_info,
 };
 
+static const struct intel_device_info intel_battlemage_info = {
+	.graphics_ver = 20,
+	.graphics_rel = 1,
+	.display_ver = 14,
+	.has_4tile = true,
+	.has_flatccs = true,
+	.is_battlemage = true,
+	.codename = "battlemage"
+};
+
 static const struct pci_id_match intel_device_match[] = {
 	INTEL_I810_IDS(INTEL_VGA_DEVICE, &intel_i810_info),
 	INTEL_I815_IDS(INTEL_VGA_DEVICE, &intel_i815_info),
@@ -621,6 +631,8 @@ static const struct pci_id_match intel_device_match[] = {
 
 	XE_LNL_IDS(INTEL_VGA_DEVICE, &intel_lunarlake_info),
 
+	XE_BMG_IDS(INTEL_VGA_DEVICE, &intel_battlemage_info),
+
 	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
 };
 

-- 
2.34.1

