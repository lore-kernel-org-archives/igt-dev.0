Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71CEC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 14:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507F611A4CD;
	Thu, 25 Apr 2024 14:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzam0Lv3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CF711A4CD
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714055994; x=1745591994;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PeSEWGos9r0jicY30DO6BpURv3qDQ/UZ+eUIYGtW/4s=;
 b=mzam0Lv3/cg06jnALAvxHEwsR7de9W97morzvdJTerA5u225uSAdd3CQ
 KKUWBlKrPCZKiEOdQ7xFu4Ut6OHWQJB6keuN9k+LftTW+GYNR95eZqxNt
 l7dhmEiVIb/FDJOeeIsgeiqV613qBxAQwDdTRkOc1YE2xwLiuVuvq7ej8
 VBS/FeS/nYrjEaIf/KhZZiSAsxXQxJm8ra9qMp6Gg3xuEdupsX8DUrHt7
 hv7Hc0mWOYw9X/d9vYwdrSt5nuQGr1/WW4CyK1AkKCnbiN4+1OdcRKpeR
 ofU4XS99Kv8b8JGNPtuQJqqW6FY9Gw0R9zFx9TQdjkQL+BGPvshyvs2f5 Q==;
X-CSE-ConnectionGUID: HWOg8xe8QjeeJUWN1z/7vA==
X-CSE-MsgGUID: lJ5dPXU8QqiMRDDQGw+acQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="35140883"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="35140883"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:39:53 -0700
X-CSE-ConnectionGUID: lxHGmx3pSlWVj4afjoWfJw==
X-CSE-MsgGUID: G+rOfC89SPmJ6TReDXUENQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="24967735"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.53])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:39:51 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_queue_property: move skip into
 subtest
Date: Thu, 25 Apr 2024 16:39:46 +0200
Message-ID: <20240425143946.62074-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Skips in fixture are safe to use just after begin of igt_main()
when they be working for all subtests. Later on, when used in
fixture they can mislead developers reading logs, so move one
into respective subtest.

v2: use bool var instead of fd (Zbigniew)

Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_queue_property.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 57baae305..c3a3751cb 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -203,7 +203,7 @@ igt_main
 	const char *property[][3] = { {"timeslice_duration_us", "timeslice_duration_min", "timeslice_duration_max"},
 	};
 	int count = sizeof(property) / sizeof(property[0]);
-	int sys_fd;
+	bool has_sysfs;
 	int xe;
 	int gt;
 
@@ -233,14 +233,20 @@ igt_main
 
 	igt_subtest_group {
 		igt_fixture {
-			sys_fd = igt_sysfs_open(xe);
-			igt_require(sys_fd != -1);
-			close(sys_fd);
+			int sys_fd = igt_sysfs_open(xe);
+
+			if (sys_fd != -1) {
+				close(sys_fd);
+				has_sysfs = true;
+			} else {
+				has_sysfs = false;
+			}
 		}
 
 		for (int i = 0; i < count; i++) {
 			for (typeof(*tests) *t = tests; t->name; t++) {
 				igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
+					igt_require(has_sysfs);
 					xe_for_each_gt(xe, gt) {
 						int engines_fd = -1;
 						int gt_fd = -1;
-- 
2.42.0

