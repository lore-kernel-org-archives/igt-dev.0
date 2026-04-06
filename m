Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5956EF46C69
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 18:42:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D407310E29C;
	Mon,  6 Apr 2026 18:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UX4A443b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A5810E29C
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 18:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775500949; x=1807036949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VEZmZa4Ach6ak0QZitFV6Gkwle2ByYdzeSCK4k8ctr8=;
 b=UX4A443b4gLV663P7b/RC20hG77qJWM4TaKhBG3IAhtiHPfCZqf0SUKV
 XQgBmyzkgnqZeDcuRGiX4ks+Gyi6jC/JiBZp+KHI88mnOWkqCYHqRU6ij
 aeU9+5eW7OTz21inbOOz7Xtwv0sM41UwvKb8v4EGH6HF4d8JX54i1r60T
 wtwPYSi3IFs6fZgemsXO47w984pvNaYcPXCY9AaJwe1ZrHrUU23x+rFSu
 Q14IOIkLVB5R83gdSRFA4RlVVrfyKCnI5sMlai1cjK1kfgp/rOkJOCsE5
 oUK516mPDt1bgzkAHxVr7jLDiROtJdcx5SUfL1oMxz+/C4cEapEb1NKLc A==;
X-CSE-ConnectionGUID: 72qE/oB8RiukTOUbm8HqBw==
X-CSE-MsgGUID: FCKhvJeSQSaqVxVKtalqmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80342965"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="80342965"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 11:42:27 -0700
X-CSE-ConnectionGUID: z8s9ivc5QdGraMbWy50ECA==
X-CSE-MsgGUID: GO540NXWSWOOpnIZCW3fAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="225193405"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.192])
 by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 11:42:27 -0700
From: Brian Nguyen <brian3.nguyen@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: x.wang@intel.com,
	Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 2/4] tests/xe: Add random page reclaim subtest
Date: Mon,  6 Apr 2026 18:42:29 +0000
Message-ID: <20260406184226.1294486-8-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406184226.1294486-6-brian3.nguyen@intel.com>
References: <20260406184226.1294486-6-brian3.nguyen@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add a subtest case providing a random distribution in both page sizes
and page ordering to increase coverage of random pages. To ensure the
page size chosen are properly used in PRL, filler pages are added in
between the random chosen to provide proper alignment.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Suggested-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_page_reclaim.c | 151 ++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/tests/intel/xe_page_reclaim.c b/tests/intel/xe_page_reclaim.c
index acc237d43..7741063d2 100644
--- a/tests/intel/xe_page_reclaim.c
+++ b/tests/intel/xe_page_reclaim.c
@@ -164,6 +164,153 @@ static void test_vma_ranges_basic_mixed(int fd)
 	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
 }
 
