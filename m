Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129A8C48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 10:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E9510F068;
	Mon, 26 Feb 2024 10:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mbs/pLlH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A14F10F04C
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 10:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708945138; x=1740481138;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cQKSOumV7avDo/32D3UThuwTHTgkJ2i1nc0PZmItebg=;
 b=Mbs/pLlHd5yQnwngcUeOzVOLcImcNg81mVP0bD6tGnOovikg5XmpnYba
 K8+s9YSDqgfjtS/2dbwtdlKT7E5cm4/Z6saiJbc3+WPsHrJfcD+SoBUR9
 qmnIBtVBDeGT8To0DhulX/2WFa37ytpawW6r9l3qsfPm1oT1IrkmD+jch
 NVIWAggcXtY//gHgyiCaSkIVW3IAGgsqh6qyeYDNIKx1hMIFOAY8dtlJu
 ZJZhf6IWsipmlU1pZOiIv6E+eQOpKvmH2GSjEdA/Zm4AEM8dIZtvuc6or
 wNd0ZweMobYDt6xGQl5jAEm/UWHbLUAW9As9AWUxWsjq+IWE+HbraMeMq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3092765"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3092765"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 02:58:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6662897"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 02:58:56 -0800
Date: Mon, 26 Feb 2024 11:58:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 2/4] scripts/igt_doc.py: ignore "all" when
 producing testlists
Message-ID: <20240226105852.s5cp2quk3fxyrfx4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240222114741.196042-1-mauro.chehab@linux.intel.com>
 <20240222114741.196042-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240222114741.196042-3-mauro.chehab@linux.intel.com>
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
On 2024-02-22 at 12:45:26 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The meaning of "all" is an special case for blocklists, meant to be
------------------------- ^^
s/an/a/

> used only when some block lists are to be applied everywhere. It is
> not a testlist itself.
> 
> So, exclude it as a different kind of GPU, as the default case is
> already covered.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/igt_doc.py | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 7404e3d0934c..7985cdd5ac5e 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -229,6 +229,10 @@ class IntelciTestlist:
>              for gpu, names in gpus.items():
>                  gpu = re.sub(r"[\W_]+", "-", gpu).lower()
>  
> +                # "all" is used used only as a default value for unlisted GPUs
----------------------------- ^^^^ ^^^^
Repeated word "used",
s/used used/used/

With that fixed:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +                if gpu == "all":
> +                    continue
> +
>                  dname = os.path.join(driver_path, gpu)
>                  try:
>                      os.makedirs(dname)
> -- 
> 2.43.2
> 
