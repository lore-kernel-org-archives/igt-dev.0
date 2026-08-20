Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668A6C5DF87
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 11:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0696310E1B1;
	Thu, 20 Aug 2026 11:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTlHnBJJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3379010EFF3
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 11:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787224241; x=1818760241;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YgkeKdFKge/P0ZuR5/fPsuqIqQZPxRH6Wm5LBd2OS5Y=;
 b=HTlHnBJJw02YmoEedl7fL9qcO35QGgPBKm3V+IyAEo3AanD5lQkrkxuK
 qoMvmI+pgd/iezB+H2GrU388snuYSu5pBRH930Cy5FiiEGHw+oYl9Hreb
 0ZhYKAbmw4O+rxGo/0UebK8qEKERYwnbpC9YpxGdiHJ7EYOdlJazERDWp
 rhZuV4/DyjIHrQv6WWlpGD5TZCbpzo/RidEzXB8dJHsg4Whka5ukPRDAh
 12rBCSQKhSE/w7ekQMMC8Lqe6SjxvkcWckLG0vW10d5TTsqdR+Jy+1AWp
 j7sEZKzIFv28hKTbH3FBs7eMaXrstHshM3Ek9GMP7bdA7mTET2WokDEup w==;
X-CSE-ConnectionGUID: emetOnOVRwaVvvQ4zDcm+Q==
X-CSE-MsgGUID: fllzkI0pSiagDTNQK3mJGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98912837"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98912837"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 04:10:40 -0700
X-CSE-ConnectionGUID: Pexq2N25S6qdnK+KK7U6wA==
X-CSE-MsgGUID: IatRLBE0QACVBpdLtBptrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="269459067"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 04:10:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 04:10:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 04:10:38 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 04:10:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMMBGvEiNG3BvPBdnKu86gifoiBcvDkChRLItfRGrXu/Z3jJwp92i7RkyHaXbCw+tI02RTnmBo/VJgLYr2Xp5KKEs0gA+W3JEAHRF3WXepScodSh0kDoCpV6RMfwIFYu+kVh6+Y4/Gai+Db5mLEukt8KYugCW2AA1PCxD5frHeJL8W3YzvC04UFXB3/TSdzveUJ94M9JG03aahgPjsMF/6XPH7Yv/8x9ErQmGnplQhACOooHGh87Md+vbIZd4VlXnnem83qDCqaxs1eHNNqLb5dU+jwkdJJ+XZjJCZSoGvARpEwaVA7QWX73gl0jl67tj8EO8H/d3VZWzC1VeTibQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wD/aKwtLJOVYneqWPj/xaFCwtUFTmWyx6Up/6lHYyVk=;
 b=sqe3OUjWEdVlonF8+iMIVz9fKQTr3H7qwTAWUS99+AvrMTz5ONtlBG8oJlGITtQ4Y3Xs7LfgEJbxFqXxzx6p8JsSAjYCUuy5UTRgVu3MI8bHalqPHpNSAezvLCBRX7dPtLJ6x1FIQ/6ObTn+B57OTEflVDvCwHllhJ4rA2ahJdqGWgeUVXJ+a5NHXoqTBSjvyelZp2QHgKwJ0H2EoIfJPN9AfdNZJyqF/aSK7JNo0NvCcOYdKG8bngeM88pe/vphC2aY9HEL2M+kAgg09jralK2pLQXdV2hGQT8yQSsuZ3LMGd5tb1/p9G/1f6ouq4HvVtHl6KV/43K4VApFTGOtZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 11:10:32 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 11:10:32 +0000
