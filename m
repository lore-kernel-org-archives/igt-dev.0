Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92A8CD98E4
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 03:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B77910EBC1;
	Thu, 18 Jun 2026 03:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrbDWSqS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C6510EBAD
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 03:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781752410; x=1813288410;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mKI7TcfeexfiXfpq3MEDahbf16wGAkr/rumsq4yUZ/w=;
 b=KrbDWSqS1Ov3dGxHP61jUa3/IMjF7u75RwAB99PPVZ8pxyvFsUDNSS0x
 +t55PFikkgWw4oLysEyfR01EaQf4DvUIUKCqKT4U/pv4l6VxgBP/E7Gfg
 sa9lz1ci6jjmmiYLcPdz61rjtBTznPZBZzZBHBiLQSiztyoLXVi0rpSaH
 rNBZVbJWmi/GUmPFnBf8Ay8HMgPBX2JE+GMkATQLggGuCjFbq6pxILjMn
 VL0wG15Vje1g3GO9Cw6i5vBAZinDS7h6DeFcr8K3aPX7UlgrwTGrqAav5
 WKYtDTkrbwLOZYwtI18AwDOi3kLydmpLA5sQrT7f+7PBOzYHbbiZQjXz7 g==;
X-CSE-ConnectionGUID: RSPwywehQsil9I763BB6uw==
X-CSE-MsgGUID: YESSFlE9Qqy3O3p4AW9nmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="93177734"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="93177734"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 20:13:30 -0700
X-CSE-ConnectionGUID: jdZ54ZndQ0OYvFAiCIlSOQ==
X-CSE-MsgGUID: LLMS0XS6ROCawPMHPyUCQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="248308425"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 20:13:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 20:13:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 20:13:29 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 20:13:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaGjN0SiACnoP31aGyRRZZpZLFk1pQqQh7+dV/LrQCXU7SXNUUdmOFKYes+3XjbMdIsM0+lqXJrFQimO9i7CIa/9w7jQO906z8UGK1IUwQG/niEt4Q6Rrx4QTBI4yD//b45Y3AryY442klKMtA08BF4mimdIXZVlVU5j2x0LEkWTZIj1HYcuS68B0hCd0EP9uqNO0c2DMGQwPRbAgHKdfmlnJNKQnRJqRiDxC023LBSZDa/sqhpS/ZRbCoW5lBn0bn0GV8ceRVkZWKKAhdyoWvuLjusjFexDVrSQr2jXRMe3bP9Wcu1/ic3PUTVk4g0FHKSgL8uCApUDomHk3DJ+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8+65ThdeXckmsIIWb+IQWsq1LpIRabG39RKVpuYNCQ=;
 b=EoAXTcg848CqhfjAM4BShwhSFoK4o5Gd85e6mpFp7TqcbCDW8XQx0RENyN6RIVl77ngDPJfjqQLxLF6h/6jZCxY9VizA2fLS7EpCV+vLlTE3i83YZ+kUC25fqp5H4voe/EyrPkL0RKiGIMBjRWvu9IQqnXoqRyo/0/zXQL5Wpft5lhKy5vbXlkSkVoSKmoBukksqDh7jnqpi1HCoejBjoCS+MkwY7l1MlmCrIG7+4Q5GH9SqRB1hmTeJJbjgVNnj/gRBGBtj/PAQHNMrRLpa9xfyGO2wBQ7kUcpKzgM1cWoZgmaG33cir4FnL+g/uXkKhjRfXGwnMp9L0Na1Nx61sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS7PR11MB6101.namprd11.prod.outlook.com (2603:10b6:8:86::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 03:13:21 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 03:13:21 +0000
Message-ID: <b5d0d923-2aa0-413a-9608-eba923ad9466@intel.com>
Date: Thu, 18 Jun 2026 08:43:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 2/2] lib/tests: make igt_get_output_max_bpc()
 return status and handle failures in callers
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Pranay Samala
 <pranay.samala@intel.com>, Hersen Wu <hersenxs.wu@amd.com>, Alex Hung
 <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>,
 <swati2.sharma@intel.com>, <sameer.lattannavar@intel.com>
