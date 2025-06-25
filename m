Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B44C7115C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 10:17:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5359E10E6BC;
	Wed, 25 Jun 2025 10:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTZRjMsR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E5810E6BC
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 10:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750846627; x=1782382627;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7gIMn9cmm+kV04tgq/Isgw3qmiQV3lzFv9Wt14hEqTw=;
 b=lTZRjMsR/vyfYp28HIRlAQWNsiRgorlggGaMKO8zMueC09S3igIfR4ft
 TiUDwG+ukDWcTcoeZ59HcLW2+bh4xoqe59nLrVf4X8DHPEXvC2uPR0t09
 /52uyx2CBmMtNqp7su2+ARHbv0bZAv/uWrkhh+zYWCQx/rnERpRCO+whv
 RXbvoWhUQoq23a+wZ0IuO/CXvlh8Mxj96p95rWq9Vsws8Q1REM7Sz9dd/
 J79St94e5W/gjqtzbPVU41qYGf2a2Fj4jgHARO9Iyx0Rg5twbhqKTUkEE
 2WpTZBBawJH82JOhTl4iLO1U7ydvnx8yZM2VfVEgAJtyyKHQ5dKcwYa+i Q==;
X-CSE-ConnectionGUID: 2/07UI7lSVyFAEUHdCGJHw==
X-CSE-MsgGUID: 2d3+afX6S9KruFBdAwEkiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52974205"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="52974205"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 03:17:07 -0700
X-CSE-ConnectionGUID: bVhQ9hEKRLG5EcLG5nhXOA==
X-CSE-MsgGUID: Q2llygykTUGIOYnbKRojTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="183067519"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 03:17:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:17:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 03:17:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:17:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lO8O8Yc6auliF7VJYQLvST5onyne/0ZN5VNBMHq6nKOzUxKUwZdw4yxIN1eLA/d5tYpSRMjDF4Xz9oeuzuBjcbza4oE2p5NQvVldaA6GLmzbrNpwqqWK2h934uVnkYMkvRm37eAqg2H/ulPsEBBTKPBNhHFmf3W2/Me91Wuizgv/EKjwvDTLZGPBeuwwgisVulf+7PwT1f8st439Ggdo+4RP3Xp8MtfbQBexGR8fhMOsB5+gc8xTiAE8y0iqOOy5CSJ3a2S9zZFbHaL3wCB01Kx5t0uTymjs57GqPxOGkS+/Wb2VrcmQ/EVlyCxUBFrvNXzb+LruupycX0Cgei5TMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLAAaUbqKClNStxP0fZMsourTdbqhgwEQjv1WIncZ3c=;
 b=R2ZD+6VdBrREW0Hg0i7mWXiBkcYkUgsW6q3gZPTnSN++S53q+/m+PXBFuB+c4+Teqbku7UYWlcMXR+AmuC/stP0rgdSJWZwOlpQo4SLdFaftP6Xna5q6ZOgmnGGulv3n2dPDwx5w3yVIZHQfuoc1vQrUGp+bn+b7kWltW1hRn7bVXwBiNyi1qiE05CcmtOAjTXdI6RLamOV+JRa9f1lxzc95mGhZstbA5VPBsuHqEjROobKTetu+cHxC9ZK7+JhFDjw7TDYz8biTUkKg3n1LR8G+t4HKNoVsj9/jm1I3Of43RXX59+S9YRPGBlLuygYbaW+0Q5LajZMARf3ZYlHkmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 10:16:50 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 10:16:50 +0000
