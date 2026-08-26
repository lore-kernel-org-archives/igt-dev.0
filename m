Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A977BC61DBD
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 13:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5342210ED08;
	Wed, 26 Aug 2026 13:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nvnq/prN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A22310ED08
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751206; x=1819287206;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8Wd/IoTH6mzJJI50zTPfNVCAYWScXmxCtwx8brJAHjM=;
 b=Nvnq/prNVH8CIpN2CkEYCMzzW2xlUHmi82GGby7jUVAO38Dj/dDIOkvX
 U98TzrzFUHe3AEry/VIaGiW5gNEpyq2vL/2S5PfhPIj4yiJiKyD41y0Oi
 PzCg8dadaD9bksgXC0yq4X9iU3Hf6d8KVjxk9tvtdzWT8yRZqZBzuyi8U
 xIdjNCI7UZ5EMumO+yDad2F806+NoepWBmMT+xvCdWAqxYQ4AV1PD+Nsp
 QxEGEi8rlTMWAuWH5g+lEHhRkXf4fr2QuMD8auIO51UwpCkylygoiM8gD
 J8aplkQJsTQutlA006f5s/29o+NqQrOZrZ1u5Xc52+wOvv6Uy+ynfhzes A==;
X-CSE-ConnectionGUID: GQkVyPs6TiGO6PYdCP2O1Q==
X-CSE-MsgGUID: yfcJOiabQ5+TlRS5UFD1Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="92052316"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="92052316"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:33:26 -0700
X-CSE-ConnectionGUID: sxJwHiRbTkia8xGikqTx/w==
X-CSE-MsgGUID: 9B4fgDTXRomlDnCz/Xy6RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="265778537"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:33:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 06:33:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 06:33:25 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 06:33:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9pDgGT0u02cKn9xHYURceLvVfIvaUSOgpwfZ3op1C7DEui2hDUE7ZBmnrtNGIgh4WGirMK5PEfSQaunQNrP3BYSWZ2PA8rYeD6oUFFgqxXLbYJ2JlyKJU981BwMYwttqS7sixYk56HaKtxbcDlf22BaZHO8WXYTORdD28sN1/D6ih25HgG6OkJAMpy7CnSkLlV9j+lzmHOD7rXCFoL09JUArZRuSyIH/CP9ugnhRnbip+YRe/F1eAy66N0bEqzo+AWbRce8iFerudQtkmgVfmhKkMYllX747otRoYLVqw0IgQX4fDjqRMhAI+rtbb9dO0avJQ41RMWKw580FpMTHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTUGt7CTj/stylUTKVH0NxpXb9W/El+Tq61SY5jG3YQ=;
 b=I52lMZsM6BB/LUO2b3Yi+MFvoZj6XswSiGw2PAX8P8+mzuz5PSNoNF6+HpIh6b/bIP7zcrsf6A/9VcFDL/k8HL48l4CHyk0wM0jq4PKDmm/ioFn4psZKUVnvaFoTk1wVN8ZVLJFanN+ThNuv01FEal28ij/b1x+uHqISBDYKQ5OaAmk2QUA5WfQC1iST6tmp8l5tCv6YFIA938NwUVr9nfGG/K1xO307sW5HSKF5/UlmaZnjUAXQQu4WSlY1Ri8nx1PW3je7NgrdzG1iTSTwiRi108v6oLpyQj1Ur0Jh+qRKS1q7/JF9LPu1jUaQMxQf9Du+pzgWowbdTzwlGs123Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 SJ0PR11MB5021.namprd11.prod.outlook.com (2603:10b6:a03:2dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 13:33:21 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 13:33:21 +0000
Message-ID: <52ac6e9c-fdc1-4979-8ee5-a3f2f8d4e89f@intel.com>
Date: Wed, 26 Aug 2026 19:03:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com>
 <8ac9fdd8-4bdf-446a-8ca4-f66bec6a6f7c@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <8ac9fdd8-4bdf-446a-8ca4-f66bec6a6f7c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0059.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::10) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|SJ0PR11MB5021:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7a3533-8590-47c6-2865-08df037698c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5uTqIRP0pIj4l5LSFFqhT9NGAOYkDq7a1ktJeDgjti1nSa93Huj8AE0MGpT2woi/BcV+RFvTGRJbP7dXbA0zkOK3WXXUgHWXMpviEKgmgXNdldVKTbiv0CKtgxndIxeUo1Ba4NCVcKpvJf6biBEfeo9J8IFSIvnhoNPiLbxZgoVAkt3grM9U65XIBc9GGL14ybRKJdpy2Wy/9A0bU+YEPFfpKLJs6fjNWNTtbBIQpnx43smD+tmr21T6UBrxIAE7ch8/MUeKAGXsBrip9p4zLkLogRJGT7min6+o0BPg2shfzes3q9pTiNykuH/GsnQ0ZPFMA8Pd69YCGztK+/k95uu9aZ+r5J+whqag2EMsffrFz09ueBqgjUneSQvfXNBNMXb3rxuIvgZ9MqeGXuqjCiHIyMezbVQzWupOSINhbZVgzD/Nh2/W5Gk5KS8+s75wdi3g+YCG9Uz1+Ymu18Kn9juOk2qA3YDQD0gRzVLbzJhl9jL8T5xxm8krr2VVonub95aTcdpPKS9ILi8pfnIGOViJfkeXEsCmks/Bc2/1k422vH3aE88VocqbLO9zFF7w/n9YTqI4Vdj8mPt3jjCTB75TJQZnr8um1bMz0eDZYGGxstnAUgz13aY54h45aNvAeIKyLK4fPP/WDhJpR2wu6Daoyw8UoadQE1Ve+Yd9plQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkZudmtnQ3RkVGwvZjYxZWhFRUJGMWV1T1g2QklXZkxueExSbklHRjZTOGtL?=
 =?utf-8?B?K0YwODNsbzBsTmhEbVpKaXdRajVhKzQxL3RtRVhkNW80aDJhTmlZL1U1SWNP?=
 =?utf-8?B?QlQ4UjNDUmxsZHhKYkxGSGoxSGMxZ1J4NHVpTWNXUGYyNStHYnVzeHlKTWlz?=
 =?utf-8?B?SGVrYkdkdUpxb3M3V09yc21SZHY4THRuK0syVlNZUUcrZEhON2VGWHhXdHF4?=
 =?utf-8?B?UmpPMUZVTHVwWkMvM0JoRjcvTENRcUpPVko5MHB2MzZnZnkrY05XK1pOWDFB?=
 =?utf-8?B?WHNvNDI5dkVqUlRNaFJlWVFBS3p4L0Z0eGU4dE1xZkNpNEEwUGVFVzZSTVVW?=
 =?utf-8?B?ZDNXRk5ldEVyUHl2cUI2MSt6azlKRjFlL0ppejZ1T2ZZOU9HeHNuU2JFK2Na?=
 =?utf-8?B?V3hCUDA4NEs4YUxrWlVwcnhwdU5qTXBIVE9uQisrKzljV2RhZ1BLQ0pBTk1q?=
 =?utf-8?B?Ri9PeGFOenN5RC9KbXB1UjRBcTl1M0pFQmlLS1hvR2kzZjhlL2ZjVE81Q0RC?=
 =?utf-8?B?K3lsMXVHVE8zQXE2OWJzZXV1OFl5K2JYTVFNc0tGSmg3R1lVeWpNVGpmazZh?=
 =?utf-8?B?R3ppQ05oSnBqSFJDT2Y3L1RDOThjNk1ya3pwODRqK2Z4Tk9yTFljK1E0US9U?=
 =?utf-8?B?TGF2b3RDc1lONVZjVlFTMkRJZEVKZ3VqQlhnUWxoVFpSUjNyR0pwV3JLbnIw?=
 =?utf-8?B?b2o2RjFaMk1iZjg5YjhuQUE2M053eks0dGlQZ2VpRHJmVFdaTW9OMHZMN2NT?=
 =?utf-8?B?ZmFteWJIcDdYYkJtandIUE1adzZxTEU1MzREY1RtUUgzczZ2SXBQVitKRThu?=
 =?utf-8?B?QU5hZXVxc0ZTcUZpVitrbUJuSEZXdHRKakFnazZJT3VZTFRjVTltZ3NPZytI?=
 =?utf-8?B?N0t4OU0yYUl3Q3k2TllRRVRQZERxMlhReWVxU2RCbTN0OFo3bEdpMGpMdnZt?=
 =?utf-8?B?UTJxVnh1SEFUUENLWGJibjJ6UVRoSWluRGVud1o5VzNodXIwQzlQOVhVcDFY?=
 =?utf-8?B?enQvd211SW1sRWxBT1VHbVdwTmliN09QeTZLWmZCZTlTUVZYSmpDR1pnOHZP?=
 =?utf-8?B?VFVCZGxZeEZjK3QzbVk2ZUNXb3RsZjhQcm9rRmJ1MkxnL2RNTTZVTXdpUTQ2?=
 =?utf-8?B?UzM3ZTl5WkxZSVhiNkI2cnlDNGVoQW00WXhMWlF6QVZDOG5CR0VuS3A4MzFH?=
 =?utf-8?B?Y3Z4N0o1ekRIMzBoSmtYakJvTXI3aEY3dnNteVZKNEtBUE5CcThYWFRrTFJh?=
 =?utf-8?B?OTFVRkg3U3lEUzVVc1FOVHhUT3NvWjNqcEVqWEhjWmFUcGxWeVBZdUVxR3F2?=
 =?utf-8?B?SWc2bmk0c1UzbW5jbGIyQy9LWVVzdFR4WlJnVVJGaFQvQ3VJNjdNMVdDQmp4?=
 =?utf-8?B?d3ZHcTdnWDh5U2hmOWF0SFhiYzdoODBVMGxyODdEMjlNNHZucEc0ZjJIVm1C?=
 =?utf-8?B?aXZWa1FmVlFESzlTaEZzQjlTNE9qa3lMenh5Z3BWeTJvMG9Pb0kyak9XUFI2?=
 =?utf-8?B?b2pVSlNqRVB6MVQ5c3dJSzNSMW9BeTNYQndMVG1HTFo2SkczL0tMNjhyS3hq?=
 =?utf-8?B?UjZSVkFDa0xPSUVnYnU1ZVFJc1BNYVRrWXBpYVZ1V1hvMGszeHY4ejJGREpZ?=
 =?utf-8?B?RWtmTTJ3SEhRRGxKTWREa3RMcDVhMFU2Tkt4di9MYlhTOVpUS2ZJdksxY3hz?=
 =?utf-8?B?ZGxmRU5BVDVWZFIwbW9SQm85MmR4OHpua0tueGlKOG92dGRuSXQ5YU12L1V4?=
 =?utf-8?B?d1V1Q3VUaCt6b0VXUElJRzJuTUxaS081aTRYRkFuK1J3N29jZ2VmT1o3RE9R?=
 =?utf-8?B?VVZTSVUxRURKb3NnNWh4Z2VoazdxbmdjK0t2Z2d0MzFmVXJQcEtKN2JzUXRM?=
 =?utf-8?B?Uk03d05sRktVTi85ZzFpTDQzQjNpcURsN3VEQlViOHErcW9ORUkzYWZWOEJ3?=
 =?utf-8?B?bmNZSm14Qy9hTHU0Yk8rTEFMR1dGdFc3Q1RYTnk3U0ltWnRtMjgxbXpuM0kr?=
 =?utf-8?B?L20rNHBLZmhKMklYTXptWjJJOFBKZHB3YzQ0V2FrRU8zK1RlT2dodWVOblVF?=
 =?utf-8?B?WCtsRGNKaHMrclovNThBZnhub3JNWVFCWHJYMHNmUWlHakVjamgvaDVCUWxo?=
 =?utf-8?B?eHdsN3BlSk5uK2Y0MVRWVG5nWEsxNFJVWVE1VWFMR2lZTTd0RDA4NFQ0THNo?=
 =?utf-8?B?aXdGK3l5QTlvMnN6VS91QnJEbGVoZXdnSGZTV3NuOXZoTzUxUzlIOUxxNHpW?=
 =?utf-8?B?d0dqSWtsc1pNN0xBS3FieWorV0JmeVQ1ZEwyKy9FY0d6WlRDK1hkT21pcjVo?=
 =?utf-8?B?Z3BYRWE2bVVSVGVIODNoenZmMk96clZmSU1wamtYSUVLUjBVOGVNSTExZTly?=
 =?utf-8?Q?+Wb8bSjD0nmfrhnrFC0QPmmJhC71q7Vbi5BSJ?=
