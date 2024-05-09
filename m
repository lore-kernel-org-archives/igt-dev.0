Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8523DC10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 05:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7B110E0BC;
	Thu,  9 May 2024 05:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbwO0sRg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D909310E0BC
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 05:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715231906; x=1746767906;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+ItiTjWegPVHfy4y25eqhzjpTj2N9Mk37laIGXvDTdI=;
 b=MbwO0sRgrxLMqhoC71MfKfxjVuCxREpJYsqBDcEeGdmxp8RiUvyW1WUV
 o4JfyUdZyCgfo5dufPtxgmXMYPI9HrfbONPb3d81Yz08ySdzEHKQCSD8x
 Zzj4Pdpy9lxiycj10I6m6kXZ5GiNLoyUr9VkL/IXxfmPJFTnv+4jsXqdd
 lclr8W1j3ENddyN1WcZwQfD0TDG1IwmFT4/G4+YlUuv8r/3cRhLjNrR6M
 On/b4+MXeZOwTEvDfigq9zjxJBfmaB9qhJEtpGLOOhhDDp73YvH37rtEU
 DZuUImWYgyPqAP1kjGQvyNyEAVka7ldd1y1kQLhGZBiFS61OCZRQmw8dn g==;
X-CSE-ConnectionGUID: 4PSOCGkkRfWRpy8ii0PA4g==
X-CSE-MsgGUID: ZZLykA/HSHuq8QrlGV2yRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10981023"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="10981023"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 22:18:26 -0700
X-CSE-ConnectionGUID: yAnL4qCmSiC1zZAcn4ezaA==
X-CSE-MsgGUID: oBTEPp90TjqtqQu06cvGDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="66556463"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 22:18:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 22:18:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 22:18:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 22:18:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 22:18:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P41i+0cCkY1LrGf7uJ3rft2//J+n3Z05SBd19Nez0+/OCmuCnII16lYWun5y0BYJlCFIV3IRGtYVtz/3p12lVmw/5cLWfh6Fiy1DWMhDOmauC2OcoW2yG+FNmoNsJADXL/OqdurttJCKUzYc3Gir/Rb6wH6Ecgsu2tcE6Vm6ZCoWko5F38Wd0UstCM3bAgD1Kijhy4UJFQFMCfM8XICksDD0MCP7xs0hDS32iIZ891W3KMRPB81H7vN7piGsl2cjmubplh+7gSiPNqMG9SL1Azsj7+0uCbAJxMWng0mOJhAwZ6Ub4+QcJcWxRT5tADOicWuX8RM54035g3ddEe4ZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bviGkPAXjS+3nZ3di9OmVzyCjNgU/XYsiW92JNWIKRw=;
 b=P82hd507OZPMjX27GJ4MQB/HV8XKzXeIwf4SqB64sd9T/vLg2S0l0zB+cr3coszgVcyzYJ5uHrkB50hsP8/+XL9awH6GAyYOvcSiuLg5DnvQk2BcHmfPk41kzFJ+PaCmI3djBzH/yd2nv65ScYB4YEsTz1gmtQDbisdIhoe49CaUF99cBZp1U5UUyT6JXso6/T/osHQevCdbJnHV8v7wG2+QWoGsmGe7x/ch3LNrtx9KMoJrS4r/Q4xeATRFwlr5O2XWYbw1obY0asbQl0TWlkTFg6qkhFeb/0nfYDFllw1CqOpscJW4ORtZPkRiZh7wBaVnBpSLb9FbUhZdm/UXww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by IA1PR11MB6075.namprd11.prod.outlook.com (2603:10b6:208:3d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 05:18:22 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%6]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 05:18:22 +0000
Message-ID: <b82416f5-c3f5-4688-b3f0-38367546a3eb@intel.com>
Date: Thu, 9 May 2024 07:18:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 11/11] tests/xe_intel_bb: Use supported tilings
 instead hardcoded ones
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240508125443.404402-1-zbigniew.kempczynski@intel.com>
 <20240508125443.404402-12-zbigniew.kempczynski@intel.com>
