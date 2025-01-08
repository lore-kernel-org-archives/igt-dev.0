Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EB3E77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 23:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB2D10E1C4;
	Wed,  8 Jan 2025 23:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLr3qMRT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA0310E1C4
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 23:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736380271; x=1767916271;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Fps0P3zN0ykxiPj4/hFqslGRq+G4SiKiexTzW6y1Ys8=;
 b=GLr3qMRTgmPFE/WIQox4cpp4AIe6n86HDy1Ee1Syd8NY5/tH/aBdXnvv
 4HBeen1NamB29IsdsCc5vZD9H+BUeaY6GfRcayNUR5ouLkVWEtTm57M10
 TWI3vM6nS/cRSVd/N2kT1bYa92ynSMF32prXZoOtguXsNQqiENyQUamho
 AwwyXaK8czmouWyXj012Inbv51QrmIhOWRoQ3rLhA4oNSewf20gNdu9Se
 raOxwf+C/S+yjAKdYOv0P0wYPmYSd+y6idd+N4+DjLGlt5f2iVRPoU3vj
 y+4BbTDFZBoxD+2FCh9q8SEQQDlw2YYUV2Scp33q5ukNeY/vUTu71ORj+ A==;
X-CSE-ConnectionGUID: 2XM7vmBfR72WTyCNodbREA==
X-CSE-MsgGUID: yfiQ7LSPQVSypwrt9G14mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47613782"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="47613782"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 15:51:11 -0800
X-CSE-ConnectionGUID: Za1jL+JlQZOri2S7U3e5kw==
X-CSE-MsgGUID: Aegls+tmRzmoNBxgf2jzXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="103311509"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 15:51:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 15:51:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 15:51:09 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 15:51:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXTZOAY1q2lqEf29cW2CSBFpVAZmNHtGfJ+dqubDR6eJn80wrTdpjJZRY3taePKj8WNjRsSifdNO2iClFaH58jWtjwcxNl6W0VPPyNrgnYhmCuVO1xjTTE/Fw3bH4jmV3LCWBDsOeXo4hst4vUoTV6IKwpyrvyaq48dc980Pq3lcYdYTpihc5/ioIOsE7ibfp5qcWxqG+ikRqeCaN+G8YGnJOcr0XOq7LfBZfaX1rTFfk7zYpAM90BSz9FWrlu+nlE4c7CY3SIL5wydiBUBxweBEXcxvIjUVFKIrRto0qvvvqPanYoO42thjVjEc1SCHYXZ5lgzXybc/MuFInBf/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEQcHKkwXbD5Co/MckwClmiw0BJ3yJjHx7dIyvh2gvg=;
 b=NsDHOQgwdN5SrkA5Xv4Zqq2nllP1iPv07C5Znhy+08X1HoJuqWRPVstR6hj7asG1p2FFzhaFQY2d6ez6X+b6i+rtf9x6m1ntUwAyCUx9M0Hue3b8e4uLcAfY5t1vUn+izXVh7RNNZ539UWWCLDk6CtXOxEElkTkhOAvMpU1TahaVIm4qVctVzdYQmMG/fbFi/t1ad0PhqrlSjrWAgHNpWM0U82zZ93EwwrqJKUMl++F24ZhnYUy1HolJk0UVsckFNSuJ4zshfpoC5+qJfS3hPiPnuhm5QPgvabDAd7VXQ1y7uB0JYfHEbtgj6ErH0V7kj69QVoQ4svwFJ98yFi+GDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SN7PR11MB7973.namprd11.prod.outlook.com (2603:10b6:806:2e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 23:50:38 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 23:50:38 +0000
Message-ID: <a24b3e36-6d83-43ae-b952-ab56f35fe820@intel.com>
Date: Wed, 8 Jan 2025 18:50:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v10] tests/intel/xe_exec_capture: Add
 xe_exec_capture test
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20250108000410.469269-1-zhanjun.dong@intel.com>
 <CH0PR11MB54446DFF8DE09B3A0CC217B5E5122@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <CH0PR11MB54446DFF8DE09B3A0CC217B5E5122@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0020.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::33) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SN7PR11MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 6df80093-16e2-4e38-3fb7-08dd303f40d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkJLQjZ3QjJPMG1ydU5Yc1pPS1RoRU1hdzRhNDVXWlZEb3ZaS3hsVnVTNDc1?=
 =?utf-8?B?UkdqSDhwYVg3VnpYb0FmUDYvM2pVa0hINEI2WFRzd2xlbjNqdHlIS2M1SGdn?=
 =?utf-8?B?bUtrTU5YRFYzbVpEYmllS1VyZkcyU0JxYmxrUFFpS1R2Wmg3V1dvVTByZFlx?=
 =?utf-8?B?R3Q5TWwvRkRNeHZNT1BBR2F4dEZqNkxGSGE5a2NwbUFvVGNpLy9GMk1nWXVR?=
 =?utf-8?B?Yk9yOFdUc1BVbmVEaFl2bDZBTEFZUHRiaVpxcWpRbzUzbEhYNDJ5NUc2VE1x?=
 =?utf-8?B?cHY4NkgvdnN6Ui9IQ2U4YThlT3dTcmFnbENrMXRMZDFoeTU3aE5BMU1meGow?=
 =?utf-8?B?WVhoQUVkTWhoZ1dGQXYwSVBmbHppQTdocUhJRHBpcUxZMVAyMEFmUk9KQ1hR?=
 =?utf-8?B?ZElrNlBEZHdkSnYzakp4NER4YXplV0k3KzRLVzdtOHZGVmZWR0pLbjVuZHVu?=
 =?utf-8?B?c2htbG5wZWRRMDBCanZPNDQxYlY0b1dZakdsUlNuK0NSRldPZWlsaWJoYXlV?=
 =?utf-8?B?SVhNd2laSmFxN0tNWkxGVkE5WVYwMlNGTk9aaUxGQi81alUzdzNCYUVCMkNL?=
 =?utf-8?B?UDFLdWh3Z216UW5wMVVkZFBZczJjcTZZMzdjekd1b0paTWlFZWVZU1JUbGJS?=
 =?utf-8?B?bzBvdUpsaHhtczRIeUZLSlhXZDZLY1BUWkk4RDFCVGtOZ2FDUnZIR2hQTDdx?=
 =?utf-8?B?OVVjRXB5dFd3OUVpNVVXdjlWMW9pb0xNdDloaWdNZEtxWTlEN0hIa2hJUnJO?=
 =?utf-8?B?aU1hbHRobytrQ1FmZkxEY3BGUk83Q2tWOTloYWlLSTM0N0dYZWhRUFpUMmRL?=
 =?utf-8?B?S1VadStvTlB4ZlN3RGxVT0Z3SEdiZlhGQ2hVeEV3YUN1UFlpbU95emh3NGJh?=
 =?utf-8?B?cHE5WHJtTk9MRDVsM3VrVXFVS3BIeEd2Ni9xZlJETlNWNHpJeVk3MDVta3dJ?=
 =?utf-8?B?bjRSWnNLRDFXZkVtVVA0LzdCb0FGbXBWQUk0ejBZc0RPdzk1dkZlaXZ5LzRZ?=
 =?utf-8?B?TWRsNnFNZzFoTU80ZWd0SFA0RXVtRkNxV1VDd004K0VLT0tpeEtnbnRHb29n?=
 =?utf-8?B?TVRZRkpGVlFpWVovL2dlUDFXY2RwK3ROek8velYvWUNNaytQZC95WW5EdDNO?=
 =?utf-8?B?YmQ4ZWJOUXdVbndmemN6UDVvWVhhVTc0ZXUyYjYyVHR6WVFpTzlWK0I3N1FG?=
 =?utf-8?B?b09LSG5pZFZtTy9LUW14cml1WU9vTzZpcUdSbG1nS3QrODBaUXVzYi9IbFh4?=
 =?utf-8?B?WGx3S1hvTXQyUDlVcmpwaWFweEc5amM4aTlkc1F1NGRieWFBcWduM3k0VG1K?=
 =?utf-8?B?UWdrRGx1WHhWREFGYlhvL1phYVVNUkhFenFSTVBPK050dG9ocFJzRUlYQUV2?=
 =?utf-8?B?blF5ZFNsRWNFL3c1TGJQTDdEMEV3RUlSVlFCNkFUOTRwODZOcUxyVmUram1s?=
 =?utf-8?B?SE5uWnRCTWlxWHBwRHQrZEV5bHk2QW5aQ0E2bk1QbjFCK0ZSMm4zdnVLS2pw?=
 =?utf-8?B?ekc5a0hTTDFjK3JucS95Mkgyd3ZiblhlUmZVVjRtQjAzNERUaG9PbDJWNzhh?=
 =?utf-8?B?dmxsTjdPQ3QwNGI2VUxyK2tHNWxBWDk0UjZRdmhEZXFFTXNRM3hBQmVEcjkx?=
 =?utf-8?B?NlhJWHlGWExtZmI5WnZZbDFVRU9lL2NhRndRdTUyUHh3YThtUG5IZ3R2bTRr?=
 =?utf-8?B?QnpZUXVTQ3N2TXRJeFJjTWQ1RURLUWZkVjVadkgwdmVpZTRZVW42QVVaZmJn?=
 =?utf-8?B?VjFvaVhmL1AvUWFtMDBWdUN0SkljVnVzMHc3OG5rWnIvM3VMbTRBQ2V1a3d1?=
 =?utf-8?B?NEhSSEFVVVJKR25MREw5OWQzOGMzTVZObGF3ZXQvNi9IWXZOaXJLb0xZV1FX?=
 =?utf-8?Q?/XygpoHvTU81Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmZ4NDgweFlEVDFCV0JWa0RPb1pWQVFYc3FpMDV6QVR3eVdjNHFubHhxRStp?=
 =?utf-8?B?cFN2dTBwWUNzejVZbmZ1WDRVSjJrWm5vSy8yTjZMRVpsWXRwd0p6Ryt4a2Ix?=
 =?utf-8?B?U0d3N3BMUEs2bDlDQWZuRFIzVlZ0UjA3ejRZWFVSbGdQRHZDbFhOVWhod0lF?=
 =?utf-8?B?UkFGWEJrbTRyN3BLNVVmczNWNXpISm4xQjNQOFk4L3dIQjRnT2NiREhBWHE2?=
 =?utf-8?B?WWVDU2w0dE8yQUtPT1ZEUHkxK3g0RVo1K0hmNUJ2MFlnTEc2eklHckY4VHpX?=
 =?utf-8?B?R1RndUlQWlg1MHRsY09rR1VuVTd6V2p4ZE5JK1JraXRCeVJIdHJEWEt2cldN?=
 =?utf-8?B?TmlHYjhhLzhyUUF3cjgrcmF1bGZwYytLN1AramtNaG9XTUxTUEo1bmFxV3BT?=
 =?utf-8?B?czhPRGUvbHRuZEpBajBPeVpvQ0tpcVErNHVYVDg5Uk1BVGtrNFZZS09sS1Jq?=
 =?utf-8?B?di9FVHJCSDJCaXJDTVVwUnN0YkJUYmlNSk1XRVJTeVAvbGVUQWhZNUxCbTV1?=
 =?utf-8?B?YUUzQTIrdHh0V3lRQ2ZRZHB6M1VhQzk4VkthRS9uRmxhN1pZU0QrZ0h4WUJG?=
 =?utf-8?B?bDlpbzVhSUFDWmV1dmxLQXlZZlVpdUg3OE5wWDArUTVyemxlS2hidFVCdSsv?=
 =?utf-8?B?d3BVZkJFTVdENHNXb3YzV3ZnVDF3REZsMDB3WHBCNjZiczVqd29CR2k4RUVQ?=
 =?utf-8?B?NVBkbWJFNG53MGQyV0xPNmxoeVFCT2NTaHJXMWdLU1dGTk9SeWtvTEhnenJz?=
 =?utf-8?B?U2JKUDl4cDNEZGZJdEJPbGt2Z09ITUVzeGxGOHQ0ZVRDelpNMG5KeGZEQkIx?=
 =?utf-8?B?Y3RSakpKTjBqeGl4V0hQU0c5UEZNdGtOWkk2OFh3WndlL1hoL2F6QWplQlkr?=
 =?utf-8?B?WUtyVHA5dUV0dW5oL284dWxJaHYrYWQ2VUVYb1hOM3FoYjhPcUVpWmM0cnVv?=
 =?utf-8?B?aWRLcDdRYXFaUnFHOHlJWU5uVGM4Y0F0M000MWxpWlBZSDdpdE1QUEx6YktS?=
 =?utf-8?B?NWo0WndOQkVGMWtpUzNCckt5OS9TdzNlQXBRVFg1NzZOU0d3NTBiVFJOcmRq?=
 =?utf-8?B?OS9iTlZHTy8zRnd3d1czUEwrdGFGT0QxZ2p0d1RTNk1LUHgrSFBLYmNqR2tU?=
 =?utf-8?B?ZFpIalVUVlZtakVIcExUNVNzdnJ1NTl2M1hWTXVIZE1qQzlDMlU0SnNpV21D?=
 =?utf-8?B?V1QxYTUvZC9CdWJ5VVkycFNJUGdnaENCQUhpWWJkOGttckF1SjVFbXFmRzdE?=
 =?utf-8?B?Yk5SS3JwZ0hrUFRWZ2lEcnZYa01PR1FjdEpaQ1JYa01WV0ttZStBMmE1Tk9B?=
 =?utf-8?B?VWx4cTk5V3BMTStWb2V4dVdjMkVFWVZJelMzdUpqeWo2SVQ3bmVoN25Dbk1I?=
 =?utf-8?B?d0hFQmtkVHhpSE50dVQzcGcwRzBHK3dTMXhPWDdVdlRlQjNlQXZXQzZldU5l?=
 =?utf-8?B?RnV0RnBEbHhnZDFlSno0N2l3b3lGN2hwUy9WbE0zRGRmckVmQWlsVTR1dm5G?=
 =?utf-8?B?MklrTDRBVVJMaStVbUxFMDZUQmdnR055dzF1MG0rYkJDbkMwdVZwYmNBblFF?=
 =?utf-8?B?cmZpaDBEV2tyWGMwVGlFVFFDWTI0a0htVzh0ZkNrZzFKbGdHRlJkeS85NnFM?=
 =?utf-8?B?cGlaeTlkR0VESVRIS2pHRzRGRTB2Vkl0ZUUyZjR6Rko5RjJKb2hONWpBVVlj?=
 =?utf-8?B?UWxlUk4vTWp6eCswUmNaMXBOWEtjdER4NXBac24raWZNVEwrdFcrL0FaaUlP?=
 =?utf-8?B?RUlMQmRab2xlbmFhbUNtdVM2Nlhod2lreVFxVFVqdUlpRHBDS1ZEZmhWUTVy?=
 =?utf-8?B?bzZTenZxQUpySVcvQ1Y5UGRZVXRBNDdnUlFHQ2lWTzVnaWd2SnQwMlRzSFk3?=
 =?utf-8?B?V25DdDluK2xVa25VOW1Db2RIZ05qYVJvcU1MN1ZDYjF1MDQ4SnBuMVBYbi9y?=
 =?utf-8?B?UzRqWGo4cHd1TmpuSUQzS1h2Z3RuL3pjMzVGcCt1Y0R5SkZZSFVMcXQ0bWFH?=
 =?utf-8?B?Q0Qwc2QvdDNYYlJwSm5MNEFYNnF1RDZ6MXNhSkdnbVpyUnhlQWxTMW9WRVFX?=
 =?utf-8?B?QTBDL3BHUHg4R29WNHppclp6QjQzZU5wOXFTUTVMVjNkREN5MmUrRHdxOHlt?=
 =?utf-8?B?M0V5bTMxOVVIUlhGUERGQzVCZ0JoRURoeFVXM04zZkxDWG8ySWd6RkZ1UXRm?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df80093-16e2-4e38-3fb7-08dd303f40d6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 23:50:38.7493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uggx1234xjT5izMT9AAhimMuI56qV5myyv4duIsFPL0lVdMGkbMDvKhvwjoyRcoRfwvshVfcXo8bIv9V/o0BdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7973
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



