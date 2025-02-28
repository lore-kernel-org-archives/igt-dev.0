Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8154FC19776
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 14:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F22210ECB4;
	Fri, 28 Feb 2025 14:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rbpkx3Pl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5132D10ECB4
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 14:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740752456; x=1772288456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dC8aUoB7Us8H0IyMsK+2syBtWHlNSwVaUh6Qc732Lkw=;
 b=Rbpkx3Pl3XgeqVF9LE7bW+TdWuXFHRAmpTMuq7AmgVNhtsISdvP1p3Zz
 YvPfqtehfC399/4Ssg24oQodQ/iH4D5nGUtTYMqgVpQhoGGPJn49xRqHy
 SIIwGuL5Mc6fJbg4CgsN+0KxXv69x3yjX5/F1FlWoANHEW9CKns0lsx4b
 UlVn0PQ9OFuaSaqe/FfZcQm3TgkXJ3W77+odzXVXvqtxzl25wF9of4+qA
 edgtRHCkHSgvR+XjqhCUa2w9JkLNP4Wi19oHqQgE1fgwk049+SHa3knt3
 970YCPcwKAmCIlMyhSfyxBnGLjFbenQJslgOpko3MVDjqX1X+ERfdl0XF Q==;
X-CSE-ConnectionGUID: IjyM5schTrCxqtRLpFvYMA==
X-CSE-MsgGUID: cmAMBhAQSJ2+EBTDx6FAig==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="51885197"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="51885197"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 06:20:56 -0800
X-CSE-ConnectionGUID: 5vM+3fkdT+C9deRqjbrA6A==
X-CSE-MsgGUID: kCe4xHbDQryEin5WNxLrsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="121955014"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 06:20:53 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, jonathan.ming.jun.lui@intel.com
Subject: [PATCH i-g-t v3 0/4] Add single engine busyness stats in GPUTOP
Date: Fri, 28 Feb 2025 19:48:06 +0530
Message-Id: <20250228141810.1417657-1-soham.purkait@intel.com>
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

Add single engine busyness support in GPUTOP. This uses 
the PMU interface to display the busyness of each 
engine instances. 
This patch refactors GPUTOP to be vendor-agnostic, 
laying the groundwork for future support of multiple 
GPU vendors.
Currently, GPUTOP supports GPUs with Xe driver only and can 
monitor the engine busyness of multiple GPU devices 
simultaneously through abstracting vendor-specific code 
into a common interface and implementing vendor-neutral 
APIs for monitoring.

DRIVER: xe || SLOT: 0000:00:02.0
ENGINES         BUSY
Render/3D/0   | 96.5% ███████████████████████████████████████ |
Blitter/0     | 91.6% █████████████████████████████████████   |
Video/0       | 56.2% ███████████████████████████             |
VideoEnhance/0| 97.7% ████████████████████████████████████████|
Compute/0     | 48.5% ███████████████████████                 |

Soham Purkait (4):
  lib/igt_device_scan: Enable finding all IGT devices for xe driver
  tools/gputop/common_gputop: Add gputop functionality common to all drivers
  tools/gputop/xe_gputop: Add gputop support for xe specific devices
  tools/gputop: Enable support for multiple GPUs and instances

 lib/igt_device_scan.c        |  97 +++++++++
 lib/igt_device_scan.h        |   3 +
 tools/gputop/common_gputop.c |  79 +++++++
 tools/gputop/common_gputop.h |  58 +++++
 tools/{ => gputop}/gputop.c  | 203 ++++++++++++++----
 tools/gputop/meson.build     |   6 +
 tools/gputop/xe_gputop.c     | 404 +++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h     |  74 +++++++
 tools/meson.build            |   6 +-
 9 files changed, 881 insertions(+), 49 deletions(-)
 create mode 100644 tools/gputop/common_gputop.c
 create mode 100644 tools/gputop/common_gputop.h
 rename tools/{ => gputop}/gputop.c (71%)
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.34.1

