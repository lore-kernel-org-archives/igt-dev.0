Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E5DE7E0BB
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 10:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A91710E3BC;
	Mon,  9 Feb 2026 10:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DB6oi0zm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B35810E3BC
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 10:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770632324; x=1802168324;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sUS2AyorogCvHE6v1YZWFNU1Ad3PqcYms/mb849UEgQ=;
 b=DB6oi0zm16GNzRIxx7Wja1bScEe78hWNflIGAUfHQr6r4opoQG6ZN6lT
 fSTnOa3WaIXY4BcDOoXXDfZbSP9+Uac6X7gNGCy7K0QqS76cdM9VNCNhK
 GVItTpmGA5lAfd9PFgmFP8+xnaUdJT9BluhKO761e4CE0dU4fy2vwOdUX
 6ej6YYA5Wm9z0kp01wIsJMEZ/0ZFI3fzraGTzMe8qFf/eqE9wrHeAhOHR
 9b6BV4ABmYQ3ZJG1xVH3140/UNs6fygj+iHcdDSHO2aSg8ApjvRcb7j73
 lF4PcK2dBVi5c/lLcJk6lk46x54f6Z8lzuRyEqKmyPGdxcUJf2IE9HCTK A==;
X-CSE-ConnectionGUID: 1RhF5rGTTgCHaeF6cDXk3w==
X-CSE-MsgGUID: dOIfErDiTFK6k6SDjq/8YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="82383756"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="82383756"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:18:43 -0800
X-CSE-ConnectionGUID: M7Z70YyDSjOgwgWJioaPnQ==
X-CSE-MsgGUID: xdRS0hZpQcG+vWgjde1FGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="215959346"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:18:43 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:18:42 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 02:18:42 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:18:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiQg9KnmUpLAwj2LPfv4Ile/V4q4zLSt25N1aFYh9CiKT0K2DcdtohjkCuZ7ruwcrW1Uz7egKA7FSWVFdOqpYzmwL+b1ZWWiR8fQSh/78sD38punjdebZldDcIranLZl3L+Jv/6Q9j/pppKcDNPhncbfDEVbpnl+3TcW+wGjBpxXtp3YF72ip8PrZbOxxKmI+LEUeIiqj6ujlkEoGYqIJSg8u9CqN1RTQzdZxBexMeUegCd1mK4RKJFl30vyTYG28yowZyn7blsV1l7NUR57pk2YbMA5L26rv2qnofY+k8iJfA46Ro28SfP+HaADNcgH5e3RvDJdzXuBGi2fIgVN4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VGG1BnxavwxoykDN8Is9XZX2mkVMc9SY9g6O/vuGG8=;
 b=je0Y1zW36aTiIsHu9sB3jZfLd6/AXyJgnHrIvnM5GpNuLQo+8XIwacLLZcOoeqYbUN7FShQDZXpYiHbvy8fRVKZiysL/o3M6m04z3YzNv1rY43C/YNJRly08fBiZwNwEl4BcrX81PbgbMGKlUnPcvuEW34Yo10mXdOObguz4SQM6cZjSyFJJwUEGMNPYeN/1fOfYnimKO0YBeqId9858PUr05l1F4R+748Be8INllxwNMQhntp4moQRUy3OjU56i0N+GwEn1YmYk1FxFsYjPzccaQqn3P6XBv3qXvSWi0H2XYt9J8+QEES7ych3QuPMEc4lTcG9BSj9oG5C/v3iNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS0PR11MB6421.namprd11.prod.outlook.com (2603:10b6:8:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 10:18:40 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9587.013; Mon, 9 Feb 2026
 10:18:40 +0000
Message-ID: <9b5ba33f-aef1-4519-9bb5-0d542dc92312@intel.com>
Date: Mon, 9 Feb 2026 11:18:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 6/7] tests/intel/xe_sriov_flr: Add
 --no-xe-vfio-pci option
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
 <20260204163217.121305-7-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260204163217.121305-7-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR08CA0022.eurprd08.prod.outlook.com
 (2603:10a6:803:104::35) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS0PR11MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: b22cf6b2-8bc0-436d-9e8c-08de67c4984c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHZldURJaHhrN21tckpmRjQ5RGhlb0pFZjNDMHh1eDdRVlg3UEhBNmMvd2d5?=
 =?utf-8?B?VlRHODdvY3Q1OUJORFB3Z2IvSHVHMkRBT0YyVngyU0Z5L2htNWpISVV1VWJk?=
 =?utf-8?B?NzQ2N1YrNWV2QVFvS2lEY2ZqVGxMYnBvK21MZXZwY2xXa3MvckZvd2V0eTFo?=
 =?utf-8?B?WERwSys0MjVkbDdMdUZSMGpFOHNHWExmZjNKRjRKY2tXcGI4bTM5c2RJczdD?=
 =?utf-8?B?ZWx0RVFlSG1XRitIYzVYT2xLVFFZL2VnRS9tSm9HTXNxeERrR0FYK29Hc0xq?=
 =?utf-8?B?ZW9mV3RyNnZaazR4aEFxMTVuQ3ZQOFZ0R0daVGwwN0VaV2Z5Vnh5Q2pXNlh1?=
 =?utf-8?B?Y1pGK2pUWlVpQ0J2WGdwQ3d3cmk4U1dydFBPQWhNbzBXWUZVWE41Nk01NGhu?=
 =?utf-8?B?b0tTMUtwZ1FwM2RnT3M3MTZ4cUQwUEFySmRaaHBlaGRkTTYyU2hoQVh5ZHpi?=
 =?utf-8?B?OGZxejMyRGZjbTdEYmRnQWxtei9EeXNaYnVZa0hjc2p2WGx6SlB6YUI3YWYz?=
 =?utf-8?B?Qm95V0swN3RPVHp0Mk9FTDgrc3U0eC9LcjZxcWdNRFZINHJlcmRtWmRpVlNP?=
 =?utf-8?B?M3lvRlUzYm04dEhCZVA3NnV4d25EbHFmQWlDQjFmZmZoVXVuZTUxWDNTVkVY?=
 =?utf-8?B?RkpndlpYZnpSUGY0R2Y2WHpLQ2lvZFI3S2VSTEw5aXljc0tCbmgvdDBBNVZC?=
 =?utf-8?B?OWt3aUxneVQ3Y3Z4Q3ZvSWgwWTJoTkxPd3dnejF1VnZDSnVDQkZ0MGJ5V3p1?=
 =?utf-8?B?Z2lJUGRpSEJ1aXNiOWtab2JNN0d3NVIwUTYvQWpHV1BXTnFvNWpGOUxkUVhH?=
 =?utf-8?B?WThTbGJIWE9qeTBEdTVIU21CYjBObEVaQ3VVUFNJMTlnYnU4TzRxS0ZUWk55?=
 =?utf-8?B?aTRLZThZR0x2QjFnT2VqNWlNNHh4K09MQ3RicDBweVZHcWllenZYY3dMMUd6?=
 =?utf-8?B?SjBGU2JmMFZndy82VS9RN3BvdlFVZFpXNHk3RWRad3EyTU8vWSsvN25jcDhr?=
 =?utf-8?B?Qzd0ZnVIblBRU0dab0xNZlJVcHN2ZkFWY21ra3hucW5zenQySG9pOW5mSzJ6?=
 =?utf-8?B?OVJ5NE1JYTNRVGhKblRDR1NXVWhMd0doMXhsTjYraVNabExWbXNrTzMybU9s?=
 =?utf-8?B?bXd6Q1gzNHpyelNqbVhjWnJMeGtGb2UxZXZSNVFBQVYvZTBxT2FhWVl1clF2?=
 =?utf-8?B?c2ZmM21WUGVUTUhsMzhpWjhIVU9SUEx0R01CTjBESlF1dDFXVHBzaFkzVmNH?=
 =?utf-8?B?WW01QkZTdElTai9VREdESmxIWVJVS1pOOTFHbVhJbjl1dE9RNzZxMnNSMEp1?=
 =?utf-8?B?bXdhdGg5Q3M1WXhhTGY4SllCS2pCQmEvd2JZRi9sem9hVkhqdERFWmpuSll0?=
 =?utf-8?B?bnVCNHo0TnhJZkVmenJ4eW1ubEJEeTBkUmRJUXcyV3RBMDFYWXdSemErTTJM?=
 =?utf-8?B?UEtnWTkwazFwSWtqeGFMcjhYZHlhL3lsVTJGUzNVcG5kWHdLclpOeG5LQjFR?=
 =?utf-8?B?eG5yY0p4bkRSZTRvMjlFL0ZqZVA3YXU0cGZ0d0N1eTJSSExGQTJ0ZjVqamtz?=
 =?utf-8?B?a1lyUXpCZEgwYTVEbllPaDRMZ1ovSG9wblJhNEttMnlZdTByZ29CODU0L1Ez?=
 =?utf-8?B?QlplaG5xRDdXVkhuOW0zSG8yRjV6V1p6QlRSRVc2YzJxdWhxc3QyWmNjbksy?=
 =?utf-8?B?TmI5VjNNOEh0aXVSTW1TUjdMUmNSa3Y3M0Q0ZkhXRFJVcDNGSndxQjVpbUxZ?=
 =?utf-8?B?dktxMEtxemlUcVdRMGFQeTlvN2RaQ3BVT0UzTVdLRVdmdkw1TlJ3ZTV4Wm9o?=
 =?utf-8?B?WUVieW1YcDNwaEluanpMekVCVFBVK2FRaHJWbmZUMy9kWER6VDgydSt1OExz?=
 =?utf-8?B?SVNQSzdjdVhZTHpCSEJHY0YrTzN4OW92NGNnMXo2dTM0VnFOdTMweUR5dWxk?=
 =?utf-8?B?OVBsYlpkaU93Q3NzVm1oREpoV21BN01XNlJQRmVSRktURUZmNXpvZDF2L1R2?=
 =?utf-8?B?ZWhUUlZWOXQweUVJWjVXZUk0WGVIa0VIMENzNVcvUDA4QTZPT2JsYlpGUXpu?=
 =?utf-8?B?dWdNNzdEbk9OcUxiUGFpVDRmYW1EdzNXSjdBV1FRbWp1SEt6N1l6alNnVW9Y?=
 =?utf-8?Q?BnbU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUVXWThOVURPSi8rK0ZNMzMyMnEvbUtOZVJxbFgwUnFOZWlZaTgxdm9BdXl1?=
 =?utf-8?B?WG0rNXNteUQvcVU3VW1tRE1SMWplMW9Ob3UvMnBOdzdZTkQyYXZqVmZ3U3Jj?=
 =?utf-8?B?azdYdExMZlV5VUJDcDlzVExtdnpSMkpkZXB5QldoQS91anR4SzdZWkw3azF5?=
 =?utf-8?B?d29ja1prbkdxOWtOeTIrdVkvbkxqODZzcnFUbzI3aWExd3cwVnV4eGh0QUNm?=
 =?utf-8?B?WU5idm5Vc0hicHY3UXVCMTQ0K2tJdDJLa2RJRFo2ZHhJTnRYYmEyRlA0a0JK?=
 =?utf-8?B?dGFBTDhuZmxlTG54bzlrQWtlQVhzSUZtSDNzYXBkV3V3eWVEVlpodjZZY3g3?=
 =?utf-8?B?eVMvL2cvMjdHQlMxQWVHWTdSeGdid2ZuVDV3cnhINjJQeDc0RGkzZEcwWThY?=
 =?utf-8?B?MDI5RGdZazdYcGpxMk5ITXBYM3Fyb0EzKy9MVzdQaWwxREs2SUVJMWJMdmN5?=
 =?utf-8?B?RmFFeGh5SEQxRXhlTGhvZ3VoK3FHR1hzbzgrQ1pVYWZjWXBUQURvM1l6dEky?=
 =?utf-8?B?WVNKd3dBeG4vS3hEZ2I2NlRtd0NQdFNONit5Q3BGSzhBTEc3eVo4UmNDRWth?=
 =?utf-8?B?d0FBL2t6K2lvVDA5Q2lDeFc2M2poS2IwTGwwNUFCT1pVZGJRNmR5cC8xemxK?=
 =?utf-8?B?OTNHUFZmSU9GTWtFVjd0Z0tKOUJvTGlaaEwyZll0YzFOZDRnQ3A1YVJtdy9G?=
 =?utf-8?B?S3dzK0twWnE5cUxhSDRoanZZSVNmUXVtYlBodWxSeENMR0QreVNYMlBjM2hL?=
 =?utf-8?B?ZkUrYVFxbCs1R1YybVBCUTY5VjMyS3YzRE16STVUdlhQTmYvWmxqZmlhcmtt?=
 =?utf-8?B?YnA1blJqanZ2bWsxM3gxc21ZRW1kOGpIUXpTeiswRFNrRytyY0xEVzRDZHRz?=
 =?utf-8?B?MzR2UUNWSm5iU0NBQ1p4WXdNeXZQTVF6NFdvalFrVURnMjg0dTdaa0tjODhB?=
 =?utf-8?B?UithYU1TNUtUdHhkeTJvWDY2SUZnZDFBOXdmSlZ6amV4TDJoYWgvdW9HT24r?=
 =?utf-8?B?N0VZZEdwRCtxbkhNc1J2OVZ4RGVUUjdacXdRZDk4QmNHNlQ0blhpYUpDT3Y5?=
 =?utf-8?B?RUNDS3gvd21ISWxYTXlZTThnTjE3MHh4QkZSNTN5d1dGajhBSXd2K3d5SFA0?=
 =?utf-8?B?R3h0RGtlZGJWc0tUOCtoMFlxVU5tQ21vQ0RXemY0VjVlak92c0haZ0UzeHNt?=
 =?utf-8?B?ZVdoYjc5UTRYdzZlcFlUcWxUQmFhenlyNGVsZkhpcGhtalZldnN5bGhlZmZN?=
 =?utf-8?B?VXBNSlZxTURJZTdlSEkvYUxvVytqc05HSU1qZXRMSCt5c2hSdWVKNE40RFpk?=
 =?utf-8?B?aDJJT1MwaWRxVHNvU3RnUG1zL3g0alV2UFlVTmlja0dud1p1WUd0cWtWTENw?=
 =?utf-8?B?c244R2RmRzdXbThtcjFwRmtPY3dTU1J1T1lSalFBV2MyV1AwNTJhYlVxUnIr?=
 =?utf-8?B?MG9HNDIvbDhZVVNiYjM3VnhodG5jcDI4ckhrTWtJYVVqM050WThqKzdoREUw?=
 =?utf-8?B?UUltNUxEWG9ZdlBxbDZCNXlNT2UxNWQwNzZyV0ZYcWk4SHFJa0ZuNTZPUDE3?=
 =?utf-8?B?YUxFb0pZTExEQkRVMmUwbVlpSkkvVGtSZXlmdnMwV3lyMURLMVBxOWJZMDRK?=
 =?utf-8?B?ZlpaU1FKbGkxNEUwUjkrS1lybkJZR1puUGJqNDUwRVBzTGtMNndNMU1iWDI4?=
 =?utf-8?B?Yk5rckhjUktGSENLbG9XWWt3TkVudFZiZmZ4ZGIrVGRwMlhqb3IxN05PdWhk?=
 =?utf-8?B?SE0wS2hzeVNIdkRNaXhzamo0WjYzZTltZENhdk5Yb3ZKVXJZKytFeDBnRjBw?=
 =?utf-8?B?a0ptdFVFOURYNjNmMnMwRmdlNTlaL3k5WVkwNWNpZ0lKcWIwZzQwdk9uRU5h?=
 =?utf-8?B?TkM3L2pMdlc4Q3F1anlKaFExK0FqMHFPYzh4ZWtpK2ExUm81Z1pIQ0ErKytm?=
 =?utf-8?B?VjFWbEtDK1ZubGg5aENwZ2E3VFVVWXUyOHJneUpYZE5xUGpqK1RpSmduRFZI?=
 =?utf-8?B?dm4wVGpOMWh1aHRVTEo5RUZVYUZMaG0wTW9PZXZwcFJMdEhlNU51eklhVis0?=
 =?utf-8?B?RlJiWGZ5U2tZNk04RmtGZGFuV1lWd3dBWjRvUDkwcHE4NktLbS9uS20xZE1i?=
 =?utf-8?B?MEZKNk4yYUtiMi9JcEg1T2RHM3RxR21Zb0w1cWNxRkxoOEpZcVQvMDk1WFF5?=
 =?utf-8?B?UFdwWmd3eEFGdTY0aHpLZjNBZ0UzeWVJcnNUeGtHS3FiYnA1LzJFaG1EY0RG?=
 =?utf-8?B?U01SMDUzbm9GOTBTOUJOVU9DL3FVMDFaVmFHSlN4eXBwRXFQMVo2bS8wOThU?=
 =?utf-8?B?YWk1NGxWSnYzQ25sTlJWWFAwSWRaSXlkZUJwd0M3ZlljNDM4Yi9vdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b22cf6b2-8bc0-436d-9e8c-08de67c4984c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:18:40.1424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9M16XQQ0I/yrBeOkolcbEUsj6mksu/QcZEwwKfKL+kcv82IHm/9jY0C8+Nd2waXeAzUmczbqbgMo7XGfPAshw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6421
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


