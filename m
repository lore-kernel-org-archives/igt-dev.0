Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0160EEA3C4E
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 14:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ECA10E7F9;
	Thu,  9 Apr 2026 14:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6rQjFWh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B679D10E7F9
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 14:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775743304; x=1807279304;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/D+bDkRfJ/s3Mljs3BvmkS9dY7OSJqmcQvgAaF8kl/U=;
 b=b6rQjFWhZ9U/eFe+aSSDx9YWiZsAegwNQ0EKtQgjUzn4pYLIionKe5M0
 E8mmduhj5qPLkiwoygu4j1JhoUKgLGxeoM5xFcbYJiW9hQPu6xAYn+QOo
 S2wwk4F2QosO16Gds3SDxHMgrvSRRYvamr6y5LHt1ciL/luoaCT0kiTrC
 Se0W39ToHvtkxNHoCGRfvnPvkeHWrj4lRG+B50FZ3DA+bpvjoprvYuySp
 i4MRIjr7bw2aAxM9iYZeRivb4LTTa74J6DfAPMacpdYbCvfYnAqfSPaWE
 igYF7JE8Kj/7/k9oRzkltRvM6KWnRX5j5ylx11uFoHilfb9TXWqbUIcfR Q==;
X-CSE-ConnectionGUID: E+BDybV1TdamfbCniKeeBQ==
X-CSE-MsgGUID: C1y0g2jeS56AzBrEHyvHtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="102201133"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="102201133"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 07:01:43 -0700
X-CSE-ConnectionGUID: 8o8YUdqcSw66H1wcl23oag==
X-CSE-MsgGUID: xIAyoILdRQWdA3CG+JBFRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="230451467"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 07:01:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 07:01:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 07:01:43 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 07:01:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHeW0Kz6NXReeXqst2FA4PBqOcX00KPZ+vgDoAW9nfZJvLQftZOnTEnZqK1NfKNSrsdZ7N3+bFsVLucx0+hGZF8k4UVQiXcCaG9Yo9SrUvQyB0UVag1Ffzv9cqDPreU5PdvubyK8FuRQl6NuzjzPGKbTESHYJetWx6+y8kW68nqi6q2rNCWbIUAf4M7ORjLJZkhhYe69pPK6aZNfKJtvs1bolg7GLsChldOhJIcaXJYTxXyj5WbpcxCUB2J39Jj7bieR6kuZNcj9fJcE8ih8dehmhojButHg/GPL3SeO84IJ3jG7Q527q1Dnmh48ZcJWmYEI68meQCnccp2hMMYlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lg9KNgkwLCUhanN1zxJaZNLlEU505bGTUv7hv//n4Lo=;
 b=gfqX22fdpPXN11GbHgk4DFaGth1H0S6j7wTtOr//ttLFXjlQVgubzu4g1IaA91hcU0mLNSzh0OrfONZey3LqjBOeQrwyMWxO9K/X1HyPG++KM7O5MQm1ENMUdjVSz+C2/L080pRFM/jEWyiGJ4SDjUn3+wOsTO2phDnqF4OOeLm/kKoBKGFf9eOXHq9Hvvsb3tOw8ft6/65mpa50GLblQEVNzqBH3aZfgAa58iERwl/ZmY4BpVZRLegtBXYmk4nRi7nQy1N6tWlUAWlSqj5oRBY3r/vHF8sknidDZg3bpKgpnYZpo3ffLjnZaIXtWKvNko70MGbSiwPURTPlDObHiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by DS7PR11MB8781.namprd11.prod.outlook.com (2603:10b6:8:256::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 14:01:33 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%3]) with mapi id 15.20.9769.014; Thu, 9 Apr 2026
 14:01:33 +0000
Date: Thu, 9 Apr 2026 16:01:15 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Andi Shyti <andi.shyti@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/gem_exec_endless: Use the per-gt
 interface to set frequencies
