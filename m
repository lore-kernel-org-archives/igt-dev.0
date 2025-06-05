Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB50C5AE59
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 12:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E8510E84C;
	Thu,  5 Jun 2025 12:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wl72RMXt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA2B10E84C
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749126324; x=1780662324;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XVn7mZl3lo77TSgljbF7e+d4S/A7A9bvCFpKwS45vIg=;
 b=Wl72RMXtKpC9AhUFZHgrqeQGHf56a9YZ0dr0mfGzZWIpNt62nDxP5kqH
 68g8LWuJahgawFiUi6KIfbc/SLGGwQGUIy2hHeFC4iz0zUOas85zZqiTX
 3CU1p4hWNMwoVNfWJ+d0NTbVxDvQZjpFGeAz8E+lk6UFUJ4ryh/WiX2kG
 D/ixvZ5uDvOAmcgLggE85vo/2jQcEbW+/nqKt0bJ7UViKsaf2nN4Mjr2N
 duBLkiOOIqrz21Jz3Mrz1OwrgaMbqnacsloXZFlyxq+80Nqi7jXunuyfq
 +N7jbL6X9Jn0CqqKyamLwWMKtbhQEJ0D2aj6kKfN6875kLxNvtAhLY1Fe w==;
X-CSE-ConnectionGUID: QR5PoGTzRgGPQt1G5s1EWg==
X-CSE-MsgGUID: A+V7DK4eSr6KsCP3mhrYfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51157120"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51157120"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:25:24 -0700
X-CSE-ConnectionGUID: gV8razgHTByOHIA2EmxAwg==
X-CSE-MsgGUID: MXZ3Pw0PQ/2NM5DZ/f+9Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176356261"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:25:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 05:25:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 05:25:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.40)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 05:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZtCSyxqhWu83uFfNqXWSc2zxXtaRDd1oHALgU0ezXZcpuvi5pZpXb4iZ2ILYAm2oYHqM/q9sJUtk5CFCYQt5UtbazlLBdjA+q9cuxE7DaSjwhh/5+W7g+Fht5pIuLx4dWRf8LRXxY0AvKPidWQdyPHDv4c2CbirFPJp0HxWkR7u0PQkfQAUImkNBgkZQbLPQx5AuVDmJx1IIQZcnxbZuAkUVnQr9+NaoEC2LO4xjC3eScD+sfs/h+lF8Zu7z2618iHliTr+aywtUkyxrX2T7Ib262NwzsiI9hGnS7pjuP7zWUFTt0kpZPOJww6bEcaBZDsBDI3u4/0KgV3F6iiVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJY256SRtZmU36oW2YtYrjME/PIcYmP2CzLBZIvPoG4=;
 b=sANVpxbVFH+ATtztvn9sAd7qjP5jxaOJF2sb2GOCdupcDBHNqWUv3FRDgDV8o/33ns46fOK1DDmMvt+AitmaVWtbYAOuET15aLZGkN8fBjnNuiJqIwfj9dFTLBa56kDvKCfW0GSHLu6BKykZ+LZf2mJf6S1yrnUDK7399/GC+hU5Qtbl7mEq00jqTMdYFvAWn+W60y3LLI0vx2zYOyHnUbTejTxHX/XCXIqh4csiNxYA+3AZoxeKq4UVU6MjwRFcF+om8tnDhx0IbQOily8Qq+jRbqfdhdj8Hd5IsYCg2gryaJt6iXdkJ7CeN/JwXPov1MB2QOYbq+1y83ZyqLpt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CO1PR11MB5090.namprd11.prod.outlook.com (2603:10b6:303:96::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Thu, 5 Jun
 2025 12:24:40 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 12:24:39 +0000
Date: Thu, 5 Jun 2025 14:24:32 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] lib/intel_compute: add alloc preference for
 objects used in compute
