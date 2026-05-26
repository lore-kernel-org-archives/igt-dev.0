Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18935CD5BB1
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 14:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7C210E6AC;
	Tue, 26 May 2026 14:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nVvZUuxz";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F31110E6B5
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 14:44:22 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2ba4efedbeaso80738875ad.1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 07:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779806662; x=1780411462; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2HsuhMzjc0GBUxPgNORCB6QO+oPJVTXI3mC9LDxI3m0=;
 b=nVvZUuxzxiF6imJpGGhGMYoSopT6+n7JVHVxEhIQiE0YzPcv0OufQ/GgjsTOO79F3b
 nxQYJ3ILCK4pH0GL0pCPdTrw3if9zhW9eLd/lPFkPR3y0aBLfbJWgerSeo4CHlPHyZQI
 9YnEaubLAWhToJiBLgWudCAj2tSylLN0zMYVFqseYYRqfpwtiYDUWQPsVz+ucQArbVXW
 baUxSJujE3918uNBSaw2DHtIVNbH8uLMHHq4hPlBOQ5Ryg0GOQEMULUTrPW+qSu/U23T
 kJ8ncQy2/MbBKAfHEyru83fBhKpzjck0tk3YHsAdbYqYYEw4As/j9UNMKCGtgMmMNWwr
 xTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779806662; x=1780411462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2HsuhMzjc0GBUxPgNORCB6QO+oPJVTXI3mC9LDxI3m0=;
 b=mAAkHnVOpcukJcjU9aGUX8KYlZb/BBkQ4eeid3RJM0sKfpS1nav0P55hPgibgyb2vR
 0h1qMbt6FwDfXABC8dT7ZiWUHXVjAhi0JDjnvJ7oYD0KYQEBw+5uLpMk/NCtTSvzcY8b
 8vXvx/h8RgPkFv0doGk8zClCmVUlO8hyCZ5OFtIlbNfb2oxXn/My93eLzyIRdGd6wQZo
 UtICHsR0WYc3SwoG+Ok6wJzFbeqSLI69oKb8Vnf5R8JwrgaIxmeNKDFXI/+qEKryjbtW
 nDXe3I+2o2BOocir0gndhBzvERozxZ5S/ZGfvNyuOKj4enQxy24Og2JiaTCtWOapjjVg
 AOvQ==
X-Gm-Message-State: AOJu0YzUVjXUnj5Qwl5dSIQol0Rxe102/6f21pOwWW801214zbN03HwZ
 41dpsN83uHy6oRqM44z2DGSOgUY9i2RTB0y/ZgRbeh4p8pNoig783EVDmzgAQ+yD
X-Gm-Gg: Acq92OEHeiWXUEW9pPm3A0HhdRcviwqui9GC4DURF7C4kWJHhMguNq0OdflXBOnqsVP
 VyeEF7DwH3VFtyYNRl2j7RC3JTBUBqAaV/hcdIeEteACanT2NHIr9DCm2+Bme6uvYk5tCqrxzhX
 NnlnE/4qhZFHfGz4q6HE4rkUuKEsz6PGciSje1yGLGQGvqid+LQ8nlOZH+RP95NL8j6VUfflzct
 6iCgaYnoGu3j4Iri0rilN/hQ3BaWLo41n4K9/dWb4p0Y8spA0+E/lMMYAXH8VjUuK0cd6n67/dr
 25kvHHGIbqP6exgFzDY0v17e4RbhCPfBPNjYOajtyfgUwgWPFVujUZaVUoW565BulzfohwHvZPl
 THBp9u/uf3f0Ylw2dWfb4FLohBG9lfQWFC53YaxV218HwC1R2TjOr4bjxY+pCSP/Ki2cDTzbAEu
 zSaSpY08GJA1KFQ5Lkx7wGqEc/+gQDmcjoo5iybSOuckm756SaI6e1vwdnhwPppvnyCnK+rk4V
X-Received: by 2002:a17:903:2bce:b0:2b0:5923:5194 with SMTP id
 d9443c01a7336-2beb0681ddbmr209606615ad.27.1779806661578; 
 Tue, 26 May 2026 07:44:21 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb58b3058sm130019815ad.39.2026.05.26.07.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 07:44:21 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 6/9] lib/intel_batchbuffer/xe: add bb exec path to use
 specific engine and gt
Date: Tue, 26 May 2026 17:43:40 +0300
Message-ID: <20260526144343.2531299-7-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
References: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
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

Add __xe_bb_exec path to use specific engine/class/gt

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/intel_batchbuffer.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 79a4e357b..9630844ad 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2526,7 +2526,17 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	igt_assert_eq(ibb->num_relocs, 0);
 	igt_assert_eq(ibb->xe_bound, false);
 
-	if (ibb->ctx) {
+	if (ibb->gt_id) {
+		unsigned short class = get_engine_class(ibb->fd, flags);
+
+		if (ibb->engine_id)
+			xe_exec_queue_destroy(ibb->fd, ibb->engine_id);
+
+		ibb->engine_id = engine_id = xe_exec_queue_create_class_gt(ibb->fd,
+									   ibb->vm_id,
+									   class,
+									   ibb->gt_id);
+	} else if (ibb->ctx) {
 		engine_id = ibb->ctx;
 	} else if (ibb->last_engine != engine) {
 		struct drm_xe_engine_class_instance inst = { };
-- 
2.43.0

