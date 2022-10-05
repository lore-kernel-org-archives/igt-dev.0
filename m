Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E6910E77B
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 20:05:45 +0000 (UTC)
Date: Wed, 5 Oct 2022 22:05:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yz3jhYF/vpldk8Xu@kamilkon-desk1>
References: <cover.1663836123.git.mchehab@kernel.org>
 <9ea1e81b3a95856eff52f159aadb02e9b51fc1c3.1663836123.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9ea1e81b3a95856eff52f159aadb02e9b51fc1c3.1663836123.git.mchehab@kernel.org>
Subject: Re: [igt-dev] [PATCH 4/6] scripts/code_cov_parse_info: Fix
 indentation at the output html file
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

Hi Mauro,

On 2022-09-22 at 10:46:16 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The indentation is not relevant for the output, but it makes easier
> when debugging issues at the produced file. So, fix it.
--------------------------------------------- ^^^^^^^^^^
Please drop this from commit message,
rest looks good so

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 0/6] at: https://lore.kernel.org/all/cover.1663836123.git.mchehab@kernel.org/
> 
>  scripts/code_cov_parse_info | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index ef26192f2456..e8bac730e88b 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -650,7 +650,7 @@ sub generate_report($)
>  	} else {
>  		print OUT "    <td>N. A.</td>\n";
>  	}
> -	print OUT "  <td>" . $stats{"func_count"} . "</td>";
> +	print OUT "    <td>" . $stats{"func_count"} . "</td>\n";
>  	print OUT "  </tr><tr>\n";
>  
>  	print OUT "    <td><b>Branches</b></td>\n";
> @@ -671,7 +671,7 @@ sub generate_report($)
>  	} else {
>  		print OUT "    <td>N. A.</td>\n";
>  	}
> -	print OUT "  <td>" . $stats{"branch_count"} . "</td>";
> +	print OUT "    <td>" . $stats{"branch_count"} . "</td>\n";
>  	print OUT "  </tr><tr>\n";
>  
>  	print OUT "    <td><b>Lines</b></td>\n";
> @@ -693,7 +693,7 @@ sub generate_report($)
>  	} else {
>  		print OUT "    <td>N. A.</td>\n";
>  	}
> -	print OUT "  <td>" . $stats{"line_count"} . "</td>";
> +	print OUT "    <td>" . $stats{"line_count"} . "</td>\n";
>  
>  	# If there are more than one tests per file, report them
>  	my $total = scalar(keys %test_names);
> -- 
> 2.37.2
> 