On 2/4/2026 17:32, Marcin Bernatowicz wrote:
> Add --no-xe-vfio-pci to skip loading/binding VFs to xe-vfio-pci.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   tests/intel/xe_sriov_flr.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 951628159..b73727787 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -63,6 +63,7 @@ static const char STOP_REASON_SKIP[]  = "SKIP";
>   #define DRIVER_OVERRIDE_TIMEOUT_MS 200
>   
>   static int g_wait_flr_ms = 200;
> +static bool g_use_xe_vfio_pci = true;
>   
>   static struct g_mmio {
>   	struct xe_mmio *mmio;
> @@ -385,7 +386,9 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
>   	if (igt_warn_on(igt_pci_system_reinit()))
>   		goto disable_vfs;
>   
> -	xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
> +	xe_vfio_loaded = false;
> +	if (g_use_xe_vfio_pci)
> +		xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
>   	if (xe_vfio_loaded) {
>   		vf_bound = calloc(num_vfs + 1, sizeof(*vf_bound));
>   		igt_assert(vf_bound);
> @@ -1097,6 +1100,10 @@ static int opt_handler(int opt, int opt_index, void *data)
>   	long val;
>   
>   	switch (opt) {
> +	case 'v':
> +		g_use_xe_vfio_pci = false;
> +		igt_info("xe-vfio-pci binding: disabled\n");
> +		break;
>   	case 'w':
>   		errno = 0;
>   		val = strtol(optarg, &end, 0);
> @@ -1113,14 +1120,16 @@ static int opt_handler(int opt, int opt_index, void *data)
>   }
>   
>   static const struct option long_options[] = {
> +	{ .name = "no-xe-vfio-pci", .has_arg = false, .val = 'v', },
>   	{ .name = "wait-flr-ms", .has_arg = true, .val = 'w', },
>   	{},
>   };
>   
>   static const char help_str[] =
> +	"  --no-xe-vfio-pci\tDo not load/bind xe-vfio-pci for VFs\n"
>   	"  --wait-flr-ms=MS\tSleep MS milliseconds after VF reset sysfs write (default: 200)\n";
>   
> -int igt_main_args("w:", long_options, help_str, opt_handler, NULL)
> +int igt_main_args("vw:", long_options, help_str, opt_handler, NULL)
>   {
>   	int pf_fd;
>   	bool autoprobe;
