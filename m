Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3B7C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 18:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C6F10E030;
	Wed, 26 Mar 2025 18:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRoqbV5R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A1310E030
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 18:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743013009; x=1774549009;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sWys5JmjvLIlYTqIbULN7fK1frl1DR2sZPLYi7HG+bY=;
 b=XRoqbV5Rd5ONnPu8cARrUYTO1yuiu1IxW/IWAcu+4lQBmS4/NmQM0S3r
 V/xqWBci6flM+f+kn3gfhXwqJ60pU+ipcyHJsDu0DAbBxlg47bJcxvjK3
 VtJznbYdfeyj2PwwhNA/SQKRu6Fqt194pFFJPjkH5U+OzDJxl5ZF44MOX
 cg9enssQdXx4ZNmmwF3HMhT4Vmho8IIlNkUgBvManjeZBsnqO8Yz/NPqk
 B/jEov5eLgDJJ+Vxb0fDfhXGGZFLL+e5qAMc8tKwgZX3uhx7yzKFL9wZH
 bwWP395TajajFZNxTfx33ttFHCeXzy3gur80ghxy4EM3fYIu/9y360l1T w==;
X-CSE-ConnectionGUID: 1iRuBTv2QbyNoXAuDo+erg==
X-CSE-MsgGUID: C2nUkcN8RWOB0sW1q7ZAQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="31924956"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="31924956"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:16:46 -0700
X-CSE-ConnectionGUID: i8bHcj7/RSKdQSsFJpBhSw==
X-CSE-MsgGUID: EY4ipbKtSQa6S+x3uuTnow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="124796924"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by orviesa010.jf.intel.com with ESMTP; 26 Mar 2025 11:16:44 -0700
From: replace_with Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	dominik.karol.piatkowski@intel.com
Subject: [PATCH 0/1] *** IGT Test code handling error string for
 xe_sysfs_scheduler.c ***
Date: Wed, 26 Mar 2025 18:03:11 +0000
Message-Id: <20250326180312.1808192-1-sobin.thomas@intel.com>
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

From: "Thomas, Sobin" <sobin.thomas@intel.com>

*** BLURB HERE ***

Thomas, Sobin (1):
  Added tests to handle error string conditions in xe_sysfs_scheduler.c

 tests/intel/xe_sysfs_scheduler.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
2.34.1

