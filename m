Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273EAC54FB3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 08:39:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBD510E062;
	Mon,  2 Jun 2025 08:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsLqZYZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8991610E062
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 08:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748853568; x=1780389568;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jBoBinYBazftt936qbhbGh+WRyHM9Kpy/3SWNl6O9m0=;
 b=SsLqZYZX+uTnPsoEh6Lxpat2L0wgMl+BpRz0Xs95jSrw3HhvZnI5F+g0
 DJecpNU/RuousdCc4NonFDiGi00Cln5btH3l74qBRmsYj3z7upWi2SBkR
 joGq+NxEgNXCb0t+qXsGfhTim8iK2t2Ch06evgQpoHjs9A6MkJcby9CVM
 1Q2O8yDU5n79a5xvuy21m1ILC7otZ5bAMEqohPRb553q3TmU6vifLlSSS
 yyWAHoZ+4eJhAXCzwOGK4Mhr8mVc4dAgsuBSgXY/xAGNiPOK4FoVvkQcS
 igjBBgNfba4HmZ8Xo3ttmcRrzcd3kdIzAv2o9zkOxD32IIHLqWqRO2383 A==;
X-CSE-ConnectionGUID: /0vboQLOQ1qX0KhOcyw9UQ==
X-CSE-MsgGUID: bSNfRMPkSYWaOHhaG9I6Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50777185"
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; d="scan'208";a="50777185"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 01:39:27 -0700
X-CSE-ConnectionGUID: KPN+/vDsRHGJ3uzl6YtTGA==
X-CSE-MsgGUID: AT3+1VbVRN2cSn/C8J9xzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; d="scan'208";a="149491509"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 01:39:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 01:39:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 01:39:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.61)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 01:39:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etMl6eK+As6Y66HX+Nr1Z74dHRiRVkAvk7kdzY+nQnonO+gLnM5NpdrbIiexLufJOSWVVnFg1O5y1lL3dj+VtuyvV27PNwgAcW1gstoU+/ukADo38SB+TA6f8s5NH76zD3bWfe3GlmnSEEEgyu7GGPeIBlLBdumfXrLi8HQJ0CmNreM0Er8MZitV3lN+pQZffeNAArnuOlVjNtlErpSXa5lTtXBUwN2RWVB9MdKPXVSLYczfG5E3PPfhDgwloVRjfuGdb6dqJcdhc499a0KEBEJorpxU5Cs+QE9BPbGqs8mZsCTvqpqnlw5XYn8QCTg8NqyXS1Dcc1N0QPfuJapRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4D8ZaZUn4qSMtUSfUFZIlM024C7sXhkQFSrIJGUmp0=;
 b=XGLBdsAGs3Lrgp60jg3kuRSzunY/oRIa/XAbEcShqQFHgIaOMxV6/7wMygeMh9meHKvHdYJtkURqEu89T4t4w0uqK+j90JFkA5bMNJoxb/oHwS5/6B5RLxsH4f5fmUgrBqddrAw2fm/rJEA0dBNS2iZ2m38+vZiG+N0OrQ+6MqXJy49nxGJZJFN670PuPYYWrQancFvlpqT41HC3iSQgZcckCAADJIjRtW9pPStdCm0DTMTOzI0AF5QlL0/VmFwrReH6Dxq/T1fs7w2FrNwvG6YRkuEI9cjSu2BqkYoULfEH4TVt7Tu66NFbg0PzskTcs3bVFYiK9eKh3QzU9asH0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 08:39:24 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 08:39:24 +0000
Date: Mon, 2 Jun 2025 10:39:18 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 06/11] tests/xe_copy_basic: replace size to rect
 which keeps objects geometry
