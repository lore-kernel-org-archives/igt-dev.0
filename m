Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D944C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295EE10E50A;
	Tue, 30 Jul 2024 11:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kqz9Skub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE9910E526
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340132; x=1753876132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xmvtMWNhOlbZh3Wo186Sbn/pntJpzLkab0sMGD81pMs=;
 b=Kqz9SkubrOkwN/UotdZpZQjAgd3zC1eckg6anXSs9hUyVJlMZGkFt3sD
 OjxC64USzIcunONYFOJbHbBbzZk34xfD3aOf7oV8SIDZsz3JBTd3z9oaI
 JMfnG/BsjESQxuxIWJQ4LVz+mosE0vuedET/B9Cu89lJVDrxzy/WwNzo7
 JplH2+Y2uhr6b1OnQ6YvmpLmcQLwKwlzZy+YuoA4Ci04tHMr+GznKhKXF
 hy5stG1w8KF9pcDIdUK2AF3/gZpeApVBTOxAhTaEKkvqWqIEFvfWtI9Se
 3eK4ScyjdEFVZjAYOxnHEuZsqKegOlKBKwDh7TI+MRlHQ7HVPxBPrO4QM w==;
X-CSE-ConnectionGUID: vwZX8C5zSyCrowwT0GYNvg==
X-CSE-MsgGUID: 8Y0R0JRRQgmU08C2TkOCoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937432"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:52 -0700
X-CSE-ConnectionGUID: 752bi1jpQ/mNYmwFyTSSBg==
X-CSE-MsgGUID: cPJY2+u0THK1Mv0QpqWksA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217248"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:48 -0700
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
Subject: [PATCH i-g-t v2 43/66] tests/xe_exec_sip: Add sanity-after-timeout
 test
Date: Tue, 30 Jul 2024 13:45:00 +0200
Message-Id: <20240730114523.334156-44-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

