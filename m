Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40939C79FB6
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 18:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21CB10E1F0;
	Wed,  9 Sep 2026 18:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZjwbKJo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE6510E1F0
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 18:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788978928; x=1820514928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u8YdBubPjDSZyDS4IiKw6MfAYwdVxvbCutyMjY4iMQo=;
 b=hZjwbKJonE3zu6B/UTLlTuvVpsmoHAD5UuDzscgeFYf1R0g+39XU+ezA
 TdhPQ+KZW9ULlCnG5IhMzWmiOfMgS6nq6JB3IRinaiEngs3yv07UmU9U1
 vG5mwiozfCGdf9YBWaR4IGoU3l8UAZ58xkUnp129zjfPc0OXEZ56hRCgv
 mtrrBdmBIh/9nT138JiZ59WmUZ71hK5x/+CHHCWPvh3GfK+1Cjsze2Rok
 gw5+pPCbzKHILMh/2fceEuIwJyJtHpx5UDpFDOljkf+odkzIpS5GNGn+v
 tZv85mGGH3cSIxp5CVbOL2VlaqPCqPaM495SODk5C7Esh3OXCeVzCgayz Q==;
X-CSE-ConnectionGUID: UYTimgvaS5ubLCy4GdxgGw==
X-CSE-MsgGUID: hoHwfvjzQVaqs8m1qYhYOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114960099"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114960099"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 11:35:28 -0700
X-CSE-ConnectionGUID: zmna0tz8SaWYFXrso1+t2w==
X-CSE-MsgGUID: acqQ+PF6QdWAc6/KrHclzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="270901260"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 09 Sep 2026 11:35:26 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v6 1/6] tools/vbt_decode: fix tables' offset reading
Date: Wed,  9 Sep 2026 20:34:46 +0200
Message-ID: <20260909183451.2630263-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260909183451.2630263-1-michal.grzelak@intel.com>
References: <20260909183451.2630263-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

During dumping of VBT #57, all rows are same because parser does not
change offset read. Adjust the offset to change basing on the row used.

v5->v6
- read entry's offset properly (Pranay)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 9451a77318..0ea7582745 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3480,7 +3480,7 @@ static void dump_vswing_preemphasis(struct context *context,
 			printf("\t\t%s: ", vswing_preemph[i]);
 
 			for (int j = 0; j < vs->num_columns; j++)
-				printf(" 0x%08x", vs->tables[n * 10 * vs->num_columns + j]);
+				printf(" 0x%08x", vs->tables[n * 10 * vs->num_columns + i * vs->num_columns + j]);
 			printf("\n");
 		}
 	}
-- 
2.45.2

