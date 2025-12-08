Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA26D3B7E7
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 13:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A05F10E45B;
	Mon,  8 Dec 2025 13:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K49E8aJ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F6910E459
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 13:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765201798; x=1796737798;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wbhGkJs27wamSxrlYTt0vTi9G+VHnknAr/ohecqC6P0=;
 b=K49E8aJ2ran6+InwHrvj5PrIETpo7tOY2d9XNUGi4jcyO9K3soGzH+IS
 irzCemJIhQOYIAYw6sIAXwih75aDb8ozKE0zvKDwKfto6G5abtM2NT3cV
 a+XlX9RPJFsiWeMhwLC5mA0u+xDgnmw7LDs33QTdiIafHpEAW9o9FSxp2
 vH99fTHahU2N+MJ+LdWp8PQEjgAiBvLrQkUjd7jU/VCykccSSv0t83Ion
 hf8GDh8KnlaRvdr6T/dc3syiJ7TuQH+RykQ6VqNaeP5sezJH/hte9A5we
 OhcGKHDN3d8imdHx52GXzqCZMgkL2QsIgsxSi1cG9xlHvUx0rSU3Q8J4a w==;
X-CSE-ConnectionGUID: N6RrAOpCQjmrXNpyr/U1ag==
X-CSE-MsgGUID: QK0gpvFLQ0KmJNTo7x23HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="77760668"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="77760668"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 05:49:58 -0800
X-CSE-ConnectionGUID: 7zsGYodTS+y91jr5hqT8tg==
X-CSE-MsgGUID: UWUmmOQEQMCRtz9/pKHHgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="195557539"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 05:49:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 05:49:57 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 05:49:57 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 05:49:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKrudgnPu4awwT7mOJv8SlDbRKRYFdGMMkkmoh1vEDDcEKkd/j3aH18lzsuQHJT5zCOqjo0hV9er8Pg/04pK8GD/NWtuP2XKS5Ep3wkkyfCsunXAPDADd61NvRDMrareaIT1bUN0U6jsIdNkKJVUxcGOiN5mEKjMCKqhTiNyOoNNiM+NwOq55qlX3BrnDQBPgWulE15xU/DuIcwmdWYT8cAqOAyobAoFSk6e//8j0YWQvCr/yEekJyN5uGobmMxyFYo0KTQnfUKzbMlV3n/MHRDvE1macsxEBSB6lzJApXQzA/d8KyReV4CMIa5h86qe0/hU2ha7Iovdwus77fd5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC03ZvJizqJ8RwNurvV2sGvs/69y7wumJAuvmQUiHmo=;
 b=yjMyb/csK9RZOJjiFV70gfBvVgGh6bsrCB6/BVca5fZYQ4Q10wMWoqkcZWZMXOKBlaVRwoZDfKG14TYSsHWmHUJqzVw6vM+3JzpZxVOCZzo5Fd+Xpc3t6hbaL3AF3n205jZwdXxSZU2COu4+sYMsi65lCkJCtdm85jhWexUPuzaKud8kxOQHHkey4DtoqlSLJ33MC1OL7Rt4xpQusWfu6FE9UWwTJtvOJ7i8MLPvY+ny3+C/q2gYSp8KV4SezApl2dl8NKXSe2GEyHgB6hAFWiBQ/14kSUTvPdy8dh2dg3aMbrly1RRAhIFRQW6ZpSEbaEszNB8MFnnbhzNpxcjNrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB7203.namprd11.prod.outlook.com (2603:10b6:610:148::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 13:49:53 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 13:49:53 +0000
Message-ID: <883ee39a-f154-4aa0-9760-8ecf3c2d7986@intel.com>
Date: Mon, 8 Dec 2025 19:19:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v5 02/13] tests/kms_colorop_helper: Add helpers to
 clear colorops data
