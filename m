Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEFDCD6E68
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 05:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F91112643;
	Thu,  4 Jun 2026 05:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDcpoonk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C159112642
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780550500; x=1812086500;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1VRkfe6nRpRcPBI1lBmOH4I2nPl/Ew/eiqCaDyBxHm4=;
 b=NDcpoonk8/U7hA7SvD+SxdZAibPDC+RlXS/ZLnavEixQ7Sck66e+rVPn
 q0yK/EwhjtSarDruMrU7dfUVIK+8UdvYqnXYMJ/YJqmbkCM7F/8qSh9mW
 XAtx161GLaSjy+R7EPbE017GbB8Js38uNsRF3xnkiRStCKJgX2K9NBbQQ
 f3VN+dK31hSGyrL8I9nEXOfA04uUje3G+sfkYxYc/0TeK7KDPiS01Q2k5
 zJ8ojSvkj4sYVhCQ+Bwdxyk6rJvf4e09nef86dtEboLXcQ4v+0grG1x4H
 sJZ+qZ5F57BtgTBBohozMNy3d1nUp6P14b2ZeL2f1A3pVDGXrtMRDNv5p g==;
X-CSE-ConnectionGUID: UdjdyrhgRdevCRbokfez6A==
X-CSE-MsgGUID: 6h59ZvCqSK2iAiTETRXSSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="106818386"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="106818386"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 22:21:40 -0700
X-CSE-ConnectionGUID: npD4a7dwRJ6S2vXc/l8Dmw==
X-CSE-MsgGUID: T6ifqnSCTUmQLzzUJpZDUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="282543357"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 22:21:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 22:21:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 22:21:39 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 22:21:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUG4fy9CNOH/hfbQ/hz1MpC7m3hm3XwXRxVD5FO6LHubX3PGJjrf/Nrgglw5e/+JwqkxDj+wzw2l3s4Bju67/uIs7LmOnpauoVVoru0pp6fRPMDmoFb/dqQJOazhX7U4WNqa5gNth0/Dcd5pELbSxDXFdl9UhUjfkXGOwKSpOZ18aqwM5aj8qModR5TFM55AgX814v3YHiLiRDeEx8MQS1CDzALJw5aCJ89ataJ36fRuAvL7Kc5tWtvTPiGjru2kkHReWX6q1mp89cTbXf1VfUAefxNAL7zGb1s93VHX49ubgWhTh7KhNvglVEXISo7xXNfzNYnXGPVL2xa4aFOOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2DgA3Jq5RdIXbZy9o027n0FhgUse6VKI+TaDtzvPSo=;
 b=mI/iFWv1nLzF+fHHU0BxOWRv3rqLlebhlwvtxSQs7CoQrJO4z2pPaXueb1NSoXrziM5ITr+xttEoLkDIfxS/Yx2cpUyRSBi8fWqsnewo+CqbRxb1OVJ0pwFuE9i7zy+kvDGfyAQcU+/6PKPlJmO/FzNaMxgIKlfL01RxE2iCPIR+MhDfSfsoD6cqaVOn6soe0UDRXi03kCKHPT4JuPz1xQkbvLUdqFwJCOWUSIn+04rv42r6Jf2zCLBzX3czpmtinDcK9pdSLIBebZfON4O/OG4lqlhwVqUoW33vGm88kpMADE83srBoOyOXMmV9Jfrxg6IDPpxmxU7fBcgIHFdy5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by BL1PR11MB5301.namprd11.prod.outlook.com (2603:10b6:208:309::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 05:21:36 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 05:21:36 +0000
Message-ID: <5b83dd5d-e37b-4c94-bd98-c765c6a246ff@intel.com>
Date: Thu, 4 Jun 2026 10:51:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v7 5/5] tests/intel/kms_dsc: Add force dsc and
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260530193640.2551688-1-swati2.sharma@intel.com>
 <20260530193640.2551688-6-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260530193640.2551688-6-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|BL1PR11MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: 745265ed-84b9-47ac-bc34-08dec1f92651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|42112799006|366016|3023799007|6133799003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vhBM8lQUXkDOyH2dKEsJUQqNz6dLU6bgRts58nNm1uwLaAj5r2mfKUGefyirjZCgOJ/uLUbFXXM7UJWClPZgOjIkEGslSBSF39EgTVnIblwqgBjzDpe7Lf7rSJq1ONB63fyavx2nGpO/Y7phwLMMn11E+jmlHN5FBIrnQB93Z6F4tehTJRaxKnOssRYkJH34b6UhLH4E2mhDC3PCuuwrdPzZrTTrsCstrFnUph0Hzwf62guaUAi3XAGfs+wDEHwxhNLGlrIb3JwSShrjG+Go4c8RZLHTmPDdH8/RLfS3F0U8PAZAaiJX7EQxuQX9Z2XcLCZdI0Mr/802qkD4RNgsc3+/HzZdLEsI+dgI9RtNsVgXAvoN2KSDb19vFBcfZSEhxTWFG9Z8d9kQvF/iywOyi5quyTPSkXMlEFIng/qcQSnO8ivfd9Be5dHtQKhP+0/FkZeVitPkDiaWQ8Vcl6qWAZeOi1EjFgFdw2yGO4/zzNDHBsKkczNqUGS1fXzlin+BGfCSyIodNLPvZRWh1bVeeHNaoSo19n7z8lF6tb1vaZwE6xlB4TIyLnxkl8F+c5rrJ12X/48e7iEj+l2m5Z8339LNYWFBpMEPRvd8NaraJHCKnF4gDUQhwndCohxFzT/5aDD1c1lSY9BQEZEOArmddi7dUh3Sf8F98B04CR8T8PUky+8d97pY9tyE/M/a9RBg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(42112799006)(366016)(3023799007)(6133799003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkhtNUFlejQ1Z1kzUDhrNHJSck1CRERUR0ROTlRtbjFpbWtqOGM4VU9KVHlw?=
 =?utf-8?B?MnpHVE9XVGw5T0o4ZThySzRTNmNrd25xQmtHbm95dXlLTjZKZVg1MEZKTDIx?=
 =?utf-8?B?N2FaSXpmSGROVS9yMnRrOWMwOEgyZFZBM3R5UzNUUFlCejFUZTRXc1NldGhw?=
 =?utf-8?B?VEowVDBGWVJQMW5UR2R5WVhEaUJ6OWd4blNHdzFFcWt2Sm9KMFpWcXVsNnRs?=
 =?utf-8?B?T3RlZ3lGakdyM0lDd1UrS3NwdTFaMHVlVlNWZUpCVHNVaDJ0RGNXZmRYRDlB?=
 =?utf-8?B?blZCM2VNa3lqMjhVNlNid2gzVkp3bHFDS01vamRwTVM0N0FxdW9sWEN0RXhq?=
 =?utf-8?B?OXlvMkNETzhlSHB4NCt0cmxYdVA5bjQ1dnV4eW4rN2d4UVkxd2xJRVk0bTVm?=
 =?utf-8?B?ajRkcnIxS0FGaEpPdEF4Q3RSVGl0UGRsdEVaVUIzNW02RTFjWWVTTGtHUmNr?=
 =?utf-8?B?VWlSeGw1Y3BFWWdOYklWQ0lORjRsb0cwVXIvQ1FjVkNqRUQvc1MzS1pOZWxX?=
 =?utf-8?B?Y0YzblNjS3RucEFIamkrWENqelhGWHAzUWNxV2paa3FjT1BlQUhQTUJXaVZQ?=
 =?utf-8?B?eDRXaVBrZWRneklHNDRTWENqblpWT2hNYngvd0xYK0tBSldoZ1VGNHJZTHQ3?=
 =?utf-8?B?TVlFcU00OHBIWlJqQWdXTmpjVEZFMWF0emY0VVQ5UUZleUoreXRxUllCMzNQ?=
 =?utf-8?B?OEV1OXlsRWFkWjFiT0l4NXZxeWNvQjF4T1RMcC9oQWYwYTNBYUlYemxCQXo3?=
 =?utf-8?B?RmxFVGJ4RjVNMFc0TlVpRFlaRkFCM291bjBxSS9ic2l5eGhxMm1IWmZOSmZI?=
 =?utf-8?B?a2tJRVpPVWl6Wm5SbXlJNFZyZEM4cHMvaHh0TllwRCswaTRFeEEwQkwwZmVV?=
 =?utf-8?B?TWk0L3daRnNtazNMTnN4T3Y3VFpVYmFQVGY0MVZiYWdFeXRqY3ZhUjlMWlBo?=
 =?utf-8?B?VCtRKzJXN3hEYWtiZ3kwY3BUSWs4ZUs0VEJuSlV0bXJGT1lveFpSTDQ2eklU?=
 =?utf-8?B?ZFZOSU00RzF1QWd5bnA1VGx6dlRUVnlybnZPVmVPb3ZYM1JheGpKK3dUeGJR?=
 =?utf-8?B?SERKNHIxMXppRk1VQWdYWmJlbmM4WVRjbGd5UnVreExPRG12WW5ZMjZITFN3?=
 =?utf-8?B?MTRCMFdGWHdFc08wUjIrT3o2c1B2WDVzTmVFcDBzUVNFTnFpWnNHL2Z1QnIz?=
 =?utf-8?B?QjZqNHNhQ21oYzRUTExLL2w2R0JvQ3JRM21jekN6WjlLK1BiOWI0aE42Rmh1?=
 =?utf-8?B?QzlYRERHME1leFpUL1c4YXNZWC9NZHFZb2NFM0hzMUtjL1M4MDMxMlE1Tkpr?=
 =?utf-8?B?aHdoMFRMZFdYa2oxck1rTENLdkQrUTVXcUU4aVA5VHZNeHkvNzVhc3hkSktt?=
 =?utf-8?B?czJYbDQyODhZc09KTGpNczRGcWV5U1lGOEdCU0Z5SjFMaEpJbS9BVk9ZUmJE?=
 =?utf-8?B?Z0lKcW1INVJjaFZlR2RVNFhxRmtDbTJmMU13eWdvWkZWZU1wSzAvbVdjdVFq?=
 =?utf-8?B?NEJOUHk4SWFld2hrZUY1T1JBUlAvWlk3NnR6Mlc4UkVGSm1jbFFiRXY5aWN3?=
 =?utf-8?B?bkJqdFpVcHJEYVBHQkNjZjRqVGNtWVJub0JYZEQ3aFNsWVd2SVUxTW9ycTlF?=
 =?utf-8?B?bTVPMDB1bzEraFhqSDVZV1R6TUk2ck80aEVCVHdZUk13a043ZTQvekcrbWw0?=
 =?utf-8?B?RmpQVDhpR2JWRVNXbVhSRVJETnFYNHZqZUd1ZEhYMVh0a0NON085QUxzMlhw?=
 =?utf-8?B?cmpCSE03WldQaEJ5WDliNFduVmtNRGpzRG1kNzFBc0R5c0hFbVZidGNEbEw1?=
 =?utf-8?B?SVMvYndTRjBHb3BzaU10WmpXbEdVaFVROWtMVHBCazdXMjIwZmNYRGg3U0ZD?=
 =?utf-8?B?dHNZdlBPV0x6ZzAzZHJYUUgzVFFrL2w1c0ZncURuWE5IRTZ6Nyt0c0FlY3Vu?=
 =?utf-8?B?NTVHdlRxR25nSGk1Z1FybFRWYXhhcHJQSnUySm0yT2hGTFV0OU5EQll6VHJa?=
 =?utf-8?B?anQzTis4SCtpcWtYQTVkRXk5SGgrOXhGRkUzc0dTSU9EZEpXQm5oUTRrOVpV?=
 =?utf-8?B?S1dxaXZxNmhXZ3BHUjFMOUVhK045eGJtaWxyc1dlT1BEblg2a01wa2llWlQ1?=
 =?utf-8?B?eGFUZ2NoYkhDNVZFMms5OFJBMWhmRW9Vc3FPa2twRXNrT1dmMkZ2aUhEcmps?=
 =?utf-8?B?enVJSmx4VWJVaEsyMDlKVUR1dklZeXljejBldDluT0U1ekxwckQyUU5jT0Jp?=
 =?utf-8?B?UjVxWjBlek9NcDM1Z0FjY1R2aFYyL2NlempuT05zZng2V2pMRFRNaHRQbzlS?=
 =?utf-8?B?NkEvRysrSWJRcnc3dFJwUVpSNlNIWHJtelpLV2JVaE91SmFvaVNBdz09?=
X-Exchange-RoutingPolicyChecked: Kh4N/SvYGQ77rFXKMENeb4+Ba+34GIClf0MfLK2Chnong4G6OwLUMnDA7igcP/a5sSpaqKjUxWqZTLUnbxtpamQyPg3bPE+Xh7bZrvAv3oC5Nfi9KvQ3lA4enYhaPQWwBDuffT7ALEQGhkq3cY6NuWlXpX6QhyHFuwblUFeRISrTaRrV7UgNGIb6JBVRZlb7bn3+2E/SfP0s2wh97BOVNMxs9o4EL2pTzFb/pf3i7QQdv7LNqXckf+HOuDFyNwF2N1dIMrMQiUYuYsuEI4x1PxT3yH6mOdQMoYtRkDC90AN92wyUxwD9D9TYXuzR4D7eKBAUyJqmuu+isNTXtvP8ag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 745265ed-84b9-47ac-bc34-08dec1f92651
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 05:21:36.8389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUhKeYR3k5FvTBElwUcQCjrD8fe8JxdXdG/5ii5gzp4+CoEbRSIegZ/xUXHGmyrfRDzuoMBkaAE1HV6zefQoYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5301
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

Hi Swati,

The commit subject seems to have a chunk missing, mostly a copy paste 
miss. Please fix.

On 5/31/2026 1:06 AM, Swati Sharma wrote:
> Add non-joiner, big-joiner, and ultra-joiner variants for all
> DSC subtests:
> - Non-joiner: if mode naturally triggers joiner, pick a
>    non-joiner mode instead.

Should the default tests be named non-joiner? Not a blocker as such, but 
just to call it out explicitly?

Either case, LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> - Big-joiner: if mode naturally triggers bigjoiner, go as-is;
>    otherwise force bigjoiner via debugfs.
> - Ultra-joiner: if mode naturally triggers ultrajoiner, go as-is;
>    otherwise force ultrajoiner via debugfs.
>
> v2: -fix if() for ultra/big joiner (Ankit)
> v3: -Add '-' separator in subtest names when using
>       igt_get_joined_pipes_name (Santhosh)
> v4: -Use 'enum joined_pipes force_joined_pipes' in data_t (Ankit)
>      -Use dsc-basic-%s format for subtest names (Ankit)
>      -Use igt_crtc_for_pipe() to check consecutive HW pipes,
>       handling fused pipe holes properly (Ankit)
> v5: -Use igt_display_n_crtcs() instead of open-coded
>       for_each_crtc counting loop (Jani)
> v6: -Explicitly handle non-joiner and joiner mode selection
>       based on display capabilities (Karthik)
>      -Use pipe check from helper instead of test (Karthik)
> v7: -Only force joiner when mode does not naturally trigger
>       the desired joiner type (Karthik)
>
> Co-developed-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc.c | 249 ++++++++++++++++++++++++++++++------------
>   1 file changed, 180 insertions(+), 69 deletions(-)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 093a16151..9f64dac6b 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -43,7 +43,11 @@
>   /**
>    * SUBTEST: dsc-%s
>    * Description: Tests Display Stream Compression functionality if supported by a
> - *              connector by forcing %arg[1] on all connectors that support it
> + *              connector by forcing %arg[1] on all connectors that support it.
> + *              Non-joiner variants select a non-joiner mode if the highest-clock
> + *              mode would naturally trigger joiner. Joiner variants use the
> + *              highest-clock mode as-is if it naturally triggers the desired
> + *              joiner type, otherwise force joiner via debugfs.
>    *
>    * arg[1]:
>    *
> @@ -55,6 +59,22 @@
>    * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
>    * @fractional-bpp:               DSC with fractional bpp with default parameters
>    * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
> + * @basic-bigjoiner:                        DSC with big joiner and default parameters
> + * @with-formats-bigjoiner:                 DSC with big joiner and diff formats
> + * @with-bpc-bigjoiner:                     DSC with big joiner and certain input BPC
> + * @with-bpc-formats-bigjoiner:             DSC with big joiner and certain input BPC with diff formats
> + * @with-output-formats-bigjoiner:          DSC with big joiner and output formats
> + * @with-output-formats-with-bpc-bigjoiner: DSC with big joiner and output formats with certain input BPC
> + * @fractional-bpp-bigjoiner:               DSC with big joiner and fractional bpp
> + * @fractional-bpp-with-bpc-bigjoiner:      DSC with big joiner and fractional bpp with certain input BPC
> + * @basic-ultrajoiner:                        DSC with ultra joiner and default parameters
> + * @with-formats-ultrajoiner:                 DSC with ultra joiner and diff formats
> + * @with-bpc-ultrajoiner:                     DSC with ultra joiner and certain input BPC
> + * @with-bpc-formats-ultrajoiner:             DSC with ultra joiner and certain input BPC with diff formats
> + * @with-output-formats-ultrajoiner:          DSC with ultra joiner and output formats
> + * @with-output-formats-with-bpc-ultrajoiner: DSC with ultra joiner and output formats with certain input BPC
> + * @fractional-bpp-ultrajoiner:               DSC with ultra joiner and fractional bpp
> + * @fractional-bpp-with-bpc-ultrajoiner:      DSC with ultra joiner and fractional bpp with certain input BPC
>    */
>   
>   IGT_TEST_DESCRIPTION("Test to validate display stream compression");
> @@ -82,12 +102,29 @@ typedef struct {
>   	int input_bpc;
>   	int disp_ver;
>   	igt_crtc_t *crtc;
> +	enum joined_pipes force_joined_pipes;
>   	bool limited;
>   } data_t;
>   
>   static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
>   static int format_list[] = {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
>   static uint32_t bpc_list[] = {8, 10, 12};
> +static enum joined_pipes joiner_tests[] = {
> +	JOINED_PIPES_DEFAULT,
> +	JOINED_PIPES_BIG_JOINER,
> +	JOINED_PIPES_ULTRA_JOINER,
> +};
> +
> +static const char *joiner_subtest_suffix(enum joined_pipes jp)
> +{
> +	static char suffix[32];
> +
> +	if (!jp)
> +		return "";
> +
> +	snprintf(suffix, sizeof(suffix), "-%s", igt_get_joined_pipes_name(jp));
> +	return suffix;
> +}
>   
>   static inline void manual(const char *expected)
>   {
> @@ -126,6 +163,10 @@ static void test_cleanup(data_t *data)
>   
>   	igt_output_set_crtc(output, NULL);
>   	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
> +
> +	kmstest_force_connector_joiner(data->drm_fd,
> +				       output->config.connector,
> +				       JOINED_PIPES_DEFAULT);
>   }
>   
>   /* re-probe connectors and do a modeset with DSC */
> @@ -179,6 +220,30 @@ static void update_display(data_t *data, uint32_t test_type)
>   	igt_sort_connector_modes(output->config.connector, sort_drm_modes_by_clk_dsc);
>   	mode = &output->config.connector->modes[0];
>   
> +	if (data->force_joined_pipes == JOINED_PIPES_DEFAULT) {
> +		/*
> +		 * Non-joiner: pick a mode that doesn't require joiner.
> +		 * The highest-clock mode may trigger joiner naturally.
> +		 */
> +		mode = igt_get_non_joiner_mode(data->drm_fd, output);
> +		igt_require_f(mode, "No non-joiner mode available on %s\n",
> +			      output->name);
> +	} else {
> +		int max_dotclock = igt_get_max_dotclock(data->drm_fd);
> +		bool is_natural = (data->force_joined_pipes == JOINED_PIPES_BIG_JOINER)
> +			? igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock)
> +			: igt_ultrajoiner_possible(data->drm_fd, mode, max_dotclock);
> +
> +		/*
> +		 * If mode does not naturally trigger joiner, force it.
> +		 * Otherwise the kernel handles it on its own.
> +		 */
> +		if (!is_natural)
> +			kmstest_force_connector_joiner(data->drm_fd,
> +						       connector,
> +						       data->force_joined_pipes);
> +	}
> +
>   	do {
>   		if (data->output_format != DSC_FORMAT_RGB)
>   			mode = get_next_mode(output, index++);
> @@ -253,10 +318,12 @@ reset:
>   
>   static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		     unsigned int plane_format,
> -		     enum dsc_output_format output_format)
> +		     enum dsc_output_format output_format,
> +		     enum joined_pipes joined_pipes)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_crtc_t *crtc;
> +	int n_pipes = igt_display_n_crtcs(display);
>   	char name[3][LEN] = {
>   				{0},
>   				{0},
> @@ -266,6 +333,10 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   	igt_require_f(data->count > 0, "No valid output found, either sink doesn't support dsc or min 8bpc\n");
>   	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>   
> +	if (joined_pipes != JOINED_PIPES_DEFAULT &&
> +	    !igt_is_joiner_supported_by_source(data->drm_fd, joined_pipes))
> +		return;
> +
>   	for_each_crtc(display, crtc) {
>   		for (int i = 0; i < data->count; i++) {
>   			data->output_format = output_format;
> @@ -273,6 +344,7 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   			data->input_bpc = bpc;
>   			data->output = data->valid_output[i];
>   			data->crtc = crtc;
> +			data->force_joined_pipes = joined_pipes;
>   
>   			if (!check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
>   				continue;
> @@ -287,6 +359,13 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   						      data->drm_fd, data->output)))
>   				continue;
>   
> +			/* Check joiner constraints for this pipe */
> +			if (joined_pipes != JOINED_PIPES_DEFAULT &&
> +			    !check_dsc_joiner_constraints(data->drm_fd, data->output,
> +							  display, crtc->pipe,
> +							  n_pipes, joined_pipes))
> +				continue;
> +
>   			if (test_type & TEST_DSC_OUTPUT_FORMAT)
>   				snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
>   			if (test_type & TEST_DSC_FORMAT)
> @@ -346,85 +425,117 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		}
>   	}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with default parameters");
> -	igt_subtest_with_dynamic("dsc-basic")
> +	for (int i = 0; i < ARRAY_SIZE(joiner_tests); i++) {
> +		igt_describe_f("Tests basic display stream compression functionality "
> +			       "if supported by a connector by forcing DSC%s on all "
> +			       "connectors that support it with default parameters",
> +			       joiner_tests[i] ? " and joiner" : "");
> +		igt_subtest_with_dynamic_f("dsc-basic%s",
> +					   joiner_subtest_suffix(joiner_tests[i]))
>   			test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
> -				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
> -
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with default parameters and creating fb with diff formats");
> -	igt_subtest_with_dynamic("dsc-with-formats") {
> -		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
> -			test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
> -				 format_list[k], DSC_FORMAT_RGB);
> -	}
> +				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB,
> +				 joiner_tests[i]);
> +
> +		igt_describe_f("Tests basic display stream compression functionality "
> +			       "if supported by a connector by forcing DSC%s on all "
> +			       "connectors that support it with default parameters "
> +			       "and creating fb with diff formats",
> +			       joiner_tests[i] ? " and joiner" : "");
> +		igt_subtest_with_dynamic_f("dsc-with-formats%s",
> +					   joiner_subtest_suffix(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(format_list); k++)
> +				test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
> +					 format_list[k], DSC_FORMAT_RGB,
> +					 joiner_tests[i]);
> +		}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with certain input BPC for the connector");
> -	igt_subtest_with_dynamic("dsc-with-bpc") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> -			test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
> -				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
> -	}
> +		igt_describe_f("Tests basic display stream compression functionality "
> +			       "if supported by a connector by forcing DSC%s on all "
> +			       "connectors that support it with certain input BPC "
> +			       "for the connector",
> +			       joiner_tests[i] ? " and joiner" : "");
> +		igt_subtest_with_dynamic_f("dsc-with-bpc%s",
> +					   joiner_subtest_suffix(joiner_tests[i])) {
> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> +				test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
> +					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB,
> +					 joiner_tests[i]);
> +		}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with certain input BPC for the connector with diff formats");
> -	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> -			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
> -				test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
> -				bpc_list[j], format_list[k],
> -				DSC_FORMAT_RGB);
> +		igt_describe_f("Tests basic display stream compression functionality "
> +			       "if supported by a connector by forcing DSC%s on all "
> +			       "connectors that support it with certain input BPC "
> +			       "for the connector with diff formats",
> +			       joiner_tests[i] ? " and joiner" : "");
> +		igt_subtest_with_dynamic_f("dsc-with-bpc-formats%s",
> +					   joiner_subtest_suffix(joiner_tests[i])) {
> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> +				for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
> +					test_dsc(&data,
> +						 TEST_DSC_BPC | TEST_DSC_FORMAT,
> +						 bpc_list[j], format_list[k],
> +						 DSC_FORMAT_RGB,
> +						 joiner_tests[i]);
> +				}
>   			}
>   		}
> -	}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC and output format on all connectors "
> -		     "that support it");
> -	igt_subtest_with_dynamic("dsc-with-output-formats") {
> -		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
> -			test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
> -				 DRM_FORMAT_XRGB8888,
> -				 output_format_list[k]);
> -	}
> +		igt_describe_f("Tests basic display stream compression functionality "
> +			       "if supported by a connector by forcing DSC%s and "
> +			       "output format on all connectors that support it",
> +			       joiner_tests[i] ? " and joiner" : "");
> +		igt_subtest_with_dynamic_f("dsc-with-output-formats%s",
> +					   joiner_subtest_suffix(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
> +				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT,
> +					 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
> +					 output_format_list[k],
> +					 joiner_tests[i]);
> +		}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC and output format on all connectors "
> -		     "that support it with certain input BPC for the connector");
> -	igt_subtest_with_dynamic("dsc-with-output-formats-with-bpc") {
> -		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
> -			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> -				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
> -					 bpc_list[j], DRM_FORMAT_XRGB8888,
> -					 output_format_list[k]);
> +		igt_describe_f("Tests basic display stream compression functionality "
> +			       "if supported by a connector by forcing DSC%s and "
> +			       "output format on all connectors that support it "
> +			       "with certain input BPC for the connector",
> +			       joiner_tests[i] ? " and joiner" : "");
> +		igt_subtest_with_dynamic_f("dsc-with-output-formats-with-bpc%s",
> +					   joiner_subtest_suffix(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
> +				for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> +					test_dsc(&data,
> +						 TEST_DSC_OUTPUT_FORMAT |
> +						 TEST_DSC_BPC,
> +						 bpc_list[j], DRM_FORMAT_XRGB8888,
> +						 output_format_list[k],
> +						 joiner_tests[i]);
> +				}
>   			}
>   		}
> -	}
>   
> -	igt_describe("Tests fractional compressed bpp functionality if supported "
> -		     "by a connector by forcing fractional_bpp on all connectors that support it "
> -		     "with default parameter. While finding the optimum compressed bpp, driver will "
> -		     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
> -		     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
> -	igt_subtest_with_dynamic("dsc-fractional-bpp")
> +		igt_describe_f("Tests fractional compressed bpp functionality if "
> +			       "supported by a connector by forcing "
> +			       "fractional_bpp%s on all connectors that support "
> +			       "it with default parameter",
> +			       joiner_tests[i] ? " and joiner" : "");
> +		igt_subtest_with_dynamic_f("dsc-fractional-bpp%s",
> +					   joiner_subtest_suffix(joiner_tests[i]))
>   			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
>   				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
> -				 DSC_FORMAT_RGB);
> -
> -	igt_describe("Tests fractional compressed bpp functionality if supported "
> -		     "by a connector by forcing fractional_bpp on all connectors that support it "
> -		     "with certain input BPC for the connector.");
> -	igt_subtest_with_dynamic("dsc-fractional-bpp-with-bpc") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> -			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
> -				 bpc_list[j], DRM_FORMAT_XRGB8888,
> -				 DSC_FORMAT_RGB);
> +				 DSC_FORMAT_RGB, joiner_tests[i]);
> +
> +		igt_describe_f("Tests fractional compressed bpp functionality if "
> +			       "supported by a connector by forcing "
> +			       "fractional_bpp%s on all connectors that support "
> +			       "it with certain input BPC for the connector",
> +			       joiner_tests[i] ? " and joiner" : "");
> +		igt_subtest_with_dynamic_f("dsc-fractional-bpp-with-bpc%s",
> +					   joiner_subtest_suffix(joiner_tests[i])) {
> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> +				test_dsc(&data,
> +					 TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
> +					 bpc_list[j], DRM_FORMAT_XRGB8888,
> +					 DSC_FORMAT_RGB, joiner_tests[i]);
> +		}
>   	}
>   
>   	igt_fixture() {
