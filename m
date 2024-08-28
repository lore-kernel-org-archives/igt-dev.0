Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579CFC5474A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 06:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B4710E152;
	Wed, 28 Aug 2024 06:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9U9i4Md";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7C210E152
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 06:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724826598; x=1756362598;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mKdm5iEFXUVoYJ05xaEEvGBu8ho+lqwGcXr3e+18apQ=;
 b=V9U9i4Md9GF4JVBKD8mHinmtvyR7fYg9gt0+ngAJpMusflhrQObRhtgI
 gB4VwVXQNIxlyoVeI8OdPpzDUMzjRycE6BLHbS/4hLEO9+du9SjZ+LfEX
 FsmxSeUkvd2A+QAubCLEbqG5hb8KVjBe8+5Sr2gOtaDG/5vx199tpztJa
 igml3JCFkxBdinwxwpa1ZD9bBAkrqD12VR50RvDFZW91PVjgCeUK4hCvD
 Wq6qqnY5jilf2qKcAKlGRHN+UIqfb1QObrOzBqFw3TNdNBBR/bMwH63iK
 F7tM9BYUK10MHuvcYWn7SFt1RVD0qcnv+GSyTOMfUqleKyOf01oM15s+7 Q==;
X-CSE-ConnectionGUID: Yv6ZvyMpQAuY/tDyGB8RYg==
X-CSE-MsgGUID: WqQbKCjSR+CULCIUn8nuzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23203402"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="23203402"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 23:29:51 -0700
X-CSE-ConnectionGUID: Ac0C/1nkQhejU12q1zgGUQ==
X-CSE-MsgGUID: Rt8jXnt9S7msxnTN8KuKSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="63632541"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 23:29:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 23:29:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 23:29:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 23:29:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 23:29:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/3IPbt/vuKkUrTkSR+SVVbRJgqy+u/PWPB23uN7NYDhmlvbwzv1hF4HUaDRV42Sm+IabK/U31NiUvy3cIZPLlFttW6fvyV7KN694hfOc+CON3/L7WGc3elYgIDSmG32QKtdTW9ry2iJlD+TrPk0yBGu7QZvSyRsbzua+MtJOaO5N/KPeEFwQy4SdDvIpZ1i7byFhVFUlzUcquHVfjdbRvUQuIlyHVgS432lg6JbdJf6t4/GXnS4tB1pH3jnaGLehO/UFpO36vj3rENBV/+MKrn288Tcee6p0ALZOOWX1N7bHGhBqyTKcuSRycU5w7FGFStgEmLIHBTqWnR79G/q2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LyVeDJEPn4jBfHt3uOSyrLJmVAB/W88IiWRD1Y9E6A=;
 b=OIHedDkvMuXfPNQRUwWyfSBCMBi2UAKB/7CksT4/GduZVO62DVJzf8T8CYfOhVJGzHqb3WoNKO1whH6HpB+eSydeTp7pYA1P1u3sJRBiiMTC1yK03h5KKp/96YBF82notrVc/2ousyASvxPT14kkvV+1Clf8gQwMvaX92p8JOOhdTAZK0PT0ps71OXkrLdYly2YJi55K+uFXJFIpt20fatMtAHCpOH0T9FyPMRUqG8XFdZDTHNT3zsJvBO4m5UlLrto7QTU83EKa8fmFZL5LDcBiQfwLYgOSmCGvC2rvQzQH2iAoEdveNEUdsYHdU1B4xrHSHQRizMYy4chC0p+5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DS0PR11MB6424.namprd11.prod.outlook.com (2603:10b6:8:c4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.24; Wed, 28 Aug 2024 06:29:49 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 06:29:42 +0000
Message-ID: <2f18f085-4d7a-42de-ac40-f2c301bed303@intel.com>
Date: Wed, 28 Aug 2024 11:59:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_3d: Add more logs to skips/failure
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jeevan.b@intel.com>, <sameer.lattannavar@intel.com>
References: <20240828043319.1012315-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240828043319.1012315-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|DS0PR11MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: c19c0aae-82ec-4835-c266-08dcc72acd2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1Fidm1XdkZUS2JDTEwzdFA5R0RxYlovejZrTGFzMFViL1dmMlVXZ0R1Sndq?=
 =?utf-8?B?bXROVGNabEJIR3l0SktEZ1BjQlovemhUOE5URXZ2bC9MYVNkakxQVERQN1RS?=
 =?utf-8?B?YWIwVmJwcVBsNmpjclQreSsyUnJyYWk1V213WmZidGZDUmNWd25uRnNiYjU4?=
 =?utf-8?B?NWEzMDhXODNtSGtJbjR6aWpRRllHVC9hN3ZJMzhqVVl4TnU2eEpTVEZqM0hP?=
 =?utf-8?B?WVNuYk1ZbWw0ak5YVklOUk1haXArZmFRNTVHNFA2b1ByTEpGSU9QREUwM3BQ?=
 =?utf-8?B?S3QrVVZpQ1JHeTMza01WMkIwc0FQT1lwb2h6SFZzNHFyV00wMXAwR1cvcmd4?=
 =?utf-8?B?b3lYdjN5SWNyN0lQampxNnAycmJOUC9vZ05GRkN6ZG5Ya2RoZDFoMzRWMTFN?=
 =?utf-8?B?NklHTlVGTVFxN0czbXNhcTI2ZDVVRUcySUtvbmg1ZXpPdEM3RW9FWUxWT0Zo?=
 =?utf-8?B?YTBhelNSOTVLdkZnc1FINTdPZWVkUXdGUkdKYkNuZ1BrSFh0dGtWTHE5YndP?=
 =?utf-8?B?N2Z6dEVBQnVlMXFWY1kzdC8zRFdCcktUaEdGWkkrV0h0aWRQY1VkMlhrS3Ar?=
 =?utf-8?B?ZnpCS0U4OXozaS8wVStpV3N2YlZPd2dqQ081cEhFV3ZFMmtyMGJ6SzNiS3FJ?=
 =?utf-8?B?aUxRQnlqOFE1OWhpMG9JRDRsUWQrc0I2UHJzUExma3E2U3QwbTc3V2Rab0ds?=
 =?utf-8?B?QmFhWElCZzJpSnJXaTRIYXRIOHFxaWdOMDhxVHNjWWY1M1c1bFJzWlkxMDdD?=
 =?utf-8?B?UUJ0TktHbTRPdUNwaEpTNkhMTlJlMS9BY1NsTlZxaFlkakNsdzNONUNiMGNl?=
 =?utf-8?B?V1lpMS93RHdPZmxmVExsMGJTS0c2SWlrZkpTalcrMmtmZ1dob28wVnB5dDQ3?=
 =?utf-8?B?TGhNM29xdThlSDF5VVh6U3N5K0cvemRpVzN6VjZHTHpHK0tOWk9EOCs2Tmh3?=
 =?utf-8?B?NTZTbXJFR0VqQjdkbEpCRWtYTlVMQitFdlRXcUN1djhSZGt2MVV3RDlrWjhh?=
 =?utf-8?B?NmZzamxGRlhIcmc3U1lZcGFIQ2IvR2lTTytwYlBCV2xPR0h4Z1JtR0dWSndH?=
 =?utf-8?B?bHp5ZVk3am1lUHJENlROdk8vcVJySjA3YXJQSUZaOXVlcG9oTDNyNWZXQ2Nw?=
 =?utf-8?B?TnAyYjJlbG9pODBhbGR2SjVNY0hNQzR4VWNpM3VnMVhqR2wvWlVFMm54bEFy?=
 =?utf-8?B?U0Npcy9kWDZTTGJ4QUFQVEhjTk1oZDNaYmJ5Y0lLdXQ5S3NISkpDVGFmbGpp?=
 =?utf-8?B?akc4U0ZPTWxFNkgyRXlzcm94Qjh4MEszZWxqQ2EwNEhqSE1HV1RtYml4RGxk?=
 =?utf-8?B?c1pma3BPWWE3YUpScWlaeEZocjRBZGNPdEs5aUZ4ZlFXejhPNyt5aFVmbWJm?=
 =?utf-8?B?Tk5EWG5EUHlpMEN0YzVqV3ZIVlBDdzdxYnovRy9pUDRhV1ptQzl2MVh2Nm1P?=
 =?utf-8?B?VlYwSHZoczlKMFBzNDF3RjFQRm02c3AydzluNDdSR2RkNTRNOEpHeHd3R3Zq?=
 =?utf-8?B?TWdBMkdGaDhCbCtUUGRVeGZwRzN3QjQ5ajAzdVNBNTcrdHdJT3RuT2xkdEVV?=
 =?utf-8?B?WDlCZEZ5TFdVTmsvTmQ1TGVqWm1rdEhiNFcrcEJLdURpOGdtV1BpWW5sVGI2?=
 =?utf-8?B?RWp5bDNCcXBockZyaHhRS3I5UWNBcTNRVU9KVmp4V0N2VjZ1RWNXbm1hb3Zn?=
 =?utf-8?B?RlIrY2E5Ry9La1N6SnVaY3pkZWllR293b2RzOE41K0t3cERsd3NWekQwQWg3?=
 =?utf-8?B?Wm9BelZxbkg4b3RoME42YlU3NGNwT2xZZURZU3F5REpVYmp4QnpWelFtUVdZ?=
 =?utf-8?B?WXBNUGVIeFRueVJ3QlNrQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWZlc21kUmJCQUhiK0txRU54b3FNa1lNVjdlZlVxUlJkUlF3ZDFqYnNld1Yv?=
 =?utf-8?B?YVNtNGpZZ3Jsb2xoUGVGTjkxYTF1dmxlVDhqMHFabW9qeXJsZmowS2xqeGpP?=
 =?utf-8?B?QmdzUFdGYkZERXhuZVg3OVZOWThXdE1LbzZpbWpRbE9KbTRUaDl3bFZITzhV?=
 =?utf-8?B?WlgrdWs5ang4TUVaeTZRUjhhWHp0Y2VuZWE0aklia2RuSWViU3dNUXVSOXpI?=
 =?utf-8?B?eHRhOEx5MllKRXQyT2tHM0ZYdW1aVkxoK2drU3gxUTF1Lzc5akQycUhiRnNs?=
 =?utf-8?B?L2RoUTRXQ05vV25IWTRGY3hVUHlQeEE5R1RQTWtNK2RhcjM2QllFbUZrTC9u?=
 =?utf-8?B?b1JMNHdTQTVhN0RXQUJrQzhOZEhLeTJlWjVKcUh0NS9pUm1kVk5CSUlaOHkz?=
 =?utf-8?B?QzZUckR1bnJBMGVaM2RLbHBObTdPREg5NnRBVkhVb2FyZ2wyaEthblJHM0Vr?=
 =?utf-8?B?LzNiRG5yV0ZUdHQ2RWx2RWNnMmk5OXlwNlZjSCsxTVMvejJuT0thRjQ5Slpk?=
 =?utf-8?B?c1dOR3pYL2NQUzFqWmdSWTJKSFU2OHlXRHlXQXk2aW9hRHhTcUlOa0I3M3E3?=
 =?utf-8?B?Tk1XdWRBbFd0MWNnVUQ2eVdpUmM2QkJlSDJhc1ZpMWJnWGpuL0dFemxZVnRy?=
 =?utf-8?B?VUU0STRhWFZKZHVlTDF6TnVka1hZU0pwZFBMZmlEYjg4b0p6Zm1EMHBWa3pp?=
 =?utf-8?B?Yy9tYzNWbTJ5bEgyY3o5MTVTSHgxZ0JOKzVRUlVmOGRXOXd0V0tlNFNJbU1q?=
 =?utf-8?B?SDdxTCtKWmVZQmdWaUx2SHBJQzdsTGFRNzU4emdWU1g4Q0VrM1dZS0N2ekxy?=
 =?utf-8?B?U3JNSi8rQmFpL1N2cUZ4TTRBNWFyanFLeUJrcHY3UHRjaGRHZnV6RWpyQUgr?=
 =?utf-8?B?aklxaVlyMy9WT0FBQ292VExoVXJ6Qk4xQzRhKzBRQ2tJZER1RFJrOGVFMHhq?=
 =?utf-8?B?QVlwaC9SbEJNaDFTU2lrQ2V2YWpKR3FPQURPQnBmVGdmbFZzUVlPek1zSEJG?=
 =?utf-8?B?T0lDU1N0UHczUnAzejBMVjZ4V1lNazZNSk5XVUNPS3cvZGpSeHg0ZCt1UHBh?=
 =?utf-8?B?UW1NR3ZZdVV3eWl5TVhhVno0dlBDcmxFMDJBYWR5Mis5dkV5bHBzYk9kUXFU?=
 =?utf-8?B?Z0k5ajU2c0t2cUUzM05ybWtkV3lKSitPZlRkYkUyZ29rWHpHNmRPanI4dUdU?=
 =?utf-8?B?bWVPZFRnMGY4R3ZTckNsbTE2dlF0UUFiRy9DWnEvOHZCSzQxM3B0S3lSeXBF?=
 =?utf-8?B?RUgreUtBRHpMc2FqM2JhaHZlb0Y0V0JaZHN5UUIydDErOHp0RldiQ1dpQW5Y?=
 =?utf-8?B?OGNkS3phY0Jpb2JqSG5pNktURmlBYmRrS1Jpb2I0ZVF6RmRLZTNoOGxhMHNE?=
 =?utf-8?B?RDJqL0tjaGNpTGMzd1U3b0FXam00bkJzTXhLS29aMjhENjNMYUN1L1VjL1c5?=
 =?utf-8?B?dHJLNXFoMXAzM2E2NEx3OFI3NVg0MU0wNUx1NnorVzFUVUdhekdQdlROdVd2?=
 =?utf-8?B?ZHd0SUthVVV0R0o3dUorUjlBaXZWSThlcU52eWMrelpSRkE0OEpINXpxcjU4?=
 =?utf-8?B?Q29SU1BSZVVWbVNMQ05ORXdtMGh5SDBPZXpkQWNESTRjeldnWjBpcjZJd0sx?=
 =?utf-8?B?RWl2aDBKSkoySDUyQ0hzWkdsZmd6YmlxRW5ZK3JML1AvZ3YxYkZiNjZ2WTdB?=
 =?utf-8?B?VHRyYkF0eFJDY2J5ajc5c1hzYnAyTFh5UXBpVEsweFdJbmU5SmRYQ3R1Qnk0?=
 =?utf-8?B?czBRMnFtMkpRT2hsaDlqa1dIdy8vQy9HWTZkNW1KMUJBcVMxRVI0Vk9pRlBi?=
 =?utf-8?B?RnJYa205dGZJdEZYZmQxYUsxdjBiZmNEZnVRS044TXpVKzM1eXJySDVyTG41?=
 =?utf-8?B?STlqSXJEdVVUUjVmK1cwMlRBZkhkcTBxdnkxMXI3MUpuSUtzeWYvQnhjOFRi?=
 =?utf-8?B?dHRCdnd4M3lzZUFJbXZLRyswVklYV0EzbmhwdUtRZlFRRlZkakdJVk1GOFk0?=
 =?utf-8?B?SmVObzYvWVRoR1BrZWlDMlp1eVRwdWlOdmxhdnVmRFk4YTRZZU1pMVdWRUk2?=
 =?utf-8?B?VC9NWnpaSU1LR0RCZGppeGtQdzRQanBmNTdvTzR1aGJKQUtMWU9Yb3VWd0Y1?=
 =?utf-8?B?Qnl3emVhYXFKd0h5eWZzUktxOG0zRklseEZHQUg0QUdmUEFnUXp0cTlFM3Q5?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c19c0aae-82ec-4835-c266-08dcc72acd2c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 06:29:42.8079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNrtp/T8J66lzjTIQitDcYFlvpvB40QcsERfTAGk+l1dodDl1kb5cHnYzgfQ3fLYFsqLNpCLaOaEi0XA1J2MDsXQr1WdLUV+S5lWBLHoijw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6424
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

Hi Pranay,

On 28-08-2024 10:03 am, Pranay Samala wrote:
> Having some logs for test failures and skips would
> make debugging much easier.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_3d.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_3d.c b/tests/kms_3d.c
> index ad6c45e9b..66c2ddfc1 100644
> --- a/tests/kms_3d.c
> +++ b/tests/kms_3d.c
> @@ -55,7 +55,8 @@ igt_simple_main
>   	res = drmModeGetResources(drm_fd);
>   	igt_require(res);
>   
> -	igt_assert(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D, 1) >= 0);
> +	igt_assert_f(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D, 1) >= 0,
> +		     "Failed to enable STEREO_3D capability\n");

