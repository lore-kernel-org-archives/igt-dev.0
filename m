Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBEBC71135
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 03:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E3610E045;
	Mon, 16 Jun 2025 03:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUcoO4U0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CC310E045
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 03:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750045128; x=1781581128;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1Zga/7cdErWm/Dg71cmJuUqMPRlL6vXrGW+ueypxOM8=;
 b=MUcoO4U0sbctXFqqFvIAs24cGXJOvvjSoxUS6Fwxr1wOLHsZ8dUrXNsa
 Hl+RGqaBjK3gKcpD+14sAxUzJDBUNOK1xBzlt0bXpKi994QqpXl/66BGc
 T7hZrtyTGwz3JMQVDHqihWdJVb4PluVHq1z4tf86oidJo5Vr9xXKxENpn
 A5e/DdCmzeCtVKlQ/rquny8bC5a6Sga0EygJhURgDac826Jtxt4Zl/JW3
 ++FzXPB2JmrVnXqFTxRRw7/yGHiSR6gFd0fTRlEl1qCEwfgKyD55sJBrm
 elHe9lf6L93XGOOpeAZ0QTJ506gaefbJLCIZgCblib135bNsy4YJejR4s A==;
X-CSE-ConnectionGUID: PulRrUt+QU+6oNKVocj1Qg==
X-CSE-MsgGUID: 67Ouc96PT6KBOmDsao3VMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51891128"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="51891128"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 20:38:44 -0700
X-CSE-ConnectionGUID: +iqjZ6uuQbiiwaA/Xzobqw==
X-CSE-MsgGUID: s6NXTcI0QjGEt4tNzInkZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="149231274"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 20:38:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 20:38:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 15 Jun 2025 20:38:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.42)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 20:38:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODkMPa2EqB1gpB8n07gp4Q3fum6BY0nAaJAKNr3Q9rbQpArE5YCY8Y+ZGWtfCex4ze9t0TZTqgE2YzYX+PyR2OAuyP14/c1wQ4H5j44lVp5LH6h7UjVjbKFUZX3RMYv2ZMROOJETtDSm10NZODgvogEFoq/CktxS1Ny5mWDn6Xkc/cWbAopFtAlvPL22Eof8UxKNswiOG3/SyC4fkDmrFiQu5WoFcFpCoIA2xewf8f1XrWzYSJZSrezLw+rxxZIGaR5Ld/VAT8aI7rBj88jsFYO0gdMKjdPebEXv0q7yG5uvw6wkgwEYygtPLFQ4AH655kgnVIaCNE5Y2TMd3VHXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RAvdGT/dNszSLTBw/sc2N6xzVYWaULNt2UwZnra52g=;
 b=IVDacWKM9DzS7w86QVMy4I8bjD8BjzeAWt0XuVCZgDr4XM6KvhPCMNHwGo480L7E12/I+t0mxLZXCL8YJ/346ghUZ/iGsPGJ77VnlaHDq5IUn9KW/xxBPwe8/T/HEBeN8NgH3aBWXXWa4MvjAZKVNTbq7faVRkL5YsYZNBixIfrPs1TxI7M0liLUa4QGttvVrMCljmSsHD4otaq+rnI4JUJJfolZdjXd/Q9cO2Tu7vDytJGj9XtM2hf9oWg7SIL8A7KZcP5yrZBCSwNWjHbOigiuWl1YrHyLrX+DS/Q3so5OhclrSFRNoV6/okwXctoFM54/gGlBAwui0/Q1i0gN8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH3PPFF8B8D6872.namprd11.prod.outlook.com (2603:10b6:518:1::d61) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 03:38:41 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%5]) with mapi id 15.20.8769.029; Mon, 16 Jun 2025
 03:38:41 +0000
Message-ID: <94e0a4ed-4951-4cda-ae4c-990972c4ffb8@intel.com>
Date: Mon, 16 Jun 2025 09:08:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel-ci: Blocklist unsupported Xe scaling
 tests
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250612201734.3280725-1-ramanaidu.naladala@intel.com>
 <20250613053314.3304339-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250613053314.3304339-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH3PPFF8B8D6872:EE_
