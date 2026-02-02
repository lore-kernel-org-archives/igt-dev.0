Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24121E7DEE3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE42010E27E;
	Mon,  2 Feb 2026 14:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lAdV++fk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F1B10E27E
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770041775; x=1801577775;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AvsxExOGZN1/yYIN4Ys0aLApetb0eJD4RV4SwKDfB/Y=;
 b=lAdV++fkNgVAPidto2chGTCWmQ4MBfygCPzDxcOEoJJNUPQQp5rdMIgO
 z0AXJbFRwmOYZCjXBAgyfJhHucXExSDvV1N/u8pie+rDHL0sWMhVmqzPz
 pGqiW3pObIffq6ytBF04zOBCUxUeNw5bWrZwe85rlevg8SANR/VX2lDNx
 aPdELD7L3Fao6qHQpqZvcBXqllc9yZCl1LhbDxT+XQE4i9uQnyx7dqHvp
 ZvAbAL6d97KTMlBPsh/AI65EuGCZlMJyhE5C0MPBfMLteTUS7dWhCv5lF
 7P2GuwFJp/tZsaj8KU3FF+onjcpX2LNbNjHOub7madLt8e2we0hIYxA3A Q==;
X-CSE-ConnectionGUID: aNutloc3Rj2v6ZVbSY9Rzw==
X-CSE-MsgGUID: kgn1EEsPQkqURy4ErHpIhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58779205"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="58779205"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 06:16:10 -0800
X-CSE-ConnectionGUID: ahH23LFISy+opw+el0hI8Q==
X-CSE-MsgGUID: FLIVC0FHTKascJI/C2OvdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="214352707"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 06:16:09 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 06:16:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 06:16:09 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 06:16:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnwiycI6lTmnPZrG4NIiOD4mEsH5Vr5mYfTYZsePEpM/8u/JNfni+cIy4fgH5WdbIht6f9GxgPgAPSoCi7URSIjYXZM/cOjvQ7wiuCjYN9ptP9ErNhScE3OSXqoQLx3XzYpVJb1PuHPvjWLUaVzOHLoIv8auRG+1j8kOA+eww8l++/F0JWYTXpqEyzS32IJ9dEi6k3R8bc9lJGl49mo9Q7OpZUyEGNmkxFSzNJaxuiX9veNysZmXpMjJVI3zXa7BfSi83cKmBzRtBbmpRRwNpbzYYwJNNhGZRX6pW+GBbvb1BcINN5grTIp5jAWLmxkhZ1aIFBbf0ekWDKG6EsA0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52E0Uetuz4qBB7KF5Gvj8hFe4r3JHGe3jvyiV3PuDAA=;
 b=ocm/YTUZdH70/mooCaMZ6Blw+N9ylEPldXRHrthiMHginat0jeOA2hNSRHVbg5aRvuTQqFimn7NFQr/ijHZOgRm6MxDrqD79QKWmAeO/VLDje5Ur3IvogiRZAjoMFA5oncWnxfPbsPH5TeEGJ7Xl2jEYo5fkkFwR6z/K2QqaFoWPEH0DjulZE7G7USQIBbFrCXRmuv0JHM7a7FYHJkMnq1Da/9Omeo/KsIHZSiXALE8HUhwCOxUHeCi1xX6FuuviLK6DU0v3loYfhZlSy1MkaEBp5y9P8NO2mg+ce2QwrgNWQCanZBcLTQgxpP36coAkDg61vMQhQfL5EXxqyFubcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SN7PR11MB7512.namprd11.prod.outlook.com (2603:10b6:806:345::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 14:16:06 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 14:16:06 +0000
Date: Mon, 2 Feb 2026 15:15:58 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t] lib/intel_compute: Wait for compute walker before
 returning to ring
