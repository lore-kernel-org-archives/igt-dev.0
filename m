Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B96C4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 17:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF1B10EA0F;
	Thu, 15 Feb 2024 17:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jw9nLpiS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8923310E9B2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 17:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708017965; x=1739553965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SdTy0Oiy4DpZzQ2jfRG6RgbdV3dFDaCET0aSiv269c0=;
 b=Jw9nLpiSZ0bH2sf79QVfbF9Dyda1gfjQjN6dJJOH64anhk3XMYZf+3Qg
 iKXUWteA0oHbonz+I10FUjpLirThB/jCfSCvhCHd+QojJLwtjYw7kF51t
 abvCRhvmADuhLhketYz1yfkLlFbe/Vb7DX3r0NdLXCWxdjfm7QFcVB184
 VhJZ4mA3SjU+bcBxJ+sVS+G/r8561XNi8CBIUHCriqxYaxo/K2TOcA1K5
 S1X1pdh64pKG1jaBbzAbf6urpnXP3sH4xk6Papx47N6B9TP7Ql9wKavWw
 9W8GozK7eitp+HgdfpbR0xvqNOE6FFL1OpIxP7fgtI3gTcw8uFrsGQawi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13223623"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13223623"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:26:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3576404"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 09:26:03 -0800
Date: Thu, 15 Feb 2024 18:26:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 16/17] scripts/code_cov_parse_info: fix files statistics
Message-ID: <20240215172600.psr5svhw74va7apg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
 <d1311547b770751f807709e2c41fea23584b87d6.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d1311547b770751f807709e2c41fea23584b87d6.1707992666.git.mchehab@kernel.org>
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
On 2024-02-15 at 11:27:25 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> With fields rename at %record, the number of filtered files
> is not reflecting what it was actually there. Also, the was_used
> logic for json format was not parsing the same way as it used to
> be with info format.
> 
> Fix those.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/code_cov_parse_info | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index 3ce26e545aee..9d043a987f44 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -126,7 +126,6 @@ sub parse_json_gcov_v1($$)
>  	my $file = shift;
>  	my $json = shift;
>  
> -	my $was_used = 0;
>  	my $has_func = 0;
>  	my $ignore = 0;
>  
> @@ -149,6 +148,7 @@ sub parse_json_gcov_v1($$)
>  	my %cached;
>  	for my $file_ref (@{$json->{'files'}}) {
>  		my $source = $file_ref->{'file'};
> +		my $was_used = 0;
>  
>  		$files{$source} = 1;
>  		next if is_file_excluded($source);
> @@ -181,8 +181,6 @@ sub parse_json_gcov_v1($$)
>  				$was_used = 1;
>  			}
>  		}
> -		next if ($ignore_unused && !$was_used);
> -		$used_source{$source} = 1;
>  
>  		# Parse lines and branches
>  		for my $line_ref (@{$file_ref->{'lines'}}) {
> @@ -267,6 +265,7 @@ sub parse_json_gcov_v1($$)
>  				}
>  
>  				$all_branch{$source}{$where}{count} += $branch_ref->{'count'};
> +				$was_used = 1 if ($branch_ref->{'count'} > 0);
>  
>  				$i++;
>  			}
> @@ -274,6 +273,8 @@ sub parse_json_gcov_v1($$)
>  				@{$record{files}{$source}{line}{$ln}{branches}} = ();
>  			}
>  		}
> +		next if ($ignore_unused && !$was_used);
> +		$used_source{$source} = 1;
>  	}
>  
>  	# As the record was changed, we need to use a different format name
> @@ -285,7 +286,6 @@ sub parse_json_internal_format_v1($$)
>  	my $file = shift;
>  	my $json = shift;
>  
> -	my $was_used = 0;
>  	my $has_func = 0;
>  	my $ignore = 0;
>  	my %cached;
> @@ -305,6 +305,8 @@ sub parse_json_internal_format_v1($$)
>  
>  	for my $source (keys %{$json->{'files'}}) {
>  		$files{$source} = 1;
> +		my $was_used = 0;
> +
>  		next if is_file_excluded($source);
>  
>  		my $file_ref = \%{$json->{'files'}{$source}};
> @@ -332,8 +334,6 @@ sub parse_json_internal_format_v1($$)
>  				$was_used = 1;
>  			}
>  		}
> -		next if ($ignore_unused && !$was_used);
> -		$used_source{$source} = 1;
>  
>  		# Parse lines and branches
>  		for my $ln (keys %{$file_ref->{line}}) {
> @@ -400,12 +400,15 @@ sub parse_json_internal_format_v1($$)
>  				}
>  
>  				$all_branch{$source}{$where}{count} += $taken;
> +				$was_used = 1 if ($taken > 0);
>  				$i++;
>  			}
>  			if (!defined($record{files}{$source}{line}{$ln}{branches})) {
>  				@{$record{files}{$source}{line}{$ln}{branches}} = ();
>  			}
>  		}
> +		next if ($ignore_unused && !$was_used);
> +		$used_source{$source} = 1;
>  	}
>  }
>  
> @@ -876,7 +879,7 @@ sub gen_stats()
>  
>  	# per-file coverage stats
>  	$stats{"all_files"} = scalar keys(%files);
> -	$stats{"filtered_files"} = scalar keys(%record);
> +	$stats{"filtered_files"} = scalar keys(%{$record{files}});
>  	$stats{"used_files"} = scalar keys(%used_source);
>  }
>  
> -- 
> 2.43.0
> 
