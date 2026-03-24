Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE371F532F5
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5268F10E634;
	Tue, 24 Mar 2026 09:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVYw0YVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A069310E634
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774342917; x=1805878917;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B+a344qMLExFbcHimqsf6FQuJkpT1CvwMqhpSkx6vPU=;
 b=SVYw0YVzmz3BiMJI07l8afUqtZ/lGdL0e7npoyZg+k6X65HIsdzTodP4
 qKbj5JR4EUsUTjlVA9B1b9+FvOdvitB+6MLJUqw3NvqG+9zw93Mcr/F9d
 fePcxjmmuDDE008MDFOXPc/ApLDtdCuHDlcOVxiyCxRKP7jgzdWs9iohH
 tB865oXogDe1IPYn00BuOjWwvM89prWKt2KkBkRsYWdGqdjabntZKGS4b
 ebLt0KpQRfGQIilfsJHGS0I2/6EAKovIPYoYGZ26tpT5pI1HC3YkHx8EY
 oBBNGy41Mn2JiPVx77etbK5cpj6yVAF+L+8mBO1yb/J1zG1hnz9WpaeqZ Q==;
X-CSE-ConnectionGUID: 1qOc9UezRgGxAKIwsN2hHA==
X-CSE-MsgGUID: XH/iwV/7RpiADWhn49N79A==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86722592"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="86722592"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:01:57 -0700
X-CSE-ConnectionGUID: bnQLr5UFQaa3vxyrN8x67w==
X-CSE-MsgGUID: VjENUhVbRTOjTwVEVVzN6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="229222618"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:01:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [CI 0/5] tests: some igt_crtc_for_pipe() reduction
Date: Tue, 24 Mar 2026 11:01:46 +0200
Message-ID: <cover.1774342824.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Picked up some patches from [1] for CI results and merging.

[1] https://lore.kernel.org/r/cover.1774002591.git.jani.nikula@intel.com


Jani Nikula (5):
  tests/kms_bw: fix misleading indent
  tests/kms_bw: clarify what's going on with proper variable naming
  tests/kms_bw: avoid igt_crtc_for_pipe() and crtc->pipe usage
  tests/kms_explicit_fence: store igt_crtc_t* instead of pipe in data
  lib/kms: convert igt_crtc_for_pipe() into a proper function

 lib/igt_kms.c              |  8 +++++++
 lib/igt_kms.h              |  8 +------
 tests/kms_bw.c             | 48 ++++++++++++++++++++------------------
 tests/kms_explicit_fence.c | 14 +++++------
 4 files changed, 41 insertions(+), 37 deletions(-)

-- 
2.47.3

