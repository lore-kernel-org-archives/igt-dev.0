Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C132ED49232
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 15:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736BB10E4F8;
	Mon, 18 Nov 2024 15:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e44qj5Bx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438A110E4F8
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 15:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731942676; x=1763478676;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=pTXZVzrY8HLE4dkEt4QgzVeI1hV96MKxSkp5qCrNlVw=;
 b=e44qj5BxGJzCXvHFUx9g60jh6W2YgDXOUsmEU1W+oZiGYc8oAwEe+1nj
 5aOFp/xWfz1jTlfEkg4LHsgnJDqhMdzL8el/TXutg7OLd+UtvhT7DfGJm
 HjS6Ia/WO5eC4Sad7RkS3sdrkcGWu572bRzju5wR/K7ycLesYSm2/W8df
 vM7/GilD/QwZWcwXrIv6njD8iHSjIAdV+xuhcIUUCShrg1ooNJPvefE70
 QAtM+rl5z0nPnG4rkmj7jrGBU2JH+UFlzICSuVAMG5gztkcIZeclMmVwX
 8TNdJ7/rRxWyyxkHCEvZY11H03l3kLWQ793b/J7x28a+Xj5Spb2XD/utQ g==;
X-CSE-ConnectionGUID: kiAmUzwlQMGEBIKiBpL9og==
X-CSE-MsgGUID: LJsEU8rRSXidfJ4U6S0RRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31828376"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="31828376"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 07:11:16 -0800
X-CSE-ConnectionGUID: YYHbB3IcS8mTrXkc/oFY8w==
X-CSE-MsgGUID: CQg5+HD4S2iVF9jz58ML5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="120192197"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 07:11:15 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 07:11:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 07:11:15 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 07:11:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUwEIKQnxd3ljN0QmHrbEWC/g+ihacZJVRFsa9QRWxAPWjqxwAO3f/8zUzZ4PvegiphzFbH160rOkraWrFtlNL1NBdFhFudRihTHy8y0hxS2BohEQJOA82jIfH8U99zGI6ZONieyi86TuO17PjPiK9ZTWklJUQZXC7S2BqyeBkMNhdvSKTJICHlzMGKcDftIEJhyTbq3URN2lbzQweNiOLp65JD+dURI5IiKiFfeoRVxvg+2sm88ktNpBt7cgBbqT6ntqSNrqP0E5il7dyy711srqgk+HlWEYagIdmWCclzuD9Rf92Z3FK/ciKOKUTOSYmxdm7XibGwIq0VeZexx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYNU0/Hi9Phs8YsS8k0xJ7RkFLVPHS7VB8m4ekQv7gk=;
 b=f2l6zZk1QiVsd7sslA6EC1f0sv5uJu8/jglmmvU/sgl75gUEZ0YLf5DczvGTAW3ttu7xyySNDEFpdXW2nkVEImRirPW0Sj9Q0qC6Y/nrMsFtITx0YdCua1AS7kVqRYVT7x2Ab9ofSh7Lke4iKef6RMtjnT6PPCb626YzhBQJNVardvNc9ueSRy3fzN3hytzt32eAUVBTyOb9xNjoTSHat49g3kqjwgnZJdis5ZLkCUbl/v+1C+HXXGuXuPBquAAV+8J5NqAWsTVgxhCwKXVpv3mzHupmRbb4ZY6+3gDw22IyjcGRay2j8d7NkEr1+Z2ycP9QeEaVhcIcnfCIGVLruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SN7PR11MB7540.namprd11.prod.outlook.com (2603:10b6:806:340::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 15:11:12 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%5]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 15:11:12 +0000
Date: Mon, 18 Nov 2024 20:41:05 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/igt_core: Free log_buffer entries on exit
Message-ID: <ZztZCZ-9ewGdnhYY@bvivekan-mobl1>
References: <20241107070208.3143050-1-lucas.demarchi@intel.com>
 <20241107173145.avmfmvivykerfpz7@kamilkon-desk.igk.intel.com>
 <ypjxm3cpvsxvco5nn2wyxrpllmtb7k5pkksehtsve7piyrjal6@hesxrn4iz4ia>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ypjxm3cpvsxvco5nn2wyxrpllmtb7k5pkksehtsve7piyrjal6@hesxrn4iz4ia>
