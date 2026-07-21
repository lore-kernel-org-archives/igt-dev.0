Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D69C44529
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 10:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D896110E323;
	Tue, 21 Jul 2026 10:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ju/K5SY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E0010E323
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 10:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784631365; x=1816167365;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FoSGuMW+OONeiw4yoO72ZtSLQZ8ew3mZVTt8qKhrR2E=;
 b=ju/K5SY4Mg4nEWssuZKLnxP5FIUNGeNaVdrFHQ9mKd3LBXW/zHv4pV0t
 JIesz9d7+D5BNN77Mv/1rMP6kicZya2Y3Kkek6HbSUGfGlqxUIjVKqto8
 7CuuU/1+XQKfWha0HhVfrnPNCxq6Mg/jv3KRY6WBZqn+9d/3AinPtWBjM
 U7tWymaYrdKhIhxDhC9Pn/5AFtMHsqD0QHxhZKyJiflqLzbgy+NuEjU8y
 46c+DKNf/mHjHnxznkyffE/Df45tKD4vq9iADNeB06ZhSuctwFj/g6zM5
 kQQUnsEJLkYyrMbtYaczdNeJU4dCCyuxq0htJWHou6WApNR6JTjwTInqq w==;
X-CSE-ConnectionGUID: J0ZTTq2ETqeBP9nQIVkOXA==
X-CSE-MsgGUID: Jl0KiaO1QwKG1QQlN0qRsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="95879695"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="95879695"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 03:56:05 -0700
X-CSE-ConnectionGUID: yis592XXTem21HjxgT4I1g==
X-CSE-MsgGUID: pXaaiZwaSX23yFbVHYCq7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="258374809"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 03:56:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 03:56:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 03:56:04 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 03:56:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNpRVKi2B73lBU/fOMspEdRVM3kLddin1hsfUHInvF7meB11LU5h18OKtPllX+dxr+6cvh9Q2CwJiDyDyaD8vYk3fWPuZX+BXphLsKVu4kVTolQ6o6H0IDnGFfkWgphxNZcRYNkbxWXr8ylBlWJxX+DjIGJz6JboveSDwYn0kU5F1oE0uCHKUoJ5wQ5lMQOotCl0gYsJ/GgelGkp7tOM77tkNzJJ8FTE0jFB6L7jTpv5FkSiMEon6fjMKCHjGTMb1pixYrrG1l5NNTCXyeVuGaXSJN4R4EJ2c8tmzAWbNRi0vg1K5PZOdj6YLfwMKXc8m7Fo7radR0l25oUlbYJ/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVHRbU763MJ3O2RYDF1llRgCf/J/onAbjWm5AxUP+s0=;
 b=R1zP2+8FbKMNBRUHRd6UreZ39RT0lhZBv+Pkw34VBh6CA8QAkpeoG7H4GcWaWZx1jmiqRDCEEqN4ejqKMLxgqlK3LiFZf6PAkS8kU+YAheM8ktt5+gBkjHf2xfdrLzMWFBwb4oFVz+E2C3gQM5WLz/QFpnZ4Dh43qoz+Tfs3uJrDLAmLnvFGCeKMAamBCK5VHBYvYvpxAKsqGQdGvhp6zKZLK2bSp8QIrpvzrfoO9vDy+PlkHbLQZVrHyqWiAxohNiK91SHZVO7LzLiZyZXpKBzdvOraXH0sZ0d0xvwnEjPi7EdB0fzL+iDM6QC+9vBqYyM02JTTkyzgs58/huGSYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 10:55:54 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0223.015; Tue, 21 Jul 2026
 10:55:52 +0000
