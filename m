Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DE78BFF1
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Jul 2022 07:01:10 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 11 Jul 2022 09:00:36 +0200
Message-Id: <20220711070036.10453-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_gt: Remove static vcs2 engine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Keeping this entry with flags == -1 doesn't make sense. Batchbuffers
executed with such invalid flags will always return -EINVAL.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/6393

In above reference entering iteration on static engines is the result
of fault in the driver (effect of previous fault-injection test).
As we know passing invalid flags is wrong lets get rid off this entry
from the static engine list.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/igt_gt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index 50da512f21..d4a825e664 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -616,7 +616,6 @@ const struct intel_execution_engine2 intel_execution_engines2[] = {
 	{ "bcs0", I915_ENGINE_CLASS_COPY, 0, I915_EXEC_BLT },
 	{ "vcs0", I915_ENGINE_CLASS_VIDEO, 0, I915_EXEC_BSD | I915_EXEC_BSD_RING1 },
 	{ "vcs1", I915_ENGINE_CLASS_VIDEO, 1, I915_EXEC_BSD | I915_EXEC_BSD_RING2 },
-	{ "vcs2", I915_ENGINE_CLASS_VIDEO, 2, -1 },
 	{ "vecs0", I915_ENGINE_CLASS_VIDEO_ENHANCE, 0, I915_EXEC_VEBOX },
 	{ }
 };
-- 
2.34.1
