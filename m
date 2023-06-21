Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147D710E430
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 09:56:18 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
Date: Wed, 21 Jun 2023 09:55:51 +0000
Message-Id: <20230621095551.1823862-2-katarzyna.dec@intel.com>
In-Reply-To: <20230621095551.1823862-1-katarzyna.dec@intel.com>
References: <20230621095551.1823862-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/intel-ci: Add xe_mmap & xe_create
 tests to f-f
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Adding new tests to BATs:

igt@xe_create@create-engines-noleak
igt@xe_create@create-engines-leak
igt@xe_create@create-massive-size
igt@xe_mmap@bad-flags
igt@xe_mmap@bad-extensions
igt@xe_mmap@bad-object

Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index cad1da61f..a956e10e0 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -2,6 +2,9 @@
 igt@xe_module_load@load
 
 igt@xe_compute@compute-square
+igt@xe_create@create-engines-noleak
+igt@xe_create@create-engines-leak
+igt@xe_create@create-massive-size
 igt@xe_debugfs@base
 igt@xe_debugfs@gt
 igt@xe_debugfs@forcewake
@@ -182,6 +185,9 @@ igt@xe_intel_bb@simple-bb-ctx
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
+igt@xe_mmap@bad-flags
+igt@xe_mmap@bad-extensions
+igt@xe_mmap@bad-object
 igt@xe_mmio@mmio-timestamp
 igt@xe_mmio@mmio-invalid
 igt@xe_prime_self_import@basic-with_one_bo
-- 
2.34.1


