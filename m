Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58CEC4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E84310E600;
	Thu, 15 Feb 2024 10:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPcpwF0f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC6510E5A9
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992852; x=1739528852;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=EL7ylhLPb+xKttOZIY25nrPlyu+nMU5f9gTOYliVWxg=;
 b=FPcpwF0fsj30f4DAs/J5Jk1SkIj1iqAPP8ZfE6HlU3R6+tn43oTLwJft
 VrAZcGQK4LZXnZmNOp91D5x0o3pkUpYH6NVlHvU3kK9feahvdXNJw7m5j
 L9uyc/kt73ZrvHNEWjEqc1y1jCf5CQPqVOpbnzxvFHud4avWCW7iJfedg
 sWxQMDF3xpmJZZgdyJp5uLIYSouNLayL048qfdtVbLysYr18fxNwImpfM
 ZCyAMZxWJmfq2JnivFwsJBJWo+W8RR0OO2egrNfuB3D7jYm794B8GLq2F
 nVCpcYb7QwP3aHR5aKAd/rA2M7PeJ1Fs/r0zsHSE56FL2P0ZnZoBPLeWa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5038595"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5038595"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3480345"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E7EFC580E4B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:30 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JB1-33yQ for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 01/17] scripts/code_cov_parse_info: Silent some messages by
 default
Date: Thu, 15 Feb 2024 11:27:10 +0100
Message-ID: <e6fde2df69389d12b511081291843f941816d8f1.1707992666.git.mchehab@kernel.org>
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

Those aren't really needed on normal output.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 72a1e8c2b0ad..1498bd09cdba 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -1030,7 +1030,7 @@ if ($has_filter) {
 }
 
 my $ntests=scalar(%test_names);
-printf "Number of tests: %d\n", $ntests if ($ntests > 1);
+printf "Number of tests: %d\n", $ntests if ($stat && $ntests > 1);
 
 if ($show_files) {
 	for my $f(sort keys %used_source) {
-- 
2.43.0

