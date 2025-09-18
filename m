Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD30CAC59A
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 15:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0AB10E1F8;
	Thu, 18 Sep 2025 15:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRiVa3lG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED40B10E1F8
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 15:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758210026; x=1789746026;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mCn7/q/Bshacf7DqUOnrxHuA/wQ4Vs2zts3SMGq7BII=;
 b=KRiVa3lGXW4bAWr8uBwVRxwHSAIHbyVBz7ediUI93+9r/xvAKaEHDHl9
 2der0BDqgdEyRB/gZ/xQHCGZzzJr7s//HGO15NtoeMnrwd7UARnyJULJN
 RWUCxrVir/dOoMB530ROc8pmAzaoxrEjuMJFxdSHnqWu2iD9NyR3cF9gl
 BFuoOlRPmx6wsib2kjJE1CF0MSmIpDGltSl91TFOoAdmlE8pJ6fh4qZRg
 Ll0/Qg5eAyPCqqmVbIRSWydqz66RY6XtLvAHu7K4wuMR7bF1qzabAgtXh
 LgCYfOaTed9l0OBQeD+CguWe+UQUjQP648sr4l+7eMuG/Lu5QfHEO4TWV g==;
X-CSE-ConnectionGUID: qGx12wH3SXKwTMax5w+W9w==
X-CSE-MsgGUID: FaX3jaYuReuRPP4fEz9ZnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60696500"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="60696500"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 08:40:26 -0700
X-CSE-ConnectionGUID: r9Jcr9BuSl+Heiw8ohUCFg==
X-CSE-MsgGUID: JBnyVDPdTv278iAFeDoN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="175388598"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by orviesa007.jf.intel.com with ESMTP; 18 Sep 2025 08:40:24 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH v9 0/1] Add pat-index-madvise
Date: Thu, 18 Sep 2025 15:40:22 +0000
Message-ID: <20250918154023.3202474-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

Revision 1
      From: Nishit Sharma <nishit.sharma@intel.com>

Revision 1
      From: Pravalika Gurram <pravalika.gurram@intel.com>

Add pat-index-madvise test to verify setting different
pat_index values for multiple VMAs. This test uses
madvise to set various pat_index values and
verifies that different PAT values can be assigned
to multiple VMAs as expected.

v8:
- Fixed indentation, nits (Kamil)
- added igt_skip for igpu
- used igt_info instead printf()

v9:
- Fixed CI fail issue

Pravalika Gurram (1):
  tests/intel/xe_exec_system_allocator: Add pat-index-madvise

 lib/xe/xe_ioctl.c                      |  29 ++--
 lib/xe/xe_ioctl.h                      |   4 +-
 tests/intel/xe_exec_system_allocator.c | 186 +++++++++++++++++++++----
 3 files changed, 178 insertions(+), 41 deletions(-)

-- 
2.43.0

