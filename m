Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFD58919D
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2020 14:15:13 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 17 Jan 2020 15:14:53 +0100
Message-Id: <20200117141453.9512-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200117141453.9512-1-zbigniew.kempczynski@intel.com>
References: <20200117141453.9512-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v9 5/5] HAX: run gem_render_copy tests in BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

---
 tests/intel-ci/fast-feedback.testlist | 38 +++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 37a92b4e..6465725b 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -37,6 +37,44 @@ igt@gem_flink_basic@flink-lifetime
 igt@gem_linear_blits@basic
 igt@gem_mmap@basic
 igt@gem_mmap_gtt@basic
+igt@gem_render_copy@linear
+igt@gem_render_copy@x-tiled
+igt@gem_render_copy@y-tiled
+igt@gem_render_copy@yf-tiled
+igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs
+igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs
+igt@gem_render_copy@y-tiled-ccs-to-linear
+igt@gem_render_copy@y-tiled-ccs-to-x-tiled
+igt@gem_render_copy@y-tiled-ccs-to-y-tiled
+igt@gem_render_copy@y-tiled-ccs-to-yf-tiled
+igt@gem_render_copy@yf-tiled-ccs-to-linear
+igt@gem_render_copy@yf-tiled-ccs-to-x-tiled
+igt@gem_render_copy@yf-tiled-ccs-to-y-tiled
+igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled
+igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs
+igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs
+igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs
+igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs
+igt@gem_render_copy@linear-to-vebox-yf-tiled
+igt@gem_render_copy@linear-to-vebox-y-tiled
+igt@gem_render_copy@x-tiled-to-vebox-yf-tiled
+igt@gem_render_copy@x-tiled-to-vebox-y-tiled
+igt@gem_render_copy@y-tiled-to-vebox-linear
+igt@gem_render_copy@y-tiled-to-vebox-x-tiled
+igt@gem_render_copy@y-tiled-to-vebox-y-tiled
+igt@gem_render_copy@y-tiled-to-vebox-yf-tiled
+igt@gem_render_copy@yf-tiled-to-vebox-linear
+igt@gem_render_copy@yf-tiled-to-vebox-x-tiled
+igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled
+igt@gem_render_copy@yf-tiled-to-vebox-y-tiled
+igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled
+igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled
+igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled
+igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled
+igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs
+igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs
+igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs
+igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs
 igt@gem_render_linear_blits@basic
 igt@gem_render_tiled_blits@basic
 igt@gem_ringfill@basic-default
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
