Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8506C3064D
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 08:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7854D10E565;
	Tue,  2 Jul 2024 08:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2ooDM2s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CC910E565
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 08:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719909094; x=1751445094;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=hoohJwc7BRnEPgdcN4GSJYqrA5hSBpdV8mKNYf+v5PQ=;
 b=D2ooDM2sm/XFzDvRPcoH9cpqAaGBiiZlKsHbNBocn8iGjdnPOh49ieEt
 GznuZw+B2r0F7xhEwjjL2JEvXpkAMCTbIf7f/WwfCxfvyt6XhZ/WtN+yX
 2Sm/LOUg0bLc0fh4nbbPEj8Ev3x2YELrNoE7/yLApkwkJFvOfyTEHoN2T
 RQuFlLji5qgKNUbRLHUEefqFmkjv7MzPK+sJt30AHa+h/LTBSHjRNUe4w
 np3Mli7+/HF3DR+sVMMXXDCBI/AcgBvzZhAELci4Zmh8KGXYaG4Tht9LS
 ekKezZ+5IdF3c1iDWPbLm9BQIvfOXdJ6h5QdwgPFbev9Lh9zLKp8CpV7A g==;
X-CSE-ConnectionGUID: VExwbJhqQNqEk0g3yQWukQ==
X-CSE-MsgGUID: tmWFH7hpTMejKVaCjn5lIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="27749133"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208,217";a="27749133"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 01:31:33 -0700
X-CSE-ConnectionGUID: h2NeWEUiRfC+vg6ie0NeXA==
X-CSE-MsgGUID: B6vMlJSaRYCMAyqDIa+Psw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208,217";a="45715592"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 01:31:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 01:31:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 01:31:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 01:31:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 01:31:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkTIWSBu38KcwTdY572oElBaNsXwJvfcvJ3/UqRwDziYKsJGvXDuq256s48QcTG4mA2vrMMk2G9koFPBJdPDJVyA8ltICqrsjaDhw7sJ0JBmCXhPbgd8xMBhM2yH5uhT74C/woOIms88Ubhkv3JeNdTEtRkcpeOAlz1nDkcj9+4Ve/Udz2MklEO9VFrHJzreK9s5KvV4sG15BbItc9GGhs8vH1xY7AgO0/F8VRDZ16tnxYcw6d53JG0gOuQH2bRN/JvjLoOemZ3CZATllb247c/kzsjCbF8J10d9zcpAf0VYQL99fUg0XbQBoTvxLywczqNVzLG4K2koh6QVS+OmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iwj3fc/PrGw54YvmrAITj5hQTdAmrApHtgmpQrUv0rw=;
 b=nGTg7N+fqFmvoRy4H1wWoN2qLI5Vsuu5RL8+wLutksvsYg5nlsutVRyO5K/GJveiTV5Nb+P5UlOsmtDhEhOW2GfD2I7MuJ4a0Xex/9UKMihOPktd2OIr9XkLuTkhJJcXNkWNoSQofbyARJXegD6hBKrFf6avmAeuAnT3iffqtNwYQRuSsZ3IUIm2u+kdLjoUgudhQSBUXbfYOSYck40lud9Mw2agALf/rTXHNYT9GRw2236+RFZctMVMIwn1IiEFq4ODECu9liq3t6krIAmb87hGSjOuNe+1HK8fyPk3rDl+VQQy+lHXNGXYZH+FAPhQ3Xj1D33kFPg3LWF9d8wfiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Tue, 2 Jul
 2024 08:31:30 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%3]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 08:31:30 +0000
Content-Type: multipart/alternative;
 boundary="------------HIWnZW0cSXlGFFFWlk0uUb1F"