Message-ID: <88217722-843f-46b7-a2e5-a05262243b4c@intel.com>
Date: Tue, 21 Jul 2026 16:25:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] Revert "lib/kms: Set
 display->has_plane_color_pipeline automatically"
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: John Harrison <John.Harrison@Igalia.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260714144532.351294-1-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260714144532.351294-1-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0212.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::9) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|CY8PR11MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d68858-d2d2-4a02-4327-08dee716a172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LadOgbqc9/OYW5NUzCfZF9rMSH2dZQdQoamRoQT5JM7AtKgo2hoF2L8j8K2kE8Or2kzo8Q3zXXuH5sV85UhPZb+kgNnjAFIJ+l2u9gnC3M86TDtIsdlHtUhjY8fWiBDdHFdN7mxp9l0DZfnm/53GpMOpDyPvi4paorcdUxx1v0JE7aQOy5emh/OC/C5/jT6SS9TV041VxUyxLzIw93dkDEyjxaFPx2Kne9RAQ2w7AxoGswckLcEUVOJmghaeL2kF+Dx7wjyS/PTIXQP7BJPrE193m/3ZYG89rdVaHp8k6g+qtkDeeGBvJXfe2hDjqn8pLCK4EtdjwVs5uOL8mGq8JdLhyYaOv9zJlLcZ9b0EtueZDe9iiExPFJAg/dqCi7AsTGyft9DrTSGA5XrELELD4LG5AA0WpjjEAx2U97i/W4eqsfM8pTYPl9TbhihyJBt18Wyoy3mvImvEV1sZq6/9m733hBkJei5ub0dopf2jhSyxf7PDjLYzHJ8iogUXDV61w6JltWlszjkHceEFHfo4G6zZu9qAaG8DpBXbzokRpeV6Ufgo/p9gm83HupzrAMgLD5m2KozPBuA5qPasYxuzeKXu9ljkUV6Dmdy1jR1c4iz91HrNWVPsUOKmV1FCf9U0A1+RKYUtatTbyR9U9BPfZ4TBhXOe4qDYZJwbzXQweMo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0lKR2Y1Y1ZhcHpTUENlMnV6WWk2amJNN3k2ZnI3NU5hVy9tYURjc0NXOU8w?=
 =?utf-8?B?WldFb3BYSUZZRURQb2puTllaOExyN0FaRlNJb3FZT3BpdjNyRU1xUWg0SHYx?=
 =?utf-8?B?MmJJVVhsZGxhek81WFJzZWJyOU0vZG9ab05xSUdKOVF6OGhhcFV1TXRtRlla?=
 =?utf-8?B?QVdaNk1oTjVBM29TOGNJSDBQYXNpWFJ4Z3hRRHd5STNiZ2ZGRHlCZmZpNmR6?=
 =?utf-8?B?aklpcHpzMmhRbC9ub1AyMXlJVmNHR1E5eFRHUUFtUUw3UlBrb1FSbk4zcVRP?=
 =?utf-8?B?WkZBeUhpdWdiT1dROG5aOUJtZ1JFTlpiVVBRY1Rqb2VuRklyVlFrMzlabGhy?=
 =?utf-8?B?WWs5NW9rSjRld1prYzJyZzU1VCs3Q0VUa0QrUEtvMUsvZ29iSVhNQjh0MUdh?=
 =?utf-8?B?cGh0amFIVXJGVHJvMjd6V0UrNDRSRzJNOStUZ1ZZNHAvZUExenU5Z2NyYnZB?=
 =?utf-8?B?VFhmZzRvckpxbG1wbVVVQjFOYVI1NlNqSUZ2bVh0M1NCYjI1eW1mMmZHVURQ?=
 =?utf-8?B?dnNCdUt1c0thcnRjeUlNSGJ3VTRGYmpocjdGYU04dTZjb0tPVXorSWhaOWpJ?=
 =?utf-8?B?OXJGWU1NZnNJNllhME0zZGxEdEFGQlYzTDNmeXhVa3FsRkJsWWFDRFIxOVp1?=
 =?utf-8?B?WHdFbTNJKzRJdzh0cDNQa3lIUFcyY3RJVmJkdFROK3B2bGlrUTRGUHdOZ3h2?=
 =?utf-8?B?SmFyNmtWbEphK25nWTBXSnUwNjZ1L25yWTdkZCtKS0pOQmd6czM2VVo3K1VD?=
 =?utf-8?B?WnhyMGZ0RWhGK1lScmkyVHBhOE9LcEV4Z29NUUR3aXVtOUFvbk9yKzRSdDIx?=
 =?utf-8?B?UEpDSkl1elBZMHBWYktsVzRLbjJPYk1ITlVITGd4bXB1SU05UHBIRjc5Mmp4?=
 =?utf-8?B?YURjQnQ1SXBFSjA2WmxDTkYrcDcvd1A5K0U1V3FqSDlGVHVnTmwvVXVuNFdY?=
 =?utf-8?B?YjNBTEdHcDhzNzMxZElMUnB5d2ZxSCt5Z25uU1p3aDYyU29mdHh5ZmJnMm1R?=
 =?utf-8?B?NHoybDBaYVhTSmpBMEQ3VGFlR3JFdUwxZVkvUU9GV3RXL3NJTTRuVTl2ZmdG?=
 =?utf-8?B?QkNsUmVYZXFEWU0vbTQxR253dWFLa2d3dmdHMktIeENFR0tEUC90K0dTUEU4?=
 =?utf-8?B?QzkxMXV2N3hJTWo1UFlFYngyL0V2MTB6ZzFOTmY5UkdIN1kyQ2xCZlFPNjlQ?=
 =?utf-8?B?WHRLZjM3YURjZ1dPc1ZNUTA3clZnaVhyVUk4RHFaeDRLZXZyNTNFdk1WY1NT?=
 =?utf-8?B?bUR3dEIxU0g4VVZLK2tZckF0dHRnOWZmVTB5R2FwWmkrR2Z6YTJQSE0zcWg3?=
 =?utf-8?B?bENGODJ1czM3NTI0RWpMVE9RSTg1VE92d1dyY0o1Rm1mcUV3c282V3FpZTVB?=
 =?utf-8?B?blEyS0FUb1pPWVZVUTd1eWlDbDhVYTY1SDBhZ1h4N252M09lY00zQitvZ0Z1?=
 =?utf-8?B?R3MyQWFuVWlKaEFTOTZrdE5wMmJnU0kwK00zNCszckJwWEV4WGludjkybTB3?=
 =?utf-8?B?K2ZjaEJNVjhOUkV0TG5LT29EdU9LVWxTZVI5Mkd6R1ZuMFJ6UlNEMmJxMDJr?=
 =?utf-8?B?QWZST3FMc21RMDVEUzJqakt0NytzYWJoTDNBT2NGYlk3WlhOdm5DRmVvaUtU?=
 =?utf-8?B?M2RiU05PQzhwMzY4UEIyNW1pSzRMWFFKYnJLLzdQZGl1QVNKYWpwQW9Ed0x2?=
 =?utf-8?B?WXIrak5EZ01rYnE2MTZXUExROG5BZVVHdE4wMnJUekpUbjYxNmhBdk8wVFkv?=
 =?utf-8?B?QzdQUG9WTTNwbEpQS0gxWGttOHVWWmY1bXBqY2M5bWJFTGQxWEFma1A3ZEFr?=
 =?utf-8?B?ckhkeE1JL2s2VTI4bEhRcXJJSjNWTTdRcThscm1EWjdUVUNqQ29FaWxFSEI1?=
 =?utf-8?B?eVRaTWM3dFhvdU9OTDY0VXlReEg2N3c5NzM3b290TXhyeWFkOVphTWptblc2?=
 =?utf-8?B?bGRVeG1sc2pLS0s1TTZRODhETzd0V00xalF2NUZ5V1BMbDF6bTkzMFZBYjAr?=
 =?utf-8?B?QmdsUSs3N1A1MllYOExuTUFHcWd1aHJjdVc3RmFiMHk3azN6N2lyaGdiOGdG?=
 =?utf-8?B?MU85Yk5scm4zTG0reVBram9KTkNuTmdIckZXL2xnWGMxeE9xeHU2NzJRcW1V?=
 =?utf-8?B?OURiekZsMmhtQko1dTlselMxVklOMHc1K2EyWVVBclU5MGpIaTNZTWNERWd6?=
 =?utf-8?B?ZW9aNFh1NXlrSVNqN3lWbk55QmQxRGpWWEhGeTRIUjFJckNnY3lHanZMc2RF?=
 =?utf-8?B?QWVsbTZOTkJRQnNqbGxRM0JxelNINnFpYkJkR0JJRmJGUUcyVWxhN3I2dXZP?=
 =?utf-8?B?Y1NjZEFyUXU1S3lxRnd6aGJPbFhnd0NXVHR2V1paK050Y2NES2Rsdz09?=
