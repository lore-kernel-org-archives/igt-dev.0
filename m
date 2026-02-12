Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EF7EEA84E
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 20:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC0710E2AA;
	Thu, 12 Feb 2026 20:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="He42Cact";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F3710E2AA
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 20:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770928653; x=1802464653;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vgGCwYTe8n/p/IKNbuA23uK62ii4hcH2Ijt/NGPkNrA=;
 b=He42CactmlXbTHrh02kBDwxVya6fF5j8hQLicBw30QNAG+x3CaCpCHZo
 nJv0dqdOTNlCi3Ug2VBLvtHqYSK5Ed5K3vSNSYMpSnRA2qyJBYUQJwcpO
 VS73DhG9aTTvZmikbMjs63pHCczhOWqG36EHZtg/bv9kU/lW+CWIa1u4U
 /UuH6AOi2zMV1PuwZiuDcqkO00dmMSNFBSmKLhOjnx+gcD88T7W69W0Kt
 YDdkjuR57OG5bjnKjGh5klWwegwHJ5vM5Y5kXCNPNK453NTobcL1QjGFX
 gIw9jln5cFkRwYR2KjIJsx1pUMftpNG5482ApWPVkNqQg9E3rFRkI1wAs w==;
X-CSE-ConnectionGUID: Uy2Eq0t4TSq7VXgy/9ZfuA==
X-CSE-MsgGUID: J2SUG2BTQjaQiV8NpoG1ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72101168"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72101168"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 12:37:32 -0800
X-CSE-ConnectionGUID: 04PYWsQJQfqbN4RI45HSQQ==
X-CSE-MsgGUID: DgYmXyphSduzkIzAXRVyLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="242238672"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 12:37:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 12:37:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 12:37:30 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 12:37:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4tsBCYASvy3JGgybnA1IdAW6+8CuOy5joDYw2cD1LEEdHfb3eP0Xg3CqDqQEHs+70G1RppBkWA1Ca5D98Os3cPe4I+MLK7WcWqtgwM3gTQ/kEOfKrjOLiKF+ap7V9syz1bwR7rW1hcgKKIImA7Qr0+1CpHuWrzJ7nccA1lQigjzlVOL5pTBn0Nrlh04JgBa+/yu4NKJR9rkiWw7OA1koxpR++yHr4c/kYFw7kcn27aiX3QEZ7NR75OHQkuGRlzi8YyGDUUGxIe5VxXD58eGRu4xjcKkbP/hMfOJ3bw6UEMLlwwN2cM+T3u6JpvfTAaChJpLF3u29fUX5FXZa0VMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/PzKVUu3QwbG+VDrZsz3gTyOYvZI3mJyAzgc6xQe4Y=;
 b=Prg0JftGYyq9PoqiIjhENHIj6fv04GJ8NI1Bms3xXTRdW9X2MzROoFd3hp/GZglrVG3EC3SJpMMgtnXfVO8t0c07SW6koQhQPSbPiG3d2RaKyeb5jJqTS3LOzAONFpy8wCheUPYiHYdfr2I2uXWhn1ghE1mIdUfn1nEE5hWAUy9yxly/2G95mHD8MBsQIfgyihxxynqR/6CJ/KDfMrjn5/1IKq/1T9Pi6kXm6bDFYIuxhZJxW9KCm7EI35R/KP0pa/WmdRqYghlKyCvvAhfx+SDl6vv/sNN+l4RzYTc5GCy1GM7hddi5vxVJxx78hVJQktOVwkACwqyJUxSufUUrmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 20:37:28 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 20:37:28 +0000
