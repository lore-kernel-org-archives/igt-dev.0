Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8EEC3DA41
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 11:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555C410EA29;
	Thu, 11 Jul 2024 11:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+GcxYzZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F4C10EA29
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 11:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720697869; x=1752233869;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qe0oCB8RJuG68jEBEJzP+dHT1oteccZ0I9VHHEVP2Bc=;
 b=B+GcxYzZ0PD91zBD1kD8FL9Fg4JJFVIB1yxRsUsUwboEivcQRRJg+g5P
 onznCgd33WASlc48wdWIFTWz8Hk0Lxmo4lWuYENe9P8B1EaheEBM1eqF4
 MRUbZQtgZSZRv4Wi2yGlexLdDsuKGrb1dTySiS7grL+TODmSKH9PJktza
 P4iJenz3FwrWf1Gq9MLeKUBqA41neEeTLstdTapgLOYpArc+7Ka6p9+Pd
 inUqvUs/fwdg7yJSXjhOiaPtr+BVxlS8jXe3T//+vA6UpN/AHMXaGE6WG
 M+vXNa+SINSXQgYcKXY9+3sKySUaehopWEIu1ljnAP4/wjUJqWFCpqwtt g==;
X-CSE-ConnectionGUID: CAOyWbPlQKO3iUYOvHZ2Gg==
X-CSE-MsgGUID: 2goNnsV5TKSOHVPobrPouw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18178471"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="18178471"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 04:37:48 -0700
X-CSE-ConnectionGUID: P8QkqORzSAmRNqMLUiVyZQ==
X-CSE-MsgGUID: Pr33Gw8oQMS1WptU1RE3qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="53476579"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 04:37:48 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 04:37:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 04:37:46 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 04:37:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITZhz1RdhucMMMyU/sl8mikIGzEV62kMbmKEgPatrEHKf6hj9487OF8hQp8uBtE7FCKsEes4I2xgNuflz8Elv5RFoIwNa+iBFeFVsBA7e9C0FU0rEW4TlyN/GMXc9DVUdwLo+c+LMLlgOJ3CZySFZZ4JqAnI2SFt3WQGMLb7CSjCa+/XMGWkQ9ffHRmvwS+WU1YOv/RFt2o0NqkLIk+D5iPqEJiW0q84SbDF4i2XoH7CgmqnK1ctwagUArNYsS29derp7urBa8SAFjx9Uy67J3nloLkjLUnI0gSasFk/u9OzUKrxqs6nwinXmlF1sVuKDonE6XofvoEgXCVqZaQGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPH6PvNkgCq0y25T3HprIns+rYyzzpMh8ozuW1g2HLo=;
 b=XD7DDyFgv4xjRSeZIsValN0jWhJY1GnOIbsHrd5fvH9l3y4vo2bWEX5+nNJ5Qmw3N3FYAGF7siFgezSFkEp0e2NCR7/W7S3ULhTjWl2pMAxHRyGCuSVOEgSWCOyyAA07vvVyncjTKv0xN+5E1IWbeu98iH3kC4Mr7b51HFjBlqZA3kPv203yqIuhmuGCReJAus9Jv9D8gUG5jR7wYlFXgcAEgteYw/5WTdN0jhrpjsio1vlXU3eQW90TlJvjZg2BAqMfDO/tNAKJIjeo194G4E6ILLz8/bj0ESDC5FwPFnnyVrkuPPioLTdcYqDyCAeBnstHfZ+zb4D1uRn8qD9CzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Thu, 11 Jul 2024 11:37:44 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 11:37:43 +0000
