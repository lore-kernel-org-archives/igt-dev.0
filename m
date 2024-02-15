Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9915C4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 16:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACF610E9CF;
	Thu, 15 Feb 2024 16:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOYnJyvZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7939F10E9CD
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 16:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708015023; x=1739551023;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OEDl45R/Q0jpA96RgFkeVdsMI1/PDgwGMCHdnmR4Cb8=;
 b=YOYnJyvZcP9IauBL7K4uczFF308UIMYxA8RiTV+ZcT8+Bl3FBYuO4Way
 MAmR+Ph/yd9b5AfhjyDM4tzr4Ca5SMb2VNnxqA7XSd7NFtylzeIXGZpjq
 W/A9Wa4gT4HHdDGOrrmHLWJdtGlQjwyCP+cucEgJ0gyOTi2Q5AbA1exQe
 kd2lsoC+6XskOOhkNycvFLBKy8h3OG9yXw1mPR4PZNjk7OsJuu8qD+GaN
 mQCIYP1KAfBpI51rt/ek4ATqlVJfrKMUu+nrliDcmI7mhYGu3AKVTm3Sx
 pEsx/Bl82oE+y5k85vB7cMiYorDr9W+VIMpm3hjdtJCmPgZ5Gsm08z83I Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="19629261"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="19629261"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:36:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8223266"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 08:36:57 -0800
Date: Thu, 15 Feb 2024 17:36:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 04/17] scripts/code_cov_parse_info: add support for
 filtering Xe driver data
Message-ID: <20240215163654.eq2auml4nq3qj2jb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
 <39fdccf5425ca61282e90874a87138ad6a1f462c.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <39fdccf5425ca61282e90874a87138ad6a1f462c.1707992666.git.mchehab@kernel.org>
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
On 2024-02-15 at 11:27:13 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Just like it does for i915, add an option to get code coverage
> data from Xe driver.
> 
> For now, it won't be taking DRM core stuff into account; just
> the Xe driver code itself.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/code_cov_parse_info | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index ceea67a13d5a..f0fb5716a6ca 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -894,6 +894,7 @@ my $src_filters;
>  my $show_files;
>  my $show_lines;
>  my $only_i915;
> +my $only_xe;
>  my $only_drm;
>  
>  GetOptions(
> @@ -904,6 +905,7 @@ GetOptions(
>  	"verbose|v" => \$verbose,
>  	"ignore-unused|ignore_unused" => \$ignore_unused,
>  	"only-i915|only_i915" => \$only_i915,
> +	"only-xe|only_xe" => \$only_xe,
>  	"only-drm|only_drm" => \$only_drm,
>  	"func-filters|f=s" => \$func_filters,
>  	"include-func=s" => \@func_include_regexes,
> @@ -947,6 +949,14 @@ if ($only_i915) {
>  	push @src_include_regexes, "drm/vgem";
>  }
>  
> +if ($only_xe) {
> +	# Please keep in sync with the documentation
> +	push @src_exclude_regexes, "selftest";
> +	push @src_include_regexes, "drm/xe";
> +#	push @src_include_regexes, "drm/ttm";
> +#	push @src_include_regexes, "drm/vgem";
> +}
> +
>  if ($only_drm) {
>  	# Please keep in sync with the documentation
>  	push @src_exclude_regexes, "trace.*\.h\$";
> @@ -980,7 +990,9 @@ foreach my $f (@ARGV) {
>  
>  	if ($gen_report) {
>  		$f =~ s,.*/,,;
> +		$f =~ s/\.gz$//;
>  		$f =~ s/\.info$//;
> +		$f =~ s/\.json$//;
>  
>  		gen_stats();
>  
> @@ -1162,6 +1174,19 @@ Excluding files that match:
>  
>  	- selftest
>  
> +=item B<--only-xe> or B<--only_xe>
> +
> +Filters out C files and headers outside drm core and drm/i915.
> +
> +E. g. code coverage results will include only the files that that match
> +the following regular expressions:
> +
> +	- drm/xe/
> +
> +Excluding files that match:
> +
> +	- selftest
> +
>  =item B<--func-filters>  B<[filter's file]> or B<-f>  B<[filter's file]>
>  
>  Use a file containing regular expressions (regex) to filter functions.
> -- 
> 2.43.0
> 
