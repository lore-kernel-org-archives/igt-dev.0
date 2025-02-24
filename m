Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514AAC021A4
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 13:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BCB10E3C7;
	Mon, 24 Feb 2025 13:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5cAjP9p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA9C10E051
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 05:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740375284; x=1771911284;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=e5+51if0nfCvX0QU2kPIw/EQDU6GSBSuqM/n3L26RNI=;
 b=D5cAjP9pc7RCa/nV1zG5i5ubSy1bzpEoyGY8iNV+aLGdGXksT3arN/QI
 q33q4jUPSHGO+7FDaDWdM9axA1piq5qsyip8aETcfk3YGxuJOBBJBJi00
 Msyipjp4TaqtmGiwyOGFSC1PH5YUioWI32xRl3sH4+g6JjJs05Cnq6dk3
 icQaLnXP49bgdnoGpEwWOJl3K3YZRUCV9K50VU64xOk6WBdejpUczNR21
 aoFFJ+oFdtRRxC7veWKmJtOiAASGFSNMBlgTTBA1FmtxT6EHgvoM/aGl7
 Tkye6jU+1+o5t5aSoDk74L9CjOLhie8sFSPDyFgUosXXrMSmldE6Ap0Sj Q==;
X-CSE-ConnectionGUID: 0EmAAlliQa2ouga4GXyZ5g==
X-CSE-MsgGUID: C65op5iQSteNwIrQOV2kpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41237326"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41237326"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 21:34:43 -0800
X-CSE-ConnectionGUID: f13F++DdRz2A0btYfb1ZQw==
X-CSE-MsgGUID: fiuXgIh2TNqJjhlnemXesQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="121048255"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 21:34:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 23 Feb 2025 21:34:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 23 Feb 2025 21:34:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Feb 2025 21:34:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmmOF2+WjGdSbYzkXNfBsPTD2UvJsv9XGRe0temF9GzZ7gvK2+jiWOfiPQHp9R/YKA7lLkO6c670lfbu1Qt3AnFbcY/nvFQMdRhDihbG1xll0iVtLpvrC2+BtyZCLBh2grqpx5oXl4OnULCP+PKzDLfz9lowcF8mIQ2MRAFcUaL6dFR48H1MMCOGceE4KVRgrXf6+dmjiAfV/csZAGI61RAcY/gYE5UReaSAMQc590JWTwVB9j0O7as391i9OwkfWImTr/gt3bPQMuIEhUgBQq7JmQtpIKJyfyrqMT7mW6t8/SNkwAjPfgejEwIHdVARE+bTsXRvxondA7zQVMLInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5+51if0nfCvX0QU2kPIw/EQDU6GSBSuqM/n3L26RNI=;
 b=EMNDlgUo69wwJEbh/cq7uK6VeqWm3NFj2x48maG6qzAsGD3R+PSz/GrqiakXWil8QjyddgzOIU/KPAlqLtoCtdK1UUmuRZKNx3kDGnnnhKdolq/9veS6HJlyiiVaBA4x7zskNMrjSxlMa/t+lQAxcb7cL/QS1SSwB81ji3GRxcuVdJk3Uv6t8StE7bn5kS3BG3EQjwGPHR5Ol6T5IY4TjCaLFdgP8fmBqRIucHb9KkLb215bKrMNDjSmsANf8cYqpcgDiX9z8CR839YRw+b0DT6A3zYEBBG0+VuJ+qeHbfutkpIWf59DBkj8awBsYABd0yiPQBTszvhcZEVi417+rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CY5PR11MB6212.namprd11.prod.outlook.com (2603:10b6:930:24::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.20; Mon, 24 Feb 2025 05:19:23 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 05:19:23 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2] tests/kms_display_modes: Remove negative test
 for extended display
Thread-Topic: [PATCH i-g-t v2] tests/kms_display_modes: Remove negative test
 for extended display
Thread-Index: AQHbhEKCRbXIWV+j3kGe0Ws1guhfWLNV7mxQ
Date: Mon, 24 Feb 2025 05:19:23 +0000
Message-ID: <DM4PR11MB6312E44BD1B2516A79BDB2A290C02@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250220103640.44879-1-mohammed.thasleem@intel.com>
 <20250221092500.15215-1-mohammed.thasleem@intel.com>
