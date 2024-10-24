Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316F6D0BB64
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 06:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD15A10E8B6;
	Thu, 24 Oct 2024 06:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftM2EXI4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFC310E8B6
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 06:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729751795; x=1761287795;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Sx1KvALfwIr2y1mtCrM9dowNjPFMoDPxsAnPeuR2fHo=;
 b=ftM2EXI43DR5/Fv0zWGWiwKtIE5CZa4LIcurpzStW+QPX5qJGNMJNWKe
 ZhWLrda6yiQ67FrF9zC8LUNK3Ejq8H7Aan4otFBVPYBqIvEomA7QSdhQF
 DlIbWonG+/Wo1wEK7VvGjHCGpz9KhWAfuw6590JP+PHuDGhqRdIYG1YHl
 aM9TkX0+bcblJnPG4om83j/xHTCEMJmgSzz9SotUQCnrJ0BFgjjVXMlJt
 9r70zKptTS8qYAbmprlaiV0GCbXmVAxK9aJ6CMiKtzdS9CQY4G0ST6ODn
 jq1j+p0pUhh96DuKptTtC2cqdtPyg9FosTjjSb6aSTLAIVRD4Wb8WCJsB g==;
X-CSE-ConnectionGUID: +iuie+z8THSrIgplUgA6zw==
X-CSE-MsgGUID: RHQ41vUGTbCo8DZyudF6Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51907417"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51907417"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 23:36:35 -0700
X-CSE-ConnectionGUID: L31rGi1kSnS5pQjDesonhA==
X-CSE-MsgGUID: PuG8st5SQvqUsnvvQBgRFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80501667"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 23:36:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 23:36:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 23:36:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 23:36:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a69ibmXAWHb07JJCDikDdfeFfRZOMuWbuvzxgrPOxTIhAbglhoXC2hQ1PIwXzMYE4BQ7hGlqQH4caxBaclFjtn8DRuI064ltUUZjuaOyDamdAPN2X8bJwP3B3sDYWxVzAMvwAr5d/eEFsSyHQ/wjyTXnd+A9IQFNtg2Ntm4ZwuoeFNxXG2JbU2R4mRrvIA1Ett/JU+Oj/SnnWslawA6JhToF2DejbkcNyqriWBHpLX6CPB8uVrWo1JXl1XGB/z/ch7gutU9MhxCfz+EfzS/NQ/cV10/Lmt680LqO4weiEZW519914C3C+JysWCdGLJHc4+XfXW2vJtd5n+NM/6Fd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24xj847QM9gw+u1SPYP57XTvHSIdjXoN8SLEIcE93iM=;
 b=Aw1kKWCMfY/K3xi2rgh0ugHad4Od5DMBBeWPgot9jM+5jWfpjVlyrzKF2MIp8ZLof2SS7hMLFz42pWTI6Ka+gtERrR3PTXNKea+6hr+uEy1dGkc+JesTszYFlJN4gxzJr79AJX4sg41T+RBjd5D9Nz1PCN4azt8pdDIhgF8+u1KVAtpQbBHSCCq5Bh2ZLoOQOUKVwPmzu9yxf2XFVrhhvQeuQNWo5WqMb145lfByVeNebDWXo+3e0UTBNQ0IILCZOZSg/VbqmF6NTfOiBmYmY54Mg+gRwf9Ospe6SVUfYUEUD3LWsaSQm5u2Rby29tke84O/iUUxdgkZD6tGLGi7HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4811.namprd11.prod.outlook.com (2603:10b6:806:11d::17)
 by CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Thu, 24 Oct
 2024 06:36:27 +0000
