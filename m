Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF26C54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 17:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF2D10E76F;
	Thu, 29 May 2025 17:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rr/Fr8oD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543F710E763
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 17:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748540942; x=1780076942;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ykOHLJnULLikugP3BG0hsoROynzjv67Qq+tb86fc8mc=;
 b=Rr/Fr8oD4JYzSEjSG8g6ZWQuXNTn2/WOyj9UPXuLAZUOpJfuPcWGMAtP
 1r56zIPdfqIYnk95Cy4+0PhQ5bNDCVRTW9vdbHtrA90dJ0NgRVU7GR4af
 MChUBQHfLjoZms9OwAe+UsjpPeffoL+MU56s31ejO7k1T/2MYmG4U4OIR
 kkocLL0ajMbt2xuJxDhu4CBKgAsmw0l/vIWyRdY+APkVxNjOfN4D+hsVR
 DEjVUUVq0bYcCzTZJVPPtQNcmSSWqCMiYl16djsyA/0zfCkomPFnvhsmu
 42tcjMctmixH+3Apn3tjDsUoNdgR1EOOWh6yRtR5ciKlqzh41bjfYFw15 A==;
X-CSE-ConnectionGUID: W8qeVHPBT8ClVfiDAqyfzg==
X-CSE-MsgGUID: Y37wXKoOTUmq96h9QV8aog==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50317563"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50317563"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:49:02 -0700
X-CSE-ConnectionGUID: o7arVh0HTMijLkA+FaRApQ==
X-CSE-MsgGUID: OI7C3XXRRzi7V34f2/sAgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143970111"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:49:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 10:49:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 10:49:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.64)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 10:48:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZXtP4k8+1QKR12MjVaYRs77NqdHJK2FJatt+XAh0Na8cT6N7Libys1ues+DtMTtSwFqng+hEXVJ+9R2puT85H61p0F5ZI94K5esI8h77GBpmA9J7P/7TO7R3XKDyPvPOZkPLpkPJFQWzDj8yXkcm0683buuj0yKVebIFImRqnR9fCNJCig1CnTKq9qy36YSAx8F50HTRNwlf2IKkd5H6lW/R2gqDyKMehJuuPZNJkEjG2XFOH8JPJNzEiP1qoPirhe2XtQOOclgRgHN0GW1K003Zg1XDQLqNGBGn/rpb5KhkGZj3uIIhdmlBm99fxqjH4vZmottE6xYL6l5QRVKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMdkywPuau91MYhCvyIuvbWPSp8UWhgjWNDiurCR49U=;
 b=gR4U7RqzeEM+IZev/JiuIARVYG4qxN3HNxTQY6qcxxTkpozAyxvTilEe1v9Jrf3Ol92ZIeGc3BfZX3EcNomzA02eyUZZvfDo4//myBpSgvg8cpNEr5wKplQVue5Q/SDABIZ/fYaZjPFfIIkOQ2Np9XCodB/Mc5J4lZI5NCXOPSCWTE6GaU5dvWxNF1hutCUbs6CVT6P74CJzMqW8i2oDczo+6RLhOU/S906Zml/CVWcvU8VIoAKHTGpYi2DAQjEZU0o16eHzjVNgHrOTruQYlb1sJTSNu+ro36+hcbQ7MqVE567sjt8rsp2bUFdtXvkQG1joeNA4XjFKaoQEgqwGkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB7986.namprd11.prod.outlook.com (2603:10b6:510:241::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 29 May
 2025 17:48:57 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 17:48:57 +0000
Date: Thu, 29 May 2025 10:48:55 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v2 4/4] tests/intel/xe_pmu: Add multi client engine
 activity test
Message-ID: <aDieB2lFm07cGubp@unerlige-desk.amr.corp.intel.com>
References: <20250529065359.915117-1-riana.tauro@intel.com>
 <20250529065359.915117-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250529065359.915117-5-riana.tauro@intel.com>
