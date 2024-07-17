Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8BCC3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 14:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4472610E190;
	Wed, 17 Jul 2024 14:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJFqcVTR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746F310E190
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721228379; x=1752764379;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RZMfONei+5AHBc8sSvN5zLESJm78FCBFE9oDoOjP/uE=;
 b=iJFqcVTRRSQFN1GCfTgY6GYSZjskGEs8oe7oJuYteu7WEOQgms+W5Vrc
 azMlD2kDPbZPDZVxklsx/2KfMCQwxIJlINctK2JbM1mTUzNrNH0QZo6yG
 DEX8t1J3KybsrJFOv9WUEcdD4KH5k+B2DE9zBdEQr+Bk7tHY2lAQILXNg
 iPQLRScNU8E9Q7RwJap7q4vMcqtl6chqLRATOip1vvYqs2t1Xd0MPdmxI
 K2P2b4uQ86eNhW0eT9qUOXMX/Ul+vfwBoWedfbHaJsDX1qK6CFG7CrJhr
 2tbdyC/SHaDmxeeonzQea/PsaoufC+srqsAPGmlT+TYq0JpRAurQctjzq A==;
X-CSE-ConnectionGUID: PmgOYmRfRl+FrA49QzeIcg==
X-CSE-MsgGUID: psWx7SLKQjutKUv28p+pmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18354547"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18354547"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:59:38 -0700
X-CSE-ConnectionGUID: Z4puaChJQM6RGFG0QnFhQw==
X-CSE-MsgGUID: HJ4Wy2moRbqPRhw65G0WPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="87890753"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:59:36 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 0/5] tests/kms_plane_scaling: Improvise the scaling BW
 issues.
Date: Wed, 17 Jul 2024 20:33:41 +0530
Message-ID: <20240717150346.650276-1-ramanaidu.naladala@intel.com>
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

Naladala Ramanaidu (5):
  tests/kms_plane_scaling: Update the single plane scaling function
    arguments
  tests/kms_plane_scaling: Update the multi plane scaling function
    arguments
  tests/kms_plane_scaling: Improvise the planes scaling BW issues
  tests/kms_plane_scaling: Improvise the plane scaling BW issues
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 201 ++++----------
 tests/intel-ci/xe-fast-feedback.testlist | 317 ++++-------------------
 tests/kms_plane_scaling.c                | 279 +++++++++++---------
 3 files changed, 256 insertions(+), 541 deletions(-)

-- 
2.43.0

