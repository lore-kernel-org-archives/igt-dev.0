Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7144FD1267F
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 22:51:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D9710E5C8;
	Tue,  2 Dec 2025 22:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqnE6daW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE78E10E043
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 22:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764715882; x=1796251882;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uD/u+Vm2eBynDqx0k6aVxZaSptjQMN9fuZP+mo+s90M=;
 b=CqnE6daWFZLEnPGP5ZmlPzv6RYILBQ2SnvHOrh06QwYZS1UGqJExkFrW
 xdJRYJojqfxhmGhCM6QgH76Y5Agvuwlto0M1jrJar62IVtNAAVqeAugKD
 rR+oPz65IXjyil9Psp7T08UfKsELGe/XP4YoFYgOGyVX7x700GfRqYbEE
 VUrUM4/JjGJK9S7QFPS4OoZbCBXnzvNjPs/KZTAowW19szzTG++ol9fku
 TTeVActzquLrkk1R4iZ+Gg2CPO/a0R0qs68LFUBfd5gaR/8Dm4/bZKMer
 0pK//yOx29EuE1BApLmKStWAZ+kBwG6XXh09h5Yxg6K8WxNF0LUh9YFU3 w==;
X-CSE-ConnectionGUID: JDlIMb0ZT2m5a/h3di56kg==
X-CSE-MsgGUID: m+mdkSgTTaqBauS83iAxRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66421113"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66421113"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:51:22 -0800
X-CSE-ConnectionGUID: yZvEmKCRSmGDSvqNFFA2Fg==
X-CSE-MsgGUID: kxXUNMxuQF+7JOk0/J47Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="198683154"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:51:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:51:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 14:51:20 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:51:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDSTIfC1aCOvohJCw0ha05OR1oOlhkd9GxLTUHEJ3seflZyVKu3UnuDnkiLDuSeaVVGT4gsRkJtSPa5R0Iu0QxFFRmXWjZfrXOsbLJ5PbbZbF57RgoNGyszID4bBBnhBZtStc16sWpv1S5ywzkZvaKW9SqiA9euDjZQsrkUw39gkIfUq/yrwMEzheO1nBA0DxNTzGP+6S8px6UKDmp0LX6bPWVglF4k4tK0zQ8YcVm0pzA3mtDf9hTWmSMpHByxTkM73kOU1aBtGuBUIAOfeyOedEV8L2syMCks6zvmtyWOXv6vivVPk722H+6mUO18yRLGk01LqNOza0TbWYhcJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uD/u+Vm2eBynDqx0k6aVxZaSptjQMN9fuZP+mo+s90M=;
 b=H0KG01SeUTKZPeQD61Adh7bBnLIlZGUO9KxysBhSFOopifgOuhmvepqm1on5M6wLiyd/hLhWP7mTs5oLv4OuTQ7wGSMAyaQ5Tjq56LJo4DF/eib/uaBF1AZUfDtdXPCZ/u8KbO7LHGFzeBZJoyIaI4ghVKMbwa8y0cbySNYmrHJmP5Z4UG+AJbR2p5cxWtlPgmqbkRzAE3awZEiOojmPqJCuPpxAtGzFov0fwSpt2KaLk70Uy3+BACy6MlTS7zGAu5tU1hyLDumw6TXcCnqz5Si4kabzKYdetxWFZnMrGXBQULXV0E2ToopQMw6cOomi3Saz7m1ZdrJFhNRRkjsdbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:167::22)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 22:51:18 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa%4]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 22:51:18 +0000
From: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Dugast,
 Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy for Xe2
 platforms
Thread-Topic: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy for
 Xe2 platforms
Thread-Index: AQHcWJcloDqdddQ0v0WsUpahO3vlFbUPC1KA
Date: Tue, 2 Dec 2025 22:51:18 +0000
Message-ID: <49b29f6d81798853fa594922b97cfa9ffe8c5c54.camel@intel.com>
References: <20251118142522.3957318-4-balasubramani.vivekanandan@intel.com>
 <20251118142522.3957318-6-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20251118142522.3957318-6-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5711:EE_|MN0PR11MB6110:EE_
