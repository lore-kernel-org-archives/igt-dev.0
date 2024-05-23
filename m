Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CB3C25B79
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 08:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE225892EA;
	Thu, 23 May 2024 08:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EyiHGPH1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D909892EA
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 08:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716453881; x=1747989881;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zpQif83pxm2Ws73NGmhpLcnls86rWxsUO3Y3viWbvek=;
 b=EyiHGPH1fE9X+dKso+I7swd8UDQWY5Wk4QjD6ZOdSshcNC9EroMNRHiV
 136wqp6rFAxAxVWtNk2cg5fpXX/HChEtRspPzUWWmIPxMtgpc01zJJB1s
 0Wkt0qBeMKMFy/L9pnQnzAOgjjyZteq33Q+dyKF3rEny+YFfXDmQkyVhq
 pMTq0JW74k9hKRt0TPzwAZ0cUu/zAYpFXreRz9TsezwSwLH0ctiYJrwFC
 WghphZNScegP7Wv39GC7YZot1E/Cp9dianuTPCcfLz+YcSKRhkNBg757m
 8XE+JUS9CeSV8C2tLn6LlpDrM98i0eSwimsKJuFSzbBk6h0tEof+5p1pt A==;
X-CSE-ConnectionGUID: 9mOttHSFSAqWyEh7aOOJYw==
X-CSE-MsgGUID: q5z5ZualSvSKmiKkXKkkAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="16543951"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="16543951"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 01:44:39 -0700
X-CSE-ConnectionGUID: brj9pQD/RgKPy8sywVdI7A==
X-CSE-MsgGUID: XH4qPxD8SuK979tMbbtqew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="64819777"
Received: from shrehore-mobl2.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.249.36.27])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 01:44:37 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] check drmModeGetConnector() return value in some
 missing places
Date: Thu, 23 May 2024 11:44:24 +0300
Message-Id: <20240523084426.284894-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
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

Hi,

There are some places where the return value of calls to the
drmModeGetConnector() function are not checked, even though it can
return NULL in some cases.

Fix that in lib/igt_chamelium and intel/i915_pm_rpm.

Please review.

Cheers,
Luca.


Luca Coelho (2):
  lib/igt_chamelium: check drmModeGetConnector() return value in
    wait_for_connected_state()
  tests/intel: check drmModeGetConnector() return value in i915_pm_rpm

 lib/igt_chamelium.c       | 3 +++
 tests/intel/i915_pm_rpm.c | 6 ++++++
 2 files changed, 9 insertions(+)

-- 
2.39.2

