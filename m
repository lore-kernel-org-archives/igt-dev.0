Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E75F10F92EB
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 19:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E276F10E9BC;
	Tue, 31 Mar 2026 19:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XIyAOiQS";
	dkim-atps=neutral
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D542B10EB3C
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 19:04:33 +0000 (UTC)
Received: by mail-dl1-f52.google.com with SMTP id
 a92af1059eb24-1271195d2a7so228765c88.0
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 12:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774983873; x=1775588673; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Y1TANu1UnLNETVXo9KA+Fr0xFGWafELabqjAXMDAnk=;
 b=XIyAOiQS0vyKEN6+hk0LrC+qfOVc48YK6k1MIZJp2bQrFcYkEBDjafebdADhaROJXH
 +y//XhRfVtoHzF437SRUGDcGzUat5ZfGg4gXxvSLLK0ixScmltIX3KkXrJJ4bNTzaqkk
 anYXFJZ98gVdiFqQP5a5fSeWXefPVRx/4Mlvr0TEJ3TBj3mhj4czQAMFV5Ye/QfeBqSd
 cC+o89XLWX8aU3soR8mXvlormLRbC01F77u+bCuSf9SG8r7t44+COUMhKg+eNPas0Voi
 foZEd8a/TVxrI1AJi1yCVXyzaZQkPLgRtpJjP8MROPvMe2zDy30QQpCYweuF9fhv2fYT
 MNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774983873; x=1775588673;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Y1TANu1UnLNETVXo9KA+Fr0xFGWafELabqjAXMDAnk=;
 b=h4RgSv3fgQlOSZ6cFKY+9NiwJv6eAkDa3GKLkpTqxmxe3f6iWTal6O55eNIIpcfrEU
 8Et51R5fN4rjk83QDx1gpwGIywoTBSDdyS0oeCkFVtqd4YplZaGVol2izoXTaz1TPyE4
 YqZJHt8/L72Y7KH1oVBCpd0Zt+/bJKDZO9JrZ7iBBabziIHBTvmABnnlc0vgdXEoqZ5I
 5ljJqdhrzVX/PCvAsVUTJDshAFHqT7e5pKxULbrWEZnf6Zm39Rw/NcFm6+qL9XYYcBse
 CW7BrooR+e0Hv4xVEgP/AQ1/oQ367yfsJ2iuv9Q9l1xtL6FEgY+WgTmhDLoHnbh18UO5
 RTqA==
X-Gm-Message-State: AOJu0YyriBgqfixfHTvPQ9plszLzZr+IVvILD2Til1QxpeadibOH15VW
 6jsOLfrjam6y5E/acOpRmpswcD2BidObQZttg6gTVRBXbtyRrBHYuO0CUpK6xoeV
X-Gm-Gg: ATEYQzxuBGVwuMXj9AURXQr9tFlf9ATS+pnm0VsaN3tbO42g53NTncdlv+lk14/Q7Gc
 sVbHIs0hUMhazy5rfyC87e1qWTMX7ZvLGeanfq8Ehx7yZ2x+62MtJImMzN5DODjrDpzFunmnA3+
 gsrhp8NO94a4SghbwMz3uGABol/sKLvZTmZyBZ21cH1QGxOZWyq4tScdd3AoCvKhNSo2OHJyw0h
 LqNMOF6d2c75dFATJ5HG5NCQAlam0bxQ18csjTf5qGLZf22zF040Fy0AcyuIqWmo49Q9Kw3LBIB
 hKo4a3nI4ys65GG62TvxPN56QxeG/cGmgAiRUahWBKHyVMKxtpCC/403gN5LxSuSs6cDGnNM7Id
 RN7D0mpmOLDW0u25sBFWlFMxF0BUPZ0sUmCADMPlbETsFu028YeTMu4013IxZ8X8Avl+rj6IMKd
 FzAIP+ZuJKGmfVkawefozv3rzsyIGeJY/eRnpIaecp1IAol328ZMSoiKJULgU=
X-Received: by 2002:a05:7300:2213:b0:2c7:2cac:815b with SMTP id
 5a478bee46e88-2c930986704mr298158eec.6.1774983872671; 
 Tue, 31 Mar 2026 12:04:32 -0700 (PDT)
Received: from localhost ([192.55.55.46]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c8d8776daasm1038042eec.1.2026.03.31.12.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 12:04:32 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/4] Refactor kms_sharpness_filter tests
Date: Tue, 31 Mar 2026 22:04:08 +0300
Message-ID: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
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

Some refactor for test and then last patch is fix for test to find mode
with lowest bandwidth requirement for tests.

/Juha-Pekka

Juha-Pekka Heikkila (4):
  tests/intel/kms_sharpness_filter: sanitize subtest init
  tests/intel/kms_sharpness_filter: refactor test_sharpness_filter
    function
  tests/intel/kms_sharpness_filter: restructure igt_main
  tests/intel/kms_sharpness_filter: Find mode with lowest bw requirement
    for test

 tests/intel/kms_sharpness_filter.c | 628 ++++++++++++++++-------------
 1 file changed, 344 insertions(+), 284 deletions(-)

-- 
2.43.0

