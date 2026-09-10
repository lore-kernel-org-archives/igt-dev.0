Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F110C79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 16:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9426310E2B0;
	Thu, 10 Sep 2026 16:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlYfErJq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4F710E46D
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789056971; x=1820592971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vDtWvWZuZiKe5zJmaX1SL2q+2XX1xUY+rAKjUzwyH/A=;
 b=mlYfErJqEjU6on2K02YFxPDx25LY4ZAz5XhXC4XkRjEk+4C5bF/xFRDk
 wQu9LEhTE4//q/tstg45YwjAw8JhyD/fWFRMUUrxpUeuuaRYgjmxSj+3t
 1d2nNgUliNYojmvy5YSwM/G6rpeAtcTE8UIrCCjMiDIfrRywfexVe6S8z
 Ms7AaXXMX54uRVMMiPNY+DTuucqy8RJvhI3y1MN1CNVR1A9MTZ3Fq+M6+
 8fAfGiaeGuqgjIExJFimVCHsTaE2EExN63N5LlSUNLSXEhtrW/urVuxLk
 ORywiXiHVeecRHORyKeR/feV6JaSEcGGj7rGBMHr0nChBmDEO3kw1Gtmi Q==;
X-CSE-ConnectionGUID: tlA3oxxERyS8A/WcCVbVRw==
X-CSE-MsgGUID: eLix4BlDTXumGnU3a9P+FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101033043"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="101033043"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 09:15:25 -0700
X-CSE-ConnectionGUID: lwdpnDaxRUWW0hVXCu16zw==
X-CSE-MsgGUID: MYNP4q7dRK2gkZTpcDjsVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="270325820"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 09:15:23 -0700
Date: Thu, 10 Sep 2026 18:15:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH] tests/intel/xe_wedged: ignore expected fault/CAT dmesg
 in wedged paths
Message-ID: <20260910161521.kvoiotf7ws6vgtfq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260817151421.528272-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817151421.528272-1-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2026-08-17 at 15:14:21 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> The wedged test flow intentionally triggers hang/reset behavior that can
> emit a known multi-line fault dump and CAT error in dmesg during
> wedged-mode-toggle and related wedged scenarios. Updated existing
> test to extend ignore_wedged_in_dmesg with regex patterns that match:
> 1. Tile/GT fault header and fault detail lines (ASID, faulted address,
> fault type, access type, fault level, engine class/instance)
> 2. Fault response: Unsuccessful -EINVAL
> 3. Engine memory CAT error line
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_wedged.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index e1ac629ca..9281fbdb0 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -35,7 +35,18 @@ static void ignore_wedged_in_dmesg(void)
>  				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
>  				    "|GT[0-9A-Fa-f]*: Failed to submit"
>  				    "|Modules linked in:"
> -				    "|__pfx___drm_");
> +				    "|__pfx___drm_"
> +				    "|Tile[0-9]+: GT[0-9A-Fa-f]*:$"

This looks like a little too generic, look into line I cite
below.

> +				    "|[[:space:]]+ASID: [0-9]+"

Please do not add multiply white chars as a part of regex.

Also, please write down what messages do you want to ignore,
for example here https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-lnl-7/igt@xe_wedged@basic-wedged.html
I found following:

<3> [272.889677] xe 0000:00:02.0: [drm] *ERROR* SIGID=106 FATAL (-ECANCELED) Tile0: GT0: GT: reset failed
<3> [272.889756] xe 0000:00:02.0: [drm] *ERROR* SIGID=102 FATAL (-EIO) WEDGED: Device declared wedged!
<3> [272.889771] xe 0000:00:02.0: [drm] *ERROR* IOCTLs and executions are now blocked!
For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging
Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new

Will they be ignored by your regex?


Regards,
Kamil

> +				    "|[[:space:]]+Faulted Address: 0x[0-9A-Fa-f]+"
> +				    "|[[:space:]]+FaultType: [0-9]+"
> +				    "|[[:space:]]+AccessType: [0-9]+"
> +				    "|[[:space:]]+FaultLevel: [0-9]+"
> +				    "|[[:space:]]+EngineClass: [0-9]+ [a-z]+"
> +				    "|[[:space:]]+EngineInstance: [0-9]+"
> +				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
> +				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error \\[[0-9]+\\]:"
> +				    "class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+");
>  }
>  
>  static void force_wedged(int fd)
> -- 
> 2.43.0
> 
