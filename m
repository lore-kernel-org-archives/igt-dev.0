Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C007DC9832F
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 03:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AB910E74B;
	Mon, 28 Sep 2026 03:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YE3S+xCj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C05510E747
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 03:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790566462; x=1822102462;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LuJPHgEx+nWDsbGYW3VNrRPBg2ds/DfSi9MVtmfO7hY=;
 b=YE3S+xCjFytaD7rK6q6M16EJdXSJiS2VxfW2bjIQIjWZuVn/D9sqfmxk
 GkM1pU33F/Yc0TwjOU4KgmnFsWqcwGTW/cQOiav6MFeAHsy9FsYRGWm3P
 YEBKtwssbDhq1baDu4pnY/YXwvV7D3mK1/KVOZNprUZPyHjY+S6dEIKul
 zB2XUfc6Qp4OOZSqHa52z317elYRe1aBRXj3t4ArMP26rebqfFhVeAmcm
 OCsCzAqq87KUVV4CpSnernqy7dLaHDnzkfVSyrThJjm4Mr/A8j6QuOPnl
 tRyx7HiXj3tWgfnb8YwnbWCkuieAH32Ban6LwNmx3FzrDsiEAO3ZngQ6p w==;
X-CSE-ConnectionGUID: C1+VswZVRS+d+W1eRzRZCg==
X-CSE-MsgGUID: dvjoUQtJQMSkxSDhvFH5bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78818932"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="78818932"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 20:34:22 -0700
X-CSE-ConnectionGUID: EjQ5lv6+QoGkyKOi2FlHAw==
X-CSE-MsgGUID: I8cwwwZmR3ObJRLqDG++TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="275044754"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 20:34:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 20:34:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 20:34:21 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 20:34:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAWhewhc4KGySbZj7cBrflYBXf3TFZLoFY4787AhH9OFOUS4RqhJQf/JzjMqidEDpW2Rgifdph32cBOSPV86ZWj2DU56ziuOaX2//0bYa9GbaBE0ojfw+R6gLf5q6gsj4ZJriylo362yPOJoQUaQTJ89MyrnCEhwRlMKv+3SWnZFxHnIPXHatzxveFvKwePa2KQLIJeWRikPE1rJeA2UzZ51VCicgubMEkjT29a2YdIqMadSxqhfcc6dLd5BEEo9+g0HWxlT6JFKx/XUgKXFfpHw9W9GpOx+RqGOYO6JxChdlDcpZEcdyBIcIbKpxnp42WjDseGefbOisGGx5F//UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yx2nm/a+1MYuqcLZWvAVM4lANd31BcfvD+8H1IC3z64=;
 b=NLPPv2CTi22YblmxRcetumTRv+aLu2+lOgdOr7F9rPYeyeSznW6ecVfWPq0YaOdDooGI+CQVYfrJ4WWL+pKU2gPC9PNaKvlIBuLb58ZHIyOfh6rJcUDDlJPh9fT08DzJaneqL3yqvXsEl9KeDxwAeEl5V7OKaETUh7d4raQspbsAC1Gi3IA5KwMA3OSxlJnGz2oGTWOG8Q3SfO7QKzTcYSp5kwOziIrHZ5VZe3KjDWmpc6AHuu6WA9OcjSbY/SbMNDbZBHkCe6rk77zn0iWgoEq7q5diotIRGMOw7IAnQlxi3VcqNfumEuBTwY3ccHvXNKc64o/uI5bl1/qZvD8fmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by LV3PR11MB8553.namprd11.prod.outlook.com (2603:10b6:408:1b8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 03:34:18 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 03:34:18 +0000
Message-ID: <2669fd57-5cdc-44a1-86fe-2e235b8757b9@intel.com>
Date: Mon, 28 Sep 2026 09:04:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/xe_exec_system_allocator: skip huge-page
 multi-process tests when memory is low
To: Jia Yao <jia.yao@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260922171649.2215034-1-jia.yao@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260922171649.2215034-1-jia.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0072.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::12) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|LV3PR11MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a7a404-b6ce-4cce-03e1-08df1d11606b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: ONI/aO8kKqY6iVdblY65qB5uvTdBhAKrc6HtgeA8XFkXhRSQgrhCiGTMYCTxEeeNU1+Lg2/WwRmyXd7scHwJEKhi8U7MkI7mcrCP9duizpxf8eL5lIzsh6OasllSo2xCghKuIzhwd4r3rdTda7IH/KiCrGGdqZXiyVJ1yTVQqQfSkxS35H8tjgyX0CxypnGeuv2YB8Sk16s79aUsUMxHhu9wfPMJ1a7762CO6I0h7VR7xOMYnSIU/oBcDIpSnaHUULAAkmf9fnJ1DPrH/QYWXkhmnOcud0sj4MHqSwM9oqo7ibL66gzwh9B/ks2mheEQALEEH3RnmVLPNsIrZf/hqxtIYOdRa2Nw+AP9rmaPe/vm6Wpja9Xf7UMnj+YGbdyeo4cO8zKfZf/2nK6r96YzhGGOsy/TyFI94do+19aFsRWeErsXyGWczZiJK03e45L9mZPma6H38Fn8KUpC5T0Ga/KPHVNVbvk4Uc/A0FMeC80NNWn8V1uCPkPZacKKBc5W8LcP/E3uV7wGISY7AmbUDzweFmTn6gK9Y4wST1Nwyrn1zka9Wl8bF6AmR5avgnU4CtQi6Up85RHI5mE069k8Z7W9RXKSXrGPvicjqO+tYn4hnSU9z+Uy00x8kIuENZpm2GVoDYWRnCJ9scz4giZ7zdu6ktidreWyRLBm/dTfh+w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clN0QmpJQ00xeDlBR1dqdFkzTXI0Q2g4UEtuY284L3djN1FjbXJlbXp1Wm00?=
 =?utf-8?B?WEdwV1FIS29kU3ZRSkVHR1pHSFltT1hjaGN2c2gyU2FTVzdOdjJUZlFDZWl2?=
 =?utf-8?B?Y1RKc1dJdEVLRU9haGkxTHZkVFdSL1Z0Sk1mZWV3V1JETStnbFpZeVpRN0Rt?=
 =?utf-8?B?T3lnS05Xc2M3RkxiMTJGOGxhR0dzekE1eHlKVVBMWXdiTGEzNmt5NEZMZmN5?=
 =?utf-8?B?Rkx4Yi83UGZnSkpncGpXZ3c0Ky9mRkRKLzFEWTV2dTFqNjdRNjBQRDRRSXVp?=
 =?utf-8?B?eW0xZW1BKzBnMEFJZHk5cDJZaHhPOUYrd25sb3RtVXFVYk1UZkROd3BVc1Mz?=
 =?utf-8?B?U3haNXMxdktaRDdIbzJtRlQrTjU2ZS81dUEwbUI2Q2tKZFhLRHNtaWozLyt4?=
 =?utf-8?B?MDBpeWlOcXFNNGJpMUZsVEs1dStwWjdJT2ZIY0dXQWt6Q3o2T3o5MUN5Y1Ft?=
 =?utf-8?B?d1hkUUxBaUV0Q1N4Yk1tMkxNQ2M2NW9PQ3VyaXZKQThDbXdMWWgxMGU3Mjlx?=
 =?utf-8?B?SkxEQnVBT2tsRDhPbEpyVFA3RndBb1c1cVd1a0J0WDVBQnM5RTJ6aC9SYlJp?=
 =?utf-8?B?RWF2Q3pVNDNDYlJFNzJkSlFKTU90b1M3alNzOGgvWTMzKzM4ZGkxVHgrb1l0?=
 =?utf-8?B?ZDVJTTBueExvR0lpaWswMTVqVVVxdkZQczV4cEVlT0lUMDRXSnJhR2t5NmJD?=
 =?utf-8?B?NGFaSzBmVGlFdlpnclN1NEZFajAxKy9hQjhqMk9Xci9xNWt2SE9CNUc2d0dy?=
 =?utf-8?B?WGN1dmxTUGVyYUY3RW1uUWpMdi9TVlcrWDhIKzlXZjVzclFaQ0RMQm94Y3Vo?=
 =?utf-8?B?Qk9OUC9xVnR3RjFmYUtTMU5ENzJnc3hoL1JzZ0RtYjFsS3QxMm5Uc3JmYnVY?=
 =?utf-8?B?YXpKQkttOVgxSDFJamkrSEQ3SDVNSUFibHRDSytOOC9Qa1BKYmtHblJCSGw1?=
 =?utf-8?B?WWorVytOcGY5Rm9uVmo0WTlocnNOTlVRYTM5UGVNWDZXRXRkczBWbXdQVytx?=
 =?utf-8?B?eEg1Ym5lS0RBZjFKRTBjNWlYa2hmbHoxMXIreFhJdEZhN0ZjNGVxYVRHclhR?=
 =?utf-8?B?NHR4NktwRDBXMldKK1JEUTB3MHhNN1ZrK0NKZ2FYY2E2K1g5Z1NWSzdHQ0pr?=
 =?utf-8?B?bmh5a3lFT2dqUlk4djZ2UE9FYmN1Z1ZOa2tOMWZadHpOM0UwaUtveDdqdUhU?=
 =?utf-8?B?WjFldEYvNEEvcXlQSmNpTklYSW9iZ2FHOFFXeXZPMTdURnVFd2ZNSm52Mmxy?=
 =?utf-8?B?VUZiSE1ZS2ErelJrdjd2WCtlc285RzhaMUgyd3NmQk1wVVVKemFBWUZkZnVl?=
 =?utf-8?B?MHZUVnBkbDNSZGQxZVpZTWJTeUN3Q1ViNm15NFZYQ1hGb0NjUUkvOTJ3cStD?=
 =?utf-8?B?eXUrUDJtYlBFK1NiZjgxZzVWY0pUQithNzllZG5udVlwQmVZNnYzUXpSMkR2?=
 =?utf-8?B?WU1mSFNoODV6cHV5cVhidXBRbzk5U3NicmRuV1k3b1JUNWJ4VVptZzk2SFl1?=
 =?utf-8?B?MVcwU2FMVlVlbm5UQ29sL0I2VFU0VWtvT3FjOE9DQnJuM1NYQUc0cDhwYjg4?=
 =?utf-8?B?Uk5yVFBWa3pDMnpQSEdhcnJMWkY4WGVjdGlqVlJxS0JGM25KeEM1TFI5emhh?=
 =?utf-8?B?VEtsWFMyNFZNRThhcnFiSXpqR25wL0hUNHRBMU1saG1jei9zek1PbUkzYUxI?=
 =?utf-8?B?OE03aDEzQzVPVExIYlFmQ3dvZ0t6c2c5Zmt4UkhDMFgyMXA4czhRVHlsSUxn?=
 =?utf-8?B?aDJqWFY0ZXRPZEJ4MVhLUkh6dTQ3VWgrOHJ1TXl1SWRFYnZ6b3BZTk93Umcx?=
 =?utf-8?B?RVdWenE0MGRXUjloS0MvaUU1dktMZHk0ZUVrNytzempNVXAzVk9HU2JkSWdX?=
 =?utf-8?B?RG05ZmJkZmFad0JVbWgxWG40WEpZZU9XaTZKVi8yZzFBUVF4ZlhoWnBWTFlP?=
 =?utf-8?B?bEJ0Zy9BN3JHSEdZTkhuSmdndytPZEF1Rms2TjRqL3F4bjJDQml6NUtKZU42?=
 =?utf-8?B?K1h1YUxqdlJsTmhBcDRDRmJWOVZaTmhpV3gxTEFqYlJ5VDk0bzVnZWl6VWEz?=
 =?utf-8?B?azV1anhCODJPeS9uL0xzdW5wSm12SndvRDNFbDRtcWlXbTdTekdKdDZlZXN3?=
 =?utf-8?B?cE5kZ3RhV1MzVWh2MlNoOWk0NC9sdGE2Y2VOVzFDWDI3eE9NWjJocXBHbW5l?=
 =?utf-8?B?bkc0cE5sOC84QXJoZHhoajFzeEpKRUxmVTJhbFczaHo1VEpZUS9PcUo0c2JY?=
 =?utf-8?B?M0lzQVQ3dG45SE9DZnViOFkxQ0JZV2g2eUptUHZ4cXMzVlorMWRhRDhNQUZr?=
 =?utf-8?B?V3BENzRBR3krYlRBUlBPK3lZTXFpUktHWTZaY3Y3eGNsb0l6dWp4QT09?=
