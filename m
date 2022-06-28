Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Jun 2022 14:13:17 +0100
Message-Id: <20220628131318.197965-2-matthew.auld@intel.com>
In-Reply-To: <20220628131318.197965-1-matthew.auld@intel.com>
References: <20220628131318.197965-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_cursor_crc: fix truncated
 warning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Looks reasonable to just increase the size of 'name' to avoid the
potential truncation:

../tests/kms_cursor_crc.c: In function ‘run_size_tests.constprop’:
../tests/kms_cursor_crc.c:699:50: warning: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size between 4 and 14 [-Wformat-truncation=]
  699 |                 snprintf(name, sizeof(name), "%dx%d", w, h);
      |                                                  ^~
../tests/kms_cursor_crc.c:699:46: note: directive argument in the range [-2147483648, 1024]
  699 |                 snprintf(name, sizeof(name), "%dx%d", w, h);
      |                                              ^~~~~~~
In file included from /usr/include/stdio.h:894,
                 from ../lib/igt_core.h:38,
                 from ../lib/drmtest.h:39,
                 from ../lib/igt.h:27,
                 from ../tests/kms_cursor_crc.c:25:
In function ‘snprintf’,
    inlined from ‘run_size_tests.constprop’ at ../tests/kms_cursor_crc.c:699:3:
/usr/include/bits/stdio2.h:71:10: note: ‘__builtin___snprintf_chk’ output between 4 and 24 bytes into a destination of size 16
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |                                    __glibc_objsize (__s), __fmt,
      |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |                                    __va_arg_pack ());
      |                                    ~~~~~~~~~~~~~~~~~

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/kms_cursor_crc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 513c9715..131fdb0a 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -691,7 +691,7 @@ static void test_rapid_movement(data_t *data)
 static void run_size_tests(data_t *data, enum pipe pipe,
 			   int w, int h)
 {
-	char name[16];
+	char name[32];
 
 	if (w == 0 && h == 0)
 		strcpy(name, "max-size");
-- 
2.36.1
