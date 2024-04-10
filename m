Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23A3CD1297
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 06:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA751131C0;
	Wed, 10 Apr 2024 06:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IesVyHbN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A934D10FBCC
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 06:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712730823; x=1744266823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y8j0By2LQ67rM36S793h89Y2KilmzMQWoq5PKTO3TTQ=;
 b=IesVyHbNuuwGWR45Z7Zhg1SkKwWe98sqqMR3ZcxZ8zBN5zl1zMdRIPlJ
 XtgT7IPMmXQXe5kbo+QJbzf2R8NJIY0gNN7n5/DTKaKo7NAxaCBUa+5kM
 L9brl263zuvzLoGNh8rsDH5UD2Xadt6y/bu+qcytPsl6e4SLCbxo6OMcn
 JgKzY/ku1HA4O6uEjO+SUnj4xcVHWoeGlMNgc6M1xhDWImO5bxawZ3BU8
 +MAZpJmBvmhPk2S/YE6rxA8MnF8+lPZqsnG3ho8ahg0jAYyfMOAOqmDwV
 me6sXDNVpapQECzT9JVoxhYdRBasxSJLkZCrxNVPdo37OR+hkiLmdwds6 g==;
X-CSE-ConnectionGUID: TLI5LvCPRB6Y1gXXWuGLYQ==
X-CSE-MsgGUID: hqG/0//2T/+3mLj6TvTv0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7948162"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7948162"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 23:33:43 -0700
X-CSE-ConnectionGUID: +hByz537TcC1tb6E1GLO/w==
X-CSE-MsgGUID: GaJPkr04RfSFKW4k2joZnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25138151"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 23:33:41 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 3/9] lib/igt_kms: add enum kmstest_force_type
Date: Wed, 10 Apr 2024 12:14:20 +0530
Message-Id: <20240410064426.1968399-4-kunal1.joshi@intel.com>
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

add enum to seperate out force_type,
@FORCED_CONNECTOR: Uses sysfs and
@FORCED_CONNECTOR_DEBUGFS: Uses debugfs

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6d13e5851..561edf98b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -245,6 +245,17 @@ enum kmstest_force_connector_state {
 	FORCE_CONNECTOR_OFF
 };
 
+/**
+ * kmstest_force_type:
+ * @FORCED_CONNECTOR: Uses sysfs
+ * @FORCED_CONNECTOR_DEBUGFS: Uses debugfs
+ */
+enum kmstest_force_type {
+	FORCED_CONNECTOR,
+	FORCED_CONNECTOR_DEBUGFS,
+	FORCED_CONNECTOR_MAX
+};
+
 /**
  * intel_broadcast_rgb_mode:
  * @BROADCAST_RGB_AUTO: Choose the color range to use automatically
-- 
2.34.1

