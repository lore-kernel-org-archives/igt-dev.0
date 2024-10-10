Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C338CEE323
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 09:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C59610E8B2;
	Thu, 10 Oct 2024 09:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJz+CZL9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21BD10E8B2
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2024 09:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728553327; x=1760089327;
 h=message-id:date:mime-version:from:subject:to:cc:
 content-transfer-encoding;
 bh=VowxBd9yP1ZEOISpVevGhw3T6GPtEkj88SxNhM7pvEY=;
 b=kJz+CZL9r2+eGtNn9w4GzgIiwxojkDHMf8t0MIEoeDmJMfvKYdrDNqxM
 DL2eqY17eMWYdNTBpqU00MSFL9XwBRYTspzToEAMka23F+wbSI4yIcDxU
 T6XSigHeGjRaO68GjDWc+dFWCIkIwyp+h2VCj+uY3+5I4FtKGsTvb2Y0x
 DFei6ydW7JAunpA2dFuA7WRs7pvWoPsXPpiadki+Bs43EZF1lUud3Bbfr
 M2tzLjGPutiLZFfVnJJ5KorlJ++eQWpFIC1rzhHZWAYf2nTuAyA0niw9Q
 b2yi1nnTI2LufN5Y+nMJ37GIssngL4Es8vy5Bq5jz1pJ4GV62lVuuDHgC g==;
X-CSE-ConnectionGUID: q8iCpfO5ToWjNlqQY9ohug==
X-CSE-MsgGUID: Dydk/gGPQniNFVNnT49LdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38485855"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="38485855"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 02:42:06 -0700
X-CSE-ConnectionGUID: 9UK55CNJTEev8fTyVNlh7A==
X-CSE-MsgGUID: kmmdxKeQSKCfNDW1hfGEjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76850368"
Received: from rcoyle-mobl.ger.corp.intel.com (HELO [10.213.201.208])
 ([10.213.201.208])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 02:42:05 -0700
Message-ID: <ffa2bbcb-edb3-4610-aec8-bcd6a3b8f106@linux.intel.com>
Date: Thu, 10 Oct 2024 11:42:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_module_load: Handling of snd_hda_intel
Content-Language: en-US
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

The problem: Running the following test-list twice fails on the second run:
igt@xe_module_load@load
igt@xe_module_load@unload

The load test will modprobe snd_hda_intel, while the unload will not rmmod
snd_hda_intel. Then running the load test the second time will fail as
snd_hda_intel is loaded and marked as an "unwanted_drivers".

It used to be the case that snd_hda_intel could prevent module load and unload
and we needed to take care of it in older kernels. This is no longer the case
so remove snd_had_intel from unwanted_drivers for this test.

cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/intel/xe_module_load.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index 30259fc26..83e37430f 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -94,7 +94,6 @@ static void load_and_check_xe(const char *opts)
 static const char * const unwanted_drivers[] = {
 	"xe",
 	"i915",
-	"snd_hda_intel",
 	NULL
 };
 
-- 
2.34.1

