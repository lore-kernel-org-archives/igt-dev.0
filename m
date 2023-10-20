Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F29E10E5B3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 13:01:15 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 15:00:16 +0200
Message-ID: <20231020130016.86398-9-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
References: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 8/8] tests/intel/xe_create: print first
 opened card
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

Use helper and allow to print message about first opened
card, so it will be coherent with messages for other opened
cards. Before this log for multi-gpu test:

IGT-Version: 1.28-g24b5fbcb5 (x86_64) (Linux: 6.6.0-rc3-xe-public)
Opened device: /dev/dri/card1
Starting subtest: multigpu-create-massive-size
<g:1> Opened device: /dev/dri/card2
<g:2> Opened device: /dev/dri/card3
Subtest multigpu-create-massive-size: SUCCESS

After using helper we can see first GPU with <g:0> like:

Opened device: /dev/dri/card1
Starting subtest: multigpu-create-massive-size
<g:0> Opened device: /dev/dri/card1
<g:1> Opened device: /dev/dri/card2
<g:2> Opened device: /dev/dri/card3
Subtest multigpu-create-massive-size: SUCCESS

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_create.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index d17ebeb65..640afebc0 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -244,6 +244,7 @@ igt_main
 		igt_multi_fork(child, gpu_filter_count) {
 			int gpu_fd;
 
+			__drm_invalidate_opened();
 			gpu_fd = __drm_open_driver_another(child, DRIVER_XE);
 			igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=%d\n", child, errno);
 
-- 
2.42.0
