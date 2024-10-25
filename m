Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA13FD116FC
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 06:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB9310E2A6;
	Fri, 25 Oct 2024 06:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QJ4inpPj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5D810E2A6
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 06:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729836387; x=1761372387;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UlNDV+v3QCA2BQ0qQut5r5KrHfdAcs953B3fqxKoAhw=;
 b=QJ4inpPjndqY9pEO0NiYYYzwMdhmZmH3Jx6pt8iWNKBkK/c4Kc/DWd25
 BPSqaqaWZFP9fXnALn/FMWrZpc0ThL15xQ8JYHWTjhR3m8O4HaZ25Gxze
 yKRR4Mh6bbeXs2UHkIN2MVw57jfvYzK3vZhDpzwGYZHjxTZ76/FBmkpcj
 n3+F41PteGcADQCmc9VXFWUjhxbyTnLwjdNT2DYHp6PvhLS3D8dQ4J4rt
 iDJsTmMFvC1Xagnb4FWmB0aHMLtlqD1yz5+k9Ef+L1jMkJq22ZAdMEhOE
 gyvV4cCU9z+apCR4boS7FOtv6PtTMS28euHkCBYv3youXtWU+v5P1Q97o g==;
X-CSE-ConnectionGUID: tNQTKiaJTpSLczav85kUkQ==
X-CSE-MsgGUID: 0DFfjHr7QMOnN3dEJ9cQ0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29613484"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="29613484"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 23:06:27 -0700
X-CSE-ConnectionGUID: e5wvCoWjRBGYBYhUMSPnFg==
X-CSE-MsgGUID: yn97co2SRniDE5EVPmnlYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="81248257"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 23:06:25 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v5,
 0/1] tests/xe: Add tests to validate GT coarse power gating status
 and toggle coarse power gating states
Date: Fri, 25 Oct 2024 11:29:58 +0530
Message-Id: <20241025055959.2152585-1-sk.anirban@intel.com>
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

From: Sk Anirban <sk.anirban@intel.com>

Implement test cpg-basic to validate coarse power gating status
after S3 cycle.
Add test cpg-gt-toggle to check if GT coarse power gating is up when
forcewake is acquired and down when released.

v2: Address cosmetic review comments (Riana)
    Fix suspend state (Riana)
    Add exit handler for test cpg-gt-toggle (Riana)

v3: Address cosmetic review comments (Riana)
    Fix commit message & test name (Konieczny)

v4: Address cosmetic review comments (Riana)

v5: Remove unnecessary openings and assertions of gt directories (Riana)

Sk Anirban (1):
  tests/intel/xe_pm_residency: Add GT coarse power gating validation

 tests/intel/xe_pm_residency.c | 80 +++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

-- 
2.34.1

