Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFFACCD1A7
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 15:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8C310E06D;
	Tue, 21 Oct 2025 15:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kx63w5NI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9318010E06D
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Oct 2025 15:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761059880; x=1792595880;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NzG5eVNvZu01jSTF+bMlflVi1s4sXX1wfS155Y2F3G4=;
 b=Kx63w5NI4CyjMBjbvrSuT+Rjx4gaDE3I7naiEUS5LPRLiIyNyxRLgzx7
 fu0CDpK+i0SJaX776zouNUeN338uWW3mhoCqQfv/rzZgM9IEGTZugDV8P
 7YFsoltdRgxJU0K8Yd+RrKM4/kisPqtrnTvchMXF+i+Y98wwrSuu2Xdvx
 fQHQwbt1Fskl2eUdt+k4Ut5ISU8qLHETeC0dTU42d9D5pThKv8fwdLC/t
 KVm1d7b6y+J4unnooDpEA0JrMoBUzanBhChtNJ740ITsIQV9PNisjws5m
 +kJ1PuJt5YgSfI12S0w8OgnrEqkx7veryvDQvcgGmDRD5PrClQq6Poa2i w==;
X-CSE-ConnectionGUID: W4jPRG53Tw2drjf81P536Q==
X-CSE-MsgGUID: qaYjnHYySCW2+oIRfsksnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63228914"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63228914"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 08:18:00 -0700
X-CSE-ConnectionGUID: O0+OEA2OTLycPFF/MIsqXQ==
X-CSE-MsgGUID: iMwkhUFuTyGI3eSnKSCZmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="183646675"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 08:18:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 08:17:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 08:17:59 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 08:17:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIFs2G/k7bEjD5Bi0frsH93p2yg99Megg5JvJK2SJxQJ1RTd/8Bf2BT19QyznXj/9rUyx9O+BN1A5IBM0sZw+O8ZmHUi3C8s5rsL9Qs4FTrTrSlLhq/cluDOizmvcph6NyYKWJL8QmS84/+/esHzDApwyLVMPzypJpL2T2ZgYOP13AxobNr+jy3fOHcq/V1cylr+BtvZEwsQ2QR9BJyi2oEhJitAgHH0R5ZymT/piqm2r93aZfnuTPE5uIKqo9OQJqJwZaExBvyu91cE1Pf1m3xHbdbffM5sW1ijgXSRijutBglNsLzVQv6WpaLfyOR+YOUQcvj2Yg2WAdQ+dmodiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKoQkW4yll4VLtyvq2iNWlDHT+FMCFDg1GQikTuJ8gU=;
 b=lv1hVJmG3ygEsiCZvME+Ek8POVidCQpRLsKERgd8TMMz17KQZI7L4gNsW/ktZ+sDg/Wp/Ps8e2cloopj/AksiBjgmUcPcqJN6k7O8t/zGx1Ri2ztG6PdzQeTfEnXzVSQwM1RF9XJWaZhQe2usFHozMBu767aFI9kiDEG4AKpsnL3tUcP1X3nHO4PxXp9fJATsjpePYFspvLbICYzf2dqqF7xg41LENE72nPM2LasP6RKxcQooeMKfKrl48s1hHhlDlDQ2g/Oh4wdp2D30jN+kyk9Wkpyypsn/xKoudEcvWoiv9lveF5o4BCuUYBfk7ZWpWV4Ib2W1IvMxm0yFbzzpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 15:17:56 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%3]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 15:17:56 +0000
