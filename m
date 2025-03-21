Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0326C28B30
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 03:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9502D10E6EA;
	Fri, 21 Mar 2025 03:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrdW63S0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AC110E6EA
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 03:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742527608; x=1774063608;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9AhqJfZFi0TcvX8R6WOpmv6IQru0LapQgPs+ltRsFq8=;
 b=YrdW63S03SmQunDUXAWQ1mB2NeG5iL2ravPdH2hV/9hvDkLDgUGz3Zxs
 mXUaUd52VLNiiJJ9UlYvCkBh8wYpVk1lwbTdHwySaCDpQxrSRcIVaEalG
 vOk3jdIX6VwfxGEmCqp1ThAQfMFx1hO1pQOLoTixgnfi9tBPaekQw45wX
 n/OH25xEOYdusWeM7sOkuYCuLJuOY+RabuLIdSneVxaBavXGtMeG8yqNG
 XSMZm7trUP9uiLxdFFL7+O2fPQ6G9qqh4Ef4nU0pdjeNfrswtYUCU2asD
 gmjFtM4vhZucSmYkMg5PCCm2JO4f0T42hSn/hBcjihegY1stpaD89PLNF g==;
X-CSE-ConnectionGUID: BbqY5DZHQAqC9O2snQ/q2A==
X-CSE-MsgGUID: mlq2caCHRy2LzhD74L015A==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="31374676"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; d="scan'208";a="31374676"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 20:26:48 -0700
X-CSE-ConnectionGUID: bD19auALR9KU64xZda4LBA==
X-CSE-MsgGUID: HiH6CYpuSYGL/9hpHyE0Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; d="scan'208";a="123303187"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 20:26:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 20:26:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 20:26:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 20:26:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CL3EpWXqAHHm3nOk7tu7rE+o7COk78n8s54GfSi71FAc0SdAjtBlJtuxIxU9BFBkhxtgXdzT4p2XqArx2ICkZqE5zNsj2G8p/4r0VSrlBtV6/+8PSUzAst5DY6XbWeEIuskmjoLa5115sJ5DljW0Xpv8sR7SRA0pCo+1zjh2snw0cVCoEatpobasL52rh+uAVCW+9oWZSG4JKiP37C0yhho3kV/W3/Kp0rhMA2tJ6FK8ye/kd9vKRLgSACc7IAwYxRsmdiJXwwrvdxF3BVa3jLYMxqb0aQ0Uz8bPAEs/sJC99WyOnDMJu50sNUfHLQMFrV5YXq9dr9xoTKzBnGDcig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoCD2GitsE/VHVGO8I4nChSBCOJPFwzmHc49Fxi1v6c=;
 b=UmTu+OkqR5/Qx4vROkzn0f83pxq9BnA2MBrhQhrl1CgN97Z+kdcwPyGrSvINJ3h8YjsMecskCAM4xfw8zrKZNzGx0/XBjsN+rX+92ZOsmvTcQb/FXVF70NALlLSkcXWvePWFk9MzBthp5zui4YQ3UGXw1tFq7mbiE0zYYDAHtPO0/uGsfSrfoi+GwUQLY9X/vaQK2fHFlzxB2M3DGVA4DN8dQwkJNjdoX7JePajLplY3tE7PSyBtcDkoTl5lXrE2x3Fz2spSaubmVDvaS8153qK2kxlekS6f1iq83nuG3eN0wF7rjYzJZ4VjmOsIXjVSGG8/NxcDgz5QYXPNHI1fjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by DM6PR11MB4739.namprd11.prod.outlook.com (2603:10b6:5:2a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 03:26:46 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 03:26:45 +0000
Message-ID: <1b8ae83f-f818-4dae-98c8-fc9a8730028f@intel.com>
Date: Fri, 21 Mar 2025 08:56:37 +0530
User-Agent: Mozilla Thunderbird
From: "Purkait, Soham" <soham.purkait@intel.com>
Subject: Re: [PATCH <i-g-t> v4 3/4] tools/gputop/xe_gputop: Add gputop support
 for xe specific devices
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>,
 <vinay.belgaumkar@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <jonathan.ming.jun.lui@intel.com>
References: <20250313062154.1601701-1-soham.purkait@intel.com>
 <20250313062154.1601701-4-soham.purkait@intel.com>
 <4f538b63-5919-4f76-afbb-523df00b3bfa@intel.com>
Content-Language: en-US
In-Reply-To: <4f538b63-5919-4f76-afbb-523df00b3bfa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::21) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|DM6PR11MB4739:EE_
X-MS-Office365-Filtering-Correlation-Id: 73baa899-e996-41fe-f0f4-08dd6828352f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm9EM1Z5c0tmVWxMNWpNNEE4UlZYbnFZNGoyZDAyOXBwVjhLYmg2dFFVRTdl?=
 =?utf-8?B?WUZKNmovYVpyeTBLZE9SSm45RVdPNmtqUkkvUVNhbjF4azVVSCtsTDB2dFIw?=
 =?utf-8?B?MEhCY3NnUThEYVVyWUJDcTR0cGE0ZjhCc3FhVUg3UHJUb2RJaFZEa0RRNHVa?=
 =?utf-8?B?VlE0dWZEMVRnQXp1bW9JUFlXTGx1cDg3b292OXBldDBvN1J1VVlLZTBUUkxI?=
 =?utf-8?B?Y0RnSFdnUXRna0dFZG14ZlZmVmcrVjFWd1JtQTl4VGxoTS81NG5NRURpbElE?=
 =?utf-8?B?QnpEVExSOEhZTXlTa2RUdmFGUXgxa0wrRVNyR2puTkFhb29sV1d6MlhpZzRu?=
 =?utf-8?B?SzZWRFBKb3Q1WHc1OUpnNGJqbnBzTllqRkQwbmhkc1cyT1dvMGxRVmZOazlK?=
 =?utf-8?B?Zi85Z2ZPWmhFUjBqb1hxN2VvblN0b2xvZHBSRVFiUm9NaXgwT1NtNk5YOG52?=
 =?utf-8?B?aVlPYzR3ZGtkc0ZZcmpuc29sYnEwNmRPYUFEZ0o0ajNmazhaRFBBN2RTZEgx?=
 =?utf-8?B?M2w3Yk51eVFUVEJIK0pOUUgxdnhzZEYra2lFWjlIYkJzcWtuVTVLOVlHMFVi?=
 =?utf-8?B?Y2R2TlJ0TGZUQUVZZ1dnb2oydjl2YmFVbnhOSlMvTUdJelZzVHdBS2l2RHZy?=
 =?utf-8?B?bWZXRUlyM3YyTXQ5dDFVMGRVOWlaN2djMFJuNk1ERGg1VE8ybCt4V3FsMFJW?=
 =?utf-8?B?MjVsQWc1RjJFUVBsL0JUMjJVZ0hjS3FEMDV6L0NxUUxBVG55RTlDZUJCNXVP?=
 =?utf-8?B?MFBKN0swUklBUGVLTEoxdm5PRGhLTkNQNHVpRTZKQjFuejBDRy85VE5OZTZX?=
 =?utf-8?B?SkVXb2hYd0lPVVhnVFRaYVRxb1B5T0MrdnBsdDFyaDFWWk10dlpPdDdrWHVG?=
 =?utf-8?B?QUVIN00zWUN0eitNN0J6Zm5td2RRem1JbWFIZ1BVUnlrM1Y0SThZcFo1MXo2?=
 =?utf-8?B?MmdvTkV5ck1URmRUdUpmQjVET0pOdmpaYzRFVGl0Y1BTM0N5UlJzenFSdEp5?=
 =?utf-8?B?bEFWTGlSVG5sbkVuZDBkZXhPby85ZkUzWU0yV3dKdnNnVXhwSGFXSktXRUto?=
 =?utf-8?B?WVNhWHM0SXFadjl3ejk3em5zc0dBUnMzaEYxRHJhNjI5VkRHbDRKeHdZcyto?=
 =?utf-8?B?OGt0dTBYV2Z5dHpUSnMrRUlVQStGclhTUlEyKzBLM1NuUW85dytIV0w5QzNx?=
 =?utf-8?B?cTJjWXpScFloNXdWUTloWG5Lcnc2ODZEdlJ4VTM4NW0xNXBYM01CT0xtTnlO?=
 =?utf-8?B?TFI5YWV3TCtHMnlpWC9uZ1M2QkMrQXRIVnprMWQ1WFc1S1ZUTmRiZWNSak1E?=
 =?utf-8?B?OTR0anhZU0owSlpqRUtLMTJuaHlnM25sWkc4MnE2eWpLMHgvb0RoVHRKMzh3?=
 =?utf-8?B?VEVhQmtJSi9VZTFxU3Qwc0wrTXFZdmhyM0xkaEZpRnVGR2ZNT0J3MThUNzVI?=
 =?utf-8?B?T1hxa2lha1NqQmc4NUpqWVVmZktBR1FjWGdSclJMcWxXaXV6UXU3eDE0dHp4?=
 =?utf-8?B?NHh4NEVOa1Q1SGJ1cHF0NzVvbE1TMzBBQmExdDcvd0J6bUZkaG9BMWpwaE1W?=
 =?utf-8?B?Z2ZyWUtqYU9kSVprcm0yQ3NlczJVRkR4aGVSWE05U2lYRjh3UFUra3d0TUZ4?=
 =?utf-8?B?aTYybVN2N3hVUEd4ODl5d3FFcjFWWXBvVkVIampZQVlSN09XRG8wbVhlRWdH?=
 =?utf-8?B?WXRkUWFxN3dvZmxqYUZJTzM2TkdsU21jNHQ5Z1BaS0xzWldOd00wZGhJNnd5?=
 =?utf-8?B?RnhDZHBpUWVPN3JWRXVTMnowU1VKdmhYbVYwb2NOdjV4dXVaS1g1N0kveWxh?=
 =?utf-8?B?cTNieDQ2T21FalJ0T2lONE44MjFWMm9YR2h1MVRVWG94Z2NIMXJTRyt2Wjgw?=
 =?utf-8?Q?x7hd1KkgCfgUz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjRkSVJQdHFvUjNrbjd0R3p3SlRyZ05aT0NSSE9yRWI1Nm1aRDAwamN5aEk3?=
 =?utf-8?B?SUhkMk5UN0V6RGI5LzBjMFJHOXBqcTZRZnlYZnpVTVZaSkg1aVAvdE0yYlBi?=
 =?utf-8?B?Y200a3hFTkJXMDhZZ3NOaUFZU1J3anFPenN5SzJ0UzM0cDN6RDhBVGFVYmFk?=
 =?utf-8?B?c1NCL1FUZWFrcnY1UU1nR1hlVzd6RlhDclIvSEJHYlppZDJsM2xpRFZtYzFL?=
 =?utf-8?B?RjF3Y3dRTUtNRC91VWhkVjlwbUhNVTNUdDFzclFVQ0lPODVNcWxsa0U1aGRy?=
 =?utf-8?B?d2E1TDE1bWVBZTc3MVE0ZUFReUpWdm05aTI0ZGNJa3hOOHdqY3pJT2xFSzlz?=
 =?utf-8?B?QWMzL2hDc0Y2UDlZb2JETmNGbWIybU9nYzZpRW9aQ0NiNGhSM3IxVDB3aFRm?=
 =?utf-8?B?WTAzcWpscnNWWXdGODBkYjhaaHRiaGhiWTVhOU1hdkcwU1hkOWpWK3pVZTZU?=
 =?utf-8?B?VTV5blZQdTFLWVE1S05LMGRRTGVRb2RySXRvWlJDLzI2VSt6SkZ5dFdydHhp?=
 =?utf-8?B?a3ArY3Q3dWYwNlUvWlhsM0lJcVdTbkV4aTZIMzBTQUVNdnZyNFRNbi9zb2xX?=
 =?utf-8?B?VlJlNzZoSDZVZUNhR1pTeXNuOEg2TjRLNU1YOVloaW10cGZkdU9ST0NPRE1B?=
 =?utf-8?B?cXEzb09CWXZZM3EvblZVNmxTUHQ0c2Z2aFhzQXhkNzMwMkFsUmhsWkRsOUQx?=
 =?utf-8?B?bjBjakRzdDdPOUszRTMxMTJ6ZkFTbHFId216bE14ODZadlY4emVWV0RjalRy?=
 =?utf-8?B?RGxIa041ZnNMM1BUMjZrQVZLNjd5cVR3eTY3eTVCbEZnNEcrZ3AxRFFmZkJJ?=
 =?utf-8?B?bndKOFpSL2NjMEJLc1c5Q1Flb0hEV2tVVW5UWHpWc1RXMjJsUzBqODJSQVll?=
 =?utf-8?B?bmZMTWQzUnJsZ2FSdk9ITjdUZXptR0F1dVo5TmpKcURHek9PVm9RYzVvQnNw?=
 =?utf-8?B?WDhXbUV4QXN2c2RmRzZ1NTFVTHRDK0Jld3dhVm95Y2JZY3pvendMK040bktW?=
 =?utf-8?B?dHFMd29XNDVWUWMvTC9lQlNLL1FGREo5ZG8rZHJjRTRXT1AzMlgrWDNYVE96?=
 =?utf-8?B?RzFFY0NzYkhhQlZZakFMZTJxclU3R3ZmaGdXK2wyUUVKMzZiS0VHTXFpcE5t?=
 =?utf-8?B?MWxIMmFneTJ4bEl0ZHY3a2MxNllGYk5nK3UrSXpEYkxxaHBOL2gxd2RMa2Vm?=
 =?utf-8?B?UytWSGRGUnZqeFB1cmtnL0FuQS8rM2JCK3FBaFFheDYvRVVFQ3RmY1REZThC?=
 =?utf-8?B?a29mTkFva2hsUS9tcHQ3em9adkZtaTZITEpoS3BpZC9vUVNKK0s5YVcrUHZw?=
 =?utf-8?B?RlhuL0I2ZlNnaUw1b0JEM1BTVjcyZTE3bmVTWng3OFJnSjg5QUc5bkcxU3ZP?=
 =?utf-8?B?YkhlWGZQYXBvZXZaQTdvS0pwMUxOT3lCdFNUeCtxSDJZTXVuV3RzWGpzejVz?=
 =?utf-8?B?MEYwRWdadmFQZnM5UzhTSzJHMUZvK0txTGRBaHJ1dmU1R05TcjBSeDNuLzZR?=
 =?utf-8?B?NnRBMlY0WDI1OHZ3ZFJXYjJNSUJiNUJ4aWx3NUxycVlrbEpUUWpsS1RicHFB?=
 =?utf-8?B?a0xBSS90WDVDN2NrVzJNZG52TzVWTEl0MmEzOHBFR0g2RjRNUzVLeGNhTGZS?=
 =?utf-8?B?WW1uSGtLV2F3Nm8vaHJQdjBkWityck51cFU5dWRqOUVNZmtNZURMZlQ0QzF5?=
 =?utf-8?B?MHRSVVJCclBlYzE2VFJGTnlyS09EL2l0Zks5VFlURXBBaTZwU2ZibDh6ZmpK?=
 =?utf-8?B?UjFVbldZK2pqSmpiK1c3c0pjM1Z0dmo2ZEJUclpTcSsxWmpxVEg1VTFzNG1P?=
 =?utf-8?B?Q0xRNWpXeVU1VGp5YXpnLy9vdnk2OTlRaGg2RzNPOVVoMUpUSllUUjBHOEJy?=
 =?utf-8?B?R0s3dVArc1R0MDZNSVpLMUs5ZTREbnR4OU9LTWV5aTYwRzk0UkRxMjU4OU56?=
 =?utf-8?B?bDdDQTFLbkRxb29GQk0xWlk2c2VBNXhQOEIwWVAzNUlGR2RSSU9La2N1SFE4?=
 =?utf-8?B?enRRMlFzdEtoTWhWejRiVXVDN1FBR2lrcENIUHAwejc3cVF2TWxWTFJwRmls?=
 =?utf-8?B?Nno1YUJDR1ROZlI4cWRZaG51Nnh0VXYrOHI1WWdUVjlGeEpaNXdJMndPR29M?=
 =?utf-8?B?RjVjK25QaTdCT2ZxZnoyV0JLamxueWhSMlVOb3pWOXMrN3JYSm4xTlhxa2Mv?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73baa899-e996-41fe-f0f4-08dd6828352f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 03:26:45.8599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5DqkmIxtNxqLHmRCftH0QIlgghMHbjblOLv6vCi1Fots1z8rSgQfgbDg5r3rn+MuK88MrhPBWeDYLmJpDXhJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4739
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

