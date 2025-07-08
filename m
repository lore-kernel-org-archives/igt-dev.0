Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D68C83F0F
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 08:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8407A10E5C6;
	Tue,  8 Jul 2025 08:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c9hftoxm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6CC10E5DA
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 08:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751963839; x=1783499839;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HLBfmQjRk1G1BisZ1YdDnO4ssgiO/ogdAhgXMIMafNY=;
 b=c9hftoxmCTXYEPBy+lQuIr4c5aNiw2V9nIwsWh8wp96RkZHyvXYiQIyY
 j0d6o+nxEfi/ZVzxcbIArMoT54ZjBrFRH77TPLL/1saYu58gU5ebEfLp3
 3ogYfUKOtbEKdNwOvOWcE6o0G9o9E3wY6hX4TnioMAop1mkKKp4shtcLp
 8uKqiNSo2fthU0Wlhr6/rpN3GBZqv0zqanv7ad0Z4HIvHeTKLVQcvsYUR
 BEkUMCtzLy2raK3PWxi7LE0MyFGpJCLJmvBzJd1tWefukVh9llKALV+T0
 jdibydifQZgAIVPpHjPWfIeI7L4RJaISlCTraqpteZ6NEUfCZtWr5CpnF A==;
X-CSE-ConnectionGUID: azN+wWxgSN2R9ovL+8+1SQ==
X-CSE-MsgGUID: fzAP8dSqTYWlIubVhFJ8YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76742886"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="76742886"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 01:37:18 -0700
X-CSE-ConnectionGUID: SRk8GjkQS8qLzv6o/Jc4VA==
X-CSE-MsgGUID: nHzTNPIETKCLGMNAYFzqbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="160994554"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 01:37:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 01:37:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 01:37:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 01:37:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLhAZsvbWi8Howild+YYLDFp0fywhP1nVwaPZNB0Ypm+j3kYAHIyNx/rYUgg2NyMUwDH1ber7qH+se2yjvLSswtKmY9XPN+6VPUSM5UikUhL4FadZgLfRWgLDteur3lfmXOiPkewjcZNDKABn+fEcDZdS7sAnmXACyttXhB30kTEaIrkB1fvFpNHHsWK5sTH2XVYgTUuT3R6oyBMiv8Tbd38s7lvH3xKryzPeeETOG/swEYKnCbsexWYCu7ZD2gkwLdOWxmxoSVmn2Jq3JCc/oaq7IGC9gjpF6JI7o07OoqNbPlDT2u3tUKx51ZBI/Xvb5dy3i6XFXbUI/YDNUjX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mbR2eV4DNnJjF7rx9fpOuT+Ptsyag+hxiEneeDBo4Q=;
 b=k/Xaba00CtxFxI1vgt1AyAFAwtZN1F7/MaXBzg5UM1qwDKCIW6XQQiQs7K1AHoMuDU7LfnZcBnBQdlb5OPaafoWigOeY62OqQ+7Dq1mHFajRvfWsMd5cE3JyHYJm4T78O5EfU0gfBH5+Mi6tTKl4C3uQWIiQFh4tSBt4vazJA3FzR6hjUpwTJhxHgvpz5kiZF07Zrgm7W9t6hDnuFfOxOjs+iJ7oNoy+UaxmvZ5LevyzrzHIVqpUF85Kzh5QRtUaljlzOE3XL6UXkorBa9Cau/qU0b5NkLLgqvr8RKdwJSXSYHclOSl0Gtoxbg4NxY8WJayNpFBkCLHOLaNE9haypQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 08:37:12 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 08:37:12 +0000
