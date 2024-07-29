Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91F8C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEF910E432;
	Mon, 29 Jul 2024 16:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDAF6m1n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D0C10E42A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269078; x=1753805078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xmvtMWNhOlbZh3Wo186Sbn/pntJpzLkab0sMGD81pMs=;
 b=BDAF6m1ncbIvDEVNPgvvCOXyqm5amsBwbX0Hbw332CAqpkIM3QFuv/QT
 vEHib3Sm5zgKOMqbXj/n7rjRgVzdyQGNl/aNDAf/hCNvYKMStMnZI7XCQ
 xAOhP0eknm+o6xsgFKdITnp2AjyVsduak02GwqgbC9+89n2uWYK12v9YO
 6PabRQ6+dExJO2cBA6Q1ff+oY24MOj8WO2VsoIv4zVcZn5rjWRMURLW+T
 K0rAqTsZ0Lqmbe4+NA55zlhV9EgKZ2isXGx6c6S1z4n+oSBQ9tZcqTYfO
 kQhhW6BIDMv7xz0zR9Xy/2vlii7mR8rO8OCIQIeG3OOzQU76+QNhybwgE A==;
X-CSE-ConnectionGUID: xyfRKHJPQbCXPLmI1t1sGg==
X-CSE-MsgGUID: v+Ws4iN6QLSw93ddLhENGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427301"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427301"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:38 -0700
X-CSE-ConnectionGUID: SOD+YNTLQJK+xax4myP4jQ==
X-CSE-MsgGUID: nd4ai3RHS7mMfdYddOG1AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53738998"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:34 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 43/66] tests/xe_exec_sip: Add sanity-after-timeout test
Date: Mon, 29 Jul 2024 18:01:36 +0200
Message-Id: <20240729160159.37036-44-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

From: Karolina Stolarek <karolina.stolarek@intel.com>

Introduce sanity-after-timeout test to check if the shader
gets executed after a hang.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_exec_sip.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 7b4305576..92da8f14d 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -38,9 +38,10 @@
 #define SHADER_BREAKPOINT 0
 #define SHADER_WRITE 1
 #define SHADER_WAIT 2
-#define SIP_WRITE 3
-#define SIP_NULL 4
-#define SIP_WAIT 5
+#define SHADER_HANG 3
+#define SIP_WRITE 4
+#define SIP_NULL 5
+#define SIP_WAIT 6
 
 #define F_SUBMIT_TWICE	(1 << 0)
 
@@ -71,6 +72,11 @@ static struct gpgpu_shader *get_shader(int fd, const int shadertype)
 	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
 
 	switch (shadertype) {
+	case SHADER_HANG:
+		gpgpu_shader__label(shader, 0);
+		gpgpu_shader__nop(shader);
+		gpgpu_shader__jump(shader, 0);
+		break;
 	case SHADER_WAIT:
 		gpgpu_shader__wait(shader);
 		break;
@@ -255,6 +261,9 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
  * Description: check basic shader with write operation
  * Run type: BAT
  *
+ * SUBTEST: sanity-after-timeout
+ * Description: check basic shader execution after job timeout
+ *
  * SUBTEST: wait-writesip-nodebug
  * Description: verify that we don't enter SIP after wait with debugging disabled.
  *
@@ -342,6 +351,15 @@ igt_main
 	test_render_and_compute("sanity", fd, eci)
 		test_sip(SHADER_WRITE, SIP_NULL, eci, 0);
 
+	test_render_and_compute("sanity-after-timeout", fd, eci) {
+		test_sip(SHADER_HANG, SIP_NULL, eci, 0);
+
+		xe_for_each_engine(fd, eci)
+			if (eci->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
+			    eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+				test_sip(SHADER_WRITE, SIP_NULL, eci, 0);
+	}
+
 	/* Debugger disabled (TD_CTL not set) */
 	igt_subtest_group {
 		igt_fixture {
-- 
2.34.1

