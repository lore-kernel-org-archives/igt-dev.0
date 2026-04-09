Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3231E98FA9
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 04:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648C510E0FF;
	Thu,  9 Apr 2026 04:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAskoN+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF7510E0FF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 04:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775708154; x=1807244154;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R3FH3TfoQk9T6KiQgCjhQXhHPbxf48JMQp4x8ZFhUrM=;
 b=CAskoN+a4PTKg5rvvUAxZFmAZ5Kq6YLxp5wuRSDp8UbdHUVfuC6qNWd5
 OoZ/nfq1Akxp7US9M6oAaJZohTgW3k75TND2LTnqyeG+ndYPhFwZNkULL
 N3gqXDQJ38vGxQP8/FFSali3vpdjrB4DehpSRfG2/vQWbnk1JcoSbwi/L
 OrN2e1h7Ez7EG5GE8dnTIIXhr1LBut3SP7hyOrsOaybeHpBSSt1GyCK6i
 +9tWN0RdWS37rOBxjP5m/0TsMnNVmu1sDffMA8PC6yHZYBOU/E2XJclgL
 lyiXr8YscwP/Ev0PW5U88zbyqbI0C/KjEQEXtvPrc1f6VrgisidHOT7Ym g==;
X-CSE-ConnectionGUID: MVkV//FLQHuFT+SgTnhDDw==
X-CSE-MsgGUID: XvJniMPERZC3xhj3YNU9Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76608374"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="76608374"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 21:15:53 -0700
X-CSE-ConnectionGUID: VpFan2NLTsmxzyCF2OIOsg==
X-CSE-MsgGUID: vMqMTNa4Skmb65isNM5Flw==
X-ExtLoop1: 1
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 21:15:51 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/6] add test to validate dock/undock and switch
Date: Thu,  9 Apr 2026 10:07:08 +0530
Message-Id: <20260409043714.284108-1-kunal1.joshi@intel.com>
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

Add test to validate docking/undocking scenarios on TBT Hub
and switching from TBT/DP-ALT to DP-ALT/TBT mode.

Relies on Microsoft USB4 switch 3141 for the same
Below is link to documentation for Microsoft USB4 switch 3141
https://mcci.com/wp-content/uploads/2021/09/950001601a_Model-3141-USB4%E2%84%A2-Switch-User-Manual.pdf

Kunal Joshi (6):
  lib/igt_edid: add EDID serial extraction helpers
  lib/igt_connector_helper: Add generic connector helpers
  lib/igt_serial: add generic serial communication helper
  lib/igt_usb4_switch: add helper library for USB4 Switch 3141
  tests/kms_feature_discovery: add basic usb4 switch discovery
  tests/intel/kms_usb4_switch: Add USB4 switch test suite

 lib/igt_connector_helper.c    |  299 ++++++++
 lib/igt_connector_helper.h    |   27 +
 lib/igt_edid.c                |   91 +++
 lib/igt_edid.h                |    5 +
 lib/igt_serial.c              |  435 ++++++++++++
 lib/igt_serial.h              |   32 +
 lib/igt_usb4_switch.c         | 1055 +++++++++++++++++++++++++++
 lib/igt_usb4_switch.h         |  157 +++++
 lib/meson.build               |    3 +
 tests/intel/kms_usb4_switch.c | 1254 +++++++++++++++++++++++++++++++++
 tests/kms_feature_discovery.c |   23 +
 tests/meson.build             |    2 +
 12 files changed, 3383 insertions(+)
 create mode 100644 lib/igt_connector_helper.c
 create mode 100644 lib/igt_connector_helper.h
 create mode 100644 lib/igt_serial.c
 create mode 100644 lib/igt_serial.h
 create mode 100644 lib/igt_usb4_switch.c
 create mode 100644 lib/igt_usb4_switch.h
 create mode 100644 tests/intel/kms_usb4_switch.c

-- 
2.25.1

