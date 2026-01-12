Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA925C9EC88
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5669D10E3CA;
	Mon, 12 Jan 2026 13:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="amWYoaks";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EF910E3CA
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222840; x=1799758840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bbKLwIU3bVebwveOGF8YGujHxvEZdFWiOyJYFckum6U=;
 b=amWYoaksVjmdKz4NWEcUalUm2X1GpWey6cxrt/Wt4fiugv4jXhWP8GsB
 mOidKJsTzaS25Pfk5Ralv4aoF8b4VnVWHH2HnP3r7ZWnZJSAkndOXzPQc
 yuj8CCg5B31j2gslRsTEYDtmLFhN+mArJ+SwUKs1WJC4QrCNHUUgi8uU0
 E/3e6sLSvhVZvJZUQquW7zkcbfTw8UAlA+svkBWhXLjtixLg4putX7Lvm
 51mHVyF/bFsAN9lUNzgGb2PdRjoOQW3zCEZxkgXcLNlDXETwPU1pqgcLF
 5MgrcGNlhsIon1J59is120b0azyx3TSVjKlbs3PBSNSxI4o/vg2+RARBK g==;
X-CSE-ConnectionGUID: pVbuFMU9T9mRbJbLgci6Ew==
X-CSE-MsgGUID: wO8NkKlYTH+U5hqvFkJcPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545533"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545533"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:40 -0800
X-CSE-ConnectionGUID: cC7rNvzyTSeY4hAScywTQA==
X-CSE-MsgGUID: Cz6VggUvT5youoP4Hc4k5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204094959"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:37 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 07/21] tests/xe_eudebug: Adapt basic-read-event
Date: Mon, 12 Jan 2026 14:59:53 +0200
Message-ID: <20260112130008.1649357-8-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
References: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

Adapt basic-read-event test to rely on vm create/destroy events for
positive test path since client create/destroy events are no longer
present.

Also update the assert for blocking event_read ioctl with no events
to expect -ETIMEDOUT

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/intel/xe_eudebug.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 8d673b68bb..3c7a13f6fe 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -55,15 +55,16 @@ static void test_sysfs_toggle(int fd)
 #define STAGE_PRE_DEBUG_RESOURCES_DONE	1
 #define STAGE_DISCOVERY_DONE		2
 
-#define CREATE_VMS			(1 << 0)
-#define CREATE_EXEC_QUEUES		(1 << 1)
-#define VM_BIND				(1 << 2)
-#define VM_BIND_VM_DESTROY		(1 << 3)
-#define VM_BIND_EXTENDED		(1 << 4)
-#define VM_BIND_OP_MAP_USERPTR		(1 << 5)
-#define VM_BIND_DELAY_UFENCE_ACK	(1 << 6)
-#define VM_BIND_UFENCE_RECONNECT	(1 << 7)
-#define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 8)
+#define CREATE_VM			(1 << 0)
+#define CREATE_VMS			(1 << 1)
+#define CREATE_EXEC_QUEUES		(1 << 2)
+#define VM_BIND				(1 << 3)
+#define VM_BIND_VM_DESTROY		(1 << 4)
+#define VM_BIND_EXTENDED		(1 << 5)
+#define VM_BIND_OP_MAP_USERPTR		(1 << 6)
+#define VM_BIND_DELAY_UFENCE_ACK	(1 << 7)
+#define VM_BIND_UFENCE_RECONNECT	(1 << 8)
+#define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 9)
 #define TEST_FAULTABLE			(1 << 30)
 #define TEST_DISCOVERY			(1 << 31)
 
@@ -379,6 +380,11 @@ static void run_basic_client(struct xe_eudebug_client *c)
 {
 	int i;
 
+	if (c->flags & CREATE_VM) {
+		int vm = xe_eudebug_client_vm_create(c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+		xe_eudebug_client_vm_destroy(c, vm);
+	}
+
 	if (c->flags & CREATE_VMS) {
 		const uint32_t flags[] = {
 			DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | DRM_XE_VM_CREATE_FLAG_LR_MODE,
@@ -775,7 +781,7 @@ static void test_read_event(int fd)
 	event = calloc(1, MAX_EVENT_SIZE);
 	igt_assert(event);
 
-	c = xe_eudebug_client_create(fd, run_basic_client, 0, NULL);
+	c = xe_eudebug_client_create(fd, run_basic_client, CREATE_VM, NULL);
 	d = xe_eudebug_debugger_create(fd, 0, NULL);
 
 	igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
@@ -784,14 +790,15 @@ static void test_read_event(int fd)
 	/* Negative read event - no events to read */
 	event->len = MAX_EVENT_SIZE;
 	event->type = DRM_XE_EUDEBUG_EVENT_READ;
-	igt_assert_eq(read_event(d->fd, event), -ENOENT);
+	igt_assert_eq(read_event(d->fd, event), -ETIMEDOUT);
 
 	xe_eudebug_client_start(c);
 
-	/* Positive read event - client create */
+	/* Positive read event - vm create */
 	igt_assert_eq(poll_event(d->fd, 500), 1);
 	event->type = DRM_XE_EUDEBUG_EVENT_READ;
 	igt_assert_eq(read_event(d->fd, event), 0);
+	igt_assert_eq(event->type, DRM_XE_EUDEBUG_EVENT_VM);
 	igt_assert_eq(event->flags, DRM_XE_EUDEBUG_EVENT_CREATE);
 
 	igt_assert_eq(poll_event(d->fd, 500), 1);
@@ -826,8 +833,9 @@ static void test_read_event(int fd)
 	/* event->len should now contain exact len */
 	igt_assert_lt(sizeof(*event), event->len);
 
-	/* Positive read event - client destroy */
+	/* Positive read event - vm destroy */
 	igt_assert_eq(read_event(d->fd, event), 0);
+	igt_assert_eq(event->type, DRM_XE_EUDEBUG_EVENT_VM);
 	igt_assert_eq(event->flags, DRM_XE_EUDEBUG_EVENT_DESTROY);
 
 	fcntl(d->fd, F_SETFL, fcntl(d->fd, F_GETFL) | O_NONBLOCK);
-- 
2.43.0

