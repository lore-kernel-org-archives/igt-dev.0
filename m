Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F35606A31A
	for <igt-dev@archiver.kernel.org>; Tue, 27 Oct 2026 10:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EFBtSO/N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C5510E384;
	Tue, 27 Oct 2026 10:56:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA74E10E39D
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Oct 2026 10:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793098546; x=1824634546;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MhSUQv4FvjwlqxXecoyaC6tzby0PfV6+aTQ5GDlVb/0=;
 b=EFBtSO/N6q7IK1bFIgr/wNvHGLLzg8Nfl/H3YZZxaOSFa24e/14gI/3X
 Tj2nnJ119ck524Le9CPkvk+WMC4pY7n9dauoL7QbamFruFeR5PN8svh2f
 mgkgaUgmF2ZWlUp9BsgtiAm4uuB1NyiQKu2qEiuTlvYVLnPveiqFFRKXp
 qTOfoC8ruN6Oz8WZfABhMFaJcNw5mzo3d/PsX7M7NCdrbqPbLQSceKzs7
 c2WtxnpU3TjBDLwK56NHYyuNqan5uX47arvbRIhidrFMB5ka/yRmOLsG9
 23Dfc967w0HPNRTQTNV+A6exCouLnccDeW0zDn7SGXcwFGyx/5Mc3mrQU w==;
