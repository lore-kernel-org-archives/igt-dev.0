Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5599CC3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206D210E439;
	Mon, 29 Jul 2024 16:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgAlDoJm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710F210E437
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269162; x=1753805162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FuFb2LaCsBTbLlebIoqLCE6Rma9ZxmwW6W6LzxFrLeE=;
 b=ZgAlDoJm2qqhUCePhbhS0MC1OpjGFq6piYeH0PbXgU/okV2lOx7SeDqa
 qPutIK2iORv3wwFRkt43o6mVr63cHa+NJMC2rgDz/I2iARBtiPnK4eSUx
 dJmTwhNoN26+tEQwwEFfS2Zb8XYm/rRjiPYww3Dv3GYQE+SV19mgYWytJ
 THwjsLIslYOzaZqLnv6EEFXkagZRY+A5fZs7A3lv0uukwdP1EYnJnkiS+
 KJoQApqjUDNaXBHjk3ezPhFj9aOopZ4cXGkha64rWKIJs66vQfnX4YUaV
 2JkDkv0gCw9M1FwA9DzTQbvQkQ5mpsheVmnnD9ePXoxm4T6msTWQNkDWD Q==;
X-CSE-ConnectionGUID: J7gIzemBRIWat8OnkYINxw==
X-CSE-MsgGUID: hLimmWteRzORRFlZlbloRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31428039"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31428039"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:46 -0700
X-CSE-ConnectionGUID: 1gl662mJQ9KD64DBS3xW5w==
X-CSE-MsgGUID: zBbYWcqEQz+7JCzWxO7sBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53740134"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:43 -0700
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
Subject: [PATCH 65/66] tests/xe_eudebug_online: Check if eu debugger disables
 preemption timeout
Date: Mon, 29 Jul 2024 18:01:58 +0200
Message-Id: <20240729160159.37036-66-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Workloads could potentially be stopped on a breakpoint for a long time,
due to that eu debugger needs to disable preemption timeout to
prevent reset of such workload. Verify that.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 49 +++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index ab1a57d9b..6a451b2a4 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -20,6 +20,7 @@
 #include "intel_mocs.h"
 #include "gpgpu_shader.h"
 
+#define SHADER_NOP			(0 << 0)
 #define SHADER_BREAKPOINT		(1 << 0)
 #define SHADER_LOOP			(1 << 1)
 #define SHADER_SINGLE_STEP		(1 << 2)
@@ -1322,6 +1323,51 @@ static void test_basic_online(int fd, struct drm_xe_engine_class_instance *hwe,
 	online_debug_data_destroy(data);
 }
 
+/**
+ * SUBTEST: preempt-breakpoint
+ * Description:
+ *	Verify that eu debugger disables preemption timeout to
+ *	prevent reset of workload stopped on breakpoint.
+ */
+static void test_preemption(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	int flags = SHADER_BREAKPOINT | TRIGGER_RESUME_DELAYED;
+	struct xe_eudebug_session *s;
+	struct online_debug_data *data;
+	struct xe_eudebug_client *other;
+
+	data = online_debug_data_create(hwe);
+	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	other = xe_eudebug_client_create(fd, run_online_client, SHADER_NOP, data);
+
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_debug_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_resume_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					ufence_ack_trigger);
+
+	igt_assert_eq(xe_eudebug_debugger_attach(s->d, s->c), 0);
+	xe_eudebug_debugger_start_worker(s->d);
+
+	xe_eudebug_client_start(s->c);
+	sleep(1); /* make sure s->c starts first */
+	xe_eudebug_client_start(other);
+
+	xe_eudebug_client_wait_done(s->c);
+	xe_eudebug_client_wait_done(other);
+
+	xe_eudebug_debugger_stop_worker(s->d, 1);
+
+	xe_eudebug_session_destroy(s);
+	xe_eudebug_client_destroy(other);
+
+	igt_assert_f(data->last_eu_control_seqno != 0,
+		     "Workload with breakpoint has ended without resume!\n");
+
+	online_debug_data_destroy(data);
+}
+
 /**
  * SUBTEST: reset-with-attention
  * Description:
@@ -2002,6 +2048,9 @@ igt_main
 	test_gt_render_or_compute("basic-breakpoint-no-lr", fd, hwe)
 		test_basic_online(fd, hwe, SHADER_BREAKPOINT | DISABLE_LONG_RUNNING_MODE);
 
+	test_gt_render_or_compute("preempt-breakpoint", fd, hwe)
+		test_preemption(fd, hwe);
+
 	test_gt_render_or_compute("breakpoint-not-in-debug-mode", fd, hwe)
 		test_basic_online(fd, hwe, SHADER_BREAKPOINT | DISABLE_DEBUG_MODE);
 
-- 
2.34.1

