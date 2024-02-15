Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6036AC4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 16:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B139010E9C9;
	Thu, 15 Feb 2024 16:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmH1Qa/j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913D410E9C9
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 16:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708014435; x=1739550435;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9IFwkIGQueMw39xegnx3Uw76HJ2iwMY54AS95K3NoRM=;
 b=hmH1Qa/jZF9x1Dq1j9KMmwdBseIDCbUtgfPolJuDWhL5ZQ1bDWV+DRBN
 AH/aj9aWqxMUX+F98ux7FWgxQjMf5u7trX0iR42AmCfOfzne0lXhAs9Ax
 JJIKx8kH8CbiUDla7670N3ZfRNCbI23U11/DyZxOoRim0NfTz1tzVRLG+
 6RICK7xdg2IQm8j2J5CuoGLyP/tWFCbfhJabtbjNMifcrdIs41sd/xP1G
 W1p+VS/zOYeifeCFT5l+jdp4U1fXJhfyDJar844ng+gXHZK8t0j7OU8f8
 V9OFNkzAxwktIBkAuUYCznNooZuaUi0GiuMixTkoK31g88MtgvOEmeZ0h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12660845"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12660845"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:27:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3741532"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 08:27:08 -0800
Date: Thu, 15 Feb 2024 17:27:05 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 02/17] scripts/code_cov_parse_info: do some renames to
 make it more coherent
Message-ID: <20240215162705.shsjwftylhq42ap5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
 <765b6e2a3c28d1387552ec6e3dac2b870da3ad3d.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <765b6e2a3c28d1387552ec6e3dac2b870da3ad3d.1707992666.git.mchehab@kernel.org>
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
On 2024-02-15 at 11:27:11 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Let the regex array to be clearer about include regexes, and
> coherent with exclude ones.
> 
> While here, also rename the file exclude check function, to
> have a name closer to its functions counterpart.
> 
> No functional changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/code_cov_parse_info | 38 ++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index 1498bd09cdba..d3739211b68a 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -18,10 +18,10 @@ my %all_line;
>  my %used_source;
>  my %record;
>  my %files;
> -my @func_regexes;
> +my @func_include_regexes;
>  my @func_exclude_regexes;
>  my %test_names;
> -my @src_regexes;
> +my @src_include_regexes;
>  my @src_exclude_regexes;
>  
>  my $verbose = 0;
> @@ -30,7 +30,7 @@ my $skip_func = 0;
>  
>  sub is_function_excluded($)
>  {
> -	return 0 if (!@func_regexes && !@func_exclude_regexes);
> +	return 0 if (!@func_include_regexes && !@func_exclude_regexes);
>  
>  	my $func = shift;
>  
> @@ -38,28 +38,28 @@ sub is_function_excluded($)
>  		return 1 if ($func =~ m/$r/);
>  	}
>  
> -	return 0 if (!@func_regexes);
> +	return 0 if (!@func_include_regexes);
>  
> -	foreach my $r (@func_regexes) {
> +	foreach my $r (@func_include_regexes) {
>  		return 0 if ($func =~ m/$r/);
>  	}
>  
>  	return 1;
>  }
>  
> -sub filter_file($)
> +sub is_file_excluded($)
>  {
>  	my $s = shift;
>  
> -	return 0 if (!@src_regexes && !@src_exclude_regexes);
> +	return 0 if (!@src_include_regexes && !@src_exclude_regexes);
>  
>  	foreach my $r (@src_exclude_regexes) {
>  		return 1 if ($s =~ m/$r/);
>  	}
>  
> -	return 0 if (!@src_regexes);
> +	return 0 if (!@src_include_regexes);
>  
> -	foreach my $r (@src_regexes) {
> +	foreach my $r (@src_include_regexes) {
>  		return 0 if ($s =~ m/$r/);
>  	}
>  
> @@ -107,7 +107,7 @@ sub parse_info_data($)
>  			$files{$source} = 1;
>  
>  			# Just ignore files explictly set as such
> -			$ignore = filter_file($source);
> +			$ignore = is_file_excluded($source);
>  			next;
>  		}
>  
> @@ -189,7 +189,7 @@ sub parse_info_data($)
>  
>  		# Ignore DA/BRDA that aren't associated with functions
>  		# Those are present on header files (maybe defines?)
> -		next if (@func_regexes && !$has_func);
> +		next if (@func_include_regexes && !$has_func);
>  
>  		# FNF:<number of functions found>
>  		if (m/^FNF:(-?\d+)/) {
> @@ -899,10 +899,10 @@ GetOptions(
>  	"only-i915|only_i915" => \$only_i915,
>  	"only-drm|only_drm" => \$only_drm,
>  	"func-filters|f=s" => \$func_filters,
> -	"include-func=s" => \@func_regexes,
> +	"include-func=s" => \@func_include_regexes,
>  	"exclude-func=s" => \@func_exclude_regexes,
>  	"source-filters|S=s" => \$src_filters,
> -	"include-source=s" => \@src_regexes,
> +	"include-source=s" => \@src_include_regexes,
>  	"exclude-source=s" => \@src_exclude_regexes,
>  	"show-files|show_files" => \$show_files,
>  	"show-lines|show_lines" => \$show_lines,
> @@ -935,9 +935,9 @@ my $str;
>  if ($only_i915) {
>  	# Please keep in sync with the documentation
>  	push @src_exclude_regexes, "selftest";
> -	push @src_regexes, "drm/i915";
> -	push @src_regexes, "drm/ttm";
> -	push @src_regexes, "drm/vgem";
> +	push @src_include_regexes, "drm/i915";
> +	push @src_include_regexes, "drm/ttm";
> +	push @src_include_regexes, "drm/vgem";
>  }
>  
>  if ($only_drm) {
> @@ -946,21 +946,21 @@ if ($only_drm) {
>  	push @src_exclude_regexes, "^/drm/";
>  }
>  
> -$str = open_filter_file($func_filters, \@func_regexes, \@func_exclude_regexes);
> +$str = open_filter_file($func_filters, \@func_include_regexes, \@func_exclude_regexes);
>  if ($str) {
>  	$filter_str .= "," if ($filter_str ne "");
>  	$filter_str .= " function regex ($str)";
>  	$has_filter = 1;
>  }
>  
> -$str = open_filter_file($src_filters, \@src_regexes, \@src_exclude_regexes);
> +$str = open_filter_file($src_filters, \@src_include_regexes, \@src_exclude_regexes);
>  if ($str) {
>  	$filter_str .= "," if ($filter_str ne "");
>  	$filter_str .= " source regex ($str)";
>  	$has_filter = 1;
>  }
>  
> -$ignore_unused = 1 if (@func_regexes || @func_exclude_regexes);
> +$ignore_unused = 1 if (@func_include_regexes || @func_exclude_regexes);
>  
>  if ($ignore_unused) {
>  	$filter_str .= "," if ($filter_str ne "");
> -- 
> 2.43.0
> 
