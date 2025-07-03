Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66828C83030
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 10:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A2310E801;
	Thu,  3 Jul 2025 10:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S61EgH/I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEE210E7FD
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751539289; x=1783075289;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=tPul9Aj4wGRXmHGFrGgBHNIRYEidVM0ZhReyAAJOBfI=;
 b=S61EgH/I9wxbcbPUpj+Jfjv1kp5avexf9aubPHqqHcyiEDHVwfnP10wr
 uHrTuPZG7MUay8AYhtRkOrRcrPqi0/KdEFye1En1OlVH82xDw0VCprd7r
 rF9yt51RoKyWssI5GwRuuTrH/kc3/DG5Rk3PvtQ4II2D/5IkMUvg1/Dyo
 okrTymzqLYM0zl0pUMNoVbYMqu0SEIDAdE4iAQrFHRItp69b2HKFA2+AY
 n08MTXrgDRoYu0LAO2CbKXCsq/J4ABibPz+KwnvPE92X2RROfq4GusGWH
 31FNYjwXqiI/WdyhkVTByFYQ3KWL8y02USa5iqv5OxuGsPdJ89Wdr1XdT w==;
X-CSE-ConnectionGUID: aL6aYySzRrS+gzB9GqSWKQ==
X-CSE-MsgGUID: JpRGXfCCQfG7/Dtq6+shNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53786672"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="53786672"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 03:41:29 -0700
X-CSE-ConnectionGUID: nEOA3YOIRy6DWBGgyBoT/w==
X-CSE-MsgGUID: 6ASF2VcKQhy/fG1D2G07pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="185356725"
Received: from savramon-mobl1 (HELO localhost) ([10.245.244.83])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 03:41:27 -0700
Date: Thu, 3 Jul 2025 12:41:26 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for TG
 preemption detection improvements
Message-ID: <umdqxahp5k2qztdyqep7alb7ociytx4btz3j3u4ebwxhxfuysh@wxau62yiuw6t>
References: <20250703063032.553963-5-zbigniew.kempczynski@intel.com>
 <175152972891.130810.17788540851737064057@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175152972891.130810.17788540851737064057@1538d3639d33>
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

On Thu, Jul 03, 2025 at 08:02:08AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  TG preemption detection improvements                             
>    URL:     https://patchwork.freedesktop.org/series/151107/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13394/index.html 
> 
>            CI Bug Log - changes from XEIGT_8434_BAT -> XEIGT_8435_BAT
> 
> Summary
> 
>    SUCCESS
> 
>    No regressions found.

Extremely interesting, no regressions but this reports 'failure'.

--
Zbigniew

> 
> Participating hosts (8 -> 8)
> 
>    No changes in participating hosts
> 
> Changes
> 
>    No changes found
> 
> Build changes
> 
>      * IGT: IGT_8434 -> IGT_8435
>      * Linux: xe-3335-e46fcd77ceacb06a5411cb77b7344d6b82e1ab72 ->
>        xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407
> 
>    IGT_8434: 5185b9527673518a418d575c3f58b5554e27f111 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8435: 157b34af651681184df1f41c47576f77c3b784f1 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-3335-e46fcd77ceacb06a5411cb77b7344d6b82e1ab72:
>    e46fcd77ceacb06a5411cb77b7344d6b82e1ab72
>    xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407:
>    d04a54cd3b99001adbc4cd3305b44f9f3e658407
