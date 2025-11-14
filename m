Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A792CEACC6
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 19:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5AC10E25E;
	Fri, 14 Nov 2025 19:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLgTOzni";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DF810E25E
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 19:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763150031; x=1794686031;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oxZwS4GPeEhTO79iRMc4wWzlKJkuAX8BoO7Tvnsyxns=;
 b=bLgTOzniugXN9WivSKBWVX5ljdoEL1a3rVeclNJiLcJwNe+9mX/c69H+
 OnZCZraMdDdao07thG6rCFhTRwYIiD2KMYAsMf5N+l3n5JL5BxLMiyjKl
 cHbDQdg07kbJCvUldv5Zgs5RG2JxFhWKR/m+lJq9nuOBkKcWzGQ99Owld
 PGnDy3bzdB6Uj/Qztsep8trX//tgbp6IzQdYHrc+jBOvmvLtJ8EisLxlb
 x3B+O/vadJjcGgXNaDuAMvt9LgOxof8vfBgyh+qy2OqbVc1NeBto/4tcJ
 oWK+ZYgSMbNHlfiiluomgkuu8ManRCRGFjNF7jCBRSNCksFGq0oPfVzNG g==;
X-CSE-ConnectionGUID: +R8zCGupSrCeOpycVSqXHw==
X-CSE-MsgGUID: F8c9qH8kTgWakyIp8+Epiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65154061"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="65154061"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:53:51 -0800
X-CSE-ConnectionGUID: b5QwHbWiTd6R2ylkRloJ6g==
X-CSE-MsgGUID: avOd/pcjQt6L3XNHBfnizQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:53:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 11:53:50 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 11:53:50 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 11:53:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hnx39QsIdueIruWQlNRgRmX8y/xrRpSkcjVp9SzObC3+i2iXw7ym/p3yw1F/DiSbKFsLBW8oK/onZ0TdWbYwGDdu1tcdnjYNgHuYmKNUSqEuY+suDEV7K4CG3x9KxPOEYoZRGHEVUsBduSP/G9hXS+560BjGDq1p/KvJC7TgEUHxJdua7dqnCDW6wtILx9osK4tTJQrigBcGg6jA8Kc8RLYQYdKaTZCCfsx1t5IEdL4WCDB71QY2AsL9L+GvwTqskIdiZSYiL8kpGtxcRSZsAdWLYQ3rGxifczGX5vUIN1oa8KCMdkr3+lWg6ivi5dSppMSrOF8aAI3Z04jE/i8dJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGSIfbn+a7h0hCr+OIBPenC1thZNiybHOe0702aUjhI=;
 b=g8nOOkhU4l2JL4IpccmQzqh00iDY9qbt2QSocT4bnCXo+NItf7mPc/vwv7ujv0XiLllULn8wgLDTSnkIUHw6RBdiQcJ4p5t7LzPG9L3VobRZLrOvATt2Ihr8UCH1KL2gk1mgyWs+CJhvu5Fxk9nhN0DsZ6lkBwL+PkB80jgHzIDadDwyXrqJPm1piJ2Xr1nzFOvCq/9/M6usXImpL+wlLLj6Qn1k9QgMxw7iBLL5ZaW42HYYrbp2atyAmg0Vf4RnKXmIZ4mcK0pGCF8n4yhp10GfFg575SWMlnHyBSSHK6H/rthWM2n0bYnu79Gb1z9ZmaeNyn3ZEr8n1Mw0hF888g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB4771.namprd11.prod.outlook.com (2603:10b6:303:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 19:53:47 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:53:46 +0000
Message-ID: <87cf5659-2bc5-4674-b027-1539c2928954@intel.com>
Date: Fri, 14 Nov 2025 20:53:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/5] lib/xe/xe_sriov_admin: Add SR-IOV admin sysfs
 accessors
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <lukasz.laguna@intel.com>
References: <20251114190757.2295174-1-marcin.bernatowicz@linux.intel.com>
 <20251114190757.2295174-4-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251114190757.2295174-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0234.eurprd08.prod.outlook.com
 (2603:10a6:802:15::43) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB4771:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e1753d-ee62-495a-e197-08de23b785ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlQzREZjMVprdDlDSm1ncTN4VGhHWXFjaUhmQjhLc09MZ1E2SkNlb1krblpr?=
 =?utf-8?B?a0pnWlRBTnNkeDE4WWd2TENaUGFzSTJPZkR2UTlKR0F0OWVuQi91cEpReTdz?=
 =?utf-8?B?UWhIVStkZS9aRGZqRlZrWkE0VEpQOW5OdXZPREtnd0txMUpvUHhSYVY5M1oy?=
 =?utf-8?B?eXNhMERCNU00YXVNYm5HYllRb2dha0VTRUc5Nkk3NVkrZ3BtMmhCV0wzaFo2?=
 =?utf-8?B?MTlZVER2cDZxUmo0ckFuWVEzTllkVjRLMjVqRlpIMUhTUDB3cCtJWWg5QXp6?=
 =?utf-8?B?YVBaWC9kY0hOOElneGw1ODVCN3NLTWk0cjY0bEgvMDg1d1NlekpSTDF4MXJm?=
 =?utf-8?B?L0s5SDlIMUVLTmpaSTlzTmNOUk9acEtvZkcxUS9ncFJxSXZqYlljRkN2RWJZ?=
 =?utf-8?B?aThIVGJSNkNhMWUwVWh1cFd5eVFvem1GTnIreXRuVDNRVmdPbEN2RFNaY2JD?=
 =?utf-8?B?bjByUVdzcmpyOEU1Mk1jUTdsZ1lGa0o3Wjl6dE9oQzhjR0pxL3lGdVM3YXhp?=
 =?utf-8?B?bExjV3FZcVplV0Y3UEN6eUVJT0NaT0FSVzNoZ1BIRVBYZWRwZHpqbldFazdK?=
 =?utf-8?B?enBwb1UvbWdiTUUrSWx5VURnUXhJSm1BcE5KcGRZQno1R3U3Unp3SDZMZWll?=
 =?utf-8?B?SE5HVSs1aVVwZ1lPeWFKSTdjSlRMblVjWmkySit1R254ZkUzQllKc240Si9K?=
 =?utf-8?B?MUlWQk9rdE9TdElZNnhYbmxUZXZTODBWNit5M3ZpL3lMWHVpTGdaR1J2SkNO?=
 =?utf-8?B?VUNSSHNJaFJhQk8vZExBREErV3dubFR2VFh4SjB0NEEwZUllVzVwcVpQdnlk?=
 =?utf-8?B?UFVkblhsUHQwUjNjcGkzODFpaUdEQzkxTVA1S29DUFNRMWF6cEpKUUtNNWZH?=
 =?utf-8?B?dTVNenFWRjNLWHV1UHBRRmNIc3A0TmtWYXl4Q2lIWmNhNDg5YStQNUhyeEFz?=
 =?utf-8?B?WVFrWFF4dDQyaElvZDI2cmRlY1lFTkxhd2RFWDBHVEFuTmpiTy9mNU50b3VN?=
 =?utf-8?B?UFRhYlRjL3dYTGRiTmJYQ2J1N2hnM2VZbHZ2eUV0OEg3QlR4OHpFeE1KYXRD?=
 =?utf-8?B?NU92UUNGZUs3eDJObllabVdmc01tZm1yTVhzZkR0RElDeE9VV2RjcG1UbHNN?=
 =?utf-8?B?c1ZGVzIvZU01SXUyeHNxT2NkelhpeU1mMXhkSnJBTmpUdjIwdHBXd2o3L2xs?=
 =?utf-8?B?V3AvUkwzK0RFREpOeXRJL0E2NjdxRWgyL0daQmJRbFpsYkJOUXR1MGlsMUtl?=
 =?utf-8?B?dzI2V1g4UlF5OFZYWTZ2Ui96M2dYQjVWUmdPeExGUW1pSmNMTEY4SkZVL0Ft?=
 =?utf-8?B?SG1kYkxodGtORENBSkIydXl2ZDBvV3RMZk9LZk9DTDJYVHRjR2tNWVdPdVhy?=
 =?utf-8?B?Q2h6V0dsd1cwMlV4cWlPdFRTcHh2MENWN2RIWWlyREp3bXhlb2dBS1ovLzBZ?=
 =?utf-8?B?aGJZa3FTN201YkdXOUFMcUplWHZBTFBqWndPRE1nSURSemFObkNqTGFCc2VP?=
 =?utf-8?B?UmxVYjBLOE9COGljTmw4TXdZQThNY1hVZzFUVXNYaDE2QSt5S0x2T1JpdFl3?=
 =?utf-8?B?Wjk2TDJCbEQvNG1Pc0VqVXVuaEpNTkdPWjJSY2JCUDFSVjAzQktWTFBabEt1?=
 =?utf-8?B?T01EU2lHeDlzWjV6MmFmVGhHSUZPcWpwUy8rT0tVd1JReHoyZms5emlTTGJl?=
 =?utf-8?B?cWJIcVJHaldlZDIyTXJweCs4eFdJZU5TUUFVM2RIVUd6NjM2YVc5VUtVM25S?=
 =?utf-8?B?NDJHck9QalZlZ2Z4b0hWU2tXOTZyUXBsSG94eDhtVXlXcTRzS3V3K2RwUVNW?=
 =?utf-8?B?RjBuVEI1V3NpNUd5ZUtTTmxMQytSUXF5cnJOMnNBY2hha3lUQTV0NWgzVDIr?=
 =?utf-8?B?cnRHYVlQUjZzQ09QRzhGNjlzaHFiR0F1c2hKeFMvbThoTi9MZDRHdTk4UUtp?=
 =?utf-8?Q?VEfWrMPkkdbd3sh6gN25sXz5v+Zf7NdG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEpoZHhjRjhaZytsUXMxdGd2ekhmZGVoQlpjR0t1NFJFV3dXVUpRSk5FM1c4?=
 =?utf-8?B?bkNOWUE1akhUczVHV2RUb1JOeDB6Slg5VHduZ0EyYU01ZUNsV25ySWpNRTBS?=
 =?utf-8?B?MEhDREJJMW5xM3BaQllKdENmMGxIelF6M2lBaCs0cVZWMEp4eVRCZHYramZH?=
 =?utf-8?B?TURzcEhWSjNidVp3VG9DeDBMZURLMzVWalVvQnNwaXpiL0ZGcldVcy9Ea3BP?=
 =?utf-8?B?RHNxWHIwVUEvYXBYbFNXeTJxV3BQelIyZGpmU2ZFenVmcmxQZzlkUjNRM1RL?=
 =?utf-8?B?SERtZzlDUmxVbk5wQnQyTFZ2WnZuNDZPL2tvd0o0Tk42ekh5aUNvWmtnb091?=
 =?utf-8?B?NS9RR0ZHR3VGdGFCY0lZYzYwYzJMVHlNY3dIYU9VUkJqYVFTRWV6OEROU2ky?=
 =?utf-8?B?OEZ5bElNS0loYVgzVkY3SklvYjBVemhVQ21NczFpd3FPWWpJVisxdkJwU1RT?=
 =?utf-8?B?NGZxOTZ6M0ExQnpqcXlFS3BSclZUd2kvMHg2ekw3NXA1SWpJQTY0dmpjeHZy?=
 =?utf-8?B?eUtDOFBITlEyWHJXTUV4b0xCWGdjbU4xeHVpOUYyaE5VYjdOSGhIcXpJQk1T?=
 =?utf-8?B?UmxYcnlraEY0SVpyWUZ6aUNINUl5cElNSmlsQ2I5VVc4SStmMEcvVGIyZHo4?=
 =?utf-8?B?cW5HT1JaMEcybDlUekhLREVvWGJoRVpmQzlTV2RYZnJrbkYvRGRKOE1Vbm1p?=
 =?utf-8?B?UjdyNVlTOW1ac3NNNlFLZFFYd3FpZHdIcDV4YzN3MWxqdGt0eUU1Q1pod2Za?=
 =?utf-8?B?VXo5bktSL0V0aCtiSTZuQUhEN0ZiMGI3VGZRZGdKdXI0SzNRS3FDcjFhS2ht?=
 =?utf-8?B?cVFFTnlKOUp3Q3pjMEkvNjhqTkNMemIzK0xPNHUxU1FtOEc4SE5EVEJ6SDRi?=
 =?utf-8?B?elR0NkdkY2pieVU3ZGdNdGxwYXRtZGJuWGdjc05qRUJmcmVSajlCZzZ5RFJs?=
 =?utf-8?B?Wm4yYm1MSE4xaWw2WU1Mb2U0cW9sZFFJREZTYW1vTVlTT0NwazcwMnhpWGpm?=
 =?utf-8?B?aUNLdGtGUUtabWc5QU1tQVFJdDkwclJvNjBvQVY0d0d0VmRYTm5leWUwTGVj?=
 =?utf-8?B?QjhGaEtCVFlYS1FqY09QMDNxL2JWY0M2cGp5clR4VkFqWEpDb2FaVXhXUEtn?=
 =?utf-8?B?TVI3Y2FWTmkvUTVkbXZwMVZXbEMyc3Q2MjNsZnRJSUxBQVlKNVhmcU5SUmFL?=
 =?utf-8?B?c24wRDRBWTdieFUwSUdpNnZzd2U3emJEYnMybFBtay8xWFRpSnl5cThBdmh6?=
 =?utf-8?B?MSsxZlhkc0hYRlM5YmJVRTFkNDVqWk9mb0lrbnpSWTIwWmVUdDRrdnhTMzVU?=
 =?utf-8?B?STYyVkZRQ1dDZ3c1SExWYTU1SEZYTkY1VzJVOVoxTzBmUnFvVVZydVFhK2pQ?=
 =?utf-8?B?ZnlQeEgwZ2hROFdON0ttaFJLeHZMMjVuVjRlZzFNWlJjdnV1MTVSUlNpdEdy?=
 =?utf-8?B?bVZFcE1xTUpOaUtFV0JFMGxnYVd0Qi9NK2lkUytRaWtPVzNQZi9pQ0xTeitG?=
 =?utf-8?B?QnRzencvOGhmZTROYkZYWHZtOGV3L3JKbFd4cHJoN0NPUU16UHNmV25vVnNX?=
 =?utf-8?B?ZmxTeFRsYXFORkFldjduOEhON3krVGhxR1dDOG5kUERkSXVoQWNVK2cyZWxQ?=
 =?utf-8?B?LzRYTVJwdzV2L2xwUVJ1M0wyRDBITG5ManVVQU5JWXNUYlV3dWRoSkh4Z1Nz?=
 =?utf-8?B?dHlrcEl3VGhoL2FzSkhTTy91dS9hUzdsMVhodFdMd0xTbHE4UEtiTVVZS3V3?=
 =?utf-8?B?OUYySzJodFJUQmVmTHVNMklTTjNzSnFmTHUrMVVDZ21UbTNMRUJqWTR0NFlP?=
 =?utf-8?B?RWlpSjhtT1kxV2toSlNpdUo1dkJYajRkTDVLaVhuaEUxbjRTVFo3cHo5dHBj?=
 =?utf-8?B?bVpQbUlWbnJ4ZVpxSUJKODJZMVh4R0toV0F4cEZJMVNzbDFobS9pQnZtdFVa?=
 =?utf-8?B?TmpLdUIwQTlPZDdPVE1Cckh5ZEhsS2xUbzY5TFAyN0JIZHFnSGFLUm9hVW9r?=
 =?utf-8?B?T016WWU0WkVkYmlqR280UU1McEJtVFBaR0Z5VUx6V0VyblhSWWxRdWtycXhP?=
 =?utf-8?B?VVJOYmlsZmN3UnRMRjFTaTlRTHEyNWtLWFZCdFhCT3VjblBzNWFTaFd1UTNo?=
 =?utf-8?B?c0pPVG1WUCtEZXpMZ0xCdmhTTVBCeE9ndGZTQjRvZlcrV2hYTlQ3UkZuY3Ay?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e1753d-ee62-495a-e197-08de23b785ec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:53:46.7549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5m7wV4NkZwlM9qCLyeGjYImvj13sfPmtvFt8vfW9DcsZOw6jVqBp/DT50NH/a27n/e3NjJO4PyLbuGcBXJGL8j8zL4C0XDaMzMFcLkGkFWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4771
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



