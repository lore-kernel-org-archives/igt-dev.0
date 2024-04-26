Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50151C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 11:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7761122D3;
	Fri, 26 Apr 2024 11:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cO/Y6gUp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F15E1122D3
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 11:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714131977; x=1745667977;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D7brewaGtPMrY5JoXrOc83eEdHIyvUk+hxBhIaSXSiM=;
 b=cO/Y6gUpOWgjsJk7z2B0gAWcJGLNI70WGgP1nzF2IeKluzgst4xpemCd
 NFmddhs+5maat4pxXRREmlS3Hj6G/SebK14EODomRrpAIqIJJpQCHwAIy
 GojTmiYV1TiHc/woC/HSBXJWUHKm6xSb81vsG837VIvgs/uCjtdc5Rt80
 oAi+AWabUL/bcv8/Z7EaHckzNTxo+voUA98/es6edtJKRDJ+1YxKDLWg8
 /RORClSLaFeNOsZOuaCfzJ1IlSNzL4eJO4DO05owwk1ZWZxseXaZKerIO
 MTnRhwFdKlzwQLCJI1ArYkYytvfRLNgNPHcCkC49C88Ki6ij2aDYiHOFz w==;
X-CSE-ConnectionGUID: lDiN5uSLThiEqZ8OALp8jw==
X-CSE-MsgGUID: OyOCyH7cScaT2KxxIHFtCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9977085"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9977085"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 04:46:16 -0700
X-CSE-ConnectionGUID: 8Tad3bLBRcSbg1WSfBqTAA==
X-CSE-MsgGUID: Qlgdm8KjRDesAYg+hSVOcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="30036992"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 04:46:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 04:46:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 04:46:15 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 04:46:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4QuhgAqxrLVkDq8TYnx7Qveom7/s+57sR65BvnKmb+IXY91HFWXuGcAVLu7nNm/TzwrA1i336LAM+KVlZjP4UZY5pyJlNcpFcyPi5KKxv/CEOM4Vm4v5NOE3NpC8pOfuw4N5AEEdWPfwgQcYP6CkZQzI89rJ51hOZ3uOZZVIlM/jyhswbMqTvz5Z4Z+nm6+6/NHPhBsxhv41TpjLxMGiVwhYVePedW70IpCMsD5uzPX6aiO8sY2m35Ai/rrM+8a1fKE2f2VZRd5quarJtVGLiFo5sDK0SIV49m0pg4ExQZEGM8i8Z4iMG4qlS5BETgWHzLC014GhCGL4EnY250WRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4CjY/QKgCErLc4Bk46Cqn8Gs9kYxGd/PfniDt4aLow=;
 b=lZunzqWnXKCVNZITHAJ9M+B/jHnTSN5RCuZlRyT0deLgp6F870n8VWNwPwmqcbhwr6hRUpq3mStt7TLvLP9yaLcW+mZ99pz8BS4No766o6loIo8g7KO3qkKqWHLg0vse6lil1DcDQnjJQFUq3TmqTwZSqOq+ojJ/oDjBJaCPZnf2p+T4FwHPTIqT7iRlVD4oaiXLJleWuVaY24NoXqcolF6424wcpyeWEEJXxqeetjXu2/wFSPFRpMxo4zm2rcR/kJs4BCsWJ8a2/c9EFGjyflgmsPtSOQJGvf4c5PLKtcTKozCIorDa1iL+oC/OWa9DMbJeGzr+j5i3JDxWpG+s9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by DM6PR11MB4548.namprd11.prod.outlook.com (2603:10b6:5:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 11:46:08 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%6]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 11:46:07 +0000