Message-ID: <aD1jNql80z_4T-fi@fdugast-desk>
References: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
 <20250530064050.1560398-7-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530064050.1560398-7-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZP191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::26) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: e39e5a49-52f2-4870-37eb-08dda1b0fa7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzh2OVkzQmVWamhuNjY2TUxyWFpydHdEZEViWlFuTXlybVRLbXBBbnp1UlJI?=
 =?utf-8?B?Z1d2RDhoOW5BZlZhSFVYeFRqT2JRWmtXTE9XUUg1MGlrQmJZaW8xbEl1eHgr?=
 =?utf-8?B?ZjlIOWxEamtJMVg2LzErWjlDemJrMXAvWXNjTWRBMFpTWGxOMUZHWWxPbFNq?=
 =?utf-8?B?MGlDWGdpUHdqUENYTkw3ejg1UTE3Z3FTbHFNUzZsQzRES3Fpd3RtZytuS2h5?=
 =?utf-8?B?eTRRS05qeHJNOVRCWFFQU1BCUlRPc09HNGVaQ1JZSXpLSmYvLzFuWUlZdVJ0?=
 =?utf-8?B?aVphMjBTNnBDQVdhbjYvTnpEdWdlTG5xUDRCeStuRURKbHlVeS8yWmd0WHFi?=
 =?utf-8?B?M2VkTEtnaWxlNG5EZU1tRm5tRlNia2VNNG1GcGdWV29ERUNUZ3Uza0tldnIx?=
 =?utf-8?B?dzNZWXhqczR4UW5CS2V3eEZ5UmRQektRWXJyc1JtUEJxajJiSVJEWWJuODE3?=
 =?utf-8?B?QWJGTk5uK0YrNnE2SHM5TWVWZU1EYzJ1dlJSWnpVcDFISmo0Wm9zMVhqOWhS?=
 =?utf-8?B?WG1uYk5IdEFvTGtlQVp1QzhRQ1QzTWJNRFA3SGRKeVlucWVOT1FIMDhpQUN2?=
 =?utf-8?B?WGdXN21lUXBwWUhqVzJraEsxdTZtRHNXWVNySEl0STZ2M1lMRkxmbHp2Y3BH?=
 =?utf-8?B?M3JqZHJZZ1JuSEVhOHJmeFZXM3BycFQwU0NqeG1MWXJOOVlIanZJazNSbHBs?=
 =?utf-8?B?R3NjYnBsMEFNV1Vua0FKd3lJYVBnOU8zRUNFUWRvQjJsbGpBV3lqa2loRGp5?=
 =?utf-8?B?MDNNampQVzl3QitzeTFiS2JTczFseHZMMG1wZHl0QW9Wdk1BU2MrUkZSWTFE?=
 =?utf-8?B?QUI2SzlDSjVMZGU2OE55bEVDQ2JHVnJsTkV1ZXp0cll5Ui8veC9ZaCtTR0ln?=
 =?utf-8?B?cDJnQXl4RWx6dis4bnJCSUlDNkNvYnQ4dnBCK3ZFVW4wSmlYcWd0OS9GWDdK?=
 =?utf-8?B?NXZFQ21XMUhXYysyanAwbnNiQm5TU2k3eHVGSWxVVldQTWwwblRvTDR4Y2Jl?=
 =?utf-8?B?eEcxdkEvM25nN3h5Uk00ZlpLZGFOTVlwN1B1dUQvUEFOSFJheExQalRSM3Ar?=
 =?utf-8?B?TWdLU1NoOHBZNjduT2NkK3B5MDNuT1IwOWNLVlcvUlo2ZVFqRFJYYlZjdDJ1?=
 =?utf-8?B?akVTVFVORVlRVTVvZHBaYkRDNTFEL1FyUWNneFhQejMwaDM1NU4yQ21QUHdq?=
 =?utf-8?B?TUpoUzk1M2pReFp2TndPRFFmTDRtNDNwMmVyUC8rM2NweHhEcFZuRFhPSE1a?=
 =?utf-8?B?YjVTSHVzejJmbjhWRnU1OHA4V1dCQmdBaktCRHQyT2FmZVJkelpxenJ1cFdw?=
 =?utf-8?B?VEhXa3daY2JZS0RQV1NWOGE2Y1JqeWZZZjFqdXR1bjlXa2dCQ2hmWlBLR1E3?=
 =?utf-8?B?RWhXWUtlTUx1UzhUdkE2T0ZIM2o0OVAxMk1JcWJnaG54alRqOVhlSStyY0V3?=
 =?utf-8?B?NDNsQlF6eG1YaFpFKzFEM2hqcjFvbUhHcFpBWFdKNkx1aXBiUktNenU5RnRX?=
 =?utf-8?B?emM2WFQ3UmVySm5ybkxNS0ZVcjR4aUZGdFRkamx4V0QvcDFWRFBYR2lDemph?=
 =?utf-8?B?S0N5c3MzWDZBS0VVS2NFZ1RLNFVMTFRnZVVhRjNTWWNpdUttdUNmL2xwQitw?=
 =?utf-8?B?dDlmKzNweXR4S0UxSWwxV0hiU1p1RXVuTk5mSE5LTzNTM0xkZldSMTVlMEdV?=
 =?utf-8?B?aU1mdWNOdW03Y0doR040NFRvWkdVMU9Rd1BobzhmMHdTSWI5c0lzTHY4Mk5P?=
 =?utf-8?B?T2dLNUhjZjRXTHpxUXlRL3g2VjJ6VUs2ZnZPT2RJWiszSlRDcmVPUnA4NHM2?=
 =?utf-8?B?TW5pYStwT1RiKzNMQ3QzeU1VcVBkOWtUMXZvUURoN1Y2TUFibG9Vb1d5Tk91?=
 =?utf-8?B?eXlCeWY5VksxN0ZEUGovR3ZiNmRXQk9yODBYeEZ4T1ZxMncvRGFHSjh5cWJG?=
 =?utf-8?Q?LOGOVf7/u3E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk1oM3VqRlBkQ2ZSWWZFa1l3dHVSZVJGSmpyajNRVVMydGdxSzlCRFMwYWV4?=
 =?utf-8?B?QXI0dTg2SEkyVEozekFGSHVuRFRiUlU5MVpXTXVadWRId2lFbzRBeGh1VGJh?=
 =?utf-8?B?UVN5OXE5M0F4YW5iaVZ6YVRLUGUyL1VoUnpaYmhCU05vclh1bWtINm94Nlh2?=
 =?utf-8?B?STFVS3dKWWNhUjhtY20xQjVLVmZ3REd0ZjNNVjAweHd2MldlL3lrYUdtYVdh?=
 =?utf-8?B?elJDSWdkVzZFemlad1FIdmlyaVQxUGhvWTNEMkZkV05YU3A0M2hPM0NodWtH?=
 =?utf-8?B?anVYQVZkN1RkaWpOZmhDY0Q5N3dMU1pBbkhoVUs5Ni9PT1Q5dUs4dWVCcHha?=
 =?utf-8?B?QUo2aWgzWEhvTlZudXdjcStKOHM2Wmh6TDFPOGNIck5YUWplQXIxNFhocEFa?=
 =?utf-8?B?M1A5S2VyTlpoNUorUzBNd0pzTkNTZSsxOWxaMEhaeEk3cXQ2ZHBLMXV5aVJr?=
 =?utf-8?B?ajR4ZGorcGZsM0JnTGx2UUh5V2c5MXdpSDV1TTdIRHRmd21EajZSWjc0N3NS?=
 =?utf-8?B?QmNBdU1SM1Z1SWx3UFdLMzl1RlNQMXM0Y0xhTDBlbUV0NlhBc21DVW1lcThG?=
 =?utf-8?B?dHp1R1BubGo4K2Q3ejNCdmNDUWEzblpPMWNpa2l4NUdKNm10d0pQTU4vbW16?=
 =?utf-8?B?U3JSTUNIaWdGcmJzRFpHdlNLM1ZYZkZGM0tXZlZWdWpRL0c3dVNjd0FvMkVR?=
 =?utf-8?B?SUJidVEwb1FpdEZML2ovMUNoMEFadTRMRlZBdklBSFh4dUVvNjRxeGl0TXZa?=
 =?utf-8?B?V2lHanVQeis1OVZrbzYwWVdPYlhER2dYa0ZZcGpRalFhcVBIdHV5K1JnR0ZL?=
 =?utf-8?B?aUZJdTNqZEViSEFSUVorT3o5YUk4b1llMjEvZDlSdjhRM0liRTVzYjk4RlJi?=
 =?utf-8?B?T2lSZ3hTd29BMEdmTi93eThjQTBXUWdUR2RGMlRhb0JJVGVEY3dOeUx1TUp5?=
 =?utf-8?B?cWlmbHpRNGVFSllLb3VpZmszN1lMK2prVDg5RE5leWtHUFplaWVyVkpzQ0gy?=
 =?utf-8?B?NjI2L1EvaVFvelBqVy8ySUtWcGE1bWE5L0VReml0aEtraEsrUENmUmdnSmpp?=
 =?utf-8?B?TEM4MUVob2huZVBpQ3d2c3pOdC94Z3I5UjE2UXhSWVh3MXhDSmYvQ1dUR0du?=
 =?utf-8?B?QlhRcmZPN3FHSWVlTDQzZXlVWDFOMDhkK2JJbklhRC82a2VtQUJMdHQ2SFJJ?=
 =?utf-8?B?UFdSMmRlVDcxRU00NDF3bVBYWlh3a0pqM3VjYnNXdDlvbm93SE9hOXQ0Rk9w?=
 =?utf-8?B?VkVNamh1ejNvMEgzSUZpeWMwQUtQUmZqYnhhUkU3ZldxSWk5Zy81Vkw1akxo?=
 =?utf-8?B?Qm1FaXdxVzA1LytxY3ZySmhSUk1nSHh4WjRZYTQvbXNucXEvWHFSSHhjZVNv?=
 =?utf-8?B?MlZVZGprV2tLS1djK1pSOG1OUUpNSFhFcHlXcEJsN01YS1RWdWxUK1hnSCtv?=
 =?utf-8?B?TGY3dUp0bThMZjVsc05qUzU1OVBSMGpNN1hiWGRUOUFUZXpMUjk3OVc0bVFw?=
 =?utf-8?B?SExobGIxbjVzRFNsdGh6TzRaNmFlcUtIMmRhSUY2NUNMM3hDN3lIZmh5WnFU?=
 =?utf-8?B?ZkdtOTZhV3psSGtzSDUxSmpZd2FydlMrNHF6cW5yWUkraXdFUnBZYWJlb0lD?=
 =?utf-8?B?NkgvUER3SzFZeVExbFg1NGFhT29MWFJjZjFpUWlZdkZ2Ui8zQnkwRXAxTmtw?=
 =?utf-8?B?UmRBRkZEbkdWK1pWVnBBWXorOG5FRDc1ZjdkdFIzYUR3anRBclFRMTJuZVNl?=
 =?utf-8?B?WW5HVjVDL1AzTGlNYWQxYmlRUFZKSkpFM1NMNFJFNCt6VkZDakRVS3NqUlUx?=
 =?utf-8?B?L1JwRDdMalR2ckRSakJ4ZUtWcHJoU1V5UzVFQzd6VTBrcFVRUSt5blMzNHN0?=
 =?utf-8?B?aytYWVdnc25uei9lMHhMWWVNQm14WkZMWSs1UjBLZHYrL2xTYzY2ZkVRNFpZ?=
 =?utf-8?B?SlpCVjVDSDRVcGcrWVBBTFhUYSs3UHByU21oTWtnb2F0MEcyRGlxdURQNk43?=
 =?utf-8?B?UVZjU0c1bHJ5bWtQQzFGVE1aSmF4NTNhZ0lQNm1naFhXQllNOStyZ1hwK1ly?=
 =?utf-8?B?bGpUeVl4dXdGcDk3aHdZbE93NkZIVTVtaFRNSHNNcmFpVnRLTnNGTGNOM2t1?=
 =?utf-8?B?YVNYNFNCcG9TdkxKeXhnN05HcFNQTmZWRXlXbDM3UXY5VmxZcVhNZy8wdE5n?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e39e5a49-52f2-4870-37eb-08dda1b0fa7a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 08:39:24.6987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klB2FYOmbnMsA/wN29wIym3b23g7ZH9kXo7WcBE0RQA19BOTth25GGG7KgKcDTpN893jU4HkhyGACGoTspKGqJ4gbMkz/TW69R1OBfKsQik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
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

