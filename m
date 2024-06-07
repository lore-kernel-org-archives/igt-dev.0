Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E8AC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 15:36:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A832610ECC7;
	Fri,  7 Jun 2024 15:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBgw5i3S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F7A10ECBF
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 15:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717774606; x=1749310606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T6giwr/er/pSH8AtWg0+ceeqv6wv017iIxecYDzNeNg=;
 b=ZBgw5i3SH38/JqzfTF4ospd27z3LdSaMJExVUQyXmSMGZ6tXcDQmHn1d
 /1VtclfarAJuKKoC/wOgfo+727Ikstv2J6Reyzvmo4t076WsKQsYTGQQq
 TPWU3+H8DhBi11R9azRxdGXa3do8nIQx85bTbPp4ctOkqprkbeEScdrBR
 2HRuzsyfC2sjhAVYer0YdaDCFNm3sx0P0RVr72HYvdZjIZYKxJhl56N5D
 BbBVugRVERTC9le4ob/c/WCXn1i4g5DHv3mXhgeisdNL3jyE/ucUwEpJX
 BvC9g0F7oHI3Hzj4dD9fkcC74c7xHORkmGUb+22iIiS1KuvWjYaHV51QL w==;
X-CSE-ConnectionGUID: 8vFMzE+iROS9GIbxS9owoQ==
X-CSE-MsgGUID: DcVN16xsShe70OwuxBOytA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14620070"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14620070"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:36:46 -0700
X-CSE-ConnectionGUID: IJFuBFtpQiaJWlhIAfy9hA==
X-CSE-MsgGUID: A/OYftJFSEiFt8QBQVMCbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38805264"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:36:46 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 3/7] tests/core_hotplug: Add checks to subtests
Date: Fri,  7 Jun 2024 17:36:15 +0200
Message-ID: <20240607153629.52596-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
References: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
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
will print quite a few logs. Additionally they are also meant
to check health of device after a test and make a subtest fail.

Lets try to fail early inside subtest and lower number of checks
to those really needed and do them only once per fixture, which
should make reading logs easier.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_hotunplug.c | 118 +++++++++++++++++++++++++++--------------
 1 file changed, 78 insertions(+), 40 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 3971b94ff..7ed9abd37 100644
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
@@ -98,6 +101,7 @@ struct hotunplug {
 	bool has_intel_perf;
  	char *snd_driver;
 	int chipset;
+	int checks;
 };
 
 /* Helpers */
@@ -509,8 +513,11 @@ static void pre_check(struct hotunplug *priv)
 static void recover(struct hotunplug *priv)
 {
 	bool late_close = priv->fd.drm >= 0;
+	int needs_recover = priv->checks & ACTION_RECOVER;
 
 	cleanup(priv);
+	if (!needs_recover)
+		return;
 
 	if (!priv->failure && late_close)
 		igt_ignore_warn(healthcheck(priv, false));
@@ -528,10 +535,18 @@ static void recover(struct hotunplug *priv)
 
 	if (priv->failure)
 		igt_assert_f(healthcheck(priv, true), "%s\n", priv->failure);
+
+	priv->checks &= ~ACTION_RECOVER;
 }
 
 static void post_healthcheck(struct hotunplug *priv)
 {
+	bool needs_post_check = priv->checks & ACTION_POST_CHECK;
+
+	priv->checks = 0;
+	if (!needs_post_check)
+		return;
+
 	igt_abort_on_f(priv->failure, "%s\n", priv->failure);
 
 	cleanup(priv);
@@ -667,6 +682,19 @@ static void hotreplug_lateclose(struct hotunplug *priv)
 }
 
 /* Main */