+/* Helper to calculate alignment filler pages needed */
+struct alignment_fillers {
+	uint64_t gap_to_64k;
+	uint64_t remaining_gap;
+};
+
+static struct alignment_fillers calculate_alignment_fillers(uint64_t start_addr,
+							    uint64_t current_offset,
+							    uint64_t page_size)
+{
+	struct alignment_fillers fillers = {0};
+	uint64_t current_addr = start_addr + current_offset;
+	uint64_t misalignment = current_addr % page_size;
+	uint64_t gap, misalignment_64k;
+
+	if (!misalignment)
+		return fillers;
+
+	gap = page_size - misalignment;
+
+	/*
+	 * Fill the alignment gap using a two-level strategy to match the
+	 * GPU page table hierarchy (4K → 64K → page_size):
+	 * 1. Use 4K pages to reach the next 64K boundary (if the current
+	 *    address is not already 64K-aligned).
+	 * 2. Use 64K pages for the remaining gap up to page_size alignment
+	 *    (this remainder is always a multiple of 64K).
+	 */
+	misalignment_64k = current_addr % SZ_64K;
+	if (misalignment_64k) {
+		/* Not 64K aligned, fill with 4K pages up to next 64K boundary */
+		fillers.gap_to_64k = SZ_64K - misalignment_64k;
+		if (fillers.gap_to_64k > gap)
+			fillers.gap_to_64k = gap;
+	}
+
+	fillers.remaining_gap = gap - fillers.gap_to_64k;
+	return fillers;
+}
+
+/**
+ * SUBTEST: random
+ * Description: Create a random mix of page sizes (4K, 64K, 2M) with
+ *      proper alignment handling. Larger pages are aligned by inserting
+ *      filler pages (64K and 4K) as needed to test random page size
+ *      combinations in page reclamation.
+ */
+static void test_vma_range_random(int fd)
+{
+	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
+	const int num_random_pages = 10; /* Total number of random pages to generate */
+	struct alignment_fillers fillers;
+	uint64_t *sizes;
+	uint64_t *random_pages;
+	uint64_t start_addr = 1ull << 30; /* Start at 1GB aligned */
+	int count_4k = 0, count_64k = 0, count_2m = 0;
+	uint64_t current_offset = 0;
+	uint64_t remainder, j;
+	int idx = 0;
+	int i, rand_val;
+
+	/* Generate random page sizes */
+	random_pages = calloc(num_random_pages, sizeof(uint64_t));
+	igt_assert(random_pages);
+
+	for (i = 0; i < num_random_pages; i++) {
+		rand_val = random() % 100;
+
+		/* Weight the distribution: 50% 4K, 30% 64K, 20% 2M */
+		if (rand_val < 50)
+			random_pages[i] = SZ_4K;
+		else if (rand_val < 80)
+			random_pages[i] = SZ_64K;
+		else
+			random_pages[i] = SZ_2M;
+	}
+
+	/* Over-allocate: worst case is 47 pages per random page (15×4K + 31×64K + 1×2M) */
+	sizes = calloc(num_random_pages * 47, sizeof(uint64_t));
+	igt_assert(sizes);
+
+	/* Populate sizes array in a single pass while tracking counts */
+	for (i = 0; i < num_random_pages; i++) {
+		fillers = calculate_alignment_fillers(start_addr,
+						      current_offset,
+						      random_pages[i]);
+
+		if (fillers.gap_to_64k || fillers.remaining_gap) {
+			/* Fill gap to 64K boundary with 4K pages */
+			for (j = 0; j < fillers.gap_to_64k; j += SZ_4K) {
+				sizes[idx++] = SZ_4K;
+				current_offset += SZ_4K;
+				count_4k++;
+			}
+
+			/* Fill remainder with 64K pages */
+			remainder = fillers.remaining_gap;
+			while (remainder >= SZ_64K) {
+				sizes[idx++] = SZ_64K;
+				current_offset += SZ_64K;
+				remainder -= SZ_64K;
+				count_64k++;
+			}
+
+			/* After 64K alignment, remainder should always be 0 */
+			igt_assert_eq(remainder, 0);
+		}
+
+		sizes[idx++] = random_pages[i];
+		current_offset += random_pages[i];
+
+		switch (random_pages[i]) {
+		case SZ_4K:
+			count_4k++;
+			break;
+		case SZ_64K:
+			count_64k++;
+			break;
+		case SZ_2M:
+			count_2m++;
+			break;
+		}
+	}
+
+	igt_assert_f(idx < OVERFLOW_PRL_SIZE,
+		     "Random test generated %d entries, exceeds PRL limit %d\n",
+		     idx, OVERFLOW_PRL_SIZE);
+
+	/* Set expected stats based on tracked counts */
+	expected_stats.prl_4k_entry_count = count_4k;
+	expected_stats.prl_64k_entry_count = count_64k;
+	expected_stats.prl_2m_entry_count = count_2m;
+	expected_stats.prl_issued_count = 1;
+	expected_stats.prl_aborted_count = 0;
+
+	igt_debug("Random test generated: %d total pages (%d 4K, %d 64K, %d 2M)\n",
+		  idx, count_4k, count_64k, count_2m);
+
+	stats_before = get_prl_stats(fd, 0);
+	test_vma_ranges_list(fd, sizes, idx, start_addr);
+	stats_after = get_prl_stats(fd, 0);
+
+	free(random_pages);
+	free(sizes);
+	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
+}
+
 /**
  * SUBTEST: prl-invalidate-full
  * Description: Create 512 4K page entries at the maximum page reclaim list
@@ -410,11 +557,15 @@ int igt_main()
 
 		igt_require_f(xe_gt_stats_get_count(fd, 0, "prl_4k_entry_count") >= 0,
 			      "gt_stats is required for Page Reclamation tests.\n");
+		igt_srandom();
 	}
 
 	igt_subtest("basic-mixed")
 		test_vma_ranges_basic_mixed(fd);
 
+	igt_subtest("random")
+		test_vma_range_random(fd);
+
 	igt_subtest("prl-invalidate-full")
 		test_vma_ranges_prl_entries(fd, OVERFLOW_PRL_SIZE, 0, 1);
 
-- 
2.43.0

