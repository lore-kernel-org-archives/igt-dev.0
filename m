Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60741E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 11:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE37A10EAC6;
	Tue,  7 Jan 2025 11:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwfEFPbf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DDC10E423
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 11:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736250757; x=1767786757;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cRuUJ97kStfEcacUAfegvaWCsiEg0bmrimBLKeS0TNc=;
 b=XwfEFPbfY8yj70E9jzAYm3W18aiKgPjjqkwRwC89Cxpk3MH7dlbwurzE
 gI+phaO5ch03DG+x0w3gq2BI3GtADk8NxE3roPgIL9PDg8ipGT/Hgna9+
 L4LG3bMx+EchCPcQ/MV4JX4K3hMNL734m+QEA8mzCG/ihD5osisNWHypw
 3JxPG7Y58Ng2/OP90C7gpnc7OGoFlIeGJPuADcXuSJ2rv0yVGIMQ/9S7h
 XDgwD4Lvh+A0ZQa8g/nHW6Cuh+9jpDDo1fu0hoRYsAfmUXVqtLwTCcPOS
 XcgiiFzDrYuVjlCILittoXnGtObMuhZA4wCq/BU/ZSJPSrb79f5ug/gIC Q==;
X-CSE-ConnectionGUID: iyHaMs+tRi6kgenx9+8Mow==
X-CSE-MsgGUID: 8pQQQTF3QnCpKhL86l+Q4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="47846614"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="47846614"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 03:52:36 -0800
X-CSE-ConnectionGUID: JMgcQ/KWSLWU670JVr4tMQ==
X-CSE-MsgGUID: 89QU5hCtR8aw7ewlP27tsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="103258775"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 03:52:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 03:52:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 03:52:35 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 03:52:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwji6KNSt4uih3sJHqENEbrGrsX/32YPqbDwEEm3R86unWcMnkSz7x6PqLwE9renSfLKhvqiM+xil1AnvLelo42dVdTlLPf/RrTH/Fdn3d36IIxgno9+x4WkAWcCAOsTEtjUBhSOdECdtLsyuoIf65hsvN5Vx28qCyaSJ8WFMb3Grvkac9SRiFggxQH1y4yQR4fY8eyW7FNdY5kDDbUwWZfW6ekgGL9E4uae/VkyqimZuuJwCghvnXvhKyF/jWcpXJUqGy722EYrUOJ+xdp2ZG83sanEbMXvaGro7qmovGd0Niu2YdMmigLECnDlKDiAIyrrIy7bL4+nkQDNqD2rQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hh1eE0tlDYUel++VegOk/c9BgJJ/LvfFHyb3zMxr19s=;
 b=IzuSSo5vi3ThHfv+GPm/lj8RHzxw18VVTXkienALeRQZjr/1Js3JNwdjSLOrRFHmBFJFl3Xkl8wRRpWj5kCj3iTjcK/g62yiH7rGxm52P/D/3KZDN3zpsKmOxFxyBbvVOuYtFztNy3bybPWLeGgqnKQjToLB52PFqFVi+zMqk5LCdAb8YGWOBVVHlN49M6+4JBr1dGIQx/6pG9Sm3H8BDQhxSJPUol9hYzvdJ7JExfUTSvOnvAleVbn9w4qqrO7vX+XxZoO/0BDCCtUTqVO8YuI3l5+m0ToJlKW5Uu2hI2Dha+0tRH2OCvFGXtg0ncXTEitQwsDXSEgpreBYZ008Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 11:52:11 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 11:52:11 +0000
