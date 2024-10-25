Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4C6D0C603
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 12:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5A210E3E8;
	Fri, 25 Oct 2024 12:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNPZsMjt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7AF10EA7D
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 12:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729858349; x=1761394349;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D6pgGd++f9g99C4K4zIm/lVbcuSblZS01eEfg+3DJhA=;
 b=QNPZsMjtNPfSSm9XbwZ1zw7ylncWQSIl0vA6ltE/10mHdxIwIrPJUi+D
 dFqYl1KVJm0/lG6lppAzRYGPWEL4v7FM0iQMmqJEKdEuOo8fdAFz99Pxa
 FnJ3XXkevTkAagm6ZTmWKyt3miBt911yOU0nGnSBiczpRb0Jeh91iltKx
 9DWiw4TXtUypSgxduisNYQ7Jx8xS6Yk3Tg3LfKRdw+eV/cAV+08Ysj7Je
 YTGdWhjU5Ct3foUbvt7qf9J3Wg3bFz7kUZrbJucAvw4Ft7snUB3bnCVj6
 72q85ugK4xjodqyEW9IpLe5evek9GG5+NR4/QM5l98J62YX97ad3tyf38 A==;
X-CSE-ConnectionGUID: BXqV+2mzT/6hr4PJe8RVQQ==
X-CSE-MsgGUID: qIZeGZ0VQc2XJqj1GGBVbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40919465"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="40919465"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 05:12:29 -0700
X-CSE-ConnectionGUID: d1ps19JKToWa8OHLT1innA==
X-CSE-MsgGUID: SgabcaLsRom/XXSB1WGg4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="104209435"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 05:12:27 -0700
Date: Fri, 25 Oct 2024 14:12:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: george.zhang@amd.com, Leo Li <sunpeng.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH] scripts/run-test: Keep original prune behaviour
Message-ID: <20241025121212.vngwdrofxl36jmyk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, george.zhang@amd.com,
 Leo Li <sunpeng.li@amd.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <20241024160959.28947-1-george.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241024160959.28947-1-george.zhang@amd.com>
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

Hi George,
On 2024-10-24 at 12:09:59 -0400, george.zhang@amd.com wrote:
> From: George Zhang <george.zhang@amd.com>
> 
> The default prune behaviour of the runner settings was changed.
> This change is to maintain the original behaviour of this script
> while also enabling the prune mode to be overriden.

Thank you for fixing this! I have one nit, see below.

> 
> Fixes: 997bac8 ("runner/settings: set PRUNE_KEEP_ALL as default")
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Hung <alex.hung@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: George Zhang <george.zhang@amd.com>
> Change-Id: I98cafbbaae15788a06eae8b9905615e9231d8e8e
> ---
>  scripts/run-tests.sh | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
> index cd03682b4..f3ae48451 100755
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
> @@ -154,6 +155,7 @@ print_help() {
>  	echo "                  test run with -R"
>  	echo "                  (only valid for Piglit)"
>  	echo "  -p              use Piglit instead of igt_runner"
> +	echo "  -m              run test runner with prune mode(default: $PRUNE_MODE)"
>  	echo ""
>  	echo "Useful patterns for test filtering are described in the API documentation."
>  }
> @@ -176,6 +178,7 @@ while getopts ":c:dhk:lPr:st:T:vx:Rnpb:" opt; do

imho you should add "m:" after "b:" in while loop

while getopts ":b:c:dhk:lm:npPRr:st:T:vx:" opt; do

Regards,
Kamil

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