Content-Language: en-US
CC: <igt-dev@lists.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240508125443.404402-12-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0164.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::18) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|IA1PR11MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: 41276bf4-38d4-49ed-a5b7-08dc6fe771f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHdyY2plWWhvR0w0Ym45Zlc5d01vRE5KVnpCSE5wTENDNFBySkh3dnVGbzRQ?=
 =?utf-8?B?NmJTelprK1g3R3JCdVJtTmNva2JOaHM3T3dqYzhMcHhMTTg3cEsxbXdsRmdL?=
 =?utf-8?B?RWE3MGRvUEJwWXBkcXBjU25Mais4WXZrS1B2QStXTmNWcGhmN3oydDQ5Vjlw?=
 =?utf-8?B?RmpTNFREQWlONzVGQkhRUzMrN0RtYlhxaUFHSGdKVjRhS281bXUzelk1L0FY?=
 =?utf-8?B?NmVJcE9WdmQxeTdVN1ZVVGhxMDZiYk82NDkxWjFrSU9kL2tocVRobU1Jb09J?=
 =?utf-8?B?bGU4T0hBSkJrVzduNmVPTE02aGVPTTZFUlRsYkQ1ZXlLNGE0b2g0TkpxUklW?=
 =?utf-8?B?RTduMFIwaEZhbjY1L3FZMmlXTjZTTXR2YnRETldkZ0d6K0Zseks0M2Nmb2lH?=
 =?utf-8?B?Tkg0VVhNU25yeHFkUFlsSktiSlh5Z09xNkQrL3lmZWpDUW1pRUZOQVpUcjN6?=
 =?utf-8?B?UTNGOGVoMG9lUUhWWElpZkxGc2lSaWRqa2dtRmkydEhDTEFNTU8zVDdueTlo?=
 =?utf-8?B?NVBUcHdYWXd3UE1XeXcrN2RCeWJiSFYzTkNWYVorbmpxQ3BUeXpPdTRUQUVO?=
 =?utf-8?B?OFAzSzlJenljeThEeGJvQm5yenIvRTVVLzVFLy9mSWs4M3NTWGg1d1RUS3VM?=
 =?utf-8?B?QWlhcmZ2UHBmSmVSVXQySGQwY0RaT29UUDkvbVduNWgzbFdBditGWlZqbUF6?=
 =?utf-8?B?bldwdnpHQm80dW9jZ1NRZTNJdWYxczFaTWVFMEJrUFlLREZ5OXV5d1ZrenJj?=
 =?utf-8?B?eDVtdlBrd2RpK3oyMnN6R1NCeWN6Z01sb1RqeXJ0Z1I0WmMrY1dNNmgwVHdO?=
 =?utf-8?B?QnVwN1A0d2lkTkQwdWZKWWpIeE1EODB4bFhvRVRWWkZKRlpyMFdMcGpWREFw?=
 =?utf-8?B?TGIwbDVsTWh2MzB3S3JVRXZYcGtMKzl4bjRZc1E5dGoyd0IzelVNRm12cisy?=
 =?utf-8?B?NDRqSTJGc1FDbWtGKy9QQ0tZQWswUVBpRWtEWjVvYzA1SitrRVZ6MnJjcUtq?=
 =?utf-8?B?cWVKYXBWODlqQWs0cDRzcXZGY0FRU2ltZVoycHVvbzh4b2c2RzdyWmE2WGdT?=
 =?utf-8?B?SUFwZFFUd2MzY3JTdzduMWxmVGo0WmlFVlRWUlVXYkFrZ2pJdGRjaldsbTlK?=
 =?utf-8?B?STlTazd5YzE4RW9vWDNyRTVIMUk5cEtzQm1USEcveURZUUpmeUFKa3VIejBJ?=
 =?utf-8?B?Wkk4VjFjczdab1hreDdDNkgxSmlMamJMdi91a0pqOUhnK1liSEErQUZiOFox?=
 =?utf-8?B?ZWw5NjlyNWt0c2lUa29ZWDkyZ1l4T1dHK3NUUFdmUEk2ZW9DU2N4Rmk2VG14?=
 =?utf-8?B?WTVobHhtZVo4Z1JUL1lUVVdjYi93V1dJVGNJa1ZzS0N6T1Q5SGlacXhUbHRT?=
 =?utf-8?B?S1BmWHA2aXBCU1U0bUVvRkVBSTVCMVVBOTlhemNCQ2hTREZTUTNRMHVuaEZR?=
 =?utf-8?B?eW9SS2QxSTZFOWl1WGdDbGtNdWIwdjFRT1dOUDV1NEVOWVF1Z1lVSzI2TXM4?=
 =?utf-8?B?cGtGSktJT1RzRFlrQTZFcXhLSFNXWG00c21QR01WMFpzM3FwV1ZnZVdtb09F?=
 =?utf-8?B?eHdYb1FzeExEN2MxcUp4WXZ4UVR1UTNJcWIzL3RWWTRMOElaRUtLZmZzMFNY?=
 =?utf-8?B?RG1SU1ZYQXdmbjRwNnJENzc2OHpUTUlOdWY2U3kvRzU5OXh1R0dvL2pnczkw?=
 =?utf-8?B?WHlOeSt6Wk00Q3ZpQVlFOXlUclFkSHNjVEdIZ2R4bGVpd21kSnhtRnhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUtNYlpmRUtzandBNWprQjh1SVFueGlTdjMrbHB5M0VvcXp0VHl6cm9aOENt?=
 =?utf-8?B?SE5MR09TelhadU9MM2RZNm8zZ04yZkdlZGs4UDF0UW0yZzUyeUVmb0l3ZEc1?=
 =?utf-8?B?cnFlT3FqaThCT2RVelNESXh2QVRUNGpNUHdlYVFia2NGVnZGdGpJMTNyRUl6?=
 =?utf-8?B?elRtQXpOM3FPU2picEUyOFR1Z2lUYjVScXpQUytOeGx0SG9lQUJxNkQ2OFZQ?=
 =?utf-8?B?V3IwK0lCbG9WNFdCdDl6YWRBd1oxMDhrRzlmbmgxVHpxOEcwM1JFaUhsdndU?=
 =?utf-8?B?LzFNS1F4TnJCTERoVW41Sjc1aDlvc3c5dC9xUEx2TDB1UWpFK3JsSmpueWRJ?=
 =?utf-8?B?RGIraTRHV0V1N0JXc0NKbFdOT3BHSHlVNVFNbU45Q0NCaEk5d2psRkIwNTdJ?=
 =?utf-8?B?b3pDWEFZeWlxdzVEVklyaGVjeTFaMzJPejRWZkowNDNCWmRJSFdjOFhLVXFT?=
 =?utf-8?B?Y05BVmxXVXhDeERPYnJ2YitQcExxSlRrVHRQWkVHUEFiRnFYWm9EU3BzTGZj?=
 =?utf-8?B?OEtidXdRZ1BqQkd4dXh3aW95MGxSdlRqbUVPajRuMkhBckRaUzVxNTJ6K2sx?=
 =?utf-8?B?NE5qc0lCUy8yYlU4S1V0d09WYVhaZTA4Z2VnUEN3cW5ncGpYdElrdkwreVF0?=
 =?utf-8?B?OHoybXpudWgwcnFJejNCbnBjUjdjNXFzTTZlNXh3SGQ0OHdOM2p0VFlmcVJU?=
 =?utf-8?B?VDAwS0lZOHVHcTRiSlNLYnY5QnVpbHlZT1pYR3gydGZ2Qk9EZEhEK2RZQzIx?=
 =?utf-8?B?dkRVYVUzVGFVRHhrY0pGbEJJRVE3REQ0Szh0NGVMQmEvcHFuOTFPYk44NkJG?=
 =?utf-8?B?WXRWbWtXQ2Q5WkJZLy9oOWl2T04zRFVuSVBGdmdvTjdHSUYwSjJFU1RKOUpZ?=
 =?utf-8?B?dXlrSGZkUzlxdlFDL01xYlVNNTdIR25GVXF2ZFE4aTlLNnd0NG9XT1NDMDll?=
 =?utf-8?B?QmJmSENBVXc3MjM5U0Q4bklmOG9BNU5ndXNMN3dla0NUQ2ZkSDl3S2JyWStG?=
 =?utf-8?B?dUJmWjl2YTZXa2VkODNRM1o0a05UZmUxb3FpYVR0QVBWdHdiRHFXaExPMzZ4?=
 =?utf-8?B?RlhLbXFFK05QZGpKc3BQbE1nbm1ZK1hQbkpTT0E4dXpJRXRsL2VKQW5DTk1S?=
 =?utf-8?B?ZGRzeFdSWFJneFZ1ZGJOV3pEc1htWE1uMVQwUERlSU1nSlhUY1NPMHArTUFi?=
 =?utf-8?B?UXdJWTBjUzN5dWlleTVYbjRJNWN6elFSRDFuU0p1dVdmOHdEY1ZBMHdjbEpw?=
 =?utf-8?B?czFld3NoVnlJcHJWSnUxK3hKbm9ZRHczUjFQd3RkVU5HKzRDZzVPTHQ2ZjFz?=
 =?utf-8?B?eGxGMHVTZDNvYWpPRnNhY3BreS93RDFqM1lXNXJiZlQwdTE5RVRHcVVmZTBl?=
 =?utf-8?B?dW0zcVcyVHcycDRQMjUzc29Cd1lWNlhINGNGM3lFS2ZlZ0d5ZjlXalhUenZm?=
 =?utf-8?B?MnVZbVhYektSRXh1U0JnT09iOWhOSlQzRU9pMW0wc0lKZTVyc0JVYVR4WW9O?=
 =?utf-8?B?NUZFMlQ0TGFuZm52UFNKb1ROSGc1TE5DZDJDQWJzaFJjUmMvSTVVNEhtSU9i?=
 =?utf-8?B?NHZsVm1xOEtXUDZCdTFKL3Fielo4ckRNaTNyNmRiR2cvR1hIWHBDUGZPSFRR?=
 =?utf-8?B?S1cybnZNandzUTJoVUpmdnF2L0R3SE40VWxhcUtpVVFEWTE2MGY0TmpBRFdC?=
 =?utf-8?B?Y3BabXZvemgrVHkrc2VSdll0UGR5WjJTSWVreFgrbTA3NGs2U3lyUTl2V1ZH?=
 =?utf-8?B?WUdaODlzYlZGZUJ2T3FLYm9DZ2YvUTI3VEZsSzIwUXdOZ0JoQzVBRWVKdWRE?=
 =?utf-8?B?MVAxbnMxYjZpQjZSUmdJWEFHSVRqTUV5NCt6aUFZdDVmSGcwRW5HaUIyaUt4?=
 =?utf-8?B?UFhHc0pWbXRpRTR4eWdLYlZnaktDYWVvempPb1JpZ1FPU1FwbGhhWUVpNXhl?=
 =?utf-8?B?SzRqSkgySk81ZCthYWk0dkJIUnM4S2lGd0pONmdpdEpyeUlmR20yR1J5Z2o4?=
 =?utf-8?B?RGNNbDVWaERVNmJUWkdFaXVYeFJIN1hNUlBEM0hnS25ENTIrbXBKTXphSWE0?=
 =?utf-8?B?N1NQcE5rZ2tvRnRTaTlaRkd6TzVMY2hyMHY2djh0ZXU3SjlJR09NSUZNNjVk?=
 =?utf-8?B?VHpCbDdOWFh0UTJNenFHWlg0UFhhU0FwOWQvMmkyOWFOKzhpakVtbG96VUU1?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41276bf4-38d4-49ed-a5b7-08dc6fe771f7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 05:18:22.1869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Blm0zS1knmUcWAV0iPr45ss3ngp8Sw9Z/PPCcKBu3tw5xGEg09abICIYjaC08o0LBC/UaHs1HyzXTHPWznZ6CkYTCove1Of1CX/oiNC7phs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6075
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

