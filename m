Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D42CAC583
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 14:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAA210E764;
	Tue,  9 Sep 2025 14:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DS4WOV5K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F46810E764
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757429902; x=1788965902;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=RLMo4+Y7M7SGCNNlcb2c5zRmjlR2PRzN07zNIhmHu5Q=;
 b=DS4WOV5KnOMvNEHSAj1NuaArGxkFgbfwlnliH616NgRfuUo0N9s4mL29
 id6Av8ByCCWCPVOXmhv37ep492jGX4UqY/2/gomF3AaOOcG4Gg8WB73x9
 nGurpngjQZj4Gm6sg1ibOx1i/7t3e1yspXgwawKqnQIEZWfZRrqoe19EQ
 pnM2RUHqxzQjao1JJ10U9geiIuxmcNxzo3ONZhe+25L9EAH/2xhyFAzKR
 v5Dvl49xzXDv3cKGkSHm+hVaOdOegDbWeD5rA8KUWD/AnzajkjOH50hkK
 oLefPPPLyKZzwM2VKUY1plJ3Sqs4jhQcl7kxvCSzsjAvG2VtQrMHODV68 A==;
X-CSE-ConnectionGUID: iUMOn058QU+yz9olEMc6gA==
X-CSE-MsgGUID: heRYoaJcTheLvIHKctM8XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="70815378"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="70815378"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 07:58:22 -0700
X-CSE-ConnectionGUID: 3H4+Y2bbStmW6VdrArF/7w==
X-CSE-MsgGUID: oHcrP3L4Q/G+jo3fpozesA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="177400019"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.180])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 07:58:21 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol
 =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH v2 i-g-t 3/4] lib/xe_eudebug: Fix safe_pipe_read
In-Reply-To: <20250908125448.13420-4-dominik.karol.piatkowski@intel.com>
References: <20250908125448.13420-1-dominik.karol.piatkowski@intel.com>
 <20250908125448.13420-4-dominik.karol.piatkowski@intel.com>
Date: Tue, 09 Sep 2025 17:58:18 +0300
Message-ID: <87qzwfn051.fsf@mkuoppal-desk>
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

Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@intel.com> writes:

> In case of poll() failure, safe_pipe_read returns -ETIMEDOUT that can be
> misleading, as the pipe could be already broken. Do an early return with
> -EPIPE if the poll fails.
>
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  lib/xe/xe_eudebug.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 667c31c6e..8e5664496 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -271,6 +271,8 @@ static int safe_pipe_read(int pipe[2], void *buf, int=
 nbytes, int timeout_ms)
>  		if (!ret) {
>  			catch_child_failure();
>  			t +=3D interval_ms;
> +		} else if (ret =3D=3D -1) {
> +			return -EPIPE;
>  		}
>  	} while (!ret && t < timeout_ms);
>=20=20
> --=20
> 2.34.1
