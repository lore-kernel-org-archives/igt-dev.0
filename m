Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEA9C02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 11:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC55C10EAF2;
	Fri,  7 Feb 2025 11:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFfvfdrf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BABE10EAF4
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 11:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738928972; x=1770464972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cdhC9K/k8VWLPblOGEHiSKh/rpOmvXI03II2F4DLenY=;
 b=SFfvfdrftM7fmpWouQoY5KrA7CLrt6FXPM0q2aBgvN3MhDXTbjqSCz8a
 UsHly2Z+xax7fhb+w9lRcM4e0y/476md0G44UccglP7ydp8tmvheiIjqW
 1Qw0iexbS3oIgEA58dDnW7S35sB8OK6kCTdefRLvqTMJXzMlKOH1s2TAU
 d/0XL9Ir1dVKEuGuEGkGVXUWWlS1wN3Ag+gkzqnBKyGXQFhi5V4yhk5Zf
 J71ers8DdTPUKYPXQ/0oNgT2Wr+swF5/tTrngf/c+wo6oB1skiJMwyjTc
 y0CEWC9HVLAbwCrSSmK4m6oOofHtHywrEuN5tgimVlefl7jFO3kkl+paa Q==;
X-CSE-ConnectionGUID: gU2e2+P6QV+bOsJocaG+rw==
X-CSE-MsgGUID: uB7Oo6CuStyl6c7CSduBUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39683417"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39683417"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:49:31 -0800
X-CSE-ConnectionGUID: MG4RAPzjS82+ALU1RsuiJQ==
X-CSE-MsgGUID: q2V1ROBUQNe5v1TzzbE/0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="116506763"
Received: from unknown (HELO mkuoppal-desk.fi.intel.com) ([10.237.72.193])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:49:26 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 2/4] Revert "lib/xe_eudebug: Add support for exec queue
 placements events"
Date: Fri,  7 Feb 2025 13:49:33 +0200
Message-ID: <20250207114935.1996323-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250207114935.1996323-1-mika.kuoppala@linux.intel.com>
References: <20250207114935.1996323-1-mika.kuoppala@linux.intel.com>
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

Exec queue placements support was dropped as unused.

This reverts commit 8c550873064f46ccc17661572f1aeec70a533213.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 89 ++-------------------------------------------
 1 file changed, 3 insertions(+), 86 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 19bec2d25..1205d945b 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -78,8 +78,6 @@ static const char *type_to_str(unsigned int type)
 		return "vm";
 	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE:
 		return "exec_queue";
-	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS:
-		return "exec_queue_placements";
 	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION:
 		return "attention";
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND:
@@ -150,27 +148,6 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
 			ee->exec_queue_handle, ee->engine_class, ee->width);
 		break;
 	}
-	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
-		struct drm_xe_eudebug_event_exec_queue_placements *ee = igt_container_of(e, ee,
-											 base);
-		struct drm_xe_engine_class_instance *instances = (void *)(ee->instances);
-		int i, l;
-
-		l = sprintf(buf, "client_handle=%llu, vm_handle=%llu, "
-			    "exec_queue_handle=%llu, lrc_handle=%llu, "
-			    "num_placements=%d, gt_id=%d, mask=[",
-			    ee->client_handle, ee->vm_handle,
-			    ee->exec_queue_handle, ee->lrc_handle,
-			    ee->num_placements, instances[0].gt_id);
-
-		for (i = 0; i < ee->num_placements; i++)
-			l += sprintf(buf + l, "%s%d pad%d, ",
-				     xe_engine_class_short_string(instances[i].engine_class),
-				     instances[i].engine_instance, instances[i].pad);
-		buf[l - 2] = ']';
-
-		break;
-	}
 	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION: {
 		struct drm_xe_eudebug_event_eu_attention *ea = igt_container_of(e, ea, base);
 
@@ -458,19 +435,6 @@ static int match_fields(struct drm_xe_eudebug_event *a, void *data)
 			ret = 1;
 		break;
 	}