Content-Language: en-GB
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 <alex.hung@amd.com>
References: <20251205195312.1234330-1-swati2.sharma@intel.com>
 <20251205195312.1234330-3-swati2.sharma@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251205195312.1234330-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0133.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::7) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: 611bc4b6-0527-42e9-221e-08de3660a9d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHJIZGMraU9uYWd3R3U5aXlQNHdpL3dFUVVmd3JuTkxnZ1NyK1RGbHNZdTJS?=
 =?utf-8?B?TTg2V1VRVDFnUStRSy9LMEVFb3NLQWhXZm9LTE5VeUZ6NkVwOXVYWTgvWmx2?=
 =?utf-8?B?eXN6cG93eUNsMVhYZlRHVk5qSXpZNzg3VFcwNE53bTRuZVMyaGR0cUpidzVY?=
 =?utf-8?B?V2FncUVJL2ZYWStZcURNL2Z0dXA1OGZiUkM1ZkQyZDQrZzJBSW9jQzYvRytS?=
 =?utf-8?B?QUFFam9sdXZaQzZpcjNzNysrSEJhTVNxVC94MCtwZDVPOHZEL1czOFZFOUI5?=
 =?utf-8?B?REpVYkhsMzJPbmtzYXd1QmVGMmlvU05wMFU3MmxLS3pwZ1pUbEdRZmdZUHJC?=
 =?utf-8?B?YkVCajBVcjhqWkw0cFo2MEt0eUVNWmJLZUszZEwvTHdqWXpoWFBDTUwzSWgx?=
 =?utf-8?B?bFcyVlJGL3V0ek1kUS9mMERQQ2prMjJHMnVkQitzdThKMHcxdGRjSVJsc05o?=
 =?utf-8?B?L1pFZmNwdXJWQjNRc0pzc3JzdjVoOUNPTG1xM2FleFB1QnBQRUNQdFBodFlp?=
 =?utf-8?B?b3BjS1MrV21MS2xKSCtsOFBCTkYxRWNYdXZ4bUZOcFRpU1NhNUdnY2hyanY2?=
 =?utf-8?B?YmVoYXlsYlM3L0FYbjQyZlpTOEE2YzVVV0dwUFk4enR0WlRJdzY3UUkwM213?=
 =?utf-8?B?REhKVTkybDV4aEhWRGZOWkxvMU1nUkU4NWFIYkFFckVvb2ZhdVdoTFhGN1hR?=
 =?utf-8?B?K2Jkc3hsem5GOUVSS0VuVWJTOG5aUElUY3VnOUM4Smg4YnVranNPdUI3ejRr?=
 =?utf-8?B?SnlvenF3OTVwN2JjQzJ1eGhCTUo5U0VtY3l1VFFnMnRyVThQamJwdW5kaHZX?=
 =?utf-8?B?TnlSMFRxZVVxK2F3cXlIbE5xUStqZmRHMWlFdjZKQWFJSzdFV3F5a0Z5UnUw?=
 =?utf-8?B?cWtJN09SKzRSQ3RhdlBYVk5oQXFQWHNZM0FkSjBQd3pPV1U2UStxNWxZYVlY?=
 =?utf-8?B?M2VIUHVUOXl2TS8wMk1wZ3ZIaDl0T2NIL05XR1BJcEJxMU1tTFBBK0JPNnJx?=
 =?utf-8?B?NytFamY0c1I2SEh0RW9aK0MyaGRackowVzRDWGdYVUJFMkpVODk4bGxHQTJQ?=
 =?utf-8?B?N0tackw1SG9rNFRoRWkwN1lmaHBCb3ppekhEYzdMaWlDU2I2RkRjL1ZGZHh0?=
 =?utf-8?B?T0pic0lsNlNiYlpTWmZ6WFRBNGh2b2xoRHUvNlF0NGJTTjkwYWJzZWRPWFkr?=
 =?utf-8?B?UngxUlFiVG4rZjBJY2RSdmhiWDdVcUdZcUJob1JsN3gzbDZuNHhJVlFkS3Na?=
 =?utf-8?B?Y0xrSXZVYkkvSTE0SzBVQ0dkZWtQYkREK1hnYXdZSmN5dktLVkpiVTlIaEc3?=
 =?utf-8?B?RkExTElqQjl4dEQveUJKUVRZWFRJQVZCandvSVZXVDlNZFJXR0tnaHhtVHoy?=
 =?utf-8?B?TkFLRDBPbElUdWZ5TzlYQjBCQi9XSW4xUzQwMk82YVZXOTBXWmROMnk1Rllp?=
 =?utf-8?B?d056WXoveEowUjZnU21MNWdiNFFGZzV6enJTd1JYZFFxOUVObUpBcFpYcWQw?=
 =?utf-8?B?ZDQwSldsRmx1ZFcvckdXQkhxVHpSY2Fya09rUFZsbEx5dGI1eGZ3Y2dTanpO?=
 =?utf-8?B?akxzbVdQREJiTlpxTXp4dEtyUitMZG9QaXF3TWQwdGx6ZENmYU42ZDl1aUoz?=
 =?utf-8?B?SW1USlQ0K3BhMW1Vb3kvZkpCeDlsaHVTWjByTWkram1Tc2tOeGJhMC9WM256?=
 =?utf-8?B?QTlJTVdrQks0SVg3dFJtYkxLWVZ6MHprejdxREtrckRWT3NUT1haK2FrS1gz?=
 =?utf-8?B?ZDd1eGs4dHdsT1hpdndrMGFaZ05MYk0yOFMyRXk3WUtZcjNLRkR0c3dRdTNt?=
 =?utf-8?B?Wm82aFA2UmdmQzY2RmZjSXJyWkdJQnlXT3hWNnIrdEZuUjV5ekg1aC85MlZB?=
 =?utf-8?B?RUVTZ2dMNEtQS2xJcVlObDZwT0NablVoVStsOTZJb282akpmcTRrZ3kvUytm?=
 =?utf-8?Q?U8fzU2tEFxtt4fCgL2YHWQ5Lmzo8wk5v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG9GMUljRkZTWnVkb09rQUJKUnpMOFlzb2hhWmxTWE5jYmdsUk1lVmJGV21X?=
 =?utf-8?B?V1M4ZzhDdHNJSW1qdlMwc3ZpV3Z3Nys3eDdiTGZvbC9RSk5INWlLR096dmpW?=
 =?utf-8?B?MzkyMHVqbkVqcGJDNE1rOEZOa2xMcTZYSlFaM3VmN0dQUmU5ZjhkTFAycW9U?=
 =?utf-8?B?MGxsdWQ4dDhuck4vQTV2QUV3Vzc4NW9sR1AreW9oYUtwWVQ1OGh5TEZSWnhy?=
 =?utf-8?B?WmpVODNwZHhIbmhxRzYyZHJCWkpiOGErYnRhVHhSajVIVllPcHNlb2pkcENy?=
 =?utf-8?B?UFNjckR2U0lYdTFrbmRQQ3FCM2xrZDNmbzl6Z1hZa1FiNWtFL21EMjFtaUlS?=
 =?utf-8?B?L0thejFRM1Zvb25iRndiNXVmTTB6YStsdmtrT0ZYRzNudktCamdWTE00bjUr?=
 =?utf-8?B?bEtFbzFRaFNlbVh4STdscjhuQWErV0NhZlBmQzBZUXM5bnpLQ3VXZ1RIMm5G?=
 =?utf-8?B?VVplUkg1M1hTOUtUZ21wb3duMlMzcjhpZUVZaGJLOTRFK2VFVFYyd29sa0J6?=
 =?utf-8?B?OVV1aXVJRzdGUzdsNVl1T3lpZ3dwc01ydk5QTDd1aS9lTFhmbTNvQllsUjZ5?=
 =?utf-8?B?c2k5V09hODVOeWJjVjE3aXdWbmFVNGR6bmhxcXUwUEoveHk3MkJrbUQ0TnJG?=
 =?utf-8?B?RXNUOEVvZ1NLVmVuUk1ueU5Xb1BKTUhRaFBpNTlES1oveG1hV3Rub04ydHl5?=
 =?utf-8?B?ZmpIM2wwcXJCVmlHdkRsQUFWS05FZng4NlgzOCs1c3d3b0E2aUtPeXNsUHR2?=
 =?utf-8?B?aTZYV3dEbCtBbG5vd09TdUE2cTBZaHhldE1JS1RvNk5kZXJ3SGNBbWdlcEhG?=
 =?utf-8?B?ZUJkbmkwL1h6NGl6YWlmbit5MVExQndhZ0ZkVzN5MWZnd2hQekdYZGEvVTdy?=
 =?utf-8?B?VVZxSFpVcDR0L3Y5ajhLaS9Wa0ZtdlBlVVE0cFBBNkdjZkplU0NMdC8zNms2?=
 =?utf-8?B?QmpoaDl0bm1OS0N1cmYwaWY3c3hnaWFXZUJSY2JjNHFtVHF0OWlZcU55aVh1?=
 =?utf-8?B?UG4rNHNDWUxneHc3b01YdVBxR2JER1N0dStSam5lcHdLMXBpVlRwOHJrdFhq?=
 =?utf-8?B?WDRxTjNvVkZ2WDdkZmNlUmVNM0xENTdOZG1YKzhyY291N2JMUjBHaUNCVFVD?=
 =?utf-8?B?VVZTY3U2RDEraVlwN3pNaW1rc1dmeEpzRTZmWDdVdmIydG9qWUpja1BEQkJE?=
 =?utf-8?B?dG1NMTcxQmJ4SWptQ3g4QzJiV3FQQUlQaDM2U1BRVi9KanZEMDRuRmNpOUU1?=
 =?utf-8?B?K3Z1VHNrVi83RmpXL3YyYm96QXNUSzZnMnI0V0tLQjF4TTdkVnB4RitCa2FX?=
 =?utf-8?B?VlpuSFJNT2prcnM1REZBcXVHUUsrcVhNaTBGcFV2OHR5aW1ySnlqTTR2Rmxi?=
 =?utf-8?B?bGFPMi9Hbzc5dHBvZWYrVzRQMmVucmlVWGRGbUhGcEtFWktyMFltUGQwbnl0?=
 =?utf-8?B?aUhJWHdDV1kzOW5XL3Uvc3Q3Q2d3OFBCR01KWTVYaVNxVW1Jb0FYTUFFdWNs?=
 =?utf-8?B?YVNiRGxwTFM0QVVMMG8xV08xVFAxWnZVaEF5WFlubklJSzFGLzAweldKWDF2?=
 =?utf-8?B?MHBESDM0RVoyVXpiMTlPV2ZMcDJhMUVHWXdFc0NSUDNGb2c0Mkx2dFV6UkFZ?=
 =?utf-8?B?SXgrZWp6eWVSenBQelFwNVJIeVFmWjBrTTZjejFoNXN5RXM4L2IxUnN0bWQ3?=
 =?utf-8?B?MXBxNStiWmZtOHlGVDlEVlZvSDR6UW5hanlEemR0RUtXcDNhTDY4VnV6OVNL?=
 =?utf-8?B?Ky81dmozT1hZSEhHbnY4Sy9pVWtCRng5YVZuYXlvTDEvQnhYMUhtbGNqWXNr?=
 =?utf-8?B?c0RKT3JKOGJMTFRlZjcyNXl4NDYxL3d2bmpUcXpZZU1kL3I3THZYdkZUbHF0?=
 =?utf-8?B?SDlEbDJ4MEZVaGlTZnQ5L2JNZ1cxbDFqQmJ2ZGg1eHNQbFZEbWx3N3NQL2RB?=
 =?utf-8?B?VmlyQUhpalhybmNVS1NsS2JxcEJ2cHpnd01hRUZYYnBkMXUrQk05QzdyTkp2?=
 =?utf-8?B?K1F5ejhWZ3pleUNES2cvSHpBQ3JtU2pYSWhnR01uM2NuYWVuVDR1NUticUVF?=
 =?utf-8?B?L1ByTkQ3RWlSVGhSWEo1UVR3Ym15ZFlDc1J2NE1PYWFBKytMTlFNS0E1c2xx?=
 =?utf-8?B?cmpjdy9mNDV2UGxISU56L3dIYk5DM1RUME5IUlQ0YWtOWVNIUkJ5TW1tUGlv?=
 =?utf-8?Q?an/cmT2WhkzCcmu1UjX8Ets=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 611bc4b6-0527-42e9-221e-08de3660a9d0
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 13:49:52.9770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 544kiNVH6H/QeoFT70C5kGOMM8hRz4s8qxQcYtkEV5gz5DYHFijXVYuYmufEUMnGI153ar2oYnc7XGlYPAvUny895jPEMhyl5YDiPWijtlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203
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



