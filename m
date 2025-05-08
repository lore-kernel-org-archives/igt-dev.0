Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0F6C3ABC0
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 10:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EB010E3AC;
	Thu,  8 May 2025 10:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CnVMgGRn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499DE10E36B
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 10:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746699628; x=1778235628;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=aBk3aejd9QXFuh4SBXOZwvTMXL4cXCKNB22oWnNcM30=;
 b=CnVMgGRnPkKYzg1q6KYnqbX9S2oMTGEUtq4+copL9GKAvosjJf+EOPQa
 l+Rqp66djfijx1Zr9Kt97xI+6kBVfjHBjL/wzLdXitqj7FLVFnAhSKD2w
 GIZlWPRGHGn8rYA8HcsJNzt820mVcQijVWm/BvJCqIZt6voVQlhGzFZM7
 ImZkDVdkm4/KY5IYWfQcle0riFiEI8hZHal631nVoUxHIEyXykMABVHqX
 OmO7U5U8XPc0jYAv+35wH/L1KYG1e1QFgaYY/W5lPOwaeVlONeseJBnWU
 EiD0PoikGgRuBl6OwbO2mYiFTTL8f1pEcV7HfZWL+idCa+yADQildno5I g==;
X-CSE-ConnectionGUID: uFqzU2CrQYKRvKQICfwqlQ==
X-CSE-MsgGUID: InQ4xvQaTHWTMOBmBNUHEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59870876"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208,217";a="59870876"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 03:20:28 -0700
X-CSE-ConnectionGUID: FyACrVWmTW+Y14i16l47Xg==
X-CSE-MsgGUID: 3qrUqA5XQMewIfPkM2WJ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
 d="scan'208,217";a="136769755"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 03:20:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 03:20:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 03:20:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 03:20:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siVjmJF4ycEXhdHObPUJygcTt2pGv+dgKPug5Znad7SRE7HcDX954iAAb4lnu/GoApknNodoJvO4GS5V8uieNQwMUuLIK6sqUqbqRjnobrp00p4mhUMEdc7N4I1WMHiLBg0apoW9T8/49jgWkxi/76BaZvm68A3nz9SwdXveTXxrHjUHrQnJzkxeUK6h5SIXvzOeSgvqrpw1VVnRQK9hBbtjXFkL6+KXQhzVyAFSTqK9J53F4p5Imlh2LCOD+vfdHbyIryu7o3mi/5YtNx8Mro47hMH/j/QBznKS/hWXYA7PHUhTb5zbt+bjgvvWp4rJDyDity1bjwmoYg3BgHO1hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZrYmb4w/HGMsTcWmn22Potmbdbs9iAN/t1erXzjO98=;
 b=AAIi5oFeQMl8zCXfNoVIUk/ofDmyry6Z81FfMuFXXpamEkZJZ7zaPK8HIqj7F9SvKTgcdGnwRcIZqkSPopKfdDruTFZqpRpoFTWDADK4EyVfKZ9VxrejMNGb8d8+lluOXYwxogZFNZh89gk/QZ9RV1OfwBHMruednReUK/+kjxWiO2oTlhmp9IAW0yDf+IHXy1uJ6ZDBne8TrhH9CsSJ7HwQqWg9dQIGD+tJ4hMcPM6g7zhNmdvdRbMXnhZrUeQ/ZYoxtbfyrLrsxdS4qv/d6Ikwa9yAkJxMAH+tdHh05JHNX16oXm49lGaE97ceRDqCPslXLLcYTE6bMgNvwDuZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10)
 by DS0PR11MB7927.namprd11.prod.outlook.com (2603:10b6:8:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 8 May
 2025 10:20:21 +0000
Received: from DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2]) by DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2%4]) with mapi id 15.20.8699.034; Thu, 8 May 2025
 10:20:21 +0000
Content-Type: multipart/alternative;
 boundary="------------SMnHVdBVk7soC0zxPeOcdQbH"
