Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C73C5B572
	for <igt-dev@archiver.kernel.org>; Sun, 16 Aug 2026 18:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B69110E0B7;
	Sun, 16 Aug 2026 18:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bSMRmIid";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A7D10E0B7
 for <igt-dev@lists.freedesktop.org>; Sun, 16 Aug 2026 18:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786903766; x=1818439766;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nGuw4+gthlyHiVau4iMDaLTUkvnky5oynD9PvB1E5AU=;
 b=bSMRmIidzJEi62DIZHjjRRuPuz2g6GbGBnNc/Uc/GxKrJkOj487AS2Jv
 Xia0wGe/hVWko7NqOiNYMLKb5nH0cwAfvSBmHwyN9fXshpOKvKSTLh6Jo
 yvQL6HSQWt/wkOnIfiM24S2gzqZBGIH53frrNzDKz6FTalyIQIYNs10NL
 VcEv2xQqlmDCu77gP+bJYL9rs2SMmAwRDAga3wTDwpSrRkzgi5E7yA7aO
 iDCsSsJGQ+wAsdcKV62aTStRGzEEkr6qej8x63IKMb6wZLY1pGUPIkp1t
 N/dYyrM1LEOYOXhj8c5LiYgHXttQi/KO5jRhtYGnU8PsTUsfuNj2xDOTs w==;
X-CSE-ConnectionGUID: 6NOckeyATua2ua5Wm5fPJQ==
X-CSE-MsgGUID: nPMNKCJjSVKRJsL3JdFdBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87313285"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="87313285"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 11:09:25 -0700
X-CSE-ConnectionGUID: bVO9AB4+Rh2hiyxRpdN7xw==
X-CSE-MsgGUID: NMQTWFifTPa2ZNBbNS/eYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="269909692"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 11:09:23 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/1] tests/intel/xe_exec_capture: Add coredump decode
 validation subtests
Date: Sun, 16 Aug 2026 20:09:05 +0200
Message-ID: <20260816180906.884247-1-jan.maslak@intel.com>
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

This series adds coredump decode validation subtests to xe_exec_capture.

The tests create dumpable VM buffers with deterministic contents, trigger an
engine hang, and validate every ASCII85 blob in the resulting devcoredump.
The large variant exercises coredump chunking and the legacy rendering limit.

Jan Maslak (1):
  tests/intel/xe_exec_capture: Add coredump decode validation subtests

 tests/intel/xe_exec_capture.c | 549 +++++++++++++++++++++++++++++++++-
 1 file changed, 548 insertions(+), 1 deletion(-)

-- 
2.43.0
