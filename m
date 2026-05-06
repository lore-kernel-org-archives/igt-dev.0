Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6407CD3436
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 10:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7934610E52B;
	Wed,  6 May 2026 10:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cERmh69k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0E510ED53
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 10:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778065043; x=1809601043;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tuzDffva2sSQrNghpa7Zhby8MsWCprJeelaNBC5hzGg=;
 b=cERmh69kTKP2f4+Sq3Ad5X7oNrosVYm7PNA5kZJzPFc5hr8BIaGEJPmF
 gZTsIxYM63KHiUxK0+2ntI1rzV8ZD2yS70ShMtNdYUvr8z4Y9AZJzd70T
 CKFyxjRYch8WW/a49J9QloXCPQe/kiyT5j74HwHCvzlvyBFD2hwKPTNMF
 XVw2ISlur9+eoH1Ix6o6vHiN3p+/+G/q9R25QGSN78vKHnhSM+JMcEvcj
 +gbBtY9Ozmv7Qnlxr9SJGiHjsXeSlVlNIMq9Z+0n3oVkohEK7kGZuESxl
 a5Y9MwndSYIubVArjjBPrWyXwTz8hu02lxQUn2TbIfhE5z4hoKJXz3IOE w==;
X-CSE-ConnectionGUID: PQImlKCQTHa+qrl266AoRQ==
X-CSE-MsgGUID: Q7bG7zGTR3aalMdcy6+2qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89690139"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="89690139"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 03:57:22 -0700
X-CSE-ConnectionGUID: isvenikRROeoMPDA7Wkt9w==
X-CSE-MsgGUID: AH+CQQ3kQ+m8jra04x9LVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="235102736"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 03:57:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 03:57:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 03:57:22 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 03:57:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSYQeDsCjec8s8w8EQL9HKoFHpL24oaO8B5gYKG3EvMyPrD1Ot4c79IjjUO7luVOlh+XTxgP9zIwkIc5eMLOmFp3oCBev+eEyo/TWlsEchg/loeVdH2vnbKGDQfkAWBkmDOY5yFstRuPQ9fV/izmXuUC5S1VbHqncqUkHOuztvWUj/aXPmb6JLuXivLLLlVtnrCsZO1YofACyBzx8Pjaljypuo01QoAqe036/7bzBB9TuMRLiwT6obzRK4iQwdcci5Tixh1qkiiW8R7TkEP9vpm+FtjftMecKc9Bi6Mk2L8bv7+JG3dfimJnaU4rSzJi/WMBooDePS3CXziab2fG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDZsyV6NA7IoHbkM3ILavQuewJF2W4vZ6PpchrXlHvA=;
 b=If9u4cJ4Okov3+C6qPKh0VZ27Dzg/GsmEc1Mob/ckWGvn1I9N6gsgqxaeRM8MxYq9dMCddNYVSlL6N5NVOb3aTHRHEap8oUlFFvaNI5EOsRTAIXnqjZMZgTAS5EenHcw0zBPdYdOpCYTjSvbvcAVb2LUSs2ZiswW10PQNWFn8uF5f8Oig5NYA9N4srdYGJAHvWV4wr9+m0rQSEJZxbU6zM2X5x9XzLkK4swjv0l37Ik0WiyYaEv0dijyjTG7HOHfXF6XvKod3XsdvEu05JCjps6dzFbzQ9OyZV3SL22OaABQXZ9HAUONTAxqVWHZiR7d5cC2mlklPXsq7sQxMCwDfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SA1PR11MB8489.namprd11.prod.outlook.com (2603:10b6:806:3a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 10:57:19 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 10:57:19 +0000
Message-ID: <01e1a5cd-eac9-49c8-bd20-05de2f554c59@intel.com>
Date: Wed, 6 May 2026 16:27:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 1/3] tests/kms_content_protection: Add per-CRTC
 framebuffer infrastructure
