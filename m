Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D6D10E2F8
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 07:00:05 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.15.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5AF84580D24
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 00:00:03 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pyofA-006f2b-3C
 for igt-dev@lists.freedesktop.org; Tue, 16 May 2023 09:00:00 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 08:59:59 +0200
Message-Id: <20230516065959.1587719-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] meson.build: update minimal version to
 0.48
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

changeset 8ac9440e7bec ("meson: add an option to control Xe test builds")
require updating a dict with values from another dict. This seems
to be supported only on version 0.48 or above.

Updated meson minimal version from 0.47.2 to 0.48.

Fixes: 8ac9440e7bec ("meson: add an option to control Xe test builds")
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 Dockerfile.build-fedora | 2 +-
 meson.build             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index dc5d1b16b488..eff92a21e6e6 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -45,6 +45,6 @@ RUN dnf install -y findutils
 
 # Meson version switching shenanigans
 RUN dnf install -y python3-pip
-RUN curl -o "/usr/src/#1" "https://files.pythonhosted.org/packages/e8/ec/3e6a68c9e0fd4b4f4fb6877a3ccfb6f6e6d09f2b4fc87674e671bf64b7b8/{meson-0.47.2.tar.gz}"
+RUN curl -o "/usr/src/#1" "https://files.pythonhosted.org/packages/df/df/8d5c006f87a3c75f588aeadcf089726bba1e567997a1088655fe7ed68f3d/{meson-0.48.0.tar.gz}"
 
 RUN dnf clean all
diff --git a/meson.build b/meson.build
index 1c872cc9cb02..a1f646ee9239 100644
--- a/meson.build
+++ b/meson.build
@@ -7,7 +7,7 @@ project('igt-gpu-tools', 'c',
           'buildtype=debugoptimized',
         ],
 	license : 'MIT',
-	meson_version : '>=0.47.2')
+	meson_version : '>=0.48')
 
 if get_option('b_ndebug') != 'false'
 	error('Building without -Db_ndebug=false is not supported')
-- 
2.40.1
