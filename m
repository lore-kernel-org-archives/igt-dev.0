Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3108DC0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 19:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E357D10E37C;
	Thu, 30 Jan 2025 19:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FaP8niQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E10C10E37C
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 19:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738264640; x=1769800640;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=V+vfN+7ZYeRWVWkJR20UfTuOi0tBee8K6+ec/T2Anhg=;
 b=FaP8niQNBggkqcH96qzoNApFKPp+T4eWzLnkURmeryxHcW4aP/1AiBZr
 SNlEBfU5XFTS+9Qj2uc/mxNpt38D5yDnKaWwCbrBpoXiKamjyoFPxD5wm
 J6mHlKTb+k5XWesbY1YlSkWdWu/IsHgi3GabqOAiEIasje0R3BiglbA1Y
 wm4sNCFbd9Y+nijgYuyyuDhTv7nh5vlv7FT9m9cPVv1gx4XiRdUEeCbFL
 Z+ZTWJybqsu0jfUhKV3as34Xh83PArRrf/sir+lk66G3zvcbQjvXLByqS
 C432FueSuQqCcrfI8RI/cbiVaoB3/UbMTDr9cp8+/nTK8JRfTW4jX4/mz Q==;
X-CSE-ConnectionGUID: KlszoQm7RSmfpNSNR3ZxCw==
X-CSE-MsgGUID: Ft8Cl+e7SEq7gTt7jNPRMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="39099637"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="39099637"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 11:17:19 -0800
X-CSE-ConnectionGUID: WZoLylSkT6iosoqdHqwPgA==
X-CSE-MsgGUID: Q+leaCUVSmiJkYDEdyD9Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146605985"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 11:17:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 11:17:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 11:17:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 11:17:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahY8EqvTlh1hKfaVGT5Xs4CMuDMzcxfCavpFu/J7meH1Py4jP7ESEFvkKbUud2ebHnWCHfUtpMEx8Nx0t0RPVtFE5TElbiGys427cowSWUlmaf4+WoCdaoIb6c6riIcUYVcNXfpORgGFZYDyqgEdczR5Dcukx4RReJo4m2Oj2w27uk7lyYGlGzJqhFD3aZyd3zqFHULHx7i5u+UKDIMYhbzgAz0bPzaHysH9kbcgi7PsKoSRev6QpBR/lDl4RQwC0I2ZqKYfRqLdS4WIIirLS9TUgKa8Pn8QWwm0Ri62fe2w+ETVyOKHXfn1mXJW5zFSzd60+ebehcGRSl3bP7pi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnsNqSTdwA1rswhvZRl85I8vCy43d+VIalBTVJt6lFk=;
 b=EI95/913x9tXPQFWGT59ONfzF532FUnCaQgdePrYM6M+0o20h0EamvOVBv9Bv0WyFCXVm5kaD5be06iUEJSkkkoyZu7uBk8itowf99U1yF5UpS85h5Vgnru7ve6d2h/nYSaZ9nOcs1H1URBDz5dWU7wSswq4jIIb9jLxU//7KIWcSJr2AvoXDdrFPpEE6+MLPcK2/OK0WAWy6r0aG9fgweB9gBLIfliuRwHI7snah5l8NpnFDhzIZLOr1smO99CWJiejYK6GpmQeL+paYPwIELAoJuLZLjYIcdlCMCOuoKtjdHGP/1CTJXeafjAjXcLktSPmMCErmzhuRMcSXNaiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB5199.namprd11.prod.outlook.com (2603:10b6:a03:2dd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Thu, 30 Jan
 2025 19:17:16 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 19:17:16 +0000
Date: Thu, 30 Jan 2025 13:17:11 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Ewelina Musial <ewelina.musial@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v3 10/10] runner/resultgen: Add cmdline to
 results.json
