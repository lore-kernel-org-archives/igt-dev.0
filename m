Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C563F5580B
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 11:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB7E10E4E4;
	Mon, 20 Apr 2026 11:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eDGixt1b";
	dkim-atps=neutral
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com
 [74.125.82.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5E210E4E4
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 11:06:03 +0000 (UTC)
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-2d891442388so3865327eec.0
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 04:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776683162; x=1777287962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vCxLBFlGV3Wl1+l+/+tMx3bP5i6gKpShgS+cuUDrjQI=;
 b=eDGixt1b9pBlZBU6ZH0Bw8O/NcCNdM51eW+f1SAyOG+MC4UXqrPTsmVv2WCjG+KG7l
 x5norVHw748k6aSDBnpjCy1pAtCz9d5cMKP7bPsd4bGIIYsIgRKsK6km6s0kT+wxekrs
 WU1jaQ1v2IJXI6Ayk/H0MdseJlMzbQLxozjxQaC2TwqhM4zntOAzB4+ThDDj5r5v6UPc
 ichq+SGG4SMkARJpGarU9rxvUvajWBrIV5VfKaqrlPBZ9IAKdKKRKwjfpBe/HO36f9Ed
 0XY2ctD1gwPNN08StWzxNoQboQ+JoRPiANkrHrCTK75zFFuUwstOdkETLCys0a0XcWew
 ToEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776683162; x=1777287962;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vCxLBFlGV3Wl1+l+/+tMx3bP5i6gKpShgS+cuUDrjQI=;
 b=qAwmZOzXUSIC5X7OgrCJAiSMFHtP3G12mXSo94txrKHyYrDjRldAOzzHylMDSz7xSy
 +q0YFtiIKMHBr35amJ/OO2jAQ9WvD494AMK1pXIhDOGAnVrSNWKDBTQLj4TqRPGDvXoQ
 bsEOOXEtQcMYNiIPlsp/7YlnGybJ4rQXPeKoJB2PeK/3vsEP6P22RL+GDz1croMjAdA6
 lA5K2V0ywxU3cyN0Hf8MiWL8zoJbAtNlilJxl+d3VperqUo4skOX/pR0K1dzdYd2/ozv
 Wl697oWWgRkOrw149x5wWOMJR0yMiOmAdtAcIU4XbxsxGnWnr8rM1GmPFEMY6o4ig2zT
 AaDg==
X-Gm-Message-State: AOJu0YybZ75aIUC84kGpgsZBMYR6qHd7SrrHEvnk9gyr0Enii0U1aQVN
 K+h0UKKF660UxmE2JhbOCBJd9F2A5mPRg6ByN9afbAqNfEAM+j2IDSv8bmjc5DRB
X-Gm-Gg: AeBDietldKYywNbbXH8bfL4vD9y9SrGggENk0+4gghYK4mTWp9W6HQctTo8f4dt4sq0
 1k3NvbVb+eol5/tbsqlfEVBuzxHC63b0x549mYAyW0KHspAxMn0QZWNjW1yudr7hMMS1o2JItkM
 24HlfW/LPLFn46c+ngZhtvrgHmPoVmO1kW6YuXTM6hE+4+9VpK9Agsfq9xCT4+1TYXFUdeHR4SR
 4tsRJU3pgcciwXYwq4T62otKwoWy4K8D303Prew43UjAyHEIe1SagXyuaA/H8W6wVn2eEwkgP4o
 Ehu8rBZ1UjQWTWxrDzk3QJlddytkGtAkXPN2uMEgwzsh8Nhk9CtcINj7K8VLVLHe7Mci287gPQr
 DWQv3Sk7eXrukwzPkD/VN8cDj4TaYCIylBU0ypYTZHAjfx406Y7vfq8v4L4iA/RUKfswF9WJKNk
 S+Xh41Pp38iN5uv31KxcgO5pVy73KCK/aFla3IrS2ggfeviNfyMZuCoyQMHn+tUGz1VInU4w==
X-Received: by 2002:a05:7300:d516:b0:2db:2089:460f with SMTP id
 5a478bee46e88-2e478c1ee94mr6871150eec.19.1776683162014; 
 Mon, 20 Apr 2026 04:06:02 -0700 (PDT)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2e53ccce0f5sm13764998eec.17.2026.04.20.04.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 04:06:01 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v3 0/4] Refactor kms_sharpness_filter tests
Date: Mon, 20 Apr 2026 14:05:49 +0300
Message-ID: <20260420110553.478287-1-juhapekka.heikkila@gmail.com>
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
v3: small refinements

/Juha-Pekka

Juha-Pekka Heikkila (4):
  tests/intel/kms_sharpness_filter: sanitize subtest init
  tests/intel/kms_sharpness_filter: refactor test_sharpness_filter
    function
  tests/intel/kms_sharpness_filter: restructure igt_main
  tests/intel/kms_sharpness_filter: Find mode with lowest bw requirement
    for test

 tests/intel/kms_sharpness_filter.c | 630 ++++++++++++++++-------------
 1 file changed, 345 insertions(+), 285 deletions(-)

-- 
2.43.0

