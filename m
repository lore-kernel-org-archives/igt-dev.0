Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6358DD116F5
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 09:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A3910E7A2;
	Fri, 28 Nov 2025 09:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Dl332sTr";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C9410E04A
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 09:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764322750;
 bh=hmIN+ScTAV+FZtm5lW28uLG3iK86qYwpc91AgMYGVeg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dl332sTr+IgN2XVb4HF6N9wz8wF+iohZUXbfv2N0EuMK+zsMtBhIWYK2kBZu0ywjP
 czB0pswMlbOlCpeCrg4vKX8znbKpfRTFFuryvng+hkRs6eWTRNifV5PjKDGylZ8VG4
 MYZXHb5/VudY91StcbNdqjMDraztDc3eoHvnBsF81hq5nz6gVLctSS5IUzzkR+6GFH
 FNzMbqTdwHhlWwT9jZgowLtHJg5UAHbLNuNRBE6XJGNpUOHee7whjm6PIvXY6mp7bW
 w8sq1hHanG0aSpWHY/ZRLq904a9WxcmQBiSyejUEg8rmEaiNhAj2PP8rRW9VIb3t3O
 c9nWOMijrm6Tg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 87E4717E10F6;
 Fri, 28 Nov 2025 10:39:09 +0100 (CET)
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
Subject: [PATCH i-g-t v2 2/3] tests/panthor: Add a test to make sure the
 buffer is zeroed at alloc time
Date: Fri, 28 Nov 2025 10:38:57 +0100
Message-ID: <20251128093858.3844420-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251128093858.3844420-1-boris.brezillon@collabora.com>
References: <20251128093858.3844420-1-boris.brezillon@collabora.com>
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

This covering for this bug [1]. Add an IGT test to make sure we don't
hit that again.

[1]https://lore.kernel.org/20251107171214.1186299-1-boris.brezillon@collabora.com

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 tests/panthor/panthor_gem.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/panthor/panthor_gem.c b/tests/panthor/panthor_gem.c
index 57cd97e809fd..1566c713f876 100644
--- a/tests/panthor/panthor_gem.c
+++ b/tests/panthor/panthor_gem.c
@@ -66,6 +66,17 @@ igt_main {
 		igt_panthor_free_bo(fd, &bo);
 	}
 
+	igt_describe_f("Check zero-ing of buffer at creation time");
+	igt_subtest("bo_zeroed") {
+		struct panthor_bo bo;
+
+		igt_panthor_bo_create_mapped(fd, &bo, getpagesize(), 0, 0);
+		igt_assert(bo.map);
+		igt_assert_eq(*((uint32_t *)bo.map), 0);
+
+		igt_panthor_free_bo(fd, &bo);
+	}
+
 	igt_fixture {
 		drm_close_driver(fd);
 	}
-- 
2.51.1

