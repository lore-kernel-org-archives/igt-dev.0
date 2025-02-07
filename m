Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD239C02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 20:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C72D10E1F1;
	Fri,  7 Feb 2025 20:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnRSvgX0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D3C10E1F1
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 20:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738960032; x=1770496032;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=XlhKySaeP8MNfYE8kwe8UXA5mdlR/PXHE4hZhXHz3cY=;
 b=RnRSvgX0Kf0XwVy8pYjfu4edjcgWEitJP8jVnPr8Ex+U1al92Iz1uoQs
 8AegvTO+FMS5uDCwXiR1ARxRn1pq2ISQwIvL8LF5iaWcPQ/8SYECaHvCa
 eQ0UkK/ysAiJoApe9M0Zxb1Ez6S4R3gmbVYb9txSSa8HsLxUags4kxo4I
 N+KqsytsSd0hNegVkMEsTmyjaH6KWqBUo0CKqQatU+fdzhn+FutixbSsL
 1zBflO/OehvUj8H9Mmq4um3o3jCXk915ap9hyO24Qu3x1w9e35JIZtsSB
 7wa1kJ8pLauiSvAJqArE3JlSC9Ibk1qxjqmMIou8FJ/nXK3Vptx4NWt7/ Q==;
X-CSE-ConnectionGUID: eeN4v7w5TY65kmJkqvFK/w==
X-CSE-MsgGUID: DAdMgjusSyiddVaI/cusmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38811109"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="38811109"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 12:27:11 -0800
X-CSE-ConnectionGUID: 1acSlV8XRtqRTZfTyOh6Rg==
X-CSE-MsgGUID: 6YNiGowESKiNuQGfzl6jhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116226361"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 12:27:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 12:27:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 12:27:09 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 12:27:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dffqsDVhc7qVMsl9D1FH/iAX7lFcG6AhS0lkzp8i5NtlJNu4K76Z1RCXRVJ3fVrWbzyJ2j23mahRzzzM7fgSTaSqfMP0afwkHFN3qjLmv36MXennssKogXUpVREfwIuV4yxh4jjTPx56XTy+lUGM6gZ5aaCzAOuf+IigfcLTgkA+LcexYm06Otify1ijMhhqy0yJZgHbGunbZoxO32Gp6wYdbQ1epOL/eXRXPQwdFPG5gpE7uEpc+XcPNZzsNP9oHD6OCgMO+Uov7Lpxg5b8FtqHL1+hMg2PHjRt/goPU1pa/9u3MSodxMkZlPbTIk1im+uThmPhhSo5E6b65Gsuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpdGsU/YJ9MsAwC1i//CcNBJr6b4jqflnU9aYUVpvNI=;
 b=nXDkSUondFfs6hoRC4jZ3wSaq762V0s/pMd/Drtq9UrEtQJYiDuSabY/JJPPmreQx8L4hByUI3enH/tRxYNAne4/b9kMkUH1i3X0yDtR/FFf4L6WGA260ViXQs+A9c7UzwhQ8DfOoweihJNtQn1n+8EZW2DCn5khrTREZ7W4jq5yAvUaSe+VcgWWYibwkQl+7c0VthxKD691QBnJs9EdL+rGHYoctwsVmgojNHj2RqhDrfkYCX3QXLer4+0h1PzXFwqznDd36Rc6hHWx6E9gtt6c0MJJHeJNyUoUi/Y1/YmE+dF1m68ROy7Mt3TLJK3NCXS2AxRzJG/UgnEe8vjnow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 20:26:51 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 20:26:51 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250130172149.3657144-9-lucas.demarchi@intel.com>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
 <20250130172149.3657144-9-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v3 08/10] runner/settings: Add helpers to
 serialize/parse array
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Fri, 7 Feb 2025 17:26:48 -0300
Message-ID: <173896000827.1963.1702569933886933016@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:303:83::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf2f931-719f-45e6-852a-08dd47b5c13d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEcrbmVtTlhvZnlxQ1BjYnRtSUNaSThXSmpoMEZGcVpsVVFFVmpoVm9QRzU1?=
 =?utf-8?B?RzBRem5TT2tyRWQ5OE4ycFVNZG5FK3ZoNy9UbkxjUjJRMmd5dVlCSlFjZlR3?=
 =?utf-8?B?OEVsU1hGL0RKRENDbU1RdHNnbHM2R25EYTJIYVY4cE9YaEgyaW5Rd2JLVDA5?=
 =?utf-8?B?RkNsamZ6ZWduMlBEMDJ6a21ITkZTS1hEQ2FmaDNLTHgvcmtrVkFZVVZOcHVj?=
 =?utf-8?B?UDZUVGRCOExuVVFPcDd5Q3JGR3NUVVZtMnMwalFrWGYzeGRjdm9QY0V6bW9m?=
 =?utf-8?B?UDFJL3BoenlrVzJjaG1wbmRGb2F4QWNMVWlzTEUxcFp1anR4NkUwdGpyamFX?=
 =?utf-8?B?czdNVmd1dklZdE5HaTlTTlNEa1dZUXdNQ3dHNDlEOXc3RjFuelY1UEdKSDQw?=
 =?utf-8?B?K1h2MW5KYytFSnVFQ2U5YnB3VFpGS2hlQUNMenFqVC9MUzJvMTZZa2R0b1JW?=
 =?utf-8?B?Zm43bTBFWXlwUkwvdnJPb0NxN3M4WWp1NEFZeUordnhaR3JyMHhVUmFYdXZu?=
 =?utf-8?B?WVp5eXdWbXdFSzh1VVJvVmxQZFpPSzJ5bzFVS0lVUG4zdVp0TTVwOCs4YUxU?=
 =?utf-8?B?RnBJODVVUk9lazRIMFdEQzJNYnJid292VS9OVjFNU3FIdzVNaWxIZEFDSk1y?=
 =?utf-8?B?S0tyaHdDVmt6T1hYbWNnampSTi9hMTJJNkFWUzdvd3VpS1lVQlVpSXdPQys0?=
 =?utf-8?B?WnFTeXE3SXRLU21GMFliQzkwYUZ3Ukpvdlg4emcxSFJ4bTBHeXA5NXVoaXFm?=
 =?utf-8?B?cm9PVXE5R0diRUsvVEQ2dmY3amM3NCtYWUJtakd1Yi9DR3cvY2JtelgySXNs?=
 =?utf-8?B?NjByNkU0UFhkcEVGeU1yMEpaejRVNlJDR0tEdkhDSEdhSWFQR3N3eDFHNkhD?=
 =?utf-8?B?YjVqNSthTDJrenJiVHhKL2thbTRQZkZFNmFnYVNIeXh4NjN2RFp4Zk9KWXJl?=
 =?utf-8?B?L0FuSEZGWi9QcWJZYkFLeVJlMmJrUmNicmFMRGlMek5WS3o0U1dSemsrNmpW?=
 =?utf-8?B?cWs3ZzBxU2Q5a1E0MTlBdzFyaXRabGIzZkkzbTZlLzVvTTFuUUVTTXhvcU1v?=
 =?utf-8?B?dExjbTRVWlVWTTdpRkJna09sTFA5MzBpNGxxcGVsa0xyaTg1R0VxVWZ6T2Q0?=
 =?utf-8?B?YUtPWmNxbG1QMmYxNFFTeEUwckx3bkIrSWcxVWlUcmtCNEZmN2tpZ2FGUmRu?=
 =?utf-8?B?bWkyL01yZ3o3citGZTNjVklUYXcvaFdLb0NreEg5cVdkUTlMcXRWeXpqQUlo?=
 =?utf-8?B?ZjE1ZDVIYXBhSnJpZERvbGlEZ2Fqa0dhNG1mWDV2WUZadWp4N3pNUnRSMHVs?=
 =?utf-8?B?KzdnRE5tRzdmZGZtTlg5Wi9nemp1aHcvLzdNT3NFZVJBcVFQZ251Qko4UXU0?=
 =?utf-8?B?MHUzNVJybGt3Ymc1UVR2cnhYYWVuMlBzVTdwaGlyWmxKZi9SZXU4M0RiM201?=
 =?utf-8?B?L090ejZGQ2FFdWZuR0tQcEJ2TStiUVk4OXNqaFJkdHNONFU2a1F6MlFMbUtj?=
 =?utf-8?B?SlJzRWU4TWo2RWR5Ui9uK21ZTzhOMVNVL3pBa2RuaVRnTGxPbjh6TEQ3a2U4?=
 =?utf-8?B?aDN4cTNvd05EOTNmZTQ2NHllZW9DdXBzNVJKVzZ6WjBvaU5MY0ttOFZCYXJo?=
 =?utf-8?B?dzdYV0F0ZTBnd2c4emxwMFlnQTdUeFN2ZzlhM2pMVW9XOVQxWlVBT2p2RG1T?=
 =?utf-8?B?ZWgwVDRKbmN1ZmpFWi8xd2tzWTlBYjQ2dzZjVjhySkh3U0VSOEJObFozNXlK?=
 =?utf-8?B?OUxTSzlEQWx0Zm9qV3ZXVzYwWnlsdHdHSHdBejRlakdwNHRwU1M2UGlxMi9Q?=
 =?utf-8?B?eXQzME9ETTh1RXA3Q1FYUTVpVWhXSEpPSGkranlYRVR5VlVFbTltK3VxNWNn?=
 =?utf-8?Q?pCPFmUcXwCOx7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjJwa240ZW9Sd0Y1UGlpRDh1bWxiYUltaS9uVDFtemZUSXhIUmMyLzZYR1FR?=
 =?utf-8?B?UFNEUHJZMUw5WjJ0UEUxaHhJMWpVTFRHckkzRVV2Q3pLSzAwa0lIZm9zRHZr?=
 =?utf-8?B?cWlpcE1oakEwLzZlQng3U1ZjOHR1ZE5HdXZqKzA5Yk0veSt2emdRQjNPUnlE?=
 =?utf-8?B?M2tNS0lrekVjUUVSbytvNWRsSjI2UjZRZ0l3OXdwUHh0MkdBOEZwN0E2Wmw0?=
 =?utf-8?B?UjJ4VzVJOENLWC96LzNUVWI3Y0hyRnpMWWx5UC8rSHMrdXFUMitGY25TKzJW?=
 =?utf-8?B?S1c3OUY4bEZ3RjRNVWdDVjVuZ2dlWnh3dXpMRGxqaVFjZkJnMGpMS0dXQ3JR?=
 =?utf-8?B?MUlxamxTUWFpNm8zaDkxcnFIeFRPK1huazBlZ1pwYlI0Z0lncW5LWSsrTFBG?=
 =?utf-8?B?SFYrYjVJWnNHbUg4Qk56Q1RJYkpwMWNpempnbURHMW1VMjhtVzJtakp2Q3V4?=
 =?utf-8?B?Wk9jbklUbC91MFFNdnZtVDJKdXBMdndXWlhlUEk2Wm54cnFxUjRZUEd0bTFV?=
 =?utf-8?B?RHhqWXk4SSt0aFhKbGJFbklCWHdWcHlWWWxuL1JUMjVSRXgvcTZnTUtHaGp4?=
 =?utf-8?B?WjZaSE4zQVlpWmY1S3F6WWFxTG1ycHFUenNYb0gzeUg2aVVnb1cxKzFpdi8w?=
 =?utf-8?B?MkhCM0N2cHlkU1A2azR4UXlHZnp2YnNhQ0x1ak9GTFJ4cDZuWjB0dXhzOXJn?=
 =?utf-8?B?eEhRYTdVaGNWSHNxaXM5dFpmaDBtMklQZzdvZERCUlA4eUwraG5vUzVpa1pk?=
 =?utf-8?B?MUpvUkE5VklQM2lnbFlkRGxadFdJc3d3cUlkaE9LWTcwSk05R2cyQ0xQR2RD?=
 =?utf-8?B?QnBmYjBveTRoZUJYYTllc2V6aU4vUURMeTgxTGYvSUQ3ZW9nMUQ3d0Q4R2hT?=
 =?utf-8?B?bG94U3FXeHltT2hDYWVuSGFNWHhRR1dsbDZId0JMSEN6R096djc0bmE0aHFR?=
 =?utf-8?B?eDNJSFFrM2g5cWtpdVh1MEFyeXhWT1VlSDVqbGV4NGNhQUdSQVlNdVYyM1M2?=
 =?utf-8?B?Z2JFbXFJTjBDVXJRUkZxa2s5MTJOTVVpZjQxdkNFcndMY09RL2tOY094QmUv?=
 =?utf-8?B?WDRqUEw3WWpDeE0yd3pRd1g0TTNrdkQwZkJUY2tucUNrcGJZdExnaWlMK1Rs?=
 =?utf-8?B?NnRabTU1Tng2QVZEbk5MeTVkUDNRTW55aERZc1JycmhvMEpOdGZEeHROSVhP?=
 =?utf-8?B?TzRzRlB5TTJEKzU0V2JranFBd0QwbVBrTzFud2NocG1hRVY1QjR0eEEwbEJI?=
 =?utf-8?B?bDRMUlc1bnM3UFVERG9UV2grdm1mWU1hdDdLa05LZG02V0dpMmkrWkcwWGZW?=
 =?utf-8?B?eDdJTHBGcTF0ellHdmpVVXBUdkRXbFI1c2xZRlRLZWtGZ0FrNlBmZXFjOStF?=
 =?utf-8?B?OGdCN09zNFZDT2hlMHBIZXg4bEhsKy9UYW5GZVVHQzFKdjQ1MHRza0c2T01X?=
 =?utf-8?B?ZGlLSW43SGVUR1pNU3dnd2NaVzgxYUU5N1p6QVIwSDhhS1orNnQ1RTZtakgz?=
 =?utf-8?B?QXJYTjV1ejZjUzdkQlVFK2R1N1BBb1dxZ1VRU21RVnBhbUhncGkyT3FlN2pM?=
 =?utf-8?B?UG13OFYvUS91WWdFaUtCalNQR1F0K0NxRCtleEhpK0RMVmRPczlpZVNHMHhv?=
 =?utf-8?B?Q1k1emd1azlpRTZhWGtlZlRQSTJqaXpRM2FhNWduUzYyVU5wb2VjWXdxYlNk?=
 =?utf-8?B?SjZzSnFPbVpGemFpQnprY3I4NXpVMlU0MmtVRmo1R2d5RlBnZ0ZNWnY4bXMr?=
 =?utf-8?B?QlQ3ZE1OZnk5RXdCV1BMaTRPWXFRN2U2Zm52Um5NRnBRSjNvVVdLd0FIWGVP?=
 =?utf-8?B?MGkrbWJVdGdGUllUUXpqdzNLQjRYOVJ0UytRMzdLM3NGbFVUQ1Q3U084VUhH?=
 =?utf-8?B?a0RFTkFFa1lhZ09MUlo0cHRDQ0hRU1lyTHNSd1J6RUxDV28rdHMvOWdVcWx1?=
 =?utf-8?B?VnV6OWJNdis1Zjl5Qlpxczc1ZGlkdzhoSEVTRUxPV0d2Nk5ZeWlVSC9kMGlh?=
 =?utf-8?B?bFlBMzJYTmdpWUZNVGNxR1FGK0lHaWx1UFd5enRoS2lidlpXby80SE1LS3ZZ?=
 =?utf-8?B?U0hzSk9YdHNpNzdId0pITFBack8rYk5aNU5PUXRSNjAwY3pMVVNQd2FFVVBD?=
 =?utf-8?B?azhtMzRaZlJCWW8yUGlHbXZTRktuZ2NSWWUyYVlsRnVQbkJhU3djNlZqMFFs?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf2f931-719f-45e6-852a-08dd47b5c13d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 20:26:51.5437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vq5U1c1KlIo3G8creHyfxkpz2Yx2csMH0Ixwhtk8dg41wfxJRdHWb4Y3ssWMWRcWCtRG3yi+3tcvDgV1T6WIjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
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

