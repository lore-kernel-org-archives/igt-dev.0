Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B655E9A745
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E842410E453;
	Tue, 24 Mar 2026 09:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CDzCAANp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDEC10E453
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 09:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774343937; x=1805879937;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H8DI2H0Rifx5HkojhuG8iQ1FpAfbXPH23wdkO7mz3UY=;
 b=CDzCAANpcucdSsYIhfWefSOEvg+L8U0nsPMqCM342fno4cC89I72yFyO
 WpyYjrKB9aYZXahc4vuurO2C+AhGa2EHBgrLe8sBIRu0LUNQwJqHmK4oR
 sOPlBWN5i9Bps3lu6x16if5EWQ5msC7XSAvrFs9ucmsZeRgleG58mpBtF
 PQ7hJUQxX4moZzoJ7JPoWJ2IeB8NvDxWXCWnLkGrJjkN2EH4CKasEj9+V
 UHTMQFhUXAijtMwENfrIybiJxHbXjQSuLAwV/SdM/EuHMk5IIhy5SfSC1
 iJ76YOiSVdMaPnyo+/gDVSqN3AEO/Ro/0k1IkXuWGopn5m0tL/LUDWD2O A==;
X-CSE-ConnectionGUID: 1xIWXF34QbSGI5yn9G9zFA==
X-CSE-MsgGUID: nzK/D8+tRlyTEwj8jjnt8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="92732861"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="92732861"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:18:57 -0700
X-CSE-ConnectionGUID: pFeLjX/BTr+/6JlezmuUGg==
X-CSE-MsgGUID: qr0spdPNQtqREoEi5GxmrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="219864988"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:18:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 02:18:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 02:18:39 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 02:18:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ph0h8C+xy0lP3ZDNpzmyBVHhIzCKqLMaRcPyLkv1uvxDIpX882ozk8/uafoIp7FYhhFKxE0R8mcwuc5QSAOVVrXtXnhL19uMHaN3dDDqIIsWJkwH7aixzb/PWq6B/fn74+V1m6Ul3QJRqYNlAUdTKLvg0akvtHh5gCSxwNiaO7trItvxauL3ycesrjccwSh6qCYF9uKPvFWrGD3YvCcaZnQWWZgsbikDFlT9fBdojNHV2C1abM5sfLTIZy2IHuDd6ZFl/ngU6pgbeyZrynR/exkVaS9oFjjog2NQekN6HblatU0sqTcz/bZG/LdXm5Xd4jk5VK4oRoV1pEsmlz05hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUPHlTaVMNoP5imFO7l+CpVJ0ZUcmiePsKbCaJ9xRBo=;
 b=eswbZ+w7fqjfy55x1LHvnFcLL6oWSGcg6vshtJ6iEeLB3e82FFHTi7JVwo4cxTEEJzF6arRgJX5YckZq8y8Iy0/vmqXkABUXnsaZ6tR3RABwiEV53iCbFxho5XzQyM2o/HgeAtGLnmdDYTUBdNxRs/RrG9i7E8QcFy+slDiwQtIJdmUupI2X0pkNQ0ChlxFNfrlolwfvB1r/0iDtSD28Cgnpo85onLb7TuUVTaeHfLjTd2B6pDeC+djWDGrTvysy3Ph6vusQLaWktCuVMRP5nrzHCIAP502/djKWm80lpplzpkNsxMet0cD25Qwd5x7gdNl4CoYd4GWCKVvUtzwhtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by DS0PR11MB7558.namprd11.prod.outlook.com (2603:10b6:8:148::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 09:18:32 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9745.012; Tue, 24 Mar 2026
 09:18:32 +0000
Message-ID: <e58d1344-fa87-4dfc-8a37-1964715030af@intel.com>
Date: Tue, 24 Mar 2026 14:48:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] lib/igt_kms: Add lowclk and highclk modes
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <arun.r.murthy@intel.com>
References: <20260317053038.51570-1-santhosh.reddy.guddati@intel.com>
 <20260317053038.51570-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260317053038.51570-2-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::14) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|DS0PR11MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f78411-eb6f-422c-8d24-08de89865193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: cQXywxt3ukKxg0RHQWarm7pkXygePD0KDWNFWz59zkk8/qLh0YB5JZdrh5wnWxrWgf/AAYYrPn2Awl3+EU7XpopIr3tz4LnVwMFuOZ3R0FIp7p0gXSAxOHnrdkT2BDJ8EM82cDRMoLqFHGN9BKT4uZq2MqrW83fNXuKS08tnBtjL92dRPXasrE6NaGIDY2oa5akESi4s2RbjYuyIGTxZHOiiqZ4M3VcdDu+m14R9x/eg4Ay6VUKxenLIwaT0od49CChJCF5O5krmMJs/XAcXH8Xx+GK5JlQfux9zakpLCRX+1tIk3PuqH6W9c2+QTBmKCU0RXfVdEyED2tzoli9ujw9NAQgmilpUyErzwRQCocncxzvyYNvbBf58N0fBE/HY9OVQwQhfAuw14TunEtGVvrp7loZiUiqNvFdsPYS222vqH53ixhozGFKc7fqboHw6bkCzRFpVGIQCNAdURIhas8PSx1zjoEG/mQnLzUfcmph1jB7Mbq97fCrXsjnsE0NUzKbSGtRoNZKYiT/l6OZ6nctICGDpNvlVApeU+BWL5Nu6dVEeKnbHHBF6uSlupAF+7dh9/cz3HD6n6MGmxahKkSQCe/TXe8yAaDv7L0/wFIxM+1fNaaWfwNvxO0KfXdHn8yaVGw3ugcJ+/ZxCFt92Y+R6v4vvQ5BvZAFMISnFolDnDAbffYx6pXtSVW6BVVsrlqyOVfSefTgoNRztKsSoxW9Nxs8gQWLt/vDojn3uCPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STY5K3h4TGpwZSs3elAyTjI4RTkzOWowOUExano3ODVET1VZV1RiYUNxdjdx?=
 =?utf-8?B?NjlFUjhFUlpIM3V0RmhweTN5cjVBdHFVMnEzNlVmSzFSM3pzdjNpcG00UzlH?=
 =?utf-8?B?emhlRE41WkJWQXBEVm82U2NkbmJBVnhMVlJlVkFIVTUvTlVzbFBVRUFsajZm?=
 =?utf-8?B?eU9KQ2RCNHY3d3MvZWhQNDBkdmZ5MjE1QUJIT2I5Q1NybUROcEFVZHdIUU8y?=
 =?utf-8?B?QTliY1JLNk1QczB0cWF4TDFJM2RSaHJUaHFZNzBwazRJMUVadVZZQ3JlSzV2?=
 =?utf-8?B?SGZWWTc5UW5GR1JYOU9EZC8yVm9na09NYmY4M25oVVNDQUxWMkt5UWlidlFP?=
 =?utf-8?B?T3BOSWRhK0E1WExZc25GMkdRNldmdjY1Y3pnNnQwaFBHcUVGeTdKN20rSEk5?=
 =?utf-8?B?Tmhyd2wrMWR6ZWtkWXZCd2k5SllRVVdjL1RNYm42L3E5NWQzVW1Dbk5GUkg0?=
 =?utf-8?B?Q3Z0bkJLRVJhRE1CamhoR09OOUt4MHRmVjBUT0pkWUNlRGtlMUgxcS9zSkND?=
 =?utf-8?B?V3VDYWZqWExvU1NXZmVJY0x5UzRHVFlTcGxwelpBWFovdFpzdDFieWc0cXBY?=
 =?utf-8?B?VDhsL0V6T0t6REhGZzdabVRzb2Fyb3FxRFBKK2JmODl2U2JXUWxMdTVhVGhy?=
 =?utf-8?B?TnNvOXNUNjdyQmpNN2FtMzkvSmFwWlhsUkdaanhGQ0VsNm1SUUZVS2RtdVox?=
 =?utf-8?B?MmRoNVpsYzNsaXlHTDFlS0lPaWM2SlZ4LzZDTUI0Smc2WG1UMGlUQXpSQzRH?=
 =?utf-8?B?R0dZbkY1eGtjWjlCNWtMZC84Y3Q0N25abnI4dEFnRURWd0FUeVVqOXJzeGJT?=
 =?utf-8?B?UHFGMDN4ME11eVhxZlN6QVhRcDNzQnVGRnluWjBOazBabGVqaGRzZ0JGemFV?=
 =?utf-8?B?K2ZlNzg4NlNzQ1g5VVZjMk5JeklGbURmOUs3Unp3NDNvTzRjQmlBZWdXZTBt?=
 =?utf-8?B?MnFmcnNaUnhNeXZjMkpQblRDM3ppb3BzbjRtK1JtVXBKWEtLWmhDNDB3K1FE?=
 =?utf-8?B?Zzg5Rzgvb2t3cXAvdkR0Q0QxZWlKK1p0Z09VUXJ1dmNYWVZicGZmUm9RK2tR?=
 =?utf-8?B?S3BOdmZpY3AwSi9QclIwb3pyMzBJc01RUm9adDRvSGVwN2ZuK0pseWRZaS9V?=
 =?utf-8?B?MVlmSlVEWmN6VGFQRm55M20zMG1jZEEyQllFUWEvKzgreDIwVDA0N1hRd2hX?=
 =?utf-8?B?ODN1bVVmYkVYYUw2S0V4RHVWZW9LV2NwZkR2UWEzSEFWTGgzZGE1eU4zNHJx?=
 =?utf-8?B?Ly96Y2pweDRXUThHMW9KbUpZQyszSUtlVkdPc2x5Y3NWRUozSTNZaEQ3aGJw?=
 =?utf-8?B?TjhzckR4bmttOXN2SEE1NjMzYnJ4S1lUK0srU3ZmNlM4T2FtYmVMa0tIZ0pT?=
 =?utf-8?B?UnQyME15WExlOUM2WVVQL0tNU3F3Rk9ISlNjc3NOcVpUcm1aYlZITnlZbXdt?=
 =?utf-8?B?OWdubXhEVGpuNXRJY2NwSU5kNnEvQ3JKY3NESXgzQVVBZXozczFxWXVLeUd4?=
 =?utf-8?B?RXYzWUsrS2htVHI4UEQzbjdRNlJQTnl2cTBuK0xTT1Y4VDRvZ3hwMnVYMHQx?=
 =?utf-8?B?bERNOUVVTmg2blZ0QTJMMkgwNnA1WGJSUjZ5T1FDUW5uUVlJdkxLQmgwdjF0?=
 =?utf-8?B?MktMaWI2NGY1cmQwa2F4bGQ1NjdWb29UK0VmU2JBWndxeDREcHRBWXhKRzJX?=
 =?utf-8?B?RThKU2VGM3NiZnFpcUM4UW9MVm5qUm43NTUvOXNLRWM1M1ZkTXE0aVB3Vk9Y?=
 =?utf-8?B?OFlVaDBtUVV2QTlmd1JpYkNETHpXN3Q1bFl2WGpHaDFOWVhSWUpiZ2hxN1k3?=
 =?utf-8?B?aDlxekIrQzhvTHB2ZTl5TWV4STZpMHE0SVFrNXhJS1R6YUU4cFA5VXdoS1Fr?=
 =?utf-8?B?eXQ0VnUxeG5aVld6VU1GdzhFR2JPZ3ZtWXVDbnZHdGRhRnVNSjNRNmp2eGt4?=
 =?utf-8?B?VG5IUkIxRnh6dEhxd1pIV2NTTnRiM1QvdS9JY0JWdkZEVDkyMUJsNCtGYjJP?=
 =?utf-8?B?d2VGd3M3QjFvdE1qOGZPNnJEQk5iaDlMaHNVeWg3clVWR3BxUTlzMmg2cm1n?=
 =?utf-8?B?N29XZXZsaHVwTmVwdkJjZm53TG9NbjM1TjJETCtTdjU4eU9KcXVPWjU3UWNI?=
 =?utf-8?B?bXpPVFRYODNPR1RzOWEyYSs5R3o1bUpJc285eXhQVm5BMm1HTzBaTmZJOWlk?=
 =?utf-8?B?Y2tNTkVjMHBwMS9vOERiYWJZdXVCdHZUZUpCVTJERG5EWTF3QjlqbnBYaUxa?=
 =?utf-8?B?ZWMrc0ZkbjBjWUJrd3ljZ0FDOStvZUNUTzJqUkpqNTJDOEZJOUJJV1dTcVNw?=
 =?utf-8?B?ek5tU0RxWjY0Q1lvcXU4bmFySFJieTZFTHRJNkdKT0RHUks3VzZsMVFDLzhP?=
 =?utf-8?Q?AVioTZGjPKHCGM68=3D?=
