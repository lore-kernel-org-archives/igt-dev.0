Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0934FEFB54
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 14:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3193410EBA3;
	Fri, 27 Feb 2026 14:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNygFHlj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345A910EBA7
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 14:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772202428; x=1803738428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U9erTB1BxXscaZX0pJGTVUM+9ugEBuS6yz7ExGuzgik=;
 b=gNygFHljKGZ3dLbUR7aXpMrZ7gt4aaPE/xZSyBVCj8Izu/qTa+V/jLeq
 gd3bKUbeBOOks4ATxjcY69tJT0q6oe0wqAusH0Nilr25tNlL8Q0gSVrY+
 Ty1UCsl3J7vPq1D/VBRhDXe+4LtzIu4ACOcwGF1HEytvRfwaJKaM1SBNQ
 +NQPGoK0ksni03/0JR53wmyAlSEw5CL34zZaEUA/kapAGstcROJkygVFP
 zzzMWaDwtqdxxsBm4PyxF9+keaFyRyOl3EI2NrOa5V3pbCf9zNxA3xfkm
 aF+W925BlsYhVSPF8EiOU/oqh3L0er3bHrctDyNWOL/11FKyLHANY5wKe Q==;
X-CSE-ConnectionGUID: Kp+i6A/aRny0oNsjw6Q0Og==
X-CSE-MsgGUID: CvZcUb9bTq6LKegsYhRU+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73157026"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73157026"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 06:27:08 -0800
X-CSE-ConnectionGUID: uDJvr7c9Toa5Jyv+BX1VhQ==
X-CSE-MsgGUID: Wx+FVYb6SYWQA2NwpishOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="214757267"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 06:27:07 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maciej.patelczyk@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/1] tests/intel/xe_eudebug: Add basic-vm-bind-ufence-no-ack
 test
Date: Fri, 27 Feb 2026 15:26:38 +0100
Message-Id: <20260227142638.3264013-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227142638.3264013-1-jan.maslak@intel.com>
References: <20260227142638.3264013-1-jan.maslak@intel.com>
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

Add a test that verifies the kernel correctly blocks unbind operations
on VMAs whose VM_BIND ufence has not yet been ACKed by the debugger.

The test performs N vm_bind operations with user fences attached, then
partially acknowledges them: the first (N-2) ufences are ACKed
immediately, while the remaining 2 are withheld. It checks that:
- the ACKed ufences complete successfully,
- the un-ACKed ufences time out as blocked,
- unbind attempts on the un-ACKed VMAs are denied with -EBUSY,
- after the remaining ACKs are delivered, the blocked ufences complete
  and the unbinds succeed.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 tests/intel/xe_eudebug.c | 144 +++++++++++++++++++++++++++++++++------
 1 file changed, 124 insertions(+), 20 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 134f31766..c899316fb 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -66,6 +66,7 @@ static void test_sysfs_toggle(int fd)
 #define VM_BIND_DELAY_UFENCE_ACK	(1 << 8)
 #define VM_BIND_UFENCE_RECONNECT	(1 << 9)
 #define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 10)
+#define VM_BIND_UFENCE_NO_ACK		(1 << 11)
 #define TEST_FAULTABLE			(1 << 30)
 #define TEST_DISCOVERY			(1 << 31)
 
@@ -1924,6 +1925,7 @@ static void test_metadata_attach(int fd, unsigned int flags, int num_clients)
 }
 
 #define STAGE_CLIENT_WAIT_ON_UFENCE_DONE 1337
+#define STAGE_NO_ACK_READY_FOR_PARTIAL_ACK 1338
 
 #define UFENCE_EVENT_COUNT_EXPECTED 4
 #define UFENCE_EVENT_COUNT_MAX 100
@@ -1973,6 +1975,72 @@ static void client_wait_ufences(struct xe_eudebug_client *c,
 	}
 }
 
