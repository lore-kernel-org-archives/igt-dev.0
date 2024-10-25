Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1998D149CD
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 17:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7657410EB29;
	Fri, 25 Oct 2024 17:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZSJkCaK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4B310EB28
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 17:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729876373; x=1761412373;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OsLAn9Yijbo3a1pB19Uw2a95JulLSZq0xmZDC/HpJqI=;
 b=YZSJkCaKWJB5fU9c1Xeo1gedVeMGuFYdb2vwLuGxB5q+MwciSIuZTpZD
 m+mtA+J/lrx5yp2Nl6M7mwKbp+GWgsMu0F0KmMWNS5a7rvS40jNrn0w8Z
 gKowkgAIhJkaiMnSktCj21wgyyFZTYPJBP3NUOMGel+L/kRItA35aUxxm
 fNl6drWddFcSqA2qdO4xdy1BrF0UQg30Ot8Cb45Oof/z30HiDDPINZIzJ
 a7JkJnq1qKeQ/nJy8Z6or2SuXfFEaJ0cizvOeF87tWuNgTELsjLDPmzdo
 HzqIBmmuhzjNvaj+Ng8T9kU2ghL5QOy/w2rVICoWFDpFMsEET8A94Vusf g==;
X-CSE-ConnectionGUID: 7pNinKnrRKOS4RkhQrwLJg==
X-CSE-MsgGUID: iie+uRRVSIKL928bl6shvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33461165"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="33461165"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 10:12:53 -0700
X-CSE-ConnectionGUID: oTZQ0yDcR82CgzI+vuET4A==
X-CSE-MsgGUID: CK8vST+GR7+xRJQ4kKO7cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="80893618"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.153])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 10:12:51 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan-Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v1 0/2] Ignore more warns in xe_wedged tests
Date: Fri, 25 Oct 2024 19:12:38 +0200
Message-ID: <20241025171240.114267-1-kamil.konieczny@linux.intel.com>
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

Cc: Jonathan-Cavitt <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  tests/intel/xe_wedged: Ignore more dmesg warnings
  HAX/DO_NOT_MERGE: xe-fast-feedback: test xe_wedged

 tests/intel-ci/xe-fast-feedback.testlist | 4 ++++
 tests/intel/xe_wedged.c                  | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.47.0

