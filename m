Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2465DC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 11:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BE21122A7;
	Fri, 26 Apr 2024 11:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NEYCznfX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD961122A7
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 11:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714130214; x=1745666214;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EufvINcty/IdRVIYCqLv8NDrqKrR/Ou+OHjF+NskpbQ=;
 b=NEYCznfXfQ6jAhoj6T9pHM7EB2sc0D4rwOQcFPH/DgKbTSU2WnsDVzsD
 kGNKBDG0eZroZOegA8F4Ibnc1psrpTcfLF/tsIM/1Qim2mpwTozKHIMjN
 m/wiJHEQAmS5VhzIF4RZcWMc6CkWL5z4WPq6tQR3v1v33VZnNBseOjObD
 DKIlNKxAViSizy1bnrjW53oWY3OI1V/VtQbsJAzhEFd5mPB+JgYhkyMLe
 m5tm4XDQ/oWxb9FLXWpbrccxxX6JHf562Aq4RY21qM0VG06EVi03va6l9
 HioOFmTu6MRmQrDNfwRztGJZcGNRMnV/zR7scI61hagZCkwMTsDgRBwlx w==;
X-CSE-ConnectionGUID: DgPFdhEQS6ihlnuXOnk2+A==
X-CSE-MsgGUID: RHg4i64ETpihQ8UuHX40cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10020464"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="10020464"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 04:16:52 -0700
X-CSE-ConnectionGUID: fKNh819hTlSZidvHauxTmw==
X-CSE-MsgGUID: rxK+1QUzS0uc76HI5Xs8qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="26017843"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 04:16:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 04:16:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 04:16:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 04:16:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3LWOFrsDklbFoC6VdNw6JRt6Q7lm/uEdAKnbQ0UbKs91SZapOcabFhPIWmxGiaVkRjQ/Jg+jEVOCWwYgC8ZOCwf7lPUr5c1tO28lFdbLM/zDmlVjxuXXP+uWnY8PUOqxComlrX68Ilwg5UKpOZt4w1E1vwIlzmbyOpu1FwFfNDiej+In1MgqPMoqvAC2eKnOzg+1B2yLUXQ4n9LvvSUpDB5sYXcBQcl5jbz+nCMeCu+F1IW3W8YHx+Q0hArcQ8dlv3VejBXF/h26ML3X8smhgjl1DjQYF6bQn8abNSst+B2J6DCOgUcTHFqe51PYCwvzeBJ3PmzQxqX/VFFm5N8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfOqvtP+vlf4+sGyl2R0FNFlU3lxssq0Z5e+kLJCGwE=;
 b=I/82JkE6FKh/ddcR057W1hItHKTtrEBgeBxc4jt5gEJbsjWAELNkZW+sLKxpayrcsMzPxyJVTrlNIBf172Hj3R7mA6lf6rR/OM5pAV7bEqwASwUXAUVN5UjH5YxSGlarUdhO0RyNvFWyKcI+uF9cq8gclKSryBEJ6ICpvx4M4wENLBpCFrG4DZ4jk+PSTzOE5wkr4qvHElPePhQ/PAqGMRH2P/vw1pWIxaZsk+ihmR/06W9i1aMG7G7Rpz6/4PAqQPUYmcxBEmPaGQOwBbKjbjQbz9YUl8MPttzDuWORXXpdVH9tYDdnMn0/piREp1PnyuDYFUC5blvsjEm0JMxrvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by CY8PR11MB7136.namprd11.prod.outlook.com (2603:10b6:930:60::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31; Fri, 26 Apr
 2024 11:16:50 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%6]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 11:16:49 +0000
