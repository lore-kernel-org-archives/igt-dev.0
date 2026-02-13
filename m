Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641F1EDF148
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 10:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B23F10E7FE;
	Fri, 13 Feb 2026 10:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGItSlYJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C613810E7FE
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 10:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770978704; x=1802514704;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=71JeUGdfB4oJR+s5VjBjj/ihum5SSmrm5ZUkDj32TU4=;
 b=KGItSlYJJ2PC2zC45CQe8x4q0Ljk0ZzNKklyzQW27z/bBxo5CbkDZZZM
 Bu1U5xj34J2IXVjMboCOitlA33MAIk7OP291n8Tw8Du8cuj9XiuiVJtJZ
 ZGrRueCFHPTELmIaMQCUAq1qeIfjFO6LfQH/0QtlCHSnCXXPAbKFQesPg
 nrnUTaet/+4mdNZVYKShnTYLBXm/RcBwfk3MJEFnJws1tFDCc86Wh+OLG
 U7lb4yXvOWICPFlontapuRZezKhqSMxQNVH7xmJFR5PgF1+4G8J6q9K9v
 Js9FjF647KLRv8iwsjDUPINRmw/L4VOsI0gheYuA7qI0hTuPgatAkQS2x Q==;
X-CSE-ConnectionGUID: hlbz2em6Q6uT3GJwTxDyCw==
X-CSE-MsgGUID: MFhrdw+hRdGt9IYxzMweDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89574353"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="89574353"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:31:44 -0800
X-CSE-ConnectionGUID: V8cVxYGvTbCm9MhLq+uxdw==
X-CSE-MsgGUID: yXLsTVCPQJ2tehWqXvOVfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="242318862"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:31:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 02:31:43 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 02:31:43 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 02:31:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3ZI885PUwrWoQqiaHBY3+/TrblRsmaxWR6bmrAEP/HSzlLxSDkpUhWdJBi733Z/Tfe//bjL3xnZP8DPFTxmZfEggl70CrzbZnJSVEVZQ9/KvlQSDE2t7fXyb8+F+7J5Te/AmJzsf67oiwJNNaFtPihSUS9egPORZ+/khW/jOMnnh0xwposalkn9ogm63ASi8azs0WUzfdtuIZSWsdzFLEe2k3tiHrYN4DZFTdKjYPmVnu2XkbNv0Ks5oSTjlKrPSHLUSPFFceS7DEcLo/0E0pfDBfb4CAnxUP1RY3jpvOru2SuPGL3u6b+3gJOdm+rbi5ykIXhveX/IstOjkNqqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkQTXOhqpxHlImy1ayWiet7LApX0kvMiVOum4NUIc38=;
 b=WZOB68rEzrbpWbUZ3qPJGlYkcUwd8PUYOFc2twLQYbG0J5ao+HG00+mbvxGI8sNg1AtCu4Ts0ne2+FCDYjihrmcBKIpXWH8qHQTnfHAuQ5AsLLGU2EYfwu6uqIG+lqHxjAL85bBsJsifnxETvrPy+aFvUP7Fllsc8ySIt4ReFtzbw8OZXUWcQ9VHKhO6RtHtAiXC7LYAX+F/rXG3d/Jcc8F07WX4gNJtNeTC3hK8ld8Ei4Ms7viS9QTX0Z1tMnBlZH/w2u+VuzNTNiDw+TXakBwRZ3h4HDePbqspCMOUvCx66Ed0kVqWCBYvkYl+2hvinm4kcE4YDKB1lnlYHW24lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by DS7PR11MB7908.namprd11.prod.outlook.com
 (2603:10b6:8:ea::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Fri, 13 Feb
 2026 10:31:39 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::2abe:2c7e:e5f0:6f07]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::2abe:2c7e:e5f0:6f07%4]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 10:31:39 +0000
