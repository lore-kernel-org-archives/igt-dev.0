Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Arkadiusz Hiler <arek@hiler.eu>
Date: Thu, 25 Mar 2021 20:59:12 +0200
Message-Id: <20210325185915.51590-2-arek@hiler.eu>
In-Reply-To: <20210325185915.51590-1-arek@hiler.eu>
References: <20210325185915.51590-1-arek@hiler.eu>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/5] tests: Build gem_concurrent_all with
 meson
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

...and add it to test-list-full.txt just like we do when building with
autotools.

Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>
---
 tests/meson.build | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/meson.build b/tests/meson.build
index 54a1a3c7..8e3cd390 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -402,6 +402,19 @@ test_list_target = custom_target('testlist',
 	      install : true,
 	      install_dir : libexecdir)
 
+test_executables += executable('gem_concurrent_all', 'i915/gem_concurrent_all.c',
+	   dependencies : test_deps + [ libatomic ],
+	   install_dir : libexecdir,
+	   install_rpath : libexecdir_rpathdir,
+	   install : true)
+test_list += 'gem_concurrent_all'
+
+test_list_full_target = custom_target('testlist-full',
+	      output : 'test-list-full.txt',
+	      command : [ gen_testlist, '@OUTPUT@', test_list ],
+	      install : true,
+	      install_dir : libexecdir)
+
 test_script = find_program('igt_command_line.sh')
 foreach prog : test_list
 	test('testcase check ' + prog, test_script, args : prog)
-- 
2.31.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
