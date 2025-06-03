Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D422AC5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 03:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B2710E606;
	Tue,  3 Jun 2025 03:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nwwa10Q/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A49810E606
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 03:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748922960; x=1780458960;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xqsO7Bcd6jOcSJkAlW6o//Qz0+dKXIauzTQeioYX3XU=;
 b=Nwwa10Q/6FQyLCoAz4JdGem9jUdB1KsxnAPmvpGwVXfH27jefxjd7nE8
 PXsYkCKW7blnirz/lOkiisyM1spwcqrJk7HgFtZ/Ox0vDTMI+0RlXLm/f
 yK7yI5pOgRP7wrl8B+yyzhmaKn7S9FmQEq1KtLyXII2PByMO6JYgJfWGz
 7LK2f1C1WOO0DlKXkNFy+CiFvl0ifbfHjiS0Di1C+mvbQpywWPiyHhvgL
 DenbX/aS2B0/CO/Ac/9SbX9Yd99gnWVx7fa7xJN0V4iQro8/GrwbtV4Gp
 Rzsp0/qxxlnph1y/41FZdqrJOu89EcIRdOQaaDarb+KTUShAeSCdogTBT w==;
X-CSE-ConnectionGUID: 78JJaizVQou+yCcleVc6OA==
X-CSE-MsgGUID: LKQtf6LcTNCxdLo2Ph7tZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="73476739"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="73476739"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 20:55:59 -0700
X-CSE-ConnectionGUID: Ft54obddTdSbXRXDsasmrg==
X-CSE-MsgGUID: DUODl5tZQ22u1hdxyG3e+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="144604366"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 20:55:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 20:55:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 20:55:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.64) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 20:55:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gydmJNG4iwkW46mDrqyUmA6AVaLbYP53PfAedQ/Kt+IA2/qYW7Ma0Ofjp/sO/+ohlqXUg3X57Q9KmSFlJ0FS1Ya4TNrvggmYyse3jZc8mKCzYj0tyxwb3vEcfNAYZ4IY4rvAtWQSAC/1wDgZE+7YSfMvUNSE1Du3hhdPJfCkHL6Z5FfM0jXaX6f4rgcalEa0xUc6fHq5pOWn1wwL6VndbMZr44Qkd7pn1bFTVMXqybfAe+hE3h79MGOz15nWdefSFs0N9gYJZpc8GubeFp29BRNgHsgMPZl0c2VYHoXBzwM6uf5ZAnKgiryusVdLDg+mxtfSAfrPjv973Mdh9MTBeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8/1tchpS0SF6kxt1NRItU1TxSYSGi1NFMB1mVHHvVE=;
 b=jteriMka37gqNu7FRWKfQc/6st1EVvkDESTzagHW2ZIiErHtKUl3+Eal5kUaBSpJSjXoSdtfGaN4kdmdMO1hrmwNUw2DJGGAjNF0GznbDPBk+hbToG9NipdYDRu2E+KLHyuXSnaCx3sgliGVvP9I6WVr4sQyQcFptSXw+BEUSkOyNZo3vDVQmbXir9lez4d1xjNYIZtp9hwjzL9nMHWt2mvvsgMTA9J56Ntvsja2xTGO4nyKcDNR/hjFJuU2bm0NSUfxSlFgwFR0LmKdH/QKFmlu+IE+6QsyjdvPM60BQSgcloc8zGbeEb2NT4+UTH701y5qZPqgjY6wJx22MGXBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LV8PR11MB8747.namprd11.prod.outlook.com (2603:10b6:408:206::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 03:55:27 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%5]) with mapi id 15.20.8769.029; Tue, 3 Jun 2025
 03:55:27 +0000
Message-ID: <569895c3-f864-48ef-b26f-51f590303be5@intel.com>
Date: Tue, 3 Jun 2025 09:25:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/kms_async_flip: skip subtest on AMD if
 invalid condition
To: Melissa Wen <mwen@igalia.com>, Development mailing list for IGT GPU Tools
 <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Alex Hung <alex.hung@amd.com>, Leo Li <sunpeng.li@amd.com>, Harry Wentland
 <harry.wentland@amd.com>
CC: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 <kernel-dev@igalia.com>
References: <20250601191459.46759-1-mwen@igalia.com>
 <20250601191459.46759-4-mwen@igalia.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250601191459.46759-4-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LV8PR11MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: 300c4ddb-42d2-43de-b87c-08dda2527990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEo1SEd4azhrVENMNE03OGpLOUU4cm16bENiSm1CR3p3WXc2MXpPQ3dQNFBl?=
 =?utf-8?B?dW54SGdERzFUYmJ1M3lub0kxeExqamMwUVFKYnpQUnZxRzFyaDlYbEtsT1Jl?=
 =?utf-8?B?QWJPUkk4SnhHVnU5UUV2OFdCZk9zTVVVWmJGR3NMa1RsZkdpeG1uQlVOWmIx?=
 =?utf-8?B?L3kwQ0J3V3IyMDRELzdoQUtuQjZIYXJiTmgyUEhTbU1hYnM2cXg2cmdsanV4?=
 =?utf-8?B?V2xTRVRJOXQ1VnRVRkxDU0trYnY0TmMzN2RYbEVlSG9JcEtjaTlvRTFtUG5w?=
 =?utf-8?B?ekV2S1FFRVlacGh6amZqYWl3RkJVR0lJSEs3Q2lKZHlTcTY0VXZBZE4wdmk5?=
 =?utf-8?B?ZnVmVzlEWTN0a1Q1MTRWbjVGVkJPcHlkczVDcmJURXJRRmt1cmQ4eTl1OHJZ?=
 =?utf-8?B?cUdpTWdyeHB3dS9TRC94OE5WQ0NVWk5yL1MraytlbUphOGRrc1dYZXdHRDZh?=
 =?utf-8?B?azAwQjhVNXFWcnVQbmkxQUtHK1F6cDJLYmZ6Zmk2dExDOGlxOXJOMFlHcUtW?=
 =?utf-8?B?UkFvaVBBelgzZjVOOWJXMWIrMjE5TkhyS0crTEQ4QWJSY1p5MGRhd3dtTFNt?=
 =?utf-8?B?amRGcWJ1ZVVkdWxqYjhYckJoYnRoQzZJc0d0enVwRVlzNWlqaUpjdk8zcytV?=
 =?utf-8?B?ZmQ2REM1Vm5XNnd3TWtTWC9OaHZDakNlMW8xRnJQRTZrWXRiTUZuUFNQOEsr?=
 =?utf-8?B?Qm9vYjNiRUJielBjTnlXMkFRZ3diKzZOSXcyQnUvaUlaZ3g0NDRhVUk5endr?=
 =?utf-8?B?ZVNONlNCdURPQWwvcWNkV2JsWG5lSGtsTFE4M1d6dHJUVWZaL1RZQUw5bnZz?=
 =?utf-8?B?WHB6OGFnc3RZYTZzVUFyUkJzSVZ2WkFsT0gwakRlSVpYeEorYTVVYWJVdVBG?=
 =?utf-8?B?OFNHbDk4R3pGZHMxOTV3WWtLRGVuaVcrb1htK1BwOTVJU3V6eE04aGxsenhq?=
 =?utf-8?B?cHRIYnBmK2NNVk9QYjI4OFdGK3g4dmhuN0dFSHV3djZ0UzVESW5GcS83ZHUv?=
 =?utf-8?B?YzVwTnNic0FNNjM0RlhBbkM4WlZYaWRPNExFM0pta2Nuajl1TjR6bWExYnRD?=
 =?utf-8?B?Uk9JWm8zcm03TnlUYk9HTE82a3pSNGJHbGZVNkc3SmZQVFhYd1NMU2dFMnov?=
 =?utf-8?B?SGl0Rm5lSDJ5MjZtZnpjNm42UWlVSklmTUJNTGtmL0lwei9aOTdKZExORVRX?=
 =?utf-8?B?WXYyUWt0SG5oWVl1T0R1K0lxcDIyUzdWc0NYbDdvSWk0RUF0R1R6VVR0VVZk?=
 =?utf-8?B?VTRBZkl1Z2dVdWdNREQzZWhMMFBvNFNjc1R6Y2h3MXJoZW1HZXVFdUh1YTQz?=
 =?utf-8?B?TDArd0tVd291OVVvWTVMZHplWEJpRkszWWpUVEx4U3paOXNza1pZcG94U1Qy?=
 =?utf-8?B?cU1XRWltcG5Cc1hGRDEydDdVK0IyQ3cxN1ZBNGRCV3Vsd0Fqdm1ZaWtDOUpB?=
 =?utf-8?B?K2FSb214R1NaZVdYeVVHMXByRVJ0Sm5wUGtldzFxMWYxckh6K3N6NUp0d2lD?=
 =?utf-8?B?WG8wK0c1dXFRZi83NlpleHdINlNzZHgrU3BzYWtndHpZTURra3VLODFnR0k5?=
 =?utf-8?B?R2tDTFdvMTR5bzBZcXpiMFhZVmRnNFl2S3N1bjdqb2xqUmlCMEtyekptVW5q?=
 =?utf-8?B?RkZsK1NEV3N2ZXYzUkZ6NEFtNCtkMk9teXR2NnZyekdMRVBLcjF1R2k4NUgy?=
 =?utf-8?B?RXZJOWtCRlVpM3NoSENYVXN6WlVydXMycHBLSytsMGFiVUZwSkNWYmNycXVu?=
 =?utf-8?B?Z3ozS0pyOUpMc2thNGFpbTJxWkJZV0ZhTXB3Z0UzZHdWdVU2WGRkWng3ak5P?=
 =?utf-8?B?ejlSWk9JT2NDUUcxMEJjOWM5S3ZNU1U2dUF0Vk9WUnNPb0VVaEN0aFRHeGJI?=
 =?utf-8?B?aysrUXhjV0FaM00xall0LzhlTVR4aERmOGZ4VjF4TlYxMFBLT2QrWVBQamZ5?=
 =?utf-8?B?a2JhYzVUbjJvQ3gxeGJNb3JJVXpIU2pxY0VoNmZ2OEJVeHFlTnUycllIaUI1?=
 =?utf-8?B?Y1A0eFRkS2VRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmg3SitoTEYrNVpVRWhwTDV4akxQaHJlWVV4TjNDTnV5ZzMvWmo1M3dCb2NI?=
 =?utf-8?B?am1zM1VxVS96RDRML2NLc0NnclJsbnIrVUh6Ti9mb0YvR3dlL2R6Yjhza0pl?=
 =?utf-8?B?UTZsZ3JLT0ZRWWdVM3lYZnlnVDkvWnVxaVBoSG42bER5MUZMRWJpNDRpNEN4?=
 =?utf-8?B?VklHY1VIQTJmNW1OdHJnTTVlcXlPT0V4cUFpeDRKbFpPWUlIcHlQTFdiTEtC?=
 =?utf-8?B?VEFOTTF1TEdjL2szMEdsaWcwS1d6eWpUYW0ydzhiaFB5dVdmYkd5UFIvZnpk?=
 =?utf-8?B?OTZpVUdxZHJhLzkzdUFVOCtKenc5cklVUUx1MTdBVFNTRGtsaXBiN0llN0xl?=
 =?utf-8?B?TGh3VjBkV3A1SS9FR2RrRW9pNndUUjd3N29NaDNhYmo1SUVQWVRKWC9Pc1Jv?=
 =?utf-8?B?Vk9hRkhJZ0gyeWZiSVh5ZUJnazJNRGxIUTZtY1RybnhZdHRXQThqY3krMHV5?=
 =?utf-8?B?cUlRWVpGY3p4UGh0OHBIWTYzR1J6V2V4ZEpMcER5L2lacTkzaDk1RkFlbzFC?=
 =?utf-8?B?MWY1RXVpUGFYSWU4ZUYrMTA2aFBkQ1k4aVk2NCsyQm9ER1dzaUQ3R3Y5bGdn?=
 =?utf-8?B?dWNkL2QvWE84YmtSbkQ4SmdNek1NRVY3S2YwWEhFNWlXNktPMjA1bGFZQm5q?=
 =?utf-8?B?YnZNR25zRjBuTjZ4R0JvOW1aUGdCejRGUFpPOVF3ZEdZNlJqV1VEMGovdE1I?=
 =?utf-8?B?NFk4WnB2U1lJVi9HN2RyaHlLTFJldGJvL2k0UGpONHBTTzJUbjMza1pGQUZX?=
 =?utf-8?B?N1VscVNpUUxSU3dndEUzQzhUeWFRQ1RSWGM4a1kwbThQTG0xaW5CVGhubUFN?=
 =?utf-8?B?K0I0c1d6c3lhZzR3UUFWbndaZThPNGo0NnEzTmlKZ092b2NmQitCdjlSTUo0?=
 =?utf-8?B?MWNpcTZITjlBNHltaFFhYTZ2R1RqblRLMnRmK1c5d0lzeXBramVkWWVGeEwy?=
 =?utf-8?B?K3J3QUpVMFgyYmxaZjBKWkpzWmtVNGl2QzFCazJIcGYvMWE5by8rVC84K2JE?=
 =?utf-8?B?YTJHaFlNOHFtVVVncDROZzF6NmFyajg1S3g3MU1ZdWJ5NDA4ck83Y0Q3L2dU?=
 =?utf-8?B?NERib1lXekNWQVVqUXFqQ25KQWFsdWZjOER1bWRCdWRldGtLdWd4dVJkczJt?=
 =?utf-8?B?YXB4U1NRK24vUXdHMGtmZTk0MnpCVVVWWFEyVHY4VzhvR3lyN1R6SUNXSTlI?=
 =?utf-8?B?OFpCQUYycklycEp6dG5hY3JUVlVqTTFCa1ZLSmE2eHdHZzZ6azc4YTkyMEE5?=
 =?utf-8?B?cllVVUdxWWxMK0RWblhUVU1JTFBabi9RNDNhY1drQkE1NTFsRHYrd0czR1pQ?=
 =?utf-8?B?eHVJenZGdGxNcXdFT1FKbmdad3dqZW4yR290REtVWWNEeFd4d0t4dnY0UVp4?=
 =?utf-8?B?eDNSeXlHRkM0Mm91U3RsODUrQTlsck5RTW9MN3JUcU1NOEhaWnZDa1BpMnA5?=
 =?utf-8?B?di9Pc0RVMGZWY3kzNjdpa3JGRzhtRGZ1dDJ2N3ZoZmoxMEgvTE9lNnQwVjZx?=
 =?utf-8?B?Mk9sdGxxdjR1TkVIVkZCU2sybDJuVmlQc0xVZEhIeXpzN3JQRnVhTWxGNW9w?=
 =?utf-8?B?aXNmQk1hc0pWZUVHL1VDU3ZBZks1KzJqMXBrRHBkZXYyblBVRmdVZVhpclZo?=
 =?utf-8?B?U0tDaVlOVi8xSy96QytMM3htQWMrdUx0ekltMjRDbGNkQUdrd0x5TjlVK1I2?=
 =?utf-8?B?WWN3WVEvUi9oVEdRQ2hqTVE1eEcweTE4dnVEREhCSlRPcjlibWltYVppQ0Jj?=
 =?utf-8?B?bmRzZFJSbmNBTlFNdm9YNmdOeVg0bTJYZTlqRGt4aUlQc2ZGeGJsK0tTd25q?=
 =?utf-8?B?Wm1VdzhORDNnMStsQXFKR2hPdzNSZXlFUXdKS2lVSGxRc3h6K1gxdkhvcFFD?=
 =?utf-8?B?Y2ltZ0hIUXdUTG5IZlFmZEFmeWlVZWR6U2QrOWh2Y09INkZQU1RzeVRJUzc5?=
 =?utf-8?B?dC9uTURsV3RTdFNMWHp5bjZvY1JqWjRuODBtR2NUL3Vka3NxTGl3OUJyQmt2?=
 =?utf-8?B?Z1VLRnV1bloxMGJTbGFia25BMjE1VWplcjEwY213emNZOVdZdUpuMEtaSndp?=
 =?utf-8?B?bWNFblpoVXRnbmhDdjhDZkhzUTdXZGNUZS9WK1lYNjlRcWhQL1lDbHd0S3ZC?=
 =?utf-8?Q?yZWZRYKZ2G/tQHXQimEsjONCL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 300c4ddb-42d2-43de-b87c-08dda2527990
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 03:55:27.0522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwylWGIwP3ioL5VanbL69ZoroFWJMLIwr+rVJca9iqoa+tEWDoekDy5jF4mdaYVEIsk7MxWjd9aGyMmsvn9VlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8747
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


On 6/2/2025 12:44 AM, Melissa Wen wrote:
> Async page flips can fail for any driver-specific reasons, i.e. when the
> driver can't commit to async page flip request due to hw limitations,
> the commit is rejected with -EINVAL since there is one or more
> conditions that make the request invalid. These limitations vary between
> vendors and hw versions. In case of AMD devices, async page flip cannot
> be perfomed if fb memory type changes (VRAM vs GTT), but framebuffer
> allocation type cannot be controlled by any userspace configuration.
>
> Allow EINVAL failures on AMD device and skip the test. Async flips can
> be still validated by the performance comparison assert if no EINVAL.
>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
Acked-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_async_flips.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 97128cfad..065ac9c49 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -410,7 +410,12 @@ static void test_async_flip(data_t *data)
>   
>   		ret = perform_flip(data, frame, flags);
>   
> -		if (frame == 1 && data->allow_fail)
> +		/* AMD cannot perform async page flip if fb mem type changes,
> +		 * and this condition cannot be controlled by any userspace
> +		 * configuration. Therefore allow EINVAL failure and skip the
> +		 * test for AMD devices.
> +		 */
> +		if ((frame == 1 && data->allow_fail) || is_amdgpu_device(data->drm_fd))
>   			igt_skip_on(ret == -EINVAL);
>   		else
>   			igt_assert_eq(ret, 0);
