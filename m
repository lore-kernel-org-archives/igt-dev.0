Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F2EC25B7A
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 05:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F86A10FF14;
	Tue, 28 May 2024 05:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nm7u89kd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC1E10FD14
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 05:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716875386; x=1748411386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tz+RAkd41bBOoeJy6UsxUvc/u9k9a37TBi28y3cWbIc=;
 b=Nm7u89kdFhLdE/NJNyac16Eyqzo2jrMBh0f9Idnj07Y1Q+jshxO9bovo
 v1ffI2u+tfvP6d+qLLaCmUqQNKphMMUfd4q0lIThUZvAxDoL4jE2MYGOV
 xgQ75oTJRS8Sj85FmfK3OsO9nADl5DTMI0ttXqTqT/PxwsnqmZGLxwcjJ
 eRRF3a8tSxu/cUFSiaS46nDvJr+BtDxQ9f3oVcXrjviY30ENuV9V1EBqr
 haMnJDgznYJiyMWiUDWyz0lpc3Co3ooZWJC7B7rN0+YRqYSgTtfgJpKSS
 gGKceQBdyrsfhO5bBrJqf0FWSWpRouNPW/Imc5OcmXkuCeF+OOm+rjgh2 g==;
X-CSE-ConnectionGUID: pJsrIK6MT2ODgEQ3dLSueA==
X-CSE-MsgGUID: WpEZrLfRQ+aJcZ27PdlxIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24615874"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="24615874"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:49:46 -0700
X-CSE-ConnectionGUID: rhGMIhwBTxuXEYrQNz5q6Q==
X-CSE-MsgGUID: TOvHKRY4TCG6pL2NvbyeJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="66165869"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:49:45 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/5] tests/fbdev: Add testplan documentation
Date: Tue, 28 May 2024 11:12:20 +0530
Message-ID: <20240528054223.2945356-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
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

Add testplan documentation to fbdev tests.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/fbdev.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 794882a6a..f329e6ac6 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -21,6 +21,15 @@
  * IN THE SOFTWARE.
  */
 
+/**
+ * TEST: fbdev
+ * Category: Display
+ * Description: Sanity test for framebuffer device.
+ * Driver requirement: i915, xe
+ * Functionality: fbdev
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
 #include "config.h"
 
 #include "igt.h"
@@ -39,6 +48,36 @@
 
 #include "igt.h"
 
+/**
+ * SUBTEST: eof
+ * Description: Check framebuffer access near EOF
+ *
+ * SUBTEST: info
+ * Description: Check if screeninfo is valid
+ *
+ * SUBTEST: nullptr
+ * Description: Check framebuffer access with NULL
+ *
+ * SUBTEST: pan
+ * Description: Check panning / page flipping
+ *
+ * SUBTEST: read
+ * Description: Check read operations on framebuffer memory
+ *
+ * SUBTEST: write
+ * Description: Check write operations on framebuffer memory
+ */
+
+/**
+ * SUBTEST: unaligned-%s
+ * Description: Check %arg[1] operations on unaligned locations in framebuffer memory
+ *
+ * arg[1]:
+ *
+ * @read:	read
+ * @write:	write
+ */
+
 #define PANSTEP(panstep_) \
 	((panstep_) ? (panstep_) : 1)
 
-- 
2.43.2

