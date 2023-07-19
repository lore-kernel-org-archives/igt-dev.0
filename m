Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F9C10E3F5
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jul 2023 07:05:30 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 19 Jul 2023 12:39:39 +0530
Message-Id: <20230719070939.562159-4-kunal1.joshi@intel.com>
In-Reply-To: <20230719070939.562159-1-kunal1.joshi@intel.com>
References: <20230719070939.562159-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 3/3] tests/intel-ci: added blacklist to meson.build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index d5a6e4f47..9f6ed501d 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -7,6 +7,8 @@ intelci_files = [
   'blacklist-pre-merge.txt',
   'xe-fast-feedback.testlist',
   'xe.blocklist.txt',
+  'chamelium.blacklist',
+  'psr.blacklist',
 ]
 
 install_data(sources : intelci_files, install_dir : datadir)
-- 
2.25.1
