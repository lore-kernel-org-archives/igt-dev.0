Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611E4C369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 13:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1803310EB02;
	Thu, 17 Apr 2025 13:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXDAt3S7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20B110EB02
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 13:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744895601; x=1776431601;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c3f4P9E4eKV/U88XvbR7aEj0pxkCR14xIsinxEyK264=;
 b=IXDAt3S7pvzHLlV6Hv/i1dFj0+bzD5yxJRganhlEdvzzq1cJqjyDPM6e
 vpBDSxHHH5YoxS4cspaY04XlREuf3qeDJRyg2X3CcGOPh5H4Dl1fZRnze
 /YHYe5z1vX4rE2kTAgI3eTeI3+C40RlrVb4KCP+oFD6EmQH9YcE6N9Tf/
 tteQb7eEVb74aFp/0zSwglhpVDBowjqB67vD5jJsxmOQctEdnIXGADNz1
 89vUqb2h3dnCl2feIP5q3eCoKg4hBPNXpRUzoVOOWaOfctNY1LZXqQ4a1
 m4KRWf1zU/aopeJ33iMW36dPnnAARoH48i5M6qh7A+hj+NZFcUTnpLXFV w==;
X-CSE-ConnectionGUID: PGSmuG/JSbWDRK1qOTJ5GQ==
X-CSE-MsgGUID: i3eemVxaRHiqZ7mvymFegw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68972698"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="68972698"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 06:13:21 -0700
X-CSE-ConnectionGUID: 8jro2yG4StSdbvyXP24QZQ==
X-CSE-MsgGUID: qeYrA94FRJKTfTj71FiSHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="130802660"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.80.165])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 06:13:20 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 0/2] xe_fault_injection: Improve probe fault injection
 handling
Date: Thu, 17 Apr 2025 15:13:10 +0200
Message-Id: <20250417131312.1016503-1-marcin.bernatowicz@linux.intel.com>
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

This patch series improves fault injection test coverage in the
xe_fault_injection test by decoupling error checking from the fault
injection helper and making tests aware of Virtual Function (VF) contexts.

Patch 1 modifies the `inject_fault_probe()` helper to return the result
of the probe instead of asserting internally. This change allows callers
to determine whether an assertion is needed, and enables more flexible
handling of fault injection scenarios.

Patch 2 updates the "inject-fault-probe-function*" tests to be VF-aware.
Some functions listed for probe fault injection are only expected to fail
on Physical Functions (PF), and may not be invoked at all on VFs. These
functions are now marked with a `pf_only` flag and handled appropriately
at runtime based on device type.

Together, these changes enable more accurate and robust testing of fault
injection across both PF and VF environments, avoiding false failures on
VF.

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Marcin Bernatowicz (2):
  tests/intel/xe_fault_injection: Return probe result from
    inject_fault_probe
  tests/intel/xe_fault_injection: Make inject-fault-probe-function*
    tests VF-aware

 tests/intel/xe_fault_injection.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

-- 
2.31.1

