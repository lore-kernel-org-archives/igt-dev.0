Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A85C021B3
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 11:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D54E10E4BF;
	Thu, 20 Feb 2025 11:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mgmL6zyW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817A810E93F
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740049506; x=1771585506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pKX225SCDugVMOX1QsnURi5FFKk43JGqU8Ga+jK9B7s=;
 b=mgmL6zyWSsSsCVZ7zM9FibCs8kbj4PbOsbcr23SoGkrokd5eQOzRv+bV
 9Bxmvf5CnHd245xtLl6jxT2Vv55VbqcZh4R5bIkCVtdHah/qzHuZFEYb9
 rn5WxAVQaeicC1YHaGR/EntP8ZOkwn6X1x9R0/1SHyPTBqBQkNj+Jsgjb
 XGfQyrR6a5Ac/UK4QPQw27LqKH6q2hFDrPil85aJxTScTQLVt4R02qzgC
 GiQVtjLqlJh8YYSlndb7wJgjprRw2ZpXe/tgJ+bdNs7v93ZVY9SDqCEn7
 oQw7top+RDAzCEkjvZG1lbpAgIi5Bbtw/mS3NB6h92x4bLls+7eqykWfa w==;
X-CSE-ConnectionGUID: zAxbEC7ZQqCM+kS6NkxTcg==
X-CSE-MsgGUID: 1PzWPPzbSVeolQgbTf1cfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="41079319"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="41079319"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 03:05:05 -0800
X-CSE-ConnectionGUID: PJOcL0cDQNWdmOzN0p1tpA==
X-CSE-MsgGUID: +J3kmV/sSxWrRe6LOJDQIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115904447"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 03:05:03 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 kamil.konieczny@linux.intel.com, lucas.demarchi@intel.com
Subject: [PATCH i-g-t v3 1/3] lib/igt_perf: Use shift parameter for format
Date: Thu, 20 Feb 2025 16:55:54 +0530
Message-ID: <20250220112556.1585555-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250220112556.1585555-1-riana.tauro@intel.com>
References: <20250220112556.1585555-1-riana.tauro@intel.com>
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

Replace start with shift and remove end parameter.
No functional changes

v2: fix documentation (Kamil)

Fixes: 8baa7d34b876 ("lib/igt_perf: Add utils to extract PMU event info")
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 lib/igt_perf.c       | 13 +++++++------
 lib/igt_perf.h       |  2 +-
 tests/intel/xe_pmu.c |  6 +++---
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/lib/igt_perf.c b/lib/igt_perf.c
index 2d0e699e3..d63371c92 100644
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

