Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CF8C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 15:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C2410F06E;
	Wed, 12 Aug 2026 15:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdNQ8+XN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5018D10F06E
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786549588; x=1818085588;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8pn7cJJDrSxc6JR+hDAcZ3eR1o2v6eMytFjeMNH+5lA=;
 b=cdNQ8+XNhp+5/S1ZoqpwVVGZKGES4b6yiwg5kl6/YLw60JlyBwg19uul
 bqTOgIHnf6H2SqiDIQj5VL81pGxe20HsetaIw3erir/eawutHmBO65g1d
 wD7bZuwGWp5ciuisuBkRQ4jW/SVCiQrsjWeGOETEvyiuMZlIL49tjlODv
 yQZJhqqKxRY+CtbbyCaSXD5QP4+tOEOplV2+K+voDALkSr5Y7ZVWgUOZH
 ikK+QdWOgrRohwfyL4wyJ38Ur1evw5krUvaogt544QKnVfzz/jZrGSLpm
 zr6CRYqY7reGLKv6BqCHdJxsqI7gr7z6WTsRAQ6AX6/hwPum2UvvMayVy Q==;
X-CSE-ConnectionGUID: SoK6GpTAT4KVAPpdbnibsw==
X-CSE-MsgGUID: 8DhL2yP2TO6y6rt7WS4/WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98258067"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="98258067"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 08:46:28 -0700
X-CSE-ConnectionGUID: mWpnxE2mSYm6BvWwtLQSvA==
X-CSE-MsgGUID: mdsgq7R+Tv+M4lBJtZMfKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="267943811"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 08:46:27 -0700
Date: Wed, 12 Aug 2026 17:46:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Tahvanainen, Jari" <jari.tahvanainen@intel.com>
Cc: igt-dev@lists.freedesktop.org, mchehab@kernel.org
Subject: Re: [PATCH 1/2] scripts/code_cov_parse_info: add support for
 lcov/geninfo >1.14 formats
Message-ID: <20260812154624.aqr3kryx5kj3osyu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Tahvanainen, Jari" <jari.tahvanainen@intel.com>,
 igt-dev@lists.freedesktop.org, mchehab@kernel.org
References: <20260811133411.720679-1-jari.tahvanainen@intel.com>
 <20260811133411.720679-2-jari.tahvanainen@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260811133411.720679-2-jari.tahvanainen@intel.com>
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

Hi Jari,
On 2026-08-11 at 16:34:10 +0300, Tahvanainen, Jari wrote:
> Add support changes related function coverage data format within .info
> files produced by the recent compiler/toolchain versions.
> 
> Current assumed/supported .info file is for lcov/geninfo 1.14.
>    FN:<line number of function start>,<function name>
>    FNDA:<execution count>,<function name>
>    FNF:<number of functions found>
>    FNH:<number of function hit>
> 
> There is change caused by gcc 9 tool chain, requiring lcov/geninfo 2.0.
>    https://manpages.ubuntu.com/manpages/noble/man1/geninfo.1.html
>    FN:<line number of function start>,[<function end>,]<function name>
>    The 'end' line number is optional, and is generated only if the 
>    compiler/toolchain version is recent enough to generate the data.
> 
>  The format of the function coverage data has changed from LCOV 2.2 onward.
>    https://manpages.ubuntu.com/manpages/questing/man1/geninfo.1.html
>    First, the leader:
>    FNL:<index>,<line number of function start>[,line nbr of function end>]
>    Then the aliases of the function; there will be at least one alias.
>    All aliases of a particular function share the same index.
>    FNA:<index>,<execution count>,<name>
>    The now-obsolete function data format is:
>    FN:<line number of function start>,[<function end>,]<function name>
> 
> Signed-off-by: "Tahvanainen, Jari" <jari.tahvanainen@intel.com>

please configure your git to send and format your name:

Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>

so it will match your name in From:
(or add correct From: as a first line of commit description).