Message-ID: <aEGMgE0zEZlj-is1@fdugast-desk>
References: <20250604115024.117036-4-zbigniew.kempczynski@intel.com>
 <20250604115024.117036-5-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604115024.117036-5-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB3PR06CA0034.eurprd06.prod.outlook.com (2603:10a6:8:1::47)
 To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CO1PR11MB5090:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d41b1c9-5c04-4bba-73aa-08dda42bf124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TURvT2dyMkZteGpnUFdlb25wekRyalk4UXhaRUloQklFM0pPMXk3WFh3S3JU?=
 =?utf-8?B?RHkvNTIvUmRmOWd3TER3VW92U1d5bFIyRVd4eWlJS3hrK2VEL2hOL2RibGNk?=
 =?utf-8?B?OW1vdTc2dHcwaEFzWGg3d3RyQThPL2QzWVY5NnY0eFZud2s4QUI2SmNrTGU3?=
 =?utf-8?B?aVpramgxdEVuN0dnTlNWL1d5TWM4eGV5aTdUeXI2VVF6VjFPWmFCSU9oWndw?=
 =?utf-8?B?MFBNVlFmT1pEYkZBWmJib1NSYnEvYjZndzBHRlN4ekRJSlpkRmZuQjFvSUQ0?=
 =?utf-8?B?MXI2YnhlckpXZ3h0SDR1R3YrNGhjWkNLcGZWZVR5VWhoY0J5S1h4V2ZaQlQ5?=
 =?utf-8?B?SjQ3L3I0YXpJMWpVWS9GeUVwdFY0dDN0a3VKSEhuenVSLzducE9udzIzbHRJ?=
 =?utf-8?B?cU1CbmZYRFZkdFRLYnZadml0ZUpTdDJPUTdMRklPUDc2cklmbk4wLzhCUjBV?=
 =?utf-8?B?UldaUWF6K1VtL1Rpb2hUYXZzNmMwaWZWdlU3VFpEOWtlQTQrdDVLRTNDZnNC?=
 =?utf-8?B?RnlmVElENkxJaDhnK3FOMHJJd3huUkxTZEcwMmlPU0E0ek5vSXNnRVdOQ3FR?=
 =?utf-8?B?WlN6NEd5R0hrYXB6eEVKYitYYUk5MmNHNE5qUXNuTXZJb2pIY0tMVWZ3OTM1?=
 =?utf-8?B?MmNiSzMydjYvdUpRMlR5TkdMY0RVOGYvU0piZCtuK0ZGR3lsRDVyb244WEU3?=
 =?utf-8?B?SkoyNys5R2wvcWRYYXlYWm51VDZqMTQ4MHVueDk4UFREZTJweEdGdk13ZUtH?=
 =?utf-8?B?NGgwOTdzOTlsV0RQK1l2eENVbWlRZVFPZUwxd0trZENTRkZpczFLdTRnTUdE?=
 =?utf-8?B?Y3V2YnFDTHNSeWw2UzNmb0JaTkgwV2VHYUxrQXdpOU00VDUydDBJZ0g2MXps?=
 =?utf-8?B?Nmtrb1JrQ3RMdTZMN1BrSkdDYXRiTVVuTURoWk1wQlhzRmlQZnVzV0FpN3FR?=
 =?utf-8?B?djFuZTBOdjJwUURZbDRNL1cvcExmYTFwRnZmcEtSMzEreTRlaTF0RjJjUG9a?=
 =?utf-8?B?VTB4YVJpZGxudEdmRXZ1WnBMZmZTL1RVNXBETVlqWDV6bk1aM1ZNUXBNSjJt?=
 =?utf-8?B?VFdDL0tiOTR0ZlRGSE9QQlZpbGZhdjVzUFpDM1IweVNYMEVMZCtQTGd4VmFH?=
 =?utf-8?B?T1NqODE1TWJlZkpMcTJ6MkltbWRFQkhQeHIrYTRrV2pGc1ZETXJaeU5YSzdo?=
 =?utf-8?B?Znc5QUdKZU93NkF2aXZteGhxV0VHb0pqUVJUWVZSbC9ScXg3aklVaUN5L2xW?=
 =?utf-8?B?SzR3VkZLRGgxdy9IZWp3TXVhZWRXaWpOZUo4ODluSUI2UmJmTjFMVlF4NXNM?=
 =?utf-8?B?Z2VCL0xiZW04cWZrQ1ExVk9EaTdlYWQ2MTlBa3BHZldlQXpiWTN6T1RDb0lP?=
 =?utf-8?B?MElFczRvOHhFWER5dnNqUk5xSkNTM2FkU3luMjVJTzd6OE9lVEJTbUN6MTVp?=
 =?utf-8?B?emtyUXc4MnJKYkwyT2xyRG4zUHNNT3AvTnpaM3l4czk5S21TdFZ3L2drSS9H?=
 =?utf-8?B?MDZDczd3UldMNzV6eWZwcHo4UFhrNCtTWThYWW51T1MxS2gxZTNYNDJ1Zy9C?=
 =?utf-8?B?bERNbkdPVktXV0hoU2tHNjNpK0E0QUpTQWxzdHhveUpMdFZydWREajNNd2Zx?=
 =?utf-8?B?aWhzdDE0bUxPRUpDZ0pQTEJ2M3doM3pFazRudTVxV2pJUlBGMWtVQmtrQUJj?=
 =?utf-8?B?UDRvaXlTaW5UalZkby9iRVUrK05mL0JqUVlUYk56QVBKNnRNemdsbkNVR2tN?=
 =?utf-8?B?TkNzUXgvUUo4aVE0Y29HcWs2RUVRU3VBUDhrSUlIV01vWXNtUWtyeTlTTGI0?=
 =?utf-8?B?NjQydnFxaUo4ZGY5OTRpMjFYaktrY2tFOEx1ZUNPWUQ5Q3lMb253Q2kydjZQ?=
 =?utf-8?B?R0Z4ODJjNjRBZ3NuRUtadm10NU9BNGk2R0lZWTUxTzRvWWw4ZTFJelE1TWxh?=
 =?utf-8?Q?r2trKUItiRY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WExUYXdMTkV6TEtqVDYybVk3bG9vNWQvWlRBZ0tSOTVEek1KUGNVOGpZQTAr?=
 =?utf-8?B?NlpuYnRnUWxwN3Fqd1hOK0x0TUI3TDlLbUp5TEZLYk1EeTdVOFgwbTZUWFla?=
 =?utf-8?B?L0hiNzkxRGFSdHYyQndnelpYVkhMbXRPSFd1UFhhTWRmemVQZFBWZ2xldDN6?=
 =?utf-8?B?a2JuNS91QkREYnd0blBENDFvSitCQTJqd2J6QUZXVFd6M2toRHNIUUZvQzVz?=
 =?utf-8?B?dWMxMFdNa3REMGRNT0hiMmRoRjJGZDNVWGN5UDRyZW9DcyttUHhxRFQ1bFI0?=
 =?utf-8?B?bzVIZUY0Tjlkak9xY0w0LzVJZ3lvSk5Id3UrNDh2d3JoQm5uUVJhbTFMMmgv?=
 =?utf-8?B?WkhXZ3Fxb29IUzNiTkNGbFU3bStpSTZaWWJwT0QvWlFXckd6cjM4VCtLSUl5?=
 =?utf-8?B?NGZnai91L00xOVluUXF1aTFUajZLbGFYRHlmeHBSc2F2OFdwRUEwQ3RlUlpS?=
 =?utf-8?B?Ym9sZlJnRTJVMVdOcFQ4SXJnWFJVc1NHZWJNU1A2UjNNZkZkQnNiN1MyNnMv?=
 =?utf-8?B?TGJvL1gyUHpZbHJRb2Z6V0dhcHhwZU1iWUVnWUpyWHRMRDhFcXpUOU41M01J?=
 =?utf-8?B?MCt1dEgxM1Nmc0Z0L1dBYjQrajcxTHNQL0JsUW1yTHVGWTlHSStqaHlIZGhs?=
 =?utf-8?B?OUs3c3lMaENFVU5vL3o5K3FHdVRpVllmRFdlM0gwYVh6TnJ4SlJUeGJudm5k?=
 =?utf-8?B?VHR1TlZ5clp6NlE1WTBxalFRazB4ME11T2NEdVoySHhiMTJKaldUbkIrZ0JV?=
 =?utf-8?B?UmhpK3F2a0tzK1NsVGsybmxjb2tyNmJMUTdMckVRN2dCZi9WUHROeFQvUW1n?=
 =?utf-8?B?MWw2VitvclR3ajhrRExHN041OUwrWEYwRTEyS2I3aVdjQVhaTTYyQUNvRmVB?=
 =?utf-8?B?b295eUFyaWoySWozMDVKaTlyYVpUbmZlL0pMYStUM3F2MG5iT3NFeHJmNUsz?=
 =?utf-8?B?TDBCQU8zTE1odmtyWEI1T2tKMkRaSytPK2RWTmZVS2RhZVlWWW82RWVma3dC?=
 =?utf-8?B?VFZleWpDRDhMYS95OFd1aUJHUFJET1FBR0RVb1c2cERtcDZUZTFMODZvR21D?=
 =?utf-8?B?Y3F1ZUh3SDlmOXJHeG85MVFzbFV2S2Z5eFNvZkhZdWFNNVRxeGhyYlNxM0xw?=
 =?utf-8?B?ZStmbE9hVE1vZHB2ZFpjVXZiL0loU0NaOWNmYTZTZjMrdDZ4NGRXU3E3a1BW?=
 =?utf-8?B?VjVSM3R5WStPdUtrTWFuNmdVNjZsSmdWeitXaEI0cDZzSnNIZC9zMTEvT1lQ?=
 =?utf-8?B?aUlZc0d0b2lmWTl2WmR5Y1NZeDVzY1pIeXQxSjk5eTVXSlZNNTkxc1BYYWJQ?=
 =?utf-8?B?NlJrR2gwV3lDMEZJQTlFemZ5dmhuWkFVNHlZZjNjM2g0emxERjRwZHBoQjJK?=
 =?utf-8?B?NGxWYmNwNHdXZkJHMWdDTys0Umt6azJoNTgzMyt5SC9TcVlydEJUR1Fyekdu?=
 =?utf-8?B?aXEva0d0ekRWRlZNSEMzaXdWTW5OaEUrT1lvUFVLWkEvckxXUzN0VENyeVZh?=
 =?utf-8?B?QkQvUjVjUUJDWDJLQ28zY3BkOEFEb2pLL2tmZmZMblFEWjZoMnorcUdHM2NE?=
 =?utf-8?B?QkRFejgxZFV1c1FaekwvVVVDVXR6dE9NeWRiRXF2cDZHTTl2VWREZkgrUys4?=
 =?utf-8?B?UkdSL1lqWGIwalRCc1hldHBrRXpsRm1UVGpmL0FSL1IyeFdwVkFsK1FMNmh0?=
 =?utf-8?B?cXlMRlFPbk9CT2s1ZUdyYi9OYnVCVzRXYytmb2dLSXJsVEVtZlpIWlRLTE04?=
 =?utf-8?B?ZGhUZC84ZnVrcE9mOU9HZXRMT1FXdnNMVWRBT1d2dElHNkprYjFRdndRbnNU?=
 =?utf-8?B?Z0lha2MwbnBoTEczbmxuY09Jc2lFK3k4cHR6MEpucDNqMmRnOGZXVGhIWGZM?=
 =?utf-8?B?Y0JyLzQ5dFBlbU83UndQZkpQcWU3c3VnVXBNU0hpdG91UTlDRjFOQjJlS2c2?=
 =?utf-8?B?a2Qxb0YvK0R2Ri85RkRMM29pVGZKN2NVQ09SdEFJWEg5NWh2QnVLVnVERk5O?=
 =?utf-8?B?Y0o0d2liSnJGV1pxeHErTGU1WTlFU3BmQ1R5emRCVGtkU0ZobzQyM1poYk13?=
 =?utf-8?B?UTg4S3lUZmh1WDRrUXlkbHlGdnJ6aGRrYzlRekRYajZHS1IxQmNrbXdqRW1j?=
 =?utf-8?B?Rmxrd3NGQmczdXRyS0VBZFo2bGpHNVY1emloMzdhUzRsc2ZjUTNyTDhzeDdz?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d41b1c9-5c04-4bba-73aa-08dda42bf124
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 12:24:39.5702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXpCm+o0SJa6AdFcSuwxwn3egONuLk1hmykcDqDFUGJdjDTMTxB3VNKI0JNNkwinu1/Eq4CU8EHDz4hJnc34sn+6PlrPAzI2I4Hl1MXGytE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5090
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

