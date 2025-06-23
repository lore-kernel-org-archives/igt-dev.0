Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EA6C7115B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 13:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8215810E15C;
	Mon, 23 Jun 2025 13:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h6uEo9aH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DF910E15C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750684635; x=1782220635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o/cUP0RmDJ2q8HtV7RBUEH+D8E9ZoJdn8D70vXTP/9k=;
 b=h6uEo9aH7DYUsLBSUcYM6q+2k03YCPpk89EegG61zNS+VMHnWqAFxKfu
 IpguSYrm4VCW2rXr98UyDT7UKjaWpRvas7RVFIBlU+YPCn0be7O85G0yF
 8/ULK4sXUFD7asJCC7lpWiXkAwqFycddxjEWpO0wzOCF6Z3U/Mgeav+wh
 VutFiY33NcoXvCvfz7n8dU+wKuJfBsDldkkEfkrvQ7VmC03eybxiIsvkO
 p0WKh7DvjwVHaibvedcNBuB5ozcs8DEA34FcruW0r3u3xVmYh0rAw+hz1
 GrmL1vI0EBToz748+cw04T5tBDmUbR9NtzFT9V6wcWDCJgf19ON5YIVu5 g==;
X-CSE-ConnectionGUID: xizo4dqNQdycfc5MBX8KWg==
X-CSE-MsgGUID: Bosm+sFFSICG8ekck2Z5Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="55524360"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="55524360"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 06:17:15 -0700
X-CSE-ConnectionGUID: W0SuXtbIRwGg0hx/8+gnAg==
X-CSE-MsgGUID: m6x+TlD/Tw2BKWIA1X5RPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="157383965"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 06:17:12 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH i-g-t] lib/pciids: Sync pciid's with kernel commit 9b779ff
Date: Mon, 23 Jun 2025 19:02:57 +0530
Message-Id: <20250623133257.3807750-1-kunal1.joshi@intel.com>
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

As per updated Bspec, Sync PCI IDs

Sync with the following kernel commits:
9b779ff ("drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg")
49c6dc7 ("drm/xe/ptl: Update the PTL pci id table")

v1: Sync with kernel commit (Jani/Tejas)
v2: Specify both kernel commits in subject (Tejas)

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Link: https://lore.kernel.org/r/20250605190804.1287289-2-dnyaneshwar.bhadane@intel.com
Link: https://lore.kernel.org/r/20250520195749.371748-1-matthew.s.atwood@intel.com
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 lib/pciids.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/pciids.h b/lib/pciids.h
index d212848d0..129c3172a 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -852,8 +852,11 @@
 	MACRO__(0xE210, ## __VA_ARGS__), \
 	MACRO__(0xE211, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__), \
-	MACRO__(0xE215, ## __VA_ARGS__), \
-	MACRO__(0xE216, ## __VA_ARGS__)
+	MACRO__(0xE216, ## __VA_ARGS__), \
+	MACRO__(0xE220, ## __VA_ARGS__), \
+	MACRO__(0xE221, ## __VA_ARGS__), \
+	MACRO__(0xE222, ## __VA_ARGS__), \
+	MACRO__(0xE223, ## __VA_ARGS__)
 
 /* PTL */
 #define INTEL_PTL_IDS(MACRO__, ...) \
@@ -861,6 +864,10 @@
 	MACRO__(0xB081, ## __VA_ARGS__), \
 	MACRO__(0xB082, ## __VA_ARGS__), \
 	MACRO__(0xB083, ## __VA_ARGS__), \
+	MACRO__(0xB084, ## __VA_ARGS__), \
+	MACRO__(0xB085, ## __VA_ARGS__), \
+	MACRO__(0xB086, ## __VA_ARGS__), \
+	MACRO__(0xB087, ## __VA_ARGS__), \
 	MACRO__(0xB08F, ## __VA_ARGS__), \
 	MACRO__(0xB090, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
-- 
2.25.1