X-CSE-ConnectionGUID: 6cdREoTVQ5myWQteI1AeNw==
X-CSE-MsgGUID: xat5fvjnSvOpv9HHWbk0OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1802920"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1802920"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:55:45 -0700
X-CSE-ConnectionGUID: oPR1R7nwQAu0B4s1TZiPww==
X-CSE-MsgGUID: pEU7EupvQG6fXfNazIuq8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5032565"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:55:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:55:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 03:55:44 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:55:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEsegoCCNKn9LtUszof/lhXPR3dfL1ReV47Q2K6xQ8f434eVjWq804lJoaTTsJaiIcnpPmr4lNd8GToSFSmLV0kJTUbcj9iB0KaNZfyaFSY4einRZSYzNjbHX1gFCBkS6rASX2OHtl2/oNzv5n9P8MGzc55RJxnGzJPLOvhF5HPm2WXgMhZ/YUHZObIZkPn61UqhB2Y5SIwvbdoVFEy6TyWUWixJQVV6XOzPLRK+rq+6+qGEuidpqHmqiQRXEJE48U8bi5kunhh9vjkqzNxJeM2hOwRAJmTIvD8WuZ5UJZ4lraPknDWWmbzbaSaSJXFVDolI7Sb6QNIqD37xWtr7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LiVxJjYQ9SePGAM7AQCmAtIFbIONVf89ao0z6xTN0o=;
 b=BCVzJ4f+9HQW8Q2yXJglNHbN9TzxDpvmo1ivq4wM8XScCQ1ektp7RmR0E3Yi214Tu882Aoytakq8+BF/Q/PdGeh/2x5OiBLev94IgaA78wXEEYZQS5qm6bPxftAR8VJZHbf8gRsCZAKhfSRc5nZl/FB+va92b6cjquIhhHG7Ww5ZkVsW0GqTMZR0m62NOjilz8ySV4EE1I9gRxQSVe7LW+QtDJzF4tBBclNQZ3G50jJFTEZ6PZAYBkftspPb2tv64LXsT8etImyEmuhmkXljXj6ISfgq8617QiFHUVxCO3Bhgk9SypL4wCkMfVqV9ElF7XvEGSLsiRamKqO2uyW8og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5035.namprd11.prod.outlook.com (2603:10b6:806:116::21)
 by MW4PR11MB6960.namprd11.prod.outlook.com (2603:10b6:303:226::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 10:55:41 +0000
Received: from SA2PR11MB5035.namprd11.prod.outlook.com
 ([fe80::9418:cd60:8ece:69c3]) by SA2PR11MB5035.namprd11.prod.outlook.com
 ([fe80::9418:cd60:8ece:69c3%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:55:41 +0000
Message-ID: <0dca3537-6ec6-4412-aa87-a4002712b144@intel.com>
Date: Tue, 27 Oct 2026 16:25:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_survivability: Reload audio
 driver on exit
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Anirban, Sk" <sk.anirban@intel.com>, "Grzelak, Michal"
 <michal.grzelak@intel.com>, "B, Jeevan" <jeevan.b@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
References: <20261015140035.2686997-1-chaitanya.kumar.borah@intel.com>
 <20261015140035.2686997-3-chaitanya.kumar.borah@intel.com>
 <BL1PR11MB5413188823D4E12C92070E0FE2642@BL1PR11MB5413.namprd11.prod.outlook.com>
 <BL1PR11MB5413239E7CA4C069551AD3A8E2642@BL1PR11MB5413.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <BL1PR11MB5413239E7CA4C069551AD3A8E2642@BL1PR11MB5413.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::12) To SA2PR11MB5035.namprd11.prod.outlook.com
 (2603:10b6:806:116::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5035:EE_|MW4PR11MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f907c5e-fd6d-48c4-94da-08df3418d796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|261026140227099003|4143699003|11063799006|5023799004|56012099006|261026121527099003|261021123027099003|261021121427099003|261009223027099003|261022105027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: GMn7tcZLzP1tLe6XT1sBPjlS4Kle3hx+jUzcae9Pi/plYR1I2nBIf8L4c+Dv4BPX2GtI2g1ekf0HbjJr0qq0zc+4odwzA+NU/kh5SwXfD57YTpVpPAk+mHwHCveyPvLR5N84hS9pgSKS317s35SxUrimh/tkfe9tnwWI0MGx4R9V3E1x3oFMqCejbMx+w5gxblcJ+9Nd9m7Jc8S5QvofmUcZVDkHI1jHwXNGRDUQ1gfFJCOK9wc7vdxeJF+DXCY8WTZjgr1Iv31t2FP/PZFMil06FVIaZvypqghHNWj8pyr2gjbo7jUNr8V4J3L3YNU640H6i/DdZpL8Q0r7bwDArBKBVlG5ArsnT1t6IecTqdwlapQwqIA7PdRZ1PGmtWIskLbfQ0uiizveSoFhlLMZNSeCWcC/7UlgyhMnVyWwJ3rHyPkQYhXwM9zbSUEGke8/tK7d7AuQm+Smp5RypugZgnPSRy9lqm19vDmUTp+UabrySnjHhMKZc//7s2BSWere8iYLMH65IExrPSjHbVuBjjQpQYydFOW5SJ5itCuUxX56WxWBSbLaX19xJKeOTAQFoKYkrzJlI9wmfvhJ4RDwnNwtEzrGsyzSc3u7OQ0GWfFswQ9nFgT5rR4ZJxLuVAhEH04uIAv5dIxBv8wMsrJT3W4QtgwQNuU7uFq4ubqa5YE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5035.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261026140227099003)(4143699003)(11063799006)(5023799004)(56012099006)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3lJRFpINmxHRzJ3U1NuOTZpRFo1YnNEN3ZSL0JVeW1lTWRsQnhmR0RCZFNY?=
 =?utf-8?B?eXo0Tmkvb1Vtd0k5cDVYS1pIRDJBNE95V1FZYUtjRFN1MHJRaWJqWHkyTXNQ?=
 =?utf-8?B?a05QUVhhczBveXBUaXo1SWY4YjJvZzZIVkwwU0p0WlpXcjZQSVZ1NDBubDRC?=
 =?utf-8?B?dG81Rk9zeFloVXVEaERKRzc5SGVKNE9uUktwTHBYZkVHMjBMNU5KZDZBOEY4?=
 =?utf-8?B?TUJYQW10ajduTXZSc3M3WDQyYzhVYnMyOGJ6eU5KNmtaRUk5UnBlZDdKcXVh?=
 =?utf-8?B?bFR3Tm9mZEpPR01zQTRyV1FVV05hN25BRVljSkE1VEVyd0lZenErNEZPbFdm?=
 =?utf-8?B?UDBQdjlWa0dmRWRnendXR1pxckRxdlJwWlhPQTVDaFkzTGlEbG8wMWFtU0VQ?=
 =?utf-8?B?YmVPdXpmRWNiSU93NEZxcmNGSkQ5QmpVKzNYSmljSERva3VsNlNBZElISVQx?=
 =?utf-8?B?WXJETXlhc3BjWGgwNXNiMVloZ2RDV0g2b3FUOTVyRW1HZWxrMzJxTmt1VHJq?=
 =?utf-8?B?RGNBQ0dPY2tlYW9Sb3g2L1RzMDZMenUray9zZDVkdjlkdnpwZ2ZwVzZoZ2o4?=
 =?utf-8?B?UXRaNFZ3WEJkWm03SU81bDQ5Z1JYS3BZTkdVL1hNdWlKcFJHQUVKYmZESC9S?=
 =?utf-8?B?OHhMZTF3R0tHWVZlK1gxV3NvSEtvUFVtRC9Wbk0rOGpjTmJiQjVqWCtaUHB3?=
 =?utf-8?B?T3U0MnY0aVpSWEo0UGtML1dXeHNJKy91Q1hBUUxLZ3pXZ21ya2dIYnU4UFl0?=
 =?utf-8?B?L1UwdlpPTzExQjMrdHpIQi9ERW1yTWlXSHVYQ1djSlFscUxReTVXdW9ZQ3ZV?=
 =?utf-8?B?Vm9ja1N2N2ZYSVBiRmFXZW53WWNyVjBVTVpiUnViMTZDY1BhZDRrMy9JNlBr?=
 =?utf-8?B?YW5OMHRYQkRSUG9vN2tkUzVORGNOcjI1V3daSWhacUFJbzB6aXpNQWtnK29p?=
 =?utf-8?B?aVFtQW55SVlhcHg0YjRUTnpmbWt5Uld5bFBSM0txcm84UW5vOTVRUkt2MnEx?=
 =?utf-8?B?VkZGc0VrbDh3STd2UHBxK2dGcExvdWhUU2ZWaVBacWwra2UwR25sZnh6bkha?=
 =?utf-8?B?Zjk3ZGoydjFxbWppUndlT0t6VTEwSnlTc1lGRSs5bU9vaTlsbU10MzE2RWE3?=
 =?utf-8?B?ZnhnNDA5VUZhN1h3M2tsWmRGVFBSaTgwRHlTMFUvS1QrWmdHalRMSW1tTWwv?=
 =?utf-8?B?WnYzZUVyb3NPTTE5bEVZQ0huNE5kQVIrUklHVERWRFB3V04yTGdCeGZuVWRw?=
 =?utf-8?B?MFVDbDlvdnI1QTlMRCtXZDR1NGxuWmxGeEx0Z2RyWWpIN2lsOVhmTmZiWVNS?=
 =?utf-8?B?MTZXU3ZSZHpTMGRKc3ErTnM1bksvNUNob1FBeFV6dFVHYjUyWWtLcUlxb0tj?=
 =?utf-8?B?Y1dyYitza2dUMWVhOXVHVTZaSnZ3cVBzNWNqZVZMcnZmNnBBMnRUVlowUnlv?=
 =?utf-8?B?OWNDKzN5ZmJPdE5Oczl1Q2ZkOFFzRjFDQVRVWFlvMFdVRHdoTGVkenh4NkNB?=
 =?utf-8?B?aDJEWEtNWFNYVzl1N2UxVzV6cUtFektxT0hpT1BpMzFDcUFqMkpXaVo0U3lX?=
 =?utf-8?B?cnk0Y1JtMUhyMGhKc2toVzdMdnc2a09HUzZZeHBvUTF1U1dYRGYrSGVUUUc2?=
 =?utf-8?B?Wno5cDhwSDdEVy90ci9oc3JpQlpocC9ZOGxrZkpEdU0xaVhIZHFkVERPY2hw?=
 =?utf-8?B?SWQwUmNBeFdPT3BTSUNqOE9OVHdBVVVDd25rWUMvZmdxekJtUHhlSVBaYVdu?=
 =?utf-8?B?cHVwcnMrN0FJTGtZL3lrc3FCUC9NQnkrOWRjNUM0NTBncDg1TzhIUTRrU0Jy?=
 =?utf-8?B?TmhQazR1NjM4ZnBqWmRGMy93T29PbTRGQ2xuMllwdmFIRUZLcldXL2xITVZo?=
 =?utf-8?B?NGY5T1RweFZYUEprRmZtVUJhRmtnQkQyNSt2QzdsZkRlcnduOEtaT1IwRjAr?=
 =?utf-8?B?MFBuYmozWVFpSC9DckFrdzVkVzdzckFvWGJxMERYQVZ3L2hMZHJrZTVUNUJq?=
 =?utf-8?B?QVdnSXI4OUtPVFd2SlNHM2JlM3IxRnlNR3BPQW5CWGRBYXU5c2tSakVEcEpx?=
 =?utf-8?B?SlBXNUF2VXo3czlCNlpuN09VdFlhd3NNaDQreE5GRGF6SUtrMitYeHkvT2ow?=
 =?utf-8?B?VmxzVWZwU3FJdUd3QW16eXhUTGRyNmgwbEU4bllYNFRrcXQ3MlVKOG5xc1Y4?=
 =?utf-8?B?V3JzbFFEYUY4SmJ2ZDhyUS9IWU1HSVllUDFpckV3SDEzczVpRmplemRoN0lo?=
 =?utf-8?B?QlI5bjNwbE5xS25oSmxnUmorQ0x3cFA0R1V2RVVvZEpFZGxSQy9BaDNPTUhK?=
 =?utf-8?B?YVlvY20xK2dRWGZZN1pRYm9qdy9LakdtN2tjbXBwZXpkNTQ2amd4eEpWY1Zk?=
 =?utf-8?Q?UiDTQJnZZpBnK3S0=3D?=
X-Exchange-RoutingPolicyChecked: NReTzyjTRzbcdFszJuZJQGtq+ISBe1QvzROrKuSCt87VQjOR5+zX0OrCIl5clnrMSGuBjtwWU5NxDJYnioG/+wKN0T3d4z7P2Tk1c+P/WD+eAXitk4ybx7eYOZLmf6p4kP4fa92tYY8w2LcRPpGzE74EYCvMolTBZ52xAb+jVjkHI4On0c/5IA0W65bKK4M6Jg+91GYoHBH4LMIbDiNQBZkNPjzg3ZpDfqrY5qKSsLJ3tGhGkL8sy/r/7dFak+UGlpyXIuy0v6dgxwCreCJOuUY5DoFpP37ElAfgMbF0zpzuqOD9V0LeEa9vYBA2k8b3gJ0O4irTWgjF+dTr4BBbbg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f907c5e-fd6d-48c4-94da-08df3418d796
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:55:41.3967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xb8Vwpv6UDx2V76hIIWtEzHP8pg5NqPWeiAlXIxeGaeBjz9FTsnOsIR0RD7yUGyxFIrqMeLHw5Ldhmb2MgTaAzepdjEtkBqxKei/ZwRXtP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6960
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/23/2026 10:58 AM, Bhadane, Dnyaneshwar wrote:
> 
> 
>> -----Original Message-----
>> From: Bhadane, Dnyaneshwar
>> Sent: Friday, October 23, 2026 10:32 AM
>> To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Anirban, Sk
>> <sk.anirban@intel.com>; Grzelak, Michal <michal.grzelak@intel.com>; B, Jeevan
>> <Jeevan.B@intel.com>; Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: RE: [PATCH i-g-t 3/3] tests/intel/xe_survivability: Reload audio driver on
>> exit
>>
>>
>>
>>> -----Original Message-----
>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>>> Chaitanya Kumar Borah
>>> Sent: Thursday, October 15, 2026 7:31 PM
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Anirban,
>>> Sk <sk.anirban@intel.com>; Grzelak, Michal <michal.grzelak@intel.com>;
>>> B, Jeevan <jeevan.b@intel.com>; Sharma, Swati2
>>> <swati2.sharma@intel.com>
>>> Subject: [PATCH i-g-t 3/3] tests/intel/xe_survivability: Reload audio
>>> driver on exit
>>>
>>> Commit 117e9ecbdd1d ("xe/igt_kmod_unbind: release audio before
>>> unbinding
>>> xe") made igt_audio_driver_unload() be called before unbinding xe to
>>> avoid the audio-component bind warnings/errors that happen if xe is
>>> unbound while snd_hda_intel is still attached. Both call sites in this
>>> file passed NULL for the unloaded driver name, so it was never
>>> tracked, and nothing ever reloaded it afterwards.
>>>
>>> As a result snd_hda_intel/snd_hdmi_lpe_audio is left unloaded for the
>>> rest of the boot even when every subtest passes, since xe always ends
>>> up rebound by
>>> restore() but audio never does.
>>>
>>> Capture the unloaded driver name and reload it wherever xe gets bound
>>> again in restore().
>>>
>>> Cc: Sk Anirban <sk.anirban@intel.com>
>>> Cc: Michał Grzelak <michal.grzelak@intel.com>
>>> Cc: Jeevan B <jeevan.b@intel.com>
>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>> ---
>>>   tests/intel/xe_survivability.c | 11 +++++++++--
>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/intel/xe_survivability.c
>>> b/tests/intel/xe_survivability.c index
>>> bae9eca27..2be8e9ec0 100644
>>> --- a/tests/intel/xe_survivability.c
>>> +++ b/tests/intel/xe_survivability.c
>>> @@ -39,6 +39,7 @@
>>>    */
>>>
>>>   static char bus_addr[NAME_MAX];
>>> +static char *snd_driver;
>>>
>>>   static void ignore_wedged_in_dmesg(void)  { @@ -158,7 +159,7 @@
>>> static void restore(int sig)  {
>>>   	int configfs_fd;
>>>
>>> -	igt_audio_driver_unload(NULL);
>>> +	igt_audio_driver_unload(&snd_driver);
>>>   	igt_kmod_unbind("xe", bus_addr);
>>>
>>>   	configfs_fd = igt_configfs_open("xe"); @@ -167,11 +168,17 @@ static
>>> void restore(int sig)
>>>   	close(configfs_fd);
>>>
>>>   	igt_kmod_bind("xe", bus_addr);
>>> +
>>> +	if (snd_driver) {
>>> +		igt_kmod_load(snd_driver, NULL);
>> Hello Chaitanya,
>>
>> Would it be possible to have a helper like igt_audio_driver_load(), so we don't
>> have to maintain the driver's name in multiple files ?
> Something like default to "snd_hda_intel" if passed with NULL.
> int igt_audio_driver_load(const char *who)
> {
> 	const char *drv = who ? who : "snd_hda_intel";
> 	int ret;
> 
> 	if (igt_kmod_is_loaded(drv))
> 		return 0;
> 
> 	ret = igt_kmod_load(drv, NULL);
> 	if (ret)
> 		igt_debug("Could not load audio driver %s (%s)\n",
> 			  drv, strerror(-ret));
> 
> 	return ret;
> }

I would prefer keeping the exposure of the change to per file/test. I 
think "load back what I unloaded" is a good semantics to have instead of 
maintaining the driver name globally somewhere.

But I would agree that there is a scope for a helper which can help get 
rid of the repeated if (snd_driver) {...} code block.

I am thinking of something like.

int igt_audio_driver_load(char **who)
{
	int ret;

	if (!who || !*who)
		return 0;

	ret = igt_kmod_load(*who, NULL);
	if (ret)
		igt_warn("Could not load audio driver %s (%s)\n", *who, strerror(-ret));

	free(*who);
	*who = NULL;

	return ret;
}

==
Chaitanya


> 
> Br,
> Dnyaneshwar,
>>
>> Br,
>> Dnyaneshwar
>>> +		free(snd_driver);
>>> +		snd_driver = NULL;
>>> +	}
>>>   }
>>>
>>>   static void set_survivability_mode(int configfs_device_fd, bool value)  {
>>> -	igt_audio_driver_unload(NULL);
>>> +	igt_audio_driver_unload(&snd_driver);
>>>   	igt_kmod_unbind("xe", bus_addr);
>>>   	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
>>>   	igt_kmod_bind("xe", bus_addr);
>>> --
>>> 2.50.1
> 