Message-ID: <nhqlawqsr7kwrsuvwtxq5s6yafbcmtawotaxarp3amng5dospx@n6i3bf7zp7jp>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
 <20250130172149.3657144-11-lucas.demarchi@intel.com>
 <20250130190055.qn4xxd4y4za6ehuz@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250130190055.qn4xxd4y4za6ehuz@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: MW4PR04CA0102.namprd04.prod.outlook.com
 (2603:10b6:303:83::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: 15492aeb-cf67-47c0-00ed-08dd4162b535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GUHyFFDbIKj4jxAKNaDoa5HmWqpMEA00Rl31uUDqN+yF4IJ1yNQF9Mf0sKqU?=
 =?us-ascii?Q?E0dA7vcvXncxrbuogdk16HNp8kWSq23jUHK1LKQZUO/HLJQVEi4PqSn+AA4r?=
 =?us-ascii?Q?Syd79n8tmbYtjBRwneC8/MeqoxS1WkvPZ7ht83vOzEf5bSvke7e5sdgJxZ+v?=
 =?us-ascii?Q?hrsnEXXmvBwCafCLAKe/8X9OE7Q3GOVfYaP2dNIAv+zB0owoDlEtXR54UZ7X?=
 =?us-ascii?Q?twYUrkU5eY2nrJRt+Y0jPkpEoJjaIy+q1wula4rNz5ykFM5Ywv/HCmrgUplf?=
 =?us-ascii?Q?GXhrG57bmzW9Zs6TLXD3uoDiQsZuvSUwME7JbTiWODz3MpybuKWEaeAKL+jH?=
 =?us-ascii?Q?9C6ja0avaNKDpYMlRTkTrTGTp1bSlt6hS1h7OIbJ/FJyAT/XjPpx7ZAa2QQW?=
 =?us-ascii?Q?vMYXu20k99SVT6OKhhOg12HSdQ1ow3kFwn7RpBMFyVq8Jeo4WetMxgthUfJm?=
 =?us-ascii?Q?1j9jhKTZSaoLAGle1riVHhvCS4aJ2fPOTuOHXPfmQKJhPTRZ4ZZ2DQmuzfjT?=
 =?us-ascii?Q?GGaKidoOiRUFp4gP4N1psuKyQGspSUEAyAEqyqFvMp4+Bfk6yZPHKXMFMbWs?=
 =?us-ascii?Q?HH64A+Jjbw9fZAVutolUyVXuztxSJIGkny5TsRyY0bLhxJDD3gkIuDih6EQL?=
 =?us-ascii?Q?wnvRz1qUnUu1wx74APjYk/1k30/dCacHmrDuIe31SghsVkKh4Vak2/M9XI4d?=
 =?us-ascii?Q?NmweX2AeAXv2i66Sfld0P5xrYBRSekHtsjfCYwIIbnDvdeblGrVm2UXGE4nX?=
 =?us-ascii?Q?T2Z6HsdzS26gaDP4I7DlQWJ96O3STaaaSoZcWwPXLm/kAdrCxlRULFxk8BEz?=
 =?us-ascii?Q?9Aq9kO5kh25ipKkifmzLiRC2CbToW41Yk/QZcCJhAc9NyU4a4IgliL45hTKR?=
 =?us-ascii?Q?GKIKhgqqCBNFBaRIQ35uW7CuJ/ViCmT+Y9wROZ21PHcSuzLno0+jz9Eydx8o?=
 =?us-ascii?Q?wnyKY6ty6hzmgKj59IE2EU06Vzwmg/IBlHJfeYAqLj2/4OUWwjjo7ReZgM9U?=
 =?us-ascii?Q?iSYWvBK+fp0/XyPLe7tiUCB77gkULQy7mAM0Mf/BNyB6wKgnZlzm6qxbAAy7?=
 =?us-ascii?Q?mxM3d3XKR3dQUj1cyqVVDbCNrpCpOHlxkJOZaWz2fRF2rNjCLc32eyk/F+C9?=
 =?us-ascii?Q?BVl+amHs7jUSd/kWHphryiyxhAminR/bNyhwunsjzH96PDTnf5Ggui7/MMqu?=
 =?us-ascii?Q?lQm8jPmNG5s2f/6JVPca3CiysuPk5PbyiDpL8VecIK7+Qjvwk3roMzPjVaNH?=
 =?us-ascii?Q?xDbt5WnhDa6PmIuF5azQgt1T4NcMbrMfLT4oVCcaWfwe7/xHq5eoEyXjWT8C?=
 =?us-ascii?Q?Vg7/CIu5mElN07phCRS3fo19pWU8Zl7V7NFVlGdZZKKQfA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wl2MUrZOCevWtKgJZTaDNK2IjzFBnRCU5Wa5DYUwjRph+vla0ZjGfZDme1yc?=
 =?us-ascii?Q?APLNSsJjqpZRJCh9Rwb+JVuGoS/wyoafQU3SXFNKXwReCslxPwT/J3x4u9Ke?=
 =?us-ascii?Q?SuhGVdaci5mXw/tVR/rKz6KgOzl20BrV+1/6/6nFXVDR0MiTT4xLGAI1P55c?=
 =?us-ascii?Q?pNfqEORr0+/R2e7NEgXaTbWKEr3g0Two+3royWk16bx0QX+Z6PSjBCcso/k3?=
 =?us-ascii?Q?NRlurtBsLj+wmUj6Q1FIMfF53EG1PrwMul9YxWallUpeT+bqHmJ0bhCKAwc5?=
 =?us-ascii?Q?UzpQGCp7bvPzyU6GXW6FyjlbtdhrtLIudzVciIwcOuwhbrJK4UKbUJIq+tyL?=
 =?us-ascii?Q?NkGiERsaVEXZ+cq1MFZN1lC5n8UcFtbC2P4uxbicZkEP3KgQcfyZ6nY/zgi2?=
 =?us-ascii?Q?4qnUSTwgVhkCPUSYSW72+3+CX+VERar6eCmCopbY8Ghqf89OaPpniGlbWRod?=
 =?us-ascii?Q?biRqZvepE23UitNryep9+hqzKgBaOBH0VLKutgjtEf1+X/FscwNGM9LJCRw+?=
 =?us-ascii?Q?AA7FLUYBZbcw2BbEpkA4l/1sh3RJGyUO7ASgt9YQ43DqmY5N7i8yJOqhdyh8?=
 =?us-ascii?Q?99q8Hlv4IshkK+GMNK71gFUMoAQJlr/HIZtjsR1jFXFQpLEOVM/vNtlFYrf0?=
 =?us-ascii?Q?uvQGmq2KDuWAYFfRicJuNOOglrk0TJp6CgSc2Ks5F5pwS6V/Uo+iDxBntiuk?=
 =?us-ascii?Q?AvPoAKOKbVr13mDFaSdk4X7Q+/jKMVssL5RTNrZ9lQLv5SN91Kv+EKziKGDa?=
 =?us-ascii?Q?lGd76YOzfG/1ct4EVpqBcbMR/D6biuu+x7ffFyT2W6a4+bhZuGp6J9f8RRnd?=
 =?us-ascii?Q?7B0PHQ3wsBpCUuHNCA7l8DZ5K7VPmeyNuLtKVnAfF5G2jXD0Z52RVzoz3mMj?=
 =?us-ascii?Q?Se0eF6aIXAyUohmZI1CkhdAZWF1mRf5vikqlWdyWpyOQOH327Zu3y78iaoj1?=
 =?us-ascii?Q?TS1aMI+En7BsY+d7kTeJUUteDxPa87buyFUJ1EKvEukQE/4vJleEE/PLZbuN?=
 =?us-ascii?Q?AxVVIqp1BhlbK33Rd5R/8yBTgBRWAVeNXsqAjgAufFDJPnEDr1DyRh1xp8KE?=
 =?us-ascii?Q?2xIuh4bEiSpHk1VNmR8ytUaZfXPFD6x0tPvMu3Ce4pkq2HRBv1vmDW4byeov?=
 =?us-ascii?Q?MCErDxGP06ai8uKAZ9O9uX2r4EiqtZNs/zPi0fUuTTggAxWz9GRJTod1SZop?=
 =?us-ascii?Q?+kG+MuA8EmGYWDgQ3Qs5b/su/OmPRmV2sIWlvDxmflHdD+Tad8Ima06LvQ3h?=
 =?us-ascii?Q?0taWb7qy5CkV9sLm4rEVPHRBLDmeJIIAG5V/TnS4J7KLcn54qbI2sA7WiGE1?=
 =?us-ascii?Q?2bAfc7Ic8XNoXaj1/8NRiwe7H79lgUZPQ0pw8FK93wOHhEh8+V6DIaxUF59N?=
 =?us-ascii?Q?UAAL3zSjRQ4xZUK6yzJtd0G1Oz1vqUc8SIzV6fWLekgySMU7QMrDO5G2B4MN?=
 =?us-ascii?Q?KirQTH5FofJPpGPFxYIrBOQmqXTtal6NzHRkSoXt7O4cBdE+MmWdVEF3egJd?=
 =?us-ascii?Q?eHEAkVD3LwECT1IpOYQSECROXhFUcY2IMcD+y+SGRMLpzcOikXIdNl2dKAd6?=
 =?us-ascii?Q?DhzTr3DlNC2VEgxy4IuGS7T+e8Bwl67Szl1hYvjrZXaH2mWXJFJyg/MbtNVi?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15492aeb-cf67-47c0-00ed-08dd4162b535
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 19:17:16.1219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dM+0tLOYI26xsKq7hsZIoX3cPC8Qirkq3sBpSa/euvfoLs85mIZJQv/MrL8V51acpkm3warliPRtatcYdeWuEfyXHr0obbmJDuP5AOpb6Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5199
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

On Thu, Jan 30, 2025 at 08:00:55PM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2025-01-30 at 09:21:49 -0800, Lucas De Marchi wrote:
>> For easier repro scenarios, add the cmdline to the json: one can see the
>> exact command executed to try to reproduce a CI failure without needing
>> extra files.
>>
>> Adding cmdline to the results.json doesn't need a version upgrade:
>> piglit can still parse the file.
>
>Why not just printing this into stdout before executing test loop?
>The same way which is already used by igt_facts, so it will go
>into runnerNN.txt log and will not be duplicated in each and every
>results.json

igt_facts print things that is happening between the tests. It's
monitoring the execution.

I don't understand the push back here when we already add things
like version, uname, execution time, etc. You could use the same argument and say "look at the runner.log"
to see the execution time.

I want to be able to see things rendered in the final html at
https://intel-gfx-ci.01.org/tree/intel-xe/bat-all.html,
make things discoverable and also be able to download the .json, process
it and come up with the answer to "what do I have to do to reproduce
this error locally?".  A script `repro-igt.py <results.json|url>` would
be very handy and made possible with improvements like this.
It's a huge benefit for reproducing and fixing bugs. I don't think the
extra few bytes really matter.

>
>Adding also Ewelina to Cc
>Cc: Ewelina Musial <ewelina.musial@intel.com>
>
>Digression: for repro it could be helpfull to have also git logs
>and kernel config but this also is one-time info for whole
>bat/shard run, so again no need to duplicate in every results.

they are already there

IGT-Version: 1.30-gfafef52e0 (x86_64) (Linux: 6.13.0-xe+ x86_64)
		   ^^^^^^^^^

The kernel one is not since we stopped appending the version,
but it would be good to bring it back.

Lucas De Marchi

>
>Regards,
>Kamil
>
>>
>> Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>...cut...
>
>> index a2b79da9e..2c483fdf5 100644
>> --- a/runner/json_tests_data/warnings/reference.json
>> +++ b/runner/json_tests_data/warnings/reference.json
>> @@ -3,6 +3,7 @@
>>    "results_version":10,
>>    "name":"normal-run",
>>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
>> +  "cmdline":[],
>>    "time_elapsed":{
>>      "__type__":"TimeAttribute",
>>      "start":1539953735.1110389,
>> diff --git a/runner/resultgen.c b/runner/resultgen.c
>> index 87847bf5b..0d3a569cf 100644
>> --- a/runner/resultgen.c
>> +++ b/runner/resultgen.c
>> @@ -2281,7 +2281,7 @@ struct json_object *generate_results_json(int dirfd)
>>  {
>>  	struct settings settings;
>>  	struct job_list job_list;
>> -	struct json_object *obj, *elapsed;
>> +	struct json_object *obj, *elapsed, *arr;
>>  	struct results results;
>>  	int testdirfd, fd;
>>  	size_t i;
>> @@ -2319,6 +2319,11 @@ struct json_object *generate_results_json(int dirfd)
>>  		close(fd);
>>  	}
>>
>> +	arr = json_object_new_array();
>> +	for (i = 0; i < settings.cmdline.argc; i++)
>> +		json_object_array_add(arr, json_object_new_string(settings.cmdline.argv[i]));
>> +	json_object_object_add(obj, "cmdline", arr);
>> +
>>  	elapsed = json_object_new_object();
>>  	json_object_object_add(elapsed, "__type__", json_object_new_string("TimeAttribute"));
>>  	if ((fd = openat(dirfd, "starttime.txt", O_RDONLY)) >= 0) {
>> --
>> 2.48.0
>>