On 11/14/2025 8:07 PM, Marcin Bernatowicz wrote:
> Reflect recent kernel changes and expose SR-IOV admin sysfs helpers for
> scheduling control. Add per-VF and bulk accessors for execution quantum,
> preemption timeout, scheduling priority, VF stop and restoring defaults.
> 
> Link: https://lore.kernel.org/intel-xe/20251030222348.186658-1-michal.wajdeczko@intel.com/
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---

...

> +
> +/* Parse a raw sched_priority line into current priority enum (required) and optional mask.
> + * Behavior:
> + *  - If prio_mask == NULL: validate only the bracketed (current) priority; ignore unknown others.
> + *  - If prio_mask != NULL: validate all priorities; unknown priority causes -EOPNOTSUPP.
> + * Returns 0 on success, -EOPNOTSUPP on semantic issues, or other -errno from callers.
> + */
> +static int parse_sched_prio_line(const char *line,
> +				 enum xe_sriov_sched_priority *cur_prio,
> +				 unsigned int *prio_mask)

the idea behind

	"When read, this file will display the current and available
	scheduling priorities. The currently active priority level will
	be enclosed in square brackets"

was that in the future we might want to add new priorities or the
list of supported priorities will change based on the platform or
firmware capability

so you should start by adding a function that just looks for the item
"enclosed in square brackets" and return it, and/or other function
that will return list of all parsed items and the pointer to the
selected item

