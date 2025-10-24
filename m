Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADBDCCD1AB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 08:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663A610E0DB;
	Fri, 24 Oct 2025 08:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhexD0Sy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA41710E1A8
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 08:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761294419; x=1792830419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K1EcKWy+ORwBPziYz/4w1gJBjz6nh0eiFW9eaD2rsDw=;
 b=bhexD0Sy+sG9AZLBeTgbJiahlQNjYePDhT7mZtC9L8rH8E+Iz2nQS4/P
 pRI6tmquRH6YsaO59OFlPpnyviQQtKlSoH4yNY9THGRHf+vDWQuDjcCBy
 L5CA0X+9cJKOT+vr9iRF+06OZWbEtgsNBnW5nm9uto9ZW36DTVnMS6nHm
 tTmaMb4/BWs+yedub5YZWl/5ImpIozOQyin1tjSurc+NjOu7MgdnT8RKW
 97KBPOy4yKflEUkoDpCymVmhp+gJx7I3ydG5t6z1K+WKVeDGwJt+6JpyH
 YuqmhWvM1e4y5dv717J4jEFwr4jm2FLUn70gYxcD/uaxCGS6MH8xI8+Bg Q==;
X-CSE-ConnectionGUID: Wmgu76IGRkK9BhKuL4r2jg==
X-CSE-MsgGUID: q/drCj+WTJWhl6PLQ0osCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67340512"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="67340512"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:26:54 -0700
X-CSE-ConnectionGUID: KlRrXjAqTxqtB5VgcnVf0Q==
X-CSE-MsgGUID: ZlbWeR63RA+t/J3vRfFJEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="188438755"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.85])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:26:53 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v12 3/6] docs: Rename cross-building.txt to .md
Date: Fri, 24 Oct 2025 10:26:22 +0200
Message-ID: <20251024082628.1118783-4-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024082628.1118783-1-pawel.sikora@intel.com>
References: <20251024082628.1118783-1-pawel.sikora@intel.com>
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

