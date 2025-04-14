Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DC8C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 22:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BDB10E00A;
	Mon, 14 Apr 2025 22:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKvZJlFB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6DC10E00A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 22:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744670461; x=1776206461;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W0mAnHSj3xVWzEwdtlJpR+aotvohWOC0K/Hu0cFzVN4=;
 b=VKvZJlFBwutgn3KXhz5co2xlTCnAF7nnk4aszcb55jrQf2NxckBv4p7S
 YuuDeju5cpr5NtMF1qrKnWEP7wSkq2UiCOTGJxeKnMVtg3OS/63QpvCEY
 eyiiuv6IsdKDu8hbl+mgBlXIw1oKYfwuYhtytkpTItl7Zhr6ZtM9oAzDJ
 goYSVetPkUNJdP8kYYlxKTP4GrdoGb36mdQXZpHbMU/F6i+hOc/Yb8Mnh
 SLBfiuSVMTnzhU4xAFyX0IRceDqUXXXSIx1kB7CLo+qXFMABupQ18jonM
 wlU55vhnQawjdtnWCZe1brmy8GYPGycAZtyzETexPsgW+jjBNB2kXGlFR g==;
X-CSE-ConnectionGUID: GzaFUNfWR4C12mTgUexEhw==
X-CSE-MsgGUID: WyxtL9N3QoaE3EE5Lvx7BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57542240"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="57542240"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 15:41:00 -0700
X-CSE-ConnectionGUID: YHXLSRjRQ02QPepRE4Apug==
X-CSE-MsgGUID: jdn7c6CBTY+A0i3cTmSqLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="153124281"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 15:41:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 15:41:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 15:41:00 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 15:40:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMmYXxueH5NoTSLMuEYXjJS+BgH+LcgetTqLdP7IaZXOUZmQIsuDDyn9v8tu5imTcQ/YkF1e+an/Alz5kcPs3m/cbyRjGhcisCUt51NTnptwt8S8iY4FkjZt8mDpgV+73DVKCGOgK+J8JxZzyYHus5P6Ly4xK5nvoAhwtRe/8uuYJ3paTS4Xdxo1JuJtlytUTXOd6NcPmtW1FC5TyH8GnCowlaIAdTBMjGxNkjPIJ9Hk1cQGX8YF8EL/AT38byIr0WzoNwOUAszFfx6xtTTtAkkkpyaun3J1Jy163XZwsPC5qnLy3zKau70RTdanZm1fuBnXMfnB7iKg1OPFHo/SRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCREavHjckyjC9t2VKm6qUUkx4AqOJvSJngZAFrc6QM=;
 b=DmFTXM26oHZJMWXp5mD0nJTNhx/oAwQ+i/5vG6W7jw5EA30QNFYnzt1Fm/yQ4PAzlOv08KoLVIKkO195iZtTsZxAuW6SCSAxjnnOnRI57N3XYIGkd4G/kwBg+YAwcXOqAY/GiPcaNIZ80JUKww09WyNbbsZmrDb381AY9dMVdxJuG+X2M/bYl8brf30Eunpyhwt3vD85XJbqM29SnOJSEpUVLWNMCrpP55hhmnVzntiQuixB6WFKcsCuzW/QIKyrX3LWU1gKJnXajAQmPPGNv6BQ3WHE9iokQti2Yyn8RzOWM3/P9ygwCFWASR+jpoAFOTHP42GTLQkZ1hf4EYsxpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB8249.namprd11.prod.outlook.com (2603:10b6:510:1a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.46; Mon, 14 Apr
 2025 22:40:41 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 22:40:41 +0000
Date: Mon, 14 Apr 2025 15:40:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 5/6] tests/intel/xe_oa: Reduce test_non_zero_reason
 execution time
