Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A037CFD35B
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 21:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D9610E32C;
	Mon, 24 Nov 2025 21:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+jXJ61C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3331310E32C
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 21:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764020300; x=1795556300;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=3URXVFo63KWSN8z+oKXy6I/mY2DEoBcmFvw5kdBaOm4=;
 b=J+jXJ61CNslAlBuqoEnOoqB0b6FsD5Q9afckFiMMdxIVtVBCRpJeNq2q
 H5KU9Rxc31WVl9OYZ2XDboOzKA7/qoYVDsUNw7ocA+SLeViQbg9fJBFxT
 Y3+JF+Et0TnSA0e2gqhQv8rYfHzO5cOjOXlFiwaefPZ7/S4h7yTfVhFe2
 p0uIMtn0MdiBXu45cJsCi95Gx8wi+ePelWtprxFigg+bNJu6cgWPMq188
 VZ05MAdqGUDqF0V9mKR+fvC0eGI1mTJRrMtI/L0mQOXvdeGL8UNz4t0Oj
 PRv8l/vtcPnAJu5eKNnD3B7ibX2U1cw+BfU23ViwnUU3l/CluCCSjTEIA g==;
X-CSE-ConnectionGUID: KGp1ChV5R+eVF6s/uqgukw==
X-CSE-MsgGUID: kL2bHaqbT/mgU7h5ifnDIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69652741"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="69652741"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:37:14 -0800
X-CSE-ConnectionGUID: PyI1mSnGQqOHDDKG+9VzxA==
X-CSE-MsgGUID: 4h2heHycRSGE7AkYfNZngg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="192100510"
Received: from rubishem-mobl.ger.corp.intel.com (HELO [10.245.32.232])
 ([10.245.32.232])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:37:12 -0800
Message-ID: <b391bb85-60c5-40b7-9a9d-0e0734768357@linux.intel.com>
Date: Mon, 24 Nov 2025 22:37:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/7] igt: Help out coccinelle
To: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
 <b1d1fc5f-09d8-4046-b99c-77677a5b2b06@linux.intel.com>
 <c22c7a7b942a53bc8699121226d0b4dc2895b066@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <c22c7a7b942a53bc8699121226d0b4dc2895b066@intel.com>
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



On 11/24/2025 9:57 PM, Jani Nikula wrote:
> On Mon, 24 Nov 2025, Peter Senna Tschudin <peter.senna@linux.intel.com> wrote:
>> Hi Ville,
>>
>> I need to see the value proposition before supporting ~2000 lines of churn.
>>
>> - Can you share the specific Coccinelle scripts that require these changes?
>> - What transformations are you planning that can't work with the current
>> syntax?
>> - Have you attempted these transformations and confirmed current syntax
>> blocks them?
>>
>> More importantly: Coccinelle provides mechanisms to handle non-standard
>> macros (iterator declarations, custom isomorphisms, virtual rules,
>> etc.). Have you exhausted all options for teaching Coccinelle about our
>> existing macro syntax before concluding we need to modify the codebase
>> itself?
>>
>> It seems backwards to change ~2000 code locations to accommodate a tool
>> when the tool is designed to be configurable for exactly these situations.
> 
> Generally speaking, Coccinelle is not a user-friendly tool. And that's
> about the nicest way to put it. It takes a while to get used to, and to
> get even the simplest changes done. But it can be really powerful when
> you've banged it into submission.

While I do not agree with you, I understand it can be frustrating at
times. The mailing list has a very low latency, and it is very helpful
for debugging your semantic patches.

Before committing to 2000 lines of mechanical changes, I'd like to see:

1. Documentation of the specific Coccinelle transformations being blocked
2. Evidence that Coccinelle's configuration mechanisms (iterator
declarations, isomorphisms, etc.) were explored
3. The specific technical limitations preventing a Coccinelle-side solution

I know that Coccinelle is designed for adapting to project-specific
syntax. The Linux kernel successfully uses iterator declarations and
custom includes to handle complex macro patterns. There are limitations,
and if that is the case for us, the limitations should be _well_
documented here.

If we've genuinely exhausted these options, I'd suggest posting to the
Coccinelle mailing list. Julia Lawall and the team are very responsive
and will advise whether our macro patterns are fundamentally
incompatible or if there's a configuration approach we're missing.

I am confident that if there are low hanging fruits on the Coccinelle
side that can be used to support our use case, the Coccinelle team will
consider implementing it for our code base.

If the Coccinelle team confirm our patterns can't be reasonably
supported through configuration, or if the workarounds would be too
complex for contributors to maintain, then I'd consider updating our
codebase.

[...]
