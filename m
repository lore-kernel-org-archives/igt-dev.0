Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE3FD7877A
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 14:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9597C10E40E;
	Thu, 21 Nov 2024 14:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkkK9612";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DA910E40E
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 14:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732201196; x=1763737196;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=J77jJ6mFO6AckIMi138DzEhLwO8ZS8+cal19+o9tTUI=;
 b=TkkK9612UVZC1JohL0NqSNk1P8YsYLBJ1iVHXQ/BZkchaMrXCN/BL9J9
 v2/TW5Zl5UkywhgpzMpmP7GnXvpNZ0QVwrfi9We3HjXYb6yXhn9L3xijT
 q0yvHGuNEL9V1uhkZt320ptbywYQuhoOYnfiLJbl/19L++HdF3UU/pOPE
 dPqEDWNO0UXTBuT+3yGw0kEB4wNRJ5PfvZDNYxA2cYyaI5BMlBhT3w38U
 BRbXvO4DpKkjkKLHbgPhr1A0mMHojt5TaokEZYIAjk60JVZH23BIsBn00
 lKS9RJBzDmtrbZOWMr75f4v4vF0BTbBoT5ZrSKZejr6gwDjUyX7VXsDGj Q==;
X-CSE-ConnectionGUID: 0QthLF7NQKul+JsGyhv8tg==
X-CSE-MsgGUID: Dquh7rR/SVaARRJJvOdkrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32453813"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32453813"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 06:59:56 -0800
X-CSE-ConnectionGUID: 0SSCAUaFSqq6ry3L9NwAhw==
X-CSE-MsgGUID: YILbHgGNTyOm30tbSqyCAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="95347445"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 06:59:55 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 06:59:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 06:59:54 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 06:59:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrv3xTdXyyUo/8lYx2jWFQ2x3B+6aB65nKBgw+LarIKc+PWv+Tplt6UOxjhk+Dl41ws6pWYVM4FkTEQ8kuEQ7KuRW+bskjiLRos4849xggKimA8k+HYLjegMpAECOaeuLxvzNyqws/+ZOCHk3stdOIE0dF2tQQowBYsMFVhoqeUK+oNYBIlgvymrP/TZFfE/s0iiys/RHsQBo1i0v24O+uDJX3gg/wRPdOG7cBIMna1fT5jgAr+oYrFNyHNyEX0ZCRLtHeNzjX5qSuLVZMzhPstkP9RCEutKUP3hoTVhTcZuLF2kRxyXIIEq8CiQAQDB9LE7VZgnpgDefTa5VR1JNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJtoM73j6cVAgI59vOh9D0sh5Hc7yZ8fmWmQWDjCg4Q=;
 b=tOCAeWyJNos4NYTfYFjJp3sRhySP1kQJLrMjGJSGtjdw6N8HUm8ToBUhk98z4Ih7bGRAici3yAZB/CXr0jtuOaKhWPp03qe7K0O96PsGVf3udEherXqmesYHa3drZiOvkwv+LpRNhocduaGfGbsredkze79uulpmQ2M5NPhLqZLke3ypSiOFracehI/BZEMdwAD3QQMevgYzrffIj5DptEfctOivr7vWibYFWqQrGs3EfrMqHMMuqkseAL0T/2yu5ruqzZcCwdEKsJ7M+WISasQYb2EGDVLtPAOxw/51DO+yxgnCR+REDbUcyypcpTWBeETqNXHjdocLsjKZFeYhFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by BL3PR11MB6313.namprd11.prod.outlook.com (2603:10b6:208:3b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 14:59:50 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 14:59:50 +0000
Date: Thu, 21 Nov 2024 15:59:45 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests=2Fsync?=
 =?utf-8?B?b2JqX3dhaXQ6?= Update invalid-wait-zero-handles test (rev5)
Message-ID: <h2ngkqodovcl22ewzx2dzvqrhclenk7vqhckx2po6ctxo7g5pp@pxoot76u5pci>
References: <20241120103507.7653-1-krzysztof.niemiec@intel.com>
 <173210381886.700359.5195724842853144790@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173210381886.700359.5195724842853144790@b555e5b46a47>
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|BL3PR11MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 732474f6-5237-4c60-647d-08dd0a3d25ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rko2WnZ2VmRUWlByOWZMNmtySkNrZGZrVDd4bytLN2pFcVJlTjBTVzZWaVVJ?=
 =?utf-8?B?T1ZkZnE4d2RXRlNvbVlvSWUwZ1lXVDdYdzZ5akVUOWV4SWJhT1pkVDAzOXQr?=
 =?utf-8?B?dXpxblFucjdoZjVETnhtcjZhTFQrVHhsMmJHQlYxYWVOQVV3SzFjd24rMkJF?=
 =?utf-8?B?THJhM0dKZVlsVFBwWlRwbXVHQThYTGRrMjNmMXI4V0JwSm1UdXJIMUhKcW1T?=
 =?utf-8?B?dWRCYzdYV2JZN3VvN0UvT29TMyt3VkdvTGdJRlA1VTgvbkhreG81eWNNTmJ4?=
 =?utf-8?B?Zk1XOWdhWWdPTzhMMm40L3JuQVJQcDZKKzhqa2JId0JUSjZTcUtBVEtWTytD?=
 =?utf-8?B?SzZQTTc4cnpNTFAwdXBUd2xGZHhlbGNyYnBCYk85dUxiSHFMaWp1NUp3Yndr?=
 =?utf-8?B?SHhUWTV1MUQrdzJkOHRzd2Z6dDhwWjVETDVhcWdvVkVDcGFLYytzWklYVXly?=
 =?utf-8?B?czQ5QzBCTGRIcVdMYlNwaEUveWtRbXZNeVRpMUljWEI0SDZQRGdoRUoxQ1cx?=
 =?utf-8?B?TDNvbFpEQ0xmaWU4NzNNandjV2J2cXVESmR6Ui9lU1FwazBxc2JXb0tMQVdR?=
 =?utf-8?B?bEZjc01sMWtCckpueGJ3bEpwYndZOGpHMTJPcWdSbUgrVW9PejhBWFJGODRM?=
 =?utf-8?B?WjUzUVVoN1pCR2lvSUZpclNZRnlVYjMxdVpDRmh3QnhkK01FaklxUWhoVVRV?=
 =?utf-8?B?enRnQnE2bk1FR2h2UkE3N3dvNEJuSjJDcW5PQU93MjZja3RSWDVRVTcrOGRL?=
 =?utf-8?B?L3kycThhcUdrczZPSnpoMjNURENNSmpUNUpKNVpDUGNoaC83SzFhRVNvdDJ4?=
 =?utf-8?B?Rko2NlF3dUo4QkR1MERyRkJJZnlxd3grOW1XYnNndnAyOUFSQXkvOUZaNFNZ?=
 =?utf-8?B?Kzl3amVWaEdtMVZwemtvaGJBZ1ZuRTcydElHN3ByeE04dDdLdndhTXpoWU5Q?=
 =?utf-8?B?T1FtZVZqWU41cTZMQ3NYd200c1QzNnBnZmNsREVDOUY1Z3BjMWVtMFBFTmxW?=
 =?utf-8?B?bVpKdU1LaHNvNHVkQk5zK1dQYVo0OUk2T094eUhRaFdiMnZ1ZTcwdVNZQ2N6?=
 =?utf-8?B?Nm9HSlR1MStJWkdaZm1FcHB1OEhmUUQyOG5TdFZWQXh3Y04xVzNPdFpoM1E1?=
 =?utf-8?B?TlAySmpwVHZvRWd3eklTYVIrSWRoVjdMTHZOSHgvbDdzdDZTaGxTaitzeU9a?=
 =?utf-8?B?bUIxQnRGdG1FR1gzcldNWTdCdStnZThhY3dJQWNLMVRDdGhhUGczK1hZbk5y?=
 =?utf-8?B?M3A2YnYwTmZQMkRxNW5Hd3JPdDBKbHBkWSt5UWxOWHpUN3RFbDhSSWs0c2hM?=
 =?utf-8?B?VDYyOEhzdHBwYUJyQ3YzSDhkWHNSUU9zYU5oWlZseGVZZjQveTRDLzNNRUhK?=
 =?utf-8?B?ZFYzNzBaODFFWEtINTJmUUpRdlZlRnBQN3Jjd3RpSTNqRFN4dTJhUE1CcllX?=
 =?utf-8?B?WHN3dUdUVml2eHdpOXAzRThySnBnWkRPWmRCczFzNmx5OWNZTHlHQ2Nadzdw?=
 =?utf-8?B?TGlyYWxWNGE1dHE1Qlp0RHk3ZDVIRElNZ2Q3SHFUQlRmQXY0UHRRdWFjdkVY?=
 =?utf-8?B?ZGNjdmFWOFNHdEkxb29PeUd5elorR3U4QnIrSmgxTWpGeDRNWDArNjBqNzBJ?=
 =?utf-8?B?MkpqL2dQWERqU29pQmtwZ3dwVHlnRTArSXVvSVZNdUlQNktjeG5kS3RNOGVU?=
 =?utf-8?B?YkoyNFlYSEFmTVVqcjJKWGIyZzNQblNib0UzaVRnUVVGc1FTRVpkYVRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1R5aTlVcHBHSU15d0lDTWQyQjZyWW9BMFQ1T1h6bFRQeEpXaGI0bnFwWXho?=
 =?utf-8?B?VkJYcGZzb2IyYUNGNXMzM3hDQzBTT09oRUdlcHk1ZkZTREEzTExMNUV5RVl2?=
 =?utf-8?B?VVdyNWdHSENIdGhHM0I0OTVOM3o3MWdLdElPVk9lRW1nc2VrOXdaV2RrbXE2?=
 =?utf-8?B?bmZjdGs3ZVRoSE5zMjRmWHdPK3VQZ2hZSFJMT0QzYitQQTNBVHFqSlVjNVl5?=
 =?utf-8?B?RlRpUEIydUN6aFMwWVVzaHdFbWNkNE5jeHBPdXRBdnlWdVpBRFAwN3h2NGpk?=
 =?utf-8?B?VWpSaFJ2blp6WEd4a3lZaFRvdzJhcC9xLzFXamNNMFBGeE1FNzRJM0J6RXBE?=
 =?utf-8?B?YzUwSk12R2Uxb082N2lPUnlSQUk0eUIzRjhSRkxSNWRFaWZKMTBSelJOLzVa?=
 =?utf-8?B?bTN6TTM4VlR1T0NlczZZYWtZSzJSUFZwUXhncWJvWjFybTBOZmZteXl0dkJj?=
 =?utf-8?B?TGk5Ukx6aGtlZTh2dlhkZDVlNnk2TlpFMVdoellVTGVUUXFCczd6dHlCN0hO?=
 =?utf-8?B?dGZYZE50Y2o4TXZOQWpXUVdNUE96bWVjU3UwUzV3UjIwUHlGNHd2cmNBZVB0?=
 =?utf-8?B?ZU92S3pCaFdJSWJaZmY2MVVwWjE4Q2Y4TFYrYlh4eXJydkJJalhzMGIvS2xZ?=
 =?utf-8?B?eEd4K2xzZWdDdnNZZ0JSVVFsNjRFMWZuVWxTNjRlNlFtYWJpOVlOdm9FRHcz?=
 =?utf-8?B?aG5Zb3pIRTAyODFnVTUzcmRjNUdzMXVoaWUyQ2V6YjVJV2VqVi9oeEZCY1F2?=
 =?utf-8?B?ZnluNDZ4Qk1QK2U4T1ZyZG9nRzZNVW8wTEd5TXdnVzNRUjNTQi9yT0hEL2JX?=
 =?utf-8?B?UmZpTjFyUCtFTjlNZ0ppdDhvZHNrdkYxNDdaeVkvNTRrenZIOEVOajB5Yklm?=
 =?utf-8?B?dExaOS96VlYwUXB3eUVCdnQ3MElnSlg4YXUvUGpWOWNxVDB5OFd4MXYrditU?=
 =?utf-8?B?aGIwNFo0WnpIbWVqeDZMdlFBemRCSmQ5TU1EU2pFc21vRjFNNkVkZnd5SzR1?=
 =?utf-8?B?UklrMFV1bWRHMHUwUUo0SDRlNHZjQklLamtsV2tMckNuOHVxTjNWaklKMCtS?=
 =?utf-8?B?U3RjMXI4NlUvMk5kS1lUdExzWFFkdG9YcHQrU0dOVHJpdDdsdU1xQWJqcW1S?=
 =?utf-8?B?MWhUelVFdFRkV0Vvb0Z1bm9xR3NXakduQSt5UWdHU2pZQ1p1aGZJQVJ1ZDNi?=
 =?utf-8?B?NzJ6MTRrRE1LTWVOaWk4eGphK0FudUVsM1pXNEdGZFl1c1VvS2lRZVhiS01w?=
 =?utf-8?B?bVJxcVFyL1pBSWNqR1J1YUJESmNNUllKVVlpMXhCQzJrQ0xxdkNmTE5CdHc4?=
 =?utf-8?B?K25qbk1QKzVUV1FCcXA1SWVzVWtkRmFUdkttL3JraU1EaWNxRzZ2bDliSE4v?=
 =?utf-8?B?TW5zTTB3d1huRnJaN0Y3c1kzVStrVUszMlFHeXRZblhzZXdnNmUwaXhCOElP?=
 =?utf-8?B?Vy9PUVFQQXpEQjhhWTlPSHZya0g5WDJCUEl6UXJ1RUhjZXozTkx1QXBGeEF0?=
 =?utf-8?B?TkJ5MmUvZXVDTFJRZnFuckFZbVEvQ2V3cUphOVdWSkxHOUloTUxvemJPQXJW?=
 =?utf-8?B?ZGtocll5OEUyTEdaVGxHWmc1VTh5d2JXWCtWUXE0YU5BVGxJblpsdFBGNUVj?=
 =?utf-8?B?NEZ1citVam8rRXFTN0c1Nmd5SVdYNnFMLzRjTGJQSkdWak5zMENnVitRMy9V?=
 =?utf-8?B?dllVQjF6elEwZWNZcnNKQ3Y0a0JtUUlXbnJXSlU2ZHFRZlU0bldiRUpWV004?=
 =?utf-8?B?b3M4ZjFqbVZQaDJXdGVqR1paSlVLUXYvMmhtRFR2NGsvYXJMbXVNWHBydTdX?=
 =?utf-8?B?OVVMM3hpay8vTmFZeWhYU20xdTc3ZXNkMWxtTDBuMXI1UmpJYUtBeklrOWZM?=
 =?utf-8?B?ZHhQWHZvaWZpMDFYdlgyckZjekp5VGRvT2dYdE5RUVovczRFWUxUZllmMmdS?=
 =?utf-8?B?eGNLMzJ1SzE4RkhOODhLd0JGVjB4TDgzbThpWUxSK0c4eDM2RithcWRXMEUy?=
 =?utf-8?B?aXArVVlNVzRGY3RKNVNRL0xicTNsY2xGUkt2dTVWcnlkaVdvNFJDbExwL0pz?=
 =?utf-8?B?bFJyZ3N5NVVYbm1jSGpvK0trN0lVdTBNSk42UVhJdXZkSjh2NE5UaU0waFFa?=
 =?utf-8?B?WXQ2eE13cjJpSEZrUlNyWVpkNnJPS001V0lZS3o5MkU3M2srcFdPL0xLTmVn?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 732474f6-5237-4c60-647d-08dd0a3d25ac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 14:59:49.9420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lDoQqvXeNDfm3r66sXsx6F23WUOsjuWVW9q9hF4NeIJk67TUPdv4Sd5NWfZ/fONaCxEzbhOa4iiSw1ukzK775YhQXSD8OdGnbb4Q88nvcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6313
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

On 2024-11-20 at 11:56:58 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/syncobj_wait: Update invalid-wait-zero-handles test (rev5)
> URL   : https://patchwork.freedesktop.org/series/140727/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8118 -> IGTPW_12146
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12146 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12146, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12146/index.html
> 
> Participating hosts (46 -> 45)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12146:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_engines:
>     - fi-skl-6600u:       [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-skl-6600u/igt@i915_selftest@live@gt_engines.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12146/fi-skl-6600u/igt@i915_selftest@live@gt_engines.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
>     - fi-cfl-8109u:       [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12146/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8118 and IGTPW_12146:
> 
> ### New IGT tests (1) ###
> 
>   * igt@syncobj_wait@wait-zero-handles:
>     - Statuses : 43 pass(s) 1 skip(s)
>     - Exec time: [0.0] s
> 

"Possible regressions" are unrelated to my test; The new test passes,
and the 1 skip that happened also happened in every test on that machine
after driver load.

Thanks
Krzysztof

>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12146 that come from known issues:
> 

(snip)

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8118 -> IGTPW_12146
>   * Linux: CI_DRM_15720 -> CI_DRM_15722
> 
>   CI-20190529: 20190529
>   CI_DRM_15720: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_15722: ccf64319402f90f68549e2047a7f985a46436e41 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12146: 12146
>   IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12146/index.html
