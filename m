Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14794EC1122
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 19:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F6510E41E;
	Mon, 23 Feb 2026 19:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ybam2iXC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870CC10E421
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 19:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771873276; x=1803409276;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/nr7g7k8Rtyhq4vfykU+vSEQ2tW/251cNv039ou8448=;
 b=Ybam2iXC5ryLeM0GmgvTX0bTArCM0D5KOD2tj4FfD+s01zV8M1eKQMt/
 lmlmq8W95RzOfSdOfiNTRU7yGcnyjBVD5wtjX8z7Xi8HNnKQY3qn1tX8g
 11JeHomZJWTyCcAUOB4H3pZ/1NfMLkHxv4FwvxXx51wD1vtlCHzBJ3Ede
 m0BHrx3Mv7gEL+SHt9acLXjAr1aZNf4NPmxlAhWWKUVdRryOu6g50spei
 t7BJaQA1oxs0QbR5mrdLr3vvWf8Oemex48TQGql7uNYbXW95JiQpe8wgS
 AR7Sxt2f4JVSCjEZFw6EKYv3hawV4FkEvhXiDj50IwpvNYp/2AgZcsy0X Q==;
X-CSE-ConnectionGUID: By/Q7TxwQ3WG1z6nZjINew==
X-CSE-MsgGUID: r/UvPW6lQQO7uqqBJ8UDMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72755000"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72755000"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 10:59:18 -0800
X-CSE-ConnectionGUID: u8N3jKaOThuxdXqsebep7Q==
X-CSE-MsgGUID: XC0U1kUaRmqBat3/+7m2+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215674770"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 10:59:17 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH i-g-t] lib/igt_device_scan: Fix attributes fetching
Date: Mon, 23 Feb 2026 19:59:05 +0100
Message-Id: <20260223185906.16168-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Don't skip NULL attribute values too early, as some symlinks are not
resolved by udev and are handled later in igt_device_add_attr().

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/igt_device_scan.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index fc01fc375b..7c7995224b 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -593,8 +593,6 @@ static void get_attrs_limited(struct udev_device *dev, struct igt_device *idev)
 
 	for (int i = 0; i < ARRAY_SIZE(attrs); i++) {
 		value = udev_device_get_sysattr_value(dev, attrs[i]);
-		if (!value)
-			continue;
 		igt_device_add_attr(idev, attrs[i], value);
 		DBG("attr: %s, val: %s\n", attrs[i], value);
 	}
-- 
2.40.0

