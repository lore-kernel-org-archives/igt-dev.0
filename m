Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A291C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 14:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5C010F372;
	Tue, 23 Apr 2024 14:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MhLdB9Jo";
	dkim-atps=neutral
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B9210F372
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 14:33:00 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51aa6a8e49aso6300935e87.3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 07:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713882778; x=1714487578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DBp73zss2rZn76JHSbcd4FitrcvrtnnpFMl5AM1y6UU=;
 b=MhLdB9JooYrLQ9PGkaFYDywrkqv8X//Y4YaIW11yXYYtPkoaTe4aNI6M63MhW7TjkI
 7TTEXQgU+oJY4lw8pfpU1ByAxRKlSPPDDG8q1n6UlRNK1MYlpzMKrRXi/d69VRCQJlyf
 5KFesihoPrPopQDHP4W+9i+r6dM3JSNop8cMMf5+mMtTG9yAcxkJ90ONp6B6W/p5FmE8
 l4gJ07QiYlUklKVn2mOCYFOW25sJgG7yPzoCfDuN+2fn12cZ8TA+OIUs1hsjqi5Vyi9b
 ebAWOAcKFScfF9kUQGDCsj+sbbQUuJq9RYxT3ZYzhMp1gtQNqo3Ew9mZa9cKXT2Iw/vf
 ZQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713882778; x=1714487578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DBp73zss2rZn76JHSbcd4FitrcvrtnnpFMl5AM1y6UU=;
 b=YRHdC881VA+ICSFQ4JqJnKkIH9ohY2VkrZVM7pmGI5/cY8Kl1vHJ0AZ8NjbIuFik9v
 JViSJgDOasKvoozad4ZYzxCRUH1YVaJWnLSGRcmJz3sryAZ8sfY5RJEgloAhHkRsy+4R
 7r00aZFvhuKeftjbwj9DGYALEvYn3BTXxYefUASBsZUu3Y9wBTrHFIcf815xkdd4+GL5
 wgmnIaay7PzFDOkaPWKP+8Goka1WALaJOzOnG19Oh5ZPhvu0yaHwLQbo5oK9Z+RMB6Wo
 2wkD5QUtcf0oHoakIBsPBZkFUZREzyZyLATkmK0wsqMOi7dvxUM2lbIA/0DDSpGirzet
 LE/A==
X-Gm-Message-State: AOJu0YxBbYZ5m8HIN9QAr41Sfec9zdIREcK6Z065rSuQOKR93ZV2yPVV
 497IFb2phu0ucrJA8lZQpp1d1ONGOZWxFUSl6V508FRNpzRBF/RWKp8HOcUTUpA=
X-Google-Smtp-Source: AGHT+IGR7SCrg+izha6S2j/ojGtHmEQfCw869Ne+PbXxXL5yIuu8DhccSQ8RqPc3pqhZ7Fkj+3GXBQ==
X-Received: by 2002:a19:3801:0:b0:51a:a070:28b0 with SMTP id
 f1-20020a193801000000b0051aa07028b0mr7295714lfa.62.1713882777602; 
 Tue, 23 Apr 2024 07:32:57 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 d25-20020a196b19000000b0051af5cba0f3sm988781lfa.11.2024.04.23.07.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 07:32:56 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 0/6] Intel blitter framebuffer copying sanitizing
Date: Tue, 23 Apr 2024 17:32:40 +0300
Message-Id: <20240423143246.130884-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
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

As is framebuffer blitter copying look messy, here tried to sort out that
mess a bit. On the same go try to fix mc ccs on xe for dg2 and and x-tile
for legacy blitter on xe.

Juha-Pekka Heikkila (6):
  lib/igt_fb: fix intel modifiers for fb copying on xe driver
  lib/igt_fb: make blt_compression_format function more readable
  lib/igt_fb: Sanitize blt_fb_init
  lib/igt_fb: separate intel blitter context setup from blitter function
  lib/igt_fb: put intel blt cleanup into its own function
  lib/igt_fb: unify intel blitter fb block copies between xe and i915

 lib/igt_fb.c | 371 +++++++++++++++++++++++++++++----------------------
 1 file changed, 209 insertions(+), 162 deletions(-)

-- 
2.25.1

