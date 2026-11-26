Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB1D606A31E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6EtWvsD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF36710E74C;
	Thu, 26 Nov 2026 16:25:42 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C92410EA07
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 16:24:37 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-3b44bdcea8aso4080682a91.1
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 08:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795710277; x=1796315077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hg0VPa7TBcErAq4MRyL3p81NR8n/7PncfhshGUqGCAM=;
 b=e6EtWvsDMOIRU/v66H/lWsmXiOv0MsnQGzNmJjce40yKOlCeVznRE52fb9mL83TT0W
 hNjpKwhsiAveLaAQT27Y9W78KWI2robYq9wlL2A7tRsgFfJurNiUbukqvZR8PtGcRMeL
 Wdeakzu0iVRK4GQSA7kM1j7gkCdvHnhZyGbV9O+AKr9rlucYVkw1ndBd4ZCWHL2JC7YW
 pNPfbzVafTMplc/t2iHgpnrV/iWX5y7MxUqY09r+agj25WHm3NGpo0N4f8BFSRsVfAqa
 0R1KJQYfzAbTFC8rSPFF1ZS55q+xDUPB3vgkso0a+WbC3LYW53ta0PQ2HP0TbIk3BWKL
 uN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795710277; x=1796315077;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hg0VPa7TBcErAq4MRyL3p81NR8n/7PncfhshGUqGCAM=;
 b=TulqyyPyYOQ6wfVJnaex5ODKyeRodFuBzA+WRzKoBo33Q0XM2wS7ItBQqzJcnMUCYT
 3Z/vnFMbzB4QjbYK6TxuDz4kOfNQNdRXPsWAFHiNoW6N3PRzO2f6YekNwIUUzMl2yCJD
 JwBOPS0Ca1aQ6uCeBaqy/50bsDTLRb98hapCD8UFHLlaROxaxblMhnOvQH5pZfiU/q6R
 YOgC49EiRNCeaPK5wWkDY3/6TMsrygMikcUiwEvGnGtUW1yAZNSlBjpEIp7lkeE7rU5h
 BdSNwQw8dP2dSM3J/3QqWxLZ21ry8GVEOkmdOQjkEPAYcLMqidxAFhrrt7j3M5A07NOG
 +UbQ==
X-Gm-Message-State: APuU4Z81dNrPZxNAy8KYxJpuxZs/5abMJZAOj0MLQthpLknLxBLr4ZEw
 Z08lDmhC9iTjPqXWI/fvJYd6M/xDNltOUEB6IiYFRBOxlR4ePtwJmYjE3dXW7HyV
X-Gm-Gg: AZFdTZdw1c2WXnSKOw9q0NakGZKzKmPT33oBvcja9BrTEgOB1ueG945hZncw4g0ixsu
 zTFrEwhsqvgc9EvAafejm/b0f3IC6p8T05ytD7GFaYjKP2ssc8dG5GCvhtfpw3VD8+xn2kmmeVw
 e0QTA+H+OE3cVcllQYv4FJOLBsWf/8zNaztd4SMKoNN7Jpl3Ym9K/eCJPO7Hj+aOFMdtH6wP9Ia
 qcE+8OwwP2LSeYGZ68Na44p1ZKsI57DUtz+06bAyejTmYFC9+OnCKz2KbNhmlqLYdkwYIfRRcSC
 qGwAsy+yZ4DDgiiVCRks2L3pghcklFSd+Vtrs1VEp/8bfpzO+qFz6eVuiB15rP8mVy8nszzCJ+0
 Hh4eXqXqvjZu5eSi+eKkltZj6FPg7ITxre6j1azVpm24BJ2G/bb/kBOEiozsznJ0gDpe8nxBnSt
 rBBS8y2LP2fwwtS6Ye0cjOg7l7l+K+nJQdxYykBsRsDdTC/uHs0OkEJwQzPkDnb9rnsNL3ZT7qe
 KSHKSNC9bz2fqDtp5JhPTRUajp5q+kbg9pJaic2vqjUndu2eJjWqJeSKz51xhwLpAvv1jjC0e/g
 zqop2YcQGuhOlJbxo38I5tDkxojBjy1ih/vVlUbOQCohWvNpOf2GvqBtrnQoEnwhFjhtMXWob8d
 oT5CEWhTQZA==
X-Received: by 2002:a17:90a:d2cf:b0:3a0:e568:ed63 with SMTP id
 98e67ed59e1d1-3b41c8e0507mr13709740a91.8.1795710276724; 
 Thu, 26 Nov 2026 08:24:36 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-226-201-204.dynamic-ip.hinet.net.
 [36.226.201.204]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b41adcafe0sm36037391a91.16.2026.11.26.08.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 08:24:36 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Roy <rongh7426@gmail.com>
Subject: [PATCH i-g-t 1/2] tests/kms_bw: Check is_atomic, not its address
Date: Fri, 27 Nov 2026 00:24:32 +0800
Message-ID: <20261126162433.665660-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The fixture has igt_require(&data.display.is_atomic), which is always
true, so the test also runs on drivers without atomic modesetting
support. Test the value instead.

This change and its description were written with the help of an AI
coding assistant (Claude).

Signed-off-by: Roy <rongh7426@gmail.com>
---
 tests/kms_bw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index ea7cf7b..10bb520 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -334,7 +334,7 @@ int igt_main()
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.fd);
-		igt_require(&data.display.is_atomic);
+		igt_require(data.display.is_atomic);
 		igt_display_require_output(&data.display);
 
 	}
-- 
2.51.1.windows.1

