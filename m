Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C3EC7115B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 14:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA3610E3C6;
	Mon, 23 Jun 2025 14:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Awn54VS0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D99D10E3C6
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 14:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750689230; x=1782225230;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=0wetLG0Bst4F2cpZcGdXbC0edZF3RDDFZc+5tNzlJdo=;
 b=Awn54VS0MACFmkkCdTlGutcToa1nVTHaFS73eTN9TdHCJXaLlzfz5REE
 6wBRLDrGzXy6IcOETg6UqhlN0mfXl16q6iup3CYG9ol0ZuBwWJwnuch8D
 TbqIYDHlue/duyi7BSCPEu1zYN+mADz60dG8JG3Qm7Hl6tt662QVpWKJI
 eAJyG7aRPU/edBEDQL/TPDHnmvMYX0cK5iGy5DKa2JQkRatAPtOof8RpJ
 c4ke/ocDS9WARMtrkmfspXR/swKWHExMAxJSpQIA5fZrPlx45RfjwiGTb
 l18Rkk20BcfQ8WiMBlyMx4juPbuDToCADSjV/MWm/9Mqd1AaFf2IZIN9H w==;
X-CSE-ConnectionGUID: QJ9+OehASHioda0V9EsfkQ==
X-CSE-MsgGUID: 1mEMAjspQfGVb+sQPh7CEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53038667"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="53038667"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:33:49 -0700
X-CSE-ConnectionGUID: pOwqCWaYTRaARiDypM1cGQ==
X-CSE-MsgGUID: fp5EGecDT56FIGVE5s90Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="155993276"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:33:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 07:33:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 07:33:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 07:33:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3TeFlmBiJewyFOzlfCBjXN/BIIbCxmbCrhXQQeWGpMbXRb2N4dIA4v7v9Ds0t/QRZzoL54erzOSM+igPBSD0IXzjRCMCZdbiqm9wTSuGkp2C/hR7I1wWO+HtPZaA8iSrAANC1s6GwNMb9gvZ9jLMPnvWJmmxtw94YAZneePaG0JpgB6Yx8RmYxq7iPQMQG7gW3v28+ZacifJkk2cgIctS1pgM0D7P0HrRtdLCWkvRieXwZCoSmGh5KB8cJ3e5kB+4CNMBhow25/qwcZsZZG8YxHq6jkawxNoGSuPtwm7PEEKDs9rSeBECC0jJgNk2IHDrfYuqRACDa35MkDPvbcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wetLG0Bst4F2cpZcGdXbC0edZF3RDDFZc+5tNzlJdo=;
 b=MeTdv8VWVk+HOelXUR0VB/wFGLKfMKT/LPV/BN4PF4EjmLaA0b9jxf0KoNz4wgYFpBEsj/Jh8lQTsnzjQ/nNEp9PPVDiezJnJp3DAeaE9OES6wdrpPlD/1SgyoRsmJVhNk6jppAXldLJfhebSe20PO5+Lxc3Nj/aTjeCJ0fY7+Qc+INcCFxpUFk5LPx9fQQPdgAuikhSh7V5eRoRlSPQz+BFG3bgAGyvLK4f4R4qpnfHk8fWvf6vorfYGvgz1xDroxr4gF7GDNSE4aGWc1fBjIHcE/r0UYvcjQaP+GeKHU6872sPNbEogCw2SRRhMvo6ot2u9eMK6gQ6std7BeLmHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH8PR11MB8064.namprd11.prod.outlook.com (2603:10b6:510:253::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 14:33:41 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%4]) with mapi id 15.20.8857.020; Mon, 23 Jun 2025
 14:33:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Jun 2025 14:33:36 +0000
