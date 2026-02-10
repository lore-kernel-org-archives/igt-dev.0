Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89825EA3F27
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A4410E5D2;
	Tue, 10 Feb 2026 16:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GjZ54OE8";
	dkim-atps=neutral
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B477D10E5D2
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:10:27 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-823c56765fdso566694b3a.1
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 08:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770739827; x=1771344627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aC2ViNkItthNENPgNJ1j6PkVxGR3OZad9NTWjGpu9K0=;
 b=GjZ54OE8EpoaHmp9ZySsAwsjJsxoolrpHieADaLBEUlFK3xDf7+nXkSLC270jwOqEr
 cLECVl8IygS459Za9JeCjWIVqFXuBKyxudpAOcaRrIZuDD6pZgZpYvk4O1wIvvHj3nGM
 X8edyBOqpa+wwK9FJ6tpCo1bi85C4D88YmZr3Q03jPBeOVgUlLd4T65MXIGp6S5wg/Fq
 vuq/7VRto4BHknYsb/vaexjuMbheZ/AEl8xbah/SG0oNUN/oETZ7eNC1uSRqwXuWfCVl
 PR8G0znGdbIFFS76XTGBX9VPDLWYOO/rNWxbcCAWv8i768R+Ltj4DCPLSWcn7agjo3DR
 sGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770739827; x=1771344627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aC2ViNkItthNENPgNJ1j6PkVxGR3OZad9NTWjGpu9K0=;
 b=cNm3S/MBMLhTH+855y+bF4YqdKpKCFy2FpNXOCtZt8YafP3nW2dQYFuCykUOZMOdvV
 7wL//u/cyz8A3PFc2rBjs2SzOElXQqJuiCxdqfwoYJCBN9Z3/BjGm59sZtbX8NrAHVhP
 ND2PkfLEHv/YQP3TkaPb7SHEovNKTpVGJyGrNxXYQ9/NalOYh0yE/+fZtjWB67AiNsMh
 8nSOc7qu2YgGgfSOar9PQRVX5qrvVx+fYJYcMcV0Elu85Z1ELnPczbWq9u97XxLgzAEz
 ifM5zJrFUGLbpD/Fbhg5J7tb7Q4uuiQaHvQZv7kFpMcFyVoJyUR2WRBNXU3s7C0B0BPb
 HpYg==
X-Gm-Message-State: AOJu0YyUatiH9YA2GvLkcUZXD5Kx3UNVH3LvtDHDK2X3U6OdgiAN5r69
 0Ry3VMXg3lX6x14mgfC+hxPicaSvsrwy3c2/DqKGMDHbFVHRWhcuqvT0jgIpiQJ5
X-Gm-Gg: AZuq6aKMHdVYFj2PWWlPuz6CH43oB+u7EPAuYgvAUWH+oOau4j2vZtMJNHVuZ+362wa
 v9F6LZ5Enm2v9gFEntFnK8OFsW1J52/7O6Yo6Tb1dN3ZELe/cDNEiPPuYFLrv+aBDhRyZRcPNrW
 1HETw0UmKAHO41CyG7qdI+HGHZblMmIBY811EaxyyzYoCrn6IJTB0yRdpHxhzWVeZyXX+/kCUp3
 ZBxpuHV1CP2/1udzjqMCKJck9E0iNBAhBSoYbDPSfjbMXc3VYDgW5SUlkjBOtKZaqF2kPkkpgbv
 oYTyGFpQB7T+lVRjV1iM9XFZOkd18QNeKz6SnZK2GXSByymVqoHDwGsacLiKU/7a5l8vByzIZ2N
 xuk+L8Pf0utxyO+emzAm+CbNuDFvsL26IEamTQXElOcPAAIjn0AriE3/5Hw54S86etRJ+TlTPTA
 ndxrygBO8DxIICK0sAHdmFBPReXkT9RJOLnJIfO17sHI9pYNG2skzpD56EjHwUOg==
X-Received: by 2002:a05:6a00:2da5:b0:823:cbb:a484 with SMTP id
 d2e1a72fcca58-82441612beamr13086254b3a.14.1770739826967; 
 Tue, 10 Feb 2026 08:10:26 -0800 (PST)
Received: from localhost ([134.134.139.69]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824418b842dsm17043848b3a.52.2026.02.10.08.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 08:10:26 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/7] lib/intel_batchbuffer/xe: add bb exec path to use
 specific engine and gt
Date: Tue, 10 Feb 2026 18:09:39 +0200
Message-ID: <20260210160942.2219370-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
References: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
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
 lib/intel_batchbuffer.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 198adf85b..c80881301 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2518,7 +2518,13 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	igt_assert_eq(ibb->xe_bound, false);
 
 	if (ibb->ctx) {
-		engine_id = ibb->ctx;
+		unsigned short class = get_engine_class(ibb->fd, flags);
+
+		engine_id = xe_exec_queue_create_class_gt(ibb->fd,
+							  ibb->vm_id,
+							  class,
+							  ibb->ctx);
+		ibb->engine_id = engine_id;
 	} else if (ibb->last_engine != engine) {
 		struct drm_xe_engine_class_instance inst = { };
 
-- 
2.43.0

