Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB807C0218A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 11:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B8110E234;
	Tue, 28 Jan 2025 11:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TlRRH1Sx";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C6210E234
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 11:51:15 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-216426b0865so90654995ad.0
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 03:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738065075; x=1738669875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dB2Jhbfq+wGdHFAqpUqHnLV/qU3P60WnpwWM6r/Nbz8=;
 b=TlRRH1SxC2omcJzZLfYs8IghIw/4UWV7BH9WLrRxT00sQ+2lZji+nFe+LGWIMlfBgg
 TV6Qh4uu+fQbDXRm19VDJrzTkHLitevjnP5DxlsU2KL+YpjfzcHS+gqxiq90+CYCGeHa
 Xpy6xswY6kKx1mEFUUAK9K70u+Uk6w7faGKYDclxjfrNUXTal662j7e8DtR0SleQzDIk
 odujYjrSjc9zVq/TSKS+UmE92RmQKmCI0Zzj0b3wsh4C37QE+90fpOeKlFV6/mHINoQQ
 zItslYH/dMQQRkr6Q8kMWPvYTy/Bc5QW6zWcbDpPG2BuvR6b55i5IfJWkgbl4vkwbpah
 byyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738065075; x=1738669875;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dB2Jhbfq+wGdHFAqpUqHnLV/qU3P60WnpwWM6r/Nbz8=;
 b=pgTAYd6eYL9b+0CRIQ5W/MFIyLH6pMNZRSzbQ/9u35pKH2ljKz9+KL2S0MXE0zP9Xj
 hAKPnzF+wKSUBA441KuPO1VgwN2TNCZoEhNuo4BkfXxvEGxCvP7ql+AJc6xAR79HwwkX
 C+8ez/7tgb6t2t2dt6etkUzTnsTu4YymFQkFja4JHKzetmDIHNc3exkluF6GlEaGNKnr
 EvSPQwC7CIRk2L1crTFY4/6R34SWqafY60DSaV6E1Tu8A1le4dKUl7v1V1YYzJfQA+2D
 pyhKPfTD6vZ1wsMX9sPXOaynJ9RFskKeIMNpMnUI/ciYtuD2Hsr08SyFVD10d7q4Ohv9
 k6Fw==
X-Gm-Message-State: AOJu0YwnDLMZwhTrV7USf0Haf3lJ/uBLRVxaIu8UbayFiiE+/AamYBDg
 S6rgOr1RpcVuMpSXR2eF5r70n/PcBChM9afwOZ0Hx1xvlrsFAxE/jbcaIWID
X-Gm-Gg: ASbGnctaQl+65cQnUFGwBMK6E5IXcS74ZOGfCFkv8wsEPfqIt245Lj2ap8dQYftdqT/
 smUVTf+Bx/HLUKQrTwUh//Z+vGUdlJl0Rc0D7f4zfZmQ6mJ7t+zIDZOfhGbIaHdtgj9GIlSIlN6
 KtlfNGbzobENComwGutCAlh2ZoddxCJaIxCeX9Yt5v3DcQT/CIT1QiCLECI1WiR5pTM3Z1UaZpA
 sJ2TmKYR/j7CPXQswXLY7ajAPx6CAL6RdnmEbnNQ57f0XW+bEvmsxXCa6vj68r3A8tBqsuz848E
 oZj2Rj210iQfY3w1gwRGsnCwQckli9FYCsY=
X-Google-Smtp-Source: AGHT+IG2TzlE4uYtLPgoopRwBO7OIyroE9q4DO+4GbbufDJWxTq8Y5F+S3KxKQ0HjhktIzAa9yEb5Q==
X-Received: by 2002:a17:902:c411:b0:215:4a31:47d8 with SMTP id
 d9443c01a7336-21c351bdb76mr639703925ad.9.1738065074761; 
 Tue, 28 Jan 2025 03:51:14 -0800 (PST)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da413f712sm78905355ad.142.2025.01.28.03.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 03:51:14 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 0/1] Add manual hibernate test to kms_ccs
Date: Tue, 28 Jan 2025 13:55:57 +0200
Message-ID: <20250128115558.1980222-1-juhapekka.heikkila@gmail.com>
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

Here added manually run hibernate mode to Intel specific kms_ccs suspend
tests, hibernate can be triggered with '-r' command line option, for example:

./build/tests/kms_ccs --r crc-primary-suspend-4-tiled-lnl-ccs -r

This test was written against Ubuntu and assume similar grub configuration,
matching to those images run by Intel CI, where resume point need to be
separately configured.

/Juha-Pekka

Juha-Pekka Heikkila (1):
  tests/intel/kms_ccs: add hiberbate test

 tests/intel/kms_ccs.c | 176 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 173 insertions(+), 3 deletions(-)

-- 
2.45.2