X-ClientProxiedBy: MA0PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::18) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SN7PR11MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: f922f46b-15e1-4252-ef07-08dd07e33cb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nllaa1kwY0xDb0RVM3FZcG0zcUpZZFZ4U2lHY0JOTEZxajZPWHJMKy9hYXln?=
 =?utf-8?B?TG82akk3MXNNOFRHeXJhNXpobms1Z3JjWDlaQUthcEo2OVgycDNnM2tUdGVG?=
 =?utf-8?B?YmVTNTNTNldZTnF2SW8yS2RiL2s5b1AwS05jQ3JkWTlvNTQvZzI0Zmw3aFo0?=
 =?utf-8?B?ZllOSXVmR2IxcDJxRTNFN0cyK1lxejBRTCtPMmNiVUd5SXlmRnRkaHdJcjhN?=
 =?utf-8?B?VFNhV3B1ckNsMVZPbTh2Ukp3eDh1ZUNOS0JmMFMxYVZsY2gva0NodHpFWTRN?=
 =?utf-8?B?OE9yeTFnREt2UDJoSVhHR3JaTmdsMnM4dEJnVThES2tRdXUxQ0VGTjk4dFp4?=
 =?utf-8?B?S2IvbThUb2crTlVCUkpjUUNXVUR4SlFOYUhBZEErT051TXAvTmN5OGhwdmhF?=
 =?utf-8?B?dHJ5WE9uQmhIcWlCejFnVm4zVW5ML2ZLVVY2N3V1R05oSExvbVJQWFBrbkZM?=
 =?utf-8?B?b2xDYk5hZUdtUWRWZjBteWU1Z3plSzFNUUNoL2VJc1M4K1Fwak9wcThHdmhv?=
 =?utf-8?B?dVBxNkFDcTIrdUtRQUJQeEtKTXYxRVpWdnNVWTZzRkg3emF4djdvRW5ISjlE?=
 =?utf-8?B?cm1JaUdoR3hxMWdZN1pKL2ZYRjJLLzdvdlVDazBLZEl3bHVGa0YwdjZUREQv?=
 =?utf-8?B?dDUrVnVjWkRBT0VFckd5SFp0c1ZobjVmTXNDYmpnOHUrRzd0NTdUU3Q4RTRo?=
 =?utf-8?B?Zmt2REhSQW1NVGFsSk5BSm1WUzY1TFNmRUFmNWE2T05pRFdSN09KcDhBSUMv?=
 =?utf-8?B?Yit4UjA3cERPbm5qNFZPNThESVowSU1vZituOE1ubnorWEFBK2VoS2lpRzE0?=
 =?utf-8?B?YVZTc2xZOTIrQ3ZXVlo2WUN1eWgxQXdvVGVoQUN5REpacWJhSmR4WVdObWFm?=
 =?utf-8?B?RG0xSGQrU0h0Rk5QU1NKVkk4SVhTK0VjYUE0b0hlUzNFNFIvVCtjNE9MVk45?=
 =?utf-8?B?bkRtUGllSUhmUjFsOUw5emt1ZW1zZEdUUmU4Q3YvZG5haXd0TlhsY08raXJo?=
 =?utf-8?B?NjNreXowYjY1UUh2UElvbXBJMTlBQUpKWEN0bU5sTUdKNEN0RnlZbUdiNXdy?=
 =?utf-8?B?MmhKYmdJZExtTk8raENTdXNKd3d3dzdiWmJKaktxT1hRdUt0djl6aVFtaE51?=
 =?utf-8?B?TW9qbktrVEhyRVJtTFNnSXNSYnREelZWNmE0ZGFIYnhMS1YrUEZobldvVDQx?=
 =?utf-8?B?endZb0YyZGVXV2NsMFAzNHNGN2RUY05Ed2JxeFBMTlc1UWQ0U2VQSXV2RzR0?=
 =?utf-8?B?YmZIOEZYd05DZ1RKVWxWVGkyckxhUEZ2cFVkVWJyNm1RTFFDRU9Tc0YydXVh?=
 =?utf-8?B?c2REVDR3YnlFbUUvQkFBNFNYUXVMK24yKzB1SVFlRS9aeGR3ZEMzOVJFL2o0?=
 =?utf-8?B?OEpBeHFHVFlXdVA5aWdiRVlpZElmako3c1FlenllL3BlOEE2WCtkMTh0Y0sy?=
 =?utf-8?B?VzRCTytPZVluOS9saHgzelowZlBBRnFLL2JSMEJ2V3JBRUpPeGMyMlM2VmFH?=
 =?utf-8?B?ZndxNEpUT3Jvd1dMb2piYUtwaGl3b3BJSlp4cFM4NG41SGU3SXRrOVdRQWFu?=
 =?utf-8?B?OEloSUIyVGlqbG1HRXlKeml2WkFkcXVMVE9kTEM3SGhVeU9vZlBablRpbGpC?=
 =?utf-8?B?OG01VWhVVHg2TFZUUiswMXdYL1Z6M2NNcnYxdUJWdVlFREFFWmsxV2hEY2xt?=
 =?utf-8?Q?gHEZekTfXkSSVQoF+40h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHZiYklGVTNUVG4xZjlpVmQrV2ovOFhIRW1WTTBnK3pGbEJIdENhdGd4K0JX?=
 =?utf-8?B?U0hGaFhLNDRVTCtBWTdsaitVSXB2a3B4eFhiUmlVc2J3NmJDS0poZDZrZjM5?=
 =?utf-8?B?eThzcGhISlFKZnV4TWtCSkJaVVNvSzk0YlpLTjZ3ZXFjZ2FMTTZ0Y2MzWFFJ?=
 =?utf-8?B?SDljTlNDUEJFaHhueXFza3BqbHl3bnNHbDJjY3dqc1Q0SVlWYjRYZ0dmVFB6?=
 =?utf-8?B?dCtlVVFpUW1MNFpKSjJJTTFHNENvU2xmVDkrdjZCQ1dPMjZSSVpieVM5SFZL?=
 =?utf-8?B?T2tRZEUwSUFsNzd6V3EwMEFMNTdvdWx1K3RFdW83Z2ZGRi8wMDNNKzNsbHdJ?=
 =?utf-8?B?WWx3NUxHTFpNMmMyazdUUUdkeGRDN29tUklybk9JTUY5elFBOC9uSmZ3K1dW?=
 =?utf-8?B?RW1uYzgxOS9ZQlROaDdJTWFzcHNsWVBTa2JVRVo4QmdRUmtCdkhmRDdDdjda?=
 =?utf-8?B?YmpzTTNlamc5d3NhNjh6ay9tRkJlcEw3RFNZVzdMamx6WUtVcVA2emlTRHZG?=
 =?utf-8?B?ZDkzUHVYWHcvRzlkR3hjMmcrTGZjYit3WGVyckdrUStTMzNwQkYxQXFlNGk3?=
 =?utf-8?B?bTJOYkt3U2l5QVFlZ2pRb1BMK2pNQkZ1eHkzclA3K0RLQmxOczhiem5Ob243?=
 =?utf-8?B?QURwVElpdGROZDh2bTBEZE96anQ2bGpsWi9Wci9YYWN0Y3V5R2JtdmpMb0JC?=
 =?utf-8?B?VUFZRHZSMXA2MEsyV0xZR2JySFh5Ky8yWXpNNFd4M1E5Wm0yNEg5Um5YRXlh?=
 =?utf-8?B?UFVpb1ZWdlc0TEJLZ2FPQmd1YVZxTTd5b2FJczVqREd2cHRITEFwd2Rma2hI?=
 =?utf-8?B?M0dRYVduSGl4ZHRvVGR1NWVXRSsvMEhwYTVQSHlENk50ZktWM1NQaDI4aEJp?=
 =?utf-8?B?QUVLYkZpbyt5cXlRYU5ZQzJwU0s2QXI1QmxpcE5BelRNeHRraEcvNUMrZ3Jn?=
 =?utf-8?B?TDE0Szc4QzF4MG1Dd3dydzhlSjRmWWM2U29oU0w5UWY5czY4M1pKNS8wMzBs?=
 =?utf-8?B?SmxKNi9MYXZ2QS90eGxEbHV1KytTV3lDRW85ekJKTE5rQ0tBdk1TMlcyNjU2?=
 =?utf-8?B?UFhnMEgxcUtRSUxKdGVGaWk0SmNFbWh1N3hVU0hXOGxZc0JKNGFJcmFVMHFt?=
 =?utf-8?B?YWVXRUdldjdTa1diUHUvMnYrMitsRS9aK0xQUnhLaXdiditKdThTSEgyQ3B6?=
 =?utf-8?B?N1grOUI3emdIVWdCR3BqRExJeGR4UG4vb0dOOEdLd1RCV3AvaGszUGk4WFFy?=
 =?utf-8?B?YmNjemlvbzJMb2hiOHNOMkZqOXlJYkhwSkcrdTdwSzZ2SGhCV3JCOFZXSWhl?=
 =?utf-8?B?M3hlcWVyVGs1Y0VUemxMekZMdC9KWU9hcWNkMGRHMi9oanZtTExwaGp5U2Rj?=
 =?utf-8?B?VkxsNnNpL0VqK2JTd05adUZuaWlmdFlkYS9LNjZtVUI2UnR5cmUva1FPMU14?=
 =?utf-8?B?VDVDcGE0RzZyOUlncnEwUWIzeUNVZjkxMy9rVERESnNBN2JBd0JWb25JUUt2?=
 =?utf-8?B?ZE9FZkpqazV4UDdDVCsxcDVrUDJZQTZKeUp4NFhCaTJoeEJOY0xNWDZoS3h2?=
 =?utf-8?B?L1NqMXFWd0hTeWNTeHo3VDk5aFNJNzg1aHJjNzlMYkJQdDFwM3NkKy9jeWFn?=
 =?utf-8?B?VzFBZ0E3SER2bXZ6aTgvY2Z3MmR5cUNhd2dTcmxaT213T2lOdXRUeHdRYS8y?=
 =?utf-8?B?ZUU3bmVaT2tTUEtmdEhZUWhiRmQzQU00RkxnKzBrQ0RJVXlWUW53NHdleEVt?=
 =?utf-8?B?MEZDaHFzNWw2UW9VNWx4TE4ycHNieEdWb3BXbmhOeDJrUWdaVUVxN2ZkU3oy?=
 =?utf-8?B?YUhrenZaek5Hd3l4Z3d5aUZaZkJ5RHFBWDZ5bzd4MmJGT1l1SGRacW9PeERG?=
 =?utf-8?B?TVYzclVFNGZTTFhKMktsc3NlL1ppbytORHBhSVRqN0d6T2t2S2IzRXRnWjFs?=
 =?utf-8?B?ME9zV2RJRjE3NUlDc3NVZS9WRlh6NUNtdzZuajZVT0RTdWVDNGRYTnFTMjFh?=
 =?utf-8?B?SzA5NXlxa2xZakZtMTdSSjRESjgzOCtwSEQwNU9UN2ZvZEJNYXE4MERzWDJx?=
 =?utf-8?B?ZVZHN0hTQTNnRXhkeE8vSUcvNWpUS3pqN21PYWRWNFJLbU1HQmxWZnJvckcx?=
 =?utf-8?B?OFRCbkI1ZThMYityQTZwSUdZSzVFZW1aOS8zNGVZNmpWVy9vOXZRTm1QNDRm?=
 =?utf-8?Q?htBPyQgEYBCDth+zIusznAw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f922f46b-15e1-4252-ef07-08dd07e33cb9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 15:11:11.9631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGcHlDg/omJ/Iw2rTbnPzPbEuP6kniU/ehxg/A7k9n53qQLz7N0SxQsFyqQagFQltFglHTGR+2T0d8U5KUtIcrFMvda33Fr3G/g+NEhpH2ZzzvoamTLC9vs/4sQ5usm6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7540
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

