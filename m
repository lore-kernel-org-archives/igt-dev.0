Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9241D10E346
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 08:28:42 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 351B0580D7D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 01:28:32 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1petpe-007QdR-0H
 for igt-dev@lists.freedesktop.org; Wed, 22 Mar 2023 09:28:30 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Mar 2023 09:28:25 +0100
Message-Id: <20230322082826.1770429-8-mauro.chehab@linux.intel.com>
In-Reply-To: <20230322082826.1770429-1-mauro.chehab@linux.intel.com>
References: <20230322082826.1770429-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 7/8] testplan/meson.build: use
 join_paths()
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

Use the more portable join_paths() macro.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/testplan/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 9e7ae7a04753..10ea4be9a3f5 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -4,9 +4,9 @@ sphinx = find_program('sphinx-build', required: build_sphinx)
 rst2html = find_program('rst2html-3', 'rst2html', required : false)
 rst2pdf = find_program('rst2pdf', required: false)
 
-stylesheet = meson.current_source_dir() + '/testplan.css'
+stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
 
-xe_test_config = source_root + '/tests/xe/xe_test_config.json'
+xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
 
 if not build_tests
     test_executables = []
-- 
2.39.2
