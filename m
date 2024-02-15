Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FB2C4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 16:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F81A10E3AD;
	Thu, 15 Feb 2024 16:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgft8o0B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F1B10E3AD
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 16:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708015214; x=1739551214;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qnNJaRTtvGLVHPuUUfUmtN9VuUsAIdJ0RSkgRXP1zW4=;
 b=jgft8o0BV3qBdRHc17VzPAl6S2nDfYOt+Ilti0NDvZf5EqEQfA30H2Nb
 lCeHBqR4cHuEy5CZHyyKuydnVFswvWO4v1wXGNWp/ODv3+fPPd+yErOs7
 mpGibuB55B1czfDQN9f7+Ol9IjheS6T0XNCr+4gJGoefIo1Glhg3EBb45
 Wks+LRA+org/gslJNIPKlq/xnp5qB/cRXxMsxDZaMph5iruSBy+MtV7yc
 oDgmaohttZrgG+qy22a3gahs+4fgSmCueeFwKTM4tc4Wf3a+Wl6GNi6fn
 dSZL2uzaqHf2yTHdJCdspwfXFtwsrOmTo6l9lPloUGtCQJlhodSGhuwiF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="27567834"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="27567834"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:40:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3567092"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 08:40:13 -0800
Date: Thu, 15 Feb 2024 17:40:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 05/17] scripts/code_cov_parse_info: add a tool to analyze
 branch coverage
Message-ID: <20240215164010.p3oqkyyg6ajj3k5x@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
 <01e104b16ff508affa4a018cecd034806f5030e1.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <01e104b16ff508affa4a018cecd034806f5030e1.1707992666.git.mchehab@kernel.org>
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
On 2024-02-15 at 11:27:14 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Branch coverage is trickier than functions. Add a tool that displays
> the starting line that it is not being covered, together with up
> to 10 context lines before.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/code_cov_parse_info | 86 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index f0fb5716a6ca..1be7fddf3f3e 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -879,6 +879,77 @@ sub generate_report($)
>  	close OUT;
>  }
>  
> +sub check_source_branches()
> +{
> +	foreach my $source (sort keys(%all_branch)) {
> +		next if (!$used_source{$source});
> +		next if (is_file_excluded($source));
> +
> +		my @lines;
> +		foreach my $where (sort keys %{$all_branch{$source}}) {
> +			my $taken = $all_branch{$source}{$where};
> +			next if ($taken > 0);
> +
> +			next if !($where =~ m/^(-?\d+),(-?\d+),(-?\d+)/);
> +
> +			my ($ln, $block, $branch, $ctx_lines);
> +			$ln = $1;
> +			$block = $2;
> +			$branch = $3;
> +
> +			if (!@lines) {
> +				open IN, "$source" || die "File $source not found. Can't check branches\n";
> +				@lines = <IN>;
> +				close IN;
> +			}
> +
> +			if ($ln >= $#lines) {
> +				die "$source:$ln line is bigger than the number of lines at the file ($#lines lines)\n";
> +				return;
> +			}
> +
> +			my $func = $all_branch{$source}{$where}{func};
> +			my $func_ln = $all_branch{$source}{$where}{func_ln};
> +
> +			print "Branch $source:$ln, ";
> +			if ($func) {
> +				if ($func_ln) {
> +					print "func: $func, ";
> +				} else {
> +					print "func: $func:$func_ln, ";
> +				}
> +			}
> +			print "block $block, branch $branch not taken:\n";
> +
> +			if ($func_ln) {
> +				$ctx_lines = $ln - $func_ln;
> +			} else {
> +				$ctx_lines = 10;
> +			}
> +
> +
> +			# Search for up to $ctx_lines before the occurrence
> +			my $context = "";
> +			my $has_if;
> +			$ln-- if ($ln > 0);
> +			my $delim = "->";
> +			for (my $if_ln = $ln; $if_ln >= 0 && (($ln - $if_ln) < $ctx_lines); $if_ln--) {
> +				$context = "$if_ln$delim\t$lines[$if_ln]" . $context;
> +				$delim = "";
> +				if ($lines[$if_ln] =~ m/(\bif\b|#if)/) {
> +					$has_if = 1;
> +					last;
> +				}
> +			}
> +			if ($has_if) {
> +				print $context;
> +			} else {
> +				print "$ln->\t$lines[$ln]";
> +			}
> +		}
> +	}
> +}
> +
>  #
>  # Argument handling
>  #
> @@ -896,6 +967,7 @@ my $show_lines;
>  my $only_i915;
>  my $only_xe;
>  my $only_drm;
> +my $check_branches;
>  
>  GetOptions(
>  	"print-coverage|print_coverage|print|p" => \$print_used,
> @@ -916,6 +988,7 @@ GetOptions(
>  	"show-files|show_files" => \$show_files,
>  	"show-lines|show_lines" => \$show_lines,
>  	"report|r=s" => \$gen_report,
> +	"check-branches" => \$check_branches,
>  	"css-file|css|c=s" => \$css_file,
>  	"title|t=s" => \$title,
>  	"html-prolog|prolog=s" => \$html_prolog,
> @@ -933,7 +1006,7 @@ if ($#ARGV < 0) {
>  }
>  
>  # At least one action should be specified
> -pod2usage(1) if (!$print_used && !$filter && !$stat && !$print_unused && !$gen_report);
> +pod2usage(1) if (!$print_used && !$filter && !$stat && !$print_unused && !$gen_report && !$check_branches);
>  
>  pod2usage(1) if ($gen_report && ($print_used || $filter || $stat || $print_unused));
>  
> @@ -1024,6 +1097,11 @@ if ($gen_report) {
>  
>  gen_stats();
>  
> +
> +if ($check_branches) {
> +	check_source_branches();
> +}
> +
>  die "Nothing counted. Wrong input files?" if (!$stats{"all_files"});
>  
>  print_code_coverage($print_used, $print_unused, $show_lines);
> @@ -1294,6 +1372,12 @@ This option is automaticaly enabled when B<--func-filters> is used.
>  Shows the list of files that were used to produce the code coverage
>  results.
>  
> +=item B<--check-branches>
> +
> +Checks at the Linux Kernel source files what's the contents of the
> +branches that weren't taken. The directory should match what's
> +stored inside the info files.
> +
>  =item B<--verbose> or B<-v>
>  
>  Prints the name of each parsed file.
> -- 
> 2.43.0
> 
