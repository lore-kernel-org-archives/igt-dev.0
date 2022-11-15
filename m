Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C44810E363
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 05:16:04 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 14 Nov 2022 21:15:55 -0800
Message-Id: <20221115051555.57933-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Fix compile warning
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

Fix the following compile warning:

[1/414] Compiling C object tests/kms_cursor_crc.p/kms_cursor_crc.c.o
../tests/kms_cursor_crc.c: In function ‘run_size_tests.constprop’:
../tests/kms_cursor_crc.c:731:50: warning: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size between 4 and 14 [-Wformat-truncation=]
  731 |                 snprintf(name, sizeof(name), "%dx%d", w, h);
      |                                                  ^~
../tests/kms_cursor_crc.c:731:46: note: directive argument in the range [-2147483648, 1024]
  731 |                 snprintf(name, sizeof(name), "%dx%d", w, h);
      |                                              ^~~~~~~
In file included from /usr/include/stdio.h:894,
                 from ../lib/igt_core.h:41,
                 from ../lib/drmtest.h:39,
                 from ../lib/igt.h:27,
                 from ../tests/kms_cursor_crc.c:25:
In function ‘snprintf’,
    inlined from ‘run_size_tests.constprop’ at ../tests/kms_cursor_crc.c:731:3:
/usr/include/bits/stdio2.h:71:10: note: ‘__builtin___snprintf_chk’ output between 4 and 24 bytes into a destination of size 16
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |                                    __glibc_objsize (__s), __fmt,
      |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |                                    __va_arg_pack ());
      |                                    ~~~~~~~~~~~~~~~~~

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/kms_cursor_crc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 68bed666814..17f294d64d1 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -720,7 +720,7 @@ static void run_size_tests(data_t *data, int w, int h)
 			"Check the rapid update of given-size cursor movements." },
 	};
 	int i;
-	char name[16];
+	char name[32];
 
 	if (w == 0 && h == 0) {
 		w = data->cursor_max_w;
-- 
2.38.0
