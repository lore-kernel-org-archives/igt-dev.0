Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6A6C5DF85
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 19:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086DD10EE99;
	Wed, 19 Aug 2026 19:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YEH90Ufl";
	dkim-atps=neutral
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB7210EE99
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 19:07:45 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93494527488so245761285a.3
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 12:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1787166464; x=1787771264;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:mime-version:date:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RNCHnUFZmd4n3YYuRfQpjy42cEljqstsqRVsl0k9V8A=;
 b=YEH90UflBcY2HlL54sQC2yFtH8p8ck9rouxxLp3BqMVwOPXA2FG1GUVZ0lc6E3FJG6
 eynHl10cqtjLEuRqemoWnno7X78LBV6box82s9jv7YEdmEJ16GRR6tYG9pupGZ4pa5nt
 NlS2J7GTbTK/wZuTI9yFyi99ycFaZdjIlYMDZUO4Bb6Z+KLHmmzH/YBoL3OA7+H8wm1W
 xUtHhDiGmdNM3PCHv5A0RnECN2fyFJzK6iJd9XD4eWU1egK2Vv77qUmmfVw59suilzUL
 aCDkS/TEquBBeNprVXBnQnqdFtxsztu1ACFHa54Xw0KrB02tcUQ/0Ry1nCft6DoF4N0W
 /ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787166464; x=1787771264;
 h=content-type:cc:to:from:subject:message-id:mime-version:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RNCHnUFZmd4n3YYuRfQpjy42cEljqstsqRVsl0k9V8A=;
 b=r3Rf4wcba5Ar8Bm2TSF6PbbCKkcBJcxvWCxTY8F2LyAOAuhaD6rVCuEx6X0AgJVr26
 Wa2WdLZ6ao+B71EbbhsloSaA4f0sDvCSuCg7FVSubExyMb37+Pw9ihspPt5MpLE1AyEf
 kyXCqRJQDYHXyrNB5Up0KbspCJlb5z+4d/aHHva0F+Mk/Jlpqp9D3MiJwUcflup5EnQW
 LQ+I733b3Kmt99hVZ/bkkbFdlSyEE9BOG4wSFeMtQOSIkB3dzRqGDyCxzjKDDsPHJddp
 wfhJDD54l0ODccyd+NFqKjrjNOH0cUNCdDgmaPL5rxhCaoCU1aWQp9Q2ekBP5wDKn3BY
 hvKQ==
X-Gm-Message-State: AOJu0YxUZIsmN0qNL8oqjXHqKjeFlLVUGabrVSCbWvKqo2kulbbSgLcn
 kXDp5V82g+YVPJXZb7Dfyj2NyOvYd43XB+L2pTpizvzayv6VShJYyoZ/8J2UhY/566O6sIEy4v5
 IBt4jvzIlEXUjxGRiaSagGYTn8t+SkVkiGXJ19xN+3lnznc/HY4XKcsGAGclNwZHY2qlyKogACb
 fhcGGCWIKk9MkvMgAR84vlDGJssBv9LqvK37yBhGhRBCVguDPLx2TUGc81RZUwWUzmkWs=
X-Received: from qkbe28-n1.prod.google.com
 ([2002:a05:620a:a41c:10b0:934:9af7:a2a9])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:370e:b0:936:583a:dd75 with SMTP id
 af79cd13be357-9371e63f7a0mr605305885a.17.1787166463393; 
 Wed, 19 Aug 2026 12:07:43 -0700 (PDT)
Date: Wed, 19 Aug 2026 15:07:40 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.737.g08866a6d13-goog
Message-ID: <20260819190740.1392859-1-markyacoub@google.com>
Subject: [PATCH] lib/igt_kms: Do not treat writeback and virtual connectors as
 connected
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
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

Writeback and virtual connectors (e.g. DRM_MODE_CONNECTOR_WRITEBACK and
DRM_MODE_CONNECTOR_VIRTUAL) do not represent physical display sinks and
cannot be modeset using standard CRTC / atomic commit operations without
configuring a writeback output framebuffer (WRITEBACK_FB_ID).

On drivers such as MSM, writeback connectors (e.g. Virtual-1, Virtual-2)
report connected status with virtual modes. When generic KMS tests iterate
over connected outputs via for_each_connected_output() or during initial
display setup in igt_display_init(), attempting standard modesets on these
connectors causes failures (-EINVAL) before test execution can begin.

Exclude DRM_MODE_CONNECTOR_WRITEBACK and DRM_MODE_CONNECTOR_VIRTUAL in
igt_output_is_connected() so generic KMS tests only target standard
physical display outputs, while dedicated writeback tests can continue to
iterate all outputs explicitly via for_each_output().

Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 lib/igt_kms.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 521a03c01..8d4d14847 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -668,6 +668,10 @@ static inline bool igt_output_is_connected(igt_output_t *output)
 	    !output->config.connector->count_modes)
 		return false;
 
+	if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK ||
+	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_VIRTUAL)
+		return false;
+
 	if (output->config.connector->connection == DRM_MODE_CONNECTED)
 		return true;
 
-- 
2.55.0.737.g08866a6d13-goog

