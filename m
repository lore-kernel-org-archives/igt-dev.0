Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEC6606A323
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdCLgDCc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE4210FD26;
	Wed, 28 Oct 2026 15:01:13 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F87010FCFF
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 14:52:42 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-cdab6ae1ee9so584290a12.1
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 07:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793199162; x=1793803962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=R6JQ29qbOXv9/Dz0IsNlV017bUryZwnxROoB68AO/8o=;
 b=xdCLgDCcwbnChjJXl4uNWMpjJEX4tmxeZ4ENEyPml0gjfSKIOHEfOvWIL71vGVNVGK
 Rfdqjib402Wqjd5vzmN751hU0KrCe4xJ7H8/eCZDjauicvnVZbUhZTGrDOKk14i/NqA3
 5Ohe48G/IK1ttSigYwMfUn/dVyZ6NEQiEA1vpskuAb21QbnAVvaAwMcBVsiJ/78dmSas
 jWWiHNULN1R1tjBGUWtmfJKqNm/mj8ox4U/omYuO5PRIel/Vi34opeKoB/CrKy+y1AwX
 RdyqCHxBC7uf6KPfL4+4UHM5E2o2TX69vnYL9yhV4aa47QhsPNp0JCP546br7g5nqXxh
 ii/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793199162; x=1793803962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=R6JQ29qbOXv9/Dz0IsNlV017bUryZwnxROoB68AO/8o=;
 b=amRsKaIVHZ/Bx2dEufwosyZrGfOp/hYTz7LVWsgVvvAtfvcPFs5fj7R6iocGtzEZf2
 I9jKFclSOAivZFmWG93zPRTrGTEcon2Ouc0r6GJ95Sdvzg59VukZEcnRh+GHPmBn8zTJ
 +siPC10JgfASIoFibQ5YiGzdSDCS0jYw1nVvHmPGHQRfNaiKX8mQlfmT0hqeprD0WY3M
 8/OUs/DXfDKbbMZ40L9nsU5O1QdXKjhuXOoYdtLIvOnqhVjnCglm8nz1+AiyC9w1K/os
 HA60iREsvU79a6SttUYKX8O9xxpiXJWL87+RHKrAiKP3qvllILpyTpSoHoh6ysr6UEo+
 JcVQ==
X-Gm-Message-State: AFq9FYLccVkcTL0c1LbjXt/NdEDsGQNLyHkr8FQVh0WzQApJKoFUzqsX
 8fmnbG2iYCN66kCOrtCU+ayR4NZCXwMs1wxfL9upHSgSWZ8NYoZAVarKmKxY3heLJyQ=
X-Gm-Gg: AYBFou0mrBou41fPt214YJ/othby3Vjrwa2X3E3XdUtk6UT/6VIY+a+duFkZ5/4RfS2
 siW9qcdEwMtQFWRJilU6R7nhe4lyUiyFayteCpvUrf0DHzbhRiuwg4sWpg/yuW62s6IzMtpGRkO
 Ci4ayphcwLJdEPS33wMGoH16ZmRXm8WG2djlaNsBb+Qvk+jNcuRJEfXQ8va1mKOwAKMfn8KT4eI
 wyBhttWTWwaAQbiMiUQJp1vpkvL0uXrT19ejB/g1YajWw+o0UfWNqt90N9zoZV3Wt6wCyZdkDTx
 LaUOVX+RVzVQd9QmA7jsfmBYC0hlxcJpgMlbr+aYcELOUOXZ9NqnBB0NdmSaM859Vam2H5fiYXH
 Y9ht8ay7RJXkl+7Tulm08x2No/YnR83vhrZKp/lmR0WcKnuYLlahbACrU5M/YQ+Wp7Pypes7ir4
 kchsRgzjLYgaD2jghC4rNC2USQKWUl3ezttBaneIvePOPrEFiYHIqfreBWAE8QtIiNJotCEP+/w
 E6ibDcY7wP+5Ue3uCB3cSDDXifuJ8PyrPOPjUHaFnotPZs9JLDQXcLc1FVq0YdzLWSydVZnoFZg
 vOYKJLxyCrupR9aUuiGlKWD05Ttd/MWR6FzNWsBiNEl2wA32ranZJTUNgufg5JqkOg==
