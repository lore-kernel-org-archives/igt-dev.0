Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB5E105F7A6
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 13:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB5810E041;
	Fri, 13 Mar 2026 13:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UloXhDak";
	dkim-atps=neutral
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937A910E06F
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 13:52:38 +0000 (UTC)
Received: by mail-dl1-f46.google.com with SMTP id
 a92af1059eb24-128d7db88b9so2649197c88.0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 06:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773409958; x=1774014758; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N5inc7nt828JmYVXFg8QMXKP/2DUVrqdfa6R9kcap4s=;
 b=UloXhDak50X4yFJQFdQvhO3AcFMC1vke5ZlPEqYGdICdxw0BDHqZiXyqugujDE2gzG
 ahlGZIQy73poesh9E9Z7gvnkuzmkjJtgnTBsnYhdnxRoHl15LYiyqlh21TDJEbUPjrwF
 LC2ZDSlMMhiufOsnynseSyjcq34rUZJ9KqTuzuSaBEifD+8/tjKMgxXYOguZ8wXU9bK4
 cob6maaQfIENj0jntmVMZuN6vFp9bOVIqjP2Ct0tyoIxzO/ovWnVaIHsUrLKYYUfYKCV
 MIlO8c8xBLYwUE2YbtUhjme0bygz3M9xY36fVN5lm6aLhdMQa2Zdhtqb/O0skcVlgXl+
 VpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773409958; x=1774014758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N5inc7nt828JmYVXFg8QMXKP/2DUVrqdfa6R9kcap4s=;
 b=cCh9rGJo3Ct5UmlJXU8/1d9V1PUI1eNy2cW2R29jrrKh9WfTX+ZhZxNnj3nOdqEf+K
 jT0an0S1eOF9XWowxuAzdvSQIPQUn0PDxpTnzkTbteGZWTgY71hPsNxTzKUt8fqx+mQX
 gv0P/Cd9l265EP94+o5Fd1g/t9UYpJKjDAI1FYwvDik1YlqbNcGPJaNmpuoAsaKC+rHh
 IXKdrUKfjwj9Ulw8Uscn7rCWjTK3X1XoPbxexgmvCoRKYilSpCYmRu8ll6OminiybpGE
 Qup7sOnf7pI+4j/dy4JA3B0xHzMFNObkjv5/q1kDlLDceWsHeoIa00tpM1x36VGuHntN
 8Nsg==
X-Gm-Message-State: AOJu0Yxv4BYKGQP5VowFiNcN9lsZpiBkaQ0gsIrY4GW9NHAC+26GQjbg
 VoMt/nHK2LuBljmcCdoqCdz+Eznz/4UQlEkq/WIt6l6HeWMuCQTtUFTvSeNAn3Ro
X-Gm-Gg: ATEYQzzfpo3jgwjMQVk2piVyp+ciCSpUFJ+14gAMBrUCItFIT5UQdkZOMKgbiXHZAaq
 kC4pyaUnuJl7xBJfjinm+sdGkniYi01deQCm+o650V6zfefBdsQqXJ2kgKW8BBgDmMRgQ67anzD
 lXuoqDHwZ+FlSZHeF2if1OZaOYqatZBslwIUvZUx/JScvb0qxxgPPF+iIdqm5h8Fo/SyfWjJxSI
 Re//KZDgjD11ujS6BoH9/Z61fA/RiTpRSo/q8r5G+3eEbDQ6gOe35h0NicOb1RUemE7ZnKxQArV
 IbSiFsaAHdQUIH95OjUwhdPuDDrA5ZorOkCdalkKVGk1Py9F8EK/MBxN+L5dB+odnGVWR2MXd/d
 hDYI+x74zs5rO0R4Om5XaiwROBRQAFXeoJDGMUhu86Du+RMm5tuAWEy3eqrJuSMI3Bec8MEyTXs
 GdLY7kRkkYgN3/IR/FTDJ1tvKesI8xOyKJGpg8JOZYsh9FmFW+D5AX/dixO2I=
X-Received: by 2002:a05:7022:69a:b0:122:a2:ffcd with SMTP id
 a92af1059eb24-128f3db2adfmr1400968c88.23.1773409957444; 
 Fri, 13 Mar 2026 06:52:37 -0700 (PDT)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab555c44sm3014184eec.25.2026.03.13.06.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:52:37 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/8] lib/intel_batchbuffer: add intel_bb_create_with_gt
 function
Date: Fri, 13 Mar 2026 15:51:59 +0200
Message-ID: <20260313135203.1782240-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
References: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
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
index 2e1c45335..d8e5816ee 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1160,6 +1160,32 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
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