X-ClientProxiedBy: CH2PR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:610:5a::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 35829a87-ee26-4337-6d4c-08dd9ed915dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0pNQWtzRzhIK2xmSW45VFUydk41QnhoK002YjR1RDU3Ymt5d2hLTzQrR01S?=
 =?utf-8?B?OVRCSjNHTHVzZWVFbVo1NXQveTZEQzhaY0ZES0svWUtXbGdqZFdkcmVsS3BM?=
 =?utf-8?B?UzBQNkxLRnZYczFNZUw5Sm1ncEtwb0pWZy9oTDlMNWxsekQ5c3V4MTFmS2t1?=
 =?utf-8?B?OHdGa2RpcHJ5aTRJYzhPajQ5SUd6dXZSbjYvRmpnbEgrQkNvSXF4a3VSZjhV?=
 =?utf-8?B?ZWxSRkpMbE1CU3pha3FDNnFobUZ5RjlnWXRIZU9IVkwrb0VZM0xnWkZKY1F2?=
 =?utf-8?B?NTJsMUs0dWFGTTFObmR0a2hmQW9ienNEbTJGaHFpS1lWV0tpRjY0WVJYaXpL?=
 =?utf-8?B?dlpkTWl3TFpBVk5IR0VhQ250ZTQxT01naGFrMDJ5SkxzS0hPcTlFU0NZTEVp?=
 =?utf-8?B?aGVHYlJEMzR3Q0hqR3h5cGdlMnUvdndmVzZVMUZlMTE5RXdreFF4OEwwWElo?=
 =?utf-8?B?ZXk5Vlc2YkgvamFCTE9kOStWMjJJalQxb0lHQTg5UEhFWDF6NWN3T3ZEanVJ?=
 =?utf-8?B?bjBwYmdrNmcxVlhBK0JBT3JMY1NaQ25UQnltbk50dEJ1QXhDMTFJandXUVMz?=
 =?utf-8?B?UHZGRnh0bGVqM1QrL2xWditXR0k1YmgyYTVVTGJuTEZnVnBHWlNXWStXSzNI?=
 =?utf-8?B?eHVJek54aFkwSmkvQjgxSy9aV1NHd3FaV1hDUWZOTFBvTDRyM2tRZWZHYzd2?=
 =?utf-8?B?NlI0NjVrWisxaEdHaWNRMHF4c0JSV1FtUTQ4WU1JTUJuSjNPNnNhZ3prb2d0?=
 =?utf-8?B?dnlNOHhxYmN3cVE0eXMxSFhUNVdsZS9mQk1XUnV1WEZ3dVNGU3I3Ui9GWGNt?=
 =?utf-8?B?QTBINWRCMnZoYTlQeGVPY0lQZ2lCSDV4WkVVSnpidWhlMWM2ZzZDUHRPSlJV?=
 =?utf-8?B?blZTS1NFcVlWaWFwd0l4TGJhTlFLVWR4VWcyc1RmQmdyUmRqc1pOM3ROVGt5?=
 =?utf-8?B?cFR2TkpaRzlaNFc0ZS9KTi93QUtXa2V3aC9MRkRESzFkVStrTGNNTWFDQkY3?=
 =?utf-8?B?N1o4NGUxNnRxWEg5d1JybHJnNWMvUmloMEw5a09TZEdzaG1rd0lDYUZZc1Bk?=
 =?utf-8?B?aEZ4cVkrMTE0R2RCbk1IYlNnQkJEbHJsK25MWXJyckRnZ2k2QWFsblZZeTZn?=
 =?utf-8?B?TnQrcjJiSGZDdmJVa1JRa3NsVER3RnBzaHFkMU9wNjFkMG1OZkxRVEduRlBE?=
 =?utf-8?B?aW9qbHowM3NVK1lsKzg5K05qSU02YW1mOE9ha2orckRKWTYxbHdTVlBGMWsy?=
 =?utf-8?B?VzJLR1QvZklCSWd5anM5MnpZTGxOSFNsTytaVnpHQUk1Znc4YlNlZmdyNjRX?=
 =?utf-8?B?b201dzFsR2w3Vlk0VEdnb0tWYUpXWEppUXBGV3VHY3lQeERmdUE3MERKTXFV?=
 =?utf-8?B?cU9uQTNFQ2JuTVF3cVJUREZiMzJCUEY1N3FOUkw4OUFMOHRkek1GOVM1UEpi?=
 =?utf-8?B?VFZEQWpJek5wb2NpRTBsWjNBZFVhaW1nZHQ4YnBHYVpGamZYd3FmQWpGQXFT?=
 =?utf-8?B?c3lmNnlYMUtlRDFmTE53aFF2emJ1Z0xiaTZjQmFyekxwYkUyV2p0SlhlQTFD?=
 =?utf-8?B?b0tRYXNVbGhwSFdlZ3dXbFhqN1hycGIzdGJLYlV1S1Y0UTR2K1hJUzRBbDBh?=
 =?utf-8?B?cVJUemVvU1FQL09ITXdCaFBWeDk2dVFMK2dpV3YyVzZ4YXhJczRHUHFGV1Nk?=
 =?utf-8?B?WGVMOXB3Y0t3VWhSTEVLdkdBZnNoaUl6VkxMR1ZqVFU1SDVZQXR3VzhwVFVU?=
 =?utf-8?B?T2FEOTRlK3cvWGh3YWF2V0NlbVpicEwrKzRUdXJJWkpxMGFmeUsreGJmVlNU?=
 =?utf-8?B?UmtVNXJmWmZhNjczak5HNXpvcUtCMDlCNlh4RW8vN2hNR2VIZE5ndEJlaTF0?=
 =?utf-8?B?TTJjZHdWZjhzSXJpdlZGWlVKWVF0N2wyYXpHMDl3RzBWcnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0NPQVBPZnF6dThPM1BSSGNwN0FlVGFXTlFZSFdSUVdybFlpOWwxdjhLSy9K?=
 =?utf-8?B?WVgwL2NGcWI3c0dHbXM0Rm02d0tWMTk5VjRIZHdLMEFIQVhkbjBRcEJVekUw?=
 =?utf-8?B?cFhIMytkdHlaTU5hT09WZlJmL3p2ZHZHTHVBY3hxTnNCRkZWd3Z0UitIZzg1?=
 =?utf-8?B?TnF5c21USHl6dWc3Y1paaGpSQXNKeWIwRDM5SHZBYTdaYVZNcnlHalJsRFlh?=
 =?utf-8?B?Q1lrZWkxUHNqakUyTDViZHNyNURlT05ZeG1lWCswTFdGWm1VaUNtZEFIOU8z?=
 =?utf-8?B?cStZMG1TZmR2ZytxeDluVVc2OE4wMUZtOFRMb0RMTFhNWW1DbVdTeEhabTZS?=
 =?utf-8?B?UzFFZVllU2phOVdwUFpqaDN4dFd3TSs0eUNIS2h0RVEycUc3cjE5T2NDeDEw?=
 =?utf-8?B?cEEyazdqaXY0c2FKaHROM2RiYWU2bnNFNWJzVURQeEdqN1hRSkZmRStueHgr?=
 =?utf-8?B?RDB0Q0JmNTlhdjNzdGtpUWRrK21mQXVNTURnY3R5NHFaNHBLYmcwcDNscm4w?=
 =?utf-8?B?eUZCby9IVVBFVGF2N2hIOXkySFpZYlNqRnRJRlRKSlJrc01MaVh3NWlycUZa?=
 =?utf-8?B?L2VKU3BseHowaCtLZjFqQjJxU0hBbGdKMmZJWDRxTW9aYjdvRmNNZnplZXdp?=
 =?utf-8?B?ZE8wLzVTMHZLNUpCb1BrTldSKzNkb0dRM3ZscGpiL1RTSlVmZmVNSmVqNmNh?=
 =?utf-8?B?R2IzMksyZTA1MTlRNFRUTk92RHprZFRleFljeTJ0c0RMaklNM3h1eE9HQVY1?=
 =?utf-8?B?bkJIRGxKWWNzOUNBTzJONDliTk5WODVKYzJSRnJjMmJUeDJLMTZEamc2K0FP?=
 =?utf-8?B?cS9LSzJ0alIrWHAwOGQ5YjZpd3pvb3lUajNNanZ3aloxV3RJNE1CV3BFbkZn?=
 =?utf-8?B?Qy9SbE9rR2phT1B0RDlZUVR1RC85bHFiL1phYmNrVVVFQmhucjZVWWovZzdt?=
 =?utf-8?B?M1ZkUG92bnoyRHIzcFh4c3pJdzA1YjRyb1l2ZGJKTFpBQWZHdE5lMm1Rd2Rv?=
 =?utf-8?B?d3RMOHJVT0xwaEhtcm9TV1VlK3IvdUhUVVV2TnlhQkRGR0JManh2OExnbmRX?=
 =?utf-8?B?UlNJbms4Ukp6MWdqQmlCaDE5SXpKVzFnb3c4TFlOUHZGTXRRYVc5UDRxYzBw?=
 =?utf-8?B?bVVISkEwN3Nvajk5WXZMWmRSL3ZJMFRSbmUzZlQ4Yzg2NnUxL0djQ3A2eDQ5?=
 =?utf-8?B?S0dkYTRZZ24vR1l2NU9MU3kzcjVvekVwdGlMMVIzM1FONXJHWXB3MUZoSDA3?=
 =?utf-8?B?VDVEd2loNFNXU3JydTlRV3NDQzE0UlZUZTM5Zk01bXYxSVBId3lHVW5JT2RD?=
 =?utf-8?B?bStUNEgvZ1FaNlBNYzZtTEVzK1REWHAwUVFxZWFnblE2STAwQ1RvVjFReWFx?=
 =?utf-8?B?TExYUWtsY2YrTDhqd3YzNjR5Rk9RZDBTdTFCSlk5TVNXdGlNT3kxWG9RVDhh?=
 =?utf-8?B?aUlhMWRzWkR6UFBQaHVJOSs0Ry9uM0ZtS3FXbFhsODlsQlJERktIeXJRSHJK?=
 =?utf-8?B?aFhlRmZxaHRjOUJhSXRCZFRGdXZxcXFTcUN4d0tMSlNVeHZway9PQmZwNnl1?=
 =?utf-8?B?OVFjSHdvcTBmemwyQy9VZ0Uzc0hHVXpMYVR5VEZYaHFIeUVNQ3Q3UFAyRVZB?=
 =?utf-8?B?ZStxWTRCenpaZTVyWStwYXJQTHBjRG1SN250NXlhaEozb09vTTA0Rm1JWEw4?=
 =?utf-8?B?UU5GZzVpeHJuNTMwRjN3QVk5bWcxWlUweUhiTU1Od3dGTnNOeVBhZTRHdlZF?=
 =?utf-8?B?WW0zbnR5K3dkU3ZKc0RyOTc1Z0RSZHNzbFhKSWtXakZ5VDM5dTFYcHdpRmNm?=
 =?utf-8?B?TVVza3NEZjJHNVAwY3E1Rm8veTgyU1NYOW9jU1BRdXJxVkhtKzZEcGQ4Mi8x?=
 =?utf-8?B?K3pzR0hod1VtQ2J0a1BPZUlGUjI1WVZXYXdEZHNVZ1F5SWdkTTdQUnUrajVN?=
 =?utf-8?B?bFVBbHBYa1QwdVZSeW9PT2FHaDhJQUk4ZWs2K0NnUS9vUW5jUThPZE85L2FK?=
 =?utf-8?B?ZUJpcHNRY0hHTXRRdlNZenE2K0E4N1ZMKzlWMmgxWnFKeXFqNzBRTXZYTXFN?=
 =?utf-8?B?ZHpGWU51cUVQVFNBQlpJaDBoWlpHTWhTaFVnQi9kMHZ5bzFKNm1tckp0SVU5?=
 =?utf-8?B?ckxqZUtvTXRJZGRIL0tsMEFMUnhYNmMxMU1EUjNHOFV3U0s2L1AyS25UUFlw?=
 =?utf-8?Q?kld8ZzJfH6RlqAj4YW+h3hM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35829a87-ee26-4337-6d4c-08dd9ed915dd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 17:48:57.0119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JUdg/4pIg+0f46Ww21c8BuhC/yP9M6J/CkeujvzgVOJM82GwwlJe/cVIlJIkUwi/55b6ai8riLpnj5Mxi3fr14tnnMbKi7GoXhUspnt0Ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7986
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