Message-ID: <14e6bc1c-cbc1-4679-a1dc-06722df5a4a6@intel.com>
Date: Tue, 2 Jul 2024 10:31:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_sriov_device: Replace libpciaccess with
 direct sysfs interaction
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20240627145118.719988-1-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: pl
In-Reply-To: <20240627145118.719988-1-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: MI1P293CA0018.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::12) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a1dedb-63ff-4622-0cda-08dc9a715f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enhtTlEyMk1tSUtlUE04bEVhRSs1cERJOTEwUDB6bFNBWDdNQ2hqaFdQQ0ZK?=
 =?utf-8?B?SmVKMm1Td3dxSkY3Mm1GY3RVVTFzY2w2TVJ4S0pqb2JlYmNkSm40WG1sNEgv?=
 =?utf-8?B?NWhPVGN6Zkd1Q2dmSFR2VTlMMDBLSWpOM2pBS2NBVTNwQjI1Q1JlQzVVVS92?=
 =?utf-8?B?WGRTb09xeUxOS0lIRFBvRlBwamJacGxDY1lWZitRazRaMEFYTnU1dGNhTEEr?=
 =?utf-8?B?dStEUjg1T3NJbnVQYlZ6NmdUeERwd0pYZTk3TExPWEc0OWtNTTVWMjRlQmdK?=
 =?utf-8?B?a0JidVVOdlVaT3JEMzlYcWF6dXppODlaZ0EzUzNvcnp0TDJKL2hVRE12NzB4?=
 =?utf-8?B?SVJZQlFOWXp6enN3WnNkK01VZDIvdEZiK1BxSWF5cFBhL2F2QkFucUVsQm05?=
 =?utf-8?B?bE83ek1qNkgwUmVEd09YeEJsM3NaMlJKZi94YytkNEJqVmZadzE0eUJySGpr?=
 =?utf-8?B?cUdTdDR5Ry9TSW9CTWRYY01Jd0oyajl6YTVDN3VJVmpIR0ZNd1h0alY0SW1Q?=
 =?utf-8?B?TitrWnE2VVJac2kwdDlrUU9kbHNraVpiTXJwMnFEbWtLaUhaMGFxNjRrTldq?=
 =?utf-8?B?VGVoYVpLNVlRNDlSMW03SW5qMDF4OC95TGxMZG5CK1F2WU1MSVhoLzdiS1hR?=
 =?utf-8?B?bS9WUzNxeGYrU3NDVmdnUFViRTdlY3MxSzFLTzBUSWptU0haTVZPeGE2Yk5o?=
 =?utf-8?B?WDZNamdzeDdCMS9WV1MrYWU4M1hxemg4K0QwMk9VNXRlcXgzaUMwck1TNDZM?=
 =?utf-8?B?em50dGc4VitZOWpydGF3SWtLMEpzZnVBZjZCZjlWOXpYcnpUbnhPREY0aGVN?=
 =?utf-8?B?SmlXaXhXMXVtR201K0tlUUhaeG44Z3JjaS9PakJMc1M5RHFlaHl2bG9DWElz?=
 =?utf-8?B?SGNmZDMrYnBJUTBQMjRHY1lOckdQYmxVbGFtMVMxWEtLcnlqNkYzMGRxaDRE?=
 =?utf-8?B?T1ltaU5lck9nNWZVZ2MvYmxFYnRESGg5alJjUHR5YXVzSlhZeDlEdytiUGRR?=
 =?utf-8?B?L3NkMThoR293RTFlNmtXMGJPQmlZWUxSQ2haLzFOdE1GU3htaFdCV1MwU1hO?=
 =?utf-8?B?NTNLeFg3dUNlWTZKdkwraFkvSDNXelJjMGU2ZWkwdGFuUDdjWFNETnd2UW1M?=
 =?utf-8?B?NUEvZUhWWXZCR2x1TnNtQVRsMit4TkFnenFMUVhLUTFCR1BwV2FYSEtlM3Nm?=
 =?utf-8?B?OVducWUzNGR6citSQ3VrTWczcE5WSVlsRmhML1VXN2RBdDRYVnhVckJlcmJ1?=
 =?utf-8?B?dFV1Mk5VWlpCdzhQalllNVdVclUzQ1RGN2g2aVl4Y0lkdWw2cUViVnVoeWZE?=
 =?utf-8?B?cURFS1poa1l6aGQ3ZXNycE1LcjJFMnJCc2RscnpPWUNPVURLbWVJa24zMEVD?=
 =?utf-8?B?dFdkUmhQeHR3NnJQSU1sd2dxMVMzc0FBOEExK2JnbFNzM1BodzFDdXh3ekFl?=
 =?utf-8?B?d1ZVT0t1Ym9WUnZTcFEzTndubWdER0UxQ0Vkblk3UkxEUDkwSkhkYmdNWG1q?=
 =?utf-8?B?SkpZTE9SR2N3MWNrYVlqU0kzWGJRVG1FVmFuY3ArUERGanArTThzNnhxZEFQ?=
 =?utf-8?B?d1lTYWlGdStZem9DRjVHeWV6SlR1cm5NamRGWTBWSUk4c0Q5YVY4ZFZiODVi?=
 =?utf-8?B?VzVMdW4ydzZKOWlsNGhKNjYyZzE1WUdCejZ4M2NyZFlKMUZ6ai9RbTdFUk5z?=
 =?utf-8?B?Nkx5cFRWRVZNZVk3M2c3TXFab0dJME82aUFMK3ByTkRmQnY1dFhkanN5bWpH?=
 =?utf-8?Q?x3P22Vc87XhU1AAY+Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dStFdDZmTjYxbnVYR2FFTUxrYjN1RHR6ZFluUk9XbVRHYjViR0t2c1VTNkJM?=
 =?utf-8?B?M3BoaDlwbVo3T00yckdtNUFIaEZhNmt6VzdhNGUzc2JUSFByZGFselZmaE1S?=
 =?utf-8?B?a085aytBY1ArNy9MQ05LYW5jeFR4bFRDMk9nbGxxSlN6UlRQVng2TEZjK0Zn?=
 =?utf-8?B?L3NIUFAxc00rS0hCdUxKbXFGZ0psRVNvU3dLODNvMlorYnNyMnp1UnJ3TE5x?=
 =?utf-8?B?dG9LOCtxSTN6TklEVDhScjZQL1lyRTd5aHE1N0hUODVEUDdUOS9mMUhFcXFm?=
 =?utf-8?B?UEZzZkx5VERkQ1VKb2ZpSzZZUVBhKzRJbU5WYVpJMFdJRytwK1JYMWhnWS8y?=
 =?utf-8?B?aVJ2TWJ6eWxCQVZUVW1uUUxLdnJKRml3cXFRdzFlN0RXS2J1NEZQaDUvdndu?=
 =?utf-8?B?cFArSmpta3hVbWxGSUxzS2RCdjUzOVJDMklHNUl5Wm1QaE1mYkordzFtQ2xT?=
 =?utf-8?B?b09rcGh1Z215MSswbFNNd01MMU5iQ2NuVW93ZkFFOFZRaWZzU1ZESFU0Q0V1?=
 =?utf-8?B?MjFrVGk3eEtZaGdBc2xldkxSRlNQV1VRUEZJZ1pkSjcrcDBkVlRBMWNDQWF4?=
 =?utf-8?B?azlxSU9OYXRXYzRYenE4L3FNeGJEWXN1ek9vSmY3dGttMllmN0R2VUlaT3NG?=
 =?utf-8?B?ZlptaUhabnkvSjN6NHc4ZTBDZzRYV0czMWhFTnQ5b1JLT3lpNXhYbCtZRnhI?=
 =?utf-8?B?RHFXUVIrZUJQL2FjdkM4d2N5Rno2dlg4VzV4SVpuL3NhNU9VSnBkZGVtK2Zl?=
 =?utf-8?B?TjZnSGpPZGF2aUI1aEswa2ZUYW1RTFlKTmU4ZDNQMWRKQURkUk5kOXZQNVg3?=
 =?utf-8?B?QjVQVjE1UkhRU1RvRUNneUpaN3p1ZjltT21FNzBkdWpyYmdONnp5WGNBTU5y?=
 =?utf-8?B?WXhhUHlLL2hoREdsWHZMQkgwYTh2Y042MCtmRUY0T0lZSFgxdWFPRFJuWnky?=
 =?utf-8?B?VzBZYWxSdUV0M1Q1cUhhT25yL2tCWWhpMkJkRm1MQlRLb3lUWmFJNm9UNWZy?=
 =?utf-8?B?OHM4S1dCR3VLaHczMUY3dUUydUVnLzQwSG8yRUs1TkZCN2k5NGZZTjVhSTht?=
 =?utf-8?B?dCt2Y0RwUDJNWllJZzZOZXJ0bjZaZk0vMEwrOGc4eFB2akpDZXhuNTFWSnEw?=
 =?utf-8?B?aVUzRHdGMkFvSzVyem5kbmZMNnpoY1dRZm9Kdkxsd3JRcjVCWVdENGc4N2Er?=
 =?utf-8?B?MVRvUGpPL3E4OWhmWmUrcEJGaHdNVjlBa2J1S0tNSjJBaWt6ZnJzd1ZlNmd6?=
 =?utf-8?B?NCtIQWhlRDNlUVppcXFYYUxWSTBrSmJ2QzcxUWNMMlVSWEhGTExVUzBGOTBp?=
 =?utf-8?B?ODljWURVNkQ0Wk41bzRoTmh2Z0dUUHgyM3lmVGg2Q0wxZDJ1SllNWkRCUUxR?=
 =?utf-8?B?TXFZUEljcmZ6cFBKamxwMHBrR0tVQ2I0ZjZRZEhib2JmcVZ2aloxdWd5VXdU?=
 =?utf-8?B?dUhhS01ZR1BabW92MXBZSTAwWkJBZitvYzRaR3lNQ3ZhQW1vLzM1Vy9ZYWgv?=
 =?utf-8?B?bHNmb2JtSmxFSHF5N3MvTFpXMm5JbXY0SEsvRjFWRnROcHJJZXdGNVdyYjFT?=
 =?utf-8?B?WWNpR2lXQVVObzh3M0taZlI4enRQRWNZR3hZd2IzYmhzQkNmTk5BWGFUNXR6?=
 =?utf-8?B?cUFjL0tnMFNKU3p1a2k4QndJTDV3RTBHbjJUOWZ6TjZUb3dua3BwQ0NNUFgv?=
 =?utf-8?B?clZUZ2FaR1JTcjJMUVMzRGlBNjVCWjBQY0tPLy93UHF0M252YU4vTGY5ZnBG?=
 =?utf-8?B?cURMWWlVNWQwT1JHdnpyNUFpNjJPWm5zWk04dUN3dHR0NHZKY0JjVGlBZnNQ?=
 =?utf-8?B?dkQrYXZDbVRlNnlrRktJUVRoM1NUanlUUjJKVkFHbDN0OEVYVmtUc2xvU1pL?=
 =?utf-8?B?dUsxNEdoTVl1RGNkUW5wanEvYzJzNkUzMmJoSDVqcHRzRGR4QWowalBHK3Jq?=
 =?utf-8?B?VXVGYjF1K3IxRHFPNm9rUlpIbDVQcHQwekI5c0w3eUxQWWNZc0loYTJYeU5a?=
 =?utf-8?B?SitoY3RJanV4c0I3TEZLaGo0QUthc2dnZzFLMDN2MUJHek9Uak92LzRFTTQw?=
 =?utf-8?B?aFRxSTRmUllrYXE4RVNTdDFSM0RKSE1oditJWWU2R1ZVc1lZVXFwaFJLOUU1?=
 =?utf-8?Q?5PLfBjQ5JwB4gk8ky++WZ0C/l?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a1dedb-63ff-4622-0cda-08dc9a715f59
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 08:31:30.2413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pcx1WMqbCs28aufD/FRrDXHoAAYfB7oVjCa81r5WPLlDBxNt0kGqYqQKFrrCXCXGnoHKTRZUsGhZCxsybwyrMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
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

