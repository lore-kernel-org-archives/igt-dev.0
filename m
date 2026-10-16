Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA1DCCA462
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 07:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F9F10E030;
	Fri, 16 Oct 2026 07:46:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D130C10E030
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 07:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792136708; x=1823672708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JMQxEucOpcmVE3qiomsv81V1z5HoKK0PXF0NAWu75gw=;
 b=Z0B81gGvTkZ+yw1oxxTLilSRexhllzXpCtH6GXNNaCPNU3bT23Ck7G9u
 oUWJMRZV5PGcRqX5FGS+Ph8XpYyv7BAuFTZq6e+6bRapem63MidMg4DF9
 K4pgmpOwkKYJXyltLSh7VSE9uEwjXFhuQv8ofpoowwSzsf3PevHg4ayc9
 e/dzSMoHb6AvTSmJAQm0W2Np65vVFcVdlgFG4/ahSUBCcaqnFRtnN3KO6
 ECaKQ2VRx85gQPs0iLvIVJ0XAQFsSjzGPfDS26OVQ9Uza29gP0uzZ4Dxf
 WpF/FFl0ymUUM8RCSRYkjqqiifN86S6UdBqVY/4WtoYvXuJPPbZNrzqHb g==;
X-CSE-ConnectionGUID: nUODjF0bSgKRnP3kTp3OJg==
X-CSE-MsgGUID: VlQjNLceS1yuttigQk/g+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="909992"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="909992"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:45:07 -0700
X-CSE-ConnectionGUID: B6XWKvP7RgysU6TowZB7SA==
X-CSE-MsgGUID: Qul52Ko+Rpu8Et5vlXK5DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2307962"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa010.jf.intel.com with ESMTP; 16 Oct 2026 00:45:06 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, nishit.sharma@intel.com, shuicheng.lin@intel.com,
 kamil.konieczny@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH] tests/intel/xe_wedged: ignore expected GuC error in dmesg
Date: Fri, 16 Oct 2026 13:15:02 +0530
Message-ID: <20261016074501.458311-2-mallesh.koujalagi@intel.com>
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

Ignore the expected GuC uncorrectable local error message seen
during wedge tests.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 tests/intel/xe_wedged.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index fe8ea6969..a75433c91 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -55,6 +55,7 @@ static void ignore_wedged_in_dmesg(void)
 				    "|EngineInstance: [0-9]+"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"
+				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: GuC: Uncorrectable local error!"
 				    "|SIGID=203");
 }
 
-- 
2.48.1

