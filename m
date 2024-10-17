Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18BCD2127D
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 11:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8582C10E316;
	Thu, 17 Oct 2024 11:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S+K/1A6O";
	dkim-atps=neutral
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B463110E316
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 11:23:43 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2e3686088c3so628832a91.0
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729164223; x=1729769023; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fg8GkBu1idwPrn1RHeAJnQfxsDnu5uwUzXp/BFoTtpI=;
 b=S+K/1A6O2FFdNRxVl8dTpMWLt6vF1q/Tk3/OV+8Q/kwESeUgWia6LN2D3MS9//VTN/
 Fj8RK4TNwuGtZeCe4S5e5uyIJfnmSau2jS5xxqzQ4ql/ayDVPIVjVbrKx1bwrUwis299
 ETdNHopySZvQyg/+wG+UkU8ek4Gcpm/0gp/pI0aaFiuL7arW1gooDvm2Clo6RjDao1QM
 Pguf8XU4HM7d9albbZ0le2tQ1NliRqLPrw0rQinlQyFOO8oML/KEUmgyEEj9FEQjTy9J
 56HLrcRJZdMRieeq27AxcSJAFxzcanvgkfuIS5FxD5PUuBr8DP2PC5ymiS3paal/7x3P
 fFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729164223; x=1729769023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fg8GkBu1idwPrn1RHeAJnQfxsDnu5uwUzXp/BFoTtpI=;
 b=vfBEAhboavgNu3t9aC9ufcBBNbSAdYOym0wOs331HFYPxeMiAOG3sV7YLEsqMNhGXN
 rxRjA54zs9NvizQIkuAzHh/kwsieGoe6fMQDhyzWT5JPmYCdFNyU24my81Jqw+k/rK0l
 CtC4X9rdmPD3jW24aliwh39f0l8gJrIrT2ZdBqihpPc4ZD9ZNQWyEwYPzP/OjR1hpn0r
 DvYMlXTh8PVoPdzxsT+WtSlbT3utqlKxdIV6ESU0ThdEHWSB/kaCWoepLfD/3bserAV+
 6rLD3O2/x0ggsdvDPSbR/gaLl6dJuEk6BuZwEjznaj6T/UajGfrglb0u4Fao4tDlcuHd
 vaNw==
X-Gm-Message-State: AOJu0YwnONmxrw+4eMuEwan9z3HV+vmp+06Qxp4aZpzdxquTVo8jmL8S
 ZvcUTrSC/lamk1LqRIi/tUUqRnGjdDjUHLSLa8OO+6p3LiyyEW+qwL/u5/l3cgw=
X-Google-Smtp-Source: AGHT+IEMtUupl104I+gDVb0HuVC2rfxDfDW6vE6dGdWZm9Z4Pty3H8Ouaom81w3UfOMh/rfYO9Wa7Q==
X-Received: by 2002:a17:90b:2242:b0:2e2:a667:1a10 with SMTP id
 98e67ed59e1d1-2e2f0f08c2emr24002670a91.38.1729164222896; 
 Thu, 17 Oct 2024 04:23:42 -0700 (PDT)
Received: from localhost ([134.134.139.75]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e3e01007besm1656214a91.3.2024.10.17.04.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 04:23:42 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 0/3] kms_ccs optimization
Date: Thu, 17 Oct 2024 14:27:25 +0300
Message-ID: <20241017112728.3503205-1-juhapekka.heikkila@gmail.com>
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

v2 with small polish for things noticed after v1

/Juha-Pekka

Juha-Pekka Heikkila (3):
  tests/intel/kms_ccs: recycle framebuffers
  lib/igt_fb: add igt_xe2_blit_with_dst_pat function
  tests/intel/kms_ccs: use igt_fb functions instead of locally defined

 lib/igt_fb.c          |  65 +++++++--
 lib/igt_fb.h          |   3 +
 tests/intel/kms_ccs.c | 322 ++++++++++++++++--------------------------
 3 files changed, 180 insertions(+), 210 deletions(-)

-- 
2.45.2