On 8.05.2024 14:54, Zbigniew Kempczyński wrote:
> Use introduced render tilings in cmds-info to select appropriate one
> on which render subtest is executed.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> ---
>   tests/intel/xe_intel_bb.c | 25 +++++++++++--------------
>   1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> index 09164c41fc..ad6a2d22ca 100644
> --- a/tests/intel/xe_intel_bb.c
> +++ b/tests/intel/xe_intel_bb.c
> @@ -18,6 +18,7 @@
>   
>   #include "igt.h"
>   #include "igt_crc.h"
> +#include "intel_blt.h"
>   #include "intel_bufops.h"
>   #include "intel_mocs.h"
>   #include "intel_pat.h"
> @@ -978,19 +979,10 @@ const char *help_str =
>   
>   igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
>   {
> -	int xe, i;
> +	int xe;
>   	struct buf_ops *bops;
>   	uint32_t width;
>   
> -	struct test {
> -		uint32_t tiling;
> -		const char *tiling_name;
> -	} tests[] = {
> -		{ I915_TILING_NONE, "none" },
> -		{ I915_TILING_X, "x" },
> -		{ I915_TILING_4, "4" },
> -	};
> -
>   	igt_fixture {
>   		xe = drm_open_driver(DRIVER_XE);
>   		bops = buf_ops_create(xe);
> @@ -1053,14 +1045,19 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
>   		delta_check(bops);
>   
>   	igt_subtest_with_dynamic("render") {
> +		int tiling;
> +
>   		igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
>   
> -		for (i = 0; i < ARRAY_SIZE(tests); i++) {
> -			const struct test *t = &tests[i];
> +		for_each_tiling(tiling) {
> +			if (!render_supports_tiling(xe, tiling, false))
> +				continue;
>   
>   			for (width = 512; width <= 1024; width += 512)
> -				igt_dynamic_f("render-%s-%u", t->tiling_name, width)
> -					render(bops, t->tiling, width, width);
> +				igt_dynamic_f("render-%s-%u",
> +					      blt_tiling_name(tiling), width)
> +					render(bops, blt_tile_to_i915_tile(tiling),
> +					       width, width);
>   		}
>   	}
>   
