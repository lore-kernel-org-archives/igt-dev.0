Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD0CC3ABA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 19:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D026910E1A6;
	Tue, 29 Apr 2025 19:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eU1BEFhO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3A510E463
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 19:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745955005; x=1777491005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eIspVdBOKBooq7gMXS65iBCtPYCKiIf0XCLS15Nfkrs=;
 b=eU1BEFhOmy6/sTm1KUBmKLXcPvtC4LbYGAovaziEe/w/xiid/PIEFxSQ
 qSj+xyOPPVgm9+fQIfZQouMdZXz2mgwSyrZc1/cSK9jYiiVM7/E4+EUbT
 4crD38XCzgzqrIB7mN3SQ0EHstIzvXLSUtKX7jYPmmV2zo8rhiS6AnUHS
 oPMKhVg63J5GFOxgfZoRN7GY+wy79sPYSoE8U9oaippfAeuASNNSn1oQM
 8t5dBKvb0hhanvOWBb63GUiEeUNsK+AvDk6lcIwFdsBkzE/FuOd/mRgR4
 5sbVDonG7rujun23DJ2X8k96C16FQ//cXSOY2lzhg4r5KPX3TuSCEwt7h g==;
X-CSE-ConnectionGUID: ai/UmQLzSsqUu3koF6sBuA==
X-CSE-MsgGUID: mVqMqOEBTsGk/XWxbajY5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="72978027"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="72978027"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 12:29:58 -0700
X-CSE-ConnectionGUID: WIUwDTOpR9uVDpnaQwp5KA==
X-CSE-MsgGUID: ANQD1lEsTpmAqX4a0/HDcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="134413051"
Received: from dut4036ptlh.fm.intel.com ([10.105.10.116])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 12:29:57 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com
Subject: [PATCH 2/2] xe_exec_system_allocator: Require huge pages reserved for
 huge page tests
Date: Tue, 29 Apr 2025 19:29:56 +0000
Message-ID: <20250429192956.275280-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429192956.275280-1-jonathan.cavitt@intel.com>
References: <20250429192956.275280-1-jonathan.cavitt@intel.com>
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

Various subtests in xe_exec_system_allocator attempt to use the
MAP_HUGETLB flag for mmap.  Doing so will result in an ENOMEM error if
there are no available huge pages, which can occur if none are reserved
before boot time.  So, skip the tests if no huge pages have been
reserved by the kernel.

Fixes: 41ee4d698fd8 ("tests/xe: Add system_allocator test")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index e1121a8627..8a55e0ff64 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -964,6 +964,12 @@ struct test_exec_data {
 	uint32_t expected_data;
 };
 
+static void igt_require_hugepages(void)
+{
+	igt_skip_on_f(!igt_get_meminfo("HugePages_Total"),
+		      "Huge pages not reserved by the kernel!\n");
+}
+
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, size_t bo_size,
@@ -1005,6 +1011,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & EVERY_OTHER_CHECK && odd(n_execs))
 		return;
 
+	if (flags & HUGE_PAGE)
+		igt_require_hugepages();
+
 	if (flags & EVERY_OTHER_CHECK)
 		igt_assert(flags & MREMAP);
 
@@ -1439,6 +1448,9 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 	if ((FILE_BACKED | FORK_READ) & flags)
 		return;
 
+	if (flags & HUGE_PAGE)
+		igt_require_hugepages();
+
 	xe_for_each_engine(fd, hwe)
 		++n_engines;
 
@@ -1550,6 +1562,9 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 	if (flags & FORK_READ)
 		return;
 
+	if (flags & HUGE_PAGE)
+		igt_require_hugepages();
+
 	map_fd = open(sync_file, O_RDWR | O_CREAT, 0x666);
 	posix_fallocate(map_fd, 0, sizeof(*pdata));
 	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
-- 
2.43.0

