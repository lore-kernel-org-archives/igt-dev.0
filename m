Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADB810E870
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 12:11:06 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Nov 2023 13:10:39 +0100
Message-ID: <20231102121044.58786-5-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231102121044.58786-1-kamil.konieczny@linux.intel.com>
References: <20231102121044.58786-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 4/4] tests/intel/xe_create: print first
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
card, so it will be coherent with other messages. Before
this log for multi-gpu test will miss <g:0> like:

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
index dc7c9502e..a882489f3 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -243,6 +243,7 @@ igt_main
 		igt_multi_fork(child, gpu_count) {
 			int gpu_fd;
 
+			__drm_invalidate_opened_log();
 			gpu_fd = drm_open_filtered_card(child);
 			igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=%d\n", child, errno);
 			igt_assert(is_xe_device(gpu_fd));
-- 
2.42.0