Message-ID: <cbc88cef-1008-409b-aa54-3d9fd4ae5696@intel.com>
Date: Thu, 20 Aug 2026 16:40:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] tests/kms_vrr: add CMRR fixed and video mode
 subtests
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <mitulkumar.ajitkumar.golani@intel.com>
References: <20260812130738.1242659-1-ramanaidu.naladala@intel.com>
 <20260812130738.1242659-3-ramanaidu.naladala@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260812130738.1242659-3-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0209.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::6) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|IA1PR11MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b88558-76fd-46de-7485-08defeaba6cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|18092099006|11063799006|4143699003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: nUIG9CM4ot29bqFfWi/JeMYT0xbU3quO2VIy3u7SjyICxY8AijcZAnqVGeQ4kRjCEI/dy8GP9vQMuDsywnFp4T4eH3SiNbtq5+CZBRovy859hLfsmshzt9o7l75+XA17r8ep9fyUgMLfiZhPoVoSSE+L2erWgthxCTaUaTixOVK0dzD/f7Q5lZiIVMFmdamXAZRFLUe76yl3Z6XpG3P3ypa3/429H8CTaKSLAzH8tEqOu+Oil7Oc7tUDcZelwdGlelQbvzXsLk0/45dZIi3l5BV1pBPF9i7AylPAh6tRAMdTSAFJuyKMUz24bQehPFXk9St3H3FpAH8A3J6frjYV02hPtU+DE258BJDSLy34voejiE804G/g5Be+ABh0bJa5+mSBlTvJBNHsL6gjI8J5aQfItQfsu/Q6pXkgBJbkPFCrIHvegoZzYDRJXCgvgAsagOHCOIMz73T/vpFsMGQLHSQOQwHnOM5bAjLPMBMeQdsjVWShnEbP0V+CPTKs1hcFbdUyB9CXrl4zHiMQRn0BW8FfeE3HYWMWmeGVwFCICCQLED7ZMsqJ3YoZC010QWGv8YSPnaUj2vxV9Rjfu3JIXWOUkczYr657ReiJBma08uvf9Hrh/BewvblMnqSbkf0FQt8eVuZRxHKcqKMIcvEWagx3W6SCHURHfWPHO+1Y3VA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(18092099006)(11063799006)(4143699003)(56012099006)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW5PUUtJNjBGQUY5dXJkNGx4QlUyajNKejREV3RYai9CY0J5NEhrdTh2RS9F?=
 =?utf-8?B?dXEzOXVCalkvbmdWSmpkUlNyMHBkbjRWeTRaOCtwajE1MmFrTlJBZUtqcFRE?=
 =?utf-8?B?WFk0VHMxWnNBdDJ6anZPOW5jbGU4NW14Zjg2OVRET3gyMHpQSjZlVWVNSmo4?=
 =?utf-8?B?ZjZYeThaZW82ZkVCRklTUStSaCtwYnExWjhHMkpDK1hNVzhKdkNPMWo0M0ha?=
 =?utf-8?B?cmExZnJBd1ZzWjJHMkhMZXAvb29SVTNvLzJGWWtlNzUvNVJTbVB0c0kxeFAx?=
 =?utf-8?B?aEovemRBRUVQVk9BQ1Z2VjdaUTJoWXI1VnQraW9DN2dsdzJIMGNYM3ZhbVox?=
 =?utf-8?B?OXFtN3pTbUhic1RVK2dtZjJWVU03YnU0VjROZ2FKVWJHdk1hWFlEUk1ieDcr?=
 =?utf-8?B?bXdHNk9QQTBNdGVLSnB1UU5zVTdyUHpNbnhMZ2RHdUVZTVk2WXkrVlVuWW1p?=
 =?utf-8?B?dHdGU3craXF3U0lSZUhsdnVXUFFURXpSekNadDcrWHRva1lWRW0yd1AvbUFr?=
 =?utf-8?B?Z3V5dHNNUXBnbnMvZkxWeW9VUGNDQzhCUElITnNqSFVMUUxDS2toWUFrdVNJ?=
 =?utf-8?B?MGxsZkhoSjByS0NvTmM4NUpSaVJWNmlZVGNzdnJRZHZkMnZsbU5tSEYxNG84?=
 =?utf-8?B?aStRUE9rWEl4QklXWDNNQXlpSzU0d3AzNDdhdE9pc1BkM1FNYmhQTzdubTQw?=
 =?utf-8?B?RkcwUnFMdXlhQ1V3N0F1M3duQll4OU1kTmx3NlhmTDZaVDBRcDQ2dUt6ZjdV?=
 =?utf-8?B?aEpJR05xbWtPbTNLUGdEVlVPNG5pTk5ucnRiYWFrYnBqZHNITE1CaG53R3Ru?=
 =?utf-8?B?dnJVamE1WkVGckh0ckhlMmUxeWVhYTZySkVNSEJhZWcrR3o5Zkp6ajZxYnh1?=
 =?utf-8?B?em9qSG9PUjY0TE8vWGQrVjYvYVc5ekR2VEJQRGsyckF4RThYQnR2Zk5lTkxG?=
 =?utf-8?B?RjhUaThRRDVsb0MycndCanRtVjJXdktkNTMwR2tiZHpGc0xmRXFqZFM1VE5t?=
 =?utf-8?B?emRONmY4ZGJmaVcxdGp4akROcVVDcEt4bHYzeE4xenBWODI2V2MwY1QyRkg4?=
 =?utf-8?B?ODcyaFd2b1hxcGUxcnVDVnF2TmVRLzBrMGtLTHVVbzYzTGhHbWQ5WnRoL2c1?=
 =?utf-8?B?RGtIU0FjME4yVm5MR1hpTXJGcU90MFBJWHQ2RVAzazFCOUdFM04yUDRJVVB4?=
 =?utf-8?B?YXlZTE5hUmNDUTdCOFZDN2l1ZTJNbFhFTG5Pa0Z3Zkd3eDh0eEdBLzdLNkJz?=
 =?utf-8?B?SU5ZOGR5NW5CcWFpWGwwd1FmUWpTaG10RXpWQ2EzcEhoeFU4NUpUQ01HNFdR?=
 =?utf-8?B?VWlTVTUvNnhhMURLNDRJdURSWWIyb21vMXNZWjhid3pOSTVrbEE0Q00vRnNB?=
 =?utf-8?B?Mk0ydU5NN3NBQTFTcDEybllyUSsySHM0Q1F3T25nelhHeUNaUzJlWERiQ1lI?=
 =?utf-8?B?ajNPSTMvMEloWEZtTTNwaS9lcDd2czFzeHh5V0lNUTh2L1VuaEV6c3dsQ0Ur?=
 =?utf-8?B?d2xzU2Fnc1RCMUxhT0VVQ3VzNC9QSk5CS1g5MGtkNTVEM09YQzh3aFd2QmNl?=
 =?utf-8?B?NlVQUGVwV3dlY3BOaGpiV1RhdFBQdk15TGd5eHZnQlUzdUgrRm43RWIxd3FP?=
 =?utf-8?B?ekJMYzZLVW9maWNyM1UyZjBDMGJOS3BOSU02Skl5T25wUy8rS2pjZmRqSFE1?=
 =?utf-8?B?VlZnVGlENldqbEFaSlc0cVkwMWVGVW5LdkFVbUt2UGlNVmlBOHc3eWRtTHZC?=
 =?utf-8?B?elRLZDhNOHM3L0xRdXZIbkRaTmt5ZmhtVmxHcEt6U1JCUzdTOUlEWitaTnNI?=
 =?utf-8?B?V0kyWnNFcWhXT2dRUFJoOC9TTXEvN3NFYmtpQnRLVk1RaHBnNjJZTkxqVDRh?=
 =?utf-8?B?eTBmai9TM3psUUtCdTQwUHoxNGJYSmJIWkJGNDNrcnp6MDhVTDN6SmplUjN2?=
 =?utf-8?B?NEFRamNPb0dSWmNPbExsVGJIbk4zd0NaNC9GVWs4ZVM4dC9rd3E2QWhCUEox?=
 =?utf-8?B?UlEzbWhRdFZXTC9zRmxYeU53alJlOW44cVpXcHNOZFQxbzVwRXJTSnpkMzRv?=
 =?utf-8?B?OTg1eStuaWk5N1VEY0M5YzNSMUdVUmszSkxsVmdqbnE2dFZoaFp0Wm1VTEhS?=
 =?utf-8?B?SFdrZm9zam10MjV0MmN1OVo2WEE4RGpFMlpDZSt5SUxiaVFsd3ZJZkZrYk5a?=
 =?utf-8?B?c0daYmJnNU5FbTRMdDlDeVhiOFVOVEhsVWw3d21KRy9ZbkQxdzllckgybjF5?=
 =?utf-8?B?VG81T25hQ2UzdXdsM0l6RXhKZGVHWG04SzFiOW8ycTQ1KzQrRk95em5vY2wy?=
 =?utf-8?B?L2NLNjlzeWlKQXczOTZCMWxtdktEcURUOUtFcGxkMDFnc3FZVkZ3Y2M1TWY2?=
 =?utf-8?Q?ZTcsLMR1nysMEFOU=3D?=
