Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A643C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 10:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEA710E7C5;
	Thu, 12 Jun 2025 10:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHGK37pW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C014710E7C5
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749723693; x=1781259693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CYx4DfsN8SHwg8UD0U9UXkMw8MvjiK37R0g8sXHmYU4=;
 b=WHGK37pW/Hu9x+yO3DnoTT8SElZx00y6laTqbqNcbO3xSKIq0UdV+FE1
 vwneNx+udpGRU80es/LOenW+Zwd3G+PKbT7vlYklX8Gc1OgakK0sjqBVa
 gXwU/Z7Nzv/BrOLzbN3p5NBd4XlEepyabgN48grEp24YAXmun+ZblgmQt
 5Qn40NjWWS/I6DblM3Dj/wAnz1JuMSLcAJCEJAc8T3UNTHQTZyAWEPhPf
 WVsFHUIBKHXDFZ8q5X2vH1ahAchqxXJj9Kjxxxb7hBJ1u4J86yhn9N+7k
 6EajDrGBRcy1tTDafkPyRJEHiZjXRDcwCHPZ9SiYkZREq4XO/4o9AOSSz g==;
X-CSE-ConnectionGUID: jG2e6LRWSYe4DIHwYIsSrA==
X-CSE-MsgGUID: 3si9pfNqRcil08SN9aDV2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63240864"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="63240864"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:21:33 -0700
X-CSE-ConnectionGUID: egOV1rNZT1ePcS4KCFWP0A==
X-CSE-MsgGUID: hDFu+WNJQ7mcLb94tMebng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147463900"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 03:21:31 -0700
Date: Thu, 12 Jun 2025 12:21:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, mohammed.thasleem@intel.com
Subject: Re: [PATCH i-g-t v3 1/2] lib/igt_panel: Validate vendor name in
 igt_is_panel_blocked
Message-ID: <20250612102128.qsva54prnutbvzjf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, mohammed.thasleem@intel.com
References: <20250612051326.430330-1-santhosh.reddy.guddati@intel.com>
 <20250612051326.430330-2-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612051326.430330-2-santhosh.reddy.guddati@intel.com>
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

Hi Santhosh,
On 2025-06-12 at 10:43:25 +0530, Santhosh Reddy Guddati wrote:
> Avoids false positives by returning false early when the vendor name is
> NULL, empty, or a single whitespace character.
> 
> V2: Add Fixes tag (Suraj)
> 
> V3: Split the commit and indentation (Kamil)

You didn't desciribe code style fix here, is it needed?

> 
> Fixes: ec444a83c8ff ("lib/igt_panel: Skip hdcp tests on unsupported panels")
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  lib/igt_panel.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_panel.c b/lib/igt_panel.c
> index c89bf9123..a5aa83e8b 100644
> --- a/lib/igt_panel.c
> +++ b/lib/igt_panel.c
> @@ -20,11 +20,15 @@
>   * true if the vendor name is found in the blocklist, false otherwise.
>   */
>  bool igt_is_panel_blocked(const char *vendor_name,
> -			    const char *const blocklist[],
> -			    size_t blocklist_size)
> +			  const char *const blocklist[],
> +			  size_t blocklist_size)

Try to avoid mixing code style fixing with real bug fixing.
Here it looks ok as it is located in one hunk.

>  {
>  	int i;
>  
> +	if (!vendor_name || vendor_name[0] == '\0' ||
> +	    (vendor_name[0] == ' ' && vendor_name[1] == '\0'))
> +		return false;
> +

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  	for (i = 0; i < blocklist_size; i++) {
>  		if (strstr(blocklist[i], vendor_name) != NULL)
>  			return true;
> -- 
> 2.34.1
> 
