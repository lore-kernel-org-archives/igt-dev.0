Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94F2C25B78
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 05:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253B810E448;
	Thu, 30 May 2024 05:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YM8X/TEX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACE610E448
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 05:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717047338; x=1748583338;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=ZJANrHzePO5R/WqX5ub4x7dnMyhq5IS/RcR552PlJbY=;
 b=YM8X/TEX1ZPvgf7UmOILAr62eVVXZPeWzv0MtjzhfYmhLg3Z5Bstw23L
 36tEsutBRgJTrl2KFsea1583tCOj5YNOFRsG0APCiYL1VMFoMhJp1mPwo
 Ss3Ek3OjL1R0fcLIqS0dodxRZwOTh6aK1Znyg5e+gIth4F8uH7tlopJad
 AF3ih8a3ZNMs5/Qsw+AlRiYdnGu5I7CN22H5GqFuD7JgfjCph/Asm3d1K
 GUu+Hjvrey1yf/tfyeLRSeGIlcus++kVf+NjmjyVGJpjd/y6H5eNgI5xR
 qFwCW8ks4Z1Or7UstGEOKA78v3nHmP0WB9ksi6fV2xwYNt9ujmSN5O1XC Q==;
X-CSE-ConnectionGUID: DRhOSCeRRLWtqBcAB2hspA==
X-CSE-MsgGUID: qBDFNZi0STmTcjIqG27i1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17337287"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208,217";a="17337287"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 22:35:37 -0700
X-CSE-ConnectionGUID: IyPcKVepQGmpjLg926olhA==
X-CSE-MsgGUID: RmxjysGJS6WCyrpEVcbw2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208,217";a="66550746"
Received: from joshikun-mobl.gar.corp.intel.com (HELO [10.247.237.53])
 ([10.247.237.53])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 22:35:36 -0700
Content-Type: multipart/alternative;
 boundary="------------6s64Yz8SXZOauNZchb7SUOPb"
Message-ID: <ec4b6897-d705-4ad4-a978-1ca7e745f238@intel.com>
Date: Thu, 30 May 2024 11:05:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,3/4] lib/igt_psr: Handle PR_MODE2_SEL_FETCH and eDP PR_*
 in psr active check
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240521090233.1998323-4-jouni.hogander@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240521090233.1998323-4-jouni.hogander@intel.com>
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

This is a multi-part message in MIME format.
--------------6s64Yz8SXZOauNZchb7SUOPb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/21/2024 2:32 PM, Jouni Högander wrote:
> Panel Replay expected state is always SRDENT for DP2.0 Panel Replay.
> For eDP1.5 Panel Replay it is SLEEP. Due to this output is now mandatory
> parameter to psr_active_check if PSR mode is Panel Replay.
>
> Bspec: 68920, 68934
>
> v2: fix mode checks
>
> Signed-off-by: Jouni Högander<jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
--------------6s64Yz8SXZOauNZchb7SUOPb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/21/2024 2:32 PM, Jouni Högander
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">Panel Replay expected state is always SRDENT for DP2.0 Panel Replay.
For eDP1.5 Panel Replay it is SLEEP. Due to this output is now mandatory
parameter to psr_active_check if PSR mode is Panel Replay.

Bspec: 68920, 68934

v2: fix mode checks

Signed-off-by: Jouni Högander <a class="moz-txt-link-rfc2396E" href="mailto:jouni.hogander@intel.com">&lt;jouni.hogander@intel.com&gt;</a></pre>
    </blockquote>
    <span class="reviewed-by" style="box-sizing: border-box;">Reviewed-by:
      Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a></span>
  </body>
</html>

--------------6s64Yz8SXZOauNZchb7SUOPb--
