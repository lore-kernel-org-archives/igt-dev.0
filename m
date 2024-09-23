Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1A1CF9C5B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 07:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1182E10E39F;
	Mon, 23 Sep 2024 07:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZy/gvCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7645410E3A0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 07:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727077616; x=1758613616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cBzO2GKZC896UeR86mfJ+ikRvVAqIr1l3epnogVlaxI=;
 b=QZy/gvCCkK5uzeqtH05V5S4pA89c02+jINtxjKKd+ViO3SfYfdNh5+te
 Q7ol65XIMGHPDBPwAuS5FIig4Sv5/aNaBuoQ3/zQOiqKtXBmmJCYQ6Jm5
 dBWc2gAAqAys2rjhVjgOgGRaHlC8BQze03TVw3ZLGPkfpFNk1dudH1NX/
 aJ8U2INhO3laYtqTyErlbPCkTYNI8bK+HJ1232F+S5KRRG/SYjf51e4Dh
 FjjwL3bpCnaa/J2lKaWtE2N6T0l2iAqWEGgupvTPpLMRKKR44hipRJvNA
 vMDConzDsnViPUTHStGBWuvdgVob7uDCt3Hj/DXYC1RSlivXxc1aVdAFR A==;
X-CSE-ConnectionGUID: uDTGmaKkRHWN0vX1Oopk5A==
X-CSE-MsgGUID: hi0vj0MXRmikhKPnQ3biHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26166217"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="26166217"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:46:56 -0700
X-CSE-ConnectionGUID: pZlGiCvqSieMDtIvI0NESg==
X-CSE-MsgGUID: +d0SYpY5TOegLRPZGMgSeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="75541830"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.246.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:46:55 -0700
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 2/2] lib/gpgpu_shader: Decrease maximal number of
 threads to satisfy Xe2
Date: Mon, 23 Sep 2024 09:46:40 +0200
Message-Id: <20240923074640.13141-2-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923074640.13141-1-dominik.grzegorzek@intel.com>
References: <20240923074640.13141-1-dominik.grzegorzek@intel.com>
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

Since xe2 there was a change in CFE_STATE instruction format.
Field describing maximal number of threads now has type of u16,
not u16-1 as it used to have, however upper bound of the valid range
has not changed and it is 2^16 - 1 as it used to be. So, to not introduce
conditional code, decrease maximal number of threads across all
generations (anyway the value exceeds devices capability).

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/gpgpu_shader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 6d8c7ebb8..e20aa4535 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -25,7 +25,7 @@ struct label_entry {
 #define PAGE_SIZE 4096
 #define BATCH_STATE_SPLIT 2048
 /* VFE STATE params */
-#define THREADS (1 << 16) /* max value */
+#define THREADS ((1 << 16) - 1) /* max value since Xe2 */
 #define GEN8_GPGPU_URB_ENTRIES 1
 #define GPGPU_URB_SIZE 0
 #define GPGPU_CURBE_SIZE 0
-- 
2.34.1

