Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62180C4345F
	for <igt-dev@archiver.kernel.org>; Sat, 27 Apr 2024 11:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA5010F582;
	Sat, 27 Apr 2024 11:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ourmail.work header.i=@ourmail.work header.b="vvf/g6Xn";
	dkim-atps=neutral
X-Greylist: delayed 351 seconds by postgrey-1.36 at gabe;
 Sat, 27 Apr 2024 11:27:04 UTC
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9F010F582
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Apr 2024 11:27:04 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ourmail.work;
 s=default; t=1714217222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vi8SJus7ExtU7G0w7YP3bCYpi0S5V+cwgQTTAi1VPpE=;
 b=vvf/g6XnPwjDSsK3MR9nFELQMWEjbePmZusz4kQxeXow9jCv3zqfAuxbNtsMmfB9yZ7Ty0
 g+DsnIV7pApdybXsFJ8STW5OaV06Tpa/Ng8/gTsBnA18wCS6zCLOq4ANgZUGqBLZmYCyGa
 dKPLZQKjeA2Ood6qXhYvI+ZY5kaM8r8=
From: Reagan Bohan <reagan@ourmail.work>
To: igt-dev@lists.freedesktop.org
Cc: Reagan Bohan <reagan@ourmail.work>
Subject: [PATCH i-g-t v2 1/7] Define _LARGEFILE64_SOURCE for musl libc
Date: Sat, 27 Apr 2024 11:18:39 +0000
Message-ID: <20240427112045.10987-2-reagan@ourmail.work>
In-Reply-To: <20240427112045.10987-1-reagan@ourmail.work>
References: <20240421232204.31704-1-reagan@ourmail.work>
 <20240427112045.10987-1-reagan@ourmail.work>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

musl libc expects this macro to be defined when using the types off64_t
and ino64_t. This does not affect glibc.

Signed-off-by: Reagan Bohan <reagan@ourmail.work>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index cee8a7446..4a9c7d55e 100644
--- a/meson.build
+++ b/meson.build
@@ -74,6 +74,8 @@ cc_args = [
 # well with longjmp which is heavily used by IGT framework.
 	'-fno-builtin-malloc',
 	'-fno-builtin-calloc',
+# Required to use off64_t and ino64_t on musl libc
+	'-D_LARGEFILE64_SOURCE=1',
 ]
 
 foreach cc_arg : cc_args
-- 
2.43.2

