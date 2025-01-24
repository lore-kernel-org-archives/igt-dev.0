Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803D8C0218B
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 17:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3838510E100;
	Fri, 24 Jan 2025 17:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LhRH0mpE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5212610E9B8
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 17:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737739520; x=1769275520;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=27UqGjs65NdAHmxIxnQ0u7PyraXwjQ0FogsZXZT8ByI=;
 b=LhRH0mpEnY3DGgA4tCvBANQVxp+4JU+gFTDhOQIkt/eLuzWBWx2JZnNM
 5G0M6X+UfvnWSALRd+4VXvryQ8Mrfmi1OvFJy2FckCOSkVSS8ccnDHQnC
 ti9yj7JSGBxe47cZlEkuUdvsT+mAVp7hmUoJpvGWGaOwIEEIkSKmCYJEb
 7uThiYVRafOgkqEJKk5fY/WJQvcKaX5IpngNcwzsv7Yr0/5DQRwC8xG+Y
 5zVL5+M5yHgA2apuVYVjbC4H1BapOPXu81kJAsR/421JbfqzHCBRvHqot
 ascTbG2dmknCu21cXyMOyHPva8EFYtxhq2FK4WgN9UCNnGC9ItpjcbBmA g==;
X-CSE-ConnectionGUID: JZ0YIIHcQCi3NiAUt1zCvg==
X-CSE-MsgGUID: 1ssLnC0IRzCmLSooAOELOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="25884723"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="25884723"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 09:25:19 -0800
X-CSE-ConnectionGUID: jqBmky9vRt6M69ZktbZGEg==
X-CSE-MsgGUID: CYRy8cq1SvmGFvsyROQM3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112451135"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2025 09:25:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 24 Jan 2025 09:25:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 24 Jan 2025 09:25:18 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 24 Jan 2025 09:25:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PweGMO/BfbwDP18vflP2mKXRZeubBApV6n2f/ChqI5pOSlP3n9di8U37UMc54VdlGTNSdFbX3Yzq5zAmcEFGZvVVTonTYNTgeYaJHE09U2JoQs89zOkxnuQYZV7ahkZG0TMfEjYpqjyWKfsFPxsD48Ig61dDRrFeOwahhd1eWo6DySyuolesh83YWgVwzJDz5RzRfbX7+HiH2aEWnz47Oa0syWeXdmlWew9DW5widBhchIuVI1gYeHZ+xsTs79J1KWP+fRu1sLnUgl//Xq+e5zd6refdVH3w9JubGPEC5UiNXUwY65OjGQNKn8ulqcB4O62TPi4R76RtZqbsI0BwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/m15q3pSfurluOaCeFnrSCM7DgGktDbuLGpZnQWFzg=;
 b=ah8uY39lbiCcmu5lCnu6q/kr79yOPjkhn8MFjKGw0eGKvezub8FdRnGE49jwVRPajoku+DoSlJCRoIsILphneObN6RkgeOqFAFAw5ZvfOdy81Br9XYIg2s/RQp1Ci8xS3P5PIirwAcc4yXTJTJntXNkAml6YmZNY36rfcEMVytaKxbuOyVWlRowIfGuOFxqQ5gPRYYKuCRTMzFYccSWTpSA6oAlUs+tt+d0RwW/cIPdpHZyoitzUobyV8TwMjIiYniC8io6c8n2uEotEv8JBO7fe0ku/5NUrcFSgN8YEJxhzwLlG2PX4SRWKJ/uEEvKpHTfL2s+HyfiOAiZFIucL7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8376.namprd11.prod.outlook.com (2603:10b6:806:389::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Fri, 24 Jan
 2025 17:25:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 17:25:11 +0000
Date: Fri, 24 Jan 2025 11:25:06 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 5/7] runner: Free settings at the end
Message-ID: <s7cemneicf53i3jyleuivftqv65f6oa4f5c2aerxi3iyxqkmts@cm6mwwsulisk>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-6-lucas.demarchi@intel.com>
 <173754639369.5500.6720737629497603639@intel.com>
 <e7gqljgl56iemiyfabj4d45ysx5x7l4jgevoy5a7l7gje6a5d3@e7v5mv7wzatx>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <e7gqljgl56iemiyfabj4d45ysx5x7l4jgevoy5a7l7gje6a5d3@e7v5mv7wzatx>
