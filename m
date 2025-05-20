Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E2FC54E90
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 23:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9395010E5C0;
	Tue, 20 May 2025 23:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SBUXkea/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB87310E588
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 23:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747783263; x=1779319263;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uAaLUBTRhanjX5UEpVkzY5PEK2cX8ICRUqqkvPE+kIk=;
 b=SBUXkea/CbP5wOYbOTmgFxt90q/tqWJRbj1w4pZdTvx298Mk5UdFk/1k
 pqw4FwRE9OGC5wHdY/zHmMzXTRk+NcAoJ1KF96aB3Z7aBCIeSnzwTEBTl
 u3kA6VduuvVpgvKKxOm1I2bmQ/b7j38cGkSQXOM+LsUULOqQ8/bg+s4QA
 wLKRqGmreW3SQHV1tnENZxiMmlElQxjAkZou3UQXLr8icfB5WEEmT32HS
 J+cPC0Hsf1bsyIIWo66pp8um2lT3w8DIDCqYQ0v+IRVeE1W5Zi9rypqHq
 v1n4k1GHo1Dh4iR570NaV4k1MnmyIFhmOxkBGebZsZ7sAy8JCQD9ncxn2 w==;
X-CSE-ConnectionGUID: j5AYbMJWTcSk6jveuiiREg==
X-CSE-MsgGUID: Ewq7PIEfQamhKoviDMzrHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49875547"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49875547"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 16:21:01 -0700
X-CSE-ConnectionGUID: wa/JWqYzQZq8/d+Lp2dO/g==
X-CSE-MsgGUID: 05JqE9CuRH2R0Q45cIHtaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="145095700"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 16:21:00 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH i-g-t 1/4] tests/intel/xe_drm_fdinfo: Use end_cork helper to
 end the spinner
Date: Tue, 20 May 2025 16:20:29 -0700
Message-ID: <20250520232027.351497-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520232027.351497-6-umesh.nerlige.ramappa@intel.com>
References: <20250520232027.351497-6-umesh.nerlige.ramappa@intel.com>
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

Some cases require checking if the cork is null before calling the
library function. Wrap this into a helper.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 9a8811b4cd2f..83b7cd617c34 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -423,6 +423,12 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 	}
 }
 
+static void end_cork(int fd, struct xe_cork *cork)
+{
+	if (cork && !cork->ended)
+		xe_cork_sync_end(fd, cork);
+}
+
 static void
 utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
 {
@@ -450,7 +456,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 
 	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
-		xe_cork_sync_end(fd, cork);
+		end_cork(fd, cork);
 
 	read_engine_cycles(fd, pceu2[0]);
 	if (flags & TEST_ISOLATION)
@@ -497,7 +503,7 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
 	usleep(batch_duration_usec);
 
 	/* destroy queue before sampling again */
-	xe_cork_sync_end(fd, cork);
+	end_cork(fd, cork);
 	timestamp = cork->spin->timestamp;
 	xe_cork_destroy(fd, cork);
 
@@ -526,7 +532,7 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
-	xe_cork_sync_end(fd, cork);
+	end_cork(fd, cork);
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
@@ -568,10 +574,8 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
-	xe_for_each_engine_class(class) {
-		if (cork[class])
-			xe_cork_sync_end(fd, cork[class]);
-	}
+	xe_for_each_engine_class(class)
+		end_cork(fd, cork[class]);
 
 	read_engine_cycles(fd, pceu2);
 
@@ -613,10 +617,8 @@ utilization_all_full_load(int fd)
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
-	xe_for_each_engine_class(class) {
-		if (cork[class])
-			xe_cork_sync_end(fd, cork[class]);
-	}
+	xe_for_each_engine_class(class)
+		end_cork(fd, cork[class]);
 
 	read_engine_cycles(fd, pceu2);
 
@@ -692,7 +694,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 
 	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
-		xe_cork_sync_end(fd, cork);
+		end_cork(fd, cork);
 
 	read_engine_cycles(fd, pceu[1]);
 	if (flags & TEST_ISOLATION)
-- 
2.43.0

