Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAFC606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cRcfNasQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3859910E114;
	Mon, 16 Nov 2026 05:25:01 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A342210E027
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 22:29:16 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-55d2c49c3d9so5321751cf.3
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 14:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794695355; x=1795300155;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KN5P6hjyoRZP32EOlLinoDBsLuZyxdOB4Hf20UiSqoQ=;
 b=cRcfNasQVu9ghJKLlJKXh70tsSHB8mN+o3yt7UxxMJk7INMuAz9/XRQEbeTioE3tIN
 oYwILcMpn5zaNqaicX4uIXd6/ofv3VzgNBSCkQL/v5pcSQd6D27slX6HxpO0mR/LBimB
 ciB6DhdUzC4/sxXSMPA9nIzw3rcrA5uU9V1o5sNJOSwUvvxLxqt9m/B4ujxdm/DyEdtl
 3WzwuMFUi9oST6GBguC0wxN0tboTC1C/NbBJBt7fc6uaKFi0tcNMVypPXRV6xNiknO0D
 DhOtVDm8ZC773l32DM9w49n/8ItwfjDvZiKa5GCAJXd+1VQQpxL1IJVU1KkwLWidykWJ
 06jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794695355; x=1795300155;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KN5P6hjyoRZP32EOlLinoDBsLuZyxdOB4Hf20UiSqoQ=;
 b=qfMP15H1puJEe0tDBdLZyQbLptGYDXXBBUXLglGNCHTkAx8V7mq+CWRMdz3kH6VLdP
 Esdi9kXV1eJQ+fUfBBfr54TxvSX3DGUO9I9S35lDQF4kxi8GIJWmmIxJZGVmXXCizbFI
 RTtnHIGnTYXuvyFFqG+JedxjzgKnslN81j5T80vqMea1PhPMwe6OM+j5Ugvuj9P51QV6
 f0CdlfgmN3gfIvrqrJl3oUIa4k8dmPSncnKdb4akISOBbicF/UN5hQzKA4RZnnCQsWRN
 X66APDhmmjmdVdbbrSkNTplYSDZDuswv7uLqYlx5YA8xhbvJz0w5RJMAcLECBObz5LXt
 0GVQ==
X-Gm-Message-State: APuU4Z9jTz0HzZfOtEF0qSwlMJ/P0D9/DNA/vtCZBPx7zhi2eN5SwqSB
 uUpu1RsHi3K1edo56FHENEyj/VKW/toYfuMNEzF+JKgN2AAhG19RhrC8/lGw+1OjB0ODRs8RBDs
 wsPEYiJhim0Q1dsAThV5neA60pbh7LcifjW023srhSMdYvGdid/1HPu/9cClpuJCeSzeiypkI7B
 OMuQCaq6Gm6556OEV6G3Iq+dvOLhbhOyl7lMwodnmPNIa8heMfedKRQhDW
X-Received: from qtbnl9.prod.google.com ([2002:a05:622a:56c9:b0:54d:6c5b:dc35])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:451:b0:55d:13c7:c232 with SMTP id
 d75a77b69052e-55d13c7c737mr30856531cf.51.1794695355075; 
 Sat, 14 Nov 2026 14:29:15 -0800 (PST)
Date: Sat, 14 Nov 2026 17:29:10 -0500
In-Reply-To: <20261114222911.1405626-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261114222911.1405626-1-gildekel@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261114222911.1405626-3-gildekel@google.com>
Subject: [PATCH i-g-t 2/3] lib/igt_hdr: Parse DisplayID CTA data blocks
From: Gil Dekel <gildekel@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Gil Dekel <gildekel@google.com>, Swati Sharma <swati2.sharma@intel.com>, 
 Karthik B S <karthik.b.s@intel.com>, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
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

Some eDP panels have no CTA-861 extension at all. The Samsung
ATNA40LE01 OLED carries two DisplayID 2.0 extensions instead, and the
second one holds a CTA data block (tag 0x81) with an HDR Static
Metadata Data Block that lists SDR gamma and SMPTE ST 2084.
igt_is_edid_hdr() only looks at CTA-861 extensions, so it reports the
panel as SDR. kms_hdr then runs invalid-hdr on it, a negative test
that expects the kernel to refuse the ST 2084 EOTF, and the subtest
fails because this panel accepts it.

Also walk DisplayID extensions. For each CTA data block in the
section, scan its CTA-861 data block collection with the same check.
Every block is bounded by the section length, which stops before the
section checksum.

Extend lib/tests/igt_hdr with the panel's EDID, plus copies where the
HDR block only lists SDR gamma and where the CTA block runs past the
section.

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Gil Dekel <gildekel@google.com>
---
 lib/igt_hdr.c       | 41 +++++++++++++++++++++--
 lib/tests/igt_hdr.c | 82 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
