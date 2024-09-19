Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090F3CE8D72
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 10:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A413410E190;
	Thu, 19 Sep 2024 10:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKsuPmGh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BD910E190
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 10:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726741315; x=1758277315;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GRgXURQNuNonE3I18bN3jsTj8ic/hly0CEwdmO+OZPc=;
 b=fKsuPmGhy2VzlX2J/znTB072hvIaIC63VmSFo03/+Sna4zITzWWgUsnL
 EKNXd6rdFI6qWFAIjV4wLKCR8A0Edb7o0T3sPbLx5Kgo1wYuzDyGpycJF
 XjS2SMhaufvzJwSde3FGLQ7ozH72NJ6YWlKIhIvmO16Ng8cQ7WDsUJTlk
 Vsrn5zCeYO/9ADbqNhQqaY2UgKCPgA+eEX4b6EWZ0ZA+xYJK/IR6A/+SV
 c78brieu/9Cm5TejbLoxOiub11hROZf/gydqeH1IsQ9Vn8BA6ZEN3wG53
 z5N799cpnhCZLym9sN+R2UtYlrV8H5IWWKwEBez9ACQ2Ko6i4z6iJ63f+ A==;
X-CSE-ConnectionGUID: HLVeGAYtRlS8WudP2oVfEQ==
X-CSE-MsgGUID: DjnwRJBKRSioG0LGS6sdBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25216272"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25216272"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 03:21:54 -0700
X-CSE-ConnectionGUID: uSAZjhZeQge0vBTvBzwRcQ==
X-CSE-MsgGUID: 3D9p2O9qRTSEmCUsduIckA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="70180634"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 03:21:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 03:21:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 03:21:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 03:21:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiFG/hjFVdEh/FdSJDsXh5BpLLJZSbKBeNluUonZNENJq+imCyLBEu83nRQIj405ymqeC3UArXQkgb61MvXX+ZE4s6sQKvAlqm7jjMtorcnXgQ6KTAKW6UelHziY3r/evHVopZXNAxKqD1QazTEvuUlZghqiVgps1Ph5pGgYB7uWNGLjsTIpS/gbq4pkKHotG1jYGbp9YD1Uk8V6zW+MoUCbs4+/vv0zn5sqza2WzoSLyf71vVAHg2QVAFxeLOMr4Rm7UPv5XPivOBb+psoWtoNOhwmuCr7AVOXb68NAEiFhBGo8dp2FF+0elRvov5yAq/fFZaV+McC7lmxbDAdSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pMGBBFMNMnW5hsxYAdCrQvpbWkCYae8ffJFalIVYPU=;
 b=dl9NkyxLI/krUCjiWYDljz+upF4ibawlW5p5Z+ZsSkyfG7ymliICr48bjZoABhHqiLAwFcDIFrvxt8FmapTr5dupRCgqhbaPWcwJu+aWFnwwOv4rvUCkkt/wkrEVetAjKjYcKkPNcYDaY6psoqOQltRZ2Qt48yd08rE4OZgZXAM9BIxbzbed3gbUV2MKTqXignbA6/dT1XYjAoK67TUhWOYHoytfjBgKry4oDCsfzkgdGvJAkK0jROneNljgPqEBh32Zxk34WOw7pKQ7H0gIzKjmss1rwxidUu04qmVG7rI3VFdAxlqZBKvX0V08a2kEkouBQ7Kre/VhyKFGET6ggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by PH8PR11MB7000.namprd11.prod.outlook.com (2603:10b6:510:220::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Thu, 19 Sep
 2024 10:21:46 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 10:21:46 +0000
Message-ID: <4506c6d9-1639-4426-9056-121d76700b7e@intel.com>
Date: Thu, 19 Sep 2024 15:51:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_psr2_sf: Add eDP check for Early
 Trasport
To: <igt-dev@lists.freedesktop.org>
References: <20240919095904.1136205-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <20240919095904.1136205-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|PH8PR11MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a482ae-8d3a-48a3-76b7-08dcd894dda1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MURyZFNnSDFJYVpOTkUxbndkRWVSMkxWeCtTQ2RCRTlmZVg4ODN0bHFoYWFp?=
 =?utf-8?B?b09MRXNPbXYvWjhDNVNuS1kwRnRnS3VnLytLcEVsQWZNZ05ORHBpdndyMk5D?=
 =?utf-8?B?V2VQWTVlc2M2R3RNeDlNV3dRTjU2RENkYW1objR3U3Q2Zy85YWYzUDdXNmFW?=
 =?utf-8?B?dTh4WUQxenBrNzlERHhqdUFiN3dnTnpEV2tUTVNidE42WXNVQUJoWHViNzhU?=
 =?utf-8?B?VzdyVzY3V2E5NnlhZlVSVTlTVVJjQnp3SUdIaG1mRzNkRDZmb2pLNkRkUmpU?=
 =?utf-8?B?ZEJDUCtYQzEveGxvNXUxK2l0VWtOQzZGQ3BuSWNnRHZ2dVd6Uk85bXBXR1NF?=
 =?utf-8?B?aUF5S3NFNHl0NzZTVFhzUUw2eWJHRlpPMmw4ekNmQjRWQnorVytuMXNleFdi?=
 =?utf-8?B?ekR0M2FwNjV4VHNGd2RtRk9BT210cld5ZXYwRlMwV3pFTDgybUI4VnRpdzYw?=
 =?utf-8?B?UFBqZ0pIelZQTk1yZHpCODIyYUQwN2pkd3BCclJWZXZEZTc2Y2x5MDk4SzB6?=
 =?utf-8?B?aXNYTFdhU2duM25pK21wQU9FSW52N3BVWC8rYzhBRlpDTjkvangyOHFhU1dn?=
 =?utf-8?B?RnJ1cXdENitBUy9WVHd3SGtrNkJsWVFncXBNMG8xZnREaTlCY3g4TXljTWRT?=
 =?utf-8?B?T0NsVU5MS3poZ3VGVDJRYlRvTmxQQ21SUnlycmFHRUhkQnUxUDd0dTR5M2Fr?=
 =?utf-8?B?bjByMklUZ0RvLzFyOUZZREE2bFlYblhpdkZhKy95Mi93QmFxaFZHK0kxdkJQ?=
 =?utf-8?B?L1FFYXhrNkRlQmIvUFV2d0U4Y3IzZnNYM0JsV0dBR1l1TGRCVXhqS2JxVmRv?=
 =?utf-8?B?L3BFbngrVEx4YjE4dTVXYmdhS3l2RnJ5QWlKK3hxczBrU1MwN2Y1YUtYZ1p1?=
 =?utf-8?B?d29iTHRkd3d4THVOUmtIdndESHNLRHlYVTZsSkRHSkhHejN1dWVPS21SRUMz?=
 =?utf-8?B?bnRYVklWUVVDSVBXTXdrQ0Z2TjBFcUNXY3c1a3hHVnlrYjZGUitZZ0drWXZz?=
 =?utf-8?B?UDUxOWt4UUhEMTc1eldGc2FSRzliK09oUzhjZytjSjV3akY0cWJwQUIxY2Ex?=
 =?utf-8?B?S2JsdzU4MTN3bmozUWc2RXNXaGV0K0xjSk8yUkMzUCtJTFlWSkxmNmVpdjBr?=
 =?utf-8?B?ek9LUXJscXpZTGZSSnpyT3Q1M3BjNTZGTlRpbFVaM2hLTG96Y1VqbmZrR2dU?=
 =?utf-8?B?TjJPMFJGSk1jbE5lYmhKVnlBTXEwR1o1dmdYRFhnM0Z0V1R4MGU0K01pcEtr?=
 =?utf-8?B?cWpTODd5eDYxUS9Gdmp0Ynp2Y3Q0NTRSUVRVL2VDeGN0M2ZSSTI3VlY4YzNM?=
 =?utf-8?B?NHMzV0loNmVIaCtBTXM2alFJTzdFQ2FOK0ttL3RLTU1yQk82MkFMMEloYzk4?=
 =?utf-8?B?a2k5cmtDVXp3SHQvZHpMSnUzSERqcVk3RnZDV1V0RkRWWm5lK29JUStGVjgx?=
 =?utf-8?B?UFhiTXd3OGdYZ0k5MEVYZGV3Yzk4TTVqVlZMVUdJRXRLTm9RcUlxejhHSTBm?=
 =?utf-8?B?ckFFcTFBODFhV09kejM5ZWlUMGpLTWU3cTh0QUhGaURoc1hGYmpUbFpnNmk1?=
 =?utf-8?B?eFg2cnRWc1J2bXFoa1ljLzVQU2RCTXUzWFFrQnh4RXFIWDhWbFU2UG1UaGwr?=
 =?utf-8?B?a2tpT2FudjY4b01CaUJYWm84ckdBVzF2U0Y0cVc5dkVscnZZSWtmWmZPS09v?=
 =?utf-8?B?d2dvMnFHTFBoZEVueDZhNmJaNVRXS21GR0gwUVJwa3JvR05FQTUrRmFDWGpa?=
 =?utf-8?B?dFI5U2ZlNTJZSHZZTTJpUUNnQUJNWll0NCtkSEQvY3FoM05WVUFFalZLRnZq?=
 =?utf-8?B?UUc1RlZNbnhlQy8wdit0QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU1RUzhsWmdKQmoyNkN4QnNKWjk2dFMvSnA3ZjRpZE1oelQ0dyt6Vm5WTkZ0?=
 =?utf-8?B?RHhLY3paTnRRS2s2dnBLcXMwOG9zSTFJdExNdm9Iejh0VCtnWFFoQlgyK3lK?=
 =?utf-8?B?RktaUkJFdDJHbjZOQWo3NVJObmI2anM0dHhjMVJDb1N6UGQ1U2FwOGRhOVhI?=
 =?utf-8?B?R2VHL01oRFNnekE2Lzg0eUYycXhrdmRBYVdMMllHQlJmMlU4MDZkZXZseUlW?=
 =?utf-8?B?RXBhQUZ6b1pBcyszWmpHMW5UV2dPOHk3U0srQUsrZ0hvN1BUVjN2ZDlrcTlG?=
 =?utf-8?B?eTJBbit2QmV3OGM5bXNoMFJNRldKVXhsVHNrakp6NDBYT09JVFduSUtrT2wv?=
 =?utf-8?B?ZFNlNWZ4ajlvaE9uQXR4UVNEcVpDMlRDUHlsSEJ6eWFHQkVpbE5xczcxcWZw?=
 =?utf-8?B?WFpoc1BhYmJOMERObkswS2o1SldXOXpWOHBndzF3SWViWkpRZzU3SFk5b3Jq?=
 =?utf-8?B?bHhoSVFrSkRJVS9QM2EvY0VEMjE0K1VzNzlsSzR5cTVvcmRZUVlhQlBTZ2Nl?=
 =?utf-8?B?TXRSR2NQZFZvSGJJK1Q1OUIySUM0ek1rdFNjbUo1RjVITTRUcHJ3Y0hleHlR?=
 =?utf-8?B?OG4wNG8xV29lS0dhRjF0ZlAyc1dhOVJPSnhab0t0OXhHKytVK2gzajF1ZUdQ?=
 =?utf-8?B?cHNqTy9KVy8vUjZUMTN3RllQbGw4UWlucTlQSm9qWDFGMXpmakVwNVl5aHBo?=
 =?utf-8?B?dzlPS3owdVRGTndYZ2cySTE4MXYvT1crSmtjdGY2ZzNRM2x6RmZhbGhwcnB3?=
 =?utf-8?B?aWwyeTJsRUJjdlVSaG52bmR0KytUcDdtUWI3akQza3ZUZS9kRG1ENjJXN0ts?=
 =?utf-8?B?S3ltRmNSVTZzUHJWQ0l3cCtpM3FEcUd4NGJPNDF5QXBoK21JODN4THB1QWdC?=
 =?utf-8?B?REF5RlNYQXVXZnE4SWpsVVpIRzRQYTZ2ak1BQ3dnREdQU1JnbGRvZ2swNmF0?=
 =?utf-8?B?eUIzWlUzZjEySXdHMFN1SFgyWGhhWVVYV3ZhbjhWQlhhakJUa2Z3VGZBV1R2?=
 =?utf-8?B?ajMrcW1uUVA1WTViRXQyNnNkWFRSSkl4eEZ6L3RDRFoxSUVjRk1FZlZ1ZmVn?=
 =?utf-8?B?QVlST3Bob1dBUzZ6Skl0SXFjRVZUQTFSUkgyajVIUVMzeEczdEFNQ3l5SDAv?=
 =?utf-8?B?RHZVWjF6WHVBVFI1bUw1ZFMyWGxGeUFWdXRIaFBaS1M4RlZkRi96YmlPNkFo?=
 =?utf-8?B?cVZLYjJMUUkrM0VBS0x1U2QxcS8zQWp0MkZWQ09JMFl5bTUxSnllL25yT3Ru?=
 =?utf-8?B?Znd1dkgyVkJqTWF5ekQ2WlJ6VU1ZclBZcmdXZ245RDJlSHFkb2ZwdXZ6WnZu?=
 =?utf-8?B?VzIvaks2TVZybExUVlp3TXdQSkduQkZYNEs2d2ZlbkkvbzhhNWdrcEthbzRP?=
 =?utf-8?B?U09BTllWaXZyTVgxWXNJckkwSWhRdlpUaGZUUHlGWmJIRTRyTjdhMUR5Y3Ux?=
 =?utf-8?B?b3BDU2F6VC90UnY3TmRpbUJ1OForT2J3S1F0V0xVdkl4NXlSVzVZb054bWlP?=
 =?utf-8?B?NFQ0NUpQOXJobW1kTWdsUzRmdTRNcFh1YktuVm80cE1Mdm95QVFLNFBDVGpD?=
 =?utf-8?B?Y1hEYU9pNVdYUmN1MGV0VGtlMlJsOTVrcWc1dzBhUWFBbWlqR1U2OGpabHdB?=
 =?utf-8?B?QTl5SGFpR3U4YTRzeWl5WjRxL1RSMC9OSkVpbzMyVlRkRVlYcUk0NTNVUlVs?=
 =?utf-8?B?K0FEQ3RmOUFQY1FvM2FhTE1zZWU4eWVtRlNXcFBtZGY4VEJEY3N4dGsyQTBj?=
 =?utf-8?B?WTFhUFpwNFAvTkU4S1NMbFJqUXFRd1ArQ0ViOHVlNkNTeTgySkpJU1VFMndW?=
 =?utf-8?B?cjZwenBvM20zZG84NW9wbmx4TEptZnBmWWZqU1RPWWJ3eGlvZUplTWNMVjdH?=
 =?utf-8?B?TC9qNWZEejhsUHVUTEE4MjRYa09PVnF5em5OZ1gxR0llOFF6SEd0NkY4dkFE?=
 =?utf-8?B?aWM1OEQwTGh5SXdJSDI4LzI2YmpDVitSbTgzeUxicndxdWJnQnhmMWpJT2FH?=
 =?utf-8?B?b0pPUHlmbm95a05uakw0bTdBVzZaU0lZT1k5WDhRUVRWQU81N29DRlBtSDR6?=
 =?utf-8?B?b2l5aHBIUUlGSUZ3emU4bmc3bS9XeEJ3TXFJT3FOaGkyNHNPdGQrOEtQYmY2?=
 =?utf-8?B?d29mOFNJNWczU2lHZjR1QjlKTlhYQXRrVFMxZmtValQ0aEdCSWtnMFNCUE9n?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a482ae-8d3a-48a3-76b7-08dcd894dda1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 10:21:46.8038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alw49iEE0Gggu3iWhyEHNyI53Fl0zSSsPHG/4+6swMKcMdcsNaVWbwNfeCrxF1Tj5JCPgW2LNye1c5quK+KXVnC5ZmDBBP2soI5YoaGDxtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7000
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



On 9/19/2024 3:29 PM, Jeevan B wrote:
> On current platfroms early trasport is supported on eDP only

fix typo errors 'platforms' and 'transport'.

> so avoiding assert for other connector.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_psr2_sf.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index a9be1a1ec..14b3e20ff 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -935,7 +935,8 @@ static void run(data_t *data)
>   							  data->pipe),
>   							  "FBC still disabled\n");
>   
> -	if (data->et_flag)

Add a TODO to enable early transport in feature platforms.
imho: To handle data->output = NULL cases add a check as below to handle 
crash issues.
if (data->et_flag && data->output != NULL && 
data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)

> +	if (data->et_flag && data->output->config.connector->connector_type ==
> +	    DRM_MODE_CONNECTOR_eDP)
>   		igt_assert_f(early_transport_check(data->debugfs_fd),
>   			     "Early Trasport Disbaled\n");
>   

