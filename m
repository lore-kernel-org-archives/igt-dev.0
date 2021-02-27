Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C4B6E0AD
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Feb 2021 22:10:45 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id d2so8300528pjs.4
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Feb 2021 14:10:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 27 Feb 2021 14:10:41 -0800
Message-Id: <20210227221041.541550-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_edid: Allocate raw 8-bytes for VSDB
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
List-ID: <igt-dev@lists.freedesktop.org>

hdmi_vsdb is an element of cea_vsdb which makes the size of cea_vsdb to
be 8 ( 3bytes ieee_oui ) + ( 5bytes hdmi_vsdb struct), its true that we
only use 7 bytes technically we can only allocate 7byte array but since
we are writing to elements of hdmi_vsdb struct which is sitting at offet
4-8 in cea_vsdb, compiler thinks we have an element which is out of
array bounds since out allocated size is 7bytes

This errors out
../git/lib/igt_edid.c:365:13: error: array subscript 'struct hdmi_vsdb[0]' is partly outside array bounds of 'char[7]' [-Werror=array-bounds]
  365 |         hdmi->src_phy_addr[0] = 0x10;
      |             ^~

allocating one extra byte matches with size of cea_vsdb and compiler is
happy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 lib/igt_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_edid.c b/lib/igt_edid.c
index 1c85486d..ce09cc47 100644
--- a/lib/igt_edid.c
+++ b/lib/igt_edid.c
@@ -351,7 +351,7 @@ void cea_sad_init_pcm(struct cea_sad *sad, int channels,
 const struct cea_vsdb *cea_vsdb_get_hdmi_default(size_t *size)
 {
 	/* We'll generate a VSDB with 2 extension fields. */
-	static char raw[CEA_VSDB_HDMI_MIN_SIZE + 2] = {0};
+	static char raw[CEA_VSDB_HDMI_MIN_SIZE + 3] = {0};
 	struct cea_vsdb *vsdb;
 	struct hdmi_vsdb *hdmi;
 
-- 
2.30.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
