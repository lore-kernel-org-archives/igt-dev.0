Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC5DC88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3E110E330;
	Wed, 16 Sep 2026 11:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhpMz9uv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D8010E330
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789559120; x=1821095120;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D3icNofeBm4oZTvheNT1vePXxImsTVqrpspx3QD9aCU=;
 b=ZhpMz9uvo4F+IFD4sa0g0BUUVGpUF1qtBJ+lAzCCT3Ml9pvWi+gzy+Hn
 6jaotpspfJ2jn3os30wnAc+TroR0OGx2zxUzbWh2yOk7Nwv/Cxx9JduCf
 ul3Z36DQJwpq4Dva40G9/VY7nn+CjxbA4PNl/Fod6DE4ujgfn9yb8W0V0
 9m3iIw25JP4ysSHWMqJ3XMmz3XUgJKX3VhRUWTqiQB8dm0uAGBE4h8bkX
 eg3xO29/gYWJccv63jlV1U4V2X8rtiEv2Ej0O13drzfigSwFTHvp4eK7h
 AaQE1g0iChqeWB+Sx6Kms1H/5XxBkwCyGwLwGw2xfQ6N3Q4m9Bg6LdJKW w==;
X-CSE-ConnectionGUID: n8UVKIP9QBqondq7WddA3Q==
X-CSE-MsgGUID: J07r4EowTymtH8H5qrV0sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89872824"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89872824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:45:20 -0700
X-CSE-ConnectionGUID: I92E0faWSd+mmrnPfeV4fg==
X-CSE-MsgGUID: Ecrc8wEHQXWZu9+VIWFd0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296808750"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:45:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:45:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 04:45:20 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:45:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkLUTfEAur3WnfX6RYBOIgfSiWdQcTHC6e+rujR2VYK0IJMJv92eCBHmi/LDJzx0t55lSfbEIsVwU/aetD2us1MJgxq6mnhyceeWXA7ue+3P+mdkimFXqZgEj4GECD56auvsHuujsyc67u2206/60h50sZcRvU8LZg7hJZT/yF5w/n1haeWqm3mjkscaDuWps0H10lDO5Bxsja+qLIUxDpc1r41vRIvZWYRPh21pBL98o9uiu0NSaqKZxdW9+GTMpK3XJ5CUT0IWwTNUydd7B2nsfBUNsFcBLg5URsb7PRPLAvoKhJ8/LT59l9r+A/+Jm6BZUEDBhPKdSch5hCGdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pmb4Ji2QdbRwm/z1bZPC02Ff6D46eIMl1Frr6xpRUr4=;
 b=eX3rABczmY1OhzWjeqaexk01fzIqg7xYMmTUGmadE8lr7DtaGSOin6OmMBQSDi7fy/gqnFO9nJOQcaiuluvoqBeO7DMNpTVhcR8e6fsWfzNOkabwoWyF3RZY8tci9MbN1Z1bmFWjGnL6CF4aMqGcagj0kCXSJRcC8XD4f248hjWBFboMpOX4nzlJ/3Nbt2d9neG14vk3lUPm/FNTIEo2QnEU+wBstZ2ubK+WnwBIt4vjkNH9rD9p/z7xSl/BkAO1jxBAbgag/3c32aZbAMWqjfUiwe1ii0AFa9e9VPBeYSqA5VjNmjOrE381e2YzKd7ROTygfIJcfiRmR+0KewBeNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by IA1PR11MB7342.namprd11.prod.outlook.com
 (2603:10b6:208:425::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 11:45:18 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::9323:8d2:64e0:4c7b]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::9323:8d2:64e0:4c7b%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 11:45:18 +0000
