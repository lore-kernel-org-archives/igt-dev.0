Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F29CA1005
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 12:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903AB10E6B4;
	Tue,  2 Sep 2025 12:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvPAA2We";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9B010E6B8
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 12:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816362; x=1788352362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Bjq0PKf0kGrIdPPNtDfBXOTqFCnvrXDq9Q0CekZpgo=;
 b=ZvPAA2WeXO66bI9tWWStRq8FpcygMEqKz/auXSlnBzfpNC0sKPf5ZlyI
 TpoCG1nMaB2z/PxDRHrAt3y5GvBYjlUvfYfZeT3qsRJC7SzgTjptUpO4I
 41uXs3Ui6kUZr7y4zAI5WrEJJfN4hF0bwpBzJdpIlFZw9+AJQsI4uf8ij
 K25Q3+ctkjMZJ5R44AGEd59uZUD3QJQfJdl+aaQkL++kXaY8+C6xN+buw
 7Cihqt5UtAmBo7Vlgqiuizz9jGy0XPaZ6KIUkmXAWTtevoIDY3bO049l6
 GLKpYjqsCFE9oSl/8qG9RRPCBW+cgMsXrJFhXdvbAf8xIndL0lXBk6IXI w==;
X-CSE-ConnectionGUID: amBDjb3wSAmGur73Oov7gQ==
X-CSE-MsgGUID: xoAuzxmtSraUu94V8pbGqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70517424"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="70517424"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:42 -0700
X-CSE-ConnectionGUID: uvjO5TR7RrONJnRQQDPCsw==
X-CSE-MsgGUID: xAQ0DWHxTDG72fksZhutRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171153365"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:40 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 7/7] tests/xe_eudebug_online: Introduce flags to eu_ctl
 functions
Date: Tue,  2 Sep 2025 14:32:03 +0200
Message-Id: <20250902123203.4907-8-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
References: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
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

Introduce flags argument to eu_ctl and __eu_ctl, use it to disable
igt_vlog call inside __eu_ctl for set-breakpoint-sigint-debugger. This
allows for deadlock avoidance caused by sporadic timing of SIGINT during
igt_vlog.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 55 +++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index d48f6a724..12757cc7e 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -283,7 +283,7 @@ static const char *td_ctl_cmd_to_str(uint32_t cmd)
 static int __eu_ctl(int debugfd, uint64_t client,
 		    uint64_t exec_queue, uint64_t lrc,
 		    uint8_t *bitmask, uint32_t *bitmask_size,
-		    uint32_t cmd, uint64_t *seqno)
+		    uint32_t cmd, uint64_t *seqno, uint64_t flags)
 {
 	struct drm_xe_eudebug_eu_control control = {
 		.client_handle = lower_32_bits(client),
@@ -302,7 +302,8 @@ static int __eu_ctl(int debugfd, uint64_t client,
 	if (ret < 0)
 		return -errno;
 
-	igt_debug("EU CONTROL[%llu]: %s\n", control.seqno, td_ctl_cmd_to_str(cmd));
+	if (!(flags & SIGINT_DURING_TEST))
+		igt_debug("EU CONTROL[%llu]: %s\n", control.seqno, td_ctl_cmd_to_str(cmd));
 
 	if (bitmask_size)
 		*bitmask_size = control.bitmask_size;
@@ -315,12 +316,12 @@ static int __eu_ctl(int debugfd, uint64_t client,
 
 static uint64_t eu_ctl(int debugfd, uint64_t client,
 		       uint64_t exec_queue, uint64_t lrc,
-		       uint8_t *bitmask, uint32_t *bitmask_size, uint32_t cmd)
+		       uint8_t *bitmask, uint32_t *bitmask_size, uint32_t cmd, uint64_t flags)
 {
 	uint64_t seqno;
 
 	igt_assert_eq(__eu_ctl(debugfd, client, exec_queue, lrc, bitmask,
-			       bitmask_size, cmd, &seqno), 0);
+			       bitmask_size, cmd, &seqno, flags), 0);
 
 	return seqno;
 }
@@ -334,7 +335,7 @@ static bool intel_gen_needs_resume_wa(int fd)
 
 static uint64_t eu_ctl_resume(int fd, int debugfd, uint64_t client,
 			      uint64_t exec_queue, uint64_t lrc,
-			      uint8_t *bitmask, uint32_t bitmask_size)
+			      uint8_t *bitmask, uint32_t bitmask_size, uint64_t flags)
 {
 	int i;
 
@@ -349,22 +350,22 @@ static uint64_t eu_ctl_resume(int fd, int debugfd, uint64_t client,
 	}
 
 	return eu_ctl(debugfd, client, exec_queue, lrc, bitmask, &bitmask_size,
-		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME);
+		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME, flags);
 }
 
 static inline uint64_t eu_ctl_stopped(int debugfd, uint64_t client,
 				      uint64_t exec_queue, uint64_t lrc,
-				      uint8_t *bitmask, uint32_t *bitmask_size)
+				      uint8_t *bitmask, uint32_t *bitmask_size, uint64_t flags)
 {
 	return eu_ctl(debugfd, client, exec_queue, lrc, bitmask, bitmask_size,
-		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED);
+		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED, flags);
 }
 
 static inline uint64_t eu_ctl_interrupt_all(int debugfd, uint64_t client,
-					    uint64_t exec_queue, uint64_t lrc)
+					    uint64_t exec_queue, uint64_t lrc, uint64_t flags)
 {
 	return eu_ctl(debugfd, client, exec_queue, lrc, NULL, 0,
-		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL);
+		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, flags);
 }
 
 struct online_debug_data {
@@ -627,7 +628,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 	igt_assert(bitmask);
 
 	eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
-		       att->lrc_handle, bitmask, &bitmask_size);
+		       att->lrc_handle, bitmask, &bitmask_size, d->flags);
 	igt_assert(bitmask_size == att->bitmask_size);
 
 	/* No guarantee that all pagefaulting eu threads will raise attention */
