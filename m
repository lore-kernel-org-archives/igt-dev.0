Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199ECC3DA45
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 08:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA47110E6EA;
	Wed, 10 Jul 2024 08:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdlgT2gx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75F410E6E7
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 08:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720601249; x=1752137249;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E96yWb1JYUoZFBF2VJFf//qvjcI/KJDkQuDRftDoELQ=;
 b=GdlgT2gxJfBJDeVTc+fpyicPkUFr38I55bndiH9WnwaU4xUcFZGyzms4
 BwZxH/QjrRs5Pvu4fLGqF++BKEV4T03tzUHKiGhJW96Q/cvI7BJwNY3Fk
 Jc+9s0U3trTw/47naYfreogFus+A6nfBkWn3s/pYJuxw3LjAK1BCact4J
 MNN8FynA9j9ofqs5lqpF7dVlk29yNHU06UNws2npX6+Ci/bigqzoGevOz
 baoDayoc9W5gzvAwKtu/0hdo7vWFcMbAq+vMrVUPTsfNJAQ3pZXOJr6Yq
 SN6BRCVR7RqIhtKHHeWYRX5bNYo/AMiptlb7MwX04VHhYeFXZMO6mpNrn g==;
X-CSE-ConnectionGUID: ZKroh6sPTL+uVQ+XMJlN3w==
X-CSE-MsgGUID: ymjsZmVfQI2tdJr2/fU/YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="35341089"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="35341089"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 01:43:51 -0700
X-CSE-ConnectionGUID: h1eL1rXgRCi2+HCa1sBVQA==
X-CSE-MsgGUID: uyJUjBeIS3SDaKZ6SuXtaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48120753"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa008.fm.intel.com with ESMTP; 10 Jul 2024 01:43:49 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2 0/2] Runtime alteration of debuglog level
Date: Wed, 10 Jul 2024 14:13:56 +0530
Message-Id: <20240710084358.744278-1-pranay.samala@intel.com>
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

In certain scenarios, tests may fail due to insufficient disk space, 
even though they fulfill all requirements.

To resolve this issue, adjust the debug log level before initiating 
the test. Rather than manually editing the debug log level each time, 
aim to dynamically adjust it.

This approach involves modifying the log level within the test using 
the debugfs entry, with an exit handler ensuring default settings are 
restored after testing.

Pranay Samala (2):
  lib/igt_sysfs: Implement dynamic adjustment of debug log level
  tests/kms_atomic_transition: Reducing debug loglevel dynamically

 lib/igt_sysfs.c               | 75 +++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h               |  4 ++
 tests/kms_atomic_transition.c |  5 +++
 3 files changed, 84 insertions(+)

-- 
2.34.1

