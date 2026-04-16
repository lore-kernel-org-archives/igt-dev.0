Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F96F8D775
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 19:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA3410E218;
	Thu, 16 Apr 2026 19:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ft6ESYCK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B67810E218
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 19:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776368526; x=1807904526;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p5Pgr0QZqxokcRNJ91I+abC9PxuR35CFPJQswKk8DV0=;
 b=Ft6ESYCK71PhXscbnscUekFGRwtIX6lh0L05exeH3aBIZ5W3SS2D0CD+
 S48wm/h/khozdXEo0wBsru+3iWJduB0hpvpxU/rCQMSKlDzNgdCE5JPAM
 ArHLfcqtahxnb8H9Y374mJMivMLkJqbdcW1f7B2o+rJhWGsypZcJmL/pA
 m7AB9k5APLk+8qFWkbX3NtxXbGMF30SK11d1J1Hk40Hjd9nJwM2s60pLg
 lz/LmskEPaY+RgBGA1f3cGOD/fbyVHgAIEUn9lURxfpslKy1lyiwzjTZx
 VtaXYmVWs090HJB9wbRgeZIRUFzMPGTZyMJ4LXh1Y6/ojYJD9eopZs9Hk Q==;
X-CSE-ConnectionGUID: a/mDFTokS/2fm1riaIIEjg==
X-CSE-MsgGUID: hpLQvR3/QIK/WxgXFbbOEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88833071"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88833071"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:42:05 -0700
X-CSE-ConnectionGUID: x7SbHfP7R1G78MUfxALepA==
X-CSE-MsgGUID: Py981eVtQqyMlVc9ihq+Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="232574364"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:42:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:42:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 12:42:03 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:42:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpwvLBJoy+EYpm3HvitRw4BBIcM5C8zvAodQSZYINzz6AyfNcC6V6bvSZPK4JSpAqh7usIk/mXH+DO5iqcMQM9ysC0ju2e7QAIJHYUvOirq38Icejj6hNte8nDkKJpkizCq/l7PNxht2sb4PTl16t4IFFmcZpFHQAFp6kTLQDDnv9CyQtUpnkNxT04kk3uv3L11yIJ3QA8pkd7W/xCl4LbG8tWwgnYl5WJG5h16YWmDF2rM+Mu0qvf2TED+p+h27crdPWNXRLlfD8KK3V7xc1HxOLYIGPJZjcGmjid37PYluoTKkpRgSNr4URNc81PtN6lt3yxYFVGtD//qFL72/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvOVj3mUpAsKHYjZXK0W4FNSDbtzypRhzDcf0eeIVQo=;
 b=oZxTQPpYHDuiptz4lARFAeHV/3BvqH7Pf6hjScIt2SYvaZlGtVSY9I42WRu+wCEk5VA3rzb8scmPw122rHFNHA6jUYCTTSlAq8fn+HJmeMD8iL241pooFft1WY3ZMQjRVQmDS2YV+1qcrMaKT/dehlQB0psFdxn6d5EuoHQ2Y5u8LUMNpi5EyxDnklRU7YD6kGNbzoUpCqBx2w7qGMp7wEQDF1Vc04OuCEZjNvK3kTZ0nnBLgs7ZnzJ0YGjXFEzi4TdO1JyzUeYKlydMclHSVtMho2l5j1vMMvGRw+VgFCgixU/ZJ8tcZRu5VaCWyVe8123su6XRjEffHFA1kfxl1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DS7PR11MB9475.namprd11.prod.outlook.com (2603:10b6:8:26b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 19:41:56 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 19:41:55 +0000
Message-ID: <c5da8798-40a1-400a-8c7d-4b4457c8e58b@intel.com>
Date: Fri, 17 Apr 2026 01:11:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_dc: Remove deep-pkgc subtest
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260416113151.14778-1-mohammed.thasleem@intel.com>
Content-Language: en-US
CC: Kamil Konieczny <kamil.konieczny@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260416113151.14778-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::20) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DS7PR11MB9475:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e856cdc-660a-4e08-f9a9-08de9bf03703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 73RZ+X8h4oJ51IkaF0inTC9NcI2acQ1ukXkcwQPW/qf3HizHR9PZRkhFzxF1+CGsqSNL8qe/ZZ58IJ/g4RIkZzgGRu1/WBn72EerIo/fMcn+BUq1tdPCEl14hWnXhV2Q2t5pWzwiN/tG8YmM/WJwa4M5DZdIDix+1YkMLK7Esk6gZ7SVmh/wcOW05pWuwLGGslwjsweCvZ7VseV2a3l6CR11aqYPo4XijL/xZxq/rKcXeukClNLf9eR9zwpWqdTVLwaUO1lhAIWm8BaysyGOImFq75EH3BP/nfi8WUe49MCOKMlgq5Zxyfa6SHeAC7xGX+qzcgsCCQD+TwxHkt2/pLmvYwkq/yDPG1UYLzeprkCYAp4b2FOk3npCxj4qMLWEa1vXxVEWcSPm1elk34UqJUXc0ZX1eA+/RRPzx0YJK8jj3cNUJ0selXgW937uJr+0tWfyjsCE+hFz3r/MM3GeWQSPVNAIXulJCHKSETU/5uufwW+eTfGH45D1w2lHNLLHTOR9XoL80FhrkYrMvqBkZkkBPcLOnBjV4MjpQ6V6P3fYIRZda9eaQym2YoDPcF4K5J4abQgMfms/KFvgNHT4yaHsCcUYbzvwzHjfFsbEL98xEy7FUgAvPwy9wS8ai4lLmwmkAqu0DVovjmisvJP3ZK4GIho9jjL38u6kwqViRwEh+tU3Gn66U5xBKnf6qmwr6DraNaOWDVFx3WjtkYB2yA76XQXRDBIrGzKZrHQREfE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzljdnpQOFhseHZPT3RWSWx3MlJTQzE0eVZRbDVxYjl0dlVldkhkVTNTMnJ1?=
 =?utf-8?B?QVZLOVVDbXVyZ3ZhNTJlUjlBMlAzcElOUnJCTDFZQkJzU25pbDh3dGhzMHlZ?=
 =?utf-8?B?K0RoK0FVNVVnZUxtSTRoNDNVUG1lTkNsNnhEQ3dDV1VTVFRqZ3BmM0gvVVBr?=
 =?utf-8?B?dithOHJlVWUrZ0VXOUZEN0p2U1lneCttd2l3UVIzKzBSNFZaVjRXa0tiVVpL?=
 =?utf-8?B?ZWhhMGlQSm5qYXVpWit4OHVpVzM1ZHNMRjNObkFjN0h2S1NFZC93TWJCb0s1?=
 =?utf-8?B?UVJJbXEyL25qNFpZY1BwWERicy9kMkVoL1RENkthN0JsS2RZbmZyYVJFRWtU?=
 =?utf-8?B?OUxvWFFLbW5GYTVpNld5V3NOYnJEazFhaDdMY2dDM2hNRi9MK1FhL09lOTlF?=
 =?utf-8?B?WXZrRHhWNmFpa3FUWG5zUFFySnc3S01WRENUa1ZiSXBjNmtvajVZM2xXZzk5?=
 =?utf-8?B?UUtnYkhOTEk0WSs1a0JLbW9WT0tnTXJqb0tqS3FHdlJSN1RnMGM2WkE3VzNN?=
 =?utf-8?B?ZW9nY25pZGZOQ3V0S0JuVDdHK0dMeit6VzBleHEzR0trU245TEt2MERiVStu?=
 =?utf-8?B?QXQxb3RHNUZMMWhtdFZ3VWZDdlQyRWc5UFh0Tm1STG0zbU1QR0RPOVdoS0FF?=
 =?utf-8?B?U3dUMStjbGxLU3VHT3NqRytwVjEzQ2h1MUc3VWtVYkZXc2NoUWFDL0d6ZUNF?=
 =?utf-8?B?S3g1SWpLc2xDN1hXN1hqcThBZVlPZzR6RkRoTUhCeGRZYnRIaVNjTVd4ek0v?=
 =?utf-8?B?Y3FPRW1SMFRPUzhIMkNaMHl3U3FKK3JsY25rYWdzRDhDd3hhaytXQ1JPVXNJ?=
 =?utf-8?B?TjI0ZzNUQTE2YTFZVFpJVkxkNFBIelU0cUc5My96MmdIRUlINzZHVE1tVGtD?=
 =?utf-8?B?MlB0Qk5BRlEyblZmWk9TbldpZWZXMzF3WFZ2ejR6cW0vaUNKYllYZnUvRnZ1?=
 =?utf-8?B?NS9mYThLbjM0czM5Wkpnb2hjL3pUZU0zSmZhQXJheFhxcVRHNXhoSk1IZUh0?=
 =?utf-8?B?TUhSbEVicUl4Z0dDa0E2NnpUZEUxZ0VpUEFDME1uV001c3BNcVRxUXhEUnpB?=
 =?utf-8?B?U2NMdDdOQ0YvS2dnZHpuenJOaEwzTkd1R0MyTXYydFNOS3IwUHRXcUovbmJp?=
 =?utf-8?B?N2JjSktuSFRlWkZXdlQ4S0dBU1M4QWpmd0tWaGdObXpqcUVqcEtLTW0rSEdX?=
 =?utf-8?B?WlhmZzZybmhUcWNYTGVyWkFDcmY4bjlGbFpSdXZJdkU5Z2ZoaUVFazMwcHNv?=
 =?utf-8?B?eGpMNGZyNDY5QWFpOGxnTy9HamNiTnFFL3ZDYjVDdzRTOGF2dWEram56OVJh?=
 =?utf-8?B?MHBqZnR5MlVPb2FzSXJTc0RkRCtwQ1pwTmE2elRRRjlKNGtVQ2ZkOXNLMlhk?=
 =?utf-8?B?QTNkMDlMbXdUb2V0c0w5MlJRK2RYMHZmdEpKMEFpWjRENVBlazYyWDU4YkRK?=
 =?utf-8?B?cG9DZUFLb3pnQkxRZ2hmdEgzT1RqdEpFV1hGVWhiQkI1NWVZQXp2RDhIU2Rv?=
 =?utf-8?B?NU45c3FvTGhhMjZXZXZZck1FTStDRnBjQzV3Uk9kY1NQclhhR21QRXJiTjZW?=
 =?utf-8?B?bytSUXY4aDczcE1JZjgzcXk1UmdnTlZYemxVSWUzSjMzdkM1U3Z4bVhXQ1ov?=
 =?utf-8?B?cU16L2xsRWNPU0NGcHJlK2VhZ1NQbjY1b2Y4ejBGejQyTWNBT2ZZOVJEM0lZ?=
 =?utf-8?B?ZGkvSXhhWDhkR1FWNGN0S0k1UGJheWtXTjA2K2xSdHllZGFJS0MrdmxmZUMr?=
 =?utf-8?B?WSs5dVJOaGIxQUsrZU9TZjJyOW9lNk1QbG5rN3dnb0pseFB4eXgzNEQvRjRn?=
 =?utf-8?B?d2N3VzlMOGhTRHA3ZGVIQ3FMKzdJd05sb3Q0MTJ5OWRHaDlUV21rTm9nMzg2?=
 =?utf-8?B?WjdXRUxKQUhTcllsSUFoUXFhcFhUZE9wRUdtSEhNRHVyQ0QrUlpnbFg2YUJF?=
 =?utf-8?B?cVBoREpiUnpNa3MwcFI3Q2Z3WVJHTXdiQTc0bXViL05MZVRyTDJvenlZL1Zr?=
 =?utf-8?B?VCs0WExZREExb3pwc3hKVER5Tm1Da0cyY0M5VGdPNUIxTkVFS3ZLZUhaOTVh?=
 =?utf-8?B?Z1dvNVhpVmRxSU4wYmZibjIvamxkWjh2SVBBeXNMQ2EzRXJXM2pRZmJ6QmFO?=
 =?utf-8?B?S3BnYmxhTTVyZ1czQ2Y0Umt4TlQvcHhhb3hFOXdJOW15WnNuNnJnZkJxMmJC?=
 =?utf-8?B?cWJLMVBwNWk4YkxzL3k1TGNnT1VuK1QzcHFWT2oyNVpoS2wvU0RNNHdWcmFB?=
 =?utf-8?B?aDNIODZJUG1VMnlaYWRPTzdDVlZSMC9CQ28rblpZWllhRzJEcFptUmJCeUdk?=
 =?utf-8?B?eFhTRDZVbkk1UnRVV21pT29lWjdVajcweUVCQzl0TWxiNUhSWFJydz09?=