Message-ID: <705c2697-1276-4798-8be9-365950386296@intel.com>
Date: Fri, 26 Apr 2024 13:46:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 02/10] lib/intel_blt: Rename confusing fb tile to
 i915 tile
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
 <20240426090117.78060-3-zbigniew.kempczynski@intel.com>
 <0788391e-861e-4076-97e5-f32294cbdbb6@intel.com>
 <20240426112759.qtctoo2rwrsyjwpj@zkempczy-mobl2>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240426112759.qtctoo2rwrsyjwpj@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0064.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::17) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|DM6PR11MB4548:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f580fe2-3c09-42c0-b8f8-08dc65e67613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHgzY3pLYUI1azlzYXBxZHRnWm0yQlVQSWt1c3RacUxYWHFvdjUwYlhNUjg0?=
 =?utf-8?B?ZUZWV0U3VC8wWmxKeVgxckxzekthSGJXRktaYmZwU2JJZUZqam5nNlgzeFlS?=
 =?utf-8?B?ZThiWWFpS3pXdXZNL2N6NjYra1J4SjkyeS9PamlkV3RDUk1BVEVSYjl3Sklu?=
 =?utf-8?B?SGtrT1RnMlgza0QzZEJuazBEZElBNnZEMDl0M1Zid3lvcVhyL1pJVHlnQzVU?=
 =?utf-8?B?NzNJM0NWM0JYUm9mNDJYY2gwbkxyOFdGaW9RT1d4d2lkUEpqQk8yazNydStk?=
 =?utf-8?B?UUFlR3EvVW9VWVVhS2xsQ01Rd2tFUUEyNnVzWUZJRGovbmFjejk3cjlOQ0V1?=
 =?utf-8?B?R0paUnpaMmw1V0NoZ1ovY0toaCtSUTFYUW5QeWNUeitTR0lqRWFXb1h2ZlFB?=
 =?utf-8?B?a2d0VDlMR1lkZGRCZmRDbHNSS3FQUERRcUl0WDc3YmdIbTYyL0hIemtrSnR4?=
 =?utf-8?B?NWNXMVgwM0FLcjFIYktDbkVEVnZxTUVmczYzOHZOcGZrZS9vb0dHUXlOVHhw?=
 =?utf-8?B?SW9icVRFOCtkeVUzS21Jcy91MjhNMjV2djRwYUpOTGphanU2alJDajVnM3NJ?=
 =?utf-8?B?V1laOWd6cHl3VW01SnA1UlVqOGQvWDRtTm1PVXI4SC85dVVaOFR1UXIxU2pp?=
 =?utf-8?B?VEJaY0h3K2xVRWJvc1pGY0draFRXZ3JUd09UQXFaZml6ZW11WHY1cEVTeEZ6?=
 =?utf-8?B?elR6elRzaWJGN0JuVXhyMjZDTW80ZnZQYk5OV0pWUnlsdWgvejQ2cm12K2J5?=
 =?utf-8?B?dkpUNmgvN2JtdUtTV3BqRG9JeEh6QTE1K1NLVzl6K3ZJNTVRalpjeUR2alZC?=
 =?utf-8?B?Qmh2R3JBcm1OdGZCUFAwT3lRVnFPUVAyY25IZEpNR3lFS2E2TXlPbzVwaW0x?=
 =?utf-8?B?UWhvSG9XVU81TFhjQmZYeXo2QjkxVUMyNGl1d2pUOWZEc1BVOWh2bG9IRHRs?=
 =?utf-8?B?T2xxNmhIU2NBOTBMaFJGQjcxWjJQSTRUTDhHQlVQNnp1elpCZUFuQUdUMTZs?=
 =?utf-8?B?YXdFNFRwWCsvZjRsQUNoWHAwa05TN1k2WDVZL01xQWVBdnhmRjlMcVJIUnUv?=
 =?utf-8?B?d1FTQyt2ZVJBM1lmaE5wbnorcTR0KzE1MW01THNXbDFLa0FKRG01V0JxazFl?=
 =?utf-8?B?NXM4SFlxcCt0V0FwVWtqNXo2L2NPczFTMEJFYkYxdDBUK2N5VUZ1VHRLYytr?=
 =?utf-8?B?Q0Q2Skp5OWQ5MjRFWFV0UGJsRjJka1FIeUx4RHdDQmo1Z1JzVm9MVWpwaXQz?=
 =?utf-8?B?YjJHT0lwY0hoSTZTNnh2aTJseCtsemt6bW9RREpBbDVrRDRIQ2xIRVIyWWgv?=
 =?utf-8?B?YXl0UGpBUEh5WGJ4ci9BVEhIQ1VpemthdDVaNCt1RlF2cUJsRVpXRDNRUjll?=
 =?utf-8?B?aStneURXK1NBcythQjlVUG9aOG14cDQ3YlF0QWJtY3VSY3NoMzkxS1YxUllT?=
 =?utf-8?B?c1FuSGJCUUlXYzg5QjdIcjR5ZG1zeWJXWUJJSitIZHpQN1JoY0ZJQkVUZWR5?=
 =?utf-8?B?VHlCOXlHZXkxQ0JNY200VnFKbzBtR2NCZ09rNHFMdDg2ZHBQVXAxYzg0cG9J?=
 =?utf-8?B?ZHR5N05pQmE5YkIwNWpETWhsRG40SjdXZFB0dlN5Zng4S3N0WTEzUDNSZDlh?=
 =?utf-8?B?OFdSai9sUTFNOVlBQk50d0JnNUNFWnFKT2dtaUpOUnI3bzB3VmxrK2pvOU5q?=
 =?utf-8?B?NW1IUWhFT0NGR0lhRGpiUXZpU3YwUWVHU3IvbjRhNUpQZDlDTlU1ZEF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkpzWkZ4em5SdC9ORzd0TVdVRnVRTlZJcjBwLzhremVrcTlkS09oSmhtcCs0?=
 =?utf-8?B?d3lhRGU5aVNNMXlXV20zQk4wbHZRVHdQN0IrMi9mZnpQZ0w2c0p6TFBjaG9K?=
 =?utf-8?B?d2liSXZnM2Q0eGMzS2MxTzFLeWs4U2FNTWFvMGMzbTc0SFovTjhRbUFPT2ZZ?=
 =?utf-8?B?UzdhSUpZdXIvMVVidXJFVW1oK1BCckRSbGpYWVZWaDBPSU85ZXJkTnNUZDUy?=
 =?utf-8?B?Q0paZlBtSGlTYUp0WWVzcWpMdUxmcDNvVUpuT2Fqb1laYVRSeXJwcG1OaFhn?=
 =?utf-8?B?WWxKRFdZY2xzM0d2b1FCTlgycFRSTCtaR2NDL3BPT2EyK2YyQlZ5V2daVGd6?=
 =?utf-8?B?UXBObzBjODMxTHRDQVdvSUtqdFQxTm85ajBoeWN6a21vUllIRVFNUFZsV01x?=
 =?utf-8?B?aDhWMXpzUWRSKzEzeFd2ODZTcWpleko4SHhPV2hXNk1lTTVmZ2g2YkhsSGh6?=
 =?utf-8?B?VFdnb3ZEOFRTVzViMFlUeldUNVVQQWFnb1I0a01TMSt2Tlo5VjEyR24rWEMy?=
 =?utf-8?B?YTkzRXZ2ZWZ6T2FWMXRkbEluNjZFSDdkSzVENjRqcmRRaGV6K2ZxdVdiYy9x?=
 =?utf-8?B?Qy9CTmVjeHhrUU9Wak82bU8zK1ZubDB0WngvQll2MklTTk5pek9aR3dBMHFE?=
 =?utf-8?B?SVRzL01SY0J1cmltZVNPYmdBNjlLdVEzMm0vRTE0ZEZicnhFQ1I3cm5taEJQ?=
 =?utf-8?B?MG8rTTRKdStwRGRzbFBjbVhEUTg5YlhsZ0VHczMvLzZwMVVnY1N3VnEzN2NC?=
 =?utf-8?B?RStwUmRqaXFmTE5IbE83REFsK0Jqb3gwV3VqMXAvL0R4dFR5bjB0cEEwa3NO?=
 =?utf-8?B?ZExEMDgwQVFMRVppNXdnNDc4TmJMemNseC9Hb2lHRHJoOXYwTEtMR010K0xE?=
 =?utf-8?B?NXFmRm9IdDVzVHAwNG1EUnlSMDl3S254eG0wdW13WEpDdDBCTTdaTm4wM2Q3?=
 =?utf-8?B?NFRjaWxEaXplMy9qNmtFNUcyWUxsMXVXNC9uSDVFZUZDZmFuUXZ3OUpTSDlH?=
 =?utf-8?B?VGFvTFRtMjJsbVg0eGpJalA0VHFYdE5DNnpEZ1dGZFBuTFpHdG9wWU5MRXVw?=
 =?utf-8?B?MlpPSkVDKytqTFk1RXdyTkgvTlhNekZxU0x6V2hKZTlPNHl2ei94Nm9YQzNG?=
 =?utf-8?B?ajNzZEpYVUljSHRtK0NmSTg5N0preTRaMER4NjhnUmRIdlNSMTNDTGx2YkdI?=
 =?utf-8?B?bkpUc2ZtNkd2TUFxQ3IyWnlBdjlGcWpUN3RaY1d0VzZEZ3hBT0tEVXQ3czZ4?=
 =?utf-8?B?d2hhZTU2S2ZjWldaV01PWFJtN2Erc20rdDZGWG9ad2VHUW9XMkhzZjhoRUpM?=
 =?utf-8?B?bzBOalk0ZnNSMnFuL1hBbXkyWVJiRVBHQkJjbVlYWlhyOWFKR1UvenRRN1FQ?=
 =?utf-8?B?SXEyTmtldzZpNFp3Rm9GcDJpSGp2RHVPTitpME01OUJ6cXF2VU9mMkFrTHRq?=
 =?utf-8?B?VzRjODlETlRvY2hub3NNendGZFFVTEE3U04vSkR5THFaY1lNODZtMWl2KzZH?=
 =?utf-8?B?dTMxbCswMWg1MzlYWmdpcDlBa0FKV3B3SkJ4djJRdVg3RmV5c2hIODdCK1d5?=
 =?utf-8?B?MkFac0REV1lXdVpuUVNvU3NtMnQ3L1UxZTNyVnc3SEJBRmhIZHRHR3FqS09n?=
 =?utf-8?B?Zm9sQXNsSCs1dUpCcExNaG9RaWF6OS9CaXVQdEFrRFhkNXgySGM3Zkx5eVZp?=
 =?utf-8?B?cnhJbGRRelE3dGV3SnNPZTB1WXB5cFpVOHB2Rlc5eWpwQXNTWS9tVWJqQ3pV?=
 =?utf-8?B?VDQwRmJ4Z2JFYjJFejlCME0vOS82M2x3MGFFNmhMUGNrWTZiY2dRbG0zcTlM?=
 =?utf-8?B?SVdmMW9yYmlUUmdtb0kwKzIrb1l3YzlUVm11ZVFtQTE1dlJuZkxyRmo4c2s1?=
 =?utf-8?B?ODhsTzA1YmJSSWFGUHNxTmo5WW94THlhUG9zNnp4QXJtakUzejR2YVRhMzNP?=
 =?utf-8?B?M1FkanMzMG5DdHp1SzVrcjF4UTFDbnRuQkZnQmdsVTJCdVFiQ1lURDY4Y2dX?=
 =?utf-8?B?MTRPQmJ1elhYbGloanZDbUhDTWlJZVUzcnFiUVQwM1RuSnZFaXFMWTdVaDFk?=
 =?utf-8?B?Q0N0OXNZMHFmMXFtelpUS1lrSVJLZDZVbklFT240emo3NlhXYmpRVEdqWFJV?=
 =?utf-8?B?bGZxYkNJZHlVSzVqNFd0NC9EeVRZTlNSNWU0TW1nVHJUYkFFMDBaS2ppVnlV?=
 =?utf-8?B?MlEzVFhTb09UZ1ZyUFFQK2FVMEoyTGoyaGpRWXNZS3JSVnY1U3FST0luRkk2?=
 =?utf-8?B?aFN2cTQ5SWpvV08yZE9rVVJKbytRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f580fe2-3c09-42c0-b8f8-08dc65e67613
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 11:46:07.8697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzL3MBt5YKXR/lmftyDaK41fxUs1dgroxE4bNRA+EUMsKotYo+47aT8b9mmfJz3TVuYjrHCz6YSzbsBk01Lqtp8OXbabD/IFZ9yKk2xX9gg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4548
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

