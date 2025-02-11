Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87A9C0219E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 05:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0925610E178;
	Tue, 11 Feb 2025 05:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kUR2Nv/6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917A510E178
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 05:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739251683; x=1770787683;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=N/GRDQDoiyot2NxO7zuJze7806cfVLljwR7w0ACvE0Q=;
 b=kUR2Nv/6vxJ1lIUgKq6TCK01jWN+NUBvDIqYtP/jHQ4YGQnV+l7b+2HI
 Rx3Qk1DZNeT6J24cma4o/DkuLCu+g5vJZ8+GDB3ZUH6YrsTH6gDn/oLzn
 bOpcmD4uvJ1QxcgnEwIeBb7QmhuFAe3D15VgGmy8kIoVeOjXus83MM4F2
 qQsO3erLv+oc3htctD+APF5aWJOyQ8LDVZ+4nuenUzAbDhwAoGU6dW7fx
 p/AoGgt4K4YWpWI3DMNieWIMMVPuotSe99rNv2fTQd28boQ9sCMvTawuw
 uHVZcEbVth4mKeJNFKyvNkVxnuz3gT5Za5p0RYV1fopa8yn8KclPXAKLO w==;
X-CSE-ConnectionGUID: mXT4qVC5RIyMvaE8QeNVug==
X-CSE-MsgGUID: BHKdijn/Q9GBryXyn9mHVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39876089"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; d="scan'208";a="39876089"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 21:28:03 -0800
X-CSE-ConnectionGUID: Dy95vjy4SvG59T+HKjzd9A==
X-CSE-MsgGUID: 8V4rqONHTCSs1T0FUH3CCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; d="scan'208";a="113046164"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 21:28:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 21:28:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 21:28:02 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 21:28:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qe/gT9pjLpVWkxdJXK8jZ/goo3cJkSpntlJOTwc1nP05ygPBqrjWQUfNSz4MzwkXz4p6bx5BoB5oCciqE8M4Yu8oiYg8CJCthrsn71NG8IJyRmGSq8l52uRHsCqUj1KZVaRklraguSRn+fEoQQi8DKK9SxWDWWBvO6UC3GUagcjyvAuHARHdnqLvv9btY2rlYoHxFMfPT8nvp05/r8b0rEwqlUFUtZK78wMup/UALuyoYjuwc7wtttAHpj59QxYa+k+XJjqGsqN6gJqkEeMwKpgc7MSQHpeie8/gxY5ALdHGn4Sex/f5kPz+eoGnoGny8gY2v3PHCGU+caZs1RazeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEdbG4CYxCSL3ltbXkpu/NDCft0RQ3+0R0Xk7bEVCNk=;
 b=VweXl/so65kiYHD6O+16vEWqd8MOdr7KitFK2huaJ6yNS6aOHUw1B6bwXzpZWcYmih5gcWf5Mz95CYhAK2++P8+mF7g3YYwJP0YQEpsxNfYIjFGB2eN5QPJP0ElpWUwbz3v//6jdd3s19pmkdro7CgHYLPlCu1Ou0HLHfcrEAtWBxUKCSrSOYbYyGx8B98PHmUPGJprfZSz7YLm09XUmKsbN+h1tQQYODuSmV+qX7w+49OyGzZ3/64/X5Y4W5u5aAyaknShe+rjKtHtOs/n5Z+DjLL0a/+F2qb1P9Q5mjA7vJwCu5LnVw3SwBFnYsUTcTUiqHkEGo7IfXXqw5cjt1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CO1PR11MB5043.namprd11.prod.outlook.com (2603:10b6:303:96::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 05:27:54 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 05:27:53 +0000
