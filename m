Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC32C54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 09:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E55010EC1E;
	Wed,  6 Mar 2024 09:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pm8JFa8X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F2410EC1D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 09:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709717162; x=1741253162;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QNcmp4gsyeyNGNUG446BS26vXKLl9tfvvsHCG7L8JqA=;
 b=Pm8JFa8XhGJy/hxi/eJtv+7QoYRfJOlKjM9TrNG4DK+ptf5oU7OIWTEG
 LCyvP9pvPv3ir5GyAk8i+7rIKIQ08oR8ZNpZz22IRAyuJjPYFhz5ZxMUE
 C7x62aUO4Q9bNi8rAYveIl8MS3e+lO+6Thvz+lVX3XL75KKo0OKUWSAsj
 zXxiMHOPimeHQZ4VdiHk8uLLcXUg6skK1aJ9CxdLaDb/e9uXH6TBd27oa
 1+q+zj0G7xY69fm38HgmII58+h9HCsL1oYcx7+X7LzGyGXfGatQNJBgDj
 UwEapBMJ27t6SEArCfil/srRHffngTEDmoWCJM4LBHlK2+fmfMLo3DXaW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4433650"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4433650"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 01:26:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="10112536"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 01:26:00 -0800
Date: Wed, 6 Mar 2024 10:25:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t] scripts/igt_doc.py: store igt test names in
 lowercase
Message-ID: <20240306092540.fdyulfzh63gyk2r2@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240306065358.779956-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240306065358.779956-1-mauro.chehab@linux.intel.com>
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
On 2024-03-06 at 07:53:58 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> IGT runner is case insensitive, so, for machine, it doesn't matter.
> 
> Yet, as dictionaries are case sensitive, better to place the tests
> on a canonical form, e. g. in lower case.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 1cb8e617abca..fa2c2c7ca146 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -98,6 +98,7 @@ class IgtTestList(TestList):
>              tests_per_list[driver] = {}
>  
>          for subname, subtest in subtest_dict.items():
> +            subname = subname.lower()
>              run_types = subtest.get("Run type", "other").lower()
>  
>              run_type_dict = self._get_run_type_drivers(run_types)
> -- 
> 2.43.2
> 
