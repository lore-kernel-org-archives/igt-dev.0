Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1602C3ABBC
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 07:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945DE10E9CE;
	Fri,  9 May 2025 07:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIVsTRW8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E35A10E9CE
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 07:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746776813; x=1778312813;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pkzDoGQWTEk8fCQC5OWrK0V2jIW0v3yBsBngYmLzmEw=;
 b=kIVsTRW8m6MsO542jH7XSAERBNDgZMGjnIWpebnX0gTmWz3avjypqfkX
 f4C1AEnrOGE8I0Z1YW9DpeR6WOuIErRm70pO6V+djr0DYrY0sFia1gMI7
 YCI0pF4yqhQ6mdmb2CVG/sl2gLJ56tgD8eR+lHaRdJLWuHQmwk+0wf+2R
 odyMPrJ02chqejQjDn6c7UioaK20J+n96c/p3+CHLDZvAyAJ9abHXwsyq
 wORH1512j7xfqfGAZLp+ZvdCXpG99la/KIe/0V97Dnb/IO2hR8yE+HgML
 p7ahzxIecQqEwygwErLPdr72WcAv5RGaAFrtt7qP9vGAAsohT1Rk2RE+N Q==;
X-CSE-ConnectionGUID: ejOnBML8Skqb2wYi4yqMmw==
X-CSE-MsgGUID: N+KYGCgVTqio4G1ZPtjjNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52249082"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="52249082"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:46:52 -0700
X-CSE-ConnectionGUID: tbmO5KhvQK2z076HYkwiQw==
X-CSE-MsgGUID: o4JSIsMQT1+ix4yKtYpmig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="136931743"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.131])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:46:50 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 0/2] Width/pitch in spinner mem-copy
Date: Fri,  9 May 2025 09:46:43 +0200
Message-ID: <20250509074645.56169-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

Apart of these two patches I'm going to change intel_blt mem-copy
to protect from passing to high width/pitch but this will be send
later.

Zbigniew Kempczyński (2):
  lib/xe_spin: limit width/pitch for mem-copy
  tests/xe_render_copy: change width and pitch to be in valid range

 lib/xe/xe_spin.c             | 33 +++++++++++++++++++++++++++++----
 tests/intel/xe_render_copy.c |  6 +++---
 2 files changed, 32 insertions(+), 7 deletions(-)

-- 
2.43.0

