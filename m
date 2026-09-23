Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB78AC9830B
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 19:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624E210E963;
	Wed, 23 Sep 2026 19:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NnMoECg2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B598210E963
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 19:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790191557; x=1821727557;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kGYJuW7EcuHCxgJiNaPW/rupbb0Yan79DD66NxnLn10=;
 b=NnMoECg2/8o9gUPgAbn6wkINY9khK+tnQytoLEI6dpOcTMtJWTDHNdg0
 tPHME02bXIsqXrDWbiXdz/FSjMfwysAqaprHadcFzc4J9AyQqGGqLDo5o
 l33IQ6qPopSs6+KCdPNlU/JChugGyx4MK7bY0RT4UGEJiyTaKpjWrqjan
 /WkmHKe6wxA2sTJEZ0R0dXTZC1Fbasb32MAQPhSA4jvaW7etpem0u9Bii
 X/t1hmUxFiulCXAIv6uRsh0wKtDJ3VOJ7AxmQH6j+S+kCWzatdbEdp/QY
 K5RwlJwUu3lySbxS6sDQCy902b0vpu/9CY8YQcGWMP8Iftpec9ZtMTE7s g==;
X-CSE-ConnectionGUID: jC+/y0myQdCPOCcynf7DLQ==
X-CSE-MsgGUID: /0ypkeFpT6esSADgpLisFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90949408"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="90949408"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 12:25:56 -0700
X-CSE-ConnectionGUID: SIRdo8qBQmWETFjlEzQ6zQ==
X-CSE-MsgGUID: ktKinItcRNezbS9dQgt1Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4844014"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 12:25:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 12:25:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 12:25:56 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 12:25:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doD4pW6vQvWew6RqEs3zXJwsX/sgVpQ/8Q55mU1mbP8/n/0pOUcnGWKBz9oN28zW7q8DYeuCLmWhsslBYESU67VfASs/XkP90edgCZpR6k1Mb6X+oYY3F0vSeZiAPFqjdj3b6Njp6naIKxBkMHb8p0ixrd/rHSlDE3NIWB1DdMWXa4nXM/NmXgf2nhoiiPC/0XWx0N9CdwnIsZQwUqrM22ygYbA6YmDUUYu7FEXKBdvj23mEzGL8WsqYRsqD6YMXvmJlT/Dx2J4eydswpGAQ6m8ngKWFs/iqfinSZMYr3ceUDYYLQOt9sM69ZX85fo+aZx3IZu/4OMNz4uuxQ1f6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0Hlj5NLLOdgNZFPwjUUAxyh1xjrK4jMkJgKJvMPFr8=;
 b=qYeZCBOCyJYHVDp9t7BtU/9/BEpzbrMIsanGPEv0y3TFcI4BuPQujNS983HZpgLiLD6edmqiPoOIfJmAwDSdzKU+n3omFohm6ZchMs118CrMdSXThHg3xrvQ15EBDLYZdo4h3ruPOCY/1JS966J+sCt9/xUu44O/78UrUaxZXDdn7u0YGjw4jyLHVlOY/hcLNHNHGan8x2e7DGNzoxLu8uNA70Ruku9asQlwc/f7Woc5TwomJmuh1DYn6lzaQ2Ndqz7pmUpJKRyi4sSOgz43tnqZfcbh195v3QWIqT4aaZG5kR15xfkALGaGX8Rp7caS/TnNPwwKRix0MKpQry2aiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by DSVPR11MB9554.namprd11.prod.outlook.com (2603:10b6:8:38a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 19:25:54 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 19:25:53 +0000
Message-ID: <3a876a56-dc4b-40a4-b407-d303a45591e6@intel.com>
Date: Thu, 24 Sep 2026 00:55:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_configfs: reuse pre-existing configfs group
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>, <matthew.d.roper@intel.com>
References: <20260803094954.3087948-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260803094954.3087948-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::14) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|DSVPR11MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb30bc2-528c-4746-71e6-08df19a87bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: AOJaMwupdW3RV7YwfUuKPo2ApAtq93YjnDxrmkaBs8lX1ySl2hSzhirjd6oYn60Z9YjQGnOxqngsG6DJtgfGv+UwSuxKyT9cLLBNzYpFQlOeHoZ6ZSnluQhf7hYofkw5KaPC+vjDckD7MchstaMxz8wwYUuY8gihVg7IAjNvJqWvrw7hijq8v9kYP1T5lIvrX59ubQslDXOQNuKDJoZCXRL35tcJGqlJLdvmBDw653n3jZPq4d2vk3KKg3+utIE/aosfu8zepkrg8UcMJsi5NpeZH5sJLQwQ3ws33Tvh93MIuVyRSt1zJnPO1SZ1osS7p0uj45xUy9s/i7lBjdlNUiJWbKN/6kNvLv1FTOyZv1hDxgnsVA3JYGBgSJdpNYFI9mO824e766f/VECjf0pf6vz2CuoqN8DG9VOLL8ovSvCDzGT/R2aNM/Cd2sXGFl8qsURy7G71O3w6XdzBnpvsu7X0ynUf7B6Dc4zPtp/M9fHHgZLKtSXqZHFGHpl7ifRlF60GDMDY7kdahoYTWG0eeMGVt2H/jhfrZEv1okyzPUGQTdbosTcwevaBvoAtCSvGLbwM4RTbboV3KSAla6BeOtQ69S6qMjq1z8XIdShpesW3DPyZDxBNkqYjN2YtohKdSzJXRvt4jkVAIKDYgulJF/r3Tgkfqqaf+6RH+sJPvCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE92RFJtUHQyZTdOdDhEbm5oeGtqb3Z2M1E3aXhnQmpKYW9pR09PeDE3Q1Yz?=
 =?utf-8?B?TWp2WHU3c2NGR0MzZEl0cXhVWTFONW9mU3hNaks1R0Z3Z1VFL1N0MEtrNSs2?=
 =?utf-8?B?aHBtNVdJRUd1ZTBCWElNRU1NSkM3dTVsdkRsYWdHOFA4d09tY2pxMTdUcTk0?=
 =?utf-8?B?d2svQVA2dVJUbWdiRVUxKzZEbWFXYW9vbWIrclp2cmt4WnNxeFZ5clJDQXJn?=
 =?utf-8?B?ekFzNGI3RElxTmZFdnpEOEsva2U2YzVnc2VwS3RZNTR1Yk54eFBNVTg4aTIy?=
 =?utf-8?B?QWlIcmp2bVhUeEdyT0lxaHhKdmpwbVNVT3dFNTBKM1VrUTdHc283WW1VWkhM?=
 =?utf-8?B?Q3dRaGNEQ2R4Ykl2eEZTeTVqT3U2dldHcHZxVlZ5NmZ3VERMdHllVUNvK2hY?=
 =?utf-8?B?OXdZS3pIK2pSR3kvY0RLRmNFL0NPMnVNeXZNamVlZ2tlVTY3RG1rcXRVeUVZ?=
 =?utf-8?B?aC9BS202eTQxRlczTmhUNnlad0JwNi92TU9WUFVpWUtzR29xOEtMYnFja1BN?=
 =?utf-8?B?MGZUOWI4SWNwdnR3NzhaYkFNaFU4b3VGeFdZOGNScm93V01TbEZVdFBDWDVG?=
 =?utf-8?B?Mko1YzkzMkJMY3paNlJiUmRHMWlBTks2Sk1USlBQRTB5RzNPelUxdWVhczI5?=
 =?utf-8?B?RFlTUGNsbTNMMGdsd0JBQ0oyNWVKeUdJK0dWSFkvTy9TZ2wrU296NGRGdTlY?=
 =?utf-8?B?SFllTDBLTzVTZFIyVXdBVzRkSTcxTEhQM1U0Tk9uL042dWN3L2puTWNuRjFX?=
 =?utf-8?B?N0hMR2dpMTZvUFVGZEVKbEFYdjlITWQ3dzQ0M3Nka2Z5cGt0OG1HOWdaY0Vi?=
 =?utf-8?B?cTVGczNMQnNUUHE1a25mMzR5ZzF0VUhwWVJlamJnd3kxZklLdlFxVGl0Smsw?=
 =?utf-8?B?eWZwMUMxdXpCRW52Q01haDFKQzRML2swb2MwRlJLRDQxYVR6TjRyUExPT2ln?=
 =?utf-8?B?cFp3ajlBbElrU3c2dkhBKytRK1lQRWZDMXd4dU4yeE8wNklrci9NMlY5NWNr?=
 =?utf-8?B?Y3RYaWVua3Q0a2ppM2RyVStTU0tSdndrTnlSRUZsaUx6UWtDZnprOVN4cHdv?=
 =?utf-8?B?VHNMSExuYXIvZ3JrMDg5akkvWU9KRW9BMy9hM1ZHVjFJbW80UHEwNjJZeDFz?=
 =?utf-8?B?K0Uvbm1rOHYraUpMOWx1anZueTloUUN3eWlUb0RDbUJzWkp0NDFCbmNtbnN4?=
 =?utf-8?B?cE5zTTU2QkJINDQ1SDhvRGNXR2hrang2bCtSM1lFbVBaZU4xSHd0bm5LNWxS?=
 =?utf-8?B?d012SXprZTA5Um14TmNaQ1FBK2ttSkFLSG95eDc4VFdTbnplZk1ZSGxpZ2Z6?=
 =?utf-8?B?dW0xR1JKMnd0RklrL054UGdBbEx1YVlsNEF1YkJ1bDd5ejhyNXRuZVB1U1FY?=
 =?utf-8?B?M1drQmVOYWlNSDJWSHMvdFpNeUhhWWxWZTJVaThlYnJrVmZMQmh4Qm54Z1hy?=
 =?utf-8?B?VytFaVk5MW5zS2ZOczU3bWJSQlpXTTZMT1ZBRTlQZzY1c0NYNll5dnM3dW5X?=
 =?utf-8?B?S09lQkVwMjQvK2s1YWx1d2FCL1hLZ1lENzJQQjdJSkFlZHFrNTJjb1MvYXFw?=
 =?utf-8?B?VVM4elV1eU85K3d6OVFXRU9TQnZNYnBvWitvdnVjeTNrQlNnenJxQThUWkp1?=
 =?utf-8?B?R0lJSmlaZno2d3hVTGIvTjNYK1Q5Tzd6TTFGV0hmZW9pRHFRcWJ5dEZ0eUJW?=
 =?utf-8?B?U0hReG1VcUhPV1lTSXZhcTF1blA3a2Z3VEtKdnpyN2VvZXhSbDhIZTRoNURu?=
 =?utf-8?B?MUpSTlcrTER0cE0yL3NjVWtlSFk3eHhyVTZNUlZGOUg1WFhLUldmZ3lQSGY2?=
 =?utf-8?B?UUJ2Q2U0bVJlZkN1N1dXa2JxQStmOFpmbGtRdkh3SGhENkFRQ1VoVC8vVWNl?=
 =?utf-8?B?WUVLdDQ3b2RkZk41OWF2eUdKRksza2JsOHBzUXJReHpBQlpwM1RWTzR5SWd4?=
 =?utf-8?B?enZzNXM5L3pYSXZJd0RhM2JPQ3JEMmxVSXcrdWpEdlk1V1BTbjhmd1N2NWpm?=
 =?utf-8?B?ZU1tV2xyd2hsQjgxd0paZ25TMmZpRHZqdTFsdkVCUWVCTUxBaEdDb0R3UjZ3?=
 =?utf-8?B?M2p4VUwvS25PQTdlcHhLcVAvWWczWjlLbTBHWEU2d2RoQmlMOVFVaWFsc3Bw?=
 =?utf-8?B?TFNDZys3Tmh5Tms0OVJ4L3EweFMvcjEvVHRTbWtXblhic2F6VHRBOVJIeUZT?=
 =?utf-8?B?cGpWcEQwbnErT1MydWt5QkRVWGlhekloaHliQldVU2thc3VTU1B2YlRqQ0Yy?=
 =?utf-8?B?NVhKN05iSFpJLzlMNVdnT3Z4RW9yK2dvTHp2MEJ2VU1VVDUxS1Qrc3puMWpE?=
 =?utf-8?B?Z0x5bmlZNW9vNC9yMWFFZm0zTVIwMnpSUjNCWjNZOExCblJsM3pyQmpGQThh?=
 =?utf-8?Q?YOZexu/rp4VVdA6c=3D?=
