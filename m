Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769FFC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 12:03:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1783610E44E;
	Wed, 14 Aug 2024 12:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kbf8zDTf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BD510E44E
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 12:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723637000; x=1755173000;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=M7YX8Np2KSt/GTmReXZuwDkbbSiIwWqEfY1QVXD+gk8=;
 b=Kbf8zDTfQdVN/34RbJvknUGoFhiDxzs0ToXoX2qAr8+cVCxpNiIoQo2y
 O8LNRSBXhvHwFtNnTEwZKYuXgh2w4i+5hp3VbsSlEyvC5kF6QQusG4MTb
 eiYpuxoYq4e9PA3lmdp3V+he0zz0SE4+lXOpqLId4bdTvrmTRSrwNLjFM
 vWxOtdOqwBatGl2WeemkPwCtqW4Hamx14qE/0QuvPjWZXqrnoyW23KSCw
 Wq560tp+0OmyySxiE5QmE0L/c+ilEzhkAeG4CP67dznS7OzC2BZUQ5kZE
 5ib1dEeMauNyaCqgPdOJij38MwDEyW1ybYXpwYixEu7nk+7fbZHwaynA7 Q==;
X-CSE-ConnectionGUID: iP/whvXdRrCSZFOgp+aOIQ==
X-CSE-MsgGUID: doe7ml9BQKuVcBHPoGrJAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21814872"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="21814872"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 05:03:19 -0700
X-CSE-ConnectionGUID: yGFICI06REi2oyugJD1fow==
X-CSE-MsgGUID: NcOCqlLPTn6aV/gI0DyOYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="89685027"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 05:03:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 05:03:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 05:03:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 05:03:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 05:03:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MA7Y75s8yl0+aNrdxy/QqV5Hj2bCbjSVtQst5PgBy9Rhtnc0tBDA5UDEnpAtNjHsmF41OHZgr0eUOayOcXxHFcKpW2pI3o0tnLDd1n+k7v8LM0Z3mcuFBKZSZ0uQpAN7SImtNrXQCtjpiGCgrxCigMD9aLrsTuN5WG4tiMFbpXlji3nHU/ueN0ubZUkG4ya83lPKAaViHgrcArmiyC34QYgoN3DMDPqSbQGIRSrBd+FBPEaQayVTla4ulcBHlANiTvxRYuEQ93zqa4a4f/1q/eiXdi145xz+tCiRJEyBmChEo6mn8vRNZxjWCTqMoE2GCrxtv02xcdb355YPjaVbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTU9dpkMLSSGbMvOEbiafiuMstuRTdolclwVzi0ARBM=;
 b=mCY6yeoA/eg50dAFnI3QXiV2Z3qxfdqHMkqsyiStIRQ5QnYA75RrN+OBQ11/N/XxAk25KFCMkXebB88EeErM3PvkmeI41IZ6yJVvDGIRojV/4fg7ups63rfiVcFYFWwSN3k0rqFsUwrrnJvBIqeF3qJDNV2wOeAuI9HrJoXHZLaE0SinXgoK8XiKSxvmGokzrizakeffQKccF3Il02PkrNzTmes8LyIt+3z3iZ/o4EgdAtcPH1lxBcjaFGmix6mzrV5WdUkTVWe7bF33/l9IHggDuoWXjS0g7Pa14X+qJwCSR7aLwkxdK2JkEX589I/69Qvsq/GZ32jHzkSIiU3Kdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Wed, 14 Aug
 2024 12:03:15 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 12:03:15 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240813152141.3151865-2-lucas.demarchi@intel.com>
References: <20240813152141.3151865-1-lucas.demarchi@intel.com>
 <20240813152141.3151865-2-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 2/2] intel-gfx-fw-info: Allow to print checksum
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, John Harrison
 <john.c.harrison@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 14 Aug 2024 09:03:11 -0300
Message-ID: <172363699168.1939.14120036984031801571@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0185.namprd04.prod.outlook.com
 (2603:10b6:303:86::10) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA0PR11MB4719:EE_
