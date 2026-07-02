Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2412C43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 05:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5921E10E43E;
	Thu,  2 Jul 2026 05:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdwBQTA4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353B910E43E
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 05:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782969895; x=1814505895;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oxc8O+iJ2vGDZr7hJ0AqBY5PVK/9NPLn231slOJEnNI=;
 b=UdwBQTA4dH9jwmhUXjG5X/P7Wk62SXSx184rTwVAVoL48Up2CPjVmFfX
 i0AjMOhXXWlfT7mGjOdWnUV02kdrbUjK0mlhiAJPlCn08UpO9KYDQO8SY
 S9R/hdqS3WY7JPx+Rv/BCnw4McJXbK0MjbotDp+rBMtDFGLwy42bmqS9k
 80Dcp/SjHAtrUqQQTi4seSqOTzUa1fC9Zpppbj6w568e8IYPaSFjflZIq
 uMZkNCQS3sdlnGkxtD5LMURY8muqb5jHzWQ7emj5XrH59tMYdziqAtSil
 EkuKOFySWie2y5rlppRCg/VUWaHHyRRK/rpesNypSabBreP+mHFsZFsrN g==;
X-CSE-ConnectionGUID: Z7sJscq4RtiMUkjm0RxyFg==
X-CSE-MsgGUID: UHy7n+4bQRmyfqr+miBvJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87624748"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="87624748"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 22:24:55 -0700
X-CSE-ConnectionGUID: nlKRxaYlSzezTbX5PxezIQ==
X-CSE-MsgGUID: yOVQrIXMSSqViH7EMoInqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="248303383"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 22:24:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 22:24:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 1 Jul 2026 22:24:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 22:24:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnEBQ0OUjKYBpvkf2PZuc/AbfMJ7fWi1C05my1yBvp1sIBasdd0N2f5Slrrz+A5iJVmSHQJ3Jmpo1Lx5oNymiuVgvPKrocAFhPJ2sTUTPMIy+0pHq9exEHeFiWGRVhDffH2C3Ib7EcOhfHHnmqVJIUloIHM7I9XMkttg4KUQxNTO5Y3Pvq31W5cSvu6cp2k1zRszc+lHNUAAIFpDbrMI6MUj35U1K7ZMad+9cBY61XN/nPV0xE6hoS6/Hx+tgDmT4FkkhD5SSa6lQhNycbf1BSABYEX1GC5RtMiUdcWW9FSkYbnLcPSjZ6dDfnZVh/sb2uDnieoZlA023LNivN1ftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzvMJ4B3DCltYQwKRicOlMDi+ntkii9S7b/JQDHAbx4=;
 b=Am28yTOAtpjVdkUeBrTaEygtJRAqsdesZMNuBvhk9N9hfQW3vmGMwbUdHo9A7/rhVzL+/xx24/2ldvryxmNbkdCbow/m2M0qNrkaL/DEvrXmwBbKYai08vRNvp3q/cVuTHm5b/sriBhhdEVgdAQeFhMDMF4gkyzDK9ISPZ11TiOc8j2WlH6myYSjvUugzdKSHxuk16GaSvOhHqeD+lJCx5lkD+kyQ9PXtb1HNg5MEFGTTTnzAkycgrfQEFVivPRNU+ER1NFLoyvAUjXTprOMEs+K4fCN2G+sud8FWjyYcqrOqXEONW973Ru4dF6bcmMsvkUmZL0GubQ1cfU6itP4LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8600.namprd11.prod.outlook.com (2603:10b6:510:30a::18)
 by DM3PPFD5EE188BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f53)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 05:24:45 +0000
