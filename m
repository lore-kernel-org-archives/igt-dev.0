Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581F7D0BB6A
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 07:31:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F0B10E8C4;
	Thu, 24 Oct 2024 07:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0yirYqV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF05B10E8C1
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 07:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729755078; x=1761291078;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6In6NCNNG9o5Nu8NGpe0KyEbSZBB3jimc+frEuDppcM=;
 b=n0yirYqVPaS6k2GJbPAouHAlLvO6LJEuT6aKG82RQUNkQYZhnxI5uAsh
 YWuor103M1nkfxemtGD9hLCkf2Yic5f0j2+9MHDKzZETts/8aN0NnnOUH
 NKNbPZknRRHaOCc99sbtHZf9mLeS+m3afcpYdh+1rCXPgaMIMkaZyB1Kv
 1ON+IBhF6bC5mizk1YAYY7cw7kGRhAHjJx+eSpi3stwi+hrQULNZLkgMN
 Q6hsN15R6Q3PujPQITJbW8U6mP6diV6CkzIuWuYD7M3/YPvyvQXiCzcdd
 5B8EOfW94QvCzjNnqIW7LHWL/Ikk6qvGuaKmf3vmhkzPkflmMDzFxjfa4 w==;
X-CSE-ConnectionGUID: Tkm5HiYNRIeZ2SWD5InPhw==
X-CSE-MsgGUID: ROFlJerhQ72OcqRLIvx8Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="46862085"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="46862085"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 00:31:17 -0700
X-CSE-ConnectionGUID: MQND6ukQToq4gO1tWau8EQ==
X-CSE-MsgGUID: r91f6be5Sq2ExZT58LfcQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80817274"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 00:31:17 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 00:31:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 00:31:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 00:31:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7vER2XpajlO0OrsHnb6/YyVAeWI7WEg3gsPal/FGvfM/UyZ29GYSKDRGz+mGbrPul4VZkSwy7rPC5C4B7as9M5XRuMdYf39EZir3eeSvm1WBErdcHG0yFL9jr3cg/AtjH44s9JCjpPIIIi+MZFglDfC0brU02JzpuTmXSHYKVR04jv2FohpfVSkbymQU5qy8QA7t5eqy+wBmb8kmScajQnlKo0GmJTyanZdRmyGDJOJK5s+Mnx6n302HrG5h9+2H+6TLrO2Kpy2nix4uIJ3uu5hu8WP7+y9V1a14yJtWmfsP01kNfds6NeM2corxtRa5F6kssJVkFxlx7tmqS/Itw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLXGNq9csSTCEWjG9nKDZ87lV0aJscrcMZKVLXD1//I=;
 b=sEUWLWdxqpMZysD40OymjGQb/g/wLmQgAHYbTR/Cz/Wo2Foru/mxrFAyXz3Low43cLea0YvslijfIhT2MG3+vtMuMPouBpa0su1IQjrqLd1o5TW5CDxzVWlScbnsxNZ1DFrl0aIMOeA1VRpnOdAgkuhQkBVEVfpKeZcJ0Iwj6woIjs15xENjzMw0sqBNxDGVNvEWmPq3SnKMPYq+wSzp9Zyp6k3prU2pOxrXlycJoUuzmaMjErCxeoGgQB5QCt+wLf5n/zcflmf9oT+qLCHQ0Of33aqXzG66Dp2It/hClRUFQl2tFuLYowPh+5sl9mKnHv0aWBs4DyDVIfHzGt3tpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB7465.namprd11.prod.outlook.com (2603:10b6:806:34e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19; Thu, 24 Oct
 2024 07:31:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 07:31:09 +0000
Message-ID: <f2b42f65-d569-45d3-b768-28e137576620@intel.com>
Date: Thu, 24 Oct 2024 13:01:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v5,1/2] tests/intel/xe_pm_residency: Add GT coarse power
 gating validation
From: Riana Tauro <riana.tauro@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Anirban, Sk"
 <sk.anirban@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20241023104604.2145733-1-sk.anirban@intel.com>
 <20241023104604.2145733-2-sk.anirban@intel.com>
 <CY5PR11MB621197BB000EA31E1ECEA8D4954D2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <136ef543-e82f-45be-8df1-cf47bc543ec4@intel.com>
