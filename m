Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC95D149D9
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 17:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354DD10EB66;
	Fri, 25 Oct 2024 17:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOmre9d7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EA710EB73
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 17:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729878696; x=1761414696;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pNmzH2nVl12+1B8SWD8ql9lC5BiKvI6X2rPFa9zrIC4=;
 b=NOmre9d7iz2VYvaY9NYAeznlBqxX4G9NKOdn6j7vbE85HAL9u+zN8AYQ
 4jxYDqM4EQSSEJg7fukMVtCxwFqXe39BkRbPVmaUwXUEO4dv+ADBxLAd+
 xGO5tNlmUeDHmQhKPeAzxQu/RtyysnVNGrgneMFxrNRbD+Zac9bWBbaLb
 Qr11WbcEJeoS05Ckkq6+FxgLny9OT+T50wef9A2CokmOtTLvd2pYMBEzd
 UyUqqPqK3dxp+7cvVyYrHVRjOGFZjpgN2eqR57g48QJ1aO09807m6nIit
 TRHfK0Imw//uqJtsvd/weNZkCqBdUlmklWp6p4opPf5TL2dPd3YRO3Jmx w==;
X-CSE-ConnectionGUID: vO/f7thKTFKmLGjWs2qx2Q==
X-CSE-MsgGUID: WOWV49deRj+SYQoVSBQKng==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29000446"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="29000446"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 10:51:35 -0700
X-CSE-ConnectionGUID: 8lHsy8mlTRiDaMLpf5H0EA==
X-CSE-MsgGUID: 5fYjDRjYToOfI9vrI5LjMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="81079783"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 10:51:34 -0700
Date: Fri, 25 Oct 2024 19:51:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: george.zhang@amd.com
Cc: igt-dev@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Choi <nicholas.choi@amd.com>
Subject: Re: [Patch v2] scripts/run-test: Keep original prune behaviour
Message-ID: <20241025175114.y2xnkvzlvz7nn2r5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 george.zhang@amd.com, igt-dev@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Choi <nicholas.choi@amd.com>
References: <20241025151121.9160-1-george.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025151121.9160-1-george.zhang@amd.com>
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
On 2024-10-25 at 11:11:21 -0400, george.zhang@amd.com wrote:
> From: George Zhang <george.zhang@amd.com>
> 
> The default prune behaviour of the runner settings was changed.
> This change is to maintain the original behaviour of this script
> while also enabling the prune mode to be overriden.
> 

Please add here what changed in version 2 of patch,
for example how to describe look into revision 4 of patchseries

https://patchwork.freedesktop.org/series/139352/

https://patchwork.freedesktop.org/patch/621243/?series=139352&rev=4

I have still one nit below.

> Fixes: 997bac8 ("runner/settings: set PRUNE_KEEP_ALL as default")
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Hung <alex.hung@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Nicholas Choi <nicholas.choi@amd.com>
> Signed-off-by: George Zhang <george.zhang@amd.com>
> Change-Id: If379ec2fb7616af79c55cde44c49b760225a4896
> ---
>  scripts/run-tests.sh | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
> index cd03682b4..4ded76df5 100755
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
> +while getopts ":c:dhk:lPr:st:T:vx:Rnpbm:" opt; do

Keep ':' after 'b', so

while getopts ":c:dhk:lPr:st:T:vx:Rnpb:m:" opt; do

I was thinking of sorting this string of option letters
but lets go with simple extension now.

Regards,
Kamil

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