X-Exchange-RoutingPolicyChecked: tkguGwHywIhyJiwjAYQEUG0AycFOVUBtIK57scTbC48P/uGZhd14hUW8qF2+oHXKjKSz0yAxwlB9ZMQ894iyNGCzZ/7tm52CczJ7UsmixMRalpGX3OyDcgY620vKzF2X2PygYOS0r05MkZBXfl2dwJwtz4XASfKlOCTg7y9AEUKi/VedqWOSm+d5zN66SMMH0zf2i6sigjgpfIKLV8ip2iCX8WubPPSAxbbEHR7AylaEMikVbRc9MvK0QNuqiJ48zYLEuAFa43ql8GAk1l8A9CVdpxcOieJh2NxlxWmYf4X1eo4BTHMnPVn+FsH2ICqhBdrPkAG0axXVJ+RydOsTvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e856cdc-660a-4e08-f9a9-08de9bf03703
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 19:41:55.5540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlFEMdnjVomOA5zqPDb1bcbPYzdYGKlZpQP7j/CNEuftU5ZzLHe1esNO+TApASaxqPWHC4/g/AQRJhiEjlGSqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9475
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

Hi Thasleem,

Please send the revert of

commit 4d9b4ee12b5f0852c02818ca9a886355b43fbbff
Author: Jeevan B <jeevan.b@intel.com>
Date:   Thu May 30 12:45:40 2024 +0530

     tests/intel/kms_pm_dc: Add a new test to validate the deep sleep 
