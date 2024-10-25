Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542B8D149E8
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 18:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B7410E055;
	Fri, 25 Oct 2024 18:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUZY/xPN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3942D10E055
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 18:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729882260; x=1761418260;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DnT3XMEN++NlxmHUAb8ZSi4UvkjsiT2aMOkmM5zLmew=;
 b=mUZY/xPN7Ap5tLNXYWg0yTMS/lvfymR6xSqxm918M/UAvC+KU9d89USZ
 Fn+EuRos9zLVQhSeSJ93yd0U/Lz660j0caQrny1n78onFs7h2VyHVnULG
 sN6FKdpAMfjmMMymgIKYtes/62nq4gJxks3Suy1xDRHLf6uY7JzQdeEuq
 HoJTvatQfVrWE4GKfQsUTJJ+J/8KYf5phF7gdmumXLs+HJ/mAXItiOJ7D
 hDpL2kUMjIVld7VFFfy12l/9GEn0zy/A8/hfikN08feNArBgyn1vVzFzX
 n6hg5Qz5fShQOEosDuiI/UOtKOj6KYj2N042wVrX/i0CbLZJIVfS+PiGO w==;
X-CSE-ConnectionGUID: Jd8l7kU/QbqJzEEzInen2w==
X-CSE-MsgGUID: GF6eilpEQCa4gJpKWRzctA==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40147726"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="40147726"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 11:51:00 -0700
X-CSE-ConnectionGUID: fT4N1IfISx20f22UxYztiw==
X-CSE-MsgGUID: 1KH6CXaNTD2dP8oHVKPfug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="84962686"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 11:50:58 -0700
Date: Fri, 25 Oct 2024 20:50:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: george.zhang@amd.com, Leo Li <sunpeng.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Choi <nicholas.choi@amd.com>
Subject: Re: [Patch v3] scripts/run-test: Keep original prune behaviour
Message-ID: <20241025185055.4ch5v3fq2shvcu7g@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, george.zhang@amd.com,
 Leo Li <sunpeng.li@amd.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Choi <nicholas.choi@amd.com>
References: <20241025182944.866-1-george.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025182944.866-1-george.zhang@amd.com>
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

Hi george.zhang,
On 2024-10-25 at 14:29:44 -0400, george.zhang@amd.com wrote:
> From: George Zhang <george.zhang@amd.com>
> 
> The default prune behaviour of the runner settings was changed.
> This change is to maintain the original behaviour of this script
> while also enabling the prune mode to be overriden.
> 
> v2: added m to getopts
> 
> v3: fixed bm: -> b:m: in getopts
> 
> Fixes: 997bac8 ("runner/settings: set PRUNE_KEEP_ALL as default")
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Hung <alex.hung@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Nicholas Choi <nicholas.choi@amd.com>
> Signed-off-by: George Zhang <george.zhang@amd.com>
> ---
>  scripts/run-tests.sh | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
> index cd03682b4..082ebaa5a 100755
> --- a/scripts/run-tests.sh
> +++ b/scripts/run-tests.sh
> @@ -37,6 +37,7 @@ KERNEL_TREE=
>  USE_PIGLIT=0
>  RUNNER=
>  RESUME=
> +PRUNE_MODE="keep-dynamic"
>  
>  find_file() # basename <possible paths>
>  {
> @@ -154,11 +155,12 @@ print_help() {
>  	echo "                  test run with -R"
>  	echo "                  (only valid for Piglit)"
>  	echo "  -p              use Piglit instead of igt_runner"
> +	echo "  -m              run test runner with prune mode(default: $PRUNE_MODE)"
>  	echo ""
>  	echo "Useful patterns for test filtering are described in the API documentation."
>  }
>  
> -while getopts ":c:dhk:lPr:st:T:vx:Rnpb:" opt; do
> +while getopts ":c:dhk:lPr:st:T:vx:Rnpb:m:" opt; do

Now it LGTM,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  	case $opt in
>  		c) COV_ARGS="$COV_ARGS --collect-code-cov --collect-script $OPTARG " ;;
>  		d) download_piglit; exit ;;
> @@ -176,6 +178,7 @@ while getopts ":c:dhk:lPr:st:T:vx:Rnpb:" opt; do
>  		n) NORETRY="--no-retry" ;;
>  		p) USE_PIGLIT=1 ;;
>  		b) FILTER="$FILTER -b $OPTARG" ;;
> +		m) PRUNE_MODE="$OPTARG" ;;
>  		:)
>  			echo "Option -$OPTARG requires an argument."
>  			exit 1
> @@ -253,7 +256,7 @@ if [ "x$RESUME_RUN" != "x" ]; then
>  	execute_runner 1 $RESUME $RESUME_ARGS $COV_ARGS "$RESULTS"
>  else
>  	mkdir -p "$RESULTS"
> -	execute_runner 1 $RUNNER $RUN_ARGS -o -s "$RESULTS" $COV_ARGS $VERBOSE $FILTER
> +	execute_runner 1 $RUNNER $RUN_ARGS -o -s "$RESULTS" $COV_ARGS $VERBOSE $FILTER --prune-mode $PRUNE_MODE
>  fi
>  
>  if [ "$SUMMARY" = "html" ]; then
> -- 
> 2.34.1
> 
