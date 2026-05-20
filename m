Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D31CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 03:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51CD10E05C;
	Wed, 20 May 2026 03:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7LEivSN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1284210E05C
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 03:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779248948; x=1810784948;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iuYUYwvY6cMbDX9WHwa6T2Y+S0lmHb8j5ShIlnJXKSI=;
 b=A7LEivSNzMZrsJ0B2hvGp9pceZAOdhF2F8dwKxfoLQMcAdtxhUFGBmkR
 OXIRdMv8EV8OdkMdun7M8RhQySooQpaCpIA/Y95mirfteFjWZ4bv8QPix
 LohdtYK8Sl/Ehuc0Q4NGkAjW+RVhCzwxsy9MzRZi8ZntCuL6CSCOSehG9
 Gn3WaRGoiOeaOZ4WFu9EH0IYAYjtmjNI8hdPHlxAC8ZOiaUGod0Qvf6Zv
 gklnv5ZTwtvkAVKfiJvFq1GIMHnAk/1fgBo5RpKC/bu9Axt7hD/PnUZt0
 p31mC+bW2okCZAN1MdS7YDur4qF8r4eVfrUu+/TMui7RUJrUJHIERKHov Q==;
X-CSE-ConnectionGUID: f7Cxl7LaRair5JKFNexgwg==
X-CSE-MsgGUID: KDdvFI+EQBq44DxX72mcvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="83757839"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="83757839"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 20:49:08 -0700
X-CSE-ConnectionGUID: 8sLXN/tASKm7mOfImJN0gg==
X-CSE-MsgGUID: DIQ6LER6Tu2y3+u4DolWnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="244287462"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 20:49:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 20:49:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 20:49:07 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 20:49:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BisqRan4kWxiRaXRNODnuxhqpJmZ1WnL8xqr8PpB/D2cBXh91HRqkXI8yL+YrW1lHIGuh0CV+vLW2m3oaJjT7p+nN5hunOV2Vt4HDsd77uXEy1fnrae3T0HDAle3Me3azZU19CU33MM93u4/uqeKkAIWRFaPOz2hzt/OgdwKQrbG1kWRSFqYnn9KQjtyFxqHJoHDEJ+SzMTixJ3eT820EUwST0AHko+IR2facInYK0u6KvweU9Bh3oGY/IgO6PawFx7OnokRd0b4apOY/e3DeYvHNj36tzlEAHFg2mHSZ8JNQ2atH3KBG7kwpoWNAHatPeMIhhYiDMkce5t5KN0u7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08In7F5/peJWXpXz4ufotIL/ecGcVSQov8qNfzUC4io=;
 b=PTeQwZapHYUHE6jryxlNvq+/iGX9wt16Z7XZJsVR3GkqtVjOlZB0lpSm+Lefka+jsYjy+udjyd9/agrvP1IiVCoC0p8GLJhkazd9QEI20NNqUiH130wV9YKskaZYx4qzFmLYS8x0zVopta0LDUuhAXLVE9ZOZxxQmzRh8Xg/WJvfBITkcjImJTZ0Q65T4OxcNyKwnpJP3YQwOyYwK568xsJ7OURBFPN6y45C+VzdpzPmEVWFiBSsIt8AjFrsM6ZmKSMc2oYIDwNpDoDCfRmYhIMjgqL1PDt7r4XHgXcGPuxOKfFpo7FtGQVzk3w7QVLTAn+1hoQ15Zf74Sk62XRE/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 by SJ1PR11MB6106.namprd11.prod.outlook.com (2603:10b6:a03:48b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 03:49:02 +0000
Received: from BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::f19c:833c:9f41:f3de]) by BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::f19c:833c:9f41:f3de%4]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 03:49:02 +0000
Message-ID: <db0dac9b-66f2-4942-b6ab-e73e10987d0d@intel.com>
Date: Wed, 20 May 2026 09:18:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_pm_backlight: Add
 brightness-with-suspend subtest
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20260513062208.683004-1-santhosh.reddy.guddati@intel.com>
 <80306d21-0df5-40ca-9a76-3ad59d326f50@intel.com>
 <DM3PPF208195D8D91B66A1C8E1F25ED0119E3042@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <DM3PPF208195D8D91B66A1C8E1F25ED0119E3042@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0221.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::9) To BL1PR11MB5302.namprd11.prod.outlook.com
 (2603:10b6:208:312::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5302:EE_|SJ1PR11MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: d349e564-3b0f-4c9e-1070-08deb622bb59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003|11063799006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: 7WMrJZR7WI/M6HMoAbSxYhLz/F47KT3a352Bi0cE86ZPWOIpP5ki1nFUxAwDnKvFGU2FvWfCrHulYzXJYhZHHPjXUCBb4zFRjHj8dQqviYc0xjzcXOs0IAc/0rC0Da141+EC/lQ0CYT6Yf8CT+FxoIFu2eDy5Pjt0ggzE7FJFFFzAs0Kj6LBCdkc/4htSa8VT63RFLps2jt4wSsq4Rt8WOUb76Uiwn5/2WMm+u4sNOb9I4MIV3kQ04SZ0MBOtYES2A/roe0Rk3cIs2pdo5+USyBQkwakphJzHPZActN1kOCgzli5H9VQxzZ4fYWqM37Ev4/d4phQyf8MY+mDz2+vQnxFQf9ABQe2HynSauXrbHpAHyiyFXdMUWudFdVexlD+0AUIQ3lVqK+AfcuJmtZYX1cwLq1r21qYUxG+3+EYHjUGa/8w8jjSEfWXeGifsM5iaGETyrBmcB4rUJ+F4kkOB54rg/yiW99j+V89QmbKbvtgMhdF/d6LeU935ZRauzPYSwMIwVhi+Ywt0pIM8n0M2T0oNG/4U0OwuYhFjfuAy2zF++2wijK6Nsy7yQi+hBGVgRj87YIbc079qUvyZ85esd/vLQWAIuQ/aL8XHenvrgNV10G52W0whyrWOUTytdb4qGMW8Y/lBhCli6FvzD385EAavNHmwugMledaoOv2EHXp900fzoXem22pt/amY8nI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5302.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003)(11063799006)(3023799007)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkZteFlXbTRtRmhBVmtDLzdsNGVmOWY5MU1ySFljbjl1dTNaa2xVVGdHb2Rw?=
 =?utf-8?B?THJQVlRNOUZ0bFNwbytMQnl5RGg2algxL1JJZ0tpVWJRNXN2amo4UHdJWkhx?=
 =?utf-8?B?eUIvR0Rmb013Y1lZR25jS2tPaWh1RmFNSUdUN2pyTGdlTk1KZlFtcmladG5L?=
 =?utf-8?B?WGR0MGpYd3kvdVZXWjNMVElTVk9LYk9IRkZ5UVd5bHY5KzZyekpUeHZ5cTh3?=
 =?utf-8?B?M2EyQXBITFdITmFEK1FvU1owNzU5d0RKdXBNb3p2eVBtWmlISjUwMTYwUjNN?=
 =?utf-8?B?QWk2NmpXNmhsRmlyL1pIT0o5QXVxazRCOC9lL1ZCY2VzNXFrNzI3bHJGNkVh?=
 =?utf-8?B?R0RyN2hERmlDRkZFY1NhYm5Mc3JkQ2srK0E1WDVOaU9DY2R3ZGprSGgwNUJ3?=
 =?utf-8?B?ZXBEVVJiTUYxSktESEtUVTVOd295dDhlaWxxR1lEN0VVdWFveFFGZUFtT0FJ?=
 =?utf-8?B?Q1hsQWRON20xTHo5ZWU0NTBMM090YWQwaFAwdUI2Qm5jNG9RZDFrbzBuRFJj?=
 =?utf-8?B?cVl2R0p0NkNIT0M2V0FNREZ4NENQcHkyWXl5TmlZaFBvb2I0aTBnWkJSeGpq?=
 =?utf-8?B?R0kycmRScE5ETDhkZmtDeStsM0I1QTV1WDVpV2Y1eTA1SW8vNWdxcmFGMk1U?=
 =?utf-8?B?eDVwY2ZDZ2NzUGN3UXpvMndDZ3FsT245OTZBd2pzMWR6WDJubmdYMGhBNG5k?=
 =?utf-8?B?Mzg5ZmhqalptdnZ6QzNpM1FRTEd6SklHR1Y5SytXZEc4enZyeDJaOVEyNFk5?=
 =?utf-8?B?ZnArNXI1dGlBemNvSjF3ekZxZ0tvZG5JTXArTUwyc1JSbUc1OEd0a2tYNmdk?=
 =?utf-8?B?R01haTZ3Z3BVMHZjSjV6RWxLbnNvMDJ5OFZLb0RsUlZveUx3RXhZVUFqVHgy?=
 =?utf-8?B?UThiT2dMTS9idU1WL0V0Z3BuT2R3NjNqSVQxSlc3aDdicG9BOGxpMDdiWmpK?=
 =?utf-8?B?eDlTV0Z3dVIxc0lLRExCeThFbEpZeER5dGxSbHRmc25LQ0F4QVh1ZEo4bTZr?=
 =?utf-8?B?RkVsZWora2N6SWdLU29YQlFRM1BSS1NzdWdYUnlLTGFMbXdaaGNpNnZCeTFY?=
 =?utf-8?B?QWovN3Yxc1kxRXhFbEQ0cGZSVk40U0VTQTI4MVYxdFdST0tSZGYwSnQxY2tn?=
 =?utf-8?B?bGIwckdOaDJCd3Y5elR2dGt6R2JkQmRZUjdPbTNTeUtuWTl5WU9objRSUGNn?=
 =?utf-8?B?UGVEc1RSM0hCSU5rVnRFM25VMEJ6QU5pdGtFanhZTzNmSkNrRUJYOVlad1Jp?=
 =?utf-8?B?cUVvYnUvdkwxZ1pRdzVmWUp4NlNwRldKRUxCMGt3VVF1bThhb1BGT0pOZ0VS?=
 =?utf-8?B?ajU1ZnpBYjlmcHBqTjVrMXQ4dHI3UWZUSFU4Yi9Xa3BpZFcwRUpBZzRYUWlQ?=
 =?utf-8?B?Tk0xV0FHTk84eCtSWmxxMDN1cm5yK2NwcXFkZEUwcERhck12TzBWd3RZc1Bh?=
 =?utf-8?B?T284T2Z4eFBuUDlac2wwNmkxeDFGemx1cnBlYzgrREtUT1NETlQyQTJUTEV4?=
 =?utf-8?B?ZmhTSmh1RENUcklPUWgxWnBVK0xWbjZhSkxwdThwTEJEc24yS3FzRERhZ3Rt?=
 =?utf-8?B?a0Y1eFlTbi83QXAybzdqdktNQk9BUjE5bHNIa0V1MmJRMm82MFRsem90aE1U?=
 =?utf-8?B?SHhVcHQ0ZTZmcytCbTBWOFFLZnY2WmZKT2tEdG9sb21BaUo0YUlaWFJlOTYv?=
 =?utf-8?B?ckpTMnVVY2VlOG53NnlrWnFPYklXS3NiY1ZyMUwxUXVYM3RkMlh2cGtjdUx6?=
 =?utf-8?B?dGpIK1krTkZvbUJlc0owUkNjbWdBYWwzcXB1c0NQeWc4ZHJFcGZHdER1VXZG?=
 =?utf-8?B?R0g1ZzVQTGRTcGJQWW5KUDF1K09FZVptUFkzT0ZRc0dGQnl0NVZZWUVPK2Rj?=
 =?utf-8?B?QkV5bkR6c0ljQ3dURDQ5LzlFWElMaXpyVkIwTGxncDIrOGozb3VyNW9UUE0y?=
 =?utf-8?B?Vy9aTDRGVDUyQ1MzYzM2VVNjZENKMldNWmtibHZpYXo4RDlWQXFGb0FjaWRi?=
 =?utf-8?B?c3FvVDd0MVZSbHNTNlhlNGpjSnR6b3NFU0h0TU9CdEh6RXBwZ01YNjRBREhU?=
 =?utf-8?B?YjBOai9hR0RYQlE1c3MzdXJqbWhXVEFFWHBNTWYwRjlBMDArN0tYU0NBZWpO?=
 =?utf-8?B?cFJaYkpCWXROVHVFZVdYaytjMHJZa0lHM0JzTEphM2hHdVR1S1RyQStvUEN6?=
 =?utf-8?B?TTFLNHVJQkh0QW9jN28zQjJGYSt3MDFleXZIbmhZNDVGZG95S1Noa0xhTDBi?=
 =?utf-8?B?Qm02bmcvZ0NnNEpEYnlWRzVEL0RpTFBrNk0wTmZsbjQxUUFLODI5SWJNaTht?=
 =?utf-8?B?Nm9oQWpUbXJ0ckh3NjRHM1A2TmFUNGVSSTQ0Ym9abEhmVVlXdFJOM3FkQ3B4?=
 =?utf-8?Q?St3ybg8Il9k0KN7Y9Vvjqlx87cdH6orAxPsP4?=
