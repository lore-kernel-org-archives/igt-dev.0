Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD64C07C79
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 20:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8043112D6E;
	Mon, 22 Apr 2024 20:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FrZH1Wv7";
	dkim-atps=neutral
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E4110F852
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 20:45:04 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51acc258075so3862074e87.2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 13:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713818701; x=1714423501; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DzsmO4rI1uqskfoLxKmCYryLk7ZvwV7vju3/NiIaWjo=;
 b=FrZH1Wv7kfGWEmKEDjeEo/47+sNdoIChAG/LYhA+23wKLeuFYytCbHxfyJ0Mu64Yxy
 mGoFvXtcgWhuofHsWizl7KM1K/TAVRa9hRTlIc1+CX/IW0msFgepYki0SO6SAu9q4KRi
 zF1QAmbrT0B3sCmEFAcbhjAQRwDWYnSwb66CbLxUsgIQhx0pHPBhTWMxkGGlI42RB1CX
 dVY0s0nSZ2plgbvxFbXPj4Z0g+wWmwc8nrKkbcXD7OlvGVWDqQDpzhkELGZU/q1Lr0ID
 qhbdVCt4dTugqo5f2EdQ5fF/ozPdsDyLEltriude8nk8rTrRYK6YvuoZLisSOn5/q8vC
 1cZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713818701; x=1714423501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DzsmO4rI1uqskfoLxKmCYryLk7ZvwV7vju3/NiIaWjo=;
 b=eAtIgi5WOP+hIO1mQcvpd/OjbZjjSmU+LWfx0nzzMaYMgsUkvJ38aZXT+P0t+8TDHG
 9VEShZ/Rlx+CaRzNYjdjvxVaIxCGu3EAh0hhpym4AtnbFP/PziHuqHTtHISGhXx8cocr
 a60Z9gJcaKcYx0wlwwS5O3cjvRX7rIGjA7i2YJLXtg2Dldg+vt7bYdqlUDZFm1kBYku1
 5CYPTv75oJy+HtlmY2WvM8rnzCKRc1r3xzotGECViPMnEBtdel5GaP4bLdjyXxB0lAX1
 g8TntCATdY3zU8WxNa6fou0YbNvk8QAjd+7/kOHBb5Jyc6RLltgCqQGcATfSC8ORjarw
 6J5Q==
X-Gm-Message-State: AOJu0Yx+JPOVPHJQzBXh3pDGihFygGQxx1MqEy2sB5dSEsok6SCvD6DZ
 88NmFoXhqAor4ziYsiqRmsnmPC8bCumm6NgrTv6bif2osLji47g94aY7RFI/6Nk=
X-Google-Smtp-Source: AGHT+IGWCJKfvnTCd/cS8Nijg+GTkN8DC7fh7S/FNvGsszVmVr6qFR/frCKFSXpEXsPmfzKMEMKcqg==
X-Received: by 2002:a05:6512:687:b0:51b:5f9c:ac1b with SMTP id
 t7-20020a056512068700b0051b5f9cac1bmr2252091lfe.37.1713818701094; 
 Mon, 22 Apr 2024 13:45:01 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z9-20020a19f709000000b00515cc918069sm1816413lfe.150.2024.04.22.13.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 13:45:00 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/6] Intel blitter framebuffer copying sanitizing
Date: Mon, 22 Apr 2024 23:44:35 +0300
Message-Id: <20240422204441.106197-1-juhapekka.heikkila@gmail.com>
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
mess a bit.

Juha-Pekka Heikkila (6):
  lib/igt_fb: fix intel modifiers for fb copying on xe driver
  lib/igt_fb: make blt_compression_format function more readable
  lib/igt_fb: Sanitize blt_fb_init
  lib/igt_fb: separate intel blitter context setup from blitter function
  lib/igt_fb: put intel blt cleanup into its own function
  lib/igt_fb: unify intel blitter fb block copies between xe and i915

 lib/igt_fb.c | 362 +++++++++++++++++++++++++++++----------------------
 1 file changed, 205 insertions(+), 157 deletions(-)

-- 
2.25.1

