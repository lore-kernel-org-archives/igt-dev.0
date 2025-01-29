Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6CEC0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 10:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9714D10E7A0;
	Wed, 29 Jan 2025 10:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4QbGZgc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C7410E7A0
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 10:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738148350; x=1769684350;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l5l6KevZHTFTiXdPKWdjuLaxZpwG6Mu1bNx8Ih3teGo=;
 b=X4QbGZgc1m/ULl5jAapb0V9jqKAsSR3Z2RxF1jT+u30gLZen1XzM/uZp
 dUZEJR6Pa+hcVvirUP2jDbTsCEFWqM0MmSvAJicgFN2bLjwIfvswlsHOp
 v9BCFeocQym+82LIEBuPUtUfm7gXTt39HHeth1NncxC1HHuiDse8deMLU
 rYqQ5I6wQlokWZJlDLXnyNfeGrNG+P9YtSO+LA0w47+0FijoRBqEKOOJm
 0L/21OjMQF8N9nu6aqUIgbORjXx/fnpLqAlR5ujhSLb1YCPGV/ikfAGwu
 IJr+SG72XP/W7dAbjx7uws7ph1w+jCKnBYkOgWxjjhmviUen+7RJVNcpa Q==;
X-CSE-ConnectionGUID: dmqpP6viSt6rYzLIfkOWfw==
X-CSE-MsgGUID: sfEQgMZSRLWP9nyYBWNWvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50070838"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50070838"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 02:59:09 -0800
X-CSE-ConnectionGUID: o1vC0DcvTdOqWlS6BYq5Kg==
X-CSE-MsgGUID: dkD/qZabSWOEJkvozbSTGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="113985350"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.144])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 02:59:08 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t] lib/pciids: sync with kernel
Date: Wed, 29 Jan 2025 11:59:02 +0100
Message-ID: <20250129105902.120630-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

Align with kernel commit 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table").

It adds PTL pci ids and also brings few BMG from previous commit.

Cc: Matt Atwood <matthew.s.atwood@intel.com>
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://lore.kernel.org/intel-xe/20250128175102.45797-1-matthew.s.atwood@intel.com/
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/pciids.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/pciids.h b/lib/pciids.h
index 7883384ac..23f349f65 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -817,19 +817,20 @@
 	MACRO__(0xE20B, ## __VA_ARGS__), \
 	MACRO__(0xE20C, ## __VA_ARGS__), \
 	MACRO__(0xE20D, ## __VA_ARGS__), \
-	MACRO__(0xE212, ## __VA_ARGS__)
+	MACRO__(0xE210, ## __VA_ARGS__), \
+	MACRO__(0xE212, ## __VA_ARGS__), \
+	MACRO__(0xE215, ## __VA_ARGS__), \
+	MACRO__(0xE216, ## __VA_ARGS__)
 
 /* PTL */
 #define INTEL_PTL_IDS(MACRO__, ...) \
 	MACRO__(0xB080, ## __VA_ARGS__), \
 	MACRO__(0xB081, ## __VA_ARGS__), \
 	MACRO__(0xB082, ## __VA_ARGS__), \
+	MACRO__(0xB083, ## __VA_ARGS__), \
+	MACRO__(0xB08F, ## __VA_ARGS__), \
 	MACRO__(0xB090, ## __VA_ARGS__), \
-	MACRO__(0xB091, ## __VA_ARGS__), \
-	MACRO__(0xB092, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
-	MACRO__(0xB0A1, ## __VA_ARGS__), \
-	MACRO__(0xB0A2, ## __VA_ARGS__), \
 	MACRO__(0xB0B0, ## __VA_ARGS__)
 
 #endif /* __PCIIDS_H__ */
-- 
2.48.1