Message-ID: <1adaa7f2-16b4-41cc-bb8f-6ff6eddbc430@intel.com>
Date: Fri, 13 Feb 2026 02:07:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] tests/kms_color_pipeline: use atomic commit
 helper consistently
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <pranay.samala@intel.com>
References: <20260202060415.2680288-1-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260202060415.2680288-1-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0231.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::7) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b86c9d9-8b3e-4348-b898-08de6a768974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGRNYjVIdVVhcHBYUm1BLzFrRHpoSWFIS0J3aVcwa01IUzZGaGNjRWpBRnh3?=
 =?utf-8?B?S0ZXb3FtMm5OQXdPV1M4ZkRXclMzTXhSM1FyRkg0ZGNJbldZZlZ2YllhWllz?=
 =?utf-8?B?aCt6YjdYOUhpdEtHS28yVXU0UjlhejBWdy92TXQ2QVd1QkxTU09hWC9IMWMr?=
 =?utf-8?B?a0loeWUvdjdhOW0vRmxDTklGSmdINER3WUdHRjV0ajltOWZ2djJRZmNmajBy?=
 =?utf-8?B?Z3pEbUZBUU9PWWoyb0lKZG52Sm1PcVdKemUvNXlQeGhsUHZISkJwelJzTDFl?=
 =?utf-8?B?b3NmR3dneEE4SnFPSWZaQWJXaUl0TUNIM284ME53cnBHTGNxd2poVE81Mnpo?=
 =?utf-8?B?aThqek9HaVE4WlUybGwzakVZbmI4bEs3amtHdXNTcEF4ZXhiSmVmR2M5NlFa?=
 =?utf-8?B?NEQwYUd3Z2w0S0Rrbld5a1lCbkVYd2cvTzhQVjdMampYSUZVQmxha3pjYXZP?=
 =?utf-8?B?OXI0aVRpWWN1TGdUcWRMTXZsbzB3OVdVdEFGZzIxQ1QvU1lJTHZaN3VNVHZF?=
 =?utf-8?B?NWpDVlpicjd0czlEb2MyK3VxWTNjQmdlT292WWdFY1plVXQ1L1lDT3B0VFBv?=
 =?utf-8?B?ZEZGek1jZHN5d21mRW8rOGN1V1NZaGZnU09nUzREM21wQnZGbWgxRmJpMlhk?=
 =?utf-8?B?M0prTC9pZ1ZZQkpxb2V0TEU5c3BZZHEyaHlYZTZzRzNicEtxUVlUNm9LRHF5?=
 =?utf-8?B?a0RjVDdyaFg0SGFldU1NblhZeldpOGl3Q1VnZERWR3dha09pbFpsSHB5L0VG?=
 =?utf-8?B?YlZPTWJXc0JIZ0JLUnlaSzdOUkhlaVg4dXI5dDNNOGFxaUUwV3ovS2VpWU9o?=
 =?utf-8?B?bkxFdTRmbUFGOW1Ka09nMStueE5BV0xxSXVlMjJ3d3R1VFhPZ0VsTnRHMWRv?=
 =?utf-8?B?bngxemlvc3I5WDU5Sk96elBEelBFMytwTDcxWmdZNE1RUVJvU1JxRWREN3d5?=
 =?utf-8?B?dnVPbFcxRzFKWitkajE0dUVzNnM0a3R5NzArcjFwQ2pIRzV4dWNWcFM0bnE2?=
 =?utf-8?B?K2Q4ZW9pZVRuRC9lWkxHZkpGL1ZWYmFaV2RIbzJVdGxTbG91eTRuQ3RwZjFu?=
 =?utf-8?B?Y3lKR21MNFNhWWJXOUhINWpKcGtYWndjWml4aFRKMy9VNVREWFI3bWNSZ3Mz?=
 =?utf-8?B?ZjIvdmhIb05OSE8zcDZVR3pybXVaUXVnRDVjRCtySlRTNUJlT1dkNllkMG5H?=
 =?utf-8?B?eWh6Qm9OTFBPNG1pdXJ2ZXlkUUxzZGxqQ2tJTU1Qbmo5TTdZSjZZT1hqaGd3?=
 =?utf-8?B?eE5jRGx2UGxMek80bVh5MFh6a1JxclZsL1UrVTQrdWJMNkdUbWdDdCtpVW9I?=
 =?utf-8?B?L0szczhoV2VxVHh5c1g3TXc0azlTTEdqMENmN3cyVTV1VVlBZjVDT2huM2lo?=
 =?utf-8?B?ZEJXajJETkF6ZTVlSVJaaWNHem15allRbXB2bkRYWjZ0MEFRbnduMFU3QVRS?=
 =?utf-8?B?dVd6eVczZXJ6Zm11MENEem9tS2NHNi9VR1NKOGlHYVp1cU8rRSsvcEFTdnpa?=
 =?utf-8?B?aHV0SG5oY2orajhEYTlHSmdJa2RYTlVReEJMMi9QM1lWK0Q2MDArcWhmR2Rk?=
 =?utf-8?B?dGkrK05uaHBGeUpjMzlRR0lzMGh2SkppSnQ3MG5hOFBEZ1Vqbm01aFVBQnI3?=
 =?utf-8?B?WG91UGZhZ1dFWktBcGEyQWVhU09odm1lMEFKa1Q2OHE3dHBsODV4T0tPaE1J?=
 =?utf-8?B?Nm9Cd05FeFVsZVVZQXhNbytFTWlENUdTdFZTOVQ5bXRBZ2tPbjhFRDhtOXNp?=
 =?utf-8?B?dzk2VGdyWW9OaXpSVldSYXBBcEd3OHE4dWlZN01FTzlsSlhJQmVKNUtETzJE?=
 =?utf-8?B?WnN5UENEUlN6MHJBejBRUXVld2JGd3laejRTb0pWaDlUaDZIUnR3WTNoT0pQ?=
 =?utf-8?B?QUl1Uzg3bFNNSkxIWTRpbmxZUjZWQ09FL3N3NnV6T2E4NkZvdXFWcUVpa0RK?=
 =?utf-8?B?UXYzNnExU2VmMGFFYmhIbkt3TnkyKzJCeGRCMjA1bTRrT3ZZY1pVcys2ZWxy?=
 =?utf-8?B?dkhUdTNhSTE5bXRPTW85U3lMR1dxMGhHQ0t6NVpMQ0hTRTY2T0x0VUZWaDB6?=
 =?utf-8?B?NzdJVXdUeXJ5UkNZZWk5Uy91M3lsN2d3U1lHK3hWanJwazVGUjdaMU8wUllm?=
 =?utf-8?Q?Rxgk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzEza21wWXJWU0dqdnlBSUZCQXdXWU5TNWswVGN4SGJTL2l3ZnlmS0FPUUEx?=
 =?utf-8?B?Uk1UM01OajRDVlJsQ3BnQ2ltQ3lGdmxmVTZTcFlHa2NQazllZ3k0TEREaEdm?=
 =?utf-8?B?U0lEdG9ydGZveDN5V2g3ajRtdktRUW5Gd1hTQ3lNdGtqR1UyVmJLZUlDd1Zp?=
 =?utf-8?B?SnJvS1NVVHY0MzNydlZSWURYaVFVNFdvOWJMbHp1aDNqbjNwOFc0eFZ0TUU5?=
 =?utf-8?B?R1FacHZFRWtrL1BtdzVrZXMzbFdJNEo5SlpQWnl6eUN5bk1pVUVYRExuOTcv?=
 =?utf-8?B?MTdyT1ViZUQ5aXVpNUo5Vi9YM0VpNFBIeW5ORU9BYXRCSHRYQTNKU2NrSW1P?=
 =?utf-8?B?ZWVCTlVDK2M0M1luZkNneTQ5K0VWRFNEYmYrZ1BBZkdHWDRhYWNYOHBIR2Zq?=
 =?utf-8?B?RVRDUzV2RENqRjRJc2FWQjFrMXV5L1FxSmxpeXZMQUJIeW9TZ1YxV0tLUjc3?=
 =?utf-8?B?bHphMUhmZWg5R0JIVjJjeDBBUHJLOU1tU2hMam1ZOXE0elJ6d3M1WVhkMnpP?=
 =?utf-8?B?KzMvbXp5RFhXYkY2aE1iYkI1d2EyTGk1VlJNVm9vcWYybmhOdGJJWjdtaExa?=
 =?utf-8?B?SzFqM2RkdFU1Z1pMRk9aenFqSGxKQmQ3d1krVk4rc245b0krOGd5dXZsNEg5?=
 =?utf-8?B?NzVrcTQ3ejhVSTdTWjZFSzlWUDlRVUd3SU92bVB6U2svTFNzZEZyb3M0MFNV?=
 =?utf-8?B?dnB1UzBydUdFUjdvQjlidjg4bjN2VUJoTzZITjZwc2VaNUFSWkliUWxoaVYy?=
 =?utf-8?B?c21naTBOb3daQ1VaU0VUZHZBelJPLzZGcTJGU2tET3I4Y05mVE9Od2VmTGlX?=
 =?utf-8?B?MWRBVk1ob0o5Nm1QZHRta2g0RmhiNWREVXBLeENKL1BNZDR6bEhydXp1T3pE?=
 =?utf-8?B?TFJ1di9qeVo5NkdRTGRQbWNHVElJRmppUUkvNm5aVEhxVGpsRjhrR3pwSkZC?=
 =?utf-8?B?T1hYYmxuU1g2OXZpMDZvQjhWRXB3QjkraStocUNMb0d4WVVFQ3RkcjNReWx5?=
 =?utf-8?B?bm1ud2JXM21haW4xaFRZZWVMZldkYWhxcXFRTnkyQ1htNm5EVHdQK2l1Tjlt?=
 =?utf-8?B?Ymt2dzJHWUNldUVONjU0Z1k2eGZiQnhxeVhZWE40Y2JGS2RhcU1RVERkMzM0?=
 =?utf-8?B?YlE3V3hkRjBEeDVYU3YzT0ZiS0JOelV0YmdYb3d2cDJHYmNpOGdHNnA0dnBq?=
 =?utf-8?B?c1JNVEtQRmo1MDE1VDZuc3drdGRpWlpMWFZzT3ArVE45a0ZmOEQwNWpLa2h3?=
 =?utf-8?B?OCtOa2FDZlZrTUFQaGhBRXptc29SRGI2Zkw3aUlBYmswVTJqV0thTUt5dmhQ?=
 =?utf-8?B?cmxPNTZ2R3RMQURqMy80WGIza21VRXZXbjM2TVRxVkQ1ZG1VMjlrYnM5STIx?=
 =?utf-8?B?TlR6QmJvR0tzT0U3bGdzWGNKdDQvS3NvMkdEY0dLdkgwSW5GN0VORTJ3REtN?=
 =?utf-8?B?WTJDc0lUbFp5UmhCck9JME1MNTJhZ3ZDaUpiSEttV25ZVzhwMzFYYW9FYWdT?=
 =?utf-8?B?K1liUnd5c1IrNTFqeFhyTzM2NlpLR21HNkxra3pKOEFTellQNTVnTllEbGQ0?=
 =?utf-8?B?NVlJUVBuZkQ0TUkyYWhQZHk5Vy9PU0tkS2tsVnFEbi9xY2tjTnhmQS9pcmdI?=
 =?utf-8?B?cjIveEp1VENmb3lkQjhhVzA5ZStrMWs5WG1jK01Wdm5aOEU3TjMvdkh0c3VG?=
 =?utf-8?B?alUrU2RuOENYK1p6RHhOSWw3OTBXRjRrQm1IdHZMR2pvMUltMHkwRjV6Umd0?=
 =?utf-8?B?cWpXUFBGYlpha1U4Z3d1WG9nNEh6VmFLY251M3o4K042ZXBQSjRPUjNlUmdx?=
 =?utf-8?B?WDBTWFg5Q29sbUoxWjZja3NURTUzVGpJRmNWWklxWnozV2dVY1F5dFlRRHFX?=
 =?utf-8?B?cEtUN0V4NFVnYi9tVTBlbDFTMkE4YzQ0bmdTK0N6YWt0M3lEdCtUY0hyMDE2?=
 =?utf-8?B?Y2NFNFE3Y1d2WTZicUFvVVhVTmdLd2d0cU44WHNVenJrbkFEMk9JdDJQcU90?=
 =?utf-8?B?dzFrWnFPQy9SREFMbFQ5Mk1QV3FXZWlxMXVJN3J0dWVEOUlHY3o1Umd4ZUZB?=
 =?utf-8?B?YW9yNUdrOWNIOGp5SVUvVkkyYldQSFI2T3lOUnZaWFZJQnh4VzRrdGNkMnNW?=
 =?utf-8?B?Y0JOMlA4OXdvV1B4a3JWbnE2d2FVQklKdW8yTmpDS1N1aTY0cmlPcForYTM4?=
 =?utf-8?B?LzkrL3RyS1RKL1dRWjBqVVpiak4xSzVCWlF3bjhJdTZSMmYvR3RUOUJkTUYz?=
 =?utf-8?B?OVlUNjFXTUhHMVlCTzkzU0NOTU9QODhHMng3UnFGMDFtT2dEckowdlpjVXZ4?=
 =?utf-8?B?Q253WmpEQ2pIYmNCaGxXYURIbkZlT0JZWEYyazZ3c2o4bFlnNnlLQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b86c9d9-8b3e-4348-b898-08de6a768974
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 20:37:28.4698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aodkfw5fEYk+R6fJ/yP0epYI5dpANXdcYDOaS1rUAES7IpceUMzecMaYxguVqcewTCOukLEe+WhzcFU7J2oOgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
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