Message-ID: <d193df9f-f5c0-43e0-bea1-cb63dea95583@intel.com>
Date: Tue, 21 Oct 2025 18:17:34 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] lib/gpgpu_shader: add function for computing max
 number of threads per tg
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <zbigniew.kempczynski@intel.com>
References: <20251014114336.1712360-1-jan.maslak@intel.com>
 <20251014114336.1712360-3-jan.maslak@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20251014114336.1712360-3-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0033.eurprd09.prod.outlook.com
 (2603:10a6:802:1::22) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|PH0PR11MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c36326a-2058-4605-cfe3-08de10b502ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ay9sNGhzQ2hQUjBQMlVTdTJrcGVtQ2g0UWVmc1ptSmVneFRzNEh4QzNVSkZm?=
 =?utf-8?B?STJUb3loeDhqNWU0b205anVOUkJCaS92TUhtQmxKL2EzNWpiZENYNnZtc3Ji?=
 =?utf-8?B?eTUrSUZkNW42TFh3K2FGcmdNajBOU3hjSDAyNTJHaEd4UGxqV2RDUXF3U1Zi?=
 =?utf-8?B?cWV1TVh4UXpPTkZiSFNrYVdBWUNsYlFxc3RPUG1OdlJFTStGVlN6bC9jcWhB?=
 =?utf-8?B?U2V6MGFuYkY1TldiV3NrUEY5MXV3WkJyUHMrcFhKVWtNdDhQdDVrLzJFWFAy?=
 =?utf-8?B?cnRoUFk5M1Vkcit3VktJZ0hIcHd2R2dWZjZicWExbUVNUzIzNzN2Ym5Daldt?=
 =?utf-8?B?WVVjMWVVTzc3dHVjVlJuQ3BXN1NucjZwQ1FseEp5N3BlcnVzNXZRaTdTUTVj?=
 =?utf-8?B?M0Z2Nk9LWStvN01yUDVBNTBGRktnQzB2NFM3RHpXa1ZRZ0Y0UE96eGhlVnZJ?=
 =?utf-8?B?SE41dk90K1J6UHhKNHM0VGdjdWlNeFhzVlE0cVNiNTI5SVNsS2U1eVk1VHVH?=
 =?utf-8?B?TDJHT2VRV0JZM0YyaWUwelRrRVFWMHZvd3hVbmU5R3JBRVB6SDRBSUlzTFJ4?=
 =?utf-8?B?eWhuMk0rTXhRSDhuYVVEL0tCWGZKRTF6YmZta1cvUGtvRnFYRUlIZHJ0cCtD?=
 =?utf-8?B?UEZQUC9KNlgxQVJROGJYRnpPY0ZDOEtVK0dRcGlQUmt2OU5QSlBGaXVvbzhr?=
 =?utf-8?B?Y0dpQWdSdjFTUHV5UlNZRGVqa0RHWkJvdUo5NDBvRmJhQkVRNUFlUnZ2a2lh?=
 =?utf-8?B?ZUxwb0IvZWE0NklOcFRyemZCU21sSWplV0d3S2Q0YndKU2xTRzk1dGhPeUFy?=
 =?utf-8?B?WWs5WXhXS2grRFhuZkFiN3lldG14ME52OHRtRll4aU5Sc2xnRHVQcCtxOVUy?=
 =?utf-8?B?bEhlQlZiZVlBY3pMZmhKVllodmhDNEVsWEtmSGl5SUNCcHhsNnY4ZU9qNFFP?=
 =?utf-8?B?b2E1Y2FoYzJNc3JaQVNqSmVobEFrdERuTkNkSUZKRENxY3hBbDYybUVPeE9J?=
 =?utf-8?B?bG84WHhaVkhBak5SSUpkUkJTM05OTXVjdlpOQ29OVTBRWTFVQ1MrSXE5RnIw?=
 =?utf-8?B?eTZtR1VWaG9EbG5ES1QrWVcwd2tSQVJhWGw1Si9UUkZsZ0h6a05MQkFaVFBX?=
 =?utf-8?B?a1owZjVQL2VYRVdUL1FYdTAzRGF5bFp2djhaOWVFVU5MV2lmOS9Ha1pUTUxD?=
 =?utf-8?B?c2c1eWhTNWlpSGZGckxIdkRqR0tuVUJBOFFTSThuT1JjWlNGRTJneFM0Q3RJ?=
 =?utf-8?B?YkIrbW11TUtielNSb0ljREhoNFJ0SG9jVVpTa2FEa2x3c3RlRHcrbzZBTnIr?=
 =?utf-8?B?REdSMzRkN2prUkU5T3pXK1JuaERwaEZybGlTSWhpOWxFU1pRdnMwbDVyK0o5?=
 =?utf-8?B?QmsyS0N5ZzdUNFRLM290Vm84Zm8yOHhpUDJpaUhFOGhlbFhuNDFQVThJSmpR?=
 =?utf-8?B?OXZVZXVXUTVDVVJZYzVwb2RMQlJGQjB5bzVCQ2hjUnhGODdwaEtLdkxSR0dw?=
 =?utf-8?B?RnhaMFZVcCt2V0pCeWhhTUw0YWFSc1RPTHJtc0c5OXc1bDZ3alNVMi9Gdkc0?=
 =?utf-8?B?ZW1STnVadFRmT205M3REQkpoYzBHdnNEYWJkeThGbjViSjNQUDdUVUhjUnhs?=
 =?utf-8?B?VTVJd3NwTDlGSWYyS1Q1eDdVWGFFQ0lpbE9xR2pPK1U4VkNKV2RNNzNtRU5J?=
 =?utf-8?B?dnpGNEhZcDFZb1JMRWFrWXhxRGYwUHdHWDBEaFNSREZsVjFoSTl3T3BESDNO?=
 =?utf-8?B?TUZOanczTDBYdXlsOWVOdUk4eEVxY0NMeFZIVzRkTnZMS3dFaWRzWkphdXhy?=
 =?utf-8?B?Rit3YkpUSDl1SnVON3NoOGJCNHVra0hMclhaSG1DUVU2UmZMZlV5TkkwY1ds?=
 =?utf-8?B?QTdCR1NVL3RueVlhTlNDL29ZMlVmK3J5T1lCemg3TE1YellXWTdTeTc2cTFq?=
 =?utf-8?Q?Odb+M/2WDME57pt9dlVTNmN+6x3lLB95?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3hsU2t5NmpKMk1WN29sdGFGOGhlZmdndnhLNHFxOGJFYmxTOGRvQ0xaNFl5?=
 =?utf-8?B?NEZMRkVqU0VnNStJbi9hMEVLUGNxSUg3OGZwMVc3T0JKWFd6S1hjRjhTM2hD?=
 =?utf-8?B?YXZMMzR6elNCT09HRjZJd09qSkFuQ2JjZFRxbWNpVHJvTm9xeGNpanBHS09G?=
 =?utf-8?B?RFlvNlJZaWpwZFljeVVaYlpIbzh5N1ZmYzJoelFvRVpXcXBGcjZxYTRoZ21a?=
 =?utf-8?B?cHlIcmN6Z3ZKYjRnNDRmdGg0akgyL2JEWmFlQXNVaXVVRU8xNGMvc1p3M1VS?=
 =?utf-8?B?UjhROVl1OVYzdDMvbXJLS2dMdmNkM3A1b0hKdFRQWmFCWXY0U09DRVQwdUZB?=
 =?utf-8?B?QmpRZEJqY0pQSTFzR011ZVUwb0xXZE1XOStlSVhPbGllejVQL1JyZUZ0bjRR?=
 =?utf-8?B?UnZ5RlpRUHpTbHhxWi9hY2Y3NlhGRmVRYnhhS3ZyOXNjQ3RlcTI3ZHplNzMv?=
 =?utf-8?B?cUNrKytpTmZ2NkhBSjJiVk1Vd016QzdaYnVaU1hEcWgrcEZhemYzS1YxM3BN?=
 =?utf-8?B?bDhGRk5nWUplcEV6RzN2VHFzUXFoL0RyZzJEQmt4eHh4QVNCaURKUjVrKzNn?=
 =?utf-8?B?dU9vMGozS1JyUTA5NjdnODF4Y1NUSys3TksyRXpRb05OTWtqSjRHNkdscU1N?=
 =?utf-8?B?UGxjQU8vcStVMTk5bVh0NzByVm4yTHZibFg5bVNlRHdEekc2MzVtSnRHUmtw?=
 =?utf-8?B?SW1HRWNjMmZMQU1jV1NhWENtRXRhRVM5VW9xRTJWVTkvZTZYSElnbDVKZTE3?=
 =?utf-8?B?cXEwOGx5T0lFSGtxT1RRUm52dnFmc3JxUlJxbHhIRFFFK0lPNlRDbk8rLytB?=
 =?utf-8?B?MTh3Q1czTHdKTDRJY1BWWVlSdHNmY3ZuTThVaStSdFpsdGtXdlRKeGlXRkZ1?=
 =?utf-8?B?cms0eVcwbFZvL3FMMi9wQ3Vrdis3bFdiRUU4NFhXZ1ltK2lDV0NKbHJpaDVa?=
 =?utf-8?B?c1ovWlR5TlYyVHRORHB3cnRvUjZ2U0RGbWd0Vlk3OXQva1RrdHhXWDB1VC9n?=
 =?utf-8?B?RkZnNkN1NlMwVVBxQUVBeFVkRmJMZDVxc2RCWkFkdUI0N1ZCWUg2dHloeUVN?=
 =?utf-8?B?K1I0aW5UKzNHV1hieWd6aUxIT1FWUDBPV3pscUZFOC9YTG1hRXo5ZWxGY1Fz?=
 =?utf-8?B?TlNzZmxnRXd1S2s1SFlFRTFaTTJNUWlzOFUwNzRzTlJOWFdEc2JrM09JOHNp?=
 =?utf-8?B?b3N5Vmt4YnZZUlZtUkc2SFlBekVrZk44R1lNdzVRMjJYaVBMall2K1o2R1Fy?=
 =?utf-8?B?RDdERFhYQTZxem53NGV5MDhNK1FoQUlRNk51NER5WkFWQWNncVo2a3QwUlZk?=
 =?utf-8?B?ZjY5SU9qenhnTlozcUEwdnM1ajc3Mi9NM3MyMGZEVnJNOC9TQmp2M3ZINGFp?=
 =?utf-8?B?blNHclNuTjhWWHRJOXNwZHBNc1RvYUd1V0lnc25USUpzVzU5SVlIWUJKUi9Y?=
 =?utf-8?B?TElRYXd6RVBkQ2o0dnVQa0x1RDFwaTB3VFlXVjRRZnJWVGFic1NUQWs3VmMy?=
 =?utf-8?B?S254VWwvSEZ5dE8rcmEyS1VUbjBzWXYybVdtQk9ZMW5PYnFrb1pqdDFVbGVj?=
 =?utf-8?B?UnRBRUdTa29SQ281LzVMQ0xPQU1oc0p1RVk0NGxVT1FCRk1tTjg1SFQrQXli?=
 =?utf-8?B?SjVWM0Z0Sm1DQzhJaHdoMUs5QUhMeEtDU3pPeTMxZDBhaTFvYWEwdEN2OFIx?=
 =?utf-8?B?RUh1ZTc1YWdwOG83YXJTL3JtaUszaStQS2JickRmYzdzM1RJaWdib1FQbGJV?=
 =?utf-8?B?N1BXZS92YnVPZWVRa1UyRlNBTXNZSGJZeXFVYjhEK212RDBiMWtEbXY1cjhB?=
 =?utf-8?B?SHNyRlVvMHU1eVhqa3htak1GZ293T2pSbmlVV2toTmE5SlZiNStqU0o3NFda?=
 =?utf-8?B?ZVZISm40eTREaVdhMXljZi9MU3ZCRDRUZXdIcDdnZ0tpTlJTYXVOQ2RkNkhU?=
 =?utf-8?B?cTlNYlNsRXpjcUI2bXpnd09NRjVJODNOQm9iMFdaVFlsRDJINWt4dHdjeGhR?=
 =?utf-8?B?c0lsWmNhTGdDcWowN1c2N1J3S3Y0VkJyZE9meFVBa3hMSWF3aUt6RDVFTE5n?=
 =?utf-8?B?TGZVdDBvSy9QREJ5UDluMmMwbjBKdVozR2wvOTZrQkJlUGpYeXRnZ05hS05P?=
 =?utf-8?B?TUZuRG81bHFkUW9JcW85UUdsdjNMR1lnVk42Q0ptY0psVTZkS0dyd29iTXhC?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c36326a-2058-4605-cfe3-08de10b502ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 15:17:56.1689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsMAK1phF3Mk64UMCjQsm/I6l1/DFQ9hfeveeN7Oy3I9NrhE/D22RDOzc04o1n/wDrDoTbRkWGpMGEj+MR5xWCRIGEKP70GLNvdGwSogjT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5880
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

