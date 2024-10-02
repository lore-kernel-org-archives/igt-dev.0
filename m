Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A3ACF6D28
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 14:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A52010E0CC;
	Wed,  2 Oct 2024 14:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bMrdHOvm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F6610E0CC
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727880966; x=1759416966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zarxiu0UT2cpFxkeHXsVhlnZXwPVLQ1EyhB6jegsA6o=;
 b=bMrdHOvm/tsNp6WCJQS757c1bzJfoGGqOFWpSdGqKO0ODoIYhHCxRqu6
 Dlj+RCP0SZXri2VjS3upAOFeqb2RrCf6SHS3FadsgcWU3zM/LQpRtjPp6
 aeh6MBhzfpcd0ld0LT91UGtriWwaXDqdGSnu7GrDiQya2/ogXYeflLATV
 CBbsvhqYCcHtc/T1oA3jK65+I1YLJ0DShL4DmPnC/fjkrx0fw6SCauDlI
 lYI6vtAMUVgDqclzZOFzoribZviyC7Qd9fa3a5B943uBuMXshcjh4WhuB
 4TM3KQZZuieJiE1VVvnXV+gt8YbkIv/OP+MnZf60OejXDfJs29ER3RHxI w==;
X-CSE-ConnectionGUID: m1OhXoh2Qfmyye0KqyvpAA==
X-CSE-MsgGUID: sb8nn+KCTOK7l4kXHv25Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27221209"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="27221209"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 07:56:06 -0700
X-CSE-ConnectionGUID: P1OPF5QyQ7y5oF4yCkhnGQ==
X-CSE-MsgGUID: UJ0CjhCpQ0ekJtPjUmY87w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="73700834"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 07:56:06 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, suraj.kandpal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 0/1] Backlight control on HDR-enabled eDP panels
Date: Wed,  2 Oct 2024 20:25:02 +0530
Message-Id: <20241002145503.910536-1-santhosh.reddy.guddati@intel.com>
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

Validate backlight control by changing brightness on HDR enabled eDP
panels via sysfs.

Santhosh Reddy Guddati (1):
  tests/kms_hdr: Test brightness manipulation in HDR mode

 tests/kms_hdr.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

-- 
2.34.1

