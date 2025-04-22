Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA03C369D7
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 19:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F1A10E60A;
	Tue, 22 Apr 2025 19:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmfSZOVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A0710E5FC
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745350512; x=1776886512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mc09WJpeTI8bgpZUEwedYjpedjJjqxw4ut2EZq7OR6M=;
 b=VmfSZOVzKwE8vDDL9GCaYYoMzxnpzQO77W+VILI6nGbQDtyUPCLd+LMd
 weQu/352P4cHB8k9DPATh6l3B2ZCOt9WwVJSmPJgANvkhmp3JMI7TMhDj
 ps0GaN+xoyoZ4e+Pm1QOl+wHIDyWD3ld9mPzLgH6F+UMeP1xiumi5Obl0
 aJ/3rzGPm0hR9BrGYWX0qNPaw2qoIq2rObt0nKhrfpJQ5UDL8VNZDfLN+
 CudXt+LyP5Pa9DK4/hKKtCIBTWMEOhsDnIXOuuSDEP575ca4yK7svjg0V
 bikvcnJO2QBpxs0xccSXHl2qJ3TqYKdhwkmt4sVoGBpzwDJGPN/3EENOc g==;
X-CSE-ConnectionGUID: Rk9bIea/Txa29TCSOLWJ1g==
X-CSE-MsgGUID: PgsYBJMNR/SBCBqtnasSaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57584546"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="57584546"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:12 -0700
X-CSE-ConnectionGUID: CKrCSOSERtybXFekopyh3A==
X-CSE-MsgGUID: zYdV/54CSva134qk5srV/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136892146"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:12 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 1/6] tests/intel/xe_oa: Rename check_reports to
 mmap_check_reports
Date: Tue, 22 Apr 2025 12:34:53 -0700
Message-ID: <20250422193458.1467567-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250422193458.1467567-1-ashutosh.dixit@intel.com>
References: <20250422193458.1467567-1-ashutosh.dixit@intel.com>
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

check_reports() is only used for checking reports for mmap OA buffer use
case. Rename the function to the more specific name mmap_check_reports() to
make the purpose of the function clearer and the function easier to find.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 766f81a5e8..405549178a 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4255,8 +4255,8 @@ static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
 	}
 }
 
-static void check_reports(void *oa_vaddr, uint32_t oa_size,
-			  const struct drm_xe_engine_class_instance *hwe)
+static void mmap_check_reports(void *oa_vaddr, uint32_t oa_size,
+			       const struct drm_xe_engine_class_instance *hwe)
 {
 	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
 	uint64_t fmt = test_set->perf_oa_format;
@@ -4288,7 +4288,7 @@ static void check_reports_from_mapped_buffer(const struct drm_xe_engine_class_in
 	vaddr = map_oa_buffer(&size);
 
 	mmap_wait_for_periodic_reports(vaddr, 10, hwe);
-	check_reports(vaddr, size, hwe);
+	mmap_check_reports(vaddr, size, hwe);
 
 	munmap(vaddr, size);
 }
@@ -4317,7 +4317,7 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
 	vaddr = map_oa_buffer(&size);
 
 	mmap_wait_for_periodic_reports(vaddr, 10, hwe);
-	check_reports(vaddr, size, hwe);
+	mmap_check_reports(vaddr, size, hwe);
 
 	munmap(vaddr, size);
 	__perf_close(stream_fd);
-- 
2.48.1

