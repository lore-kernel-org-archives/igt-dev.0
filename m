Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA802C021A4
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 09:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA1510EC16;
	Fri, 14 Feb 2025 09:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zok0Vtai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E64310EC16
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 09:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739525190; x=1771061190;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Z20VyG2fYoXEqaSF6uzqkyyj/ZJsx7ABX7GTfhtv59Q=;
 b=Zok0VtaiyUsCIcNVWoAS5jmlpqjcjtcwdpX7SMAfjHzgQ4JD+39qBEfq
 ycznJ9vBSJrRgjseR1gPhkYhMeuiJYrikf4fr2X21WT+Uo2AqG8GFmepy
 5Jm48T6liFWCgJDI4j6xEPdQZf8vt+jUwN3dbxqDT6pKiIKPp6D7BI1cG
 baG6UPjlbyEAkqAtmy1q+XQVGp19OevzlXHvFm2X58ZwoMnyO7xZcakMx
 pTFuCOn1dto65L00ZfIZF6ltETtJgD1c/WQPYNOmSqJnj7QhrofhgwsxO
 ZaXW2dwcL76FYFOCOFT/FtUVzy9lYpbVhab9e8alb4Je8CRoVW3cPLLKs Q==;
X-CSE-ConnectionGUID: EpT48vV4SvmpksgWBFa1lQ==
X-CSE-MsgGUID: wJ+UN2XyRpGNGrYWtBHSuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40139990"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40139990"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:26:30 -0800
X-CSE-ConnectionGUID: YsP0JERwRSSKsYP1XThdNA==
X-CSE-MsgGUID: Mgpp3STgTwe2dopIGgr3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="113599718"
Received: from pkoski-mobl1.ger.corp.intel.com (HELO [10.245.83.54])
 ([10.245.83.54])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:26:27 -0800
Message-ID: <e952ae21-08b6-401b-96dc-f13933f5d8a2@linux.intel.com>
Date: Fri, 14 Feb 2025 10:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Bump aborting on network failure deadline to 40
 seconds
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com,
 katarzyna.piecielska@intel.com, ryszard.knop@intel.com,
 ewelina.musial@intel.com, adrinael@adrinael.net, mateusz.grabski@intel.com,
 konrad.b.brodzik@intel.com
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
 <20250211092108.enj3kzrlh3rzh6rk@kamilkon-desk.igk.intel.com>
 <d137decd-4adf-474b-a56b-1398ef5472d1@linux.intel.com>
 <20250212145922.mw7obok46u2appzy@kamilkon-desk.igk.intel.com>
 <fe66128f-aa56-4911-b2b1-3fbef4e0d007@linux.intel.com>
 <20250213133744.ilaasvjp5m7ykddx@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250213133744.ilaasvjp5m7ykddx@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 13.02.2025 14:37, Kamil Konieczny wrote:
> Hi Peter,
> On 2025-02-12 at 16:38:34 +0100, Peter Senna Tschudin wrote:
>>
> 
> One nit I forgot to add, in subject there should be 'runner: '
> prefix, just like in commit you cite in beginning.

Sorry about that. Even the patch I reference in the commit message has
the runner: prefix. My bad.

> 
> In conclusion, are you ok with me aditing 2nd paragraph, dropping
> 4th paragraph where you wrote about internal-upstream CI,
> dropping 'internal' word plus adding 'runner: ' prefix in subject?
> If yes I could merge it.

Sure, looks good to me. Please mind that I refer to internal three
times one time on the original second, third, and fourth paragraphs.
Feel free to adjust the commit message as needed.

> 
> Regards,
> Kamil
[...]
