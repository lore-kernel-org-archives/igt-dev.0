Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A33606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 04:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CNqewBrR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D79E10E06F;
	Wed, 21 Oct 2026 04:50:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBD210E06F
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 04:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792558158; x=1824094158;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nZUqqaZZtvCkp0aiRZveI23XuL16+DVcxA0Ycv1nafs=;
 b=CNqewBrRS3sbW957BRTdqqH13PITw8hcnoh3JtxOhr64KYEKYnY1xdam
 ceJg290LNJ/siO7CQnO0VQHI5g5ltVzP2Z4w9OUI+839h38KZxafUfK3A
 RMJX4Ge4PTxwix3A5U1trfcv8NdB1VDLlQ5rBLFDMpoiaeATdMLBlmjTP
 o95Oig7r2F6HO69aqN61q/mhtjD4al8OO7L53+TdOrLB2c/Bj5keveGXj
 3amyXck/p69tsCuOA0KPoTLl7wvGE+Bq75rx53iKY1sALz8qDWrdoX4bo
 Lcw7Nk1AqhDOE9RK55WcY8PeKBh4046STQFJP656P1gjuSF6yqoDLCnxu g==;
X-CSE-ConnectionGUID: tXT2J5M+SeuWwwnIC7iUvQ==
X-CSE-MsgGUID: yGEi+4wxQPSOCxA1e0+Big==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1254090"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1254090"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 21:49:17 -0700
X-CSE-ConnectionGUID: Q0gpHLZFRYm24rFZgPp1eQ==
X-CSE-MsgGUID: 9L3jDCVwSIuu40IDyDmePg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2944459"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 20 Oct 2026 21:49:15 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, nishit.sharma@intel.com, shuicheng.lin@intel.com,
 kamil.konieczny@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2] tests/intel/xe_wedged: ignore expected GuC error in dmesg
Date: Wed, 21 Oct 2026 10:19:11 +0530
Message-ID: <20261021044910.253131-2-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ignore the expected GuC uncorrectable local error message seen
during wedge tests.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2:
- Remove '!' and short the string. (Kamil)
---
 tests/intel/xe_wedged.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index fe8ea6969..ba7efbe1d 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -55,6 +55,7 @@ static void ignore_wedged_in_dmesg(void)
 				    "|EngineInstance: [0-9]+"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"
+				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: GuC: Uncorrectable"
 				    "|SIGID=203");
 }
 
-- 
2.48.1

