Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12860C4345F
	for <igt-dev@archiver.kernel.org>; Thu,  2 May 2024 16:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFE110E1FC;
	Thu,  2 May 2024 16:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQ6iSzc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816F110E1FC
 for <igt-dev@lists.freedesktop.org>; Thu,  2 May 2024 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714666953; x=1746202953;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=l1uZ0MVU9B6X7s9+Zj3IQ5JDuRLgII1AoG2iPO8Humk=;
 b=QQ6iSzc4a9zdf1PWB9YDFmCwZQlsoIgG7WqCkvs+6TaFdrpSMc01Fm8M
 uDzXbZ1bY0P36C3SyeYDeyejfm3/WtRNPli9p2PBb047ms5Pvbs1M4aXF
 ypYaV8QLGAttuq+49i1NYxKjkCkG2c2UQqI/VqkXWScYw6nuzriF5IBQL
 oV2mT+oD8KDoXdgDRZWgtt5ykLpdwzC2aMxHdgv0UvuyICpw/tTjzpwa0
 4mexoqn6MBTgVa7y6vpFm051zcsbNUW7a9zAfHOVOLO2Iq8lL5CtkLV0K
 pC1d9+vGRyAfs7EF2NtGbdL4DTXa6vcOYcDlLQWi8z+YVzejgp/CzhV0c Q==;
