Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05987CCD182
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 07:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CE210E549;
	Wed, 18 Sep 2024 07:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mvU2hbav";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9499F10E549
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 07:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726643905; x=1758179905;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KJtA4GVeMd8gber7vsRACGh5gAJ1jVC10HWQ2yHEUUE=;
 b=mvU2hbav1KjN5w1Wr4kLDVoCrt0hbzlnCteHuZsPB8pEyF0/mn17Vuj0
 pWOXaFLSxF8xA8aNI/zDWiIGrMxfgw48ZIQgaQTSVbuQtsx0KyZkSZxww
 VyWJ9G/JJj3EIn9NRq+dW639Vkizfowe5v175T8xudU8Jjleap+3aDlFU
 9HYQ0UfuGsmyO7TcZZSWKhSqik+nS8iCDfdHGlEzkbivcV+djlY8tgOFS
 3kLOLAch/jCW+in073WXhMdvUdbYuYsWl5LTNazxCA/VxHRII5BQD81K7
 eLROfw1CEojwXKm8PMo8lb7NlCf88ql5EEFrz7gImdVNZtePc+mPjm1e3 g==;
X-CSE-ConnectionGUID: 7IS1nFL0Ti+tGciPG/5vuA==
X-CSE-MsgGUID: NTJ+poIlSHSeY/iKn/vdyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25731192"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25731192"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:18:25 -0700
X-CSE-ConnectionGUID: Udo0AzB1QZqCl0kJwhTo3A==
X-CSE-MsgGUID: AvOLxZssT/ykI1x1Z9jb4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="100282091"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 00:18:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 00:18:24 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 00:18:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 00:18:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 00:18:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3DYxLTUm+kXTfglizrBhVvxUnO4HyZSR0AvW6pcctFInV1/G0keLoRPTJM8qIhqVu7A5perhpn0pv7QB5sxyDIMFwr90tlC5zPofI44D4gnbCavRLxcOATeiu2FftKjvTK5r/NxGGMa/UQQtMiX3NzOg6yksWK8gL1+hqQEweInL6g3xRP+NVvsfeqaHpVwK/yXls3zcTmqFANqvInicLKtkqzC3Wa4gqAjIe08NDc2acNf/rzGaUopuNqb6knCO4OhopGmVOiyEDCawhcFYhNwl/tTmTcJiTQTL09J/q4t0ATiV8zslZxjf+wCR10AWAW9RzvIpossdQbFGt1yyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8q5qxZVF/FAbFKu+Ncbxomlck8kQ2yJHOpZ1jqiXwnI=;
 b=t4RaY1xj9nP4FHeKehu6+cEaMYcGDUG4lRU+G6h63x8yM80MLl/BTFWBSHbF3Pu59i600ngP7iaqVxjmP/IxcwgyB8nc0go52rBnQWJIQtwKu5ATtdda4IOUyRwV8QtOFmDHVDFYLrbbh6w1dO2ygz2ockrFSnnlhGWsBP2xZKlLe2IkIaBTVNyA3IC1CUL3qpY8fjoXXMaugJIAKshC0SLnIc0okFHYgNe1l6+KUkfyl4IXUjaZwwvuPvedYMwa7F0p9OTp7s35TDc/JVMjjnSdrRYPZ7+92RK6b4KiteFj15SDmKDp8Ckiq7rrfV4KPs4XEu+aS3NCY8dnQ6SQug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 07:18:21 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%3]) with mapi id 15.20.7982.016; Wed, 18 Sep 2024
 07:18:21 +0000
