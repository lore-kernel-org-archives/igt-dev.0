Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040F1C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 14:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39E910E7FC;
	Wed, 29 Jan 2025 14:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIus3HSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4F410E7FF
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 14:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738159660; x=1769695660;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Tfnam26/ebgmEXumf6ziBo4Esg4PG6xYyo3shwFyqBg=;
 b=ZIus3HSgCjYV6K+tGtgVa2JW0pZUS48s94URo5raAHdnM1FB6bWjOTLf
 jpNG/8b2VQ+QbVTMeQjAs+0JkiGEztP09pPCBDIfj3Zww4vojo8cR6AZc
 kOOBUw3Xbfq+jwqFYyYn+Jtb/2xiHCKOUnsf6wGev0VZYDeeog1zvnmSu
 TWQWYOywM11G8E/Waus3GPj4T/sVrjGEqZ2ONhaRwAXHr4LcHBxZBI97D
 Vwbk3Ic5JxB4czch+SIDQNt1HSKEwO4WO8ss7WQ8/+ggyLnHHp5OYUAT5
 NmccNmdhnEaKivCvOj/b8NrKk3Zckc8pjymS7nyNBEpRxfP/aseLPSdVS g==;
X-CSE-ConnectionGUID: zgix+E81TOO2ctW7yPwM6A==
X-CSE-MsgGUID: L5GYJEjMSt26N0NBb0XIVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50087359"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208,217";a="50087359"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 06:07:40 -0800
X-CSE-ConnectionGUID: YU6bVcXUSWKpzEOVYu4hjw==
X-CSE-MsgGUID: fF/zfmemRvavHhp+tRpXoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
 d="scan'208,217";a="108829809"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 06:07:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 06:07:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 06:07:39 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 06:07:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jomiHvoISXcwKIkeY7r0HUfS/p7MydMgaewaVF5uf1m8RE1cogE/uYzZwlmS6SJQei8JVcTNM5OLOscgeH5DBLW9ZuOXgDL9JcAjDnfeqXHeQbtDKGUOMCR3U2zoU5z/4LwNn3MadB048dddVWcREjaEi2hBhEizOx2zjY3Bz5MsC483ByCoXb4NsJ+94+vH/D6oKyiYBJJUCwogpAZ+IChddMEHfofyJGjQbStKib1T44UW0vRXWtgM8VCWMld0d+29od+98pW4gEuUcrmy9utpUtDyvMaNNj2Ud6q7AtGd8Tzw/fvGUXL6vOMOyCCMBMW2nmqLeNeAsIaYerZISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVRij0Zy9Ugz461h2mwclBq3x145ynK66Fa2WEI66iE=;
 b=plerZ5TvQ27BGRWMVnTsKAmkUHY0sXLKuGc+XVyEH0B4JjzH1g+asYVW503b+VP4XEP1+xgpoAPLIPXFB92IwQC0zt0A0KKURb7+Aq25Qw2UdotJeysznVrdjFsAB9nrMZmu7eRaX/MmQAC36REEjF4Fqqwktm7a0WyEUUbKWJk/KHAoLln9OUcqeZdO0r8WQTHVbEPVMVXpp0iZq37fiW7krU1nf9I5ZAjegA8uqZigFnxI3OvB013cmBJruBLeV2Z1zmOhCuDW6Ym+Qnz3SP8h+ClR9Xu0TY2RT8Ir3ml+VVr2MA1swQLQD0cuOYuZRuFIbzOYXr3Snolc9uHY5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SA1PR11MB8473.namprd11.prod.outlook.com (2603:10b6:806:3a7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 14:07:32 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 14:07:31 +0000
Content-Type: multipart/alternative;
 boundary="------------agDKdp4HjW9yxGqFoCPuNdT3"
Message-ID: <407159c3-d96d-4bfe-a17d-16e4e7824673@intel.com>
Date: Wed, 29 Jan 2025 15:07:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/xe/xe_sriov_provisioning: Add scheduling
 attributes accessors
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20250120203445.16285-1-marcin.bernatowicz@linux.intel.com>
 <20250120203445.16285-2-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20250120203445.16285-2-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: VI1PR07CA0151.eurprd07.prod.outlook.com
 (2603:10a6:802:16::38) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SA1PR11MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: dee0bf27-6e8b-400a-8339-08dd406e4543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckZNYyt0NVdOb3lhNWQxRlhJc0V3R3NMMDFxNEJmSVorTnM5QitqeG9WRnFy?=
 =?utf-8?B?Y1FmNkJXUTVvZEVRRTlNd3laTlFlUjJlNStqQkNRc0dIRjdQb1lTTUhFcERD?=
 =?utf-8?B?cFJ1akJaZ0VxenkwNHRRb0Z6eGJtT2EvVjVOS2lCbGpPRjYwMUZ6ZURMb3Bj?=
 =?utf-8?B?cEhpSGdLa1dVNXN0MnBXdVYwdjg4akRxSEIzSUNZSFBMWVVadXYwaGkrNnU5?=
 =?utf-8?B?eVZBRVFVeXRpbWhOQ2kveEo3WDBKa2wyeXNYd2lSdkxUMW95WkMxNVNkYXlZ?=
 =?utf-8?B?ZENuUGxnSmlUSG94b08rWURnbkZFVU9idFdxSkdvNUV4VGVHRzdESU5naVp1?=
 =?utf-8?B?NUFHbjVUMHFMOVZQaDdpQTdFTXA5NXp4eEswYXAwMWR2UFBSQlNQSWdFTWJ1?=
 =?utf-8?B?NjIzNXF6eGxsZHZ6YzA2TXFQK2JaRjlQQ0FGeXlqeEdXRWxsK2p3WVhMV0da?=
 =?utf-8?B?SW1aRm92Um9LcENUQi9kNUxHRmpWakEvaHgxcGxGZ0FsbnlNQ3ZBQTl6YUtV?=
 =?utf-8?B?SUhMa24yRWVsMkorRjZMWW01aldUQXVlbUF1T1RFWTZoNTFVc0ZDSHk1ZWpE?=
 =?utf-8?B?UWVSTldDZm5Nei9QdDNFNXhyQW5MRUl6TGtiODdGdzlYMFAxakc0aGZYaXBx?=
 =?utf-8?B?VzVRZy85VFVaWHZCL0kzVTNmQlJDaHZ2YnZvQlVBWG9qalJReU9jbUFZRTlq?=
 =?utf-8?B?eG5lcGNkdlF6eVZHSkxqVUFaKzhMVHQzMEdKbUE5dXN3Tm95Y0VOWDhUR1o2?=
 =?utf-8?B?QjNkZFVJbXpoSmhuT2h1R2ZPeDRrQjBFK1hEekdaSGtMZGsvamJNOHk5dHND?=
 =?utf-8?B?WE1CRGRPc1NiYzZRanhuWnl5aDcxdi8zUEhjVDlSdHNLRG5meHdCenROLzNS?=
 =?utf-8?B?UStvM3hjOVEwTHBuSmFudjRlcFZvaVlrUnlOOEF0UmpVcm1WY3g5MTFZNWZW?=
 =?utf-8?B?K2FpRW9oTDVCMVZXaWVKTnprUzdZYlJ1ajJURHBRMkhqSW5EVVdTTVdzMjZJ?=
 =?utf-8?B?NTBielFKWStqbmhBdHZhMno1c2x1ZmlONjdGdGZ6WEhjTmZzdWR3ZkE1VnZX?=
 =?utf-8?B?dHpxRytnUVpSemZkeVJxV2sweW9OdVo2Mm1XVDZWRnZ5c1F1YkVRWWlCU3Rt?=
 =?utf-8?B?ak9odTltYUpGVGtBVWFQTHJQRWNBN3F0SmdiWm41WjBKekQra3NiYjkzZWRP?=
 =?utf-8?B?NlV2Y09aMHpoM1RsRVYyTVVrWFdodFg3YzQzdGZZM2FpZmptdzVlUEgwbnRp?=
 =?utf-8?B?eWRITXBDVHBCM2tNeFNmdFNZUDMrcGRSTG5mZUJRNk1LbFMwNTFRZjRsa0Vo?=
 =?utf-8?B?Zllhd0xUM2U0MHZSMVd1QURMcGttMzV6S3UzV3lmcFIxWDlZaGtYTUtoWkVF?=
 =?utf-8?B?bTExTjdFZ0t2NjczK2M0dXp2SlJOVGdaVVdDR2dSY2N6QkJuUkFTZ0FEQXM5?=
 =?utf-8?B?RUpkcmtlNjlpVFYxN1dES2lYU3BZWUxqWG9NajNHd2xDRjRjbzY4NVY0dndE?=
 =?utf-8?B?aEkrSW8xWUppb3JQdllGaVZpU0EzSlVVaEV5SFVLNzA0b3ZPdjhIaTVJYXNJ?=
 =?utf-8?B?a3NmMWIyN3dtUUZBM1JxWGNaV3RXckZETDZnWk5KdUJ4RHkycnhGKzZvd3V1?=
 =?utf-8?B?WDlhME12RXpuRmVlR2JUNmp0NncwMVVFSVRXT3J0aExUNWhsNnFjaTFFSHFF?=
 =?utf-8?B?UDRDV0dTUVg1K2xnS042WkNMTHpFM3k2enRWY0lXeGkrV2x2NEd0UlFWOUhP?=
 =?utf-8?B?emRpZFNWUmtUL1BkN0dUampYY09vTVp3ZjZrbWxJQW1WNk13QTB4LytTR0pX?=
 =?utf-8?B?U24yNXlZNGt5a0xvN1pBWFFQT0VSQ0ZWM3pqUUw1TzNkM1lVVWxEZktHU2lX?=
 =?utf-8?Q?smrAS3i7uL4r7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDJmeCs5QjhrdE5PMGpHY1pVZHdOZkVYU3BBaHNSV1dQbDVYeW5WNDVTOFV3?=
 =?utf-8?B?eWFESWFyWElhaDYxRXB5akFuVzZWbkQ3RFlRbFFnVkxGbWJtOE9oeDZBNUpU?=
 =?utf-8?B?SkdZMy9BYXV5SkgzdldOYy9SdHRNU2ZzQk14NGdja0p0ZHZ0Q0ZieDNUZnpI?=
 =?utf-8?B?YzNUSlAxUkJWUHZaZ3lHSTQ2Y0RaM2ljaFdPM2lVRVdWR0NCYkpqTmcxeFFH?=
 =?utf-8?B?WjNGdXk5OXB6M0NqTzhRcUNhMU5DVE1rOE9sS1dkZithcGZSd2pLSnhLU3Ev?=
 =?utf-8?B?YnVFUHFnS2YzcERKZUx4dHVGN2paeGZKUGlXKzE3dGZQV3ZrVFdQWUhsSWhL?=
 =?utf-8?B?SzZNWFZCRFd1UmlRR1pnRU1GMVlxNUh4aTk4bnJmcnNPY2h2M0ZkdFE5WktJ?=
 =?utf-8?B?RlhxZ2NNSDN5d1dvbTZNT3NjdHFZOGMwNkJhREdMdXcxREFZOGpMUGlzOGho?=
 =?utf-8?B?WWpHK1NBc2tkTjhmaUpYTFdwM1BNRnh3emtnTkFWYi9yQlVWQktUNTBQOHd5?=
 =?utf-8?B?TGs1Wjh4TVFZR3Z1Z0lrNUpSWlhtU1AzQ1AyMnJZSmdKRWlHd2cwZkNxeENP?=
 =?utf-8?B?c0JrQjRRNU1jakFRSm55aEJ5N3orU1J2Mkw3N3VSZ0QrUG54WXZjK3ZZOGRn?=
 =?utf-8?B?V1Q4MVlPWWNCWjRQcTR4eDVjWmpqRlNJYlVpNUxVRXJvU0xPalJUL3VETW0w?=
 =?utf-8?B?Mys4R0JpTzZ5aFBjaFZndlMyTEZLdDBXWkI4czZiYmxJWnVYQmU1MXM1UHpI?=
 =?utf-8?B?MlBiTDFnbVdFQmxiYTN3RFg4NzRpekJDRzZsNWdTVVQrOFBvSXFRRFRGQWQ1?=
 =?utf-8?B?NVRWVElSQmdSNnFlaWkwSWh5YzZySVlxL0ZYY2hNU0dYeUJIV3J4dk5BZmk3?=
 =?utf-8?B?cG5WaWNFUERVN1FpNGhIVUg0akhsVWwyZjFPaHhFV2N2YURMMjZHandYOGZT?=
 =?utf-8?B?TjV1MmFjbldvWVg5TG1SSDVmbXh4UUJnd04rWVV6SEdHNFFxbU9kU3pMWGFR?=
 =?utf-8?B?dHovNHpDT2ZFNk9nZXVyaC8vZERUbDFYRUVyWGlscDUwVjlWM1hZamNhSjN1?=
 =?utf-8?B?dnU5dTNWZEF1SmQ0dk4yWkJuRzJUeDVDcWRLOUtoMDNmZlRhaVh2VFZnOVRp?=
 =?utf-8?B?TENXY0h6Wkh6S2dJTndjSDNhbk40U0JvL2F6SGdyalovWStUVDlGN25aUllR?=
 =?utf-8?B?STJzVW5obHFOV3FPNjQwOGZnZGRydXVobUIvTlFyVHEvcklad09UNmhNbmRQ?=
 =?utf-8?B?ckFYNlFiMklMSWdZUzNueGJTcHNIZ3NIYk03ZXN2UDdJVTBZaG5JazRhMmlM?=
 =?utf-8?B?TFhTbUpSQVJwVVdzS0RWVmplZW1oSWRVODNpTytmVDRLdk1mbzRKV1ROWHox?=
 =?utf-8?B?QnBGelhXM0VZNG8yK2IwUDkzUk1jWldRYWdvZHFYTTRqT0tEVTkwQkF4OU5o?=
 =?utf-8?B?OHlaaUhOK3lnMjAyYThJclBaeWVKNWtWTHdsV3NsWk5OYXZ3ci80RlN0MC9P?=
 =?utf-8?B?bG56ZE13MGQyVmFFbHQvUkVBZ0x2dE9xd1dvb0l1ZnVaV2V2RGxFdU94V3lV?=
 =?utf-8?B?OHBRTm55Y1hKRWZpc1hhRFZvK1MrRzhpcGZabWZ3MDl6QXc3ajA3ZEZHNUZB?=
 =?utf-8?B?SWxXSEJMaGRVdE9Pc2M4SHJqcE9WcU9tNkdxQUQ2NXpYNWljbC9lNk5GMnJi?=
 =?utf-8?B?YkdkR1R2RWsrTk5wS2QrbDMyOHVtaVoyZVEvTTgxREFuWXNuaVpQQjVxNWxs?=
 =?utf-8?B?d3VVOEpGUzU4aGIxcHB3cDhyQ29tM2E4S0JpOE9zWW84M0tlWkF1TnFza2N6?=
 =?utf-8?B?dDl2dUFBRWNKVTlYVnVtQXR2dW1BWUEyWXJGQVVaSUcvUGx5RHAvdkN4Mk5l?=
 =?utf-8?B?OWZ4WWNjVGdQQ0U4d2E1QlJaTCtJdGd4QlhJSUI1SEwrS2V3TUxwa3hodU90?=
 =?utf-8?B?cEJ6VWJvdExqTFNjaWVtclRDZXJrQ3ovckxBaTlIOHBjN0ozMmtLZXBOOTJD?=
 =?utf-8?B?c2VlYngrUFVITGNzcTYzRENKWlJPK1lWQWhOT1pBRFlSa0ZVbCsvY2dIS0VE?=
 =?utf-8?B?cENsWDhwWm5JblU5ZFJ2MjBoR2xxYXBMQUZQczFua3dqdW1OaHhMQ0haaEw2?=
 =?utf-8?B?VDN2NGpFaTA4N1ZQS0JTc2krVUIwU0JoYldrOWhsMlo5N045S3pCUjAxTXVH?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dee0bf27-6e8b-400a-8339-08dd406e4543
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 14:07:31.2066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfUyxh069JEC5TBSlG3b0t6Mjo2vNg8w/eZS/UiW0mbCBt4GR/W6/vqtEe+wB2oSOuB5s+i0kZd8qfcyqgF+hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8473
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

--------------agDKdp4HjW9yxGqFoCPuNdT3
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 1/20/2025 21:34, Marcin Bernatowicz wrote:
> Add helper functions to get and set SR-IOV provisioning scheduling
> attributes. These functions provide an interface for accessing
> provisioning attributes such as execution quantum, preemption timeout,
> schedule if idle policy, schedule priority, and engine reset policy.
>
> Include both returning and asserting versions to handle errors
> appropriately.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Narasimha C V<narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>
> ---
>   lib/xe/xe_sriov_provisioning.c | 369 ++++++++++++++++++++++++++++++++-
>   lib/xe/xe_sriov_provisioning.h |  53 +++++
>   2 files changed, 421 insertions(+), 1 deletion(-)
>
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index 22035ffd8..4e3fbaae2 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -6,10 +6,11 @@
>   #include <errno.h>
>   
>   #include "igt_core.h"
> +#include "igt_sriov_device.h"
>   #include "intel_chipset.h"
>   #include "linux_scaffold.h"
> -#include "xe/xe_mmio.h"
>   #include "xe/xe_query.h"
> +#include "xe/xe_mmio.h"
>   #include "xe/xe_sriov_debugfs.h"
>   #include "xe/xe_sriov_provisioning.h"
>   
> @@ -296,3 +297,369 @@ bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res,
>   
>   	return true;
>   }
> +
> +/**
> + * __xe_sriov_get_exec_quantum_ms - Read the execution quantum in milliseconds for a given VF
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Pointer to store the read value
> + *
> + * Reads the execution quantum in milliseconds for the given PF device @pf,
> + * VF number @vf_num on GT @gt_num.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_get_exec_quantum_ms(int pf, unsigned int vf_num,
> +				   unsigned int gt_num, uint32_t *value)
> +{
> +	return __xe_sriov_pf_debugfs_get_u32(pf, vf_num, gt_num, "exec_quantum_ms", value);
> +}
> +
> +/**
> + * xe_sriov_get_exec_quantum_ms - Get the execution quantum in milliseconds for a given VF
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + *
> + * A throwing version of __xe_sriov_get_exec_quantum_ms().
> + * Instead of returning an error code, it returns the value read and
> + * asserts in case of an error.
> + *
> + * Return: Execution quantum in milliseconds assigned to a given VF. Asserts in case of failure.
> + */
> +uint32_t xe_sriov_get_exec_quantum_ms(int pf, unsigned int vf_num,
> +				      unsigned int gt_num)
> +{
> +	uint32_t value;
> +
> +	igt_fail_on(__xe_sriov_get_exec_quantum_ms(pf, vf_num, gt_num, &value));
> +
> +	return value;
> +}
> +
> +/**
> + * __xe_sriov_set_exec_quantum_ms - Set the execution quantum in milliseconds for a given VF
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Value to set
> + *
> + * Sets the execution quantum in milliseconds for the given PF device @pf,
> + * VF number @vf_num on GT @gt_num.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_set_exec_quantum_ms(int pf, unsigned int vf_num,
> +				   unsigned int gt_num, uint32_t value)
> +{
> +	return __xe_sriov_pf_debugfs_set_u32(pf, vf_num, gt_num, "exec_quantum_ms", value);
> +}
> +
> +/**
> + * xe_sriov_set_exec_quantum_ms - Set the execution quantum in milliseconds for a given VF
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Value to set
> + *
> + * A throwing version of __xe_sriov_set_exec_quantum_ms().
> + * Instead of returning an error code, it asserts in case of an error.
> + */
> +void xe_sriov_set_exec_quantum_ms(int pf, unsigned int vf_num,
> +				  unsigned int gt_num, uint32_t value)
> +{
> +	igt_fail_on(__xe_sriov_set_exec_quantum_ms(pf, vf_num, gt_num, value));
> +}
> +
> +/**
> + * __xe_sriov_get_preempt_timeout_us - Get the preemption timeout in microseconds for a given VF
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Pointer to store the read value
> + *
> + * Reads the preemption timeout in microseconds for the given PF device @pf,
> + * VF number @vf_num on GT @gt_num.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_get_preempt_timeout_us(int pf, unsigned int vf_num,
> +				      unsigned int gt_num, uint32_t *value)
> +{
> +	return __xe_sriov_pf_debugfs_get_u32(pf, vf_num, gt_num, "preempt_timeout_us", value);
> +}
> +
> +/**
> + * xe_sriov_get_preempt_timeout_us - Get the preemption timeout in microseconds for a given VF
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + *
> + * A throwing version of __xe_sriov_get_preempt_timeout_us().
> + * Instead of returning an error code, it returns the value read and
> + * asserts in case of an error.
> + *
> + * Return: Preemption timeout in microseconds assigned to a given VF.
> + * Asserts in case of failure.
> + */
> +uint32_t xe_sriov_get_preempt_timeout_us(int pf, unsigned int vf_num,
> +					 unsigned int gt_num)
> +{
> +	uint32_t value;
> +
> +	igt_fail_on(__xe_sriov_get_preempt_timeout_us(pf, vf_num, gt_num, &value));
> +
> +	return value;
> +}
> +
> +/**
> + * __xe_sriov_set_preempt_timeout_us - Set the preemption timeout in microseconds for a given VF
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Value to set
> + *
> + * Sets the preemption timeout in microseconds for the given PF device @pf,
> + * VF number @vf_num on GT @gt_num.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_set_preempt_timeout_us(int pf, unsigned int vf_num,
> +				      unsigned int gt_num, uint32_t value)
> +{
> +	return __xe_sriov_pf_debugfs_set_u32(pf, vf_num, gt_num, "preempt_timeout_us", value);
> +}
> +
> +/**
> + * xe_sriov_set_preempt_timeout_us - Set the preemption timeout in microseconds for a given VF
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Value to set
> + *
> + * A throwing version of __xe_sriov_set_preempt_timeout_us().
> + * Instead of returning an error code, it asserts in case of an error.
> + */
> +void xe_sriov_set_preempt_timeout_us(int pf, unsigned int vf_num,
> +				     unsigned int gt_num, uint32_t value)
> +{
> +	igt_fail_on(__xe_sriov_set_preempt_timeout_us(pf, vf_num, gt_num, value));
> +}
> +
> +/**
> + * __xe_sriov_get_engine_reset - Get the engine reset policy status for a given GT
> + * @pf: PF device file descriptor
> + * @gt_num: GT number
> + * @value: Pointer to store the read engine reset policy status
> + *
> + * Reads the engine reset status for the given PF device @pf on GT @gt_num.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_get_engine_reset(int pf, unsigned int gt_num, bool *value)
> +{
> +	return __xe_sriov_pf_debugfs_get_boolean(pf, 0, gt_num, "reset_engine", value);
> +}
> +
> +/**
> + * xe_sriov_get_engine_reset - Get the engine reset policy status for a given GT
> + * @pf: PF device file descriptor
> + * @gt_num: GT number
> + *
> + * A throwing version of __xe_sriov_get_engine_reset().
> + * Instead of returning an error code, it returns the engine reset status
> + * and asserts in case of an error.
> + *
> + * Return: The engine reset status for the given GT.
> + *         Asserts in case of failure.
> + */
> +bool xe_sriov_get_engine_reset(int pf, unsigned int gt_num)
> +{
> +	bool value;
> +
> +	igt_fail_on(__xe_sriov_get_engine_reset(pf, gt_num, &value));
> +
> +	return value;
> +}
> +
> +/**
> + * __xe_sriov_set_engine_reset - Set the engine reset policy for a given GT
> + * @pf: PF device file descriptor
> + * @gt_num: GT number
> + * @value: Engine reset policy status to set
> + *
> + * Sets the engine reset policy for the given PF device @pf on GT @gt_num.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value)
> +{
> +	return __xe_sriov_pf_debugfs_set_boolean(pf, 0, gt_num, "reset_engine", value);
> +}
> +
> +/**
> + * xe_sriov_set_engine_reset - Set the engine reset policy for a given GT
> + * @pf: PF device file descriptor
> + * @gt_num: GT number
> + * @value: Engine reset policy status to set
> + *
> + * A throwing version of __xe_sriov_set_engine_reset().
> + * Instead of returning an error code, it asserts in case of an error.
> + */
> +void xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value)
> +{
> +	igt_fail_on(__xe_sriov_set_engine_reset(pf, gt_num, value));
> +}
> +
> +/**
> + * __xe_sriov_get_sched_if_idle - Get the scheduling if idle policy for a given GT
> + * @pf: PF device file descriptor
> + * @gt_num: GT number
> + * @value: Pointer to store the read scheduling if idle policy status
> + *
> + * Reads the scheduling if idle policy status for the given PF device @pf on GT @gt_num.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num, bool *value)
> +{
> +	return __xe_sriov_pf_debugfs_get_boolean(pf, 0, gt_num, "sched_if_idle", value);
> +}
> +
> +/**
> + * xe_sriov_get_sched_if_idle - Get the scheduling if idle policy for a given GT
> + * @pf: PF device file descriptor
> + * @gt_num: GT number
> + *
> + * A throwing version of __xe_sriov_get_sched_if_idle().
> + * Instead of returning an error code, it returns the scheduling if idle policy status
> + * and asserts in case of an error.
> + *
> + * Return: The scheduling if idle status for the given GT.
> + *         Asserts in case of failure.
> + */
> +bool xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num)
> +{
> +	bool value;
> +
> +	igt_fail_on(__xe_sriov_get_sched_if_idle(pf, gt_num, &value));
> +
> +	return value;
> +}
> +
> +/**
> + * __xe_sriov_set_sched_if_idle - Set the scheduling if idle policy status for a given GT
> + * @pf: PF device file descriptor
> + * @gt_num: GT number
> + * @value: Scheduling if idle policy status to set
> + *
> + * Sets the scheduling if idle policy status for the given PF device @pf on GT @gt_num.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value)
> +{
> +	return __xe_sriov_pf_debugfs_set_boolean(pf, 0, gt_num, "sched_if_idle", value);
> +}
> +
> +/**
> + * xe_sriov_set_sched_if_idle - Set the scheduling if idle status policy for a given GT
> + * @pf: PF device file descriptor
> + * @gt_num: GT number
> + * @value: Scheduling if idle policy status to set
> + *
> + * A throwing version of __xe_sriov_set_sched_if_idle().
> + * Instead of returning an error code, it asserts in case of an error.
> + */
> +void xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value)
> +{
> +	igt_fail_on(__xe_sriov_set_sched_if_idle(pf, gt_num, value));
> +}
> +
> +/**
> + * __xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Pointer to store the read scheduling priority
> + *
> + * Reads the scheduling priority for the given PF device @pf,
> + * VF number @vf_num on GT @gt_num.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
> +				  unsigned int gt_num,
> +				  enum xe_sriov_sched_priority *value)
> +{
> +	uint32_t priority;
> +	int ret;
> +
> +	ret = __xe_sriov_pf_debugfs_get_u32(pf, vf_num, gt_num, "sched_priority", &priority);
> +	if (igt_debug_on_f(ret, "Failed to read sched_priority attribute for GT%u\n", gt_num))

nit: no info about VF number? btw. what is so special about this one 
that you decided to add debug message?

> +		return ret;
> +
> +	if (priority <= XE_SRIOV_SCHED_PRIORITY_HIGH) {
> +		*value = (enum xe_sriov_sched_priority)priority;
> +		return 0;
> +	}
> +
> +	return -ERANGE;
> +}
> +
> +/**
> + * xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + *
> + * A throwing version of __xe_sriov_get_sched_priority().
> + * Instead of returning an error code, it returns the scheduling priority
> + * and asserts in case of an error.
> + *
> + * Return: The scheduling priority for the given VF and GT.
> + *         Asserts in case of failure.
> + */
> +enum xe_sriov_sched_priority
> +xe_sriov_get_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num)
> +{
> +	enum xe_sriov_sched_priority priority;
> +
> +	igt_fail_on(__xe_sriov_get_sched_priority(pf, vf_num, gt_num, &priority));
> +
> +	return priority;
> +}
> +
> +/**
> + * __xe_sriov_set_sched_priority - Set the scheduling priority for a given VF
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Scheduling priority to set (enum xe_sriov_sched_priority)
> + *
> + * Sets the scheduling priority for the given PF device @pf, VF number @vf_num on GT @gt_num.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
> +				  enum xe_sriov_sched_priority value)
> +{
> +	return __xe_sriov_pf_debugfs_set_u32(pf, vf_num, gt_num, "sched_priority", value);
> +}
> +
> +/**
> + * xe_sriov_set_sched_priority - Set the scheduling priority for a given VF
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Scheduling priority to set (enum xe_sriov_sched_priority)
> + *
> + * A throwing version of __xe_sriov_set_sched_priority().
> + * Instead of returning an error code, it asserts in case of an error.
> + */
> +void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
> +				 enum xe_sriov_sched_priority value)
> +{
> +	igt_fail_on(__xe_sriov_set_sched_priority(pf, vf_num, gt_num, value));
> +}
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> index b4300ec2e..b22f96d88 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -55,6 +55,26 @@ enum xe_sriov_shared_res {
>   	for ((res) = 0; (res) < XE_SRIOV_SHARED_RES_NUM; (res)++) \
>   		for_if(xe_sriov_is_shared_res_provisionable((pf), (res), (gt)))
>   
> +/**
> + * enum xe_sriov_sched_priority - SR-IOV scheduling priorities
> + * @XE_SRIOV_SCHED_PRIORITY_LOW: Schedule VF only if it has active work and
> + *                               VF-State is VF_STATE_RUNNING. This is the
> + *                               default value.
> + * @XE_SRIOV_SCHED_PRIORITY_NORMAL: Schedule VF always, irrespective of whether
> + *                                  it has work or not, as long as VF-State is
> + *                                  not VF_STATE_DISABLED. Once scheduled, VF
> + *                                  will run for its entire execution quantum.
> + * @XE_SRIOV_SCHED_PRIORITY_HIGH: Schedule VF in the next time-slice after the
> + *                                current active time-slice completes. VF is
> + *                                scheduled only if it has work and VF-State is
> + *                                VF_STATE_RUNNING.
> + */
> +enum xe_sriov_sched_priority {
> +	XE_SRIOV_SCHED_PRIORITY_LOW,
> +	XE_SRIOV_SCHED_PRIORITY_NORMAL,
> +	XE_SRIOV_SCHED_PRIORITY_HIGH
> +};
> +
>   /**
>    * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
>    * @vf_id: The ID of the VF
> @@ -89,5 +109,38 @@ int __xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
>   void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
>   				     unsigned int vf_num, unsigned int gt_num,
>   				     uint64_t value);
> +int __xe_sriov_get_exec_quantum_ms(int pf, unsigned int vf_num,
> +				   unsigned int gt_num, uint32_t *value);
> +uint32_t xe_sriov_get_exec_quantum_ms(int pf, unsigned int vf_num,
> +				      unsigned int gt_num);
> +int __xe_sriov_set_exec_quantum_ms(int pf, unsigned int vf_num,
> +				   unsigned int gt_num, uint32_t value);
> +void xe_sriov_set_exec_quantum_ms(int pf, unsigned int vf_num,
> +				  unsigned int gt_num, uint32_t value);
> +int __xe_sriov_get_preempt_timeout_us(int pf, unsigned int vf_num,
> +				      unsigned int gt_num, uint32_t *value);
> +uint32_t xe_sriov_get_preempt_timeout_us(int pf, unsigned int vf_num,
> +					 unsigned int gt_num);
> +int __xe_sriov_set_preempt_timeout_us(int pf, unsigned int vf_num,
> +				      unsigned int gt_num, uint32_t value);
> +void xe_sriov_set_preempt_timeout_us(int pf, unsigned int vf_num,
> +				     unsigned int gt_num, uint32_t value);
> +int __xe_sriov_get_engine_reset(int pf, unsigned int gt_num, bool *value);
> +bool xe_sriov_get_engine_reset(int pf, unsigned int gt_num);
> +int __xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value);
> +void xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value);
> +int __xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num, bool *value);
> +bool xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num);
> +int __xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
> +void xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
> +int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
> +				  unsigned int gt_num,
> +				  enum xe_sriov_sched_priority *value);
> +enum xe_sriov_sched_priority xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
> +							 unsigned int gt_num);
> +int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
> +				  enum xe_sriov_sched_priority value);
> +void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
> +				 enum xe_sriov_sched_priority value);
>   
>   #endif /* __XE_SRIOV_PROVISIONING_H__ */

One nit, but overall looks good:
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

--------------agDKdp4HjW9yxGqFoCPuNdT3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/20/2025 21:34, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250120203445.16285-2-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Add helper functions to get and set SR-IOV provisioning scheduling
attributes. These functions provide an interface for accessing
provisioning attributes such as execution quantum, preemption timeout,
schedule if idle policy, schedule priority, and engine reset policy.

Include both returning and asserting versions to handle errors
appropriately.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Michał Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Narasimha C V <a class="moz-txt-link-rfc2396E" href="mailto:narasimha.c.v@intel.com">&lt;narasimha.c.v@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 lib/xe/xe_sriov_provisioning.c | 369 ++++++++++++++++++++++++++++++++-
 lib/xe/xe_sriov_provisioning.h |  53 +++++
 2 files changed, 421 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 22035ffd8..4e3fbaae2 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -6,10 +6,11 @@
 #include &lt;errno.h&gt;
 
 #include &quot;igt_core.h&quot;
+#include &quot;igt_sriov_device.h&quot;
 #include &quot;intel_chipset.h&quot;
 #include &quot;linux_scaffold.h&quot;
-#include &quot;xe/xe_mmio.h&quot;
 #include &quot;xe/xe_query.h&quot;
+#include &quot;xe/xe_mmio.h&quot;
 #include &quot;xe/xe_sriov_debugfs.h&quot;
 #include &quot;xe/xe_sriov_provisioning.h&quot;
 
@@ -296,3 +297,369 @@ bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res,
 
 	return true;
 }
