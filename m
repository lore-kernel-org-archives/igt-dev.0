Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA92F8D753
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 15:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160C110E8EC;
	Thu, 16 Apr 2026 15:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NNLcZnks";
	dkim-atps=neutral
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7988E10E8EC
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 15:54:45 +0000 (UTC)
Received: by mail-dl1-f41.google.com with SMTP id
 a92af1059eb24-128b9b7e3edso8115720c88.0
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 08:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776354884; x=1776959684; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6V7UONhFDaXgGs5IsOj0eLaVxam0iGR7wntdRonSplE=;
 b=NNLcZnksJZ+/1LR3hAmYY6J45YV7/ZVhT/bNjPORNK6FKMBiNg6CBUto7J6li3dVYs
 eTMN4JXa8fJGn1NZR9VRENj/w6MgqgqszLTCUzq2X0GbJhAGzYL+jquZgxhBnhSTLR0a
 nN3wlZbeg92iJro/SaYRMiMxtdZR68esNhLezdvtUZ97Ezbve3FpvO6V4ZRJEANW+lyD
 S7/zE5meVm/TKZ0CQZebX9Q4yllMkj1twXjXjDha3T93LPpAqsWHcJiNoxusVd3iLoMZ
 wLRkFvvXuPWSShfskaI0cOqlwvLtgYqxwrs189VpUOnNpza4kgrC1+iA2HBa81REKVsk
 r6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776354884; x=1776959684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6V7UONhFDaXgGs5IsOj0eLaVxam0iGR7wntdRonSplE=;
 b=aoykxEiOwMynvdHEb4PUVIKYBznxwSeVLrbd5gFLXLXJvzoF/XINtZq6h/0ja4VNfx
 PVnA8ucwU/5V6vaiGZQphG2mLv1MFCHMwU+pDGl/WtWsjhwvzvVdP1vmGoNhFD8v0qAk
 CrKRGzHYexOGFDCh6zoTuzx7Y7V6l+ViwgpkIL8s1UjwUXiORQDI3/AfpT+CaZc4vuWT
 mdwB95VC+Kn4TTnMopbCR23yluU1F5UkFCkODwoz+a0vGheJx/c8eF0I5ro9/n3yHomQ
 cWpTHzInICQZgAdZ4b/FAzZ4IdDMJUlYkUfIlvY8Le9E+uZOYuKYKSmkzbkjcKBRhpGY
 Hr8A==
X-Gm-Message-State: AOJu0YzentAlFKpD8ylPiZlTHl7/4OWKkPVDLiNXYsXOWdLNx+QLNV77
 w8l7xqVaAmcSs52QIGym6MVgsXxCnKTMQzolDXkFQwFZSYLpTtjn8FKkYwR7llhnzDo=
X-Gm-Gg: AeBDieuiKurdz+9HVfBTU6c9ln4Yux5+6NkG5PN8pHLdCUGQO0120MmWZZrMi9IN1S1
 ftlBiHjONFIekRUivddGNr93o56jxIWz0Oa5N2bNHTObliuCcA7f67NpShYeQwbGSvErNfe6VvV
 up7BE3W+nVX40mxX3/GO0fSvbyPDW0SihyKRwoRkdDCPSUD2jdiJdY7eEDU/NNM180Mmoqs1jGR
 yUsyAJ1C2mVByMxnTsO1AYGOsRFYFKfY5Dn6/+HRgR7hubYqg4sIYmFfv7KGxNAVJuboJho/6pV
 xW/PgOvfRnf5dFZ3UhqBBedDygZV6LRbd8tKyJ5fQQQ/1CGxciOf2WdNl69PRKrLykrO1BvXfVO
 7/V8e2xCONwPalVUzFsamQVAJjeqtwMPvLOYGgMx0N79O6qsb6j3/zLSMGiSeUb1JMSHG9QoZcy
 wI1m8iybhGN8/Bx22ajyCgUek3di8g6QcmgCoZYnl/lHpLhV2tkpeb2cXi8gWYC1KYlzihfhg=
X-Received: by 2002:a05:7022:618e:b0:12a:713b:8958 with SMTP id
 a92af1059eb24-12c34e5a827mr15703672c88.10.1776354884300; 
 Thu, 16 Apr 2026 08:54:44 -0700 (PDT)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12c5e6b4fb8sm6279278c88.12.2026.04.16.08.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 08:54:43 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 0/4] Refactor kms_sharpness_filter tests
Date: Thu, 16 Apr 2026 18:54:17 +0300
Message-ID: <20260416155421.2000-1-juhapekka.heikkila@gmail.com>
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

v2: small refinements

/Juha-Pekka

Juha-Pekka Heikkila (4):
  tests/intel/kms_sharpness_filter: sanitize subtest init
  tests/intel/kms_sharpness_filter: refactor test_sharpness_filter
    function
  tests/intel/kms_sharpness_filter: restructure igt_main
  tests/intel/kms_sharpness_filter: Find mode with lowest bw requirement
    for test

 tests/intel/kms_sharpness_filter.c | 632 ++++++++++++++++-------------
 1 file changed, 347 insertions(+), 285 deletions(-)

-- 
2.43.0