References: <20260611064213.1300403-1-pranay.samala@intel.com>
 <20260611064213.1300403-3-pranay.samala@intel.com>
 <20260617121444.5xopy5pkex6dfpj4@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260617121444.5xopy5pkex6dfpj4@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0164.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS7PR11MB6101:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1a5c4f-37b0-4fe2-317b-08decce78d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|42112799006|23010399003|3023799007|18002099003|22082099003|56012099006|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: cw/YDpcpom409vefzuVUMo5lTHKrHLy3uAiXAG75vzKdtPfCBl8YBz09Viks2PMnFJYPVGyeX/GROGUaxJo6xr9MLRVnzY4DKStUrOSX4RElCEdQYelS0QEf3We4ewyrGcYs94WJ6eqoTQEgYP7YVa4Vo4l93szvKvcsEgnz+vhI5GWzKyfBttcRrzcMWql8FjMDFz0z6E4GHqqTues1+8pZF8LvF1BFHYjxiO7XKYpe3XlpXCN4MNsU67S1rcS4tXbRiryfm6BfRyudrAOK3LVVLVUHGguHZLhv9I30b0BES4AOno6yHxeD8/msT6Cym90P3jscty9i6mQtoAFaEVbNme7AWq6ZZ/rOOkisuSw4LQYIXeRwalDGOiAcxlArP7M0BMXiooBZGTHC1wcS0pAv+TVsPTwpRNhT/gaXSlSexcq84b87hubkcVAVrFhKpchn3+f+IPdiRep/p+eHZGcNB/BKmb60JL5tSBY35FRMWMzOo/5/7myONp0XXIPUoqy4x8r3rMEa6P+t4y/D8jZLDJsEdvi+go5biIzoKG7084SJGru3jUpTj+uoAR6JbAXIqubNyf4qi0M5xb02s0wr3wpKwNfiqqcEjkke31rfBstCEiaMQsixAQopy/nsbMRHqGKNKAN0c5PPciMk8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(23010399003)(3023799007)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHdTNlVSb3QxNUFZTTloVGs0ekZoaWlCMXhLTXoyMFg3eks4SEJCWlBKMytz?=
 =?utf-8?B?amx2alVqenZzcDRhL3dBeFFnY1FmVlhZdG5BVHNyYUtOMEhmSlVpczZNTTll?=
 =?utf-8?B?WWs2Sk1GbVlZOUltZy9odFVsNE9CMXc4L2wwMlVMa0xzaWlaT21NaCsrdU9M?=
 =?utf-8?B?QzcyWENFUUdQM2hidFdoUDZkbGx6RDdqcnJibWZ3WDVEalJMcWtOMisvSFZV?=
 =?utf-8?B?OU5hWW8xaXVqV2ViRGVEWXRJeDBtdFRuSmpRSCtzZ09Gb0F0MUVyOFJ6MGtN?=
 =?utf-8?B?SDRmbGpnS3V2M0JNTmQ1WUJiSFpLYnhkNkN2WmZHZnF2YU81b0hxMEZ6a1Nh?=
 =?utf-8?B?V0hCeWIwVk5ldjJOdHJsbzM2VEFHdk9RZE9lTjIySm15TkxLSUlPM0djc3R2?=
 =?utf-8?B?aGF4b09GSG5Xc1AvY3NlbmZxOWdndDNZWStlcGtPaGpYS2VKSUxmVXRUS013?=
 =?utf-8?B?dmI1UFRxenpQSXIyclRic2dHbXRpbDgvYU1aNGxNYngwUUx3aTI5WmtxaDIv?=
 =?utf-8?B?SitnT0xpajVkL2UrbjBreGl2Q1M2cXFlR2pZWExxMXpPblpod2dIaWlOb2E0?=
 =?utf-8?B?a0U4bnM4ZXFHeDZFYXU2VkN4amwrenBCcWJOVklCS2RMcmVBSktBYm9aUzBB?=
 =?utf-8?B?Y1RHZkFvbUw5R3pPK0dIdW93L2xPbVgvaXQ5V280dkVQaUFjUnhBTHBEbytZ?=
 =?utf-8?B?TVhid1pJUFd2b3VtMVdFUzgxbWxuUVlzSldzVHBLaDNKdXloZERKMDExTXk5?=
 =?utf-8?B?dGJ0Rzh1OGdjbjZIQkptUjJsakY3ek9mMEFmVklGWTlQZjgwdHJzdXo2bFdI?=
 =?utf-8?B?bzNnc2NXVmQ3Vzh2bk1idG0rRjhLQ2FLbStlMHMzMmhhTG9RcFNuMTg5TEFo?=
 =?utf-8?B?dlVGTWF2b09XVENtOStWL3lHVFhsZlRkUFZhM0VZa0NIQkwveTFlTlA2c0Rz?=
 =?utf-8?B?WUpwMW9mdjJubXdaTTllamVLVHNNUUVkUU5qUm0wZ0QwSmwwazFHZnNQd3Vj?=
 =?utf-8?B?TEFNUWhlRkx2dldUSlVHb0JyUUx4RmprOUxBWEwzcmd4SWxOQndzV29JTisz?=
 =?utf-8?B?eHA3b2M5SW9Ob3c4ZTNISjFEL0ZGVVJUK1ZkWUtaRy9kVzQ1WHgxczhIWGNM?=
 =?utf-8?B?RHhRaHEwak1yQktXTEZja1R1cC9lMnhGU2tlVzQrUzBjc3J2Z1VtbXNlMmtu?=
 =?utf-8?B?VTlQNjROd3l5SXJGK0lRRWUrdDBxME1KT2V1ZHc5SkNzZkJUUURzV3g5T3ZL?=
 =?utf-8?B?OVZoaHdza1BNTXRNVWlZeGsveDlTSTZSSTZqek5xVlVlWnc2QTVkeFVscFhl?=
 =?utf-8?B?TGx4dUJyRkZoMzhTR2FJMTRPeFBUTEpEVzNGaythSjV2OVE5dEVTa1o4VFAr?=
 =?utf-8?B?NStYYS9oZXJwb0d5a1d1RCtoUWkwSVZobWE2YUx0T0NEcWZoL1ZoSTE3cjc5?=
 =?utf-8?B?ZjVKUHF2emlTSXQvL1RmVjNnTkFsMzBnNHAxMW5EcnhoaElkSFNBVUFhaC9h?=
 =?utf-8?B?WUo4Mm9aVTZGUjJjMVJhWm12cUZEUXM1dEJYZE12RlQvamdSanFlSHRBTTN4?=
 =?utf-8?B?L1FmN1pHNDFsN0VEb05NcjB2bGhqbmNnVXY5emt4VWNkNVhTK3lvV3MyYURT?=
 =?utf-8?B?aGE0ZGFCUkwyLzE4Q0R2bmdUQVQzQnIvTG9MRlNmT1U1MnpaQUVjc211TmlR?=
 =?utf-8?B?ZDcrZWw4S0RFOVIxNEdNRS9vcXZ3NGppbE03NTRKbVljT2NiWFFNZjlBVlBK?=
 =?utf-8?B?WklRUXdEWHJjVVlKOTBUQ1dTOEFMNTJJdjJ1cWFjem0zY1EweTJVcjhwLzVn?=
 =?utf-8?B?SDd5M2N4c3dRK3JKU3FDemRFcnRwcUJsQW5kbFNESEV4dWxMTlQxbCtpd3BM?=
 =?utf-8?B?Szd1Q0RTVjdXalVvVlF3QnIrVE8vNjBJenpqa25xeWFjdVpGSFNoZDIwSm14?=
 =?utf-8?B?SnVYWW5DNHpyUnhtVktzK1d4RHA2NzF6R1V2UWE5TEZYQi9uNjJxdW51Qmdx?=
 =?utf-8?B?N0NDWE9pa3QySDdsVldteUZleVhiaFFCTVVBdHpUV1dYTFFyMitqQldwVlNL?=
 =?utf-8?B?VFZaZll5aFJycmJObG56bHoxek1BSG1YZ1BiakE0WWN0MEJncnZsb091cmlv?=
 =?utf-8?B?WGRnUFkxLytZNUtwUHNCNHlYdXJxZ2RjeitLaFBoaVpPVEhvbVFsT1RTZEZm?=
 =?utf-8?B?TFYvNm9KVWJDUEh2UjJRNWgvbWY0WVRnVXd6SHBMRGZKZ1FCdmN1OERua3Ni?=
 =?utf-8?B?eHhiQnlCakEyQytsMjU0SlNFazZBRzQ5bFI1eHVIaVpTaml1WkJKV0ptK0ti?=
 =?utf-8?B?Q1VJRUFwV3o0RlJuclVuZGRkWnd0cExxbXE2QURNZXVuVnE3OFFRUT09?=
