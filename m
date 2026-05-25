Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB57ECD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 20:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2227D10E40F;
	Mon, 25 May 2026 20:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="n9i0rIEw";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C51010E40B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 20:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3OkJXTnC2smW5KFaGahDw442amO32ng7iTIIqB9sy8s=; b=n9i0rIEw9bno/7Oh/OQJS6lPq0
 9ayzlM0z7IQmwaXrnJMyZoyoKuw46lPeIYv64w+90mcasPPrsc/ZL9fCddm5q2bP12KF9IuviYuHO
 UCNYZP1rCKgaIji1mQQQfYSjNSgDGoXdwn4J/oYH+rAT+xcHwilWccD93LJsYauVZUxM9+nFMkh15
 fUDF0/EPyLZIH02nAo6c3mEz9nRHszp9B6gPZRekMXVzP+bEknm3kIn/TmMncyw6048D7OAs30EBh
 jJnLn6M1E88kHD21F2YTQOLdY8Qohkj+fseGwFiJEClcG0gmc/A0JSQeDjffPVWSJUqtfHkqWQYKo
 /999sNgA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wRc4q-0089fG-F5
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 22:39:08 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/6] tests/kms_colorop: Add BGR pixel formats
Date: Mon, 25 May 2026 13:38:26 -0700
Message-ID: <20260525203827.3155622-6-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525203827.3155622-1-John.Harrison@Igalia.com>
References: <20260525203827.3155622-1-John.Harrison@Igalia.com>
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

Intel platforms only support BGR pixel formats for writeback. So to
run this test on Intel platforms requires enabling testing of those
formats.

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 tests/kms_colorop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index f0cfcf405..a9f2cdcb4 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -31,6 +31,8 @@
  *
  * @XR24-XR24:				XRGB8888 framebuffer and writeback buffer
  * @XR30-XR30:				XRGB2101010 framebuffer and writeback buffer
+ * @XB24-XB24:				XRGB8888 framebuffer and writeback buffer
+ * @XB30-XB30:				XRGB2101010 framebuffer and writeback buffer
  *
  * arg[2]:
  *
@@ -419,6 +421,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 	} formats[] = {
 		{ DRM_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, "XR24-XR24" },
 		{ DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, "XR30-XR30" },
+		{ DRM_FORMAT_XBGR8888, DRM_FORMAT_XBGR8888, "XB24-XB24" },
+		{ DRM_FORMAT_XBGR2101010, DRM_FORMAT_XBGR2101010, "XB30-XB30" },
 	};
 
 	igt_display_t display;
-- 
2.43.0