Message-ID: <c27ae7c7-f7b1-4d6d-b9f9-de2c2aa9cc06@intel.com>
Date: Tue, 11 Feb 2025 10:57:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/6] tests/intel/kms_dp_linktrain_fallback: add
 dsc-fallback test
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250210185606.1327892-1-kunal1.joshi@intel.com>
 <20250210185606.1327892-5-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250210185606.1327892-5-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::16) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CO1PR11MB5043:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a290010-2a3b-4bea-426b-08dd4a5cd574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0FMZGdSaXYwLzd1enh0R3RTWVdCdzRJRjdNVkw4TlpnMURvcHhZb3VXenNt?=
 =?utf-8?B?THN3U1VXei80RVREb3Ixd05xdkx6cHBBZjAzSDEwdkJSTmRCQWJyT0c4d1U2?=
 =?utf-8?B?ekNwdUtUbjFUZTR6MS9ibU1OQ0dOV2EvYzVkdnFJc1NGczd3bm8zblUwVStL?=
 =?utf-8?B?WGlhSk4vR3Y0L0Z6bkpnUFBROHd5SnZIcXZpbm1ROEM5UnFtN0g5NVUzcEdR?=
 =?utf-8?B?NHliZjhZbXd0WXhsSzJ4elBHN3BmUDRPU01wblJOZkhWRzhUWURneGpzbzV2?=
 =?utf-8?B?ZndQekNjVzZoZUN3cTJ4T1JpSjRPWnQzc3ltSEltamlGMjlKcTV4V1NtV2xz?=
 =?utf-8?B?VjI1cjYrNnMyNTlCQWJnclhZU1hneWtKUUc1clN3QWY2dGdsUlJFT1hDSE81?=
 =?utf-8?B?ZzFoemsyWjBIeFZYSTlzK0I3NU8vZDI4SSsxUCtkaElSR2I3Sk5Eak8xTXp5?=
 =?utf-8?B?ckVOazNuV1ZBMGEzbThrMWN4dWEvVTY2M1JnWlhncTRGSm1DZlpSVm1MUDk0?=
 =?utf-8?B?ODJWUVFhbTdqSVVLN3R4OU1LT1ZlcVFYYnViQ21TRS9tTmhmUFRmM2R6VmlI?=
 =?utf-8?B?c1FlYWJBcHNjTFZtNnMyeWdFTTZ2TWkrdk5FTmVXZERndTBvdUR5Z2FwaWZK?=
 =?utf-8?B?RVZTTW45NTE4dUxSY3BxS2Z1V1lqeVhHRTFhcCtHWHRSYVJSdE9Fck9EL2lu?=
 =?utf-8?B?UzRjaDhyQVpOa1RUR0g4Z212NGo3MGtlK0NVdUJCSWdaVCtvZVZ0WC9PQXRM?=
 =?utf-8?B?Tys2VkRiK0NaTzMvSFYrbEI3UUJHbUI3ZTRPSmZ0WXA4cTM0a21GbkQrRU85?=
 =?utf-8?B?ZktBc0ZXbExqNWRLQjZDZ0dmVmljMUVPUFhFWnZmWmJHNk9pZ2NoNE5QWHdx?=
 =?utf-8?B?SnZnTWVMbjlyR1plSUh0VnRsMFN2SVFsWGErbGxXSW5WYXlXRVMyMDl0c1R2?=
 =?utf-8?B?VXhCUlhYOThsOGtoaFJDbll6ZzhFNDFCOXNnUnZKK1ZRbWhMb3RIRzN4VWsz?=
 =?utf-8?B?bHNaZU14c3hZNmVtbmd3bzhWamIxRkYvaHFmVkhKTlFmLzN3WnFseDJrazZ6?=
 =?utf-8?B?OTBtb3JlTEFMNElReWYyZ2p6bklRai9yOFl5UzFjQ1lEcU9yM0xIY25SVS9k?=
 =?utf-8?B?NDZuZzFudTlPWnRxemROU0NRdi9qbktPd3hxSXdNWjBTUmdXbE9LYUJjKzV4?=
 =?utf-8?B?MCt1eTBRTDBkb3M5bHk3UGdjMVViNElnaUJEKy9hMWF6ZmxnQUdBQWpZMEJ6?=
 =?utf-8?B?azd3QlRmVzVGT1JlVDRBc0pYZkhuVkc4cjFVSnRJZExrUytzT2p2QlR3ZHB4?=
 =?utf-8?B?cVVoR1pldTljU21qSFljbHRCdHRibWRBQ2REbHRYNmd1d2J0aU5aZXBqMEl6?=
 =?utf-8?B?aW10dGpYQTR1MTlhN0htOHpWQmJhemFKNTdvNTZoakQrQkZaU1NBb2x5cWp0?=
 =?utf-8?B?UjBFSVRRdnRLTmlraHl4TlA2NlF3RnJNd1VEaDltZU9pNGVvd0x4blZHdXpZ?=
 =?utf-8?B?SWJZaVlSaVM5NTlwYUFiZjMyelpETHA4eFI1eGVSYVlOYmRWZHNHY1E5ZVRM?=
 =?utf-8?B?aUs0cmIxQjNVV1M4cTF4dmFzZHdwa2x5MWE5cHcvVGtsK0lxL2tJb0c5S292?=
 =?utf-8?B?UUNhM3NBdnkwcXBQbDFKT2szd052M1RXTFpLeGk1N20xRWpEZTQ5eSsrYzN1?=
 =?utf-8?B?SnUvazhjZTJkT1JZT2RvT1hsVlhYNi9lcEwrRFR2MHcwRWlZa3RHZGNDaDIx?=
 =?utf-8?B?MFZwWFBpZ29aVEd0cmVIaS9HekFwVmc3UWtUNjJXRXdZdjJXY1g0UTVZci9k?=
 =?utf-8?B?dEFXWGh5alE1Qm4yWnN2cWxXdTRQTkoyT0NCcXQzRmYvMitzZmlXa1ZDSm0z?=
 =?utf-8?Q?1T/WkgzHIG1ex?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVpVV2I4c3pYTFIycGtHdkZjd2V0T01zK3hxMHNzOXdrdnc2N2dHd29tWUZS?=
 =?utf-8?B?TkZvKzdUVUtJSjYzUTJUTlF1NWtqQ29PbTdraVQ4MHFudllyWTh6UjZteEZi?=
 =?utf-8?B?R1BzczdLaFNmT0dMbU1EVU82ZXF4eEJpTDV3RWNUdy9FSXVpaUVFbkxyc0tP?=
 =?utf-8?B?Qlgrenlyc2FhUUZxMlg4MnY4SXZRMkF2cCs0R0FQdlRCOUkrM1U2TFhrZ0VM?=
 =?utf-8?B?bHpBeTJUS0o3SVNOaFBldkZZMkJmMGpPc2t3V0llMkwreUloU0sxenJkZDNt?=
 =?utf-8?B?dE1iWDFQN2djYTViQVFjcytGbkxnNER1NG1HSXcvVGc1eE03MTFOYlg3UTFY?=
 =?utf-8?B?S1ZMWjBWMDNsSzR5TEYwaC9KZEh2dTJEZ3c0dXN6VzBQQzg3dFJBWmpYNHpI?=
 =?utf-8?B?aDhRMzdnSXlmS01Gakh6Mm5NNlc3dFBvWWplMkNnQk91eFZuNzFNSE1WdG1G?=
 =?utf-8?B?Vjh2T2k5czR6QzhCZ01jaGpMTEJJU3Z3WCtUcG1mR24wbHFtOGc2VkRmNW9H?=
 =?utf-8?B?T2NBOWJaaEZtWUQ5T01xdEx1MDZ0d3hrbFl5dTU3L2tNWXgxL0IvMkxYRjN1?=
 =?utf-8?B?d052NUdpT2lBaktKckE3cnZweWpVemNURmk4OHBPdVlMaVBoamtHcXhnS2V2?=
 =?utf-8?B?bGhzUmkzVWxGU0dZYWgyeXY3S3JqdWVvTWtLQk1sN0s4WWhkZ0tKRDhENXhN?=
 =?utf-8?B?NkJuVVVJQVhRYjVaRHAydUptcVJUdmxMYklwc1JhbTE4Ym01WVFhSDRJVDdk?=
 =?utf-8?B?MU43QlVuZTFOdFlzZHcxeEQrcm5XcjNxVzBidXZ6MmZpZCs0ZzNNUkJNRUJM?=
 =?utf-8?B?Szg5UVhBVktPWDdTYmZwYTdZRk45MDQvR3ZCMHl4RXpuNWVEL2tWOFpCemp1?=
 =?utf-8?B?VURMdkdUc3p2RkIwSnVXWWdXZEgxR2dndnV1bTZFWXllZUZETFQ2dEhWZnIv?=
 =?utf-8?B?MXRQTzJZRXNwWGZOay9oSnJjQktQbE1idjk5SEl2RzBHWXdXdEhZL3dPTG1z?=
 =?utf-8?B?bjRXei92a0NGYjFaWHZGL1dXWHNhenBvT0ZnWWd4T2VaeXBoeVphR3V0NXVD?=
 =?utf-8?B?eFlaTS9qbktIYjVLNE1ZaEladTVNV1l3czdiM25oaHd2K1R6eWdobEVOeEJi?=
 =?utf-8?B?MVhtUFZ3ZDFXeVF3L2w0eFB6NFZSVnpnQWI2Q01iOWxaUFBibFZNV2ZIMnpN?=
 =?utf-8?B?c01BVEtVY29kMnNVT2FBaWxLdThKYmtHYmZ6eTBKRGdCakhTcjdtMkFDdVMv?=
 =?utf-8?B?WGdFWS9oei9iSjhDZHBMTThmUWp5dnNpSDJCSW92NWRyTUY5aEJYTE5rY21S?=
 =?utf-8?B?ZUZrakk1Wk4vcThCUUtrT2VSdWo4Yi9rU3hKc1ppbTREMzhBdlRsamEyM01u?=
 =?utf-8?B?QU10VW9PNlRnQnAxbzVnbFZWT1ZocC9STnFTWVlLTmFobkp4MERRUjRidjhk?=
 =?utf-8?B?R2RaaHhCK3gzMUhISVVoRjJDUEVrM24xaTlYWWM4ZkhxOVQxRXEzWklXMmd5?=
 =?utf-8?B?YVBLdE1kY3BqbVhNOVdsdXV5Y0tjangyWkVCNm1iVzl0MXVrTWxGY0ZXSDhH?=
 =?utf-8?B?S09YcThlcDkvMUhpUlpEYkVkbEpSbURwVXg5ZFZVRzRCSHltbHN4VzZwK1Vm?=
 =?utf-8?B?V2kvRUFabWRXVzltK1NlZ1F3dkpPbjhPbXUwQitHalRPOUs3SEVOYjQ2VWFC?=
 =?utf-8?B?Y2JnRjN1dEg5S0Q0QUVMTDczdTVubm9Rc3Roa3B3NkhjZVREY3FMS1kxZUY1?=
 =?utf-8?B?RkRpYzk1TzVlRFdxOW1SdjVEMEF1Y3FRQi9HVkFrVUQxd3AzdTNvVXROa1Zq?=
 =?utf-8?B?bEp2bkk0WHBxNHFuQ2tzSHdrTGlxREJ3NEFTcUt6NEg4V3p0S3VONzk4STJT?=
 =?utf-8?B?cTlCazZaMFAvY25rSDhoVjJ6ZExSVURiMmNRWkpJRHN5ZjU4cm5vMFNTeEhJ?=
 =?utf-8?B?MWh5UkkwQTNZUnRBY0VvRGtNaWNNd0U4V2RidXI5bFNURkVLNVNRbWFQQVRM?=
 =?utf-8?B?K2lkYVhYaUpSUTBSdHdJOHlRVDErK05aUkREZ0NmY3dMQWFjVDQ2ZEp0MkFP?=
 =?utf-8?B?QnMzWDcrMTRFdjJhbmltVlM3d2d0aGNrQ2JSc1NBYTl6WXR4Mko1R0tzSS9T?=
 =?utf-8?B?bXV5YWc0dERYaEZFMit0bGVIYlNFKzl1WG5tTXhoOE5RUk4xMDRXNzJkSy9U?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a290010-2a3b-4bea-426b-08dd4a5cd574
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 05:27:53.8522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3posE6kWJrw6oPEvnSoZldg+3cWmOOyG3s+3tXDMVjJlWdIZkJJe+9kpVnTUCkByDwXVile7xZy9OEvAUqBXEWZJtMwbZ0H7gIEF7aY11to=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5043
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


