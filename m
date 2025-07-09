Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51704C83F09
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 13:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0715010E7DE;
	Wed,  9 Jul 2025 13:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIRf3Qnh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E11B10E7DE
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jul 2025 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752066095; x=1783602095;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RUYncmfmq9kSkbBWlKWlRxQ2pntbg7NGzfDdlZ4C9Rs=;
 b=QIRf3QnhzglEYZsn57lBN8fZfTnDU+tNPqGVKTjOkJiZiBf4gTXuFIf5
 eTEgfOVrD0hwgTn/nRhIXmgCsz7ZqfXO+XMx5fRw0kJe8dq+uKF9pjf3B
 oBdRyt95nWwLbjhWH4PSnQkk9rDW1V8J9K6VU/JssXt6S1xlHinBqiwCm
 qY9pghbnZoC1o16Fu9ABMaDfWI/frhevKbZjPLLnMxVmIzGHPfTK5YaSs
 c/tzBTrSdKSXzTjX++JtDmAHwvuFSMSB4OCB6pTRfbi7TfBuBl70v3Mk9
 DQ9PvIBsktlAlICyVRMranCP5nFgyf31j+ea/QNQz6XLA9/bglZRkgKYs w==;
X-CSE-ConnectionGUID: UVvd6rJ7TQOHUTAFDP+7oA==
X-CSE-MsgGUID: C9eByPb1RFe4MUOX5cGNZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="57992096"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="57992096"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 06:01:35 -0700
X-CSE-ConnectionGUID: cmQ1SLt2SkWHWS1RbzODcA==
X-CSE-MsgGUID: gyRf5ZRZQGWBVRm2wSeISw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155856380"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 06:01:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 06:01:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 06:01:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.83) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 06:01:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lf3RmIf76jj2faAd+3ih+1CNIljD7O9DOOJ7RaELlFYANl2NF0I9urDDWtLMPltqCfUZZ6muuo+g0bKfuz8o47Hf5Sgi+hKxN0cqlO5tUI4o+B/3/pMjHlJBYvPgDWOdqKvLvLF2U+hVfAkSBdTEg0Jrjfrrvx1YjNll5pG6xHXUpKs4f2Ns5IkdZzvbs6cHyqy78/uUR8ZYGZ/6FVafQ5/0A2wGrip6CKxUCFMj94GZYFMqNF3I7cR/9vjGxpmB5voyjAt1xfuGx1q1jsAfa6dgqnTi9Azfj/RECBjRU/Tr/vcVn3eOj7ioUy0uSw9NCVIQD3/CmO91ajRNLynTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFNH0d/R/5tywEhcKK5Ai5RnHa15cKZYZNLpDUj6RPI=;
 b=nM2LwlwC83urslo9eUC4d4JjmHD73oDhgxNv5UVj6xdThRDqBlFvLavECdDxShPhBGtaHFQ1C8gims0it8iIUYicVzlJPA0Tu7yw9G390I9Db1Ot4aGQW4pU6ZPaePtXb0cP7d9oNlQa9M89hxmaKlcWt7IS7FeCNF4rVD8ojjnNbpD+6IFG61mEUYgsF5jFkKySf7piRsd7jKN2yyubTlXkK2J1hMimTroI/iw2ulrZinE9UkWQ3uZNijXxjNB++J7HiceQ8s7avLst3Op0VCMN0Bm+bf6IAD+fmsZsfUMpQLd6i3lrQJNgsTuQN51LV4phIyvG3kG4FSmJiZ8V3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by CY8PR11MB6865.namprd11.prod.outlook.com
 (2603:10b6:930:5f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 13:01:02 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%7]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 13:01:02 +0000