Message-ID: <010ce8e5-9e1a-4403-b611-25cf92b9c72c@intel.com>
Date: Tue, 7 Jan 2025 12:52:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/xe_sriov_auto_provisioning: Add tests for
 SR-IOV auto-provisioning
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
 <20241218120056.779962-6-marcin.bernatowicz@linux.intel.com>
 <e99cd75c-be29-4c57-ad06-f1f9c1f9a5f9@intel.com>
 <925fea09-6f3d-45e5-8b3c-8c6138c399cc@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <925fea09-6f3d-45e5-8b3c-8c6138c399cc@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR02CA0070.eurprd02.prod.outlook.com
 (2603:10a6:802:14::41) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ad1322-fa04-4656-d46f-08dd2f11b839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXM5RjkrWWtRWkVUUWlab1pwVGp2bzdvY0VlWm5OT0dFd0FoT3lVRFgzRFh6?=
 =?utf-8?B?M0o1SkhoSkhHdDN0K0NleFF3ay9iZzE4eWZ6T3FrbkdLNzhsWEg3MXZiZEpj?=
 =?utf-8?B?VWh2b3ZQMHN1am1aczZsNHhVYW5SSXJESmc2THg3dXNNSWRPOWhtWXk2Zmp0?=
 =?utf-8?B?b3IyUmg4MFFGNmhhRUVSRGIzQU0xLzlsbm5ScW9pcUhtVEV5Zm5VNkxyUlF5?=
 =?utf-8?B?OXJoMW8wdXAwT2ZZMUZjelBJL1VkZGNoM2xFckt3WWIvc3hpN3oramZMZ0g4?=
 =?utf-8?B?ZWV4dW1WREoxUlowMFZGbkIyQ3Fqb3hyWTdrVmFwYjdzWmZ5MWFod29DRmVj?=
 =?utf-8?B?OElwVVhkVUVUcXp6NnVIeG5DUWhtalhZR2xxNUhBRDduSjBSZ3JDakNHQWtC?=
 =?utf-8?B?ZmtoQzhCcU1UYlZBYVI1QVpwNlZ5VEY5dTFvcFJDeFJiVVJNdXNuYzErbHlD?=
 =?utf-8?B?cU9FaFp2K05PQVIzRFF2Mm82bWlzV3Z4TVI0QzZJWXdXZUx4TFgxOXRpWndC?=
 =?utf-8?B?dHQ1UU5nS2YveDVDVzVVdTdHQnUyT1FJN0VqdklFTnA1emkrNGorcG9JU2JI?=
 =?utf-8?B?aVZQemlGdExMcGQxQ05HNGxLOHlwU0x6cW9CN0ZCMko2WDY4c3VOS0FEU1JG?=
 =?utf-8?B?RUtVeHBTcHpCVnA5bGN2V0VheXhBMEZNTFZ2ejlPbFhtR05VbkZHRndXclgy?=
 =?utf-8?B?b28zbnppayttd2hFQWNVWFNUY3d5d0txTjZwQ1U4UW5NMStuNmNTNHJSV1dX?=
 =?utf-8?B?dmE0L2lVdC85NSt5RGdJT1BOTXpocnMrejZLUFcxQkk3aDM0b1ZzSFZEc3dH?=
 =?utf-8?B?QTNiTk5ha0lyVC9YQ1ZmekJ2L3VxaXY4R1lDREJqWG5JWk8wSHR6WGlNd0Fw?=
 =?utf-8?B?aC8wNHJrbUFYa2pQTEVtNWRvU2JiM0N4d0MyNHFJUVRoem91czBHTVJKZ0VD?=
 =?utf-8?B?SzNQdUdXd3U1TXB0eUVRdHV4L0hFKzM1clZuc1Jmb1VQM3M0Y2l5Tm9PRHgv?=
 =?utf-8?B?Q05YY2JWU3A3MjI2K2QxMERlUi81NzdPMG1RK1BtblRIQ1VKUTYyZDJURmRs?=
 =?utf-8?B?WGlJOXEydEJOQ3dGekY5UjBVOE9rSzV0WTYyb3gyRFhkS1ZoMmhUdkRTQk1n?=
 =?utf-8?B?S0dzb0JNbmFhclVjRGlXYUxKZU56ZHI0Q1VxYi9wSTlxLzJHQ241Zi82Zndz?=
 =?utf-8?B?L2FsWXV6bWtETEpKejJGdVc4R0FOTnpQNWs2QlVZeXBwWXpWL2hJOHJvbllB?=
 =?utf-8?B?UEhYbzA3d0R0ekY3TFFFdC93bHVrdGo0enRDYVZmQTRQWkp2V0ZKK3Rvand3?=
 =?utf-8?B?NDZ3TThCTzdqSG43YmhhMG9UZ21QSTNiNUJGZXMyalZhQVUvRjErbk1YT2Ur?=
 =?utf-8?B?U09JMzVEdGU0QTFIUVI1S010cVRWOUpDdmZZTnFXU3hhdWxPMnZiVS9CdUM0?=
 =?utf-8?B?K3Zkb01XVG5QVXJyYnV4eGk0MkJEQUpqcVhRTHJDYitDTUpBbG9FYng4dlJz?=
 =?utf-8?B?aHowVjFTb0JaZFFPbnRzeEVJVlBhVnZaTXpRcGtkc2dWamNsR2dQVlJVY0tJ?=
 =?utf-8?B?WUkxRkkwVHhNekR5OEhPRE9meGNjSEFmN1RHeFdaenp1V0NKaWZjZDJYTlVs?=
 =?utf-8?B?NnlLWGlJWENPUmtiZDJRQXorSnRUL21oTGhqMkRPRGEyaTF1YkNCelkxMVB5?=
 =?utf-8?B?V3Fsc2NvZVBQbSsxQnFHaXV3bC9GUkVlSE4rY1lveWJmK0I4NTVBcU5DM21a?=
 =?utf-8?B?aXBUR1hWWDRwcitNVkMyb25ReEtBbGMzZWErR1FyN2RwdWQ4N3ZZczVwekRZ?=
 =?utf-8?B?eHJleHZlZEZOamI1djlkdmQwQkJ4MTBCUnlFVnlVOHh4ampuSHpRVncyL2VE?=
 =?utf-8?Q?HqqSIZVLGlvQO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWhIT1Y2cWREaFM0VVhDclY5SlJMYm93djFsR3QwWnNDajRSY3R3KzExS1BO?=
 =?utf-8?B?N0FoNDZIZkxMNXRlZVZJd3prWEhCdGNDbW1uSVN0Wlhmdm1kYXFWQWhZNWNp?=
 =?utf-8?B?NDl2MjZZYTFvaGwwRzdVa0FYRVhSNit4UWR5MGlJc0dYY1VUak1GQWpMRXJX?=
 =?utf-8?B?eEFLeHFrdTNDQWRsOEtxMFZJZENuTG51Wm15Y21Wdm5vWENqVUVMQlVtV2ox?=
 =?utf-8?B?NFR0WmUvSkp1N0RZYVdNeEJnVXV6N3F0U0k5ZzFCMkdaUG0vNXluVHFEZWJ4?=
 =?utf-8?B?bzUreHBtZmEvcmg2UThLL2pJU1ljOUc3RHRwanBxdUpvZmgvRGdLckt4dEc3?=
 =?utf-8?B?ZkJOY0NLc2Q2OGM4Q3M3Rks4ckJXWGZRZXZ4TnA5aGxnaSsvOFlwUURMMGk4?=
 =?utf-8?B?OFhrdkgydmZ2QkhwZHpua1V5ajFDcDN0MHlNdUlCVWdNVlora3Yrd3orbG05?=
 =?utf-8?B?UUE4L0RDREN1L1Y5dDQ5ZHBVT2NCTzhZbVhTN2x0N1ZSWjNWQXJwRnBpYnQ4?=
 =?utf-8?B?NzNadENacUZWSnVGOEhFU1luTW9ITE5HOE5Fc3pwalhuNFZ3QWFmNEkxKzBx?=
 =?utf-8?B?cGRjbkZIcXFqbk5TejBhTytoY0h3OVlPVEFCczdVMXBLeENSb3EvWUVVTEJl?=
 =?utf-8?B?YkVqbXNISUVObmdFS0ZKLzU0bFhVd3Z2YzJuNGd5VXlROFBDbW5tcERZWUo1?=
 =?utf-8?B?L2YwUGM5WFh3MkMrYlJNZWNWa3dsdzNGcTF4bWpFK3BCbTRPNXV6MXNldmMw?=
 =?utf-8?B?aTFvK21RTzlYTkpRd2tRYkxKQys0SVp0VWNPZDYzSDl3bldxRmdacnN6OGQ4?=
 =?utf-8?B?VlpvazVieVNWekwvdHVWcU43QjVUOHBEWUs2aFgxOSt4L3pCSkh2Y3VlVHZn?=
 =?utf-8?B?czFia1EvU08zcGF3ZGFjMHdYY2RWbTZQV3VzeU9zVit2UDRlZ3BLZHJFOElF?=
 =?utf-8?B?c3hUVzRqYmU2NTBzRVdYakVlak9jRnk0TzM1ZzNqVTI0RDVDNE5NRURRLzFX?=
 =?utf-8?B?UXZMSzM2eTJTWnpsOUlhMTdiQlFDVWV0aW5vT3JuREIvSnNLSFZxandUaHZJ?=
 =?utf-8?B?eHNRWllpUGlZbUFsME5QUEtFYi81Ui84eXB3cmVXeW80QXowUzkzNExzWlpx?=
 =?utf-8?B?MjJ1YjRZaGd2R083SHczSm55Z09FRTdMUWhXV1gwVVhpVU5FOVNaY0xyY096?=
 =?utf-8?B?WERvdWJWUEZSM1RzVytLS1Qzc2pINXNTbktWTGhQbHpWVytPeFhPMWw0eVVP?=
 =?utf-8?B?SllQSEQ0dHRuRVJsQjlmeWNWOE9MZlR1QVVJTWtuRCt4WkJCZlNUb29IQnU3?=
 =?utf-8?B?eUtzUEJ1eEkyMzB6UkM2Mm9lYXNmVFAzbWhZZVR6MitMM2Z0NEhkaFJ5YTA2?=
 =?utf-8?B?aDdQL3pORUdGeG10ckFNOWk4YmxnZ0o2UEI2ZEtLem5BZ000VnpiSHZhY3B2?=
 =?utf-8?B?eXRlODVMYkc5Y2E1ZUtXU01uWHk4Y2Eyb0p2Ym80UnFQWW0reDU1aGxjRFIr?=
 =?utf-8?B?ekhycEo1cE9sWHFBRGxhd296QWkrWWl4RXBic2Zhd2h5SnAyT21KbUl1ZWlF?=
 =?utf-8?B?SERkNy9TVnkxZ1hwQlZoeDcxT3c1eEU3MytHOG5sVldSNXU3Tjd4amQ3dSsv?=
 =?utf-8?B?eWwwV01EVTVpODRJWjdNUTR4Z3MvRTU4Yk96YzRiNHFyV3JwNmw3SEhEVWNj?=
 =?utf-8?B?dFplZnViNER6YWNoUGhIbHRBbCtIS3F4WS9zOHVJWVp6QnI1cWw3aVZ5bXpk?=
 =?utf-8?B?V2xKWU9GRWMrSHNOTE9TdDM0OGZla1Q4MHJFc0VScDdwSGMyZE1qQXJlR1g5?=
 =?utf-8?B?NDM3R0t3aGFpaVMwOXNvaUVCQ2hQbDFyR0trS2JSYjRPeGRKOUZ5ckxmMFE3?=
 =?utf-8?B?VVQ1dEhGZkRwNnJIbkFoYmt2OG5pTWFYUy9wdDFNSEZNK0lKdWoyRkRZT3Rl?=
 =?utf-8?B?bXgvLzJWTzU0RGRPeDhoQndyZE84SWY3SUtQREQ0eEM5NTZmL09nZHhUZ21o?=
 =?utf-8?B?N3hzMWdIUENPVTJPMHJrZzJFSkMzMHo3OVBoT2wxVDVwL0MzczVLMitTWkRv?=
 =?utf-8?B?WEVLTUVvaGV0SE9uVGNmR2lzSmtZM1NKVzRLaUprM3AxOHFTUTl2U1EvTVVT?=
 =?utf-8?Q?5zL7GhQgeq9J9v1//K5bAdXPp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ad1322-fa04-4656-d46f-08dd2f11b839
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 11:52:11.0458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BZPM2m2XaNIQ5VhC4i+moFyNK+WhBZ8whouFbT7T/Tv5E8x7YvpSwaVN7nYamDaj9vo0gWcMqnhYSOZwH4p4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
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

