Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB16EC30658
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 09:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5238A10E256;
	Fri,  5 Jul 2024 09:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AP+SXXjM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57CA10E256
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jul 2024 09:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720170832; x=1751706832;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yhe0HLJLjTntg0s4hsDwOLrlUBpS4nPJDaR1I/pXT88=;
 b=AP+SXXjM+ft0Q4e/e6CKKESosjLK/JZ5qMbWBcAavAMmknXHBzvzDKqA
 wOOU8lHsPIh5BRmGSX/Kf6XuNCsJVZSvsMYxOk83jR5xYWiDHClkFndfg
 5ieEiK1mwQIXVeGDzQMvyRaklXGbRK+EH6ukIxnTs2ROUTyRaVJju2Jot
 OJFhq/cG+SrgXJNCHEnn1RZEkTyLmJsEhvSjRwUcrjjjv7MvrSa695YMn
 BqrxI//NdrS6hd42gD2IJXujSwQoF5aRjOCDHNIhfSspmu7dFiAlQO9Ti
 1vjEiQ0ozEls9HdUOmcSbKgKyU97nckLlh9e1zLF+XkYRZ5AA778Vj/gF Q==;
X-CSE-ConnectionGUID: JiWuR6kxSkCiY+7KT/N4Iw==
X-CSE-MsgGUID: u6EOQ0QRQneq8LJcumoAqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17589385"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="17589385"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 02:13:52 -0700
X-CSE-ConnectionGUID: ZPIQncN7Qy6OcqtpmZShJA==
X-CSE-MsgGUID: 1i/BNzcfSvaaMfYMJzej9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="46605701"
Received: from lnl-rocket-lake-client-platform.iind.intel.com
 ([10.145.169.162])
 by fmviesa006.fm.intel.com with ESMTP; 05 Jul 2024 02:13:51 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 0/1] Added IGT support to validate global histogram
Date: Fri,  5 Jul 2024 14:43:32 +0530
Message-Id: <20240705091333.328322-1-mohammed.thasleem@intel.com>
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

Display histogram is a hardware functionality where a statistics for 'x'
number of frames is generated to form a histogram data. This is notified
to the user via histogram event. Compositor then upon sensing the histogram
event will read the histogram data from KMD via crtc property.

A library can be developed to take this generated histogram as an input and
apply some algorithm to generate an Image Enhancement(IET).

This is further fed back to the KMD via crtc property. KMD will feed this
bask to the hardware. Hardware will use this as a multiplicand factor to
multiply with the incoming pixels at the end of the pipe which is then
pushed onto the display.

One such library Global Histogram Enhancement(GHE) will take the histogram
as input and applied the algorithm to enhance the density and then return 
the enhanced factor.
"This library can be located https://github.com/intel/ghe"

The corresponding mutter changes to enable/disable histogram, read the 
histogram data, communicate with the library and write the enhanced data
back to the KMD is also pushed for review.

Mohammed Thasleem (1):
  tests/kms_histogram: Added IGT support to validate global histogram

 lib/igt_kms.c         |  23 +++
 lib/igt_kms.h         |   5 +
 meson.build           |   7 +
 tests/kms_histogram.c | 354 ++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build     |   2 +
 5 files changed, 391 insertions(+)
 create mode 100644 tests/kms_histogram.c

-- 
2.34.1

