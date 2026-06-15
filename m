Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C78CD98C7
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A2410E353;
	Mon, 15 Jun 2026 10:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYiehGW4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DF810E33C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781519620; x=1813055620;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=zxzysUuN+oJmvCxefKU3hhYs9h8jc8blB/zvahFB61w=;
 b=JYiehGW4L4xFaw2BbOb8eD+XgHWisuHM3h/Km+AYvMd0Gj40Q+ErEb8l
 39qxHJDbuOKCAkR8FAhyhbmZ05CgJtb856YE2uXH74+FH/Q8f0edMTwPf
 YXH3/GnVSx8xQuY+AVahoIEVPzwpukNNeDingWHu6heP7a6ZtkI+oud7X
 gSbMs11yEKjgpiTmmNppgYs7O2XnOMIwxojOp93pv3oLJEaR+nxncig4F
 RWBIsflb+HBtafwH13HlRqsB0l43G9aGZxYZxDjedjWC2NYL6kgauWxPZ
 aP+sMP+4cwq8hx5ULkUME4qKzyJIVWB2IVQ6/4GDqQqB77x5EXe1/3U1+ w==;
X-CSE-ConnectionGUID: tmn4EKJ1SGCN+mykLqGzKw==
X-CSE-MsgGUID: O90asDq4RdKi5xbZsNA5VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82319563"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82319563"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:33:40 -0700
X-CSE-ConnectionGUID: 5PWfyqn8TxmJ5ENuD+K/fA==
X-CSE-MsgGUID: KoEM5iihQnuEx/nJ+Uy1Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="252391787"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:33:38 -0700
Date: Mon, 15 Jun 2026 12:33:35 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>, 
 =?ISO-8859-15?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 06/10] tools/intel_vbt_decode: fall back to
 guessing PCI ID from VBT signature
In-Reply-To: <20260615093137.681050-7-michal.grzelak@intel.com>
Message-ID: <03d110cf-ebf6-39bf-2303-082652159d93@intel.com>
References: <20260615093137.681050-1-michal.grzelak@intel.com>
 <20260615093137.681050-7-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-974073440-1781519619=:605841"
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

--8323329-974073440-1781519619=:605841
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 15 Jun 2026, Michał Grzelak wrote:
> From: Jani Nikula <jani.nikula@intel.com>
>
> From: Jani Nikula <jani.nikula@intel.com>
>
> If the PCI ID wasn't passed on the command-line, DEVICE environment
> variable, or VBIOS, fall back to guessing the device ID from the VBT
> signature.
>
> Cc: Michał Grzelak <michal.grzelak@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>

> ---
> tools/intel_vbt_decode.c | 2 ++
> 1 file changed, 2 insertions(+)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 0956d34dc2..a2e57206d6 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -4331,6 +4331,8 @@ int main(int argc, char **argv)
> 	}
> 	if (!context.devid)
> 		context.devid = get_device_id(VBIOS, size);
> +	if (!context.devid)
> +		context.devid = intel_guess_device_id(context.codename);
> 	if (!context.devid)
> 		fprintf(stderr, "Warning: could not find PCI device ID!\n");
>
> -- 
> 2.45.2
>
>
--8323329-974073440-1781519619=:605841--