X-Exchange-RoutingPolicyChecked: jXDlLjqvjyEqbVj8oF4pfqAz2wdj6s5B1IgQAtisTbvF1mz9Mb5cOtYqzjMgYSfI2GguEKA83jnw/bn0duqWmO0xRFDKbSBpswx7mQVWw/OHo1p7GoapBmEovEsJ5LGBMXytbrkdr6cryzk8FPMcggTtZ9bA5mLMrefKvDx+eVDBguWSoCogLVIgVPRvK3VAf33P1HG6NCb8XSMD3sHy2DJpaULAqh7a9cxD732Mv6gneIbFoZESITJ8AeCq07SgHZMrmGnSUN3ykCUSZtPGUeTNARm6Na/ykDyMaDQ/8+vMwVpV3Apc5O5NNMIgbkeHDHwhKBs79zc6Oj6fLSHq9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb30bc2-528c-4746-71e6-08df19a87bc5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 19:25:53.6491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DE6XbayK2LUaZUgiJ6uHvFXl5enxxdiMNrN/QzflKUtAqGBvtSskCPOgyD89ko+zDYpH9360aLU1UxpnIu1/UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9554
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

Hi Anirban,

On 03-08-2026 15:19, Sk Anirban wrote:
> Handle a pre-existing configfs group by opening and reusing it, retain
> it across cleanup, and validate the fd so the test fails early with a
> clear message on any error.
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_configfs.c | 39 ++++++++++++++++++++++++++++++++++-----
>   1 file changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 450c0a119..32e1f9e2d 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -26,6 +26,13 @@
>   static char bus_addr[NAME_MAX];
>   static struct pci_device *pci_dev;
>   
> +/*
> + * Set when the device's configfs group already existed before the test
> + * started. In that case we must not remove it during cleanup, so we leave
> + * the pre-existing configuration untouched.
> + */
> +static bool configfs_group_preexisting;
> +
>   static bool check_registers(const uint32_t reg[], const uint32_t val[],
>   			    size_t max)
>   {
> @@ -60,7 +67,7 @@ static void restore(int sig)
>   
>   	/* Drop all custom configfs settings from subtests */
>   	configfs_fd = igt_configfs_open("xe");
> -	if (configfs_fd >= 0)
> +	if (configfs_fd >= 0 && !configfs_group_preexisting)
>   		igt_fs_remove_dir(configfs_fd, bus_addr);
>   	close(configfs_fd);
>   
> @@ -70,10 +77,19 @@ static void restore(int sig)
>   
>   static void set_survivability_mode(int configfs_device_fd, bool value)
>   {
> +	int ret;
> +
>   	igt_audio_driver_unload(NULL);
> -	igt_kmod_unbind("xe", bus_addr);
> +
> +	ret = igt_kmod_unbind("xe", bus_addr);
> +	igt_assert_f(!ret, "Failed to unbind xe from %s: %s\n",
> +		     bus_addr, strerror(-ret));
> +
>   	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
> -	igt_kmod_bind("xe", bus_addr);
> +
> +	ret = igt_kmod_bind("xe", bus_addr);
> +	igt_assert_f(!ret, "Failed to bind xe to %s: %s\n",
> +		     bus_addr, strerror(-ret));
>   }
>   
>   /**
> @@ -93,6 +109,9 @@ static void test_survivability_mode(int configfs_device_fd)
>   
>   	fd = open(path, O_RDONLY);
>   	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> +
> +	set_survivability_mode(configfs_device_fd, false);
> +
>   	close(fd);
>   }
>   
> @@ -363,7 +382,15 @@ static int create_device_configfs_group(int configfs_fd)

Seems like this function is also used in "xe_survivability" as well. 
Move the this into a shared source file and expose it via a header.

Thanks,
Soham
>   	int configfs_device_fd;
>   
>   	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
> -	igt_assert(configfs_device_fd);
> +	if (configfs_device_fd == -EEXIST) {
> +		configfs_group_preexisting = true;
> +		configfs_device_fd = openat(configfs_fd, bus_addr, O_DIRECTORY);
> +		if (configfs_device_fd < 0)
> +			configfs_device_fd = -errno;
> +	}
> +	igt_assert_f(configfs_device_fd >= 0,
> +		     "Failed to create/open configfs group for %s: %s\n",
> +		     bus_addr, strerror(-configfs_device_fd));
>   
>   	return configfs_device_fd;
>   }
> @@ -371,7 +398,9 @@ static int create_device_configfs_group(int configfs_fd)
>   static void close_configfs_group(int configfs_fd, int configfs_device_fd)
>   {
>   	close(configfs_device_fd);
> -	igt_fs_remove_dir(configfs_fd, bus_addr);
> +
> +	if (!configfs_group_preexisting)
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
>   }
>   
>   int igt_main()