state during extended vblank

++Kamil

On 16-04-2026 05:01 pm, Mohammed Thasleem wrote:
> Remove the deep-pkgc subtest as it depends on other display IPs which makes
> testing unreliable. Current validation uses Package C-state counters that
> are affected by unrelated system components and requires platform-specific
> checks that vary across different platforms.
> A redesigned test with proper display IP isolation will be implemented
> in a future patch.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 96 -----------------------------------------
>   1 file changed, 96 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 8138933d4..44394305d 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -72,9 +72,6 @@
>    * SUBTEST: dc9-dpms
>    * Description: This test validates display engine entry to DC9 state
>    *
> - * SUBTEST: deep-pkgc
> - * Description: This test validates display engine entry to PKGC10 state for extended vblank
> - *
>    * SUBTEST: dc5-retention-flops
>    * Description: This test validates display engine entry to DC5 state while PSR is active on Pipe B
>    */
> @@ -535,90 +532,6 @@ static int has_panels_without_dc_support(igt_display_t *display)
>   	return external_panel;
>   }
>   
> -static void test_deep_pkgc_state(data_t *data)
> -{
> -	unsigned int pre_val = 0, cur_val = 0;
> -	time_t start = time(NULL);
> -	time_t duration = (4 * SEC);
> -	time_t delay;
> -	igt_crtc_t *crtc;
> -	bool pkgc_flag = false;
> -	bool flip = true, edp_found = false;
> -
> -	igt_display_t *display = &data->display;
> -	igt_plane_t *primary;
> -	igt_output_t *output = NULL;
> -	drmModeModeInfo *mode;
> -
> -	for_each_crtc_with_valid_output(display, crtc, output) {
> -		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
> -
> -			edp_found = true;
> -			/* Check VRR capabilities before setting up */
> -			if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
> -			    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
> -				/*
> -				 * TODO: Add check for vmin = vmax = flipline if VRR enabled
> -				 * when KMD allows for such capability.
> -				 */
> -				igt_crtc_set_prop_value(crtc, IGT_CRTC_VRR_ENABLED, false);
> -				igt_assert(igt_display_try_commit_atomic(display,
> -									 DRM_MODE_ATOMIC_ALLOW_MODESET,
> -									 NULL) == 0);
> -			}
> -			break;
> -		}
> -	}
> -
> -	if (!edp_found) {
> -		igt_skip("No eDP output found, skipping the test.\n");
> -		return;
> -	}
> -
> -	igt_display_reset(display);
> -
> -	igt_output_set_crtc(output, crtc);
> -	for_each_connector_mode(output, mode) {
> -		data->mode = mode;
> -		delay = (MSEC / (data->mode->vrefresh));
> -		/*
> -		 * Should be 5ms vblank time required to program higher
> -		 * watermark levels
> -		 */
> -		if (delay >= (5 * MSEC))
> -			break;
> -	}
> -
> -	data->output = output;
> -	setup_videoplayback(data);
> -
> -	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_plane_set_fb(primary, &data->fb_rgb);
> -	igt_display_commit(&data->display);
> -	/* Wait for the vblank to sync the frame time */
> -	igt_wait_for_vblank_count(crtc, 1);
> -	pre_val = igt_read_pkgc_counter(data->debugfs_root_fd);
> -	/* Add a half-frame delay to ensure the flip occurs when the frame is active. */
> -	usleep(delay * 0.5);
> -
> -	while (time(NULL) - start < duration) {
> -		flip = !flip;
> -		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
> -		igt_display_commit(&data->display);
> -
> -		igt_wait((cur_val = igt_read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
> -			 (delay * 2), (5 * MSEC));
> -
> -		if (cur_val > pre_val) {
> -			pkgc_flag = true;
> -			break;
> -		}
> -	}
> -
> -	cleanup_dc3co_fbs(data);
> -	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
> -}
> -
>   static void kms_poll_state_restore(int sig)
>   {
>   	int sysfs_fd;
> @@ -685,15 +598,6 @@ int igt_main()
>   		test_dc_state_psr(&data, IGT_INTEL_CHECK_DC6);
>   	}
>   
> -	igt_describe("This test validates display engine entry to PKGC10 state "
> -		     "during extended vblank");
> -	igt_subtest("deep-pkgc") {
> -		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> -			      "PC8+ residencies not supported\n");
> -		igt_require(intel_display_ver(data.devid) >= 20);
> -		test_deep_pkgc_state(&data);
> -	}
> -
>   	igt_describe("This test validates display engine entry to DC5 state "
>   		     "while all connectors's DPMS property set to OFF");
>   	igt_subtest("dc5-dpms") {
