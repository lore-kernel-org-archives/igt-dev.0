Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D2CD29DD4
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 06:24:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F5710E2B5;
	Tue, 13 Jan 2026 06:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9ucd6sL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D4510E2B5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 06:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768285467; x=1799821467;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/t5WxZUCgtKT2RqvJ58xSZb7G3qinTTRNLlter1oeEo=;
 b=T9ucd6sL9dB9SMLvcjhjqGGMZpRI0ZcBhOdh8Ko43Kzad89GEBjK2qDz
 4XIZjWYSnBty7P2lOEj/y07r/eMPn03wZqBORnC8m5WXUWMxq+LaUA4ci
 C7JwNQBZgPUrpl0sbKFG81kV7iXSMu6/IUWSSHF6SeOcxcr81kmEyahj8
 qJs4hmnHcpvsf9LSmOx8x0Xy2ifZmLbmowUpyDXv+xoiiFUlU53Rr1pH2
 C7+4/SjFa0vpLN5kh7l9JceTADHdAV1p3npl0w3618oOTYKNByoeoYDK7
 vSKz1lIEYod9oF+/DOVAZpSeAWbkHoAkzTFtbpVcuGcyJotBVtF5aUJ4e A==;
X-CSE-ConnectionGUID: uIEHB4kpSPW20QBYsq6YuQ==
X-CSE-MsgGUID: A69Jjs54TDiOqdLvZyCKsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80673808"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="80673808"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 22:24:26 -0800
X-CSE-ConnectionGUID: mYPcPSXnTEuiILjcZ8Fy+A==
X-CSE-MsgGUID: r9BhDOY2TKKgEMlXPvu1KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="209129697"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 22:24:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 22:24:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 22:24:25 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 22:24:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+NSyskp4Z7XGaraw1R0XmeXT07QSA4Nju2B4eJDHmvZhmfKHp8zWvLhwa0/tPmQlNOM4Zy8DZJeAMIlJ1ITTIMfAqWykizkO4G9KX1VRteYNdyRyvAZuF365rrOJQERHDNHM54XtZ3gUxLbVNS7sgOCfYp/sXAtb7G7Dsv7zVMObnQcWqGa9cBIJudlT/mEiM+sUuy4qtYWksU9s7Q7m70IUbvHfPCGuZwi6Ax0F6/wkfmCJHYPGHSP2rLgdukkX9UzuF0DoOkBpsj/MBX2abyox2nUuKL1GCQM3LZ58hbwgxu77sv+w8UtjFOg2YW1z9R3s3jTWBugQ5OGXsHMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMHPaoNC7RFstCTSxjsgYNYPUfRopA+G7ri07WJTFaQ=;
 b=waA4elJ/uc4+t7Apb9FO9i4cFLMywf/WUVpjHhdibF0u1SPxHyOspHhYFSDypyFCtQRFCqSArvpZ/yNZdwptlKfUuwb5ft14NM0ieGQ+GwxHH5sQnCCMi/ZVJKz92c4rw2qjhZT2Ep02ov2RskWOxfq89XVbpAYXLpiEe4qFMfajH4f9X0Jpz9K83JBee4CQk57nYZJRga7q1yfbT2JZ3Lw7gltcH4fFK/ahaaPNgG7gfJgP4xO50PSy5ByUIv2msGRHLdyyzFS4Igfg2jw2uSYI75HG2f1iUmsDcdSvkd12pYG99c8dKqyJlKRVPbCgGDSLIrGkArJrLxPLDO8+WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DM6PR11MB4643.namprd11.prod.outlook.com (2603:10b6:5:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 06:24:20 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 06:24:20 +0000
Message-ID: <f9121611-630e-49f0-bc54-9f6e98493139@intel.com>
Date: Tue, 13 Jan 2026 11:54:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Add 3D lut tests to display blocklist
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260112082134.151464-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260112082134.151464-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::25) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DM6PR11MB4643:EE_
X-MS-Office365-Filtering-Correlation-Id: 020ed61f-7254-47f6-6f62-08de526c62ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGRlN3Vnekgra0UwS0dSeDNNVUhRamtxQXZMRlVVc2Y5d1J3ZWptRWozWElw?=
 =?utf-8?B?UVhEV3h2dzVuNVRpeUc1aHg1ajVOU1VtM0lLVGVFWnR5cXNrdVkwaTNQVFdp?=
 =?utf-8?B?cXVOdWZXalhJS3k5TzQweW5MT0gvMUpMVmF6aUxkNEFvUGNad3kxbXdxMGdS?=
 =?utf-8?B?MENrZG5JeVlQUUE2SWp4eXIzVlZCRmVndDMzZUZxUU53cmU2WDNSd2hydHRR?=
 =?utf-8?B?NTdJQUI1VURZUWpEMHAzdVB1cERQUmdNUU5uUFEvL1NBN1BHQXR4Vkl2RHEx?=
 =?utf-8?B?QXVmTnVMdmFhVUREeHF0a0hyY2xpQ2Fxb1JrdzFvZzZtR29zU00wS09La3Fo?=
 =?utf-8?B?L0JRWHNFeU5sVWNUZnFOandNdEhGenI0eUM3eEVQTmVXVlVRbDMrRG55K0ZC?=
 =?utf-8?B?K2pSanhwU1lydjRGTlVjNm0za0pEaXhGOFBvbmc1SFRDdmx4bWh3b0Q0a2Jv?=
 =?utf-8?B?OVJmNDdXYjR3Q3o5bGlOaE1YYUZmcTVFV0xzeGlFUnNFVTEzMWFmc0x1QVNn?=
 =?utf-8?B?cjVCb1l3Q0xCV2hJRUhmYS9KaDE4dUphbGR3anEyN3FvR3FLVlNNczVqalR0?=
 =?utf-8?B?S1htWkROWXkwRDd6TTRFSjRXZjAzVmwyWDQvOE5uUGRqN3g3SWFiRHM1dnhU?=
 =?utf-8?B?Mm1DTHVJcFJxYndYOEpYT01Fc1ljMm5nNURwTUs3Qi9xQlJwbklPNWozRkZH?=
 =?utf-8?B?bE1FRjgxYkh3cTJuUzZhMnN6REdieG9jYzdOZ0p6cnlaRm5xZ0RsRElsaCta?=
 =?utf-8?B?eTh1MUlGMWt0bG5pMWNVTHhNL3FCNi9ySlhLci9BQUpiRjM0R3Z5VWhWMXZ0?=
 =?utf-8?B?OEQ4SG5nR1lPQ1g0R1pHZEMxUHR4M0ozbXpEVUZUYWV6cmZPbEFzOEIrU3FI?=
 =?utf-8?B?ZVc5cUVxK01aMUx5RllXU29pOGgyeFAreDhLZHRPUTBPVjNhbTlKWE5abE1K?=
 =?utf-8?B?cUhHV1hlQUJaSVExNXJad2xXeWRTTUxveFBBRUp2WVhGMFJYVFp4TnBPNDRS?=
 =?utf-8?B?T1B5V1R5eTBsYXVFQkZsazBQanpVSnk0VmRhT2hTai9ZaXJJUHJjaWdkUkEw?=
 =?utf-8?B?MDViWGVuaGxVS3BGR2o2d1VLS2hWTGdEMGNNN2xKckRKUjZ3YS9nalJRMDdq?=
 =?utf-8?B?WWVXZzEwa1ZCSlBQRXp3MVBXS2tSamNUdzY3ZnZRb21OZ0RlbE5zOXAyQlFk?=
 =?utf-8?B?TXhMV1RlNTlvak53YjFhZjRVUVAvNmhJUXAzbE9ZOGlGNUMxY0NlaWVzWnV5?=
 =?utf-8?B?ZDU2TThBa2c3Z0kwUEhOeWE0dE5VaGl4c1pZVXJqSFl1ZE9lcWpZZE1rQVlw?=
 =?utf-8?B?U3MwalVZSzlsL1d4eHBOcEtDRnZTM1ZrMmg2ZkFxU0ROUVZ5K2hWa0FDN2Uz?=
 =?utf-8?B?RlduTnE3NlZMaERuZFNHNzdWK2x2Mjg4dnptVGk4b21vSHlyMllYVzJGdDlR?=
 =?utf-8?B?c3pWSlR5VnFaWExWUFJiT2d1TzlPM29LeXFFQ2dnY0JZQlBQOTJPK2dDRnpv?=
 =?utf-8?B?T25QQ3pVOEsyYzRKMCtSQ09RcHd3QmRWekxMV0xORy90Wk9OOEtYM0VGV1pl?=
 =?utf-8?B?bVJjTEUyeGNNcEx5bjR4UG1jSUx5T3R6bUtDeDBqMUxvUUFnRnZ5TnZJRFEy?=
 =?utf-8?B?MTdnSlh6S08yY0VweFBZUXlMOEpCVnlFVlp1UTBzdkZYeVJsZklKUy94cW9D?=
 =?utf-8?B?ZjFUaWl1Q1BXaVk4T0FFUFhUTjhkNmNQN2N4UGtaQTV6dWtwYzlkQ0F1d2pn?=
 =?utf-8?B?Q2VwTUVoV2k1MGRIZUFhZ1lqODAzQXVZRE9heVJuVHZJOG5KY0VqVWJCRXEw?=
 =?utf-8?B?MFFrZVNhZnZoWXFKcmphMitFVFg3a3I1LzhjV1RxeXB2cWQ4a0hGUlV3V3Bq?=
 =?utf-8?B?R3haeDNFWEtWeHc2SlJIeWZ4VlZCVVFXZldSbkdGME9VWmhGaEIvMGlZV1pK?=
 =?utf-8?Q?EO3pxEEGTMiPGYJV2rvGlWL8/BwEQ5Xb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFJIbm95SVFCNkpxa1dKV2hVQlQwRTFDOVU5cW02M0xDbytCY2JUTGRGamtX?=
 =?utf-8?B?OU9hWTdIekR3QjBrcmc5MFZrdnpqR0J6Q085cGZUT2RMNjh5MXRwSFNiVkVs?=
 =?utf-8?B?K2JndGE2UTVNVVQ2LzlGemN2TDVOM1RnK0ZId3VPQkZxeE1ZU1hhT3ZFWFNk?=
 =?utf-8?B?czJZa3BaMCtpZlRaZDExKzhkeUo0NzErbWlLcDJqU3ZOME5ib2gyRVpvb3hJ?=
 =?utf-8?B?NVFIZzB2Vm9GKzgwUDNVUlh0dXhUS0xxOFUxeEZlNHZrcHFhdnVxdmlOUlhR?=
 =?utf-8?B?ZlEwSTY4aHUwTHhBMkFuSkkyMVU3SXhLaXk5dEFVOE01czBaUVVJTUpDV2pE?=
 =?utf-8?B?cjYrRnZUNE5tTk5iNnFkYVZIVWlEVkxBWmpMZXI2M010N1diZ204akZ1UHB3?=
 =?utf-8?B?Wmczb3pzVUNpOXduUklVb0FGOG5TTDlpWHAxSS9jUVg0MmpKQ0FrTzh2d1JJ?=
 =?utf-8?B?bWNWZXZBVDB5RkNEenRDTU5kRW9YaXgrM2lXQjBOOGVkMEE5ejNkK1g3dXlo?=
 =?utf-8?B?MkYvZ0I2cTl1b05abWxGSyswZDMwS1R1NmZWc3hEWVUzTTJvTmwrNFQ0ZnlJ?=
 =?utf-8?B?VThkUmpkdzdrUGsxL0N3dVh4V0xKbSsvZm1EcUp6MkJHcEI1U0RkVGVKd3VY?=
 =?utf-8?B?dE1FNmRGZVBsTk5HaEFhYldoaG1zYmtUVkxtNWZhVHBOcndkMzlnYSsra3dP?=
 =?utf-8?B?SkxaMUpFSExGUkdSSDUwMWNnYm1Zbk4wZzBDbHRhcHV1OGJETUovdEJwQXRR?=
 =?utf-8?B?bXkxWlRwbDBIR0dsYTh0L1hzZ1Zsa1FyR05VQUw1Ni9HSU5vV1QwdUFNMVNk?=
 =?utf-8?B?ZTVhRTFZeXk3dFZMOVRPcjdneGVUS21CbkFwSzY5cUpXQzhVOWNpZTdhY3RO?=
 =?utf-8?B?RUMyUkxyL3FEcHl0ekZEKzIxeVd1bGZ1cEJISlpTVmRPSzBJbmJhTDQvdTZ2?=
 =?utf-8?B?MXMrOFhJcDZGZkhBTnh6RWZDSUJ0ekh4eVpBbWRTbXhDSGFrNVJNYjEydStr?=
 =?utf-8?B?SDhJNGFkdXByajlITFRPcVRGNm0rNmpoV3M5MGZnY05CaHJIWk03TWZQMlBV?=
 =?utf-8?B?VG8wUmxERlBzamY2WmJjN0hlUS9CWTY0WXFBckMyY2dQZnNrWjZqamZjVzNi?=
 =?utf-8?B?STJuUVpiWHNINWp1RzRoVXR0YzN3b24xVG5oL3RoVzVpc013OUxWb1l6U3Na?=
 =?utf-8?B?bUN6SDFjZnV4bWVES0xIZmRUOGgyYi91R3VvUzZSMDBBZXVxVElNU0NnRjZm?=
 =?utf-8?B?R2k2K2hlSlRnR3YrL0xyK3lBTDVOa3NoNENoVWVCNlQvMGNONEdBdWRtKytl?=
 =?utf-8?B?NU5jRC9jbmUwMDJoRnI1NCtVT3FZbGdnVTJVc1JJQng0TmRybXZ0TzE0Vk1r?=
 =?utf-8?B?TTlZL05SVVpyNDB2MGdGdmVYSXpyWm02bC9YR2dtcTNNTTYzOUFDMkRrSHNB?=
 =?utf-8?B?NG9XcWV2SytHR3MvaENLN2JBN2JFVGRUWXRJMmk4R1pHTWVMSkNHaFpMZGZ2?=
 =?utf-8?B?U09ldktvYlZlTXI3TVl6QTl1dGpsWkJqK0plWHFyWUZjeU0yQjUyS2Q4bENr?=
 =?utf-8?B?L1FkT3hZMHRpVm5pbkFHNVNMOXZhZGRzRUYzRjlPMVA1ZE9aeDkxTWxqVjY1?=
 =?utf-8?B?TWY4ekVJOFpqYUgydGZObXpNYTd1Q3VObE5haE92U01Jb21xejJFTVBLaHVL?=
 =?utf-8?B?M1NWNWpUR2xMdVlJdFFmYWwzQXh2ZkFPOTJhQzRMbTFrUUNIUFNBcXhKQXUw?=
 =?utf-8?B?ekRUSXFXVzdaY2htYWV6aTVKQUVKeGxNZWg4L2djczYyLys3S3RZOUVwaTI3?=
 =?utf-8?B?VE5IZnA0cWVJQnQxMEsyQXBNcDN6S25EaEFuOVVFM2ZXMzNDRk9HbGZuRGRo?=
 =?utf-8?B?OTB6QkkyT3BUd3BtK0FYcHFCVHpSYzkxYWx6a2h0ek4wSzRlSEkwWnZ3MHZJ?=
 =?utf-8?B?dGwvMzBUa2tLdGYraWZJSkxoZU9TVUhGT2xxL2tTY2NISW1uWGNrYnhZUENZ?=
 =?utf-8?B?TjJVT1dXcHdGdmhxeXZIb0JtUTBCb3d6WTJ4NkdPeDdsdm9MTCtPdFoxSCs4?=
 =?utf-8?B?NWFHVFNBQ2VaUHJTbk5WdWI5b2hUMzYwRFRtWThKcC9qbFQyK1NDQlZOcDdj?=
 =?utf-8?B?Q0YySElXWDFiS1o1RE9DdTgrWjk0OE9qbFVYcVRxRitrWjk2dXVNcmwyb1hT?=
 =?utf-8?B?QUgyU3N2c0JuSmp6MEJpQkxmOGVPYzhVTFpZSHFKV0lCbW8xTGt5YUZXRjkr?=
 =?utf-8?B?VXhraEp1ZGZrQWFMb1RrallqRGJWZE1TNUsrczkrWjNwb2tzcy9MMEFzRUhU?=
 =?utf-8?B?dGZGQjZxd0RPc2V1YURSdDRhUExQSWM0S1YzYWNQMGtWaUhCc2xwdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 020ed61f-7254-47f6-6f62-08de526c62ab
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 06:24:20.1638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWwh82258MCfXnbKLu6JvwFJAb9XhQQ8JJhPjHIvjcq4nqh7aNi1s9RdDTqOiIPdjbmTOdWRikwnY6GfeIQE0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4643
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

