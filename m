Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043AFE64007
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 19:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB65D10E036;
	Thu, 21 Nov 2024 19:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XpzU1KD1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D265210E036
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 19:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732216955; x=1763752955;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Hd3Ez4liibzbTUU5HtNAYy3ahlI7LCI0mZqyL44nL5w=;
 b=XpzU1KD10LT1j5e2YmdamLZXZzjP2JZAWM6Yq21Uf3ipfJoFd8ShK5GO
 teVzTD/UHpdNXU/1pQmZr8GxEVlUdDmqBfGyTfHHv5bcXT74fRYU2jnqF
 nX+2oII4pBR7s4zuqpCQNNvDs6Ql2fVOJhzoR4Yl5KmFEYcxBQ5Vf5yYV
 68CKtd14rbyeQkjy7FGN5auf1vij0I29ko7ltWS/RFhreFCf/hvSu84gF
 b7fFHvEiUQaRrPuUK62aiLDOYvV/lHNzUiJcP53c6U5hlf9udwJ3+q6gM
 1ri5/3rLK41Y7KrcB/DkXHJL0F4PjPOe/r4EZ50fZCKiFDNoOPYW7gJlL w==;
X-CSE-ConnectionGUID: ZE1RanGXT6yaOpllwN6q3A==
X-CSE-MsgGUID: WUeOzsphSduFupJ4TeModA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42869556"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="42869556"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 11:22:35 -0800
X-CSE-ConnectionGUID: RxuSpX/0R6OTa2Z9XbTkkQ==
X-CSE-MsgGUID: XOeCwg6OS96h18Xz179Yyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90477647"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 11:22:35 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 11:22:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 11:22:34 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 11:22:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXp4P2PK0qPBJ/d4NPsuG8DnvZl+xZl1+lcoklufOs7dq1y/vdeJ4Mp5/VoIyJpojNEFPOheNFzg3A+sibzp+ek7b4JXK49IeWV3uH0Kuk5PglBZYrfSZAiZiU+aJXgFDZHHmfxkOFTp1xq0cX/c6lA+NAKdsr2IAaRX8flGFts2EM07YInrNteGmuwe5vKPXzM17ooxp73rXYtr/htjv7VV2M6ZHtaKzgGwm8gQtGZJy7cw8RyDrl27CQIMOlFMH7QFp3gvj7JW7oEz0N+xOAN6FVBIBpe7zWNf/q3blJXB1CV2fmVUuyff0+LxrZ0KVhrdh8d722c4IGHTSKVGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88dcUVlOhSXugGPoCoieWNmo7NqH394UKpZMbS55A1w=;
 b=fUVDSZLvcXHL0NzGCipecO0YtNhw7QC6O8VyJDFwtk+PZm3uOvr6QRRcshj6OtTWiZlxFs39HwyQoo9l0oYbbAFvJpK5cx0pZozr8S3om3ADcG4qAxa4ddmeGlB/YzvlPdA7dVCbyR/W6vnr4uHvV05lLj4bKhcxkSEboM+1esb8u3x/idCrOK1MhsivldOrvmQYOYh1+gEfzHv/7JDQi+yPbHKDdPWyavis52EpsKDs58WSnOWp/W69QDU+K2ZXeUT+H+vA9lZHB1v3zCxnTPDOjqiJLtxtFdzs+ht4g6nmbhocpc/Q5yPRjnioXSOZ84UpDFUGMLaqDiJtYVntLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB8197.namprd11.prod.outlook.com (2603:10b6:208:446::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Thu, 21 Nov
 2024 19:22:31 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 19:22:31 +0000
Message-ID: <a20c9975-7dca-4ce5-a0a2-fc9d91058fb8@intel.com>
Date: Fri, 22 Nov 2024 00:52:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/kms_frontbuffer_tracking: Fix testplan
 documentation
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>
References: <20241118083624.1936758-1-bhanuprakash.modem@intel.com>
 <20241118124348.ku4azqvdjt7ywbnp@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241118124348.ku4azqvdjt7ywbnp@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::9) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 67572c78-ae23-4bde-116b-08dd0a61d802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzFmRVl6dmZFVUVGRTROVkN4SzN6dlIxN1ZUSVpWTFNUOG9oUGN1UHNFaHIz?=
 =?utf-8?B?dDNjMHgyZDJIYW0yUWRpam1BYWZDcVlCLzUzZXJ1b2ozS0hwQzB3a1NWY3p5?=
 =?utf-8?B?RmovN2o4T05qeTJvdnozeXl5eUdjNW4rU1BKa3ZDMjY3a3MzNGNRT3VmV1d2?=
 =?utf-8?B?dlRPQ1RBUE52OTlYTXNWclp2TTdWMGIvMWk1MVZkV1Z0QkNucFVaTlBWYjJ1?=
 =?utf-8?B?bE5XRDVjRHdCYzBKSWlJR25KeGlEdVYwYms5dit0RG96b3RIelFhak9xVWUr?=
 =?utf-8?B?cmhQZTJScVh3SkhlVnlzWXIzemRESTY1Z3Y2V3d6MlBPV2JiUGhDVm5PeS9a?=
 =?utf-8?B?MGhNZ0Rva0QySXpUT25HVE1SV3pVSUY1eGx6akdVdTE3c2phc2t3dDdkcHBj?=
 =?utf-8?B?VmxkU1hkYXAzbXprWXlXZUUzY2xwT2w0WHQ0RE9KenAyNSt6UFhDd2s0OGV0?=
 =?utf-8?B?QUtKZ0FjRkl5K204Z0JOSGlrTjJONURVdGY5WjN1b3FMSkNtTHZPZEgxb1g1?=
 =?utf-8?B?KzFweWJZbFRtY2hBTzVBODNGcEk5U0FkN2JIYms0VTFhaGtjZUcvKysrRzVx?=
 =?utf-8?B?OVRxQ1E0eVZ6OUJ0eDRoTVhkWlRrSktWMmxGUmE1dEZXd0dxM0F5dWN5Mm1j?=
 =?utf-8?B?dzRIZU42SGRVRmZkYWRzRkNrMzNCa2V5TG9lT3hHWlF2a3dKOHcraU5oeit3?=
 =?utf-8?B?S0RJZkJtOG1rUUt1S1ZMQ1FuZTNJY2U0TUNXSWRLTW1NWFMrTk16cEg1RDJw?=
 =?utf-8?B?SFVIVWd4WUwxbFEzZVRPbVNjQnArQmVVblhyQm9TZEJYME9VdjVNV2Z5M3hC?=
 =?utf-8?B?SUVma1pwZlZLNkdDWXU3WXZUaVhVOGpRT2tyd2lxV3dIblBnaE1qM1dVM0xh?=
 =?utf-8?B?eHFSTTJScXlGU3AyOHhBN0NtSFpsRDIvN2syaUJycEsrS0lZTEJpMVBSdGxM?=
 =?utf-8?B?Uk14Q2N1azNUWFg5a2dwMVZ0eHhDeDF2TDRXcTcvekd3Vy9ZTmFJR05CYWxk?=
 =?utf-8?B?eUVlNFAyem1HemtTRE5LL3JYTDhvVmdsOEpqRi8vQkJsY0ZoL2NnUWJpM0Q1?=
 =?utf-8?B?YllsNGJ1ZVcxeFpna2xDMGk2YlFFZnhlUzY3Tm9qSkRQTFp5V0FzUEoxTmJx?=
 =?utf-8?B?V1ZZSWU0ajAwMWFWcVp3Szc3aXVIWUlHSEZRYmsrcThib1NseHpmRWtaazZq?=
 =?utf-8?B?V1VLTzhxeTRMa3JkWDJSVmk5dnNNYVcwR2NOanNmcExreWx1MmNpMWNYWS9m?=
 =?utf-8?B?OTlFNjRScFhLSDZ2c0FmaG04ZmduTFlhd2hxTzB3d2s3VDlGcHpnZC9rQWVG?=
 =?utf-8?B?cjFneTJFZzgwSG04bmEzN3l5cktIZWVhSlNiREVkNHF0c25Za282ZW5hbVBM?=
 =?utf-8?B?ckJRU2FaeEVwNDZhSUFycVhOQ3hZSmpUdmdKZEo1Ym8yY0ZicXdIN09RZEsz?=
 =?utf-8?B?aGYvdDcydGVjWVM3ZDNIV1gvT1RwekFHZlFYZitndWhETVZUNWFIQlZWRlU0?=
 =?utf-8?B?SVN5bjFHenowSGROeTNuanFCcDg2L0VmWmJieE1IU3BaQXVBbmMvRzFNbVZY?=
 =?utf-8?B?REVFQnFMcW5SZEZQVStUMHpSL0lobWY4SVRSMklUODRnUExsRnN3TDYwWWZN?=
 =?utf-8?B?Y0VHSlE1QXVzRUhNMy9mVWFjTVFCSC9HYVdwbWRxRTI5NXc0ZjVMams1QnpB?=
 =?utf-8?B?SUNEQy8vSlFZOHBNUjhMMU9Cdmh4YURidlRLU003b3FEaDltVXBEeFlqY2ZC?=
 =?utf-8?Q?9fSv0uzeuq4yIjy3yCXFr1BdLRoqnkAC8BlAoFA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OStmM08zSGx5d014aFhObllRUmxuSDN5RmRrbjJsdk8yZ2JqQnNFVHBUeVVU?=
 =?utf-8?B?SXg0YXNhUDFWdlJ6MDVscHhZYzJSdjgrWmxOcW5VZU02ZTNhZUFaanFJWEZ5?=
 =?utf-8?B?RWp5aWIvQ21Ja2hzZkhEZXcxSDdPSnJNSjh5M3pReGo1Ym9hRStaQ2lTdUpz?=
 =?utf-8?B?UFU4YTZKL3VhWkZXWG56UmR3cmY2RVFNYWRGaUI4MkE5UG9CTkN4NXFva3JF?=
 =?utf-8?B?NjRHOFUvK1VhQXRhY3FCMUp2cmdRSjhUK3Q0eDJTNmEvZHBCTlBNdXl0WmZP?=
 =?utf-8?B?NCtlZUFzeDAzOG9HMEZJc3N4Z0lraHRMVzVQWU9Mcm5rbThrczFrc1VsS3Rh?=
 =?utf-8?B?a2NrQ2dvMXNYSytOc1A1a1BFUDFmRHhtVHdGZ0RQQUp1WnVpUVBJa0xJUUNz?=
 =?utf-8?B?cXZMZGVDVHRYY1FUM2lwNUVBb1gvWjZBRlJkZ0MyMWNPaDYxMG5oTFJSYU9O?=
 =?utf-8?B?dG03WGN1dXRqazV2Qy90RGJLenRwUjBPVlJtcFZkK2xHMXNpVnhrczhCUXRG?=
 =?utf-8?B?NFV0dTNhL3p4ckxILy8zeUJRTlc4bEp0UklCL0plUjdzMndia015VDRFSkRU?=
 =?utf-8?B?d0pPd0ZWWFpaSGdNc1dDTU1xSTRsYVVya2hkYjdWOWJsbFJDendQc2lEdENG?=
 =?utf-8?B?OU9aMThKY1VRMFRiSEx1S3JJaE80T3QwOEV1cmVYVWlISzQrWk9yajh6MC8v?=
 =?utf-8?B?d0ZTbmtNanN4aExHbWtIQnRZR3VlbXVwWDhueWFlYlIrNlV0RUNtZjNtMFJG?=
 =?utf-8?B?dkJSS1FPWi81TlB3SXBjUzlyd1JUeUNwSFlUd3pWOWJ0VXdQd213akY5S1JO?=
 =?utf-8?B?Ny90bXlUR3BjL3p5SmNFeG9kVWRoNXA1cEhrVmFLVkRyeHNwWmh1ZnZxRUl2?=
 =?utf-8?B?M3hoOHl3cG1rMjNSYUdJb0FmT0xZazJ6WHdKelFSVnNJNkQvcjBoMFFMcVBt?=
 =?utf-8?B?cENlRWViL21Rc2FPVk1vbG1PU1ZwVUIyTnVUN0JTcnZVVFM0MWY4bHRjQXc1?=
 =?utf-8?B?QVAvdXNMclFZbXJxUWt2c3h0YlhWMWlEYmpQQ0FpNGEvUWdDSTJQdHB0VUI4?=
 =?utf-8?B?VUt1Wnc3UzFEWTZYMVpXVmxBL0FEVnpOa0ZjMjhUZWpJSGorNUp0aElPamx1?=
 =?utf-8?B?aVVlbUVQYUxQNFFKSzdVZVNObkkzSVI3ck1oVjJZUnczdGpGRTdXNDI0dTky?=
 =?utf-8?B?UHRZb0owSlY1a2xhalgyRnZ5YTR6SCtzV2xGZWlCajc1VFhQeThNTE1pQWVl?=
 =?utf-8?B?RHNoOHZ3UTBzeEl5TEtlLzQ1cUNwQU9Gd0M2bkFnSFZCL0hZa0hKU1I0RktC?=
 =?utf-8?B?aTVmSC9WcHc5alJqdEZlY3EyMTJGejlLR2NqdDlpL0xjY2ZONVRrVmtYSjRM?=
 =?utf-8?B?QmdhSUtFVW16MkZUV09meXB1SnA3S1B0Qk41L2ZhMktlYk9QWDJpakc4RWc4?=
 =?utf-8?B?Vlc2amVadnVpVGtzVGsrd3dBREh1Wit3UG1ZUE5VVE5keXhEQXdZbGFmWEti?=
 =?utf-8?B?b3lubmJYMVc4bjc4Y1I4SlYwZVVUNkNSZVI2dXYwMnhZdEF6dC9RbHhQQjZZ?=
 =?utf-8?B?M0JnN1pKcTFUd1duUy9BL0VyU0cvdGsrYTZRZjc1a2lqUWltUGxyNm5vMml1?=
 =?utf-8?B?UU5UZnN3T1ppSmhJalhIRkRaWXRwelhwSlN4Tzk5aFQ3ZmNsalRqT1ExRzdy?=
 =?utf-8?B?akV2VTZMYmgrYzc1SHVnSmxoaXU2aktwNDNxcXVYRTI5bXlzUVlUMVN4eGZ1?=
 =?utf-8?B?TUJiR25kOFc3YldxblFsdi8wWnZxbFl1dXFFcDFiZUNwVWhsb0NId0N0WTFE?=
 =?utf-8?B?M3d2NjlzbUd2V29TZC9wWi9Qb1pMUHFmSkZMVTh6NVBFeWZVazRBeDBzcDM4?=
 =?utf-8?B?UngxS1hwa0dkdHdMVzVmTzFBbXdKN21YVFlhNURDdDBIa3dCdC8yRjdBVE5X?=
 =?utf-8?B?ckpoWW5hODJJTjhBZDNQYTBaN2puK2VncFZZYUhTQXk1WEdLTEJoNXZHY21I?=
 =?utf-8?B?dGFEU05GcHNMT2Y4bnMrM1pRSVdFTVEybmJld0I3blJRVjZtdWt2TkwvYXpC?=
 =?utf-8?B?cHRwdWZGRktjTDQ2SmVGQTkyWGY0YW5kbEc1VVQ1L3UvcVdJTzJhMzhvcCtU?=
 =?utf-8?B?b1RKaVB0WjdQN2VYYzg0SWRrdTdscmJ1OGNMYmRmRGpiTzczQk5EcTRBSWt5?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67572c78-ae23-4bde-116b-08dd0a61d802
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 19:22:31.1836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcm5Nz9Oh+BsPK8Q5VKA910+obmjwCJp81nJly0VJ81tdasi5urP0GEv/5062z7+A16JSEao3mI4GUe7gfpdBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8197
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 18-11-2024 06:13 pm, Kamil Konieczny wrote:
> Hi Bhanuprakash,
> On 2024-11-18 at 14:06:24 +0530, Bhanuprakash Modem wrote:
>> Fix the testplan documentaion for i915 specific tests.
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
>> ---
>>   tests/intel/kms_frontbuffer_tracking.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
>> index b7e3f7379..f149be3da 100644
>> --- a/tests/intel/kms_frontbuffer_tracking.c
>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>> @@ -763,18 +763,22 @@
>>   /**
>>    * SUBTEST: fbc-%dp-%s-fliptrack-mmap-gtt
>>    * Description: Check if the hardware tracking works after page flips
>> + * Driver requirement: i915
>>    * Functionality: fbc, fbt, kms_core
>>    *
>>    * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
>>    * Description: Check if the hardware tracking works after page flips
>> + * Driver requirement: i915
>>    * Functionality: drrs, fbc, fbt, kms_core
>>    *
>>    * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
>>    * Description: Check if the hardware tracking works after page flips
>> + * Driver requirement: i915
>>    * Functionality: fbc, fbt, kms_core, psr1
>>    *
>>    * SUBTEST: fbcpsrdrrs-%dp-%s-fliptrack-mmap-gtt
>>    * Description: Check if the hardware tracking works after page flips
>> + * Driver requirement: i915
>>    * Functionality: drrs, fbc, fbt, kms_core, psr1
>>    *
>>    * arg[1].values:   1, 2
>> -- 
>> 2.43.0
>>
