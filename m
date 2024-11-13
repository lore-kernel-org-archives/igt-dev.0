Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0FCD637D1
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 23:23:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF0D10E763;
	Wed, 13 Nov 2024 23:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYKqDyY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C9C10E763
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 23:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731540212; x=1763076212;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=hWlTUu6Sxt9RNawVdMxz7aAoz12gmFpcni277NPPl7w=;
 b=bYKqDyY48WHpryJIld1nkLv4/KnPro7O5cb/948GlpW76Z3WBnYlPQl2
 mCgh8EkEAlDfjwr6DJ9uVafjPcGn0CS/LJAlGssa+ZTywgmhqVaue1uhU
 ytdGnMIOT6zrcZNTwHaRUfzzi9cu4KefwJRUAlhUJ5mVE4v4kUMJDUlRL
 xjCn+hYdtaLDb2MnVs3/HYg3z9LJ1KGWtuvNTLK5WGSQhJWR0VkI34Cj8
 DRMmiA4IJgAw3ogTAa8hLSbtCRd0QDyP+QbgfUhV1A5WP57ZkhMHNDw1D
 Lc6efe2mwlfe2DuSyL0TbKS4Aop4Wqi//QQqA4TLca9ZJkLkkoCAFrXvV Q==;
X-CSE-ConnectionGUID: 3+zwSGHaQISlNOZ9hf6K6g==
X-CSE-MsgGUID: bawvho7cQWC/M7ngB63xug==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="31697849"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="31697849"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:23:31 -0800
X-CSE-ConnectionGUID: yvpwzEIuQV6Lj1eINrRAVw==
X-CSE-MsgGUID: eKvlGKOCT6GWvDKqQyUFXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="92811335"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 15:23:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 15:23:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 15:23:30 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 15:23:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYP+pe0663pk7QoDXPDbZTWF6O9t9/EG3IbC2ySwcHINLK2PYuMwuiedV3f0hW3Kely0gNu9rVswjQ0V5xwU1MyOkqItzmAwI3HIcOvT38NbCS+ZsOjfyG5xucZCs9bGg0yYogQHE0HVuwu4Dp/w0H1xtP2QE7Hgtgq+9LZVkwaLthu1H0FJqnluXXt1KNm7Yqqq72PMwt/V6G7QIMH5fCpOMpk/mtyESkmem4kR7b1vYshDPPTAa7Kfwrv6xME0xL1/VOIX3jdgm0i/1mfqj7bbhovDhfHaHgVfVUciuFnrYZyFrNqc7zYnugJ42KqcSKJWMJwbNtOYcUUMZGZvvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWlTUu6Sxt9RNawVdMxz7aAoz12gmFpcni277NPPl7w=;
 b=hSTWTeojxW3FowZmg9nVYdysguxG2DzI3OfN0nh67Jmciet/ERTPcytYdsu+YreLajEnbiuStXIdsi6DPrsAUifB90xd66ImGQXypbXJ9nRV4vML2QbEoZn7uu6USQ58PB50ZHv6U4vRJh2gW+NboVdcUWFbqGDtYWJ24PdBovm1Pfd13ZqHQ4jKta+m5lmM5FaPaezSnT5BlnCp69UaCzipCCyVgCCoVHBj9fGMNE2g6yIuKAP76styaG9N+wP4xGSirQYDw3K8yWhA5cDVD8wcAEoCLw9hcNmN8hBb7h+keEneKoIUz0ygEtVtq4gX7u+61jy1Zpbu1V/3o3jaPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH0PR11MB8192.namprd11.prod.outlook.com (2603:10b6:610:191::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 23:23:28 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%6]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 23:23:28 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 1/1] tests/intel/xe_exec_capture: Add
 xe_exec_capture test
Thread-Topic: [PATCH i-g-t v4 1/1] tests/intel/xe_exec_capture: Add
 xe_exec_capture test
Thread-Index: AQHbJKAwRZeOQB+rLUSti19LYcdEBbK096gAgAEFKwA=
Date: Wed, 13 Nov 2024 23:23:28 +0000
Message-ID: <97752c08c87631560b98dda96e560bbd14f14ae0.camel@intel.com>
References: <20241022163324.383145-1-zhanjun.dong@intel.com>
 <20241022163324.383145-2-zhanjun.dong@intel.com>
 <aa2b9b6f3286a4d150b4bc3f2cd18a6b87a9e327.camel@intel.com>