On 2/11/2025 12:26 AM, Kunal Joshi wrote:
> Add new dsc-fallback test to check whether DSC
> automatically kicks in while falling back to a
> lower rate/lane.
>
> v2: cosmetic changes (Swati)
>      make commit description clear (Ankit)
>      split refactor and dsc-fallback test (Ankit)
>      switch to igt_debug (Ankit)
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 161 +++++++++++++++++++++++-
>   tests/meson.build                       |   4 +-
>   2 files changed, 161 insertions(+), 4 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 284e6b9aa..69d48ca21 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -17,10 +17,14 @@
>   #include "igt_sysfs.h"
>   #include "igt.h"
>   #include "kms_mst_helper.h"
> +#include "kms_dsc_helper.h"
>   
>   /**
>    * SUBTEST: dp-fallback
>    * Description: Test fallback on DP connectors
> + *
> + * SUBTEST: dsc-fallback
> + * Description: Test fallback to DSC when BW isn't sufficient
>    */
>   
>   #define RETRAIN_COUNT 1
> @@ -46,7 +50,7 @@ typedef struct {
>   
>   typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
>   
> -IGT_TEST_DESCRIPTION("Test link training fallback");
> +IGT_TEST_DESCRIPTION("Test link-training / dsc fallback");
>   
>   static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   			      int *output_count)
> @@ -428,7 +432,116 @@ static void test_fallback(data_t *data, bool is_mst)
>   	}
>   }
>   
> -static bool run_test(data_t *data)
> +static void test_dsc_sst_fallback(data_t *data)
> +{
> +	bool non_dsc_mode_found = false;
> +	bool dsc_fallback_successful = false;
> +	int ret;
> +	struct udev_monitor *mon;
> +	drmModeModeInfo *mode_to_check;
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	int output_count = 0;
> +
> +	igt_info("Checking DSC fallback on %s\n", igt_output_name(data->output));
> +	data->pipe = PIPE_A;
> +
> +	igt_display_reset(&data->display);
> +	igt_reset_link_params(data->drm_fd, data->output);
> +	igt_force_link_retrain(data->drm_fd, data->output, 1);

Use RETRAIN_COUNT


> +
> +	/* Find a mode that doesn't require DSC initially */
> +	for_each_connector_mode(data->output) {
> +		data->mode = &data->output->config.connector->modes[j__];
> +		igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
> +				    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> +				    &data->fb);
> +		igt_output_override_mode(data->output, data->mode);
> +		igt_output_set_pipe(data->output, data->pipe);
> +		data->primary = igt_output_get_plane_type(data->output,
> +						DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(data->primary, &data->fb);
> +
> +		ret = igt_display_try_commit_atomic(&data->display,
> +						    DRM_MODE_ATOMIC_TEST_ONLY |
> +						    DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						    NULL);
> +		if (ret != 0) {
> +			igt_debug("Skipping mode %dx%d@%d on %s\n",
> +				 data->mode->hdisplay, data->mode->vdisplay,
> +				 data->mode->vrefresh,
> +				 igt_output_name(data->output));
> +			continue;
> +		}
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		if (!igt_is_dsc_enabled(data->drm_fd,
> +					data->output->name)) {
> +			drmModeModeInfo *non_dsc_mode
> +				= igt_output_get_mode(data->output);
> +			igt_info("Found mode %dx%d@%d %s that doesn't need DSC with link rate %d and lane count %d\n",
> +				 non_dsc_mode->hdisplay, non_dsc_mode->vdisplay,
> +				 non_dsc_mode->vrefresh, non_dsc_mode->name,
> +				 igt_get_current_link_rate(data->drm_fd, data->output),
> +				 igt_get_current_lane_count(data->drm_fd, data->output));
> +			non_dsc_mode_found = true;
> +			break;
> +		}
> +	}
> +	igt_require_f(non_dsc_mode_found,
> +		      "No non-DSC mode found on %s\n",
> +		      igt_output_name(data->output));
> +
> +	/* Repeatedly force link failure until DSC is required (or link is disabled) */
> +	while (!igt_get_dp_link_retrain_disabled(data->drm_fd, data->output)) {
> +		mon = igt_watch_uevents();
> +
> +		igt_assert_f(force_failure_and_wait(data, data->output,
> +						    LT_FAILURE_REDUCED_CAPS,
> +						    RETRAIN_COUNT, 1.0, 20.0),
> +			     "Forcing DSC fallback timed out\n");
> +
> +		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
> +						     data->output)) {
> +			igt_reset_connectors();
> +			igt_flush_uevents(mon);
> +			return;
> +		}
> +
> +		igt_assert_f(wait_for_hotplug_and_check_bad(data->drm_fd,
> +							    data,
> +							    data->output,
> +							    mon,
> +							    20.0),
> +			     "Didn't get hotplug or link-status=BAD for DSC\n");
> +		igt_flush_uevents(mon);
> +
> +		outputs[output_count++] = data->output;
> +		set_connector_link_status_good(data, outputs, &output_count);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		mode_to_check = igt_output_get_mode(data->output);
> +
> +		if (igt_is_dsc_enabled(data->drm_fd, data->output->name)) {
> +			igt_info("mode %dx%d@%d now requires DSC with link rate %d and lane count %d\n",
> +				 mode_to_check->hdisplay, mode_to_check->vdisplay,
> +				 mode_to_check->vrefresh,
> +				 igt_get_current_link_rate(data->drm_fd, data->output),
> +				 igt_get_current_lane_count(data->drm_fd, data->output));
> +			igt_info("DSC fallback successful on %s\n",
> +				 igt_output_name(data->output));
> +			dsc_fallback_successful = true;
> +			break;
> +		} else {
> +			igt_info("mode %dx%d@%d still doesn't require DSC\n",
> +				 mode_to_check->hdisplay, mode_to_check->vdisplay,
> +				 mode_to_check->vrefresh);
> +		}
> +	}
> +	igt_assert_f(dsc_fallback_successful, "DSC fallback unsuccessful\n");
> +}
> +
> +static bool run_lt_fallback_test(data_t *data)

