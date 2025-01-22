Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14374C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 11:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B781B10E6C8;
	Wed, 22 Jan 2025 11:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b3uDqQik";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BA310E6C8
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 11:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737545669; x=1769081669;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Ha6szRdOEOKW31sRgtv/ZMOUEh8tWvf3BG4Ei4cQBMA=;
 b=b3uDqQikaSA5TYWpXvhvpqUZsvJyhbt3k/n9gjHjPM0NwrulYqgbunV6
 pCdFrFaPCQMysNjq5nnleBcRyRwVlyqn6DD9YItQ6N46maRcgXGeFx55L
 MqrXi96gQ7DUKbNQq7nl5wmQuvKORuKdB1nKwrPSK9YTaBprP8Tb61Ta1
 tT0ZDrC0kykqEHD02iRN1MVDHL4aXeSX83Bt8wAoMOXbGhN0nrqPHnBye
 n8OTDxqO3EUFC6Ituti/ODrHmy6ti5tl1lge/av62JlPNUCePNpXi8mi4
 B+OxCkMT3xqlFIx6dbK/IXqN9nN61XhHypnqhe37dOcBR7/EAvuYllXGo Q==;
X-CSE-ConnectionGUID: 0s1bjWjaSUSk8zHYSzuuYA==
X-CSE-MsgGUID: CWFJJD04RtqLor/I2n54Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38247583"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="38247583"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 03:34:28 -0800
X-CSE-ConnectionGUID: Vj3ufTwqSvKj9WfOImK9gQ==
X-CSE-MsgGUID: 6iTB5/LNRwKkaCkBPfhysw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="107031208"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 03:34:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 03:34:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 03:34:28 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 03:34:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/W1JlneVeUj6MQZc4sPipfCeh+0Pf/w7u4OWiuO0PKf6H59/Xms3nK/EK16TnGZ7geb86sYIbo9m5AKzeNIY5N3A8ZeC7kF1LgjQwJHQ/PkCSh/mT1bFECdUGyXUCRC6MK4Ijl4ZE3jlFY7XY+1rQWDXlswI+CZnJ9kIlQzt85LUh/1y+P7jX7RMbnw59gYz0La/off/n6tB518LDQ8Ab0CDOHjI0S0UW7cj1IdqkHCVfXgmfj5RN86LTzZeu026y4w5dGOmLJNJwdhWe7kuqRNWAjZbH42aKrkgLu2blJkMhPxdbFmAcQ/DdRTkTfTtbQvleETePTNTiCBQeM9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udjrMHj7rZZtwDx1nLW7d1SJKa1KMVzvH4bKiHRQrgY=;
 b=iIYnTpDU5qGHMTN3PR4gNfyLykg0LzD3v0dvJ6DJSOoyZkkgjNqkn90iFxEEZOkZ6/uL3p6qdk/vDhuliwK5LxNhqhulOmP3MXrA1Q40xxMHVqHjw4o8N4dj8HD1qUHERd0D2EAh54r6hGY89669BcHyyWJREZLzomGBmTRnE8+sVIP2ccqTDHetTwd/LF54uNpJeLorP2nnvGqTbLUXuaBlQxC3hb3TuuLOSvbx53Gp+BwL90VLwqUEKLUKs82XTCxkZJsLOanqr3iK9IxgxBl7QGal/MzLvZdiEpkMnddEQwlvyqKlKbBc4/L+KB1hnjXHW6snIiC2ATrQ3kq4zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 11:34:25 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 11:34:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250121225733.808978-4-lucas.demarchi@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-4-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 3/7] runner/settings: Drop extra strdup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 22 Jan 2025 08:34:21 -0300
