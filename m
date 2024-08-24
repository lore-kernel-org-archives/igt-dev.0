Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F018C5472E
	for <igt-dev@archiver.kernel.org>; Sat, 24 Aug 2024 06:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A726A10E1A7;
	Sat, 24 Aug 2024 06:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3UD6/x4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35AE10E1A6
 for <igt-dev@lists.freedesktop.org>; Sat, 24 Aug 2024 06:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724480719; x=1756016719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5/b2Olvv4EMgHPjDqRLQ6/Uh2XJp6zuPhC79Q40TXUw=;
 b=V3UD6/x4vk7l8WCu62PmN+rZ4rDHtjUqxGSSZhLYI2OySYoCWjE+vDqZ
 bCC+RYFoB7N1rn3us9fKrezDWqjPl0Vah+n4eu7eOPaErMc+h+ZdZkCKf
 mLoQ8icznkCYcHcesnWyCCCY9rUITE00w0BMRHhFhvUL9H23EQS3u3GTQ
 ToaLRacL8g47vvx9X9zc5cfCwMJxnSfq3rqEr1O+Yi1NdFH22pQKSaMzv
 hOMR7e1EGcRif9+Hsf+ZS8cYdOyciurTS6pixw9/JGaekvq36xruzADO0
 gfYDBS1ZBCT960Vd+BiZ6HHVorGkWutPeykPQXYNwklsdDqgaPEmOQjOm A==;
X-CSE-ConnectionGUID: 8mdIT5dgR5y2/JZ9fe527A==
X-CSE-MsgGUID: AFS6rdyNQvy29Gz42JrJMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="23099885"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; d="scan'208";a="23099885"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 23:25:18 -0700
X-CSE-ConnectionGUID: ld5ArkbFQPup+ow0LFAb3A==
X-CSE-MsgGUID: WDJR0VP8SpC7K6JSLBxveQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; d="scan'208";a="62003940"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 23:25:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/5] tests/intel/xe_drm_fdinfo: Use usec for batch
 duration
Date: Fri, 23 Aug 2024 23:25:00 -0700
Message-ID: <20240824062504.1122536-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240824062504.1122536-1-lucas.demarchi@intel.com>
References: <20240824062504.1122536-1-lucas.demarchi@intel.com>
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

It's only used to control the time to usleep(), so use a better unit.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 4696c6495..aea73a4ae 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -73,7 +73,7 @@ struct pceu_cycles {
 	uint64_t total_cycles;
 };
 
-const unsigned long batch_duration_ns = (1 * NSEC_PER_SEC) / 2;
+const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 2;
 
 static const char *engine_map[] = {
 	"rcs",
@@ -511,7 +511,7 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
 	if (flags & TEST_ISOLATION)
 		read_engine_cycles(new_fd, pceu1[1]);
 
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		spin_sync_end(fd, ctx);
 
@@ -547,7 +547,7 @@ busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int fl
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		spin_sync_end(fd, ctx);
 	read_engine_cycles(fd, pceu2);
@@ -574,7 +574,7 @@ single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
 	spin_sync_start(fd, ctx);
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 
 	/* destroy queue before sampling again */
 	spin_sync_end(fd, ctx);
@@ -613,7 +613,7 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		xe_for_each_engine_class(class)
 			spin_sync_end(fd, ctx[class]);
@@ -657,7 +657,7 @@ all_busy_check_all(int fd, unsigned int flags)
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		xe_for_each_engine_class(class)
 			spin_sync_end(fd, ctx[class]);
-- 
2.43.0

