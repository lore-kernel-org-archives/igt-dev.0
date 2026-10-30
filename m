Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00265606A322
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 22:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kiIFeVIb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A963810E1B0;
	Fri, 30 Oct 2026 22:42:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAECC10E8E0
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 22:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793400025; x=1824936025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lex0UlRfwAnYUYME0qqkYMeADJu6ODx12Q1HxvKW9i8=;
 b=kiIFeVIbdG3kKj6E1NY6+05b3bekQUJcm/U2Tu9iV0KxZ61LFjh7Uspf
 d6H0jxPR9ayrw+FSOjaV1E+/zr+D4yMXVphi5LWig+pgKBDMOu5UICIE5
 jk9maYdfLHUBx6wboPVPAiL2WAW6I9PsyOY4buauIeEOZOGpArr/L0XFB
 VCKKDT2K4u+FIB1ZK1APmEBfYaGbWAYit6wWMaeMDz/pUl4hqp68xtSu1
 FQrxeWFKCmw55wUfMeJt694xxvewxi6VkP/qQeYaNzsEwNwmDcAP0/YIQ
 WTXqntXKxyZZnybO3q8ADC6zU/MnGRgp1QaGsT9obsfYd3Ijq8ExDFiAV Q==;
X-CSE-ConnectionGUID: cOCJighdSUGjyfGsK1dwWw==
X-CSE-MsgGUID: pL1Avl6rQ5K/rDeu2fwqGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2165496"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2165496"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:40:14 -0700
X-CSE-ConnectionGUID: S4LIrwjESV2acUcV5BwV0g==
X-CSE-MsgGUID: mUOeapDKRwK6DFNnGTzRKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5874302"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:40:15 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com,
	riana.tauro@intel.com
Subject: [PATCH v2 3/3] tests/intel/xe_oa: Add unbind/rebind test with an open
 OA stream
Date: Fri, 30 Oct 2026 15:40:15 -0700
Message-ID: <20261030224011.2268663-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030224011.2268663-5-umesh.nerlige.ramappa@intel.com>
References: <20261030224011.2268663-5-umesh.nerlige.ramappa@intel.com>
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

Open an OA stream, unbind and rebind the xe device, and log the state
of the stream fd (poll/read/ioctls) after removal and after probe.
Close stream either before or after the rebind.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 455 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 455 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 66e7bf88c745..26d6f3329332 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -17,11 +17,14 @@
 #include <dirent.h>
 #include <time.h>
 #include <poll.h>
+#include <pthread.h>
+#include <setjmp.h>
 #include <math.h>
 
 #include "drm.h"
 #include "igt.h"
 #include "igt_device.h"
+#include "igt_pci.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
 #include "xe/xe_ioctl.h"
@@ -2778,6 +2781,436 @@ test_enable_disable(const struct drm_xe_oa_unit *oau)
 	__perf_close(stream_fd);
 }
 
