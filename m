Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8054C10E65C
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 12:07:14 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 17:36:39 +0530
Message-Id: <20230825120639.1175005-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2] tests/intel-ci: add files to meson.build
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

Testlists and blacklists are added to meson.build so that these
can be used by CI.
Also, sorted files alphabetically.

v2: -rearrange (Kamil)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/meson.build | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 9f6ed501d..964738cc8 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -1,14 +1,18 @@
+# Keep alphabetically sorted by default
 
 intelci_files = [
-  'fast-feedback.testlist',
-  'meta.testlist',
   'README',
   'blacklist.txt',
   'blacklist-pre-merge.txt',
-  'xe-fast-feedback.testlist',
-  'xe.blocklist.txt',
   'chamelium.blacklist',
+  'chamelium-only.testlist',
+  'fast-feedback.testlist',
+  'fast-feedback-chamelium-only.testlist',
+  'meta.testlist',
   'psr.blacklist',
+  'xe.blocklist.txt',
+  'xe-fast-feedback.testlist',
+  'xe-fast-feedback-chamelium-only.testlist',
 ]
 
 install_data(sources : intelci_files, install_dir : datadir)
-- 
2.25.1
