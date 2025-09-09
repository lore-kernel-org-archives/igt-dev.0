Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF51FCA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 11:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0FC10E6AC;
	Tue,  9 Sep 2025 11:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i11UC/dm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D81510E6AC
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 11:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757417283; x=1788953283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K1EcKWy+ORwBPziYz/4w1gJBjz6nh0eiFW9eaD2rsDw=;
 b=i11UC/dmpjORtkCslg4cqRrRMWkx3Jhq/UZ+We3TyVLSk80iiovAwK+Y
 E60VXubK7V51dUDCLSbF4RnWwYz5aTZHba/3e2oMnqXI8Cl6RMNG1OsHS
 YFi20yZNtFh5hHCanoNbNYBE7FIJf/LolNCE5Sx8prw5DBX5MQm+rw8cp
 ClTVYNBL5KSYJDMyFjusDDe6lo8EM4rtQJdeqOcz8uHSITufUgtImRPZb
 t5Yg+LWc05fL9hy0hzZyK47V8Mzi3Jk0qs+cPv5HfVEkxjjHnbsypaz12
 lk4cHg+z6O2DqgDEuKzM+rAoP1pmizes7okbs5MgtA0ryvvKhfKnnXkwY w==;
X-CSE-ConnectionGUID: MFTss43bRZCpbXxlAGUrzw==
X-CSE-MsgGUID: RkdE9Z00QJqTf29NXbzACg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59844185"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59844185"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 04:28:02 -0700
X-CSE-ConnectionGUID: 6afZFmByRXqlgBzamabmoQ==
X-CSE-MsgGUID: 8a/qWrfCS/6Zsa9yXbjEgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="196731263"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.129])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 04:28:01 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v10 3/5] docs: rename cross-building.txt to .md
Date: Tue,  9 Sep 2025 13:27:38 +0200
Message-ID: <20250909112741.185825-4-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909112741.185825-1-pawel.sikora@intel.com>
References: <20250909112741.185825-1-pawel.sikora@intel.com>
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

Rename cross-building.txt to cross-building.md
in order to be properly processed by the mkdocs
documentation tool.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 docs/{cross-building.txt => cross-building.md} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename docs/{cross-building.txt => cross-building.md} (100%)

diff --git a/docs/cross-building.txt b/docs/cross-building.md
similarity index 100%
rename from docs/cross-building.txt
rename to docs/cross-building.md
-- 
2.51.0

