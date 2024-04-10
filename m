Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90068CD1297
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 06:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE4F1131BC;
	Wed, 10 Apr 2024 06:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekm3ie29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026AF1131BF
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 06:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712730819; x=1744266819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xst4McwzTFf2UUP/LmfeJBPAwhQFYyNvd9w6scCqf1g=;
 b=ekm3ie29T4pLymd9kO1ZtTkqix97gFkIsCmfbe5eTJI6Hg6+amp2nUa3
 g7gm4ALAQMONl16jQ/zglvHKG6xWHJoij0cYyuIxHElTEZ/lmta4tYZt9
 /P3jhXlETuLCyE0qL+qgPgQ2FTYBeK2d7piTRo8ggk/d2qsXNeuosyNNp
 VOgWf9KOphx8wBYMFSfPKhTdaB1SkXBTKxjWf5hsS/jwuXW37iBpUz1B9
 mRwRa7LsqLHo8c+7jD+2EhnM/KDtsSZrp7xPHBJQECIOIfn93CDG8z3KL
 CWvLgPgLvXYuplwx75+ydm4DWQowCDFVW5YgXBn58E6hlRYXuX9e9llQH A==;
X-CSE-ConnectionGUID: untgTfZYQwOpotg/eSsaKg==
X-CSE-MsgGUID: yqqKTDdMSfSji/8bu4rhFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7948143"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7948143"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 23:33:39 -0700
X-CSE-ConnectionGUID: 25Nq3J9QT7uduWuf4nsz4w==
X-CSE-MsgGUID: xSS0jEdRS8aQS8NEm6/DXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25138122"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 23:33:37 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 1/9] lib/igt_kms: Refacror forced_connector struct
Date: Wed, 10 Apr 2024 12:14:18 +0530
Message-Id: <20240410064426.1968399-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240410064426.1968399-1-kunal1.joshi@intel.com>
References: <20240410064426.1968399-1-kunal1.joshi@intel.com>
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

refactor struct

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2a518eb8d..e3b6c607e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -91,12 +91,13 @@
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
 
-static struct {
+struct forced_connector {
 	uint32_t connector_type;
 	uint32_t connector_type_id;
 	int idx;
 	int dir;
-} forced_connectors[MAX_CONNECTORS + 1];
+};
+static struct forced_connector forced_connectors[MAX_CONNECTORS + 1];
 
 /**
  * igt_kms_get_base_edid:
-- 
2.34.1