x-ms-office365-filtering-correlation-id: d868e836-d3d0-49ab-e29d-08de31f54e5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QVZqaUpQanVpSVlzOFduMkxBRTBlWFMwakM4SVNFNmg1aThaNHdSN0NWSFB0?=
 =?utf-8?B?UHROajFEUnIwM2JqNFVnYlMyWGJyTkRUYkZpdFV3SXVPd25jZWpNNDJudFpM?=
 =?utf-8?B?WmY2WlhlK1EvY0lLb2JVWmVJWjlqSjBXT00xd284VkFPTDM1QjlkNU5pQ0ZN?=
 =?utf-8?B?bUJ3bUtwRU44K0QyRTFkRTlnZE9UenBxeTlsd3VZSDU5WTdhV3JHN2V5Tnl5?=
 =?utf-8?B?VEtKOFlwbWpSQTZPVVlsZkxkRXlQYnp2YlM1NnppSzg4QTF0T0lyNVpXT3Z0?=
 =?utf-8?B?S2pxcEtKbW9uYWp1WmtMWGU0cENRUDFCaXhoOEJDcy9XWC9GekFQRXFSMEMw?=
 =?utf-8?B?V2s4ZmlUSTd2R2wyZHArTldkNk11dXRndk13cGMvSXQrM3ZnK29PYXQrVWdZ?=
 =?utf-8?B?Z1o0RVRwb0pBNGVRUDcrbm9BQldDaVljelZVMWIyRWM3enZvcmxpSkpsQ3k1?=
 =?utf-8?B?Q0d4Qnc5RWRmV1RmdlV4M1l5OE9LNkJRa3hpMU5PakN1SkhoUXp6aHZNYlR2?=
 =?utf-8?B?MmRHVUtQY3djN1d3UTAyK0RoYklqYjNVbmRsbmZEUmNVQ3lvRlYvY3F0Z0Fz?=
 =?utf-8?B?QW0xenVUV1VpeDkrWlp1aEliVmZIUFRwenJhdDFYRmVNcGtKditIem9LLzRL?=
 =?utf-8?B?c0Q0ZHZXOHM3Sm5nK2l0emdsRzY1azNMc1BuN3J2MDRvWVhiNStPTi9ZU1du?=
 =?utf-8?B?b1Myb2h0ZVFaUk1mbHhmN0Z4TFhVekhrZTd4cjdFMmNBdDhLbkQ3TjBpdXVi?=
 =?utf-8?B?WnFDcDdOdjlQbjBIY0QyaUNBb0xlVk9yTEMvcGVaM2JZb0tnVWNvWHVQRlIr?=
 =?utf-8?B?Wko0ZndIZWNkMnFoamRLYkZ3TThhR1RyemVCZGNPaFhUbWpQbndZVFNTRnNw?=
 =?utf-8?B?Qm4yR081QlVZRWUrVi8yOFdWT3dhL0ZlSkwxVEFRcGFKeG1sbXdwZDF3THh6?=
 =?utf-8?B?ejVrYUxTdHgvM1FMWE16bGZUNm9ZNVRBekhiT3ZCWlcxM2dHKzE0aFdQdm1L?=
 =?utf-8?B?d0xrWFB2dWx5VElXMDNHcWRzMjRUMUZ2ZVhjUzhlM0xkd1N5UkFwNU9VMlB1?=
 =?utf-8?B?QzVjUVhYU0RaRnNaaTNNQ2pLOFk5K0FoZ1VROC92cHJ0aFprelV0bjJPM1hz?=
 =?utf-8?B?SERIRVlkMzB5RzJZeHYvNm9acUJ0eTBZNEVrOXdjbm80cXVneXFyMEkrRTU3?=
 =?utf-8?B?bTlMdkNwcjFmM1QyUW1UOEdnS3BaNnhkcnN0VVVzYzFuQ3lORWorNE0rZ0hG?=
 =?utf-8?B?VGZYTlZhNGY3eFZia0FneXZVdzd4MG9SdmRTOVFlQ3YrQU9IQ1lxeFRHWHFS?=
 =?utf-8?B?b0d4VmZNdmJJYXlZbnY5MnI1d0pya0hWTHV0ZnNkU2psUXQ5L3E1czk0cTl3?=
 =?utf-8?B?VmluMEFqZFdsZE1TTDBzNWdmTFRWY3hBTXVRTUZvSEJRNWlkc2MyRlAvbTNS?=
 =?utf-8?B?eHB6RE1uZ3dCZE82UU5ZYVJFTGdFVkdSTGVsQVd6VkgrS0ZDdjhJdzEyWFI4?=
 =?utf-8?B?bzZhNU9RV1U4NHExNmVrelZBOEdtUVZxalZzVHRoVmpTeFp0MGlPbVlOY0lP?=
 =?utf-8?B?ckFCaTVaM2wxcUNDNXFaMmlOaS9ON0hKS2JOdGZ1SzAxeUFpNFZNRmZ2ZnBY?=
 =?utf-8?B?SEMyL1lqbmlaZkJkZktaYmhxVWFGdzgyb0JpQjJSeGtuZzRVUUk0NzMvZit3?=
 =?utf-8?B?QUhTcFpmVzRwci8vV2o5WjY1WUJua2pQMWZaaml5U3kyT244VGFmWm12clpZ?=
 =?utf-8?B?dEdyaTY1WW1mb21wK29sMGR6WDJNa3Vzd2VINkxjZDRtTGRBaGNIc3FuTHFo?=
 =?utf-8?B?ZTJxWWtuWHB1dHp5QVlxQ1BNejZoMDJOWVYxS3paMUNVbklwUWR5bW9SV2cv?=
 =?utf-8?B?em96cDF4NUd3ZjU1Y0hyQWV0VHFZRW80YWZHbjU2dDVidG9nZkkyWXdnbDEx?=
 =?utf-8?B?bmtwRHJkYTZxT2RwclVnY2VSdTgydy9xZXN2WUlpTW80eC9EdmUyTDhra0ZR?=
 =?utf-8?B?K2ZOZ3J5SDEzMTI0K1pMakdseWlhSG9weVM2K1BwV0RMM1lDcVhMT3NwMi9G?=
 =?utf-8?Q?S9cyIJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elhpWHpxQ1VqZGgwOWJEZFRKU2pkNUU4SVdxaUg3L0NCNWc1QnFqTHcvMENE?=
 =?utf-8?B?REpBUC9zdXhDUjl1U3NjcitDei9mNmozdUhnaHFMdmFOUk9lMnBmMjBCbW82?=
 =?utf-8?B?YW1zL01JN2FWTnhkWS9CR3paMG1FMGExbHN4U0hreDhqcXlDUzM1aFVMYzJO?=
 =?utf-8?B?bHh6WDNMdkJZOHgxZHIvZGF3L1NqbjdJM1NiVmdzMWtYSHdWMnhhNXBkZEtN?=
 =?utf-8?B?VHhsWCs5SDBhTVE2WHdjblZkV0xyRm9DSSs4N09OdWlBNXJUUEVqNG56VVlR?=
 =?utf-8?B?U3BwTE94QWh0dERPcGhDN2lmdEJuSnNqcFprZllFd2p3MnhBeDYwSzBRcmpu?=
 =?utf-8?B?N2J1cFluR3haS3ZaNXl0R3hpQkFvbzltVSszdHRiR2Fyd0YyVS85cG84M2Yr?=
 =?utf-8?B?UTdpM1RlVGtmci9nMGdpU0FRWVo3NjFMci8rSFdEQXMxUnBQdE9IbFNZTE9B?=
 =?utf-8?B?akV6VEswb0UzdnpuRERuU2dXZUMrb1UyeG9qSm1wWW5DSVhPL05IQ3A0QUNM?=
 =?utf-8?B?UE5WVyszenFVaFA0VWJwMGtxZUxkUXFNVUNvSzlhVW85aWJyaDdqWWFqK1pZ?=
 =?utf-8?B?dloxRUJObHJ2ZzErUUFpV1pLNEd3dVI1WG05MjlxYlpOQTM2MzM5M2dzT04y?=
 =?utf-8?B?NTdlZU9OVWwxclB4MnJOWCtJaHVaLzAwa0lra3k5SjJtNkNrK1FTdUpUd2lx?=
 =?utf-8?B?SisxdDQ3cjMyNFRVYS9rVnN2ZUZHY0JLc052VVo0S0ViK29UNHNTV1N5ZVo1?=
 =?utf-8?B?dDhKWVF6MmJvZnEyN3cweHVMamJlWWRFdHB1UWpGMDdIMVNFUTg4UFhHV0lR?=
 =?utf-8?B?dS9hb0RFbTBlYVVET0plOExtQktXb3Vid1U4TkY5aUZnWmdaN1lJRjBTeDJz?=
 =?utf-8?B?SUxhY09NL1BkT25sWFlackpKOUZwMlI0TTFsK0R0bG8rY1l0WVVmQjQ0RFFL?=
 =?utf-8?B?NzlzWS9UaGp5M1dzTi9XcEZVNTY3b21kVExNa3hobUFGUktwS1RFNFEvZjhE?=
 =?utf-8?B?clJyRUNTck5mUlBJZFNTSy9vNjFPU1VoOERrMjFLbU9FSGxmQjNiUnZGQjgx?=
 =?utf-8?B?dVg4cmdDeTdDV3VNMEpwMzliZXIrVG83dExlaXBJdzNGWUpwSTZBMFo0eE43?=
 =?utf-8?B?WGg2bElhRjNiZXVtL3RIa3VpV25iaUR1bVdDSnQ3OGJuU3VMYk56dU1TZFdX?=
 =?utf-8?B?dEp2YkJOOUhIWmk0OFUxODkxNjk3c2hES2lyQTd4MHB3am9OQ0dzRStRM3Zv?=
 =?utf-8?B?UStiMjVZSlhUMUxsY0dFREFYcmZoWWFxeDRCTmcyVlVXR3daYVlhdUplSXRV?=
 =?utf-8?B?eVhyWmJELzVWMFUrV3hOV2pnbWJvSWZkTlkvYjI0QkQ3a0liVk9HZUV6dXpy?=
 =?utf-8?B?YTFWOEF4aHI1T0s2TlZHaVpuY1FBOUJOREdMcVkxcTJSd1psNVdRVTY5Mmly?=
 =?utf-8?B?YU9mM2tjK3FLdG1TeGFyc3lXaXZ3VldwaExWSmtURnVJWXJuRU5ZMVFMS1ZI?=
 =?utf-8?B?b1FrczhUZFpRdFl1Vk1YNCtVYkY0R3RaRlBWL1RBR0NWb1RPSndXWW50OEdD?=
 =?utf-8?B?NlZpQ2IvcCtQVitORFlHNDJqcFJXZkEweEhTdmV2V2ZBODJBSUdrc3FLS0hN?=
 =?utf-8?B?NVgrNndqbEdDNTl3OUNDVXk0b3dHMnZoM1hqN0pjaFJJZVpWWDZma2hWcnFL?=
 =?utf-8?B?SjY4cWNVWjRGNUpXekcvVmVsc2Z2bjFLOGRRa3FRdEJMSHdlWjZmMnJKTVVU?=
 =?utf-8?B?RndNUmxVVkJwR2FqdE9LaVhXZGNTUFNLWVZkcVZQZ2hiM2N6R3hlK3hBdmFY?=
 =?utf-8?B?RnRoZVN0TmFJMWgyZmlCUTFKUGVkci9GUlJ5SnpQSjJBWVpaeXhEZnBxRkps?=
 =?utf-8?B?S1ZNMDExRjVLbjlPS1ZRN2xXOFJuWmNMdThtK2tZenQwbUFJU0hrMC9uZll6?=
 =?utf-8?B?aEZuSWJ4OStuaG9YNmJYdTBTZ1htVC9hcElLbTR3djJUWFZ5cmNyOGt2bFRB?=
 =?utf-8?B?SDgyeG8vd3FCaE5sTjg2Mitacm5tOW8yUmNibVdKT2VKK251RllkRGsrQVl4?=
 =?utf-8?B?YjdZc0pUY0pkci94Vmg5VzNJYkh0STlPYmcvMk9RbTZKY2M2aThhMjJ1d3Yz?=
 =?utf-8?B?czdhck9nRmRnb1ljQTdFcHN1Wms4Y05NcHRmR0o0b3BieU1ZbVh1VFdlWDhL?=
 =?utf-8?B?c3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8DB685B64EEFA499E83742C1D7A1DD7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d868e836-d3d0-49ab-e29d-08de31f54e5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 22:51:18.4403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SbRl+Q5R+gJnNlIGZg91HfyxCnNVAlcaHhiBeVKQxUy2rVBGs/k09FvTaHK3xmfotGQN6GMoZMuNHF1wgjxKFTj4T60t4aizygR54etzUMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
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

