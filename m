Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331FFC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 12:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0B310E554;
	Tue, 16 Apr 2024 12:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECo5qXB4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E82910E554
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 12:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713270807; x=1744806807;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jXDRxys/ZwZUVt9pEFnfb+zrDArJnAbOAbovEvlNiLE=;
 b=ECo5qXB4z+n/V4BEdRN8r5RJWXFjBQOUGYM1MX+iFIGBYefOP71VX1Xx
 38TIWqDWETqCLsO2W+tlv6ywTpgeTtBu6j2fSKdPFIYaik+ag8kUa56mB
 dQh2e6FoHQ3uyV/5+tbCPqrzkX4Y7snlgm4aXvg8mnv5hBP9QmNglxEXx
 FODnt5IER/DLF7iqPQ5Ovhz0AmNPMWEuaQ/s7pQOsvLisQBYH6Em0R1sq
 H5tOSvHt8w+QqKVvqRwQmF3mqzZWTeOL0RYKfHVYSWkqMRGTwE6SX3lci
 HO+dHdBriTzR+q36WG4Aqtc89up/N748ALS24ZMzD/E+PXFNdd7XSUANR Q==;
X-CSE-ConnectionGUID: iW2P2ohJQ0+W5nnkUXZLuA==
X-CSE-MsgGUID: 3eKSlp1HSCK46boslJVWcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8925289"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8925289"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 05:33:26 -0700
X-CSE-ConnectionGUID: 5bWqNkWvRu6aUkCzjYttmg==
X-CSE-MsgGUID: 9vqQF3foQYKuGh7mFvteqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22316306"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 16 Apr 2024 05:33:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 16 Apr 2024 15:33:23 +0300
Date: Tue, 16 Apr 2024 15:33:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 4/4] lib/kms: Clear connector_attrs[] upon
 setting the reset value
Message-ID: <Zh5wE0e9d-PrHacC@intel.com>
References: <20240411183450.6417-1-ville.syrjala@linux.intel.com>
 <20240411183450.6417-4-ville.syrjala@linux.intel.com>
 <6b70a933-9baa-4a5d-83e9-90ec02670538@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b70a933-9baa-4a5d-83e9-90ec02670538@intel.com>
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

On Sun, Apr 14, 2024 at 11:29:00AM +0530, Joshi, Kunal1 wrote:
> 
> On 4/12/2024 12:04 AM, Ville Syrjala wrote:
> > From: Ville Syrjälä<ville.syrjala@linux.intel.com>
> >
> > When anyone manually sets the connector attr to the reset value
> > we can stop tracking said attr.
> >
> > Cc: Kunal Joshi<kunal1.joshi@intel.com>
> > Signed-off-by: Ville Syrjälä<ville.syrjala@linux.intel.com>
> LGTM
> Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>

Thanks. All pushed.

-- 
Ville Syrjälä
Intel
