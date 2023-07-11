Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8BB10E321
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 07:12:23 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.28.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id AEB78580D5F
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 00:12:17 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qJ7Xj-0035rt-1g
 for igt-dev@lists.freedesktop.org; Tue, 11 Jul 2023 09:12:15 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Jul 2023 09:12:09 +0200
Message-Id: <20230711071213.737377-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230711071213.737377-1-mauro.chehab@linux.intel.com>
References: <20230711071213.737377-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] tests/intel-ci/meson.build: Generate
 and store an intel-ci.testlist
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

This is a preparation to simplify test_list.py checks to make it
more generic.

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
