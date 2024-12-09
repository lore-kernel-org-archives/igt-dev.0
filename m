Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883D7E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 14:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4468410E74C;
	Mon,  9 Dec 2024 14:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bsaJHD3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D31010E74C
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733753683; x=1765289683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8P2cvTTEPhWL3AhV6TRv0AWCOHB0h595AlLYGULHg7o=;
 b=bsaJHD3fmsy5Yta0PR9jnWMLVaPQKQiW7cyPINXGW77pH8Z+MLPitQHf
 enHK6NyT8yf/c+rnqx4F2kdByBPWHZtxfujVN3G1u60O6V89z7MR9ZutF
 1/2+3GHrvbaEOljXRlGnQ8JZ2lBGO9Sn8CS8m01OgV39zk6ORtHquei5g
 Hcw8Hdkokdv/OQk2agGpxaDSzEvpCkv7HwcYKATrKjwrI1Mk4Npycb13D
 Xz5FWy3GMf/oZyFmJ7PN8sIBXtWUQgguv42UKb0GaDCZ2HLSQBSwB9jZY
 LtixHV95aeE3JvqYpmlZT4c0nTAgapadPeE7j3d8Yco7vwb1xw27a5ES+ Q==;
X-CSE-ConnectionGUID: x33k5hdYQw+Exx053STR0w==
X-CSE-MsgGUID: 5O8QtSlFTbeeXHQwmYEobw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34187322"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34187322"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:14:42 -0800
X-CSE-ConnectionGUID: al6TiGp9TDyIgGr3bFmEag==
X-CSE-MsgGUID: btf18EnNQKiIV0mWdjAYfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="95544044"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.170])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:14:40 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_eudebug: Add
 basic-vm-bind-ufence-sigint-client test
Date: Mon,  9 Dec 2024 15:13:59 +0100
Message-Id: <20241209141359.5738-4-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209141359.5738-1-dominik.karol.piatkowski@intel.com>
References: <20241209141359.5738-1-dominik.karol.piatkowski@intel.com>
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

Add a test that gives user fence in application, holds it, sends SIGINT
to client and checks if anything breaks.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug.c | 44 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 0a4bebf1e..8728d5b23 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -2218,6 +2218,47 @@ static void test_ufence_drop_debugger_before_ack(int fd)
 	ufence_priv_destroy(priv);
 }
 
+/**
+ * SUBTEST: basic-vm-bind-ufence-sigint-client
+ * Description:
+ *	Give user fence in application, hold it, send SIGINT to client and check if anything breaks.
+ */
+static void test_ufence_sigint_client(int fd)
+{
+	struct xe_eudebug_debugger *d;
+	struct xe_eudebug_session *s;
+	struct xe_eudebug_client *c;
+	struct ufence_priv *priv;
+
+	priv = ufence_priv_create();
+	s = xe_eudebug_session_create(fd, basic_ufence_client, 0, priv);
+	c = s->client;
+	d = s->debugger;
+
+	xe_eudebug_debugger_add_trigger(d,
+					DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					basic_ufence_trigger);
+
+	igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
+	xe_eudebug_debugger_start_worker(d);
+	xe_eudebug_client_start(c);
+
+	xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
+	xe_eudebug_assert_f(d, wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * MSEC_PER_SEC) == 0,
+			    "missing ufence events\n");
+
+	kill(c->pid, SIGINT);
+
+	xe_eudebug_debugger_stop_worker(d, 1);
+
+	xe_eudebug_event_log_print(d->log, true);
+
+	xe_eudebug_debugger_destroy(s->debugger);
+	free(s);
+
+	ufence_priv_destroy(priv);
+}
+
 struct vm_bind_clear_thread_priv {
 	struct drm_xe_engine_class_instance *hwe;
 	struct xe_eudebug_client *c;
@@ -2875,6 +2916,9 @@ igt_main
 	igt_subtest("basic-vm-bind-drop-debugger-before-ufence-ack")
 		test_ufence_drop_debugger_before_ack(fd);
 
+	igt_subtest("basic-vm-bind-ufence-sigint-client")
+		test_ufence_sigint_client(fd);
+
 	igt_subtest("vma-ufence")
 		test_vma_ufence(fd, 0);
 
-- 
2.34.1