On Thu, May 29, 2025 at 12:23:59PM +0530, Riana Tauro wrote:
>Add a test to validate engine activity by opening multiple
>PMU clients and check that they do not interfere with
>each other
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 60 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 60 insertions(+)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 21b294167..225b3b42e 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -46,6 +46,10 @@
>  * SUBTEST: engine-activity-suspend
>  * Description: Test to validate engine activity on all engines before and after s2idle
>  *
>+ * SUBTEST: engine-activity-multi-client
>+ * Description: Test to validate engine activity with multiple PMU clients and check that
>+ *		they do not interfere with each other
>+ *
>  * SUBTEST: engine-activity-after-load-start
>  * Description: Validates engine activity when PMU is opened after load started
>  *
>@@ -612,6 +616,58 @@ static void engine_activity_load_start(int fd, struct drm_xe_engine_class_instan
> 	assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
> }
>
>+static void engine_activity_multi_client(int fd, struct drm_xe_engine_class_instance *eci,
>+					 int num_clients)
>+{
>+	uint64_t before[num_clients][2], after[num_clients][2], pmu_fd[num_clients][2];

This can be

struct client {
	uint64_t before;
	uint64_t after;
	int pmu_fd;
}[num_clients];

Also, if num_clients is only ever going to be 2, you could drop the 
parameter to this function and just use 2 internally (maybe as a macro).

Otherwise, the test/logic LGTM, with or without the above change, this 
is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh


>+	uint64_t ahnd, config, engine_active_ticks, engine_total_ticks;
>+	struct xe_cork *cork = NULL;
>+	uint32_t vm;
>+	int i = 0;
>+
>+	vm = xe_vm_create(fd, 0, 0);
>+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>+
>+	for (i = 0; i < num_clients; i++) {
>+		config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
>+		pmu_fd[i][0] = open_group(fd, config, -1);
>+		config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
>+		pmu_fd[i][1] = open_group(fd, config, pmu_fd[i][0]);
>+	}
>+
>+	cork = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
>+	xe_cork_sync_start(fd, cork);
>+
>+	for (i = 0; i < num_clients; i++)
>+		pmu_read_multi(pmu_fd[i][0], 2, before[i]);
>+
>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+
>+	for (i = 0; i < num_clients; i++)
>+		pmu_read_multi(pmu_fd[i][0], 2, after[i]);
>+
>+	end_cork(fd, cork);
>+	xe_cork_destroy(fd, cork);
>+	xe_vm_destroy(fd, vm);
>+	put_ahnd(ahnd);
>+
>+	for (i = 0; i < num_clients; i++) {
>+		engine_active_ticks = after[i][0] - before[i][0];
>+		engine_total_ticks = after[i][1] - before[i][1];
>+
>+		igt_debug("Client %d: Engine active ticks:  after %ld, before %ld delta %ld\n",
>+			  i + 1, after[i][0], before[i][0], engine_active_ticks);
>+
>+		igt_debug("Client %d Engine total ticks: after %ld, before %ld delta %ld\n",
>+			  i + 1, after[i][1], before[i][1], engine_total_ticks);
>+
>+		close(pmu_fd[i][0]);
>+		close(pmu_fd[i][1]);
>+
>+		assert_within_epsilon(engine_active_ticks, engine_active_ticks, tolerance);
>+	}
>+}
>+
> static void test_gt_c6_idle(int xe, unsigned int gt)
> {
> 	int pmu_fd;
>@@ -889,6 +945,10 @@ igt_main
> 	test_each_engine("engine-activity-after-load-start", fd, eci)
> 		engine_activity_load_start(fd, eci);
>
>+	igt_describe("Validate multiple PMU clients do not interfere with each other");
>+	test_each_engine("engine-activity-multi-client", fd, eci)
>+		engine_activity_multi_client(fd, eci, 2);
>+
> 	igt_subtest_group {
> 		int render_fd;
>
>-- 
>2.47.1
>