Message-ID: <e10562f5-6ab2-4a61-89f6-8a20cdd88750@intel.com>
Date: Thu, 8 May 2025 15:50:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/xe_pmu: Adjust assertion to account for potential
 RPe adjustments by GuC
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>,
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>
References: <20250506150617.1961348-1-sk.anirban@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20250506150617.1961348-1-sk.anirban@intel.com>
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To DS0PR11MB7766.namprd11.prod.outlook.com
 (2603:10b6:8:138::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7766:EE_|DS0PR11MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f282d96-e387-4a6a-e000-08dd8e19f02c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVFlTm50QzR1ZnIrdGFvQUp2a3NuM3hNQ3VqUzM5RTdVelVKckhvNWhNWXB3?=
 =?utf-8?B?T0wzdjczU2l5eUNiRmhlVld4aFRmWjVZWmNhMTNybXBJdUpBaHV1M1ZNN0Zl?=
 =?utf-8?B?RWoxSCtqQ2tNQWg1K3M4V3lpTWtZKzI3amZrUFBabWhPRUxWZlRFY2UyV2dN?=
 =?utf-8?B?WFhEc0lSbnlrTjhCbUR1OU9pWU9mbGxWUVd1RVNUdTk5c201VGhULytrNE10?=
 =?utf-8?B?VktNRENQUzVSaGVSVDM4Ukd5eW10L3hBSHJ2L21SZWU4YlNmS2Y1NnlYNHg2?=
 =?utf-8?B?RGUrV0pmand4NUhvNm14Nm8xR3QvNVVoblo0ZitsZEtad0dBR3E3eTVLL25T?=
 =?utf-8?B?UjFRSFY2VWR6Q1pxbU8rNGZNczBvcE41RDdWUkhsQkp3dXUzREJLS3dwZzNx?=
 =?utf-8?B?YnBEUHpqOUNkeVV1clVVbC9GREMxUGJmZk0wV0RVQWFCZkVQN0UyOGsweEVV?=
 =?utf-8?B?NFI4cjRuR2E3cHFuOEtadU91RFA4L05vQlZkRjlFeG1YNVdTTHNUSE05Mm9u?=
 =?utf-8?B?T09uOFlmUmc1Vy82bVpxcTEzejdhN0g3NkdRSXMyZVdaZ2pUVUk2QW12NDFO?=
 =?utf-8?B?N2lNQ2xCWUJETDltL1FnZEhyOFZIdFpaRiswWjYyVWNOaWFTYS94dGg3d09I?=
 =?utf-8?B?MVpaWlR1YkxaTnN2WnM3MEdscjhjTmE3OUJlTmZDN21vK0RQai9FblRtTG9R?=
 =?utf-8?B?RmM3SUFiZDIxRzZRbnJhbWFMcXFTdEpNRUNjWVppeE1sNytkc2lvUSsrSEV3?=
 =?utf-8?B?ajhXMVBKWmZuU0lOQ1R2WkRzWVRYRkNUNlRNVXhsNEx1V0piL3Eva09iNXlk?=
 =?utf-8?B?ekg3U2NsdjNXMUlwUFlzUGtHSVNYYlVpeG9WT2QwM0ZYR0NKdVliUzRDUGpw?=
 =?utf-8?B?TzQ4V3l2MVdHVUExOU1NMWxUZ2VLekdxWkozVDVaY2ZlOW0raHBTVGZINExH?=
 =?utf-8?B?MHh5MlN4S1lPWS9xeFlUaDJGTGtHME84aG1iVUhpTU5ZcVpmNVdCbGxjaGRM?=
 =?utf-8?B?TUlHRmhjcWIxbTFyS25IRDM1cUR1cFZBdG1TWThoQ29JVklwUmpBUUNWbE9n?=
 =?utf-8?B?V28wYkxldXV4SWx6TnZwUmpGZGRSUFNLelNYaitpelNFNDFGam9Hb2VmanNw?=
 =?utf-8?B?c0xwb2RsNm5RVzZtS0tHbVpsUkxYRDR4YU4rTEorOWNkcTFtLzN0U3lCQXp2?=
 =?utf-8?B?N0dhSFFiUHVVcVhuOFZ5V1ByVCtybWdRU3laYzA1MXRBbXdrc3JYV0ovcDNW?=
 =?utf-8?B?Q2dNZW9CbFpoOTJlcTZ5RW9qZmF2aVMwSXN2aG5oNEx1QlpXMk1rR1BVZkc5?=
 =?utf-8?B?cyswNmI4clpuRGpGbmQ4MVFVWXphOVZKT1F1eVVEeUxLeCtjSmpEQSsyQ0NL?=
 =?utf-8?B?Y2Y2VnlieUVMV3FqYXpZcDRqclQya2tuUXVUUXZJTG9obUNic2J4endZT0JH?=
 =?utf-8?B?R3k3bCtUV0lVOUFGRGVDMGtkcFp2U0xyKzhuOU0xYnRhNUZvdnhjNFA5cW84?=
 =?utf-8?B?MktpZUxGdzBHWC9FcjFnc2I5QWwwM2xtcUs0b0p2SEZYNDJyRUU5UHljbFUw?=
 =?utf-8?B?WEpQNFhyWlpGaXRMMGxHWCtMMHh1WkFJUVNpb3A2RGo0emRRQTkrMVlvd0Z3?=
 =?utf-8?B?SGVHRUVPdVU4WVFqaWxCNnJqTzl1Qmh6Q21ZU2poKzlJRUVQbU1ERzY4Z1VK?=
 =?utf-8?B?Zzc1YXZXYWtPRDF1MklXdklva0szUkcvTnNaZ1RmWVJLbG5PUUJkcTlzWVVj?=
 =?utf-8?B?ZnRsSS94ZlRKRjFGc2pVTE5qaC9IdnlielVGRm9kOTBlT1FoaFRjay9FcXNO?=
 =?utf-8?B?WklDT3lJY3dnVVdpbDBnNy82NWdUOHZvNTUxYXVkZkZKQUlCeElJUVJwVnkz?=
 =?utf-8?B?VlBDYmtkRTVhWXVMcDFNK1dFRWd3dnBkbmorQ0cxY3ZicUUrdGVRV2FsbmdT?=
 =?utf-8?Q?gqAdFVRUgiE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTRPNHdOaHpicDlmdldXSDl5Tmg5VmRVSEtxcXFzNUw0MTgwK2FLOFN2TGJJ?=
 =?utf-8?B?MUZNUzAwVXFLQ1Y1MVI5UFY4TDQ2bk91WHF0VEdjTllta1RVZFMwVXNMM1Ey?=
 =?utf-8?B?RmQwWldzS2U4ZG9sZHVBZFpRanFXYXN1UWJyemU1elNpMUI5YjU5Q1dvSms1?=
 =?utf-8?B?ZmhGTGcxVGx6MEgyaHYyNERhSVRDa2ozR2hjVmM0T2JzRTBKSHlaaXBkL2U5?=
 =?utf-8?B?M2svWVd6YVRuaXZaMWhuTzJhNVBBbEdiK1JIczRIM3R6SWJQTjJMYmU5eUYz?=
 =?utf-8?B?czJFaDJ3b1I3OVorM1FMT3l0QzJxcGR4dlg1NFNZYklqTERwQ2Jna0dHTXI0?=
 =?utf-8?B?M0xPK2FKNG9scTMxRHIydVE2d1lTdHhnL3o2NUdzdldpRitvc1JGeTR2Ukt4?=
 =?utf-8?B?ZHpsNVh3aXI5QVljZTBZbmprTU1jbVc4NnJmTFBSNUhTWlFtNEdrRFF2dWsx?=
 =?utf-8?B?cVJybnRYb0FIRXlmN2tTMWcyNVl5UmQ0T2h2U2ViaERDRUhDV3lFVVBaUnhJ?=
 =?utf-8?B?ZE9uWjF1STN1TTJ2dmNBVjhadU5CV3d4OXd4ZlJTNVR2d3NWY2t2ck81SXpF?=
 =?utf-8?B?RkFwZlgvbkpDVXhyRDFjNFRIS29WYmk4ZlFUOXB4L3RyQU1tSXUvbkJWT0tT?=
 =?utf-8?B?WmhaTTZQaWRad0xIb01qMGk2Q002SmVlemttbzIwOXkrUVZ5MGtoS1RiaDlD?=
 =?utf-8?B?SVVyRmV5ODA2aVAzaHN4R2h3dnNDL2NkeE94ekFOaEhXTFhFNGN1T3J0cGRh?=
 =?utf-8?B?NnlOVGtnZlpVdTgzWDgweFhyeWh2eFVOS2FyNmhzMGtqRmZmMmhUWkJ4MFhp?=
 =?utf-8?B?S2RUOFlxbHV2UENGQ0h0N1E5cFJETXhua0ZuVVhJVHU4ZW82ZjgxSEhHdjZx?=
 =?utf-8?B?Q3ZzTVMxQk1jSmVrblFFUjhzMHVFM1g5MUM0dWpmK0gydU9QRk1LaFhGcGpz?=
 =?utf-8?B?MjFGam9IOEY0ZXNONlE3eldPL3FQTGpiaFJvdzVabW4zY1RpZ0VpUnd1RFZV?=
 =?utf-8?B?eVN0UjdPa0JpNjFubWhLQjFhSkRBRmc1S2ZyZTJzK0VQNmNLWW9DM0l4aWNB?=
 =?utf-8?B?ZStOZU5KdlpDNUpwbEM4TDJZMzcyeXVzdUlJTXBVT0dTYSs5NXIrQndjaHBQ?=
 =?utf-8?B?TW1CY1ZMMFVPVkJFeWVNNVBOdkxWdUFVc3g0ZjRFREtRSVhFWW5GVGxsbHh2?=
 =?utf-8?B?dlp4YzJwQi82amNOYzcvS1EreEhlT1RBcGw4TWNVNjZXK1cwOUNiSFF2Tkxh?=
 =?utf-8?B?Zjc0VTY2MURJeHJ0MDRSeXBoNlNoZGpndUV5clZGb0Voc0I5bWlFRllvNG5j?=
 =?utf-8?B?Nm1Nem9lVDMzd2k3Mytnc2thMkNKV1JRclkzZ1lsb0hWRFZMSUt5N3BJQmM3?=
 =?utf-8?B?bnFSZlR4YXgzYk0yeWNGTjI5TU1KOWhrQWNSNjVEVWtkR09XM1FzaEE2Nks4?=
 =?utf-8?B?VExXYzd1M0hIVUthbkVLUjFhMHZnVytiakQzQnFhNmFTMmc0TS9PTyttZXdZ?=
 =?utf-8?B?U0pVN2VCUkp0dmZUd0hXdmN3YjJOc281RER3Mnk3SSs0dW1iMUUvQjZDRE5z?=
 =?utf-8?B?RTd6RVEwS0ZkUDU3QUhrYmZ0eXFKLzJaNFk2WnU2VFBQU0pabDE3elhYTjlH?=
 =?utf-8?B?clBadTRzcHVXYWR5R0tPd1B1TGtRMVRnb0NCaTRDNFgvUzhXSkxhTEczSUJM?=
 =?utf-8?B?VC9SQ0xBNVFjd3BBMHMrWVRhSEdZYUZEUVhmbXBWamwxbnlvR0NxdTRXOFdK?=
 =?utf-8?B?OGRRMHlHc2pDMEJuLzVIR3BIQm9wZG9nQy9IYW9ZOUFybmFNcHhEekUzVmZW?=
 =?utf-8?B?MU9WT0t1VnYyVVlzSkUxbDFycUhMYm4xVUNSMmYxQmFlbFJoTnVEWGxNSmwr?=
 =?utf-8?B?d0c0N2l3NmdIYzBLa3VUQ3BPOWNMZWpCang2R2R6YjhZSzRVYTVubGU4bVJZ?=
 =?utf-8?B?SmRZR3BJRW14dEx0RjczY3ZvRjJaZTdjeUh5OVR5alZVS3Nka0VuQThBZGlT?=
 =?utf-8?B?UEdvSjQ0UFN4RlNSdTdmQWJPU3l6T25tUU1TS1h0bkpQaFlUL1VSVHp6MklT?=
 =?utf-8?B?bGU1SjdNUFpUWGpySURjSHEzbnZVWU5GY0luaE94Q3dONGF0cjhkeFRUUlVM?=
 =?utf-8?B?ekU2d0hzOEY1QUMzK05WNXFPOE5qbkZaT0E4WWJQbFcwZWg1Qk1MbnRISTRY?=
 =?utf-8?Q?A2yoUYByjHG4ZybxzRmviTM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f282d96-e387-4a6a-e000-08dd8e19f02c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 10:20:21.5189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U092tcjfmel5sh9my7YfVsL/k2NCd5l0Kf/wEUejWKm0k0u9gRZD31KwADSeGz8DoAD6vYLq0wnHh22T2NzOgauwVlhI3IvX6MtkCVRGAaPKUajgWhGC1glqCc4OaMj5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7927
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 08 May 2025 10:26:12 +0000
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

--------------SMnHVdBVk7soC0zxPeOcdQbH
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06-05-2025 20:36, sk.anirban@intel.com wrote:
> From: Sk Anirban<sk.anirban@intel.com>
>
> In scenarios where the GuC adjusts the RPe, the minimum frequency may align
> with the adjusted RPe frequency. The assertion has been updated to account
> for this scenario.
>
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   tests/intel/xe_pmu.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 094dc0c6c..2e29a4056 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -390,6 +390,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   	uint32_t gt = eci->gt_id;
>   	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
>   	uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
> +	uint32_t orig_rpe;
>   	uint32_t vm;
>   	int pmu_fd[2];
>   
> @@ -438,7 +439,9 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   	 * Restore min/max.
>   	 */
>   	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_min) > 0);
> -	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min);
> +	orig_rpe = xe_gt_get_freq(fd, gt, "rpe");
> +	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min ||
> +		   xe_gt_get_freq(fd, gt, "min") == orig_rpe);
>   
>   	igt_info("Minimum frequency: requested %.1f, actual %.1f\n",
>   		 min[0], min[1]);

