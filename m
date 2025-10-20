Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E58BCCD199
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 06:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9BA10E263;
	Mon, 20 Oct 2025 06:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2FcHL+l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C4D10E263
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 06:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760942655; x=1792478655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K1EcKWy+ORwBPziYz/4w1gJBjz6nh0eiFW9eaD2rsDw=;
 b=d2FcHL+lp1xuNecIYHlw6LwU/4l1mggN+1SbpD8ItjxbCn+xSHxvTPQv
 a27A1V5C0vTg+RzA0LQtOCfzA7GtVZ0qb9fhgNd8GH6fc7X680SGVqSUh
 KNnFnGWfxkxUcx+dfJ+Tn/V11Zyr/IE4gFCpNLc/FOhJXqzEVWtbBxqBC
 ssIolKK3oL930Mg0jE8jAVIO/H8mqzLjx55jHodwazweDiuL0UIrMoefc
 FpKjVQtev6/WlqxGwLtgjsTwZ2OlXUyVFL6BI9HSrGlIggo9SMI8XjnpI
 5PdpCTCHMT+GFwgN1ChQGR3BVNofl3DQV+tWqnUR+sKzCA8xj/EASWBvb A==;
X-CSE-ConnectionGUID: Nj6oqj5lS+GnRmLSxmeg3Q==
X-CSE-MsgGUID: hdernLfNRCWePwZzOxXiyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="73659361"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="73659361"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:44:15 -0700
X-CSE-ConnectionGUID: 0xX0mhadQp+PQUXGy3jvnw==
X-CSE-MsgGUID: BJNVHdiCTjWx503fpSJVbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="188355576"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.220])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:44:14 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v11 3/6] docs: Rename cross-building.txt to .md
Date: Mon, 20 Oct 2025 08:40:47 +0200
Message-ID: <20251020064053.1050025-4-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020064053.1050025-1-pawel.sikora@intel.com>
References: <20251020064053.1050025-1-pawel.sikora@intel.com>
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

