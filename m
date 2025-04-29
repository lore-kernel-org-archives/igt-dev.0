Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25008C369CB
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 07:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB76C10E266;
	Tue, 29 Apr 2025 07:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bv+60bsF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A02710E266
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 07:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745912678; x=1777448678;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=0RDjvFspit9X9IFh+N6R5WFy/nJverDG1qY9GSLMP3U=;
 b=bv+60bsFON1bgzejnjSxIg/g3ZFOINsyuWgrdPbuuq2b0HDezuCW1BIL
 32jNnfGfHQYQfrBphqzuaRsWHopIzgjHIs0TFf6iId+Vq8TubgHjWtBTx
 2YivGlhOQI711sazR4889sa1OuIVCD3VBtIbLR1QlwqtJzrW76w8V6pbl
 W1LMDFzRh2hqJtk2sGHSDMXkGFFBlGwZwdRaSXzBHU0ItliWJoL0vPLs3
 DXZpNEf9OH+ieFeSHZhg++N+98kXhSeXVIifYjklEAk/b7h9ofPKlFTHK
 epz1NMhPpvMXLNcXNJ1Hkc8IOM3E1Q5Ne+rIDhu6pHkc60c1DkmUJDF1U A==;
X-CSE-ConnectionGUID: uhdSaBekR/OQSmxXWXg5zQ==
X-CSE-MsgGUID: lHYewmf0R+GNMo0EC2Ci7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58894827"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208,217";a="58894827"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 00:44:32 -0700
X-CSE-ConnectionGUID: h2jiFBwiScqbd3HhgEJo5g==
X-CSE-MsgGUID: Dhd4ELxpSYizDLGewmwnbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
 d="scan'208,217";a="156975412"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 00:44:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 00:44:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 00:44:29 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 00:44:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO9e2MLnqpT05F5HAQ4c/+ttfxP7llDn16v9+Q9Za4S1DqRCEYbBvRAKg8Wqf5+OwJSQP19JFT4QYGw0W2UWPJfr6yAhNvOQ6ldR+xPpbAMB4ko7Fs+0rzgWimHz2rG4ROhIWZAp2D9t3wvUvNk2gLq/IsFxGz0MKT51rd9xZQLN2awN58XVtoz3anaim70tJYZlJLROQJn3gZqZ3xzkxWHtX+UXb6QZVsDMcCoaW+YZ5frmiHJ+Ork1yb7sG75lt7001jf7QsJ70Lc/kdwFsrkhPxNgEtkc+OF83mnW9g9dEYGuoInJ0Ja0ShRqb4Aafin6BSgitR+hYl1YDC9toA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+ot+f/J+roFH4pUWvdwIRz9mC3vHX4WkVmpdD2Tn7A=;
 b=ZP+7r6oSpFT8OEv8Lc/i4JT43QY1ywrwjZd1CFJ5NbLNaQb4Hu/nxWIcDJJMkLxsa68soveb40W4cmux4j5JxlYkCVfEQ+9pO0utfGBBHaDvPhZ0DrjdFWsKZHdvKHdm5YK4r467vPQqDvKQV5oynQknWdvRmwCNwiY08t/NQHXrD8v9mev6YUFBaNl3UBTGNr6/RM54Ym4dhymcMq228TTshewQM7RJ2jQ0MabUdP87bL2vbow2qPcVv5xpObxWrgP60u60jTR3kHaHlmsXQGk+U0Ex48KXDIOlxDvOSuhVEbcuNkv4YSuA9xMFPGpufBhWQViVYRbv8OyQpDURwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LV2PR11MB6021.namprd11.prod.outlook.com (2603:10b6:408:17e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 07:43:44 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 07:43:43 +0000
Content-Type: multipart/alternative;
 boundary="------------VueNCqlC5Wf80zPCPVyoY4bq"
Message-ID: <5569b1c1-07c6-4231-9d45-11da2de2a12f@intel.com>
Date: Tue, 29 Apr 2025 13:13:38 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel?=
 =?UTF-8?Q?=3A_Add_blocklists_and_test=5Fconfig_=28rev3=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20250428061940.86004-1-karthik.b.s@intel.com>
 <174587420923.22070.16312079170318082830@c664b1dc75d1>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <174587420923.22070.16312079170318082830@c664b1dc75d1>
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LV2PR11MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3c00a8-3550-426c-6bda-08dd86f190f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTR1TEEzZTFZMlJoMXJROTRKaVhrWXVVSFpUejBYOG5iSytCdFRFSXNVbG9B?=
 =?utf-8?B?OUhNNzUrV0R1K1lMcE02cFJ4NFFsbThqcVdhaStXcmQ4ZHFkcjN5RG1jM2VI?=
 =?utf-8?B?ZnY1Z1FySEM0azU3dkVoM3JpY1BpMVhodGErS3U5SmRzOXBRWCtoK3o2OGRC?=
 =?utf-8?B?USttYVFqblNjYmE1KzNSbWduUTNzLzQxVUVCRDhmN3hCMXdxMkgveGs2M0RS?=
 =?utf-8?B?SThyekY0Q2JKdE5BbGtidy9Na2FqMnFGVHZoZjZwNTF5N25sNzBobXYxVUZn?=
 =?utf-8?B?elVLK2ZKK25EYW9LSTU4cWpyVEZjTEppcytqTHoxaHJKYllIK3Q5Kyt5VUs5?=
 =?utf-8?B?M3dQeGZCQzVpK3p2K1J5YVFxcHRQUTlWeCtVY0l0Z3JsS1o0U1VnTXM2amh5?=
 =?utf-8?B?TzRFSzRWcXNMUDAyNjZnMEFyTEJvK2dNMVo2Tm9XalJyYlgwWFE4dWltdXlz?=
 =?utf-8?B?M1BOR08xQ1NSaE0wUnd6NENNaG9xTXZwbVNnQ2hPamJ5eWNTVE56alRmelh5?=
 =?utf-8?B?TGk4NHUrZGdtWDY5UjJ1MXdCUUFuRUx1YjFPVDlFMElNelJmR1cvOW5qbjQ3?=
 =?utf-8?B?MTFzeGV3MllQME9mZ0MxV3pwcCs0S1VEL1d2SXcyWFBwTEZ3d0EweXh1SHR2?=
 =?utf-8?B?NnkxMGExU0tDclVjck5YU0ZzelZrbHBVc1RSek40T3MzWDFEekhkU21jK0Zs?=
 =?utf-8?B?dmJ3RzBoTmloQjlWNkxSL0dXVkJ5aEE5MngzMDdKVE1hNldFWVc2Ukg3RFF2?=
 =?utf-8?B?MjJ0L3pPMDBodm9GcU9waVRMamlwa3dZSExiZ2lnSEtHTHgzckJLRk9oZXFv?=
 =?utf-8?B?NjJZTEJ2dkNVbEgvcDRKbG1vY2JFM290KzNIRWVON1R5U2I4ZVM3eG9SRG1r?=
 =?utf-8?B?YUs3NksxSUpVZTB3VmV4ajh1Z2Y0OVdoVFMycXhwYWhKMVVLWjlyMmhkTUNC?=
 =?utf-8?B?M2h3UHRQaC9PWlFCRFFxem9XMEdDWDZaOVhKR01sTzF4b2xqRS9oSE5RMlBO?=
 =?utf-8?B?VUptbXVibDFsVHpGSW5JMlMyRTZ1d2ltWnlpSE1JTHQ0LzVxWjh0djlNbzZO?=
 =?utf-8?B?NnlMeWcxZDZxV1phT2hMTVNTcUozMHpzYk82UmtCVzdXZi9ZMVg2QnNxN0Q2?=
 =?utf-8?B?Q1BRNDFFSXN4Rm9FNFFMQjRFc1VCUG9ZOU9Uc1orbkwyUnpXODYyb2tzbnh5?=
 =?utf-8?B?eGhlTDVXK3ZobzFCZmtLTElpQ0dVK2FkMzZ4TXZyRXlXYmQyQnBLdkpJVjBv?=
 =?utf-8?B?U3p5MnRtVGRSTXkvWkY3VmF6OVpKUXo5VitCUm9tUVhiMDRYbnNjM0NtRkwx?=
 =?utf-8?B?OUZqbWh2cmU3VWZWZ2kxVERtUmZtbEk1Wk5lbUEzT0JBQ1BaUWpMQytIUFVN?=
 =?utf-8?B?ZUh2UWpjZXdLU0VFMWxQWWlyeWxnRk8wRkJoRFRXL1d3ZUI5aU1RZXpXUFFx?=
 =?utf-8?B?WUx3VEVkQ1hjZ25GNkdONS9sTWhYbUZ5c3BUVTVQNk5jRC9ndm11aGx5WVhK?=
 =?utf-8?B?NXBET1hzQXA3RStWN01qb1pmWmhrQlpPK3JndW40YVlvblFuTi9lcGNHQ3VO?=
 =?utf-8?B?bEJzRzJuaXhYazNHQnl4eFdsZVVrOTRHS0ZKSk9lSWppeWVickxOalJsOUpr?=
 =?utf-8?B?QlFPeGVpOXVxMElySmFUSkhYUkprYWFsN2EwWHRKWTRTUlRleno2WTR6M2My?=
 =?utf-8?B?S3JpcXBNSEJUQnJPbzRnQ1NkZ0poY3VuZ0UzV00xbnJHNWZmUTRGMUE5N2My?=
 =?utf-8?B?SHhDcTBDcFlSb1lqSGcxcFpsRjZrL2hKUjc4U1pydkpuQkdPSklMQ2I1VmpI?=
 =?utf-8?Q?wefvKHjVzJqw1BHU0ZqiHa6rXFHvLji5Yo77Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2Y5Rmp5bWNsN2lpK1FmMCtZRXBPZVRsb1BlUC8zbllkOTE1cVdKQWpKUjEx?=
 =?utf-8?B?TEo5eC9jMGdVSzExYzQraEtycU04RE13N2RlUnZFQUZhNU85Z2U2eEVYelk3?=
 =?utf-8?B?OEtxNVcyandPWjExSVplbk1VLzJWM0I2L0pXWXNOeEJtSi9aU2IwMXRLQTRE?=
 =?utf-8?B?Q2tRaGlkcnlRT0dDOFdrV1RWYWNBRVZTUHNuVHdJcFZSTU5kMjN2Zlh2aXM1?=
 =?utf-8?B?VEh6bEN0SkxTSGhwT0dqOVZOZmFIR1FjNUpQV2ZiVXhXOVlkWldXaEtmTUlk?=
 =?utf-8?B?RVVSRFBNK2VJUTRHcENQeDgxK0dpa3dUUWhCK0VrSGtIbHJZcllRZW8yRFBF?=
 =?utf-8?B?M1QrR0dlMFZJZFZFYlR2SG10Nm5ZZllud3dvTDhBUEhHNk02ektpUUpEUzJX?=
 =?utf-8?B?R2plZXkzbWlXRXRlekhBZ09QTGhLWDZTMjM2Ym51QTVTTVp1YkVobnQvejc0?=
 =?utf-8?B?dFBHdWZuRUJlUXZKV1gvbFJHZ2NwdjJhYkpxck9ld3V5Mk4yNmlPNVgxcE5j?=
 =?utf-8?B?MzZWTUx5bEhBbEZxaW1IZnZUdnNuSk8vR0tzNmkwUTZtNUpPRk1XaW9vVVF4?=
 =?utf-8?B?VFcwYlVlY0wxNmU2eEFnL2hTVXlBVElFQnZrT2ZMajJNSTkxbkdSdWtINnNV?=
 =?utf-8?B?RTAzYnpCNldvOVdPRnpBMXdBQWw2dk5LZjJCcGFXZ1JBMVUwSVlJUndSZlB3?=
 =?utf-8?B?Nk5lbXZvWUZnVHBNNWFJV1hvU3Znak5RRkdXS2dZN3NKRkxPN3RETVFmM0Z2?=
 =?utf-8?B?OUxyeVJ6WlN5bGpRSkI1ZmlyR0piSTBzVFhmQ1RDTHpheFNkMjlGUjdqLzRi?=
 =?utf-8?B?d1hjTGVFOFY5N2NzK0hOOTJPZG43dUZMMWJ4bFlGZjJXU0daSHptT2EzYXN4?=
 =?utf-8?B?ZlZpZDlCME9KcTNzNjZHV0FWdHNOS2VaUThkL3RRbU44dEF2QXhJalkybWNE?=
 =?utf-8?B?UGNCUWswNFNaTDgxR255YW1zUVlzOGFGR2cwNmRsa1NweVVwdWlPM0Y3bHRQ?=
 =?utf-8?B?MVhUQUVEbVRUK3RWdTQya1l1M2tBaWNneGhFZC9GaVE3djRrRXR0VythVHV6?=
 =?utf-8?B?RzUzQ1phTS9kOU8rOEZHSXlhdXJ4ck5CdjRoSHhjWDQ0VmM4L2RxcEZueXNa?=
 =?utf-8?B?SmZxVXFYbkFZNmRla2s1cjZmZ0Y0MmRCTUlGL1lxQWdMSk5aaURSQVBubk1u?=
 =?utf-8?B?MVRPTDBhR0JkY2JGQWRXbmUwRFZmZ2Jsc094c1JYb2R3d2dDazBCNFJuS3NS?=
 =?utf-8?B?K0FuMXhpbkpxYUsyRjFrWk1PV0FOSjNFdXJZNnVycEZndGFzUUozQ1RFNmM2?=
 =?utf-8?B?SjdrdEY0VTBsR2JYU2JNc3c4TVZxVlFnaU13UTN4MjR0ai95THhnNFVHdmlD?=
 =?utf-8?B?T1ZNKzU2RFphUnB1a1AxazVOZ2EwZHhUUkM2UTBoMEdSOTkycHptOGhXVG00?=
 =?utf-8?B?dmtPcmRCQWJ4VFFJbXFpcUgvWmhGclhJc1FrOCtBNjJTR2JKQWQvaGxaK0pO?=
 =?utf-8?B?NGxBakxmUGpweXQ4TWd5OUJFM0VsV1kvVFhrcngwM2VRRVh1Nk9Iemx2dXc3?=
 =?utf-8?B?RlRzbmFpTmhNNEJQZXhwSGY4V2NOaFFXWlZSNkppeDBRbGx6MGJHNGtyd0tx?=
 =?utf-8?B?NkR1czNxTXhVMysxWGlqa3NnV1BlckpvMk82cmM3aUozRWJEU3Z6QzljTktn?=
 =?utf-8?B?OHpGNE9MeWVQU3E2Vk1JbDZDU3l4eWkrRTAvMDNneTFMSEVnU3hUN1Vra3lF?=
 =?utf-8?B?cDJ3QzRtVUFQSExqRDkyTWsrajNpVFBONlRnV1dSWlZDSzc5YVBjN2kwM0Z5?=
 =?utf-8?B?d0RQbk9wT3o5eUpNTFRhTFpCckZUN251eVZFeHhKdGpVZnQ4aWlLRWdjUWx4?=
 =?utf-8?B?ajMzVEt3NDlzcVY3L2poVFkxQnU2VHhsZmVDeWtXR28ydVFNbm5SZzhPN3A5?=
 =?utf-8?B?WE1uQmZBTGxFOEJCd1FkRStsSVB3bmVPTUdYcmRlSW5yTGp4bTc3eDlGUVZ6?=
 =?utf-8?B?MmRKY05SK3ZmS3RveVNyRlZWTGJpUTliVEhCR1d3bTdZL3JPOFJjOUxHVENa?=
 =?utf-8?B?UDBUYXZkQ0R2TWF6a1NyQ0ZZekNwTU5ONWhrQW1aa29XRk9yL0RUZWVYcm5n?=
 =?utf-8?B?VWM2dk43YzFHUEtESktuNVkvdXhUNWMvWUk1bnE2c1N0VXZEb2ozVnl6akhj?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3c00a8-3550-426c-6bda-08dd86f190f4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 07:43:43.7919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2FZPTFwrfCylFR9Euhjfzjwjaz4BgCvtIinFpFOp5PSrN2LWT5C8hJ2W0l/q5qtC24QPIAg2a3FyJYq0dcJmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6021
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

--------------VueNCqlC5Wf80zPCPVyoY4bq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

The failure here is unrelated as these are testlist/blocklist related 
changes and shouldn't affect current CI execution.

Thanks,
Karthik.B.S
On 4/29/2025 2:33 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel: Add blocklists and test_config (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/147819/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13048/index.html
>
>
>   CI Bug Log - changes from XEIGT_8341_BAT -> XEIGT_8342_BAT
>
>
>     Summary
>
> *SUCCESS*
>
> No regressions found.
>
>
>     Participating hosts (8 -> 8)
>
> No changes in participating hosts
>
>
>     Changes
>
> No changes found
>
>
>     Build changes
>
>   * IGT: IGT_8341 -> IGT_8342
>   * Linux: xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee ->
>     xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed
>
> IGT_8341: 0e76d82675226a942f4811514c040c07d87d156b @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8342: 8342
> xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee: 
> 4dfede9f7f69716060d29d84a1267f893da9dbee
> xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed: 
> f6fc27d337f1078e14de1ef319a92b4e50203aed
>
--------------VueNCqlC5Wf80zPCPVyoY4bq
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>The failure here is unrelated as these are testlist/blocklist
      related changes and shouldn't affect current CI execution.</p>
    Thanks,<br>
    Karthik.B.S
    <div class="moz-cite-prefix">On 4/29/2025 2:33 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:174587420923.22070.16312079170318082830@c664b1dc75d1">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel: Add blocklists and test_config (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/147819/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/147819/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13048/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13048/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8341_BAT -&gt; XEIGT_8342_BAT</h1>
      <h2>Summary</h2>
      <p><strong>SUCCESS</strong></p>
      <p>No regressions found.</p>
      <h2>Participating hosts (8 -&gt; 8)</h2>
      <p>No changes in participating hosts</p>
      <h2>Changes</h2>
      <p>No changes found</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8341 -&gt; IGT_8342</li>
        <li>Linux: xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee
          -&gt; xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed</li>
      </ul>
      <p>IGT_8341: 0e76d82675226a942f4811514c040c07d87d156b @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8342: 8342<br>
        xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee:
        4dfede9f7f69716060d29d84a1267f893da9dbee<br>
        xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed:
        f6fc27d337f1078e14de1ef319a92b4e50203aed</p>
    </blockquote>
  </body>
</html>

--------------VueNCqlC5Wf80zPCPVyoY4bq--
