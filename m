Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD83DC7EE2A
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 18:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6387410E274;
	Fri, 27 Jun 2025 18:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvgEcHIA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A8710E062
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 18:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751048379; x=1782584379;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EibWUEsuFjkBjzKuQrnT/tLVbWkHV3/7y3+Rzqf+930=;
 b=IvgEcHIAeGieeuYkgA0TTVOumDD6mfSyykKeypzv/lVh1dMQ7419WIRl
 XACLHIxk86J8M1ygPKCVRTpkKdB1WjbtvHo18LkNCt387Mkp9hyBHV8KC
 /QbTO2v1prG2JBaTnQUTjDNFnPy4wCEQAKD6hLwkdjnt1hP7iiI1t9y8Q
 p+jA3I+ZZ2pDD/UwrJvOHSRIiP2J5EP+emuCcCrviegJ/e6NncPPu1KcJ
 gBA3wD/2GB8PgIHabmz7muLRST/kF5Y3exmqS9JQffAF6wwLwXRZZbkvw
 7SsP11Ph40iS26CGuunLl7JM25ZA46NWVP40H5KZJ/cbu1/UjPBCW3/Je w==;
X-CSE-ConnectionGUID: EG81bcDFTMCR6Cmp0WoU/Q==
X-CSE-MsgGUID: 4ATJvMSTRGa5HxACYx/Mhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53465567"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="53465567"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:18:31 -0700
X-CSE-ConnectionGUID: +1R1vYESSXirB62SuagMHA==
X-CSE-MsgGUID: OyfHGtXzRr+k8WJcps37wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="152604277"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:18:27 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH v16 0/5] Add per-device engine activity stats in GPUTOP
Date: Fri, 27 Jun 2025 23:42:17 +0530
Message-Id: <20250627181222.227803-1-soham.purkait@intel.com>
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
 tools/{ => gputop}/gputop.c | 236 +++++++++++++++++++----
 tools/gputop/meson.build    |   6 +
 tools/gputop/utils.c        |  51 +++++
 tools/gputop/utils.h        |  63 +++++++
 tools/gputop/xe_gputop.c    | 361 ++++++++++++++++++++++++++++++++++++
 tools/gputop/xe_gputop.h    |  59 ++++++
 tools/meson.build           |   6 +-
 9 files changed, 867 insertions(+), 44 deletions(-)
 rename tools/{ => gputop}/gputop.c (65%)
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.34.1

