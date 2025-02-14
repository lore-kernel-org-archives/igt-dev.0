Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55C2C021A4
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 07:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FCD10E25A;
	Fri, 14 Feb 2025 07:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAcYbn5x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C375A10E25A
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 07:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739516944; x=1771052944;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eLSbzRLuIE3F2l15wQte5TqTpurUI5yo8gW2eiYPeEg=;
 b=bAcYbn5xmiZXxbA99TOvk3fIL0sIc5dpLzfrV0ucFloNtv24vBxxu9J8
 AOd20teZQrSDccKt8YzNwG7OnVWHvTt1DQ0NiNpBJW/rzwbPoM99o7ijs
 nVpbFMVnmOOPPH2xz7UIMuCRqoxvB51GdpNPIaoRh48BMV6Crbqy75IDJ
 wkw4TlovT2KElQHY8GLQoVHG+B4UnqhRp1K2WonEBSh3yxKgSTA541pSH
 IzrwE4Lc8vuH37jriL3UmnMUfm+6Y8qbHK1bKM+F1qknSWjRRpYkKgmT+
 1Yp2BzPL7OfljgZoid0Ygd2EARY53WMZiNfEj/gXughuyGtsB7M3JtwIZ Q==;
X-CSE-ConnectionGUID: t801ivBlSROHHGx3rF0b1A==
X-CSE-MsgGUID: 9f+FVr9aTCGrJfhjW3CTPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="43910334"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="43910334"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 23:08:53 -0800
X-CSE-ConnectionGUID: pQHQgbh5S+6PITNodGgNEQ==
X-CSE-MsgGUID: XbBfJ78qTJ2CgznolcxlNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="113365993"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 23:08:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 23:08:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 23:08:50 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 23:08:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHL1hmHVZn37/o0RYT5tRWRVT4xmLNe+btEbiFLP5geOOnRHQvzX+gu+I9vxWHSnM/YoESMjq57SP4+dbE1My/qZF4gGPcJPk7R2Ze2dNoqDAIRqTQ8mTuvT7XmM0uqK4O0027cyN4TE3PMXgO5i7kECtTTg8Ux8DyzW/v14PgE39/KG4lLxrqZVb5oHlvNhznqV10ntstaHnmTwe6Dr6Ik/VtVFoKMzBld7W7nbMGNYPINAV6Xo/I+9EBHHDH90ACJt4Xidm4sMSrIylXjG+8ewoisxDsZTb24oA3i7cyQr8Ltls/sxoAuF/7QrI3U68mm2NjPACeXnHDhWpWsMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76tZcSOl6CWgQ6HIq8IYB8x0ANX+mvb/eT7gelCyuPA=;
 b=pmnI3tSa/9ZGBe/lNeIbuEJzxMpKExmh5jDG8+jm/OI3wI+GfWjY820l7PDtqy4aMapRGCx7lSsErzGI+SiqPloPy5kvrC6FvQ2bc07LqeFblcU6FaqFZhsqtlCUHRok/TMVdDq6mbXes1El0OojQvFOKBzMUnTl5pFN6Eb0Dma2PhiLUszO4688lNU5d1CXQ6AQUJ6al0Ym5pgvXGFrs+Ba/KQX4VSdfvqiABJLAkT/5jigmYifBEfeZ0vXZQvjOKM+Hf7a2dNuDFJ88/kGhVyRYxbkpZHv+hLvgrY4XNShauNuywC+8IMbUB+gNwLnB5ZmxZc5XkINhwT2oI70ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS7PR11MB6296.namprd11.prod.outlook.com (2603:10b6:8:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Fri, 14 Feb
 2025 07:08:48 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 07:08:48 +0000
Message-ID: <796b47e8-c774-48e3-97e6-7fc17774f13f@intel.com>
Date: Fri, 14 Feb 2025 12:38:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/7] tests/intel/kms_dp_linktrain_fallback: refactor
 find_mst_outputs
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
 <20250211180542.1430676-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250211180542.1430676-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS7PR11MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: b9fb3662-aee4-471d-8160-08dd4cc66d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVRFTTBWSXk3aHozclZuOEg1WWZYbXJiUnlUMkdHakxPMUVQSS9pRnliS0cy?=
 =?utf-8?B?akRuMTZFQzFGR0VjT3BzTUZ0cWVtcUI0T3kwTWtpc2lGT0N0S2QxWkpCUUYr?=
 =?utf-8?B?VUZyanJESmUxejJCZFpZV3Y3dy9WcjcyaE1xSmphNXQ0bjExU2llT293N0Vu?=
 =?utf-8?B?dXRkTXdOUEQ4NVNwNDlJdHdTT0lIcXhGc25KQ2lCVzNtUG9XdkdCdlhOaW9B?=
 =?utf-8?B?NTNKQ0JZaGFUcnhIYitMbUhNRld4eDlQeGJ6L3FmeFczYWo1NFJWMGhOTU8r?=
 =?utf-8?B?RkZsUGJ5WjJ4M1NRQTMvUWxySnBVdG5tVDAxdGxGcElpQmZONENINk1Id09r?=
 =?utf-8?B?amo3emU0RjFpT0pZRVEzeVR5aVlxUi9ZVU8yUXhGeXphVlUyTEphTUFHZzh5?=
 =?utf-8?B?YTdKNy9UQzlxbVlmV1BGY0NFL3pnNjBiWi9Gc3UyanI2Q3U2d2tXUU05eU03?=
 =?utf-8?B?WjFrVEZkYnNGS2RCWHlBTkt0WlJtRW1iY0Q5dThJd3I1Q2hHTWZjMnM5ZmRw?=
 =?utf-8?B?bnA5K0lmSUhMSTdjSGhZem1lckJNTlhyK2xzajJtZ0o5NVFxcEVDK1NCVnkz?=
 =?utf-8?B?ZHN2bU9YdjFsa2dXR1lzc1Q3b0tzYlRvdG9PT2lsYkxtTGJiOGNicHBNUU9S?=
 =?utf-8?B?V2h3RFB2UWR2aXYwVGdXdWxFL2JhNHB4dzlsdFVZZ0ljdERmL29CQlUvRGpt?=
 =?utf-8?B?ZWR4TUdXSmpaTkhJUDN3Zzg0N293eFRscERhS2N2aU5BejlDRkFQYVFxa25P?=
 =?utf-8?B?cG1JV01hck00WXFIMENWV3BWOGEwM0tWUlZrdCswc0JmMENhckRlczYzY01x?=
 =?utf-8?B?UkpZaEJzOVE3YkhWRCtkVGV6c1kxejFmT3RhMGQrSDZoT0RDd2JnQ2E4d0Jw?=
 =?utf-8?B?TzB2akhhWllBRXRuanFETEpoNm5LRjZORzN4MUdkRndmMlFIako0NFNIR09Z?=
 =?utf-8?B?WnQxbzVQSUdJQ2wrWGt5M2Vuc01Na2NIZWZnZ1lnQ0NTdDZNdURaTFprUW9R?=
 =?utf-8?B?MzRESGhsbjdLYzZwUCtEK1gvKzYvbWpQWjhoeWt1MEVhUFZUeUd3dE5MRUJV?=
 =?utf-8?B?dDhoSlp6VFRqZlNPQmJhditSaWg3ZDUzdjVqUFo0YURwL2FDU0hOVWZTNVND?=
 =?utf-8?B?aUlNaVY4c2tPb3BDdFE5dTdZV2F2NGY5SjdSZGlHL0I4SjlEcDd2WktLaEYz?=
 =?utf-8?B?SWViZ292V2RCVEZ4VGRNTktVUDM3by93VGkrVGcrdzMyMHk4MW9oc0piL1Y3?=
 =?utf-8?B?cUkzVnFUTXRQelVLV2Y3R3crdFlsenorSFdmbGZoekZYNWViZHBLWUg0T3Ju?=
 =?utf-8?B?RDUrNm42TlF1anZXWnJsRkw5RGRFcU00bjdnTUJSdmd2VkE5Nml6aE9mdlFQ?=
 =?utf-8?B?clhiNFhuRVREeFBFK1k2NGhFdURCYko4TzdpNXRUSytPbkhrTWp5ZXk4V0VQ?=
 =?utf-8?B?dm5jSm9LODBCMmRnZzVDa3NCZ0NEVHdVVHF1VHBrRTlHTnJUc0x3ZkMyOHlx?=
 =?utf-8?B?NWpvU3ZzUUtRSnkrS3NJbGZsZlBrTnRib0EyMUpYdElZQ0ZvdGZBVnVVdHY5?=
 =?utf-8?B?M1BwOVZjQ2FrQjBXQWtpUkFGcEZ5V2tGQ0Q5SGh6aC9LeFhpK2R6WERXNVcv?=
 =?utf-8?B?ODRlWDJlejFnSDFhWGhRVnRPUFRpdzJGM1JXYnFrTXZ3dlJxZkZPZUJDNFBv?=
 =?utf-8?B?VzJidEZNYURQbmxlSVVYMkdKejBjVklvSEt6a0pSRVYvcmU4aTJ2TGl1Lzg2?=
 =?utf-8?B?ZWZGcDVEMXRJZURjZ0szNlhnR0tLQUpqbUlpYS80NnRDdXVJcTNDOWZPb25J?=
 =?utf-8?B?THUrT1RkUk5HS21hRlpkM1lYRzVMUjQ4UnQxRnlkTTN3MVFXbDRSN1cvdWNH?=
 =?utf-8?Q?HrSRu1DjwAg3Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUhhTHk5T0FIU3lKWUdJRjlmTkorS3N1TS9FMW82WDFJbmR5ZVl2RW5nVHll?=
 =?utf-8?B?dmEwRzl1R1pZc0RUS2g5anlkU2pNSkRQdWtkTk5rTXByd1lEaVNSaVUvR25X?=
 =?utf-8?B?bWFMUzdqYU1tT0QxSkIvb3Zoc0VoTURPNlcvNWRwcXpGdHlLZ2tNeUM4VTRy?=
 =?utf-8?B?MVRnVEdGRDBDN1hZNXFreVh0QUtoMGVpSWlJblFkeHNPdk04cmpTQjBQaXdB?=
 =?utf-8?B?c013MEQzVHhCNmZqc0tZNnIwL3FmOThNTVBWcytJQnROZXhFQno3WjJnbjZD?=
 =?utf-8?B?WG55Wk50T1NWejZsRDhkdHFKSXJJbC8vdWt3dWlxK1V0c0VQUVJYQTNLajFL?=
 =?utf-8?B?MDd5cHdyNExSekEzZldrekNDNHo1UEpTaG5YdEphb3pWRCtKZDFPTzZvZFRV?=
 =?utf-8?B?NWxPTkFnSDVMTExDWmcwYnFhWDc4V05GRFovT2hOa1k3WHN0L0pFY3NSTHlo?=
 =?utf-8?B?RFdSazM3OVFTbkt5d0l0MG1yMC9iMG41ZEZwaVJEcXdiTWRCMkorZzdob2c3?=
 =?utf-8?B?Njg0YVRPTlNBYWhIVmhER2JHeEIyNGF1dmV6K3I3VGVUVGxVWU5PY21IUEQx?=
 =?utf-8?B?K3NZSGZxZHZ6cHpyNks5K0FsNjhjckRRdGdvcnhNcjVHVCsyQ1g5SmpLa2lS?=
 =?utf-8?B?M0dCREZ3eGtTdzE2WUNhbHhuVFRGQkV1OWZjOXFwckdUM2FBbnhFK2NXRE96?=
 =?utf-8?B?QkJNeW9RYUs0bld6N0RXQWYrdHZaOWlGT3lxWWJpMkg5amVGUFVkY2VrMWpy?=
 =?utf-8?B?Y1Q4b1VPLzQ1RjY5MDdyOU1leWx3d0VoRE1TNDFDZkZYVU1FTHo4TjFaay9q?=
 =?utf-8?B?QzEzQlg5UWU0ZjkxQVJUVjRzVzhIY0o0bEl4WGxlc0RxV2FkOEdJd05Ta3cz?=
 =?utf-8?B?OHA0RW00dEpNYU1OalNjZTM4MXUwMnVIOGh2ZE94WkI4R3o3c0EzLzhYdWVk?=
 =?utf-8?B?MldEUDBaOU03UzhPZ0I1dVQ4UjhmV3FiUFhjOHdlWkdaOUc2Q3ZiUE9qalR3?=
 =?utf-8?B?cmxSWnlaN1hsK2ExTWFvL2pGcHBvOFpyeFoyOEIvM2pubnBaaVJOc28wNURZ?=
 =?utf-8?B?SHhhU2JhV25YR1doQTJMdlF1UWtmMXlPYnNDbkozdENnMFp4U0dSQlFaNHhR?=
 =?utf-8?B?LzhPUXJHOVVVejcvb1NWMFFlQ0JMb2xBMmo0WFRrQ0Q4Nk9UZitXMDVyQTBK?=
 =?utf-8?B?eXVQYnl3RG0zODVzZTE1NVFzRXcrdVNPZ2dGTUJFSDZxcDNBc295Sk1Wc3Zl?=
 =?utf-8?B?V0hRaG15UXNYU0dNMG83QTJmTWIwSlFGNzdicDdaaExpM2RYbFlFT2U5ZzFD?=
 =?utf-8?B?L0VIdlFJTDAxN2tiWnp2SnZRMHVvZG1CclF0bU1DS2RaZlZKbWU3OGNPMnhS?=
 =?utf-8?B?YjRCRXc4VUF0N2VhaTgyM2tFRm5WV3cwZGVlZnBsSTJ2bzVOSTVPUkNjc3lF?=
 =?utf-8?B?UEZsRVFIZHFxVFlIeEE1S0dzZWtZZUEraUMyakFGMHgyblVNb3JxT0wzQUZm?=
 =?utf-8?B?b3RoNU56TTBqaUdhNFB0YTg4SytZUDE0Qy9CM2d1eTlDMUdLd1FXTDJhbUt4?=
 =?utf-8?B?RlFwOTVJUTRHYWIvYzJOdVI4czVqQUY2dy9Qd1U3d3NNaW1tTjZNYXNueGht?=
 =?utf-8?B?Z2prZEM2UlNIYTRqL3VzR1VoQ0ZJcDZwZWZqMUhtK08wSFdGZGpqSWZSVjBG?=
 =?utf-8?B?N25XZmVxbngxMGFZelVOdVRISkN5QXJ6bU01amVxd1lNKzI3ZE5YTCtqcDBK?=
 =?utf-8?B?NEtOU3FOYTRwc1ZVa2J1MVNwTXByRitKdUxoMlVzRGlVZkpYSkhSSDBEL2F0?=
 =?utf-8?B?N29mYVlpRkk5RGRTWFBibllkSmJRNkpUQ2lJL0sxTEQ1TmxtWGRxNlpWUEwr?=
 =?utf-8?B?TjZCQ1ZFYzlQZENteFdTSTNsUEhNNkRxRURzSWFmQ2t5c0VLK0NacnlTWDNN?=
 =?utf-8?B?SVhSbS9ORjJVTmRkUEdzbTRMK0RZZk1FTU5hM3p0ZVd3Z0psTVgwSk5wRkpY?=
 =?utf-8?B?VmJLSXFBc2VTaW82VUlkU0lJSjQ2ZEtLcnhSWUVQM2sxU0xaWjAzTFBTTkd6?=
 =?utf-8?B?VjkyNFJyMlljTFNPV1pINXpSZXg3TFFWcDV4dmtQRWJsSzFEOTZtKzdjVEky?=
 =?utf-8?B?R2sraVRoL3ZJMUoySDhnNHNxemY2RTh3Y1pvSzA4ODhzM09sVHhEWHJGZDFP?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fb3662-aee4-471d-8160-08dd4cc66d3c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 07:08:47.9476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWZ9YltG5NAM+4XfeGM0IyzJKcR+Ym12GZhqyKR5qg28QDAtSSqb8Q0fOOHx5/JmTCdyjoOoSLh2VwyOfEcMSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6296
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