X-MS-Office365-Filtering-Correlation-Id: fab97148-ad1d-40cf-b3b9-08dcbc59140b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTdjdFU1WDk4NVc3cVhqd1VjNzNsalhkYnBzeE0xeEZHdU01d2ZIczNaVGdI?=
 =?utf-8?B?WVdOM0xFelBxekxST0lIYjlXM2JlM2txOERTRTFibTh6bS8wOFk2Q0lIeE5l?=
 =?utf-8?B?VVhXNVBOdWZKZUs4cVZvdmhUYUtnRU9MbGwwYzI0NWM0ek1ySUorV1dtSW9z?=
 =?utf-8?B?bkRKOGhiQnBXQ0FuaHZGSEtVNmZTZDZjY2tCNmpQT0t5L0h6aUQ0VEJXcW1a?=
 =?utf-8?B?TGYzTnhWanhXa3JuY1E1OW1qcTVYOC9HVkdsRXFMVm4yaXZqRU9ZOCtsakRU?=
 =?utf-8?B?RUlkUmJsYUFKZURsQlhxYzIwNXQ5allBK0M4S3hBdVA1eWdBS2k4VGkrZ05S?=
 =?utf-8?B?QWxkREhwZzZ1QXA4TVVLN0Q0d0NhT0MzdVNzc0lMSDlYZjNKNEVSMnRDVi9z?=
 =?utf-8?B?ZS81bE5BYm1RNmxWMzFoV1kvUlRlYlpnaS9UclorTUtWcTBxT0ZLM0lJQzFR?=
 =?utf-8?B?ZUpFTWNpYXhxdU03SFdkckZrS3kvWmhZQS9nMTkybkJlalEyZHR2WnNQY2Vi?=
 =?utf-8?B?Q094Rm5VSXpZcHdyNjMrQXNjV3RteEtlYU1kSjViQ29aSEsyZUxGN0llbi9B?=
 =?utf-8?B?cWNKdmcxNUxqcTF3eG5wV0tndk10UEF5cm5McnQyMkZRR2RNSi9FQnNoUzNF?=
 =?utf-8?B?Zjk5ZXM3MmJWeGlyb3RBejFvRkE3R2ZvSzdETG90SFQ4NXV2WWZaVWswN09i?=
 =?utf-8?B?Y3UzZXB0ZWJTRlhmQm1FUTR5SFg5NkFBTjdrUUtKYU5qRU9OUFBaaU9ocXJJ?=
 =?utf-8?B?M05BUS9nWXlUdEIxTVI3a3NkN211c1FVVFJUdDNmNDF1UWsvbGo5V3pJVWNX?=
 =?utf-8?B?Ui8rc1dLZ29UY09reEJQUlhrbGc4aDR1TW16TTlEWDMzaW1pMHJEWTBsNHNI?=
 =?utf-8?B?OTV2RTQ3bWlPUFNMcjZjUHBXd05uMUlZNTF0VmJySitzdnlwMytsZ3JxZ3Bx?=
 =?utf-8?B?QlJjRVIyTlIxMU9KYmRtbUdHNzYxTW9TZGpHYXhqZy92eXhFallIak40b3oz?=
 =?utf-8?B?MENCTDBrUW40VU9MaXFDYmJJdTFBckVzTlB3SUhWNTN5dWdnSTYxTW53cWQ3?=
 =?utf-8?B?N3NDcHlGWTVOWTlpV3E0YzFWOTNTNlFYaXk5ejhSOHRNWU8zdkFvZlU5TUhD?=
 =?utf-8?B?c0tMOU1hdGcrYnB6Z2g2bXdiK29nUWROejdiUEFkOEV5dFdxTmxURmpCaGx2?=
 =?utf-8?B?M1ZMN2RPVjB6TnVlb0hJeXFvaVlIOC80cC8wMGtrS1F3TGYrT004N0NuVi84?=
 =?utf-8?B?M1dtZmVVOFV1TVhzQUJyQnZoUlNNaGp2RnJ6eEdncGEvWnp3T21IWjVQdzNl?=
 =?utf-8?B?M2J1MHVXSllGYnJmeUFZRlRkdGxTSGVqa0M5Y1lRcmEvVVpLeWZkUmNzdXNC?=
 =?utf-8?B?MWlCRWpHT2c4U3lOUDhaTGRaM2dGekNtbG5LdjRJT3o2bU5rOWhGSml3STA3?=
 =?utf-8?B?NzU0eWVTRGlFekF1Si9VVXQvbWJ4ZlhrTlRFVHA2T1FzNHRUbXRWUTM5anhX?=
 =?utf-8?B?d0tOSjQxaDBueUg5TWJYM1lOYlhJSFJ6WWxxQ015VC9DQlc5ZjJ2eXZmR3dP?=
 =?utf-8?B?Q0g5N2o4UWUzelVCT3RoR3FnZThocVREdzN1NTZobEV1bnZVY1dhdnczdGs2?=
 =?utf-8?B?MVA5QW54K3dpc2tNM1JiSnRCdnNWLzJOOGsrTzN3blAzZEs5MzJMOVV4ZmEv?=
 =?utf-8?B?SFNCVjhIZHlreEFwRXdLVmFpTFFaMWRSUHhLWVQ2REx1eWVRcEVodTVmckVo?=
 =?utf-8?B?MWhqQWloQ24xNVA3Q2VtMVhYdk9VU3hqU0JleEQ3VlFIdGlwQlVrTzVqSno2?=
 =?utf-8?B?QjhDZGJmNm1Qcmgva0Nwdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MktJK294Nm1hLzBMUXg0UzJKZ011ZkdpMkhFcTA0UmpCaExUeFVvMUJMQ3VX?=
 =?utf-8?B?dEllZURndVptT2JkcGVwTE42RnhMa0poR1VTdUlWNzdMaS9qamtWSWp0aTBi?=
 =?utf-8?B?Q2tPZVN1QnlGRThyeVpWMDViR2lULytMdDROMDAyTkZKM25vcTErWXB3RlpL?=
 =?utf-8?B?aGwwZUNJc3BjdjRZaEN4Qk5wQU52cVNsZThHd3l0REFkU2Y5dHRQc0NNejBt?=
 =?utf-8?B?MnA3UUoycUwrU01ZSm41TlY5OGtjSXFFSktMSDNQY0dtaTlzOTd2dllxOU1E?=
 =?utf-8?B?Z0x0b3QvTVlydEdvMmFsdXI0NkU5clRMeGRJcnhLYnE3dm5lekhFSlF5Y2VZ?=
 =?utf-8?B?OVg0V0dQbWVGSUc1OVc1b3B0M0psNzJGbkZUQ1I3R2JWNXdCVjVaL1dJa2FR?=
 =?utf-8?B?SHF5eTc1TExMOCtteGJUVTJKYkY3S0dmdHhUVmlwZFNPa2llc3doZUtnWEVB?=
 =?utf-8?B?eXdRQmtLZFRiRkZaRXZTdVdGWi9zbWRmZnVHNGIwNlZaNnhGSHVvc0VUbmZW?=
 =?utf-8?B?aDFOUExQbjlnRkh6NkhhWHJHUGFiL25naFBvRGd6dm9VNGZqRk00OEVKRWU1?=
 =?utf-8?B?UGV6c1RHQzNMQVcrZitmM0ViY3BkSTdSTEgrS1lwWDFJVVBnWVRFMXd3ckNJ?=
 =?utf-8?B?L1BiYThSb2x0RjJaQlBybHNCNkIraHM1UjQ3WHF4ZG5CRWFJYm0vcUlUemY0?=
 =?utf-8?B?cW00ODVmZ3FrY0lyamlZdTJjRy84UkR5UVFBU2hsL0pLSVFDQmdGcFJIcDlK?=
 =?utf-8?B?MThXVzlONDg5ZC9ZcWl1YXR1ZnZsM05PUjY3UFBmTk9wWHFPUnZ6cStXcXEy?=
 =?utf-8?B?cWhVMnBaTDNKaWQ0Slk4TitlQkIvZVo5VTdYd1NhSTkwd1FSUnpzaFNQWkUx?=
 =?utf-8?B?RTBzVUlUSEJjaUJ0UmovOUV1M0t6ZHpzN0g3Uk1HQ2VOQmNEdGUvK1IrQU5i?=
 =?utf-8?B?WjQrbzBIV0RCVmgxaTJyOXhjRGVNemgxaks5VmZhQTR0T2FCTWFxNitybkNN?=
 =?utf-8?B?aHB5RXFGVyt5RkZNbGdPZVk4bmROVm84MzJGd29qTUlkekd4Z0NjNVcxM1VS?=
 =?utf-8?B?RVBjNjEyUzBCeDkwaWxreTR5TnpMQ1ZnUHFWZENsMjR4MmVGaDdjNmZUN2Fj?=
 =?utf-8?B?RHFBOVhXNUcxSnE0cEZpdzlHazcxaDVCeFRaTXp6WnV5ODFIVmJVWkxFbURQ?=
 =?utf-8?B?RkJKWHlPTzhvZHZvajlhR2RtSzRCeWwvVkYvUzVML2N6RWFob1ZHSDc0OUwy?=
 =?utf-8?B?NWNGNXg4TU8wUGM5TXh5YzRZRXR4eTBLeGFJTUp3eWRaODZJU3RJblpQVGt2?=
 =?utf-8?B?aXlqaEZQNTBYZjltOU5VMDJTSHRKUXdKdXRBKy94RXcxWVJxczlPd3RIWG1k?=
 =?utf-8?B?K1VDRlZFVWdjNUFTU3c2ZUNCQ0RqMDVrUW1rc2w3RGZhU05iZFBQNnM2Ukd1?=
 =?utf-8?B?S0UzaDJXQ0dGV1gybDd6U1pWYWhMVlVEeFY3ZnQvL0RQUHVnR0J4WDI5d3po?=
 =?utf-8?B?eGpFczZvUXNVck15NnRYTmhmQnE0bGhZYWwzSTVueUE2U09uQmJJbEM3ZmpQ?=
 =?utf-8?B?cmtNMW5pdzZNbU1rZHIzZmFLbXFhU1p5T0NXYnI2b0h6Zjc3eVZUOXFEYXNV?=
 =?utf-8?B?cTlQRjFTaGkvVmw0aVlVQ2RFaTdLdno0a1VodXNtUXpTS0pWQUkyaXIremhF?=
 =?utf-8?B?emlOb2Nqa1ZUZ3A1MkNkZUo2S3VBbUE1dlBrdGRkNTYyQXlWQmoxZzMzQVBR?=
 =?utf-8?B?WUNTYkkrN1N2UlFUVjVEcjBLc0VwMFNzME1PTVp3bjVBZjFJWEUwYnNpYUxs?=
 =?utf-8?B?dnFUdFNhL1MzMUo4eWtZSlZ6ZjJnZzM5WUJQdDJLVzd6L3pjaVpNbjBUTlpU?=
 =?utf-8?B?bjBwMDJUR2RzalN5bGQrQmd4LzhqU2lDclllb3kxOTI4ODhJcXZ1TGRpNllX?=
 =?utf-8?B?UGdCaXJpR0FXZXVBSXIrb05SWTFQODhNNjhWTEszUmRFT0MwOVVGWEVLMndv?=
 =?utf-8?B?UVdGcndxRkhpNXQvb3VZdDZLZUhod1NDbjlNaGV4QWREYlJUODB1bEVxVjR5?=
 =?utf-8?B?c2NMVUMrcGFSMmUyL2ZMMmxSYlo1U2lyOW9OQWRicXdtTk54Mi9XT3k4SU9q?=
 =?utf-8?B?UjRwLytsNlV6bCtoL3FuS0EvQVJQNTNGTnZBZXRGRDZlbmsyZFQvSzZmb0Uy?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fab97148-ad1d-40cf-b3b9-08dcbc59140b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 12:03:15.6467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBkZSzLhB076QsNHVNz2B+1Zo2tFScl+1mNLHxpz/NHo3ta8yuX81/rzzxOrHJLTE8uUgIZaAP+bqcMbnjS6LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
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

