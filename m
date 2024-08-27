Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9445C5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A99B10E3B0;
	Tue, 27 Aug 2024 16:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JC4wvUsS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AB110E3B0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724777697; x=1756313697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2FvmIO1vkKEOkvtDDhuOq/MBCWycu38sHJDuczkpNQU=;
 b=JC4wvUsScDZp16+9gQ0AAGg1b38GpX/J5x/XPYwe3IvWFm/7VxYJZQQJ
 NmgwdwpOF44F+zUXFso1JsAsHgHQIgAHkdYpBWtjDoTdz2M1Gk7RxfT0B
 0JiQmvjG7XLw4B3plT6COZCJeX+c9GCs6ryz5SKi0+bDxJoADVktrDRyw
 S3vQ4URfwFHqgBISCBzecHD20dKBT7K9us2NZxHT5A/lfggt0xtX/M1TK
 KqNFzcNz2k56BC9lpzQmFAInlO9kMhumn03igd84H94jzmWyO2+AQS5ed
 E3ck+NwkXflU1gjpDgd4EhaVXdkcwvnFAEu3xt/RSGhMxyRD6UD95KrBR A==;
X-CSE-ConnectionGUID: Nw8t8i3PQeegGFFZev4r7Q==
X-CSE-MsgGUID: WpykkldlRVCzll8OZaCUsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="45787334"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="45787334"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:54:56 -0700
X-CSE-ConnectionGUID: PZ9iCw4gTnq3wzS0pzjm+g==
X-CSE-MsgGUID: 8jMuR4wvRg+8FI6w6nm9uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63640426"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:54:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 06/10] tests/intel/xe_drm_fdinfo: Use usec for batch
 duration
Date: Tue, 27 Aug 2024 09:54:45 -0700
Message-ID: <20240827165449.1706784-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827165449.1706784-1-lucas.demarchi@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
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
index 68c21925c..9fb739fba 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -73,7 +73,7 @@ struct pceu_cycles {
 	uint64_t total_cycles;
 };
 
-const unsigned long batch_duration_ns = (1 * NSEC_PER_SEC) / 2;
+const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 2;
 
 static const char *engine_map[] = {
 	"rcs",
@@ -517,7 +517,7 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
 	if (flags & TEST_ISOLATION)
 		read_engine_cycles(new_fd, pceu1[1]);
 
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		spin_sync_end(fd, ctx);
 
@@ -553,7 +553,7 @@ busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int fl
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		spin_sync_end(fd, ctx);
 	read_engine_cycles(fd, pceu2);
@@ -580,7 +580,7 @@ single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
 	spin_sync_start(fd, ctx);
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 
 	/* destroy queue before sampling again */
 	spin_sync_end(fd, ctx);
@@ -619,7 +619,7 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		xe_for_each_engine_class(class)
 			spin_sync_end(fd, ctx[class]);
@@ -663,7 +663,7 @@ all_busy_check_all(int fd, unsigned int flags)
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		xe_for_each_engine_class(class)
 			spin_sync_end(fd, ctx[class]);
-- 
2.43.0

