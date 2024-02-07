Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF6EC4828F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 20:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1294010E181;
	Wed,  7 Feb 2024 20:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3iMucuc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB81B10E181
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 20:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707338836; x=1738874836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AuKCCWdmvDK4WOP76EdVMFLANCkRk8UMlNKsJEs8/W8=;
 b=J3iMucuc4RrewsXCPGd8BnSvEu0Xux000LFgWIre6KKzwr1jrxK6G+ZV
 ZxBSgNG9dYAgQcXpxjZJC2Mtc/ur60j2bG+qTERU+na+L2qfdjZpl0U7d
 CyDWhuX8qJrqT8HQHa31L3RnDiPQ98ygSxIQ7nRpmOajKFxSHO6sgzNy1
 mvqsn2Gp2PYa8t69G0DvqyHOk+tFZHmycoZKdO5d5khxfFnaYIysEPndo
 rU+1DVK3/qOF4FyVmH2mz0mo+yXwsMs2QGLPOC5XV5pPH3xuJwDdXUOjR
 91CDQuSrU53zhe12dtMFkXzoE23GkFrbOk2oI6hAGyVfX3lQ90zTGmVc2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="18499147"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="18499147"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 12:47:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="6105985"
Received: from ndesainx-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.42.38])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 12:47:15 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/2] Add tests to query firmware version
Date: Wed,  7 Feb 2024 20:46:57 +0000
Message-Id: <20240207204659.7-1-francois.dugast@intel.com>
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

Francois Dugast (2):
  drm-uapi/xe: Add test to query GuC firmware submission version
  drm-uapi/xe: Add test to query HuC firmware version

 include/drm-uapi/xe_drm.h |  32 +++++++++
 tests/intel/xe_query.c    | 143 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 175 insertions(+)

-- 
2.34.1