In-Reply-To: <aa2b9b6f3286a4d150b4bc3f2cd18a6b87a9e327.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH0PR11MB8192:EE_
x-ms-office365-filtering-correlation-id: dc371387-2999-4246-eb13-08dd043a2e04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aGVVMVRsdmsyUkZIN2JnWHloT1VHODlnejROM3oyUU1FcnV5Skhpd2FPU3NQ?=
 =?utf-8?B?SjVqb0lrbWNJNEkxTnByL2dSM1o4Zjh5WjN0MjFzUzFYUjg2TkhyV0FWNDFE?=
 =?utf-8?B?Ym5rbGw2RmwvM211UG92dFpHSzlEMmxsTEFWbEduaS9XUmpwVUw2a1I2L0F5?=
 =?utf-8?B?SnRjWURsUTBicnBZSmU0VVRLeGdJbHBEUFY5aGJqUm5IdzYvc3hTS1NsNmEv?=
 =?utf-8?B?K0IveFV6V3Qya1JUbllwSFBIcXNZVXdUcjJZbm1IWWNLK2d5UkZTWTBiRzBK?=
 =?utf-8?B?NDlGWHc2WFlySUpjakhrUHphcTgxUXdhbVRzYkZxVUp6eVhLVnJxNzRsdkZ2?=
 =?utf-8?B?L2Y1Y1pzQ1JKd2ZOUHpVOWVVSE0wTjJVaHRzZzlIQ25EUUk4T3JOdksyN0lL?=
 =?utf-8?B?NkJwVUZKMVNYb0VxWmpxZTVsSzYrRnVOTHc3Z1JSMnFyZWg2bWdJVm44ak5Y?=
 =?utf-8?B?cDBQSW5PSmU2Skd0Q3Z3dWh1U09HWUJlYzdOcWdNWkgyRXk5T0lUZUEzYlox?=
 =?utf-8?B?RTJleFhodWJicGJyTzJ6dHZYNGg2d1dUWE5ZVG1tVTh0TlJtcmNMTGI0TFNQ?=
 =?utf-8?B?NEd0SUoxNzgvWHk2Tk9XSjBOb0NGSnZCNGNmOStUVHZLSVJaaW9NbUZQWWkx?=
 =?utf-8?B?YXUydnMxSnRuNVg0ME8rbkVRenR6L1Q0RGJGUHJzV1Yxbmt5Z09lb0ZyRVlF?=
 =?utf-8?B?VVNhakxqbDFFTzgvUkowOUdCVUtpVEJkcHp3eDRuNlBiaWlFaFp3dDhOVGlL?=
 =?utf-8?B?TnRvWE5ZWjltUlBvYmpadm9oNW4wMFd4ZzVxQjVpS2g2dFhJU2V3dUNCbStw?=
 =?utf-8?B?QVFydXBsRGpKSHltS3k1WGRxQTlvSHRLVERYTmVWWW1HMlVCeHcrT3I3YVFo?=
 =?utf-8?B?cmdGdkNoWml2bC93Q3RPeVVRMExPWmsrODFqQ2RWdjhFczJTVTF4VFloOFZh?=
 =?utf-8?B?YlJrUE9pQk9uditOcWFZY25DNVFNVXhUZTJmQmJFSTRLMVIvd3krTFJXRlQ1?=
 =?utf-8?B?NTJkYTk3eHAyVzNySXNQbys4bzN1SnYzSmFpVysxa2hmUGU4MEhMS1gvL0pl?=
 =?utf-8?B?WFNXcnpjbjhCL1h4akN4ZmUrSGVmVUp5NkZBL1hYOHZuZVl1dUJiT0E5MWlB?=
 =?utf-8?B?K1NEd2xCNTVXaERGSm5kdm0zeHZYd3lPNzI2TmZGYklkcDFmekV3OTlEVjZE?=
 =?utf-8?B?Tkl5WE5uUFVRYnNtTUxjTmVWYlNYZmN0bGtibXAwLzVtUUVuYkU3YlkrV1pC?=
 =?utf-8?B?OHFaaTNCSk4yZnZybndkU1piRjFJdzBmcWkzTkdWM2ZjU2ttRUhvbUtHaU14?=
 =?utf-8?B?bmhGVy8rMkpjcDJGdlNsSjRBZ3ZadUF3dU9ZNFQvWjJQZUFudHh4cEcxL1NQ?=
 =?utf-8?B?RmdpTE5sRHhwN3NzRFVycUtNdFMwblRKNmI1dExyYi9jb3lkamNvMDArTW1U?=
 =?utf-8?B?Y1hvam1WRDVVNkVGTnIram8vT0lGTkJaT2JEcjYyWHozaEhUTU04M0lhaG1k?=
 =?utf-8?B?cENyN2xmVmxMcDNKbkN6bFQrK2V0ZmpMaWgvaDc5S3FDUm40aEZJVGs0WEwz?=
 =?utf-8?B?Smo5MWlGdVRCbWNVekYvNjlZZzVSeEtseVZkKzBvWlliQmc0UGxYMXdIY2dL?=
 =?utf-8?B?ajlLZ0tJR0dseWNONmluOXEzQzcvdmM3NUp4MFZ6enlIQzZ4Y0VibzBLNS9y?=
 =?utf-8?B?clk2UzN6WUkvYXE4b0ZzcDhRcVNuaEZnbU1WTHVEMW5jcW5HQUhZYzBaTWlm?=
 =?utf-8?B?U3dSYmd1QnNhbWxnT0Q5eXhudlR5R3dOTW5kVU5oUFArcDhxdFlUUWxOanM2?=
 =?utf-8?Q?l1obVPCobdjcXXF3H5+kp6M3ymeu55h9m7WCE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXlxYllqTEtaSTlSYWk2V1V4ZXhDdzk3OGxPdS94czl6RnZORm9vRVZVZXpS?=
 =?utf-8?B?YTdqRzVJbUd2bHBXcTBoSjlVYndvNWNVb2hQeWRGMHJIWUNPQ3ZvMTVLajQx?=
 =?utf-8?B?WU9VSXhTS01DSWJ0Ny8wUkc3SytZNFlnYlpKRDl2ZG5FZnU2MFA2Sm5zdjl6?=
 =?utf-8?B?V2F0ZlRydzYyM3VJQmx1cW5RaWI1ZFhiemhzazAwUXlPd0VSZHRlSllQWXBE?=
 =?utf-8?B?UVJvV0d2NERRU04rd3QxVVhlRlZMQjVzZWw2d1l2Y1AycFo0ZUhvRDJSb0hL?=
 =?utf-8?B?ZGRLbm1FbSt0Rjc2a2Q5T3d0VDlaLytSL29kMDN4bDN6dWlGZmhpZUhIT2VS?=
 =?utf-8?B?QUlrT0U2cUV6VGxEZWJ0Ym1YWGM1Y2F5dGUzRWk4NDB0RjduSGthbUd2ZkJG?=
 =?utf-8?B?TG9manBhbWxtamJRS3ZiZ25nMDZqUTRxMkIzZDNnZFJjQm82RGhEYXFBSktG?=
 =?utf-8?B?bXhjb0RPbFpZQnBrQ2RNUkNkS0xwbE1UN0V2WmRUQndxZ1dydTk0VzZURjJo?=
 =?utf-8?B?SWp6S0p0dGt4SFUyQnltVFE4WGxZRXNMcW5mZmZEMkZ4cnpXQlEwQWZVVGJX?=
 =?utf-8?B?RUFDTExHWVQ5eEt2akY3OXZOYVNzM0kxcUlUdkxCbDU5eVhkQlNBYzFQMVA2?=
 =?utf-8?B?eWF5VDg5NnpBbHlwZWw2UUlmbnlvY3JXNTBuVE5WUnZLdE9zOXRVUWpkcHZL?=
 =?utf-8?B?TlZ3VkMrU0hZQ1oxYXlVYW1hVU9NN1QvTHNmWHhjQXdOeC9mcFJaeHh6N0la?=
 =?utf-8?B?S0RSS2RvMy9Ld041cTRhckxIdzkzU21HSndxT0x6a2E5Ynd3cUI4eFdpbmNV?=
 =?utf-8?B?UkpyRzNndlRJc2M5cXArYXhXbW9KZzkxWk5QL0ZqU1d2SWtnUFc0TGdQWVZj?=
 =?utf-8?B?UmptbVc2UGJYRGRya2lzSWRoZHpjSXlFNVYwNG9PRE9EWDFTTDlZS2pEbHZN?=
 =?utf-8?B?NVZSeU9GRXMxaXJldUJKSFlRRGNEU3NMRkhTTkZGKzhvblpjWlIyUkZxZTd2?=
 =?utf-8?B?WkJESkpJYisycTVGMGtyZ21sRFduUmk3eFR5Z1dQUUtnWk5GTmVRSldRUGtP?=
 =?utf-8?B?ellGeDZZc2IwR0hTQ0RtK0FGbWt0WDU2SE9CbVdrRjVueWFnMTdsZE1zWXFa?=
 =?utf-8?B?bC9lQVh5d2V2cEw4Qkk1OXB3YmI1dzFsTmt3dWdRd1ZQckg2ZjZoaG9nL0Vl?=
 =?utf-8?B?MjV4bUdTZ0EwZFJkNlhRU0Q2RTVXUjJOR290Nm96RXAwZENuSVRjVlRvMkEv?=
 =?utf-8?B?bDV0aTRPUThYRUdrQm91andzVWIzakY5c2RMY2VQc1BsQnE0L2doVWRGc1Aw?=
 =?utf-8?B?UjFaT05GdlhwNkdENlpYazh5NGsyTVpHaEdTbEY4RU41TjhTQkVnN3ZGa2or?=
 =?utf-8?B?YkN5Q2ljYU93RzBzaDlUOXVDbVhQRVN2N2Vrbm1rdXhZSlZJTFkwUWxtd3oz?=
 =?utf-8?B?cDQxOHpkQk9CWTV5bGVKcTBFNHA2aU0razF6ZzA1WkEySFphSU5DYWtSajli?=
 =?utf-8?B?dkFsVWhBVWdJeU5JVDhoK0lzZGdwRmxvZWZ5Z0hMMWhLQlJ0WjlaakxuZTgw?=
 =?utf-8?B?RFNqbUMxVVVIcy9pdEtrZWxxdldwTEo2Z2Fza1pDZ0xvSlJIZ0I4YkdNajRz?=
 =?utf-8?B?VXpzVFNLS3lZV3QydHNxQmVXSmNpWEpIWnZPM2dScFVUeWFwSW5CVHhsUi96?=
 =?utf-8?B?cUU0aHFCRmpXUnZ3ME1BQ2N6MURyUm5XcDBmRkNGNFkvRjBUa3VIY3JaUWlv?=
 =?utf-8?B?RnhOMEVsZjh2eTMyVytaQ0RBVEdESk1PckxjYkh3a1hEb205bmhpZEZxU2ti?=
 =?utf-8?B?TTV0QkNpK3c3Q05FM0JlV1lUZ0dPamdReEpGc0ZzWGpSMmdvOExwZzdJMEdl?=
 =?utf-8?B?NnhDc0FuUmY4Nk0yNW5JR29VNFVTd2RSSlROLzZxcTQ1NTRvclJOaFMvQ3R2?=
 =?utf-8?B?V3RJWndXc285WEMxbzAyMXBvYXVDRjI1RlJCRnhWVHAzbE45Y2tBTkpXck8w?=
 =?utf-8?B?cURGK3pyNXA0UjllQzQ5TTVlUzJPNEhPSWtjSzNvVGdkcmVVVEhUdnZJalpw?=
 =?utf-8?B?SVlkNHcrSlF1OXMzUk1hdkRkeDMxK0FZU254QXNlYW00T211b0oxMlRpeDVz?=
 =?utf-8?B?RVVhRTRyeUE0NUpUQjhueDVGbnFNMjlkT0Exenk3MUluVHdDUWxrWWVkVnkv?=
 =?utf-8?Q?Z+PK4quMdFYlHc+SoNbgyw0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1898DA2EC143F48B770FB07D062C5CC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc371387-2999-4246-eb13-08dd043a2e04
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 23:23:28.2726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IzjueidakbJO5DVWtBQBmNJBJoF8PDo4dpwCE7s4AfH9M7kE3dhn08Zo1ejbtaL54wLYcOANUz5JUEoiyHwDvpZptHF2O68kI+dJ7GVuNx5EHpjYzorV8qYPMutbSOg1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8192
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

