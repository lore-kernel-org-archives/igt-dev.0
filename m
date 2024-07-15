Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FAAC3DA55
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jul 2024 04:22:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD4B10E233;
	Mon, 15 Jul 2024 04:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+j0Mwug";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B883310E233
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jul 2024 04:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721017361; x=1752553361;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gYOL7WNrdLddE8PkJOc3p9dJOUP81UtNgWvMIS00djw=;
 b=A+j0MwugDmkbXMKQWmCl+in2miA7ZLqgnLL2U59NoR0p6oriSSfFzkI5
 gu06WgV+jH4DyeTBRpz+/6RnK1Dr/Lqx79yEOjxHSOUiC/NFIqZTw2ZpN
 1+VKw1UNTt49cj2+pnrJMX2XP3lCqHtUuZpJNB+Oz1z9RAC4z92m4cc3b
 DpUR01sohNN/qv8/AuH5RQ+rZ1gnbzIl55fZ8VJF3kEgsYK/QyWsD4UV/
 SXbPpH1xk3l7fh0sU4Wz/NoMwHOUsnBJRyB3IDsOG+zPNAnE2JOD2gkQK
 oNNss/HLTwQPjx6fUdbebS33vnabQ1Y46ZRaUl68a/c7NUoOVPEgJzv3F g==;
X-CSE-ConnectionGUID: J/mVZOrDQ9utNIqfHMKTvQ==
X-CSE-MsgGUID: svf49WtkR+if0RVliYwL5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="40908482"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="40908482"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2024 21:22:41 -0700
X-CSE-ConnectionGUID: oVuZFX1+TKS/5GtpLLtnQg==
X-CSE-MsgGUID: T+yF9btkRnSf+kVzGvIKHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="49580259"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jul 2024 21:22:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 21:22:39 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 21:22:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 14 Jul 2024 21:22:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 14 Jul 2024 21:22:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLuQCgcZGPyS0SIf9bTH87eH1MABLM85Qvg33RpKblU8W/ssgdlz8747CDwCa7TDbkfCVZo9YVRAINULUchZs96dXmsM4Z6w9rcYMeiHnomYFwjLwm93J8Wmh28PWON7nk2jOHWWljvcm7DoZisHKIHAOJqF9m4rNN4/fUcm8hh8c0I7/AyrHO7dYXcEWQHJfLCVZ/HhulsREXzD2cWBP6HbcTph7zjjjB26TQ1df1+vnrpM5mPeO0zwH3tKv0NfujO5wt8sDmlPtcJwjeQFi62wZQIR83eD/YG+Et/h4dJCnzoZ7hy/9dkCjU2VG98BBU8wx4kjbdbwgCteiFUalQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIbCBxfLLT2JkvxirQ/hkQ9o7/zvldVcHVoW1KlOLVk=;
 b=dld1FSTkLIBfbqFrAI9afI1QGtp2X19q1xGO8shggi//Mib164PfYgJppPg0meGv9waRj3oRgpe9NosiZKGg3s61qVArVcDdudmTBWwv/W2s8lJ0v8qMqoGNnBk5zgzFSw8ikWW0K5/grAEj2vt3xSnMmhoxXEfSDFYrG/o+5QwJ3GfuGqmmFmTPe3T4DyQZhbyPB0lxEhPo2DQq9qwZxHevk8KL80DytknXaDUvXdL510f1Vl8r01pusgi4ytVGRfisvYL5fX+wcKUzWYs9uGw15x8Iq58qPopwT7xTWKER79YABf8qeQp1Bi3F3TLYvcEI1kq97V7dGqVCqwRYLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Mon, 15 Jul
 2024 04:22:32 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 04:22:32 +0000