X-Exchange-RoutingPolicyChecked: HmqV03GFVHTKBrbwT5Eocc6SbEbtBLrUSdWai3ev/qQ7Orc9EhskcnZcSLrWmBghmC5xq2xpsoqtJSsJJTmFB/LHwywz3/IdlmH7ZgAK8YUhYDQU6f6LTNePhf7SiX70U+nlDrQvUTaEz9z/HBYKQfMuREJ0WYlSj9h+CIHpYnAqklN4CTkpz44CqszmbDDkNUS0Zec5hRtxLi9+2Hs/nP9xGHu6th6wNrXol/szaXNBBxQzCafvArZv5UgP3QJ5k6iFVFQe5xWE1cfy5wT0LeE63LLI8eEwKvvBwRrrPxx7YQHdSBJIQuWwH6sLQ6Mxqgf+MFe7c3tdxoNTRLPJ2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1a5c4f-37b0-4fe2-317b-08decce78d5e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 03:13:21.6159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtDlwPgbMZcJjaBuQzVUkRttUzVRkxuWCgmFUNzW7ZNCWz9mKYucvobDUCW8hkPzzMBmPXJhJtrlrTn/6zj39Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6101
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

Hi Kamil,

On 6/17/2026 5:44 PM, Kamil Konieczny wrote:
> Hi Pranay,
> On 2026-06-11 at 12:12:13 +0530, Pranay Samala wrote:
>> Change igt_get_output_max_bpc() to return bool and fill an output parameter
>> instead of asserting/requiring internally. This lets callers handle debugfs
>> read/parse failures gracefully instead of failing inside the helper.
>>
>> Update test call sites to use the new boolean-return API so each test can
>> decide how to handle max-bpc read failures. This separates read/parsing
>> failures from capability checks and makes skip/continue decisions explicit
>> with clearer logging, while preserving normal capability validation when
>> max bpc is read successfully.
>>
>> v2:
>> - Combine lib & test changes into single patch (Karthik)
>>
>> v3:
>> - Add description for the helper (Swati)
>>
>> v4:
>> - Rebase (Jason)
>>
>> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
>> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   lib/igt_kms.c                          | 41 ++++++++++++++++++--------
>>   lib/igt_kms.h                          |  2 +-
>>   tests/amdgpu/amd_bypass.c              |  6 +++-
>>   tests/amdgpu/amd_dp_dsc.c              | 10 ++++++-
> You touched amd tests so imho please add some of amd devs
> to cc, found by git log -- file.c
>
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Cc: Alex Hung <alex.hung@amd.com>

