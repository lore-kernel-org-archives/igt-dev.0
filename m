Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349FAC83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 07:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F8210E769;
	Wed, 23 Jul 2025 07:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lewexvwc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B11510E769
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 07:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753256543; x=1784792543;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BJQlcw1CnfQi71usqpm1WBQhNG1N/pMSjaugSbMMe+A=;
 b=lewexvwcP2ZBTiGqVcwOhlV9u80ymdYr7CQw5mV10QOGWFvDmSmtLk7K
 fwuEuacEwP5H9dxNp4qhS4KjkpMQNOTKjruQdBgl4jVxwg0h8NOs/s8y7
 Fse3K+L81JXfjvR+YtIj+dPLNWC/yHZShpb7tJfmz/VzjZ2RJL61T/ww0
 sDZgmLaiwE2byaaW39izr5L+WX5bFoaO3sD1O2fPifnlBNP+/he6j44OD
 arNWYVG3rxPf0k0hETz87KSDCx5B43XIUyyImhueyM4oZONMpzCwvUYkU
 qid++Dk7yor3w04u2XMmwQ0d3Za6epmhPYwBZB+Qy1S2GsLphLpW5c1y5 w==;
X-CSE-ConnectionGUID: wyeeuk/8TT+Y3rI/mGxJwA==
X-CSE-MsgGUID: Hh++si86TruM8Rqx17UeNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66217074"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="66217074"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 00:42:22 -0700
X-CSE-ConnectionGUID: FSmyVHinTYO8eNhWptZzUw==
X-CSE-MsgGUID: gAjc7EbUQpSe0LEw36j+qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159669774"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 00:42:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 00:42:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 00:42:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 00:42:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLjPSJThOY1jQQrMJQy1aQ2bRcpkO4+8l5a3SZJYbAMFBUbDzX+RJ0k9z3z+pkqeGrv8LPF4Pn2kWScm2ZUkWYkhRRfrfvmGD3sKg0qp3zwa6J6OgrzlMaWmwzdeA/jOl+ZvMR6ImFovtt/WMaygH/URh9PwvdJi2iHwRvYFoaGL1AW5MR+nEMM2/Wlsje6bvy7EdAnsdEiTDsPMH2cXo+UFiG0tKvMMmqISP2Ump+VaA4gjrrLsB4kZIdPOqQZi/N73MpGOCypmLb8Gb6y8P9ubQrjkkQNp/A8x2d9otZ4D0Z7t4srd4p+/8pC6l2pIY6eODJfCl6qWV819Gu4SAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GvBkVJbmq0m9ykRn3ARiGTtJ6xBkEZuJPVcS4Xb7RQ=;
 b=hceFePKUR9DefKo0KWufZPxMT00bj4WlpQVMpQcsGPTkVK9qsNM8gi5OtjkRYlZjsIvKyOvbHY2mEjozJyZHpacms58iQjuqZmT9RwNE/9x7o7lxknR4p9SuprI6bblo5UxYdHLmxq2TAvBgl1CTh6nlk5u7IQBa4JY4te31lL3K5CV+f46OhicLgAYAVyi/QKjDw18h1MmqSeagqJsV4FghUEkSIoHnX7sM3k/gRwUGZckiJnn1ApEU2UtuYFR8Rtmx2Q5sK8fF3OHVr3x6cvHWaF1xCyHFBaInjZCSU2gcb52Sx01vT3oTxMcCQmVz+XDakoliWR9PxEgpHh34ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SJ5PPFC0624F2CA.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::850)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Wed, 23 Jul
 2025 07:42:15 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%3]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 07:42:15 +0000
Message-ID: <1e792bfc-7242-41bd-aba6-1b5f5e8105f2@intel.com>
Date: Wed, 23 Jul 2025 13:12:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_joiner: Update ultra joiner
 supported platforms
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20250703062655.894129-1-karthik.b.s@intel.com>
 <6b0b8107-d99b-4208-b184-8e215d5177d8@intel.com>
 <82ef0c0d-493a-48bf-b823-3eaf1709037f@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <82ef0c0d-493a-48bf-b823-3eaf1709037f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::17) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SJ5PPFC0624F2CA:EE_
