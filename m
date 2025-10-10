Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9A2CCA476
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 18:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3842610EC73;
	Fri, 10 Oct 2025 18:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D+kCcm+u";
	dkim-atps=neutral
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B123610EC73
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 18:36:55 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b62fcddfa21so1502024a12.1
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 11:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760121415; x=1760726215; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eErKKvkPuNiiSSTQclNc/TDI1ohPTfpm7+Z7C0Em/rc=;
 b=D+kCcm+u0MKKu1lFuIk0LS9W/1SrKAsfc7HwIQIxBXzASqPKITuP9Bq42s0XCIvyyQ
 B9UosZG4e58c8M6ltxJMnS6XqFSoMA96b5FZ0xBPKtjROW+3tnfXScQVlqQdghmOYCYk
 exHI9ZxHGzfoCK1bguZuR2f1z42Recjec3w3RBqRKsGvHGSS1ZBqrMAcWMjn3rL+xwtz
 3zq87ZHhw0mSRMVswTAelbQbfHAkfH88gHlCddd45MdG3PsnqooPI7GCwNodHlwxd+Hl
 m7Db7XWLzBsi/BfMQwHfl+hQgeJNE9qIaT7LBQLAyUlfpIvO8Cb7Qws4UN/du9g9i0oV
 9DIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760121415; x=1760726215;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eErKKvkPuNiiSSTQclNc/TDI1ohPTfpm7+Z7C0Em/rc=;
 b=bOC+mdYNuUE5e5cx7jRiKWoQvMn9TS5jP9Buh54sFyrRTyQAvgyjJtDH0LpdPYoGKj
 7UrDi4IZjXUKJ1Qul7ncD2BHbACkhRap6klIAJ57bONYGu9PJV2JyuHlPXfptEhkoS1u
 NxXT/nGkaJLpE7e+YSTWlRJ85av75G+sH8I8srPTCQVl6s9iN/Amw/UvnGIm1sfIwXcm
 wtJHoDQms4bFi3N2HX1j4m14BFY5+u1I6cKM3ZTuS50kirRkqv0fMNQ6VjPzp0N4FO3H
 fU9vjRDPPYNyGFzzBKao6i1Er7vTxhkFJPEqfDa3rmyqNTJLuMU5N+suqM0pv10jEmYK
 hwvQ==
X-Gm-Message-State: AOJu0Yx2zGBY2YT7thf1jiAlTuicooAOIJ5CKjrm9cJF0rkXOfwE3DnB
 Ob2EjyBLs1cdmVyoXoBiM1YhfzPOrix4omKGTDI6Kqom0TExijlsIZwMHoIlFZl8
X-Gm-Gg: ASbGnctsJiQvdwUeODvoJ635Sw/T+qAQNZnzN60hh+GkpNilWFx1c6Vg0dVFOns8UHb
 radxabMNVkKJ0U8bsFAF8ZzDtOaprRTAAYIKR2DWrut9DFkSoKC8Hrzclc2r3d1Q4Ebo8ibcc7z
 IKoiMYXK3Rwqfd2vXAGu966UWQSN9DUJWX8sBtkEeJ3XgeGcEAHzL+tA3CkDmiVRPRHeiFJRoxc
 B5WqUkHzdyDY4t+rejvZZr/KeJwAkNGtNdchOrAcyW5xcpeGhASp43NANFzRVcq2H/PGkYfEtTn
 qy1tv7D0fYbzC0GGRZsF8wMcT1d23ixCqoMMMb3WwULrTuYNRrzE3Q0KfERFF5KTBDx3B01ZX4u
 JfiVKK6VoFEcokuR4BaUsFh0XhjD3RmgQNpMxr+PK/ETLKA==
X-Google-Smtp-Source: AGHT+IEL9SdgjA0MAD7lVyJxU/BPQW9ejb0Iu3PqimysaXUGoQo9sK4NBM4tT+1mS90qS4Iii6aASQ==
X-Received: by 2002:a17:902:ef10:b0:27e:eabd:4b41 with SMTP id
 d9443c01a7336-29027216505mr179511285ad.7.1760121414905; 
 Fri, 10 Oct 2025 11:36:54 -0700 (PDT)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f08e2dsm63083935ad.74.2025.10.10.11.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 11:36:54 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Jani Nikula" <jani.nikula@intel.com>
Subject: [PATCH i-g-t 0/1] [wip] Switch to use kernel standard fault injection
 in i915
Date: Fri, 10 Oct 2025 21:36:40 +0300
Message-ID: <20251010183643.1634589-1-juhapekka.heikkila@gmail.com>
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

Here added fault-injection subtest to test kernel standard
fault injection mechanism in i915. 

wip once seen what different platforms in ci say about this
will need to refine the test. Much of the meat'n'bones of
the test are cut'n'paste from xe_fault_injection test mostly
written by Francois Dugast, will need to see what parts can
be shared with tests and moved to libigt.

/Juha-Pekka

Juha-Pekka Heikkila (1):
  tests/intel/i915_module_load: Add kernel default faul injection tests

 tests/intel/i915_module_load.c | 282 +++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

-- 
2.43.0