Message-ID: <DATZJ7EAK3JI.3SI7CWXG1RMJ2@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <andi.shyti@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t] lib/i915: Avoid non-canonical address dereference
 in gem_has_relocations()
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
X-Mailer: aerc 0.18.2-107-g4f7f5d40b602
References: <j6ll6li2qmkk3gwamz36s4saf3ehp6qutkxl3cc2sbm2i2ujsq@5xel3p4b5cw6>
 <20250618151030.awt3aao74pslavlg@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250618151030.awt3aao74pslavlg@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: DU7PR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::10) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH8PR11MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 3954b8f2-7b34-404a-a620-08ddb262f2ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amVnRlZpVWtkMEtKRW5KNW1OZXRWdnBWazNUL0xXcm9wSzcyVVJOU1hBSHZG?=
 =?utf-8?B?SDNGMEUybU0vVzF0MG1jY0E2dFpFbFY0K1hLQnp4WVhZQ3FUTXRTS1VWbzlj?=
 =?utf-8?B?RlFKREMwQ2JWdFFLbFdWQVBpT28vNkIydVBodWN0QjQ4TFBsOFBSeHdnOTBz?=
 =?utf-8?B?SC8wby9UbXNsTlQrVU9KZTh1RlEvUjJTc3JZZ1V6TkNqbWlWZTRBa0l4SkNT?=
 =?utf-8?B?dlk3cW5DSVpoOU1sZ3RrY2xRdTBGdEZuSm1nbEc3OEhFVHVOOStaZ3FYT3VQ?=
 =?utf-8?B?Q1I5cVJxSkVFYmtWZmtQaWlCbkZYQzQ1TThrTkk3Zzd3ZlpzRGtwTmdNSWxC?=
 =?utf-8?B?U25KVC9lNk51ZVJYRVA5NWlKR0U3MzROUWMyc0l3UTFYL0xmOEd1YXl0Mmxk?=
 =?utf-8?B?STR5bmpkRUxORnk5bzJqQS94NURhd25sM3hWeC9iNDUrWUpvL2N2Q0tWaXQr?=
 =?utf-8?B?UzBKaWRWWlVPd1dsaXoxT1I1aGNlQjlta0FVYjN0LzZxbmlNZVVNTGd2cG5p?=
 =?utf-8?B?R2NidnNkWjlKeHhHUWxlZ0JoTE1CNHlKTE1aYlFubmRVZmtXWkZZbjR5dGtE?=
 =?utf-8?B?cVBYVkdpYjJ2TkMrT0JnRzY5MlV0OTVTcVlJSFoyamRGZks1U3pNeEtPam1T?=
 =?utf-8?B?cHhLMDI2MnVzSHVoZmJqbnAwdmlNYlpDRkdsM0JBWml2MFQ5Vm9KdU80NkFW?=
 =?utf-8?B?ZXF5WUZ3bGJSL25CS3hOd0ZXcjVEWmRDZHBLYkd0cHpScURCbloweEI5bHNu?=
 =?utf-8?B?N1pmOEhtZ1N0RE9KdTM2ZVIybU50VmUxOE9KM1pPYlpwNzcveHEwcVV1NGpV?=
 =?utf-8?B?NlZPSTM2ZVRMdldhcCtud3ZnVHo1UXBCdVVQU3M3YnhZMDRNbGVSaTgvTThi?=
 =?utf-8?B?TTF1RVZKeHRyNmtobndjY1B6MVEzSnF0Vm9qN1dLMncvb3hjck1ZODVyYXZR?=
 =?utf-8?B?RkE3TkZYK2YrN1U5VVp3c0pMK2tNcDIxWnlUMEo3MDlvUUU4RkhVY2x2U041?=
 =?utf-8?B?MVdDZVNHa3Fkb05qTzJub2F2bzk3Y0E5U3N4bE5ybnZ1YTgxaWtUQTVqekRL?=
 =?utf-8?B?YUFiVG1UNGdCV21KVHoyaUFReG9zZW1sL2pFWUdnSGhBKy9vSC90Y3U1Witw?=
 =?utf-8?B?S3FTc0g4ZzVoR2kyYW9ncVBBWTJKR3REOHg2clpWS1FrTi95VFdadjUzdkIz?=
 =?utf-8?B?OWpYa012ekRCaUJDbzQ1SXZwK3pYb0p5UjJNamJOQ3l3Z1RCMWtOdHZ1K0dO?=
 =?utf-8?B?dW4rNUU3RTRZemJPK1pKRUEzaVFKZ1IxYlBjUGhRVStSVHllRy9Ldkg3MlU4?=
 =?utf-8?B?cmV0ZlBISk1PRDk3cFFpZUdWbVJuVVRnREpaU0kxVmRlc3Jwbmx3QWpGU09t?=
 =?utf-8?B?UU45WXdBbGN2MWw3Mmxxc3pZeFJZdkRSYlVJT05LY2xOTExGVjNPa3dFQk9H?=
 =?utf-8?B?MWRnV3Z6WTRJM0E5eElwNXk0bEhwMG51N2prcFhSM0JvRnpTK0RWOGluRkts?=
 =?utf-8?B?OWRhOXptdGVzeENIbXFBdEd3TG1USTNkLzhrTjdXR1hwcE1vSHhGR1RMOTFD?=
 =?utf-8?B?OTVyL2FTRm1TTy9VMGQyU2RYZU9OYjBCenZLQzlIbEJDWnB1MzFxRVZMa3VQ?=
 =?utf-8?B?Q1dmMVJIcDRic2JkZ2pmZW9RR1laQlBXOVp6SG5YaWVZVnpqcUFMeWRlNTJM?=
 =?utf-8?B?NmV0YmV2aTZ3M1YyRXVkSjVIWFozOVdIOGo5cUNTVTd3TDNYcHB6WXdzSjRl?=
 =?utf-8?B?TjdReThmcmRFR2F0S0pNeFFib1d3OEFnVUxSck92MWU4ODE3M2ZIWmxmeG1j?=
 =?utf-8?Q?MIgX7L8QLbPndIruRlB7g29EpuXIegzp3xRnA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enovemZsNVlQRFpJMEtMb2owcUVsVXRWazVLSDJLRUlDVjRwVjZhbDRYYTlk?=
 =?utf-8?B?WGxUK3R2eFR5T1BZYjk4NkRQbkRqNlh3Tkk0QWVnamtoZzNGYWtkT1IrdTlr?=
 =?utf-8?B?dWdScys0cWprNkdrajc3K2VOYTAwMXFkZDFjYm5UK2VVNHJIWFFUU3F0MWNU?=
 =?utf-8?B?NFovcFFoalc1UlhXZkNmcTJyOE1VTW9UVEUrLzlQK2Q4ZkFpSnhIQkxqL0M5?=
 =?utf-8?B?N0NLQTBMTDdTaXdQdC9DdWdWTlpCY0JNU0gxb0d5bjE5TXNVS2FxR0tNdkN0?=
 =?utf-8?B?S1VSTmM3cEt4OGhlaERGYzF6WVk3TGpScDZpdzNGdGdISTNMTW9ob3lDSnFF?=
 =?utf-8?B?dkJDQndoWm9NaTVVTTRnQ0tPcDdybkM3bms1Y2VKNkxkcmxEUUdQV3BpVTRv?=
 =?utf-8?B?K1BkWWphVEJYK05xQkVYNE9CWnp5ZlBzK2tJcTRDQmRKaUFFQzdwcjY1VXNn?=
 =?utf-8?B?R1VqSW91eHF1WEFNVURjSUc4VCtKWUVEWVNEWDVGNldNNWlZWGE5RHYvVWp1?=
 =?utf-8?B?SVFkN25zRkMwSjVGYUh1NzAwbzJaUVo1MmJ3T0tWSEU2K3l2RFNVc1A0QmZt?=
 =?utf-8?B?WkFHVURKZzBNT0cxSlhmM0IxYjdBSytqN1Qxakc5cml6RXpnM1U3RjVJdUZG?=
 =?utf-8?B?c0VIRW9FS3lacjV0cHpNTERwekdnd1FDRlE4YkNUazVNWjhYQkg3L1NzdFEy?=
 =?utf-8?B?SVhxSDBwUndJZEFKVyt1RkZHS2Q1Smw3WjN4QVdsWEU3R01qT1VabThnUVVX?=
 =?utf-8?B?LzU4bGtUNk9aLzNsQzZ5U21BbTgvVUlTNlRuVElnVGN6K0ZOSHpCaGI5elVD?=
 =?utf-8?B?Nkw1WkM4YU55Nlp2YzZ2ZWd4VmdWMStNWnNJMS9BbVNuNFpuenlDSjd1S0lN?=
 =?utf-8?B?Q0NRYzdRU2t6em1qTUYvNFBoWk16WG5YNTZab2EyQzFaRGNxcFdWS1N1OUo0?=
 =?utf-8?B?MTREbUQzTE1xeDk0aDRZQXN2Q0hDbnBDLzlFZklvalFuRXIxSGl1eG5UZ1VJ?=
 =?utf-8?B?OXdNandWNFhUeW5pdFE4Vmp1ZVNuZ1lQMGJFbEtITUU3QzJLRDREZlQ2aTFh?=
 =?utf-8?B?RUpzM0tHUHVJQmNsRGJBelNUMG1SeXd5WjltWnF0VlYyMG9EeDRyZitzdXFG?=
 =?utf-8?B?SHVoczd4UWFBbFV6MlhJNEtZWDQ1RG9BTGNHeU9HNjBhTWdkRmVlKzVLQk1M?=
 =?utf-8?B?eW5zRXJuYjNwZVpkNlhvdGVtcDQ1eHZPVmlXVkhZRktxUjJud2grdVFhbnZG?=
 =?utf-8?B?aFF6TG92eWExajZBUEVlY0NPWFNJQ0p0MzYyRlFFbzRucmdxNDc1L21uOUFz?=
 =?utf-8?B?RHY5bGFkYWRnYjF4aTBzTEVDRkljS2VWQ3FGK0lWYXlBY0RQMzNNN1JzTUlx?=
 =?utf-8?B?MzZVYjUxUlZ1VHltb0xFbjhwVi9idEErU0JSWkpINjBKZVZUUTlBOWExeVh1?=
 =?utf-8?B?VXQ4ZHFIekJjdU9ac2x4SDBVeVMybHVmQ2srV1J2UnpWNzJ5Mm5INkVYNnlZ?=
 =?utf-8?B?NVNiN3h3R0k0ZE5FMWloOXhmYWkvY2p2T0NEZ0U2cjRSV2puSHFBdUdIekJF?=
 =?utf-8?B?TmhXOGhmcE5pZ2RsbkhJenVJS3dlQ0ZnZjM3L080WEFsd3BJQ3dtVGx0VmZH?=
 =?utf-8?B?d21VeE50QS9WdGFBOGJOcWU3TVlmVCtwRkdSV3l3cWhrZ2ViMXVyNDEwR1NL?=
 =?utf-8?B?eGcvaTNTSDJHUFRFOVF5dU5uN09saTdDNlBMeFVoZXNwTmRNSC9NUnhkVmdx?=
 =?utf-8?B?bVF6WkVoK2t2Y05KbGZnQzBGSEd6WXF4dDBSYm80MjYwbGQ1eTc2dEdiblpi?=
 =?utf-8?B?Q00rK1NrRUlPSVVjVWx2MDdZWXV5UmJFdlRvUThyakEvdjFudkxJTWozeVVR?=
 =?utf-8?B?Nll3Z0VadCtOcnNPekF2WDl5MFpUMDJMVlV6a0QzcW9hb2xEMExKL25NVmlm?=
 =?utf-8?B?OUR1dFU0VEk4L2RDa2ZkYU0wVmFHR2NrYVo4aXgrNmVDTWdoYnFsd3hGZkNM?=
 =?utf-8?B?QXdDMWJyVVZNeWVUYzRkVytYTUkyL2pHY1J0b2NrYWxZWFh6NWc3bkxLWGpM?=
 =?utf-8?B?cGxUSjRibEJZVjJtWlMzN1lxbGNLMHhtZExvN0JKVDdrLzRXTnZ1SjBlNUJi?=
 =?utf-8?B?L3dhR0hVdDZHUDlUaG4yN21XM2U0OWY2Y09wZlV3TlJjZjd1SjFXUnNTZGpG?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3954b8f2-7b34-404a-a620-08ddb262f2ec
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:33:41.0762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tdYwXSFUHJIdFZ8iyWQYbHuPbAdPZh+fnUUydA+5jwVS7c5l9NDTR/Y7l9hjYeooxUy9cJ8szfa+P/HOPoDW6VFqLDjFa5ogQ5w8d3tXgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8064
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

Hi Kamil,

On Wed Jun 18, 2025 at 3:10 PM UTC, Kamil Konieczny wrote:
> Hi Sebastian,
> On 2025-06-16 at 14:26:15 +0000, Sebastian Brzezinka wrote:
>> Fix a general protection fault in igt@gem_exec_big@single caused by
>> passing a non-canonical address via relocs_ptr. The test previously
>> used a stack-allocated relocation entry, which resulted in an invalid
>> pointer being passed to the kernel, triggering a crash.
>>=20
>> This patch replaces the stack-allocated `reloc` with a NULL pointer,
>> ensuring the kernel correctly interprets the absence of relocations and
>> avoids undefined behavior.
>>=20
>> A corresponding kernel patch to sanitize user input for relocs_ptr has
>> been submitted to the i915 mailing list to further harden the interface.
>>=20
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
>>=20
>
> Do we miss some igt test for this? imho kernel should not
> make any oops when it is given invalid pointer to relocs
> nor invalid values in relocs.
> What about writing gem_bad_reloc@invalid test for it?

Absolutely. Once I identify a proper way to sanitize this on the kernel=20
side, I=E2=80=99ll add a corresponding test to validate the behavior.

--=20
Best regards,
Sebastian