Looks Good to me.

Reviewed-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

--------------SMnHVdBVk7soC0zxPeOcdQbH
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <div class="moz-cite-prefix">On 06-05-2025 20:36,
      <a class="moz-txt-link-abbreviated" href="mailto:sk.anirban@intel.com">sk.anirban@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250506150617.1961348-1-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>

In scenarios where the GuC adjusts the RPe, the minimum frequency may align
with the adjusted RPe frequency. The assertion has been updated to account
for this scenario.

Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 tests/intel/xe_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 094dc0c6c..2e29a4056 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -390,6 +390,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t gt = eci-&gt;gt_id;
 	uint32_t orig_min = xe_gt_get_freq(fd, eci-&gt;gt_id, &quot;min&quot;);
 	uint32_t orig_max = xe_gt_get_freq(fd, eci-&gt;gt_id, &quot;max&quot;);
+	uint32_t orig_rpe;
 	uint32_t vm;
 	int pmu_fd[2];
 
@@ -438,7 +439,9 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	 * Restore min/max.
 	 */
 	igt_assert(xe_gt_set_freq(fd, gt, &quot;min&quot;, orig_min) &gt; 0);
-	igt_assert(xe_gt_get_freq(fd, gt, &quot;min&quot;) == orig_min);
+	orig_rpe = xe_gt_get_freq(fd, gt, &quot;rpe&quot;);
+	igt_assert(xe_gt_get_freq(fd, gt, &quot;min&quot;) == orig_min ||
+		   xe_gt_get_freq(fd, gt, &quot;min&quot;) == orig_rpe);
 
 	igt_info(&quot;Minimum frequency: requested %.1f, actual %.1f\n&quot;,
 		 min[0], min[1]);</pre>
    </blockquote>
    <p>Looks Good to me.</p>
    <p><span style="color: rgb(36, 36, 36); font-family: &quot;Cascadia Mono&quot;, Consolas, ui-monospace, Menlo, Monaco, monospace; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Reviewed-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a></span></p>
  </body>
</html>

--------------SMnHVdBVk7soC0zxPeOcdQbH--
