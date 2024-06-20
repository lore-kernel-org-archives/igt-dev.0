Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB8FC2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52F110E870;
	Thu, 20 Jun 2024 23:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bi3tZbd1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A488B10E870
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718926804; x=1750462804;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kqpodXk+1T22OG00mYXgI9cmvk9i4Lqbtc3CEbchVC4=;
 b=Bi3tZbd1daUN8X6qecms9M+WEfe7mxJ1Y6BWBBGfGo8aEYvSxpm8EGA7
 s55EsDsrYCVP/HU37q/cVpvn3aioApAEgaQQkD+RUmwZFynEQmaaSoruV
 mw6+PBTVFxk0d65m8AvIbusgwDPBhL3w+AA3ecKRhauYhlTw6l9ri3ZJg
 kKWsFDEZttmo+mdUEO0qnnRk7p8Cin13TtXIlvJHAx64ihspwMdv/30WJ
 +fwxCvivg0g6gPIPaxvl71rIgT9ouvk9kYXEM5B7Xa6PHIfqsyMRM75uJ
 NqtDamTs0xzlqzoPKjb6kTulbcAQwX5XOqtyv3xmK+wxq466amoZb7sHP w==;
X-CSE-ConnectionGUID: Y4y7Vr7lRm2x3iffbSdP+A==
X-CSE-MsgGUID: 60i1q8t9QdCRvjG8JopEuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16056189"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="16056189"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:40:03 -0700
X-CSE-ConnectionGUID: nF9XVAl7T5+AUq5t2AuSpg==
X-CSE-MsgGUID: sIL7eivPQ4ONqSMkItaEYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="43083448"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:40:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:40:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:40:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:40:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nc1JCy5OHxmOp3I9hX4Odnknx6QiNHh91UirHfFw0ySPmd9sftYmVvvIa978nIhtpWuRpEHzE5Lq2enx+o9ogzV+RoMLmE3ksXAiLNBN5M+kWRLhb7Uoea+Pxl1uRBhhNKoffWjXyumeilgpLvG6gxGhpgpqcgTIBzE1jlhnKl+cj8ZHsisDBWcjuJG99wFTBJ+wuV/ypR/oZFoYCbnIoQ/DV5dFNC/nlDqVumRijHdEco/qvzxzus2uC4i5SxRl5yKbdKJoIWIvVK4jf3sJRYD2K8kTe1oulm4acw7x0NpNOG9kLJYpoyVDN5txhylE3zdn5AOJlTc3yIUQ51CpaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfB2crgw+245fX6oycO8NFhHOVFcl/rU7WOgm+aB6A4=;
 b=NqwKvw7Eo+qM9uI0nWWeTh3JzMh1dnm8UOmbLIZXHDxjUuq5u+SPJQhMbPnIkRvbFBx7tSu3wF3LjuuQ2nYaEpwwyZTp9fHNnqHyiPAJ3bYCiBcTcWmt1MW3r1+k53FX5+SJn/Pe2ZMy/kuFXTpNMoQwncC1ZXOKk/HoiodeTlI73twV5zWCW7JkdfkQYV/jY8DoVOopGG8sDEH4Sa4vdTjohIJd2iepyPIGQnEzibJ0EpHQdAK1/yEvyNCf5bWLPM4rLxdZWThuqiVwScG3svgHGbmTgVl0ibUxLQ4LA7GApu/7oEg60VIi+JdkCsvGL+eQQLkwwXPHILKrGbkB/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 23:39:57 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:39:57 +0000
Date: Thu, 20 Jun 2024 16:39:55 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 20/28] tests/intel/xe_oa: Register whitelisting and
 MMIO trigger tests
