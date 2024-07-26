Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B88C3DA63
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 06:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED8210E925;
	Fri, 26 Jul 2024 06:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBLKxdIF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DC210E925
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 06:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721974201; x=1753510201;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UBN33f9ZfXu4KlfXPdFTPJvSy2+/VAEmjNAzwPEA97o=;
 b=hBLKxdIFtYWUySQZcvzLrh6YK272Ae85PTNuzpQfINU5NW5m4AxnHxLk
 FGnRMgLPPuywZRZZ7f09+YNmbn7HV7n79evIwUwU3ezZ184PUV2NlPr8B
 oZdPv5zP7iCtuN0hiOqJYog2FyEyfWOT2EuRnyVKGaR0C+mHc5DS7MtrQ
 +GMCrp+r+S+RfJDidK3cLdN1fdJZL3eEDGSWchs+SZq62ZSPEU1g3yFFk
 QAlGQCJm3mWm5jjUmy9/2kiA5djaoitCkBDqnLnEROG5h/in23/DKNuW8
 f1TnDHbD/3be4qEoQSwwmg1wbj9M9KAs1k0GtFBnzeXwSgag6DglUqsxe Q==;
X-CSE-ConnectionGUID: R1GpYyTGREOJFrHt8NjHYA==
X-CSE-MsgGUID: xS9W6+kwSyS0Czxrrct0TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="30348358"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="30348358"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:10:01 -0700
X-CSE-ConnectionGUID: NR2zBjlLRyaMFwqPOZF6Gw==
X-CSE-MsgGUID: WD/dTz5cS5mjSc6bjlZYng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="53084737"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 23:10:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 23:10:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 23:10:00 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 23:10:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgahxMDVCKjhrPP1bJvKoBurGh8Qfn3v+BwR9ODsX4obqSAzQ+u5PjSpZzdvbS0Z5/ghyXdm/ebnvjH0ZDb/jcGz7iuRQp3BiLWVK8J9KSms6xZTUpfzxROT2XhchtrZPmB5e7RK+zXhBRMgrvknSEZlrKFrSOr3DekQwOSR60PdaraEk2QmwGh1u7oAakKvEiNXszW5UhEC5bxoBJS2F/U1/z+L1cA8+/zR9r0CeSf0YR/PPP17hL634qpfpR+BEbLZIUFdPbnQPjW+oy9MI0nF3jvL1pSu2ep58Ft/EQHZ2h7QHmVpNGdcHIRd0QiDdfC2JvPFr1+TP/+rVQ+cxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMX3zX1FeDHMdqKWEy+siRAq65N7clDoqYQblhycw9I=;
 b=GtUokb1zoJzm6vKD9WGIyMdjlcSaftHAuhbjLNuRsHtpw+ppGpqP9rsOby138O6Rby0G3UP80Gm09lIi3ko9kG8UICDsoswkiXgG4yfBUvfj7SzAwpNxxEY45QdtYs3iaUcZS8cEZXL0OIU2VBtdVi7Fx+5g1CMt0cLWmYIgW7/RTtQx5NZxWUAHIsnJh5QrI0aOJz5sUldWW5E2XK/qbAprCbKu7wrAI6u1EdOgNwJgDXVLql7GVkXm7De7o6Xz/fKh/9njlnGc4BiuCpaP/ed6QposyLumT1GhszBE8UkGOmZBticqjZFHgcNxSYU04CpZtGp9FXwP+/BjsmOMUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7276.namprd11.prod.outlook.com (2603:10b6:610:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 06:09:58 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 06:09:57 +0000
Message-ID: <e85b67ac-e84e-499f-8d2c-e46723858a41@intel.com>
Date: Fri, 26 Jul 2024 11:39:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/i915_pm_rps: Disable subtest thresholds
 tests when SLPC is enabled
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
CC: <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>
References: <20240725114707.102373-1-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240725114707.102373-1-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: a8fdff54-fe9f-405c-6755-08dcad39927b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUVHL01rWHlHeFRBemZXKzZWbmkvdEMrKzdKTWVjQ2JzankrVllneklVbWoz?=
 =?utf-8?B?eFlBODZWRkh5NlFBT0V3V1FSdWt1a0dMNXVtS0pxSUVxejNobTJDQzNwbkZS?=
 =?utf-8?B?cXY2TUpTamZnZnVjTmVWeEtWUnVjbEMzUWwvOGVrUlg2Q1h3T1kra2hCeWZj?=
 =?utf-8?B?TlVDRW9XVWYvRTNyZjFZWVV4SklPVjd4eUNEeHlOUllBVFdPTVIrT0hNWUY4?=
 =?utf-8?B?TDcxRFYyV1hrbkliRjR5eTZERGxuaE1EMHl4N3BHV2QrVnEwUUVRaU0xbDE3?=
 =?utf-8?B?cm9pdy9JQ1RITXJIRllLYzlHYWlhOXV6dTZtZ0wvVkZEaVRpY0ZuZHltSzhK?=
 =?utf-8?B?ZW50bzY0ZndVMEpacEFZOXB2dmhNTkdvQlc4WWQ2RUdHTmZNZk1MNVpUdFVp?=
 =?utf-8?B?N09qNEN0bVdaclJ0RUpVQzJJWkdycCtWSmJSbVA0cEU2bUQ0c1EvZ0tTQll1?=
 =?utf-8?B?eWxPRTU3UXVoSS9IS21OTXJjanFWUGJKTm96ZngxSGxtaUtrNGt6K2tycjZJ?=
 =?utf-8?B?M05oRUE4NUNKSEdHYkhlUCtnUXpEUEtiUTdyVzhhM1pKdG5XTE1zaHhpbE1w?=
 =?utf-8?B?OGhvKzZMOVo4OE91MS9xQ0pKTERhS3pFS1JYRnY4dXZLK1lPQU9KcDhnWkdr?=
 =?utf-8?B?WG0vR2NjQVI2OUhjaEV0bjRKaEtuUTBTa0NlQVh0SWk4ZVdnSi90WDFQc2NX?=
 =?utf-8?B?Q1dkQWNIL0s0MGdrMFNqL2NrMmJLR2xBZFBhUDNQYUp0UEpIZjIvVTlFOGlh?=
 =?utf-8?B?UnJwMTg5d2JFU1NmbXI1ck05Rm9rNzA5YVF0Q0dwSVJRWkFYWG1GTU1yWG1G?=
 =?utf-8?B?QmtsVTlkcGl2S2dBa0c1UWIvVHZPZWFBUTV3RGFUM1R0TjBJTExqa0hSNzNq?=
 =?utf-8?B?R1R5Q1hFMXhIK1lDc2oxY2hhZ3hWWGNINFYyNGlSWmRmbkRVM1NrL1ozYmM2?=
 =?utf-8?B?SmFlZHdCdDh5a1JJeW11aU9hUjhZUXZGdm1WVXZHMHlUbXVZSnlxaVBwL1hM?=
 =?utf-8?B?RFRiQmdIZmJkaUhyZGpsaUFXOExuWEZsbzEyMkFEREFObW1zMmNueHpsSWxL?=
 =?utf-8?B?MFJnOVVZZ3VnV3BaWkwzd09Jd0VwSHU4cktLMU5zQlVxWWZJcklCYmRHSWIy?=
 =?utf-8?B?ZDBGY0RlTE1jNFR4WXRIUTdJRU9HL1kybFdlZEdJUTE5L1Z4TWd2NE1WOE9I?=
 =?utf-8?B?YkVkMzhGUXNERVd3T0RIbmRUZGJNUnlBcjFZWEhlaThsMHlEaFhyYWZlb0R4?=
 =?utf-8?B?TitmRUVnUFlOZDNhL054cUkyWWordE5nVThJWUVIWG1kVVhYTTFnUGhhTHhL?=
 =?utf-8?B?OGlEQnBoS1IvUFhqZFNDOFI4cklVaWRiMGl0WCtHVkhsd25TTTl5WjUyK0Ix?=
 =?utf-8?B?YWNLRVNnSS9xMWI2WTNic00rUXJIRGZuaGdCQWIrZC9XOER4cHBTLzVDdUZU?=
 =?utf-8?B?T1QvSlV5cVBQOWpzQ2htTnNDMnR0bEd3ZGJ0WE9LamRuRmtzbDhPT0RTakZp?=
 =?utf-8?B?aXdnM3l5RzhSSSs2ZEUrNHk1UDNFSSsvQ1ZFMG1KMDlJN1VsQ1J6aERHOFZL?=
 =?utf-8?B?VVJ0ZVgzRVlMam8xdXB4dlFnenU5UU9pdEhycHd0ZC9TL0ozMUFya3kxTnoy?=
 =?utf-8?B?c0hzenZxRVRZR1MwUWUrazRzaEQ1UUttNzN5OVRPQ2hlWVI0dWd3SGNUVktF?=
 =?utf-8?B?WGVvK2liSW5UcmJCVjRYUWNyaDg5NkV5YWw5ZkFha1YzdFIxMXRTcStnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0hMaTNrQmlBWlVxWm1qck8xNm5xTHZPQmpMNEpPWVhlRm1uTHR0WWxQQkJl?=
 =?utf-8?B?SHZ1eU5BclVsZ3RVSjV5TkIxZzZubUJKR2tURUNsc0gzZkFZSFBqR1hVcm02?=
 =?utf-8?B?SVZRb2dWZkdtVXhsSStKbG9Ua3dtQ0dxZk1lWUNRalk4WUxyOWtYU2hHWmdU?=
 =?utf-8?B?MVFyMTlqVDZybytybHkzUFBCVitlYjBOM2htVTNEdWI3dUx4bGZUcmkra1lo?=
 =?utf-8?B?cEFSaEZGd01uSG9nUzhaNDNvMVFLUzlwNXl6QjVXOFE5d3RaRGwzNkRncnNv?=
 =?utf-8?B?R3E4cGIwbEJIYTFFZjFTdjlzaFNtTDkxWktnREF5MHY0NElLNEYvd1RPZlpz?=
 =?utf-8?B?SkFzRitORVBCVTFmTVdDR0t0WWw0d3k0TnhCci9lVHpwbjVQRUw2cllDZXlB?=
 =?utf-8?B?Y0pEMlJrZis3UXdiMXVGMXlKcEw0SE5neGdlbytCazNxcHhUeUVIMEZqc21v?=
 =?utf-8?B?dXkrd1c0UndYMklOZys1MjdnWVpoNkhESmZKNVhyUlJBdDJ1MXZyT2haYk5v?=
 =?utf-8?B?ZC9Sa1dSNjFGYkRJMUVVS3haMHZMSHZOdGlQZk9rQy9vNFlyZnliOUNnTkhU?=
 =?utf-8?B?RUJEWjR4Z2FMYmpuMS9wdVorUnI5cnZhaGpyU0hjK2VZTmtxYVhoMUNvU0ZU?=
 =?utf-8?B?VENuV2ZxU3M4elBvMWFqa2srd3E3cXcwbGN5ZEl6ZlJZcEFuMUUvOUo2R1Fn?=
 =?utf-8?B?Z2FjanFCQm5LUWlzcFM0VlZZTWtwdmRHQzZ2YmxCYU15Ky9SdHZMbXp6QzBH?=
 =?utf-8?B?d203NjlUUjV4c2k4aGpZdTAwV09LYmhMVURHRk1FSEVkMU5QTHM2WFVpb28y?=
 =?utf-8?B?U2hTOCtZcGQ5U0RoelBzOFNKSnRyb3RESmlXMWYzcjBUMDlBZ1YzOWMzQTcy?=
 =?utf-8?B?UXEyVDRQRFhsVThyK2xpZEdtQ3ZZZEZWOG5rRUFSRkl2SmdJVm40eVA3cHJn?=
 =?utf-8?B?UFpZQXd1NUovRDhFYmsyY1RXb2NMTnNEbTczc3c3ZmNMSFJhQytFVUo1QmZB?=
 =?utf-8?B?dTBsN3ZGK0R5SSs0L0VBc1ZtYWhDNWh4dlAyQlVuZ21mSFJGM3h3enJUZVE0?=
 =?utf-8?B?TnNPQmY2Yi9VbnlhMThzcmFQcmpsT09NTUZoUmR0dVZyejZpbHBLbmpOc0l2?=
 =?utf-8?B?NEE2RkFXN2VUSTFWMHd0eXhSN2MvbFljcjNObmx6R3NieGZiMDF5bUw0WER6?=
 =?utf-8?B?WUd4VHh1Y2FVVHF3V3MwOWJyZkhUUFpEY1B5aUVXVUdGUUNKWjNoUmZrenM4?=
 =?utf-8?B?Y2FvS0NPS0ZSTWlLY0ZyM1lDNHNkYjB0ZC96MGhrZ3NCc3BvMEpXaFpxNlJ2?=
 =?utf-8?B?anFKZ2dDSS9sMkR2eVpTU25KaWJRVUc4OXVFSHJRc3VqbVJQVjZDS2RkMWkv?=
 =?utf-8?B?bFplQVpCSVN4aERkN05UMFQxRXJneXNGN3BWdHpjMzRZbTZLRGk4WVIySkYy?=
 =?utf-8?B?bzF2NUc2ZXI5SWJhUkhienZRalBTR0wwMndPVXc0cUpMbWdZOVQvQTRoT2pa?=
 =?utf-8?B?U1JWUGxOY3pvNjlJNG02V1VIaXVJNFJtWVlrTlR6eCt4cUhqMHdVUlVoM0xq?=
 =?utf-8?B?b0JKcUkzM25GMFpmNExaZm9Dam9rQngwTWdIY3dQZzgzM2docWlTaGFnMnV5?=
 =?utf-8?B?NzFRTTNITTBzS3NxdkI3TmR4ZThscG8zdWc3UVNoVXdGb3FSZmhpd1hVQkxp?=
 =?utf-8?B?REJIOUVlaEJtZ1lheGh1SUZ3TTVrcGgvNnNkWmJuQzI5U0Z4cGdCVUVCaFdi?=
 =?utf-8?B?L1QvYkQwRkJqSWR6RldVekJiU211RUVIaFovYnNyTy9GbFhFOGNTS0swN2Vo?=
 =?utf-8?B?aWxhVDIxSGtsT0RySTRvWlg4VXp0U2RyRXFGMGtIbVc0VXJ2SjlDWmVWRjhn?=
 =?utf-8?B?bG85N3BEcmpOM3FPK2liN2lMRjJuVCtGMHRpZmJ4Y0pTa2hXc1U4MWtaM1d6?=
 =?utf-8?B?Nzd6U3pnMXVYQ294RXYxdmgzUStRczJUaW02citocml1bWRiVVRRQk5VaWMx?=
 =?utf-8?B?ajBFNTBTR1VyOUNKbDRpU2xiaDJBd2QyRm05RHhTZUJRUHp5b3pWUE92RnFZ?=
 =?utf-8?B?cHFaQUdZUXlhcC9lSGJ2TXNFbXQ3YzV5WWFxZlREYUQ4U2tBZGFndTg2K3ZQ?=
 =?utf-8?Q?4KZAh/5FlbscdLh25uaq6eqRn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fdff54-fe9f-405c-6755-08dcad39927b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 06:09:57.0983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VzaRwHyZeo8jdjS8RwDN3jrbE49Ry63g8K8LfXo4+8G2/r/j0Qbh9EB0CknvLZnEy3JcQc4xqz+oTq/zz1J3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7276
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



On 7/25/2024 5:17 PM, sk.anirban@intel.com wrote:
> From: Sk Anirban <sk.anirban@intel.com>
> 
> Skip these tests when SLPC is enabled as it fails frequently. These tests
> are designed for host turbo and sysfs is not available for SLPC.
                                                         ^ when SLPC is 
enabled
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11455
> 
> v2: Add a skip all the threesolds subtests
typo
%s/threesolds/threshold
>      provide explanations for failures (Riana)
use either uppercase or lowercase
>      Addressed cosmetic review comments (Riana)


With the above comments fixed
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/i915_pm_rps.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
> index 99b83f315..ace22b00c 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -1161,7 +1161,8 @@ igt_main
>   
>   	igt_subtest_with_dynamic("thresholds-idle") {
>   		int tmp, gt;
> -
> +		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
> +			      "This subtest is not supported when SLPC is enabled\n");
>   		i915_for_each_gt(drm_fd, tmp, gt) {
>   			igt_dynamic_f("gt%u", gt)
>   				test_thresholds(drm_fd, gt, TEST_IDLE);
> @@ -1170,7 +1171,8 @@ igt_main
>   
>   	igt_subtest_with_dynamic("thresholds") {
>   		int tmp, gt;
> -
> +		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
> +			      "This subtest is not supported when SLPC is enabled\n");
>   		i915_for_each_gt(drm_fd, tmp, gt) {
>   			igt_dynamic_f("gt%u", gt)
>   				test_thresholds(drm_fd, gt, 0);
> @@ -1179,7 +1181,8 @@ igt_main
>   
>   	igt_subtest_with_dynamic("thresholds-park") {
>   		int tmp, gt;
> -
> +		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
> +			      "This subtest is not supported when SLPC is enabled\n");
>   		i915_for_each_gt(drm_fd, tmp, gt) {
>   			igt_dynamic_f("gt%u", gt)
>   				test_thresholds(drm_fd, gt, TEST_PARK);
> @@ -1188,6 +1191,8 @@ igt_main
>   
>   	igt_subtest_with_dynamic("thresholds-idle-park") {
>   		int tmp, gt;
> +		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
> +			      "This subtest is not supported when SLPC is enabled\n");
>   
>   		i915_for_each_gt(drm_fd, tmp, gt) {
>   			igt_dynamic_f("gt%u", gt)