Message-ID: <173754566148.5500.17173352214428899355@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:303:b8::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ1PR11MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b3805f5-834a-4ef6-cf94-08dd3ad8b981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1M0bXdUZG5iUmx6VGRmZXk1SUlqWEVSTmFjRmlhNW80T3RSRmIrMkQ3VnNQ?=
 =?utf-8?B?V1o3WC81bm94ZjVzYVVvOUhXN2dPZ3FabUV3ek5oZXVIWkZNTEdvRFFrREdS?=
 =?utf-8?B?cC9Cell3QS96VGRCS2c1NlB0S0VWcHF6eTdNMXJZVXEwYzlEUGd5SUFVM3Fs?=
 =?utf-8?B?OW5haFdtK01xWjZkNnZuTFNhOUZRcU9La0RqK0xGZFZXRkZsWVJtbytEVVp1?=
 =?utf-8?B?bGxPa1p2Z2Ywc2VmZ0dWWVdoVG5TdEI4WHB3L0lKOHlsZUFBajhQbEVCYzAw?=
 =?utf-8?B?cG40a3lIVlpaSWdIOXM3RHpEWVk0bG42L0pTMUZxUjg5dzJVSkpjb2YwOEhH?=
 =?utf-8?B?MERBa2xqUEd2ZTdXUVVVZk5jUkJqNmZ3S1BMcjNhRk9ic2c4NTNjd1o2VE91?=
 =?utf-8?B?aW1TVmw2ZE9VMTZVSTRSeFVUeGxsVEtYeEloMGwyby9yVXdWeUwrZmF0cENw?=
 =?utf-8?B?UjhNNjBtbE1DWjQ0SkJIdDRSK05ybVNkbDVwTkdhbjVzaENPL0tBT2NScHFF?=
 =?utf-8?B?QmE1L1dpNWJ4a3gvYW9URmlEVDRwR1RTTkloQmlBc3ZhRGpwb1VMWVdqSjNm?=
 =?utf-8?B?dnZXTXhVajNNZ0ZvcnkrSFhLSm5vN2pmaEFSL3M2VmthakZvTm5jN2lHVUdU?=
 =?utf-8?B?SnpBRTh0eFBqdzRjS1RxZW1KZmc5c1lqVFBKbHRDNElXaWdmTnRjcDRmamlJ?=
 =?utf-8?B?Nm9CdE9IZGhoZjlWRzFPZW9mdTc2MkxNdmxrV3VqY0k4V2ExK2Z1SStPYzlD?=
 =?utf-8?B?RDErOXdSL0NoeFF4U2ZVZDJwRy9Kc1BQMHRtUjNpSEtMT3VQZzgvb2szNlZ4?=
 =?utf-8?B?L2kzVk8vajlKakJWdjBqYk5CMkpMZ3RialN3RFhNYzlQakZaeVIzYURXdG5W?=
 =?utf-8?B?WDBlQ2twK1lCSzdWN3ovaUZCcUpVYUVrQWJSVWMwT3RtSlpBdGl0NlUwWnFZ?=
 =?utf-8?B?bkhEYmx3MHArYzIvOXNhWndJY0VVM2Myc1VtTGZFNS9ORmFTQnp4Zi9tZlhS?=
 =?utf-8?B?RU43VTJJMW9wU01uL3lDYlU1c2MwZnVoaWZQTmVpQ2VucU9WbFE0K3JpalQv?=
 =?utf-8?B?S3VUV0pRRmtTY21wOUszRHp1WHhRanNseVFVSTNhZ0F0QnE3SndYcEJaeFc3?=
 =?utf-8?B?TFdhTHJWTVRMVnl5MUZqa3ZpMEtCL3pOUlkrb2NiWFZuSHdHNjhMN05uMTBm?=
 =?utf-8?B?cWdCSnNsZW1Za1Q5V3RYNFp6M1MwY2ZuaEhJWll3T3pMYzRycW5JWE5FYlZV?=
 =?utf-8?B?MjVMMXFhMklWY1RVbGJYZnc1eUk4WkQxQ1AzM3crUTgwcTh6VjJDZmdmMmVG?=
 =?utf-8?B?K2VKR3ZieXl2Z1QrcjZFaXhXbTVnZXJYMHpMU3N2bzA4V2VscktVL2RSMnZz?=
 =?utf-8?B?aUFsamYxYmU4b1Z0RjljZjFTWURHWmpjQnIyaWhtNlhSRU1LYUErSVhCdVN0?=
 =?utf-8?B?elhVWXVlV01ESGZpU05XaE5ZUkxlVWxzVzhCQ1czWHFQR0NESkMwRjNvQnZP?=
 =?utf-8?B?dHpndEZ3TUdCMUk0TVI1SVdycDRCVi9WUkZOUStxL2JuUHRpdFdPUjVDOENT?=
 =?utf-8?B?Q09SaDF3eDFwMUlROE16R2UxYUJ3UHAzR044NVcvK0Q2T1hIVVV0cGsxN2w2?=
 =?utf-8?B?eXdWMzI1bUhSOTBwN1ZKRUdZY2JyMnk1OG83UUxXTHhCUVVSLy9EbDFZNTNv?=
 =?utf-8?B?NmtwU3pHSU9yVy9zemRseXN5Vk9SelllY3RraTYrZE1QM1F0TWpsSEo4L0dP?=
 =?utf-8?B?S1I5NXBRZHlPODhSZ0kyKzJ6SkpUdWtuRDNaUXgyekEyYmFhbTl6WkJiN3or?=
 =?utf-8?B?bDJxZXYweE4vcmlHYVNRTURWQkpsSGc4L2dmVXlOL3UwNGtKbWpVTzZNT01J?=
 =?utf-8?Q?D2As0GED2s8b8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mis2YXhHczN5T0djOERHQnpnRFc5NHN4ZjMxY1cwWGRRNmdTMTlmTjYxTVRE?=
 =?utf-8?B?NmQwK3dPbm9XSmt4dzVGZ2t0OVhYNnE2cWxya0RZczVIUDMyN2ROTjRiZnpN?=
 =?utf-8?B?YVJyWG5ZdEh4bVh2bGJnRXFsZElWaVMvSWsxYlZTa2wwNUx5K1dnekF2L2d6?=
 =?utf-8?B?MFl4MUtPbFVadzhYVURDekpqanVLeHFpQ1J0bis2ZVhVRTNWRFU1TW93eVFC?=
 =?utf-8?B?RHVMRVBBRHRBR2podk16eGI5VC9YOWlMd0lEckJxRXIzeHFmWFB5NFFzNGxk?=
 =?utf-8?B?dWdaS1VTT3FMNXFkdE5oYnM0QVRxYVZQTXBIdElxNDFxZ0MzSlFqMHBJSE44?=
 =?utf-8?B?MFBkeUhRTXg1UU5BT28rYWdWRmUyMDNLSWEveHdwK0MzYWJiYlhtUW5qWHBG?=
 =?utf-8?B?SXRGVGcxRDVDWXZpa294N2lsMTZVdS93WXZjT1BNL0lpSjZKL1NDTy85OUQz?=
 =?utf-8?B?YnpXcFdOMzlUMzVXV0VpNi9DcmtTRlR5OHRBOEdzZWZaODQyVUVCdEtSU29H?=
 =?utf-8?B?a2VJbEhSdUtuWGVnWkVrL0RNMXNWK2xoNjQxOE5LQWs4UTM0a3FNRWlCTGdh?=
 =?utf-8?B?Q080ZmxPMXlheU82Q0ZhWVUvdjNxZEJaTDJSNmNEemtxczc0c3ZEUXJJTmFx?=
 =?utf-8?B?aG11OVlKQTA4eXQ2ZytPWUV0MTQzbzUwZ0FBM0NUN1RMeGxaSFNLeE5GR3Bl?=
 =?utf-8?B?STVWeXJQLzlYVmx0Y3pZMW96b3hrdVlkUGVZL3dhMXBTUTMxVnMrQld4TU5L?=
 =?utf-8?B?K3FDQ1BBYVJnRzc5THR3UTY0QVYva0JvTUlRTzQ2Wml4aUNHTnlHWFc0Qm8y?=
 =?utf-8?B?Uys2cDBFRjFEMWlMeGhaZnR0aWtnL1Y3ZSsxN0FldFBzRDBzOVZmeG5JQWVp?=
 =?utf-8?B?dElqUFlkWnhQRTR4dE5nS1lWNVE4WU9QVUhtZjFiTTdvNEJpV3RValNXeXNQ?=
 =?utf-8?B?STAxTG1EVWIxVGJnM3hRMi9QMGtFQXJ0cDBaeU1IelJxWEhnZnVZa0hTMncz?=
 =?utf-8?B?dG5pUTkxL01qM1R4ZEZBNi9RNjdpRUZFZjFoRFpZYWg3dHRwTzk1S1pFNzIw?=
 =?utf-8?B?MTUraGgxMmVaQ0RKOGVKa1ZHUUtNTmNBZGl3K2Z1SjRhZkpKMzRiYmJRSzJV?=
 =?utf-8?B?OFBtaE9BY1VGYTBPZFFLKzJZcURFSVNlOVIzVjdwMWVWM0FYRWt6cGIySnFH?=
 =?utf-8?B?alZwaU8zZ1hWY0MrQXVOTG5UN2Z3RkRKbWdtdmUyUE1EVTBiYVNKNmxTNTQy?=
 =?utf-8?B?NDZQaERqdmpTM0JoYWM3KzBYUnhXNi9DWjBva3NKbXdaOURWQVRMKzk0WW0y?=
 =?utf-8?B?UXFMbjVyc1NmUXluQ3VONTBRTm5YUkFhbWhvQlh3cVhXWmNHK0MzQUVMZnZ6?=
 =?utf-8?B?ZmZQRkdMZGZxeWhMKzlTbUVUUmw1ZVdRRFBMMmRjK04yelBFREFxRVFGTWtj?=
 =?utf-8?B?ZFlkQmtzL0tmKzRhN3JGRno4NFFoaGJsOEhmQmE4VFBMaXlzOXJqRkQ3T3hL?=
 =?utf-8?B?Rzg4SDViMzBMT1pjQzZHby9FeC9VRWNrM1FDUG9FNGNiMFNJVkk1OERpTlc1?=
 =?utf-8?B?anVmUjRaNlRLSHBJTWVGc1RxWnJVcTNnRG9lNmd1blFRbllmOCs3UXBseDlS?=
 =?utf-8?B?MjZWaGpQc0g2N3JnS3BBcGxsYmJHMkdXbFU4VWhLVG5BZERaU0x0LzQwVHYw?=
 =?utf-8?B?VjZ5TWNPanQwY1VhWGNGeXhMV2VrRjF4M2lWVkFxcGY1SEs1RlBBNFNhSk5t?=
 =?utf-8?B?L0hOd2g0Q0Y2bDZIb2d0K2FIOHBiM1Z2NlNkRTFpWkYwakZVNVU5S0I5WWJw?=
 =?utf-8?B?V1VFTXFxWDlSQ3dSRThBNTZsMkJHOFc5MWk0LzlBN3NZREZ0V1hkTkJxTEhi?=
 =?utf-8?B?K1dFd3h6RFhVaEwyZ0R4V2xKRHBZZFRIbzBpSXhmZkh6NVF3RytibDZqc24v?=
 =?utf-8?B?bld4d3o0R1JDYmdZUnUvc1lmcjVIUFNYNnVMaGtNRTRaSkp3SVdUWUhYZWZ0?=
 =?utf-8?B?eTRUQ2dEN1RscEp1YVF3THhtbitsU3FnZitQUURXNHlMekF4dk1xODRFV2VC?=
 =?utf-8?B?dHR1ZUFBNS9iRHUwRFUrYno2bjZ6NDZGRzVwRlVvQjFxZnlIVGRlMHo5TldC?=
 =?utf-8?B?SzRRdVpuVCt4elFPamlsYVY0NC9Ucm1vbVdnaEdjMU1tWkdra1h1R2xnVnRi?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3805f5-834a-4ef6-cf94-08dd3ad8b981
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 11:34:25.7281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bk5SH8Z7aG5UeZMNgEjpIJ5AwKU21A3GYpU2zmRdaf3nvODpXbVcyZsE4Ker2oV5l8Qhc17+VW9zf4iV6vBjjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6083
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

Quoting Lucas De Marchi (2025-01-21 19:57:29-03:00)
>No need to strdup() again since the fscanf() function is already
>allocating the variable. Just set the pointer to NULL so we "leak" our
>variable to be saved in the settings.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> runner/settings.c | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/runner/settings.c b/runner/settings.c
>index 13694a51c..96377f1de 100644
>--- a/runner/settings.c
>+++ b/runner/settings.c
>@@ -1164,7 +1164,11 @@ static unsigned long parse_ul(char **pval)
>=20
> static char *parse_str(char **pval)
> {
>-        return *pval ? strdup(*pval) : NULL;
>+        char *ret =3D *pval;
>+
>+        *pval =3D NULL;

Okay. This explains the need for char **pval in the previous patch.
Maybe a heads up in #2's commit message would clarify things :-)

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+
>+        return ret;
> }
>=20
> #define PARSE_LINE(s, name, val, field, _f)        \
>--=20
>2.48.0
>
