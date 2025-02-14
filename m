Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B548FC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 18:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8DC10ED38;
	Fri, 14 Feb 2025 18:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kQtlWPMN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9728A10ED38
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 18:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739559343; x=1771095343;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kyHEdckJ1YpuvOZcx+5JuSda9HfwD3n9nXld1nh9ly8=;
 b=kQtlWPMNoWyGNbupVvHk3TXFfgz726P1I/efMp0QJ0kA3NV1R/IL/OyD
 xYdgOPMN/HZ3jw6ImYZhdTfGPr68b2V1AI6B0gAjlbwiRPeUWfL4sUWdp
 XfJUiGf/qEkvabfWvcpJjsp4zGQLCNq1aqz19JbecRAceUrI7kj3PjOT/
 y2t0jJaEALUlnRYeYmYKao1e50ADfOJXG7yK3sW4yNyF/Z+Ty2GZZzXGk
 o7f7K1B73AfHtMBWGE36xiUyItKwdrPekoQ03QFADbtTfDy8hr0SYoCvz
 5Zb1dyOrx7lT0AqAIw1r3dlaiXTWF2jLvbZgILxnhH9Yz/UdVmQUoo7ky Q==;
X-CSE-ConnectionGUID: awnV+INsTB+oKYxKEvrrPw==
X-CSE-MsgGUID: dWPeQzHxSf+LnVw22zUZYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="51722039"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="51722039"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 10:55:43 -0800
X-CSE-ConnectionGUID: g6cfox8bSsSvKVmXhhcxBA==
X-CSE-MsgGUID: WPUwRBBoQUqSm6a9/EzK+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113402285"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 10:55:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 10:55:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 10:55:42 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 10:55:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbniZQgnIy/Qn/9YFelojDK7Rf5IwAyCFA3U0y9iVniKIUomDrGvc/0q6oHnWe/Uj4eVZFZ+MySSehdmItFT12Y6OaVueCViF8R9dH2728Jrtb+0UGPpxfyyyGp6mvxP+xMwxvzcuEnjl94/WI4PDvCWqMSgjiN4bW0hjw+tx4ApTk4QRxM33y9/Dphc7I0SWD5EWpj+65GrGCoWMS55iqahsNX9XWINrHSmcscpQyfAjE7Q7Qp6GpXbf6Uhp8+hSatC5J/1mn9t2hVJHqIZzpDx0+BaH/CcbZPM7RgkDH3uXRXLOQs/uWHuNoJeVg/6/eHdEyTzbGp4u2ZksAzfkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwJpcGsSALdUkDPVAMqhpxulrVPY7zZ7RZ2/TE0v/QI=;
 b=Cfp6hvircuubdPl5GBSavDiBwOV5wwK3MTDRlsJbTksOzvN+lJAQfYaI4uIZrLWoXCDtToL+r7AHfcgUctzP+d5SFq59wNzFNwQICb159v/u4MSvXpqetEYs6Is2Cum5ydbEZ4ipvjkgVmbJDLFAmQRUAwqvFuqGl0UdkuOQeD1pAVWzxC7o0u+5ge29PuxfG5dnOtyS06rinOIElFe/w0XxnUsTmotVavEIj23oejaKJFFLhXHI/6HYOCeP4SlEZFLfrzZLwxYbQ11vFrmI6fNd9L3cmH6ni9t3BCcCwrME3wrQaYXVKmgFxM/2NnVHy+UQTVBGdfHKZdCc8GUYvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB7472.namprd11.prod.outlook.com (2603:10b6:510:28c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 18:55:40 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 18:55:39 +0000
Date: Fri, 14 Feb 2025 10:55:38 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_pmu: Add PMU test to validate
 engine activity stats
Message-ID: <Z6+Rqpjms2ruAw4U@orsosgc001>
References: <20250212095834.384508-1-riana.tauro@intel.com>
 <20250212095834.384508-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250212095834.384508-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0323.namprd04.prod.outlook.com
 (2603:10b6:303:82::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cee1dc9-ac30-4eab-de34-08dd4d292ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2ZJa3Jkc2hRcFRmbm1nSktvbStQdmwrcS9mR3AyZ0JmcDQxK3hGYXdNZUdF?=
 =?utf-8?B?ZWlWa28ycm9manNiTWxqZDFtNFR5dFVROEJRUmhsbDlPNnZmY3lQWjZRVDF1?=
 =?utf-8?B?M2h3REZXaTNxb0tzNjlXWVgvRWtpQzJOL1Z6OWJ3SXhSREhZVGt0U3BqNEhz?=
 =?utf-8?B?MFNYUWJkVjNNSCtmbW9vSlhCZkJJRk8zZEUzRVlnbnZmNHZSSXhkeGl6K0Jo?=
 =?utf-8?B?YzJvY2ExRGFHOEE2Ynp6d1dGd2p5R3BQYXFxelhwQlZHNzhwd1cwN1BZT3Fi?=
 =?utf-8?B?SVdrZ2tXUnc1WGtCV2FsWG1vTXp3M3FoLzF6ajBFSXU4clVvc1dCc01WdW1q?=
 =?utf-8?B?YTFUd0R0amVoSGpFaUlSb1ovRm5oTjdDRkFTWm1XUkdJUmRiRllTRmdyUWRY?=
 =?utf-8?B?b0MzbDJ0UExhbUxOK3NlVjZpOWlKZ0ZRWitEc0Z4Y1JTUVZHQlpwNUEwYTgw?=
 =?utf-8?B?NWxCZVI4MEVCTVh4Q1lsbGQrY3V0RWszdFI3U1gya2FxVndzL0l0N1MyUVNh?=
 =?utf-8?B?NUNUSDBwVWZPNlFkRUFRZXJYV1gxNmZJTVhraXFGN0loQlpDV3hhME93VzAv?=
 =?utf-8?B?OVFWZnBJbTg2S2Q0UXhoSEtSQllGUDB2VXpYaVRUbHhNOHlmZm5qaUdGV21O?=
 =?utf-8?B?eUhXSDlMZmJvV1p5OHg3VWhNN1N2MHBtR1F5ajcrcko4QnBKNzN2VXU5VlU2?=
 =?utf-8?B?VGRlS0RyWXNKeFQxalhMU1RDeTRwUVlFbXNFYWFka2k3NERra3BXREFrMnVi?=
 =?utf-8?B?K1lzRHo4RXFqYU1xdUxEblgwQ1JnWEFpSjV3QUVJdWcrVDFtNW1vKzhRUlF3?=
 =?utf-8?B?clRlMlY5OG1LOVE2KzV4QS9hdFJXR3pkM05ZYnpseDdTdnoxa3VrcE4xTDho?=
 =?utf-8?B?cGlJdWFkS0JLdWZKZm1aS2RUbXF3VnRZV25oczBiV2dVTi9waXRoYWRkRWY0?=
 =?utf-8?B?MGxCMzJtSDU1RG56STZGc3VMZFdVcU8vYTVEWDFvaENhWGJGbVdtV2FtT0Zz?=
 =?utf-8?B?dFkvYXhQaXNqcXorRjYyWWJ1Vm1QZDJaNFRJWm93NmdSTlFiSUxFS3FQcEdn?=
 =?utf-8?B?UC9keWRrUVBSWlZSdlVHenlqNStyUTNzcUQ1TncvM1BoMDZtSnBKeWw3akJ5?=
 =?utf-8?B?akdPUG9NM0NySVcwOENtOVFJVHczK3IxWUw3S2tZbXJLUmN0NThiR2xCTjJL?=
 =?utf-8?B?SGtHaHM1L0k4YU55SzdyQWhHcExKU2hlcGFlYWN2eGMrNE5xT3dua0YzQThW?=
 =?utf-8?B?VjRJQnBTaTBDckVlS2k2bnhHRE5CYkpoZEtOM0dqTWZsa2RuQkhLYndVN2dn?=
 =?utf-8?B?Mlh1d0NXdE1JN1pBUFN5VWVKOWxaclo5NXFQWGd5V21LR05lR2J6SkgvdHhx?=
 =?utf-8?B?WC8wc3VyS3BqOGZuMldFMVh6K2pnUlJVRENTS25kQXQvK3BqUWR2ck44aTFC?=
 =?utf-8?B?REtrci95bUp1dW5ib1YyS2ZaSUtvOWF5Z2R5c2FoeTg2ZVh3QkVvQ0NvSVd1?=
 =?utf-8?B?U2NLdmMzbys2QTk3enNPR0IrR1ovS29XbG93WkV1YjlMQXNmVkhZZjEyaDNW?=
 =?utf-8?B?RWZCeU1xcU1CZ0hUTWtDTStSbjRtNG0ycEMxeHFENGRBYzh4NkkzdUdleTJz?=
 =?utf-8?B?ZnZiL1VJVVNFQlNnbzF5Q3BlWlZIeGQ0cUlaUHZZOVgrQ1plR21aeTErVExZ?=
 =?utf-8?B?WG9nUmh5S3EzeWtNcnpCNGpKOUpTNGpDcCtEbFkzMjR3ZTBGTHJYTVpOeGVq?=
 =?utf-8?B?eWFFMlVUMjZ0TmlkQTE1QkZhTUlIVzBnaGxITkU1R0NoNU51aWNMRXROVlpp?=
 =?utf-8?B?YlJzYTBUWmM3VlJGY2Z6RDlzeUpxc1FpQ29TTDcxUUcxWlVUUG53UktGRDRi?=
 =?utf-8?Q?CB++UM8MSq5L7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0xvNmpNNmkxNktIeXluZDlGeHJtNTNHQnJHd1JERGVveWpRSVpkOExTdEFC?=
 =?utf-8?B?UzVpaGg2Ui9wcUkvS2lMQ3hoSGFXcm5DdVppOS9qNVFmWlg1M21PemNvSXZH?=
 =?utf-8?B?THBVenBrMTQrZXRzWnVZTUR5OFpMbXZkeklPR1pleVVIajVlY3lyM3JlZ3FP?=
 =?utf-8?B?NEhpR2Y4Zlo3T0NDR3NkNXVpTi8ycDR6SVk4WXl6SzNlS3MzV2s0bmNWRnJm?=
 =?utf-8?B?aVJhalJ5WGpmemptMzdKUWlCWUhYaXJLMkpiTEQ5RWlDbkNMbFZENmpYbGxo?=
 =?utf-8?B?eVYwbVlXNWtKV3orZDA4MGRKNG5RYVpLRnkvTlNPYm9SeTJpVXFpckNac2h4?=
 =?utf-8?B?MldhUTI2YkZYM0szY2R6VTBPdVFpZkxoSi91R2d0L3VOZnlzTUQrM3lDT0NC?=
 =?utf-8?B?Mk5GbEFKQ2RnQkg3aHRQb0FmY2d1VGloWWt5ZUxnK0szMHA2NDZRbFN6TFJN?=
 =?utf-8?B?OVV6dGxsTTdELzRuNWxrS0xqaXpyYWpUL1h5bnAwL2xUcktrMGpQcG1wNCtv?=
 =?utf-8?B?U1I2M3hrOTU5ak1yeHpRTkVFZmlCajlHZWFBc1ozLzdpeDNTS0RadjRkTWZx?=
 =?utf-8?B?QThaajVTSVJWSi9NT05acUlEclowSUdUOUFNd3FEKzdqL1BiWE9xVjZCWGY4?=
 =?utf-8?B?ZXlsLzl6VzRkeUNrUFNXS2tEcmxYank3VXUzZlhja3BVRUs4VkpxUzg0aVEz?=
 =?utf-8?B?Qy9CK0dINHF6bnZuUzEzUkxkWEFXY3lrRjFSNHlHTWxEeUpOQUhGaHZkVUFI?=
 =?utf-8?B?Z2o1bFlwZHRaSXFZdGFhTE4xZXVhek1CaWZIamRTSCtMMWhKNk85ck5ETWVF?=
 =?utf-8?B?MGFmSFNwY2tmZEFtM0QxdVQ0MjhDc1ZEcTlMVXU0cFA5dVdoRmo3aTdkKzBx?=
 =?utf-8?B?dDNKRnpyYkVtbGQ4aURValhQTU9MODJBYWVmWVQ1QWQrd3ozVjFiWmlCUmdo?=
 =?utf-8?B?MnBWRno1L0ZOSGp4bHlFaTVGamQxaFp5ZUdpamFYd2kzWm5oeDM1b0xBcS9p?=
 =?utf-8?B?QjBKRE1CMFVqcEp2MHdGckhHQ2xBdTJ4ZlRzQjBUdExjQzdDSHdUODdXOTVw?=
 =?utf-8?B?TW9lWFJsVkR6VENzR1dkNGt1VFA2Z0JPN05ZMlJ3aUpsbXMwbDExanZZdk1y?=
 =?utf-8?B?NmxUUGpvRFlKWTlTVmNDR0w0a0w5ZG1tSCtQY1FZQkpqZkhUczdjaXM1MXlD?=
 =?utf-8?B?ZnQxMTgzRWRQRy9hMVlIVFJvSlJPRGZWZlVGUXI5QmZPR2tuRDJhbEFRbGpB?=
 =?utf-8?B?MW10b1lOdnE0b2dBbytpR25OTytGUUZubHpBUS9zS01kcGZiSitHVlo2OHMv?=
 =?utf-8?B?dlVCb0hPb3NnMEdNdWFRL1JPYzBkNldNdERIQWE2c0RyQnkxMHlnZUVpV3Vq?=
 =?utf-8?B?cmxtblZrYS96VXlQYkIyS3cvcmR5MGNLVXJLK1pPdWRsd3NRMmI3aVUyTEJO?=
 =?utf-8?B?dG5sV0twNnFhakorSU8zYTVoRDEvSXkvZ29TVGpaQVYrODhESmdzQ2Qvb0dw?=
 =?utf-8?B?Z2tOWlYvVU5JV1BJTXM1L081K2graVQrQzZJaENicC9rQm44eExVR1FKNUVQ?=
 =?utf-8?B?RnRoZWowWERNMndPQ09qN1lQeUdTT2hST2syL1VrRHNKaWE0ZzdxVVVEQ0lq?=
 =?utf-8?B?NE0yZmpFL09pREg2TERLK3JlL3NRRGsvWjhVay9TKzJsZTYwYWtwNUlSNmZ2?=
 =?utf-8?B?c0lqRkdHMkpkYyt2YTBCaTdudmwvcEFXT283cHQrMDZOT3pxN0JacDRObzVX?=
 =?utf-8?B?cUkyN09idEc3R0xNYnRnS29jTlBSMFFXbElaRnZsOFU2d1RObVAvUXRHMW9O?=
 =?utf-8?B?Y1pRRElEK1dvQW5nL2s3aWJuNnBSSHk1WGx6b1RsbTdsRkRXUEJ6RHFCNVhS?=
 =?utf-8?B?L0tIVVUyTUhESDJmb2dwVTRxbFNFMkNoTDM5Y2ovVTdWMmVmclBIc2NCbXJF?=
 =?utf-8?B?OUxrVTBFYkwyN2pMOFZvT0xLcmlVUE5aeml1ZTFESzRXY05DSHlMMXZmMFlM?=
 =?utf-8?B?bDdUZ3hGNWM2K0FZQm1Mak1ic082dU9MOCt3S2xjRjd0bGVIVXVLdEJObTVn?=
 =?utf-8?B?R1YrcDBkUmJFUE41cThJaE0yTitLcUFXQXdpN3dEK2FxYVdaeHFFamZBNTBm?=
 =?utf-8?B?ZTluMEdRYlFXbDRzcDFIWlJiWVY1R3pZQmhyaVRRaE02ckg4MEhUWmpGcEYx?=
 =?utf-8?Q?94Jx4tZ96/Zvc2D5fdCKzkY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cee1dc9-ac30-4eab-de34-08dd4d292ccd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 18:55:39.8521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWQXWWtH3d6VD2o4lHZ1g3Dla6sFH3rhulVZzQykSIy7dsyv0mCQlE6sBiIVwox/5wkZxw2RMMzR7G5VYRpE0VgbmPXLGNtfC1WolKb0tzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7472
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

On Wed, Feb 12, 2025 at 03:28:28PM +0530, Riana Tauro wrote:
>Add a test to validate engine activity by reading PMU counters
>(engine-active-ticks, engine-total-ticks) when running
>workload on every engine
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 147 +++++++++++++++++++++++++++++++++++++++++++
> tests/meson.build    |   1 +
> 2 files changed, 148 insertions(+)
> create mode 100644 tests/intel/xe_pmu.c
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>new file mode 100644
>index 000000000..cbb825755
>--- /dev/null
>+++ b/tests/intel/xe_pmu.c
>@@ -0,0 +1,147 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+/**
>+ * TEST: Test Xe PMU(Performance Monitoring Unit) functionality
>+ * Category: Metrics
>+ * Functionality: Power/Perf
>+ * Mega feature: Performance Monitoring Unit
>+ * Sub-category: Telemetry
>+ * Test category: Functional tests
>+ */
>+
>+#include "igt.h"
>+#include "igt_perf.h"
>+
>+#include "xe/xe_ioctl.h"
>+#include "xe/xe_spin.h"
>+
>+#define SLEEP_DURATION 2 /* in seconds */
>+const double tolerance = 0.1;
>+
>+#define assert_within_epsilon(x, ref, tolerance) \
>+	igt_assert_f((double)(x) <= (1.0 + (tolerance)) * (double)(ref) && \
>+		     (double)(x) >= (1.0 - (tolerance)) * (double)(ref), \
>+		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n",\
>+		     #x, #ref, (double)(x), \
>+		     (tolerance) * 100.0, (tolerance) * 100.0, \
>+		     (double)(ref))
>+
>+static int open_group(int xe, uint64_t config, int group)
>+{
>+	int fd;
>+
>+	fd = igt_perf_open_group(xe_perf_type_id(xe), config, group);
>+	igt_skip_on(fd < 0 && errno == ENODEV);
>+	igt_assert(fd >= 0);
>+
>+	return fd;
>+}
>+
>+static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
>+{
>+	uint64_t buf[2 + num];
>+	unsigned int i;
>+
>+	igt_assert_eq(read(fd, buf, sizeof(buf)), sizeof(buf));
>+
>+	for (i = 0; i < num; i++)
>+		val[i] = buf[2 + i];
>+
>+	return buf[1];
>+}
>+
>+static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_class_instance *eci,
>+				 const char *event)
>+{
>+	int ret;
>+	char xe_device[100];
>+	uint64_t pmu_config;
>+	u32 start, end;

end is unused, not sure if the c6 patches use them. If unused, then I 
recommend just dropping it from the helper as well and s/start/shift/.

>+
>+	xe_perf_device(xe, xe_device, sizeof(xe_device));
>+	ret = perf_event_config(xe_device, event, &pmu_config);
>+	igt_assert(ret >= 0);

Well, I commented on Vinay's patch to assert within the helper, so these 
checks can be removed here. If that happens, then please drop the return 
value checks here. If not, then checks needed below as well at (1) and 
(2).

>+	ret = perf_event_format(xe_device, "gt", &start, &end);
>+	igt_assert(ret >= 0);
>+	pmu_config |= (uint64_t)gt << start;
>+
>+	if (eci) {
>+		ret = perf_event_format(xe_device, "engine_class", &start, &end);
(1)
>+		pmu_config |= (uint64_t)eci->engine_class << start;
>+		ret = perf_event_format(xe_device, "engine_instance", &start, &end);
(2)
>+		pmu_config |= (uint64_t)eci->engine_instance << start;
>+	}
>+
>+	return pmu_config;
>+}

Thanks,
Umesh
>+
>+/**
>+ * SUBTEST: engine-activity
>+ * Description: Test to validate engine activity stats by running a workload and
>+ *              reading the active ticks and total ticks PMU counters
>+ */
>+static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
>+{
>+	uint64_t config, busy_ticks, total_ticks, before[2], after[2];
>+	struct xe_cork *cork = NULL;
>+	uint32_t vm;
>+	int pmu_fd[2];
>+
>+	config = get_event_config(fd, eci->gt_id, eci, "engine-active-ticks");
>+	pmu_fd[0] = open_group(fd, config, -1);
>+
>+	config = get_event_config(fd, eci->gt_id, eci, "engine-total-ticks");
>+	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>+
>+	vm = xe_vm_create(fd, 0, 0);
>+	cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
>+	xe_cork_sync_start(fd, cork);
>+
>+	pmu_read_multi(pmu_fd[0], 2, before);
>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+	pmu_read_multi(pmu_fd[0], 2, after);
>+
>+	xe_cork_sync_end(fd, cork);
>+
>+	busy_ticks = after[0] - before[0];
>+	total_ticks = after[1] - before[1];
>+
>+	igt_debug("Engine active ticks:  after %ld, before %ld delta %ld\n", after[0], before[0],
>+		  busy_ticks);
>+	igt_debug("Total ticks: after %ld, before %ld delta %ld\n", after[1], before[1],
>+		  total_ticks);
>+
>+	if (cork)
>+		xe_cork_destroy(fd, cork);
>+
>+	xe_vm_destroy(fd, vm);
>+
>+	close(pmu_fd[0]);
>+	close(pmu_fd[1]);
>+
>+	assert_within_epsilon(busy_ticks, total_ticks, tolerance);
>+}
>+
>+igt_main
>+{
>+	int fd;
>+	struct drm_xe_engine_class_instance *hwe;
>+
>+	igt_fixture {
>+		fd = drm_open_driver(DRIVER_XE);
>+	}
>+
>+	igt_describe("Validate engine activity with workload running by reading pmu counters");
>+	igt_subtest_with_dynamic("engine-activity")
>+		xe_for_each_engine(fd, hwe)
>+			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class),
>+				      hwe->engine_instance)
>+				engine_activity(fd, hwe);
>+
>+	igt_fixture {
>+		close(fd);
>+	}
>+}
>diff --git a/tests/meson.build b/tests/meson.build
>index 33dffad31..d20f50766 100644
>--- a/tests/meson.build
>+++ b/tests/meson.build
>@@ -309,6 +309,7 @@ intel_xe_progs = [
> 	'xe_pat',
> 	'xe_peer2peer',
> 	'xe_pm',
>+	'xe_pmu',
> 	'xe_pm_residency',
> 	'xe_prime_self_import',
> 	'xe_query',
>-- 
>2.47.1
>
