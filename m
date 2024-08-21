Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D101C52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 17:06:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54EE10E672;
	Wed, 21 Aug 2024 17:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVDvKUWh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0569010E672
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 17:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724260016; x=1755796016;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=T2wKjxrxUoQPS79ImoqVIH1AYV74y7DlwSm6vpZaAs0=;
 b=PVDvKUWhPRxF4uW74jh8FyhMgSzYyW4vZ0kYxSyLuQVPQr+mlbq+Dz8F
 Tx6bvXSAmaIMW7q2YCacm4eHZMK3NUG8SI61QC1pyl37hGeYXyVk7nYiu
 oq/K/zTOjB3AY+XfhtXpWBb91UZqooL99jDmV9nxydqO3ZA6nWs7LZdyr
 f68f2D5VaKG0TmI35NOaRP20nm6aE2TRjmxyNupxbcr1gNFwvVFyXZoOL
 BRgCeG9YHXDnXNTB/VKZaHsfbW9g3ytqdFOoJEgeFuVL/fg3ue+mriFAX
 8jaRz0YPX+v08AVDs0TzEsltyFco/yZ07xinLzhRAynuEfZgf4bkoVyxW A==;
X-CSE-ConnectionGUID: 37hmXGMdQQ6Wln9VBe4oJg==
X-CSE-MsgGUID: P1bQPhW4QT+zet1BCl423g==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22516388"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22516388"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 10:06:55 -0700
X-CSE-ConnectionGUID: stRbW+wDQMKuD6b9XyDQrQ==
X-CSE-MsgGUID: w+1pS6r/S0+HXG8rZOUSIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65987915"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 10:06:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 10:06:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 10:06:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 10:06:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 10:06:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xr3KuqyfhUnOl5/WlB+sp2HXGzuJwHBcdP2G0yHGJVQ0nL+LMYNWFElcBSFS8fxYN+5WYoF3YA0THEevzIFzKKsemsJmLR6upicibJYfMikbheqw0jkMo1cmJ+024bugdG4fTybmhewgHEz3jcGxOL/LRLCT+Sx0nDSw/u04Z8rf+ejXGLmnJDrmIX+HzcsTeWpEt0fNYQorQ24iDcfFd/2fX5oEN3P/tquWc8USqOQ9xLbD3og91HSTzPJWJKAOKOC+CmDCqhtHshhB3UKomd1wdZMrHcXaCH3w6uMugmgIR3+JQZFkrKj3JFJK4L6QZDXlyzT26z33jutp/PX2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgFJY01k+T9WmDGBINHJuC5ZH4keE2qPOGQsAC+49Q8=;
 b=mn+CjgDhZYuy9JrQg6J9t+OUd6oHk15lqvHHbIUdc/y8NURTsVoRQqUJOw4yHWWKMya+A+O9nTUcoTDv5qO6e5sYqq+SCmBQr7wvCXzd4+IV9j3xBgt3bvfoeKgx+Agtepg8iCQ0TvIrj4auzAyxvqwkESNtcud/9X4DKoclBomjckjxvUUCa9EzCLP1f4uIlj5TD6oBcVP9TblcmYJ9MWO1AMWU1zUCXmp6PnMsnKjS39czvnAyi54qYiD4EzubltBjesJfgYmjBTtWkUk3MA1EatBv6woqLiNSFKXH33QnC8WMsiQWZ3h5/e+OlEGKZT9npeqouqDLS80VEnKzcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ1PR11MB6203.namprd11.prod.outlook.com (2603:10b6:a03:45a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 21 Aug
 2024 17:06:32 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 17:06:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240820232928.458248-4-lucas.demarchi@intel.com>
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
 <20240820232928.458248-4-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 3/6] tools/intel-gfx-fw-info: Embed fw decoding
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 21 Aug 2024 14:06:30 -0300
Message-ID: <172425999049.2071.14378625283004611085@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ1PR11MB6203:EE_
X-MS-Office365-Filtering-Correlation-Id: de5e5dca-2686-4639-7f54-08dcc2039b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFZlbTE0UVFFeSttZTZENlR2Zis2bHRKNENSaWlRSnBYSDVKVWMrdUpyQ0hE?=
 =?utf-8?B?eWtGYS91ZjMvYy9IRHd5OXJpMU1YMGkvcnFYTzNFOHQ1M1ZucFcvbmF3RGRH?=
 =?utf-8?B?MmlPcWpYU0ZMRTBKcmRvZk5vTWh6dTI5R1lUcXZLQTIvdGExN1F1SFNCUFdQ?=
 =?utf-8?B?WEs0dEUxVnpUYjl5Z2hyZWxRaVp2V0s0K0U3ZWdybm5BSjNlcENtRUZzcm9V?=
 =?utf-8?B?TG9vVEdMelA4OVZUY1hyTlg1THM0VjVIU05ES085UlhQM3dMOXlxNDJRbS9s?=
 =?utf-8?B?bWRBY3ZUVFBZL0hZL0RTUWFxZ2c2Qy94Z0Y2RXliYUlUenJrRURCbEtEak01?=
 =?utf-8?B?YnNNTjZGbG9wUVJvK2Q3dmo2YlZJUnR6VFVVOXRBMTRxVHl0dXdHUWowNFdJ?=
 =?utf-8?B?b3Z2QU1kYjgwcUMzdGNpM05hM2RSZjFCZ01OYURkRTBkSThHTVp6c0xUdUQ1?=
 =?utf-8?B?Vy9lNTBvcU43d2ROTGttejBlOUFtTWoyUzduMk4zZjY4a3k2K0sydE9IemxK?=
 =?utf-8?B?SnVseXNjUjYzZmhyL1RmNUJreXhDTm5CMDlJTG5SbDk0SFdDVUUzdmVHYUll?=
 =?utf-8?B?S3MxVno0dFRxWVlZbzJTcXVVN1FrSmhQaVpPUDNueFJSeFBEVjRsZGk1b1hu?=
 =?utf-8?B?QnVXYjdlUjBzNzFNUDJyeVJMY1dTMUlNNnpYZ3JUS3FZTnBHUkJ0KzRaQ3c1?=
 =?utf-8?B?UUFUdDZ1bFpyZlp6RkYvQVdXZTRGVjRKQ0c1SVc4UzJBZXJSdkV5dFVqTGZ6?=
 =?utf-8?B?VnJCLzEycG1LRDFrTFhMTHZpOVUySEVmdTd0c1hrWmd5MzhreFc4WHBmRmZm?=
 =?utf-8?B?ZlVsVVZtZTVqbXNRc093emZlRXNGUGhRT2VUVTR5eWVyNVRFWjZ5aTNMdUFa?=
 =?utf-8?B?NGZuWkhTRmszc29zVnZYRDVJc0JyeUMzTzdHbGN3RkFRZkhkYmVDYjBuaHM3?=
 =?utf-8?B?WkJ1VlUrUjVjQzZEZmtmQU5zUnFocGQ1aUFjMi96TGRDMFVmQlVZbHU1cEVq?=
 =?utf-8?B?UXZOZnozY2hNbUl0bTFNRmVDWmUzWkxZbldCZE0wY0Zxc04veDEzV21IUFNo?=
 =?utf-8?B?dVMySEszZEgrdlN1M3hiaHlFblJBQTg1MjArYVUrWlN1NkRrbXJnVTZTbTYw?=
 =?utf-8?B?ZzRmTUpuNXE5d3Q2VUhiVFZzcEZnbWFHdEVvdW80L1hBRS94UEUrVnYxTVF5?=
 =?utf-8?B?bzBoT3hVTkVEcis4MlZtZ20rYUxsa2Y4NEYydTg5UDAwVWEvV3pUNGxNNHB0?=
 =?utf-8?B?NDBmM1RDQUdwYWlkRjMrVDhQYVJJQVlRbEtudXBTVVdLS3RrWmdMdkNnQ1ZZ?=
 =?utf-8?B?eGp3VXFiVDRXNnJNakZKRU5zNmJlSExxNkZYdFhkTCtITzVYT2hmdjJ4NDR3?=
 =?utf-8?B?NFlXdUpuN0IyRUFvVGc5RlpzeHhSb1RXK2pVWHp6dFdLTmxCdTREa0dPWXQy?=
 =?utf-8?B?MDVDdHhSSFRLR3g3OGQ2MXdMRnhKSGNqdTVhaXZIUTJKdDJmV0tXNXhPTk5Z?=
 =?utf-8?B?KzFtMjJOdzR0S3BBUGwxMHpNZWp5ck5lMHJJWkpCems0V0pzWmtZRGxQQkla?=
 =?utf-8?B?dnZHUGlZeUFla0xGMG4yYVJ0endGM3JHYmdNMVV6aTZmQ1I2eDVGL3lpOEN3?=
 =?utf-8?B?NUQ5Y0FuRlJ3SGpwUzhJSlNlYWVHMldXb0VCbWcyMXVtN3U4Mm1hdGNSZzdM?=
 =?utf-8?B?YzJrMnhBSmIra01PZU9LZlNUa1V0a1FGM2RDVDY0SEpQYXdSb3BvZGQwTlZB?=
 =?utf-8?B?UzlQeHVXdnVtRjRVQlBHb1QzUTJjbjJDWEpyN3NIQmxocnZneVBpZnZHNWlL?=
 =?utf-8?B?N0U1dWd4YXR5NU83SitnUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1NVM1Q3UU95YzFaK0xSMzVBQ1IxdEgzVmRYQUVKWnVBN2pTUXAzUE42ZWs5?=
 =?utf-8?B?SGFSOUllWVBPSUtQaXhOb1hMTWZER2NJUG0rNXl0bWdNU3lyenFrMnRUbXE4?=
 =?utf-8?B?dlRZYUpsd1VMdXdrdGcvSFBaSnpSSUJQU0NWQUphZEw3QXlodG5pZ0JrZURx?=
 =?utf-8?B?S0hOSmp4Ni8wdk5Td3gzVUZCTVdyb1p6NkxmTVIrSzNSbnZIbTVEM0xXcXNr?=
 =?utf-8?B?NDhaRWo4NkpIcWlRTkJxTlU4cEhsOEhmaUR2bzFodTAzZmpuOGNIc2pzWlFr?=
 =?utf-8?B?TTJYTG9udXZucVhxMkdjbUo1Y1pEa2NtY2RQMkVjUTBSMXJtUGdmUTJnYnBW?=
 =?utf-8?B?dktBVXdLbFdqVnZDVXkybXhWTjd5UTNsd29CcnhocUJvZm1vQ2diRVNTd1B1?=
 =?utf-8?B?Y2dld2JrQk1uYzh6WFp4MjJTbW9PbTMvWUQwOHVqQUxoMmJwUHIyU1l6Ui9W?=
 =?utf-8?B?ZjBBTG5ZRXd6QSsveFRuM3dpVXUrUno3cUo4alZ4Mk5BbHZDdnBHZGppaWYw?=
 =?utf-8?B?cHU2OWEweDBsQnhhTTlCa0N3VStLcWtCeDVzS3dJV2ROcElhMUpGcG1xeVZN?=
 =?utf-8?B?M3ZxNjhPUGovNFYzRjFSa1pSUFdRVjBWZzBnWW9Kd0xOSVJDTmtzeHM1MXRU?=
 =?utf-8?B?Z2p1TnFPZzM5K0VnVVZ3QmNmb2liRWphbzVzM1pLT2pDRDFjcHU0NW9xeE5t?=
 =?utf-8?B?VmdpRWowc0ZiQkhvZ05HMHlNR05BT01reEVuM1hOU05lVTN3dzBnYWhVVjl1?=
 =?utf-8?B?ZUMxaGJsblNyQlRaaXExV3EzRTJoVDN2WHdYMEUzazFTN2xGTUNoUHpLNnF3?=
 =?utf-8?B?K3hHOEpUYnJIbXFkSVc1MnRIcThITEtOS2dlRFRtNUM1VW9ESVgzM282MHVv?=
 =?utf-8?B?bndLdGZaaWRHWUdzU2hBeUlEK1FEd0NPVWUxaXlFMEJSTy9oNGRYanl1U215?=
 =?utf-8?B?VWFzZjZpbmx2SmtobEFOdWJuUjN3T3BLYXF4cDB3dHZiN2xIQ01lSXNvQmxz?=
 =?utf-8?B?UUtmZnpkZ2lYMUdjZ3kvQkxwVUFSZmxyTEtqRkhEYkVibTNld2NTcmVQaThq?=
 =?utf-8?B?WDRLK1BLYWc1T2Y5QTNOVzBSbTM4RTQyOXVuZkFUQXBtSmFib242YmxwcVZK?=
 =?utf-8?B?ZGdHc1BxM0RrdWxWSmpuZzlvaGp3OUNFVzgvdjVPc1UwUGZpRFB3OVd2RVlx?=
 =?utf-8?B?MVZKWnRHbEJLR3pwOEN4cEZhVWx4Z0paT2kwMlZwWnFmWWtDRmE1YkMveHUy?=
 =?utf-8?B?MjdYcWUvbmpJOEhoSGN6RVZJd1lHakk5RGt3eHVSU3JWVk9weTdndUlVaHc5?=
 =?utf-8?B?NEorRFZrR2IrSlloWEFzMFdsYlUvQzJVd3pkS2dvMnBLMnJWM2J4elNpZCsz?=
 =?utf-8?B?L2pySkREWUhBUDVLOGZjMlA1VzJPYjJ5MWRub0o0aVVUcXJQcnpHMll4UHhU?=
 =?utf-8?B?TVc3V29UZDQ1ei9RUjdFVENzbUMwRDlXMmkzbWplMzkyc29NOUZPalJyRGhl?=
 =?utf-8?B?TXlUNVVzU29aS3B6SmRPRWEvZ1lvUFpmVnZTd0FISldmem0vYkRrOTBpcVBX?=
 =?utf-8?B?NFJPN3VGMWJ6cmlPeEpDMXJDaU93S2dGcllOd1d4WUZaNnJlS1p1dUVkRUZl?=
 =?utf-8?B?YnF3ckU5RFMram0wdmtvRzl6YUt2YmVvR3RmcDliYU9US2FsZEdXNkFuZHVn?=
 =?utf-8?B?Q1FZU0VaSHI2b1ErRFJ1VjJtSzF6UmlWTzR5Tm1KSjlvY1ltWUwxamxUbHpN?=
 =?utf-8?B?RHA0aU41NGpobUlkeXBHcXg1TDJTdTdHM0k0bm05RnVkYk0zUnM2QzltcDU2?=
 =?utf-8?B?cUJJRzRzV2VjVEI2UVVlS0p1eXJMVnZqYk5va3A1TWdwTnhKUTVLY2VJWjZC?=
 =?utf-8?B?M3F2ajdKT0hvNm5DNG9OVE5ZdWFCQlZXQzFHdVVnRG1MS0J6Y3I4amE5VHpW?=
 =?utf-8?B?VWl1NTR0VHp3YUUxeWJlMUpSMzI3SVd3Uyt1TjJ5cnhKbk1ad2owKzhxUCtI?=
 =?utf-8?B?MDdJcC9xWVVQTDlINTdnRVhzTXJLSDM2VTFBeEV4Q01CQklpZ0M4NFYrQkpD?=
 =?utf-8?B?U25WWjNJOHhTRUpJSUdCL1RQaVBqb1ZQcGcvVFFFbUgyZEtBVm1RWWdCM1J1?=
 =?utf-8?B?bWRneHl3aXVsZHE4YnpYc0NWb2tRcHRKUWRzQWlpWHUvNW1Pb0U2dDdBejBm?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de5e5dca-2686-4639-7f54-08dcc2039b41
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 17:06:32.7364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6DJVOD+WqcetWCv35f+dFR85Hwbbyi7VlNjuy8K9u44kt4nN+AIkF9GPfl5KHKdWda1PTV/Hq36TnchSd1IvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6203
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

