Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B34ECA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 08:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFD410E36D;
	Wed, 10 Sep 2025 08:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yp2Mi6WG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F4510E8A2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 08:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757494466; x=1789030466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q3xUdqYDk3i4nqMChwo5cv6aCrFQWlqrqaynNb6Opu8=;
 b=Yp2Mi6WGJ0d7geuapXMJZnm0ujNSc2JZ6mVfyjCaZKfenk00rbFdo7C+
 V5xynzir8lfuNfkj0+bdqCuMuWVa5rkCQ5DDm5fR6Jc5O9hHKnxc5+isy
 sEruj6mLd8PzwV6fkjYEgn2o19QW+qycB2m6qknSD7tyZ9O1eiM2UL+oq
 Y7v6FvoUzY4PZhTq5zesuaxe7dELZj+uChmEpfUNRDvAW1VR1H1DZo0Ug
 1jrfiVNWRua+HAHLG69UIa9UeVAQx/BuABfQgsym2ihXaHrgT8j/0BxlL
 POCKYQMMVNdljkRyJ40yc4SPy60uW2Xf/0aXYV2DbEb3fBThIB69sRJPl w==;
X-CSE-ConnectionGUID: j9Pp+iZMRg69StKmW8TpKg==
X-CSE-MsgGUID: hvDsmpJ9QQqpzteAkCzQAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77252083"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="77252083"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:54:15 -0700
X-CSE-ConnectionGUID: eU+1yVgYR9yACUF+Bd2qPQ==
X-CSE-MsgGUID: Ss+EF7fST8u9OOZXHE63Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="178536664"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 01:54:14 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/4] tests/intel/kms_draw_crc: limit formats in
 simulation env
Date: Wed, 10 Sep 2025 14:30:56 +0530
Message-Id: <20250910090059.351698-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250910090059.351698-1-swati2.sharma@intel.com>
References: <20250910090059.351698-1-swati2.sharma@intel.com>
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

Exhaustive format testing in simulation provides no added
value and only increases runtime. Restrict execution to a
single format to keep runs efficient.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_draw_crc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index f172c8d6c..4877e757c 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -359,6 +359,13 @@ igt_main
 						      modifier_str(modifier_idx))
 						draw_method_subtest(method, format_idx,
 								    modifier);
+					/*
+					 * In simulation env, limit test runtime by checking
+					 * only first supported format instead of iterating
+					 * all formats.
+					 */
+					if (igt_run_in_simulation())
+						break;
 				}
 			}
 			if (!found_supported_format)
-- 
2.25.1

