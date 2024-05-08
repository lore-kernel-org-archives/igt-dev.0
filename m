Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACD6C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 19:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A814113187;
	Wed,  8 May 2024 19:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WAG6AZX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BAD113187
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 19:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715194856; x=1746730856;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=7J3mr5P1v1lMsxZIafVsFQmfdVaOss9Xt+eAWvAmnCI=;
 b=WAG6AZX6wjqhWD+kfqGceLdKY87vMIkC5R8GUF1FXTB11jf5GBbt/TWs
 X1AgGuc1xBMV7xatpSxPQQ903COM0vJOn7irmy8bG9Ucc/AeYF4eyZzGS
 gb9gthgzp+8NYSlU3Rpfjx8/qwbadFanZHaIo0tdmKOl8Q9ww3Wd1ZMFq
 muaEC+3PLkLbM0IArObCP0ZIhW6AzP5thfUoMjqoMstnfc57bYD2Iq8SR
 AK7KpRIBBNxpzPwW7oI4zi9k1MN0E7DjQmgCMTr9vvVdfq/Gg2ixA72/N
 k28FVTahOm4wzUzkQnEQ9D8ylSolQbLDqsfu0mS5wqF4pUjX9vQcUsd/K A==;
X-CSE-ConnectionGUID: Ab5lrGiZS6aLSZtSNZrGFw==
X-CSE-MsgGUID: ODqhGlQvQHy7l+4dfMq5SA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10948820"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208,217";a="10948820"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:00:56 -0700
X-CSE-ConnectionGUID: Tfn2qkarSs200Hs2DJxjsA==
X-CSE-MsgGUID: iPvXLkAxSVGebzbESFmyBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208,217";a="33815041"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 12:00:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 12:00:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 12:00:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 12:00:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 12:00:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BK3Al1BOOsCqBZ1KChmVPyjVm6p/PdTFfqpbQR/NKAwXeVOiAq4W/OUkQAuOPUUwaW75OKYcW5UtT59dgv00+AzG+CjOTRiigqZl6ngA9rB1i52Ri+V++tA3+cHIMX3tIduEPLQ/gWFu3OrEaFhiAUJbRPHMODbEJLIpjvlygnKucEMEVu5F6Tn2jGM1sM2BBRDtJHDlQ4BIJ3t7SinoX2pS2Iui4zNeUuNK5DGZ06KZAGuzaxa2LdDWdPI1TWwDOixByXzJf6PK/g18G1y+/kqFtV4Dy/MshKSNqw3qMw9U9nHqzt8Ko+geUSKdQMk5j1Pyc5LLZTLANZftB3iiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05c0pQ+y4LSwt4VhWHqzei+2sbDXifEm7B8wlBOsdlk=;
 b=lTe9pzfuMqRoVax/XGgV2KOR8lrs4G7tqflOEUAQaPo7zCctraDdY+TOPCp24whlJHOOD7kcK2EKw9jpJm+Bje0BvdrTDO+r266yUl5UCrMI1B2zjT8+PFmdn1DdPJKfZsrKcdUeLC74sqQx5sy0fmw0LsKLttr5PHVBsequAfryw3iQJVeeGdeZAojOCGTJ5oqUfGUDBBvRp7X4fCdmw0HBeVd/03ax1RlySMQBFrqL1oat94YrBAkm9/EnmAt8G4x0Q3VExdRyCTYYNBJrZ444xac/URSlL2ex8E0QHk9a95Fz6ZG4zapdAwmSZs1kedgyezYQiDEdcJhgY+Rs5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by DS0PR11MB7311.namprd11.prod.outlook.com (2603:10b6:8:11e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 19:00:22 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273%7]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 19:00:22 +0000
Content-Type: multipart/alternative;
 boundary="------------QCIuqghndGS9yNX8cvKTykzA"
Message-ID: <bcab4725-d8c6-41e7-8c11-67aa5bf803e0@intel.com>
Date: Wed, 8 May 2024 12:00:20 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_lib/xe/xe=5Fsp?=
 =?UTF-8?Q?in=2Ec=3A_Fix_typo?=
To: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <509c80865fe3460ba32ac25b49bb6ed1c40a6b33.1715109028.git.jagmeet.randhawa@intel.com>
 <171515829749.2017562.4874095815835013155@8e613ede5ea5>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <171515829749.2017562.4874095815835013155@8e613ede5ea5>
