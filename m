Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F4310E0DE
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Mar 2023 09:22:10 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.1.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D73A8580D96
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Mar 2023 02:22:08 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1peYBy-006svh-2Y
 for igt-dev@lists.freedesktop.org; Tue, 21 Mar 2023 10:22:06 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Mar 2023 10:22:04 +0100
Message-Id: <20230321092205.1640976-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230321092205.1640976-1-mauro.chehab@linux.intel.com>
References: <20230321092205.1640976-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/4] meson.build: place gtk-doc
 dependencies check at the right place
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

The requirement for having gtk-doc and have the tests built is only
for docs/reference/igt-gpu-tools.

So, move the code to be there. This lets build testplan docs
without needing gtk-doc (nor having the IGT executables).

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/reference/meson.build | 12 +++++++++++-
 meson.build                |  9 +--------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/docs/reference/meson.build b/docs/reference/meson.build
index 85a8aa47f920..d0f38cd33892 100644
--- a/docs/reference/meson.build
+++ b/docs/reference/meson.build
@@ -1 +1,11 @@
-subdir('igt-gpu-tools')
+if build_docs.enabled()
+	gtk_doc = dependency('gtk-doc', required : true)
+
+	if build_tests and gtk_doc.found()
+		subdir('igt-gpu-tools')
+	else
+		error('Documentation requires building tests')
+	endif
+endif
+
+build_info += 'Build reference documentation: @0@'.format(build_docs.enabled())
diff --git a/meson.build b/meson.build
index cbb7ead7d9cd..5b4920a66944 100644
--- a/meson.build
+++ b/meson.build
@@ -332,14 +332,7 @@ endif
 subdir('overlay')
 subdir('man')
 subdir('scripts')
-
-gtk_doc = dependency('gtk-doc', required : build_docs)
-if build_tests and gtk_doc.found()
-	subdir('docs')
-elif build_docs.enabled()
-	error('Documentation requires building tests')
-endif
-build_info += 'Build documentation: @0@'.format(build_tests and gtk_doc.found())
+subdir('docs')
 
 message('Build options')
 message('=============')
-- 
2.39.2
