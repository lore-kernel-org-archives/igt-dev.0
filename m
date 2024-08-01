Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED15C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 08:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F4F10E8C1;
	Thu,  1 Aug 2024 08:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLM5oyVr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0696010E8C1
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722502195; x=1754038195;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kIV/o1BezxMkios5P4cH/QNGbggAKq5dbrY63bRgluI=;
 b=bLM5oyVreb2Ijls9z2WoSO9x+Cb4le7DnpVvxy65/elZF1CPvB8O9QAJ
 EZj/3iX1qLjl1kudIz7FauDTCfRAHtgF0MTNigYeSSoYB9B3/AlSU+bL8
 jWypWCAurk6BAwtKN0PufzkrH91ycqtSsqNP6m7GDasm43U85qTlagT/P
 y+25vaijgi19cqTWCumDgJJ7Rp9JlO/wYuQ7z6ZUs+9TyAVOtXeWkmg17
 53PfUsPisqJ8LYhS/GpyfqeYN+iS9LyeEo5rAKBTiDc+xmwRgPdUhUjp+
 moPlBEJrOzDsLSssqIZNx+VytTDLinIeclh/io957PkwriPMv6Fv1loI5 Q==;
X-CSE-ConnectionGUID: z3fJBgZWQUqUdySYHIQfOg==
X-CSE-MsgGUID: i1w597/HTiGBkyT9hIEwyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31019123"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="31019123"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 01:49:55 -0700
X-CSE-ConnectionGUID: SWNXm1V4Toq9f5VEqMA3yw==
X-CSE-MsgGUID: OBPGOfQdQYmeiXxml8XjMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55557534"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 01:49:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 01:49:55 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 01:49:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 01:49:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 01:49:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkWR/lb3+Tr3W8SJzXvPeAU8RsCekTQh7m7tGoRyqyHm8kCT/OAXObDx88rrXN5U0lsZXOkBEs6snDrEUfK/IhgjuaaCw16bRthbwN02R6IQ0C0D3G7j3agy1D6QEq8GT66Xy+7niiym0deUvzYQgMsR2DDaoZgxnYMven0c83/ydcV5gY5N8Sd6WHhFW57EeiN3gDrHLBtACjG/t/XUTBhJJOmLJI9RQwTHWtUWSh24tzH6VFoQ+ANdKB+BGJzYZ39sJB8DAcHIpbfUoXTfxEuJy/ehUuIhr7FNG6lCsZfVkwjqsnQ3KbmtDv7XX0LGgVjZHTXSpI4avNTZqibNAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNTovop3bkXI2Ng/CicaORa3KyYecAlwKM9pGY44dwU=;
 b=bx2UVf9TzECBj6Gmdc27uwx7P3/4Hbh3eXH+wpCSuPlvA+3OH8vszgQZjukvn2OCepLYAR3tJajcF2P6xiyuPwO2V4U1XIfWEdEsJCButpQ3R7SJzyhgLRo0rSDKJolqEFhZwLULDCPJLrZNYSBLYU9cIu/sC15y+bK4Z9jONAULtUuaWAktu3dzdu6sOk+87NFOVWbLNvbp63z5W+LgFf4dT7CcRVHdqftwceJ2lmWG9wrpVvUOr2CLGJIHDZ25S6+AToMVDn/Kx9heTCFdK3+QDzJTVZpVv94eLSF32HLY7SnbEdr+IiQm3DKFw15KU9fLgTsMbcbVT5L1MEZQxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SA0PR11MB4768.namprd11.prod.outlook.com (2603:10b6:806:71::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.22; Thu, 1 Aug 2024 08:49:51 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%5]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 08:49:51 +0000
Message-ID: <d33c2af6-5d17-4878-9c82-ee715e200894@intel.com>
Date: Thu, 1 Aug 2024 14:19:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v3] tests/intel: Add tests to run suspend without
 display
