Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8311DC982DA
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 05:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177FB10E1CC;
	Mon, 21 Sep 2026 05:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eq7d6AL8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4055010E1CC
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 05:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789967816; x=1821503816;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MRWUhH2lWdP1r16vO6vhXDrx+b3i4ZihcAq1inulqIU=;
 b=eq7d6AL8d+MKzvsQtK9LdPx4ZoOzPnoFZjUuo35NWS5eWTEDbYnV3Fuf
 VxCCgj3u5+N8ZBU+++qUbC6VJwf7v6fLaSCQ35xeP+wv73vDvcF2qATNL
 9ZqhgWFTuT6qkdYK5QMaopvj9h2mYOLwPiCx6cXYpPzLijUEfYpU/iooG
 ekAb3/vXq6RsgzqWIyo0HJC3DfhsV+HDoNmBcEsWhnuO/sU0bxQCCHO2V
 lYZ7tCiU+lsTkwA0GgUTh2LGzAjF7xs2BFmOdSkf84NBsWRogc1L+AXUT
 c37o0UBZH9eT1SCfU6nWY7gFCsin8rgiB9hokX7FhRg2h4SqxQBrTccw6 Q==;
X-CSE-ConnectionGUID: cANB2mgPQnGBHbVPa4ZTWQ==
X-CSE-MsgGUID: b/Id3Er4T5SLXTA4PwRPAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="115988043"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="115988043"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 22:16:56 -0700
X-CSE-ConnectionGUID: k5R8E6OKQ82h/30dRMbmKg==
X-CSE-MsgGUID: 87ADEhpHRbePEQymoKzyJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="280559500"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 22:16:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 22:16:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 20 Sep 2026 22:16:55 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 22:16:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAm1tJpwV/j0WUUg4QvjkN3Sc6BnKf4s0CchywG+iVCsvlHDSV28PDduSSJ+gwSOOcYm5tBXFs5rMX90L/eIXx5y9CNofS1AvqCDHff/sYqr1YQoMHfyd/FODr2zUrh59vWybcUj4qSh+Qwqh8pRUbRhPdvXZUMeOFUXGVBpbIfySLj8G7n2IJ+U+o1NJiZTPiNDi7J4eT2uuFpzpgGrCmqpx4aKiFvHP8wOg9vAJTRWsh70dkS5XTjOiagTuqP13wowZskyzFseL5fN0PrGahgDZLQYbrPYncq/5A8/ZFPURY6UDiHEFmrWaUGVTf5pB1AHMMT3jdfHvgGCDmFsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnrnXx1uP9o3dNElcTkxCD18BrfoA2oGnng+qHmh1R8=;
 b=W99Rualx6yt/a76s1SG/qWwt0nShkiGts7h2C2+dkm37WaSbNqjkCHdvKZVxjLcBM564lxrdcToMUQwcrJlfqLOLlVv3YzdqExgovqGBzYP591mjg5dJJiObojzZvOlvnaK95KnnfmHoUsb1kt25d9tGdXIjVtZ1ZUEfXhqOAM62MQD8nJNrHZkj8O/jG80TwMupFKZig+moqYHqzD8sgYBgSW7uOhV/Lov/yQdJzWhWT/mdf/N/up4Sx4QTNDtSK/rZkFTK7nd8F7GvSzpEPoWxxVMoqIEm7gB5OEZwnY4G1HHylJgEWGhHq5eY+ajrjGJcihXUWnyslsJpZ2iTsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB6566.namprd11.prod.outlook.com (2603:10b6:806:251::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Mon, 21 Sep 2026 05:16:48 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 05:16:48 +0000
Message-ID: <6168ce1c-3b9f-4072-8c23-7b0b3f8e7eed@intel.com>
Date: Mon, 21 Sep 2026 10:46:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] lib/igt_drm_netlink: Introduce DRM RAS Netlink
 interface library