-	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
-		struct drm_xe_eudebug_event_exec_queue_placements *ae = igt_container_of(a, ae,
-											 base);
-		struct drm_xe_eudebug_event_exec_queue_placements *be = igt_container_of(b, be,
-											 base);
-
-		if (ae->num_placements == be->num_placements &&
-		    memcmp(ae->instances, be->instances,
-			   sizeof(uint64_t) * ae->num_placements) == 0)
-			ret = 1;
-
-		break;
-	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
 		struct drm_xe_eudebug_event_vm_bind *ea = igt_container_of(a, ea, base);
 		struct drm_xe_eudebug_event_vm_bind *eb = igt_container_of(b, eb, base);
@@ -538,14 +502,6 @@ static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
 			return 1;
 		break;
 	}
-	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
-		struct drm_xe_eudebug_event_exec_queue_placements *ee = igt_container_of(e, ee,
-											 base);
-
-		if (ee->client_handle == h)
-			return 1;
-		break;
-	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
 		struct drm_xe_eudebug_event_vm_bind *evmb = igt_container_of(e, evmb, base);
 
@@ -1044,11 +1000,10 @@ xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l, uint32_t fil
 			if (XE_EUDEBUG_EVENT_IS_FILTERED(ev1->type, filter))
 				continue;
 
-			/* No opposite matching for some events */
+			/* No opposite matching for binds */
 			if ((ev1->type >= DRM_XE_EUDEBUG_EVENT_VM_BIND &&
 			     ev1->type <= DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE) ||
-			    ev1->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA ||
-			    ev1->type == DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS)
+			    ev1->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA)
 				continue;
 
 			ev2 = opposite_event_match(l, ev1, ev1);
@@ -1739,36 +1694,6 @@ static void exec_queue_event(struct xe_eudebug_client *c, uint32_t flags,
 	xe_eudebug_event_log_write(c->log, (void *)&ee);
 }
 
-static void exec_queue_placements_event(struct xe_eudebug_client *c,
-					int client_fd, uint32_t vm_id,
-					uint32_t exec_queue_handle,
-					uint16_t width, uint16_t lrc_no,
-					uint16_t num_placements,
-					struct drm_xe_engine_class_instance *eci)
-{
-	struct drm_xe_eudebug_event_exec_queue_placements *ee;
-	struct drm_xe_engine_class_instance *instances;
-	size_t sz = sizeof(*ee) + num_placements * sizeof(uint64_t);
-
-	ee = calloc(1, sz);
-	igt_assert(ee);
-
-	base_event(c, to_base(*ee), DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS,
-		   DRM_XE_EUDEBUG_EVENT_CREATE, sz);
-
-	ee->client_handle = client_fd;
-	ee->vm_handle = vm_id;
-	ee->exec_queue_handle = exec_queue_handle;
-	ee->num_placements = num_placements;
-
-	instances = (struct drm_xe_engine_class_instance *)(ee->instances);
-	for (int j = 0; j < num_placements; j++)
-		instances[j] = eci[j * width + lrc_no];
-
-	xe_eudebug_event_log_write(c->log, (void *)ee);
-	free(ee);
-}
-
 static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
 			   int client_fd, uint32_t id, uint64_t type, uint64_t len)
 {
@@ -1963,18 +1888,10 @@ uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd
 		    ext->value & DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)
 			send = true;
 
-	if (send) {
+	if (send)
 		exec_queue_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd, create->vm_id,
 				 create->exec_queue_id, class, create->width);
 
-		for (int i = 0; i < create->width; i++) {
-			exec_queue_placements_event(c, fd, create->vm_id, create->exec_queue_id,
-						    create->width, i,
-						    create->num_placements,
-						    instances);
-		}
-	}
-
 	return create->exec_queue_id;
 }
 
-- 
2.43.0