I had already requested for this and got a go ahead from Vitaly and Alex 
Hung on V1 of this patch.

https://patchwork.freedesktop.org/patch/725536/?series=166710&rev=1

So we should be good to go ahead with this from AMD pov as well.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Regards,
Karthik.B.S
>
> Regards,
> Kamil
>
>>   tests/intel/kms_dsc.c                  |  5 +++-
>>   tests/intel/kms_frontbuffer_tracking.c | 10 ++++++-
>>   tests/kms_color_helper.c               |  5 +++-
>>   tests/kms_dither.c                     |  9 +++++-
>>   tests/kms_hdr.c                        | 16 ++++++++--
>>   9 files changed, 83 insertions(+), 21 deletions(-)
>> [cut]
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 49bdbb358..244c24610 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -6769,32 +6769,46 @@ bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name)
>>   
>>   /**
>>    * igt_get_output_max_bpc:
>> - * @drmfd: A drm file descriptor
>> - * @connector_name: Name of the libdrm connector we're going to use
>> + * @output: Output to query.
>> + * @maximum: Pointer to store the maximum supported bpc value.
>> + *
>> + * Read and parse the connector's debugfs output_bpc entry to obtain the
>> + * maximum supported bits-per-component value.
>>    *
>> - * Returns: The maximum bpc from the connector debugfs.
>> + * Returns: true on success, false on failure.
>>    */
>> -unsigned int igt_get_output_max_bpc(igt_output_t *output)
>> +bool igt_get_output_max_bpc(igt_output_t *output, unsigned int *maximum)
>>   {
>>   	igt_display_t *display = output->display;
>>   	int drmfd = display->drm_fd;
>>   	char buf[24];
>>   	char *start_loc;
>>   	int fd, res;
>> -	unsigned int maximum;
>> +
>> +	if (!maximum)
>> +		return false;
>> +
>> +	*maximum = 0;
>>   
>>   	fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
>> -	igt_assert(fd >= 0);
>> +	if (fd < 0)
>> +		return false;
>>   
>>   	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
>> -	igt_require(res > 0);
>> -
>>   	close(fd);
>> +	if (res <= 0)
>> +		return false;
>>   
>> -	igt_assert(start_loc = strstr(buf, "Maximum: "));
>> -	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &maximum), 1);
>> +	buf[res < sizeof(buf) ? res : sizeof(buf) - 1] = '\0';
>> +
>> +	start_loc = strstr(buf, "Maximum: ");
>> +	if (!start_loc)
>> +		return false;
>>   
>> -	return maximum;
>> +	if (sscanf(start_loc, "Maximum: %u", maximum) != 1)
>> +		return false;
>> +
>> +	return true;
>>   }
>>   
>>   /**
>> @@ -6838,9 +6852,12 @@ unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc)
>>   static unsigned int get_current_bpc(igt_crtc_t *crtc, igt_output_t *output,
>>   				    unsigned int bpc)
>>   {
>> -	unsigned int maximum = igt_get_output_max_bpc(output);
>> +	unsigned int maximum;
>>   	unsigned int current = igt_get_crtc_current_bpc(crtc);
>>   
>> +	igt_require_f(igt_get_output_max_bpc(output, &maximum),
>> +		      "Failed to read max bpc for %s\n", igt_output_name(output));
>> +
>>   	igt_require_f(maximum >= bpc,
>>   		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
>>   		      maximum);
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index e89f1f3b6..4b90577fc 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1322,7 +1322,7 @@ bool igt_fit_modes_in_bw(igt_display_t *display);
>>   bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
>>   bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
>>   bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name);
>> -unsigned int igt_get_output_max_bpc(igt_output_t *output);
>> +bool igt_get_output_max_bpc(igt_output_t *output, unsigned int *maximum);
>>   unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc);
>>   void igt_assert_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
>>   				 unsigned int bpc);
>> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
>> index 3c537ea9e..e59691f16 100644
>> --- a/tests/amdgpu/amd_bypass.c
>> +++ b/tests/amdgpu/amd_bypass.c
>> @@ -323,6 +323,7 @@ static void bypass_8bpc_test(data_t *data)
>>   	igt_display_t *display = &data->display;
>>   	igt_fb_t fb;
>>   	enum pattern ptn;
>> +	unsigned int maximum;
>>   
>>   	test_init(data);
>>   
>> @@ -345,7 +346,10 @@ static void bypass_8bpc_test(data_t *data)
>>   	 * Rx supports only up to 6bpc, Rx-crc will different from crtc-crc
>>   	 * with 8bpc.
>>   	 */
>> -	igt_skip_on_f(igt_get_output_max_bpc(data->output) <= 6,
>> +	igt_skip_on_f(!igt_get_output_max_bpc(data->output, &maximum),
>> +		      "Failed to read max bpc for %s\n", igt_output_name(data->output));
>> +
>> +	igt_skip_on_f(maximum <= 6,
>>   		      "check /sys/kernel/debug/dri/0/eDP-1 (connector)/output_bpc\n");
>>   
>>   	igt_create_fb(data->drm_fd, data->width, data->height,
>> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
>> index 1742c7df4..dc71e903e 100644
>> --- a/tests/amdgpu/amd_dp_dsc.c
>> +++ b/tests/amdgpu/amd_dp_dsc.c
>> @@ -480,11 +480,19 @@ static void test_dsc_bpc(data_t *data)
>>   
>>   	/* Find max supported bpc */
>>   	for_each_crtc(&data->display, crtc) {
>> +		unsigned int maximum;
>> +
>>   		output = data->output[crtc->crtc_index];
>>   		if (!output || !igt_output_is_connected(output))
>>   			continue;
>>   		igt_info("Checking bpc support of conn %s\n", output->name);
>> -		max_supported_bpc[crtc->crtc_index] = igt_get_output_max_bpc(output);
>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>> +			igt_info("Failed to read max bpc for conn %s\n", output->name);
>> +			max_supported_bpc[crtc->crtc_index] = 0;
>> +			continue;
>> +		}
>> +
>> +		max_supported_bpc[crtc->crtc_index] = maximum;
>>   	}
>>   
>>   	/* Setup all outputs */
>> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
>> index 3687e795d..056fd37ae 100644
>> --- a/tests/intel/kms_dsc.c
>> +++ b/tests/intel/kms_dsc.c
>> @@ -422,8 +422,11 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>>   		igt_require(is_dsc_supported_by_source(data.drm_fd));
>>   
>>   		for_each_connected_output(&data.display, output) {
>> +			unsigned int maximum;
>> +
>>   			if (is_dsc_supported_by_sink(data.drm_fd, output) &&
>> -			    igt_get_output_max_bpc(output) >= MIN_DSC_BPC)
>> +			    igt_get_output_max_bpc(output, &maximum) &&
>> +			    maximum >= MIN_DSC_BPC)
>>   				data.valid_output[data.count++] = output;
>>   		}
>>   	}
>> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
>> index 37706cab5..3adf14bd7 100644
>> --- a/tests/intel/kms_frontbuffer_tracking.c
>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>> @@ -2281,6 +2281,8 @@ static void setup_drrs(void)
>>   
>>   static void setup_hdr(void)
>>   {
>> +	unsigned int maximum;
>> +
>>   	if (!igt_output_has_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
>>   	    !igt_output_get_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
>>   	    !igt_output_supports_hdr(prim_mode_params.output)) {
>> @@ -2294,7 +2296,13 @@ static void setup_hdr(void)
>>   		return;
>>   	}
>>   
>> -	if (igt_get_output_max_bpc(prim_mode_params.output) < 10) {
>> +	if (!igt_get_output_max_bpc(prim_mode_params.output, &maximum)) {
>> +		igt_info("Can't test HDR: Failed to read max bpc for %s.\n",
>> +			 igt_output_name(prim_mode_params.output));
>> +		return;
>> +	}
>> +
>> +	if (maximum < 10) {
>>   		igt_info("Can't test HDR: %s doesn't support 10 bpc.\n", igt_output_name(prim_mode_params.output));
>>   		return;
>>   	}
>> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
>> index 24663444a..a50ac3a37 100644
>> --- a/tests/kms_color_helper.c
>> +++ b/tests/kms_color_helper.c
>> @@ -40,7 +40,10 @@ bool crtc_output_combo_valid(data_t *data, igt_crtc_t *crtc)
>>   bool
>>   panel_supports_deep_color(igt_output_t *output)
>>   {
>> -	unsigned int maximum = igt_get_output_max_bpc(output);
>> +	unsigned int maximum;
>> +
>> +	if (!igt_get_output_max_bpc(output, &maximum))
>> +		return false;
>>   
>>   	igt_info("Max supported bit depth: %d\n", maximum);
>>   
>> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
>> index ca367db61..236e5c7c0 100644
>> --- a/tests/kms_dither.c
>> +++ b/tests/kms_dither.c
>> @@ -206,6 +206,7 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>>   
>>   	for_each_connected_output(display, output) {
>>   		igt_crtc_t *crtc;
>> +		unsigned int maximum;
>>   
>>   		if (!is_supported(output)) {
>>   			igt_info("Output %s: Doesn't support \"max bpc\" property.\n",
>> @@ -213,7 +214,13 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>>   			continue;
>>   		}
>>   
>> -		if (igt_get_output_max_bpc(output) < output_bpc) {
>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>> +			igt_info("Output %s: Failed to read max bpc.\n",
>> +				 igt_output_name(output));
>> +			continue;
>> +		}
>> +
>> +		if (maximum < output_bpc) {
>>   			igt_info("Output %s: Doesn't support %d-bpc.\n",
>>   				 igt_output_name(output), output_bpc);
>>   			continue;
>> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>> index c334c907a..9a9c8e197 100644
>> --- a/tests/kms_hdr.c
>> +++ b/tests/kms_hdr.c
>> @@ -254,6 +254,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>>   
>>   	for_each_connected_output(display, output) {
>>   		igt_crtc_t *crtc;
>> +		unsigned int maximum;
>>   
>>   		if (!has_max_bpc(output)) {
>>   			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
>> @@ -261,7 +262,12 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>>   			continue;
>>   		}
>>   
>> -		if (igt_get_output_max_bpc(output) < 10) {
>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>> +			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
>> +			continue;
>> +		}
>> +
>> +		if (maximum < 10) {
>>   			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
>>   			continue;
>>   		}
>> @@ -535,6 +541,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>>   
>>   	for_each_connected_output(display, output) {
>>   		igt_crtc_t *crtc;
>> +		unsigned int maximum;
>>   
>>   		/* To test HDR, 10 bpc is required, so we need to
>>   		 * set MAX_BPC property to 10bpc prior to setting
>> @@ -559,7 +566,12 @@ static void test_hdr(data_t *data, uint32_t flags)
>>   			continue;
>>   		}
>>   
>> -		if (igt_get_output_max_bpc(output) < 10) {
>> +		if (!igt_get_output_max_bpc(output, &maximum)) {
>> +			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
>> +			continue;
>> +		}
>> +
>> +		if (maximum < 10) {
>>   			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
>>   			continue;
>>   		}
>> -- 
>> 2.34.1
>>
