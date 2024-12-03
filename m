Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40998E6C60B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 06:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21A710E009;
	Tue,  3 Dec 2024 06:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nWLTCGtt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046B410E009
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 06:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733208553; x=1764744553;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KKa/jz8JiEk3QJpE0dxSrACfKRoX1C2XFTTXXtw3QME=;
 b=nWLTCGttlSaTJ0XmspwNFK1ZFLkARvrQPedXf5Qs0MBdnUj7Eygq7+RJ
 RGnHz4CeBfnucwMi6NfRCQYx64/vl8DYdyERasYuOSiFnqKZObHnvCx8C
 88fg3l3wY+T/OR0cihqLHbyZJ3ZPi8Xqy/+tDJ7ULU1QpFt63RIHs1pye
 W0SpcAWghBCVyJ7xso5PRzo5q7si9zrah4jPAdPrjcEG72BIG9rKVBHAi
 QX58AhbWJ/y+2qINyIqjhrrT3VtRkJPGd0JL3ACl836GhCmCOtLGeHQiP
 nCGhXEvvrMI7jHbS0fZp9YuoKTwuEnp936uk2iCZZI7/9Ti1bW5yekHmg A==;
X-CSE-ConnectionGUID: jmS6XxQ1SiKbjcyaYIavSg==
X-CSE-MsgGUID: w5121JiCQ4OXGziB1gU6qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33537960"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="33537960"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 22:49:13 -0800
X-CSE-ConnectionGUID: 2iHILFzNSKmeQc18Dzb8yw==
X-CSE-MsgGUID: QPmpDCokSTeWGbbpwjhPig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="98426756"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 22:49:11 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 0/1] Add ultra joiner to kms_invalid_mode
Date: Tue,  3 Dec 2024 12:14:00 +0530
Message-Id: <20241203064401.366661-1-santhosh.reddy.guddati@intel.com>
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

Introduce `can_ultrajoiner` function to check if the platform
supports ultrajoiner.

Modify `adjust_mode_clock_too_high` to utilize ultrajoiner support,
increasing `max_dotclock` by a factor of 4 if supported.

Santhosh Reddy Guddati (1):
  tests/kms_invalid_mode: Add ultrajoiner support to
    adjust_mode_clock_too_high

 tests/kms_invalid_mode.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.34.1