Message-ID: <f339fbfd-98a5-4091-9c94-d1de2081011a@intel.com>
Date: Tue, 8 Jul 2025 14:07:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_bw: Restrict linear-tiling subtest to
 HDMI outputs and improve skip logic
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
References: <20250708040425.950013-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250708040425.950013-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA3PR11MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c57e4ec-61d8-4467-4c79-08ddbdfaa23e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnVGVWE3L3YxWWg2amh3ekJTUzIwclV5YndhSWRxU25VYjNVTENqazhyalVK?=
 =?utf-8?B?YWZ3M04rbndjRVZjMUxtc3MwdjJoRERsWnVaWjBNbFR6ZUdVWE9QaTNTT3RI?=
 =?utf-8?B?Y3JWQlFOQ3liSEczMTdKMUZHT2pHckFQWmNWTzRFV3B5Yk9vSHlLVUp0UDdC?=
 =?utf-8?B?aThoVUtYb0xzSUk2cnVaQXBybVdmQ1lrbGhybVZiOSt0RENVeWtmRjNpd0Nz?=
 =?utf-8?B?akRad2NHRDh0TnByNEp4NS9ZSnI2L0t5M3E0V2I1K0Z0TmQ3d0RvcFJSTUdu?=
 =?utf-8?B?U2grdXJlSDhDTjlzTWtvRElQZExmZlpFOG1xa2t5UU9hT1pFZDIrc1dZT3Z3?=
 =?utf-8?B?YWI5SUkra3YwRnllS0JITkVNRkhUWE1XMFBWNHdqcUJGbEk5WlJ1VXl1Y2po?=
 =?utf-8?B?c0lEVWlpaDc3TnI2SmNiSGpERENGK0FJcFZhOVgxTWtESGtWMWIxSHFoWi9J?=
 =?utf-8?B?TWc5TUVlSGFoeXNvNmk1aEN0RUN6Q3k1L0pKTXlFRW5wYWNxVEdFZGNRMkMv?=
 =?utf-8?B?ZHp2clhvZDZaeEwwdjRPanV2Z1FiOWpBSDBIR2IzYUNnd0JTdXYwa3MyQ1h1?=
 =?utf-8?B?a3laUEszRVAwRWpIalBDclJFQkd5Y0JnY1JDOVpJOHIycElMcjdDWVJHa01v?=
 =?utf-8?B?U0s0RkhKb2FkaThKZHIreG1nS0JzQXZDUlVYQnU1VndWVDF4MGx6Z2ZwbHht?=
 =?utf-8?B?MFNrcWx1c3BqZVFyT0IrSCtFUEhsVGQ4NGtjZXp6ZlZuUVJuSmo3bjZMVGpD?=
 =?utf-8?B?ZTBJODBlbER4bDFCRytzWHU3S2lGVHN3VVNXMTlOTXBBUExZemlHcFdabGp6?=
 =?utf-8?B?L1hic2Zld3FmY3EvYytNL0lDZGJBWmR2YTFTTmRyT1pWVEd0d2c0cmJNN09Y?=
 =?utf-8?B?b29qLzJvOEdiUk9SdTBnc0pKdlFxckZDNWRXMVRFdWNBeTlJSXdoalR6OWRY?=
 =?utf-8?B?WGhXTEZHUVdiTVREOUdrYjRRVWtXV2J6YWsySWtudHNTQVNTbnk2eVVGOWhn?=
 =?utf-8?B?aDcvSjQzcmw0MG4wTGRzTXZ3ZGFWd1orTTB1YVFSRitZMTdNa0w3czFyQ2xl?=
 =?utf-8?B?SkFnNDdyazEwWVYvUmVzWGhIMFV3TURGd0V5aUFmSndXbXNmR0NCVjlEWGJp?=
 =?utf-8?B?UC9nUkJPSkNacmE5SFJvSDJRUnBSVmVuRGJ1aUVIVC9sUWUvNkRCMHJIanBW?=
 =?utf-8?B?a25Pci9CZXhibjgxdFVDUUkwYm9MejFKdmNFTE5lY2lrcUJoczJJcGVlRUgv?=
 =?utf-8?B?ZFdmeUV6aXd4Z0RTaW9INUJvNDFkY2JUL1NYK0VWekpJNnEzcWgrMXQrQVo1?=
 =?utf-8?B?Vml1Zk5IMDI5YzdFT1kyTHIwUkdVT0Rrb3RxQ1FJa2ppVTJwUCswNCtvdEMv?=
 =?utf-8?B?V09LNDFORk9uYUFsQzhCOC9CV1MwZFczZFdWNW9ZMGR5eSs2TEwzRm5lbXBE?=
 =?utf-8?B?MUlQNmMxN05vVzREN3FKZ1NvQklnK1A3QXRrQXZYRVZuMGxrMEFVcXpVMEw1?=
 =?utf-8?B?RU8zM1F5UVFCcG9ScEVpMlZ5WWtvbnM0OG9OVTc2bnRRNXJXWHBtc0JJczhP?=
 =?utf-8?B?UnNxemhOWDlrWHJMeTFwYjJicmcySVZzZXNmemhNelV6bTlWdWdhd1cvWThM?=
 =?utf-8?B?QlpkQzBXenNRQ1lTU2VZd3BQdUZDVUhnL1c4U1NhY2ZHcElZZUIxdGVwdThP?=
 =?utf-8?B?SGZPZVlZVUNpeDdUam9nV2F3QlZiK003MFpsSUwyeDBTV0sxWXVJenZRZUV4?=
 =?utf-8?B?Tkp2NVVtSlIvWDM4NmJUWFM3VTN2K1hkcXNWSDh6L1R5WTF5YnRDTm9jVFZC?=
 =?utf-8?B?TGUvQ1Z3ZXZoZGMvNG1wOEoyYU5VT21zMkZSam1ONm5QVXdsbUZWV2l1QTFt?=
 =?utf-8?B?RCttSW9MSDhXK3ZIOEpTWFFDRS9pSVhIMmFkandEWXBBalZYMXlhaWMrVDBu?=
 =?utf-8?Q?QYsgEwD9ZYg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXVIS0tSbGNzZFpWVkFheWM5SDlxZmtUWmlNa1RZVzlDbkNSWGpOUC9lT0pR?=
 =?utf-8?B?cTNveHFNTlQrRmEwUmtneTVLbDJrR2xLSnlWd0FZeVl0NjdJcHF5RE9CYU82?=
 =?utf-8?B?bG5mMHZ1NXJNODlTV1JnUEVpU3h5Uzh4M04ydVloNCs1a1ZTV1hHano0dHBC?=
 =?utf-8?B?WUtrZ09raXV2RzZsWkxiN1JRWno4MGdDL2JpWjlGSC9Wc0ZCNzl1a3hPUXZz?=
 =?utf-8?B?Ym9PUzJ1SlZMUlQ0bDB3elVpSEZjdXBnS0w1cDBjTTI1Z3hRSWo5dGdpeHlN?=
 =?utf-8?B?RXgvTWdiOGEyUGhQMnBVcXE3ZUw5WUR5N2hhQkpFN1h5OXZyeG1WN3FmQTFp?=
 =?utf-8?B?dElUNEJTNURLNGVsQVBlSFg1Y09yL1pmMXcrSUkzZHJtWFRnTnRrUENJZy9R?=
 =?utf-8?B?bDk1MmRkaVZYd2w5VTJpZjM3L0xES3RZK091blJCMWErK1V3L042R0NiMHlI?=
 =?utf-8?B?TEZzUis5ZGd5d3JoVW45R3Z3Z2tXRTdoZ3pXYllzbmE0WjNCMnFUN0JQRWpa?=
 =?utf-8?B?VEFSY1lSOEV3SWhzZkVvWU50NjNhTWt5MTV1cktGUjBZYkRaTmlLaWZBRW5h?=
 =?utf-8?B?MDJyVEQyZXBLUTFubitHcXRPbmJsOE1EaVFGemFISXdIdXlGUWpLT05TL3hT?=
 =?utf-8?B?SUdWazBDT2hzR0VVN0lLdFVuTWVRMG1DSUxlM3FaRCtId0NxeXByWS81YXEw?=
 =?utf-8?B?cjBYZk5WV3l6dHBZQWlXcUd4U2h6SXNMNExreTluSUxaOTEwRExXRE91MTl5?=
 =?utf-8?B?Y0JxLzNvY09sNHo0cVB5ME1DWW1GeU02QlFLTFkrWWp6UVUyaUdBczFVcnpo?=
 =?utf-8?B?Y0VrT3ZqalU1c1JrNE5FS1lHMnl6QXdLbGN0Q3dHdXV0S2xRQ0JQQzg2Z1JX?=
 =?utf-8?B?WDdQNG9OOE9Rak5hYnRFQkFHMGZDSi9iU0xkK2s2Uk5TWkV5b0tKT0xJOFI0?=
 =?utf-8?B?NUNsVC9DL3V0WUN0VVQxV0U3N2lVM28wbUd6QVl1bktqTXJHNGVIMXhJNita?=
 =?utf-8?B?MkJoN003NnZkK2g0SGQ5bzh6cmt2RStJRHBPL3dTeXZ6d0QxcG1mSmFhMkRz?=
 =?utf-8?B?MWxEWnBGNitwWDAzbEg2c3NYZGIreUtwcElTbEFya0VrZmN5TGlYWmRXWEdN?=
 =?utf-8?B?RnBiYkU3TEpJZ2wzY0szZ2ZpL3BpLzlRWkFHT0lKR0IwOHFGcTlCckVxbkFh?=
 =?utf-8?B?SG1jcFZyT0FGMTAycFUxcDdTT1hhaXFsY2M0NC96Q2Y1eDBpcUMrTUNFdkZn?=
 =?utf-8?B?Y29LdEc3TTNKdWx5WkNsVDhYS0NBZGx6Qm9BR25QWkdrL29TUFZJbm5iTyth?=
 =?utf-8?B?eTRaOUdvSjR3MEJQUDdQd0t1dFhvTW5iQ2FVQUtzak9PUW5oR05jOVpBV1pi?=
 =?utf-8?B?VWkralFuNWt4dUNIYTRpNDVRRkZBeVhTWFdmRmJaODFDWmh2eUtId3pTZk5m?=
 =?utf-8?B?WTZSbHU5R2dPbVRSQUNIc05iQVZQWTZmQjF1VFNEOHVZZEVGQXZNcXBEUHpy?=
 =?utf-8?B?ZlQ1anZTZUtKZ1VVZXIzblZnSmZPdGttSW0rcHMzNzZMUk0zZ01Wb3hZSENq?=
 =?utf-8?B?T3R3QjE0MzdJL0JuSFlvZzVmemRpVDF0N1hyNHlWTGt5OHdkOWN2ZHdhaXUr?=
 =?utf-8?B?MUJsNG9teE9Xc1krSmJkRUI4OTVNeUMzK3NTMXZPOGNBR1JIdEM0N3lwSnpx?=
 =?utf-8?B?eWhPY0VEbndtWU5SM2pUN3NLOTM0d3d6UEpCT3hUYXNuVEVxUHlEdVRLWXpu?=
 =?utf-8?B?a0x4Y094WTFZT1BjMFZHcWdlb0F4VWRiQ08xVGVrbkhtRFJtYUs4UXRsTjRW?=
 =?utf-8?B?bjNNUWh1WlA3ZURYZFBHc2ZDTlhqSEE4QTMyY2wrL2drcnlZRUh3Uy9mNlpj?=
 =?utf-8?B?bjRVK1UrcVBVMmVWVVVma1MwYjc4dDlpcnRESnpHem9Icm1ob1A5Ym82VFFn?=
 =?utf-8?B?VUNvUjUvZlJTOWhPd2Fwek5ON3J2U3EwcWJrL1hNVW5aRTJQcDlLRWNWb1Vv?=
 =?utf-8?B?OURpcUxQRHNSUkp3VkdRSGxHdHRHampsUTlXWlBQWlA1OWdOb0ZTZFltOUp2?=
 =?utf-8?B?UisrVHFsVzdZMHBkTlNoTC8wRjlyU3pYL0FzMzZDSDlyK2RxUlgzRHJyYXE5?=
 =?utf-8?B?Um00S1J3RlBoY2ZURXVrWXE5bjIxN2JKUHpjMS9aa2pSN2FBYVU5cm15TTAy?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c57e4ec-61d8-4467-4c79-08ddbdfaa23e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 08:37:12.2004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZ7USV2jKr+b0TZ1f4HiuVfs6LjCbrbhsbdCcfw3qZ6GxnIf1nqx1rQHd+pc03FGErbIgt+TMI6Y8yNuTofsAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8118
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

