Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08C3CAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 19:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6776410E840;
	Thu,  2 Oct 2025 19:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTA8Pe7C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B8410E840
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 19:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759434890; x=1790970890;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=DcOp8Pp4nBYl+PTIOIbGHYL8+XOekgsC/UW+mAqc6pc=;
 b=XTA8Pe7COeER5KRGWWqXMU7sIwCUmDS1EgIYZMiOnENfWrGrcE6XtVIa
 ZnAVtPP10Vvy8pkYW/QYf5lMcpZwa8hXjOZsJ2kem2zn0+N0IWqTEEIIn
 m01hzzyuprPIfW5QXQyqLFljGKgyO7AxK0ls4OFwcuAbLN3yHNTUMTE5q
 ezIgZL1Z+GOmJkiJE2mCoNvOYjAnu1y/m/sgCBA+D/7rWvEUe6JV83WdD
 u/lLA9zY/h0eaIG3iE1v+m/EhACLdbUTiz9xIf2M7Dq9qfzUaWUgaY8ml
 dNFV5s30nkTxOd5RoKgtMMK1cu3Lzc5GHBDJyDIs4mqi8G43PRCr914sQ Q==;
X-CSE-ConnectionGUID: ONT6O8HGQS2/xigGaX3Opg==
X-CSE-MsgGUID: OSB526wFT7GmNbof8Vby7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="65575773"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="65575773"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:54:46 -0700
X-CSE-ConnectionGUID: TFcGJcHnTWKzx7zej+KK+g==
X-CSE-MsgGUID: BZOJQn0aQ+SFDUMwf8wP6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="178721423"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:54:44 -0700
Date: Thu, 2 Oct 2025 21:54:41 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/7] tools/intel_display_poller: Add
 --scanline-offset/-o command line option
In-Reply-To: <20250922160950.27250-5-ville.syrjala@linux.intel.com>
Message-ID: <0bb032d9-c6ce-f83b-2b2d-67a8ed0533f7@intel.com>
References: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
 <20250922160950.27250-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="8323329-1960965985-1759418200=:1357965"
Content-ID: <cbcbff64-8b25-4f23-f952-86a75f52d37f@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1960965985-1759418200=:1357965
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <974f4ec5-4dd2-25f1-1c1e-10d4a39a936e@intel.com>

On Mon, 22 Sep 2025, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Our hardware has a slightly warped view of scanline numbers.
> Eg. on most platforms it reports DSL=vblank_start-1 when the
> start of vblank actaully occurs.
>
> On the kernel side we have helpers to convert between the hardware
> and software scanline numbers. Add the same for intel_display_poller
> in the form of a new --scanline-offset/-o command line option. With
> this one doesn't constantly have to waste brarin power to convert the
> hardware numbers into something more sensible.
>
> Caveat: unlike the kernel side we don't do the appropriate %vtotal
> on the adjusted values (since figuring out the actual vtotal would take
> quite a bit of work due to VRR/etc.). So when using --scanline-offset
> one has to keep in mind that we might see slightly funky scanline
> numbers. Eg. scanline >= vtotal when the scanline offset of positive,
> and negative value (due to a negative scanline offset) we just
> saturate to 0. Howver for most interesting hardware events the
> scanline tends to be in a range where this issue doesn't matter.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>
--8323329-1960965985-1759418200=:1357965--
