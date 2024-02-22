Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B476C48BEB
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 07:43:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A8310E73E;
	Thu, 22 Feb 2024 07:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpGtJHrp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A39E10E73E
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708587821; x=1740123821;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=h1KtYOQ6fX+6xO3GIdxqJEr4uK//dvaHRgnVFiG1OLY=;
 b=mpGtJHrphJS2X9K4q8r7PmnMeB1TzY0FQXH0eIqT9T0T8MifDusTwEvg
 IWEBs06qExkrWlCpiwBNRQjWJFp6YhD//WeKtdOVwOdIHxkR24khPiEUp
 8sqEj2EoCqz2Jc+7wLNr+K04Rh53DDVBtOWJEQqJSl7nKO7eOIQm8Jq4S
 sfsgvjX5Z02QE8msVH981AbcER4N5reaq6xVH4a2LWkUy9JAaeZbTKpyP
 NaQ/sttCJrNB63EmXP9H96SvVvVyMEXygmQ9K3Zk/Pm84clVYZsQ1BjeG
 Hb/XcHlrUEm7tpJAnlsNJFIY2C59Rl+We97zwdyxiW3D+IH5iExmJlrt1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2680641"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2680641"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 23:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5299797"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 23:43:41 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 45174580D54
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 23:43:40 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rd3k2-00000000jCd-1jlU for igt-dev@lists.freedesktop.org;
 Thu, 22 Feb 2024 08:43:38 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] intel/xe_test_config.json: add sriov_basic.c
Date: Thu, 22 Feb 2024 08:43:37 +0100
Message-ID: <20240222074337.173747-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The tests there are currently not included as part of Xe scope.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/xe_test_config.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 3944a9c8028b..22b43ffac2e1 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -2,7 +2,7 @@
     "description": "JSON file to be used to parse Xe documentation",
     "name": "Tests for Xe Driver",
     "drivers": [ "xe" ],
-    "files": [ "xe_*.c", "../core_hotunplug.c", "intel_hwmon.c" ],
+    "files": [ "xe_*.c", "../core_hotunplug.c", "../sriov_basic.c", "intel_hwmon.c" ],
     "fields": {
         "Category": {
             "_properties_": {
-- 
2.43.2