Message-ID: <33cb38b9-da99-471f-b79e-051859402d9e@intel.com>
Date: Thu, 11 Jul 2024 17:07:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] tests/kms_atomic_transition: Reducing debug
 loglevel dynamically
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
References: <20240711101843.760796-1-pranay.samala@intel.com>
 <20240711101843.760796-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240711101843.760796-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::32) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|CY5PR11MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: 295d77db-a073-466b-3649-08dca19de11f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1ZWSEJ1eGNkZEcxT2c0ZzR0MFUxWS82R2pzYUsxcHZ0WEVtNDRTZDM1MUFU?=
 =?utf-8?B?VVIrelFQTnZOUEpGN0dDQXZwazdabTBoSE8zRElDZzVHeWpEQmhjQnVkTlJa?=
 =?utf-8?B?ZG13dkxuZFpvaTZCd0NEek9TR3BhQ3Irc0J5elhpUHd5dVBGMG9EcWVtTDZB?=
 =?utf-8?B?enZMU2dmTFFkdkVwb29YazhlbWZzbVQ2dVY3b3RVaVl4Q1JHSVg2MDNRVXFC?=
 =?utf-8?B?TmNlMHJpTzZxMGhBK1ZlbXZmY2pzSXIwUDZDT2swY003U1Y5dW52T1R5VWV6?=
 =?utf-8?B?SEJVb2NRaFloZ2EzQ0lYUzcwbGpmYmhkQ3o3UW1ZQVpxc1dGbFh6OUoyb0do?=
 =?utf-8?B?QjJpZjh6MGNEQms0Ykd3NytlM0E1OWVhRHNxcmw0dDA3WDl4N0l6NHhRc0x3?=
 =?utf-8?B?UDBHUzhxRW5zUUlpSEI3NWl1T212MjV4dko1SFRhT1FDZFp3QlVXQlVDUkRo?=
 =?utf-8?B?bVRubmNuS0gvcmpuWVRuRTJnaGxYNlJMSGY2QUxQZFZVdjJSNU83aEdpdDJI?=
 =?utf-8?B?bVI1bnVVWmZLangwTDBqeVhTNlpTSm1oWVQ0R1R1Rmo0d3UvbWU0aytIajU2?=
 =?utf-8?B?N0NoZUx3VklhbXMzbkZOeHJUaXlLTFc5NldVVkwxZ1NXeUxoTmg1d3lNUEEz?=
 =?utf-8?B?dTIwVENaYklUdWg3aHZJVmhwVUg4WUJGamkyVWNQS3NOUW9pODd5dC9MRy9w?=
 =?utf-8?B?Ym5NTUJJN2FsaDN1bjZsQ3JlN3NZMEl1bS9GK3JOMmRsd3NGaEJ3MW11UmlD?=
 =?utf-8?B?aGV0bitOajFwM1o3MHpKb0k0RmFMTnd4cGEySzRmQnk3R085Wm1SRHkvSWF2?=
 =?utf-8?B?NVNHaENDL1hHa3NZUHI0OW0xK0FvRU81MVIrSWlidE9zalNURTZscThwb2pQ?=
 =?utf-8?B?QW9SVFVlZVdxaGppOGJFdGRsQkZGcTJTWHgyRUlYVStCT0xGS1ordE9vYUJa?=
 =?utf-8?B?Wk5pNVYrejJON0V0RlppVkYwOXg0U3dBOWtmUk5QR1dEQ0dtN1dKYlN3T2lC?=
 =?utf-8?B?TXN1UWIvSno2NGgzMFJYa0ZrK2d3dklVVHo5QmZhUzNsZGpUcnBQL1ZLY1Ba?=
 =?utf-8?B?M0FzUy90Y29mQytHOHphT1RCVGtacnlvU3FpTmdvTjE5dkNVR3N4MVV2aVpC?=
 =?utf-8?B?bWJSSUtVSjlKSWphelZUVVZsblRESmV5WVZtb3FNMVhSMjJRU2JOZlRRQm1k?=
 =?utf-8?B?K1RMNDFRV05Fc21XbVliUFVVcFlGRnRsMnZJVVM1ckJTUWZGaUtPZlpHSzg0?=
 =?utf-8?B?Si9xM1o5ZWYyNkFsOXNldzIwVlFsS2hPV2FWUWx6bkRweDNXU1dCMkE0QzFE?=
 =?utf-8?B?MGdNUEZ2aDQ3SzBWeXcrNUo1WmJQOGFuUVNrRjZvU1dBWEl4SmxmYnU1dEE4?=
 =?utf-8?B?eEhCbm5iTzBwQXA1RnpETXZsa3IzTFdoVE9yZkZxZFFDbUtTd041MTNaNGJR?=
 =?utf-8?B?VnRMZVpaZVVXYUhiaUY1TWxjb1JwVVhxVjV3c3hqZ0w4dUxlR29nV2tzVSt0?=
 =?utf-8?B?bG55Z0VCNEFQZDJSMk9tR2loRzZYR3VVL2RveVFBUTJ3bnlmR08xdFRpVmlH?=
 =?utf-8?B?ckhSU2ZjMEgwNDg0SS8zbnpUd25xckhlWkhqZmRXcjJIbDdsNG9ueTladzQz?=
 =?utf-8?B?bVBuK2FkUUR0aDN4Uy9sMnlnYmhzZlFhRU84Uys0bWNVV2ZkSENRT0ZCKzJC?=
 =?utf-8?B?bGdkMWZrU1FrNWF3QS80MHBQQzBTUGhubHV5OXNrZ202SXhLZ2FFa1FMcnZu?=
 =?utf-8?B?TStVMWY1RHBKVWp3U1BrOEdZdXkxMyt6T3dNWDBmbk13YUVTOFJMUFg4U2Rj?=
 =?utf-8?B?dFI5djdoUXVGbWVFTmhyZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VCtTZ01TL1hhdmZ0aWI5a3ViV3ZVM0liakFNVStubGlFWnpmMjNEajRTb2Vz?=
 =?utf-8?B?Ly9udU10QW9hS3QrNGFMUTRqVHljM0tkcTNlUWdVbWdZeVR3Rm16Z3dHbUM0?=
 =?utf-8?B?UVozS3RDeEM0elhXaVZKdnNRbXByVzVNaTd6MG5tdlpmbTJFalJVeU44NmhN?=
 =?utf-8?B?bkUyYm1Xc0tZNlQ4emJjZ1VXVSt2eENSc3JuTDNCallDK2MycVA4cGJGOXNm?=
 =?utf-8?B?S3BNUkdHekJvRHpLZmNieVhhQW0waGdmclVkaDJXamVRbGVBYzRtY0xSUTVH?=
 =?utf-8?B?T3IydThSaTNrQld3Z3ZKMmR3OEgveEdUOGlDbjJHcFc3SzkwN3hvS0VZT3Vw?=
 =?utf-8?B?bWxWbnVWVUpIWGFvZS9FbWhUQmZJclNKdTBoank1bnArS2JuVFBlT1kvRkR3?=
 =?utf-8?B?WGZ0QmxXT0VVeHc3cHBmcGk1QkVpbU5sNE5KeHlKMDlyVlZFOTc5bkl6WUVo?=
 =?utf-8?B?cTJtSDBVVVZMRVF1YlZycHRncVlFR0dHYUdzSHludnJ6aStTaTlpWkhodklK?=
 =?utf-8?B?c2E2eExxeDgvL3F3MVBocXppdmxuU0sxTmd4WDRNdG9ld0pUcXpuN1JOVHAy?=
 =?utf-8?B?NnJ6aEpGc0VCcFk3aGNnTjQ0NGlMOEhCeGtnNjdxdStTQjB0OXBrY1hGZWU2?=
 =?utf-8?B?akpSRFlKbW9ieTEzRllWdG5iT0Y3azNHU25pbmw1TE9HUitoY3FzVHFrL0d2?=
 =?utf-8?B?Wmw3SHQyY2FQYjhqeWFmUnh3S0FTbGtjWktLVjgycDIrUXJaN0Z3WTVGREQv?=
 =?utf-8?B?emRWWWxrNUt3VmhBSHgwNE12VkpwSkJvclpYcnhHU0gxUUZRRnVqY1VGMmhm?=
 =?utf-8?B?VEg1UG5sWVAwV2xKNnc3U01RRUlpY0FzZkhObnk4c1d0SWVMcVFFTERxOFZU?=
 =?utf-8?B?TkQzQi9sdjFLWWhTSkhYVTF3aTloRTZ5T2JDa0JXVnRLYzJVQ05qcWluVk9R?=
 =?utf-8?B?aFZlV0JxMmw2ZEJxZW5XbTJtTFA2WTA1djRWZE9qdTlzZXpFenY5aWR1bVVu?=
 =?utf-8?B?TndWSFRLcytEampCVjJDODdOaWMvdkpyKzZNcnR6Q0NKT2liRlVabUU5dUp3?=
 =?utf-8?B?YldJSmpXYkNLMTBMMjZDNCtocDNtekhjTDJpSjdyUzlNSXNMMHJWZTM2K09J?=
 =?utf-8?B?TlZzNm9Fd0NGMlhsYk9YMUVZSU1rTHRrRkY4K3N0RkptdHZEMll5RXFMZGNq?=
 =?utf-8?B?c0I1cWpOcDNnbGtZRXpPcHBvd1l3SUZ6RHd2NE03NVd4YlBKN3BUMVBRU2Fp?=
 =?utf-8?B?Ny9TR0xGbUJtYUpPQXdiUC85dGZBS3J2YkpOVDg4akpZU0ZReTk1Ukp6OGdJ?=
 =?utf-8?B?N3dDMWN5NmpJMzQ1QVVDdlVUbVZoTFF6MWdlUkwvTjR2THRocWUzd1RNTnkv?=
 =?utf-8?B?NWVFTWZPdW5zYStydVduaS93RDBVRUtaTWhSUWJscHdzL2tvUmU5Nk53Vjhk?=
 =?utf-8?B?LzVxVzZ6OXdOT2l6bGdLam4vcXpHVjl0UkRRYlF5ekFuWnZDT0ZBSWY4Nitk?=
 =?utf-8?B?Vzl2UFRUc1hUWTc2S0V3ZWozT085Q0hFV2I1b2FkRDBGNTBNSno0MWQ4bi9z?=
 =?utf-8?B?bFhOMkw1NzJBMXFaczhONm5jL3N3ZmN5WVk4VWJIRGxnTnNmVTM1ZVcwWVFX?=
 =?utf-8?B?UHFMWnZvOHdjWTV2eGxibEhTcmxsUFRSUDg2MFB6cmJyU0gvemkvV0Vyb2Nv?=
 =?utf-8?B?Qnczdml6L3lLeTRVU0pwV2VtYXhqcG9TUlFKTm1Bd0dKRm9yZ2Jtd1c5TXRW?=
 =?utf-8?B?RVlIdDNNUzdoRnFKN1lEVDJMY1RTMTJxSW5HNGJ0ZUlackZqQjdFUldBaGZT?=
 =?utf-8?B?ME93Ni9xTndIRHJTL3dXWjE4bjlyQU9hNGh0VEFtMFdPUjllRGxWMDJwVGd4?=
 =?utf-8?B?ZVZiTmVGMmhhaXhkbWtxczhja25PbHloU1FGR3R2QVdIMTlPOU8yUElJaFZi?=
 =?utf-8?B?TlkyU0VzeFc3QURiRnhqOUVTVFhEa3hjNnFCY0p4Ulg2SkNuNE42OVBhWnpj?=
 =?utf-8?B?Q3h5aHlYcFgyVXNBYkRoL2JLSEFpY0N6ekxUN09pNkVEY09TSlBzVWhnQjN6?=
 =?utf-8?B?alhlaFlleTYrYytYY0trRWNCT3B0TmQ0MEtGZkZIUDdKOExVSjg1REtLVTVo?=
 =?utf-8?B?U3U2OTkzRDg0OVpBZndaZStESVZNaDlob00rV1dVM0RQU2FNdHpiT2lkYmFN?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 295d77db-a073-466b-3649-08dca19de11f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 11:37:43.9344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiDAQ8kM63SfeohG6HEsSK4nWD0iM/UNeoT4xj0qa1ZUpL90luEdU3ohuSteuQvuq2K72dKTyvBWosUbsIZoTGOEyuk36KL62XR2nJX8zmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
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

