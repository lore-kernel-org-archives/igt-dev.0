Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ADEC54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 16:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FCA10E744;
	Mon, 25 Mar 2024 16:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y3fIH5Ta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E950310E744
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711384849; x=1742920849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XLLwEvSYN+QhLnDOXSOzT1O9Fl2IJ2xqzwjA1d5sCfo=;
 b=Y3fIH5Ta6e2C0Ubn1FzUTildN7mZVKuXwLzp9rd9LT7P47wHLK5E1JDa
 M4eOTc3G0ztvgz6lO7CyzvD7cBu7yU6yyxvSjGly/T1BYTSu6eJL0JPXy
 2PIunP/tAWbGgsVf3Opt+rNURgySlmt8YXP85XItLyk8m5EguYYl//269
 Un1mtBSe7/mW8z0EZU58Vo3jt/Uip/Qd9rqfgqnxq+cMHUdEuW6hNE0cK
 EEPAZ+dPC22Pqd1FGUMA6m09boJ9hPOVwWnjtRwcxu4sJ5SaTpmlmScaH
 lhLjb2ubu58JDS4bGSZxChxf7+dT/gQ4M7Xo0JwB0atsooW4peqTzAz77 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17132540"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17132540"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 09:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="38784662"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 09:40:47 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>
Subject: [PATCH i-g-t 0/4] revamp big joiner test
Date: Mon, 25 Mar 2024 22:21:32 +0530
Message-Id: <20240325165136.1265895-1-kunal1.joshi@intel.com>
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

From: Pranay Samala <pranay.samala@intel.com>

modify test to support multiple big joiner outputs
simultaneously, support for ignoring fused pipes and
addition of subtests for testing force joiner support for
which is added by below in kmd.

drm/i915: Add bigjoiner force enable option to debugfs

Kunal Joshi (4):
  lib/igt_kms: move bigjoiner_mode_found to lib
  tests/intel/kms_big_joiner: revamp bigjoiner
  lib/igt_kms: add helper to enable/disable force joiner
  tests/intel/kms_big_joiner: add tests for force joiner

 lib/igt_kms.c                |  79 ++++++
 lib/igt_kms.h                |   4 +
 tests/intel/kms_big_joiner.c | 469 ++++++++++++++++++++---------------
 3 files changed, 350 insertions(+), 202 deletions(-)

-- 
2.34.1

