Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7EBC3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 14:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5666A10E0C5;
	Wed, 17 Jul 2024 14:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+T9HBNx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1DE10E0C5
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721224919; x=1752760919;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HX3LR42pKss/PGT64zOSY0Ctal+j9duIPcSubRTLy1o=;
 b=W+T9HBNxF70FWZ0mUN4k0LS+d//gVno3NDBEKqQwBlbeUpZhz1/vWdvs
 HFthcCQTWlCHF3wFJvzjUianuaxobnrFwydAVcZyO2NHlvWHlnKJJX+bS
 f7uNfRVKZ0FMN3RJkzRMgDKmXksTiayJ59uwlH3ofCPHJGoqHI1np4VvU
 60OBk/zsD+qN85/sgNWC54iSUzZ2z9xaiByotCo+FdRZwDAKW1MBTYPxt
 dsQbZLKkvu8GOWYBryC2YSL+Mj968xWqExsNtOsC/kNNFXqoWMM4k9Va+
 Z2sj0JghBWdTuzoRCdM0zVrt08O+hRFfLvJfz0/TOuIcapHJZUkFiXj5I g==;
X-CSE-ConnectionGUID: NeeVyVWjSDKVaDxpDguWmg==
X-CSE-MsgGUID: OnMr5tgrSp6WuljKGjtGPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29341085"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="29341085"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:01:59 -0700
X-CSE-ConnectionGUID: foP5F1NbTRmZyBxdPVQOrA==
X-CSE-MsgGUID: Yq5DRYSgRsuLjdHdx2DDJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="87867562"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:01:56 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, suraj.kandpal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 0/3] Improvise-the-deep-pkgc
Date: Wed, 17 Jul 2024 19:35:53 +0530
Message-ID: <20240717140556.640124-1-ramanaidu.naladala@intel.com>
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

Naladala Ramanaidu (3):
  tests/intel/kms_pm_dc:Add basic validation checks to achieve deep-pkgc
  tests/intel/kms_pm_dc: Update deep-pkgc function
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 169 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 275 +----------------------
 tests/intel/kms_pm_dc.c                  |  42 ++--
 3 files changed, 31 insertions(+), 455 deletions(-)

-- 
2.43.0

