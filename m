Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03D9D35176
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 11:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5371210ECE4;
	Wed,  1 Apr 2026 11:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWRM3twM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D65010ED24
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 11:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775043342; x=1806579342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gWiBkP1wZXl6V9YE2KUAiu8oDgJw67p12HDOaqxgmJQ=;
 b=UWRM3twMj2Kd10SQTbQoKPtY5zibbFVCT6ssghtNsOYpLPtpx077MZ3s
 K/LzA48JlWtEQvh1WUjxorZrkafrT+4GqxFNK1empy369E6E0eHnD4p4o
 fOs9PUXHAFIVnPkrg+o5xaz3lrULfmZr6mrviiFV10T3iFzySn8WFYyow
 KjgV30TNjEeGYrEKQaPBtpRbsl+2v29CDSfvJNg0C3Zbi589x25fzWuEL
 4TpTQ8SfkN2zW9xDxzU2KGQMmR8fpGfd01tE7m/uK8BxqNxkNLEGF4Rny
 2RuzDTcRSzmNL8/sWEkbq6MWQUieMxDxeeJSoTan24TcwdOpzetyDNL/Z w==;
X-CSE-ConnectionGUID: Ngt911FUR36gQSC7VD5Dyw==
X-CSE-MsgGUID: A85OO4IIRYaSioHI0qftQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78669796"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="78669796"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:35:42 -0700
X-CSE-ConnectionGUID: gwbyU7uOSwCH31yhjuMcdA==
X-CSE-MsgGUID: VuCmXOV4SwKj9gpEQiFH2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="228263467"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 04:34:22 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/6] tests/intel/kms_mst_helper: Add kernel-doc for
 existing function
Date: Wed,  1 Apr 2026 17:25:37 +0530
Message-Id: <20260401115542.1074290-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260401115542.1074290-1-kunal1.joshi@intel.com>
References: <20260401115542.1074290-1-kunal1.joshi@intel.com>
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

Convert the doc comment on igt_find_all_mst_output_in_topology
to proper kernel-doc.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_mst_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
index aef74cd31..38859cffc 100644
--- a/tests/intel/kms_mst_helper.c
+++ b/tests/intel/kms_mst_helper.c
@@ -5,11 +5,12 @@
 
 #include "kms_mst_helper.h"
 
-/*
+/**
+ * igt_find_all_mst_output_in_topology:
  * @drm_fd: DRM file descriptor
  * @display: pointer to #igt_display_t structure
  * @output: target output
- * @mst_outputs: filled with mst output of same toplogy as @output
+ * @mst_outputs: filled with mst output of same topology as @output
  * @num_mst_outputs: filled with count of mst outputs found in topology
  *
  * Iterates over all connected outputs and adds each DP MST
-- 
2.48.1

