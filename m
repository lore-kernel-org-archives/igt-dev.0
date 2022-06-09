Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13123112FC2
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jun 2022 05:38:07 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Thu,  9 Jun 2022 11:04:27 +0530
Message-Id: <20220609053427.4061474-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20220609053427.4061474-1-bhanuprakash.modem@intel.com>
References: <20220609053427.4061474-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 3/3] tests/intel-ci: Rename kms_pipe_crc_basic
 subtests in BAT
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

As we converted the subtests to dynamic, we must rename the
same subtests in BAT.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 14cad7c0..82f240e4 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -115,17 +115,12 @@ igt@kms_force_connector_basic@force-edid
 igt@kms_force_connector_basic@force-load-detect
 igt@kms_force_connector_basic@prune-stale-modes
 igt@kms_frontbuffer_tracking@basic
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-a
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
-igt@kms_pipe_crc_basic@read-crc-pipe-a
-igt@kms_pipe_crc_basic@read-crc-pipe-b
-igt@kms_pipe_crc_basic@read-crc-pipe-c
-igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck
+igt@kms_pipe_crc_basic@hang-read-crc
+igt@kms_pipe_crc_basic@nonblocking-crc
+igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
+igt@kms_pipe_crc_basic@read-crc
+igt@kms_pipe_crc_basic@read-crc-frame-sequence
 igt@kms_psr@primary_page_flip
 igt@kms_psr@cursor_plane_move
 igt@kms_psr@sprite_plane_onoff
@@ -182,4 +177,4 @@ igt@i915_suspend@basic-s3-without-i915
 igt@gem_exec_suspend@basic-s0
 igt@gem_exec_suspend@basic-s3
 igt@kms_chamelium@common-hpd-after-suspend
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a
+igt@kms_pipe_crc_basic@suspend-read-crc
-- 
2.35.1