T24gVHVlLCAyMDI0LTExLTEyIGF0IDIzOjQ4IC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBPbiBUdWUsIDIwMjQtMTAtMjIgYXQgMDk6MzMgLTA3MDAsIFpoYW5qdW4g
RG9uZyB3cm90ZToNCj4gPiBUZXN0IHdpdGggR3VDIHJlc2V0LCBjaGVjayBpZiBkZXZjb3JlZHVt
cCByZWdpc3RlciBkdW1wIGlzIHdpdGhpbiB0aGUNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgc3luY1swXS5mbGFncyAmPSB+RFJNX1hFX1NZTkNfRkxBR19TSUdOQUw7DQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN5bmNbMV0uZmxhZ3MgfD0gRFJNX1hFX1NZ
TkNfRkxBR19TSUdOQUw7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN5bmNb
MV0uaGFuZGxlID0gc3luY29ianNbZV07DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBleGVjLmV4ZWNfcXVldWVfaWQgPSBleGVjX3F1ZXVlc1tlXTsNCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXhlYy5hZGRyZXNzID0gZXhlY19hZGRyOw0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZSAhPSBpKQ0KPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3luY29ial9yZXNldChmZCwg
JnN5bmNvYmpzW2VdLCAxKTsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVf
ZXhlYyhmZCwgJmV4ZWMpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoH0NCj4gYWxhbjogc28gdGhpcyBj
b2RlIGlzIG5ldyB0byBtZSAtIHNvIHRvIGhlbHAgbWUgdW5kZXJzdGFuZCwgY2FuIHlvdSBleHBs
YWluDQo+IGlmIGkgZ290IHRoaXMgcmlnaHQgaW4gdGVybXMgb2Ygd2hhdCBhYm92ZSBsb29wIGFu
ZCBiZWxvdyBzeW5jLXdhaXRzIGFyZSBkb2luZz86DQo+IDEuIHNvIGUgc2VuZCBuX2V4ZWNzIG51
bWJlciBvZiBiYXRjaGVzIGFjcm9zcyBuX2V4ZWNfcXVldWVzIG51bWJlciBvZiBxdWV1ZXMgKG9u
IHRoZSBzYW1lIGVuZ2luZSkNCj4gMi4gdGhlbiwgYmVsb3csIHdlIHdhaXQgb24gZWFjaCBvbmUg
b2YgdGhvc2UgYmF0Y2hlcyB0byBzdGFydC7CoA0KPiAzLiBBbmQgZmluYWxseSB3ZSB3YWl0IGZv
ciB0aGUgdm0gdG8gdW5iaW5kPw0KPiANCj4gSG93ZXZlciwgaSBub3RpY2UgZnJvbSB0aGUgY2Fs
bGVyIHRoYXQgeW91IGFyZSBvbmx5IGRvaW5nIGNvdW50IGJhdGNoIG9mIG9uZSBhbmQgcXVldWUg
Y291bnQgb2Ygb25lLg0KPiBUaGF0IHNhaWQsIGkgYW0ga2luZGEgd29uZGVyaW5nIHRoYXQgaWYg
dGhlIGJhdGNoIGJ1ZmZlciBpcyBkb2luZyBhIHNwaW5uZXIsIGFuZCBpZiB0aGlzIGlndA0KPiB0
ZXN0IGNvdWxlIHBvdGVudGlhbGx5IGJlIHJ1bm5pbmcgYWxvbmUgd2l0aG91dCBhbnkgb3RoZXIg
d29ya2xvYWRzLCB0aGVuIGhvdyB3b3VsZCBhIHJlc2V0IGJlDQo+IHRyaWdnZXJlZD8gaSB0aG91
Z2h0IGlmIHdlIG9ubHkgaGF2ZSAxIHdvcmtsb2FkIHJ1bm5pbmcgd2l0aCBub3RoaW5nIGVsc2Ug
YmVpbmcgcXVldWVkLCB0aGVuDQo+IHRoZSBHdUMgd29udCBoYXZlIGEgcmVhc29uIHRvIHByZWVt
cHQgdGhlIHdvcmsuIEkgYWxzbyB0aG91Z2h0IHdlIGRvbnQgaGF2ZSBoZWFydGJlYXQgaW4geGUu
Li4NCj4gYW0gaSBtaXN0YWtlbj8gaG93IGRvIHdlIGd1YXJhbnRlZSB0aGF0IGFuIGVuZ2luZSBy
ZXNldCBvY2N1cnM/DQo+IA0KPiBsZXRzIGNvbm5lY3Qgb2ZmbGluZSBhcyBpIGFtIGEgYml0IGxv
c3QgaW4gc29tZSBvZiB0aGVzZSBjb2Rlcy4NCmFsYW46IGFzIHBlciBvZmZsaW5lIGZvbGxvdyB1
cCBhbmQgYWZ0ZXIgY29uc3VsdGluZyBvdGhlcnMsIHdlIGtub3cgbm93IHRoYXQgdGhlIHJlYXNv
bg0KdGhpcyBiYXRjaCBkb2VzIGFjdHVhbGx5IGdldCByZXNldCBkZXNwaXRlIGJlaW5nIHRoZSBv
bmx5IGJhdGNoIG9mIHRoZSBvbmx5IHF1ZXVlIG9mIHRoZQ0Kb25seSBlbmdpbmUgcnVubmluZyBh
dCB0aGUgbW9tZW50IChoZXJlIGluIHRoaXMgbGluZSBvZiBjb2RlKSBmb3IgdGhlIGVudGlyZSBj
YXJkLg0Kc28gaXRzIHRoZSBkcm0gc3Vic3lzdGVtcyBzY2hlZHVsZXIgdGhhdCBoYXMgYSB0aW1l
b3V0IGFuZCB3aWxsIHJlcXVlcyB0aGUgam9iIHRvIGJlDQpraWxsZWQgZHVlIHRvIHRpbWVvdXQg
aWYgbm90IGRvbmUgd2l0aGluIHNvbWUgdGltZS4gV2UgbmVlZCB0byBmb2xsb3cgdXAgaWYgdGhl
cmUgaXMgYSB3YXkNCnRvIGNvbmZpZ3VyZSB3aGF0IHRoaXMgdGltZW91dCBpcyBiZWNhdXNlIHdl
IGRvbnQgd2FudCBvdXIgdGVzdCB0byBiZSBhdCB0aGUgbWVyY3kgb2YNCmRpZmZlcmVudCBkaXN0
cm8ncyBvciBjdXN0b21lciBzeXN0ZW1zIHRoYXQgbWF5IGhhdmUgZGlmZmVyZW50IHRpbWVvdXRz
IG1ha2luZyBvdXINCnRlc3QgZXhlY3V0aW9uIGluY29uc2lzdGVudC4gSSBhc3N1bWUgdGhlIGZp
cnN0IHNldCBvZiBzeW5jb2JqLXdhaXRzIGd1YXJhbnRlZSB0aGF0DQp0aGUgdGFzayBoYXMgc3Rh
cnRlZCwgdGh1cyB3ZSBjYW4gZXZlbiBwdXQgYSB2ZXJ5IHNob3J0IHRpbWVvdXQgbGlrZSBqdXN0
IG9uZSBzZWNvbmQNCnNpbmNlIGl0IGlzIGFmdGVyIGFsbCBqdXN0IHNwaW5uZXIgKGxvb3Bpbmcg
InN0YXJkIGJhdGNoLCBzdG9yZS1kd29yZCIgZ28gYWdhaW4pLg0KDQo+ID4gKw0KPiA+ICvCoMKg
wqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBuX2V4ZWNfcXVldWVzICYmIG5fZXhlY3M7IGkrKykN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydChzeW5jb2JqX3dh
aXQoZmQsICZzeW5jb2Jqc1tpXSwgMSwgSU5UNjRfTUFYLCAwLA0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBOVUxMKSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydChzeW5jb2JqX3dh
aXQoZmQsICZzeW5jWzBdLmhhbmRsZSwgMSwgSU5UNjRfTUFYLCAwLCBOVUxMKSk7DQo+ID4gKw0K
PiA+ICvCoMKgwqDCoMKgwqDCoHN5bmNbMF0uZmxhZ3MgfD0gRFJNX1hFX1NZTkNfRkxBR19TSUdO
QUw7DQo+ID4gK8KgwqDCoMKgwqDCoMKgeGVfdm1fdW5iaW5kX2FzeW5jKGZkLCB2bSwgMCwgMCwg
YWRkciwgYm9fc2l6ZSwgc3luYywgMSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydChz
eW5jb2JqX3dhaXQoZmQsICZzeW5jWzBdLmhhbmRsZSwgMSwgSU5UNjRfTUFYLCAwLCBOVUxMKSk7
DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHN5bmNvYmpfZGVzdHJveShmZCwgc3luY1swXS5o
YW5kbGUpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBuX2V4ZWNfcXVldWVz
OyBpKyspIHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3luY29ial9kZXN0
cm95KGZkLCBzeW5jb2Jqc1tpXSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHhlX2V4ZWNfcXVldWVfZGVzdHJveShmZCwgZXhlY19xdWV1ZXNbaV0pOw0KPiA+ICvCoMKgwqDC
oMKgwqDCoH0NCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgbXVubWFwKGRhdGEsIGJvX3NpemUp
Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoGdlbV9jbG9zZShmZCwgYm8pOw0KPiA+ICvCoMKgwqDCoMKg
wqDCoHhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsNCj4gPiArfQ0KPiA+ICsNCg0K