X-ClientProxiedBy: SJ0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::31) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|DS0PR11MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 8661f2e2-864e-49a5-ae3c-08dc6f911c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2tXUkhrUXFudlBRTUwvODE3NTFKQVF4WE5nbDcxN1ZOL2NBZlJBbENxSmYx?=
 =?utf-8?B?WVJ6MTJldnEzd0JhWEgvdWZrc2E0TUt4TXoxdGdjSG80K2x0aVlCMXZwOXc2?=
 =?utf-8?B?Q3lPajVEMzFDOXZrWEpod21BNzEvSmtPOGc1WWk5YXZXU2dibElsV0dQbkYr?=
 =?utf-8?B?S1JqQ2c2bmorWEl2aUt1djN4MHVMUGR3cFY0TjVoQUZ5RFRGb1hkd0xsNWJz?=
 =?utf-8?B?TmY3bDc3Rzh6bVVjL0M1bzZrdFYxYkhRS0tEZFN4TmhIbVpCQ3NRWnM1K1pq?=
 =?utf-8?B?SGZwSm9RbCt5M3NJL09icnlaRFRsZDJDWFdCTzR0bHZ3Q0pmc0pLdjVGTmpw?=
 =?utf-8?B?U2FMMmpUTUZTamU1MzIrWnFQR1pjdXpXVGNjR2Q5anRmRUp4TTdrWW9xNmRV?=
 =?utf-8?B?U2ZYcWFqQVNSd1M0ZzNoelgreUdxNHdERDZ1cWFaczR3ejRaTDNVWlAwQ2hK?=
 =?utf-8?B?QmprNDNrcmh6blB4THpPa1J6UFNMRmlyUEFkUCtQdE15ajVHVWloR2k3M0RK?=
 =?utf-8?B?dWc4U1c4U1QyNjEwK1pnbGwxNldlak1XdXdGTmNLR0I5c1QyMmtJR2cyek1Q?=
 =?utf-8?B?SHV0OG91V1FKQTBYMHBjUURkRXJRM2MzSW1NVXMxZkphYzlPMklkbFF0SDRz?=
 =?utf-8?B?YjZudG5VNmFnRUZtOVFZYk9JSUhFVGxoRml1aWtlajE4TWNLbmJidkVqR2J0?=
 =?utf-8?B?aEh3bzdKa2ZDdU96dkNQM2tsNDMyNDRFVjkxeW9INytlc0NCQnBEaC8rZzJ4?=
 =?utf-8?B?WG5SYkNwanpTSlUyK2dlQnZOOUNuOWpRQUdTUS9DbWtvZmQ4R0ROSFBpZjVp?=
 =?utf-8?B?RG5aY0pUVHZpbnZWU1k2eXFnLzZpN2ZrbGt6UFJKMUlkazJYNnM5M291NHZS?=
 =?utf-8?B?RmFTNFNWOGFLL2xJV2tsTUZWTmhydTduMDNWWDlMdWVwRk5YOWM0L29pNVUx?=
 =?utf-8?B?UVJJMHgwcTRDNFVjWXNURUlieUNCa0dRVGREdlRZbGVyNkw0T3hlekk0dWRT?=
 =?utf-8?B?M3RGUWx0NmFrc0JSV0U1OW4wSEdUZW9UT1M1bVplRFhEQzRaUHZsOGlSSGpN?=
 =?utf-8?B?ZU1JUEZlY1UyMFRDb0RVaHBCMWVIU2NXNXZxcDVYUmxKMjdpZGZTcVF1QXdI?=
 =?utf-8?B?QnlLOE1DZlZSeGVmbFVJa0xZS25BZ3VZSThDNmgvVkZCTDBDRFEwanJTd0xM?=
 =?utf-8?B?Z0lxUUl3aEo1NXhacEVIemNqd0o0TGtpMTBhUThvMWNFQ2k2YkFRa1c0WHdL?=
 =?utf-8?B?L1ZjUUorV3hpNnYrOEkrODRyVHFSUi91Qk5yUW9lU3VFcXhsMy9ycnh3N205?=
 =?utf-8?B?N1ZBV1QyWm5wdnhieGZTQzF3a1lWQ0ZhMGdkbldYNEgvSkpRcDhDWWtHbXFI?=
 =?utf-8?B?dWg5dysxYUxmUVlCVVFyaEg5V2pOTWNjS2w0MHk3R1gvbmN4dy9lMm1LUm5i?=
 =?utf-8?B?a3lsL2tMc0JXeWhDNEUwZ01EMkF2d0wzQ0IzRklKVmx4MndHaXh6eVQ3SWhK?=
 =?utf-8?B?emU5ZXJUaElPQ0VJNWpKMU9jMkMyQnB1dzd1bXBzaFJwZE1pVTNQQnlnL3hK?=
 =?utf-8?B?L1B0clNZbmdvN1dEckUzOW5aUnEzVUdSOFJhVGRhaGVqdVNkb3p5R2E2aGVp?=
 =?utf-8?Q?MNDY5ZjBEX0C+k6zDjmM4Y37GMU/uW6OuRyhpWVPk/VY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3dBRGlNU3VxQVRYT1F0dnpBbkVDTWZ5ZWo4ZVlLMS9INFg3L2dBNkRoMGVQ?=
 =?utf-8?B?N1VxQUxEZDl6RVgzaUNiZjIydDlPQk5mb1pLMFhzcmxLV2x5UHRxLzhDZVBp?=
 =?utf-8?B?YlV5UWRKNkFiVVZOYUFnaU5mYm1qa1JNSG1MKzNrcWtGbE1LdzlHSTJ1VFM1?=
 =?utf-8?B?dVpHQ2lWNm9aTXJVandJOVZabWtXRzdOc0Y3dE53QnMrNXg2Y3FoajZFTzR1?=
 =?utf-8?B?MVNvK09kRzVHWFFPa1I2OElqR0RCcEdYMEtBcmJMNUdxTE5Ya3prMHEzRmJn?=
 =?utf-8?B?eTFEYUdQY1BsakpFVXpWbTZZdGNTQ3Z6RVdpbFVTMDFBVXJ6U2NDdm1salZs?=
 =?utf-8?B?bGxOMVFGU1Y1ZXBjaDYvQ1V0T3UvWmdMWE5rOGNjV295ZFdETUd4TXYrOC9u?=
 =?utf-8?B?YzJ6TXV0SHExMHhzQlZmZkdMZjFjcEVJVGJkaER1bHVBaHlkQWx2WDFIU1c4?=
 =?utf-8?B?Z05xSWozMkh5OEhQZ2lzN0k4d2RXa2k4ZzFjamJ5TGVPQ0pxNTFzSHlLR3lY?=
 =?utf-8?B?R2dqUC9KV1A5S25MZFNNZ2xZZDZLL254UDE3VjZrUjJ4bGdIelI4T0E4cEJH?=
 =?utf-8?B?Z0U3OERzQThJZGI5TkxLQ1lxRVAvRmEzekYvMVNJNUE2dVBPVGxJdVpRNWxv?=
 =?utf-8?B?NTlxeWtvR3I5UEVZZkJ1UTNzQjJmNDZ1b244ZTY4ZHlURDI4S0wxZnpwOTdy?=
 =?utf-8?B?Z2VlVys1Z0pacW04UXNVQ05nc0F2RTY5UWFEQ0Zmc2RNdXZYVFV3K2xTaUto?=
 =?utf-8?B?Tk5jUUx2MzBpdGhwSFh3dkhtWnltK2JzczczcnhMWmJldnBjOXNGOHEwQ3pU?=
 =?utf-8?B?aXlRaTVId2MxdEx5akdLTmptbUw3ZU9QTGJ0L0w0dUVtdFJPY0JFbndpZ3pL?=
 =?utf-8?B?ZXdWc21QaHFXdnFLa3A2NG44amEvZC9kN1ZHU25sc3dsU2FZbTcwaUhSQTJY?=
 =?utf-8?B?Zy80USsyaS9RWE5kVUN2eEVUbVA1eVd5TGdqbjlWOUhmdU55cWc4Q3AxSmpH?=
 =?utf-8?B?L3hrSFZmNGt5NTltNTVycVB5TmgvdmhqWWhQN1Q1Qnlha2g5NlI5VTQ2L0xs?=
 =?utf-8?B?TTgrRzJ0eVEvYTFKZGppNHhJaG9sRExFYjlvL1ZmTXpvZFRZVFhnQmtHck52?=
 =?utf-8?B?clhLTkdUVnN0Q1pMU3BOZjhSSkxQbGtzb3kycHJNeDJXVmcydjZWdWdOM2tr?=
 =?utf-8?B?dE40RVo0cUJVOUdvYkk5d0o2YjJOZisrM3hWUk9BQzBVZG9jN2wxSHlrOURE?=
 =?utf-8?B?dVFKZkxReFdJeVovRFlWRHp5YmJZSE0wSHhnOExGbjRGT25ISTNEYXQ4SFY3?=
 =?utf-8?B?NEV4UUFkM0t2bFpTZjI4bVhnbU95VXpRUkdLOFAzSWp6VFhSa1F5bHBwcmFT?=
 =?utf-8?B?WDAwUERySmJJTHFrZkVHU216NGhDdkpzcEtWSW1NTHFDZEdkd04zQ2p1ZUZZ?=
 =?utf-8?B?WXNwOHVPOEJCSUFoeGVFMTVFc0JOSGZqN01kU0Z2eU5Wa1k2L05lSS9JaGxY?=
 =?utf-8?B?S3p0NFIvbFh5TXZZeDJSYWdTTUdXMnVZOHBGZmFETzJhWjZtMzlwSDhxTzBu?=
 =?utf-8?B?aExScmdhSWtENU9aUDZHd0IwRkY1Vmc3czA0NEJDR0pYcGdmU1JuSVBTKzRs?=
 =?utf-8?B?dUs4TTJjbXF5VDJNeTNsa290bW1vaFZ2dkdFS3BtUHMzaVhPNGtsT29jSVE1?=
 =?utf-8?B?bjBPVXJYTm1Ta3VDay8wdU9Pa0JqM0FBbkV1cEVZbFo0RnJLMThoQnFlRlh5?=
 =?utf-8?B?RHlXRnBuMmRTTkh2dzZQeW11ZEJISGFUTHpkdXZJTE1Wc05pU29HMTIyODFw?=
 =?utf-8?B?Yk43T2NUMHF6OFhnY3I0Z2Zrd3Jnc3Q5RXdRTUJ6ZWV1S3UvVE5DZzhGSnF6?=
 =?utf-8?B?OGppZUJDbUZZc2ZXbVlSbmoyT29PMm5PdE5ad0diTDlqSWRmY1ZFTW5BeHpT?=
 =?utf-8?B?dWJKRHdXSXdrVVo0RnNEbkZYWFpkWHFuQmw4Ny9PMG91VERUTXFJd2xBczEy?=
 =?utf-8?B?ZWdYRDNhb1hDVzZncW44VWRYbnRYLzN0UjlSWkN5QlhZb0x1eXBDeU41UUdu?=
 =?utf-8?B?NmVQR0pGT0FpWmFHeFhmNm5OSkhaM1YyeFF3eDY4eW1aZkFkTnhLZWRwQ3E1?=
 =?utf-8?B?dHB2dGN1YUZlemU4a1hncW5sNUF5M2dZdlFueXh5TG5nVEVJc1JpbndWdFd4?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8661f2e2-864e-49a5-ae3c-08dc6f911c73
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 19:00:21.9729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fke1iI4ieaVV0JGZLqTl803dmgXdvvFe/r0ik6uwhOEv6esuRncLMsrba6k2XV5baCOqp2a7NdeYu/wkVXxu8BdPqrv7Qn1NKd1bCi6CozM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7311
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

