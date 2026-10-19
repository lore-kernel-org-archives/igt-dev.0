Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6D5606A319
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 17:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WQSQRSxs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1E010E5CB;
	Mon, 19 Oct 2026 17:26:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448EC10E5CB
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792430751; x=1823966751;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=EVupNiCzRIYacrVi1UikdSkEvwPI1nVkyyRCNKhfqbY=;
 b=WQSQRSxsqGfLjadKMdk1PNWFj6Mkq4v5fgBrSttSRndBgflAcWwtqbZ3
 C52eW1rLk6sgiWJKifUZu3m1nLXmNyra9ELKEDHj9emV37fLDsdt2kK7R
 2q5myxh7SKhkgylceR+lGjANzjB6kpS96xfsLEgtR/jU5SM1GNcQmhgfv
 FKs7gOqw5n3N9ENsD8eSsXJg7KY0BHGiIJ72TGNxvvXCjySyK61p1+aQK
 kbg3E6BvM4/LcNSHoWYcZfMvyiOp6nBgHguofgrgluLf+ELy+wz3ky4oJ
 wHpCmVMia4Ip32+P4+It6iMhMhKAWTAXdrCU3ylABpqMkiOi7QsNbqraX w==;
X-CSE-ConnectionGUID: FVADwRRkRJO2YuYh/2u8bA==
X-CSE-MsgGUID: GItNzrIcRIu643kw3oLm1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1015563"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1015563"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 10:25:51 -0700
X-CSE-ConnectionGUID: tqZbp/tZQWyhvjN4bRw4Jw==
X-CSE-MsgGUID: jveTf+RLTpyTMdl1lkPVZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2648175"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 10:25:48 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 19 Oct 2026 19:23:31 +0200
Subject: [PATCH] lib/gpu_cmds: use proper surface format for all platforms
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-bpp_surface_fix-v1-1-c030fa182e3a@intel.com>
X-B4-Tracking: v=1; b=H4sIABJS1moC/yWM0QrCMBAEf6Xcs4GkiFJ/RaQk1409H2LIGRFK/
 91EH2fYnY0URaB0GTYqeIvKMzVwh4F49ekOI0tjGu14ctZNJuQ8ay3RM+YoH2OPiGwxMc4LtVc
 uaPpXvN7+rDU8wK+e6YvgFSYUn3jtqmalff8CtUWW2YkAAAA=
X-Change-ID: 20261019-bpp_surface_fix-04efc0e9ce7d
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.17-dev-6be7c
X-Developer-Signature: v=1; a=openpgp-sha256; l=3732;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=EVupNiCzRIYacrVi1UikdSkEvwPI1nVkyyRCNKhfqbY=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBq1lIWsokZT4pPhHcYrf1O6TnWldeITy+srpBdU
 seGa9OiAJGJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCatZSFgAKCRAjYrKT3hD9
 15ZIDAC7Osw1iCmw5Fcbo6mxpl5+6hna94DvY4+5FJMrUS96wfoM+bt2utbQSZ00IdDovUpZRWB
 FeWVyAkaICsoU8iLENFlWIjdJDKN2ro0F+Ys64/wvJSZmS8avNrGGAqYIqsAkxXV+2wwljNVPjZ
 n8HzbE0PEyoL01LKl3C8D+fnVuGwXDellJ4yNLoMZTwsXvfVNvSdF5WeBTxd5ioZjtDUrJ0dqSy
 IyiRTqoBqXzplnFaYjvOwD2yASrhQWjp0NHdd2hONHJfrT2OeJngs9bsEM2tY31mlzvt0y0Gk2y
 a2CB2MTtvSnHzTIri6sJ74R5Dp0YTr7O2YOjsGr/yRkeiRaGNRTQc6e3ZMPxiGfFqgxjGUCP5yK
 DCKjCNieAYDSOUszP+G4bBYyr3hQv9FJ1CmnhXyCNtip6MGwHCEs1v2T9LxT8Ts5R0WVUo0bk2n
 dkTek5ak0xB8eOhfXX+EM0GBYw3u8ZCMOFJ6Qklt7NWHR75O/pEm09o4/wy9X5Hbc9rZw=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On older platforms (< 2.0) SURFACEFORMAT_R8_UNORM was used always,
