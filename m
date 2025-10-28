Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F17CCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 08:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E8A10E0A7;
	Tue, 28 Oct 2025 08:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8BjC9WM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512C310E0A7
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761641035; x=1793177035;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LbnRqdx2ikN/Dp4tlbLlPRY/P68nM4yJd6I7Y+WFECg=;
 b=X8BjC9WMkHS7LwgwO4AAq0KpoUnnDYGkacvmQlEx+SosL38ZsoEYFnvj
 qRVadMKdfVMde4wDgX4/4nu5Etp3HLjmUQzqwcgNt1I2K+GCO1f5Pe9Ww
 JE91r8ONRU0sUNlH/e/p53C/c5FJ5jgz1+mbgjjR11sT20n4p0cdNUTla
 6LfLu2T56v0QZ6adRzLtpV/Xf9J+m8NKoToQ7N5a8IevwD1OLBJfhGQjv
 BBZvKfUzea06ZgXoJiHf0hMkGrJzi8tJYZBiAWtFbXRq4668NMaFPj78k
 adZX0kZSG80DD7RT96JQzoxmU5LT0WZtsgbN5hUi2VeZaSPJLZ6vs9AYY Q==;
X-CSE-ConnectionGUID: iDZwP2mDQEONBCI0gPYX/Q==
X-CSE-MsgGUID: ZEiL8lYKRFenyYSl24yhMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63829493"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63829493"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:43:55 -0700
X-CSE-ConnectionGUID: IsyebONfQHevP7IEKGA6ew==
X-CSE-MsgGUID: b7/rvzEBTqy0io7eAYv1rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184914678"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 01:43:53 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com
Subject: [PATCH v1 0/4] Fixes for VRR multidisplay test cases
Date: Tue, 28 Oct 2025 14:13:50 +0530
Message-ID: <20251028084354.2682743-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
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

Add fixes or handling for expected refresh rate while running
IGT on multidisplay tests.

Mitul Golani (4):
  tests/kms_vrr: Correct TEST_LINK_OFF flag handling
  tests/kms_vrr: Avoid direct assignments to data->flag
  tests/kms_vrr: Indicate force refresh rate request
  tests/kms_vrr: Recalculate expected refresh rate from test

 tests/kms_vrr.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.48.1