To: <igt-dev@lists.freedesktop.org>
References: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
 <20260330032205.467130-2-jason-jh.lin@mediatek.com>
 <CAMNLLoSPncgBBOGc--Mi=Kb8-Uok5ZOxS3Fj+oFQTRJtrkEKYg@mail.gmail.com>
 <CAMNLLoRrGA34vVZg6HAGwqrsVbZWEOtD9F4yKWmboiAwp+2paA@mail.gmail.com>
 <2a95efab-841c-47c5-bafe-f80f59e45a32@intel.com>
 <CAMNLLoRO_-bF0-SaUVgMq0R0T8mc6yk4GmPY=_FCJwhLWohigA@mail.gmail.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <CAMNLLoRO_-bF0-SaUVgMq0R0T8mc6yk4GmPY=_FCJwhLWohigA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::6) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SA1PR11MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed6f26c-5f02-480b-59ce-08deab5e3e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: beSJ9dh2oyc7PacCq5JrDgPR+6oBDbHz/B+LFIeCQk4qYOvkjaH9wBODqX2vMO0FAiXuA47CbEj9d3Bvaqcs5Wt5bRRs/q/04tNaikZFQbwwDjiwsFFRFPYObYRrIr2RkN27eO3fYl3XsJxvifHxbo3L3tO7+WNa3MYzr9VQ2mYkc10mGF7Z8uef4eBlDtFOQsG4aIfheRViHu0OIpmt5nu+iwNbgk6eSm4ng/3b6v2ZrvYKiFK42IomEEuLpXaKaBCYux1LSsp7jALdmUL7eDEzb6XaT4equQHY555yhVhJjmW9rGeFCfvkXieiK2w7ffbrOmHwtV0GaC/2J1hYs8UUqvBchMZGlYQumLrP3D07c4nW0hpJrbpoKxPVxWH5bkI1VLzkaURGaEDNXj1HMxg6iMcWgekLc55mODdLpwaROo4dkfWiIlM0HD6QJOo+AnsPLfJn8Z/8YqyPBdwi+nM9M1vS0uRS7TBECPS7Bs+JlNx4VCDYvypPxNFGAW8Z3kLQixAy419FMSd9IB1JO3UznRitEUD1vzUecCs0f7hRi1ad2FghM2eYdxP2gpT42wUDWpGrFp9CT3g50Nos42zz2JeFAmN7F9FYbYkXQdWYKF+STbz8Q7sTjiS3p0TT7jFTIdPD2jmlEHKqI10vag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWNNNFRrSHBHSTdXOU12amhRUHp3WTB3Tkw3YXl2cWtnRnRJWXI5ZEJZNk50?=
 =?utf-8?B?V1cvK2pKaGM2b1VQMFo5YTMzbTRXdU1nTjh3YmdpWVNQOHE5UHIyZ0dxMEVn?=
 =?utf-8?B?ekIxbmZYUHBnV2FXd1hUNlZTcWgxOFVIUHZIOE43UldwMFdIeDBZSm9SU3lx?=
 =?utf-8?B?c2J5azRSL0pwVFZmSndOM0NObmhJZWpDSlVUbFZQQkNlMHhnSUhTdkxLbjBs?=
 =?utf-8?B?MXpUSUYwTHFvVzY4ekRQOXU1cWhGOFdTUUNsZEZlZjBvMVB1RUh6RmhBYzBN?=
 =?utf-8?B?bXRCQ2FLV21GeWwreGx3L3dIWENNNVJua2tnZXo0V1BGVFBsL09lSE5rQmlS?=
 =?utf-8?B?OXhYNVpuVmd1ZkMzaExSaXJ3SWhyc1d0ZVg4Zzh4SERuRit5TDhNVjl6WnZ5?=
 =?utf-8?B?Vk9HRlp2N09QL3NSZU9KYUtNVVNWRlZkQy85OENlKzV5TDU1a3pTQ0dnN2RH?=
 =?utf-8?B?OGYvbXZEYkJqQXhvVHVvUzVHQ0FIUEtndTNoa1RtWkZSNEthTDJFdVdyOG1t?=
 =?utf-8?B?QnNWVXBha05ZQUJSaTRTMEgzQUFZOGRMYzFweXRvOG41ejJVTUJPa0pvZTkx?=
 =?utf-8?B?c3lkWEUrWWlNNElBVmYyUnVyQVQrem8wd0wwaWNCUEUycEF5T3lacHlpaHlj?=
 =?utf-8?B?eXlPSDNEOG9xdFZPL1ZKL1dlckoyRmdhUTRzaHpVeUZKQWQ4dU5Cay9NL0ZT?=
 =?utf-8?B?WFRrSWtoS3JWb3I0bUVnTzRDdnJzbzJ5NlkreW5MSndBdG9iNTMxUjlSNEl2?=
 =?utf-8?B?TGx4a05nekZ4T28vdUV0V0hWaFVIb1NoTXgxemg3bXFWM1ZiNzVpeXovVGc3?=
 =?utf-8?B?bWRYbVY1bUpXV2ViSnNiclhRQkF0ditxaVNCL0VPT0xXMUNhdVRCK0J4ZCtp?=
 =?utf-8?B?L3dPTytoZjNuOHorcTRLdnU0N2FEZXRvUGg3cjlRZXVZZ3NDM1JTNE1qSnlw?=
 =?utf-8?B?Umd5M2h1RmZqSGRLZ2lzSWFEZWNWRVhCVkNPOW5mMkNOa1hJTmZRVlM4TzV0?=
 =?utf-8?B?cUJETDRoUitaSDJxY283QVhLUmdhSld6djhsdWh1d3pLTUIzbVByLzJ6cE55?=
 =?utf-8?B?WUZtc2VxaDZwSzE3YjBhaEtwdGgxSkRiUHk4eWxYSWdGT0lqSFJhRTQ5QWY4?=
 =?utf-8?B?TThwcXlOWnpnRVNiTHFyajBEdDhrYXhLMlBMdytBNGp0ZlJLWWt3akhqcW1u?=
 =?utf-8?B?bTdFbGMxelhRcHNnODJ0NnNEVk1CZTYybXJPM3kyM3hFR3lwdldPYnY0WG9x?=
 =?utf-8?B?SzErUVF1RFI0dWs4Mm4yZ0xSTklvdTUzbjdZNG5SSnBSZUJHYk01VU53UUwz?=
 =?utf-8?B?S3J0bENWcGNiNFBWZ1hya1lZZGV2M05mRmpxc0FlNDNRVG1JZWd4Tmgzd3Ew?=
 =?utf-8?B?dEVhSG1GRnkwaWNYMTRBSmwvb041TGFIVzVJemQvdkRRczlySVhFcVlJUExF?=
 =?utf-8?B?djZNYWE4UG8vVjhyUzE2UlBBY2d2RTEyOEg2YTFtZ1dNUlRBL2FpbCtIV2RW?=
 =?utf-8?B?akFiZWFUcHFrcEZFbXZvNDlQWUNEWkxUTnlXc0hBKzBZUUFneWY2dnN6azN3?=
 =?utf-8?B?UG9PRUpoWGZraFBVVmhzNldpT2UvQ3o3WGdVRkZlSDBhODRVT244Z1ErM002?=
 =?utf-8?B?MlBOUXVZSkVOclNQQlNRUnM2V0pzcWN2NjllZC81R1U0cjZpUGJwWjNtREJy?=
 =?utf-8?B?M3VUcHZTNDlROE9yVHZRd1l0MzRCWWdmTE1lWTZSNEVMdlFYbTN1a0ZwcHo3?=
 =?utf-8?B?SlNqcFVIT1Ftby84RXVrcGJsZ3JYdTRSRlJObmtkZld0WnZiN1M0YmNYWUVv?=
 =?utf-8?B?NmE2V2pPbHMybVFDUFhHZ0hGU04xLzZiTkMvczBQQS9uZnFhd010cVJiVGJa?=
 =?utf-8?B?K2VoRUtzaUIxaHAvTDVYUWMrSFZkYlVHOUhMTTdTVzVTeXRSRno1NW0yQ0tB?=
 =?utf-8?B?M09uKzhrYmFnUW1mS2s3ZEp2K1RrakdTbzg5bGtxWjR2enZJSGt4VHMvUlhn?=
 =?utf-8?B?ZFlVK1NzbEpHKzVJTHRXdVM4YXR3OTJpR3hVTUtqWmtEZC9pVUozT1M4dzJK?=
 =?utf-8?B?MmNnK0w1TmxobVZQbWdUR0JGcTNHdVlmR1JWQzhTR2dqYklYb0xwL3dyQ0ox?=
 =?utf-8?B?RUttQ2lxbkVzTFZRU2NKZ09TTUxjUkViR2R4NldUSkd2aW41U1lkaERESFds?=
 =?utf-8?B?aHpEVmsvN0JFbEd0b3lwbVJRTUZOK2I0WGV6RytzR0lrL0JScVIwTGhlY2Zq?=
 =?utf-8?B?dDhZRCtJcmNMaFp6b2t4TWtETGtCS0ZjTnB0OFdnV1NsMjdTZzJYREZvT0tC?=
 =?utf-8?B?MXB4Q0laRElXanRmR1N2UzhaS3dmQnRnNWNtd2JiMkVnYXhmZzFTTmgrR0hu?=
 =?utf-8?Q?KTNNrIp2nlnBktCTWU8yHxwiliYunUO0JeHx2?=
