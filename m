Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620EDC77B7C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 09:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1077510E55B;
	Tue, 24 Jun 2025 09:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/FUFb7l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D138410E55B
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 09:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750756673; x=1782292673;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SlB2BiWV5EUTGdv51J1dfo3zQoUT6OrUG9TyMh4MXBM=;
 b=N/FUFb7lRx60vL+t95aaDFxp6P5X1VexbGozZ+I4x98Qzd8HVM59C2x8
 JOFiqMhJlartfsSqYLxRsMZs4hVXvUsp+KOaZkUpkCjeYFVtMvGeT5A76
 Qp4IdS/g8dUPF3cxgT6UJ3zZbyMMbHsDUm6JdPO+fmLNP3Vt3xu68O/iq
 pc7qlJCbf2SckTC0f0xpmYRP85ybFJIIF6ypbepwnHS/EXJsWMF8wjD98
 OZCXxziVVxlP7oRz6qaiM/YQIvlz5gNImnZUNBaeEvknhQz/d0yKO9TAo
 MedPV7v8ppaeaIqWN57hH2pp98wPLxxBWKtnDwIJF0aICzNEwCOMAY18f w==;
X-CSE-ConnectionGUID: oPl188vASoW4uvJuvsIxgA==
X-CSE-MsgGUID: NAkNyuN9Qe6LJaDoGjVQGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63591056"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="63591056"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:17:53 -0700
X-CSE-ConnectionGUID: xoi4wCVrTYqqA/e/ht0pSg==
X-CSE-MsgGUID: lORxBXUXSCyoW4J+p/sqQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="156157443"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:17:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:17:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 02:17:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:17:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cv7UAbQkzE0zvjmJ5ppuhZSyBDeIcVNl1Hn8XnDazGCYZyj8KsYmrNLiH0rwsiuAhs4V7gEyO67dYQ+2ftv/V8yNUeJAXgJKWUPAGkSrFCabOjB+OyzwI50auvmxU0eEiE5LlkF8vusm3hEhzE68upk0ONkP9F0ITQ/TWTNUTVk2tt7rQM4oIrhUNBBpnU4cM2gO6O6mh02cAZcYiwOAg2WV6tEUR7Vz9wkRCZvovVelOgMy5nBbqO2izpyTRRBiu4vzkRvZgm2g0JcdwPLhG3B33HFTDm+psQ3DyZ0W3W/9Mqw00VuCZr9JpYKJY4v1eQGJQFN9h2MQiYQrZAT32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELgpkbEGRrLQdK4Wa+VuIjq+DBr+YNZYSuGamAIhnxU=;
 b=t4wlWued41lPuNxmgYBw/bgflbrCElcEXpfUiMEbVM9xfWrn5tsJex1ISHOM/NQFq7OhCBUHTWBKCitT1kQK8nVmN/kP9E/ZN9CLfztSCye9SGB5wT9xz5dBTt+2DGl4ocI9TU3loB5dhtYyT2ZijKjjahPGq/rQ7ywmbASfkgF+bExTBUCdBFd0QGCevYhm2geV/tQR7ZIKd++TU+hCvN9SCZ6gkD9tX1zb3mBLrszSNI/w0rUwDxg8hsVhTH7Xs34g2g3sq9PXasyui2BuyVXOs847nazGnXuBHn5AfjlX83kdXg5nes5Bm2jZZ6Olh6b/dey5Lb+1OtlVOKPoFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 09:17:35 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 09:17:34 +0000
