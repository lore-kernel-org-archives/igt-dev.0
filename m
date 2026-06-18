Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54248CD98ED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 14:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AE310E7CC;
	Thu, 18 Jun 2026 14:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPIHOf0A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF7D10F25B
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 14:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781791858; x=1813327858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0e/pegJ6gCMTQdsOYPQbEZh/8GP1gvhuK1aiDQ2BtM8=;
 b=BPIHOf0Azpu1kx4skVauqlSEfujanGqlsfoFItjjjQGwbae9k8sol1Gx
 3ZDMmSELzxmeU8FTgkCCxrNMy/T//wyuuDLb8t5SQj4mG7CRC7chUPNVE
 Fy8/uMiPonTLZLj08zHHRuNvd1/AMLpjDp2Yq66MU+X4QBS5EC09gSxM1
 iOewjFEzAs9NrPbntQVl5BESpAD2sxxwetiaBGjAxBlQijN6DoiKn8Gsw
 CHq4w0RSMlCB+6T0BDov3lkA5gvz9O5DIoZ/oDP5AG5DbkVhIUzbvqeMX
 haxQ9t7CoJtDk/GjBCt+cyDAXRVf+RqzmYFT4zCaleWbs33REWaRIKUPM g==;
X-CSE-ConnectionGUID: E3SkiYXiSve++z+YrlxKew==
X-CSE-MsgGUID: WmMr6PVSTuKAH441SdQ8qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="105428825"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="105428825"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 07:10:05 -0700
X-CSE-ConnectionGUID: sQ9hvN8qQWuckT/JOfqOCA==
X-CSE-MsgGUID: 3sISgAo4QFCu5DlI2jn+8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="248456317"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 07:10:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 2/5] lib/rand: move static inlines to proper functions
Date: Thu, 18 Jun 2026 17:09:50 +0300
Message-ID: <40a88ff11484791be04e69d648a0a09aa218f9f2.1781791747.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781791747.git.jani.nikula@intel.com>
References: <cover.1781791747.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Hide the implementation details. Gut feeling says this also allows the
compiler to do better optimizations within the compilation unit.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_rand.c | 13 +++++++++++++
 lib/igt_rand.h | 13 ++-----------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/lib/igt_rand.c b/lib/igt_rand.c
index 16a6ba9b0c65..b2856d000450 100644
--- a/lib/igt_rand.c
+++ b/lib/igt_rand.c
@@ -35,3 +35,16 @@ uint32_t hars_petruska_f54_1_random_unsafe(void)
 {
 	return hars_petruska_f54_1_random(&global);
 }
+
+void hars_petruska_f54_1_random_perturb(uint32_t xor)
+{
+	uint32_t seed = hars_petruska_f54_1_random_seed(0) ^ xor;
+	hars_petruska_f54_1_random_seed(seed);
+	hars_petruska_f54_1_random_seed(hars_petruska_f54_1_random_unsafe());
+}
+
+/* Returns: pseudo-random number in interval [0, ep_ro) */
+uint32_t hars_petruska_f54_1_random_unsafe_max(uint32_t ep_ro)
+{
+	return ((uint64_t)hars_petruska_f54_1_random_unsafe() * ep_ro) >> 32;
+}
diff --git a/lib/igt_rand.h b/lib/igt_rand.h
index 0015680461c1..d89803bb020b 100644
--- a/lib/igt_rand.h
+++ b/lib/igt_rand.h
@@ -32,17 +32,8 @@ uint64_t hars_petruska_f54_1_random64(uint32_t *s);
 uint32_t hars_petruska_f54_1_random_seed(uint32_t seed);
 uint32_t hars_petruska_f54_1_random_unsafe(void);
 
-static inline void hars_petruska_f54_1_random_perturb(uint32_t xor)
-{
-	uint32_t seed = hars_petruska_f54_1_random_seed(0) ^ xor;
-	hars_petruska_f54_1_random_seed(seed);
-	hars_petruska_f54_1_random_seed(hars_petruska_f54_1_random_unsafe());
-}
+void hars_petruska_f54_1_random_perturb(uint32_t xor);
 
-/* Returns: pseudo-random number in interval [0, ep_ro) */
-static inline uint32_t hars_petruska_f54_1_random_unsafe_max(uint32_t ep_ro)
-{
-	return ((uint64_t)hars_petruska_f54_1_random_unsafe() * ep_ro) >> 32;
-}
+uint32_t hars_petruska_f54_1_random_unsafe_max(uint32_t ep_ro);
 
 #endif /* IGT_RAND_H */
-- 
2.47.3