+#define RECOVER	igt_fixture { \
+		recover(&priv); \
+	}
+
+#define POST_CHECK igt_fixture { \
+		post_healthcheck(&priv); \
+	}
+
+static void recover_and_post_healthcheck(struct hotunplug *priv)
+{
+	recover(priv);
+	post_healthcheck(priv);
+}
 
 igt_main
 {
@@ -677,6 +705,7 @@ igt_main
 		.has_intel_perf = false,
 		.snd_driver	= NULL,
 		.chipset	= DRIVER_ANY,
+		.checks		= 0,
 	};
 
 	igt_fixture {
@@ -704,100 +733,109 @@ igt_main
 
 	igt_subtest_group {
 		igt_describe("Check if the driver can be cleanly unbound from a device believed to be closed, then rebound");
-		igt_subtest("unbind-rebind")
+		igt_subtest("unbind-rebind") {
+			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
 			unbind_rebind(&priv);
+			recover_and_post_healthcheck(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER;
 	}
 
-	igt_fixture
-		post_healthcheck(&priv);
+	POST_CHECK;
 
 	igt_subtest_group {
 		igt_describe("Check if a device believed to be closed can be cleanly unplugged, then restored");
-		igt_subtest("unplug-rescan")
+		igt_subtest("unplug-rescan") {
+			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
 			unplug_rescan(&priv);
+			recover_and_post_healthcheck(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER;
 	}
 
-	igt_fixture
-		post_healthcheck(&priv);
+	POST_CHECK;
 
 	igt_subtest_group {
 		igt_describe("Check if the driver can be cleanly unbound from an open device, then released and rebound");
-		igt_subtest("hotunbind-rebind")
+		igt_subtest("hotunbind-rebind") {
+			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
 			hotunbind_rebind(&priv);
+			recover_and_post_healthcheck(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER;
 	}
 
-	igt_fixture
-		post_healthcheck(&priv);
+	POST_CHECK;
 
 	igt_subtest_group {
 		igt_describe("Check if an open device can be cleanly unplugged, then released and restored");
-		igt_subtest("hotunplug-rescan")
+		igt_subtest("hotunplug-rescan") {
+			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
 			hotunplug_rescan(&priv);
+			recover_and_post_healthcheck(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER;
 	}
 
-	igt_fixture
-		post_healthcheck(&priv);
+	POST_CHECK;
 
 	igt_subtest_group {
 		igt_describe("Check if the driver can be cleanly rebound to a device with a still open hot unbound driver instance");
-		igt_subtest("hotrebind")
+		igt_subtest("hotrebind") {
+			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
 			hotrebind(&priv);
+			recover_and_post_healthcheck(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER;
 	}
 
-	igt_fixture
-		post_healthcheck(&priv);
+	POST_CHECK;
 
 	igt_subtest_group {
 		igt_describe("Check if a hot unplugged and still open device can be cleanly restored");
-		igt_subtest("hotreplug")
+		igt_subtest("hotreplug") {
+			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
 			hotreplug(&priv);
+			recover_and_post_healthcheck(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER;
 	}
 
-	igt_fixture
-		post_healthcheck(&priv);
+	POST_CHECK;
 
 	igt_subtest_group {
 		igt_describe("Check if a hot unbound driver instance still open after hot rebind can be cleanly released");
-		igt_subtest("hotrebind-lateclose")
+		igt_subtest("hotrebind-lateclose") {
+			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
 			hotrebind_lateclose(&priv);
+			recover_and_post_healthcheck(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER;
 	}
 
-	igt_fixture
-		post_healthcheck(&priv);
+	POST_CHECK;
 
 	igt_subtest_group {
 		igt_describe("Check if an instance of a still open while hot replugged device can be cleanly released");
-		igt_subtest("hotreplug-lateclose")
+		igt_subtest("hotreplug-lateclose") {
+			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
 			hotreplug_lateclose(&priv);
+			recover_and_post_healthcheck(&priv);
+		}
 
-		igt_fixture
-			recover(&priv);
+		RECOVER;
 	}
 
-	igt_fixture {
-		post_healthcheck(&priv);
+	POST_CHECK;
 
+	igt_fixture {
 		igt_ignore_warn(close(priv.fd.sysfs_bus));
 		igt_ignore_warn(close(priv.fd.sysfs_drv));
 	}
-- 
2.43.0

