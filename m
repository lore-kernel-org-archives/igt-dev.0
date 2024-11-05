Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82796D2B92E
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 14:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4128810E5C2;
	Tue,  5 Nov 2024 14:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRQNvyQv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D8E10E5BF
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 14:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730816997; x=1762352997;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=L8QKEnMT0GIRi4p6erwouf1A09YnF9L+myAagaFGsQA=;
 b=bRQNvyQvtq/rXJY73mD+sk3oEpIQpxDQ7MmbGBHUVtduVC0dn1wDJ4R9
 CupXXbS7B8kOLE++YQtWl4GCVug3rZHZKEHKy4zpCCbx+DtcGrrlSID/F
 nKxA9VQ2ZZKKtlF0Cc0/aAyBP68u0t8GneNo0NiI2555VINpj0Lrf7MCM
 /ItfyF4SPXWxZUxSERwQltpRdNDwFZofLZXYg7LV0EkpdX0xk3sCX1rU5
 TIEC5hTQZ2jXKM9c91y9RLUcvRPNIAZybEy0jQqBhf5kixljIwcPzGm5F
 UobGLvetc5DxDNOP8WWljb3bEWf9/mB/v6AWRnvOZd0yO6FtPYNeQ3Ep+ w==;
X-CSE-ConnectionGUID: VDwhDl/+T4m8z67q1IeAcg==
X-CSE-MsgGUID: 9iu+OKimQ2m7MK1TOFXH5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29991544"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="29991544"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 06:29:56 -0800
X-CSE-ConnectionGUID: Na3CfgMXRTKW3DzfeGwDxQ==
X-CSE-MsgGUID: ISD+JlrTSlWkyx+TRuBEZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="89174181"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 06:29:56 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 06:29:55 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 06:29:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 06:29:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypbns9AP57azIvT3urXL7v8ih4/oNUQZ6xM8Jx4Oh0jp9o5BXMeRX1khx279ZW6VNqK0UsfrxwdPEt8sXWpW53V70Sd2D2q3KsvJFg63ODbdtrklw8RwR36fmbAI/16B4/NtWMymdxdelp7w9333+4p9Gs4n6FmCn1+LxapJeOe/5sM4v4blG0NBl4sHCZNjUwhjMiSFWgmzVKaStKPOlN/p28n07u25W6d7Izd7+wBx9s1QZmV7YX1DBJYX3VhrmkJgLEraCs9jC9LnvpjQFajeaHZSbLwQTSSGPerkw1dwqAsd9vSSCe0g29pTNwflto7hv32RuXAYWESUqpX4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8QKEnMT0GIRi4p6erwouf1A09YnF9L+myAagaFGsQA=;
 b=lLRm2cenAgeEiQEBEsG9onJOCpYCHOce/0BFQCON8Mje7za7kwu0UxAY4iTykP3NpyWgT3Iu3PfcSYsGtRKv9eUvNqwWW9U4x6NKC7xwnf5n71VfXRSUxGrd7phjHOe2r0eEu+IEHopNE+SvmMapIfehioe3trcgdXpzjGUP+90L5wzOl2njDlTzCrXcATAc8RTjqDg1oDknkttQhaQ0vuj98bga+gN9/PKeJFyOcbAsMuyzsmBExWwfN0aQbwbSMUGJ9jBEphnuJjUPpOxcix+y/gZC/0eg9fZufbgyg+P4eRuH1jJ8CS7LBQEWrfjHAwkJ8h+TKXymZbIJ887qUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BL4PR11MB8872.namprd11.prod.outlook.com (2603:10b6:208:5a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 14:29:43 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 14:29:42 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 2/2] oa/i915: Add ARL standlone oa files
Thread-Topic: [PATCH i-g-t v2 2/2] oa/i915: Add ARL standlone oa files
Thread-Index: AQHbLvukcaiKfZKfyEKrGLHhAL55CbKnnNSAgAABRICAASI8AA==
Date: Tue, 5 Nov 2024 14:29:42 +0000
Message-ID: <f6e5b6e718a5d5bd8e36a520174a3a470bfbf137.camel@intel.com>
References: <20241104205201.175541-1-jose.souza@intel.com>
 <20241104205201.175541-2-jose.souza@intel.com>
 <85ses6yaia.wl-ashutosh.dixit@intel.com>
 <1482d21ea72a8355751be4cc40c0b7317bec3578.camel@intel.com>