Message-ID: <dd35d3a6-afcc-49de-89b1-b74199b21388@intel.com>
Date: Tue, 24 Jun 2025 14:47:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/kms_async_flips: Add DPMS subtest
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
References: <20250619112334.744213-1-karthik.b.s@intel.com>
 <20250619112334.744213-3-karthik.b.s@intel.com>
 <IA0PR11MB7307259DED2EF282E0CD11F2BA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <IA0PR11MB7307259DED2EF282E0CD11F2BA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ff12b2-f1ca-4961-caba-08ddb2fff447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QS9xWDYxM2c3Ulk5MjFrR1Q5T1FycjVUaS94Y3MrN3JCdTNsNUtqNS9hWU5q?=
 =?utf-8?B?VzBDZTA4am9BbmtDK2c4bkNNd0t0S2thejFjSi9pV0h3NHByNlEwODNLYVR2?=
 =?utf-8?B?WlB2bmR1blZMRnlIcUtnUWJkRDR3QW55ZUR5ZXlTWnh4YVZjUHo5THNXWVll?=
 =?utf-8?B?QSt6R2dKaTMvZUs1NDNtWEM1Q1NRdDk3Uk52NzJwd3NEZGtJOTRtS1MwYmNR?=
 =?utf-8?B?R09PZU1IVnBUZFp2T1BkcFhjYUpkU3JBUEpiV0NUaDRjN2R3UDA2aVFBNWty?=
 =?utf-8?B?cHdoM0tIelJpNTVSSWdJNVpOQ0l3Y24vTU5jTlRaTFUrb3Z5bllUU1pUckJv?=
 =?utf-8?B?eXZadkZNSWVTR1BGQUJheVdicjBxc3EwdGVuK1VSdms3TjBwMXJ5bEVndzQ0?=
 =?utf-8?B?Ni94UWdPWHZ5SG1WQ3FoREpzclhla0N1WUlEdDVHSmF1R0UwOURVZFYzRHNm?=
 =?utf-8?B?ZXhqWG5BL2QrTGZBQ29qd00zSmZON0hIL0loOW9ySDBSWEhwL0NkREluZXBP?=
 =?utf-8?B?NW9aY0NtOGt2TjRYWG43NU9JRGhNTHJJa3NhaVUxTFVYQjVaOE4vQi9BSStL?=
 =?utf-8?B?dmRHUUZmU3RZaUttTjRwcklBcHFqR1dldHBWMENteU1Fd0p5dXl3aGNzSlVt?=
 =?utf-8?B?OHRSZWU3UXg3NkRvcmI2OTU3OGhTTXJ2T1g3ZEZhcDk3Q2RJaVVyWXlzUWpQ?=
 =?utf-8?B?VUt5N1QycXRGNGRlR3FjTzNRa0dTbzNjOGxoekdEV1F4VVRwQnRYOVR0U1Zp?=
 =?utf-8?B?VExRNGJkMTQ2TFUva0xVL1Y4RVRCbzdtblFBQXM0K3oyOVQxNlo5Z2p3SDdT?=
 =?utf-8?B?ZXNrcDYyMnhUK1Z1a2tDVFh4eGRWUHNzRi9yUlplMUdwcFVLYW1WZDYzdCsv?=
 =?utf-8?B?bTBodFk1NnVvRGc0L01ITlBtUDQzS0M1SXZWMWNtLzdPQWZvWmtaZUpFVEJt?=
 =?utf-8?B?RVJSYlEwL0F3bHhwQ1NWMmMvbVNkbUxSWDMxMGhQeW5zYWUrN0QzcWwxQjFT?=
 =?utf-8?B?M08zT2VBd2k3NzlZRGNuS0ZUV05CNTlQQlVTdTM2NGZ2RWhZU3M4czFzdnpR?=
 =?utf-8?B?L01WRzJaVDhTLy91a3ArV2tlOHJ3SStkSFNvdGF0amh4S0dUbG43UjJNOG15?=
 =?utf-8?B?L0NkNmRYZDBzY2VLVUl6TUlzclVHTWZrTEVJYnpoMVZtZTFlWE44REp3M1dN?=
 =?utf-8?B?SEZQZkp4ZHAyb1VlbmsxT2IyM2EzUWY1YjZrS3JDcVBxVk53L3F2eTVMc0Ur?=
 =?utf-8?B?dzRkZENlY0s2QXJMeXNCQ0NxSUtoS080ZGp3VktBVDRuQWtwNVYvSXpNV3lt?=
 =?utf-8?B?UFAyOWZkczlhWWlYelF2cTlNb0tpWVMyc3lFMm9tNHBzMmpZS0I2eGJLL1do?=
 =?utf-8?B?WitoQytwY3lrNWowUEhYOUFYRnVXQ3VXMTFsbWExbDBTUHRNOSt6MTgwMmtS?=
 =?utf-8?B?MFVsZ1dIcEsrMlJOM0RHMEhJTUwzZFBLdml3emhwVHdXMDdMMlJCeWdjWjFj?=
 =?utf-8?B?MktUR2g0bWRZbzVSR3liVnBxRUN6VFZDSityaUo1VGl6TkRRVXdvcGYwaFdH?=
 =?utf-8?B?YWhXSmg0WDdCa2JGbGYrbTh0M0t2eVMvQTdoc1U4bUV3a3dtbzJLbzQ2eXR5?=
 =?utf-8?B?RUlBd0RkM0Z2QmZLSkJqYnJBK2VaMkJFOHljYnhpbDA5S1dTdUE2ckpJY3Iz?=
 =?utf-8?B?Mi96ZlR0SXpzMlA3UXFNTzE2M01xNllsSEE2UDhrL2JKb1pXRGNJOE1ESGNx?=
 =?utf-8?B?cVU3UTFrbmVmV1kyRW94SWJzRUZFSnhxWi9Qdm1ub3JTaVNOTlBBSC9TNUpQ?=
 =?utf-8?B?VHFpdWdEVXZtU3piMkx6RkxieWRHWHlZTHcybWNlVkVMQnRPdnR2MEVNZGdH?=
 =?utf-8?B?eDZNNUpaN0NmOXRYNkxlanljMWFmRmV1dFJhcnV0SFZWRVpsQlo4R3BBMU9K?=
 =?utf-8?Q?S6tf8xXQKtg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2dBWFBBNnJrLzhmM2tsS1BOZWdVM2RFU1BBV0hiZldhM2kxaTcvaTk4eG1Q?=
 =?utf-8?B?UGhMMnRMalJlRHpzSUpESjBPU2p3c0pBeGg1ZDRmM0VmeE5aYTA2Z3JmK25C?=
 =?utf-8?B?dFlzbVptS3R2Y3luYjNZYXdja3J5YklRV2lSQmZOZk5YbkpTZ0ZaZXJNOXJm?=
 =?utf-8?B?OEV6RGxGQXZLSWpjdFdnd0w2T1VVTDFqZHNSY1JwSUN2eWdVU2RQd2dIYkJC?=
 =?utf-8?B?S21WdmNNZkUrMG1SUjl1M1RRUWxxd1AzSy9BNDhwOFpsK3NWOHV0bWI1U2F0?=
 =?utf-8?B?VUdjUVk3VVlXdFdIOG9tQ1RueG9mNHdHTkJpUXoyM1lGVFFJd29VWWxTclhZ?=
 =?utf-8?B?ZjJVR1NSdjEzQnVvb2NxRzNqRTJpcUZvc0REeUZPaFRxRUUyMzdzM01iRTdN?=
 =?utf-8?B?YUN5a0tpYWFWREpGeEJzQXRIOWFiUmw2YzVJNENyYXBvMVFHZzY3U09oUktY?=
 =?utf-8?B?WjdBV0t1L0wvSFlJemtiU2IrYXdtVk9KeEd6NEZEM3J5SmgzVktMZU9UeE1l?=
 =?utf-8?B?Q21tNlYyT0VueGZTZ2ViOFozT2k1Wlk3a0t1OFN6RW92QklrY2RENkV2K3Rs?=
 =?utf-8?B?eWpRUnJDTmJQRWVjTktFdk9qVENNbVlLWVNsbmJ5WThIbkxRQVQ4MG84RnpH?=
 =?utf-8?B?aVdlaE9FeHBlVU9uNU5kOFVWcGtGK2lMRVl0bFduMjRHeXZzNDl6emd1ZWp1?=
 =?utf-8?B?TW9LRUROUjA3OWlDbWViRWpQYW1WY0RqK2lRM0IzZUtlS0hrcURxNWJkeDlk?=
 =?utf-8?B?ODNQOWloR3AzUDZEMHdWK01KTm1ZNGtSYUxGQzEwYjFSbk9JQ0ZpcXhXWk44?=
 =?utf-8?B?WDQxUkcrY3NoR0tvdUtWYmhtTmNEK3dlL01aWUlhQVA0SzZHenRNdlZ1RUdD?=
 =?utf-8?B?L041dllXazl4QkpUMU9hUjZaRHZuRlhacUQ3WlF6MlRkVUFBcXJqbTQ2eGRy?=
 =?utf-8?B?c2ErNFlLOHkrMGZyWjFwRXZ6NWRSYzBsejloeTBlY2J1dXZnbTFDejNmVmFT?=
 =?utf-8?B?N1dzNW9tYm8vcEpCN2ZOTkgwK3VuOHdTWnVoSmE2dWtFOGROdkFGQWRzMDB1?=
 =?utf-8?B?WFQvZUdwTEtmam9zOW54MHlmVVpLUDJwZGtXbEtXV2hxaVB4WVNMcWtVL0Mv?=
 =?utf-8?B?UTgyNURLOFhTL0I0VHFRNFZ2NVJOeDdvd2VCVFU4UDk1UXRwNzM1NFRvbjB5?=
 =?utf-8?B?dWt1ODdUVUp0d2hqV1ZvbWsySlEveENHOEJqOEZ1Zk9QS1BQMUhMZ1Q0ZjJJ?=
 =?utf-8?B?SUVXN21BZVVoVlVWb0RVT1VJdFN4eDMxYlNac3VZNkVJbllCRE4vOU4rYmNl?=
 =?utf-8?B?VTMwd3RhbFJ1WVhjRC9IcjlLUWIzbjBQdXNRbk41S2dSRWVTN1ZTSjE3YmlK?=
 =?utf-8?B?bFg0WDZ2WjUvL1hxakVTdmNuZHI4T3NOaUlCQVU4R0JRODBBSS90WVFCWXkv?=
 =?utf-8?B?cDZWQnVFWXpFSEZsbURjR3hXQzhXdmEvN21KMWFRS2c4dDluYndOMHdqUFVp?=
 =?utf-8?B?WVJVZXBHMkFJd0hnclhZR0o5ajY5YU1McXVnRE5EaEpQOHV3RmJ2L0YxWVl1?=
 =?utf-8?B?SVY0VXFVMjZkODgvc2htNGZVTUhrZDNKZ09qSlI0MjBIRndPREdLeEh2Smxv?=
 =?utf-8?B?NjB5WW9hejZJc0VBeHJqRCs0QkU0SzUzK2IyaUFBUVMwNUpoRER6a0U0U09B?=
 =?utf-8?B?OUVvOEpIaS9FNitzZERxU09INmVZcjBmT01iTG9aYnpQSHhCNitKVDUwbzJP?=
 =?utf-8?B?SWVtK2EvNTNoSjQzR0t2b3VFNjBuNFFqcExSTmhVcUlEaVNGUVArL2gwYkNm?=
 =?utf-8?B?NEVSd2N4QmNGeUFmcjk5TVU5RFFwdHhzdnFxUFR2NGRGdVl2Um10RWptSUZE?=
 =?utf-8?B?bHBVTE0wS3dLalpNQVlNMjRBQXp0cXdBMWNWUVovekcyeHBlVDZyb1RKdjlS?=
 =?utf-8?B?OWdPNWJzbTRheCtJbVB4aVFQSXQwZm43Z1JTTkozd2lVaWFoeGJCZ2xDMkhR?=
 =?utf-8?B?ZEw2WGw0MEwwVnlGY1E5WkVIckNGM0ljYU5TWnhaVk52RDR3cXlkT0FGMFQ2?=
 =?utf-8?B?eFpnMzlVanZBTzVnRFlQd0F0SW9QVnArZXJMb0tlVmpaVEU2R3JWRVhwNVlZ?=
 =?utf-8?B?M0dSQnIyaVJtclcvSmtrOHNHcWNQbkpmbm1OUnVOY2hJbmxYb0dYUVVpMnZz?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ff12b2-f1ca-4961-caba-08ddb2fff447
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:17:34.4879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmpnjFtqpHRgTtOqgdQNIlnRW+mKna9kUSLusMDJU5/VIWPTbH77Gp5QGvpi/BO09kor3M0Y7CZsG3EgnehlTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
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


