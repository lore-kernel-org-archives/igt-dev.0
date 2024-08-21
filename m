Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFECC52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 11:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB80210E8C6;
	Wed, 21 Aug 2024 11:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gAaloVLw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D95010E5E5
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 11:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724238285; x=1755774285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JIHInjy1lQejucyO2LkW5h+hjfVOuSEfVKrNEBNd5l8=;
 b=gAaloVLwsUERLqbksl0twnCChxoUy3HB+2b9tXRdhB0TdWGL4tUOBWPN
 Ikc3pKuwrFQhtp0HWaYwXSwMjECjmrBmZGaiOyXBW5Iz0mm287+fWj6R9
 hOLGr2o9eRFwYG5Qn3Q46zPnLx2mgNlnPMcDMYUpzA0RYCCL4Rqrezdh9
 fXeOnZaf2PV1nFrQufjDehYMC+O9atp9JQv4AwNaLQX4os3To+xW6J0z8
 GwVsVJNquZQuFivqxE9p/76rededrlVPLmeIKNRkS9MyE2P1wE2jQjkcm
 L5Sj/LH2+iEgPrKTPw6M4ZGNEDC/v4g6lLiq45nIj5b5EmjykT6kMHkod g==;
X-CSE-ConnectionGUID: 0vUFwB0SQx6kvQEe1CKzjg==
X-CSE-MsgGUID: bXEsxY1GRrawzMBj7Oz3RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22203476"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22203476"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:04:45 -0700
X-CSE-ConnectionGUID: 2kn9THJHQh6a1+f/vLL/Yw==
X-CSE-MsgGUID: w9MVMj/tTaiWosieapzIxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65407394"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.246.18])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:04:43 -0700
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t 1/2] lib/gpgpu_shader: Fix iga64 compilation warning
Date: Wed, 21 Aug 2024 13:04:15 +0200
Message-Id: <20240821110416.366243-1-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fix src1_null macro definition to match platforms which are mentioned in
the comment above the declaration. (DG2+)

Fixes:
iga64 -Xauto-deps -Wall -p=12p71 lib/iga64_generated_codes.c.d/iga64_assembly_eot.12p71.asm
line 2.37: warning: Src1.Length should suffix src1 register (e.g. r10:4)
(W) send.gtwy (8|M0) null r112 null 0 0x02000000 {EOT}
                                    ^
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/iga64_macros.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
index f4ef5cb16..03cc726d4 100644
--- a/lib/iga64_macros.h
+++ b/lib/iga64_macros.h
@@ -7,7 +7,7 @@
 #define IGA64_MACROS_H
 
 /* send instruction for DG2+ requires 0 length in case src1 is null, BSpec: 47443 */
-#if GEN_VER < 1271
+#if GEN_VER <= 1250
 #define src1_null null
 #else
 #define src1_null null:0
-- 
2.34.1

