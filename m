Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315CED1039D
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 10:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5FF10E5A9;
	Wed, 26 Nov 2025 10:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SM1SMyzO";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF63710E52C
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 10:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764154569;
 bh=spd3sGeHufDzu8aD1MUvWyGgDF/BHCXB/HLe9TFNy2s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SM1SMyzOyag9nr9sifjr7BFzAjuF5wwywhvw5ChxR5F5osxbzuhSbzWrhclWLmxcv
 tt5tNtNs3GEIdf5IJfEgv4ms/yHxRsawZNNae90FcIqCAiBF0C5xxk4vD5q4l7cjB+
 Sb54oGGLSnfuzHIKjGxPJezVRe7AVrC8km0OBM+UvX0tjY06yOtSrhiJzTSp8pq7a9
 hxO31iW7aiGKHo2iba4TG3CAaWXzESu9Qhux19n1iw0G6LaNBLdoahjT468JjOCn9E
 rbE6jma5NqiWztAcFEvOHECmrsvUA3pmk24VgPLZSOFxIOSXqyJfsM94d4tnOm6sJ9
 fhySgAQkviuvg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D0F8817E110C;
 Wed, 26 Nov 2025 11:56:08 +0100 (CET)
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
Subject: [PATCH i-g-t v1 v1 2/3] tests/panthor: Add a test to make sure the
 buffer is zeroed at alloc time
Date: Wed, 26 Nov 2025 11:55:57 +0100
Message-ID: <20251126105558.3607460-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126105558.3607460-1-boris.brezillon@collabora.com>
References: <20251126105558.3607460-1-boris.brezillon@collabora.com>
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

