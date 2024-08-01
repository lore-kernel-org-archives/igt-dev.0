Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3363EC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 19:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C820F10E06C;
	Thu,  1 Aug 2024 19:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HM5e/bxV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3763A10E06C
 for <IGT-Dev@lists.freedesktop.org>; Thu,  1 Aug 2024 19:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722541892; x=1754077892;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WGsFmje2CBkKNMIjkkz/0V97Rmz3Xw1iTVYDqSzB4PM=;
 b=HM5e/bxVIWlV9Kv+QqVN0K4zsgFMv171cBsnr0kfSonbGod/TLCuFeJE
 wgAXIBq2eox+lpFeFhjlqjx/eBWQYJ7+3rr4TBh3y7NMKBxlZas38SIiy
 1FGMEm/YFEgjKCjJETYDU3eusdXrxjEMiE1CYnHiiAOWTMJOp68w/XNSa
 0otxotN0/ea8ZJ50oeOQOrS13fLQFPgGBPuvK4r3R3831fIgrvovg8tJ/
 RAk3kYK9dV2LH9RLxEQxFlalE4FqI0I9uzr+FmayelIfCmpRhkrss8x8A
 dufYgoa+FIE9wM8hryKohkxlBsIbNON3VNvC1+ILVNyEjXKZxfeYkgotB w==;
X-CSE-ConnectionGUID: xvFUUyZgSK+OvIBByJ4n4w==
X-CSE-MsgGUID: OpdwN9z/TTeL9LWe135fog==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31181960"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="31181960"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 12:51:31 -0700
X-CSE-ConnectionGUID: 2cKB/InAQZOACzJJRqpySw==
X-CSE-MsgGUID: FXf+D/DlTnymkdAXGSuH3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="60182921"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 01 Aug 2024 12:51:30 -0700
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t 0/2] Update hwconfig table tests
Date: Thu,  1 Aug 2024 12:51:27 -0700
Message-ID: <20240801195129.3667206-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Add support for a new enum value to the Xe and i915 hwconfig table
tests. Also fix the Xe version to actually fail if it finds invalid
enums in the table.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  tests/intel/xe_query: Fail on unknown hwconfig entries
  tests/intel/*_query: Add support for new hwconfig table entry

 lib/intel_hwconfig_types.h | 1 +
 tests/intel/i915_query.c   | 1 +
 tests/intel/xe_query.c     | 6 ++++--
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.45.2

