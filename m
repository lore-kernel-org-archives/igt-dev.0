Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09232CA6018
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 11:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D69C10E54D;
	Fri,  9 Oct 2026 11:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNWjHnkT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD751112085
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 11:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791545010; x=1823081010;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wESb40+pVB7BznLlGktXDDiXUuix2nMvoIu8iSns6UQ=;
 b=FNWjHnkTIx7iFqmt7i7UYVBGHZZVARBI1Tpp9RHNiXUGlqIUXV59WY9O
 GqCcEhbANdjo8Yl1pjSif45nvngRFLWZi/K+HhAAban1qQb8QJ/2SYFBL
 tlUeUPUERWIUWLwK7GBzTInOShXI1p+nhQcR1KfvTv71bpAIkdLJRib28
 HWaW4xRrrdvnCq0YDsV/+QHEG4oIjB2LlL/ycP8F9czmRtdjl+3zuxuoc
 SDGuQ36XlxBUec1PPZpYP+Hd2hljghSyj0tlvBqbrIEA4Yh+U1R5lVt4N
 re1UofKzTt5ZmazL0Fu3WXzNf1j0jhI8gF/rxgxlyl5BOLMLnnoYYlY4a Q==;
X-CSE-ConnectionGUID: YNi5F/SNTNyDFMWDjXQ31g==
X-CSE-MsgGUID: /xqHC8UBToe8tx6MabMEBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="334445"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="334445"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 04:23:30 -0700
X-CSE-ConnectionGUID: jxpdIfotTTKrsnayFI+3dQ==
X-CSE-MsgGUID: mheNEzUhSb+arUNlbew5AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2033115"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 04:23:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 04:23:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 04:23:29 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 04:23:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4gBOBydoZ3l8pVqISAdAWx88ul5aP8f67pHr5QtxyR65xr1WIuVys8kGjLNR6d0Z5HKKc3sKIjl0jSaGMoTJSeR9Qbm79kw3Rz1m9uC3oukCLyKiQQbfXsSaJ/6hJGX9IY9hwq2OyCyDzSEFHrW0qQBNx6syOK++/6BEOBr3eDDjvcQychVf73AgQawTANlgX2aFomb64Fe9DSMD8suD0D1MQ1c/TDzGT550helyRY6x/jjGSCOUxcH9daeUp2t6Y/G8bK8CEgKwFVr+XvKDWBX0/H7B4dXfyGLkDgjs7HfuPHil5kQ8Q9ui60bb2SnZvAK9jvfV+Q41wYRp8IIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3UQLpoYmq/qTR+SONQedvXcgHcjco8kOApoc/4m58c=;
 b=CgBfet+zqfAcYVqzamq+eo7HIL42YOCLtENI++HsrS0bQgjAOTSOEUrW0o65LZk4dRjftKLMU2pczz1VI//0c3Oen1TPbVpBJUd9CQ7LNI2ESJuSnVUE/Q1CCNVa5BKZhF5GDLGKTmvLrDouV6iUfPzbzM7MkaP89YRTORIp0R827SrIJoOfeEjj3rlRDi39ohr72FFBT/Z3wn2OvdourZ3DryEqoI3KRZAM6kt0ESWdzS0p04Y0zJlnj3aVA83DOsyRDCuq2Dsusqi7Vf81xW7RAveMwWKAvZj2mi23E2DRjCcqA1DmiLwALZ02nChHPjffXQOJDB2bwFkWgz/c3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 LV2PR11MB361656.namprd11.prod.outlook.com (2603:10b6:408:3ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 11:23:26 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 11:23:26 +0000
Message-ID: <c771ca2e-85c2-4f5c-8f13-cad15e15398b@intel.com>
Date: Fri, 9 Oct 2026 16:53:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] lib/igt_drm_netlink: add get_error_counter
 support
