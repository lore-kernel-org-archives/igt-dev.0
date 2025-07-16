Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C66C83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 10:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E00F10E788;
	Wed, 16 Jul 2025 10:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bnxhPA9d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8639610E78B
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 10:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752661752; x=1784197752;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kjogEFkHOG28NnzglalEIWiHYHlYsgLsOOrcVkI6ckE=;
 b=bnxhPA9ddVe4PHbJPrhUtnEQY3EIB7Umw/KgDsoS85eSHN65PQ4OWECo
 2HaULRoyLEwDt0yP1Fkso3WWxRt8TqBkIHc5+NkkDjJd/9oXOqAtJB3v5
 PGq7ODdDEWQqDCQg2/CJgDnjyUw4tcurIWzFPqTa0dir2jGiBoRxZtnYx
 S/JcBUPZrLI33nF0a7CBIsWqZLcsFZfiI5Vrm+TOVYMU4/NcjRsjI0oni
 ac7gIMOcIcmwyCDcCIsP27mH2qbaN4xldC2Zjn/LeKKugTSh7UdVdNfRn
 lCd4eLrrM1VnfEPjvahLbPMcUq8gY0C+ngDzKbw+IQec6dCCrivamj1ir w==;
X-CSE-ConnectionGUID: nZMRDZ5nR3aijZOIwUqN0Q==
X-CSE-MsgGUID: /WJtQIxTSdmB8lL3+lwLWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58715467"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="58715467"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:29:12 -0700
X-CSE-ConnectionGUID: StTmpqqQRL6E0YiwiEpDQg==
X-CSE-MsgGUID: tKq7Fz3iTU2KngrXnx682g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="157956828"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:29:10 -0700
Message-ID: <2ba33909-3529-4931-8f3d-c88b4ab5cef6@linux.intel.com>
Date: Wed, 16 Jul 2025 12:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/*test_config: Fix i915 blocklists rename
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20250716102315.48051-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250716102315.48051-1-kamil.konieczny@linux.intel.com>
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



On 7/16/2025 12:23 PM, Kamil Konieczny wrote:
> I missed few more places for i915 blocklists rename, last ones
> are in i915|kms json files. This was found when compiling after
> reverting two last symlinks patches:
> 70f2cf0d6 ("intel-ci: Add symlinks for old i915 testlists")
> f778072a5 ("intel-ci: Add symlinks for old i915 blocklists")
> 
> where scripts/test_list.py reports 'FileNotFoundError'
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Reported-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Fixes: 8d8ecb94f673 ("intel-ci: rename i915 blocklists")
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

> ---
>  tests/intel/i915_test_config.json | 2 +-
>  tests/intel/kms_test_config.json  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index 7cfcad532..a31e00893 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json
> @@ -87,7 +87,7 @@
>                  "update-from-file": {
>                      "include-type": "regex-ignorecase",
>                      "include": [
> -                        { "all": "../intel-ci/blacklist.txt" }
> +                        { "all": "../intel-ci/i915.blocklist.txt" }
>                      ]
>                  }
>              }
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 362298e0d..4fab26275 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -61,7 +61,7 @@
>  			{ "LNL": "../intel-ci/xe.lnl.display.blocklist.txt" },
>  			{ "BMG": "../intel-ci/xe.bmg.display.blocklist.txt" },
>  			{ "LNL, BMG": "../intel-ci/xe.blocklist.txt" },
> -			{ "ADLP, ADLS, DG2, MTL": "../intel-ci/blacklist.txt" }
> +			{ "ADLP, ADLS, DG2, MTL": "../intel-ci/i915.blocklist.txt" }
>  		    ]
>  		}
>  	    }

