Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A859D35173
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 15:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102E110EE28;
	Wed,  1 Apr 2026 15:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMDPu3Sq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68D010EE28
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 15:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775057592; x=1806593592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zicyPbIVUPNdKIUqJbcYqUt4MGoBcJKhBa6EIxQjaIo=;
 b=RMDPu3Sq5uZVd5/VPdnkl0cFDjMPB8IvEctDg1UuRzKypF3lAPabCFGL
 vLbLsm1/JTuIVuXA17F4/d0U2pNBEuS5huBERIqT0rMCJIaSdmbCEQJr6
 Rujte2TFYvbNSVcRXaTVSdSd832U8IICY2sN3UJp0SxBGk1FIrM91yr+j
 SMiM3fVriGrhvTQrTYIwL8lI0thJ7TLtxDEf8wqkWWwHEcI+vNuPVex2s
 /aacJmRSoYEvBRwcuQU6ijmnz1PaA2H5WVaIXmduFFZmXvDxuE9YIhQ2Q
 FuzkikzLrhmWSPR3VRiqckmJBbALrKHJC0Nw1HRXQY12VLPvXMBLVqKB/ A==;
X-CSE-ConnectionGUID: FwnWQw2sTWCB90JRQgPOPA==
X-CSE-MsgGUID: C5ELxGiGSByFLjPvBsWN+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75815488"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75815488"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 08:33:12 -0700
X-CSE-ConnectionGUID: I270rRG2R1i/x0czWQBBqA==
X-CSE-MsgGUID: 49NfsRQWQEyOe4A0hXyOAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="230775664"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 08:33:10 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 0/2] RFC: Add modifier helper and temporary test
Date: Wed,  1 Apr 2026 21:01:46 +0530
Message-ID: <20260401153149.635481-1-jeevan.b@intel.com>
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