Message-ID: <Z_2O5_Z6uHJLR-67@unerlige-desk.amr.corp.intel.com>
References: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
 <20250408181210.1052760-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250408181210.1052760-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0349.namprd04.prod.outlook.com
 (2603:10b6:303:8a::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: d1dafda2-606a-4875-6b06-08dd7ba56281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2l1bnVFVVlwVEFMOG4rVmhaZDNKYmRNTmtnd2VGMU9yRTlYajVxS1RhdFI5?=
 =?utf-8?B?QzFOSDJJdlZRTjc0aEl5OFdrR3BYd2dKdy9NeXR5bHQ1eVd5RUpESlU5UFI3?=
 =?utf-8?B?bGZvRm10UkJ1TWhVTHIvVzBvUG04S3dUR0dGK2FtSWNtamNmcTh5MXByT0l5?=
 =?utf-8?B?ZmtMUHFxc3NxaFZ6ZDZBV1NhL05UbDRyMSszRi90SnY3Q0RaQmx0ZWZzY2RI?=
 =?utf-8?B?OWdTVkdkL2tLRm8rbWJISy9YWmNiVEJUYTY5SVJjV01JL0hNNVJkc3RQVFhO?=
 =?utf-8?B?bHZ5OWpYT0gzbm1DWkxEVlEwdmZtUHl0VElqWHZ6bWVPNmswVkJwbUdGMmx4?=
 =?utf-8?B?RjdDS0ZCVzVINXg1RXVRYTAxaVo5VnprclpGdnN4WkxoOHpRVjJOV0xqWElF?=
 =?utf-8?B?MmpSUERnMDc4eEFoVW9RNmdBWG1sVTdqT3RsWlpvQVRwNmw5VTMzSHVaM0hn?=
 =?utf-8?B?Qms3d0hEK0M2VFNOMlRTeVZmZWVDRVIrUjdyZ1NXUjZWbytYMGNqdndZbnRO?=
 =?utf-8?B?UUhSbGV4eUdhb09UNTc2WTRBN3BWNlRiNVgzSDdiTHp1R1V4cG9KWHVSLzJN?=
 =?utf-8?B?MjEzM3VDdFJScHVEQWlPZXhrWmg1d0oxbHZtcHp3K0h5elBXRFovelp0S2t6?=
 =?utf-8?B?UWxTeDBmalk5aDJ0b0d4ckNMcGZ2WWZEbExuYnRycE91UWdZTDVzM21aRG5m?=
 =?utf-8?B?WllVRjdraDV6dUJ1NllBN0tIaXhFbUVGUmVGUWJ5d25XR3RCK3I2QnBYY1dH?=
 =?utf-8?B?OGZyTEh4Wmd3cnZrem1RdldlVFh3WjlwSlNtUDBYQUFSV2YrelJRRWdIVHd0?=
 =?utf-8?B?OWtPOHFFVnhZamZqakd0bWhNM00yRGdCQW1yeGxjSTY5aTBnKzBBWTZBd2NT?=
 =?utf-8?B?emcyZlo1VjBjV1QzR0N5T1RWRmJBY2xnejJXeWVNN29uMmFBaWdaVmJXOEVw?=
 =?utf-8?B?eURoSy9OZXRlcHc1bjcwRGVha0lhY1kxK0tzaUUrNlgrRE5yMkFHaUJySWpu?=
 =?utf-8?B?anRBUmtpQmt0elpmN2FLOG5GY0VJUk5mWDlTOEdTQmR5dE9KYjNTNm1pcG5p?=
 =?utf-8?B?QzBJeU9KN3NuZnVpS1luYjJCZGUvbU94OU5TaXF0K29FRytHSXF0enRtOWhp?=
 =?utf-8?B?NXVjcnlteG1zVUxvaWVXeXE2dnZFdldOSk9CS2NPTkEybThXQjdRZ0ppZ04v?=
 =?utf-8?B?b0hjd2NDSnRoRE1aNVFYOFhpY0ZxeGJRc1FMR2NHdUpJK2JsYzJNR0tYMlJi?=
 =?utf-8?B?ejduSlBIUlJHWXNzZ0FPQStuMlNQSVljdkNzZUZlVW1BL1Z3SVIzc3cyalhj?=
 =?utf-8?B?Q1UzNDFERkNnZ3FoU0JQOGY5ZEpaazR0K3RnT3dmNVNaWVZkN3g4dTNnR3Rw?=
 =?utf-8?B?MmNSMHJ5aXFZeHRiK1BGMS96NUo1VzdHOEZGK2M2VVJYczBpZFFlZVZuSUxv?=
 =?utf-8?B?N0ZtTWV6NHVpNGxUZUlVUWYyc09ORVkxSXN1Z2Z5UHdUM01PUHphcGVBQkVN?=
 =?utf-8?B?RklMbCtRcHR4eHg2NEl1RUZhZWpPSTJXWTRuajRJZnIzYmFjaGNmRkRtOFFE?=
 =?utf-8?B?WE9Nb1VJeVJSVVBzQXo4M01JRERCcXJwZ1doNWlLSWVVRjYrdXRFbEFieFFP?=
 =?utf-8?B?amxLdGtlZ0xDcFIxZEhURmp1UUc0T2xKV3p5Ni9SdEFjbUxxM0dBZ3EyQ2E1?=
 =?utf-8?B?bE96RVZqKzRDdkJRTVFVdlBobzBCS1YzM09OSUVLVUNFNmhwUkRpYXJNaVFD?=
 =?utf-8?B?cmFNVW9XcGRLdVJGZ1NWMlliUXdZR1dqL28zcmRsbnk3cklITWh1THlWbEpq?=
 =?utf-8?B?d1FaVmV6L1hmT1RiTng4VXFiZ3d0SkxGQVFCZ0k4Mk9mQVk2QlgxWGQ1SkRE?=
 =?utf-8?B?cko3YzRJc1JPdmZicGhDcGJRK3U5QzJqb3lDUmdCb2NyQ1lrNDNKMUZDL2o1?=
 =?utf-8?Q?UIDFcHbOcHA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXRjWWJkRGJBSjRiU2x0R1dVNVJzUG9ZZm5MdGhKRURDd2YzUmZWbUhWSHp0?=
 =?utf-8?B?RUZWLzQyRGFiVDdCcFA1SXZJa1JHR3BNUVkveG5EQ3V5KzFHTS9QaXZxQVcv?=
 =?utf-8?B?ZjFja3RtakdYdzdMOFR3cWZMd0I0d1JSVWJJMkdwSTVSWTJCR01EYjdtYnNa?=
 =?utf-8?B?b0Q1bW1MSWRYTG9TWlBSYVVHdmlPVXBwclRDNnRkWnVBZHJBMWRuY2Rsa2pF?=
 =?utf-8?B?djQzMXpOWUx5V2JKWCtzY0trWG01c2tJVU55alEyV09XYkZNeVNWeXdXTUMv?=
 =?utf-8?B?R0tvcEx5K0MrR3ZhSkhNZ0pBNTQ5UitjajRHdXdOdDV4Y0dkQld1WEd5ZFJG?=
 =?utf-8?B?YU9Dc01TcC9hMVhod1RsRExPVkNmSU5OYjZiUkhBakNZY1ozSXc5K0I5RTRE?=
 =?utf-8?B?SmdhTk9GSmJWNjBqbE8wQmZ6ellxeTAvQUJ6WVVjZlJWRmZCZ1N1c2Uzd05H?=
 =?utf-8?B?dmN0eGd4V0tUYnN5YzNsR3NrbmJReUo3MjIwL2pOZE9PN3lnaitIVXVZM2VD?=
 =?utf-8?B?eDAzRy9QaU9mNU5yYkdES3dHdGx1TFNYUnpPcTBKM0JuRHZGOFpGTXp4UFZi?=
 =?utf-8?B?M2ZaSU0xYXVudzlRRm5TcUJsVkJjeWt1aERTZy9sU0dpbTJ5cEdBL2hsa3hT?=
 =?utf-8?B?ekR0WFdDNEZ4WWNhc2lhc1Z2TTFGcFVYMGM1RCtyU2wyaDAzS1F3WjNjMjFH?=
 =?utf-8?B?VS9DdldKQ1pVZi9IeHQxd1VHUXEyMEJJVmJWTGlZRDJOY0UxOVd0aytLN3Ru?=
 =?utf-8?B?bnNQQ1dkMUtKbVB1Wk14ZkhJU3RoTVFyZmtnWU54K2hSTVpKdVZRS0xSTnJG?=
 =?utf-8?B?aU5zKzJPWXh6UjZGRThUQnVCOXpZMjA0Tk9YR2RCSXcxYzA0Tm5RQmtQbEg5?=
 =?utf-8?B?Zm5oYlVoVWNQOWFXSDBNR1FoYjlobm5UV1NlblFDZGlwS2J1WmtIYlFoM0Rt?=
 =?utf-8?B?SlVCK20zTnpXRm96a2NqODJvT3kweHoxUitFSlBMSk9WWWg3L1JGNVM0UkVm?=
 =?utf-8?B?UGNEbUFQVFNvVzU5aDVaZDJUQ2YraFBjc3lQb0tGL0VacWREdWpudk5LT2JK?=
 =?utf-8?B?ajNmMStqQ0dueEl3ZlE2aEJrUURiU0ZFTWVtdXQ1d29xRXh4VmFNeTc4UUVO?=
 =?utf-8?B?QXdTTE9CV3BudlhZb0lWclJ4dERkRjM1UE1MeWllaHlrT2VRMEx6SW1FUW04?=
 =?utf-8?B?UThESm5HRVU0aWNXa0t1djdiUUI1bTY5a3FuaUl2ZnpKOXh0MGNVRzJtUncv?=
 =?utf-8?B?MU9raVhNNGdtM0pXemF2MUVIcnNCaW40NWQxZmF2TmFWa2ErSEJrRFhwUXk0?=
 =?utf-8?B?MGJLZmtkb29ld1cwQ0NKUS82UEZoRlgweXBqeHB2cGRRang0ZU5PUkVyRWhh?=
 =?utf-8?B?b2JQNnJFN1ZxWGJqT0V4UmRxRFQ5bVdFcXdPMFR6alJNWW9nVFFGUGRhT28v?=
 =?utf-8?B?V2UvVnJKRSt1TG1DVWdBNWxLSVZpakIybHpYaUNjZ3VjbUZ6NVRxajlMREJR?=
 =?utf-8?B?MzhwOUhYbmJHZlVReWhleXNKQWsxd2VxTmRjQjJHc2FudGtGMjhhbk1IZlZ3?=
 =?utf-8?B?SHY0SFd3dzRKSlJEQk8yZ1dZZGNNUHcvQ0VkYXNSTjdCVG56RWNjNmlJd0Zr?=
 =?utf-8?B?UWJxcXhpM1ZyamRPRVhQRnZ3bmQ1RVRONTRnZThoUDBuREtVejVMV0FsVmdK?=
 =?utf-8?B?YUdJYTJRTGkrT1pPZk8zbnpDZ3BoL2xYc1g2NHV2KzlEMk1sa2c5eVI3SDRw?=
 =?utf-8?B?NGxqREtNb2ZoTHE5dE9FSzRmQU1IRndTZnVsM1Btc2dLVnVNajcwUGJTcXdH?=
 =?utf-8?B?ck1iaCtmb2xtdEdHWWZXMTBidGV5bkl4R0NvSEJ5ekxKN01sZTdGQmF1VHZV?=
 =?utf-8?B?eDVhRFB5ajRmR2Q1RkMvWktyWkN1N2thZEFvNGdMRjNDRlZLak43dU9WcHMx?=
 =?utf-8?B?SWxrakl4YjR0OGZDR1N2MTdCbVpYVDRhbk9iaE83MEVPMHI2ZFRMSGw0cFVz?=
 =?utf-8?B?UW9TUHFCODI1dWxtZjhOMHdtZ0I0YlFyZ0dUb2RSazlLZStiV29XYkcyMERG?=
 =?utf-8?B?NnRpWVZWczFYYW4zd1VaRVpIdjZGQ0tFSEpVR2RtWUdlczlZa25Lb0UxeXZI?=
 =?utf-8?B?TXkvcDFJU2hYcGsrT0xmK2VBRmkxMldzS1hzaXlmbllYVmN0VC9ybG51R051?=
 =?utf-8?Q?qA97eM1UYB8SIQmgzcapSGM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1dafda2-606a-4875-6b06-08dd7ba56281
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 22:40:41.1340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4Z0sA2DKABGLuqCzq2SmAJhrE8hK9o2WEkAxpswMdtQcL3Sfglb9hR1Xyi4e+wyICR0GXF6B90QyXD01Jt8AilHOjsYqjjsnQODWYuTC8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8249
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

On Tue, Apr 08, 2025 at 11:12:09AM -0700, Ashutosh Dixit wrote:
>Only check every 128th report to reduce test execution time. Without this

Since you have already read the entire buffer into memory, you could 
just check 2 reports at random location. I am thinking random would be 
better than fixed intervals to catch strange issues.

Regards,
Umesh

>patch execution times for buffer-size subtest for OA buffer sizes > 16
>M (with PEC report sanity checks) are excessive. E.g. for 128 MB size:
>
>	Starting subtest: buffer-size
>	Starting dynamic subtest: ccs-0-128M
>	Dynamic subtest ccs-0-128M: SUCCESS (133.654s)
>	Subtest buffer-size: SUCCESS (133.654s)
>
>With this patch:
>
>	Starting subtest: buffer-size
>	Starting dynamic subtest: ccs-0-128M
>	Dynamic subtest ccs-0-128M: SUCCESS (11.209s)
>	Subtest buffer-size: SUCCESS (11.209s)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> tests/intel/xe_oa.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index cc9702322d..f3ce37ff5a 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -2646,13 +2646,14 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
> 	igt_debug("Got %u bytes\n", total_len);
>
> 	last_report = NULL;
>-	for (uint32_t offset = 0; offset < total_len; offset += report_size) {
>+	for (uint32_t offset = 0, n = 0; offset < total_len; offset += report_size) {
> 		const uint32_t *report = (void *) (buf + offset);
> 		uint32_t reason = (report[0] >> OAREPORT_REASON_SHIFT) & OAREPORT_REASON_MASK;
>
> 		igt_assert_neq(reason, 0);
>
>-		if (last_report) {
>+		/* Only check every 128th report to reduce test execution time */
>+		if (last_report && !(n++ % 128)) {
> 			sanity_check_reports(last_report, report, fmt);
> 			pec_sanity_check_reports(last_report, report, metric_set(hwe));
> 		}
>-- 
>2.48.1
>