Received: from PH7PR11MB8600.namprd11.prod.outlook.com
 ([fe80::b93:cb17:6e06:2580]) by PH7PR11MB8600.namprd11.prod.outlook.com
 ([fe80::b93:cb17:6e06:2580%6]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 05:24:45 +0000
Message-ID: <e91e3d44-645d-4704-a7f2-c510390d6f3a@intel.com>
Date: Thu, 2 Jul 2026 10:54:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xe-perf-recorder: Add mmio-trigger support
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20260619050217.2112851-1-shekhar.chauhan@intel.com>
 <87bjctj9qy.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <87bjctj9qy.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::6) To PH7PR11MB8600.namprd11.prod.outlook.com
 (2603:10b6:510:30a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8600:EE_|DM3PPFD5EE188BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 710fa6b1-fd3c-4778-0670-08ded7fa3a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: IaxRuREJ6LTiyS+lwfmE+f/xmkUZHxvHbu3LNK6io+HKKdw/tFjJV9YNTvdQloNptR8GEmTfGM7NDczK8re1ga8mcGtX/cRVL589zAe60G8kQnArioZYoJNgnb7yQrNVuMSMR3Rh2/OTpk5rLDd6qmwQ2e2lirEtqaHx80RL/nXP43krL+FSr5IKBlYh2VIegtQQklZM6nDfck9A2KuxldRt6WmdyrbbSuTMaZzSNQj0ZLB+4ftbOlWX1aI2dgSm2c1jJIPI48wTgUlDxKlHWM4xOXzSh7Ss68KWzADOVg7K4BeWqgf3oRfL535tgqawbNjemW1Hji5qBGGOe7CGEZhLP2gVPf20qrUXAcZ5yAQ8zo7SUn8HoSX0T5AcshfYDT6zCD0VYBuEuKBJb9gqNTNUvVN9GmafYPm3AbR1AYzkSo1MwDb68Cm5IvrxzqNFgBVZ9MXsLoaNh466elni8N61O29qQFTqZ7E/fgr9BNkPWuYzsbAH5oLJTdHrQt2ZB30SoMbENmcQdBDNBbKlwmq8YaghMdiwgfkfj1TqktUHjkdZzgpy9d03mTy4j17BT56m2Mxk5Jk+PFnTDKQ6Sd8JRztH4qDhzcy9E9tUOKgWmXl3dizwFiWdKA0+cXi9YU+u6WJherbmcxFxYJF3yPW4kYYU6AuTWqGnoVddA2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8600.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUs3ZW02aE96bHpMc3h4cVM5SldpQnR5YjRiSnIvU1hSUitOUm5MZ1J5bWJI?=
 =?utf-8?B?WGw4NjVHM2tML3FieFREWEpIaFhJNWFxYlNvZzV5RElBTml4NlhrK0xSOUdk?=
 =?utf-8?B?cEJDNHNhTVRQekRDaFJhQUFJZHlHWGtrdlhyS0ZLYWM1azFXNzBqWXc5eWM5?=
 =?utf-8?B?blRXeTF3enRlVUd5OTJRaG9vck4vY0J4NmN1UzNjRVUrR2tzTngxODA3WEFm?=
 =?utf-8?B?RGZERTlTcm5VbVk2MTZhN1VuVC9DbjM1anZBTXkxaFhPNVAyK1dydTFuTjFa?=
 =?utf-8?B?YjZiOXFuRk5HclZqb3VrOWlLcDN5T3hqTjl2bjZLQVk5cnJsUmxGSjNVQ2dW?=
 =?utf-8?B?N2Q1UTdGZzF6L2VLa3I4czdleEZpQ2x4QjVLWjZIOUlUS0xZUXpkeWlPV3pq?=
 =?utf-8?B?bGxxcGVpMWIyaTlNNEc2TURDS2JETTNwYlRNSUdhenVCQlBYQ1dZZEdPejVU?=
 =?utf-8?B?bGJkYlhLSnloRkpPYzRqWnlZMWExOGJURDdRSFVzdjYrd3FSWTF4ZnJoVXlx?=
 =?utf-8?B?aW9mbkxYOHB1OWNjanlYeFMxYjdkallOR01nQ2ZkajZCUzkxaWU1ODl0NTRS?=
 =?utf-8?B?RUpXOXkvVWpObFczekJVbUVELzRibnlaVElCNzJsdkhCQmZRck5aWXJ6bnI0?=
 =?utf-8?B?dW5iSFl1cnhTN2ltTGlldGlzM0VzV1NsdEtCcWhzU3NhZDVkeGxySUJaK1Bs?=
 =?utf-8?B?VUFzaE1iM3BBY0E3dDFMckdEK2h6dzFRd2kyakRlNXUxVExaTHBFRTVyMGU2?=
 =?utf-8?B?TS8xT0x6Y3ZPcEIzeXZRSTRaSFZIY3IraXVQcHgzekZaVGc3anhDUHgzaWtD?=
 =?utf-8?B?ckZ3cC84eXI2TEk5V0c0ZHViQ3JqeFZCKzRGS25MS05WR0FmN3YvUGVKUVI5?=
 =?utf-8?B?cWdVN2FQTDFwMFFITmJ6WllpckUvajAvNGc1cEphWXlWNFk5RmJjRzBzRFRU?=
 =?utf-8?B?NXNwc09zUHNxZ2drazFTdEV4UjVqK045U2JRbEs0Sk5ubEdOcEtmemd5TkZP?=
 =?utf-8?B?Zm5EYkF4YXJUbjM2d2Vhald4cnV0SDVmQ0dsWW11cHFhTnlIMStBOUd5Tmhn?=
 =?utf-8?B?dEZtdDhCNWVCaUpIOEVqNkFxeUQ0bk9WZy9UZkZpdGJWYzltMXIyazBSeTBz?=
 =?utf-8?B?Uk82MytSc2Ewd2FSdzQrRHl1N3QwVHBPQnlBQlpSd2tYM2dWdUVib0hDYVR4?=
 =?utf-8?B?dUUyK3NNMzREbFBhZWtGM0oybEFnU3BsNHVJWTllYldOYk1yOFVZMk9pdFZC?=
 =?utf-8?B?bTRlZXRVb1JReWhlOEE2TkhXS0dQZk5mdm1XcUpTUVRPTFB5VnI0SkhQb0lv?=
 =?utf-8?B?WHMvdytpOUViMmFvREdYOWhOU1NuL3NhY1lvd2VqR3YySmVQUUxiYzJMeldl?=
 =?utf-8?B?dm1ZWWR4K0xzYzhZbjVBY1hSMEtpSWlRbmZ1NkhaRFdqaHZzUFhYQnkxTGhs?=
 =?utf-8?B?aXZwTmFtYUljbEpBS2UreGI4djJNWEhBS3lWaWg3TkcvTG5BUnJqcjBXOUJN?=
 =?utf-8?B?SklZcCtKSytORjFmR1B3U0VzSVZlTFB3Q1BBdjZSVGtNNDBQd3BVQWdqelNs?=
 =?utf-8?B?ZUhPREVhMkIyczdtcUtmUTlRV3RSemJrdVpPZ0JvU0JTa0JVVmdHTnpUVnJO?=
 =?utf-8?B?OVF2ckFxdkJ1S1NWVzVZOUQ2cnl0YUF1WTIwSkhLQ1BvNXZ0bHQvUW1DemFw?=
 =?utf-8?B?Z05oQ2Z2NWprRXI4QmIxd3dQSXU3NVlXTGZ0QVhPQkQwSVFJdHJSa2JTY1di?=
 =?utf-8?B?RnppWGtxaDVKOG1XOG9ZVGJtYnNJVG5DaW9qV3BVN3BYRE1tNm5pSm52aFdw?=
 =?utf-8?B?TTRuc0ZsdEN3THlpTXBkNjRHQVdMYm8wa2dQSmRhcXBqQVRWZTRzUGJwbzNL?=
 =?utf-8?B?a0ltWE1hMU5tblFUZ0doQmdVdUNQZ3JZQkJxdCs4UXY0aHd5M2VOWmJyTFpJ?=
 =?utf-8?B?TWJPMXpyVmZEMVBwUS9PdThwY1V2ZGJqM0MwTlQ3OXJoUTRRdTJMUFI4N21Y?=
 =?utf-8?B?K3ZzYWp4ZXdrcXBoZldPRjV6MkZwS253cVRLYWlLenhWdG95dHNKQzNTUW1i?=
 =?utf-8?B?TXl0NGV1WEhNSXVRSHJUZGU3QzhjU0h4SlBIbkhvUHA2QTVrcmkzRVhORysx?=
 =?utf-8?B?ejlXeERaR08zNDdra1JMSm12OWlGSHE1RDAxZ3dVTXlNb3gvRmNDa1lROEIv?=
 =?utf-8?B?N3NPbkZFRGV0Y1JFK2Z0OW5iYVBPbVhlOHZyVW5lRGV4dUM1ZUZ0ajhDMkdO?=
 =?utf-8?B?SFVXQW04K3ZQWG1KOCtWOEhuVGdteWVsVGJPb0NDY2Z6ZFhvMFd6Y29XVEV1?=
 =?utf-8?B?eVZic3Bub1YyQitrdWoxenhDUnBRbml6K3FIOHp4RFIxYXEzZ2RjK1l5NGxZ?=
 =?utf-8?Q?HM+952jnnGmIVE9E=3D?=
X-Exchange-RoutingPolicyChecked: kP3jnpMk90O4Tg9wLVLQmn1bIm2fAEitcS1ZTbRrz2wJla/bqadT7ViJKa91zQhrUMpAW1GRgzrN2HpBRsqr6plDYgVKckwYhi3FDT21Fj0jpr6JyBCwnG5sWRr5zIxE++QcFWGDDnkh3ULQm2FCs46jWA9HLEpisQLDTGo1nM9HgwS7yS31atnzQA5XN9/k2BocTXxNA035Mq8SseJPtFvkI2HOHqlXLvkG1RyWBV1YSXrzypqKgFPe1CZ37OAg4QkZbCjh8PNFk9IzcaTzxxDWsZPup37u93zhn07pdZESZc76h1RI/Xn5mmV1q0t5BUPmRU+hU7jD1cqya5pt1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 710fa6b1-fd3c-4778-0670-08ded7fa3a1d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8600.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 05:24:45.3698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3ax22ZvVcswE5GzU/5w+lgVnD+M/dP+aVkI9oq4FTIqQ6VqTdbNdyBr9Ora09wRmKN7OiBbwjKmYF7BvnnwXNolWMKKOLktDXh94lN+J+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD5EE188BF
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


On 6/30/2026 3:21, Dixit, Ashutosh wrote:
> On Thu, 18 Jun 2026 22:02:17 -0700, Shekhar Chauhan wrote:
>> Add mmio-trigger support to xe-perf-recorder, to justify the
>> whitelisting of OA MMIO Trigger Registers in XeKMD.
> We can't have these compile warnings:
>
> $ ninja -C build
> ninja: Entering directory `build'
> [4/952] Compiling C object tools/xe-perf/xe-perf-recorder.p/xe_perf_recorder.c.o
> ../tools/xe-perf/xe_perf_recorder.c:41:9: warning: ‘ALIGN’ redefined
>     41 | #define ALIGN(v, a) (((v) + (a)-1) & ~((a)-1))
>        |         ^~~~~
> In file included from ../lib/intel_batchbuffer.h:10,
>                   from ../tools/xe-perf/xe_perf_recorder.c:30:
> ../lib/drmtest.h:100:9: note: this is the location of the previous definition
>    100 | #define ALIGN(v, a) ALIGN_MASK(v, (typeof(v))(a) - 1)
>        |         ^~~~~
> ../tools/xe-perf/xe_perf_recorder.c:42:9: warning: ‘ARRAY_SIZE’ redefined
>     42 | #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof((arr)[0]))
>        |         ^~~~~~~~~~
> ../lib/drmtest.h:91:9: note: this is the location of the previous definition
>     91 | #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof(arr[0]))
>        |         ^~~~~~~~~~

Fixed in the new revision.

-shekhar

>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

