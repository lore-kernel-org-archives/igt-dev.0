Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DE8CA0EED
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 07:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E8E10E245;
	Wed, 20 Aug 2025 07:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFbEIV92";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE8510E245
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 07:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755676008; x=1787212008;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ACC/PoAMhzqLYE9DJIQcTEQZIDYpcNBVhPhr1S86UO4=;
 b=aFbEIV92slNsZDbt67CFYmh8lSXsb5ycWsvi4Eo4l9n2LhumFZoFF6Jk
 uhcCIgsjIFJsEJUSNwxJ+SiOQuNtmb6WEj7C2mrV+EOU2YKAGZbDyCu0A
 XNfWeEOgknxw0hvUqhP0EbUblpacl2lKbYdaYZsvTJoiQ7mXqDP3uE0T7
 /CkTS08nErcHi34LEkuOqSgNj0DQJ7XwX12myPB7IOd3JTGMMAIFaRZjH
 mQvpvv4pSbZwlEey3NA/WGW04ufisQLqOnQH4o/+cCXXpTNscJuZ8TxF8
 UMTvFbuD03NYxYdq2snRT/WUErawMqlE2LFTucnFELyLcQ9k7YOBfRvFw Q==;
X-CSE-ConnectionGUID: oownPLEkSO2dxH2c7Mgzaw==
X-CSE-MsgGUID: VUZ4lz/zRkSS9ksjWTGVtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75384335"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="75384335"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 00:46:47 -0700
X-CSE-ConnectionGUID: LaE4OsRWQIenEmLl6q8xIw==
X-CSE-MsgGUID: YjzMQUMmS8q+k3ODFmNxJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="191752094"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 00:46:45 -0700
Date: Wed, 20 Aug 2025 09:46:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe-oa: Fix OA format name typo
Message-ID: <20250820074613.ws74kbtqhl4pymk6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250819195509.2705178-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250819195509.2705178-1-ashutosh.dixit@intel.com>
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

Hi Ashutosh,
On 2025-08-19 at 12:55:09 -0700, Ashutosh Dixit wrote:
> Fix XE_OA_FORMAT_PEC32u32_G2 format name typo.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_oa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 68c6ccf5b5..63b59028fc 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -285,7 +285,7 @@ static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
>  		.counter_size = 1,
>  		.bc_report = 0 },
>  	[XE_OA_FORMAT_PEC32u32_G2] = {
> -		"PEC32u64_G2", .size = 192,
> +		"PEC32u32_G2", .size = 192,
>  		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>  		.report_hdr_64bit = true,
>  		.counter_select = 6,
> -- 
> 2.48.1
> 
