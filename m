Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51F4606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BvT7dsAs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D2E10E240;
	Mon, 16 Nov 2026 05:28:35 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A7010E3CC
 for <igt-dev@lists.freedesktop.org>; Sun, 15 Nov 2026 00:19:21 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93909014c85so15095285a.0
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 16:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794701960; x=1795306760;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5OmeSRbJBzcDM3172bljANqApr6SHFZk6qSNuRmkXg0=;
 b=BvT7dsAskmwf+n59/LkW2INPI11dJ3PdvnFQilCY+uZOTlqQ3IpITDxl/aE48xgMdx
 pTIR7s7vxZTz3DKWToR+IkoNA7TJe2xmbG9Z10sEpWcBjB1TEl3Qe/ckM1ejCkCNs1rK
 ZKVUB/C8ZV16lmBcPsrI2mAfy8J+hgbvwtJVmh/LZdjg83ZuHhRrF71RAogpKvzldMU7
 95oU0YXa7ns8P7ziv9GisvjGMT5tI1cNa1LuZLqJfjnEBGPh3TuUcbePMaycv9x9oLyn
 B2i1xR5F0ss21zlNgrS7pZdazyP9l4IaKZ2R18xCXxemf4V2WJ5fdvKLoY4QEdUpm6Xz
 CqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794701960; x=1795306760;
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5OmeSRbJBzcDM3172bljANqApr6SHFZk6qSNuRmkXg0=;
 b=ui0bqYvtD/1DZRLXrjpGEX869w9YVb/1PXupEDWlvTA+ojNbgnmrqtYz0n06lHchPH
 cAaViiZqjsM03rB2NxrdoFdh8PTfFk1oHvRDIWhSr/5hZx1IK3lHM1dyexZzgkz64NBa
 78JSPC313ywOK8EZI4O3XlWtYukZgJl9Rm4K76bN+uD8kQi0IevuNGYGGEqpZnCWQlld
 4Bqs8NDCctT6K623W5InsBIXR0aUCpoHReoVvmtTSoheof/20KasWKooSVtLJlimtw01
 MVF/dqkP6Fy2PvcZs34Z0etEQ/iMO2TPss5GwLJ3C/avTlLMgTKn8Wcj5gBXCpOnC4cT
 8Jig==
X-Gm-Message-State: APuU4Z+wsd3nlkL7/mEu/1FmYfaKaEf/ss+JC6vEhzbHAvSLZK+/MHGo
 qE/S/uUDM258aBBWxnm5reE7flR6DsWg2TM9ThAwlhiymFnemSHWLosc0WiLvHAqODsaXk2ahFw
 IzufEGBkrV9M7H5WhjQgMavyp29T0LZlug2i6ZeE5NrEjcG+GohexLkdgVsKHY5Hk+OigFqTsTV
 eCS+2gy0QMEGxtKmMsa2IdD+IAPLpbiTOCDV17w5QfeMpjafbroexMH0Mo
X-Received: from qkll11.prod.google.com ([2002:a05:620a:210b:b0:93e:61da:c07a])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:6410:b0:93f:277b:3136 with SMTP id
 af79cd13be357-9494ba5f9d7mr1065484185a.2.1794701959958; 
 Sat, 14 Nov 2026 16:19:19 -0800 (PST)
Date: Sat, 14 Nov 2026 19:19:02 -0500
In-Reply-To: <20261115001917.2933254-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261114222911.1405626-1-gildekel@google.com>
 <20261115001917.2933254-1-gildekel@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115001917.2933254-2-gildekel@google.com>
Subject: [PATCH i-g-t v2 1/3] lib/igt_hdr: Add a testable igt_is_edid_hdr()
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

Notes:
    v2: No changes.

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

