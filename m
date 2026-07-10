Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D699C44501
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 05:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF63F10E134;
	Fri, 10 Jul 2026 05:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9jikbm6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E288310E134
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 05:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783662281; x=1815198281;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=35Pi1kuXRjMPopZOTe5Q0M0CHLdAGe9EALMCXUD5OGc=;
 b=P9jikbm6d2kHLQaEv0Rri7TuG/ZIxxCr3SuQ5VFb2RkIYDGxxj4JIoBd
 pX7n5jCrMyHb0oyP6cTS/PQVQ0BH7BKFIi967PEEiVXOuXY2r5Ip5UNXv
 Kiw/VS8x0iT8X7iVSpOUaYTQdmDagKkpqS1OswVHUXXkDqHfs0mqGG+nh
 iZhN7DQMej98f3UyAIFO/etJM3yDhMItRftyNv++0vHxEzC5VW4HXLoD+
 pfvHMA1yubgRLQFmjhkjpYA7KADDEpgisG8J3Pl04jyptZ+49keQka9tr
 5apmBVITom+4F0gVnhkEDRQ1I7UNiaHK15ANCFpysHkmogZ+Ei19CeLQx w==;
X-CSE-ConnectionGUID: fG8Xr5O9TAGYsRW5Q0ybQQ==
X-CSE-MsgGUID: oiWj2MXUSbC32XpF9q1I5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84550271"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84550271"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:44:40 -0700
X-CSE-ConnectionGUID: aMqcelaiSKe9cZxO8oXuPw==
X-CSE-MsgGUID: uyinjfCyTymelUkzT2ve7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="278027986"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:44:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:44:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 22:44:39 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:44:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBJgFQMPkcsm+6jkAtxQB5CPkoYOew8hqS/FDwQ1of13cscFNezpqOdZLFWEhHp2me0q7WCrObwl4fmot4jzpdZ/l2cvPPbDMFmkg+SW30zYnHzky3S6jvhDfgxKFFMV5zVrkQEY2+lAor5iRYd1WxJ5FtzSjvauS2lum82cgLzZMLy3H+joLcii/NDjeQglJeqAPqDuLz0gL3WZwihyBZxoHacuZthKIlQHi+S7bXhm61Ro6Tv9/Bn8NZe6yIHtkntOMHa/F0PXiUzoPOw/xewYeYr97kR08+Xt0JnvV8jEz3XS1K6zc9ZLFRTKmgIYBIwKWTfIygtEERyB6lbJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfM8/Pnl1ry8FrGaxqYEDDBWZD61GaG0LKR138IU3q8=;
 b=pmLREXKVGVnY18rQ9LI2mYLUVyyhgDpWTd9ldNEi8gqSBJzWSxFeeM5sXIjpR9Ex7vYPNOWE1YSiqhLg0IJ4tcuNFsq6D0LvuHLX5P1nBmv0GVreEm7rcPWEP14EXFOz/b44q48zyHZCfLdL0KXcsk+rdvcUouyNJ8+a1sIcJkXUcccgUW6g6rSNRksIF9S0PZvEq55RcjWXLM0JV3/f92t0ZUZ65z8w1x2mdto9ksGb42khOdSrjvw2txIpkiyYxH+dF/Fyeu6GJMhxz/Hf4G/eAKIhI1S2siAV+SJPba+EocwqoIbtIwoXKgbwRlnlDBNYEzKf61K+rgsIQfE2lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SJ1PR11MB6251.namprd11.prod.outlook.com (2603:10b6:a03:458::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Fri, 10 Jul 2026 05:44:33 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 05:44:33 +0000
Message-ID: <78c472df-9b17-4ffa-b829-bf87a8258f2e@intel.com>
Date: Fri, 10 Jul 2026 11:14:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 09/12] tests/intel/kms_fbcon_fbt: find and store
 the crtc index
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
 <20260601204407.39934-10-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260601204407.39934-10-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0231.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::18) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SJ1PR11MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: 878cd165-f366-4aa3-8266-08dede4651e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: tkaG3Ad7pjJZf/M/AnI3mo59zpoxoWuxmwbjwJ8yKdT7QHUcpxrBGr/Bqm70udUnct3lgXNdIVcuU1OOQZbNkbimwNWBJbi9i841pblNL+/Hk4wQYWbS9rxWg79T3W6ymc0wk8WD88W4iAZ5LYnc8Ju0ouZf87j5fEwWyQrAK/YYlqlTpn3dn4qgFRN0WQBpoJNAg8V6gtfiFsIBqqBndiGafiPFP5r8GOBE1NJ50gMlvMK7g5bDAJ/mOQ+G6SAMStXsWKUgS8rIIJR4uZ59dU/BXK7W6/V4LlGMUfMSAwpvFfhThjYOcqY/jLI+oQsSVefH1i7mdUeg9sCVyMGWaDeT6U/f8NKAgRimIrNoHwqRK163NnKJiVOyEA4Ri9I/euxGvQzgnK3Jdlh2c64nK+9OV6G/FA71XxWgiWTqwyoyCLtehlnmXqUNmE8FQWgVBrtx823pbXmr4GGciIze73u3QmVhFl69KzccmIA1KuOmYvjjYoDwfkZANrC/ms2Q2Lkx3VeEzOVtPP8KpqyHotdAdjeHi9DWrqQv5lqodDxgTEbLmgbuyhDJjRMkLFWTjiHqct6y0pndPYn8pPG7hDY5qPrpn31Ps9RvVaqZP3tQd8O/0RkNJQNnW9FMqsRl79YzrAjncLt4NDgULniTeRyeGUA1E2JjSIXRwIyusT0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2w0QVFCRlRZR2J2UU5vU2lhYm5mVHlyMEh0YU5ocFlvSmlJakpCVmdxaE1i?=
 =?utf-8?B?L2E1OWgvdzBoYTlOZ1IwR0tNc25WUzU4cGt6VjdqUW9DU2NFWUxiaGVHeGl5?=
 =?utf-8?B?SUNqcUVqeEJpRnZlZlY5azRPNURrNXhOWWdVVjF5RnpQbFBOZ2ZzNDNpVDJL?=
 =?utf-8?B?anZEbXVsdi8wM1EzVi9rUlVkcnQ0VEdNN3FONnpISVVBYklNaTdPQ1RzRXNk?=
 =?utf-8?B?ZG9oYnZRSTJiYWVMVUJNOS82T1F2djFlUGF3UmVYOER3Tnp4L3hYOGtaN3Zq?=
 =?utf-8?B?U2pjd293Y29tUVlXYTJhakdURGZsNlU0VnZIM3V5bFQyMGR4ZEhCNDNqajRF?=
 =?utf-8?B?dXZMQlR3a2dSTVRpTjE4aC9HNE9McUpUeWtpSXRDakpORFIrQy90cHNJRXJM?=
 =?utf-8?B?MEk4QVJ0UkhXNnd6Z1FyY1MremVjSXA3NE1VUG5Hdi9BUTgwbTllQnZyalZl?=
 =?utf-8?B?dVhlYkRDcGdkK2lRKzRvV0lTbjJNeU85RzhzeEJQNzlyTFFBQStMb3M2U2ZI?=
 =?utf-8?B?ME8vOElnUUx5MVBjY3ZRckFFK3MyMk9ieURhODI2a1d3Wml1dzBjdkplb1RB?=
 =?utf-8?B?U3lqTDJXRk51djF3aVRHZDRUZ3pWeXR2NURSZFVWNXdFTWtzMlBEdmM2Lzcw?=
 =?utf-8?B?UTlUaDlWRzlnMDB6bHhOTGl3eGVlbElMbElORVdhN28yV042VTZoc0RzZ3ZK?=
 =?utf-8?B?OE81UVNGMmJSUmtRUTBpYnpBaERuMmgvcHJqTlVlSzVNMERNUmxqdklCek12?=
 =?utf-8?B?YlNGMnl5bXJTWUJ0OWV4QSsvWG1tNVRLQ0psQTdRUmRlR0Z5MFFTRDVMcTJL?=
 =?utf-8?B?Tjdra1VMODhIdkQxRGlib0RlNXNvSXQ4QUNSUjZLOTVZc3ZWOFpDVkJKU0Vq?=
 =?utf-8?B?WjUwS1JCSDBDZHBtdEMvSmJLME5EK0FNVjFiZUNEdE5qNHZmUVlHZHhxcHJ5?=
 =?utf-8?B?NlV4VUFWYjhQcW9vREk0SkREazNKUGtiUk5ITVBJdi9ZeStTcncwenNldUI1?=
 =?utf-8?B?T2s1Y3o5c2lRMDc4aTJna3VjM21mQ3IvN1dCY29WdEtNeW5JcU5xd2kvajRF?=
 =?utf-8?B?bm45Q0YrN1V3ZS91TTcwblpRSWw3aWFDd3lGdnBFbExod093OTJGMEJIVTZG?=
 =?utf-8?B?Ry9iU3ZnZEJvcGdjQU0zTDZNblIrVnRYWU9McEpDeEZMZlJiN09MMHpyTWo5?=
 =?utf-8?B?UVFPUnNCV1NrZmswUFpZdlhCUHloS05NUnlLQmMya0pQekdQNnlHSEQxb1g3?=
 =?utf-8?B?QTBVbHFPQitkSnZ5c1ZZT0tjVzYrN2RFRlJ0dnkwcnRlZS9qZS96cmdGU2FH?=
 =?utf-8?B?SW9IUE1rNUd6NmNDTXFTYjBPcDFaUFp3dXpId1hzeXhMdVoyS0IwMlJKWFh0?=
 =?utf-8?B?dCsya09NVEZiYUxJczRvZGkwNTVESWEweEduZk53QzVyS1Bzdk0wcHdRcTVY?=
 =?utf-8?B?UGpUanhTQklJVFlWcWRYVEViQUpsZldscDRMVDJGbkJxT3RMRGpqT2s4aHRr?=
 =?utf-8?B?Qmk3b3F4Z3VPeEs0ejM3MGtXSmwzd045T01Gcm0vUkIxTjJUVmdBbDc5Z0FJ?=
 =?utf-8?B?UXkyeDIyMU1YWWpkTWxzRDJqVlBnRENXS3d1WU1mQnArNko0L0Q0NmpDN0RM?=
 =?utf-8?B?ZG5JQW5jTURmc0NGUEdxRHlVdllrdGVGMitzZTNuMk03ZEFkM3RRRVFGK1FX?=
 =?utf-8?B?Vk1XZXFVQ0FKNnI5eGxtbkZTVFBocUlOOWZpSHNsRmZtS2RlYWE2cVZhcXFG?=
 =?utf-8?B?bjRIRUNCNEp6eWZFcUZ6L0NNWlV4NWM4aDhNREVWajlLTDV4dWdQbFN6RVVp?=
 =?utf-8?B?VkwzQ3N0OXVXUFZvcUZRVjVkYXNEWjFwcnl1UVl5clZtQ1lJdU9CR3FGcytr?=
 =?utf-8?B?K2VLQk1GSHlqWkVjWnBocXhrSkplSWhVUklHRjltSjA0bVJLSEREMzJCZ1hW?=
 =?utf-8?B?L3dTWnYza0svZmJ1WlZkSkZ2bWlxamN1b3p3SEVFV0xockNESmVNVXUwWGFQ?=
 =?utf-8?B?ZWkxL2RlWXdidkZSeno4K2o4SFIyRGZFZXhXRm1OOC9LUDRKekZwaGxTTnZI?=
 =?utf-8?B?VTk3YkRVV2l6bDdsVzFlbjVZSWk4WjQ1d3ZRSnlkNmJkMHVMRXY4cThOOEM2?=
 =?utf-8?B?QnBHVlgwdWxCTDVUQ1lBdG1paldWcG9uYmxWaG5LMFFUZmlNaUI1UVBTTXZo?=
 =?utf-8?B?MDRHR05GRjlEaU9oNDd2OVVPemkxL25hWU01WTI2Mjg3NTVYSzRFWUQzVzha?=
 =?utf-8?B?cVAybjZHL2syaUNyeHM5TE9tMWZnNWtoQk5XcGxTRjllWE5QL2tiVzQwWXB5?=
 =?utf-8?B?OStydUZ3bUVFbE9KTjhWYTNrRjFPcW1LaVh6ZWFFWUtBRUsveFRoTjNBZ0No?=
 =?utf-8?Q?aJqs2wEqjVIuRXFo=3D?=