On 12/19/2024 16:54, Bernatowicz, Marcin wrote:
>
>
> On 12/19/2024 3:48 PM, Laguna, Lukasz wrote:
>> On 12/18/2024 13:00, Marcin Bernatowicz wrote:
>>> Added subtests validating below scenarios:
>>> - auto-provisioned resources are allocated by PF driver in fairly 
>>> manner,
>>> - auto-provisioned resources are released once VFs are disabled,
>>> - verify that ranges of auto-provisioned resources are exclusive.
>>>
>>> The tests rely on ggtt_provisioned, lmem_provisioned,
>>> contexts_provisioned and doorbells_provisioned debugfs attributes.
>>>
>>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>>> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>>> Cc: Narasimha C V <narasimha.c.v@intel.com>
>>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> Cc: Tomasz Lis <tomasz.lis@intel.com>
>>> ---
>>>   tests/intel/xe_sriov_auto_provisioning.c | 399 
>>> +++++++++++++++++++++++
>>>   tests/meson.build                        |   1 +
>>>   2 files changed, 400 insertions(+)
>>>   create mode 100644 tests/intel/xe_sriov_auto_provisioning.c
>>>
>>> diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/ 
>>> xe_sriov_auto_provisioning.c
>>> new file mode 100644
>>> index 000000000..a5ae60525
>>> --- /dev/null
>>> +++ b/tests/intel/xe_sriov_auto_provisioning.c
>>> @@ -0,0 +1,399 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright(c) 2023 Intel Corporation. All rights reserved.
>>> + */
>>> +
>>> +#include <stdbool.h>
>>> +
>>> +#include "drmtest.h"
>>> +#include "igt_core.h"
>>> +#include "igt_sriov_device.h"
>>> +#include "igt_sysfs.h"
>>> +#include "xe/xe_sriov_debugfs.h"
>>> +#include "xe/xe_sriov_provisioning.h"
>>> +#include "xe/xe_query.h"
>>> +
>>> +/**
>>> + * TEST: xe_sriov_auto_provisioning
>>> + * Category: Core
>>> + * Mega feature: SR-IOV
>>> + * Sub-category: provisioning
>>> + * Functionality: auto-provisioning
>>> + * Run type: FULL
>>> + * Description: Examine behavior of SR-IOV auto-provisioning
>>> + *
>>> + * SUBTEST: auto-provisioning-fair
>>
>> As we have auto_provisioning in the test name then maybe subtest 
>> named "fair" would be sufficient?
>
> maybe fair-allocation ?

Yeah, sounds better.

>
>>
>>> + * Description:
>>> + *   Verify that auto-provisioned resources are allocated by PF 
>>> driver in fairly manner
>>> + *
>>> + * SUBTEST: auto-provisioned-resources-released-on-vfs-disabling
>>
>> Similar to the above, maybe "resources-releasing-on-vfs-disabling"?
>
> ok
>
>>
>>> + * Description:
>>> + *   Verify that auto-provisioned resources are released once VFs 
>>> are disabled
>>> + *
>>> + * SUBTEST: exclusive-ranges
>>> + * Description:
>>> + *   Verify that ranges of auto-provisioned resources are exclusive
>>> + */
>>> +
>>> +IGT_TEST_DESCRIPTION("Xe tests for SR-IOV auto-provisioning");
>>> +
>>> +static int compare_ranges_by_vf_id(const void *a, const void *b)
>>> +{
>>> +    const struct xe_sriov_provisioned_range *range_a = a;
>>> +    const struct xe_sriov_provisioned_range *range_b = b;
>>> +
>>> +    return (range_a->vf_id - range_b->vf_id);
>>> +}
>>> +
>>> +static int validate_vf_ids(enum xe_sriov_shared_res res,
>>> +               struct xe_sriov_provisioned_range *ranges,
>>> +               unsigned int nr_ranges, unsigned int num_vfs)
>>> +{
>>> +    unsigned int current_vf_id = 0;
>>> +
>>> +    igt_assert(num_vfs);
>>> +
>>> +    if (igt_debug_on_f(nr_ranges == 0,
>>> +               "%s: No VF ranges\n",
>>> +               xe_sriov_debugfs_provisioned_attr_name(res)))
>>> +        return -ENOENT;
>>> +
>>> +    igt_assert(ranges);
>>> +    qsort(ranges, nr_ranges, sizeof(ranges[0]), 
>>> compare_ranges_by_vf_id);
>>> +
>>> +    for (unsigned int i = 0; i < nr_ranges; i++) {
>>> +        unsigned int vf_id = ranges[i].vf_id;
>>> +
>>> +        /* Skip duplicates */
>>> +        if (vf_id == current_vf_id)
>>> +            continue;
>>> +
>>> +        if (igt_debug_on_f(vf_id < 1 || vf_id > num_vfs,
>>> +                   "%s: Out of range VF%u\n",
>>> + xe_sriov_debugfs_provisioned_attr_name(res), vf_id))
>>> +            return -ERANGE;
>>> +
>>> +        if (igt_debug_on_f(vf_id > current_vf_id + 1,
>>> +                   "%s: Missing VF%u\n",
>>> + xe_sriov_debugfs_provisioned_attr_name(res),
>>> +                   current_vf_id + 1))
>>> +            return -ESRCH;
>>> +
>>> +        current_vf_id = vf_id;
>>> +    }
>>> +
>>> +    if (igt_debug_on_f(current_vf_id != num_vfs,
>>> +               "%s: Missing VF%u\n",
>>> +               xe_sriov_debugfs_provisioned_attr_name(res), num_vfs))
>>> +        return -ESRCH;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/* Expects ranges sorted by VF IDs */
>>> +static int validate_fair_allocation(enum xe_sriov_shared_res res,
>>> +                    struct xe_sriov_provisioned_range *ranges,
>>> +                    unsigned int nr_ranges)
>>> +{
>>> +    uint64_t expected_allocation = 0;
>>> +    uint64_t current_allocation = 0;
>>> +    unsigned int current_vf_id;
>>> +
>>> +    igt_assert(nr_ranges);
>>> +    current_vf_id = ranges[0].vf_id;
>>> +
>>> +    for (unsigned int i = 0; i <= nr_ranges; i++) {
>>> +        if (i == nr_ranges || ranges[i].vf_id != current_vf_id) {
>>> +            /* Check allocation consistency for the previous VF ID */
>>> +            if (expected_allocation == 0)
>>> +                expected_allocation = current_allocation;
>>> +            else if (igt_debug_on_f(current_allocation != 
>>> expected_allocation,
>>> +                        "%s: Allocation mismatch, expected=%lu 
>>> VF%u=%lu\n",
>>> + xe_sriov_debugfs_provisioned_attr_name(res),
>>> +                        expected_allocation, current_vf_id,
>>> +                        current_allocation))
>>> +                return -1;
>>> +
>>> +            /* Reset for the new VF ID (if not at the end) */
>>> +            if (i < nr_ranges) {
>>> +                current_vf_id = ranges[i].vf_id;
>>> +                current_allocation = 0;
>>> +            }
>>> +        }
>>> +
>>> +        /* Accumulate allocation for the current VF ID */
>>> +        if (i < nr_ranges)
>>> +            current_allocation += ranges[i].end - ranges[i].start + 1;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>
>> Handling cases where one VF can have more than one range of resource 
>> adds extra complexity to the test logic. I started wondering if we 
>> should consider such case as valid. Maybe we should assert earlier 
>> instead?
>
> You mean "+=" complexity ?
>
> current_allocation += ranges[i].end - ranges[i].start + 1;
>
> vs
>
> current_allocation = ranges[i].end - ranges[i].start + 1;
>
>
> and
>
> /* Skip duplicates */
> if (vf_id == current_vf_id)
>     continue;
>
> vs
>
> if (vf_id == current_vf_id)
>     return err;
>
> in validate_vf_ids ?
>

I though that some conditions and operations are introduced because of 
the support of multiple ranges, but that was my misunderstanding. When I 
looked on this again, it's fine.


> Maybe we can move the validate_vf_ids to the lib
> or after agree no duplicate ids/gaps allowed return sorted by VF id 
> entries from read function ?
>
>>
>>> +static int check_fair_allocation(int pf_fd, unsigned int num_vfs, 
>>> unsigned int gt_id,
>>> +                 enum xe_sriov_shared_res res)
>>> +{
>>> +    struct xe_sriov_provisioned_range *ranges;
>>> +    unsigned int nr_ranges;
>>> +    int ret;
>>> +
>>> +    ret = xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res, 
>>> gt_id, &ranges, &nr_ranges);
>>> +    if (igt_debug_on_f(ret, "Failed read %s on GT%u (%d)\n",
>>> +               xe_sriov_debugfs_provisioned_attr_name(res), gt_id, 
>>> ret))
>>> +        return ret;
>>> +
>>> +    ret = validate_vf_ids(res, ranges, nr_ranges, num_vfs);
>>> +    if (ret) {
>>> +        free(ranges);
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = validate_fair_allocation(res, ranges, nr_ranges);
>>> +    if (ret) {
>>> +        free(ranges);
>>> +        return ret;
>>> +    }
>>> +
>>> +    free(ranges);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void auto_provisioning_fair(int pf_fd, unsigned int num_vfs)
>>> +{
>>> +    enum xe_sriov_shared_res res;
>>> +    unsigned int gt;
>>> +    int fails = 0;
>>> +
>>> +    igt_sriov_disable_driver_autoprobe(pf_fd);
>>> +    igt_sriov_enable_vfs(pf_fd, num_vfs);
>>> +
>>> +    xe_for_each_gt(pf_fd, gt) {
>>> +        xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
>>
>> I was OK with not defining dynamic subtest per GT to reduce the test 
>> execution time, but I had mixed feelings about not having separate 
>> subtests per resource.
>> But the more I think about it, the more I'm convinced to your 
>> approach. For manual reproduction with specific resource we can 
>> define some test option taking the resource we want to validate (no 
>> need to implement it now, we can add it when needed).
>
> I don't have a strong opinion on this. The dynamic subtest logic 
> remains unchanged from the original version, except for the last 
> exclusive-ranges subtest, which was adjusted for consistency. We may 
> have fewer subtests/statistics, but each subtest should correctly 
> report if any resource "misbehaves".
>
> Thanks for review,
> marcin
>>
>>> +            if (igt_debug_on_f(check_fair_allocation(pf_fd, 
>>> num_vfs, gt, res),
>>> +                       "%s fair allocation failed on gt%u\n",
>>> +                       xe_sriov_shared_res_to_string(res), gt))
>>> +                fails++;
>>> +        }
>>> +    }
>>> +
>>> +    igt_sriov_disable_vfs(pf_fd);
>>> +
>>> +    igt_fail_on_f(fails, "fair allocation failed\n");
>>> +}
>>> +
>>> +static void auto_provisioning_release(int pf_fd, unsigned int num_vfs)
>>> +{
>>> +    struct xe_sriov_provisioned_range *ranges;
>>> +    unsigned int nr_ranges;
>>> +    enum xe_sriov_shared_res res;
>>> +    unsigned int gt;
>>> +    int fails = 0;
>>> +
>>> +    igt_sriov_disable_driver_autoprobe(pf_fd);
>>> +    igt_sriov_enable_vfs(pf_fd, num_vfs);
>>> +
>>> +    xe_for_each_gt(pf_fd, gt) {
>>> +        xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
>>> +            if 
>>> (igt_warn_on_f(xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res,
>>> +                                              gt,
>>> +                                              &ranges,
>>> + &nr_ranges),
>>> +                      "Failed read %s on gt%u\n",
>>> + xe_sriov_debugfs_provisioned_attr_name(res), gt)) {
>>> +                continue;
>>> +            }
>>> +
>>> +            igt_warn_on_f(validate_vf_ids(res, ranges, nr_ranges, 
>>> num_vfs),
>>> +                      "%s: VF IDs validation failed on gt%u\n",
>>> + xe_sriov_debugfs_provisioned_attr_name(res), gt);
>>> +            free(ranges);
>>> +        }
>>> +    }
>>> +
>>> +    igt_sriov_disable_vfs(pf_fd);
>>> +
>>> +    xe_for_each_gt(pf_fd, gt) {
>>> +        xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
>>> +            if 
>>> (igt_debug_on_f(xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res,
>>> +                                               gt,
>>> +                                               &ranges,
>>> + &nr_ranges),
>>> +                       "Failed read %s on gt%u\n",
>>> + xe_sriov_debugfs_provisioned_attr_name(res), gt)) {
>>> +                fails++;
>>> +                continue;
>>> +            }
>>> +
>>> +            if (igt_debug_on_f(nr_ranges,
>>> +                       "%s contains unexpected ranges on gt%u\n",
>>> + xe_sriov_debugfs_provisioned_attr_name(res), gt)) {
>>> +                fails++;
>>> +                for (unsigned int i = 0; i < nr_ranges; i++) {
>>> +                    igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
>>> +                            "%s:VF%u: %lx-%lx\n" :
>>> +                            "%s:VF%u %lu-%lu\n",
>>> +                          xe_sriov_shared_res_to_string(res),
>>> +                          ranges[i].vf_id, ranges[i].start, 
>>> ranges[i].end);
>>> +                }
>>> +            }
>>> +            free(ranges);
>>> +        }
>>> +    }
>>> +
>>> +    igt_fail_on_f(fails, "shared resource release check failed\n");
>>> +}
>>> +
>>> +static int compare_ranges_by_start(const void *a, const void *b)
>>> +{
>>> +    const struct xe_sriov_provisioned_range *range_a = a;
>>> +    const struct xe_sriov_provisioned_range *range_b = b;
>>> +
>>> +    if (range_a->start < range_b->start)
>>> +        return -1;
>>> +    if (range_a->start > range_b->start)
>>> +        return 1;
>>> +    return 0;
>>> +}
>>> +
>>> +static int check_no_overlap(int pf_fd, unsigned int num_vfs, 
>>> unsigned int gt_id,
>>> +                enum xe_sriov_shared_res res)
>>> +{
>>> +    struct xe_sriov_provisioned_range *ranges;
>>> +    unsigned int nr_ranges;
>>> +    int ret;
>>> +
>>> +    ret = xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res, 
>>> gt_id, &ranges, &nr_ranges);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = validate_vf_ids(res, ranges, nr_ranges, num_vfs);
>>> +    if (ret) {
>>> +        free(ranges);
>>> +        return ret;
>>> +    }
>>> +
>>> +    igt_assert(ranges);
>>> +    qsort(ranges, nr_ranges, sizeof(ranges[0]), 
>>> compare_ranges_by_start);
>>> +
>>> +    for (unsigned int i = 0; i < nr_ranges - 1; i++)
>>> +        if (ranges[i].end >= ranges[i + 1].start) {
>>> +            igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
>>> +                  "Overlapping ranges: VF%u [%lx-%lx] and VF%u 
>>> [%lx- %lx]\n" :
>>> +                  "Overlapping ranges: VF%u [%lu-%lu] and VF%u 
>>> [%lu- %lu]\n",
>>> +                  ranges[i].vf_id, ranges[i].start, ranges[i].end,
>>> +                  ranges[i + 1].vf_id, ranges[i + 1].start, 
>>> ranges[i + 1].end);
>>> +            free(ranges);
>>> +            return -1;
>>> +        }
>>> +
>>> +    free(ranges);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void auto_provisioning_exclusive_ranges(int pf_fd, unsigned 
>>> int num_vfs)
>>> +{
>>> +    enum xe_sriov_shared_res res;
>>> +    unsigned int gt;
>>> +    int fails = 0;
>>> +
>>> +    igt_sriov_disable_driver_autoprobe(pf_fd);
>>> +    igt_sriov_enable_vfs(pf_fd, num_vfs);
>>> +
>>> +    xe_for_each_gt(pf_fd, gt) {
>>> +        xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
>>> +            if (res == XE_SRIOV_SHARED_RES_LMEM)
>>> +                /*
>>> +                 * lmem_provisioned is not applicable for this test,
>>> +                 * as it does not expose ranges
>>> +                 */
>>> +                continue;
>>> +
>>> +            if (igt_debug_on_f(check_no_overlap(pf_fd, num_vfs, gt, 
>>> res),
>>> +                       "%s overlap check failed on gt%u\n",
>>> +                       xe_sriov_shared_res_to_string(res), gt))
>>> +                fails++;
>>> +        }
>>> +    }
>>> +
>>> +    igt_sriov_disable_vfs(pf_fd);
>>> +
>>> +    igt_fail_on_f(fails, "exclusive ranges check failed\n");
>>> +}
>>> +
>>> +igt_main
>>> +{
>>> +    enum xe_sriov_shared_res res;
>>> +    unsigned int gt;
>>> +    bool autoprobe;
>>> +    int pf_fd;
>>> +
>>> +    igt_fixture {
>>> +        struct xe_sriov_provisioned_range *ranges;
>>> +        unsigned int nr_ranges;
>>> +        int ret;
>>> +
>>> +        pf_fd = drm_open_driver(DRIVER_XE);
>>> +        igt_require(igt_sriov_is_pf(pf_fd));
>>> +        igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>>> +
>>> +        xe_for_each_gt(pf_fd, gt) {
>>> +            xe_sriov_for_each_provisionable_shared_res(res, pf_fd, 
>>> gt) {
>>> +                ret = 
>>> xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res, gt,
>>> +                                          &ranges,
>>> +                                          &nr_ranges);
>>> +                igt_skip_on_f(ret, "Failed read %s on gt%u (%d)\n",
>>> + xe_sriov_debugfs_provisioned_attr_name(res),
>>> +                          gt, ret);
>>> +                igt_skip_on_f(nr_ranges != 0, "Unexpected %s 
>>> content on gt%u\n",
>>> + xe_sriov_debugfs_provisioned_attr_name(res), gt);
>>> +            }
>>> +        }
>>> +        autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>>> +    }
>>> +
>>> +    igt_describe("Verify that auto-provisioned resources are 
>>> allocated by PF driver in fairly manner");
>>> +    igt_subtest_with_dynamic("auto-provisioning-fair") {
>>> +        for_random_sriov_num_vfs(pf_fd, num_vfs) {
>>> +            igt_dynamic_f("numvfs-random") {
>>> +                igt_debug("numvfs=%u\n", num_vfs);
>>> +                auto_provisioning_fair(pf_fd, num_vfs);
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    igt_describe("Verify that auto-provisioned resources are 
>>> released once VFs are disabled");
>>> + igt_subtest_with_dynamic("auto-provisioned-resources-released-on- 
>>> vfs-disabling") {
>>> +        for_random_sriov_num_vfs(pf_fd, num_vfs) {
>>> +            igt_dynamic_f("numvfs-random") {
>>> +                igt_debug("numvfs=%u\n", num_vfs);
>>> +                auto_provisioning_release(pf_fd, num_vfs);
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    igt_describe("Verify that ranges of auto-provisioned resources 
>>> are exclusive");
>>> +    igt_subtest_with_dynamic_f("exclusive-ranges") {
>>> +        unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
>>> +
>>> +        igt_skip_on(total_vfs < 2);
>>> +
>>> +        for_random_sriov_vf_in_range(pf_fd, 2, total_vfs, num_vfs) {
>>> +            igt_dynamic_f("numvfs-random") {
>>> +                igt_debug("numvfs=%u\n", num_vfs);
>>> +                auto_provisioning_exclusive_ranges(pf_fd, num_vfs);
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    igt_fixture {
>>> +        igt_sriov_disable_vfs(pf_fd);
>>> +        /* abort to avoid execution of next tests with enabled VFs */
>>> +        igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, 
>>> "Failed to disable VF(s)");
>>> +        autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
>>> +                igt_sriov_disable_driver_autoprobe(pf_fd);
>>> +        igt_abort_on_f(autoprobe != 
>>> igt_sriov_is_driver_autoprobe_enabled(pf_fd),
>>> +                   "Failed to restore sriov_drivers_autoprobe 
>>> value\n");
>>> +        drm_close_driver(pf_fd);
>>> +    }
>>> +}
>>> diff --git a/tests/meson.build b/tests/meson.build
>>> index 2724c7a9a..01076f401 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -315,6 +315,7 @@ intel_xe_progs = [
>>>       'xe_vm',
>>>       'xe_waitfence',
>>>       'xe_spin_batch',
>>> +    'xe_sriov_auto_provisioning',
>>>       'xe_sriov_flr',
>>>       'xe_sysfs_defaults',
>>>       'xe_sysfs_preempt_timeout',
>
