Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71ED110E427
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 06:25:54 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Tue, 28 Nov 2023 11:45:33 +0530
Message-Id: <20231128061533.2612350-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20231128061533.2612350-1-bhanuprakash.modem@intel.com>
References: <20231128061533.2612350-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 3/3] tests/intel-ci/xe: Add unsupported tests to
 XE blocklist
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

Add i915 specific tests to XE blocklist.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 71946a50f..1dfbf6825 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -52,9 +52,12 @@ igt@kms_bw@.*-([5-9]|1[0-6])-displays-.*
 ##################################################################
 # KMS: Tests specific to i915 driver
 ##################################################################
+igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
+igt@kms_addfb_basic@basic-y-tiled-legacy
 igt@kms_addfb_basic@bo-too-small-due-to-tiling
 igt@kms_addfb_basic@clobberred-modifier
 igt@kms_addfb_basic@.*framebuffer-vs-set-tiling
+igt@kms_addfb_basic@tile-pitch-mismatch
 igt@kms_busy@.*
 igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
 igt@kms_fence_pin_leak
-- 
2.40.0
