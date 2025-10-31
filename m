Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA6DCCF9FE
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 12:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819DF10E2C9;
	Fri, 31 Oct 2025 12:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="es2g6Ca7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0152610E2C9
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 12:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761915474; x=1793451474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c1VgAMKrqtaud52ziYcfyzhqRE/BpRf5MuiCH6geM6Y=;
 b=es2g6Ca7/JuHwEA/kE/MKRVL1+9B2VsGGJ1gmeXzcpOGwrtaF8UzRCtq
 eRIzGFgCwJ0/mxgM6hUa/Epylar7qWQuSOkDdoOApGw+un41YpAbGh6iE
 UQPA2fyhZDVUtRv7UhhsMg32a/aflgl1L9a9ICvlSUfPM8wh9OUeVv1Tn
 mfByzw4dPESI8Y5u2ttu+ci6KuLes42ujvfa1Za6/TeYFa42b3AIHwDxq
 1c+/yEaqREO6bicZGZj8kG2yuLnpN89s2nUpxDP6Pyfb7I79zyb1jtaW9
 kQNrX414PIaiVXOp5SZy0GvcMYFhGUJDlGmMzK5n1ozk4RZ/T0ayYcMI8 A==;
X-CSE-ConnectionGUID: jRHyBzcUTw6roidbOdd9QQ==
X-CSE-MsgGUID: xe/rbRM3TpKDa5lK5fmlag==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64002582"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64002582"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:57:53 -0700
X-CSE-ConnectionGUID: u2F1Jd1WSl63Q/t/yllJng==
X-CSE-MsgGUID: fK7VDztRQSGTFajCHou4Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="217066760"
Received: from lburylo-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.246.19.11])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:57:50 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 6/6] tests/intel/xe_sriov_flr: Do not ignore failed
 prerequisites
Date: Fri, 31 Oct 2025 13:56:33 +0100
Message-ID: <20251031125633.1374273-7-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031125633.1374273-1-marcin.bernatowicz@linux.intel.com>
References: <20251031125633.1374273-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Mark failed prerequisites with an abort reason and treat them as test
failures instead of skips. This ensures that such cases are caught by CI
rather than silently ignored.

Suggested-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_flr.c | 59 ++++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index a42090744..7c496cf9a 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -53,7 +53,9 @@
 
 IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
 
-const char *SKIP_REASON = "SKIP";
+static const char STOP_REASON_ABORT[] = "ABORT";
+static const char STOP_REASON_FAIL[]  = "FAIL";
+static const char STOP_REASON_SKIP[]  = "SKIP";
 
 static struct g_mmio {
 	struct xe_mmio *mmio;
@@ -196,7 +198,7 @@ static void set_skip_reason(struct subcheck_data *data, const char *format, ...)
 	va_list args;
 
 	va_start(args, format);
-	set_stop_reason_v(data, SKIP_REASON, format, args);
+	set_stop_reason_v(data, STOP_REASON_SKIP, format, args);
 	va_end(args);
 }
 
@@ -206,7 +208,17 @@ static void set_fail_reason(struct subcheck_data *data, const char *format, ...)
 	va_list args;
 
 	va_start(args, format);
-	set_stop_reason_v(data, "FAIL", format, args);
+	set_stop_reason_v(data, STOP_REASON_FAIL, format, args);
+	va_end(args);
+}
+
+__attribute__((format(printf, 2, 3)))
+static void set_abort_reason(struct subcheck_data *data, const char *format, ...)
+{
+	va_list args;
+
+	va_start(args, format);
+	set_stop_reason_v(data, STOP_REASON_ABORT, format, args);
 	va_end(args);
 }
 
@@ -234,7 +246,7 @@ static bool no_subchecks_can_proceed(struct subcheck *checks, int num_checks)
 static bool is_subcheck_skipped(struct subcheck *subcheck)
 {
 	return subcheck->data && subcheck->data->stop_reason &&
-	       !strncmp(SKIP_REASON, subcheck->data->stop_reason, strlen(SKIP_REASON));
+	       !strncmp(STOP_REASON_SKIP, subcheck->data->stop_reason, strlen(STOP_REASON_SKIP));
 }
 
 static void subchecks_report_results(struct subcheck *checks, int num_checks)