X-ClientProxiedBy: SJ0PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a4214e8-4f28-49b2-c5a8-08dd3c9c0e50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C3/+AqkkM6kjyKHXYpOtOrYqbMECq1xxtOD2vPGNDRp5B17NkZDyhfUWeBIH?=
 =?us-ascii?Q?YStDJuSdYh+cqOPNYxlFQEVTzjmb7dNfuEwgKTZl8CHPjQFhoBqLtI8tnuvM?=
 =?us-ascii?Q?4Rj6IXImNOgHylTBDIQo73Wq9npXGOFhAzYQ+K3uIFChJB3K5D+KWyAUhGzq?=
 =?us-ascii?Q?DdwxWPbFUgFxs56w72WnCrBc0B2cupZruQNiDP0HGkHnPcpAr9QUyDDvTyG0?=
 =?us-ascii?Q?Vs6BU22NZeHI4smHZUqrVpmI95QYKaPCmNOgqHhUtcC66dhToaQaWYBLCzC2?=
 =?us-ascii?Q?eWFFjcZSe43Xzw8nD7pEIUFsDpNAShdf/J/Gt8DLJ3PBdkyF1lfXPuC0JtST?=
 =?us-ascii?Q?kHhnFhnbazdUsW9a3jvCLMT0kHN5cNLDVRnI74RMZufar/0ro9MjLm7XNDG7?=
 =?us-ascii?Q?hUpGda3UBJYBK/Vr+Mx5nNyIEj9RAiW9O+JOAyhyujL5hPNPXrKcdsFWD2vq?=
 =?us-ascii?Q?4ADySDDZjXZMG32SySdLKpCj+MhlbAFEeUd3/MKqG2OlJIvgfKOfoAX3Lfjn?=
 =?us-ascii?Q?1EqNFt/S+HJy1ru0xVVa0ZysJcbE1IIuz/Oyf5ioO0ScpCngUII1geuMXoe6?=
 =?us-ascii?Q?1C4FkDuX6xyWxO+X8wjhMejqUkfrIzh4C+y/LG4KOx92gneCuVrXu/stIKkb?=
 =?us-ascii?Q?gAQ+4BwG4GfiFQRbpyti5cQO902ZGXuJy0MRS1zZbXaJIxdBP3e2qA0uFpZU?=
 =?us-ascii?Q?4hmno0XhuBE7R1q1tH4/ZbBY9Hp65+8Lx8iIjcC71hhq2k1vgLZt0YFDOZY5?=
 =?us-ascii?Q?9jxGNdbHSKulcQ0UVniVU8Vo5sbo38vSVsMCJdXYeXEM6BbJTGZgoMYCXO8i?=
 =?us-ascii?Q?AAurUhQb60ae7DExvJREexUBszbNyly0FVpnJjcI8j1hakPajhv5Js7cnWqV?=
 =?us-ascii?Q?IVvYQ5kAaxZkmtnSyO6R2CMHKanYlGyjpg63bGIkHq3MmHSixd3SrQOEYo2b?=
 =?us-ascii?Q?YXId2wVjxl/21r8sBkTrqyD7aEl9s7dzkzyTq32VhrlrBnO7AH7n5ZGC1LEF?=
 =?us-ascii?Q?7P5yK5N73e2KZE89AoAD6rnU+frkqQTtjl+AQb0B6XMaqq8f2corRuErPsS2?=
 =?us-ascii?Q?zaEAukdgWZigB0cydfKZ/rGzrpQ/FHpPGkT8N/I7EJ0+SVeBTijtmoeek2Yi?=
 =?us-ascii?Q?X1JAzHHi3JS4RRUQ2b5xb6im1GG+dSu7oyo+JObv/lFAG9y1FeU0iqmT5AUk?=
 =?us-ascii?Q?e+eVCt7jQp6NktwSUlC0xpewHOyXNIBHx+Ne5tHrHZqpit/yN/JZppWoMnAI?=
 =?us-ascii?Q?+7LUaFUCKJxREHunD3DLQLQkqXQ98xH8AzPnjYfIf47iCr0oMebe2BU6cnnh?=
 =?us-ascii?Q?LsV2jp4p0RJeGdZc1ipr55dZzyCWFofuoUHqap++NmJRg4n8Dl7m81QnNULC?=
 =?us-ascii?Q?KyAa9uKvyL9dhmJzg0CvjFfIiNQx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HJeZzp+3Li85ElAjhjR8Qp6tL3OFvGWU9UCb49r8wEWm72UQ1QkmV7+Tdfpi?=
 =?us-ascii?Q?RL9SE2pIiqmL9P5OkJZ63TvKRiYtvRSKd6NwLFekZy7bvgP09B3w6fQzhlbz?=
 =?us-ascii?Q?xQD80g6dTmGSJ5TR+0lodbxo1qkAlsMDnWfio5yPatXqYrmlzJvHv8v7FUl4?=
 =?us-ascii?Q?t0mVcH2YAqdcTdse9NwlehJfPdL6oqm+Wi6gzhw74buHxlAt1vr1kEJG8c1n?=
 =?us-ascii?Q?fLQrZLdvVc9GuoOv1Y4psD+gvyUC6Jyfi5bZbMOfz2MT4YYCYXJoLOq58m1R?=
 =?us-ascii?Q?4ysBsTpczuXhJYsLglJZnlYs8UImULJyGS/PS70hYftnNM489sJsznFT7GII?=
 =?us-ascii?Q?+I7UEPjbtYmwYUJNrPQkLnz6iyYPjSsIH35xE9BNK5j0tF0MhvoTIDQ2W7WC?=
 =?us-ascii?Q?5QOoMiy1N8sGYeb1ApPTeaOinxTK46VBam/vAVTh78+N6dlpQC47xLjK8Jp9?=
 =?us-ascii?Q?8H7VAyoCHCxDUDYWJX3WmoicZTbH++GbvlPz7qyTuxInk22U0UTAwgr42gvD?=
 =?us-ascii?Q?FLF3rkXN7J6T17Jel2yKCnIj/B69OoUQwGdnAfp/7RF7ihAuXQ2tbCLMmPXr?=
 =?us-ascii?Q?JeXNiqm9fMPhPQheAU76EchsuKEjixOxBo9HFB0aGfpFmpuoSd2zfDMzf4DX?=
 =?us-ascii?Q?eIINhmvxJJkmUniU7dveCc8pu/OOfXjxl86ZrE+rkdqbYdDBVqjKpGzhsiYR?=
 =?us-ascii?Q?h8aM7LASU/5bnyXMI5mrB/MtfzxiorSYftw7I082Jj8yhh9crBJQVK5Eupsd?=
 =?us-ascii?Q?ryp2/v2FB6mPB3P3URJIA3yE1FYjOqQASPWu0I6uBHqK/t1+HZRNZLwrKHfc?=
 =?us-ascii?Q?SE1yXQm/QB4+j5MTSWb72voN01XUqiBXht4b67zIGr8ylCUjnGSLjHGHBgkz?=
 =?us-ascii?Q?EI08LAFwj4BK+BUthhxhng193+axbM6Db4ukmvx96qIKtLkP9DNwI/dF9WYC?=
 =?us-ascii?Q?kKoiGZJwY69N/W5RH9SvyHpowxv4IwDwFmqSwqZTRaERTDw+kL++RVvfTAWp?=
 =?us-ascii?Q?aTad/CEt+u3hXnR390SD9yDyXicLZ+MEiMN0mjY333iWo+0x52e+OG0CgPSO?=
 =?us-ascii?Q?VnzOHb4cqQ6AzMA+9oCqilSw3dBycOkq8r2YWWreR+zPD9GLtxHBLFlh/0eD?=
 =?us-ascii?Q?8GihOqAdEpCOpLrOeYcwKNLYFT3GbUr7DgJAgLsMNIuwRWhrN6NT/UCRSYX+?=
 =?us-ascii?Q?+V+hTj0CwGEj9Sp8B6Fl4D48uZ3k/lKRFQVEB+QFjGgeMJfn6sbodU9G8Wc/?=
 =?us-ascii?Q?sAJOFkDofSOOcEFOIWXMD80VrpbeDZEWpLXSz50PRXjqcfYhm/Wcjh3O1Zhw?=
 =?us-ascii?Q?Nys7+WwkB0E6VMbPXsxs4w9hDo6T5OerywEuW3V3WtCPcoH454MMSg9i1GLr?=
 =?us-ascii?Q?2qve22xlhUFuXDaAe/2fLy7figq2QNaHyj/mp+P7xTUS1CqvW5dTbkSUbrkw?=
 =?us-ascii?Q?TmbFKJLoT+/j/tGbm1Ze9bsxfc1mg2G86c0OvHC59R5UMoQwpUPdjFzeSySA?=
 =?us-ascii?Q?GZYy5raGzHjSWl//tWdHNM0waKDQIDNhxRLCSfNpyruKe/olXRQ7Jbhj6AYM?=
 =?us-ascii?Q?Fz3KsiJ9OBZiwk37hFbke5jpf3OotV5CWU2V+Ii2Csd/S7zpEXNZ2MrqZALO?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4214e8-4f28-49b2-c5a8-08dd3c9c0e50
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 17:25:11.0812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKD5Dlvo7Y0PLtip033f64gAgdvp/kOgAZPnlw2L8YJncG05UA9tF0udZTdt2MoOSkM15iLAxsa9zZfnBjlXnitbyZuNAglSSCERiZCRryo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8376
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

