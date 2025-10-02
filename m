Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A0ACAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 17:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7C510E1CC;
	Thu,  2 Oct 2025 17:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJCTUE/R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503FA10E1CC
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 17:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759426602; x=1790962602;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=taAoFXqEuasAgXakjAVFps614LkjAiEa672G00zdEtg=;
 b=MJCTUE/RY60/OiVDmdPB6tobsljvQSSWZaIPqJ6V6aa5O5+CP0jEEz+K
 AzHlFr6nM/9R9z2HTPed+zYmnwvaKM+ctQHL08RX3pflvYTB0nNxDZccJ
 Il7eNyzo3SRPLRsj87a0Icus3DsdFFaGesJSTp0M/c1g0gf9FvmgiJtR7
 ZWbd6v0lBCTAP7Ae897fii0Yr0RccCUnPM2MG6kkh1M9mqELucinrnAJk
 ZMqgTPCftWBVKye9bnYp9uatgXrc7kIB3IM5qiOIjbvnwawCClG25ahbb
 IGu4ZDrhpC81NndrjlVi134LchxzOfeMKK0ymLIEo+EkJDJJchKwk7hgf g==;
X-CSE-ConnectionGUID: ednuKAmVSxSb3mMsW+bLQQ==
X-CSE-MsgGUID: o1IclFsIQhu3JqXxd6ft/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61623495"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="61623495"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 10:36:42 -0700
X-CSE-ConnectionGUID: L4X8JwrnTDiPPnZCAln0AA==
X-CSE-MsgGUID: 7ED7VkIuSeiGgCAods8MMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="216210882"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 10:36:40 -0700
Date: Thu, 2 Oct 2025 20:36:38 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/6] tools/intel_vbt_decode: Improve decoding to
 strings
Message-ID: <aN64Jtg7AMoIgkwx@intel.com>
References: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
 <3986a14028b4371e7386df917236409b441ef77b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3986a14028b4371e7386df917236409b441ef77b@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Sep 30, 2025 at 11:27:37AM +0300, Jani Nikula wrote:
> On Mon, 29 Sep 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Make it easier/safer to decode VBT values into a string representation.
> >
> > Also decode a couple of new (or rather old) things.
> 
> I left a couple of comments, but overall
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks.

I dropepd the CABC nonsense, and added Kamil's value<0 check
while pushing.

> 
> >
> > Ville Syrjälä (6):
> >   tools/intel_vbt_decode: Introduce to_str()
> >   tools/intel_vbt_decode: Use to_str() more
> >   tools/intel_vbt_decode: Convert eDP deocding to use to_str()
> >   tools/intel_vbt_decode: Use panel_bits()
> >   tools/intel_vbt_decode: Decode display refclk mode
> >   tools/intel_vbt_decode: Decode the backlight control method type
> >
> >  tools/intel_vbt_decode.c | 264 ++++++++++++++++++---------------------
> >  1 file changed, 123 insertions(+), 141 deletions(-)
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
