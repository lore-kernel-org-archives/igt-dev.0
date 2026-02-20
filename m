Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8225EC5ACD1
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 16:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BBD10E811;
	Fri, 20 Feb 2026 16:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UboIDiVJ";
	dkim-atps=neutral
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D05510E815
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 16:18:03 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id
 d2e1a72fcca58-8230c839409so2024867b3a.3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 08:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771604282; x=1772209082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nqbSvS13g5ne9eTYL+aRZmY9zcSMMhmRK7PLah08484=;
 b=UboIDiVJVl9+oPn6lGUlW8gSI4FgeJ6luBQTIEyKyqG/FNg26sp7ap5jI59o8H+lN2
 /i2s36pUWjOSfTBT5Y15iseCZcQVis7xwOGs5sXeBQ/Lu0dhcvdytlz6eJFY2OYp0CHS
 8fgtICINkBtwGHM91K7LDbcJzQrhxBnUWkpvJEb4e3Vnu4M3/IohTbhfvj5YbJ9RzYQV
 4ZGeGo1/k3XWvvsvGXJtB2ZlEOSyoowXOPp1kPCPGJ3h7w0YZnjYf7HCNhtGU5eAgj5h
 Y59jSOoq59Fo6HpzWjzO3Frirs6qxDFfaFsQ48AFS3Of7BPf0YfggJ1RsJ0kZeuiczAy
 /ltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771604282; x=1772209082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nqbSvS13g5ne9eTYL+aRZmY9zcSMMhmRK7PLah08484=;
 b=FGGjkLjn/aSKolH+HcVPF4Nr6V9jSMqJC8z+2zSdB/v4unfikkJokLnT/Km0uCF+Ip
 tMX+xnYd7rKgrZJ1xtXFCFUAXmpEo7dfGnGCxqHdbQvtjLv67wrDt4+X2QLS5ewEneYN
 H5WzGTXNEsaNeZQbtlhnR5jYI+g2F98KGJrhmY7iJxtFwjtaRcrn2DUqN5A4mkaSPz6c
 pPRlI4p42QlPHBVAJ/kYkQL3DCGUTd34X6CEX/1J0Y16jZV/FQ21NqYnmAM1fIyPpBrt
 6bVGqDlFIciF2FhDiC59NiVz/xk4EY9aUADmD2tXidD1FoU7wYozYr36AjrapW66Ttxr
 eTpQ==
X-Gm-Message-State: AOJu0YyRpdl+5gGsSPvleGFaIZkrmCdY/6ImZOu5IaihPkw0kh4MTNTw
 gGwFDq/9NFmG2HnIa8ogOxmYwyYZ+vFsLJWMCaTF47p0kMo9SOUNnsjDUGR6pNkxkhQ=
X-Gm-Gg: AZuq6aKWvPONTcHqceMdaqk3Yu/EC63hsS3okDgw6FDgKMGkoMaXsdYCmEBEySB5/0z
 HVnThyB/2mPD9a344OM19YRqSzD9zsPm1fh5d2RPt+vCv89mYnobaSMnve616r9HYC5oI0flTpX
 sU2pAfZCREqcHMf3UbAhx+eLQFMk5w35ek/x+JDI4rA/lPgRTlhQ3Jpelo1Rz/0CNt4gODUTsAZ
 7+wDXLmU4LrH5YKl8/yT8/uo0azr0fAAG9Ssygguorpe9IKYaAvkV+/8eGDMWNZYIH8ngnZtAc1
 nKv6sJBxtW6oj4tR1vW5RY1djs68kxUMYaxafRMKrDJA7OgchT82JBzZSD+n1Pq+cqF6c7STEkv
 DgUMxisAUOEJO+Er0Y0WrUNDsekuc8z+FJawNF/QvWf58XfgaCrtBE3UOot4aWbR/dr/k+HIua7
 Aov7lhf8k4R+C6OM3cbV1lrXZ6D8mbvCRQs75q/UY2N7f8iGAADs32Q9Oejg1TIw==
X-Received: by 2002:a05:6a00:4c1c:b0:7f7:5d81:172b with SMTP id
 d2e1a72fcca58-826da9ee769mr325846b3a.42.1771604282375; 
 Fri, 20 Feb 2026 08:18:02 -0800 (PST)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c68db466sm22966843b3a.0.2026.02.20.08.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:18:02 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/8] lib/intel_batchbuffer: move engine class selection
 to helper
Date: Fri, 20 Feb 2026 18:17:15 +0200
Message-ID: <20260220161718.652862-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
References: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
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
index d8e5816ee..365976be5 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2466,6 +2466,26 @@ static void update_offsets(struct intel_bb *ibb,
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
@@ -2508,26 +2528,8 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
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