I can feel this log is not required, but still it's upto you.

>   
>   	/* find an hdmi connector */
>   	for (int i = 0; i < res->count_connectors; i++) {
> @@ -65,7 +66,7 @@ igt_simple_main
>   		drmModeFreeConnector(connector);
>   		connector = NULL;
>   	}
> -	igt_require(connector);
> +	igt_require_f(connector, "Unable to get HDMI Connector\n");

This message is misleading like "system is unable to get the HDMI 
connector event though there is one connected". Please update this log 
something like "NO HDMI connector found".

>   
>   	kmstest_unset_all_crtcs(drm_fd, res);
>   
> @@ -85,7 +86,7 @@ igt_simple_main
>   			mode_count++;
>   	}
>   
> -	igt_assert(mode_count);
> +	igt_assert_f(mode_count, "3D modes not detected\n");
-------------------------------------------------------^
Please add a period '.' at the end of every sentence.

>   
>   	/* set 3D modes */
>   	igt_info("Testing:\n");
> @@ -95,8 +96,10 @@ igt_simple_main
>   		int crtc_mask = -1;
>   		int ret;
>   
> -		if (!(connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK))
> +		if (!(connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK)) {
> +			igt_info("%i: Doesn't support 3D MASK\n", res->connectors[i]);
---------------------------------^
Adding the connector name to the log is more user friendly.
igt_info("%s-%d: <your msg>\n", connector_type, connector_type_id);

- Bhanu

>   			continue;
> +		}
>   
>   		/* create a configuration */
>   		ret = kmstest_get_connector_config(drm_fd, connector_id,