Content-Language: en-US
In-Reply-To: <136ef543-e82f-45be-8df1-cf47bc543ec4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e3fa13-4b3c-4769-0236-08dcf3fdd3d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WExBTGpROURkNi9rWlZkcjVpOVZId1JPVnlNTi9mMmdOb1d6YTM3U04vV3Ev?=
 =?utf-8?B?Vm5FMnJ1eitYTndXQVc2LzJ4TkJjd0lNTUlmc1lRMkJleHVGOXkxUHh0VG45?=
 =?utf-8?B?WWtmcDh3NnhWWlZFSXIwaWFqdmlSUmd5NmF2RlRvL0lDRHdUQURZYm1qbnMx?=
 =?utf-8?B?NjlMRGVOaG9BTW5DOXN2RlU0NTdJQmVQSWRZbjNCaG5ZYzZwcW14dEFHdmtz?=
 =?utf-8?B?UlVmZDhrdENCaE45bjROek9ZVm10ZVd5Uno5eWRwL3M2QlZxaHV0RHNra0tu?=
 =?utf-8?B?QUtUVnIxeDZwdGhvTXpLUVZCMEtjQWtnd05jQU5rL2lyek5VdVNISjk2Wmph?=
 =?utf-8?B?T2xCSlF0ZEVJMUwvdy94bDNWNDh5emxQbjY5OXdwZS9wWWpWQ2EzaVRvcm8x?=
 =?utf-8?B?UmhZSW9kNG1KWjRRNFp0UDJvOXIybkxocmVhcmtpQzVSWDlobytQZ0pRRDRL?=
 =?utf-8?B?VE1TRjhta05GTWJvOW50MmZDZW5XMW5oYmYvRFZvUndTdXBlSUg0Z2NiZVZL?=
 =?utf-8?B?WEs2TWJVRnNWckFaWm1QOHg2RUltZGdzRnk2dmdNdFpZYVIrZis5a2NLdFlB?=
 =?utf-8?B?S1JnM2UvZDNMMHZBVU5hQnBjcEg5Wm5tc0RZOVZHOWh5T1RuYU8zZ09HQ2sx?=
 =?utf-8?B?cjZQWXJ1MUVucXJNdjJBQ2xUbVJMa1NmSzJZODJnRjk2VTZvUVBTYjlZT25N?=
 =?utf-8?B?TEQ3Q2NjTmtHczZOb1d5eXkvODJPSi9qbW9obzAvVzk2WVJJRFZLcjNWMmlp?=
 =?utf-8?B?Sit5V001bTBkcWgxa0kvTFBoWWVVUGl5NGhYdzdCZWhhV0dZUFJCZFZkZ3Fh?=
 =?utf-8?B?MjZuM0poenoxTTl4clIxMWhEb0IzdXhjWk9JVWRnT3o1VDMwYlp0NHNUakg4?=
 =?utf-8?B?SlRVOUNCK0pUYUtVc1d4c2dMaDJ0N21BZGNvUHoxSjJJM3hOOHhvKzRmQkMv?=
 =?utf-8?B?Y3hPQ0IrMERTU1YwVHl6V3ZFMkI2VWthQVo3cXVXQm1aRi91THk1WmV4ZFpN?=
 =?utf-8?B?NHdvQnZrY04vSHAxWkt4cDd2aWFyNGVzWlI4TWd3R2k4YWZweXdKT0dXZytZ?=
 =?utf-8?B?UlNMVkNibUNVTytRMC9nZkdCeUJoTnhzTk11SEJhMTZOdTVhZDRyMnpBNGRB?=
 =?utf-8?B?K1JkMWl6eW0rV1NYb0x0eDJSRmxIRTlGRzR4UGs1bi9oWnJORU90Q3ZTSHZT?=
 =?utf-8?B?RFpUUVlQMkxwQ3lyOGs3Z0MvSjhKRDdjb1N1eVFaL2JHSUlzS3Njb3Btd0Ju?=
 =?utf-8?B?R3JvV051V05ncml3ZFJkNUhud1c5WjNURDF3Qm1YcEE5U3QrL0orV09MaGhQ?=
 =?utf-8?B?OHJWb2cxNnZmSy9XT1BLcWx6RUxqU3dzTTRsMWxLd0cwcUNMbU42VFJudHI4?=
 =?utf-8?B?UXlDaHdLUi9mb2U0S0dnd0VRUzZxNzBER3RtT1ltV2YyMlhuQUpkSDRodFFt?=
 =?utf-8?B?SUtVUjZrVnlLRk4wRHRiYzdWZEh1WWdTbVlTMXZPY2ltSWppV0dFZmVKdzNH?=
 =?utf-8?B?cThYVEtGWVhSOXZmOGVBVCtPYzhMdytYaVplT1lKd2hKdytTakptZDl0ckRi?=
 =?utf-8?B?NHE5d2JvMkR1YTlMWVRyc0k1SnFCK0dDTGp3cEpsN1g0TS84UGRjMlRMMkMy?=
 =?utf-8?B?T1ptUjRhbVViclpBSE5ZUThmZjRWZ3B0UlNjRXliYkRDbEhqZzJWOWpnRDY3?=
 =?utf-8?B?OHNPZE9pNVBDaHRHeFVGN1JVRXp4ZGc2RXlodlVQUDJwcmJSaVlmR3lhZHlx?=
 =?utf-8?Q?ZHtR1KmApKt6yGQs0wBD76FhBnii4q0RAWjuqZC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG5nZ2w0MERNWFFkdlBQckxYR1dzZk1iWjJQOGhBMmZia3g4NVNMSkxXb3ps?=
 =?utf-8?B?QUovZXdNYUtjUHhLYXlLVjZYT0YxTkgrMXhPK0x2L1JCUDVvRUNLajh0dEdP?=
 =?utf-8?B?RjVyc2NSUnRTOWY5c2RIN0tVUWxJK2JzM3VKRnBXUHVjYmVPendtTmJHNE5F?=
 =?utf-8?B?dGNBc3RnL0RsNi8rMnJ6ZjZsUHgvZEZjMFlxcXdyNk1XWDM1bXdXcmQ4Zldo?=
 =?utf-8?B?WXdlQk5TangyNEd1ZTZKaWVzYXBOc1lYeDhVMWovQ3N2MTdZRys4cGFVQmlz?=
 =?utf-8?B?SWllbndzTmkxTHNoY0ZlQS9Kb2NnSDRKRzJlTlFOUG04eTBkbFFXTHBJOW56?=
 =?utf-8?B?dVdYTm9mMndNa3pTUERMVThDaEJ1bmk2VDY1OE1oSEJFVFJMWXkwZlVpUU03?=
 =?utf-8?B?dHFHZ2c4V0pGemhDZXA0RGVaZ3QzdFdnTXR2YU1oMEx6Q0JqTGwxZkdYLzZV?=
 =?utf-8?B?UjlTVFM3Z3hkOTRJSDlEeEJmV2E2ZzduWFYrNHlPOTZsdlY0Zks2bFpMTWFs?=
 =?utf-8?B?endJa0lHOUxud1Q1T2ozeHBtTFZwN0pqSi9IcVZweTZUY0c2UFRGNjJYSmlC?=
 =?utf-8?B?RHMxOTlLNkFCMU5hZ0p0a1Z5ZS9pVnVqTUFnalNkRzBVd2FXK3dlL1V2ZER6?=
 =?utf-8?B?SkY1bmhJbExGSmZqd1pXVnJheEtPVG8rUVIyaTk4N3E0Rlp5VGplZjNZbmVD?=
 =?utf-8?B?S1lnWG5Oa3BMZ3k2cTNMci93cEkyN21NWE1SWmROQjJaSVhpNXdDa0V0eEVW?=
 =?utf-8?B?U0JlczRzVnY0V2FtclQ4WFVmZkZmTXNEbW9oa1FOZFBJeVBGYVo5a3FMeExE?=
 =?utf-8?B?RytnQmNpbEhiTDcyV2JjYmU3MlJXNzh6NkxQSDJZWi9XVlBqcmVXMkMxV3V2?=
 =?utf-8?B?dG9kMURTM0JjZlA4Y2ljTWRSbjcwc1hRalQzYjB3dkozVWRIMGEyNTZnOFIv?=
 =?utf-8?B?NVVBSHFSNVhFQU1CUVNyaEc5RlEzL0tleGtYaURmRWE3NGRzK21yK2pIOEcy?=
 =?utf-8?B?VVdkcEV5em5qUE5XZjVQNGtDUFVjQW5xKzNVWWJKd05aZ0VFdjd1RXpNbmpX?=
 =?utf-8?B?ZjJnaFprdzZobzZMZ2pWTlRsaVJiVDZSMHA3RThLMFIraUc0Q2NHUE1LWGR6?=
 =?utf-8?B?OE8rSkx4cm51QnJtYytYU1JTNGxXa2pheTBwMmNoYzNHQjZmQ24wRzRpcXpo?=
 =?utf-8?B?bGY4Ym5qazQycEVVM2x0VDYrYmpPSEdRZm9PdkFaZkxBajUrdEo4ZXgvNU5s?=
 =?utf-8?B?bFp6c2pNeW1Dak5XWlhOcmFVQWpMVW5qY3lITk56QVVpMXVTdzJralg0T3Y3?=
 =?utf-8?B?UzF6WlFyQ3M1S3NIZS9MNWRJMkx5bHJKS3RDU1FFRXFRV09BUlJLQk9TRnFS?=
 =?utf-8?B?THk4RmNTT2NGNmdObHdQZ1NjR20yRVZNdkhDYy93Q0lteVhtc2pNVlNnOXdC?=
 =?utf-8?B?cmdSVDJkSThvWW10QlViNUtuNEh4NFNXTXJuOXdWWWZvZUlDT3VNd2VGRE1x?=
 =?utf-8?B?N3hNOXRVTjcxRjhiUVdlOGh6YitNNm5FMTdWWDFBYjlGdmJRdjV3YTJhTmFS?=
 =?utf-8?B?UlYrcEJZUllQaFAwNHJFTThtQUJ2TUpON3duanlMWVNWVStWQlA1K2I2Mm1Y?=
 =?utf-8?B?b1F4K3pWYWxxVWNTZzhNMXRaeFBmREF4dHlEaVBYUzdvNWFkVTgrM3hsWENs?=
 =?utf-8?B?Z2dVRkMycDIyN1BKR1hEYm1VcTYydUd3dnQ5QkQzL09YSXFqb1JHOTRqcGpE?=
 =?utf-8?B?NVRsUy9PVkZKMlBaVnFZc3o5WHdmdEZJcTRRSHhKZTZlK2lBOW91VlNuTmht?=
 =?utf-8?B?OTV4Q2MwcE1xNldnbityc2xTbmRaajFUVkNyRkp5U2ZsNklCSEJJY0pDN2Ir?=
 =?utf-8?B?bmFhNERTYUxUQmMyOXcvdGVvREppbW54dzhJdW1tNkkycjNPUGVkdmNDOThD?=
 =?utf-8?B?TmJubWdZWmpDQlJ4SEpEWUpDWHBOb2N2R3paT1p0ZEJiMi9aZkcvZmRmUHJH?=
 =?utf-8?B?aWlzQjEvVDJOeVdkaFRNaUc4WlZyZ0lpWnovSk55UFA1TDdUSjFucEVFOHRR?=
 =?utf-8?B?cWRXdHZkem1zNzFyWHQxcWRxTzBsY210NytCckM5akpCS3V4Y0FHRHg2dVo1?=
 =?utf-8?Q?kCZSQUlpHPMHsWKN6S7LFPXYs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e3fa13-4b3c-4769-0236-08dcf3fdd3d8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 07:31:08.9863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RA8fQVmUcq9/iIiKjBKXty0coMXxUv2wwaSed4jSkwaUTGqloH/j0ATdhxd491SCJR9v7muRku/NjJ7WXvV2Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7465
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



