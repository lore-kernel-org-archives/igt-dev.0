Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0038CFF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F0C10E2C4;
	Tue, 28 Apr 2026 04:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjXDVK5o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8359110E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351636; x=1808887636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xhbr0a2NxlyccVcFRMY0/jxEPob59S7MvIdp+pyNysE=;
 b=jjXDVK5oWn+pPIlU+rWAeHSxlUMaXUVSscLJ3GZV75G1WBM6H8v6xDkb
 9R238JFdSms5XVjwDos/0eRcFav4fCg5IcdQ8FaYOz13aSUuF9dH4b92y
 QqQXTFZeK1XLq8GLQb47oePMOhiQXMGLzD3pzJZgNNAiWNKqjCDayzh4v
 ao65do9yLKDqYs3MDld8+WyI0jsPMcdtQ0Wg4GX+MEqv+WDE2zwpvgAzo
 ax0lzqkSjYGuH6rcknBT6tdVcx4XJWYGOuoss87wet9nUHAmF5AhBDkRU
 Yoyx6qAboimrGsc6ACATHGnvMi/gt89gR7RxycTBUtUd74lZmks+qwBjl A==;
X-CSE-ConnectionGUID: f96CNWmGQdKbyLSYZjB08Q==
X-CSE-MsgGUID: KR2fx20LTrqPjYlNVjjLbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167807"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167807"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:16 -0700
X-CSE-ConnectionGUID: W7fWg4CkRNmmyO+Q+givKw==
X-CSE-MsgGUID: UJCod2QmQsSfuaLWP7YrYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706625"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:15 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 09/25] lib/monitor_edids: Fix missing names in some
 monitor EDID
Date: Tue, 28 Apr 2026 10:16:18 +0530
Message-ID: <20260428044644.257001-10-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

Some HDMI EDID did not have a good name identifier. Add one to avoid
confusion.

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/hdmi_edids.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index 398424177..26dffb7bf 100644
--- a/lib/monitor_edids/hdmi_edids.h
+++ b/lib/monitor_edids/hdmi_edids.h
@@ -241,7 +241,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "33333633493056465320000000fc0044"
 		  "454c4c20323430354650570a000000fd"
 		  "00384c1e5111000a20202020202000e9" },
-	{ .name = "`",
+	{ .name = "DEL_DELL_2407WFP_HDMI",
 	  .edid = "00ffffffffffff0010ac17a053575930"
 		  "0511010380342178eeee91a3544c9926"
 		  "0f5054a54b008180a940714fb3000101"
@@ -430,7 +430,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "60350000003200001c011d8018711c16"
 		  "20582c2500c48e2100009e0000000000"
 		  "0000000000000000000000000000000a" },
-	{ .name = "",
+	{ .name = "GSM_50294_M3704C_HDMI",
 	  .edid = "00ffffffffffff001e6d76c401010101"
 		  "2514010380522e78eaac27a355499b25"
 		  "10474aa1080081807140614045403140"
@@ -482,7 +482,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "5011000a202020202020000000fc0048"
 		  "50205a5232343430770a2020000000ff"
 		  "00434e34333132303836580a2020007f" },
-	{ .name = "",
+	{ .name = "HWP_10582_HP_ZR2440w_HDMI",
 	  .edid = "00ffffffffffff0022f0562901010101"
 		  "0b170103803420782afc81a4554d9d25"
 		  "125054210800d1c081c0814081809500"
-- 
2.48.1

