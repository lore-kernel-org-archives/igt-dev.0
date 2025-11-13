Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9AECD5BD2
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 11:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAD110E7F2;
	Thu, 13 Nov 2025 11:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n92zt2Lj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4F010E6D8
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 11:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763034540; x=1794570540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NSEscGUerDqqCZ4QSW8zGGWJgjd0rQ+feYO7RthO/FI=;
 b=n92zt2Lj9c1m5zBOR4tpVhwwnRENTDxZid+1QIaGVTOfhjX5KFvgmxAr
 7pUecfH6IZiu7lHJCCOwlQMN2B+m8x1dNiVTvOlagsg9YTHeZEDQTzdQl
 SuSGkSYVAFZ61RvXPf7daTI8Xaf+tl3OPJO/xpB7BsVCxA24tZqSTk40w
 iIY5WoC3VusCE0Rl7SlJKw/Fr43s9xnqyUZtEKWxHQ5pxaiCB//75u80G
 mpmKZ1hNZKEKWl97uWt2MuV6dcTIbx1RLMJUKW6EUb0VBF2iH0Lyy6kSZ
 71m7WtgfFo8hxnR5EqfeenV/fPPGbuJv+QSZU6L8uhAZqO6bqcTENHPIS w==;
X-CSE-ConnectionGUID: 76EKcMslTfS53zmUdBHM1g==
X-CSE-MsgGUID: MMDh0OwSTAKXU7zIgIRHDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64819489"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64819489"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:49:00 -0800
X-CSE-ConnectionGUID: rbpU1XT1TLWMeqedOlfkLQ==
X-CSE-MsgGUID: LfKZ2MZcREKyPjQnK3n6lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="189132883"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:49:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:49:00 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 03:49:00 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:49:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghecE9jjnoHbsumipaXwgy38mdJxKOqk0PFYReGftNyzeAxctEQKPhxfBZL/urXKb4GDTDov6ZCsE8GiNthp4aVyHI5KF/1ymXxHHIqSLwcSr0gcUMBl6U9B+w/+AoWP3F4UnFHufO04SMjJ3HU9Sa9JLFkD9ZFzebltOF5fxRCD7OfmrBexgbV54U/J34SjkHph7d1ZOQGKlPJLu56qBZObKIldNxDs5HK8+1lnw5VFAbqfLu3b32Tfqge1G37mbgdSB8B3hcRs5qScShOvRxTTvBtR3Al4wY7McO6/qWlBI6MjC9oU9AnlxXe5OpsuSTWRoOKxrHIqmD8F86ZKXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6B/tzbbuN2KsUiFPnIQBgrkwq+R4Xr5pmMa4mzxXR4=;
 b=CVXOYa0st0VxWkjV7QPxJnJ8IAqDSx97bf7r6N4xPhydrRTdq79wMjYXN5hiPc9/KccswB9MRfvezcek2QobzegHGTIeyAbWCIsfSNLu0wjIShD25YqdXdanceTQzTwW/DPNxOudpoyc8DXCaQ6EDwQnvPNowKBcb6SF4XBl24ZE+Ag47fgNknQl+lMRjx+667UP9esr5itxpgZsDdIHAzC1Fg+03kHS/ulNivsgGVsOEtQQLQWIUPVhncZJC7HIiuXNhAyJwqasS0gX3reOf+OLRARDN/JNeytqBLquJ65hnTrj/7a+dACUUEJeAzIYf66qHjfrpWiJQPAnbZb13g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 11:48:48 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 11:48:48 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Peter
 Senna Tschudin" <peter.senna@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH v1 2/5] lib/debugfs: Add debugfs helpers to open tile directory
Date: Thu, 13 Nov 2025 12:46:12 +0100
Message-ID: <20251113114615.3736269-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
References: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0018.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 30640375-3048-4c7f-3e05-08de22aa9bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UStJenZueGw0QW1CcXI5VWEraEZjMUVkWFBHZitOZndNTTcvU1UxUW9BTTRr?=
 =?utf-8?B?c0x1WE92dkZzd0xjd3BQZ1NQS3hPd2J6R0d3OHFJcWlXaG8rNFRiakE1UnZq?=
 =?utf-8?B?bXI1WmJUaC9RLzh5NkppaEQxaS9nS1JEc0FBbXRjTFVMeDJ5TnVYL016Nnhx?=
 =?utf-8?B?NjkyNEtLcCs2UkQ4T1pqQysyZnpkaUFSRjVRMkFmMXJUdGFvTWMwVmNKU0Vk?=
 =?utf-8?B?QVNHY0VYRHJSbUZ4V2djc1BmaEUxV3EweGRxaFBROWpoL3cwd1pqbzYyR05z?=
 =?utf-8?B?YVVhNlBiem9PVXdYczlValhrdGd3eDdlQ0dVWHp4aXhZNkNBeTRzOEV5b0d0?=
 =?utf-8?B?K1FGbHFOK3RvNXpaT2xScVBYZ3p1YlIrZ0t3U0tMV3lzVjdldjNKODRCR1Mv?=
 =?utf-8?B?LzBCWnNjNGxNa1JtTVFvUFczZVRJekh2YlRnSTNRY3NxajB5bE1HU1R6dThS?=
 =?utf-8?B?V1I1WFExbkRuNlpDa2pkUktrc1RCM3phdzZxN3cyaVRMYkVZQTc1QjNHQmtq?=
 =?utf-8?B?Nmt3RVVuRmZIZkVrQ1NsaFBmQ2R1TXl6b3JlRGFhZWg3UWVsbXhMdms4Qm84?=
 =?utf-8?B?TkZ2WHA3UVZmUDgyQXB0Q2NZOEJlbk14a1d5cUJaNGc3SEczcU43dU5XRHMx?=
 =?utf-8?B?OUVuZXlwV0NHWk9NbW1BOWhYdmZpZUYrekF3M3hnNFZSRTdGMW5DNTR4VlRa?=
 =?utf-8?B?NTF5QW9iYmkweDBDQmxaSEFDWUxNRUJ6eXdna01vMzFnZmowSytvOXd4Z3l2?=
 =?utf-8?B?OGhuOC9KVlpFOW82M09salFzWTl1WTRoT3lra3Y3Y01PV3haMlhpZWVFblV5?=
 =?utf-8?B?UFJxSzZRSkZNUkVCbzIzQWNQN2REUTRHeGM2U2MxUWJ1OXIrVzhRU0JqTU5u?=
 =?utf-8?B?UkJlUVJENUZmZVJjRnNCOHdTUW9qSElVRlNERnhlZElVQnovbzM5VHgxbkNM?=
 =?utf-8?B?Y1RySTVPaHFnNE9ocmk4c0R5ejFZZTVtcHNFSjNHa1pkU0tHaVhyalFRVzB3?=
 =?utf-8?B?QWFUcjJVZHgvWjJmZlljNktyQ2pvdGw4Y3I0MDZJVmgxMGlQV3FhWmNaN2E4?=
 =?utf-8?B?Y3BBdVpGaEtMaTBQUXFSRDRuejV3T2pPUE1vQ3Z0Z3p1bENJOTFHQmxaa1Vh?=
 =?utf-8?B?Tm1nOUdYMDFLV1QrNForNDFucXFveUVza2k2MElQVFdXdkl6OWo1M0pCck5M?=
 =?utf-8?B?Vm9VZlk0emtMM25XTitLYkg0eFFGWkwwRnBaQUs0V0NCWlRYZ3dyWGhTcmNy?=
 =?utf-8?B?bDNvb0F5N2szN01nMjcvSW81NEpRcmRKTTBPTHgrajRwSzVEb3Z5Ymk1Wm0y?=
 =?utf-8?B?OXZFc0tsUE9oeFpJL3I5eXl2NXhad0ZMc2U2aXFtWWU1NWJUb2txWXVGZmxq?=
 =?utf-8?B?UGVjYk9qQjEzTGxsZmhmcWxlSXJwVjF1T3p1MzdHQlBhZGIwRjhwNFJuNUNV?=
 =?utf-8?B?eVBSWmhHNHZCcVBXdWk4R29OMFhlSnY2QXZLWnJwaERRQ0RlajFNcEdheXdn?=
 =?utf-8?B?VXFPOG5FTjJybWVRMWdOc1lFaDlFcFNQS2JJZ0IzQVFaVmFMNkZKOXEzZmtV?=
 =?utf-8?B?MGdUUytkQWMwS0MyVlFyN3VDQTRxTXNId092WXAyb0V3YWE3Und4a2ZPOXdu?=
 =?utf-8?B?NmxrU2MxSTRFaDF5U2NWMis2K0FWVmllUkxHbEh6TW4ycXJPblhJNHNlUUlk?=
 =?utf-8?B?LzlMY0VEZGY4MlFmTnJEODJvbDNxZ08rVEI0anFLOVcva3J4NHJZeUV0cXVr?=
 =?utf-8?B?TC8rVTg3MjlvZkg0RzhHMTJFZmpCR1g2ZnREZUF5RDZyNlhtVlNJL2NJUmJL?=
 =?utf-8?B?QS8xWUNHUGlmMkFDTG5RbVoyc3l0ZUxtN0IybGxoVUpVNnRkWWtnTHZmTXlG?=
 =?utf-8?B?aTNIUEpZbjVNcFJ3aTNPUkhzTGlTa1VKbGpxK2JyQTZqY0lHWWlwM0JBTytE?=
 =?utf-8?Q?sbX7Re+96i1KMhOoke+sYiUHSohayo69?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STJuWWhsZzMrMFN0MzROMDYwaFVUNDVVR1FJY05NQ1FKaW9jdFlYejBSdSt5?=
 =?utf-8?B?eTZNRjRDYWZhdXdnOUljcHNZVU9CU3VXLzg1eGQyNUtMVlJ4bzhValRyYWZM?=
 =?utf-8?B?RjU0ZkFIdVRVT2I1RmVSVmI0SENQOXJ6TmRkTzRSRGpQNENRTnR1NnhhSHEz?=
 =?utf-8?B?YkRkZ21VdmhUY0tUcllSZmppekpqWFdJR3JFNHdmNnZwbDBuYzBRRDl4YkZP?=
 =?utf-8?B?VnRCNGg4c2k3eUg3K0pUeXVxbjZiNnlnQVgrVkdXY1g3dHVBaysyMzQveVYx?=
 =?utf-8?B?RVhQWjZLZE5odFFNbzJSY1JsVkQ2L2UrWHo3bTFSVHZkbVZpcHEzWnF2SFZv?=
 =?utf-8?B?dVU5YVpxYnhpYm1FZlBQenZtb2M5OEwzWVF0ZVh0TmtKSGMrVE1tbDVLWUh3?=
 =?utf-8?B?ZlVKRWpUWUJuVXRZaldqMGRJL255ZnBNZVp5djdENnoybkpYeno4VjBOQmV6?=
 =?utf-8?B?ak83Z1AvOTF0clJMY3dsSjFWMG9WaEhKM2lqQjNPcFVnRFM4WUMzaVFlTTc5?=
 =?utf-8?B?eFp6a3NoOVc5b2diTFNLbzk5dUJRRk5nOTREK2d4SWZnRTlNWWlWVDd1L3dK?=
 =?utf-8?B?MzFyUjRjTWZuVFJ4MHRBcXpQQTFhU0p0ZE8xME9tanQyYk1vODBVd3hPUVUx?=
 =?utf-8?B?R2pqR1lMK3FZcFZoa2lod0R1MEExZUNaenpPZElWSjRWbDMzSW9XcTBxSXFu?=
 =?utf-8?B?TlZZS1c5QzJVV1poZVdlSHdad1U4a00rcGtLNWtuUjhDMjAzQ3hWZmtKUE5D?=
 =?utf-8?B?SElHMEZLb0ozOU1JakFYMkRnaDdqckg3d3BEUWN0MDlOS1BzYmdaa1VHdXBD?=
 =?utf-8?B?bWx2RHhpbERHT0N0S2JQeVJSZndVV0dwL1JWZ2RvaXcvZHBaeVd0aUU3ZnNK?=
 =?utf-8?B?RXJNbWd1R0pJV2s2L3kzekV4WWhieFBLOG5sRitpZnhoRGJWcUNxVXlXZWlp?=
 =?utf-8?B?OGFKeTlVU1dFTUZJWWU2WFFvV2dHN3I3NmhCWWJsOERXVUxhaVBXMG1GTW5a?=
 =?utf-8?B?Y0ExbXZCeC84ZjgvcVYxcGI5dVNydXcvdkZJdm5LdDBETndXZnJVTzFOWDl5?=
 =?utf-8?B?TW1CT2F3YTRtZVdQZUtNa3JwUlljQVpYSlhUajlTRWd5MlJVblZWVnBPODFk?=
 =?utf-8?B?VVNUeXBYS2NSUWlOblB5UUdyRko2SUJsbWdsQW5KWmJhb0V2MVFLTHBiK1ZX?=
 =?utf-8?B?djMzeHpMRDZTNC9KVXQ0QTNzdnJ2RENmdFplSHcvbE1odnphTGJrUm1rZ1VT?=
 =?utf-8?B?QnRaMnBIMWxUaFB2MDVaQXM5Sm5rSHhFYS93SXc4bkpBT1BYN2VRQ0lNUzlh?=
 =?utf-8?B?OEFiS3hxd0FCWHlzTlJuaFlWNllZMXFxMmRHa2p5RUhnQUZMK1crNDgxamRq?=
 =?utf-8?B?WXJ4dVpBN1NkVGpnalp3bnQxQjFKdWl1VlBOckdnLzY4Q2c5cmFxRURKK1BG?=
 =?utf-8?B?TVNYRFZHbytDeWpkSG9mU0kwbDVqTkVUYmdDYlpqRXdmOUxNUmdIWUl3TWdT?=
 =?utf-8?B?YlpRSHpNdXlnU0YvUXlqL2kwVXhSWUhoQ3gzTlcwcFR4emlvSFh6M3FXdS9U?=
 =?utf-8?B?MUUzZFRlQmR3SmZPdUJGTkhiR3JxSy9PNmVWNjVYdzBXako0aDE5NkU2UUMz?=
 =?utf-8?B?RWRuZi9ObUFneCtLRkE3TjhUUCs0TTQxaXcvSFh3dWtUbEF4cUIyNldSLzFW?=
 =?utf-8?B?Z1ZFMkJYOHUrZ2k3SFpOeHZpZkx4MjlnbUQ3TWxRaC9zRGNwMlJJRHU0ajFx?=
 =?utf-8?B?WGhpUm1ZNmp0M2M0OHBOTnVsV1ZCRUpKLzVocUoveWsvK3FnQitZOXVJLzZ6?=
 =?utf-8?B?TEYwbkxmc213ZWgvMkZwVG82YkplcDR2RmlPdThidDFQK1pGK3pMamVsbXU0?=
 =?utf-8?B?UUNXZ2tTZGE1Yk8vTS9tRFBFSVFIdXpxUlFPb3pwVXQveVlPRDdjak1wSGFE?=
 =?utf-8?B?cHl5WHVxOGt6REM2V2UwNWVJRzV5U045STNsUC9kaG9QeU5uTFhYaG1sQ1ZT?=
 =?utf-8?B?QTFxYkV0b3NLVS9SY3AvMnFJY3FKb1RyZDV4UmpaTnhmNUJjWW8xSVlEeklU?=
 =?utf-8?B?bEkvYTkvTE5haUV4MHBpM2xTTWR2ZWJ2QkJFbU4wczhUaisrVXJTcjZhbm5l?=
 =?utf-8?B?S2tNa2kvQmNuZmtrRXFBT2FrTVo5T1BWczR2clNSczZxeEVpZ1R5cXYxTkg3?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30640375-3048-4c7f-3e05-08de22aa9bb6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 11:48:48.6807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpKXTrQJ+HYPrtdwiZR0oBr8lcRJ1Q12GiGwWiiMyd+R8Aa2CFdbEsQT4gRrcinyBBaUEPZurf4JvgW8eGCM//PpeGnGM3RHbcYz9a71TYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's add igt_debugfs_tile_dir to open the debugfs directory
corresponding to a given tile index.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_debugfs.c | 32 ++++++++++++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 210a9cea0d..dec936ebba 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -226,6 +226,38 @@ int igt_debugfs_gt_dir(int device, unsigned int gt)
 	return debugfs_gt_dir_fd;
 }
 
+/**
+ * igt_debugfs_tile_dir:
+ * @device: fd of the device
+ * @tile: tile index
+ *
+ * This opens the debugfs directory corresponding to tile for use
+ * with igt_sysfs_get() and related functions.
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_debugfs_tile_dir(int device, uint8_t tile)
+{
+	int debugfs_tile_dir_fd;
+	char path[PATH_MAX];
+	char tilepath[16];
+	int ret;
+
+	if (!igt_debugfs_path(device, path, sizeof(path)))
+		return -1;
+
+	ret = snprintf(tilepath, sizeof(tilepath), "/tile%u", tile);
+	igt_assert(ret < sizeof(tilepath));
+
+	strncat(path, tilepath, sizeof(path) - 1);
+
+	debugfs_tile_dir_fd = open(path, O_RDONLY);
+	igt_debug_on_f(debugfs_tile_dir_fd < 0, "path: %s\n", path);
+
+	return debugfs_tile_dir_fd;
+}
+
 /**
  * igt_debugfs_connector_dir:
  * @device: fd of the device
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index f4044d5458..76dbff3e8e 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -49,6 +49,7 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 int igt_debugfs_gt_dir(int device, unsigned int gt);
 int igt_debugfs_gt_open(int device, unsigned int gt, const char *filename,
 			int mode);
+int igt_debugfs_tile_dir(int device, uint8_t tile);
 
 /**
  * igt_debugfs_read:
-- 
2.34.1

