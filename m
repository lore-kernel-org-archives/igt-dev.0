Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D8CC48BC4
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 17:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18E810EA15;
	Thu, 15 Feb 2024 17:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIe4CP0k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5DB10EA17
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 17:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708017551; x=1739553551;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Hnqgh7KLMOOQPLtO1f4La/FSqCgNf9z6rvtKgsMWwzg=;
 b=bIe4CP0kL2ksMVX+1Ai4fMEdYpmhIaIoeAnyVsgGRyiw//kf52tguPC6
 DiFm4q7CrCoBIUGZgOCyfhpvyihJJud6WNBI8pdmhtJXJTDifL0YJwZM1
 j52WOveDMIqo1KWh2baZL4rWZS6cGHhdfA2s+mgkGCqiB/XLwAlKpkyIc
 G9zIGt66smXsMLWgqPia3d6hwU4MqpzwnA4wsdqo07kvW+dSWcz8SUkZm
 i/35XqtwXo7nGqQ/XynSZARp+nMQcShHEzzIyA3epOcB5DWLer3M1Qoib
 0fOBZHrjBJxQQMONV5cldCOPqPnMFs0/Bn4SbZMDuua0GWEzwo+UOHLZp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13517984"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13517984"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:19:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3615123"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 09:19:09 -0800
Date: Thu, 15 Feb 2024 18:19:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 13/17] scripts/code_cov_parse_info: warn if branch block
 is not zero
Message-ID: <20240215171906.p3tmyxxq4ekpgmqr@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
 <35ce25939b496dc55998c0a2f40e518fdb33a215.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <35ce25939b496dc55998c0a2f40e518fdb33a215.1707992666.git.mchehab@kernel.org>
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

Hi Mauro,
On 2024-02-15 at 11:27:22 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The lcov's info format has a field to be used for report branch
> block. This is unused on json format (newer gcc), being always
> zero. JSON doesn't contain it, so the parser doesn't support
> it to be non-zero anymore. Print a warning if this happens.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/code_cov_parse_info | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index 50d10a30d7f9..ea4f64b34d2f 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -519,6 +519,10 @@ sub read_info($)
>  			my $branch = $3;
>  			my $taken = $4;
>  
> +			if ($block != 0) {
> +				print "Warning: unexpected block $block at line $.\n";
> +			}
> +
>  			my $where = "$ln,$block,$branch";
>  
>  			$taken = 0 if ($taken eq '-');
> -- 
> 2.43.0
> 
