Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835A810E9CE
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 15:28:03 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed, 25 May 2022 17:27:19 +0200
Message-Id: <20220525152719.1022426-4-ryszard.knop@intel.com>
In-Reply-To: <20220525152719.1022426-1-ryszard.knop@intel.com>
References: <20220525152719.1022426-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/intel-ci/fast-feedback: add
 i915_module_load@load
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

This should be the first test that runs in most CI test lists, as it
makes sure i915 is available, and if not, logs why it can't be loaded.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index b579c20a..c4a7c124 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,5 +1,7 @@
-# Keep alphabetically sorted by default
+# Try to load the driver if it's not available yet.
+igt@i915_module_load@load
 
+# Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
 igt@fbdev@eof
-- 
2.36.1
