Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A616ACCA476
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 14:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBF010EC1B;
	Fri, 10 Oct 2025 14:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KAF0Riw9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B0410EC1B
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 14:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760106049; x=1791642049;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GY+yLkD95lwjNtx57KPuBEJqoG6hA0L1XryQn7ZKOeA=;
 b=KAF0Riw9026ZcpdA6/dbU78BjibduisJurjcOKKlrVl6lJW9CnAF0Ya3
 uz7+/JLh5REIrjc1Hw0WMyNMGEs/eFMcVARk94+ycFtTqb0JjkRc845QN
 FVRayjJarIZZFdpSNbnjE0Y7bWerkZYi4xwknZKF5O8astFGnqISrlpqZ
 OE5viMnAkt34+vBW5+hEAzhaAr9yLrZAyT7AYbxVtWSZhMnZB9JCGsbVX
 xGhS4yYMNSq4Ob43cg2mhtbz0//iUrxv/sC90tfAUPb2WVojotF6Dmv2h
 pk95MUKFYJFSUdrH8Zuxk4oq1yoTCQmE9lNGK5mz+CZhuEiKEFR+w8eKr g==;
X-CSE-ConnectionGUID: WqJqSvAFQAesjxY7lygazg==
X-CSE-MsgGUID: wfkoJeEVQkaLD9Ty9fsTLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66152704"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66152704"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 07:20:49 -0700
X-CSE-ConnectionGUID: 78Le0WtARnSNqKyV5wUMJQ==
X-CSE-MsgGUID: 07ZQXUnuQeaV0SWruMgkgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="180811321"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 07:20:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 07:20:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 07:20:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 07:20:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvOLLC1FvFeOxfb/yVSxcyaXbBDIU7xTRFL+kjcW1RGkDYCRG2LWbVOuopYWhcdqZO32jx1yfOPaRrKzVvlh5pMYjR4L0laDEcddBhVqjjkV468sefSupkm3n/FOi6tff2PrRhakVTdkD7yCJwZC21d4E+nlSNvzT0YaXs7Bc+mU/Ih5byItP4t4ivW7rJygrHl1UyFb2a5JzxxL+ZXgeFpqUyQOgnn4uJ4vYkFAsmSANKqqN4UjP1yn5zXEW0NoXFZqGfskk3k83jXdEULfrNWxOvro1JBNBV/IaAlTbqFOnClrRDxuK36ewUzLHr6xvehbX+OpYw66oQHg6xj9Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGuMIqsNPjXFD0RQdEgS1ZkuO1PuxKFoD3XDWFeYdCk=;
 b=VJCaTdfaP+gRvkb/wOS3KO9VuWNwCh9EsGtrgS05YYiGnx2KYofdMvBa11j+UYc3heeGa1h0PfrnRcWrQmWe742jEV6yOqtFdcFz0S1GHn6pY4h8pY7Ws/QOEImPuqYCxq/UABfuhSLvLM0PDYib06cZZQJ7C2QwH4R5VZCbXN8Gxs7EeclHVP6jET8r7pmEpagT+vDNvynNLOqGc0BfC6DAr73FegTyoDAHDw0TM53rmi7K+ZcIuXOTECl+oiiOszfaN28hvqMTyzhnC0OHSOzlUzdXVNFwaeEEUFAiUDa5DuiXsTUxP+Y52vcW16Qa7R/AK1apfHED8shv6jVIfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS7PR11MB7858.namprd11.prod.outlook.com (2603:10b6:8:da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 14:20:43 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 14:20:43 +0000
Message-ID: <1e895811-62f9-477e-907b-8de1118adfdc@intel.com>
Date: Fri, 10 Oct 2025 16:20:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/xe/xe_sriov_debugfs: Adapt SR-IOV debugfs
 helpers to new layout
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>
References: <20251008150939.670778-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251008150939.670778-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::24) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS7PR11MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: da42322e-0a1a-45f1-ca23-08de08083227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2k2QzBTTGNaQms5Wkxic0VLaFpIWGJ6N0l4QTNINUVWZFBqMUxZaWNwaU56?=
 =?utf-8?B?Y0NaVG9ia0xacS9INHJLb2FBOVNXVGVOZEhUOU5yVVR1TTJ2cFkvOXZGdE5k?=
 =?utf-8?B?UURzSFlXakxnZCtGZzczSWFDbzJnYzV0ZUQvTFZFbTF1WDJaRU93dkF0bW12?=
 =?utf-8?B?YVJhbUhYdEVLM1M3aFpvTitjdXA5akFOR0ZMbG9Nc0x0ZUkvQ3RreWpldnRQ?=
 =?utf-8?B?RklQUkdXOTRaSVFBclpyQzRvZlRQd2JhdWpPNnc4SzdVeHc1c2hhQmpUOHhF?=
 =?utf-8?B?OWVVWG9qYlVWSEp0S0hyRHpPZVJFdFFqYm5CSlN4MW9vVE9sbFZORk5XaEZ1?=
 =?utf-8?B?bmtNSllkZURYeEpQdkgxZ2hWRGlHRFI3RFduVkIwaHV6QVcvMVR2WXdPUmdK?=
 =?utf-8?B?K0VzQzY3OFBIU1VwL3I2OGhSbmFYcVhCMWR4b3JialFNR3dLRExDSVMwOG9i?=
 =?utf-8?B?ZW1lUTV6RlFPQ0JLd3pRVGZiNU9zRmk4djEvdTd2aUNGTnZTWGVPOExqUGxo?=
 =?utf-8?B?Z1kySzFJN2VySTRLWjlISkl1UHZ6SVVSaEJHc3V6RXRzb3A2Nmp2WEx1SzJM?=
 =?utf-8?B?QUZCVWpNNUV0S29jVXNaMjBpMnJZb3E1MEM2c3h2TVBZSjByMGgzTjk3TFFP?=
 =?utf-8?B?WmNyVEJhZlo2L3k5K0tuRWFOcXRmOHJKdVZXUTFmQTcrTW9WbHIvRUdMKzNQ?=
 =?utf-8?B?QjdoYXNzMUxYUFVCcG4xZ0N2cy9FaDdrVHA4anV6S3NSNjdtYXRDeDhybDB0?=
 =?utf-8?B?RGlaejV3ZkU3Sm50bGtsZlZ0VktzWnowYVpjamRmS1phOGQzQUJNSmIvdDhJ?=
 =?utf-8?B?bzhKUGF2OENqNkVrN3MxdlAwWCtsdFJwQ3cyam5FSkptUDYzVTR3bGRKc0kv?=
 =?utf-8?B?Y0p3eURoajZkU1VuVlVQM0hxRDdkRXBxekJSck5OZ1BMNkI4KzFQV1RPY25K?=
 =?utf-8?B?QWQ0RmU4eUhCcUdHcG1kalhHeVgwS0U2TnZHZ01Vczh5S1B6RDI0RjZ5OGFI?=
 =?utf-8?B?eWN3MlJnNTNLMGZnamloOUxHRnM5RWc3aDRSOFJEZUJvMXkwWlR6RXpiZDIy?=
 =?utf-8?B?c3d6dHpFOWRYc3dqalczK05mYTZtM0dETUJobURpMC9tY2NhRVdNbGl4RXhV?=
 =?utf-8?B?Q1REQzN2MEYvelhNT2NybHBYdUl4SGVpTUNmSlBTWnVyNXJOK1hkQXhPWThQ?=
 =?utf-8?B?RUJ3cDdkd3cxaldOUklLRWUvSFRPcDduNHZWbTNWZmRGZ0d5M3daQks2MEE0?=
 =?utf-8?B?ZDlhUWRkYStmQXUvSUo4a2hvdnRKenpKSDd3YVcyZ3MwajUwZzJhS3BoaDFv?=
 =?utf-8?B?ZlYzWEpINjF5THFCQkV0M0E5emdFNWFROUZwUitnano2QkFXcjhNV3JEb2g0?=
 =?utf-8?B?NjFDWmZxRVFHcm1oemZQTTllWmNjK1k4cG11S21hNVVkY2IrTmp5cmZMZDZT?=
 =?utf-8?B?WVAxaU40YnkwZVFibzVwUTRPdThDVTFUVVVOdnM5emdDdWMrMThMRXkvTUxL?=
 =?utf-8?B?eDQ1NUlZV3pVVnYxbXgxdktiNjhUbDl4Vksyc3ZSS1dJZklxM0lOblhQRDlK?=
 =?utf-8?B?YzZaS3lhbXNxZ2YxcTl2T2lmUXpybDBsRElobitqNmhIeFU4TmZzOVBVQWlY?=
 =?utf-8?B?WkpmTXdyWnR3R21yeEdtV3kvd0JMVHlZVFFrNTRvT1BvV0NxM1hra3gyYnAy?=
 =?utf-8?B?M2VWM1N6ckpaQWdrcEFNMXVGZnRFbVlQUVQybDJuanM4QnVVTmtNREhxWFM0?=
 =?utf-8?B?QkhWNGx2K2VDYi9BS0ZPRjFLdDFxaHZvekJIVXRtVi9MMGdWUU43NmwveWsx?=
 =?utf-8?B?M2Exd1JPUTZqaVkrNzhYMTA0b2Q2eUlvNVc0bjdqRlgxWHM4ckw0ZkdTdWFM?=
 =?utf-8?B?TGkvNjI3VVBOYXRyU2NJK0F2V0x0ZzdDMFBma3VGOWZxc2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUV0S3BpM3ZwMXFXb2Jld0pkalFidTBqV0cvd2dMc2pnSVVrZ1JzN0Rxc0tY?=
 =?utf-8?B?aXZ2Zjl0dldpVjRMMFd3Zkpoa3ZuZmwwWDlHRDd6dFhEM3BNdlNsdWFmZDFN?=
 =?utf-8?B?V3I0SnNZKzRxcFkzMVRDbThHRVJaYzJBRFYyQ0l3clFadlV5SGErNnI0OXIx?=
 =?utf-8?B?RlNjWnZpZVFSTG5ZaUk0alpqOGZ2KzQ1K0l5S3NLaVNhYnAyYmhmdGw3dEdG?=
 =?utf-8?B?cGlnWGZMU3U1RDFSdWd1Z1AxTTV5U1JFRmxtR1kxVGlSUVozWm9lcTBwNjNQ?=
 =?utf-8?B?SHVJd1VrZklDcDBaTWtBZHVBeVpxK0hQZE8vREFrdjdOQWE1eGowMmdFaFla?=
 =?utf-8?B?VFFIbGdyZVZLKzc2WXl5R3ZNSHpIYVNxNS90NE1aVGpTOWpleksrUWQzeUhs?=
 =?utf-8?B?VXhTMGFpVG4rdmt1bU9vYzBuV1JxUFpySktVN0tNTXdOZ0hFTzVBS0xtK0p2?=
 =?utf-8?B?Sm9oRU44UDcrQ1Y5REtRdTdoZE41MjRLcUh0ejZPUE1UWTlpdlI5bit2SmVy?=
 =?utf-8?B?OGE2cHpKWHA4VElmR1NDQThVdWwwTjcxTlovZ2RFNGpUSS8vdi9VcGY4ZXpK?=
 =?utf-8?B?VVNXVFEyc0ZBakw2cmxiR01UdlZaU1NETktVM3lMRFEwaVlYMzlML1kzNDRj?=
 =?utf-8?B?eW1QMTZXbVpKM3NNZytzTncyZFErMHlJcE5DeXJRWG5Jd21rZ0g1eWxlc0h4?=
 =?utf-8?B?TjV6V0NWRU5VWVpZeFA0cmc3ZHU0WExYOGgrTXBPNkpqSHc1TkpyT2U3S0JN?=
 =?utf-8?B?WllicjR3N25zU3lXQjRuQ0Nka05tQmVoY1RFUVFRLzYxNmUvTnZyVjZqaC91?=
 =?utf-8?B?cmI4bDNSSnBuUUxESUQ2NlV4ZkozQXl4WnFEWVVCZk1zL2lXcUpsVWpsZ2Zw?=
 =?utf-8?B?RzVwSStNVmdiS1hPKzVhWXNSRXUzQkpiWlhyWWpldnRhR3dGcEVOZzhtWll0?=
 =?utf-8?B?My9uR3ByRVJjQTcySGFVRkIzZlpxbFJONVNmeE1lQkVDVWxSTyt1T01iaEl4?=
 =?utf-8?B?bmtncS9OYnF2UWRCUWpzNUx4SHNtQ2piQ2dnN29Ibk5laTZIUzhGek1tVXNB?=
 =?utf-8?B?OHNlNExBejVLY2Y5dDc3Z0dpdHU1alQ2MkpFRmtqV0dDbWtqV20rdkUzYkhh?=
 =?utf-8?B?K3l1bUErU3IwbFVlM1pjeXMyN3JiQ2F5eVJ2NUpRaUdBZkQzWERFemF1Rk1C?=
 =?utf-8?B?M0RQb2lhOGhKTW5PLzlBMkJwYnMyV3dKT0FzKzRleEFhOWowYVNEQ0xlWU85?=
 =?utf-8?B?WGowN1ZXbVBYVXF1d0V2STZqWmZCR1J5MndCRmhyaVFxZkhlSm9XUnpmTWto?=
 =?utf-8?B?V0kyM050eWMxTGV6NzZqakt2YkpabWhINnZxMWJKc0NxMU1mMFlWUGxZL0tu?=
 =?utf-8?B?dGJ2ZU9JeVpjeVVvK3NMdnU2MzJ0c05RK2MveHBvcWZVSlFFUDFLM2luNTZY?=
 =?utf-8?B?eFFKUUZ3UjFxTGZ1KzZ2V1hwZ1hzV3ZjaWtLUzRQUUxMSmg4TjFRKytnaENa?=
 =?utf-8?B?WjVaejM1S09NUlljV0F2ZkVyZUo2bXEyaW9oeUhERnhXNmVndGxiRHZUOG5Y?=
 =?utf-8?B?d1ZzT0ozbnh3QWlaOVRjWUpYUTVuNG55WWFXNGN1alVtdDYvLzM5cFJSWnUz?=
 =?utf-8?B?MkMvVGs0VjFrenpmY3pRaGgwZjlLNC9mZXZ6c05aOFZjRzFEMFJqWXo2SVUw?=
 =?utf-8?B?SlFiQlFZT0tNbm5rczh3KzV6ckp4dGZpTWNYL0ZBcHM3QkVTSUU2SVA2VHp3?=
 =?utf-8?B?VGRWZEUrdHBHNDU1cVlNODdONVZ6L0JaSFRjVVlSTEE2NGhxMGtLTy9NUm85?=
 =?utf-8?B?SFFhMktvRTVCYjUxeERzRkU5dnluaTROTWc4RG4zYjlJNXJkRXVmYzFnZU0x?=
 =?utf-8?B?cTFWMWlqT25EQkFuWWRoemd4TXRhSDV5OVcyZ0J5V2xhcndzWklWUDQ4dkdp?=
 =?utf-8?B?NHJaclhyTmVhUWoxYlZaT1ZYNWpJU0ZUUWF1U1creUtQcGtQS1Q3dlJ3R2l5?=
 =?utf-8?B?MTZuVWRKRkFPRW8wbWZzdDJmOEZSK1BsdTFlZWEyL3ZDNG5Pb0tTS1V3Tnpw?=
 =?utf-8?B?RTliWW4xT0FRN3JDMVRVdC8zdXlYZVRMRUxWa1EwVmZlb2xqaGlMTnQ1MjhV?=
 =?utf-8?Q?4ZKB21dHTxKKI7kVyu0QWRQgL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da42322e-0a1a-45f1-ca23-08de08083227
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 14:20:42.9982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDvUGhzQfCrkMvnay8pC2z9EgTn/SD+f7KrkJwR6w+rG+fP/H8lFa2s8JjeSJZvjrIIGg96Zf2pheMMvkv01Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7858
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