Quoting Lucas De Marchi (2024-08-13 12:21:41-03:00)
>Choose a checksum algo and use it to print when parsing a firmware.
>This may be useful in CI to dump what is the exact firmware used
>and may also be useful when inspecting the firmware repo and making
>sure mistakes are not introduced. Configuring intel-gfx-fw-info a diff
>driver:
>
>        firmware $ echo "*.bin   diff=3Dintelfw" >> .git/info/attributes
>        firmware $ git config --local \
>                diff.intelfw.textconv \
>                "<path-to-igt>/tools/intel-gfx-fw-info -c"
>
>Example for the LNL update that happened recently:
>
>        firmware $ git diff --text bc42cdc34bd8 b5bef5bdbab1 --  xe/lnl_gu=
c_70.bin
>        diff --git a/xe/lnl_guc_70.bin b/xe/lnl_guc_70.bin
>        index 785763163..75a1958f7 100644
>        --- a/xe/lnl_guc_70.bin
>        +++ b/xe/lnl_guc_70.bin
>        @@ -1,3 +1,3 @@
>        -version: 70.20.0
>        -date: 2024-02-09
>        -checksum: 0809f459048a23716fd3019074f36812163e027835cbb43acfcfe72=
cd83fb0cc
>        +version: 70.29.2
>        +date: 2024-07-26
>        +checksum: e7ceae28b06bd71c53fe177f4f6787aac88956d8944fa02b1ab2ec5=
3b1e961e4
>
>If for some reason there's only a checksum change, something went wrong,
>and without it we wouldn't notice when using this tool as a diff driver.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> tools/intel-gfx-fw-info | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
>
>diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>index c0d9b00ac..31dc78776 100755
>--- a/tools/intel-gfx-fw-info
>+++ b/tools/intel-gfx-fw-info
>@@ -6,6 +6,7 @@
>=20
> import argparse
> import logging
>+import hashlib
> import sys
> import typing
>=20
>@@ -151,18 +152,26 @@ def parse_args(argv: typing.List[str]) -> argparse.N=
amespace:
>=20
>     parser.add_argument("-x", "--raw", action=3D"store_true",
>                         help=3D"Also print raw header content")
>+    parser.add_argument("-c", "--checksum", action=3D"store_true",
>+                        help=3D"Also print checksum")
>=20
>     parser.add_argument("filename", help=3D"GuC/HuC firmware file")
>=20
>     return parser.parse_args(argv)
>=20
>=20
>+def calculate_checksum(f: typing.BinaryIO) -> str:
>+    return hashlib.sha256(f.read()).hexdigest()
>+
>+
> def main(argv: typing.List[str]) -> int:
>     args =3D parse_args(argv)
>=20
>     cparser =3D cstruct.cstruct()
>     cparser.load(CDEF)
>=20
>+    checksum =3D None
>+
>     try:
>         with open(args.filename, mode=3D"rb") as f:
>             magic =3D cparser.magic(f)
>@@ -171,6 +180,11 @@ def main(argv: typing.List[str]) -> int:
>                 fw =3D FwGsc(cparser.uc_huc_gsc_header(f))
>             else:
>                 fw =3D FwCss(cparser.uc_css_header(f))
>+
>+            if args.checksum:
>+                f.seek(0, 0)
>+                checksum =3D calculate_checksum(f)
>+
>     except FileNotFoundError as e:
>         logging.fatal(e)
>         return 1
>@@ -181,6 +195,9 @@ def main(argv: typing.List[str]) -> int:
>         print("raw dump:", end=3D"")
>         cstruct.dumpstruct(fw.fw, color=3Dsys.stdout.isatty())
>=20
>+    if checksum:
>+        print(f"checksum: {checksum}")
>+
>     return 0
>=20
>=20
>--=20
>2.43.0
>