@@ -593,8 +605,8 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, tile, mmio,
 							 &ranges, &nr_ranges);
 	if (ret) {
-		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges (%d)\n",
-				ret);
+		set_abort_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges (%d)\n",
+				 ret);
 		return -1;
 	}
 
@@ -605,15 +617,17 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 			continue;
 
 		if (vf_id < 1 || vf_id > num_vfs) {
-			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#" PRIx64 "-%#" PRIx64 "], num_vfs=%u\n",
-					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
+			set_abort_reason(&gdata->base,
+					 "Unexpected VF%u at range entry %u [%#" PRIx64
+					 "-%#" PRIx64 "], num_vfs=%u\n",
+					 vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
 			free(ranges);
 			return -1;
 		}
 
 		if (gdata->pte_offsets[vf_id].end) {
-			set_skip_reason(&gdata->base, "Duplicate GGTT PTE offset range for VF%u\n",
-					vf_id);
+			set_abort_reason(&gdata->base, "Duplicate GGTT PTE offset range for VF%u\n",
+					 vf_id);
 			free(ranges);
 			return -1;
 		}
@@ -626,9 +640,9 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 
 	for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
 		if (!gdata->pte_offsets[vf_id].end) {
-			set_skip_reason(&gdata->base,
-					"Failed to find VF%u provisioned GGTT PTE offset range\n",
-					vf_id);
+			set_abort_reason(&gdata->base,
+					 "Failed to find VF%u provisioned GGTT PTE offset range\n",
+					 vf_id);
 			return -1;
 		}
 
@@ -668,9 +682,9 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
 		if (!set_pte_gpa(&gdata->ggtt, mmio, data->tile, pte_offset,
 				 (uint8_t)vf_id, &pte)) {
-			set_skip_reason(data,
-					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x\n",
-					vf_id, pte, pte_offset);
+			set_abort_reason(data,
+					 "Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x\n",
+					 vf_id, pte, pte_offset);
 			return;
 		}
 	}
@@ -782,9 +796,9 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
 							  XE_SRIOV_SHARED_RES_LMEM,
 							  main_gt, &ranges, &nr_ranges);
 	if (ret) {
-		set_skip_reason(data, "Failed read %s on main GT (%d)\n",
-				xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
-				ret);
+		set_abort_reason(data, "Failed read %s on main GT (%d)\n",
+				 xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
+				 ret);
 		return -1;
 	}
 
@@ -800,7 +814,7 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
 
 	for (int vf_id = 1; vf_id <= data->num_vfs; ++vf_id)
 		if (!ldata->vf_lmem_size[vf_id]) {
-			set_skip_reason(data, "No LMEM provisioned for VF%u\n", vf_id);
+			set_abort_reason(data, "No LMEM provisioned for VF%u\n", vf_id);
 			return -1;
 		}
 
@@ -833,7 +847,7 @@ static void lmem_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 
 	if (!lmem_mmap_write_munmap(data->pf_fd, vf_id,
 				    ldata->vf_lmem_size[vf_id], vf_id)) {
-		set_skip_reason(data, "LMEM write failed on VF%u\n", vf_id);
+		set_abort_reason(data, "LMEM write failed on VF%u\n", vf_id);
 	}
 }
 
@@ -897,7 +911,8 @@ static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 
 		xe_mmio_tile_write32(mmio, tile, reg, vf_id);
 		if (xe_mmio_tile_read32(mmio, tile, reg) != vf_id) {
-			set_skip_reason(data, "Registers write/read check failed on VF%u\n", vf_id);
+			set_abort_reason(data, "Registers write/read check failed on VF%u\n",
+					 vf_id);
 			return;
 		}
 	}
-- 
2.43.0