On Thu, Jan 23, 2025 at 12:28:28AM -0600, Lucas De Marchi wrote:
>On Wed, Jan 22, 2025 at 08:46:33AM -0300, Gustavo Sousa wrote:
>>Quoting Lucas De Marchi (2025-01-21 19:57:31-03:00)
>>>Keep valgrind happy with the normal allocations so we can find the real
>>>leaks. Avoid this kind of leak:
>>>
>>>       ==806592== 8 bytes in 1 blocks are definitely lost in loss record 46 of 188
>>>       ==806592==    at 0x4846828: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
>>>       ==806592==    by 0x4BD534E: strdup (strdup.c:42)
>>>       ==806592==    by 0x10E6AA: parse_options (settings.c:863)
>>>       ==806592==    by 0x10D2DD: main (runner.c:19)
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>This looks correct, so:
>>
>>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>
>>, but it seems we also need to make initialize_execute_state() and
>>initialize_execute_state_from_resume() properly clear_settings() when
>>things go wrong internally.
>
>Looking at runner/runner.c, there are more places to do it when things
>go bad, example create_job_list(). Maybe replace the returns on error
>path with `goto cleanup`?

well... that will need more work since some of the calls do cleanup of
things they didn't initialize. Example
initialize_execute_state_from_resume() closing the dirfd that is passed
in. I updated the message stating that it only fixes the leak on success
and that error paths will need some more changes in future.

thanks
Lucas De Marchi

>
>Lucas De Marchi
>
>>
>>--
>>Gustavo Sousa
>>
>>>---
>>>runner/resume.c | 2 ++
>>>runner/runner.c | 2 ++
>>>2 files changed, 4 insertions(+)
>>>
>>>diff --git a/runner/resume.c b/runner/resume.c
>>>index 0f4e42bfa..ed17351c6 100644
>>>--- a/runner/resume.c
>>>+++ b/runner/resume.c
>>>@@ -55,6 +55,8 @@ int main(int argc, char **argv)
>>>                exitcode = 3;
>>>        }
>>>
>>>+        clear_settings(&settings);
>>>+
>>>        printf("Done.\n");
>>>        return exitcode;
>>>}
>>>diff --git a/runner/runner.c b/runner/runner.c
>>>index 4855ad641..258b30b36 100644
>>>--- a/runner/runner.c
>>>+++ b/runner/runner.c
>>>@@ -49,6 +49,8 @@ int main(int argc, char **argv)
>>>                exitcode = 1;
>>>        }
>>>
>>>+        clear_settings(&settings);
>>>+
>>>        printf("Done.\n");
>>>        return exitcode;
>>>}
>>>--
>>>2.48.0
>>>
