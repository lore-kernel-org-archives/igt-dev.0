Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91DECF3963
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 19:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AC410E771;
	Thu, 19 Sep 2024 19:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQEeH7Cc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D0210E1B8
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 19:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726774372; x=1758310372;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=82idSaR3JpHZQ8yHWP1nbaBwom6k7Qd9q2gzLcaK6JU=;
 b=FQEeH7Ccv34fjpAj+w2E5j+zs06YE8caDvC5kl5Rqeo91/pofXPTFNoF
 WzONwBdC06AtTT1chLctxy2sk3zLG2CKA4GqMJirwdltDd3S2XXrw7Dez
 Pnuck2UZE8VJhSDOlpVw5Vr14PM2GJSsB1Q9xtdi4j8La/UOLKAr8n5H9
 mA3g9mb5iIOEfu4G6TXN9bxZvHc6BSBzu1julfeEiRuKg15OLpyZIASK3
 18ocdW48/VFC/iLRZcCVM0QeUgyav2D9L3FAeeSTBuxTp0w0rRRHzPJxv
 ewW+lNZLpSx8OMRi+LMgWzdwC18eUBbMlULD62T0Dsopjj2uzy77upM35 A==;
X-CSE-ConnectionGUID: c8sCIuUlStOfqJwgMNms4w==
X-CSE-MsgGUID: hRPjm429R12YgwOTQNzgzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43279657"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="43279657"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 12:32:52 -0700
X-CSE-ConnectionGUID: Odett+6UQOiIg9JvYP7G1w==
X-CSE-MsgGUID: HEY/T1waRvu0Kw3Km0GtuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="93327803"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 12:32:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/2] Fix kms_rmfb for xe
Date: Thu, 19 Sep 2024 12:32:48 -0700
Message-ID: <20240919193250.1439745-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
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

Lucas De Marchi (2):
  tests/kms_rmfb: Fix support for xe
  tests/intel-ci/xe: Remove kms_rmfb@close-fd from blocklist

 tests/intel-ci/xe.blocklist.txt | 4 ----
 tests/kms_rmfb.c                | 8 +++++++-
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.46.1

