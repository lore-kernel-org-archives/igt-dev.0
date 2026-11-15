Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BBE606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E+COPzOz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D5E10E201;
	Mon, 16 Nov 2026 05:21:29 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73EF10E8C9
 for <igt-dev@lists.freedesktop.org>; Sun, 15 Nov 2026 00:19:22 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-55d2bde4c78so1481001cf.1
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 16:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794701962; x=1795306762;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8WLfk0S258uGS6RTq2hNehrmYMr5V1UHJw5MdYP0/bs=;
 b=E+COPzOzAxvYG1cRBkkmrzrIucdLPvIpv/14x81rtvZ0qTvLA7CL1gYv3tQT5dPuPY
 xPkMd1/pT9KsqYS0VoUgamYhJ6DbR82lEMLmKpoyplR6nI4LyK6kuwJZVRYDaZqR5HfU
 tZVtnaZQZOjxd21RbXF82gjYp/GLWbAXJcGrpjWVdjA++Kicbv9kOyUa6BggySawuHIY
 MMizZhcTduqiWmUTyitF8ZzG5kUJYtiKKGmlDc9joF42NFRMkMI+oH+wH64AlDji9up8
 kTrVG2adWx0xJcHOqAhxAA8tfCDUMYqE5l/HBFjtR8aTea8550nHgIasJv8lahCIxbm5
 kH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794701962; x=1795306762;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8WLfk0S258uGS6RTq2hNehrmYMr5V1UHJw5MdYP0/bs=;
 b=ecIjC5lOru1/Eo1MQCUJxFcJd/WxZ/DCgJyA7PyUmukd03J2ec1q2P3b+hjgAcIPoB
 NDJ1DrBsdHEaTN4Co9cc3mmkSBRNZ68cMwkw6b4xvT35t/vpu62ObFVl5jHFn4czfA0+
 Nlc2qWCWOteoppQ6WJQujIcHsXq7/OTFwxwRHyp4WJv0wsEEOThpGP8jcNduoJDwMLGz
 3wIIBSBfFS1tFo75ilWMvuEvZRSP0l2GOYeQU3feSUH72ke6M5MzdP7BJEwMAPZrBDb/
 BlZbYZEgJY8dwzZC7je/ZRuKMe8pm4Civg3Y0jzDMmWYCyPjfEI1Jf3p6mPWkotBrEcW
 /U0w==
X-Gm-Message-State: APuU4Z+CGCPgcsP0cZLbuYkFXtiNblEByl6h3B3AVLUO1yEs37UmdXRd
 FyWKXzBQYlKUmwgDB2F0eWb1LtUj0zwDb7/Tlgz2fvhwiMwkubMocj2xkOhy+p+g/m8X61K9fTg
 KvlADActj4W0BINzCbj3+jP3IgBUvX/AXJcFYmXq2d+rgWJARLE+gd2voRg5dfk9e+mz/6deoY6
 0HyR8URKdieWF5oNiGzaE06mcUHVbb5kRtHczND7tiPeUpY0l/ttJW9bEj
X-Received: from qtoh19.prod.google.com ([2002:ac8:46d3:0:b0:536:6c92:8d7b])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:5a52:0:b0:55d:32ed:38bc with SMTP id
 d75a77b69052e-55d32ed4dc8mr6946821cf.76.1794701961331; 
 Sat, 14 Nov 2026 16:19:21 -0800 (PST)
Date: Sat, 14 Nov 2026 19:19:03 -0500
In-Reply-To: <20261115001917.2933254-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261114222911.1405626-1-gildekel@google.com>
 <20261115001917.2933254-1-gildekel@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115001917.2933254-3-gildekel@google.com>
Subject: [PATCH i-g-t v2 2/3] lib/igt_hdr: Parse DisplayID CTA data blocks
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

Some eDP OLED panels carry DisplayID 2.0 extensions with a CTA data
block (tag 0x81) containing an HDR Static Metadata Data Block instead
of a CTA-861 extension block. igt_is_edid_hdr() only inspects CTA-861
extensions, so it reports such panels as SDR. kms_hdr then runs the
negative invalid-hdr subtest on them, which fails because the panel
accepts the SMPTE ST 2084 EOTF.

Also walk DisplayID extensions and scan each CTA data block (tag 0x81)
with cta_data_blocks_have_hdr(), bounded by the DisplayID section
length before the trailing section checksum.

Extend lib/tests/igt_hdr with synthetic DisplayID CTA test cases for
HDR, SDR-only, and a CTA data block that overflows the DisplayID
section.

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Gil Dekel <gildekel@google.com>
---

