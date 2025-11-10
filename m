Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05038CD1297
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE84210E3BA;
	Mon, 10 Nov 2025 13:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="vV9ZVhxC";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4F910E3B9
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 934674E41609
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6A878606F5;
 Mon, 10 Nov 2025 13:40:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5DBB61037191F; Mon, 10 Nov 2025 14:40:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762782008; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vzeG3guB0/AvkIgdwetjHN1P3J+jBsJ1ZUddNs3YsWw=;
 b=vV9ZVhxCHcRQHzbmIV79Nxm4gsj27nymq2WklFObHl89d2Rlkm/PfyYxv+g+J0Si7P26o5
 wRrq28kVmTde6fKZqGnbyRD86+Zbp7GBlt1AzFmdC9I2LEL56pl6zoQSyfncszLHdTRBMA
 +qIXbcHjNmJQ3XimbBeQDeJY1K9fC123nE7DMxtxwxCkPj8sP9eRa6FIj8USxFZp+mG38g
 GoP0pv9peUqjrKw5s+79Kb9E6p5gsf9kC9bMIN7JiWlcgR2lI2ve7u2Vn27g26SlX/TWen
 GNDNiMAH50BYq5AJf0etP8jKKCx3iIZWlCJASXsfci00sEXuyF+oXyysqR6Lfg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:45 +0000
Subject: [PATCH i-g-t v4 43/46] lib/igt_kms: Add asserts to avoid null
 pointer dereference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-43-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=649;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=FwvsTg87U2UpWAvURZ7nihkFfkhago9B2auBVLDYuWU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesUHKLmgyD8Q3/sYttd7JNRThxXDk8MjWLE+
 SPszOKsvnOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrFAAKCRAgrS7GWxAs
 4qQ7EACs7w9BFX7T6Vpuhqzbw81r5B5+CyosHjBQNNPWCjDxW+svUg0oKKV7QILzEWNYl5duQJ5
 dZk8zEaeK4axZt1+fsQLyI4mklVlwBr1HPJbOe5oWy9qjgNwJ2T8RW7A81pEmJaQKECZwMjpFK0
 8EBMm+MTdDb4xgZAKeJZtJDd1JuIRG7yxmPJ2fiSUVsQVhb5/ukycWR5P5ZnFgad+vhW6qVwjnQ
 ZmcdGLEGFNIvFArQkLirDQLGR3ybH8lNblXPyyTZC3my1EOQA/nne/pFjy9ZE/4a9QuUO9zJIzd
 0Fl8pCgu9A9aSqd+6/tHCC6Tnsz5rcFReF8J158F1oV5E7LWJPioJKDIdmeOBTX2pKGDxjWaADB
 Lt1NmpHsnGAloLg8PtwvE3nmvd0H8RQR3UQo6yttHKrelFNhWMh/O49C4Ufy2ND/ruLmTq5n6HO
 DN4R7aCoabaZOQkdLqwUphnnjh1GozrncGkd94aKMz+lwGSIayH4YCjYSaEG5n7W6MEGTIGj1Px
 BphJbryQ9R8DTlS6EZxW1QFoLZDBpWel4OcDJlcRcyyyqZC+KwukH21w1T4OEDbnU+rxrcTI9pI
 CWqCUJZJGxSvfx/OwgEODxktzX5pidtB9/wYW9BIRK2K6pnEupjVuCukTEV7noIN0JA5zJCejvb
 9Ec22Pxe/fSfOcA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

To help debugging and avoid null pointer dereference, add some asserts in
igt_output_from_connector.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 326dde1fba33..b3178ace4a8c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3184,6 +3184,8 @@ igt_output_t *igt_output_from_connector(igt_display_t *display,
 {
 	int i;
 	igt_output_t *found = NULL;
+	igt_assert(display);
+	igt_assert(connector);
 
 	for (i = 0; i < display->n_outputs; i++) {
 		igt_output_t *output = &display->outputs[i];

-- 
2.51.0

