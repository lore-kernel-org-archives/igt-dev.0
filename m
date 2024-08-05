Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9913BC3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 14:37:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD4510E213;
	Mon,  5 Aug 2024 14:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BjHlDQ8s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA5E10E213
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722868670; x=1754404670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qv53CjLuIPhlNO46scqSdFzDmYMMEmHqTKJZrpIL9Cg=;
 b=BjHlDQ8so9d0Uq8Ej1vHySybr6oWxaJtnx2BsUkmFCnv7NrzLQESJvJQ
 yRsShnckqPvl/mxhc0GidxupRQFmhpq9zujMZZZS40uSrT8Tbdi/Qp8T3
 vBJXdiJLKfFdQ6rnIIiGt0CsTsiz9nV9pZzhsheKvEqGtGfvQM8Glovpj
 RLDCf0hUVOUp8YJRtbDkrhVsbCHrmH69ERMelxsTeWOObKt33xvm5xMSD
 AG2WtqmDdBrMRB1jS9P+EPiqz8/V0Y6BhKXKSqCqEraU2RtgbIqRQyJvZ
 Pl9FKW2D8wn+rPQO4F3FKXk72LlnxJK1NnO23jbWY7UE1uOPKoce4OIsQ Q==;
X-CSE-ConnectionGUID: Fs4jZcexTP60+LRokMCJSw==
X-CSE-MsgGUID: TEQfqRQ2SbelnjEt7Kzl/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24702295"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="24702295"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:50 -0700
X-CSE-ConnectionGUID: gjlSIOl7R7+Fpp5po2ZjYA==
X-CSE-MsgGUID: L4ImK55dRq6v7y0SL7ARrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56755109"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.245.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:49 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 7/8] tests/core_hotunplug: Check health once after
 subtest
Date: Mon,  5 Aug 2024 16:37:10 +0200
Message-ID: <20240805143713.76034-8-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
References: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
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

Currently health checks and recovery are performed in fixtures
outside of subtest and even without any subtest running. Whats
more, after one subtest fail, all other checks will fail and
will print quite a few logs.

Lets try to lower number of checks to those really needed and
do them only once per fixture, which should make reading logs
easier.

v2: drop new var from test priv structure, update subject and
  description, change second macro parameter name to 'y'

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_hotunplug.c | 108 +++++++++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 41 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7f17f4423..51edee985 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -84,6 +84,9 @@
 
 IGT_TEST_DESCRIPTION("Examine behavior of a driver on device hot unplug");
 
+#define ACTION_RECOVER		(1 << 0)
+#define ACTION_POST_CHECK	(1 << 1)
+
 struct hotunplug {
 	struct {
 		int drm;
@@ -515,7 +518,6 @@ static void recover(struct hotunplug *priv)
 	bool late_close = priv->fd.drm >= 0;
 
 	cleanup(priv);
-
 	if (!priv->failure && late_close)
 		igt_ignore_warn(healthcheck(priv, false));
 
@@ -671,6 +673,19 @@ static void hotreplug_lateclose(struct hotunplug *priv)
 }
 
 /* Main */
+#define RECOVER(x) igt_fixture { \
+		if (x) { \
+			x = false; \
+			recover(&priv); \
+		} \
+	}
+
+#define POST_CHECK(y) igt_fixture { \
+		if (y) { \
+			y = false; \
+			post_healthcheck(&priv); \
+		} \
+	}
 
 igt_main
 {
@@ -682,6 +697,8 @@ igt_main
 		.snd_driver	= NULL,
 		.chipset	= DRIVER_ANY,
 	};
+	bool needs_recover = false;
+	bool needs_post_check = false;
 
 	igt_fixture {
 		int fd_drm;
@@ -717,100 +734,109 @@ igt_main
 
 	igt_subtest_group {
 		igt_describe("Check if the driver can be cleanly unbound from a device believed to be closed, then rebound");
-		igt_subtest("unbind-rebind")
+		igt_subtest("unbind-rebind") {
+			needs_recover = true;
+			needs_post_check = true;
 			unbind_rebind(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER(needs_recover);
 	}
 
-	igt_fixture
-		post_healthcheck(&priv);
+	POST_CHECK(needs_post_check);
 
 	igt_subtest_group {
 		igt_describe("Check if a device believed to be closed can be cleanly unplugged, then restored");
-		igt_subtest("unplug-rescan")
+		igt_subtest("unplug-rescan") {
+			needs_recover = true;
+			needs_post_check = true;
 			unplug_rescan(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER(needs_recover);
 	}
 
-	igt_fixture
-		post_healthcheck(&priv);
+	POST_CHECK(needs_post_check);
 
 	igt_subtest_group {
 		igt_describe("Check if the driver can be cleanly unbound from an open device, then released and rebound");
-		igt_subtest("hotunbind-rebind")
+		igt_subtest("hotunbind-rebind") {
+			needs_recover = true;
+			needs_post_check = true;
 			hotunbind_rebind(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER(needs_recover);
 	}
 
-	igt_fixture
-		post_healthcheck(&priv);
+	POST_CHECK(needs_post_check);
 
 	igt_subtest_group {
 		igt_describe("Check if an open device can be cleanly unplugged, then released and restored");
-		igt_subtest("hotunplug-rescan")
+		igt_subtest("hotunplug-rescan") {
+			needs_recover = true;
+			needs_post_check = true;
 			hotunplug_rescan(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER(needs_recover);
 	}
 
-	igt_fixture
-		post_healthcheck(&priv);
+	POST_CHECK(needs_post_check);
 
 	igt_subtest_group {
 		igt_describe("Check if the driver can be cleanly rebound to a device with a still open hot unbound driver instance");
-		igt_subtest("hotrebind")
+		igt_subtest("hotrebind") {
+			needs_recover = true;
+			needs_post_check = true;
 			hotrebind(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER(needs_recover);
 	}
 
-	igt_fixture
-		post_healthcheck(&priv);
+	POST_CHECK(needs_post_check);
 
 	igt_subtest_group {
 		igt_describe("Check if a hot unplugged and still open device can be cleanly restored");
-		igt_subtest("hotreplug")
+		igt_subtest("hotreplug") {
+			needs_recover = true;
+			needs_post_check = true;
 			hotreplug(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER(needs_recover);
 	}
 
-	igt_fixture
-		post_healthcheck(&priv);
+	POST_CHECK(needs_post_check);
 
 	igt_subtest_group {
 		igt_describe("Check if a hot unbound driver instance still open after hot rebind can be cleanly released");
-		igt_subtest("hotrebind-lateclose")
+		igt_subtest("hotrebind-lateclose") {
+			needs_recover = true;
+			needs_post_check = true;
 			hotrebind_lateclose(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER(needs_recover);
 	}
 
-	igt_fixture
-		post_healthcheck(&priv);
+	POST_CHECK(needs_post_check);
 
 	igt_subtest_group {
 		igt_describe("Check if an instance of a still open while hot replugged device can be cleanly released");
-		igt_subtest("hotreplug-lateclose")
+		igt_subtest("hotreplug-lateclose") {
+			needs_recover = true;
+			needs_post_check = true;
 			hotreplug_lateclose(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER(needs_recover);
 	}
 
 	igt_fixture {
-		post_healthcheck(&priv);
-
+		if (needs_post_check)
+			post_healthcheck(&priv);
 		igt_ignore_warn(close(priv.fd.sysfs_bus));
 		igt_ignore_warn(close(priv.fd.sysfs_drv));
 	}
-- 
2.43.0

