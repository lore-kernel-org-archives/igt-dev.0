Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0DACD8CB2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 07:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9E810E77E;
	Wed, 10 Jun 2026 07:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Okah8mGU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9329810E778
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 07:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781076312; x=1812612312;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WLoIOy/vR5CV/fvi6hlN0DUV+1+spXnkj3u4hMS5KfQ=;
 b=Okah8mGUFZt2oW1EeyjUs2eh7db9eA3geZV14y57ver0nGqbjDGhVCVY
 Ml6K24L1cyp0khFAZZk3C+hqll/1SzLzoGdWDhLyqCft6bG4CkrDqiqis
 EEV2p+e/x+NTBenuJmBkCDXZHVoV6vOifNd1PrJthifX8uRCzwkftN46L
 CsrdGDBTjUaBwxYZBlX7xXB7nj0MKE3p1RBOAhwiaLG0rajTozCG1Giz4
 zDVHRQ/F7LdF1M/UMRnGPUdORJuex/YYqEvmH1jMTVU+4Toxldb/0rt/E
 Pq/vvn06EpclSwTnweUM8S44GE2dHUiyYUx7Bvnpky7qfDY31MsdT3HVT A==;
X-CSE-ConnectionGUID: lChUd1GySwCvnK7TtzzwAg==
X-CSE-MsgGUID: 2glF8a2FSI6OvMUNoISS4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="99279731"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="99279731"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 00:25:12 -0700
X-CSE-ConnectionGUID: 2I9tqmaaR0e0YckRmgA/hg==
X-CSE-MsgGUID: dtriYsB+Rn+cdBjDjO40+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251014007"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 00:25:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 00:25:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 00:25:11 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 00:25:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tL5awRdvuzbKmJlFgKe7BL/XnNlHe4UdmyKOV5Bz5n3kG4m5BTPGy1To+RJlmy+DSArfjueza8JuC2LOmv3vCGloTCNJSa04kO1KG5r4pazhu4NEiOabzMz9JRoHiZBcIMtHljFTCkRJsV8DlJH+legP0mua6brnzU5LzbL23WjVemAjSyBSueaLoQwZrtn/Px06zzlu3kY4MlkTUH83SQfRiMDVmgQme/sk9FS09qlPvHLttqVPFv2GVyzNI0gMTUmFFR8hFXJYC4MkQqGnVDiYzpWgNEEn4NtYx9YNvsv2Itw+66d8pg+im5bW5w1qETJFpcn1N94eIJTD1lFIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OirQL/qPzY+GJkiTrC6efW8GkuBO7Nk2bIm48tdoYS8=;
 b=sGBb2vZYZ3p5u/EOJRdcZnLVvaMSVSWbAHo9iaFZABLHQer7UObbgTukY69Q8LPudzY+KK8MDsTRNda7LMeyeBBqAZbhM2dtQHfetIefH0JsGEI1zKWEGYnI3v9fKP5adRRdnb+zbdgva1C5dOFTyChKTlzOzLEEFixMy68BbJi4MJm5CXRn6778/1Tim1pwWtDshiWDMrwJfum8/WkvECc8FlN47sXY3giKzZRByS6YjaCT+Dc6ov0KsVXQxTnDaRTnxRS2JzxlhuOKILVsFAyx+mlyYAJbKQMuOCv5mVP8io559BmpWf88iIMuCyvm1GkyXPkWgYu2iNd81Qu33A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DS7PR11MB7929.namprd11.prod.outlook.com (2603:10b6:8:e5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Wed, 10 Jun 2026 07:25:09 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 07:25:09 +0000
Message-ID: <88e4f134-8417-4d18-8a8b-986a08b809cb@intel.com>
Date: Wed, 10 Jun 2026 12:55:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] lib/tests: make igt_get_output_max_bpc()
 return status and handle failures in callers
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260609055659.1025146-1-pranay.samala@intel.com>
 <20260609055659.1025146-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260609055659.1025146-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0251.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::12) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DS7PR11MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: fabf9ae8-1254-458c-e513-08dec6c16706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|3023799007|5023799004|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: pUmSoNma6qX3m+42/E91r6pDkXvf9sybJtEedfag7ttXjZmP/FG8lU0KTd/BFTMtMCrBw/4LZiy653RmXmKaYSx8lCvSfAb+rZTs+8bOtUYBWHIf5k1HB8/3euNkj/Zyco4e7x5UzsrKKa4YXvVMs9eN5fcYDJrarxhQ8Yg1yGqE0hKXzbITdTLflRO3RcZGL/OVEnTQielQT3aFPt2kvtyGvJTtYMzySMOyj/YTaPriKDz5FzlQLr8NPRIgNcjJA072iER+ytXXcNV7glXG5PeHC7X9+i2sc2rydAZoCsJBC+HFA8bIRz/OZdmsFoFinFrznh9Sm2dndCBD3QjfGitVPcuhYZzzZ+Xsg7ohAa8IOw8essGs1m/bTQFYRZNeE4SIozWCBElk2U+U35/UWhNmPm/g4OS0W1/o7ZobhQeiN4sZm3jS75EZi3wV8jjw1llHg0NtDbgiDz1x5qZi3pQ9V85VKP//CI/MZMrBGzeSuRTGqbQYrx+Wc3ix4X41senRe6vSuiQvSjXaGe05A2hSQ73KEDdXkINuMomHEx58p89oDJmUwgRf3IK9m/uPQWWPEHgmpmU5IxZjtuCxEXD/QOU44GqgJF14xFLEMgldhJB4zcSeHRkUDQVSOXZGaSaERACaM29mKCj/+ukpZejUHig016gVxSpQEKc6Jj8mZuqbMq2ZJ12DWxXOlB+Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(3023799007)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTV3ZklkeVhOSHM2Q2txell1OENtc2UvbmNJaDlvRDIyY3NMa3RFWngrdkY5?=
 =?utf-8?B?d1JKMFZmeXhBcGtBWEVodFZSNmJIWVZ4Y3QwRi91U1VqOVNMNSs4dXJ0bzJv?=
 =?utf-8?B?NzdpUW15U2Q5TTVkcVlVaElaS0todUx4bjI0SlZTdzJRQkZxaCtwaGRaakl1?=
 =?utf-8?B?ZzRKWERrYVN6MVRQY1B4WkxWRlVtR2VkamJFTWM1d3dwNk51Nm5yZEFETzZt?=
 =?utf-8?B?cVBHS01Vd0FQYkxRaTUxM1lITitjMXVVSEZ4UDhhMXQ5MFJnbHZicWNLeVdK?=
 =?utf-8?B?MFlQMFZpSW8rMmhxaGtnVTFTWjVLZkRxcXRDS0FHTVFSL2VmeGFqVFRIdk0r?=
 =?utf-8?B?VFlBYlp3VTIzUmFQS3NHQlg1c2JYRVJjNExkdGZaTU9kZGJjUlVuRXRsbmlI?=
 =?utf-8?B?U3NPRVJpem1qYVAzdmdVZzlJcmh3RUpaekVjTXZ6bXBMMS9ZYUJMUUNHU0Yy?=
 =?utf-8?B?SXhTU2ZYSVhhSlZ3MWliNTU0WXlPYU5uakxabmgvZGRockdoWlNmK0hzdmF2?=
 =?utf-8?B?c0VqSy9aMEoyOTg2R2luejF6WlY0cThCQUoyUi9UTmVla21rZjdpM3FoRTc5?=
 =?utf-8?B?dWR3VDB1bDlQUU1oai9DWDRPa2x4cVNPcmpHS281QlN0TkJVZEhTMnMyYjJS?=
 =?utf-8?B?cVdQMC9ia29ZNEgzRElEbHRicnFPZ0lRWE1HS2JET2RMeUN6Ty9XMzlPZzNU?=
 =?utf-8?B?eFlUUlc3bUViU1hVendGeFJPSkF4VG5pb2hUU0k5Z1RXTzRkTVh3K1dZa0Qy?=
 =?utf-8?B?c0N2YXVUQ3h0ajNxdGVBdGxnU0E3ZjU3WlpxUEVVMGx3dXh0enlyMW13NmNT?=
 =?utf-8?B?M1RpMHg4TElqVkZsVkNKeVQ4QjZ0NFNUekdTQm80SWdzbUNaZXlHblpabkRI?=
 =?utf-8?B?WFJzYU9oZkNGQlBtczNKSU9uZkFHc2VPNVFKRC80TEM5Y2p1bHpTU1R1bXFD?=
 =?utf-8?B?c2xBbWpuTStTdkZyMXFvak5BeGU3M2dXbkVMcE9IUjQwTFhFdVZPcXBCV1BD?=
 =?utf-8?B?bkM2QzBHZkYwMG16UGkySEtSdW05YlhVekpraDI4RUExcGV6eGtlb2Jha0o1?=
 =?utf-8?B?RWZSMEZKaGFJUE03V0IxRjRIV21oNWhsVENxbjlNQ2VFNTJ4R2VlSytBejRu?=
 =?utf-8?B?dXFnUkI1ZFFhVnEzUCtGVFZIRWY4UGFpUVd1UzU5VzBxd2laRjljNDlUZk56?=
 =?utf-8?B?Yk56VnA5SXd4MXlLU2U1c1BTclo2VFJEdzl0SFNBOG1FSVUvK2M5Z3VGUkxx?=
 =?utf-8?B?NExiNEJ3K2xoK01hdmx5YVRJVHVVY1BWNXYxTURnZFl3c3lUME4yYWZKMlFJ?=
 =?utf-8?B?eWRacDZtcURQRHVWejJHVTRNTlU3LzBVTExvNHp0a1dGd01LK3N5M1U4aFpr?=
 =?utf-8?B?MlE3dWlycTJCajd5eWMrVHFMSDdqc3IzZkR4eHJEZGtsOWNmNzUyM1hwdVRt?=
 =?utf-8?B?cVdVbVdTUW9janRWR1N0S3VjUHpZRVVmcmdZUjZJMURrSEpvSndJNnFyTUtk?=
 =?utf-8?B?Q2ZLaWljcmVqcGxwTzJnZ3lyenFvTEw5bS9JUnl3MEdVaVZMQWlNM3U2L0tT?=
 =?utf-8?B?MW90dlcrSnZlQU9ub2NkVVhuRWF6WENsMnZRMTZaejRwbXVTUmlTT0REQnY2?=
 =?utf-8?B?MkJpRlhhcmk0cndoRHpPUm1HWUZFSzI1VmdEYU9OM3J3TGJma3gweUhHcWsr?=
 =?utf-8?B?UVdCZmJvbU1TZGxwWDNSMFRvMDhtQzl4ODhycm15cWxaSGZCVmRlSGtrVXFI?=
 =?utf-8?B?R0ZKdDVCN0ZNTFF1Sk1kY0NYaS9KK090WFJvNjVGK3R0ZEZoZnN3TDlZTkMy?=
 =?utf-8?B?dkJLR3NKYVRzbmRvb2RMRzlpZHVDZFFWS2haQUJSZFRjYjJFZDJZKzlWbWdO?=
 =?utf-8?B?WE0zOWhQSTM4NHFtbC9ySjRsSjNvdXNhZS9ZZlBmem8xNytFemZ0MmdOSGV1?=
 =?utf-8?B?aEN3KzF4am9kdnovTkkrWi9vYkJDcGo0Y2lKb3ZDK1NZWlVRQVcrVjlkYWRM?=
 =?utf-8?B?TlVtRHlyRWVOZi91cVhncXJQQ3R0OWIwZ1VNR2ZXeU9EQ1g1akQ1NDV4QmJv?=
 =?utf-8?B?ZDgvdldOMnorWTZHZEN2QVRuNzFwMlEvOHFJNmtkWlBsUVB4dGxJWjFYc2wz?=
 =?utf-8?B?eURrSS9QNGRYOGEzOXBVK3VwOW1pOEdzT2VZZkhaa3dsRy91cEQwc2hlMDRr?=
 =?utf-8?B?bG1VYXpPMjEwZWVmZVBlTEN6d1VVaGtjZjhIZVhuZFFzTVVhTlF4MDhLK3Rp?=
 =?utf-8?B?Rkc0YkpZK0VEWGdyMEJNWDhWQWNlczdaUHplTytLcEliTFZjakxha0dnNmxt?=
 =?utf-8?B?TVA4bGxxbGVsSkZ2ODlHQkxSQ1RtTW40NnF6cFh4SEVvV0hFVy9Zdz09?=