Quoting Lucas De Marchi (2024-08-20 20:29:25-03:00)
>Use a factory class method to decide what class to use depending on the
>magic and embed the calls to cstruct in each of them. Main motivation is
>that in future the decode method will need to seek the binary as it
>can't really know the version just checking the beginning of the file.
>
>For now, keep the open/close of the file in the main function, but
>eventually can be migrated as well.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> tools/intel-gfx-fw-info | 73 ++++++++++++++++++++++++++++-------------
> 1 file changed, 51 insertions(+), 22 deletions(-)
>
>diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>index 3105144b7..0f1da8bff 100755
>--- a/tools/intel-gfx-fw-info
>+++ b/tools/intel-gfx-fw-info
>@@ -105,8 +105,38 @@ def FIELD_GET(mask: int, value: int) -> int:
>=20
>=20
> class Fw(abc.ABC):
>-    def __init__(self, fw):
>-        self.fw =3D fw
>+    def __init__(self, cparser, f):
>+        self.f =3D f
>+        self.cparser =3D cparser
>+        self.fw =3D None
>+
>+    def checksum(self):
>+        self.f.seek(0, 0)
>+        return hashlib.sha256(self.f.read()).hexdigest()
>+
>+    def dump(self, **kw):
>+        cstruct.dumpstruct(self.fw, kw)

