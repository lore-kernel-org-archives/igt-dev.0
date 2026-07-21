Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A76C4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 03:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E8C10E286;
	Tue, 21 Jul 2026 03:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5JQIFr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C3F10E27E
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 03:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784603664; x=1816139664;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p6YA4OyV/IgJpRcrffVo3vLmI8IB/CMtSC1Bh/v7xTo=;
 b=V5JQIFr7bPkjYK8Qxwyw0WDfyCby1IiK8JE696xGJ9KP/Er7VGrB75EZ
 38tUkIysHj/RwqN5khmFLw+lgJn+FFLjVI70IerFtkiKgW/8bgEiBoMT0
 +XJ9qzXEr3KNYFWF3eiZOV9djWtQ4rrQfHKRRS699DlMFeqDHyMX44mSS
 EgksHQEu3hIgWl4dFs3hmudNXkAIYpD3UTcdXeZlw4OVSc50eI5WpZOi2
 q/cqD4Ci7cvKhy2+L4UD5UUxlCToE96HfUYo02zC7cufhirO9IUgoXfdL
 ofP/VlSJnj3qDLU8p2j84dRPqUhr7QOuUxMrtM/O+LjMSES5LImgNVYZ7 A==;
X-CSE-ConnectionGUID: bU5iJM//SKalLOdtn/8A5g==
X-CSE-MsgGUID: 08Qw9pwTRjKB7m7ZtCDbGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="96326907"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="96326907"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 20:14:24 -0700
X-CSE-ConnectionGUID: 5edIGJ7xRfi4ikVHBXINmg==
X-CSE-MsgGUID: hkSB7c88RzWmmXCCCHERAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="295845100"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 20:14:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 20:14:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 20:14:23 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 20:14:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmAkAOfW25TyLuTYHoFCgjBbPrr2JcVt+yevURcLckC5DQUAwAXVrnrakfxr9yRcwOuAHpJcQbRqvLRblpC8S6Am4dLTsJp0SGISwTRB0OcPj4wurzSFMNSFuhFvtwkFTBuDa8UhkBQ0Ff7BEvSNsVTp/DSEjO1MJjWmNJxTANoSBMOCCUoa8JJfrxY9w4mve3J4IR0UyONF/BVpBGWa0dTikXi9WO0Son/og7erC/9ZKWRnXux738k9RcHno6Rbq4PNZzzC7TKjBSaqHaQLmnPBFTVK80s4me5Tfbb91XW7fZJ8M5lRCpTqTPVINdSOIa/0NjF7pD24489FsAWBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/cucKBVk8UATNZuOOZJmcUXfZ+fXwEmdWYhSz9M1dI=;
 b=B1FppoS7CJ3rA+blVzMlrPZ9mHzS8UnIPzctC2jUUnKNWDidIs1Ou2ZfcyN4YP+CiUChDpDzZbdiVgDaD26Bv0545+VmomagkmwGWWL4A5GHuRaI0fd8W2kNxMBEi76M6+mji89K8k/bfw9z+6IwmGOuNHw9Zy078fE1b5rXz+UbuIx0/RbrJhEIZjHdX4UzlAf1rkv3fycg6WzFTDjTv2BCO/uUrqUIFp8ceZzOxjj1ai90f2ltRLsiWN7Rbbx6w/TmlnFt7Edr3rAcEv/DWpeK/5ION8t3hu93CbHaYWnpo7jQMgTgKUBcNxo7YHA550HyRmIR6swNtyeGxWXzBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by LV3PR11MB8693.namprd11.prod.outlook.com (2603:10b6:408:215::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 03:14:15 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 03:14:14 +0000
Message-ID: <6b3f89ec-4ca1-4fe4-9ffb-7bf148768d42@intel.com>
Date: Tue, 21 Jul 2026 08:44:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tools/xe-perf-recorder: Add mmio-trigger support
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20260716071432.1330022-1-shekhar.chauhan@intel.com>
 <87zezlrxbd.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <87zezlrxbd.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0268.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::17) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|LV3PR11MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: bbea7884-736a-4963-25ed-08dee6d624ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|3023799007|6133799003|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: M+fUo1h4f4LpmqbhZlEAYwi0lKj+vOkSbOSrP2GxX2lIHjxVMqALKrvcRodZzdfv9TlbwNXm723eKdkFSO4rDbs7L+bMel9jChc+wrSeYhNCTsQh4z8bgbVVjYaJ+VvVod617T3c++wmyr6oIugUVivxCh/W//GrbxMyGK1HdHZYaRxYEg53vSIUCGZTdVI6iM3RGsBwwtJ01HPswgX24YMgMjdUwUv9MnLWSq4WMtaGx9D6vDd0qISxi+R7B2HMseEBmHrmzubxn+I2YqpAB30z9dwwhjZ+TFn2UWyeLRMDVi7GIylh+A9VWTVtxdsWfSn0Rupt14t9oo/ORVOSMo48MCXJyJrIFOLYBAkdNxQwgGNyVDFfTWzzhjtaxPWiAqMM9GsysYjr8SRIswwT6G3lfEV3+29fSlToTsniHLjk07RVyUI+cKry2ahb333e5idmDgkg576AYPOEjiNl2nWKZTYhxuAxThLLTSzkceAEBNzlmGj2D/OG9XlfVuRiclu1fZudT0lNjltndXzzCWBEYPYjBVG87RemhKFk4FzWJm8/72JOjOsj1fWc6LdB5rwZbHcrpV/lweDSOT69krnv4qgkynTTWHwNsbL7VLj8XsLkMg/sllOY1EXNYe+a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(3023799007)(6133799003)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2xhR0YwaEFGKytBWlpBWjRnMXlBZUpZS3ROakliMjNxRlBMd1dKWmYxT3I0?=
 =?utf-8?B?c2V2THgrRlFDUG5sNkJ1a1poS0x1ek0zR1drWWZzM3lUZHZTNzdlYkVaQmt4?=
 =?utf-8?B?WGhGQU5RTldpbDhPdHFrVmFnZ1pPYjlzNkU1U2RKa2Iva1g3bVdSVmExRUZG?=
 =?utf-8?B?K3kxeEx2MWhzWkV5bGFscFlZREF5QXY4WjNFTUxmelZGbjJjZEFUbFMrUXh3?=
 =?utf-8?B?cmx2NEJzK1pZZ0FyMFhvU3dKbEIyclY2dlk1dFNoREpmOWkzWW53NUphOXF1?=
 =?utf-8?B?NHlyemdESFlkQmNZRitESlNLL05ZZEYxT0xFeUNvZktHN1lhU044dU9GRUVU?=
 =?utf-8?B?MXF0S05LcW00UlRVMlRPSlJTK1ZYS3ZFZWFWclBYbm5UMHU3WVNMcXJpSDBv?=
 =?utf-8?B?UDJrWXhuZUtBYzI1dWhKdWtwRUxaU1VVeHRXOHROeFFlTjRadTd0eGhkRzM2?=
 =?utf-8?B?azF0KzhGV3BsUXNUUks1dlY5dm00RW9ubUdYREZwS1pzOFlVNUo4VmVvamhj?=
 =?utf-8?B?aXhtTlg5OVdSTnpVdkk1V3NZMnc1YzlyMkREdm04S1RaZGtwaC9RS3F3d0hu?=
 =?utf-8?B?enUySzVNQWJTMGhkNk5wLy8yMTBneGlpTWp5WmVjeXI5VVZNcmNvc1UrL0Vl?=
 =?utf-8?B?c2NjNWlBNlJSZUZCeEZYajVUTXQyL3RJemg1ZFpSa2RnUmpyWTc2L2FEWE1I?=
 =?utf-8?B?UlhNSzUraXNVOTRjT20xd0JGMFdwR296eERBamVscXJsTUlPaFBYYnNBYjln?=
 =?utf-8?B?dEpOQXhOK1Z0amtxS2RwSDBnTjV2Ky9XOWJ0dlk2d284TmV4NjJFemJhaXJv?=
 =?utf-8?B?Vjl1S1VEQ2RWak9vNFhJVXVSRkhCeUtTc1QzR2czVFpEbnkwSENBYVAzQUlW?=
 =?utf-8?B?dzFlbWplTjVDbjdSU2xCSHZ1UURzTEl4RXhxWXFMVVZTRXorZVgvZVo1ZzAw?=
 =?utf-8?B?WGFGb2tZZGdNVWtwNG1RTG5xSlBsR1gyN3dTMDBpR0FWYnh5L1Zpb0RqK2VJ?=
 =?utf-8?B?VGNKWTM1cnFwalBnZWNMeXVlZEdpTFhhTS9CL3ZwRitVLzlXQVFFVi90TzU5?=
 =?utf-8?B?cEVwcmFiRjVqcFVpRUxVNjM4M0wvMVl5Mm9xZ3NjS2pCamZTYUFXb2dFdnp1?=
 =?utf-8?B?M3AwVXFjL2ptMU16OGNlMTlscXl3Y0RXbnp1Y3BhS3pwZHdXYkpqS21nMitK?=
 =?utf-8?B?OTZXTkhpa2pWKzRjeDZscWNkRVpmdkw2WGVqOHRJTjJGQnVCNlFOMnhuUkFJ?=
 =?utf-8?B?cVE4YUxIV2VKd0k1NlpOeFE0NEJEUGdNbGJTbW9aVVdBaWlCYTFYVjg2Zmxm?=
 =?utf-8?B?d0NlTFV5ZDJiM1VtaHY1MkJjRjlURENyT0djdnRIUnR5c0RBdld6dkFIaW5w?=
 =?utf-8?B?Rzc0Sm5YdkkxZzFlL2ZmdHp4ODFkR3BmSmFRUnpDa1NOMGlpNTBRYnFCNEp1?=
 =?utf-8?B?U1poQWhDQVFVOEI2TUtpNFhJWDVxVndEYUdoZTI4eWZLd01yNkQrL3JYZ2FH?=
 =?utf-8?B?bFI0eTVoN2lFUmUyblpNTU1JcGcyMTBwLzg5eVUybEphaWpWNTJjM010LzFt?=
 =?utf-8?B?OStHd2FVSGxHbDdzTkZOZWc2K0pSeEZHaXdpUDBxQmNhK05YaDRoQzM2YS9H?=
 =?utf-8?B?MEU0czJJeVljM2ppemFwZmhMNFM3SGRpZnpZMUZncTY4NnVzeDdBd2VOaEtn?=
 =?utf-8?B?ckZpQTRpVlhwczUvN3N3b21heFhtSVRwQkhJY0tOZmlGMnpFWDVYL2RTNnJO?=
 =?utf-8?B?Z0VOdU1OTkZsU2dVMlBjT2xDbmYwUXd5aTNnQVZlekRpWTFKRUlOaFJGV0lR?=
 =?utf-8?B?cHM5UEQ0VWFSTkM1NUZDamkvM2JwZ1RLMG85VitMWVZ1NHZhaldsd1pMcUd0?=
 =?utf-8?B?Y3pNSU9sQVB2OTFENHZEWlhtT2hValU3aERNekFoS0xyZFQvUTBCZ1VpblZU?=
 =?utf-8?B?azM0M0lydU5sdWhrMmhVQnhxQ0xZOEdXOHJtS09RVmJsNWhUbVlmYUlQNWlm?=
 =?utf-8?B?Y0xFbE5CTXhabzAzY1V6L1RlZGRkMitBOTVYWmhDNU9wS1NnMlA2Rm5MWHIy?=
 =?utf-8?B?WjE5eG5oUUNSL2l3MHl6dTVZaElnS21MNlBURktVMlRzTmV3S1ExOU1BOVNL?=
 =?utf-8?B?M01qUTJyK1ZZQzR3SkMrSFJaWTU4eDBKMDhiZS9ta09MUXV3QkxpUnZpOHhJ?=
 =?utf-8?B?akIvNjZzbWdZdGcxZmd6WmpBZCtndEpMQy9GMzZKUWdBMTM4c2lYYTNPMWZ2?=
 =?utf-8?B?aGQwK0ZxdnlwVlpKK2UvdlExY05EUUZDdS9aUXNFZHVJcmF0eEp1Y3ErVXF2?=
 =?utf-8?B?bC9CRGdHTGNMSElYSkxLMy85cGJKaW1FaXNQZ3Fja3BjMk5rOVRBRjh6cHBn?=
 =?utf-8?Q?W5vtnN0mfBFA54sw=3D?=
