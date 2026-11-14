Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8CE606A323
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b/tGHo+l
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE2A10E164;
	Mon, 16 Nov 2026 05:24:07 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713BA10E097
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 22:29:15 +0000 (UTC)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91f10c68ccbso50276406d6.1
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 14:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794695354; x=1795300154;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=tqJT7JFvXz3bj3IHbLuTlBVmjSuFY/D1VFSVyscTIhs=;
 b=b/tGHo+lw2t8OyE1owNm9wHApRPDwHHLz59TYT7lOMjIF+epo9EhBgxZO1p3YUGYwo
 dyMZ1iYkQAxgHGa7c9hHtTPXW0xCS7saex8MsLpkyj+fEwdoXoPG5dKli7lMzYu6OmbC
 8fKjJfurp3qmTTvXX1ZUL6cwEJJ0i759LniiO8/jmlwBjtD8FpOIMo6r8JhPTSrXC6Hr
 sQKk5VbOAJ/Z6yNjqVAQOeir5QfRNt+kEHBABHXCyZnhi/yaSyQ5jHsJwzy5ad4xKQnW
 S6pTrfmXIp7xntq6zSSJBRHhR0ltMgHuVKIpIshk9GqeAqpfO6kuLIkZGiG2an4SxFms
 WRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794695354; x=1795300154;
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tqJT7JFvXz3bj3IHbLuTlBVmjSuFY/D1VFSVyscTIhs=;
 b=a6yOWnzPJ2dr2IlvWGekvX91mDPusGvstPd97Zq+ALILxG31ardkTrOfNlAs84kuoq
 pUkzuHfvzLk1aXUkj0JUmREZO/Ruew0PGaTm/oO1JJ2fyi7eYYiqQwoflbx+sPS8PRbg
 Pr1AsTHK1Mk2Vblxyr1Jf1EbZ2YGwN10Zjh5xxCFkWAEkKV5j+FGF1jl/gfi2SMg9eF/
 B5373SZ/NKjqgs/53ldrSrltIRd938jtCP8pyYUsJ3KfHazTpMn6S5R7wy82G1HI9yHP
 KZC2XUatfZq9tXLy5ZH9s+fHUDEEYYuBy+Tk04BzyAdI4K/ACt0ps5GJM+EmTKyhkhE1
 R36A==
X-Gm-Message-State: APuU4Z85mDo/wo6yu0M8oEkC36boSobm88cgCwBkakZiIqy7Nxgs+amF
 lBfsM/93SRRTKdxIq4qf4SO0uK15caM4R4CuYzC9dtFYP6WiWEIcx57UAlZPhx0pHUg3lEUyfhS
 9p3RxUku3Dmy5T+dh8S757YxO+f1UQuhdd5XK3OZ/UGU1uQD7uM+fGxyF4x26D6e4jSKtrYsg8O
 iPZgN9fP5waJYGGnmfARf84eDjIAqzTml5tNPgSKmj4a/DUdKBOCkJGKoM
X-Received: from qvbkd20.prod.google.com
 ([2002:a05:6214:4014:b0:91e:c1e3:bd2f])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6214:1c0f:b0:919:5223:4b67 with SMTP id
 6a1803df08f44-91f1360465bmr151149286d6.1.1794695353802; 
 Sat, 14 Nov 2026 14:29:13 -0800 (PST)
Date: Sat, 14 Nov 2026 17:29:09 -0500
In-Reply-To: <20261114222911.1405626-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261114222911.1405626-1-gildekel@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261114222911.1405626-2-gildekel@google.com>
Subject: [PATCH i-g-t 1/3] lib/igt_hdr: Add a testable igt_is_edid_hdr()
From: Gil Dekel <gildekel@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Gil Dekel <gildekel@google.com>, Swati Sharma <swati2.sharma@intel.com>, 
 Karthik B S <karthik.b.s@intel.com>, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 16 Nov 2026 05:17:02 +0000
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

igt_is_panel_hdr() reads the EDID blob from the connector and parses
it in one go, so the parser can only be exercised on real hardware. It
also trusts the EDID for its bounds: it walks extensions_len blocks
whatever the blob size is, and it walks CTA data blocks up to
dtd_start bytes from the start of the data block collection, which
begins 4 bytes into the extension. On a malformed EDID it reads past
the blob.

Move the parsing into igt_is_edid_hdr(), which takes the raw EDID and
its size. Walk at most the extensions the buffer holds, and only the
CTA data block collection, bytes 4 to dtd_start - 1, without letting a
data block run past it. Return as soon as an extension advertises HDR.
Before, a later CTA extension without HDR could overwrite an earlier
positive result. igt_is_panel_hdr() now just fetches the blob.

