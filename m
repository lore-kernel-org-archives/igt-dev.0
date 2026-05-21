Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A9CCD4F3D
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 13:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82D410E4CD;
	Thu, 21 May 2026 13:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZE/BJ5yc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAACA10E4CD
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 13:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779370939; x=1810906939;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=kE+wcuyM1Uxc4mEqxeG5jbdVwnQ9jwqojGNvefEEP9E=;
 b=ZE/BJ5yc2/ZOUbO/3X7W9z711f260EnD/dWfUKq1CT8a7HC04D/lgfoJ
 wa2uFRT6wdJkuST22+PYzhyw2vDFI79tHbr8+iY8BkIsP1OhkXTsv6vXZ
 UP3cXOTxYPdtSp4r876qzi6vRajtcNEc2Fr2YtBQKGO3x2DmNRg1QgaAP
 teVLEC9KoG62HZ2cnsaC8YJt4ICbY6q/CzrZDCYkoLl8Gg/vI9G/VIfR4
 M3iF2tJCvTeQLP6OEyGj6SiMhSv/GzhqX6SLx1WMHMvORXbEfPVXD1ELE
 dasCrQi/ArpIBI9t+oouw+8m5RLBnsCpYZTAjbJW4ya7OZ/HjjmC1fFcJ w==;
X-CSE-ConnectionGUID: Bh2ROvWqRNq9x8TLbpigrg==
X-CSE-MsgGUID: o/Mfaf3dTSuvTjE2lq/fHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80321882"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80321882"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 06:42:17 -0700
X-CSE-ConnectionGUID: tSGehno5SYyXp/aYzNeDVQ==
X-CSE-MsgGUID: zuGBS778Sby5lJihwaQdoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="239517296"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 06:42:16 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 21 May 2026 15:40:46 +0200
Subject: [PATCH v2 2/2] tests/intel/xe_exec_store: increase batchbuffer
 size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-ibb_fixes2-v2-2-a36d7a9e71e5@intel.com>
References: <20260521-ibb_fixes2-v2-0-a36d7a9e71e5@intel.com>
In-Reply-To: <20260521-ibb_fixes2-v2-0-a36d7a9e71e5@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=815;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=kE+wcuyM1Uxc4mEqxeG5jbdVwnQ9jwqojGNvefEEP9E=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBqDwtrNbks8K0/MkuQTF6Nxcx3E7kPl6QD2PO19
 Y7DeLy88veJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCag8LawAKCRAjYrKT3hD9
 168tC/4oKRaPcBlToCmT3BKMlql6fVZn312gYosj1r3Hp+CAuGpOLtlDdM6w1I2X4beovEgpwil
 4ljPvxolwg5+pVmEkMgQY5zjzfrYYU26zsi8U7ydbs4eCQRlYoXQJYoeB/eyog6h5VjnNXkMvLZ
 UAZP28/a5LVwudLlx9+PRIpWxCGUQzyql22BTFXkjIlFIYwGBs1dXbwCoAg1qNPRAVLSGENSMnD
 frMeZiRpEKCihV3Px06kmH0HVST95JrewR7ix3ulu7eqsKq8QC5ONlT2rTTm7zDKKzVRoWfO+J/
 Es9n+aNirFDCcKGE1YUfXwGfC+mGBgap3VuQyDPED/YtvvskaRnkh/NbuySI9UBJOJzVreGOVZe
 NOOogvslFpZ3pUm1JLb//FF6h78T3g55GHR3+4uoawU8sk2UWMGg377vHVcCvf7/LebTKj0pGMB
 283W9omgD+j05rxoIxORG0sd8jktkG9fz6gszkZoyslibaTaKkJtyvPqI7XrHNeLruMFY=
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

In case of some platforms 32K is too small for the shader.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_exec_store.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index faf2c7fa86ce..b9753dc22f9a 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -352,7 +352,7 @@ static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
 {
 	const uint64_t target_offset = 0x1a000000;
 	const uint64_t bb_offset = 0x1b000000;
-	const size_t bb_size = 32768;
+	const size_t bb_size = 65536;
 	uint32_t vm_id;
 	uint32_t exec_queue;
 	const unsigned int instruction_count = 128;

-- 
2.54.0

