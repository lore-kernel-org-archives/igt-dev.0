Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BD0C369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 10:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E5910E554;
	Tue, 22 Apr 2025 10:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QhXcOVTG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE26410E554
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 10:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745318845; x=1776854845;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a4yXNuGUTJNMfLgZuqC1cW1o5tV2B8CQcYeAxXVai90=;
 b=QhXcOVTGXwPiDyCnujLWkTElCeA7z8Bxwy8Ptv9U03YVkqZZ7Eagxmg0
 SRMCo+0IZknyLbnVWVnDY5zq5LLgtZU26WiNhgqnW2cytkVihAlYfthOm
 +bnW0ZuLr8tu5gzikXRnekkLYBynrNrlEsdx6iiPwPH0RteKov+z2saLW
 cI/oyYkMzTg/dkq/rKAaeVctxwezQDDnIs4rukRjlzG8fK3DbSvjj5Z1/
 ArgGamneMotYds6pjFxhI09uIIW3rsnC1btFmNrAWWcGYNS24aqq7xjk2
 zUtJseCKXXOvgjoBNYpktrk0jqpuMqwg+VqXe6SJEea0BqOyB8xZO2CfM A==;
X-CSE-ConnectionGUID: zAl9Wx2pSkiuunBAfe2O9g==
X-CSE-MsgGUID: biTSl/3RR8+/WsPOhwZHFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57853066"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="57853066"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:47:25 -0700
X-CSE-ConnectionGUID: h7/chSNBRMWQBJUAJWz5RQ==
X-CSE-MsgGUID: 4u/xxIl0RlGyiOMk4Px41A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="163027951"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:47:23 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com
Subject: [PATCH i-g-t 0/1] Fixed xe load test skip issue
Date: Tue, 22 Apr 2025 10:29:35 +0000
Message-Id: <20250422102936.2950388-1-sobin.thomas@intel.com>
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

Fixed the xe load test getting skipped by unloading the xe driver
before loading the driver.

Sobin Thomas (1):
  tests/intel/xe_module_load: Fixed the skipped test issue

 tests/intel/xe_module_load.c | 3 +++
 1 file changed, 3 insertions(+)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
-- 
2.34.1