On 14-03-2025 10:27, Riana Tauro wrote:
> Hi Soham
>
> Replace busy-ticks with engine-active-ticks and total-ticks with 
> engine-total-ticks to keep it consistent.
>
> Replace all occurences of busy with active in the series.
>
> On 3/13/2025 11:51 AM, Soham Purkait wrote:
>>      Add gputop support for xe-specific devices. Separate
>> driver-specific code into respective source files.
>>
>> v2 : fix for refactoring GPUTOP into a
>>       vendor-agnostic tool (Lucas)
>>
>> v3 : Separate commit (Kamil)
>>
>> v4 : Headers in alphabetical order
>>       Engines memory allocation at
>>       the beginning all at once
>>       Removed PMU normalization (Riana)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   tools/gputop/xe_gputop.c | 372 +++++++++++++++++++++++++++++++++++++++
>>   tools/gputop/xe_gputop.h |  73 ++++++++
>>   2 files changed, 445 insertions(+)
>>   create mode 100644 tools/gputop/xe_gputop.c
>>   create mode 100644 tools/gputop/xe_gputop.h
>>
>> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
>> new file mode 100644
>> index 000000000..4137bb771
>> --- /dev/null
>> +++ b/tools/gputop/xe_gputop.c
>> @@ -0,0 +1,372 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "xe_gputop.h"
>> +
>> +#define engine_ptr(engines, n) (&(engines)->engine + (n))
>> +
>> +static void __update_sample(struct xe_pmu_counter *counter, uint64_t 
>> val)
>> +{
>> +    counter->val.prev = counter->val.cur;
>> +    counter->val.cur = val;
>> +}
>> +
>> +static void update_sample(struct xe_pmu_counter *counter, uint64_t 
>> *val)
>> +{
>> +    if (counter->present)
> presence of fd should be enough. present is not required.
> The __update contents can be moved to same function
In order to maintain the sanctity, I believe this approach is more 
aligned with the IGT implementation.
>> +        __update_sample(counter, val[counter->idx]);
>> +}
>> +
>> +static const char *class_display_name(unsigned int class)
>> +{
>> +    switch (class) {
>> +    case DRM_XE_ENGINE_CLASS_RENDER:
>> +        return "Render/3D";
>> +    case DRM_XE_ENGINE_CLASS_COPY:
>> +        return "Blitter";
>> +    case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
>> +        return "Video";
>> +    case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
>> +        return "VideoEnhance";
>> +    case DRM_XE_ENGINE_CLASS_COMPUTE:
>> +        return "Compute";
>> +    default:
>> +        return "[unknown]";
>> +    }
>> +}
>> +
>> +static inline void *clean_up(void *engines)
>> +{
>> +    if (engines)
>> +        free(engines);
>> +
>> +    return NULL;
>> +}
>> +
>> +static char *pmu_name(struct igt_device_card *card)
>> +{
>> +    int card_fd;
>> +    char device[30];
>> +    char *path;
>> +
>> +    if (strlen(card->card))
>> +        card_fd = igt_open_card(card);
>> +    else if (strlen(card->render))
>> +        card_fd = igt_open_render(card);
>> +
>> +    if (card_fd == -1)
>> +        return NULL;
>> +
>> +    xe_perf_device(card_fd, device, sizeof(device));
>> +    path = strdup(device);
> needs a free while cleanup
>> +    close(card_fd);
>> +    return path;
>> +}
>> +
>> +static int _open_pmu(uint64_t type, unsigned int *cnt, struct 
>> xe_pmu_counter *pmu, int *fd)
>> +{
>> +    int fd__ = igt_perf_open_group(type, pmu->config, *fd);
>> +
>> +    if (fd__ >= 0) {
>> +        if (*fd == -1)
>> +            *fd = fd__;
>> +        pmu->present = true;
>> +        pmu->idx = (*cnt)++;
>> +    }
>> +
>> +    return fd__;
>> +}
>> +
>> +void xe_gputop_init(struct xe_gputop *obj,
>> +            struct igt_device_card *card)
>> +{
>> +    obj->pmu_device = pmu_name(card);
>> +    if (!obj->pmu_device) {
>> +        fprintf(stderr, "%s : pmu_device path returned NULL", 
>> card->pci_slot_name);
>> +        exit(EXIT_FAILURE);
>> +    }
>> +    obj->card = card;
>> +}
>> +
>> +static int pmu_format_shift(int xe, const char *name)
>> +{
>> +    uint32_t start;
>> +    int format;
>> +    char device[80];
>> +
>> +    format = perf_event_format(xe_perf_device(xe, device, 
>> sizeof(device)),
>> +                   name, &start);
>> +    if (format)
>> +        return 0;
>> +
>> +    return start;
>> +}
>> +
>> +static int engine_cmp(const void *__a, const void *__b)
>> +{
>> +    const struct xe_engine *a = (struct xe_engine *)__a;
>> +    const struct xe_engine *b = (struct xe_engine *)__b;
>> +
>> +    if (a->drm_xe_engine.engine_class != b->drm_xe_engine.engine_class)
>> +        return a->drm_xe_engine.engine_class - 
>> b->drm_xe_engine.engine_class;
>> +    else
>> +        return a->drm_xe_engine.engine_instance - 
>> b->drm_xe_engine.engine_instance;
>> +}
>> +
>> +void *xe_discover_engines(const void *obj)
>> +{
>> +    struct igt_device_card *card = ((struct xe_gputop *)obj)->card;
>> +    struct xe_engines *engines;
>> +    int ret = 0;
>> +    char device[30];
>> +    struct drm_xe_engine_class_instance *hwe;
>> +    int card_fd;
>> +
>> +    if (!card || !strlen(card->card) || !strlen(card->render))
>> +        return NULL;
>> +
>> +    if (strlen(card->card)) {
>> +        card_fd = igt_open_card(card);
>> +    } else if (strlen(card->render)) {
>> +        card_fd = igt_open_render(card);
>> +    } else {
>> +        fprintf(stderr, "Failed to detect device!\n");
>> +        return clean_up(engines);
>> +    }
>> +    xe_device_get(card_fd);
>> +    engines = malloc(sizeof(struct xe_engines) +
>> +             xe_number_engines(card_fd) * sizeof(struct xe_engine));
> why additional? 
While allocating xe_engines, xe_engine space also needs to get allocated.
>
>> +    if (!engines)
>> +        return NULL;
>> +
>> +    memset(engines, 0, sizeof(struct xe_engines) +
>> +           xe_number_engines(card_fd) * sizeof(struct xe_engine));
>> +
>> +    engines->num_engines = 0;
>> +    engines->device = ((struct xe_gputop *)obj)->pmu_device;
>> +    xe_for_each_engine(card_fd, hwe) {
>> +        uint64_t engine_class, engine_instance, gt_shift, param_config;
>> +        struct xe_engine *engine;
>> +
>> +        engine = engine_ptr(engines, engines->num_engines);
>> +        gt_shift = pmu_format_shift(card_fd, "gt");
>> +        engine_class = pmu_format_shift(card_fd, "engine_class");
>> +        engine_instance = pmu_format_shift(card_fd, "engine_instance");
>> +        param_config = (uint64_t)hwe->gt_id << gt_shift | 
>> hwe->engine_class << engine_class
>> +            | hwe->engine_instance << engine_instance;
> This function does pmu specific initialization too. discover_engines 
> is not the right name.
> you could move pmu specific initialization to pmu_init or rename this 
> function
Here engine specific discoveries is being performed so the name, while 
strictly maintaining PMU specific initialization is not possible
due to the underline implementation But It could encourage other driver 
to maintain the same structure, while keeping
it vendor agnostic.
>> +
>> +        engine->drm_xe_engine = *hwe;
>> +
>> +        ret = perf_event_config(xe_perf_device(card_fd, device, 
>> sizeof(device)),
>> +                    "engine-active-ticks", &engine->busy_ticks.config);
>> +        if (ret < 0)
>> +            break;
>> +
>> +        engine->busy_ticks.config |= param_config;
>> +
>> +        ret = perf_event_config(xe_perf_device(card_fd, device, 
>> sizeof(device)),
>> +                    "engine-total-ticks", &engine->total_ticks.config);
>> +        if (ret < 0)
>> +            break;
>> +
>> +        engine->total_ticks.config |= param_config;
>> +
>> +        if (engine->busy_ticks.config == -1 || 
>> engine->total_ticks.config == -1) {
>> +            ret = ENOENT;
>> +            break;
>> +        }
>> +
>> +        ret = asprintf(&engine->display_name, "%s/%u",
>> + class_display_name(engine->drm_xe_engine.engine_class),
>> +                   engine->drm_xe_engine.engine_instance);
>> +
>> +        if (ret <= 0) {
>> +            ret = errno;
>> +            break;
>> +        }
>> +        ret = asprintf(&engine->short_name, "%s/%u",
>> + xe_engine_class_short_string(engine->drm_xe_engine.engine_class),
>> +                   engine->drm_xe_engine.engine_instance);
>> +
>> +        if (ret <= 0) {
>> +            ret = errno;
>> +            break;
>> +        }
>> +
>> +        engines->num_engines++;
>> +    }
>> +
>> +    if (!ret) {
>> +        errno = ret;
>> +        return clean_up(engines);
>> +    }
>> +
>> +    qsort(engine_ptr(engines, 0), engines->num_engines,
>> +          sizeof(struct xe_engine), engine_cmp);
>> +
>> +    ((struct xe_gputop *)obj)->eng_obj = engines;
>> +
>> +    return engines;
>> +}
>> +
>> +static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
>> +{
>> +    uint64_t buf[2 + num];
>> +    unsigned int i;
>> +    ssize_t len;
>> +
>> +    memset(buf, 0, sizeof(buf));
>> +
>> +    len = read(fd, buf, sizeof(buf));
>> +    assert(len == sizeof(buf));
>> +
>> +    for (i = 0; i < num; i++)
>> +        val[i] = buf[2 + i];
>> +
>> +    return buf[1];
>> +}
>> +
>> +void xe_pmu_sample(const void *obj)
>> +{
>> +    struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
>> +    const int num_val = engines->num_counters;
> this can be num_engines * 2.
> can remove this
>> +    uint64_t val[2 + num_val];
>> +    unsigned int i;
>> +
>> +    engines->ts.prev = engines->ts.cur;
>> +    engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
> This is unnecessary
>> +
>> +    for (i = 0; i < engines->num_engines; i++) {
>> +        struct xe_engine *engine = engine_ptr(engines, i);
>> +
>> +        update_sample(&engine->busy_ticks, val);
>> +        update_sample(&engine->total_ticks, val);
>> +    }
>> +}
>> +
>> +int xe_pmu_init(const void *obj)
>> +{
>> +    struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
>> +    unsigned int i;
>> +    int fd;
>> +    struct xe_engine *engine;
>> +    uint64_t type = igt_perf_type_id(engines->device);
>> +
>> +    engines->fd = -1;
>> +    engines->num_counters = 0;
> you can use a local variable here
It is being used in xe_pmu_sample as well.


Thanks,
Soham

>> +
> why is 0 outside, Can't it be moved in the for loop
>> +    engine = engine_ptr(engines, 0);
>> +    fd = _open_pmu(type, &engines->num_counters, 
>> &engine->busy_ticks, &engines->fd);
>> +    if (fd < 0)
>> +        return -1;
>> +    fd = _open_pmu(type, &engines->num_counters, 
>> &engine->total_ticks, &engines->fd);
>> +    if (fd < 0)
>> +        return -1;
>> +
>> +    for (i = 1; i < engines->num_engines; i++) {
>> +        engine = engine_ptr(engines, i);
>> +        fd = _open_pmu(type, &engines->num_counters, 
>> &engine->busy_ticks, &engines->fd);
>> +        if (fd < 0)
>> +            return -1;
>> +        fd = _open_pmu(type, &engines->num_counters, 
>> &engine->total_ticks, &engines->fd);
>> +        if (fd < 0)
>> +            return -1;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static double pmu_calc_total(struct xe_pmu_pair *p)
> %s/pmu_calc_total/pmu_total_ticks
> or calc_total_ticks
>> +{
>> +    double v;
>> +
>> +    v = p->cur - p->prev;
>> +    return v;
>> +}
>> +
>> +static double pmu_calc(struct xe_pmu_pair *p, double total_tick)
> %s/total tick/total ticks
>> +{
>> +    double bz = p->cur - p->prev;
> use friendly names
> active ticks
>
> I think you can move total ticks also here. pass two pairs and 
> calculate in same function
>> +    double total;
>> +
>> +    total = (bz * 100) / total_tick;
>> +    return total;
>> +}
>> +
>> +static int
>> +print_device_description(const void *obj, int lines, int w, int h)
>> +{
>> +    char *desc;
>> +    int len;
>> +
>> +    len = asprintf(&desc, "DRIVER: %s || BDF: %s",
>> +               ((struct xe_gputop *)obj)->card->driver,
>> +               ((struct xe_gputop *)obj)->card->pci_slot_name);
>> +
>> +    printf("\033[7m%s%*s\033[0m\n",
>> +           desc,
>> +           (int)(w - len), " ");
>> +    lines++;
>> +    free(desc);
>> +    return lines;
>> +}
>> +
>> +static int
>> +print_engines_header(struct xe_engines *engines,
>> +             int lines, int con_w, int con_h)
>> +{
>> +    const char *a;
>> +
>> +    for (unsigned int i = 0;
>> +         i < engines->num_engines && lines < con_h;
>> +         i++) {
>> +        struct xe_engine *engine = engine_ptr(engines, i);
>> +
>> +        if (!engine->num_counters)
>> +            continue;
>> +
>> +        a = "            ENGINES   BUSY  ";
>> +
>> +        printf("\033[7m%s%*s\033[0m\n",
>> +               a,
>> +               (int)(con_w - strlen(a)), " ");
>> +        lines++;
>> +
>> +        break;
>> +    }
>> +
>> +    return lines;
>> +}
>> +
>> +static int
>> +print_engine(struct xe_engines *engines, unsigned int i,
>> +         int lines, int con_w, int con_h)
>> +{
>> +    struct xe_engine *engine = engine_ptr(engines, i);
>> +    double total_tick = pmu_calc_total(&engine->total_ticks.val);
>> +    double percentage = pmu_calc(&engine->busy_ticks.val, total_tick);
>> +
>> +    printf("%*s", (int)(strlen("            ENGINES")), 
>> engine->display_name);
>> +    print_percentage_bar(percentage, con_w - strlen("            
>> ENGINES"));
>> +    printf("\n");
>> +
>> +    return ++lines;
>> +}
>> +
>> +int xe_print_engines(const void *obj, int lines, int w, int h)
>> +{
>> +    struct xe_engines *show = ((struct xe_gputop *)obj)->eng_obj;
>> +
>> +    lines = print_device_description(obj, lines, w, h);
>> +
>> +    lines = print_engines_header(show, lines, w,  h);
>> +
>> +    for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
>> +        lines = print_engine(show, i, lines, w, h);
>> +
>> +    lines = print_engines_footer(lines, w, h);
>> +
>> +    return lines;
>> +}
>> +
>> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
>> new file mode 100644
>> index 000000000..1f23b2ed0
>> --- /dev/null
>> +++ b/tools/gputop/xe_gputop.h
>> @@ -0,0 +1,73 @@
>> +/* SPDX-License-Identifier: MIT
>> + *
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef __XE_GPUTOP_H__
>> +#define __XE_GPUTOP_H__
>> +
>> +#include <dirent.h>
>> +
>> +#include "igt_device_scan.h"
>> +#include "igt_perf.h"
>> +#include "utils.h"
>> +#include "xe/xe_query.h"
>> +
>> +struct xe_pmu_pair {
>> +    uint64_t cur;
>> +    uint64_t prev;
>> +};
>> +
>> +struct xe_pmu_counter {
>> +    uint64_t type;
>> +    uint64_t config;
>> +    unsigned int idx;
>> +    struct xe_pmu_pair val;
>> +    bool present;
>> +};
>> +
>> +struct xe_engine {
>> +    const char *name;
>> +    char *display_name;
>> +    char *short_name;
>> +    struct drm_xe_engine_class_instance drm_xe_engine;
>> +    unsigned int num_counters;
> didn't find initialization. needed?
>> +    struct xe_pmu_counter busy_ticks;
>> +    struct xe_pmu_counter total_ticks;
>> +};
>> +
>> +struct xe_engines {
>> +    unsigned int num_engines;
>> +    unsigned int num_classes;
> not used
>> +    unsigned int num_counters;
>> +    DIR *root;
>> +    int fd;
>> +    struct xe_pmu_pair ts;
> can be removed
>> +    bool discrete;
> not used
>> +    char *device;
>> +    int num_gts;
> not used
>> +
>> +    /* Do not edit below this line.
>> +     * This structure is reallocated every time a new engine is
>> +     * found and size is increased by sizeof (engine).
>> +     */
> This comment can be removed
>
> Thanks
> Riana
>> +    struct xe_engine engine;
>> +
>> +};
>> +
>> +struct xe_gputop {
>> +    char *pmu_device;
>> +    struct igt_device_card *card;
>> +    struct xe_engines *eng_obj;
>> +};
>> +
>> +void xe_gputop_init(struct xe_gputop *obj,
>> +            struct igt_device_card *card);
>> +
>> +void xe_populate_device_instances(struct gputop_device *dv);
>> +void *xe_discover_engines(const void *obj);
>> +void xe_pmu_sample(const void *obj);
>> +int xe_pmu_init(const void *obj);
>> +int xe_print_engines(const void *obj, int lines, int w, int h);
>> +
>> +#endif /* __XE_GPUTOP_H__ */
>
