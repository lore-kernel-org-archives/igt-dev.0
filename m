Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC461C54E5D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 15:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D28910E771;
	Thu, 14 Mar 2024 15:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QGLd3bZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6861E10E771
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710430072; x=1741966072;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wQxqEFRVPi1QnQSkfnlsIHKj33Z8SwJhnovNm4dtV+Q=;
 b=QGLd3bZ7WBfn0cL4tqgnzS7F+e4PzA94OxNcJviE9EIAoJ6gnWCqApxc
 Q9RC5JtwSBVY3WMRkUcVqI0pQQ6EqzoQLSwk6gUFwFjAM1JRHLqiI1DfL
 /j1IGJBHzArcTkf7r/zXeWoxCiW5b7ZeTVy3iWbIl7Tjaugt1z2B6M3lt
 KC3Sm4/BP/QO54Eb8lhXXpos4LAoFMcZoGYVPJAZNhNWpEVb32rUHJ0/G
 dQ8vcLmLd5WAGhUIH1bUj9R3mhScussxM5g+I97YwlV6Sp1ZWuMCjdjAJ
 5jE9aFp64Ux+fHi7UNF5Bx7Slin0XQpV74RBHb7pxS9pwwhLvandeR0f5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5439926"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5439926"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 08:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12772084"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:27:49 -0700
Date: Thu, 14 Mar 2024 16:27:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t 03/10] scripts/xls_to_doc.py: be clearer when
 ignoring a value in verbose mode
Message-ID: <20240314152746.6w4cwacgvgpiwoni@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
 <20240314103014.1170437-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314103014.1170437-4-mauro.chehab@linux.intel.com>
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
On 2024-03-14 at 11:29:12 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Print what value was not changed because it is duplicated.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/xls_to_doc.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
> index bd14320a3bce..5e79a725c1d3 100755
> --- a/scripts/xls_to_doc.py
> +++ b/scripts/xls_to_doc.py
> @@ -298,7 +298,7 @@ class FillTests(TestList):
>                              continue
>                          if doc_value == value:
>                              if self.verbose > 1:
> -                                print(f"{testname}@{subtest} field {field}: Value unchanged. Ignoring it")
> +                                print(f"{testname}@{subtest} field {field}: Value unchanged: {value}. Ignoring it")
>                              continue
>  
>                      if self.verbose > 0:
> -- 
> 2.43.2
> 
