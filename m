Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3DAFD064D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 07:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B06610E36A;
	Wed, 11 Mar 2026 07:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeWYYi4G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2DF10E35F
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 07:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773214806; x=1804750806;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LfcO8pj6T4qcIwlA2+hnFqyaQVL0iW7QuVuXtVZaXP8=;
 b=JeWYYi4Ge4pgsNIIEoCHnyijO1mv5g0suAyXvup5pzBUd2uN3BRbzngt
 cQ0muZNOzPJpmGqiOThH1Km1Ez9MVruIaHIS9Dou4fOfvJlds0cw50D6V
 oLx+RtxR5OAbv/rZQeVQnZpAgfDJsiJN5lzOn5HoaMt/K6AiUtyu5BTME
 69Hi7t6aDvGKRim2n4KK3+es6bqqdy23yQtS9L1giKrjaIMxJV0Fk2pzW
 ddT09kLDOC9Y+5zzxmCqnJDwXrC8hCSSeh9HAP6GplzXjyqojEfHApRZf
 tfWmf+Z1EkJOKx49HEdhViRoQUQhMnpputxBXjNzs7hP3iznUc8mMQdna w==;
X-CSE-ConnectionGUID: X9kAsKfsTUOfFQv1wJiiJA==
X-CSE-MsgGUID: 1vDXK+nwTu+thozpDJlA1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="76885369"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="76885369"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 00:40:05 -0700
X-CSE-ConnectionGUID: L4UJ+hS7RCeD+ew9lVYEjA==
X-CSE-MsgGUID: jo5FaBuMRje28V130PJWXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224548452"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 00:40:03 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] Skip intel unsupported downscale tests
Date: Wed, 11 Mar 2026 13:10:02 +0530
Message-ID: <20260311074036.219075-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Some scaling tests are expected to be skipped, but they still iterate over
all display modes, which generates excessive logging and eventually hits
CI disk‑usage limits. To address this, early skip logic is added before the
dynamic tests begin, preventing unnecessary mode iterations and reducing CI
load.

Naladala Ramanaidu (2):
  tests/kms_plane_scaling: Skip unsupported scaling scenarios
  HAX patch do not merge

 tests/intel-ci/i915.fast-feedback.testlist | 216 +++-----------
 tests/intel-ci/xe.fast-feedback.testlist   | 323 +++------------------
 tests/kms_plane_scaling.c                  |  38 +++
 3 files changed, 128 insertions(+), 449 deletions(-)

-- 
2.43.0

