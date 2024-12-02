Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B17DD10DCF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 09:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6B110E681;
	Mon,  2 Dec 2024 09:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPQQuABH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24BB10E681
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2024 09:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733131948; x=1764667948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y3NYRTwSuhk7E8oS31Q8t0tj+1EFGqYeXm7C9IUA1sE=;
 b=lPQQuABHs06MJiqfDWfOTzsQXrcOFFn1ZR4kP49xdkC6kJ+nMDyfrMUb
 ploQHmBVyCYyBc0G3DaDL98ZyzNAeXKtLONRnK4guK2PLl90nm7SLbo7D
 CIk2IABlh1Qt7Bu4aWgTDnhlnqZur5u2uiPuDBJuru2h+a365jEz8jUQG
 Mvu7HBkQ1dwxuo3eJbXUSeBPo3NBMsApFRb4i436IyyVngpAr8YgkMOVk
 +3KqUGFbK7kDalmqNzTjXG3PC9RNbHZf58P2OtFWFFsDkW0a0TPRkPdDS
 rOHtdTlJupMTfCLMt9ytRLKMQw5Cm2JprCFyLL0L85QfRfGDF+cYf5+AT g==;
X-CSE-ConnectionGUID: G/j4siycTsmqcFvRN2KBBg==
X-CSE-MsgGUID: Sjtk6VxKSNO3JLu9VfwhsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="20882368"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="20882368"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 01:32:27 -0800
X-CSE-ConnectionGUID: gkfj9PJjRO6Hsw03PnoMjA==
X-CSE-MsgGUID: 6hsIKbidQW2y4urqNsSwWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="98166389"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.79])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 01:32:26 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t] lib/pciids: sync with kernel
Date: Mon,  2 Dec 2024 09:32:19 +0000
Message-ID: <20241202093219.12157-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.0
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

Align with kernel commit ae78ec0a52c4 ("drm/xe/ptl: Add another PTL PCI ID").

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/pciids.h b/lib/pciids.h
index 32480b556..7883384ac 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -829,6 +829,7 @@
 	MACRO__(0xB092, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
 	MACRO__(0xB0A1, ## __VA_ARGS__), \
-	MACRO__(0xB0A2, ## __VA_ARGS__)
+	MACRO__(0xB0A2, ## __VA_ARGS__), \
+	MACRO__(0xB0B0, ## __VA_ARGS__)
 
 #endif /* __PCIIDS_H__ */
-- 
2.47.0

