Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A61C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 11:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621A310EC4C;
	Fri, 14 Feb 2025 11:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDqvXZy0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED8D10EC4C
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739532663; x=1771068663;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=r80K02eRSeMz5HBdN3arqkbXiErjOFNIuHgFhNdaSoY=;
 b=DDqvXZy0912aGZGNXMJJzYacDiwUYpXr92fgIA0daSQpgsbFs+hAiZoJ
 dnNmGsoIqArj4p8GtqYNfJsOFElaf/xQDUIS3dPccK2QW7lIg/h21Ka7R
 5SxNQXIF4S7SX0Rouxmol5n3J5QF6bksN4c0Tn7q73wdXDoiQwcpa7vWg
 mbc8oJQ/0hoi5TWGSFzFqrNTED04gMZ/pgyxnEn78yqA2YNiyekw9oEvW
 TGGEAA0otVla+IxP6zWh/3UdcWr3lRq1gN2xKOYyE384GjGxSjY3rizKS
 q0uHbucHZXu2sGzPPG4A6QeBDty0ywCbyQRuqv8Ha46kMVaGvel6bWTtl Q==;
X-CSE-ConnectionGUID: W7ZzY3kJTmeNW7rKlf1vmw==
X-CSE-MsgGUID: FxUGztUbRCuVsGx9mFOC0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51704724"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51704724"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 03:31:03 -0800
X-CSE-ConnectionGUID: /8RKRWjAQxmKMjyAjvEvSQ==
X-CSE-MsgGUID: t8GCK9n+RiOJSmWTOlfYWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113304279"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 03:31:02 -0800
Date: Fri, 14 Feb 2025 12:30:58 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] lib/intel_compute_square_kernels: Extend compute test
 for ptl
Message-ID: <20250214113058.xpkbctolyfe3lmmy@zkempczy-mobl2>
References: <20250214070518.53840-1-sai.gowtham.ch@intel.com>
 <20250214101018.mrn3gtvgvn3zecnj@zkempczy-mobl2>
 <BL3PR11MB574724494523F8D70208132DD0FE2@BL3PR11MB5747.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL3PR11MB574724494523F8D70208132DD0FE2@BL3PR11MB5747.namprd11.prod.outlook.com>
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