X-Exchange-RoutingPolicyChecked: F8pkiFN2RM0LZYX8DpuAPkBxoFL4ZyTeCQRtomfl7AAhtbJY7BRMPjV1+D7XgGBr+FX9F7IYXB5QWV0kQXwokSJvwdemBb6iyYFQLotbl5wAW56QoL5xJYIr6ZKB0d/r8y2E2qc8XHZ/6Q+JufBngiz1sqQJmcZwpK/VcyCEXDtclks19EMePaMRi/dilUiOsHYNfP1r+wk4J8cm3GR9n8c5XK+4sZQtx6+GuRNRQ06+xhOGIGtiIEC3OmhAFrJd5qebJQ2Runn5qxdKbXbZ7IMYUZbg2t5aYycVlRNUrC0qeYDMjPapUq0iHVDAZ2pdGM2AbN6cMkH4DYEv5dgpRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a7a404-b6ce-4cce-03e1-08df1d11606b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:34:18.3834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocdldZOcThsKkcCWZnTN7zNdLl3+dxfqDWWD/OcSRQlcJNB6AfDHth4Cr6mei9OryUjWghCxTgRu5ZznJ35aiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8553
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


On 9/22/2026 10:46 PM, Jia Yao wrote:
> The process-many-stride-mmap-new-huge subtest forks one child per GPU
> engine and, with the MMAP|NEW|HUGE_PAGE flag combination (without FREE),
> each child accumulates up to n_execs * SZ_2M of anonymous hugepage mmap
> buffers before freeing them at cleanup.  On constrained systems the
> total peak memory (n_engines * n_execs * 2 MiB) can exhaust system
> RAM, trigger the OOM killer, and cause the surviving processes to time
> out waiting on fences (ETIME / errno=62) rather than failing cleanly.
>
> Add igt_require_mem_kb() that skips when MemAvailable is below the
> estimated worst-case peak and call it in processes() for the
> MMAP|NEW|!FREE path before any children are forked.
>
> v2:
>   - use igt_skip() instead of silently returning (Nishit)
>   - also check available memory in test_exec() for the non-forked
>     (many-/threads-) HUGE_PAGE|MMAP|NEW paths (Nishit)
>   - fix subject prefix and use ASCII '*' in commit message (Kamil)
>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 39 ++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 305512dfd..45ec62813 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1173,6 +1173,24 @@ static void igt_require_hugepages(void)
>   		      "No huge pages available!\n");
>   }
>   
> +/**
> + * igt_require_mem_kb:
> + * @needed_kb: minimum required free memory in kB
> + *
> + * Skip the test if MemAvailable is below @needed_kb.  Used to avoid OOM
> + * kills in memory-hungry multi-process subtests (MMAP|NEW without FREE).
> + */
> +static void igt_require_mem_kb(uint64_t needed_kb)
> +{
> +	/* igt_get_meminfo() returns bytes; convert to kB for comparison */
> +	uint64_t avail_kb = igt_get_meminfo("MemAvailable") >> 10;
> +
> +	igt_skip_on_f(avail_kb < needed_kb,
> +		      "Not enough memory: need %" PRIu64
> +		      " kB, have %" PRIu64 " kB\n",
> +		      needed_kb, avail_kb);
> +}
> +
>   static void
>   madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data,
>   			size_t bo_size, uint64_t addr, int index)
> @@ -1508,6 +1526,16 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	if (flags & HUGE_PAGE) {
>   		enable_hugepage();
>   		igt_require_hugepages();
> +
> +		/*
> +		 * MMAP | NEW without FREE accumulates n_execs hugepage buffers
> +		 * before cleanup; skip if that would exhaust memory.  The
> +		 * PROCESSES path is checked before forking in processes(),
> +		 * since igt_skip() is not allowed from a forked child.
> +		 */
> +		if ((flags & MMAP) && (flags & NEW) && !(flags & FREE) &&
> +		    !(flags & PROCESSES))
> +			igt_require_mem_kb((uint64_t)n_execs * (SZ_2M / 1024));
>   	}
>   
>   	if (flags & EVERY_OTHER_CHECK)
> @@ -2228,6 +2256,17 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>   	if (flags & HUGE_PAGE) {
>   		enable_hugepage();
>   		igt_require_hugepages();
> +
> +		/*
> +		 * MMAP | NEW without FREE accumulates up to n_execs hugepage
> +		 * buffers per child process (one per engine), so the worst
> +		 * case peak RSS is n_engines * n_execs * SZ_2M.  Check before
> +		 * forking and skip if that would exhaust memory, since
> +		 * igt_skip() cannot be used from the forked children.
> +		 */
> +		if ((flags & MMAP) && (flags & NEW) && !(flags & FREE))
> +			igt_require_mem_kb(xe_number_engines(fd) *
> +					   (uint64_t)n_execs * (SZ_2M / 1024));
>   	}
>   
>   	map_fd = open(sync_file, O_RDWR | O_CREAT, 0x666);

LGTM

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