Message-ID: <aYCxngV3yoXnYQaR@fdugast-desk>
References: <20260122104528.980532-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122104528.980532-2-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU7P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::24) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SN7PR11MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: de49f628-7978-4500-7926-08de62659afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1paMkJMOEFwS29CMHVoY2Fkdmw1NEo3ZHpMdTdtS2R4YTN0VkwzY3RZYWpr?=
 =?utf-8?B?TjlVQmJrRkZpYmJKc2drT0RONHZPeWdIamNmNE5HUGFVazlOSE1kcDlqY04w?=
 =?utf-8?B?aVBpUldkMC9GYnJSVEwvejBNeUpkVk1jdWh6Z2dNMFo0WDFoNEtMOUQ3VUNx?=
 =?utf-8?B?QkY4RlVqNGN3bVVTcndDRU1TZSt2bGR2MnVNZHM3WWV0cTlJT0xJSENmWU11?=
 =?utf-8?B?d3A3WTlRWHVjd1g5dVdlQUVxcTZhOTF6aTR4WU1TelBxYUFsZnlGQ2g2bDZW?=
 =?utf-8?B?RTRCVXBrbDVDeldHM2ovZ09Qd1lobTlVckpNZ3lPSlQyamMzaGgxL3pPcEMr?=
 =?utf-8?B?UE5qL3ZLUENmMCs3ZVpqQnFXQS9xaUhxTitaNC9FOEI1Y1ovT3o3R1hhcm93?=
 =?utf-8?B?N2dBTEdPS3NaZnR1ZGVKZnk1TVpuOUo2YTJmeTh2VXFMN1NFamd3Q3Y0Wm1t?=
 =?utf-8?B?cFJQUjJGSU8rZmpISTBRSW5kbzRhN2lSVWxzVlo1MFZWdFBvakNoZkVOZytv?=
 =?utf-8?B?ZkhsR2FJdTdEdzVCWFI2azd0MkdQRjRzckpuek1sMk5ucEpkSnl6Z1NmQWdJ?=
 =?utf-8?B?R0xQWUlidFRxS1dJeWlMbzBpZkU0MVdUT2hSczE5WnNHTytNRXRiVEtqRjNU?=
 =?utf-8?B?emVucFhZa3p2UEZZVU9ZVU4rOEFDRW1pMnJzRENBNkl1UEpnNWdrK0NQQzMz?=
 =?utf-8?B?ZWlxc0hHR0hNU2crRVJKalVqdmVUR25DUHpsRzJ5RTFUSkVOMU95U2dVUkR4?=
 =?utf-8?B?OHM4NXkwS3lDZXMrWjNPbno5U2NrUHdYTHNMdlJ2Vlg1ekxDUTMyV1B6eFp2?=
 =?utf-8?B?MFFuOUcvOWZ2RHBvaHU0Wk1OT05qcFU5cUQyWm5QYkY1VUJMak5xUGlQN1Vy?=
 =?utf-8?B?YXdDNmRuYlNxdTJJR0Vpb1kvaG1sVXpnZ3g1ekljL3N5MFMycG5yeUZZU3Js?=
 =?utf-8?B?Ync2RVpZK2x6alFtaTEzT3lmRzlWSFN6WU1VRG9HSUpIQ01yamtmV0NYbUJO?=
 =?utf-8?B?cjRsNzArWkdkRGlZRXg2YVpZbmE3SUxyT2xxQTB0TG9YQ3JGWisvN3FYZy9E?=
 =?utf-8?B?eXZTMndZUzZuYklUNzZhSS9JUW9PalZKczlya05DYVdRZE5saXN4aEdDL3kz?=
 =?utf-8?B?aDdwMFRYY1lYSWh4UlhXTDhmcWZUK1RHaEJNY0p6ZC92cHJxRVpNeGVJdUk2?=
 =?utf-8?B?NklyaUR5MWlJRFh5dXFJWGI5N3gzYStXM2ptd2g4RHcxQTNSQ21qMEF0Y2Iw?=
 =?utf-8?B?RVIvUHZWMHhSTVN6MnZsUDdrZDJ2aGZaVmlQT0VKSHdYaGV6T1R5b1U2SVpj?=
 =?utf-8?B?cm9DSC9SZmttbmlSWU9GMGc0SHpwMDlDcDNoOGp1eGI1RjdWalFYQy9Ddmtt?=
 =?utf-8?B?dnVNYzg0MmppeXdXTXAzTVdqcnF5d0NCbGZuYW4vVktnQitZVStyQXFlelIx?=
 =?utf-8?B?MlJlL1VrR3Rkc2dJbVdXRmtuc1A0WkFKdGt2TWF1MXpIT0xqTFpna2RnOXU0?=
 =?utf-8?B?dkU1a2FVQjE4YTRMWDVLbkxVcVlJTWF0WkNySEdXWlAwZEVyZW94bDBZSGxs?=
 =?utf-8?B?VElwWVBZelluTDhpNklvOFhPdkFqaGUvdFlhUkNXUlZSS1YzekRFNFVUVXBR?=
 =?utf-8?B?M3BCSk1kdFlvalZ4UitBZWhheVByQU9CYloweFhtdVV0azVNMlF6TXpBaGZV?=
 =?utf-8?B?UTFRc04rTGVXMGM1T3VCTkhtU2thNFZNSFVCYms4YVNHNDFsb09ndFN2SENN?=
 =?utf-8?B?ZWZlQk53SFZCcEJrTEtDQzVyOC9malJnNmlxQlBiTHE2SXhkbVk3TkNZRS83?=
 =?utf-8?B?NHBTUVhKbkkrR3BmUnZmMVFtaTJiZnZUMjBIMjNTazNDSE1uMFlNS1laODY3?=
 =?utf-8?B?b3hPaEdVTVNvTUZLdktKOGFEYXY1U20zYXJKbmErQXNFdy9nd1JaRW9OSjcv?=
 =?utf-8?B?WHh6c3RkaUJHSzlJeGQ0ajNaaDRHM1BGbjZudUVYQUpvOFpKOUVISDYvVTNR?=
 =?utf-8?B?RTlBc0Z4M2NLSk1WdHBsRk01M1RNRWRIa3VFTHViREUwSzBoVTZRdklHUlBU?=
 =?utf-8?Q?mZOcuO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OC9PbjREVGxkRHlxOHJaemorcFlGR1ZscVM3Y3VGc2Z2Z0RTVm9vYXRCMGpN?=
 =?utf-8?B?TzJZNzVxcDlpQkNHWmtTYmp0WVh4Y255Q1pKTnJwKzlDeWlIR2EvMDJRN1VT?=
 =?utf-8?B?YzQ3TFlJT0pmM250SnhOSFV2WUcraXkvK1Vzem5BVFBPSkFrVGpDSkgydUtR?=
 =?utf-8?B?K1h3MWQ1bG1WNUhGZHhnb0s0TlNkbVEwbVA0ZHU5akpxdXNtenVIWkV3TzhP?=
 =?utf-8?B?NDhuVndXbGlULzdMTXcxYnAzamtjd0NVL29va01LSjlqakFkSTN0QkY0MSs5?=
 =?utf-8?B?U3pZVHh2WFZRRGtiY0kzSWNlNWhlVXRsUDFKTTZQeEI0SDlIejZlaVFSQzNP?=
 =?utf-8?B?elYwMFlKUmVwYThTaEY2VkxjQnM0K21BZXpvOWhTWEFzMnRDcFFkTTZTRFNJ?=
 =?utf-8?B?TkNZbUtuUGtucW1ud0NxM1RNNVZJa1NEbXliYmkwY2UyUE1TWFZWeVFXSjd1?=
 =?utf-8?B?Y0dSdXEvUjJuVjZyenJOem13aTY4N29ZZnJBdVYvQndJeW5nTlJkQVI3SC81?=
 =?utf-8?B?enhKUEMyM092ZEIyZ3BadzR0SVVhMDl3YWtxb1dDM0NWZFMyQW5IUEpXR2c2?=
 =?utf-8?B?Tk85b2Z5dm9ualBwUVlqTFBXdTFhY3ViaXMveS9XSWlEc3FteU9NV0VSK2NH?=
 =?utf-8?B?R2FKR0UzWTJPY09PeXREamprNXN1SkUyOERJUmFHQjVOZTBFSzRRb3paQzNR?=
 =?utf-8?B?d1NBdWZ0VlJSc3l1ak1ta0hOUGJlTUZmQ0Yyb3RGTmN6SHNFUUo4RDF0Wml3?=
 =?utf-8?B?d0dSUGU0SHNUS2c3QnplY1VKanVvai90RkJGaWt0L1Q4VFJDTHlKZ1lEeFJh?=
 =?utf-8?B?RXBVWHJRRjIzZjZKQ1E2OGsrcUlqSHQyT1lkekpIZmRzbHhYVjAwOE41L3dl?=
 =?utf-8?B?RnBQa1REY3c1eFVJUzNzN29ESFJ3MEtab0RyQXdBbCtNNWI2dGg2OTNQZ3Qw?=
 =?utf-8?B?RlkvZ2lyWFdCQXF6SWY4cEVVeGVESHpoZU03RnZiQW9TTytiUndSZ3J0YTdN?=
 =?utf-8?B?YXJURkFQSGFIRDhqdEduUGdyNVlaNkRKQ21ETTlvdmlWMEJuL1B5Y1FtUzZI?=
 =?utf-8?B?Mkh3UWEwQlpWUUROZmZQVDdDT0krTU12Nkh3MnRHWlZKdVd3U2w3eHRpbXlG?=
 =?utf-8?B?WEorYXNqVWM2SWFUQkRHQzdVSDJnQUpDTFpESlJmbFFRVlRTN21RVytHWE55?=
 =?utf-8?B?RklGNEVSOTg4M3AzaGtsenA4dkFSZHJ4amxZN0RVaWsxY0JnaXFYZ09adWpB?=
 =?utf-8?B?Qldhb25VRzNvMHo4WWw3UXV6YyszTldOZEs5a2x5RkZTK2gvUEhzcTk4U3Y4?=
 =?utf-8?B?YmZWSnRpb3JRUmllNUJaa3BBMHM4TWlGZnRZbkRHUXUzU2YxNys2VGV4TkQ2?=
 =?utf-8?B?WmNrRjRGYTc5UGFzUFF3TFFWaWkxQi9IcTZaM1A0aHIxdm9KVDJTbWpkb3Ax?=
 =?utf-8?B?T0h1MEtUeXRQWnZFb1lPR2RibXlmMmFmdi9vUjg1RmNjWWhybDd1Y0Q4Uklj?=
 =?utf-8?B?QURmZ1lMWXVZaEtQZXM4bjhQZERCTFNFQzNVdUlqOFZJU011ZzI3T3FaN3FM?=
 =?utf-8?B?S25JVGlTUHJFU3RUT08xbDRtQnhXYTExNGNRTC9VSEx5T29rbUg2UGlHVzBp?=
 =?utf-8?B?Z0ZVVlJ0d0E3bUpZeG5ySVY3cVB1U20vSlBIb2RPRnUxaGVOdVUyaVg4cVZ6?=
 =?utf-8?B?bTBKQ2RFWGpwbTNZSVBKZWpEYU9sKzhqdDlqcS80MS9vTmpBZXNScTZGRENr?=
 =?utf-8?B?akJlNHA1ZFVkQWdIRHREcmVHcG82WGRTZHJ3UHdhRUM4ZVZJVjRXUWt4RVRO?=
 =?utf-8?B?VC9ubC9ud01US0FPcXFLNlpUaHNYdUErYWNsaFJHeVpQeVpiMHlibVh5RzlK?=
 =?utf-8?B?a0JEekEydVBZMUlCQmZxVWgvSmNXQWNNR3JPcDNVNnphWE8weTIwQjBmZGRH?=
 =?utf-8?B?MWtRQmY2SXY0ekoxYzhON01PbmVQdUd3dVpqTDBrSm9IWkdNeCtObXRkRWs4?=
 =?utf-8?B?NU8yYzNVbW55QkVPeTFRZklQZlpmWEkyVUFINW9yb0t5UW90a1JsM3FwbkRY?=
 =?utf-8?B?cWRreEJSTnpJUjVIcDlSSFBod2JGYUtTR21MYXNpbHhKanRmTDNjUEpYVlIv?=
 =?utf-8?B?YXcrZDIydzdlZCtkWDVWSyt2UnRsa1ovVUd4WTV4RGQ4cjZ0ZnRrMmljYjNE?=
 =?utf-8?B?bFIyQk9HYklyU1pOLy9Ha1JsclZ6dmdSb1duckg1dmJDR3hIVjJnTHVOMlBE?=
 =?utf-8?B?WVJaRUdSc2JrUit0dFd6TTFsNmpQejFkdE0rSzUxOXJQVER2SGNQU0s0QnJz?=
 =?utf-8?B?cWlmcDlGZ3NWVlRQWmwwMmRCQnhPK3F5MEx1YVN4ak81YmdqcnUrbFBHSVZi?=
 =?utf-8?Q?9sMmhsGU3sckkYlo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de49f628-7978-4500-7926-08de62659afc
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 14:16:06.6045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEs7mtV4kJ2WENAUL51/aeI5KRh/S+bOAuQlExq0g1U6iNR3e8/Sluk62l7AkNv1m4aEs+tRwGiGXXn34sd8uqF8QWz/S+B7pZxRwHoXEWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7512
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