Hi Pranay,

On 11-07-2024 03:48 pm, Pranay Samala wrote:
> This test is debug logs are too much and was killed
> due to exceeding disk usage limit on the less disk
> space machines.
> 
> So dynamically reducing the debug log level to 13.
> 
> v2:
> - Using "" for the defined header file (Bhanu)
> - Not using exit handler in this file (Bhanu)
> - Not using any magic number (Bhanu)
> 
> v3:
> - Calling loglevel init functionality in lib file (Bhanu)
> - Here 2 means the log level will be reduced by 2 (Bhanu)
> 
> v4:
> - Send the required debuglevel to directly to api only if debug
>    log level is greater than 10 (Bhanu)
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_atomic_transition.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 29dd8ac4e..618fef8dc 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -34,6 +34,7 @@
>   #include "igt_rand.h"
>   #include "drmtest.h"
>   #include "sw_sync.h"
> +#include "igt_sysfs.h"
>   #include <errno.h>
>   #include <pthread.h>
>   #include <stdbool.h>
> @@ -1174,6 +1175,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	int pipe_count = 0;
>   
>   	igt_fixture {
> +		int dir, current_log_level;
> +
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
>   		kmstest_set_vt_graphics_mode();
> @@ -1185,6 +1188,13 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   		for_each_connected_output(&data.display, output)
>   			count++;
> +
> +		dir = igt_sysfs_drm_module_params_open();
----------------------^
In case of failure, this function may return -1. Please add a check for 
that.

Otherwise this patch LGTM.

- Bhanu

> +		current_log_level = igt_drm_debug_level_get(dir);
> +		close(dir);
> +
> +		if (current_log_level > 10)
> +			igt_drm_debug_level_update(10);
>   	}
>   
>   	igt_describe("Check toggling of primary plane with vblank");
