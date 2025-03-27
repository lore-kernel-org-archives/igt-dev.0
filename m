Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2BCC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 09:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B5B10E0A8;
	Thu, 27 Mar 2025 09:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KXcbpA0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF34C10E0A8
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 09:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743066875; x=1774602875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RO9KhhkIavuSpKCxHJs56kBhrJW5gjxLbg8FmUjIiLs=;
 b=KXcbpA0cn3AuQNcuJo2l9/9Iz6bPAz5h6CZ0Nfa00WQXtMDRFl5EWYdK
 NW5pewDVV8bNdcR0TlfcVLjBfmmFINmN+C5YbIYEJ7Dnzg8cuvXEy/RjJ
 VNaBRtZAfIwerETAuSAeYTaazZ8EFwSMMTozHOhbigfurjQRNv8Z/roaE
 snf7vNUjFe3Cs1anjYNw2yrVP12XKCaZYzzBmZX0SGv7waeNl7YgHQmGE
 LGBaqXsfiD/rN6Q4sgcxknpqggRKe/+V94deE8QFo42AIXXdLNA17wBYr
 q8wS5hE96cSEyyKlHC1vSARZbdnxqQmDeZSuEFs5zMrCq6AbAMGz3Wr3v w==;
X-CSE-ConnectionGUID: n/ahmk/uQZSzylnbzyGIQw==
X-CSE-MsgGUID: jpH64iSJQTaD8tJzq5W5jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69749306"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="69749306"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 02:14:34 -0700
X-CSE-ConnectionGUID: JDKvnfrKRdOQl9vihh+JVg==
X-CSE-MsgGUID: T0O7Hl4pSIOCKxF3jV9sBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="162311496"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 02:14:33 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v8 0/4] Support for IN_FORMATS_ASYNC plane property
Date: Thu, 27 Mar 2025 14:38:47 +0530
Message-Id: <20250327090851.2740672-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Use IN_FORMATS_ASYNC property to get list of async modifiers
and improve async flips test to add coverage for the supported modifiers
and formats.

Santhosh Reddy Guddati (4):
  lib/igt_kms: Add support to retrieve async modifiers and formats
  tests/kms_async_flips: use in_formats_async for async modifiers
  tests/kms_async_flips: Add test for all async format modifiers
  tests/kms_async_flips: Remove allow_fail flag from async flip tests

 lib/igt_kms.c           |  73 ++++++++++++---------
 lib/igt_kms.h           |   7 ++-
 tests/kms_async_flips.c | 136 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 174 insertions(+), 42 deletions(-)

-- 
2.25.1