On 07.11.2024 12:36, Lucas De Marchi wrote:
> On Thu, Nov 07, 2024 at 06:31:45PM +0100, Kamil Konieczny wrote:
> > Hi Lucas,
> > On 2024-11-06 at 23:02:08 -0800, Lucas De Marchi wrote:
> > > Make sure the buffer entries are released, otherwise valgrind output
> > > becomes each used entry as still reachable on exit (up to 256).
> > > 
> > > Test:
> > > 	# valgrind --leak-check=full  ./build/tests/xe_live_ktest  --r xe_mocs
> > > 
> > > Before:
> > > 	==16082== LEAK SUMMARY:
> > > 	==16082==    definitely lost: 0 bytes in 0 blocks
> > > 	==16082==    indirectly lost: 0 bytes in 0 blocks
> > > 	==16082==      possibly lost: 0 bytes in 0 blocks
> > > 	==16082==    still reachable: 33,473 bytes in 59 blocks
> > > 
> > > After:
> > > 	==15992== LEAK SUMMARY:
> > > 	==15992==    definitely lost: 0 bytes in 0 blocks
> > > 	==15992==    indirectly lost: 0 bytes in 0 blocks
> > > 	==15992==      possibly lost: 0 bytes in 0 blocks
> > > 	==15992==    still reachable: 31,083 bytes in 42 blocks
> > 
> > Thank you for a patch, there are still some blocks left,
> > maybe because that buffer is a ring? e.g. it could have
> > end < start
> 
> no, those blocks are other things.
> 
> Note that we are looping with a uint8_t. When we have start == 250
> and end == 2 (impossible due to how we place log messages, but just for
> illustration), it's expected to free the positions [250, 255], [0, 1].
> 
> Some more context explanation of this change.
> 
> I sent this because the first leaks I was seeing were related to libkmod
> and as the libkmod maintainer I was curious if it was a leak in libkmod
> that was getting masked by us not releasing its ctx. It was not, and
> just releasing the ctx (see
> https://patchwork.freedesktop.org/patch/623301/?series=140746&rev=3)
> made those go away.  While doing that and running other more log-heavy
> tests, I was getting a flood of these 256 blocks, so I fixed that just
> to get them out of the way of what I was really after.
> 
> Looking back to this patch, not sure there's much value as whatever
> binary using it is already on its way out.
> 
> > 
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  lib/igt_core.c | 15 ++++++++++++---
> > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > > index 407f7b551..879d1ecd8 100644
> > > --- a/lib/igt_core.c
> > > +++ b/lib/igt_core.c
> > > @@ -469,11 +469,21 @@ static void _igt_log_buffer_append(char *line)
> > >  	pthread_mutex_unlock(&log_buffer_mutex);
> > >  }
> > > 
> > > +static void _igt_log_buffer_reset_locked(void)
> > > +{
> > > +	for (; log_buffer.start != log_buffer.end; log_buffer.start++) {
> > > +		free(log_buffer.entries[log_buffer.start]);
> > > +		log_buffer.entries[log_buffer.start] = NULL;
> > > +	}
> > 
> > Here you should use the same loop as in _dump, so
> > 
> > 	i = log_buffer.start;
> > 	do {
> > 		// do ops here
> > 		i++;
> >        } while (i != log_buffer.start && i != log_buffer.end);
> 
> there's an off-by-one bug in this loop that I didn't want to reproduce
> here: if we never ever logged anything, at the beggining start == end == 0,
> and in the first check i == 1. Which means we will print (or free in
> this case) the 256 entries. Oops.  I think we always log at least the
> test name, so it's not a bug we reproduce.
> 
> > 
> > Or even simpler, init with NULLs and then just free all?
> 
> it's a static variable, it's already zero initialized.
> 
> > For example, if start=2, end=1, there is still a valid pointer
> > at end==1
> 
> no, end marks where the *next* entry will be. At the beginning we have:
> 
> start == end == 0. There are no entries in the ringbuffer.
> 
> After the first logged message:
> start == 0, end == 1.
> 
> If the ringbuffer ever wraps, then we will always have:
> 
> start == x + 1; end == x, or
> start == 0; end == 255

When the ringbuffer wraps to the beginning, the end would now be
pointing to a valid address of a allocated memory. It needs to be freed
while reseting the buffer.
The condition in your for loop 'log_buffer.start != log_buffer.end'
skips freeing the buffer at log_buffer.end.

Regards,
Bala

> 
> Except for when dumping the contents, this ringbuffer doesn't have any
> consumer incrementing the start AFAICS.
> 
> > 
> > Or do one more ops for case 'end < start'
> 
> in the wrap case, see above. The key of the implementation is that we
> are using a uint8_t and relying on it wrapping back to 0, so we can just
> increment the head until it reaches the tail.
> 
> As said above, there isn't much value in this patch other than "let's
> get it right", so consider it optional.
> 
> 
> Lucas De Marchi
> 
> > 
> > Regards,
> > Kamil
> > 
> > > +
> > > +	log_buffer.start = log_buffer.end = 0;
> > > +}
> > > +
> > >  static void _igt_log_buffer_reset(void)
> > >  {
> > >  	pthread_mutex_lock(&log_buffer_mutex);
> > > 
> > > -	log_buffer.start = log_buffer.end = 0;
> > > +	_igt_log_buffer_reset_locked();
> > > 
> > >  	pthread_mutex_unlock(&log_buffer_mutex);
> > >  }
> > > @@ -624,8 +634,7 @@ static void _igt_log_buffer_dump(void)
> > >  		i++;
> > >  	} while (i != log_buffer.start && i != log_buffer.end);
> > > 
> > > -	/* reset the buffer */
> > > -	log_buffer.start = log_buffer.end = 0;
> > > +	_igt_log_buffer_reset_locked();
> > > 
> > >  	_log_line_fprintf(stderr, "****  END  ****\n");
> > >  	pthread_mutex_unlock(&log_buffer_mutex);
> > > --
> > > 2.47.0
> > > 
