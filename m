Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE4511224A
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Aug 2022 18:30:42 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 Aug 2022 18:30:15 +0000
Message-Id: <20220823183036.5270-3-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 02/23] i915/perf: Fix OA short_reads test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

With 5000 ns oa exponent, report lost errors can occur. A report lost
header can be read by the user even when there are no valid OA report
samples, so we get an 8 byte read. This defeats the EFAULT check.

When checking for EFAULT on a sampled report, discard any report lost
errors.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 51e2dc87..0b8f6ac8 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -2853,8 +2853,13 @@ test_short_reads(void)
 
 	/* A read that can't return a single record because it would result
 	 * in a fault on buffer overrun should result in an EFAULT error...
+	 *
+	 * Make sure to weed out all report lost errors before verifying EFAULT.
 	 */
-	ret = read(stream_fd, pages + page_size - 16, page_size);
+	header = (void *)(pages + page_size - 16);
+	do {
+		ret = read(stream_fd, header, page_size);
+	} while (ret > 0 && header->type == DRM_I915_PERF_RECORD_OA_REPORT_LOST);
 	igt_assert_eq(ret, -1);
 	igt_assert_eq(errno, EFAULT);
 
-- 
2.25.1
