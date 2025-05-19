Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C66FC3ABD8
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 11:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221AC10E369;
	Mon, 19 May 2025 11:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAZMNLUA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C770010E351
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 11:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747654172; x=1779190172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nKQ5ovgS7RbGAju2oNymGFYDANKm/ifECWoHJTRKQI4=;
 b=OAZMNLUArLtDKsq8ZVO0tF8KNbEqI4muqfCdhkYdCvKaZ/jKFMFhcTH1
 0GDB7tnCnVObHW8ex2Z0bBIy7jnY8QDcJYrsUDwmkZCTH6kTNPWTqQ78B
 Em6ZT10+KjXR11wXwUnKwAgbMrVaDRV+ND92vCR3gfZ37y8zjrrdXL33R
 rlN95TAtOi6lcWLkOom6gtoAC2HedcBqK18V+lRGwbez1mV/3xYpmWlWU
 kQx38jusmAfw9JeN7C6mVS+FPjgrVaxGbBies0ibJ3wkvjGAGO5jV4/R1
 zpHgGg7NPmjaGc+gJBTWnenUR6QtnvbiR3tuyojJX1cmIBMHyk6lbNGrw A==;
X-CSE-ConnectionGUID: aMnf8FnjRDK4DAZJhTdPug==
X-CSE-MsgGUID: Y9HRoSlARw22fQU4/iRCiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="53347310"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="53347310"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 04:29:32 -0700
X-CSE-ConnectionGUID: PrMhL1ydRHOjinJmKorVDw==
X-CSE-MsgGUID: 1dphhU9qRsuEkVW8E+d3cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139385806"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 04:29:31 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH i-g-t v2 3/8] lib/igt_nouveau: fixup print/scan formatting for
 files in lib
Date: Mon, 19 May 2025 11:30:05 +0000
Message-Id: <20250519113010.125751-4-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519113010.125751-1-jan.sokolowski@intel.com>
References: <20250519113010.125751-1-jan.sokolowski@intel.com>
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
of print/scan formatting warnings.

Fix formatting by using proper formatters, eg. PRIx64.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
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

