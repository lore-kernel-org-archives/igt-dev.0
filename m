Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59733C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAE510E425;
	Mon, 29 Jul 2024 16:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cC/DQJsy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E0A10E420
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722268965; x=1753804965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xRyccqqqMB/IseWtLqKEBMD+X3++4FAJtYerOeVk+X0=;
 b=cC/DQJsy+C1Rnj5lLefo5j47QgRnonqeSacX/O9GuRvzMBYGrdOathFV
 /M+nYvYAr1KHGyEufDdXeD0wQSbq5IBLRxt5cdRmvOCuviQqu2ikNs/oY
 ZN/RGheVuzOn2rXiLjxWzW+fDVmzpxJswSpxFhESbD6H80QXZjIJRQrxe
 Crag7JnuVnsxTlePLu8dJq2tRzOO+S8FB78esKb+4zEKAct0dTEC8s6GP
 v5JMelxHOqzq0Azim5HlhBmStd6/Y0Fpsmymd5O9YEfAoqLSBVcwz/V7v
 HMRseFo5vnowtpLI0GbE5A/vUVPB0ct9f5zdQTqKz+AFidOmMv22xJZIm g==;
X-CSE-ConnectionGUID: m66o7jy9Rxq4qyg/xCa9CA==
X-CSE-MsgGUID: lkmgRvl2TKO0+ekpiK2CdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31426825"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31426825"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:45 -0700
X-CSE-ConnectionGUID: 19KFd6xVQxyOlS/UeLkGZQ==
X-CSE-MsgGUID: TJ3tQaWTT8yCHdwtMH5Xtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737284"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:30 -0700
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
Subject: [PATCH 04/66] lib/xe_eudebug: Add exec_queue support
Date: Mon, 29 Jul 2024 18:00:57 +0200
Message-Id: <20240729160159.37036-5-christoph.manszewski@intel.com>
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

Add support for exec_queue events to eudebug library.

Check event specific fields in post mortem log check. (Christoph)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/xe/xe_eudebug.c | 188 +++++++++++++++++++++++++++++++++++++++++++-
 lib/xe/xe_eudebug.h |   5 +-
 2 files changed, 189 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 70769e532..ca030704b 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -20,6 +20,17 @@ struct event_trigger {
 	struct igt_list_head link;
 };
 
+struct seqno_list_entry {
+	struct igt_list_head link;
+	uint64_t seqno;
+};
+
+struct match_dto {
+	struct drm_xe_eudebug_event *target;
+	struct igt_list_head *seqno_list;
+	uint64_t client_handle;
+};
+
 #define CLIENT_PID  1
 #define CLIENT_RUN  2
 #define CLIENT_FINI 3
@@ -41,6 +52,8 @@ static const char *type_to_str(unsigned int type)
 		return "client";
 	case DRM_XE_EUDEBUG_EVENT_VM:
 		return "vm";
+	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE:
+		return "exec_queue";
 	}
 
 	return "UNKNOWN";
@@ -83,6 +96,15 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *b)
 			evm->client_handle, evm->vm_handle);
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
+		struct drm_xe_eudebug_event_exec_queue *ee = (void *)e;
+
+		sprintf(b, "client_handle=%llu, vm_handle=%llu, "
+			   "exec_queue_handle=%llu, engine_class=%d, exec_queue_width=%d",
+			ee->client_handle, ee->vm_handle,
+			ee->exec_queue_handle, ee->engine_class, ee->width);
+		break;
+	}
 	default:
 		strcpy(b, "<...>");
 	}
@@ -309,6 +331,34 @@ static int match_type_and_flags(struct drm_xe_eudebug_event *a, void *data)
 	return 0;
 }
 
+static int match_fields(struct drm_xe_eudebug_event *a, void *data)
+{
+	struct drm_xe_eudebug_event *b = data;
+	int ret = 0;
+
+	ret = match_type_and_flags(a, data);
+	if (!ret)
+		return ret;
+
+	ret = 0;
+
+	switch (a->type) {
+	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
+		struct drm_xe_eudebug_event_exec_queue *ae = (void *)a;
+		struct drm_xe_eudebug_event_exec_queue *be = (void *)b;
+
+		if (ae->engine_class == be->engine_class && ae->width == be->width)
+			ret = 1;
+		break;
+	}
+	default:
+		ret = 1;
+		break;
+	}
+
+	return ret;
+}
+
 static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
 {
 	uint64_t h = *(uint64_t *)data;
@@ -328,6 +378,13 @@ static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
 			return 1;
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
+		struct drm_xe_eudebug_event_exec_queue *ee = (struct drm_xe_eudebug_event_exec_queue *)e;
+
+		if (ee->client_handle == h)
+			return 1;
+		break;
+	}
 	default:
 		break;
 	}
