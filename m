Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1FBFD88CB
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 22:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E9910E795;
	Tue, 10 Mar 2026 22:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGeG+2Ln";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A148710E791
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 22:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773183045; x=1804719045;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QcVX4C8mCkFKmDXgSdo/xwD9/sqtAKE4YGxgYhbZ1wE=;
 b=FGeG+2LnCYwkueadWuIBhHhmgUFhnNEr9S/ub2LjUlXh/nItEfU6p3h6
 sGWgFNlppmUDB4eP4ner/GkLgi9lpSSQJ9r6eOADC8DNQeCDvgf9HZRx2
 kC2lRUg8+d4hVwFAcSc/yCMmgh36NcZgLJAL0yFF8/CfqB6JEw/+NbVTD
 lmiOgvMOhVUyiRAmlohzd0UBvWSEQ6GT0j55rg6A3jlCI69egYrh7ni74
 sEKaJKuRRbTHkfPcIAbJlyzDjRi2CeqvfiYpQtM6dztiErMrHVALG9RE1
 +ePT57JlEBE5XpK4vSSqJ1HcZRGEx2Dx++AaFjkWJJ2gXu+6HiBg0/CIP g==;
X-CSE-ConnectionGUID: oe+PVDsTRXK4YrraeVr/Wg==
X-CSE-MsgGUID: ItQpa1ADT3md4bTx7VdUQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74362669"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74362669"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 15:50:44 -0700
X-CSE-ConnectionGUID: nrzSfAdVThqsn8Ep+t7JDg==
X-CSE-MsgGUID: x8kMYy+bRq2qWk7RMQg00A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="219512654"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 15:50:44 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel/xe_oa: Delete disabled-read-error
Date: Tue, 10 Mar 2026 15:50:38 -0700
Message-ID: <20260310225039.2687668-1-ashutosh.dixit@intel.com>
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

We are changing OA functionality in the kernel to allow reads even after an
OA stream is disabled. This requires this patch to prevent IGT test failures.

We will send the kernel patch after this IGT patch is merged so as to not
have CI failures with the kernel patch. This is needed because "Test-with"
feature is not available for Xe.

Once the kernel patch is merged, we will send another IGT patch to add
coverage for reading after an OA stream is disabled.

Ashutosh Dixit (1):
  tests/intel/xe_oa: Delete disabled-read-error subtest

 tests/intel/xe_oa.c | 77 ---------------------------------------------
 1 file changed, 77 deletions(-)

-- 
2.48.1

