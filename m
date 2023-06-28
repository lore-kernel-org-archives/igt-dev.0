Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7369510E129
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 08:58:24 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jun 2023 10:58:16 +0200
Message-Id: <20230628085816.19289-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback: fix xe_mmap
 tests order
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

It turns out I made an error and merged v1 of patch
tests/intel-ci: Add xe_mmap & xe_create tests to f-f

Fixed this with correcting order of tests to be sorted
alphabetically.

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index a956e10e0..9d670764b 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -182,12 +182,12 @@ igt@xe_intel_bb@render
 igt@xe_intel_bb@reset-bb
 igt@xe_intel_bb@simple-bb
 igt@xe_intel_bb@simple-bb-ctx
+igt@xe_mmap@bad-extensions
+igt@xe_mmap@bad-flags
+igt@xe_mmap@bad-object
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
-igt@xe_mmap@bad-flags
-igt@xe_mmap@bad-extensions
-igt@xe_mmap@bad-object
 igt@xe_mmio@mmio-timestamp
 igt@xe_mmio@mmio-invalid
 igt@xe_prime_self_import@basic-with_one_bo
-- 
2.39.2
