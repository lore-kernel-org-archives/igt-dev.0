Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0326C1067042
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A080D10EA35;
	Thu, 12 Mar 2026 15:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRSq9CrJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD5210EA35
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773328308; x=1804864308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=reFEy3lcCufqGEnfVZMc+MjOUkXAa8N8Vnd1YXkEOj8=;
 b=XRSq9CrJZkDuz1CNeSaCsiJwfnOf8Hff0k4OBRY12Z9J72rHVbHdsSUo
 QV9jLeKicMq94Ixyd4k2KqxKBNwDwk78NEctdMZuUe/PS3xc6C5QCv2Bp
 dJa1Wly7mZslPHeqHTpf1MILc5VVgA7nDL0hVyExZFO1aRyxfuF6mIT6d
 9BLF+pQ9sTN5lRVExl1AyChjDQ1OR1obNwQ8buPvKYJ3tgltDmKOzXYRM
 tf67BL+VlcG8LutPi4j+QDwZILWlCpxevYVJlCKaySTK9GS+v3i5mppNC
 0Z+QF3U8gmgdQ/5eMFQ69evh7vIHyjd2Wznn52gIrcYBn63IhcOPoeIdm g==;
X-CSE-ConnectionGUID: rlq6b3VeRnSU4ZQTeeZOPw==
X-CSE-MsgGUID: wbv+dELpQUaEgz6H0ELVcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="61997645"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="61997645"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:11:48 -0700
X-CSE-ConnectionGUID: hCWHX2b/TzeYCoXywRnkKA==
X-CSE-MsgGUID: xyCW8caKTBiBKKwemLgZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="258772015"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:11:47 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v1 0/5] intel-ci: Add Xe FULL chamelium run type and testlist
 improvements
Date: Thu, 12 Mar 2026 20:38:56 +0530
Message-ID: <20260312150901.3272265-1-mohammed.bilal@intel.com>
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

This series adds Xe driver support for FULL chamelium CI runs by
introducing the Xe FULL chamelium run type in kms_test_config.json,
sharing the existing chamelium-only.testlist between i915 and Xe,
and using driver-specific blocklists to handle platform differences.

Additionally, it improves testlist reliability by moving suspend/resume
tests to the end to avoid system hangs affecting main test execution,
migrating inline test exclusions to blocklists for consistent filtering,
and adding non-deterministic random-plane tests to xe blocklist.	

Mohammed Bilal (5):
  intel-ci: Move suspend/resume chamelium tests to end
  intel: Add Xe FULL chamelium run type to kms_test_config
  intel-ci: Add VGA chamelium exclusion to Xe blocklist
  intel-ci: Add *-planes-random chamelium test to Xe blocklist
  intel-ci: Enable hdmi 4k resolution test in chamelium testlist

 tests/intel-ci/chamelium-only.testlist | 18 ++++++++----------
 tests/intel-ci/xe.blocklist.txt        | 15 +++++++++++++++
 tests/intel/kms_test_config.json       |  9 +++++----
 3 files changed, 28 insertions(+), 14 deletions(-)

-- 
2.48.1

