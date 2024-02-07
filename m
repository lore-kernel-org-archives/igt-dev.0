Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B57C4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 19:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77A210E1D6;
	Wed,  7 Feb 2024 19:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="krYfqors";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F2A10E1D6
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707332421; x=1738868421;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FMJNg2csiV4aRNMLTpBk4dqjCVbUT5vKxXkk+ntJrUg=;
 b=krYfqorsVpQbVPPAabkrkgksirMRn5PEETPZOg15mPfR21qZcGhNDh+O
 9KsInw1sJq7vgrNunUHfjW2ey4Vk0z81FzTDOUZAzEyj/pW21Xf9o07ed
 HXWFUqD9+RUya4w6wdc6QRfExFuTUwzONRWMJUujFSeBBTA8VkP5CYEMm
 /x3NMFrMdPJ/oDaO9gyaEGlWvVUVv9ofs9EviCzUxr/SsRNxavdFVBeI5
 Mdf0Oiu9+1evkRCsrzzSeDOOPDsVYbeo+6cuG8HWySVHA0ij5agWBBAfB
 usd8+BpnyYMByYPCvwObsmgmi+FqCrFe0qR+06InJPMnl6ULp11UfLwij Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1200295"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1200295"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 11:00:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="6031305"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 11:00:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 11:00:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 11:00:19 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 11:00:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVcm5AIgNgXGOnpC0okA0uaw0jvhhgxDbWj9XboG+AN1xhjdEKsKd/+F5dYbu1FPzomYrZmNEN9rVr0JCLZ3MhPxGlWLuMOQ20/4aa34VmImwux4wVRP/UttjcOmL/mjCi1D8Tj71yYF+4658QQgeE3kYgx895cDjDVDbWw063VPzDODNIzSfK02On18TbKYJjNAdquy3KWq4sYYZUOR55v711U+C4AW9wGbw4wSmpGomtoFBOHX7L3pqYCqVMAjgrDSr6fuaJuyKnLXLvhY6qCNWRj2QsPIv27j/TnERVl1i6SJQ2zVCAjRJxtVNm8AJcC52PrVxSwU07eyOKl7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7Qriw5OekFMSMPkpGR0/4IrNdC01KU7XbZ1pc6Rpsk=;
 b=eBJRl2jIy6DvVquaDc0K7yqpwlYzjAKVBKcVGRCi05DA8n1Dp1EMIrEEFW6MXST0Sbx/gCkjTXo8GsBJcTJo/KOr4Cr9acODCrJdwWKZLZFxt9NiShTfe9aAcuAfztbeXYBZXhr57l2gnq7OiXMjzYnigLOwAAg7JgvpcoC490Tq5aOXWeUvthD0tyOnJv8IwqRpPJ+zqhQStLKATfJ7EsgdZjFv6w4Ep/aaPm1uyZtuwZeesdxn2mYMKkHCNH2xY7D+qZ9G1fQvtWYO0VLVcSfupe/C14VY0N9qXzXFWaqF8YynoBmavuiP4aG+phjgNZw9JwvoqMecT72IqwIVWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Wed, 7 Feb
 2024 19:00:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Wed, 7 Feb 2024
 19:00:17 +0000
Date: Wed, 7 Feb 2024 13:00:15 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: Re: [PATCH i-g-t 2/2] xe_live_ktest: Use xe_live_test kernel
 module
Message-ID: <cusqp4f3uzufdc5lvxmjbmepqelmgo7fu2v5tbtuzvqnubjb55@43n6zmtl2o7y>
References: <20240202004529.552806-1-lucas.demarchi@intel.com>
 <1760950.X513TT2pbd@jkrzyszt-mobl2.ger.corp.intel.com>
 <mfqfe7r6n26cfdbkv2vvyk5oe5ba36jdublmscyuyvwyhqpkdx@jd3nqwyzh634>
 <3267150.N7aMVyhfb1@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3267150.N7aMVyhfb1@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4776:EE_
