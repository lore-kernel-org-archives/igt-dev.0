Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8BCC02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 16:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E088310E24F;
	Mon, 27 Jan 2025 16:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tc/Cn+xq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D0A10E24F
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 16:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737994322; x=1769530322;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GBqayphMh2hh9ZM2meEIj2MUjOw5t3iY4jXKY7knm9U=;
 b=Tc/Cn+xqEbDz6S+mFMB8mqdjgM82wl1SVSwKpjOQyIWGwhCJwiUsPgB6
 CfvHUPjdNcvscWYbrUjn+U9Hrt2sQUSAj5siStQmDjhn3DJ4+lmiTWq7T
 NbeDEG+QVhL0mLhADZ6ZE+8J4bYMvtZ0FxxcOwzMd00vmAq2W2NKcbs5a
 iaUP9IY27iGaN+N3TfAl6kbvPqlms9TxK1x1UgZRcR2XkxI5pnFTzV9SJ
 GyRlva4Yf/6K9Ndu5rsFzJIEKK6EHNW3KEaUX2WpuplObCZGJKKA47iy9
 nNOTaG2pMPSLc1Frf/F+jYYIouaOf9XciV2z51u/lxa2YK322awxM48R8 g==;
X-CSE-ConnectionGUID: NO7WYC9KTrqhqVB73xDFVw==
X-CSE-MsgGUID: qZrkkZryQwK5QWS2PbbvnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="41298844"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="41298844"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 08:12:02 -0800
X-CSE-ConnectionGUID: UIIsgxVJQ8OJZOrqY1a9tA==
X-CSE-MsgGUID: DPTWSNEVS/+DwnCtEhWJnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108925778"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 08:12:00 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/kms_pm_rpm: Restrict cursor tests to
 I915 driver
Date: Mon, 27 Jan 2025 21:57:34 +0530
Message-Id: <20250127162736.3451740-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  tests/intel/kms_pm_rpm: Restrict cursor tests to I915 driver
  intel-ci/xe.blocklist: add i915 specific tests

 tests/intel-ci/xe.blocklist.txt | 2 ++
 tests/intel/kms_pm_rpm.c        | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.25.1

