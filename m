Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7B3C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2C810E50A;
	Tue, 30 Jul 2024 11:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kUH+Ros6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF07F10E510
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340167; x=1753876167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zcwzHjAecS7TIGzwDS3kFtQgNYVTMBT3uLTlJk/B9CA=;
 b=kUH+Ros6a8PyNVn4vQXeCnClj6AsKaDrjtMYodqeMynIYoC7e5wnLJcU
 hwR1papsR0FmvEcnkJy6GjHQBrqWaJqB0pPW8b39wJLhLY+rwBASV6Hz7
 DepdlxPWrFAox4Ig+LsCJLTjab9+ViPpwgL8XYyo7ysu1KJYPYBHb+APE
 DjizMF0wSX80U6oO4U+BzMpWNrGZc8OoKRRZlWEEzb1znRLgf8bDZG0Rv
 hBA30GOHXnothh8uYx1fVukbypuSTFGcyFztJChbfbIa04jbDgCDbZiSl
 fAh276sFgsSaS6fetr9vLy15D7/VnRuPSutGnlvPwJ+7QLWoaxrN0gDQu w==;
X-CSE-ConnectionGUID: +o7Pztt3Rz6BfwAsDJkPZA==
X-CSE-MsgGUID: BKfXACYXQjCo+bzwCkjM2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20286739"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20286739"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:27 -0700
X-CSE-ConnectionGUID: 66WPVpcWTOiPKR775CAUIA==
X-CSE-MsgGUID: RScl4sOBQPCJN4Bqm72UMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217561"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:24 -0700
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
Subject: [PATCH i-g-t v2 55/66] tests/xe_eudebug_online: Add tdctl-parameters
 test
Date: Tue, 30 Jul 2024 13:45:12 +0200
Message-Id: <20240730114523.334156-56-christoph.manszewski@intel.com>
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

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Add tdctl-parameters test that checks negative scenarios of EU_THREADS
ioctl usage.

This patch shortens the loop in run_online_client in order to avoid
hitting the timeout that caused the test to fail.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug_online.c | 111 ++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 12edd0eb5..0b92507f4 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -995,6 +995,114 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	online_debug_data_destroy(data);
 }
 
+/**
+ * SUBTEST: tdctl-parameters
+ * Description:
+ *	Schedules EU workload which should last about a few seconds, then
+ *	checks negative scenarios of EU_THREADS ioctl usage, interrupts all threads,
+ *	checks whether attention event came, and resumes stopped threads back.
+ */
+static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+{
+	struct xe_eudebug_session *s;
+	struct online_debug_data *data;
+	uint32_t val;
+	uint32_t random_command;
+	uint32_t bitmask_size = query_attention_bitmask_size(fd, hwe->gt_id);
+	uint8_t *attention_bitmask = malloc(bitmask_size * sizeof(uint8_t));
+	igt_assert(attention_bitmask);
+
+	data = online_debug_data_create(hwe);
+	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_OPEN,
+					open_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+					exec_queue_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_debug_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_resume_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_METADATA,
+					create_metadata_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					ufence_ack_trigger);
+
+	igt_assert_eq(xe_eudebug_debugger_attach(s->d, s->c), 0);
+	xe_eudebug_debugger_start_worker(s->d);
+	xe_eudebug_client_start(s->c);
+
+	/* wait for workload to start */
+	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
+		/* collect needed data from triggers */
+		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
+			continue;
+
+		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
+			if (val != 0)
+				break;
+	}
+
+	pthread_mutex_lock(&data->mutex);
+	igt_assert(data->client_handle != -1);
+	igt_assert(data->exec_queue_handle != -1);
+	igt_assert(data->lrc_handle != -1);
+
+	/* fail on invalid lrc_handle */
+	igt_assert(__eu_ctl(s->d->fd, data->client_handle,
+			    data->exec_queue_handle, data->lrc_handle + 1,
+			    attention_bitmask, &bitmask_size,
+			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL) == -EINVAL);
+
+	/* fail on invalid exec_queue_handle */
+	igt_assert(__eu_ctl(s->d->fd, data->client_handle,
+			    data->exec_queue_handle + 1, data->lrc_handle,
+			    attention_bitmask, &bitmask_size,
+			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL) == -EINVAL);
+
+	/* fail on invalid client */
+	igt_assert(__eu_ctl(s->d->fd, data->client_handle + 1,
+			    data->exec_queue_handle, data->lrc_handle,
+			    attention_bitmask, &bitmask_size,
+			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL) == -EINVAL);
+
+	/*
+	 * bitmask size must be aligned to sizeof(u32) for all commands
+	 * and be zero for interrupt all
+	 */
+	bitmask_size = sizeof(uint32_t) - 1;
+	igt_assert(__eu_ctl(s->d->fd, data->client_handle,
+			    data->exec_queue_handle, data->lrc_handle,
+			    attention_bitmask, &bitmask_size,
+			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED, NULL) == -EINVAL);
+	bitmask_size = 0;
+
+	/* fail on invalid command */
+	random_command = random() | (DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME + 1);
+	igt_assert(__eu_ctl(s->d->fd, data->client_handle,
+			    data->exec_queue_handle, data->lrc_handle,
+			    attention_bitmask, &bitmask_size, random_command, NULL) == -EINVAL);
+
+	free(attention_bitmask);
+
+	eu_ctl_interrupt_all(s->d->fd, data->client_handle,
+			     data->exec_queue_handle, data->lrc_handle);
+	pthread_mutex_unlock(&data->mutex);
+
+	xe_eudebug_client_wait_done(s->c);
+
+	xe_eudebug_debugger_stop_worker(s->d, 1);
+
+	xe_eudebug_event_log_print(s->d->log, true);
+	xe_eudebug_event_log_print(s->c->log, true);
+
+	online_session_check(s, s->flags);
+
+	xe_eudebug_session_destroy(s);
+	online_debug_data_destroy(data);
+}
+
 static struct drm_xe_engine_class_instance *pick_compute(int fd, int gt)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -1051,6 +1159,9 @@ igt_main
 	test_gt_render_or_compute("interrupt-all-set-breakpoint", fd, hwe)
 		test_interrupt_all(fd, hwe, SHADER_LOOP | TRIGGER_RESUME_SET_BP);
 
+	test_gt_render_or_compute("tdctl-parameters", fd, hwe)
+		test_tdctl_parameters(fd, hwe, SHADER_LOOP);
+
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
 
-- 
2.34.1

