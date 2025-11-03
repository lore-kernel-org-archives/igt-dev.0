Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BC8CCF9FE
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 06:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1B410E14E;
	Mon,  3 Nov 2025 06:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYhy2Qsj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCB510E14E
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 06:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762150667; x=1793686667;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NkQQqX/E7jgwli3MvTH7HxXRm+9Gr5/FZSrO6ht77cU=;
 b=nYhy2QsjJ91iLlHP8niNkeIJpdDDZk+BWD9C4Ut6gVMtteVNiR6sYfBO
 VGgtzoBpSdAzGwE0X31W2tcRLdFnhvft/3voZM9B4IjkXCzbwt7YrR/yO
 MAeUS5VzO5AGZVwHzCJUIqXIL/3683SW9HgZkw+tInBeNVwA2S8vDoyE3
 T1Y45kC/zN/v25rGmRzkrBVWX6ADq+K3XiyCBkswgEWyZXziuIVez2rft
 I9jR/UAWHkK0Ym13ewxwjFQCZOKt0/sdqpJUDEeX6c/ac0cllFXQce8dm
 JH09ReAfV+2Ckexw2JAlMbbPutXCOLnAB09L2NRvmjOzDHNIGUgWd20Uz g==;
X-CSE-ConnectionGUID: 63YO3mSMTzKknedc4J+uDw==
X-CSE-MsgGUID: O5ivH5dgQtuKSfs60ihvLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68059267"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68059267"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 22:17:46 -0800
X-CSE-ConnectionGUID: 9fQA77bUS+uPu9NbWQMHuA==
X-CSE-MsgGUID: U5sRzd/LQOCfdO/4rocg4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="191942596"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 22:17:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 22:17:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 2 Nov 2025 22:17:45 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 22:17:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHkiuTFPYV4gfRZSXX7cbLXVJfW0y9QRhM04294ZUxgDgLvwGJ25XAPaaVjRAQanho6mkfvj+1d+NBHMUQQBX4a+n60BZDQ6hWHCxn+hstDBfjn35ph/t6mBHnQseXx8v6yER4y5xhpu2VYFjSBTh/PjMjPnKpeNWVm5y6qMywmaXb/6q8q0YtQHMvEwRmq6Oem3kZDt73PGi639sh/T+Ihs/FXwqMRcWs5BBMwRuax7zsJX7L66wpEcaBQVzKoAv56qt8nbTODEtz51zGp0q50C2bTw0ARl1y5DdI/MDBLKrVc004jymE+PIvzhRcqtTUpnpHu8EzzqsLG7MrsgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HQz75kdWs5GV/FmjGuUfZfv1cSi5IYFsduW4AzmrBE=;
 b=dWulnGo/aPwumYlAHJEPO0AEQesqV/x/rFghu5YEm4Q0dlnXZxFaQyht+v8E+GBsfz9fjgRof+XPiidsLoMWCEeCghyGmDwW7fO2GBOm9bgUEQKSzywwRi8YIReIluIHAPsGsMq81zxXm5rNrmsNdJHN0XH7EDkp6Qcu/lah/aStQRPBvYpsNHTWtITBduFpPSNUmpGP/kHwuZts9NzvS3H8ua8pCnqdX/bOHRbFZ5HLsskt6anHS8vs5LIWPLJeQGS44lNFLBK4fgxWisaLZO93vLrgITHEpmsvIr7u8h8It0hpPhNGWxEscIrOUDFJwIzFV+TpDjxAId6s7D3hzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Mon, 3 Nov 2025 06:17:43 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 06:17:43 +0000
