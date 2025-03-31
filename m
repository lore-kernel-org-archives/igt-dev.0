Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F866C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 10:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D66110E118;
	Mon, 31 Mar 2025 10:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brtUkTEu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4047F10E118
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 10:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743418632; x=1774954632;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=c14UMNMD9VzHD9c6jwLasiUuc42YkiUUhKF2nI9CXK4=;
 b=brtUkTEuelaUm1yoe0CjHoXYBRkyjOrUWMXp//SBoKUOMq6l16OhzRVN
 ZevSy0ujjR+xKK/nUmb1977DLyYIKIdlYBhBVj+7/+bUwz+WgO6n93Uyo
 Rl0fUIyvd/ZSIBM8bOyyEEBwrNgTRGUmIn/PwmYlRmEDOQvFmX9w2sJGH
 cOuM8YJtSpL+wPRC+Gqv3wlJHvbqy6SIgwNagt3G/SCW0cl7nNB8tE0C6
 EBUeH/zKrsGrgC5NXOsvbXxP8wR0oiqgMlNzbuUr/fLRj/2JAxGVv/X63
 zGPml4yiblp+xVznGO4pw03cQtTKGG/6c3mZTlqZQfnEBBjazbxrciGr9 Q==;
X-CSE-ConnectionGUID: keaV1lgtSyaPDwVIpJuxPA==
X-CSE-MsgGUID: cBzwF8VsRBug4k08W2c5hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="43951284"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="43951284"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:56:59 -0700
X-CSE-ConnectionGUID: DnBhfkPrTYCsRG+NMthrbQ==
X-CSE-MsgGUID: PBXTNI1qQYusdK68UKVGWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="126859271"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:56:58 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 31 Mar 2025 03:56:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 31 Mar 2025 03:56:57 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 03:56:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzIRQ81a2rdvlMyMevtQG8s1sp4emjbLAVJjMHo8J1t32NJK+/N0phIDkHV2n/YbQoU+DEr28ucHnzdeLAnpvyRmnMXMvRSIe0K0W4/8xdzpKGXrnzoHAhrE7N5KjumgaVGybctcZJXa277l/5trG1SsVFNsehVHnFfvScgnrf5B+A+8pVIHuZLFNGY23ghEsiWIaBaYJuFj0PG4hFmB/BuhOyTu2ws0XLBxaDlfdoC+LVcbr3NPtcpbWEf/TW8sQ3ndn9RpaSiHcasa/7IXxYU9fdKsSq3sebMxpykQD8CL4XMCTaQAH9pn6WIDtiwsh28eeqVbVK0d6BOUtqQhYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Q/jsWAQ/kHSCp2se/o1/AdimiW8+M63WG9v7vqlUcU=;
 b=OqdrJv9HVF2RH2h2DihtAFJD3IkefMbt4g1sUboEDQeSLJiWwBOwwOJ9SQX+gG95F3xAeko4qwCXuPVQtXHd/JKTDGjtkIAMUnz1wDz23YxBe9h8oZf2JnGqNnIwqfOWEDS+Wpp5zTsqdJ8vcG0bwxwnmrwTvcI0DxzOq28o0fbWhSH/dWd0/o1iQHDN3LXZ3Mf3H080Ebgtc47bnHE9mwDrQhMAxAKFc28hmHHjkEonOdm2Wsg6YyEhzMmQzgGKtnGRHaJtrkNUNBjsKxnPCEWiGRj6AACZiZrYEyNwl/uA+1uua4mSsQDzIw+gy7Kzx9V3L24zA2thJpMZcoL8xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by BL1PR11MB6028.namprd11.prod.outlook.com (2603:10b6:208:393::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Mon, 31 Mar
 2025 10:56:14 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 10:56:13 +0000
Message-ID: <be3e69b9-ac16-4f69-a6f5-7172eade29a1@intel.com>
Date: Mon, 31 Mar 2025 12:56:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/2] CONTRIBUTING: Add guide about igt libraries
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250327153139.37746-1-kamil.konieczny@linux.intel.com>
 <20250327153139.37746-3-kamil.konieczny@linux.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250327153139.37746-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|BL1PR11MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f44ea15-1e5c-412f-08b5-08dd7042a784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TW85VlF6WWl6SWJkVHNPM2NhQmlma3h1aVRjZUVlendSZmQ0WXk5Ym1OUXRj?=
 =?utf-8?B?ZjJuNEpLamx5MUxHQUJnSm9lM1hORlc0WTNOOVcya3JIeFQ5d1VkMk5SNzVp?=
 =?utf-8?B?YlF4TjB1V3pJbytLcUFJK2NwOGN0bWVQdi9SeU9iY2VOc1FGUnF4VDlhcWhX?=
 =?utf-8?B?UjU4ODB3RWJ4cnViS3FnSndBN2ZPTkxDV1pua3RpZGxlZ0ZCZTRGMVNiU0cw?=
 =?utf-8?B?TnBLTW01ZTdQSW9sNUh5K0FRdmR0Z012NWZiRFRwZ1h5MnZNNjRWcmwreE1R?=
 =?utf-8?B?SURFRk9oVk03QTBaV201a0NlT2UwcGZCTDZtR1FaTXp4ODV2Z3pQZEFaUkg1?=
 =?utf-8?B?b0R3RzlhejZFWGxDUzRVVU1ZcEQxK0lqWGh5KzFDRzYrMzl4YUYxWVZZampm?=
 =?utf-8?B?RVlZL2hNcUpUeVhRSGw5T045VFlYb1pKMkp6U0lpQUVUZnJKajhsUGVRWFBC?=
 =?utf-8?B?aUwrNDdKV3U4b1hsV3Izakh6ZVh2ZTRQWnVuek9nRDJQMXZiTXFibmFWc3NS?=
 =?utf-8?B?SkEwVFNWbDRYMkJhTDRIQXk2WHZkbkJXd0M4ZUJiWWtsbTNRejdrVVJtS000?=
 =?utf-8?B?UFpla0ZUSkcrcEpJbTkya20zZUhXRFlCYkhEK1VyU3hwRGxNT3Q3ZVlZN1gx?=
 =?utf-8?B?OStFemt0SWVsTnVLT1NTU3NGZ1p5UzNkRi82dEg3dkQ1b3EzeXQ3RTdtM3By?=
 =?utf-8?B?dXkvVmNhcFNjMUo0WXI0ZjlFT3RNeDBzempRUkpTcURHbWk1TnovQUJZRWJy?=
 =?utf-8?B?alY5MWx2aVdWTEpzbng4b294eElBcVFITGt4TjZYQXF3dkpxWUE5bHNucUJo?=
 =?utf-8?B?cUsxSmpNamgrUEdoQnhkem5MbzVXV1RoTVZhS2tVVDcwZjVvWjZ3V1FMZDZX?=
 =?utf-8?B?V0tRK3ZSTDBRV2EwQlhXaUVNUkFIZDN3VUlHRjJteklYRXdMWGR2anE0Vzhy?=
 =?utf-8?B?R2ZCM3hJN0EwSjFiTis0VEhXVjBVMDZpdzkzbUFUU3lFb2pVOEFxWG9HMGFU?=
 =?utf-8?B?RENuZ1k1N1F4VndYSEVsQ0lFQ3ZBcVl3WW9mNGR4WHZCRXR6bkp1eE1GbFVy?=
 =?utf-8?B?MXMxOE9NcjU0aTBzZDNUK2dTVm9Rd05mL25lQ3lkRWNVR0J5enkydmJDWVVI?=
 =?utf-8?B?V3FWUzd4TlFMdVFCWGVDZkd1bE84cmFLS2xqMjRIeGx2Wk9PWjVHTUJYaEE4?=
 =?utf-8?B?U21acnFSTFNGclhCUTZpSlVxcXI2VGZ0aTFTcGdrT3VLeGpDNk1vRmpqR25J?=
 =?utf-8?B?ZlZBQkZkUUhiQTRJbG1qelZtQVhId2UzSFIyVVB2Ly9ibjdDd2ZvQWJxd2F5?=
 =?utf-8?B?dEl1WnEvR3k0clArUW03OG44dUpHVWg3dTgwZUM5NDU4Q1NNRjcya1ZFb0JZ?=
 =?utf-8?B?b0dtNzFBVEZpN0xHbVBpY2NMRi9zZ3ZOdnFiSUk3clJiOW1jN3pCMlRhanQ0?=
 =?utf-8?B?ZVhibzVzZUFEY1BvcS9pZS9GTlhsc3NGeGpFN1dJL0xzbUpSeHI2K0NoRDF4?=
 =?utf-8?B?QWo4OGZFTnN0TkY3V1VkeHk0SCtmbVBzdkw3bnNLN1QxNDdmLzNZb2cvRzlM?=
 =?utf-8?B?RURORjVkRXpsTVdYc0xyUjd5U3B2VDhhVFNLdHNhRUozZERPME15aVp5VGVK?=
 =?utf-8?B?U2hVRlBXbnl6NVZ2dEpOckErdmplUm1QQ0liY0RmUFdRbGNIdm9QanFiZEFn?=
 =?utf-8?B?ZklORWk3UzFab1Zpc09GTEI4OEx5NVVLd25yUEF4cEJHNUJlZEpGL2JEWTc4?=
 =?utf-8?B?TmNaK04wU3NDdnh4VG9BMUM5VzhkSVlFREZSeVR6TjlXUVM1OGtaT2VnWWdJ?=
 =?utf-8?B?c05FN1dGeFBNa0tiT1JYUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0hsdmpHRkl4QWN5d2k1T3QvQW9WelpZMkRwaWdJNy9QdzUzc2Z4K0p4VVhn?=
 =?utf-8?B?bXk4LzlVaVp2bjRwR3prcUNrVUlxbkRkR1U3Q2QzWTl5S1ZjZm9MeUZtS09M?=
 =?utf-8?B?Y2gyMmFhcU1nc0pLMDZzLzZwbkFKU0RJL3V0cXh5RXFiMS9Cd0NWTlNIL1Y4?=
 =?utf-8?B?a2JESkRGWlBMN041VTJaVmNhSXdMcGpJakRiTWJZcFFKSmNxS3MyaUNHRm04?=
 =?utf-8?B?SXhUYW1sNjJvTGlUWGNPc3N1aEhBOG13QlFsSk45VEplTDltdmNyNmJ1M2ZT?=
 =?utf-8?B?NkxCNGIxR2duNFVhWGFSRHBvZmVhVnViMGlRSTlyaEMyRmRuRWxOc0RjU2ZU?=
 =?utf-8?B?VmJZL1RmZ25pVEhOYmswaUJEeGI1eVk1UFVka3JJc3lJbjdKT3Z0Q293L05k?=
 =?utf-8?B?WVhKM25xYzRSR0Z0NzNQT1QzNWd2R2Q0YkZKSU1SZHJZWVpoZ2hzNmpXMStK?=
 =?utf-8?B?ZDZPRlRDYm5wOVdXVC9TQmlHOEx6QUZhV0loeUhNSmU3M3dubjhYaThtOTdk?=
 =?utf-8?B?TFNETFEwSEZ3YnFJNXB1N0JHTzVXeXI5c3VQNUxhVnNucVBhcFZCYjZDL0Qv?=
 =?utf-8?B?Y3lLMVFiUnNCTkd0NEl0azNycW1LZ0RQbUlOMlpBbDhOaVIxaklwWjZaQnFu?=
 =?utf-8?B?WkZ6ZjFmV2VTTnNVa2hwejFwdVR3YmV4SHdkUFBWOXdXU2NWeWRoK2JYeVN2?=
 =?utf-8?B?eXNaY3BhZTdPYXh0QjNWMklvaW9MZnZqakFPV0dETGxaa2hwVjZDdHAyWmwr?=
 =?utf-8?B?aGJ4Z0xlMDAvMjA1cEthbUxsZ2dDYTZBL2Vpdk5lSVRLb2dRYmY3bldFVndT?=
 =?utf-8?B?dldORTUyK2E0cFBBS3FvbCs3MnNqaWVOUk1wWEY1L0hwUit2cFBEUUxqM0VQ?=
 =?utf-8?B?dGpoa3RGUmYrdFdmNk5UYTZnaEZKUGhOek9uY2Z6VC8vamFoMFR5eHRQelBi?=
 =?utf-8?B?VER0QUdEZk1IeHBDRjRFaWhjTmhJVmhISkhxM1BCMm1iRkZRY0dnTTlubDNC?=
 =?utf-8?B?T2R0M21sT1cyVWlHMkdETUkrUlZSV2RjRHRzaEpDYUduMmZJMFlZMVJtZHVN?=
 =?utf-8?B?cnYwbmVBSkxMeHNlbnRzV1pRbmExYXIzZkl3Y3drMGp3UFFIVFdhSHdPTXNo?=
 =?utf-8?B?YlJSMjJuTXgydkYrSGRuUUY4MXBtdXNwbGhRS2ZHK09FMXV6dloraFZOSUlj?=
 =?utf-8?B?cHZRZDBwaHQ4SzZkb29VeFdFMWljSnBIS2hqSDBVK1dieUE4TFN3cUQxdXQy?=
 =?utf-8?B?eDcwVWxvMkFtcXZqYzBKVVNMWmdJa0lQeWFWUDJKcEpBQXBDMXJPVlNYS0hh?=
 =?utf-8?B?VWRiMW05KzlqWGxZSXNEU2haaUN3MCtpQS9NcUVHM3pYOEgvSVlxaE9nRFo0?=
 =?utf-8?B?V1FlNFNqdytqZUVVckZsY3BxaENMQjV4TENoZC9tKzBrWG4wYmU3b2xlZW1V?=
 =?utf-8?B?dWZmeFNaWmJ4aUUyMlFRZXN6RXdiZlpnN3MxSWc2a0NDL1FGUE9qL1hiZFcx?=
 =?utf-8?B?Z2w3ZEdYdEhMa0NUYWdaS1N2V1N2b21VMkx4VXRuMmFBZ2EycDlZaDdGZXQy?=
 =?utf-8?B?VGRQbTZqU2Zod1Mwa0VZcUJjYzkra0tHOERURW52OG1Uc0pyTDhiZFYzZFNz?=
 =?utf-8?B?UVNJaEJITk9xZ3ZIVVlGZHpzVlN0K3pveForcHl2TkZxNUlOMVUydkZycXI1?=
 =?utf-8?B?TUN1YzR6Mmd1VXFJU3dHUENyYWZwWS9Mbmd0VUFRdkVjV05uUitOS3g5YVpY?=
 =?utf-8?B?WVoxaVpMb3pQWWFmY21RNVZkTGNWYzB5aWxhcTRCd3UxK2RuRUdLVjUvTjNJ?=
 =?utf-8?B?SU0xM2ZNb3dpVzNMOWlpWVd0Y3luaTlZV1RabXFoTkloS2ljTHNuRXR3L2Rn?=
 =?utf-8?B?S0ZxZC8wQ1JBU2VOTFVUY1RuUmo4Y0RjOVNIeFNwV1liSlJIbEp1bnUvN1Iy?=
 =?utf-8?B?RndKRVJiZ0RZMlJ2R3VjdFhVbDZTeC9CMUdzQk9xLzRJUU5wa3IwNGVnaFI4?=
 =?utf-8?B?V1hJbFdLS1FaQmFDb2NONXZ5ajEvZ1pSeXZYYnlGNm4yN1lBN1F3dnVwcEFL?=
 =?utf-8?B?UGt4ampDR3lKYzZzRFFLNDZOcXA4aHRYajdFalVLZXVncVRjZUhwK3NVTFVF?=
 =?utf-8?Q?1XNgGHXbZn8vgZW78ABv+FqZ4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f44ea15-1e5c-412f-08b5-08dd7042a784
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 10:56:13.9101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/6hMWQRqw0IYYGPGKf1IEkVffvZIFe3/mPSKyibXUNguvdFEXtv+LKAhcz66q5nc6XxSpotYTaJavxcesJHVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6028
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


