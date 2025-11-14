Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BDCCE8D64
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D13910EAD9;
	Fri, 14 Nov 2025 17:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmdUVX46";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D3B10EAE3
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140981; x=1794676981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ocJxFIBA1k2mORdgon4PeLy0ct47hovgshglprRdavM=;
 b=dmdUVX46VuAazRk8t10LsJdAHwcq7yfXpUAnFP+FDj0LepTd9g+s+8ua
 UFHXVOcQjEENBuuBNDFG7cQJzo09k2PlBy31oF8fjfeovYTBNH1vr0gR3
 uoXKdzV6ja0gLDw96DpdUgUCQxfB5NE3Y8KIzq3ZiY4C1aTYA22jEEIPZ
 2R+lGOD/6WQAgcKWX5ysGH3TMe4po7iRM8kYPKrxBt+JQhY0ZRWWPX/hz
 Cq/nXyBFSVn0kThrZAo+H3G+Cbvt8OOccGEYKBbKNPD2kdc1JAbS8ba63
 s34zCOnIkF5tlKYhwgb5eNwv0+zNVDj6Xu1vZWz1zFJ1gkt9DXVT0kwbe A==;
X-CSE-ConnectionGUID: +3XwqwLYReOnZPEw/AYyBg==
X-CSE-MsgGUID: i/ZRw18lSfCY+ZXPudhF8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871462"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871462"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:23:01 -0800
X-CSE-ConnectionGUID: 20ZNzx/7SFGp5vpI2iC8NQ==
X-CSE-MsgGUID: cqB4LdfsSVWz3fRqxsKgmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981645"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:59 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 20/23] tests/kms_color_helper: Add LUT segment data utilities for
 multiseg tests
Date: Fri, 14 Nov 2025 22:59:05 +0530
Message-Id: <20251114172908.1027816-21-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114172908.1027816-1-swati2.sharma@intel.com>
References: <20251114172908.1027816-1-swati2.sharma@intel.com>
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

Introduce helper functions to manage LUT segment data, including
creation of zero, unity, and max LUTs for testing multisegment 1D LUTs.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_helper.c | 80 ++++++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.h | 12 ++++++
 2 files changed, 92 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 66193f050..7d7392f96 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -24,6 +24,8 @@
 
 #include "kms_color_helper.h"
 
+#define MIN(a, b)	((a) < (b) ? (a) : (b))
+
 bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
 {
 	bool ret = true;
@@ -676,3 +678,81 @@ void clear_color_pipeline(igt_display_t *display,
 	for(i = 0; colorops[i]; i++)
 		clear_colorop(display, colorops[i]);
 }
+
+void create_zero_lut(segment_data_t *info, struct drm_color_lut32 *lut)
+{
+	int i;
+
+	for (i = 0; i < info->entries_count; i++)
+		lut[i].red = lut[i].green = lut[i].blue = 0;
+}
+
+void create_unity_lut(segment_data_t *info, struct drm_color_lut32 *lut)
+{
+	uint32_t val, segment, entry, index = 0;
+	uint32_t max_val = 0xffffffff;
+
+	for (segment = 0; segment < info->segment_count; segment++) {
+		uint32_t entry_count = info->segment_data[segment].count;
+		uint32_t start = info->segment_data[segment].start;
+		uint32_t end = info->segment_data[segment].end;
+
+		for (entry = 1; entry <= entry_count; entry++) {
+			val = start + entry * ((end - start) * 1.0 / entry_count);
+			lut[index].red = lut[index].green = lut[index].blue =
+				(index == 0) ? 0 : MIN(val, max_val);
+
+			index++;
+		}
+	}
+}
+
+void create_max_lut(segment_data_t *info, struct drm_color_lut32 *lut)
+{
+	int i;
+	uint32_t max_val = 0xffffffff;
+
+	for (i = 0; i < info->entries_count; i++)
+		lut[i].red = lut[i].green = lut[i].blue = (i == 0) ? 0 : max_val;
+}
+
+void clear_segment_data(segment_data_t *info)
+{
+	if (!info)
+		return;
+
+	free(info->segment_data);
+	free(info);
+}
+
+segment_data_t *get_segment_data(int drm_fd, uint64_t blob_id)
+{
+	drmModePropertyBlobPtr blob;
+	struct drm_color_lut_range *lut_range = NULL;
+	segment_data_t *info = NULL;
+	uint32_t i;
+
+	blob = drmModeGetPropertyBlob(drm_fd, blob_id);
+	igt_assert(blob);
+	igt_assert(blob->length);
+
+	info = malloc(sizeof(segment_data_t));
+	igt_assert(info);
+
+	lut_range = (struct drm_color_lut_range *) blob->data;
+	info->segment_count = blob->length / sizeof(lut_range[0]);
+	igt_assert(info->segment_count);
+
+	info->segment_data = malloc(sizeof(struct drm_color_lut_range) * info->segment_count);
+	igt_assert(info->segment_data);
+
+	info->entries_count = 0;
+	for (i = 0; i < info->segment_count; i++) {
+		info->entries_count += lut_range[i].count;
+		info->segment_data[i] = lut_range[i];
+	}
+
+	drmModeFreePropertyBlob(blob);
+
+	return info;
+}
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 54d19513a..33a85fbcc 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -125,6 +125,18 @@ void invalid_gamma_lut_sizes(data_t *data, enum pipe p);
 void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
 void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
 
+typedef struct {
+	uint32_t segment_count;
+	struct drm_color_lut_range *segment_data;
+	uint32_t entries_count;
+} segment_data_t;
+
+void create_zero_lut(segment_data_t *info, struct drm_color_lut32 *lut);
+void create_unity_lut(segment_data_t *info, struct drm_color_lut32 *lut);
+void create_max_lut(segment_data_t *info, struct drm_color_lut32 *lut);
+void clear_segment_data(segment_data_t *info);
+segment_data_t *get_segment_data(int drm_fd, uint64_t blob_id);
+
 /* Test version definitions */
 typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
-- 
2.25.1