Hmm. run_test is just renamed to run_lt_fallback_test().

Lets have test_fallback() followed by run_lt_fallback_test() just like 
before and then test_dsc_sst_fallback() followed by 
run_dsc_sst_fallaback_test().

That way the patch will be easier to follow.


>   {
>   	bool ran = false;
>   	igt_output_t *output;
> @@ -466,6 +579,43 @@ static bool run_test(data_t *data)
>   	return ran;
>   }
>   
> +static bool run_dsc_sst_fallaback_test(data_t *data)
> +{
> +	bool ran = false;
> +	igt_output_t *output;
> +
> +	if (!is_dsc_supported_by_source(data->drm_fd)) {
> +		igt_info("DSC not supported by source.\n");
> +		return ran;
> +	}
> +
> +	for_each_connected_output(&data->display, output) {
> +		data->output = output;
> +
> +		if (!igt_has_force_link_training_failure_debugfs(data->drm_fd,
> +								 data->output)) {
> +			igt_info("Output %s doesn't support forcing link training.\n",
> +				 igt_output_name(data->output));
> +			continue;
> +		}
> +
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
> +			igt_info("Skipping output %s as it's not DP\n", output->name);
> +			continue;
> +		}
> +
> +		if (!is_dsc_supported_by_sink(data->drm_fd, data->output)) {
> +			igt_info("Skipping output %s as DSC not supported by sink\n",
> +				 igt_output_name(data->output));
> +			continue;
> +		}
> +
> +		ran = true;
> +		test_dsc_sst_fallback(data);
> +	}

space before return.

The new subtest looks good to me. With above suggested changes:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> +	return ran;
> +}
> +
>   igt_main
>   {
>   	data_t data = {};
> @@ -490,10 +640,15 @@ igt_main
>   	}
>   
>   	igt_subtest("dp-fallback") {
> -		igt_require_f(run_test(&data),
> +		igt_require_f(run_lt_fallback_test(&data),
>   			      "Skipping test as no output found or none supports fallback\n");
>   	}
>   
> +	igt_subtest("dsc-fallback") {
> +		igt_require_f(run_dsc_sst_fallaback_test(&data),
> +			      "Skipping test: DSC fallback conditions not met.\n");
> +	}
> +
>   	igt_fixture {
>   		igt_remove_fb(data.drm_fd, &data.fb);
>   		igt_display_fini(&data.display);
> diff --git a/tests/meson.build b/tests/meson.build
> index a6f6ad560..95892762e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -366,7 +366,9 @@ extra_sources = {
>   	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> -	'kms_dp_linktrain_fallback': [ join_paths ('intel', 'kms_mst_helper.c') ],
> +	'kms_dp_linktrain_fallback': [
> +           join_paths ('intel', 'kms_mst_helper.c'),
> +           join_paths ('intel', 'kms_dsc_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }
