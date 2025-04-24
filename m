Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B0FC369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 09:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB3E10E278;
	Thu, 24 Apr 2025 09:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WM283mMu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B0E10E278
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 09:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745488741; x=1777024741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4k9aD8GbDZbYAuE7qTUlj+FZU74a32ZlT62Z0kz17xk=;
 b=WM283mMuGX+AdAV9fKH3MpSVaE98aNe4F/p2SLuT0hSXwl9RnKbdaB4j
 FwIaF3ZBN8dBPO2w9g4uh9zkKs3jO9z9YxAePQvrtdOZHx+UA0RixjgN0
 HpVoQ/B2uphydJvFdb+HO59PabaNX0xGmF8Z5rJP+4olu63heuCeqpM+s
 huGQ4hLBKUiVf1vUCkhu8yqps6UPSf1sm1p0wK2SO1eCx4I0zgtlssU7q
 bRI3sn1tBTK7+eetuNMqC7VnVjUP5Uo3PFJP1idsYIMK+EetBmEKm2zjt
 buBB4NwuTEps7yt51LGLw8wVqfdEpdaHZnurYiRv3BCyvmGP0dRooDQVL g==;
X-CSE-ConnectionGUID: fkoLIMWHRmiqn3EsiPCx3g==
X-CSE-MsgGUID: Um/VpreVTXSHwXulL8OAeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46982357"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="46982357"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 02:59:01 -0700
X-CSE-ConnectionGUID: 7vjfWCvJR7mS0zb+0lveGg==
X-CSE-MsgGUID: wd0PnXA8QcOoIXvOrUq2sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="132476337"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.101.99])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 02:58:59 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 0/1] xe_fault_injection: Improve probe fault injection
 handling
Date: Thu, 24 Apr 2025 11:58:52 +0200
Message-Id: <20250424095853.1396156-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

This patch improves fault injection test coverage by making tests
aware of Virtual Function (VF) contexts.

The "inject-fault-probe-function*" tests are updated to be VF-aware.
Some functions listed for probe fault injection are only expected to
fail on Physical Functions (PF), and may not be invoked at all on VFs.
These functions are now marked with a `pf_only` flag and handled
appropriately at runtime based on the device type.

This change enables more accurate and robust testing of fault injection
across both PF and VF environments, and avoids false failures on VFs.

v2:
- Dropped patch 1 from the first revision (already merged via another
  series)
- Resolved merge conflicts

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Marcin Bernatowicz (1):
  tests/intel/xe_fault_injection: Make inject-fault-probe-function*
    tests VF-aware

 tests/intel/xe_fault_injection.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

-- 
2.31.1