Hi Chaitanya,

On 02-02-2026 11:34 am, Chaitanya Kumar Borah wrote:
> The color pipeline is an atomic-only feature, so kms_color_pipeline
> should not rely on the legacy-compat commit path.

Here seems to be a typo ^^

With this fixed, overall patch LGTM.

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

> Replace igt_display_commit2(COMMIT_ATOMIC) with
> igt_display_commit_atomic() throughout the test to make the atomic
> requirement explicit and avoid any ambiguity around commit paths.
>
> No functional change intended.
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_color_pipeline.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index bf8c4734b..7c4b89139 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -43,7 +43,7 @@ static void test_cleanup(data_t *data)
>   	}
>   
>   	igt_output_set_crtc(data->output, NULL);
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   }
>   
>   static void test_setup(data_t *data, enum pipe p)
> @@ -65,7 +65,7 @@ static void test_setup(data_t *data, enum pipe p)
>   	data->pipe_crc = igt_crtc_crc_new(data->primary->crtc,
>   					  IGT_PIPE_CRC_SOURCE_AUTO);
>   
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   }
>   
>   static bool ctm_colorop_only(kms_colorop_t *colorops[])
> @@ -112,14 +112,14 @@ static bool test_plane_colorops(data_t *data,
>   	disable_ctm(plane->crtc);
>   	disable_degamma(plane->crtc);
>   	disable_gamma(plane->crtc);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
>   
>   	/* Reference (software-equivalent) CRC */
>   	set_color_pipeline_bypass(plane);
>   	paint_rectangles(data, mode, exp_colors, &fb);
>   
>   	igt_plane_set_fb(plane, &fb);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
>   	igt_wait_for_vblank(plane->crtc);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
>   
> @@ -135,7 +135,7 @@ static bool test_plane_colorops(data_t *data,
>   		paint_gradient_rectangles(data, mode, fb_colors, &fb);
>   
>   	igt_plane_set_fb(plane, &fb);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
>   	igt_wait_for_vblank(plane->crtc);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
>   
> @@ -145,7 +145,7 @@ static bool test_plane_colorops(data_t *data,
>   	set_color_pipeline_bypass(plane);
>   	reset_colorops(colorops);
>   	igt_plane_set_fb(plane, NULL);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
>   
>   	igt_remove_fb(data->drm_fd, &fb);
>   
