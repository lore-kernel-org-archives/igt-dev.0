Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F4310E11D
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 07:31:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 11 Sep 2023 12:52:49 +0530
Message-Id: <20230911072249.1935228-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230911072249.1935228-1-bhanuprakash.modem@intel.com>
References: <20230911072249.1935228-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V5 5/5] tests/intel-ci/xe: Drop Xe supported tests
 from blocklist
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

Drop kms_ccs, kms_fbcon_fbt from XE blocklist.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index d496a3f6d..5acc828c8 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -56,9 +56,7 @@ igt@kms_bw@.*-(5|6|7|8)-displays-.*
 igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
 igt@kms_pipe_b_c_ivb@.*
 igt@kms_pwrite_crc
-igt@kms_ccs@.*
 igt@kms_frontbuffer_tracking@.*-(cpu|gtt|pwrite)
-igt@kms_fbcon_fbt@(fbc|psr)(-suspend)
 igt@kms_fence_pin_leak
 igt@kms_busy@.*
 igt@kms_psr@.*_mmap_(cpu|gtt)
-- 
2.40.0
