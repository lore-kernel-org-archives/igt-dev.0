Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE69C021B8
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 10:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFFB10E26E;
	Tue,  4 Mar 2025 10:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Axcr0g8s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CE710E26E
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741083801; x=1772619801;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L7QmGP9H45wVhqOCHJgGJs2Y7Xj2ukfEAI4Lu6s2jSc=;
 b=Axcr0g8sZA5Dj8ToQYuvOopWa9hUmVETbvEYLJzB+Un9WfripyP3jUnE
 elVP9Y5vomCKJOo49sXokrXouqmiv7aUDZAfKhml6LSID5sx0RCqNS/B9
 z2YEEzwm8EHjsWdCsGp3dSD1wZ+sOGQtXFBgmjtef17gDqqQkf9XPPw8W
 WJJS2aop+DcbZSzJWamIXwTCfz2Hd6XqWg26YcUXHK5ZYRN3NvhKQM6w7
 b3puacPu8bBU7iYBHy/SygkSbtlHeIP2GIf4tB+maBvF0tUr+iRfKQtY+
 d2WCYGXDPOYRlKgydbF3in24bFCQf73oAKaW8I1Vk4LitqWzBcowcDvMR Q==;
X-CSE-ConnectionGUID: c2iFKDXzQwmu0oi6LdFzBA==
X-CSE-MsgGUID: n/ZlG5ncREq6x3TSNJJB+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45919739"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="45919739"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 02:23:04 -0800
X-CSE-ConnectionGUID: rV/vHueCQt6dRvLXuPA1NQ==
X-CSE-MsgGUID: ftw/DgFSTTyF/XXaq6D/2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="141554955"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2025 02:23:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Mar 2025 02:23:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 4 Mar 2025 02:23:04 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 02:23:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7wEwZtzEeQALqoUdWpjt+8h5u9g+M9lBQw5+sNfJ7ISri55tBMVqjd8qOP5LcA7X2PVWn1mufOgmlEjU8iPhe7kl9OV5oGifX7ZliTXDibm2P8G36qzrcFbXq0AGzsUkWB6xOrKDI28926gA7HbO7xpa7S8Dg946S97oSiWIA6GgxJ1k+c2NQxVxiWwT4ElfcV+X4tNxRrkW3VK2lcvK7rz9Z0eTipHn32ErfKWLa8rkkORNBm8HBo2GagmJalU61MWr+9C+fjw1oxDqwLu+6GPPlXqPuZlAfe+1XSrfs3soL4wCTLJW3aJEagfjJFi3rIV1Zy0k+66iIcZ7St92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lq4Hdv/YIdnj7D8Ffz7oCK5cGNiME50e87a+SUzi78I=;
 b=m/mBWYSLsclXIqi3RlbJU2ZkaIyteo8luUGhsYmJbeCNXsq5xi/mEk2S4xf+XAjiWtHZabPjNJrMmxrTP1g7A72XmS8JyfvffrAsWN8E0XPjOBW+I9x5WBoGqFw8Sd9sThdrDifs3FMMCg159AXMosRFOA8S4xuY64pAQA9tIAhAqmaxgSQsRhmFBsFxcQ5/ahP7loJr2D0gDAT8Mr2iaxIIENkALokqRDrA0+BC2arg7ApK8UyP6eRSqqDoiCudvh2Y2yRaN0cOoBN6d5h/B/6WUC9FoZshqMF5BUSCEzR+HGAKLq+tHLQse5hgfsFMjQQH0tTID4BDLuxUJgnV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Tue, 4 Mar
 2025 10:22:29 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:22:29 +0000