Message-ID: <7b853623-3344-4225-8fd5-d2644e8addc2@intel.com>
Date: Fri, 26 Apr 2024 13:16:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 09/10] lib/intel_blt: Add render tilings and
 compression support helper
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
 <20240426090117.78060-10-zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240426090117.78060-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB7PR02CA0036.eurprd02.prod.outlook.com
 (2603:10a6:10:52::49) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|CY8PR11MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b83529-b11d-4f83-078e-08dc65e25e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHJYR1FQTWczT05OUG1sblBRbmFyWWdXYzF1QmphY25MT0hDTTB6bnFWWkN1?=
 =?utf-8?B?RFlEKzNpVFkrYmFSWlB6eVpITk0wVkxMZU1hRlNpUzJ3V2t4MVdaSDRMa202?=
 =?utf-8?B?enYzdWJvcEViS3dWVTZpYzNyd1hpL09FWnVJZlFTcWE0dkNMMHdHVWlzNlJG?=
 =?utf-8?B?dU5RbEM5VGZyUS9UU1krRlZsRFp5cGg1UmcvMnhza2pHMGNJRjcwcDdZaWdj?=
 =?utf-8?B?SXhQUXEwRkE0QlFEbkZ6T29lZmdCYkUvdlQ3VURzTHpSKzBqd3V3Q2NIOTgv?=
 =?utf-8?B?d0M3aDBOZDVub3M2d2Qzc0NqQTZBV1puNU1GSVlBRW9pSnVscmp5blVrWlBW?=
 =?utf-8?B?N2pDdVMvU2w2dmRqSk1zQWZGUmNYcDh3OEhtdFRMTm1xTW9zS3BhV1o2VHRT?=
 =?utf-8?B?U0lqTHJneXUxdlBadE80UXI1U0NGTGlPaERmYjU1U0t0UkgzZGs0RVN5a3lK?=
 =?utf-8?B?Qm9RakZhOGdxMzBXaXpSZWdIWW4xcW1udW1FOXUxSXlCQzRNZjR2aVBZNjVN?=
 =?utf-8?B?bVFqc2h1dXFqbjNFeWdDWUVXMEE0VHREbWFSYW5SZFlCNTZQRDlzc25FTlJz?=
 =?utf-8?B?V0gvam1oREJXcjU5RmFGcWE2cXEvQmIzUEdDdVlSamRMUGJvK3ZtT3ZnUnRy?=
 =?utf-8?B?MDBRUTFoanNRWFlZR1YwMGl5RXpDanhrc1RybXVNSjlkUVBydlQ0NDd4K1F0?=
 =?utf-8?B?TFN2MjZEcmdsVDNwRXpTZkZuUE41dDdyaVI1YUt2d0RyU2Vha3NRNW5jOTBC?=
 =?utf-8?B?MEJldFJiemxpcVE4SGN4SWFDTEdTRDlyOElJZlVyL2VTTzJxVWZEY0FyUWhm?=
 =?utf-8?B?V1IwT0lMSko4YUdLTis3VGNyVUtuL255dTdTUXY1SjhVQ2Z0U3QrVlVIV0Y4?=
 =?utf-8?B?WUNLZUwreUFsc0krMGZTbDBONmQ2VDdvdElDMWMrOTZaU3h6amRueGpoSEZt?=
 =?utf-8?B?UFVYamM2bG5PQ3BTQ1NNb0NxempnS0N2RkhsZHNreWQ0Y091QkVtUHV4R0VE?=
 =?utf-8?B?SzRuSEhPY3diQm1JRXk2ZlF4Q2tJaVdnUjl3ZzlYOWU0cDdQZnc4Mi9vblZN?=
 =?utf-8?B?ejdJT05pU1dIeDYzWWUvczNJaTVGTDVoZis2ajViMUJIeUhqRUVpMGhmVGJG?=
 =?utf-8?B?b0pjZEtqZWVrWFNnZzNteHJYYUlpcXF4aExyWVgzY3hhWjhPejU4L0liZHFt?=
 =?utf-8?B?Y1oxS1hpWS9lZTdlTzhKdnVOTmo3NTgrTFhibDVMZHNvR05sbVRSVE1QRFVD?=
 =?utf-8?B?Yi82blV1RHorL1lDNWJkWTFvTW5lbklXcHNSVGxzdjN4UVVieUQvcC96SFo4?=
 =?utf-8?B?Q0xjYWJ2K09HNGlxanVyUVBKOWZTYU5Fdkx4dUVCTkQrdktNQ3F2dkp1UURR?=
 =?utf-8?B?ZENac1ErSFRjbklXVEdRcG55S2xoVkd0eGFQMGVvU2hucVJjbXJzT0J0SWpz?=
 =?utf-8?B?UnZLNWU3R3Uyb0RVZGpFbjVWbU5kLzU4K09zcUVoWEFEdXQzZk9pQ2taRHZi?=
 =?utf-8?B?OGVpaEVkN2M3MmZpWTZnODFvRzZSWUx4Y0I2QnZEVGlMdkdkTEx0UzY5WUZz?=
 =?utf-8?B?Ui81SGljN3prSDlSQllvRXB1S2srT3VXdTg1TDNwTFZBMFBUVHJaR2dPVEJ4?=
 =?utf-8?B?Vm1tQlZsU3lhNEo5ZjliaGoxSVZiWEY3a2pzcURQVlpSQkpOeTNMb21iUyth?=
 =?utf-8?B?Qkh5WCt3RmNQbWxPTEp5Ny95SUdxYWR3TkxzZ0QxWGN1NVZlSE1BaTdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEFENXJEcEpDYWNleGFxQmF5OTRLM3gxQXN0eE5EQVBqbmx6bkFBaHZxeDAy?=
 =?utf-8?B?ZWk0NFRyOWlxaGw0VWRmeEV4WThTdG1Ybmlxa3BpeS83TjY0TVIvVjhWZ0RR?=
 =?utf-8?B?SWdpeSt1eFpiQlJYc0JhcklVcmZ4SnVqQjFXYWc3cFhNanZhcGlhSlR1Zk82?=
 =?utf-8?B?NzJ0akZiaXRVaHlxQzlOMWw5T2N4cE9KQk43YmNTTWRON0ZmeFR2UU00NGVH?=
 =?utf-8?B?ZlBwOXR4Qk90UXlZZnY3WVVWSEVIalJaeE80ZzFKNzRIcFdlbzFGMXhndE5Q?=
 =?utf-8?B?SWNQMUQ0VWdCRjQ2ekNlUC8xV1gzdjhhZnJkdzhjUmVrdEF6U2FqZVZ4ZHZR?=
 =?utf-8?B?ZTQ3QVluSTNyK0VFUzhQY0ZhajRiU2RwazVJMXRGK2tSVExjakMwdldrQkgw?=
 =?utf-8?B?clBMZjFWVkwybndGUHgyc2RxajZEUElPbDBQSmM0RDNjOHZEUjlZV3VJWEVN?=
 =?utf-8?B?Ti8rcnZ5Rng5ejJhVGhqa1FoNDhLL0lKdEVWMDZQL2ttSE5QK01uemdHMHFE?=
 =?utf-8?B?eXRHMjlsWjhzZS83Y2JQWGtPL2dlcmYyaVVtKzduL25teVpjUDJUUjhkN3Bv?=
 =?utf-8?B?SXV1OCsrbTBZY2NRbkI1cHF2V3FEZWRqZFdvVmlxTXZZWVAzTFJZcFYrajNa?=
 =?utf-8?B?YUhneUdRWlBnUzA0VlZGQVR4dVRINDlHNERkWFJUN3VCTXdFZU96VXB3cTg2?=
 =?utf-8?B?TE9zWVM1RGpYZGhmMG05SitGZDJvenpXeXIrcGxoQkpMWGlHZUxEMTRmU2Fn?=
 =?utf-8?B?T0d4TS9yamNjRE9mbS8weHBOQXdvaG80elorVkh1TzFSWUkyZHZLUWFlaXNT?=
 =?utf-8?B?OTVibTg2K1lZVFNNcjNDNW9OLy9YWUFKMWs4TlJjUVNMdmFsUDNRYytRekFI?=
 =?utf-8?B?SllrcldQaEw3ZXlsZFlaenVkcTM4d1JEalRKY0JBVHZMQmltVG9BZCtqN2tp?=
 =?utf-8?B?NFdZT3M1RWdObWJhV3UzcDA1RGE3ajNqUnRYNXJLWDU2Yzl4b1F6NTNoQ3ZO?=
 =?utf-8?B?aGFpdVlWUkoxeGxkK2NNa1ZLMzJ2WjVrTWpYcDAwd2ZCcXlTZ3d4V2szaHpC?=
 =?utf-8?B?UlIvZnpGczFIb2tQZ2R5dllsekNwQ3pEV1UrRjBkdXZ0Rm9oMzJ6a0lWUVNP?=
 =?utf-8?B?S0RaVUI3aGRwV1VYVnF6eHJ1eVdjZW8xUFc4L0xMQnYvYVlmOHdINCs2U1pm?=
 =?utf-8?B?MWhBTGZLZVBKMUFYUUNJdXkxUWppeHVTWnczYW0xSGx3di9BdEVZMU9ib3o3?=
 =?utf-8?B?WmxhZGR5YjU4NU00YjkvQW1RdHJxZUNOeXVKRjRsT3JsNlhvQ3F3clVqdmRl?=
 =?utf-8?B?RUs3clFzWC8wT3VqSmR2WFZwTnVTb1pQTWtwUHRoMGdWZ3crMjN5VXAyanNn?=
 =?utf-8?B?dDYyUHMzTkx6K2NlRjdpYWJ3MndTUStaQlUvcWpXT2NYdWZpRjJtem15WHFy?=
 =?utf-8?B?ZDF2ckY4eTdDbnVGKysxYWFTSER6TklwZG1PaG5saVNMSGw2MkM3dUhIN0xT?=
 =?utf-8?B?aGc0NUNodHBlQUdtUk8yQTUzWnVRUkxDUGlqd2VvN2Rlemo4UkxhbDJZbWdQ?=
 =?utf-8?B?UExYVUkzTC9ybDRSKytsMzBDZUs3YU1KR2VHS0FyWGk1UWRKOGVxRWwrNklY?=
 =?utf-8?B?dS8wOEhHdlNZU1ZOWDRRYTRpcmhHN0FhU09MdUlKM0VGQ0xyeVZMYTYvRjc2?=
 =?utf-8?B?TlNaamsra1hRZG53WnRvTmRyU25RRm0wbDlHcHBRMkprY2VvbzFyUlorS2hO?=
 =?utf-8?B?emplUzQrRDRMMjlyRndleGdYSVNlTmZWdzBHWkRBRTlZTjM0SytOV0RVS0Y2?=
 =?utf-8?B?T3c2TmMvWnpTQnY0WWNxNkgybGEwaXVhOVZrNmNEZG5SZ2lhWEswczBzSlhH?=
 =?utf-8?B?bWpsc2lxV0tnSTAxc3QzYnRWZXRLYUwyMkowS016cnVYMW9BSjNDcDJkSDEy?=
 =?utf-8?B?R2RzMWU2OGhLaDQyV2ZPblFyamsvUVFWYVFra0VDZHU3Vk1PYkd5SU5sNlZy?=
 =?utf-8?B?WlNRZ09CK3QxNXkxTDcyUjdIS1JqWkFkZjdhM21kdE1QTU9nbDhVVHdIVUFj?=
 =?utf-8?B?MFlIUnVVRmtSZkIwcEw2ZjluVlNZcEFZdEF6NzJnMGxWbFFCTHQ0VEVLNUlN?=
 =?utf-8?B?OGZ4dk8wSG8rUkdTcmpna21STkRrQnl2endONGRJOHhzTC95TW90SkhYTnZo?=
 =?utf-8?B?OHJmSmlyOFZYVmFyOEp6M3BRTEZieGlocFFXVkNpZWZwQ0ZKQ3pWMCtZWm9S?=
 =?utf-8?B?a24xU3NqTmtRUGtXdGNBTnN3YmF3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b83529-b11d-4f83-078e-08dc65e25e44
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 11:16:49.9575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1cVwidCj4Z9spPNRZs3G4g8MEsilFjYgG2Yc9BCQ9Lotmu4zwz4iUU7H1Gs16EtVqZbhsjh+7iQcotMlYnRzcT6DJfADvkENeZyWyW57QU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7136
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