Quoting Lucas De Marchi (2025-01-30 14:21:47-03:00)
>Prepare parser/serialize to handle arrays.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> runner/settings.c | 28 ++++++++++++++++++++++++++++
> 1 file changed, 28 insertions(+)
>
>diff --git a/runner/settings.c b/runner/settings.c
>index b527c01d9..62afd3534 100644
>--- a/runner/settings.c
>+++ b/runner/settings.c
>@@ -1125,6 +1125,15 @@ static size_t unescape_str(char *buf, size_t *n_src=
)
>                 escape_str(s->name, f);        \
>                 fputc('\n', f);                \
>         } while (0)
>+#define SERIALIZE_STR_ARRAY(f, s, name, name_len)                \
>+        do {                                                        \
>+                SERIALIZE_INT(f, s, name_len);                        \
>+                for (int _i =3D 0; _i < s->name_len; _i++) {        \
>+                        fprintf(f, #name "[%d] : ", _i);        \
>+                        escape_str(s->name[_i], f);                \
>+                        fputc('\n', f);                                \
>+                }                                                \
>+        } while (0)
> bool serialize_settings(struct settings *settings)
> {
>         FILE *f;
>@@ -1221,6 +1230,7 @@ bool serialize_settings(struct settings *settings)
>         close(dirfd);
>         return true;
> }
>+#undef SERIALIZE_STR_ARRAY
> #undef SERIALIZE_STR
> #undef SERIALIZE_UL
> #undef SERIALIZE_INT
>@@ -1256,9 +1266,25 @@ static char *parse_str(char **val)
>                 s->field =3D _f(val);                \
>                 goto cleanup;                        \
>         }
>+#define PARSE_LINE_ARRAY(s, name, val, field, field_len, _f)             =
   \
