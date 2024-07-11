Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8D8C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 11:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA2D10E7CB;
	Thu, 11 Jul 2024 11:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5membOo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F92410E9DF
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 11:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720695741; x=1752231741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=52DCbuILHodtxF68VibuWgK3U0NwDNjnYXX3bRIAAiQ=;
 b=W5membOo+7RAZr6zj2ntSWRYUGL6Kf3KW1Q6ztT3Bqf5t2pHZwvoPlwa
 tuCAhWaN2DEQFsvsMZ4VB7U7Pj24c3rAnxoiIfHX7N9XCswO3Nbb03PBc
 CQl/B09m7SdsVeKc5UCjShDA1klAPjAlDqAHaarKnb9ShAZAHWXY7ECIP
 Dzk58mHEqBKfmY8VYjPpgcNCMcWR01UNfKjI2LJv+/kuxOXm7AkbMvsbv
 3nom80HhwUjnLGJQvLvZA2ca/twSjWLw0rfKUGjzU+oTNCpBx0bsSP608
 l9Tll25cMyNtyFYIlpT63SC3gsyZs4cnEF36+F24VGilpaTYu54zTjMLu w==;
X-CSE-ConnectionGUID: w2+qOTT6TNmU3mlG4GecCA==
X-CSE-MsgGUID: 5uNXv3bORXWnsUI9uzkddg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="40579874"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="40579874"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 04:02:20 -0700
X-CSE-ConnectionGUID: B+LGadLbTiqZy0OlU3u6jg==
X-CSE-MsgGUID: 26kM10AJRy+BIA/CnqH4zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="53699981"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.210])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 04:02:18 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/2] Use display alignment for fb size calculation
Date: Thu, 11 Jul 2024 13:02:08 +0200
Message-Id: <20240711110210.207882-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Related to 64K contigues pages alignment necessary to handle BMG
fb compression.

Link to kernel series:
https://patchwork.freedesktop.org/series/135900/

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Zbigniew Kempczyński (2):
  lib/xe_query: Add display alignment helper
  lib/igt_fb: Calculate fb size according to display requirement

 lib/igt_fb.c      |  4 +++-
 lib/xe/xe_query.c | 27 +++++++++++++++++++++++++++
 lib/xe/xe_query.h |  4 ++++
 3 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.34.1

