Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DD0C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 09:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545AC11335B;
	Wed, 17 Apr 2024 09:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sr+A8EpB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60A411335B
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 09:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713347499; x=1744883499;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=rurc9b2FpNFBEzcL6PEY8gXGrIRktC1PnFNLaBx7z20=;
 b=Sr+A8EpBhOASXuHciq8kmxwa5r+gzoTBhpq2cA5EJ+lq8b0r3qU/lo2w
 TPRN5KlzjpBoTsaGgjzQxaSuZcWwsKKVxc9Xb90bdt1LMcaFqrqDfL7xe
 UaIj0RNvEtc69lTWoZKn+pJC4NtYpabrC2/jx2wWVIp/hGycbamBqsZBR
 3mcpXPlxVD7qtFOhpsc87SkHztG0SdOLYACHxpny+U9w+9iym8YnJKRvX
 qhsEhdXc3Um4JBVwFY0ZkG8husGmeeEmBDSZ4voDSvNhCokGfDlvKJwR+
 lydlRFiOY6qcZsP8G/gp2yyR17Huy2urgDhRtsU+EAuzqB4/O/xx6Ophb A==;
X-CSE-ConnectionGUID: nV9S0nbRQHq4n6t6g8FPyw==
X-CSE-MsgGUID: nle7axFfQ162fnGJjaYmLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="34215347"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="34215347"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 02:51:39 -0700
X-CSE-ConnectionGUID: 1ECpV21RQjS34IpXq1T+lA==
X-CSE-MsgGUID: XYQhFA1bQE6ivAUKELMJMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="59981239"
Received: from basicluh01.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.223.131.46])
 by orviesa001.jf.intel.com with ESMTP; 17 Apr 2024 02:51:36 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, vidya.srinivas@intel.com,
 kamil.konieczny@linux.intel.com, Melanie Lobo <melanie.lobo@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH 1/2] lib/intel_aux_pgtable: Library to add support for FP16
 XRGB16161616_64B format
Date: Wed, 17 Apr 2024 15:33:50 +0530
Message-Id: <20240417100351.10583-2-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240417100351.10583-1-melanie.lobo@intel.com>
References: <20231010134540.28485-1-melanie.lobo@intel.com>
 <20240417100351.10583-1-melanie.lobo@intel.com>
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

MTL supports XRGB16161616_64B format which is a binary floating-point computer
number format that occupies 16 bits in computer memory. 

This was tested with kernel patch,
https://patchwork.freedesktop.org/patch/563854

Test-with: 20231012062620.23886-1-melanie.lobo@intel.com

cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
cc: Swati Sharma <swati2.sharma@intel.com>

Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
---
 lib/intel_aux_pgtable.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index 3cbb0e26f35c..1741c41af9a9 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -22,6 +22,7 @@
 #define AUX_FORMAT_AYUV		0x09
 #define AUX_FORMAT_ARGB_8B	0x0A
 #define AUX_FORMAT_NV12_21	0x0F
+#define AUX_FORMAT_XRGB16161616_64B 0x10
 
 struct pgtable_level_desc {
 	int idx_shift;
@@ -306,6 +307,10 @@ static uint64_t pgt_get_l1_flags(const struct intel_buf *buf, int surface_idx)
 			entry.e.format = AUX_FORMAT_ARGB_8B;
 			entry.e.depth = bpp_to_depth_val(32);
 			break;
+		case 64:
+			entry.e.format = AUX_FORMAT_XRGB16161616_64B;
+			entry.e.depth = bpp_to_depth_val(64);
+			break;
 		default:
 			igt_assert(0);
 		}
-- 
2.17.1

