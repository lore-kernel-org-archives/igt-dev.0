Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB96CCCFA0D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 14:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4E410E75E;
	Wed,  5 Nov 2025 14:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aP5NuYxu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FD610E755
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 14:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762351522; x=1793887522;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k1d3Y+08nSr41T8msBcv2b4FJIK6ro0UnkwJv8qXPHQ=;
 b=aP5NuYxu2aIIqwNeUCAi7mrlK1hz6ulz2Vxeq5WoHYiyG914Nam3KS2i
 iKAQA4ok+CltTdoKDC10YrVFYKMc1SCFinXQbBjmMQqqIQYav2YxePcsa
 m1m4UTzWIb/d48j5wzRZPVOGunJbMkYEHQmuhNDtrjsYUYfaOtQL0Afua
 jyX7wOFTHmRMx2PJln6EnpcGgj1sfKO3x45ttWui1LwmAWLfyF+7+enmK
 aVdRWGlp3RYJOcTXh5HHmylbHtjxmu3vk+pLmZvWr4SSjkpQ7TunIJl71
 W3ooXcS52OGRW5OTfcjPOCM9YbH+WYeSv6D+y5IN43daV6iHzA02DfJBU g==;
X-CSE-ConnectionGUID: DN68Hm/UQm+ttHnjHFHyOQ==
X-CSE-MsgGUID: BfFNs6h7TJ6XLWPAx/q+qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74758107"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="74758107"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 06:05:22 -0800
X-CSE-ConnectionGUID: TfexdcVwS0KjwP8/l9wgtQ==
X-CSE-MsgGUID: +Q7DJLOPQ8iNsUMUOWHsyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187131305"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 06:05:19 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v4,
 0/2] tests/gem_ctx_freq: Fix frequency restoration in exit handler
Date: Wed,  5 Nov 2025 19:30:29 +0530
Message-ID: <20251105140029.1796233-4-sk.anirban@intel.com>
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

The exit handler was failing to restore frequencies as it was being called
after the driver was closed. Reopen the driver in the exit handler to
ensure proper frequency restoration

Sk Anirban (2):
  tests/intel/gem_ctx_freq: Fix frequency restoration in exit handler
  tests/intel/gem_ctx_freq: Add null termination to sysfs frequency
    buffers

 tests/intel/gem_ctx_freq.c | 41 ++++++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 10 deletions(-)

-- 
2.43.0

