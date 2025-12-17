Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5566D65C70
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 15:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510EC10E8BA;
	Wed, 17 Dec 2025 15:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/FpZvOA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AB910E8BA
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 15:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765985883; x=1797521883;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OnrHWC5+CY0C26t1R/fAr+r7mqiOrC2y1xorwzGEAe0=;
 b=e/FpZvOA0+DZf1noL7Ct15uBwzoZVdj4DymVXNZY73LEtbrkWHtRUl4r
 1jsY8PdW6zDp28y72DVamSNi8+U2QUGdETpYer20f1Xg8VpM6PxotcZkl
 WM6b1fsyYpJ4dYKyuhUw/GI3eLzoLyI2V6gR0RvC59i6Y65AuRHrAwJfQ
 ADCQImXCgLw9+jDnJEnnfxFAeEZnSgLgr08LWqcXRkr7GWQC6hySrMScX
 pbc+HOFAvjH9SmTtXgq9XxOMcMIKJTyc/kYL7+QMkh6FHzbDiS9Z/POwA
 BRRFaLdnHW5OT05pE1L3mshs/yQyk9ZIoPVyrAm1dhaHwqddLgXXXp8Xx w==;
X-CSE-ConnectionGUID: kc0rmmoXS/e8cX7K8cYz7Q==
X-CSE-MsgGUID: uqZv3KG3RHWAdS8UmbxStg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71556986"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="71556986"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:02 -0800
X-CSE-ConnectionGUID: vDqbbDKVSv+LLkB5ZOW6uQ==
X-CSE-MsgGUID: XRCOq+P3Sh6w2tNXATwsxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="221718644"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:01 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/11] lib/kms: Carve up igt_display_require()
Date: Wed, 17 Dec 2025 17:37:46 +0200
Message-ID: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Coccinelle really doesn't like igt_display_require(). Sometimes
it takes approximately forever to do any changes to igt_kms.c
because of this. Splitting the function up seems to help a bit,
or at least then some modifications can be done in finite time.

While at it try to clean up the plane->index stuff a bit.

Ville Syrjälä (11):
  lib/kms: Extract igt_crtc_init()
  lib/kms: Nuke 'n_planes' from igt_crtc_init()
  lib/kms: Nuke 'last_plane' from igt_crtc_init()
  lib/kms: Get rid of the 'p' plane index variable
  lib/kms: Extract igt_crtc_plane_init()
  lib/kms: Nuke pipe->plane_primary
  lib/kms: Nuke pipe->plane_cursor
  lib/kms: Use '{old,new}_primary' variable names in plane swapping
  lib/kms: Pimp the priamry plane swapping
  lib/kms: Extract plane_type_index()
  lib/kms: Streamline plane index handling further

 lib/igt_kms.c | 269 ++++++++++++++++++++++++++------------------------
 lib/igt_kms.h |   2 -
 2 files changed, 141 insertions(+), 130 deletions(-)

-- 
2.51.2

