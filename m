Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17551E77182
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 14:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8D310E746;
	Mon,  9 Dec 2024 14:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SmmgkWeH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF6B10E740
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 14:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733753679; x=1765289679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lNOAVPlKRQePU6gCh8jN1gbUphJ9DmDX+jleBf1aS0s=;
 b=SmmgkWeHNkwbr1592kxV1bwSPPg2AnGDzDlWdc5griU5R6wFrJlpkME5
 gdITjNBN09wbAl6RRI4LW96ySEDg2UqsbHtusErPHzHFa1YuMedVQOXhf
 vB8e0NJD3HBeGsKy/kz+2ZHH8yO341J6xf2CPA9+qchvdK3H498R2rCSK
 ulf9E98X9e/MZJAMWX6uYRnVX/RA4oNg2+jdWUPv5y0CExiIzExFOlqrK
 ZWzBDSYIKaVmN/7NQCR74oLQS4vMZtv/mUqpWG1CLi8ToBpmbeih7CSyn
 306oBHaVGR9NvRHIbnxJY6t+iNRTK5539kVsvYEVAkro8lhcvxKd/oxcb g==;
X-CSE-ConnectionGUID: zxruTTLVRN2rbxj/2wgJjA==
X-CSE-MsgGUID: 8WN98PyZTwiNMTBG3Nqzsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34187317"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34187317"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:14:39 -0800
X-CSE-ConnectionGUID: +SI7U6sqQ4mK0eRAnIiVYg==
X-CSE-MsgGUID: Tfva2sQ0Qzifg+GhTyTIKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="95544040"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.170])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:14:38 -0800
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
Subject: [PATCH i-g-t 2/3] tests/intel/xe_eudebug: Add
 basic-vm-bind-drop-debugger-before-ufence-ack test
Date: Mon,  9 Dec 2024 15:13:58 +0100
Message-Id: <20241209141359.5738-3-dominik.karol.piatkowski@intel.com>
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

Add a test that gives user fence in application, holds it, drops the
debugger connection and checks if anything breaks. It is expected that
held acks are released when connection is dropped.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug.c | 50 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 1853dee40..0a4bebf1e 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -2171,6 +2171,53 @@ static void test_basic_ufence(int fd, unsigned int flags)
 	ufence_priv_destroy(priv);
 }
 
+/**
+ * SUBTEST: basic-vm-bind-drop-debugger-before-ufence-ack
+ * Description:
+ *	Give user fence in application, hold it, drop the debugger connection and check if anything
+ *	breaks. Expect that held acks are released when connection is dropped.
+ */
+static void test_ufence_drop_debugger_before_ack(int fd)
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
+	xe_eudebug_debugger_detach(d);
+	sleep(1);
+	igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
+
+	xe_eudebug_client_wait_done(c);
+	xe_eudebug_debugger_stop_worker(d, 1);
+
+	xe_eudebug_event_log_print(d->log, true);
+	xe_eudebug_event_log_print(c->log, true);
+
+	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
+				 XE_EUDEBUG_FILTER_EVENT_VM | XE_EUDEBUG_FILTER_EVENT_OPEN);
+
+	xe_eudebug_session_destroy(s);
+	ufence_priv_destroy(priv);
+}
+
 struct vm_bind_clear_thread_priv {
 	struct drm_xe_engine_class_instance *hwe;
 	struct xe_eudebug_client *c;
@@ -2825,6 +2872,9 @@ igt_main
 	igt_subtest("basic-vm-bind-ufence-delay-ack")
 		test_basic_ufence(fd, VM_BIND_DELAY_UFENCE_ACK);
 
+	igt_subtest("basic-vm-bind-drop-debugger-before-ufence-ack")
+		test_ufence_drop_debugger_before_ack(fd);
+
 	igt_subtest("vma-ufence")
 		test_vma_ufence(fd, 0);
 
-- 
2.34.1

