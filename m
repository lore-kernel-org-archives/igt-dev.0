Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37061C19F4E
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 08:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C1011A2C9;
	Thu, 25 Apr 2024 08:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbDVZfE7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031A211A2C9
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714035128; x=1745571128;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=aaKtqmnQwF0MdV+Xf92g7/emutnSOJ7VyWiMnT8+tIg=;
 b=BbDVZfE7mgXv2hPXA8xl9KJH//vQwzDbTJ6QQ99oOVs0bEnYgZvlyKI5
 l+7xoxEY7jtYgmSOyR5ckt4ymAxzQjRbCuWIrrqc4rz7R6ow9Yt/qnkaM
 6SaGmZqwqGnJJhP7/PMLaHQ7a5VrmzhwHtxrHhYHck0+JB1AoxXngf0cA
 JhOtmtIEJZ1JSVs7E322YtRjLsGwfnP28n1pJ/KsHwYtp0m6PDnHsbBsh
 OxB0lLgB6TdO0BP194csT/UGeMk+ZZHnHDo9gHgNXaY+JFPOkkLYNGcqX
 YOfYiE9GA1sdLfjA8ERu00nx8pNyuJe7CmkheyfwaFrMXbuHohZHgJYqq A==;
X-CSE-ConnectionGUID: tELeBVpAQEWS8p5jS46hrg==
X-CSE-MsgGUID: 2Y+oLbj+RMO+MSgloSjF1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9576285"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9576285"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 01:52:07 -0700
X-CSE-ConnectionGUID: Fc0z6FxxQ5aeakk4gTKGFA==
X-CSE-MsgGUID: go4MvumDQV+uLRjxtv2HsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="29486143"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 01:52:07 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 99B4A206D89F
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 01:52:06 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rzupo-00000000b1H-2LSi for igt-dev@lists.freedesktop.org;
 Thu, 25 Apr 2024 10:52:04 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] Cleanup indentation on Intel JSON files
Date: Thu, 25 Apr 2024 10:49:21 +0200
Message-ID: <20240425085203.142195-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Having an uniform notation at the JSON files is a good thing,
as it makes easier to maintain it.

Ensure that all 3 Intel JSON test plan config files are using the
same notation by running:

   cat tests/intel/xe_test_config.json |jq --indent 4 >a && mv a tests/intel/xe_test_config.json
   cat tests/intel/kms_test_config.json |jq --indent 4 >a && mv a tests/intel/kms_test_config.json
   cat tests/intel/i915_test_config.json |jq --indent 4 >a && mv a tests/intel/i915_test_config.json

And then verifying the results, committing the changes that
are worth and ensuring that all 3 files will follow the same
style.

Mauro Carvalho Chehab (2):
  tests/intel/kms_test_config.json: fix indentation
  tests/intel/*.json: remove some uneeded whitespaces

 tests/intel/i915_test_config.json | 4 ++--
 tests/intel/kms_test_config.json  | 8 ++++----
 tests/intel/xe_test_config.json   | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.44.0

