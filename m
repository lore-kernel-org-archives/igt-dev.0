Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D7BE7716B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 10:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBAD10E0CB;
	Wed,  4 Dec 2024 10:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KnZnmmC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7133710E0CB
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 10:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733309027; x=1764845027;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=QGO8MlUN0qp2XrWYrl+74scMvnJIPKcUd00iDLq+hdM=;
 b=KnZnmmC8+VyR2y+y504aIVRDHD9foSl/7e0LHYLVl21vUm/qXSjIF8DY
 RMlHCXZy0h37qky1w0h2RTfXwu0h/ChDLVM7L/qztLFsW/P6kDchpuEqL
 jPxWuLiK5hrqioSLzhjIr85LvkwLLupJlsa0+ythUk4T122GvAuNapT1r
 rg1g0RLmj6ofHw26HI6pY4okI01oUA9wO2mHb0OH1rOANfgK/EWxeYHgh
 AuwzItlPX5g5OoZ1ar11NH9O/hGuiZHHlAyRUeW/3/0Fbcu4VHf1tftgO
 e2WGw1gPHQRXFJeR4wgch10q1hreoiX1i0Kdh/txYmPe5njUYwrYwNzeX g==;
X-CSE-ConnectionGUID: RZMOtRcFSkuxxwUjC3yXhg==
X-CSE-MsgGUID: u+p/WerDSSytIdzQzbUMSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44178820"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44178820"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 02:43:47 -0800
X-CSE-ConnectionGUID: A5INq7alRjG+k7c48KFjBQ==
X-CSE-MsgGUID: TspGehd/SveJZYoPLgAThQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="93815664"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 02:43:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 mohammed.thasleem@intel.com, Santhosh Reddy Guddati
 <santhosh.reddy.guddati@intel.com>
Subject: Re: [PATCH i-g-t v1] tools/intel_hdcp: Introduce intel_hdcp tool
In-Reply-To: <20241204095654.3185959-1-santhosh.reddy.guddati@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241204095654.3185959-1-santhosh.reddy.guddati@intel.com>
Date: Wed, 04 Dec 2024 12:43:41 +0200
Message-ID: <87ikrz3ezm.fsf@intel.com>
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

On Wed, 04 Dec 2024, Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.c=
om> wrote:
> Add a new HDCP tool for self-testing and easy deployment
> to client machines. This tool helps diagnose issues,
> determining whether the problem lies in the driver or user space.
>
> The current changes include tool skeleton and get hdcp info
> on the connected outputs.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 203 +++++++++++++++++++++++++++++++++++++++++++++
>  tools/meson.build  |   1 +
>  2 files changed, 204 insertions(+)
>  create mode 100644 tools/intel_hdcp.c
>
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
> new file mode 100644
> index 000000000..8c0258092
> --- /dev/null
> +++ b/tools/intel_hdcp.c
> @@ -0,0 +1,203 @@
> +/*
> + * Copyright =C2=A9 2024 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.

Drive-by comment, please use SPDX.

BR,
Jani.


--=20
Jani Nikula, Intel
