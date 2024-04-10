Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41622CD128A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 19:03:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B311F10E46B;
	Wed, 10 Apr 2024 19:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NycFNe+X";
	dkim-atps=neutral
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5C010E45C
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 19:03:36 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1e4c4fb6af3so968335ad.0
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 12:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712775815; x=1713380615;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vFbpkuEMYacSyfZLo1pVhLwR2mOcjq9BExYtUg+dOm8=;
 b=NycFNe+XUbGow4cGIwZ8xEDCLwx7O+634gd4HZyRGLZ4BBNFq1UYtzEL8WsOGAvBeg
 GTj/I40Wt67Mm/O6hrEjGw5piu+t7JaS2ZZeCIUDBJvBn4tyoikJL4VjSrDf0aeFtKxm
 dRTvCpda2w2XpQnZXXIBIWxz62+ociIQGE9MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712775815; x=1713380615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vFbpkuEMYacSyfZLo1pVhLwR2mOcjq9BExYtUg+dOm8=;
 b=fb0/MJURlSL9WCwHM3fkpRtiGfw7SkXKxbGwGOZdxszx1NfhW35sRahImvmxprU+gg
 h8Q2XuTPIdcphOUUpc/wxBhg4QCWXNs1kngR0p/MOvkaeOHQHtP7nKXnB+JG8ydh7hMd
 Pbv5Nccm29u6IyVU0A4ar6OeiwUyVeJbwFS8Jq+chVSIfhVgluk/G+e7oarf85mYzabB
 Fdy9Yr1QqeEIZudk9+UXEb2WenzT0t3kJr7hVQYhFbDc3jg/l8rqhkLbndDReNoqJLlO
 5BZcSuevW1CV87vS4VptEVhrDIeHDrS2VSUfAFTRDZEQyQC9+cfB5pBCa7WNvbwEAPOv
 Up+g==
X-Gm-Message-State: AOJu0YwQtB07cdKh+vQL7QUSkfVvCsqofH+nYITZuUPQlWfj7giA6F9x
 kgntE6UIZDnXg1kBPMgtKSoc2Ae32bluN5g5hhCsY4Q8DIxxXU5kE2V46wtcsHjzl+NAsi0XCWg
 =
X-Google-Smtp-Source: AGHT+IH9Suwg9oO2ztXctogBJoQUAgwCDU20h6U5SMFwZmlOkE/lBdMDMge/OzFBtXKYqTLQfsO62g==
X-Received: by 2002:a17:902:e845:b0:1e2:45f3:2d57 with SMTP id
 t5-20020a170902e84500b001e245f32d57mr806036plg.6.1712775815639; 
 Wed, 10 Apr 2024 12:03:35 -0700 (PDT)
Received: from navaremanasi.c.googlers.com.com
 (154.137.233.35.bc.googleusercontent.com. [35.233.137.154])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170902c94d00b001e2ba8605dfsm11070475pla.150.2024.04.10.12.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 12:03:35 -0700 (PDT)
From: Manasi Navare <navaremanasi@chromium.org>
To: igt-dev@lists.freedesktop.org
Cc: Manasi Navare <navaremanasi@chromium.org>
Subject: [PATCH v5 2/2] HAX: run kms_vrr tests in BAT
Date: Wed, 10 Apr 2024 19:03:29 +0000
Message-ID: <20240410190329.3518540-2-navaremanasi@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240410190329.3518540-1-navaremanasi@chromium.org>
References: <20240410190329.3518540-1-navaremanasi@chromium.org>
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

Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..53a364ae6 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -129,6 +129,7 @@ igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
 igt@kms_psr@psr-primary-mmap-gtt
 igt@kms_setmode@basic-clone-single-crtc
+igt@kms_vrr
 igt@i915_pm_rps@basic-api
 igt@prime_self_import@basic-llseek-bad
 igt@prime_self_import@basic-llseek-size
-- 
2.44.0.478.gd926399ef9-goog