--------------HIWnZW0cSXlGFFFWlk0uUb1F
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 6/27/2024 16:51, Marcin Bernatowicz wrote:
> Previously, libpciaccess was used to fetch PCI device information for
> VFs in SR-IOV, which does not refresh the PCI bus state after the initial
> scan. This can lead to outdated PCI information in dynamic SR-IOV
> environments where VFs are dynamically managed.
>
> The new implementation directly interacts with sysfs to resolve the PCI
> slot address of a VF, ensuring access to the most current state of the
> PCI bus. This change removes the dependency on libpciaccess and uses
> __igt_sriov_get_vf_pci_slot_alloc to fetch the PCI slot addresses
> directly from sysfs based on VF numbers.
>
> Reported-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Closes:https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-9/igt@sriov_basic@bind-unbind-vf@vf-2.html
> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Kamil Konieczny<kamil.konieczny@linux.intel.com>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> ---
>   lib/igt_sriov_device.c | 46 +++++++++++++++++++++++++++++++++++-------
>   1 file changed, 39 insertions(+), 7 deletions(-)
>
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index a0ef05d5c..416d8f4aa 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -297,26 +297,58 @@ bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num)
>   	return ret;
>   }
>   
> +/*
> + * __igt_sriov_get_vf_pci_slot_alloc:
> + * @pf_sysfs: sysfs directory file descriptor
> + * @vf_num: VF number (1-based)
> + *
> + * Resolve symbolic link from virtfnX to obtain the PCI slot address.
> + * Returns a dynamically allocated string containing the PCI slot address,
> + * or NULL if the link cannot be resolved.
> + * The caller is responsible for freeing the returned memory.
> + */
> +static char *__igt_sriov_get_vf_pci_slot_alloc(int pf_sysfs, unsigned int vf_num)
> +{
> +	char dir_path[PATH_MAX];
> +	char path[PATH_MAX];
> +	char *pci_slot_addr;
> +	int len;
> +
> +	/* Adjust for 0-based index as vf_num is 1-based */
> +	if (vf_num)
> +		snprintf(dir_path, sizeof(dir_path), "device/virtfn%u",
> +			 vf_num - 1);
> +	else
> +		snprintf(dir_path, sizeof(dir_path), "device");
> +
> +	len = readlinkat(pf_sysfs, dir_path, path, sizeof(path));
> +	if (len <= 0)
> +		return NULL;
> +
> +	path[len] = '\0';
> +	pci_slot_addr = strrchr(path, '/') + 1;
> +
> +	return pci_slot_addr ? strdup(pci_slot_addr) : NULL;
> +}
> +
>   static bool __igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num, bool bind)
>   {
> -	struct pci_device *pci_dev;
> -	char pci_slot[14];
> +	char *pci_slot;
>   	int sysfs;
>   	bool ret;
>   
>   	igt_assert(vf_num > 0);
>   
> -	pci_dev = __igt_device_get_pci_device(pf, vf_num);
> -	igt_assert_f(pci_dev, "No PCI device for given VF number: %d\n", vf_num);
> -	sprintf(pci_slot, "%04x:%02x:%02x.%x",
> -		pci_dev->domain_16, pci_dev->bus, pci_dev->dev, pci_dev->func);
> -
>   	sysfs = igt_sysfs_open(pf);
>   	igt_assert_fd(sysfs);
>   
> +	pci_slot = __igt_sriov_get_vf_pci_slot_alloc(sysfs, vf_num);
> +	igt_assert(pci_slot);
> +
>   	igt_debug("vf_num: %u, pci_slot: %s\n", vf_num, pci_slot);
>   	ret = igt_sysfs_set(sysfs, bind ? "device/driver/bind" : "device/driver/unbind", pci_slot);
>   
> +	free(pci_slot);
>   	close(sysfs);
>   
>   	return ret;

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com 
<mailto:lukasz.laguna@intel.com>>

--------------HIWnZW0cSXlGFFFWlk0uUb1F
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/27/2024 16:51, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240627145118.719988-1-marcin.bernatowicz@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Previously, libpciaccess was used to fetch PCI device information for
VFs in SR-IOV, which does not refresh the PCI bus state after the initial
scan. This can lead to outdated PCI information in dynamic SR-IOV
environments where VFs are dynamically managed.

The new implementation directly interacts with sysfs to resolve the PCI
slot address of a VF, ensuring access to the most current state of the
PCI bus. This change removes the dependency on libpciaccess and uses
__igt_sriov_get_vf_pci_slot_alloc to fetch the PCI slot addresses
directly from sysfs based on VF numbers.

Reported-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Closes: <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-9/igt@sriov_basic@bind-unbind-vf@vf-2.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-9/igt@sriov_basic@bind-unbind-vf@vf-2.html</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
---
 lib/igt_sriov_device.c | 46 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index a0ef05d5c..416d8f4aa 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -297,26 +297,58 @@ bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num)
 	return ret;
 }
 
