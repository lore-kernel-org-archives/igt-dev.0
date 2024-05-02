Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3351AC4345F
	for <igt-dev@archiver.kernel.org>; Thu,  2 May 2024 09:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A2010F297;
	Thu,  2 May 2024 09:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXPeiarx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BDB10F44A
 for <igt-dev@lists.freedesktop.org>; Thu,  2 May 2024 09:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714640550; x=1746176550;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T9klGratUK/ffGfAtG+jkqiEWSbEmpiJk9vTBaVAR1M=;
 b=dXPeiarx1xQNNqPD3OVu9EJrhS5gc8dykjNPPk1967UyObwGWzX+PSX/
 HHkUPj/5wDZ4QOvwYZjXA7GEGxHcIdxMi9m6//+Cpn3tIIqOpovtSYqfq
 zGtkgl17Iun5lqbTpOZXnpDhCK2TiE1VmM5YeXyAdHniSiNUGFEBT+EW5
 gKGGKnJeEAg4nfpDsH56B5OS/I0M/pdhsWBEc1/TZe2eO93hFdg9Qn0nt
 lAvUqFSlyG8da00UWD5Qn/oMMu3btfCjg4PRykb7HQ8nnzcq1Ji44FCjZ
 MsYZPqlVF+N5UHN7nCpOfQMbV8cZwqvdELoSypJRcEIZUUKmIY5C5B5VZ A==;