On 2025-01-08 1:23 p.m., Cavitt, Jonathan wrote:
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Zhanjun Dong
> Sent: Tuesday, January 7, 2025 4:04 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Dong, Zhanjun <zhanjun.dong@intel.com>
> Subject: [PATCH i-g-t v10] tests/intel/xe_exec_capture: Add xe_exec_capture test
>>
>> Submit cmds to GPU to cause engine reset, check generated devcoredump
>> register dump, check against expected values or within the range.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>
>> ---
>>
>> Changes from prior revs:
>>   v10:- Move job timeout save/restore out of subtest, to avoid being bypassed
>>         by failed assertion
>>         Save/restore job timeout for each engine class
>>         Remove testing on multiple GPUs, to be put back after further discussion.
>>   v9:-  Reduced job timeout to 2 seconds to speedup test
>>         Add info print to show test is running on single/multiple GPU
>>   v8:-  Move change list below ---
>>   v7:-  Fix typo and removed unused macros
>>   v6:-  Adjust start_line to start from 0
>>         Use 7 bit engine_cid, start with random number
>>         Add ioerror detect on fgets
>>         Reorgnize the regular expression
>>         Remove unnecessary radom seed init
>>   v5:-  Detect devcoredump matches the testing engine
>>         Engine will run with random cid
>>   v4:-  Support runs on multiple GPU
>>         Load all devcoredump content to buffer
>>         Alloc line buffer dynamic vs static global memory
>>         Changed to igt_assert_f to provide more info if failed
>>   v3:-  Remove call to bash and awk
>>         Add regular express parse
>>         Detect devcoredump through card index
>>         Add devcoredump removal check
>>   v2:-  Fix CI.build error
>>         Add multiple GPU card support
>> ---
>>   tests/intel/xe_exec_capture.c | 519 ++++++++++++++++++++++++++++++++++
>>   tests/meson.build             |   1 +
>>   2 files changed, 520 insertions(+)
>>   create mode 100644 tests/intel/xe_exec_capture.c
>>
>> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
>> new file mode 100644
>> index 000000000..b0642b406
>> --- /dev/null
>> +++ b/tests/intel/xe_exec_capture.c
>> @@ -0,0 +1,519 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Basic tests for GuC based register capture
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: CMD submission
>> + * Functionality: Debug
>> + * Test category: functionality test
>> + */
>> +
>> +#include <ctype.h>
>> +#include <fcntl.h>
...