Message-ID: <ZnS9y26e9VYA1ZWI@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-21-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-21-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0344.namprd04.prod.outlook.com
 (2603:10b6:303:8a::19) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: 82161a35-63bc-40e7-dce7-08dc91824b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2dSVWVUeWY0S0FIRzRmVzd0bjJmNHE1YURyWWNCajlDVHNYNUxwQ1pmaDZE?=
 =?utf-8?B?akIyUUttb1ZGVmZZMDVDYTY4OXAzRjJHaHg2Nm9Oc0QvaTAwZXZkZURSU0Fu?=
 =?utf-8?B?Y21GVFNaOHBrZlZ5ekVnYmd2UjAyZWkzeU12NFVvMTNtNlp0M1RKa1kvMXpF?=
 =?utf-8?B?WFl6UGVUOXA3a3FiMXdUVmdnMmdXNnZjSFI5V21ZMmVsZlo5bjVna0kydld2?=
 =?utf-8?B?Y29UL1FkanJKbmQyR1RVaHY2NWwzWFpTVDhxKzd1ckF1ejFVVXZKdGEyd1kr?=
 =?utf-8?B?eWNJMlFDUzgyVWN2My9obFozUlBLbGVkM2pmSHBLYklQMEJ1a1lpZERpcVdF?=
 =?utf-8?B?VmlVQ0tCMHJ6U050QVNCeHQvV3NDbFZVQ3FTT1F3aWtua1JWaTNGSFpsbGhN?=
 =?utf-8?B?SWJGQ0dnOU82MmN5N1JnTkNpcHk1aEVycitBdzc4N2VvamRic0lybHZPd2pM?=
 =?utf-8?B?TGFWQ0oydVBLb2xyc1hxVjBEZGhRRDhhZkNQTlBMVi91d2dWcDB0MlhiMkc0?=
 =?utf-8?B?ak9uNW0ySTM1eXFrY3ltaVlLdkRFUnRzdWJ5UCtjeExySy9hUnJKcXFFUU9w?=
 =?utf-8?B?VVVLRjBTMTM3NGx1WXAwbmViLy8rWFNLTGRHOFlpS3lHd1ova1ZTZGNsdW1r?=
 =?utf-8?B?SHJsR0dvNG1ubGJvcFpvQ3FUTlArTXRNZWtocnEvMVNDcThQSmRHUUx2VkJZ?=
 =?utf-8?B?S1dhNXpKTk9DaExPMWpPSkhVWW9XZkVGRExmaWVjYWpuK1BGSEdSTDRzcDBm?=
 =?utf-8?B?TEtiSWNXTDVnOTdUajBDR0hFY2ZSUjkxTlZnUG9kQXRRejgweTdJR0JZcEsx?=
 =?utf-8?B?dVd0M1BRdUNZTWl6dmpySEVPeGZmQSs1R0JDYlJCOWgvMmlwTk9Mcjhxbmlk?=
 =?utf-8?B?ZGtxRTJLRi9ES2xvRXVHQURRcHlMVDRkZE4yQUpNdzhSWHdBN0ZxejZGYlFE?=
 =?utf-8?B?dzdxTVVoc3NJbWZrWDhoSnBWdFhvKzFQaks0K05SbWp5OU5rc0krRUhtQjRm?=
 =?utf-8?B?cm81UmMxSmJ3LzlMbEppRlFEUDBoOS9IeUhQaVFWTGFtS2pZNmVwRllMbzNO?=
 =?utf-8?B?UnNPL1UrZjZyZVV1TVhrL1A3UjhFOFNmNytmclc0ckdSRmcrM3N6RmhQY0F4?=
 =?utf-8?B?ckduenNMOXJXbEh2UUxqZDBOV09oZ29zY0prd29nMjJvbmUrOGJjRG5aSmow?=
 =?utf-8?B?U0tTaUlJYlJjWFF6Z1o3Vjd3YXNWUEszSjBXbmphcm05Zjh1OGcySUZZcHg5?=
 =?utf-8?B?ZjNseEpZZHZQY3FlaStGMDZkbittdzRCd3lpNDNoUmttcjlVTWhPVkhRaE83?=
 =?utf-8?B?bkozT2EwZlFWTFoyNWVleWRMRVhPd0ZRQ2FkRXIvUHdLZnIyT3lVbnVoL3FT?=
 =?utf-8?B?eVUwM1k0dllPNlMxU3FPK1MxY1Q4VDJHSXpJdXZDcEhHVTQrNWxTN2dseTVp?=
 =?utf-8?B?WWdMSFprUUQ2MlV2UDlHWktUVnI0eDk3dEFzU3FKU2RPRWhJTDU0TWQrK0hp?=
 =?utf-8?B?am1KcXJkL0JMNFgxOXc4NUlweS9jQ3JCQk9aQURvem1HcDN1K3gxRmxJalVj?=
 =?utf-8?B?L0JjVXBBRHVIOVlMWk9aeTJ3RFNvNXQ3Vng0cCtqdEFXWnVoUlZrQ0w0eUJO?=
 =?utf-8?B?YzJCUUoyREV3QUd3ZzBtU2dVRVdZNDJjRWQ0Z2oraTlMSC95cXNBa1N3RXBF?=
 =?utf-8?B?SzExUzA5QVIxMDVPT21rWGZSVnM4R2R3WTUxTGowOUVlMThNWXJ4MVZuYnJ3?=
 =?utf-8?Q?nOMo5Ba5rqmAnFls9bttTYN2H+kx7xCC8LSA8Nl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFkxZjZZQUhmT2hoZFpYWjFFa0lkSUdqZk1tRmJ6djc1NmpwcUVsdG5NWkZo?=
 =?utf-8?B?TFpvK0k0VTIvTkVNNTJPbnhRRnZ4YWhWRU40RGNIWWVCMEZmRVhqUkYveEw0?=
 =?utf-8?B?SzgvdzFUcjV5dVh3T2xGQTNtRG8vQjhYUytCcW9iajh2S25QYWtncHBvTXRz?=
 =?utf-8?B?Sk9VaEMyUm4xMFZ1cU1XOGI0aFBZbTJNZFRyYlQ4NGQwWklvZThGWEd2TVZM?=
 =?utf-8?B?QzFFM0xOa1JZUmt0cTBpazNDNkFwejc5bUpEdXpVUXBXYlBVMFgvNkhtMWhL?=
 =?utf-8?B?T24zV2o4SWdweFQwenRBcTgrVGpyd3hvNmRwazNpK01qU08vU3VJUVRubVJi?=
 =?utf-8?B?QjZjL2NpQ0Uxc09FMTlabDJRUSs0VkN0UjBmUUNhUlBoZ3lLOGZDQWt2RzVo?=
 =?utf-8?B?a2xUckFDY1krK3lzVHlZV2JmUVg2VUk1aFV6eURGby90U3FsSURzaTVJU3M2?=
 =?utf-8?B?d1p6V3BGcUp6TXlmYVE4ZFBaN1dmOVpPVGg5WmlGWk01TXhoajkxSElFUzNR?=
 =?utf-8?B?b0dhaEQzVlFVK0Q5eWczaGYwQjhOMjhjVXoyZkg5UjZrZk4wYmJLTUdnRTIy?=
 =?utf-8?B?MUxkQkZESTRWdktLTTVVNk1sYklMYjUvajd5aGt3WEpLQTFEVW55Y21SS200?=
 =?utf-8?B?WUg2Q0VHeWxBaTQvZ0FONFM3WlVUdWlCWkY4eEVqS1pPTUYzNnpzVVpCUHlx?=
 =?utf-8?B?OTB0TWtrU3B1VndUSXYrU3FuUEJ4Y3NUdUJ4dTFRRlV4bWhDN1JBVUwvbXZz?=
 =?utf-8?B?N2c1cWRDbnl3S05FM3dPWUpkVkZXb3pXZHhyWmpPZ0k2N3V1WnhKb2RpdmNy?=
 =?utf-8?B?UjNmZGZmNzlxRWw1bTFkek1ISUFlQWNhanE0NWYvc1RldnZQYUNGRUdZemZF?=
 =?utf-8?B?NFhKcklQWmVEcUFhZGh2MVRwd2F3ZU9hcXZncUdrcXNkRXcwRDA2SGdmNTRr?=
 =?utf-8?B?ZFJieGMvZ0phallKbWN4NERHOTdsd2NuaUlaclJmbHZ0U25KSkw2bkxnU2Ja?=
 =?utf-8?B?REwwV3VtSFJtVFc1NGtNM0JHWVB2RXhzRTN3Z0M4b3RqUVZWYnZCNE5UL2dG?=
 =?utf-8?B?UnF2NEt2NDFaeTBYcmlRK3dpS2I4TWYwbXVyeExTL0lUYXhUWFJNMDYrZzNm?=
 =?utf-8?B?UnMyOS9YTGhZeWR5aGhnSGwyK2NmMGs0eGsvejBCSDZCbVI5NU01NHBlaFUz?=
 =?utf-8?B?bjNrMkdGcUE4ZDQrSndUZDBNckNoQ3QrZGpkcm93MWhqUDZ0UWVRUXlqcjFs?=
 =?utf-8?B?TEVQSDY0YVUwcGwvSXgrMGxHSSt1dHpSNHNZVU9UdUFnMmdQeno2TUNEdFpq?=
 =?utf-8?B?ZnBxSmlOWmE0K2dlUFhlTzdxejJOU1R0R2c5Q1E4dGs2ajE1MWtjRzQ1NnZi?=
 =?utf-8?B?OVNZYng3SGIwN1l1cGtWdjd1a2NWZ1FjYmtzYjFqbHNFd1IrRjN4aEtWbEZi?=
 =?utf-8?B?WGtrUEdnZGV3MHk5OFZVRlVUWjZqbWFqSXBWSXZmQ3dJTXJwaVMvU0FPQXhj?=
 =?utf-8?B?bFhsMy9BTWVmS1ovaXpiYjNzMHd6em9OVzloL3dMWFVyblFyY2l2MGRiOWwx?=
 =?utf-8?B?UDVmOUFBbkUvQ1pvdmtOZzZaSzE3M0JHQnkzamxiVGt2Y1QySGcyZ2hEMTdw?=
 =?utf-8?B?YUdvbmxvaHhkbG5NbWtUUWgrRk0rdkFyTFZ0REVyWXVEREU2UHlGUW80Mmh3?=
 =?utf-8?B?K1NncmY5SW9KdGFQbzRjc0VUWEpmZHlSR2ZCVktyR1FBbmtOMldFdGdWV2Ns?=
 =?utf-8?B?YUlXN1RwQXdORHJIV1hhMzVETGl6bjBNWWZyNUhDc0pwVFNnUHowMGNqVGNG?=
 =?utf-8?B?ME1LdjRmWlkvTkxKd1ZxaFBzb01GWVMxTXlFVUhrTSs0ZlBTN0hFQzM2Nnll?=
 =?utf-8?B?ZVlGZkViaFFTRTRrSXlvZGc4WkJaY2s5RVFvU0Q4c2U0WnZXTmJ3cFEydVRn?=
 =?utf-8?B?QlVXcUg3NCtFUTc3V1hIS2pYd2FWVmVteHg4UjFRZ21WdGdaWUlkODdLNFBK?=
 =?utf-8?B?YXBMeTJCYlozRm1ZMnhmZENWaUVEbWsxNWxSUEU0SzhwVkJiWWZZcUR1L0hH?=
 =?utf-8?B?eVhxSWlWekJSOUxJSldScU16aDE1aFNmOFFvcFJSdkJhTm1MYlRwZkZtV1hO?=
 =?utf-8?B?RHpFQzdWTWhkbnl1VG9vT1E4WkYzODFTS1orNVZiQ3pWZ3ZEbHA0V2hRU3By?=
 =?utf-8?Q?0Wh6COZv+ZBNZ28tIYM3dYI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82161a35-63bc-40e7-dce7-08dc91824b71
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:39:57.8223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6v4S5HlKMxzArxdEH4lomsY4+/e5R/to6jpGJjuOsfEhpG1sPoDdofee+Y6c8Oi0zStoZm14SURqcCGHGHNXEiP01pB/ivT2DTFABXf/OY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
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