+
+/**
+ * __xe_sriov_get_exec_quantum_ms - Read the execution quantum in milliseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Pointer to store the read value
+ *
+ * Reads the execution quantum in milliseconds for the given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_get_exec_quantum_ms(int pf, unsigned int vf_num,
+				   unsigned int gt_num, uint32_t *value)
+{
+	return __xe_sriov_pf_debugfs_get_u32(pf, vf_num, gt_num, &quot;exec_quantum_ms&quot;, value);
+}
+
+/**
+ * xe_sriov_get_exec_quantum_ms - Get the execution quantum in milliseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_get_exec_quantum_ms().
+ * Instead of returning an error code, it returns the value read and
+ * asserts in case of an error.
+ *
+ * Return: Execution quantum in milliseconds assigned to a given VF. Asserts in case of failure.
+ */
+uint32_t xe_sriov_get_exec_quantum_ms(int pf, unsigned int vf_num,
+				      unsigned int gt_num)
+{
+	uint32_t value;
+
+	igt_fail_on(__xe_sriov_get_exec_quantum_ms(pf, vf_num, gt_num, &amp;value));
+
+	return value;
+}
+
+/**
+ * __xe_sriov_set_exec_quantum_ms - Set the execution quantum in milliseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Value to set
+ *
+ * Sets the execution quantum in milliseconds for the given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_set_exec_quantum_ms(int pf, unsigned int vf_num,
+				   unsigned int gt_num, uint32_t value)
+{
+	return __xe_sriov_pf_debugfs_set_u32(pf, vf_num, gt_num, &quot;exec_quantum_ms&quot;, value);
+}
+
+/**
+ * xe_sriov_set_exec_quantum_ms - Set the execution quantum in milliseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Value to set
+ *
+ * A throwing version of __xe_sriov_set_exec_quantum_ms().
+ * Instead of returning an error code, it asserts in case of an error.
+ */
+void xe_sriov_set_exec_quantum_ms(int pf, unsigned int vf_num,
+				  unsigned int gt_num, uint32_t value)
+{
+	igt_fail_on(__xe_sriov_set_exec_quantum_ms(pf, vf_num, gt_num, value));
+}
+
+/**
+ * __xe_sriov_get_preempt_timeout_us - Get the preemption timeout in microseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Pointer to store the read value
+ *
+ * Reads the preemption timeout in microseconds for the given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_get_preempt_timeout_us(int pf, unsigned int vf_num,
+				      unsigned int gt_num, uint32_t *value)
+{
+	return __xe_sriov_pf_debugfs_get_u32(pf, vf_num, gt_num, &quot;preempt_timeout_us&quot;, value);
+}
+
+/**
+ * xe_sriov_get_preempt_timeout_us - Get the preemption timeout in microseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_get_preempt_timeout_us().
+ * Instead of returning an error code, it returns the value read and
+ * asserts in case of an error.
+ *
+ * Return: Preemption timeout in microseconds assigned to a given VF.
+ * Asserts in case of failure.
+ */
+uint32_t xe_sriov_get_preempt_timeout_us(int pf, unsigned int vf_num,
+					 unsigned int gt_num)
+{
+	uint32_t value;
+
+	igt_fail_on(__xe_sriov_get_preempt_timeout_us(pf, vf_num, gt_num, &amp;value));
+
+	return value;
+}
+
+/**
+ * __xe_sriov_set_preempt_timeout_us - Set the preemption timeout in microseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Value to set
+ *
+ * Sets the preemption timeout in microseconds for the given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_set_preempt_timeout_us(int pf, unsigned int vf_num,
+				      unsigned int gt_num, uint32_t value)
+{
+	return __xe_sriov_pf_debugfs_set_u32(pf, vf_num, gt_num, &quot;preempt_timeout_us&quot;, value);
+}
+
+/**
+ * xe_sriov_set_preempt_timeout_us - Set the preemption timeout in microseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Value to set
+ *
+ * A throwing version of __xe_sriov_set_preempt_timeout_us().
+ * Instead of returning an error code, it asserts in case of an error.
+ */
+void xe_sriov_set_preempt_timeout_us(int pf, unsigned int vf_num,
+				     unsigned int gt_num, uint32_t value)
+{
+	igt_fail_on(__xe_sriov_set_preempt_timeout_us(pf, vf_num, gt_num, value));
+}
+
+/**
+ * __xe_sriov_get_engine_reset - Get the engine reset policy status for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ * @value: Pointer to store the read engine reset policy status
+ *
+ * Reads the engine reset status for the given PF device @pf on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_get_engine_reset(int pf, unsigned int gt_num, bool *value)
+{
+	return __xe_sriov_pf_debugfs_get_boolean(pf, 0, gt_num, &quot;reset_engine&quot;, value);
+}
+
+/**
+ * xe_sriov_get_engine_reset - Get the engine reset policy status for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_get_engine_reset().
+ * Instead of returning an error code, it returns the engine reset status
+ * and asserts in case of an error.
+ *
+ * Return: The engine reset status for the given GT.
+ *         Asserts in case of failure.
+ */
+bool xe_sriov_get_engine_reset(int pf, unsigned int gt_num)
+{
+	bool value;
+
+	igt_fail_on(__xe_sriov_get_engine_reset(pf, gt_num, &amp;value));
+
+	return value;
+}
+
+/**
+ * __xe_sriov_set_engine_reset - Set the engine reset policy for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ * @value: Engine reset policy status to set
+ *
+ * Sets the engine reset policy for the given PF device @pf on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value)
+{
+	return __xe_sriov_pf_debugfs_set_boolean(pf, 0, gt_num, &quot;reset_engine&quot;, value);
+}
+
+/**
+ * xe_sriov_set_engine_reset - Set the engine reset policy for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ * @value: Engine reset policy status to set
+ *
+ * A throwing version of __xe_sriov_set_engine_reset().
+ * Instead of returning an error code, it asserts in case of an error.
+ */
+void xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value)
+{
+	igt_fail_on(__xe_sriov_set_engine_reset(pf, gt_num, value));
+}
+
+/**
+ * __xe_sriov_get_sched_if_idle - Get the scheduling if idle policy for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ * @value: Pointer to store the read scheduling if idle policy status
+ *
+ * Reads the scheduling if idle policy status for the given PF device @pf on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num, bool *value)
+{
+	return __xe_sriov_pf_debugfs_get_boolean(pf, 0, gt_num, &quot;sched_if_idle&quot;, value);
+}
+
+/**
+ * xe_sriov_get_sched_if_idle - Get the scheduling if idle policy for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_get_sched_if_idle().
+ * Instead of returning an error code, it returns the scheduling if idle policy status
+ * and asserts in case of an error.
+ *
+ * Return: The scheduling if idle status for the given GT.
+ *         Asserts in case of failure.
+ */
+bool xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num)
+{
+	bool value;
+
+	igt_fail_on(__xe_sriov_get_sched_if_idle(pf, gt_num, &amp;value));
+
+	return value;
+}
+
+/**
+ * __xe_sriov_set_sched_if_idle - Set the scheduling if idle policy status for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ * @value: Scheduling if idle policy status to set
+ *
+ * Sets the scheduling if idle policy status for the given PF device @pf on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value)
+{
+	return __xe_sriov_pf_debugfs_set_boolean(pf, 0, gt_num, &quot;sched_if_idle&quot;, value);
+}
+
+/**
+ * xe_sriov_set_sched_if_idle - Set the scheduling if idle status policy for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ * @value: Scheduling if idle policy status to set
+ *
+ * A throwing version of __xe_sriov_set_sched_if_idle().
+ * Instead of returning an error code, it asserts in case of an error.
+ */
+void xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value)
+{
+	igt_fail_on(__xe_sriov_set_sched_if_idle(pf, gt_num, value));
+}
+
+/**
+ * __xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Pointer to store the read scheduling priority
+ *
+ * Reads the scheduling priority for the given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
+				  unsigned int gt_num,
+				  enum xe_sriov_sched_priority *value)
+{
+	uint32_t priority;
+	int ret;
+
+	ret = __xe_sriov_pf_debugfs_get_u32(pf, vf_num, gt_num, &quot;sched_priority&quot;, &amp;priority);
+	if (igt_debug_on_f(ret, &quot;Failed to read sched_priority attribute for GT%u\n&quot;, gt_num))</pre>
    </blockquote>
    <br>
    nit: no info about VF number? btw. what is so special about this one
    that you decided to add debug message?<br>
    <br>
    <blockquote type="cite" cite="mid:20250120203445.16285-2-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">
+		return ret;
+
+	if (priority &lt;= XE_SRIOV_SCHED_PRIORITY_HIGH) {
+		*value = (enum xe_sriov_sched_priority)priority;
+		return 0;
+	}
+
+	return -ERANGE;
+}
+
+/**
+ * xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_get_sched_priority().
+ * Instead of returning an error code, it returns the scheduling priority
+ * and asserts in case of an error.
+ *
+ * Return: The scheduling priority for the given VF and GT.
+ *         Asserts in case of failure.
+ */
+enum xe_sriov_sched_priority
+xe_sriov_get_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num)
+{
+	enum xe_sriov_sched_priority priority;
+
+	igt_fail_on(__xe_sriov_get_sched_priority(pf, vf_num, gt_num, &amp;priority));
+
+	return priority;
+}
+
+/**
+ * __xe_sriov_set_sched_priority - Set the scheduling priority for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Scheduling priority to set (enum xe_sriov_sched_priority)
+ *
+ * Sets the scheduling priority for the given PF device @pf, VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
+				  enum xe_sriov_sched_priority value)
+{
+	return __xe_sriov_pf_debugfs_set_u32(pf, vf_num, gt_num, &quot;sched_priority&quot;, value);
+}
+
+/**
+ * xe_sriov_set_sched_priority - Set the scheduling priority for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Scheduling priority to set (enum xe_sriov_sched_priority)
+ *
+ * A throwing version of __xe_sriov_set_sched_priority().
+ * Instead of returning an error code, it asserts in case of an error.
+ */
+void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
+				 enum xe_sriov_sched_priority value)
+{
+	igt_fail_on(__xe_sriov_set_sched_priority(pf, vf_num, gt_num, value));
+}
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index b4300ec2e..b22f96d88 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -55,6 +55,26 @@ enum xe_sriov_shared_res {
 	for ((res) = 0; (res) &lt; XE_SRIOV_SHARED_RES_NUM; (res)++) \
 		for_if(xe_sriov_is_shared_res_provisionable((pf), (res), (gt)))
 
+/**
+ * enum xe_sriov_sched_priority - SR-IOV scheduling priorities
+ * @XE_SRIOV_SCHED_PRIORITY_LOW: Schedule VF only if it has active work and
+ *                               VF-State is VF_STATE_RUNNING. This is the
+ *                               default value.
+ * @XE_SRIOV_SCHED_PRIORITY_NORMAL: Schedule VF always, irrespective of whether
+ *                                  it has work or not, as long as VF-State is
+ *                                  not VF_STATE_DISABLED. Once scheduled, VF
+ *                                  will run for its entire execution quantum.
+ * @XE_SRIOV_SCHED_PRIORITY_HIGH: Schedule VF in the next time-slice after the
+ *                                current active time-slice completes. VF is
+ *                                scheduled only if it has work and VF-State is
+ *                                VF_STATE_RUNNING.
+ */
+enum xe_sriov_sched_priority {
+	XE_SRIOV_SCHED_PRIORITY_LOW,
+	XE_SRIOV_SCHED_PRIORITY_NORMAL,
+	XE_SRIOV_SCHED_PRIORITY_HIGH
+};
+
 /**
  * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
  * @vf_id: The ID of the VF
@@ -89,5 +109,38 @@ int __xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
 void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
 				     unsigned int vf_num, unsigned int gt_num,
 				     uint64_t value);
+int __xe_sriov_get_exec_quantum_ms(int pf, unsigned int vf_num,
+				   unsigned int gt_num, uint32_t *value);
+uint32_t xe_sriov_get_exec_quantum_ms(int pf, unsigned int vf_num,
+				      unsigned int gt_num);
+int __xe_sriov_set_exec_quantum_ms(int pf, unsigned int vf_num,
+				   unsigned int gt_num, uint32_t value);
+void xe_sriov_set_exec_quantum_ms(int pf, unsigned int vf_num,
+				  unsigned int gt_num, uint32_t value);
+int __xe_sriov_get_preempt_timeout_us(int pf, unsigned int vf_num,
+				      unsigned int gt_num, uint32_t *value);
+uint32_t xe_sriov_get_preempt_timeout_us(int pf, unsigned int vf_num,
+					 unsigned int gt_num);
+int __xe_sriov_set_preempt_timeout_us(int pf, unsigned int vf_num,
+				      unsigned int gt_num, uint32_t value);
+void xe_sriov_set_preempt_timeout_us(int pf, unsigned int vf_num,
+				     unsigned int gt_num, uint32_t value);
+int __xe_sriov_get_engine_reset(int pf, unsigned int gt_num, bool *value);
+bool xe_sriov_get_engine_reset(int pf, unsigned int gt_num);
+int __xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value);
+void xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value);
+int __xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num, bool *value);
+bool xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num);
+int __xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
+void xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
+int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
+				  unsigned int gt_num,
+				  enum xe_sriov_sched_priority *value);
+enum xe_sriov_sched_priority xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
+							 unsigned int gt_num);
+int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
+				  enum xe_sriov_sched_priority value);
+void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
+				 enum xe_sriov_sched_priority value);
 
 #endif /* __XE_SRIOV_PROVISIONING_H__ */</pre>
    </blockquote>
    <br>
    One nit, but overall looks good:<br>
    Reviewed-by: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a><br>
    <br>
    <span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------agDKdp4HjW9yxGqFoCPuNdT3--