W dniu 27.03.2025 o 16:31, Kamil Konieczny pisze:
> Add some general guide about adding new library function and
> a few guides for their usage outside of tests.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   CONTRIBUTING.md | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index b571b5e68..d85266a6c 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -38,6 +38,33 @@ The Code
>   
>   [igt-describe]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
>   
> +IGT libraries
> +-------------
> +- Tests and benchmarks are the main usage of IGT libraries, so they
> +  could use test specific macros/functions, for example igt_assert,
> +  igt_require, igt_skip, igt_info or igt_debug.
> +
> +- New library function could be written when it will have at least two
> +  different users, for example if it could be used by two or more tests.
> +
> +- In a new library function():
> +  if it has macros (for example igt_assert/igt_require/igt_skip) then
> +    write also __function() counterpart without them;


Not sure what does it mean. What are counterparts to above macros?


> +  limit also usage of prints igt_info/igt_debug, this should be a part
> +    of test code.


As Zbyszek mentioned, beside pure lib functions which should be rather 
quiet, there is bunch of code shared between different tests, I am not 
sure if this should apply to this code.

On the other side I am not sure how to emphasise difference between 
them, comment?


Regards

Andrzej


> +
> +- Libraries and igt_runner
> +  Runner should not use lib functions. It is crucial for CI runs so using
> +  libraries puts a risk of bringing changes meant for tests which in turn
> +  could break runner.
> +  Note: You will find places where igt_runner uses lib functions - this will
> +  be on ToDo list to be fixed.
> +
> +- Libraries and tools/
> +  Tools should try to not use lib functions. Any abnormal condition should
> +  be simply reported by printf or fprintf to stdout/stderr and then tool
> +  should exit gracefully. Do not use igt_abort nor igt_assert, igt_print,
> +  igt_debug nor other testing/printing macros from igt lib/
>   
>   Sending Patches
>   ---------------