X-Exchange-RoutingPolicyChecked: gEpjqQXjBndlHoDxOpPUkK8vxK7zHT6rI72O7/AhnTufg8VF+Rn42Dt6WESRuzLQEK//HwCz4Qkrpl4SmfPyG8jihA6xqR1AC9v8rAZlm0keME76plqEceCLM9GQXZ4IBTXKuYtfL2upAQ4zMa1XYjtuIZzsYXAP5qGX5wzdelRWRPhbKoTlleQ63TfNcoJmmEnj6Pj5cYzAA6FAkwEbw1ld2eWoOw/GygwVb1isBcVGcRdm2D5sELQc5zuA9Ex0VuWaDsoRPg28QQBX5jpR2642wVrBXK0YNuFX6hg0uJ6EXZN5Nf4YIyifFprdpNstwhxGtX4XKAjvFZwsIose2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: d349e564-3b0f-4c9e-1070-08deb622bb59
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5302.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 03:49:02.6296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YeRMNUZuK1NxLYXQl3RSMQY/MkKR02rsAkjgFz+87WkvFQMJbMK7lMBuPw1ahcIRaQ1LDd4DirFnzFyephqAuslqUtW9JUfUOAqWlmExhM09h1SU56LuKQbWiAZhZNjW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6106
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