Message-ID: <b6656478-fc90-4d43-95fa-ddd6594d9a34@intel.com>
Date: Wed, 16 Sep 2026 13:45:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/3] Dockerfile: bump debian version
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Petri Latvala <adrinael@adrinael.net>
References: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
 <20260916111902.73626-3-kamil.konieczny@linux.intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260916111902.73626-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::18) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|IA1PR11MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e4e3c2-99d4-456a-b83c-08df13e7fafb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: /x50jEzXZFV41h+Nw7Uc7wzzMxiYPREuDGrb5YolqDcglqO1+MAljK9yPrItfpA9IhBtUZYduYvasqloQL8E+87P6nzc8Rz5catXeIMnaFnyttsJAt41FEjlE/3EaezR6UroxNKQCK7/+WKNdGpHjZmp3A422cIwjedCVtEs4XuDyd8RnGz/Ka6CbSCL5HkXlJWEjJXTx/gRqRsQXbUodO7lVfjC7MHRKpMam9tXuIVlKTwcOUV6IYO7G9i/ztZaYkUDM4TgR2TvLCCQe0qk7IKMHvMQY05xZrmZdDyUaR5k8zBRktpbbl5Qax80qZH+ZFBX9NUXsHOtJVCPa7zRmcXsaS7MJYuVKONIj+ygQDHNhLcD+cw1ysNlLY2oKPz4EJ+Skrwy1zBNf9wkSDyzmX3rR6bUh2Dtv61M1QtAnXlHPhvjGZp0fZ72THkHZmJyriIm6Xqk8IXbayJQs4+aVOn1j5zxfQMgtlMxqDEc+RRuk+oppAGFIjeZprL3oMc5sJwsxf7A8XpXz3h1NW6inX2di2Uwm0Hcfdfn9Si/nkV5a+RNARIb+FOoC1VE1hmrbwkIoflYZGMtBJvd3hJw6nuoJVBb/kzn8lacjGZtSEtml+HCplEUnkZoe5PJzMaieXZY2o2xlHrKkQ/23PoDNX2wYUuuGmTkWy+9x1BpOwc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:pl; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlNLM1c3dmJ3VTdxeVl0OCt3cnNQQ3RDaHpWWkdmWUdmWC8wK3B0bURxTnZV?=
 =?utf-8?B?eTc4STJRQm5pZUJHS085c2FYZlhJSklqUG0zamp6NUJGVWFzMzdGUlBMQ1hh?=
 =?utf-8?B?TDl3eWNoRGx6aWhVQXJWWGFiNDNPWTJrUUJwa0RSLytzRUZNeXhzT3ZpRzRN?=
 =?utf-8?B?QVZTTXFlTWlieDZBdnhRaG4wNDFPWjZvUDljY0RXOUIrVXltY1EvclVjbmVS?=
 =?utf-8?B?VDVQSXFPWXdHTnBZUGVVSVZNend1dGMvSi9hOVFXNmluZ3haS1Q1aG1KVWVw?=
 =?utf-8?B?K2l2N2FibzlrRzhjZVM0eVBxeDJ5VXRXRHpZU1BqbjR4SzVkYU0vcjAydmti?=
 =?utf-8?B?WWF1TVpyWi85L2N6RDhzdjhOdStNT0JTN2tUVEN4NUF2NFAwdi8yaWJ0NjNH?=
 =?utf-8?B?NUdnSWNLbEhjUmc0WDBZcWpvY3QrTHQ3dkhMZmJhT0hWbnl2cjdBQm5DY21F?=
 =?utf-8?B?RTMwdDdLdnJHdER1UDllSmJlQ3pESUFoYUR5NUljMFNTZ1hFQTkxRUlzYU1q?=
 =?utf-8?B?YlUrM3ZLS0dKcHZ3dklYcTJsdVVmdzh6WkdoaFEvU0kvRGpXaG8ra0dJRklM?=
 =?utf-8?B?bVR5bVQwb3VZWnJVU2RPWTJpZlgwSDdqRUNKTDB1aW0zRHFVYUZRL3NBZjBo?=
 =?utf-8?B?YkNrMHpGRjBPc3hQdGF3eGNBd3E5bTFiaERhL0M1Y0tYdlp6dDlna3hRYWpK?=
 =?utf-8?B?VWtPdGg2TXdTK3k2eSszMm54dk8zamhwR3lqMVdJTStaQnY4RkxKYW1KRlJs?=
 =?utf-8?B?ekZHNGNHYkI1TFl2TVJ6VlJPMzRnQUU1WDMydXNVd2VmL1JTSDg0dGdBQ1RV?=
 =?utf-8?B?TkUyUEVidGFyRlZldmZZQUsvYUllYXN6QktvdVdTMVZLREpUUFpWT1A0d2hY?=
 =?utf-8?B?Ukpqak9qaWQ4TllXNndJRVc1ZG9OZE51YnozVGJkKzFJOFZicmd1TVpIbVpx?=
 =?utf-8?B?SCtPUHpaak40bHYwWlFMaVBBZXlSaW15UkdsMVJvZUxtazRXQmM4RGNNZ0VD?=
 =?utf-8?B?a3VZVzl3dUVPYTM5V005TjVNelFNS1F2OVlMVlVuYkJ0T24yVDg2TEF1OHdR?=
 =?utf-8?B?dkJIVFlGZHRaWFpodkpWN2NhWmg4enJkQjNBM2QxQ2pua2lsTTFTa3FuODBo?=
 =?utf-8?B?dzNSaVVwbXhYaVBmczU0dTRSZGY3NnozTmx4czRuU0VhTE9obnRwQVNzVXZp?=
 =?utf-8?B?SmJJZnFDKzNGWW1neUMrb3BuamhQVFVLR3pHMjZaQlBSb2ozbW9hNmNLQ3RN?=
 =?utf-8?B?SjB0R0FZVG93SThYZTFVcjFtc2VwdkUzQkc0K0JvSnBNZCtvcVF2NE9tTmNC?=
 =?utf-8?B?ZExUUjhYQ2xaY2N1RktIaG42M09xd0dhcXlHZE1aREd4NGw0QlIxZUJ6aEFM?=
 =?utf-8?B?VVh6dG5LZU1lZytOMkNKYy9Ca0U1ZHV6MytmUTdPUldvSWk0S29TNTROTmZk?=
 =?utf-8?B?Z2RvMFV5dldtRjVRcE5xODlxWHZKbkZUZ3dJLzBMOSszcjducWZtR2JsUlhT?=
 =?utf-8?B?ZktvOVZqQ3ZvT1JWTDFQTGVCaXE5WEFrSlNURkxQL3FzdUY0Nk84VUs5cFJ0?=
 =?utf-8?B?MStNdkRZeHNscUxKWG9xWU54RTQrb3FKRGF6NHBoeU03MzVKNUIrUGp5eDNX?=
 =?utf-8?B?MFdwS25RTHMra2ZQQWNVd2MrMmxxaXY4bXBtd3dzUERXTmRlTGJiVFh5WURt?=
 =?utf-8?B?KzB1bk5JZm5nSTR5bG9pVTRTZGZDTmU0NGhTUVJXMjdlNTNOZkxiSjAydndK?=
 =?utf-8?B?RHo4U2tHNHl1RWR1aEI5eElnVUdTa05GeWRDaUEwcWhSdXFJZ3R3VnJaVERQ?=
 =?utf-8?B?WDJBYnNPdnQxOVRKdldoVkFkejRMQm95Z05lNW5VTnlIRENvUFhLb2Z0alRE?=
 =?utf-8?B?aGZIYjFSZ3I2Q0ZBOTYwWUgyUTlOZmdUY2l5U25PeU83eU9vUzBKR1lZSkJN?=
 =?utf-8?B?MEQwdy91TVhsamFOYmxROEN0dkljZmRkOW5SWlY2TGNaWGlkZGltVlUwWmFQ?=
 =?utf-8?B?Qk0xR0w3TTJManBPNnN4WTF2dVZ2amNmcEhpWWVaV2F1dDg1V25CczJVKzNq?=
 =?utf-8?B?bWZqdUFQVTlUdDEvcnIvZXUrUE10VGd1NFRuRm92NUhTMTk4dUpxdm5DT1pp?=
 =?utf-8?B?UUR1Yzh3Ymp2M0VGWkgycTVTSi9XbGdsNDJkd3hrQzROMzBJam53ZWJtRVJI?=
 =?utf-8?B?bHBBSWd5MFR3OVk3eEhxZGJJVUtNeUNTTHhURXVrZ0g0Nzh5MUtQQlIyZkJI?=
 =?utf-8?B?eFNic2hBRWFmblZ4VmJsb1B1elRBQ2s2bDZxcVlzemVuck11eGF0R2ppRC8v?=
 =?utf-8?B?NlRrK1BCdDFQNVBxem95YXIxbW1yRkEva1E3QmNiK1QrVTVXVnlEUT09?=