Message-ID: <be287ec5-10ac-4922-b520-94d5c3d58dae@intel.com>
Date: Fri, 13 Feb 2026 11:31:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] lib/gpgpu_shader: set r1.4 to dim.x
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260210102416.2796291-1-jan.maslak@intel.com>
 <20260210102416.2796291-2-jan.maslak@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260210102416.2796291-2-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0017.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::9) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|DS7PR11MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7064d6-2b9a-48b4-2a94-08de6aeb125b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wm45czNKbUZabFlZNWhiRHA4UEZvVjIvRE1tamNrTWxYYlAxcTE2dEJadEdh?=
 =?utf-8?B?d292Y3ZwazdLVjNNWUhmcVhST2lGWDZqLyswUXVPWjFxREJrSWhWeWw2OVRh?=
 =?utf-8?B?MHdGd0ZnUFRYc1lnaWhoeTBPV2duUFhWbFEzd3p4b2d1TjdoVEMzaEhVVTNP?=
 =?utf-8?B?QVZnNWJWRmhOd2pkYUxqMEE3amgzaW00MFF4dzVmbTh6TlhSWVZHVVhkU0JJ?=
 =?utf-8?B?VXNpMUpxb0poVUl2OERaQWZOZEdyUE44SXMzWkl5cEE2N3lBb2pCdEhWZFR3?=
 =?utf-8?B?WjZiMVZJQm83U3RtOWVGQVVCdDYvOGRTakZ2eVlMd0g1NUkwRnZJV3BWNGZx?=
 =?utf-8?B?b1Y4SFZSZXA0UTJLQjNXZzRGZTRCTDNNMkFqYjJyVmxEaGY2QUcwWkxOeXdq?=
 =?utf-8?B?aGZkeUtua2VpZUV3ZnN4MGlmQ3FTOHh2WU1CU25rckF5dGZ4R3pPZVFQK0hk?=
 =?utf-8?B?ZzJGZlFFZWU3TE11Unk1ZUhsTm5vRlRSeEVDU1FnZjFnS0lvbE40eERHdm84?=
 =?utf-8?B?eURWQ296V0crRWxkWlpONXM2YTdCNHZWRGMvcXpLcFNKeFVPY2NkU2IySmZQ?=
 =?utf-8?B?M2M0UEdKS0VSTDd3dUphaHk5aHBkL0FrZ2FPdDNpS0tRSE9wMUc4ZDBiNWpw?=
 =?utf-8?B?QWlTV1UwRVpUSTVhVEc1KzVMem5pRHB4b1owRjJSaVE3eGkzYXNLQzd5NTAy?=
 =?utf-8?B?S3BsZFF6ZzNRSmxVSVg5UUJyWVM2V3FJTUk2Mjh6cVNRSEtuWHd3M3liWFB2?=
 =?utf-8?B?c21YVVdwREJjcEJwVUVxVEVkR0E3Y2NDVHdqZzNUaHhvTUV6OEZOMWdFcFlw?=
 =?utf-8?B?Rmx1VFkrby9QTUxQRWl1NWdRNzdaSHdSUFFia1RDU0NIT0hPS2hKQ1B6WGJV?=
 =?utf-8?B?c3RWZGhrWUEyUWVFaG56UlJpQ2JZUmpBSGtCNE5xUXBCdWNEMXh2THJTRS9t?=
 =?utf-8?B?SVBMTUtLTmc3eUNVaHQ2cWJqbFppQTZDcHpSTGZiM09nZUtScy9pb1BNck5t?=
 =?utf-8?B?Y0R0SytyT2Jvd1cvZHBxeU82aXZsQmJrdHR1WGxpZ0pBSnZ1ZmJzZi9Icldh?=
 =?utf-8?B?QVpITk9FZmlaWXV4cVNNOUxPQmhlM05ZcDB3WnYwaGxheUVxQ1pJTE5TU0lR?=
 =?utf-8?B?bXZTQW85SC95WjRjRUZFdzFBdGlZa3poN0ZHeEFVOGZ3VGpqRzlOMU9Yenlq?=
 =?utf-8?B?dTJsVVBrUmw1R0dwQ2ZERUIvUGRPN3BvR3BrVm4yeUVzelN5K3gvMDVQNENh?=
 =?utf-8?B?RUN4aXA1UTRLQkw5SHR2NS8rL09VeXNxaEhrcFdDTEFrRjRRRzgxLzFDLzhn?=
 =?utf-8?B?RnpUaW1JaDdaNWt0Qk5JMmxxOE5xQWJmWlNRZVJRUS9BUEtwYktLOUVnZVB1?=
 =?utf-8?B?ZnRZM3FWZ0hNaDJmVlR3eEMxWnVsUVpqVm5ZM1h1ODVwRGpHdDNmeHhtZkl0?=
 =?utf-8?B?cURNZFZHbkhtRXE1dXRWQk1mN0c1cC94TUs3eDFkaW5YSStxTU5QKzVIaURi?=
 =?utf-8?B?bndzZmpsZVlDNTlJQllySmZBbXNDdWk4aG12bzVValpIN3VMV283Y2daekJn?=
 =?utf-8?B?cnNxTStyTEMvbmtsbTJMdjRPak9yZTdmVVFPeG1aVEk5VXVyU1lqY00rT1Bn?=
 =?utf-8?B?UHFCMm1hUFhTY1AxSHNmYkxwQSsvMFlGZFo1bDdMNytCRnE3WlBBQ3F2RENZ?=
 =?utf-8?B?THRTTU5nQkRLMGd6Lys0RWZJUmZhVEM3Skh0aXN6RVZmUzdDTERjVDFucGJx?=
 =?utf-8?B?U0NHYUxXRk96WmJCSC9ueHVLR0I3MjNUTzQ4NnNHRDN2eTU4TzMvMjJkNXFS?=
 =?utf-8?B?Tjl6WnNsVDhQa2JsSXBXQXFJU2ROdXRkNW5CY0p5d2ZEdklmckpEbHF3ZFNx?=
 =?utf-8?B?YlNnMytCSzZucXNDT3gydFM1WVRFRmIxdHBKY3FJTVpaUTlJN3hvcDRHN1lZ?=
 =?utf-8?Q?/zif9BBQFTc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFZrZllPSmZoTnZEL2UzN1Q4RENXMm40ckdxcGk4MkNyU3huWTBuNklnQ3ZY?=
 =?utf-8?B?MHFsRmFqTUgvZGdkOUQ0U3BSTDJuYlRpcHNMeEJ6UWF6TVlIVUpqVzB1TStx?=
 =?utf-8?B?TjJ0dnhyTlpqQVFidHN2L25NL3VpUlhoUktpOXJpNXhUVmVxNy9pUHpMdWMr?=
 =?utf-8?B?Y1BKdFFRZGZxMzBXYW51QnBMa3pwOCtxWXc5VE5hUTlQUFNsR1A4NC8xT2Ra?=
 =?utf-8?B?LzZhdnV0am8xenRRdnBsN1FlanpGN0lqbTZmaUhCMmpnQ29leWNNWmowNmht?=
 =?utf-8?B?ZUVGajh1aVlTK0doU2tSUTArb0lrcXd0bFl0QllmU2FxSUR3U3ZlODJsQURS?=
 =?utf-8?B?cW9CSno1dFo4OW8yS2s0bTg5aGdvYWtiY0Uza203bFd3aWtpcithcDFUc2V1?=
 =?utf-8?B?OThwZzNNbTcycTV6M3ExU3pjVForclNVUHpkeDhYR051MkYxbHNPc0kxQUFm?=
 =?utf-8?B?NE05ZDd3UWVpaUpoSWtDOFErUjl3Wm10bFFFai85SHFEQ0tiUWtrRWdaKzUv?=
 =?utf-8?B?TGtacXFSZGc1Slp6emo4dkIyVHdHMGpZcEg5Y3ZzVXJRK2JvVEVaa21JMndL?=
 =?utf-8?B?QThjeGUyOFZUK0lFbFZ3REk0c01OdDFqNEZkZEhibGVrWHV5d2QxcFFNNmhq?=
 =?utf-8?B?bnp3NGY4N2Y3cGlhU29WM0N0SGJRWmhXY2tjeVczMUdkMG44RHpXRzVBcHdQ?=
 =?utf-8?B?end0enBiVlFEVktsbXUrQmYwaVFSNU1XZ0lBbmxYdnFOM3VaR1NlZkRzYTdk?=
 =?utf-8?B?WVIwaXY5Zk8ycGdIM3FKQnA3bEpyVjRwaFR3QzkwdFJIVFVralYrTHRYaWpH?=
 =?utf-8?B?amJSckRXZmJsT3Z4NnhHd2o1UHJFS21lR2RYN3V0Y1pjL281M3lzSlp4TjFF?=
 =?utf-8?B?c0p2Q3V0UXE3dFBQYVlIY250SDkwa0x0TlJhaURxSmYzaEh0VmlNd293OXJm?=
 =?utf-8?B?aGppM2xvaGJEWFFlU25MTnQvK1ZZblcwR1hoelhJL3l4VUpyQkorNVNvNWEy?=
 =?utf-8?B?ejJ3czhucjRuSlpWRkRtdC9MdU41d0U1ZFBjbks1TmJqVE8vVjJsc2RNWDdD?=
 =?utf-8?B?KzNyUnc0ZHUveFNETENDNnhXNzNKRXA1MXMyR2MrUm9hTWZHRmhEZE53Z3R0?=
 =?utf-8?B?VzVyaDRZWDVFcXRQb0RYdWhEd2R3M0VmQ0JxWitlZ3ptejNkS0kyTkhhMVNV?=
 =?utf-8?B?U2lqWUJRSzlrQzhXaFQrWFRRTFFJUDNGb0lxcUd6RlovTmlVa2dJOVg2eHly?=
 =?utf-8?B?V2M0cXVsRVRoSWtWRUFPQS9mMXZyZVZKbjFjUW1EaVNCTWR5MWF4WThhOXRt?=
 =?utf-8?B?RjJqSmZrcVRsY3dhY1VQd2NXOUFBTzVETGNJUlFuT1lVOEJmUGZRQlRXbmls?=
 =?utf-8?B?cXVwekpkeDRIaUlFcElidDY4aXpZUThBWlF5RDVzNWlucUdYbVh4cmZPbUx2?=
 =?utf-8?B?VlVQRkdtdzh2eHoxdllmSlpsRk5remRRV25JOFI1aGdvZW1TbEJpamF2dy9r?=
 =?utf-8?B?NzJWYWU2Y1FBZEpONnRPSW9NcWo2YkdNYnAva3Y1ZFhRNXRLR3Z6QVA5T1Ey?=
 =?utf-8?B?OVpnVVcyTEFRUHZ1Vkw2cElteGl5Y1ZVTVY2cVBSOGVHeVdOa3UxdVBZc2xn?=
 =?utf-8?B?Tng0ek1ScXhyeFFHaU1mWjU3eDVqbFphMCtaZ3IwYjZYVEFQTEJLeVVSYkla?=
 =?utf-8?B?Z2pXQ3o2SHM5QmZsTVpuSlJiSTk3cG1mU3c0K29RUHVrUTREa1QwVExoR0tC?=
 =?utf-8?B?L1pGT0lVTGM3UHpkV3ZVbVJ0L21ZVTdILzJNSFJLRU4wSkxxQnZpUDhDbnAw?=
 =?utf-8?B?RFNEY3Rxa2R5bGpJVjdUQmZHUGc2clJnMmhCbHVmOS9Uc0ZNMURTYWNQYXl3?=
 =?utf-8?B?TzZZZkc3eEtIZGZhbHRUSW9pUldkN3lsVkhDbC9abmx5NHJPcmdCM1BhSUpB?=
 =?utf-8?B?TlhFWW5BNTFVTWtXWkZpVGVDNUM5ak1FSDVrNSt5cEJSMG93Q0hIcFlNUlFS?=
 =?utf-8?B?UXZwT01ueE9HbWQ0Q3BFR2IzdnZRazRjRFhNSFdHaFBZZnorWExoUnZyQ3NZ?=
 =?utf-8?B?S0NwVHB0TGNEWDVLVHViSVl5OTFxRExSK0VGMlp6KytQYWRqc2F2K2xEYU9x?=
 =?utf-8?B?OGxRVGlUQzBtanNpSU1RbjJzWmF1OE1TT0JhbElUYzh0VUlMMzE1endpM0Er?=
 =?utf-8?B?RkptaU9vS0lYRU9FdVlDdW1WcU44eTJ3dXRHNjZWclFsWEM4NktNZlp3Zmpz?=
 =?utf-8?B?aHpNZWFJdFk5ZFViUUQ3eVNZcUJybysxQ3BLUnFRZDIrbTc4TjVsSDdQbWxt?=
 =?utf-8?B?UG5oMXdKOW1FeEFmUmNJaldUSDNlUEphT3NFeVZIMmJET3RjMFZRZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7064d6-2b9a-48b4-2a94-08de6aeb125b
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 10:31:39.4148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9V/6cW/uy6HNKou4dzAzBm3yjr4xdY0/El/fyTT2ehpp/8bu1j69ZOZhp7tqIrfN/UMwXFVqLbxjlj4R/5gZmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7908
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

