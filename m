Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881D6C54E5D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 15:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0A310E9E5;
	Thu, 14 Mar 2024 15:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/XPOEXV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF5610E9E5
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 15:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710430490; x=1741966490;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SZazxSIlM7vXoABRgvPjxqb8rSjohvGJ3e8Sl47Uz0w=;
 b=A/XPOEXVP+zSP47+STJjR+Z9h0KClf6XemWolw71E9Pd+Yq90I6r883z
 YhfQg6Jo2p70DrRNRyRUT+VEzScWrsAbXrukMqEveRvzMWdv+a8hi3NJ3
 2w5Q5jIIDERyOUIb12jDe5s8tKDg2eDun4ngrLfwz92L+tAr6ctzzoGEQ
 jSLBF0oPbHJZm7lu21cX4dZpsl4BrUxk6XNT9ZYT3opxkJQKaWCxLnVbh
 uq2AEwTW+7uHSAV9DfxHY1qcCbmKOZ43fvXq1jAHlVJ9OhCake/LqHkeH
 9TjdmNGm2L+asUbDWnw8yiodv35b+hMtEA24/UrJNMLXlmXDFby0UjMTf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5111603"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5111603"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 08:34:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16923138"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:34:15 -0700
Date: Thu, 14 Mar 2024 16:34:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t 07/10] scripts/xls_to_doc.py: don't duplicate a
 common field
Message-ID: <20240314153412.3x4u7zzqoipy76pb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
 <20240314103014.1170437-8-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314103014.1170437-8-mauro.chehab@linux.intel.com>
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
On 2024-03-14 at 11:29:16 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> If the TEST field has the same value of the subtest one, ignore
> it when updating it, as the subtest on is inherited.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/xls_to_doc.py | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
> index 749666faf41f..0d6ad0e0b1cd 100755
> --- a/scripts/xls_to_doc.py
> +++ b/scripts/xls_to_doc.py
> @@ -317,6 +317,11 @@ class FillTests(TestList):
>                              print(f"{testname}@{subtest} field {field}: Value unchanged: {value}. Ignoring it")
>                          continue
>  
> +                    if value == self.doc[test_nr].get(field, ""):
> +                        if self.verbose:
> +                            print(f"{testname}@{subtest} field {field}: Value matches common field. Ignoring it")
> +                            continue
> +
>                      if self.verbose > 0:
>                          print(f"Update {testname}@{subtest} field {field} on line {line}:")
>                          print(f"  Change from {doc_value} to {value}")
> -- 
> 2.43.2
> 
