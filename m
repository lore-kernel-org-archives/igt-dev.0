Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F11CA5FD4
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 05:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF9610E190;
	Fri,  2 Oct 2026 05:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+m+BGvp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AC710E190
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 05:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790917513; x=1822453513;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YfBjjlFyAFUcTUHgX1HAVdbEZp9OLvO9s9CyMsR/8l0=;
 b=U+m+BGvpcaAUA3U+ne9QVVv0rWBkfMeTeCvlQEkQ2ee4RDdQM0kGfS2n
 tg4qs34Jl8nZelvrFFDNr5QgZLbe4gvvwgNOsV5K3Vub+lm1paIbkmMJt
 tRk+Sn6d7NsFZRiadDj3gFUubSV7cKiMmbncdt8mgZ0IygGoqQIds98/G
 0c597KVWbIoH8jgqXVBGlI0HR/9FJ981X1wRmSvgdZI5mxKROgKvqRBwc
 zrue3efcudyqTN6L/6nOEoOycUTfJYmigXPimtIIpVcfxpBZFDVXfD9FA
 x0+RE+ARR3yeTKqMeHQ4w6Hja+VMt47NuFVVtqrx3R7jkZDc+G/yUyWCG w==;
X-CSE-ConnectionGUID: ft+H/1v0QRefN74AEKR/bg==
X-CSE-MsgGUID: 9plrRk/4SLeiKZ6Tq0wsgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102257838"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="102257838"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 22:05:12 -0700
X-CSE-ConnectionGUID: /rZTWi9lQu2t+MG5Ovoc6g==
X-CSE-MsgGUID: QqsYNcnLR0KHpqvd3hpxYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="273987864"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 22:05:11 -0700
Date: Fri, 2 Oct 2026 07:05:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Xin Wang <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.d.roper@intel.com, 
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: Re: [PATCH i-g-t v14 4/4] lib/intel_device_info: remove the
 graphics_rel from xe2+ devices
Message-ID: <bpunru5h7bshkbvwkthco6uyfpc6tfsx25lh4d7puozo4pcx7j@jtlzpc5seuzs>
References: <20260928172713.1341060-1-x.wang@intel.com>
 <20260928172713.1341060-5-x.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928172713.1341060-5-x.wang@intel.com>
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

On Mon, Sep 28, 2026 at 10:27:07AM -0700, Xin Wang wrote:
> On Xe2+ platforms, the graphics IP version is no longer a stable
> property of a PCI ID "device type". After IP disaggregation, devices
> sharing the same PCI ID can report different IP versions via GMD_ID, so
> encoding graphics_rel in the static PCI-ID table gives wrong minor
> versions on such devices.
> 
> Drop graphics_rel for these platforms and rely on the runtime value
> that xe_device_get() reads from GMD_ID.
> 
> v2:
>  - also drop graphics_rel from WCL and NVL-P.
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  lib/intel_device_info.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 9201ca806c..0879f49038 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -512,7 +512,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
>  
>  static const struct intel_device_info intel_lunarlake_info = {
>  	.graphics_ver = 20,
> -	.graphics_rel = 4,

Can't we drop ver as well?

--
Zbigniew

>  	.display_ver = 20,
>  	.has_4tile = true,
>  	.has_flatccs = true,
> @@ -524,7 +523,6 @@ static const struct intel_device_info intel_lunarlake_info = {
>  
>  static const struct intel_device_info intel_battlemage_info = {
>  	.graphics_ver = 20,
> -	.graphics_rel = 1,
>  	.display_ver = 14,
>  	.has_4tile = true,
>  	.has_flatccs = true,
> @@ -536,7 +534,6 @@ static const struct intel_device_info intel_battlemage_info = {
>  
>  static const struct intel_device_info intel_pantherlake_info = {
>  	.graphics_ver = 30,
> -	.graphics_rel = 0,
>  	.display_ver = 30,
>  	.has_4tile = true,
>  	.has_flatccs = true,
> @@ -548,7 +545,6 @@ static const struct intel_device_info intel_pantherlake_info = {
>  
>  static const struct intel_device_info intel_wildcatlake_info = {
>  	.graphics_ver = 30,
> -	.graphics_rel = 3,
>  	.display_ver = 30,
>  	.has_4tile = true,
>  	.has_flatccs = true,
> @@ -560,7 +556,6 @@ static const struct intel_device_info intel_wildcatlake_info = {
>  
>  static const struct intel_device_info intel_novalake_s_info = {
>  	.graphics_ver = 30,
> -	.graphics_rel = 04,
>  	.display_ver = 35,
>  	.has_4tile = true,
>  	.has_oam = true,
> @@ -572,7 +567,6 @@ static const struct intel_device_info intel_novalake_s_info = {
>  
>  static const struct intel_device_info intel_novalake_p_info = {
>  	.graphics_ver = 35,
> -	.graphics_rel = 10,
>  	.display_ver = 35,
>  	.has_4tile = true,
>  	.has_oam = true,
> @@ -584,7 +578,6 @@ static const struct intel_device_info intel_novalake_p_info = {
>  
>  static const struct intel_device_info intel_crescentisland_info = {
>  	.graphics_ver = 35,
> -	.graphics_rel = 11,
>  	.display_ver = 0,
>  	.has_oam = true,
>  	.is_crescentisland = true,
> -- 
> 2.43.0
> 
