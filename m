Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA6BC02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 14:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E92C10E8E0;
	Wed, 12 Feb 2025 14:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7NPQGNp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521AF10E8E0
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 14:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739372235; x=1770908235;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=l7OEYapg8iDde6QTJqdm1rDFWgAZyWnWvjm84GFC22Y=;
 b=Z7NPQGNpXayTuibxU7d+vbw+QFDQBSy9NBogOfkzz61mlvmn9qJcdFzm
 xqA60InWJZ/hD7XxDoJvhFMzzF/jSYYAqZcXJmiN6YcUgkHICwxx6p3fA
 E7whbj+I9JM5YNr8rqaHZgk7rcmgxEGhoVICH7A/nps2ZKduM3wHUV0GT
 oYgn8u3sBi2aZyGGqnyJpgij4PlT3gc+3IFlD5jmkuG9MsM84BP+28/So
 dxlba853H9Sh+gfwgriaBpEZuNoe2cNyq6g94r7mCNNG4BOBue/DTW2Xx
 CuF3W3kI48HSs0IM8UUM+gE5OFbG5jlgMgfQffJzoweMxNe0Nbi/8/o7m Q==;
X-CSE-ConnectionGUID: eNbN1tPhTeu6hesuBnuR1w==
X-CSE-MsgGUID: dG2ueoq7RF+eOvHKcp/+Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51463876"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51463876"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 06:57:14 -0800
X-CSE-ConnectionGUID: +C/zeZ6TQQWEx7G5HMc1Fw==
X-CSE-MsgGUID: x7aIA+tGT/Su5VRDZIPACw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136114066"
Received: from fzwolins-mobl.ger.corp.intel.com (HELO [10.246.0.226])
 ([10.246.0.226])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 06:57:12 -0800
Message-ID: <bd792882-3d64-4afc-bce9-66f2741da3bf@linux.intel.com>
Date: Wed, 12 Feb 2025 15:57:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <20250128151537.515639-2-peter.senna@linux.intel.com>
 <20250131123454.ilhzogs6a2w7s3on@kamilkon-desk.igk.intel.com>
 <17fe9952-7b2e-46fd-af1f-cd7cbea2cebd@linux.intel.com>
 <20250211161734.nm6dsq3ahhcn7hvz@zkempczy-mobl2>
 <5f9f0b38-343b-4b1a-b5c7-ad1706fa2ddd@linux.intel.com>
 <20250212083614.w6nmqvkblab3ha4c@zkempczy-mobl2>
 <5bbb923f-e81a-4c54-b1f7-10e6d8561369@linux.intel.com>
 <20250212100157.zgzmorbk7rd3ogd3@zkempczy-mobl2>
 <af2caad1-7daf-4ffb-8e04-fe6b69f9f233@linux.intel.com>
 <20250212134137.wiccesysfk2aylmb@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250212134137.wiccesysfk2aylmb@kamilkon-desk.igk.intel.com>
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



On 12.02.2025 14:41, Kamil Konieczny wrote:
> Hi Peter,
> On 2025-02-12 at 14:12:44 +0100, Peter Senna Tschudin wrote:
>>
>>
>> On 12.02.2025 11:01, Zbigniew Kempczyński wrote:
>>> On Wed, Feb 12, 2025 at 10:18:17AM +0100, Peter Senna Tschudin wrote:
> 
> [...]
> 
>>>> Resume: I prefer to wait until the initial feedback from CI and developers.
>>>> I will be happy to move this to runner later if we decide to not walk the
>>>> unknown road of trying to catch as many transient leaks as we can.
>>>>
>>>> That being said, let me know how to move forward.
>>>
>>> Question is to CI folks, for me this scan should be executed as
>>> dedicated CI run with kmemleak on. And I repeat - I don't see reason
>>> we should add this support to the tests, as few line script which
>>> wraps around test by kmemleak clear/scan is enough. We already have
>>> scripts directory so it is good place for such wrapper.
>>
>> So I am moving the code to the runner directory, and using printf() instead
>> of igt_warn(). Any other request for the series?
>>
>> [...]
>>
> 
> or fprintf() or write() so you could write to a file instead
> of stdout, as stdout isn't collected now by runner itself (it
> goes to igt_runnerNN.txt but that is another story).

The errors in question here are exactly about writing to disk, so
I am positive that it only makes sense for them to go to stdout or
stderr. Are you ok with printing an error message instead of trying
to save to disk?