On 10/23/2024 5:01 PM, Riana Tauro wrote:
> Hi Anshuman
> 
> On 10/23/2024 4:32 PM, Gupta, Anshuman wrote:
>>
>>
>>> -----Original Message-----
>>> From: Anirban, Sk <sk.anirban@intel.com>
>>> Sent: Wednesday, October 23, 2024 4:16 PM
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: GSSE Core KMD Power Telemetry India
>>> <gsse.core.kmd.power.telemetry.india@intel.com>; Anirban, Sk
>>> <sk.anirban@intel.com>
>>> Subject: [i-g-t,v5,1/2] tests/intel/xe_pm_residency: Add GT coarse 
>>> power gating
>>> validation
>>>
>>> From: Sk Anirban <sk.anirban@intel.com>
>>>
>>> Implement test cpg-basic to validate coarse power gating status after 
>>> S3 cycle.
>>   why only S3 cycle , why don't we have s2idle cycle test ?
>> Thanks,
>> Anshuman
> 
> S3 and D3cold caused the registers to be reset when suspended. 
> Restoration was added on resume.
> 
> That is the reason S3 was preferred over s2idle.
> 
> Thanks
> Riana Tauro
>>> Add test cpg-gt-toggle to check if GT coarse power gating is up when 
>>> forcewake is
>>> acquired and down when released.
>>>
>>> v2: Address cosmetic review comments (Riana)
>>>      Fix suspend state (Riana)
>>>      Add exit handler for test cpg-gt-toggle (Riana)
>>>
>>> v3: Address cosmetic review comments (Riana)
>>>      Fix commit message & test name (Konieczny)
>>>
>>> v4: Address cosmetic review comments (Riana)
>>>
>>> v5: Remove unnecessary openings and assertions of gt directories (Riana)
>>>
>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   tests/intel/xe_pm_residency.c | 80 +++++++++++++++++++++++++++++++++++
>>>   1 file changed, 80 insertions(+)
>>>
>>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/ 
>>> xe_pm_residency.c index
>>> 772fe9b57..d4b26b231 100644
>>> --- a/tests/intel/xe_pm_residency.c
>>> +++ b/tests/intel/xe_pm_residency.c
>>> @@ -63,6 +63,12 @@ enum test_type {
>>>    * SUBTEST: toggle-gt-c6
>>>    * Description: toggles GT C states by acquiring/releasing forcewake,
>>>    *        also validates power consumed by GPU in GT C6 is lesser than
>>> that of GT C0.
>>> + *
>>> + * SUBTEST: cpg-basic
>>> + * Description: Validate GT coarse power gating status with S3 cycle.
>>> + *
>>> + * SUBTEST: cpg-gt-toggle
>>> + * Description: Toggle GT coarse power gating states by acquiring/ 
>>> releasing
>>> forcewake.
>>>    */
>>>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>>>
>>> @@ -317,6 +323,69 @@ static void toggle_gt_c6(int fd, int n)
>>>                    "Power consumed in GT C6 should be lower than GT
>>> C0\n");  }
>>>
>>> +static void cpg_enabled(int fd, int gt) {
>>> +    const char *render_power_gating = "Render Power Gating Enabled: ";
>>> +    const char *media_power_gating = "Media Power Gating Enabled: ";
>>> +    char str[512], path[PATH_MAX], *render_substr, *media_substr;
>>> +
>>> +    snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
>>> +    igt_debugfs_read(fd, path, str);
>>> +
>>> +    render_substr = strstr(str, render_power_gating);
>>> +    if (render_substr)
>>> +        igt_assert_f(strncmp(render_substr +
>>> strlen(render_power_gating), "yes", 3) == 0,
>>> +                 "Render Power Gating should be enabled");
>>> +
>>> +    media_substr = strstr(str, media_power_gating);
>>> +    if (media_substr)
>>> +        igt_assert_f(strncmp(media_substr +
>>> strlen(media_power_gating), "yes", 3) == 0,
>>> +                 "Media Power Gating should be enabled"); }
>>> +
>>> +static void powergate_status(int fd, int gt, const char
>>> +*expected_status) {
>>> +    const char *power_gate_status = "Power Gate Status: ";
>>> +    char str[512], path[PATH_MAX], *status_substr;
>>> +
>>> +    snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
>>> +    igt_debugfs_read(fd, path, str);
>>> +
>>> +    status_substr = strstr(str, power_gate_status);
>>> +    while (status_substr) {
>>> +        igt_assert_f((strncmp(status_substr + 
>>> strlen(power_gate_status),
>>> expected_status,
>>> +                      strlen(expected_status)) == 0),
>>> +                  "Power Gate Status Should be %s\n %s\n",
>>> expected_status, str);
>>> +        status_substr = strstr(status_substr + 
>>> strlen(power_gate_status),
>>> +                       power_gate_status);
>>> +    }
>>> +}
>>> +
>>> +static void cpg_basic(int fd, int gt)
>>> +{
>>> +    cpg_enabled(fd, gt);
>>> +    igt_system_suspend_autoresume(SUSPEND_STATE_S3,
>>> SUSPEND_TEST_NONE);
>>> +    cpg_enabled(fd, gt);
>>> +}
>>> +
>>> +static void cpg_gt_toggle(int fd)
>>> +{
>>> +    int gt;
>>> +
>>> +    fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>>> +    igt_assert_lte(0, fw_handle);
>>> +
>>> +    xe_for_each_gt(fd, gt) {
>>> +        cpg_enabled(fd, gt);
>>> +        powergate_status(fd, gt, "up");
>>> +    }
>>> +
>>> +    close(fw_handle);
>>> +    sleep(1);
>>> +    xe_for_each_gt(fd, gt)
>>> +        powergate_status(fd, gt, "down");
>>> +}
>>> +
>>>   igt_main
>>>   {
>>>       uint32_t d3cold_allowed;
>>> @@ -380,6 +449,17 @@ igt_main
>>>           toggle_gt_c6(fd, NUM_REPS);
>>>       }
>>>
>>> +    igt_describe("Validate Coarse power gating status with S3 cycle");
>>> +    igt_subtest("cpg-basic")
>>> +        xe_for_each_gt(fd, gt)
>>> +            cpg_basic(fd, gt);
>>> +
>>> +    igt_describe("Toggle GT coarse power gating states by managing
>>> forcewake");
>>> +    igt_subtest("cpg-gt-toggle") {
>>> +        igt_install_exit_handler(close_fw_handle);
>>> +        cpg_gt_toggle(fd);
>>> +    }
>>> +
>>>       igt_fixture {
>>>           close(fd);
>>>       }
>>> -- 
>>> 2.34.1
>>
> 

