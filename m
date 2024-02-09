Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7EDC4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 13:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2294B10E6B8;
	Fri,  9 Feb 2024 13:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ccmasoj9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F26410E395
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 13:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707483626; x=1739019626;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6Xjewrs0w0fN6dSy5Z3s6v0fv5bWaCI/0Z61k1L7yoY=;
 b=Ccmasoj99l5l/3Lm56Egy5Dc5jDAPILT2iSnkSgKOcFt4pm9sG4OmCS6
 4zAiy4HH6HctH9GI8qF6GmqCg/aGGuTxQnZh23o5gFzDW1e7wXV6rIL5A
 XRe5GDnh34IFcWMpK20eGf6Fv8rOOpser/AHnW6Qnq8XuC+us7B8DMRAw
 wWPK8N+VjGo9Rmmtqyk6i2n/c2biWec+oM5btBBJKOX45NDF2DEvY7yxp
 C6vtsw4DeGZpxB5yUHQsfC1prepoHsyxaaVWTudm54NHZkWLlAQbF/ctT
 LDBVkfuIqAWEgSdULca8uuNMcDicXoAQpFEA93UbPI9U4ft9uKIv2vOQg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1281037"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1281037"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 05:00:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1930378"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 05:00:24 -0800
Date: Fri, 9 Feb 2024 14:00:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v3 2/8] scripts/igt_doc.py: better handle issues
 with empty testlists
Message-ID: <20240209130022.ioocdslln5dhq3d6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240209123543.289204-1-mauro.chehab@linux.intel.com>
 <20240209123543.289204-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240209123543.289204-3-mauro.chehab@linux.intel.com>
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
On 2024-02-09 at 13:34:41 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The warning message of not creating an empty testlist is
> harmless, and it should only be used when not all GPUs
> are listed. So, change the logic to better check for "other"
> testlists before printing a message.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 6a1cfc2b5a56..a6cbeee067fe 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -218,16 +218,14 @@ class IntelciTestlist:
>  
>                  for testlist, subtests in names.items():
>                      if testlist == "":
> -                        if not subtests:
> -                            continue
> -
>                          testlist = "other"
>                      else:
>                          testlist = re.sub(r"[\W_]+", "-", testlist).lower()
>                          testlist = re.sub(r"_+", "_", testlist)
>  
>                      if not subtests:
> -                        sys.stderr.write(f"Warning: empty testlist: {testlist}\n")
> +                        if testlist != "other":
> +                            sys.stderr.write(f"Not creating empty testlist: {dname}/{testlist}\n")
>                          continue
>  
>                      fname = os.path.join(dname, testlist) + ".testlist"
> -- 
> 2.43.0
> 
