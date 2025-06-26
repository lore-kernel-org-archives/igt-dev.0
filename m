Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECB9C7EE39
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 09:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9403B10E130;
	Thu, 26 Jun 2025 09:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jynwcatg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3920B10E130
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750929756; x=1782465756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OmpqB6f7VpY6lwFumLvsMPsy7RLCFL0aqpGeHaV9S8w=;
 b=jynwcatgGXIOynRpgY7y8VSRadxgOkqSeZBR9nO1k3Z56MFk6EUiYeJa
 tq1TVFs38uY73B89+jfSLakLyfbY5mdIpO9X6QJriXWQeoKUibcdYU0pi
 hVj9jK4W2oMvZt0XKd4vNK6FOIrd4B8xw65DFzIkP/u0nku++vBUmEe72
 D7s5YZE2OchYVkl4Oi/WkaWSnAkg5NBf8GqfrfCKU0A9d1AoEyTcNmaOT
 4bxx/q5m7tyt/jkv+CcjtbGMQh3Io8G2fc15q9+rjzwtnScWxOm6+Tyb3
 1NYouXFMNm7fD/uG2vGTNZPzPtDK4w4BDZHvx0v7VBH+i11tsre3buokQ A==;
X-CSE-ConnectionGUID: +cRk73XMR9C7y3StIZoBuw==
X-CSE-MsgGUID: +ZuZ1t+VRP6Xy4YaPQ2vsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="57003009"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="57003009"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 02:22:35 -0700
X-CSE-ConnectionGUID: eZ6PRrqhRcSOB4Uk0Z2QWg==
X-CSE-MsgGUID: mTYwoVJNTmOvqitctzygvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="157959987"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 02:22:31 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH v15 0/5] Add per-device engine activity stats in GPUTOP
Date: Thu, 26 Jun 2025 14:46:21 +0530
Message-Id: <20250626091626.3760324-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
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

 Add per-device engine activity stat support in GPUTOP.
This leverages the PMU interface to display the activity of
engine instances for the array of requested or all devices.

 This patch refactors GPUTOP to be vendor-agnostic, laying
the groundwork for future support of multiple GPU vendors.

 Currently, GPUTOP supports GPUs with Xe driver only
and can monitor the engine activities of multiple GPU
devices simultaneously through abstracting vendor 
specific code into a common interface and implementing 
vendor-neutral APIs for monitoring.

DRIVER: xe || BDF: 0000:03:00.0
   GT:0 Render/3D/0| 99.1% ███████████████████████████████████████████████████|
     GT:0 Blitter/0| 59.2% ██████████████████████████████                     |
     GT:0 Compute/0| 49.2% █████████████████████████                          |
       GT:1 Video/0| 89.3% ██████████████████████████████████████████████     |
       GT:1 Video/1|  0.0%                                                    |
GT:1 VideoEnhance/0| 98.5% ██████████████████████████████████████████████████ |
GT:1 VideoEnhance/1|  0.0%                                                    |

Soham Purkait (5):
  lib/igt_device_scan: Add support for the device filter
  lib/igt_device_scan: Enable finding all matched IGT devices
  tools/gputop/utils: Add gputop utility functions common to all drivers
  tools/gputop/xe_gputop: Add gputop support for xe specific devices
  tools/gputop/gputop: Enable support for multiple GPUs and instances

 lib/igt_device_scan.c       | 128 +++++++++++++
 lib/igt_device_scan.h       |   1 +
 tools/{ => gputop}/gputop.c | 237 +++++++++++++++++++----
 tools/gputop/meson.build    |   6 +
 tools/gputop/utils.c        |  51 +++++
 tools/gputop/utils.h        |  63 +++++++
 tools/gputop/xe_gputop.c    | 361 ++++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h    |  59 ++++++
 tools/meson.build           |   6 +-
 9 files changed, 868 insertions(+), 44 deletions(-)
 rename tools/{ => gputop}/gputop.c (64%)
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.34.1

