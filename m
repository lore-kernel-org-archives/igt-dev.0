Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6C010F92E3
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2B910ED2D;
	Tue, 31 Mar 2026 17:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="wTmZ5dBS";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A1510EC48
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CE3F1C59955;
 Tue, 31 Mar 2026 17:11:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3806D6029D;
 Tue, 31 Mar 2026 17:11:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 38C61104504A8; 
 Tue, 31 Mar 2026 19:11:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977086; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wjU8EP8n1pToO8GCC1yu+O7HOxu7mOVrheelHB0yhUM=;
 b=wTmZ5dBSe3ZJB/00WNc88ZB+XMftSDw/S2BGsRqf7qsn/U+lkkQ2iAa7E5uNeQ8lSskozz
 9rQKK5B0FZanroh4XjD9A12R1+So0xcKUmSDRMb2geRNIz0XOD3nO/Dwqfl6Zt2ygGQ7F4
 EGDMmt4IKT/Swr3PZrOT1J3hPHVbNAZlPpVq7Iiyk2K/31wKW/xf3y9vMefM1niId9SV4z
 rTfgpvA51lkxWCiVfK/8S0IOJOhQmhHaJilazzeHYVCrH3AiqT3UQG6EfWzj7V30YQHoBK
 PAEENoWV8kFE+/MXAA+oQ59quQL5Z3Bvx5TEGXSWfvNm+cLfMLSknqv4AIG4Zg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:12:00 +0200
Subject: [PATCH i-g-t v10 43/49] lib/igt_kms: Add asserts to avoid null
 pointer dereference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-43-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=705;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=FAYAU6ld1SdE9WUPYoO2f0pm4dJ74r+Hg3YLX7XD184=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzABB6ftd90PlicPhuypRFTkEydBARaEKa3dLp
 acCI0Gub3eJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAQRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJv6g/9GAJlO7cGzkRGWaB7K1USvzTRAKDyTt0
 yWrDjc+IVsX/kUEHo82kosfvoxrDETa5Hl8cV3w9tlgfWwlNUNjlP+4jdwDavvCASn5CNsjKDmp
 d9IGFYK1rrKwnSd5YgizbbmZu92n5AeTc0fwv08V3B1loqn6SVAx+1s0kJ0rf3+L0Iv9wTmQFZA
 h2b8s7MJg+quBjHC2MecJBf1ow7FoOnoXZPSZXi0gvVSUd4hRTNdMsnkHPCwC91g6+H6M9nQoqc
 RWkRP2/UaInvN/LAa7dHFBK9eki/0Ww3Rp1Qv2XzUdNCRMZZ1nWJkuyrbPwJmBTlZp95YUsQk5d
 +aCOYRkgew/bk3AZI67YU2ZVhj0EuoSPD5vW8rTV0mzX2SfU0mr1bfQ6GYL/MOgCHGi4v/XRgYO
 AJDC9VIg/q+ngnNmWEo02drY97YC1N8W+IL5NLlw/vQZbaa6pS4wSaNybgJOCzgvs2zX+Vmq5j0
 RlPlgYey0gIuXNjnzmzpsWDbnDj850kFtyaetmW4/yduRMjvNKx8nw/6Rjg6DURr2Hu6FHi83hn
 GT0Yw2L8ctWGNbKgd+ZRh2YXKpmcYvV7PCZXEgeETlqIDQR8Gf0b46ScgSKe/0jnJ6nohWybxcN
 Pr9m0CSDHfAmpIoxQhy5kZm3XPosVvwBR64DtcsNMM6F1w+ThI8I=
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
index 19b7d247615f..c2b2ed2d5169 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3296,6 +3296,8 @@ igt_output_t *igt_output_from_connector(igt_display_t *display,
 {
 	int i;
 	igt_output_t *found = NULL;
+	igt_assert(display);
+	igt_assert(connector);
 
 	for (i = 0; i < display->n_outputs; i++) {
 		igt_output_t *output = &display->outputs[i];

-- 
2.52.0

