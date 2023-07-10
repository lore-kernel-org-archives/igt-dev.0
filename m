Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A2210E27B
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 11:54:02 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 55D73580E7F
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 04:53:59 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qIpSn-002vw5-0u
 for igt-dev@lists.freedesktop.org; Mon, 10 Jul 2023 13:53:57 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Jul 2023 13:53:53 +0200
Message-Id: <20230710115354.699245-7-mauro.chehab@linux.intel.com>
In-Reply-To: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
References: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 6/7] tests/build: Generate and store an
 intel-ci.testlist
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Store a sorted testlist with tests that could be used to test the
DRM core and the Intel drivers in a format that it would be
expected by igt_runner.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel-ci/meson.build | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index d5a6e4f47203..a1ec517f8da1 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -9,4 +9,12 @@ intelci_files = [
   'xe.blocklist.txt',
 ]
 
+custom_target('intel-ci.testlist',
+              build_by_default : true,
+              command : ['sort', testlist_files],
+              install : true,
+              install_dir : datadir,
+              capture : true,
+              output : 'intel-ci.testlist')
+
 install_data(sources : intelci_files, install_dir : datadir)
-- 
2.40.1
