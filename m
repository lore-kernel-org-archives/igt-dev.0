Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FA3C021A9
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 13:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50DB10E324;
	Mon, 17 Feb 2025 13:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXNIMUxP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDE410E324
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739800774; x=1771336774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DU9Wg8ivqAksQboPdcbd6Hjf7AJwQfiSSqpLwAxlgNA=;
 b=RXNIMUxPqbo+P9cavxCRoNhP2SbIWqTFtQnmdsm3Mia+Ds28XcRDb2vB
 X4m53i6euZRXZyu6WHjejoxx/YxcxXAk0i45bWj2fFtnvEDrTmOHjuu9B
 H0J1L0BZItFsxVOwymoGI+QuPv9YFPfR1eAkK0i3it3KtAI7dDUnMP8im
 C530WT0q/PtuGrQHDKEAeEIE0J8eIXNtw11kHaNvT8mbveMzVVK8QE9Cm
 Cu+3VmKEleINVeh7ThsmpB9lNg20K/uxpUsJoFvBqI4ZEx3njX1QhdTON
 4tc69VitkM5tyeFrIt5czVjf8bre7epxUiJBENgPzWaQOA0ShrIJ1t13H w==;
X-CSE-ConnectionGUID: l52u8CpDQX2/kF0CepitEA==
X-CSE-MsgGUID: fY8vn5y6RpKltgFTHtjCvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="65836657"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="65836657"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 05:59:33 -0800
X-CSE-ConnectionGUID: +vicqQCfQvyj2VK89C1ufw==
X-CSE-MsgGUID: W19Beni8QfGpbODh2XxOBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="119128070"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 05:59:31 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 kamil.konieczny@linux.intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v2 1/3] lib/igt_perf: Add utils to extract PMU event info
Date: Mon, 17 Feb 2025 19:50:16 +0530
Message-ID: <20250217142021.951467-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250217142021.951467-1-riana.tauro@intel.com>
References: <20250217142021.951467-1-riana.tauro@intel.com>
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

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Functions to parse event ID and GT bit shift for PMU events.

v2: Review comments (Riana)
v3: Review comments (Lucas)
v4: fix kernel-doc (Kamil)
    remove parameter for end (Umesh)

Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 lib/igt_perf.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_perf.h |  2 ++
 2 files changed, 74 insertions(+)

diff --git a/lib/igt_perf.c b/lib/igt_perf.c
index 3866c6d77..c1b8cc629 100644
--- a/lib/igt_perf.c
+++ b/lib/igt_perf.c
@@ -92,6 +92,78 @@ const char *xe_perf_device(int xe, char *buf, int buflen)
 	return buf;
 }
 
+/**
+ * perf_event_format: Returns the shift positions of an event format param
+ * @device: PMU device
+ * @param: parameter to obtain the shiift
+ * @shift: shift bits for the parameter
+ *
+ * Returns: 0 on success or negative error code
+ */
+int perf_event_format(const char *device, const char *param, uint32_t *shift)
+{
+	char buf[NAME_MAX];
+	ssize_t bytes;
+	int ret = 0, fd;
+	uint32_t end;
+
+	snprintf(buf, sizeof(buf),
+		 "/sys/bus/event_source/devices/%s/format/%s",
+		 device, param);
+
+	fd = open(buf, O_RDONLY | O_CLOEXEC);
+	if (fd < 0)
+		return -EINVAL;
+
+	bytes = read(fd, buf, sizeof(buf) - 1);
+	close(fd);
+	if (bytes < 1)
+		return -EINVAL;
+
+	buf[bytes] = '\0';
+	ret = sscanf(buf, "config:%u-%u", shift, &end);
+	if (ret != 2)
+		return -EINVAL;
+
+	return ret;
+}
+
+/**
+ * perf_event_config:
+ * @device: Device string in driver:pci format
+ * @event: The event name
+ * @config: Pointer to the config
+ *
+ * Returns: 0 for success, negative value on error
+ */
+int perf_event_config(const char *device, const char *event, uint64_t *config)
+{
+	char buf[NAME_MAX];
+	ssize_t bytes;
+	int ret = 0, fd;
+
+	snprintf(buf, sizeof(buf),
+		 "/sys/bus/event_source/devices/%s/events/%s",
+		 device,
+		 event);
+
+	fd = open(buf, O_RDONLY);
+	if (fd < 0)
+		return -EINVAL;
+
+	bytes = read(fd, buf, sizeof(buf) - 1);
+	close(fd);
+	if (bytes < 1)
+		return ret;
+
+	buf[bytes] = '\0';
+	ret = sscanf(buf, "event=0x%lx", config);
+	if (ret != 1)
+		return -EINVAL;
+
+	return 0;
+}
+
 uint64_t xe_perf_type_id(int xe)
 {
 	char buf[80];
diff --git a/lib/igt_perf.h b/lib/igt_perf.h
index 3d9ba2917..58d7d47aa 100644
--- a/lib/igt_perf.h
+++ b/lib/igt_perf.h
@@ -71,5 +71,7 @@ int perf_i915_open(int i915, uint64_t config);
 int perf_i915_open_group(int i915, uint64_t config, int group);
 
 int perf_xe_open(int xe, uint64_t config);
+int perf_event_config(const char *device, const char *event, uint64_t *config);
+int perf_event_format(const char *device, const char *param, uint32_t *shift);
 
 #endif /* I915_PERF_H */
-- 
2.47.1