On 26.04.2024 13:27, Zbigniew Kempczyński wrote:
> On Fri, Apr 26, 2024 at 01:11:02PM +0200, Karolina Stolarek wrote:
>>
>> On 26.04.2024 11:01, Zbigniew Kempczyński wrote:
>>> Fb tile is defacto drm modifier, thus blt_tile_to_fb_tile() name
>>> is confusing as it converts to I915_TILING*, not drm modifier.
>>> Lets rename it.
>>
>> I agree with the sentiment, but I wonder if we should have this function
>> in intel_blt at all. It's only used in xe_render_copy test. Why not move
>> it there?
> 
> At the moment it was used only in xe_render_copy, but I've another
> candidate (xe_intel_bb@render) I should slightly adopt to avoid
> hardcoded tilings.

I see, thanks for the explanation.

So:
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> 
> --
> Zbigniew
> 
>>
>> All the best,
>> Karolina
>>
>>>
>>> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>> ---
>>>    lib/intel_blt.c              | 4 ++--
>>>    lib/intel_blt.h              | 2 +-
>>>    tests/intel/xe_render_copy.c | 2 +-
>>>    3 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
>>> index 4da5cc855e..5a281036c4 100644
>>> --- a/lib/intel_blt.c
>>> +++ b/lib/intel_blt.c
>>> @@ -536,14 +536,14 @@ static int __block_tiling(enum blt_tiling_type tiling)
>>>    }
>>>    /**
>>> - * blt_tile_to_fb_tile:
>>> + * blt_tile_to_i915_tile:
>>>     * @tiling: tiling id
>>>     *
>>>     * Returns:
>>>     * id of tiling introduced in i915 like I915_TILING_* used for example
>>>     * in render-copy code.
>>>     */
>>> -int blt_tile_to_fb_tile(enum blt_tiling_type tiling)
>>> +int blt_tile_to_i915_tile(enum blt_tiling_type tiling)
>>>    {
>>>    	switch (tiling) {
>>>    	case T_LINEAR: return I915_TILING_NONE;
>>> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
>>> index cc59666862..fcfce69bee 100644
>>> --- a/lib/intel_blt.h
>>> +++ b/lib/intel_blt.h
>>> @@ -213,7 +213,7 @@ bool blt_platform_has_flat_ccs_enabled(int fd);
>>>    bool blt_uses_extended_block_copy(int fd);
>>>    const char *blt_tiling_name(enum blt_tiling_type tiling);
>>> -int blt_tile_to_fb_tile(enum blt_tiling_type tiling);
>>> +int blt_tile_to_i915_tile(enum blt_tiling_type tiling);
>>>    uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
>>>    			    enum blt_tiling_type tiling);
>>> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
>>> index 4f98cb7dfa..ef75c4ce6d 100644
>>> --- a/tests/intel/xe_render_copy.c
>>> +++ b/tests/intel/xe_render_copy.c
>>> @@ -407,7 +407,7 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
>>>    					continue;
>>>    				tiling_name = blt_tiling_name(tiling);
>>> -				tiling = blt_tile_to_fb_tile(tiling);
>>> +				tiling = blt_tile_to_i915_tile(tiling);
>>>    				igt_dynamic_f("render-%s-%ux%u", tiling_name, surfwidth, surfheight)
>>>    					render(bops, tiling, surfwidth, surfheight, id);
>>>    			}