index 8c36a035e..27e4a2426 100644
--- a/lib/igt_hdr.c
+++ b/lib/igt_hdr.c
@@ -27,6 +27,7 @@
 #define CTA_DATA_BLOCK_OFFSET		4
 #define HDR_STATIC_METADATA_BLOCK	0x06
 #define USE_EXTENDED_TAG		0x07
+#define DISPLAYID_DATA_BLOCK_CTA	0x81
 
 static bool cta_block(const char *edid_ext)
 {
@@ -88,14 +89,46 @@ static bool cta_ext_has_hdr(const struct edid_cea *cea)
 	       cta_data_blocks_have_hdr((const uint8_t *)cea->data, len);
 }
 
+/*
+ * eDP panels such as the Samsung ATNA40LE01 OLED advertise HDR through a
+ * CTA data block (tag 0x81) inside a DisplayID extension, rather than
+ * through a CTA-861 extension block.
+ */
+static bool displayid_ext_has_hdr(const struct edid_dispid *dispid)
+{
+	/* The section checksum follows the data blocks inside data[]. */
+	int end = min_t(int, dispid->header.num_bytes,
+			sizeof(dispid->data) - 1);
+	const uint8_t *data = (const uint8_t *)dispid->data;
+	int i = 0;
+
+	while (i + (int)sizeof(struct dispid_block_header) <= end) {
+		const struct dispid_block_header *block =
+			(const struct dispid_block_header *)&data[i];
+		int payload = i + sizeof(*block);
+
+		if (payload + block->num_bytes > end)
+			break;
+
+		if (block->tag == DISPLAYID_DATA_BLOCK_CTA &&
+		    cta_data_blocks_have_hdr(&data[payload], block->num_bytes))
+			return true;
+
+		i = payload + block->num_bytes;
+	}
+
+	return false;
+}
+
 /**
  * igt_is_edid_hdr:
  * @data: raw EDID, the base block followed by its extension blocks
  * @size: size of @data in bytes
  *
  * Looks for an HDR Static Metadata Block in the CTA extensions of an
- * EDID. A sink is considered HDR-capable when it advertises support for
- * Traditional Gamma HDR or SMPTE ST 2084 EOTFs. Never reads past @size.
+ * EDID, and in the CTA data blocks of its DisplayID extensions. A sink is
+ * considered HDR-capable when it advertises support for Traditional
+ * Gamma HDR or SMPTE ST 2084 EOTFs. Never reads past @size.
  *
  * Returns: true if the EDID advertises HDR support, false otherwise.
  */
@@ -116,6 +149,10 @@ bool igt_is_edid_hdr(const void *data, size_t size)
 
 		if (ext->tag == EDID_EXT_CEA && cta_ext_has_hdr(&ext->data.cea))
 			return true;
+
+		if (ext->tag == EDID_EXT_DISPLAYID &&
+		    displayid_ext_has_hdr(&ext->data.dispid))
+			return true;
 	}
 
 	return false;
diff --git a/lib/tests/igt_hdr.c b/lib/tests/igt_hdr.c
index 628d4b2e6..b2f9433e1 100644
--- a/lib/tests/igt_hdr.c
+++ b/lib/tests/igt_hdr.c
@@ -33,9 +33,72 @@ static void make_cta_edid(uint8_t edid[2 * EDID_BLOCK_SIZE], uint8_t eotf)
 	cta[7] = 0x01;	/* static metadata descriptor type 1 */
 }
 
