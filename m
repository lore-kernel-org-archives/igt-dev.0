Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A4AC41513
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6E110E5CA;
	Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jE/37Clp";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0314610E5B8
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8264320012;
 Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9VU8vdXmlK9dzJggM6sDd+NOEsvr7q4WIOKv6rpA+nA=;
 b=jE/37Clpt1LBqv7o4n3Aj2NpqwVjyI4iaJtPJ1NGqe1l8EmeF+tYBdG+2i64awevHUnUdD
 PD2FuUXzCIQIaXf5/0O6QF4KHTuADmNOe5Xa39+zJRHXX+8SbHgQ9wO/C2ai9PCXaHwbEx
 Tdeb8stmPnEpqlN0IQBYJ+z1OaYmJV6kv+2EbID5KnWxi+tIw7OdF0/jJMD3A4chDTONAE
 ICmFp3xFREl1VoO0Wo1SWS8DL3bE/vGZY5hltwW3VyJa3/gQoXN495AmyX0ZKHJ7QkJ9q1
 jt1Fb3UQZyFs0txeKmBg3D853yoAKWaq24hV3haYtgTWXweZi6YHFwoOORG+lg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:41 +0200
Subject: [PATCH i-g-t v2 25/39] lib/chamelium/v3: Provide access to
 port_mapping via method call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-25-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1415;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=eRVRuLz/vc5LOid88yRumrf/IckyTKoNnX86acHOZBM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViZVwkF8cFdEYwJ52kpbNxb2bIzlf1js/vlA
 erAW/RwoJKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmQAKCRAgrS7GWxAs
 4k1cD/9WHHTPvUud+tM4yDrbC1cDYFXcWIzZhZESHYOlcAZk7EKhj3UdzKRGABCyPeATk8jaEe2
 LZAUubnt0OHlXzHM0BEo/zqqwAaMixtTq6sglRrhOWA0pLDDXSRn8zYJoFsmHZNJtaraR/WZ52J
 DT/aH6xqHbLxya+Ym4jZOKzWO0asMNsfVpizYjhn3lbEpqF9T8zbs0DqfEq0Pj5rDxXSATtRWpi
 NYJGDc1x9+bm0BdRdXHDLocNZBn0kIuvAX4cb/ui5MvK8sqAz2QnLNV/VR49aMPUMwaIraaeR7q
 q4GNnMTetwdv5CpjUfLFVr26MaaclMIj953yCdQWI6A2es82Gjxu2J6IxazB2FQ4+Zmxog5cfWb
 DINyHbvAexWZsNJuhH1ErQY1PemW0eGcnJn+W8BvUosR2d07UgO6nqDkxNbGNssD5AnEbmqI6Ub
 3MieTcmjw4D5vmI7x0d80u4/FlFbjQ1AkFz0u3GECTMiUFrbjBAzCRDtYVdj7SGG+pxSZzm+U4f
 WFSqzdMgBHORJRWg3XdPo0HPu6vlwK67RlSspvQH2I3bVNlygidY3GDKU/u0JAhWCVXFRfrZXfK
 e+BRO9LrCBRAStULjrFjxQmUHdCenQP2xMcH4qEW69mWMsoLHl3JG6yvS0s6ennCFptT0R/OK9M
 7+IS+AYzZAA/Ptg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Since the chamelium_rpc structure is private, this commit introduces a
method to access the port mapping.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 5 +++++
 lib/chamelium/v3/igt_chamelium.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index 26f6b83cd10a..fb559f29a72e 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -364,6 +364,11 @@ void chamelium_v3_uninit(struct igt_chamelium_v3 *chamelium)
 	free(chamelium);
 }
 
+struct igt_list_head *chamelium_v3_get_port_mapping(struct igt_chamelium_v3 *chamelium)
+{
+	return &chamelium->port_mapping;
+}
+
 /**
  * __chamelium_rpc - Call a remote function on the chamelium
  *
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index 3aaf51dd38db..b29221c460f0 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -45,6 +45,7 @@ struct igt_chamelium_v3 *chamelium_v3_init(char *url);
 struct igt_chamelium_v3 *chamelium_v3_init_from_config(void);
 
 void chamelium_v3_fill_port_mapping(struct igt_chamelium_v3 *chamelium);
+struct igt_list_head *chamelium_v3_get_port_mapping(struct igt_chamelium_v3 *chamelium);
 
 void chamelium_v3_uninit(struct igt_chamelium_v3 *chamelium);
 

-- 
2.44.2

