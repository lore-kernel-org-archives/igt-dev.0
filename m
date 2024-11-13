Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6274ED41C18
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 08:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BAB10E6B2;
	Wed, 13 Nov 2024 08:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHFZS/bm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6802910E6B1
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 08:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731487939; x=1763023939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6bB0TOY0HED/IY4oiQCiHQ2EhbBgTBrgZs01IJfFM1A=;
 b=JHFZS/bm/jv5zK3M0MZ3TQ134EbXfG9HxiSndMsfqu2hD7pGVxpNNyxr
 UJJR4C6Se2A0hlnKUaKd1Jw+r4oO3IuqAMpina6hbsT1XeEy8/DS0EgAr
 vqDfyP6/4yZn+g6/N72jcRXF98o933Be2ycZoULkS7fyVeo6siTYeAHdS
 u0CuKOfEAAeGekcbhdpES+A+IGmqzAVtfaA7xhxnBOjDNo5Y5XyVdpukS
 nGnFAyXXy7wJrRgWQgbak1nTYRzDGprEoWP9zXFHLvOzt9D+P49W11AAR
 2lVkvZTMcfB4Ma5wW3TOSoh/kPC6IUsX2k987iEMdtheOJOhLHCtQzpKH g==;
X-CSE-ConnectionGUID: mC6dtVXZQEGytyhFa+bUbw==
X-CSE-MsgGUID: by1Mah1rR6eVOPO0qd6UBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31335365"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31335365"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 00:52:19 -0800
X-CSE-ConnectionGUID: GhxytQbvSpOCMvYtCeOZRA==
X-CSE-MsgGUID: HA/aGet2RuexVJxF9UOOoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="92579679"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.246.180])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 00:52:17 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 2/3] lib/xe_eudebug: Add support for exec queue
 placements events.
Date: Wed, 13 Nov 2024 09:51:54 +0100
Message-Id: <20241113085155.209198-2-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113085155.209198-1-dominik.grzegorzek@intel.com>
References: <20241113085155.209198-1-dominik.grzegorzek@intel.com>
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

Adds definition and support for DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS,
which is sent during exec_queue creation/discovery.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/xe/xe_eudebug.c | 101 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 74aa26024..c5814421b 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -77,6 +77,8 @@ static const char *type_to_str(unsigned int type)
 		return "vm";
 	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE:
 		return "exec_queue";
+	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS:
+		return "exec_queue_placements";
 	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION:
 		return "attention";
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND:
@@ -120,6 +122,18 @@ static const char *flags_to_str(unsigned int flags)
 	return "flags unknown";
 }
 
+static const char *eu_engine_class_to_str(uint16_t engine_class)
+{
+	switch (engine_class) {
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		return "ccs";
+	case DRM_XE_ENGINE_CLASS_RENDER:
+		return "rcs";
+	default:
+		return "unsupported class";
+	}
+}
+
 static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *buf)
 {
 	switch (e->type) {
@@ -145,6 +159,26 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
 			ee->exec_queue_handle, ee->engine_class, ee->width);
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
+		struct drm_xe_eudebug_event_exec_queue_placements *ee = (void *)e;
+		struct drm_xe_engine_class_instance *instances = (void *)(ee->instances);
+		int i, l;
+
+		l = sprintf(buf, "client_handle=%llu, vm_handle=%llu, "
+			    "exec_queue_handle=%llu, lrc_handle=%llu, "
+			    "num_placements=%d, gt_id=%d, mask=[",
+			    ee->client_handle, ee->vm_handle,
+			    ee->exec_queue_handle, ee->lrc_handle,
+			    ee->num_placements, instances[0].gt_id);
+
+		for (i = 0; i < ee->num_placements; i++)
+			l += sprintf(buf + l, "%s%d pad%d, ",
+				     eu_engine_class_to_str(instances[i].engine_class),
+				     instances[i].engine_instance, instances[i].pad);
+		buf[l - 2] = ']';
+
+		break;
+	}
 	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION: {
 		struct drm_xe_eudebug_event_eu_attention *ea = (void *)e;
 
@@ -423,6 +457,17 @@ static int match_fields(struct drm_xe_eudebug_event *a, void *data)
 			ret = 1;
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
+		struct drm_xe_eudebug_event_exec_queue_placements *ae = (void *)a;
+		struct drm_xe_eudebug_event_exec_queue_placements *be = (void *)b;
+
+		if (ae->num_placements == be->num_placements &&
+		    memcmp(ae->instances, be->instances,
+			   sizeof(uint64_t) * ae->num_placements) == 0)
+			ret = 1;
+
+		break;
+	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
 		struct drm_xe_eudebug_event_vm_bind *ea = (void *)a;
 		struct drm_xe_eudebug_event_vm_bind *eb = (void *)b;
@@ -490,6 +535,13 @@ static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
 			return 1;
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
+		struct drm_xe_eudebug_event_exec_queue_placements *ee = (void *)e;
+
+		if (ee->client_handle == h)
+			return 1;
+		break;
+	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
 		struct drm_xe_eudebug_event_vm_bind *evmb = (void *)e;
 
@@ -986,10 +1038,11 @@ xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l, uint32_t fil
 			if (XE_EUDEBUG_EVENT_IS_FILTERED(ev1->type, filter))
 				continue;
 
-			/* No opposite matching for binds */
+			/* No opposite matching for some events */
 			if ((ev1->type >= DRM_XE_EUDEBUG_EVENT_VM_BIND &&
 			     ev1->type <= DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE) ||
-			    ev1->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA)
+			    ev1->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA ||
+			    ev1->type == DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS)
 				continue;
 
 			ev2 = opposite_event_match(l, ev1, ev1);