X-CSE-ConnectionGUID: Lqkst0eQSwSpu3lMmvojeA==
X-CSE-MsgGUID: jkrWqJM3QRi8fSS3XvOr9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21802005"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="21802005"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 02:02:29 -0700
X-CSE-ConnectionGUID: PSYg7YdWS/GIPR/gZiKFSw==
X-CSE-MsgGUID: JR6RY0WjQuW7hHbwnl9zuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="50257752"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 02:02:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 02:02:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 02:02:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 02:02:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 02:02:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Us8z2lO4tpsgn8xpiyQEcqSEhkp6PenfCLKT9+gkLrj8xMpBQb8BXc2cBzfcm2qpXiW4YeqMK+Dcwn0WzM+bO/w6805ryfrDo5tQL+8kLOurfl7m0efSZPUIB8YQa2GRN7doGbC6hfI7ruNOvdYD1uzfY54qtZC0T1TQADGdT6TY330aCqMfJXw5Y/dHb9VhMiZ2TraJuNazbJaJjk7E700UuWIZ2CdwyTVRDMUZz0bJejsheipfNDGBfPnnVMS27oAEjpaReN4hHiuLFcqZga5SZNL0bWlOHqW5n+IlF6cjp+Vd8SoDhPC2dSGnluZOFdUXKLBrE85kDlKWb0XqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cjgVYk6wDTQpdYUuOwkCU9vxZKCAn8tSuGwl5rJsVo=;
 b=F3nj1J8CK2KgGjcbzNSx/Ojvae8gH0/qT6rZLRwm/0W/7KRsZmL+Cee41w1wHgCIXI/wT1oI25slPNjxPG08uJQ4XOgyOcZZ92Z61o3084F8vXIZ+0vEB/Nwf0Bb0skRBy5Y6RYGd7L+rAZmH6xzRKFs02KwAHnMHJf+mUaaJ3I9y3W8yQSFnUOvM7S6Js7frh4CQ6/00K2sBSsPaxyiBetFXUOCzavGCUb1Fa3CTusiqKkN/Fjo3NlSUV7Fqp+guiaYnap7QpIb44Tp8KrAhO+yZxFpJjaMl44tFeDLoI8XN5sk9Ymy/4hsoeZjeF7vI4I9U542xniXTR7FsZt5yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB8098.namprd11.prod.outlook.com (2603:10b6:208:44b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Thu, 2 May
 2024 09:02:27 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 09:02:27 +0000
Message-ID: <123e3fcc-8c00-48c7-814a-3de36e4e520b@intel.com>
Date: Thu, 2 May 2024 14:32:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_pm: Add mocs suspend resume
 test
To: <janga.rahul.kumar@intel.com>, <igt-dev@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>
CC: <matthew.d.roper@intel.com>
References: <20240424200856.1194881-1-janga.rahul.kumar@intel.com>
 <20240424200856.1194881-3-janga.rahul.kumar@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240424200856.1194881-3-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::11) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad1b9ec-3bb5-4bc0-cd8e-08dc6a8696d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGl1dWwyM3lBTkRSRDI3ZFhuK2pOUFFnVFRGSVFFZktzZUphZTNMckEwbGR4?=
 =?utf-8?B?MVdvMFNyaEcvK1hnOWp6d2V2R21MMFdGWUlmb24wNDNqbkFRcXRXN1o3UnNE?=
 =?utf-8?B?KzM1S2loYTBCYk95MkdwNHkvbWdvaW0zN2tuYVpSMlBRWGYwUXp1NEhLeENH?=
 =?utf-8?B?RE82T25Tb3ArQnpRTXpoc0REMXplT0Z0ZGZoOE1hSTcxM1BEQVlRNk9UVHFs?=
 =?utf-8?B?QzdSb3VVY3dUYmU0czlyUVNudVlQQURnSUNJSndjYzJhc2piK1FqMHhXc1pM?=
 =?utf-8?B?M0tiTTExVGNJbkFtRDhYTTNEVGlGZEpYbjZieDkrY0VOL1NJbnRRdXB2OU9V?=
 =?utf-8?B?dkM1elJiQVVKYVNIMjNXeXVTTEVJeUUxZWtmS05nV3N0ZHhsRE9DWDE2OVR5?=
 =?utf-8?B?MGZCaTcyS0Jqbld4c3daK295NmhkTnRBZzNIQ3kvaGZvSVF3MmRhTmZ1eFZk?=
 =?utf-8?B?UnFqRG91VCtoZmlya05kWlBtVVlXendNNTcyeXZnalZoY0ZLSGhCUEQyNUlP?=
 =?utf-8?B?V25ReWJxV2hWZm1VZnpRenhGT2xUMGVObXdRSG1xNzRXWGhOYzd6ZnVGNGVV?=
 =?utf-8?B?U3JheFZoMWpkY0F2MWNtL2tGSmJ0Nk83WklaNUIzWUJnTHYwZC92Q3VvNTV3?=
 =?utf-8?B?UkFDcFh1QVJVQmo0bWh2ZzExQVo4SjU3d2hqNFFSeU03bFA5cGpIcS9UbFFU?=
 =?utf-8?B?TUhma3VSVStWQ3Z5VmpTSHIvUHhncjdPSG1sZzlHYU1jc1k4UE1UZGtEaUw2?=
 =?utf-8?B?WHo4YzZ5Tko4b2xoTHk1YzRjYUFUSmZXZFZvbHdMbC9TRW8zaUxiUU8wL3d1?=
 =?utf-8?B?T3duUEFWQmloRnpuNXAxblQ0NUU3MVhDNHFqbDZ2N3RiZExQWWI5ei9qSEl6?=
 =?utf-8?B?Q2lsUXFKblRLZXRqZi94ejdQNDBOTGJvZGhkL1cvZm9odDVkKzNjTlU0T1Zu?=
 =?utf-8?B?bjU1ZjVWOUtsNjQvNE9hS2JoeDNYQ2wzRlE2VDZaR2hPYmdjMG1pcmt3Z0Yr?=
 =?utf-8?B?NXlFdFZuOTMyM3BEVzgwQzNuTVFwTm12L1NSdnhNSTdUL2NZY2xaUFBORTBL?=
 =?utf-8?B?c3NQUjZ5aHVqNy9iQjRxS0FpaVk4aEM2dmI1djlURmZQWGZkRy8vYyt2cENo?=
 =?utf-8?B?ZzVOZEphNjQwaHA1RGxtcDNMOTh0MFY1MTVaN0VENFF1a0hzUFp3Und6ZVNv?=
 =?utf-8?B?Z29kOGIwREZWb1FDUStGUm4xR3BzNElMV01CczVzSnVQRWJBbGhYdmp6YzVq?=
 =?utf-8?B?dENpN0hqUkVBV2JGTSsvZHFUUzFwSHEyZmpCVWRhbXdTQXBVZERqU2c0WEcr?=
 =?utf-8?B?U3NUbFFBUGo4RE9QM1JPYXhZelp5bm40MzZSU1dodUVnZFppTWNjaXNsejUr?=
 =?utf-8?B?Z3hVK0YvUG0zelFOcCtROWRteng3TFk2aW9oMmF0QjdjM28vVzl4eitKQitw?=
 =?utf-8?B?U0RYOXY1bDNGYzlIUG5zamxsZkVFcFFkMTRqMnE4WkYwckFUUnpTaUNzQTV3?=
 =?utf-8?B?OHgrVGpONmUvWjFCRlhSK1VsL2U0MTl6WWNxTVFhL2FGZkY1UG44UlBzVnA2?=
 =?utf-8?B?dkJoZHc1QmhsSzZjd2x4OVYyL002T2tsaEdIT1FlTzBKRm1VNlk4eTRRbFVQ?=
 =?utf-8?B?ZFF4K0kvcjFibmVOcE9HWUQ3OER0UGpUK3lrNmtTNFJ2dEJoQmdWcmh4Rmpq?=
 =?utf-8?B?Y2krZE9UUW1WMG9UK2hYTUFDNzd1TS95aWxLY3NnQ3NIai9oRy9maklRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVV5bTNScmZmbjFodzZzN1NHOEZWR1V2UmpxTHFlR2RhY1RVK0hxUnR6cGlx?=
 =?utf-8?B?WFhHR2FXQ1NwU1J1bW9wemg1UDV5UVcxZERpejhIdmJIMldzcktMOHRDWTlR?=
 =?utf-8?B?TnB6VFQvc2gyd25FRCtKZUxPNmJVQlR5U290YVZocjk3OW54WkRRVnNIeEM5?=
 =?utf-8?B?em5HV1RaakFYaXREWk5mZlU2cGFIWVZ1VmhhT2JVOHNuSEo0NkVQbUpKeTd1?=
 =?utf-8?B?V056d0ZiR1pQSjErdE9RLzBXZTVHZWNTV1hLRlhhTCsrSHFMc1o5QWt3U3Fo?=
 =?utf-8?B?QWZNN2swQ0NFZ0RjbHZsRDNZUHZHSzFyTVRzVGdCcGwzZ1M4ZUJsbWtQbzll?=
 =?utf-8?B?c2gzelhBUmJCQUVyRktCQ1U4MThwZVpTbGNLaXJESG9nd2tPRm05MEdYWmN4?=
 =?utf-8?B?alQ4RW0wNjZlcTdKdFpYVHRtS2ttTVBQV3o0WS9VUGpwNy95bE83K3pwU2R4?=
 =?utf-8?B?SkZSUE84akpUSWZuOWcxQzJ2aXdGRStQY0tKQVppN1pCS3ErZjVOanl4K1R0?=
 =?utf-8?B?YU5PaWFBVG94bmNtTStEc0VJd3ppVXd5SmkrY1NNbVhtcmI5REdFVVprMjcv?=
 =?utf-8?B?dHhkU0k3cDdtMUtuS0x2VmdYMFJrQ3lnNy9TSEdWRGpBNm5IWVVBYmtranVG?=
 =?utf-8?B?VzUwL2h1bVhsbzhyMUpLK0dWeitTQ1dNUGl2TDZYd2NwSGU0Q2IxSkVnQjBW?=
 =?utf-8?B?bFBrSzdaU01EUlQyQXlaVmY1ck5WZC8yNithOWUvRXZlWU1zbTZqR2ZYeDJ4?=
 =?utf-8?B?OVRjMEZPcXpNSzhjcXhGWWRaa3FXdllDdHJjMlBlMW5oU25KYnFySVlib1dy?=
 =?utf-8?B?c1hSY01kL1RtdFBRa2F3cnZROUhRZFRQaElETGFBTXpkK1ZhK1Z6a0V1Z2ZX?=
 =?utf-8?B?cXZVTVNLdTI3YlVwbFlLY0hxSnRxZTVFUlh2eFJUZlhlU1luN0k1aWovRDh4?=
 =?utf-8?B?Rzl6QXZMeFEzYlNSWmdzTlRqODJkOE1oalhRK2NrbGxCNzVzYlVzUUxQMmJO?=
 =?utf-8?B?Nnp1SU5yb2FoTmpGTjVwYjh1MWw2aXdZM0M3ZGJOTlcvbGdtd2JublBIeDlJ?=
 =?utf-8?B?T0tWT2Y1SldnV0YrVmFISUR1T1B2OEV6a2JqTmlJSVFWUE1hK04zcTdlemNl?=
 =?utf-8?B?ZW92WkxGd25Jbzd3QWF3MXlxd3ZRVFczUGliQTdSUTc3dW5lRml5L29IVFd5?=
 =?utf-8?B?MWdtYlg0a1NjdTlOM3F2aU0xU3hscmdjbHBTbkdPQTFlaUo4cjVveHh4MVQ4?=
 =?utf-8?B?V01jaUtxRlFtZ3djNHk3Ykl6eTRBNFdkSkVVRHZ2RmpHdGpWbStiUlluRmFN?=
 =?utf-8?B?SER4WFdWaGVzYkdTMEVBbDJmb2NyUXIvUVZDdU4vbmpCN0Y2aWJrMnhVTlZT?=
 =?utf-8?B?WTVqSDVqVmpDempzcjkrRlkxYWRqWnI4SjlEL24vbzVqYk43Mi9XVVVxcG5z?=
 =?utf-8?B?c0ZuV25lMWxSaEdZT0ZrN0JaaXFvVGxORDBQbDRJRjhVRHdUYUZjWE5QNVBx?=
 =?utf-8?B?NEJBTmRSL2tLMlhZYXZuNndmNitxTW84WFZiL3Y2QkhrU0J4YndiZTRLMEl6?=
 =?utf-8?B?SnRsaFBMbE1wakIzb3FHMUp5dFRYc09ESGhDRTBvUlZYOXQra3ZzZ0xGUVRI?=
 =?utf-8?B?Mmw1aXZGMEJhaXNGRFdBZ1ZXUTNGQm55ZEJoTUFJbnVobU9BRktUWTl1Znl3?=
 =?utf-8?B?c3NPcDhNNkxkVmcyKzZ3UnVnS3lqRWZWOXRocTdDbFJTTUNuWkdxVC94MTlH?=
 =?utf-8?B?MGpNeGdscWp5U1dnSDltQTZqU0dNTW5JMDZKUHRZVlZOakVoR1R4dk41bU14?=
 =?utf-8?B?QzVEVTlONlA1S1laN1hqSDMyNEhKOHBGUUZva3Jjby9UMy9LSXlQb0FPMkxI?=
 =?utf-8?B?M1BMQ2VnOE0za0Z1bGo2RUVSMCt4aTRlNE13RWdUdEZRYUhOczZaRGF0bG1N?=
 =?utf-8?B?WnFqVXAyLzNPS2RUcWpUNld0dEFZTVBBaUZiTWJKYXMxWUdMZE5wMFEzWnoy?=
 =?utf-8?B?bkl0bEl1Y3BmdXRNNUNxb1VxME5HSjR1VStYUUVLQUtaSkwzd2U5ZTZ3Qldu?=
 =?utf-8?B?b1pnWFIxdnRqNGZyNDVrQ2RZQXJidUZ5bWxPYUQ2L1NYSzVxc1k3ZWpnT3ZE?=
 =?utf-8?B?NG5tN2dEdlNXZHFlazRqcXBCTVA5WURnU2tHalYwQlNGVUFnR1NyYjF0d2tG?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad1b9ec-3bb5-4bc0-cd8e-08dc6a8696d1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 09:02:27.1106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pT7Nq/ehPes3tnyh37ApdSQt7FvJOkgap+/4su4LNoRsVAJJpMV8r/OdcwDlpi/TNXQHOsH0Cs/xAP6qVx+MrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8098
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



