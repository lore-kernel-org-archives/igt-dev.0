Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681AC606A321
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CXCtth9G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD1110E5C0;
	Fri, 27 Nov 2026 11:15:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5B010E54A
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795778043; x=1827314043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4cyQnSzlJt1ZoLMG4mKSmIq0yXMKQCBCCRtkgLw6yfQ=;
 b=CXCtth9GYDNj7DqKSPPrtppdfyAu4Xl6b2uzd0Y8mr1FcuOzeKb9gg+H
 i9euG8VRXTZmiODszE1GAkr3/VsHiofu8x6Kpy9M4jkZ8lDlT6JnGnDmx
 D6DJUhXIJLRDbdfYBsfp5B+4wynRbR1QzCCOWwjTp/nsKwBLQs8Icl5Ri
 OCnKy+CVAk1GdnS8RcVb1lOS3/fNb/d4+CG87pvF1ld3ZcPdg2lHKmZpi
 M2VisOKVbFKZJ8N4TQsTi5sUV9iLQsPutP1EKFxCt5yAQJ/TJAB/Ir+zg
 UK+Zq0nYKeCowYrkNsIkRkTfKnpWCCfs1aDzIZizPA3J9+octxG7UBfJh A==;
X-CSE-ConnectionGUID: vJoJC5DYSzuZSbSXT2zVHQ==
X-CSE-MsgGUID: e89sq2oBSAC5Q/Q81tLeWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4532887"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4532887"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 03:14:03 -0800
X-CSE-ConnectionGUID: VcIuxMW7Ss2KFwFyBy1MZw==
X-CSE-MsgGUID: Jif+lGi1SIOlEz8P58LtGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12711244"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 03:13:59 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] lib/pciids: sync with kernel commit 78b2ef7a0c02
Date: Fri, 27 Nov 2026 16:54:42 +0530
Message-ID: <20261127112441.762644-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.53.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sync brings new PCI IDs for CRI.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 lib/pciids.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/pciids.h b/lib/pciids.h
index a21609207..ab02bef26 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -905,7 +905,12 @@
 	MACRO__(0x674E, ## __VA_ARGS__), \
 	MACRO__(0x674F, ## __VA_ARGS__), \
 	MACRO__(0x6750, ## __VA_ARGS__), \
-	MACRO__(0x6751, ## __VA_ARGS__)
+	MACRO__(0x6751, ## __VA_ARGS__), \
+	MACRO__(0x6752, ## __VA_ARGS__), \
+	MACRO__(0x6753, ## __VA_ARGS__), \
+	MACRO__(0x6754, ## __VA_ARGS__), \
+	MACRO__(0x6755, ## __VA_ARGS__), \
+	MACRO__(0x6756, ## __VA_ARGS__)
 
 /* NVL-P */
 #define INTEL_NVLP_IDS(MACRO__, ...) \
-- 
2.53.0

