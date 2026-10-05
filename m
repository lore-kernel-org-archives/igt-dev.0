Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DA8CA5FF0
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 08:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E016210EBEB;
	Mon,  5 Oct 2026 08:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKQqZ4Oz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4DD10EBEB
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 08:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791188605; x=1822724605;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jkgkvWw5eLGCT1WjRRItPww1SzkNNcHu+AGtDiyOs0g=;
 b=oKQqZ4OzGkrfLUvYx406qneDJE2gd8ZKdrLbE5O98P7NR2Su4Vl9X/9L
 6DBl7DBu+VheIkSQgZ3NnWoJ87bIqToZgZRHv0pvYK4Ft8ftHL4/cVGgX
 wi+yQsZyQhBeosRFZfK2gb0splUeg3OIoxAM8cB9MMzlAXV9gcg3pPS3T
 STLF6yHd09Sfo+ZDDoSQ0gkShbusfcmt2dyJgGMeqSfPmZnpxKWzevV6+
 +JzpiO8NkMrjc2q6VHO7ocvCIhsobjogpeIC0A/arsq20ospP664BLog7
 QVnI5xS27sZM3IIY2I7LhsqQ/OI8dC3PcB6xbiQiHB4Dksa/YgF9ZJG8r A==;
X-CSE-ConnectionGUID: 7ipvWAfHQ1S3RPznHNm5lQ==
X-CSE-MsgGUID: 29QNCGXMQlK6LRMyE26cVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91060587"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="91060587"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:23:21 -0700
X-CSE-ConnectionGUID: Hl+i/Eq9ROCEioDsz9RzIw==
X-CSE-MsgGUID: 2r4oxt7lQe++9J+9+I6ubg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="284838097"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.175])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:23:19 -0700
Date: Mon, 5 Oct 2026 10:23:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Wang, X" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.d.roper@intel.com, 
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: Re: [PATCH i-g-t v14 4/4] lib/intel_device_info: remove the
 graphics_rel from xe2+ devices
Message-ID: <4bqcnrztxbdirr7v7ugjyzbvxznjkpkrtdk25fddjnufmu2nuv@zmbh2ubfr5de>
References: <20260928172713.1341060-1-x.wang@intel.com>
 <20260928172713.1341060-5-x.wang@intel.com>
 <bpunru5h7bshkbvwkthco6uyfpc6tfsx25lh4d7puozo4pcx7j@jtlzpc5seuzs>
 <a9119b28-9ec1-4e18-8ebf-44c7f2087ef8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9119b28-9ec1-4e18-8ebf-44c7f2087ef8@intel.com>
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

On Fri, Oct 02, 2026 at 12:50:54AM -0700, Wang, X wrote:
> 
> 
> On 10/1/2026 22:05, Zbigniew Kempczyński wrote:
> > On Mon, Sep 28, 2026 at 10:27:07AM -0700, Xin Wang wrote:
> > > On Xe2+ platforms, the graphics IP version is no longer a stable
> > > property of a PCI ID "device type". After IP disaggregation, devices
> > > sharing the same PCI ID can report different IP versions via GMD_ID, so
> > > encoding graphics_rel in the static PCI-ID table gives wrong minor
> > > versions on such devices.
> > > 
> > > Drop graphics_rel for these platforms and rely on the runtime value
> > > that xe_device_get() reads from GMD_ID.
> > > 
> > > v2:
> > >   - also drop graphics_rel from WCL and NVL-P.
> > > 
> > > Signed-off-by: Xin Wang <x.wang@intel.com>
> > > ---
> > >   lib/intel_device_info.c | 7 -------
> > >   1 file changed, 7 deletions(-)
> > > 
> > > diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> > > index 9201ca806c..0879f49038 100644
> > > --- a/lib/intel_device_info.c
> > > +++ b/lib/intel_device_info.c
> > > @@ -512,7 +512,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
> > >   static const struct intel_device_info intel_lunarlake_info = {
> > >   	.graphics_ver = 20,
> > > -	.graphics_rel = 4,
> > Can't we drop ver as well?
> We still have PCI-ID-only consumers, such as intel_gtt, which accesses
> the device through PCI BARs rather than xe_device_get(). Its GTT
> address decoding uses intel_gen(devid), including an explicit case
> for graphics version 20. Dropping graphics_ver would make that path
> report an unsupported platform on Lunar Lake.

Ok, so no objections from my side:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> > --
> > Zbigniew
> > 
> > >   	.display_ver = 20,
> > >   	.has_4tile = true,
> > >   	.has_flatccs = true,
> > > @@ -524,7 +523,6 @@ static const struct intel_device_info intel_lunarlake_info = {
> > >   static const struct intel_device_info intel_battlemage_info = {
> > >   	.graphics_ver = 20,
> > > -	.graphics_rel = 1,
> > >   	.display_ver = 14,
> > >   	.has_4tile = true,
> > >   	.has_flatccs = true,
> > > @@ -536,7 +534,6 @@ static const struct intel_device_info intel_battlemage_info = {
> > >   static const struct intel_device_info intel_pantherlake_info = {
> > >   	.graphics_ver = 30,
> > > -	.graphics_rel = 0,
> > >   	.display_ver = 30,
> > >   	.has_4tile = true,
> > >   	.has_flatccs = true,
> > > @@ -548,7 +545,6 @@ static const struct intel_device_info intel_pantherlake_info = {
> > >   static const struct intel_device_info intel_wildcatlake_info = {
> > >   	.graphics_ver = 30,
> > > -	.graphics_rel = 3,
> > >   	.display_ver = 30,
> > >   	.has_4tile = true,
> > >   	.has_flatccs = true,
> > > @@ -560,7 +556,6 @@ static const struct intel_device_info intel_wildcatlake_info = {
> > >   static const struct intel_device_info intel_novalake_s_info = {
> > >   	.graphics_ver = 30,
> > > -	.graphics_rel = 04,
> > >   	.display_ver = 35,
> > >   	.has_4tile = true,
> > >   	.has_oam = true,
> > > @@ -572,7 +567,6 @@ static const struct intel_device_info intel_novalake_s_info = {
> > >   static const struct intel_device_info intel_novalake_p_info = {
> > >   	.graphics_ver = 35,
> > > -	.graphics_rel = 10,
> > >   	.display_ver = 35,
> > >   	.has_4tile = true,
> > >   	.has_oam = true,
> > > @@ -584,7 +578,6 @@ static const struct intel_device_info intel_novalake_p_info = {
> > >   static const struct intel_device_info intel_crescentisland_info = {
> > >   	.graphics_ver = 35,
> > > -	.graphics_rel = 11,
> > >   	.display_ver = 0,
> > >   	.has_oam = true,
> > >   	.is_crescentisland = true,
> > > -- 
> > > 2.43.0
> > > 
> 
