Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3C3C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 20:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD67D10E19B;
	Mon, 12 Aug 2024 20:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L5OFpndh";
	dkim-atps=neutral
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B5010E19B
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 20:07:44 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-39b40ab3210so17996115ab.3
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723493263; x=1724098063; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cjxt22rJuiMbU8GdSjBOyo3k9cBH4KXti3Feph1A74I=;
 b=L5OFpndhZ9QP7wXqXxLFk+NqDR0XWYXHu0EqrfaLXRB2WhuyHSJ0IBGyjAy6OvBSun
 DkLsaqo3+xRNQ9+r3JIUnjfzuEX3VLppZX6DQ4e2ZlRd9XDls7s4socfDnN7/J9tl0Mq
 dodX4wf2ljqd+vJsRBly/O1ARnCMQhm2TC34JnDu3ebMa0nrkELjGRr8L/cpWxf1tMTi
 Ed8OIyjPJVvX69H6pRwC/lTNAcUMMlNHMKox1890WVnAN49cXj4n6gb/JwdfbIuUhi8P
 KztpphRHz1LgMusPRSMF9Nyw4O89O7IQG6IqI6MuIz0L+zuPdeFDt630CVJgZsa/shho
 qYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723493263; x=1724098063;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cjxt22rJuiMbU8GdSjBOyo3k9cBH4KXti3Feph1A74I=;
 b=THHnj9/LQejzWVvn92ePVahoIfYm+Az1UyWUOaVYbukgmeRm/SyTqstuoTGJgyR36i
 RjOWxWX0W6oyfxts+zGjyerQ+73yVac2kltgg6pJe+OTBAczFK29zR/vHQ8e9MvceFNY
 ut1Vm+c6VkeDlyFwkbU/3syPGIqKUkVPO0hFeU8Mz8DBZ3Un5C/RPlLhP/+TezaxTBsA
 I/yxAiYI+Dq4JgVsICD8xsp3fyNF3jJ2hr6ztG6IxNnODL1kmQvICXgtzIPscTbUazef
 Az7Ft5Yblyyp20n3KsKD88T31UyL3FZIslO3s6jhDVkmL9GF6Ahj82mvpzw5w1PejbsX
 HsxA==
X-Gm-Message-State: AOJu0YyBzl8RlP7LQPsOtjGxCF0rG3C8nt91CzQ8CRKclLkwHhrfgssV
 eqMzdn0FDJIftAXMhyYO7k+2pO1C8umNnyMYjn/koAfVj3JacgqFy+rrZHlStxU=
X-Google-Smtp-Source: AGHT+IELV1lTlfZ7MTTRZnfioM7MGD0sfW7eNmxiXSPzc1EQN7qz5hZehzxq0Gx8Wv7uz3k8A6baJw==
X-Received: by 2002:a05:6e02:16cb:b0:39a:e814:d2ab with SMTP id
 e9e14a558f8ab-39c478c3d94mr15274325ab.21.1723493263636; 
 Mon, 12 Aug 2024 13:07:43 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5873b06sm4542980b3a.10.2024.08.12.13.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 13:07:43 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/3] Add Xe2 ccs modifiers for Intel hw
Date: Mon, 12 Aug 2024 23:11:21 +0300
Message-ID: <20240812201124.2013652-1-juhapekka.heikkila@gmail.com>
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

Here is added support for I915_FORMAT_MOD_4_TILED_BMG_CCS and
I915_FORMAT_MOD_4_TILED_BMG_CCS framebuffer modifiers

Juha-Pekka Heikkila (3):
  Ignore. This patch need to be recreated later on
  lib/igt_fb: add Xe2 ccs modifier support
  tests/intel/kms_ccs: Add testing for Xe2 ccs modifiers

 include/drm-uapi/drm_fourcc.h | 57 +++++++++++++++++++++++++++++++----
 lib/igt_fb.c                  | 15 +++++++--
 tests/intel/kms_ccs.c         | 23 +++++++-------
 3 files changed, 76 insertions(+), 19 deletions(-)

-- 
2.45.2