X-Exchange-RoutingPolicyChecked: n0qAUBqnj9dsjAZpJ8JxAUQWh0WlGsfuzT9mEtF3aVsq+9FVd5EFq7ixMElpCakj9BRbXlbIrPqfUkIfZjYeMqtQ23bDHZ+haMW8Fhd0HhAkBbRf1aCb/34vna6b2KEo6n7Y9gLX726PDr/8jdAPVBbdgTr5DsnHKCbt8qQlKv4choK65O34WN7aXABzu4CoS1uLrbYUa/j01zh2UNXc6gaCNFWjNaewsl/JTjmjdP+oSz2UyZsdq1SuFonqNtruraor4+VMux+gLWAc7jP2UEler24pmZ2c+In20bTRC2Akx28eKRVC4UIBfnWr+mYrTbpDAAZHJbS5VQP+dTAH1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: fabf9ae8-1254-458c-e513-08dec6c16706
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:25:09.4247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sKFURKdJ1YpgYjWgTtSn8rGQkRviNrUrqnqczQtbL4cKCSYNR/ToTHo2ss6cKa+rhamBF4P1+utEJgppPtfUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7929
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

Hi Pranay

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 09-06-2026 11:26 am, Pranay Samala wrote:
> Change igt_get_output_max_bpc() to return bool and fill an output parameter
> instead of asserting/requiring internally. This lets callers handle debugfs
> read/parse failures gracefully instead of failing inside the helper.
>
> Update test call sites to use the new boolean-return API so each test can
> decide how to handle max-bpc read failures. This separates read/parsing
> failures from capability checks and makes skip/continue decisions explicit
> with clearer logging, while preserving normal capability validation when
> max bpc is read successfully.
>
> v2:
> - Combine lib & test changes into single patch (Karthik)
>
> v3:
> - Add description for the helper (Swati)
>
> v4:
> - Rebase (Jason)
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   lib/igt_kms.c                          | 41 ++++++++++++++++++--------
>   lib/igt_kms.h                          |  2 +-
>   tests/amdgpu/amd_bypass.c              |  6 +++-
>   tests/amdgpu/amd_dp_dsc.c              | 10 ++++++-
>   tests/intel/kms_dsc.c                  |  5 +++-
>   tests/intel/kms_frontbuffer_tracking.c | 10 ++++++-
>   tests/kms_color_helper.c               |  5 +++-
>   tests/kms_dither.c                     |  9 +++++-
>   tests/kms_hdr.c                        | 16 ++++++++--
>   9 files changed, 83 insertions(+), 21 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 49bdbb358..244c24610 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6769,32 +6769,46 @@ bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name)
>   
>   /**
>    * igt_get_output_max_bpc:
> - * @drmfd: A drm file descriptor
> - * @connector_name: Name of the libdrm connector we're going to use
> + * @output: Output to query.
> + * @maximum: Pointer to store the maximum supported bpc value.
> + *
> + * Read and parse the connector's debugfs output_bpc entry to obtain the
> + * maximum supported bits-per-component value.
>    *
> - * Returns: The maximum bpc from the connector debugfs.
> + * Returns: true on success, false on failure.
>    */
> -unsigned int igt_get_output_max_bpc(igt_output_t *output)
> +bool igt_get_output_max_bpc(igt_output_t *output, unsigned int *maximum)
>   {
>   	igt_display_t *display = output->display;
>   	int drmfd = display->drm_fd;
>   	char buf[24];
>   	char *start_loc;
>   	int fd, res;
> -	unsigned int maximum;
> +
> +	if (!maximum)
> +		return false;
> +
> +	*maximum = 0;
>   
>   	fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
> -	igt_assert(fd >= 0);
> +	if (fd < 0)
> +		return false;
>   
>   	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
> -	igt_require(res > 0);
> -
>   	close(fd);
> +	if (res <= 0)
> +		return false;
>   
> -	igt_assert(start_loc = strstr(buf, "Maximum: "));
> -	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &maximum), 1);
> +	buf[res < sizeof(buf) ? res : sizeof(buf) - 1] = '\0';
> +
> +	start_loc = strstr(buf, "Maximum: ");
> +	if (!start_loc)
> +		return false;
>   
> -	return maximum;
> +	if (sscanf(start_loc, "Maximum: %u", maximum) != 1)
> +		return false;
> +
> +	return true;
>   }
>   
>   /**
> @@ -6838,9 +6852,12 @@ unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc)
>   static unsigned int get_current_bpc(igt_crtc_t *crtc, igt_output_t *output,
>   				    unsigned int bpc)
>   {
> -	unsigned int maximum = igt_get_output_max_bpc(output);
> +	unsigned int maximum;
>   	unsigned int current = igt_get_crtc_current_bpc(crtc);
>   
> +	igt_require_f(igt_get_output_max_bpc(output, &maximum),
> +		      "Failed to read max bpc for %s\n", igt_output_name(output));
> +
>   	igt_require_f(maximum >= bpc,
>   		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
>   		      maximum);
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index e89f1f3b6..4b90577fc 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1322,7 +1322,7 @@ bool igt_fit_modes_in_bw(igt_display_t *display);
>   bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
>   bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
>   bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name);
> -unsigned int igt_get_output_max_bpc(igt_output_t *output);
> +bool igt_get_output_max_bpc(igt_output_t *output, unsigned int *maximum);
>   unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc);
>   void igt_assert_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
>   				 unsigned int bpc);
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index 3c537ea9e..e59691f16 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -323,6 +323,7 @@ static void bypass_8bpc_test(data_t *data)
>   	igt_display_t *display = &data->display;
>   	igt_fb_t fb;
>   	enum pattern ptn;
> +	unsigned int maximum;
>   
>   	test_init(data);
>   
> @@ -345,7 +346,10 @@ static void bypass_8bpc_test(data_t *data)
>   	 * Rx supports only up to 6bpc, Rx-crc will different from crtc-crc
>   	 * with 8bpc.
>   	 */
> -	igt_skip_on_f(igt_get_output_max_bpc(data->output) <= 6,
> +	igt_skip_on_f(!igt_get_output_max_bpc(data->output, &maximum),
> +		      "Failed to read max bpc for %s\n", igt_output_name(data->output));
> +
> +	igt_skip_on_f(maximum <= 6,
>   		      "check /sys/kernel/debug/dri/0/eDP-1 (connector)/output_bpc\n");
>   
>   	igt_create_fb(data->drm_fd, data->width, data->height,
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index 1742c7df4..dc71e903e 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -480,11 +480,19 @@ static void test_dsc_bpc(data_t *data)
>   
>   	/* Find max supported bpc */
>   	for_each_crtc(&data->display, crtc) {
> +		unsigned int maximum;
> +
>   		output = data->output[crtc->crtc_index];
>   		if (!output || !igt_output_is_connected(output))
>   			continue;
>   		igt_info("Checking bpc support of conn %s\n", output->name);
> -		max_supported_bpc[crtc->crtc_index] = igt_get_output_max_bpc(output);
> +		if (!igt_get_output_max_bpc(output, &maximum)) {
> +			igt_info("Failed to read max bpc for conn %s\n", output->name);
> +			max_supported_bpc[crtc->crtc_index] = 0;
> +			continue;
> +		}
> +
> +		max_supported_bpc[crtc->crtc_index] = maximum;
>   	}
>   
>   	/* Setup all outputs */
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 3687e795d..056fd37ae 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -422,8 +422,11 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		igt_require(is_dsc_supported_by_source(data.drm_fd));
>   
>   		for_each_connected_output(&data.display, output) {
> +			unsigned int maximum;
> +
>   			if (is_dsc_supported_by_sink(data.drm_fd, output) &&
> -			    igt_get_output_max_bpc(output) >= MIN_DSC_BPC)
> +			    igt_get_output_max_bpc(output, &maximum) &&
> +			    maximum >= MIN_DSC_BPC)
>   				data.valid_output[data.count++] = output;
>   		}
>   	}
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 37706cab5..3adf14bd7 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2281,6 +2281,8 @@ static void setup_drrs(void)
>   
>   static void setup_hdr(void)
>   {
> +	unsigned int maximum;
> +
>   	if (!igt_output_has_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
>   	    !igt_output_get_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
>   	    !igt_output_supports_hdr(prim_mode_params.output)) {
> @@ -2294,7 +2296,13 @@ static void setup_hdr(void)
>   		return;
>   	}
>   
> -	if (igt_get_output_max_bpc(prim_mode_params.output) < 10) {
> +	if (!igt_get_output_max_bpc(prim_mode_params.output, &maximum)) {
> +		igt_info("Can't test HDR: Failed to read max bpc for %s.\n",
> +			 igt_output_name(prim_mode_params.output));
> +		return;
> +	}
> +
> +	if (maximum < 10) {
>   		igt_info("Can't test HDR: %s doesn't support 10 bpc.\n", igt_output_name(prim_mode_params.output));
>   		return;
>   	}
> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
> index 24663444a..a50ac3a37 100644
> --- a/tests/kms_color_helper.c
> +++ b/tests/kms_color_helper.c
> @@ -40,7 +40,10 @@ bool crtc_output_combo_valid(data_t *data, igt_crtc_t *crtc)
>   bool
>   panel_supports_deep_color(igt_output_t *output)
>   {
> -	unsigned int maximum = igt_get_output_max_bpc(output);
> +	unsigned int maximum;
> +
> +	if (!igt_get_output_max_bpc(output, &maximum))
> +		return false;
>   
>   	igt_info("Max supported bit depth: %d\n", maximum);
>   
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
> index ca367db61..236e5c7c0 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -206,6 +206,7 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>   
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
> +		unsigned int maximum;
>   
>   		if (!is_supported(output)) {
>   			igt_info("Output %s: Doesn't support \"max bpc\" property.\n",
> @@ -213,7 +214,13 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>   			continue;
>   		}
>   
> -		if (igt_get_output_max_bpc(output) < output_bpc) {
> +		if (!igt_get_output_max_bpc(output, &maximum)) {
> +			igt_info("Output %s: Failed to read max bpc.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (maximum < output_bpc) {
>   			igt_info("Output %s: Doesn't support %d-bpc.\n",
>   				 igt_output_name(output), output_bpc);
>   			continue;
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 7127a56b3..ebf468e0d 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -254,6 +254,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
> +		unsigned int maximum;
>   
>   		if (!has_max_bpc(output)) {
>   			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> @@ -261,7 +262,12 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   			continue;
>   		}
>   
> -		if (igt_get_output_max_bpc(output) < 10) {
> +		if (!igt_get_output_max_bpc(output, &maximum)) {
> +			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (maximum < 10) {
>   			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
>   			continue;
>   		}
> @@ -535,6 +541,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>   
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
> +		unsigned int maximum;
>   
>   		/* To test HDR, 10 bpc is required, so we need to
>   		 * set MAX_BPC property to 10bpc prior to setting
> @@ -559,7 +566,12 @@ static void test_hdr(data_t *data, uint32_t flags)
>   			continue;
>   		}
>   
> -		if (igt_get_output_max_bpc(output) < 10) {
> +		if (!igt_get_output_max_bpc(output, &maximum)) {
> +			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (maximum < 10) {
>   			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
>   			continue;
>   		}
