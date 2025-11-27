Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACBBD11183
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 08:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4562310E780;
	Thu, 27 Nov 2025 08:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McpMyU6k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D75B10E780
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 08:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764233468; x=1795769468;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QjIAmkmkGeWLOdh8lzMxAz3ZNIskKR/lmTX/DtMf4kw=;
 b=McpMyU6kCcOtn2ZAJfdqiKuKa4uOHqU5Z7JnQq+gSJvXM4HEFbS142Px
 JS5D8faMSwjroyjfBOqVLE+lB6HTgljQoxz2ZGKed9+sU2BzW5Y4AB+ot
 +TBAM1IktuoD9rQOnEC5DTgI93EdIqXdRSDcqf9CfUdg1C6FiuODoFH15
 OZ8Sqs7a5enOjNcn8loTZeRNmchkD3xK7p8M1bon5zV53si2bYUWN/LG4
 7Hp/dWiNU3foP/TuWOQRrLtSDhtJztaovSxa/V/sYFrVAMiU9WM+o37or
 Y1n97KpRn3jVj/f9qXk5qC5jBcTsebnn/fr3NHMXbmZsuRLX99fOyS1XP g==;
X-CSE-ConnectionGUID: I11qXuanSxK2ju5MpIXqpw==
X-CSE-MsgGUID: erSeKWD3TMOpNgn1cPf9Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65284297"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="65284297"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 00:51:05 -0800
X-CSE-ConnectionGUID: DBcFuworSyyZ4AnqS20yoQ==
X-CSE-MsgGUID: 28IKXGVzT0WDm6z1Byx4uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="193990330"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 00:51:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 00:51:04 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 00:51:04 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 00:51:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzxoaAsDX3kezvkAw0wh23WCT+I4Lw3v7A1HlRw6vfq3NqFzqWjmxLfE+ghv0nmNrJkHNKR3QeRAxeaRUezv/NQjsbjjGCF2DH4z67HBC6fsgNoolUVwQ3wKxSAfQ8R3Ul9dxlXOoVXo32SDAy3nDOu2PlfU880IkNuFyJkdoYdCSI7VdZkUYuZ8OOX3zuCpePT2yqhvtUEoSBnCQo3DjYCVHuBGcippjnKqtRtFmv8d2/JVZekipVgE9zLaNvcKyK37go/hniJNkEIih+cleX1QnfCVJFM319PB/G1sxfsVOQnWOjfwKIoz+IOL+cjMeFpFR0H4JkFgFzL9NW5eCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhWnC8eRhqKTmdWaNS0hCarJTcAyRi53ip5zUzqpXb8=;
 b=gs8U/kwJDvYamfHO7s7+Vedcc6LO/zXV8J1LMKhLexVr8WeWBzakombtTpVZQj0VmsiCXdrvdXKAgrgH9Y8gSSI4rmgb2cSOhGeoNsBy/36BV/iAGdKsWrqXGoGBxyql9qIfkfCQcHRPjCCld5YFL+0YXNolr4g9aLrbPX2P3cXvYdGS86g4icnmpKWWIlSVS2aqyh4u77mLX1oZiKdQgYXgfsWft95eK/On0LFWrlyiMfhfQmTCnRW0vtnh9mEKzvEV2UYkd8sdRDBQnkCL1tK3B+4sqQg+N6h1sP1XVOtUH0WchcYL+1rYMHnMQTFYIYU1UhtNofRlavMWgp7qlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH7PR11MB7516.namprd11.prod.outlook.com (2603:10b6:510:275::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.11; Thu, 27 Nov 2025 08:51:02 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 08:51:02 +0000
Message-ID: <08a2d86f-f9d8-49cd-aad4-68d7256a9a6a@intel.com>
Date: Thu, 27 Nov 2025 14:20:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_joiner: Add function for pretest
 checks
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>
References: <20251127051626.2645054-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20251127051626.2645054-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0090.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::14) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH7PR11MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a7c6c8-e820-4099-d728-08de2d921817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGRMT3N3TURZWlV4bDAvU3krdE1Ibk5sRm1GaWtNSzJNcXU1VWgxVXoyNEgr?=
 =?utf-8?B?dEhPUk5Zd3UreGhrSjlYQ2pyQnVUSjNCaFIzc2ozUjRMemdsUGxZMkdGMkVq?=
 =?utf-8?B?eExkMTJ5dEpGMGIvMSs1LzAyd0w0M2k3SDN5K0MxMm5NajNQaksrbTRnQURD?=
 =?utf-8?B?eS9QdW8yNkwxUUg2ZTRaQXE2Uk9GdXE2S0tDYmxmYzdTcjdmcUVUQm51MEk2?=
 =?utf-8?B?cFBKRlVxaUt3UlRCY1hJZ1d5UGd0b1NsbDljb0RleWlXYUFEM1F1clpiblc5?=
 =?utf-8?B?K2VLRU54cnJtbWVrQ3hLbVJVaktaUnozbEY2M0Jtd3VVcXlOMjA1YnVsZ0hS?=
 =?utf-8?B?U05sQ3lBeWhVRDc2cGxyaWVITlFEcXVHYzA5NmxaQ0tQWmNhQVE2NklDZ3Bz?=
 =?utf-8?B?M0dKY21MQ1VjcC82RjZ1cStmNVhkbnB3TE1MRCsydmdEM3lpVFo1eWhlcWlL?=
 =?utf-8?B?QWZGZTFUNnZTN1hWZkdSQ3FhYXdJNEQ2M2crWFhmWXZoelZqUFVlQnN1a3Js?=
 =?utf-8?B?eDdTZlN2MEhXYVJLeWhXaXNMKzZvV3kwNFJLQzJjZWtrZnlMU2Ywb3RUL1Rq?=
 =?utf-8?B?RWQ0TGFaNEd5TVRlaWsxNVpZakhiTHY2UGJKcHM1OXRDeUt0N0UwMGhkTEtN?=
 =?utf-8?B?MXpPZ3dibXoxdDRlb25KU05KNXc3SjZ0VzFqTmVwNkZsSlBqUC82bXl5YWZ5?=
 =?utf-8?B?OHFKL3dIUUV5em9xMStHZUE3ZFhtbnBZQjBWcno3UTZlTDUyeVQzOWNzNlJw?=
 =?utf-8?B?d3Jsd2M5MkNmN1JaOThtakMzTmhsWk5xbzN3bkhxTEplOVhQR3U1MHU5bG5i?=
 =?utf-8?B?WmMwTURlVWRIMkhnN21WSUtqcHZhdktCMzlncEY5bFl6clpsV0FZYTBBNEMx?=
 =?utf-8?B?ZHM2RHFKQlBSWU51VjN6VE5YUHhwV3IwSjF3MkRrL1hUMlIrczdaZHFLWitU?=
 =?utf-8?B?dFByR3pURkZKQlNJU0FxUGxYYjFmeU1RZXdtSFYwVll4TUR0Nk1CVHprWCsw?=
 =?utf-8?B?ZGM5L1U1ZkJpdklKQXdZSXdqNklxOXBrK1hWcWtlOWJtN1JsckNrcG5oblNB?=
 =?utf-8?B?azBCRy9OQTREbVA4TjdJZ01JT2pBZ0JONm5SR1B0QmNpeUcwTldhQmJNNzRY?=
 =?utf-8?B?QktYRjZRek14eGtydXZkcWJWVm5GeHJieVovbzlYT0FKdGQwNzNkUnpSMVhO?=
 =?utf-8?B?U2tPcThnK3QyTUQzbEgxS2xpQ1pja0h1S1VmNU9ldThtSWlmUWV6eWVsRDV2?=
 =?utf-8?B?Qk1NQ1FTLzkwdUJyRENLV3hLdVpqdUVudHV2OVVvUjFZOXBSQkhSOHR5ME1s?=
 =?utf-8?B?TFloc3VGNkN0dGp2L24wQS9yalpRS2ROTFgyQ2ZML1dYUXpwcXd2Ukk3c2hG?=
 =?utf-8?B?R29Qck5aMHdDcmsvR0EwU1hja3VSVW9MRnRaZ0JtTFdpVzVKMnVDRUdLQWlq?=
 =?utf-8?B?eTBKS216dCtVVVljNVNlMkRYbjdKdU1sSC83M2ZqYytyek1UUmVwSStIZEhk?=
 =?utf-8?B?SjgxYmVGZ3pPWUp2MjljMGZWRkx1RUtHN0QxUTRiZi9jQi9xNDQ1dzZFeDVk?=
 =?utf-8?B?YUpLaUpmZlF6UEwrUmdzRS83R1A4N09raWhjR3NLUGN2QkEyaWJ3RUNYd3Zh?=
 =?utf-8?B?ajN3cnJnaHFvWVYrdGF0TTUxa2N1ZTRIbzhBQklONkRjYUNBZnQvWnNiZVlC?=
 =?utf-8?B?Q2FxMWxPYmlrcEtYOU9KTnVZRlA3MWorYW0wQ2VTOE5qcFF1TnhXSFBZQ2Zu?=
 =?utf-8?B?QzhjRytSSzRCdzYzTURVSlAvNlg1a0ZYL21xc2QyT0VUVWdQL2JYR2lBN0hC?=
 =?utf-8?B?azhBWE85RkxUY2VlRDRoaWxKdWY2Z2U4MkV5Z0hUbTVaMWh2dE1ZU29MQ0VF?=
 =?utf-8?B?aXpHWElkVElCRFpyU25odDF1SjlieXZCYTBka3hmaGlucjJmb2pyNTF4QU9s?=
 =?utf-8?Q?UymVfDZid3zY6jRylyZVGpyrTvRmK5sH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnZpVHNxc2E0TE11azdKQ2JlUHI1S1ZPWFc1UFBYUlJxM1ZoZjdWN0lPSWtI?=
 =?utf-8?B?M01KdFZxandUaFlsTjdUTm9EWUdOUEJibTltemNLWmVtYWdFek5icWJZbVla?=
 =?utf-8?B?dklrYitoTzNqTEZHUWRsZUZHSGpqakZLVFBKY2JyOEFjVFNGUTNFOWxzRHpz?=
 =?utf-8?B?UzdTdkYwMjh4R3F1aFhSb056SWtxWTN0SjIrQXMvb0lIZHYwQXFBd2hzR2g3?=
 =?utf-8?B?WGltR01pTlpnUzIxeWhwb2FReVVqdXRoRlhMYVBIY1J0ZGprUWUvbHJRNXRw?=
 =?utf-8?B?bTA5ZlYyVmVnVmhTaHZ0YmhkdWxuRUl5cjJrcTNWNFM0WnJ3ZExqdlFTY3Zw?=
 =?utf-8?B?bCswRUVBRGdaVGJaVk03bjBGMUZuQVpueU45MFRLRzE1RlN6STRzZktRc3Qz?=
 =?utf-8?B?RkhzN0VxdStDSTk3eW1CaTFrMUxXSUVlT0VncEVkQ1VxWVo5ZU5VUnpFR1BT?=
 =?utf-8?B?eUF0bjVhaXAvRGx0TEF4SmpvRS9DV2E1UkxnRHBWQUVXUHEyVWVaVWdObEZE?=
 =?utf-8?B?aEVabzlETjBGU2NwcllYVHdRcVRTamt3QWZveDF3QWNOcms0SjZyekJRNXJW?=
 =?utf-8?B?UVJ3UWZEQ2FhU01oNGp0QTB2OElMOGY1NmdkWllaOXRIMTNjbGFRNHBIVXB6?=
 =?utf-8?B?SnZXOEVlN2hyS1V1M0dqeXlIMFhkNnk5TTVzUjBmeDczTFlNcjY0K0YwZTlI?=
 =?utf-8?B?UzVwTUY3MzVUYWx5M1RXQitCN0ZVRVBYeFl5dmZzK2FFeUlTUHcwcEQzVG9E?=
 =?utf-8?B?akRjc2JTdEFDLzg1WVZFWHhJcjlEWU1SVWNmR1RCS2VoRHlnRXhLcnhLRWdq?=
 =?utf-8?B?M2EvNWc2SlI5U0tPRVVEalowVGlZYWs2MXFaeSszSDJvSmtONnJJUFQweGtH?=
 =?utf-8?B?VytZYVlKUTNpMEdBZ091WXcrL3B2YXNaMFBMeDloSjZONVpVWkwyRDZpTTRt?=
 =?utf-8?B?alJ4SWJJbWFHeDNtV055L0pGcHFFUCtvSzhKUnV3cFJhRE9lQWtyT1IrWmc2?=
 =?utf-8?B?N0MvWFk5SXRHbHMyamZVb1R5dHN3akY2R1c1NFQwVlg4aWcwaTd2ZWEzZTlF?=
 =?utf-8?B?TkwveEtlM2RXSWNvMGN1dldZaXk4RnNyaEt3VHYwNVRqOTlOdHErOGIrQ2No?=
 =?utf-8?B?ODhjSDJJWFF0R3VoMDI2dEV5NmowdE9RVldqUTBXZTBCQlRYa1MycVYzUm4r?=
 =?utf-8?B?SG01V3VHMURrOXE0WE9ucWExSlNaRVREYlBpLzhOUVpaajBBWDFSdUhoQTdG?=
 =?utf-8?B?YStpb2xEUTJxakxTdEl3UUZhK2pjWjZvYnY5Rlh3cjR3cWJTS3FTbWg4YXl3?=
 =?utf-8?B?V2M2bTFRWHlNc3VLZ3FWOE1iOUFLbkZWY0NUbWxSOHJ6OUNFK2hCQWlVaGRC?=
 =?utf-8?B?T0pibkZHODJSRmRKMkVzUXo3eGZFbGVOaUovaTY4dWZsYUNoTWlBamI1ZjVi?=
 =?utf-8?B?WVBodTN2cG44OGRtRisrZzZ3akJid2xVbE1raVgyaHBVT2l4bCt4QUtLL0k2?=
 =?utf-8?B?SnhaNjNqUU5ud2x0MVo0V21WTGFGYWxPbURvY0JLNHNGUTdySzlJaGhlSC9Z?=
 =?utf-8?B?eTJCaWxJcUQ3blFFcE1IUHlick1lci9HNGhhczh3UysrNy9mYm5jSVI4V0VO?=
 =?utf-8?B?QkdrVEV0SnFKT243MmIrU0FCREIwWGlDdXhlbWlpc2NUeWNoSTh0bUpSVE1B?=
 =?utf-8?B?NmRSZ3IwcmFOamJia0FBV2tFMS84QjNFajdlWnovb3hMTVhTV3Jqa2pMUE1s?=
 =?utf-8?B?cndQanV6OW4yZmhwZUJXODZFWXFoMW1WR3J6eTkvajJKZzh4cVh0a3owUy9h?=
 =?utf-8?B?Vm5ZaGhoM3BIbEY1NTdmQy9WU041MU54ZGxmWDU0eSt3WEthY1lXZHd5VXpm?=
 =?utf-8?B?eTBWUE5sM1A2ZURRS3JxTytmanFWMnZCMDkyY2svcjRPYzl0cWl2ZFRneUlI?=
 =?utf-8?B?MDQzR3JEME9Id0xtZzdxNGtKTzZ6WFNPT24zR0dPYVFmNHlZWERVOTNhOWk5?=
 =?utf-8?B?Q1dLNWxIdjI2SXJBaVkvRW5yLzI0NWNKMUk3NGhtaDhQbERES2I5MHBsd1JI?=
 =?utf-8?B?bkljWnNsUG1xTC8rYWxyMDEyQVBPaExpKzJ2MDVKSmJTYnhNZ3hwdWJURXZP?=
 =?utf-8?B?cHJBSEJYcUw2cWNyMFhQVzhhanVzUU5PdCtLVmNMU1VsMTJidVN3RmFjWkRM?=
 =?utf-8?Q?173I8Dd1o7bmI5wHKP0m/KU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a7c6c8-e820-4099-d728-08de2d921817
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 08:51:02.7945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4khTpbKlIjobR40DC4vPDXlquwUFXN/O72AQHm+qOHeVHt7UoAPf/rHMLr/JikrnutB4+VNevM0TMHpaj0p295/uEwgTdKEI3Wm0OIBK0rdvXhUgr6cmYDA0KyB/ec6i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7516
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

Hi Karthik,

On 27-11-2025 10:46, Karthik B S wrote:
> Remove igt_require checks in subtest groups and all these checks to a
> function which can be called from all subtests.
> 
> This is done to avoid spurious skips and corresponding noise in logs.
> 
> Fixes: 3f90f16d1233 ("tests/intel/kms_joiner: Cleanup igt_require checks")
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_joiner.c | 202 +++++++++++++++++++--------------------
>   1 file changed, 101 insertions(+), 101 deletions(-)
> 
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 276170229..32de3af92 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -101,6 +101,7 @@ typedef struct {
>   	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
>   	enum pipe pipe_seq[IGT_MAX_PIPES];
>   	igt_display_t display;
> +	bool ultra_joiner_supported;
>   } data_t;
>   
>   static int max_dotclock;
> @@ -179,6 +180,26 @@ static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo
>   	igt_remove_fb(data->drm_fd, &fb);
>   }
>   
> +static void require_joiners(data_t *data, bool big_joiner, bool ultra_joiner, bool force_joiner)

Please avoid using multiple boolean parameters, instead consider passing 
a single enum to represent joiner type.

Thanks,
Santhosh

> +{
> +	if (big_joiner) {
> +		igt_require(data->n_pipes > 1);
> +
> +		if (force_joiner)
> +			igt_require(data->non_big_joiner_output_count > 0);
> +		else
> +			igt_require(data->big_joiner_output_count > 0);
> +	} else if (ultra_joiner) {
> +		igt_require(data->ultra_joiner_supported);
> +		igt_require(data->n_pipes > 3);
> +
> +		if (force_joiner)
> +			igt_require(data->non_ultra_joiner_output_count > 0);
> +		else
> +			igt_require(data->ultra_joiner_output_count > 0);
> +	}
> +}
> +
>   static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *output)
>   {
>   	drmModeModeInfo bj_mode;
> @@ -554,7 +575,7 @@ igt_main
>   	data_t data;
>   
>   	igt_fixture {
> -		ultra_joiner_supported = false;
> +		data.ultra_joiner_supported = false;
>   		data.big_joiner_output_count = 0;
>   		data.ultra_joiner_output_count = 0;
>   		data.non_big_joiner_output_count = 0;
> @@ -574,7 +595,7 @@ igt_main
>   		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
>   		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
>   		if (is_dgfx && display_ver == 14)
> -			ultra_joiner_supported = true;
> +			data.ultra_joiner_supported = true;
>   
>   		for_each_connected_output(&data.display, output) {
>   			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
> @@ -627,132 +648,111 @@ igt_main
>   		}
>   	}
>   
> -	igt_subtest_group {
> -		igt_fixture {
> -			igt_require(data.big_joiner_output_count > 0);
> -			igt_require(data.n_pipes > 1);
> -		}
> -
> -		igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> -		igt_subtest_with_dynamic("basic-big-joiner") {
> -			igt_dynamic_f("single-joiner")
> -				test_single_joiner(&data, data.big_joiner_output_count, false);
> -			if (data.big_joiner_output_count > 1)
> -				igt_dynamic_f("multi-joiner")
> -					test_multi_joiner(&data, data.big_joiner_output_count, false);
> -		}
> +	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-big-joiner") {
> +		require_joiners(&data, true, false, false);
> +		igt_dynamic_f("single-joiner")
> +			test_single_joiner(&data, data.big_joiner_output_count, false);
> +		if (data.big_joiner_output_count > 1)
> +			igt_dynamic_f("multi-joiner")
> +				test_multi_joiner(&data, data.big_joiner_output_count, false);
> +	}
>   
> -		igt_describe("Verify if the modeset on the adjoining pipe is rejected "
> -			     "when the pipe is active with a big joiner modeset");
> -		igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
> -			if (data.big_joiner_output_count >= 1)
> -				igt_dynamic_f("big_joiner_on_last_pipe")
> -					test_joiner_on_last_pipe(&data, false);
> -			if (data.big_joiner_output_count > 1)
> -				igt_dynamic_f("invalid_combinations")
> -					test_invalid_modeset_two_joiner(&data, false, false);
> -			if (data.mixed_output_count)
> -				igt_dynamic_f("mixed_output")
> -					test_invalid_modeset_two_joiner(&data, true, false);
> -		}
> +	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
> +		     "when the pipe is active with a big joiner modeset");
> +	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
> +		require_joiners(&data, true, false, false);
> +		if (data.big_joiner_output_count >= 1)
> +			igt_dynamic_f("big_joiner_on_last_pipe")
> +				test_joiner_on_last_pipe(&data, false);
> +		if (data.big_joiner_output_count > 1)
> +			igt_dynamic_f("invalid_combinations")
> +				test_invalid_modeset_two_joiner(&data, false, false);
> +		if (data.mixed_output_count)
> +			igt_dynamic_f("mixed_output")
> +				test_invalid_modeset_two_joiner(&data, true, false);
>   	}
>   
> -	igt_subtest_group {
> -		igt_fixture {
> -			igt_require(data.non_big_joiner_output_count > 0);
> -			igt_require(data.n_pipes > 1);
> +	igt_describe("Verify the basic modeset on force big joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-force-big-joiner") {
> +		require_joiners(&data, true, false, true);
> +		igt_dynamic_f("single") {
> +			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> +			test_single_joiner(&data, data.non_big_joiner_output_count, true);
> +			igt_reset_connectors();
>   		}
>   
> -		igt_describe("Verify the basic modeset on force big joiner mode on all pipes");
> -		igt_subtest_with_dynamic("basic-force-big-joiner") {
> -			igt_dynamic_f("single") {
> +		if (data.non_big_joiner_output_count > 1) {
> +			igt_dynamic_f("multi") {
>   				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> -				test_single_joiner(&data, data.non_big_joiner_output_count, true);
> +				test_multi_joiner(&data, data.non_big_joiner_output_count, true);
>   				igt_reset_connectors();
>   			}
> -
> -			if (data.non_big_joiner_output_count > 1) {
> -				igt_dynamic_f("multi") {
> -					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> -					test_multi_joiner(&data, data.non_big_joiner_output_count, true);
> -					igt_reset_connectors();
> -				}
> -			}
>   		}
> +	}
>   
> -		igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
> -			if (data.non_big_joiner_output_count >= 1) {
> -				igt_dynamic_f("big_joiner_on_last_pipe") {
> -					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> -					test_joiner_on_last_pipe(&data, true);
> -					igt_reset_connectors();
> -				}
> +	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
> +		require_joiners(&data, true, false, true);
> +		if (data.non_big_joiner_output_count >= 1) {
> +			igt_dynamic_f("big_joiner_on_last_pipe") {
> +				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> +				test_joiner_on_last_pipe(&data, true);
> +				igt_reset_connectors();
>   			}
> +		}
>   
> -			if (data.non_big_joiner_output_count > 1) {
> -				igt_dynamic_f("invalid_combinations") {
> -					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> -					test_invalid_modeset_two_joiner(&data, false, true);
> -					igt_reset_connectors();
> -				}
> +		if (data.non_big_joiner_output_count > 1) {
> +			igt_dynamic_f("invalid_combinations") {
> +				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> +				test_invalid_modeset_two_joiner(&data, false, true);
> +				igt_reset_connectors();
>   			}
>   		}
>   	}
>   
> -	igt_subtest_group {
> -		igt_fixture {
> -			igt_require(data.ultra_joiner_output_count > 0);
> -			igt_require(data.n_pipes > 3);
> -		}
> -
> -		igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
> -		igt_subtest_with_dynamic("basic-ultra-joiner") {
> -			igt_dynamic_f("single-joiner")
> -				test_ultra_joiner(&data, false, false, false);
> -		}
> +	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-ultra-joiner") {
> +		require_joiners(&data, false, true, false);
> +		igt_dynamic_f("single-joiner")
> +			test_ultra_joiner(&data, false, false, false);
> +	}
>   
> -		igt_describe("Verify if the modeset on the other pipes are rejected "
> -			     "when the pipe A is active with a ultra joiner modeset");
> -		igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
> -			igt_dynamic_f("ultra_joiner_on_invalid_pipe")
> -				test_ultra_joiner(&data, true, false, false);
> -			if (data.non_ultra_joiner_output_count > 0) {
> -				igt_dynamic_f("2x")
> -					test_ultra_joiner(&data, false, true, false);
> -			}
> +	igt_describe("Verify if the modeset on the other pipes are rejected "
> +		     "when the pipe A is active with a ultra joiner modeset");
> +	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
> +		require_joiners(&data, false, true, false);
> +		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
> +			test_ultra_joiner(&data, true, false, false);
> +		if (data.non_ultra_joiner_output_count > 0) {
> +			igt_dynamic_f("2x")
> +				test_ultra_joiner(&data, false, true, false);
>   		}
>   	}
>   
> -	igt_subtest_group {
> -		igt_fixture {
> -			igt_require(ultra_joiner_supported);
> -			igt_require(data.non_ultra_joiner_output_count > 0);
> -			igt_require(data.n_pipes > 3);
> +	igt_describe("Verify the basic modeset on force ultra joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
> +		require_joiners(&data, false, true, true);
> +		igt_dynamic_f("single") {
> +			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> +			test_ultra_joiner(&data, false, false, true);
> +			igt_reset_connectors();
>   		}
> +	}
>   
> -		igt_describe("Verify the basic modeset on force ultra joiner mode on all pipes");
> -		igt_subtest_with_dynamic("basic-force-ultra-joiner") {
> -			igt_dynamic_f("single") {
> -				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> -				test_ultra_joiner(&data, false, false, true);
> -				igt_reset_connectors();
> -			}
> +	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
> +		require_joiners(&data, false, true, true);
> +		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
> +			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> +			test_ultra_joiner(&data, true, false, true);
> +			igt_reset_connectors();
>   		}
>   
> -		igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
> -			igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
> +		if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
> +			igt_dynamic_f("2x") {
>   				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> -				test_ultra_joiner(&data, true, false, true);
> +				test_ultra_joiner(&data, false, true, true);
>   				igt_reset_connectors();
>   			}
> -
> -			if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
> -				igt_dynamic_f("2x") {
> -					enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> -					test_ultra_joiner(&data, false, true, true);
> -					igt_reset_connectors();
> -				}
> -			}
>   		}
>   	}
>   