On Fri, May 30, 2025 at 08:40:45AM +0200, Zbigniew Kempczyński wrote:
> Testing byte/page + linear/matrix mem-copy requires passing different
> pitch/width/height so replace simple size to geometry.
> 
> Change mem-copy and mem-set to use rect instead of size for
> copying bytes.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_copy_basic.c | 44 ++++++++++++++++++++++---------------
>  1 file changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index f252d29fd4..d55991c4f8 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -19,6 +19,12 @@
>  
>  #define MEM_FILL 0x8b
>  
> +struct rect {
> +	uint32_t pitch;
> +	uint32_t width;
> +	uint32_t height;
> +};
> +
>  /**
>   * TEST: Test to validate copy commands on xe
>   * Category: Core
> @@ -42,7 +48,7 @@
>   */
>  static void
>  mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
> -	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
> +	 uint32_t size, uint32_t pitch, uint32_t width, uint32_t height, uint32_t region)
>  {
>  	struct blt_mem_copy_data mem = {};
>  	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
> @@ -57,9 +63,9 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>  
>  	blt_mem_copy_init(fd, &mem, MODE_BYTE, TYPE_LINEAR);
> -	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
> +	blt_set_mem_object(&mem.src, src_handle, size, pitch, width, height,
>  			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
> -	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
> +	blt_set_mem_object(&mem.dst, dst_handle, size, pitch, width, height,
>  			   region, dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
>  	mem.src.ptr = xe_bo_map(fd, src_handle, size);
>  	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
> @@ -125,13 +131,14 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>  	munmap(mem.dst.ptr, size);
>  }
>  
> -static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t region)
> +static void copy_test(int fd, struct rect *rect, enum blt_cmd_type cmd, uint32_t region)
>  {
>  	struct drm_xe_engine_class_instance inst = {
>  		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
>  	};
> -	uint32_t src_handle, dst_handle, vm, exec_queue, src_size, dst_size;
> -	uint32_t bo_size = ALIGN(size, xe_get_default_alignment(fd));
> +	uint32_t src_handle, dst_handle, vm, exec_queue;
> +	uint32_t pitch = rect->pitch ?: rect->width;
> +	uint32_t bo_size = ALIGN(pitch * rect->height, xe_get_default_alignment(fd));
>  	intel_ctx_t *ctx;
>  
>  	src_handle = xe_bo_create(fd, 0, bo_size, region, 0);
> @@ -140,13 +147,11 @@ static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t reg
>  	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
>  	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
>  
> -	src_size = bo_size;
> -	dst_size = bo_size;
> -
>  	if (cmd == MEM_COPY)
> -		mem_copy(fd, src_handle, dst_handle, ctx, src_size, size, 1, region);
> +		mem_copy(fd, src_handle, dst_handle, ctx, bo_size,
> +			 pitch, rect->width, rect->height, region);
>  	else if (cmd == MEM_SET)
> -		mem_set(fd, dst_handle, ctx, dst_size, size, 1, MEM_FILL, region);
> +		mem_set(fd, dst_handle, ctx, bo_size, rect->width, 1, MEM_FILL, region);
>  
>  	gem_close(fd, src_handle);
>  	gem_close(fd, dst_handle);
> @@ -160,7 +165,10 @@ igt_main
>  	int fd;
>  	struct igt_collection *set, *regions;
>  	uint32_t region;
> -	uint64_t size[] = {0xFD, 0x369, 0x3FFF, 0xFFFE};
> +	struct rect linear[] = { { 0, 0xfd, 1 },
> +				 { 0, 0x369, 1 },
> +				 { 0, 0x3fff, 1 },
> +				 { 0, 0xfffe, 1 } };
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -170,22 +178,22 @@ igt_main
>  					       DRM_XE_MEM_REGION_CLASS_VRAM);
>  	}
>  
> -	for (int i = 0; i < ARRAY_SIZE(size); i++) {
> -		igt_subtest_f("mem-copy-linear-0x%"PRIx64"", size[i]) {
> +	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
> +		igt_subtest_f("mem-copy-linear-0x%x", linear[i].width) {
>  			igt_require(blt_has_mem_copy(fd));
>  			for_each_variation_r(regions, 1, set) {
>  				region = igt_collection_get_value(regions, 0);
> -				copy_test(fd, size[i], MEM_COPY, region);
> +				copy_test(fd, &linear[i], MEM_COPY, region);
>  			}
>  		}
>  	}
>  
> -	for (int i = 0; i < ARRAY_SIZE(size); i++) {
> -		igt_subtest_f("mem-set-linear-0x%"PRIx64"", size[i]) {
> +	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
> +		igt_subtest_f("mem-set-linear-0x%x", linear[i].width) {
>  			igt_require(blt_has_mem_set(fd));
>  			for_each_variation_r(regions, 1, set) {
>  				region = igt_collection_get_value(regions, 0);
> -				copy_test(fd, size[i], MEM_SET, region);
> +				copy_test(fd, &linear[i], MEM_SET, region);
>  			}
>  		}
>  	}
> -- 
> 2.43.0
> 
