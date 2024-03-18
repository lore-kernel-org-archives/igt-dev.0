Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50FFC54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 11:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C7F10EAA7;
	Mon, 18 Mar 2024 11:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FmSy6hsX";
	dkim-atps=neutral
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9197A10EAA7
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 11:48:19 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-513a08f2263so4403140e87.3
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 04:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710762497; x=1711367297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a6nTj2jcDmbQkluxGKYG0h6+S3lQE7QScThbP1TwHdU=;
 b=FmSy6hsXYWlQ3gG3zJ+t/HFQXPZT+4v7kVw1wf814MPKC4LIUN96fnVsXTPCMdbLF7
 H9V3Vi6yCezvxGxfpYnANwXzZx7uRBgruDMV5q29M5niuT960TFVFN7ZqLbnU02W7E15
 3OcpfzyEoXoNaSt+Bpk+Ur9Li9P9k8xGGnijzI9LzFKNaLqljwTKL+HxGb9Bi/mfwpYk
 cpaLZ7OWDItbCS8n3o2GM+Dl0JtWJXyx8xPQF1FKpESyYYqyvD9mL+DyaiTyhx732QJR
 YHngBFiWuLwOGzvb5yY2riUKlRoJ8JtN6aXaMiYq7iEt9wdDGU0zwPZN0urAhjzkNd81
 FQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710762497; x=1711367297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a6nTj2jcDmbQkluxGKYG0h6+S3lQE7QScThbP1TwHdU=;
 b=uYDTbpSDbdqeLW26fbxvxEjfAAaJ5DCFelIY5TK/3l6vddMTLKGzMOqfU0eBHGdOpG
 D4xpTTmQzct61wGNxv1KvdECw+1UYjmoRBcumliyh1e1/FUs7gOSKEhpm8j33bnWHM4u
 xeulxK37Gs+Y9I5qZQKywpWBxUAa0zN1IOYMyPHBxfGRyqYYFCDd9jDk3ExTTtnCcYe1
 VDEDswLhdJ9/2f+dYXXI7F0UG5w8X4LFcMTg83y+Gs8/L9hfLsPrDnljKSJDxU9jkdqt
 REITroJmoSIlQUU2zHzNojFjlFxr/YoW7ffFZ0ou94Q/8TDotGAJz9Z0Wi571zhUC6my
 4q6g==
X-Gm-Message-State: AOJu0YzGXDvgGSWkJKxPHPigTTnHCGMlVdI1ViNrg1dDnRNOa3Jzsf7e
 mJr7K9cRW+VthEbVRIiy2GobJQKE6vcOCwNNyNkEoNQG2BIQ69BGnN3kLIcrUI8=
X-Google-Smtp-Source: AGHT+IH/ovBYBG4uE2prBaS/Ia1ZE6w7Kda4U5/kKmqB8oz1/P9ZGz+K9VCbP7zlDYhKA7xhj1Wj3w==
X-Received: by 2002:ac2:58c7:0:b0:513:c962:71a1 with SMTP id
 u7-20020ac258c7000000b00513c96271a1mr8038807lfo.50.1710762497109; 
 Mon, 18 Mar 2024 04:48:17 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 i1-20020ac25b41000000b0051319e142b9sm1573516lfp.9.2024.03.18.04.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 04:48:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] tests/intel/kms_ccs: add access to control surface on
 xe2
Date: Mon, 18 Mar 2024 13:47:58 +0200
Message-Id: <20240318114758.108006-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On random ccs test randomize also control surface content
and on crc tests add check ccs image is compressed.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_ccs.c | 77 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 4f8e30791..96beb2de1 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -365,6 +365,77 @@ static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const float *cc_color
 	}
 }
 
