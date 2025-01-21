Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F68C02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 11:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D4410E144;
	Tue, 21 Jan 2025 11:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITJuRsh0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA3410E144
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737460366; x=1768996366;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iLa9PMvUAaJ5jdxcCDu+7uoJ0Yz8wi+oKLlUFbBoymk=;
 b=ITJuRsh0UOTqwAC7SJ9BMBndYPq29SLl5eCiduIdUixmSUeL8PEUb+lj
 ebF6/rMdORk+FqYmsDgCyD4L9i/PyXlHIjiVQp1DE3qtW6BO7qN00XTX0
 qe0rabIM6wcSNpU/d3gte1BIjOpzcTcZASVWo62pEPT4K0weZcJaGw4Jt
 awMwQzhvTLs++ffxgrwVShgaDDPNsCET+sX9aNx3wjME+6Au/PRo/gt31
 vPbhrMbxP2Djwqg7febkmpsmUgTWvh4F2GWIGQpYafOfKJdGVqPmnkBQo
 pD/YEAWQpeNcicSOuW/+/oqmCH0+H2VpNEaoWEOXD6l6psdMolhBInh3t A==;
X-CSE-ConnectionGUID: X54ixgf3RU6u5k+9LJ5kLA==
X-CSE-MsgGUID: C12nlNxQRZ+4w2hmOyAEdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37894189"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="37894189"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 03:52:45 -0800
X-CSE-ConnectionGUID: 6tml/dfJQzex96/5mq5XIw==
X-CSE-MsgGUID: 771NBWpoQzuWWOTc9VUnFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="111786193"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 03:52:40 -0800
Date: Tue, 21 Jan 2025 12:52:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <robdclark@chromium.org>, Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 dominik.karol.piatkowski@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com
Subject: Re: [PATCH i-g-t v14 resend 1/3] lib/igt_facts: Library and unit
 testing for fact tracking
Message-ID: <20250121115228.6vlijshl7mz2tt6m@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <robdclark@chromium.org>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 dominik.karol.piatkowski@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com
References: <20241216151420.43042-1-peter.senna@linux.intel.com>
 <20241216151420.43042-2-peter.senna@linux.intel.com>
 <20241219124015.57unqsj6kiun3bff@kamilkon-desk.igk.intel.com>
 <23457bf4-ee02-4da4-8c98-33866bdb56a7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <23457bf4-ee02-4da4-8c98-33866bdb56a7@linux.intel.com>
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

Hi Peter,
On 2025-01-21 at 09:16:19 +0100, Peter Senna Tschudin wrote:
> 
> Hi Kamil,
> 
> 
> On 19.12.2024 13:40, Kamil Konieczny wrote:
> > Hi Peter,
> > On 2024-12-16 at 16:14:18 +0100, Peter Senna Tschudin wrote:
> > 
> > I have few nits about a code, I checked it with checkpatch.pl
> > and looks like some warnings are left, why not removing them?
> > Here are some found by it:
> > 
> > 0001-lib-igt_facts-Library-and-unit-testing-for-fact-trac.patch:824: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "fact"
> > #824: FILE: lib/igt_facts.c:736:
> > +       igt_assert(fact != NULL);
> > 
> > 0001-lib-igt_facts-Library-and-unit-testing-for-fact-trac.patch:825: CHECK:BOOL_COMPARISON: Using comparison to true is error prone
> > #825: FILE: lib/igt_facts.c:737:
> > +       igt_assert(fact->present == true);
> 
> There is a very important detail here. It is error prone only when
> the type is not bool. My code is not error prone.
> 
> 

It was error prone maybe some twenty years ago, I checked
current gcc on Ubuntu and it is ok. Despite that, it is
a code style issue. For boolean var bool_var in C language
we write:

	if (bool_var) { ... some code }

We do _not_ write

	if (bool_var == true) // correct but style issue

Same goes for assertions, they are used for checking that
a condition is _true_, so

	assert(bool_var); // better then assert(bool_var == true);

Regards,
Kamil

> > 
> > 0001-lib-igt_facts-Library-and-unit-testing-for-fact-trac.patch:913: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
> > #913: FILE: lib/igt_facts.h:40:
> > +};
> > +extern struct igt_facts_config igt_facts_config;
> 
> Good catch, thank you.
> 
> > 
> > total: 0 errors, 3 warnings, 23 checks, 858 lines checked
> > 
> > 0001-lib-igt_facts-Library-and-unit-testing-for-fact-trac.patch has style problems, please review.
> > 
> > Especially when there are many it is easy to overlook an issue,
> > one such is comparision with 'true', I searched your code for '== true'
> > and one place needs fixing:
> > 
> > grep -n '== true' lib/igt_facts.c
> > 680:    igt_assert(ret == true);
> > 690:    igt_assert(fact->present == true);
> > 733:    igt_assert(fact->present == true);
> > 737:    igt_assert(fact->present == true);
> > 769:    igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head) == true);
> > 
> > Last line may be an issue, as sometimes pointer comparision could
> > be implemented in runtime as 'return (src - dest)' so please fix all
> > using template:
> 
> I don't think so as the type is bool. I can't imagine a way to make this go
> wrong. Can you give me an example showing how a bool type can be evaluated
> incorrectly? What am I missing here?
> 
> > 
> > igt_assert(val == true); --> igt_assert(val);
> > 
> > In summary, please fix BOOL_COMPARISON, COMPARISON_TO_NULL,
> > LINE_SPACING, PARENTHESIS_ALIGNMENT.
> > 
> > Please remove extern from header, it is not needed:
> > 
> > extern struct igt_facts_config igt_facts_config;
> 
> yep yep, this is twice on the email...
> 
> [...]
