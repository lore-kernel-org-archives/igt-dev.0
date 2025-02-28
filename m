Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4579FC19776
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 07:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F350610E217;
	Fri, 28 Feb 2025 07:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFduO9br";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FE510E217
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 07:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740726455; x=1772262455;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=+B9TRbon501ktmibv1u0PxwaU0sJbq6Cj0OsmBKaZME=;
 b=OFduO9br4ceAiut7hRSECXiE/hNpk/ggwlu+dkZPGR+gUxsxxBRSzW7N
 KitVSjR2LAvKdT7ThvF4zAIWKUdKnA/ObvWlYIMecJCs6PPjdNRRD482h
 Yk2TB65WJy33pCJ65PkVHMAp2kUXi4xggIwBbeEd2choMLBjhueresM4e
 94A28q+wymOHNsDzEqENE1hc8h9kTWxj8M2UFSe0U0MHsOTQR9U2Yaxnd
 SgCyLVARtAtzzlYOPDV+NoikDJGDp7pQj11Ah2uLFYaVLzK7/mWLXoeo1
 RMwnl+h/DVNn/W5Kkzcn/fP0idDqwh95oArwTHFINEmE1NXqsPheT8qAs A==;
X-CSE-ConnectionGUID: j1RtnvKiSyy9p/gfFN9PNQ==
X-CSE-MsgGUID: eKre4rKaTuWs328z25KnDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40820930"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="40820930"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 23:07:30 -0800
X-CSE-ConnectionGUID: 3Af2W8R6SreEBbk+mlVs7g==
X-CSE-MsgGUID: e606N9cIQtWJF5vmGdX5pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="117288731"
Received: from pbabighi-mobl1.amr.corp.intel.com (HELO [10.246.16.179])
 ([10.246.16.179])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 23:07:29 -0800
Message-ID: <87ff0fb6-4d83-413f-81df-158a1869abe1@linux.intel.com>
Date: Fri, 28 Feb 2025 08:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 i-g-t 3/3] scripts/run-tests.sh: Add support to
 kmemleak reports and igt_facts
To: igt-dev@lists.freedesktop.org
References: <20250227101853.361504-1-peter.senna@linux.intel.com>
 <20250227101853.361504-4-peter.senna@linux.intel.com>
Content-Language: en-US
Cc: vitaly.prosyak@amd.com
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250227101853.361504-4-peter.senna@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 27.02.2025 11:18, Peter Senna Tschudin wrote:
> Updates scripts/run-tests.sh to include the following options:
> 
>  -f:        enable igt_facts on igt_runner
>  -K <mode>: Linux Kernel kmemleak reports
>             - once: run a kmemleak scan after all tests
>             - each: run a kmemleak scan after each test
> 
> These options are simply relayed to igt_runner.
> 
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  scripts/run-tests.sh | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
> index 082ebaa5a..1fb9be478 100755
> --- a/scripts/run-tests.sh
> +++ b/scripts/run-tests.sh
> @@ -132,9 +132,13 @@ print_help() {
>  	echo "  -P              store code coverage results per each test. Should be"
>  	echo "                  used together with -k option"
>  	echo "  -d              download Piglit to $ROOT/piglit"
> +	echo "  -f              enable igt_facts on igt_runner"
>  	echo "  -h              display this help message"
>  	echo "  -k <kernel_dir> Linux Kernel source code directory used to generate code"
>  	echo "                  coverage builds."
> +	echo "  -K <mode>       Linux Kernel kmemleak reports"
> +	echo "                   - once: run a kmemleak scan after all tests"
> +	echo "                   - each: run a kmemleak scan after each test"
>  	echo "  -l              list all available tests"
>  	echo "  -r <directory>  store the results in directory"
>  	echo "                  (default: $RESULTS)"
> @@ -160,12 +164,14 @@ print_help() {
>  	echo "Useful patterns for test filtering are described in the API documentation."
>  }
>  
> -while getopts ":c:dhk:lPr:st:T:vx:Rnpb:m:" opt; do
> +while getopts ":c:dfhk:K:lPr:st:T:vx:Rnpb:m:" opt; do
>  	case $opt in
>  		c) COV_ARGS="$COV_ARGS --collect-code-cov --collect-script $OPTARG " ;;
>  		d) download_piglit; exit ;;
> +		f) IGT_FACTS="-f" ;;
>  		h) print_help; exit ;;
>  		k) IGT_KERNEL_TREE="$OPTARG" ;;
> +		K) KMEMLEAK="--kmemleak=$OPTARG" ;;
>  		l) LIST_TESTS="true" ;;
>  		P) COV_ARGS="$COV_ARGS --coverage-per-test"; COV_PER_TEST=1 ;;
>  		r) RESULTS="$OPTARG" ;;
> @@ -256,7 +262,7 @@ if [ "x$RESUME_RUN" != "x" ]; then
>  	execute_runner 1 $RESUME $RESUME_ARGS $COV_ARGS "$RESULTS"
>  else
>  	mkdir -p "$RESULTS"
> -	execute_runner 1 $RUNNER $RUN_ARGS -o -s "$RESULTS" $COV_ARGS $VERBOSE $FILTER --prune-mode $PRUNE_MODE
> +	execute_runner 1 $RUNNER $RUN_ARGS -o $IGT_FACTS $KMEMLEAK -s "$RESULTS" $COV_ARGS $VERBOSE $FILTER --prune-mode $PRUNE_MODE
>  fi
>  
>  if [ "$SUMMARY" = "html" ]; then