Hi Kunal,

On 11-02-2025 11:35 pm, Kunal Joshi wrote:
> refactor find_mst_outputs to improve error handling
>
> v2: change return type to int (Ankit)
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 415005774..edf9409b6 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -47,26 +47,33 @@ typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
>   
>   IGT_TEST_DESCRIPTION("Test link training fallback");
>   
> -static void find_mst_outputs(int drm_fd, data_t *data,
> -			     igt_output_t *output,
> -			     igt_output_t *mst_outputs[],
> -			     int *num_mst_outputs)
> +static int find_mst_outputs(int drm_fd, igt_display_t *display,
> +			    igt_output_t *output,
> +			    igt_output_t *mst_outputs[],
> +			    int *num_mst_outputs)
>   {
>   	int output_root_id, root_id;
>   	igt_output_t *connector_output;
>   
> +	if (!igt_check_output_is_dp_mst(output))
> +		return -EINVAL;
> +
>   	output_root_id = igt_get_dp_mst_connector_id(output);
> +	if (output_root_id == -EINVAL)
> +		return -EINVAL;
>   	/*
>   	 * If output is MST check all other connected output which shares
>   	 * same path and fill mst_outputs and num_mst_outputs
>   	 */
> -	for_each_connected_output(&data->display, connector_output) {
> +	for_each_connected_output(display, connector_output) {
>   		if (!igt_check_output_is_dp_mst(connector_output))
>   			continue;
> +
>   		root_id = igt_get_dp_mst_connector_id(connector_output);
>   		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
>   			mst_outputs[(*num_mst_outputs)++] = connector_output;
>   	}
> +	return 0;
>   }
>   
>   static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
> @@ -83,8 +90,10 @@ static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   		    traversed_mst_outputs[i] == data->output->config.connector->connector_id)
>   			return false;
>   
> -	find_mst_outputs(data->drm_fd, data, data->output,
> -			 mst_output, output_count);
> +	igt_assert_f(find_mst_outputs(data->drm_fd, &data->display,
> +				      data->output, mst_output,
> +				      output_count) == 0,
> +				      "Unable to find mst outputs or given optput is not mst\n");
Please fix the typo here.
>   
>   	for (i = 0; i < *output_count; i++) {
>   		output = mst_output[i];