--------------QCIuqghndGS9yNX8cvKTykzA
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi, these failures are not related to my patch as I have not touched any 
code.

On 5/8/2024 1:51 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	lib/xe/xe_spin.c: Fix typo
> *URL:* 	https://patchwork.freedesktop.org/series/133292/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133292v1/index.html
>
>
>   CI Bug Log - changes from XEIGT_7838_full -> XEIGTPW_11110_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_11110_full absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11110_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (3 -> 1)
>
> ERROR: It appears as if the changes made in XEIGTPW_11110_full 
> prevented too many machines from booting.
>
> Missing (2): shard-adlp shard-lnl
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_11110_full:
>
>
>       IGT changes
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>   * {igt@xe_pm@mocs_suspend_resume}:
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@xe_pm@mocs_suspend_resume.html>
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_11110_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_hotunplug@hotrebind:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@core_hotunplug@hotrebind.html>
>         (Intel XE#1548
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548>)
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#829
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/829>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +16 other tests skip
>  *
>
>     igt@kms_big_joiner@invalid-modeset:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +4
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +51
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-7:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-7.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>         +177 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-storm:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +18
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_content_protection@lic-type-0.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_edge_walk@128x128-left-edge:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-436/igt@kms_cursor_edge_walk@128x128-left-edge.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_cursor_edge_walk@128x128-left-edge.html>
>         (Intel XE#581
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/581>)
>  *
>
>     igt@kms_cursor_edge_walk@256x256-top-edge:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-top-edge.html>
>         (Intel XE#581
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/581>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +12
>         other tests dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@forked-bo@all-pipes:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-435/igt@kms_cursor_legacy@forked-bo@all-pipes.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@all-pipes.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +5
>         other tests dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_cursor_legacy@torture-move:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-435/igt@kms_cursor_legacy@torture-move.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_cursor_legacy@torture-move.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-466/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1
>         other test incomplete
>  *
>
>     igt@kms_flip@2x-flip-vs-wf_vblank:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-433/igt@kms_flip@2x-flip-vs-wf_vblank.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_flip@2x-flip-vs-wf_vblank.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a7:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a7.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +8
>         other tests dmesg-warn
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234>)
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4.html>
>         (Intel XE#650
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/650>)
>         +110 other tests fail
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +58
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-suspend:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +2
>         other tests fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +63
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html>
>         (Intel XE#361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
>
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html>
>         (Intel XE#380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/380> /
>         Intel XE#904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> /
>         Intel XE#909
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html>
>         (Intel XE#904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> /
>         Intel XE#909
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +4
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +8
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +37
>         other tests skip
>  *
>
>     igt@kms_psr@psr-sprite-plane-onoff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +8
>         other tests skip
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#1149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_rmfb@close-fd:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_rmfb@close-fd.html>
>         (Intel XE#294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/294>) +2
>         other tests fail
>  *
>
>     igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-436/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#829
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/829>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +3
>         other tests skip
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html>
>         (Intel XE#771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> /
>         Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +5
>         other tests dmesg-warn
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_vrr@flipline.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +36
>         other tests skip
>  *
>
>     igt@kms_writeback@writeback-pixel-formats:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +2
>         other tests skip
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_compute_preempt@compute-preempt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_evict@evict-beng-cm-threads-large:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html>
>         (Intel XE#1041
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
>
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html>
>         (Intel XE#1041
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-threads-large:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html>
>         (Intel XE#482
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/482>)
>  *
>
>     igt@xe_evict@evict-beng-threads-large:
>
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_evict@evict-large-multi-vm-cm:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html>
>         (Intel XE#1600
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>)
>  *
>
>     igt@xe_evict@evict-threads-large:
>
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-433/igt@xe_evict@evict-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-userptr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +42
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-rebind-imm:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-imm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1562
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562>) +1
>         other test skip
>  *
>
>     igt@xe_exec_reset@gt-reset-stress:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@xe_exec_reset@gt-reset-stress.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1638
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638>)
>  *
>
>     igt@xe_exec_threads@threads-hang-rebind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@xe_exec_threads@threads-hang-rebind.html>
>         (Intel XE#1256
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256>)
>  *
>
>     igt@xe_mmap@small-bar:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@xe_mmap@small-bar.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>  *
>
>     igt@xe_pat@pat-index-xe2:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>  *
>
>     igt@xe_peer2peer@read:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@xe_peer2peer@read.html>
>         (Intel XE#1173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) +1
>         other test fail
>  *
>
>     igt@xe_pm@s2idle-d3cold-basic-exec:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1
>         other test skip
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>  *
>
>     igt@xe_query@multigpu-query-config:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@xe_query@multigpu-query-config.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +4
>         other tests skip
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_cursor_legacy@cursor-vs-flip-legacy:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip@basic-plain-flip:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-466/igt@kms_flip@basic-plain-flip.html>
>         (Intel XE#1150
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_flip@basic-plain-flip.html>
>  *
>
>     igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a6:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-436/igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a6.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a6.html>
>         +8 other tests pass
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>         (Intel XE#361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>  *
>
>     igt@xe_evict@evict-beng-large-multi-vm-cm:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html>
>         (Intel XE#1600
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html>
>  *
>
>     igt@xe_live_ktest@xe_migrate:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html>
>  *
>
>     igt@xe_live_ktest@xe_mocs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@xe_live_ktest@xe_mocs.html>
>  *
>
>     igt@xe_pm@s3-basic-exec:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-435/igt@xe_pm@s3-basic-exec.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@xe_pm@s3-basic-exec.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_chamelium_color@ctm-blue-to-red:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-434/igt@kms_chamelium_color@ctm-blue-to-red.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_chamelium_color@ctm-blue-to-red.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +3
>         other tests fail
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-435/igt@kms_content_protection@mei-interface.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_content_protection@mei-interface.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_cursor_crc@cursor-suspend:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>) +1
>         other test dmesg-fail
>  *
>
>     igt@kms_cursor_legacy@single-move:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-433/igt@kms_cursor_legacy@single-move.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_cursor_legacy@single-move.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> /
>         Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1235
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html>
>         (Intel XE#380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/380> /
>         Intel XE#904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> /
>         Intel XE#909
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html>
>         (Intel XE#904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> /
>         Intel XE#909
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>)
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#909
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_psr@fbc-psr-basic:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-436/igt@kms_psr@fbc-psr-basic.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_psr@fbc-psr-basic.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-large:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html>
>         (Intel XE#1041
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>  *
>
>     igt@xe_pm@s3-d3hot-basic-exec:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7838/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.html>
>         (Intel XE#1044
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_7838 -> IGTPW_11110
>   * Linux: xe-1248-0acac79849c88161fcceb75fdc56a438fa158324 ->
>     xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4
>
> IGTPW_11110: 505f2c555a7baba95b74f9e5e5debad97373c534 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1248-0acac79849c88161fcceb75fdc56a438fa158324: 
> 0acac79849c88161fcceb75fdc56a438fa158324
> xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4: 
> f58676e47c12a99409b71f7d3bab9f89e14522b4
>
--------------QCIuqghndGS9yNX8cvKTykzA
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi, these failures are not related to my patch as I have not
      touched any code.<br>
    </p>
    <div class=3D"moz-cite-prefix">On 5/8/2024 1:51 AM, Patchwork wrote:<br=
>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:171515829749.2017562.487409581583=
5013155@8e613ede5ea5">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>lib/xe/xe_spin.c: Fix typo</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/133292/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/133292/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
133292v1/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133292v1/index.html</a><=
/td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_7838_full -&gt;
        XEIGTPW_11110_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_11110_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_11110_full, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (3 -&gt; 1)</h2>
      <p>ERROR: It appears as if the changes made in XEIGTPW_11110_full
        prevented too many machines from booting.</p>
      <p>Missing (2): shard-adlp shard-lnl </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_11110_full:</p>
      <h3>IGT changes</h3>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>{igt@xe_pm@mocs_suspend_resume}:
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@xe_pm@mocs_suspend_res=
ume.html" moz-do-not-send=3D"true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_11110_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotrebind:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@core_hotunplug@hotrebi=
nd.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1548" moz-do-not-send=3D"true">Intel =
XE#1548</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_big_fb@x-tiled-32b=
pp-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/829" moz-do-not-send=3D"true">Intel XE#829</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@kms_big_fb@x-tiled-64b=
pp-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/316" moz-do-not-send=3D"true">Intel XE#316</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_big_fb@y-tiled-64b=
pp-rotate-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">I=
ntel XE#1124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_joiner@invalid-modeset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_big_joiner@invalid=
-modeset.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel =
XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/346" moz-do-not-send=3D"true">Intel XE#346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_bw@linear-tiling-1=
-displays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"=
true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/367" moz-do-not-send=3D"true">Intel XE#367</a>) +4 other test=
s
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_ccs@bad-pixel-form=
at-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-=
do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-=
do-not-send=3D"true">Intel XE#787</a>) +51 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a=
-7:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_ccs@crc-sprite-pla=
nes-basic-yf-tiled-ccs@pipe-b-hdmi-a-7.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787<=
/a>) +177 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@kms_ccs@random-ccs-dat=
a-4-tiled-xe2-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tru=
e">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1252" moz-do-not-send=3D"true">Intel XE#1252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_cdclk@mode-transit=
ion@pipe-c-dp-4.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/314" moz-do-not-send=3D"true">Intel XE#314</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_chamelium_hpd@hdmi=
-hpd-storm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373" moz-do-not-send=3D"true">Intel XE#373</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-433/igt@kms_content_protection=
@dp-mst-type-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">=
Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/307" moz-do-not-send=3D"true">Intel XE#307</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_content_protection=
@lic-type-0.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1204" moz-do-not-send=3D"true">Int=
el XE#1204</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_cursor_crc@cursor-=
onscreen-512x170.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true=
">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/308" moz-do-not-send=3D"true">Intel XE#308</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@128x128-left-edge:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-436/igt@kms_cursor_edge_walk@128x128-left-edge=
.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_cursor_edge_walk=
@128x128-left-edge.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/581" moz-do-not-send=3D"tru=
e">Intel XE#581</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_cursor_edge_walk@2=
56x256-top-edge.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/581" moz-do-not-send=3D"true">=
Intel XE#581</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_cursor_legacy@curs=
orb-vs-flipb-atomic.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-se=
nd=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/282" moz-do-not-send=3D"true">Intel XE#282</a>) +12 oth=
er tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-435/igt@kms_cursor_legacy@forked-bo@all-pipes.=
html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_cursor_legacy@for=
ked-bo@all-pipes.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=
=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/282" moz-do-not-send=3D"true">Intel XE#282</a>) +5 other =
tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-tra=
nsitions:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@kms_cursor_legacy@shor=
t-busy-flip-before-cursor-atomic-transitions.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send=3D"true">Intel X=
E#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@torture-move:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-435/igt@kms_cursor_legacy@torture-move.html" m=
oz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_cursor_legacy@torture-mo=
ve.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel =
XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/877" moz-do-not-send=3D"true">Intel XE#877</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_feature_discovery@=
display-3x.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/703" moz-do-not-send=3D"true">Intel XE#703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_feature_discovery@=
display-4x.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1138" moz-do-not-send=3D"true">Inte=
l XE#1138</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-466/igt@kms_flip@2x-flip-vs-absolute-wf_vblank=
-interruptible.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send=3D"tru=
e">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1195" moz-do-not-send=3D"true">Intel XE#1195</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-433/igt@kms_flip@2x-flip-vs-wf_vblank.html" mo=
z-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_flip@2x-flip-vs-wf_vblank=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201<=
/a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a7:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_flip@flip-vs-suspe=
nd-interruptible@d-hdmi-a7.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162" moz-do-=
not-send=3D"true">Intel XE#1162</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a>)=
 +8 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-d=
ownscaling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_flip_scaled_crc@fl=
ip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1234" moz-do-not-send=3D"true">Inte=
l XE#1234</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-cc=
s-to-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_flip_tiling@flip-c=
hange-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4.html" moz-do-not-send=3D"true">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/650=
" moz-do-not-send=3D"true">Intel XE#650</a>) +110 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullsc=
reen:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-spr-indfb-fullscreen.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
 moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D"true">Intel XE#65=
1</a>) +58 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@fbc-suspend.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-send=3D"true">I=
ntel XE#616</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-b=
lt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653" moz-do-not-send=3D"true">Intel XE#653<=
/a>) +63 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@p=
ipe-a-dp-4.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_=
scaling@intel-max-src-size@pipe-a-dp-4.html" moz-do-not-send=3D"true">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/361" mo=
z-do-not-send=3D"true">Intel XE#361</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifie=
rs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_plane_scaling@plan=
e-downscale-factor-0-25-with-modifiers.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498" m=
oz-do-not-send=3D"true">Intel XE#498</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifie=
rs@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_plane_scaling@plan=
e-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/498" moz-do-not-send=3D"tru=
e">Intel XE#498</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-f=
ormat:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_scaling@plan=
e-downscale-factor-0-75-with-pixel-format.html" moz-do-not-send=3D"true">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
80" moz-do-not-send=3D"true">Intel XE#380</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/904" moz-do-not-send=3D"true">Intel XE#=
904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/90=
9" moz-do-not-send=3D"true">Intel XE#909</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-f=
ormat@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_scaling@plan=
e-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html" moz-do-not-=
send=3D"true">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/904" moz-do-not-send=3D"true">Intel XE#904</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/909" moz-do-not-send=3D=
"true">Intel XE#909</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scali=
ng:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_scaling@plan=
es-downscale-factor-0-25-unity-scaling.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/305" moz-do-not-send=3D"true">Intel XE#305<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" m=
oz-do-not-send=3D"true">Intel XE#455</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scali=
ng@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_scaling@plan=
es-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/305" moz-do-not-send=3D"tru=
e">Intel XE#305</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1129" moz-do-not-send=3D"true">Intel XE#1129</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-d=
o-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_psr2_su@page_flip-=
nv12.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1122" moz-do-not-send=3D"true">Intel XE#1=
122</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01" moz-do-not-send=3D"true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_psr@fbc-psr2-sprit=
e-plane-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/929" moz-do-not-send=3D"true">Intel XE#929</a>) +37 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_psr@psr-sprite-pla=
ne-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel =
XE#1201</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_psr_stress_test@in=
validate-primary-flip-overlay.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149" moz-do-not=
-send=3D"true">Intel XE#1149</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_rmfb@close-fd:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_rmfb@close-fd.html=
" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/294" moz-do-not-send=3D"true">Intel XE#294</a>) +2=
 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-436/igt@kms_rotation_crc@primary-x-tiled-refle=
ct-x-180.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_rotation=
_crc@primary-x-tiled-reflect-x-180.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-d=
o-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/829" moz-do-not-send=3D"true">Intel XE#829</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_rotation_crc@prima=
ry-yf-tiled-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send=
=3D"true">Intel XE#1127</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_rotation_crc@sprit=
e-rotation-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/327" moz-do-not-send=3D"true">Intel XE#327</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@kms_tv_load_detect@loa=
d-detect.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel =
XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/330" moz-do-not-send=3D"true">Intel XE#330</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.htm=
l" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_universal_plane@curs=
or-fb-leak.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/771" moz-do-not-send=3D"true">Intel=
 XE#771</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/899" moz-do-not-send=3D"true">Intel XE#899</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pip=
e-d-hdmi-a-6.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html" moz-do-not-send=3D"true">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899=
" moz-do-not-send=3D"true">Intel XE#899</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.htm=
l" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_11110/shard-dg2-433/igt@kms_vblank@ts-continuati=
on-suspend.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1162" moz-do-not-send=3D"true=
">Intel XE#1162</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a>) +5 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flipline:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_vrr@flipline.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-=
not-send=3D"true">Intel XE#455</a>) +36 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-pixel-formats:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_writeback@writebac=
k-pixel-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/756" moz-do-not-send=3D"true">Intel XE#756</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@sriov_basic@enable-vfs=
-autoprobe-off.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send=3D"true">=
Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@xe_compute_preempt@com=
pute-preempt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1280" moz-do-not-send=3D"true">Intel XE#1280</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">=
Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@xe_copy_basic@mem-copy=
-linear-0xfffe.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1123" moz-do-not-send=3D"true">=
Intel XE#1123</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@xe_copy_basic@mem-set-=
linear-0xfffe.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send=3D"true">I=
ntel XE#1126</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-cm-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.h=
tml" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@xe_evict@evict-beng-cm=
-threads-large.html" moz-do-not-send=3D"true">TIMEOUT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1041" moz-do-not-send=3D"tru=
e">Intel XE#1041</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1473" moz-do-not-send=3D"true">Intel XE#1473</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/392" moz-do-not-send=3D"t=
rue">Intel XE#392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-433/igt@xe_evict@evict-beng-mi=
xed-many-threads-large.html" moz-do-not-send=3D"true">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041" moz-do-not-se=
nd=3D"true">Intel XE#1041</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1473" moz-do-not-send=3D"true">Intel XE#1473</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/392" moz-do-not-=
send=3D"true">Intel XE#392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@xe_evict@evict-beng-mi=
xed-threads-large.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/482" moz-do-not-send=
=3D"true">Intel XE#482</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@xe_evict@evict-beng-th=
reads-large.html" moz-do-not-send=3D"true">TIMEOUT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send=3D"true">=
Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-multi-vm-cm:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@xe_evict@evict-large-m=
ulti-vm-cm.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1600" moz-do-not-send=3D"true">Inte=
l XE#1600</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-433/igt@xe_evict@evict-threads=
-large.html" moz-do-not-send=3D"true">TIMEOUT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send=3D"true">Intel=
 XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/392" moz-do-not-send=3D"true">Intel XE#392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-userptr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@xe_exec_fault_mode@man=
y-execqueues-userptr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"=
true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/288" moz-do-not-send=3D"true">Intel XE#288</a>) +42 other tes=
ts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@xe_exec_fault_mode@onc=
e-rebind-imm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1562" moz-do-not-send=3D"true">Intel XE#1562</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@gt-reset-stress:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@xe_exec_reset@gt-reset=
-stress.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">I=
ntel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1638" moz-do-not-send=3D"true">Intel XE#1638</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.ht=
ml" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@xe_exec_threads@threads=
-hang-rebind.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1256" moz-do-not-send=3D"true">In=
tel XE#1256</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@small-bar:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@xe_mmap@small-bar.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512" moz-do=
-not-send=3D"true">Intel XE#512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xe2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@xe_pat@pat-index-xe2.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977" moz=
-do-not-send=3D"true">Intel XE#977</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@read:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@xe_peer2peer@read.html=
" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1173" moz-do-not-send=3D"true">Intel XE#1173</a>) =
+1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@xe_pm@s2idle-d3cold-ba=
sic-exec.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel =
XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/366" moz-do-not-send=3D"true">Intel XE#366</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@xe_pm@vram-d3cold-thre=
shold.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#=
1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
79" moz-do-not-send=3D"true">Intel XE#579</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-config:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@xe_query@multigpu-quer=
y-config.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel =
XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/944" moz-do-not-send=3D"true">Intel XE#944</a>) +4 other tests
              skip</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-legac=
y.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel X=
E#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/282" moz-do-not-send=3D"true">Intel XE#282</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-463/igt@kms_cursor_l=
egacy@cursor-vs-flip-legacy.html" moz-do-not-send=3D"true">PASS</a> +3 othe=
r tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-plain-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-466/igt@kms_flip@basic-plain-flip.html" moz-do=
-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1150" moz-do-not-send=3D"true">Intel XE#1150</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-=
not-send=3D"true">Intel XE#1195</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_11110/shard-dg2-435/igt@kms_flip@basic-plain-fli=
p.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-436/igt@kms_flip@flip-vs-panning-interruptible=
@c-hdmi-a6.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true=
">Intel XE#1195</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_11110/shard-dg2-466/igt@kms_flip@flip-vs-panning-interruptible@c=
-hdmi-a6.html" moz-do-not-send=3D"true">PASS</a> +8 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@p=
ipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/361" moz-do-not-send=3D"true">I=
ntel XE#361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_11110/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-=
hdmi-a-6.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.=
html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1600" moz-do-not-send=3D"true">Intel XE#1600</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/=
shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html" moz-do-not-se=
nd=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1192" moz-do-not-send=3D"true">Intel XE#1192</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11110/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html"=
 moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_mocs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-464/ig=
t@xe_live_ktest@xe_mocs.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-435/igt@xe_pm@s3-basic-exec.html" moz-do-not-s=
end=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1162" moz-do-not-send=3D"true">Intel XE#1162</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-se=
nd=3D"true">Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11110/shard-dg2-464/igt@xe_pm@s3-basic-exec.html" moz-=
do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-434/igt@kms_chamelium_color@ctm-blue-to-red.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-=
do-not-send=3D"true">Intel XE#306</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_chamelium_color@ct=
m-blue-to-red.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">I=
ntel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-se=
nd=3D"true">Intel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-466/igt@kms_content_protection@atomic-dpms.htm=
l" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#119=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_111=
10/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html" moz-do-not-se=
nd=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1178" moz-do-not-send=3D"true">Intel XE#1178</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei-interface:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-435/igt@kms_content_protection@mei-interface.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz=
-do-not-send=3D"true">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_content_protectio=
n@mei-interface.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true"=
>Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend.html" mo=
z-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/616" moz-do-not-send=3D"true">Intel XE#616</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-=
436/igt@kms_cursor_crc@cursor-suspend.html" moz-do-not-send=3D"true">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
62" moz-do-not-send=3D"true">Intel XE#1162</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@single-move:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-433/igt@kms_cursor_legacy@single-move.html" mo=
z-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282" moz-=
do-not-send=3D"true">Intel XE#282</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_cursor_legacy@sing=
le-move.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">I=
ntel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/282" moz-do-not-send=3D"true">Intel XE#282</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-send=3D"true">I=
ntel XE#877</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-dra=
w-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-of=
fscren-pri-shrfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651" moz-do-not-send=3D"true">Intel XE#651</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-4=
34/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-b=
lt:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri=
mscrn-indfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=
=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653" moz-do-not-send=3D"true">Intel XE#653</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235" moz-do-not=
-send=3D"true">Intel XE#1235</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:=
</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primsc=
rn-shrfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"t=
rue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/653" moz-do-not-send=3D"true">Intel XE#653</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt=
@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) +1 other tes=
t
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-fo=
rmat:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-fact=
or-0-5-with-pixel-format.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-no=
t-send=3D"true">Intel XE#1195</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_scaling@plane-do=
wnscale-factor-0-5-with-pixel-format.html" moz-do-not-send=3D"true">TIMEOUT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/380" m=
oz-do-not-send=3D"true">Intel XE#380</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/904" moz-do-not-send=3D"true">Intel XE#904</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/909" mo=
z-do-not-send=3D"true">Intel XE#909</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-fo=
rmat@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-fact=
or-0-5-with-pixel-format@pipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1195" moz-do-not-send=3D"true">Intel XE#1195</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@kms_plane_=
scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html" =
moz-do-not-send=3D"true">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/904" moz-do-not-send=3D"true">Intel XE#904</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/909" moz-do-=
not-send=3D"true">Intel XE#909</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixe=
l-formats:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-with-cl=
ipping-clamping-pixel-formats.html" moz-do-not-send=3D"true">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-=
do-not-send=3D"true">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/909" moz-do-not-send=3D"true">Intel XE#909</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/sh=
ard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel=
-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel =
XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-436/igt@kms_psr@fbc-psr-basic.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send=3D=
"true">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_11110/shard-dg2-434/igt@kms_psr@fbc-psr-basic.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) +1 other t=
est
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-larg=
e.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel X=
E#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1473" moz-do-not-send=3D"true">Intel XE#1473</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-466/igt@xe_evict@e=
vict-mixed-many-threads-large.html" moz-do-not-send=3D"true">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041" moz-do-=
not-send=3D"true">Intel XE#1041</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1473" moz-do-not-send=3D"true">Intel XE#1473</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/392" moz-d=
o-not-send=3D"true">Intel XE#392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-d3hot-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7838/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.html" moz-do=
-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1044" moz-do-not-send=3D"true">Intel XE#1044</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-=
not-send=3D"true">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1358" moz-do-not-send=3D"true">Intel XE#1358</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569" moz-d=
o-not-send=3D"true">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_11110/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-ex=
ec.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1162" moz-do-not-send=3D"true">Intel =
XE#1162</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1214" moz-do-not-send=3D"true">Intel XE#1214</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_7838 -&gt; IGTPW_11110</li>
        <li>Linux: xe-1248-0acac79849c88161fcceb75fdc56a438fa158324
          -&gt; xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4</li>
      </ul>
      <p>IGTPW_11110: 505f2c555a7baba95b74f9e5e5debad97373c534 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        xe-1248-0acac79849c88161fcceb75fdc56a438fa158324:
        0acac79849c88161fcceb75fdc56a438fa158324<br>
        xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4:
        f58676e47c12a99409b71f7d3bab9f89e14522b4</p>
    </blockquote>
  </body>
</html>

--------------QCIuqghndGS9yNX8cvKTykzA--