Message-ID: <0cd6d5eb-5b47-477f-9c32-fbede78bbbad@intel.com>
Date: Wed, 25 Jun 2025 15:46:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v5,1/2] tests/kms_flip: Default to tiled modifiers for
 stable flips on high refresh panels
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <uma.shankar@intel.com>
References: <20250619200549.66329-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250619200549.66329-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::23) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SJ0PR11MB5088:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a6ed9e7-0c9d-4f31-6d8c-08ddb3d16635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGJmSzhiclJLSXE2bi9nRmplYWIweG91andqMnVCZ0VTMU9NR2dHcTJ3N2RG?=
 =?utf-8?B?eTZYVGpnbnU4Q29xclNEK3VDSUg4eU51bE1LYXpkZHNidnlpcUFaMHJKRXF2?=
 =?utf-8?B?ajhnMDFvakpFb1I1aUt3eXUwSmhqc2FQT002QUJaSGtrZG5jM1dIZmpycDZE?=
 =?utf-8?B?ckRjZ2pycllWaEFWNHpDMWlzS1YxOXlncTlGSmlEL3d2REJaYVA0djBXR2xG?=
 =?utf-8?B?Mkk4T2RCeUMvcUl0UXh3WHVpd1NzQlNMYWV1bEF6dmZmaklQSkRwUDErWVVH?=
 =?utf-8?B?SkJ6aXp6ZG8vWW1TS2g0b1hVa1F5bXJNS0NsM3FDYy9nVXdqMnJRaVlta29T?=
 =?utf-8?B?R3JVTTl2SEFUeXZqNGU5MjAxUC9QRTR6c0doNVEvYmw0N1ZxMGlZRDFNOXdh?=
 =?utf-8?B?cTA2Zjc4MXhGY0wvTDh3N0o2UWZhckVvcDdVNXg4ODF1MEI5NktiMGcxOCtk?=
 =?utf-8?B?NFlxN1dQRGNWNnk5NkpFZ1B2bk5ydmpSTnVJa0RHVVU2YUdyOWVhMHNSRDZS?=
 =?utf-8?B?QzNaUUVNTm51RnQvQkVJWnZZRkFUU2xyMm10d3V1c1VQQXVBT0NhUWpWZ2dq?=
 =?utf-8?B?UXJkNEtBQkZydHdNSHdnN2lGbzlKVFQxTHdMUXhxSkpEYjlMZE93UDNXc1dP?=
 =?utf-8?B?Q2paaWxSREFER0w2a0E4aVRjbitKWHZDUVZkTTR5aGZRNW5sYTFURkpnVGVt?=
 =?utf-8?B?MmlMWW92c1I5YW5NQnJXc2FWSjB3SzNucTMxNFFYc0szOE1NM0xWNG1OVUR3?=
 =?utf-8?B?NkgrL0FJbHdRak5KaUpaajRtbFU1N3M4UGQxNkd0V2luVVFUM0NKWkk0K0ZL?=
 =?utf-8?B?bFVqa1QwR0c5ZnFVQ210MW9XOHpyaHlWVVJoRTF2SFVwOEx6QkhlZTVydnIx?=
 =?utf-8?B?c3BnVkplMERmY2JHbTZ5cWhXcVFBbXZkTzhlSVYwbHZ2b2RXdzQxQk9kMzFY?=
 =?utf-8?B?ekVLUmdMMGxHb1htZFhoZ0xkK2NXdEVmcjYzbHluSTIxOVZMNXpUOWFJOGwr?=
 =?utf-8?B?SG11M1hUV3hqR3RSYVZOSUxXWXk3cVdBN1BzcDlzdWE4SC9TZHR1QjF4TnYy?=
 =?utf-8?B?eDdZRjB3TzVkcFlBcENWZk51anhSbVZvR1VTdUhGdmVUc3ExWjhvNDg1NlBu?=
 =?utf-8?B?UzcwaDh0L1c4MDVrYUJaaGdDWFZGTHM1MjRjRDNlSS9Ub1JoMEwzQ3IrRjZG?=
 =?utf-8?B?RXFxMVJvWExwUG9VSWtjYm13dEhqQ2hPUWVYTjczOVR3Zk9pRnpqa1JycmpH?=
 =?utf-8?B?ZWcydE56VGhzd1U0eEF1ZjdXaTVudVFnSWxaL0dsaFBENk1meHBBenJrSXNr?=
 =?utf-8?B?YTZERktodzRweDlucDRaOUVsYUphV2lkQjVyQ0YvTThESlh0TzB0RXR1bk12?=
 =?utf-8?B?d0FnSGU5ZG1IbVpKTjhoeXhuR2ppSStRSE9PVTR1VDhySnN4S2FXRWFnbWNT?=
 =?utf-8?B?L0RHVUpOZVltb01iNENUZEJyVEVPcTNkSHBxYVdSb2ZVZUNVWEY5TUoxbURi?=
 =?utf-8?B?amRLeVlsMk82WGYrZ0JtSDJITDJiSjU5MWlhWHFUdzNpUnJodk5PTExBdmJj?=
 =?utf-8?B?T29jOVlIU2UwS3JpcGtjMEgzVmZEa1NqWklpdVVCSFFCWC92V2VyK3U2ZVVD?=
 =?utf-8?B?b2tSaVEwNTNCZDN3RVVHVHBBYVpBbmEwWWRWb2QzUnZwTjN4c0hFZjRRVGRs?=
 =?utf-8?B?SkNaTDgrRXhlM0VzY2NjVEVhbWFIZGRCWklDaU4ySngxc1pjZ08xa2hwbnNZ?=
 =?utf-8?B?SFNJakRsdENCSDJTYWNJS3FINTFVQndEeFh0KzlndjlZdWpDaEdtTy9QRUV4?=
 =?utf-8?B?UXNHYndVYnpiZkVWc2JaZk9tQmF0amFQUkU0ZU1FTS9NWU1jcnFSSTQxR3Fm?=
 =?utf-8?B?Z09JTE42WkJFRDh2LzdLUmdHMHFJYlBrTXErZzQ0K3cyVUd1anBHODc2ZkZ6?=
 =?utf-8?Q?zuFLgux7gaw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUc4Z3FmK29mN3M2TjA5QTROSm5aQkxDYzdsZVlWbTFsRXlONDA5eUU4dU10?=
 =?utf-8?B?c3hKenFMTWJ4cjk4N2FHZ0YrWHZ2YVA0dGh5UkpXUlRxVlI5bnRGTFZ0bjBP?=
 =?utf-8?B?STlkaHVwRm90SEFqR1dMaVRJcHRVWm1xV05NS3o1MjFJUnBpc3FSd1JPcjlS?=
 =?utf-8?B?cVJKbmJRR0R6VUlidU5VUU1mV3JXVDBSZmFJM2FLNWZ3Y3JiekZnODhicjBB?=
 =?utf-8?B?bzlFakM1dlJoT1NQUFppRllRSy9Ia3dHcjNiTWRObTY3bXE5ZFNidUlyR0JJ?=
 =?utf-8?B?cVBlQjlOR3p5UzRURGl4ajRHMGRuZXUvVWpLUU5MdW5nMVFhY1RBYjZVS3B4?=
 =?utf-8?B?enlBZkVUWmkyTlpBUFRhMWszQ0w1THViVk5HNzhGWG1zZ1huTDQ3dlp2K20z?=
 =?utf-8?B?UjFFc1c5NXhZcE9pd0ttS1NHOGxDRnU1aWVrZ05jeWQ4QzZlemsxR01ZYm0y?=
 =?utf-8?B?aUJUa0lRSCtRWGlkWWJ6bUZMM2ZtdkpCbjFDTnlpZmhLajZWeUNOQkhrUzZJ?=
 =?utf-8?B?YTliaDRjZHNRd2t6VjNFaG9wZ1VHOCtMYSt6em9VZHBGUFpTM1VZalM1Tk1k?=
 =?utf-8?B?ckRpcXV4SEQzYmlZY3BjUEh5bWNQUUFia2ZsNk5pNUNuNncyRXExQWlJUlZH?=
 =?utf-8?B?eG5TTFlDNGNsUlRQL3h4MCtkQTRwVU9jQUM1ZXk3TzR6Q2JXR3RwNWc5ZTMz?=
 =?utf-8?B?NUFIV0lCbFhvZU83MEJnUnpwaHdSbTVkSW1FYWxhTjRUU0N1ODZFTXpoVlhj?=
 =?utf-8?B?K05LcTdOUWtKMTlYU2ZBOENhamQ5aDNGL1BPYVZMeDlsTzlIVnArMEJPU1U4?=
 =?utf-8?B?ZS9paTlsTGpsYXgxY3BpWnBuRkUzcFhQVFdRdHdSYmhMZzZpQ3ZXOCtxemFs?=
 =?utf-8?B?T2VnZ281d1c3M210VUYwQXlGQ1phMkJmQlZROTd4TWV4bXdwY1BWNXBVWTlH?=
 =?utf-8?B?STFOQXFCQ1ZvOWtpTTJJVnZnakUxVXJKelltUzR5Vko1Z1o2WTRnUVd4ZW9a?=
 =?utf-8?B?RjBOcDdXNSt2Mnl0NFZRZmJhclZXTTR3em1kSEhrUDZrRzd6azhyMDV0ZXRE?=
 =?utf-8?B?QWtiNjhSOU9iR1llMWErK0RRYlhwcXpBV0dIcHM0Ly9wRXJOU1VRVEhodExW?=
 =?utf-8?B?SnhvQW9JcjlxWWFCVktKeERPYytRS0NBbkh4NVpsalRvQXhINjA1SkZEUDlV?=
 =?utf-8?B?R0dQaWxNZzhJRHh6Y0owQ2tsM1dBK2RjUDBNUXB2S1ZNbWR1dkpBYm5ITTdU?=
 =?utf-8?B?cFBsUzFkTG83ZzlLT1RocElQMnV6b3dpNFZtOWphb29OenZraDFXUTJVM1BR?=
 =?utf-8?B?YjdmOUh6Ymw2SERGNVRPbHY3OXJNVEkzWEx2d21vV2gxTUFBa1RPS01qNWZG?=
 =?utf-8?B?UFBEZFlIWURNQkpYTDJLMkp1Z2dPN3NQZEhUR0psSEdnb240ZUM0WUxqei9k?=
 =?utf-8?B?QW5way9ZcER4V2ZDMTFjODYrR0h1cXN5YmZRVVRGNFNYOGxPN1VzVlZJalJX?=
 =?utf-8?B?K0JZSVdYSCt2NVB5WnQ1YWxqSnBFbE5hVzB5cGZkQ29DMGZ6Z3JndXdJbmFU?=
 =?utf-8?B?eUJiRTd1WjM1NXlKQXZ1aHJQSkxFMCt0SzQvK3RCdXFweXVxYy9Ud2JVdWlQ?=
 =?utf-8?B?V0FlZ0x0WWtXVE54djhMcXM0T2FuYjNGTDNnREtUUHpHUTVGRE16eU9ac3FJ?=
 =?utf-8?B?Y003VU5jTHh4NFFCdFkwQ1VTakRSTWlWRjgrNUtrNkJMOHBHdGdiRWMrS3or?=
 =?utf-8?B?UTBMS2RQNFF6RERiYjI0S1VGVE9IZGJtVVdxSU5Hd0szVEJkb09pT1pyNzZ4?=
 =?utf-8?B?QUtMVjdHbHdxZFRqd2JrYU4reEE1RFc3aEZBSGFKWG95S1EwTCtoNHZCc3hQ?=
 =?utf-8?B?TnhIWXpiSlk1dG1IWXV4cDQydU1DVkNEaktkOVN2dkduaFpNSWY2ODVCM1hr?=
 =?utf-8?B?N0VCUDFqUTZaMWE0OHhuRHVVY2w5LzFGUnd4RlZNbGRab2dPMXNkb2dTZnE3?=
 =?utf-8?B?RTcwRGUydlBLak41SkRVczkyeHAvZjlRT29YRnlTYkRJcGNQQTZVMmRjOHV2?=
 =?utf-8?B?WnpMa3Q0MW0xM3lxRjF5MFJuMU9ZMXlOUWp5aysyb3d4cE5mSUdZMThFc0Ev?=
 =?utf-8?Q?ZyWSeqNihMppLyfd3sc6efKIe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6ed9e7-0c9d-4f31-6d8c-08ddb3d16635
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:16:50.4390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXIyFG4c2HnDClp82wDEsaP9rLKRYA8ixSiWIFvCQX6351cbKf08NjI6Vo6HdVroy3LDbZrkk2x2l0d0bH/g4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
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

