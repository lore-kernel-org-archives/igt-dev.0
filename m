Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41495F483D3
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 16:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA16A10E495;
	Mon, 23 Mar 2026 16:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FTrO3mHb";
	dkim-atps=neutral
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA1A10E49D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 16:29:48 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-2ba895adfeaso407396eec.0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774283388; x=1774888188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rXcPvSTuM6ofqZX92NzFhP2wdoXKumpJZXtEaVrE1NQ=;
 b=FTrO3mHbNpbNwxZRA/GvrvSdfS2UFaYhPORs0D5YpQzX8qJuOavSdNAVE8O7Ucj0GA
 +fpsDbEs9REW6GOPFYJAXcFYLFjMxFhTGu63DpUqHBT5dZvVC29T2Z3FlQupREJQKHOl
 Pps6doEkuoMhT87JRJ0OIUQMHPP5ewQb4L2c+DSQx0vly2Z4AEgU8589XvpvFCPnP+7z
 evO8ypQiRuo73fFFmnBu9sykV0AJdWvcFH5TOyseVmt+r0r8UkoW3z/LgPimdHLjrwko
 5OFa6qmbGhsc9JW5q0/+RdZC/aKvPSMp1hMvex+gou254KNrptW5/7vnQDfD2A9ls5P+
 wLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774283388; x=1774888188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rXcPvSTuM6ofqZX92NzFhP2wdoXKumpJZXtEaVrE1NQ=;
 b=oL6k7WW5bonVIDEWNPavlRtZojIUKLpwn2UuuAZuAPfmPU+aKz9Iu714QZ3l2gxR03
 3Rb5P8q4T9YobzvZJLXTIpAY/yro3Qf/sklyuchc87Mkt0N6yQVeX2HzlpstX/kT7oBk
 nwesCLpv4bXUMpTmsuOcXvVtkBX/IUMDHUlAvvjD/eigA47VwoH2+dsOH0IBH0rmqLtd
 7ASjuN4FEohw3mTwEWzvOMIowTU1ZUZulVMRyPMXdZJx59OfOop5lPGB3Vhu+3x8C1rE
 /G2cEhOvyeKtO501X4vrt4iF0b1PqpnupkxIxZDqUbcBAJ1I/vZWnzAra1OA7WXTYgzN
 X3kg==
X-Gm-Message-State: AOJu0YzN6rLYJVrHf/7oEitmjhuuqe4p9APEWUbRl60cEuRHaZcIkRHQ
 asymRHj5mQgd6uZzQLHIpzfRJ4jFjhjABgni28T8SIZ5NokAMNvFFo5B9m4GQXl8
X-Gm-Gg: ATEYQzxwh8AUVdmHESEbkumyjvJzaxt0X8reCdNX24vOcR6BBF/KowkfxHrSr2Qbjfk
 HToo+eqrkZUfbZOIJNHir7i6IEJmnWhnACZOIYDdyG5Uam2OuvIktbtyl6Eqj9BrQnpAW6EK4yw
 iC04RJjPgMzYM+C7MdVXmNF6QZKiF9DNzqOMC1+67nzFkEAXJt/1WkdgsGFn6STVfau2ftI8XoV
 6mOXKmedFVI/FnpDIfgMiiYUW2IaT03Gqb7/gAj9Qs/ClkITAlciT3OD3XyyXq3j1GEcJln+w4v
 wSiCx9rQk+s3U9A3R1nywWX+eenw2nmF81Zts079GswMEibICZg6Ns0K/cT2RfeWpq8hxWi6vCO
 YNOL9RovuYNg6wAEetN5zw3wcqP2iAR8ej+bVGar7nZiE8rcJy+d+VTg1W+YOjqWpJcvuD0wpr6
 aRyJm8tcd4OWXYutSzkT8Olk/54JIe7QkfiM4O0APNiGUuAzU9c8h61QKtDOo=
X-Received: by 2002:a05:7300:d704:b0:2c1:27c:75cd with SMTP id
 5a478bee46e88-2c1096251b9mr5136925eec.13.1774283387608; 
 Mon, 23 Mar 2026 09:29:47 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c10b31bef1sm15936745eec.26.2026.03.23.09.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:29:47 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/8] lib/intel_batchbuffer: add intel_bb_create_with_gt
 function
Date: Mon, 23 Mar 2026 18:29:07 +0200
Message-ID: <20260323162911.1912755-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
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

add possibility to use gt id with batchbuffer when on xe

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c | 26 ++++++++++++++++++++++++++
 lib/intel_batchbuffer.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 802e771a4..cfafaecd0 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1162,6 +1162,32 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
+/**
+ * intel_bb_create_with_gt:
+ * @fd: drm fd - i915 or xe
+ * @gt: gt id
+ * @vm: for xe vm_id, unused for i915
+ * @size: size of the batchbuffer
+ *
+ * Creates bb with gt id passed in @gt
+ *
+ * Returns:
+ *
+ * Pointer the intel_bb, asserts on failure.
+ */
+struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm, uint16_t gt)
+{
+	bool is_i915 = is_i915_device(fd);
+	bool relocs = is_i915 && gem_has_relocations(fd);
+
+	return __intel_bb_create(fd, gt, vm, NULL, size,
+				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
+				 INTEL_ALLOCATOR_SIMPLE,
+				 ALLOC_STRATEGY_HIGH_TO_LOW,
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0),
+				 gt);
+}
+
 /**
  * intel_bb_create_with_context_in_region:
  * @fd: drm fd - i915 or xe
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 7049dd2d0..8d54c6590 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -324,6 +324,8 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 			     const intel_ctx_cfg_t *cfg, uint32_t size);
+struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm,
+					 uint16_t gt);
 struct intel_bb *
 intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
 				       const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t region);
-- 
2.43.0