X-CSE-ConnectionGUID: hnOks8buQBa5bPaBkZfEjg==
X-CSE-MsgGUID: xizG7yvYRhOQWxcblwZYtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10608053"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10608053"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 09:22:33 -0700
X-CSE-ConnectionGUID: twPdSniqRA2UZ/mMdlZ3gA==
X-CSE-MsgGUID: 4Jp+wNGXQ0Suw7Z9SajWCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27221715"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 09:22:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 09:22:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 09:22:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 09:22:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 09:22:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWkXygt2ADQucXK/SKNLP/bfOak9Y0DBLYdEOjvs7yUyVkxX6zBfzVcYXi8YtRR0U9yWq0HBD41yQbdWyp/DZXhay8zfP34v8WSqcSzHDWNw2+HYqOojNx6CewhydqrXy+ggjYize0ushifxgih7J3P5Acb9b9D5Pr7UbKc797JpUPXJuyMd++H/8T9Qv3+PBjkzU2T6++lo85OI7pv4am7gPUmwXan5tNd97BSdEU35d/gsZU0/PLzW+PiOJQ8eqrWWUn6bn5X5tM1ZpgR0s0odZipZvyPwE6dz19YHl8DTwNSwW8Bze1BufvB7cnRVSp1gP8zhE18k1DpGfKqU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KV+RPr4GidptZP1TpDlP3DOtg9TfatHYYPm25zfAVSE=;
 b=CUO7AIfkHZBlmQgVlVstXq8aoc+VXrCgqqHOiQgco7/c2QNF9vNwyZKbZgy4Du+rDTK2z9J/+dNSMn6j95a7NlMm05S8kl0ygNq0hY+tOm465twxxERRXBhiAOOQTmFl1J9VGXbmiIZH08U7vL9KLlIQjrbWJTL33mvIwW8o6C9s5yoe7ttq7pTE/1EuhKErMXKI3rse3OZOK/FkdPl5D9JGtFRr1MlIIqAZVd2+2gHo1v/3QrZtNUp3r4Ltme+tHCaV0pt0i9xzWkapusmxfsGTnJoZF4EmIbuecSnrdVJ53MEhTRPSDU8NK7JEZXezSZkuoCrfb7ZT3+ckINxopQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB8160.namprd11.prod.outlook.com (2603:10b6:8:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Thu, 2 May
 2024 16:22:30 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7519.031; Thu, 2 May 2024
 16:22:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240501070145.49810-1-lucas.demarchi@intel.com>
References: <20240501070145.49810-1-lucas.demarchi@intel.com>
Subject: Re: [PATCH] lib/i915/perf: Fix warning on codegen
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Thu, 2 May 2024 13:22:24 -0300
Message-ID: <171466694402.62619.1567379194886699598@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:a03:331::28) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e68aef-c237-428a-0082-08dc6ac41032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230031|366007|376005|1800799015|16122699003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFFaQWxrNk1yYURnTjV1QVhjOUt4UGhOeXJQRHJvcVphdGRSMG5JeGpHYnRi?=
 =?utf-8?B?Z0FnWVJpSnhVRUYyTmdIMUZOWlNpRTZ2WC9jNURrUGlUTjdleDIzeVdEZWI4?=
 =?utf-8?B?NkQ2ZUc2VUFkT1hNK05iMjBmOVo2bjV3bitTYnFEc085dVJGYk5zZjFKWHhM?=
 =?utf-8?B?TTRlUmVkcGtTSG9VM2NzNEh2bFVyeTVISDlqa3orMUJ6dTRoa0FwTGNUcVdp?=
 =?utf-8?B?ZXRrTmtyczlTRTFKSDlhVjNhZmtWaWFVTzBkVkRFd2hmREpLalpPcENQR3Zr?=
 =?utf-8?B?VnY0NTA3L0JGQ25PVlA1aW1MNy9hSlJKS3FNWlFMbnFsaGFsY2ZpY0Y4NmQ2?=
 =?utf-8?B?Q2w3UWdnYWhBM2M1eVpXUDcyT0V3MkJaaGJlQzU2amt6Mk5GUDVCV0JOZTFN?=
 =?utf-8?B?UlNlS0c5WGVIMjgxMSttcVZzT0w5WUlyc2hEN3ZwV1l3OXRBd2w0cjNScldE?=
 =?utf-8?B?Sy81cXQxS2E4VGZHWlYwbG45RHVPaUhDSlRhWW0vYmlnejE0Q0wvZkZlc3dO?=
 =?utf-8?B?bWhMa0ZvMFY1UFllZjA5L0xTYWpHQzMrdzdqM2g2ZTd6L1Badzk4cENhM1p0?=
 =?utf-8?B?WG13VTFZUzR1ODNZT1lRZU5xK0RrUGZ4MjdFNHgvLzIxd3hwalQ5YWpQY1B6?=
 =?utf-8?B?TjZ1QXNyeWpRUFQzMjBkY0JzZFVwVk93Y0cxWXRybklCK202Q1ZDMDdPWTJz?=
 =?utf-8?B?MmkvNzJTelRXekV5aGxaeGQyWjNLVTI0M0JqRGhWYmxzVyt1Y0NKMFM1dnc0?=
 =?utf-8?B?T3lXcXRWalBEQnVtbE54Um9oWFVQMk9IZVVpV0tXZW4rSGFkdjRkNUE5Vm5x?=
 =?utf-8?B?aSt2WXppOHpGdHRwUFJ3TUZmWVF0TTZvSjl0dXlEdlVBbzlEMjcxVFNnQjlv?=
 =?utf-8?B?NEsrVWRNUk85UEYyRXJkeS9ZNkdmM1BkTXJlM0dzTXpHQno0TzdlRDA0Z1hG?=
 =?utf-8?B?U29VM1Zkejg0Qk5ZZVd3R2o5OHQzUHJtRGRJblZuOVk2Wmpkd1pMbVpkR29B?=
 =?utf-8?B?WndSVmUrY2thaUxYWWg4NS9lVlllQ2srV3FpQ3VNejE1M2I3cVlOVndySDNh?=
 =?utf-8?B?SndLU2VGT0s0OXJJYmMzTnZmbDMvVHk3cllvZDJXMGU1VVd2ak9kSjRkbDFN?=
 =?utf-8?B?T1R2THBrQ0lDckFTU2ZuN0YwVUF0a0h1Vng4cVJVNmd3SmZPa3ZKa1JkT0Vh?=
 =?utf-8?B?Rk1LdzhlRkQvWXFUdDA0TzRWWU8wNzdTd2ZNR3NZZ3pnSTFDZHV4ZWplV0FB?=
 =?utf-8?B?Z2J1VVZ3eHdaTElmQ1doTHVMOVc1SG0xd0RxWEdZdWdWczArd1RNRkw2NCtD?=
 =?utf-8?B?RjNWQmFjb1NydUYvckl5QVg2eVV3MkRrQjRBeU81dlljT2dweEFSczZhWlZq?=
 =?utf-8?B?SzV3azlMMncxaFZqdWZHbUVmUkcvRkZkWFhWY3ExRnJaUDBCQldheWFkS04x?=
 =?utf-8?B?UDRUWGwxZ3B4OUsvVlgzUjRXMlY3SzY1eXlWWWRVUXhUTDdCZnI0TmMwUUg0?=
 =?utf-8?B?am5DTmY4dVVTYkJKL1VUQ2plT1FheWc5T3lhQUZieE85c1prZzUvbmJ4Nkdt?=
 =?utf-8?B?RFlPQXVsbUYxcFBNOThrNThUeWprK0tqQ3l6VFpWMk8xcGVyVXM5cXpSNElQ?=
 =?utf-8?B?RW0yZEpyUEtzY3cvZFVxbmd4RmlWNjgzVngrS3k3a1UveTVJdE5hbS9GSmJ2?=
 =?utf-8?B?YmRDUnI0VDVZdkMzVGZBSGhrbGorb1ppdHNMRXRPTVZ1MVd3SktCbWh1SFdY?=
 =?utf-8?B?M1dCdmVtMVVidFB3OXNhWGQ3WkNxNDJOQkQ0ZVpyZ3p6bTA1K0FFR2w3M0dw?=
 =?utf-8?B?TXVKYXhoN29lalZJemN6Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(16122699003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWVCZm1HTHl3dU5oeVpUMWNHbDFDdEc4THZlYUxHbGZrTSs4eUY3YTdIZjNG?=
 =?utf-8?B?Mkk1RTJyQUtvTEE3c0VqMVNBa1lTNlBkRmoyZXZvVUVhUnAxbFFEWTRKM05E?=
 =?utf-8?B?TWZOM3JuZHdVd3FLMnY4ZFZUSjIzT1pUQmFXQXllcS9OaEM1NzQrdjhyVlM4?=
 =?utf-8?B?dnhGQ05GcVBOM2NPbldDakJhQkVSZytVWWk3aHlad2F6NmtPaFVORmVLNXJn?=
 =?utf-8?B?b2cxYjJTM3c1bkpCNHRtSk1iRE1VTDRPSE5IUXpJL2xCbmFWYThqaytoN25L?=
 =?utf-8?B?UFVUWFpVL1F3bEZxSThheFU3aWFIVlUveWozQ2l1L3hyNG54UjlYMk9FeFpB?=
 =?utf-8?B?Wksxd3JtUnpaS2dTK1pKaWlnbDlXNGpwQnBKeEZrTEExSURDSTVnYjZJb1NY?=
 =?utf-8?B?S1VnK0s4WEsyY05ESUFIQVExVGRJRmdOZ2ZwSERJLzhjUjBCb0ozUEJpOFR0?=
 =?utf-8?B?czg0QzhWWVRsWjZ2U2VINFNZVnh6RHBDL0FrYzdxaXpTenBFNko1ZERabnJr?=
 =?utf-8?B?R29IdXRIM2tQTVJIV1hETmw0RzJiblhOSzNyQ1Jzdk5sTFFpbkM3UERwdHZ0?=
 =?utf-8?B?Q1JFVG9jSm0xYUpLbE9lVXFHVFVValhLM2hKWEdCWHJYUDlsZjlOa1ppMllq?=
 =?utf-8?B?VXRzdGVsaDRkclV2K2pkdWtpb2xYd0I0S3Q3R3lpMDdlQ0FQZmRlbWMwTFhN?=
 =?utf-8?B?a0U2em95LzU4ZVZyRjJvVkxzVU1Zdk5SODIwTmVDUG53N3hZVEpTdkFTUzFy?=
 =?utf-8?B?SnJIcjhRdTZmS2xENlpiYUdPZFFNaVV3aWgvWnd0dmZ6WTFqRGNaamJmWlE1?=
 =?utf-8?B?RGRsS09nZG42ai9sdlVuL3pKWGViZTN0VEdEQm1EUFdqa1p4YlRpL3pRazdR?=
 =?utf-8?B?bUZQK2IzYVNERmlpTElzNzV0K1BRMVRJVHZSV3o2QUgvT3JyZjBsSm5PL3FT?=
 =?utf-8?B?VHFHeUFlVVdMRGFuMHI4elRHYW13akZhb2d2SVg5VEN6dWdjaDVkVWVJL0gy?=
 =?utf-8?B?SW9DSzZtV1hiK04zMVl4YkhaMCtDQXNmQzhqMHA2R3p2Sk1XYTZ6SjJNYTRQ?=
 =?utf-8?B?K29HTTU4Y0FIUjhJRkN4RmZTSERHbWVuM2trblNoaTBqeDA1QU4zdWEzeDVN?=
 =?utf-8?B?b2lIWDlwc2N0WWZQcXZXcFZqa0JaSVFDQ2s5Um4xRWJPNThHQko0aGhWVFhQ?=
 =?utf-8?B?elVxV2VtK1VCaDlnaXFtcmxVWmo4SFRuUDlsdHJDZTN1TnNwek9PbW9ITDI5?=
 =?utf-8?B?c1MreXJKb3JTM1FLbGtWZERyU3pDR3llVGg3ZUNDNm5NK29WaEV3bDBIWWlu?=
 =?utf-8?B?VWZ4T0FmaVVCUitraHZDa0pmSlJBSjFFNCtDYkp5SHhrZ0p1UExGVmNuV0N6?=
 =?utf-8?B?QTNGM3hONmZjWnh0czVUR1Jqc214bkljN0E4YzBkM1FXczFDK2xYbEUwSGh6?=
 =?utf-8?B?RFB2dTRieHlqNW13Uk55UWM2VVdwdzQ4TGFscXJnVVh0OW9vQWVreXl5WGlL?=
 =?utf-8?B?dlFXSlIzOGttSmwyUi9DcnA5eEFQU2ZWbSt0ODhFMGp4UnJGMFV4TEc2OExS?=
 =?utf-8?B?Q05nYW1yTVVvRU9zck9qc1lJVGl5VDNBRndraHpYZHB5ZE5RcVUrcDFocG9i?=
 =?utf-8?B?UGVlMzNBdWdrQ3NhRkIvdGEzNUR2RldJZmFsSXgxNVc5RmRCM0JQMXR2Q3Yv?=
 =?utf-8?B?eDlCZ2UvaENoYnRhVTltOTg1YnhoenpFSjV6RTZjeWRJd0EzOElqRlhSSkV4?=
 =?utf-8?B?NW5WdER0RS9HTk8rUlNqbFNKdmR6c3NGSVlrZ3NjY3k4U2hDNDRpQ3RKY2lp?=
 =?utf-8?B?N1U5UytIeWc5MHVBbzlLTWhlUEFnSWdxc0J3WWp5VkRETWtBWUM1MzVnRXNP?=
 =?utf-8?B?U09lQXFJZ2M3Ri9BcXJia0tHSW40VWFHek9OVWI4UUovdUtUQUNxZEJWcHNK?=
 =?utf-8?B?S3dYd3RUNG4zbjFENUlZVWtVRWtlYTJLa1hnTlNvek02TDQ4T3VLK1pPaUlJ?=
 =?utf-8?B?YW10QXB3WnNFU25WMGJKZWZOT1B6cjVseitDencwWmkxQUFPWDhMdTBtQ3Fr?=
 =?utf-8?B?dHJXamt1bEs0NTUvb3J4Kzhwa015NklWbDZraGJxM1lscFcwVWo1MGtQcG1B?=
 =?utf-8?B?Vm0vMFpLSG1XUURrQnhPMWNlazN2eUJpaU9PRXF4NzR1dzZRSnh0MEE3NWg5?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e68aef-c237-428a-0082-08dc6ac41032
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 16:22:29.8887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8p01bru6RSknUruSss9pqgKb2Yc3X2kOXi+NnPfPQ9MiNgJZouigIlXkRrHB2SGCt2n4PDva3hIzdclng7HS0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8160
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

Quoting Lucas De Marchi (2024-05-01 04:01:45-03:00)
>For a normal string, it's not correct to use just one backslash as
>escape char as that conflicts with Python's escape. Use raw strings for
>the regex patterns to avoid this problem. Fix the followin warnings:

s/followin/following/

Maybe it is worth noting from which Python version those warnings start
to appear?

>
>[4/1809] Generating lib/i915-perf-registers-hsw with a custom command
>/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:165: Synta=
xWarning: invalid escape sequence '\$'
>  m =3D re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:168: Synta=
xWarning: invalid escape sequence '\$'
>  m =3D re.search('\$GtSlice([0-9]+)$', name)
>/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:171: Synta=
xWarning: invalid escape sequence '\$'
>  m =3D re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:341: Synta=
xWarning: invalid escape sequence '\$'
>  m =3D re.search('\$GtSlice([0-9]+)$', name)
>/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:344: Synta=
xWarning: invalid escape sequence '\$'
>  m =3D re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>/home/ldmartin/p/igt-gpu-tools/lib/i915/perf-configs/codegen.py:347: Synta=
xWarning: invalid escape sequence '\$'
>  m =3D re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> lib/i915/perf-configs/codegen.py | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/lib/i915/perf-configs/codegen.py b/lib/i915/perf-configs/code=
gen.py
>index 020e76ef4..0d1847592 100644
>--- a/lib/i915/perf-configs/codegen.py
>+++ b/lib/i915/perf-configs/codegen.py
>@@ -162,13 +162,13 @@ hw_vars_mapping =3D {
> }
>=20
> def is_hw_var(name):
>-    m =3D re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>+    m =3D re.search(r'\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>     if m:
>         return True
>-    m =3D re.search('\$GtSlice([0-9]+)$', name)
>+    m =3D re.search(r'\$GtSlice([0-9]+)$', name)
>     if m:
>         return True
>-    m =3D re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>+    m =3D re.search(r'\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>     if m:
>         return True
>     return name in hw_vars_mapping
>@@ -338,13 +338,13 @@ class Gen:
>             return self.hw_vars[name]['c']
>         if name in set.counter_vars:
>             return set.read_funcs[name] + "(perf, metric_set, accumulator=
)"
>-        m =3D re.search('\$GtSlice([0-9]+)$', name)
>+        m =3D re.search(r'\$GtSlice([0-9]+)$', name)
>         if m:
>             return 'intel_perf_devinfo_slice_available(&perf->devinfo, {0=
})'.format(m.group(1))
>-        m =3D re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>+        m =3D re.search(r'\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
>         if m:
>             return 'intel_perf_devinfo_subslice_available(&perf->devinfo,=
 {0}, {1})'.format(m.group(1), m.group(2))
>-        m =3D re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>+        m =3D re.search(r'\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
>         if m:
>             return 'intel_perf_devinfo_subslice_available(&perf->devinfo,=
 {0}, {1})'.format(m.group(1), m.group(2))
>         return None
>--=20
>2.45.0
>