On 20-06-2025 01:35, Naladala Ramanaidu wrote:
> Using tiled modifiers as the default significantly improves flip
> test pass rates, especially on high refresh rate panels.
>
> Consolidated report on 10 samples on each pipe as below.
>      - PipeA:  95.01% -> 100.00% (Improved by 4.99%)
>      - PipeB:  91.57% -> 100.00% (Improved by 8.43%)
>      - PipeC:  73.17% -> 97.94% (Improved by 24.77%)
>      - PipeD:  76.64% -> 98.89% (Improved by 22.25%)
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---

Reviewed-by: Arun R Murthy

Thanks and Regards,
Arun R Murthy
-------------------

>   tests/kms_flip.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 65016c66d..ca31ef7dd 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -282,6 +282,8 @@ static drmModeConnector *last_connector;
>   
>   uint32_t *fb_ptr;
>   
> +static igt_display_t display;
> +
>   struct type_name {
>   	int type;
>   	const char *name;
> @@ -1533,7 +1535,15 @@ restart:
>   	if (o->flags & TEST_PAN)
>   		o->fb_width *= 2;
>   
> -	modifier = DRM_FORMAT_MOD_LINEAR;
> +	if (igt_display_has_format_mod(&display, DRM_FORMAT_XRGB8888,
> +				       I915_FORMAT_MOD_4_TILED))
> +		modifier = I915_FORMAT_MOD_4_TILED;
> +	else if (igt_display_has_format_mod(&display, DRM_FORMAT_XRGB8888,
> +					    I915_FORMAT_MOD_X_TILED))
> +		modifier = I915_FORMAT_MOD_X_TILED;
> +	else
> +		modifier = DRM_FORMAT_MOD_LINEAR;
> +
>   	if (o->flags & TEST_FENCE_STRESS)
>   		modifier = I915_FORMAT_MOD_X_TILED;
>   
> @@ -2034,7 +2044,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		{ 0, TEST_BO_TOOBIG | TEST_NO_2X_OUTPUT, "bo-too-big" },
>   		{ 10, TEST_FLIP | TEST_SUSPEND, "flip-vs-suspend" },
>   	};
> -	igt_display_t display;
>   	int i;
>   
>   	igt_fixture {