X-MS-Office365-Filtering-Correlation-Id: d7f8f9cc-750c-4442-7721-08ddac874938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTlkNzhiVUxxVkpzanNBTVEwdFVlVUZyREd5NzdiWHFkVU9pSUo3TUdLUkFR?=
 =?utf-8?B?eFI4ZWN0ak1FOWlhb0htRGw2VTBXTzJjTTVBOTRHalVJendjMlI1MmIrTHRK?=
 =?utf-8?B?WnJDWWN2WGc5UW5zTWVnV24yUElRODBpU2VhMjF4RGw0UG93REl5a3pseDl4?=
 =?utf-8?B?c29JM0hhRW5HWDQ2R3Z1RDhEWUtQTWw3ODFzbFNkcVBCemZUWUl5UjArSDNR?=
 =?utf-8?B?eGhLQTZQTUErakFXN1JocExzSE9rV0FZZDNRMGFadW5QTTZQSWJFNVprM1pN?=
 =?utf-8?B?aDV3eGMwVkd2UDFLRm1zWVZqMmZRbkpSL2FkNk5IWkpEWFhWMzNiYUw4TzZD?=
 =?utf-8?B?VXNwWm1XbkNaMDU5eWVFaXB1clFIY1BVTlNHaDhXVjBiRHl5QlMzRnlGdjF0?=
 =?utf-8?B?RmFQMTgyQXNwYTVGUDVScW4rU0hkYjIzQ0U2U0paRk9uTTZTYjZ3OHAyY2dR?=
 =?utf-8?B?Yjh5cUtmMEN0aE5rQ1ZUNFpqUGtobWVHaURDTUE5VGxmbk5IUjQwT2wzVEt2?=
 =?utf-8?B?TFZFa25oUk9XdHU3TVE0NUtQU1VtQXZ4OEMza2pqemhWMlVUZFBvU3pDVTFD?=
 =?utf-8?B?VWhydTJMQ1gxOXZSWlQ2YWxnVzdodWRYc1BSekZHbE5lL2lUNk1HR1FmakY2?=
 =?utf-8?B?cmY1N3FiYWFHZUV5RXE5NDF2cXVoMmphSlZHQ3JNUmt4TVVkd0tJSkQ1THR0?=
 =?utf-8?B?RDdvRGtySWJDSHFnVVh6YUJCN3pzNkhveWVyM1p2OUtnTXlWWGhKT21oTmIz?=
 =?utf-8?B?anpVTzcwa2h5ZE9wdmpOTmNmQVQySzZnampVQThFK0pHNldOeUo1M2JlY0k4?=
 =?utf-8?B?SWwrRkE2aENOdFUxVmV2V0FxTGhiYStvQUd6aGJsekF2ZENaMjNZSHhRTHV4?=
 =?utf-8?B?NUs1Yk11ajhNdTY3aEtsVW01Y243ckwvc1Z4SlBVV1BFNENrakd2bG5WdEJ3?=
 =?utf-8?B?ZlJpYnIyNzRVc3B1dm1GaWoxcUx6WEdEaTJsWldTUzJQWDN4WmE5T095d3hS?=
 =?utf-8?B?ZHdhQm04NjBZQTZJSFRSamRMTWFCdVR1cnh4ZXJsM1lFdW1BOXErUVVzY2Ev?=
 =?utf-8?B?bWpqWHZyVWJvd3RFT2dDMU45cWxlUVg4b3RFMEYrTmFadEdpc2JrYWlud3VZ?=
 =?utf-8?B?Y2NUdmZLNllmS0NMcGI3V3B0NVAvMGROMEprTW84QWQrYUc5S3A0OTJUbnRE?=
 =?utf-8?B?b2ZTTDk3OUcxR3pBVG1DUlZjNVNOVVFwZnJVbXFsa1E1ZXhjVll2aW81eVFR?=
 =?utf-8?B?bi9jNkhoRXYwdWoycVQ0aG1YSjUzTUd4R01aMCtHNi9hQVRqTENWWkNWNHMx?=
 =?utf-8?B?cUVDZVFPeU54YWlBcnZMQ3dXRlNwZ1Zsdk5iMmJnREFZU255aXRYODlxR2lq?=
 =?utf-8?B?VEtZSmhDUnFSaGFmTHpsaS9hTWNMZ0FvZlVIZzlxR0VJK2l2STdVNnl5cnpK?=
 =?utf-8?B?bXQzVjlSaTVTRUpIVko1T3ZTNGZ3Z2ZXUUNBaVhIdFVVaE9zNjkzN3JteXVn?=
 =?utf-8?B?Um1hVTBDVEZNZHhScitFS1FPY095UnJpblJYS2RPSWpLNVdQc1pBaEQ5RDRZ?=
 =?utf-8?B?WThGaVN3Y2Y3SHhOOFljY1U5cTVOOXhCaTJ6WFBiNWtscEdTa1pWTDVvMDla?=
 =?utf-8?B?dGsxMForaXd2Y1BrVXlXdW5obGhjeHBEaE50TFV1TlMrcHRvOFpaaHpzSXRG?=
 =?utf-8?B?TkdoNzFSdk4zNVo2eXowTERlTFhFSXYxZ2JmRUdraGZEV1E5L3FFZEtzOU5l?=
 =?utf-8?B?N1JkTmwxQkExSDkwTlVGR3YzSHVKZ252Q1ZldzJPUzB4eDBHUTgrV24yckZS?=
 =?utf-8?B?UE1DTXBVSUhsa1BxU0FQZHZuRExLVytuKzNvWDVwOEx5S0l0ZldOVUZIOTBQ?=
 =?utf-8?B?N3R4eUk2Z1M0SWl1VGVaMisyQ2c4c1ZkVXpiMTY2bVhPVHRpZlNiL2tkTnl2?=
 =?utf-8?Q?eURDpdE7O08=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlljQmxsaGliNWp4bjJjcnlIQThOTHZ1WHRnSlZXdW5lZUZidkZKNWpDdHEz?=
 =?utf-8?B?bnJRNFd0TktvL1JrNk01WGtSdlE1QjBLRzRrU2Y2WURUcU9GRXgwU01VdEgv?=
 =?utf-8?B?MDdYNGNzRUY3VlFXVHdkeTN0MzhMREFKcjR0LzBtMk05bGxxU0V0WGhPVlZU?=
 =?utf-8?B?UXhiT3ZVaUwrZXljZmtjT2ZlM0cyeUxLNFMvRno1ZWlwNnhjZzZaUjhVTGNy?=
 =?utf-8?B?NjUzcm1QZlpGbmhjcFJZUnJXQUJyWXpOS1FhbFZkM2pZdTBISmNEclEwNXJr?=
 =?utf-8?B?bnFraFFORFk3K3pXQy9TNTArQW5JMHlUaDdIaEtJOVQ4VTdsTk9sZXhqMGJv?=
 =?utf-8?B?TnJUdU5ZRWF3VHNCbzB4eFVIcFVndmVUb1pQSzB0MTdpTnZ2K3F3SHpuM0t3?=
 =?utf-8?B?MDEra3prWWVReXhnVm1OTXkvc3ViUWJHL2ZqeW1YQVhWaUErQndkYjFzNTVV?=
 =?utf-8?B?bDI0cW5tMHl6MDFwVmhaNHVTL1JQdHJiYnlGdUVzK3g3b0tRU2pLOHhvYUF0?=
 =?utf-8?B?NzArVnovbXRuN1BrUW81dnB4QkFMZ2wrSEFqamlKalhUbTJzTzZBbGxGVTlQ?=
 =?utf-8?B?cGh1NENPeVE3VXFyVEEwRENIYzR3cHAxNEJXNG5qWnZoZUJMdnowVE0wNS9r?=
 =?utf-8?B?NEpUYXZWWFhRaTZDd1hyL09FRG1WR2w1MFRoL2xkd1B1NURYRzBuY3V6ek04?=
 =?utf-8?B?aVBRYjZYTEZXNkNhcFZ6Z0t0R1pobzF3VVNydWpFNkRvRFlsWnVjYkYzZitt?=
 =?utf-8?B?TEE4Qmd5MzBjZ0czZW5JQnRaWU10QjJ2NU5lVlFlM0Q3Y2czWVJlK1hkQnM2?=
 =?utf-8?B?RGJDMDVxMkRxTDV4bDlhN3hvcHlIQmNvRmlnZDMwTXhmUnVJM3loQ1FtTCtQ?=
 =?utf-8?B?bWpwdTZ4Yk02OEdXQWJqSk5GZnBHNCtmUWFINEcvQzhYaFByd3I0RFhNWjc1?=
 =?utf-8?B?RUFZbTJxWTJaS3pNbXQrRjZ2QWJTa0dtSVA2bCttOTlyVlFCTUhKb05YQ0NZ?=
 =?utf-8?B?ZXZaeFhqdzNyWkFhRVhjUkRFTTJ5VTVMZm1KY203aE1JWE1uQ2dJSUNBcGRV?=
 =?utf-8?B?V0k4V2YyRDVGMmlUOFM1bmZEbTlRdi9PTXZ0a3ZsSnJJQkNWbEQzU25qejFC?=
 =?utf-8?B?ZnVZTm4vSXd4R1hJTUt2VXFmMkUyaHZ0U0xHbE5XdU95cE9HQ0NvT2tYZW9p?=
 =?utf-8?B?T0tYdHQxR2ZyMHRNWEhrZy8xc25uVXJOM1NtcHpMUUk3c3ViZ0ZiSFhrSXZt?=
 =?utf-8?B?a1dHeEVqY0VoRDFTL2F1dGk5WVRQeWJBQXE0cVg5UEVSVkR4Wk1lT3RGcmNS?=
 =?utf-8?B?cEQ1NUJnd3NmMXFlVCtDSGRoSDJTV0NVRlFMcWIvYUxDbkpjQWJvSmFWdHFG?=
 =?utf-8?B?Z1JFNmNJVlBqRXN3emJkTGdsTHJ1aVBLOGd0SG1uN3hnV1Y3WFB2ZlZYRSs5?=
 =?utf-8?B?WndZN0pseWM5Yjl4ZjlRMnQ5R2ZsajlhVmRFU01BenpJTWZYcEJRd2tGME5u?=
 =?utf-8?B?dFlrdXpaYVVRM0MrZXNyQ3ZjWXEraG1kSXc5NlQ1ck9rK2NOQnBscEg5VW02?=
 =?utf-8?B?RFNDcGVLVGV4WitlS2xhcmwwZDF3bGUvWkJkNG5vdmVaaGltcjhodUl5OUNE?=
 =?utf-8?B?dTRmbXMwenhaTXhZcTZLelhVbnliSENEQTA5a3hNSEF3OHBLdUg4NFVtV213?=
 =?utf-8?B?RlErTlU5WTFnZjk0aWFWNmVXbFpuVThINGZaUXBoRmVYMmdPM0ludHVWWmF5?=
 =?utf-8?B?S09vRVRPMlpDN1V6RkU5dFdzblh1V0svNU8xeUNzaE1FSTZqbENuS0JWUk5k?=
 =?utf-8?B?cEJRRWZpODkxdE51SVB4UmtqZnhPM3dyT0p6VmF3VnhiUXpLelpaTzVjRWly?=
 =?utf-8?B?di9HeS9WT0pRUlNST3MvTVo4Q0pQS2RoS3hHME8vWWRla0U3REh3cTZlYkMx?=
 =?utf-8?B?cE12RG9obGxYblJqTkZLSXl2SkhZY1ppRXRMcS9vNU16NHk5MWJ4VmFNdGJU?=
 =?utf-8?B?cDhJYkNzMytaVEcyYVMxN3dwaEhCS2FiZ3dQNnd0Y0k4d2diOXpYcjNPa3Vu?=
 =?utf-8?B?dVVJNDhNWUZ5ekowMDgySlllMlIrVjdLTmNtTzQ4RGYxVjN0alJiOE43RldH?=
 =?utf-8?Q?HD77n5A+1DQ9C0d9g/TmXXDLi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f8f9cc-750c-4442-7721-08ddac874938
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 03:38:40.9144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J1swWXujs0fahBASzpafOaltgmZCB4TKiox+3lyaJug508WqL7vffFnlFK1rEakzN1Gl+5oH+H/SbBdOj1OUng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF8B8D6872
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


On 6/13/2025 11:03 AM, Naladala Ramanaidu wrote:
> The second scaler does not support downscaling in either
> vertical or horizontal dimensions. Blocklist the affected IGT
> kms_plane_scaling tests that involve downscaling scenarios
> unsupported by the second scaler.
>
> v2: Update list as per review comments. (Karthik)
>
> Bspec: 69901
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index ebe1ff006..dcdce8b20 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -82,6 +82,8 @@ igt@kms_pm_rpm@cursor.*
>   ##################################################################
>   igt@kms_atomic@plane-primary-overlay-mutable-zpos
>   igt@kms_plane_scaling@.*downscale-factor-0-25.*
> +igt@kms_plane_scaling@planes-downscale-factor-(0-25|0-5|0-75)
> +igt@kms_plane_scaling@planes-upscale-.*downscale-.*
>   igt@kms_prime@.*
>   igt@kms_scaling_modes@scaling-mode-none
>   igt@kms_writeback@writeback.*