X-Exchange-RoutingPolicyChecked: cxeW/Pyt2f3yr6+Hw9tDj+xlN2ViKwNLInAYQcGrjk6eQaAv/F61eCkPNadsaejuoTM3lYHdc1YJzxU6Z0YJeN7LMdkeZQB2v5Pt8BRUVwGnOTmuO6BXKX5u/Jcl/zI7I7gjwwNLsXd9ABce2HuPVhwaWNwgLxDhEvxJGANKXAVhvh5xuxJvbNLk1bSx4glaH8ciZIylzIdoKyXaIOAszVrwvvZModMicWpdzGiWBGe6Rc49q09qp/DA5HGA4sH7YCgz977hjt/QwXN/tC749uwgC9/gAlsnno8Frupl2gRQdIsFsvbB5UGwjWsIbzttjf9Gr0m7SAv883kvk7n15Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: bbea7884-736a-4963-25ed-08dee6d624ae
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 03:14:14.7690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5QQUagSesPNB8L9Gq1lbUGYqq3hJea8wdxHvPTc/RDLc8clJSA9cHHr0DltQlnVjK1asduAYMcm6oEQk9BeavjluATyT7WkbcaFzfi1Qck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8693
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


On 7/21/2026 6:08, Dixit, Ashutosh wrote:
> On Thu, 16 Jul 2026 00:14:32 -0700, Shekhar Chauhan wrote:
> Almost there, just a few remaining nit's.
>
>
>> Add mmio-trigger support to xe-perf-recorder, to justify the
>> whitelisting of OA MMIO Trigger Registers in XeKMD.
>>
>> v2: Add all OA unit types, fix includes, compile warnings and adding
>> extra triggger for file mode. (Ashutosh)
>> v3: Add a couple of asserts and commits. (Ashutosh)
> Incidentally, the subject line for your IGT patches should be '[PATCH i-g-t
> v3]' not [PATCH v3]. This can be configured in your .git/config:
>
> [format]
> 	subjectprefix = PATCH i-g-t
>
>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>> ---
>>   tools/xe-perf/xe_perf_recorder.c | 119 ++++++++++++++++++++++++++++++-
>>   1 file changed, 117 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
>> index f200fe9c9..7e7df9bca 100644
>> --- a/tools/xe-perf/xe_perf_recorder.c
>> +++ b/tools/xe-perf/xe_perf_recorder.c
>> @@ -26,19 +26,29 @@
>>   #include <unistd.h>
>>
>>   #include "igt_core.h"
>> +#include "intel_batchbuffer.h"
>>   #include "intel_chipset.h"
>> +#include "intel_reg.h"
> Looks like this is not needed, can you check.
>
>>   #include "ioctl_wrappers.h"
>>   #include "linux_scaffold.h"
>> +#include "xe/xe_ioctl.h"
>>   #include "xe/xe_oa.h"
>>   #include "xe/xe_oa_data.h"
>>   #include "xe/xe_query.h"
>>
>>   #include "xe_perf_recorder_commands.h"
>>
>> -#define ALIGN(v, a) (((v) + (a)-1) & ~((a)-1))
>> -#define ARRAY_SIZE(arr) (sizeof(arr)/sizeof((arr)[0]))
>>   #define MAX(a,b) ((a) > (b) ? (a) : (b))
>>   #define MIN(a,b) ((a) < (b) ? (a) : (b))
>> +#define OAG_MMIOTRIGGER 0xdb1c
>> +#define OAMERT_MMIOTRIGGER 0x1453cc
>> +#define OAM_MMIOTRIGGER_OFFSET 0x1d0
>> +#define MEDIA_GT_GSI_OFFSET 0x380000
>> +#define XE_OAM_SAG_BASE_ADJ (MEDIA_GT_GSI_OFFSET + 0x13000)
>> +#define XE_OAM_SCMI_0_BASE_ADJ (MEDIA_GT_GSI_OFFSET + 0x14000)
>> +#define XE_OAM_SCMI_1_BASE_ADJ (MEDIA_GT_GSI_OFFSET + 0x14800)
>> +#define OAREPORT_REASON_MASK 0x3f
>> +#define OAREPORT_REASON_SHIFT 19
>>
>>   struct circular_buffer {
>> 	char   *data;
>> @@ -354,8 +364,50 @@ struct recording_context {
>> 	int oa_unit_id;
>> 	struct drm_xe_oa_unit *oa_unit;
>> 	struct drm_xe_engine_class_instance *hwe;
>> +
>> +	uint32_t vm;
>> +	uint32_t exec_queue;
>> +	struct intel_bb *ibb;
>>   };
>>
>> +static uint32_t oa_unit_mmio_trigger_reg(struct recording_context *ctx)
>> +{
>> +	const struct drm_xe_oa_unit *oau = ctx->oa_unit;
>> +
>> +	switch (oau->oa_unit_type) {
>> +	case DRM_XE_OA_UNIT_TYPE_OAM: {
>> +		struct drm_xe_query_oa_units *qoa = xe_oa_units(ctx->drm_fd);
>> +		uint8_t *poau = (uint8_t *)&qoa->oa_units[0];
>> +		int first_oam_id = -1;
>> +
>> +		/* Find the first OAM unit, as in oa_unit_by_type() */
>> +		for (int i = 0; i < qoa->num_oa_units; i++) {
>> +			struct drm_xe_oa_unit *u = (struct drm_xe_oa_unit *)poau;
>> +
>> +			if (u->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM) {
>> +				first_oam_id = u->oa_unit_id;
>> +				break;
>> +			}
>> +			poau += sizeof(*u) + u->num_engines * sizeof(u->eci[0]);
>> +		}
>> +
>> +		assert(first_oam_id != -1);
>> +
>> +		if (oau->oa_unit_id == first_oam_id)
>> +			return XE_OAM_SCMI_0_BASE_ADJ + OAM_MMIOTRIGGER_OFFSET;
>> +		return XE_OAM_SCMI_1_BASE_ADJ + OAM_MMIOTRIGGER_OFFSET;
>> +	}
>> +	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
>> +		return XE_OAM_SAG_BASE_ADJ + OAM_MMIOTRIGGER_OFFSET;
>> +	case DRM_XE_OA_UNIT_TYPE_MERT:
>> +		return OAMERT_MMIOTRIGGER;
>> +	case DRM_XE_OA_UNIT_TYPE_OAG:
>> +		return OAG_MMIOTRIGGER;
>> +	default:
>> +		assert(0);
>> +	}
>> +}
>> +
>>   static void set_fd_flags(int fd, int flags)
>>   {
>> 	int old = fcntl(fd, F_GETFL, 0);
>> @@ -569,6 +621,28 @@ static bool write_stream_status(struct recording_context *ctx, FILE *output)
>> 	return true;
>>   }
>>
>> +static uint32_t
>> +report_reason(const uint32_t *report)
>> +{
>> +	return (report[0] >> OAREPORT_REASON_SHIFT) & OAREPORT_REASON_MASK;
>> +}
>> +
>> +static void
>> +check_mmio_trigger_report(struct recording_context *ctx, const void *report)
>> +{
>> +	const struct xe_oa_format *fmt = &oa_formats[ctx->metric_set->perf_oa_format];
>> +	const uint32_t *report_32 = report;
>> +	uint64_t value;
>> +
>> +	if (report_reason(report_32))
>> +		return;
>> +
>> +	value = (fmt->header == HDR_64_BIT) ? ((const uint64_t *)report)[2] : report_32[2];
>> +
>> +	if (value == 0xc0ffee01 || value == 0xc0ffee02)
>> +		fprintf(stdout, "Received trigger report with value 0x%" PRIx64 "\n", value);
>> +}
>> +
>>   static bool write_stream_data(struct recording_context *ctx,
>> 			      char *data, ssize_t size, FILE *output)
>>   {
>> @@ -582,6 +656,8 @@ static bool write_stream_data(struct recording_context *ctx,
>> 			.size = sizeof(header) + format_size,
>> 		};
>>
>> +		check_mmio_trigger_report(ctx, data + i * format_size);
>> +
> I just sent this patch fixing what seems to me to be a previously existing
> bug:
>
> 	https://patchwork.freedesktop.org/series/170781/
>
> Please review this patch and change your patch accordingly (assuming the
> above bug-fix is applied before your patch).
>
>
>> 		if (fwrite(&header, sizeof(header), 1, output) != 1)
>> 			return false;
>>
>> @@ -697,6 +773,22 @@ write_correlation_timestamps(struct recording_context *ctx, FILE *output)
>> 	return write_saved_correlation_timestamps(output, &corr);
>>   }
>>
>> +static void emit_mmio_triggered_report(struct intel_bb *ibb, uint32_t reg, uint32_t value)
>> +{
>> +	intel_bb_out(ibb, MI_LOAD_REGISTER_IMM(1));
>> +	intel_bb_out(ibb, reg);
>> +	intel_bb_out(ibb, value);
>> +}
>> +
>> +static void emit_oa_trigger(struct recording_context *ctx, uint32_t value)
>> +{
>> +	emit_mmio_triggered_report(ctx->ibb, oa_unit_mmio_trigger_reg(ctx), value);
>> +
>> +	intel_bb_flush_render(ctx->ibb);
>> +	intel_bb_sync(ctx->ibb);
>> +	intel_bb_reset(ctx->ibb, false);
>> +}
>> +
>>   static void
>>   read_command_file(struct recording_context *ctx)
>>   {
>> @@ -712,6 +804,9 @@ read_command_file(struct recording_context *ctx)
>> 		uint8_t *dump = malloc(len);
>> 		FILE *file;
>>
>> +		emit_oa_trigger(ctx, 0xc0ffee02);
>> +		write_perf_data(ctx->output_stream, ctx);
>> +
>> 		while (offset < len &&
>> 		       ((ret = read(ctx->command_fifo_fd,
>> 				    (void *) dump + offset, len - offset)) > 0
>> @@ -835,6 +930,13 @@ usage(const char *name)
>>   static void
>>   teardown_recording_context(struct recording_context *ctx)
>>   {
>> +	if (ctx->ibb)
>> +		intel_bb_destroy(ctx->ibb);
>> +	if (ctx->exec_queue)
>> +		xe_exec_queue_destroy(ctx->drm_fd, ctx->exec_queue);
>> +	if (ctx->vm)
>> +		xe_vm_destroy(ctx->drm_fd, ctx->vm);
>> +
>> 	if (ctx->topology)
>> 		free(ctx->topology);
>>
>> @@ -912,6 +1014,14 @@ static int assign_oa_unit(int fd, struct recording_context *ctx)
>> 	return -1;
>>   }
>>
>> +static void init_trigger_ctx(struct recording_context *ctx)
> Let's call this init_mmio_trigger_ctx.
>
>> +{
>> +	ctx->vm = xe_vm_create(ctx->drm_fd, 0, 0);
>> +	ctx->exec_queue = xe_exec_queue_create(ctx->drm_fd, ctx->vm, ctx->hwe, 0);
>> +	ctx->ibb = intel_bb_create_with_context(ctx->drm_fd, ctx->exec_queue, ctx->vm,
>> +				 NULL, BATCH_SZ);
> Fix alignment here.
>
>> +}
>> +
>>   int
>>   main(int argc, char *argv[])
>>   {
>> @@ -1180,6 +1290,9 @@ main(int argc, char *argv[])
>> 		goto fail;
>> 	}
>>
>> +	init_trigger_ctx(&ctx);
> If we move this right after xe_device_get(), then I think we can remove the
> new if checks in teardown_recording_context().
>
> Anyway, we can live with those if checks too, so either way is fine with
> me.

I'll address all the above comments but for this, I don't think it'll 
still be okay if I placed it further after xe_device_get() cause 
ctx->hwe is filled by assign_oa_unit() -> assign_hwe(), which runs after 
xe_device_get(). If we moved init_trigger_ctx() after xe_device_get(), 
I'd still pass NULL into hwe, which isn't right. If I even move it after 
assign_oa_unit(), intel_get_device_info() might return NULL on some 
case, and then assign_oa_unit() itself fails.

Overall, I just feel, let's just keep the checks..

-shekhar

>
>> +	emit_oa_trigger(&ctx, 0xc0ffee01);
>> +
>> 	corr_period_ns = corr_period * 1000000000ul;
>> 	poll_time_ns = corr_period_ns;
>>
>> @@ -1227,6 +1340,8 @@ main(int argc, char *argv[])
>> 		}
>> 	}
>>
>> +	/* Emit second OA trigger for the case where circular buffer is not used */
>> +	emit_oa_trigger(&ctx, 0xc0ffee02);
>> 	fprintf(stdout, "Exiting...\n");
>>
>> 	if (!write_perf_data(ctx.output_stream, &ctx)) {
>> --
>> 2.53.0
>>
> Thanks.
> --
> Ashutosh

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

