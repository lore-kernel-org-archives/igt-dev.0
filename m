Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F088113B4D
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 06:31:55 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 sai.gowtham.ch@intel.com
Date: Thu, 16 Jun 2022 12:01:22 +0530
Message-Id: <20220616063123.11029-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20220616063123.11029-1-sai.gowtham.ch@intel.com>
References: <20220616063123.11029-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_tiled_pread_basic: Add test
 description
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Add test description to the test.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_tiled_pread_basic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_tiled_pread_basic.c b/tests/i915/gem_tiled_pread_basic.c
index 2b4cec6e..4f3ffb20 100644
--- a/tests/i915/gem_tiled_pread_basic.c
+++ b/tests/i915/gem_tiled_pread_basic.c
@@ -50,7 +50,9 @@
 #include "i915/gem_create.h"
 
 IGT_TEST_DESCRIPTION("Test pread behavior on tiled objects with respect to the"
-		     " reported swizzling value.");
+		     " reported swizzling value. The goal is to exercise the"
+		     " slow_bit17_copy path for reading on bit17 machines,"
+		     " but will also be useful for catching swizzling value bugs on");
 
 #define WIDTH 512
 #define HEIGHT 512
-- 
2.35.1
