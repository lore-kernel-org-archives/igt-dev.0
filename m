Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B359112BC6
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jun 2022 08:22:47 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Thu,  2 Jun 2022 10:22:23 +0200
Message-Id: <20220602082224.387953-3-ryszard.knop@intel.com>
In-Reply-To: <20220602082224.387953-1-ryszard.knop@intel.com>
References: <20220602082224.387953-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/kms_cursor_crc: Increase space
 for the resolution name
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

While it's rather unlikely we'll ever get a name larger than 16 chars,
GCC warns about possible truncation here. Let's just give it more space
to silence the warning.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 tests/kms_cursor_crc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 513c9715..e419fc9f 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -691,7 +691,7 @@ static void test_rapid_movement(data_t *data)
 static void run_size_tests(data_t *data, enum pipe pipe,
 			   int w, int h)
 {
-	char name[16];
+	char name[24];
 
 	if (w == 0 && h == 0)
 		strcpy(name, "max-size");
-- 
2.36.1