Message-ID: <308b722c-765b-4a73-a977-afb7bb54aa79@intel.com>
Date: Mon, 3 Nov 2025 11:47:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v9,
 2/3] tests/intel/xe_survivability: Add new test runtime survivability
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20251031093452.3842245-5-sk.anirban@intel.com>
 <20251031093452.3842245-7-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251031093452.3842245-7-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0212.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a9f445b-3422-4c83-322d-08de1aa0b2b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlgxbkhpUmRJT3VaemhrY2kvMTRXV2JRMW9Wb0Q5NDdLeXQveDU0TEZGbHZT?=
 =?utf-8?B?ak5GVklDZCs3ekdXOG1UbFhmR2dJQ3BEZGNkcEdqbmMxcnAxN2pJNW9DelBE?=
 =?utf-8?B?TzE0R0lndlJXdXhEN0dxdDZtdmthOVl4Nzk4bXpLR2Z3OUxyWUp6eFpCMlox?=
 =?utf-8?B?eDRaMUt3U2hvbUNMNnRzTjFJWDM3SmszV2hYaDZaY0RSQnB1WFUyUGhwekpx?=
 =?utf-8?B?ODBjaDEwb3ZKNi9uWmhsR0U3SDZDS1hYZUdmSGxZU2QvM2duK1J1ekZNcnQ2?=
 =?utf-8?B?d3A4NFU3MTlFWml0a1JKL1BmQ2Q3azJieHJGUEFNZHRCV3IyazdjUEt1WGRq?=
 =?utf-8?B?MWJORmFJODlLR1hyVXRSTGhLMGZmZVBXU3BBMyt5K1c5ZnU0WEJUcVpyRU0w?=
 =?utf-8?B?SXUzanVXcjdqNjRhOWFxMk5TTC9HSUt4ZCtkbU14SmlDL1BkcndjODU1WlB6?=
 =?utf-8?B?SUdTRmQrTUI2NEF5VkEvWFdSK21UVXlocVF5NVJMUHhkTW9XaC9uVk1yUU5n?=
 =?utf-8?B?YzQrQW1YNmtzeU1FN1lTTEpXdVhCMG5JQVpZbWQ0NmFhZXZILzF5TExjV0ht?=
 =?utf-8?B?anpyMWRsQlpScXc4M0ZQbWFmODM1ZStIQ1pMQ1lQNWJTblQwZU1waXIyYmw3?=
 =?utf-8?B?Y08wdTV3NmhGREh5dlpRbXUzQmI2WDgwZTJNV1kyd1VEMU5EREN5eFVBRmFn?=
 =?utf-8?B?bUNyaWtpczIwelB0OGh5Y1Q4Rlh4NTgxaWw3eGxheFV0c3lNRTVoWThYczFy?=
 =?utf-8?B?MDNGMDRiaHRDYk5VUVo3bW4xMTUxbkc3K25iWDRSSkpuSjh6MkRJYmRtR0p5?=
 =?utf-8?B?NDU3TkIvd0o0bWVTd21LdGNpZ2s4Vk5aRUtmV3I5WEZycktDZVRCZ0xzK3ZJ?=
 =?utf-8?B?cTcvQnEwWElCRW5sMVY0TUNkT013Ly93TVIvMzZqWUZmS0VUYkpZZS9Qd08r?=
 =?utf-8?B?cXFmcjM2OVNPNkNMRG5LYWRzQnUrc1F1R1FYd1kwS2xGUm42MHJoR0NBM0Uz?=
 =?utf-8?B?cjYxeG9nc28zeDFaOUFncGVsVk1mTHdnRGt2aEZzTllrbFpBdENReHY3VVo3?=
 =?utf-8?B?M1hVd3lCTHo5WkZPSHdaU3k2YzVyY1RUMlBwbnloQ1RQUy9Bd1kxWW5vRUhy?=
 =?utf-8?B?aE9hb2hUMC96NlBQcFBHQXhYYnNERFRJcTF0Y3VmVDIxaHRJWEpoQjlXeEtL?=
 =?utf-8?B?Ly9XNGdlK2J2ZEdEaXp4YjU3YmFQNzg2RkUrRVFEOThxc0o0ZG5LaThueitR?=
 =?utf-8?B?R2RBVkV5VWVIenNjTEpET3ZtOUJJLzdxeitmcnZDS1pmc2JuRHZtV1NTQ0sx?=
 =?utf-8?B?NnFQVHRCTlZFS2xobFN3eG9UMTR5a2ZoMTlEOWltc0JFdFFQME83TXdRUlV3?=
 =?utf-8?B?TGVnZUpzL0NWWUFEQ1VjbTVrUVdnTHZ3SUowa093SkgrNDh4RnFBc3A0RVZo?=
 =?utf-8?B?a0tpUmlEZGpIVEMyZnlNbGVUdmxhN0FlY3ZRSWw1SGVuRnQyNjRlZ1psd2ZV?=
 =?utf-8?B?YjVIVDNMdnZBK0xTa0tQNHIxOXQ0c1dZZ2o4c1BBRFJBcEh6UXdrdU9lWUhK?=
 =?utf-8?B?Z0w2SEo2REpnMFc2eFpqZEpONi9Jdm9PR2hQZWR1V0pKSGowT2ZWY3Iva1ht?=
 =?utf-8?B?RjkyUFJYcGVQRXJxK090U2dFNCtDcFlCUmpwZnNNakxUUE9XNCtFTk1hMG9x?=
 =?utf-8?B?Tll3TkhLZ3l5bTE0bFVYeTVITDNkdld3Z1pMcTlLM3pUVHlhclZFWlpOaGMx?=
 =?utf-8?B?QktEZG9HWmlRdUhHTi9RZ1I2bWtGMzhjaVB4V2s0a0t2SVRNUjZqM1BTVUhD?=
 =?utf-8?B?cGsxN3FrQ29Dcy9MN2NEcHVHVmptdmpiMzBBbDNVT2hiQTN4c3ArQWxmOWJO?=
 =?utf-8?B?ZWV6QWl5aGpDSVVhNWVTZGhvR1pqUFk2ZmFEdHRDeEdXUW5Icko0ZTc5ZlFN?=
 =?utf-8?Q?noNsCs/RO5LDQTnYBKZldcx9ELhO62ch?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9nK1Uwa2t1SjI2ZXZuczVZTTROV1JjeUN3djR0NUdkLzlPVXQ2UDBXU1M1?=
 =?utf-8?B?MUVBZ2NMU2NGVU1jME1HV0FNekV4TlFGOHVQWnNKakdYOTlZRHBxK0d2K0x1?=
 =?utf-8?B?NmFibnEvYmpsTGpNWTJtTmFIRGxQMDZ6U29QWjAwZmlmVnVSODBQZGFkeFh2?=
 =?utf-8?B?YTdhcFpCcmlEWlBTUFZPS3EycW9ycmIxNXNSaWx0ODA1VHM5akw3MUJxY1ZZ?=
 =?utf-8?B?L0piSlFwU3lhU3ZQbHFjay9iT0tFeWU0TmsyNVpxTVFYWXRmUkRocmZJYzRD?=
 =?utf-8?B?RGRLaVNoWFVFY3g3RTRDUXo4WW1lb1ZwdVRPSFJXUFFxU0dpci90cEZrelV2?=
 =?utf-8?B?bXZWK1I4aVFadDVPeVhpOVluZmVlYkhZbTVWSmpJMVE4V09NejNDQ3EvUFQw?=
 =?utf-8?B?L2dRcnBiUiszQ0ZIZGhOTmlZUGtxdEpEd2l4dzhBSVV3dkM2RmtCYXI2QnNo?=
 =?utf-8?B?Tlo3aEVxWk1EUzdqSVhXaWFjdlcrTE85YXRvZkhWenNmWGkvT05uak8vU2VO?=
 =?utf-8?B?MllCWlhQKzdHb1REeFlPa0RLLzJDZkJ3R2ZRVFAveCtkMEplNUF1K1ZyMlc2?=
 =?utf-8?B?YnhyRS96dm5DUVJXTERMUFdJb2oyblVlSTg2L0pYeEFlS243WWM5REthc3Bv?=
 =?utf-8?B?TFM5OHpHYzI2ODFvRU9IOVpVNVlYL011NjJrRGc4L2czREh3bmVOS2h1N3B1?=
 =?utf-8?B?MG1OQktYNE5FVXJIODBWVG1RZDRBNTVmakVwYVkxMkRpOEJtUnhQcUVXalFD?=
 =?utf-8?B?UUl6RUFQam9FckpRalViaytMNmJzaEluYWllSTRkSXhCeXBUWnB6UnNpOS80?=
 =?utf-8?B?MG12WWdIV2l0bWhqRkEweDYwUldhd3Noek9wN0tGekdOWHlSamQ0blVLTEZL?=
 =?utf-8?B?SkZ1ZWZEcEtOelNhQVFrdTA4RHdYM2RVaDRNMjl1L21kajNjT0JkZ0t3MGQx?=
 =?utf-8?B?REJna0I0U25ucFR3VllsTys2L0wvaFhnMWgxb3c2TlA2b2NpRVlnaWFEanpM?=
 =?utf-8?B?T2tabnVSeHF0eDB4YXZxa1p0L293MlBMRDM3eFBVN0FGY29RbVFDeUFQV3Zl?=
 =?utf-8?B?bFZaNm5jMnlHSStTRmlsc3NPRUIwK0Y4dVhKYU0yZ0szdWNKRHFEMlR5WEJv?=
 =?utf-8?B?Nk5FeFdUQVlJdkpDTXhKZ3NwSkRxVDBlT2FEMWRDbGtaWmZnZjd5UmxFMjhE?=
 =?utf-8?B?MjVodDBrY0psU3NRK25CdGJ0ak9HUjFQZkM3TTZ3bk0wYmlSVTJOcWdjWFBn?=
 =?utf-8?B?UUlNQlhBZkZ6WmJoTDhjaEJyaVd4K2dJbUkxNFU3R3dmRU5nTGYwaDJ6QldL?=
 =?utf-8?B?eTQ5RWNiUlhtaHdNVFF4dlFJSzMvcXMwU0VaYWllTDBpVXI1UlNrUkZrVlU4?=
 =?utf-8?B?MVUwNXNpMVFWOTc2dnFETDdJL2lwOEFzV21lVHpEKzVEb0tBV1NJL21EcFlr?=
 =?utf-8?B?dWtUQnVoZU9sM1Mwc3R6K3A4V0VXanFXaUxiYWxBNU1VOVBXMGZ6UTZmMjhp?=
 =?utf-8?B?bGN5UzdRNUhxeVRIN051cTduelpRMGtFSnBWd0xGemZ2TXFWZXNoeHorMHRj?=
 =?utf-8?B?aEF3d0hpaCtsZlhYaW1ESExrajRSRDkyNGN4am5RNTVGdC9GMW53MlA5VzNk?=
 =?utf-8?B?OVVEaFlxQktEc0RSSmlML3JJaWZMYjRGN0lNUzZWSTJoV0lUR24yTW9rM01B?=
 =?utf-8?B?ZXlnSEhsYTBORUFpU3VGOUZkK1JIdnJZbWdUNEpneHJFNTd6WVhmQ1JmWG0w?=
 =?utf-8?B?SnNDa3VId1RQMXZzWmxQTUlxWlBaQ0xOclU1ZndLeHVzQndDZjE4NkduTElK?=
 =?utf-8?B?cE4zTnBRVHB6bXFFUEoyc0hXS3A1UFlZQUtsaEJRUyttMUNHVDVwZGZOMmNY?=
 =?utf-8?B?dEJER1IvTGhQejdvd0pkN2FUMzdoOWtxdWNGSmFQL25Ganhyblk2SzE0Mjdk?=
 =?utf-8?B?Zlg1TGQreVgxREhnVG9OZ2c3SGlEL2RubzJnVC9YcEsxaG95Z3dkSGliQ1JT?=
 =?utf-8?B?R0VkdmZPWGRyZnpldU5Lc2orNWpoMDFrN3p0Sjl4NlNjdEUrUDlsRTBJMXFk?=
 =?utf-8?B?eHJuTHEwRFNIK0dyRnI5NEI1SW5LZGVzc2xRQThPYnlSVEZrcWc1VjlUZDJo?=
 =?utf-8?Q?3o+StvLevbRnckMNqm4eYCQ7+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9f445b-3422-4c83-322d-08de1aa0b2b4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 06:17:43.2415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcLC65eda0aHweC20m+s/eGndMmbzbv6mIU8zpIiZhUPej7sTK+iCVRoy1QamxvrNxAg3+EQJgGtZdU/mXoQIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
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



