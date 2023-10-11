Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537F8882D0
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 15:12:16 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:09:53 +0100
Message-ID: <20231011150953.284936-13-matthew.auld@intel.com>
In-Reply-To: <20231011150953.284936-1-matthew.auld@intel.com>
References: <20231011150953.284936-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 12/12] tests/intel-ci/xe: add pat and
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
---
 tests/intel-ci/xe-fast-feedback.testlist | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 610cc958c..86f197110 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -138,6 +138,7 @@ igt@xe_intel_bb@simple-bb-ctx
 igt@xe_mmap@bad-extensions
 igt@xe_mmap@bad-flags
 igt@xe_mmap@bad-object
+igt@xe_mmap@cpu-caching-coh
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
@@ -180,6 +181,12 @@ igt@xe_vm@munmap-style-unbind-userptr-end
 igt@xe_vm@munmap-style-unbind-userptr-front
 igt@xe_vm@munmap-style-unbind-userptr-inval-end
 igt@xe_vm@munmap-style-unbind-userptr-inval-front
+igt@xe_pat@pat-index-all
+igt@xe_pat@pat-index-common-blt
+igt@xe_pat@pat-index-common-render
+igt@xe_pat@pat-index-xe2-blt
+igt@xe_pat@pat-index-xe2-render
+igt@xe_pat@userptr-coh-none
 igt@xe_waitfence@abstime
 igt@xe_waitfence@reltime
 igt@kms_addfb_basic@addfb25-4-tiled
-- 
2.41.0
