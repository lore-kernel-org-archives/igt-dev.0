Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A93606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M8EUnbur
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B3410E2BF;
	Mon, 16 Nov 2026 05:30:29 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A90210E0F8
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 22:29:07 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5364605e74bso17048131cf.3
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 14:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794695346; x=1795300146;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cy7Q0Xrhv7OQpUPROJ1Wjj4AI4y1ERrfUY0Ynb/2VIc=;
 b=M8EUnburfDt32wrD6lydVLiQP87oMxMOmgCXRpD9zr6RkIcaJcbIuhmPHrVD0/xjWm
 0UNEFawkuTLrq63bG+eEg9hWHhh4J7bgrd0Jct81SwrF/5RqPigGqmYhPWJO+YfwlmSb
 azPR6UqnL9cPvuOWPRn1b2DtKSOxx9C5NMsGuKJBAltt3LnwqGIO4Gd4gtBHmiGisty/
 t4/COxdz209LK2LCsLkOCLW45O0FVb+0Os+0HqtY4fqD/g/f7HcvReWvSQe2S55BBUtW
 YraCDiPNWQQ6/uI6umxli3qz9twTFCsbHfHt7zNzQarMO0PGWqskAwnweZ7nGLUl+QbA
 y+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794695346; x=1795300146;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cy7Q0Xrhv7OQpUPROJ1Wjj4AI4y1ERrfUY0Ynb/2VIc=;
 b=gmCh3meUIcmTVQy4pZSXLF/BQM1DrS39Y9vfHfrghbMPyUm0OCgoU49hBv0F3OdUc7
 Lk1wGBXsKKbAfgoXYksS/HiavujsfZ+U0WSIWw7UFZui67lqj7gqx6MqWQXG4rpYtmuY
 glaqYFicO3UbfGE1Scdg/HXWhmWJ34ymqBnkhMD24hxY94Phpl2Bm5TSMFAxy5dETT+0
 8CkI38kQmJa6FNH/Lo7nq6tEV+I9D3OvoCLWfmFu8dYbKkClWIACeexlxmyYT6U7AWpU
 LZ30k5wYsIgSMaiXwPlr2DR3IXySxReTSz7uldR6l0QSToXVQU0aKiy0KZKOfYA0r1n+
 +3rg==
X-Gm-Message-State: APuU4Z+MSPQtYzuo7jTmhORxi64HTHgEJvQtnFeoS+7Prdi2qwGVaXs2
 lcL5NBOisCVccU6AcdQTWV36nfxj/gSOprp0aNkKeSDK7r7YMrSkfP12rkdijD8qEGG9KryeRlq
 E3dFUM1JqB6ti8e9DsiIhCIvcxIVhhrGy3z7c87BRNbltLSnGolJ+lnE4XuWnYYPuo/HrsnuXFc
 VS5r+elHi6YDVDww6bliEzQtwFiOqmyjhOV4TgEC3DMDnXHlEo9Kfy8QkX
X-Received: from qvwo17.prod.google.com ([2002:a05:6214:1811:b0:91c:6c73:b023])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:2592:b0:535:28bf:556a with SMTP id
 d75a77b69052e-55ac7b550f1mr98134961cf.37.1794695346042; 
 Sat, 14 Nov 2026 14:29:06 -0800 (PST)
Date: Sat, 14 Nov 2026 17:29:02 -0500
In-Reply-To: <20261114222902.1404033-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261114222902.1404033-1-gildekel@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261114222902.1404033-3-gildekel@google.com>
Subject: [PATCH i-g-t 2/2] lib/igt_kms: Reset connector Colorspace
From: Gil Dekel <gildekel@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Gil Dekel <gildekel@google.com>, Melissa Wen <mwen@igalia.com>, 
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, 
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 16 Nov 2026 05:17:02 +0000
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
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

igt_display_reset() leaves the connector Colorspace property alone, so
tests inherit whatever the previous KMS client set. After a compositor
that drove an HDR eDP panel exits, the connector can stay at
BT2020_RGB. The next test then sends BT.2020 colorimetry to the sink
while it renders plain sRGB content.

Track Colorspace as IGT_CONNECTOR_COLORSPACE and set it back to
"Default" in igt_output_reset(), next to HDR_OUTPUT_METADATA. Use
igt_output_try_prop_enum() so a driver whose enum lacks "Default" can't
abort the reset.

Cc: Melissa Wen <mwen@igalia.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Gil Dekel <gildekel@google.com>
---

Notes:
    The new enum entry is indented with a tab to keep checkpatch quiet
    (LEADING_SPACE), while the existing entries in this block use
    spaces. Happy to switch it to spaces to match.

 lib/igt_kms.c | 6 ++++++
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 541dd8c35..af8c0ff0e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -759,6 +759,7 @@ const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
 	[IGT_CONNECTOR_WRITEBACK_FB_ID] = "WRITEBACK_FB_ID",
 	[IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR] = "WRITEBACK_OUT_FENCE_PTR",
 	[IGT_CONNECTOR_DITHERING_MODE] = "dithering mode",
+	[IGT_CONNECTOR_COLORSPACE] = "Colorspace",
 };
 
 const char * const igt_rotation_names[] = {
@@ -2763,6 +2764,10 @@ static void igt_output_reset(igt_output_t *output)
 	if (igt_output_has_prop(output, IGT_CONNECTOR_DITHERING_MODE))
 		igt_output_set_prop_enum(output, IGT_CONNECTOR_DITHERING_MODE,
 					 "off");
+
+	if (igt_output_has_prop(output, IGT_CONNECTOR_COLORSPACE))
+		igt_output_try_prop_enum(output, IGT_CONNECTOR_COLORSPACE,
+					 "Default");
 }
 
 /**
@@ -2778,6 +2783,7 @@ static void igt_output_reset(igt_output_t *output)
  *   %IGT_CONNECTOR_CONTENT_PROTECTION (if applicable)
  *   %IGT_CONNECTOR_HDR_OUTPUT_METADATA (if applicable)
  * - %IGT_CONNECTOR_DITHERING_MODE (if applicable)
+ * - %IGT_CONNECTOR_COLORSPACE (if applicable)
  * - igt_output_override_mode() to default.
  *
  * For pipes:
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index dfcb91e02..e6326dea8 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -201,6 +201,7 @@ enum igt_atomic_connector_properties {
        IGT_CONNECTOR_WRITEBACK_FB_ID,
        IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR,
        IGT_CONNECTOR_DITHERING_MODE,
+	IGT_CONNECTOR_COLORSPACE,
        IGT_NUM_CONNECTOR_PROPS
 };
 
-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

