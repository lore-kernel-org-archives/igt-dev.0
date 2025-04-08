Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87251C369A2
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 18:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F2310E29E;
	Tue,  8 Apr 2025 18:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UkNltwEG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7B610E2BE
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 18:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744135945; x=1775671945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ue2L0R+dY0Hhz4UA32Cam08a8a2CliFmx5SB6k6vvpk=;
 b=UkNltwEGnG24zTEmztKCAxi7pCj1CpDUtGXFSEBVEUqP/27G53UaKhQq
 eflaz92ifkViNCUK+7LVuFJJRuz7wP/V6V98HhyxP70DSY3mRY9hhAZMI
 kQyBVlUtfbbVepH43CvbMRaSKFf3Z2rH2bkb2PBjeNnHfNeBfDoj3kWza
 MTIpPHTauWl66iZRwyllGqKzyzua21p3mrJCMOLdVAfEI2XNvFn4U2MRr
 vZZOO0o2OC15KsoaZ/LxZq86PZ/zOIF2bNVs5emVoeBbshe2k3vbeiQPo
 vgIU//rPKhJxMTCH+XKd7UxJtXQERp6w38A5O18mhBusa1DeQpc22I27H w==;
X-CSE-ConnectionGUID: DJMuW0V0RcGSNQUb79/3iQ==
X-CSE-MsgGUID: L672MOgHT9GSPAkp3t1TWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45479354"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45479354"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:12:25 -0700
X-CSE-ConnectionGUID: tizS/4+iRl64VuEqLmzC0w==
X-CSE-MsgGUID: ONtpndwkRVe6RnFgWwwzrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128683602"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:12:24 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 1/6] tests/intel/xe_oa: Rename check_reports to
 mmap_check_reports
Date: Tue,  8 Apr 2025 11:12:05 -0700
Message-ID: <20250408181210.1052760-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
References: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
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
---
 tests/intel/xe_oa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 67acc74b32..a20120881a 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4246,8 +4246,8 @@ static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
 	}
 }
 
-static void check_reports(void *oa_vaddr, uint32_t oa_size,
-			  const struct drm_xe_engine_class_instance *hwe)
+static void mmap_check_reports(void *oa_vaddr, uint32_t oa_size,
+			       const struct drm_xe_engine_class_instance *hwe)
 {
 	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
 	uint64_t fmt = test_set->perf_oa_format;
@@ -4279,7 +4279,7 @@ static void check_reports_from_mapped_buffer(const struct drm_xe_engine_class_in
 	vaddr = map_oa_buffer(&size);
 
 	mmap_wait_for_periodic_reports(vaddr, 10, hwe);
-	check_reports(vaddr, size, hwe);
+	mmap_check_reports(vaddr, size, hwe);
 
 	munmap(vaddr, size);
 }
@@ -4308,7 +4308,7 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
 	vaddr = map_oa_buffer(&size);
 
 	mmap_wait_for_periodic_reports(vaddr, 10, hwe);
-	check_reports(vaddr, size, hwe);
+	mmap_check_reports(vaddr, size, hwe);
 
 	munmap(vaddr, size);
 	__perf_close(stream_fd);
-- 
2.48.1

