Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5728ED58D62
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 16:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EB110E69C;
	Mon, 25 Nov 2024 16:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WZX/kFwB";
	dkim-atps=neutral
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E0E10E69C
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 16:15:28 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-212581a0b33so45942435ad.0
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 08:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732551328; x=1733156128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y8NrbHyE/zDod9pfi/yj5CDbb6unpjBH3vjV/12fWXg=;
 b=WZX/kFwBlVFvApBW/qQpePo9rs5TCG91+6GpbAqLUjw5Ny5TxsFofRD/a6wEm5kSfI
 SxqWOOFXZ28avNAjjs4Bvy/t7xu+LZnnIRf1xC2HXa+7b2F6BKJq+D0N4pgwAJ+lfcKt
 Rci3q9jRRM4O8q6wx5mxkCFLEyAElhr78f86rpoi5W/+5Oqr0e1r55XLo1unWVIhv4Pm
 ClWWkzd1n/29Q70pdN0g7pz3r9St6l7DyBwfo8lGDorfTY8IwtX2+k0MvuKIqrrHqn2L
 GIkUk2qGZ3SSoZTW3VuaBHgaDCeqptN3Oyep9rNeM9kJam5Dz2Dtp2CdPqzGduAwG/Iq
 ml9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732551328; x=1733156128;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y8NrbHyE/zDod9pfi/yj5CDbb6unpjBH3vjV/12fWXg=;
 b=iB1vMivbbtx76WjSFMv1m8v/AJ18ClLy5S2Cxz9XVLBpD9cGpFf4qDP7aOi1SyTaga
 N/9RLbta1TAA7h8qpDQGHeUJ9Hql5MkpUlXN/kDyoqzRRWHLKfknJUwJzXxrcLJ6evav
 6du1pXxdytQb5iC3L04m7Fw7I4FmqjcqSD8UyV/BFooiE7b22qgu382hqJGORbZBbLAe
 K2THurzdqjUXhU21IVXGD+/f0Jy3DshmrKIz/QEf2TLAdJuFGTjF/Bx61m1U8UlGpR9b
 GScXDm5XMQNsW4XWNVFvBm3YwrssvU27eiUotgfTVtx9uq91OpqBgJzvo5z9VvkfjwD+
 Zd+g==
X-Gm-Message-State: AOJu0YxZGe5iFpjAcXCU35kuOEzlRTyIkfE2DHLF+tE4yKIQsq8I60Ge
 rdXC9YeQz+ioCryAU/M9SZjDKfUz0eaejqZhP5cTVhXuuqLdqkQrySKOUuHD
X-Gm-Gg: ASbGncsqUDe4IN4u7j7sw1/MI8A5QbbQp5mLxaguhHbbYMRSjF6kvgKtXc0UsDu0cMP
 PrSvx+2Rd8KU+GoBC8AIlJJhFJ/3665JBxy4hC1DoLzK1tc5mhStujSwGK3YAeEa2MCoWU2j+42
 cfGDp9qXtt7IOT48xp5Ku6qRoEjYqZD36aEejLSxv3XXx5cz7QeZVUuYWo1jYTpX1TOqbQJbASR
 XBqABfPCNuqnw//DqVYVqltvsVZCPYSB+wpSiyS24Fle0H1pOnDk8F2p4s=
X-Google-Smtp-Source: AGHT+IGN1GUfTv+mTJgiRQx2jBSP/sMBhQKNolF2kqU0HjbhWZAUe/8nobHi40a4GVJ+rFGzvxLrOg==
X-Received: by 2002:a17:902:ce88:b0:211:31ac:89eb with SMTP id
 d9443c01a7336-2129f220984mr171058125ad.11.1732551327400; 
 Mon, 25 Nov 2024 08:15:27 -0800 (PST)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129db8c7basm67005425ad.36.2024.11.25.08.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 08:15:27 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/1] CCS hibernate test
Date: Mon, 25 Nov 2024 18:19:57 +0200
Message-ID: <20241125161958.296816-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Here is added hibernate test into kms_ccs which does full hibernate along
with reboot back to same kernel. This test is not ci friendly because of
the rebooting hence this test is manually triggered for kms_ccs suspend
tests by adding '-r' flag to command line.

/Juha-Pekka

Juha-Pekka Heikkila (1):
  tests/intel/kms_ccs: add hiberbate test

 tests/intel/kms_ccs.c | 162 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 3 deletions(-)

-- 
2.45.2