+/*
+ * The stream fd of a removed device stays valid but the stream is dead: poll reports
+ * POLLERR | POLLHUP and read and all stream ioctls fail with -ENODEV. This holds after
+ * rebind too, since the stream belongs to the removed device instance.
+ */
+static void probe_stream_after_removal(int fd, const char *when)
+{
+	struct drm_xe_oa_stream_info info = {};
+	uint8_t buf[4096];
+	struct pollfd pfd = { .fd = fd, .events = POLLIN };
+	int ret, err;
+
+	ret = poll(&pfd, 1, 1000);
+	err = errno;
+	igt_debug("[%s] poll: ret=%d revents=0x%x errno=%s\n", when, ret, pfd.revents,
+		  ret < 0 ? strerror(err) : "-");
+	igt_assert_eq(ret, 1);
+	igt_assert_eq(pfd.revents, POLLERR | POLLHUP);
+
+	errno = 0;
+	ret = read(fd, buf, sizeof(buf));
+	err = errno;
+	igt_debug("[%s] read: ret=%d errno=%s\n", when, ret, ret < 0 ? strerror(err) : "-");
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(err, ENODEV);
+
+	errno = 0;
+	ret = igt_ioctl(fd, DRM_XE_OBSERVATION_IOCTL_INFO, &info);
+	err = errno;
+	igt_debug("[%s] ioctl INFO: ret=%d errno=%s oa_buf_size=%" PRIu64 "\n", when, ret,
+		  ret < 0 ? strerror(err) : "-", (uint64_t)info.oa_buf_size);
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(err, ENODEV);
+	igt_assert_eq_u64(info.oa_buf_size, 0);
+
+	errno = 0;
+	ret = igt_ioctl(fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+	err = errno;
+	igt_debug("[%s] ioctl DISABLE: ret=%d errno=%s\n", when, ret,
+		  ret < 0 ? strerror(err) : "-");
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(err, ENODEV);
+
+	errno = 0;
+	ret = igt_ioctl(fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
+	err = errno;
+	igt_debug("[%s] ioctl ENABLE: ret=%d errno=%s\n", when, ret,
+		  ret < 0 ? strerror(err) : "-");
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(err, ENODEV);
+}
+
+static sigjmp_buf sigbus_jmp;
+static void __attribute__((noreturn)) sigbus_trap(int sig)
+{
+	siglongjmp(sigbus_jmp, sig);
+}
+
+/* Access to an OA buffer mapping of a removed device must raise SIGBUS */
+static void assert_sigbus_access(const void *vaddr)
+{
+	struct sigaction sa = { .sa_handler = sigbus_trap }, old_sa;
+	uint32_t dummy;
+
+	sigemptyset(&sa.sa_mask);
+	igt_assert_eq(sigaction(SIGBUS, &sa, &old_sa), 0);
+
+	switch (sigsetjmp(sigbus_jmp, 1)) {
+	case SIGBUS:
+		break;
+	case 0:
+		dummy = READ_ONCE(*(const volatile uint32_t *)vaddr);
+		(void)dummy;
+		/* fallthrough */
+	default:
+		igt_assert_f(false, "OA buffer access did not raise SIGBUS\n");
+		break;
+	}
+
+	igt_assert_eq(sigaction(SIGBUS, &old_sa, NULL), 0);
+}
+
+#define UNBIND_CLOSE_BEFORE_REBIND	(1 << 0)
+#define UNBIND_STREAM_DISABLED		(1 << 1)
+#define UNBIND_EXEC_QUEUE		(1 << 2)
+#define UNBIND_ALL_UNITS		(1 << 3)
+
+#define UNBIND_MAX_STREAMS	16
+
+struct unbind_stream {
+	/* Not a drm_xe_oa_unit pointer, the query data is freed on unbind */
+	int oa_unit_id;
+	uint64_t properties[20];
+	struct intel_xe_oa_open_prop param;
+	size_t report_size;
+	int fd;
+	void *vaddr;
+	size_t size;
+};
+
+struct unbind_waiter {
+	pthread_t thread;
+	int fd;
+	size_t report_size;
+	int ret;
+	int err;
+	short revents;
+};
+
+static char unbind_pci_slot[NAME_MAX];
+static bool unbind_state_stale;
+static struct unbind_stream unbind_streams[UNBIND_MAX_STREAMS];
+static int unbind_num_streams;
+static struct unbind_waiter unbind_reader_waiter, unbind_poller_waiter;
+static bool unbind_waiters_started;
+static volatile bool unbind_waiters_stop;
+
+static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_unit *oau,
+			       unsigned int flags, uint32_t exec_q,
+			       const struct drm_xe_engine_class_instance *hwe)
+{
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
+	uint64_t fmt = test_set->perf_oa_format;
+	struct drm_xe_oa_stream_info info = {};
+	int n = 0;
+
+	s->oa_unit_id = oau->oa_unit_id;
+	s->fd = -1;
+	s->vaddr = NULL;
+	s->properties[n++] = DRM_XE_OA_PROPERTY_OA_UNIT_ID;
+	s->properties[n++] = oau->oa_unit_id;
+	s->properties[n++] = DRM_XE_OA_PROPERTY_SAMPLE_OA;
+	s->properties[n++] = true;
+	s->properties[n++] = DRM_XE_OA_PROPERTY_OA_METRIC_SET;
+	s->properties[n++] = test_set->perf_oa_metrics_set;
+	s->properties[n++] = DRM_XE_OA_PROPERTY_OA_FORMAT;
+	s->properties[n++] = __ff(fmt);
+	s->properties[n++] = DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT;
+	s->properties[n++] = oa_exponent_default;
+	if (flags & UNBIND_STREAM_DISABLED) {
+		s->properties[n++] = DRM_XE_OA_PROPERTY_OA_DISABLED;
+		s->properties[n++] = true;
+	}
+	if (exec_q) {
+		s->properties[n++] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
+		s->properties[n++] = exec_q;
+		s->properties[n++] = DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE;
+		s->properties[n++] = hwe->engine_instance;
+		s->properties[n++] = DRM_XE_OA_PROPERTY_NO_PREEMPT;
+		s->properties[n++] = true;
+	}
+	igt_assert_lte(n, ARRAY_SIZE(s->properties));
+
+	s->param.num_properties = n / 2;
+	s->param.properties_ptr = to_user_pointer(s->properties);
+	s->report_size = get_oa_format(fmt).size;
+
+	s->fd = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &s->param);
+	igt_assert_lte(0, s->fd);
+
+	do_ioctl(s->fd, DRM_XE_OBSERVATION_IOCTL_INFO, &info);
+	s->size = info.oa_buf_size;
+	s->vaddr = mmap(NULL, s->size, PROT_READ, MAP_PRIVATE, s->fd, 0);
+	igt_assert(s->vaddr != MAP_FAILED);
+
+	/* Fault in the mapping while the device is still bound */
+	(void)READ_ONCE(*(const volatile uint32_t *)s->vaddr);
+}
+
+static void unbind_stream_close(struct unbind_stream *s)
+{
+	igt_assert_eq(munmap(s->vaddr, s->size), 0);
+	s->vaddr = NULL;
+	close(s->fd);
+	s->fd = -1;
+}
+
+static void unbind_stream_check_dead(struct unbind_stream *s, const char *when)
+{
+	void *vaddr;
+
+	igt_debug("[%s] checking stream on oa unit %d\n", when, s->oa_unit_id);
+
+	probe_stream_after_removal(s->fd, when);
+
+	/* Existing mapping: first and last page */
+	assert_sigbus_access(s->vaddr);
+	assert_sigbus_access((uint8_t *)s->vaddr + s->size - sizeof(uint32_t));
+
+	/* New mappings are refused */
+	vaddr = mmap(NULL, s->size, PROT_READ, MAP_PRIVATE, s->fd, 0);
+	igt_assert(vaddr == MAP_FAILED);
+	igt_assert_eq(errno, ENODEV);
+}
+
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
+/*
+ * Restore a bound device and fresh device state if an unbind/rebind test bailed out
+ * half way, so the remaining subtests can run.
+ */
+static void unbind_rebind_recover(void)
+{
+	char path[PATH_MAX];
+	int i;
+
+	if (unbind_waiters_started) {
+		unbind_waiters_stop = true;
+		pthread_join(unbind_reader_waiter.thread, NULL);
+		pthread_join(unbind_poller_waiter.thread, NULL);
+		unbind_waiters_started = false;
+	}
+
+	for (i = 0; i < unbind_num_streams; i++) {
+		struct unbind_stream *s = &unbind_streams[i];
+
+		if (s->vaddr && s->vaddr != MAP_FAILED)
+			munmap(s->vaddr, s->size);
+		if (s->fd >= 0)
+			close(s->fd);
+	}
+	unbind_num_streams = 0;
+
+	if (!unbind_state_stale)
+		return;
+
+	igt_info("Recovering xe on %s after failed unbind/rebind test\n", unbind_pci_slot);
+	oa_device_fini();
+
+	snprintf(path, sizeof(path), "/sys/bus/pci/drivers/xe/%s", unbind_pci_slot);
+	if (access(path, F_OK))
+		igt_pci_driver_bind("xe", unbind_pci_slot);
+
+	oa_device_init();
+	unbind_state_stale = false;
+}
+
+/**
+ * SUBTEST: unbind-rebind-stream
+ * Description: Open OA streams with mmapped OA buffers and test the effects of unbind
+ *		and rebind: streams die, waiters are woken up, mmaps fault, no new streams
+ *		can be opened on the removed device and the device works after rebind.
+ */
+static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int flags)
+{
+	struct unbind_stream *streams = unbind_streams;
+	struct unbind_stream *primary = &streams[0];
+	const struct drm_xe_engine_class_instance *hwe = NULL;
+	bool disabled = flags & UNBIND_STREAM_DISABLED;
+	const struct drm_xe_oa_unit *oau;
+	uint32_t vm, exec_q = 0;
+	int ret, i;
+
+	igt_device_get_pci_slot_name(drm_fd, unbind_pci_slot);
+	igt_debug("Device %s\n", unbind_pci_slot);
+
+	if (flags & UNBIND_EXEC_QUEUE) {
+		hwe = oa_unit_engine(oau0);
+		vm = xe_vm_create(drm_fd, 0, 0);
+		exec_q = xe_exec_queue_create_deconst(drm_fd, vm, hwe, 0);
+	}
+
+	unbind_num_streams = 0;
+	unbind_stream_open(&streams[unbind_num_streams++], oau0, flags, exec_q, hwe);
+	if (flags & UNBIND_ALL_UNITS) {
+		for_each_oa_unit(oau) {
+			if (oau->oa_unit_id == oau0->oa_unit_id)
+				continue;
+			igt_assert_lt(unbind_num_streams, UNBIND_MAX_STREAMS);
+			unbind_stream_open(&streams[unbind_num_streams++], oau, flags, 0, NULL);
+		}
+	}
+	igt_debug("Opened %d OA stream(s)\n", unbind_num_streams);
+
+	if (disabled) {
+		/*
+		 * A disabled stream produces no OA data, so a reader and a poller stay
+		 * blocked on it until unbind kills the stream.
+		 */
+		unbind_waiters_start(primary);
+	} else {
+		struct pollfd pfd = { .fd = primary->fd, .events = POLLIN };
+		uint8_t buf[primary->report_size * 4];
+
+		/* Make sure the stream is live before pulling the device */
+		igt_assert_lt(0, poll(&pfd, 1, 2000));
+		ret = read(primary->fd, buf, sizeof(buf));
+		igt_debug("Pre-unbind read: ret=%d\n", ret);
+		igt_assert_lt(0, ret);
+	}
+
+	/* Guard against a wedged unbind/bind */
+	igt_set_timeout(60, "xe unbind timed out (wedged?)");
+	igt_debug("Unbinding xe from %s with %d stream(s) open\n", unbind_pci_slot,
+		  unbind_num_streams);
+	unbind_state_stale = true;
+	ret = igt_pci_driver_unbind("xe", unbind_pci_slot);
+	igt_reset_timeout();
+	igt_assert_f(ret == 0, "xe unbind failed: %s\n", strerror(-ret));
+
+	if (disabled)
+		unbind_waiters_join();
+
+	for (i = 0; i < unbind_num_streams; i++)
+		unbind_stream_check_dead(&streams[i], "after-unbind");
+
+	/* The drm fd of the removed device can't open new streams */
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &primary->param,
+				ENODEV);
+
+	if (flags & UNBIND_CLOSE_BEFORE_REBIND) {
+		igt_set_timeout(60, "stream close timed out (wedged?)");
+		for (i = 0; i < unbind_num_streams; i++)
+			unbind_stream_close(&streams[i]);
+		igt_reset_timeout();
+	}
+
+	/*
+	 * Drop all state of the removed device, the drm fd also refers to it. The exec
+	 * queue and vm can't be destroyed on a removed device, they go with the drm fd.
+	 */
+	oa_device_fini();
+
+	igt_set_timeout(60, "xe bind timed out (wedged?)");
+	igt_debug("Rebinding xe to %s\n", unbind_pci_slot);
+	ret = igt_pci_driver_bind("xe", unbind_pci_slot);
+	igt_reset_timeout();
+	igt_assert_f(ret == 0, "xe bind failed: %s\n", strerror(-ret));
+
+	/* Restore state for the remaining subtests/fixtures */
+	oa_device_init();
+	unbind_state_stale = false;
+
+	if (!(flags & UNBIND_CLOSE_BEFORE_REBIND)) {
+		for (i = 0; i < unbind_num_streams; i++)
+			unbind_stream_check_dead(&streams[i], "after-rebind");
+
+		igt_set_timeout(60, "stream close timed out (wedged?)");
+		for (i = 0; i < unbind_num_streams; i++)
+			unbind_stream_close(&streams[i]);
+		igt_reset_timeout();
+	}
+	unbind_num_streams = 0;
+}
+
 /**
  * SUBTEST: short-reads
  * Description: Test behavior for short reads
@@ -5262,6 +5695,28 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_subtest_with_dynamic("unbind-rebind-stream") {
+		const struct {
+			const char *name;
+			unsigned int flags;
+		} unbind_variants[] = {
+			{ "close", UNBIND_CLOSE_BEFORE_REBIND },
+			{ "open", 0 },
+			{ "disabled", UNBIND_STREAM_DISABLED },
+			{ "exec-queue", UNBIND_EXEC_QUEUE },
+			{ "all-units", UNBIND_ALL_UNITS },
+		};
+
+		for (int i = 0; i < ARRAY_SIZE(unbind_variants); i++) {
+			igt_dynamic_f("%s", unbind_variants[i].name)
+				test_unbind_rebind(oau0, unbind_variants[i].flags);
+
+			/* Device state is rebuilt on rebind, or after a failed variant */
+			unbind_rebind_recover();
+			oau0 = oa_unit_by_id(drm_fd, 0);
+		}
+	}
+
 	igt_fixture() {
 		oa_device_fini();
 		disable_trace_log();
-- 
2.55.0