X-Exchange-RoutingPolicyChecked: DcSaudLWBKFNwxgABt0kmh4kmKlOaQi1bxjzgM3x4qJ5xrL/fUj2VwMaylehpriy39hENN6Swr4Y0v6Xzmoza7hoRJfFcCqyeaxkKRMZK9KqFzIbUvGsCLqn+zFvj4lqDM2DW1arO1w4OUwcrLfoQH+yvYMP3bta+ZNMb1qx5KgYF2KX6Il5uEZCukBx0y/25gX2L8URY5ZVbPenwwie+PZ4sZ97/PvXyOlbinFdK0m0DGY2gPt6QLHqjxYv7prD+wAFdvszxeVnoPa22XebzEFLkOR0Nr3gTQEAGN2pLwaMwaZ5/bHaNcFqbZz7A7smZ8lAP6Gx9dHUjzj/ftnOng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7a3533-8590-47c6-2865-08df037698c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 13:33:21.5827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VBJUvtGrGRxx0YlY69xyimbcqb5UUf2abJ3yWjIzapUoBYKuOYNCY+i8MSXlMDGZp1XhWBLTXbl8ov6Gv9EfrBTf/2vMaQxW2VNc2uQ2mthh3JJaPqgdXqND/O+BoHz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5021
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

Hi Soham,

