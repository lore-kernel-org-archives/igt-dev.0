Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4B3ECE582
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 09:47:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C89510E752;
	Tue, 10 Sep 2024 09:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYsECyys";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B16210E752
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 09:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725961675; x=1757497675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QKaWJftmmmgNRA+aV1Fl8gu4Y0MlMb4hn3F2YITNvVw=;
 b=kYsECyysynkgbnzKVVNeDxf2krNd49aJs1DGJJYki04mPf4EuGzmR2gj
 Ov72M6WacTZp/ptQqW70MA2P7yfii+4bYtwQ7MGYFb8qZMLKDYyAWxczS
 jkT8tmpp0LMag7fsJ5KGDnWtGearxg6Ro66OsJ7vC3c+tCulAEuQiBB2y
 lLTaP66wGavOlofC40FWZrN7s2is1UyzZcmfMvjdhxsnIGRKgs65roMHs
 2orLfqaxYK6yZJPvn1DWtB5PX9GJ7Kqlr670+zk+ZEz4U2nAuwaP4oumk
 DwoApSlOQYuQtp3b9XW2yX7LfIWEpXOLXmp5rfr9l7yS7JwsDjPVKO03C Q==;
X-CSE-ConnectionGUID: oXbgi29/QgC5sHSbAwrnmQ==
X-CSE-MsgGUID: n+HtGUvtQm6WtBftoIhYjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36043764"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="36043764"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 02:47:55 -0700
X-CSE-ConnectionGUID: vXUNJDTkRky9G+JvBVzsNg==
X-CSE-MsgGUID: QBclrpI7QtOJ4Xf+oP0kWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="67269506"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa006.jf.intel.com with ESMTP; 10 Sep 2024 02:47:54 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 0/3] HDCP MST LIC fixes 
Date: Tue, 10 Sep 2024 15:15:25 +0530
Message-ID: <20240910094529.545064-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
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

Contains some refactors and fixes to get mst lic tests to
work as inteneded.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (3):
  test/kms_content_protection: Fix variable declaration
  tests/kms_content_protection: Print correct output
  test/kms_content_protection: Move test lic mst code.

 tests/kms_content_protection.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.43.2