On Thu, Jun 20, 2024 at 01:00:45PM -0700, Ashutosh Dixit wrote:
>Add the following tests:
>	* "oa-regs-whitelisted"
>	* "mmio-triggered-reports"
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> tests/intel/xe_oa.c | 327 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 327 insertions(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 30d1ed329f..ec486c3a80 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -3896,6 +3896,317 @@ test_whitelisted_registers_userspace_config(void)
> 	xe_oa_remove_config(drm_fd, config_id);
> }
>
>+#define OAG_OASTATUS (0xdafc)
>+#define OAG_MMIOTRIGGER (0xdb1c)
>+
>+static const uint32_t oa_wl[] = {
>+	OAG_MMIOTRIGGER,
>+	OAG_OASTATUS,
>+};
>+
>+static const uint32_t nonpriv_slot_offsets[] = {
>+	0x4d0, 0x4d4, 0x4d8, 0x4dc, 0x4e0, 0x4e4, 0x4e8, 0x4ec,
>+	0x4f0, 0x4f4, 0x4f8, 0x4fc, 0x010, 0x014, 0x018, 0x01c,
>+	0x1e0, 0x1e4, 0x1e8, 0x1ec,
>+};
>+
>+struct test_perf {
>+	const uint32_t *slots;
>+	uint32_t num_slots;
>+	const uint32_t *wl;
>+	uint32_t num_wl;
>+} perf;
>+
>+#define HAS_OA_MMIO_TRIGGER(__d) \
>+	(IS_DG2(__d) || IS_PONTEVECCHIO(__d) || IS_METEORLAKE(__d) || \
>+	 intel_graphics_ver(devid) >= IP_VER(20, 0))
>+
>+static void perf_init_whitelist(void)
>+{
>+	perf.slots = nonpriv_slot_offsets;
>+	perf.num_slots = 20;
>+	perf.wl = oa_wl;
>+	perf.num_wl = ARRAY_SIZE(oa_wl);
>+}
>+
>+static void
>+emit_oa_reg_read(struct intel_bb *ibb, struct intel_buf *dst, uint32_t offset,
>+		 uint32_t reg)
>+{
>+	intel_bb_add_intel_buf(ibb, dst, true);
>+
>+	intel_bb_out(ibb, MI_STORE_REGISTER_MEM | 2);
>+	intel_bb_out(ibb, reg);
>+	intel_bb_emit_reloc(ibb, dst->handle,
>+			    I915_GEM_DOMAIN_INSTRUCTION,
>+			    I915_GEM_DOMAIN_INSTRUCTION,
>+			    offset, dst->addr.offset);
>+	intel_bb_out(ibb, lower_32_bits(offset));
>+	intel_bb_out(ibb, upper_32_bits(offset));
>+}
>+
>+static void
>+emit_mmio_triggered_report(struct intel_bb *ibb, uint32_t value)
>+{
>+	intel_bb_out(ibb, MI_LOAD_REGISTER_IMM(1));
>+	intel_bb_out(ibb, OAG_MMIOTRIGGER);
>+	intel_bb_out(ibb, value);
>+}
>+
>+static void dump_whitelist(uint32_t mmio_base, const char *msg)
>+{
>+	int i;
>+
>+	igt_debug("%s\n", msg);
>+
>+	for (i = 0; i < perf.num_slots; i++)
>+		igt_debug("FORCE_TO_NON_PRIV_%02d = %08x\n",
>+			  i, intel_register_read(&mmio_data,
>+						 mmio_base + perf.slots[i]));
>+}
>+
>+static bool in_whitelist(uint32_t mmio_base, uint32_t reg)
>+{
>+	int i;
>+
>+	if (reg & MMIO_BASE_OFFSET)
>+		reg = (reg & ~MMIO_BASE_OFFSET) + mmio_base;
>+
>+	for (i = 0; i < perf.num_slots; i++) {
>+		uint32_t fpriv = intel_register_read(&mmio_data,
>+						     mmio_base + perf.slots[i]);
>+
>+		if ((fpriv & RING_FORCE_TO_NONPRIV_ADDRESS_MASK) == reg)
>+			return true;
>+	}
>+
>+	return false;
>+}
>+
>+static void oa_regs_in_whitelist(uint32_t mmio_base, bool are_present)
>+{
>+	int i;
>+
>+	if (are_present) {
>+		for (i = 0; i < perf.num_wl; i++)
>+			igt_assert(in_whitelist(mmio_base, perf.wl[i]));
>+	} else {
>+		for (i = 0; i < perf.num_wl; i++)
>+			igt_assert(!in_whitelist(mmio_base, perf.wl[i]));
>+	}
>+}
>+
>+static u32 oa_get_mmio_base(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	u32 mmio_base = 0x2000;
>+
>+	switch (hwe->engine_class) {
>+	case DRM_XE_ENGINE_CLASS_RENDER:
>+		mmio_base = 0x2000;
>+		break;
>+	case DRM_XE_ENGINE_CLASS_COMPUTE:
>+		switch (hwe->engine_instance) {
>+		case 0:
>+			mmio_base = 0x1a000;
>+			break;
>+		case 1:
>+			mmio_base = 0x1c000;
>+			break;
>+		case 2:
>+			mmio_base = 0x1e000;
>+			break;
>+		case 3:
>+			mmio_base = 0x26000;
>+			break;
>+		}
>+	}
>+
>+	return mmio_base;
>+}
>+
>+/**
>+ * SUBTEST: oa-regs-whitelisted
>+ * Description: Verify that OA registers are whitelisted
>+ */
>+static void test_oa_regs_whitelist(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = sizeof(properties) / 16,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	// uint32_t mmio_base = gem_engine_mmio_base(drm_fd, e->name);
>+	u32 mmio_base;
>+
>+	/* FIXME: Add support for OAM whitelist testing */
>+	if (hwe->engine_class != DRM_XE_ENGINE_CLASS_RENDER &&
>+	    hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>+		return;
>+
>+	mmio_base = oa_get_mmio_base(hwe);
>+
>+	intel_register_access_init(&mmio_data,
>+				   igt_device_get_pci_device(drm_fd),
>+				   0, drm_fd);
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+
>+	dump_whitelist(mmio_base, "oa whitelisted");
>+
>+	oa_regs_in_whitelist(mmio_base, true);
>+
>+	__perf_close(stream_fd);
>+
>+	dump_whitelist(mmio_base, "oa remove whitelist");
>+
>+	/*
>+	 * after perf close, check that registers are removed from the nonpriv
>+	 * slots
>+	 * FIXME if needed: currently regs remain added forever
>+	 */
>+	// oa_regs_in_whitelist(mmio_base, false);
>+
>+	intel_register_access_fini(&mmio_data);
>+}
>+
>+static void
>+__test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
>+{
>+	struct intel_xe_perf_metric_set *test_set = default_test_set;
>+	int oa_exponent = max_oa_exponent_for_period_lte(2 * NSEC_PER_SEC);
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = sizeof(properties) / 16,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
>+	uint32_t oa_buffer, offset_tail1, offset_tail2;
>+	struct intel_buf src, dst, *dst_buf;
>+	uint32_t mmio_triggered_reports = 0;
>+	uint32_t *start, *end;
>+	struct buf_ops *bops;
>+	struct intel_bb *ibb;
>+	uint32_t context, vm;
>+	int height = 600;
>+	int width = 800;
>+	uint8_t *buf;
>+
>+	bops = buf_ops_create(drm_fd);
>+
>+	dst_buf = intel_buf_create(bops, 4096, 1, 8, 64,
>+				   I915_TILING_NONE,
>+				   I915_COMPRESSION_NONE);
>+	buf_map(drm_fd, dst_buf, true);
>+	memset(dst_buf->ptr, 0, 4096);
>+	intel_buf_unmap(dst_buf);
>+
>+	scratch_buf_init(bops, &src, width, height, 0xff0000ff);
>+	scratch_buf_init(bops, &dst, width, height, 0x00ff00ff);
>+
>+	vm = xe_vm_create(drm_fd, 0, 0);
>+	context = xe_exec_queue_create(drm_fd, vm, hwe, 0);
>+	igt_assert(context);
>+	ibb = intel_bb_create_with_context(drm_fd, context, vm, NULL, BATCH_SZ);
>+
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+        set_fd_flags(stream_fd, O_CLOEXEC);
>+
>+	buf = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_PRIVATE, stream_fd, 0);
>+	igt_assert(buf != NULL);
>+
>+	emit_oa_reg_read(ibb, dst_buf, 0, OAG_OABUFFER);
>+	emit_oa_reg_read(ibb, dst_buf, 4, OAG_OATAILPTR);
>+	emit_mmio_triggered_report(ibb, 0xc0ffee11);
>+
>+	if (render_copy)
>+		render_copy(ibb,
>+			    &src, 0, 0, width, height,
>+			    &dst, 0, 0);
>+
>+	emit_mmio_triggered_report(ibb, 0xc0ffee22);
>+
>+	emit_oa_reg_read(ibb, dst_buf, 8, OAG_OATAILPTR);
>+
>+	intel_bb_flush_render(ibb);
>+	intel_bb_sync(ibb);
>+
>+	buf_map(drm_fd, dst_buf, false);
>+
>+	oa_buffer = dst_buf->ptr[0] & OAG_OATAILPTR_MASK;
>+	offset_tail1 = (dst_buf->ptr[1] & OAG_OATAILPTR_MASK) - oa_buffer;
>+	offset_tail2 = (dst_buf->ptr[2] & OAG_OATAILPTR_MASK) - oa_buffer;
>+
>+	igt_debug("oa_buffer = %08x, tail1 = %08x, tail2 = %08x\n",
>+		  oa_buffer, offset_tail1, offset_tail2);
>+
>+	start = (uint32_t *)(buf + offset_tail1);
>+	end = (uint32_t *)(buf + offset_tail2);
>+	while (start < end) {
>+		if (!report_reason(start))
>+			mmio_triggered_reports++;
>+
>+		if (get_oa_format(test_set->perf_oa_format).report_hdr_64bit) {
>+			u64 *start64 = (u64 *)start;
>+
>+			igt_debug("hdr: %016lx %016lx %016lx %016lx\n",
>+				  start64[0], start64[1], start64[2], start64[3]);
>+		} else {
>+			igt_debug("hdr: %08x %08x %08x %08x\n",
>+				  start[0], start[1], start[2], start[3]);
>+		}
>+
>+		start += format_size / 4;
>+	}
>+
>+	igt_assert_eq(mmio_triggered_reports, 2);
>+
>+	munmap(buf, OA_BUFFER_SIZE);
>+	intel_buf_close(bops, &src);
>+	intel_buf_close(bops, &dst);
>+	intel_buf_unmap(dst_buf);
>+	intel_buf_destroy(dst_buf);
>+	intel_bb_destroy(ibb);
>+	xe_exec_queue_destroy(drm_fd, context);
>+	xe_vm_destroy(drm_fd, vm);
>+	buf_ops_destroy(bops);
>+	__perf_close(stream_fd);
>+}
>+
>+/**
>+ * SUBTEST: mmio-triggered-reports
>+ * Description: Test MMIO trigger functionality
>+ */
>+static void
>+test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
>+{
>+	struct igt_helper_process child = {};
>+	int ret;
>+
>+	write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 0);
>+	igt_fork_helper(&child) {
>+		igt_drop_root();
>+
>+		__test_mmio_triggered_reports(hwe);
>+	}
>+	ret = igt_wait_helper(&child);
>+	write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
>+
>+	igt_assert(WEXITSTATUS(ret) == EAGAIN ||
>+		   WEXITSTATUS(ret) == 0);
>+}
>+
> /**
>  * SUBTEST: xe-ref-count
>  * Description: Check that an open oa stream holds a reference on the xe module
>@@ -4563,6 +4874,22 @@ igt_main
> 				closed_fd_and_unmapped_access(hwe);
> 	}
>
>+	igt_subtest_group {
>+		igt_fixture {
>+			perf_init_whitelist();
>+		}
>+
>+		igt_subtest_with_dynamic("oa-regs-whitelisted")
>+			__for_one_hwe_in_oag(hwe)
>+				test_oa_regs_whitelist(hwe);
>+
>+		igt_subtest_with_dynamic("mmio-triggered-reports") {
>+			igt_require(HAS_OA_MMIO_TRIGGER(devid));
>+			__for_one_hwe_in_oag(hwe)
>+				test_mmio_triggered_reports(hwe);
>+		}
>+	}
>+
> 	igt_fixture {
> 		/* leave sysctl options in their default state... */
> 		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
>-- 
>2.41.0
>
