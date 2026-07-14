Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393A6C43458
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 21:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C131A10E0D1;
	Tue, 14 Jul 2026 21:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDWAWFdN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0140710E0D1
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 21:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784063136; x=1815599136;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s9c86i9ckHrc1xLv/atW/vNUAASGinvYEsG+i5YtOXw=;
 b=cDWAWFdNxZyxeBDzyX2glKCuYKNrdtLF9Zav+AJUyvMrR6vWGt71eL9L
 jxoaYwtLy1JAtWLYfQcKGqm+f8GStAnywy7BveIMdDe+zj4kR1/iKlBot
 iH3adp1SXUNd2lBiRwqEr90ubuKm3z4w+anjt4Ia58ehfTMFvs/aSNY6v
 8lXCZdDVu5bPaU28YJu6kMhNnnpUjA+nsMte9IvpIUdN5/UAeu7nEi5O6
 mByF0tLFRFQZiN3aLv/CyEpqZWDWkXK0muJLnyfMxC99spjOMIZzQMn21
 m4taGu15qcnVpFvQSnVBOhQ880/E5NXPBl4eNvxLax26uockwY6oTcIcy g==;
X-CSE-ConnectionGUID: Fq7dsfhYTLqZeBPi0wgRDA==
X-CSE-MsgGUID: ZEDG2zGwR7eskSua6fxgYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88372433"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="88372433"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 14:05:35 -0700
X-CSE-ConnectionGUID: xC92iDlMRfug3Sq3o8cDoQ==
X-CSE-MsgGUID: QZM5zhIuQoiar84qrXtR/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="280386240"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 14:05:32 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 0/2] tests/intel/xe_survivability: update ignored dmesg
 regex
Date: Wed, 15 Jul 2026 02:27:48 +0530
Message-ID: <20260714205747.119025-4-sk.anirban@intel.com>
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

The kernel now reports -ENOTRECOVERABLE when the device is wedged.
As runtime-survivability deliberately wedges the device, update
dmesg regex so igt_runner does not treat the expected error logs
as failures.

v2: Keep older error codes (Kamil)
    Modify regex (Kamil)

kernel implementation:
https://patchwork.freedesktop.org/series/168780/

Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Sk Anirban (2):
  tests/intel/xe_survivability: update ignored dmesg regex
  HAX intel-ci: Add xe_survivability to xe-fast-feedback

 tests/intel-ci/xe.fast-feedback.testlist |  1 +
 tests/intel/xe_survivability.c           | 21 +++++++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

-- 
2.43.0