+/*
+ * __igt_sriov_get_vf_pci_slot_alloc:
+ * @pf_sysfs: sysfs directory file descriptor
+ * @vf_num: VF number (1-based)
+ *
+ * Resolve symbolic link from virtfnX to obtain the PCI slot address.
+ * Returns a dynamically allocated string containing the PCI slot address,
+ * or NULL if the link cannot be resolved.
+ * The caller is responsible for freeing the returned memory.
+ */
+static char *__igt_sriov_get_vf_pci_slot_alloc(int pf_sysfs, unsigned int vf_num)
+{
+	char dir_path[PATH_MAX];
+	char path[PATH_MAX];
+	char *pci_slot_addr;
+	int len;
+
+	/* Adjust for 0-based index as vf_num is 1-based */
+	if (vf_num)
+		snprintf(dir_path, sizeof(dir_path), &quot;device/virtfn%u&quot;,
+			 vf_num - 1);
+	else
+		snprintf(dir_path, sizeof(dir_path), &quot;device&quot;);
+
+	len = readlinkat(pf_sysfs, dir_path, path, sizeof(path));
+	if (len &lt;= 0)
+		return NULL;
+
+	path[len] = '\0';
+	pci_slot_addr = strrchr(path, '/') + 1;
+
+	return pci_slot_addr ? strdup(pci_slot_addr) : NULL;
+}
+
 static bool __igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num, bool bind)
 {
-	struct pci_device *pci_dev;
-	char pci_slot[14];
+	char *pci_slot;
 	int sysfs;
 	bool ret;
 
 	igt_assert(vf_num &gt; 0);
 
-	pci_dev = __igt_device_get_pci_device(pf, vf_num);
-	igt_assert_f(pci_dev, &quot;No PCI device for given VF number: %d\n&quot;, vf_num);
-	sprintf(pci_slot, &quot;%04x:%02x:%02x.%x&quot;,
-		pci_dev-&gt;domain_16, pci_dev-&gt;bus, pci_dev-&gt;dev, pci_dev-&gt;func);
-
 	sysfs = igt_sysfs_open(pf);
 	igt_assert_fd(sysfs);
 
+	pci_slot = __igt_sriov_get_vf_pci_slot_alloc(sysfs, vf_num);
+	igt_assert(pci_slot);
+
 	igt_debug(&quot;vf_num: %u, pci_slot: %s\n&quot;, vf_num, pci_slot);
 	ret = igt_sysfs_set(sysfs, bind ? &quot;device/driver/bind&quot; : &quot;device/driver/unbind&quot;, pci_slot);
 
+	free(pci_slot);
 	close(sysfs);
 
 	return ret;</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span lang="en-US">Reviewed-by: </span><span lang="pl">L</span><span lang="en-US">ukasz </span><span lang="pl">L</span><span lang="en-US">aguna &lt;</span><a href="mailto:lukasz.laguna@intel.com"><span lang="en-US">lukasz.laguna@intel.com</span></a><span lang="en-US">&gt;</span><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------HIWnZW0cSXlGFFFWlk0uUb1F--
