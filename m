Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00497606A31D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 23:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SSjW20SD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DE088CE4;
	Mon, 26 Oct 2026 23:31:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB7C10F1D5
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 23:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793057438; x=1824593438;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dKsygURU/Xm08FoFiIHRuCqMPHDHF7lPvjyRffCr4tI=;
 b=SSjW20SD03wO2ai7so4WVnzUhDpysB6v19ZRuLWhTR25ydrZJ0itbRiV
 jESeZWKSLrypmgW/F0khnOaZpQHbO5lwNlXAA9SLteRlPQp46yH0/yZau
 HUnZVF4KiOCQkr/hqd1QfaBA6LHARyxVZNuJMO2ji49eLcJv+6PBObQnp
 prtBfo9qfJ1hIroO/0i7aPTuJCaC+j+YKi0EvmaXS1ddyqypAjFc7Y615
 1ct4v9VbBkrKLKiezr5beySKa6d4AvuZ/55PuY5fx9YZ8u1tN2jmrrPUD
 6jSlknNvhPemNkD4EuJOaPrv7C2FuxIACp+daAP+jhzyZVQTLcxlEm8UH Q==;
X-CSE-ConnectionGUID: 8fLHRPFVSqu/Y2FedVzv5w==
X-CSE-MsgGUID: b0sqhlvZRU+It/ZdG0uNrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1621414"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1621414"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 16:30:38 -0700
X-CSE-ConnectionGUID: jm5ol8RQRi6/C2spT40beg==
X-CSE-MsgGUID: IkZJsIFOSHSxn/HCutB+Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4345059"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 16:30:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: riana.tauro@intel.com
Subject: [PATCH] tests/intel/xe_oa: Add unbind/rebind test with an open OA
 stream
Date: Mon, 26 Oct 2026 16:30:37 -0700
Message-ID: <20261026233036.1589204-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
 tests/intel/xe_oa.c | 127 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index b9f62c1154fe..8a56efa43dfd 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -22,6 +22,7 @@
 #include "drm.h"
 #include "igt.h"
 #include "igt_device.h"
+#include "igt_pci.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
 #include "intel_wa.h"
@@ -2725,6 +2726,125 @@ test_enable_disable(const struct drm_xe_oa_unit *oau)
 	__perf_close(stream_fd);
 }
 
+static void probe_stream_after_removal(const char *when)
+{
+	struct drm_xe_oa_stream_info info = {};
+	uint8_t buf[4096];
+	struct pollfd pfd = { .fd = stream_fd, .events = POLLIN };
+	int ret;
+
+	ret = poll(&pfd, 1, 1000);
+	igt_info("[%s] poll: ret=%d revents=0x%x errno=%s\n", when, ret, pfd.revents,
+		 ret < 0 ? strerror(errno) : "-");
+
+	errno = 0;
+	ret = read(stream_fd, buf, sizeof(buf));
+	igt_info("[%s] read: ret=%d errno=%s\n", when, ret, ret < 0 ? strerror(errno) : "-");
+
+	errno = 0;
+	ret = igt_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_INFO, &info);
+	igt_info("[%s] ioctl INFO: ret=%d errno=%s oa_buf_size=%" PRIu64 "\n", when, ret,
+		 ret < 0 ? strerror(errno) : "-", (uint64_t)info.oa_buf_size);
+
+	errno = 0;
+	ret = igt_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+	igt_info("[%s] ioctl DISABLE: ret=%d errno=%s\n", when, ret,
+		 ret < 0 ? strerror(errno) : "-");
+
+	errno = 0;
+	ret = igt_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
+	igt_info("[%s] ioctl ENABLE: ret=%d errno=%s\n", when, ret,
+		 ret < 0 ? strerror(errno) : "-");
+}
+
+/**
+ * SUBTEST: unbind-rebind-stream
+ * Description: Open an OA stream and test the effects of unbind and rebind
+ */
+static void
+test_unbind_rebind(const struct drm_xe_oa_unit *oau, bool close_before_rebind)
+{
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
+	uint64_t fmt = test_set->perf_oa_format;
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	size_t format_size = get_oa_format(fmt).size;
+	uint8_t buf[format_size * 4];
+	char pci_slot[NAME_MAX];
+	int ret;
+
+	igt_device_get_pci_slot_name(drm_fd, pci_slot);
+	igt_info("Device %s\n", pci_slot);
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
+
+	/* Make sure the stream is live before pulling the device */
+	{
+		struct pollfd pfd = { .fd = stream_fd, .events = POLLIN };
+
+		igt_assert_lt(0, poll(&pfd, 1, 2000));
+	}
+	ret = read(stream_fd, buf, sizeof(buf));
+	igt_info("Pre-unbind read: ret=%d\n", ret);
+	igt_assert_lt(0, ret);
+
+	/* Guard against a wedged unbind/bind */
+	igt_set_timeout(60, "xe unbind timed out (wedged?)");
+	igt_info("Unbinding xe from %s with stream open\n", pci_slot);
+	ret = igt_pci_driver_unbind("xe", pci_slot);
+	igt_reset_timeout();
+	igt_assert_f(ret == 0, "xe unbind failed: %s\n", strerror(-ret));
+	igt_info("Unbind complete\n");
+
+	probe_stream_after_removal("after-unbind");
+
+	if (close_before_rebind) {
+		igt_info("Closing stream fd while device is unbound\n");
+		igt_set_timeout(60, "stream close timed out (wedged?)");
+		__perf_close(stream_fd);
+		igt_reset_timeout();
+		igt_info("Stream close complete\n");
+	}
+
+	/* The drm fd also refers to the removed device */
+	xe_device_put(drm_fd);
+	drm_close_driver(drm_fd);
+	drm_fd = -1;
+
+	igt_set_timeout(60, "xe bind timed out (wedged?)");
+	igt_info("Rebinding xe to %s\n", pci_slot);
+	ret = igt_pci_driver_bind("xe", pci_slot);
+	igt_reset_timeout();
+	igt_assert_f(ret == 0, "xe bind failed: %s\n", strerror(-ret));
+	igt_info("Bind complete\n");
+
+	if (!close_before_rebind) {
+		probe_stream_after_removal("after-rebind");
+
+		igt_info("Closing stream fd after rebind\n");
+		igt_set_timeout(60, "stream close timed out (wedged?)");
+		__perf_close(stream_fd);
+		igt_reset_timeout();
+		igt_info("Stream close complete\n");
+	}
+
+	/* Restore state for the remaining subtests/fixtures */
+	drm_fd = drm_open_driver(DRIVER_XE);
+	xe_device_get(drm_fd);
+	igt_info("Reopened xe device after rebind\n");
+}
+
 /**
  * SUBTEST: short-reads
  * Description: Test behavior for short reads
@@ -5221,6 +5341,13 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_subtest_with_dynamic("unbind-rebind-stream") {
+		bool close_before_rebind = random() & 0x1;
+
+		igt_dynamic_f("%s", close_before_rebind ? "close" : "open")
+			test_unbind_rebind(oau0, close_before_rebind);
+	}
+
 	igt_fixture() {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
-- 
2.53.0