Message-ID: <c5e169fb-0a25-4b1d-8abc-440ac3a417ba@intel.com>
Date: Tue, 4 Mar 2025 15:52:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 3/4] Add gputop support for xe specific devices
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <jonathan.ming.jun.lui@intel.com>
References: <20250228141810.1417657-1-soham.purkait@intel.com>
 <20250228141810.1417657-4-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250228141810.1417657-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN0PR11MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: ca3060d5-b911-42e8-28b0-08dd5b067767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjY0MjYvdDBCWTNNNUxDSUFZYkVSMXl6SnRlZ29qMmtQSkZDS0NOQzVFNXZN?=
 =?utf-8?B?VzVzWDBnQ1ZlUXFrZDdwc1dlQWRrdU9CMDhQWW4wOVpvbVNnclVDbm5XdXFG?=
 =?utf-8?B?ek9GKzJxcGNHZG9qTlFMU2hXbDU5alBOSGNHLzRaQ1ZTeGljZTd0eWVMaWdF?=
 =?utf-8?B?NjE4RStsYUUxeUlMSFZWdGozRkttcFBKTEp0VE40NWVLaGEzZXlGdGxVemox?=
 =?utf-8?B?b1JXV08xU1VnOEtiRDFRRHBna2lWaUZPWXpzRGJEVDNzaFBZNDhtOHg0cHp6?=
 =?utf-8?B?RHBiUEtiWnlYdmZDUGJxOEc0QlhIOEVZeVFsWjVNdm5YczFubXRoVzhiWGFz?=
 =?utf-8?B?elRSY253cFJGS2xIRVYwNHV5KzkwTVVucm1OUmpwc0gyWVVNTWIyVFp0eTN4?=
 =?utf-8?B?WFNXdzBpVHZyTEZsZ1Z0dFZFMHU1aTNKZkI3TmhmVDZrWmNNQVVIaTk0RTBM?=
 =?utf-8?B?S0tHZlczTmwwME5mNnVXbzBGOHNKQ2NucXh6dnNaeWdpWUQ5MzN3Qm9iTTJG?=
 =?utf-8?B?RVFQY1dXWXk3RVNBZDE1aDFHRjFYcFBKeE03OGRiUVY4Rkc0R3gxUjVjejFr?=
 =?utf-8?B?SXZmaDhwNkpLNUY3RFV5ZlhOeDRudWZkK0lDWWllSkZNbjlzR2wveUpqb1Zv?=
 =?utf-8?B?QjFlRXJHRTRBV0krR0JneG96N0JhV2d5Y0ZwR0VtRGFTSnhJbDZSQVNKK213?=
 =?utf-8?B?bDVGRGlLTWlkSTZkQ2Z5ZVc5L3FNck9TQ1h5RzdsUVJhTHU1cDhUZG5xYmwv?=
 =?utf-8?B?V2kwZy9YTzVHczVTTU52a0FoUW9ibTdIMXNVSTJ4OUlZQ0xIMERWdFNlNVJH?=
 =?utf-8?B?M2xYVThqbm03aE9vOVVJN0MzR0hyWVRrb3ZEWVJBQVl6SUYwamJuTW9BWTRF?=
 =?utf-8?B?enZ1TVp0ZWdQNUFRME11THVyKzM2QUJnWDBaNkNEZVlXSCtrY09Bek83V294?=
 =?utf-8?B?Q1JqS1BKYjEwVUZhQ2NNZlBPWld6bENWN0RNbndDclNpNmFLTzRpTmdmZTht?=
 =?utf-8?B?L05vOVlGeUk2YWlqRkQ4QzQzaUZRUkxkUkZwSkJEejFCSmllZFE0T0ZYTFBH?=
 =?utf-8?B?UzUwZEFWUTA1QTUyamFaaTRkZ3E3R3FxRGxMMWJHd3BqRDBvYlJva0QyQnFy?=
 =?utf-8?B?ckhYY2VZd0M3ZmNXZU56QjZueERaL1dFQWRBcGZKSHdZdVoybExteGdPVlVI?=
 =?utf-8?B?bEgxQ3JNT01YeFBVY1VXelIvQU82Q1lkR3M4ZkNUZHBYTXN3SzBWeHh6RlRS?=
 =?utf-8?B?NHVrenhhakovWUs3QjJEb2lEMTJJRzB0TjdHcFpZK3BkZisrYzRjMXhKSWZm?=
 =?utf-8?B?UFBhL0pJS3VuZk1zb3BOUUFpc28zY3RaQVduTzZubkpYc2dCbjRsMWorbW44?=
 =?utf-8?B?ZTd4T255dEdlQmZ0d3ZkdWZnbTFveDhUOEs5RWR6OExIS1RBVlFqMEk5dGlp?=
 =?utf-8?B?VGVBNWtlaXZBK1V5dXh0S3pyVFdyMnVxbjFnbHFQUFdMMWZ3a3Q1TERha3Rz?=
 =?utf-8?B?MjlBaTNjdXkzLzFOanRIYk9JUFhWN1hsVTF2TVhYUVRLOURvTkFZd0hUV3Z4?=
 =?utf-8?B?bnBFWEdpVnErVmRKeThLTTZTc3YrYVo1TUFEckdrWDFLRU1SRWZuY00rT2lH?=
 =?utf-8?B?NmRvSi9NaUZ1ZGRZSUxmeEdoQm1YUFhCS1NLbDVoRmFLV2ljSVJJeVZTM203?=
 =?utf-8?B?a0I4c2JaZFd5Z1VMOGQxNHRvV3FFdW81VUtqcWNJMlYrYVdKQThMV0xNZlVm?=
 =?utf-8?B?YlZQRVJTOWZYOEdyckZaYzUyMjVuQTR1TTJKK3JWVHlkSG9penNKMXI5YmlW?=
 =?utf-8?B?VEdLNVh5MlpFbm8ra0FQLzRsUHoyakRkbEkyN3JWV0NjS2ZIcitDNU1vOUVV?=
 =?utf-8?Q?r1PM4uHXP2Veh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmI0VmcvaHNWenFVaFovb01pVXpURnpRem1vZU1kSkVScFJnNk9DZ3FVdE51?=
 =?utf-8?B?YjlqTVN5VVpoaDBqMkVIMzltcXZaaEZhZjJjaGw4cGM5YVlxbHZ1K1haekI3?=
 =?utf-8?B?a2c1VmhFTEZTZVRhb25LUFVrNGNPbHdlV1lLeXhucGlrM1hrY0FTK0xKT0pZ?=
 =?utf-8?B?VFNoaDdNTzhZRVJtRlFQZlcveXNFY3dqV0Y1dHFqc01ZS0JPN04vZzdCeXlp?=
 =?utf-8?B?b1FVVzFYalBTSm5hdGppSk1pZmNjZ25GSkVvUlV5M3gycXJqTWJOOG53eGoz?=
 =?utf-8?B?Ty9QTnJQOU1MWlJwVWlRZWFKQnlTRDRvOFZOQWxtUlQ2cUtLbVphbVJWNjBK?=
 =?utf-8?B?RmIzdmR6R0N2Ly9mYzhvNVVtd1IzV0FLQzhtOFJvRGVjOGVmNnd1RzZBOFB5?=
 =?utf-8?B?RWdBbW53YWUvbzZBNnBxaFNCSzUzam4wdmh3R29iUGQ2ZGVyVFZSY1NUamNy?=
 =?utf-8?B?b1JzUWtaZlE0eDNiTHNtZmpEcU5BTDRmV2pnb0Vtdk5JNUJLSnhkeGIzdFpu?=
 =?utf-8?B?b0tsYkhKOWhoaGdXakY5OTRSUk5qQ2RGTlJIYzdzTVlpci9hR1JzZm9WOU5t?=
 =?utf-8?B?ZDJZUWlxK3daQUNKQ3hBcDhJOW9sWTRiRi9OREVRYXUyazljSUFsOEgxVjEr?=
 =?utf-8?B?WTJzTk9UNUV6aXlTUHF6U1F1NkJMdXRLWThjOGVxVFN0T1g0K3RKckIrTThY?=
 =?utf-8?B?d3MzdDZiZ2krQVpkZ3VMQWQwL29FNDUrM1pPakQwM2RaRXNWYTBHTVJJK0VN?=
 =?utf-8?B?YTNDUndtVXQyUWVwTm9BQjk4UiszYVhiUmpQbWFsVjNkdVM3ZDNqUmV2c0Vz?=
 =?utf-8?B?UThjejBFWE55dVM2RWVhSjdlTWEzUkRzNjlST0R1Q3BkMFpVMWJaRW5NRWVD?=
 =?utf-8?B?NEN5QVF4Z3FiNWZJRnJ1bFpjQkxqd2MvVXRyM2U3ZVRlK0Z3cW9Ld09wQXJj?=
 =?utf-8?B?bzlaK0E4dzlwb1diUXZncWF1WXJTdzFwZi9JWGsweHM5eWhZNENvSk9pTjNE?=
 =?utf-8?B?NDI5ZVhFK2NSdjVKeFZoR3FtYnI2ZUtDSUxGVlczcFRYWWRIdHV2SURTUkUv?=
 =?utf-8?B?dGU0dDlFRDNNYkd2cy9UaGszU005TnFJTW5FMEhhVktTZzFYeXovNC96Y1dR?=
 =?utf-8?B?UnlUWnRRQWxya3BZNEQxTXkzRWkwcXFvaDBnZlkrQThsR1lyYmQzTFFwQWdp?=
 =?utf-8?B?VEhrMVFma084b1JaYlJ0NlZvUU1iclNzczhMaHdSM3JxaHFqUnJ6b0I4VnVw?=
 =?utf-8?B?NEMrMzc1NEV4TWZwUkRVeHd6U2hhVmI0eU1lZkg4ZUtyVGJ5QlFobndBak5V?=
 =?utf-8?B?enhZRG5EWTBnUlBlQmUvejJxUVc5YWpTQVl6R3V3TDlVYTlsQWE0c2tGQVY1?=
 =?utf-8?B?T0NuelJoTGVURGw1UTFIVGxXRElNT0ZiVGVram0wRElkd0xzODQzV25TRXdn?=
 =?utf-8?B?UUhhT24rdWFsaFNjS016R3k1bzZoOUQydTdYbXN2bm0yQUZFbHhHaGM3anc0?=
 =?utf-8?B?endRZFR3N2g2WTg2RzR5bWtjVEtabThCV3ZQQnUwUk1xaWpGVlVNSVNKeHhy?=
 =?utf-8?B?QTUwaGZFM05wakRnL0szOC9vd1V0WmJtNEVtZWJxbStVN21CMlJtSlQ1N3Zj?=
 =?utf-8?B?a0xhbTB2ZFZDbjRPc3lQRHNNNWNMS0o2dE1paU84V1EwaURwNHFjTmQ5NkM4?=
 =?utf-8?B?b0FRbmVDdjUreGZ3V2IyQXh5MzNqUnJRVGNvL2cxRWQzSDliVFNaN3hDUVYr?=
 =?utf-8?B?dUgyZk5JTFJpb2ZiTlpBeVA0QTJjM3pac2k2b1NsNFJoWSt0QVF1SlhTNzk3?=
 =?utf-8?B?MGxOdlRnOG56YjNqV1VYZEVwL3ZFUkVaV1RqdWN2bGViVXBZbzJEOU51UGZR?=
 =?utf-8?B?ZHNSdjNzOUNXYnhFTFBWRjdRT0lLc0RpWDlPeWZxdzhibHFQYnQvWUgzZW1t?=
 =?utf-8?B?UUkwMnJ6RGpJb3NIR1g5QVkrVU5pQnp5ODlaYms1MWlIT25DemxNbG44ajBz?=
 =?utf-8?B?MmFaYm1pb05NN1ZXRVpDc2ZTZjVlaTdVTG1xaHYraXdweHpjYlFUWGxvckRj?=
 =?utf-8?B?TlRpZjlPSGp3R05UR3phTUQzOGloTDRuY3R5SEwwM0ZTNlcvOWllaVFJQmRv?=
 =?utf-8?Q?j9f+BULP+diBy+eooXz5KyB0l?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3060d5-b911-42e8-28b0-08dd5b067767
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:22:29.1061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQjY3IlocTu+sRJr9KMvuufFr7OcDiM7a3sPJ/3lAdV6HApEDD/fLrq6A2koJ87e3icYuYg5QRPxbj1Jm2AJtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6034
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

