Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3A3CF6487
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 23:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1841A10E27D;
	Wed, 19 Nov 2025 23:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFLgDoO6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DEE10E27B
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 23:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763594343; x=1795130343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/oz56WcugCR5L/5+WHfT+xzPdQrkvTVCvIE0NSZHHOw=;
 b=fFLgDoO62y+SUAC51iCTODq+yywGGKXHDNq8dgcbE4fcuwPf2+55D4N/
 hqcdOqac/56IZf5WR4i3fojEU+V280i3k/lCbTajFt/8fwEfxQAuZ+IpT
 qjKe9MmMlgioBj6b8jg5VproqHXArXnHWo5/XL83FGygYYFbU573Z84yu
 H7HYChMN5Listo0/VoVabt3VzSHABLIFGbkt8eOanbA82o9WAVsf3sm6o
 xWemlKkW5rRHKFjeLqiB32GCfecpKiQmOoIHVF7Yy8mfQ7EGV/MBCrvgd
 jad8Ux5KQTdjahx7UiQsW6dhQlBRnM5bcPltsaYczz0d9hBh1STWSp+Oi w==;
X-CSE-ConnectionGUID: COcXjFHYRnS8wIPElzsPQw==
X-CSE-MsgGUID: mPB2pSNwTiOkH6l8mI6qnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68257795"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208,223";a="68257795"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 15:19:03 -0800
X-CSE-ConnectionGUID: IOeUTRIyTl2b6BscuKD2pg==
X-CSE-MsgGUID: w3T3IdElRmC464e3x+kCnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
 d="scan'208,223";a="195682875"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa004.jf.intel.com with ESMTP; 19 Nov 2025 15:19:02 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH 2/2] tests/intel/xe_pat: randomize PAT test subset for xe2
Date: Wed, 19 Nov 2025 23:19:00 +0000
Message-ID: <20251119231900.3797119-3-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119231900.3797119-1-zongyao.bai@intel.com>
References: <20251119231900.3797119-1-zongyao.bai@intel.com>
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

From Xe2 onwards, the PAT index has become large, making exhaustive
testing of all combinations impractical. This patch introduces a hybrid
testing approach to maintain comprehensive coverage.

Implementation:
  The PAT index test list is constructed using a two-phase approach:

  Phase 1 - Mandatory Entries:
    Pre-populate the test list with essential PAT indices representing
    critical use cases (wb/uc/wt, etc). These entries occupy the initial
    positions in the test list.

  Phase 2 - Random Supplement:
    Fill the remaining test list slots by randomly selecting unique PAT
    indices from the complete PAT table, excluding already-selected
    entries from Phase 1.

With this strategy, all PAT configurations have a chance to be verified
through multiple runs. Based on this time/coverage trade-off, it provides
acceptable time consumption in each round.

Suggested-by: Xin Wang <x.wang@intel.com>
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel/xe_pat.c | 127 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 103 insertions(+), 24 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 4294af71c..f3d931133 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -25,6 +25,8 @@
 
 #define XE_COH_NONE          1
 #define XE_COH_AT_LEAST_1WAY 2
+#define PAT_ENTRY_TEST_CNT   12
+#define PAT_ENTRY_MANDATORY_TEST_CNT 3
 
 static bool do_slow_check;
 
@@ -942,29 +944,101 @@ const struct pat_index_entry xelpg_pat_index_modes[] = {
 	{ NULL, 4, false, "2way-atomics-cpu-wc", XE_COH_AT_LEAST_1WAY, true },
 };
 
