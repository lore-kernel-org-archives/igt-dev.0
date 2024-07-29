Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A04DC3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2922A10E42E;
	Mon, 29 Jul 2024 16:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTcrcLNI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0BA10E42E
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269129; x=1753805129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VU2cVQEFXw+J8YmnNl0vyP1tyVB4Ka7jjbHttiOJtik=;
 b=bTcrcLNI7KosnKYZRwHpHBP0oYrn9BBXq02rWqOK3UW7Ajxms1iigbvS
 HCVUCm5mMsSWkRp2MkrNMcd1xrA3ssNvOa/pf3gt7hy0+mwj+hll4un+R
 4de7FAoaRcf1uY1BRyEwFjgrMcf7MVzB4PfZhMSlxM20QgKsWvUFp2t2f
 VFFgXbTmypvMmV8EJmUdMEG/Ref16QdqG8RZCB6aEdqtkIe8kWb4KJ+eJ
 lSwlf2m0+8Oge/A1QQfd4suR3ZL3yjj/Gix5pttM80x2HHE80Yg96sRwh
 oduwcAelctKC54FHlQSGIk0OP/tcaap+gS/FnTqBTMlm08v55YocjEx/a g==;
X-CSE-ConnectionGUID: cE6Ok0XTQnSHhe0d/nTTew==
X-CSE-MsgGUID: 45JatjKNRjSqElm1LaPhhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427747"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427747"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:18 -0700
X-CSE-ConnectionGUID: NeoW1PTNTR+5Wk3FJLmy0g==
X-CSE-MsgGUID: lBM0WpcUQiyX+l4c+rwIuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53739742"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:14 -0700
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
Subject: [PATCH 56/66] tests/xe_eudebug_online: Add reset-with-attention test
Date: Mon, 29 Jul 2024 18:01:49 +0200
Message-Id: <20240729160159.37036-57-christoph.manszewski@intel.com>
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

From: Pawel Sikora <pawel.sikora@intel.com>

This new test performs a GPU GT forced reset on the attention event raised.
Then the test runs a new session with a workload to check if the GPU is usable.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 58 +++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 0b92507f4..c101bde2f 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -322,6 +322,25 @@ static void eu_attention_debug_trigger(struct xe_eudebug_debugger *d,
 
 }
 
+static void eu_attention_reset_trigger(struct xe_eudebug_debugger *d,
+					struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
+	uint32_t *ptr = (uint32_t *) att->bitmask;
+	struct online_debug_data *data = d->ptr;
+
+	igt_debug("EVENT[%llu] eu-attenttion with reset; threads=%d "
+		 "client[%llu], exec_queue[%llu], lrc[%llu], bitmask_size[%d]\n",
+		 att->base.seqno, count_set_bits(att->bitmask, att->bitmask_size),
+				att->client_handle, att->exec_queue_handle,
+				att->lrc_handle, att->bitmask_size);
+
+	for (uint32_t i = 0; i < att->bitmask_size/4; i += 2)
+		igt_debug("bitmask[%d] = 0x%08x%08x\n", i/2, ptr[i], ptr[i+1]);
+
+	xe_force_gt_reset_async(d->master_fd, data->hwe.gt_id);
+}
+
 static void copy_first_bit(uint8_t *dst, uint8_t *src, int size)
 {
 	bool found = false;
@@ -923,6 +942,42 @@ static void test_basic_online(int fd, struct drm_xe_engine_class_instance *hwe,
 	online_debug_data_destroy(data);
 }
 
+/**
+ * SUBTEST: reset-with-attention
+ * Description:
+ *	Check whether GPU is usable after resetting with attention raised 
+ *	(stopped on breakpoint) by running the same workload again.
+ */
+static void test_reset_with_attention_online(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+{
+	struct xe_eudebug_session *s1, *s2;
+	struct online_debug_data *data;
+
+	data = online_debug_data_create(hwe);
+	s1 = xe_eudebug_session_create(fd, run_online_client, flags, data);
+
+	xe_eudebug_debugger_add_trigger(s1->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_reset_trigger);
+	xe_eudebug_debugger_add_trigger(s1->d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					ufence_ack_trigger);
+
+	xe_eudebug_session_run(s1);
+	xe_eudebug_session_destroy(s1);
+
+	s2 = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	xe_eudebug_debugger_add_trigger(s2->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_resume_trigger);
+	xe_eudebug_debugger_add_trigger(s2->d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					ufence_ack_trigger);
+
+	xe_eudebug_session_run(s2);
+
+	online_session_check(s2, s2->flags);
+
+	xe_eudebug_session_destroy(s2);
+	online_debug_data_destroy(data);
+}
+
 /**
  * SUBTEST: interrupt-all
  * Description:
@@ -1162,6 +1217,9 @@ igt_main
 	test_gt_render_or_compute("tdctl-parameters", fd, hwe)
 		test_tdctl_parameters(fd, hwe, SHADER_LOOP);
 
+	test_gt_render_or_compute("reset-with-attention", fd, hwe)
+		test_reset_with_attention_online(fd, hwe, SHADER_BREAKPOINT);
+
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
 
-- 
2.34.1

