Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8F3C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 03:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55AC10E4A1;
	Tue, 17 Jun 2025 03:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQNTcn48";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD1210E4A1
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 03:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750132032; x=1781668032;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8aUbfwua2Knx6j26dufycAe5WZHyHb0r0GEZHTfx0q8=;
 b=mQNTcn48tOFgsgYxnYFHffN67T9xmgQ5uJR6teLtVtIdmgCZQQm6JCYy
 Hw7TAAPnzePFVWz+bOf2RtqYxdlr8IyrZwLh4/Lw6/MTxBWVv1TORyuxC
 hBoskCeqhsOUbftn9iTAOEZ6uojSnNAAMi32eo+kZeGhPmcoGGAQwqRp5
 SE9q9oECIxFE68+cXtjaC8Lwyyqbelc0+2Bd7ayoOjJ7m2qjj5l+/Ej9i
 6o+hxEPwgHGJMtle5lxbbwWcRzVNtu5Ah1qYvE8oNKjFneUVR6w+KESVl
 +Olgzy/atqhr0HSCYg2/XxVgHONvZkUp5buNjNZhV9C8kDr2OVTdgr3Tp w==;
X-CSE-ConnectionGUID: B2z3KuyrTLKhvMW9eGub0w==
X-CSE-MsgGUID: S/ViwCswTW+RlxJIsqSQ2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51997587"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="51997587"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 20:47:12 -0700
X-CSE-ConnectionGUID: 0cy1SanKRLaVdxLyBd4SKQ==
X-CSE-MsgGUID: WLZOo3zBSCmBdM3Xu3WPkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="153824284"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 20:47:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 20:47:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 20:47:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.69)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 20:47:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZfb32yHfp2HaEOTD6o6V52KRGsgeqUmF3T7aZiBAJXnV/NQ3Y3ycIuf+j3kQhnP3SSFf1QZrDK1o9GeonA0Y9QMtduYjTcEZ3mGmw+a1CNPzfeyxmUBVDxoe6V1MH/Sf3pJe4KLMxWuz/WHLNKg2AcEqghPDctBEeJFa5MmWBNkK7JsEzrYjAFgrhZaA/AEQmTuSHXzVE/eEEi5kjASJvVWWSkm/0R1jULHGm+SgPnwfBOXIFotISHm01u8k00LjgL+Q01lQPFlTVf7dnORg37/0yR1N7JFV6YP8Nm2gt6E8tjPUIf/P8cT152jcItC4BQ6kEcrhN3/pvDS2wK4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVLd2usIXWESaiGillCH5gkma8E4pVl32xZ/r5gDLPY=;
 b=c2Gk+yEUYd8Gjkth4lLW9CuRSSS5KLskOjIKq9FTP2X5i6HvyiTPHnZcZL0oNxJW++03vjdi3MgRSDA00XkydN15lxzZY1qZQzb0DdNi0h/rkIue9jZq4RmUg3AGk9XnDYWwHsBvqo5vXZdEu+YTg61doBq2k0WD3V1XIpV6/xCsWiwcUO3ubV8uXvKrNvnCtOxfL/ouk/v+73W4bgrRDf41NVCi+nP44XlRZdYQ8z0jWhlGlK7EuE+UenqQMZ9e+0W9YG30slk9uLfSoSMBuRlIBpMYQbdJQXswOjVXzgp6tHg0yExNWE7IlB7w7vueQViH4ACsiU3gKquPnc6j2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Tue, 17 Jun
 2025 03:46:54 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8769.029; Tue, 17 Jun 2025
 03:46:54 +0000
Message-ID: <9c9a4c5f-018e-4895-bba2-6b2a128d53c3@intel.com>
Date: Tue, 17 Jun 2025 09:16:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 3/5] tests/kms_flip: Increase test duration for
 flip-vs-wf_vblank
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <uma.shankar@intel.com>
References: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
 <20250616063831.3332042-4-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250616063831.3332042-4-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LV8PR11MB8680:EE_
