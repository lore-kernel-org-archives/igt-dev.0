Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89B7C3600C
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 08:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CD510E860;
	Thu, 27 Mar 2025 08:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhBYhkr9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CB810E860
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 08:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743062653; x=1774598653;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eyQlMKmtQOvPfn3ijl2Q736eV2qUH114eEBdmQ+IRdU=;
 b=IhBYhkr9Wxp4VjlblX0Rgm2r3Gnw3OSwXVecLLK2wyk8CRqQju4KbmsU
 u1oCUsvgkk13RONbuY0SDssRiyHU+7l6E+uhra44zuQk4fc7WKUsZpfJB
 8etlTqnWYEgOWSNf0xZWG2qPn4aNMOEx+Ph73L98lw27cwlfXaWLMjOpP
 SlViQniiuaQ1ETkZgRPS/HrznBV5ixh6kNavyQ9x39Kl8lOQyhnbpNnOU
 voCiA5A1PdzetNRWajLq9RFiz4ZIfID/WxTYlasFzTp6/6j6cAqkTEd3r
 HaMxpotg4u6SYbS/p6KfXvdX5l+MzEVmucOVFQoKaBtL3YcVhjIp7ZvrH w==;
X-CSE-ConnectionGUID: 4nROWKykRCCWa03gVpRQ0w==
X-CSE-MsgGUID: yhiXm6LuRjqpdSij9zZDeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55745374"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="55745374"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 01:04:13 -0700
X-CSE-ConnectionGUID: c2diQ3CtSdGm7CGy2Y8y2w==
X-CSE-MsgGUID: MzShyohWRSWb+/CGxQDthA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="130165695"
Received: from carterle-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 01:04:10 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jouni.hogander@intel.com,
 jeevan.b@intel.com, jani.saarinen@intel.com
Subject: [PATCH i-g-t v3 0/2] lib/i915/fbc: update fbc support based on psr
 mode
Date: Thu, 27 Mar 2025 10:03:56 +0200
Message-ID: <20250327080358.559968-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Update the FBC support check library based on the psr mode
Also revert the changes done to fbc multiple plane test. It was wrongly
checking the fbc support associated with psr mode.

v3: A wrong patch ended-up as part of that v2 series. Removed it.

Vinod Govindapillai (2):
  Revert "tests/intel/kms_frontbuffer_tracking: update to FBC support
    check"
  lib/i915/fbc: update fbc support based on psr mode

 lib/i915/intel_fbc.c                   | 47 ++++++++++++++++++++------
 lib/i915/intel_fbc.h                   |  4 ++-
 tests/intel/kms_frontbuffer_tracking.c |  2 +-
 tests/intel/kms_psr.c                  | 10 ++++--
 tests/intel/kms_psr2_sf.c              |  9 +++--
 5 files changed, 53 insertions(+), 19 deletions(-)

-- 
2.43.0

