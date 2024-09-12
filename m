Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D602AEED608
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 13:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9112010EB81;
	Thu, 12 Sep 2024 13:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aIJ8TR4L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E85210EB81
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726148208; x=1757684208;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R+YShFClkCoB19WI9j0981fSbI94zZQXnnjnT/i9LiA=;
 b=aIJ8TR4LM/f5x1wiRJhHxXf3D8RfEgKYXGa23AFQKPoOGrOzasnSN+rH
 kJhBAsr26Xi7bQNCtY/GXV4/qfgY9tlbmGoNoXxLCEQowBx1rvDWSsBFe
 m9mAkUppJmAiOxq1Cj0j8SFjSkv81GBROTC0DuFvtnmvegEVsbRUAEHTK
 ZIWFZE1l60dUmquftak+LZ5z7wvOMQJcYkgVtUJW91CJFiuV2ocaswMYJ
 gId9+PT3qCoZi/f9cWk+JGBrxqBQ3v6k/sW5lv5ERxYppIluyTyBf2q6L
 HtPwaJQ/xtm6w+xqxzHb9RTz8+3IsL7QADlCmK+oowVVbaCgIS8ZXMJGL g==;
X-CSE-ConnectionGUID: C9ff7loqTJi78U/JAks5iw==
X-CSE-MsgGUID: oOmGOsICSDuYsAL3bhjx9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24484218"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24484218"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:36:48 -0700
X-CSE-ConnectionGUID: P8HdevxMRz2BQvoN6xlWnA==
X-CSE-MsgGUID: 8T44/oo7S9CtnPovpfKEvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="68221016"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa007.jf.intel.com with ESMTP; 12 Sep 2024 06:36:46 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 0/4] HDCP MST LIC fixes 
Date: Thu, 12 Sep 2024 19:04:17 +0530
Message-ID: <20240912133421.718496-1-suraj.kandpal@intel.com>
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

Suraj Kandpal (4):
  test/kms_content_protection: Fix variable declaration
  tests/kms_content_protection: Print correct output
  test/kms_content_protection: Move color change code
  tests/kms_content_protection: Make mst_cp_enable_with_retry() void

 tests/kms_content_protection.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

-- 
2.43.2