X-Exchange-RoutingPolicyChecked: R7sG7jkMRFaOLCBlZq131QSGq1iDf8SOfvXjsVAMxqgkdPEx0905/cv1tvmZ8rpdDVlAekOYVJy6vXihj0f5qVHQQwqWZVUoeIsptg4r9hZZnMZgYRo0rBFlJTJZoug6TH4nR+riHsysQUY/w8r603ZI8C0f5qwNFXJp5qy2mI/snvnUmKEKH/ndP4iVBDJWU37JPYsaLJ8gtIc0/PiUJ8ozmma0zjrSJZMo7eWP8gL6XIBp51j5FiZg2Yf0K0C4siboqpOifdOSunniJPtKpKLjoBIwBs1rAckB/hic9a3Aw7SNV2O9JlOKoFjWTKIKn44RpKHcFuU681vkRE0Qgg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f78411-eb6f-422c-8d24-08de89865193
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 09:18:32.3202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b89DAOd6n3KOxGiV5mq824zNnuRELFO95k9qWCTpkoTLtraBePHGKg2ULyXPwS8BjgnMBlbAbilEDfAe+myicfUXe+vMIvc1qvcQaLkZqpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7558
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

Hi Santhosh,

Imho,  rewrite the git subject something like, "Add helpers to fetch 
lowest and highest pixel clock modes"

