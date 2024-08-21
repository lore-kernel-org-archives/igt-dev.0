Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F3EC52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 09:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7491810E5C7;
	Wed, 21 Aug 2024 09:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXpGqoY3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E60A10E5C2
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 09:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724233906; x=1755769906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ygzCGOuX5fJ8R2SpwB+Jd6I5MSY2MvD4n+YET7F6BcY=;
 b=UXpGqoY3PK6YJEVizZJ2TY7qsF8cYIrt51qEInG2Yhc1Xxf0UMaZU3eA
 Q98nvtobFC/OO1dOU4pwg2dXZNFeC6OI/dU/pYYNf8k61sAEgCJNfuA3S
 NtE0V7lE07lq6MP4E7y/IksDoEKuAgaH3SbbOlOlnTyA0N4N338rF0b1O
 bPUU5CaoNtSzNswykfuDJ9wTzVA27NaNuoB6ApNY80MRGkDdhwAMnGSad
 6DFnFX7tzAFjqaLI46fn/tD+n3kkdvdGen+LSz1Mgm5I8Mnr1TIw/xsu6
 ikToDXKoHPD2H5z97j4FAGQv8AjJ/2D/odResHhrWw2upZ1+eX6m6fJWv w==;
X-CSE-ConnectionGUID: 86K1ROGlQUiTOteLwiD6Cg==
X-CSE-MsgGUID: 59evbzYeTcqWoSPNw4r3cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33245218"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33245218"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 02:51:45 -0700
X-CSE-ConnectionGUID: 4dpAVQmNQfu0ONtIPI7xDw==
X-CSE-MsgGUID: z6Iex+soTWGp8djdOb3kaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65390595"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.207])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 02:51:44 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 0/1] Fix compilation for musl in
 intel/kms_pm_backlight
Date: Wed, 21 Aug 2024 11:51:36 +0200
Message-ID: <20240821095137.60254-1-kamil.konieczny@linux.intel.com>
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

It was reported by Yuka that there is missing POSIX header.

Also while at this I sorted out other headers.

Kamil Konieczny (1):
  tests/intel/kms_pm_backlight: Fixed build on musl

 tests/intel/kms_pm_backlight.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.43.0