On 12/6/2025 1:23 AM, Swati Sharma wrote:
> Add new helper functions `clear_colorop()` and `clear_color_pipeline()` to
> reset color operations and entire color pipelines to their default/bypass
> state. These functions:
>   - Set the colorop to bypass mode.
>   - Clear associated data blobs for CTM, LUT1D, LUT3D.
>   - Reset multiplier values where applicable.
> 
> This will be useful for tests that need to restore the pipeline to a clean
> state between configurations.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_colorop_helper.c | 31 +++++++++++++++++++++++++++++++
>   tests/kms_colorop_helper.h |  3 +++
>   2 files changed, 34 insertions(+)
> 
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index 8ef43461d..b5951cfc1 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -401,3 +401,34 @@ void set_color_pipeline_bypass(igt_plane_t *plane)
>   {
>   	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
>   }
> +
> +void clear_colorop(igt_display_t *display, kms_colorop_t *colorop)
> +{
> +	igt_assert(colorop->colorop);
> +	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 1);
> +
> +	switch (colorop->type) {
> +	case KMS_COLOROP_CTM_3X4:
> +	case KMS_COLOROP_CUSTOM_LUT1D:
> +	case KMS_COLOROP_LUT3D:
> +		igt_colorop_replace_prop_blob(colorop->colorop, IGT_COLOROP_DATA, NULL, 0);
> +		break;
> +	case KMS_COLOROP_MULTIPLIER:
> +		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, 1);
> +		break;
> +	case KMS_COLOROP_ENUMERATED_LUT1D:
> +	default:
> +		return;
> +	}
> +}

could be static.

> +
> +void clear_color_pipeline(igt_display_t *display,
> +			  igt_plane_t *plane,
> +			  kms_colorop_t *colorops[],
> +			  igt_colorop_t *color_pipeline)
> +{
> +	int i;
> +
> +	for(i = 0; colorops[i]; i++)
> +		clear_colorop(display, colorops[i]);

color_pipeline is not being used at all.

Will it make sense to re-purpose set_color_pipeline() to do this?

set_color_pipeline(display, plane, *NULL*, color_pipeline)

Currently with this, all the colorops in a pipeline will be set to 
Bypass while retaining the data/multiplier properties which were set. If 
we add the part where we are resetting the properties of the colorop, we 
can re-use the function.
Unless there is any particular usage of Bypass-ed colorops retaining it's
"set data".

==
Chaitanya


> +}
> diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
> index 41c4f0046..79bd5db3e 100644
> --- a/tests/kms_colorop_helper.h
> +++ b/tests/kms_colorop_helper.h
> @@ -110,5 +110,8 @@ void set_color_pipeline(igt_display_t *display,
>   			kms_colorop_t *colorops[],
>   			igt_colorop_t *color_pipeline);
>   void set_color_pipeline_bypass(igt_plane_t *plane);
> +void clear_colorop(igt_display_t *display, kms_colorop_t *colorop);
> +void clear_color_pipeline(igt_display_t *display, igt_plane_t *plane,
> +			  kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
>   
>   #endif /* __KMS_COLOROP_HELPER_H__ */