Message-ID: <e92fde98-df4f-4555-97b1-40abe8282c0e@intel.com>
Date: Wed, 9 Jul 2025 15:00:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 4/5] intel-ci: rename i915 testlists
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Karthik B S <karthik.b.s@intel.com>
References: <20250708152808.59977-1-kamil.konieczny@linux.intel.com>
 <20250708152808.59977-5-kamil.konieczny@linux.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250708152808.59977-5-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0038.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::27) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|CY8PR11MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b54bce-d87a-4629-92f0-08ddbee8a7f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmkwSUg5dmlXVjhsdUFmWDhMdnp4ZlVhUFJuL0FSNVQ2T1BvN1FDVklUbVp5?=
 =?utf-8?B?N2VzUGg2VXUrZkcvbFFhWU1ZMXhrMlVSUlRSS1VtcHFURXVNUnRtbTBDU0Vo?=
 =?utf-8?B?dTVraGlwY2hPcHRqdGNsWFBuS1h4VTFVNjRKVWNqcm5CKy80eWNzcTJOT0Zx?=
 =?utf-8?B?U3p6eGxKU1lJeWFzdWpVTjJLU2t1VnpzNUZsMXZITWVBWGxJUFJodWFQT0Vy?=
 =?utf-8?B?NDEzMllMQXlRSFhrMlJNSGw2TXNSZ216Z3RmbXkrR1Y2WDgzV0JoTWRUalN2?=
 =?utf-8?B?RTVubXNuOFJubjVXTGxFUzRpdXFFYVlNYjVwV0NpTTh3NDVIMmlTaEJRVGpY?=
 =?utf-8?B?L1FycUxhdS9nNXJTRDhIS1ZMTFpzSzl6RE9WTU5PZm9aVElmblI5U3hEM1Qr?=
 =?utf-8?B?aDB6YU1TSGJ2eW10dGk2VllaMmpsci9XVkNrLzJUeG1MVlI1Y2lGWWhJV3ZS?=
 =?utf-8?B?N0VyNlFKRVhlazdKYittNXNKUWFoUG5SMDNJZmEralhYYmxPSmo0bmFWTi93?=
 =?utf-8?B?bTJ2K01mSkhGeEZSMFk3RlVrZnFJaDVMdzFsNmgvR2tmejJWWW9oSlVYVWU1?=
 =?utf-8?B?b2tHOVpNSEIyNHZodlhCcHBtL2k1WlFQaUMwa3VieG5vckZJa3VSUER2aDkr?=
 =?utf-8?B?SGJDZE9ZTVo4d09rbUFNQmUxNmZnbi95ejUxWlNaRWM5aGlvQXBiK1I2aW04?=
 =?utf-8?B?TW9qeVlvS3ZrOG9Yc3pJUml6SmZkS2VpblVybzFITHQycGNMdzdCSjlPTnps?=
 =?utf-8?B?Um45cHFLdW5qTWFrODdYTElWVHNVZnZzYU5oOEhsa0pWOHllbzAwODVsL3VZ?=
 =?utf-8?B?Tlo3alhMdTR6SVZ5OEhsY2ExbVdZbkFGaHFtV3RxVXlibkR4Y29GcjZlL3o0?=
 =?utf-8?B?RUd0Uit1am15Q3RZWjF1Ym9CMXpJOVc3YXhIdWNXRGcxVlhvbmFrTnFzK2tF?=
 =?utf-8?B?MGFGTW9BcVUxT2g2UGRYdm9nd3ZBVHhEUGJFYUFMRE5UYndsTnVOQXJoOFlW?=
 =?utf-8?B?cTRobEhSMlFlM2lQb3JOZUVRQURHUUprQWV2VEZ4czZHUW1KUC9JYnNYRUJy?=
 =?utf-8?B?ZUY0dXdDTDFtZzdORFdwendLaDZKazU3VnRoMUVieTJaQUlkMWxsMy9iTWFZ?=
 =?utf-8?B?QnhHeW53V00wU2xGMW1pOGVTRkY4NkZhc0FlNHZFdWwzelV3ZzgvOEVwOUR0?=
 =?utf-8?B?UU1IZkgzYWNQaHNVN2xSdHhZSEhUbDNrUTk0QUx5aU5YZERVTktCS1pPdDk0?=
 =?utf-8?B?V09hNUIyYkRyTjFBNXVLcy8vYzRHWGhZVnJpVHA2R3ViamtUWUEvTmg4MWJZ?=
 =?utf-8?B?dlBMWW9jV2hCZnRkNW5ORVhkbStlL0FNVzVyM0plZDZxT3FVeHNqem1kblha?=
 =?utf-8?B?MEluQWtrNnNxL3hiVjBMOUd3allhMGU0dkdMdmpZRmJOY1ZKTnBYamFPeDU5?=
 =?utf-8?B?ZW5LZXZGWDRwbEd2OW9HRGN3YTNSWWlxNjVWUnZWR3hiZVVhL3BDdWxqS1Q1?=
 =?utf-8?B?UVNXT3BKdXovRVhOamRDV0FVTU1haTV3Ym84SzQ5dTd2MGpLNXl0a0xaNTBl?=
 =?utf-8?B?aS83WUUwWnJMbGdNTVhoYkNvR1VyK1p5S2lUNXk3QThydzNJZXhVUGdxWkJ4?=
 =?utf-8?B?YmFtSE54RGtwa2ZkZjN1dlNkRkNGVWhCMmxtT0p4VWdtL25RMW1tanRQbHRF?=
 =?utf-8?B?WEEvN3ZmdmRNUS9DTzNYS2JDWm93Njd0ZXpzbzEzVEd2TGo4ais5VG5UK1BF?=
 =?utf-8?B?YXYwUFpMc0N2MmdMZHRjVmthRmR6Q2VKSVRFT2pGOFNtam1LS3Y4QUhOdXlI?=
 =?utf-8?B?OXZEYm4wd3M0djF1TXd3aHBhcXhVYUd4NU9xYUp0M1g2N013ZEZRcFFaM1J3?=
 =?utf-8?B?dW12T3JyVzlnZ1paRHE3L01qL1F5ZmY1VGFkWWg1Y1pXbHFoRzVvNktiYmln?=
 =?utf-8?Q?AHC7pd/GIxU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Smw2Y0UvWk1uOVoyNTFxOE5ZbU1uWWJadVR2M1lTcUE4T2VrenNydGFjUjhS?=
 =?utf-8?B?WEp1YlRKcDhwQ2JaWm8yOTAxK3VlbHoyTFZQV0kvb2pqNXd4ZnV5S2k0aUtG?=
 =?utf-8?B?UER6VFNRcUtwWFlpNWJkQ3B6NzB5bnM4MElmQTdrcGZWaFRlWlQ3VDN0Mms2?=
 =?utf-8?B?SmhOdE85WEdmZjdRck1XRTlYQ2prVHBIS0VPWWdrbmV4K3VRUUlDL1JQVUdB?=
 =?utf-8?B?T095WWxGSFB2emJVZ21pVS81aGpYalVpMlYrdFVuUWxsZ1I3TTNQMXljYzFl?=
 =?utf-8?B?VHdNQkpQdlpPa3NYRkYydW1WcTJFVFJEUFNrZ3pkU3MxaEFDei96NVBkT3l0?=
 =?utf-8?B?eWVSRjY5U01qdkUxLzQwbnhDdktSMnQ4eXczYlJqaDRDZUNESVh3TDd2cC9N?=
 =?utf-8?B?a21ST2tMcml3VkJ3WmJKcjRYN2dqam9aSTVwWW1jUXdlbm84b05Fc2NDc2li?=
 =?utf-8?B?c0hGZVJWQUNVRWtuK01KL2ljNGxWZzdmLytsOHM2bUZzTThuMW1hRGVsanNZ?=
 =?utf-8?B?TXp2cmVwL1E5cjk0RFJYNmh5OW93NmxPdzRmRUU3WkRTUTZ0RFB0QWJraEVT?=
 =?utf-8?B?aUx5OURRRmR0SzAvTVFiOTlhNzhObWhtNWFaZmhmTWpxVEU1c2ZVdEZNQWJ4?=
 =?utf-8?B?MWxmSmI2c29TSnRyNzFLRU8xVmsxc1VzYnZoNkF5cDVqZE9VbG4yM2N1K2du?=
 =?utf-8?B?ZDd3OThRczloSGFrR1VHazdIZ2JFM3JCYW5jNjJvVkZ2STh5Q1JCdnc0cU0x?=
 =?utf-8?B?VzRxVVZHOEMxQVpYN2orQy9GZXBYdWlzTGMwOXNrZWN3NnV0MkJ0bFZXdm9I?=
 =?utf-8?B?UjJBTGY4QWdGOEVJeUlGcWFzT2FidU94VDNLUW5PaG9KaDNSUEdiczR6N2V6?=
 =?utf-8?B?dFlEWVQxVVNzSnBVVHh5R0FlYVZyejRwRTU3dGtTRVovQlZib3NmVHJTSWNF?=
 =?utf-8?B?QmZJblQzZ29MWjQ1L25zdWo0djA5d3IvL0FDTjdLeW1lSDhkcitlUzllZmNE?=
 =?utf-8?B?RlRqV28zbUYwZTlGUTVxbzh3WGRRUTFmSVR5UXVudExTT2pEWnUxbmw5NVlP?=
 =?utf-8?B?eDZqOUhuWjI1dkdWaHBsTCs1N044UnU5QnpJbU9zN2d0WFpvZVZWdG94eiti?=
 =?utf-8?B?RHJTSjllVjBhTFVHQ25NenpRc1lVUVgvQlhzZGwrL2dlTWRSTmhJVlIrZmdk?=
 =?utf-8?B?WXF3T3JtZmh6QW5mL1RSMDZFcTYzV0w3a0tmVjJCbVN2ajIyaFU3TWJvdnNL?=
 =?utf-8?B?dDlNWGxXcVA2REpxT1RibXlxMG5QbTlXU3pRU0tLZ1ZzWit4ZVQ5RTJQV2pn?=
 =?utf-8?B?TVlJK09Eam9yNkdiNDg4T3YxMUZZRndJa1YrZjBPdmtJTi9YKzJOUkVOVFdW?=
 =?utf-8?B?Qmx0aFRJQWkwY0RRYmpMRk5LRjkwV3ZScDAvM0J2NWtnRXRuUXVWQkhpZnZW?=
 =?utf-8?B?ZHZydi9MY0paRUdiMkV5a0xsaVF4UW5GU0h4SlNyMjNyb2dTajFvVmExTTBi?=
 =?utf-8?B?UVE5cVVaSUJDYTJlUkI2RW5PRzZZbEozM09SMldNVElEcVBnMXhRQmVhVDlF?=
 =?utf-8?B?TjFLUHl1WkNIb1QwSVNNVWNXem5ZdC9nTXRZTnV0SGI5STkyTHpCRkZVMktY?=
 =?utf-8?B?WG1yaW1CaU9MTUNOa3VmL0JqZjlUOFltVm50VGxsQjdkcXR3VmFzZktwV2pT?=
 =?utf-8?B?V3JHVUNRL2dCRUFqdy9lbFZYemk2UmtXb2s3NWZobHFYeFJkWDQzM0JIL3hX?=
 =?utf-8?B?QkpGcGNTblBMYkxxMkdOTFY5aXYwR3g5MTBzcnc4ZUF5R0ZjUWJlTGE3N0pv?=
 =?utf-8?B?NVh2ZEJRY3ZXdzltTCtsR21KRG5EN1RZazg3dzhFSUhSSTEvMytENk54cmdo?=
 =?utf-8?B?UHZXYWU3UWNwZ3grTjhONHJVZ0RDTkI2cXliY3pGZTZPY3pjZWZmcnN6bkZm?=
 =?utf-8?B?TDRYRklvOVFSRnRGZEpiaUovc0VYeUxGdnFMZTRmdnhsODJ4ckNMelJGOW1O?=
 =?utf-8?B?aE9oS3hqR0NhVm9EUzdWYW1POVlUdjNaazRXd3ZzS1NGQ2VsM3ZzUVZ2UTFv?=
 =?utf-8?B?R005Qzd1Qkd4OTBzTk9BbDJnSlppZ0xyYU4xK0JxYWhQbk1RZGZqS0kyS25W?=
 =?utf-8?Q?V3ULWXJiUdWp3G90VhfMv2tmD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b54bce-d87a-4629-92f0-08ddbee8a7f1
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 13:01:02.0828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 859TOTLA28EEwGsC0j4ODd3GQSXQ2uO4Kv8i5fVk3y3Vyww6hr1MKA2E1Db87oSoEHwUAGE76ytgSHNIgTdMDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6865
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


