Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B880C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 06:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C0F10E02B;
	Thu, 13 Mar 2025 06:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kx1F7AM0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3D310E7FC
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 06:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741847107; x=1773383107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NuGT6m/25o7jY+z2umeKtznde6L7X0aAz9LSP3XBIfg=;
 b=Kx1F7AM0qtiuBz31nYDrYVEbw9Fvmydks+ULvxOruoi4TEypdtCUNzks
 eljWOtU6hrZ3VVT5zx0doNgiNgPDSH5xpSEN34DcVnD1WWJYR24jhWl9H
 +y8uI98il5mOYc16G6Mo/E0WyviP/osAzccvc7uzO4TJqQptXG7hJW2Ed
 0DFpO8s/vU1n1R0xPCBrBMiKK+A72zTt0pzaFXkCk2UJfGIZe2uVQrtni
 SioWPr3UrS8u/ATxy14G7aotErLWR4z6zbjkrVA50NXpG5pBgaZcOX5SG
 xVy22TFf9DdIYwQZiTClZgsANSDQqxNXG3dgPJJwo6yfrzUmmdDwhj8PU A==;
X-CSE-ConnectionGUID: xnlpuB/eSWuCB2XDZWIStw==
X-CSE-MsgGUID: XJRfmHPQSXmACG8KK+tQNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42829698"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="42829698"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:25:06 -0700
X-CSE-ConnectionGUID: trzgO643SZS1zj1w/eZ7Tg==
X-CSE-MsgGUID: YxX7iY76QeedCmZocY3N1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="158022869"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:25:03 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, jonathan.ming.jun.lui@intel.com
Subject: [PATCH <i-g-t> v4 0/4] Add single engine busyness stats in GPUTOP
Date: Thu, 13 Mar 2025 11:51:50 +0530
Message-Id: <20250313062154.1601701-1-soham.purkait@intel.com>
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

      Add single engine busyness support in GPUTOP.
This uses the PMU interface to display the busyness
of each engine instances. 
    This patch refactors GPUTOP to be vendor-agnostic, 
laying the groundwork for future support of multiple 
GPU vendors.
    Currently, GPUTOP supports GPUs with Xe driver only
and can monitor the engine busyness of multiple GPU
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

Soham Purkait (4):
  lib/igt_device_scan: Enable finding all IGT devices for a specific
		       driver
  tools/gputop/utils: Add gputop utility functions common to all drivers
  tools/gputop/xe_gputop: Add gputop support for xe specific devices
  tools/gputop/gputop: Enable support for multiple GPUs and instances

 lib/igt_device_scan.c       |  58 ++++++
 lib/igt_device_scan.h       |   3 +
 tools/{ => gputop}/gputop.c | 211 ++++++++++++++++----
 tools/gputop/meson.build    |   6 +
 tools/gputop/utils.c        |  51 +++++
 tools/gputop/utils.h        |  55 ++++++
 tools/gputop/xe_gputop.c    | 372 ++++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h    |  73 +++++++
 tools/meson.build           |   6 +-
 9 files changed, 789 insertions(+), 46 deletions(-)
 rename tools/{ => gputop}/gputop.c (69%)
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.34.1