To: "Purkait, Soham" <soham.purkait@intel.com>, Ravi Kishore Koppuravuri
 <ravi.kishore.koppuravuri@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Gupta Anshuman <anshuman.gupta@intel.com>, Jadav Raag
 <raag.jadav@intel.com>, Nilawar Badal <badal.nilawar@intel.com>, "Koujalagi
 Mallesh" <mallesh.koujalagi@intel.com>, Harish Chegondi
 <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-4-ravi.kishore.koppuravuri@intel.com>
 <4e07ff06-6b3f-4d41-ae82-1a1458ceca1a@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <4e07ff06-6b3f-4d41-ae82-1a1458ceca1a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0215.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: cafece89-8d52-4959-0888-08df179f8935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|10067099003|4143699003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: p/kVR3qobeCq94C8qZKI0kjZ8E7XJZg1FRjlHcxe5hw4v/bhsfEmGHs+RHSV4ZCseqB5HLigNHkRK/5p1HuiqAmpyfs6biWnPsmZ4OxWpRgAAMI7rCUK7bk5WAzFGBXBUGQGFnEcEeOaiS4O+RN2JPmCb3cjA5PUyoTi5zmXf8sP+i7gKEKYIOCkypEUe7L2LMreW1Vg5U8FLeCUEiQPbO83sjIy1rvshx+JgZkBN1jrz5IBMgvmirimxxUeqQspKuYp0Brp4SJQXSm9YoIEYZTyEcSjrue9AoIfInkvdi2iQSAYRTFmr5iPxe+athO7jhmikmO1DnDtPkL0ITfub5uCFCKE78T23CFea2tE+sYIQq4GPyoa3LrusZi/2adgCWoJyF70TowO/EcdlQbe+hoeAC7qR27kFMwQ88LVWXKtbrOuemQp6sHk7iRUwvQhPFAuLG/p5OVg53hZoYUJtl8J5j9XMFyJH07BwDWEa8fWIjiYOzOADuAPjbSssY7G4tlbWjF86bD08l4d4RA5JWJRa6QBGYk9veGhX2REih4HXm8hwuhKDNTGsamTJ7PA0QQxBYhouJMThOw11+zQhbVeR1ogpP78ins+mVcwsvwEfExiwfbClL6Njk/23SLq4ZqyBCRIyF4e0V8B/kSUGfgKggmxGMICR8baGXFHO8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlZvVS9KaHBVRGIwZnh4VFZ0TThWSVRud1J6OFI4VEcrRDFTd0dPZm51QlF2?=
 =?utf-8?B?Q0NjNEh2V04weU42SUpEa1hDRW95bWtDVEtyMmpaT1cvZndjeGJTRlVGTDdE?=
 =?utf-8?B?WUVhU05WV1A5c3htbWdUczdSVGZLM0NHUHRyWmdIaWczUU9YMm5XdzBJRGlV?=
 =?utf-8?B?Uk9MZkUyMFc0WFZqZjJZWm4wMW5lWmdJNFZRYmt3Y2o4Q1I5ZENHRzhudWVH?=
 =?utf-8?B?ZS96aXhqQUNVeVVMMDFyVFI2QXRlOUw5alZ6OXBCRVJoR3Q5Z29FSG1GenV2?=
 =?utf-8?B?WUMxODNrOVN4T0R1NFVpeVEyMGZ0bE1lajJVTW8xUERSUUJEemVnZVpoVUNK?=
 =?utf-8?B?QzZLYTVNZktlZ29SN29KenNmMDE3MFpycmRVRy9BeUhxYmlUU0kzV0laVWJK?=
 =?utf-8?B?MDdlMFNxRlFtcDR1Mm15NGYvK29VeERrdFVuWUgxdHcvaGxDLytGVHBaNFhY?=
 =?utf-8?B?VWZYVEc2TzRnQ0p2SE9LbFhRaHg2ckJxWkZJT1ZwZCtNdEZxRmdZby9NU2NW?=
 =?utf-8?B?ODV2QVJoNmVtYWVHMGpDSjBuaDc4OEtFZlVEYm5wK1pFNlFrcmg4R2tGV2px?=
 =?utf-8?B?QkRBU0lXck4wcURjYTdEZjV6SEJnKzYxQVZyd0FxYlZXY2xYT1ZUTjRZSEZs?=
 =?utf-8?B?K0xobS9QTnF1VmRTNjJoMVdsVG51dWhocFVSamVxdnpqOTJWYnBaUG1ESVYw?=
 =?utf-8?B?aVRralVOWktZSllOZ1lRZml5YXJ0YlRuNy9EVDRHZml0YjMyZlg4RnJlbmJC?=
 =?utf-8?B?OVRQN1VHa3N2ZTZYT2pmNDhpRVR2TU82a3dNMFIyTFF3OExuNDFXWkVicUFR?=
 =?utf-8?B?dkRiT0UvWFpxQ01pNVdmVGkrRmpsZ043U2FSVElvMnAzK0VvdXhWWmpCWCta?=
 =?utf-8?B?NWg1d01SalNScXZpMU9QNW94VlRDc25uVGZuS3prNGt5OUpTYWRtODZMRkg4?=
 =?utf-8?B?WjdVUlFCZjlGWmJNbmd1K0NpcVFERnpScjVrSUlqQ3dhYUx0NEdRd0I2ck1a?=
 =?utf-8?B?TUZhZkk4ajRrcXBtYWMrK3hycWd5blpua2dRaTZNNlBqT0VyN1ZGR3ZTQ042?=
 =?utf-8?B?azlPRWtVRTJ4dkVSc1VUYld0aWF3ejgwMTVMZ3NMV1o2dEdnVmZCUmJzR2N3?=
 =?utf-8?B?T1FOeklhbzR1bUFEVjQ1VkFpYzVmaWRjdGdkbDVxRzI4a0I3RktTa3EzQW52?=
 =?utf-8?B?K2ZrcStWMWxHSW9ISlJ2U0dweWw0bGdFeldSZXg0SHNrdlhFNXFydU03RnZs?=
 =?utf-8?B?MDlpcnQwcWIrSHdHaHE2alFCa3hQeVdKdXJJNmFxQ2w4cXYxb1RRdmsxUkR1?=
 =?utf-8?B?T2h2OEYyYkh2N2NaSFhkZ2N3NVJJSFJlcEkyWUQybDNscFdWSE8vN1poOWpE?=
 =?utf-8?B?WEk1Z1Z3OUpuem1iM1lHTUUzYURYRHdTZ2FVMW01dlNWQXBBUHNzbDhFQ3A5?=
 =?utf-8?B?dEwzc3lJeGxzK0tzYmltUktxYmtpTW5yVzdhKzIyY2JyenJhVVJ2Mk8vRXcx?=
 =?utf-8?B?WUE5OEhZMGV0MjY4bDNyQVduQWljckNxYWs0YURVc21zWkhKZk43NDN0UFVD?=
 =?utf-8?B?U1BiMFcwMjg2aVRJVEIzM0VlaFVpTmgrQzhreExzZFZGamlRNERxTmhMSGF5?=
 =?utf-8?B?REJaT2ZkdUNaQ0JCY0QzRUdjZ0crNENqdzMvYW9lV2tKZjFOSVlsaVBySzBw?=
 =?utf-8?B?bHErYytGYXNUbUEra05hckh1MXdjV0tNdXloakNaaS9tK3BTSWJiV2tFdE8r?=
 =?utf-8?B?Qm10YUQybzhsUmNiMjNZcHcvODlrcHQ1QjNhdHcxYkpyclB6Tk5kSWJ3Uzlu?=
 =?utf-8?B?RlROTUpTRis3NHdMRnNVcUMxMmh2ei9mekpEaExuVnFLRzV6aUpOWGx1bXAv?=
 =?utf-8?B?R25Pa1NTSzFvZzlBK3hNSDBNSGRnQXg0TUJySHNiMmZTd1NDcVZ0NEVXSm9r?=
 =?utf-8?B?YnB1MGVPRzNWbE0vd0dXZHF4NXhaR0RCR0twYVVSdCtWK3hycHYzT1lwWHcr?=
 =?utf-8?B?VVZiRGRralJsWlhHazk5TWFEYi9Oa2JxUkpLRE9Ed3AyNkpkcS9tSDFMNFl2?=
 =?utf-8?B?SXRGbFpUWWl5Z20xWDBUNFFaK2t6NzRHQVQ0MFB5eWQ3aWc3TmNub0dJS3hB?=
 =?utf-8?B?bHUrdGtMWSsySVJ0bUV3aHBlSTB1b3pZUk5rU0sxQU9OM3I2bi92YzFGcHVp?=
 =?utf-8?B?dE9sZ2FLanVHTE5aUUp6Ukx4cGFjbkZqcHhNcThnZE8vcSthWWsvdjNpNnpO?=
 =?utf-8?B?Q2d5bTRhZFg3Mys3YnNlQWtJanJHdkVFODllTVZzbjlNYTJJSU9INFEwTFhv?=
 =?utf-8?B?bVM4MlppVDN2RVVRWkxNQ3BveStlZmRvTW1VV1p1VENVSkI5RjZlQT09?=