To: "Tauro, Riana" <riana.tauro@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Gupta Anshuman <anshuman.gupta@intel.com>, Jadav Raag
 <raag.jadav@intel.com>, Nilawar Badal <badal.nilawar@intel.com>, "Koujalagi
 Mallesh" <mallesh.koujalagi@intel.com>, Harish Chegondi
 <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-5-ravi.kishore.koppuravuri@intel.com>
 <1ed559f2-2dbd-4048-aa5b-d4b6e2493e91@intel.com>
 <9bb4df75-12d7-454f-bf45-5d4c0fb87898@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <9bb4df75-12d7-454f-bf45-5d4c0fb87898@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0318.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::11) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|LV2PR11MB361656:EE_
X-MS-Office365-Filtering-Correlation-Id: 68629a62-2674-4b91-43f5-08df25f7bc50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|18002099003|10067099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 3MlnfVjMqMqlzS8kOj+on2wHjPkZd60iTpdvMsrN7c6cxJyqbBMpk+wmHro6wLf03HbFHKHobfrraQuqg8nv9wT2SlbjPSGvJmx5/z/VgmYkMIvB/hRCfLBrfFfrY9oxNf2sxj9ycm3l2siNE7AdIXgImWsyJpftOnQYEVMXYfWcpew4uQf2pcmk/Y2jgsGDs7tR8aOj5z1O+TS63kMMA9f2YfbCZ8USlc7DU7W1rGH2rpv6g4r4ZFVb6L+TAQNtd7CGMxmgjtMta83cFgGQdFCwLiMXZ6r4GFT6tUjm0tIxnufowx8s1qFBI5jPfcsUFLaeZvruK3xH4f3/l5tpio7qgXdYH8TtYsfUOdZTRejCL6BwrsMAy+rr8sjrJ/TUSwVqz9tMG+mSwyCqLdscg/Y9BuRfP5+9jkD7VKov0aMDb2xExm8R/4EHRhNHc2tVDVp3TytBLf4PKBrM19mQn+4Ss61ZanXsB6z7WdnsSvH/rDPw5wHZZxNpTXFnAfKpmqeT83oXU/FUYUglgUKioPSAvz1m4Xzzmtxd4DtHJyr2yZlinYlY0ihg00dqB+qx7K5w1B8aED3daDGr0roMoYup+g688XtlyHg5Esgo+FXQiDfby6J6lb7xRWyzCJqpR6b/Q49drDLy3Y4FEOov/2T8BQlNY5ZaCUGYgTuM9TE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(10067099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXk2OWpOa0xQMjZmTmV4WWErUGIxZTdTQlRnOE9Ka1RCa0lzVmg0NVQ1MWtD?=
 =?utf-8?B?bmZQL1d0a2pWbnRWY2FqN3VveHVmZDdSbE9ldDByUk5JZDZEeGJSWEVTbmVR?=
 =?utf-8?B?b1dyOXJRVDZzQUN2M2cvT21IUzV4NDMvektwUTlwTTJ0Q1E2T09WWWtqVkZz?=
 =?utf-8?B?ZEk4WUg2Qm5uY1JnYzI0M29QbXdUSFBJcFdoNDhVQ0gwZW9JL3JWZVZWdlhp?=
 =?utf-8?B?WVo0Q2hwZ1RCeXhrZDRJdkU2b1YrTEFDa2lhQVdIalFsZWduWk1lZEtBbmky?=
 =?utf-8?B?UGVib2k3ZXAwRTVoK0xXVnA2aURQSExUM3ZYZ3BpTGxCdjM4bHFaYTdlWTdU?=
 =?utf-8?B?cUx5TFk4RGtLOG02ZEhCRW40S1ZKTy9iS3VpVjBlUldvMW0zK3lzcEp5WFo1?=
 =?utf-8?B?TTBxWU1Zd3FLQnEvZXRkVGxPY2l2UkxxOTl0M2c1d1dSSkhZUnZBS3VCbHRs?=
 =?utf-8?B?S1RRRmdrWHU1QnR3QnRKYjA2NEluZ3lRNTJZOFZDZFZXeWVpUGUvZCtuVzQ0?=
 =?utf-8?B?QnNlaTAzWVNxcEdGVmJUbjByVnlrSTJDLzMranFSMytjNmZjYk41ZmRrNVF1?=
 =?utf-8?B?SHA4SStNM2FpVU1HNG0zOUdEWk5vaVprZXQwNEw4OFJETHN3NEVCMFR3QVhP?=
 =?utf-8?B?QnBVcTY0Q3FHUDVJQ2FUVHk5MDJicUtwOHRpblJJQ0padUNDMnh3MzFiVWQw?=
 =?utf-8?B?QmJyRDRtZEFoWFI1UFdXY1dBZWtXMDU2RGo0TFVrWkZaNzVhUEtRZmhYcjZz?=
 =?utf-8?B?WmkveG4xYVJNS3FMWXVnd3c5STFQb0x5dDBrN3ErRkZsNEdPUEpYQWZFOGdH?=
 =?utf-8?B?K1NJK1lOaFFJbVlyb3VBWFZyOGE1Z20vdlhsdXJzSGhVOExkdHREQmpmT1l0?=
 =?utf-8?B?L0pNVWhYcUxTQ2QvVGt4S2RHZ1dTbS9JZ21vejl3VFhTODI2SFh3QzN1OVBU?=
 =?utf-8?B?QTVBK21talM3TnlTckhvTm5sRHpwYkVCSUsxNi8zemMreVRDZXpEc2RKeUpK?=
 =?utf-8?B?ZVRwOElwaXViU1NuelQ3d2RGZTF4V3RYTVFkaStUaGZDMGhQek5Wa3pMYnlN?=
 =?utf-8?B?UXJoRnE1bUZuaDMxYmt3S0FMbXpwQnRtOE03NVpDT3FRUzBjWjIyOVVoT3ZS?=
 =?utf-8?B?TUY4blhVK0h6S3lqVDVxZVk5bG5VV2xPSWtzbytPeDZiY2xzQVhaSE5GcHE2?=
 =?utf-8?B?Q0pMS3kxUlV3dVVSOGdvWFBWajE3MXVPdHRBOGhXWTZXdFhxZTM5QXNSSkVk?=
 =?utf-8?B?aUFrZjRaWlVlT3BMMkorYXIyVjRTc3lFZFVKVDdkQld5bnczdHVnRloySmhT?=
 =?utf-8?B?SlpsdWRFVTlscHJIZVI3VmhGY3hDazBNN2tXRUo5MzlTQWpNcnNsengxRWR2?=
 =?utf-8?B?d2tROFdjQUc3VGpMNEFJbkQ2SHZSUmZqc0U4LzV6d256ZVVqVEdPY1Z2Tyt1?=
 =?utf-8?B?UHhqRTkxQlNJU2hRYnJnZytnVUpZaDF0Szh5eTVnY3ZHdGZTalpLZlU5Yitq?=
 =?utf-8?B?eit3RlhSU09zalpEMkR2bWhBMzNsVWRQcjRTTTViRFIzRGt2VTQ3ODFndEZF?=
 =?utf-8?B?QloxakdKbUYrd0Q5YWhta1FRa2dwbzRIaWdMazNXTk9KeXR4N1ptRzcyNDBo?=
 =?utf-8?B?TVVPOGZUQlBlTnVJK0YxRFJQTEh3N0xxV0xVbmVGbEk1b2hoN2VFNDdmYWVq?=
 =?utf-8?B?L0UzQXo0SjZqMkt2Y0x2TGs1dG8wOVRTL1gyVkRXNlByQzZydW5Cd3JMNG1Z?=
 =?utf-8?B?Z01CZS8rSERzRGhOY0VZckpydHg4ZEkyQUo0TTJWV0hZLzlKOHI2UG1oRlFJ?=
 =?utf-8?B?N0F1eHRHejVkYlpYUlV0bkVpa0lWMzRYWS9oUTFhNHNweE1tenFpUUtXZzZi?=
 =?utf-8?B?blAwcnVnUEVQeklFYzhpUEs3aUZHWkprak9ETlppY1NpV2VNOXo3M3dOSU0x?=
 =?utf-8?B?YmQ0Z2NKMEErem1XNmZKYi9rNE9oSGlBMk5rUnFtRVI0Ni8xZVk1aXJESEZU?=
 =?utf-8?B?TzZ2bUM3SmpJOUxFdDk4bjFmWVZGMFcwNUVib2JlSkNmUjI3MEFnS0xqZWpU?=
 =?utf-8?B?T0ZuSWtsY1BQYko0eWNiUUxYSnJZQ3FrN2RCWlZEZHM5WUVZcGpqMnZiSkdz?=
 =?utf-8?B?ZmJ1Wit4UDNPN2NiMnJGbFRidmpncWgyb0VOWmJ4aUdHdEhKK2hpK1FIdDBC?=
 =?utf-8?B?QzdVdUpHcHo1d2pDZy92UmhkS2JlSFVqdEt3aHdMUU80a2pXelA4TTN5Mmg0?=
 =?utf-8?B?dG9hTkdCVkpPY01xOTJaWGw5d3g2NnBCQ3Y2UG1FMUZBdkovTFhiZVJBTjZD?=
 =?utf-8?B?NUwwL3cyazRPaTIyNjlNY1hobHo5NXpJVHgyN2xXSjdJZkEzalQzSm9pNzBt?=
 =?utf-8?Q?dXVZj5VykC/4fl5BBsBaAegp9F4/eTvvN7I6g?=
X-Exchange-RoutingPolicyChecked: pzRZBbN0ErhPMUKsDMHm5eSvk81PBjxP5FryAKtx9tsHrMS/EMs7EfZPk5x8s4djxcendqUM3gzgHS6uS3HzSE3T0Wq7wDRTtZnHjYb91YporgvQfvRGa3KgECz+VBDsSl9LlLXj1blS0P9ARr8ickOc8E27X0nM3DlXR+dFH2/1AU2QmiFYNub/r/P/3woSQ5osUwObnaM58HUchtXZjwybZSMgJEMJNpod9wVjfqX95p45trcww4aHzW1974RMc5KRCcKI/LZB2mIsczjylz9aHyfa+7C8e/tnCSRPJyOYG4xxWEx30dW0KEzBhS0mgQQysmuoP9B8ZyoaDy9XZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 68629a62-2674-4b91-43f5-08df25f7bc50
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 11:23:26.0005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5EBo/bHP8Jmj2V0mFfzmBFqnwdi09Zq+uCdYJouFiqnV5GhSf+/AZdJF34+y3XPEZSryXWateR1rkEjwNUUDF3qKGH9jVY0hBofWumX3iLi2C+kyx6qYwWCXiY5+daE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB361656
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

Hi Riana,

On 28-09-2026 14:27, Tauro, Riana wrote:
>
> On 10-09-2026 17:35, Purkait, Soham wrote:
>> Hi Ravi,
>>
>> On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
>>> Add netlink request/response handling for 
>>> DRM_RAS_CMD_GET_ERROR_COUNTER.
>>>
>>> Cc: Purkait Soham <soham.purkait@intel.com>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
>>> Cc: Jadav Raag <raag.jadav@intel.com>
>>> Cc: Nilawar Badal <badal.nilawar@intel.com>
>>> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
>>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>>> Signed-off-by: Ravi Kishore Koppuravuri 
>>> <ravi.kishore.koppuravuri@intel.com>
>>> ---
>>> v2:Handled ACK/FINISH/ERR nl responses using separate callbacks
>>>     Added a check whether error_value updated by valid callback or not
>>>     Added a check whether response required for the command or not
>>> v4:Added support to poll for incoming netlink messages with 10 
>>> seconds timeout
>>>     Renamed the library functions with prefix "igt_drm_netlink_*" and
>>>     other cosmetic changes (Nikula Jani & Kamil)
>>> ---
>>>   lib/igt_drm_netlink.c | 268 
>>> +++++++++++++++++++++++++++++++++++++++++-
>>>   lib/igt_drm_netlink.h |   9 ++
>>>   2 files changed, 275 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>>> index 709c01987..b18e3eeb6 100644
>>> --- a/lib/igt_drm_netlink.c
>>> +++ b/lib/igt_drm_netlink.c
>>> @@ -3,6 +3,8 @@
>>>    * Copyright © 2026 Intel Corporation
>>>    */
>>>   +#include <errno.h>
>>> +#include <poll.h>
>>>   #include <stdint.h>
>>>     #include <netlink/genl/ctrl.h>
>>> @@ -11,6 +13,229 @@
>>>   #include "igt_core.h"
>>>   #include "igt_drm_netlink.h"
>>>   +#define DRM_RAS_NETLINK_REPLY_TIMEOUT_MS 10000
>>> +
>>> +static int ras_command_cb(struct nl_msg *msg, void *arg)
>>> +{
>>> +    struct app_context *ctx = arg;
>>> +    struct nlmsghdr *nlh;
>>> +    struct genlmsghdr *gnlh;
>>> +    int ret;
>>> +
>>> +    nlh = nlmsg_hdr(msg);
>>> +    gnlh = nlmsg_data(nlh);
>>> +
>>> +    switch (gnlh->cmd) {
>>> +    case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>>> +        struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>>> +
>>> +        ret = genlmsg_parse(nlh, 0, attrs,
>>> +                    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
>>> +        if (ret < 0)
>>> +            return NL_SKIP;
>>> +
>>> +        if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
>>> +            return NL_SKIP;
>>> +
>>> +        ctx->error_value = 
>>> nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
>>> +        break;
>>> +    }
>>> +    default:
>>> +        return NL_SKIP;
>>> +    }
>>> +
>>> +    ctx->reply_received = true;
>>> +    if (ctx->ack_received)
>>> +        ctx->cmd_done = true;
>>> +
>>> +    return NL_OK;
>>> +}
>>> +
>>> +static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr 
>>> *err, void *arg)
>>> +{
>>> +    struct app_context *ctx = arg;
>>> +
>>> +    ctx->last_nl_error = err->error;
>>> +    ctx->cmd_done = true;
>>> +
>>> +    return NL_STOP;
>>> +}
>>> +
>>> +static int ras_ack_cb(struct nl_msg *msg, void *arg)
>>> +{
>>> +    struct app_context *ctx = arg;
>>> +
>>> +    ctx->ack_received = true;
>>> +    if (!ctx->response_required || ctx->reply_received)
>>> +        ctx->cmd_done = true;
>>> +
>>> +    return NL_STOP;
>>> +}
>>> +
>>> +static int ras_finish_cb(struct nl_msg *msg, void *arg)
>>> +{
>>> +    struct app_context *ctx = arg;
>>> +
>>> +    ctx->cmd_done = true;
>>> +
>>> +    return NL_STOP;
>>> +}
>>> +
>>> +static int register_callbacks(struct nl_cb *cb, struct app_context 
>>> *ctx)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, 
>>> ctx);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    ret = nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ras_ack_cb, ctx);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    ret = nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, ras_finish_cb, 
>>> ctx);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    ret = nl_cb_err(cb, NL_CB_CUSTOM, ras_error_cb, ctx);
>>> +    if (ret < 0)
>>> +        return ret;
>
> Add some debug prints to differentiate errors.
will add the prints
>
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int send_and_recv_nl_msg(struct app_context *ctx,
>>> +                struct nl_cb *cb,
>>> +                struct nl_msg *msg)
>>> +{
>>> +    struct pollfd pfd = {
>>> +        .fd = nl_socket_get_fd(ctx->sock),
>>> +        .events = POLLIN,
>>> +    };
>>> +    int ret;
>>> +
>>> +    ret = nl_send_auto(ctx->sock, msg);
>>> +    nlmsg_free(msg);
>>> +    if (ret < 0) {
>>> +        nl_cb_put(cb);
>>> +        return ret;
>>> +    }
>>> +
>>> +    /* NL Reply and ACK arrive as separate responses */
>>> +    while (!ctx->cmd_done) {
>>> +        do {
>>> +            /* poll for incoming netlink messages with 10 seconds 
>>> timeout */
>>> +            ret = poll(&pfd, 1, DRM_RAS_NETLINK_REPLY_TIMEOUT_MS);
>>> +        } while (ret < 0 && errno == EINTR);
>>> +
>>> +        if (ret == 0) {
>>> +            ret = -ETIMEDOUT;
>>> +            break;
>>> +        }
>>> +
>>> +        if (ret < 0) {
>>> +            ret = -errno;
>>> +            break;
>>> +        }
>>> +
>>> +        if (!(pfd.revents & POLLIN)) {
>>> +            ret = -EIO;
>>> +            break;
>>> +        }
>>> +
>>> +        ret = nl_recvmsgs(ctx->sock, cb);
>>> +        if (ret < 0)
>>> +            break;
>>> +    }
>>> +    nl_cb_put(cb);
>>> +
>>> +    return ret < 0 ? ret : 0;
>>> +}
>>> +
>>> +static int send_command(struct app_context *ctx, uint8_t cmd)
>>> +{
>>> +    struct nl_cb *cb;
>>> +    struct nl_msg *msg;
>>> +    void *msg_head;
>>> +    int ret;
>>> +
>>> +    msg = nlmsg_alloc();
>>> +    if (!msg)
>>> +        return -ENOMEM;
>>> +
>>> +    ctx->last_nl_error = 0;
>>> +    ctx->cmd_done = false;
>>> +    ctx->reply_received = false;
>>> +    ctx->ack_received = false;
>>> +    ctx->response_required = false;
>>> +
>>> +    msg_head = genlmsg_put(msg,
>>> +                   NL_AUTO_PORT,
>>> +                   NL_AUTO_SEQ,
>>> +                   ctx->family_id,
>>> +                   0,
>>> +                   NLM_F_REQUEST | NLM_F_ACK,
>>> +                   cmd,
>>> +                   DRM_RAS_FAMILY_VERSION);
>>> +    if (!msg_head) {
>>> +        nlmsg_free(msg);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    switch (cmd) {
>>> +    case DRM_RAS_CMD_GET_ERROR_COUNTER:
>>> +        ctx->response_required = true;
>>> +        ret = nla_put_u32(msg,
>>> +                  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>>> +                  ctx->node_id);
>>> +        if (ret < 0) {
>>> +            nlmsg_free(msg);
>>> +            return ret;
>>> +        }
>>> +
>>> +        ret = nla_put_u32(msg,
>>> +                  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>>> +                  ctx->error_id);
>>> +        if (ret < 0) {
>>> +            nlmsg_free(msg);
>>> +            return ret;
>>> +        }
>>> +        break;
>>> +    default:
>>> +        nlmsg_free(msg);
>>> +        return -EOPNOTSUPP;
>>> +    }
>>> +
>>> +    cb = nl_cb_alloc(NL_CB_DEFAULT);
>>> +    if (!cb) {
>>> +        nlmsg_free(msg);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    ret = register_callbacks(cb, ctx);
>>> +    if (ret < 0) {
>>> +        nl_cb_put(cb);
>>> +        nlmsg_free(msg);
>>> +        return ret;
>>> +    }
>>> +
>>> +    return send_and_recv_nl_msg(ctx, cb, msg);
>>> +}
>>> +
>>> +static void reset_drm_ras_netlink_context(struct app_context *ctx)
>>> +{
>>> +    ctx->sock = NULL;
>>> +    ctx->node_id = UINT32_MAX;
>>> +    ctx->error_id = UINT32_MAX;
>
> use drm-ras max values. This should be allocated to 0. So assign only 
> what is necessary.
ok. will update UINT32_MAX with the drm-ras max values
>
>>> +    ctx->error_value = 0;
>>> +    ctx->last_nl_error = 0;
>>> +    ctx->cmd_done = false;
>>> +    ctx->reply_received = false;
>>> +    ctx->ack_received = false;
>>> +    ctx->response_required = false;
>>> +    ctx->family_id = -1;
>>> +}
>>> +
>>>   void igt_drm_netlink_cleanup(struct app_context *ctx)
>>>   {
>>>       if (!ctx || !ctx->sock)
>>> @@ -18,14 +243,19 @@ void igt_drm_netlink_cleanup(struct app_context 
>>> *ctx)
>>>         nl_close(ctx->sock);
>>>       nl_socket_free(ctx->sock);
>>> -    ctx->sock = NULL;
>>> -    ctx->family_id = -1;
>>> +
>>> +    reset_drm_ras_netlink_context(ctx);
>>>         igt_debug("Cleaned up netlink socket.\n");
>>>   }
>>>     int igt_drm_netlink_init(struct app_context *ctx)
>>>   {
>>> +    if (!ctx)
>>> +        return -EINVAL;
>>> +
>>> +    reset_drm_ras_netlink_context(ctx);
>>> +
>>>       ctx->sock = nl_socket_alloc();
>>>       if (!ctx->sock)
>>>           return -1;
>>> @@ -52,3 +282,37 @@ int igt_drm_netlink_init(struct app_context *ctx)
>>>             DRM_RAS_FAMILY_NAME, ctx->family_id);
>>>       return 0;
>>>   }
>>> +
>>> +int igt_drm_netlink_get_error_counter(struct app_context *ctx)
>>
>> Aren't the return codes here mixing -errno and libnl -NLE_* values, 
>> which overlap numerically and mean different things?
>>
>> Thanks,
>> Soham
>>> +{
>>> +    int ret;
>>> +
>>> +    if (!ctx || !ctx->sock || ctx->family_id < 0)
>
> Add a error message
will add
>
>>> +        return -EINVAL;
>>> +
>>> +    if (ctx->node_id == UINT32_MAX ||
>>> +        ctx->error_id == UINT32_MAX ||
>>> +        ctx->error_id == 0) {
>
> Use the uapi max constants here
will use the uapi max constants
>
>>> +        igt_warn("Invalid node_id (%u) or error_id (%u) provided. "
>>> +             "node_id should be >= 0 and error_id should be >= 1.\n",
>>> +             ctx->node_id, ctx->error_id);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    ctx->error_value = UINT32_MAX;
>>> +
>>> +    ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    if (ctx->error_value == UINT32_MAX) {
>>> +        igt_warn("No valid error counter reply: node_id=%u 
>>> error_id=%u kernel_error=%d\n",
>>> +             ctx->node_id, ctx->error_id, ctx->last_nl_error);
>>> +        return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
>>> +    }
>>> +
>>> +    igt_debug("Retrieved error counter: node_id=%u error_id=%u 
>>> value=%u\n",
>>> +          ctx->node_id, ctx->error_id, ctx->error_value);
>>> +
>>> +    return 0;
>>> +}
>>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>>> index 0e563e55f..5db7f4ab5 100644
>>> --- a/lib/igt_drm_netlink.h
>>> +++ b/lib/igt_drm_netlink.h
>
> Add a line description for these.
will update
>
>>> @@ -10,11 +10,20 @@
>>>     struct app_context {
>
> very generic. use drm_ras_context?
will update to drm_ras_nl_context
>
>
>>>       struct nl_sock *sock;
>>> +    uint32_t node_id;
>>> +    uint32_t error_id;
>>> +    uint32_t error_value;
>
> i think you should split the above to separate struct error_counter
>
>>> +    int last_nl_error;
>
> Why last?
last represents, most recent kernel reported error here and it is used 
just to distinguish with the error* field names. Hope it shall be fine.
>
>>> +    bool cmd_done;
>>> +    bool reply_received;
>>> +    bool ack_received;
>>>
>
> Shorten names. Perhaps done, reply, ack.
>
> Thanks
> Riana
>
These names are used to represent various stages of the netlink message 
exchange within a single callback function. So, I feel, larger names 
would help in avoiding the ambiguity.

Thanks,

Ravi Kishore K.

>
>>> +    bool response_required;
>>>       int family_id;
>>>   };
>>>     void igt_drm_netlink_cleanup(struct app_context *ctx);
>>>   int igt_drm_netlink_init(struct app_context *ctx);
>>> +int igt_drm_netlink_get_error_counter(struct app_context *ctx);
>>>     #endif /* IGT_DRM_NETLINK_H */
