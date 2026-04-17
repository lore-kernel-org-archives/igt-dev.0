Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF35F8E4B5
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 07:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248D810E987;
	Fri, 17 Apr 2026 07:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7x1Tjek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7DE10E988
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 07:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776410965; x=1807946965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iYRz+vsAe8Fk+wSmEK4xYYO3DgC4Coumrbo1IT8kHDE=;
 b=a7x1TjekfDVgKhAlRaBHkPDGRGSy0dz7krKQ75axJaMz/lJnxY17wshT
 YKL98uMekqmxoR8ZrFDuXeKqDjpKVQNm6Dt14v9YwRfE5xQ/CpTRPvLoD
 pPD+2WkuWMaq+Aal8hErUMUL6tU3F7R6QhArxwU0Y6SHHiMvsNRZb6Ysb
 blQ3xCfgaQW/GEAdqU3KMk6Ty15K9UVHLflaEk7ehw6aIknZdjsiag4CE
 e7PZ5pqS0dMtMW9UclMjcxQHQmrQeE4l8oJ05sGnRrXo9Ajw6ta19dGLw
 BmRwiz9SVhggagkqCoenJ9rbWuDk7DxOkXBwOaDtEEpXBunT0M0mwdGc5 w==;
X-CSE-ConnectionGUID: jYJbtgEHTXGeY5Makuds0w==
X-CSE-MsgGUID: pxga2pfiRky9ZEpAYP9f5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81021124"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81021124"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:29:24 -0700
X-CSE-ConnectionGUID: edzmaR6bTS+LJpy3zLOUNA==
X-CSE-MsgGUID: BvToY7ZGReGCVclRjVcT4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="268985268"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:29:23 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 2/4] tools/intel_vbt_decode: dump eDP joiner enable field
Date: Fri, 17 Apr 2026 12:44:30 +0530
Message-ID: <20260417071432.2252380-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260417071432.2252380-1-ankit.k.nautiyal@intel.com>
References: <20260417071432.2252380-1-ankit.k.nautiyal@intel.com>
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

Add decoding support for the eDP joiner enable field introduced
in VBT version 261+.

v2: Use pipe_joiner_enable to match with kernel variable name. (Karthik)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tools/intel_vbt_decode.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index d4aada743e42..1cf2d7d352ab 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2483,6 +2483,10 @@ static void dump_edp(struct context *context,
 		if (context->bdb->version >= 251)
 			printf("\t\teDP DSC disable: %s\n",
 			       YESNO(panel_bool(edp->edp_dsc_disable, i)));
+
+		if (context->bdb->version >= 261)
+			printf("\t\teDP Joiner Enable: %s\n",
+			       YESNO(panel_bool(edp->pipe_joiner_enable, i)));
 	}
 }
 
-- 
2.45.2

