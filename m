Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4F0F53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5701310E29A;
	Mon, 16 Mar 2026 16:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QYuhLYFQ";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0926C10E29A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E9D4B4E4260A;
 Mon, 16 Mar 2026 16:23:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C07DA5FC4A;
 Mon, 16 Mar 2026 16:23:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 90E0310372203; Mon, 16 Mar 2026 17:23:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=R85mHCTJO68G7Nm02qnH/HifeyXjY+ub9U70DMwxD/4=;
 b=QYuhLYFQTSiu6m09USD3pu+swlqMUATi2fP9epmWQWGJhUl+eTCJa6FgC6elBQsm4e3byx
 PHlh16ZSkDfhcgMUROk3fDPLN+nn5PCPLmZ98cqoUcNUh/UIXh2As3wflorPf6TCbg0HtK
 lfJ0TasKcNiteD9y6j6wH9EFUzvoNgE5qnTFSOORTJSabC1asfe7uUt+lr7OUrVlXRm7Hl
 YC32deqW43CqdM1Kr/gl8Bk55xRAGY+ZHwQ9ynq8MsqwlyLwyANGRheaTtMJ+YEps7twGO
 hk4lNYYWeTyGLjf5gi4d1XSl5oXL50AnSjgs7396E5Z4o6PG/xKGS856127w1A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:18:04 +0100
Subject: [PATCH i-g-t v9 43/49] lib/igt_kms: Add asserts to avoid null
 pointer dereference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-43-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=705;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=xhRmXAcvGaX/LHZhSZxsF7ijVYM3O2IKyvfK0RJXoJg=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6P46RGmzxInZJDZumJxwy3++U7K+S43LgNb
 Q/Ep44L7UeJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLAUg//VJLl2qvWNnmRS8j6BGrBl78ZYIExGdt
 uSVPIzQBMT9Jlez01ISBgn+74f0HxkJHl0q875y9DqsT2jfImd851DbhZ4E+OPvqMRG1Bu8AXXC
 khxS70fg+BwOE1aGgBJcQj6mAAEJ9PxZHjR15h3GUL84dMRoo4gQlchc5DP1qhhY98FrAMWa74q
 Ox1L0J3Ix0T14PO6jeX7wtWx4A7Du2PyHoDkep4U6Jl9cWrZu0/kkbMjtl0J2Wik5b+QDVuYMEH
 bBvUt0zFyi4ZHcQPDarsLb3I+yshck9OOPo1jXogL4QwNvUk/F9J0PVJUzk68eLXAApD3sqjdtq
 sNYslS5b7VqDJMSM2HyCr5OYCd8RuUWEBNpAAu4qzhzi+5216AU80LuoHpG2l++k5Vd9X6prpWq
 bnsL7NvhFXi66vKOicoX2I1uWAYremF3DMFrZUgNaX1suktCrsExDjvJp5rKLTqdGrpaAcDfAop
 BFyUJqgMXtaGcYSeCaMZ9ZxBCNVYcjeL8aHLnnoZr72Fc/6H7Bff5sd65rV+0Fy1SvY8pkMTghd
 lv2xn4ltdtUSYwwb7kQvMMK0kb+hHGdaDYYEy4cNSQ7wrDA3HT5tjATaBqqxlyh7B3XYDzIRy8R
 GQt/y5TUAEHUvqrlHL9qSpSXecPe65KkyhuD7a1yXHfIP6HTmGtQ=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2f1f5cf4a5f3..81d5077b3acc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3293,6 +3293,8 @@ igt_output_t *igt_output_from_connector(igt_display_t *display,
 {
 	int i;
 	igt_output_t *found = NULL;
+	igt_assert(display);
+	igt_assert(connector);
 
 	for (i = 0; i < display->n_outputs; i++) {
 		igt_output_t *output = &display->outputs[i];

-- 
2.52.0

