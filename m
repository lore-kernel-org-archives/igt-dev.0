Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C29C5B555
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 11:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA44210E5CD;
	Tue,  3 Jun 2025 11:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgkNy7zO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B5910E5CD
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748949008; x=1780485008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bPXyTd95kQeB1oJpdnLChbsQXp1pai597p6gRYCsuKo=;
 b=jgkNy7zOP2/LLgGNVnbOwEbsWnbg6nrssLeNgX+HdXJ3rQ3ux2p7Qgoy
 Q5Lby8cNPslco3RsYA2xig86ly2Q4Ew2ZcHlXnREWxu/7RxUSUw2tSITI
 GRA8luC52e8+QWz037ppswifHTfRdjT01HJGVbmpnFYkakWZdSC8ItTQC
 shAyTwGiUCRSBqpaJq4UuSfBP3YsIKcogNlVfMhulr0gqJu+NSM6484if
 4Q06tDiQs8HaMEUbNfGOF2zOeWU6+KfHeLDXkF3flNJ5Cw1QEphOGYg0/
 UeT65jDlSaRg8R2efLr6+T7mKIIV1SyVj8OfHal9t6rloJQC8pPYUdMjr Q==;
X-CSE-ConnectionGUID: dfnykbfCTaGqfgrNqFk3rQ==
X-CSE-MsgGUID: mjdBGIPYQEKG6+/B6fujTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61603721"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="61603721"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 04:10:08 -0700
X-CSE-ConnectionGUID: gZ0/+NYgTDaKNoBRC/htkA==
X-CSE-MsgGUID: vR2VnxHhSdOGesMkZG7veQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149598302"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 04:10:06 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>, Lyude Paul <lyude@redhat.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 3/9] lib/igt_nouveau: fix print formatting for 32-bit
 compilation
Date: Tue,  3 Jun 2025 11:11:01 +0000
Message-Id: <20250603111107.3170529-4-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603111107.3170529-1-jan.sokolowski@intel.com>
References: <20250603111107.3170529-1-jan.sokolowski@intel.com>
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

Compiling on other architectures than x86-64 causes a lot
of print formatting warnings.

Fix formatting by using proper formatters, eg. PRIx64.

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 lib/igt_nouveau.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_nouveau.c b/lib/igt_nouveau.c
index fdf6020a3..62a53c8b1 100644
--- a/lib/igt_nouveau.c
+++ b/lib/igt_nouveau.c
@@ -96,7 +96,7 @@ uint64_t igt_nouveau_get_block_height(uint64_t modifier)
 		gob_height = 4;
 		break;
 	default:
-		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %lx\n",
+		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %" PRIx64 "\n",
 			      modifier);
 		break;
 	}
-- 
2.34.1

