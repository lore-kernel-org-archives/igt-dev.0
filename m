Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC62BE6C61A
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 09:20:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE9210E155;
	Tue,  3 Dec 2024 09:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iiw+cxmc";
	dkim-atps=neutral
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8843A10E155
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 09:20:00 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-215b4681c94so8209985ad.0
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Dec 2024 01:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733217600; x=1733822400; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tzDax/MtWAGTHdQ4cZn496VDapcOPFQ/4N24DQxUOfQ=;
 b=Iiw+cxmceSgQ2IcZkCkMAJ2Uy3/LalX4ECMBwDE7V+t4MD9Ffm0tyI7dd1cj7bU1GZ
 T4eZvPyWfcsYS3hhsJbBrNZpxGxqouvCU764d4Cq4TXL2HCzahAEmKfNbqpoIvmVUQrQ
 O9Gh3tMF3xeqrCrlFPKOBkcc6u2CINJ5Y5QJPj9/GNUdaPK+KP5sTiV/9sbPdxmU3x34
 D8DxXZ2L0dLmvh1HO++MzwVNw2leQl01rQFsDXprL8mYdlyPW4zClankRdWcsRHdVFXM
 v94fd/KguELJN0FhskIhP7SYg17LtLRJmManf+p1dY40oYuwjXNJbQi2Gp7Xh34F3F6j
 K7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733217600; x=1733822400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tzDax/MtWAGTHdQ4cZn496VDapcOPFQ/4N24DQxUOfQ=;
 b=hfwAl27YogEn9Ja9Elj9uVEZONKxkGUfNPrAwIOHATEXzjPM8tqBqufgVlWLeSEJSG
 BSpZHHPXMsLUG80Mz6s+51Jv97h64K9kND3ug1uayb5Mj7p2w8IAfzjM98rpo1qCC6RT
 psr2/6q+BfSkoZVsv4TRcRMLTulr4ZB4+oVPdfM24r2Wg5jWXTbE9+PEB4Xx5PugU1S/
 KPgFh62LBNYxPxF/1qzUsnnQ3ie6IuKcknN/0z+QcQzjf4sdhE/5TE7cUCx+5vyO2EM2
 v/4V3iACxiiokn3ldscE+mq8LktYvP2RnmEBEsrAyCbmBfUhzlwVGlz5O/syuEJvwSE3
 kzAQ==
X-Gm-Message-State: AOJu0YyzZSrvNvOkyr4DANmZPemQu3ZKmWdQcZwSthKSELXlukMm4S9f
 f6fQF9O5m2Z6xWy1QNsRJ4ig4R5AUaFpQKFbV1cHjPQGALGpkfrYsUAwpumE
X-Gm-Gg: ASbGnctVwxQaZy2RSastYtpmlTkqxk0bGjj1xpXnwuuMQ8dBn4kVSne2q2Ir6UVHLTY
 yd2jH9PGftXGbYQKexUBGMb20MVBL9WWp+XNOtVomyXfRnh4AbtBQTuVhQBPM0ew5Rd917XS02N
 J+EakfuQyWmcJKS+ygQeJyx4GCzzKwAHleZnGnXy5X1Jw1JO+DHXY5dHB9jBs0gJoQGdrKlB29r
 K/rqttKNzKRcOjoBZ6cVTXtgFetMpSxXgpWDyVFAp8hT87TZjSb2aA=
X-Google-Smtp-Source: AGHT+IHPZyueZ0Np9S3ibdogzkh4tpD+coD++Q3aXgdtlOWQGgzaSC4yQEuNeqnF6RMhWeSP2Dhg7w==
X-Received: by 2002:a17:902:e847:b0:215:827e:649c with SMTP id
 d9443c01a7336-215bd161d84mr21047665ad.37.1733217599717; 
 Tue, 03 Dec 2024 01:19:59 -0800 (PST)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2155abd92ecsm55086845ad.200.2024.12.03.01.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 01:19:59 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 0/2]  Add hibernate helpers and kms_ccs hibernate test
Date: Tue,  3 Dec 2024 11:24:16 +0200
Message-ID: <20241203092418.3454357-1-juhapekka.heikkila@gmail.com>
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

Here added manually run hibernate test for kms_ccs. Currently Intel CI
is not configured to test real hibernate hence the new test cannot be set
to run in ci but it can be triggered on commandline in kms_ccs suspend tests
by adding '-r'.

/Juha-Pekka

Juha-Pekka Heikkila (2):
  lib/igt_pm: Add helpers for hibernating kernel
  tests/intel/kms_ccs: add hiberbate test

 lib/igt_pm.c          | 155 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h          |   2 +
 tests/intel/kms_ccs.c |  20 +++++-
 3 files changed, 174 insertions(+), 3 deletions(-)

-- 
2.45.2

