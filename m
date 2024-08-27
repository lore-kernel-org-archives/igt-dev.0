Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2669EC5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D330C10E245;
	Tue, 27 Aug 2024 05:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lj8vg9v+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E99510E03D
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737374; x=1756273374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s5onfmEJAjn+W0LjuJquAHhQArSvS/lu6CGftKyoJJM=;
 b=Lj8vg9v+9mGMRlC8wtzFO558WrF0H3Fi3WqkVI9uBqQ3/736y8G/nnQR
 xqcQTKj+/Qo/GWRxyC0B1UCn7XEb9ppOAPut1dyA9HoLYCv+lRmD0WreA
 lcdaQBLAMy72kyQKG438Mw23tiir/T3HySwxFvfPqI45VXTwwAMrjlawi
 QLy/bt7kOXbmgSqvyzxkBJUBG8ccFp8JhDgpWEx9EytSY3qevEyKgZxF/
 2XCGPShZC+bs/dcOVK8gvOuHBKf8tS1FnvHdPSbdo8TAap7SvkSpfIZrz
 9hba3BXhzf+OVrEC+LIanntZqjMej+h8B4/Ozt3NcijxAyKdAdrYtTSzl g==;
X-CSE-ConnectionGUID: bTsQBNAtS5in9fUdwrUjhA==
X-CSE-MsgGUID: ctwvDq5tRhes4AeEL6AAuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23372153"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23372153"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:42:54 -0700
X-CSE-ConnectionGUID: w08qdXAbSWmYbBBm3RRdlg==
X-CSE-MsgGUID: D6bWTmQgTSOlMcQ/H9O7TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="67556988"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:42:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 06/10] tests/intel/xe_drm_fdinfo: Use usec for batch
 duration
Date: Mon, 26 Aug 2024 22:42:18 -0700
Message-ID: <20240827054223.1671414-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827054223.1671414-1-lucas.demarchi@intel.com>
References: <20240827054223.1671414-1-lucas.demarchi@intel.com>
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
index ad563aa20..96468e1be 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -73,7 +73,7 @@ struct pceu_cycles {
 	uint64_t total_cycles;
 };
 
-const unsigned long batch_duration_ns = (1 * NSEC_PER_SEC) / 2;
+const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 2;
 
 static const char *engine_map[] = {
 	"rcs",
@@ -516,7 +516,7 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
 	if (flags & TEST_ISOLATION)
 		read_engine_cycles(new_fd, pceu1[1]);
 
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		spin_sync_end(fd, ctx);
 
@@ -552,7 +552,7 @@ busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int fl
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		spin_sync_end(fd, ctx);
 	read_engine_cycles(fd, pceu2);
@@ -579,7 +579,7 @@ single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
 	spin_sync_start(fd, ctx);
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 
 	/* destroy queue before sampling again */
 	spin_sync_end(fd, ctx);
@@ -618,7 +618,7 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		xe_for_each_engine_class(class)
 			spin_sync_end(fd, ctx[class]);
@@ -662,7 +662,7 @@ all_busy_check_all(int fd, unsigned int flags)
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		xe_for_each_engine_class(class)
 			spin_sync_end(fd, ctx[class]);
-- 
2.43.0