X-Exchange-RoutingPolicyChecked: gN3L7EhK55fhWkGx6Qnef8RVjuMJSSbf9Dmx1USf1Di0InpOyxVI28z6gCagSb0BTrxVMpJNR+YLzZH3s1g1OHwfic1vjw49ygx2XPj848rnJsCeKg40gBQ0UT2X2JfjOJsNw++HWwNrBA+EJyC0KYA6E2+gRegIRaDiLSR97F0eDBrUCGIBHMr15qTq6qIdefKx4P0YzyNV1KuPC2aOuxGpl+hdQxQL/O4oBxAgTIv/lVXh6dB1/awJClG8YJPBpoLECt+RU80JrQ1CBqct3ffeK9a44eGUCFI+2h6wAMnK7TI50Zw+vD+N7Wure0dX/PXsWDUDZfWfHPBFGCJqnw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e4e3c2-99d4-456a-b83c-08df13e7fafb
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:45:18.2200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHtULpYtJah7Pr+XboKQY0E+EpPkpc5oz8D/ZwA64Jd7y0t9HdB2Nn/fw28WTOTnki/NKoElxpaN4N6l1vhRTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7342
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

W dniu 16.09.2026 o 13:19, Kamil Konieczny pisze:
> Bullseye is EOL so bump up debian to bookworm.
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