On Fri, Feb 14, 2025 at 12:17:17PM +0100, Ch, Sai Gowtham wrote:
> 
> 
> >-----Original Message-----
> >From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> >Sent: Friday, February 14, 2025 3:40 PM
> >To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
> >Cc: igt-dev@lists.freedesktop.org
> >Subject: Re: [PATCH] lib/intel_compute_square_kernels: Extend compute test for
> >ptl
> >
> >On Fri, Feb 14, 2025 at 07:05:18AM +0000, sai.gowtham.ch@intel.com wrote:
> >> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> >>
> >> Current compute square kernel tests dosen't support on PTL, this
> >> enables tests to work on PTL.
> >>
> >> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> >> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> >> ---
> >>  lib/intel_compute.c                | 10 +++++++
> >>  lib/intel_compute_square_kernels.c | 42
> >> ++++++++++++++++++++++++++++++
> >>  2 files changed, 52 insertions(+)
> >>
> >> diff --git a/lib/intel_compute.c b/lib/intel_compute.c index
> >> 233835c6c..5350389df 100644
> >> --- a/lib/intel_compute.c
> >> +++ b/lib/intel_compute.c
> >> @@ -1729,6 +1729,16 @@ static const struct {
> >>  		.compute_exec = xe2lpg_compute_exec,
> >>  		.compat = COMPAT_DRIVER_XE,
> >>  	},
> >> +	{
> >> +		.ip_ver = IP_VER(30, 00),
> >> +		.compute_exec = xe2lpg_compute_exec,
> >> +		.compat = COMPAT_DRIVER_XE,
> >> +	},
> >> +	{
> >> +		.ip_ver = IP_VER(30, 01),
> >> +		.compute_exec = xe2lpg_compute_exec,
> >> +		.compat = COMPAT_DRIVER_XE,
> >
> >This entry seems to be unused at the moment.
> This entry is implemented for the future use as we had two ver's for ptl, this can be removed if needed.  
> >
> >> +	},
> >>  };
> >>
> >>  static bool __run_intel_compute_kernel(int fd, diff --git
> >> a/lib/intel_compute_square_kernels.c
> >> b/lib/intel_compute_square_kernels.c
> >> index b0912e7e4..18f90c4fe 100644
> >> --- a/lib/intel_compute_square_kernels.c
> >> +++ b/lib/intel_compute_square_kernels.c
> >> @@ -3889,6 +3889,38 @@ unsigned char xelpg_kernel_square_bin[] = {
> >>  	0x00, 0x00, 0x00, 0x00
> >>  };
> >>
> >> +static const unsigned char ptl_kernel_square_bin[] = {

I think this should be renamed to xe3lpg_kernel_square_bin.

After rename:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> >> +	0x65, 0xa0, 0x00, 0x80, 0x20, 0x82, 0x05, 0x1f, 0x04, 0x00, 0x00,
> >> +	0x02, 0xc0, 0xff, 0xff, 0xff, 0x40, 0x19, 0x00, 0x80, 0x20, 0x82,
> >> +	0x05, 0x1f, 0x04, 0x1f, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x31,
> >> +	0x22, 0x03, 0x80, 0x00, 0x00, 0x0c, 0x05, 0x8f, 0x1f, 0x00, 0xfa,
> >> +	0x03, 0x00, 0x70, 0xf6, 0x61, 0x80, 0x24, 0x2c, 0x02, 0x00, 0x10,
> >> +	0x00, 0x66, 0x09, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80, 0x00, 0x80,
> >> +	0x00, 0x02, 0xc0, 0x04, 0x00, 0x40, 0x41, 0x22, 0x03, 0x80, 0x60,
> >> +	0x06, 0x01, 0x20, 0x54, 0x05, 0x00, 0x01, 0x14, 0x02, 0x00, 0x00,
> >> +	0x53, 0x81, 0x00, 0x80, 0x60, 0x06, 0x05, 0x03, 0x54, 0x05, 0x00,
> >> +	0x06, 0x14, 0x02, 0x00, 0x00, 0x52, 0x19, 0x14, 0x00, 0x60, 0x06,
> >> +	0x04, 0x06, 0x04, 0x03, 0x0e, 0x01, 0x04, 0x01, 0x04, 0x04, 0x70,
> >> +	0x19, 0x14, 0x00, 0x20, 0x02, 0x01, 0x00, 0x04, 0x06, 0x10, 0x52,
> >> +	0x44, 0x05, 0x00, 0x00, 0x2e, 0x00, 0x14, 0x14, 0x00, 0xc0, 0x00,
> >> +	0x00, 0x88, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x61, 0x00,
> >> +	0x00, 0xb4, 0x15, 0x06, 0x10, 0x00, 0x61, 0x00, 0x08, 0xb4, 0x17,
> >> +	0x07, 0x10, 0x00, 0x69, 0x1a, 0x10, 0x00, 0x70, 0x86, 0x05, 0x19,
> >> +	0x04, 0x15, 0x20, 0x05, 0x02, 0x00, 0x02, 0x00, 0x69, 0x1a, 0x10,
> >> +	0x02, 0x70, 0x86, 0x05, 0x1b, 0x04, 0x17, 0x20, 0x05, 0x02, 0x00,
> >> +	0x02, 0x00, 0x40, 0x1a, 0x00, 0x38, 0x08, 0x19, 0x10, 0x05, 0x40,
> >> +	0x1a, 0x08, 0x38, 0x0a, 0x1b, 0x10, 0x05, 0x31, 0x23, 0x17, 0x00,
> >> +	0x00, 0x00, 0x14, 0x0c, 0x24, 0x08, 0x00, 0xfb, 0x00, 0x00, 0x00,
> >> +	0x00, 0x40, 0x00, 0x00, 0x38, 0x10, 0x19, 0x30, 0x05, 0x40, 0x00,
> >> +	0x08, 0x38, 0x12, 0x1b, 0x30, 0x05, 0x41, 0x83, 0x20, 0x20, 0x0e,
> >> +	0x0c, 0x00, 0x0c, 0x31, 0x24, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00,
> >> +	0x24, 0x10, 0x08, 0xfb, 0x14, 0x0e, 0x00, 0x00, 0x2f, 0x00, 0x14,
> >> +	0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
> >> +	0x00, 0x00, 0x61, 0x00, 0x10, 0x28, 0x14, 0x02, 0x10, 0x00, 0x31,
> >> +	0x20, 0x02, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x14, 0x20, 0x30,
> >> +	0x00, 0x00, 0x00, 0x00
> >> +};
> >
> >Shader looks correct.
> >
> >> +
> >>  const struct intel_compute_kernels intel_compute_square_kernels[] = {
> >>  	{
> >>  		.ip_ver = IP_VER(12, 0),
> >> @@ -3933,5 +3965,15 @@ const struct intel_compute_kernels
> >intel_compute_square_kernels[] = {
> >>  		.sip_kernel = xe2lpg_kernel_sip_bin,
> >>  		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
> >>  	},
> >> +	{
> >> +		.ip_ver = IP_VER(30, 00),
> >> +		.size = sizeof(ptl_kernel_square_bin),
> >> +		.kernel = ptl_kernel_square_bin,
> >> +	},
> >> +	{
> >> +		.ip_ver = IP_VER(30, 01),
> >> +		.size = sizeof(ptl_kernel_square_bin),
> >> +		.kernel = ptl_kernel_square_bin,
> >
> >Same as first comment, there's no rel = 1 for PTL defined (good argument to start
> >rework for getting ver/rel from hw).
> >
> Sure, Will be removing this entry. 
> 
> Thanks for your comments, will be sending an other patch without these entries
> >--
> >Zbigniew
> >
> >> +	},
> >>  	{}
> >>  };
> >> --
> >> 2.43.0
> >>
