Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95940606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SYw1vIXf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E0810E240;
	Mon, 16 Nov 2026 05:26:51 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADC310E8AE
 for <igt-dev@lists.freedesktop.org>; Sun, 15 Nov 2026 00:19:00 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-55d33f412b1so893581cf.3
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 16:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794701939; x=1795306739;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=V6obUiWYQ+CzIo3qajMLa7Vz4bs+uYumDj03o8tm4AY=;
 b=SYw1vIXfzUDR0AZ4G5eVjnV6+x3DF2tBWPPaomLELQ1dHv9KqhmaTtf6DmWJrivDfi
 KacVOY00bGgY3kmb3My1rKk83UXvpOauVvmLvy7mEuZc2OINzvoJbmhF2bHT7Xfardq2
 B+XyiPKQRw6hT2PEKjLU9DmrY6U8tcNWunsSH2ID4ZO/iXKmWmFnXecDtf8r/d9Sdea4
 1oGgZxxmVy+j+aEm5rJge3YTovM/IiWO/REqyboQyuLNshVcChpvMfw97ceDRj6D/jZ7
 LGw11EmDXX7uVU2J8JaklSAKmPHq/SdzUI/rbem1ENqOYM3v6Erx/WNzTamnaV5SR3MI
 0PpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794701939; x=1795306739;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=V6obUiWYQ+CzIo3qajMLa7Vz4bs+uYumDj03o8tm4AY=;
 b=jaJe6/zdjoNZQUS5nqntnreTeOUewqsJu5y/w9VtcDONSW5evq70ClZpFuGwZYWerj
 rhwWsotDJEgRYWatoZLFFqWPB82yp8/IBoYgQzdhoX1NmiQvZ4ymgliEooF8Ix1PZ0rD
 XhT4VpGy9UICLSnSAortC0PixzIWgYC5wD0yoYRaEPKSpUxMVYkMeK9YNkmaIrAo8uLd
 sX89YVbFRDk+5DDBAUxVYOtUWV7Pv/4wnkk9OExliC2qhQ/w04KwwI6N+9Kz3fEabUXV
 8HPS7PE2oq+h5KglaQzgB1Zlpm0dJpbjz7yDmHA7mEHUr/99DJaghIE84U9DPgExJnPi
 tt+w==
X-Gm-Message-State: APuU4Z+ZYA+T1JuOEFZA6AveecBs3Pkv6bRD6csqDloOjVD1kYqo2E4U
 xPVxxv9xBd3+JThiqxzoHZ+wd6jVc75CzoVp1wgiJfoVOifKgfUFhMVUAZgMZgk4lmVFTAYYAV3
 rmGUCixmCKAUA2JwuKdALOUmvFKEReqet2+Ubc5y1w6FhWIPEOMEZDRa4Loz9axyarUYaA1CuYN
 21cg8QA3dwZr3OlAmvZvRop+Vmdbs8Wrl6xpVIGHQK7vHkoJN/p8/hbs1y
X-Received: from qtxg14.prod.google.com ([2002:ac8:5d4e:0:b0:55b:93df:d22b])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:5a41:0:b0:55d:33e0:ac01 with SMTP id
 d75a77b69052e-55d33e0b43bmr2984831cf.66.1794701939183; 
 Sat, 14 Nov 2026 16:18:59 -0800 (PST)
Date: Sat, 14 Nov 2026 19:18:55 -0500
In-Reply-To: <20261115001855.2931860-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261114222902.1404033-1-gildekel@google.com>
 <20261115001855.2931860-1-gildekel@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115001855.2931860-3-gildekel@google.com>
Subject: [PATCH i-g-t v2 2/2] lib/igt_kms: Reset connector Colorspace
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
    v2: No changes.

 lib/igt_kms.c | 6 ++++++
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 33060eaac..3f281929f 100644
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

