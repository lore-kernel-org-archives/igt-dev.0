Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FDEC79F99
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 19:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001CE10E4B8;
	Mon,  7 Sep 2026 19:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gyx0kh6C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB84D10E4B8
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 19:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788810147; x=1820346147;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5KpcngHoneOe+UIjfr3ktehHQkltA7KLfmv53H+uMeE=;
 b=Gyx0kh6Cu9NCv3WVlbeauCfPEv5GNzuo81ekN0CT/NMvFi0tkLPfHuut
 2EGKIexdWtLh1XmcTM4u786IFyQac2AjuPIgL63dDZEJDPa9mwt7TE1bN
 WpMu7ne6V65gHZI4HnT7JgRbRj+F7pGFtXgP8XZ4kJdIxUYHCGYAWyfvf
 YjY/bbI06GR1ZQoNzwA1ZS8ujiyspytWHBVnBbfeAeMqM3Ke5FTs9rYcS
 KDhuzOm9WdZJRrOsOqukNNvEJkT6IKzYdjlc8q4+5yfUVRNIZ3QS2KJUO
 hTesUeGQPR6fkZ6hYz12R06xsIhQusrItNOJqPSurBypTtpLgyrcxxEia w==;
X-CSE-ConnectionGUID: BUC4niSVRa2VJcb2uCN+zQ==
X-CSE-MsgGUID: QGlIaxljSHSLx5YiR+lMUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="92912773"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="92912773"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:42:27 -0700
X-CSE-ConnectionGUID: rD13+0oDRwmPXQExqAHhbA==
X-CSE-MsgGUID: V6zHH7BYTTWZqYkC/h0x0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="294260134"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 12:42:24 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, swati2.sharma@intel.com,
 mitulkumar.ajitkumar.golani@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] Improve LOBF reliability with low RR retry
Date: Tue,  8 Sep 2026 01:12:26 +0530
Message-ID: <20260907194229.3170868-1-ramanaidu.naladala@intel.com>
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

This series improves the validation by retrying the content-rate sweep
on the low refresh rate mode when LOBF is not detected in the high
refresh rate mode.

Naladala Ramanaidu (2):
  lib/igt_vrr: Add VRR helper library for display refresh rate testing
  tests/kms_vrr: Retry LOBF detection on low refresh mode

 lib/igt_vrr.c   | 166 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_vrr.h   |  30 +++++++++
 lib/meson.build |   1 +
 tests/kms_vrr.c |  74 ++++++++++++++++-----
 4 files changed, 254 insertions(+), 17 deletions(-)
 create mode 100644 lib/igt_vrr.c
 create mode 100644 lib/igt_vrr.h

-- 
2.43.0