-const struct pat_index_entry xe2_pat_index_modes[] = {
-	XE_COMMON_PAT_INDEX_MODES,
-
-	/* Too many, just pick some of the interesting ones */
-	{ NULL, 1,  false, "1way",        XE_COH_AT_LEAST_1WAY       },
-	{ NULL, 2,  false, "2way",        XE_COH_AT_LEAST_1WAY       },
-	{ NULL, 2,  false, "2way-cpu-wc", XE_COH_AT_LEAST_1WAY, true },
-	{ NULL, 5,  false, "uc-1way",     XE_COH_AT_LEAST_1WAY       },
-	{ NULL, 12, true,  "uc-comp",     XE_COH_NONE                },
-	{ NULL, 31, false, "c3-2way",     XE_COH_AT_LEAST_1WAY       },
+/* Full set of xe2_pat_index_modes */
+const struct pat_index_entry xe2_pat_index_modes_full[] = {
+	/* Mandatory selected PAT index entries first */
+	{ NULL,  2, false, "c0-l3_wb-l4_uc-2way",         XE_COH_AT_LEAST_1WAY        },
+	{ NULL,  2, false, "c0-l3_wb-l4_uc-2way-cpu_wc",  XE_COH_AT_LEAST_1WAY, true  },
+	{ NULL,  3, false, "c0-l3_uc-l4_uc",              XE_COH_NONE                 },
+	{ NULL, 15, true,  "c0-l3_xd-l4_wt-comp",         XE_COH_NONE                 },
+	/* Random selected PAT index entries below */
+	{ NULL,  0, false, "c0-l3_wb-l4_uc",              XE_COH_NONE                 },
+	{ NULL,  1, false, "c0-l3_wb-l4_uc-1way",         XE_COH_AT_LEAST_1WAY        },
+	{ NULL,  1, false, "c0-l3_wb-l4_uc-1way-cpu_wc",  XE_COH_AT_LEAST_1WAY, true  },
+	{ NULL,  4, false, "c0-l3_uc-l4_wb-1way",         XE_COH_AT_LEAST_1WAY        },
+	{ NULL,  4, false, "c0-l3_uc-l4_wb-1way-cpu_wc",  XE_COH_AT_LEAST_1WAY, true  },
+	{ NULL,  5, false, "c0-l3_uc-l4_uc-1way",         XE_COH_AT_LEAST_1WAY        },
+	{ NULL,  5, false, "c0-l3_uc-l4_uc-1way-cpu_wc",  XE_COH_AT_LEAST_1WAY, true  },
+	{ NULL,  6, false, "c0-l3_xd-l4_uc",              XE_COH_NONE                 },
+	{ NULL,  7, false, "c0-l3_uc-l4_wb-2way",         XE_COH_AT_LEAST_1WAY        },
+	{ NULL,  7, false, "c0-l3_uc-l4_wb-2way-cpu_wc",  XE_COH_AT_LEAST_1WAY, true  },
+	{ NULL,  8, false, "c0-l3_uc-l4_wb",              XE_COH_NONE                 },
+	{ NULL,  9, true,  "c0-l3_wb-l4_uc-comp",         XE_COH_NONE                 },
+	{ NULL, 10, true,  "c0-l3_uc-l4_wb-comp",         XE_COH_NONE                 },
+	{ NULL, 11, true,  "c0-l3_xd-l4_uc-comp",         XE_COH_NONE                 },
+	{ NULL, 12, true,  "c0-l3_uc-l4_uc-comp",         XE_COH_NONE                 },
+	{ NULL, 13, false, "c0-l3_wb-l4_wb",              XE_COH_NONE                 },
+	{ NULL, 14, true,  "c0-l3_wb-l4_wb-comp",         XE_COH_NONE                 },
+	/* PAT index 16..19 are reserved */
+	{ NULL, 20, false, "c1-l3_wb-l4_uc",              XE_COH_NONE                 },
+	{ NULL, 21, true,  "c1-l3_wb-l4_uc-comp",         XE_COH_NONE                 },
+	{ NULL, 22, false, "c1-l3_wb-l4_uc-1way",         XE_COH_AT_LEAST_1WAY        },
+	{ NULL, 22, false, "c1-l3_wb-l4_uc-1way-cpu_wc",  XE_COH_AT_LEAST_1WAY, true  },
+	{ NULL, 23, false, "c1-l3_wb-l4_uc-2way",         XE_COH_AT_LEAST_1WAY        },
+	{ NULL, 23, false, "c1-l3_wb-l4_uc-2way-cpu_wc",  XE_COH_AT_LEAST_1WAY, true  },
+	{ NULL, 24, false, "c2-l3_wb-l4_uc",              XE_COH_NONE                 },
+	{ NULL, 25, true,  "c2-l3_wb-l4_uc-comp",         XE_COH_NONE                 },
+	{ NULL, 26, false, "c2-l3_wb-l4_uc-1way",         XE_COH_AT_LEAST_1WAY        },
+	{ NULL, 26, false, "c2-l3_wb-l4_uc-1way-cpu_wc",  XE_COH_AT_LEAST_1WAY, true  },
+	{ NULL, 27, false, "c2-l3_wb-l4_uc-2way",         XE_COH_AT_LEAST_1WAY        },
+	{ NULL, 27, false, "c2-l3_wb-l4_uc-2way-cpu_wc",  XE_COH_AT_LEAST_1WAY, true  },
+	/* PAT index 28..31 are blocked for BMG 20.01 WA */
+	{ NULL, 28, false, "c3-l3_wb-l4_uc",              XE_COH_NONE                 },
+	{ NULL, 29, true,  "c3-l3_wb-l4_uc-comp",         XE_COH_NONE                 },
+	{ NULL, 30, false, "c3-l3_wb-l4_uc-1way",         XE_COH_AT_LEAST_1WAY        },
+	{ NULL, 30, false, "c3-l3_wb-l4_uc-1way-cpu_wc",  XE_COH_AT_LEAST_1WAY, true  },
+	{ NULL, 31, false, "c3-l3_wb-l4_uc-2way",         XE_COH_AT_LEAST_1WAY        },
+	{ NULL, 31, false, "c3-l3_wb-l4_uc-2way-cpu_wc",  XE_COH_AT_LEAST_1WAY, true  },
 };
 
-const struct pat_index_entry bmg_g21_pat_index_modes[] = {
-	XE_COMMON_PAT_INDEX_MODES,
+static struct pat_index_entry pat_index_modes[PAT_ENTRY_TEST_CNT];
+/*
+ * From xe2, pat table become larger
+ * Initialize the PAT index modes with common modes + random modes
+ */
+static int pat_index_modes_init(const struct pat_index_entry *full_modes,
+				size_t full_modes_size)
+{
+	int test_cnt = (igt_run_in_simulation()) ? 5 : PAT_ENTRY_TEST_CNT;
+	int mandatory_cnt = PAT_ENTRY_MANDATORY_TEST_CNT;
+	bool *used_flags;
 
-	/* Too many, just pick some of the interesting ones */
-	{ NULL, 1,  false, "1way",        XE_COH_AT_LEAST_1WAY       },
-	{ NULL, 2,  false, "2way",        XE_COH_AT_LEAST_1WAY       },
-	{ NULL, 2,  false, "2way-cpu-wc", XE_COH_AT_LEAST_1WAY, true },
-	{ NULL, 5,  false, "uc-1way",     XE_COH_AT_LEAST_1WAY       },
-	{ NULL, 12, true,  "uc-comp",     XE_COH_NONE                },
-	{ NULL, 27, false, "c2-2way",     XE_COH_AT_LEAST_1WAY       },
-};
+	igt_assert_lte(test_cnt, full_modes_size);
+	igt_assert_lte(mandatory_cnt, test_cnt);
+
+	used_flags = calloc(full_modes_size, sizeof(bool));
+	igt_assert(used_flags);
+
+	/* Copy the mandatory entries directly. */
+	memcpy(pat_index_modes, full_modes, mandatory_cnt * sizeof(*pat_index_modes));
+
+	for (int i = 0; i < mandatory_cnt; i++)
+		used_flags[i] = true;
+
+	for (int i = mandatory_cnt; i < test_cnt; ) {
+		int idx = rand() % full_modes_size;
+
+		if (used_flags[idx])
+			continue;
+
+		used_flags[idx] = true;
+		pat_index_modes[i++] = full_modes[idx];
+	}
+
+	igt_debug("Initializing and testing PAT index modes for current test phase:\n");
+	for (int i = 0; i < test_cnt; i++) {
+		pat_index_modes[i] = full_modes[i];
+		igt_debug("idx: %2u,  comp: %d,  coh: %u,  force_cpu-wc: %d,  name: %-32s,  %s\n",
+			  pat_index_modes[i].pat_index,
+			  pat_index_modes[i].compressed,
+			  pat_index_modes[i].coh_mode,
+			  pat_index_modes[i].force_cpu_wc,
+			  pat_index_modes[i].name,
+			  (i < mandatory_cnt) ? "Mandatory" : "Random");
+	}
+	free(used_flags);
+	return test_cnt;
+}
 
 /*
  * Depending on 2M/1G GTT pages we might trigger different PTE layouts for the
@@ -1201,11 +1275,16 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		igt_assert(HAS_FLATCCS(dev_id));
 
 		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
-			subtest_pat_index_modes_with_regions(fd, bmg_g21_pat_index_modes,
-							     ARRAY_SIZE(bmg_g21_pat_index_modes));
+			/* BMG doesn't use PAT index 28-31 */
+			subtest_pat_index_modes_with_regions(fd, pat_index_modes,
+				pat_index_modes_init(xe2_pat_index_modes_full,
+						     (ARRAY_SIZE(xe2_pat_index_modes_full) - 6))
+				);
 		else
-			subtest_pat_index_modes_with_regions(fd, xe2_pat_index_modes,
-							     ARRAY_SIZE(xe2_pat_index_modes));
+			subtest_pat_index_modes_with_regions(fd, pat_index_modes,
+				pat_index_modes_init(xe2_pat_index_modes_full,
+						     ARRAY_SIZE(xe2_pat_index_modes_full))
+				);
 	}
 
 	igt_subtest("display-vs-wb-transient")
-- 
2.43.0