Notes:
    v2: Apologies for the v1 bloat from agent-assisted drafting;
        replace the raw panel EDID dump with a synthetic
        make_displayid_cta_edid() helper.

 lib/igt_hdr.c       | 40 +++++++++++++++++++++++++++++++++++++--
 lib/tests/igt_hdr.c | 46 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
index 8c36a035e..2d2893588 100644
--- a/lib/igt_hdr.c
+++ b/lib/igt_hdr.c
@@ -27,6 +27,7 @@
 #define CTA_DATA_BLOCK_OFFSET		4
 #define HDR_STATIC_METADATA_BLOCK	0x06
 #define USE_EXTENDED_TAG		0x07
+#define DISPLAYID_DATA_BLOCK_CTA	0x81
 
 static bool cta_block(const char *edid_ext)
 {
@@ -88,14 +89,45 @@ static bool cta_ext_has_hdr(const struct edid_cea *cea)
 	       cta_data_blocks_have_hdr((const uint8_t *)cea->data, len);
 }
 
+/*
+ * Some eDP OLED panels advertise HDR through a CTA data block (tag 0x81)
+ * inside a DisplayID extension rather than a CTA-861 extension block.
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
@@ -116,6 +148,10 @@ bool igt_is_edid_hdr(const void *data, size_t size)
 
 		if (ext->tag == EDID_EXT_CEA && cta_ext_has_hdr(&ext->data.cea))
 			return true;
+
+		if (ext->tag == EDID_EXT_DISPLAYID &&
+		    displayid_ext_has_hdr(&ext->data.dispid))
+			return true;
 	}
 
 	return false;
diff --git a/lib/tests/igt_hdr.c b/lib/tests/igt_hdr.c
index 628d4b2e6..c24f7c94b 100644
--- a/lib/tests/igt_hdr.c
+++ b/lib/tests/igt_hdr.c
@@ -33,6 +33,37 @@ static void make_cta_edid(uint8_t edid[2 * EDID_BLOCK_SIZE], uint8_t eotf)
 	cta[7] = 0x01;	/* static metadata descriptor type 1 */
 }
 
+/*
+ * Base block plus one DisplayID 2.0 extension carrying a non-CTA data
+ * block followed by a CTA data block (tag 0x81) whose HDR Static Metadata
+ * Data Block advertises @eotf.
+ */
+static void make_displayid_cta_edid(uint8_t edid[2 * EDID_BLOCK_SIZE],
+				    uint8_t eotf, uint8_t cta_block_len)
+{
+	uint8_t *ext = edid + EDID_BLOCK_SIZE;
+
+	memset(edid, 0, 2 * EDID_BLOCK_SIZE);
+	memcpy(edid, edid_header, sizeof(edid_header));
+	edid[126] = 1;	/* extension count */
+
+	ext[0] = 0x70;	/* DisplayID extension tag */
+	ext[1] = 0x20;	/* DisplayID 2.0 revision */
+	ext[2] = 0x0b;	/* section payload size: 4-byte block + 7-byte CTA block */
+
+	/* Preceding non-CTA DisplayID data block (tag 0x20, 1 payload byte). */
+	ext[5] = 0x20;
+	ext[7] = 0x01;
+
+	/* DisplayID CTA data block (tag 0x81) containing a 4-byte HDR block. */
+	ext[9] = 0x81;
+	ext[11] = cta_block_len;
+	ext[12] = 0xe3;	/* extended tag data block, 3 payload bytes */
+	ext[13] = 0x06;	/* HDR Static Metadata Data Block */
+	ext[14] = eotf;
+	ext[15] = 0x01;	/* static metadata descriptor type 1 */
+}
+
 int igt_main()
 {
 	uint8_t edid[2 * EDID_BLOCK_SIZE];
@@ -51,4 +82,19 @@ int igt_main()
 		make_cta_edid(edid, 0x05);
 		igt_assert(!igt_is_edid_hdr(edid, EDID_BLOCK_SIZE));
 	}
+
+	igt_subtest("displayid-cta-hdr") {
+		make_displayid_cta_edid(edid, 0x05, 4);
+		igt_assert(igt_is_edid_hdr(edid, sizeof(edid)));
+	}
+
+	igt_subtest("displayid-cta-sdr-only") {
+		make_displayid_cta_edid(edid, 0x01, 4);
+		igt_assert(!igt_is_edid_hdr(edid, sizeof(edid)));
+	}
+
+	igt_subtest("displayid-cta-block-overflow") {
+		make_displayid_cta_edid(edid, 0x05, 0x7f);
+		igt_assert(!igt_is_edid_hdr(edid, sizeof(edid)));
+	}
 }
-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