W dniu 08.07.2025 o 17:28, Kamil Konieczny pisze:
> Add 'i915.' prefix to i915 testlists.
>
> v4: use 'i915.' prefix for all, fast-feedback and
>    chamelium-only (Swati)
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards

Andrzej



> ---
>   tests/intel-ci/README                                       | 6 +++---
>   ...chamelium-only.testlist => i915.chamelium-only.testlist} | 0
>   ....testlist => i915.fast-feedback-chamelium-only.testlist} | 0
>   .../{fast-feedback.testlist => i915.fast-feedback.testlist} | 0
>   tests/intel-ci/meson.build                                  | 6 +++---
>   tests/intel/i915_test_config.json                           | 2 +-
>   tests/intel/kms_test_config.json                            | 6 +++---
>   7 files changed, 10 insertions(+), 10 deletions(-)
>   rename tests/intel-ci/{chamelium-only.testlist => i915.chamelium-only.testlist} (100%)
>   rename tests/intel-ci/{fast-feedback-chamelium-only.testlist => i915.fast-feedback-chamelium-only.testlist} (100%)
>   rename tests/intel-ci/{fast-feedback.testlist => i915.fast-feedback.testlist} (100%)
>
> diff --git a/tests/intel-ci/README b/tests/intel-ci/README
> index 5ef2ee2d1..102cdb1fa 100644
> --- a/tests/intel-ci/README
> +++ b/tests/intel-ci/README
> @@ -17,9 +17,9 @@ Changing the test lists should only happen with approval from the CI
>   people. If you make a new test that should be tested by CI regularly,
>   ask a maintainer (see MAINTAINERS).
>   
> -======================
> -fast-feedback.testlist
> -======================
> +===========================
> +i915.fast-feedback.testlist
> +===========================
>   
>   Fast-feedback contains tests that roughly tests a wide coverage of
>   features in a short time. If the tests in fast-feedback report no
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> similarity index 100%
> rename from tests/intel-ci/chamelium-only.testlist
> rename to tests/intel-ci/i915.chamelium-only.testlist
> diff --git a/tests/intel-ci/fast-feedback-chamelium-only.testlist b/tests/intel-ci/i915.fast-feedback-chamelium-only.testlist
> similarity index 100%
> rename from tests/intel-ci/fast-feedback-chamelium-only.testlist
> rename to tests/intel-ci/i915.fast-feedback-chamelium-only.testlist
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/i915.fast-feedback.testlist
> similarity index 100%
> rename from tests/intel-ci/fast-feedback.testlist
> rename to tests/intel-ci/i915.fast-feedback.testlist
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index d18170402..3d436dc08 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -4,9 +4,9 @@ intelci_files = [
>     'README',
>     'i915.blocklist.txt',
>     'i915.blocklist-pre-merge.txt',
> -  'chamelium-only.testlist',
> -  'fast-feedback.testlist',
> -  'fast-feedback-chamelium-only.testlist',
> +  'i915.chamelium-only.testlist',
> +  'i915.fast-feedback.testlist',
> +  'i915.fast-feedback-chamelium-only.testlist',
>     'meta.testlist',
>     'xe.blocklist.txt',
>     'xe.bmg.core.blocklist.txt',
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index da871f493..7cfcad532 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json
> @@ -25,7 +25,7 @@
>                       "exclude-type": "regex-ignorecase",
>                       "append-value-if-not-excluded": "i915 FULL",
>                       "include": [
> -                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
> +                        { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" }
>                       ],
>                       "exclude": [
>                           { "all": "../intel-ci/i915.blocklist.txt" }
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index fc8766279..362298e0d 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -13,9 +13,9 @@
>                       "append-value-if-not-excluded": "Xe FULL, i915 FULL",
>                       "exclude-type": "regex-ignorecase",
>                       "include": [
> -                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
> -                        { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
> -                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
> +                        { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
> +                        { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
> +                        { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
>   
>                           { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
>                           { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