In-Reply-To: <1482d21ea72a8355751be4cc40c0b7317bec3578.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BL4PR11MB8872:EE_
x-ms-office365-filtering-correlation-id: 7e46dea8-4002-4ed3-9f1b-08dcfda64a00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VGVkbTljVVBZTmpNYzdzMVJ6YU9ySHlrbDVmb3Zoak1XUm05SFJ1eW1RZU1K?=
 =?utf-8?B?V0RUa2VzTjFURC9MOC9zM1loZEZkYzdNRjJDMThSK1A3akh5Y1dHVVNEWTlD?=
 =?utf-8?B?RG5iQjVWK1lONWJ0RWNsQzlKWC9oc3dZaVloVWZIVWkwenZ4bHc1Z2p6QlRD?=
 =?utf-8?B?TEZZeGtlNjVPekNCM3JvQkxVcWlPL202OVZxQXBBSjF6dmppOURTNnYwS2Zr?=
 =?utf-8?B?VnVISE5wcHZlcE92Z3BVMHp0Zk5vMTFuNSsrbVpOS21NSU85NlhscXRweUFi?=
 =?utf-8?B?RE8veUM1Nk1uMFNielR5bjhBNUN6K3NORGthVUtrVVBYUXUwckVZMTlMdzZ1?=
 =?utf-8?B?T0loaStvcVBwMGRjbFNWSEZqWWR1KzgzdW01d1JnTGRwZ04ydmRWTWxxVzdm?=
 =?utf-8?B?N1ZHdkJlbTQxT0taVWd0eUp4bXZFM0ZETzZRU3F4bFpaR1NXcFBsMGtGS0tP?=
 =?utf-8?B?VE9uYXhkWXc2V3JQM3J3Y0lSVFZ3SmdPQkU0U0FNeWdCVWlrZU43TXNMdzdj?=
 =?utf-8?B?SXIrM0p4NE5UWnlwNTd3djR3SXFGNDZQc2kxWG1Qbm9VZ0xjc1k1RXQzNlFl?=
 =?utf-8?B?bkovREVtU0ZxaGdaeEVMT0JXdjAyT3VNRHZlK2t2bXZzcEY3NEVQaVdCV2lG?=
 =?utf-8?B?Z2F1R0RsTmtXZXByVzZWd0FaQjdZamtVd3BBQXdSSUNUdUNuNG5yN2R5b0Y0?=
 =?utf-8?B?RE1nYUFid281SG5hQnVUVUFjVEJaNUVsUTZ3ODR2aVVsN01JUFJwTUlkYU5r?=
 =?utf-8?B?SWF5QjZIMnk1amxOaHIxYkphYnV3OXdUNEN6aHJhdFgvUmZyUmlraGowdHBP?=
 =?utf-8?B?TCtBQUcwT0pRTHlKUlo5UXN5OTZ2NnVxcS9VcHJZTE80ZEZwR2o1Um04dXJk?=
 =?utf-8?B?LzRYeXBVSWU4bXQyWWdncEZ6RFNLWEd0RnNmNkhFcTlXbUp4bkJ1YTNFcHM3?=
 =?utf-8?B?VG1QQzNxOGMvcHlFQ2E0KzdVOXFJaXdPRGZzVUFONWduV01BSlAwek1KTGRK?=
 =?utf-8?B?dWg4M3Z6K0ZwUlNpdnVuMVYvanlja1orbEFmSkhXM1RxMTN5bnU4cUV4TEpZ?=
 =?utf-8?B?dkVmUDRCTWl3byswTHlrY1ZDUi9ESjBJUEZkeEhaTnpvZzVDMmFsUmdjbDlQ?=
 =?utf-8?B?Sm80cnl2eS9KSDVBWGFqcUlLdGs2S1B5emRYMmtyRDFob1NwckRpWGI4U1Nm?=
 =?utf-8?B?VjJMU1dlZUltankyYnNJZXNmT2s0SS9hZlhNcGJzUmtkN2VqRCtsRGxaekt6?=
 =?utf-8?B?T0xMbTNoMDZUcGVGTkdKaFc4a3ZvSlJQSjkxeGMyMzAxakt4MVVqcnV0VTdw?=
 =?utf-8?B?T3RXM1IrZ2NubDc2K1ZUdjhsQU5YbHVwbWZtVEFIdkNqcFpRTHc2SVhjRUxx?=
 =?utf-8?B?cjBpYzBZb21iYU81N2JtYW5IT1dFTFdPdG5lckJ1MXFrVU1hZEkzcUU3aDls?=
 =?utf-8?B?L2h6RWxDWTIvOUdvenhaSkhtSHBMbXd0STlQZjZ5ZG5nUFBZd2JUWXZ0b080?=
 =?utf-8?B?WHkrNVRnSGlCekxCeVdkT3BxOWxsY0lPOUhMTUltUFFIV2JxVllNTXA2a2o5?=
 =?utf-8?B?WVNLUVlkT1ZpQm9xWm50VlV3L0kxZHhjMEE3RGRKQ0l1R3Fwa0lCU1lxWmIw?=
 =?utf-8?B?R2RzTnFkVXhzNjdtSmloOUEva1ZDc0FhM2VxYzAyRjZSWHBSK3ZkbndSSEpk?=
 =?utf-8?B?ZzF2d01lTnBJZVVjT1dpQ01NL2FyOFArdlNNeEZiRFcyblhvSVhVZlMxdmwr?=
 =?utf-8?B?dlVtNEVQK2dpM1luU1NVT2k3SjJFU2Z4YzF0enpablhvMGNiMjdHWkxHeVdr?=
 =?utf-8?Q?wIAlOY8EIyZXRdFEsJSRY6DXJBYh37wrFlUdE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ek5Mb1BMMXNRVGdQNkVBSkc2WU5QSzVDYlVSSm80WWZHaDU5bWhrWE9lK1ly?=
 =?utf-8?B?SlVXWHlzU3ZFeFN5MlJZSVl5dTdlY2pYSEh5c2hlWk9ibEVVSU4rUXhRckVJ?=
 =?utf-8?B?QnJkUkk1VDJReHRNOC90OWk2d1VxYURjclNjVkxpL0d1UlN6Y3ZVL1EyMnE1?=
 =?utf-8?B?RWR1elBsQmppK09BYVYvRGxjYlVid0JUcjR1OHhBTGx0MXhWdHU0aHZsRXVI?=
 =?utf-8?B?RTM3Z1NUV09GbHVhZ2pvRkYvbWcwN0VLazlCMWpXYmUvR01GZGVjMWJEM3Jk?=
 =?utf-8?B?cDZPT1ZEMVlXRlRnM2xEdFJyeTNOUExER2FMZ2JBU2ZnMDJMYTViekpKVE9H?=
 =?utf-8?B?MWtjdm9yLzBndW5XUDZjWnVuV2RBd2FySlM3MFdkQkJ4N0I4dGpCVFY5VWJY?=
 =?utf-8?B?UVpEYzY0VFVwM0Jjd1Q1Sm5Ec0t6S2M5SjRSNVdFMW12QThOaEx6WU5qbVNv?=
 =?utf-8?B?NUx2U0t6dDVYM2toTFRlTWN2RlFhVVZzTmtkS0dsMUxmaE5yOFNlaTQwMjk0?=
 =?utf-8?B?a1ZJZzJad0FORGtmdmoyU0lBbzZld1h5OUhwU3pNM1NpRGlaRS95aWdxeUhX?=
 =?utf-8?B?YjlJQTdyOTFTbXVyTHZFUFFDUUgzeDZGOWZZSFZKRjk0cGJNa2JRbGZxQnBB?=
 =?utf-8?B?b0hiTk1uSlBManhXNUNKWHZDS3ZVZWFOek11MTZoamhXNFMyYWwzK2FDWGVZ?=
 =?utf-8?B?ZnJrQTg3cFZ5MjQ1VWJ0SGpFcjg0VGlXLytwS0IxWmZ6VlhMS2xsVGpyZ2dY?=
 =?utf-8?B?OFowZ2s0UjJFZ1ozRlBqYURLR0F0aTNMcUh0SjlOM1Q3R0hnUlFzelQwaFJX?=
 =?utf-8?B?bytpeDhRUVBBZm1vWnByWWRhUmNYSG4rcHpkbFd3N2RYdVNlbVN2T25FdEZz?=
 =?utf-8?B?SGRwK0sxS2c5OWdteENHZitTM1R6akQxRldNUDFrSTRrWStaK00yWUplNFZ0?=
 =?utf-8?B?WmMvRllFUDMvdEFZMEpSbmJHU211Smk0RjdsTUZqOEhxUTZOaWh6ZlpDM25K?=
 =?utf-8?B?ZWZVKzc0a2kvcVB6aFBGdS82MXI5V1FIcm42eTROR29EZExEQTdxUFh6MHFU?=
 =?utf-8?B?dzBXWkszT3pkWkhVeDRFUlpxek1kbWlEcS9hR0l2ZVBuMEpMcmx5Vmd5cmFh?=
 =?utf-8?B?dVpPUUhabzIrdjBZKzNHaHZoaE1KRyt3KzNYd25GUEc1SEpuWFRQVi82WmM4?=
 =?utf-8?B?QVd0RHhoTUJjd0JEQUs0UTdacG9WQWw0Vkl6OUVaUlVpSTJZZXNjK3hMN2J0?=
 =?utf-8?B?VGFIQTVnbnNJd0svckdSK0t6TTl2U3dBMnlBUTREQS9jK0ZhcnRHQ2tyL1Jo?=
 =?utf-8?B?Uk4vdnJRemJEbEN4MlN2d044dENrYXJxSmVOcGcreWw1dk9zVkJFRkpQdnpa?=
 =?utf-8?B?OGlXbktiQmxGNm13eTJhYWt0UjVreU41OGlnOTYwVTFvVDU4ck5kckY3eFJz?=
 =?utf-8?B?Tkh5ZGU0dktrbFltL0lsUWQ1UmY3WnYvYnNiNko0bURVR3lpdWs5TWM0bVJ5?=
 =?utf-8?B?SURZSnUzVU9WN3BjU2JuN3ZkeU4zWXlwNnFESHNyTzJiTjN1VFZjSnFGYzNL?=
 =?utf-8?B?TGtROE9XZXdFUHZyN2JpTGJINUxsR29GMnZHNXpNd01CaTk5SnMyTTg0bkd4?=
 =?utf-8?B?aFRpTWZteldTM3BrTG4xN3hUMFZ6MVFOVTEvd205RnhEdENzU3o0RTFZc0JI?=
 =?utf-8?B?RitnT2JBUjlOTUxNVTFDNHMvd2dZVE1LRXhoSEltRUZPS2pnYm1NU001Q21J?=
 =?utf-8?B?bFliTlFRV3JvdU5IYzZpVi9vcmdoWXRmK0JRbHVWUzV4TUZKOUtnaEYrMi9r?=
 =?utf-8?B?OUllYzErdjJpWkRDVnFteHdPMWNxVDBQejlPQml0QVBRSFJOQk9xR3dvVDFy?=
 =?utf-8?B?ZVIxdWcxYkhBaXZXYXlFaVVxU0JiYzVDQ1VRQk1RbHJSNWVMeS83VVAzV01J?=
 =?utf-8?B?RHcvdVFpdEErWS9WeCtIOHhqUHN2a1NKWDlDSEhlS05EZ3huZ0lkcUxQT011?=
 =?utf-8?B?RlNRUTVWTUhBbjYrbWJyb0ZIajNzL3pIVWpQdWpTMUx0UkNRcHJudm0wZ2t1?=
 =?utf-8?B?NmU0RzE2ei9MMlg5RmhvbE5HZTVjSXZRaWIyTWN1WXJNaDhvNXVvZU0wbnda?=
 =?utf-8?B?S2MyU2hqWk44ZzNOZFIyQ1RRNVBVWEFpVnZXay8zSTBCdUVtTEh0YWJQMUpa?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AD884485DED1A479ACB5BB248591310@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e46dea8-4002-4ed3-9f1b-08dcfda64a00
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 14:29:42.7489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zGr3YrBqqa/b+bb1hMCCDui8K46OMuoNaMigy+pojKHWou1ym966ZilwV6vvISCx1SzMFvFhWcdzccO5HjNnrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8872
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

