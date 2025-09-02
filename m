Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A81CA1009
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 12:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE8F10E6B2;
	Tue,  2 Sep 2025 12:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0vAaDgR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B3010E6B2
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 12:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816359; x=1788352359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TMibQxOjRcW41ebHPAf/Qq84msv2ijWV0HYJDkfKK/0=;
 b=i0vAaDgRHNFC8qtfO+iOipoleOLjy6DbSjWZMfWr6GdNbG8bUeXdysbv
 4sGQNg7EOmqmZvnwE2L/nbHUpvwgnT2u6QnIEoSl5EAkPZUjO1QQvcP34
 gr3hV6Osd6+gVLBU8p4j0Q6B9u2ZSFeirWis5OTYrZikiqE73BWpxaR06
 PHJf7Jdrd+XF/doOYkVIebW6DtBtP12sK2XMgLX65b4l3vtJyPcM7ENV2
 q3dIkFD/IfAtk0sgyMUShLknkYwdFp5WyeHiZmxI+OdIMLI7Ie+6x8TCQ
 uCuTtQCL7eVR5Nb+vpIHoEaIejauAyfNWf+fhSfgbZ6xYo+xv6yng1ahK A==;
X-CSE-ConnectionGUID: zKRP9koqRdm5/HA4kDtEKg==
X-CSE-MsgGUID: ux9Ao15CQCicUqVj+rn+NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70517418"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="70517418"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:38 -0700
X-CSE-ConnectionGUID: WOdvwiC0QIuTUttzy0vtwQ==
X-CSE-MsgGUID: OQXjjnF3TBGOAFCZkgBMZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171153334"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:37 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 5/7] lib/xe_eudebug: Introduce __xe_eudebug_ack_ufence
Date: Tue,  2 Sep 2025 14:32:01 +0200
Message-Id: <20250902123203.4907-6-dominik.karol.piatkowski@intel.com>
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

Introduce __xe_eudebug_ack_ufence to allow disabling igt_vlog calls.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 14 +++++++++++---
 lib/xe/xe_eudebug.h |  3 +++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 5aec75282..3e9c995de 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -2328,8 +2328,9 @@ void xe_eudebug_client_metadata_destroy(struct xe_eudebug_client *c, int fd,
 	metadata_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd, id, type, len);
 }
 
-void xe_eudebug_ack_ufence(int debugfd,
-			   const struct drm_xe_eudebug_event_vm_bind_ufence *f)
+void __xe_eudebug_ack_ufence(int debugfd,
+			     const struct drm_xe_eudebug_event_vm_bind_ufence *f,
+			     bool suppress_logs)
 {
 	struct drm_xe_eudebug_ack_event ack = { 0, };
 	char event_str[XE_EUDEBUG_EVENT_STRING_MAX_LEN];
@@ -2340,6 +2341,13 @@ void xe_eudebug_ack_ufence(int debugfd,
 	ack.seqno = f->base.seqno;
 
 	xe_eudebug_event_to_str((void *)f, event_str, XE_EUDEBUG_EVENT_STRING_MAX_LEN);
-	igt_debug("delivering ack for event: %s\n", event_str);
+	if (!suppress_logs)
+		igt_debug("delivering ack for event: %s\n", event_str);
 	igt_assert_eq(igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_ACK_EVENT, &ack), 0);
 }
+
+void xe_eudebug_ack_ufence(int debugfd,
+			   const struct drm_xe_eudebug_event_vm_bind_ufence *f)
+{
+	__xe_eudebug_ack_ufence(debugfd, f, false);
+}
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 3adde5f6c..f4bcef2cc 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -195,6 +195,9 @@ void xe_eudebug_client_vm_bind_op_metadata_event(struct xe_eudebug_client *c,
 						 uint64_t metadata_handle, uint64_t metadata_cookie);
 void xe_eudebug_client_vm_bind_ufence_event(struct xe_eudebug_client *c, uint32_t event_flags,
 					    uint64_t ref_seqno);
+void __xe_eudebug_ack_ufence(int debugfd,
+			     const struct drm_xe_eudebug_event_vm_bind_ufence *f,
+			     bool suppress_logs);
 void xe_eudebug_ack_ufence(int debugfd,
 			   const struct drm_xe_eudebug_event_vm_bind_ufence *f);
 
-- 
2.34.1

