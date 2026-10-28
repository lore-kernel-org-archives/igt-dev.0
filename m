Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD4D606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ruQcAkYr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B06E10FD23;
	Wed, 28 Oct 2026 14:57:47 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780AD10FCFF
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 14:53:14 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-8a070781f63so571110b3a.1
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793199194; x=1793803994; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=drF7CZVEPdFPmDemKdPikT9LhzBa5XEsIb9GQL3RQ1M=;
 b=ruQcAkYrk98Lkdht9zToObC1H+H3zbYoqvr1dTxm+kxIzOExUUQjVcqKHF9YQitjCx
 UZ9jZeqEe/Ey7phzJi8tDBoSDnRqa9SRd30kOczhtcXwkGw2iJ9d51oNHtCw+a5H/FuM
 +KNm7P5/llgINRNr58PfZhFs2h9NXicQUBDUkv5WeEjw271Ge6RhY2yF6CogcjJvqQwk
 IkUQc+rfqOO7OjomyrjuiYyuihqZfqxAWf9ZeXJz1OMofUQR67PZeHsrr1a5vwMcB+Nn
 wi16KszV4ViPzbZ5pSDTGZQSj+OV7ZKycvj2/bqCaVRwQmerYmPpdgZh6AVrHum9fLCX
 m/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793199194; x=1793803994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=drF7CZVEPdFPmDemKdPikT9LhzBa5XEsIb9GQL3RQ1M=;
 b=0lTV2NMX8KpYr/3l8OJwaT/E90KkGm4M06/heL/ZySDJbghYIv4hQ1VKp9ACLRjXMG
 vwCUQmxTe15byryeSC70fdyJg/8uFSaQKTgOZ4y3rmG/S0h4kXjT6Eyx5AnTF81ENZFF
 hbWMd90ojl4efIUSA5/zfN4bZKEn8+bctFk//6sN2siekofB9ANfPhl8JYo9w9D1e2bI
 E92On5TZEaSW5WfrwS+2yVc/pTM6FImiHPWn0Vm2Hnnrn5XnWj4PeOE2uHszY2cPrRip
 /jYzw6v74XLRw6TbiSqBsSkG3HBA+pCAonlsYq4YdS+5jVbEYjpICY5fryVFGeq7V0N5
 zoAg==
X-Gm-Message-State: AFq9FYL7cU4lBObXwIwjRp9jra+XE6n7cp9k6IPjew8iLyZ2LrDeFRPV
 MAvBSKlxLthP6gPIXpumyHW/NpuS4mbvJI60yLw1vvyt+ELgiikxFgyoWXF8ZuhAt7o=
X-Gm-Gg: AYBFou04HRM3NAwfI2ExqRoGSXlH/4HBr+oLy60n5gVJDsQ6MCS+vkCAhV3FchjAOlM
 IsQQ1SYUQnvwseMdMthNn74Oj9aJqAE5K8LWghXTJ+N97KyShEcnUy8LbdIOSr0xojdvIugA6EC
 e77Fy/ZlD9uuQcYJbfrXeMyfP1onJf/qt8p/iXB6wkD7MAsdb5swvJr7gK/3VOwPUQF483y4Qcv
 3eDBOSbf0NJwd0ULRZgAkzL6f9J+kHVR/ksdK9oLZwriWE0+vC3189bFvdOfdZc4gn+vm9ugPMk
 934/zSnqUmQCLkLwEG2CjsNn9s2LlJ93coddtOzHSqKrBFnz/rFwRLcno8np/eZQnRYrnp3Ne43
 OQlYdqQITUgVwlnNluT7NJT+J0npp1b8SruaGHP4nqYO/E0ZZJiFFduuo4E+TxUuFlO/gM9eLZy
 +nnfVrB7pp0xTVPyVk5OqG+Wj9eXIHGD0FdHPB9046dgED5vPLibg5VcHf7F5ErfXX+2c/+l91l
 8iX7j7KASdclHfgorGmUZgaZVJ2L4VDGSMadEQlUUb++0mcAexNwtvyFjRN36R38R9vDA+ynChb
 69q+3lUzh67FJyDrQRQdOIkzH+UV1Ohv72oVCZElPda92eWSHHd/jzYj2+lV3T7kiQlvmUNSuLP
 92kycD8IYj4k=
X-Received: by 2002:a05:6a00:1490:b0:87c:e6aa:30ec with SMTP id
 d2e1a72fcca58-8a6e9352232mr1943021b3a.49.1793199193945; 
 Wed, 28 Oct 2026 07:53:13 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8a6a662da4fsm1335750b3a.27.2026.10.28.07.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 07:53:13 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 09/10] tests/kms_plane_scaling: scale overlay opposite
 to primary in max-crc
Date: Wed, 28 Oct 2026 16:52:01 +0200
Message-ID: <20261028145202.3128915-9-juhapekka.heikkila@gmail.com>
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

The two plane step of the max-crc tests scales primary and overlay in
the same direction. Also cover the case where the two planes are scaled
in opposite directions at the same time: keep the primary at its found
limit and scale the overlay by a fixed 2x the other way, i.e. upscale it
in the downscale subtests and downscale it in the upscale subtests. The
result is compared against both planes unscaled. If the kernel rejects
the combination it is logged and skipped.

For upscaling the framebuffer is now twice the destination size so the
overlay's 2x downscale is a crop of the same framebuffer.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index dfd19b1f5..ef99544a8 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -885,8 +885,9 @@ static int scale_src_cap(data_t *d, enum scale_dir dir, bool src_width,
 	drmModeRes *res;
 	int cap;
 
+	/* Room for the overlay's opposite-direction 2x downscale. */
 	if (dir == SCALE_UP)
-		return ALIGN(dst_scaled, align);
+		return ALIGN(2 * dst_scaled, align);
 
 	res = drmModeGetResources(d->drm_fd);
 	igt_assert(res);
@@ -1193,7 +1194,7 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 		/* The overlay band sits right next to the primary band. */
 		int ox = a->scale_width ? 0 : a->dst_w;
 		int oy = a->scale_width ? a->dst_h : 0;
-		int ovl_limit;
+		int ovl_limit, opp;
 
 		if (!a->tested)
 			continue;
@@ -1259,6 +1260,25 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 				 a->name, scale_dir_name(dir));
 		}
 
+		/* Overlay scaled 2x the other way, primary at its limit. */
+		opp = ALIGN(dir == SCALE_DOWN ? a->dst_scaled / 2 :
+						a->dst_scaled * 2, a->align);
+		scale_plane_set(plane, a, rot, a->limit, 0, 0);
+		scale_plane_set(overlay, a, rot, opp, ox, oy);
+		if (scale_try_commit(display)) {
+			igt_display_commit2(display, COMMIT_ATOMIC);
+			igt_pipe_crc_collect_crc(pipe_crc, &crc);
+			scale_crc_check(&both_ref_crc, &crc, a->name,
+					"primary+overlay opposite", failures,
+					sizeof(failures));
+		} else {
+			igt_info("Primary %s %s at its limit with overlay "
+				 "2x %s rejected\n", a->name,
+				 scale_dir_name(dir),
+				 scale_dir_name(dir == SCALE_DOWN ?
+						SCALE_UP : SCALE_DOWN));
+		}
+
 		igt_plane_set_fb(overlay, NULL);
 	}
 
-- 
2.43.0

