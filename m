Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EF4C0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 13:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A896510E2D3;
	Tue, 11 Feb 2025 13:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SL1dOxMJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C7E10E2A4
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739281113; x=1770817113;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2lqs/fnoKIjbYowDMJUQR+rpeO/gPibrpTrC5CPB7uw=;
 b=SL1dOxMJH3+CHy9oMJtV2KugZTNqTUi5FjZr0KyJVDoGri1XSrVvMklD
 xWXCUk6Kq1IVGm4DZSntbb7xmTqYRbV4bM/vkcXt6OLquYrIGnQ715pGL
 8tbJpVb4diJXtEEjlkZwEmAmQPnaXv/OhJaJVlyA+7NwaP8Lq1JsmkRy0
 QzAb2J0c6uJxdjdgFx85FR5BTRxnzeeMU5nmWpP23A6wMzBhtojWP2Hmp
 qbxteHUoEA1OnmwF+cWGTgatj2pFdc3Kqg5AqsrvDOhxvuP8cCyC0W1CC
 J3IsdY8ti6v+50egorCzC906zXJ+DER5e7felziSV1VnqXoV5ehUj2TlY Q==;
X-CSE-ConnectionGUID: /jxTV258RVGpSgkdR6CpHg==
X-CSE-MsgGUID: uQKWbB05RreOrqxmStP+Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43660011"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="43660011"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 05:38:33 -0800
X-CSE-ConnectionGUID: TbWjFG+8Shic3mR5VRUdnw==
X-CSE-MsgGUID: pD6zPzU4QM+heIMHaRNyoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113002490"
Received: from pnass-mobl.ger.corp.intel.com (HELO [10.245.112.60])
 ([10.245.112.60])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 05:38:31 -0800
Message-ID: <e9aeefb5-942b-495d-9b0e-bc3c33cb9ccc@linux.intel.com>
Date: Tue, 11 Feb 2025 14:38:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Bump aborting on network failure deadline to 40
 seconds
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>,
 "Musial, Ewelina" <ewelina.musial@intel.com>,
 "adrinael@adrinael.net" <adrinael@adrinael.net>,
 "Grabski, Mateusz" <mateusz.grabski@intel.com>,
 "Brodzik, Konrad B" <konrad.b.brodzik@intel.com>
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
 <20250211092108.enj3kzrlh3rzh6rk@kamilkon-desk.igk.intel.com>
 <d137decd-4adf-474b-a56b-1398ef5472d1@linux.intel.com>
 <IA1PR11MB6097AD4DB631A02EF73EAE1886FD2@IA1PR11MB6097.namprd11.prod.outlook.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <IA1PR11MB6097AD4DB631A02EF73EAE1886FD2@IA1PR11MB6097.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Kasia,

On 11.02.2025 12:59, Piecielska, Katarzyna wrote:
> Hello Peter
> 
> 
> 
> Hi Kamil,
> 
> Thank you for your review. Please see below.
> 
> On 11.02.2025 10:21, Kamil Konieczny wrote:
>> Hi Peter,
>> On 2025-02-06 at 16:21:47 +0100, Peter Senna Tschudin wrote:
>>> Commit ddfde25f16ba ("runner: Add support for aborting on network
>>> failure") introduced a 20 second deadline for the DUT’s network to 
>>> recover after a suspend/resume cycle. If the network isn’t back up 
>>> within that time, igt_runner aborts the test run to save logs and 
>>> prevent potential log loss from an imminent power cycle.
>>>
>>> This deadline was set to accommodate our internal CI system, which 
>>> checks for DUT network connectivity every 5 seconds and retries up to 
>>> 3 times at 20 second intervals. If it fails 3 consecutive checks,
>>
>> This is a little confusing, you wrote in first paragraph about
>> 20 second deadline and here it looks like 60 seconds (3*20).
> 
> The first paragraph is explicitly about the deadline introduced by a previous commit. The second paragraph is explicitly about the internal CI mechanism that inspired the deadline. Can you explain what is confusing?
> 
>>
>>> it triggers a power cycle on the DUT.
>>>
>>> Although our internal CI system can be configured with a longer
>> -------------- ^^^^^^^^
>> Remove this.
> 
> No, why?
> 
> 
> Kasia -> This is upstream review, no need to add word 'internal'.

This entire discussion is about safety mechanisms from our internal CI.
Even the commit that I talk about, ddfde25f16ba ("runner: Add support for
aborting on network failure") was created to work well with our internal
CI.

What is the problem?

> 
>>
>>> wait time, extending it further would unnecessarily prolong tests in 
>>> cases of DUT hangs.
>>>
>>> Bumping the deadline to 40 seconds keeps the abort mechanism safely
>>
>> imho this should be option for igt-runner, I would prefer to not 
>> adjust it later, let CI team tune it. Option could be either time or 
>> retry counter or both.
> 
> I disagree. We can add value now by potentially preventing premature aborts with very little risk of creating any issue. The people in CC seems to agree with that.
> 
> This patch is as simple as it can get. I don't buy the benefit of the extra complexity of adding yet another command line option. It is way more effective to send one of these every 6 years or so.
> 
> Am I correct that this is a nack from you?
> 
> This looks like we need a good discussion with CI team. @Knop, Ryszard @Grabski, Mateusz can you comment on this approach?

What is not clear? Not sure there is any open here.

Thanks,

Peter