Hi Pranay,

On 08-07-2025 09:34 am, Pranay Samala wrote:
> This patch updates the linear-tiling subtest in kms_bw to only use HDMI
> connector. If the platform does not have enough HDMI outputs to match the
> number of requested pipes, the test is skipped with a clear message
> indicating the requirement and the number of HDMI outputs found.
Can you provide reason why are we restricting test on HDMI connector?
> This avoids attempting to force modes on non-HDMI connectors and makes
> the test results clearer and more reliable on systems that don’t have
> enough HDMI connectivity.
>
> v2:
> - Skip the test instead of continue (Rama)
> - Remove hdmi_count (Rama)
>
> v3:
> - Only force mode if mode is not present
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_bw.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index ca05695d3..c09b80dd7 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -195,6 +195,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   	int i = 0, num_pipes = 0;
>   	enum pipe p;
>   	int ret;
> +	bool mode_found = false;
>   
>   	/* Cannot use igt_display_get_n_pipes() due to fused pipes on i915 where they do
>   	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
> @@ -215,7 +216,24 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   			continue;
>   		}
>   
> -		force_output_mode(data, output, mode);
> +		// Check if the mode is present in the output's mode list
> +		for (int m = 0; m < output->config.connector->count_modes; m++) {
> +			if (output->config.connector->modes[m].hdisplay == mode->hdisplay &&
> +			    output->config.connector->modes[m].vdisplay == mode->vdisplay){
> +				mode_found = true;
> +				break;
> +			}
> +		}
> +
> +		if (!mode_found) {
> +			if (!physical &&
> +			    output->config.connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
> +			    output->config.connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
> +				force_output_mode(data, output, mode);
> +		} else {
> +			igt_skip("Requested mode not present, can't force mode on %s\n",
> +				 igt_output_name(output));
> +		}
>   
>   		igt_create_color_fb(display->drm_fd, mode->hdisplay,
>   				    mode->vdisplay, DRM_FORMAT_XRGB8888,

