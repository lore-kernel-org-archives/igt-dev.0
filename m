Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EC9C54ED0
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 15:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4847910E18C;
	Thu, 22 May 2025 15:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BODWReLH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F9710E25E
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747928991; x=1779464991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WQki1aMfYUPO7G+kRb0WNcXUTw467ZNvxKypLL/a+fE=;
 b=BODWReLHK58YltvsGrpC5ux2JmfniI0GdoQ1ilEtVnMPtDwE3yTAERAK
 07bWWd1cH56xyYF9JaUDLgWnJqyQuKiiymL02GenP0Pg4hdfXEgWqMbid
 4/aRJYgs0L2PRNh/sllyObyxX4aSSABKscMXD/ThTAm+hOvFQylhEhOoq
 xoXliBQmVVQJJ2xGrBhKnbHpmdjpvILU1bsIJ9vtSWJYkJMKd1q6apipZ
 AFhz5vjeZyagQUktf9+X3RWbT5ob00NltzvuiJgcRWVG76f0XlK0BRord
 w6xD2vXv+I1MLoFSM/xDsQgbkO5bJ6Mh5K6LZX8SPKrGePQzV3mdKBHqZ w==;
X-CSE-ConnectionGUID: IXajKM40RcqW28Wdf5aU8Q==
X-CSE-MsgGUID: aK0jjlK7TpCO4xaNLaR3Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49862137"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="49862137"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 08:49:51 -0700
X-CSE-ConnectionGUID: d6niZQy6QfmfEh3S12nG9Q==
X-CSE-MsgGUID: 4clPO9Z2R2WgR/GCBycMUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="141594082"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 08:49:47 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH i-g-t v11 0/5] Add per-device engine activity stats in GPUTOP
Date: Thu, 22 May 2025 21:14:42 +0530
Message-Id: <20250522154447.496407-1-soham.purkait@intel.com>
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

 lib/igt_device_scan.c       | 128 ++++++++++++
 lib/igt_device_scan.h       |   1 +
 tools/{ => gputop}/gputop.c | 223 +++++++++++++++++----
 tools/gputop/meson.build    |   6 +
 tools/gputop/utils.c        |  51 +++++
 tools/gputop/utils.h        |  64 ++++++
 tools/gputop/xe_gputop.c    | 378 ++++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h    |  62 ++++++
 tools/meson.build           |   6 +-
 9 files changed, 875 insertions(+), 44 deletions(-)
 rename tools/{ => gputop}/gputop.c (66%)
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.34.1

