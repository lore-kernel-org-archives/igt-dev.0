Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAEBCA0EDC
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 08:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C34B10E81F;
	Thu, 14 Aug 2025 08:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daZxKQtO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E160810E81F
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 08:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755160031; x=1786696031;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CExVenCG2KC5DMmb1yZaPZER2yF3aBKdgP3dDCQ9bNo=;
 b=daZxKQtOWD74F1TGdfkQKBh1wsJzkPspS/QcMVG0gFHrPNJZIgcg6lC6
 hK+19Inb5mLTbWpXHb/2oTSg22BEr5ZzVd+koxTi1gUmW/hTADCVG7Rir
 Kxs6pizhM/OQAF4MxMXwtdEY+sGK72Q79huYOx7uTHS6qCxTUl738Ls7/
 HvD7NpU43pQGRCj/5d1gjpr+XzDUjRKVsCPZs6/xiFO/wVt1mHKG8MM5S
 Q3fp5fP9V7S+F5Cltwb87SVfa9uQ+orHELVpmXshIcc8F2HFIGjpaNe2I
 bn3X2Elway8UE/ZPCC0mz+28oC6bVgaFhOs84v9AMsm3UQx2kFop42exq A==;
X-CSE-ConnectionGUID: P43eqWKuRECKR0mg7enYtQ==
X-CSE-MsgGUID: 68KxfkMMQzmhvz00AwKqWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="75040997"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="75040997"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 01:27:10 -0700
X-CSE-ConnectionGUID: uANzwYSjR+qcD2Xgn+zS9Q==
X-CSE-MsgGUID: 43WDOj/FSrKBc9KxmxKJbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166338680"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 01:27:09 -0700
Date: Thu, 14 Aug 2025 10:26:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Cc: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 1/2] xe/oa: Add perf consts to support more metrics
Message-ID: <20250814082655.dgxrlwb34uluhxvp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20250813214522.8733-1-sushma.venkatesh.reddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250813214522.8733-1-sushma.venkatesh.reddy@intel.com>
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

Hi Sushma,
On 2025-08-13 at 21:45:21 +0000, Sushma Venkatesh Reddy wrote:

please improve subject, add 'lib/' prefix so it will be:

[PATCH 1/2] lib/xe/oa: Add perf consts to support more metrics

> $SqidiTotalCount, $L3BankTotalCount, $L3NodeTotalCount,
> $GeometryPipeTotalCount, $DepthPipeTotalCount and $ColorPipeTotalCount are
> needed for collecting some important metrics.

Please rewrite this, first that you add new metrics, then you
could list which ones are added, for example:

Add new metrics: SqidiTotalCount, L3BankTotalCount, ...

Also adding Ashutosh to cc.
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Regards,
Kamil

> 
> Signed-off-by: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
> ---
>  lib/xe/oa-configs/codegen.py | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/xe/oa-configs/codegen.py b/lib/xe/oa-configs/codegen.py
> index 8629eac6d..d3742e11b 100644
> --- a/lib/xe/oa-configs/codegen.py
> +++ b/lib/xe/oa-configs/codegen.py
> @@ -128,7 +128,6 @@ class Set:
>          return self.xml.find(path)
>  
>  
> -#TODO add SqidiTotalCount, L3BankTotalCount, L3NodeTotalCount
>  hw_vars_mapping = {
>      "$EuCoresTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
>      "$EuSlicesTotalCount": { 'c': "perf->devinfo.n_eu_slices" },
> @@ -164,6 +163,14 @@ hw_vars_mapping = {
>      "$ComputeEngineTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
>  
>      "$CopyEngineTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
> +
> +    "$SqidiTotalCount": { 'c': "perf->devinfo.n_sq_idis", 'desc': "Total number of SQIDI units" },
> +    "$L3BankTotalCount": { 'c': "perf->devinfo.l3_banks", 'desc': "Total L3 bank count" },
> +    "$L3NodeTotalCount": { 'c': "perf->devinfo.n_l3_nodes", 'desc': "Total L3 node count" },
> +
> +    "$GeometryPipeTotalCount": { 'c': "perf->devinfo.n_geom_pipes", 'desc': "The total number of geometry pipelines" },
> +    "$DepthPipeTotalCount": { 'c': "perf->devinfo.n_depth_pipes", 'desc': "The total number of depth pipelines" },
> +    "$ColorPipeTotalCount": { 'c': "perf->devinfo.n_color_pipes", 'desc': "The total number of color pipelines" },
>  }
>  
>  def is_hw_var(name):
> -- 
> 2.43.0
> 
