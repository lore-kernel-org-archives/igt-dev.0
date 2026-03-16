Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCADEF53D6E
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819B210E025;
	Mon, 16 Mar 2026 16:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AN6D1Lj6";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D3810E025
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:12:10 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2addb31945aso36518855ad.1
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 09:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773677530; x=1774282330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=olGoW2wxLJjvSm/LnOA5LBiNtLRzA2AHOU6/qYKz4lo=;
 b=AN6D1Lj6AzXvxfnKrCOFTGWbcLtLILn2P3N92eNZWYS6Pclc6jgazGo0/i2jNZLO02
 UUGFRUGzlapB2i8IHRlD6yR6kGcYTHzexm9NbLUfqvra5a1qu/ZyX4QlV0+D0Qj8HC3+
 Cf0jN1wrdV2oxMRgXnO6N9lGYpPpoLL+5p4Zt77Wdvg/HZM666PYQr3EJCHv78Z2gS8X
 jZ7Wa5ihqSyW3CTBQFy4Y3VNRwdb1ddC9AiH+dHQt/pKl7nRB02gPUsd8vvIWvUby1fS
 EXTH3HIX6ta3OkiOrW1uypKYQVl5X/ImihKLTzzJFIa+s/+f7Pz3wzMyS1o7fVjg56EO
 3J3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773677530; x=1774282330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=olGoW2wxLJjvSm/LnOA5LBiNtLRzA2AHOU6/qYKz4lo=;
 b=oZwLzDhPalnKQwoBj4FzeJkdWOzMUxuf7/4RHGbM6xbP619avUe/kxCkQdAFF9bsX+
 0hD4HWHchIBRdF4e7zGXy/uA1Z86NZo675CVJqJ/b1lcNXVJu8kr6aIUcamYmH90yzWs
 7iuaWnV0rfei1bnvqfam3fe8LcdUn3E1P/7Lwus4c+9U95TVxcjiUJUTgamTZv8i1Cz+
 jLZwHu1xXyQiqdsCQz9TySAaQjgtnMk8iz42eCQUfVItfRBhLDygtRZi0O9J1qMNXTKK
 /OwFtdT3Zi1jgNh7qOZB0Ht4nlD5mDVSBzf26kI5S1zNghQKldajq3Afw7HTz32EDOYE
 defg==
X-Gm-Message-State: AOJu0YzrE1WXwlO53RQfiNrFDFImhdqLizaH72x4hdIui+fKadou+lKs
 kqD6qbTjq2E0uQjlx9HGUNgNcM0VSso+4uB9/wNWmxoKG/+oJRLhZgDUvh8babIt
X-Gm-Gg: ATEYQzzcYacpIQWGfgkEe3n4X/QMLM2kIEY9FMShOgVe2EsaKmRS+mW6fdy20sRolUb
 OnQ1VQ+trNwuUX988S3VAKCxYYhTglUe66TSUeiCDgJUElmNvBIcWVHeGEyYbfJM+8+ZRmAviIg
 XGi4z5/w3JHUG2OE0Y6MaR0fAp7EPxfWhEVmDwvpaWNjIuR5Id7GmxYwsgNlYr+XFEZ23RAUSvA
 lUm0dNf5h00WPhbvMGwMERJ95cwGy10Di0i1pf78+rfAweF5xZFgD1Fbm3UrgzcUPkt7CnXlRaP
 qwHuMB/Gjju7yOjq4OP0hgOXL0dD2VbW4HC//gUxAnRyVBCWiCRBtsXQcZbp7Icg/Ja9p7c87fm
 2yrRTCiBo5aYs/3DvCvWUem3N4SimyjlNxzsv6yrtN4io45Eld0gdrnUFolhMRv36RpqyVPbYTA
 91x3s4XyqkokjTagzoYTtWNJ6W1wau4YE7m04ouvNSxH950Dlemj3i2F8WlgHlWg==
X-Received: by 2002:a17:903:f8b:b0:2ae:803b:d370 with SMTP id
 d9443c01a7336-2aecaaad316mr129924625ad.34.1773677529690; 
 Mon, 16 Mar 2026 09:12:09 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aece8363b4sm111679915ad.76.2026.03.16.09.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 09:12:09 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/1] add intel related yuv restrictions to
 kms_chamelium_frames
Date: Mon, 16 Mar 2026 18:11:00 +0200
Message-ID: <20260316161101.2808556-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
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

kms_chamelium_frames subtests sometimes fail on intel hw due to random
settings used in tests. Here added modifying coordinates if needed for
yuv framebuffers.

I don't have chamelium hw at hand hence can't say if this fixes all
related problems in subtests.

Juha-Pekka Heikkila (1):
  tests/chamelium/kms_chamelium_frames: add intel related yuv
    restrictions

 tests/chamelium/kms_chamelium_frames.c | 33 +++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

-- 
2.43.0

