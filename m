Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E132AEE20BD
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 08:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2F210E33A;
	Mon,  9 Feb 2026 08:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WeZlUfWG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3E810E339
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 08:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770625274; x=1802161274;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Iut1ucP2n4b5ZA7WTzlBXfNYgDZB+NwTzCtr2WYdBAo=;
 b=WeZlUfWG4Pjy62PgDuHw5W5QC0z8A6E3Wt0Z38BTDaH4URDPawqqQY98
 1fAU4iVDcCbBh16hytSYjLNgwLXefHrXvyb8GJWQDRyADzw7qz3oEi/k0
 EqpAckH3j7Whwg49XCzB+2C/nJCADKsLUUDynpOwjbTd2dzDjbUKWLS41
 4vzZ6erx2Bwt7J8XRlBnFHwGKzsaVdU6pCmyRnfB1RVShw6gnCcQjKqqQ
 kFHVuqOlT+M+nNw4zfGIz28VEjPXJI/dNL8Q7YBPYn9vaImtwlhIjMx4n
 MYqc706fa+aJ/56s3hKklOVMnm86QdNBqEV6dMBvz8kZh2IGB4puIqKNa A==;
X-CSE-ConnectionGUID: MpcjXlZSQcCEpIJJkkeHBg==
X-CSE-MsgGUID: B6oz21eDScuDR6fFGDGfvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71718507"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="71718507"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:21:13 -0800
X-CSE-ConnectionGUID: pq/3Xyt9RzCYuk33YqabPg==
X-CSE-MsgGUID: dL4kQ3jrT2iOICWBS0mgXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="210824251"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa010.jf.intel.com with ESMTP; 09 Feb 2026 00:21:12 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 0/2] tests/kms_plane: Refine clamping and modifier
 skips
Date: Mon,  9 Feb 2026 14:01:46 +0530
Message-Id: <20260209083148.1088533-1-pranay.samala@intel.com>
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

These changes avoid running source clamping tests on cursor planes and
skip modifier subtests that are not supported on the target display
platform.

Pranay Samala (2):
  tests/kms_plane: Skip cursor plane for source clamping
  tests/kms_plane: Skip unsupported modifiers

 tests/kms_plane.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

-- 
2.34.1