On 26.04.2024 11:01, Zbigniew Kempczyński wrote:
> Add function which is similar to already existing blt supports_tiling()
> but returns tiling/compression capabilities of render engine.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> ---
>   lib/intel_blt.c | 29 +++++++++++++++++++++++++++++
>   lib/intel_blt.h |  1 +
>   2 files changed, 30 insertions(+)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 946adc538b..a8433387d2 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -495,6 +495,35 @@ bool blt_uses_extended_block_copy(int fd)
>   	return blt_cmd_has_property(cmds_info, XY_BLOCK_COPY, BLT_CMD_EXTENDED);
>   }
>   
> +/**
> + * render_supports_tiling
> + * @fd: drm fd
> + * @tiling: tiling format
> + * @compression: check tiling which will be compressed
> + *
> + * Check if render provided by @fd device supports @tiling format wrt
> + * @compression
> + *
> + * Returns:
> + * true if it does, false otherwise.
> + */
> +bool render_supports_tiling(int fd, enum blt_tiling_type tiling, bool compression)
> +{
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
> +
> +	igt_assert(cmds_info);
> +
> +	if (!cmds_info->render_tilings) {
> +		igt_warn("Render tilings are not defined\n");
> +		return false;
> +	}
> +
> +	if (!compression)
> +		return cmds_info->render_tilings->supported_tiling & BIT(tiling);
> +
> +	return cmds_info->render_tilings->supported_compressed_tiling & BIT(tiling);
> +}
> +
>   /**
>    * blt_tiling_name:
>    * @tiling: tiling id
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 6daf46aea4..edf75c0887 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -211,6 +211,7 @@ bool blt_xy_src_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
>   bool blt_block_copy_supports_compression(int fd);
>   bool blt_platform_has_flat_ccs_enabled(int fd);
>   bool blt_uses_extended_block_copy(int fd);
> +bool render_supports_tiling(int fd, enum blt_tiling_type tiling, bool compression);
>   
>   const char *blt_tiling_name(enum blt_tiling_type tiling);
>   int blt_tile_to_i915_tile(enum blt_tiling_type tiling);