Qml0IHNoaWZ0cyBtYXRjaCBic3BlYyBmb3IgWGUyLg0KDQpSZXZpZXdlZC1ieTogQ2xpbnQgVGF5
bG9yIDxDbGludG9uLkEuVGF5bG9yQGludGVsLmNvbT4NCg0KLUNsaW50DQoNCg0KDQoNCk9uIFR1
ZSwgMjAyNS0xMS0xOCBhdCAxOTo1NSArMDUzMCwgQmFsYXN1YnJhbWFuaSBWaXZla2FuYW5kYW4g
d3JvdGU6DQo+IFRoZSBzb3VyY2UgYW5kIGRlc3RpbmF0aW9uIG1vY3MgaW5kZXggZmllbGRzIGhh
cyBjaGFuZ2VkIGluIHRoZSBNRU1fQ09QWQ0KPiBpbnN0cnVjdGlvbiBpbiBwbGF0Zm9ybXMgYWZ0
ZXIgWGUyLiBTbyB3ZSBuZWVkIHRvIGNoZWNrIGZvciB0aGUgSVANCj4gdmVyc2lvbiBiZWZvcmUg
cGxhY2luZyB0aGUgbW9jcyBpbmRleCBpbiB0aGUgaW5zdHJ1Y3Rpb24uDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBCYWxhc3VicmFtYW5pIFZpdmVrYW5hbmRhbiA8YmFsYXN1YnJhbWFuaS52aXZla2Fu
YW5kYW5AaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pbnRlbF9ibHQuaCAgfCAgNCArKystDQo+
ICBsaWIveGUveGVfc3Bpbi5jIHwgMTEgKysrKysrKysrLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIv
aW50ZWxfYmx0LmggYi9saWIvaW50ZWxfYmx0LmgNCj4gaW5kZXggNTRhMDk2YzAzLi4yZmFlMDQ1
YmMgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pbnRlbF9ibHQuaA0KPiArKysgYi9saWIvaW50ZWxfYmx0
LmgNCj4gQEAgLTUzLDcgKzUzLDkgQEANCj4gICNpbmNsdWRlICJpbnRlbF9jbWRzX2luZm8uaCIN
Cj4gIA0KPiAgI2RlZmluZSBDQ1NfUkFUSU8oZmQpIChpbnRlbF9nZW4oaW50ZWxfZ2V0X2RybV9k
ZXZpZChmZCkpID49IDIwID8gNTEyIDogMjU2KQ0KPiAtI2RlZmluZSBYRTJfTUVNX0NPUFlfTU9D
U19TSElGVCAgICAgICAgICAgICAgICAgICAgIDI1DQo+ICsjZGVmaW5lIEdFTjEyX01FTV9DT1BZ
X01PQ1NfU0hJRlQJCTI1DQo+ICsjZGVmaW5lIFhFMl9NRU1fQ09QWV9TUkNfTU9DU19TSElGVAkJ
MjgNCj4gKyNkZWZpbmUgWEUyX01FTV9DT1BZX0RTVF9NT0NTX1NISUZUCQkzDQo+ICANCj4gIGVu
dW0gYmx0X2NvbG9yX2RlcHRoIHsNCj4gIAlDRF84Yml0LA0KPiBkaWZmIC0tZ2l0IGEvbGliL3hl
L3hlX3NwaW4uYyBiL2xpYi94ZS94ZV9zcGluLmMNCj4gaW5kZXggNzJiMTNlZjQyLi4xYjEyY2U5
OTEgMTAwNjQ0DQo+IC0tLSBhL2xpYi94ZS94ZV9zcGluLmMNCj4gKysrIGIvbGliL3hlL3hlX3Nw
aW4uYw0KPiBAQCAtNTQsNiArNTQsNyBAQCB2b2lkIHhlX3NwaW5faW5pdChzdHJ1Y3QgeGVfc3Bp
biAqc3Bpbiwgc3RydWN0IHhlX3NwaW5fb3B0cyAqb3B0cykNCj4gIAl1aW50NjRfdCBwYWRfYWRk
ciA9IG9wdHMtPmFkZHIgKyBvZmZzZXRvZihzdHJ1Y3QgeGVfc3BpbiwgcGFkKTsNCj4gIAl1aW50
NjRfdCB0aW1lc3RhbXBfYWRkciA9IG9wdHMtPmFkZHIgKyBvZmZzZXRvZihzdHJ1Y3QgeGVfc3Bp
biwgdGltZXN0YW1wKTsNCj4gIAlpbnQgYiA9IDA7DQo+ICsJdWludDMyX3QgZGV2aWQ7DQo+ICAN
Cj4gIAlzcGluLT5zdGFydCA9IDA7DQo+ICAJc3Bpbi0+ZW5kID0gMHhmZmZmZmZmZjsNCj4gQEAg
LTE2Myw4ICsxNjQsMTQgQEAgdm9pZCB4ZV9zcGluX2luaXQoc3RydWN0IHhlX3NwaW4gKnNwaW4s
IHN0cnVjdCB4ZV9zcGluX29wdHMgKm9wdHMpDQo+ICAJCXNwaW4tPmJhdGNoW2IrK10gPSBvcHRz
LT5tZW1fY29weS0+c3JjX29mZnNldCA8PCAzMjsNCj4gIAkJc3Bpbi0+YmF0Y2hbYisrXSA9IG9w
dHMtPm1lbV9jb3B5LT5kc3Rfb2Zmc2V0Ow0KPiAgCQlzcGluLT5iYXRjaFtiKytdID0gb3B0cy0+
bWVtX2NvcHktPmRzdF9vZmZzZXQgPDwgMzI7DQo+IC0JCXNwaW4tPmJhdGNoW2IrK10gPSBvcHRz
LT5tZW1fY29weS0+c3JjLT5tb2NzX2luZGV4IDw8DQo+IFhFMl9NRU1fQ09QWV9NT0NTX1NISUZU
IHwNCj4gLQkJCQkgICBvcHRzLT5tZW1fY29weS0+ZHN0LT5tb2NzX2luZGV4Ow0KPiArDQo+ICsJ
CWRldmlkID0gaW50ZWxfZ2V0X2RybV9kZXZpZChvcHRzLT5tZW1fY29weS0+ZmQpOw0KPiArCQlp
ZiAoaW50ZWxfZ3JhcGhpY3NfdmVyKGRldmlkKSA+PSBJUF9WRVIoMjAsIDApKQ0KPiArCQkJc3Bp
bi0+YmF0Y2hbYisrXSA9IG9wdHMtPm1lbV9jb3B5LT5zcmMtPm1vY3NfaW5kZXggPDwNCj4gWEUy
X01FTV9DT1BZX1NSQ19NT0NTX1NISUZUIHwNCj4gKwkJCQkJICAgb3B0cy0+bWVtX2NvcHktPmRz
dC0+bW9jc19pbmRleCA8PA0KPiBYRTJfTUVNX0NPUFlfRFNUX01PQ1NfU0hJRlQ7DQo+ICsJCWVs
c2UNCj4gKwkJCXNwaW4tPmJhdGNoW2IrK10gPSBvcHRzLT5tZW1fY29weS0+c3JjLT5tb2NzX2lu
ZGV4IDw8DQo+IEdFTjEyX01FTV9DT1BZX01PQ1NfU0hJRlQgfA0KPiArCQkJCQkgICBvcHRzLT5t
ZW1fY29weS0+ZHN0LT5tb2NzX2luZGV4Ow0KPiAgCX0NCj4gIA0KPiAgCXNwaW4tPmJhdGNoW2Ir
K10gPSBNSV9DT05EX0JBVENIX0JVRkZFUl9FTkQgfCBNSV9ET19DT01QQVJFIHwgMjsNCg==
