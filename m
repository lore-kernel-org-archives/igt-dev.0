Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E047E77180
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 04:44:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E67510E18F;
	Thu, 12 Dec 2024 04:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nK70CXoc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4948910E18F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 04:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733978689; x=1765514689;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BAHLd/ELDjCIGNXtLUfLHxyyScKwd6IyaWYoeMB/dhk=;
 b=nK70CXoclf+0tcimttrMF6lEC20XBKEjHYEY8xjwVNSQGwNGtGQCtie4
 tf9zk8aTM7TC+MDYWlhBe9c6LruQZqs9ylsM/xeOSXkNMcn2akvxbVe2O
 xFhT5inHwT5wABp0HJzxhwB8UxPO9TgyC7afDPo+5YrTtSsagT/qhuTUZ
 vzp4QdalN17X9GAjZNGBB/GuW3YcUDm/lJp6s/IU6kb1nr7uPCT+g2YXU
 Eex2D7Rkz0cj/QqztlJTtua7P58h+p63jOkH917TGIodvOuABwCRiGeSi
 r9h3WpXENzjAQObaZAZJcRSJYBEhJSw3mM/H5LO9aG1y7ecagm/YI4VNj Q==;
X-CSE-ConnectionGUID: tMwvy5ZRR2Czqvm9TBq2tw==
X-CSE-MsgGUID: 4G2VBKzDRzy10tGC5AnPYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="56855885"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="56855885"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 20:44:49 -0800
X-CSE-ConnectionGUID: Y6Pm0sQ3TLukrJ45PUa85g==
X-CSE-MsgGUID: Y785Xw+UTl6m/0jz8Y8J2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119335810"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 20:44:47 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 0/1] Add ultra joiner to kms_invalid_mode
Date: Thu, 12 Dec 2024 10:09:02 +0530
Message-Id: <20241212043903.2255318-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Introduce `can_ultrajoiner` function to check if the platform
supports ultrajoiner.

Modify `adjust_mode_clock_too_high` to utilize ultrajoiner support,
increasing `max_dotclock` by a factor of 4 if supported

Santhosh Reddy Guddati (1):
  tests/kms_invalid_mode: Add ultrajoiner support to
    adjust_mode_clock_too_high

 tests/kms_invalid_mode.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.34.1

