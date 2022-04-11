Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723FE10E05E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Apr 2022 11:57:36 +0000 (UTC)
Message-ID: <5bcacce8-8faa-8ff5-6a4c-71e85c2d84e2@intel.com>
Date: Mon, 11 Apr 2022 13:57:27 +0200
Content-Language: en-US
References: <20220404062642.378928-1-mauro.chehab@linux.intel.com>
 <20220404062642.378928-11-mauro.chehab@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <20220404062642.378928-11-mauro.chehab@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 10/12] code_cov_parse_info: fix --show-lines
 logic
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
> print_code_coverage function needs to first read the number
> of lines and then simplify the $file by removing its prefix.
>
> Without that, it ends trying to access an uninitiated value,
> leading to warnings and not doing what's expected.
>
> While here, also check if the ln data is valid, just in case
> the .info file might have some FN field(s) missing.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>   scripts/code_cov_parse_info | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index c8284a297b33..7987b0068e88 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -378,8 +378,13 @@ sub print_code_coverage($$$)
>   			}
>   
>   			if ($show_lines) {
> +				my $ln = $all_func{$func}{$file}->{ln};
>   				$file =~ s,$prefix,linux/,;
> -				$name = "$func() from $file:" . $all_func{$func}{$file}->{ln};
> +				if ($ln) {
> +					$name = "$func() from $file:" . $ln;
> +				} else {
> +					$name = "$func() from $file";
> +				}

$name = "$func() from $file";

$name .= ":" . $ln if ($ln);

Would be more compact.

Anyway:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


>   			} elsif (scalar @keys > 1) {
>   				$file =~ s,$prefix,linux/,;
>   				$name = "$func() from $file:";