X-Received: by 2002:a17:902:dad0:b0:2e2:e24e:a88a with SMTP id
 d9443c01a7336-2eb0040c622mr20356235ad.22.1793199161724; 
 Wed, 28 Oct 2026 07:52:41 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2eae6c84d6csm23181815ad.55.2026.10.28.07.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 07:52:41 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Luca Coelho <luciano.coelho@intel.com>
Subject: [PATCH i-g-t 02/10] tests/kms_plane_scaling: add search for scaling
 limit
Date: Wed, 28 Oct 2026 16:51:54 +0200
Message-ID: <20261028145202.3128915-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
References: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
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

add find_max_downscale_src_size() function to do search
for largest accepted scaled size for given plane size

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/kms_plane_scaling.c | 81 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 091b8114e..41f56a5ed 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -709,6 +709,87 @@ static const uint64_t modifiers[] = {
 	I915_FORMAT_MOD_4_TILED
 };
 
+static int
+find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
+			    uint32_t format, uint64_t modifier,
+			    bool scale_width, int dst_w, int dst_h,
+			    int align)
+{
+	igt_display_t *display = &d->display;
+	struct igt_fb probe_fb = {};
+	drmModeRes *res;
+	int fixed = scale_width ? dst_h : dst_w;
+	int dst = scale_width ? dst_w : dst_h;
+	int fb_cap;
+	int lo, hi, best;
+	int ret;
+
+	igt_assert(align >= 1);
+
+	res = drmModeGetResources(display->drm_fd);
+	igt_assert(res);
+	fb_cap = ALIGN_DOWN(scale_width ? res->max_width : res->max_height, align);
+	drmModeFreeResources(res);
+
+	igt_create_fb(display->drm_fd,
+		      scale_width ? fb_cap : fixed,
+		      scale_width ? fixed : fb_cap,
+		      format, modifier, &probe_fb);
+
+	igt_plane_set_fb(plane, &probe_fb);
+	igt_plane_set_position(plane, 0, 0);
+	igt_plane_set_size(plane, dst_w, dst_h);
+
+	/* Baseline: the unscaled 1:1 source must be accepted. */
+	best = ALIGN(dst, align);
+	igt_fb_set_position(&probe_fb, plane, 0, 0);
+	igt_fb_set_size(&probe_fb, plane,
+			scale_width ? best : fixed,
+			scale_width ? fixed : best);
+	ret = igt_display_try_commit_atomic(display,
+					    DRM_MODE_ATOMIC_TEST_ONLY |
+					    DRM_MODE_ATOMIC_ALLOW_MODESET,
+					    NULL);
+	if (ret) {
+		igt_debug("Unscaled %dx%d source rejected (ret=%d)\n",
+			  scale_width ? best : fixed,
+			  scale_width ? fixed : best, ret);
+		igt_plane_set_fb(plane, NULL);
+		igt_remove_fb(display->drm_fd, &probe_fb);
+		return ret;
+	}
+
+	lo = best + align;
+	hi = fb_cap;
+	while (lo <= hi) {
+		int mid = ALIGN_DOWN(lo + (hi - lo) / 2, align);
+
+		igt_fb_set_position(&probe_fb, plane, 0, 0);
+		igt_fb_set_size(&probe_fb, plane,
+				scale_width ? mid : fixed,
+				scale_width ? fixed : mid);
+
+		ret = igt_display_try_commit_atomic(display,
+						    DRM_MODE_ATOMIC_TEST_ONLY |
+						    DRM_MODE_ATOMIC_ALLOW_MODESET,
+						    NULL);
+		if (ret == 0) {
+			best = mid;
+			lo = mid + align;
+		} else {
+			hi = mid - align;
+		}
+	}
+
+	igt_debug("Max downscale source %s for dst %dx%d: %d (fixed axis %d)\n",
+		  scale_width ? "width" : "height", dst_w, dst_h, best, fixed);
+
+	igt_plane_set_fb(plane, NULL);
+	igt_remove_fb(display->drm_fd, &probe_fb);
+
+	return best;
+}
+
 static uint32_t
 test_scaler_with_modifier_crtc(data_t *d,
 			       double sf_plane,
-- 
2.43.0

