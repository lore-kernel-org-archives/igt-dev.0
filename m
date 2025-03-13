Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A880CC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 06:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AD810E02B;
	Thu, 13 Mar 2025 06:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOkEBJFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A3710E02B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 06:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741847044; x=1773383044;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Cv1+QUC8Xl57eHG6rV9ITRwCdukW86wzhaSfw0RmnE8=;
 b=iOkEBJFYmG8LJcQPWNHnHQl8JghM4wnIEdhvvrdwjky9DNWhHV9A2V7K
 QZZLQJ8Vz5XW+5WJwP6ViY/NGVdqwIGkCm2TRqXAxCq6FJq47M3qYvPw4
 8PrHuaz1N4qagQVYpO3QvU4YHoT3oJ9eS74TlWOQ0+pWIS+GhUPXD9Gku
 akgjHcUcJo48gWondKnzL3PsjuTRdGTd+HZyJ4NsgMFnV4zjUppc7d7An
 OPJyatC1ZiYcPzvANY/f2RKkpjX2lWWpuXpuZKxJT5CuczLXPtdCxw7zG
 OZM/Q2SpukPnoQjV68wJgN7X85VS/4Uov/ABYrAodmzxmvbvqgk9WFB91 g==;
X-CSE-ConnectionGUID: th0UGlB/RZu6jvrWNPxFEw==
X-CSE-MsgGUID: sUtqytvVTcSCcXSirN39Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="60490931"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="60490931"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:23:47 -0700
X-CSE-ConnectionGUID: Ung4wrx0T+OWHfnYg+wcBA==
X-CSE-MsgGUID: qD0CNEceSjiIPR4qX7KsBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="151817252"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2025 23:23:47 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Mar 2025 23:23:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Mar 2025 23:23:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 23:23:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCg7i1no3I0fI5ix/iNghalQcqpHjxFJcawU2WM4GFnmRN28/jgZo9cb1Q2FDQV0RerqiKIIBgdpjCVQvS9VwQcoSuVE1b1jAZS5BXmwg6b5Ev+ZhbYxIgA7WqkIq22LWTW4qr0GhdgQeRa/MOGbZ3JeAgxBSF9h2PM00dUpNS/h2Te/NZ6zATlROLldewMOrx/RMmwKjWDjSkdmAn4juxRgYWori0V+osKjf5PUFzAYX0fEyRabB8cDU9Lq68FfNhrbVqbDIBvgFGo/KtxgaRyXM8DePkSehg47Stf5vBYK6nrFJwImoX8CrX9gaFElBgZjqY4AAMwOj0mDZzr8Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=668H+K5oWZ76A4dyFyIS7Vbf1NvZvM8YD5BVOFCkivc=;
 b=nhe7cpAATCoPzvwenYWuvZ4TaQ9TiWbzIJVkoRcIgUGywmiErvOmk6XpL6cvOTHxIipXov7bpipIiP9TmLhJsJH2Nsa5H8SorSpKIUj7z85G5KZDhpNb2L3JlJk72B9sOGrgUwDFnblzMLHYE9i9K0yEEg7+GsHNloQJ9Ki49pdRMtGKsPFcW5IZEJ6FKxT6C/N1P+yxZHFreBpioshiOFS/VEMCe1OVnsBdkYUjds9rUcWgl9M/wgIOAZHY3rJypqUHo5Wi2dmovCEMmXj5vAigSfDIFi5P9114jyZnUKT9jb5PPMOtOPQyPYeoi2aQp3L717ra1vh733LGUraQkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by SJ2PR11MB7574.namprd11.prod.outlook.com (2603:10b6:a03:4ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 06:23:42 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%4]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 06:23:42 +0000
