Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EDAC71155
	for <igt-dev@archiver.kernel.org>; Fri, 20 Jun 2025 05:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708B110EAC4;
	Fri, 20 Jun 2025 05:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ev9mUd92";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1682B10EAC4
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jun 2025 05:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750396952; x=1781932952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DxebEs29CGUiEOBx109hNo6fMS6ClzHvqU3596a8vzQ=;
 b=Ev9mUd92ZHO/z0q2VHF6Ct6nxth85milYS7LTfaQ2ih9s49WcX4XYgZD
 eq0aJ4pweVKSTtKQYiLkcFbDHkb9fEkCsz93T23RXxTHLGBo78IVv+u7g
 DK63DeDutnJhiHdRYQ0ghU0mslAH3H9Cvu089AQ1GzOkVuvVx88R583s4
 kKlj9b7LDSzY8rJnCYIMr2JMVnlhxZhXN/8+9zEOdr5ZCh0Xp4JGcvS6r
 szFCnWRCWjLriO/H16xVpJlSRm6kupuDUe6LuAT+fvhMgOjhQ4YxvKnS8
 zfOwu6pLPsaW4QJABjnedgvRSLqc+3j4sKvQtDWxJLgaMATPD2hqwU0TK Q==;
X-CSE-ConnectionGUID: 0wf+cKVsTSey3KyobSXh/Q==
X-CSE-MsgGUID: i3IKnT6ERhSl7M4YbDJQag==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70085493"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="70085493"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:22:32 -0700
X-CSE-ConnectionGUID: 1GWIeClnSKGWezhhLCzXbw==
X-CSE-MsgGUID: bdXl59llTjqet0aqk771uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="155093663"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 22:22:29 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t] lib/pciids: Add PCI IDs for xe2_hpg
Date: Fri, 20 Jun 2025 11:08:18 +0530
Message-Id: <20250620053818.3633618-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Shekhar Chauhan <shekhar.chauhan@intel.com>

As per updated Bspec, Sync PCI IDs for BMG.

Aligns with kernel commit 9b779ff ("drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg")

Bspec: 68090
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://lore.kernel.org/r/20250605190804.1287289-2-dnyaneshwar.bhadane@intel.com
---
 lib/pciids.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/pciids.h b/lib/pciids.h
index d212848d0..86cd54764 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -853,7 +853,11 @@
 	MACRO__(0xE211, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__), \
 	MACRO__(0xE215, ## __VA_ARGS__), \
-	MACRO__(0xE216, ## __VA_ARGS__)
+	MACRO__(0xE216, ## __VA_ARGS__), \
+	MACRO__(0xE220, ## __VA_ARGS__), \
+	MACRO__(0xE221, ## __VA_ARGS__), \
+	MACRO__(0xE222, ## __VA_ARGS__), \
+	MACRO__(0xE223, ## __VA_ARGS__)
 
 /* PTL */
 #define INTEL_PTL_IDS(MACRO__, ...) \
-- 
2.25.1

