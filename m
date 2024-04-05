Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B11CD11C2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 06:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83C3113937;
	Fri,  5 Apr 2024 06:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qhz92tXj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73755113936
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 06:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712296870; x=1743832870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mXNfl0OUEU30qEekkyGKcN5QPL4IT8e+NczBSTWt8wM=;
 b=Qhz92tXj52HzaIFxdeTzcxBpZ7KLbcV52Cj5+ufVwB3/7yPHz9RphZgz
 5/D//cnxsIfUNYko38rWTmKwsaugt8U6UN7fcm8d90+XR7Hoou7R9gc4X
 jtfb3WGufRFTrHovRqnQDCvRAUoRaEjkRfK6xfQyTyp0n8tKhhBDunDEI
 t6pD/yxCxrRw4FqxYRP0WEsVWsPC9rkianmvf25JmQVkG2Wx66ocYbaCX
 hb508clRaH0w9F2zrRRMO5c8H4FWtBTNT/wayOaOGSE33LogDE406o+O9
 ACh1wO/ahm0oGacxSkLq1zuGFWI9X3pB20/ZZt+9D7qLQYSm9Hm4gFOjh g==;
X-CSE-ConnectionGUID: gyRswLVCSl6/PeAkV+zyZQ==
X-CSE-MsgGUID: Xy4MXHLIT1iVK+hBsi1+WA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25121730"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25121730"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:09 -0700
X-CSE-ConnectionGUID: 0nS7DLz8QzqidAHW00nTpQ==
X-CSE-MsgGUID: YlnIKj8RRLeNyXjXxSCTHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19615793"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.212.102.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 00/12] gputop: Add support for xe
Date: Fri,  5 Apr 2024 01:00:44 -0500
Message-ID: <20240405060056.59379-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.44.0
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

This contains all the patches I had pending for igt to add support for
gputop for the xe driver. This was added on top of
https://patchwork.freedesktop.org/series/131956/ (Refactors and fixes
for drm_clients). 2 patches from that series are posted again here
with one of those pending review.

I decided to remove the patch "lib/igt_drm_clients: lazy stat process"
to focus on adding the xe support rather than optimizing.

Patches 3-6 are more minor fixes and refactors to prepare for the new
feature.

Patches 7-9 add support for a new "ticks" unit to the libraries when
parsing the fdinfo

Patches 10-11 are minor refactors to gputop

Last patch plumbs the changes together to implement the new way to
calculate the percentage. This is considered an RFC only as I still have
to send the kernel side. It's a good opportunity to see how
we plan to use it, give feedback about the new unit and the
motivation behind it.

WARNING: the only thing tested here is that I didn't break the old
format:  gputop with i915 continues to work for me after these changes.
For the kernel side I have to get some patches prepared by Umesh, add a
few more from me and give some proper rounds of testing.

One thing I noticed is that if we were to just add the new format to
fdinfo, we'd break gputop. That is because gputop was not parsing the
complete line and didn't check the unit. I checked 2 other
implementations I found for gputop-like sw and they didn't have this
problem:

	- nvtop: https://github.com/Syllo/nvtop/blob/master/src/extract_gpuinfo_intel.c
	- htop: https://github.com/htop-dev/htop/blob/main/linux/GPU.c

So I think we may be safe to add the new unit as used here and not break
anything other than our own toy (but fixed in this series).

Lucas De Marchi (12):
  lib/igt_drm_fdinfo: Stop passing key twice
  lib/igt_drm_fdinfo: Remove prefix arg from parse functions
  lib/igt_drm_fdinfo: Fix wrong name len assert
  lib/igt_drm_fdinfo: Assert pdev is not truncated
  lib/igt_drm_fdinfo: Detect invalid drm-client-id
  lib/igt_drm_fdinfo: Stop ignoring space where not needed
  lib/igt_drm_fdinfo: Parse unit for engine utilization
  lib/igt_drm_fdinfo: Store 2 counters for "ticks" unit
  lib/igt_drm_clients: Store second data for ticks busyness
  gputop: Extract method to update console size
  gputop: Extract clrscr()
  RFC: gputop: Add support for ticks unit

 lib/igt_drm_clients.c |  24 ++++--
 lib/igt_drm_clients.h |   3 +
 lib/igt_drm_fdinfo.c  | 185 +++++++++++++++++++++++-------------------
 lib/igt_drm_fdinfo.h  |   7 ++
 tools/gputop.c        |  44 ++++++----
 5 files changed, 162 insertions(+), 101 deletions(-)

-- 
2.44.0

