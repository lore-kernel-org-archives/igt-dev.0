Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869F9CFB421
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 09:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4952610E35C;
	Tue,  8 Oct 2024 09:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfThhAyI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BEC10E35C
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728378589; x=1759914589;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NM6UKgzHPc6SzGZihwJxi/aicoaRryWepsfMBN/WOsk=;
 b=BfThhAyI9q9nhZF1V4jBU4G8KO8rxpYTJMNFSF1TMVzpuwGQIIuKj1d8
 ID5rQy2BcmtlR6KQzCvem4aJ1Ls9/PCTiKTKle4InpYulGIPSN9jMYwMc
 kG2D53yXMyEsTWWVIMAdqhY7mL0WRYwrHnmv9gQm705FxPe0Gff6Tov12
 Wt/LfwaHJ2u9u6jkAB5NYY1RcJbRBHbuPVlClgvFl1ZYXMxElSngQJpi3
 peMBPLZZq/sUDPzBXSQZ5kYx0l53vwXozXTMVIQnF7DL1oVbM9FQhvIbC
 9bXl3PMf/KNsrscomzNfvt+XnPhZk2/T7cGD+9J+OiDSS6z0aJxcox140 A==;
X-CSE-ConnectionGUID: LMpUHoWXTqeaKwVc2wQgcA==
X-CSE-MsgGUID: wu0JHih2Q4qzeyoSPQv7Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38125725"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="38125725"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 02:09:31 -0700
X-CSE-ConnectionGUID: MW98ViwBTnuizjSmmB7WOQ==
X-CSE-MsgGUID: ByPGUqRxTSigulo3RxksOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="113228886"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 02:09:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 02:09:29 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 02:09:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 02:09:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 02:09:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNU1DuFrNMnBZYgRpAuo7cj1RXlRCkRv3YvMZDkI9permLfPKuUIVOQP3XUNN6dHOLPNfI+8/X96K8Z+MSK/rBucskvO/J31t/zmmN4EDuR+mnaw91L+9KLsImbr8QNIZ4CScbCRrA6kTqirH87aMT+DxRDeg1O6PtjK9sBklfzwjeqCbKjK2ERE7hwIy7DnmFrwrBr86SGxnx8TQwv1UvzhEuaAU4OojZSHj+P2MoUN0XZoH8ZxgB3xiH2PfuQf/JpTK4DEit8/9XO68TeYL23/SPN62+gkFlInAVFVq8RlVdsKd5YS+72NI8lQ4wBcjYLDJNOYollxSXh5678VAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM6UKgzHPc6SzGZihwJxi/aicoaRryWepsfMBN/WOsk=;
 b=mA98snfTU1ydK0vkP8VwGBJS7bVN4NC2s4hjVAXikmZhxAp3Vxw6yjwpqXAudhuH8h8fD0wua+q10nqoVmLbneqXy/QWnrD9LXYePik6q6bOP9Y7OZYGxgZihwgtfQYgkv/iZ5lkisaB2MaFfoEC6J720SOFAaF0L4rlvlx4cspwRC7cMmCSlY91g93oRXUb3/EJArnkASyyAORQAkJYHiLXGPaPONRct7Og8kKfXmDSO/JAvdWfZ6EpPbSpekxR+I5OezQtAVPxwGB6c87aFyViZUxPNcn29W5dybuS+CY5Id9ufQLaBP5Td5B0Gyunep4cXYc4WsuzohTdBY4mVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by DS7PR11MB5991.namprd11.prod.outlook.com (2603:10b6:8:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 09:09:25 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 09:09:25 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Sikora, Pawel"
 <pawel.sikora@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t 1/1] tests/xe_eudebug_online: Remove redundant space
Thread-Topic: [PATCH i-g-t 1/1] tests/xe_eudebug_online: Remove redundant space
Thread-Index: AQHbGWGora4oaTYl1EW9xbxn6dlnDLJ8kMSA
Date: Tue, 8 Oct 2024 09:09:25 +0000
Message-ID: <af181ae7ea14f87b172d5aa583abc2cb93eed426.camel@intel.com>
References: <20241008090727.4057-1-dominik.karol.piatkowski@intel.com>
 <20241008090727.4057-2-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20241008090727.4057-2-dominik.karol.piatkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|DS7PR11MB5991:EE_
