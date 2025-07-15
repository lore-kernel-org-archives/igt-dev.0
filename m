Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD63EC83F1D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC2A10E59A;
	Tue, 15 Jul 2025 10:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XfpDPoD/";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F1310E59A
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:41 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so37988045e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575139; x=1753179939; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3M6BBQBzwA8q0C6zm11CAEfNMuDsUjhzpfpN2VLJpg=;
 b=XfpDPoD/dE+6JFWMCN1ZVsgponNC4lpStH1HgU3PsFOBeCxfa8Kdvfp+I67COZgbLn
 FBPmoCP9luLsgZMxsvRRUjO+lulRUmZ3qsbIcVKIhsB2DuCYcQ7g0Li6ERyzxQnKbr3s
 lryTG5TUpKDMg6d8iMSrAIWhotvknjwFS18dDx94guG2OB9nJIUM/auNIuxx+G96FggI
 CKojGeC+gCm3HvfJf4O/boFlcNX1aMRIa4pdtIuFj56wr+buQbCPNCMcno+hR/+NFGVk
 JFwxuVvGG7HUbhvxbKjffBbv23j34+3MLKT9RMZG3Kzd/fzAAv7fjuilGKOPY850vbHr
 VN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575139; x=1753179939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3M6BBQBzwA8q0C6zm11CAEfNMuDsUjhzpfpN2VLJpg=;
 b=YxlFWzh0mnkJs3SXooHH5KbWPwvr4mIJURvZetwZzLzjceBSmnZASNiWvtsIjj5Xzf
 GF2dksQbC0pVqjOs1nuiWnc0uoKqU8PR4UY/nrVTyGTmGQ8fZlmC9zcjtsdnbAmkEpZy
 sfTrvwQcyFYBQ0J6++hc2ORBaHX+yr1LPJq3o+zfL2VahoTO9TjyOb18HIeRmOkDc1tr
 khGucZNPAIqsgbd70G6AWeqgH/tsTgLTNbd52GVhi1/env8Onh3aH4cx74zvJJOT28v7
 vEMg9EzvkAJ9STXzBp/V9/aReVvu/nwHUqWhRdYVx0Elbxyxz0w2dJ0SQvYrxoYM9OZw
 DyJg==
X-Gm-Message-State: AOJu0YxPseMpnsKYGoERazKgRFY2sne3GRxjp07gwGLS66Keve2pTwi0
 Z3mGckeXmYUw4edh26dcOGGJ0zD58WABdw6Q40dtjk6GoPTJBFf9WshTbORBYQ==
X-Gm-Gg: ASbGncu/937KEYgxE2TWubD/3oS8ToGiaf7Sy8kvzOojuaJvrwlvWWI8kzhGIEaNUR8
 l8WY0nc8lJBnBUdsWlgvui+Zd57cGz/1ZLzg9yOIb191OEJEA8kI5WIMLIaO8zokjffk1WFsp2P
 EZS+plJwylqoMXHkvpcuEY786LflNihgv2ro2JFnmu5SEonrJr2nX77B/tGjwwcLbEWGjDI9PMS
 FAXfkVwLxrn+OS/tN7CCQVwEMJxFwFAw8LTYitqHACdTSe7o6th8iS0QPAdmHfCrv30jqWS5hv1
 uqRAwsyoPyoZpyy1uPTnHzbdf5VEICUQ+rMoLDHYxz2AvbOzjemPOodqmP2mDSMYVkbE0Wg0IzF
 MfOTl1hvhgLPed8PM7Q==
X-Google-Smtp-Source: AGHT+IHp5p6ZJX1QMHGLbFEjgV/E175qy/wQJbCxT4QyGr/z6lq0z4Hc3U9H4Zpj5naCZ6uJeoQ9Hg==
X-Received: by 2002:a05:600c:1c8f:b0:456:2212:46b8 with SMTP id
 5b1f17b1804b1-45622124965mr38988355e9.28.1752575139362; 
 Tue, 15 Jul 2025 03:25:39 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:38 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 21/41] lib/igt_device_scan: Allow to find device by
 sysname
Date: Tue, 15 Jul 2025 12:24:53 +0200
Message-ID: <20250715102513.5636-22-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715102513.5636-1-jose.exposito89@gmail.com>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The VKMS driver allows to create multiple devices handled by the same
driver but with a different sysname.

In order to differentiate between them, allow to find devices by
sysname.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_device_scan.c | 22 ++++++++++++++++++++++
 lib/igt_device_scan.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 0ab7b7a0a..abd8ca209 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -231,6 +231,7 @@ struct igt_device {
 	char *subsystem;
 	char *syspath;
 	char *devnode;
+	char *sysname;
 
 	/* /dev/dri/... paths */
 	char *drm_card;
@@ -680,6 +681,7 @@ static struct igt_device *igt_device_new_from_udev(struct udev_device *dev,
 	idev->syspath = strdup_nullsafe(udev_device_get_syspath(dev));
 	idev->subsystem = strdup_nullsafe(udev_device_get_subsystem(dev));
 	idev->devnode = strdup_nullsafe(udev_device_get_devnode(dev));
+	idev->sysname = strdup_nullsafe(udev_device_get_sysname(dev));
 
 	if (idev->devnode && strstr(idev->devnode, "/dev/dri/card"))
 		idev->drm_card = strdup(idev->devnode);
@@ -2145,6 +2147,26 @@ bool igt_device_card_match_pci(const char *filter,
        return __igt_device_card_match(filter, card, true);
 }
 
+bool igt_device_find_card_by_sysname(const char *sysname,
+				     struct igt_device_card *card)
+{
+	struct igt_device *dev;
+
+	igt_assert(card);
+	igt_assert(sysname);
+
+	memset(card, 0, sizeof(*card));
+
+	igt_list_for_each_entry(dev, &igt_devs.all, link) {
+		if (strcmp(dev->sysname, sysname) == 0) {
+			__copy_dev_to_card(dev, card);
+			return true;
+		}
+	}
+
+	return false;
+}
+
 /**
  * igt_device_card_match_all
  * @filter: filter string.
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index e6e31e799..f24a193cd 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -94,6 +94,8 @@ bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
 bool igt_device_find_integrated_card(struct igt_device_card *card);
 bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
 bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
+bool igt_device_find_card_by_sysname(const char *sysname,
+				     struct igt_device_card *card);
 char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
 int igt_open_card(struct igt_device_card *card);
 int igt_open_render(struct igt_device_card *card);
-- 
2.50.0