W dniu 10.02.2026 o 11:24, Jan Maslak pisze:
> Sets up the r1.4 to contain the value of dim.x, making it accessible from
> the shader.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>

Looks OK.


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   lib/gpgpu_fill.c.gen.iga64_codes.c                | 2 +-
>   lib/gpgpu_shader.c                                | 6 ++++--
>   lib/gpgpu_shader.c.gen.iga64_codes.c              | 2 +-
>   lib/iga64_macros.h                                | 1 +
>   tests/intel/xe_eudebug_online.c.gen.iga64_codes.c | 2 +-
>   5 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
> index b223425d0..15ffb6f2d 100644
> --- a/lib/gpgpu_fill.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>   
>   #include "gpgpu_shader.h"
>   
> -#define MD5_SUM_IGA64_ASMS 8304c8bb11385470bfd6ac32e1c36840
> +#define MD5_SUM_IGA64_ASMS b785dce133b8fcf480cd65b219b3e008
>   
>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 767bddb7b..abccb4808 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -151,13 +151,15 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
>   }
>   
>   static void
> -fill_inline_data(uint32_t *inline_data, uint64_t target_offset, struct intel_buf *target)
> +fill_inline_data(uint32_t *inline_data, uint64_t target_offset, struct intel_buf *target,
> +		 uint32_t x_dim)
>   {
>   	igt_assert(target->surface[0].stride == intel_buf_width(target) * target->bpp/8);
>   	*inline_data++ = lower_32_bits(target_offset);
>   	*inline_data++ = upper_32_bits(target_offset);
>   	*inline_data++ = target->surface[0].stride;
>   	*inline_data++ = intel_buf_height(target);
> +	*inline_data++ = x_dim;
>   }
>   
>   static void
> @@ -206,7 +208,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
>   	/* Inline data is at 31th/32th dword of COMPUTE_WALKER, BSpec: 67028 */
>   	inline_data = intel_bb_ptr(ibb) + 4 * (shdr->gen_ver < 2000 ? 31 : 32);
>   	xehp_emit_compute_walk(ibb, 0, 0, x_dim * 16, y_dim, &idd, 0x0);
> -	fill_inline_data(inline_data, CANONICAL(target->addr.offset), target);
> +	fill_inline_data(inline_data, CANONICAL(target->addr.offset), target, x_dim);
>   
>   	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
>   	intel_bb_ptr_align(ibb, 32);
> diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c b/lib/gpgpu_shader.c.gen.iga64_codes.c
> index fffe242fe..ee45f8263 100644
> --- a/lib/gpgpu_shader.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>   
>   #include "gpgpu_shader.h"
>   
> -#define MD5_SUM_IGA64_ASMS f5d2183439f5e7b18097c3c2c2957dbb
> +#define MD5_SUM_IGA64_ASMS b3ca58d01d637034cf62ec574656a2f0
>   
>   struct iga64_template const iga64_code_read_a64_d32[] = {
>   	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
> diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
> index 8e452cf63..76a330ab5 100644
> --- a/lib/iga64_macros.h
> +++ b/lib/iga64_macros.h
> @@ -27,6 +27,7 @@
>   #define R1_TGT_ADDRESS r1.0<0;1,0>:uq
>   #define R1_TGT_WIDTH r1.2<0;1,0>:ud
>   #define R1_TGT_HEIGHT r1.3<0;1,0>:ud
> +#define R1_DIM_X r1.4<0;1,0>:ud
>   
>   #define SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)	\
>   (W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
> diff --git a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> index 3bd5b0c5f..32009e40f 100644
> --- a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> +++ b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>   
>   #include "gpgpu_shader.h"
>   
> -#define MD5_SUM_IGA64_ASMS f0897ea23eff7ea77569eca6ddd16161
> +#define MD5_SUM_IGA64_ASMS d8acd22fb8afb78633ac79a0ca42d8da
>   
>   struct iga64_template const iga64_code_store_sr0_0[] = {
>   	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {

