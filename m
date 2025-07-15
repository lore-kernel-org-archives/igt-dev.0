Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9792EC83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:44:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE7110E206;
	Tue, 15 Jul 2025 10:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S1w0Usww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD9F10E206
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752576256; x=1784112256;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a71irrEnoCCyxv1NIv1QbgmBhdqguJXRvoiizGOE7Ss=;
 b=S1w0UswwFIYQe/r5rg39SrCKXEvGS/YGDvriVAcft45414OtEaAKit2/
 kHNb6nSjzwt7LWS5VaqjhxYnDoLBA7KQuxix3T5dHI8pyrU9v4d0weoqB
 dK4bgf2lkSujh75PRSZp0YbcUNeEn9b4JI+c20Sk25oEEcMMh1W6eb+Ll
 +MHtCqVxeTyAYExOrfUEpBqYGy6aHKDg7M5tU5FQMhlJoLXdcb3MaWmuC
 zVxzsBOwDzxcDyvcX6Fiuy6kcNH8RW41uu501yh7SZxVNOE8t4p9tklvz
 Z91PNEwjlUu1dMaXY2dU1kZZyFHv8+h4Rd6MXur3svsR2UaywDlp/vNBC w==;
X-CSE-ConnectionGUID: qeDGF73WSX6wofbQM2JK6g==
X-CSE-MsgGUID: JvwAgbWATPeYkBrM8vqqNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65857825"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="65857825"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 03:44:16 -0700
X-CSE-ConnectionGUID: hcFVhBC3SEea4ke59UaU+w==
X-CSE-MsgGUID: pri5ZKEcQjKMcEjedocg9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="162839631"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 03:44:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 03:44:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 03:44:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 03:44:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNe4uIfJD03oPh3faSKTWTvXyRQs3V0gl9RG9p3N3/tuLXD1B5rJPIIz3O6SM/j35qM7gk1DSi4w7U9b9bpKm23FhBTNI4BKWZ3AC2LwAqc66cNQfswciIuwqsHgu3B1MbJKuQgXhaDUVx/DPAtjSuBMY+lW05ENH3smTcKxQwBEckt2lAYb2bT5yqndcNGukhjyKAG2A1qIfp20F32l99GSRZhzhg/XmSiTL4AGflgGGxl/jeaxeIbRih9SchARhDw+FdOxIn2UrvTtIdhehtnMKP754+UysHbvrKv+HiBPc4Zx239vrRN3hcYvTmY6PLSFbTALxO6UjVHfamxx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CS1el3ywSNE/Zzmfm+3CFLy9XdOsVKLsx+xRIjRnQg=;
 b=d7kIFWHrJtijMeK68mMcJq7ll6hyn+9Dn74dJW8n8lM2esSRm9v20IjH0Xo6VimIxEo4iW9WvQM6o17h+zu3OJD0psmVtc5gqQTqS1RQWMBMiQj8gh1qyUC2wOnh6dxbgNHIQ96wf6EPeYTE1w23I0W5dc2/wtZ7hsvEsTOqabb3J6pNL8rwsel8/FO7dYTZlFv8JK4Yr7gPF7vBcYv/ZvUgZ0wVe33ZmANw+4bReBgM91rKm509A1F6AWIKx0Z3Ci4teeiXDxh8V9BAvX6/NYRmAgRlJnEomUbErfu/yYsLn1tlT975RjiX/fg+PAm7QRCSR5ghiUBpOQ5U2z88hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM6PR11MB4594.namprd11.prod.outlook.com (2603:10b6:5:2a0::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.23; Tue, 15 Jul 2025 10:44:14 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.033; Tue, 15 Jul 2025
 10:44:14 +0000
Message-ID: <b2ab0add-8db2-4fba-8a6d-2c602e7f90dd@intel.com>
Date: Tue, 15 Jul 2025 16:14:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pmu: Skip tests involving engine
 activity on vm
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <ashutosh.dixit@intel.com>
References: <20250715070017.2900547-1-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250715070017.2900547-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM6PR11MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: c09073a1-738f-4223-cfd5-08ddc38c8a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnJXN3l1c0swdENHTmlqWVNGQzBEOEtmRTF4akZOaUZsYThIS3J2b1ZaNDlx?=
 =?utf-8?B?cm5Ndkw2UWFDRE80SS9KelFFRUtBZExtV25OeWVQbGsxM21jeVRMM1FUVndt?=
 =?utf-8?B?NXpxR3FOR3ZXYWFvbDl4dE93d2QyR1VvSEVEQ2Q0c1JQUElpNkEwYUdKTkFX?=
 =?utf-8?B?TzZUNE95bG9aT0dpakExeGUyZlFrY013eXhMemlDTTIwdEhaY29JL0liaEd0?=
 =?utf-8?B?VnJTcEpDa3pIVUx2cCtPNFZsckNsRkRwZWpCaGxQaHlrNVRzSkgyNE1lb1Zx?=
 =?utf-8?B?dGlrcTZ0YWdXdEdoWTRJdWo5V255UmNIWkRyU1IrRXNmaGZBNHJyakxzSmtW?=
 =?utf-8?B?ZVFIZU55b0hDMTRxQTIxVkhNdVRaeVMrTHhlbWdCZzF3cWlTZzZweVlGMGdn?=
 =?utf-8?B?bitlS0lSdmdTWHpieEgvNHRNNCtNTUNNSENCK2YrTVdLcEF5Vm95VmR5ZWhs?=
 =?utf-8?B?QVFkQkZSSnV5VXR2Z2w0V3hmdnBGNmw3Zm5FOXVBVEU5Z3NzenJzb2NNRWs1?=
 =?utf-8?B?Mlk3KzFTM3l2SklSY1dLWWJ6M0VCbC85UERuaE96eXRpVFRWOEoyNWJ2YTRI?=
 =?utf-8?B?emJEMG9TWXF1MU44cU40REwxQk54VE9hcEhERWU2TjNzeU1BS3hpRitHQVEv?=
 =?utf-8?B?YzdmcVhoeE15UmlxbHJ5YjJSbDV6MlVHTmZXY01aOEJqV2JZdWlVWGRjQ0ZW?=
 =?utf-8?B?cndwSjQ0eVc3d2p6WVErNTFCVFprVDlyQVF1M1IwYkd1bUt1Z0tRZnhjUWR0?=
 =?utf-8?B?ZlVWbHdKQ1hQai9SVGVMZ212WU9PQnkzT2hmRTY3Z00yVWFHUDBFNDlsQnV4?=
 =?utf-8?B?aExOam1MQ05rbUthU3ZYT25nYWZRMEQ5SisyOWdsUUdZVjM5c0RzWXJsN1Ry?=
 =?utf-8?B?M2Ruc1hyMTRHRFhhWHgrV2dRS05nVkNKdWNrbGtpTDNxVnJxK2lET3NHczlF?=
 =?utf-8?B?LytndW5lZlJlUVdOZ0ZrbmNrTHB5RjEzR3hUM0VtVzlzNXh3UWtuSTVKTi9v?=
 =?utf-8?B?ZDZsTi91aVJNM2VNZDFtL2NUZGZkdVpSSVVYQzByWTNxbGlMMVQ3WXozRUJj?=
 =?utf-8?B?K3RneDFiVHJ6cmZWM01PLzFCeHFtTTR6K2xXbnRyR3U4Qmd6VmJ4Q0xqaWVj?=
 =?utf-8?B?QlJZSG0yc09kbDk3cGR4NDVEcEJBbkNqMWZDSnR6Q01nWHE3NGk1UXFzM2t4?=
 =?utf-8?B?bEtrNWVBTUhxbUx2WnNVNEUwUjBtQXhoWnhicHIwZEh2cUZsRWZnbEExZmF5?=
 =?utf-8?B?SkdKVGlId0t6V3lGWFJ5YXZxVHl3c1JLT0NSUXhVcUs1c2k0Y3QrVjU4RTFD?=
 =?utf-8?B?alR5OHZyckkxcWg3YTV1L0EvOEdubThMa2d0emUxMTN0MXMyYXh3NGkzU0Mz?=
 =?utf-8?B?eE5DeFp3YXpFRGNMM25jN1h5TzV4NjkxUTdDOXkyR2xsejNCdXlIOUw4UUVr?=
 =?utf-8?B?RnN4TjFOM1pLcDBMT25MZ1E1Mi8xZHNkbmpsSGkybW50NndoVDdQa1ViY3E1?=
 =?utf-8?B?OFo5WEYyTktnRThSTTRCZlFnT0ZGWmhmT0VHY2krZk9uQm1lZThRMldxZEJO?=
 =?utf-8?B?dnZ3cTJnVGdHaTUySVFKL1UyN0FQNzl0djF6S1QxOGEwbm0vbWhNZVI3OGdx?=
 =?utf-8?B?c0JnWGpMaUlWanNidkNyTENWcUhPQW0xYldrcmJ1bitaeVVlQlVZNE12U0pJ?=
 =?utf-8?B?a3VucWtLcmNCNldFdVFJQUZzZFNyR1hCaDJCZTJ5Y0t4TCswSVFKYVlPdDZs?=
 =?utf-8?B?UjhidXRDRVlDMzZ6VklIRTVnRFdWaGI5amRZVEJoRjl0dUtWcVFXblJGUC9u?=
 =?utf-8?B?R2orOU9ObDVGUG5pK2krOHplUzR6SEdQdFZUckdxQmdFNzdQTlpmV2h4b2RM?=
 =?utf-8?B?UDZueTFJZ0NhcDNYYWxROUs0TUVnVlpDbEhkUzFqUGg5bTJiMTFqTWhJaHFW?=
 =?utf-8?Q?cOGJikp3wik=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czlkR0Vzb2RZK3V3bEU0TjYyOEVHNDNielJuSG92NElvMGtYTFRGdXQyTy9t?=
 =?utf-8?B?NjZLZW5KWWVIenJCS3pSU1V2S3l0Y1d3eUx2ZVpVVXloZ0F3ZTE2VWtsRml3?=
 =?utf-8?B?RGlGaDMzUUtpUFg5ZURtTk9JeVBmaTVRVVJpeFk4VmxMNGtaNzRVRVV0bm1z?=
 =?utf-8?B?K1NCZnFPV2ZDMTZIWkEzWVRLL3FqZllyVzh5L0pERkVUZGg4WU0ya3YrQXh4?=
 =?utf-8?B?Nld2bVN4TmlnZHFUVEwrcElQUGxYa0NQSXBTNS9nTlVpWEowQjNPSGZQcnFK?=
 =?utf-8?B?anlaUGZKUzFQQVBTcmxIWjgrT094OFBwVDFUQWNiMUJjZ0ZyWXFJR0QrbU1M?=
 =?utf-8?B?ODFZSzlYd2Iyb3lQMlFzTnhOTCtKM1lodFdudndXa0l3aUdoc0NoajVDMm4z?=
 =?utf-8?B?QjE1N0tJNzh1NkZ1cjNrVDNqMzdOekUvNktIZy9ranpWcDZHTW1pZkVudmJM?=
 =?utf-8?B?QTBmL2k0Y0VhS21wN3dvazNrZVVkTVQ3UnF5LzFUVWQ4R05iYnF6MTAvUTVt?=
 =?utf-8?B?ZElyWW1JV2NJem0wWUo5eHl4c3hDWmd3ZGJ1RzJtRy9KQjhaOWlxSzMyaTZR?=
 =?utf-8?B?STRIbFM1U0tUR0IxU0FTcmd1YVBiQjdES3VpcEN4Z3BsL242Q2ZHNUprRWVo?=
 =?utf-8?B?THdqQWF0ZEJMK2cxMVNMSWQyTGZTRmtoUGlMN0dSdzZybFVsUEhCY3ZaOERi?=
 =?utf-8?B?WmRYRlZZaGVVeWkzSkRYN2E4enhPdTBGQjNqaFMzZ3J5Nk1FaTJuTXJaajk2?=
 =?utf-8?B?dUMyRmViNmdGSHVUL1BjZmdmTUR5ejVKZkpwS1Q2cUxPcXFhU2V3aFYwOHho?=
 =?utf-8?B?Y0UzZFBSbjg0TTYxVkl6T2N1RWtDeEYrU084SjdMUWEySjV3T24wNFRpUzBX?=
 =?utf-8?B?dHUrQzVJZ0Q4bmlXNjlNZnZUMjE5K1RmVTQzYUlZYW1jZ3dQNFBjR2JWa0pm?=
 =?utf-8?B?cGhGR2w3cE03Mm51WFZ0WWpwUjdQZVNZSXF5R2RzcWdjTGJMK2V4UW9pVXVL?=
 =?utf-8?B?TnY5OXZ2bDJobXp5Y1FPZS9BcUJ3cGczWnFoY3ZyOVBMb0t0UURGbm1qaFlq?=
 =?utf-8?B?YjJUYjlDTGplek54Yk9ndW1HYy80c0IxbStLV2QxOGZtUTNidWhJNjVReVFj?=
 =?utf-8?B?Sm5Ec3o1Q3RLQnFJdHpneGFkTGlYUDRURDNVc1Z1QmpNYzBjbnd5dEJMZDI4?=
 =?utf-8?B?L1dtOHpQdUNtaUpiZnZ2MGdWdXhsWTIxeDNrdVhwVmYrVSs2QTJsVHpySWRm?=
 =?utf-8?B?VHd1RlNaNG5yNDNhdVVESjA2L2w5OGJ3NHFvTFllazhXTWdHNVJ4TnJNS0hO?=
 =?utf-8?B?WUdxSkpMWm1VQ0QvK3JVMkVvZjF5RlF6MnpoMm81dEppZUY1ZC8rNG9DRnly?=
 =?utf-8?B?VWYwMTR0SHRlRU9BejV1amorcENOVTQ1WWl3L1gzWCtSMWFpZlY2RkEzdkF3?=
 =?utf-8?B?a1M1dUREODliQnBNaC9jbkJZbHliNzBTTmxVNk0yOTJkbXBRUG0rK0hvWVhS?=
 =?utf-8?B?UFAvSnpKbFludk1ybjFJcUFXRWRyL3lDV3FYamdoOEF4Qm1laVprVUJ0NXlT?=
 =?utf-8?B?Wk1vY2FvWU5FdzRtb1NUQVQvaUs0bDRQY3VMQ0FTQ1NyeGN5NGtLQUFSelZu?=
 =?utf-8?B?bUF0MUgwdUJZell3b2Z6WDB4aG9ubHkwYWRsQlcvYmltQ2gzLy9FWkhVenRo?=
 =?utf-8?B?WkwrYzUyZmV6eUVNNXpJSnFCTkdBbzdSTzQxQUpDRXJVSGlCdDcwMjVBQ0Vi?=
 =?utf-8?B?Q2MrT1BCT2drK2ZqOUE3NUNoVUI0QUJMZzdPVWlJOVFINzJwQ1YxSzlDSUMz?=
 =?utf-8?B?OFoyczRFUllLcEtMUldFNzlHQzNxak04N1gxdDUyNGRTRXhiVGNnem5Hekwz?=
 =?utf-8?B?VWdCTStOZHkrRFhhcDBZcVlGR1p0U1hvUTRXTFhjVUtvRXcrZDhVOWtlb0c4?=
 =?utf-8?B?YWVDaHVpQ0JIMXVQMmVsblhXelk3c1hLQmdHS3JvR20xUWd4SkUyMW9nVkdG?=
 =?utf-8?B?Qmt2UmVwWWd5SFVXdzFXOS9sNFJmdGs5UnByb2lIWm12SXFhWjJLd2JBZkFm?=
 =?utf-8?B?SmNxandxTld4ck4rdnp1alBmSDh3SS9KeVp3SW5xeVB1anpFb2ZzNVY5d2or?=
 =?utf-8?Q?Aa2rZBFjDKko0BW9pUgVId25x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c09073a1-738f-4223-cfd5-08ddc38c8a85
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 10:44:14.7277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBFZltgJBsXFStF4tj9ExOz5BKjKqQrlb5COUL29e+C8WVoDccnrp+NTYv1a7Lus9bAuxjoA0nsWcaLqOc7kyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
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

Hi Soham

On 7/15/2025 12:30 PM, Soham Purkait wrote:
> Skip the tests and subtests involving the engine activity on vm
> as engine activity events are not present on vm.
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tests/intel/xe_pmu.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 0e5a7360f..9ac9d38cf 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -113,6 +113,17 @@ static int total_exec_quantum;
>   			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
>   				      hwe->engine_instance)
>   
> +static bool igt_is_running_on_vm(const char *device)

No the absence of the file is not the indication that it is running
on vm. This can be caused if guc version is lesser or any other reason.
Function needs to be renamed

> +{
> +	char buf[512];
> +
> +	snprintf(buf, sizeof(buf),
> +		 "/sys/bus/event_source/devices/%s/events/%s",
> +		 device,
> +		 "engine-active-ticks");
> +	return (!!access(buf, F_OK));
> +}
> +
>   static int open_pmu(int xe, uint64_t config)
>   {
>   	int fd;
> @@ -191,6 +202,8 @@ static uint64_t get_event_config(unsigned int gt, struct drm_xe_engine_class_ins
>   	uint64_t pmu_config = 0;
>   	int ret;
>   
> +	igt_skip_on(igt_is_running_on_vm(xe_device));
> +
>   	ret = perf_event_config(xe_device, event, &pmu_config);
>   	igt_assert(ret >= 0);

Is it not possible to modify existing igt_assert to igt_require?
If not, create a variable has_engine_active_ticks and check for 
existence of file and check for each test. But i think we should be able
to use existing code to skip.

Thanks
Riana


>   	pmu_config |= add_format_config("gt", gt);

