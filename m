Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766DFC2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 12:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E0510E646;
	Tue, 25 Jun 2024 12:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAGxinJF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A422210E645
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 12:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719318721; x=1750854721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NBqTLaneuNd4Blacs+0A1jW76T+FXxHR206mTtD4XjA=;
 b=HAGxinJFcOHuPQHSzpzTXuSj2bDrjfcUqzwzoY2LGyhCh0KpUNMpRVw/
 TW+9OfVjFeiFOm1e7nBdmnc55ciAG2GzovJw48dScgdert7CryvieNaFT
 au3O9yuxq4HhwuZeq5APsscGjlpQEWwkqozaBF1vAomn1aELUbAXqg9nU
 C9MZviD0VguyzGENdMhcb6HNcGj7O9OzBCPr4nCBXeQgAq5Gjuy8of+2P
 mpyQY2QV+6w5cp2Cvo10rd+WeD0pV2Zri7Fz5+ch/8tV3oyfp4yan12DV
 sQe/o/TWmyr33rYZQkP2d0lu47vReD4an3tvncJTqUzfiZsd6KmyF2tad A==;
X-CSE-ConnectionGUID: TGuK9Y2fQlC941Q06fPzIg==
X-CSE-MsgGUID: 90SgF8pZSauVoZA85Yz64Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16158432"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16158432"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 05:32:01 -0700
X-CSE-ConnectionGUID: s5c5nXPmRzC/8DlL9J4ySg==
X-CSE-MsgGUID: ePqBsNtXR/6ANLWbe3pYHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="74399511"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.3])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 05:32:00 -0700
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 2/2] lib/gpu_cmds: Typo fix
Date: Tue, 25 Jun 2024 14:31:42 +0200
Message-Id: <20240625123142.11550-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625123142.11550-1-dominik.karol.piatkowski@intel.com>
References: <20240624113949.6846-1-dominik.karol.piatkowski@intel.com>
 <20240625123142.11550-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fixed typo in description of one of the dwords in
xehp_emit_state_base_address.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/gpu_cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 2a502505e..2e29cc6c4 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -1032,7 +1032,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
 		intel_bb_out(ibb, 0);
 	else
 		intel_bb_out(ibb, 0xfffff000 | 1);
-	/* intruction buffer size */
+	/* instruction buffer size */
 	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);           //dw15
 
 	/* Bindless surface state base address */
-- 
2.34.1

