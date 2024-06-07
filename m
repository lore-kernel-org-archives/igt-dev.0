Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E821BC27C5F
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 14:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B5F10EC85;
	Fri,  7 Jun 2024 14:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDNOqxT+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1112C10EC85
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 14:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717772268; x=1749308268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L7GcTjOadOURPZJSdcp7AvNM6f8r/szBLwj8C53pRCs=;
 b=JDNOqxT+CcvsUKTI4f9OJ/CW9KefCL+ZGh6LfrnMg84SCm9bq+s3+wOk
 4KGop9gM5+rYNA227gKwBQhSp/jQr9gAI856UISIBYznvliyQEjxdJ+st
 dCdFM+z54TJtdylAab3nucIcHyM1lq6o3b6wemQlGqrPpflZ1UD8B3f5i
 4G6k9VnTmR+Z4tX39ikO9sANsU6xNOSnzRIGvVvazKwSalcyEoKJQIK+Y
 5U9XpfW3ihq5KDUpiTRHAZ/fWcU54StppzWqF2BjwXaUjl5lhuQ4//MQx
 THU5Xi4gbocG8SaD+uitmVayBSHjbnfmnnrWkTlQuCwVS6suDx9ZrPF6O Q==;
X-CSE-ConnectionGUID: MtlRN8YVQpCoI97Zx/YJtg==
X-CSE-MsgGUID: a55bhXhESzalbY9AhuTnuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14331606"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14331606"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:57:48 -0700
X-CSE-ConnectionGUID: rT2XTFLqQJKL+YyXP9rsTA==
X-CSE-MsgGUID: 3jqaxhnnQpyS8bcwNWwBLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38926787"
Received: from unknown (HELO vgovind2-mobl3..) ([10.245.244.236])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:57:46 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH i-g-t 0/4] tests/kms_dirtyfb: few fbc related updates
Date: Fri,  7 Jun 2024 17:57:28 +0300
Message-Id: <20240607145732.285557-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add check if the plan size is within FBC enforced restrictions otherwise
skip the test. Some updates to FBC debug prints to make debugging easier.
And disable PSR feature only if psr is supported by the sink

Vinod Govindapillai (4):
  lib/i915/fbc: print current fbc status if cannot be enabled
  lib/i915/fbc: add fbc frame size check helper
  tests/kms_dirtyfb: disable psr feature only if psr possible
  tests/kms_dirtyfb: ensure plane size is within fbc supported limit

 lib/i915/intel_fbc.c      | 42 ++++++++++++++++++++++++++++++++++++++-
 lib/i915/intel_fbc.h      |  1 +
 tests/intel/kms_dirtyfb.c | 14 +++++++++++--
 3 files changed, 54 insertions(+), 3 deletions(-)

-- 
2.34.1

