Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE2ACD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071A110F0A8;
	Thu, 11 Apr 2024 13:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AV6qpFMN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EA810F0A8
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712841328; x=1744377328;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f04n+iDii0yBWK9P/3JGnV4BGBlPFP9UnR49ur0ATN4=;
 b=AV6qpFMNQ1v2A5VZdtc/Iv/0HfVPeHs+CpVUcF5axNoXmNtSizttsUF2
 4OZvqWyRc8SznR1ptVBgd5T5EjIUA1nt7czssNb1MDRdOYqjpZy6fLSTW
 M8fpYQ4QRsrqkPr2sPDHGQhUVNGf4tGrEzKjXgMNJT1ShiWrz+ied4Zsy
 z52V4V2OV5eD+/4no4QjjcQBTNnx/deDZASct/FN8BpYvon4vgiTevcLp
 IRli69YYE7vNjS9c4ygSHV7l6HjkN+sp48Q9JxTvu736G+aDZF7oN7V+A
 DRz9xzs627zaiz+nT+NvZE5iU27un5UsHyauNWFOG4M5IFsTIe1ROo9hT w==;
X-CSE-ConnectionGUID: DVGNt5SqRhufvrqp0+z/bg==
X-CSE-MsgGUID: Cxv7LbTjQomLDzqtTqchzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="25760648"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25760648"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="827793550"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="827793550"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 11 Apr 2024 06:15:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Apr 2024 16:15:24 +0300
Date: Thu, 11 Apr 2024 16:15:24 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/13] tools/intel_vbt_decode: Allow blocks to be
 named without full decoding
Message-ID: <ZhfibKZyDCe7jJn6@intel.com>
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-4-ville.syrjala@linux.intel.com>
 <87bk6g6qde.fsf@intel.com> <87frvs59gw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87frvs59gw.fsf@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Apr 11, 2024 at 04:12:47PM +0300, Jani Nikula wrote:
> On Thu, 11 Apr 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Fri, 22 Mar 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> >> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>
> >> Make it possible to give blocks a name without having to
> >> implement full decoding.
> >>
> >> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Good idea!
> >
> > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> I was expecting to see a patch adding all those block names without
> decoding. In the follow-up, then?

Yeah, there be more coming.

-- 
Ville Syrjälä
Intel