then in other function you can try to match returned string to your
priority enum and decide whether you support that priority
or just rely on the returned string everywhere

> +{
> +	enum xe_sriov_sched_priority e;
> +	const char *p = line, *start;
> +	unsigned int mask = 0;
> +	bool bracketed, have_cur = false;
> +	char tok[16];
> +	size_t len;
> +
> +	igt_assert(line && cur_prio);
> +
> +	while (*p) {
> +		while (*p == ' ' || *p == '\t')
> +			p++;
> +		if (!*p)
> +			break;
> +
> +		bracketed = (*p == '[');
> +		start = p + (bracketed ? 1 : 0);
> +
> +		if (bracketed) {
> +			while (*p && *p != ']')
> +				p++;
> +		} else {
> +			while (*p && *p != ' ' && *p != '\t')
> +				p++;
> +		}
> +
> +		/* token bounds: [start, p) */
> +		len = (size_t)(p - start);
> +		if (len >= sizeof(tok))
> +			len = sizeof(tok) - 1;
> +		memcpy(tok, start, len);
> +		tok[len] = '\0';
> +
> +		/* map token -> enum */
> +		if (!xe_sriov_sched_priority_from_string(tok, &e)) {
> +			if (e == XE_SRIOV_SCHED_PRIORITY_LOW)
> +				mask |= XE_SRIOV_SCHED_PRIORITY_MASK_LOW;
> +			else if (e == XE_SRIOV_SCHED_PRIORITY_NORMAL)
> +				mask |= XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL;
> +			else if (e == XE_SRIOV_SCHED_PRIORITY_HIGH)
> +				mask |= XE_SRIOV_SCHED_PRIORITY_MASK_HIGH;
> +
> +			if (bracketed) {
> +				*cur_prio = e;
> +				have_cur = true;
> +			}
> +		} else {
> +			if (bracketed) {
> +				igt_debug("unknown current scheduling priority '%s' (line='%s')\n",
> +					  tok, line);
> +				return -EOPNOTSUPP;
> +			}
> +
> +			if (prio_mask) {
> +				igt_debug("unknown scheduling priority '%s' (line='%s')\n",
> +					  tok, line);
> +				return -EOPNOTSUPP;
> +			}
> +
> +			igt_debug("ignoring unknown scheduling priority '%s' (line='%s')\n",
> +				  tok, line);
> +		}
> +
> +		if (*p)
> +			p++; /* skip ']' or the delimiter */
> +	}
> +
> +	if (!have_cur)
> +		return -EOPNOTSUPP;
> +
> +	if (prio_mask)
> +		*prio_mask = mask;
> +
> +	return 0;
> +}
> +
> +/**
> + * __xe_sriov_profile_get_sched_priority - Read VF scheduling priority + mask
> + * @pf_fd:     PF device file descriptor.
> + * @vf_num:    VF index (0 for PF, >0 for VFs).
> + * @prio:      Output pointer for the effective priority.
> + * @prio_mask: Output mask of allowed priorities.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_profile_get_sched_priority(int pf_fd, unsigned int vf_num,
> +					  enum xe_sriov_sched_priority *cur_prio,
> +					  unsigned int *prio_mask)
> +{
> +	char path[PATH_MAX];
> +	char line[256] = { 0 };
> +	int sysfs, ret;
> +
> +	igt_assert(cur_prio);
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num,
> +			     "profile/sched_priority");
> +	ret = igt_sysfs_scanf(sysfs, path, "%255[^\n]", line);
> +	close(sysfs);
> +
> +	ret = ret_from_scanf_items(ret, 1);
> +	if (ret)
> +		return ret;
> +
> +	ret = parse_sched_prio_line(line, cur_prio, prio_mask);
> +	if (ret)
> +		igt_debug("sched prio: parse/map failed (err=%d), line='%s'\n",
> +			  ret, line);
> +	return ret;
> +}
> +
> +/**
> + * xe_sriov_profile_get_sched_priority - Assert wrapper for reading VF priority
> + * @pf_fd:     PF device file descriptor.
> + * @vf_num:    VF index (0 for PF, >0 for VFs).
> + * @prio_mask: Output mask of supported priorities.
> + *
> + * Returns: effective priority; asserts on error.
> + */
> +enum xe_sriov_sched_priority
> +xe_sriov_profile_get_sched_priority(int pf_fd, unsigned int vf_num,
> +				    unsigned int *prio_mask)
> +{
> +	enum xe_sriov_sched_priority cur_prio;
> +
> +	igt_assert_eq(0,
> +		      __xe_sriov_profile_get_sched_priority(pf_fd, vf_num, &cur_prio, prio_mask));
> +
> +	return cur_prio;
> +}
> +
