Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB17C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 17:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F8310E447;
	Wed, 15 May 2024 17:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YN3E0nCd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BA310E447
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 17:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715794575; x=1747330575;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=1MyrsngoiThJiJ2eEhoWq0804sqo7SrHn4tUg5E3fGA=;
 b=YN3E0nCdSXC//EhmqLNElIPW4u5fems0DqaThEQbJaam5RjpRFW8twJJ
 RqPohXW+IYfbZidcNg5g5TyVHBsiH1rwn2rumexicvnLJRIOVBflgacYl
 WN9oRgAonbhNyF3kFAR6tHBLXWQtmHBIGxuq37hWjn2mbfD3CaXtl0mx2
 aq0mUMpaLHb1D+gUN1DzfKFrQpYfA1p3pw1hrPaaRdpX5xoFrDQXScYxd
 5NyLAoUNFQqOxUQmeMlDBo++mlrC2Hcg99+4bP1oFM2bmeq7BVt/MOigM
 5FmbT0tr/ZC2eIjDmUmx7qdaEX5ViTaZB9veAURjG0KZU74rlsRwt2iH7 A==;
X-CSE-ConnectionGUID: P90JodPUSdOW5UaMonX9wA==
X-CSE-MsgGUID: 4NR4JDRZRqWTepQoYS41gg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="37244474"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="37244474"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 10:36:14 -0700
X-CSE-ConnectionGUID: v4SnX05UTfqjnj0gKbLqJQ==
X-CSE-MsgGUID: 9rStSldwSFasZGvuJyzang==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35859861"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 10:36:13 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 10:36:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 10:36:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 10:36:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBU3QgucS4KsnHFjIc1n5Ugiy+OyZubfmYxKtl3erFR1QRLXyijqi++GioAEW8xTsdNltwlWm8ht6uD39e0K8tDRLjMhNkRVbHQUb/uJ6vkizrTPLfcgvN3oSnTvrIiw0mZ1EEt2hTqX359UjLmuS+j4Z961r5OcnRrkB+oAVNwPbfrK6p7t+j8qayJGNw0W83Oi9rQqisC3jFdDWSZw1k3kPoCcBL+GR+ireZEteksaXKtGq7xHGIY+BkUMz/qWp3qWItX7/ZJWVfWXi/Ba20qCGy53fmns5zBpAsRxT5YI1Dt1o7s5HY12MhbZ7FtNs5XNsqKLapxJxPyP7G/TRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xmYVINWC116GgbCrumuihExPHtU/aq1YBpzHGtLcDA=;
 b=h80XGAQZEISQQSsbONPM9/Z6kIK02L/hz0E5t4Dew2jnTuhwZ7vXRnA/aXtCb+lDOVmpghothK+wTpCV3m1CsGTg+IXUmB51DpWKjwX9nrKmfMEe1S0vG5Noll68pU0X6/qoBntqqGF2SiHCwOEXbu8GKlSyW0pE60j6E/Dp0ze22iLN3IFxmamSfPuSVOd/aTUJuez65+vtvOOubFj4ccgFl5AYwbiJd7P+piI8uQeY9OSIkuJTzmvAfSAj/iH1GNO6QonstwGTQ3YKeQA5PeFRvxdWVI15qp+Fap4++fCdfH7g7fWbD78s4CUtzgd9DrAwj7jIL8eKmImfNNYmMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB6468.namprd11.prod.outlook.com (2603:10b6:208:3a4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Wed, 15 May
 2024 17:36:09 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 17:36:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240515171055.dpqo3uarlappfux6@kamilkon-DESK.igk.intel.com>
References: <20240509152442.189166-1-gustavo.sousa@intel.com>
 <20240509152442.189166-2-gustavo.sousa@intel.com>
 <20240515171055.dpqo3uarlappfux6@kamilkon-DESK.igk.intel.com>
Subject: Re: [PATCH i-g-t 1/3] igt_hook: Add feature
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Petri Latvala <adrinael@adrinael.net>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Wed, 15 May 2024 14:35:55 -0300
Message-ID: <171579455569.27300.4520939210308457020@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: 999f3353-6606-45c5-cec8-08dc75058151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230031|366007|1800799015|376005|16122699003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3VzS1dZeHhzejE3Yzhnc2gxSzVnVXRsakRKRFhRK2svdzh0Vk9MRmZLQTQr?=
 =?utf-8?B?RjkrS0VYbnBDMXFURmNKSlhUakJ2cHZ2NW1KT3UyeUNyUkNNck8wWVVnREhS?=
 =?utf-8?B?UWRLUXRKZkRPbXBvVG5TRm1vODZKUjZnOGR4UjhMRFYvbmtWaEFJeXIxRUpo?=
 =?utf-8?B?cTZRb3QyNTNTS0c3OTBlWXp5YzJrOE1Sc1V3UDZmK0hXYlpSN3lWZHZETDRP?=
 =?utf-8?B?WmFlUGhxRGVpQTJaeXZmdzN1OXgzSnl4dzhhN3lDVXR0NW00dVAxQmdDeTc4?=
 =?utf-8?B?dVFaL1FkVHEySHN5Z2xCNllpQWhNeXUwb2o3SlpSdFN3bmZtTnFLWXRwNCt6?=
 =?utf-8?B?SHRqc3JPaFdsWVlnMENaVDYwM0hLTnNWSzZBcHNXSEZiT1hFMk9VWUtta0I5?=
 =?utf-8?B?OXJ4VWVNajdRVTRXMFU0VFYwMitLUy9qK3dVVmI5S1RxaDR6Y25EcFp5M2lZ?=
 =?utf-8?B?WS9VbUloVzhYM1BQQTlKT2NNYWMyeHJITmtEc0I0aExFc1haYllndm1BM0RZ?=
 =?utf-8?B?WFhlbS9QQUlybytLdVM0MnZWVkg1TDd4QXQreDFCMG5raHcwNGJxSDI0MHoz?=
 =?utf-8?B?NG1CNTB0YmNVV09uRlNMQ09nTlVCWTcvWFQxalZWTG1CdW5USzFBMitJM3NM?=
 =?utf-8?B?K05KUE8vTXJaNk0wektUaHVJd3lYS3BQUXYwM1FnSk90Q2xSd2JJelZqRDdp?=
 =?utf-8?B?V2dDdTRqVkMvd0E3aDNuM00vU1FCazl5b090dE1zbDU1VDM5RE9QVnVlbTFT?=
 =?utf-8?B?ZXRjdldmUW0vUi8zUHNKYU9jUG5OTHlNSDZ2Z2JQSGFSTjJQelk4M2VHTGkx?=
 =?utf-8?B?SWZTT0VBNjdzRzVmVkJUUTBRVVhDR0wvdGJocGdZNWVxT3RrQzhrb0ZKWWtX?=
 =?utf-8?B?UnRkcDlYWjlybk1DYmdsZUJlOFVpaEdsSUgxWU14MC91dHpYVDhjRUs3WVFL?=
 =?utf-8?B?cXRLTUFXQSsyL3JZeHhUN080bFNEMHdJWEhTVkFQQjhzTUVYWnFjU1JSMVEr?=
 =?utf-8?B?cno5WnpJTmVva3BFcXdIZXlrc0tYdjUrdWs3My91SHRJdEpMSm9wTmxxMHlQ?=
 =?utf-8?B?KytaZ2JmNHRBSHo5TlBwVTVVNzdjejBiNnorSnRoRU84alBnM1RvQWVLTkdX?=
 =?utf-8?B?WjJ6MysyWnFYVU9PUWZQdlRyOXNaVzZIS1BxWVJtN285VVFKeDY2dEFoY1dz?=
 =?utf-8?B?Y1hNNFhDR040ZTczVXR4U1N4Q3R4SElVTWJaTFB4dUhSYXgzK0QvM1A1RHVy?=
 =?utf-8?B?cnE1M0RFQUw0L2hpck0rNlY1Q0UxR1hDSjBzejk5cHJlbUtvRHB2M09KWE9j?=
 =?utf-8?B?WHJjc01WdFNlR21lR243L05mMVF3bVViOTFPQ3VWVDlhZmE5ZU9CemdRbHc0?=
 =?utf-8?B?YmYrbmsxcWQyYXNoS2xJblJFSE44ZE1uNEppSUhSME5EQ3hzR2psTlE4RXJ0?=
 =?utf-8?B?cXc4WEN3enNBVTFOREVNQVNkaWEyWTZIdFpxMHVzajZLckdFSGtpMDFqMG9s?=
 =?utf-8?B?NE5lclVuS1NDRzRIckwyQllKbldEeU0ySWhXeUNxNTBBMFBWcS9jelZZQTB1?=
 =?utf-8?B?bHJDcUtDRTg2NEh0QysvWHN2SWVDWUcwNnVRbXhaUkxwWVZKcmVTUFoyVFVn?=
 =?utf-8?B?UmhrNFNNaWM3QWdPRUJVeEFkS0t5cG1KbmI0emF2aGJ0cFpwNityTnRybmxX?=
 =?utf-8?B?dDdsMy85L0pvUjhDb1F3L2RaTnhZNzE1ZkpVMkNrYStCa0VMaElPd1VaWGh3?=
 =?utf-8?B?S2diSTA2WmdXcEFPTWZqMm1Mc0NBaHhjSUJWRHNFbnVBbU1vVkh5b1ZWUktZ?=
 =?utf-8?B?Q0FRdnF3UlR4WDQrVE9qZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(16122699003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDUvZ0dJazdCR1VwNTlZSU1wWG9xMXJpK3BqQURnak1LTEVNbmVobGx3ek9R?=
 =?utf-8?B?dFJRQ2ZXblRGcnViTmRXQ0NqU0FtcllzVmVzTzZOWVJHVjNSczlZc1VZSXhQ?=
 =?utf-8?B?Y2hIWmJLajl3aW5zMnVZbk8wRUsvNWc3UGxVSW1FakZOUVZYTFJqdTQxRExl?=
 =?utf-8?B?UHY2ajlTeERZZndCcnM2czYzWjdqaHhwQVJGbFRUMmxLMWRSV3A1OFpEWVor?=
 =?utf-8?B?NCtDRGtEeEZibm84b3pJVG1RbjhBN2ExNUpOc0N1dFpYWVNrN1YyL1Q5enY4?=
 =?utf-8?B?MlQrUTlmRkc1UkVpbC9CVzhaUStFa1RreVlOcWIzRWN2bWcwOWJkRm1pRUdp?=
 =?utf-8?B?SWdFbnh2YXRBNEgxT0RhaTZhS3dHQlMraFNBNmUwQ2JHVDBMb3VacTh4aFdF?=
 =?utf-8?B?SUJsY1JxYW1tWHpqT3FDamRqMzNPTUJ3UktHMDEyTy9zcWluZTQrNXhhN2NS?=
 =?utf-8?B?bmpMRCtHaU9jUmVJaVRFTHFqSDV6L1dQZFBNL2MxUUE5UzNJUmZFQ2s3RzRN?=
 =?utf-8?B?WVJsb2JUSFZua3M4ZFRhMXJ1czBvbTRienN0amp1RXNUSXAvK1FXZnNabWxR?=
 =?utf-8?B?cUNLcDhxaXJnT1BHTnFsd21NckR4Y1o2a1E4R1JRZC9YMkpSZ2IrVFdKM3lI?=
 =?utf-8?B?bHdzL3NYdGR1cHh5SlVEN1JzTmw3MzlKZnZ3NXB3VVR1SUdBbm9CS3k3a2pa?=
 =?utf-8?B?alQxYmFkeGdkbVEwVFlkbWlxMTNrbnZrZG1LQmlzVnJ2anQ3a3BHQ2lVWWZD?=
 =?utf-8?B?bkw2ZzJlVmZRekI5OEhLcnZBNXAzZ1Uwb3p3cHF0NFZnZXR1WUlBd2dueTNZ?=
 =?utf-8?B?Z2lQckV5ZGYxcS8ydGZUTVlycVNKaE9XQ1F1WEwrSmlxRlZaS3poQndWNmxI?=
 =?utf-8?B?SXVPSm9LclR6aVJzb0pXQVlFRjRmZUUxOUF2d0pEZkhTVW56Qm1EV2tsRG1l?=
 =?utf-8?B?NUc3MzV1L1psaDVJTXZvODhmR3BYWUNFL2JPS2lRcFNXWmIwUk1jbUcySXJZ?=
 =?utf-8?B?RGZlS0xWSFlwRzd3NVd6N3ErRXpzZkVxK1kySmtnaWE0YTd1d3RzTHlWc3BC?=
 =?utf-8?B?dU96WUhyOUZ3L2NDU29DeDQ0THRRbTBxakhUK01xalA2N29ZOWZRMmJOUTZ5?=
 =?utf-8?B?NS9USzVWYlFLcFdyZ1NseENxWVBzVlB0WCtsU1A5c3N1M2pJYTFZbXQ0cFp6?=
 =?utf-8?B?NUJ6ZmpFa2NzVm5Bb2ErSzZEblp0NWNINzk4bmhVcSt0ODhzYWowejUzOUo5?=
 =?utf-8?B?cTU5UTl2S21NYk5xWkI2Wm5yb0JiSE96NTBLZ0NwMUx6VERoTlVrRjkwaGZh?=
 =?utf-8?B?cThkRGorbWp6NXhLSGt6c0QwNVJGVWpmQWs3UVhaQXE2UG1TYmloMUhBNUNC?=
 =?utf-8?B?MVVFZkRRWnNYQ01WUE45VXNva2JjK2lkaFA0akZGZHIvM2dOMEYyRE1QNC9J?=
 =?utf-8?B?UElGZnN2YmhWaXdZamRxcm9zYmFZQVg1S21nZGZhdTk4OERGUHdjRm5hT1Bx?=
 =?utf-8?B?MGI2eUFKZkpPN052K2ZXKzJEemMxbVpQM0poZG04T1JuMi91TjM2clYyeHdM?=
 =?utf-8?B?dlRUdmhDbG5zSlYyVXgyNzQ5VFpLVHFZZ1JkR0lkRFpGZFFtejNrSVltUnUz?=
 =?utf-8?B?Qnl1L3lSRjdFU2s5VUpxZ1hSNXZRUGR2amVKanJKcFNnN0ZIM2hFYk1tY29M?=
 =?utf-8?B?aEUvM29QdWYzbGlQc3I0UDFsV1hHcTlFSE1wd3hxdjZPSDRpbTJWQmhCU2hU?=
 =?utf-8?B?dW1iV3IxY1ZQRlJBcDRMQzZ6bDlZa3VsWGNqMTAxTjRNSmV3QzV6N3Ryd0lJ?=
 =?utf-8?B?NTVBS0pQcHF5OTJyUG15R0lCN2xPTC9oTDlZc0hSYmhoUHp2TStsRlRFUXAx?=
 =?utf-8?B?RThHaVoyN2xaWTBSdDlkY0Q4L3ZzZXFETHhXL0pJbFl3dDNkOFpuU3lsbHE3?=
 =?utf-8?B?UUFiTTd2elo1Nm5PYVdFOWFBOFVHT0VGSlQydWNsZVlHR0lrVWJGamg2ZFVD?=
 =?utf-8?B?OEpELzJzQUkxOTZPV3RnK1I3ZzJHUkJMMTNYOFBJR2lyaXhVMC9Ndk5LYlMw?=
 =?utf-8?B?ZjhDM3VESm9MQWdacnJ6dlR0eTJIUnhTd1FKejdEVE5jUk5vNm4zQjVCODNG?=
 =?utf-8?B?K3JQUHg2WjJxZTlPRVducHlnNE1RRW5EZk9nWDFQZVRJV29naXg2MnNraDJ2?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 999f3353-6606-45c5-cec8-08dc75058151
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 17:36:09.0036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAhWM8+jL6qNlF1hIGi0ln/0HWX3k6z02AMTkFr4XKjkULrtKY8g7mEAQg3SEnnDembgpDSVtUf20H84XKcAxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6468
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

Quoting Kamil Konieczny (2024-05-15 14:10:55-03:00)
>Hi Gustavo,
>On 2024-05-09 at 12:24:29 -0300, Gustavo Sousa wrote:
>> For development purposes, sometimes it is useful to have a way of
>> running custom scripts at certain points of test executions. A
>> real-world example I bumped into recently is to collect information from
>> sysfs before and after running each entry of a testlist.
>>=20
>> While it is possible for the user to handcraft a script that calls each
>> test with the correct actions before and after execution, we can provide
>> a better experience by adding built-in support for running hooks during
>> test execution.
>>=20
>> That would be even better when adding the same kind of support for
>> igt_runner (which is done in an upcoming change), since the user can
>> also nicely resume with igt_resume with the hook already setup in case a
>> crash happens during execution of the test list.
>>=20
>> As such provide implement support for hooks, integrate it into
>> igt_core and expose the functionality via --hook CLI option on test
>> executables.
>
>Hmm, why not just a pre-hook@ and post-hook@ in testlist itself?
>It will be easier to handle - just more parsing.

How would that work with respect to filters? The current proposal allows
something filtering the events to be tracked. For example, one can use
`--hook "pre-test,pre-dyn-subtest:echo hello"` to run the command only
before test binary starts and before each dynamic subtest.

Also, there are cases where a testlist is not really used. Examples are
calling a test binary directly or calling igt_runner without
--test-list. So, while I believe we could consider support for
describing hooks in testlist, I do not think that would be a substitute
for the --hook option.

On a personal note, my current use case for hooks is more towards
debugging, so for me it is more convenient to have a --hook option than
having to make a copy of a testlist only to add the hook instructions
there.

--
Gustavo Sousa

>
>Added Petri to cc.
>
>Regards,
>Kamil
>
>>=20
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
>>  lib/igt_core.c                                | 116 +++-
>>  lib/igt_hook.c                                | 499 ++++++++++++++++++
>>  lib/igt_hook.h                                |  86 +++
>>  lib/meson.build                               |   1 +
>>  lib/tests/igt_hook.c                          | 187 +++++++
>>  lib/tests/igt_hook_integration.c              | 297 +++++++++++
>>  lib/tests/meson.build                         |   2 +
>>  8 files changed, 1180 insertions(+), 9 deletions(-)
>>  create mode 100644 lib/igt_hook.c
>>  create mode 100644 lib/igt_hook.h
>>  create mode 100644 lib/tests/igt_hook.c
>>  create mode 100644 lib/tests/igt_hook_integration.c
>>=20
>> diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/=
reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>> index 9085eb924e85..11458c68124b 100644
>> --- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>> +++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>> @@ -32,6 +32,7 @@
>>      <xi:include href=3D"xml/igt_fb.xml"/>
>>      <xi:include href=3D"xml/igt_frame.xml"/>
>>      <xi:include href=3D"xml/igt_gt.xml"/>
>> +    <xi:include href=3D"xml/igt_hook.xml"/>
>>      <xi:include href=3D"xml/igt_io.xml"/>
>>      <xi:include href=3D"xml/igt_kmod.xml"/>
>>      <xi:include href=3D"xml/igt_kms.xml"/>
>> diff --git a/lib/igt_core.c b/lib/igt_core.c
>> index 3ff3e0392316..291d891cf884 100644
>> --- a/lib/igt_core.c
>> +++ b/lib/igt_core.c
>> @@ -70,6 +70,7 @@
>> =20
>>  #include "igt_core.h"
>>  #include "igt_aux.h"
>> +#include "igt_hook.h"
>>  #include "igt_sysfs.h"
>>  #include "igt_sysrq.h"
>>  #include "igt_rc.h"
>> @@ -241,6 +242,9 @@
>>   * - '*,!basic*' match any subtest not starting basic
>>   * - 'basic*,!basic-render*' match any subtest starting basic but not s=
tarting basic-render
>>   *
>> + * It is possible to run a shell script at certain points of test execu=
tion with
>> + * "--hook". See the usage description with "--help-hook" for details.
>> + *
>>   * # Configuration
>>   *
>>   * Some of IGT's behavior can be configured through a configuration fil=
e.
>> @@ -273,6 +277,8 @@ static unsigned int exit_handler_count;
>>  const char *igt_interactive_debug;
>>  bool igt_skip_crc_compare;
>> =20
>> +static struct igt_hook *igt_hook =3D NULL;
>> +
>>  /* subtests helpers */
>>  static bool show_testlist =3D false;
>>  static bool list_subtests =3D false;
>> @@ -338,6 +344,8 @@ enum {
>>          OPT_INTERACTIVE_DEBUG,
>>          OPT_SKIP_CRC,
>>          OPT_TRACE_OOPS,
>> +        OPT_HOOK,
>> +        OPT_HELP_HOOK,
>>          OPT_DEVICE,
>>          OPT_VERSION,
>>          OPT_HELP =3D 'h'
>> @@ -810,6 +818,8 @@ static void common_exit_handler(int sig)
>>                  bind_fbcon(true);
>>          }
>> =20
>> +        igt_hook_free(igt_hook);
>> +
>>          /* When not killed by a signal check that igt_exit() has been p=
roperly
>>           * called. */
>>          assert(sig !=3D 0 || igt_exit_called || igt_is_aborting);
>> @@ -907,6 +917,8 @@ static void print_usage(const char *help_str, bool o=
utput_on_stderr)
>>                     "  --interactive-debug[=3Ddomain]\n"
>>                     "  --skip-crc-compare\n"
>>                     "  --trace-on-oops\n"
>> +                   "  --hook [<events>:]<cmd>\n"
>> +                   "  --help-hook\n"
>>                     "  --help-description\n"
>>                     "  --describe\n"
>>                     "  --device filters\n"
>> @@ -1090,6 +1102,8 @@ static int common_init(int *argc, char **argv,
>>                  {"interactive-debug", optional_argument, NULL, OPT_INTE=
RACTIVE_DEBUG},
>>                  {"skip-crc-compare",  no_argument,       NULL, OPT_SKIP=
_CRC},
>>                  {"trace-on-oops",     no_argument,       NULL, OPT_TRAC=
E_OOPS},
>> +                {"hook",              required_argument, NULL, OPT_HOOK=
},
>> +                {"help-hook",         no_argument,       NULL, OPT_HELP=
_HOOK},
>>                  {"device",            required_argument, NULL, OPT_DEVI=
CE},
>>                  {"version",           no_argument,       NULL, OPT_VERS=
ION},
>>                  {"help",              no_argument,       NULL, OPT_HELP=
},
>> @@ -1225,6 +1239,24 @@ static int common_init(int *argc, char **argv,
>>                  case OPT_TRACE_OOPS:
>>                          show_ftrace =3D true;
>>                          break;
>> +                case OPT_HOOK:
>> +                        assert(optarg);
>> +                        if (igt_hook) {
>> +                                igt_warn("Overriding previous hook desc=
riptor\n");
>> +                                igt_hook_free(igt_hook);
>> +                        }
>> +                        igt_hook =3D igt_hook_init(optarg, &ret);
>> +                        if (!igt_hook) {
>> +                                igt_critical("Failed to initialize hook=
 data: %s\n",
>> +                                             igt_hook_error_str(ret));
>> +                                ret =3D ret > 0 ? -2 : -3;
>> +                                goto out;
>> +                        }
>> +                        break;
>> +                case OPT_HELP_HOOK:
>> +                        igt_hook_print_help(stdout, "--hook");
>> +                        ret =3D -1;
>> +                        goto out;
>>                  case OPT_DEVICE:
>>                          assert(optarg);
>>                          /* if set by env IGT_DEVICE we need to free it =
*/
>> @@ -1274,9 +1306,24 @@ out:
>>                          exit(IGT_EXIT_INVALID);
>>          }
>> =20
>> -        if (ret < 0)
>> -                /* exit with no error for -h/--help */
>> -                exit(ret =3D=3D -1 ? 0 : IGT_EXIT_INVALID);
>> +        if (ret < 0) {
>> +                free(igt_hook);
>> +                igt_hook =3D NULL;
>> +
>> +                switch (ret) {
>> +                case -1: /* exit with no error for -h/--help */
>> +                        exit(0);
>> +                        break;
>> +                case -2:
>> +                        exit(IGT_EXIT_INVALID);
>> +                        break;
>> +                case -3:
>> +                        exit(IGT_EXIT_ABORT);
>> +                        break;
>> +                default:
>> +                        assert(0);
>> +                }
>> +        }
>> =20
>>          if (!igt_only_list_subtests()) {
>>                  bind_fbcon(false);
>> @@ -1284,6 +1331,15 @@ out:
>>                  print_version();
>>                  igt_srandom();
>> =20
>> +                if (igt_hook) {
>> +                        struct igt_hook_evt hook_evt =3D {
>> +                                .evt_type =3D IGT_HOOK_PRE_TEST,
>> +                                .target_name =3D command_str,
>> +                        };
>> +
>> +                        igt_hook_push_evt(igt_hook, &hook_evt);
>> +                }
>> +
>>                  sync();
>>                  oom_adjust_for_doom();
>>                  ftrace_dump_on_oops(show_ftrace);
>> @@ -1487,6 +1543,16 @@ bool __igt_run_subtest(const char *subtest_name, =
const char *file, const int lin
>>          igt_thread_clear_fail_state();
>> =20
>>          igt_gettime(&subtest_time);
>> +
>> +        if (igt_hook) {
>> +                struct igt_hook_evt hook_evt =3D {
>> +                        .evt_type =3D IGT_HOOK_PRE_SUBTEST,
>> +                        .target_name =3D subtest_name,
>> +                };
>> +
>> +                igt_hook_push_evt(igt_hook, &hook_evt);
>> +        }
>> +
>>          return (in_subtest =3D subtest_name);
>>  }
>> =20
>> @@ -1517,6 +1583,16 @@ bool __igt_run_dynamic_subtest(const char *dynami=
c_subtest_name)
>>          _igt_dynamic_tests_executed++;
>> =20
>>          igt_gettime(&dynamic_subtest_time);
>> +
>> +        if (igt_hook) {
>> +                struct igt_hook_evt hook_evt =3D {
>> +                        .evt_type =3D IGT_HOOK_PRE_DYN_SUBTEST,
>> +                        .target_name =3D dynamic_subtest_name,
>> +                };
>> +
>> +                igt_hook_push_evt(igt_hook, &hook_evt);
>> +        }
>> +
>>          return (in_dynamic_subtest =3D dynamic_subtest_name);
>>  }
>> =20
>> @@ -1602,6 +1678,17 @@ __noreturn static void exit_subtest(const char *r=
esult)
>>          struct timespec *thentime =3D in_dynamic_subtest ? &dynamic_sub=
test_time : &subtest_time;
>>          jmp_buf *jmptarget =3D in_dynamic_subtest ? &igt_dynamic_jmpbuf=
 : &igt_subtest_jmpbuf;
>> =20
>> +        if (igt_hook) {
>> +                struct igt_hook_evt hook_evt =3D {
>> +                        .evt_type =3D (in_dynamic_subtest
>> +                                        ? IGT_HOOK_POST_DYN_SUBTEST
>> +                                        : IGT_HOOK_POST_SUBTEST),
>> +                        .result =3D result,
>> +                };
>> +
>> +                igt_hook_push_evt(igt_hook, &hook_evt);
>> +        }
>> +
>>          if (!igt_thread_is_main()) {
>>                  igt_thread_fail();
>>                  pthread_exit(NULL);
>> @@ -2274,6 +2361,7 @@ void __igt_abort(const char *domain, const char *f=
ile, const int line,
>>  void igt_exit(void)
>>  {
>>          int tmp;
>> +        const char *result;
>> =20
>>          if (!test_with_subtests)
>>                  igt_thread_assert_no_failures();
>> @@ -2318,12 +2406,7 @@ void igt_exit(void)
>> =20
>>          assert(waitpid(-1, &tmp, WNOHANG) =3D=3D -1 && errno =3D=3D ECH=
ILD);
>> =20
>> -        if (!test_with_subtests) {
>> -                struct timespec now;
>> -                const char *result;
>> -
>> -                igt_gettime(&now);
>> -
>> +        if (!test_with_subtests || igt_hook) {
>>                  switch (igt_exitcode) {
>>                          case IGT_EXIT_SUCCESS:
>>                                  result =3D "SUCCESS";
>> @@ -2334,6 +2417,12 @@ void igt_exit(void)
>>                          default:
>>                                  result =3D "FAIL";
>>                  }
>> +        }
>> +
>> +        if (!test_with_subtests) {
>> +                struct timespec now;
>> +
>> +                igt_gettime(&now);
>> =20
>>                  if (test_multi_fork_child) /* parent will do the yellin=
g */
>>                          _log_line_fprintf(stdout, "dyn_child pid:%d (%.=
3fs) ends with err=3D%d\n",
>> @@ -2344,6 +2433,15 @@ void igt_exit(void)
>>                                            result, igt_time_elapsed(&sub=
test_time, &now));
>>          }
>> =20
>> +        if (igt_hook) {
>> +                struct igt_hook_evt hook_evt =3D {
>> +                        .evt_type =3D IGT_HOOK_POST_TEST,
>> +                        .result =3D result,
>> +                };
>> +
>> +                igt_hook_push_evt(igt_hook, &hook_evt);
>> +        }
>> +
>>          exit(igt_exitcode);
>>  }
>> =20
>> diff --git a/lib/igt_hook.c b/lib/igt_hook.c
>> new file mode 100644
>> index 000000000000..8a39e19e3e5f
>> --- /dev/null
>> +++ b/lib/igt_hook.c
>> @@ -0,0 +1,499 @@
>> +/*
>> + * Copyright =C2=A9 2024 Intel Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g a
>> + * copy of this software and associated documentation files (the "Softw=
are"),
>> + * to deal in the Software without restriction, including without limit=
ation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublice=
nse,
>> + * and/or sell copies of the Software, and to permit persons to whom th=
e
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice (including the=
 next
>> + * paragraph) shall be included in all copies or substantial portions o=
f the
>> + * Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT S=
HALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR=
 OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER =
DEALINGS
>> + * IN THE SOFTWARE.
>> + */
>> +#include <assert.h>
>> +#include <errno.h>
>> +#include <limits.h>
>> +#include <stdbool.h>
>> +#include <stddef.h>
>> +#include <stdint.h>
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +
>> +#include "igt_hook.h"
>> +
>> +/**
>> + * SECTION:igt_hook
>> + * @short_description: Support for running a hook script on test execut=
ion
>> + * @title: Hook support
>> + *
>> + * IGT provides support for running a hook script when executing tests.=
 This
>> + * support is provided to users via CLI option `--hook` available in te=
st
>> + * binaries. Users should use `--help-hook` for detailed usaged descrip=
tion of
>> + * the feature.
>> + *
>> + * The sole user of the exposed API is `igt_core`, which calls @igt_hoo=
k_init()
>> + * when initializing a test case, then calls @igt_hook_push_evt() for e=
ach event
>> + * that occurs during that test's execution and finally calls @igt_hook=
_free()
>> + * to clean up at the end.
>> + */
>> +
>> +#define TEST_NAME_INITIAL_SIZE 16
>> +
>> +typedef uint16_t evt_mask_t;
>> +
>> +struct igt_hook {
>> +        evt_mask_t evt_mask;
>> +        char *cmd;
>> +        char *test_name;
>> +        size_t test_name_size;
>> +        char *subtest_name;
>> +        size_t subtest_name_size;
>> +        char *dyn_subtest_name;
>> +        size_t dyn_subtest_name_size;
>> +        char *test_fullname;
>> +};
>> +
>> +enum igt_hook_error {
>> +        IGT_HOOK_EVT_EMPTY_NAME =3D 1,
>> +        IGT_HOOK_EVT_NO_MATCH,
>> +};
>> +
>> +static_assert(IGT_HOOK_NUM_EVENTS <=3D sizeof(evt_mask_t) * CHAR_BIT,
>> +              "Number of event types does not fit event type mask");
>> +
>> +static const char *igt_hook_evt_type_to_name(enum igt_hook_evt_type evt=
_type)
>> +{
>> +        switch (evt_type) {
>> +        case IGT_HOOK_PRE_TEST:
>> +                return "pre-test";
>> +        case IGT_HOOK_PRE_SUBTEST:
>> +                return "pre-subtest";
>> +        case IGT_HOOK_PRE_DYN_SUBTEST:
>> +                return "pre-dyn-subtest";
>> +        case IGT_HOOK_POST_DYN_SUBTEST:
>> +                return "post-dyn-subtest";
>> +        case IGT_HOOK_POST_SUBTEST:
>> +                return "post-subtest";
>> +        case IGT_HOOK_POST_TEST:
>> +                return "post-test";
>> +        case IGT_HOOK_NUM_EVENTS:
>> +                break;
>> +        /* No "default:" case, to force a warning from -Wswitch in case=
 we miss
>> +         * any new event type. */
>> +        }
>> +        return "?";
>> +}
>> +
>> +static int igt_hook_parse_hook_str(const char *hook_str, evt_mask_t *ev=
t_mask, const char **cmd)
>> +{
>> +        const char *s;
>> +
>> +        if (!strchr(hook_str, ':')) {
>> +                *evt_mask =3D ~0;
>> +                *cmd =3D hook_str;
>> +                return 0;
>> +        }
>> +
>> +        s =3D hook_str;
>> +        *evt_mask =3D 0;
>> +
>> +        while (1) {
>> +                const char *evt_name;
>> +                bool has_match;
>> +                bool is_star;
>> +                enum igt_hook_evt_type evt_type;
>> +
>> +                evt_name =3D s;
>> +
>> +                while (*s !=3D ':' && *s !=3D ',')
>> +                        s++;
>> +
>> +                if (evt_name =3D=3D s)
>> +                        return IGT_HOOK_EVT_EMPTY_NAME;
>> +
>> +                has_match =3D false;
>> +                is_star =3D *evt_name =3D=3D '*' && evt_name + 1 =3D=3D=
 s;
>> +
>> +                for (evt_type =3D IGT_HOOK_PRE_TEST; evt_type < IGT_HOO=
K_NUM_EVENTS; evt_type++) {
>> +                        if (!is_star) {
>> +                                const char *this_event_name =3D igt_hoo=
k_evt_type_to_name(evt_type);
>> +                                size_t len =3D s - evt_name;
>> +
>> +                                if (len !=3D strlen(this_event_name))
>> +                                        continue;
>> +
>> +                                if (strncmp(evt_name, this_event_name, =
len))
>> +                                        continue;
>> +                        }
>> +
>> +                        *evt_mask |=3D 1 << evt_type;
>> +                        has_match =3D true;
>> +
>> +                        if (!is_star)
>> +                                break;
>> +                }
>> +
>> +                if (!has_match)
>> +                        return IGT_HOOK_EVT_NO_MATCH;
>> +
>> +                if (*s++ =3D=3D ':')
>> +                        break;
>> +        }
>> +
>> +        *cmd =3D s;
>> +
>> +        return 0;
>> +}
>> +
>> +static size_t igt_hook_calc_test_fullname_size(struct igt_hook *igt_hoo=
k) {
>> +        /* The maximum size of test_fullname will be the maximum length=
 of
>> +         * "igt@<test_name>@<subtest_name>@<dyn_subtest_name>" plus 1 f=
or the
>> +         * null byte. */
>> +        return (igt_hook->test_name_size +
>> +                igt_hook->subtest_name_size +
>> +                igt_hook->dyn_subtest_name_size) + 4;
>> +}
>> +
>> +static void igt_hook_update_test_fullname(struct igt_hook *igt_hook)
>> +{
>> +        int i;
>> +        char *s;
>> +        const char *values[3] =3D {
>> +                igt_hook->test_name,
>> +                igt_hook->subtest_name,
>> +                igt_hook->dyn_subtest_name,
>> +        };
>> +
>> +        if (igt_hook->test_name[0] =3D=3D '\0') {
>> +                igt_hook->test_fullname[0] =3D '\0';
>> +                return;
>> +        }
>> +
>> +        s =3D stpcpy(igt_hook->test_fullname, "igt");
>> +        for (i =3D 0; i < 3 && values[i][0] !=3D '\0'; i++) {
>> +                *s++ =3D '@';
>> +                s =3D stpcpy(s, values[i]);
>> +        }
>> +}
>> +
>> +/**
>> + * igt_hook_init:
>> + * @hook_str: Hook descriptor string.
>> + * @error: Pointer to error number.
>> + *
>> + * Allocate and initialize an #igt_hook structure.
>> + *
>> + * This function parses the hook descriptor @hook_str and initializes t=
he struct
>> + * to be returned.
>> + *
>> + * The hook descriptor comes from the argument to `--hook` of the test
>> + * executable being run.
>> + *
>> + * If not #NULL, @error is used to store a non-zero error number if an =
error
>> + * happens. A human-readable string for that error number can be obtain=
ed with
>> + * @igt_hook_error_str().
>> + *
>> + * Returns: The pointer to the #igt_hook structure on success or #NULL =
on error.
>> + */
>> +struct igt_hook *igt_hook_init(const char *hook_str, int *error)
>> +{
>> +        int err;
>> +        evt_mask_t evt_mask;
>> +        const char *cmd;
>> +        struct igt_hook *igt_hook =3D NULL;
>> +
>> +
>> +        err =3D igt_hook_parse_hook_str(hook_str, &evt_mask, &cmd);
>> +        if (err)
>> +                goto out;
>> +
>> +        igt_hook =3D calloc(1, sizeof(*igt_hook));
>> +        igt_hook->evt_mask =3D evt_mask;
>> +
>> +        igt_hook->cmd =3D strdup(cmd);
>> +        if (!igt_hook->cmd) {
>> +                err =3D -errno;
>> +                goto out;
>> +        }
>> +
>> +        igt_hook->test_name =3D malloc(TEST_NAME_INITIAL_SIZE);
>> +        igt_hook->test_name_size =3D TEST_NAME_INITIAL_SIZE;
>> +        igt_hook->subtest_name =3D malloc(TEST_NAME_INITIAL_SIZE);
>> +        igt_hook->subtest_name_size =3D TEST_NAME_INITIAL_SIZE;
>> +        igt_hook->dyn_subtest_name =3D malloc(TEST_NAME_INITIAL_SIZE);
>> +        igt_hook->dyn_subtest_name_size =3D TEST_NAME_INITIAL_SIZE;
>> +        igt_hook->test_fullname =3D malloc(igt_hook_calc_test_fullname_=
size(igt_hook));
>> +
>> +        igt_hook->test_name[0] =3D '\0';
>> +        igt_hook->subtest_name[0] =3D '\0';
>> +        igt_hook->dyn_subtest_name[0] =3D '\0';
>> +        igt_hook->test_fullname[0] =3D '\0';
>> +
>> +out:
>> +        if (err) {
>> +                if (error)
>> +                        *error =3D err;
>> +
>> +                igt_hook_free(igt_hook);
>> +
>> +                return NULL;
>> +        }
>> +
>> +        return igt_hook;
>> +}
>> +
>> +/**
>> + * igt_hook_free:
>> + * @igt_hook: The igt_hook struct.
>> + *
>> + * De-initialize an igt_hook struct returned by @igt_hook_init().
>> + *
>> + * This is a no-op if @igt_hook is #NULL.
>> + */
>> +void igt_hook_free(struct igt_hook *igt_hook)
>> +{
>> +        if (!igt_hook)
>> +                return;
>> +
>> +        free(igt_hook->cmd);
>> +        free(igt_hook->test_name);
>> +        free(igt_hook->subtest_name);
>> +        free(igt_hook->dyn_subtest_name);
>> +        free(igt_hook);
>> +}
>> +
>> +static void igt_hook_update_test_name_pre_call(struct igt_hook *igt_hoo=
k, struct igt_hook_evt *evt)
>> +{
>> +        char **name_ptr;
>> +        size_t *size_ptr;
>> +        size_t len;
>> +
>> +        switch (evt->evt_type) {
>> +        case IGT_HOOK_PRE_TEST:
>> +                name_ptr =3D &igt_hook->test_name;
>> +                size_ptr =3D &igt_hook->test_name_size;
>> +                break;
>> +        case IGT_HOOK_PRE_SUBTEST:
>> +                name_ptr =3D &igt_hook->subtest_name;
>> +                size_ptr =3D &igt_hook->subtest_name_size;
>> +                break;
>> +        case IGT_HOOK_PRE_DYN_SUBTEST:
>> +                name_ptr =3D &igt_hook->dyn_subtest_name;
>> +                size_ptr =3D &igt_hook->dyn_subtest_name_size;
>> +                break;
>> +        default:
>> +                return;
>> +        }
>> +
>> +        len =3D strlen(evt->target_name);
>> +        if (len + 1 > *size_ptr) {
>> +                size_t fullname_size;
>> +
>> +                *size_ptr *=3D 2;
>> +                *name_ptr =3D realloc(*name_ptr, *size_ptr);
>> +
>> +                fullname_size =3D igt_hook_calc_test_fullname_size(igt_=
hook);
>> +                igt_hook->test_fullname =3D realloc(igt_hook->test_full=
name, fullname_size);
>> +        }
>> +
>> +        strcpy(*name_ptr, evt->target_name);
>> +        igt_hook_update_test_fullname(igt_hook);
>> +}
>> +
>> +static void igt_hook_update_test_name_post_call(struct igt_hook *igt_ho=
ok, struct igt_hook_evt *evt)
>> +{
>> +        switch (evt->evt_type) {
>> +        case IGT_HOOK_POST_TEST:
>> +                igt_hook->test_name[0] =3D '\0';
>> +                break;
>> +        case IGT_HOOK_POST_SUBTEST:
>> +                igt_hook->subtest_name[0] =3D '\0';
>> +                break;
>> +        case IGT_HOOK_POST_DYN_SUBTEST:
>> +                igt_hook->dyn_subtest_name[0] =3D '\0';
>> +                break;
>> +        default:
>> +                return;
>> +        }
>> +
>> +        igt_hook_update_test_fullname(igt_hook);
>> +}
>> +
>> +static void igt_hook_update_env_vars(struct igt_hook *igt_hook, struct =
igt_hook_evt *evt)
>> +{
>> +        setenv("IGT_HOOK_EVENT", igt_hook_evt_type_to_name(evt->evt_typ=
e), 1);
>> +        setenv("IGT_HOOK_TEST_FULLNAME", igt_hook->test_fullname, 1);
>> +        setenv("IGT_HOOK_TEST", igt_hook->test_name, 1);
>> +        setenv("IGT_HOOK_SUBTEST", igt_hook->subtest_name, 1);
>> +        setenv("IGT_HOOK_DYN_SUBTEST", igt_hook->dyn_subtest_name, 1);
>> +        setenv("IGT_HOOK_RESULT", evt->result ?: "", 1);
>> +}
>> +
>> +/**
>> + * igt_hook_push_evt:
>> + * @igt_hook: The igt_hook structure.
>> + * @evt: The event to be pushed.
>> + *
>> + * Push a new igt_hook event.
>> + *
>> + * This function must be used to register a new igt_hook event. Calling=
 it will
>> + * cause execution of the hook script if the event type matches the fil=
ters
>> + * provided during initialization of @igt_hook.
>> + */
>> +void igt_hook_push_evt(struct igt_hook *igt_hook, struct igt_hook_evt *=
evt)
>> +{
>> +        typeof(igt_hook->evt_mask) evt_bit =3D (1 << evt->evt_type);
>> +
>> +        igt_hook_update_test_name_pre_call(igt_hook, evt);
>> +
>> +        if ((evt_bit & igt_hook->evt_mask)) {
>> +                igt_hook_update_env_vars(igt_hook, evt);
>> +                system(igt_hook->cmd);
>> +        }
>> +
>> +        igt_hook_update_test_name_post_call(igt_hook, evt);
>> +}
>> +
>> +/**
>> + * igt_hook_error_str:
>> + * @error: Non-zero error number.
>> + *
>> + * Return a human-readable string containing a description of an error =
number
>> + * generated by one of the `igt_hook_*` functions.
>> + *
>> + * The string will be the result of strerror() for errors from the C st=
andard
>> + * library or a custom description specific to igt_hook.
>> + */
>> +const char *igt_hook_error_str(int error)
>> +{
>> +        if (!error)
>> +                return "No error";
>> +
>> +        if (error > 0) {
>> +                enum igt_hook_error hook_error =3D error;
>> +
>> +                switch (hook_error) {
>> +                case IGT_HOOK_EVT_EMPTY_NAME:
>> +                        return "Empty name in event descriptor";
>> +                case IGT_HOOK_EVT_NO_MATCH:
>> +                        return "Event name in event descriptor does not=
 match any event type";
>> +                default:
>> +                        return "Unknown error";
>> +                }
>> +        } else {
>> +                return strerror(-error);
>> +        }
>> +}
>> +
>> +/**
>> + * igt_hook_print_help:
>> + * @f: File pointer where to write the output.
>> + * @option_name: Name of the CLI option that accepts the hook descripto=
r.
>> + *
>> + * Print a detailed user help text on hook usage.
>> + */
>> +void igt_hook_print_help(FILE *f, const char *option_name)
>> +{
>> +        fprintf(f, "\
>> +The option %1$s receives as argument a \"hook descriptor\" and allows t=
he\n\
>> +execution of a shell command at different points during execution of te=
sts. Each\n\
>> +such a point is called a \"hook event\".\n\
>> +\n\
>> +Examples:\n\
>> +\n\
>> +  # Prints hook-specic env vars for every event.\n\
>> +  %1$s 'printenv | grep ^IGT_HOOK_'\n\
>> +\n\
>> +  # Equivalent to the above. Useful if command contains ':'.\n\
>> +  %1$s '*:printenv | grep ^IGT_HOOK_'\n\
>> +\n\
>> +  # Adds a line to out.txt containing the result of each test case.\n\
>> +  %1$s 'post-test:echo $IGT_HOOK_TEST_FULLNAME $IGT_HOOK_RESULT >> out.=
txt'\n\
>> +\n\
>> +The accepted format for a hook descriptor is `[<events>:]<cmd>`, where:=
\n\
>> +\n\
>> +  - <events> is a comma-separated list of event descriptors, which defi=
nes the\n\
>> +    set of events be tracked. If omitted, all events are tracked.\n\
>> +\n\
>> +  - <cmd> is a shell command to be executed on the occurrence each trac=
ked\n\
>> +    event. If the command contains ':', then passing <events> is requir=
ed,\n\
>> +    otherwise part of the command would be treated as an event descript=
or.\n\
>> +\n\
>> +", option_name);
>> +
>> +        fprintf(f, "\
>> +An \"event descriptor\" is either the name of an event or the string '*=
'. The\n\
>> +latter matches all event names. The list of possible event names is pro=
vided\n\
>> +below:\n\
>> +\n\
>> +");
>> +
>> +        for (enum igt_hook_evt_type et =3D 0; et < IGT_HOOK_NUM_EVENTS;=
 et++) {
>> +                const char *desc;
>> +
>> +                switch (et) {
>> +                case IGT_HOOK_PRE_TEST:
>> +                        desc =3D "Occurs before a test case starts.";
>> +                        break;
>> +                case IGT_HOOK_PRE_SUBTEST:
>> +                        desc =3D "Occurs before the execution of a subt=
est.";
>> +                        break;
>> +                case IGT_HOOK_PRE_DYN_SUBTEST:
>> +                        desc =3D "Occurs before the execution of a dyna=
mic subtest.";
>> +                        break;
>> +                case IGT_HOOK_POST_DYN_SUBTEST:
>> +                        desc =3D "Occurs after the execution of a dynam=
ic subtest.";
>> +                        break;
>> +                case IGT_HOOK_POST_SUBTEST:
>> +                        desc =3D "Occurs after the execution of a subte=
st.";
>> +                        break;
>> +                case IGT_HOOK_POST_TEST:
>> +                        desc =3D "Occurs after a test case has finished=
.";
>> +                        break;
>> +                default:
>> +                        desc =3D "MISSING DESCRIPTION";
>> +                }
>> +
>> +                fprintf(f, "  %s\n  %s\n\n", igt_hook_evt_type_to_name(=
et), desc);
>> +        }
>> +
>> +        fprintf(f, "\
>> +For each event matched by <events>, <cmd> is executed as a shell comman=
d. The\n\
>> +exit status of the command is ignored. The following environment variab=
les are\n\
>> +available to the command:\n\
>> +\n\
>> +  IGT_HOOK_EVENT\n\
>> +  Name of the current event.\n\
>> +\n\
>> +  IGT_HOOK_TEST_FULLNAME\n\
>> +  Full name of the test in the format `igt@<test>[@<subtest>[@<dyn_subt=
est>]]`.\n\
>> +\n\
>> +  IGT_HOOK_TEST                   \n\
>> +  Name of the current test.\n\
>> +\n\
>> +  IGT_HOOK_SUBTEST\n\
>> +  Name of the current subtest. Will be the empty string if not running =
a\n\
>> +  subtest.\n\
>> +\n\
>> +  IGT_HOOK_DYN_SUBTEST\n\
>> +  Name of the current dynamic subtest. Will be the empty string if not =
running a\n\
>> +  dynamic subtest.\n\
>> +\n\
>> +  IGT_HOOK_RESULT\n\
>> +  String representing the result of the test/subtest/dynamic subtest. P=
ossible\n\
>> +  values are: SUCCESS, SKIP or FAIL. This is only applicable on \"post-=
*\"\n\
>> +  events and will be the empty string for other types of events.\n\
>> +\n\
>> +");
>> +}
>> diff --git a/lib/igt_hook.h b/lib/igt_hook.h
>> new file mode 100644
>> index 000000000000..6fef7254a317
>> --- /dev/null
>> +++ b/lib/igt_hook.h
>> @@ -0,0 +1,86 @@
>> +/*
>> + * Copyright =C2=A9 2024 Intel Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g a
>> + * copy of this software and associated documentation files (the "Softw=
are"),
>> + * to deal in the Software without restriction, including without limit=
ation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublice=
nse,
>> + * and/or sell copies of the Software, and to permit persons to whom th=
e
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice (including the=
 next
>> + * paragraph) shall be included in all copies or substantial portions o=
f the
>> + * Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT S=
HALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR=
 OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER =
DEALINGS
>> + * IN THE SOFTWARE.
>> + */
>> +#ifndef IGT_HOOK_H
>> +#define IGT_HOOK_H
>> +
>> +#include <stdio.h>
>> +
>> +/**
>> + * igt_hook:
>> + *
>> + * Opaque struct to hold data related to hook support.
>> + */
>> +struct igt_hook;
>> +
>> +/**
>> + * igt_hook_evt_type:
>> + * @IGT_HOOK_PRE_TEST: Occurs before a test case (executable) starts th=
e
>> + * test code.
>> + * @IGT_HOOK_PRE_SUBTEST: Occurs before the execution of a subtest.
>> + * @IGT_HOOK_PRE_DYN_SUBTEST: Occurs before the execution of a dynamic =
subtest.
>> + * @IGT_HOOK_POST_DYN_SUBTEST: Occurs after the execution of a dynamic =
subtest.
>> + * @IGT_HOOK_POST_SUBTEST: Occurs after the execution of a subtest..
>> + * @IGT_HOOK_POST_TEST: Occurs after a test case (executable) is finish=
ed with
>> + * the test code.
>> + * @IGT_HOOK_NUM_EVENTS: This is not really an event and represents the=
 number
>> + * of possible events tracked by igt_hook.
>> + *
>> + * Events tracked by igt_hook. Those events occur at specific points du=
ring the
>> + * execution of a test.
>> + */
>> +enum igt_hook_evt_type {
>> +        IGT_HOOK_PRE_TEST,
>> +        IGT_HOOK_PRE_SUBTEST,
>> +        IGT_HOOK_PRE_DYN_SUBTEST,
>> +        IGT_HOOK_POST_DYN_SUBTEST,
>> +        IGT_HOOK_POST_SUBTEST,
>> +        IGT_HOOK_POST_TEST,
>> +        IGT_HOOK_NUM_EVENTS /* This must always be the last one. */
>> +};
>> +
>> +/**
>> + * igt_hook_evt:
>> + * @evt_type: Type of event.
>> + * @target_name: A string pointing to the name of the test, subtest or =
dynamic
>> + * subtest, depending on @evt_type.
>> + * @result: A string containing the result of the test, subtest or dyna=
mic
>> + * subtest. This is only applicable for the `IGT_HOOK_POST_\*' event ty=
pes;
>> + * other types must initialize this to #NULL.
>> + *
>> + * An event tracked by igt_hook, which is done with @igt_hook_push_evt(=
). This must
>> + * be zero initialized and fields relevant to the event type must be se=
t before
>> + * passing its reference to @igt_hook_push_evt().
>> + */
>> +struct igt_hook_evt {
>> +        enum igt_hook_evt_type evt_type;
>> +        const char *target_name;
>> +        const char *result;
>> +};
>> +
>> +struct igt_hook *igt_hook_init(const char *hook_str, int *error);
>> +void igt_hook_free(struct igt_hook *igt_hook);
>> +void igt_hook_push_evt(struct igt_hook *igt_hook, struct igt_hook_evt *=
evt);
>> +const char *igt_hook_error_str(int error);
>> +void igt_hook_print_help(FILE *f, const char *option_name);
>> +
>> +#endif /* IGT_HOOK_H */
>> diff --git a/lib/meson.build b/lib/meson.build
>> index e2f740c116f8..10b8066647f2 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -109,6 +109,7 @@ lib_sources =3D [
>>          'veboxcopy_gen12.c',
>>          'igt_msm.c',
>>          'igt_dsc.c',
>> +        'igt_hook.c',
>>          'xe/xe_gt.c',
>>          'xe/xe_ioctl.c',
>>          'xe/xe_mmio.c',
>> diff --git a/lib/tests/igt_hook.c b/lib/tests/igt_hook.c
>> new file mode 100644
>> index 000000000000..bd7e570f9607
>> --- /dev/null
>> +++ b/lib/tests/igt_hook.c
>> @@ -0,0 +1,187 @@
>> +/*
>> + * Copyright =C2=A9 2024 Intel Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g a
>> + * copy of this software and associated documentation files (the "Softw=
are"),
>> + * to deal in the Software without restriction, including without limit=
ation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublice=
nse,
>> + * and/or sell copies of the Software, and to permit persons to whom th=
e
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice (including the=
 next
>> + * paragraph) shall be included in all copies or substantial portions o=
f the
>> + * Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT S=
HALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR=
 OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER =
DEALINGS
>> + * IN THE SOFTWARE.
>> + */
>> +#include <stdbool.h>
>> +#include <stdio.h>
>> +#include <unistd.h>
>> +
>> +#include "igt_core.h"
>> +#include "igt_hook.h"
>> +
>> +static const char *env_var_names[] =3D {
>> +        "IGT_HOOK_EVENT",
>> +        "IGT_HOOK_TEST_FULLNAME",
>> +        "IGT_HOOK_TEST",
>> +        "IGT_HOOK_SUBTEST",
>> +        "IGT_HOOK_DYN_SUBTEST",
>> +        "IGT_HOOK_RESULT",
>> +};
>> +
>> +#define num_env_vars (sizeof(env_var_names) / sizeof(env_var_names[0]))
>> +
>> +static int env_var_name_lookup(char *line)
>> +{
>> +        int i;
>> +        char *c;
>> +
>> +        c =3D strchr(line, '=3D');
>> +        if (c)
>> +                *c =3D '\0';
>> +
>> +        for (i =3D 0; i < num_env_vars; i++)
>> +                if (!strcmp(line, env_var_names[i]))
>> +                        goto out;
>> +
>> +        i =3D -1;
>> +out:
>> +        if (c)
>> +                *c =3D '=3D';
>> +
>> +        return i;
>> +}
>> +
>> +static void test_null_error_pointer(void)
>> +{
>> +        struct igt_hook *igt_hook;
>> +
>> +        /* Ensure passing NULL error pointer does not cause issues. */
>> +        igt_hook =3D igt_hook_init("invalid:echo hello", NULL);
>> +        igt_assert(igt_hook =3D=3D NULL);
>> +}
>> +
>> +static void test_invalid_hook_descriptors(void)
>> +{
>> +        struct {
>> +                const char *name;
>> +                const char *hook_desc;
>> +        } invalid_cases[] =3D {
>> +                {"invalid-event-name", "invalid-event:echo hello"},
>> +                {"invalid-empty-event-name", ":echo hello"},
>> +                {"invalid-colon-in-cmd", "echo hello:world"},
>> +                {},
>> +        };
>> +
>> +        for (int i =3D 0; invalid_cases[i].name; i++) {
>> +                igt_subtest(invalid_cases[i].name) {
>> +                        int err =3D 0;
>> +                        struct igt_hook *igt_hook;
>> +
>> +                        igt_hook =3D igt_hook_init(invalid_cases[i].hoo=
k_desc, &err);
>> +                        igt_assert(igt_hook =3D=3D NULL);
>> +                        igt_assert(err !=3D 0);
>> +                }
>> +        }
>> +}
>> +
>> +static void test_print_help(void)
>> +{
>> +        char *buf;
>> +        size_t len;
>> +        FILE *f;
>> +        const char expected_initial_text[] =3D "The option --hook recei=
ves as argument a \"hook descriptor\"";
>> +
>> +        f =3D open_memstream(&buf, &len);
>> +        igt_assert(f);
>> +
>> +        igt_hook_print_help(f, "--hook");
>> +        fclose(f);
>> +
>> +        igt_assert(!strncmp(buf, expected_initial_text, sizeof(expected=
_initial_text) - 1));
>> +
>> +        /* This is an extra check to catch a case where an event type i=
s added
>> +         * without a proper description. */
>> +        igt_assert(!strstr(buf, "MISSING DESCRIPTION"));
>> +
>> +        free(buf);
>> +}
>> +
>> +static void test_all_env_vars(void)
>> +{
>> +        struct igt_hook_evt evt =3D {
>> +                .evt_type =3D IGT_HOOK_PRE_SUBTEST,
>> +                .target_name =3D "foo",
>> +        };
>> +        bool env_vars_checklist[num_env_vars] =3D {};
>> +        struct igt_hook *igt_hook;
>> +        char *hook_str;
>> +        FILE *f;
>> +        int pipefd[2];
>> +        int ret;
>> +        int i;
>> +        char *line;
>> +        size_t line_size;
>> +
>> +        ret =3D pipe(pipefd);
>> +        igt_assert(ret =3D=3D 0);
>> +
>> +        /* Use grep to filter only env var set by us. This should ensur=
e that
>> +         * writing to the pipe will not block due to capacity, since we=
 only
>> +         * read from the pipe after the shell command is done. */
>> +        ret =3D asprintf(&hook_str, "printenv -0 | grep -z ^IGT_HOOK >&=
%d", pipefd[1]);
>> +        igt_assert(ret > 0);
>> +
>> +        igt_hook =3D igt_hook_init(hook_str, NULL);
>> +        igt_assert(igt_hook);
>> +
>> +        igt_hook_push_evt(igt_hook, &evt);
>> +
>> +        close(pipefd[1]);
>> +        f =3D fdopen(pipefd[0], "r");
>> +        igt_assert(f);
>> +
>> +        line =3D NULL;
>> +        line_size =3D 0;
>> +
>> +        while (getdelim(&line, &line_size, '\0', f) !=3D -1) {
>> +                ret =3D env_var_name_lookup(line);
>> +                igt_assert_f(ret >=3D 0, "Unexpected env var %s\n", lin=
e);
>> +                env_vars_checklist[ret] =3D true;
>> +        }
>> +
>> +        for (i =3D 0; i < num_env_vars; i++)
>> +                igt_assert_f(env_vars_checklist[i], "Missing env var %s=
\n", env_var_names[i]);
>> +
>> +        fclose(f);
>> +        igt_hook_free(igt_hook);
>> +        free(hook_str);
>> +        free(line);
>> +}
>> +
>> +igt_main
>> +{
>> +        igt_subtest("null-error-pointer")
>> +                test_null_error_pointer();
>> +
>> +        test_invalid_hook_descriptors();
>> +
>> +        igt_subtest("help-description")
>> +                test_print_help();
>> +
>> +        igt_subtest_group {
>> +                igt_fixture {
>> +                        igt_require_f(system(NULL), "Shell seems not to=
 be available\n");
>> +                }
>> +
>> +                igt_subtest("all-env-vars")
>> +                        test_all_env_vars();
>> +        }
>> +}
>> diff --git a/lib/tests/igt_hook_integration.c b/lib/tests/igt_hook_integ=
ration.c
>> new file mode 100644
>> index 000000000000..56632b13ae81
>> --- /dev/null
>> +++ b/lib/tests/igt_hook_integration.c
>> @@ -0,0 +1,297 @@
>> +/*
>> + * Copyright =C2=A9 2024 Intel Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g a
>> + * copy of this software and associated documentation files (the "Softw=
are"),
>> + * to deal in the Software without restriction, including without limit=
ation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublice=
nse,
>> + * and/or sell copies of the Software, and to permit persons to whom th=
e
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice (including the=
 next
>> + * paragraph) shall be included in all copies or substantial portions o=
f the
>> + * Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT S=
HALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR=
 OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER =
DEALINGS
>> + * IN THE SOFTWARE.
>> + */
>> +#include <stdbool.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +
>> +#include "igt_core.h"
>> +
>> +#include "igt_tests_common.h"
>> +
>> +char prog[] =3D "igt_hook_integration";
>> +char hook_opt[] =3D "--hook";
>> +char hook_str[128];
>> +char *fake_argv[] =3D {prog, hook_opt, hook_str};
>> +int fake_argc =3D sizeof(fake_argv) / sizeof(fake_argv[0]);
>> +
>> +#define ENV_ARRAY(evt_name, fullname_suffix, subtest, dyn_subtest, resu=
lt) \
>> +{ \
>> +        "IGT_HOOK_EVENT=3D" evt_name, \
>> +        "IGT_HOOK_TEST_FULLNAME=3Digt@igt_hook_integration" fullname_su=
ffix, \
>> +        "IGT_HOOK_TEST=3Digt_hook_integration", \
>> +        "IGT_HOOK_SUBTEST=3D" subtest, \
>> +        "IGT_HOOK_DYN_SUBTEST=3D" dyn_subtest, \
>> +        "IGT_HOOK_RESULT=3D" result, \
>> +}
>> +
>> +#define TEST_ENV(evt_name, result) \
>> +        ENV_ARRAY(evt_name, "", "", "", result)
>> +
>> +#define SUBTEST_ENV(evt_name, subtest, result) \
>> +        ENV_ARRAY(evt_name, "@" subtest, subtest, "", result)
>> +
>> +#define DYN_SUBTEST_ENV(evt_name, subtest, dyn_subtest, result) \
>> +        ENV_ARRAY(evt_name, "@" subtest "@" dyn_subtest, subtest, dyn_s=
ubtest, result)
>> +
>> +const char *pre_test_env[] =3D TEST_ENV("pre-test", "");
>> +const char *pre_subtest_a_env[] =3D SUBTEST_ENV("pre-subtest", "a", "")=
;
>> +const char *pre_dyn_subtest_a_success_env[] =3D DYN_SUBTEST_ENV("pre-dy=
n-subtest", "a", "success", "");
>> +const char *post_dyn_subtest_a_success_env[] =3D DYN_SUBTEST_ENV("post-=
dyn-subtest", "a", "success", "SUCCESS");
>> +const char *pre_dyn_subtest_a_failed_env[] =3D DYN_SUBTEST_ENV("pre-dyn=
-subtest", "a", "failed", "");
>> +const char *post_dyn_subtest_a_failed_env[] =3D DYN_SUBTEST_ENV("post-d=
yn-subtest", "a", "failed", "FAIL");
>> +const char *pre_dyn_subtest_a_skipped_env[] =3D DYN_SUBTEST_ENV("pre-dy=
n-subtest", "a", "skipped", "");
>> +const char *post_dyn_subtest_a_skipped_env[] =3D DYN_SUBTEST_ENV("post-=
dyn-subtest", "a", "skipped", "SKIP");
>> +const char *post_subtest_a_env[] =3D SUBTEST_ENV("post-subtest", "a", "=
FAIL");
>> +const char *pre_subtest_b_env[] =3D SUBTEST_ENV("pre-subtest", "b", "")=
;
>> +const char *post_subtest_b_env[] =3D SUBTEST_ENV("post-subtest", "b", "=
SUCCESS");
>> +const char *post_test_env[] =3D TEST_ENV("post-test", "FAIL");
>> +
>> +#define num_env_vars (sizeof(pre_test_env) / sizeof(pre_test_env[0]))
>> +
>> +__noreturn static void fake_main(void)
>> +{
>> +        igt_subtest_init(fake_argc, fake_argv);
>> +
>> +        igt_subtest_with_dynamic("a") {
>> +                igt_dynamic("success") {
>> +                        igt_info("...@a@success\n");
>> +                }
>> +
>> +                igt_dynamic("failed") {
>> +                        igt_assert_f(false, "Fail on purpose\n");
>> +                        igt_info("...@a@failed\n");
>> +                }
>> +
>> +                igt_dynamic("skipped") {
>> +                        igt_require_f(false, "Skip on purpose\n");
>> +                        igt_info("...@a@skipped\n");
>> +                }
>> +        }
>> +
>> +        igt_subtest("b") {
>> +                igt_info("...@b\n");
>> +        }
>> +
>> +        igt_exit();
>> +}
>> +
>> +static void test_invalid_hook_str(void)
>> +{
>> +        int status;
>> +        pid_t pid;
>> +        static char err[4096];
>> +        int errfd;
>> +
>> +        sprintf(hook_str, "invalid-event:echo hello");
>> +
>> +        pid =3D do_fork_bg_with_pipes(fake_main, NULL, &errfd);
>> +
>> +        read_whole_pipe(errfd, err, sizeof(err));
>> +
>> +        internal_assert(safe_wait(pid, &status) !=3D -1);
>> +        internal_assert_wexited(status, IGT_EXIT_INVALID);
>> +
>> +        internal_assert(strstr(err, "Failed to initialize hook data:"))=
;
>> +
>> +        close(errfd);
>> +}
>> +
>> +static bool match_env(FILE *hook_out_stream, const char **expected_env)
>> +{
>> +        int i;
>> +        char hook_env_buf[4096];
>> +        size_t buf_len =3D 0;
>> +        char *line =3D NULL;
>> +        size_t line_size;
>> +        bool env_checklist[num_env_vars] =3D {};
>> +        bool has_unexpected =3D false;
>> +        bool has_missing =3D false;
>> +
>> +        /* Store env from hook so we can show it in case of errors */
>> +        while (getdelim(&line, &line_size, '\0', hook_out_stream) !=3D =
-1) {
>> +                internal_assert(buf_len + strlen(line) + 1 <=3D sizeof(=
hook_env_buf));
>> +                strcpy(hook_env_buf + buf_len, line);
>> +                buf_len +=3D strlen(line) + 1;
>> +
>> +                if (!strcmp(line, "---"))
>> +                        break;
>> +        }
>> +
>> +        if (!expected_env && !buf_len) {
>> +                /* We have consumed everything and we are done now. */
>> +                return false;
>> +        }
>> +
>> +
>> +        if (!expected_env) {
>> +                printf("Detected unexpected hook execution\n");
>> +                has_unexpected =3D true;
>> +                goto out;
>> +        }
>> +
>> +        if (!buf_len) {
>> +                printf("Expected more hook execution, but none found\n"=
);
>> +                has_missing =3D true;
>> +                goto out;
>> +        }
>> +
>> +
>> +        line =3D hook_env_buf;
>> +        while (strcmp(line, "---")) {
>> +                for (i =3D 0; i < num_env_vars; i++) {
>> +                        if (!strcmp(line, expected_env[i])) {
>> +                                env_checklist[i] =3D true;
>> +                                break;
>> +                        }
>> +                }
>> +
>> +                if (i =3D=3D num_env_vars) {
>> +                        printf("Unexpected envline from hook: %s\n", li=
ne);
>> +                        has_unexpected =3D true;
>> +                }
>> +
>> +                line +=3D strlen(line) + 1;
>> +        }
>> +
>> +        for (i =3D 0; i < num_env_vars; i++) {
>> +                if (!env_checklist[i]) {
>> +                        has_missing =3D true;
>> +                        printf("Missing expected envline: %s\n", expect=
ed_env[i]);
>> +                }
>> +        }
>> +
>> +out:
>> +        if (has_unexpected || has_missing) {
>> +                if (expected_env) {
>> +                        printf("Expected environment:\n");
>> +                        for (i =3D 0; i < num_env_vars; i++)
>> +                                printf("  %s\n", expected_env[i]);
>> +                }
>> +
>> +                if (buf_len) {
>> +                        printf("Environment from hook:\n");
>> +                        line =3D hook_env_buf;
>> +                        while (strcmp(line, "---")) {
>> +                                printf("  %s\n", line);
>> +                                line +=3D strlen(line) + 1;
>> +                        }
>> +                } else {
>> +                        printf("No hook execution found\n");
>> +                }
>> +        }
>> +
>> +        internal_assert(!has_unexpected);
>> +        internal_assert(!has_missing);
>> +
>> +        /* Ready to consume next hook output. */
>> +        return true;
>> +}
>> +
>> +static void run_tests_and_match_env(const char *evt_descriptors, const =
char **expected_envs[])
>> +{
>> +        int i;
>> +        int ret;
>> +        int pipefd[2];
>> +        pid_t pid;
>> +        FILE *f;
>> +
>> +        ret =3D pipe(pipefd);
>> +        internal_assert(ret =3D=3D 0);
>> +
>> +        /* Use grep to filter only env var set by us. This should ensur=
e that
>> +         * writing to the pipe will not block due to capacity, since we=
 only
>> +         * read from the pipe after the shell command is done. */
>> +        sprintf(hook_str,
>> +                "%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; echo -en =
---\\\\x00 >&%2$d",
>> +                evt_descriptors,
>> +                pipefd[1]);
>> +
>> +        pid =3D do_fork_bg_with_pipes(fake_main, NULL, NULL);
>> +        internal_assert(safe_wait(pid, &ret) !=3D -1);
>> +        internal_assert_wexited(ret, IGT_EXIT_FAILURE);
>> +
>> +        close(pipefd[1]);
>> +        f =3D fdopen(pipefd[0], "r");
>> +        internal_assert(f);
>> +
>> +        while (match_env(f, expected_envs[i]))
>> +                i++;
>> +
>> +        fclose(f);
>> +
>> +}
>> +
>> +int main(int argc, char **argv)
>> +{
>> +        {
>> +                printf("Check invalid hook string\n");
>> +                test_invalid_hook_str();
>> +        }
>> +
>> +        {
>> +                const char **expected_envs[] =3D {
>> +                        pre_test_env,
>> +                        pre_subtest_a_env,
>> +                        pre_dyn_subtest_a_success_env,
>> +                        post_dyn_subtest_a_success_env,
>> +                        pre_dyn_subtest_a_failed_env,
>> +                        post_dyn_subtest_a_failed_env,
>> +                        pre_dyn_subtest_a_skipped_env,
>> +                        post_dyn_subtest_a_skipped_env,
>> +                        post_subtest_a_env,
>> +                        pre_subtest_b_env,
>> +                        post_subtest_b_env,
>> +                        post_test_env,
>> +                        NULL,
>> +                };
>> +
>> +                printf("Check full event tracking\n");
>> +                run_tests_and_match_env("*", expected_envs);
>> +        }
>> +
>> +        {
>> +                const char **expected_envs[] =3D {
>> +                        pre_dyn_subtest_a_success_env,
>> +                        pre_dyn_subtest_a_failed_env,
>> +                        pre_dyn_subtest_a_skipped_env,
>> +                        NULL,
>> +                };
>> +
>> +                printf("Check single event type tracking\n");
>> +                run_tests_and_match_env("pre-dyn-subtest", expected_env=
s);
>> +        }
>> +
>> +        {
>> +                const char **expected_envs[] =3D {
>> +                        pre_subtest_a_env,
>> +                        post_dyn_subtest_a_success_env,
>> +                        post_dyn_subtest_a_failed_env,
>> +                        post_dyn_subtest_a_skipped_env,
>> +                        pre_subtest_b_env,
>> +                        NULL,
>> +                };
>> +
>> +                printf("Check multiple event types tracking\n");
>> +                run_tests_and_match_env("post-dyn-subtest,pre-subtest",=
 expected_envs);
>> +        }
>> +}
>> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
>> index fa3d81de6cef..df8092638eca 100644
>> --- a/lib/tests/meson.build
>> +++ b/lib/tests/meson.build
>> @@ -10,6 +10,8 @@ lib_tests =3D [
>>          'igt_exit_handler',
>>          'igt_fork',
>>          'igt_fork_helper',
>> +        'igt_hook',
>> +        'igt_hook_integration',
>>          'igt_ktap_parser',
>>          'igt_list_only',
>>          'igt_invalid_subtest_name',
>> --=20
>> 2.45.0
>>
