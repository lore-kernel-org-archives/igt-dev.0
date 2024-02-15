Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF22C4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 19:55:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0509C10E409;
	Thu, 15 Feb 2024 19:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGffzaZT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25B410E409
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 19:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708026907; x=1739562907;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KgU2hCl7zmTpX0CyKKeYuVvIS4GX8w1uP4PpIUm5R50=;
 b=AGffzaZTMR5R6cqbOlKps+zioUvKo663yHvK7IlEbX6uN+bG/fvvkR9E
 wbOcd3pASmcuZ1K4azyrT7TUXENDF4xDsmjRoZyP0YoUkpyoBEyLpjY3C
 us+/JkUXzTCFMOy+H4dPNwnDpn4Q+9/BpIaePsSZXmaOx8in0hXVoQ28N
 +lv+5meU3aFBrmFJLU7E8HOWALp81QOvXCtgyy81vMXe17S4oZsxG6xp7
 4+RPAfjqOClF+3jx3B3+seShuSFkiCBTJtmlpn7ddkwGVRTeqe5EAuf1O
 4En2xMFO9Ey0UCKyAcVGP4cPWqaEBcHAu0uEElFea2/86kob7njbwzPFQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12690637"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12690637"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:55:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8289823"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:55:05 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9F551580BE1;
 Thu, 15 Feb 2024 11:55:03 -0800 (PST)
Date: Thu, 15 Feb 2024 20:55:00 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 09/17] scripts/code_cov_parse_info: stop
 recording/writing too old fields
Message-ID: <20240215205500.4de8dbce@maurocar-mobl2>
In-Reply-To: <20240215170946.isatjeyc7kuv2iig@kamilkon-desk.igk.intel.com>
References: <cover.1707992666.git.mchehab@kernel.org>
 <ee96b3366066e1e00ae7b55466f822b3bd98ca13.1707992666.git.mchehab@kernel.org>
 <20240215170946.isatjeyc7kuv2iig@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 15 Feb 2024 18:09:46 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> On 2024-02-15 at 11:27:18 +0100, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > As we'll be using json as basis, drop support for the fields that:
> > 
> > - aren't used at the reports;
> > - aren't even present when lcov parses gcc json format.
> > 
> > Such fields are only handled on lcov for very old gcc versions.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  scripts/code_cov_parse_info | 33 ---------------------------------
> >  1 file changed, 33 deletions(-)
> > 
> > diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> > index 92091215d224..038440a9c3e3 100644
> > --- a/scripts/code_cov_parse_info
> > +++ b/scripts/code_cov_parse_info
> > @@ -201,15 +201,10 @@ sub parse_info_data($)
> >  
> >  		# FNF:<number of functions found>
> >  		if (m/^FNF:(-?\d+)/) {
> > -			$record{$source}{func}{$func}{fnf} = $1;
> >  			next;
> >  		}
> >  		# FNH:<number of function hit>
> >  		if (m/^FNH:(-?\d+)/) {
> > -			my $hits = $1;
> > -			if (!defined($record{$source}{func}{$func}{fnh}) || $record{$source}{func}{$func}{fnh} < $hits) {
> > -				$record{$source}{func}{$func}{fnh} = $hits;
> > -			}
> >  			next;
> >  		}
> >  
> > @@ -240,15 +235,10 @@ sub parse_info_data($)
> >  
> >  		# BRF:<number of branches found>
> >  		if (m/^BRF:(-?\d+)/) {
> > -			$record{$source}{func}{$func}{brf} = $1;
> >  			next;
> >  		}
> >  		# BRH:<number of branches hit>
> >  		if (m/^BRH:(-?\d+)/) {
> > -			my $hits = $1;
> > -			if (!defined($record{$source}{func}{$func}{brh}) || $record{$source}{func}{$func}{brh} < $hits) {
> > -				$record{$source}{func}{$func}{brh} = $hits;
> > -			}  
> 
> Above is self-explanatory.
> 
> >  			next;
> >  		}
> >  
> > @@ -340,34 +330,11 @@ sub write_filtered_file($)
> >  				if (defined($record{$source}{func}{$func}{fnda})) {
> >  					$filtered .= "FNDA:" . $record{$source}{func}{$func}{fnda} . ",$func\n";
> >  				}
> > -				if ($record{$source}{fnf}) {
> > -					$filtered .= "FNF:". $record{$source}{func}{$func}{fnf} ."\n";
> > -				}
> > -				if ($record{$source}{fnh}) {
> > -					$filtered .= "FNH:". $record{$source}{func}{$func}{fnh} ."\n";
> > -				}
> > -			}
> >  
> > -			foreach my $ln(sort { $a <=> $b } keys %{ $record{$source}{func}{$func}{da} }) {
> > -				$filtered .= "DA:$ln," . $record{$source}{func}{$func}{da}{$ln} . "\n";  
> 
> Why are you removing DA here? It is used elswhere.
> 
> >  			}
> > -			foreach my $where(sort sort_where keys %{ $record{$source}{func}{$func}{brda} }) {
> > -				my $taken = $record{$source}{func}{$func}{brda}{$where};  
> 
> Same here, BRDA.
> 
> >  				$taken = "-" if (!$taken);
> >  				$filtered .= "BRDA:$where,$taken\n";
> >  			}
> > -			if ($record{$source}{func}{$func}{brf}) {
> > -				$filtered .= "BRF:". $record{$source}{func}{$func}{brf} ."\n";
> > -			}
> > -			if ($record{$source}{func}{$func}{brh}) {
> > -				$filtered .= "BRH:". $record{$source}{func}{$func}{brh} ."\n";
> > -			}
> > -			if ($record{$source}{func}{$func}{lf}) {
> > -				$filtered .= "LF:". $record{$source}{func}{$func}{lf} ."\n";
> > -			}
> > -			if ($record{$source}{func}{$func}{lh}) {
> > -				$filtered .= "LH:". $record{$source}{func}{$func}{lh} ."\n";  
> 
> LF and LH?
> 
> If above is correct you can add my a-b
> 
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Basically, lcov has support for different versions of gcov and has
some sort of backward compatibility with older versions of lcov
tool. In practice, those fields aren't either be filled anymore for
a long time or just provide duplicated (incomplete) information.

The rationale behind this patch is to remove those duplicated info
from old versions that are either duplicated or not filled anymore
by gcov/lcov versions on Ubuntu 18.04 and above[1]. 

[1] btw, this script was never tested with versions older than
what's there on Ubuntu 18.04, so what has been removed is something
that it was not really used in practice.

> 
> > -			}
> >  		}
> >  
> >  		$filtered .= "end_of_record\n";
> > -- 
> > 2.43.0
> >   