+/*
+ * EDID of a Samsung ATNA40LE01 eDP OLED panel. It has no CTA-861
+ * extension: its second DisplayID 2.0 extension carries a CTA data
+ * block (tag 0x81) with an HDR Static Metadata Data Block.
+ */
+static const uint8_t atna40le01_edid[3 * EDID_BLOCK_SIZE] = {
+	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
+	0x4c, 0x83, 0x17, 0x42, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x23, 0x01, 0x04, 0xb5, 0x1e, 0x13, 0x78,
+	0x01, 0x3a, 0xe5, 0xae, 0x51, 0x3d, 0xb6, 0x23,
+	0x0b, 0x50, 0x54, 0x00, 0x00, 0x00, 0x01, 0x01,
+	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00,
+	0x00, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x0a, 0x20,
+	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+	0x00, 0x00, 0x00, 0xfd, 0x00, 0x1e, 0x78, 0xe6,
+	0xe6, 0x47, 0x01, 0x0a, 0x20, 0x20, 0x20, 0x20,
+	0x20, 0x20, 0x00, 0x00, 0x00, 0xfe, 0x00, 0x3d,
+	0x4f, 0x34, 0x31, 0x20, 0x20, 0x20, 0x20, 0x20,
+	0x20, 0x20, 0x20, 0xff, 0x00, 0x00, 0x00, 0xfc,
+	0x00, 0x41, 0x54, 0x4e, 0x41, 0x34, 0x30, 0x4c,
+	0x45, 0x30, 0x31, 0x2d, 0x30, 0x20, 0x02, 0xe8,
+	/* DisplayID 2.0 extension 1: product ID, display params, timings. */
+	0x70, 0x20, 0x79, 0x02, 0x00, 0x20, 0x00, 0x18,
+	0x4c, 0x83, 0x00, 0x17, 0x42, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x23, 0x0c, 0x41, 0x54, 0x4e, 0x41,
+	0x34, 0x30, 0x4c, 0x45, 0x30, 0x31, 0x2d, 0x30,
+	0x21, 0x00, 0x1d, 0xca, 0x0b, 0x5e, 0x07, 0x40,
+	0x0b, 0x08, 0x07, 0x00, 0xe1, 0xba, 0x51, 0xd7,
+	0x83, 0xb6, 0x3d, 0x82, 0x0b, 0x02, 0x45, 0x54,
+	0x78, 0x61, 0x40, 0x66, 0x00, 0x44, 0x23, 0x78,
+	0x26, 0x00, 0x09, 0x06, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x50, 0x00, 0x00, 0x22, 0x00, 0x14, 0x00,
+	0xd4, 0x0a, 0x85, 0x3f, 0x0b, 0xc7, 0x00, 0x07,
+	0x00, 0x1f, 0x00, 0x07, 0x07, 0x77, 0x00, 0x4f,
+	0x00, 0x0f, 0x00, 0x2e, 0x00, 0x06, 0x00, 0x44,
+	0x78, 0x61, 0x78, 0x61, 0x2b, 0x00, 0x0c, 0x27,
+	0x00, 0x1e, 0x77, 0x00, 0x00, 0x27, 0x00, 0x1e,
+	0x3b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x99, 0x90,
+	/* DisplayID 2.0 extension 2: timing, then the CTA block at 284. */
+	0x70, 0x20, 0x79, 0x00, 0x00, 0x22, 0x00, 0x14,
+	0x00, 0xd4, 0x0a, 0x05, 0x3f, 0x0b, 0xc7, 0x00,
+	0x07, 0x00, 0x1f, 0x00, 0x07, 0x07, 0xf7, 0x07,
+	0xcf, 0x07, 0x0f, 0x00, 0x81, 0x00, 0x1f, 0x73,
+	0x1a, 0x00, 0x00, 0x03, 0x5b, 0x1e, 0x78, 0x00,
+	0xa0, 0xa0, 0x01, 0x7a, 0x02, 0x78, 0x00, 0x00,
+	0x00, 0x00, 0x8d, 0xe3, 0x05, 0x80, 0x00, 0xe6,
+	0x06, 0x05, 0x01, 0xa0, 0x7a, 0x01, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xce, 0x90,
+};
+
+/* Offsets into atna40le01_edid. */
+#define ATNA40LE01_CTA_BLOCK_LEN	286	/* payload size of the 0x81 block */
+#define ATNA40LE01_HDR_EOTF		313	/* EOTF byte of the HDR block */
+
 int igt_main()
 {
 	uint8_t edid[2 * EDID_BLOCK_SIZE];
+	uint8_t dispid_edid[sizeof(atna40le01_edid)];
 
 	igt_subtest("cta-hdr") {
 		make_cta_edid(edid, 0x05);	/* SDR gamma + SMPTE ST 2084 */
@@ -51,4 +114,23 @@ int igt_main()
 		make_cta_edid(edid, 0x05);
 		igt_assert(!igt_is_edid_hdr(edid, EDID_BLOCK_SIZE));
 	}
+
+	igt_subtest("displayid-cta-hdr")
+		igt_assert(igt_is_edid_hdr(atna40le01_edid,
+					   sizeof(atna40le01_edid)));
+
+	igt_subtest("displayid-cta-sdr-only") {
+		memcpy(dispid_edid, atna40le01_edid, sizeof(dispid_edid));
+		igt_assert_eq(dispid_edid[ATNA40LE01_HDR_EOTF], 0x05);
+		dispid_edid[ATNA40LE01_HDR_EOTF] = 0x01;	/* SDR gamma */
+		igt_assert(!igt_is_edid_hdr(dispid_edid, sizeof(dispid_edid)));
+	}
+
+	igt_subtest("displayid-cta-block-overflow") {
+		/* The CTA block claims to run past the DisplayID section. */
+		memcpy(dispid_edid, atna40le01_edid, sizeof(dispid_edid));
+		igt_assert_eq(dispid_edid[ATNA40LE01_CTA_BLOCK_LEN], 0x1f);
+		dispid_edid[ATNA40LE01_CTA_BLOCK_LEN] = 0x7f;
+		igt_assert(!igt_is_edid_hdr(dispid_edid, sizeof(dispid_edid)));
+	}
 }
-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

