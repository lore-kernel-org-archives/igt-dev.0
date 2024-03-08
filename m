Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD68C54E4A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 08:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A961137AC;
	Fri,  8 Mar 2024 08:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOw255DR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82831137AC
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887272; x=1741423272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3YUEIyijPuu21vOCA4aUVG1wKj4KRqf/wxmquFmDJMc=;
 b=QOw255DR277moqItSY+LKFiv3A7Q5iTYYtDxXqVHpVpG+DsLtJfoE+WT
 O2jon3wRy+E14ifOdLqSV9cUBuZeXYXQ6oBKMmCOF1s2IpmCLnkbkcS8V
 DOWVcY7UWBfXSHIA6gbr5vZMPsxjUx40Q0kGzB1PUuqLd18DPDPUi36Ux
 W1yWPhCkjNFlgse+eFkr8zW2IXM4FxMU3SzhfojFO01yFSMsDaJ3gvSPw
 KdxERT6fvNm+zyowcBHgoEdVrCYdP5LEqkMiwyDATLf3r/XbR1sLWdyFf
 eQ39o5iscxBbTLuzMP7LoQXHHEy3h0/mB5W1mDT5wirkPBrvoODDqlMyq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4725383"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4725383"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10276643"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:41:10 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 25/25] tests: Update device_reset functionality
Date: Fri,  8 Mar 2024 08:36:57 +0000
Message-Id: <20240308083657.1092049-26-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
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

There is a need to keep Sub-category and Functionality different, so
automation tools can work properly.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/device_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 018c8a9ac..d7163b277 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -20,7 +20,7 @@
  * Description: Examine behavior of a driver on device sysfs reset
  * Category: Server
  * Feature: reset
- * Functionality: reset
+ * Functionality: sysfs reset
  * Sub-category: Reset
  * Test category: GEM_Legacy
  *
-- 
2.34.1

