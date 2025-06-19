Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8701C7115B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Jun 2025 19:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA9B10E035;
	Thu, 19 Jun 2025 19:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TApDVUy4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C43C10E035
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jun 2025 19:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750361253; x=1781897253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AtxXxRRlL6MYgWkWk2MyLAuSKxYFV7UnfoEbAF/QrOI=;
 b=TApDVUy44XHIMhPxD5fZJ6YzVU9QagcemBrM4mUoEqgWiVLHRJlCoOpd
 7bzNCBULJBVSM/xiLWO5B1LwrHu0zd1Ro+elEm4CwXtcmhmKPcKwwqHaK
 V9vzYT8+t1M1fTAb5plgfFZTQprYrovDMGaxkaRHQktdQVXVmaTvCUvQX
 0wiq1Vs3dXva6gz/btGllnBJ5Z8zOrJRXxLy6JwYFO/oEYIFHo3Tcxgxp
 dMtMeYuagnvZjF1XAtXsTe6QAijfeJOYpN7GVxLHRheIrH8nnQOi/l3JK
 1rq2ZF9gkrKDZcz5Fvbgq7GxAYwQOW9znI1Uhlb4PMBJJvPjDpROQaQZg Q==;
X-CSE-ConnectionGUID: vhqPSZKZQ/C/cQFaG3tm7A==
X-CSE-MsgGUID: 5kvsO4DIR1CQ+pTcoapzKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52319472"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="52319472"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 12:27:29 -0700
X-CSE-ConnectionGUID: 0Q6DaunNSSuqrHxyGQm8ZA==
X-CSE-MsgGUID: PunbuCcGRVKrqP87s0a4kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="155101173"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 12:27:26 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH v13 0/5] Add per-device engine activity stats in GPUTOP
Date: Fri, 20 Jun 2025 00:51:31 +0530
Message-Id: <20250619192136.3026910-1-soham.purkait@intel.com>
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
    This patch refactors GPUTOP to be vendor-agnostic, 
laying the groundwork for future support of multiple 
GPU vendors.
    Currently, GPUTOP supports GPUs with Xe driver only
and can monitor the engine activities of multiple GPU
devices simultaneously through abstracting vendor 
specific code into a common interface and implementing 
vendor-neutral APIs for monitoring.

DRIVER: xe || BDF: 0000:00:02.0
ENGINES         BUSY
Render/3D/0   | 96.5% ███████████████████████████████████████ |
Blitter/0     | 91.6% █████████████████████████████████████   |
Video/0       | 56.2% ███████████████████████████             |
VideoEnhance/0| 97.7% ████████████████████████████████████████|
Compute/0     | 48.5% ███████████████████████                 |

Soham Purkait (5):
  lib/igt_device_scan: Add support for the device filter
  lib/igt_device_scan: Enable finding all matched IGT devices
  tools/gputop/utils: Add gputop utility functions common to all drivers
  tools/gputop/xe_gputop: Add gputop support for xe specific devices
  tools/gputop/gputop: Enable support for multiple GPUs and instances

 lib/igt_device_scan.c       | 128 +++++++++++++
 lib/igt_device_scan.h       |   1 +
 tools/{ => gputop}/gputop.c | 229 +++++++++++++++++++----
 tools/gputop/meson.build    |   6 +
 tools/gputop/utils.c        |  51 ++++++
 tools/gputop/utils.h        |  62 +++++++
 tools/gputop/xe_gputop.c    | 353 ++++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h    |  59 ++++++
 tools/meson.build           |   6 +-
 9 files changed, 851 insertions(+), 44 deletions(-)
 rename tools/{ => gputop}/gputop.c (65%)
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.34.1

