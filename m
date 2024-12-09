Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4D1E77181
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 21:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC81310E585;
	Mon,  9 Dec 2024 21:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PgaS40/3";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D1610E585
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 21:12:37 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso24818475ad.3
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Dec 2024 13:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733778757; x=1734383557; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OnW++Q/Xr4OYZbMxVrlg/FIZ08D2dmhWTWyMeXikghc=;
 b=PgaS40/3bhZvEr8OYLcZDLWChRUgu8+/ioiCeqZ9JIT0v6Dt8N8tmCjMPN483eyVXA
 3lOIW0RUV7KpVCef8rLSRjO9GA8pzi/2jC/5FO/6FLWH9NOg8Txx5UAeMF/lsv1tpve6
 Glt9Q1tNRiaxx4L0s5ChciyO3duXIcMugLZYhe2JZTeWeD0yLjUhudVAh86VdJtPwrie
 GCIMR3YsnFHLmVwLCEkoOb7ZaPPLWNbCemI4tUYq7VhO0OskrmDUvT4zjq7KyZ21+YCN
 70GypHxb2T3idaCD0EN0tZhFa1wY0KOuEMW0o7Vjnxv1FYel3h0qNhFQPJszh0PrTZfQ
 r0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733778757; x=1734383557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OnW++Q/Xr4OYZbMxVrlg/FIZ08D2dmhWTWyMeXikghc=;
 b=YhYi0hc/mG8o9ATY4gbwl4+o+iYSMhZJkNnue78dcGsLJy5bMgMti69qme37OvPuXZ
 e3QyOSL75pnA6GnRV6QmudJRST6HLfI9i461HlFYA0dGDlgSh3wJsLOWQjA1913ZSjwA
 788hbA6+1VFMGB6hWetVXBFLFbVd7Nbx3O9QjBxmNo0O/zFkUKrK5OKzOC1isuY/6DF2
 JQ3apNjBEfFDgw2U3AISy66ahS3IyJSJpFZH47NGlpBlzliSMMDChvihxlusDE9CUP5K
 qx0Lvbs7VQhnaiSA+UPyMLxb5npdEvqZoHSTGpXSaG1a03rDa/2xZXksqMfalgslyZ1e
 KcAg==
X-Gm-Message-State: AOJu0YxMxNKBFz2oqggO9OaoO357T3Eq7CYElyD1/W10rn01SoQ6pVre
 A/HibtQmEnLChcGkHdxSzDgtc4tSQWTth5VOLvtpsDrCMdPIU2cOa0+wtJXV
X-Gm-Gg: ASbGnct3/e2OxjteQ2Newc+WbroGSd3T9aopjGu/Od9NEV0QPP3ECkRzEq2mJC8WqRG
 S3LL57j4RhfXxUUI+smdMPyZWL0gIBv6KV3amrRZfJFOf+hVl9nLIt8A2MrfLN9y7PkdI+yO4eE
 vk1gxkqIzOvyLaXQhe+EKIjx9fX6yNek+fWkXEWuAVz/kgNWNz6j0Qrx/48PwfYWxEDZax9bhgf
 V8rV6jt2e3S/XNYf5WNYMxp49US6tQ455hyq6tZLnE9baTZgGgd8NckzWq7ZY8=
X-Google-Smtp-Source: AGHT+IGrzdTSwhwPIIDNK+YIpEhHDjb2hCZcXG7IGPw5lpPsXDIHPsIptrwEidenxC9rYOBd6c6wVg==
X-Received: by 2002:a17:902:c64b:b0:215:b058:289c with SMTP id
 d9443c01a7336-21614d1d3eemr156294115ad.8.1733778756884; 
 Mon, 09 Dec 2024 13:12:36 -0800 (PST)
Received: from localhost ([134.134.139.69]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215f8f0a720sm75282735ad.206.2024.12.09.13.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 13:12:36 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kms: add
 igt_display_require_physical_output()
Date: Mon,  9 Dec 2024 23:16:19 +0200
Message-ID: <20241209211620.3679545-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209211620.3679545-1-juhapekka.heikkila@gmail.com>
References: <20241209211620.3679545-1-juhapekka.heikkila@gmail.com>
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

Add special version of igt_display_require_*_output()
which will ignore "Virtual" connector.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_kms.c | 21 +++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 22b6534e6..9dc6e6d3a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3153,6 +3153,27 @@ void igt_display_require_output(igt_display_t *display)
 	igt_skip("No valid crtc/connector combinations found.\n");
 }
 
+/**
+ * igt_display_require_physical_output:
+ * @display: A pointer to an #igt_display_t structure
+ *
+ * Checks whether there's a valid @pipe/@output combination for the given @display
+ * Virtual connector will not be accepted.
+ * Skips test if a valid combination of @pipe and @output is not found
+ */
+void igt_display_require_physical_output(igt_display_t *display)
+{
+	enum pipe pipe;
+	igt_output_t *output;
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		if (!strstr(output->name, "Virtual"))
+			return;
+	}
+
+	igt_skip("No valid crtc/connector combinations found.\n");
+}
+
 /**
  * igt_display_require_output_on_pipe:
  * @display: A pointer to an #igt_display_t structure
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 301f370df..89f4dfbdd 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -538,6 +538,7 @@ int  igt_display_try_commit2(igt_display_t *display, enum igt_commit_style s);
 int  igt_display_drop_events(igt_display_t *display);
 int  igt_display_get_n_pipes(igt_display_t *display);
 void igt_display_require_output(igt_display_t *display);
+void igt_display_require_physical_output(igt_display_t *display);
 void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
 
 const char *igt_output_name(igt_output_t *output);
-- 
2.45.2

