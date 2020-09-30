Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEE56E5B0
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2020 09:23:13 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Wed, 30 Sep 2020 11:21:55 +0200
Message-Id: <20200930092155.26661-19-dominik.grzegorzek@intel.com>
In-Reply-To: <20200930092155.26661-1-dominik.grzegorzek@intel.com>
References: <20200930092155.26661-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 18/18] HAX: run in BAT tests changed in v2
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

gem_tiled_blits will fail on !llc platforms
https://gitlab.freedesktop.org/drm/intel/-/issues/2328

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index aa2eb329..83f09f55 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -32,6 +32,11 @@ igt@gem_huc_copy@huc-copy
 igt@gem_linear_blits@basic
 igt@gem_mmap@basic
 igt@gem_mmap_gtt@basic
+igt@gem_pipe_control_store_loop@fresh-buffer
+igt@gem_pipe_control_store_loop@reused-buffer
+igt@gem_ppgtt@blt-vs-render-ctx0
+igt@gem_ppgtt@blt-vs-render-ctxn
+igt@gem_ppgtt@flink-and-close-vma-leak
 igt@gem_render_linear_blits@basic
 igt@gem_render_tiled_blits@basic
 igt@gem_ringfill@basic-all
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
