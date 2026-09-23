Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AAFC9830D
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 21:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F59710F1E3;
	Wed, 23 Sep 2026 21:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5NqS9u4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F65910F1DE
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790199714; x=1821735714;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=I8zohUadfVJOTrQDj3h2AY941yIUDl7ZXMM2PXWP2Fo=;
 b=X5NqS9u4AqcEZX5IFIE1XHSIP8pnMFpnEdYMGVTLKsaEPcm6eA7+FlQZ
 oKfsm4dxxjQRj6IlYlp86Yc+597Zn+wYxU/A1EdHfMIl9z2Gy4LTzpo0L
 EJzT02xHdqIi8XgRcY99ED/wx+i1S/slsQues8XBWntjRVDDXNNdsqkqb
 N8UWTs86QJ3ndsBA3rIlfVJv2V5re/Th+/oDucOwCB9ejiYaFWpmFBap5
 rqSe5MpO+kFBq2FzCg5Ck5Ite2B1kVweAzanEOfxrKytRlhORLTh7zl2m
 OrSsXI1sC8BbyXGYlaWlZIbhYnRV1x9XZLKvHMFG2sA46XnSnHUPXlM7Z w==;
X-CSE-ConnectionGUID: o9TZ+PcmQp+HjOBaVQWJOA==
X-CSE-MsgGUID: n85D0oZyRCWsZcXqFKOjTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93445409"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="93445409"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:54 -0700
X-CSE-ConnectionGUID: WicyrsLOR3aARQ8zrS2etQ==
X-CSE-MsgGUID: i8b9ZjsPRX6bai6kaB8zUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4907710"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:48 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 23 Sep 2026 18:41:14 -0300
Subject: [PATCH i-g-t v2 07/11] tests/intel/xe_pat: Adapt pat_entry_is_wb()
 to Xe3p
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-wa_14026539277-v2-7-528b575299d2@intel.com>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
In-Reply-To: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

Xe3p introduces a new device-cache policy called XA, which has the
longer name "WB Transient App".

Even though commit 4e59b8e7779b ("lib/intel_pat: use kernel debugfs as
authoritative PAT source for Xe") already gives a clue that XA is a
"write-back" cache policy type, pat_entry_is_wb() doesn't really
incorporate that information.  Add the necessary logic to
pat_entry_is_wb() so that it also considers XA starting with Xe3p.

Bspec: 71582
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 tests/intel/xe_pat.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 9706b2dd5de0..17c3f2106f9f 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -143,6 +143,13 @@ static bool pat_entry_is_uc(unsigned int gfx_ver, uint32_t pat)
 
 static bool pat_entry_is_wb(unsigned int gfx_ver, uint32_t pat)
 {
+	if (gfx_ver >= IP_VER(35, 0)) {
+		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
+
+		return l3 == L3_CACHE_POLICY_WB || l3 == L3_CACHE_POLICY_XD ||
+		       l3 == L3_CACHE_POLICY_XA;
+	}
+
 	if (gfx_ver >= IP_VER(20, 0)) {
 		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
 

-- 
2.55.0