>+        do {                                                             =
   \
>+                int idx;                                                \
>+                if (!strcmp(name, #field_len)) {                        \
>+                        s->field_len =3D parse_int(val);                 =
       \
>+                        s->field =3D calloc(s->field_len,                =
        \
>+                                          sizeof(*s->field));            =
    \
>+                        goto cleanup;                                    =
    \
>+                } else if (sscanf(name, #field "[%u]", &idx) =3D=3D 1 && =
       \
>+                           idx < s->field_len) {                        \
>+                        s->field[idx] =3D _f(val);                       =
 \
>+                        goto cleanup;                                    =
    \
>+                }                                                        =
\
>+        } while (0)
> #define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, &val, field, p=
arse_int)
> #define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, &val, field, p=
arse_ul)
> #define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, &val, field, p=
arse_str)
>+#define PARSE_STR_ARRAY(s, name, val, field, field_len) \
>+        PARSE_LINE_ARRAY(s, name, &val, field, field_len, parse_str)
> bool read_settings_from_file(struct settings *settings, FILE *f)
> {
>         char *name =3D NULL, *val =3D NULL;
>@@ -1311,9 +1337,11 @@ cleanup:
>=20
>         return true;
> }
>+#undef PARSE_STR_ARRAY
> #undef PARSE_STR
> #undef PARSE_UL
> #undef PARSE_INT
>+#undef PARSE_LINE_ARRAY
> #undef PARSE_LINE
>=20
> /**
>--=20
>2.48.0
>