>> +
>> +igt_main
>> +{
>> +	int xe;
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	u64 timeouts[DRM_XE_ENGINE_CLASS_VM_BIND] = {0};
>> +
>> +	igt_fixture {
>> +		xe = drm_open_driver(DRIVER_XE);
>> +		xe_for_each_engine(xe, hwe) {
>> +			/* Skip kernel only classes */
>> +			if (hwe->engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND)
>> +				continue;
>> +			/* Skip classes already set */
>> +			if (timeouts[hwe->engine_class])
>> +				continue;
>> +			/* Save original timeout value */
>> +			timeouts[hwe->engine_class] = xe_sysfs_get_job_timeout_ms(xe, hwe);
>> +			/* Reduce timeout value to speedup test */
>> +			xe_sysfs_set_job_timeout_ms(xe, hwe, CAPTURE_JOB_TIMEOUT);
>> +
>> +			igt_debug("Reduced %s class timeout from %ld to %d\n",
>> +				  xe_engine_class_name(hwe->engine_class),
>> +				  timeouts[hwe->engine_class], CAPTURE_JOB_TIMEOUT);
>> +		}
>> +	}
>> +
>> +	igt_subtest("reset")
>> +		test_card(xe);
>> +
>> +	igt_fixture {
>> +		xe_for_each_engine(xe, hwe) {
>> +			/* Skip kernel only classes */
>> +			if (hwe->engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND)
>> +				continue;
>> +			/* Skip classes already set */
>> +			if (timeouts[hwe->engine_class] == 0)
>> +				continue;
>> +			/* Restore original timeout value */
>> +			xe_sysfs_set_job_timeout_ms(xe, hwe, timeouts[hwe->engine_class]);
> 
> We should probably assert that we're correctly setting the timeout to the expected
> value after writing, and abort further IGT testing if the sysfs setting is improperly
> reset:
> 
> """
> 		xe_for_each_engine(xe, hwe) {
> 			u64 store, timeout;
> 
> 			/* Skip kernel only classes */
> 			if (hwe->engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND)
> 				continue;
> 
> 			timeout = timeouts[hwe->engine_class]);
> 			/* Skip classes already set */
> 			if (!timeout)
> 				continue;
> 
> 			/* Restore original timeout value */
> 			xe_sysfs_set_job_timeout_ms(xe, hwe, timeout);
> 
> 			/* Assert successful restore */
> 			store = xe_sysfs_get_job_timeout_ms(xe, hwe);
> 			igt_abort_on_f(timeout != store,
> 				       " job_timeout_ms not restored!\n");
> 
> 			timeouts[hwe->engine_class] = 0;
> 		}
> """
> 
> I recognize that igt_sysfs_set_u64 is internally performing an assert on the write,
> but we need to perform an abort here for the following reasons:
> 1) A failure to restore the job_timeout_ms value can cause spurious test failures
> later in IGT execution, which we need to abort to prevent.
> 2) The assert on the write only determines that the write occurred, not necessarily
> that it was entirely successful (I.E. if we attempt to write 100 ms into job_timeout_ms,
> we could get a partial write of only 10 ms or 1 ms and not catch it).
Good point, it is important to abort the IGT test if restore failed, 
save us from debug on false alarm.

> 
> I don't see any reason to block on this patch beyond this, however, so just add
> the necessary assert, and this is
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt

Thanks for review.

I will post next rev as recommended.

Regards,
Zhanjun Dong

> 
>> +			igt_debug("Restored %s class timeout to %ld\n",
>> +				  xe_engine_class_name(hwe->engine_class),
>> +				  timeouts[hwe->engine_class]);
>> +
>> +			timeouts[hwe->engine_class] = 0;
>> +		}
>> +
>> +		drm_close_driver(xe);
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 89bba6454..895d911f8 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -286,6 +286,7 @@ intel_xe_progs = [
>>   	'xe_exec_atomic',
>>   	'xe_exec_balancer',
>>   	'xe_exec_basic',
>> +	'xe_exec_capture',
>>   	'xe_exec_compute_mode',
>>   	'xe_exec_fault_mode',
>>   	'xe_exec_mix_modes',
>> -- 
>> 2.34.1
>>
>>