Hi Suraj,

On 15-05-2026 11:58, Kandpal, Suraj wrote:
>> Subject: Re: [PATCH i-g-t v2] tests/intel/kms_pm_backlight: Add brightness-
>> with-suspend subtest
>>
>>
>> On 5/13/2026 11:52 AM, Santhosh Reddy Guddati wrote:
>>> Verify backlight brightness is preserved after suspend resume cycle,
>>> The test sets backlight to  a value , suspend the system and checks
>>> the brightness value is preserved after resume.
>>>
>>> v2: Remove unused enum and use TEST_NONE, remove locally added prints
>>> for debug (Karthik)
>>>
> 
> Has this been tested on OLED panel where we use AUX VESA backlight via PANEL LUMINANCE path
> Because in that case we either depend on Panel to hold value for us or the userspace(which comes in after 1st modeset and restore previous backlight value) or we just switch to maximum.
> There can be another instance where panel falsely reports 0 causing us to go down.
> Those wouldn't be backlight failure but this test may fail because of that.
> Can you have a look at that case before getting this in.

Thanks for taking a look.
Yes, You are right. When I verified this patch on an OLED panel, the 
brightness value is not same before and after suspend, It reported as 0,
whereas this test is working fine on non OLED panels.

I will look into redesigning the test appropriately.

