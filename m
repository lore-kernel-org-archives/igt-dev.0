Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC82EA3F22
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C54C10E5CB;
	Tue, 10 Feb 2026 16:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DIEKu8XW";
	dkim-atps=neutral
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C84410E5CB
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:10:18 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2b86d39cd50so3284280eec.0
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 08:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770739818; x=1771344618; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJIBPedqu15VlpN0OxwL4Z6gEbupWvTpvDCdcc1ut1Q=;
 b=DIEKu8XWOYfez5kzeoZXNuOpAIN/mEKErkCoLmi7eQb6fX3/4238AHfnxVXn2nbMoH
 9RrEAoNfJJ9Zish9qMgHAkdzzcIPd6pjxqWDPEbtOAm1y735rS1hncd+OFXcHTqiah7o
 8FXtLzdD7o1dnIFkT53eCBTH3/5ru5v7ET06gBIlhyK2cQRQrEi12JB06arNwnCit/we
 W0HdzkCpLwuFSty0R47aerRhVMjzC4kvywBk8UUEZuAmOxmo2NhjJxsjLPSOg6aaEQXb
 INePhYMUYta7UXt8mAHD2yUBfGLmgq5fRRWcBf0dCG+xbbIVZz0BSa+l/5WWi5RrCu9w
 0InQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770739818; x=1771344618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mJIBPedqu15VlpN0OxwL4Z6gEbupWvTpvDCdcc1ut1Q=;
 b=eiJmDcZDQdkgfYdPtxXu5hd2r5RVHfT6prk+2C4SbL8fV9Ce2J4xgPQ6fvGIuXAum9
 NNKP+McmhknasQI614QtDLjkm2bODYV+yuSGCe4sw8DD/HzIfc1PSZxgXxsJp3pn2lqm
 N1J5Vc5J8v85m9gIqK5TygLHEpclB60f+g5iHBYlJfqoSJBE1zImHfYfcsCF582BUR4l
 ZysbuSnV0hOaeZ8qApOSG0TEaaskqoQS8gAkSOPqdwn25XDIFUQGqBe5Ly7os/Mjwo5z
 RLuE8asBc+mYmph8DuVGCKO1ileooiGTnyCNcp0U14LbbyK7d2yTbaTsVgv62mJcGXYi
 AgGQ==
X-Gm-Message-State: AOJu0Ywi7djOJFyObpqP6ZsXBvVkbHqnnX9PLOoLnUGWsTAXEw5qKymc
 anrsx3cR1QKSbb93BXUR2Lij5sscriWe/kJ0VOnowvz1dCKdS7zT8vtw/hGONEjK
X-Gm-Gg: AZuq6aIAdKc4iSNKs7duoDv6fVt51idKon5en8j3o41JfyIUwTm382kZQrTCQAF+wYE
 JeLM1qqYhjVQ9Gw5pkQyGYBrctrCXYuFOZcVPlZPYHJop1p+UOGWxtE6AMgMNr3VgXDXektz2UV
 RBawHTgKX9/x1xiCey3dUu7iPOMvxfpW7jV6DY6ZWWACBXx03Ia3ngwsJj4gOIiJn2PENAL6bwr
 2g+aOtQ7IqNYTIVZPX8IRrMWBTaxqas01Z/xpTPCuxjnYY+870GCYLzOBxMBHVlt04XVX84gDHp
 7H7TWpS6mOt1YhlDiVCpQOG464jYhW9x6xyJE/WS+Skd9XEBQGJI2qgcDDocF9QVY5Terll0yp+
 yrTc+srRo+ctnGeeZaF3UBK7j4BvZLcYtlHjCk4KVdxKBG905ggZMf1Xm6tz5gP1Un9+p2AWhec
 1q1gQ4n8AT1NEdsBRkB3qQ9XkgMPyGgWCI15sypIL1FF9QLj+QUgy2VbT3j8h0
X-Received: by 2002:a05:7300:8c2c:b0:2b7:1dbc:c243 with SMTP id
 5a478bee46e88-2b8563d94f7mr6313875eec.8.1770739817442; 
 Tue, 10 Feb 2026 08:10:17 -0800 (PST)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ba6fdb85c7sm4605846eec.5.2026.02.10.08.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 08:10:17 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/7] lib/intel_batchbuffer: add intel_bb_create_with_gt
 function
Date: Tue, 10 Feb 2026 18:09:37 +0200
Message-ID: <20260210160942.2219370-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
References: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
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