On 3/17/2026 11:00 AM, Santhosh Reddy Guddati wrote:
> Introduce functions to return low clock and high clock modes when
> connector supports multiple modes.This sorts connector modes by display
> clock rather than resolution.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   lib/igt_kms.c | 36 ++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  2 ++
>   2 files changed, 38 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 8c42909fc..2ba34b034 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5198,6 +5198,42 @@ drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output)
>   	return lowest_mode;
>   }
>   
> +/**
> + * igt_output_get_lowclk_mode:
> + * @output: Target output
> + *
> + * Returns: A #drmModeModeInfo struct representing the mode with the lowest
> + * pixel clock.
> + */
> +drmModeModeInfo *igt_output_get_lowclk_mode(igt_output_t *output)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +
> +	igt_assert_f(connector->count_modes > 0, "No modes for %s\n", igt_output_name(output));
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_asc);
> +
> +	return &connector->modes[0];
> +}
> +
> +/**
> + * igt_output_get_highclk_mode:
> + * @output: Target output
> + *
> + * Returns: A #drmModeModeInfo struct representing the mode with the highest
> + * pixel clock.
> + */
> +drmModeModeInfo *igt_output_get_highclk_mode(igt_output_t *output)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +
> +	igt_assert_f(connector->count_modes > 0, "No modes for %s\n", igt_output_name(output));
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> +
> +	return &connector->modes[0];
> +}
> +
>   /**
>    * igt_output_override_mode:
>    * @output: Output of which the mode will be overridden
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b3def1e73..6c8e60f02 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -604,6 +604,8 @@ bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
>   drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
>   drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
>   drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
> +drmModeModeInfo *igt_output_get_lowclk_mode(igt_output_t *output);
> +drmModeModeInfo *igt_output_get_highclk_mode(igt_output_t *output);
>   void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode);
>   int igt_output_preferred_vrefresh(igt_output_t *output);
>   void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *crtc);
