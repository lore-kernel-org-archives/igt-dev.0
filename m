Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC971C25B78
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 16:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C6110E85C;
	Mon, 13 May 2024 16:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/dDhbM2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825DC10E85C
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 16:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715617434; x=1747153434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dlI/TSO1DYAXN3TPXWNstbE+FiTsZdlQPv8N9m2YKJo=;
 b=E/dDhbM2P7bS3FNGF6lZZ2Hj5+QoDH74yxOMzhzFEzBoWexgeMVKVZ5b
 SD0+AI69nowioo6eLyqMDlOfP3Tu5fC0OPFIcm8fXG7UuGyVKMPQ2e3ZX
 ahJRt0pRInkMPaZBqkhb2z5zD9C9zwWLS4cowqWVncP33FFunmgXivQ+M
 tbD3Jmzr9nB954wsaUA+8IYlRYW5cgWZm+rbg2KHYKYK+aKsXzo32ZGEG
 wxJqFswoJ3+vrBnsg41Wn4vaGbJTKw0CRr+25ipKOzlLjpKMin04LmyTd
 f8MdPbK0EuW4/CKEDDzE5oowPaoR7r/iW4RQ4ElgE1X0fGunFuBGBqXFQ g==;
X-CSE-ConnectionGUID: lHHIw0f0S/OKVl4wfWeV0g==
X-CSE-MsgGUID: 6ziZSpCDSWaq9uW6cJLO5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11500846"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11500846"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 09:23:53 -0700
X-CSE-ConnectionGUID: aOr1HxjcSSyQoYuUj9c7Ug==
X-CSE-MsgGUID: yBPVF8g/Q/mbtUiw3KHF/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30424792"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 09:23:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/xe_pm: Move mocs documentation to the
 right place
Date: Mon, 13 May 2024 09:24:33 -0700
Message-ID: <20240513162435.952578-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240513162435.952578-1-lucas.demarchi@intel.com>
References: <20240513162435.952578-1-lucas.demarchi@intel.com>
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

{s_state}-mocs is not tested by test_exec(). Move it on top of the right
function.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_pm.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 1215b5c2a..584cb8548 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -251,10 +251,6 @@ static void close_fw_handle(int sig)
  * Description: suspend/autoresume on %arg[1] state and exec after RPM
  * Functionality: pm - %arg[1]
  *
- * SUBTEST: %s-mocs
- * Description: test checks for mocs state before and after %arg[1] state
- * Functionality: pm - %arg[1]
- *
  * arg[1]:
  *
  * @s2idle:	s2idle
@@ -624,6 +620,17 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
  * Functionality: mocs
  * Run type: FULL
  */
+/**
+ * SUBTEST: %s-mocs
+ * Description: test checks for mocs state before and after %arg[1] state
+ * Functionality: pm - %arg[1]
+ *
+ * arg[1]:
+ *
+ * @s2idle:	s2idle
+ * @s3:		s3
+ * @s4:		s4
+ */
 static void test_mocs_suspend_resume(device_t device, int s_state)
 {
 	int gt;
-- 
2.43.0