On Thu, Jan 22, 2026 at 11:45:29AM +0100, Zbigniew Kempczyński wrote:
> Most compute tests don't need to synchronize at the batch level as
> kmd executes pipe-control at some point. Last xe driver proposal (link
> below) causes turning off preemption before pipe-control preventing
> entering to SIP and finish the WMTP test properly.
> 
> Change adds pipe-control at batch level causing sync wait on
> compute-walker and preventing disabling the preemption prematurely.

This looks right and does solve the issue when applying the referenced KMD
change, so it would be necessary going forward.

For maintainability, can we please replace the 8 occurrences of 0x00100000
with a define, maybe in a preparation patch?

Francois

> 
> Link: https://patchwork.freedesktop.org/series/160113/
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_compute.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 00ef280e8f..8578b6e402 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1694,6 +1694,13 @@ static void xe2lpg_compute_exec_compute(int fd,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  
> +	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] = 0x00100000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +
>  	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
>  }
>  
> @@ -2032,6 +2039,13 @@ static void xe3p_compute_exec_compute(int fd,
>  	addr_bo_buffer_batch[b++] = 0x00000000; /* dw62 */
>  	addr_bo_buffer_batch[b++] = 0x00000000; /* dw63 */
>  
> +	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] = 0x00100000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +
>  	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
>  }
>  
> -- 
> 2.43.0
> 
