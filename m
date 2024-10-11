Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F596D2447F
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 06:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C3710EA3C;
	Fri, 11 Oct 2024 06:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KXgbNcLp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E258210EA3C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 06:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728627612; x=1760163612;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tic1GZkPciuHCWB3tqJibisHJnndXDJdROwMKUp8QOo=;
 b=KXgbNcLpTa6y3gVz7m7bD2op7DDv75lQwL8Eo6RMrCcesl5a/IwikEdN
 ft/jbWJ7rzyOt1WFGE1gGOt0lfyskNoZMXTTM2j5y+Zahn6mY2YFVOx3K
 23a1ldIG4jgydUS8t43zX4ACMW+Xh3MfxFERnX2reIU1ZnkQM0nr1YY9B
 TpOKEMUgR6vVBwAq6ZjfkBzPri6yMQyyu0o3X0vLJMNDSZrf9jwxaO3nl
 mVTtI4zMA+CRYUbGTkX/BbyqFBsaHx0evS8Us1CATIdmWHSl3EuTrJ0gr
 e2br7gEtsmkt1l9lKqaWQcjLnnGgEJpMIJZYNcyGK1Pk2LKGIhKxsYxjb g==;
X-CSE-ConnectionGUID: iwI5tbJzQD64zn8KMcPvCQ==
X-CSE-MsgGUID: owwmPGW4QviZVHz2bNSdHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27890327"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="27890327"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 23:20:12 -0700
X-CSE-ConnectionGUID: ydqB5ajASju9Va+HpnpBow==
X-CSE-MsgGUID: xANBuyP1RA+RVROVlP3qzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="77023425"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa006.jf.intel.com with ESMTP; 10 Oct 2024 23:20:10 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, bhanuprakash.modem@intel.com,
 ankit.k.nautiyal@intel.com
Subject: [PATCH v1] tests/kms_flip: Assert with twice of frame time while
 waiting fro vblank
Date: Fri, 11 Oct 2024 11:51:46 +0530
Message-ID: <20241011062147.1956995-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.46.0
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

Instead of hardcoding to 500us, wait for twice of mode frame time while
waiting for vblank. Motivation of this change is to remove hard coding
of 500us, which comes out to be more stringent and ambiguous vs changing
modeline.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 tests/kms_flip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index cbabbe74f..decffa961 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -921,7 +921,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 					    0, &reply));
 		end = gettime_us();
 		igt_debug("Vblank took %luus\n", end - start);
-		igt_assert(end - start < 500);
+		igt_assert(end - start < 2 * mode_frame_time(o));
 		if (reply.sequence != exp_seq) {
 			igt_debug("unexpected vblank seq %u, should be %u\n",
 				  reply.sequence, exp_seq);
-- 
2.46.0