On 10/8/2025 17:09, Marcin Bernatowicz wrote:
> Update SR-IOV debugfs helpers to support the new layout while preserving
> backward compatibility with the legacy paths.
>
> The attribute path resolver:
>   - Tries the new tree first:
>       sriov/{pf|vfN}/tileT[/gtG]/<attr>
>   - Falls back to legacy:
>       gtG/{pf|vfN}/<attr>
>   - Maps vram_* -> lmem_* only for legacy paths
>
> Link: https://lore.kernel.org/intel-xe/20250928140029.198847-1-michal.wajdeczko@intel.com/
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   lib/xe/xe_sriov_debugfs.c | 178 ++++++++++++++++++++++++++------------
>   1 file changed, 124 insertions(+), 54 deletions(-)
>
> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
> index e12e12c8c..4ede9788e 100644
> --- a/lib/xe/xe_sriov_debugfs.c
> +++ b/lib/xe/xe_sriov_debugfs.c
> @@ -17,25 +17,98 @@
>   
>   #define SRIOV_DEBUGFS_PATH_MAX 96
>   
> -static char *xe_sriov_pf_debugfs_path(int pf, unsigned int vf_num, unsigned int gt_num, char *path,
> -				      int pathlen)
> +enum attr_scope {
> +	SCOPE_TILE,
> +	SCOPE_GT,
> +};
> +
> +static enum attr_scope attr_scope(const char *attr)
> +{
> +	if (!strncmp(attr, "ggtt_", 5) || !strncmp(attr, "vram_", 5))
> +		return SCOPE_TILE;
> +
> +	return SCOPE_GT;
> +}
> +
> +static int access_attr_path(int dirfd, const char *attr, unsigned int vf_num,
> +			    unsigned int tile, unsigned int gt_num,

nit: tile_num for consistency?

> +			    char *attr_path, size_t path_size)
> +{
> +	const bool is_vf = vf_num > 0;
> +	int n;
> +
> +	switch (attr_scope(attr)) {
> +	case SCOPE_TILE:
> +		n = is_vf ? snprintf(attr_path, path_size, "sriov/vf%u/tile%u/%s", vf_num,
> +				     tile, attr) :
> +			    snprintf(attr_path, path_size, "sriov/pf/tile%u/%s", tile, attr);
> +		break;
> +	case SCOPE_GT:
> +		n = is_vf ? snprintf(attr_path, path_size, "sriov/vf%u/tile%u/gt%u/%s",
> +				     vf_num, tile, gt_num, attr) :
> +			    snprintf(attr_path, path_size, "sriov/pf/tile%u/gt%u/%s", tile,
> +				     gt_num, attr);
> +		break;
> +	};
> +
> +	igt_assert(n >= 0 && (size_t)n < path_size);
> +
> +	return igt_sysfs_has_attr(dirfd, attr_path) ? 0 : -ENOENT;
> +}
> +
> +static int access_legacy_attr_path(int dirfd, const char *attr, unsigned int vf_num,
> +				   unsigned int gt_num, char *attr_path,
> +				   size_t path_size)
> +{
> +	const bool is_vf = vf_num > 0;
> +	char legacy[64];
> +	const char *name = attr;
> +	int n;
> +
> +	/* Map vram_* to lmem_* only for legacy layout */
> +	if (!strncmp(attr, "vram_", 5)) {
> +		n = snprintf(legacy, sizeof(legacy), "lmem_%s", attr + 5);
> +
> +		igt_assert(n >= 0 || (size_t)n < sizeof(legacy));

&& instead of ||

With this corrected:
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>


> +		name = legacy;
> +	}
> +
> +	n = is_vf ? snprintf(attr_path, path_size, "gt%u/vf%u/%s", gt_num, vf_num, name) :
> +		    snprintf(attr_path, path_size, "gt%u/pf/%s", gt_num, name);
> +	igt_assert(n >= 0 && (size_t)n < path_size);
> +
> +	return igt_sysfs_has_attr(dirfd, attr_path) ? 0 : -ENOENT;
> +}
> +
> +static int attr_path_resolve(int pf, unsigned int vf_num, unsigned int gt_num,
> +			     const char *attr, int dirfd, char *attr_path,
> +			     size_t path_size)
>   {
> -	char sriov_path[SRIOV_DEBUGFS_PATH_MAX];
> +	struct xe_device *xe_dev = xe_device_get(pf);
> +	int tile, ret = 0;
>   
> -	if (!igt_debugfs_path(pf, path, pathlen))
> -		return NULL;
> +	igt_assert(xe_dev && igt_sriov_is_pf(pf));
> +	tile = xe_get_tile(xe_dev, gt_num);
> +	if (igt_debug_on(tile < 0))
> +		return -ENOENT;
>   
> -	if (vf_num)
> -		snprintf(sriov_path, SRIOV_DEBUGFS_PATH_MAX, "/gt%u/vf%u/", gt_num, vf_num);
> -	else
> -		snprintf(sriov_path, SRIOV_DEBUGFS_PATH_MAX, "/gt%u/pf/", gt_num);
> +	ret = access_attr_path(dirfd, attr, vf_num, tile, gt_num, attr_path, path_size);
> +	if (ret) {
> +		char first_path[SRIOV_DEBUGFS_PATH_MAX];
>   
> -	strncat(path, sriov_path, pathlen - strlen(path));
> +		snprintf(first_path, sizeof(first_path), "%.*s",
> +			 (int)((path_size < sizeof(first_path) - 1) ?
> +				path_size : sizeof(first_path) - 1),
> +			 attr_path);
>   
> -	if (access(path, F_OK))
> -		return NULL;
> +		ret = access_legacy_attr_path(dirfd, attr, vf_num, gt_num,
> +					      attr_path, path_size);
>   
> -	return path;
> +		igt_debug_on_f(ret, "Failed to access '%s'; tried %s, %s\n", attr,
> +			       first_path, attr_path);
> +	}
> +
> +	return ret;
>   }
>   
>   /**
> @@ -49,26 +122,29 @@ static char *xe_sriov_pf_debugfs_path(int pf, unsigned int vf_num, unsigned int
>    * Opens SR-IOV debugfs attribute @attr for given PF device @pf, VF number @vf_num on GT @gt_num.
>    *
>    * Returns:
> - * File descriptor or -1 on failure.
> + * File descriptor or negative error code on failure.
>    */
>   int xe_sriov_pf_debugfs_attr_open(int pf, unsigned int vf_num, unsigned int gt_num,
>   				  const char *attr, int mode)
>   {
> -	char path[PATH_MAX];
> -	int debugfs;
> -
> -	igt_assert(igt_sriov_is_pf(pf) && is_xe_device(pf));
> -	igt_assert(gt_num < xe_number_gt(pf));
> -
> -	if (!xe_sriov_pf_debugfs_path(pf, vf_num, gt_num, path, sizeof(path)))
> -		return -1;
> +	char attr_path[SRIOV_DEBUGFS_PATH_MAX];
> +	int dirfd, attr_fd, ret;
>   
> -	strncat(path, attr, sizeof(path) - strlen(path));
> +	dirfd = igt_debugfs_dir(pf);
> +	if (igt_debug_on(dirfd < 0))
> +		return -ENOENT;
>   
> -	debugfs = open(path, mode);
> -	igt_debug_on(debugfs < 0);
> +	ret = attr_path_resolve(pf, vf_num, gt_num, attr, dirfd, attr_path, sizeof(attr_path));
> +	if (ret) {
> +		close(dirfd);
> +		return ret;
> +	}
>   
> -	return debugfs;
> +	attr_fd = openat(dirfd, attr_path, mode);
> +	igt_debug_on_f(attr_fd < 0, "Failed to open '%s' (%s)\n",
> +		       attr, attr_path);
> +	close(dirfd);
> +	return attr_fd;
>   }
>   
>   /**
> @@ -91,7 +167,7 @@ const char *xe_sriov_debugfs_provisioned_attr_name(enum xe_sriov_shared_res res)
>   	case XE_SRIOV_SHARED_RES_GGTT:
>   		return "ggtt_provisioned";
>   	case XE_SRIOV_SHARED_RES_LMEM:
> -		return "lmem_provisioned";
> +		return "vram_provisioned";
>   	}
>   
>   	return NULL;
> @@ -323,19 +399,6 @@ int xe_sriov_pf_debugfs_read_check_ranges(int pf_fd, enum xe_sriov_shared_res re
>   	return ret;
>   }
>   
> -static int xe_sriov_pf_debugfs_path_open(int pf, unsigned int vf_num,
> -					 unsigned int gt_num)
> -{
> -	char path[PATH_MAX];
> -
> -	if (igt_debug_on_f(!xe_sriov_pf_debugfs_path(pf, vf_num, gt_num, path,
> -						     sizeof(path)),
> -			   "path: %s\n", path))
> -		return -1;
> -
> -	return open(path, O_RDONLY);
> -}
> -
>   /**
>    * DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC - Define a function for accessing debugfs attributes
>    * @type: Data type of the value to read or write (e.g., `uint32_t`, `bool`, etc.)
> @@ -373,20 +436,27 @@ static int xe_sriov_pf_debugfs_path_open(int pf, unsigned int vf_num,
>    * - `0` on success
>    * - Negative error code on failure
>    */
> -#define DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(type, suffix, sysfs_func)		\
> -	int __xe_sriov_pf_debugfs_##suffix(int pf, unsigned int vf_num,		\
> -					   unsigned int gt_num,			\
> -					   const char *attr, type value)	\
> -	{									\
> -		bool ret;							\
> -		int dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);	\
> -										\
> -		if (igt_debug_on(dir < 0))					\
> -			return dir;						\
> -										\
> -		ret = sysfs_func(dir, attr, value);				\
> -		close(dir);							\
> -		return ret ? 0 : -1;						\
> +#define DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(type, suffix, sysfs_func)\
> +	int __xe_sriov_pf_debugfs_##suffix(int pf, unsigned int vf_num,				\
> +					   unsigned int gt_num,					\
> +					   const char *attr, type value)			\
> +	{											\
> +		char attr_path[SRIOV_DEBUGFS_PATH_MAX];						\
> +		int err, dirfd = igt_debugfs_dir(pf);						\
> +		bool ok;									\
> +												\
> +		if (igt_debug_on(dirfd < 0))							\
> +			return dirfd;								\
> +		err = attr_path_resolve(pf, vf_num, gt_num, attr,				\
> +					dirfd, attr_path, sizeof(attr_path));			\
> +		if (err) {									\
> +			close(dirfd);								\
> +			return err;								\
> +		}										\
> +												\
> +		ok = sysfs_func(dirfd, attr_path, value);					\
> +		close(dirfd);									\
> +		return ok ? 0 : -1;								\
>   	}
>   
>   /**