To: <igt-dev@lists.freedesktop.org>
CC: Anshuman Gupta <anshuman.gupta@intel.com>
References: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::14) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SA0PR11MB4768:EE_
X-MS-Office365-Filtering-Correlation-Id: 044256e0-7871-4cfd-a0b0-08dcb206e80b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aW5GVVpFRHVvVmRqcys2WXlMRngyNWlrWCs4YUtwVFR6SkE1b3ZsSit3S29E?=
 =?utf-8?B?R21aVHhnWVVoSDM4Ny9aUlk5NEdoN2JtOWV1c1JuaTQrdWRSRU8yVkNWdVEw?=
 =?utf-8?B?clZDSGpmSVcvSnFHblFjYkdDN09ic3o4QXNvWmsvUUdUVzh1OW8yTEJzVnBt?=
 =?utf-8?B?MHl5UXduK1BqY3BHNzhIVG5HdFFQWWZqLzZ3QWExN3ZEOGlibXo0WkJ6bzRT?=
 =?utf-8?B?cnNMNFhhbk9uZnBTRHhhVDRqQWFyYVh2SytwZ2dmeG9sdVZHUnNORnpHMUhT?=
 =?utf-8?B?bkptd1FGZUJock9MVDhvWkZWcUdteUR0eHVoeGplUTZUY0RQRURxS0tzaU5s?=
 =?utf-8?B?SGQwRG0yK0x0QkFpZHBJUmpnUURNeUpNeUd6OUp0c2tBL3ZRQ0NEQVJmYlhw?=
 =?utf-8?B?OTRNdkxjVUdSQ0xWbER1WWFBNTZBTDdzU1V2ekMvNGlzTnV3KzdSOW5JYWNT?=
 =?utf-8?B?M1RHaWFhQmlENHJidy8vM1FvQXp5K1kxQzhaNVlSODIvVDV1ajdIQ2wzR1pm?=
 =?utf-8?B?NVA2MUNZZHB4SVYxN0hvNHJ6WWt0OStRcGRwUkFOUWh1ZUlXdDRXUk1XY0NG?=
 =?utf-8?B?T3QxaEF3U25YWVlzNFRsR1FMVWR1bDFTTGVVZFh5TGJrZjdiTzhSK3BiSFJv?=
 =?utf-8?B?MHBDV0E5cXZmeisxLzExT1JRV3NnbnJlajZNbFlTcXJ1MFdRWEcrWWd1c0c5?=
 =?utf-8?B?RGM1VEtEaWExM2Q2L1VzaEpnRU9VQmJnSTRhTUsvNURJWnpRdUxCTkJoZWxw?=
 =?utf-8?B?d0ZWQUpqcFRqTTgyVmJCZW9sNlBVSTlMb1dyWlBmU2J3S1dsVVNzK1g2Tkd4?=
 =?utf-8?B?K3M4VGRVeWh6ZGpUR2pOeC9vSlljUDNnRVd2dzdnZzF5NWU0YmFEREw1and4?=
 =?utf-8?B?a2NDZmtZN3JaWlN4Z1I3Wk80enBrSk80bFgyd21Nd1lWODczNkxDMmpFS3Bs?=
 =?utf-8?B?SlUycXFhbDNzWTFWVGY3ODZOWEFXSm9BK3VubGJjbVh6VW1Nd2lrYTMzWmhx?=
 =?utf-8?B?RjVGeUMvUTNrQm9WRzU3eURDYjR6aFlqMDgzZDdKVlJ1UTBhQTdydnFPd1du?=
 =?utf-8?B?aEtzemRVQkkzRFNQcEJFTzc5Qy9ZY2ZINXdUdnJGKzdoMmFaWHIwTTZwZHZQ?=
 =?utf-8?B?RzNocFJVVUFxczh3QlRySm1xaXJZRER6Tjg3RXJVRXRhWXUrSExPMWMrWTNT?=
 =?utf-8?B?by95RHZoN2xSUFIxL2E1ellmeXhqVkJSWk5LUFlhalpOdmdObStsNGNiVmox?=
 =?utf-8?B?TmJDSkk0NVBMMXprekp1UTUraDlPdDFGMElmdHpwWEFoVEdiSGtOY0haRmY1?=
 =?utf-8?B?bHo1R0owT1ZSNHpoWlI1RHhlWlhFQUtXcG5DbXRUekZ6SWlCQk1nelVFeGpm?=
 =?utf-8?B?RUh6cHlkaWhiZ0lVV0RpOG5kb3E1SUNsU056Wngyd1lRcFlHL0p5ekhXa25I?=
 =?utf-8?B?S2FBdnhLOXFOUllKek92RjV2RUdJVmVvOEwyeWtGRmkyemRhWlB3a2c4TEVU?=
 =?utf-8?B?L2hJRGovczhtK0ZwQm9EaThpbFBpWmtzMUU2TDM2YVdiLzgyQ1pOaUJsQ1Ri?=
 =?utf-8?B?MFNuZ0Nxdmt3ZWlOb1NubWtXRHdlT3J0Q0ZZbkhFQndlMWNmeGh4TE9TbmZH?=
 =?utf-8?B?TnZMVjNmVVE0SGxuR2RwNDdhTjJEZjQvem92TDZLUzZLb1pZNGFHaDJDV2Vr?=
 =?utf-8?B?c2RjZ0Y5UXhhWDBYY29hdTIrZUh4MjNSbElqblJORmZoczZRZXAwMmVZdllr?=
 =?utf-8?B?bnZESWRkQjhXeGV1azZCVzR1cVh4MjdYZjRmaXdUcW5VRU5BRmlXSjluNDZN?=
 =?utf-8?B?ZG0xK1hpdm5CcG05V2FvZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmU1RXNCdk5JUWVSbHczNS9rM05FT3pTaXlLUzljam1iQkdwMkdtKzJQV3hQ?=
 =?utf-8?B?d1dmeDZIS2NjdDR2MWFSYlBOY3Fma011R25NUWZ0TEx0cGl3a1lWVXRzVURC?=
 =?utf-8?B?L1JvS3VQd0Z1MnZzZVJJRldGNHQwcjFIWTlWTFVyYTBBWGxIaHAxSTRaRE94?=
 =?utf-8?B?TGo0QXBBWC9KT2FjdWErM3ZJZkZCY2xUalU0dU54cWtaSG5tbnAvUjgrRzBM?=
 =?utf-8?B?TjRRcjlqZTMxSWpMSWZQRnNTQWp4WkViWkZHMnd6TG8vckV2amRKOFI4ZUtQ?=
 =?utf-8?B?YUNVQ3J1R2tRUytPcEw4UStCWEFtKzJ1R25Vck5vajdwL1lsaFNlZWNYZkpz?=
 =?utf-8?B?TXZ6MUJhUTJvZXdLdEd6dWUxWkl1Vk5QcjZtYytScG5rNjJ4Z3M1bVd0d0d0?=
 =?utf-8?B?ZU95dFVTWHd5bXZGbU5yMHY4akVMa3I5UmRwWDNvTm56NDNUbGN1L0Vvc0FP?=
 =?utf-8?B?VCtKWXgyMldVYjBZSlRTNmJBbkhBNThweE5VeTR4OGIzSk9QcXBQeklVNDhC?=
 =?utf-8?B?Yy9XdTB6SkdlMVlhOW53RTRxRHNGN0VYOGJ3cTE5ditIakk4ME45V0M5MUJi?=
 =?utf-8?B?UW1qZlZYcGhEQWdqSC9BVStQNWhRYy9OblR6MVhURmV2N3RyQ3pWSHBoRjhu?=
 =?utf-8?B?YkNIclNKQ0swTmROcnpsTStMMnlEVFlic1A2dlllaEpYMVRnVDdKZmFoZ2s0?=
 =?utf-8?B?T2pLeERyMktObExNTVdWRnJCaE1vdURkN2dtRnBSb0w4NmR5dTFKTU5nSkI5?=
 =?utf-8?B?OWIvendVU2FXZ2tyRUN0YnhidmVsRVB4dEowNVhORUI0eGorb0tCaXhHTXBm?=
 =?utf-8?B?ZG85QTlEazMyeXRmelNYZEkzZnZDVTk4U29sZUlwbFk1WWw0L1ZqYi9KdmZO?=
 =?utf-8?B?R2RMNnRIUWhiNG5YTVgvMnJsRUlRZDc1QmlDQ1dwS0hsdjdSaEo0MjM3NU1i?=
 =?utf-8?B?QlRZeW01dDF3dkZuVjF6d25hWkRGMWRKYXhBNzZzNTRSSWF1YUQxOC9vWDNJ?=
 =?utf-8?B?QVNzVlQ1YjlkYjlPdzJKNXBTbHNYVUljcm9PZ0g5UGtkUW1NTnN2UFU3SW5o?=
 =?utf-8?B?R0Nienl2M3NWTlRwQzlYZG5CZWYxc0lPSWc3Qnk4ZXBlL0dkcU44Z3doUDA4?=
 =?utf-8?B?d3ZBQlBzZklOdlFoTWpKMm5MV2c4OGhLNWoveFNxT2l0WmJ0Qzgva04zd2do?=
 =?utf-8?B?TmFPbFoyUjYzMFNCZ3ptNFlCWmFycDFjNnhST1BtSyttaDNXalJlbldUN1hU?=
 =?utf-8?B?eXRCQS9kRzZua2hZU0srM2RDQ3c2S2dSa1BHTDlaRTRicE1CNmRBWDhEamVQ?=
 =?utf-8?B?eE9aT3ZWa0F4Qkd5ZjBFU3QvY21MelpqL1hHejQ2cWRQanh4c2JYa0dFcWtl?=
 =?utf-8?B?akpCZ1lwZm1Ld2FLZ3UzZHVjYjlCZ3h3ZG9rSHJZTXdHNlFxSHh2ZUl5eUxu?=
 =?utf-8?B?TGZjQm1rWlYzdE14d3BOZWNveWlLY3c1dGQ3R0Q1eTZDek1MSXRLZC9OK1ps?=
 =?utf-8?B?Q2hzaGc1VStleXRlN0YxNWNsNkI0RjJoTTdqSU16MG96dXFtUzdoVFp4YkJM?=
 =?utf-8?B?NjJ2YStQYlRSTHJKejViekdpU3gwVVhhMklSSnc2bjFLUFB1ZjRmN3Z5YXBL?=
 =?utf-8?B?YUFrMHk2VVUyeUJYYTNTTitGNERKMDlYeW16N0NDd3lXU3hxb1pTazZTVUsv?=
 =?utf-8?B?WDRpa0JZN1FldVRVSTdjVHdlQlZ0Ym5hQUszbHFxV1drd201c2xiV01RVGJM?=
 =?utf-8?B?VDBTNFdrSS9rMHM1bFZqTU9wR3FNbzVVS3c1bkNtOFY5UUJ1bGRENTNOQmhQ?=
 =?utf-8?B?YmVDZlVjOXdIMytLRFMyV0o2cjkvMjJPK2t2VGt3ekYraUVpS242c2VZNGE5?=
 =?utf-8?B?d2xLN0ZmMzRKUkN0emNLSU42b3JadzNSWVEwUjlMeS9rV3dVVFdtQ0xvOXBr?=
 =?utf-8?B?Z1p2SnVNZWovRTB6SEhpRjVUNWgza2pjdmt2THkxQUhNeUk1WmlxVU5qYWRD?=
 =?utf-8?B?QXd3OVFreEc2S3Zyb1ZoWjVyS1U0dDZMYzhoVWh2eS9ybWJWNnhyU29ZYlZx?=
 =?utf-8?B?MUhzbkR3MUwyVFdVaXRUUDRPOEpsYjNHUWdpUlVNcDFaeFBSeUp5Lyt5YzJY?=
 =?utf-8?B?V1dseFFjcW53U3M4T09HVDVBVG9WSXBab3BQUDVUUlRrbURVZGJaUXB4ZWxt?=
 =?utf-8?Q?BsCOCIs7YDtD7VXN1YXvTYU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 044256e0-7871-4cfd-a0b0-08dcb206e80b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 08:49:51.5632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTD9KINO0GmmenObkTyWN9HKSm8deDyRQHC6xUGTOt45mq+gw5ZUMAsTTHgaMTvxMBDHxeVT5jZEsfpEe/CUMRMEv4TIbsJtA5rZC7kVSNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4768
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


