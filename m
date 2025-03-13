Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F200C35FF6
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECD610E912;
	Thu, 13 Mar 2025 17:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bt6t4hjv";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8384510E916
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:47 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so8562915e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887226; x=1742492026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lVNIWABRDtUWsvmgsLUyWyBLZTFKSVmF2Wl8hYHRgXY=;
 b=bt6t4hjvqXjE0QB5uDu2zJkmmelWxS4m+GJPM7VYH4M8Nn+R1eDGLKFOasivoxphcZ
 2zz9dXU0p+ckuBSs7b+EnZtOMYRxf40TYLxOoRJ3HOlgDL9XkO0opVjTeEd9tZ4b4ym7
 wSWLdu2BE4liPpO+eCmAOO9mbt00FOwhouvBz1geCB9nClpFPRdnyugJLaCSK20rNb+G
 DuzFDakknZxAiPiYgAwmP1Obw63mtmf63Smth/yVbCOozX6gozXEq54vC01QB8+4zRQT
 7ReJsDCBFgkblJSSsjg8FlX5RkBxZcO6TvjIYWpqzomBSq/HZgREDSkU+6yl8N6lta5e
 35GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887226; x=1742492026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lVNIWABRDtUWsvmgsLUyWyBLZTFKSVmF2Wl8hYHRgXY=;
 b=q6wLGabB+hTJdI+4qkQ79c5J/2TOk+pos4VBfj7Oc3SD+I7qshxQCqRawZZ9S2oiiy
 8/SH6x4qGqYs+Yess1BsPvZ9ntTzXY05Yimnzw4dVl3J4/Ec3DHhMahm9wHs1HoxUDNK
 QH1IP1MfoXgiQ9sm5GGtx8twZkUd0TSZdGbdMvQM3vf7T9Xyj4ToWbeMFmZFDe9e5CTj
 QaTWKCrAyxxvh62OHntnhcRzo1Hb046eJwINdJfKf8zbqQokjzOvrfXVas0Rxl9DJpYA
 0MU4pu4KpYQ1xDDgknD6wRps07mkU9mpk6dIygknqOutFycq/epCOEXeLKJx8StE9yqt
 U9Bg==
X-Gm-Message-State: AOJu0YzODueY2dlfkkGSRKF9eDukT43T2mGyWVj+kMMLKQ/2l2zzu3Wm
 MP1l77IoOW62pIHaa6EqmztPrys10XdobFB/aEtfqH7l+vIifn0o3YIy/VAw
X-Gm-Gg: ASbGnct8lJa5wRI/sBJog421+9Fvl95KGZLPS+oKoaP+CwXHAU8NHQXJLVkug8PmgeH
 5hYYrJ3oFdm7cuX4rGYOgTvq7hfigBGRMpCUMaNV26IrPSNTVoX24byT8zHvjwwigWGzKSyG77i
 66z6JuN0j6i4VDzNTkZcX8ysAb9HqTtUv2R+gzlMQDn+u/evAJ6HHbkoIJ1RwFgulrwO04jPOkZ
 TZJg+f5gvZ5UMr6v1oWMEBfZwojnJkWXvR1BVr17ar5TyXl11AoDNYfAronOXnMWwwEY/3G8FnM
 XfoRNrM4ySnZzbHnrEfBhyxY29DhIPuKNJtSdrI4QnIm
X-Google-Smtp-Source: AGHT+IGz5cFcZ5OHGgCa2w4Z78ipBcseVnPLaMI+7XpZnKEkjT6jIeiOshVMttlx7MUumkYc/pKqAg==
X-Received: by 2002:a5d:5f47:0:b0:391:231b:8e0d with SMTP id
 ffacd0b85a97d-396c345bb64mr466299f8f.39.1741887225734; 
 Thu, 13 Mar 2025 10:33:45 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:44 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 23/43] lib/igt_device_scan: Allow to find device by
 sysname
Date: Thu, 13 Mar 2025 18:32:58 +0100
Message-ID: <20250313173318.5818-24-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313173318.5818-1-jose.exposito89@gmail.com>
References: <20250313173318.5818-1-jose.exposito89@gmail.com>
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
index 711bedc5c..5cbd347a3 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -231,6 +231,7 @@ struct igt_device {
 	char *subsystem;
 	char *syspath;
 	char *devnode;
+	char *sysname;
 
 	/* /dev/dri/... paths */
 	char *drm_card;
@@ -664,6 +665,7 @@ static struct igt_device *igt_device_new_from_udev(struct udev_device *dev,
 	idev->syspath = strdup_nullsafe(udev_device_get_syspath(dev));
 	idev->subsystem = strdup_nullsafe(udev_device_get_subsystem(dev));
 	idev->devnode = strdup_nullsafe(udev_device_get_devnode(dev));
+	idev->sysname = strdup_nullsafe(udev_device_get_sysname(dev));
 
 	if (idev->devnode && strstr(idev->devnode, "/dev/dri/card"))
 		idev->drm_card = strdup(idev->devnode);
@@ -2059,6 +2061,26 @@ bool igt_device_card_match_pci(const char *filter,
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
  * igt_device_get_pretty_name
  * @card: pointer to igt_device_card struct
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index 92741fe3c..2a61777b0 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -92,6 +92,8 @@ bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
 bool igt_device_find_integrated_card(struct igt_device_card *card);
 bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
 bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
+bool igt_device_find_card_by_sysname(const char *sysname,
+				     struct igt_device_card *card);
 char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
 int igt_open_card(struct igt_device_card *card);
 int igt_open_render(struct igt_device_card *card);
-- 
2.48.1