+#define NO_ACK_HELD_COUNT 2
+
+static void client_wait_ufences_no_ack(struct xe_eudebug_client *c,
+				       int fd, uint32_t vm,
+				       struct ufence_bind *binds, int count)
+{
+	const int64_t short_timeout_ns = 500 * NSEC_PER_MSEC;
+	const int64_t long_timeout_ns = XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC;
+	int64_t timeout_ns;
+	int err;
+
+	igt_assert(count >= NO_ACK_HELD_COUNT);
+
+	/* Signal debugger that binds are done - it will ACK first (N-2) fences */
+	xe_eudebug_client_signal_stage(c, STAGE_NO_ACK_READY_FOR_PARTIAL_ACK);
+
+	/* First (count - NO_ACK_HELD_COUNT) fences should be ACKed already - expect success */
+	for (int i = 0; i < count - NO_ACK_HELD_COUNT; i++) {
+		struct ufence_bind *b = &binds[i];
+
+		timeout_ns = long_timeout_ns;
+		err = __xe_wait_ufence(fd, &b->fence_data->vm_sync, b->f.timeline_value,
+				       0, &timeout_ns);
+		igt_assert_eq(err, 0);
+		igt_assert_eq(b->fence_data->vm_sync, b->f.timeline_value);
+		igt_debug("no-ack: wait #%d completed (was ACKed)\n", i);
+	}
+
+	/* Last NO_ACK_HELD_COUNT fences should NOT be ACKed yet - expect timeout */
+	for (int i = count - NO_ACK_HELD_COUNT; i < count; i++) {
+		struct ufence_bind *b = &binds[i];
+
+		timeout_ns = short_timeout_ns;
+		err = __xe_wait_ufence(fd, &b->fence_data->vm_sync, b->f.timeline_value,
+				       0, &timeout_ns);
+		igt_assert_eq(err, -ETIME);
+		igt_assert_neq(b->fence_data->vm_sync, b->f.timeline_value);
+		igt_debug("no-ack: wait #%d blocked as expected (not ACKed)\n", i);
+	}
+
+	/* Try to unbind un-ACKed VMAs - kernel should deny with -EBUSY */
+	for (int i = count - NO_ACK_HELD_COUNT; i < count; i++) {
+		struct ufence_bind *b = &binds[i];
+
+		err = __xe_vm_bind(fd, vm, 0, 0, 0, b->addr, b->range,
+				   DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
+		igt_assert_eq(err, -EBUSY);
+		igt_debug("no-ack: unbind #%d denied with -EBUSY as expected\n", i);
+	}
+
+	/* Signal debugger that we verified the blocked state - it will now send remaining ACKs */
+	xe_eudebug_client_signal_stage(c, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
+
+	/* Now last NO_ACK_HELD_COUNT fences should complete after debugger ACKs them */
+	for (int i = count - NO_ACK_HELD_COUNT; i < count; i++) {
+		struct ufence_bind *b = &binds[i];
+
+		timeout_ns = long_timeout_ns;
+		err = __xe_wait_ufence(fd, &b->fence_data->vm_sync, b->f.timeline_value,
+				       0, &timeout_ns);
+		igt_assert_eq(err, 0);
+		igt_assert_eq(b->fence_data->vm_sync, b->f.timeline_value);
+		igt_debug("no-ack: wait #%d completed after delayed ACK\n", i);
+	}
+}
+
 static struct ufence_bind *create_binds_with_ufence(int fd, int count)
 {
 	struct ufence_bind *binds;
@@ -2024,7 +2092,10 @@ static void basic_ufence_client(struct xe_eudebug_client *c)
 						&b->f, 1, 0);
 	}
 
-	client_wait_ufences(c, fd, binds, n);
+	if (c->flags & VM_BIND_UFENCE_NO_ACK)
+		client_wait_ufences_no_ack(c, fd, vm, binds, n);
+	else
+		client_wait_ufences(c, fd, binds, n);
 
 	for (int i = 0; i < n; i++) {
 		struct ufence_bind *b = &binds[i];
@@ -2147,6 +2218,13 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
  * Functionality: SIGINT
  * Description:
  *	Give user fence in application, hold it, send SIGINT to client and check if anything breaks.
+ *
+ * SUBTEST: basic-vm-bind-ufence-no-ack
+ * Functionality: VM bind event
+ * Description:
+ *	Verify that missing debugger ACK for VM_BIND ufence blocks the application.
+ *	ACKs only the first (N-2) ufences immediately, verifies last 2 are blocked,
+ *	then delivers remaining ACKs and confirms client unblocks.
  */
 static void test_basic_ufence(int fd, unsigned int flags)
 {
@@ -2169,26 +2247,49 @@ static void test_basic_ufence(int fd, unsigned int flags)
 	xe_eudebug_debugger_start_worker(d);
 	xe_eudebug_client_start(c);
 
-	xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
-	xe_eudebug_assert_f(d, wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * MSEC_PER_SEC) == 0,
-			    "missing ufence events\n");
-
-	if (flags & VM_BIND_DELAY_UFENCE_ACK)
-		sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
-
-	if (flags & VM_BIND_UFENCE_SIGINT_CLIENT) {
-		filter = XE_EUDEBUG_FILTER_ALL;
-		kill(c->pid, SIGINT);
-		c->pid = 0;
-		c->done = 1;
-	} else if (flags & VM_BIND_UFENCE_RECONNECT) {
-		filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM |
-				XE_EUDEBUG_FILTER_EVENT_OPEN;
-		xe_eudebug_debugger_detach(d);
-		xe_eudebug_client_wait_done(c);
-		igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
+	if (flags & VM_BIND_UFENCE_NO_ACK) {
+		/* Wait for client to signal binds are done */
+		xe_eudebug_debugger_wait_stage(s, STAGE_NO_ACK_READY_FOR_PARTIAL_ACK);
+		xe_eudebug_assert_f(d,
+				    wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC *
+							   MSEC_PER_SEC) == 0,
+				    "missing ufence events\n");
+
+		/* ACK only first (n-2) fences */
+		for (int i = 0; i < UFENCE_EVENT_COUNT_EXPECTED - NO_ACK_HELD_COUNT; i++)
+			xe_eudebug_ack_ufence(d->fd, &priv->ufence_events[i]);
+
+		/* Wait for client to verify blocked state and unbind attempts */
+		xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
+
+		/* ACK remaining fences */
+		for (int i = UFENCE_EVENT_COUNT_EXPECTED - NO_ACK_HELD_COUNT;
+		     i < UFENCE_EVENT_COUNT_EXPECTED; i++)
+			xe_eudebug_ack_ufence(d->fd, &priv->ufence_events[i]);
 	} else {
-		ack_fences(d);
+		xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
+		xe_eudebug_assert_f(d,
+				    wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC *
+							   MSEC_PER_SEC) == 0,
+				    "missing ufence events\n");
+
+		if (flags & VM_BIND_DELAY_UFENCE_ACK)
+			sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
+
+		if (flags & VM_BIND_UFENCE_SIGINT_CLIENT) {
+			filter = XE_EUDEBUG_FILTER_ALL;
+			kill(c->pid, SIGINT);
+			c->pid = 0;
+			c->done = 1;
+		} else if (flags & VM_BIND_UFENCE_RECONNECT) {
+			filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM |
+					XE_EUDEBUG_FILTER_EVENT_OPEN;
+			xe_eudebug_debugger_detach(d);
+			xe_eudebug_client_wait_done(c);
+			igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
+		} else {
+			ack_fences(d);
+		}
 	}
 
 	xe_eudebug_client_wait_done(c);
@@ -2882,6 +2983,9 @@ int igt_main()
 	igt_subtest("basic-vm-bind-ufence-sigint-client")
 		test_basic_ufence(fd, VM_BIND_UFENCE_SIGINT_CLIENT);
 
+	igt_subtest("basic-vm-bind-ufence-no-ack")
+		test_basic_ufence(fd, VM_BIND_UFENCE_NO_ACK);
+
 	igt_subtest("basic-vm-bind-discovery")
 		test_basic_discovery(fd, VM_BIND, true);
 
-- 
2.34.1