X-Exchange-RoutingPolicyChecked: Q9ZUwxMc35GlfkuWOFhFRFDesghMqDf8Wbqbpm5D79/W6tIbI7KokDtsAJvWAux2Yy72dMRs0DykFvYa/I318aPIfupgStegmj1XP7S7v4bZAQ03Ha1YMGCbSUEBPSzmYe9C2/YXREgrbwkQGC1BOOHZ1UdwfWBSs+mWS3MtPVTJzZ0fcLPUGQT7dAB/XvrGrjy4BWgvRRPAUU/cIRmK8TP9ifN1ntrBxwUoAiSiAuImTJXLxylHEYfkKDNqxRHZS+aI2VKLkvZJlI8CDmF7g7YoGiuAFeqNhKkVNdSe9P15Ig3iQeNr75sTYPcBQAC6q6XjJ0G1HvLSgnQyxDWWpQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: cafece89-8d52-4959-0888-08df179f8935
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 05:16:48.2636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjjO5JrUxL93dVuOhUjk++CIyutPlmno+gkEgtmCn1gcms12/h0+IifT7J7tPMTzoJJIPs2VnzD10QKbUQYraw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6566
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


On 10-09-2026 11:47, Purkait, Soham wrote:
> Hi Ravi,
>
> On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
>> Introduce an IGT library for communicating with DRM RAS Generic Netlink
>> interface. Add helpers for Generic Netlink socket initialization and
>> cleanup.
>>
>> Cc: Purkait Soham <soham.purkait@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
>> Cc: Jadav Raag <raag.jadav@intel.com>
>> Cc: Nilawar Badal <badal.nilawar@intel.com>
>> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v4:Renamed library function names prefixed with igt_drm_netlink_*
>>     (Nikula Jani and Kamil)
>>     Moved the headers to other commits which are not necessary in this
>>     commit (Nikula Jani)
>> ---
>>   lib/igt_drm_netlink.c | 54 +++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_drm_netlink.h | 20 ++++++++++++++++
>>   lib/meson.build       |  1 +
>>   3 files changed, 75 insertions(+)
>>   create mode 100644 lib/igt_drm_netlink.c
>>   create mode 100644 lib/igt_drm_netlink.h
>>
>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>> new file mode 100644
>> index 000000000..709c01987
>> --- /dev/null
>> +++ b/lib/igt_drm_netlink.c
Use drm_ras_nl. Would be clearer if any other netlink in drm subsystem 
is added.
>> @@ -0,0 +1,54 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <stdint.h>
>> +
>> +#include <netlink/genl/ctrl.h>
>> +#include <netlink/genl/genl.h>
>> +
>> +#include "igt_core.h"
>> +#include "igt_drm_netlink.h"
>> +
>> +void igt_drm_netlink_cleanup(struct app_context *ctx)

