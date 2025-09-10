Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C07CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 18:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC76D10E9B2;
	Wed, 10 Sep 2025 18:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OizmMA7o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C704610E9B2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 18:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757528399; x=1789064399;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+Quz6b70s9GBvX1GbAMRIb1UkUuTSg9RjR/oKTJ1VDg=;
 b=OizmMA7ouO8yGw/H4IKB/kYeglzP5iJUCwM1KwRS0GB7G9DrDELOvHCy
 tuNsekJ4l4r5Pu136RLWV3LzHROiDElpOQermsoli3hwmh28VNCOv4s3/
 5MtH1K5eNaj0HSeslk4wle9DivlQmiyT0QP3dVSGcKvZSpnjSqnt8fN+1
 CBm4SLJL8+3pN+VL5D/YlL25zfGq3YEXFo8919gHCLYY+gyJsyIGWNP2S
 rDxPq6OvZUzIL1g3bNUpwgq29UW5n2ajJrhnJvUsh84b0qqnrHTdvSGCU
 T9GesWHFUE3EazG2qSFLjwrDga7w99H74yOBRO3cKGRvx3Z6yOdVf82Wl w==;
X-CSE-ConnectionGUID: TxBNBFQ2QLiBnvtq6qfiFA==
X-CSE-MsgGUID: SxfH0ddRSNibTzwS8w59bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59770377"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59770377"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 11:19:55 -0700
X-CSE-ConnectionGUID: wLcbUQE1QAiV18EyULtI1w==
X-CSE-MsgGUID: i01+ViwiSlSzLjugfAyEjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="178678505"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 11:19:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 11:19:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 11:19:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.62)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 11:19:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7kxBVEm/U2NxqdDTzWarA8uj3kMLhynWCwWTjkA1BCVLnA+Jz2vyAvR0BjLE06+SY4ECZB0o6QC6GqHQKop8kR00Sg7X1ApqrbqsIkw6uKv55/pbZj8tB6KOGidsL0wDpN8eQ59CwVVseGGhvh1hkkGtR11ePSpENtzPI3MQEIq9TN/IpgPffPQGrqN8D2dQU3yvkZtYLC5YfEWc26XQ4feO4ivlezhgvv8jO+tOdQE+kv3tJBZB0ZzHapi7Xdd3eQk/junshY9uO+xkrLHWjbtrXcbxKQbRU/Ed2sCqtaTKAIh7bckAoSUAin3erGNZ+QfsFWhG/vtT0zQyt4eQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiJOtaT9DcxepcJ9pbesnYaj3GrqlmSP6CayZjF30iQ=;
 b=Ik9cRRbsvI1EpLev3fInP1ab6CzLfrGbPjHNGE/EXsYCeDqIG7QJ/Gfu9zU64Tso0cBRSjU3lBIwQRO1JeqpqkOMBMJSN51PX48KFQlPvb2svHBX9d3uiN4DMfngWxC3L8y1B8vrlCm8JfjW5q17i4RFvmPHXkIEXl3VBfIU/S7fZKhp4MPdJNeChIwT8Yh2PqqyBh+bqIF6ti8Xq7sMR3I68O4ug6UmSebXQzurVPjncp4HN/GBTqtZ6d1uWwmwIFMiTvC0/tJEwa70IcH5z1CcTY7/xSxjqLgnDrptcyzXAwU/+uSMZbLbUKx2ivNiPlCK8v9Ad1bqiVzM9swVpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS7PR11MB8853.namprd11.prod.outlook.com (2603:10b6:8:255::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 18:19:52 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%5]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 18:19:52 +0000
