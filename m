Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE8910EE63
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jun 2022 16:11:47 +0000 (UTC)
Date: Wed, 1 Jun 2022 18:11:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YpePvd0QRT19fWPN@kamilkon-desk1>
References: <801b3655e69a1cdcd9b50f0e0e950aabbf72fe16.1653035775.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <801b3655e69a1cdcd9b50f0e0e950aabbf72fe16.1653035775.git.mchehab@kernel.org>
Subject: Re: [igt-dev] [PATCH] code_cov_parse_info: output filters at the
 html report
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-05-20 at 10:36:15 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Add a line after the code coverage summary printing the filters
> that were used to produce the results, if any.
> 
> This is important specially when multiple filters could be used
> to produce different reports.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/code_cov_parse_info | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index 77291eb69405..09f9aba5760b 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -538,8 +538,9 @@ my $html_prolog;
>  my $html_epilog;
>  my %report;
>  
> -sub generate_report()
> +sub generate_report($)
>  {
> +	my $filter_str = shift;
>  	my $percent;
>  	my $prolog = "";
>  	my $epilog = "";
> @@ -715,6 +716,12 @@ sub generate_report()
>  	}
>  	print OUT "  </tr>\n</table><p/>\n\n";
>  
> +	if ($filter_str ne "") {
> +		printf OUT "<p>Filters: %s.</p>\n", $filter_str;
> +	} else {
> +		print OUT "<p>(unfiltered results)</p>";
> +	}
> +
>  	if ($total > 1) {
>  		print OUT "<h2>Tests coverage</h2>\n";
>  
> @@ -904,8 +911,10 @@ foreach my $f (@ARGV) {
>  	}
>  }
>  
> +$filter_str =~ s/(.*),/$1 and/ if ($filter_str ne "");
> +
>  if ($gen_report) {
> -	generate_report();
> +	generate_report($filter_str);
>  	exit 0;
>  }
>  
> @@ -920,7 +929,6 @@ print_summary() if ($stat);
>  if ($has_filter) {
>  	my $percent = 100. * $stats{"used_files"} / $stats{"all_files"};
>  
> -	$filter_str =~ s/(.*),/$1 and/;
>  	printf "Filters......:%s.\n", $filter_str;
>  	printf "Source files.: %.2f%% (%d of %d total)",
>  		$percent, $stats{"used_files"}, $stats{"all_files"};
> -- 
> 2.36.1
> 

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
