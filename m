Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891DCC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 16:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347BF10F6AA;
	Mon, 11 Mar 2024 16:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXbzniXb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA8210F462
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710174247; x=1741710247;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/ZbC6aa0ZNvl2G4t+U8HpEaMmLdodyXZTuYKCRfQPnI=;
 b=EXbzniXbpFfsYPVKSPMAZLa1+IfXyGWqeiV46ELHDbZc9l3eAwj26Nwt
 wFFaP8Rqg5I8+ogIswGYFd5MSXPD+N4Wg4S99sbbOzjPUIH75ZrmEYZ0c
 6Y5Fh5UpvQfnWMYQAHpt99v2s361VIHI7SMSkGjyx/NIfl2wbrk4m0aO+
 SkUc9E4mG8SlmbxeoCGxyfqQqeScVBAtJ2rlrUadtYBBfMYEzyT+zUZYi
 9W71KdT5vE4ygkFuYzFX0XAsYb5zfVPsGVWtVlcdEuSunYWTyFTDsDTUT
 /yLhiXhbKrF4bqp8/W0cr5I4sQ9Vdccl7kjCkaeJi7x29zwW3U69sxjAP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15409754"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15409754"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:24:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15861845"
Received: from tlonnber-mobl3.ger.corp.intel.com (HELO b33d611921ea.intel.com)
 ([10.251.208.140])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:24:05 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v5 0/2] Add tests to query firmware version
Date: Mon, 11 Mar 2024 16:23:34 +0000
Message-Id: <20240311162336.7-1-francois.dugast@intel.com>
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

This tests the kernel series https://patchwork.freedesktop.org/series/129640/.

v2: Address comments on HuC test
v3 and v4: Refactor tests
v5: Add lore links to KMD patches in commit messages

Francois Dugast (2):
  drm-uapi/xe: Add test to query GuC firmware submission version
  drm-uapi/xe: Add test to query HuC firmware version

 include/drm-uapi/xe_drm.h |   1 +
 tests/intel/xe_query.c    | 142 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+)

-- 
2.34.1

