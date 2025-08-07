Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C361CA0EC1
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A6110E803;
	Thu,  7 Aug 2025 07:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R6Xcf+Hm";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9905010E7FA
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:27 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-459ddf83023so4039705e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552786; x=1755157586; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S71lcVxdq2pFxuh+sHAvSfM9LOd2QUgpUuzf9D5y0AM=;
 b=R6Xcf+HmBcM6HZm1zEooU1OM+ICg2gmgxhAfKVm7XQkFf5wh/h0m/cPqjO6emjzGWH
 iVsB3NiSBPxEBeXPRpn+HakUM+Jzs1zHfa8BZNvKN24o2cssr5aZrsREZwkRSWdjAGMF
 bv/lg/OxAem/YhXPIHXiocxIZ0WGq7qbb7Uh/bQhgip3LhZ/u03MkVTZ1JWmeGbUX8gX
 i/f0NJYjQ4j4gz1p96kG4r/qgz/2tb3+PJtY1bkTIY6djyRah1XYZ6/TYA27q6MQnfWr
 +KireiEKoczA4TUN+nViuKJEBGRY/DCS2yYJBNcVbvnSZav0+fSCfuiDfoNqxZ6iQrcX
 yhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552786; x=1755157586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S71lcVxdq2pFxuh+sHAvSfM9LOd2QUgpUuzf9D5y0AM=;
 b=ErD1Wq3dMaHXd6uSnU2EOTtv+UrL3UPxkrDhARJYjpQCVlCYJNQubigsyaKNgKh2Vz
 GkbHPfdlSnb9Vu++d9L1RIocYG50PUbXAeAAsr1JRSdZTrfdmP3r4u8ntaLojUO4exhq
 MfORVVf+ovK6bKpf/oNkSGzgv2rEaeLRO0ZmAjCy19Civ3fzggKMbPpgxDx1N1vmiL7J
 eHrTATp/QQYg+qd1auYArTyWx7JE4UsacktxLGaayo7ckOajNTMjZhl7OhVZEBno2Qon
 5OYL04VH3ozf0Md7wwMofELApooKVQIgfH+y2dwLDpXuH49KzqGptnxpgW8IoMZR1auI
 u+wA==
X-Gm-Message-State: AOJu0YwVq+XAN8FhTSYd6TQDYYZbtVo/XhhFHQ3CibdOSamfq+dKe6RT
 u6w2oodtcTt0bnMSWZqNM2u6JhoSM56XiX5+kqRFZeHu1wPZJD4SoaUtt2/JMY2S
X-Gm-Gg: ASbGncvWMgds1KEnjjCHe7E/XJ/OjfeB/4BxbiuN6JUks94PomEz0yn8aMt71BTlL+M
 hk4dGt30GwHptxa2UEeYY4MXH91Bz8Qow0Mut8ysYeCCPlYAYlv2UrmwLODHahGdtBRJAVJDC/m
 0wHwSeRzCZY2Y3H8ZL0ZQCqWK9lgrH/Zqv6qj0KfO9b6LPwj/QfqJb7evQMcSr0kY+0xtUxbB2W
 hcTEoGB/MLE2JLtqmHzbok2NDTIqgAxhcC9O6mMJN4JOUBNsR/iCCb3mNWSZS10vJ5VXbQefTb+
 CdDk6n/FWW4tZLERdds7YDuEVYfDYqgREd99D7MIJORyTzG64OFKWLtc1qDfa5Su1zLrXpP5EO7
 uuLpt6UZS9gBNxuBRKX4=
X-Google-Smtp-Source: AGHT+IH8QLpZLy02gSMtIuPEfpOcprwCHsLoXnwF1NpdhQ+QsW3OUg225CjRGtWJ6txVXovnQFDzPg==
X-Received: by 2002:a05:600c:314a:b0:459:d780:3602 with SMTP id
 5b1f17b1804b1-459e74b75ddmr44513635e9.23.1754552785782; 
 Thu, 07 Aug 2025 00:46:25 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:25 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 21/41] lib/igt_device_scan: Allow to find device by
 sysname
Date: Thu,  7 Aug 2025 09:45:30 +0200
Message-ID: <20250807074550.6543-22-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807074550.6543-1-jose.exposito89@gmail.com>
References: <20250807074550.6543-1-jose.exposito89@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
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
2.50.1

