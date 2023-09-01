Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1851310E121
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Sep 2023 05:26:11 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Sep 2023 10:48:08 +0530
Message-Id: <20230901051808.1369104-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] scripts/test_list: Allow unrecognized
 field:values in testplan
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

As non-Intel vendors also contributing to KMS tests, allow
them to re-use the existing testplan documentation along with
their own definitions of field:values pair in test config json.

Instead of aborting, just throw a warning about this unrecognized
field:values.

Example:
tests/kms_color.c:994: Warning: unrecognized field in tests/kms_test_config.json  ==> Foo: bla

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 scripts/test_list.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 0bcc96869..517c4d067 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1219,8 +1219,8 @@ class TestList:
                     continue
 
                 file_line.rstrip(r"\n")
-                sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
-                         (self.config_fname, file_line))
+                print(f"{'/'.join(fname.split('/')[-2:])}:{file_ln + 1}: Warning: unrecognized field in %s ==> %s" %
+                        ('/'.join(self.config_fname.split('/')[-2:]), file_line))
 
     def show_subtests(self, sort_field):
 
-- 
2.40.0
