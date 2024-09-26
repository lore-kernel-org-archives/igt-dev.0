Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3206BCDE029
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 18:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C617610EBCB;
	Thu, 26 Sep 2024 18:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1UmpOJC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1584A10EBCB
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 18:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727374356; x=1758910356;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uIcq1WkcIM3jp/hp16jmciL4PEtKURTPvoCph0/l3XM=;
 b=a1UmpOJC43jFSpuyfrxdYZuXIwNj+Zp6GBogHyuMdZaUWdBlJltTytKA
 ZhSXlxZxsYKSbTwBSkWFhATkb5QwajYtjshBdGJZDy/MF6MDXigbirTUG
 utBnSK2oI4Afyi+7eetsBbxdPA28Igly9PkosneWvy7tDprop0y4lD7gJ
 sYCk5EGQFw7759XaBQtfTIdiNq1QjkbwyL3bXE8DzWB9PwCR1QgiL7FAm
 7/NrYhDwSlHJVouimSxb6kim/mlUoqC/ZZNbgDYrOBvkEjEaTH6YEItHA
 DKKMIkCqE2QH/vIeQklPD00Gd/1Ee6ow/Dh4lL+KdbXUydLGnMFDfg0ZD w==;
X-CSE-ConnectionGUID: rZ2zU7G6QCi+xBjEkvTpIQ==
X-CSE-MsgGUID: GppA73U6Q6aHqk6piW8Gog==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26303765"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26303765"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 11:12:35 -0700
X-CSE-ConnectionGUID: y1EzJUBDQsK8s92lGQl2nA==
X-CSE-MsgGUID: TMurEToDTruYS7dN85Glbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="76327208"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 11:12:33 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 0/3] tests/kms_plane_scaling: Cdclk exceeds max Cdclk
 issue fix
Date: Thu, 26 Sep 2024 23:41:47 +0530
Message-ID: <20240926181150.2148704-1-ramanaidu.naladala@intel.com>
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

This change will solve the cdclk exceeds max cdclk issue.

Naladala Ramanaidu (3):
  tests/kms_plane_scaling: Add mode override in scaling test
  tests/kms_plane_scaling: Improve error handling in kms_plane_scaling
    tests
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 196 +++------------
 tests/intel-ci/xe-fast-feedback.testlist | 307 +++--------------------
 tests/kms_plane_scaling.c                |  11 +-
 3 files changed, 72 insertions(+), 442 deletions(-)

-- 
2.43.0