In-Reply-To: <20250221092500.15215-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CY5PR11MB6212:EE_
x-ms-office365-filtering-correlation-id: 09f48249-623f-482b-6c01-08dd5492ccbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YTN2YTFIbE15SjhGU0xWU3JyMFZsU2NDckdsTXd1c0w5YlZ5S3BoUktxZndv?=
 =?utf-8?B?YjZBR09SLy9Ub1NBNktjV3hrakVyTFZ2Y0NQaXUyUnF6ZmR5elM2VEIyMXhy?=
 =?utf-8?B?Ym1yWDlWR0VIWlp4WG1hUlYyZGVmK1RPc3FYZ1lybU5lMWxoaHhCZng3QUdU?=
 =?utf-8?B?SVZiT3dLQTA3VW5FaVJ2Qm44OGVhQ203NWpQV3piUjZFcjlLak1kWVFOQUpQ?=
 =?utf-8?B?d09pakZrOFk1VkQ0b0VhUW9UcWZ4cG9veXZ4bUdNV0RHUmRHOURsRWp3WnJu?=
 =?utf-8?B?cmRzb3BocU5uWjg3dHVSTmJXMjRCOWh1UTBoMXJGZlpyZ2JrS2VSOVZwaGxn?=
 =?utf-8?B?TzQ5a3BBY2ZodWJncStNckpGR3dxbW96YmpGNnEzM2FEM2prTVZkL2lLbkVa?=
 =?utf-8?B?aEFkK0IreUNXRTF6VFNkRXlCblo1K0M0U2c5STc4M2dtanAveTgxS1gvRDBz?=
 =?utf-8?B?dURQaUFLelVlZ0FaQWFST1hURiszVUJjZzBpQVJaZjIrUmdVcFhlRXVPeGIz?=
 =?utf-8?B?N2dEdnp3QmM3M1hoRkE1SUlZZXJ2MzlqYXcxcG55OGFoVjViU2NnN1Fka25E?=
 =?utf-8?B?N0Y5OFQ4aWdzeVVidE9tU0l1ZTdrTjdmbVU3R3dVRTJMMms1VWRSUlJza0Y1?=
 =?utf-8?B?S3AwQWVHek9JOUIwSjg4aTFNdFU0NFF4aWZ2dTNlcjM2NnljTkJPTkJlQTVB?=
 =?utf-8?B?ZXFoR2FMTTgvSUN6WHJGT0dLRTBaeS9tdkM0SXMyQ29wMnpUSFJJU042UW1s?=
 =?utf-8?B?RGdNaWxxcHhLdHlEQXlwbjBoTERRbW5RUlc4UDlLeUxSSUlyQmM4M2MvcHlG?=
 =?utf-8?B?SFVxd2l2OFJSZjcrMGxYYjNVMGhHZXJ3aThRbXdvNm1hMkhLYWRIVGFBMXVu?=
 =?utf-8?B?SnZsSDA1RzFqMUtua0RNOHQxMHo1dXJ6RHhQN1dwc08vMXlWRkJJNVE5OS82?=
 =?utf-8?B?RjBMUktEVzliOFJSak13VVVITjFqNzVicmttbWE2M3BibVZwTmQrTmlQaity?=
 =?utf-8?B?YmNhQU9EaXpIendHL1RWekJNcURzRUlYNUhjZXJIb01kelVhMDhkdmQ1T2JD?=
 =?utf-8?B?aGZXRWJENnE4cDNIOVVlNm9yNVBadWIrd2tmSGFHMUNoSkJLK3FyTWhIdTlW?=
 =?utf-8?B?RnlPUjVNVXRBN2h1YTBHaWo2YnlEL2NqcHE1QUUxM1F2djhoSCtOSUxwbVpM?=
 =?utf-8?B?QWtwbTRMRTJoL3NyRzZFR3hkZTVNcUlDSHN4TVZ3Zjlnd1JWUFVLakhSMXBN?=
 =?utf-8?B?YjZtMVljamF0ekFObUxmN3pEYlM1dmNLbnRYQmJjSVJkMDNEMWNscm1jem5i?=
 =?utf-8?B?aE1MSENhVnJmYmdpVFJ1ZE1BREcyUnNPTjFnck85N0VIeGUwWTNQemhsY01O?=
 =?utf-8?B?TU85Uit5ZTdBTm9GdkVZRGRoaCt0aWdIdEJJVG90dURSVU03QmROSjJlaDBT?=
 =?utf-8?B?YWIvcU91M1ZPKy9hNjl3M0hkQnJRVUIrMzVQS0N3THkxN0FNSWhaT0NJdnd4?=
 =?utf-8?B?MUNWajF2L3IvK2gxN3F1cmtzWFNSWWhWbkhZbGFOZDY2L3BaQkgrbWFtMWFZ?=
 =?utf-8?B?WGJPT1hRcTVIY1k5ekF6c0dwSktDcmtXZ1dpNWQ0c2lTVFlaYy9zSllvQy8r?=
 =?utf-8?B?WWxmaEd2RXIwUXVZbEl2Z2NOMXEwcnpVQW1ZMGYyY1RXd3poNXhiYmJqMDN6?=
 =?utf-8?B?Q0d5NFVqTHIraG9YcXpVWFJjQWVBb0MvNzhVekt5ZWZpR1pWdDl6bEZETUl4?=
 =?utf-8?B?aU1LOTdrYmVsdlZwc09Sa3ZOSzJiQXk3OGMvQW9IL2ZEYzVjZ2c4UXdJQUFr?=
 =?utf-8?B?S3JwUm1VVjJWZEpxQ2p5TElWWHFjaHlnczRmdDJ3N0hZajBkNFhxemRNM2wz?=
 =?utf-8?B?aU52OUVNU0Rub2wrc3FDNmJ2aUYySUdCak5NQzFKM2lMUjl3Q2o5NW1rY2Rq?=
 =?utf-8?Q?13761ztiIXahu1mYmZS0WtTsU3OCHscj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXp5VDZqVC9DUUxxMVU2MnU3SjY1Z3AwYkxtWG4yKzNDc1dYVFV2RVBhUUlW?=
 =?utf-8?B?UDJiVHg3bGs5dHJ2MTZTN2lDYWRkOUg1dUlBVTk4UVgyUEs5TTJSSU16Znlo?=
 =?utf-8?B?SnZHaC94c3lQbXVISitFOEJ5SGdFQUlpa1F6bGZZR28xY2xLNnVYQTlDc3dV?=
 =?utf-8?B?eHNIdm1DZVlFUTZpM2JRN3NEK1hHdVZJcFdWYmxTRlNYWHFmV2JlYkg5aEl3?=
 =?utf-8?B?VXhZYVBjUSt4Y2lnWVNkWVFGZ3l3bHdxbHdyVEp3V0JYSGpkcVBmSmZrREo4?=
 =?utf-8?B?VDlJN1BUaENnemk1QUdhS0UwZVpiRGVwWU50WWVTQUJWeVo5aFlNQ29EMExK?=
 =?utf-8?B?TGh5K251cTR2M216UHprYWdsQ3ovY0tPR1ZVN1p2aGJLaW1qdjkrd2JYRkZS?=
 =?utf-8?B?WnJicWJVcTJiOUxIOHhZM28rdUdCcEI5b0pYTURRNVBrSEdkZzNvamxOZ3lo?=
 =?utf-8?B?UnZ1NjdFZlVPYksyTlgzeEQ0QVJGMWtHMkZEVVZMREJ3SzBBMXlmZjY0UkF5?=
 =?utf-8?B?VzY2b21uY2w4QlYwcjJ5ODQ0R1hSRS80YzNlTnJtNkxYeEpSUlhnUldYQldv?=
 =?utf-8?B?MXBRQVczdUFPbnU0eHVINzZqT0VXU054UytZMmN0UXBCb2hwYVVQZmEvdy9T?=
 =?utf-8?B?RFVHRTYrckprQlRNMW95YlRNUE9zQWk4bW1RblYydGIwa04xSHc1YlNMdXlY?=
 =?utf-8?B?dnk3SzFXU3d4T1hxcHpuRDU3NzNUcTlLNjBycFp2UDVrM05CT3ZEMnAxcisr?=
 =?utf-8?B?VGNOdGRoT0ZuQjI1Mkk0SXRMM1NNaUEvUnBrbDkyeURFdUMvMk9lTjFFMFNk?=
 =?utf-8?B?c2R3cGp0MnNGMVVaMko1T2pMb3AxVG1od3QrVmJKSm8wWWdjbVNRV1hzVjRM?=
 =?utf-8?B?dWhNQ1pLSjQ3MzNrRSs3Q2pZamNVUlI1d0V4dGcxcElCblpJenZ3U0x6Y1lZ?=
 =?utf-8?B?TTYweU5LalpXaTB1aklQUXEwVTFqMElyYzVnNUsvN2hQdjludXQvdTd4V2VM?=
 =?utf-8?B?OE9ZSk54TEdIbkhZU2dMUWhRYVFjU2pFdGQ4VVpTc2RkRExSdFF4TUFWZzdx?=
 =?utf-8?B?ak84cUhCVlVWZjNSazNuQnhDZTFlaEVwa2FacEFRTnhmbkpRektGcXV3OTFX?=
 =?utf-8?B?UWdicGc1N3hweHRndVBSS1hTOG1UOTVsNklHOWtWR1FLdkt0UWQzOFROM3oy?=
 =?utf-8?B?bnkvUmRsRFNjMEk0dDZudTJZc3RsN1hWNGVxYlNyS05LQnhBWHpvRXIvL051?=
 =?utf-8?B?VUQ1RXdzSzZGNk90Mk14NHFGMnBJRnk2UzYzZG15dWNjUzlvTVRkeE5ENDU4?=
 =?utf-8?B?eUZ0d3hQRjM1U1AwbXNmSFVENUpzeDFOM1o5bzJqaFFpcXE5bk1UZmkvdkRr?=
 =?utf-8?B?SXRJTlBVU1ZienYraFRRYS9TUjg5cnlrbW8ycTJVMytaNzhrclNOM01tSHNy?=
 =?utf-8?B?RERqWU9tQlllNG9VRnNpVkp6Q2lkaUlISnc0ek9SMzNMNDdodWxNbm5ncCta?=
 =?utf-8?B?eW1Pd1JIWi9ULzN0QU5iSUJHVEFRRjFuZ3NPeTcwQ2lJMXYzUmJLZkRGb0Q4?=
 =?utf-8?B?QVozclFVcEFJaXdQWDZXelA4eWt3cE5Nem1UeHJUQXVGZFBIL1BzZ0dRVTRX?=
 =?utf-8?B?YkpsVkdzKzdPVlhOZUtYRGpoUXBtZFdxZUFxQTBFUXhmM0ZXZ0h2c1kxSUlV?=
 =?utf-8?B?aHB0dlJObmh5Y0pjak9Ob0xaR0xsWTFaSWVlNnFjdU5UaGFxZnBoaTFsWFpj?=
 =?utf-8?B?Z3pnVVp4QlorQVcwR3crVE1oSGpWU1F2UTBCYkhpTzFXcnFBUm05Tm9IOWEr?=
 =?utf-8?B?cXc0a1JiZUdqVFpkSEExaVRoWVVPZlEyWEF1ZTFmK3ZqYmZ3MEp3emVBYzJG?=
 =?utf-8?B?YnBwQkdMZTlWVHg5anBqczF6QzZvVnZEb2ZTZG9UNk9tdjBUeWlFQ3VtTk0z?=
 =?utf-8?B?aU85OEZOand2NmlsWFEyLzVDUDhtckJhd1B4Vnl5bXFvUVkxOGFZcXlUR1R3?=
 =?utf-8?B?dTRHNkVjTlFKZUcwUDdHa2JaU290am8rUFhseWNUQkV2SE5UUHBscVQ2Wjln?=
 =?utf-8?B?OGNtd2VlZFpIdEowajg4c3VTS1lnRTdaekcyQmVUZzZPUTlwSjJOaDRKMjVS?=
 =?utf-8?Q?K0q8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f48249-623f-482b-6c01-08dd5492ccbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 05:19:23.2900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qJu5cER2UaX6Ayx+yWrAF+dFwrgA8vxBZmaH92LRPQxCYHRgxY9tcCWoDtzgx7Itm2E1vu4SBCXlBnd5eyhmwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6212
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

