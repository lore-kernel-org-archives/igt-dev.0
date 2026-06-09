Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD81CCD8CA4
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 14:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E26E10E545;
	Tue,  9 Jun 2026 14:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4lvyH2C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A48110E545
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781017102; x=1812553102;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pchA6XSNOgyumaUN4JnirHyLQMcku+HN9zf5DorrtlE=;
 b=Q4lvyH2C3QzIAWBnMw6ThVSJcp71zFrtN8gcDnwmbGTtcjlgiwb4IHDI
 VvbjerJx6LcQOLmPYhGHGuSi+F9kl6TGlyTihPkWaFkhwjdGkUIYu7kvs
 zsZLy31J9GtyVq/lzp2hS/B7i14YvqsP7AwwMHTj0cvoV+e99P4k/6NKf
 aRJMVscIneWY7QyMKUFhse6UOKFXsAl9LM+QZoTM6Y6iNRHzFjL6ryqtN
 T0l7vt4lZdM+s1uJQZ2CI0ji90hiBxKYM+a+cV90iuTyLkIIRVh5yrNTA
 KKcJXiZX08rbnnT+dJNd581NtvBEUV8D5eE/ryfXPPDxw566vGkQz7gO1 A==;
X-CSE-ConnectionGUID: 3LeIIGkeThK3BRR5wyO5bg==
X-CSE-MsgGUID: bLs0/anTQpK0uhhfA9cpIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81686651"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="81686651"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:58:22 -0700
X-CSE-ConnectionGUID: v2XC94zwRFKAXo49yKoKLA==
X-CSE-MsgGUID: ZsRIS9CVQxC/+JqYkNr7cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="241437526"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:58:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:58:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 07:58:20 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:58:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBIPUtxoVFtIYgBfFMjqD5yWTDEV2qVaC6ucHmJXz2KQPMfaCMJkYVIHKKv2yaQRa7r4350zhjFSuUPBitS6RX6kOLmiVst/YUzWPpW0sgLiRJvyMuR7trQDdBTXa+M8PLdZsg+07PwMyQ5US6qEFffVOmqfgwTEMZfg2QtWcWLej+GVwQppHhbh/Yu+kNukgtsvVfBwoHWqSy330tlK5OeZf5s06UV5THFKx2xnNjnuKDMOyBfCbbpbyxwIvsHXsDuIvmx+UFCK1+XK2MH4surh1gvf9D0tytDhf6sy+GPB4u8hEyJgot+QqpNIqzU76DUTJCy8ujpj0PJd3Lwg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+HjwI54w2tVV7VJwSCHOigDyvCq4H8XOHPs1dKmgW0=;
 b=UOG3hq2ZUkUVEn/DVtP+LeEZFH7QlfRJkImuRYezpwWOZLIyiNn6Y/T0zoKi48SSV6MhdpeM9IFTU62NM3r+eGwe1sIUPaN1S6B4Zt4vjuKEwaVDZopcVkXZozAReWJVe0M4DvYepB7MaKus62bsdAkJV1lknYljBImnaTRWbjWjPPNPFbDZzhXj+ZBXbYLI62J2yivdDUm48m6icLxyY3UIM1XvUCCoqSaSysd1VsXbjyjcz2LcW5DOU7Lys9Y+f1tqVCjDNK1y/HFs0x2FVd2TracVhY7sr04pzncypN6SEPWlzN/zU3w7U3W4P/H18HML6cSrcX6nTGhOlQzPDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by DS7PR11MB6037.namprd11.prod.outlook.com (2603:10b6:8:74::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 14:58:15 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 14:58:15 +0000
Message-ID: <332cc480-b787-4757-8d24-e0207544813b@intel.com>
Date: Tue, 9 Jun 2026 16:58:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/8] tests/intel/xe_sriov_scheduling: Refactor
 throughput_ratio and nonpreempt-engine-resets test
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
 <20260527205644.2801165-7-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260527205644.2801165-7-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0114.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::43) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|DS7PR11MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d51e92-b46b-4c58-a5d2-08dec63788a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: PSGFDw4/+BFi/UJIxYmmMxvxMzn4XFQL54w5wiKs/a3roK7OYqdywNvH5PR/abysoCvSUAFw5HHLrtsiuXjOXGL9k2gBiF/rOFFmSvXBV3jABM0Ie9QP+Q49XFC6C7phuQ4HiOSMOdUMFnlX2s2EdTfRfZYDfX5WNXj3tZvNB2kIxEdXXS0Wu4jUa+LceJEfnr7dXiYB2qxuveFBc6zcUp6Wi78hg+JZ9L4wG2cpjaUcRRCZZHS0uCBGZ4h52TyblNgeV8kuV/yJdoBcODJy4d5skriVFtbbLnBdVXXwKeHSYtOyBtGV15V9DoojfvWRoSvCh1o+yxt+u4Nt2XNiw3CdYmZNSIOkAb+1yDSYCzhIfI45eKcXyMO5zepemFEO23RWZ5ss8dS/8vR/NCU4l6/pYM4dGV5zHN/JzK1NyNgNpRAhx1PJsGfQukoiaALtXwndhgah5Td6VzUdtHm7Bv9Vn2oN3IxtCr0P+6QNktfKoRHCYE+4xVA249ePQ0PHSrpMC+Tpj84V5Nc27FxnSCKsv/GHssISUOIbxJs9Ppn+hH5TrlRSkVofeZniUOFSO7t8ReVPezpfXgIHIGktSDIur637D+VZquk/1Nsl0ufyrIEm7KBcmD/GfNJoCU6C4Ax/7t4/8B78Sy2JWKWTNfiq84EDCz6b+/FdKb6WK+YIoOuvEQn1vKzNsxhtu5cG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU5lQ0lqOG5zd1pLQmwzQ3VKL3J3U3V0d3FFQThUZ3ZGSEJ1VU9wc3VaNnNk?=
 =?utf-8?B?dXR3VTVNTzNUOVNGNlV4SHh1WjRyYlVuVVd4MXM5dFNmV1VIUmRNTS9vb2tJ?=
 =?utf-8?B?QytNYW5zRmVQUElMdk9wU3kxMHFVQUl1QXl4eUg0UVhLUXI2Zi9QUkN5L29J?=
 =?utf-8?B?QUNpekxuWWYzSTBsN0FQSHBzNFZCREJWQjJQTnd3T01CMjFzcFJxcHBKenR2?=
 =?utf-8?B?UXJ1TVpVaTlYNEdoTUxlNTk4d0NBUzVod0ZWT3V1UDRqY3Q5ZllmL2tibTcy?=
 =?utf-8?B?dzFVeVJPQWVMYmJoTlJHVEQvQnMvMTl2L05hTVNoYkZ3MGt6eDlwWGhvZ0ZG?=
 =?utf-8?B?TjVNYWowd3Z3M09ZbnRBbU1uWEs5aUd6MS95NFhXWGdyZ3dBS011OU1CaUQz?=
 =?utf-8?B?OXdtQkw0ck5PUGdzdDkxcTBxUmpQSm9LMmJNYS9CcEFpSjA4R0J4bjNocXcv?=
 =?utf-8?B?RzJOZFQ4NDdoSE41NnlEdWszZXBnUWUvUnYydGxnYkNSemJZUGNuVkwvL2lO?=
 =?utf-8?B?Z2J5Z3QyOE15ZHdRUUhiTGxwYWNLSEoyc3NjdXZHQmkwdUE4K2I0emFBSUhJ?=
 =?utf-8?B?V3F4YTcvM2R4SEtCaFhLZGN6QnZHTnFBVzg5YWJXV0Z4TWN0M2QxNGw3TUsv?=
 =?utf-8?B?NGFOUTlTaWh3S1paUkpHTnhzV0hpVzkzN0pzMFczK0d2bHF4OHhUcjU3cTF0?=
 =?utf-8?B?WjZIL3JtSEpxZTZPZ2NIampCM28wQS9HMHNJSWgzbG9JMVJzVEJOOTZScTdJ?=
 =?utf-8?B?T2JsS3MrSDdpSUlqanBHRWNzN3V5aTFIMS83b1Z0a2VRbTlIUnpzUEFPNkNi?=
 =?utf-8?B?WHpDMGZqSmNaMm9ZYWZSOXBrbWNBaHBwRFFpWlZVZEVEdXJaOHlNTWhHZWxE?=
 =?utf-8?B?U1hRT09UQU83QTZJMktKdXg4R09pSmR1ZFQ2bWtxNnJOamppOWVnOWFXQ1RG?=
 =?utf-8?B?RmJUWU0yQXIybHN2eWhSQU9Bc1Eyd3ZOdXptZFF6N3RGWElmTGpyS3doaHJr?=
 =?utf-8?B?RHFCa09SYnBvQW5VeTRyaFV1ZisveEgwVzFBQlZVSERENXd1RlNCOXlCTGZB?=
 =?utf-8?B?WDE1bzJNelErdkJTbmpJQlJyekU2aTV1cy9DVUVPNXhrcDd0LzFoOFZWb3M0?=
 =?utf-8?B?dFAxYjlBUW9uQktyQUVHc2I4cXhNbktTT216eDBjTlVqamFySzNCWk9SWEVx?=
 =?utf-8?B?ZU5pcysySHAxUlg1T1RscnllbkVDb2lOc0t3NmVXeVJ5bDl0di9DaGExV1Jh?=
 =?utf-8?B?UGQwUG1jajRrUjAwVFptOWJTVk82Uk5ZMmdzRlo5aWZ4QUVqOGc3WXgwdDJo?=
 =?utf-8?B?RW45SGhZWWRSUFhjYllGRFMwMzNmeGNOTlFNZFA1cDZYaytGY205ZEVnTkRz?=
 =?utf-8?B?TTFYVjNIeFdETlFMM1NHeGFUcWdJZ3dEa1hNRmJrNzNrSm53R1diY3p0dDV1?=
 =?utf-8?B?ZmFZdWtzelhjZmExalB2UktIYlErcVVhdnB5czNsS2hsN0MxUzdRM3JzWFMz?=
 =?utf-8?B?TDdBWFJTd2ZTaDBiQjEycWUrRlkyWTZ6SG1RekV5eVE0ZEZzVEpFRG9oWlZs?=
 =?utf-8?B?SXphMGVzL3V5TGwzY0xxT1VWSFZqSGZJajBzUFJxNUFoTy83TjZ3RWdabEZi?=
 =?utf-8?B?V1FTK0tBN05aVkJ2UzQyOHJXTEl2VnM1WVZQU3g1M2lBNWdCcVNOWi80dEtH?=
 =?utf-8?B?TFpsWkwyUHJveG5pTXdlVEVoQUFEd1FCQzhibVBDaTN4RGFIbCt3M3F0N01u?=
 =?utf-8?B?MTBSMjVvdmJQd0VTZlZBRExIVlQ3QUE5cHd3ZWVXZk1GQ3RGdXFhMEZQdlFp?=
 =?utf-8?B?UmhEWWJMcDRLSmJLU0ZRQjh2NTE2ZlBjaDkzUUVURjkxY2FUeTBnMXlaczNk?=
 =?utf-8?B?elgrTVNqeDBPbENVWVBqUWhNQmVpRjhtZUZ4eVJLekRocXJVbHA3RHYzOHYr?=
 =?utf-8?B?SGNWdFdxYzgzVFJBVnluMG55RlRQNEhMNGc2RitVdkxBeEV5eDF2OEt6VWtH?=
 =?utf-8?B?dXY4YmRBWkovUWY3QXM0VGdkSlJYcEp1Vk9oWTVSaUVZODNJREhWNzJaVFh1?=
 =?utf-8?B?MHFSUHVqZ1R3MStFYm1lWUlQU3dYYXlwNkIrQ1VrUXpHYTJyYm01MUNmU2Iv?=
 =?utf-8?B?L0xPaEw3ZGI4SkExUTFKMjZLVDFSYnIvS1lscUNGU3Z6aG5DRDZWeC9WYzM0?=
 =?utf-8?B?VXFURUtHcnRybWFobzRSWVZ2WHFZQ3EyWUltVWRGcVpCMHJqQ0dpNnFPMXdT?=
 =?utf-8?B?R2lrNlBNVzlVb3cwb2VKSFV3QXN1WVBQTmxLREIzNVNpTUYzSTRtZWQ3RXJS?=
 =?utf-8?B?Mno5eFVubE1HaFJCUFBxZWllRlp4V0NGWkRoL2tidXBhUldEYWZyQT09?=
