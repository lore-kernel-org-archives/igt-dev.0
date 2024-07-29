Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EBFC3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B06810E42A;
	Mon, 29 Jul 2024 16:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajgGJ+gY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C21510E42A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269082; x=1753805082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uUJaumoSZhu4uCCYfDmWBLpgO0sugPSskl7mDADmGB8=;
 b=ajgGJ+gYbHVtV9iG21czRmgSyHjdY9kiIXh0wWkvRzkGeaUsToxogtwX
 zS2tczzObMBjwppfIQzj3hcYy1LnTgDF7alfGLznIrUauoaea/LdVo9D9
 D32dukSbjrzvvS7WfW9XQUsdiFeAqYYjWTDT4hgUJEQupRJqll3poQRmM
 u5XDw8E7Mj2r5+sYwEUnpJ3N+CLwmhD0DTOK6W9qAv8QgBHrKBc8T1hZa
 S8/7/QurJuerPLhtUT9XgVu4xFVrdkRoYVTkvSlTA9l9GoQlyPAyIVil3
 pvHJrKROmmGoQip7PyxXJtaoigxE0uIt/w8D47sLm7z9x18tziFibG9oG A==;
X-CSE-ConnectionGUID: NSMr295SQc2TxrKX5Smi+w==
X-CSE-MsgGUID: z0tvywj4RqSc7uCLUnbJkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427344"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427344"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:41 -0700
X-CSE-ConnectionGUID: T7XfDmHLSo2bWV9XRlqclg==
X-CSE-MsgGUID: AZUKhI+tSFGKhYP9yjE0aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53739065"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:37 -0700
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
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 44/66] tests/xe_exec_sip: Add breakpoint-waitsip-heavy test
Date: Mon, 29 Jul 2024 18:01:37 +0200
Message-Id: <20240729160159.37036-45-christoph.manszewski@intel.com>
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

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Add breakpoint-waitsip-heavy test that walks checks if we reset
after seeing the attention from heavy SIP without the debugger.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_exec_sip.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 92da8f14d..a27d3cba6 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -42,6 +42,7 @@
 #define SIP_WRITE 4
 #define SIP_NULL 5
 #define SIP_WAIT 6
+#define SIP_HEAVY 7
 
 #define F_SUBMIT_TWICE	(1 << 0)
 
@@ -107,6 +108,23 @@ static struct gpgpu_shader *get_sip(int fd, const int siptype,
 	case SIP_WRITE:
 		break;
 	case SIP_WAIT:
+		gpgpu_shader__wait(sip);
+		break;
+	case SIP_HEAVY:
+		/* Depending on the generation, the production sip
+		 * executes between 145 to 157 instructions.
+		 * It performs at most 45 data port writes and 5 data port reads.
+		 * Make sure our heavy sip is at least twice heavy as production one.
+		 */
+		gpgpu_shader__loop_begin(sip, 0);
+		gpgpu_shader__write_dword(sip, 0xdeadbeef, y_offset);
+		gpgpu_shader__write_dword(sip, SIP_CANARY, y_offset);
+		gpgpu_shader__loop_end(sip, 0, 45);
+
+		gpgpu_shader__loop_begin(sip, 1);
+		gpgpu_shader__jump_neq(sip, 1, y_offset, SIP_CANARY);
+		gpgpu_shader__loop_end(sip, 1, 10);
+
 		gpgpu_shader__wait(sip);
 		break;
 	}
@@ -209,7 +227,7 @@ static void check_usercoredump(int fd, int sip, int dispatched)
 	unsigned int before, after;
 	char match[256];
 
-	if (sip != SIP_WAIT)
+	if (sip != SIP_WAIT && sip != SIP_HEAVY)
 		return;
 
 	/* XXX reinstate when offline coredumps are implemented */
@@ -276,6 +294,10 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
  * SUBTEST: breakpoint-waitsip
  * Description: Test that we reset after seeing the attention without the debugger.
  *
+ * SUBTEST: breakpoint-waitsip-heavy
+ * Description:
+ *	Test that we reset after seeing the attention from heavy SIP, that resembles
+ *	the production one, without the debugger.
  */
 static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *eci, uint32_t flags)
 {
@@ -389,6 +411,9 @@ igt_main
 		test_render_and_compute("breakpoint-waitsip", fd, eci)
 			test_sip(SHADER_BREAKPOINT, SIP_WAIT, eci, 0);
 
+		test_render_and_compute("breakpoint-waitsip-heavy", fd, eci)
+			test_sip(SHADER_BREAKPOINT, SIP_HEAVY, eci, 0);
+
 		igt_fixture
 			xe_eudebug_enable(fd, was_enabled);
 	}
-- 
2.34.1