@@ -365,12 +422,43 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 			return 1;
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
+		struct drm_xe_eudebug_event_exec_queue *ee = (void *)e;
+		struct drm_xe_eudebug_event_exec_queue *filter = (struct drm_xe_eudebug_event_exec_queue *)data;
+
+		if (ee->exec_queue_handle == filter->exec_queue_handle)
+			return 1;
+		break;
+	}
 	default:
 		break;
 	}
 	return 0;
 }
 
+static int match_full(struct drm_xe_eudebug_event *e, void *data)
+{
+	struct seqno_list_entry *sl;
+
+	struct match_dto *md = (void *)data;
+	int ret = 0;
+
+	ret = match_client_handle(e, &md->client_handle);
+	if (!ret)
+		return 0;
+
+	ret = match_fields(e, md->target);
+	if (!ret)
+		return 0;
+
+	igt_list_for_each_entry(sl, md->seqno_list, link) {
+		if (sl->seqno == e->seqno)
+			return 0;
+	}
+
+	return 1;
+}
+
 static struct drm_xe_eudebug_event *
 event_type_match(struct xe_eudebug_event_log *l,
 		 struct drm_xe_eudebug_event *filter,
@@ -395,6 +483,21 @@ opposite_event_match(struct xe_eudebug_event_log *l,
 	return event_cmp(l, current, match_opposite_resource, filter);
 }
 
+static struct drm_xe_eudebug_event *
+event_match(struct xe_eudebug_event_log *l,
+	    struct drm_xe_eudebug_event *target,
+	    uint64_t client_handle,
+	    struct igt_list_head *seqno_list)
+{
+	struct match_dto md = {
+		.target = target,
+		.client_handle = client_handle,
+		.seqno_list = seqno_list,
+	};
+
+	return event_cmp(l, NULL, match_full, &md);
+}
+
 static void compare_client(struct xe_eudebug_event_log *c, struct drm_xe_eudebug_event *_ce,
 			   struct xe_eudebug_event_log *d, struct drm_xe_eudebug_event *_de)
 {
@@ -402,6 +505,9 @@ static void compare_client(struct xe_eudebug_event_log *c, struct drm_xe_eudebug
 	struct drm_xe_eudebug_event_client *de = (void *)_de;
 	struct drm_xe_eudebug_event *hc, *hd;
 
+	struct igt_list_head matched_seqno_list;
+	struct seqno_list_entry *entry, *tmp;
+
 	igt_assert(ce);
 	igt_assert(de);
 
@@ -409,13 +515,14 @@ static void compare_client(struct xe_eudebug_event_log *c, struct drm_xe_eudebug
 
 	hc = NULL;
 	hd = NULL;
+	IGT_INIT_LIST_HEAD(&matched_seqno_list);
 
 	do {
 		hc = client_match(c, ce->client_handle, hc);
 		if (!hc)
 			break;
 
-		hd = client_match(d, de->client_handle, hd);
+		hd = event_match(d, hc, de->client_handle, &matched_seqno_list);
 
 		igt_assert_f(hd, "%s (%llu): no matching event type %u found for client %llu\n",
 			     c->name,
@@ -426,9 +533,18 @@ static void compare_client(struct xe_eudebug_event_log *c, struct drm_xe_eudebug
 		igt_debug("comparing %s %llu vs %s %llu\n",
 			  c->name, hc->seqno, d->name, hd->seqno);
 
-		igt_assert_eq(hc->type, hd->type);
-		igt_assert_eq(hc->flags, hd->flags);
+		/*
+		 * Store the seqno of the event that was matched above,
+		 * inside 'matched_seqno_list', to avoid it getting matched
+		 * by subsequent 'event_match' calls.
+		 */
+		entry = malloc(sizeof(*entry));
+		entry->seqno = hd->seqno;
+		igt_list_add(&entry->link, &matched_seqno_list);
 	} while (hc);
+
+	igt_list_for_each_entry_safe(entry, tmp, &matched_seqno_list, link)
+		free(entry);
 }
 
 /*
@@ -1196,6 +1312,25 @@ static void vm_event(struct xe_eudebug_client *c, uint32_t flags, int client_fd,
 	xe_eudebug_event_log_write(c->log, (void *)&evm);
 }
 
+static void exec_queue_event(struct xe_eudebug_client *c, uint32_t flags,
+			     int client_fd, uint32_t vm_id,
+			     uint32_t exec_queue_handle, uint16_t class,
+			     uint16_t width)
+{
+	struct drm_xe_eudebug_event_exec_queue ee;
+
+	base_event(c, to_base(ee), DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+		   flags, sizeof(ee));
+
+	ee.client_handle = client_fd;
+	ee.vm_handle = vm_id;
+	ee.exec_queue_handle = exec_queue_handle;
+	ee.engine_class = class;
+	ee.width = width;
+
+	xe_eudebug_event_log_write(c->log, (void *)&ee);
+}
+
 /* Eu debugger wrappers around resource creating xe ioctls. */
 
 /**
@@ -1268,3 +1403,50 @@ void xe_eudebug_client_vm_destroy(struct xe_eudebug_client *c, int fd, uint32_t
 	xe_vm_destroy(fd, vm);
 	vm_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd, vm);
 }
+
+/**
+ * xe_eudebug_client_exec_queue_create:
+ * @c: pointer to xe_eudebug_client structure
+ * @fd: xe client
+ * @create: exec_queue create drm struct
+ *
+ * Calls xe exec queue create ioctl and logs the corresponding event in
+ * client's event log.
+ *
+ * Returns: valid exec queue handle
+ */
+uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd,
+					     struct drm_xe_exec_queue_create *create)
+{
+	uint16_t class = ((struct drm_xe_engine_class_instance *)(create->instances))[0].engine_class;
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, create), 0);
+
+	if (class == DRM_XE_ENGINE_CLASS_COMPUTE || class == DRM_XE_ENGINE_CLASS_RENDER)
+		exec_queue_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd, create->vm_id,
+				 create->exec_queue_id, class, create->width);
+
+	return create->exec_queue_id;
+}
+
+/**
+ * xe_eudebug_client_exec_queue_destroy:
+ * @c: pointer to xe_eudebug_client structure
+ * @fd: xe client
+ * @create: exec_queue create drm struct which was used for creation
+ *
+ * Calls xe exec_queue destroy ioctl and logs the corresponding event in
+ * client's event log.
+ */
+void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
+					  struct drm_xe_exec_queue_create *create)
+{
+	struct drm_xe_exec_queue_destroy destroy = { .exec_queue_id = create->exec_queue_id, };
+	uint16_t class = ((struct drm_xe_engine_class_instance *)(create->instances))[0].engine_class;
+
+	if (class == DRM_XE_ENGINE_CLASS_COMPUTE || class == DRM_XE_ENGINE_CLASS_RENDER)
+		exec_queue_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd, create->vm_id,
+				 create->exec_queue_id, class, create->width);
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy), 0);
+}
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 5ec63e46b..8dc153d27 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -138,6 +138,10 @@ void xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd);
 uint32_t xe_eudebug_client_vm_create(struct xe_eudebug_client *c, int fd,
 				     uint32_t flags, uint64_t ext);
 void xe_eudebug_client_vm_destroy(struct xe_eudebug_client *c, int fd, uint32_t vm);
+uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd,
+					     struct drm_xe_exec_queue_create *create);
+void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
+					  struct drm_xe_exec_queue_create *create);
 
 struct xe_eudebug_session *xe_eudebug_session_create(int fd,
 						     xe_eudebug_client_work_fn work,
@@ -146,4 +150,3 @@ struct xe_eudebug_session *xe_eudebug_session_create(int fd,
 void xe_eudebug_session_destroy(struct xe_eudebug_session *s);
 void xe_eudebug_session_run(struct xe_eudebug_session *s);
 void xe_eudebug_session_check(struct xe_eudebug_session *s, bool match_opposite);
-
-- 
2.34.1