X-Exchange-RoutingPolicyChecked: gVh8KdsH6vIuNoaUmiuoz6tCjek4V1k/WwJD5ZU7FrQudEdkaYU0Ny9JGzYWERHBoVEVVUY4dpzyNvmlayL8XBb0PKrwmnn63Jj3aVlDZjXe8H9bD4oX5GRn9Q7U48bnOChWysV729ggqGIm4hIAgFPemOBPGHXbdC6Pi0h1MCqBrB0kA2qHhYzh10oMET7xY9/RhS9Vv5OURHTGUNaUf/Dja0fAc2ddbUXS3Hh8gyOkl7kpeQfKDUp+e53MNCfn3OqU/ikwZe5wRP3bsdiGlGBOohJc+u6k7DKPN5imdwHMhu9eX4PcrW88gAli/1J7t0XeN6rQPcwB3ImD0C9IcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d51e92-b46b-4c58-a5d2-08dec63788a4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:58:15.3259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fe7kdLfwIUh7BjoD4P5Gato96cZwfltvneoSDpBfUvhl+D73bSDAqEVojVZ++MNw+7tgYUiu6bQDYF2M09ydyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6037
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


On 5/27/2026 22:56, Marcin Bernatowicz wrote:
> Extract verify_applied_scheduling_behavior so equal-throughput and
> default-enabled-fair-scheduling share common verification logic.
>
> Increase coverage with verification across all GTs and both low/normal
> scheduling priorities.
>
> Strengthen confidence in results with PMU-based checks using
> engine-active-ticks and engine-total-ticks metrics (when available).
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel/xe_sriov_scheduling.c | 373 ++++++++++++++++++++----------
>   1 file changed, 255 insertions(+), 118 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 9550c8e58..692f92e76 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -158,6 +158,7 @@ static void subm_fini(struct subm *s)
>   static void subm_workload_init(struct subm *s, struct subm_work_desc *work)
>   {
>   	s->work = *work;
> +
>   	s->expected_ticks = xe_spin_nsec_to_ticks(s->fd, s->hwe.gt_id,
>   						  s->work.duration_ms * 1000000);
>   	for (unsigned int i = 0; i < s->slots; i++)
> @@ -1093,48 +1094,35 @@ static void warn_active_ticks_mismatch(const struct runtime_metrics *metrics,
>   	}
>   }
>   
> -/**
> - * SUBTEST: equal-throughput
> - * Description:
> - *   Check all VFs with same scheduling settings running same workload
> - *   achieve the same throughput.
> - */
> -static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opts)
> +static void verify_applied_scheduling_behavior(int pf_fd,
> +					       const uint8_t *vf_ids,
> +					       size_t num_functions,
> +					       const struct subm_opts *opts,
> +					       bool verify_with_perf_counters,
> +					       const struct drm_xe_engine_class_instance *eci,
> +					       const struct job_sched_params *job_sched_params)
>   {
>   	struct subm_set set_ = {}, *set = &set_;
> -	uint8_t vf_ids[num_vfs + 1 /*PF*/];
> -	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
> -	struct job_sched_params job_sched_params = prepare_job_sched_params(num_vfs + 1,
> -									    job_timeout_ms,
> -								    opts,
> -								    XE_SRIOV_SCHED_PRIORITY_LOW);
> -	const unsigned int k = select_inflight_k(job_sched_params.duration_ms,
> -						 opts->inflight, false);
> -
> -	igt_info("eq=%ums pt=%uus prio=%s duration=%ums repeats=%d inflight=%u num_vfs=%d job_timeout=%ums\n",
> -		 job_sched_params.sched_params.exec_quantum_ms,
> -		 job_sched_params.sched_params.preempt_timeout_us,
> -		 xe_sriov_sched_priority_to_string(job_sched_params.sched_params.priority),
> -		 job_sched_params.duration_ms, job_sched_params.num_repeats,
> -		 k, num_vfs + 1, job_timeout_ms);
> -
> -	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
> -		    &(struct init_vf_ids_opts){ .shuffle = true,
> -						.shuffle_pf = true });
> -	xe_sriov_require_default_scheduling_attributes(pf_fd);
> -	/* enable VFs */
> -	igt_sriov_disable_driver_autoprobe(pf_fd);
> -	igt_sriov_enable_vfs(pf_fd, num_vfs);
> -	/* set scheduling params (PF and VFs) */
> -	set_vfs_scheduling_params(pf_fd, num_vfs, &job_sched_params.sched_params);
> -	/* probe VFs */
> -	igt_sriov_enable_driver_autoprobe(pf_fd);
> -	for (int vf = 1; vf <= num_vfs; ++vf)
> -		igt_sriov_bind_vf_drm_driver(pf_fd, vf);
> -
> -	/* init subm_set */
> -	subm_set_alloc_data(set, num_vfs + 1 /*PF*/);
> +	struct vf_config *vf_configs = NULL;
> +	struct runtime_metrics *metrics = NULL;
> +	uint64_t measurement_start_ns = 0;
> +	uint64_t measurement_end_ns = 0;
> +	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, eci);
> +	unsigned int k = select_inflight_k(job_sched_params->duration_ms,
> +					   opts->inflight, false);
> +
> +	igt_info("eq=%ums pt=%uus prio=%s duration=%ums repeats=%d inflight=%u num_functions=%zu job_timeout=%ums\n",
> +		 job_sched_params->sched_params.exec_quantum_ms,
> +		 job_sched_params->sched_params.preempt_timeout_us,
> +		 xe_sriov_sched_priority_to_string(job_sched_params->sched_params.priority),
> +		 job_sched_params->duration_ms, job_sched_params->num_repeats,
> +		 k, num_functions, job_timeout_ms);
> +
> +	subm_set_alloc_data(set, num_functions);
>   	subm_set_init_sync_method(set, opts->sync_method);
> +	vf_configs = calloc(set->ndata, sizeof(*vf_configs));
> +	metrics = calloc(set->ndata, sizeof(*metrics));
> +	igt_assert(vf_configs && metrics);
>   
>   	for (int n = 0; n < set->ndata; ++n) {
>   		int vf_fd =
> @@ -1144,94 +1132,145 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   
>   		igt_assert_fd(vf_fd);
>   		set->data[n].opts = opts;
> -		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
> -			  xe_engine(vf_fd, 0)->instance, k);
> +		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0, *eci, k);
>   		subm_workload_init(&set->data[n].subm,
>   				   &(struct subm_work_desc){
> -					.duration_ms = job_sched_params.duration_ms,
> +					.duration_ms = job_sched_params->duration_ms,
>   					.preempt = true,
> -					.repeats = job_sched_params.num_repeats });
> +					.repeats = job_sched_params->num_repeats });
>   		igt_stats_init_with_size(&set->data[n].stats.samples,
>   					 set->data[n].subm.work.repeats);
>   		set->data[n].stats.complete_ts = calloc(set->data[n].subm.work.repeats,
>   							sizeof(uint64_t));
> +		igt_assert(set->data[n].stats.complete_ts);
>   		if (set->sync_method == SYNC_BARRIER)
>   			set->data[n].barrier = &set->barrier;
>   	}
>   
> -	/* dispatch spinners, wait for results */
> -	subm_set_dispatch_and_wait_threads(set);
> -	subm_set_close_handles(set);
> +	run_subm_set_and_collect_metrics(pf_fd, set, vf_configs, metrics,
> +					 verify_with_perf_counters,
> +					 &measurement_start_ns,
> +					 &measurement_end_ns);
>   
> -	/* verify results */
> -	compute_common_time_frame_stats(set);
> -	for (int n = 0; n < set->ndata; ++n) {
> -		struct subm_stats *stats = &set->data[n].stats;
> -		const double ref_rate = set->data[0].stats.concurrent_rate;
> -
> -		igt_assert_eq(0, stats->num_early_finish);
> -		if (!check_within_epsilon(stats->concurrent_rate, ref_rate,
> -					  opts->outlier_treshold)) {
> -			log_sample_values(set->data[0].subm.id,
> -					  &set->data[0].stats,
> -					  set->data[0].stats.concurrent_mean,
> -					  opts->outlier_treshold);
> -			log_sample_values(set->data[n].subm.id, stats,
> -					  set->data[0].stats.concurrent_mean,
> -					  opts->outlier_treshold);
> -			igt_assert_f(false,
> -				     "Throughput=%.3f execs/s not within +-%.0f%% of expected=%.3f execs/s\n",
> -				     stats->concurrent_rate,
> -				     opts->outlier_treshold * 100, ref_rate);
> -		}
> +	for (int n = 0; n < set->ndata; ++n)
> +		igt_assert_eq(0, set->data[n].stats.num_early_finish);
> +
> +	assert_share_matches_expected(metrics, set->ndata,
> +				      opts->outlier_treshold, false);
> +
> +	if (verify_with_perf_counters) {
> +		warn_active_ticks_mismatch(metrics, set->ndata,
> +					   opts->outlier_treshold);
> +		assert_share_matches_expected(metrics, set->ndata,
> +					      opts->outlier_treshold, true);
> +		assert_throughput_share_matches_total_tick(metrics,
> +							   set->ndata,
> +							   opts->outlier_treshold);
>   	}
>   
> -	/* cleanup */
> +	free(vf_configs);
> +	free(metrics);
>   	subm_set_fini(set);
> -	__set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
> -	xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
>   }
>   
>   /**
> - * SUBTEST: nonpreempt-engine-resets
> + * SUBTEST: equal-throughput-%s-priority
> + * Description:
> + *   Check all VFs with same scheduling settings running same workload
> + *   achieve the same throughput.
> + *
> + * arg[1]:
> + *
> + * @normal: normal
> + * @low: low
> + */
> +static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opts,
> +			     bool verify_with_perf_counters,
> +			     struct job_sched_params *job_sched_params,
> +			     enum xe_sriov_sched_priority priority,
> +			     const struct drm_xe_engine_class_instance *eci)
> +{
> +	uint8_t vf_ids[num_vfs + 1 /*PF*/];
> +
> +	igt_assert(job_sched_params);
> +
> +	if (!job_sched_params->num_repeats) {
> +		uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, eci);
> +
> +		*job_sched_params = prepare_job_sched_params(num_vfs + 1,
> +							     job_timeout_ms,
> +							     opts, priority);
> +		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
> +		set_vfs_scheduling_params(pf_fd, num_vfs,
> +					  &job_sched_params->sched_params);
> +		igt_sriov_enable_driver_autoprobe(pf_fd);
> +		igt_sriov_enable_vfs(pf_fd, num_vfs);
> +	}
> +
> +	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
> +		    &(struct init_vf_ids_opts){ .shuffle = true,
> +						.shuffle_pf = true });
> +
> +	verify_applied_scheduling_behavior(pf_fd, vf_ids, ARRAY_SIZE(vf_ids), opts,
> +					   verify_with_perf_counters, eci,
> +					   job_sched_params);
> +}
> +
> +/**
> + * SUBTEST: nonpreempt-engine-resets-%s-priority
>    * Description:
>    *   Check all VFs running a non-preemptible workload with a duration
>    *   exceeding the sum of its execution quantum and preemption timeout,
>    *   will experience engine reset due to preemption timeout.
> + *
> + * arg[1]:
> + *
> + * @normal: normal
> + * @low: low
>    */
>   static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
> -				     const struct subm_opts *opts)
> +				     const struct subm_opts *opts,
> +				     struct job_sched_params *job_sched_params,
> +				     enum xe_sriov_sched_priority priority,
> +				     const struct drm_xe_engine_class_instance *eci)
>   {
>   	struct subm_set set_ = {}, *set = &set_;
> -	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
> -	enum xe_sriov_sched_priority priority = XE_SRIOV_SCHED_PRIORITY_LOW;
> -	struct vf_sched_params vf_sched_params = prepare_vf_sched_params(num_vfs, 1,
> -									 job_timeout_ms, opts,
> -									 priority);
> -	uint64_t duration_ms = 2 * vf_sched_params.exec_quantum_ms +
> -			       vf_sched_params.preempt_timeout_us / USEC_PER_MSEC;
> +	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, eci);
>   	int preemptible_end = 1;
>   	uint8_t vf_ids[num_vfs + 1 /*PF*/];
> -	const unsigned int k = select_inflight_k(duration_ms, opts->inflight, true);
> +	unsigned int k;
>   
> -	igt_info("eq=%ums pt=%uus prio=%s duration=%" PRIu64 "ms inflight=%u num_vfs=%d job_timeout=%ums\n",
> -		 vf_sched_params.exec_quantum_ms, vf_sched_params.preempt_timeout_us,
> -		 xe_sriov_sched_priority_to_string(vf_sched_params.priority),
> -		 duration_ms, k, num_vfs, job_timeout_ms);
> +	igt_assert(job_sched_params);
> +
> +	if (!job_sched_params->num_repeats) {
> +		struct vf_sched_params vf_sched_params = prepare_vf_sched_params(num_vfs, 1,
> +										 job_timeout_ms,
> +										 opts,
> +										 priority);
> +
> +		*job_sched_params = (struct job_sched_params) {
> +			.sched_params = vf_sched_params,
> +			.duration_ms = 2 * vf_sched_params.exec_quantum_ms +
> +				       vf_sched_params.preempt_timeout_us / USEC_PER_MSEC,
> +			.num_repeats = 1,
> +		};
> +		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
> +		set_vfs_scheduling_params(pf_fd, num_vfs,
> +					  &job_sched_params->sched_params);
> +		igt_sriov_enable_driver_autoprobe(pf_fd);
> +		igt_sriov_enable_vfs(pf_fd, num_vfs);
> +	}
> +	k = select_inflight_k(job_sched_params->duration_ms, opts->inflight, true);
> +
> +	igt_info("eq=%ums pt=%uus prio=%s duration=%dms inflight=%u num_functions=%d job_timeout=%ums\n",
> +		 job_sched_params->sched_params.exec_quantum_ms,
> +		 job_sched_params->sched_params.preempt_timeout_us,
> +		 xe_sriov_sched_priority_to_string(job_sched_params->sched_params.priority),
> +		 job_sched_params->duration_ms, k, num_vfs + 1, job_timeout_ms);
>   
>   	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
>   		    &(struct init_vf_ids_opts){ .shuffle = true,
>   						.shuffle_pf = true });
> -	xe_sriov_require_default_scheduling_attributes(pf_fd);
> -	/* enable VFs */
> -	igt_sriov_disable_driver_autoprobe(pf_fd);
> -	igt_sriov_enable_vfs(pf_fd, num_vfs);
> -	/* set scheduling params (PF and VFs) */
> -	set_vfs_scheduling_params(pf_fd, num_vfs, &vf_sched_params);
> -	/* probe VFs */
> -	igt_sriov_enable_driver_autoprobe(pf_fd);
> -	for (int vf = 1; vf <= num_vfs; ++vf)
> -		igt_sriov_bind_vf_drm_driver(pf_fd, vf);
>   
>   	/* init subm_set */
>   	subm_set_alloc_data(set, num_vfs + 1 /*PF*/);
> @@ -1246,10 +1285,10 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   		igt_assert_fd(vf_fd);
>   		set->data[n].opts = opts;
>   		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
> -			  xe_engine(vf_fd, 0)->instance, k);
> +			  *eci, k);
>   		subm_workload_init(&set->data[n].subm,
>   				   &(struct subm_work_desc){
> -					.duration_ms = duration_ms,
> +					.duration_ms = job_sched_params->duration_ms,
>   					.preempt = (n < preemptible_end),
>   					.repeats = MIN_NUM_REPEATS });
>   		igt_stats_init_with_size(&set->data[n].stats.samples,
> @@ -1277,8 +1316,20 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   
>   	/* cleanup */
>   	subm_set_fini(set);
> -	__set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
> -	xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
> +}
> +
> +static bool skip_visited_gt(bool extended_scope, uint64_t *visited_gts,
> +			    unsigned short gt_id)
> +{
> +	if (extended_scope)
> +		return false;
> +
> +	if (*visited_gts & (1ULL << gt_id))
> +		return true;
> +
> +	*visited_gts |= (1ULL << gt_id);
> +
> +	return false;
>   }
>   
>   static struct subm_opts subm_opts = {
> @@ -1350,6 +1401,9 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   {
>   	int pf_fd;
>   	bool autoprobe;
> +	bool has_perf_events;
> +	struct drm_xe_engine_class_instance *eci;
> +	unsigned short ecls;
>   
>   	igt_fixture() {
>   		pf_fd = drm_open_driver(DRIVER_XE);
> @@ -1358,31 +1412,114 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   		igt_require(xe_sriov_admin_is_present(pf_fd));
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>   		xe_sriov_require_default_scheduling_attributes(pf_fd);
> +		xe_perf_device(pf_fd, perf_device, sizeof(perf_device));
> +		has_perf_events = has_perf_event(perf_device, "engine-active-ticks") &&
> +				  has_perf_event(perf_device, "engine-total-ticks");
>   	}
>   
> -	igt_describe("Check VFs achieve equal throughput");
> -	igt_subtest_with_dynamic("equal-throughput") {
> -		if (extended_scope)
> -			for_each_sriov_num_vfs(pf_fd, vf)
> -				igt_dynamic_f("numvfs-%d", vf)
> -					throughput_ratio(pf_fd, vf, &subm_opts);
> +	for (enum xe_sriov_sched_priority priority = XE_SRIOV_SCHED_PRIORITY_LOW;
> +	     priority <= XE_SRIOV_SCHED_PRIORITY_NORMAL;
> +	     priority++) {
> +		igt_describe_f("Check VFs achieve equal throughput with %s priority provisioning applied before VF enable on each selected engine",
> +			       xe_sriov_sched_priority_to_string(priority));
> +		igt_subtest_with_dynamic_f("equal-throughput-%s-priority",
> +					   xe_sriov_sched_priority_to_string(priority)) {
> +			if (extended_scope)
> +				for_each_sriov_num_vfs(pf_fd, vf) {
> +					struct job_sched_params job_sched_params = { };
> +
> +					xe_for_each_engine(pf_fd, eci) {
> +						ecls = eci->engine_class;
> +						igt_dynamic_f("numvfs-%d-gt%u-%s%u", vf,
> +							      eci->gt_id,
> +							      xe_engine_class_short_string(ecls),
> +							      eci->engine_instance)
> +							throughput_ratio(pf_fd, vf, &subm_opts,
> +									 has_perf_events,
> +									 &job_sched_params,
> +									 priority, eci);
> +					}
> +				}
> +
> +			for_random_sriov_vf(pf_fd, vf) {
> +				struct job_sched_params job_sched_params = { };
> +				uint64_t visited_gts = 0;
> +
> +				xe_for_each_engine(pf_fd, eci) {
> +					if (skip_visited_gt(extended_scope, &visited_gts,
> +							    eci->gt_id))
> +						continue;
> +
> +					ecls = eci->engine_class;
> +					igt_dynamic_f("numvfs-random-gt%u-%s%u",
> +						      eci->gt_id,
> +						      xe_engine_class_short_string(ecls),
> +						      eci->engine_instance)
> +						throughput_ratio(pf_fd, vf, &subm_opts,
> +								 has_perf_events,
> +								 &job_sched_params,
> +								 priority, eci);
> +				}
> +			}
> +		}
>   
> -		for_random_sriov_vf(pf_fd, vf)
> -			igt_dynamic("numvfs-random")
> -				throughput_ratio(pf_fd, vf, &subm_opts);
> +		igt_fixture() {
> +			__set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
> +						    &(struct vf_sched_params){});
> +			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
> +		}
>   	}
>   
> -	igt_describe("Check VFs experience engine reset due to preemption timeout");
> -	igt_subtest_with_dynamic("nonpreempt-engine-resets") {
> -		if (extended_scope)
> -			for_each_sriov_num_vfs(pf_fd, vf)
> -				igt_dynamic_f("numvfs-%d", vf)
> -					nonpreempt_engine_resets(pf_fd, vf,
> -								 &subm_opts);
> -
> -		for_random_sriov_vf(pf_fd, vf)
> -			igt_dynamic("numvfs-random")
> -				nonpreempt_engine_resets(pf_fd, vf, &subm_opts);
> +	for (enum xe_sriov_sched_priority priority = XE_SRIOV_SCHED_PRIORITY_LOW;
> +	     priority <= XE_SRIOV_SCHED_PRIORITY_NORMAL;
> +	     priority++) {
> +		igt_describe("Check VFs experience engine reset due to preemption timeout on each selected engine");
> +		igt_subtest_with_dynamic_f("nonpreempt-engine-resets-%s-priority",
> +					   xe_sriov_sched_priority_to_string(priority)) {
> +			if (extended_scope)
> +				for_each_sriov_num_vfs(pf_fd, vf) {
> +					struct job_sched_params job_sched_params = { };
> +
> +					xe_for_each_engine(pf_fd, eci) {
> +						ecls = eci->engine_class;
> +						igt_dynamic_f("numvfs-%d-gt%u-%s%u", vf,
> +							      eci->gt_id,
> +							      xe_engine_class_short_string(ecls),
> +							      eci->engine_instance)
> +							nonpreempt_engine_resets(pf_fd, vf,
> +										 &subm_opts,
> +										 &job_sched_params,
> +										 priority,
> +										 eci);
> +					}
> +				}
> +
> +			for_random_sriov_vf(pf_fd, vf) {
> +				struct job_sched_params job_sched_params = { };
> +				uint64_t visited_gts = 0;
> +
> +				xe_for_each_engine(pf_fd, eci) {
> +					if (skip_visited_gt(extended_scope, &visited_gts,
> +							    eci->gt_id))
> +						continue;
> +
> +					ecls = eci->engine_class;
> +					igt_dynamic_f("numvfs-random-gt%u-%s%u",
> +						      eci->gt_id,
> +						      xe_engine_class_short_string(ecls),
> +						      eci->engine_instance)
> +						nonpreempt_engine_resets(pf_fd, vf, &subm_opts,
> +									 &job_sched_params,
> +									 priority, eci);
> +				}
> +			}
> +		}
> +
> +		igt_fixture() {
> +			__set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
> +						    &(struct vf_sched_params){});
> +			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
> +		}
>   	}
>   
>   	igt_fixture() {
