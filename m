Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C90CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3D410E88D;
	Wed,  8 Oct 2025 21:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EoWgvZui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DC110E88D
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759960522; x=1791496522;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rnud+J1777neFYIQfdf7m1TBxyH86MOsBaWNDvYIEPQ=;
 b=EoWgvZuiFPdv5T1sa4kSi4KVSnq3zXB/3JuHG7OO+2GxqXp+4xV/YuNU
 EYqEHW67aj2Jsrx/bliFVkPRe0g2eStAV1CxGXokjiO4LX+4H9p3xqYPP
 ylh60l+SaluRW6GhL9dCIHb1GlMjVrNeQHeSni2mhQjk8W4tXlNynAqKW
 R2WeuRMbV+8dtmdolX7L/fZTwOOGB+Dxh6vHHM3cHJ6wP5qf6W+eOnv21
 uiO+V+4P2ofD2aUtS4Hvb2ECzJoEjesWJ+Jf2uGERGmh/nu8FI2/GFog9
 B/xiSk0KTghUtFqakmoW+fgWaL7olKbGZ4E/gVILu718G/WpIGLSh+ide A==;
X-CSE-ConnectionGUID: 9fyU6hz/Tf2IaRupxQHZVQ==
X-CSE-MsgGUID: 2i1NmvPFS0Sw86F3XRXJOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62073494"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="62073494"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:55:22 -0700
X-CSE-ConnectionGUID: cSx7phKKRRe/RRG56/gY/A==
X-CSE-MsgGUID: 3cecykE1RHOIEgBQMqAHUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="185842908"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:55:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 14:55:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 14:55:20 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 14:55:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygIne/vFfT6ei8wOj2gxigbvHfSMVn6bEkbnG85Zn7XV9BdCiToHJLyGjQmcSX4/Gm269gUXM3pPKCeQzXblyIsMYRvex6LuMNyll2sU/Umo2P+QQeGg0VWRtWhkPMreyCO8WGhdGWIIIiMWh8atBwCYCxdSdHYeqz4u8n/lcrvy9ISTK7ErzdfWhEFURIYDG9WblkN15qWmQUjNDVLgJf877M1gRERF+w9XioS8JI5fXhRF+0xMVGx2R96wOj9zX7JdQ/e55JX4ICjsq7y9p0Q0Fl1O+1jkYXJvBgYDD/7BxQg5oxYtXwPc6lnCwqaukNH+7JiAraxc7jo3bpiH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdDYFYdPs0zO/YKGALMZtdu0TgC3FWrPZHmHaOsZaTk=;
 b=WyM2ZF3dcuWBflwXb5ZimzpXp/gJyzY6wYY5wgk7aara1P9Yt9vorotyrk3w1QQzTxyy1a06ilS9O5cGlOsT6Oft73shy3ICDzYDp7Y2ojpiVjjRZ/2Dp9HAWQmFWfCchtSiWiAe8vhh8Tzr7eMJkhx/ZsrMPmnDUcxa/ql8aqclizRUyhPEH2dOHzg3nVK/PSk9/STEn0Cg+WABiNp6GlvKQjAQxkjDP+Z3N3YeFD7wk54MhmGPC0YVzFfdsF62/qQSPiGfuFZCtyDRaYkt84DE35Cp2BigU8aUUxUhGmnDIJE/8UoDKIG45T40kWQFhMFMYWytf3L5oWK0bLgIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8373.namprd11.prod.outlook.com (2603:10b6:806:38d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 21:55:15 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 21:55:15 +0000
Date: Wed, 8 Oct 2025 14:55:10 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 01/18] tests/intel/xe_oa: Add OAM formats to
 lnl_oa_formats
