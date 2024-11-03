Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2E5D1266B
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 08:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2EA10E2BC;
	Tue,  5 Nov 2024 08:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=atlas.cz header.i=@atlas.cz header.b="LJTu1faO";
	dkim-atps=neutral
X-Greylist: delayed 459 seconds by postgrey-1.36 at gabe;
 Sun, 03 Nov 2024 17:26:27 UTC
Received: from gmmr-3.centrum.cz (gmmr-3.centrum.cz [46.255.225.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C6710E258
 for <igt-dev@lists.freedesktop.org>; Sun,  3 Nov 2024 17:26:27 +0000 (UTC)
Received: from gmmr-3.centrum.cz (localhost [127.0.0.1])
 by gmmr-3.centrum.cz (Postfix) with ESMTP id A74A8200B843
 for <igt-dev@lists.freedesktop.org>; Sun,  3 Nov 2024 18:18:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlas.cz; s=mail;
 t=1730654325; bh=dyH6WrISaZ9JJAenud52RF9p5J4TJIa943DmMQ+lXPI=;
 h=From:To:Cc:Subject:Date:From;
 b=LJTu1faO2+rBFjgoBVDw8Gdp86x2+RJ7pgf5gfPVqbuk6InQ1v/+8GYftliyiGopC
 c5s5HuyJWwtEgBOMxvmGx2a0opqNpGw7+LJbT7HxnbrGHXZo5U46x61v0pYO1fIXbZ
 6FvJYrkUBCElGHKw8hWgs91AtTK7KnuaTbIuaBQE=
Received: from antispam22.centrum.cz (antispam22.cent [10.30.208.22])
 by gmmr-3.centrum.cz (Postfix) with ESMTP id 9E246200B5EF
 for <igt-dev@lists.freedesktop.org>; Sun,  3 Nov 2024 18:18:45 +0100 (CET)
X-CSE-ConnectionGUID: TcY2gFQdR5aUGP8ymz9QOw==
X-CSE-MsgGUID: /Ma3leF7QYe5YSKCUFY+dA==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2EVBAANsCdn/03h/y5aHgEBCxIMQAmEfoFxhFaST4sXh?=
 =?us-ascii?q?jWBIIxJDwEBAQEBAQEBAQlEBAEBhQeKNSc4EwECBAEBAQEDAgMBAQEBAQEBA?=
 =?us-ascii?q?QENAQEGAQEBAQEBBgYBAoEdhTVTgmIBhCkPAUYoDQImAl4TgwGCMAEDMa4vg?=
 =?us-ascii?q?TIaAmXcbwJJBVVigSmBGi6ITAGEeYYpgg2CUIItiB6CaQSHZiWJFZc7SIEFH?=
 =?us-ascii?q?ANZIAERAVUTDQoLBwWBeQOCV3orgQ6BFzqBfoEiSoUbgQWCSmlNOgINAjaCJ?=
 =?us-ascii?q?H2CToUfgQ6DYoRqQB1AAwsYDUgRLDUUGwY9AW4HnUtGgyiBDskZhCSETZxyG?=
 =?us-ascii?q?jOXSx4Dkl8umEmkO4RmgX6BfzMiMIMiUhnWcnc7AgcBCgEBAwmCO4xlgUsBA?=
 =?us-ascii?q?Q?=
IronPort-PHdr: A9a23:9fxdqRAJtQ7b6p5KDBdvUyQUtEQY04WdBeb1wqQuh78GSKm/5ZOqZ
 BWZua41ygWYAc6KurptsKn/jePJYSQ4+5GPsXQPItRndiQuroE7uTJlK+O+TXPBEfjxciYhF
 95DXlI2t1uyMExSBdqsLwaK+i764jEdAAjwOhRoLerpBIHSk9631+ev8JHPfglEnjWwbL1uI
 BmsswncssYbjYRmJ6s11xDEvmZGd+NKyGxnIl6egwzy7dqq8p559CRQtfMh98peXqj/Yq81U
 79WAik4Pm4s/MHlugHNQgSW6nYCXWsYjwJEDAfZ4h70WJfxqTb6ufFm2CaGJ832TKs7Viqk4
 qx2VRLnkiYHNzo+8GHKlsx9ib9QrRy9qxBjxYPffZqYP+RicKzDYdwaRHJBXsdPWCxHHoO8d
 JYEA+4YMepFs4Xxu14CoB2jDgeuGezv0CdFiH/o06AkzuovHwLI0gsvEN0Sv3rZt8n1OaQIX
 Oyp1qTE0TfOYvVL0jn98ojIdRUhrOmWU71ubcrR01QkGAzfgVWWt4nlPC6e2+MXvGiB7OpvT
 +evhHQ9qwxquDev2sMshZPSho4P1l/F9Dx0zYAoLtK3VEB1e8SrEIdMty6ELYt2RNsvTn10t
 Cs+1LAKpJ62cSYWxZkmyRPTdeKKfYeG7B/+SuqdPCt1iXB4db+ihRu/8Emtx+z+W8S1zVpHr
 iVIn8TNu30Lyhfd6dCHR+Ny80qgwzqDyQDe5+FeLUwqi6bWK4Qtz7wym5YLr0jPAyH7lF/og
 KOIakko4Pak5uv7brn8opKRNol5gRzkPKs0gMywG+E4PxALX2ic5OuzyqXu/Vb8QLVWlv02l
 bTZsIzCKcQbuKG5BwhV354s6xa6Fjumy9EYnWUfLF5YZB6LlZTmNE/IIPDkF/e/nlGsnC13y
 PHHJrHhA5PNIWbfkLr5crtw6lRQxBQzwN1f/Z5YFK8NLfLpVkLzttHUFho5PBa1w+bjBtV9z
 IQeWWeXD6CDKqPSskWH5uc1LOmWf4Iaoir9K/w/6P71l3M2hV4ccbGz3ZQLcHC4AuhmI0KBb
 HX2mNcBEn0Fvg8kQ+zwk1CNSyJTZ3KoUKIn/D00FIOnAZ/ZRo+xmLyBwDu7HppOa29cF1+MC
 3boeJ+CW/sWbCKdONVhkiEBVbe6VYAszg2htAj+y7pjNOXb4SoYtYj529Rv++LTkhQy+SRuD
 8uBy2GNU310nmQQSj8306B/vVVxxUqd3qhmmPFYEd1T5+hVUgchL5LcwfZ6BM7sVQ3cYNiJU
 1WmQsmhATEpVN4xxMUOY0llF9WklR/MxzCqDKMNl7yXGJw09brR0nbpK8lgyHbG1awhgkE+T
 MVAO2KomLJx+hTVCYLRjkqZkryldb4A0yPV7GmN1HKAsk5AXA5rSaXFU2gSaFPPo9rh6U3OV
 6SuCawpMgRZyc6NNK9KatrxgFteXfntINvQMCqNnDKcCAiFwrSUaYfsZy0Y1STZCU4L2wQS5
 mrOOw8kTgaOnyrxNAEmKVXoZ1ikpehxtDa3Q1EcywCRc1Yn2aC49xIYnv+ATOtV2agL7nQPs
 TJxSW6ww8ieNdOGBAkpKKxGYto46U1v3H7dvhc7NY72fPMqvUIXbwki5xCm7B5wEIgV1JFy9
 BsX
IronPort-Data: A9a23:mEuX5KC2yPIs1xVW/y7iw5YqxClBgxIJ4kV8jS/XYbTApD9x0TxUz
 GBLXmuEMv+IamCnKY9/bou08hwDsZLXn9RnOVdlrnsFo1Bi8pOZWIvDfi8cHAvPdJGZHBI/h
 yk6QoOdRCzhZiaE/n9BCpC48D8hk/jOHuehYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArlV
 ena+qUzA3f7nWctWo4ow/jb8k825ayp4GlwUmEWPJingnePyhH5M7pAfcldH1OgKqFIE+izQ
 fr0zb3R1gvx4xc3B9q5pa3we0sMT6S6FVDmZq1+BsBOKjAbzsAD+v5T2Mg0MC+7uB3V9zxF8
 +ihgLTrIesfFvaVxLlCCUkw/xZWZsWq8JefSZS2XFf6I0fuKxMAyN02ZK060BFxFk+azgii+
 NRBQA3hYCxviMqKy4PhRcdViv5+JfTEBNMOv2Mx9BbGWKNOrZDrG80m5PdX2XIrg9xWRK6Yb
 McfdSByaVLLcXWjOH9LVtRkwbru3COiNWIHwL6WjfNfD2z7xRZy2b3kKvLcZtiDXoNejC50o
 0qcoDykU0hHaYT3JTyttVel3evCs3zCaY9PJYab3cNEsR6f7zlGYPERfR7hyRWjsWa3QdFWL
 kUO0iMyqaEpske5JvH0Uwe5qXjCuhcGRt9aHsUx7wWJw6DT+Q/fDW8BJhZAZ8BjuMIobTgrz
 UOS2d3zCDFjvaaWVXWFsLCOoluP1TM9cTFEP3JZC1Ffvp+8/+nfky7yczqqK4bt5vWdJN066
 27bxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:wkGA3K55UB5AkIdkGAPXwNnXdLJyesId70hD6qm+c3Bom6uj5q
 WTdZUgpH3JYVkqNk3I9errBEDiewK+yXcW2+gs1N6ZNWGMhILCFu5fBOXZrgEIYxefytJg
X-Talos-CUID: 9a23:4HCMpGFxynx210bUqmJb/39OFe4cfkeAxUr/Gx+pDHQ4cZqKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AMo59jA3adQ9GSZIHnWyHmZ1hHDUjpIGnU0QAv8o?=
 =?us-ascii?q?/isTZBBdTEAqzvXe7a9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.11,255,1725314400"; d="scan'208";a="270591550"
Received: from unknown (HELO gm-smtp10.centrum.cz) ([46.255.225.77])
 by antispam22.centrum.cz with ESMTP; 03 Nov 2024 18:18:31 +0100
Received: from localhost.localdomain (ip-213-220-240-96.bb.vodafone.cz
 [213.220.240.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by gm-smtp10.centrum.cz (Postfix) with ESMTPSA id 3B4F2808CACB;
 Sun,  3 Nov 2024 18:18:31 +0100 (CET)
From: =?UTF-8?q?Petr=20Van=C4=9Bk?= <arkamar@atlas.cz>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: =?UTF-8?q?Petr=20Van=C4=9Bk?= <arkamar@atlas.cz>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH i-g-t] lib/igt_profiling: add include for PATH_MAX constant
Date: Sun,  3 Nov 2024 18:18:06 +0100
Message-ID: <20241103171806.10248-1-arkamar@atlas.cz>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Nov 2024 08:48:44 +0000
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

PATH_MAX constant is defined in limits.h header file. It needs to be
explicitly included in musl environment as it is not transitively
available for any of available includes.

Fixes: 9366bee04d16 ("lib: Add DRM driver sysfs profiling knob toggling functions")
Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
Signed-off-by: Petr Vaněk <arkamar@atlas.cz>
---
 lib/igt_profiling.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_profiling.c b/lib/igt_profiling.c
index b61506742..e1526ad98 100644
--- a/lib/igt_profiling.c
+++ b/lib/igt_profiling.c
@@ -10,6 +10,7 @@
 #include <assert.h>
 #include <dirent.h>
 #include <fcntl.h>
+#include <limits.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
-- 
2.45.2

