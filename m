Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18BE6EAAB
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Oct 2021 04:43:43 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Thu, 21 Oct 2021 10:05:07 +0530
Message-Id: <20211021043508.1158148-4-priyanka.dandamudi@intel.com>
In-Reply-To: <20211021043508.1158148-1-priyanka.dandamudi@intel.com>
References: <20211021043508.1158148-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] lib/igt_gt: Add compute engine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Add compute (CCS) engine. Add this to the IGT
structure to allow gem tests to execute.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 lib/igt_gt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index a0ba04cc..80fb65ca 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -604,6 +604,10 @@ const struct intel_execution_engine2 intel_execution_engines2[] = {
 	{ "vcs1", I915_ENGINE_CLASS_VIDEO, 1, I915_EXEC_BSD | I915_EXEC_BSD_RING2 },
 	{ "vcs2", I915_ENGINE_CLASS_VIDEO, 2, -1 },
 	{ "vecs0", I915_ENGINE_CLASS_VIDEO_ENHANCE, 0, I915_EXEC_VEBOX },
+	{ "ccs0", I915_ENGINE_CLASS_COMPUTE, 0 , -1},
+	{ "ccs1", I915_ENGINE_CLASS_COMPUTE, 1 , -1},
+	{ "ccs2", I915_ENGINE_CLASS_COMPUTE, 2 , -1},
+	{ "ccs3", I915_ENGINE_CLASS_COMPUTE, 3 , -1},
 	{ }
 };
 
-- 
2.25.1