Same as above

>> +{
>> +    if (!ctx || !ctx->sock)
>> +        return;
>> +
>> +    nl_close(ctx->sock);
>> +    nl_socket_free(ctx->sock);
>> +    ctx->sock = NULL;
>> +    ctx->family_id = -1;
>> +
>> +    igt_debug("Cleaned up netlink socket.\n");
>> +}
>> +
>> +int igt_drm_netlink_init(struct app_context *ctx)
>> +{
>> +    ctx->sock = nl_socket_alloc();
>> +    if (!ctx->sock)
>> +        return -1;
>> +
>> +    igt_debug("Socket allocation successful. Connecting to Generic 
>> Netlink...\n");

Not required. Even if needed use drm_ras netlink.

>> +    if (genl_connect(ctx->sock) < 0) {
>> +        igt_drm_netlink_cleanup(ctx);
>> +        return -1;
>> +    }
>> +
>> +    igt_debug("Resolving Generic Netlink family '%s'...\n", 
>> DRM_RAS_FAMILY_NAME);
>> +    ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
>> +    if (ctx->family_id < 0) {
>> +        fprintf(stderr,
>> +            "Failed to resolve Generic Netlink family '%s': %s. "
>> +            "This may mean the running kernel does not expose DRM 
>> RAS support.\n", 
"(%s) not supported, DRM_RAS_FAMILY_NAME"

Use short sentences.

Thanks
Riana

>> +            DRM_RAS_FAMILY_NAME,
>> +            nl_geterror(ctx->family_id));
>> +        igt_drm_netlink_cleanup(ctx);
>> +        return -1;
>> +    }
>> +
>> +    igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
>> +          DRM_RAS_FAMILY_NAME, ctx->family_id);
>> +    return 0;
>> +}
>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>> new file mode 100644
>> index 000000000..0e563e55f
>> --- /dev/null
>> +++ b/lib/igt_drm_netlink.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef IGT_DRM_NETLINK_H
>> +#define IGT_DRM_NETLINK_H
>> +
>> +#include <drm-uapi/drm_ras.h>
>> +
>> +struct app_context {
>
> app_context is too generic for a non-local type in a public header. 
> Please prefix it with "igt_drm_netlink_". e.g. struct 
> igt_drm_netlink_context.
>
> Thanks,
> Soham
>> +    struct nl_sock *sock;
>> +    int family_id;
>> +};
>> +
>> +void igt_drm_netlink_cleanup(struct app_context *ctx);
>> +int igt_drm_netlink_init(struct app_context *ctx);
>> +
>> +#endif /* IGT_DRM_NETLINK_H */
>> +
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 7248bbc2d..70da9a4a0 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -27,6 +27,7 @@ lib_sources = [
>>       'igt_device_scan.c',
>>       'igt_drm_clients.h',
>>       'igt_drm_fdinfo.c',
>> +    'igt_drm_netlink.c',
>>           'igt_fs.c',
>>       'igt_aux.c',
>>       'igt_dp.c',
