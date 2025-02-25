Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA54DC021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 06:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F7510E590;
	Tue, 25 Feb 2025 06:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJwjvFb3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2F910E583
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 06:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740466331; x=1772002331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eAlDsDDs4PXBrSvnp2SSUp45a2tfmqF8OulLdBmqLYM=;
 b=gJwjvFb3fGyyGptn7c5qd63bvvJmRwJmOPs6Zu/QFohQlqV1oqy5KvH6
 rUWl6XFF4znj2YtdQRbKFxNHED8PKR8sIpcB34AcrfTfgEViU1U8RzUXU
 nuZdNOonZzhMeWVxpjKfrx9pbvfmpBUGQOxpolZ4/cawnW2Ra4umBCtCn
 Htzfo6yTd4fyAUThyRWTLpAk7qhNES0X5VDsuWg3JyhTmhTihWd8Isixi
 HTm1LyuF7RG+kwgoHRRedN+h9a8VBI5jbBmvSR85EMxbuhOgbK9yn5aBa
 VVW2j6LFjMtUzAg4v4Ho/HEDcsUow6LhBGVJE1phfjE8RjZWx0d4C11a1 A==;
X-CSE-ConnectionGUID: xLfZBICLSF6AdfA/3Gmmrg==
X-CSE-MsgGUID: b4LaEmb9RgipfA1IZMr8pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40442893"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="40442893"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 22:52:11 -0800
X-CSE-ConnectionGUID: 57dcZCWSRBKfSd719YVnVw==
X-CSE-MsgGUID: 1B7bHclPReO9Mm/LStNelw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120399750"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 22:52:10 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com
Subject: [PATCH i-g-t v4 1/3] lib/igt_perf: Use shift parameter for format
Date: Tue, 25 Feb 2025 12:43:09 +0530
Message-ID: <20250225071311.2333393-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250225071311.2333393-1-riana.tauro@intel.com>
References: <20250225071311.2333393-1-riana.tauro@intel.com>
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

Rename start with shift and remove end parameter
and fix documentation.

v2: fix documentation (Kamil)
v3: fix return values (Kamil)

Fixes: 8baa7d34b876 ("lib/igt_perf: Add utils to extract PMU event info")
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_perf.c       | 17 +++++++++--------
 lib/igt_perf.h       |  2 +-
 tests/intel/xe_pmu.c |  6 +++---
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/lib/igt_perf.c b/lib/igt_perf.c
index 2d0e699e3..fb2b73915 100644
--- a/lib/igt_perf.c
+++ b/lib/igt_perf.c
@@ -93,18 +93,19 @@ const char *xe_perf_device(int xe, char *buf, int buflen)
 }
 
 /**
- * perf_event_format: Returns the start/end positions of an event format param
+ * perf_event_format: Returns the shift for format param
  * @device: PMU device
- * @param: Parameter for which you need the format start/end bits
+ * @param: Parameter for which you need the format
+ * @shift: bit shift
  *
  * Returns: 0 on success or negative error code
  */
-int perf_event_format(const char *device, const char *param, uint32_t *start, uint32_t *end)
+int perf_event_format(const char *device, const char *param, uint32_t *shift)
 {
 	char buf[NAME_MAX];
 	ssize_t bytes;
-	int ret;
-	int fd;
+	uint32_t end;
+	int ret, fd;
 
 	snprintf(buf, sizeof(buf),
 		 "/sys/bus/event_source/devices/%s/format/%s",
@@ -120,7 +121,7 @@ int perf_event_format(const char *device, const char *param, uint32_t *start, ui
 		return -EINVAL;
 
 	buf[bytes] = '\0';
-	ret = sscanf(buf, "config:%u-%u", start, end);
+	ret = sscanf(buf, "config:%u-%u", shift, &end);
 	if (ret != 2)
 		return -EINVAL;
 
@@ -148,12 +149,12 @@ int perf_event_config(const char *device, const char *event, uint64_t *config)
 
 	fd = open(buf, O_RDONLY);
 	if (fd < 0)
-		return -EINVAL;
+		return -errno;
 
 	bytes = read(fd, buf, sizeof(buf) - 1);
 	close(fd);
 	if (bytes < 1)
-		return ret;
+		return -EINVAL;
 
 	buf[bytes] = '\0';
 	ret = sscanf(buf, "event=0x%lx", config);
diff --git a/lib/igt_perf.h b/lib/igt_perf.h
index 69f7a3d74..58d7d47aa 100644
--- a/lib/igt_perf.h
+++ b/lib/igt_perf.h
@@ -72,6 +72,6 @@ int perf_i915_open_group(int i915, uint64_t config, int group);
 
 int perf_xe_open(int xe, uint64_t config);
 int perf_event_config(const char *device, const char *event, uint64_t *config);
-int perf_event_format(const char *device, const char *param, uint32_t *start, uint32_t *end);
+int perf_event_format(const char *device, const char *param, uint32_t *shift);
 
 #endif /* I915_PERF_H */
diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 62ed3a977..d408d0f99 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -70,14 +70,14 @@ static uint64_t get_event_config(int xe, unsigned int gt, char *event)
 	int ret;
 	char xe_device[100];
 	uint64_t pmu_config;
-	u32 start, end;
+	uint32_t shift;
 
 	xe_perf_device(xe, xe_device, sizeof(xe_device));
 	ret = perf_event_config(xe_device, event, &pmu_config);
 	igt_assert(ret >= 0);
-	ret = perf_event_format(xe_device, "gt", &start, &end);
+	ret = perf_event_format(xe_device, "gt", &shift);
 	igt_assert(ret >= 0);
-	pmu_config |= (uint64_t) gt << start;
+	pmu_config |= (uint64_t)gt << shift;
 
 	return pmu_config;
 }
-- 
2.47.1