+static void access_flat_ccs_surface(struct igt_fb *fb, bool verify_compression)
+{
+	uint64_t bb_size, ccssize = fb->size / CCS_RATIO(fb->fd);
+	uint64_t ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(fb->fd));
+	struct blt_ctrl_surf_copy_data surf = {};
+	uint32_t sysmem = system_memory(fb->fd);
+	uint32_t bb1, ccs, *ccsmap;
+	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
+	uint8_t uc_mocs = intel_get_uc_mocs_index(fb->fd);
+	uint8_t comp_pat_index = intel_get_pat_idx_wt(fb->fd);
+	uint32_t region = (AT_LEAST_GEN(intel_get_drm_devid(fb->fd), 20) &
+						xe_has_vram(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;
+
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+
+	uint64_t surf_ahnd;
+	uint32_t vm, exec_queue;
+	intel_ctx_t *surf_ctx;
+
+	vm = xe_vm_create(fb->fd, 0, 0);
+	exec_queue = xe_exec_queue_create(fb->fd, vm, &inst, 0);
+	surf_ctx = intel_ctx_xe(fb->fd, vm, exec_queue, 0, 0, 0);
+	surf_ahnd = intel_allocator_open(fb->fd, surf_ctx->vm,
+						INTEL_ALLOCATOR_RELOC);
+
+	ccs = xe_bo_create_caching(fb->fd, 0, ccs_bo_size, sysmem, 0, cpu_caching);
+
+	blt_ctrl_surf_copy_init(fb->fd, &surf);
+	blt_set_ctrl_surf_object(&surf.src, fb->gem_handle, region, fb->size,
+				 uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
+	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
+				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
+
+	bb_size = xe_bb_size(fb->fd, SZ_4K);
+	bb1 = xe_bo_create(fb->fd, 0, bb_size, sysmem, 0);
+	blt_set_batch(&surf.bb, bb1, bb_size, sysmem);
+	blt_ctrl_surf_copy(fb->fd, surf_ctx, NULL, surf_ahnd, &surf);
+	intel_ctx_xe_sync(surf_ctx, true);
+
+	ccsmap = xe_bo_map(fb->fd, ccs, surf.dst.size);
+
+	if (verify_compression) {
+		for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++) {
+			if (ccsmap[i] != 0)
+				goto ccs_vefiried;
+		}
+		igt_assert_f(false, "framebuffer was not compressed!\n");
+	} else {
+		for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++)
+			ccsmap[i] = rand();
+	}
+
+	blt_set_ctrl_surf_object(&surf.src, ccs, sysmem, ccssize,
+				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
+	blt_set_ctrl_surf_object(&surf.dst, fb->gem_handle, region, fb->size,
+				 uc_mocs, comp_pat_index, INDIRECT_ACCESS);
+	blt_ctrl_surf_copy(fb->fd, surf_ctx, NULL, surf_ahnd, &surf);
+	intel_ctx_xe_sync(surf_ctx, true);
+
+ccs_vefiried:
+	munmap(ccsmap, ccssize);
+	gem_close(fb->fd, ccs);
+	gem_close(fb->fd, bb1);
+	xe_exec_queue_destroy(fb->fd, exec_queue);
+	xe_vm_destroy(fb->fd, vm);
+	free(surf_ctx);
+	put_ahnd(surf_ahnd);
+}
+
 static void fill_fb_random(int drm_fd, igt_fb_t *fb)
 {
 	void *map;
@@ -382,6 +453,10 @@ static void fill_fb_random(int drm_fd, igt_fb_t *fb)
 		p[i] = rand();
 
 	igt_assert(gem_munmap(map, fb->size) == 0);
+
+	/* randomize also ccs surface on Xe2 */
+	if (AT_LEAST_GEN(intel_get_drm_devid(drm_fd), 20))
+		access_flat_ccs_surface(fb, false);
 }
 
 static void test_bad_ccs_plane(data_t *data, int width, int height, int ccs_plane,
@@ -640,6 +715,8 @@ static void xe2_ccs_blit(data_t *data, struct igt_fb *fb, struct igt_fb *temp_fb
 	xe_exec_queue_destroy(dst_fb->fd, exec_queue);
 	xe_vm_destroy(dst_fb->fd, vm);
 	free(xe_ctx);
+
+	access_flat_ccs_surface(fb, true);
 }
 
 static void generate_fb(data_t *data, struct igt_fb *fb,
-- 
2.25.1

