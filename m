Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7191C02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 08:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7127110E4F9;
	Tue, 21 Jan 2025 08:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjbhTrgn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8985710E4F9
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 08:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737447389; x=1768983389;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=VrRl5Twf7Lk5jT8gnWcm25IhOCM/YrUMQVGs8WSfxZc=;
 b=EjbhTrgnixONY9wcw0g/vzFYowtYcPQfqfUCpIvLl+vvQjjR3VQuPo4Y
 y4NJ9atN3YD4aymIYXgggFf1YPaDemcQpXXVpP5LnYeQe2Ub9DmXyZQca
 rGw26ms14jIh/KP/uckK1Maagnu6JGM8+FyjiM7E2f/dp9/+b+qdYPGDV
 REavGF8kBVM/bae3Zo7psDiYfoy+va95kzprGtaz6ZuZBa8KJ7lzRV0rN
 1xcBHq+ssyUfyrN8YzMeFrimUqJL75p0Sh1XFpUdbUNwEIMDLV7gPqb0U
 ETBwF2w+tfnFpww+JjE2UeliokjmS+3gkp3JQ3lpSqMOhe6X1qzXA/pin w==;
X-CSE-ConnectionGUID: aTaM6uKvQ/Oe9FkbjIERaw==
X-CSE-MsgGUID: C5gx/4XvSfyzF48x9WM9wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="55396405"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="55396405"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 00:16:29 -0800
X-CSE-ConnectionGUID: aU3VJucIQDu58o1kn5DG8A==
X-CSE-MsgGUID: imxPVYU5Sz+7jm+Z93qS9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="106668486"
Received: from zhenyiz1-mobl.ccr.corp.intel.com (HELO [10.245.113.241])
 ([10.245.113.241])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 00:16:24 -0800
Message-ID: <23457bf4-ee02-4da4-8c98-33866bdb56a7@linux.intel.com>
Date: Tue, 21 Jan 2025 09:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v14 resend 1/3] lib/igt_facts: Library and unit
 testing for fact tracking
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Petri Latvala <adrinael@adrinael.net>, Rob Clark <robdclark@chromium.org>,
 Ryszard Knop <ryszard.knop@intel.com>, Swati Sharma
 <swati2.sharma@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 dominik.karol.piatkowski@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com
References: <20241216151420.43042-1-peter.senna@linux.intel.com>
 <20241216151420.43042-2-peter.senna@linux.intel.com>
 <20241219124015.57unqsj6kiun3bff@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20241219124015.57unqsj6kiun3bff@kamilkon-desk.igk.intel.com>
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


Hi Kamil,


On 19.12.2024 13:40, Kamil Konieczny wrote:
> Hi Peter,
> On 2024-12-16 at 16:14:18 +0100, Peter Senna Tschudin wrote:
> 
> I have few nits about a code, I checked it with checkpatch.pl
> and looks like some warnings are left, why not removing them?
> Here are some found by it:
> 
> 0001-lib-igt_facts-Library-and-unit-testing-for-fact-trac.patch:824: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "fact"
> #824: FILE: lib/igt_facts.c:736:
> +       igt_assert(fact != NULL);
> 
> 0001-lib-igt_facts-Library-and-unit-testing-for-fact-trac.patch:825: CHECK:BOOL_COMPARISON: Using comparison to true is error prone
> #825: FILE: lib/igt_facts.c:737:
> +       igt_assert(fact->present == true);

There is a very important detail here. It is error prone only when
the type is not bool. My code is not error prone.


> 
> 0001-lib-igt_facts-Library-and-unit-testing-for-fact-trac.patch:913: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
> #913: FILE: lib/igt_facts.h:40:
> +};
> +extern struct igt_facts_config igt_facts_config;

Good catch, thank you.

> 
> total: 0 errors, 3 warnings, 23 checks, 858 lines checked
> 
> 0001-lib-igt_facts-Library-and-unit-testing-for-fact-trac.patch has style problems, please review.
> 
> Especially when there are many it is easy to overlook an issue,
> one such is comparision with 'true', I searched your code for '== true'
> and one place needs fixing:
> 
> grep -n '== true' lib/igt_facts.c
> 680:    igt_assert(ret == true);
> 690:    igt_assert(fact->present == true);
> 733:    igt_assert(fact->present == true);
> 737:    igt_assert(fact->present == true);
> 769:    igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head) == true);
> 
> Last line may be an issue, as sometimes pointer comparision could
> be implemented in runtime as 'return (src - dest)' so please fix all
> using template:

I don't think so as the type is bool. I can't imagine a way to make this go
wrong. Can you give me an example showing how a bool type can be evaluated
incorrectly? What am I missing here?

> 
> igt_assert(val == true); --> igt_assert(val);
> 
> In summary, please fix BOOL_COMPARISON, COMPARISON_TO_NULL,
> LINE_SPACING, PARENTHESIS_ALIGNMENT.
> 
> Please remove extern from header, it is not needed:
> 
> extern struct igt_facts_config igt_facts_config;

yep yep, this is twice on the email...

[...]
