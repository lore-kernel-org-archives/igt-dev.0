Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411BD10E03B
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 16:48:45 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Dec 2022 17:47:37 +0100
Message-Id: <20221214164747.68626-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221214164747.68626-1-zbigniew.kempczynski@intel.com>
References: <20221214164747.68626-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 01/11] tests/i915_pipe_stress: Remove
 unused bufmgr field
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

During rewriting this likely left incidentally even if it is not used.
Lets get rid of it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Acked-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/i915_pipe_stress.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/i915/i915_pipe_stress.c b/tests/i915/i915_pipe_stress.c
index 6ce2ce1de2..c06bc65d2c 100644
--- a/tests/i915/i915_pipe_stress.c
+++ b/tests/i915/i915_pipe_stress.c
@@ -119,7 +119,6 @@ struct data {
 	uint64_t modifier;
 	uint32_t devid;
 	struct buf_ops *bops;
-	drm_intel_bufmgr *bufmgr;
 	drmModeModeInfo *last_mode[IGT_MAX_PIPES];
 	struct igt_fb fb[IGT_MAX_PIPES * MAX_PLANES];
 	struct igt_fb cursor_fb[IGT_MAX_PIPES];
-- 
2.34.1