V2UgY2FuIHJlbW92ZSB0aGUgdGVzdC4gTEdUTS4gDQoNClJldmlld2VkLWJ5OiBKZWV2YW4gQiA8
amVldmFuLmJAaW50ZWwuY29tPg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFRoYXNsZWVtLCBNb2hhbW1lZCA8bW9oYW1tZWQudGhhc2xlZW1AaW50ZWwuY29tPg0KPiBT
ZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDIxLCAyMDI1IDI6NTUgUE0NCj4gVG86IGlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCLCBKZWV2YW4gPGplZXZhbi5iQGludGVsLmNvbT47
IFRoYXNsZWVtLCBNb2hhbW1lZA0KPiA8bW9oYW1tZWQudGhhc2xlZW1AaW50ZWwuY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0ggaS1nLXQgdjJdIHRlc3RzL2ttc19kaXNwbGF5X21vZGVzOiBSZW1vdmUg
bmVnYXRpdmUgdGVzdCBmb3INCj4gZXh0ZW5kZWQgZGlzcGxheQ0KPiANCj4gVGhpcyBuZWdhdGl2
ZSB0ZXN0IHdhcyBjcmF0ZWQgdG8gdmFsaWRhdGUgRU5PU1BDIHdoZW4gdHdvIDJrLTRrIG9yIDRr
LTRrDQo+IG1vbml0b3JzIGNvbm5lY3RlZCB0aHJvdWdoIE1TVCB0byBjb3ZlciBiYW5kd2lkdGgg
aXNzdWUgaW4gTVNUIGNvbmZpZy4NCj4gDQo+IEJ1dCBpdCB3aWxsIG5vdCBoZWxwZnVsdCB0byBo
YW5kbGUgY3VycmVudCBiYW5kd2lkdGggd2hpY2ggYXJlIERpc3BsYXlQb3J0IChEUCkNCj4gMS40
IHN1cHBvcnRzIGEgdG90YWwgYmFuZHdpZHRoIG9mIDQgw5cgOC4xIEdicHMuDQo+IA0KPiBIb3dl
dmVyLCB3aXRoIERQIDIuMSwgdGhlIGJhbmR3aWR0aCBhbGxvY2F0aW9uIHN0cmF0ZWd5IGhhcyBz
aWduaWZpY2FudGx5DQo+IGNoYW5nZWQgdG8gNCDDlyAyMCBHYnBzIG9mIGF2YWlsYWJsZSBiYW5k
d2lkdGguDQo+IFRoaXMgcHJvdmlkZXMgc2lnbmlmaWNhbnRseSBncmVhdGVyIGRpc3BsYXkgY2Fw
YWJpbGl0aWVzIHcuci50IGJhbmR3aWR0aC4NCj4gDQo+IHYyOiBGaXggY29tcGlsYXRpb24gaXNz
dWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNb2hhbW1lZCBUaGFzbGVlbSA8bW9oYW1tZWQudGhh
c2xlZW1AaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ttc19kaXNwbGF5X21vZGVzLmMgfCAx
MDkgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMTA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3Rlc3RzL2ttc19kaXNwbGF5X21vZGVzLmMgYi90ZXN0cy9rbXNfZGlzcGxheV9tb2Rlcy5jIGlu
ZGV4DQo+IDExN2Y4MjMyNS4uZTEyZDA4ZjhkIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9rbXNfZGlz
cGxheV9tb2Rlcy5jDQo+ICsrKyBiL3Rlc3RzL2ttc19kaXNwbGF5X21vZGVzLmMNCj4gQEAgLTQw
LDY0ICs0MCwxNyBAQA0KPiAgICogRGVzY3JpcHRpb246IFRlc3QgZm9yIHZhbGlkYXRpbmcgZGlz
cGxheSBleHRlbmRlZCBtb2RlIHdpdGggYSBwYWlyIG9mDQo+IGNvbm5lY3RlZA0KPiAgICogICAg
ICAgICAgICAgIGRpc3BsYXlzDQo+ICAgKiBGdW5jdGlvbmFsaXR5OiBrbXNfY29yZQ0KPiAtICoN
Cj4gLSAqIFNVQlRFU1Q6IG1zdC1leHRlbmRlZC1tb2RlLW5lZ2F0aXZlDQo+IC0gKiBEZXNjcmlw
dGlvbjogTmVnYXRpdmUgdGVzdCBmb3IgdmFsaWRhdGluZyBkaXNwbGF5IGV4dGVuZGVkIG1vZGUg
d2l0aCBhIHBhaXINCj4gLSAqCQlvZiBjb25uZWN0ZWQgMmstNGsgb3IgNGstNGsgZGlzcGxheXMu
DQo+IC0gKiBGdW5jdGlvbmFsaXR5OiBrbXNfY29yZSwgbXN0DQo+ICAgKi8NCj4gDQo+IC0jZGVm
aW5lIEhESVNQTEFZXzRLCTM4NDANCj4gLSNkZWZpbmUgVkRJU1BMQVlfNEsJMjE2MA0KPiAtDQo+
ICBJR1RfVEVTVF9ERVNDUklQVElPTigiVGVzdCBEaXNwbGF5IE1vZGVzIik7DQo+IA0KPiAgdHlw
ZWRlZiBzdHJ1Y3Qgew0KPiAgCWludCBkcm1fZmQ7DQo+ICAJaWd0X2Rpc3BsYXlfdCBkaXNwbGF5
Ow0KPiAtCWRybU1vZGVNb2RlSW5mbyBtb2RlX21zdFsyXTsNCj4gIAlpZ3Rfb3V0cHV0X3QgKm1z
dF9vdXRwdXRbMl07DQo+ICAJaW50IG5fcGlwZXM7DQo+ICB9IGRhdGFfdDsNCj4gDQo+IC0vKiBH
ZXQgaGlnaGVyIG1vZGUgc3VwcG9ydGVkIGJ5IHBhbmVsLiAqLyAtc3RhdGljIGRybU1vZGVNb2Rl
SW5mbw0KPiAqZ2V0X2hpZ2hyZXNfbW9kZShpZ3Rfb3V0cHV0X3QgKm91dHB1dCkgLXsNCj4gLQlk
cm1Nb2RlQ29ubmVjdG9yICpjb25uZWN0b3IgPSBvdXRwdXQtPmNvbmZpZy5jb25uZWN0b3I7DQo+
IC0JZHJtTW9kZU1vZGVJbmZvICpoaWdoZXN0X21vZGUgPSBOVUxMOw0KPiAtDQo+IC0JaWd0X3Nv
cnRfY29ubmVjdG9yX21vZGVzKGNvbm5lY3Rvciwgc29ydF9kcm1fbW9kZXNfYnlfcmVzX2RzYyk7
DQo+IC0JaGlnaGVzdF9tb2RlID0gJmNvbm5lY3Rvci0+bW9kZXNbMF07DQo+IC0NCj4gLQlyZXR1
cm4gaGlnaGVzdF9tb2RlOw0KPiAtfQ0KPiAtDQo+IC0vKiBHZXQgdGhlIDRrIG9yIGxlc3MgdGhl
biA0ayBtb2RlIG9mIGNvbm5lY3RlZCBwYW5lbC4gKi8gLXN0YXRpYw0KPiBkcm1Nb2RlTW9kZUlu
Zm8gKmdldF9tb2RlKGlndF9vdXRwdXRfdCAqb3V0cHV0KSAtew0KPiAtCWludCBqOw0KPiAtCWRy
bU1vZGVNb2RlSW5mbyAqcmVxdWlyZWRfbW9kZSA9IE5VTEw7DQo+IC0JZHJtTW9kZUNvbm5lY3Rv
ciAqY29ubmVjdG9yID0gb3V0cHV0LT5jb25maWcuY29ubmVjdG9yOw0KPiAtDQo+IC0JcmVxdWly
ZWRfbW9kZSA9IGlndF9vdXRwdXRfZ2V0X21vZGUob3V0cHV0KTsNCj4gLQlpZiAocmVxdWlyZWRf
bW9kZS0+dmRpc3BsYXkgPD0gVkRJU1BMQVlfNEsgJiYNCj4gLQkgICAgcmVxdWlyZWRfbW9kZS0+
aGRpc3BsYXkgPD0gSERJU1BMQVlfNEspIHsNCj4gLQkJcmV0dXJuIHJlcXVpcmVkX21vZGU7DQo+
IC0JfQ0KPiAtDQo+IC0JLyogSWYgZGVmYXVsdCBtb2RlIG5vdCA0ayBvciBsZXNzIHRoYW4gNGsg
bW9kZSwgdGhlbiBzb3J0IG1vZGVzIGFuZA0KPiBjaGVjayBmb3IgaXQuICovDQo+IC0JaWd0X3Nv
cnRfY29ubmVjdG9yX21vZGVzKGNvbm5lY3Rvciwgc29ydF9kcm1fbW9kZXNfYnlfcmVzX2RzYyk7
DQo+IC0JZm9yIChqID0gMDsgaiA8IGNvbm5lY3Rvci0+Y291bnRfbW9kZXM7IGorKykgew0KPiAt
CQlpZiAoY29ubmVjdG9yLT5tb2Rlc1tqXS52ZGlzcGxheSA8PSBWRElTUExBWV80SyAmJg0KPiAt
CQkgICAgY29ubmVjdG9yLT5tb2Rlc1tqXS5oZGlzcGxheSA8PSBIRElTUExBWV80Sykgew0KPiAt
CQkJcmVxdWlyZWRfbW9kZSA9ICZjb25uZWN0b3ItPm1vZGVzW2pdOw0KPiAtCQkJYnJlYWs7DQo+
IC0JCX0NCj4gLQl9DQo+IC0NCj4gLQlyZXR1cm4gcmVxdWlyZWRfbW9kZTsNCj4gLX0NCj4gLQ0K
PiAgc3RhdGljIGJvb2wgb3V0cHV0X2lzX2RwX21zdChkYXRhX3QgKmRhdGEsIGlndF9vdXRwdXRf
dCAqb3V0cHV0LCBpbnQgaSkgIHsNCj4gIAlpbnQgY29ubmVjdG9yX2lkOw0KPiBAQCAtMTEwLDcg
KzYzLDcgQEAgc3RhdGljIGJvb2wgb3V0cHV0X2lzX2RwX21zdChkYXRhX3QgKmRhdGEsDQo+IGln
dF9vdXRwdXRfdCAqb3V0cHV0LCBpbnQgaSkNCj4gIAkvKg0KPiAgCSAqIERpc2NhcmRpbmcgb3V0
cHV0cyBvZiBvdGhlciBEUCBNU1QgdG9wb2xvZ3kuDQo+ICAJICogVGVzdGluZyBvbmx5IG9uIG91
dHB1dHMgb24gdGhlIHRvcG9sb2d5IHdlIGdvdCBwcmV2aW91c2x5DQo+IC0JICovDQo+ICsJKi8N
Cj4gIAlpZiAoaSA9PSAwKSB7DQo+ICAJCXByZXZfY29ubmVjdG9yX2lkID0gY29ubmVjdG9yX2lk
Ow0KPiAgCX0gZWxzZSB7DQo+IEBAIC0yNzQsNDYgKzIyNyw5IEBAIHN0YXRpYyB2b2lkIHJ1bl9l
eHRlbmRlZG1vZGVfdGVzdChkYXRhX3QgKmRhdGEpIHsNCj4gIAl9DQo+ICB9DQo+IA0KPiAtc3Rh
dGljIHZvaWQgcnVuX2V4dGVuZGVkbW9kZV9uZWdhdGl2ZShkYXRhX3QgKmRhdGEsIGludCBwaXBl
MSwgaW50IHBpcGUyKSAtew0KPiAtCXN0cnVjdCBpZ3RfZmIgZmJzWzJdOw0KPiAtCWlndF9kaXNw
bGF5X3QgKmRpc3BsYXkgPSAmZGF0YS0+ZGlzcGxheTsNCj4gLQlpZ3RfcGxhbmVfdCAqcGxhbmVb
Ml07DQo+IC0JaW50IHJldDsNCj4gLQ0KPiAtCWlndF9kaXNwbGF5X3Jlc2V0KGRpc3BsYXkpOw0K
PiAtDQo+IC0JaWd0X291dHB1dF9zZXRfcGlwZShkYXRhLT5tc3Rfb3V0cHV0WzBdLCBwaXBlMSk7
DQo+IC0JaWd0X291dHB1dF9zZXRfcGlwZShkYXRhLT5tc3Rfb3V0cHV0WzFdLCBwaXBlMik7DQo+
IC0NCj4gLQlpZ3RfY3JlYXRlX2NvbG9yX2ZiKGRhdGEtPmRybV9mZCwgZGF0YS0+bW9kZV9tc3Rb
MF0uaGRpc3BsYXksDQo+IGRhdGEtPm1vZGVfbXN0WzBdLnZkaXNwbGF5LA0KPiAtCQkJICAgIERS
TV9GT1JNQVRfWFJHQjg4ODgsDQo+IERSTV9GT1JNQVRfTU9EX0xJTkVBUiwgMSwgMCwgMCwgJmZi
c1swXSk7DQo+IC0JaWd0X2NyZWF0ZV9jb2xvcl9mYihkYXRhLT5kcm1fZmQsIGRhdGEtPm1vZGVf
bXN0WzFdLmhkaXNwbGF5LA0KPiBkYXRhLT5tb2RlX21zdFsxXS52ZGlzcGxheSwNCj4gLQkJCSAg
ICBEUk1fRk9STUFUX1hSR0I4ODg4LA0KPiBEUk1fRk9STUFUX01PRF9MSU5FQVIsIDAsIDAsIDEs
ICZmYnNbMV0pOw0KPiAtDQo+IC0JcGxhbmVbMF0gPSBpZ3RfcGlwZV9nZXRfcGxhbmVfdHlwZSgm
ZGlzcGxheS0+cGlwZXNbcGlwZTFdLA0KPiBEUk1fUExBTkVfVFlQRV9QUklNQVJZKTsNCj4gLQlw
bGFuZVsxXSA9IGlndF9waXBlX2dldF9wbGFuZV90eXBlKCZkaXNwbGF5LT5waXBlc1twaXBlMl0s
DQo+IERSTV9QTEFORV9UWVBFX1BSSU1BUlkpOw0KPiAtDQo+IC0JaWd0X3BsYW5lX3NldF9mYihw
bGFuZVswXSwgJmZic1swXSk7DQo+IC0JaWd0X2ZiX3NldF9zaXplKCZmYnNbMF0sIHBsYW5lWzBd
LCBkYXRhLT5tb2RlX21zdFswXS5oZGlzcGxheSwgZGF0YS0NCj4gPm1vZGVfbXN0WzBdLnZkaXNw
bGF5KTsNCj4gLQlpZ3RfcGxhbmVfc2V0X3NpemUocGxhbmVbMF0sIGRhdGEtPm1vZGVfbXN0WzBd
LmhkaXNwbGF5LCBkYXRhLQ0KPiA+bW9kZV9tc3RbMF0udmRpc3BsYXkpOw0KPiAtDQo+IC0JaWd0
X3BsYW5lX3NldF9mYihwbGFuZVsxXSwgJmZic1sxXSk7DQo+IC0JaWd0X2ZiX3NldF9zaXplKCZm
YnNbMV0sIHBsYW5lWzFdLCBkYXRhLT5tb2RlX21zdFsxXS5oZGlzcGxheSwgZGF0YS0NCj4gPm1v
ZGVfbXN0WzFdLnZkaXNwbGF5KTsNCj4gLQlpZ3RfcGxhbmVfc2V0X3NpemUocGxhbmVbMV0sIGRh
dGEtPm1vZGVfbXN0WzFdLmhkaXNwbGF5LCBkYXRhLQ0KPiA+bW9kZV9tc3RbMV0udmRpc3BsYXkp
Ow0KPiAtDQo+IC0JaWd0X291dHB1dF9vdmVycmlkZV9tb2RlKGRhdGEtPm1zdF9vdXRwdXRbMF0s
ICZkYXRhLQ0KPiA+bW9kZV9tc3RbMF0pOw0KPiAtCWlndF9vdXRwdXRfb3ZlcnJpZGVfbW9kZShk
YXRhLT5tc3Rfb3V0cHV0WzFdLCAmZGF0YS0NCj4gPm1vZGVfbXN0WzFdKTsNCj4gLQ0KPiAtCWln
dF9yZXF1aXJlKGludGVsX3BpcGVfb3V0cHV0X2NvbWJvX3ZhbGlkKGRpc3BsYXkpKTsNCj4gLQly
ZXQgPSBpZ3RfZGlzcGxheV90cnlfY29tbWl0MihkaXNwbGF5LCBDT01NSVRfQVRPTUlDKTsNCj4g
LQlpZ3RfYXNzZXJ0KHJldCAhPSAwICYmIGVycm5vID09IEVOT1NQQyk7DQo+IC19DQo+IC0NCj4g
IGlndF9tYWluDQo+ICB7DQo+ICAJaW50IGRwX21zdF9vdXRwdXRzID0gMCwgY291bnQgPSAwOw0K
PiAtCWVudW0gcGlwZSBwaXBlMSwgcGlwZTI7DQo+ICAJaWd0X291dHB1dF90ICpvdXRwdXQ7DQo+
ICAJZGF0YV90IGRhdGE7DQo+IA0KPiBAQCAtMzQwLDI5ICsyNTYsNiBAQCBpZ3RfbWFpbg0KPiAg
CQlydW5fZXh0ZW5kZWRtb2RlX3Rlc3QoJmRhdGEpOw0KPiAgCX0NCj4gDQo+IC0JaWd0X2Rlc2Ny
aWJlKCJOZWdhdGl2ZSB0ZXN0IGZvciB2YWxpZGF0aW5nIGRpc3BsYXkgZXh0ZW5kZWQgbW9kZSB3
aXRoDQo+IGEgcGFpciBvZiBjb25uZWN0ZWQgIg0KPiAtCQkgICAgICIyay00ayBvciA0ay00ayBk
aXNwbGF5cyIpOw0KPiAtCWlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pYygibXN0LWV4dGVuZGVkLW1v
ZGUtbmVnYXRpdmUiKSB7DQo+IC0JCWlndF9yZXF1aXJlX2YoZHBfbXN0X291dHB1dHMgPiAxLCAi
TVNUIG5vdCBmb3VuZCBtb3JlIHRoZW4NCj4gb25lXG4iKTsNCj4gLQ0KPiAtCQltZW1jcHkoJmRh
dGEubW9kZV9tc3RbMF0sDQo+IGdldF9tb2RlKGRhdGEubXN0X291dHB1dFswXSksIHNpemVvZihk
cm1Nb2RlTW9kZUluZm8pKTsNCj4gLQkJbWVtY3B5KCZkYXRhLm1vZGVfbXN0WzFdLA0KPiBnZXRf
aGlnaHJlc19tb2RlKGRhdGEubXN0X291dHB1dFsxXSksDQo+IC0JCQkJc2l6ZW9mKGRybU1vZGVN
b2RlSW5mbykpOw0KPiAtCQlpZ3RfcmVxdWlyZV9mKChkYXRhLm1vZGVfbXN0WzFdLmhkaXNwbGF5
ID49IEhESVNQTEFZXzRLDQo+ICYmDQo+IC0JCQkgICAgICAgZGF0YS5tb2RlX21zdFsxXS52ZGlz
cGxheSA+PSBWRElTUExBWV80SyksICI0aw0KPiBwYW5lbCBub3QgZm91bmRcbiIpOw0KPiAtDQo+
IC0JCWZvcl9lYWNoX3BpcGUoJmRhdGEuZGlzcGxheSwgcGlwZTEpIHsNCj4gLQkJCWZvcl9lYWNo
X3BpcGUoJmRhdGEuZGlzcGxheSwgcGlwZTIpIHsNCj4gLQkJCQlpZiAocGlwZTEgPT0gcGlwZTIp
DQo+IC0JCQkJCWNvbnRpbnVlOw0KPiAtDQo+IC0JCQkJaWd0X2R5bmFtaWNfZigicGlwZS0lcy0l
cyIsDQo+IGttc3Rlc3RfcGlwZV9uYW1lKHBpcGUxKSwNCj4gLQkJCQkJICAgICAga21zdGVzdF9w
aXBlX25hbWUocGlwZTIpKQ0KPiAtCQkJCQlydW5fZXh0ZW5kZWRtb2RlX25lZ2F0aXZlKCZkYXRh
LA0KPiBwaXBlMSwgcGlwZTIpOw0KPiAtCQkJfQ0KPiAtCQl9DQo+IC0JfQ0KPiAtDQo+ICAJaWd0
X2ZpeHR1cmUgew0KPiAgCQlpZ3RfZGlzcGxheV9maW5pKCZkYXRhLmRpc3BsYXkpOw0KPiAgCX0N
Cj4gLS0NCj4gMi40My4wDQoNCg==