@@ -684,7 +685,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 
 	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
 						    att->exec_queue_handle, att->lrc_handle,
-						    bitmask, att->bitmask_size);
+						    bitmask, att->bitmask_size, d->flags);
 
 	free(bitmask);
 }
@@ -777,7 +778,7 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
 
 	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
 						    att->exec_queue_handle, att->lrc_handle,
-						    att->bitmask, att->bitmask_size);
+						    att->bitmask, att->bitmask_size, d->flags);
 
 	if (data->single_step_bitmask)
 		for (int i = 0; i < att->bitmask_size; i++)
@@ -993,7 +994,7 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
 
 	ret = __eu_ctl(d->fd, att->client_handle, att->exec_queue_handle, att->lrc_handle,
 		       att->bitmask, &att->bitmask_size, DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME,
-		       &seqno);
+		       &seqno, d->flags);
 
 	/*
 	 * XXX: build a better sync between workload lifetime vs resume.
@@ -1811,7 +1812,7 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	igt_assert(data->client_handle != -1);
 	igt_assert(data->exec_queue_handle != -1);
 	eu_ctl_interrupt_all(s->debugger->fd, data->client_handle,
-			     data->exec_queue_handle, data->lrc_handle);
+			     data->exec_queue_handle, data->lrc_handle, s->debugger->flags);
 	pthread_mutex_unlock(&data->mutex);
 
 	xe_eudebug_client_wait_done(s->client);
@@ -1917,7 +1918,7 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	 */
 	igt_assert_eq(__eu_ctl(s->debugger->fd, debugee_data->client_handle,
 		      debugee_data->exec_queue_handle, debugee_data->lrc_handle, NULL, 0,
-		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL), -EINVAL);
+		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL, s->debugger->flags), -EINVAL);
 	pthread_mutex_unlock(&debugee_data->mutex);
 
 	xe_force_gt_reset_async(s->debugger->master_fd, debugee_data->hwe.gt_id);
@@ -1998,19 +1999,22 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle,
 			    data->exec_queue_handle, data->lrc_handle + 1,
 			    attention_bitmask, &bitmask_size,
-			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL) == -EINVAL);
+			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL,
+			    s->debugger->flags) == -EINVAL);
 
 	/* fail on invalid exec_queue_handle */
 	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle,
 			    data->exec_queue_handle + 1, data->lrc_handle,
 			    attention_bitmask, &bitmask_size,
-			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL) == -EINVAL);
+			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL,
+			    s->debugger->flags) == -EINVAL);
 
 	/* fail on invalid client */
 	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle + 1,
 			    data->exec_queue_handle, data->lrc_handle,
 			    attention_bitmask, &bitmask_size,
-			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL) == -EINVAL);
+			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL,
+			    s->debugger->flags) == -EINVAL);
 
 	/*
 	 * bitmask size must be aligned to sizeof(u32) for all commands
@@ -2020,19 +2024,21 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle,
 			    data->exec_queue_handle, data->lrc_handle,
 			    attention_bitmask, &bitmask_size,
-			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED, NULL) == -EINVAL);
+			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED, NULL,
+			    s->debugger->flags) == -EINVAL);
 	bitmask_size = 0;
 
 	/* fail on invalid command */
 	random_command = random() | (DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME + 1);
 	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle,
 			    data->exec_queue_handle, data->lrc_handle,
-			    attention_bitmask, &bitmask_size, random_command, NULL) == -EINVAL);
+			    attention_bitmask, &bitmask_size, random_command, NULL,
+			    s->debugger->flags) == -EINVAL);
 
 	free(attention_bitmask);
 
 	eu_ctl_interrupt_all(s->debugger->fd, data->client_handle,
-			     data->exec_queue_handle, data->lrc_handle);
+			     data->exec_queue_handle, data->lrc_handle, s->debugger->flags);
 	pthread_mutex_unlock(&data->mutex);
 
 	xe_eudebug_client_wait_done(s->client);
@@ -2143,7 +2149,7 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
 	igt_assert(data->client_handle != -1);
 	igt_assert(data->exec_queue_handle != -1);
 	eu_ctl_interrupt_all(s->debugger->fd, data->client_handle,
-			     data->exec_queue_handle, data->lrc_handle);
+			     data->exec_queue_handle, data->lrc_handle, s->debugger->flags);
 	pthread_mutex_unlock(&data->mutex);
 
 	xe_eudebug_client_wait_done(s->client);
@@ -2452,7 +2458,8 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
 				eus = (struct drm_xe_eudebug_event_eu_attention *)data[i]->exception_event;
 				eu_ctl_resume(s[i]->debugger->master_fd, s[i]->debugger->fd,
 					      eus->client_handle, eus->exec_queue_handle,
-					      eus->lrc_handle, eus->bitmask, eus->bitmask_size);
+					      eus->lrc_handle, eus->bitmask, eus->bitmask_size,
+					      s[i]->debugger->flags);
 				free(eus);
 
 			}
-- 
2.34.1