On 26-08-2026 14:48, Purkait, Soham wrote:
>
> On 24-08-2026 22:11, Ravi Kishore Koppuravuri wrote:
>> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
>> injection to verify the Xe driver error handling and recovery flows with
>> the help of DRM Netlink API suite
>>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>>   tests/intel/xe_err_injection.c | 321 +++++++++++++++++++++++++++++++++
>>   tests/intel/xe_err_injection.h |  18 ++
>>   tests/meson.build              |   1 +
>>   3 files changed, 340 insertions(+)
>>   create mode 100644 tests/intel/xe_err_injection.c
>>   create mode 100644 tests/intel/xe_err_injection.h
>>
>> diff --git a/tests/intel/xe_err_injection.c 
>> b/tests/intel/xe_err_injection.c
>> new file mode 100644
>> index 000000000..ded5f558f
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.c
>> @@ -0,0 +1,321 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: MMIO based Error Injection
>> + * Category: RAS
>> + * Mega feature: Telemetry
>> + * Sub-category: Driver
>> + * Test category: Error Injection
>> + */
>> +
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <time.h>
>> +#include <fcntl.h>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "lib/igt_drm_netlink.h"
>> +#include "lib/intel_reg.h"
>> +#include "lib/intel_compute.h"
>> +
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_mmio.h"
>> +#include "xe/xe_query.h"
>> +#include "xe_err_injection.h"
>> +
>> +enum {
>> +    RECOVERY_SUCCESS = 1,
>> +    RECOVERY_FAILED,
>> +    RECOVERY_TIMEOUT,
>> +};
>> +
>> +static void run_xe_compute_on_all_engines(int fd, bool state)
>> +{
>> +    struct drm_xe_engine_class_instance *hwe;
>> +
>> +    if (state == POST_ARMING_INJECTION_WL)
>> +        igt_info("Running compute-square on all engines post 
>> injection\n");
>> +    else if (state == POST_RECOVERY_WL)
>> +        igt_info("Running compute-square on all engines post 
>> recovery\n");
>> +
>> +    xe_for_each_engine(fd, hwe) {
>> +        if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>> +            continue;
>> +
>> +        igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, 
>> NULL,
>> +                                    EXECENV_PREF_SYSTEM),
>> +                                    "GPU does not support "
>> +                                    "compute on engine\n");
>> +    }
>> +}
>> +
>> +static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t 
>> value)
>> +{
>> +    xe_mmio_write32(mmio, reg, value);
>> +}
>> +
>> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
>> +               uint32_t bit_mask, bool set)
>> +{
>> +    uint32_t regval;
>> +
>> +    regval = xe_mmio_read32(mmio, reg_addr);
>> +    if (set)
>> +        regval |= bit_mask;
>> +    else
>> +        regval &= ~bit_mask;
>> +
>> +    xe_mmio_write32(mmio, reg_addr, regval);
>> +}
>> +
>> +static int acquire_forcewake(int fd)
>> +{
>> +    int fw_handle;
>> +
>> +    fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>> +    igt_assert_lte(0, fw_handle);
>> +    return fw_handle;
>> +}
>> +
>> +static void release_forcewake(int fw_handle)
>> +{
>> +    if (fw_handle >= 0)
>> +        close(fw_handle);
>> +}
>> +
>> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
>> +{
>> +    struct app_context ctx;
>> +    int ret;
>> +    uint32_t error_value = UINT32_MAX;
>> +
>> +    ret = igt_init_nl_socket(&ctx);
>> +    if (ret < 0) {
>> +        igt_warn("Failed to initialize netlink socket for error 
>> command (ret=%d)\n", ret);
>> +        return error_value;
>> +    }
>> +
>> +    ctx.node_id = node_id;
>> +    ctx.error_id = error_id;
>> +
>> +    ret = igt_get_error_counter(&ctx);
>> +    if (ret < 0) {
>> +        igt_warn("get_error_counter failed from error command path 
>> (ret=%d)\n", ret);
>> +    } else {
>> +        error_value = ctx.error_value;
>> +        igt_info("get_error_counter: node_id=%u error_id=%u 
>> value=%u\n",
>> +             ctx.node_id, ctx.error_id, ctx.error_value);
>> +    }
>> +
>> +    igt_cleanup_nl_socket(&ctx);
>> +
>> +    return error_value;
>> +}
>> +
>> +static int check_dmesg_for_recovery(const char *marker, int 
>> elapsed_secs)
>> +{
>> +    char *buff = NULL;
>> +    size_t buff_size = 0;
>> +    ssize_t line_len;
>> +    FILE *fp;
>> +    const char *success = "AER: device recovery successful";
>> +    const char *failed = "AER: device recovery failed";
>> +    bool marker_seen = false;
>> +
>> +    fp = popen("dmesg", "r");
>> +    if (!fp) {
>> +        igt_warn("Unable to open dmesg to check recovery status\n");
>> +        return -1;
>> +    }
>> +
>> +    while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
>> +        (void)line_len;
>> +        if (!marker_seen) {
>> +            if (strstr(buff, marker))
>> +                marker_seen = true;
>> +            continue;
>> +        }
>> +
>> +        if (strstr(buff, success)) {
>> +            igt_info("Found \"%s\" in dmesg after %d secs\n", 
>> success, elapsed_secs);
>> +            free(buff);
>> +            pclose(fp);
>> +            return RECOVERY_SUCCESS;
>> +        }
>> +        if (strstr(buff, failed)) {
>> +            igt_info("Found \"%s\" in dmesg after %d secs\n", 
>> failed, elapsed_secs);
>> +            free(buff);
>> +            pclose(fp);
>> +            return RECOVERY_FAILED;
>> +        }
>> +    }
>> +
>> +    free(buff);
>> +    pclose(fp);
>> +    return RECOVERY_TIMEOUT;
>> +}
>> +
>> +static int check_err_recovery(void)
>> +{
>> +    time_t start_time = time(NULL);
>> +    time_t timeout = 5 * 60;
>> +    int time_interval = 30;
>> +    time_t elapsed_time;
>> +    int status;
>> +    char marker[128];
>> +
>> +    snprintf(marker, sizeof(marker),
>> +         "IGT xe_err_injection recovery marker pid=%d start=%lld",
>> +         getpid(), (long long)start_time);
>> +    igt_kmsg(KMSG_INFO "%s\n", marker);
>> +
>> +    while (1) {
>> +        elapsed_time = time(NULL) - start_time;
>> +        status = check_dmesg_for_recovery(marker, elapsed_time);
>> +        if (status < 0) {
>> +            igt_warn("Failed to query dmesg for recovery status\n");
>> +            return RECOVERY_FAILED;
>> +        }
>> +        if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
>> +            return status;
>> +
>> +        if (elapsed_time >= timeout) {
>> +            igt_warn("Timed out while waiting for error recovery\n");
>> +            return RECOVERY_TIMEOUT;
>> +        }
>> +
>> +        sleep(time_interval);
>> +    }
>> +}
>> +
>> +static void print_aer_recovery_status(void)
>> +{
>> +    int recovery_ret;
>> +
>> +    recovery_ret = check_err_recovery();
>> +    igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
>> +             "AER error recovery timed out\n");
>> +    igt_assert_f(recovery_ret != RECOVERY_FAILED,
>> +             "AER device recovery failed\n");
>> +    if (recovery_ret == RECOVERY_SUCCESS)
>> +        igt_info("AER device recovery successful\n");
>> +}
>> +
>> +static void log_status(bool val, const char *err_name)
>> +{
>> +    if (val)
>> +        igt_info("Injection: %s Success\n", err_name);
>> +    else
>> +        igt_info("Injection: %s Failed\n", err_name);
>> +}
>> +
>> +static bool gt_uc_wkr_parity_recovered;
>> +
>> +/**
>> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
>> + * Description: GT Uncorrectable Unicast Walker Command parity error 
>> injection
>> + * Functionality: error injection
>> + */
>> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>> +{
>> +    int fw_handle;
>> +    uint32_t error_counter_before_inj;
>> +    uint32_t error_counter_after_inj;
>> +    /** TODO
>> +     *  Fetching node_id and error_id dynamically is pending to 
>> implement.
>> +     *  For now, using
>> +     *  node_id=1 (uncorrectable_errors) and
>> +     *  error_id=1 (core_compute)
>> +     */
>> +    uint32_t node_id = 1;
>> +    uint32_t error_id = 1;
>> +
>> +    fw_handle = acquire_forcewake(fd);
>> +
>> +    error_counter_before_inj = get_counter(node_id, error_id);
>> +
>> +    /* Arm the injection sequence. */
>> +    write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
>> +    modify_reg_bit(mmio,
>> +               WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
>> +               WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
>> +               true);
>> +    modify_reg_bit(mmio,
>> +               MC_PKT_CTRL_MGSR_3D_ADDRESS,
>> +               MC_PKT_CTRL_MGSR_3D_VALUE,
>> +               true);
>
> Is steering semaphore needed to be acquired before these operations?
>
> Thanks,
> Soham
>
Yes, steering semaphore is required while operating on multicast register.

I will add semaphore support in the next version.

Thanks,

Ravi Kishore K.

>> +    igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity 
>> error\n");
>> +
>> +    run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
>> +
>> +    release_forcewake(fw_handle);
>> +    print_aer_recovery_status();
>> +    error_counter_after_inj = get_counter(node_id, error_id);
>> +
>> +    igt_assert_f(error_counter_before_inj != UINT32_MAX &&
>> +             error_counter_after_inj != UINT32_MAX,
>> +             "Failed to fetch valid error counters: before=%u 
>> after=%u\n",
>> +             error_counter_before_inj, error_counter_after_inj);
>> +
>> +    igt_info("error counter: before injection=%u after injection=%u\n",
>> +         error_counter_before_inj, error_counter_after_inj);
>> +
>> +    igt_assert_f(error_counter_after_inj > error_counter_before_inj,
>> +             "GT Uncorrectable Unicast Walker Cmd parity error 
>> injection "
>> +             "failed: before injection=%u after injection=%u\n",
>> +             error_counter_before_inj, error_counter_after_inj);
>> +    igt_info("GT Uncorrectable Unicast Walker Cmd parity error 
>> injection successful\n");
>> +    gt_uc_wkr_parity_recovered = true;
>> +}
>> +
>> +static void inject_error(const char *injection, struct xe_mmio 
>> *mmio, int fd)
>> +{
>> +    igt_info("Starting Error Injection test: %s\n", injection);
>> +    if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err") 
>> == 0)
>> +        wkr_cmd_parity_err_injection(mmio, fd);
>> +    else if (strcmp(injection, 
>> "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
>> +        run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
>> +    else
>> +        igt_info("Invalid Error Injection specified\n");
>> +}
>> +
>> +/**
>> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
>> + * Description: Run a post-recovery Xe workload after parity error 
>> injection.
>> + * Functionality: workload validation
>> + */
>> +
>> +int igt_main()
>> +{
>> +    int fd;
>> +    struct xe_mmio mmio;
>> +
>> +    igt_fixture() {
>> +        fd = drm_open_driver(DRIVER_XE);
>> +        igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
>> +        xe_mmio_access_init(fd, &mmio);
>> +        igt_require(xe_mmio_is_initialized(&mmio));
>> +    }
>> +
>> +    igt_describe("Inject GT uncorrectable unicast worker command 
>> parity error.");
>> +    igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err")
>> +        inject_error("test_GT-UC-unicast-wkr-cmd-parity-err", &mmio, 
>> fd);
>> +
>> +    igt_describe("Run post-recovery workload after GT parity error 
>> injection test.");
>> + 
>> igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
>> +        igt_require_f(gt_uc_wkr_parity_recovered,
>> +                  "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
>> + 
>> inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", 
>> &mmio, fd);
>> +    }
>> +
>> +    igt_fixture() {
>> +        xe_mmio_access_fini(&mmio);
>> +        drm_close_driver(fd);
>> +    }
>> +}
>> diff --git a/tests/intel/xe_err_injection.h 
>> b/tests/intel/xe_err_injection.h
>> new file mode 100644
>> index 000000000..d7efc2fd2
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef XE_ERR_INJECTION_H
>> +#define XE_ERR_INJECTION_H
>> +
>> +/* GT Uncorrectable unicast worker command parity error injection */
>> +#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
>> +#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
>> +
>> +#define POST_RECOVERY_WL 1
>> +#define POST_ARMING_INJECTION_WL 0
>> +
>> +#endif /* XE_ERR_INJECTION_H */
>> diff --git a/tests/meson.build b/tests/meson.build
>> index a62f447df..0f090dcee 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -292,6 +292,7 @@ intel_xe_progs = [
>>       'xe_debugfs',
>>       'xe_dma_buf_sync',
>>       'xe_drm_fdinfo',
>> +    'xe_err_injection',
>>       'xe_eu_stall',
>>       'xe_evict',
>>       'xe_evict_ccs',
