Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23335C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D923B10E516;
	Tue, 30 Jul 2024 11:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xu+ylj4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E09710E517
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340125; x=1753876125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HujAAdShpIluPO2L8fvdOf0URlbKpNNkUl4msXXjuNo=;
 b=Xu+ylj4mgk/Vla2PhcvWTxqtLLbcD3Ii+1eMflA7Dr7DuRTToaBT5lio
 EQAHix1B1a1+cyTOQ0E/PydYiLeNWhNloUNhqMd6nacvI0swuOJpR/3n8
 Reivp4f4b+PKtaJ5GAkxnVGztp9YHUgQsmxjtDiQRWqWGOTKB+c19+Rq4
 OoqLY1cpX6gqZ/a7bdq9+bAYOUjUf5gpU78Pgy6O9uPbeMYHv3mWfvmE/
 b+4nzqIbfVqywjmj7iAx8ECNX7TtBPKyEK2hQKzfKc7oBlDwVBCvYI/Oq
 j2JfPu6nXX1S+u3bWgq085EEKh8o8BwEwgzj6aFiZG/Or4iKzUrN8hHgS g==;
X-CSE-ConnectionGUID: BylDFWpkSj+jsYmKJx70ZQ==
X-CSE-MsgGUID: tKpbLGnASXu9DDh+WFTcdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937409"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208,223";a="23937409"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:45 -0700
X-CSE-ConnectionGUID: Odd4lpgVQmWcktBvzloP/g==
X-CSE-MsgGUID: qqpMWYriT3uPau0o9IkWRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208,223";a="54217205"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:41 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 41/66] tests/xe_exec_sip: Add support for dynamic
 debugger sysfs toggle
Date: Tue, 30 Jul 2024 13:44:58 +0200
Message-Id: <20240730114523.334156-42-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

From now on the debugger is disabled by default so it is required
to enable the debugger before using it. This change addresses that
fact by calling necessary library functions within test fixtures.

Signed-off-by: Mika Kuoppala <mika.kuoppala@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_exec_sip.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index a315bd3a9..832c26bac 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -123,18 +123,6 @@ static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, const int shadertype,
 	return buf->handle;
 }
 
-static bool has_debugger(int fd)
-{
-	struct drm_xe_eudebug_connect param = { .pid = getpid() };
-	int debugfd;
-
-	debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
-	if (debugfd >= 0)
-		close(debugfd);
-
-	return debugfd >= 0;
-}
-
 static void check_fill_buf(uint8_t *ptr, const int width, const int x,
 			   const int y, const uint8_t color)
 {
@@ -180,7 +168,7 @@ static int check_buf(int fd, uint32_t handle, int width, int height,
 	}
 
 	igt_assert(thread_count);
-	if (siptype != SIP_NULL && has_debugger(fd))
+	if (siptype != SIP_NULL && xe_eudebug_debugger_available(fd))
 		igt_assert_f(thread_count == sip_count,
 			     "Thread and SIP count mismatch, %d != %d\n",
 			     thread_count, sip_count);
@@ -305,7 +293,7 @@ static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *e
 	timeout *= igt_run_in_simulation() ? 10 : 1;
 
 	exec_queue_id = xe_exec_queue_create(fd, vm_id, eci,
-					     has_debugger(fd) ?
+					     xe_eudebug_debugger_available(fd) ?
 					     to_user_pointer(&ext) : 0);
 	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
 
@@ -338,6 +326,7 @@ static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *e
 igt_main
 {
 	struct drm_xe_engine_class_instance *eci;
+	bool was_enabled;
 	int fd;
 
 	igt_fixture
@@ -349,17 +338,21 @@ igt_main
 	/* Debugger disabled (TD_CTL not set) */
 	igt_subtest_group {
 		igt_fixture {
-			igt_require(!has_debugger(fd));
+			was_enabled = xe_eudebug_enable(fd, false);
+			igt_require(!xe_eudebug_debugger_available(fd));
 		}
 
 		test_render_and_compute("wait-writesip-nodebug", fd, eci)
 			test_sip(SHADER_WAIT, SIP_WRITE, eci);
+
+		igt_fixture
+			xe_eudebug_enable(fd, was_enabled);
 	}
 
 	/* Debugger enabled (TD_CTL set) */
 	igt_subtest_group {
 		igt_fixture {
-			igt_require(has_debugger(fd));
+			was_enabled = xe_eudebug_enable(fd, true);
 		}
 
 		test_render_and_compute("breakpoint-writesip", fd, eci)
@@ -367,6 +360,9 @@ igt_main
 
 		test_render_and_compute("breakpoint-waitsip", fd, eci)
 			test_sip(SHADER_BREAKPOINT, SIP_WAIT, eci);
+
+		igt_fixture
+			xe_eudebug_enable(fd, was_enabled);
 	}
 
 	igt_fixture
-- 
2.34.1

