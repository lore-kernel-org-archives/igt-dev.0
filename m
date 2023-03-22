Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B28A10E195
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 00:05:28 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 kamil.konieczny@linux.intel.com
Date: Tue, 21 Mar 2023 17:04:57 -0700
Message-Id: <20230322000523.3310187-6-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230322000523.3310187-1-umesh.nerlige.ramappa@intel.com>
References: <20230322000523.3310187-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 05/31] i915/perf: Use ARRAY_SIZE for
 buffer-fill test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

A prior patch changed the way size of properties is calculated. It
missed one test. Replace the sizeof with ARRAY_SIZE for buffer-fill
test.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index bd1fcc28..865858fe 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -2560,7 +2560,7 @@ test_buffer_fill(void)
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	struct drm_i915_perf_record_header *header;
-- 
2.36.1
