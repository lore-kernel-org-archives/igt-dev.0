Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E6F10E9FC
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Feb 2023 00:46:53 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 16:46:22 -0800
Message-Id: <20230215004648.2100655-6-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 05/31] i915/perf: Use ARRAY_SIZE for
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
---
 tests/i915/perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 02414e06..77bda442 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -2573,7 +2573,7 @@ test_buffer_fill(void)
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
