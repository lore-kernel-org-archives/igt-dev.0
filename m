Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80720C4829B
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 12:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5D910E29B;
	Fri,  9 Feb 2024 12:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z3V/vn2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CE110E29B
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707483539; x=1739019539;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w7zdrcd3/UqTdGdvEciSJavKLs1FSZFwXl1L/cj+2TI=;
 b=Z3V/vn2LF+2GewG/Fc9BVeaijx6dLNome0ezyEgJ0NaoVXUzXTW4CN2B
 TDP9/Y8IGPa4GltQaJo+rigpYWwETvSDBS7I3DECklN246g/3zPNuE1S7
 lk9bdbynWaKhg3tU5NmXLzWxONj3ECleuXuBr5KZZKmSRmOLkF+Mx9Sam
 IqzU3hdg2oXYJwgSX5yzfkQly+3xDquYeBWo2FvH1C+KvvM6d/IEKbI/0
 lPO0RoAjKRmoB05xDRS8edy4pYj4H9rNt048GqDcZp5b1FAY4byIu4FBW
 pJfWPp5sDv2kv67HmDdXzFtUD/GUa3uyuRz5L7pYBykn3e27ZnKRdGX1K Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12797279"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="12797279"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:58:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="39367460"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:58:57 -0800
Date: Fri, 9 Feb 2024 13:58:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v3 1/8] scripts/test_list.py: fix a typo on
 default-if-not-excluded
Message-ID: <20240209125446.zcmbckgzj5fjzlrp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240209123543.289204-1-mauro.chehab@linux.intel.com>
 <20240209123543.289204-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240209123543.289204-2-mauro.chehab@linux.intel.com>
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
On 2024-02-09 at 13:34:40 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> There is an extra hyphen there.
> 
> Currenty, this is harmless, as such config attribut is not
> used anymore on current config files.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index eeb452091fbf..69c830ca1539 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -550,7 +550,7 @@ class TestList:
>              if not update:
>                  continue
>  
> -            default_value = update.get("default--if-not-excluded")
> +            default_value = update.get("default-if-not-excluded")
>              append_value = update.get("append-value-if-not-excluded")
>  
>              testname = subtest_dict["_summary_"]
> -- 
> 2.43.0
> 
