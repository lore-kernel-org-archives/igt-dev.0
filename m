Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C287E7E0BC
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 16:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE16E10E437;
	Mon,  9 Feb 2026 16:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eZhDIAEU";
	dkim-atps=neutral
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com
 [74.125.82.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C01010E437
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 16:32:42 +0000 (UTC)
Received: by mail-dy1-f194.google.com with SMTP id
 5a478bee46e88-2b86671f87eso948824eec.0
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Feb 2026 08:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770654761; x=1771259561; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uidwY+ItjIP3p2MgFzadCEq3egU62jiKI0BZ3Efc4ms=;
 b=eZhDIAEU6lhrYJ3lP/Uz11LmCLqE2CbrRYlB0H2dhGpK7wOOnU09BFD7s3DdYlTfPs
 xcsMDXxNhZj4cPH4G0EK/0tRuNlyL2hwQMhLhLlningNx4OjUM7LeGmhB4p0dxk22arn
 SboNuqJ37/bEAR+E2Y/5J6XYhE4qzX0KHw+0ypA6KgQJdnYC1QRq8/ZyiTc2G4gn7CQe
 mo9xDd/qQ4uQhoJ9svD3kI23U6JKtCGpG0AT5CJNGxHo+5sCNuaE4v6gYwgfGXwVR4Qg
 XdyBtRJ54AJdCOjYOGBV0BOsZ3aFobLHxhO0sAidqBoJMciLb6tEbaFf4pih7z1ixHr6
 Obgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770654761; x=1771259561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uidwY+ItjIP3p2MgFzadCEq3egU62jiKI0BZ3Efc4ms=;
 b=WpMqpOiJJsY66e+JeMrcOWaHlr6uO+93Mjg/Rc5sApBM5g1LvIVDzAmVqghoykxah8
 kML4wRtHBn9LUg7Dy6yZYxbO3vz9XwJNqnS2HKdMbcybhAHB6A4vIsyoTF4S/4aK4L7Q
 rWSisxGtYbuVmR6bH1KUjTNs9tIojL5WZUlFfkxuF9EUBYSpsHqZ5NcVvH7lTzIAwyrv
 2O3tiuVy9Wc2n3RsYUKYnaRXWB5fs88jIqKLgtQ+ICOX8inv3G4QhrOnRHjjiU1hAAQ9
 HPe05qdTT8CKEsnf+RCT9y/c0tC85xCGu0kMNWBR9y9kbwCtjF4eKK270nEkHSWl9tw/
 kSRg==
X-Gm-Message-State: AOJu0YyGF3EiVcYuCn4rZEtAMVes5pOU/E34gBUK8/ReAo1RrtXS6M1J
 8RcSJgJeOiUGRE6fOtzc4UniqtNwEdqDFxG+wlvnCWfgGexBRlZiwcAjV0I7eVb09i8=
X-Gm-Gg: AZuq6aL3hf9xavDODdgyvksrKP/L8mM/rOc8LvqK8New3uUNbq0adRzeH0YQhibwKFI
 z4gJAHhMy9o+BhOIbqu+weiRY/pM9noqBcV9LOY1ZPD5FbpfSmEfuneehSESerBaKOYYPO2UO/E
 2oIgJHs4XNLVT1cHTVRon6Ud+B7VK8WzxGvkKqRY5+0qI55RKiaqQY09cB0uDohxAxy4lt8uzyC
 JavYMN3dsw+jEQXlgFJYtbcsWh54l2RHoaDJ0Jh7LZBjVw45Dp4o1e7TOploDwQZG8gRkqdR801
 l2KXy+Nbp4eymKwhuOhaeqrVTa8KK636Hneg0ChbbX8LCiirmdoTCJ/LtW6bwQis/SM+nTygkxK
 3pXwtS5nylOZYFlB9eEDMJWPCsEKIAFZY3vYWLxknUzQ0ZCKc1qD8aoARgdq9QEUNg2Cu6fx5OK
 um75mciBrtP+VOTZ0OR9BYY8gghGrhZMm42V4OJPQcinbyxx1D
X-Received: by 2002:a05:693c:2c84:b0:2ba:7875:10c9 with SMTP id
 5a478bee46e88-2ba7875161bmr1102601eec.26.1770654761095; 
 Mon, 09 Feb 2026 08:32:41 -0800 (PST)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ba83a73485sm431441eec.4.2026.02.09.08.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:32:40 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/7] lib/intel_batchbuffer: move engine class selection
 to helper
Date: Mon,  9 Feb 2026 18:32:10 +0200
Message-ID: <20260209163213.1483598-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209163213.1483598-1-juhapekka.heikkila@gmail.com>
References: <20260209163213.1483598-1-juhapekka.heikkila@gmail.com>
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

move engine class selection to helper to avoid duplicate code

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c | 42 +++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index c12beed46..198adf85b 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2463,6 +2463,26 @@ static void update_offsets(struct intel_bb *ibb,
 	}
 }
 
+static unsigned short get_engine_class(int fd, uint64_t flags)
+{
+	switch (flags & I915_EXEC_RING_MASK) {
+	case I915_EXEC_DEFAULT:
+	case I915_EXEC_BLT:
+		return DRM_XE_ENGINE_CLASS_COPY;
+	case I915_EXEC_BSD:
+		return DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+	case I915_EXEC_RENDER:
+		if (xe_has_engine_class(fd, DRM_XE_ENGINE_CLASS_RENDER))
+			return DRM_XE_ENGINE_CLASS_RENDER;
+		else
+			return DRM_XE_ENGINE_CLASS_COMPUTE;
+	case I915_EXEC_VEBOX:
+		return DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+	default:
+		igt_assert_f(false, "Unknown engine: %x", (uint32_t)flags);
+	}
+}
+
 #define LINELEN 76
 
 /*
@@ -2505,26 +2525,8 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 		inst.engine_instance =
 			(flags & I915_EXEC_BSD_MASK) >> I915_EXEC_BSD_SHIFT;
 
-		switch (flags & I915_EXEC_RING_MASK) {
-		case I915_EXEC_DEFAULT:
-		case I915_EXEC_BLT:
-			inst.engine_class = DRM_XE_ENGINE_CLASS_COPY;
-			break;
-		case I915_EXEC_BSD:
-			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
-			break;
-		case I915_EXEC_RENDER:
-			if (xe_has_engine_class(ibb->fd, DRM_XE_ENGINE_CLASS_RENDER))
-				inst.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
-			else
-				inst.engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
-			break;
-		case I915_EXEC_VEBOX:
-			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
-			break;
-		default:
-			igt_assert_f(false, "Unknown engine: %x", (uint32_t) flags);
-		}
+		inst.engine_class = get_engine_class(ibb->fd, flags);
+
 		igt_debug("Run on %s\n", xe_engine_class_string(inst.engine_class));
 
 		if (ibb->engine_id)
-- 
2.43.0