Message-ID: <5f441094-b016-478e-8786-574291daafad@intel.com>
Date: Wed, 10 Sep 2025 23:48:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: reduce exec. time for sim
 env
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250901094828.1232305-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250901094828.1232305-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::14) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS7PR11MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: a5fdf8f6-db39-4db2-3b39-08ddf096a26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnpBa3I1UzJSNzdwK1hWNTk5UzJ1QzBnN0tCWWFiL0ZFWGt1NkJVczhLUGFt?=
 =?utf-8?B?YWU0U3N0Z3ExYk1NcitaRzAvMG43cWRmQjhEMG5XS0pka3g1UnI3VlJ0MDZL?=
 =?utf-8?B?UTVQRE1Xd0FkelFTQlRmT0ttS0xaNitjYy9YdVZNM2Y1SDZ1VGFnR0l3WGM0?=
 =?utf-8?B?eENGaE1YM2hTQ21pMG5kQzVIM09RdmFvOEhyM1Iyb0dPMUdsdDh3UGJ0eDBw?=
 =?utf-8?B?LzhzaDdTaFVidVFZUXEwTXFLeGtVeUVBdEdYMWVQTGhOeHlLMURpWHR3VGFO?=
 =?utf-8?B?aHd4dGVLRHdzbUtUcDU4N3BmalgzZTREVFBrOXYwbjd5eUtZYUF4ZDBUVDl2?=
 =?utf-8?B?K3VnREROeTlEMDN4eGhJVUdwR0JMVjJsSTVUVlRENGcvbDN4TDNKbXFNdHpZ?=
 =?utf-8?B?SkNOVlQ0bklEVkV5K283djNseHM5SWp2Yys2d05xUDNScXJXWENzWmNHUEVT?=
 =?utf-8?B?KzR0eEh0ZDBUWno0NWZ2T3FwRXp0MFZteTN6ck1SNWZMVWVNN29Pa3V6QTBB?=
 =?utf-8?B?Z24zeW5UeE5HRHZwc1JlUnlXSlZXU2RHRTB1SnJrc0JaMCtxNmQrOXdtQVND?=
 =?utf-8?B?VUozM0hEWEMwOEh1bDFiWllzOFcybXFWSEprRVlIeFRCTm1tbUdSeHBBQk9u?=
 =?utf-8?B?VUd4VFRiZk0rbUZud1dPRG9KQ2YwbU1OZU9hRDZZU0tmSUN5d1ljcWFMdVBS?=
 =?utf-8?B?Nko0TzdtUmVvTnN3Z21MVHUySEtScjVZcjNmZEVXQ3hBUTBVa0cyN0MvMENl?=
 =?utf-8?B?YW1tSG5ZUndmbCtCL0ptZWVnUUdqRmZwYVBGcVhsckxVU0syRFdad2dGMVlP?=
 =?utf-8?B?bGkybWhzVnZqL0dQWEw3OE9SdGN3NzZJWkZoSEMxUWE3UWxYWGt0TytWZmho?=
 =?utf-8?B?ZGZ2MEc3dkV1ZFFVZlBjNjBjVHRleXc2OGxRYmowR1ZyNUZKYjdPSHJYbnZw?=
 =?utf-8?B?NU5yL01mczZIZ1VwZlZPTlIvME4wampTYmZuYmhjQkxXaU5HRU40aEtaaGVK?=
 =?utf-8?B?NlVlMDBIc1ZXRDJXYVdDSXdnekYyOUxXNURadHhXOWgyYlg2NkdDdDBJUTVu?=
 =?utf-8?B?OURRcGlxNjQwR0ppQlVjUXNsek9raU1uNUF6SU1qVHJ3VTA1L2w2dTB2U0ty?=
 =?utf-8?B?SzQ3N2xWWXJzcE85cVZmT3dMaFFOVmxOUm5ScWFzQkNkZ2NZeDlHeGUrcU11?=
 =?utf-8?B?dnVFZGRXRzR1MGM0Y3I0ZzE1czJybUl1NmlZUFJuQU5leHRmbkw4R284eU9t?=
 =?utf-8?B?WTNLSFJPb1ZjLytEbTIvTXQ5VTFhR1ZPdzJ0OWxINkxZemp0YnlIajV4b1lI?=
 =?utf-8?B?eUNDbElnNDc2RGlQYmNKZU95RnJKa3ppeXhPb0QrNm5UdEdWcjJaak5xNENn?=
 =?utf-8?B?bDJUUHAxQW1jSjIyTzVvR2MrS0FkUUdudDZoUFhMK2p4Q0o2T2NHenFmNVdy?=
 =?utf-8?B?TzVPcnZIRUliaEhweForVXB4YjFMUFRyOURyUnBsaHYrdTdrT1NCM0ZYVDN1?=
 =?utf-8?B?RVQ0MFZnSHl4bWRLclZEK2w2cHpqRHVUeE8zOXBYeGoyZTRrcXkrT2dxRUY0?=
 =?utf-8?B?RktOdHZISVdsS1BNUC96ZUI2eHpyd3YxbGVRZ1pqcmV5MEk1UDZLK0x0SGdy?=
 =?utf-8?B?Qm1tRWFBOXNNQWpNRlRlRmxRZUdldEFCaGFiWkZOWUd3Q1k5Q2V6ZTkvT0hY?=
 =?utf-8?B?Q3dBeXdQTDMzYTZ0MUVkRk44YjBNWjBHZ04rdFNsMXVRM2I4aEdUVm9yNUdU?=
 =?utf-8?B?UzJ0Tk1ORFBqb1Z1eG53RHk0MlFGSGZRd2Y1V0ExMHdiWlNKZzdVTitEbXp6?=
 =?utf-8?B?UEdKalo4SGF0TGFtN1dZNnhYUWpBajExVFhCY2ZSemFKL0NKTEk1S2Z1R3VY?=
 =?utf-8?B?SWh3RnB6SS9PMDNrcyt6dUFzVzJzR1JEOWY1TFpaaFk5d2NRZjQrUjhMdita?=
 =?utf-8?Q?Qthj0NiwXIM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VS9lNFBPcTNkeHlSRll3TjNvNTNQNnZZc1E2WEV3SVFRVUFobmc3RmZnay9B?=
 =?utf-8?B?K0xBWWxPc1hhdVB4ZkJWWW9KdFo4QWxVNDVsSTdGN2tja2J3YzJsNDB6Y0Nh?=
 =?utf-8?B?bDdSV0lmc20rNzl2bWVxeHZ4Y2RSK044bG1iMmxDKzdNWUkzUy9YMlNCQy9z?=
 =?utf-8?B?bXdmQXZ6Y1lTMnp4dVlEU05xMjVvOGY5NzBBNDl2V2w3b1doVXh0cFo5ZUNU?=
 =?utf-8?B?dzkxSTVGa0NwazFsWDFuSUszVkxkdk4veWh5VGZJNjVTS2doZ2VYSHNIMHVT?=
 =?utf-8?B?Y29Ra0FpejB4ODBzdWVYRytCMXpsVTBSblJ0T1dhME5xdDBjdFRMYUlsT0V1?=
 =?utf-8?B?d1ZyT0ZUVmpxZDNGZTVNN20wV3NSMW9VZVB4VVlkdXRkNGRVM1czZ2xOSXpE?=
 =?utf-8?B?UUUyOWltVkRTVERVR0U1Yy94T25VaytsM2N2b1VaZ3BENVYvYkJpaTEvdGNY?=
 =?utf-8?B?UnYzakZzdVYveDNweVJsR3l6S3JNeStiZEFIUWJ3QW9WUGxJQUxJbzZqZU9G?=
 =?utf-8?B?VGpSZHEwekMzUjlzME1SWWtkVTlLTTZHQ2pTQnVKV0pqK0hZL0RjbE5SUGVp?=
 =?utf-8?B?elBSK2FsL1lGNVBRTlNnTklRaTZUR3J6Y3Foem5yblAzQm9QNkRjN0kxWlp4?=
 =?utf-8?B?dENpZmdDNlV6QTJqdXZBVDhlaEFaQ2dpNHl5dlhhRFM4NVdHSTlGbDBkMFlU?=
 =?utf-8?B?c285cnJpS3Q3VG5vdU9qYkRWaWo4TUNzMzU3T0NXM2xmc0d3NU8wN2lIdlJB?=
 =?utf-8?B?SVV0NlV5cHBtYWNmczdpMlcxYitCLy9GQ25zdWlFekVNeGVzK0ZvdkRTSWVG?=
 =?utf-8?B?NThxTEY1VUtLZERiNVRKN3BoR0NIMHdPSEU4dlowVmVnUWsvU3JCWklOSmdm?=
 =?utf-8?B?ZGxuK3JEZVhHSzBnYXZOSHllMWJjSEo4VlhiSGZzTEVPQ0NVc0dmTk1zbHpT?=
 =?utf-8?B?YTVZUmo1YkJzVzFzZENmekRJdGZoWTdmMGlVMFUxQjNMRlFwRytDQSs0aVRj?=
 =?utf-8?B?MG1TSmdqYjdDRGRRUVpKSmtnbE55TWJ4R2IrUXdrQy9MMWdla3R1SmVNU0JG?=
 =?utf-8?B?eVYzclc1YU5kUlZibzN6NUxOZWVFSnc5N3RwUVVtQzN4SWR1TVNyRnhoNG56?=
 =?utf-8?B?MUJZdXRLUFRXbklKa3EyL01obEVUbUhHN2huVWFFQ21JNDF6SW5aekxvUUR2?=
 =?utf-8?B?K0p6bjI1c2tTTlBsMjBUaS9BVDhJWHRBN053NGNBTThWcUtldXl1ckoyRWZT?=
 =?utf-8?B?UDVVYTRUUkN4V1FhUnJ6VFFGZGVJSnBGVWZzTlVzVjVjWUg0MzFINEdwR3dH?=
 =?utf-8?B?bThQOHpHVzBhNGNHeFdicWRHZk1FNXk3Y05uc1RTRDExZEZXNXZETVZuam9V?=
 =?utf-8?B?WmhnaU8vaC9jaEpEVU9nc1VOMGdOOUhpVzFWWjZNWjRKMG1aNWRYdzJBRDNm?=
 =?utf-8?B?cHEwWmZ3Sy84K21OcUJBVTE1NjJ3aWxydmdaRzVZbUNMa01mS0ZMRzcwMjl6?=
 =?utf-8?B?Q2FVbVdwRG9yekZYZHBvSXVjcC9Ed2FVYWV2SFF4ckdVZDhRK1NOd1NQZTVa?=
 =?utf-8?B?a2FYUTNzT0NDNTN3VEVHaGJoZkVjMUZiUUN4ZThLakJzQlMrNllYQ0F1NVpu?=
 =?utf-8?B?YVRtTW5MZFd6bUJHM0IzR1pwR3hJQUVjeXpLTmFxeEhRSGNLT2xzNHJUb2lp?=
 =?utf-8?B?bWVwbzZLeVd0MnJVMGNFRDUyNEl3cXd4NW11cGtZZFlxSFFESFAwa0NQZlM3?=
 =?utf-8?B?WllMbEVCdEx4RmlaeUxQaThCVkhEbE1oQkZnV0RpQXJyTHFGLzI5NlNlcUNx?=
 =?utf-8?B?Y0hua1FMWk9lRzQ0K1hZZW12emNBbG5jcThaMVArRkVsR2hlL004Ymw1RFYr?=
 =?utf-8?B?S2V6WEhZZEpXNUNaVm9HUFVHZWRieTRiNWFlMjVxdU1pMEROdTgwOXR0Q2dh?=
 =?utf-8?B?Uks0SjhoMkxxVkFjdGFHa3J2LzRBNW5zaDFOVEYva3NZV2xnN1V1RlYvR1Fo?=
 =?utf-8?B?UW5OSFlWaXZXWTBKL3RYZ0h0RlhiK01UcUF6OU9EdElHT21kek9RUE1zdjgv?=
 =?utf-8?B?MExWejB1TDJleTNxUXBJUjZwekpRRmtORm1UTzBhZ2VJVWxpUVE3U21jZ3Uw?=
 =?utf-8?B?U1gxMjMvQ1A4NTFycWQxM3MycEs0OHhhSlJvL25kMnVHbHA3QStCQUxIZTFq?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fdf8f6-db39-4db2-3b39-08ddf096a26e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 18:19:51.9583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGFbJDim8ycklCWZm5xuHY4OZKTGAwW5Ifft4EsGpQAIG/0mC0SXoSGHlVX8ZOt7oGnCaPGCk1NpaelS+RrNxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8853
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

Hi Jeevan

On 01-09-2025 03:18 pm, Jeevan B wrote:
> For simulation environment, we can reduce execution time
> by running test only with one combination.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_rotation_crc.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index e18768141..11cf79d61 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -1064,6 +1064,8 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   					}
>   				}
>   			}
> +			if (igt_run_in_simulation())
> +		
This is not required. With this we will test only one planeconfig. We 
will lose coverage.
> 		break;
>   		}
>   		igt_pipe_crc_stop(data->pipe_crc);
>   		igt_pipe_crc_free(data->pipe_crc);
> @@ -1080,6 +1082,9 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   		lastroundjrotation = 0;
>   
>   		igt_output_set_pipe(output, PIPE_NONE);
> +
> +		if (igt_run_in_simulation())
> +			break;
This is okay. Can you check if having this break only helping?
>   	}
>   	data->pipe_crc = NULL;
>   

