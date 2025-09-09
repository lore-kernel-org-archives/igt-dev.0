Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D947CA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 08:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC57310E2BA;
	Tue,  9 Sep 2025 08:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNNqJ3Zq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7FB10E2BA
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 08:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757407378; x=1788943378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K1EcKWy+ORwBPziYz/4w1gJBjz6nh0eiFW9eaD2rsDw=;
 b=QNNqJ3ZqlRAm2SfJb8LLuhpss5sIfu8od1VE7XhMwE2Nk0wtehzGedAx
 OxPrHdXr8WslXFWr3bsbIT+v571joWdBr0q3epACgGI40JkhwgzWXXKTD
 5V1NeXalvO7bKGReaPWQZgxqOHjQxjzl9k469TIuaTnaBfSN9SdU9RcY9
 fX0sjeSoDXTkftf9o/SmKQnokWzx71ITIlbQRcrTI3DkwhC5DXnN9TfGD
 0Bvdtamz1gwMJ8h/hmpc5w9PLUfwpFw1wASS48Mfe9rmL5Ja+Uh6XX28F
 lzMLIU3XynL2lmsTMUs7KQp/L3cqTT0bCye0So3hKpEj2XX0U/TGf9Zwv A==;
X-CSE-ConnectionGUID: 8zGgW5GrQf6PSc7+q+NoKw==
X-CSE-MsgGUID: bdQ9jmc5Qb6H6fmNHq8nHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59377670"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="59377670"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:42:58 -0700
X-CSE-ConnectionGUID: frpZlWcfSiu81ebb74we7g==
X-CSE-MsgGUID: qDQ9pw1gQbuk0+WN6oKCqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="172900256"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.129])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:42:56 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v9 3/5] docs: rename cross-building.txt to .md
Date: Tue,  9 Sep 2025 10:42:29 +0200
Message-ID: <20250909084233.183885-4-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909084233.183885-1-pawel.sikora@intel.com>
References: <20250909084233.183885-1-pawel.sikora@intel.com>
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

