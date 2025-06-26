Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0D3C7EE33
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 20:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54EA10E154;
	Thu, 26 Jun 2025 20:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKkuTdxS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5724610E154
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 20:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750970101; x=1782506101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fh5Ts4awp9e5TbvYoiJSMlaQHRO6PZQuiSY4N6FEfKc=;
 b=TKkuTdxSG+kMSqYOK2ac7dycLbb/XSnH58ixNLreUjopHBIQWn0Y3JJK
 6MtXqBUK2/vZbRnj8X1OdBCNDarHAFzMSxk3RST35oo76y88LfjwzH/FA
 7s+OzwiyXbPiptFkjDGCSCzUnbv/efZi0Ec3gkr53QOQIWPF87jJs6KZA
 WLZQsET8tkO7DlXZ/0PO4sf4zm03sKf8/We+jyiV5ihfInF+XxLuQku3/
 ZNVMs7Dwxsor5Bd4fFroaF2mpiCXJTWP+W2BoswsqTGEnh9lr3ozuPomC
 rs21izhjZW4NRpkdOI56Lwn+bsqzvky3jGQ+qbjs8FaFStGgmKEWDZGWE Q==;
X-CSE-ConnectionGUID: CwgNtC/jReWZyzRdHnkkyQ==
X-CSE-MsgGUID: ATaAn5IxQT+SX4/0XtiKQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63537807"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="63537807"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:35:01 -0700
X-CSE-ConnectionGUID: roHjEoENR4et4WOunEPcIg==
X-CSE-MsgGUID: 6F7lSnURSaCJwrGuTnIv5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="158353709"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:35:00 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH i-g-t] runner/settings: Fix while loop
Date: Thu, 26 Jun 2025 22:34:00 +0200
Message-ID: <20250626203400.114823-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Passing a large argument to the --hook option caused igt_runner to
crash.  Valgrind identified an issue in read_hook_strs_from_file(),
which this patch addresses.

A typo in parenthesis placement caused the assignment of 0 or 1 to
line_length, not the actual line length, because != -1 was evaluated
before assignment.

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 runner/settings.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/runner/settings.c b/runner/settings.c
index a7d5dbc97..4bd925934 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1458,7 +1458,7 @@ static bool read_hook_strs_from_file(struct igt_vec *hook_strs, FILE *f)
 
 	buf = malloc(buf_capacity);
 
-	while ((line_length = getline(&line, &line_size, f) != -1)) {
+	while ((line_length = getline(&line, &line_size, f)) != -1) {
 		char *s = line;
 
 		if (buf_len == 0) {
-- 
2.43.0