X-Exchange-RoutingPolicyChecked: ARH+DAargQSw1zzM1JWo1Q2UTRGiJt9NEFO3i3CiF0qY03sZtSOgR8bsqtImvZflW6ToxrlTXjdbl90hcia+EpXXMLN9CckK50SrCLmDg7ncR041Tm3bexjMXWR2HUVgKXW/l/Nx0fsXFik37367X1DYWKOMF73LQFWtac5E/w0mVFewuzsKJIAMDgvgqPB0VSgpTaGfbRHG0qzPKtJvmKoqPKLE9QeFF/FnYmYSLeKTSHD/7CBV3Das/S/vQ3y9svf7ILWm0Vf7AhCH5tZ8aFk6wNnXjgJMYuAL2oOLOSmYIAoE9iLuFuFshpxK6m+MD0FJsooZh/6wBiM/PEw51g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d68858-d2d2-4a02-4327-08dee716a172
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:55:52.2423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J12ALVM3HAw6j4Tqbqyj4KLTIxLS0FidTBoEsAEPyEsMdhjczjpurGXpPuLBs1PmobVUVJA2FER0XCfuKuLaVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
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

Hi Chaitanya,

On 14-07-2026 08:15 pm, Chaitanya Kumar Borah wrote:
> This reverts commit be4e98c3b79e8bb843f7bb762616742691fee72e.
>
> Enabling DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE from the common
> igt_display_require() path makes all IGT display clients opt into the
> new plane color pipeline UAPI.
>
> With the color pipeline client cap enabled, legacy plane COLOR_ENCODING
> and COLOR_RANGE properties are ignored during commit preparation.
> The driver cannot distinguish this case, because enum drm_color_encoding
> and enum drm_color_range do not provide an explicit uninitialized value.
>
> Revert the global opt-in and keep the cap enablement local to the
> color-pipeline-aware tests. kms_properties colorop coverage shall be
> preserved separately.
>
> Cc: John Harrison <John.Harrison@Igalia.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   lib/igt_kms.c              | 2 --
>   tests/kms_color_pipeline.c | 5 +++++
>   tests/kms_colorop.c        | 4 ++++
>   3 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2eefb773b..c56127c42 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3201,8 +3201,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>   
>   	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
>   		display->has_virt_cursor_plane = 1;
> -	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> -		display->has_plane_color_pipeline = 1;
>   
>   	plane_resources = drmModeGetPlaneResources(display->drm_fd);
>   	igt_assert(plane_resources);
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index 6119a830f..78860a845 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -349,6 +349,7 @@ run_tests_for_plane(data_t *data)
>   
>   int igt_main()
>   {
> +	int has_plane_color_pipeline = 0;
>   	data_t data = {};
>   
>   	igt_fixture() {
> @@ -363,9 +364,13 @@ int igt_main()
>   		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
>   			data.display.is_atomic = 1;
>   
> +		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> +			has_plane_color_pipeline = 1;
> +
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&data.display, data.drm_fd);
> +		data.display.has_plane_color_pipeline = has_plane_color_pipeline;
>   		igt_require(data.display.is_atomic);
>   	}
>   
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 4db83470d..16db0b8ad 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -418,10 +418,14 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>   
>   		igt_display_require(&display, display.drm_fd);
> +		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> +			display.has_plane_color_pipeline = 1;
>   
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&display, display.drm_fd);
> +		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> +			display.has_plane_color_pipeline = 1;

Can't we follow same local variable pattern as kms_color_pipeline? That 
will avoid calling drmSetClientCap() twice.


>   
>   		igt_require(display.is_atomic);
>   	}