regardless of bpp, as it does not matter for media block send messages.
Since 2.0 format reflecting bpp is required. The code was adjusted
only for newer platforms, conditionals were added suggesting this is
kind-of-workaround. The patch removes these conditionals, there is no
point to keep them and perform cargo cult on new code.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
The patch was tested succesfully on ADL-S.
---
 lib/gpu_cmds.c | 58 ++++++++++++++++++++++------------------------------------
 1 file changed, 22 insertions(+), 36 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 7a72166a0ec6..db308b8e4726 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -298,53 +298,39 @@ gen11_fill_surface_state(struct intel_bb *ibb,
 	return offset;
 }
 
+static uint32_t fill_surface_state(struct intel_bb *ibb,
+				   struct intel_buf *buf,
+				   uint32_t format,
+				   int is_dst)
+{
+	unsigned int gfx_ver = intel_graphics_ver(intel_get_drm_devid(ibb->fd));
+
+	return (gfx_ver >= IP_VER(12, 50) ? xehp_fill_surface_state :
+		gfx_ver >= IP_VER(9, 0) ? gen9_fill_surface_state :
+		gfx_ver >= IP_VER(8, 0) ? gen8_fill_surface_state :
+		gen7_fill_surface_state)(ibb, buf, format, is_dst);
+}
+
 static uint32_t
 fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
 {
 	uint32_t binding_table_offset;
 	uint32_t *binding_table;
-	uint32_t devid = intel_get_drm_devid(ibb->fd);
+	uint32_t format;
 
 	intel_bb_ptr_align(ibb, 64);
 	binding_table_offset = intel_bb_offset(ibb);
 	binding_table = intel_bb_ptr(ibb);
 	intel_bb_ptr_add(ibb, 64);
 
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
-		/*
-		 * Up until now, SURFACEFORMAT_R8_UNROM was used regardless of the 'bpp' value.
-		 * For bpp 32 this results in a surface that is 4x narrower than expected. However
-		 * it worked, because the 'Media Block Read/Write' message assumes the surface width
-		 * is always in units of dwords.
-		 *
-		 * Since Xe2 the Media Block Write message got replaced with 'Typed 2D Block
-		 * Load/Store Message' which correctly interprets the surface format.
-		 */
-		if (buf->bpp == 32)
-			binding_table[0] = xehp_fill_surface_state(ibb, buf,
-								      SURFACEFORMAT_R8G8B8A8_UNORM,
-								      1);
-		else if (buf->bpp == 8)
-			binding_table[0] = xehp_fill_surface_state(ibb, buf,
-								      SURFACEFORMAT_R8_UNORM,
-								      1);
-		else
-			igt_assert_f(false,
-				     "Surface state for bpp = %u not implemented",
-				     buf->bpp);
-	} else if (intel_graphics_ver(devid) >= IP_VER(12, 50)) {
-		binding_table[0] = xehp_fill_surface_state(ibb, buf,
-							   SURFACEFORMAT_R8_UNORM, 1);
-	} else if (intel_graphics_ver(devid) >= IP_VER(9, 0)) {
-		binding_table[0] = gen9_fill_surface_state(ibb, buf,
-							   SURFACEFORMAT_R8_UNORM, 1);
-	} else if (intel_graphics_ver(devid) >= IP_VER(8, 0)) {
-		binding_table[0] = gen8_fill_surface_state(ibb, buf,
-							   SURFACEFORMAT_R8_UNORM, 1);
-	} else {
-		binding_table[0] = gen7_fill_surface_state(ibb, buf,
-							   SURFACEFORMAT_R8_UNORM, 1);
-	}
+	if (buf->bpp == 32)
+		format = SURFACEFORMAT_R8G8B8A8_UNORM;
+	else if (buf->bpp == 8)
+		format = SURFACEFORMAT_R8_UNORM;
+	else
+		igt_assert_f(false, "Surface state for bpp = %u not implemented", buf->bpp);
+
+	binding_table[0] = fill_surface_state(ibb, buf, format, 1);
 
 	return binding_table_offset;
 }

---
base-commit: e171f5e98b9938f41790074d014fed417ace25c8
change-id: 20261019-bpp_surface_fix-04efc0e9ce7d

Best regards,
--  
Andrzej Hajda <andrzej.hajda@intel.com>