@@ -1679,6 +1732,36 @@ static void exec_queue_event(struct xe_eudebug_client *c, uint32_t flags,
 	xe_eudebug_event_log_write(c->log, (void *)&ee);
 }
 
+static void exec_queue_placements_event(struct xe_eudebug_client *c,
+					int client_fd, uint32_t vm_id,
+					uint32_t exec_queue_handle,
+					uint16_t width, uint16_t lrc_no,
+					uint16_t num_placements,
+					struct drm_xe_engine_class_instance *eci)
+{
+	struct drm_xe_eudebug_event_exec_queue_placements *ee;
+	struct drm_xe_engine_class_instance *instances;
+	size_t sz = sizeof(*ee) + num_placements * sizeof(uint64_t);
+
+	ee = calloc(1, sz);
+	igt_assert(ee);
+
+	base_event(c, to_base(*ee), DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS,
+		   DRM_XE_EUDEBUG_EVENT_CREATE, sz);
+
+	ee->client_handle = client_fd;
+	ee->vm_handle = vm_id;
+	ee->exec_queue_handle = exec_queue_handle;
+	ee->num_placements = num_placements;
+
+	instances = (struct drm_xe_engine_class_instance *)(ee->instances);
+	for (int j = 0; j < num_placements; j++)
+		instances[j] = eci[j * width + lrc_no];
+
+	xe_eudebug_event_log_write(c->log, (void *)ee);
+	free(ee);
+}
+
 static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
 			   int client_fd, uint32_t id, uint64_t type, uint64_t len)
 {
@@ -1853,6 +1936,7 @@ void xe_eudebug_client_vm_destroy(struct xe_eudebug_client *c, int fd, uint32_t
 uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd,
 					     struct drm_xe_exec_queue_create *create)
 {
+	struct drm_xe_engine_class_instance *instances;
 	struct drm_xe_ext_set_property *ext;
 	bool send = false;
 	uint16_t class;
@@ -1860,7 +1944,8 @@ uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd
 	igt_assert(c);
 	igt_assert(create);
 
-	class = ((struct drm_xe_engine_class_instance *)(create->instances))[0].engine_class;
+	instances = (struct drm_xe_engine_class_instance *)(create->instances);
+	class = instances[0].engine_class;
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, create), 0);
 
@@ -1871,10 +1956,18 @@ uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd
 		    ext->value & DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)
 			send = true;
 
-	if (send)
+	if (send) {
 		exec_queue_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd, create->vm_id,
 				 create->exec_queue_id, class, create->width);
 
+		for (int i = 0; i < create->width; i++) {
+			exec_queue_placements_event(c, fd, create->vm_id, create->exec_queue_id,
+						    create->width, i,
+						    create->num_placements,
+						    instances);
+		}
+	}
+
 	return create->exec_queue_id;
 }
 
-- 
2.34.1