Hi Soham

On 2/28/2025 7:48 PM, Soham Purkait wrote:
> v2 : fix for refactoring GPUTOP into a
>       vendor-agnostic tool (Lucas)
> 
> v3 : Separate commit (Kamil)
> 
Add missing Signed-off and description
> ---
>   tools/gputop/xe_gputop.c | 404 +++++++++++++++++++++++++++++++++++++++
>   tools/gputop/xe_gputop.h |  74 +++++++
>   2 files changed, 478 insertions(+)
>   create mode 100644 tools/gputop/xe_gputop.c
>   create mode 100644 tools/gputop/xe_gputop.h
> 
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> new file mode 100644
> index 000000000..21717c49a
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.c
> @@ -0,0 +1,404 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_gputop.h"
> +#include "common_gputop.h"
alphabetical
> +
> +#define engine_ptr(engines, n) (&(engines)->engine + (n))
> +
> +static void __update_sample(struct xe_pmu_counter *counter, uint64_t val)
> +{
> +	counter->val.prev = counter->val.cur;
> +	counter->val.cur = val;
> +}
> +
> +static void update_sample(struct xe_pmu_counter *counter, uint64_t *val)
> +{
> +	if (counter->present)
> +		__update_sample(counter, val[counter->idx]);
> +}
> +
> +static const char *class_display_name(unsigned int class)
> +{
> +	switch (class) {
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return "Render/3D";
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +		return "Blitter";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return "Video";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "VideoEnhance";
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return "Compute";
> +	default:
> +		return "[unknown]";
> +	}
> +}
> +
> +static inline void *clean_up(void *engines)
> +{
> +	if (engines)
> +		free(engines);
> +
> +	return NULL;
> +}
> +
> +static int _open_pmu(uint64_t type, unsigned int *cnt, struct xe_pmu_counter *pmu, int *fd)
> +{
> +	int fd__ = igt_perf_open_group(type, pmu->config, *fd);
> +
> +	if (fd__ >= 0) {
> +		if (*fd == -1)
> +			*fd = fd__;
> +		pmu->present = true;
> +		pmu->idx = (*cnt)++;
> +	}
> +
> +	return fd__;
> +}
> +
> +void xe_gputop_init(struct xe_gputop *obj,
> +		    struct igt_device_card *card)
> +{
> +	obj->pmu_device = tr_pmu_name(card);
> +	obj->card = card;
> +}
> +
> +static int pmu_format_shift(int xe, const char *name)
> +{
> +	uint32_t start;
> +	int format;
> +	char device[80];
> +
> +	format = perf_event_format(xe_perf_device(xe, device, sizeof(device)),
> +				   name, &start);
> +	if (format)
> +		return 0;
> +
> +	return start;
> +}
> +
> +static int engine_cmp(const void *__a, const void *__b)
> +{
> +	const struct xe_engine *a = (struct xe_engine *)__a;
> +	const struct xe_engine *b = (struct xe_engine *)__b;
> +
> +	if (a->drm_xe_engine.engine_class != b->drm_xe_engine.engine_class)
> +		return a->drm_xe_engine.engine_class - b->drm_xe_engine.engine_class;
> +	else
> +		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
> +}
> +
> +void xe_populate_device_instances(struct gputop_device *dv)
> +{
> +	struct igt_device_card *card_int = NULL, *card_dis = NULL, *cards_combi = NULL;
> +	int count_int = 0, count_dis = 0;
> +
> +	count_int = igt_device_find_all_xe_integrated_card(&card_int);
> +	count_dis = igt_device_find_all_xe_discrete_card(&card_dis);
> +
> +	if (count_int > 0 || count_dis > 0) {
> +		// Allocate memory for the combined array
> +		cards_combi = (struct igt_device_card *)calloc((count_int + count_dis),
> +							       sizeof(struct igt_device_card));
> +		if (!cards_combi) {
> +			fprintf(stderr, "Memory allocation failed for igt_device_card\n");
> +			if (card_int)
> +				free(card_int);
> +			if (card_dis)
> +				free(card_dis);
> +			exit(EXIT_FAILURE);
> +		}
> +
> +		if (card_int) {
> +			memcpy(cards_combi, card_int,
> +			       count_int * sizeof(struct igt_device_card));
> +			free(card_int);
> +		}
> +
> +		if (card_dis) {
> +			memcpy(cards_combi + count_int,
> +			       card_dis, count_dis * sizeof(struct igt_device_card));
> +			free(card_dis);
> +		}
> +
> +		dv->driver_present = true;
> +		dv->len = count_int + count_dis;
> +		dv->instances = calloc(dv->len, sizeof(struct xe_gputop));
> +		for (int i = 0; i < count_int; i++) {
> +			xe_gputop_init((struct xe_gputop *)dv->instances + i,
> +				       cards_combi + i
> +			       );
> +		}
> +
> +		for (int i = 0; i < count_dis; i++) {
> +			xe_gputop_init((struct xe_gputop *)dv->instances + count_int + i,
> +				       cards_combi + count_int + i
> +			       );
> +		}
> +	}
> +}
> +
> +void *xe_discover_engines(const void *obj)
> +{
> +	struct igt_device_card *card = ((struct xe_gputop *)obj)->card;
> +	struct xe_engines *engines;
> +	int ret = 0;
> +	char device[30];
> +	struct drm_xe_engine_class_instance *hwe;
> +	int card_fd;
> +
> +	if (!card || !strlen(card->card) || !strlen(card->render))
> +		return NULL;
> +
> +	if (strlen(card->card)) {
> +		card_fd = igt_open_card(card);
> +	} else if (strlen(card->render)) {
> +		card_fd = igt_open_render(card);
> +	} else {
> +		fprintf(stderr, "Failed to detect device!\n");
> +		return clean_up(engines);
> +	}
> +	xe_device_get(card_fd);
> +	engines = malloc(sizeof(struct xe_engines));
> +	if (!engines)
> +		return NULL;
> +
> +	memset(engines, 0, sizeof(*xe_engines));
Why not allocate at once?

xe_number_engines should give you the number of engines
> +
> +	engines->num_engines = 0;
> +	engines->device = ((struct xe_gputop *)obj)->pmu_device;
> +	xe_for_each_engine(card_fd, hwe) {
> +		uint64_t engine_class, engine_instance, gt_shift, param_config;
> +		struct xe_engine *engine;
> +
> +		engine = engine_ptr(engines, engines->num_engines);
> +		gt_shift = pmu_format_shift(card_fd, "gt");
> +		engine_class = pmu_format_shift(card_fd, "engine_class");
> +		engine_instance = pmu_format_shift(card_fd, "engine_instance");
> +		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
> +			| hwe->engine_instance << engine_instance;
> +
> +		engine->drm_xe_engine = *hwe;
> +
> +		ret = perf_event_config(xe_perf_device(card_fd, device, sizeof(device)),
> +					"engine-active-ticks", &engine->busy.config);
> +		if (ret < 0)
> +			break;
> +
> +		engine->busy.config |= param_config;
> +
> +		ret = perf_event_config(xe_perf_device(card_fd, device, sizeof(device)),
> +					"engine-total-ticks", &engine->total.config);
> +		if (ret < 0)
> +			break;
> +
> +		engine->total.config |= param_config;
> +
> +		if (engine->busy.config == -1 || engine->total.config == -1) {
> +			ret = ENOENT;
> +			break;
> +		}
> +
> +		ret = asprintf(&engine->display_name, "%s/%u",
> +			       class_display_name(engine->drm_xe_engine.engine_class),
> +			       engine->drm_xe_engine.engine_instance);
> +
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +		ret = asprintf(&engine->short_name, "%s/%u",
> +			       xe_engine_class_short_string(engine->drm_xe_engine.engine_class),
> +			       engine->drm_xe_engine.engine_instance);
> +
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +
> +		engines->num_engines++;
> +		engines = realloc(engines, sizeof(struct xe_engines) +
> +				  engines->num_engines * sizeof(struct xe_engine));
> +		if (!engines) {
> +			ret = errno;
> +			break;
> +		}
> +	}
> +
> +	if (!ret) {
> +		errno = ret;
> +		return clean_up(engines);
> +	}
> +
> +	qsort(engine_ptr(engines, 0), engines->num_engines,
> +	      sizeof(struct xe_engine), engine_cmp);
why?
> +
> +	//engines->root = d;
don't use  //
> +	((struct xe_gputop *)obj)->eng_obj = engines;
> +
> +	return engines;
> +}
> +
> +static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> +{
> +	uint64_t buf[2 + num];
> +	unsigned int i;
> +	ssize_t len;
> +
> +	memset(buf, 0, sizeof(buf));
> +
> +	len = read(fd, buf, sizeof(buf));
> +	assert(len == sizeof(buf));
> +
> +	for (i = 0; i < num; i++)
> +		val[i] = buf[2 + i];
> +
> +	return buf[1];
> +}
> +
> +void xe_pmu_sample(const void *obj)
> +{
> +	struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	const int num_val = engines->num_counters;
> +	uint64_t val[2 + num_val];
> +	unsigned int i;
> +
> +	engines->ts.prev = engines->ts.cur;
> +	engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		update_sample(&engine->busy, val);
> +		update_sample(&engine->total, val);
> +	}
> +}
> +
> +int xe_pmu_init(const void *obj)
> +{
> +	struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	unsigned int i;
> +	int fd;
> +	struct xe_engine *engine;
> +	uint64_t type = igt_perf_type_id(engines->device);
> +
> +	engines->fd = -1;
> +	engines->num_counters = 0;
> +
> +	engine = engine_ptr(engines, 0);
> +	fd = _open_pmu(type, &engines->num_counters, &engine->busy, &engines->fd);
> +	if (fd < 0)
> +		return -1;
> +	fd = _open_pmu(type, &engines->num_counters, &engine->total, &engines->fd);
> +	if (fd < 0)
> +		return -1;
> +
> +	for (i = 1; i < engines->num_engines; i++) {
> +		engine = engine_ptr(engines, i);
> +		fd = _open_pmu(type, &engines->num_counters, &engine->busy, &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +		fd = _open_pmu(type, &engines->num_counters, &engine->total, &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +	}
> +	return 0;
> +}
> +
> +static double pmu_calc_total(struct xe_pmu_pair *p)
> +{
> +	double v;
> +
> +	v = (p->cur - p->prev) / 1e9;
> +	return v;
> +}

why 1e9?
> +
> +static double pmu_calc(struct xe_pmu_pair *p, double total_tick)
> +{
> +	double bz = (p->cur - p->prev) / 1e9;
why 1e9?
> +	double total;
> +
> +	total = (bz * 100) / total_tick;
> +	return total;
> +}
> +
> +static int
> +print_device_description(const void *obj, int lines, int w, int h)
> +{
> +	char *desc;
> +	int len;
> +
> +	len = asprintf(&desc, "DRIVER: %s || SLOT: %s",
> +		       ((struct xe_gputop *)obj)->card->driver,
> +		       ((struct xe_gputop *)obj)->card->pci_slot_name);
> +
> +	printf("\033[7m%s%*s\033[0m\n",
> +	       desc,
> +	       (int)(w - len), " ");
> +	lines++;
> +	free(desc);
> +	return lines;
> +}
> +
> +static int
> +print_engines_header(struct xe_engines *engines,
> +		     int lines, int con_w, int con_h)
> +{
> +	const char *a;
> +
> +	for (unsigned int i = 0;
> +	     i < engines->num_engines && lines < con_h;
> +	     i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		if (!engine->num_counters)
> +			continue;
> +
> +		a = "            ENGINES   BUSY  ";
> +
> +		printf("\033[7m%s%*s\033[0m\n",
> +		       a,
> +		       (int)(con_w - strlen(a)), " ");
> +		lines++;
> +
> +		break;
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_engine(struct xe_engines *engines, unsigned int i,
> +	     int lines, int con_w, int con_h)
> +{
> +	struct xe_engine *engine = engine_ptr(engines, i);
> +	double total_tick = pmu_calc_total(&engine->total.val);
> +	double percentage = pmu_calc(&engine->busy.val, total_tick);
> +
> +	printf("%*s", (int)(strlen("            ENGINES")), engine->display_name);
> +	print_percentage_bar(percentage, con_w - strlen("            ENGINES"));
> +	printf("\n");
> +
> +	return ++lines;
> +}
> +
> +int xe_print_engines(const void *obj, int lines, int w, int h)
> +{
> +	struct xe_engines *show = ((struct xe_gputop *)obj)->eng_obj;
> +
> +	lines = print_device_description(obj, lines, w, h);
> +
> +	lines = print_engines_header(show, lines, w,  h);
> +
> +	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
> +		lines = print_engine(show, i, lines, w, h);
> +
> +	lines = print_engines_footer(lines, w, h);
> +
> +	return lines;
> +}
> +
> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
> new file mode 100644
> index 000000000..e02987ddd
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: MIT
> + *
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __XE_GPUTOP_H__
> +#define __XE_GPUTOP_H__
> +
> +#include <dirent.h>
> +
> +#include "igt_device_scan.h"
> +#include "xe/xe_query.h"
> +#include "igt_perf.h"
> +#include "common_gputop.h"
alphabetical
> +
> +struct xe_pmu_pair {
> +	uint64_t cur;
> +	uint64_t prev;
> +};
> +
> +struct xe_pmu_counter {
> +	uint64_t type;
> +	uint64_t config;
> +	unsigned int idx;
> +	struct xe_pmu_pair val;
> +	bool present;
> +};
> +
> +struct xe_engine {
> +	const char *name;
> +	char *display_name;
> +	char *short_name;
> +	struct drm_xe_engine_class_instance drm_xe_engine;
> +	unsigned int num_counters;
> +	struct xe_pmu_counter busy;
%s/busy/active_ticks
> +	struct xe_pmu_counter total;
%s/total/total_ticks
> +};
> +
> +struct xe_engines {
> +	unsigned int num_engines;
> +	unsigned int num_classes;
> +	unsigned int num_counters;
> +	DIR *root;
> +	int fd;
> +	struct xe_pmu_pair ts;
> +	bool discrete;
> +	char *device;
> +	int num_gts;
> +
> +	/* Do not edit below this line.
> +	 * This structure is reallocated every time a new engine is
> +	 * found and size is increased by sizeof (engine).
> +	 */
> +	struct xe_engine engine;
> +
> +};
> +
> +struct xe_gputop {
> +	char *pmu_device;
> +	struct igt_device_card *card;
> +	struct xe_engines *eng_obj;
> +};
> +
> +void xe_gputop_init(struct xe_gputop *obj,
> +		    struct igt_device_card *card);
> +
> +void xe_populate_device_instances(struct gputop_device *dv);
> +void *xe_discover_engines(const void *obj);
> +void xe_pmu_sample(const void *obj);
> +int xe_pmu_init(const void *obj);
> +int xe_print_engines(const void *obj, int lines, int w, int h);
> +
> +#endif // __XE_GPUTOP_H__
do not use //

Thanks
Riana
> +

