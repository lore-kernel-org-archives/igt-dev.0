Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0742606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWUbxfTq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DD310FCF2;
	Wed, 28 Oct 2026 14:53:35 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F9610E0B5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 14:52:37 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2ea7987517aso6526935ad.0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 07:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793199157; x=1793803957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=szGEKtcgxC7t0R//QEHZqAaaWIAH9fvrhViBf+2hqsg=;
 b=aWUbxfTq1TaQ89zYLQDo3UojrgL2h/x6edfE6larj2F8MrfZghXTnOTIUWSIZn6CGO
 Ff/+YSBMTRW8fvMWn4eYLKqXIzREq3cGOHu/g+twbKNfodI1kEwfWgDt44Fqson+jTTl
 zRdn28xJEsuKy+PkJcxNo8wRp7o+sttxvMvzWUPOG+sLoSxZdm0e3UcHw6dlqDeKggFS
 dUy+x0LZXgW/t8nlV9A0JfKurgDU4gAx8dntarfDvqchKKyJ7dxeoJ4fJDNIXxC6uU0u
 hhaz0pqcmcsHUduyljkHD+oBu3Pdq91kpny//qut2jrI3O1k24Kba2b3mnJ4Mnq0P0AL
 AXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793199157; x=1793803957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=szGEKtcgxC7t0R//QEHZqAaaWIAH9fvrhViBf+2hqsg=;
 b=j9lBMFTJniRzw7w40DtKxDkObn7R2n0alH34ldlFcsJ/6dYW6svySJkk5DOXkvcdK6
 5w6DTJKowEljKH+plm2uufXRJf24a48+x3DNXgO1stjFb4IzKl2RwPyFCKv75HHKMnlV
 3cackR53ALcH0vum6kqE4W9dHfcGmx/0Ucvq+UIFNSaf1IY//17FQg0z2OXSe2yIt/MW
 qFJn3wa5JcVi7kBtrmSZTcZ05Duq6Syr/iiFodCm8393R+ksWwIkS/BeBeZRIzQJ1zBl
 VAKjX2x5MTtGoDe70xZz7ScCo/6q0Qa65TwDPlNSMywrZ5Sy7SvcDWE5v3mRPTsG+Ux2
 Dp8A==
X-Gm-Message-State: AFq9FYIerrKA33rbE0QkTUF0f2wBMRDiW3khR06EQg2dGzkCd2cekz9R
 uoLaa78LFFCwWfiT/GlAw1R/bpt4oM+vsVYuBHXTyISlRJSmgWwE41q8EZ1E2sCU+h4=
X-Gm-Gg: AYBFou2XcwixM1waU7sD+r6M6pb2z9zG7wxDWcggyGMuwCDffnnBdngwnLIqud7kVbO
 IvcSVlprz1dRom5AykWVMsz6++8+7GBNBpSO4jdTx7wWIdmuG3Ty0GFxASmckNq66y0/quITGSA
 +rp9kkTYzlzHxZjcZ6sk6dIhq6VDcZp6Cg5YbrJ0xP5kV8lOY5uZ4sz8BxynsUdEfjv4oWVb9kU
 L8eObvA2XYtgq+Y+ASFFCe07ebXGIWQJb7mWimgF51prPAiQZ+Lwo9eDzzCYuNvQWf3MrQLuPp9
 ZEArWq8IUA1awWe85a8EKHxzzVJHAt+kjK0VTMcMQNCs3Y7A/WEWJ1JhWie2hkVT3dVRl4bNgTF
 uIWfJsLoWCLp9QcbjMj9n6U5VbX/QWHIz2xblAVV2oUpUEdF+GoUqqkfcYqskWwbLlwVopByMTc
 gPoa7lr8s+8H/08mcz7mhIG9vLGy3hHGTOBIFlft++G4ibtX7gEyuo6Bbl/omZVk+AiDKu4+fgt
 w6c4UUk0kH7KOFDtkjmw6XcRO4C56f2XXoD71P/ZHCXEpKyiU8DUgvGNJGIMNbOoNU2sWCpGhHO
 jrgJLx7eXrs/YECiGOvoiuvU8gFZTQTg/l+REoUO8gqam3aF1+DS3pKCIDsuRabUEKDO4UcXAAE
 BUYaPP9evX3OS
X-Received: by 2002:a17:903:240c:b0:2d7:107c:917b with SMTP id
 d9443c01a7336-2eaffc118fcmr26160275ad.0.1793199157085; 
 Wed, 28 Oct 2026 07:52:37 -0700 (PDT)
Received: from localhost ([134.134.137.78]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2eae6c37551sm23933915ad.51.2026.10.28.07.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 07:52:36 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Luca Coelho <luciano.coelho@intel.com>
Subject: [PATCH i-g-t 01/10] lib/igt_fb: add igt_format_get_subsampling()
 function
Date: Wed, 28 Oct 2026 16:51:53 +0200
Message-ID: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

add function to query given pixel format hsub and vsub
parameters.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
---
 lib/igt_fb.c | 22 ++++++++++++++++++++++
 lib/igt_fb.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 6c3b9b0b9..3d15f0595 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -5300,6 +5300,28 @@ int igt_format_plane_bpp(uint32_t drm_format, int plane)
 	return format->plane_bpp[plane];
 }
 
+/**
+ * igt_format_get_subsampling:
+ * @drm_format: drm fourcc
+ * @hsub: chroma subsampling factor in the horizontal direction (out)
+ * @vsub: chroma subsampling factor in the vertical direction (out)
+ *
+ * This function returns the chroma subsampling factors of the @drm_format.
+ * For non-subsampled (e.g. RGB or 4:4:4 YUV) formats both factors are 1.
+ */
+void igt_format_get_subsampling(uint32_t drm_format, int *hsub, int *vsub)
+{
+	const struct format_desc_struct *format =
+		lookup_drm_format(drm_format);
+
+	igt_assert(format);
+
+	if (hsub)
+		*hsub = format->hsub;
+	if (vsub)
+		*vsub = format->vsub;
+}
+
 /**
  * igt_format_array_fill:
  * @formats_array: a pointer to the formats array pointer to be allocated
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 213e2d777..4562164df 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -237,6 +237,7 @@ uint32_t igt_drm_format_str_to_format(const char *drm_format);
 
 bool igt_format_is_fp16(uint32_t drm_format);
 int igt_format_plane_bpp(uint32_t drm_format, int plane);
+void igt_format_get_subsampling(uint32_t drm_format, int *hsub, int *vsub);
 void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
 			   bool allow_yuv);
 int igt_fill_cts_color_ramp_framebuffer(uint32_t *pixmap, uint32_t video_width,
-- 
2.43.0