Message-ID: <16f7b9a9-52cc-4db4-a84e-4371984eaa5c@intel.com>
Date: Wed, 18 Sep 2024 12:48:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_joiner: Add subtests for force ultra
 joiner validation
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <kunal1.joshi@intel.com>
References: <20240812044739.5630-1-karthik.b.s@intel.com>
 <20240812044739.5630-3-karthik.b.s@intel.com>
 <450e8e3e-c411-40cc-a4e8-9dd3b667e420@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <450e8e3e-c411-40cc-a4e8-9dd3b667e420@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: eeda5681-4c86-4631-e0d4-08dcd7b21339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y21aN3NyTUxqTjhKbVEwVUFjTStCY2lGVkdWVTNhbUc3SE03MFpHTmY3OXlO?=
 =?utf-8?B?cWhuNyt5TkZpL0JmUFZNbVNwNWtEN3lmNGkralRIb0ZGQXNJcjJiMVE0N096?=
 =?utf-8?B?bVRKRHNOTkczbFo2UnBRa3RMVkZIZlNUTW1nVXdzeHpHUWpJRUQraUFaZnQy?=
 =?utf-8?B?UTlQRTFGZjZubC92VisrRTREempaVDJncGY2MmVmcm1yVzJFTGw1cGlXcy9n?=
 =?utf-8?B?dzFOVHY0ZXVaV1dGdmVqeXRObjMvbjdRZDdHbjJjTnRJblFWc1ppak1kdDZI?=
 =?utf-8?B?bDl1dmRIbjNJZGwvZ3BKL0ZmMUEvU0hnKy9HUm9tUExqTGRaSHlxT2hqWmtp?=
 =?utf-8?B?VUVSbERnTDFtMmFhdVFDNkpZL1I3c2diWTlQd3BRWmc4VG5mMHkramFZcElH?=
 =?utf-8?B?TVQ5OHROLytveU9aYm5ET0Jna1ZWczNGV3Fza0FuM0pReWZUS3VTa0VLSEZN?=
 =?utf-8?B?ZjI5WjNrcW04dzRtS1hBVEhwaFdJVGVEdGZCVjVXL2xHWEEyclVWREQwQVlt?=
 =?utf-8?B?ckJtR3h5ejQ1L2NPWGNYSVB0eGtCcTJFQWpOQTlBd0w0djFCV3ZVbnBxdVNh?=
 =?utf-8?B?Vys2diszWGZSdFg0UE1DTmhRVWVhTWF1d1lSZzBlZU1hdHVUeWNQOHc1bjZj?=
 =?utf-8?B?TlhzbU1lVFNVd3E5eE9wM3JKZnJNM1dtNHNFYitFYjkzQ0wvQUlVbk5JdE0z?=
 =?utf-8?B?eldSVVY2NFdFT29pNWJQdmFIVjlTVlViSno5T1dwUzFocWg5MkFCaFhiTGIy?=
 =?utf-8?B?YzVqQ3VuYzZkNm51TU8yUzhQdGJuaXpLelQxRkN4VFNJWXFrbUYrd2RQSzQ4?=
 =?utf-8?B?cis1K1l2dDBGYWp4YVJPYmtrbCtJdGFwd0Q3NUplSzVuSENwMmRjVXN0dlB2?=
 =?utf-8?B?ZTBKWW5wZWlPai9ib3VNQmxGWEppcXliQnR0Sno3Sjk4Vm8wS25uZ01MTDVR?=
 =?utf-8?B?Uzd4ZTkxbjFsV1dOSGN6ZXJiNEl2QUhnV3czSW5sc1c0LzgrbnFURmNvdlI5?=
 =?utf-8?B?d051NXVQWWMyNFp3YXJOSmZ4WWx6K0JxdENpN0EzRzBhdUg4OVNCMTNoMjZt?=
 =?utf-8?B?eFpvU291cXEvaXlSRG5nekxWL3ByZElLZy9ZdGJuSldjaGRaMVUvTzZQY3FS?=
 =?utf-8?B?TVQ0VTdxMTNRaG1yekhzeExmb01SMXNyZDZSUnZMQmVTMm5yU1h5aEtNdDJp?=
 =?utf-8?B?Qk04TmRIR2xoeXQ2OXM2THcrM0lZeGhoYmR1SkI2Y1A3N0lxbzNZblNxQ3U1?=
 =?utf-8?B?OCthRlFvN0s1UWRZeHBjQ2dCaXR5L2VGMEFJSzZoU3BMTXJRYXJtSlNQZmpx?=
 =?utf-8?B?VUFpNllMeCtQNXdkQy9uMUx3Y1NHSVVxR1pvRDU5djFGa0ZrSUx3a2FzNlg3?=
 =?utf-8?B?WUgxTGpzUFptbjJzV2hOcVhoeW9sSldKYmVnSHc5UDRGeStueXBieWhJWVha?=
 =?utf-8?B?VE9WRjFVa3piWVBiS0N6aXF5Y2ZXSVdLcHBNUGVNTHBwMWpCWjliMHBtaVlv?=
 =?utf-8?B?YTJBbGtVakgzM0l2SVhpL2FMcjZuUG5OTEM0N1JVcUNxNjV6N0RKeHpQVStQ?=
 =?utf-8?B?bGpTdVRPaVRDNlZPeWdNVnFoSTR2ak9XVzBjSkZQT1pTMEZGYUxNQTROcVdm?=
 =?utf-8?B?Ylh1QXNONkc2Q2NUZFF3b3hjdG9QSEdDcjVCZ2VXRDNkTjVYTngrQWJka3V5?=
 =?utf-8?B?K3RzK1NOOEtuWE83TUM4N09HRGNrSkE3Znd2ckExVnZYVWxaeE11NFJNSW5N?=
 =?utf-8?B?Smt4RHFXQi9CaExOekI5VHFWN2crcUtlS3p0K3RHN21IR2JvVnk4RjZLN01V?=
 =?utf-8?B?U1dvUnk4VmpBbEt1UnJIUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3hxNFdkUHcrUkJhb0hWdFJQQVFJWDlyNUhTZnBESzZDSSt0TFdtZmpvb2I1?=
 =?utf-8?B?em50c2JKSElwWVdqamlqQ3BoT1I3V082ZHVVa1JPZFVsOE1iNmZMdzU2a3R6?=
 =?utf-8?B?KzBjdlp4Sk8weW03ODVtRFVKdTdMaTM3MlhMRGJYc1k0dWlRcXgxeUJGWTEr?=
 =?utf-8?B?Nmc1MDJkRXpjemZtTmJqWDNLMzJSb1R6T21WSzRYOGkray9uM1pSMG43Qzgx?=
 =?utf-8?B?blRQekk3Ym1leUN1SFBKZkhHU3piaUNsNi9qOVhVZmdDVmFINWMyb0NBMWVr?=
 =?utf-8?B?Qmk4OG1MZGRHaHhTUkE4T2R0UjlpdUZCcnFGYlJoaE53K0xwMElsUzdYekNJ?=
 =?utf-8?B?Sk5Cb2ZPQ3VuM284TThjdk5MZTB4b2crSHdSS2RoRXpNdElUd3VmdmtlUWJq?=
 =?utf-8?B?eDZMcHQyMEtTVE5aQ3pRbERxQzZvZDN5VHRUTXZTNjd0SWNJTmgwSHBJOGor?=
 =?utf-8?B?aVhwT2NUQ2ZENCtNK3B6Vk1LU0p2akRZb0w1SjJ3cFZ4cURSNDFkcUg1VTVz?=
 =?utf-8?B?N2hseDlOV3BHUldFMFF4b20rRG1xN1Z6a2J3blY1WEpJMkQ0WE9lUVVUbnp0?=
 =?utf-8?B?SU0yS29JWDVxOEtmVEdCdW1ML2lkaVZ0c3hGL1UvVEhmakFrQ000TFg2Ykdi?=
 =?utf-8?B?Wk9MOW44VUo5bVZzVkY1eUUxaGF3Y1cvY29STmFxRU9xMGkvczhxUWJ6d2tv?=
 =?utf-8?B?U1FGZTd2NEFNNEtUb1J5T3M0Y0xrMUFvbldCUm85UUlSMmdNcVpMUE53SVdH?=
 =?utf-8?B?WTJSWHVqNTVQcnFLcEZHNjk0UlIyU3BBajRSN2pEQzlvTlFiQmVqbDZieEsx?=
 =?utf-8?B?ZnhLWWxWRS9pNWgyejR3Ym9JdVd5WXdPYldnOUhma20vMDB6Lzc1Z00xNHBm?=
 =?utf-8?B?M2ZCd1pBWENZd1ROTzRRUVBCN3M0dGJOakU2UDN5aWJTakU1WjFBTWdGR09z?=
 =?utf-8?B?Z21BYTJ6VEZsd2EyS0d1ZGFyTEpBbGZndHhnM2VMN3JpR0U3WEJQaExvc0NL?=
 =?utf-8?B?Ty9VcldVZkVzanhjMGNlVjUrdFFRTFpBZVlZell0ZjJrZGxHekdoMkgxcU9D?=
 =?utf-8?B?aFRvY29uUENNSFg2Nk4yeGNBalVmbEU2VzJsUHVGZ3kwOVY4NW02RDIvdE1D?=
 =?utf-8?B?aTA0TjZYK0NPS0pPSVY2L1lnRVF6aXM0SEVpYXdTQlc1QWZadEpYV2JRVEUr?=
 =?utf-8?B?TS9VZ1FaQlJYMnhGSFoybUI2bDZLczVKNHJxeEg5TGFuM2krVnREUjZLMUVM?=
 =?utf-8?B?UjNEVmMxbVFZK2ZLNmNaaGhTRlBUeG51NHF1MXgwQTJDVmNXMFdFSG11c3JG?=
 =?utf-8?B?MmJ0cFQ2U3czSW8rL3VTNnhVSThML3RWU3V6azNUR0duN09QTVVVZzNTVjFR?=
 =?utf-8?B?andBeEs1Q2FVYmhESGx2ZmM5OG1TSW9xM2h6NThSS3VPMEtneFNXcFdNbENF?=
 =?utf-8?B?T1RTc1BLRzIxZmQ0NmdmVVMrYm04OVB2NWluTG9kcDBYZ3RJWW5SL25Eb3lx?=
 =?utf-8?B?SnFtNFZJQlQ1T0dyYVJHMEljK0JkbTgxR2s5ektFQ2pZRkRGRlRLRmlKWUZR?=
 =?utf-8?B?bzRIdTBsYXdDT3BtbG5oM3hRMklaaDVudEtMWEZuQzRMeC8xNHcxR2pIWjZD?=
 =?utf-8?B?UlpJc0lzR2lKKzdiSXVvOHU1bElSUCsySncveHc3ZnpQTEVIMEo3SmV6WXg3?=
 =?utf-8?B?VmpWdWYvR0dXV3JnKytlUzRBQXQ0SzZzUURYdkFpL25QQTVIRnpKNGxObDV5?=
 =?utf-8?B?NjFIWGY3WEJVemhIemtQQTM1blAzWjg4ZThCY1hVQzZCMjYxd28xRGVoZ1c5?=
 =?utf-8?B?N1RKUWxXckFHQ29uZ3pOMWl3Z0d5YStpRTVCNHAvNXRSTGRhNm5hVVpNVC9B?=
 =?utf-8?B?ZWt2eVg1emZ0WFJwczdtdkZnbS9EcHJ5dEVCREl3TlRxd1VJZUV3MnJuYkZZ?=
 =?utf-8?B?eXRsOTJEL3pqYnR1WmxJNkw5UDljN2thT0dzTDl3bG1CSlFOSGVONkpBT3FL?=
 =?utf-8?B?Q2xIZWRDZ0d3b2Y0S1RMSDhYRFZnUFUwRmFBUUJORWpqWFlIeHYwdjlmekJT?=
 =?utf-8?B?c0xxQmJrMC9UbG4xcmgxNm4zZEFZelNxczVHRjVJN0cxVGhLaFRpOXhDU0JS?=
 =?utf-8?Q?qbIYCQpXgG5h8mWf9ttKXZvkr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eeda5681-4c86-4631-e0d4-08dcd7b21339
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 07:18:21.0164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIbPTXQwgh8VvuueJvDaNYk3gnDDKTsny5cAI70t3OPEG2Vlid3OaWxU5fL7mQIbB89Pzf4eOT/6RDVYJJscTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
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


