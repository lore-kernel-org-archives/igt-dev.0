Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60492E77181
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 21:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA1310E580;
	Mon,  9 Dec 2024 21:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MiPBjtC1";
	dkim-atps=neutral
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393EA10E580
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 21:12:34 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2ef6c56032eso2599185a91.2
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Dec 2024 13:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733778753; x=1734383553; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IZCB1mfJISTmFo852Lu8RivkhRZA9zbzpY0Mr31KcdM=;
 b=MiPBjtC1m3E/Xc1jJzo2kz9plBjrItCtJrQR3QMutidUWMfHnOB6oziHBnAF9FfGoI
 vW5DwsFZWZNWEkOQNsxLtDCdlwaxhkXblCq2jAns/DocAeC4xP+FtU0pqQHMV3heA1G5
 FmstrXwVUPtAM1F06chNicgjNuByoc2hnfsFK7BArfh/jwsUcLugyCGa5ccIaH7rjRPL
 DpYgFX4kFB0JUF+2TUJakoVgVZxR1aNxm7r/qTZ4r+Db4usfBsdmDEJUFOuCMwqWMPW7
 S5qn6c89ohJNDpmoRsPFao/uwIt004FxwRWRK8GAToanyDycipNCbr+zPbaJwukG75v7
 95Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733778753; x=1734383553;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IZCB1mfJISTmFo852Lu8RivkhRZA9zbzpY0Mr31KcdM=;
 b=MLDeDS7VqkR2TcRkgZBGQMbWclCD2ZGAtuYj+ZMiCaa4LA0mTS16vliuEaOj++4Jni
 p1aUrv725HXyKRMV1rtCjWdwG3iyYtE1qKOP44DjnTGB52vOyGM7bpACi2B0RBY5X61m
 Kubepra5H+mS3za+Fp15u1E4mvUQbhorHbnh+Ru4Qmq7T2WRTpAQALf5jjrRislrtQF4
 S4te8Y27x5vFh6gt2pcWijCq0h8tbYjacQhcf2V5TkZsIWcfDXSh30z8sovzNo2FtpNp
 Q7EpfSGC9AcgadfCEPREX+hQBtWtrHmgW9wjnHlTn3upRYmlLbS3delqAvCEugjD2jr7
 UfUw==
X-Gm-Message-State: AOJu0Yz5xJFqZJYPr+aIAVqpBJ/tz3t83KS/Jcs7KQVVvEOe9Xw87HU6
 g7+1eJQUvytL8jU0fQJONVFu9A2yWNvyrmt9bqbwvpcMxL1/5osrAFuHOYiI
X-Gm-Gg: ASbGncuR9S6lHkd2/fHGoC7eJ3Ax2LGZS1kJsNPRtUrZ9zk+PwBV7DbvVQb8eMHrc//
 ZsnHr9jbeUvHiPjnE1BfDbTg+BF23o3iAWMJDYd1TdNmTYQ34tiiIT8uI5M4hvGMwjb6Ygz4ENz
 kA82ojU3jqDNW9LARPy8uokJQtb/9qt7Rx0j3b4VO/Hf/Jtnx2FX95P3FO92dT4lVRdrIEbow1O
 uKlvS977M/NerGAL30JCUaYeewHjLUFn26yw7idz90Cc9v85TX/mXUyfNRZfQc=
X-Google-Smtp-Source: AGHT+IGAtcklkQxp8n64YQTKsexcvs+HRFEsCYbfo+Gx/pTmQu45tz9Y1wuRAEL9snABrWRPtZqlzQ==
X-Received: by 2002:a17:90b:540d:b0:2ee:c527:2369 with SMTP id
 98e67ed59e1d1-2ef6aad0b4amr21152233a91.24.1733778753410; 
 Mon, 09 Dec 2024 13:12:33 -0800 (PST)
Received: from localhost ([134.134.139.69]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef85e30d12sm4816342a91.28.2024.12.09.13.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 13:12:33 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/2] Avoid Virtual connector or kms_cursor_legacy
Date: Mon,  9 Dec 2024 23:16:18 +0200
Message-ID: <20241209211620.3679545-1-juhapekka.heikkila@gmail.com>
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

this is to avoid issues like seen here with tinydrm:
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2340-9d12021e081c72b18c31bda175fb9a43f1d005fc/bat-adlp-vm/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

where it seems tinydrm is not able to create linear framebuffer

/Juha-Pekka

Juha-Pekka Heikkila (2):
  lib/igt_kms: add igt_display_require_physical_output()
  tests/kms_cursor_legacy: for basic-* tests require physical connector

 lib/igt_kms.c             | 21 +++++++++++++++++++++
 lib/igt_kms.h             |  1 +
 tests/kms_cursor_legacy.c |  2 +-
 3 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.45.2