x-ms-office365-filtering-correlation-id: 903dfcc0-50e9-4d36-dd9f-08dce778e7db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UkJmOHpNZ0hOdnZNMGN4bnM1dVkzMk5GeEJUNEd3T1I5eCtscE4wT3NJL0Qv?=
 =?utf-8?B?OU1sSDVQZWlsK21wZGNnTjhmWUVGanRPbXUvS0pwcWQyeDZMWHo0QlRiZGNX?=
 =?utf-8?B?MjNQT08zdXlrc0llOGVtbjd4S3UzZzRSYW9GODN6YzZaZ0pkV3ZmK2ZOVzlM?=
 =?utf-8?B?djRnd25EeW9HTnY1UzZEcjNiYmVZeG12cXVsSDJaN2dxRkk2TkN6My9GYmx2?=
 =?utf-8?B?VlVhNmhRQ0VsSHhjTVJJMVVOMEdSam82RjVKbER3RHpON2hqSXZGS1dOT0pi?=
 =?utf-8?B?R201dnJ6QloxMXd2bEJ0SnB4a0l4RkRPMlY2c2dheC9mMDg2UmV3bktoc3pZ?=
 =?utf-8?B?VGhDYWFvbXZuc3U4U0NzSmJRNitGYk5XaDA2TVdhNFNCQm5UUFk1ajhvQmpO?=
 =?utf-8?B?ZjJ0RnRsdXByN1pwajZJdjhlSmhLNE5MSTBXVzhWZnNrbmh3aCtFSUdjV05l?=
 =?utf-8?B?Tjl2OCs2ZktHbXpEWUxlblIvTUVCR3NhMmp3T2hYd2ROQ2FzdXloVUY1UEZ5?=
 =?utf-8?B?MWdvVXowK0wxOWdNeXI0UWdncGVKa2krYTR3TEVnWjNxc3N6eWVUUmFKV2N6?=
 =?utf-8?B?dmNzN3QyS1kzeVFidEY5NHBxY0RrOU5rbFFsaVB1KzVHWHVjRjM5SU8vbXU1?=
 =?utf-8?B?UkRJT1FPM05lcDN5Sm10UWZLbnZNNmZuRU1wMHpRaVQwSHdQZi9sNU02d1dQ?=
 =?utf-8?B?THg2SlFUbmE4WCtDRURBU2xNSWlwVkFTYXVxanBkdFl3RFI4ejB3NSs3RmN3?=
 =?utf-8?B?MkpoeXp4RnFsaWpVYi9tQVJXL0RmeXRwZGJmM2g0Syt0bG14UXE4dzRsM2dh?=
 =?utf-8?B?MUFsSnNRQ3RqWWlZSVI3Ykd0Z3ZJWXdXdE9mNWZQNHh3V2hZYUt1cVZkWW9L?=
 =?utf-8?B?WXQ0SFYvQ0hvS2ZKdDNGQkRwbmFhSHJkenVUN3E4Nkx2QkNBQi92WnNpeHd5?=
 =?utf-8?B?Wm9EVlhYd1RJbjhLN1grMXJ4M2hmYWxCNE5RVk5NM3d1QlRUNHcwTlRiY3Zp?=
 =?utf-8?B?VGZVM2N3bFM3ZDNBK2dPd1dsaVRMQ3hkcnN5b3Rxb3dGRXR2dGxGUmZEWEY4?=
 =?utf-8?B?Qy9NVDdMSVFmS1U5SThsMFZjVzB6bktXbE11UGljUzhaNUgzL0gzM0cvRUIw?=
 =?utf-8?B?YVFFTWVjMU52SGhjbkswblMyOEdsSWh5ampMam5QRiswMytOalJwelNLbkVO?=
 =?utf-8?B?RkhZekJPTUV6Q0YySlRjWFhhd3ZRSFl5Y25LVXdvNDRqdlZjSFRpOVZPR05X?=
 =?utf-8?B?YWZzUkxxQ2RjUVYrTHh0SjdYT20zeHd3K2YyRHRUSW1WS0FFWEdCbFZ1UC9M?=
 =?utf-8?B?T2tGR3hJWTQrTzc3c3FQb1FwUy9VUkxiRWRiSytIeDgrQ3ZmZ0pJWi9FZU5H?=
 =?utf-8?B?cStNcThDdnBzY2VBZFlXZ2dyWXllTU9HWHdjMDNxdnhGTUE4eE0xeS84THpv?=
 =?utf-8?B?VEN2bzlBV3FoTnRUbGpWUTlpVVdTcHZIS2hUYUh3b0VheGI5M05FOFowUFF0?=
 =?utf-8?B?bjJsOWpJdVRjcmRKVGwxOCtGQndEZ0VhQ1NGanBmZ3VzbnJIOHBjMnBvVGFy?=
 =?utf-8?B?MUVvM0xZM0JSK3BialRCN2V5Qkh1d3dPYkFLTE9OYVlZbEk5NFgzMjRWR1Nw?=
 =?utf-8?B?VDVMZGhMaVJMUnlLUzB2MzFyNmNJcDEvUzU5Mzl0dGVTem5ZdW4zc3hQcHln?=
 =?utf-8?B?WVI3aTBWTEwzNFNnZDA1OG00cC9JOUlYLzBLS2h6bUFkRmtnUXdGRVBTczdv?=
 =?utf-8?B?WWowa3ErUVU5bDkwNnFzQi9zdWNVN0tURFBUQ3ZCRUFOSGJVMnRiQkhlZ09i?=
 =?utf-8?B?V2E3VEE4dUptTDBuZEJBUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1NGRHpRb052dS80RmVzZXdTWExsbzd0eDR3Wk1jcG9Vbkt1cEpTTHhPS2FO?=
 =?utf-8?B?aFFKUTVLZUxBZjByZFdBUVZVMVpZWXJ6bmRlMC9UR0w2SVNVSlZlSmp0RHNp?=
 =?utf-8?B?NWY1cjlmNWFiNzNScnJpSkhuQTQ0QVFxdVo5cmZzY2xGY0ZybC9ic09SMU9C?=
 =?utf-8?B?aDc0czNabEJ4d2JNQzN6Tk9jUEZ4MlIreGV1RGZNK0pYNlVONmRaQ2Yxdm1r?=
 =?utf-8?B?dTZSbWVJU3BtYjlBVERFY0VQMmxwbWZYVVYwaHUrcW5DWkJrRUZWbE5GRllB?=
 =?utf-8?B?WlNRUlBGakNtQi90OHBTUGVsZEE0a3hSa2FOeEZ3eHN2MlZDRzlYY2JBNVBE?=
 =?utf-8?B?UzY5aFcySGVSMU85cC83L1o5K2NqWGFKYWR1ckx1VnFBQ0FJVEcxSm1iYUdW?=
 =?utf-8?B?REFHdE14N2duWlZuZzI4WG96SGI0Tmx6djVZMkhiQXVuU3MrNEoycmRJQUxQ?=
 =?utf-8?B?ZTFxR2FZS2J6NnFwcGdCbkhJcVl6ZktRcWVjTnJOMFdFU0s4Q3dleE9Ya0xK?=
 =?utf-8?B?WUR3a2VNQ3FIWllLRGVvNDVQMkxTQXBUeW5xN2FFek5VQlRsemdocStGQnB6?=
 =?utf-8?B?ajlZZVhSQmdQMkJlRWhuYUx1OW9ZcmdwMnV6Z2pPTjNPVEhwbUVzejBaSEVX?=
 =?utf-8?B?TEE3QnFRek9HR3d0Q3M0VC84VjlLaEtMa2dMMHJ4TjgyQzJGSHZwem9hLzVz?=
 =?utf-8?B?MkJiWVZzN3Jwakl1VnA1V01YY3JHMGd1dkpjSjhHSms1YVMwSVRCQWs1Nnc2?=
 =?utf-8?B?UG9jTUZvN0dmU2VTQm5ISlJkQkFPNkMzeTd6N0FEZW1xSi8rQXJIOER6Y0Rq?=
 =?utf-8?B?T0l5T0pvMU94ODE1VFNWMll0bGx6bDkxbnIzR1ZxaWtFT2xWbGhDajJ5WVZJ?=
 =?utf-8?B?L29XOXg0NnEwQnk4Q2pPNldlcWE1Y1BGOTlXZ0xWR1hoekRFTzFjT2ZCTnkr?=
 =?utf-8?B?SHM3RU4yTnZaSzZuemsyZ1N3SW11YW9aL3dlcGZTNzRBTDR1cnpURTlPNVBI?=
 =?utf-8?B?QXdVSURkL2toZ3QwOXJXclNBNHlLZlN5ZVFTMTNPOFRpMGhQUGllNmF4Q2Np?=
 =?utf-8?B?TmN6ZzVQWFh3NFh1bUwxQjRZNndyMFhya1pyOHJscE95QXhRRmpWWlhvV1Mx?=
 =?utf-8?B?K3JrZW9ERUE1QWtVdUl3Rno0bFdWUkFYdElJbHl4OXNBL3FJazJJOElrYnQ3?=
 =?utf-8?B?SUdKRkRDaTdybTlmQ1FWSEVIODdxZk9rcjV2RjVaVlhNcEtFNlQ2UUNCVGth?=
 =?utf-8?B?Vzd4djZrTVNYNm1wVk9sNlhOOGhLcFZ0Y0dvSk9yMyswNi9TbHIvSVZSTnZY?=
 =?utf-8?B?MjVEdDBSandKWG81RnNiUWE5andYeVFEcDRYeU8zdzJNdExjMHRsMG44V0dE?=
 =?utf-8?B?anpJbFZscUdzbDZscWI1RXBiR2ZZQXIwZ1orNU42MGI5VDVzdEl6d0hVMXJK?=
 =?utf-8?B?YVFLZWwwYWNIMGVHOE9iWjlJSHd5ZVhiejlhTDk3SnUzWnBIS0lRaENwejN0?=
 =?utf-8?B?dzhFbUNrakJacjdJR0VHQXhudXd2M1dqYkFKRllmR0xuY3crZ0FJVmJJaWdN?=
 =?utf-8?B?MFdmUUtaY1RvajVXZ1lHQjVWOU1yeUZoNmlUSG1zUmgzaEVUMU15QkgrY2V2?=
 =?utf-8?B?Mm94UUFScnAvc1ovMUYxekgxZ1VCdXY3ell0eVp3ZCthMStIVnR5SXhFYWNj?=
 =?utf-8?B?U3VXN0lpSDJjbjNra3dwR2tUanVxc3lOSGl1dEx4Z1FJTFl4NVdJTVdveHlh?=
 =?utf-8?B?eDVHc0R1b1BUOVpvcEwzMWsvZG1IK0w2L3A4SWh5Tm9nWkp6NU80YitudzhL?=
 =?utf-8?B?SDE0MG5FMUQ3Z3dFcjN4VU9RTmhCa1FuclRieUdqRVdUNVZMSUFpdnZoVUZx?=
 =?utf-8?B?TVJSZDNudEhmUWkyenptWXBrd1dBaEwvVktoMzJyRUw0VTM3NlNQd21RT3ox?=
 =?utf-8?B?L3JnVDFkVENjMU9QcE5MZzJ3UlJGNDNuTXdncnZUNG80eFRUVzFQSUhKay9M?=
 =?utf-8?B?T1BMQ3VEbjh4Mi9PNEhkY29KcEVuZDBuVzA3SlJmNHFuSFMxTXhPU0FxNlBV?=
 =?utf-8?B?WExBTStyR2hON2Z2RnZvYlFTRnVPbUxaaU13Ymt4aDBYcXBMNmZiaWZqRVpX?=
 =?utf-8?B?aXdQMUlUdU1majYrLzk3QUhWZVZDS3Zzd0xYMk44Y1hIOTJ6NVJRVTlDcGFu?=
 =?utf-8?Q?Dx4t1vrY8Ep++kP491va+I8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDE4613E200A5149A0611323DCA14151@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 903dfcc0-50e9-4d36-dd9f-08dce778e7db
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 09:09:25.1232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xOJaW5Gsis8DCsJnTUnis0CMOmjJTKdWI4zGOKq3lSFGRdTRxjYpA3jEOOu55kUhTe41yGBwslLSiyJ1zolf+LPXWS/MiAW3JW3MQAOBi1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5991
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

