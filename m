Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED5AC7115E
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 05:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7A210E348;
	Thu, 29 Aug 2024 05:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j328W4Ka";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A4210E315
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 05:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724909049; x=1756445049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WKHnnU/AYNQLNkXCFTjSGiFmtVx3zfQbzw9EGrA0i1g=;
 b=j328W4Ka5Hz4KDURyRdsVPQgaIbel8yYx4tO1OJc26pULs8oWZisNMh4
 a/hHm/YQ4XtSpl99dfoZQAhmFO6uzDb1m58UeH8HpS4euMO44LqmiggWs
 lh5DV+roNvRZzQb2I4/pUuJJfrtGiDjFbG5w4pcgTXI01Uw7WYcpsuXLO
 yy+NvHR1pMIKB1wxZMqUZadxxsA8JohCCoW0zzmaGtUZ1CI40YVkAwHcM
 qtAHzfiihVDZaisgGsNLo+KNspW91mReJEyOeijWok5K8GlpaGVXPNNby
 oHd0JyFzCiLqx8CBuvyvHfq3uVnXjvOLNoWWJ9bJUdXwcNfTFj8NY5vFq g==;
X-CSE-ConnectionGUID: sTZ0whX6RMWve6PLWRvkNg==
X-CSE-MsgGUID: bTzrMHbKQz2kwNrQqjGfnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27352870"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="27352870"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 22:24:08 -0700
X-CSE-ConnectionGUID: Wh/6AA5jQwCnjkJWQ+46Dg==
X-CSE-MsgGUID: D4guudrbTtmpqkYvesvt6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="94200505"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 22:24:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [CI i-g-t 4/5] tests/intel/xe_drm_fdinfo: Use usec for batch duration
Date: Wed, 28 Aug 2024 22:23:53 -0700
Message-ID: <20240829052354.1872909-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240829052354.1872909-1-lucas.demarchi@intel.com>
References: <20240829052354.1872909-1-lucas.demarchi@intel.com>
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

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 1b5980752..7879dff34 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -73,7 +73,7 @@ struct pceu_cycles {
 	uint64_t total_cycles;
 };
 
-const unsigned long batch_duration_ns = (1 * NSEC_PER_SEC) / 2;
+const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 2;
 
 static const char *engine_map[] = {
 	"rcs",
@@ -515,7 +515,7 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
 	if (flags & TEST_ISOLATION)
 		read_engine_cycles(new_fd, pceu1[1]);
 
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		spin_sync_end(fd, ctx);
 
@@ -551,7 +551,7 @@ busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int fl
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		spin_sync_end(fd, ctx);
 	read_engine_cycles(fd, pceu2);
@@ -578,7 +578,7 @@ single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
 	spin_sync_start(fd, ctx);
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 
 	/* destroy queue before sampling again */
 	spin_sync_end(fd, ctx);
@@ -617,7 +617,7 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		xe_for_each_engine_class(class)
 			spin_sync_end(fd, ctx[class]);
@@ -661,7 +661,7 @@ all_busy_check_all(int fd, unsigned int flags)
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		xe_for_each_engine_class(class)
 			spin_sync_end(fd, ctx[class]);
-- 
2.43.0

