Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945CCC3DA59
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 07:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EE010E3B0;
	Mon, 22 Jul 2024 07:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAwFtkUL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF76610E3B2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jul 2024 07:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721634037; x=1753170037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3GFFGpVEIqGEIbXTH1qma+FWPFgzHAdE21i6D46isP4=;
 b=XAwFtkUL19ZTBJd13dAq8G5g5tuUouIq+Es8xCgI2LLQo1J+hLkdP0TQ
 80pHIKnnIgtDPh75y7mO4VAI9fIb0UHsmseSnlpLqSlHpywnibLr3+2Eb
 AV1IoTS9y45x9fntrXVe7xfUHVZCtG986PWWrqAiKI6yIulOiwqkoBqZU
 ImtniEunaQ2cwwVoG5rfGZU8OSRco4Wll+NBoWM++s6FZ7Qnd0kMAS/y7
 ZTSAJYqmqKXz0DRE1zj+fmWx14HJY4Rmf5y021Ark/ZIwI7xirbvkM+6D
 g8viNBsCn05wjECxSbU98kLjxc4dhFDDWRYy4L6c9HTQo6ufExkbksOLX g==;
X-CSE-ConnectionGUID: DCriPTvlSvyzTKMqLGqwTw==
X-CSE-MsgGUID: JRlO7slfRWCuKAf9q9cyuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="22995963"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="22995963"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 00:40:36 -0700
X-CSE-ConnectionGUID: M+Mf3LuiSvCOXWZWU9lNOg==
X-CSE-MsgGUID: OMBQqNisSuScZA2mOgKMGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="52066058"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 00:40:33 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, animesh.manna@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] New test to validate link-off between active
 regions (LOBF)
Date: Mon, 22 Jul 2024 13:20:46 +0530
Message-Id: <20240722075048.2616411-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add debugfs entry to validate LOBF status and create a new
test to validate.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  lib/igt_kms: Added library functions for LOBF status
  tests/kms_vrr: Add new test to validate LOBF

 lib/igt_kms.c   | 23 ++++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 79 insertions(+), 2 deletions(-)

-- 
2.25.1

