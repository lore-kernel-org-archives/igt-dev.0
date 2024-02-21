Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22536C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 11:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D9210E56E;
	Wed, 21 Feb 2024 11:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgU42AXR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA90910E56E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708514975; x=1740050975;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E4e7Qt8H1sTEXXhYZEdL+wcUIXhUVFk7tSd7se62ZtU=;
 b=GgU42AXRiad/i3gy8vTDmQ+VPiMFD29rqPZAC0TfP1x7sZCOKDikT1pE
 Eq7X4bNa+PqubPx/QNQAMnPoS8xjAdSoi7FapTUiVru1ZnW4uf7R5K1rD
 d09SJreSRms9KBbMZS+FYUsMI6MI2v3PN6wxm2FCmyzboWFass1ny6Ye+
 6avs5EB50MHQYvINQDKOAciGuK2TxHbM/qdD9CDy/2Py5FR79c226IozW
 hVZyKmhmubD5H3M87uYT+muY84UwoF5pdupVkF54XSr6NpQHpYbHm3sZ4
 f3LBPh32db+gJr5F38I+IYZ2392hGeiZWY0yEtqUj2llodX/rp0urZzL8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2576227"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208,223";a="2576227"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 03:29:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208,223";a="9748725"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 03:29:33 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 1/2] lib/i915/intel_drrs: Update DRRS capability check
Date: Wed, 21 Feb 2024 16:53:40 +0530
Message-ID: <20240221112341.2329405-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
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

From debugfs "i915_drrs_status" read the DRRS capability as
"DRRS capable: yes", instead of "DRRS enabled: yes".

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/i915/intel_drrs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/i915/intel_drrs.c b/lib/i915/intel_drrs.c
index 9c6aefbf6..ac8dd5e61 100644
--- a/lib/i915/intel_drrs.c
+++ b/lib/i915/intel_drrs.c
@@ -30,7 +30,7 @@ bool intel_is_drrs_supported(int device, enum pipe pipe)
 	igt_debugfs_simple_read(dir, "i915_drrs_status", buf, sizeof(buf));
 	close(dir);
 
-	return strstr(buf, "DRRS enabled: yes");
+	return strstr(buf, "DRRS capable: yes");
 }
 
 /**
-- 
2.43.0

