Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93989C52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 17:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B44D10E66F;
	Wed, 21 Aug 2024 17:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsTiEvel";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DE110E66F
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 17:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724260329; x=1755796329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cILSbR5G2J+eqnF56z3WSM1NugVp45d7Ou7TOcWTLr8=;
 b=dsTiEvelEv9cmhJ0ON5UFk4e/JOt8vMM4V30fsVZf6omv0rjGHoE5s8Q
 UbmBV4KraN92KeerT+Vyg0gsDTq342h24u6Th0YNt9TTCvnEU/bRnIK5j
 abOtIa5jciuxOloCCpzQ1TRIOaIQPiqd5iVK8PnaMkUpnlHPz7N5m7STF
 i14vuL50Rr6awL8Wsl84nuOm0uR4vgyAyeYLfoTj6oR9M04UULHPxBkZZ
 VJ+AkO7byhiMR3RCutxbrBW9TBN70CxRjF9OX5/f/Sbq+ZUXfM/YmC2CR
 GkIUqJeSGNtlnE/OHkK96aEMuDtRbADonimOw1haPEc17tx8J3V/lPvGn A==;
X-CSE-ConnectionGUID: o7MmxBNpQqKzboX1nDXFjg==
X-CSE-MsgGUID: Gh6Da7TbTfKnpAo8U3Kc5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="45160620"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="45160620"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 10:12:08 -0700
X-CSE-ConnectionGUID: Ohcmc9v9T4ezS654WAad8Q==
X-CSE-MsgGUID: bLb5Lr+PSaC2u+hhMJt5Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61017858"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 10:12:07 -0700
Date: Wed, 21 Aug 2024 19:11:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t v2 1/6] tools/intel-gfx-fw-info: Re-format with black
Message-ID: <20240821171148.hdwa4nqzmrgzn6vn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
 <20240820232928.458248-2-lucas.demarchi@intel.com>
 <20240821112945.ecy2tuu36nnih4hd@kamilkon-DESK.igk.intel.com>
 <vbao6gcl4cxcfizf6gdwpmjebmlqvob6y72of6bq7g737x43lw@nfovq2z3fzt7>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <vbao6gcl4cxcfizf6gdwpmjebmlqvob6y72of6bq7g737x43lw@nfovq2z3fzt7>
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

Hi Lucas,
On 2024-08-21 at 07:35:11 -0500, Lucas De Marchi wrote:
> On Wed, Aug 21, 2024 at 01:29:45PM GMT, Kamil Konieczny wrote:
> > Hi Lucas,
> > On 2024-08-20 at 16:29:23 -0700, Lucas De Marchi wrote:
> > > black tools/intel-gfx-fw-info
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > 
> > This looks almost ok, now
> > 
> > pylint -d C0114,C0103,C0116,C0115 intel-gfx-fw-info
> > 
> > intel-gfx-fw-info:293:4: W0621: Redefining name 'e' from outer scope (line 136) (redefined-outer-name)
> > 
> > Your code has been rated at 9.92/10 (previous run: 7.64/10, +2.28)
> > 
> > Btw running
> > ./intel-gfx-fw-info -c /lib/firmware/i915/ehl_huc_9.0.0.bin.zst
> 
> 							     ^^^
> 
> > 
> > I got:
> > 
> > header-type: CSS
> > version: 137.147.184
> > date: 543-01-b9
> > checksum: 3aa76ca9f25d916e64a56267338d37993b8e4e7321856de83d98d14e15ace4ad
> > 
> > Is date an encoded date and time?
> 
> it's compressed and this simple script doesn't handle compression (yet)
> 
> 	$ cp /lib/firmware/i915/ehl_huc_9.0.0.bin.zst .
> 	$ zstd -d ehl_huc_9.0.0.bin.zst
> 	$ ./tools/intel-gfx-fw-info ehl_huc_9.0.0.bin
> 	header-type: CSS
> 	version: 9.0.0
> 	date: 2019-08-05
> 
> The compression happened not to change the first 4 bytes so it
> incorrectly recognized it and applied the CCS parser.  Adding
> decompression may be something for another time.

Thank you, is that de/compression documented somewhere?

> 
> > 
> > You can add my acked-by with or without a fix for W0621 warning.
> 
> For this patch or for the series?

For a series.

Regards,
Kamil

> 
> thanks
> Lucas De Marchi
> 
> > 
> > Regards,
> > Kamil
> > 
> > > ---
> > >  tools/intel-gfx-fw-info | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
> > > index b0d41bbae..35555aab5 100755
> > > --- a/tools/intel-gfx-fw-info
> > > +++ b/tools/intel-gfx-fw-info
> > > @@ -150,10 +150,12 @@ def parse_args(argv: typing.List[str]) -> argparse.Namespace:
> > >      description = "Dump GuC/HuC firmware information"
> > >      parser = argparse.ArgumentParser(prog="intel-gfx-fw-info", description=description)
> > > 
> > > -    parser.add_argument("-x", "--raw", action="store_true",
> > > -                        help="Also print raw header content")
> > > -    parser.add_argument("-c", "--checksum", action="store_true",
> > > -                        help="Also print checksum")
> > > +    parser.add_argument(
> > > +        "-x", "--raw", action="store_true", help="Also print raw header content"
> > > +    )
> > > +    parser.add_argument(
> > > +        "-c", "--checksum", action="store_true", help="Also print checksum"
> > > +    )
> > > 
> > >      parser.add_argument("filename", help="GuC/HuC firmware file")
> > > 
> > > --
> > > 2.43.0
> > > 
