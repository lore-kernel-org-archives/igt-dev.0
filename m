Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1076D21274
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 10:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7736010E1D6;
	Thu, 17 Oct 2024 10:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bvZi2nEs";
	dkim-atps=neutral
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474DB10E1D6
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 10:14:48 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2e30db524c2so574993a91.1
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 03:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729160087; x=1729764887; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6j2yZVvQ/g2cYID8dcw1BPoPBQg8uIj+OivjJmxIIo0=;
 b=bvZi2nEsH/paR2dvriU9GSoYW1Jf0bToXGAZZcqgw6lUzZFYoIBaYLw+7gJZYq0PaV
 sgoLu+liuunESUzcPqgvJ+62ETWO2UqkF+oudFrlm/XQd1OJrw+wDoWnqqx5iPLCWG9i
 mmiA/9WA9jZmY0tPDpYm2yk2l6gI54mHVxrhy9FyejbBk0odP6klx6TkDGdd6fzz0iN7
 LrOhZRckYX0hvjW8qcrkI4LdHRJLfi+YrHT4Lx5UADQlUCdY6OpcGoynMw84Rkpyc7fD
 fvLrRDE9btJQnAoO4N9vLAPY8XUiwJcCF27fhh0Av8xfd/+X+6iYTtGPZZDCemYPhTaK
 rjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729160087; x=1729764887;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6j2yZVvQ/g2cYID8dcw1BPoPBQg8uIj+OivjJmxIIo0=;
 b=YOnR6H0KrZqYImA2gSbI9mYiiJk7qk3aZHYG/LLx006vvbdOoXFxtQhtH/qRJ0O33n
 ptQ2hrkCRHFqSkP40Dh7Y+EkTvdsGho0GX/g8TXFc/DaU0GWFs+4P14JKtRBQGiBF0qp
 5AQWy8Nn1dAmax3oR7PnpW9Ds1Su5zH/U7Tbcoz7iaRsLArzz0hgky7L3cntqQHZbXDn
 0FKILFvNeBvBcVd82Z0kAWJborY+JnN/KFaZeTRuEEKEOvYd/bL0HchoDTRFUI5ubkhZ
 fFagrtpF+Us/XWEUh41vLhQilPDeZfWmbvVa4fXySTJo+IlOKBlZrc2o/58dRoHuIBXU
 oDmA==
X-Gm-Message-State: AOJu0YyNLSBQ8vXnWdEqg4D5eEzkUL5F0VglNzrGFpYkZFhG220eSePa
 +OChY2mfYeRZWH0u/9+aGVT7zCCiWK09WQINCtMceeRoaYOTvzXOVjF6zPE/YgY=
X-Google-Smtp-Source: AGHT+IEMcBeEuVskpVmnvOhhVzxqZZ4ckLtYjyrkqaXe4ebwFvoYW7MLwmGXtXpXjBuDB+WYFacNDQ==
X-Received: by 2002:a17:90a:db43:b0:2e2:b6c2:2ae with SMTP id
 98e67ed59e1d1-2e315371219mr23972910a91.36.1729160087225; 
 Thu, 17 Oct 2024 03:14:47 -0700 (PDT)
Received: from localhost ([192.55.55.48]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e3e08b1783sm1491647a91.7.2024.10.17.03.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 03:14:46 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/3] kms_ccs optimization
Date: Thu, 17 Oct 2024 13:18:29 +0300
Message-ID: <20241017101832.3471966-1-juhapekka.heikkila@gmail.com>
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

Here added possibility in igt_fb to create Xe2 ccs compressed framebuffers and
take it into use in kms_ccs test. While at it optimize test execution.

/Juha-Pekka

Juha-Pekka Heikkila (3):
  tests/intel/kms_ccs: recycle framebuffers
  lib/igt_fb: add igt_xe2_blit_with_dst_pat function
  tests/intel/kms_ccs: use igt_fb functions instead of locally defined

 lib/igt_fb.c          |  65 +++++++--
 lib/igt_fb.h          |   3 +
 tests/intel/kms_ccs.c | 317 ++++++++++++++++--------------------------
 3 files changed, 178 insertions(+), 207 deletions(-)

-- 
2.45.2