X-MS-Office365-Filtering-Correlation-Id: 5769248e-ed72-4cf1-3335-08ddad519a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2IvTjBMUUxnOGN0UktHQ2lRSVRERFNQREFoR2x3OEpnd1EzQXJrblZudU1R?=
 =?utf-8?B?alJlaDR1dTBKZUFuN1pMSkdYRFdkbjArTmptRWZ5SVFkTEgzRU1KZVJ0U2tW?=
 =?utf-8?B?d1FRdHF1ZTl4bVNoa3AyeDh4ekZZZHdIdHVvaE8rcVZnK29ISm5pNWdyYmtm?=
 =?utf-8?B?M0pCV1Y2V3pHZkpEQ1NVZ1RPa1RRMlE0TUZ1emNtalBKVTVoN3Rkc0JWYlBG?=
 =?utf-8?B?TnVxbi8xbEhpWWFWVjRwdlMwRDVPZk9TWDZpK2l4azJ2cklXUFJKc3V1MER0?=
 =?utf-8?B?akgxNGdnZ2R5QmdtUkRxTEtmU1NEbWNPZURrcFdjdU1sUzFoalpLem10SmNq?=
 =?utf-8?B?U3dpT2t0eTBHTUNPYzJLZlJFbk9HS1hyMVJxVktnU2tGbjFNRGdLUWpBcWNZ?=
 =?utf-8?B?SGxYYVc0bHVXN3lLdE9hWnA4aUcwUWJBcTZPUmNlNUYxMDNTMEVCeGdqUnFV?=
 =?utf-8?B?RWRrcmlIZjlyNjgzMm43d3kzMTFDTWVxNS9Uc3AveGRSMWd1N0NkQUd1a21k?=
 =?utf-8?B?UW1xalFvTVdqT09MbkFUWDZlNC9ub2VJeW04ZG42QnhUZjFRbVZNOGRIYm52?=
 =?utf-8?B?WUpoZWhxUXNFYnZGbjFvQlVSNnFlSDIrL1dXaEJVZ0dKZUZ5OWJqM3NnVGJT?=
 =?utf-8?B?UUo1YVUyUWxLYzU2WW1hUFYrc1UxYy9vRGhKRnUvenN5NDhLdElpcnVrR200?=
 =?utf-8?B?NEdTRnlTb3A0MlhIUzdacVNUZ1NaSkU0UUJyeTY4R2Q0MzRVN2poZ3pKd21r?=
 =?utf-8?B?bEt5S0duTlhhcWJwZmd1QW9TcDQrZSt4L243b1JpUWdZSnN5ajJidHkxVEhl?=
 =?utf-8?B?UjZHZlBpQ3dvMUw1RmFSTkJxaDFhK05sRVVjVHJJOWdNT0JoODdkR0NWQWhE?=
 =?utf-8?B?cG5VUzRCWVdIYmpZdTFHdlQ2MndXNG5iRitubjY1WWFtRkZFVHJUVXBSWWlo?=
 =?utf-8?B?NUFvcmVkci8xaWduZzhRR3dDOGs0Q2tKSHBQdWZVdU53UmhWeEQ2Q0M2ZXh3?=
 =?utf-8?B?YkRTMnpCdXMyZ1hZY0tFcHU4anR4SmlncFRCcno4Qm1qOGJFVFkzb0lsSTA1?=
 =?utf-8?B?eFovbzdBUk11Nzk5eUZBa1I2M2Q0VVdZNlRjMDJ1elMyUkpTNVV2dE52K2x0?=
 =?utf-8?B?WmNtMkE3U3o3M0NYYjNGUmdqclIydURuN1ZXaDhtSU9BcjU1SndqV09xdzhU?=
 =?utf-8?B?SlhWcmhVRlM1b2hzcEsyWW5uSUJoWXJHblp5c1JQWGlIeDcxTmI0dG5WMC9w?=
 =?utf-8?B?NUU4RURsbXZLcTJXV3lVYzJEeDUxY28rR3hpcXBXWHNnckNvVWkwUmR2ZUpO?=
 =?utf-8?B?ZEtHRnpLUXB2a1BMQlFxUGdKUUxzbjBTa29FbzhveTBFQXpKejNWWVhhRUdG?=
 =?utf-8?B?NDU0T243eHJ5SEtZbmU3WDM5S2Vrb3lNNXFYR01KTWVwUy8xb2Y4Y1p0aHV4?=
 =?utf-8?B?MWlEdUZSdmcrVVNPdXNROVRYQ0NEVFJ1MEZ6b2FUdXdXeGhQSDlrOGVJYlpR?=
 =?utf-8?B?RzBvNWZ1YjRxWDZ4MzRVcXErVUlERjg4UTk1dHdOc1NKbUJMUmF0MDcwQ0Iz?=
 =?utf-8?B?dzdaREVyQ0tSM1VqaFg3RXdOck4wVElaaDRBZm9yL1hSOW5uUmdHRTRTbE1K?=
 =?utf-8?B?TGhnV0N4NVR1eGJHaUlaV3JXLzZUdVYreGp4QndYWHdTZXV5Y2RRQXVUcUZ6?=
 =?utf-8?B?T0JSNHJwWlk4SHJQTFRZYjkvUlBna1ZqZmJRMkt0MVZRZEFsNEI1Qm5tUG1y?=
 =?utf-8?B?NHQ2M1R6SjZ4MTQ1MDJBLzhNVXppWVUrTzYxaWtieVhOdnlISklkUi9waG5O?=
 =?utf-8?B?dHFONlJESWVqNEZmSkpGVE9KTTFtNUw3N0pZMmg1bXAyYm5zeUhhOVMrWXA0?=
 =?utf-8?B?OGV1QTVrMGswaVFEUVQ5b1JtWTBRVVFxTWxOUTQyRzlLYmxmYWszOEU2ZTJs?=
 =?utf-8?Q?3QWgynrtIyk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTFYUjRLbWc3Z3RWUFFRSDFkeDRzKzlKcnEzMmJSeXdUTnpaSjRzOGh6M2t3?=
 =?utf-8?B?ZkVrK3FsQUJBV2trNjNwYjBSL24xbTZ2Vi96ZzRKWTkvbjdJYjhKckhPL2Ns?=
 =?utf-8?B?ZDJ0bGM2b1RPaVp6WWxvNHM2eUxNcVQxUmdDQlgrdWFLSnN2QXRJQjlZc0Jk?=
 =?utf-8?B?SHFORWpBWmJMbGxEbWp0RlZOR09LMThRY1hsSzJjY004Rm9NNWl5U3F5RGtS?=
 =?utf-8?B?THRxTWFtVG9heFNaTWFybHVLNytsL0ZrZ1Y4L1gvVmVOUnpSOXN5WHFsYk1w?=
 =?utf-8?B?WCswaFJMditqTU5QQXh5bUw0NnBOMEpFcVNobXMyQVBVcnZFQ0Q3Mm1pVkNQ?=
 =?utf-8?B?N0U3UTR0bkV2b3VjK0tFK1JHMnlVdzl3cGFZYlg1d0I3Um5kZVE3dEJCcHg5?=
 =?utf-8?B?dzZNSVk2ckhjeDRDZGFPTnhyMGFQNUsxb2doSGZXWnFTK292WlFVN1lGOWFw?=
 =?utf-8?B?T0VoQkxia2NEYitKOHN0cWR0ZW8xdzN0VVl0NnJpWGVlNTN0K3g1TGxlb0Vr?=
 =?utf-8?B?RXFyZzUzWlY1VVRnTnpKTWE2dlp6RnpZT2poalUvTFJIOU40MHFoSCt5ck94?=
 =?utf-8?B?S29RRTIvYkl4NWYzdjlmUDJrdHNZc2cwazhGcjFwbkV0cEQrOHNac3l3MmIz?=
 =?utf-8?B?ZC9BVTRVR3o2VnJuOHhYV1ZzUUkxZzMrTi82MWdWZCtSQ1hTYlZtc2RLdjY2?=
 =?utf-8?B?Ui9PQUxiZThOdFF1ZWVhbS91ZURLQU9Pb3VXZGFYVUNmWWhtelU2UklyZ3Jp?=
 =?utf-8?B?RGtQVXFTSHNXWDEycWNLSURtOFpnM0lzb3oxU0ZIKzllMTdkWWdPUDJnN0R2?=
 =?utf-8?B?czkxZTRhMUt3dHd3SHoyV3ZnNjJDcU1MYlNZRlpWU3FZMnZLMFByTExBVHFD?=
 =?utf-8?B?YUYzN2xWTzZDL0dvNmsxdHBpMUYwMEhNVnpKNXJmalZHNU5DQ05xOGptRmx4?=
 =?utf-8?B?VHQ2cmxVSW1jSXN4a2J5Uk91eHkrQzVLbGdaYXFTRFpkSCtHZDFDWU02T1hL?=
 =?utf-8?B?dHV1U2czR0Zic0M2ZFV0MFVwWXY4RU55bWdicDJDdU54d2t4Zk9PVXQ3Tk04?=
 =?utf-8?B?T3AyQlJ2WTVKclk1U3FCL0xETkxQL1ZzUTUvL1M3UnNLV2J6RDJsUTVmSjJV?=
 =?utf-8?B?bmJqWDVsY0ppdVFlSnIxZXZ6dTlMdGxlVDNjRjZHU2NOQm9lbEkzVlNlak1n?=
 =?utf-8?B?U0RUc2tERFBVSFdKS003d3R6ZHo3UFp6eUVRcnVCWTNUOTRZQTJvMHFlbHBw?=
 =?utf-8?B?b0g2c3V1Y25wLzVZSkszMndienB1NHpuYXA1MjhXNjJYajgweEc2Vm8wekhs?=
 =?utf-8?B?OHdTTHFNaVhDQ2JiQVA4bXE5a3pEWlJiZDlWdGU1L3R5cVRVYnRBUGhKeG0v?=
 =?utf-8?B?SnREdHZNM2JrMEJ5ek1aYi9uMUROSm5WR2s3cmZYNHc1UTh1VWIvLzZ4Qjda?=
 =?utf-8?B?RjFuVythZU90R0FqZ3hsZ2NQR0N0UDNRMzJwaVp3ZnFGazFXME8vcElhcGtH?=
 =?utf-8?B?ZFZVRjNDQzJCbDIyTy9HNGE4QkRyR3lnOG1ZeEtKeElKS3ZBcGd5bStlTkQw?=
 =?utf-8?B?bURhYStDU0tia0daZGpMQUhEc2Jza1VPTW8vbkhNdEJ4QWcrMEw1T1QrWnhP?=
 =?utf-8?B?UTY2cVgvZXYreE1iWnA5dzFvMjRXWmxrMGlHYUhNZERicTJGRWw0V1pXVXJ0?=
 =?utf-8?B?bzdvVDNUSHdYbWN3T29FcSthN3c4Z0RJalQrc1FVYWl0bDZIZWIvZUtMbUVB?=
 =?utf-8?B?VnJSZytIcW5YVUt3eGMrZnNSaUVVRjJZY1A2ZVFMTEpCUlBsWkJsNDdjS1U2?=
 =?utf-8?B?eHBtWmtaOWdaMzBFWStuWVFBb1MvMFRQd2Zsb0VwVElmT3A5eUpwWG5GTkFR?=
 =?utf-8?B?bnZXaFFHZEI1TXdnakYrNzVnQkxQNU1EK1ZwSktRVzNuVEpDMjlVZ2lZcGk1?=
 =?utf-8?B?OFlOQit1ZlN0MlVaVE41QXRlY3dOSnlNSWVnSjBoeGNDVUd3WHQyMElwNmto?=
 =?utf-8?B?OHoxcDIrL1cyS2FaL2ZzTndBcEtKcVN3NmdYQnFpUTFoUGRnMGgwVm1aZHNn?=
 =?utf-8?B?cC9iZVlDdnhVTWQ1WlVuN1VQUVI4RXlVSkl2c2U1R2E1eExsdjBQbWFmNXpj?=
 =?utf-8?Q?hnYm2e0r1NOL5sh853JbLnhsm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5769248e-ed72-4cf1-3335-08ddad519a0a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 03:46:54.8049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0jqxpaDUfxj79kTBQv7zJ39PEkEcyDN/Tnl06d9kVvwMoqvDu4mz1+6ArXQFl41yZaurHYeUpoXN/7ULHJXyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
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

Hi,

On 6/16/2025 12:08 PM, Naladala Ramanaidu wrote:
> Boost testing and coverage for lower refresh rate panels.

Could we add more justification here? Are we doing this because we're 
now adding the some buffer/tolerance to the flip pass rate and so we 
need a larger sample size?

Thanks,
Karthik.B.S
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_flip.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 2328259ba..5873591fa 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -2026,7 +2026,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   
>   		{ 30, TEST_FLIP | TEST_VBLANK | TEST_VBLANK_ABSOLUTE |
>   		      TEST_CHECK_TS, "flip-vs-absolute-wf_vblank" },
> -		{ 2, TEST_FLIP | TEST_VBLANK | TEST_CHECK_TS | TEST_BASIC,
> +		{ 30, TEST_FLIP | TEST_VBLANK | TEST_CHECK_TS | TEST_BASIC,
>   					"flip-vs-wf_vblank" },
>   		{ 30, TEST_FLIP | TEST_VBLANK | TEST_VBLANK_BLOCK |
>   			TEST_CHECK_TS, "flip-vs-blocking-wf-vblank" },
