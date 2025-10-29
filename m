Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCF4CCF9EB
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 14:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FEF10E7B9;
	Wed, 29 Oct 2025 14:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaDlLEiy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595A210E7B9
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 14:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761747606; x=1793283606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K1EcKWy+ORwBPziYz/4w1gJBjz6nh0eiFW9eaD2rsDw=;
 b=BaDlLEiy5Z9DgfFf92s68oEeJRlc/U2Ze3Bt7YlQ+8Qrfl/2ggmHSgi7
 dq8z7iAWxC6CJmpf5r52rwwi2KHCuAnHxk2KHxNTXKUb7bcOjgkzlG0jM
 0NtqRmaLFLJ5hF1RanenN8yTVpYyAf0nZyS4aZYIDUvpfWr5oR4JQXYtI
 XjykWLq4AHP1K6Qe+xE4UvSeYKtK6DizSR5S6F8Jh8NfwqgP9wJb0MaEd
 5CwdPYQIjW/9i/Dpm2t3RRg/QT7pukWNf8vPLXEGq0RkHMFvgJKSErC9z
 NAbcVFYyQbzqiQMzm7whrxVl/Sxi9sP9oicylEBCUFqD67vY8Zfn7n2h/ A==;
X-CSE-ConnectionGUID: VHWzg5X/TYuOgLevmqdaWQ==
X-CSE-MsgGUID: 6/aZ8SWqQWSEksA36IiWbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63778652"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="63778652"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:20:06 -0700
X-CSE-ConnectionGUID: WrQBMOD4TM250HZtfJn6iQ==
X-CSE-MsgGUID: qgPJQELeTeueNgKkFCV/lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="186428611"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:20:05 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v13 3/6] docs: Rename cross-building.txt to .md
Date: Wed, 29 Oct 2025 15:19:42 +0100
Message-ID: <20251029141946.1165010-4-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029141946.1165010-1-pawel.sikora@intel.com>
References: <20251029141946.1165010-1-pawel.sikora@intel.com>
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