X-Exchange-RoutingPolicyChecked: WwdaRt57l6dfBzkpvlPS8JreKW3ZPBCxDd0NjML0N1HnURh7/MZR8GBKba6j6kqnDFtgcuYiu7z90UvybM11tFcDW+oDfJ28GeknJU7jsM/xKAzFQdwY+2Bfdk5Gmbz5LLypwX/DeyDpe0QfO8vv2f8omm/l4JeIbFd7wGv58R/XtmErSAI/HBRitFLSZSXRM1RL+GjDOmTSgrMsXL5rpq30owz9vgKbX2I7riX0MZLGQ9roB5k45ZWt8YyEp12YBkqOXP96tBdH7sIbv/zVpV9q92xt9gRsN4V53dCK+UweYE6ecSUqPgXnZ9WDEu95cUdQ+KarATNG2qJ8s1+lZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b88558-76fd-46de-7485-08defeaba6cf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 11:10:32.7780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rq0j4DnLMeDFFKjHZvyE/7ujWFWKg3YbaPeVm7621+5+ROIzcpdO1Z9KcYk1YjAFbnV7Q6zrgesQd9He19SpfVU4hac5mUn5gwCCUUAH48U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
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



On 8/12/2026 6:37 PM, Naladala Ramanaidu wrote:
> Add test coverage to validate Content Match Refresh Rate (CMRR)
> behavior across both fixed and video timing display modes.
> 
> This introduces a shared helper library to support refresh-rate
> mode selection and parsing,