Message-ID: <71af049d-f136-4ce4-a848-d0f7c25d1b2d@intel.com>
Date: Mon, 15 Jul 2024 09:52:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] tests/kms_plane_scaling: Improvise the scaling
 BW issues.
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20240712065003.530021-1-ramanaidu.naladala@intel.com>
 <20240712065003.530021-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240712065003.530021-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: b22eab70-ff4d-412a-f37a-08dca485bed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFJZNkthSVZaWXIwMFd4WlBhQ2lCTFRxNW5JcnVTbVEvQnNyZEVjTlZpb1dl?=
 =?utf-8?B?aU5iTzBxMTlrRmpWNnVSMnhxSDZqblZVK2N6VUpsOEptU0lNVjRDN2x3TVlZ?=
 =?utf-8?B?UlZKUW8xa0RoM1VlU25YcEYrOG9jMUsrT3JIelhuT3E3d2dzRllVb25TQlBP?=
 =?utf-8?B?Zm1xbTlRL3dkd0oxY3dHdFUzSXdGcTZNRDByRXRRd2NvdVZQRmtaRDdJTHhu?=
 =?utf-8?B?bFE2bk5ycDJMYkZ1M2RocDdPWG9ZVkFpWU5VSGRGU1VUMUs2L0V2MUlHdmxE?=
 =?utf-8?B?Q0V1b3p1TE5Wb0VUUXFqc0lyOHdhdG9qeXpaTUNlYWVDTHVvUVRiWkZabUJ2?=
 =?utf-8?B?WDV5bzh2NEJXUGpDcVpvTUJVbUp6QnNjOXpZM2dIMDBZVWNSOS9wVC9qVk4w?=
 =?utf-8?B?d1BnWHR2WE5yT3BTWm5HZEdLUkpLWTYyZXF4NVF1VldTZC9Pbjh5NitXSWNj?=
 =?utf-8?B?RnMxdFhndGh1OGtPbFNSZi9FSXhnbFE5OHJSaUtkVlpSaVBDQ0M4MlpMaHlh?=
 =?utf-8?B?cm5ySUYraXE2d3ppeWtxdGcyNW16OEc1R0FKR05oZnV0R3lmeTkxcHN2Uzlj?=
 =?utf-8?B?VXc3ekplYVYwNDVuSWJvNU43MGpLNmQvdE84QkNZT0RoVXlpd3psenY3ZHlT?=
 =?utf-8?B?cjBOL2N5V3k3WU5vd1hQdW1USW9ON2VSaE41TXNzUWhYUmY3SVUzK2pUd1Bu?=
 =?utf-8?B?WmZZM2krQmlGa2ZjdkR5SWxnRWMvcXY4MVVwYVJsem9UZWQzY2g5Q3poMVpG?=
 =?utf-8?B?RndpT2k0SGRBMVlVVzFtdUdTV3hTUkdlRkFFdExiY1VKRjhKV2JyVlhncDU4?=
 =?utf-8?B?YmdqMWJqOWlhbDBCL29kV25CWlVjK25SeGd1eHUzdkUrNjgvYnRGeWdGcG43?=
 =?utf-8?B?NEUvZ3c5M0Q2VHRrTU1MRWFicE5TM29TVTRFL0NMQlNQNG03NTAvcEhiTzFP?=
 =?utf-8?B?NHM2Ykp5aHpXL1NNUnBQWDVJeVo5UUV4NDVBNnN2ckcrQlpjOXI2SGdTL2JI?=
 =?utf-8?B?TmdPeHlZRG56Z1RPakUrbnliUjNNMlB4aHg4eDRhODVuREZWY1kwbjN1Q2RU?=
 =?utf-8?B?THpWS0dCLzJJa0hDZkZpSFY0YUtXQXlEMnhPNy9XUXNlbnNXSk1Yc1J5SVlZ?=
 =?utf-8?B?ZVR0aTgybERiRThNejBQMm9aT3N0eXNDSFh0cVdaenlleFBJWHVpenRUckZM?=
 =?utf-8?B?OU55V1BZSFpXdmN0RGVTZnZxMFFaNjl1c1VhUEM5VGZNUEJmK3ZkVEtRTDZh?=
 =?utf-8?B?RkhkbWxMMExXK0dGWTdkVG5GTVJOUDFnd3IzRGdlcnYvZWphR0FnckVzQnpX?=
 =?utf-8?B?K0tKNlpqdWpGdmtOb1JBSHJvRnZvLzhpRGpzUkpHcnNRZXFkL2orVGJsRzJo?=
 =?utf-8?B?aDM0SUxJdmFlUmlaQitJMzZkVXpxcFdRbXNnbWpic3VBM01xemtPSTVNRXFE?=
 =?utf-8?B?SkhoYzdpejdEalJPSWtHQitPSng1QmtYbDlUU3lGRHEyOFpNekJETytsbEFR?=
 =?utf-8?B?dFoycGNMakluUFpRQndpcVpIRWo2MDkzS2N0MVpXOHpDTlYwZDVTaE1ZdWVT?=
 =?utf-8?B?UUE3SFAvWitaTHhndGFQNzE5OERINWJNcHFhVUl3SVpqdE5kVFNtMStoVHI0?=
 =?utf-8?B?NEozUlRBZ0JpT3lMY0tlMkMzTTVkb3JRQUw5WUxkTTJ5Y0M1UEhKZ2xxR0xR?=
 =?utf-8?B?cnY0cmc4b3BXclQrS2dFbUZ1K213R004ZFZGT1BPWGZJc1lOeXU3MHExRlN0?=
 =?utf-8?B?ZkRIUEIzdHUreXFKb2FjSkIxTGkwY0pROWVUcWxxNm8vWHZVd3JVYzlDVnB2?=
 =?utf-8?B?dG0xYkRMQ3pQRThlZWZWdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG1FYU45Mm1Hc2JQbi9IODNGazhsRUVueXRabEFRM1RrYjVIdmNuak1hU1NQ?=
 =?utf-8?B?TWNrY2R4ZGFUSE02SitzdFVSVlZmNGtYV2o4cE5JWEdZUHlxd2lqbVovcyto?=
 =?utf-8?B?eGNOM0tpb2M1YVlGLzE0Y3NvTklxdkZUMWpEZDRGakpHa0ltRXhralNhd2Zm?=
 =?utf-8?B?a1J0Z2liaVlWclJuRmFySXY2U29xZnA4YWg1VVIySHVoVC9ySFo3VzhEcXNG?=
 =?utf-8?B?NE1YWnR5M3h2a1ZHNjVOQjhkcTdrTEtyVUZWbmZBc3ppNnp2cG9udlM0d3ph?=
 =?utf-8?B?YkJvOHh0ZTB3SkI1dFB1bDlDV3FyeTAyY1U3REZtamlZbWhNcGdFaS9UOCti?=
 =?utf-8?B?RFF5bXNiS3JDVmRkcVNVd0Q5SitnSWpTV3dCNk8zdkczTStKYk5mdDczbzhY?=
 =?utf-8?B?QXlzWkxQWVh4M1h2VURHZWhoY3BCZlZuS0ovdzZpVGYyQUdJNU1KU3ducWln?=
 =?utf-8?B?dGFMWVQ1TkFCb1lteVhDZEI4ZjRyUitYSU9jeW1BZTJJL29xcXpibjJNcElj?=
 =?utf-8?B?VlFkQWwzWGI0MS9MNkFNeWRxR0xBL2s0U1pZaTdZMFhwTlNCeFpLZ3ViMm1Z?=
 =?utf-8?B?MkEzNEcvcXZLOXBDa2lVMHMxcDFqSlFIWHF5d1dpT2VFZTMwdkpPeDg1clEz?=
 =?utf-8?B?USsyMVlvVTRZOXQ0MjZZTEp6cEdxNUMxU1RUdmVNZ2hZWlpISlZQWkliQ3lm?=
 =?utf-8?B?NjNiWXN5NmpuZEFsdU9BUlc2ZmZhSWl3Zml4SGVDQjBWSllNdEsxSmZPRjF1?=
 =?utf-8?B?RDlJb1hnVmR5dWFnV0VuSWt5QWFzYmx1Y0FlR2lTQ2VQYWxsVEVWMU1wMStR?=
 =?utf-8?B?NjlLR25hQUpxRHhiTXBvRTBkYmZZbis0WGNrREhqaVVZeCs5aWdvOGI3RUhk?=
 =?utf-8?B?RTFSZ2hkdEZvZFU0WjIvNFF5R2M3ZGRXNDA4bGROOFdRdE52Q0hyaW1YRjFM?=
 =?utf-8?B?bS9lNmJYL1piS2ptZ0tSdlM5TVNzWnBxd3BBazc2dGZYM3h3Q0lDRWVReHlO?=
 =?utf-8?B?a29SWGJ1bzJVcnJWUFZaUTFnVHF1YVRpUGp3UTk4VThWeG5YdFA3NXlscDJx?=
 =?utf-8?B?RDM3U1FTZ2dUTDVlUm8wZlV4ZWpMc2ZtNkpPK1U5T1FPdUg2eTBFUnlqd2U3?=
 =?utf-8?B?ZXBRYTVObTdVMmpKWGFLeHZLN0tyN1M4ZkpWNDRYWlpncnlPYzVkVlRYd3Bx?=
 =?utf-8?B?a0VuQTJvNDlMd3NzK2JNK1o2a1VIK2wyS0dxTnN6ZTV6dGJvNU50UWtpblpj?=
 =?utf-8?B?a2xJVnZ5MG1RckxIWDIzaFF6ZjllTENjdGptZ1Jyc25TMmlESVZXRElsamR1?=
 =?utf-8?B?b1cvMGlDYnFIa1VQMjVIRjlXUzhWbHFZNmdWMG5UWmFtTDRpNE1UYXM2Q25w?=
 =?utf-8?B?Yy9TWGdsSXhwQUdaTDhZLzl4UHJadS9jcG1PUHJBWjRVNk5nQmw1Wm1sOVZB?=
 =?utf-8?B?M0xtT0ZlYUlvMEovaW53M2RVSmhOM1YxQzlydDQ0UTl3VWY5NmVFeVB1Mzk3?=
 =?utf-8?B?ajI2VkVVditSc0hJa3g4MEtDbExDSlB5ZUM0RVJMbW1INUlNdngvbm82KzZn?=
 =?utf-8?B?NG5EZWdZeXRqekl0aUJPTXNUNlBQb2xFN3F5Nmt4M0lybGsvdGRkRW1yaklh?=
 =?utf-8?B?OTlGMWN2VkRrUlRVMGc5dkdUaG9naU13Q2pXY3h0MktwbFFpaEYvVTFYRE9U?=
 =?utf-8?B?S3hJSEprVXgyVjZUaitKcXJUUVBhTStvYi9UZG1oY2NXNjh1d3I0M1hlM0Iw?=
 =?utf-8?B?SjRqbVZSb3h3SGx4MDFSeWJQaFNZZUFtWmZvYS9EUFl6RTZrWG52c0s3cmxN?=
 =?utf-8?B?VDdOcjBReXlMbzAyOFFBWUZGb2dhVzlrZFJ0b3RHRzhLbENpbTF4Ukd5cjFk?=
 =?utf-8?B?cTJZUFV0Nk9JNVh1SlFBYVhlNXBnRzdWaDVQZ3JTT1ZoSVFaTHNtaFBXSWYy?=
 =?utf-8?B?aEZXSjVTT1FySVNsalRPaitwN2ZqYlU1Zm0wcm96dHVUWDFlQXprUnUrcWN6?=
 =?utf-8?B?RTVIamhGNnFobG91OFdseTBrZndITmt1emZNVnRNb1BYL0srbFgyZzF6aDh2?=
 =?utf-8?B?TytvUFBuenR1R2x4TCtoNEdLMC9SYXQzSFJmWjZEOXUvMzhCVzF4T2gzV3Qw?=
 =?utf-8?B?OXZoRy9rVW0wbXVsVllUT1N3cTlJYVNVa1U4NUQ1VHhFcGE0eEFuV1psdzZB?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b22eab70-ff4d-412a-f37a-08dca485bed8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 04:22:32.0075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkg/tdCJ7smeM69s+jP+dFsIMn6mLjtcxMSSRTZ41B12i9QIriTG/KjifZ82Ep8aGfYP7kAogpeasWYB3Sx87rQAeDcPuvFnFe+M5GDrJww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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