T24gTW9uLCAyMDI0LTExLTA0IGF0IDEzOjEwIC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBPbiBNb24sIDIwMjQtMTEtMDQgYXQgMTM6MDYgLTA4MDAsIERpeGl0LCBBc2h1
dG9zaCB3cm90ZToNCj4gPiBPbiBNb24sIDA0IE5vdiAyMDI0IDEyOjUyOjAwIC0wODAwLCBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIHdyb3RlOg0KPiA+ID4gDQo+ID4gDQo+ID4gSGkgSm9zZSwNCj4g
PiANCj4gPiA+IFRoZXJlIGlzIHN1ZmljaWVudCBkaWZmZXJlbmNlcyBiZXR3ZWVuIGdlbmVyYXRl
ZCBBUkwgT0EgZmlsZXMgYW5kDQo+ID4gPiBNVEwgb25lcyBmb3IgdXMgdG8gZ2VuZXJhdGVkIGFu
ZCBzcGxpdCBBUkwgdG8gaXRzIG93biBmaWxlcy4NCj4gPiA+IA0KPiA+ID4gdjI6DQo+ID4gPiAt
IGFkZCBtaXNzaW5nIGFybCBjaGVjayBpbiBwZXJmLW1ldHJpY3NldC1jb2RlZ2VuLnB5DQo+ID4g
DQo+ID4gVGhlc2Ugd29yayB0aGlzIHRpbWUgY29ycmVjdCwgdW5saWtlIHRoZSBsYXN0IHRpbWUg
d2hlcmUgc29tZXRoaW5nIHdhcw0KPiA+IHdyb25nPyBNYXliZSBpdCB3YXMgZHVlIHRvIHRoaXM/
DQo+IA0KPiBZZXMsIGl0IHdhcyBub3Qgd29ya2luZyBiZWNhdXNlIGl0IHdhcyBtaXNzaW5nIHRo
aXMgY2hhbmdlLg0KPiANCj4gPiANCj4gPiBUaGUgc3ViamVjdCBzaG91bGQgYmUgbGliL2k5MTUv
cGVyZiAod2hpY2ggS2FtaWwgcmVxdWVzdGVkIHRoZSBsYXN0IHRpbWUpLA0KPiA+IGJ1dCBJIGNh
biBmaXggdGhhdCB1cCBiZWZvcmUgbWVyZ2luZy4gVW5sZXNzIHlvdSBjYW4gbWVyZ2UsIGluIHRo
YXQgY2FzZQ0KPiA+IHBsZWFzZSBmaXggdGhpcyB1cC4NCj4gPiANCj4gPiBPdGhlcndpc2U6DQo+
ID4gDQo+ID4gUmV2aWV3ZWQtYnk6IEFzaHV0b3NoIERpeGl0IDxhc2h1dG9zaC5kaXhpdEBpbnRl
bC5jb20+DQo+IA0KPiBUaGFuayB5b3UsIHdpbGwgb3BlbiB0aGUgTWVzYSBNUiB0b2RheSBsZXRz
IGhvbGQgdGhlIG1lcmdpbmcgdW50aWwgTGlvbmVsIGdpdmVzIHNvbWUgZmVlZGJhY2suDQo+IEJ1
dCBub3cgaXQgaXMgd29ya2luZy4NCg0KTWVzYSBzaWRlIGlzIHJldmlld2VkLCB0aGlzIGlzIHJl
YWR5IHRvIGJlIG1lcmdlZC4NCg0KPiANCj4gPiANCj4gPiA+IA0KPiA+ID4gQ2M6IEFzaHV0b3No
IERpeGl0IDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBK
b3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gPiANCj4gDQoN
Cg==
