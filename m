Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F51C48BC4
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 17:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51D210E5B9;
	Thu, 15 Feb 2024 17:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgJVeN3h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025DA10EA19
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 17:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708017493; x=1739553493;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d+bbu5vRbx0PjIFanWucmBlRGbWJPTpXjzQD75QO1vM=;
 b=YgJVeN3hb7rqCGY/D0iBQPDsIUcNh6CYwhsSSCt9EBUFQwMoHNJJCbAm
 2i5GMWRtDfx9XbJqsECs0/3+SXpdsQTahQgH60eR4MFjfdKBTODG2mG43
 9F/UpNEGNuoSkBShxkxz/5c+FFVkUcwlev3v+3lRpvnqvQsGg5z+T14b0
 Qoa/6fgOsjpeP3Cp1U4d2XXAnTppHIudClxNEVxeNawIZY0n5X2cd2q1C
 kGVzVbXkssotLQlt0KLCU5YQpjORbl3taVlRcr9YBAkvtfAIFcc50FApe
 odWiYTrBlX9fLsLg2Z/0A3gDWZCGd21lQtSyOzt6mBzsY9IH6klxmri5t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="1992163"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="1992163"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912197171"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="912197171"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 09:18:11 -0800
Date: Thu, 15 Feb 2024 18:18:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 12/17] scripts/code_cov_parse_info: add support for
 compressed files
Message-ID: <20240215171808.s4lxhyexpplavuuh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
 <27bdbf06fc32030b895b2276393af4138c7ae8e8.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <27bdbf06fc32030b895b2276393af4138c7ae8e8.1707992666.git.mchehab@kernel.org>
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
On 2024-02-15 at 11:27:21 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Code coverage files are big. Add support for read/write gzipped
> files, in order to save I/O, and, depending on the disk, speeding
> up the tool.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/code_cov_parse_info | 56 ++++++++++++++++++++++++++-----------
>  1 file changed, 40 insertions(+), 16 deletions(-)
>  mode change 100644 => 100755 scripts/code_cov_parse_info
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> old mode 100644
> new mode 100755
> index 8180b9c1f82e..50d10a30d7f9
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -6,6 +6,8 @@ use Getopt::Long;
>  BEGIN { $Pod::Usage::Formatter = 'Pod::Text::Termcap'; }
>  use Pod::Usage;
>  use Pod::Man;
> +use IO::File;
> +use IO::Zlib;
>  
>  my $prefix = qr ".*?(linux)\w*/";
>  
> @@ -341,8 +343,14 @@ sub read_json($)
>  	}
>  
>  	# Read JSON data
> -	open IN, $file or die "can't open $file";
> -	while (<IN>) {
> +	my $fh;
> +	if ($file =~ m/\.gz$/) {
> +		$fh = IO::Zlib->new($file, "rb") or die "can't open $file";
> +	} else {
> +		$fh = IO::File->new($file) or die "can't open $file";
> +	}
> +	print "reading $file...\n" if ($verbose);
> +	while (<$fh>) {
>  		my $json = eval {
>  			Cpanel::JSON::XS::decode_json($_)
>  		};
> @@ -362,7 +370,7 @@ sub read_json($)
>  			die "Unknown JSON format on file $file\n";
>  		}
>  	}
> -	close IN;
> +	$fh->close() or die "Failed to close file $file";
>  }
>  
>  sub read_info($)
> @@ -377,11 +385,16 @@ sub read_info($)
>  
>  	# First step: parse data
>  
> -	print "reading $file...\n" if ($verbose);
> -	open IN, $file or die "can't open $file";
>  	# For details on .info file format, see "man geninfo"
>  	# http://ltp.sourceforge.net/coverage/lcov/geninfo.1.php
> -	while (<IN>) {
> +	my $fh;
> +	if ($file =~ m/\.gz$/) {
> +		$fh = IO::Zlib->new($file, "rb") or die "can't open $file";
> +	} else {
> +		$fh = IO::File->new($file) or die "can't open $file";
> +	}
> +	print "reading $file...\n" if ($verbose);
> +	while (<$fh>) {
>  		# TN:<test name>
>  		if (m/^TN:(.*)/) {
>  			if ($1 ne $cur_test) {
> @@ -568,7 +581,7 @@ sub read_info($)
>  		printf("Warning: invalid line: $_");
>  	}
>  
> -	close IN or die;
> +	$fh->close() or die "Failed to close file $file";
>  }
>  
>  sub sort_where($$)
> @@ -598,9 +611,15 @@ sub write_json_file($)
>  		Cpanel::JSON::XS::encode_json(\%record)
>  	};
>  
> -	open OUT, ">$fname" or die "Can't open $fname";
> -	print OUT $data or die "Failed to write to $fname";
> -	close OUT or die "Failed to close to $fname";
> +	if ($fname =~ m/\.gz$/) {
> +		my $fh = IO::Zlib->new($fname, "wb") or die "can't open $fname";
> +		print $fh $data or die "Failed to write to $fname";
> +		$fh->close or die "Failed to write to $fname";
> +	} else {
> +		open OUT, ">$fname" or die "Can't open $fname";
> +		print OUT $data or die "Failed to write to $fname";
> +		close OUT or die "Failed to close to $fname";
> +	}
>  }
>  
>  sub write_info_file($)
> @@ -648,12 +667,17 @@ sub write_info_file($)
>  				$data .= "BRDA:$ln,0,$i,$taken\n";
>  			}
>  		}
> -
>  		$data .= "end_of_record\n";
>  	}
> -	open OUT, ">$fname" or die "Can't open $fname";
> -	print OUT $data or die "Failed to write to $fname";
> -	close OUT or die "Failed to close to $fname";
> +	if ($fname =~ m/\.gz$/) {
> +		my $fh = IO::Zlib->new($fname, "wb") or die "can't open $fname";
> +		print $fh $data or die "Failed to write to $fname";
> +		$fh->close or die "Failed to write to $fname";
> +	} else {
> +		open OUT, ">$fname" or die "Can't open $fname";
> +		print OUT $data or die "Failed to write to $fname";
> +		close OUT or die "Failed to close to $fname";
> +	}
>  }
>  
>  sub print_code_coverage($$$)
> @@ -1354,7 +1378,7 @@ if ($ignore_unused) {
>  }
>  
>  foreach my $f (@ARGV) {
> -	if ($f =~ /.json$/) {
> +	if ($f =~ /\.json(\.gz)?$/) {
>  		read_json($f);
>  	} else {
>  		read_info($f);
> @@ -1435,7 +1459,7 @@ if ($show_files) {
>  }
>  
>  if ($output_file) {
> -	if ($output_file =~ /.json$/) {
> +	if ($output_file =~ /.json(.gz)?$/) {
>  		write_json_file($output_file);
>  	} else {
>  		write_info_file($output_file);
> -- 
> 2.43.0
> 
