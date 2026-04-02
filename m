Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51722D3941E
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 13:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B6110F199;
	Thu,  2 Apr 2026 13:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TU2UPmj4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7736910E40B
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 13:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775135265; x=1806671265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uqKrRfN/cwppYEtU0EojbzyRw8KucIQ8lp+7a8Vyg3U=;
 b=TU2UPmj4vsKTgbm5aIcl22+5cpMN2rUujSETOVMX7K+BViRWZ3o3CEHH
 CiayVbcUvugQ/y51xnn6RXWeU0JuCvsWaBx4CbNFJB6geD9Wg3Agx1IbP
 PWQNV9nU+0hU1j8d457IvmSkmeEkK9MJNUJ5Qfq46sMbW5+2At9TlcvDO
 tgt+tME5jP/3hYRcjFMRZe1+ge7COmweJIs2QSnjGWQNMHOF8fbXB5XHw
 IQSnXzfSp1qhNrYD4qCyntbLfAhSSpajTP3lRO/wIkDhOHIq6+nShd+aG
 jN8ZZp1SRZ5qFkZcRRX/xlV+x5de1Zox3loID4qJSPR5Tp5mjjA+sOP/Y w==;
X-CSE-ConnectionGUID: YaAijwE+SM6n8uzlL0HXfg==
X-CSE-MsgGUID: PPX5Jp0nRLCshep3NkoXbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93584993"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="93584993"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:07:44 -0700
X-CSE-ConnectionGUID: EpZlLyTkSuig+37egf4DJw==
X-CSE-MsgGUID: p5RbzxMXQH+J/6ddxM5rlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222119748"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:07:42 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t 3/3] HAX: Add gt-c6-idle test to
 xe-fast-feedback.testlist
Date: Thu,  2 Apr 2026 18:30:26 +0530
Message-Id: <20260402130026.2687520-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402130026.2687520-1-soham.purkait@intel.com>
References: <20260402130026.2687520-1-soham.purkait@intel.com>
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

Add gt-c6-idle test to xe-fast-feedback.testlist

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index acff025fa..be41e438b 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -163,6 +163,7 @@ igt@xe_mmap@cpu-caching
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
+igt@xe_pmu@gt-c6-idle
 igt@xe_pm_residency@gt-c6-on-idle
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
-- 
2.34.1