On 10/31/2025 3:04 PM, Sk Anirban wrote:
> Inject CSC error using debugfs to test vendor-specific device wedged
> state and runtime survivability mode.
> To return the device to a normal state, reload the driver, as
> the wedged state can only be resolved by rebinding/reprobing the driver.
> 
> v1: Modify the uevents interrupt handling (Riana)
> v2: Use separate function for sysfs (Riana)
> v3: Update ignore dmesg regex
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel-ci/xe-fast-feedback.testlist |   2 +
>   tests/intel/xe_survivability.c           | 110 +++++++++++++++++++++++
>   2 files changed, 112 insertions(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index a9a4f105c..e64fdf400 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -186,6 +186,8 @@ igt@xe_sysfs_scheduler@timeslice_duration_us-invalid
>   igt@xe_sysfs_scheduler@timeslice_duration_us-min-max
>   igt@xe_sysfs_scheduler@job_timeout_ms-invalid
>   igt@xe_sysfs_scheduler@job_timeout_ms-min-max
> +igt@xe_survivability@i2c-functionality
> +igt@xe_survivability@runtime-survivability
>   #igt@xe_vm@bind-once
>   #igt@xe_vm@scratch
>   igt@xe_vm@shared-pte-page
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index b20192958..9b8606939 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -4,7 +4,9 @@
>    */
>   #include <dirent.h>
>   #include <fcntl.h>
> +#include <libudev.h>
>   #include <limits.h>
> +#include <poll.h>
>   
>   #include "igt.h"
>   #include "igt_configfs.h"
> @@ -13,7 +15,11 @@
>   #include "igt_kmod.h"
>   #include "igt_sriov_device.h"
>   #include "igt_sysfs.h"
> +#include "intel_allocator.h"
> +#include "xe/xe_gt.h"
> +#include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
> +#include "xe/xe_spin.h"
>   
>   /**
>    * TEST: Comprehensive survivability mode testing
> @@ -26,10 +32,25 @@
>    *
>    * SUBTEST: i2c-functionality
>    * Description: Validate i2c adapter functionality in survivability mode
> + *
> + * SUBTEST: runtime-survivability
> + * Description: Force Xe device wedged after injecting a failure in CSC
> + * to test runtime survivability mode
>    */
>   
>   static char bus_addr[NAME_MAX];
>   
> +static void ignore_wedged_in_dmesg(void)
> +{
> +	/* this is needed for igt_runner so it will ignore it */
> +	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ECANCELED"
> +				    "|CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
> +				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
> +				    "|GT[0-9A-Fa-f]*: Failed to submit"
> +				    "|Modules linked in:"
> +				    "|__pfx___drm_");
> +}
> +
>   static bool check_survivability_mode_sysfs(void)
>   {
>   	char path[PATH_MAX];
> @@ -42,6 +63,58 @@ static bool check_survivability_mode_sysfs(void)
>   	return true;
>   }
>   
> +static void check_survivability_and_uevents(int fd, struct udev_monitor *mon)
> +{
> +	struct udev_device *dev;
> +	const char *prop_val;
> +	const char *dev_path;
> +	struct pollfd poll_fd = {
> +		.fd = udev_monitor_get_fd(mon),
> +		.events = POLLIN
> +	};
> +	bool event_received = false;
> +	int timeout_secs = 30;
> +
> +	check_survivability_mode_sysfs();
> +
> +	igt_until_timeout(timeout_secs) {
> +		if (poll(&poll_fd, 1, 1000) <= 0)
> +			continue;
> +
> +		dev = udev_monitor_receive_device(mon);
> +		if (!dev)
> +			continue;
> +
> +		prop_val = udev_device_get_property_value(dev, "WEDGED");
> +		dev_path = udev_device_get_property_value(dev, "DEVPATH");
> +
> +		if (prop_val && !strcmp(prop_val, "vendor-specific")) {
> +			event_received = true;
> +			igt_assert_f(dev_path && strstr(dev_path, bus_addr),
> +				     "Expected bus address '%s' to be part of DEVPATH '%s'",
> +				     bus_addr, dev_path);

you need to clean up udev here too

With that

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> +			break;
> +		}
> +
> +		udev_device_unref(dev);
> +	}
> +
> +	igt_cleanup_uevents(mon);
> +
> +	igt_assert_f(event_received,
> +		     "Timeout waiting for vendor-specific wedged event after %d seconds",
> +		     timeout_secs);
> +}
> +
> +static void force_wedged_csc_error(int fd)
> +{
> +	igt_debugfs_write(fd, "inject_csc_hw_error/probability", "100");
> +	igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
> +
> +	xe_force_gt_reset_sync(fd, 0);
> +	sleep(1);
> +}
> +
>   static int find_i2c_adapter(struct pci_device *pci_xe)
>   {
>   	char device_path[PATH_MAX];
> @@ -121,6 +194,18 @@ static int create_device_configfs_group(int configfs_fd)
>   	return configfs_device_fd;
>   }
>   
> +static void test_spinner_after_recovery(int fd)
> +{
> +	uint64_t ahnd;
> +	igt_spin_t *spin;
> +
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	spin = igt_spin_new(fd, .ahnd = ahnd);
> +
> +	igt_spin_free(fd, spin);
> +	put_ahnd(ahnd);
> +}
> +
>   igt_main
>   {
>   	int fd, configfs_fd, configfs_device_fd;
> @@ -148,6 +233,31 @@ igt_main
>   		fd = drm_open_driver(DRIVER_XE);
>   	}
>   
> +	igt_describe("Inject CSC error to test device wedge and runtime survivability");
> +	igt_subtest("runtime-survivability") {
> +		struct udev_monitor *mon;
> +
> +		igt_require(igt_debugfs_exists(fd, "inject_csc_hw_error/probability",
> +					       O_RDWR));
> +
> +		igt_debugfs_write(fd, "inject_csc_hw_error/verbose", "1");
> +
> +		ignore_wedged_in_dmesg();
> +		mon = igt_watch_uevents();
> +		force_wedged_csc_error(fd);
> +
> +		check_survivability_and_uevents(fd, mon);
> +
> +		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", bus_addr);
> +		fd = drm_open_driver(DRIVER_XE);
> +
> +		test_spinner_after_recovery(fd);
> +
> +		igt_debugfs_write(fd, "inject_csc_hw_error/probability", "0");
> +		igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
> +	}
> +
>   	igt_fixture {
>   		igt_fs_remove_dir(configfs_fd, bus_addr);
>   		close(configfs_device_fd);

