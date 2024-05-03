Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC64C10F16
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 17:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4AA113189;
	Fri,  3 May 2024 17:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K49DhVw/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159D8113185
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714756575; x=1746292575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/2Z1n26LTmn5SR5nxyUadEWHCq0kHgwrdc6NRflrtEU=;
 b=K49DhVw/w5Bnnn9Ow4ZAwAs7uJtbOlhL+Ep+1/vqyKiXS/lRSbO1arw9
 WAtt4gQzMzXJJz8gHoGpaTa5dND69E52lLVMqBLIPgKILDR9Gfdi8aGYz
 7mY7IrL0199/U/Y0sHyaR+dvHBuYyI02DWtaddGmuBwYF4MBGnWwi2wzt
 6XNAlwmH5ngPqn2yDKdSn7Ck6HCO/7Fmok5Y9rLptEy5oZIYsplcApyWM
 plEMlGuSHK7FGf9rqjk1phStWM8JIMCRSmJWFX4F6/a37x1bM1WGqGTk5
 eM8bekgTE/lGc95Nb2cVaKZnOvnHLC4oQbYWeewpyS7wqHfaxO3SoVY/p Q==;
X-CSE-ConnectionGUID: OMKOSfudR0+7aMPLw8lKGg==
X-CSE-MsgGUID: iMQ+LkHrSeC2OSA5RbXr3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10733941"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10733941"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 10:16:14 -0700
X-CSE-ConnectionGUID: puypHBosQTihbGYZNMYHGw==
X-CSE-MsgGUID: Lm36vXZpQSOogtfQbqLO/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="64950645"
Received: from alutz-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.96])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 10:16:12 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v2 0/2] L3 bank mask
Date: Fri,  3 May 2024 19:12:28 +0200
Message-ID: <20240503171539.295801-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Update the KMD header to enable L3 bank mask query then extend the
existing topology tests to include this new query. This aligns with
the KMD series below, for which a UMD consumer is already implemented:
https://patchwork.freedesktop.org/series/132075/

Francois Dugast (2):
  drm-uapi/xe: Expose the L3 bank mask
  lib/xe/xe_query: Add L3 bank mask test

 include/drm-uapi/xe_drm.h |  2 ++
 tests/intel/xe_query.c    | 68 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

-- 
2.43.0

