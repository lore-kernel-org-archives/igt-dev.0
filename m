Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49765CA0FED
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 12:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E866710E0CD;
	Fri,  5 Sep 2025 12:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifTYbj8N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6273410EB9C
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 12:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757075992; x=1788611992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bAunf4Kf8kl86f+mfjryxJNdsu6dmkSKtfPNnkZm90M=;
 b=ifTYbj8NhFcJEtGPsIp9H+9Pn46fZod8OtKQnz8kZG7fNkJXPDdloFfG
 lMvjE/bZU6/fTIxww4he+UWMjsXx7bnm0jOOjZf+J3zVIU3Ry7yDgr0c3
 y3gkqdjEO+LMSxRUc0XNrtxdO7EEsqMhQ6R7PXhJlPRwrer1510MOY2NJ
 7/D55PiIv8DreBtUl1X1KgKoEpek7ql0E4XDNQiHv+90PdWogIl/AnVUk
 7zCo8qp/7+M3zkOpRwgfNVeh9qnANVRvz6Rqg98s6e2iH5Dg8dyp22HGT
 vO8dGVNowfy8/kgVjLS/rk6Ux2/cnm5mn77YcBAtsDtWXma3gjnxkgr7f g==;
X-CSE-ConnectionGUID: 7HDD5CqzSDSCVDoDyxG+wQ==
X-CSE-MsgGUID: 0ipC75nRRiagVGgjir8G+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59492799"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59492799"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 05:39:52 -0700
X-CSE-ConnectionGUID: lkVH9p6aTUuIT2o29xoPwA==
X-CSE-MsgGUID: VmJf5P63QzC6MgvAhBZZJg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.226])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 05:39:50 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v7 3/6] docs: change cross-building.txt to .md
Date: Fri,  5 Sep 2025 14:39:24 +0200
Message-ID: <20250905123928.130927-4-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905123928.130927-1-pawel.sikora@intel.com>
References: <20250905123928.130927-1-pawel.sikora@intel.com>
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

This commit is to move cross-building.txt
to cross-building.md in order to be properly
processed by the mkdocs documentation tool.

This commit moves cross-building.txt to
cross-building.md in order to be properly
processed by the MkDocs documentation tool.

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