X-Exchange-RoutingPolicyChecked: gdy4PwrHtv8axsGx56dOu+iHkYQ1KiRwGA990ohEtrWW4V4FQ7pBOUxha0kf/pYaMbf8wAgzU0H0KHIT+0tnFR8Q0DCUszEXq7vOmRr+CXialm+4wjWdSKHDqN5aeDAfP0auDPD9ZmeXG9Jogb+nFE52josxl6IRQIT7BqqhqTrTHi0GRlWykl8XyEosqdLlNQiD9WQGT1hGksSblp3yczA3lR4HIlTxv9fshj5osxq+O5wi5BKjtocrDzX2V5ojQCYBVtapIuLKPiO1f4hmsVh5L3GViYqnoFsGkvAiZo3GXdQdtGCfBh92aYvuhVUI9tYZHyx3j2fhIOyAoBHaiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed6f26c-5f02-480b-59ce-08deab5e3e2b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 10:57:19.4816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INHKez9aQ/5yMjtPtzyX7Lv0tw+fLk4fwPsso0mZ0jsC3QYzs2XrILvo4SlUdK4A2vIW5f1x+xhMGFPfJlSaahuh6qOGWjWr6I1UzJOeJw06O9HbBSSBa/Jn/xZ29aHK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8489
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



On 05-05-2026 02:02, Manasi Navare wrote:
> Thanks a lot @Karthik B S <mailto:karthik.b.s@intel.com>  for your response,
> And appreciate you trying this on your end and for your help on getting 
> this landed.
> 
> Regards
> Manasi
> 
> On Mon, May 4, 2026 at 1:31 AM Karthik B S <karthik.b.s@intel.com 
> <mailto:karthik.b.s@intel.com>> wrote:
> 
>     __
> 
>     Hi Manasi,
> 
>     On 5/1/2026 4:29 AM, Manasi Navare wrote:
>>     This change looks good to me,
>>
>>     Reviewed-by: Manasi Navare <navaremanasi@google.com
>>     <mailto:navaremanasi@google.com>>
>>
>>     @Karthik B S <mailto:karthik.b.s@intel.com>  and others from Intel
>>     signal boosting this, could we get some traction on this, its
>>     reviewed by the team, could we please land this?
> 
>     Sure, the idea LGTM in general. Will try this out at our end once
>     before merging as this test doesn't have coverage on CI currently.
> 
>     Regards,
>     Karthik.B.S