Message-ID: <hfbjv5h5y5f5kois4c7ma3lxfmikqmmodu2tahy5gpguxd4o2g@rxvkhi4oy3u7>
References: <20260407105212.43821-2-krzysztof.niemiec@intel.com>
 <1394b3dddf8d96243a814aa7c722e6894fd8ee89.camel@linux.intel.com>
 <lebova5umd6qiypupwch4wunqut7symicwhhuf3hxaa3x4p3qa@kuervnvpa4yy>
 <14d365148cf89a71539cd47da3eb8ad4dedfe388.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14d365148cf89a71539cd47da3eb8ad4dedfe388.camel@linux.intel.com>
X-ClientProxiedBy: VI1PR0102CA0099.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::40) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|DS7PR11MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: c64a6f7d-1d12-436c-4252-08de964081db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 0zrTYMIu0Sdu7pyyE2Csoc1PiAez4KiCEgQSMcFutLyLGGC+WezRRaBt75POw4ii0bxmt9WMgUhewKv+jGIdfCnNDrg7PnsYqRBpX7+HfmXoElrmc3O1YVRACXRVmjdVP+vVbRCZX+HNA7SG2+qe1Nybsukrm0DXwt9riYfTxXEVrRwXG4tR7cRSUUIkOtMau+MgJ+rcmW8u6zSF2Yxl8CZOa4H+kpJIKzFcEEW9HiYC7c0XNOQQNGqUoBFlysJ2gzofpdbaIYaCz1d/joLSfmpJ6bxFK/nOp9MpwO6fwQBsy+/xietPnPvVxmvg8A5dR4TBybWTekmBQT0h4Ik6K3Z8N/VcCYZj7Y2FpY9O60OB4GUOfiEjPEiGvY1Vum3fcaL+3wKvzGVgbsbH/DiaF9Y0m8mQjD6Ghf9KFfxaFj6JKMCjkOZRpVD7hhE0aV6AtCSoGgLhGhg1+xfDnPvgJwQqBhqM5YM9Xn7YfxzoiW7AjD4crHDGk/YwM2ZrKC5xQUVotJPpn0TPTFhIqe3i9d0ANoaSug3AO8Fpfb9YAPU4P4bL9TXKQ5KZ1DV2JlQEALHu78v1gfhg9bp2GDvpIh/RmbyNlnNiGMHADsf8VSjnxUO1Wrs+jLA4c5/4UKpZrF2zMYBl5efjb8p8jxQ14cPznzOSssXZtEwS9ZEKOPwyhe4Z08t+jX8ioEW9PNtnF4hSenazBQ9XdtcZhGZ2gMHWMUUxu/2zMshyFsOhuyI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEd3VUI0UGpxQy9RVWFEYjVwUW9SRlNCTjJPdjBIakZEa0lrK2lOS0ZlWWZV?=
 =?utf-8?B?TzJheWhzL1QzQWhtcGtLVmYxYUU1eVN0Q2lZblpldVdaOFdZVU5JY0V3Y1lM?=
 =?utf-8?B?QnY5YS9sVlQ4NEdTc2JXYVdKNXRZQXdsOGxlL0dtb0ZaWGxqQisxOEo2aTdm?=
 =?utf-8?B?RXBaRUIvd2ZXQ1lPZjRkREl5Z3J1WjRBMzBUVXliRkhPUkhib3RScEUyT3BH?=
 =?utf-8?B?c2s2U1ZnSCtIRXc0T2I2ZkZSV3V1NHMxWUxmOURHMHhtdTNZdncvRjFxOHd0?=
 =?utf-8?B?MHBvVk4rYjRNQy9sTHQ0dktpOUwrcmZDcmsvSHlVYVBodVpmVkhZaUR1emVC?=
 =?utf-8?B?V3dObnlETXhzRGthSWxrVzlWUy90cFR3TExZYkxHRDFVdGljOEdwcUZXT2Nv?=
 =?utf-8?B?OXQzZnJrWXZmLzNLbncxNWdjcEdqRFRnR2wrZlUzZzN2M1RHRXU2WWU1Z1Zl?=
 =?utf-8?B?Q0VLY2VISUlSTVR6dy9mWUJFdDFCV2xqSC9TenE4TWNnNUNhakpPcklwZXJP?=
 =?utf-8?B?eGF2aXBIK0tNRDc0VGdscFFCNUY4UmZPckNDZjA3R1p0andqbEtZL0IrLzFo?=
 =?utf-8?B?S0RTclpwMEVlODRhQWFERDgwOEs2anUyai9BUkQvWjN5aEdqRVNiSHNqYkpR?=
 =?utf-8?B?ZjRjaEJNaWluTzVMQjZCM25ZZWhqYVRySC8zbUVZRXlnNys1WmRvdWpicFht?=
 =?utf-8?B?RnJpemdrKytYWEV5anl1c0huUmdRb3Yzci81RStkNGx0Qm9Na3lNRE8xaGxE?=
 =?utf-8?B?UENNazRxUUJ0eFFzU3ZMNTRpNllKU0Q0Ly9qUmRNdzd0R0Y1ekpKWS9EcVNm?=
 =?utf-8?B?MERBSUx1NEFxSVJQQS8xdnRGcXVGYmpuNjJHL0h5OWdkaHUxMjlBRjNRcS9G?=
 =?utf-8?B?bTlkeXhhY0ZBajVTazdaUWpLYlNQOHNwaWFTMXY2dmxJT1MyZlNIT3ZLdXFI?=
 =?utf-8?B?RG5hb0RENlpTanVjc1BSNHBLR0sxTWJiMk0zaDNvcmw5aG8vdEJqMVcvamNy?=
 =?utf-8?B?QUhWWC9KaS9kTTFjRlZ5a3ViWUZpNGg3dnpMM2hQWld5ZyswcnZGd0J6S2xI?=
 =?utf-8?B?UEg5a2lYZERDajlrdU0zaEgyb1NkZlZIaEs2UDI4bjQzQmozenBwdDBqTm4v?=
 =?utf-8?B?OUJ1RnVEdWxQNXZJcHJzSFFtRFc2enR4Tmx1ZVZpMU53bWJzWFVka1BVaEtW?=
 =?utf-8?B?M2N1QWRqcUQ1Z0dwcms5anowbVJZQXlpeTZJcFNaUHg5VzdYTmFpWmhNRCtR?=
 =?utf-8?B?bktXVFBmWU0zUVpJY3BmS09Fa1ZqVmFidHVvRG5oQ0NOYVlCSHFNVy9hcXVT?=
 =?utf-8?B?aE4vSDZaRVNRZlZzcTROVDRuSE1TRHVGY3AwT3VpQTNMdDhDNnkwcW5CbUF1?=
 =?utf-8?B?VDdoTXdQajI2djBLa1RXc0tzd2plcCtsZEFkMmNBUDFGNm45Ui93SU5ZdlBt?=
 =?utf-8?B?WlZ5a3ZLOVN2WTF6SUI3NE5NZDNBMmx5OFEvdDhlKytQbk1HZW5ydjB6R2tr?=
 =?utf-8?B?cXp6UDFBTzhXOFprVGlDLzBQYTllYlpjOTh4eGl6ZEYwaCt1ZC9WNmNMbSsz?=
 =?utf-8?B?b2t1bUNGTnllOFY1dDFOWFpoSk9aeUtxcGxwZmF5QWV0dG9lK0xhTFFrUjBv?=
 =?utf-8?B?b1JLUVJFQ0xDS0VNQTNNZ2gySlN3YVhKOFpHQzZHNnU3MjhWRHBXeGJWV3N4?=
 =?utf-8?B?S3FhZGp5K2E5LzJ0TnhjZWw1d3dOQS84cVIrT01vYlU4ZFV4MDNkbDVQT0wy?=
 =?utf-8?B?TXVURnUwNWFSSFRMODdJeXA0d3YrdXJUZEVQTUZvRDFTaDlBaDNtKzZOeENa?=
 =?utf-8?B?UGRJYlQzdERFbVpOM1RCK3RvOVhRSmtLZUw0eWcwRXVWbUVPOEdHRXFreDZH?=
 =?utf-8?B?eWZSOG01UlRPRjM4QmxjK2R3QkxqUlFSd2NvaE8ySncvaUpzQ2h5TUNGQ0Rh?=
 =?utf-8?B?aDdSN3QvVUtBZ1hEbjc3NnBWS2NJMnJrV0tXbFJHajBEVC9HYzZoTGF6RExw?=
 =?utf-8?B?ZUxRazFGYzBSSzdhL0pTR0tEL1g3YzlKUkRBdCtqeFJkMDFjQXN3SnU4bzBj?=
 =?utf-8?B?UVgvMTA5TFA2dStQSi9BQyt3ZHh4MVZrSE5CdDh0Mmp5ZXkrWXZtT0VsVjJV?=
 =?utf-8?B?cUlKbzVHRkp6RzFxaEc4M1Y4SGwwY0xObzhSeXZobW5IVGhPNzdtc214eW9R?=
 =?utf-8?B?R2xKOFVhb0N5cG9QcHVaKzQ1eGhUVmcySEZ1ZS92Zm5qWmIzOTA4WTlDTXNz?=
 =?utf-8?B?WWVjeVdCRTZRUWh6eTFQdHdYaWovc2F5Q1JMeGJpUU9GdDZkVStiTVNxV2hE?=
 =?utf-8?B?MFRMbExGVkQveHMxMmJYeTQ2ckY4V2ZOTUp2ejZ4Qm5ZdnU1Nkc4cUNTczQy?=
 =?utf-8?Q?mkipI6gT1jOkAfl8=3D?=