On Wed, Jun 04, 2025 at 01:50:26PM +0200, Zbigniew Kempczyński wrote:
> Compute preemption tests executed on LNL and BMG behaves different
> as objects were allocated with 'vram_if_possible' strategy.
> This caused LNL creates objects in system memory whereas BMG
> in vram. Setting memory limits should be then adopted to appropriate
> memory type.
> 
> Introduce memory allocation preference allowing tests to control
> how much and what type of memory it wants to take.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Not fully convinced by the name execenv_alloc_prefs but I cannot think
of something better. Also, if we need more parameters in the future we
should make use of execenv containers instead of adding more function
arguments which get propagated. Nothing blocking, so:

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_compute.c              | 91 ++++++++++++++++++++++----------
>  lib/intel_compute.h              | 15 ++++--
>  tests/intel/gem_compute.c        |  3 +-
>  tests/intel/xe_compute.c         |  5 +-
>  tests/intel/xe_compute_preempt.c |  4 +-
>  5 files changed, 82 insertions(+), 36 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 06f831f68c..bfb9024ba8 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -207,6 +207,7 @@ static void bo_execenv_destroy(struct bo_execenv *execenv)
>  }
>  
>  static void bo_execenv_bind(struct bo_execenv *execenv,
> +			    enum execenv_alloc_prefs alloc_prefs,
>  			    struct bo_dict_entry *bo_dict, int entries)
>  {
>  	int fd = execenv->fd;
> @@ -230,10 +231,26 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
>  		sync.addr = to_user_pointer(&bo_sync->sync);
>  
>  		for (int i = 0; i < entries; i++) {
> +			uint32_t placement, flags = 0;
> +
>  			bo_sync->sync = 0;
> +
> +			switch (alloc_prefs) {
> +			case EXECENV_PREF_SYSTEM:
> +				placement = system_memory(fd);
> +				break;
> +			case EXECENV_PREF_VRAM:
> +				placement = vram_memory(fd, 0);
> +				flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +				break;
> +			case EXECENV_PREF_VRAM_IF_POSSIBLE:
> +				placement = vram_if_possible(fd, 0);
> +				flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +				break;
> +			}
> +
>  			bo_dict[i].handle = xe_bo_create(fd, execenv->vm, bo_dict[i].size,
> -							 vram_if_possible(fd, 0),
> -							 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +							 placement, flags);
>  			bo_dict[i].data = xe_bo_map(fd, bo_dict[i].handle, bo_dict[i].size);
>  			xe_vm_bind_async(fd, vm, 0, bo_dict[i].handle, 0, bo_dict[i].addr,
>  					 bo_dict[i].size, &sync, 1);
> @@ -253,6 +270,7 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
>  		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
>  		struct drm_i915_gem_exec_object2 *obj;
>  
> +		igt_assert_eq(alloc_prefs, EXECENV_PREF_SYSTEM);
>  		obj = calloc(entries, sizeof(*obj));
>  		execenv->obj = obj;
>  
> @@ -795,7 +813,8 @@ static void dg1_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  static void compute_exec(int fd, const unsigned char *kernel,
>  			 unsigned int size,
>  			 struct drm_xe_engine_class_instance *eci,
> -			 struct user_execenv *user)
> +			 struct user_execenv *user,
> +			 enum execenv_alloc_prefs alloc_prefs)
>  {
>  	struct bo_dict_entry bo_dict[] = {
>  		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_KERNEL,
> @@ -831,7 +850,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  	bo_dict[4].size = size_input(execenv.array_size);
>  	bo_dict[5].size = size_output(execenv.array_size);
>  
> -	bo_execenv_bind(&execenv, bo_dict, entries);
> +	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> @@ -1078,7 +1097,8 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  			      unsigned int size,
>  			      struct drm_xe_engine_class_instance *eci,
> -			      struct user_execenv *user)
> +			      struct user_execenv *user,
> +			      enum execenv_alloc_prefs alloc_prefs)
>  {
>  	struct bo_dict_entry bo_dict[] = {
>  		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> @@ -1118,7 +1138,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	bo_dict[4].size = size_input(execenv.array_size);
>  	bo_dict[5].size = size_output(execenv.array_size);
>  
> -	bo_execenv_bind(&execenv, bo_dict, entries);
> +	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> @@ -1303,7 +1323,8 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  			       unsigned int size,
>  			       struct drm_xe_engine_class_instance *eci,
> -			       struct user_execenv *user)
> +			       struct user_execenv *user,
> +			       enum execenv_alloc_prefs alloc_prefs)
>  {
>  	struct bo_dict_entry bo_dict[] = {
>  		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> @@ -1334,7 +1355,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	bo_dict[2].size = size_input(execenv.array_size);
>  	bo_dict[3].size = size_output(execenv.array_size);
>  
> -	bo_execenv_bind(&execenv, bo_dict, entries);
> +	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
> @@ -1682,9 +1703,10 @@ static void xe2_create_indirect_data_inc_kernel(uint32_t *addr_bo_buffer_batch,
>   * @user: user-provided execution environment
>   */
>  static void xelpg_compute_exec(int fd, const unsigned char *kernel,
> -				unsigned int size,
> +			       unsigned int size,
>  			       struct drm_xe_engine_class_instance *eci,
> -			       struct user_execenv *user)
> +			       struct user_execenv *user,
> +			       enum execenv_alloc_prefs alloc_prefs)
>  {
>  	struct bo_dict_entry bo_dict[] = {
>  		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> @@ -1726,7 +1748,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  	bo_dict[4].size = size_input(execenv.array_size);
>  	bo_dict[5].size = size_output(execenv.array_size);
>  
> -	bo_execenv_bind(&execenv, bo_dict, entries);
> +	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  
> @@ -1777,7 +1799,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  				unsigned int size,
>  				struct drm_xe_engine_class_instance *eci,
> -				struct user_execenv *user)
> +				struct user_execenv *user,
> +				enum execenv_alloc_prefs alloc_prefs)
>  {
>  	struct bo_dict_entry bo_dict[] = {
>  		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> @@ -1822,7 +1845,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	bo_dict[4].size = size_input(execenv.array_size);
>  	bo_dict[5].size = size_output(execenv.array_size);
>  
> -	bo_execenv_bind(&execenv, bo_dict, entries);
> +	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> @@ -1879,7 +1902,8 @@ static const struct {
>  	void (*compute_exec)(int fd, const unsigned char *kernel,
>  			     unsigned int size,
>  			     struct drm_xe_engine_class_instance *eci,
> -			     struct user_execenv *user);
> +			     struct user_execenv *user,
> +			     enum execenv_alloc_prefs alloc_prefs);
>  	uint32_t compat;
>  } intel_compute_batches[] = {
>  	{
> @@ -1926,7 +1950,8 @@ static const struct {
>  
>  static bool __run_intel_compute_kernel(int fd,
>  				       struct drm_xe_engine_class_instance *eci,
> -				       struct user_execenv *user)
> +				       struct user_execenv *user,
> +				       enum execenv_alloc_prefs alloc_prefs)
>  {
>  	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>  	unsigned int batch;
> @@ -1967,15 +1992,16 @@ static bool __run_intel_compute_kernel(int fd,
>  		kernel_size = kernels->size;
>  	}
>  
> -	intel_compute_batches[batch].compute_exec(fd, kernel,
> -						  kernel_size, eci, user);
> +	intel_compute_batches[batch].compute_exec(fd, kernel, kernel_size,
> +						  eci, user, alloc_prefs);
>  
>  	return true;
>  }
>  
> -bool run_intel_compute_kernel(int fd, struct user_execenv *user)
> +bool run_intel_compute_kernel(int fd, struct user_execenv *user,
> +			      enum execenv_alloc_prefs alloc_prefs)
>  {
> -	return __run_intel_compute_kernel(fd, NULL, user);
> +	return __run_intel_compute_kernel(fd, NULL, user, alloc_prefs);
>  }
>  
>  /**
> @@ -1990,7 +2016,8 @@ bool run_intel_compute_kernel(int fd, struct user_execenv *user)
>   */
>  bool xe_run_intel_compute_kernel_on_engine(int fd,
>  					   struct drm_xe_engine_class_instance *eci,
> -					   struct user_execenv *user)
> +					   struct user_execenv *user,
> +					   enum execenv_alloc_prefs alloc_prefs)
>  {
>  	if (!is_xe_device(fd)) {
>  		igt_debug("Xe device expected\n");
> @@ -2009,7 +2036,7 @@ bool xe_run_intel_compute_kernel_on_engine(int fd,
>  		return false;
>  	}
>  
> -	return __run_intel_compute_kernel(fd, eci, user);
> +	return __run_intel_compute_kernel(fd, eci, user, alloc_prefs);
>  }
>  
>  /**
> @@ -2035,7 +2062,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  					const unsigned char *loop_kernel,
>  					unsigned int loop_kernel_size,
>  					struct drm_xe_engine_class_instance *eci,
> -					bool threadgroup_preemption)
> +					bool threadgroup_preemption,
> +					enum execenv_alloc_prefs alloc_prefs)
>  {
>  	struct bo_dict_entry bo_dict_long[] = {
>  		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> @@ -2095,8 +2123,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  		bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
>  	bo_dict_short[0].size = ALIGN(short_kernel_size, 0x1000);
>  
> -	bo_execenv_bind(&execenv_long, bo_dict_long, entries);
> -	bo_execenv_bind(&execenv_short, bo_dict_short, entries);
> +	bo_execenv_bind(&execenv_long, alloc_prefs, bo_dict_long, entries);
> +	bo_execenv_bind(&execenv_short, alloc_prefs, bo_dict_short, entries);
>  
>  	if (use_loop_kernel)
>  		memcpy(bo_dict_long[0].data, loop_kernel, loop_kernel_size);
> @@ -2175,7 +2203,8 @@ static const struct {
>  			     const unsigned char *loop_kernel,
>  			     unsigned int loop_kernel_size,
>  			     struct drm_xe_engine_class_instance *eci,
> -			     bool threadgroup_preemption);
> +			     bool threadgroup_preemption,
> +			     enum execenv_alloc_prefs alloc_prefs);
>  	uint32_t compat;
>  } intel_compute_preempt_batches[] = {
>  	{
> @@ -2197,7 +2226,8 @@ static const struct {
>  
>  static bool __run_intel_compute_kernel_preempt(int fd,
>  		struct drm_xe_engine_class_instance *eci,
> -		bool threadgroup_preemption)
> +		bool threadgroup_preemption,
> +		enum execenv_alloc_prefs alloc_prefs)
>  {
>  	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>  	unsigned int batch;
> @@ -2238,7 +2268,8 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>  							  kernels->loop_kernel,
>  							  kernels->loop_kernel_size,
>  							  eci,
> -							  threadgroup_preemption);
> +							  threadgroup_preemption,
> +							  alloc_prefs);
>  
>  	return true;
>  }
> @@ -2254,7 +2285,9 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>   */
>  bool run_intel_compute_kernel_preempt(int fd,
>  		struct drm_xe_engine_class_instance *eci,
> -		bool threadgroup_preemption)
> +		bool threadgroup_preemption,
> +		enum execenv_alloc_prefs alloc_prefs)
>  {
> -	return __run_intel_compute_kernel_preempt(fd, eci, threadgroup_preemption);
> +	return __run_intel_compute_kernel_preempt(fd, eci, threadgroup_preemption,
> +						  alloc_prefs);
>  }
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index f0d1750ccb..412791d074 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -65,11 +65,20 @@ struct user_execenv {
>  	uint64_t output_addr;
>  };
>  
> +enum execenv_alloc_prefs {
> +	EXECENV_PREF_SYSTEM,
> +	EXECENV_PREF_VRAM,
> +	EXECENV_PREF_VRAM_IF_POSSIBLE,
> +};
> +
>  extern const struct intel_compute_kernels intel_compute_square_kernels[];
>  
> -bool run_intel_compute_kernel(int fd, struct user_execenv *user);
> +bool run_intel_compute_kernel(int fd, struct user_execenv *user,
> +			      enum execenv_alloc_prefs alloc_prefs);
>  bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci,
> -					   struct user_execenv *user);
> +					   struct user_execenv *user,
> +					   enum execenv_alloc_prefs alloc_prefs);
>  bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci,
> -				      bool threadgroup_preemption);
> +				      bool threadgroup_preemption,
> +				      enum execenv_alloc_prefs alloc_prefs);
>  #endif	/* INTEL_COMPUTE_H */
> diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
> index ce41cd386b..b8e7dec59c 100644
> --- a/tests/intel/gem_compute.c
> +++ b/tests/intel/gem_compute.c
> @@ -27,7 +27,8 @@
>  static void
>  test_compute_square(int fd)
>  {
> -	igt_require_f(run_intel_compute_kernel(fd, NULL), "GPU not supported\n");
> +	igt_require_f(run_intel_compute_kernel(fd, NULL, EXECENV_PREF_SYSTEM),
> +		      "GPU not supported\n");
>  }
>  
>  igt_main
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 65e32ce9dc..955edf082b 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -146,7 +146,7 @@ test_compute_kernel_with_ccs_mode(int num_gt)
>  
>  				igt_info("GT-%d: Running compute kernel with ccs_mode %d on ccs engine %d\n",
>  					 gt, m, hwe->engine_instance);
> -				igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL),
> +				igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL, EXECENV_PREF_SYSTEM),
>  					     "Unable to run compute kernel successfully\n");
>  			}
>  			drm_close_driver(fd);
> @@ -174,7 +174,8 @@ test_compute_kernel_with_ccs_mode(int num_gt)
>  static void
>  test_compute_square(int fd)
>  {
> -	igt_require_f(run_intel_compute_kernel(fd, NULL), "GPU not supported\n");
> +	igt_require_f(run_intel_compute_kernel(fd, NULL, EXECENV_PREF_SYSTEM),
> +		      "GPU not supported\n");
>  }
>  
>  igt_main
> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> index 43ffb8dba3..3a3d7847ca 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -43,7 +43,9 @@
>  static void
>  test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool threadgroup_preemption)
>  {
> -	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe, threadgroup_preemption), "GPU not supported\n");
> +	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe, threadgroup_preemption,
> +						       EXECENV_PREF_SYSTEM),
> +		      "GPU not supported\n");
>  }
>  
>  #define CONTEXT_MB 100
> -- 
> 2.43.0
> 
