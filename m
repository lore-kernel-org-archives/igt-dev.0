Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA08710E51F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Nov 2023 11:48:59 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Nov 2023 11:48:16 +0000
Message-ID: <20231107114816.190793-16-matthew.auld@intel.com>
In-Reply-To: <20231107114816.190793-1-matthew.auld@intel.com>
References: <20231107114816.190793-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 15/15] tests/intel-ci/xe: add pat and
 caching related tests
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

Add the various pat_index, coh_mode and cpu_caching related tests to
BAT.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index f11761ac8..b1c93ed69 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -107,6 +107,7 @@ igt@xe_intel_bb@simple-bb-ctx
 igt@xe_mmap@bad-extensions
 igt@xe_mmap@bad-flags
 igt@xe_mmap@bad-object
+igt@xe_mmap@cpu-caching
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
@@ -147,6 +148,12 @@ igt@xe_vm@munmap-style-unbind-userptr-end
 igt@xe_vm@munmap-style-unbind-userptr-front
 igt@xe_vm@munmap-style-unbind-userptr-inval-end
 igt@xe_vm@munmap-style-unbind-userptr-inval-front
+igt@xe_pat@userptr-coh-none
+igt@xe_pat@pat-index-all
+igt@xe_pat@pat-index-xelp
+igt@xe_pat@pat-index-xehpc
+igt@xe_pat@pat-index-xelpg
+igt@xe_pat@pat-index-xe2
 igt@xe_waitfence@abstime
 igt@xe_waitfence@reltime
 igt@kms_addfb_basic@addfb25-4-tiled
-- 
2.41.0