X-MS-Office365-Filtering-Correlation-Id: c03d28bb-00b2-4c69-2ed6-08dc280f0665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aqSo8rOk2TINe7ctmzvj/LWBYnZipI+nshuWerWcYE0MivH+d5zmT6b1ojxkEN/9FfQcoiDW8BJzru9ef3AA8LwzSyCGIx6sQg4wezN9Wyw/mlfvaCQL4bMK1qOTRyFpzRIGeE9ccq5LTp3PVCOeJ3n7t6jMhJ/MWNulbYIkI/F1HlVEGLVYXerl+AIQpliMGgkUDT8jqh0SeLZn3bILu9PcvgyM/K6qJ6chkrqCNJGXU39ktownTb4jo5le0a13iz/FlGtemq/8nGpH6m2moSq/g/Eavb3MnxwaomGEIAJHfV07EO8NXpC1cj6pIYV4j3BhLE7XELODQQnLN11TqSzEtLj5h4GbMFHkveAOJMYwbnvqnDmdl9D3ao/IbAPiHNkllVbp76X8w8O6SanFIkwxak5jvE10p4+1TxvSq+kC9Z68MFOYaFh9KSS/u0TL8/d/vXRXqM3YwErq6guDOuR97zz1qlA7EXENpwgv6MWLupklmIkbWqiaMe4N9YOnGac9pdERY2nyRvlJ4PzaWjv9cstlqPXtTVZhEHWs88s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(396003)(366004)(39860400002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2906002)(5660300002)(41300700001)(33716001)(83380400001)(38100700002)(26005)(82960400001)(86362001)(6506007)(6512007)(9686003)(66556008)(66476007)(54906003)(6916009)(966005)(6486002)(478600001)(66946007)(4326008)(8676002)(8936002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T4xcHKUYAdSjlTzJKpMxIuO2MkJ6YyJPDdXtDIMjujrcp0wo/LzNBWNntK9K?=
 =?us-ascii?Q?lPqsgJbKrOGqSm7jeJveWlOPh0gTs1UJnMnwqXiL+mDN8IljCSosEB2bVyrn?=
 =?us-ascii?Q?TDUSuMcbOTsD6k/i/Ba9e1HRqF0pMZF+AsrGO6jsT4r2+nZiLiD14tI1hbWG?=
 =?us-ascii?Q?mUTm+rN75rblYQjxbNteYEyLoS4kYxlEF7QAiBy2qUvJGPpWRU9pnvLPjEO6?=
 =?us-ascii?Q?iTpc+myNGWqDCOC5Sxk4tY0Ys8ZsqGhlmYGxoi3MhaWCDZ1KfEpcIR0+WbU/?=
 =?us-ascii?Q?gQuxZNp1P6ho59jbN3EqKDyMO8FndfE81W1FnYGn6qXEzmdlOR4PnF8J9Z8h?=
 =?us-ascii?Q?0AaGJccm7X5AhVGD8FSTTcOdrd+nm+Ft2EB7ERW1pH/1G6o5D609Pqd8VHv3?=
 =?us-ascii?Q?5Itk2WsnTXXZpyT9PIqiFuvUXHlRhW/b3lo14RwbPbppWIuT1fJ/ZvkKd71A?=
 =?us-ascii?Q?z9ajpW3YZCoibNOklK0mRjczylnDjWa4b/sfASYBi3HxLlfbd1KPiQZrbMs7?=
 =?us-ascii?Q?MMWkQ4OGC2G0XZE43tFp8IJ+3ORuzl0cAlyLbrS6syfMh6lGk2zwAsBzE+ge?=
 =?us-ascii?Q?MHv+DzZpy7DCW4xe8DmwtzBFrDF37/sUMAWSCQB3lP+4uey8WNCNw+YT1yYB?=
 =?us-ascii?Q?eNnBU7KIzFoLRX3DE7iNzDnCUp6FqTVVgNB70uYTHbsn+9LTWAhFbKPXDhed?=
 =?us-ascii?Q?EJMMHrMERR/q1xV5VLIK3OoyTuDDu/8tUUfHragyEFvXn8wFIKHif1lM4HfY?=
 =?us-ascii?Q?34OxNQRUFk0k0Mebn0nf52BoO7TI6Q2zPDGkmC2ULUzNeoFzAm/V1Q4z54KK?=
 =?us-ascii?Q?qFTo513AjkWey71X4tF5ayNBEYOJf8Bbh8p/x69JJEUvTjrBN81yc+3QPEob?=
 =?us-ascii?Q?3XlbNiWFwxOOc0ed/mZGvdUnWUc7afwvdE3xhlr6E4IbeMb+54ktY7x5NrQt?=
 =?us-ascii?Q?KDVSK6BLSTYd3N92oRnL2Bne4ImHA3/3armFufzoA+OgleKJsxdMNDWcDtG9?=
 =?us-ascii?Q?m6AVdfdAZbFninQ0+S1U+8fiI+Kgc0rxeR1TTNe9U3gxAQewR/bKWF7vVGoj?=
 =?us-ascii?Q?VGfW8yxLwUurpHZguriaDDtC4YNMIyR3JuD7Dc2rbzIH2BuvGc2pan4zoizB?=
 =?us-ascii?Q?Ev2B0bU3r4l3KBYLq7fSc8Uo2R8c4QhYLKGaO2Y8O28AlT7UXsxmUmYZABVb?=
 =?us-ascii?Q?9LbrlnQZvWSD0fcWEtnJfSuIGJ3lum6bxYvmIVFJREUG4aBKnsBlNoFnP9sF?=
 =?us-ascii?Q?rR7ZsMORR8aKDvq6wSK3hH11I6PoEsjxo2KHhREy2TaOiFa3QceD4zESHByp?=
 =?us-ascii?Q?ImzsvJHMnNuHBLneWz+TCRHuzGm376lswZ5/wLshRj5IGsjfb3nKCPjVfHQZ?=
 =?us-ascii?Q?8IEEUlBoNz1PuEcZ7qTnjUbsEIgbZuJi+KCcH/VZ3sHcvFYIk3RvMdzK/ReO?=
 =?us-ascii?Q?tLVJ7HgmB30ocv9k7YWijj+RiNScBeV1QqIhWL7AOAAFKHlCmIVx/HeEMWay?=
 =?us-ascii?Q?a/p8JTbA60H0TYc4ebLYY8GY6ERRQSVTZDXRO0fOMb8jFyyeJ+lnTtsCMYw+?=
 =?us-ascii?Q?ne9D3/WbpLXWLH6QWhul/MPFvZ2wh76XWddkowIqN4NmAnoFr40BSV5CRAzJ?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c03d28bb-00b2-4c69-2ed6-08dc280f0665
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 19:00:17.8285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVe7cT5Zemx++PVpm7IYJXjFHTnylWUoG79Nkf+AZeJwUJANeR0j5+Qmf4LmyVJ9x6O74hFw1ctJW4LH7DLYrkCMr5z+qLOUu092v+sfmuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
X-OriginatorOrg: intel.com
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

On Wed, Feb 07, 2024 at 07:36:12PM +0100, Janusz Krzysztofik wrote:
>On Wednesday, 7 February 2024 18:26:53 CET Lucas De Marchi wrote:
>> On Wed, Feb 07, 2024 at 12:27:48PM +0100, Janusz Krzysztofik wrote:
>> >On Friday, 2 February 2024 01:45:29 CET Lucas De Marchi wrote:
>> >> https://patchwork.freedesktop.org/series/126786/ groups all the live
>> >> tests into a single kernel module. Use that module to run any of the
>> >> tests triggered by igt.
>> >>
>> >> To make the live kunit tests work, rename the subtests so they match
>> >> what the kernel uses.
>> >
>> >There was some discussion on this patch on today's XE IGT status meeting,
>and
>> >the conclusion was: can we have these split into two patches, one for
>subtest
>> >renaming, and one for switching to single module?
>>
>> that would break the test. Wouldn't it make more sense to squash the
>> subtest rename in your series since it's changing the logic
>> for filtering (https://lore.kernel.org/igt-dev/2202702.NgBsaNRSFp@jkrzyszt-mobl2.ger.corp.intel.com/)
>
>The rename part can be applied immediately, I believe.  Looking at current CI
>results we can see 2 cases:
>
>1. If the test successfully (re)loads the KUnit base module in list only mode
>(e.g. after xe and its dependencies, including kunit, were unloaded by a
>preceding test) and that is followed by successful load of a xe kunit test
>module then the test is no longer able to reload the base kunit module in exec
>mode and skips.  Renaming the subtests won't change that.
>
>2. If the test finds the xe module and its dependencies, including kunit,
>already loaded then it can't reload the kunit module in list mode and falls
>back to the legacy processing path.  That path works, i.e., returns results
>from test cases as results from IGT dynamic sub-subtests, even if subtest name
>doesn't match suite name.
>
>Then, renaming subtests even before my series is finally accepted and applied
>won't break anything.

ok, let me spin it with the rename only then.


thanks
Lucas De Marchi

>
>Thanks,
>Janusz
>
>>
>> If we squash the subtest renaming there and leave the module rename
>> here, then we don't break anything (although this part here needs to
>> land with the kernel side too).
>>
>> Lucas De Marchi
>>
>
>
>
>