With this you can add my acked-by to this series.
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  scripts/code_cov_parse_info | 106 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 100 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index a3fef1d59..97f325c85 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -37,6 +37,10 @@ my $verbose = 0;
>  my $ignore_unused = 0;
>  my $skip_func = 0;
>  
> +my $lcov_version = eval {
> +	my $var = `lcov --version|grep -Eo '[0-9]+(\.[0-9]+)'|head -1`;
> +	$var;
> +};
>  my $has_json_support = eval {
>  	require Cpanel::JSON::XS;
>  	Cpanel::JSON::XS->import(qw(decode_json));
> @@ -459,6 +463,7 @@ sub read_info($)
>  	my $ignore = 0;
>  	my $source = $before_sf;
>  	my $func = $before_sf;
> +	my $alias = $before_sf;
>  	my $cur_test = "";
>  	my %cached;
>  
> @@ -526,13 +531,56 @@ sub read_info($)
>  
>  		next if ($ignore);
>  
> +		# Function coverage, the leader
> +		# FN:<function index>,<line number of the function start><line number of the function end>
> +		# this seems to be format for lcov/geninfo package 2.3
> +		if (m/^FNL:(-?\d+),(-?\d+),(-?\d+)/) {
> +			my $ln = $2;
> +			my $end_ln = $3;
> +
> +			$func = $1;
> +			$has_func = 1;
> +
> +			if (is_function_excluded($func)) {
> +				$skip_func = 1;
> +				next;
> +			}
> +
> +			$skip_func = 0;
> +
> +			$record{files}{$source}{func}{$func}{start_line} = $ln;
> +			$record{files}{$source}{func}{$func}{end_line} = $end_ln;
> +			$all_func{$func}{$source}->{ln} = $ln;
> +			next;
> +		}
>  		# Function coverage
> +		# FN:<line number of function start>,<line number of the function end><function name>
> +		# this seems to be format for lcov/geninfo 2.0, obsoleted on 2.3
> +		elsif (m/^FN:(-?\d+),(-?\d+),(\w+)/) {
> +			my $ln = $1;
> +			my $end_ln = $2;
> +
> +			$func = $3;
> +			$has_func = 1;
> +
> +			if (is_function_excluded($func)) {
> +				$skip_func = 1;
> +				next;
> +			}
> +
> +			$skip_func = 0;
>  
> +			$record{files}{$source}{func}{$func}{start_line} = $ln;
> +			$record{files}{$source}{func}{$func}{end_line} = $end_ln;
> +			$all_func{$func}{$source}->{ln} = $ln;
> +			next;
> +		}
>  		# FN:<line number of function start>,<function name>
>  		# Note: /w+ intentionally removes IPA gcc-optimization names, as
>  		# this is more related to branch coverage
> -		if (m/^FN:(-?\d+),(\w+)/) {
> +		elsif (m/^FN:(-?\d+),(\w+)/) {
>  			my $ln = $1;
> +			my $start_ln = $2;
>  
>  			$func = $2;
>  			$has_func = 1;
> @@ -549,11 +597,38 @@ sub read_info($)
>  			next;
>  		}
>  
> -		# Parse functions that were actually used
> +		# Parse functions that were actually used (package version >2.0)
> +		# FNA:<function index>,<execution count><function name>
> +		if (m/^FNA:(-?\d+),(-?\d+),(\w+)/) {
> +			my $count = $2;
> +
> +			# Negative gcov results are possible, as reported at:
> +			# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67937
> +			# Lcov ignores those. So, let's do the same here.
> +			next if ($count <= 0);
> +
> +			$func = $1;
> +			$alias = $3;
> +			$has_func = 1;
> +
> +			if (is_function_excluded($alias)) {
> +				$skip_func = 1;
> +				next;
> +			}
> +
> +			$skip_func = 0;
> +			$was_used = 1;
> +
> +			$record{files}{$source}{func}{$func}{execution_count} += $count;
> +			$record{files}{$source}{func}{$func}{alias} = $alias;
> +			$used_func{$func}{$source}->{count} += $count;
> +			next;
> +		}
> +		# Parse functions that were actually used (package version <=2.0)
>  		# FNDA:<execution count>,<function name>
>  		# Note: /w+ intentionally removes IPA gcc-optimization names, as
>  		# this is more related to branch coverage
> -		if (m/^FNDA:(-?\d+),(\w+)/) {
> +		elsif (m/^FNDA:(-?\d+),(\w+)/) {
>  			my $count = $1;
>  
>  			# Negative gcov results are possible, as reported at:
> @@ -745,6 +820,7 @@ sub write_info_file($)
>  	# Fills $data with the contents to be stored at the file
>  	foreach my $source(sort keys %{$record{files}}) {
>  		next if (!$used_source{$source});
> +		next if is_file_excluded($source);
>  
>  		if ($source ne $before_sf) {
>  			$data .= "SF:$source\n";
> @@ -754,11 +830,29 @@ sub write_info_file($)
>  			if ($func ne $before_sf) {
>  				my $fn;
>  				my $fnda;
> -
> -				if (defined($record{files}{$source}{func}{$func}{start_line})) {
> +				#lcov/geninfo 2.3 (>2.0) has additional leader
> +				#https://manpages.ubuntu.com/manpages/questing/man1/geninfo.1.html
> +				if ($lcov_version>2.0) {
> +					$data .= "FNL:$func," . $record{files}{$source}{func}{$func}{start_line} . "," . $record{files}{$source}{func}{$func}{end_line} . "\n";
> +				}
> +				#lcov/geninfo 2.0 (>1.14) has also end_line defined for FN
> +				#https://manpages.ubuntu.com/manpages/noble/man1/geninfo.1.html
> +				elsif ($lcov_version==2.0) {
> +					$data .= "FN:" . $record{files}{$source}{func}{$func}{start_line} . "," . $record{files}{$source}{func}{$func}{end_line} . ",$func\n";
> +				}
> +				#lcov/geninfo 1.14
> +				elsif (defined($record{files}{$source}{func}{$func}{start_line})) {
>  					$data .= "FN:" . $record{files}{$source}{func}{$func}{start_line} . ",$func\n";
>  				}
> -				if (defined($record{files}{$source}{func}{$func}{execution_count})) {
> +				#lcov/geninfo 2.3 (>2.0) has the function covered as FNA line
> +				#https://manpages.ubuntu.com/manpages/questing/man1/geninfo.1.html
> +				if ($lcov_version>2.0) {
> +					if ($record{files}{$source}{func}{$func}{alias}) {
> +						$data .= "FNA:$func," . $record{files}{$source}{func}{$func}{execution_count} . "," . $record{files}{$source}{func}{$func}{alias} . "\n";
> +					}
> +				}
> +				#lcov/geninfo 1.14 has the function covered as FNDA line
> +				elsif (defined($record{files}{$source}{func}{$func}{execution_count})) {
>  					$data .= "FNDA:" . $record{files}{$source}{func}{$func}{execution_count} . ",$func\n";
>  				}
>  
> -- 
> 2.43.0
> 
