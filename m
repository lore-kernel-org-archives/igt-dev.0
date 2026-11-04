Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4025E606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 00:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tlv+2STV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD3910E335;
	Wed,  4 Nov 2026 00:57:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4058E10E335
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 00:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793753714; x=1825289714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xVkq1xo3QluWOYdEjLt9M0+q2NP/CVlDss3qY/23Q2A=;
 b=Tlv+2STVQsmv3q0H8sYLnDweG4LhNT/pc1mhEZSHTOFwNT0fwHgB47n4
 pPwLQW7ugvDEyWpAMBSv7erc1W2+otZsg31K81hqUGUgrlN92YZiO2wVP
 ZuowK0kMZflFGuHiqiTGQYmEOW4OfLxJmiOgVAyKK13UOgnhw4W0gt6hJ
 0Qizxuwi038FAwz1T66sN32Kv6jcJWxl+6UELtCr+XVhM1JSeOdaJmIKt
 G9n7X7CMPeNrPAMxPf71W7hFpACyXsN+30IIpns7MTXZ4dWKXjBzq2Byp
 lF8/NZ2MYU/pJJ+1cTBuUH1VudHHF1axBOOODj53yG3fthOVnRVM8MW+o g==;
X-CSE-ConnectionGUID: a37aLPvaTrCcF1MarpN5Qw==
X-CSE-MsgGUID: Qna9Ep8oSMCl7isQDflQ8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2506016"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2506016"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:09 -0800
X-CSE-ConnectionGUID: 668WmG9NRyuH/s6bN4KRNQ==
X-CSE-MsgGUID: QLRUiKvHTWiXkMY9MSNKiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6421540"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com
Subject: [PATCH v2 2/8] tests/intel/xe_oa: Add unbind/rebind test with an open
 OA stream
Date: Tue,  3 Nov 2026 16:55:08 -0800
Message-ID: <20261104005505.3232485-12-umesh.nerlige.ramappa@intel.com>
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

Open an OA stream, unbind and rebind the xe device, and check the
stream fd after removal and after the rebind: poll reports
POLLERR | POLLHUP, and read and the stream ioctls fail with ENODEV.

Run variants that close the stream before or after the rebind. Rebuild
the device state after the rebind, or after a failed variant, so that
the remaining subtests run.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 239 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 239 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 8758ab15bf46..046d57c3f4e8 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -22,6 +22,7 @@
 #include "drm.h"
 #include "igt.h"
 #include "igt_device.h"
+#include "igt_pci.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
 #include "xe/xe_ioctl.h"
@@ -2778,6 +2779,225 @@ test_enable_disable(const struct drm_xe_oa_unit *oau)
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
+#define UNBIND_CLOSE_BEFORE_REBIND	(1 << 0)
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
+};
+
+static char unbind_pci_slot[NAME_MAX];
+static bool unbind_state_stale;
+static struct unbind_stream unbind_streams[UNBIND_MAX_STREAMS];
+static int unbind_num_streams;
+
+static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_unit *oau)
+{
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
+	uint64_t fmt = test_set->perf_oa_format;
+	int n = 0;
+
+	s->oa_unit_id = oau->oa_unit_id;
+	s->fd = -1;
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
+	igt_assert_lte(n, ARRAY_SIZE(s->properties));
+
+	s->param.num_properties = n / 2;
+	s->param.properties_ptr = to_user_pointer(s->properties);
+	s->report_size = get_oa_format(fmt).size;
+
+	s->fd = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &s->param);
+	igt_assert_lte(0, s->fd);
+}
+
+static void unbind_stream_close(struct unbind_stream *s)
+{
+	close(s->fd);
+	s->fd = -1;
+}
+
+/* Make sure the stream is live before pulling the device */
+static void unbind_stream_check_live(struct unbind_stream *s)
+{
+	struct pollfd pfd = { .fd = s->fd, .events = POLLIN };
+	uint8_t buf[s->report_size * 4];
+	int ret;
+
+	igt_assert_lt(0, poll(&pfd, 1, 2000));
+	ret = read(s->fd, buf, sizeof(buf));
+	igt_debug("Pre-unbind read: ret=%d\n", ret);
+	igt_assert_lt(0, ret);
+}
+
+static void unbind_stream_check_dead(struct unbind_stream *s, const char *when)
+{
+	igt_debug("[%s] checking stream on oa unit %d\n", when, s->oa_unit_id);
+
+	probe_stream_after_removal(s->fd, when);
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
+	for (i = 0; i < unbind_num_streams; i++) {
+		struct unbind_stream *s = &unbind_streams[i];
+
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
+ * Description: Open an OA stream and test the effects of unbind and rebind: the stream
+ *		dies and the device works after rebind.
+ */
+static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int flags)
+{
+	struct unbind_stream *streams = unbind_streams;
+	struct unbind_stream *primary = &streams[0];
+	int ret, i;
+
+	igt_device_get_pci_slot_name(drm_fd, unbind_pci_slot);
+	igt_debug("Device %s\n", unbind_pci_slot);
+
+	unbind_num_streams = 0;
+	unbind_stream_open(&streams[unbind_num_streams++], oau0);
+	igt_debug("Opened %d OA stream(s)\n", unbind_num_streams);
+
+	unbind_stream_check_live(primary);
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
+	for (i = 0; i < unbind_num_streams; i++)
+		unbind_stream_check_dead(&streams[i], "after-unbind");
+
+	if (flags & UNBIND_CLOSE_BEFORE_REBIND) {
+		igt_set_timeout(60, "stream close timed out (wedged?)");
+		for (i = 0; i < unbind_num_streams; i++)
+			unbind_stream_close(&streams[i]);
+		igt_reset_timeout();
+	}
+
+	/* Drop all state of the removed device, the drm fd also refers to it */
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
@@ -5251,6 +5471,25 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_subtest_with_dynamic("unbind-rebind-stream") {
+		const struct {
+			const char *name;
+			unsigned int flags;
+		} unbind_variants[] = {
+			{ "close", UNBIND_CLOSE_BEFORE_REBIND },
+			{ "open", 0 },
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