Received: from SA2PR11MB4811.namprd11.prod.outlook.com
 ([fe80::e790:74e2:d7b6:9fe4]) by SA2PR11MB4811.namprd11.prod.outlook.com
 ([fe80::e790:74e2:d7b6:9fe4%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 06:36:27 +0000
Message-ID: <38ae6773-8717-4250-8883-c3f99ff3ecc3@intel.com>
Date: Thu, 24 Oct 2024 12:06:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/3] tests/intel/kms_pm_backlight: Refactor and
 use functions from lib
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <bhanuprakash.modem@intel.com>, <suraj.kandpal@intel.com>,
 <pranay.samala@intel.com>
References: <20241024045212.1697869-1-santhosh.reddy.guddati@intel.com>
 <20241024045212.1697869-3-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20241024045212.1697869-3-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::16) To SA2PR11MB4811.namprd11.prod.outlook.com
 (2603:10b6:806:11d::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4811:EE_|CY8PR11MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6fd024-cf0d-4cdb-2ab4-08dcf3f62fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkxrL3llQlpqTXlHWGN4R3R2Tm4xUVBQRE5VNDlEcjFGZEkvaDllb2Z4bHdm?=
 =?utf-8?B?bG5TZFVoNGp6L1R6UVVnY3JVZTE2TnRKVVViKzRvMjNMcXpQeTl5R2h1c0FP?=
 =?utf-8?B?TlhwZ1pHTDdCS2s1U3EvdVNiNm1JT0dvM2ZtQWhRekdHakpHZGpFS0Z3VjA2?=
 =?utf-8?B?UjdIbSttbDA3YXE3NnVSYmFhOFJjYklnT3V6RGUvV1RxUjJ1MDFvRVlXZDlM?=
 =?utf-8?B?NUE3Wjg2bElHSVdoeEhzQ21SdUxLNGgxczJNbjRxQW4wcVBCVjVBRnZoZmZY?=
 =?utf-8?B?cHVNZGhYNmoxb1k4K1lQcENlaElyYzUxNnAraVhIQ0phdWt6QXc3VHRLL1VM?=
 =?utf-8?B?VCtOTmg2ZklTMUNJNTJzL01yWDlmUm5odnR2emlYMnlId21wRjRVWEhJNU82?=
 =?utf-8?B?NnZsNUlDQXBJdWJiN2FIWVJSMjRIa3dzcU5iRmk3V2JpQm1SRVBVdWV4TkNH?=
 =?utf-8?B?Y1I4V1dyY0s2bVlLbzFDcUcwRU0xaUd4K01oNTNpRDB2TVN5M3FYZzBwOWdM?=
 =?utf-8?B?dDNXSWpQM3JGRVhJNjVBNkI2b2YvWG5CdExHLytXMnNEMU9XblJibG5WS2xt?=
 =?utf-8?B?ckJtNGswa1RGYXFOQmdOdEk0VFVGMmhlbHRQaEY4UDl3WTRQbHVweGJxUVor?=
 =?utf-8?B?ZTQxWE0wbVkvcCtnZGxXVW5aQkNIcHo5R0RuVWJTUitmNDZzL0o5Y3NaQ2xh?=
 =?utf-8?B?OHE0TU01TENoak95eWZRRnV1RHRDdjlTUUlVYmxQNy90SEtISTZnNmdlOXFZ?=
 =?utf-8?B?KzZodmROMEpURVR3eVlKQ3FkQjZ5VXFKeDZzZTB4cmNEbGo3V0pOMDVxUC9J?=
 =?utf-8?B?bzA3OVN6WWNUaTFFWTRQSkZtK1UwenYyVkZHSU5nY3ZDQ3dPcWdtVUVNZ3pM?=
 =?utf-8?B?U0N5QTdCL0Z3UG8rZ2ltQ1NhVjgvdkhtRjhQYkhhRVR4YUp3cW5xQTNGOFNG?=
 =?utf-8?B?c05hU042bFJ6YWpVcUhoZHVhQUYyb1J4TkZxYVpVdld1b3BKeXZ2dFRTa2t4?=
 =?utf-8?B?WUsybzhXeEYxS3NVNklEbVllT0NsTVY5cjVQd0FKbzRmQnA3RkxIUlF0Ymlk?=
 =?utf-8?B?VlorL1RmdlMrZU1KcDJaQWtWYkMzYTBQNjAzT1g2UCtxS2VhV0tJY20rQ2po?=
 =?utf-8?B?aksvYmVSY29VY0RyTnlmdjZndTc5V2VYVVVKblhEQkFvYVlZZDhGeC9RYVpL?=
 =?utf-8?B?QmxaMVhhYkFURzByYkhrTkxGTlVKNnUrd1RVZXNobGprQzhrMUJMajdTN0Zk?=
 =?utf-8?B?RUdFdkRaemJUUG9oQ2VPL1ZySHlQWlI1d09SUUVyaGVZZm9xR0cvTllKRTM3?=
 =?utf-8?B?bEpCZ0JWVjd3cjFDaHhFSExvaDAwUnZweEg4OXZCK2NpcENnR2xDb1RpZlRw?=
 =?utf-8?B?YkRmRW1hTGZsS2RZNEltZWZaK1U1UWY3dDJnVTBjVjlxVUUzcG8rNjJwbXFQ?=
 =?utf-8?B?WTNudFkxTUJKRXJleFNBQXB0VUluQ0RobmVKSDVhaEtsTWxxSkR2ZjVUQkpK?=
 =?utf-8?B?OWc3dElWUzd6bUxBa2ZaQVFUY2JYdVdZNE9aZm5kWnNSeFJIMEd2am9tbVNj?=
 =?utf-8?B?VnNRYjZzbFdTZFRSOHlTd0Nybk1zeUJsTDJqNjArZXlxdGllUE9oaUdjblli?=
 =?utf-8?B?RlN5UVY0dEYyelhUbHdoOHhVbUdDTUhxcXZ0Z3k3QjJPcFE3QWYybkZDWkRO?=
 =?utf-8?B?RFpIMmNqVTh2cVp6dHd3Q2dUVTZVWFpSVG83YmpzaURSUWE1bXJRYU5mYkNW?=
 =?utf-8?Q?O4Aub9PTuOAo+pvrHCYbDkrbKAYNuJGu1Z539T7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4811.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3ZzelFoUGpxSUV0YXJCL0g2T2N5MkVydjc0bmY0UVdJRVE4bk9STmZ4REZu?=
 =?utf-8?B?cUJjS09hSHdNaThkeFliOExqMWdpRVVOVUNheWExT1RabDk2aTVKS1Q4MGZM?=
 =?utf-8?B?OVZRT1VxdU5sNjhad0s1eTNSN3cvT1hnQzFEbFA2K2FybTZhVCtPYTYvejJG?=
 =?utf-8?B?Z3BNM3F4RTJEVy84U0xyeEl3UHZvdHFjMmY3OU1ZeFlKMjNrWkdGcFUwd3hU?=
 =?utf-8?B?blJSOUxXdFUwQkg0WkpvcFlqWSt2MGcvUFlzWkhOSjJrYzBxZGJIRndZdTBJ?=
 =?utf-8?B?NlZONUpibkRMV3VzMXA3TFNMcmVYRzRldDd5OWdHdW9yTWwxTXN0VXV0SmhB?=
 =?utf-8?B?SFhkaUlwUHg5RHlKSlQwdW9pV29lYkc2M0FFTENwNlo1ZkZ6ci9UbXFvcmYy?=
 =?utf-8?B?NjR6THBLdzg4SWRmbzc5K1ZzV1ZjTGVxcVI0M0J4bW5aZ1ozZjR2YU04Vnlm?=
 =?utf-8?B?cmJpRTFzNVhlQW9XVks4aWFCRTRGU1dudHV2SjN5dWxxNGFaOE8zeGpkNEo3?=
 =?utf-8?B?bk1yTzA5KzM5QXprd0l6V1RRZlhKTjZJZDZmQWttTExmMUtobmNNQnJHa1dN?=
 =?utf-8?B?WHI1WUw0UWFmVW1tSTdQdmVMMFF5NHdtSjJnWEZvaFF6Wm9HZ0tUQ3p2UGxV?=
 =?utf-8?B?S01sU3FSYmlDNUtKak1YS2ZNZm9LZ1RpYXhaMmpkanJib2xOWUR1YXJNYTBB?=
 =?utf-8?B?NE5YS29HQVhTRm1TcVVlWUlSOHVaeUNtNDh0U3VWK3lpc1R2SWN3ZUlmVFBS?=
 =?utf-8?B?TlZxMTkvZ2tjNlVaWXNiRDBPM1VwUTZJUVF0V1FiRGQ3VnB4SjMzZ1ZkaEVI?=
 =?utf-8?B?LzhoSXBaenB6RG5TQTg1WUlzay9nbS90WmdYTGIvUUxxbVBJRGJsTDhTL2pJ?=
 =?utf-8?B?dHRYZ2lHN0QwUGVZSEQvV05kOEZLVHFFVHdzaitFbVdKT2txZDJoUU9XeTFH?=
 =?utf-8?B?TnFqWlUyV2YyU3dGY0FKMzBJOUdNL0FzaSt1UUVMNU0vSklkNlg2YXBnUFBq?=
 =?utf-8?B?aytubG1PS1pGWmpDcExxanZhOWpkaUl0S2hoeGxGVmFRM2c1U05kb3BNazg3?=
 =?utf-8?B?R1NhZFVZSytMZ200UjVGUVpzd20wZGdVOGx6L08wdG1WZk84NnRtb3owN25M?=
 =?utf-8?B?ankzb2RwdVBtQWc2VUowN1NYSFltY1U1THNGbFh2TWxUR2g3S1pQNzUvZFZC?=
 =?utf-8?B?K29pRjFzMVpwNjJmZGFValFLV1BsZkNocWhwZE9mNkF0cnVsaHlSVTFCeFlX?=
 =?utf-8?B?RXZKQ01JQXJxaW9nd1Nqb01HU2JYbW4yUGZQOTM5RVhhOXcxTUdYNS9laXY0?=
 =?utf-8?B?RFlOY1Vtd3BiLzFNamNsbWxwTDlqR05zdDZKY1oya1UrckNEa1B4ak83ZWpT?=
 =?utf-8?B?NnZqaGI3ZWxnODh5OHRVa3c5bHltejR0dWhCZzdFWWtWVGh0SmdYdGpBeWt5?=
 =?utf-8?B?MkpLanBKM2VIQmpmL3BMN0sxTE9rM1VJZVVhNEFZTFRROCtzeHJmUzcvc1Bx?=
 =?utf-8?B?cTgrRzM0aU9jUHJ2QkFCY0Y2N3Q1dFcrK0htNFRFYjlCYmxlVllQQjBBSVZR?=
 =?utf-8?B?R09qWE1jaTE4aFp1Q0NpTjBIUnVac3M4alZobHVNZEZMc3hNWFV1RW14a1Jx?=
 =?utf-8?B?RjJnbmdndEMxZDY5YTdETHZrMFVOWlRTSVgyTXNLUHF0ejlPaCtiU3JDZG1l?=
 =?utf-8?B?SlpmdG8yaHptcVNwbDRtcWNwTXExbnY3MEt5V0Uybit4eVE5K0g2bUt4UGJq?=
 =?utf-8?B?NHp1UHhMM1craHdnMXdNVEJHTlVIYjFrc1kwdmxHNklCTGFBSUpUZGNFVDdL?=
 =?utf-8?B?MzB6TXppTjFOSlh1U2NFYTgvT3loWEljSFlpOEYyZXFzbStsdlY5dWNpcXJa?=
 =?utf-8?B?YmxqUmU4WXNlZHNzeGgzMkZRREw0Ykl2Vm5mM1hTeGJ2Q1FsU2w2anhxancx?=
 =?utf-8?B?OXpSUW1idnU3aUlKUXhsK05jUUgrR0JYeU1qVk53Y2JHbE1PT2xidUNRRU9Y?=
 =?utf-8?B?ajRRYmh5aGVuNlMzTzNzMWtoZktrZWZRak9pMnVCdk82dXBHZlBzU3NqUWlv?=
 =?utf-8?B?MlEzTGEyY21GRlR5eEpELzJLNS9EQmpFVktOVGZvelp5WVMyQjNDdkJyaWcw?=
 =?utf-8?B?TDF0encxMWMxLzgyMXhoanNtVUpZa1d2S2pTUkxselVzUlpNdEZZa1RaSWZB?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6fd024-cf0d-4cdb-2ab4-08dcf3f62fbe
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4811.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 06:36:27.1629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGJ+VMjdTYySTvuMGqf4E9/DQuCKB+J4TLFnN2+Gy/pbnjo4aQnQdoTe4qSUe5W1WDOtMWJGwFzSQ7DOsyurrhuTv7iC96aMcFzq8xOSkYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
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


On 10/24/2024 10:22 AM, Santhosh Reddy Guddati wrote:
> Refactor to use igt_backlight_read and igt_backlight_write
> update struct names to maintain consistency.
> move struct context to library.
> 	-->Start new line with capital.
>
> V2: update backlight_dir_path with BACKLIGHT_PATH.
> v3: rename intel_backlight_context_t to igt_backlight_context_t (Suraj)
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   tests/intel/kms_pm_backlight.c | 108 +++++++++------------------------
>   1 file changed, 28 insertions(+), 80 deletions(-)
>
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index 196b5af03..8b59725ac 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -72,13 +72,6 @@
>    * Functionality: backlight, dpms
>    */
>   
> -struct context {
> -	int max;
> -	int old;
> -	igt_output_t *output;
> -	char path[PATH_MAX];
> -};
> -
>   enum {
>   	TEST_NONE = 0,
>   	TEST_DPMS,
> @@ -96,65 +89,17 @@ enum {
>   
>   IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
>   
> -static int backlight_read(int *result, const char *fname, struct context *context)
> -{
> -	int fd;
> -	char full[PATH_MAX];
> -	char dst[64];
> -	int r, e;
> -
> -	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname)
> -			    < PATH_MAX);
> -	fd = open(full, O_RDONLY);
> -	if (fd == -1)
> -		return -errno;
> -
> -	r = read(fd, dst, sizeof(dst));
> -	e = errno;
> -	close(fd);
> -
> -	if (r < 0)
> -		return -e;
> -
> -	errno = 0;
> -	*result = strtol(dst, NULL, 10);
> -	return errno;
> -}
> -
> -static int backlight_write(int value, const char *fname, struct context *context)
> -{
> -	int fd;
> -	char full[PATH_MAX];
> -	char src[64];
> -	int len;
> -
> -	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname)
> -		   < PATH_MAX);
> -	fd = open(full, O_WRONLY);
> -	if (fd == -1)
> -		return -errno;
> -
> -	len = snprintf(src, sizeof(src), "%i", value);
> -	len = write(fd, src, len);
> -	close(fd);
> -
> -	if (len < 0)
> -		return len;
> -
> -	return 0;
> -}
> -
> -static void test_and_verify(struct context *context, int val)
> +static void test_and_verify(igt_backlight_context_t *context, int val)
>   {
>   	const int tolerance = val * TOLERANCE / 100;
>   	int result;
>   
> -	igt_assert_eq(backlight_write(val, "brightness", context), 0);
> -	igt_assert_eq(backlight_read(&result, "brightness", context), 0);
> +	igt_assert_eq(igt_backlight_write(val, "brightness", context), 0);
> +	igt_assert_eq(igt_backlight_read(&result, "brightness", context), 0);
>   	/* Check that the exact value sticks */
>   	igt_assert_eq(result, val);
>   
> -	igt_assert_eq(backlight_read(&result, "actual_brightness", context), 0);
> +	igt_assert_eq(igt_backlight_read(&result, "actual_brightness", context), 0);
>   	/* Some rounding may happen depending on hw */
>   	igt_assert_f(result >= max(0, val - tolerance) &&
>   		     result <= min(context->max, val + tolerance),
> @@ -162,31 +107,31 @@ static void test_and_verify(struct context *context, int val)
>   		     result, val, tolerance);
>   }
>   
> -static void test_brightness(struct context *context)
> +static void test_brightness(igt_backlight_context_t *context)
>   {
>   	test_and_verify(context, 0);
>   	test_and_verify(context, context->max);
>   	test_and_verify(context, context->max / 2);
>   }
>   
> -static void test_bad_brightness(struct context *context)
> +static void test_bad_brightness(igt_backlight_context_t *context)
>   {
>   	int val;
>   	/* First write some sane value */
> -	backlight_write(context->max / 2, "brightness", context);
> +	igt_backlight_write(context->max / 2, "brightness", context);
>   	/* Writing invalid values should fail and not change the value */
> -	igt_assert_lt(backlight_write(-1, "brightness", context), 0);
> -	backlight_read(&val, "brightness", context);
> +	igt_assert_lt(igt_backlight_write(-1, "brightness", context), 0);
> +	igt_backlight_read(&val, "brightness", context);
>   	igt_assert_eq(val, context->max / 2);
> -	igt_assert_lt(backlight_write(context->max + 1, "brightness", context), 0);
> -	backlight_read(&val, "brightness", context);
> +	igt_assert_lt(igt_backlight_write(context->max + 1, "brightness", context), 0);
> +	igt_backlight_read(&val, "brightness", context);
>   	igt_assert_eq(val, context->max / 2);
> -	igt_assert_lt(backlight_write(INT_MAX, "brightness", context), 0);
> -	backlight_read(&val, "brightness", context);
> +	igt_assert_lt(igt_backlight_write(INT_MAX, "brightness", context), 0);
> +	igt_backlight_read(&val, "brightness", context);
>   	igt_assert_eq(val, context->max / 2);
>   }
>   
> -static void test_fade(struct context *context)
> +static void test_fade(igt_backlight_context_t *context)
>   {
>   	int i;
>   	static const struct timespec ts = { .tv_sec = 0, .tv_nsec = FADESPEED*1000000 };
> @@ -218,19 +163,19 @@ check_dpms(igt_output_t *output)
>   	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
>   }
>   
> -static void check_dpms_cycle(struct context *context)
> +static void check_dpms_cycle(igt_backlight_context_t *context)
>   {
>   	int max, val_1, val_2;
>   
> -	backlight_read(&max, "max_brightness", context);
> +	igt_backlight_read(&max, "max_brightness", context);
>   	igt_assert(max);
>   
> -	backlight_write(max / 2, "brightness", context);
> -	backlight_read(&val_1, "actual_brightness", context);
> +	igt_backlight_write(max / 2, "brightness", context);
> +	igt_backlight_read(&val_1, "actual_brightness", context);
>   
>   	check_dpms(context->output);
>   
> -	backlight_read(&val_2, "actual_brightness", context);
> +	igt_backlight_read(&val_2, "actual_brightness", context);
>   	igt_assert_eq(val_1, val_2);
>   }
>   
> @@ -286,11 +231,11 @@ igt_main
>   	igt_output_t *output;
>   	char file_path_n[PATH_MAX] = "";
>   	bool dual_edp = false;
> -	struct context contexts[NUM_EDP_OUTPUTS];
> +	igt_backlight_context_t contexts[NUM_EDP_OUTPUTS];
>   	struct {
>   		const char *name;
>   		const char *desc;
> -		void (*test_t) (struct context *);
> +		void (*test_t)(igt_backlight_context_t *context);
>   		int flags;
>   	} tests[] = {
>   		{ "basic-brightness", "test the basic brightness.", test_brightness, TEST_NONE },
> @@ -339,14 +284,17 @@ igt_main
>   
>   			close(fd);
>   
> +			snprintf(contexts[i].backlight_dir_path, PATH_MAX, "%s", BACKLIGHT_PATH);
> +
>   			/* should be ../../cardX-$output */
>   			snprintf(file_path_n, PATH_MAX, "%s/%s/device", BACKLIGHT_PATH,
>   				 contexts[i].path);
>   			igt_assert_lt(16, readlink(file_path_n, full_name, sizeof(full_name) - 1));
>   			name = basename(full_name);
> -			igt_assert(backlight_read(&contexts[i].max,
> -						"max_brightness", &contexts[i]) > -1);
> -			igt_skip_on(backlight_read(&contexts[i].old, "brightness", &contexts[i]));
> +			igt_assert(igt_backlight_read(&contexts[i].max,
> +						      "max_brightness", &contexts[i]) > -1);
> +			igt_skip_on(igt_backlight_read(&contexts[i].old,
> +						       "brightness", &contexts[i]));
>   
>   			if (!strcmp(name + 6, output->name)) {
>   				contexts[i++].output = output;
> @@ -383,7 +331,7 @@ igt_main
>   	igt_fixture {
>   		/* Restore old brightness */
>   		for (i = 0; i < (dual_edp ? 2 : 1); i++)
> -			backlight_write(contexts[i].old, "brightness", &contexts[i]);
> +			igt_backlight_write(contexts[i].old, "brightness", &contexts[i]);
>   
>   		igt_display_fini(&display);
>   		igt_pm_restore_sata_link_power_management();
