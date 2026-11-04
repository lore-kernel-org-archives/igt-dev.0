Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E187606A32C
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 01:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ncPSFOK/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC4910F8E6;
	Wed,  4 Nov 2026 01:04:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DF010E335
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 00:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793753725; x=1825289725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xX/6K1mBFvkCo+omQ5AXrYD9qk9DvRm6jLrYF0rEHOw=;
 b=ncPSFOK//RicgelUu5IgOaUvj86T4/G60xYnPgBx3amBW+sgaqELV+cS
 DxrIbj4kyw3+ZE1rZlDCh4xL4+iED7Km7N0jLN4hYiRG7YD4fh2CzrQ8+
 osrjI1mXa/zWAFa9byx8+2cKfRH1ZJ7MIC9voHB1ngNE+CiwpNkgcxILr
 qsK6XD453cWxgCCMLaHYAMFmi6F+l4XbuayKJXmYux4zof9JoacxeyDZR
 xLhIhnchnTWzYtTPPKIKFnWAr4J4vz1jRN+kr/NMHNFpGPXyHRqGt2j++
 EgReawosrrcJyDnH4nyh7Jn4lC0DeJv+J21gWvgq6yOWjMSv4Rar1MmWn A==;
X-CSE-ConnectionGUID: t4xtGBtlQo2wJNuwWxWLmA==
X-CSE-MsgGUID: nuTRFWo+QRSae6fMgJYQUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2506020"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2506020"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:09 -0800
X-CSE-ConnectionGUID: ZwwNYyszQj6OR8jB2E7W+A==
X-CSE-MsgGUID: YrjzcaEdSN6X56Twa47+CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6421552"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com
Subject: [PATCH v2 6/8] tests/intel/xe_oa: Check that blocked OA stream
 waiters are woken up on unbind
Date: Tue,  3 Nov 2026 16:55:12 -0800
Message-ID: <20261104005505.3232485-16-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
References: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a variant that opens the stream disabled. A disabled stream
produces no OA data, so a reader blocked in read() and a poller blocked
in poll() stay blocked until the stream dies. Check that unbind wakes
them up with ENODEV and POLLERR | POLLHUP.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 137 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 131 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 8474d506612b..f1fe5f44c408 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -17,6 +17,7 @@
 #include <dirent.h>
 #include <time.h>
 #include <poll.h>
+#include <pthread.h>
 #include <math.h>
 
 #include "drm.h"
@@ -2864,6 +2865,7 @@ static bool mem_is_zero(const void *vaddr, size_t len)
 }
 
 #define UNBIND_CLOSE_BEFORE_REBIND	(1 << 0)
+#define UNBIND_STREAM_DISABLED		(1 << 1)
 
 #define UNBIND_MAX_STREAMS	16
 
@@ -2878,12 +2880,25 @@ struct unbind_stream {
 	size_t size;
 };
 
+struct unbind_waiter {
+	pthread_t thread;
+	int fd;
+	size_t report_size;
+	int ret;
+	int err;
+	short revents;
+};
+
 static char unbind_pci_slot[NAME_MAX];
 static bool unbind_state_stale;
 static struct unbind_stream unbind_streams[UNBIND_MAX_STREAMS];
 static int unbind_num_streams;
+static struct unbind_waiter unbind_reader_waiter, unbind_poller_waiter;
+static bool unbind_waiters_started;
+static volatile bool unbind_waiters_stop;
 
-static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_unit *oau)
+static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_unit *oau,
+			       unsigned int flags)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
@@ -2904,6 +2919,10 @@ static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_u
 	s->properties[n++] = __ff(fmt);
 	s->properties[n++] = DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT;
 	s->properties[n++] = oa_exponent_default;
+	if (flags & UNBIND_STREAM_DISABLED) {
+		s->properties[n++] = DRM_XE_OA_PROPERTY_OA_DISABLED;
+		s->properties[n++] = true;
+	}
 	igt_assert_lte(n, ARRAY_SIZE(s->properties));
 
 	s->param.num_properties = n / 2;
@@ -2983,6 +3002,93 @@ static void unbind_stream_check_dead(struct unbind_stream *s, const char *when)
 	igt_assert_eq(errno, ENODEV);
 }
 
