Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13273EDF173
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 15:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E8510E085;
	Fri, 13 Feb 2026 15:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gdySN3r6";
	dkim-atps=neutral
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A79E10E085
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 15:16:51 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2ab232cc803so5043165ad.3
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 07:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770995811; x=1771600611; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJIBPedqu15VlpN0OxwL4Z6gEbupWvTpvDCdcc1ut1Q=;
 b=gdySN3r6wEtEPTM/PltS7FfvswsiUk7ATdNHY6Q8UGjEUnHbebdnRKZLl9k0suHaJc
 g+331YhmjWysskkXVLh4PNlQFelhKsDtR/ew/ZiA62UBKMeswvJSaU8hvbqNJNSsCbgi
 R8M2ED2r4D6gohjX23Zz0oUpabftdaiSQrpqdjZsxf9i4St0JIhd3Z1PiJ3/+ECdo/tr
 JKTsvXmg7FnCaxn9mQZvz3OvcQ4xehvurLgGbBl3fPzGYm/A5pfd2tDzXbDItqRKpsS3
 aRod3LOx4pmz2BiLjFwli/bIv5I4fZyCSQIYtk/y0wMrlTmFBewcxlzToRVmqLx7FhaR
 ke9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770995811; x=1771600611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mJIBPedqu15VlpN0OxwL4Z6gEbupWvTpvDCdcc1ut1Q=;
 b=p4IMTg7jZ6SzWdRyBQ2SKul950zT09jVw8bQQZQytvIMPFcJzHIYp5zwqqBJMuF6ne
 Z9Lh5K0SEwtB+qlfa1DD961XSHsowW4RLLk9pIVSRo/WAxe2u3O4xNp8yrNswNiBbXNq
 PelhztHX1pbBpbDtgoY/MBbm+Aro3qpk1Mr8rNrdW21X+b6QDQCC/AsyghChOiymD35z
 Hn5UVdR4yeNWrYFBqQws18fqGZxqsj5tuChp+Fk2SndEUNG88v1kLY4QHRvqWKVgekR8
 VdTsrKClZartu875cVpXcz6bA9bzX0lkUhqgXPz6qyVOMlU2ZEpmbHL99t7n3Ciras4E
 wC4w==
X-Gm-Message-State: AOJu0YztIkgbkFGwmsVedXmVWALQgZT4ZWkBOA9W2fDDFBhH93Pf1Wyf
 BTHk5XklvRmfsL7pH5iApjNO8fO5AbrbIqMNYr9fOIq6p6YolkDoRfJXV1L8mB1x
X-Gm-Gg: AZuq6aLpBCDH6G486ql6hajeSULn8h58tJlo09k3ZnF9d+R6+V9n/EtDhFZn7w83xPL
 2nSydQFEhi8ByImz3zswtKvt164WptOq1LqvDQezAyqpger4sPcvSgBuj3mDM+S/DmvMWRpNQDt
 WOlGMtsaIbc8id8a+oINIUNwVl+kDSs5ZsbNFE9/JxRYzDLqzy1JrD8EWG6LDBKvusO2dszuem4
 hLCnjPqshmGhfv9tP4FZCQ4cQRiHOROOt+nCNPyJvCB0pT8Y4QpiCiVaI/RDhW1b+gYKpOHdaDS
 WZ80laik/bQuqfVu/K9/YedK7Ui5BGSg3rc5ppEFEpb/Yr4VH1E8lWw2wGGKleT2ZLZTKQiT/Wo
 9fuluOX+MTf8UxP89hyMTG5DPHF9Gi9lDJitrczpTpBeZZeWvt6bo6GqYCxKT3ZoUoRjBvX3yVw
 YcnUPWDcZWpo2AiIoxFeYa6jnZPctkw7o9vl/ffHoTf4eOlm/ev8SbByfhavCCFHbOetk5nrMb
X-Received: by 2002:a17:902:d4d1:b0:2aa:d647:c312 with SMTP id
 d9443c01a7336-2ab506008e0mr21480505ad.61.1770995810581; 
 Fri, 13 Feb 2026 07:16:50 -0800 (PST)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab29965031sm120659915ad.46.2026.02.13.07.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 07:16:50 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/7] lib/intel_batchbuffer: add intel_bb_create_with_gt
 function
Date: Fri, 13 Feb 2026 17:16:17 +0200
Message-ID: <20260213151621.1552677-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
References: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
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

add possibility to use gt id with batchbuffer  when on xe

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c | 25 +++++++++++++++++++++++++
 lib/intel_batchbuffer.h |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 3b25a385b..c12beed46 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1158,6 +1158,31 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
 }
 
+/**
+ * intel_bb_create_with_gt:
+ * @fd: drm fd - i915 or xe
+ * @gt: for i915 context id, for xe engine id
+ * @vm: for xe vm_id, unused for i915
+ * @size: size of the batchbuffer
+ *
+ * Creates bb with engine id passed in @gt
+ *
+ * Returns:
+ *
+ * Pointer the intel_bb, asserts on failure.
+ */
+struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm, int gt)
+{
+	bool is_i915 = is_i915_device(fd);
+	bool relocs = is_i915 && gem_has_relocations(fd);
+
+	return __intel_bb_create(fd, gt, vm, NULL, size,
+				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
+				 INTEL_ALLOCATOR_SIMPLE,
+				 ALLOC_STRATEGY_HIGH_TO_LOW,
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, gt));
+}
+
 /**
  * intel_bb_create_with_context_in_region:
  * @fd: drm fd - i915 or xe
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index d0a7c8dc7..ffe09c9ac 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -323,6 +323,9 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 			     const intel_ctx_cfg_t *cfg, uint32_t size);
+struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm,
+					 int gt);
+
 struct intel_bb *
 intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
 				       const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t region);
-- 
2.43.0

