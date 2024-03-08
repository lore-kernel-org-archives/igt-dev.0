Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B670FC5475B
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 19:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BF0113981;
	Fri,  8 Mar 2024 19:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOeOYCLG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CED113981
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 19:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709926403; x=1741462403;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=/8uqVLhJSZv6wDYXfLzcjQU3YMJ67+e6axlRmI+yWn4=;
 b=nOeOYCLGFIiWsBEywGozJjYofue7/mxJO7Xon00un5aGmoUIXsFwpTK5
 +v5MGcS2Ydazrr27DPDbLPEuKXQlW4PX7tJ2j9XaC1g6fZtGUZoC1EmeB
 zk686elcoZ8GMXw9jE6hHCuUFqArpBZdr3/RiOjLwj3YsODDb02muscYW
 4CALvXla5Je85yPyBLDZLmqI/0qDYsLN0w6ufGKkVwZp/1clLwZpskDMB
 Lq1mA0UfPbGrVN41kF3FOYSXsZw9WVNEWXH/FIbt0T5ymeBy8X1UP3Cma
 AdsnoHeynWUvYyQdurvMKOiLvfOWDhWHvg+XCXVp4tFzphtIhPc+6aJ9T g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4830878"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4830878"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 11:33:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="10612936"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 11:33:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 11:33:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 11:33:17 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 11:33:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsdlDdSpWMSOwmF+97VC8akyIpSHOHla/L9U3pmjJZZNREXcqXYAEMC9vGhQUXqYY+Y3hPER8Pfx08Ys9IrUGN08TxmCUhnzpstjDSZ0bp9HaLUXnJlkSUAjra8HaB3yjHftie0vHt/ZawhXuJumVmcxrUnfio8nlUuCIaOb17+4AcgyK3WgigZ746i0mzzeo7qydrbtP0bs7FBi9iV01YBRUfhtB5UT1gW9/WfKUE2GFtnY1hWKl37z5fc9paX+A9zABa/ik7jGK7/ThryTHoG2hSLxXCQ7A70cg/k9xMRm94BmBgavYJW6sJm4Gr1/32zc/TgKvQe66fzx3SSZzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4qERVE84R/Emy2Tu9xo/N0bOU6H2U4aQRYWfbJEGOs=;
 b=ZT9xaRuAQnLkblirUWZpkIZfsD1bcl3bDl2EzzkigM+vYq8jRFYyLCpS6L2CFkz9k07c7gtI9LPwBQa1Ma9NIEAE1R+CwHREGcZfIBa+CKeuSrfW7RSGxYh87UY4/LUPLdHTD4+qGBinsowcnfvA2NPgR1yWbQdTMayY9WfJkcKpFAVfFvHRQYXVXHtL8zvR5SC+CcoveJdXdahA5SZZnwzQqKuZxW/aPlu9BheZOghwXYO5qp4dL2lPVCmlBtDqOFc62mviAN5dN529cy2b553oDAwJmo/34k6fvrxY5X8NiOSUjat7W8QBj+iCIQG7b/vVxLgh+eBbasJAwBPMxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4795.namprd11.prod.outlook.com (2603:10b6:806:118::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.10; Fri, 8 Mar
 2024 19:33:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 19:33:15 +0000
Date: Fri, 8 Mar 2024 13:33:13 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Allow to load kunit from alias
Message-ID: <avddvukizw3w3s3j2qvn3xwhsierkzytrdx46gwabie6arsto4@26f6motjvilx>
References: <20240222193044.3004471-1-lucas.demarchi@intel.com>
 <20240304160529.rr2z4dmzbkeyih4o@kamilkon-desk.igk.intel.com>
 <zqmldqo5fr4bpuegclkh2we7twqwijppjin2ry5uktgh5yyobx@wixslkby4fbh>
 <20240305173110.le7tevhhiqtklo55@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240305173110.le7tevhhiqtklo55@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4795:EE_
X-MS-Office365-Filtering-Correlation-Id: 03cb2333-87f7-45f9-125e-08dc3fa699c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: niSVFHJMt5jImGp7VG/pBjeCeswwz5mkx57HnvW/ShnKY2BslNogcKUmnBuF5EOMEInd7kNaUJgzutHHAwRoOSVvYl33Ec5w09+2PLTgnQVQEHBHd/5jp+cwQEjpbu6DkEu0JoPW7nFTsPhgBwdgHjtBHFoOYm9NWae0G2xlm4deV2qPpXGL/oLvM8gT13Yu1+wvhkkrRTyzRmjQ1ztbNnmu+vD8b4TIUWxqNcwNJpcIETIza2IXRplVe8hKOpIRJVY4HsqPC8pZJ6wcDYcjsQayiaDCmYUXZ2Uao0KjAsuFkE7iAInqV5GH4A1mlHLpHF+slGC8ZOs3QGV7VBfCUh0iYrC+L4FKw9wHemf3+PmSQTn0J69SabvDqLqCjAZY9LceKnnuJDpSaLO1YHBsKeQSQIFxde1OxzMLXUL9Xzlgrv2BLaq4AHeubFrgE5YEDsJ/s6HWbekltW6WtHbhxKIsmKmuHoXkPmujsu/iVba8Hi+JiOOPdLy0+k3WW6XCEoeYQFxsNdDfylVfwvCActGFWvzH5TEGC8nzJBAHzGRMjtUw6ayo1A6lcOPESlzFZ+IIhzj2oLRHlErQmR74/UtjRHjKLlgaR7S8qUxPTvo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mwxil5Sn2d1ELEs7Ep08wvAuQrLX3BX26Ik+xHlYHD+py3Nej4rOrpRDPTAf?=
 =?us-ascii?Q?EkYalrz99hi5v6e+G4DJLysl+w4AX0GiW50vLSyx1yUppIu9UmRmrgTwAbCj?=
 =?us-ascii?Q?qrVALty1evojGE3lqHSeCqvYUCXJ1BuiGk3GvRhomnXAyYY6aQzpto/zbiJN?=
 =?us-ascii?Q?BwjaYIkD5tSxfgrhBF491FLpOz/yFKyy2iuzWO1OI/AR30DMhjbN4GnhFY9J?=
 =?us-ascii?Q?1eGVH7gkKsuU5m3xEPriooCEZ9zgxOq0yvzE+RgGMOEXk7gerH/2LLoes6S/?=
 =?us-ascii?Q?4dFjEd10WqkTIfOEn1V159mAq52+YgUIi40a5VW0BsGxhNo9r7IqvrxQNYmf?=
 =?us-ascii?Q?ApMEaEzjFYq1ZUdfrP1qhrUwjvItscHDVCP1kJ5DKrB365fpKxsP+e5w45Ls?=
 =?us-ascii?Q?86oxhcilmA5IA7zWFyL2FghkOmKk62M2qw+Lcowxhy0WZYeSsKFxQBV8pEhj?=
 =?us-ascii?Q?uBlkbF4lS/m577rZl7/v/DObntBBKzyI7nmMz7tDEVJal7Rruu5Ujp8sH+jn?=
 =?us-ascii?Q?aM61M+z9fKa6HqRuKabfn3Dz7NxtvkITb/ac/LIyBF+QtH2JQxWVn/EWEPY9?=
 =?us-ascii?Q?oZJAQhWU04L2aJyHRd/HB5BwVTV8XSKTXqMbc8lvwwISvd2KqR5+iHK0Cv1M?=
 =?us-ascii?Q?pr02uYaXbH1E9A4O8oeQuGd7eg5nJ7WXFFYs2YCLdFihETk7zo8tswDGaP+b?=
 =?us-ascii?Q?Cw9CHB+7hq4nHGUVCKDNn+auQ3QbJBx9S80urgP++VPeLBpe3G2b2KCnkCPC?=
 =?us-ascii?Q?ZQ7R0rOhqh/hOK3LVxw00LGkbqZsjq7Vitn7Kj19bummACd5phQstm769yGF?=
 =?us-ascii?Q?YiXiWPi/pJh9KGCdSC4wypQ08San7zpIKAeoS2iYa04MxY3fQa5JLvDQNIXD?=
 =?us-ascii?Q?PwMDIYvHR+sBpIj7mSiEqfc3X5fs1gGRZt1X3skPBiyWIF+LgL7Shc5ylFlJ?=
 =?us-ascii?Q?27J7/VPhRqjZf/l8hbyiQ8Hd0/9DtRNLyEPpbwkoARyr8Q61BaibeFC/5vy8?=
 =?us-ascii?Q?3i7nJQvp+oxrZKmzjmD9kPxolZnlGbk3HpgZt3Gw90uIXyqZ0KYrKkaWnQhh?=
 =?us-ascii?Q?fB0IwRb418oaOnmyx2urYOLb+g5JCzhjl/uH7br0kY03kC/gp15/Z9h9RsGr?=
 =?us-ascii?Q?Zbtcyh2ti7yULwwOfAWJhZLSQ7j7hB6NsOrAhtc04Cy2Zy/YA47yiumwqVDj?=
 =?us-ascii?Q?11de1MjiJZ5KNB8f7HD8dyAI/sIVu3nyvFsnwzhaWVMvHOXxmhYP8TBhecpu?=
 =?us-ascii?Q?2TO14zLFVOR+9SMtasj4Nq4+s4Y7kremNIex1qpaz4ioL7g/B7W1kqs+vbDY?=
 =?us-ascii?Q?9wPfECPkBjugfATTl+u7UBliSZvdNCdMgTRDl2tO+ThqofxEMqTbJahdRWm0?=
 =?us-ascii?Q?EFHSM4Wc8OrczuT+GmRPiX2sKVJ5HTFHXV2CVXrdcjGfSDv52kvuFb2VsJlO?=
 =?us-ascii?Q?lGOfVr/L0nt3/7e+hE4Hi7bTYJKRui/nh/3BYmukbDjcxKbflqHjknBjCPxa?=
 =?us-ascii?Q?e4OEwLV7bmVGc7iBIP2eQn0ntg7pVGvLwR+JU1Ws0I3OMj6tShWbLNVAcaEA?=
 =?us-ascii?Q?MVqyMYfxLXIv2S64cb8jbdk41J/k1HBIPdlqtfrnM3PVdx/KtLEWlL1kYDlI?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03cb2333-87f7-45f9-125e-08dc3fa699c7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 19:33:15.8621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRTIK+EzyyC7G7tNEA+mb14eD/R1EIqS7SoKG9pEsIAk7sD6sFq7EPnJmFmE8UT5/iYJcNQDUEgBEr50oDJfO0lbjUImLMtQ4oOrvfiJ7n8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4795
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

On Tue, Mar 05, 2024 at 06:31:10PM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-03-05 at 08:23:28 -0600, Lucas De Marchi wrote:
>> On Mon, Mar 04, 2024 at 05:05:29PM +0100, Kamil Konieczny wrote:
>> > Hi Lucas,
>> > On 2024-02-22 at 11:30:44 -0800, Lucas De Marchi wrote:
>> > > Instead of only allowing to load the from the module name, also allow it
>> > > from alias by using kmod_module_new_from_lookup(). With that a user can
>> > > have their on aliases and the kernel can also export a compat alias for
>> > > future module renames.
>> > >
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >
>> > It is somehow test listing failing: ./dmabuf --list
>> >
>> > tests/dmabuf:
>> > Checking invalid option handling...
>> > Checking valid option handling...
>> > Checking subtest enumeration...
>> > test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!
>> > FAIL: tests/dmabuf
>>
>> how did you find what was the test failing?  The new version is still
>> failing, although dmabuf --list does return the same as before.
>>
>> thanks
>> Lucas De Marchi
>
>This was just:
>meson test -C build
>
>but your v2 now build ok on my local machine.
>
>From error build link:
>https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55851077/raw
>
>I guess it is failing on:
>
>Warning: Documented igt@dmabuf@all-tests doesn't exist on source files
>Warning: Documented igt@i915_selftest@live doesn't exist on source files
>Warning: Documented igt@i915_selftest@mock doesn't exist on source files
>Warning: Documented igt@i915_selftest@perf doesn't exist on source files
>  ninja: build stopped: subcommand failed.
>
>I do see new CI script there which I cannot find locally:
>
>[1154/1787] Generating i915_selftest.testlist with a meson_exe.py custom command.


problem was a bug in libkmod that was fixed a couple years ago.
Apparently the fix didn't propagate to Debian. Fortunately the
workaround is easy. Just submitted a v3.


thanks
Lucas De Marchi


>
>Mauro could you help spotting what is a problem here?
>
>Regards,
>Kamil
>
