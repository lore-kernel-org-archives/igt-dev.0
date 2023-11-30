Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D9910E15C
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 11:17:54 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 11:17:35 +0000
Message-ID: <20231130111735.435263-2-matthew.auld@intel.com>
In-Reply-To: <20231130111735.435263-1-matthew.auld@intel.com>
References: <20231130111735.435263-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/intel-ci/xe-fast-feedback: add
 create-invalid-mbz
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

Ensure we have some coverage in BAT for gem_create MBZ fields.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 5c53e249d..a83c17de7 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -2,6 +2,7 @@
 igt@xe_module_load@load
 
 igt@xe_compute@compute-square
+igt@xe_create@create-invalid-mbz
 igt@xe_create@create-execqueues-noleak
 igt@xe_create@create-execqueues-leak
 igt@xe_create@create-massive-size
-- 
2.43.0
