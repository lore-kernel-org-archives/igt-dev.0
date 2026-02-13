Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A1FEDF170
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 15:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9208C10E085;
	Fri, 13 Feb 2026 15:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SYMnDsOb";
	dkim-atps=neutral
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D3010E821
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 15:17:01 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-c6e248aa446so418888a12.1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 07:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770995821; x=1771600621; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eBm/VpD4YGiHBCvOPDEAYknQQY4YwWBAVP8wvw7NVoU=;
 b=SYMnDsOb2vDVCa3GAtddiJmX9vv5TVu8wzScM2Gn3bFZB1LCx7mCFkb+H+PJheOunr
 8abWQ7BtLzcJcsmhDC07WOiwk9zOQ1bSVrvQt60roV7URBfOo+VlMiIOr3+WKhiTEZQI
 kvZBV4Azl6K4bwIN4JZgJT9A0jgHxrpTwF2KXyCoilfeRs4DYfVhdYcm3Fc85NqcfQPG
 AuGJ8KhCAt9GCWArWNsZ3osJkVcAliQySMUE8458yJHFJAzUOo9nvq/RTlu5swPRY5iV
 avUwaoCDOoLhddpvYYjTGDX+PDlxkToqDD7CXsz71X+XMYvV0Xjhs5cA4s56JQqg7++U
 anQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770995821; x=1771600621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eBm/VpD4YGiHBCvOPDEAYknQQY4YwWBAVP8wvw7NVoU=;
 b=YXzXgsmnU2UAUCr/mJSviXPpPc5cwhlq8ymtHz3nf8LXz8jwwuxxg8fmdeIP9byQEo
 1XgN36Qi/hTNjaByQn/Nte8LjEKYZctt7U8VFO7ZEP+/QxmwtI9FfveafXiLi6PE3nli
 +N7bHLhuRv/kNMUUEPkCSvnf3uK8OoVUSIsLLEpbHkwmFz4cN9YzrFiloAMuJ0IKEcQu
 JuwqtD/cubCPlnYRTZ2VXOquXELNoHhsrBkDby7PnYfgPQBHNlafiUx0ucgv4Dx20jK/
 eyDnroNbWaApoyT59xup0vxeCrTCL+kHtRQglfM62VOQDApF7pm/7bovpkSjx/gHo3Ao
 EYRA==
X-Gm-Message-State: AOJu0YxF8u12UNy5DTZQ9ZtrNHBMQU3eDSqU7X5v0Jc4Y/vAo3FvwPOI
 z9LyQ9ISlZWyCcRREAMVsfTzeQUY6HgmLJaJK7Pc4mrEneDjWZ9X8oHWg0npmxPW
X-Gm-Gg: AZuq6aIgqtNxqQualkvrbQ8ym2JpL18bCYnqcdwaQXkIxCmUZC5QSyO4MrZpZRCTEDz
 yVl/I+lomBjsgIJNfu4GZ6rzbOgXkbBRzqcAiQghsCdcVNuRH8WOiWfDqUt2aCo+Sj96NVkbnVV
 g0YLmT5sz2jmxZPmTydH9Rwn2nUOs+sIusWVr//N+zzONxLlrXplc6ADOUudVE5/sAdvu52iY5Q
 z+yvx/6wuIksCvBVmclffA5+smNu2Ro8TwQsviHrjVfeq/eHYxxjekg009qktHGBOOqxD5If4JC
 PAdtC2kCrxrO/A80umc9SqiHrBvGHYrJ05rnLUgZ+BGyB15sHvD++BfdiL0alMXM4na6cG4qLTN
 oWBuMaAbZgvE+gFD8A6vvFMJJtHKLirRpdYbFT/E1gWXxiiLSvq+r0LaLyCu0VEbc2md0u10I1X
 HnB8GmWIwJCtqoi7yizIlQD53Mlcj29nRkKm9iINYaP9vR32VlBrmHIOiNnCcrQw==
X-Received: by 2002:a17:903:4405:b0:2a0:d34f:aff3 with SMTP id
 d9443c01a7336-2ab5055ee65mr21170245ad.18.1770995820798; 
 Fri, 13 Feb 2026 07:17:00 -0800 (PST)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab29873c5esm89377095ad.36.2026.02.13.07.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 07:17:00 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/7] lib/intel_batchbuffer/xe: add bb exec path to use
 specific engine and gt
Date: Fri, 13 Feb 2026 17:16:19 +0200
Message-ID: <20260213151621.1552677-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
References: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
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
---
 lib/intel_batchbuffer.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 198adf85b..214c157f1 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2518,7 +2518,16 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	igt_assert_eq(ibb->xe_bound, false);
 
 	if (ibb->ctx) {
-		engine_id = ibb->ctx;
+		unsigned short class = get_engine_class(ibb->fd, flags);
+
+		if (class != DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE) {
+			engine_id = ibb->ctx;
+		} else {
+			engine_id = xe_exec_queue_create_class_gt(ibb->fd,
+								  ibb->vm_id,
+								  class,
+								  ibb->ctx);
+		}
 	} else if (ibb->last_engine != engine) {
 		struct drm_xe_engine_class_instance inst = { };
 
-- 
2.43.0