Does it?

  along with two new test cases covering
> fixed-mode and video-mode scenarios.
> 

Let's call it desktop mode (here and everywhere else). Refresh rates are 
fixed here anyway.

> The new tests measure actual display refresh timing during CMRR
> operation and compare it against the expected target rate to
> verify correctness. Video mode coverage validates behavior across
> standard video timing rates, while fixed mode coverage targets
> display modes that fall outside the standard video timing set.
> 
> Each test cycles through the relevant refresh configurations,
> applying and resetting the appropriate settings between
> measurement passes to ensure consistent and isolated test results.
> 
> v2: Fix test issue.
> v3: Address review comments. (Mitul)
> v4: Fix test issue.
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_vrr.c | 204 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 204 insertions(+)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 27f18e8d0..ab6bc66d9 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -32,6 +32,7 @@
>   #include "igt_pm.h"
>   #include "igt_psr.h"
>   #include "i915/intel_drrs.h"
> +#include "igt_vrr.h"
>   #include "sw_sync.h"
>   #include <fcntl.h>
>   #include <signal.h>
> @@ -80,6 +81,14 @@
>    *
>    * SUBTEST: lobf-dc3co
>    * Description: Test DC3CO entry during LOBF.
> + *
> + * SUBTEST: cmrr-fixed-mode
> + * Description: Test to set a fixed CMRR target refresh rate and verify it
> + *              is correctly applied.
> + *
> + * SUBTEST: cmrr-video-mode
> + * Description: Test to set standard video timing refresh rates via CMRR
> + *              and verify each target rate is correctly applied.
>    */
>   
>   #define NSECS_PER_SEC (1000000000ull)
> @@ -103,6 +112,8 @@ enum {
>   	TEST_LINK_OFF = 1 << 10,
>   	TEST_NEGATIVE = 1 << 11,
>   	TEST_FORCE_RR = 1 << 12,
> +	TEST_CMRR_FIXED_MODE = 1 << 13,
> +	TEST_CMRR_VIDEO_MODE = 1 << 14,
>   };
>   
>   enum {
> @@ -580,6 +591,184 @@ flip_and_measure(data_t *data, igt_output_t *output,
>   	return 0;
>   }
>   
> +static
> +uint64_t wait_next_vblank_ts_ns(data_t *data, igt_crtc_t *crtc)
> +{
> +	union drm_wait_vblank vbl = {};
> +
> +	vbl.request.type = DRM_VBLANK_RELATIVE | igt_crtc_get_vbl_flag(crtc);
> +	vbl.request.sequence = 1;
> +	do_or_die(igt_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &vbl));
> +
> +	return vbl.reply.tval_sec * NSECS_PER_SEC + vbl.reply.tval_usec * 1000ull;
> +}
> +