T24gVHVlLCAyMDI0LTEwLTA4IGF0IDExOjA3ICswMjAwLCBEb21pbmlrIEthcm9sIFBpxIV0a293
c2tpIHdyb3RlOg0KPiBSZW1vdmUgcmVkdW5kYW50IHNwYWNlIHByZWNlZGluZyBjcmVhdGUudm1f
aWQgaW4NCj4geGVfZXVkZWJ1Z19jbGllbnRfdm1fZGVzdHJveSBmdW5jdGlvbiBjYWxsLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogRG9taW5payBLYXJvbCBQacSFdGtvd3NraSA8ZG9taW5pay5rYXJv
bC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9ldWRlYnVn
X29ubGluZS5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxp
bmUuYyBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMNCj4gaW5kZXggZTVhYWFlYTIy
Li4wMWNjZjQ1ZWIgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5l
LmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYw0KPiBAQCAtMTA5MSw3
ICsxMDkxLDcgQEAgc3RhdGljIHZvaWQgcnVuX29ubGluZV9jbGllbnQoc3RydWN0IHhlX2V1ZGVi
dWdfY2xpZW50ICpjKQ0KPiAgCWludGVsX2JiX2Rlc3Ryb3koaWJiKTsNCj4gIA0KPiAgCXhlX2V1
ZGVidWdfY2xpZW50X2V4ZWNfcXVldWVfZGVzdHJveShjLCBmZCwgJmNyZWF0ZSk7DQo+IC0JeGVf
ZXVkZWJ1Z19jbGllbnRfdm1fZGVzdHJveShjLCBmZCwgIGNyZWF0ZS52bV9pZCk7DQo+ICsJeGVf
ZXVkZWJ1Z19jbGllbnRfdm1fZGVzdHJveShjLCBmZCwgY3JlYXRlLnZtX2lkKTsNCj4gIA0KPiAg
CXhlX2V1ZGVidWdfY2xpZW50X21ldGFkYXRhX2Rlc3Ryb3koYywgZmQsIG1ldGFkYXRhX2lkWzBd
LCBEUk1fWEVfREVCVUdfTUVUQURBVEFfRUxGX0JJTkFSWSwNCj4gIAkJCQkJICAgMiAqIHNpemVv
ZigqbWV0YWRhdGEpKTsNCkFja2VkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6
ZWdvcnpla0BpbnRlbC5jb20+DQo=