Hi Karthik,

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>


On 12-01-2026 01:51 pm, Karthik B S wrote:
> kms_color_pipeline@plane-lut3d-green-only is valid for NVL+ only.
> Blocklist this on older platforms.
>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/i915.blocklist.txt           | 4 ++++
>   tests/intel-ci/xe.bmg.display.blocklist.txt | 4 ++++
>   tests/intel-ci/xe.lnl.display.blocklist.txt | 4 ++++
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ++++
>   4 files changed, 16 insertions(+)
>
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index dffe464dc..8b47d10cd 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -198,3 +198,7 @@ igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
>   igt@kms_writeback@writeback.*
>   igt@kms_colorop@.*
>   ##################################################################
> +# Valid skip : 3D LUT is supported NVL+
> +##################################################################
> +igt@kms_color_pipeline@plane-lut3d-green-only
> +##################################################################
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index 361da761e..919be620d 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -169,3 +169,7 @@ igt@kms_big_fb@linear-max-hw-stride.*hflip
>   #########################################
>   igt@kms_pm_dc@dc5-retention-flops
>   #########################################
> +# Valid skip : 3D LUT is supported NVL+
> +########################################
> +igt@kms_color_pipeline@plane-lut3d-green-only
> +########################################
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index 4151582f6..6cc61b98f 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -179,3 +179,7 @@ igt@kms_frontbuffer_tracking@.*drrs.*
>   ########################################
>   igt@kms_pm_rpm@package-g7
>   ########################################
> +# Valid skip : 3D LUT is supported NVL+
> +########################################
> +igt@kms_color_pipeline@plane-lut3d-green-only
> +########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index ba784140e..a29c515b9 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -177,3 +177,7 @@ igt@kms_frontbuffer_tracking@.*drrs.*
>   #########################################
>   igt@kms_pm_rpm@package-g7
>   #########################################
> +# Valid skip : 3D LUT is supported NVL+
> +########################################
> +igt@kms_color_pipeline@plane-lut3d-green-only
> +########################################

