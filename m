Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352D7C982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 12:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C981210E393;
	Mon, 21 Sep 2026 12:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W31NVDXy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8B110E38A
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 12:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789994819; x=1821530819;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BOKSY+kLV/aZSHI2/y9V681JFdgcEZiD19X6WicXLsQ=;
 b=W31NVDXy6c4+2m48yq0EJKQdOiIb2fMdXjRAe1rAN2Hos1/2pbtrmwfI
 PG6NBKmEY+ZaJIwqk3qQlOjKiqjgb8KdanC81KiVbO5jL1+Rb2Qw2FIsU
 3RRtABgDTirYRXcqQ2QVPTtjv6zsq3VCILG9Zgcsb6GCaeGZtn7vjxfDY
 gn3oAjr7vegdSAyojjmPBFPfQiB+UdIMd9IEXwCaUR6x9/SXt3bJyS0Ln
 bYyy/zKQxTmO7shOnm82wdAdLWf9ulzPPMrm0nvnPlQZzinY9bLGSfW+p
 mKZjRm9JefrsgESzaItk2XXu3uGD/lKVHruRQ+XzSGrOS8QhSXKNQklNJ A==;
X-CSE-ConnectionGUID: S7KnOk2iQ4KLWlMWQR1l9g==
X-CSE-MsgGUID: +K3uYDMKSsmO8q+/CkIERw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89639616"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="89639616"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 05:46:59 -0700
X-CSE-ConnectionGUID: goEIIqUwQxiarb+yil9B+g==
X-CSE-MsgGUID: r43mllUxTliVpLYeIr5evA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="277431945"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 05:46:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 05:46:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 05:46:59 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 05:46:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALns2khdCe7l0sYYjTrcc8mf+RKFThgAfhcOakU1GgPlvKZ1Fyi0qek83Jes9kPkmt0BLZLVLJJFV5rmExcbn2dssg1LyN0Xc5fVXLVVT+nguwK72g7IeXFbI63LYzhCoAcYJXF9/Dc5DF1kj5CcG8wsTOI3tjzt2gd5A2NgAWN3IhGfkE80EZ4tGvllWRPG1lwZjhhw1mjzIzEqcJTbO5qMOS8hhokuRHMtaSOerz8A5oMDiHFkJvIrK1WtQg7vSqwefqi3rHPLx+WKwJH3vcTEU48Z8nheejmyxgxPtGz30Q1UJn3AikzO3+oNfQcFGKolIrRXsrUL0GJgviERMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7uNjSUAoUuCM5+YsE3m1OH3GMlP5LjJkTpdTktUfAQ=;
 b=coxjmtdLTr2kDZBXhb1lTG/Ls0GpanL12bca142dw9P6zS722PTpMbCjSCMljPDgrEoXsYeRzpuXxd7Dwdvr9/skrUjN/7qTqi/5lNFIFgM/L5SGp+Wah9ldNhWh04ffPk+wghv8Jr3Z5oIcvTh1lcIuHbRaSBMiROzIj26uB49ZGAMsbNF0iksp+KFLEdADLe4EvnLy9aozXDC1tSWhd6ZDTMPxF+C0W05OzAaijcfoundDOHUpjFmeWwQ9KtJKdGQil/VWoRjnugTPvsCzzudOfLyYyUT7tsHqSlm5FGY+d3ezV25FC054z7NzwNVYtU8RvLK50vtxKp7lU+IioA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5415.namprd11.prod.outlook.com (2603:10b6:208:315::14)
 by SJ2PR11MB7548.namprd11.prod.outlook.com (2603:10b6:a03:4cb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 12:46:51 +0000
Received: from BL1PR11MB5415.namprd11.prod.outlook.com
 ([fe80::2bb1:a951:b2a8:e165]) by BL1PR11MB5415.namprd11.prod.outlook.com
 ([fe80::2bb1:a951:b2a8:e165%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 12:46:51 +0000
Message-ID: <a1fe3219-d5bf-4f8a-8c76-7c621ab06ffb@intel.com>
Date: Mon, 21 Sep 2026 18:16:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] test/intel/xe_bo_alloc: Add oversubscribe
 concurrent bind stress subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 <igt-dev@lists.freedesktop.org>, <matthew.brost@intel.com>
CC: <kamil.konieczny@intel.com>
References: <20260907082039.2223531-1-sobin.thomas@intel.com>
 <20260907082039.2223531-3-sobin.thomas@intel.com>
 <a23e1bae-a92e-4697-940d-0204b1802237@intel.com>
Content-Language: en-US
From: "Thomas, Sobin" <sobin.thomas@intel.com>
In-Reply-To: <a23e1bae-a92e-4697-940d-0204b1802237@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0307.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::8) To BL1PR11MB5415.namprd11.prod.outlook.com
 (2603:10b6:208:315::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5415:EE_|SJ2PR11MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 6292e79e-bbfb-493f-575f-08df17de681a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|6133799003|10067099003|3023799007|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: jueKk7mfHI6I3k3pYuSqi9W5eHfdwXCyMjRGAxlXQqSYazEOVTxNXDAafzQSattYkfi97a6HQgwSvqZ/I9fEjhvxYWZL/R3RlkI+2HVDjiHC5Dqt1q0hHN1SteFdKsyJgAGJLfO+un8wCZrJ+VBbvp90Tbag9Udt8wVRduGQrshq+IhELEEknX9Oz4WZaBi0PskMd6QbNfrq0WfdLIFsRD9WVaoqD//wJxvALs4qLeh8FdhCku6/nJ0dCBe1r/cbWd1O4M/DxTBEK2XYn0E+ZQHjAujdRJkm/AYD/sCsCl3rlJJFzDHjziQCEJSSNYy1oCqK3poD/ZhV/xvCYaVcAlZtDxXTQ9LijFC2/KTFOTr94z/VFGQwIO26hnOyip7QiB064ME57OWMdaPDCXOYCHPP0ADEq+7+tn3gJ2ePUv1uQFxAW28K+NU4QZjtzsK/SAecOQkGTvjgrY6ovxJiPAVVlyf5h1ZQ5IywIJFCCgiul3qxgGBNs4Q0AClIoYABgQYjuMU+fd4hL6w8Rln4GmCxr/W9n5OvxCQieqn7DpRGOGHlwQ0X5W0i0FbsCe/0Yv8vnO9qdBPvEQK3FDDv0jh2VZdmd4yHqn94gQaiRoEVBO0//ZoP58KAfyy1c1B4ZP7u8qD0RDAagO8JE1ubFdK+h53LBUKwtK/V7df3vEI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5415.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk9mZFFxR0lFV29SUENOQ0cxQ1h6dVpobjY5c0ZMZjA5dHJpVjQ1RzF0UWU2?=
 =?utf-8?B?SVVXVC9wVXVWVE9rK3h0dWpxOGRTSnpiMVk1dzlvYkNnalFpUmNsaDFTQUhI?=
 =?utf-8?B?VTFRaEdheW5HdjFOdXZ5RTBldHhSUisrVUFuSlBnZXN6aXgrckM3QkF1M3pq?=
 =?utf-8?B?UEVydlQrd2VVMk1OLzZjRmo4cEZTNkpDNk1jWWR5elNoQkYranA3c1QvL3Nl?=
 =?utf-8?B?TENOWkgyL2FFbHpqdUV0ZnB1NEZ3TzYwR3dPbGNJeU9rMEFZekd6ZTIzVHZa?=
 =?utf-8?B?OG5yUlVWZFdodDIxVDY2cXNGbzVqRTN0UnlIYmlOR2lLdGtIUGd6dlpuQnZs?=
 =?utf-8?B?MzI1R2ZQcUtqQlp1V0FZdWdoaUJCREdoRFEySnRZNjhKUlRlSXppbkEybXRB?=
 =?utf-8?B?NnFtTjQvR0REY1lnV2pGSm1lRUhWUWRoOXNobEJKYkVNd2pYS2pTQXBZc2hQ?=
 =?utf-8?B?YmZQZ1RWelZQTHRGUHBrVUo3Qzk2eFNURUM1NzgxWkpVY3pmRXhkMUIrSklM?=
 =?utf-8?B?M3plbXNqMTluNldyMFVBUm1RMlp2TWw1Sm5mUTB5cnA5dU9hMUlGUGgzREhH?=
 =?utf-8?B?NUNhejRwRDh6d1UrUzVLVzkyQWtsZlFLcUZLSnpwZFBhdEhTUVgxbkNCYjh6?=
 =?utf-8?B?NDg0MDVWRnhBdFNaa0VGZDkrT0tuRlV4Wm94QjM0RVJEbXFHaVd2TWlRSkFU?=
 =?utf-8?B?NlR6QUFxWW5tS0Y3WXFmSWNqZTlGSW5JT3Q4N2pWYUovU1BjNVdWenlXeGl2?=
 =?utf-8?B?dUs1M1B1enpXZzc4dFRGelB1SmZzSUtUdGg5MUJ4YnhpNWdmMmVMaklzeVVr?=
 =?utf-8?B?WGtEZTlGODJqTFNFaktnTlVhdW9iYWR3YW9OZmRmMFJDWG91UzJ3TEJFMGVZ?=
 =?utf-8?B?dkZjdldXUU5PZktvK25Iamg4a3p0K3pJM2tpeXoycVZQTEY5OFh4S0prdmNU?=
 =?utf-8?B?YkNsdW5tMmVDYldQZWdLcVVDcTd3Y1B1djB6WDVQZlZpa2sySUpyU2E3cGUx?=
 =?utf-8?B?WlNFaGhXa2lKSGJJdEh4N05ZUTNrNE1jaWZOakorekNWUDFURk5SODcxWHp0?=
 =?utf-8?B?RndyQXdTdnp3MVdzTjU1czZmaFh3ZFNiK2QwczUvcHpMdlllVUgwMUNIMXRw?=
 =?utf-8?B?SktDR1gyZUxkZ2pJVzZQMHIrbHEwMkZ0UGwwQ2xIUFVmS0tSSlZvQnJjL1Zk?=
 =?utf-8?B?OVF4YzFmRkRnMHdFYzRLV2EwZVFUeEtTSlE2aC9NbzE1QWhCSTdZdlVWdGZJ?=
 =?utf-8?B?UXgwTmlZbWZEbkhhaXZlNTZYM3pGZlZVY3ltWGx0VEZrajVwdlB0Ykp3R05h?=
 =?utf-8?B?WUNxSGdCSXpwSnFvT0tZUGIrQ0JIMEFySnlCSnZNOCs5em1nT0p2SlhlcG13?=
 =?utf-8?B?V0hJMzFkblVSb2xNTVhTbWhzV3NDZjRoM05DMVBnSCtEWHU1Q1dFaGlZaVdC?=
 =?utf-8?B?RldXcnVBUURtQ3d0NEpaUWE4cmVPSHhGNGhIazhpUVJJMXJucnNYenk2NHFv?=
 =?utf-8?B?cDVKdWtDQ2ZIck5VRnltazdyVTdXN2Y5ZHJEMVVEVmtjQkk3b3BvQ21ZejB2?=
 =?utf-8?B?S0JpUk1HM3hESnBMaUw2SEE0SjVyWllsaFk0OWd1UmlKQjd6N0lWTEdGVjE0?=
 =?utf-8?B?cUx5cmI2L3FLUklEQ3ZpeHJCSjY1bWlWZWJsbHdmK1E2dkNhZC9hSXNlT3FB?=
 =?utf-8?B?Y3VpZ0RjWVpSQ3hOb1E3UnlseEZLelVxMXNwNEIza0xWZjRHSG9LZWdzTWpM?=
 =?utf-8?B?dUNVQ0cxUG1acFNsOSs2emlVTGNTMm5mZnJvWGVHSHNaTDFORG10RzF3R3Br?=
 =?utf-8?B?aC90NHBMUVlsTTUzaWM4Rk9QV0Ntd21zbDdFYnVIUndtdHU2NXRKRjEveSs0?=
 =?utf-8?B?R1FFcHFQc2FwUWlwODY2OStDNlJoaldSUWJodUNlRkg0NU1DYTlHdmRpNmJl?=
 =?utf-8?B?d09kU0Uwb0RLUEpVSDRycWVCbVYza0x3NkVJSjBzclhEZGVDbUU0NTFGS042?=
 =?utf-8?B?QTZub0RNdnVlaHRLdTFSUWRnT2w4R0Q1L3dvNENZTGZHcHp3REhFNzJLTEl6?=
 =?utf-8?B?OGV0a1N2QTdJb0xDQmdad1ZHS2RhZ3dKMTZhcWw5dnlEenAzdDZnQzFPYUdv?=
 =?utf-8?B?KzMzRHdTd3lYRUhRelRhWUtVcVNldzJYeE16L3gvdzRNZW1EMzAyUTZYc1Rq?=
 =?utf-8?B?R1hwSC9ablAzT3p5VU1TemE4TTc5RkxPakdHdUtqa1IxV0lKbHg0QnhJdlhJ?=
 =?utf-8?B?Z1U5SGtPZ3VZVlVEK2J1WmQwUWtqWTJTUWJpdHJ1NUh6RVZoaUwzanQwR2Zl?=
 =?utf-8?B?OGNDL2EzUktlelB3c3ZGUnF3MTJxYmQzaFc5K1d1dUJScDUxZ09Kdz09?=
X-Exchange-RoutingPolicyChecked: HuMcyS9gu9ksvYU9lM+Gmm4b4EmOD0KinVQJVuULU5Qm0O5yPG0QZSpDU4PVxjQBB4HuZxBKk3F3EyNNHc9LW8xpI2g+fD0bvF4rikf07jSzsi/d7/RYv1fXw1cKZwr1GXpafUiCy3MigbOyPdcMltP5b7yI1oQBUy2uHpiN/C0pkVSe711YtLQxDV/xynFe13qlj9ZwKlzpVbqyQquiouRcqpdJCK1MCo4yqczhD9Mbshw8A+C713fqOSj9Qh6UcpMOlacoHnidoSWaYnKnKcYyHj+Xf8rR8iun0gue6JY0QdpP7f8hLQDeEE2t7tWQpLA8LWcPFuwKc+MtMYP+fQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6292e79e-bbfb-493f-575f-08df17de681a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5415.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:46:50.9996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpboOV2rXxfc4GX9l4MPD14u46vmOUBMecP4kf943M6HMXyOMi6y9VCc8b3FwK75qhfCkxxY+WFYXoONyW5v8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7548
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

Hi Nishit,


Thanks for reviewing this


On 9/15/2026 10:00 PM, Sharma, Nishit wrote:
>
> On 9/7/2026 1:50 PM, Sobin Thomas wrote:
>> Add test for oversubscribing VRAM in multi process environment that
>> creates VM, bind large BOs and submit workloads nearly simultaneously.
>>
>> Previous coverage lacked a scenario combining multi-process bind
>> with VRAM oversubscription. This generates memory pressure with
>> multi-process VM Bind activity and concurrent submission, exercising
>> the bind pipeline under eviction pressure.
>>
>> v3: Fixed minor nits
>>
>> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
>> ---
>>   tests/intel/xe_bo_alloc.c | 498 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 498 insertions(+)
>>
>> diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
>> index 58380463c..06cd651eb 100644
>> --- a/tests/intel/xe_bo_alloc.c
>> +++ b/tests/intel/xe_bo_alloc.c
>> @@ -29,6 +29,19 @@
>>   #define THREAD_VA_STRIDE GB(1)
>>   #define SZ_4K_SHIFT    12
>>   #define MAX_ALLOCATIONS 50000
>> +#define INT_ADD_CNT 4
>> +#define TIMEOUT_NS (30ULL * 1000000000ULL)
>> +#define MAX_SRAM_TEST_SIZE GB(32)
>> +#define GPR_RX_ADDR(x)          (0x600 + (x) * 8)
>> +#define MAX_PROCS 20
>> +
>> +#define EXEC_DATA_ADDR        0x100000ULL
>> +#define EXEC_RESULT_ADDR    0x200000ULL
>> +#define EXEC_BATCH_ADDR        0x300000ULL
>> +#define EXEC_UFENCE_ADDR    0x400000ULL
>> +#define STRESS_BIND_ADDR    0x40000000ULL
>> +
>> +
>>     /**
>>    * SUBTEST: all-sizes-once
>> @@ -75,14 +88,48 @@
>>    * Description: Test 50 random BO allocation sizes in test table 
>> with a thread per engine,
>>    * leak the binding, unaligned bind addresses
>>    * Test category: stress test
>> + *
>> + * SUBTEST: test_vm_oversubscribe_concurrent_bind
>> + * Description: Test enough random BO allocation sizes, bound as 
>> arrays of binds, to trigger
>> + * evictions with 2 processes per engine, leak the BO munmap / gem 
>> close, unaligned bind addresses
>> + * Test category: stress test
>>    */
>>     #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
>>   #define MIN_BUFS_PER_PROC 2
>>     #define N_ALLOC_SIZES    256
>> +#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
>> +
>>   static uint64_t *alloc_sizes;
>>   +struct gem_bo {
>> +    uint32_t handle;
>> +    uint64_t size;
>> +    uint32_t *ptr;
>> +    uint64_t addr;
>> +};
>> +
>> +struct xe_oversubscribe_ctx {
>> +    uint32_t vm_id;
>> +    uint32_t exec_queue_id;
>> +};
>> +
>> +struct mem_bind_sync {
>> +    struct gem_bo *bufs;
>> +    int n_bufs;
>> +    uint64_t *binds_ufence;
>> +};
>> +
>> +struct process_data {
>> +    pthread_mutex_t mutex;
>> +    pthread_cond_t cond;
>> +    int ready;
>> +    int failed;
>> +    pthread_barrier_t barrier;
>> +    bool go;
>> +};
>> +
>>   /*
>>    * Data-driven subtest matrix.
>>    *
>> @@ -103,6 +150,7 @@ enum test_type {
>>       TYPE_SINGLE,
>>       TYPE_ARRAY_BIND,
>>       TYPE_THREAD,
>> +    TYPE_OVERSUBSCRIBE,
>>   };
>>     struct test_case {
>> @@ -223,6 +271,450 @@ static int __xe_vm_bind_array(int fd, uint32_t vm,
>>       return 0;
>>   }
>>   +static void init_pdata(struct process_data *pdata)
>> +{
>> +    pthread_mutexattr_t mattr;
>> +    pthread_condattr_t cattr;
>> +
>> +    pthread_mutexattr_init(&mattr);
>> +    igt_assert_eq(pthread_mutexattr_setpshared(&mattr, 
>> PTHREAD_PROCESS_SHARED), 0);
>> +    igt_assert_eq(pthread_mutex_init(&pdata->mutex, &mattr), 0);
>> +    pthread_mutexattr_destroy(&mattr);
>> +
>> +    pthread_condattr_init(&cattr);
>> +    igt_assert_eq(pthread_condattr_setpshared(&cattr, 
>> PTHREAD_PROCESS_SHARED), 0);
>> +    igt_assert_eq(pthread_cond_init(&pdata->cond, &cattr), 0);
>> +    pthread_condattr_destroy(&cattr);
>> +    pdata->ready = 0;
>> +    pdata->failed = 0;
>> +    pdata->go = false;
>> +}
>> +
>> +static void process_ready_and_wait(struct process_data *pdata)
>> +{
>> +    pthread_mutex_lock(&pdata->mutex);
>> +    pdata->ready++;
>> +    pthread_cond_broadcast(&pdata->cond);
>> +    while (!pdata->go)
>> +        pthread_cond_wait(&pdata->cond, &pdata->mutex);
>> +    pthread_mutex_unlock(&pdata->mutex);
>> +}
>> +
>> +static void process_setup_failed(struct process_data *pdata)
>> +{
>> +    pthread_mutex_lock(&pdata->mutex);
>> +    pdata->failed++;
>> +    pthread_cond_broadcast(&pdata->cond);
>> +    pthread_mutex_unlock(&pdata->mutex);
>> +}
>> +
>> +static void release_ready_processes(struct process_data *pdata, int 
>> n_proc)
>> +{
>> +    pthread_mutex_lock(&pdata->mutex);
>> +    /*
>> +     * Wait until all children have either reached VM Bind rendevouz
>> +     * Or, failed setup and exited the test path.
>> +     */
>> +    while (pdata->ready + pdata->failed < n_proc)
>> +        pthread_cond_wait(&pdata->cond, &pdata->mutex);
>> +
>> +    igt_debug(" Process rendezvous: ready=%d failed=%d total = %d\n",
>> +          pdata->ready, pdata->failed, n_proc);
>> +
>> +    /* Release every successful child into VM_Bind at same time*/
>> +    pdata->go = true;
>> +    pthread_cond_broadcast(&pdata->cond);
>> +    pthread_mutex_unlock(&pdata->mutex);
>> +}
>> +
>> +static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo 
>> *integers_bo,
>> +               struct gem_bo *result_bo, int ints_to_add)
>> +{
>> +    int pos = 0;
>> +    int i;
>> +    uint64_t tmp_addr;
>> +
>> +    batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | 
>> MI_LRI_LRM_CS_MMIO | 2;
>> +    batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
>> +    tmp_addr = integers_bo->addr + 0 * sizeof(uint32_t);
>> +    batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
>> +    batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
>> +    for (i = 1; i < ints_to_add; i++) {
>> +        /* r1 = integers_bo[i] */
>> +        batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | 
>> MI_LRI_LRM_CS_MMIO | 2;
>> +        batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
>> +        tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
>> +        batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
>> +        batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
>> +        /* r0 = r0 + r1 */
>> +        batch_bo->ptr[pos++] = MI_MATH(4);
>> +        batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, 
>> MI_MATH_REG(0));
>> +        batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, 
>> MI_MATH_REG(1));
>> +        batch_bo->ptr[pos++] = MI_MATH_ADD;
>> +        batch_bo->ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0), 
>> MI_MATH_REG_ACCU);
>> +    }
>> +    /* result_bo[0] = r0 */
>> +    batch_bo->ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 | 
>> MI_LRI_LRM_CS_MMIO;
>> +    batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
>> +    tmp_addr = result_bo->addr + 0 * sizeof(uint32_t);
>> +    batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
>> +    batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
>> +
>> +    batch_bo->ptr[pos++] = MI_BATCH_BUFFER_END;
>> +    while (pos % 4 != 0)
>> +        batch_bo->ptr[pos++] = MI_NOOP;
>> +    return pos;
>> +}
>> +
>> +static void create_exec_queue(int fd, struct xe_oversubscribe_ctx *ctx)
>> +{
>> +    ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id,
>> +                          &xe_engine(fd, 0)->instance, 0);
>> +}
>> +
>> +static uint64_t *
>> +vm_bind_bo_batch(int fd, struct xe_oversubscribe_ctx *ctx, struct 
>> gem_bo *bos, int size,
>> +         int *out_err)
>> +{
>> +    uint64_t *ufence;
>> +    struct drm_xe_sync bind_sync;
>> +    struct drm_xe_vm_bind_op *binds;
>> +    int i;
>> +
>> +    binds = calloc(size, sizeof(*binds));
>> +    igt_assert(binds);
>> +
>> +    ufence = calloc(1, sizeof(*ufence));
>> +    igt_assert(ufence);
>> +    bind_sync = (struct drm_xe_sync) {
>> +        .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +        .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +        .addr = to_user_pointer(ufence),
>> +        .timeline_value = 1,
>> +    };
>> +
>> +    for (i = 0; i < size; i++) {
>> +        binds[i] = (struct drm_xe_vm_bind_op) {
>> +            .obj = bos[i].handle,
>> +            .obj_offset = 0,
>> +            .range = bos[i].size,
>> +            .addr = bos[i].addr,
>> +            .op = DRM_XE_VM_BIND_OP_MAP,
>> +            .flags = 0,
>> +        };
>> +    }
>> +    *out_err = __xe_vm_bind_array(fd, ctx->vm_id, binds, size, 
>> &bind_sync, 1);
>> +    free(binds);
>> +    return ufence;
>> +}
>> +
>> +static int fill_random_integers(struct gem_bo *int_bo, int ints_to_add)
>> +{
>> +    uint32_t expected_result = 0;
>> +    char expr[256];
>> +    int len = 0;
>> +
>> +    for (int i = 0; i < ints_to_add; i++) {
>> +        uint32_t random_int = rand() % 8;
>> +
>> +        int_bo->ptr[i] = random_int;
>> +        expected_result += random_int;
>> +
>> +        len += snprintf(expr + len, sizeof(expr) - len, "%s%u",
>> +                i ? " + " : "", random_int);
>> +    }
>> +    igt_debug("%s = %u\n", expr, expected_result);
>> +    return expected_result;
>> +}
>> +
>> +static void cleanup_bo_resources(int fd, struct gem_bo *bo)
>> +{
>> +    if (bo->ptr) {
>> +        igt_assert_eq(munmap(bo->ptr, bo->size), 0);
>> +        bo->ptr = NULL;
>> +    }
>> +    if (bo->handle)
>> +        gem_close(fd, bo->handle);
>> +}
>> +
>> +static int create_test_bos(int fd, struct xe_oversubscribe_ctx *ctx,
>> +               struct mem_bind_sync *bind, uint32_t placement,
>> +               uint64_t *addr)
>> +{
>> +    const char *mem_type = (placement & vram_memory(fd, 0)) ? "VRAM" 
>> : "SRAM";
>> +    int ret;
>> +
>> +    for (int i = 0; i < bind->n_bufs; i++) {
>> +        struct gem_bo *bo = &bind->bufs[i];
>> +
>> +        bo->size = GB(1);
>> +        ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, 
>> placement, 0,
>> +                         DRM_XE_GEM_CPU_CACHING_WC, &bo->handle);
>> +        if (ret) {
>> +            int saved_errno = errno; /* capture before anything can 
>> clobber it */
>> +
>> +            bind->n_bufs = i;
>> +            if (saved_errno == ENOMEM || saved_errno == ENOSPC) {
>> +                /* Continue on OOM, expected when oversubscribing 
>> the VM */
>> +                igt_debug("%s allocation failed at buffer %d 
>> (OOM)\n", mem_type, i);
>> +                break;
>> +            }
>> +            /* We are returning as this is a fail scenario */
>> +            igt_warn("%s allocation failed at buffer %d: %s\n",
>> +                 mem_type, i, strerror(saved_errno));
>> +            return -saved_errno;
>> +        }
>> +        bo->ptr = NULL;
>> +        bo->addr = *addr;
>> +        *addr += bo->size;
>> +        igt_debug("%s buffer %d created at 0x%016lx\n", mem_type, i, 
>> bo->addr);
>> +    }
>> +    return 0;
>> +}
>> +
>> +static void cleanup_sram_vram_objs(int fd, struct mem_bind_sync 
>> *vram_bind,
>> +                   struct mem_bind_sync *sram_bind)
>> +{
>> +    for (int i = 0; i < vram_bind->n_bufs; i++)
>> +        gem_close(fd, vram_bind->bufs[i].handle);
>> +    for (int i = 0; i < sram_bind->n_bufs; i++)
>> +        gem_close(fd, sram_bind->bufs[i].handle);
>> +    free(vram_bind->bufs);
>> +    free(sram_bind->bufs);
>> +    if (vram_bind->binds_ufence)
>> +        free(vram_bind->binds_ufence);
>> +    if (sram_bind->binds_ufence)
>> +        free(sram_bind->binds_ufence);
>> +}
>> +
>> +static void test_vm_oversubscribe_concurrent_bind(int fd)
>> +{
>> +    int n_proc = 0, n_vram_bufs = 0, n_sram_bufs = 0;
>> +    uint64_t max_by_mem;
>> +    uint64_t total_vram_demand = 0;
>> +    uint64_t vram_size = xe_visible_available_vram_size(fd, 0);
>> +    uint64_t sram_avail = (uint64_t)igt_get_avail_ram_mb() << 20;
>> +    uint64_t target_vram = vram_size * 2;
>> +    uint64_t target_sram, total_vram_bufs, total_sram_bufs;
>> +    struct process_data *pdata;
>> +
>> +    /*
>> +     * Dynamically cap VRAM oversubscription so the overflow into 
>> system
>> +     * RAM stays within 25% of available RAM. On small-VRAM platforms
>> +     * (e.g. BMG) the 2x target fits within the cap and behavior is
>> +     * unchanged; on large-VRAM platforms (e.g. PVC) this prevents OOM.
>> +     */
>> +    target_vram = min(target_vram, vram_size + sram_avail / 4);
>> +    target_sram = min_t(uint64_t, sram_avail * 50 / 100,
>> +                MAX_SRAM_TEST_SIZE);
>> +
>> +    total_vram_bufs = target_vram / GB(1);
>> +    total_sram_bufs = target_sram / GB(1);
>> +
>> +    /* determine concurrency from memory pressure */
>> +
>> +    max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
>> +             total_sram_bufs / MIN_BUFS_PER_PROC);
>> +    n_proc = min_t(int, max_by_mem, MAX_PROCS);
>> +    igt_require_f(n_proc > 0, "Not enough VRAM/RAM for 
>> oversubscription test\n");
>
> Try simplifying by calling a function which calculates mem size, 
> vram/sram bufs which can be used below also
>
> and if mem not available skip
Agreed .
> Good point. I’ll factor the oversubscription sizing into a helper that 
> returns the process count and VRAM/system-memory buffer counts, and 
> use igt_require_f() to skip when the calculated configuration cannot run.
>> +
>> +    n_vram_bufs = max_t(int, 2, total_vram_bufs / n_proc);
>> +    n_sram_bufs = max_t(int, 2, total_sram_bufs / n_proc);
>> +    total_vram_demand = (uint64_t)n_proc * n_vram_bufs * GB(1);
>> +
>> +    igt_debug("VRAM size: %" PRIu64 "MB, System RAM available: %" 
>> PRIu64 "MB\n",
>> +          vram_size >> 20, sram_avail >> 20);
>> +
>> +    igt_debug("n_proc = %d\n", n_proc);
>> +    igt_debug("VRAM: %" PRIu64 "GB\n", vram_size >> 30);
>> +    igt_debug("VRAM demand: %" PRIu64 "MB (%.2fx oversubscription)\n",
>> +          total_vram_demand >> 20, (double)total_vram_demand / 
>> vram_size);
>> +    igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", n_proc,
>> +          n_vram_bufs, n_sram_bufs);
>> +
>> +    pdata = mmap(NULL, sizeof(*pdata), PROT_READ | PROT_WRITE,
>> +             MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>> +    igt_assert(pdata != MAP_FAILED);
>> +    init_pdata(pdata);
>> +
>> +    igt_fork(child, n_proc) {
>> +        struct xe_oversubscribe_ctx ctx = {0};
>> +        int rc, ret;
>> +        uint64_t addr = STRESS_BIND_ADDR;
>> +        uint32_t expected_result = 0;
>> +        struct gem_bo integers_bo = {0}, result_bo = {0}, batch_bo = 
>> {0};
>> +        struct gem_bo *vram_bufs, *sram_bufs;
>> +        int pos = 0;
>> +        struct mem_bind_sync vram_bind = {0};
>> +        struct mem_bind_sync sram_bind = {0};
>> +        struct drm_xe_sync batch_syncs[1];
>> +        struct drm_xe_exec exec;
>> +        struct gem_bo ufence_bo = {0};
>> +        int vram_bind_err = 0, sram_bind_err = 0;
>> +
>> +        vram_bufs = calloc(n_vram_bufs, sizeof(*vram_bufs));
>> +        sram_bufs = calloc(n_sram_bufs, sizeof(*sram_bufs));
>> +        srand(child);
>> +
>> +        igt_assert(vram_bufs && sram_bufs);
>> +
>> +        ctx.vm_id = xe_vm_create(fd, 
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
>
> after fork every child will inherit and share same fd. VRAM pressure 
> should be cross VM. For multi-process scenario is child should call
>
> fd_child = drm_open_driver(DRIVER_XE); Use fd_child and then 
> drm_close_driver(fd_child);


Sure will make sure different child process gets its own fd. This will 
help in proper independent creation in stress cases.

>
>> +        create_exec_queue(fd, &ctx);
>> +        vram_bind.bufs = vram_bufs;
>> +        vram_bind.n_bufs = n_vram_bufs;
> why defining here when it's being defined in create_test_bos()
>> +        sram_bind.bufs = sram_bufs;
>> +        sram_bind.n_bufs = n_sram_bufs;
> same as above
>> +
>> +        ret = create_test_bos(fd, &ctx, &vram_bind, vram_memory(fd, 
>> 0), &addr);
>> +        if (ret) {
>> +            process_setup_failed(pdata);
>> +            goto cleanup;
>> +        }
>> +
>> +        ret = create_test_bos(fd, &ctx, &sram_bind, 
>> system_memory(fd), &addr);
>> +        if (ret) {
>> +            process_setup_failed(pdata);
>> +            goto cleanup;
>> +        }
>
> Instead of calling two separate create_test_bos() for vram/system 
> single time function can be called with sram_bind and vram_bind arguments
>
> and in that function 1 iteration will be for vram and 1 for sram
>
> VRAM bind OOM → tolerated/skip; SRAM bind OOM → hard assert. But 
> target_sram is 50% of available RAM and the test
>
> simultaneously pushes VRAM overflow into system RAM (vram_size + 
> sram_avail/4).
>
> Under 20 processes these can legitimately collide and SRAM bind can 
> OOM, hard-failing
>
> the test for an expected pressure condition. Either size SRAM more 
> conservatively or tolerate -ENOMEM/-ENOSPC on SRAM the same way.
Thanks for pointing it out. Will return -ENOMEM/ -ENOSPC for lack of 
SRAM size.
>
>> +
>> +        if (!vram_bind.n_bufs || !sram_bind.n_bufs) {
>> +            igt_debug("No BOs allocated; VRAM/SRAM unavailable, 
>> skipping\n");
>> +            process_setup_failed(pdata);
>> +            goto cleanup;
>> +        }
>> +
>> +        /*
>> +         * All allocations are complete. Report Ready and wait until 
>> every
>> +         * child has either reached this point or repported a setup 
>> failure.
>> +         */
>> +
>> +         process_ready_and_wait(pdata);
>> +
>> +        /*
>> +         * VM_Bind starts only after the parent releases all ready
>> +         * childen.
>> +         */
>> +
>> +        if (vram_bind.n_bufs) {
>> +            vram_bind.binds_ufence =
>> +                vm_bind_bo_batch(fd, &ctx, vram_bufs,
>> +                         vram_bind.n_bufs, &vram_bind_err);
>> +            if (vram_bind_err) {
>> +                igt_assert_f(vram_bind_err == -ENOMEM || 
>> vram_bind_err == -ENOSPC,
>> +                         "Unexpected VRAM bind error: %d (%s)\n",
>> +                         vram_bind_err, strerror(-vram_bind_err));
>> +                igt_debug("VRAM bind failed with expected OOM (%s), 
>> skipping exec\n",
>> +                      strerror(-vram_bind_err));
>> +                goto cleanup;
>> +            }
>> +            xe_wait_ufence(fd, vram_bind.binds_ufence, 1, 0, 
>> TIMEOUT_NS);
>> +        }
>> +
>> +        if (sram_bind.n_bufs) {
>> +            sram_bind.binds_ufence =
>> +                vm_bind_bo_batch(fd, &ctx, sram_bufs,
>> +                         sram_bind.n_bufs, &sram_bind_err);
>> +            /* Assert if there is any bind error in SRAM */
>> +            if (sram_bind_err)
>> +                igt_assert_f(0, "Unexpected SRAM bind error: %d", 
>> sram_bind_err);
>> +            xe_wait_ufence(fd, sram_bind.binds_ufence, 1, 0, 
>> TIMEOUT_NS);
>> +    }
> Trying simplifying both conditions in same function call


Will refactor into a function call to make readability.

>> +
>> +        integers_bo.size = ALIGN(sizeof(int) * INT_ADD_CNT, 4096);
>> +        integers_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, 
>> integers_bo.size,
>> +                              system_memory(fd), 0,
>> +                              DRM_XE_GEM_CPU_CACHING_WC);
>> +        igt_assert(integers_bo.handle);
>> +        integers_bo.ptr = xe_bo_map(fd, integers_bo.handle, 
>> integers_bo.size);
>> +        igt_assert(integers_bo.ptr != MAP_FAILED);
>> +        integers_bo.addr = EXEC_DATA_ADDR;
>> +
>> +        expected_result = fill_random_integers(&integers_bo, 
>> INT_ADD_CNT);
>> +        igt_debug("%d\n", expected_result);
>> +
>> +        result_bo.size = ALIGN(sizeof(int), 4096);
>> +        result_bo.handle  = xe_bo_create_caching(fd, ctx.vm_id, 
>> result_bo.size,
>> +                             system_memory(fd), 0,
>> +                             DRM_XE_GEM_CPU_CACHING_WC);
>> +        igt_assert(result_bo.handle);
>> +        result_bo.ptr = NULL;
>> +        result_bo.addr = EXEC_RESULT_ADDR;
>> +
>> +        batch_bo.size = 4096;
>> +        batch_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, 
>> batch_bo.size,
>> +                               system_memory(fd), 0,
>> +                               DRM_XE_GEM_CPU_CACHING_WC);
>> +        igt_assert(batch_bo.handle);
>> +
>> +        batch_bo.ptr = xe_bo_map(fd, batch_bo.handle, batch_bo.size);
>> +        igt_assert(batch_bo.ptr != MAP_FAILED);
>> +        batch_bo.addr = EXEC_BATCH_ADDR;
>> +
>> +        pos = build_add_batch(&batch_bo, &integers_bo, &result_bo, 
>> INT_ADD_CNT);
>> +
>> +        igt_assert(pos * sizeof(int) <= batch_bo.size);
>> +
>> +        xe_vm_bind_lr_sync(fd, ctx.vm_id, integers_bo.handle, 0, 
>> integers_bo.addr,
>> +                   integers_bo.size, 0);
>> +        xe_vm_bind_lr_sync(fd, ctx.vm_id, result_bo.handle, 0, 
>> result_bo.addr,
>> +                   result_bo.size, 0);
>> +        xe_vm_bind_lr_sync(fd, ctx.vm_id, batch_bo.handle, 0, 
>> batch_bo.addr,
>> +                   batch_bo.size, 0);
>> +
>> +        ufence_bo.size = 4096;
>> +        ufence_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, 
>> ufence_bo.size,
>> +                            system_memory(fd), 0,
>> +                            DRM_XE_GEM_CPU_CACHING_WC);
>> +        igt_assert(ufence_bo.handle);
>> +        ufence_bo.ptr = xe_bo_map(fd, ufence_bo.handle, 
>> ufence_bo.size);
>> +        igt_assert(ufence_bo.ptr != MAP_FAILED);
>> +        ufence_bo.addr = EXEC_UFENCE_ADDR;
>> +        memset(ufence_bo.ptr, 0, ufence_bo.size);
>> +        xe_vm_bind_lr_sync(fd, ctx.vm_id, ufence_bo.handle, 0, 
>> ufence_bo.addr,
>> +                   ufence_bo.size, 0);
>> +
>> +        batch_syncs[0] = (struct drm_xe_sync){
>> +            .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +            .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +            .addr = ufence_bo.addr,
>> +            .timeline_value = USER_FENCE_VALUE,
>> +        };
>> +
>> +        exec = (struct drm_xe_exec) {
>> +            .exec_queue_id = ctx.exec_queue_id,
>> +            .num_syncs = 1,
>> +            .syncs = (uintptr_t)batch_syncs,
>> +            .address = batch_bo.addr,
>> +            .num_batch_buffer = 1,
>> +        };
>> +
>> +        rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
>> +        igt_assert_f(rc == 0, "xe_exec failed unexpectedly: %s (%d)\n",
>> +                 strerror(errno), errno);
>> +        xe_wait_ufence(fd, (uint64_t *)ufence_bo.ptr, 
>> USER_FENCE_VALUE, ctx.exec_queue_id,
>> +                   TIMEOUT_NS);
>> +        result_bo.ptr = xe_bo_map(fd, result_bo.handle, 
>> result_bo.size);
>> +        igt_assert(result_bo.ptr != MAP_FAILED);
>> +        igt_assert_eq(result_bo.ptr[0], expected_result);
> Above code can be simplified by putting common instructions in single 
> function.
Agreed.
>> +cleanup:
>> +        cleanup_bo_resources(fd, &ufence_bo);
>> +        cleanup_bo_resources(fd, &result_bo);
>> +        cleanup_bo_resources(fd, &batch_bo);
>> +        cleanup_bo_resources(fd, &integers_bo);
>> +        cleanup_sram_vram_objs(fd, &vram_bind, &sram_bind);
>> +        xe_exec_queue_destroy(fd, ctx.exec_queue_id);
>> +        xe_vm_destroy(fd, ctx.vm_id);
>> +    }
>> +
>> +    release_ready_processes(pdata, n_proc);
>
> this function will be blocked permanently if any child exits without 
> incrementing ready/failed counter as the condition says
>
> while (pdata->ready + pdata->failed < n_proc) --> suppose n_procs = 4 
> and ready/failed counter not incremented, child dies then it's block 
> permanently
>
>             pthread_cond_wait(&pdata->cond, &pdata->mutex); if child 
> dies holding mutex parent will be blocked foreever
Agreed, Was thinking of asserting, will be taking care to keep condition 
timedout wait for this check.
>
>> +    igt_waitchildren();
>> +    igt_reset_timeout();
>> +
>> +    pthread_cond_destroy(&pdata->cond);
>> +    pthread_mutex_destroy(&pdata->mutex);
>> +    igt_assert_eq(munmap(pdata, sizeof(*pdata)), 0);
>> +}
>> +
>>   static void alloc_sizes_init(void)
>>   {
>>       int i;
>> @@ -984,6 +1476,8 @@ static const struct test_case test_matrix[] = {
>>         false },
>>       { "threads-leak-binding-rand-sizes-50-unaligned", 50,
>>         LEAK_BINDING | UNALIGNED, TYPE_THREAD, false },
>> +    { "test_vm_oversubscribe_concurrent_bind", 0, 0,
>> +      TYPE_OVERSUBSCRIBE, false},
>
> Instead of taking enum use something like #define TYPE_OVERSUBSCRIBE 
> 0x1<<5 depending upon the macros defined. Enum will create confusion
>
> and wrong manipulation if someone passes LEAK_BINDING | 
> TYPE_OVERSUBSCRIBE as enum is 0
>
This will remain as enum . As TYPE_OVERSUBSCRIBE is mutually exclusive 
test category only used in test_matrix type and the switch(t->type) 
dispatch. It is never combined with LEAK_BINDING.

Here

{ "test_vm_oversubscribe_concurrent_bind", 0, 0, TYPE_OVERSUBSCRIBE, 
false },

in this the third_field is flags and fourth field is type and they are 
distinct.

>>   };
>>     int igt_main()
>> @@ -1010,6 +1504,10 @@ int igt_main()
>>                   run_threaded_bo_alloc_test(fd, t->count, t->flags);
>>               }
>>               break;
>> +        case TYPE_OVERSUBSCRIBE:
>> +            igt_subtest_f("%s", t->name)
>> +                test_vm_oversubscribe_concurrent_bind(fd);
>> +            break;
>>           case TYPE_ALL_SIZES:
>>           case TYPE_SINGLE:
>>           case TYPE_ARRAY_BIND:
