Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C906EEB58C
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 10:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBFD10E215;
	Thu, 12 Sep 2024 10:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9sl+lnn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA35F10E8A9
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 10:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726137882; x=1757673882;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ed+PFrufPi+TrkyXBeQuWdrRap+okcjOAEnDcqx5w7M=;
 b=Y9sl+lnnFYQ0LJtLWOO+8VNpKuorpRFj2vdvFcPkqSz6l3eXBQdTUTYx
 RxNmwY4z6ETub2wCTZRwFVeAOI8ujpCTYJrDGGsqWoVnOwvHiHtv8k+ew
 3FBaUid6s3KtHScRq9pjYCYtQiaqUFAprX5KHRSE1/yjsgW+B8SY1j0Mn
 KxrcGdoIZE/X+UyqoDdQWpu5OsBGi0+910eDQ0lB2gmjuLKkmxTSNgBrO
 zcohctseWfWbKD/5UHCzWcdEkjStKa0A6CFfS5qf870Cfx1L4FTn5fnYA
 EmQ4piZXq2qgtTsn3oyhcoIhKT0+jfhqxvVJSSANmfUm1CW9OTsg5M3d9 A==;
X-CSE-ConnectionGUID: kIy0r1xdQFaJWpqaQjYneA==
X-CSE-MsgGUID: tlwj4M1OQ3q7ZfPLquwaJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35570733"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="35570733"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 03:44:42 -0700
X-CSE-ConnectionGUID: nRMB2kBKRZmjhcqn6CGbJw==
X-CSE-MsgGUID: EAZCP7wLQ6aTAQUmrl1AMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="67387215"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.145.162.161])
 by fmviesa007.fm.intel.com with ESMTP; 12 Sep 2024 03:44:41 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v4 0/2] Add new test to validate adaptive sharpness filter
Date: Tue, 28 Mar 2023 22:23:22 +0530
Message-Id: <20230328165324.62458-1-mohammed.thasleem@intel.com>
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

This test to validate adaptive sharpness filter.

Swati Sharma (2):
  lib/igt_kms: Added "sharpness strength" as crtc property
  tests/kms_sharpness_filter: Add adaptive sharpness filter test

 lib/igt_kms.c                |   4 +
 lib/igt_kms.h                |   1 +
 tests/kms_sharpness_filter.c | 734 +++++++++++++++++++++++++++++++++++
 tests/meson.build            |   1 +
 4 files changed, 740 insertions(+)
 create mode 100644 tests/kms_sharpness_filter.c

-- 
2.25.1