On 7/12/2024 12:20 PM, Naladala Ramanaidu wrote:
> Many tests are failing due to Bandwidth issues.
> To eliminate this failures we change the least
> working display modes.
>
> - Observed, for higher modes Bandwidth is not sufficient
>    to downscale operation and multi-plane scaling operations.
> - Add a fix, when Bandwidth is not sufficent for higher
>    modes it will try the next lower display mode.
> - Fixed some styling issues in the patch.
>
> v2: Fix some styling issues in the patch . (Ankit)
> v3:Split single plane and multi plane scaling functions in
>     seperate patch. (Ankit)
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 181 ++++++++++++++++++++++----------------
>   1 file changed, 106 insertions(+), 75 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 3f63d3cf4..546869912 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -210,6 +210,9 @@ typedef struct {
>   	igt_display_t display;
>   	struct igt_fb fb[4];
>   	bool extended;
> +	double sf_plane1;
> +	double sf_plane2;

I think we can do away with these, as we already have these in another 
structure.

We need to pass the sf_plane in the helper functions instead of w1,h1,w2,h2.

So Patch#2 and #3 should come first, in anticipation of these changes 
and then at last this patch can be added.

Regards,

Ankit

> +	bool flag;
>   } data_t;
>   
>   struct invalid_paramtests {
> @@ -579,48 +582,57 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   	drmModeModeInfo *mode;
>   	int commit_ret;
>   	int w, h;
> +	bool mode_support = false;
> +
> +	for_each_connector_mode(output) {
> +		mode = &output->config.connector->modes[j__];
> +		if (is_upscale) {
> +			w = width;
> +			h = height;
> +		} else {
> +			if (d->flag == true) {
> +				width = mode->hdisplay + 100;
> +				height = mode->vdisplay + 100;
> +			} else {
> +				width = get_width(mode, d->sf_plane1);
> +				height = get_height(mode, d->sf_plane1);
> +			}
> +			w = mode->hdisplay;
> +			h = mode->vdisplay;
> +		}
>   
> -	mode = igt_output_get_mode(output);
> -
> -	if (is_upscale) {
> -		w = width;
> -		h = height;
> -	} else {
> -		w = mode->hdisplay;
> -		h = mode->vdisplay;
> +		/*
> +		 * guarantee even value width/height to avoid fractional
> +		 * uv component in chroma subsampling for yuv 4:2:0 formats
> +		 */
> +		w = ALIGN(w, 2);
> +		h = ALIGN(h, 2);
> +		igt_create_fb(display->drm_fd, w, h, pixel_format, modifier, &d->fb[0]);
> +		igt_plane_set_fb(plane, &d->fb[0]);
> +		igt_fb_set_position(&d->fb[0], plane, 0, 0);
> +		igt_fb_set_size(&d->fb[0], plane, w, h);
> +		igt_plane_set_position(plane, 0, 0);
> +		commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +		igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
> +				"Unsupported resolution parameters  %dx%d\n",
> +				 w, h);
> +		if (is_upscale)
> +			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +		else
> +			igt_plane_set_size(plane, width, height);
> +
> +		if (rot != IGT_ROTATION_0)
> +			igt_plane_set_rotation(plane, rot);
> +
> +		if (igt_display_try_commit2(display, COMMIT_ATOMIC) >= 0) {
> +			igt_plane_set_fb(plane, NULL);
> +			igt_plane_set_position(plane, 0, 0);
> +			cleanup_fbs(d);
> +			mode_support = true;
> +			break;
> +		}
>   	}
> -
> -	/*
> -	 * guarantee even value width/height to avoid fractional
> -	 * uv component in chroma subsampling for yuv 4:2:0 formats
> -	 * */
> -	w = ALIGN(w, 2);
> -	h = ALIGN(h, 2);
> -
> -	igt_create_fb(display->drm_fd, w, h, pixel_format, modifier, &d->fb[0]);
> -
> -	igt_plane_set_fb(plane, &d->fb[0]);
> -	igt_fb_set_position(&d->fb[0], plane, 0, 0);
> -	igt_fb_set_size(&d->fb[0], plane, w, h);
> -	igt_plane_set_position(plane, 0, 0);
> -
> -	if (is_upscale)
> -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -	else
> -		igt_plane_set_size(plane, width, height);
> -
> -	if (rot != IGT_ROTATION_0)
> -		igt_plane_set_rotation(plane, rot);
> -	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> -
> -	igt_plane_set_fb(plane, NULL);
> -	igt_plane_set_position(plane, 0, 0);
> -	cleanup_fbs(d);
> -
> -	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
> -		      "Unsupported scaling factor with fb size %dx%d\n",
> -		      w, h);
> -	igt_assert_eq(commit_ret, 0);
> +	igt_skip_on_f(!mode_support, "Band Width not sufficent for scaling\n");
>   }
>   
>   static const igt_rotation_t rotations[] = {
> @@ -847,41 +859,52 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>   	igt_display_t *display = &d->display;
>   	drmModeModeInfo *mode;
>   	int ret;
> -
> -	mode = igt_output_get_mode(output);
> -
> -	igt_plane_set_fb(p1, fb1);
> -	igt_plane_set_fb(p2, fb2);
> -
> -	switch (test_type) {
> -	case TEST_PLANES_UPSCALE:
> -		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> -		igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
> -		break;
> -	case TEST_PLANES_DOWNSCALE:
> -		igt_plane_set_size(p1, w1, h1);
> -		igt_plane_set_size(p2, w2, h2);
> -		break;
> -	case TEST_PLANES_UPSCALE_DOWNSCALE:
> -		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> -		igt_plane_set_size(p2, w2, h2);
> -		break;
> -	case TEST_PLANES_DOWNSCALE_UPSCALE:
> -		igt_plane_set_size(p1, w1, h1);
> -		igt_plane_set_size(p2, mode->hdisplay, mode->vdisplay);
> -		break;
> -	default:
> -		igt_assert(0);
> +	bool mode_support = false;
> +
> +	for_each_connector_mode(output) {
> +		mode = &output->config.connector->modes[j__];
> +		w1 = get_width(mode, d->sf_plane1);
> +		h1 = get_height(mode, d->sf_plane1);
> +		w2 = get_width(mode, d->sf_plane2);
> +		h2 = get_height(mode, d->sf_plane2);
> +
> +		igt_output_override_mode(output, mode);
> +		igt_plane_set_fb(p1, fb1);
> +		igt_plane_set_fb(p2, fb2);
> +		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
> +				"Resolution not supported by driver\n");
> +
> +		switch (test_type) {
> +		case TEST_PLANES_UPSCALE:
> +			igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
> +			break;
> +		case TEST_PLANES_DOWNSCALE:
> +			igt_plane_set_size(p1, w1, h1);
> +			igt_plane_set_size(p2, w2, h2);
> +			break;
> +		case TEST_PLANES_UPSCALE_DOWNSCALE:
> +			igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_size(p2, w2, h2);
> +			break;
> +		case TEST_PLANES_DOWNSCALE_UPSCALE:
> +			igt_plane_set_size(p1, w1, h1);
> +			igt_plane_set_size(p2, mode->hdisplay, mode->vdisplay);
> +			break;
> +		default:
> +			igt_assert(0);
> +		}
> +		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		if (ret >= 0) {
> +			mode_support = true;
> +			igt_plane_set_fb(p1, NULL);
> +			igt_plane_set_fb(p2, NULL);
> +			igt_assert_eq(ret, 0);
> +			break;
> +		}
>   	}
> -
> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -
> -	igt_plane_set_fb(p1, NULL);
> -	igt_plane_set_fb(p2, NULL);
> -
> -	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
> -		      "Scaling op not supported by driver\n");
> -	igt_assert_eq(ret, 0);
> +	igt_skip_on_f(!mode_support, "Band Width not sufficent for Multi Plane\n");
>   }
>   
>   static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
> @@ -902,9 +925,9 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>   	int n_planes;
>   
>   	cleanup_crtc(d);
> +	mode = igt_output_get_mode(output);
>   
>   	igt_output_set_pipe(output, pipe);
> -	mode = igt_output_get_mode(output);
>   
>   	n_planes = display->pipes[pipe].n_planes;
>   	igt_require(n_planes >= 2);
> @@ -1308,6 +1331,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   							drmModeModeInfo *mode = igt_output_get_mode(output);
> +							data.sf_plane1 = scaler_with_pixel_format_tests[index].sf;
>   
>   							test_scaler_with_pixel_format_pipe(&data,
>   								get_width(mode, scaler_with_pixel_format_tests[index].sf),
> @@ -1333,6 +1357,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   							drmModeModeInfo *mode = igt_output_get_mode(output);
> +							data.sf_plane1 = scaler_with_rotation_tests[index].sf;
>   
>   							test_scaler_with_rotation_pipe(&data,
>   								get_width(mode, scaler_with_rotation_tests[index].sf),
> @@ -1358,6 +1383,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   							drmModeModeInfo *mode = igt_output_get_mode(output);
> +							data.sf_plane1 = scaler_with_modifiers_tests[index].sf;
>   
>   							test_scaler_with_modifier_pipe(&data,
>   								get_width(mode, scaler_with_modifiers_tests[index].sf),
> @@ -1382,6 +1408,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> +						data.flag = true;
>   
>   						test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
>   							mode->vdisplay + 100, false, pipe, output);
> @@ -1402,6 +1429,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> +						data.flag = true;
>   
>   						test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
>   							mode->vdisplay + 100, false, pipe, output);
> @@ -1422,6 +1450,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> +						data.flag = true;
>   						test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
>   							mode->vdisplay + 100, false, pipe, output);
>   					}
> @@ -1442,6 +1471,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> +						data.sf_plane1 = scaler_with_2_planes_tests[index].sf_plane1;
> +						data.sf_plane2 = scaler_with_2_planes_tests[index].sf_plane2;
>   
>   						test_planes_scaling_combo(&data,
>   							get_width(mode, scaler_with_2_planes_tests[index].sf_plane1),