X-Exchange-RoutingPolicyChecked: Np0muC1cJ2AJpdfJoIN9FHDz/GVfaKC9FbLWgFzMRPlyEdMo2Gy03inWgnsAp/JS+tekv/xajWt+9sy6ilWgfhG6nL0WmBzzOrOHr21Y50I6mW+uArKnbJZvwG7z7XIm0VxOXSxSGTBF25+OxmktYRC1jCTypja6IyTGnT53TTAOY1hhF44ZKLuPwWnDZHH2whMzTR8/3Ww6QQ1H/LCIg1brFWy/t/DF1HDEt+GCUYi/hnQ7ia/eyNNrTdY3gmqNk6Zc4t6A+FkdN9t9dWx/zRO3mU6fZLDhPceiCcsPluOggpC9C+kqu1wLxnLY73JBzhShvVKJwxhGEp1kEFDrSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c64a6f7d-1d12-436c-4252-08de964081db
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 14:01:33.6568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBC9TxUbulUho8bOhEGP+eXJEc/2dDaYSdLQbR7avvzWE2ufA96DJ7ti250BbYmnhWM1bTnpBkgSLETM89T4XS7QNB915wlEk5DxrX0v30U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8781
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

On 2026-04-09 at 14:28:46 GMT, Janusz Krzysztofik wrote:
> Hi Krzysztof,
> 
> Thanks for explanation.  Based on that ...
> 
> On Thu, 2026-04-09 at 13:46 +0200, Krzysztof Niemiec wrote:
> > On 2026-04-07 at 13:42:20 GMT, Janusz Krzysztofik wrote:
> > > Hi Krzysztof,
> > > 
> > > On Tue, 2026-04-07 at 12:52 +0200, Krzysztof Niemiec wrote:
> > > > The test alters the environment, specifically the gt frequencies, for
> > > > its duration. Using the legacy interface however makes it impossible for
> > > > the pre-test state to be restored due to its limitations in multi-gt
> > > > systems. 
> 
> ... because each gt may accept values from a different range and default to
> a different value that we may want to restore.
> 
> Or something similar.  That won't be too verbose, I believe.

That will work of course, I tried to overcomplicate this for no reason.

Thanks
Krzysztof

> 
> Thanks,
> Janusz