On 7/30/2024 5:05 PM, Sujaritha Sundaresan wrote:
> Add tests to validate basic execution suspend/resume cycle
> without display module to rule out display related issues
> from the suspend/resume stack.
>
> v2: Add normal reload cycle after running test (Anshuman)
>
> v3: Rebase
>
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 8b115e2f6..03f742265 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -17,6 +17,7 @@
>   
>   #include "igt.h"
>   #include "lib/igt_device.h"
> +#include "lib/igt_kmod.h"
>   #include "lib/igt_pm.h"
>   #include "lib/igt_sysfs.h"
>   #include "lib/igt_syncobj.h"
> @@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
>    * Description: suspend/autoresume on %arg[1] state and exec after RPM
>    * Functionality: pm - %arg[1]
>    *
> + * SUBTEST: %s-without-display
> + * Description: suspend/autoresume on %arg[1] state without display
> + * Functionality: pm - %arg[1]
> + *
>    * arg[1]:
>    *
>    * @s2idle:	s2idle
> @@ -681,6 +686,7 @@ igt_main
>   	struct drm_xe_engine_class_instance *hwe;
>   	device_t device;
>   	uint32_t d3cold_allowed;
> +	const char *opts;
>   	int sysfs_fd;
>   
>   	const struct s_state {
> @@ -757,6 +763,34 @@ igt_main
>   					  NO_RPM, 0);
>   		}
>   
> +		igt_subtest_f("%s-without-display", s->name) {
> +
> +			if (!drmModeGetResources(device.fd_xe))
> +				return;
> +
> +			xe_for_each_engine(device.fd_xe, hwe) {
> +
> +				igt_debug("Reload w/o display\n");
> +
> +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
> +				igt_assert_eq(igt_xe_driver_unload(), 0);
> +
> +				igt_kmsg(KMSG_INFO "Re-loading Xe without display\n");
> +				igt_assert_eq(igt_xe_driver_load("enable_display=0"), 0);
> +
> +				test_exec(device, hwe, 1, 2, s->state,
> +					  NO_RPM, 0);
> +
> +				igt_debug("Reload as normal\n");
> +
> +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
> +				igt_assert_eq(igt_xe_driver_unload(), 0);
> +
> +				igt_kmsg(KMSG_INFO "Re-loading Xe\n");
> +				igt_assert_eq(igt_xe_driver_load(opts), 0);
> +			}
> +		}
> +
>   		for (const struct vm_op *op = vm_op; op->name; op++) {
>   			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
>   				xe_for_each_engine(device.fd_xe, hwe)

The BAT failures are unrelated. The CI FULL failures seems to be 
pointing to Xe unload being unsuccessful. I have submitted that for a 
retest, however they seem to not be related to the changes made 
specifically.

Thanks,

Suja

