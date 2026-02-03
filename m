Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEDEE6E804
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 10:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7751810E619;
	Tue,  3 Feb 2026 10:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCcMlMpD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8118810E61F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 10:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770115837; x=1801651837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z8OR9CC6dHM+v9uDb2/NE2zLyK1Tk6kgFSMwcyLnU7c=;
 b=DCcMlMpDXQl9HcKoYH3QcifnqQieE2GIFPe18kYCjBjpUN8qLdEG22vh
 p0kMK/g5AZWDmNg9xEmMSZ/JRUiC+KZNxx4AnnBqXzC4BolwE1k4Shfkq
 wSjXi2ScXbJx8ecz/zOkfVIAnKye0d1VNAlACu8xY/z9Uqc5x6mryyzcV
 8+9BOIND6T5O2FaNFPFyEYWeG2Jrkek8H0HPQqIjqhhkbTjSqs9iZtLKQ
 0PZA8wbOu2B1jbZqrAtgREfb83xyonbxrpx96aCr87RfTvQYaytP+6prn
 Rg0iFfuOvB9DaYtynsE+X8Cph4xt0POezjXioUni7ccE4EPDekN+gHaZ+ Q==;
X-CSE-ConnectionGUID: HAjT33TQQaqc1aVxmkhrkg==
X-CSE-MsgGUID: OA6GMVbETGKGvm0tPerdQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82708529"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="82708529"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 02:50:37 -0800
X-CSE-ConnectionGUID: 4G7m5kGxRPuT4u8uWe3ZWA==
X-CSE-MsgGUID: xRqi2SS/RfehO28fZYCR8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209105180"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 02:50:33 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 1/2] lib/igt_power: Ensure RAPL reads on correct CPU
Date: Tue,  3 Feb 2026 16:19:37 +0530
Message-ID: <20260203104935.3522757-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203104935.3522757-4-sk.anirban@intel.com>
References: <20260203104935.3522757-4-sk.anirban@intel.com>
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

Adapt to kernel changes that require RAPL MSR reads to occur on the
same CPU where the perf event was opened. Pin the thread to the target
CPU before reading, then restore original affinity.

This fixes compatibility with kernel changes which enforces
CPU matching for MSR-based RAPL operations.

KMD changes: https://gitlab.freedesktop.org/drm/tip/-/commit/1d6c915819f5b805c35487b6ce5923e31a28266b

v2: Cosmetic changes (Kamil)
    Add description & debug info (Kamil)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 lib/igt_perf.c  | 43 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_perf.h  |  1 +
 lib/igt_power.c | 24 ++++++++++++++++++++++--
 lib/igt_power.h |  1 +
 4 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/lib/igt_perf.c b/lib/igt_perf.c
index fe60241a4..c54ad9d17 100644
--- a/lib/igt_perf.c
+++ b/lib/igt_perf.c
@@ -2,6 +2,7 @@
 #include <fcntl.h>
 #include <inttypes.h>
 #include <limits.h>
+#include <sched.h>
 #include <stdint.h>
 #include <stdlib.h>
 #include <string.h>
@@ -238,6 +239,35 @@ _perf_open(uint64_t type, uint64_t config, int group, uint64_t format)
 	return ret;
 }
 
