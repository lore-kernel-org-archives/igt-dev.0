Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DBDD3A678
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 18:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34A810E6BC;
	Tue, 29 Oct 2024 18:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PiMqaEF6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A48F10E6BC
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 18:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730226186; x=1761762186;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VAmGlG+Rj+s9JeRrosd7I9m8EWNG7+RM/f3ffUCxskg=;
 b=PiMqaEF6Hl/HbCBuPlt7Nqr/q3dKrJgB9SV49AHGsSmm+OaF7vV94MM3
 +t9vSNyNdNrlOSewMLBAsIlE5r+7PVZRYTuviAUpxwod0tNYV5XJ7ke1m
 FLE5enZH/DbKrwWUHZFSVXk3NlaPj+9JFvKmJk+9Vfx714z2JtzlFz1c6
 mhD1+tVOw0BbdDZOy7+oFaw+7JNaZe/2tSBhrEYctYM2lVn3s5sXmWB8L
 c0TVNjHCqN6wNsdHMo/uxnvWOFnFJQyevblQlligUcpg2cXZ4fURwLswz
 Xxskdp45MOAyh+Be5ObpnBUuxk/jGMN0ob6CsBJllVj1cUfapNmA2BFkm Q==;
X-CSE-ConnectionGUID: 0+d8rlwdSgS1cwVFiArcxw==
X-CSE-MsgGUID: EKmw3GYKTKOZMHuThsBmJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="17524547"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="17524547"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 11:23:06 -0700
X-CSE-ConnectionGUID: f8T1V8KwQsu+SWQCQ3YkgQ==
X-CSE-MsgGUID: tNzNYKfER82DqbxCVP0snw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="86604328"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.27])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 11:23:04 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 0/2] Ignore more warns in xe_wedged tests
Date: Tue, 29 Oct 2024 19:22:57 +0100
Message-ID: <20241029182259.125117-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It turns out that there are more drm warnings which should be ignored
by igt_runner. Tests succeeds but later on when generating results
runner turns it into a failure.

v2: corrected and added more regex-es, move '|' to begin of split
  strings for better reading, corrected name in Cc and added r-b

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  tests/intel/xe_wedged: Ignore more dmesg warnings
  HAX/DO_NOT_MERGE: xe-fast-feedback: test xe_wedged

 tests/intel-ci/xe-fast-feedback.testlist | 4 ++++
 tests/intel/xe_wedged.c                  | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.47.0

