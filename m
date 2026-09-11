Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E567C88E41
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 05:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3DD10F394;
	Fri, 11 Sep 2026 05:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeFtM+xl";
	dkim-atps=neutral
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 11 Sep 2026 05:40:56 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CA810E361
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 05:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789105257; x=1820641257;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qPu20Wb+WvYjCJPgHQX7U/cAgsmRAUZRDmXApgzhNY4=;
 b=BeFtM+xlQ4TgIoA1SazACZci7J0VA9Dxfgzwdq7ykUXO4J4fDzDmBl7+
 +zY/oHFtjt+1fsPs85tVRbV/YFTIZCyTTa3885bfgx+y8Ta/zjmrqvS1y
 0JtKbWHr3XSawa+IMgil4bFzYp3+ZwsynoUuC2jpuNE4ZZsAi9mpSSgoW
 AX5S4w3I/QDtt9D+1Vv/eniy2e0dY2tWskgrGPp3LZhEdDRFCbVg8sTBM
 6Qx6/SrD2A9VPCCA3qFWPawkNpNZ6y9FVr51X5g8SCbxrSFRalx3YxZsZ
 CUCs1edAHizBWkQeGx6UAu4Z2B6plJEPDVGiqA1gWlL7/gSjDJlG6Iuya g==;
X-CSE-ConnectionGUID: PXnEbrUyRRq2Nb9J9kurNA==
X-CSE-MsgGUID: xP+qz0s3Rm2WuozSP3n9Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="75239"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="75239"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 22:33:50 -0700
X-CSE-ConnectionGUID: kPHtx4TRSF2pm0TX9hVRSg==
X-CSE-MsgGUID: jfwu7PuATo6E0lCMgL00Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275972320"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 22:33:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 22:33:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 22:33:48 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 22:33:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1gM3Zygdo/pzchxnyYqqGiny1Nip9D+ungEoOBEQgc2digJ6H/QqzSb+A8JfO4JeRjxH6rAeNTsWel6puAEtq97Jv6Pcddz58Gz3fz/daTJYa9W+OIt7tVOs4JAYSlhB0GQxw9B0l098HAnqaqvwcsG3TzgDuwqoWm1B4wPNi3/doRo+UwrkCHlTo4fD7GBIEtj6nfSvcxzjegCOFB0RYO2t8GWCTkXxc7g5q9OoCrF5lrwfgcmhOQoRoEECxaT/C7hggCtGfaBLfyx/xHuet2lj/94o68A47qHw4rxNwUQpuYdNu8Wa0cdTdurBEgg2iajYbH0LxtYp8cwU+PRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiZYC5nwAmmDKQXNNJufh5f5cfd7JbUM8yQ2j7pumC8=;
 b=Q5Q1C4P1ymwuuUDWDpzIR2LVQt3nQQ7BJBHd+9w/juhj/pKsUOGQHkWuJTd4UCYq9E6tu6I4LQL4Qfwk5AxG2Soon9EjqlJ8ymUAvdYZ0m2mvB1kPkOg5XcA3CTtEOr5LiGWRr4HcnTiNX5qNQkLlznp6YB1IY88cFBYyQIqt3M7YLS6ZCUVZa2/ycQ9vLXrDedJP1opgBE3dwgrPrbwdvZwssGVNp3i1NlNQsZN6u8AYrEy1OHG+KGb90n/WVPjRSExCLnBE61jPxrkllxV35jRmT2es+8U5oONGiboPKdjo3bs5w20YKvyAbtSVNhbWy41V2kSnoDVZkgWhG5ZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB7419.namprd11.prod.outlook.com (2603:10b6:806:34d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 05:33:45 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0382.014; Fri, 11 Sep 2026
 05:33:45 +0000
Message-ID: <7b7c2cad-9dd0-4dec-a0de-2515999cbe73@intel.com>
Date: Fri, 11 Sep 2026 11:03:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_ras: Add test for GPU health
 indicator
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <igt-dev@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <kamil.konieczny@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
CC: <anshuman.gupta@intel.com>
References: <20260902025813.1795134-2-soham.purkait@intel.com>
 <1b4d63c3-bef7-4576-9947-49931878353c@intel.com>
 <6cd89b8f-08e2-4fb9-bb70-e8cbd968d756@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <6cd89b8f-08e2-4fb9-bb70-e8cbd968d756@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: d1727b93-f6bd-44e9-8914-08df0fc63f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|6133799003|22082099003|4143699003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: BCJpUWxYPiLMdeoktXK7XwSEYbONsgL9A190AZAo79DHaKZYXHIasWHbllC9edTcnHbnhLR/K1fV8am6GRexujMpemALwL9XK33bOUUm6JAHBeFloReekDfSn/R1V4dMM23q4Y1NUN20tBSD4fkJKq3HxnZJAwMHWM0GmHYWLjkwp57OurrC6PF75jyiCU31nBXS+lf9dqYhMSudi04/Syi/G9TrN4TMJeRG5K+SgrA6LLa+spr6kR1ynIwADzxBMAq78FC9Cgl60/tFviBnbLNwlntiWSQLZJUovd6zDMhCsIylAwzvrtn7IT6fbItWvtHYPU5NivCZzf+e+UoPqje7DO8ar5i+2q+eixNkZ5lgvWWIP7adl+8JobxJeY07I/boQAA1HB3CzpS65dUAP9x/Ud/2oVylgo870UyZaa/VU0sNRPj5zgUrqUX7FeRq3n+19BlKASPa5R5u0673PW974QwhFiD3nc2IwHVt1E+/eIqlvigu7yR0u67hRaYeDZGnczd+CPvU03BmwRaEhbPF0h48M4MKJAROQJCL6xpLYZplajfJq7j7js6+tExjPEjhSsBrt+5vKja6nIlT0YCyGgm/KBNIWVVzh6NnfgsFdgSay9bu4M6eqaxcq/2N0z83IsZbrnSD/9E5ZY6xkPE6QT5ODcL1yRvAnlTiWYU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(6133799003)(22082099003)(4143699003)(56012099006)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0wwMDlyRG5rSjFpcmxTdkZZK2JwZXVaMHFYVFQ3ZjV2VkJlcDRaWmE5NG9n?=
 =?utf-8?B?RCtOREVndkd4Vm9uSUhXUHdla1VWL3hXUlFkMHRBZUhSeGZJTjhhK3NiTXNS?=
 =?utf-8?B?YjVZUnhIdG5IbzhmWGZkbVA0aWlrdkJRQm5VandPMURoUXh5WW1JaEdVWjdF?=
 =?utf-8?B?NXNlN29uazhOTFpQTmpWa2xNeCs1WE1XS2o0NEQ0MDdra1VhRjB5VGVyZnYw?=
 =?utf-8?B?SUJLWnN1WS9Oakw5eTBOYk5DaSsyOFBmbVEvcXVUUnpVSVR5NEppTjZ5WFNt?=
 =?utf-8?B?ZmpSR1IzaEV2ZnJXOWRsd0J5djdzUm1ZSUhSMkVQWWN6cG1FNmNsN1Jhbk5Z?=
 =?utf-8?B?Y3M2eHpmUXNhc0VhdlFXZmpxeUR3azNnSFRYUkdkc1F6UGVaWi9JNTNCTEJi?=
 =?utf-8?B?akd5TEF4dkU0N1IwNzA4VnFZQm9tZnZ2WFc0Vnp0akVzcEd5S1JDUWNOSzlQ?=
 =?utf-8?B?VjN0N0VMREZYWk8zK0k2NGVmQnlBcGNoNi80SGFveDd3OW9HOFR2VGg1dzZF?=
 =?utf-8?B?WUFyNWE1OHhBQlcrcmw5dTVzdnV6YlNJYXNBSGRSMFZZVXFzeG9VSFRmN3VW?=
 =?utf-8?B?aldkZHVTMVVLSG9hL3dxSEkvQ1MwTzF2TlhqQmFyUGhBSmZ1QVpxaFRmSlN2?=
 =?utf-8?B?QXE0L2lzTXU5M2Rwd2ZGbi81SklocTFJN2dRQUNNckZDMlBVekUwVVptM1BG?=
 =?utf-8?B?dVNucjh2TUcyR2VRMWtpY3dIcCtxL3NnQVVScWpVN05wMHhWdlYyVW1SekZ2?=
 =?utf-8?B?L3k5S1hONXhBWGVwakZHdElXRHFTenJTdjlQQXk4aHNBcGN3NVRzRlUrYmd4?=
 =?utf-8?B?RVp4cDJLNTNKNis1dlEwTmN4RGMyT1dWTGROdWcwZnArUHYvOXk3U0NNcE1D?=
 =?utf-8?B?cFpxYkV6WTRRdXE1V0g1dEZkMHQ2VDQyUlBYWGVxUXdTTWMxV2ZOV3lCaWFO?=
 =?utf-8?B?eUxrbnNHZ1h1NVF1RlZTNXM0N3RNRTM0V3Z1TTNDaXVHcDJpSlZ0ZzRZeHJJ?=
 =?utf-8?B?U1VNelJVeVNtVmlvUlhFdjAvYnNCa2RQQ2pwN2QyaTRub1VsZUtoQ0JlTnVz?=
 =?utf-8?B?WE1IVlFndGF4elpPWEFRNlkxOW5DZG9sQ1dXRlpGeWlhdWpQTXVyeFJWbUhX?=
 =?utf-8?B?TFluUndCWkRJRnpjYnNFMk9ScXd6Q2NVa0YzZWJvM3Q1SWpPV1MxZ25KRmdW?=
 =?utf-8?B?MHp1bkVKWWtsSVNybklnczNKRlFsWjN5NURFSzlrcHByYlM5U0h1dURvZWpL?=
 =?utf-8?B?NFZYc3pNQ28vUmRrZjBGQy9qR2JkT28xTUVoMk44U1dsdnFWMWNPM3RSTmtV?=
 =?utf-8?B?Qi8zS0JGVHFGS0JKL2pDeDdKTitmb2VHc28rencxeDBmdElPSzFkaE9icU1Z?=
 =?utf-8?B?blI3NllFTGtpUytQd1l4Vk9TVE9PcURweWNGTjBHUTY0ZDVBNUVpRUVWbnNi?=
 =?utf-8?B?OHdzSWlBYlhRWXg3eDcrRUVUd3cyZm1yVmVobEt4VEQyY0RJZnJFNndUS2RI?=
 =?utf-8?B?N2h5SVJpS1FYbU5UU09LMTZJWEd0QURiTUFXSWZ4K3dKbWN5NC9RcGh4Nng1?=
 =?utf-8?B?VEVoRERmd0tNUXgwTENGY3ZNeTJIaFArSjNrL3pLQzR0QlZCaWxId1pQWFBU?=
 =?utf-8?B?bG5IalM0bFcrSG94T2tLNDI1cU53eDFibk5idzNVbm1HemJJTi9HWDJObnUx?=
 =?utf-8?B?TGErWmVGUTNRTzBXZG4zQngyRWZTVVV2YWNzdktXS3kxOEQ4Y3hhSWUxM1BT?=
 =?utf-8?B?eS9QUk1yNkR6RjNWc0RnS3MvTUJ5cHFtYkhSQ1JxcW1uTGpUVm50U1pOOEpJ?=
 =?utf-8?B?S1ZXV0ttREJIMUNNOG5FcDE3Wk9aSDQzQjNKMFpVZ2RDeURFckMydFhJeU1P?=
 =?utf-8?B?UmtzWkYwby8rRVFyTVFRQThZTWdyaXdpN1FCYjJBK1ZuUDNKcFBlWjNXR2tN?=
 =?utf-8?B?Zm5HVmJ0VFN3b2R1MjhqRytFUGV4MUdsSVNhNjJOU2d1K3BXeUt1eUVQak5D?=
 =?utf-8?B?TzlEa0U3L1QzQittSkZKVndYQjQxcWdhUldNY2RTa2hBTCtFUVRSOUsrSlRV?=
 =?utf-8?B?bmZBTnMrbERYMk5VNjNJUXVFeW1tK0JmaHM4Z1VOcENVYXc3cDA5T1NtYjE0?=
 =?utf-8?B?b2NzWFgrL2pyTVRWZHNJeTBPM0ZCK0c1MVpHZ25CR0xpWmZ2aUQzVlJQUkht?=
 =?utf-8?B?UkFuR2hXSm1mMVV4djNLUkI0Y0g5QVFheldydFZGZWpvV29RejRHbFJSYkVP?=
 =?utf-8?B?bFZrSFkwQ3N6V2ViQzJpTUhOQ1c3YVZPWldwYUtVMXg1aW9QSlZwRW9rNXlR?=
 =?utf-8?B?dzRscXd0Q3B2NlJDdGM2eDk3T0NKck5leTJNUm5oMVN3dExnZTY4UT09?=
X-Exchange-RoutingPolicyChecked: V014VG2lPbsp1hFFB53ybIaeusYoKo9bMWhwVAJTRQfYkv4UZfxbUJok/k9xlBFhdwbs6s2Hkm9PqbGywjLvA6KQZR82FeSCnZHRvJicp9TQzwVyuFLcYoD0CJ0AwCTrkO4gQ0wpVVUxsoA+XPVTWaMJdNwKealoNG4X/lAlN65jU0bqiQMYCLSMyZJ/plCTrjJsf/5NkgdFqlKPhOQs2aUyZK9I5QFDnY6ITfFIZAYOdoCB82Pi1xx1fMZw7ne+X8IeEfr9nGTwvavi3UZSUbZ9HQ8nUXuL5QFvpLYM/DWwWCzDIPfFwaXQAts4CXfeuCUWg9gFnyMiFOYysVcdrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d1727b93-f6bd-44e9-8914-08df0fc63f55
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 05:33:45.2608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfgVWW81YRDCPKBCOn4w4TjroLCuxkop8zz5ppo4UglfksYwufTOR0qyhftGr9Zc3SDdQb2fcaQyz5MpkmGJ7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7419
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


On 08-09-2026 10:51, Purkait, Soham wrote:
>
> On 04-09-2026 11:54, Tauro, Riana wrote:
>>
>> On 02-09-2026 08:28, Soham Purkait wrote:
>>> Add a new Xe RAS test exercising the gpu_health sysfs attribute
>>> exposed by the Xe driver on platforms that provide the system
>>> controller. The attribute reports and allows updating the GPU
>>> health state.
>>>
>>> The gpu-health subtest validates each valid state by writing it
>>> and reading the value back, and checks that invalid writes are
>>> rejected with -EINVAL, guarding against regressions in the
>>> implementation.
>>>
>>> v1:
>>>   - Platform-conditional skip w/o fd leak. (Anirban)
>>>   - Restore via exit handler. (Anirban)
>>>
>>> v2:
>>>   - Remove dead-code and extra comments. (Anirban)
>>>   - Initialize exit handler under igt_subtest. (Anirban)
>>>
>>> v3:
>>>   - Move igt_info to the normal cleanup path when
>>>     restoring gpu_health. (Anirban)
>>>
>>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>> Reviewed-by: Sk Anirban <sk.anirban@intel.com>
>>> ---
>>>   tests/intel/xe_ras.c | 131 
>>> +++++++++++++++++++++++++++++++++++++++++++
>>>   tests/meson.build    |   1 +
>>>   2 files changed, 132 insertions(+)
>>>   create mode 100644 tests/intel/xe_ras.c
>>>
>>> diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
>>> new file mode 100644
>>> index 000000000..f3b507ce0
>>> --- /dev/null
>>> +++ b/tests/intel/xe_ras.c
>>> @@ -0,0 +1,131 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#include <errno.h>
>>> +#include <string.h>
>>> +#include <unistd.h>
>>> +
>>> +#include "igt.h"
>>> +#include "igt_sysfs.h"
>>> +
>>> +/**
>>> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) 
>>> functionality
>>> + * Category: Core
>>> + * Mega feature: RAS
>>> + * Sub-category: RAS tests
>>> + * Functionality: ras
>>> + * Test category: Functional tests
>>> + *
>>> + * SUBTEST: gpu-health
>>> + * Description: Verify the gpu_health sysfs attribute accepts each 
>>> valid
>>> + *        state (ok/warning/critical) and rejects invalid writes
>>> + *        with EINVAL.
>>> + */
>>> +
>>> +IGT_TEST_DESCRIPTION("Tests for Xe RAS");
>>> +
>>> +#define GPU_HEALTH_ATTR    "device/gpu_health"
>>> +
>>> +static const char * const gpu_health_states[] = {
>>> +    "ok",
>>> +    "warning",
>>> +    "critical",
>>> +};
>>> +
>>> +static struct {
>>> +    int sys_fd;
>>> +    char *orig_health;
>>> +} gpu_health_ctx = { .sys_fd = -1 };
>>> +
>>> +static void restore_gpu_health(int sig)
>>> +{
>>> +    if (gpu_health_ctx.sys_fd < 0 || !gpu_health_ctx.orig_health)
>>> +        return;
>>> +
>>> +    igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, 
>>> gpu_health_ctx.orig_health);
>>> +    close(gpu_health_ctx.sys_fd);
>>> +    gpu_health_ctx.sys_fd = -1;
>>> +    if (sig)
>>> +        return;
>>> +    igt_info("Restored initial gpu_health to '%s'\n", 
>>> gpu_health_ctx.orig_health);
>>> +    free(gpu_health_ctx.orig_health);
>>> +    gpu_health_ctx.orig_health = NULL;
>>> +}
>>> +
>>> +static bool valid_gpu_health(const char *s)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++)
>>> +        if (!strcmp(s, gpu_health_states[i]))
>>> +            return true;
>>> +
>>> +    return false;
>>> +}
>>> +
>>> +static void test_gpu_health(int xe)
>>> +{
>>> +    char *health = NULL;
>>> +    int ret;
>>> +    int i;
>>> +
>>> +    gpu_health_ctx.sys_fd = igt_sysfs_open(xe);
>>> +    igt_assert(gpu_health_ctx.sys_fd >= 0);
>>> +    if (!igt_sysfs_has_attr(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR)) {
>>> +        close(gpu_health_ctx.sys_fd);
>>> +        gpu_health_ctx.sys_fd = -1;
>>> +        igt_skip("gpu_health sysfs attribute not exposed by 
>>> driver\n");
>>
>> Won't exit handler be called here?
> No its the device sysfs for which  gpu-health exit handler does not run.

I meant assert here.

>> Wouldn't it be better to skip on gpu health sysfs open.
>
> Apart from this test technically no one is supposed to open gpu health 
> sysfs. If so, should this fail ? skip may not be a right option.

How is skip related to other tests using it? use igt_skip_on if gpu 
health is not available. This will prevent failures on non-supported 
platforms.

>
>>
>>> +    }
>>> +
>>> +    gpu_health_ctx.orig_health = 
>>> igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
>>> +    igt_assert_f(gpu_health_ctx.orig_health, "Failed to read %s\n", 
>>> GPU_HEALTH_ATTR);
>>> +    igt_info("Initial gpu_health: %s\n", gpu_health_ctx.orig_health);
>>> + igt_assert_f(valid_gpu_health(gpu_health_ctx.orig_health),
>>> +             "Unexpected initial gpu_health value: '%s'\n",
>>> +             gpu_health_ctx.orig_health);
>>> +
>>> +    ret = igt_sysfs_write(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, 
>>> "bogus", strlen("bogus"));
>>> +    igt_assert_f(ret == -EINVAL,
>>> +             "Write of invalid value to %s returned %d, expected 
>>> -EINVAL\n",
>>> +             GPU_HEALTH_ATTR, ret);
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++) {
>>> +        const char *state = gpu_health_states[i];
>>> +
>>> +        igt_info("Setting gpu_health to '%s'\n", state);
>>> +
>>> +        igt_assert_f(igt_sysfs_set(gpu_health_ctx.sys_fd, 
>>> GPU_HEALTH_ATTR, state),
>>> +                 "Failed to write '%s' to %s\n",
>>> +                 state, GPU_HEALTH_ATTR);
>>> +
>>> +        health = igt_sysfs_get(gpu_health_ctx.sys_fd, 
>>> GPU_HEALTH_ATTR);
>>> +        igt_assert(health);
>>> +        igt_assert_f(!strcmp(health, state),
>>> +                 "gpu_health readback mismatch: wrote '%s', read 
>>> '%s'\n",
>>> +                 state, health);
>>> +        igt_info("Verified gpu_health state readback for '%s' 
>>> successfully\n",
>>> +             state);
>>> +        free(health);
>>> +    }
>>> +
>>> +    restore_gpu_health(0);
>>> +}
>>> +
>>> +int igt_main()
>>> +{
>>> +    int xe;
>>> +
>>> +    igt_fixture()
>>> +        xe = drm_open_driver(DRIVER_XE);
>>> +
>>> +    igt_subtest("gpu-health") {
>>> +        igt_install_exit_handler(restore_gpu_health);
>>> +        test_gpu_health(xe);
>>
>> Wouldn't it be better to have dedicated subtests for each value 
>> instead of
>> adding all testcases in a single function.
>
> What about dynamic subtest for all these 4 cases under gpu-health 
> subtest?

Sure. It should be per value.

Thanks
Riana

>
> Thanks,
> Soham
>>
>> Would be easier to find during analysis as well
>>
>> Thanks
>> Riana
>>
>>> +    }
>>> +
>>> +    igt_fixture()
>>> +        drm_close_driver(xe);
>>> +}
>>> diff --git a/tests/meson.build b/tests/meson.build
>>> index 1ac89bab7..3c2d4fdda 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -333,6 +333,7 @@ intel_xe_progs = [
>>>       'xe_prime_self_import',
>>>       'xe_pxp',
>>>       'xe_query',
>>> +    'xe_ras',
>>>       'xe_render_copy',
>>>       'xe_vm',
>>>       'xe_userptr_pressure',