On 9/17/2024 10:53 AM, Reddy Guddati, Santhosh wrote:
>
> Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

Hi Santhosh,

Thank you for the review.

> On 12-08-2024 10:17, Karthik B S wrote:
>> Extend the ultrajoiner subtests to validate ultrajoiner on a non
>> ultrajoiner supported display using force joiner.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   lib/igt_kms.c            |  16 +++---
>>   lib/igt_kms.h            |   2 +-
>>   tests/intel/kms_joiner.c | 107 ++++++++++++++++++++++++++++++++-------
>>   3 files changed, 99 insertions(+), 26 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 08b628f1a..3b252b00b 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -1720,34 +1720,34 @@ bool kmstest_force_connector(int drm_fd, 
>> drmModeConnector *connector,
>>       return true;
>>   }
>>   -static bool force_connector_bigjoiner(int drm_fd,
>> +static bool force_connector_joiner(int drm_fd,
>>                         drmModeConnector *connector,
>>                         const char *value)
>>   {
>>       return connector_attr_set_debugfs(drm_fd, connector,
>> -                      "i915_bigjoiner_force_enable",
>> +                      "i915_joiner_force_enable",
>>                         value, "0");
>>   }
>>     /**
>> - * kmstest_force_connector_bigjoiner:
>> + * kmstest_force_connector_joiner:
>>    * @fd: drm file descriptor
>>    * @connector: connector
>>    *
>> - * Enable force bigjoiner state on the specified connector
>> + * Enable force joiner state on the specified connector
>>    * and install exit handler for resetting
>>    *
>>    * Returns: True on success
>>    */
>> -bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector 
>> *connector)
>> +bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector 
>> *connector, bool ultrajoiner)
>>   {
>> -    const char *value = "1";
>> +    const char *value = ultrajoiner ? "4" : "2";
>>       drmModeConnector *temp;
>>         if (!is_intel_device(drm_fd))
>>           return false;
>>   -    if (!force_connector_bigjoiner(drm_fd, connector, value))
>> +    if (!force_connector_joiner(drm_fd, connector, value))
>>           return false;
>>         dump_connector_attrs();
>> @@ -6420,7 +6420,7 @@ bool igt_has_force_joiner_debugfs(int drmfd, 
>> char *conn_name)
>>       if (debugfs_fd < 0)
>>           return false;
>>   -    ret = igt_debugfs_simple_read(debugfs_fd, 
>> "i915_bigjoiner_force_enable", buf, sizeof(buf));
>> +    ret = igt_debugfs_simple_read(debugfs_fd, 
>> "i915_joiner_force_enable", buf, sizeof(buf));
>>       close(debugfs_fd);
>>         return ret >= 0;
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index c8e89b076..8d154ec47 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -262,7 +262,7 @@ struct edid;
>>     bool kmstest_force_connector(int fd, drmModeConnector *connector,
>>                    enum kmstest_force_connector_state state);
>> -bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector 
>> *connector);
>> +bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector 
>> *connector, bool ultrajoiner);
>>   void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
>>               const struct edid *edid);
>>   diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
>> index 633bf51c7..a1510fae0 100644
>> --- a/tests/intel/kms_joiner.c
>> +++ b/tests/intel/kms_joiner.c
>> @@ -51,15 +51,24 @@
>>    * SUBTEST: basic-ultra-joiner
>>    * Description: Verify the basic modeset on ultra joiner mode on 
>> all pipes
>>    *
>> - * SUBTEST: invalid-modeset-force-joiner
>> - * Description: Verify if modeset on adjacent pipe is declined when 
>> force joiner modeset is active.
>> - *        Force joiner applies bigjoiner functionality to 
>> non-bigjoiner outputs,
>> + * SUBTEST: invalid-modeset-force-big-joiner
>> + * Description: Verify if modeset on adjacent pipe is declined when 
>> force big joiner modeset is active.
>> + *        Force big joiner applies bigjoiner functionality to 
>> non-bigjoiner outputs,
>>    *        so test exclusively targets non-bigjoiner outputs.
>>    *
>> - * SUBTEST: basic-force-joiner
>> - * Description: Verify basic modeset in force joiner mode across all 
>> pipes.
>> + * SUBTEST: basic-force-big-joiner
>> + * Description: Verify basic big joiner modeset in force joiner mode 
>> across all pipes.
>>    *        Force joiner applies bigjoiner functionality to 
>> non-bigjoiner outputs thus,
>>    *        the test exclusively targets non-bigjoiner outputs.
>> + *
>> + * SUBTEST: basic-force-ultra-joiner
>> + * Description: Verify basic ultra joiner modeset in force joiner 
>> mode across all pipes.
>> + *        Force joiner applies bigjoiner functionality to 
>> non-bigjoiner outputs thus,
>> + *        the test exclusively targets non-bigjoiner outputs.
>> + *
>> + * SUBTEST: invalid-modeset-force-ultra-joiner
>> + * Description: Verify if the modeset on the other pipes are 
>> rejected when
>> + *              the pipe A is active with force ultra joiner modeset.
>>    */
>>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>>   @@ -106,7 +115,20 @@ static void 
>> enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
>>         for (i = 0; i < data->non_big_joiner_output_count; i++) {
>>           output = data->non_big_joiner_output[i];
>> -        status = kmstest_force_connector_bigjoiner(data->drm_fd, 
>> output->config.connector);
>> +        status = kmstest_force_connector_joiner(data->drm_fd, 
>> output->config.connector, false);
>> +        igt_assert_f(status, "Failed to toggle force joiner\n");
>> +    }
>> +}
>> +
>> +static void 
>> enable_force_joiner_on_all_non_ultra_joiner_outputs(data_t *data)
>> +{
>> +    bool status;
>> +    igt_output_t *output;
>> +    int i;
>> +
>> +    for (i = 0; i < data->non_ultra_joiner_output_count; i++) {
>> +        output = data->non_ultra_joiner_output[i];
>> +        status = kmstest_force_connector_joiner(data->drm_fd, 
>> output->config.connector, true);
>>           igt_assert_f(status, "Failed to toggle force joiner\n");
>>       }
>>   }
>> @@ -297,23 +319,36 @@ static void test_joiner_on_last_pipe(data_t 
>> *data, bool force_joiner)
>>       }
>>   }
>>   -static void test_ultra_joiner(data_t *data, bool invalid_pipe, 
>> bool two_display)
>> +static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool 
>> two_display, bool force_joiner)
>>   {
>> -    int i, j, k, ret;
>> +    int i, j, k, ret, count;
>>       igt_output_t *output, *non_ultra_joiner_output;
>>       igt_plane_t *primary;
>>       igt_output_t **outputs;
>>       igt_fb_t fb;
>>       drmModeModeInfo mode;
>>   -    outputs = data->ultra_joiner_output;
>> +    if (force_joiner) {
>> +        outputs = data->non_ultra_joiner_output;
>  >> nit, would it be appropriate to rename non_ultra_joiner_output to 
> force_ultra_joiner_output?

For now I've just followed the existing nomenclature used in this test 
for big joiner. If required, we will update the variable names in the 
future for both big joiner and ultra joiner together.

Thanks,
Karthik.B.S
>> +        count = data->non_ultra_joiner_output_count;
>> +    } else {
>> +        outputs = data->ultra_joiner_output;
>> +        count = data->ultra_joiner_output_count;
>> +    }
>> +
>>       igt_display_reset(&data->display);
>>       igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>   -    for (i = 0; i < data->ultra_joiner_output_count; i++) {
>> +    for (i = 0; i < count; i++) {
>>           output = outputs[i];
>> -        igt_require(ultrajoiner_mode_found(data->drm_fd, 
>> output->config.connector, max_dotclock, &mode));
>> -        igt_output_override_mode(output, &mode);
>> +
>> +        if (!force_joiner) {
>> +            igt_require(ultrajoiner_mode_found(data->drm_fd, 
>> output->config.connector, max_dotclock, &mode));
>> +            igt_output_override_mode(output, &mode);
>> +        } else {
>> +            mode = *igt_output_get_mode(output);
>> +        }
>> +
>>           for (j = 0; j < data->n_pipes; j++) {
>>               /* Ultra joiner is only valid on PIPE_A */
>>               if (invalid_pipe && j == PIPE_A)
>> @@ -461,7 +496,7 @@ igt_main
>>               igt_require_f(data.n_pipes > 3,
>>                         "Minimum 4 pipes required\n");
>>               igt_dynamic_f("single-joiner")
>> -                test_ultra_joiner(&data, false, false);
>> +                test_ultra_joiner(&data, false, false, false);
>>       }
>>         igt_describe("Verify if the modeset on the adjoining pipe is 
>> rejected "
>> @@ -487,15 +522,15 @@ igt_main
>>           igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are 
>> required\n");
>>             igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>> -            test_ultra_joiner(&data, true, false);
>> +            test_ultra_joiner(&data, true, false, false);
>>           if (data.non_ultra_joiner_output_count > 0) {
>>               igt_dynamic_f("2x")
>> -                test_ultra_joiner(&data, false, true);
>> +                test_ultra_joiner(&data, false, true, false);
>>           }
>>       }
>>         igt_describe("Verify the basic modeset on big joiner mode on 
>> all pipes");
>> -    igt_subtest_with_dynamic("basic-force-joiner") {
>> +    igt_subtest_with_dynamic("basic-force-big-joiner") {
>>           igt_require_f(force_joiner_supported,
>>                     "force joiner not supported on this platform or 
>> none of the connected output supports it\n");
>>           igt_require_f(data.non_big_joiner_output_count > 0,
>> @@ -516,7 +551,7 @@ igt_main
>>           }
>>       }
>>   -    igt_subtest_with_dynamic("invalid-modeset-force-joiner") {
>> + igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
>>           igt_require_f(force_joiner_supported,
>>                     "force joiner not supported on this platform or 
>> none of the connected output supports it\n");
>>           igt_require_f(data.non_big_joiner_output_count > 0,
>> @@ -539,6 +574,44 @@ igt_main
>>           }
>>       }
>>   +    igt_describe("Verify the basic modeset on ultra joiner mode on 
>> all pipes");
>> +    igt_subtest_with_dynamic("basic-force-ultra-joiner") {
>> +        igt_require_f(force_joiner_supported,
>> +                  "force joiner not supported on this platform or 
>> none of the connected output supports it\n");
>> +        igt_require_f(data.non_ultra_joiner_output_count > 0,
>> +                  "No non ultra joiner output found\n");
>> +        igt_require_f(data.n_pipes > 3,
>> +                  "Minimum 4 pipes required\n");
>> +        igt_dynamic_f("single") {
>> + enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> +            test_ultra_joiner(&data, false, false, true);
>> +            igt_reset_connectors();
>> +        }
>> +    }
>> +
>> + igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
>> +        igt_require_f(force_joiner_supported,
>> +                  "force joiner not supported on this platform or 
>> none of the connected output supports it\n");
>> +        igt_require_f(data.non_ultra_joiner_output_count > 0,
>> +                  "Non ultra joiner output not found\n");
>> +        igt_require_f(data.n_pipes > 3,
>> +                  "Minimum of 3 pipes are required\n");
>> +
>> +        igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
>> + enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> +            test_ultra_joiner(&data, true, false, true);
>> +            igt_reset_connectors();
>> +        }
>> +
>> +        if (data.non_ultra_joiner_output_count > 1) {
>> +            igt_dynamic_f("2x") {
>> + enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>> +                test_ultra_joiner(&data, false, true, true);
>> +                igt_reset_connectors();
>> +            }
>> +        }
>> +    }
>> +
>>       igt_fixture {
>>           igt_display_fini(&data.display);
>>           drm_close_driver(data.drm_fd);