s/kw/**kw/

>+
>+    @classmethod
>+    def create(cls, f):
>+        cparser =3D cstruct.cstruct()
>+        cparser.load(CDEF)
>+
>+        magic =3D cparser.magic(f).data
>+        default =3D None
>+
>+        for s in cls.__subclasses__():
>+            if s.MAGIC is None:
>+                default =3D s
>+            elif s.MAGIC =3D=3D magic:
>+                f.seek(0, 0)
>+                return s(cparser, f)
>+
>+        if default:
>+            f.seek(0, 0)

Is this seek() necessary? Looks like functions that use f already rewind
before using f.

>+            return default(cparser, f)

I believe a cleaner way of doing this is to have a single "constructor"
variable so that we have a single point of instantiation. Something
like:

    constructor =3D None

    for s in cls.__subclasses__():
        if s.MAGIC is None:
            constructor =3D s
        elif s.MAGIC =3D=3D magic:
            constructor =3D s
            break

    if constructor:
        f.seek(0, 0)
        return constructor(cparser, f)

>+
>+        return None
>=20
>     @abc.abstractmethod
>     def decode(self):
>@@ -114,8 +144,13 @@ class Fw(abc.ABC):
>=20
>=20
> class FwCss(Fw):
>+    MAGIC =3D None
>+
>     def decode(self):
>-        data =3D []
>+        self.f.seek(0, 0)
>+        self.fw =3D self.cparser.uc_css_header(self.f)
>+
>+        data =3D ["header-type: CSS"]
>=20
>         CSS_SW_VERSION_UC_MAJOR =3D 0xFF << 16
>         CSS_SW_VERSION_UC_MINOR =3D 0xFF << 8
>@@ -137,8 +172,13 @@ class FwCss(Fw):
>=20
>=20
> class FwGsc(Fw):
>+    MAGIC =3D b"$CPD"
>+
>     def decode(self):
>-        data =3D []
>+        self.f.seek(0, 0)
>+        self.fw =3D self.cparser.uc_huc_gsc_header(self.f)
>+
>+        data =3D ["header-type: GSC"]
>=20
>         HUC_GSC_MINOR_VER_HI_MASK =3D 0xFF << 16
>         HUC_GSC_MAJOR_VER_HI_MASK =3D 0xFF
>@@ -167,40 +207,29 @@ def parse_args(argv: typing.List[str]) -> argparse.N=
amespace:
>     return parser.parse_args(argv)
>=20
>=20
>-def calculate_checksum(f: typing.BinaryIO) -> str:
>-    return hashlib.sha256(f.read()).hexdigest()
>-
>-
> def main(argv: typing.List[str]) -> int:
>     args =3D parse_args(argv)
>=20
>-    cparser =3D cstruct.cstruct()
>-    cparser.load(CDEF)
>-
>     checksum =3D None
>=20
>     try:
>         with open(args.filename, mode=3D"rb") as f:
>-            magic =3D cparser.magic(f)
>-            f.seek(0, 0)
>-            if magic.data =3D=3D b"$CPD":
>-                fw =3D FwGsc(cparser.uc_huc_gsc_header(f))
>-            else:
>-                fw =3D FwCss(cparser.uc_css_header(f))
>+            fw =3D Fw.create(f)
>+            if not fw:
>+                logging.fatal("Unknown firmware type in '{args.filename}'=
")

Note that this doesn't cause the script to abort...

>=20
>+            decoded_data =3D fw.decode()

...meaning that we crash here if fw is None.

--
Gustavo Sousa

>             if args.checksum:
>-                f.seek(0, 0)
>-                checksum =3D calculate_checksum(f)
>-
>+                checksum =3D fw.checksum()
>     except FileNotFoundError as e:
>         logging.fatal(e)
>         return 1
>=20
>-    print(*fw.decode(), sep=3D"\n")
>+    print(*decoded_data, sep=3D"\n")
>=20
>     if args.raw:
>         print("raw dump:", end=3D"")
>-        cstruct.dumpstruct(fw.fw, color=3Dsys.stdout.isatty())
>+        fw.dump(color=3Dsys.stdout.isatty())
>=20
>     if checksum:
>         print(f"checksum: {checksum}")
>--=20
>2.43.0
>
