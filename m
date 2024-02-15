Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D79C48BF3
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B9110E5ED;
	Thu, 15 Feb 2024 10:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPiCq9LA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAF710E5A9
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992852; x=1739528852;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=pwxBW38Dz61drowRnrscFWuU3y9+OubUSCQt2NdBb+w=;
 b=FPiCq9LAticfQ2LiaqK54aFHKRJbt59gryxtTEo7XqLGvyTx47pgnugG
 gi0UEsbRoWOBNGFsy8CCWoKbi52l7fAAOp2dTkca6U1qDGYn1s6gfkUbZ
 TDNiuQaMQ4WA+oAcssRW9+O7kzlwrB3914PwppdcHI9y4iYKe34GYKlFl
 dkApFt8qdQBJm6sD7h9t4Fn10ZzcLK3Wkl/Rxh48nTncLzShaCMHOXzOT
 RmXBt/g7RRmatWdY8CQ+7vX0Z+z9835aeM+e2fr60yAQR7FhTPs6JGTNd
 NcwaC1B4hTrZHvjdmLvgF8eezM5iBuiUheo/TpuBnNISF/LbYDed7A4vJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2199368"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2199368"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="40981605"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 01F5B580E3A
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:31 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JBx-41Hm for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 17/17] scripts/code_cov_parse_info: better check if source
 file exists
Date: Thu, 15 Feb 2024 11:27:26 +0100
Message-ID: <f18d9f5eae070b935c8e07c65dc51631a41ce195.1707992666.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707992666.git.mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Not sure why, but opening a non-exisiting file is not returning
an error. Well, let's add another check to cover troubles, by
identifying if no lines were filled at the cache array.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 9d043a987f44..d133ef1a18d4 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -614,6 +614,7 @@ sub read_info($)
 					close IN;
 				}
 				my $nlines = scalar(@{$cached{$source}});
+				die "File $source_dir/$source not found or it is empty. Can't filter branches\n" if (!$nlines);
 				if ($ln > $nlines) {
 					die "$source:$ln line is bigger than the number of lines at the file ($nlines lines)\n";
 					return;
-- 
2.43.0

