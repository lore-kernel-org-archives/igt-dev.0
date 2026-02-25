Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4E5FD45E2
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 19:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE7C10E7F5;
	Wed, 25 Feb 2026 19:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CiC62dCx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CDD10E7F5
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 19:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772047274; x=1803583274;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iydNMivBqBvCm4R+CujkvfC28A89hVuTAL7iMuL9vV0=;
 b=CiC62dCxxj561cI3YROg+9i1ebvwBWyM5NgxUwXVb+1Lwc+ng0LnYdAu
 rtnQaFtYkOjpwuERdUOnNh/VMAJCq01MbXq47FAtJhJMiH7hf84g+0I56
 RI+vkx2UwhpENs4whgf4UAsK8RrBU5RQAL+7v2Zx91MaEpHMU/CO+X13H
 lvWpu1uDAmPS84uK7Fp56jN57SCbhHJvjfvILg7pq1s+w6gQbueBtyShN
 7jTLc5Wlmr3pvTwGErUZ2Ymq1lIBr55ISRXfgJPXCVJB61/Zuqe/Lqjh4
 fUqv/KJxjlXLRY7br0Qa9FYkUlAIvGXU6wzGREhnAb9v8lq/882VehqXE g==;
X-CSE-ConnectionGUID: obVnbfKbQ+2Gd6hc6n4xTQ==
X-CSE-MsgGUID: Fk2wR1D6Shq6VzHpVl2I4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73074285"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73074285"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 11:21:13 -0800
X-CSE-ConnectionGUID: CzIJGKvhShWOEvLzEy82Pg==
X-CSE-MsgGUID: I+XQw5A/TmKye5rDdTUR6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="221314345"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 11:21:12 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/6] add test to validate dock/undock and switch
Date: Thu, 26 Feb 2026 01:12:22 +0530
Message-Id: <20260225194228.853418-1-kunal1.joshi@intel.com>
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
 tests/intel/kms_usb4_switch.c | 1251 +++++++++++++++++++++++++++++++++
 tests/kms_feature_discovery.c |   23 +
 tests/meson.build             |    2 +
 12 files changed, 3380 insertions(+)
 create mode 100644 lib/igt_connector_helper.c
 create mode 100644 lib/igt_connector_helper.h
 create mode 100644 lib/igt_serial.c
 create mode 100644 lib/igt_serial.h
 create mode 100644 lib/igt_usb4_switch.c
 create mode 100644 lib/igt_usb4_switch.h
 create mode 100644 tests/intel/kms_usb4_switch.c

-- 
2.25.1