On 25-04-2024 01:38, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Add test to check mocs values are retained over suspend/resume.
> 
> v2: Extend test to check S3/S4 suspend states. (Matt Roper)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>   tests/intel/xe_pm.c | 56 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 51442537b..baec50d7f 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -251,6 +251,11 @@ static void close_fw_handle(int sig)
>    * Description: suspend/autoresume on %arg[1] state and exec after RPM
>    * Functionality: pm - %arg[1]
>    *
> + * SUBTEST: %s-mocs
> + * Description: test checks for mocs state before and after %arg[1] state
> + * Functionality: pm - %arg[1]
> + * GPU requirements: D3 feature should be supported
> + *
>    * arg[1]:
>    *
>    * @s2idle:	s2idle
> @@ -609,6 +614,49 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>   	close(fw_handle);
>   }
>   
> +/**
> + * SUBTEST: mocs_suspend_resume
> + * Description:
> + *     Validate mocs register contents over suspend resume
> + *
> + * Functionality: mocs
> + * Run type: FULL
> + */
> +static void test_mocs_suspend_resume(device_t device, bool runtime_sr, enum igt_suspend_state state)
> +{
> +	int gt;
> +
> +	xe_for_each_gt(device.fd_xe, gt) {
> +		char path[256];
> +
> +		// Mocs debugfs contents before and after suspend-resume
> +		char mocs_content_pre[4096], mocs_contents_post[4096];
> +
> +		sprintf(path, "gt%d/mocs", gt);
> +		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
> +		igt_debugfs_dump(device.fd_xe, path);
> +		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
> +
> +		fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> +		igt_assert(fw_handle >= 0);
> +		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
The code in above 3 lines is required for rpm use case only, so better 
to move it inside if statement below.
> +
> +		if (runtime_sr) {
> +			/* Runtime suspend  */
> +			close(fw_handle);
> +			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +		} else {
> +			igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
> +		}
> +
> +		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
> +		igt_debugfs_dump(device.fd_xe, path);
> +		igt_debugfs_read(device.fd_xe, path, mocs_contents_post);
> +
> +		igt_assert(strcmp(mocs_content_pre, mocs_contents_post) == 0);
> +	}
> +}
> +
>   igt_main
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -703,6 +751,10 @@ igt_main
>   				cleanup_d3(device);
>   			}
>   		}
> +
> +		igt_subtest_f("%s-mocs", s->name) {
No need of braces for single statement.
> +			test_mocs_suspend_resume(device, 0, s->state);
> +		}
>   	}
>   
>   	for (const struct d_state *d = d_states; d->name; d++) {
> @@ -767,6 +819,10 @@ igt_main
>   			dpms_on_off(device, DRM_MODE_DPMS_ON);
>   			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
>   		}
> +
> +		igt_subtest("mocs_suspend_resume")
> +			test_mocs_suspend_resume(device, 1, 0);
> +
Remove extra blank line.

Regards,
Badal
>   	}
>   
>   	igt_fixture {
