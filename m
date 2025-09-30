Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160C1CAC5B8
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 08:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DDC10E522;
	Tue, 30 Sep 2025 08:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YToYP7gu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8546010E522
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 08:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759220862; x=1790756862;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=WwB6jAw9HZSYNY/viPM+Al8RNUEY58XJkjWBASLdadQ=;
 b=YToYP7gucvwuwOix6bmXeK8lOUiCKypw1YBBMQdklaSCPx4l3RJUgDhe
 V231/q/ZD0Vi6l+F2niHy+46o5jc8r+it3N8s32xOpBVBGoW70OrDZjVd
 F/dLA3LkcTqwQAboCMv+JejweG7sVger9tK9lCpKIMwuoYdKeQ168fE0I
 jMxWLFnbCJLpP4mOE6M3zI8BfLCLEg9b9ZZJ54F+wNqV2Xz0wVsDFOf6g
 M4u3cNjQSspq7VLToUsqj+s8SoJWwlhYTwjT38VWobMsIMofd12D1dhud
 CIvCIUlCg5xpaYija43Hr2o8NhWTBCRvNFQdkfCTOOISRqq1hWqWjhExu w==;
X-CSE-ConnectionGUID: qpHWD37NRPSezjV1w43Bfw==
X-CSE-MsgGUID: 2ybwOfbnThihfdMh68tpRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61360465"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="61360465"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 01:27:41 -0700
X-CSE-ConnectionGUID: z6l+aXZlRt60uWUoiebC5A==
X-CSE-MsgGUID: mvARwvvUTYePmnE92qYbYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="178032582"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 01:27:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/6] tools/intel_vbt_decode: Improve decoding to
 strings
In-Reply-To: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
Date: Tue, 30 Sep 2025 11:27:37 +0300
Message-ID: <3986a14028b4371e7386df917236409b441ef77b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 29 Sep 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Make it easier/safer to decode VBT values into a string representation.
>
> Also decode a couple of new (or rather old) things.

I left a couple of comments, but overall

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Ville Syrj=C3=A4l=C3=A4 (6):
>   tools/intel_vbt_decode: Introduce to_str()
>   tools/intel_vbt_decode: Use to_str() more
>   tools/intel_vbt_decode: Convert eDP deocding to use to_str()
>   tools/intel_vbt_decode: Use panel_bits()
>   tools/intel_vbt_decode: Decode display refclk mode
>   tools/intel_vbt_decode: Decode the backlight control method type
>
>  tools/intel_vbt_decode.c | 264 ++++++++++++++++++---------------------
>  1 file changed, 123 insertions(+), 141 deletions(-)

--=20
Jani Nikula, Intel