Add lib/tests/igt_hdr with CTA extension cases for HDR, SDR only, and
an EDID whose extension is cut off.

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Gil Dekel <gildekel@google.com>
---
 lib/igt_hdr.c         | 110 +++++++++++++++++++++++++++++-------------
 lib/igt_hdr.h         |   1 +
 lib/tests/igt_hdr.c   |  54 +++++++++++++++++++++
 lib/tests/meson.build |   1 +
 4 files changed, 133 insertions(+), 33 deletions(-)
 create mode 100644 lib/tests/igt_hdr.c

diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
index c0ed9e843..8c36a035e 100644
--- a/lib/igt_hdr.c
+++ b/lib/igt_hdr.c
@@ -24,6 +24,7 @@
=20
 /* HDR EDID parsing. */
 #define CTA_EXTENSION_VERSION		0x03
+#define CTA_DATA_BLOCK_OFFSET		4
 #define HDR_STATIC_METADATA_BLOCK	0x06
 #define USE_EXTENDED_TAG		0x07
=20
@@ -49,62 +50,105 @@ static bool cta_block(const char *edid_ext)
 	return false;
 }
=20
+/*
+ * Walks a CTA-861 data block collection of @len bytes and looks for an
+ * HDR Static Metadata Block.
+ */
+static bool cta_data_blocks_have_hdr(const uint8_t *db, int len)
+{
+	int i =3D 0;
+
+	while (i < len) {
+		int db_len =3D db[i] & 0x1f;
+
+		if (i + 1 + db_len > len)
+			break;
+
+		/* cta_block() reads the tag, extended tag and EOTF bytes. */
+		if (db_len >=3D 2 && cta_block((const char *)&db[i]))
+			return true;
+
+		i +=3D 1 + db_len;
+	}
+
+	return false;
+}
+
+static bool cta_ext_has_hdr(const struct edid_cea *cea)
+{
+	/* Data blocks sit between the 4-byte header and the first DTD. */
+	int len =3D min_t(int, cea->dtd_start - CTA_DATA_BLOCK_OFFSET,
+			sizeof(cea->data));
+
+	/* HDR not defined in CTA Extension Version < 3. */
+	if (cea->revision !=3D CTA_EXTENSION_VERSION)
+		return false;
+
+	return len > 0 &&
+	       cta_data_blocks_have_hdr((const uint8_t *)cea->data, len);
+}
+
+/**
+ * igt_is_edid_hdr:
+ * @data: raw EDID, the base block followed by its extension blocks
+ * @size: size of @data in bytes
+ *
+ * Looks for an HDR Static Metadata Block in the CTA extensions of an
+ * EDID. A sink is considered HDR-capable when it advertises support for
+ * Traditional Gamma HDR or SMPTE ST 2084 EOTFs. Never reads past @size.
+ *
+ * Returns: true if the EDID advertises HDR support, false otherwise.
+ */
+bool igt_is_edid_hdr(const void *data, size_t size)
+{
+	const struct edid *edid =3D data;
+	int num_ext;
+
+	if (size < EDID_BLOCK_SIZE)
+		return false;
+
+	/* Don't trust extensions_len beyond what @data holds. */
+	num_ext =3D min_t(int, edid->extensions_len,
+			(int)(size / EDID_BLOCK_SIZE) - 1);
+
+	for (int i =3D 0; i < num_ext; i++) {
+		const struct edid_ext *ext =3D &edid->extensions[i];
+
+		if (ext->tag =3D=3D EDID_EXT_CEA && cta_ext_has_hdr(&ext->data.cea))
+			return true;
+	}
+
+	return false;
+}
+
 /**
  * igt_is_panel_hdr:
  * @fd: DRM file descriptor
  * @output: output to check
  *
- * Parses the EDID of the given output looking for an HDR Static Metadata
- * Block in the CTA extension. A panel is considered HDR-capable when it
- * advertises support for Traditional Gamma HDR or SMPTE ST 2084 EOTFs.
+ * Checks the EDID of the given output with igt_is_edid_hdr().
  *
  * Returns: true if the panel supports HDR, false otherwise.
  */
 bool igt_is_panel_hdr(int fd, igt_output_t *output)
 {
 	bool ok;
-	int i, j, offset;
 	uint64_t edid_blob_id;
 	drmModePropertyBlobRes *edid_blob;
-	const struct edid_ext *edid_ext;
-	const struct edid *edid;
-	const struct edid_cea *edid_cea;
-	const char *cea_data;
-	bool ret =3D false;
+	bool ret;
=20
 	ok =3D kmstest_get_property(fd, output->id,
 			DRM_MODE_OBJECT_CONNECTOR, "EDID",
 			NULL, &edid_blob_id, NULL);
=20
 	if (!ok || !edid_blob_id)
-		return ret;
+		return false;
=20
 	edid_blob =3D drmModeGetPropertyBlob(fd, edid_blob_id);
 	igt_assert(edid_blob);
+	igt_assert(edid_blob->data);
=20
-	edid =3D (const struct edid *) edid_blob->data;
-	igt_assert(edid);
-
-	for (i =3D 0; i < edid->extensions_len; i++) {
-		edid_ext =3D &edid->extensions[i];
-		edid_cea =3D &edid_ext->data.cea;
-
-		/* HDR not defined in CTA Extension Version < 3. */
-		if ((edid_ext->tag !=3D EDID_EXT_CEA) ||
-		    (edid_cea->revision !=3D CTA_EXTENSION_VERSION))
-				continue;
-		else {
-			offset =3D edid_cea->dtd_start;
-			cea_data =3D edid_cea->data;
-
-			for (j =3D 0; j < offset; j +=3D (cea_data[j] & 0x1f) + 1) {
-				ret =3D cta_block(cea_data + j);
-
-				if (ret)
-					break;
-			}
-		}
-	}
+	ret =3D igt_is_edid_hdr(edid_blob->data, edid_blob->length);
=20
 	drmModeFreePropertyBlob(edid_blob);
=20
diff --git a/lib/igt_hdr.h b/lib/igt_hdr.h
index 15ce5f117..f8988b36c 100644
--- a/lib/igt_hdr.h
+++ b/lib/igt_hdr.h
@@ -15,6 +15,7 @@ enum hdmi_metadata_type {
 	HDMI_STATIC_METADATA_TYPE1 =3D 0,
 };
=20
+bool igt_is_edid_hdr(const void *data, size_t size);
 bool igt_is_panel_hdr(int fd, igt_output_t *output);
=20
 void igt_hdr_fill_st2084(struct hdr_output_metadata *meta);
diff --git a/lib/tests/igt_hdr.c b/lib/tests/igt_hdr.c
new file mode 100644
index 000000000..628d4b2e6
--- /dev/null
+++ b/lib/tests/igt_hdr.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright =C2=A9 2026 Google
+ */
+
+#include <string.h>
+
+#include "igt_core.h"
+#include "igt_hdr.h"
+
+static const uint8_t edid_header[] =3D {
+	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
+};
+
+/*
+ * Base block plus one CTA-861 extension whose only data block is an HDR
+ * Static Metadata Data Block advertising @eotf.
+ */
+static void make_cta_edid(uint8_t edid[2 * EDID_BLOCK_SIZE], uint8_t eotf)
+{
+	uint8_t *cta =3D edid + EDID_BLOCK_SIZE;
+
+	memset(edid, 0, 2 * EDID_BLOCK_SIZE);
+	memcpy(edid, edid_header, sizeof(edid_header));
+	edid[126] =3D 1;	/* extension count */
+
+	cta[0] =3D 0x02;	/* CTA-861 extension tag */
+	cta[1] =3D 0x03;	/* revision 3 */
+	cta[2] =3D 0x08;	/* DTDs start after one 4-byte data block */
+	cta[4] =3D 0xe3;	/* extended tag data block, 3 payload bytes */
+	cta[5] =3D 0x06;	/* HDR Static Metadata Data Block */
+	cta[6] =3D eotf;
+	cta[7] =3D 0x01;	/* static metadata descriptor type 1 */
+}
+
+int igt_main()
+{
+	uint8_t edid[2 * EDID_BLOCK_SIZE];
+
+	igt_subtest("cta-hdr") {
+		make_cta_edid(edid, 0x05);	/* SDR gamma + SMPTE ST 2084 */
+		igt_assert(igt_is_edid_hdr(edid, sizeof(edid)));
+	}
+
+	igt_subtest("cta-sdr-only") {
+		make_cta_edid(edid, 0x01);	/* SDR gamma */
+		igt_assert(!igt_is_edid_hdr(edid, sizeof(edid)));
+	}
+
+	igt_subtest("cta-truncated") {
+		make_cta_edid(edid, 0x05);
+		igt_assert(!igt_is_edid_hdr(edid, EDID_BLOCK_SIZE));
+	}
+}
diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index 18967e592..5e7e2d049 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -11,6 +11,7 @@ lib_tests =3D [
 	'igt_facts',
 	'igt_fork',
 	'igt_fork_helper',
+	'igt_hdr',
 	'igt_hook',
 	'igt_hook_integration',
 	'igt_kms_array_diff',
--=20
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

