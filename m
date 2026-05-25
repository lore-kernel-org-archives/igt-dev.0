Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46429CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 16:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A3010E3BA;
	Mon, 25 May 2026 16:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FYOaNejR";
	dkim-atps=neutral
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861D510E3B7
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 16:39:39 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-366139223e4so5882193a91.0
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779727179; x=1780331979; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JmWRmhCe2/omQF1GVOpN06z/wqZMRxu4zWJY6F/P/ns=;
 b=FYOaNejRCMC9KP9PXkEsn4JV/+ftJj96KRg1FIZLTqzvaTJtDKeRpGlxWCm5zrK0gu
 G9bneMRwpTtE9bM9LQgJFnkvz/ZuQIbgfbB5Qg+3aS5/t5OBn2Q2M7msaqQOQRsuZJIh
 YlgoDQo8Zg2WIa/qmf2Frsgu9Ivo40SHGv1cv/+vC002yA+9JZsh3yEU9FyPfKCeMgfL
 SOyFQgw+uArnhBEl7g3ryITiVsC+9+He3RSzRaXLwDH/b7mevKg5dRPla5ugphOCP4LT
 ZUJfUaEcg7e1jDw2vliFFjHDIwjRzVYR4CCdRbthtJdRq8ly7Ak6fZ/aqRBa02gs1AO+
 8lIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779727179; x=1780331979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JmWRmhCe2/omQF1GVOpN06z/wqZMRxu4zWJY6F/P/ns=;
 b=FPhUmoVOdawn2cFpkbZ37vTqHBPA3q05QpSkmkCcRN4uAL7ILbYJh7j3ZAzRTIFS01
 krH/fZLaqA1jeqV0eoKXcj/NWe27+QVTzKVNVfb6qfn/F7EFQ8tT/aoFt1qtVvUHBd1f
 g3xabnuBsoqyYq4GKeWWXhfmhrDc05vsMafn0KAQlSPJnLXiAFyZ4lAHduq6j5B6QiDU
 6NJl5ZA0OF7NcD9tzpNv7B4XVzUU4IIdMO1B+BqhQ1Ih7n6KKISY7E/DYO+ksCZA5f49
 dg27uNIAxykFI8idvRPZta71AYj4j6DkVjTvAsFYFEl0cbHTJQ04B1x/mQCvP3mVf+c8
 5/Rg==
X-Gm-Message-State: AOJu0YzgxGGtstWlLNsyh1jtXLVHvmgUoeniW/+0gkBAoCz+jhjxeBme
 BFxYySLJEtowU9j8ex1xdvJELZfDBCMoimmFz8wincWD8fsW0Fc9kk35GYXAtzkM
X-Gm-Gg: Acq92OHVB0BIOlKKlxtjFA70ChMELJYBjSmyES+Ng8PrMkoORHylvoKuLv7QJvwEWfE
 mn200G13wk5pcYuQTsJxPYr6pF6aCXm8OXDf+sDMPbu72b79JYG6PYL4XOOsXdkPxUYKxdv5X9D
 9VWedciG2CCzwIYfoxdNsp1eyls1eNYcBA3+cfHFwS0WkSlNx/wRVs0JDIhaqiolWmoxlKBcoNg
 P0Ol0tjztsuUzQhXtyTyJamsjTN2+bjZj3+uk8uMHE117z4H0u56+T2GiMAZQOtmBhKvHJOF2En
 rB5B2Dc/uKktHr1i3LVSu9vAJD5BPTLNusKtRcUqZr6KbhGzLyAv8OMVYiEY/tXnk2dmhIhUMdq
 FdbNmvI4fp/fihfQJzN5dpREpS4/A73w3fseoWgPk70Yl7LcCyxCZdC5wq4h4r9CjEZsLCj2jza
 /XvJNgUSkWK2tiQjSLK5Yk6RKGWGklbEP6MnKQxLtD56ItEWfLuYLaSt15D6CFBg==
X-Received: by 2002:a17:90b:4ac4:b0:35f:b572:ece9 with SMTP id
 98e67ed59e1d1-36a6741dd7dmr14059814a91.5.1779727179035; 
 Mon, 25 May 2026 09:39:39 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c852054b82fsm8804997a12.19.2026.05.25.09.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 09:39:38 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 9/9] tests/intel/kms_flip_scaled_crc: add 4tiled p010 to
 4tiled p016 test
Date: Mon, 25 May 2026 19:38:50 +0300
Message-ID: <20260525163850.3493602-10-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
References: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
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

add test for flipping between p0xx formats, this is targeted
to utilize vebox engine while also doing flipping test.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_flip_scaled_crc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 944dfeede..a25781fb2 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -135,6 +135,9 @@
  *
  * SUBTEST: flip-P016-linear-to-P016-linear-reflect-x
  * Description: Flip from P016 non scaled fb to P016 non scaled x mirrored fb
+ *
+ * SUBTEST: flip-P010-4tile-to-P016-4tile
+ * Description: Flip from P010 non scaled fb to P016 non scaled
  */
 
 IGT_TEST_DESCRIPTION("Test flipping between scaled/nonscaled framebuffers");
@@ -664,6 +667,16 @@ const struct {
 		IGT_ROTATION_0,
 		IGT_ROTATION_0 | IGT_REFLECT_X,
 	},
+	{
+		"flip-P010-4tile-to-P016-4tile",
+		"Flip from P010 non scaled fb to P016 non scaled",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_P010,
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_P016,
+		1.0,
+		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
+	},
 };
 
 static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
-- 
2.43.0