Looks good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 10/14/25 2:43 PM, Jan Maslak wrote:
> Adds function gpgpu_shader__get_max_threads_in_tg() that computes the
> maximum allowed amount of threads in a thread group based on the provided
> shader and Xe version.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   lib/gpgpu_shader.c | 133 +++++++++++++++++++++++++++++++++++++++++++++
>   lib/gpgpu_shader.h |  11 ++++
>   2 files changed, 144 insertions(+)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index e8600de23..0c777d12d 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -282,6 +282,9 @@ struct gpgpu_shader *gpgpu_shader_create(int fd)
>   	shdr->code = malloc(4 * shdr->max_size);
>   	shdr->labels = igt_map_create(igt_map_hash_32, igt_map_equal_32);
>   	shdr->num_threads_in_tg = 1;
> +	shdr->large_grf_mode = false;
> +	shdr->simd_size = 16;  /* Default SIMD size */
> +	shdr->hw_local_id_generation = false;
>   	shdr->vrt = VRT_DISABLED;
>   	igt_assert(shdr->code);
>   
> @@ -333,6 +336,136 @@ void gpgpu_shader_set_vrt(struct gpgpu_shader *shdr, enum gpgpu_shader_vrt_modes
>   	shdr->vrt = vrt;
>   }
>   
> +struct max_threads_config {
> +	bool large_grf_mode;
> +	uint32_t simd_size;
> +	bool hw_local_id_generation;
> +	uint32_t max_threads;
> +};
> +
> +static uint32_t compute_max_threads_in_tg_xe2(bool large_grf_mode,
> +					      uint32_t simd_size,
> +					      bool hw_local_id_generation)
> +{
> +	/* BSpec: 56590 */
> +	static const struct max_threads_config configs[] = {
> +		/* large_grf_mode, simd_size, hw_local_id_gen, max_threads */
> +		{ true,  16, false, 32 },
> +		{ true,  16, true,  32 },
> +		{ true,  32, false, 32 },
> +		{ true,  32, true,  32 },
> +		{ false, 16, false, 64 },
> +		{ false, 16, true,  64 },
> +		{ false, 32, false, 64 },
> +		{ false, 32, true,  32 },
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(configs); i++) {
> +		if (configs[i].large_grf_mode == large_grf_mode &&
> +		    configs[i].simd_size == simd_size &&
> +		    configs[i].hw_local_id_generation == hw_local_id_generation)
> +			return configs[i].max_threads;
> +	}
> +
> +	igt_warn("Unsupported configuration: large_grf=%d, simd=%d, hw_local_id=%d\n",
> +		 large_grf_mode, simd_size, hw_local_id_generation);
> +	return 1;
> +}
> +
> +struct vrt_max_threads_config {
> +	enum gpgpu_shader_vrt_modes register_size;
> +	uint32_t simd_size;
> +	bool hw_local_id_generation;
> +	uint32_t max_threads;
> +};
> +
> +static uint32_t compute_max_threads_in_tg_xe3(enum gpgpu_shader_vrt_modes register_size,
> +					      uint32_t simd_size,
> +					      bool hw_local_id_generation)
> +{
> +	/* BSpec: 56590 */
> +	static const struct vrt_max_threads_config configs[] = {
> +		/* register_size, simd_size, hw_local_id_gen, max_threads */
> +		/* Reg-size <= 128: SIMD16 always allows 64 threads */
> +		{ VRT_32,  16, false, 64 },
> +		{ VRT_32,  16, true,  64 },
> +		{ VRT_64,  16, false, 64 },
> +		{ VRT_64,  16, true,  64 },
> +		{ VRT_96,  16, false, 64 },
> +		{ VRT_96,  16, true,  64 },
> +		{ VRT_128, 16, false, 64 },
> +		{ VRT_128, 16, true,  64 },
> +		/* Reg-size <= 128: */
> +		{ VRT_32,  32, false, 64 },
> +		{ VRT_32,  32, true,  32 },
> +		{ VRT_64,  32, false, 64 },
> +		{ VRT_64,  32, true,  32 },
> +		{ VRT_96,  32, false, 64 },
> +		{ VRT_96,  32, true,  32 },
> +		{ VRT_128, 32, false, 64 },
> +		{ VRT_128, 32, true,  32 },
> +		/* Reg-size 160 */
> +		{ VRT_160, 16, false, 48 },
> +		{ VRT_160, 16, true,  48 },
> +		{ VRT_160, 32, false, 48 },
> +		{ VRT_160, 32, true,  32 },
> +		/* Reg-size 192 */
> +		{ VRT_192, 16, false, 40 },
> +		{ VRT_192, 16, true,  40 },
> +		{ VRT_192, 32, false, 40 },
> +		{ VRT_192, 32, true,  32 },
> +		/* Reg-size 256 */
> +		{ VRT_256, 16, false, 32 },
> +		{ VRT_256, 16, true,  32 },
> +		{ VRT_256, 32, false, 32 },
> +		{ VRT_256, 32, true,  32 },
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(configs); i++) {
> +		if (configs[i].register_size == register_size &&
> +		    configs[i].simd_size == simd_size &&
> +		    configs[i].hw_local_id_generation == hw_local_id_generation)
> +			return configs[i].max_threads;
> +	}
> +
> +	igt_warn("Unsupported configuration: register_size=%d, simd=%d, hw_local_id=%d\n",
> +		 register_size, simd_size, hw_local_id_generation);
> +	return 1;
> +}
> +
> +/**
> + * gpgpu__shader_get_max_threads_in_tg:
> + * @shdr: shader to query
> + *
> + * Returns the maximum number of threads in thread group for the given shader
> + * based on its current configuration (VRT mode, SIMD size, etc.) and Xe version.
> + *
> + * Returns: maximum number of threads in thread group
> + */
> +uint32_t gpgpu_shader__get_max_threads_in_tg(struct gpgpu_shader *shdr)
> +{
> +	enum gpgpu_shader_vrt_modes register_size = shdr->vrt;
> +
> +	/* Not implemented for Xe platforms  */
> +	if (shdr->gen_ver < 2000)
> +		return 1;
> +
> +	/* Xe2 platforms */
> +	if (shdr->gen_ver < 3000) {
> +		return compute_max_threads_in_tg_xe2(shdr->large_grf_mode,
> +						     shdr->simd_size,
> +						     shdr->hw_local_id_generation);
> +	}
> +
> +	/* Xe3 platforms */
> +	if (shdr->vrt == VRT_DISABLED) {
> +		/* BSpec: 60258 */
> +		register_size = shdr->large_grf_mode ? VRT_256 : VRT_128;
> +	}
> +	return compute_max_threads_in_tg_xe3(register_size, shdr->simd_size,
> +					     shdr->hw_local_id_generation);
> +}
> +
>   /**
>    * gpgpu_shader__breakpoint_on:
>    * @shdr: shader to create breakpoint in
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 90ef3eec8..fc931a72b 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -14,7 +14,13 @@ struct intel_bb;
>   struct intel_buf;
>   
>   enum gpgpu_shader_vrt_modes {
> +	VRT_32 = 0x0,
> +	VRT_64 = 0x1,
>   	VRT_96 = 0x2,
> +	VRT_128 = 0x3,
> +	VRT_160 = 0x4,
> +	VRT_192 = 0x5,
> +	VRT_256 = 0x7,
>   	VRT_DISABLED,
>   };
>   
> @@ -29,6 +35,9 @@ struct gpgpu_shader {
>   	struct igt_map *labels;
>   	bool illegal_opcode_exception_enable;
>   	uint32_t num_threads_in_tg;
> +	bool large_grf_mode;
> +	uint32_t simd_size;
> +	bool hw_local_id_generation;
>   	enum gpgpu_shader_vrt_modes vrt;
>   };
>   
> @@ -72,6 +81,8 @@ static inline uint32_t gpgpu_shader_last_instr(struct gpgpu_shader *shdr)
>   
>   void gpgpu_shader_set_vrt(struct gpgpu_shader *shdr, enum gpgpu_shader_vrt_modes vrt);
>   
> +uint32_t gpgpu_shader__get_max_threads_in_tg(struct gpgpu_shader *shdr);
> +
>   void gpgpu_shader__wait(struct gpgpu_shader *shdr);
>   void gpgpu_shader__breakpoint_on(struct gpgpu_shader *shdr, uint32_t cmd_no);
>   void gpgpu_shader__breakpoint(struct gpgpu_shader *shdr);