I have tested these patches on a mst and non mst setup locally. The 
changes and the results LGTM.

Regards,
Santhosh

Tested-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>


>>
>>     Regards
>>     Manasi
>>
>>     On Wed, Apr 29, 2026 at 1:31 PM Manasi Navare
>>     <navaremanasi@google.com <mailto:navaremanasi@google.com>> wrote:
>>
>>         Thanks Jason-JH for this improvement in the
>>         kms_content_protection IGT test.
>>         It makes sense to create a fb per CRTC given that each CRTC
>>         can have different mode timings/resolutions.
>>
>>         @karthik.b.s@intel.com <mailto:karthik.b.s@intel.com> ,
>>         @bhanuprakash.modem@gmail.com
>>         <mailto:bhanuprakash.modem@gmail.com>, @swati2.sharma@intel.com <mailto:swati2.sharma@intel.com>
>>         Could you please take a look at this patch and help provide
>>         feedback?
>>         We would like to get this landed as it helps improve our testing.
>>
>>         Regards
>>         Manasi
>>
>>
>>
>>         On Sun, Mar 29, 2026 at 8:22 PM Jason-JH Lin <jason-
>>         jh.lin@mediatek.com <mailto:jason-jh.lin@mediatek.com>> wrote:
>>
>>             Replace global framebuffers (data.red/green) with per-CRTC
>>             array
>>             (data.fbs[IGT_MAX_PIPES]) to support multiple outputs with
>>             different
>>             resolutions.
>>
>>             Add create_fbs()/remove_fbs() to manage framebuffer
>>             lifecycle at
>>             test initialization/cleanup, creating each FB with the
>>             resolution of
>>             the first output that can connect to that CRTC.
>>
>>             Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com
>>             <mailto:jason-jh.lin@mediatek.com>>
>>             Reviewed-by: Fei Shao <fshao@chromium.org
>>             <mailto:fshao@chromium.org>>
>>             ---
>>              tests/kms_content_protection.c | 50 +++++++++++++++++++++
>>             ++++---------
>>              1 file changed, 37 insertions(+), 13 deletions(-)
>>
>>             diff --git a/tests/kms_content_protection.c b/tests/
>>             kms_content_protection.c
>>             index caf3d7a56ae4..df9ff5efcaa2 100644
>>             --- a/tests/kms_content_protection.c
>>             +++ b/tests/kms_content_protection.c
>>             @@ -107,10 +107,15 @@
>>
>>              IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
>>
>>             +struct hdcp_test_fbs {
>>             +       struct igt_fb red;
>>             +       struct igt_fb green;
>>             +};
>>             +
>>              struct data {
>>                     int drm_fd;
>>                     igt_display_t display;
>>             -       struct igt_fb red, green;
>>             +       struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
>>                     unsigned int cp_tests;
>>                     struct udev_monitor *uevent_monitor;
>>                     bool is_force_hdcp14;
>>             @@ -991,31 +996,49 @@ static void
>>             test_content_protection_cleanup(void)
>>                             igt_info("CP Prop being UNDESIRED on
>>             %s\n", output->name);
>>                             test_cp_disable(output, display-
>>             >is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>>                     }
>>             -
>>             -       igt_remove_fb(data.drm_fd, &data.red);
>>             -       igt_remove_fb(data.drm_fd, &data.green);
>>              }
>>
>>              static void create_fbs(void)
>>              {
>>             -       uint16_t width = 0, height = 0;
>>                     drmModeModeInfo *mode;
>>                     igt_output_t *output;
>>             +       igt_crtc_t *crtc;
>>
>>             +       /* Create framebuffers for each connected output's
>>             pipe */
>>                     for_each_connected_output(&data.display, output) {
>>                             mode = igt_output_get_mode(output);
>>                             igt_assert(mode);
>>
>>             -               width = max(width, mode->hdisplay);
>>             -               height = max(height, mode->vdisplay);
>>             +               /* Find a valid crtc for this output */
>>             +               for_each_crtc(&data.display, crtc) {
>>             +                       if (!
>>             igt_crtc_connector_valid(crtc, output))
>>             +                               continue;
>>             +
>>             +                       /* Skip if already created for
>>             this crtc */
>>             +                       if (data.fbs[crtc-
>>             >crtc_index].red.fb_id)
>>             +                               continue;
>>             +
>>             +  igt_create_color_fb(data.drm_fd, mode->hdisplay, mode-
>>             >vdisplay,
>>             +  DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>>             +                                           1.f, 0.f, 0.f,
>>             &data.fbs[crtc->crtc_index].red);
>>             +  igt_create_color_fb(data.drm_fd, mode->hdisplay, mode-
>>             >vdisplay,
>>             +  DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>>             +                                           0.f, 1.f, 0.f,
>>             &data.fbs[crtc->crtc_index].green);
>>             +                       break;
>>             +               }
>>                     }
>>             +}
>>
>>             -       igt_create_color_fb(data.drm_fd, width, height,
>>             -                           DRM_FORMAT_XRGB8888,
>>             DRM_FORMAT_MOD_LINEAR,
>>             -                           1.f, 0.f, 0.f, &data.red);
>>             -       igt_create_color_fb(data.drm_fd, width, height,
>>             -                           DRM_FORMAT_XRGB8888,
>>             DRM_FORMAT_MOD_LINEAR,
>>             -                           0.f, 1.f, 0.f, &data.green);
>>             +static void remove_fbs(void)
>>             +{
>>             +       igt_crtc_t *crtc;
>>             +
>>             +       for_each_crtc(&data.display, crtc) {
>>             +               if (data.fbs[crtc->crtc_index].red.fb_id)
>>             +                       igt_remove_fb(data.drm_fd,
>>             &data.fbs[crtc->crtc_index].red);
>>             +               if (data.fbs[crtc->crtc_index].green.fb_id)
>>             +                       igt_remove_fb(data.drm_fd,
>>             &data.fbs[crtc->crtc_index].green);
>>             +       }
>>              }
>>
>>              static const struct {
>>             @@ -1241,6 +1264,7 @@ int igt_main()
>>
>>                     igt_fixture() {
>>                             test_content_protection_cleanup();
>>             +               remove_fbs();
>>                             igt_display_fini(&data.display);
>>                             drm_close_driver(data.drm_fd);
>>                     }
>>             -- 
>>             2.43.0
>>

