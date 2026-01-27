Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE01D2D8DF
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623F910E4F7;
	Tue, 27 Jan 2026 09:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKnutQW2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFDF10E4F7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507703; x=1801043703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MHYoxvL2oILZLESptJWA7e9OUBodXMhVtoX2q0uOimw=;
 b=NKnutQW2+o8n2gU2PQv05zJZn0I3O1y7YqBxuO0QYG57axlxstSAduR2
 EHH5n4j/J+TPhUExFFZdEfTCYw5n4FgtWal9JumzbaqN6svNqCDwUCNtN
 87VuqPnyv9tSTl0vZzKTiapwgUtuVYwiJK5xihSZyLxschEsTGSWatOCm
 Kmr4fy2YnVBjlBDYyGcaxUJF1O5M2vUGaRVjOslBA7inYABbOvWHh8LF3
 sE/I2Lp7HGVsNUJinKyz9B/Fj2Z8Oho1aKM8yHiGS7I1GBoUAqc493qGM
 SmnuTznbDkVtC/JKDLVUaL4+l9oMVM6mmf867skf1xUGXsPLDum2UiyX+ A==;
X-CSE-ConnectionGUID: X9G05hsGT6yAeuXjibQ/Og==
X-CSE-MsgGUID: 1xUrBViiR+eg+1ttR6fzWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88276835"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="88276835"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:55:03 -0800
X-CSE-ConnectionGUID: VGIdz+QxRpygYR68n4gTjg==
X-CSE-MsgGUID: mTB2RnPSQ2OhWDaWdbd0oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="239202183"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:55:00 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 ville.syrjala@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 1/2] lib/igt_power: Ensure RAPL reads on correct CPU
Date: Tue, 27 Jan 2026 15:24:32 +0530
Message-ID: <20260127095430.536088-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127095430.536088-4-sk.anirban@intel.com>
References: <20260127095430.536088-4-sk.anirban@intel.com>
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

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 lib/igt_perf.c  | 36 ++++++++++++++++++++++++++++++++++++
 lib/igt_perf.h  |  1 +
 lib/igt_power.c | 17 ++++++++++++++++-
 lib/igt_power.h |  1 +
 4 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/lib/igt_perf.c b/lib/igt_perf.c
index fe60241a4..adf4f3844 100644
--- a/lib/igt_perf.c
+++ b/lib/igt_perf.c
@@ -12,6 +12,7 @@
 #endif
 #include <time.h>
 #include <unistd.h>
+#include <sched.h>
 
 #include "igt_perf.h"
 
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
@@ -279,3 +309,9 @@ int igt_perf_open_group(uint64_t type, uint64_t config, int group)
 	return _perf_open(type, config, group,
 			  PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_GROUP);
 }
+
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
index d3052f3cf..c705e3393 100644
--- a/lib/igt_power.c
+++ b/lib/igt_power.c
@@ -5,6 +5,7 @@
 #include <math.h>
 #include <unistd.h>
 #include <inttypes.h>
+#include <sched.h>
 
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
@@ -76,6 +77,20 @@ err:
 
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
+		}
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

