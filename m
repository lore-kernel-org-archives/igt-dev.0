Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFBEE77170
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 16:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9EC10E02C;
	Wed,  4 Dec 2024 16:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7PU6Y38";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1804410E02C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 16:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733329473; x=1764865473;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AZ7wyOKWf3eRdH/IMvkEO3CA5YUu4VcDxAa76X5j7To=;
 b=Z7PU6Y38v2d+gLvbBbZqnp8IoeQh/CZb7SoeNc5gNq3Pn6a/GgxW5M/t
 qhlqVe5aaysPj7eUP4H+chNF4wwSFz/GgC/4Rs/9g1JJw5/by/tPteAtN
 QeMvolx36vXt6yYG9GVYctPIyMwSCFoCjVVw2P6rtNvA6rbUEgubZMAhQ
 Zdbk9sOVMJSocjB1qUmFbmQVWg0ZMrZX3qACUNyyVWHRxjVoGYjmGdzTc
 5RMy+NRgVf3nr0C/iZQ4DYi24659VYUZhm+onxhHIj+ULGVeWVGzlrji4
 FuZ3xbvyvE6i9AvPGbJRW+lO1D91Sj5LA5vWqSKo4U7tZIwJNBaHmlFkw g==;
X-CSE-ConnectionGUID: YPzJv7jRQEaOYoe+USw9eQ==
X-CSE-MsgGUID: yVdO8zHnSjCau6SIUYMqpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33350470"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="33350470"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 08:24:32 -0800
X-CSE-ConnectionGUID: 3SzksBXvR+yR+XT12iO0cg==
X-CSE-MsgGUID: kbP2iPQtQQaeteRjasZI7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="94643927"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 08:24:31 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t 0/1] Add test for configurable OA buffer size
Date: Wed,  4 Dec 2024 21:46:05 +0530
Message-Id: <20241204161606.363295-1-sai.teja.pottumuttu@intel.com>
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

The patch series adds a new test for configurable OA buffer size.
The new test oa-buffer-size checks if the oa buffer is being allocated
with the requested size and tries filling it twice to check the overflows.

Note that I would add a separate sync commit for xe_drm.h once the 
respective kernel patch is merged.

Sai Teja Pottumuttu (1):
  tests/intel/xe_oa: Add test for different OA buffer sizes

 include/drm-uapi/xe_drm.h |  8 +++++
 tests/intel/xe_oa.c       | 71 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

-- 
2.34.1