X-Exchange-RoutingPolicyChecked: c/sO6f4AsFDny16lX0oce05l/dbg2KRR7KdS0UX6UBHNiLYZR/84QSFmQOrB51OBjU6s5N9I5SZjII1A+OVGt/FYvhkk2bIF26u4ahB5sgDNud/4Q0+EAmiOTmoLB9gxYMHYi6xkR6kDeepesMLvaeUXuhq4wh842qTLG9o4jMG5KZ59d+udgElKxcVGuF51okqRxthvHTSqOL00K8UUI6REzvoKBKKqcVy/gtWUTNfou+nzqTfHLe8sDNfVsmbsrcSW3A9UdB2FF0RR4NfEM9CPic5nVN2DqFIrad8NAFmBs9ItqoOnQd/oywr0wmG6vGrIGINFOHDczZaapJalZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 878cd165-f366-4aa3-8266-08dede4651e5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 05:44:33.7148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: noYi/SqL1YdFgnLfXG68DsYl7gW6akPq4a7leF55PC+rcf5dvDXt6QSAyf8snsZm/9b9NsXSRPbA2U3DLuKbG8/rLPOchLoo2CG5H3zpplPPcr7RHuCPe4Y3L8d2umz4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6251
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



On 02-06-2026 02:14, Vinod Govindapillai wrote:
> As we need to find the fbc status from crtc debugfs entry, find
> and keep the crtc index from the crtc_id and use it wherever
> required.
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   tests/intel/kms_fbcon_fbt.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index 5863c9e68..96136f8ff 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -68,7 +68,7 @@ IGT_TEST_DESCRIPTION("Test the relationship between fbcon and the frontbuffer "
>   #define MAX_CONNECTORS 32
>   
>   struct drm_info {
> -	int fd, debugfs_fd, crtc_id, devid;
> +	int fd, debugfs_fd, crtc_id, crtc_index, devid;
>   	struct igt_fb fb;
>   	drmModeResPtr res;
>   	drmModeConnectorPtr connectors[MAX_CONNECTORS];
> @@ -149,10 +149,9 @@ static bool fbc_check_cursor_blinking(struct drm_info *drm)
>   	igt_pipe_crc_t *pipe_crc;
>   	igt_crc_t crc[2];
>   	bool ret;
> -	int i, crtc_index;
> +	int i;
>   
> -	crtc_index = kmstest_get_crtc_index_from_id(drm->fd, drm->crtc_id);
> -	pipe_crc = igt_pipe_crc_new(drm->fd, crtc_index, IGT_PIPE_CRC_SOURCE_AUTO);
> +	pipe_crc = igt_pipe_crc_new(drm->fd, drm->crtc_index, IGT_PIPE_CRC_SOURCE_AUTO);
>   
>   	igt_pipe_crc_start(pipe_crc);
>   	igt_pipe_crc_drain(pipe_crc);
> @@ -222,6 +221,7 @@ static void set_mode_for_one_screen(struct drm_info *drm,
>   		      "No connector available\n");
>   
>   	drm->crtc_id = kmstest_find_crtc_for_connector(drm->fd, drm->res, c, 0);
> +	drm->crtc_index = kmstest_get_crtc_index_from_id(drm->fd, drm->crtc_id);
>   
>   	buffer_id = igt_create_fb(drm->fd, mode->hdisplay, mode->vdisplay,
>   				  DRM_FORMAT_XRGB8888,