X-MS-Office365-Filtering-Correlation-Id: 65ebe037-5987-434a-8836-08ddc9bc716c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1cyUzBPRGpwNGVkSkFIc0s2ZngwQVErSzN6VGZmSEdvcU9HcjNDbUFRNGsr?=
 =?utf-8?B?NFhLL3E0MTJrdnNTWlAzMWNpekpNdWZTQlVTYm15OS80QTZrSEwxRmR1ZTN3?=
 =?utf-8?B?L01LWEl1eFVaZzlZdTU2SWFYM1dmUjd1RmFnbG13N1RjeWFuOEQ0ZGxyYXlU?=
 =?utf-8?B?VTZOcHlhZnFkRHdteTlLRlJXZWlyZFJ0N09JRlNNZHprN1BlbFNFUS9aOHNn?=
 =?utf-8?B?Q1ZlbWROSEp2WjMvVnliVlhuYzZMaG1rTDRmWVoraEh4YnhpMUJQVXNmdTQy?=
 =?utf-8?B?VzdPZkZqc0tueGYvMzNZcFBMQ2dYMVlsaExqakRzQXVKQ3lYM3FZM3hkaXVB?=
 =?utf-8?B?dXNrTWoxaWZibHo3NWN0Q1J2SUZoRkVTUDV3cTlneEUvM21yQkxnbXlPcFlh?=
 =?utf-8?B?RjlYRjZaTlFRWTd6NHJnU29GdStqcndYa0M5Q1ZRL3JLTEQrWlJCOGh3bXFF?=
 =?utf-8?B?Yk1RQjBmV005cDRUalFOSlFYQmNsbE12VVYxbFE3MW1qdzNDUmtPMU83SGU5?=
 =?utf-8?B?SEZzUjBPdkZPallidlFLZXdrNlJHK1h2b3BvYzdDUCs2R2xhMGpTN25zU1dh?=
 =?utf-8?B?YUx1SjNWZDh1alJGK296Q3NlV3Y3WGNqd3FmMzYvRURPcktKYUh6RWhCNnJM?=
 =?utf-8?B?V0E1ZGw1cm14d1BUbElZUnFBM1FxZUo3blVtaHA0TUlhcjZzaTdGOENSM05Q?=
 =?utf-8?B?YXpNTzRSczVHOXFrT2hUUml2U0E2WEJxSE0wRmxtS2RaRnE5QUVUUWF3b0ly?=
 =?utf-8?B?UXVQVVFsSUQ5b20xVWU1OUtoOWdOQmJKSkwrMXJZR3Nib09ORHluVkVlSTN4?=
 =?utf-8?B?WGZ1czRsbEdpL1A5RUUyNEt6cHpsR3BsRjBiTnh0eTg4WFhlby95Uit0UTd4?=
 =?utf-8?B?cVlpZ2dONkxUNFIzWlVZcXN1SlJLNjQ0Z1Frck1HcXIyeTV6M0toUklqNTcv?=
 =?utf-8?B?OEZJYi9IMXE2Sm54RFRNbXVlYXByTFV2WEt1Mnp4S21qSG1Mbm1HRlptWFdO?=
 =?utf-8?B?QmptKzZSSnhNM2FDZWVVZUFTakF2dE9XUFp5Unkxbzl4blBMWlhLRzhDb0Zr?=
 =?utf-8?B?cDNKcGE2d2ZiQkNSYThCdTExVm5vQ0RoTjVIZisyUjVZMkFvRzRra2R4aVJk?=
 =?utf-8?B?V0lNTmpSUlBPZE5rMkJIUnpydUNyTEdSSEwzdThoVG0rZm1tMzYwRWVtZVZE?=
 =?utf-8?B?c2Z4eWwzaGgvajJ1TEZGdlRKMXBweVhFekpGTE9tY0l4Q2hSdU5ERlNDbjdH?=
 =?utf-8?B?Q0NFZTQxNExWUFZkYVg5OXE4cFhEYjVuQnh6SDUzNFFDSU5PRVZyMWRvNkVs?=
 =?utf-8?B?L3cyaWI0L29vQXJuRWlHRUdQclVCbXBpSG5KZFlGNkdzREc0RWwxc0d4Lzl1?=
 =?utf-8?B?aXY1eldNWWI5RFZtNU5nQmxTY2xudTRweWFGUU9BQlhiSktidU5ZbkcraUN0?=
 =?utf-8?B?NmQzRFRqZ3YzeUVLWklFd3lJVmNwU3dNdmNjV1BwdE80amN0YUJLS3JBTFZl?=
 =?utf-8?B?Vk5heXJMSFNDaGEvbUd1MFd0b2kxaUdUbDhERU4yK1JreCtkZWpuMytweXYr?=
 =?utf-8?B?QlJsTXRtTlZZL0FtbDQ0NFQ5QW1jZWlNc2Q1RUNyV2xUQ2hYNk15MDJBZ1lN?=
 =?utf-8?B?ZDFCQWJ4RXhHRjB1eXhBVVFzelFGZXA5Y2FXOGFkRy9Md0RiTE5hd3JXdTdH?=
 =?utf-8?B?QUxzYWMyMGMydURJS1RCd1pHQUM5TWZ5L0kwaUlPaG9INlEyeW10L2YxOEky?=
 =?utf-8?B?cUdyU004SzV6L1VPMVJCV1VPb2xyY0lXeW9YU0YzY0hYRFZLS2dqTVRUcmEv?=
 =?utf-8?B?RnptUHowUXVnaDMvdE83OUd2RkRXUC9HR3MzMy9aNXBCMmtuQk1pUkN6cFg4?=
 =?utf-8?B?ZGZsOHIwSFpPZThSMGRjOWNuRWYwSUxleGhWWDZwNHdpcVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlBpR0tVamlody9xS0k3cU9qU0J0SFlsUW1teDlxZkJ1L3F4L0F0MG5IbGJ4?=
 =?utf-8?B?VGIzYXZTNTBBUEhjSWtBeTJ0YXBwOXcxbHZpR3E1cnRZS2t2eUhIaWNSUXhn?=
 =?utf-8?B?a2tyKzNtTjNpTDBNR1hDT2dUZDU2VTNKbi9LOVBFcm5ZL2o5L1R3d28vbTAr?=
 =?utf-8?B?MzBxd25xUTNBUzZnZlE3bUc0UjhHWVBRQTM3aThwSEdDWGpyZjVYL05aNWZ0?=
 =?utf-8?B?NzkwTmF1R25Bb1lNU2NuNVZZUm14NVlxVy9VaUc3bXFYV1p3bWI0aERZSkF4?=
 =?utf-8?B?UGRrMVJBMkhyRElidEJtN3plaXhNRTQ2bkxERUNZdmdZVnRpQlh0N2JpRzNo?=
 =?utf-8?B?dmpReE1UTkRPanF6UUl0K3Q4UjRHZ0t6eThCdE9zR1FqMjZIb2wxTmJkQzQ0?=
 =?utf-8?B?Z3ZldG1RaG1PU2dUK1ZsY2swL1k0Q3Vwb0c4bHBIblFtaW1KUkNGZSsxZ04r?=
 =?utf-8?B?T2xndExRQjdMY3BKYjJvRTdDYytmTU9reWZQam00SVlhWFlkN1RoT2FmN1I4?=
 =?utf-8?B?eENGUi9PZHlScFhXTlg2SmZUREhCZEd1clVvVXJrdVhwcEwrY1ovQUg0MDRU?=
 =?utf-8?B?R0pjTVRiN2RWNndiUlNVQm1iOTdZU0tHTnYvQmVLdDNOK3F1L0I0U0NTUHBy?=
 =?utf-8?B?ODFwUTNubDRjenkyNk5iaHZ4RFNwYzRFYTkwOG5NdzZFS2IzczRuQy9ZYzBk?=
 =?utf-8?B?L1FLUmRSM09FWSt1blpQOGxyQlFDMnlLZG82a3Zsa2VwcStPTWZuWlpvMHRT?=
 =?utf-8?B?aThmK3VybDNxbUR2dXduYTVIaTYwcTArK0V0THc3NlI1em5mSEdqU1plTnJJ?=
 =?utf-8?B?NEg0WlNBNlY5SitQRGZPWFBtcEx1RDlMOW0zYk9nWjV6VXI3aWMzOTRhZEtQ?=
 =?utf-8?B?ZG1WVTZ5ZDdiWWY2aFpIbktDbE5XTzF3VVlFWWhHcVh1VWFwU3NQc3hXS2I5?=
 =?utf-8?B?ZU1TdU5QcW02Z0MzMk9McGtTVG1VNVBpaXFHdG5jUWtYNkJvM2dYRXRUdGx0?=
 =?utf-8?B?ZUJlWVFMczVWc3FPQXI3V1EvZVhibkx3RDNSOEY5ZGlObzNTLzFHWklTbW1u?=
 =?utf-8?B?bDJzR3RyS1R5TncyMVFYR0RySkhoa0laeDZrS1dvUnBncXowSDdrbGZiU3hv?=
 =?utf-8?B?T1JOVy94UGYzcWZHUTVseWNmbjljcTZsT21lYUJWNzZXcG51UVdlWDdTT1VJ?=
 =?utf-8?B?a1FSSUV0TGVoY0IwSDZ6Yk5FWUtiUUxYT1V1ZW5ZcmF5amgyRGk4MTA5T2tT?=
 =?utf-8?B?QXNHOHk1RHdmdk9NYVFnZGZGeDJVNDVFTzR2U0p5NzBzVkJNRW5lcERwbEQv?=
 =?utf-8?B?QXAzT1RSK2ovcGt1TzRmZEQvQVhScmRsVFdsWitHYm5Tenphek9TSU43eGdJ?=
 =?utf-8?B?ZjFWbzFXdi9RaFBTTFlXY3BtQlorZzhaekNVRDcvMFlhbm5PYTdCT3l2YXlB?=
 =?utf-8?B?bVB4SUhqQmlMdk5URHZuakZWQTN2a010OU1iYjBsQkxXbTdqK2dQSUFuVHR3?=
 =?utf-8?B?SXlNdWV4U1dQaHhUNmVxNkdaMEZmNFg0TFRObmdqRTFxZDkyMzZyYTA5bEwy?=
 =?utf-8?B?UTFhR3ZSNG1NbzBYWmhaeWE1bkl3cEswY0NqQnhxbnVwa3Bob1ZGY0l1WlRP?=
 =?utf-8?B?V3pCUkY2NWhaQ1l0dnFKUDJNT1ZPcXNiMFVSVjM3T0IxQUp0eFBWTElxdzhM?=
 =?utf-8?B?bVZPMVNpRGY4SnE1UXJnQkdSL2hlN0RuZEdJMEpjQktEVDQwak1ndlRxS2lr?=
 =?utf-8?B?bDZnVXZHTUhGUnZKR3RZbFU1NjlpUVlTb2NiQ0E4cW9jMCt0aDNLTURCeWY3?=
 =?utf-8?B?Vk5BblJqR3g1dmJhUHdQVHBZZmVlaUhXK0RXNWlLUlpyWGdLWWR6aUZTRS9Y?=
 =?utf-8?B?SisrU1BYeHJNdzJwVTQrOVRJai9aVG5ObWlMT0JJYk9mbjJQTllwT0RvVWNm?=
 =?utf-8?B?Zy9UWGt5V1R0cVBRRXpUcUF6Wm92UWJtQU0zR2U3a3M5cWxJSFM2V2NnMzAx?=
 =?utf-8?B?amw3Ykd3WFhiNXQxSUk0anovYnFFYnhBNmd0RFk3TnRLSTJHc2U3alFIRW5M?=
 =?utf-8?B?MTVsZ012SldkWVVPNW5iSitxNmdtWEY3RkR4a05YaXBkSlg2MjdmdzNRZTFK?=
 =?utf-8?B?UVFxY0RZbmtFSkJldi95bDE0WUthR1JoQ0VnNkc5NXlrWTZEc0h6RDFTaXZK?=
 =?utf-8?Q?zINNghAAi5wd5+K4pXOuocY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ebe037-5987-434a-8836-08ddc9bc716c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 07:42:15.2709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60ixCJ3N9kNit6vGvLYhoMOjbLCzC/0cIHSl8LopR6Z2sjcde+6Nhs6Ev4isu/uIJlQj4a78RYr+xKDMJIxc5ErGyzykwKfzUe0VHSW5KbSkBfB/yZTGTczUAjOva6Ce
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC0624F2CA
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

Hi Karthik,

On 23-07-2025 12:16, Karthik B S wrote:
>> Would it be good to also check igt_is_dsc_supported_by_source here?
> 
> Thank you for the review.
> 
> I think from IGT/userspace end we shouldn't be concerned about if the 
> mode is supported with DSC or not, as long as it meets the criterion in 
> 'ultrajoiner_mode_found'. Please let me know if you see this otherwise.

LGTM,
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

Thanks,
Santhosh