+static int
+_perf_open_for_cpu(uint64_t type, uint64_t config, int group, uint64_t format, int *cpu_out)
+{
+	struct perf_event_attr attr = { };
+	int nr_cpus = get_nprocs_conf();
+	int cpu = 0, ret;
+
+	attr.type = type;
+	if (attr.type == 0)
+		return -ENOENT;
+
+	if (group >= 0)
+		format &= ~PERF_FORMAT_GROUP;
+
+	attr.read_format = format;
+	attr.config = config;
+	attr.use_clockid = 1;
+	attr.clockid = CLOCK_MONOTONIC;
+
+	do {
+		ret = perf_event_open(&attr, -1, cpu++, group, 0);
+	} while ((ret < 0 && errno == EINVAL) && (cpu < nr_cpus));
+
+	if (ret >= 0 && cpu_out)
+		*cpu_out = cpu - 1;
+
+	return ret;
+}
+
 int perf_igfx_open(uint64_t config)
 {
 	return _perf_open(igt_perf_type_id("i915"), config, -1,
@@ -279,3 +309,16 @@ int igt_perf_open_group(uint64_t type, uint64_t config, int group)
 	return _perf_open(type, config, group,
 			  PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_GROUP);
 }
+
+/**
+ * igt_perf_open_for_cpu:
+ * @type: The perf event type ID
+ * @config: The perf event configuration
+ * @cpu: Pointer to store the CPU number on which the event was opened
+ * Returns: Non-negative value on success, negative value on failure
+ */
+int igt_perf_open_for_cpu(uint64_t type, uint64_t config, int *cpu)
+{
+	return _perf_open_for_cpu(type, config, -1,
+				  PERF_FORMAT_TOTAL_TIME_ENABLED, cpu);
+}
diff --git a/lib/igt_perf.h b/lib/igt_perf.h
index 58d7d47aa..6dd9170ab 100644
--- a/lib/igt_perf.h
+++ b/lib/igt_perf.h
@@ -57,6 +57,7 @@ uint64_t igt_perf_type_id(const char *device);
 int igt_perf_events_dir(int i915);
 int igt_perf_open(uint64_t type, uint64_t config);
 int igt_perf_open_group(uint64_t type, uint64_t config, int group);
+int igt_perf_open_for_cpu(uint64_t type, uint64_t config, int *cpu);
 
 const char *i915_perf_device(int i915, char *buf, int buflen);
 uint64_t i915_perf_type_id(int i915);
diff --git a/lib/igt_power.c b/lib/igt_power.c
index d3052f3cf..e76193a7b 100644
--- a/lib/igt_power.c
+++ b/lib/igt_power.c
@@ -1,10 +1,11 @@
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <inttypes.h>
 #include <locale.h>
 #include <math.h>
+#include <sched.h>
 #include <unistd.h>
-#include <inttypes.h>
 
 #include "igt.h"
 #include "igt_hwmon.h"
@@ -61,7 +62,7 @@ static int rapl_open(struct rapl *r, const char *domain)
 	if (r->fd < 0)
 		goto err;
 
-	r->fd = igt_perf_open(r->type, r->power);
+	r->fd = igt_perf_open_for_cpu(r->type, r->power, &r->cpu);
 	if (r->fd < 0) {
 		r->fd = -errno;
 		goto err;
@@ -76,6 +77,25 @@ err:
 
 static inline bool rapl_read(struct rapl *r, struct power_sample *s)
 {
+	cpu_set_t cpuset, old_cpuset;
+	bool ret;
+
+	CPU_ZERO(&cpuset);
+	CPU_SET(r->cpu, &cpuset);
+
+	if (!sched_getaffinity(0, sizeof(old_cpuset), &old_cpuset)) {
+		if (!sched_setaffinity(0, sizeof(cpuset), &cpuset)) {
+			ret = read(r->fd, s, sizeof(*s)) == sizeof(*s);
+			sched_setaffinity(0, sizeof(old_cpuset), &old_cpuset);
+			return ret;
+		} else {
+			igt_debug("Failed to set CPU affinity to CPU %d: %s\n",
+				  r->cpu, strerror(errno));
+		}
+	} else {
+		igt_debug("Failed to get current CPU affinity: %s\n", strerror(errno));
+	}
+
 	return read(r->fd, s, sizeof(*s)) == sizeof(*s);
 }
 
diff --git a/lib/igt_power.h b/lib/igt_power.h
index 853b0fae8..0430b91ae 100644
--- a/lib/igt_power.h
+++ b/lib/igt_power.h
@@ -32,6 +32,7 @@ struct rapl {
 	uint64_t power, type;
 	double scale;
 	int fd;
+	int cpu;
 };
 
 struct power_sample {
-- 
2.43.0

