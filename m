Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464D7E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 14:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042EB10E3B4;
	Tue,  7 Jan 2025 14:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cR5XupX/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A780E10E3B4
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 14:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736260119; x=1767796119;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ycky/RPo9+/SqljJZky2PL3FmXlEUrK1IdAejnRnHwM=;
 b=cR5XupX/kahqEXVsCRWAEraYzI3aabgCfPRGlhZdcwnPreHrtPnHxlhv
 xCs2pgaZrXQ5esp8KvbMPmFdxglJNhpXzeLl8ARJDdlSPx4n7IKRVz0vf
 LXvOva5E2+4EFidQQG7pWeIuLmwxBKkVbEaVwUBqjDS6NwPH3mvcGq3sW
 Bs4EfRSACVqZ5A1L2iUzfZoOQ5Y/z+iYxk7IbcADOw0cGPe/uNCrLd+2V
 usKuOCBNa0WKw8Y5DrXrK+U9poXlTFEqjBbsKsoJZqPU9GlZqq2X51P7o
 bJyZYrCkacJdRXdhYZT0lviv9p6F0XPPDdeE/FDOe81UKz4fBxMIZpIDW A==;
X-CSE-ConnectionGUID: 6kURcjVSRHKfXEwLThH6bQ==
X-CSE-MsgGUID: E6jwRuJkQIanks+yYVZWnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36461117"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36461117"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:28:38 -0800
X-CSE-ConnectionGUID: p8WP/TQwTv+6N0YNOq38YA==
X-CSE-MsgGUID: vluTAuO/T8ShZ8ZbHPDHuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107399143"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.171])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:28:37 -0800
Date: Tue, 7 Jan 2025 08:28:30 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>
Cc: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, 
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Kurmi,
 Suresh Kumar" <suresh.kumar.kurmi@intel.com>, 
 "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call
Message-ID: <ffj5p27czbluexza6vgsbwlrwya3cipywgybukmj32rdyxnbao@u4hfftxmze2f>
References: <20250106095154.243459-1-mohammed.thasleem@intel.com>
 <svjcmyxrz4bc4n3evwcgqh3tfom75qykr6ficl2npsha42mcib@op5fdovzjkss>
 <PH0PR11MB48060B2DCFDCA769A5DAC186E4112@PH0PR11MB4806.namprd11.prod.outlook.com>
 <IA1PR11MB646717EDD6C6AB0E59555E00E3112@IA1PR11MB6467.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <IA1PR11MB646717EDD6C6AB0E59555E00E3112@IA1PR11MB6467.namprd11.prod.outlook.com>
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

On Tue, Jan 07, 2025 at 09:15:32AM +0000, Garg, Nemesa wrote:
>I have updated the ghe lib and changes are merged.

https://github.com/intel/ghe/commit/8fc0c8f825244af5d6f552df7c1df1589e20604d

so the new version will break the API. What's the next version that will
have this changed? If we are keeping the new name, we should check for
the new version.


Lucas De Marchi


>
>> -----Original Message-----
>> From: Thasleem, Mohammed <mohammed.thasleem@intel.com>
>> Sent: Tuesday, January 7, 2025 1:24 PM
>> To: De Marchi, Lucas <lucas.demarchi@intel.com>; Garg, Nemesa
>> <nemesa.garg@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
>> Cc: igt-dev@lists.freedesktop.org; Kamil Konieczny
>> <kamil.konieczny@linux.intel.com>; Kurmi, Suresh Kumar
>> <suresh.kumar.kurmi@intel.com>; Lattannavar, Sameer
>> <sameer.lattannavar@intel.com>
>> Subject: RE: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call
>>
>> @De Marchi, Lucas, As per the internal discussion we have updated the api
>> name in IGT and accordingly we have merged.
>>
>> @Garg, Nemesa , What is ETA to do the same changes in GHE lib?
>>
>> FYI @Murthy, Arun R
>>
>>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Monday, January 6, 2025 10:43 PM
>> To: Thasleem, Mohammed <mohammed.thasleem@intel.com>
>> Cc: igt-dev@lists.freedesktop.org; Murthy, Arun R
>> <arun.r.murthy@intel.com>; Garg, Nemesa <nemesa.garg@intel.com>; Kamil
>> Konieczny <kamil.konieczny@linux.intel.com>
>> Subject: Re: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call
>>
>> On Mon, Jan 06, 2025 at 03:21:54PM +0530, Mohammed Thasleem wrote:
>> >Check ghe algo for the function called by ghe igt while compiling.
>> >
>> >Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>> >---
>> > meson.build | 13 ++++++++++++-
>> > 1 file changed, 12 insertions(+), 1 deletion(-)
>> >
>> >diff --git a/meson.build b/meson.build
>> >index 8b2a2a64a..96f010fe2 100644
>> >--- a/meson.build
>> >+++ b/meson.build
>> >@@ -198,8 +198,19 @@ else
>> > endif
>> >
>> > libghe = dependency('libghe', required : false)
>> >+
>> > if libghe.found()
>> >-      config.set('HAVE_LIBGHE', 1)
>> >+
>> >+	cc = meson.get_compiler('c')
>> >+
>> >+	if cc.has_function('histogram_compute_generate_data_bin',
>> dependencies: libghe)
>> >+		message('libghe provides the required function')
>> >+		config.set('HAVE_LIBGHE', 1)
>> >+	else
>> >+	warning('libghe does not provide the required function')
>> >+	endif
>>
>> what's the a proper libghe that provide
>> histogram_compute_generate_data_bin()
>> and how were things tested? If there is libghe available, build is just broken.
>>
>> Ideally we'd have something like is done for other libraries.
>>
>> 	libghe = dependency('libghe', version : '>=0.2', required : false)
>>
>> However, looking at https://github.com/intel/ghe, there's no such function,
>> which leads me to think this call is actually a typo to something else like
>> set_histogram_data_bin()?
>>
>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> Cc: Nemesa Garg <nemesa.garg@intel.com>
>>
>> >+else
>> >+	warning('libghe not found')
>>
>> no warning should be added here, like it's not added for the multiple other
>> libraries.
>>
>> Lucas De Marchi
>>
>> > endif
>> >
>> > build_info += 'Build Chamelium test: @0@'.format(chamelium.found())
>> >--
>> >2.25.1
>> >
