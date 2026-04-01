Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2868410F6FBF
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 15:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA4010EE2D;
	Wed,  1 Apr 2026 15:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMLxURw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3441110EE1B
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775057221; x=1806593221;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zicyPbIVUPNdKIUqJbcYqUt4MGoBcJKhBa6EIxQjaIo=;
 b=DMLxURw1NynrLoByycpnZOak5nWRa9syqGq7AD3k7ZzgXyMI+murCkfW
 87n9B4AcuISO2skxaAxZmuBzOQEgXbv3NICW/IvRs1EbNwXM8HwhpeRUf
 3AI4DnQJv5hF7J/Ne/vqIQxmDB/ZKs5onR8tYHBMTP7R64B8OZb2fQtoo
 u0u+njCP/UHgOkTwpUHPNvOG9PhlLR85bLfU3D0BPD+PZgKHWVt2yDSnq
 jXG5/M7qwLwqrx2Zf+7zA7oyePcnAJU6ouOzeUv1RZ/zFoeoFcmWJxCm6
 ZVYvLGhPNlsptWjnMwhz4lnTwZkgtbiSfzL/PcMDpYq+zzIz8IT7KkOGq w==;
X-CSE-ConnectionGUID: ZlPGCceTRF6eHcADEXe0mA==
X-CSE-MsgGUID: pQTUnGl0RCeslt1dkt2ihQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79704699"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79704699"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 08:27:00 -0700
X-CSE-ConnectionGUID: YhNz/wLiTTG1zK4fTf1eyQ==
X-CSE-MsgGUID: ezHqEpVdSVqsDdaNDfrmzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="228324384"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 08:26:59 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 0/2] RFC: Add modifier helper and temporary test
Date: Wed,  1 Apr 2026 20:55:35 +0530
Message-ID: <20260401152538.632846-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series adds a new helper for querying driver-supported format
modifiers and a temporary test to verify that the helper outputs the
expected modifier list.

Jeevan B (2):
  lib: Add modifier helper for querying driver-supported modifiers
  DONT_MERGE: Add kms_modifier_list test to verify new modifier helper

 lib/igt_modifier.c        | 242 ++++++++++++++++++++++++++++++++++++++
 lib/igt_modifier.h        |  18 +++
 lib/meson.build           |   1 +
 tests/kms_modifier_list.c | 127 ++++++++++++++++++++
 tests/meson.build         |   1 +
 5 files changed, 389 insertions(+)
 create mode 100644 lib/igt_modifier.c
 create mode 100644 lib/igt_modifier.h
 create mode 100644 tests/kms_modifier_list.c

-- 
2.43.0

