Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5CCE77188
	for <igt-dev@archiver.kernel.org>; Sat,  4 Jan 2025 11:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7413510E11B;
	Sat,  4 Jan 2025 11:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffH+/p/F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969BF10E11B
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Jan 2025 11:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735990387; x=1767526387;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+TO8mY2PETlRsLES3/uA7GkRc6pHFXcNAi5gg5AoqWg=;
 b=ffH+/p/FcAoMU67RAaveywHdJd4CX/3surPlyO24ycrfhl0sYJDc6ZCf
 xVJ+m5HhYRv/h84znqNV+000cuOX4S3kEZEiAl5IJwhwz9BpwudvD5KNg
 i/i/9UBntoqcs46sGfNTcxz9jyuLGqDgo+SuCXWRRX1T/gNlSrRbKNgJH
 /DPzdURCQ+Jxoh+G/Z406uTzrdK16lxf/b2t7P+/yQNSuYcBjolnMYL+A
 rQL6zw85l/qwW6o79RDrADJ/2XnmFozJcACgF4MRzXNt0wtH8zblkMjKT
 LDwLWObsLuPyybNxoyWzuSrctI5k79gCSPwEQH3mN4mgnCaRlPDt4hYeT w==;
X-CSE-ConnectionGUID: nlbq80xBRyGCAzUn0jDlbw==
X-CSE-MsgGUID: hmqNJsuPT9e22WKBnyto1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36325822"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="36325822"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2025 03:33:06 -0800
X-CSE-ConnectionGUID: lnAPzToaS2S83k7Y0TP3/w==
X-CSE-MsgGUID: W5/fxYqARRavRoA9vLlgQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="139322020"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2025 03:33:05 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, pranay.samala@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 0/2] Update skip messages in scaling modes
Date: Sat,  4 Jan 2025 17:01:26 +0530
Message-ID: <20250104113128.893119-1-ramanaidu.naladala@intel.com>
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

These changes improve the clarity of test logs, making it easier
to understand why certain tests are skipped.

Naladala Ramanaidu (2):
  tests/kms_scaling_modes: Add informative messages for skipped scaling
    mode tests
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 171 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 276 +----------------------
 tests/kms_scaling_modes.c                |   5 +-
 3 files changed, 12 insertions(+), 440 deletions(-)

-- 
2.43.0

