Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99341D116EA
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 09:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F15510E761;
	Fri, 28 Nov 2025 09:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jYEiIzTh";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF5010E04A
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764322748;
 bh=lw9JG2XqT1HWFCjiaS0mNFZ7BIQ6A+EiZO7jjsDlTPo=;
 h=From:To:Cc:Subject:Date:From;
 b=jYEiIzThshKfxAsKHQolrA2EtdnYV0SJ76oIoI+amQ/GN7ME88BW6jwS4OiR6iEFj
 R2t4j4OqOFTt5PSkXmCIisYnSk/w+m1KvFIuW3uJAuhJUUZjQlUEuwESF0soKRo8NQ
 cDucG/13v2Gld5jSmGSuOTEBa7GdvPin0Ri09MYiY3SkBvpHLDJp+pjt9K+KaT0NAY
 hJ7snMOBrjIvaBjb2d1Wtu1WsPkgB82tfDJqhkm2XxwH1+mu4VvFpZTQjdwnZ3Du2h
 1+8qk5Kvpt+1+3yX9w5PBwegddOxHI0pC0PDCX346tG9mmHCCAekQbDdi4fw9ZWiTZ
 Z7J74rqnKCbQg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 569B217E107C;
 Fri, 28 Nov 2025 10:39:08 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: [PATCH i-g-t v2 0/3] tests/panthor: Add more tests
Date: Fri, 28 Nov 2025 10:38:55 +0100
Message-ID: <20251128093858.3844420-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
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

Hello,

Here's a bunch of tests that were developped while fixing different
bugs in panthor. I'm posting them before I forget.

v2:
- Add some docs
- Fix commit message

Regards,

Boris

Boris Brezillon (3):
  drm-uapi/panthor: Sync panthor uapi
  tests/panthor: Add a test to make sure the buffer is zeroed at alloc
    time
  tests/panthor: Add scheduler tests

 include/drm-uapi/panthor_drm.h | 213 +++++++++++++++++----
 lib/igt_panthor.c              |  71 +++++++
 lib/igt_panthor.h              |  76 ++++++++
 tests/panthor/meson.build      |   1 +
 tests/panthor/panthor_gem.c    |  11 ++
 tests/panthor/panthor_sched.c  | 338 +++++++++++++++++++++++++++++++++
 6 files changed, 668 insertions(+), 42 deletions(-)
 create mode 100644 tests/panthor/panthor_sched.c

-- 
2.51.1