+/*
+ * Blocking read until it fails. Run on a disabled stream, which produces no OA data, so the
+ * read blocks until the stream dies.
+ */
+static void *unbind_reader(void *arg)
+{
+	struct unbind_waiter *w = arg;
+	size_t size = w->report_size * 64;
+	uint8_t *buf = malloc(size);
+
+	/* No igt_assert outside the main thread, report through the waiter result */
+	if (!buf) {
+		w->ret = -1;
+		w->err = ENOMEM;
+		return NULL;
+	}
+
+	do {
+		w->ret = read(w->fd, buf, size);
+		w->err = errno;
+	} while (!unbind_waiters_stop &&
+		 (w->ret > 0 || (w->ret < 0 && (w->err == EINTR || w->err == EIO))));
+
+	free(buf);
+	return NULL;
+}
+
+/* Poll until the stream reports an error, also on a disabled stream so it blocks */
+static void *unbind_poller(void *arg)
+{
+	struct unbind_waiter *w = arg;
+	struct pollfd pfd = { .fd = w->fd, .events = POLLIN };
+
+	do {
+		pfd.revents = 0;
+		w->ret = poll(&pfd, 1, -1);
+		w->err = errno;
+	} while (!unbind_waiters_stop &&
+		 ((w->ret > 0 && !(pfd.revents & (POLLERR | POLLHUP))) ||
+		  (w->ret < 0 && w->err == EINTR)));
+
+	w->revents = pfd.revents;
+	return NULL;
+}
+
+static void unbind_waiters_start(struct unbind_stream *s)
+{
+	struct unbind_waiter *reader = &unbind_reader_waiter, *poller = &unbind_poller_waiter;
+
+	memset(reader, 0, sizeof(*reader));
+	memset(poller, 0, sizeof(*poller));
+	reader->fd = s->fd;
+	poller->fd = s->fd;
+	reader->report_size = s->report_size;
+	unbind_waiters_stop = false;
+
+	igt_assert_eq(pthread_create(&reader->thread, NULL, unbind_reader, reader), 0);
+	if (pthread_create(&poller->thread, NULL, unbind_poller, poller)) {
+		unbind_waiters_stop = true;
+		pthread_join(reader->thread, NULL);
+		igt_assert_f(false, "failed to create poller thread\n");
+	}
+	unbind_waiters_started = true;
+
+	/* Let the waiters block */
+	usleep(100 * 1000);
+}
+
+static void unbind_waiters_join(void)
+{
+	struct unbind_waiter *reader = &unbind_reader_waiter, *poller = &unbind_poller_waiter;
+
+	igt_set_timeout(60, "OA stream waiters not woken up on unbind");
+	pthread_join(reader->thread, NULL);
+	pthread_join(poller->thread, NULL);
+	unbind_waiters_started = false;
+	igt_reset_timeout();
+
+	igt_debug("reader: ret=%d errno=%s\n", reader->ret, strerror(reader->err));
+	igt_assert_eq(reader->ret, -1);
+	igt_assert_eq(reader->err, ENODEV);
+
+	igt_debug("poller: ret=%d revents=0x%x\n", poller->ret, poller->revents);
+	igt_assert_eq(poller->ret, 1);
+	igt_assert_eq(poller->revents, POLLERR | POLLHUP);
+}
+
 /*
  * Restore a bound device and fresh device state if an unbind/rebind test bailed out
  * half way, so the remaining subtests can run.
@@ -2992,6 +3098,13 @@ static void unbind_rebind_recover(void)
 	char path[PATH_MAX];
 	int i;
 
+	if (unbind_waiters_started) {
+		unbind_waiters_stop = true;
+		pthread_join(unbind_reader_waiter.thread, NULL);
+		pthread_join(unbind_poller_waiter.thread, NULL);
+		unbind_waiters_started = false;
+	}
+
 	for (i = 0; i < unbind_num_streams; i++) {
 		struct unbind_stream *s = &unbind_streams[i];
 
@@ -3019,24 +3132,32 @@ static void unbind_rebind_recover(void)
 /**
  * SUBTEST: unbind-rebind-stream
  * Description: Open OA streams with mmapped OA buffers and test the effects of unbind
- *		and rebind: streams die, mmaps read a zeroed dummy page and refuse access
- *		through /proc/self/mem, no new streams can be opened on the removed device
- *		and the device works after rebind.
+ *		and rebind: streams die, waiters are woken up, mmaps read a zeroed dummy
+ *		page and refuse access through /proc/self/mem, no new streams can be
+ *		opened on the removed device and the device works after rebind.
  */
 static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int flags)
 {
 	struct unbind_stream *streams = unbind_streams;
 	struct unbind_stream *primary = &streams[0];
+	bool disabled = flags & UNBIND_STREAM_DISABLED;
 	int ret, i;
 
 	igt_device_get_pci_slot_name(drm_fd, unbind_pci_slot);
 	igt_debug("Device %s\n", unbind_pci_slot);
 
 	unbind_num_streams = 0;
-	unbind_stream_open(&streams[unbind_num_streams++], oau0);
+	unbind_stream_open(&streams[unbind_num_streams++], oau0, flags);
 	igt_debug("Opened %d OA stream(s)\n", unbind_num_streams);
 
-	unbind_stream_check_live(primary);
+	/*
+	 * A disabled stream produces no OA data, so a reader and a poller stay blocked on it
+	 * until unbind kills the stream
+	 */
+	if (disabled)
+		unbind_waiters_start(primary);
+	else
+		unbind_stream_check_live(primary);
 
 	/* Guard against a wedged unbind/bind */
 	igt_set_timeout(60, "xe unbind timed out (wedged?)");
@@ -3047,6 +3168,9 @@ static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int f
 	igt_reset_timeout();
 	igt_assert_f(ret == 0, "xe unbind failed: %s\n", strerror(-ret));
 
+	if (disabled)
+		unbind_waiters_join();
+
 	for (i = 0; i < unbind_num_streams; i++)
 		unbind_stream_check_dead(&streams[i], "after-unbind");
 
@@ -5566,6 +5690,7 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 		} unbind_variants[] = {
 			{ "close", UNBIND_CLOSE_BEFORE_REBIND },
 			{ "open", 0 },
+			{ "disabled", UNBIND_STREAM_DISABLED },
 		};
 
 		for (int i = 0; i < ARRAY_SIZE(unbind_variants); i++) {
-- 
2.55.0

