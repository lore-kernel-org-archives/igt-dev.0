Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5449410E34D
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Apr 2022 12:28:33 +0000 (UTC)
Message-ID: <9b72fcb4-1aed-f6d4-121c-9c959706df8c@intel.com>
Date: Mon, 11 Apr 2022 14:28:24 +0200
Content-Language: en-US
References: <20220404062642.378928-1-mauro.chehab@linux.intel.com>
 <20220404062642.378928-12-mauro.chehab@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <20220404062642.378928-12-mauro.chehab@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 11/12] code_cov_parse_info: add support for
 exclude filters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



On 04.04.2022 08:26, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
> It is interesting to have support not only for including, but
> also for excluding functions and files. Also, it is trivial to
> have support for it.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>   scripts/code_cov_parse_info | 71 +++++++++++++++++++++++++++++++++----
>   1 file changed, 65 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index 7987b0068e88..9624dc33468d 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -17,8 +17,10 @@ my %used_source;
>   my %record;
>   my %files;
>   my @func_regexes;
> +my @func_exclude_regexes;
>   my %test_names;
>   my @src_regexes;
> +my @src_exclude_regexes;
>   
>   my $verbose = 0;
>   my $ignore_unused = 0;
> @@ -28,10 +30,16 @@ my $skip_func = 0;
>   
>   sub is_function_excluded($)
>   {
> -	return 0 if (!@func_regexes);
> +	return 0 if (!@func_regexes && !@func_exclude_regexes);
>   
>   	my $func = shift;
>   
> +	foreach my $r (@func_exclude_regexes) {
> +		return 1 if ($func =~ m/$r/);
> +	}
> +
> +	return 0 if (!@func_regexes);
> +
>   	foreach my $r (@func_regexes) {
>   		return 0 if ($func =~ m/$r/);
>   	}
> @@ -64,9 +72,13 @@ sub filter_file($)
>   		}
>   	}
>   
> -	return 0 if (!@src_regexes);
> +	return 0 if (!@src_regexes && !@src_exclude_regexes);
>   
> -	my $func = shift;
> +	foreach my $r (@src_exclude_regexes) {
> +		return 1 if ($s =~ m/$r/);
> +	}
> +
> +	return 0 if (!@src_regexes);
>   
>   	foreach my $r (@src_regexes) {
>   		return 0 if ($s =~ m/$r/);
> @@ -482,7 +494,9 @@ my $filter;
>   my $help;
>   my $man;
>   my $func_filters;
> +my $func_exclude;
>   my $src_filters;
> +my $src_exclude;
>   my $show_files;
>   my $show_lines;
>   
> @@ -496,7 +510,9 @@ GetOptions(
>   	"only-i915|only_i915" => \$only_i915,
>   	"only-drm|only_drm" => \$only_drm,
>   	"func-filters|f=s" => \$func_filters,
> +	"exclude-func=s" => \$func_exclude,
>   	"source-filters|S=s" => \$src_filters,
> +	"exclude-source=s" => \$src_exclude,
>   	"show-files|show_files" => \$show_files,
>   	"show-lines|show_lines" => \$show_lines,
>   	"help" => \$help,
> @@ -539,7 +555,29 @@ if ($src_filters) {
>   	close IN;
>   }
>   
> -$ignore_unused = 1 if (@func_regexes);
> +if ($func_exclude) {
> +	open IN, $func_exclude or die "Can't open $func_exclude";
> +	while (<IN>) {
> +		s/^\s+//;
> +		s/\s+$//;
> +		next if (m/^#/ || m/^$/);
> +		push @func_exclude_regexes, qr /$_/;
> +	}
> +	close IN;
> +}
> +
> +if ($src_exclude) {
> +	open IN, $src_exclude or die "Can't open $src_exclude";
> +	while (<IN>) {
> +		s/^\s+//;
> +		s/\s+$//;
> +		next if (m/^#/ || m/^$/);
> +		push @src_exclude_regexes, qr /$_/;
> +	}
> +	close IN;
> +}
> +

Now there are four loops with the same purpose, I think it is time to 
put common code into one routine.

> +$ignore_unused = 1 if (@func_regexes || @func_exclude_regexes);
>   
>   if ($only_i915) {
>   	$filter_str = " non-i915 files";
> @@ -552,7 +590,7 @@ if ($only_drm) {
>   	$has_filter = 1;
>   }
>   
> -if (@func_regexes) {
> +if (@func_regexes || @func_exclude_regexes) {
>   	$filter_str .= "," if ($filter_str ne "");
>   	$filter_str .= " unmatched functions";
>   	foreach my $r (@func_regexes) {
> @@ -562,7 +600,7 @@ if (@func_regexes) {
>   	$has_filter = 1;
>   }
>   
> -if (@src_regexes) {
> +if (@src_regexes || @src_exclude_regexes) {
>   	$filter_str .= "," if ($filter_str ne "");
>   	$filter_str .= " unmatched source files";
>   	foreach my $r (@src_regexes) {
> @@ -708,11 +746,32 @@ the regular expressions contained at the B<[filter's file]>.
>   When this filter is used, B<--ignore-unused> will be automaticaly enabled,
>   as the final goal is to report per-function usage, and not per-file.
>   
> +When used with B<--exclude-func>, exclusions take precedence.
> +
> +=item B<--exclude-func>  B<[filter's file]>
> +
> +Exclude all functions that match the regular expressions contained
> +at the B<[filter's file]>.
> +
> +When this filter is used, B<--ignore-unused> will be automaticaly enabled,
> +as the final goal is to report per-function usage, and not per-file.
> +
> +When used with B<--func-filters>, exclusions take precedence.
> +
>   =item B<--source-filters>  B<[filter's file]> or B<-S>  B<[filter's file]>
>   
>   Takes into account only the code coverage for the source files that match
>   the regular expressions contained at the B<[filter's file]>.
>   
> +When used with B<--exclude-source>, exclusions take precedence.
> +
> +=item B<--exclude-source> B<[filter's file]>
> +
> +Exclude all files that match the regular expressions contained
> +at the B<[filter's file]>.
> +
> +When used with B<--source-filters>, exclusions take precedence.
> +

Now there are two filtering options per functions and two per files.
Wouldn't be better to squash include/exclude rules into one param in 
'rsync like' patterns:
+ include_pattern
- exclude_pattern
...
This way it would be easier to manage filters - less options, less 
helper files.

One could think about squashing also filters for function and files, but 
this I am not sure.


Regards
Andrzej


>   =item B<--ignore-unused> or B<--ignore_unused>
>   
>   Filters out unused C files and headers from the code coverage results.