On 6/20/2025 11:11 AM, Murthy, Arun R wrote:
>> -----Original Message-----
>> From: B S, Karthik <karthik.b.s@intel.com>
>> Sent: Thursday, June 19, 2025 4:54 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; Murthy,
>> Arun R <arun.r.murthy@intel.com>; B S, Karthik <karthik.b.s@intel.com>
>> Subject: [PATCH i-g-t 3/3] tests/kms_async_flips: Add DPMS subtest
>>
>> Test functionality of async flips with DPMS.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_async_flips.c | 34 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
>> 8587e4675..b0f96ad95 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -89,6 +89,9 @@
>>    * SUBTEST: async-flip-hang
>>    * Description: Verify the async flip functionality with hang cycle
>>    *
>> + * SUBTEST: async-flip-dpms
>> + * Description: Verify the async flip functionality with dpms cycle
>> + *
>>    * SUBTEST: overlay-atomic
>>    * Description: Verify overlay planes with async flips in atomic API
>>    *
>> @@ -136,6 +139,7 @@ typedef struct {
>>   	bool alternate_sync_async;
>>   	bool suspend_resume;
>>   	bool hang;
>> +	bool dpms;
>>   	bool allow_fail;
>>   	struct buf_ops *bops;
>>   	bool atomic_path;
>> @@ -375,6 +379,21 @@ static int perform_flip(data_t *data, int frame, int
>> flags)
>>   	return ret;
>>   }
>>
>> +static void check_dpms(igt_output_t *output) {
>> +	igt_require(igt_setup_runtime_pm(output->display->drm_fd));
>> +
>> +	kmstest_set_connector_dpms(output->display->drm_fd,
>> +				   output->config.connector,
>> +				   DRM_MODE_DPMS_OFF);
>> +
>> 	igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPE
>> NDED));
>> +
>> +	kmstest_set_connector_dpms(output->display->drm_fd,
>> +				   output->config.connector,
>> +				   DRM_MODE_DPMS_ON);
>> +
>> 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE)
>> );
>> +}
>> +
>>   static void test_async_flip(data_t *data)  {
>>   	int ret, frame;
>> @@ -383,7 +402,7 @@ static void test_async_flip(data_t *data)
>>   	igt_hang_t hang;
>>   	uint64_t ahnd = 0;
>>   	int mid_time = RUN_TIME / 2;
>> -	bool temp = data->suspend_resume || data->hang;
>> +	bool temp = data->suspend_resume || data->hang || data->dpms;
>>
>>   	igt_display_commit2(&data->display, data->display.is_atomic ?
>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>
>> @@ -454,6 +473,11 @@ static void test_async_flip(data_t *data)
>>   			hang = igt_hang_ring_with_ahnd(data->drm_fd,
>> I915_EXEC_DEFAULT, ahnd);
>>   		}
>>
>> +		if (data->dpms && diff.tv_sec == mid_time && temp) {
>> +			temp = false;
>> +			check_dpms(data->output);
>> +		}
>> +
> After DPMS cycle the first async flip can consume upto one vblank time. So this delay has to be considered while measuring the performance.

Thank you for the review.

Sure, will accommodate this delay in the runtime in v2.

Thanks,
Karthik.B.S
>
> Thanks and Regards,
> Arun R Murthy
> -------------------
>>   		frame++;
>>   	} while (diff.tv_sec < RUN_TIME);
>>
>> @@ -1063,6 +1087,14 @@ igt_main
>>   		data.hang = false;
>>   	}
>>
>> +	igt_describe("Verify the async flip functionality after dpms cycle");
>> +	igt_subtest_with_dynamic("async-flip-dpms") {
>> +		test_init_ops(&data);
>> +		data.dpms = true;
>> +		run_test(&data, test_async_flip);
>> +		data.dpms = false;
>> +	}
>> +
>>   	igt_fixture {
>>   		for (i = 0; i < NUM_FBS; i++) {
>>   			igt_remove_fb(data.drm_fd, &data.bufs[i]);
>> --
>> 2.43.0
