Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6FDC02180
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 11:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC6F10E944;
	Thu, 16 Jan 2025 11:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dG75Z8I0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC85910E944
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 11:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737027236; x=1768563236;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eXep4Gwm3ZWgpZAS7pVxhB/pQQjSP04Tt4CVLwHWRpw=;
 b=dG75Z8I0FDRxGYwPqJEmpWPgJTFPm36/uz0KDpwaKqY3GdNrzYeqohlZ
 RoOu6VRV+LzcUTd/U/522DqPox/hN3FfPMKa+cAvdbpybVHsebBnWX1kc
 Qv/0Sa5+e6M/5j7e6lljlA3BJAXxUgItx0K9DkUuQr2/8wYovuZNSz3DR
 p9f4j9WWZnJwg1oGrNbH2iHjXtr2glwC7DRtUTk9Kq0Nnj22wN2EIwkj1
 NS/fy0t37Pxi5bcrUiw5PlFgSfJjylSTgeB5+PkOC7zvXdMs//SNQ/XsT
 TDxK4jZmbsnpF1BEL5voW+cFnSn8dP5Xht7AdZfKCFs8nvIo1TpxKaZoq A==;
X-CSE-ConnectionGUID: r8bqMmNfR/a56op8umZ9eA==
X-CSE-MsgGUID: 7fBZBM06QNuoJrFaeLTrQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37294045"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="37294045"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 03:33:55 -0800
X-CSE-ConnectionGUID: x+ufDqfDRuON99DRukfwGA==
X-CSE-MsgGUID: dSHrXR8FTNuKQHQELUp1hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110102695"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 03:33:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 03:33:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 03:33:54 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 03:33:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Byn6NfM8ZD85ZwgMnglOt9AykrDOBD3/a5WozhYTd2yaFfNjKeYwhW/N7SwcF0tIH6xI+CmLnxxmoKsZYxruYFNn1B0c7hGycPUzUD7YZHUSBc+KcPaQJ1PpnYVFwxyW9X41rTOrOVQzkmrmTfIv4ycFfVzYcgP18sxy8YdQfeoas5m7MhDMM9ZQJyZWCPa8MyvCJcS5t//yG1H06uN3Mh/wxn93DvS0JHdXhogxmyecuwveokksR3s3GeHJFevWpgQR7JuOjOp/WBo1l0U621M/W8sjtVbIxAQL8IR0ZAFhD6vC6j8sCB7gM7o1GjwMwnwYwj70yTTRRnM+JslCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbeAnpnosk6PlyStsHfMBs3n/bWh6DhcHkh0wrqTJKA=;
 b=u96LTuyPBim7+wFRy143K50DymDPhZ9JXljrTp2IoqSvmbL3NOL9EqQa5PTHljhbbOlKBo17ljDQS600Y3ifidoq1mxARjRky4qR5OM7u0WTgsCmBawkwps45kkUzDULq4BVFSE8vTLBpSSJ7QIaVcB1T6wDnnl9z8dG6jh6bw7bZmc81YAgbXK9U5MSbaWZroiFM4vwCK4SVDCMaF8E17BUpLPikJGhd8AWzr8C1erYg7LyMbTctXp/YzCLr88rkaVwLzqmbf0Cxe1VOzkfVyenTodnVAK8gA1p5m39Yc2AF1FctWtpKv64VdSbbQ45MUSyYHD9bLw5cLwZwcHZ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CH3PR11MB8493.namprd11.prod.outlook.com (2603:10b6:610:1bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Thu, 16 Jan
 2025 11:33:52 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8356.014; Thu, 16 Jan 2025
 11:33:52 +0000
Message-ID: <8cdbac98-7976-4778-bbe4-8d7b8196bff7@intel.com>
Date: Thu, 16 Jan 2025 17:03:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/2] Avoid Virtual connector or kms_cursor_legacy
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241209211620.3679545-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241209211620.3679545-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CH3PR11MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e9ef916-caa1-485f-18d0-08dd3621a6df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXBYYlNRN1RPQ08xZ0lwSGUvUnJ2b3UvZHpqYi9kbzhoTXRpZWVQQWVWMVdK?=
 =?utf-8?B?NEwwU3ozQWV6RmZHWWRUZld5TW93cWxVMi9ibUU0MDVsYm9TTnJ4bTd0Um45?=
 =?utf-8?B?Z2MrTDhmVDNuak0wOGNONzVTUllMQWk0b3RxY3FacGsxUjVKbDIyUmMvZHdJ?=
 =?utf-8?B?amIxalUvcXcxZkNOKzFDSkNUTkNwdm1HdWl5VnluYW9FaVE5Tk5reHdzNUo2?=
 =?utf-8?B?dGJXWVlTTjYyUVlhUzNUMTJBSFROb3BERC9KeVpvZ3ZvQzRZNzNvQ3JSTSti?=
 =?utf-8?B?WXNEZlBSZ1Qwdy9CZklGN0RXVkhGL0ZQTXBrb1dUREFFbEU1NEJwd05MblNF?=
 =?utf-8?B?clA4OGNqbG8zMnZlVGp6eTJ2RFFyMEFQWEVRSGQwV1NpNURsTXFGbGVyYUUv?=
 =?utf-8?B?RCt2NXFCR1YyWTJZVFhDckRJYU9hWVNQdGRHVVAwUXlhWlZ4WmhsOEhIdHR3?=
 =?utf-8?B?U1VTMkJycmZLQUVjQ1R4bWx5REtHRzlXRDNUa09vMnM1SEJBT0ZzVU1QeWJC?=
 =?utf-8?B?dzNpcm9kQUtVS1FJeXllczd4SXZQU2xtRjc0Q3dmY0poV1VOK2ZwTFJDV044?=
 =?utf-8?B?TGpoSVlxUHVpNFQwOVlUdXBLTHVEbGJHV3ZMN000RmwxeEsrS1I0RFJVT1RJ?=
 =?utf-8?B?a1l5ZGcyZU5KSCtGQmp0b1hTYlZEdWRJbnV5bWhYVjRpdzduL0g3cTZWdWE4?=
 =?utf-8?B?bi9RQjNadTEyUDVrbWRiUUdKUEpBK1lueWpzbnUzWXhkeUhDdkJ0b0JObm4w?=
 =?utf-8?B?VU9qZTJFaEY1TXNhdGlURE1IWlZJTG5SUWlKT1d1MjN6ekVKMW5oU1RqYWFO?=
 =?utf-8?B?dTM4TllSTldycW1yUmYwVU42VXVwT241RDl1Z1M2ZWFadUppSzhWVzVDUkxZ?=
 =?utf-8?B?YVg2clpDRS96RmV6aThIbmhxY0xUWmtLOGJyRGNNZWRoWWl4VHp5OVYyQWdp?=
 =?utf-8?B?ampEb1RmWmRmam03K3ZvbVNpbUMzaTdJR1Jpc0JaRXJEbk9aaWNJNjdCUVhz?=
 =?utf-8?B?Y3p2NlowbE02WWJjUERReWV4azVHMW8xU08xWkNBNzJoTFhyQ3B2WWUwcjFO?=
 =?utf-8?B?cjNiS2tEMUJHSnYvWlRKbTQ3Z0lmM1E2NWljaHEwdXJOa09ZeVplZnpFbTRV?=
 =?utf-8?B?MDdmaEdDOU5ScFdqQzkzYW5oTWpaUW4ralg5TVVQeko1SUVXa1VzWUpHY0Zu?=
 =?utf-8?B?QWlxWFhyWGExSVFuTGFVenhnM2tsYmU5aG1lTmFLVjhieW5LblpCbmJOTDB0?=
 =?utf-8?B?bm02TDRJVlhzK3RJU1hNRUVCY1NFNW9HK1JEVG1EL21rd0dEWmdBWnQyUFlU?=
 =?utf-8?B?YTV4Q0JEbXZ1SUl2K3ZTbE9tOEEyR0xDTGorVng3ZHBHMXhQU3VWdmtnYThm?=
 =?utf-8?B?UnVKVGxUNUNVN3lWajlPZm9kS0U1ci8wNDVxODFGU2NSenltMElQUDMvM2Rl?=
 =?utf-8?B?VmpycjQvWVN1Rk96WmdNQTFiTmpzd1VvZXRnVXk5V1ovbmZpU3VtMmp0NXNX?=
 =?utf-8?B?RUNHYS81WFd3MkE1b0gzNzhwa0gwNS9zTVB1K21zeVZiWVVqcXlHWFg2YVVT?=
 =?utf-8?B?NXQ3bytINUlhMkF2QzNEWlJlYmJHTHdEVXhVLzdZU2FRa1o3TVdZQ1NyNHk1?=
 =?utf-8?B?TUkrWmFEMnZDdzRjWngrUko5MUx3TGQrcitvclMwRGxPNFRCOGNqOGxXQ00v?=
 =?utf-8?B?UmNMRG1VWW8xRVJhTkVUL3dLZmlWUHBCREhyOTdwS3lMUE80SEd3dURCZkpS?=
 =?utf-8?B?ZkJncVFnRE8rOHd6QVRrNTM5MDBDbWtqWXFWZm04ZjJUSVRwZXY4SjQ1SDZO?=
 =?utf-8?B?bkhRME13Y09kZkdYNmF1QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3Rya21nZTFnRlVObDR1WlRUMUF1aFlmK2dLS2Zsa3BlUi9KbzdIM0FRS2U1?=
 =?utf-8?B?dXl1S1FucmtuT3Y0Z2VkdGV1UXhoUmVIekpNdkJVZ1VrRzdMQUtQaGwyT1FY?=
 =?utf-8?B?bnZhdVJYOSs3UFcyTVlFbTZEbXpLZm80UDI3WWpYdXQ2U0VHT0gzSUdLQmdE?=
 =?utf-8?B?T3VJRnJlajhDZVFWY0trQTdDNVdKOXhlUFptTWwycmU3c2REMmp0dGQ1bENu?=
 =?utf-8?B?ZmJrY3VNTVBTNWlYOEtOYnVKSmF3Y3gyQnYzOEVTRFZnWmV2SE9udGJIMVF3?=
 =?utf-8?B?TVZHMzFaU1VRL2V0Q2lwTXFWRXM4N1ZpMFRBRmMyRHZUM0hxZisxZ1Yrenow?=
 =?utf-8?B?NU02STcvS0NDSTBJdk91elZzWGR1dUE1M213THJua3Y3dkRRZ2VrZUZNM0xJ?=
 =?utf-8?B?ZWtuWVNlUnd0WmErVDBmMkZOeXZ4ZWxwTkR2SHh3T0Ywa1JsbGYyTGdEY253?=
 =?utf-8?B?Yk5EaHBhb3lEQmRQT0p0bE9EUTFKZzhYQnVlN091QTJ4MmJoU1lYVTQ0WGNv?=
 =?utf-8?B?aytTdzZRczVFTzQrbWpKVTcwVHZVVFhCelVwTEs2aXR3aUFMREpVOWFoRzh0?=
 =?utf-8?B?aXRLV2tLcHF4NHU1QVFQai9tZjNNc0dBaVBpVU9ZK3JzOFhqc2dnRGtYUldF?=
 =?utf-8?B?QjB3b3BGcEZzcWk2Q3crbUdsR3RSc29kWTlEYlhKYVk2S2g5RUR3cGowejdr?=
 =?utf-8?B?NjRZZEJ5NU9DZDRKN1pIUHdCOHZjLzg4RUR0S003cjZpU2d4T25NaXcycFk1?=
 =?utf-8?B?QVZvN00rbVJBcWhud2hVY0tkczlSZ3JETG50ZnBlcXN6bUJ2TnNTNkZoWjhY?=
 =?utf-8?B?VWpBU294Vit5WDk0RzNUYTRGQUZlNlM2aHhiNUlJSUs1aWVweUNTd0tzbWFV?=
 =?utf-8?B?MjBrNlJ6bkFSM3dpMW9ybGpCcDF2aUtkSXBCMWZLNGRiN0U4MmVMSHl6VFNR?=
 =?utf-8?B?M0EzYWM0c1FueThIWFpwY0FuT3dHQ29xWUIrRkVBeXgwSzAzNUJuVlo2K0VC?=
 =?utf-8?B?WTkzR2RIVTI3TUxNazk4Uk10clNyM0ZwOG11OHpacGxZL1VRZ2d3ZTZ4aFd2?=
 =?utf-8?B?clFXTVJwYm9RSmNKNWRjWFhocUNBbFlPNndpYkVlYkNKUGFmQ2FOZmpHVzFP?=
 =?utf-8?B?bWV4M0hRcVdRR200cVZZdXBHMHp4aVl4L3k3aGlJbW54alNvbTZQamZ1b24v?=
 =?utf-8?B?WWg5N0J4a01rMEJkOG5Tckc4T3NUZW4zUGkyZkFIRzhKRXl6dXVlNTljUk81?=
 =?utf-8?B?SDdsZERmMnY5Z1M1U1U2RDNMK2RpNG90UXphSGRuWS9Sa1lQRnZPME1zdmpB?=
 =?utf-8?B?TC9oeVZrUkpPU1BBbTd4NytXZ1p3SHNZWHZ4NzRMeStRcTJSeDZkdW0xTE9R?=
 =?utf-8?B?K3dtWTNTaTduWWZ3Zms4M2I4QWd4NnF1VHp2MGpPbXpDRXA2K1lHaHhZdFpF?=
 =?utf-8?B?bG1WUkEya3k3NVlQeVRuWmZNWUp1TmRtdHlqK29LbTFWZllnTE9NcjBpOXZY?=
 =?utf-8?B?MTVoSWcyekczVGFHZFFBYmRQaUF2dVEwY1BqeEtuR2lPeTZPVXBEL3BoZEsv?=
 =?utf-8?B?U200cTJkUGUwU2krbXlNRktNUk1DN3pDcnpnV015MVBnOGlxMUhlajgwa0ll?=
 =?utf-8?B?TVdseDdVMHBmaGpZb1JqZnl2NW43Wm9XMWN0Mjdla3RYMWpjZXdtZU1XT094?=
 =?utf-8?B?K1hOVy9xc0crYXZHVklPWHJOK1R2UndrTmduMGlkSWl2UXE0aXhvZ2RPdE9y?=
 =?utf-8?B?cm9JWVhRNzhQbmJlMGRtcm5OUFpkbFVpbXRkUnI4WGd3Mm9mSUkrNnpoL1k2?=
 =?utf-8?B?dko5QjhSb1NSeWNCMzQ5STU1WmltTFdIeCtINjJLcXk0ZHpaQ095SzllbmVw?=
 =?utf-8?B?OVBxakFOdGowQUZKTkJ4eC9WRTArcHQxaU1CNXMvU1NmRDM1VmQxNmgwd2xI?=
 =?utf-8?B?QkpaSUw3aklQTVIxQ293V3JVR2s5cnFBSXhRYU9iVGg0aitJUW53U0QzbzNJ?=
 =?utf-8?B?eTkrSHJ1SXR0MGtOMDhKNGFBVkVJdko0MzFBWVk2U0o4OURNUDVhSnAwaEFx?=
 =?utf-8?B?bTVldzlHZU5RbWV3R1lGaDZWN3gvczk2VXJpdFFKN2Z5VWVNR2xoNlptdXV2?=
 =?utf-8?B?cjZ4NEhJb04xZHVJWVR4WlRmT0VmbjMzdk5BRm5OQWRZa2wyWlk4dzZSSWJk?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9ef916-caa1-485f-18d0-08dd3621a6df
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 11:33:52.0778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wAzfeYyzVL4/+w5Pg2H2UjkATbIEyW6rDD8ALskdYMWVlL9KpYUw86ic+x01l16Ij+4lHuxhCJVf5lrOyAM8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8493
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

Hi JP,

Do we need such change only in kms_cursor_legacy or other IGTs too where 
we need physical o/ps ?

On 10-12-2024 02:46 am, Juha-Pekka Heikkila wrote:
> this is to avoid issues like seen here with tinydrm:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2340-9d12021e081c72b18c31bda175fb9a43f1d005fc/bat-adlp-vm/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
>
> where it seems tinydrm is not able to create linear framebuffer
>
> /Juha-Pekka
>
> Juha-Pekka Heikkila (2):
>    lib/igt_kms: add igt_display_require_physical_output()
>    tests/kms_cursor_legacy: for basic-* tests require physical connector
>
>   lib/igt_kms.c             | 21 +++++++++++++++++++++
>   lib/igt_kms.h             |  1 +
>   tests/kms_cursor_legacy.c |  2 +-
>   3 files changed, 23 insertions(+), 1 deletion(-)
>
