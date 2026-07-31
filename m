Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50B8C55174
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FDB10E0F7;
	Fri, 31 Jul 2026 18:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="K6vesVJ7";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E318510F38E
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:22:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AE2FB4E4105B;
 Fri, 31 Jul 2026 18:22:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7C5096039A;
 Fri, 31 Jul 2026 18:22:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 818B811C16C40; 
 Fri, 31 Jul 2026 20:22:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1785522133; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WI+u9K1bVl/2O7uU+dlrqt1i9gA4M8m6+aNZpWruA34=;
 b=K6vesVJ7I4fIFQoeua5QXdemkvrjIhEiibkIURB9Edtkzl1TDoO0nyYVKojrOpF3+3mjzz
 kN06nprfrJu7SBV46AFVq+D/vlULPls5/wdU3tIRQ7XajtWlsB+JxF7/RNEhVtwtndIzFb
 0lnu6KxcOZZ8khq9wfSyzDFjfUWCxm8GwpXaqPhhuxI7YIXrzB1o3hFo9sRyhpMkMR8eZB
 WrVbKOz4dK7Nxkn7+h75nf1hfPsJfAlR1fJ4Q+Xjcvn/PU1i1RGJTTkpBhEE5xt3iPB3Cc
 r82dYR7fwx4uwx1DT3dad1GGLy+pxYKUHZzlTuO3hgvwTnux63T/zqkFtAfVBg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 31 Jul 2026 20:21:56 +0200
Subject: [PATCH i-g-t 3/4] tests/kms_content_protection: Enable HDCP for
 unigraf if available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-b4-unigraf-hdcp-v1-3-495df88ebbbd@google.com>
References: <20260731-b4-unigraf-hdcp-v1-0-495df88ebbbd@google.com>
In-Reply-To: <20260731-b4-unigraf-hdcp-v1-0-495df88ebbbd@google.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, thomas.petazzoni@bootlin.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1090; i=fomys@google.com;
 h=from:subject:message-id; bh=3bXLhBqqkcKhr4eBZOEZZU4u++dsQsN+haPPTlwD1U0=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqbOfEjHNYp082+qvdvtTGnFu6EVVLWRkQBEv+6
 VP6BvhjbiCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCamznxBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOK1Ug/9GoOULazz0hR8Tcf0kxWhse2pKbImIKc
 k+pVzT6EE02P7qcQ26AHJIdzpCYqn4hLDrFAwVr0ERdae+IBpBUEhUTmu8w7lpgmKj7xRGgw0d8
 kiMMu2txKbnAwQlAMF/piEvEvg2sHjEnGOIx+20B+vr/PO1W0oDsIX8QmptbVAcswZDQsoxG0Rt
 +rT8mv0Jkb4SSAaQIK9SqWhhi2nvETTDzNThDFcQtnWcliJ7CoJAlxIWbz9u3lDY3FsytOzUt/+
 OgJ3Xu77enMoVkxtHIUNItbcylxQDnIpxgEUZ2TGm1FF2vk9G9NecNnis82zldC9ccXaWqVOuEd
 CYgeOTdNKHacyyoJh02LmvH7guaKzfL8bbJYFlpEkM5aLojY5ZSeG6XtqzYUoRQgS49J5vckHr9
 MY5mwnVAIPfn49Sh0LhM0DznPa7SVHGe+T7cLffUJGYu1i6YR+845cDs1BQSVmJZKjP1VN2xYEA
 b4vvndWQrtFwzRoWe0xWrLUwtv7cDDMcBvZhL46sjAUv5eq8zOcrVL4l8MBfwBSpx4FYN/gio2W
 1spsObZO0QHrGWChyDIE7F05QOtmRx/V5yV92vShUg0ZhDlxC1PBuA0V+aLJ1s15Iwqq/CqORpg
 /GiH5Dcd7ctQE2OhiqXAOHHhBVoIiJjk502BS9viQdYeSi8Gk6f0=
X-Developer-Key: i=fomys@google.com; a=openpgp;
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

As unigraf can be automatically connected and can emulate HDCP 2.2 sink,
enable it.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_content_protection.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 133060af3c0a..680204981f58 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -42,6 +42,9 @@
 #include "igt_kmod.h"
 #include "igt_panel.h"
 
+#ifdef HAVE_UNIGRAF
+#include "unigraf/unigraf.h"
+#endif
 /**
  * SUBTEST: lic-type-0
  * Description: Test for the integrity of link for type-0 content.
@@ -769,6 +772,11 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 	int hdcp_panel_count;
 	int i;
 
+#ifdef HAVE_UNIGRAF
+	if (content_type == HDCP_CONTENT_TYPE_1 && unigraf_open_device(data.drm_fd))
+		unigraf_enable_hdcp();
+#endif
+
 	if (data.cp_tests & CP_MEI_RELOAD)
 		igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
 			      "mei_hdcp module is not loaded\n");

-- 
2.54.0