Time to create a helper for this. See wait_for_vblank() in kms_async_flips.c

> +static void
> +flip_and_measure_target_rr(data_t *data, igt_crtc_t *crtc,
> +			   double vrefresh, uint32_t cmrr_mode)
> +{
> +	uint32_t i;
> +	bool front = false;
> +	uint64_t last_vblank_ns, vblank_ns;
> +	uint32_t err_frames = 0;
> +	uint64_t frame_times_ns[TARGET_RR_SAMP_COUNT];
> +	uint64_t exp_time_ns;
> +	uint64_t total_frame_time_ns = 0;
> +	uint64_t avg_frame_time_ns;
> +	double  avg_refresh_rate;
> +	double  expected_rr;
> +	uint32_t valid_frames = 0;
> +
> +	exp_time_ns = igt_kms_frame_time_from_vrefresh(vrefresh);
> +
> +	do_flip(data, &data->fb[0]);
> +	(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> +	last_vblank_ns = wait_next_vblank_ts_ns(data, crtc);
> +
> +	for (i = 0; i < TARGET_RR_SAMP_COUNT; i++) {
> +		front = !front;
> +
> +		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
> +		vblank_ns = wait_next_vblank_ts_ns(data, crtc);
> +		(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> +
> +		frame_times_ns[i] = vblank_ns - last_vblank_ns;
> +
> +		if (frame_times_ns[i] > (exp_time_ns + (exp_time_ns / 2))) {
> +			err_frames++;
> +			last_vblank_ns = vblank_ns;
> +			continue;
> +		}
> +
> +		last_vblank_ns = vblank_ns;
> +		total_frame_time_ns += frame_times_ns[i];
> +	}
> +
> +	valid_frames = TARGET_RR_SAMP_COUNT - err_frames;
> +	igt_assert_f(valid_frames > 0,
> +		     "No valid frame samples collected\n");

We should hold valid frames to a higher standard than > 0

> +
> +	avg_frame_time_ns = total_frame_time_ns / valid_frames;
> +	avg_refresh_rate = (double)NSECS_PER_SEC / (double)avg_frame_time_ns;
> +
> +	if (cmrr_mode == CMRR_VIDEO_MODE) {
> +		expected_rr = (double)(vrefresh * CMRR_NUMERATOR) /
> +			      (double)CMRR_VIDEO_MODE_DENOMINATOR;
> +		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= 0.02,
> +			     "CMRR refresh rate mismatch: "
> +			     "measured avg_rr = %.3f Hz, "
> +			     "expected_rr = %.3f Hz\n",
> +			     avg_refresh_rate, expected_rr);
> +	}
> +
> +	if (cmrr_mode == CMRR_NON_VIDEO_MODE) {
> +		expected_rr = (double)(vrefresh * CMRR_NUMERATOR) /
> +			      (double)CMRR_DENOMINATOR;
> +		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= 0.02,
> +			     "CMRR refresh rate mismatch: "
> +			     "measured avg_rr = %.3f Hz, "
> +			     "expected_rr = %.3f Hz\n",
> +			     avg_refresh_rate, expected_rr);
> +	}
> +
> +	if (cmrr_mode == CMRR_DISABLE) {
> +		expected_rr = vrefresh;
> +		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= 0.02,
> +			     "CMRR refresh rate mismatch: "
> +			     "measured avg_rr = %.3f Hz, "
> +			     "expected_rr = %.3f Hz\n",
> +			     avg_refresh_rate, expected_rr);
> +	}
> +
> +	igt_info("Average RR (Hz): %.2f , Expected RR (Hz): %.2f, error frames = %d\n",
> +		 avg_refresh_rate, expected_rr, err_frames);
> +}
> +
> +static
> +void test_cmrr(data_t *data, igt_crtc_t *crtc,
> +	       igt_output_t *output, uint32_t flags)
> +{
> +	uint32_t found;
> +	double rr_from_mode;
> +	drmModeModeInfo mode;
> +	drmModeConnectorPtr connector;
> +	int j;
> +
> +	igt_require_f(cmrr_supported(data->drm_fd, crtc->crtc_index),
> +		      "CMRR not supported\n");
> +	prepare_test(data, output, crtc);
> +	set_vrr_on_crtc(data, crtc, true, false);
> +
> +	if (flags & TEST_CMRR_VIDEO_MODE) {
> +		for (j = 0; j < igt_vrr_standard_video_timing_fps_count; j++) {
> +			found = igt_vrr_get_mode_with_video_timing(output,
> +							igt_vrr_standard_video_timing_fps[j],
> +							&mode);
> +			if (found) {
> +				rr_from_mode = igt_vrr_mode_line_refresh_hz(&mode);
> +				igt_output_override_mode(output, &mode);
> +				igt_info("Override mode:");
> +				kmstest_dump_mode(&mode);
> +				igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +				igt_target_rr_debugfs_write(data->drm_fd,
> +							    crtc->crtc_index,
> +							    mode.vrefresh,
> +							    CMRR_NUMERATOR,
> +							    CMRR_VIDEO_MODE_DENOMINATOR);
> +
> +				flip_and_measure_target_rr(data, crtc,
> +							   mode.vrefresh,
> +							   CMRR_VIDEO_MODE);
> +
> +				igt_target_rr_debugfs_write(data->drm_fd,
> +							    crtc->crtc_index,
> +							    mode.vrefresh,
> +							    0, 0);
> +
> +				flip_and_measure_target_rr(data, crtc,
> +							   rr_from_mode,
> +							   CMRR_DISABLE);
> +			}
> +		}
> +	}
> +
> +	if (flags & TEST_CMRR_FIXED_MODE) {
> +		found = 0;
> +		connector = output->config.connector;
> +		for (j = 0; j < connector->count_modes; j++) {
> +			mode = connector->modes[j];
> +			rr_from_mode = igt_vrr_mode_line_refresh_hz(&mode);
> +
> +			if (rr_from_mode - mode.vrefresh > 0.04) {
> +				found = 1;
> +				igt_output_override_mode(output, &mode);
> +				igt_info("Override mode:");
> +				kmstest_dump_mode(&mode);
> +				igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +				igt_target_rr_debugfs_write(data->drm_fd,
> +							    crtc->crtc_index,
> +							    mode.vrefresh,
> +							    CMRR_NUMERATOR,
> +							    CMRR_DENOMINATOR);
> +
> +				flip_and_measure_target_rr(data, crtc,
> +							   mode.vrefresh,
> +							   CMRR_NON_VIDEO_MODE);
> +
> +				igt_target_rr_debugfs_write(data->drm_fd,
> +							    crtc->crtc_index,
> +							    mode.vrefresh,
> +							    0, 0);
> +
> +				flip_and_measure_target_rr(data, crtc,
> +							   rr_from_mode,
> +							   CMRR_DISABLE);
> +			}
> +		}
> +		igt_require_f(found, "No non-video-timing mode found.\n");

Should this be a skip?

> +	}
> +}
> +
>   /* Basic VRR flip functionality test - enable, measure, disable, measure */
>   static void
>   test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> @@ -591,6 +780,7 @@ test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>   	uint64_t rate[] = {0};
>   
>   	prepare_test(data, output, crtc);
> +
>   	range = data->range;
>   	vtest_ns = data->vtest_ns;
>   	rate[0] = vtest_ns.rate_ns;
> @@ -1147,6 +1337,20 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   		}
>   	}
>   
> +	igt_subtest_group() {
> +		igt_fixture()
> +			igt_require_intel(data.drm_fd);
> +

There was some recent discussion regarding intel specific tests in tests 
folder [1].

But this change is just following a pre-existing pattern so this should 
not be a blocker but may be this warrants a broader discussion.

==
Chaitanya

[1] 
https://lore.kernel.org/igt-dev/210afacb-8486-43a5-865c-f52befda3231@intel.com/

> +		igt_describe("Test to validate CMRR in fixed mode.");
> +		igt_subtest_with_dynamic("cmrr-fixed-mode") {
> +			run_vrr_test(&data, test_cmrr, TEST_CMRR_FIXED_MODE);
> +		}
> +
> +		igt_describe("Test to validate CMRR in video mode.");
> +		igt_subtest_with_dynamic("cmrr-video-mode") {
> +			run_vrr_test(&data, test_cmrr, TEST_CMRR_VIDEO_MODE);
> +		}
> +	}
>   	igt_fixture() {
>   		close(data.debugfs_fd);
>   		igt_display_fini(&data.display);

