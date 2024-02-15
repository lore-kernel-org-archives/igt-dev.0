Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB41C4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 16:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D854810E9FD;
	Thu, 15 Feb 2024 16:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuwNz5I/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DC910E9F9
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 16:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708016160; x=1739552160;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=V2RIPNSgKnEdhLZIMnyfUFYkTyBnYeo3eBjXPNFBp+U=;
 b=cuwNz5I/ebF1lqipB1obuqd7U1HCvXF1zWUOVMUNa8BEj+FR/UyHU5tI
 InsitxIJ5XZcWKhbyQ6pHofoyoGEfDwra1a++4tG/O1DTLsq/qyQwPHCX
 gjCQvkyJoKl9x+0vx5/blZ4fbUNmrHQizKsUJEPUbjVhPJ4ELumM/gpPO
 ZKftKQf04YHXG7cHHd+qWmWssl6U6pMhdTqVrJG8yG5IjcZQm61aVpcO5
 JC0xFbkPDTCWfGChvbOdCMDp6862B+OO4+LBWNK1MNh4+W3O1qZHUwBl2
 w7O+QIp2doDEGtVZHr8Bv1x3Lir7fzNMYGVTZkK2jZaOQAGjhHKelIecZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12833775"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12833775"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3910799"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 08:55:58 -0800
Date: Thu, 15 Feb 2024 17:55:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 07/17] scripts/code_cov_parse_info: use numberic sort for
 line numbers
Message-ID: <20240215165554.6dvpxysw6xdup3ny@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
 <4316061856b4316ccaac868c0b72f7a2b07266ca.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4316061856b4316ccaac868c0b72f7a2b07266ca.1707992666.git.mchehab@kernel.org>
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
On 2024-02-15 at 11:27:16 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>

Small nit:

[PATCH 07/17] scripts/code_cov_parse_info: use numberic sort for

s/numberic/numeric/

with that:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> The DA and BRDA information is originally numerically sorted.
> 
> Sort it the same way at the output data.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/code_cov_parse_info | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index d28217cc196d..56b27faee812 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -291,6 +291,21 @@ sub parse_info_data($)
>  	close IN or die;
>  }
>  
> +sub sort_where($$)
> +{
> +	my @a = split ",", shift;
> +	my @b = split ",", shift;
> +	my $ret;
> +
> +	$ret = $a[0] <=> $b[0];
> +	return $ret if ($ret);
> +
> +	$ret = $a[1] <=> $b[1];
> +	return $ret if ($ret);
> +
> +	return $a[2] <=> $b[2];
> +}
> +
>  sub write_filtered_file($)
>  {
>  	my $filter = shift;
> @@ -332,10 +347,10 @@ sub write_filtered_file($)
>  				}
>  			}
>  
> -			foreach my $ln(sort keys %{ $record{$source}{$func}{da} }) {
> +			foreach my $ln(sort { $a <=> $b } keys %{ $record{$source}{$func}{da} }) {
>  				$filtered .= "DA:$ln," . $record{$source}{$func}{da}{$ln} . "\n";
>  			}
> -			foreach my $where(sort keys %{ $record{$source}{$func}{brda} }) {
> +			foreach my $where(sort sort_where keys %{ $record{$source}{$func}{brda} }) {
>  				my $taken = $record{$source}{$func}{brda}{$where};
>  				$taken = "-" if (!$taken);
>  				$filtered .= "BRDA:$where,$taken\n";
> -- 
> 2.43.0
> 