Thanks,
Santhosh

> 
> Regards,
> Suraj Kandpal
> 
>>> Signed-off-by: Santhosh Reddy Guddati
>>> <santhosh.reddy.guddati@intel.com>
>> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
>>> ---
>>>    tests/intel/kms_pm_backlight.c | 23 +++++++++++++++++++++++
>>>    1 file changed, 23 insertions(+)
>>>
>>> diff --git a/tests/intel/kms_pm_backlight.c
>>> b/tests/intel/kms_pm_backlight.c index 58c0b4427..0e35aeed0 100644
>>> --- a/tests/intel/kms_pm_backlight.c
>>> +++ b/tests/intel/kms_pm_backlight.c
>>> @@ -65,6 +65,9 @@
>>>     *
>>>     * SUBTEST: brightness-with-dpms
>>>     * Description: test brightness with dpms on and off cycle.
>>> + *
>>> + * SUBTEST: brightness-with-suspend
>>> + * Description: Test that brightness set before suspend is preserved after
>> resume.
>>>     */
>>>
>>>    enum {
>>> @@ -206,6 +209,24 @@ check_suspend(igt_output_t *output)
>>>    	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>> SUSPEND_TEST_NONE);
>>>    }
>>>
>>> +static void check_suspend_cycle(igt_backlight_context_t *context) {
>>> +	int max, val1, val2;
>>> +
>>> +	igt_backlight_read(&max, "max_brightness", context);
>>> +	igt_assert(max);
>>> +
>>> +	igt_backlight_write(max / 2, "brightness", context);
>>> +	igt_backlight_read(&val1, "actual_brightness", context);
>>> +
>>> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>> SUSPEND_TEST_NONE);
>>> +
>>> +	igt_backlight_read(&val2, "actual_brightness", context);
>>> +	igt_assert_f(val2 == val1,
>>> +		     "actual_brightness after resume [%d] does not match
>> value before suspend [%d]\n",
>>> +		     val2, val1);
>>> +}
>>> +
>>>    static void test_cleanup(igt_display_t *display, igt_backlight_context_t
>> *context)
>>>    {
>>>    	igt_output_t *output = context->output; @@ -273,6 +294,8 @@ int
>>> igt_main()
>>>    		{ "brightness-with-dpms", "test brightness with dpms on and
>> off cycle.",
>>>    		   check_dpms_cycle, TEST_DPMS_CYCLE},
>>>    		{ "fade-with-suspend", "test the fade with suspend.",
>> test_fade,
>>> TEST_SUSPEND },
>>> +		{ "brightness-with-suspend", "test brightness is preserved
>> after suspend/resume.",
>>> +		   check_suspend_cycle, TEST_NONE },
>>>    	};
>>>
>>>    	igt_fixture() {

