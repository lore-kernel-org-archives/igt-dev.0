Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A247410E392
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 15:29:09 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 137A7580DAB
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 08:28:56 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qH4R3-001vyJ-2Z
 for igt-dev@lists.freedesktop.org; Wed, 05 Jul 2023 17:28:53 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Jul 2023 17:28:48 +0200
Message-Id: <20230705152850.461010-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230705152850.461010-1-mauro.chehab@linux.intel.com>
References: <20230705152850.461010-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] tests/meson.build: create testlists for
 tests
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

Let's dynamically create testlists for during build time, as this
can speed up a lot the validation check for testplan.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/meson.build | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/meson.build b/tests/meson.build
index ee066b84900b..246a585aa423 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -545,7 +545,17 @@ test_list_full_target = custom_target('testlist-full',
 	      install_dir : libexecdir)
 
 test_script = find_program('igt_command_line.sh')
-foreach prog : test_list
+foreach testexe : test_executables
+	prog = testexe.name()
+
+	output = prog.split('/').get(-1) + '.testlist'
+	custom_target(output,
+		     build_by_default : true,
+		     command : [ testexe.full_path(), '--show-testlist'],
+		     capture : true,
+		     depends : testexe,
+		     output : output)
+
 	test('testcase check ' + prog, test_script, args : prog)
 endforeach
 
-- 
2.40.1