Message-ID: <96d7165c-e0ba-4b51-9151-10a4339ea273@intel.com>
Date: Thu, 13 Mar 2025 11:53:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_pm_dc: Add skip logic and
 logging for DC5 psr test
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250226065202.84015-1-mohammed.thasleem@intel.com>
 <20250309100649.26528-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250309100649.26528-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|SJ2PR11MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa77e4f-8b3e-4b00-7b08-08dd61f799e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmwvYVhKUm9vT09pK001cklzVlhSdWV6WnVaVkdVcE9rZ2VFVVR0YVp3MWNp?=
 =?utf-8?B?SzQvRHJZNXlWcWtSNnU3N1pwdm1jZVVObTVzbVBONXRQby82cmt5WTNDOVZE?=
 =?utf-8?B?a2RYdWNjanREdCtwMFJvK0NwblBRemNkUmJEcXdQOHp1TEFvM3NDUVR3T3NN?=
 =?utf-8?B?VmoydGpWalkxMTQ0aVpuSXhmajJrUEZ3djR0Yyt3L3lNU3lFYjVJcmJxekM3?=
 =?utf-8?B?TDBzazB2bmtQK3IrdisxWlZNbC9HMEZBdVNDbDBDNW5jUUNiRENwcEtpOXJB?=
 =?utf-8?B?V0p2SUl6QTdoL2NGWjZ0TGw4Q3pBSU0zL0hIZWRmbEFVYndzYXdXaS80VkRn?=
 =?utf-8?B?eVpMZWZxemFjWDM4ZFIwY2ZJUXFRdHBJc1ZDVVhrcmlMM3I0a1VGcDB3OEdy?=
 =?utf-8?B?VU9lUHJmYUp4YTE3d2hoTW5oNG12eW1wbk1lRnVqQzkrUy8zN2MwcUVnTHBY?=
 =?utf-8?B?dXhMTFJoWjN4ak53SGJPT002d2pXMnFuYlhodWw4eHZJTDJ5ek45YVpCSjI2?=
 =?utf-8?B?VFZlWS9IcXFiTmhsY21YMVdDWENNTXFqS243aFVPa3hrVzJJaTFjTzZ5cWtD?=
 =?utf-8?B?MlFIdjJ3VHV6YzZYZkoyNWFROVBEUVhZeXVrTjVESURuMW1LUWJvWmtBK1Fv?=
 =?utf-8?B?ZTVqZVI1OEs2bElGUnFwOHBZbUh6blUzWDlSendzR3VKMlNPQUxKOE9GTVN3?=
 =?utf-8?B?Tk1lVUcrZUt4Zk1BazNFTHdxTWJCRWtLMTRxSmhiSkJadDR5THBqR1I4bGRo?=
 =?utf-8?B?THJ4RGRwaU1ZS2d2bEw5bHNBdEF0M2tETHNkN3NOZ1hoQ3BsT1FHcjZJOTNq?=
 =?utf-8?B?TGkvdEhwOHFjaU5GQ1I5Wk9VWVZ6OUZBb1VieXFjSTlCdnR0T0VyY2lpaXBx?=
 =?utf-8?B?QnBQam9uWUdaTW9VdTI0R0ZyRFRGc1VPRVFHd3hhSTlhNWQ5eW5wREkyY2Iv?=
 =?utf-8?B?VkxqQnhPWFBCenR6RFZ2aHVmajRoc2V3b1d1RWQvM1N3SEdWUGFBY1Y1by8v?=
 =?utf-8?B?aFpaZDVZQVV3UWRrdDRJODgwNmFKSFQxQjFNWGd2cGk2SjQxT0RpRi91U3h1?=
 =?utf-8?B?T0hVd1Ruc2NHTllvQW5Bb3BWS0traTJZejVLMjRmRzNWRTFpc0NZL1pVUEVG?=
 =?utf-8?B?Smd4OHhtZFVNbjR3emw3eUs2QncrTUJhL09zTlQrZ1grTURneHB3eDJtWWZQ?=
 =?utf-8?B?d1ZSS1JrZnFVdnprN1lUYTdDaERTTGF3Z3BiMkJZM0M5aVdqc0l5L3RBTGRL?=
 =?utf-8?B?WndsK3ZLQURySlkxQTZrcXFrWmRuaFFzUko5TWpHaVVrL3hOMWRkUG5qZE1F?=
 =?utf-8?B?dVozcGcxVGlSRkRlNER3MldkS1BUdXdPeUgyUUZNSFFNMkR3VlYzaGVqL0da?=
 =?utf-8?B?R3F5QW1JclBPRnErL0JiY3hQQ3cxSE1YelhXTFpIUUl4U2JOenVMNFJEczU5?=
 =?utf-8?B?MUdxZ0U1ek1URTIvbnVuQWFHYkJoS1VQd1o2b2V6MWlpekNmWTladFhQZDlq?=
 =?utf-8?B?T0NSOXhkb3Y3WUtndzluMHQ3TEZNWDVSR2JucVJ5QVFKWktLM2Z3bDFBU0JW?=
 =?utf-8?B?ZzBZcHJYMG5LNXlBbnREOTg0UTUwMlQzcFFFL0JsTVRhaVo2TTFQcmlWd2R4?=
 =?utf-8?B?RkRZMC9ieURPcTV3UE9NUlh2UDhZSm53OXdUVmVpd0xYNG9CQ2xONzZvdjNh?=
 =?utf-8?B?d0N3Y3ZRV0FEdkV4UmxaZnJjV044OFFsMG5BOWtIcUs3cW8rdVNJK1dEYjJW?=
 =?utf-8?B?ZXdHeWN4bEhUcFNrZlQ4TmhqOEdhZUtQOW5PTFRud0N6N3dMcHNubk5HNTUy?=
 =?utf-8?B?Vk9kR28xSjgvTmlOa0RUYjZkby9nQVJQd1dnQ3M2RGJTK01jQWZ2YkxPNEVw?=
 =?utf-8?Q?u/0UHneqKmlE2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2xFRWUxaFg1K3ltUUxZYTBjU3QwNTAyZ0tHOHVOeWdkbDRNZ1lzcEpIdUYr?=
 =?utf-8?B?VGRTK00ybjRpMjlJTVBoZC9mOHE2eUxiQWFHZ3dOcFJzaW9UWGtFNVpSejNI?=
 =?utf-8?B?enlwcXAzUHRmTDZoeHZFN2EzQ29jVHRSM3JDK1ZwT3Y0MnBsVStMaFdEdzFs?=
 =?utf-8?B?bHRHeGpUek9OZVFKdTZIQmxMUmtQbUhreDFSaTJCL3ZGVWJmRHZHTUNIdC9z?=
 =?utf-8?B?dkNucVJxSE9VS0hLQkpjVDU5aklvL09QcXdhWW92MmpKd2NvU2xtSENFNzl5?=
 =?utf-8?B?bnZnZmgyZ21HRWZMd0NHNFdjWDIrNUY4aUJ2MkZ2U1dQSFR4Mkw2bWR4d3lO?=
 =?utf-8?B?Q2tGVDJkNTNua1NScFdJV3dhTHJtOHJENm95am9IRGpscVN5dkpPL3VIc1U0?=
 =?utf-8?B?T21UYU0zcXBRTURWdUx5dHAxQ0FpaFlVNWoxVnpYWWVxRU9pTXQ2aEYydWhZ?=
 =?utf-8?B?NWRZVThQMHJIWFl3K3ZCNHRvM3EvSXNyWm1CWFRxNHhOdi9HN0FaV2tnSGMz?=
 =?utf-8?B?Mk43NEJNaE4zZ2NiYmZnZ04ySlVzQ0V6WWFTYm0xWDhQUmdZbkhtamRKL0NT?=
 =?utf-8?B?L0E0bitIQ0NnNm5seW54WmUxTDJhV1JrZU50ekVtazRkMmVTSmFvRUJuUjZD?=
 =?utf-8?B?VFpyOVVCb1FCR1BBekZtRE9OUFlROUk3TzFSVlpndDNJUzh2dWNIa2ZIa1RF?=
 =?utf-8?B?Wm5hb1U5NUJvOVVLMFE4NmlhUmJKTHA5cEVmOVhMMFZGbnI1dDdEM2NETlMx?=
 =?utf-8?B?SHBLYzUydnlsbnFCOFJPM1RLcTF1V0JzNmh1aHpQQ1RJbXB1K3YvMTR4Tlha?=
 =?utf-8?B?NllxS1ZLR3JqRW14dlV1a0dmTTJMZGRzaTVVYlhWVUdaaTROcWtZQVpPNS9w?=
 =?utf-8?B?SWlrbjJReXFVOXVKUHNzQ09zQWlaMnB4OW1Gdm52WlFHYkY3TzhQRUM5SS9S?=
 =?utf-8?B?SjJZcU0vWHo1WWl6TzdDVDNHd1BWWjNMeDBSTTlBKzhpeVdpd2RxeWljb0I5?=
 =?utf-8?B?OFpKOVJJSDZtaml1VXAzRVRXWmEvbitYUWJnMlZhQVdkUGdFa0VUeG16alFs?=
 =?utf-8?B?VVdnU0VaM1owaDBYUngwVHlXS2trWHFicmJVUXlJTVFJeVY0Wk1ZdGpoV2hL?=
 =?utf-8?B?MzhkT0x4dytTaGk3YmxXVU9SZjViOHRzZGk1SHNCUXBXVkNscWFJa2JmMkNv?=
 =?utf-8?B?cVliOTBaV0R0dm1zZlBXQUNDb3R5dC9tVDdVQkVYQjNsN3EyczBMemFnQjJk?=
 =?utf-8?B?dUdGdWJ0WFVGN0VLMWNvM25GdGpGakJ4bVhaZEUxdXFjaUQvdFRxVHc4TWZT?=
 =?utf-8?B?RGg1bzJkMXZnZGFCV1pERWdUeGdXaUZvM3RwNm1KU1R3QWlaWnFVSndxekFu?=
 =?utf-8?B?b01oTHo2amVQSEFSL2NNdSs1SEF4bjBKcTNZb0hITUJHZE0yTkpNWExCaVJr?=
 =?utf-8?B?cHFhZDBlMHZEZXhpRkl4WWdZMVNUYnRKbkRNa05WM3VjOUk0dXJlSjlIOEsr?=
 =?utf-8?B?d3FRcFo0TElWNHVrckFzY3JVL3hBbE8wdVQzVVI3RFAvRFk4aVM3TGVxWDZG?=
 =?utf-8?B?Z1p6VzRId3lqYW0yVmw3S0s3YXpnUlk2Q1BhRlBQa1RZWkdqMUpTb0hnTW0r?=
 =?utf-8?B?THlscEplNVRPSWJHUk83NFczc0JmVFN3WlFyU2I4d01HbEFTZFlNdTB1akhm?=
 =?utf-8?B?Um5iVnk0ckpkRDVPc1NGU2ZYdi90U0RVcEdzUTRuMlBDWXkzTFRqWGhjcVpy?=
 =?utf-8?B?L0Z0aG56dEZmbGlNT0R6YmRtK2NYTSt6TXhRSVVIRU1acTBNbEoyMy9nYzZo?=
 =?utf-8?B?Q0d4dEhQeUpBaXdBZnY0SnhnOWhheFlVZjBQRHJpdUxjVG1rYUYzNnloS0xa?=
 =?utf-8?B?MDRQTU41T0ZXTDFTN0lYaGM4L0lQaVJVVHFwa3VNZTFtRExVelJDUENSSnRr?=
 =?utf-8?B?TElQeVZJM0dHTmhyRDBlaU5aUyt1TTNkTTJGOGNVazQ5V3Q5a0h5eE9HZ3Rz?=
 =?utf-8?B?bE42QTVYVXJtazJpRThUSEhRT1BIbmFWbHlMUWdiK2xBVVg4cEI0UzF3UENU?=
 =?utf-8?B?bENPTWI2bzRrcFlJQ3h0cTdROXhHS2NFTnRTM0d3dDhVWDc2T1V3S2tKRDJh?=
 =?utf-8?B?Ry9Gc1FYbmkrb0FRNmh1VmhBRDFDSXNTRjhiU0pBV09RRkNkYWNwYUNDaWQy?=
 =?utf-8?Q?wuF1NYehJ7TWg7AcXmnxBwE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa77e4f-8b3e-4b00-7b08-08dd61f799e4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 06:23:42.6788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NreF17J0+BENc0VdII/qf5fe4pow1ZdivEo8hPDBUBOL0xbZB7T/l8JgrK2GigvzYv9o7cMjoAXxZ0+h2Blo+F0MFjkD1l6lCI/hIXF4gHl+g6yz5q4IsM/BFDPVfA3R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7574
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

Hi Thasleem,

On 09-03-2025 15:36, Mohammed Thasleem wrote:
> Low power Pipe A is required to run the DC5 transaction for Gen12.
> For Gen12+ to Xe3, either Pipe A or Pipe B is needed for the DC5
> transaction using a low power pipe. Added skip logic and logging
> to enforce these requirements.
> 
> v2: Updated subject title and discription.
>      Add Gen checks for low power pipe selection. (Santosh)
> 

> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   tests/intel/kms_pm_dc.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index bbb29d7d9..c7fde2af7 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -156,10 +156,15 @@ static void setup_output(data_t *data)
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
>   	enum pipe pipe;
> +	int disp_ver = intel_display_ver(data->devid);
>   
>   	for_each_pipe_with_valid_output(display, pipe, output) {
>   		drmModeConnectorPtr c = output->config.connector;
>   
> +		igt_skip_on_f((disp_ver <= 12 && pipe != PIPE_A) ||
> +			      (disp_ver <= 30 && !(pipe == PIPE_B || pipe == PIPE_A)),
> +			       "Low power pipe was not selected for the DC5 transaction.\n");
> +
>   		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
>   			continue;
>   