Message-ID: <aObdvgaXg1yl+XM7@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:303:2b::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: 87973f3b-a6d7-4895-8197-08de06b55d24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUpLVDhEbVpodWRIQVNZY1ZhQUhEbzBzTkZBVm1mRlphLzI5blN2V1RqajYv?=
 =?utf-8?B?OXpXWlJYSFM2eGpZd0ZEdG5TaUlIbWo4ZlZaSytna0RXRFNHT1h1Skt2NmJS?=
 =?utf-8?B?TUFNZTFIeG1Ld25tQ282b0JUYkhMNmN0bFNwVllqTVJ4VXFNaStrRnIvd09V?=
 =?utf-8?B?dktxWnpGWE1hYzV4Z053a0doYWhZWE00SXVtNitFRlZyK2x6dmU3UHFuN2xY?=
 =?utf-8?B?QXFiSXF0Yjd4dUJjejkzNFhWdWFxTkFMMi9RcXlEYkMxeVUwZlZsQnVjREcr?=
 =?utf-8?B?REFvcHJNd2UrUWhXanZNMGNIejB4RmdxYWEwV25xaFdmMFJLNTVZaVhvSVBU?=
 =?utf-8?B?ZUJPYzRRUVRjajNqcHFKMjAzUTlYK1RheGwzNmtEMWRsdzUyRCt1bDJ3dFRV?=
 =?utf-8?B?OFNzUEdlYVMrSTAzTWNoK05FdDlmSmEzcjZhQ1VFZ21KcVpYWk1NdE82b0Qr?=
 =?utf-8?B?eW4zdmhDRFdlRUxLU3dSRUM5TWdaZk1hTVhXRFpxZGNVaGd1RytpRzArUVFy?=
 =?utf-8?B?MnZzYWZkY3JCN04vWUZZSy9hNGxjcDJYSUgyY3ZqcVhrb1BYd2wzWEozaU5Q?=
 =?utf-8?B?cXU0b1lRczRuekpJZ1EraFRSVHZJK3BUdlNqL0s0SDdoaUpnVFFQOFRUa1JK?=
 =?utf-8?B?Rm5TWXdZd2c1RnA1SkZCSlFROGt3MlVndWZ4dDNYS2pxazUzWXl5S2lUeGFW?=
 =?utf-8?B?bDZVN3QxYkdCRkROaDhiOHlmKzlySXJLOVZ0cVIwT2NRZUpueStLL1o1K3dC?=
 =?utf-8?B?N2hGZFhtYzFrSFpPSlJ1WTFicjU1MXBSUDBrK3EvY3N5M21tZ2xqYnloRlh6?=
 =?utf-8?B?RDcvdTlLU3NaY1Q5T00vVDlvZFhxRmxwRzNSUFRqeHBURjRxMVZOWCtWaGhH?=
 =?utf-8?B?U2VHa21aaTA1bDN5bGE4RjIxK2kvdmtoUjBKKzVzWjVMelFUM01lOSswUG5Y?=
 =?utf-8?B?c0NYY0w2Ym9rWHFKc2RZeHVFYnlsM2lGMmlNbm02QzdWcU8zcXVGb3N5bHlC?=
 =?utf-8?B?L2VmTEliNXpJalQ4U2hqdDh4c2ZZaW5ZeXAyNWh3MVl1dVFlY3d3anZTOWw1?=
 =?utf-8?B?WUdzMDNTbWJOa1hFUnJhQVlWM0JpMDBaZWxJam9VTnBCcndEVFB3UnBxL0tF?=
 =?utf-8?B?djVtaFpGSXd0WjNlSDQwYUNLVzNXK0JVZDFFanl3WVhoL1RNdlpndG9Gc2tO?=
 =?utf-8?B?SnZiczBQclE3VVJMUisrcVFjODNIcmVWbS83RGRjQ3k3ejhQOUdUWmNoWWlP?=
 =?utf-8?B?U0RTeG52TXppY29BYm5IYi85dCtHK1hZUmhjcVFKdnk5Tmd1QjV0anZzQ3dI?=
 =?utf-8?B?a29WN2YyNXFESkx1bEp2WDVNRUNSVytOeWN5cXVIek9hcjNkRVVZK0xreGRa?=
 =?utf-8?B?Umc2U0IxekltN0FtRFU3RVovRVRXZjdaN1FoYUpOSk4yS3NpZ0hIZFlIakdJ?=
 =?utf-8?B?RE5vVmFqM1liZ3RlL0h2K29DS3lVV0k0NlNvaUtLMm83RWwzckMyajQ5NnNF?=
 =?utf-8?B?K28zbE10S3UyY2JjQWllSkZyNmQrckV3Z1hoZ3hCUVhTMlJMd2RRNnBOOEpk?=
 =?utf-8?B?bWJqSzB4MmNaa0VxcmkvL29SWHMwQVJTa09IYXhFMlREZjNaNUliR3gzYzla?=
 =?utf-8?B?U1gvUjZSbTJ2WUNaWlRzS2JUVzdINVd4TU1NZHJSMnNKdnZ2OUlmcHNpTjRH?=
 =?utf-8?B?NUEwdVBldDgveURlT2RIT211NDJZVWJySys3V0dTUGd6V0oydlVQeGlZRGNJ?=
 =?utf-8?B?S3daZUs2ZC83YlUrZ25DSzY0b3JXWjJDWmtRZllrMzVRNXZ1aWhBdk1HZGl1?=
 =?utf-8?B?eDI1bkgwNmFhRVV5UExkczRMTGNId2xHZlpNUFJKdStPOG02aVN5SStMTExH?=
 =?utf-8?B?QjZUUlUvYkp3TzZDczUxU0x5Qzdzb2p4dGg0bDlNbno0Q3ovamg2Qjh6L2Rs?=
 =?utf-8?Q?YQz2Ij/4RZNCwIdfD26uxd4/9Fj96qQW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXpoRWpDcFFPYkl0UUJuSk55SFpIb240U3JST1JtYWJXYTBMTUM1WTV5RkJz?=
 =?utf-8?B?NGt4R3dDRVdQQlB6OTdIMDNsK3BoOG9tYXRKYUVCbUtXYUdjNGlJNVRSejNP?=
 =?utf-8?B?TWU5SHoxWFZ4WGlrVGM0Wi8yc0ttMXQxSHVoYm1Nd1ZxcUJRZDF5dGgzcnNw?=
 =?utf-8?B?czY0c1BFOEVyMmNGRUpiREgzc290eUVMaURLSGhRWWJDdjNiemlrckdTZThy?=
 =?utf-8?B?bmZSeU9CZzJHWDd2ZnZjektMWlY0Uk1nV2N2NkR6MGs0bXlyb0wwNFlkS1B4?=
 =?utf-8?B?YUhUdTVlQmZqU3o4QllwZUZxbEcvT2o3WGRLcU5QV3UwN2JCdXRMclUreDZE?=
 =?utf-8?B?RVZ1WS85UnZPSTJSMDc1NjU1QWlwWGFLcERYaWRCTWpBSHQ5dDQwLzVpUE84?=
 =?utf-8?B?VlladlNXZ0N0Z2ZFalloRzFaamVOUjgyUUp1dTVUWUthRUNEVEVuaURxWFUv?=
 =?utf-8?B?R1VYeUdBSTg4a1NvbEU2aTRhM3A3YVg1L3l5MnMwMzFzMDE0TFVXVWJqY3Zi?=
 =?utf-8?B?dTI1Z0VoRCs3bDNQM2xURmhYTDB0ZG5XKzRZUkJOWW5oTHdRUGNwZ0ZLVjdL?=
 =?utf-8?B?eVphMjVVdWxkd1FKZkY3cy9LUTgxUEJrUm5zQXNXTFl0OTA3WmErRUtGeVVV?=
 =?utf-8?B?blV5d2d6NEJBTG9FS0IvNkdBM0IzTTlVY29LTmdremRNbjk1R2ZoS2xNTGFB?=
 =?utf-8?B?ZnEvMG1KOXE3d1h5dkZQRUsyQXQxbnJNWWQ2cHl6QzdYY1BPWGE2YUJjNGFD?=
 =?utf-8?B?OTR3dFM3WmFSa0lyZFhzOXdUZVIrWE8vQk1pVm5hc2dKN3pHU0tCNWJXdjdB?=
 =?utf-8?B?TmpSdm1BM3BNRlN5SnRUSHQzYkFPcGRNMGFnaU8vSGhaOUR2WXdRNVdXNjQz?=
 =?utf-8?B?MWZkTVFXQlVmQ2YyeVdCWUNYdENjWlNqbG9kdmU1Z0M5Rktxa2JrUDBDRERp?=
 =?utf-8?B?bzVxemhacEQ3T2RtSXJVNEpYSDNiamxQeVRRRndsbXN2TjJXZU1vRDFmYlQ1?=
 =?utf-8?B?WWJUc1VVM2Nkd0xJcVYxa2YweXUwNit0TGltMkNQOE1hMHhIdXpzZ0NNVU5k?=
 =?utf-8?B?MXJ1VmQrS3d2V2pMUUhLT1FmZzVwdFZBeTh3ekFFc1lHczJLRk5CdnBvR0ZS?=
 =?utf-8?B?dnZ2MDJreDVLUko0elh6NUZnd2ExTkpza3ArL1FhQ2RFamxPdCtXOEtlcWth?=
 =?utf-8?B?QWR4UVFhVU05aVE0VVNZTnJmVG05d090OTBRSUhRL3RoYTBaT0h4eTlLK05u?=
 =?utf-8?B?TysraUxkYzdpS3dNNlVVRU04cWEzdnk2VWNVS3grWkIwRmd1NUY0d0YvcFdM?=
 =?utf-8?B?bTdOUFNMWGZoYmZsbStidzNZaUNXOEhJK0VWbHcvRk83aUM3dTFiWENhMzB3?=
 =?utf-8?B?eDNZK2t5K3IzdWdFaUpWWGZFNDRNMlZIRHZkRExQK2hOWXlEdVZoQkxYdmZP?=
 =?utf-8?B?NitIZXZ0ZXhPNFA5OGZXNXJEYmVVMjFBMk8vNkdIZ3JJWnR2dWY3b21lenZ2?=
 =?utf-8?B?ak5JMnFIdm9IMHkyTjVReHROMnNVZ0s5cmw2cWxaZGwzVVQ3aEtvdmttMHBq?=
 =?utf-8?B?WXNBMlNtK2xkTHc3Z2ZnMnlzV0duK2pMS1E2UDgrZVF0WitvMGZXcGxTOWI2?=
 =?utf-8?B?SmpGSWZEQUowb0d2VVJvL2wwVU5rUWJrS1oxc1J1aUZUak1XN3RscXVMV2pD?=
 =?utf-8?B?Uk0vWXhvbkxsSWVVcWVOWnM5aElZaWcvSW4wVFQrbGlYLzNvbjBGeG5YNXUw?=
 =?utf-8?B?bkRUcnAybndDUllxQm1PNWRrTHZKeEJnVmFCbUt6VUVTUVM2M0hqdXR6M2ha?=
 =?utf-8?B?ZW5VbFc4VUlRK0N5ODBPQU1DWjJUbVZIakRWYkZmQ2w2QmtwRjFzVFVMT3d5?=
 =?utf-8?B?RGNNdFFXVUt4WmFodXNPNmNZSkRqeU1wUVpHblVRSmpSUXpRWmRPQ3M1czRZ?=
 =?utf-8?B?R2VxWEVGSFlib1ZsNjlMMkVscEhWZ2lOcTFMVFZmRytjU0ljVkl6bU5GTHBW?=
 =?utf-8?B?MjNyRUFlTVZBWC9ZY1NydWpDVDh3dzRyVjdMaXJ4aFZGRGdDSFB0RWVIREQ2?=
 =?utf-8?B?N0FmeHN0YVNoMTI2VnZlODFxYlhNTmZ2ei9xR1RhY1NUNTBYNUQrQnJpZDcr?=
 =?utf-8?B?SVZGQzkyTjhMUEJoMUpkWVM2RHE2eEVCYkhXOTV4eTB6eXBNczVncHNQZU01?=
 =?utf-8?Q?+Ciad1uHnyZJVGeEn+mPs30=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87973f3b-a6d7-4895-8197-08de06b55d24
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 21:55:15.6085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPprA8xYAe0+5zzQnaLixFleZYJw+E5FAJR1AIXlARRlTuuEZEP44O3ruknhtqCHEhD3Ei1/9+EyqeawV8xEsin9ahPHMLSihvBJ3uBJfso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8373
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

On Wed, Oct 08, 2025 at 02:17:48PM -0700, Ashutosh Dixit wrote:
>Add previously missing OAM formats to list of Xe2+ OA formats.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 12 ++++++++++++
> 1 file changed, 12 insertions(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 4f2aff59ac..0a00105bd4 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -242,6 +242,18 @@ static struct oa_format mtl_oa_formats[XE_OA_FORMAT_MAX] = {
> };
>
> static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
>+	[XE_OAM_FORMAT_MPEC8u64_B8_C8] = {
>+		"MPEC8u64_B8_C8", .size = 192,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_OAM_MPEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 1,
>+	},
>+	[XE_OAM_FORMAT_MPEC8u32_B8_C8] = {
>+		"MPEC8u32_B8_C8", .size = 128,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_OAM_MPEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 2,
>+	},
> 	[XE_OA_FORMAT_PEC64u64] = {
> 		"PEC64u64", .size = 576,
> 		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>-- 
>2.48.1
>
