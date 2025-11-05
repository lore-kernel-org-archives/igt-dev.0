Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406F4CCFA04
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 05:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E007A10E6BA;
	Wed,  5 Nov 2025 05:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RolKRRgq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F3C10E6BA
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 05:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762320037; x=1793856037;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fURxiK8IavGsyNsOgR6d2a8EoGnKuADrEMLrYekgsOY=;
 b=RolKRRgqvLDK9GuRouDFHBFq6TFqTaPsPVITkig2Uw5p7EpPA+5qgpE4
 Knmpk7Pv+zcHFxP6fZEjwXBwcchlzVLwIqXlgB22GFErsQwI/JfIYPE4/
 zW78hYLPLO9MaGkOVbVKtGR9w3M7XtzIgXIAGgNwfhNf5mC39c+osqTe/
 4eDgZXhIxRmZsqwzeV+Y1uERuUicquNh3ROnmNQMJjlSDI9b+madEBU8s
 zFmBT9ETEJZUfxneErPlxZQ4FN1iGk+K97CzVDmj303alBAL13iFdW/IZ
 4PDpBvz+CCcsiNS4S/ndDT5wwMJrQebyQyIyMEXVodjd/ZGUXez9kqKcs w==;
X-CSE-ConnectionGUID: onmGx7ZRTyKF7g5JnWo6pg==
X-CSE-MsgGUID: Ia6igXV3TCm+hlwruvTO+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64349833"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64349833"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 21:20:37 -0800
X-CSE-ConnectionGUID: rVY+TefgTdm0I5geQb21CQ==
X-CSE-MsgGUID: gQBM2dAcQsmX5LA2MorrrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187805655"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 21:20:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 21:20:36 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 21:20:36 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 21:20:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjvd/CM2va0vUCTl4eXC70HpXXvMrlk5yxdTAmSxKJorW7hyBI84bT+VKywutRWrQv5WPILrppzT/1VVcebqXO9lC78oxBWP472rVaoEGbGA+K9pftqYiVlV/7qRJTmK2eMtXbhzJd8agXX0gKqhibPv1pH1Hw/bJy7pD5UFnfp5syiEmAIt3PlAUrDto/QQ6dTyxWn00S2+WcDDtrmKYAsjcTmcr9wHAoDyPAeP9FHkv6xSoCkOoCn6FC/a1hHa2nNvBUsUC8Bqu3CtCA7lurv8LwRuMjenF3oPLFSlWM3CCiC1mvEXaqRU291Pz3XOVY8Aogw5bu8sEKKbt9PiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fURxiK8IavGsyNsOgR6d2a8EoGnKuADrEMLrYekgsOY=;
 b=crt5SMA9+8CVUYPloZJiqjJn09bxaQ1pIqNeaKax2g6x5nHBZsGrwVX20cBi7haBQCQiLDO9UHTv4AkxmzdKAoPffMagwmUBcv/1Vu5y61f2WQyNoP9oSWSw8n3z3VSK1jcjtP2jK9JLAZzl7cqZDl7H3pF4hbHTp1gb8+5F/NWvLjoAtkEReqmKseF3GKQl7i3uXs81qoCmTEoIwp/oCDDs5pIJBPwSA2sbG/dd3l28a89IlBbJiolOqKtAZL2B/3IqVh2dWeZkhoEea0QcxCLvoHhsYoenW3zKcx2rxf5xL/l0eslWYLi4nS0nKEVdDEecUZWNYW4mZ90Pn7EbgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SN7PR11MB7512.namprd11.prod.outlook.com (2603:10b6:806:345::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 05:20:34 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 05:20:34 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B S,
 Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v1 2/8] tests/kms_writeback: Validate supported
 formats lib/igt_fb: Validate supported formats for crc calculation
Thread-Topic: [PATCH i-g-t v1 2/8] tests/kms_writeback: Validate supported
 formats lib/igt_fb: Validate supported formats for crc calculation
Thread-Index: AQHcTKuU6R55YeZKQU2J9ccv9b5tjbTirbAAgADgWbA=
Date: Wed, 5 Nov 2025 05:20:33 +0000
Message-ID: <PH7PR11MB6796FAAB6AAF27E7A8814516E5C5A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
 <20251103103842.3025204-3-sowmiya.s@intel.com>
 <20251104155600.33umgxyfs6tpa3ts@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251104155600.33umgxyfs6tpa3ts@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SN7PR11MB7512:EE_
x-ms-office365-filtering-correlation-id: 5eaa76b4-7df9-41e6-c53f-08de1c2b0bb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SEdkSWdhZ1doU1h2cXBmN3d5NnBNb1RkWk5maFd3Q1VWbTdRdDhlMTlyOGlq?=
 =?utf-8?B?NjRzZk9MYmZEbkhmMkFKdG80QnJtTVNWNllmZERjNk9LdUVaby8zeFZ4Z3NL?=
 =?utf-8?B?ZnZ1azlEZDVuNXpGdDkwUHNSM3c1Z0JhK01UMGVjQkttZzcybUhMOWdtZld4?=
 =?utf-8?B?eTFQUWNJbnNrR1JxckE2NVlCK2xBZHNkMHg3S2ZYL296VTJaUVMrNWRXRU5R?=
 =?utf-8?B?ZXdIbEtRWEZ5WXp5dlFsN3FoMWZubXZsQzNDdjlvM0RWSkc1RStEK1I4NmdZ?=
 =?utf-8?B?a29pWnVpanNhQlYwL2JLQmVIdTZlNDNjVkNrNW5LNXYxaHJyVE9ycDQ2anlr?=
 =?utf-8?B?Q2FPaCtVSDNOZzVVTkZka1U2ZE9GR0lDZ1lzRFAwY3lqMzcxSllaUVhLenUz?=
 =?utf-8?B?Z2Q1Q2J5Z1NWSnlsL21YUW9IVGlpbitXdVU2K04xZEpRbFVGT0x5dnl1YUps?=
 =?utf-8?B?MW1jdFVUeENsK1hTVytNQVU4UW1QeW9jSzl0Z2dWQS9LQW5JelRzVEVRSkxq?=
 =?utf-8?B?T0c5Mm40eFR6ZUJ4NXNTcDFaa1kzTWJ6VnJNc2E0R1BCcjI3OHNlVTlGNVhn?=
 =?utf-8?B?eDlPem51Zi9XTmlubDVxT09pcmpEZ1g5SmlkdFJZb1ZGc0J0Smo0SjVqVEUy?=
 =?utf-8?B?WnNJNzVIZ2RocCsvQjJqajllQzR2NFV2UTdSWjcyOGpCckdnTzh3UFpLclBr?=
 =?utf-8?B?UGJJL21IbmZxQlU4bDZRWVgyNWFSQkpueklUbUlrdDl1LzhsVHZ0RnFpcHQv?=
 =?utf-8?B?azZjeXI5WTFkR2tZZ3BYMlNJMlluOXF1WFJjS1BqbUYzOFVXdHRsR1didEto?=
 =?utf-8?B?cEY4TWdsQnpNd1duUkxCSUYvYnhrVnZtYnhyRDBqb3FSUWhjVDJlZnJ6RU1J?=
 =?utf-8?B?cGZaa3d4TWt6anBvaHJVaG1VMndwbEdZaDJaYkZPVWlrL1B5bWlQeDJiNmdI?=
 =?utf-8?B?NzlKWitqcHU4RSt6OE15Rm1xNU1lTk5BSXVwNExEb25JS0tRREpIdEJrV1BG?=
 =?utf-8?B?alR2Vm5MdUxNWEQxRVlBYndxa0x5eE9mVkN4VXJ6SnVYZG5FNHZ3RXRsUXRX?=
 =?utf-8?B?OFdmcURVcWVRcURuNXFXNHdNenZ4YTlDV3pHZ1ZDLzNpK1Z6V29pbDIzYit5?=
 =?utf-8?B?T0ZDQ2RqelF6Qm1DRUlPMVd5cVVHR1F2NS9rT1hyNE1YU052OHFDK3FnU3Jj?=
 =?utf-8?B?d1FHSlJZVTdQMHhUYm1LQUkzMk5iT2ZoVFBEb3YwV1RwMXBHZ3lCUXBETnln?=
 =?utf-8?B?MHdQNUNlRHhueUhKcWR6WHhRSHVJK3BYZU51RWMzVlhjQTVSc01JSllyYUlH?=
 =?utf-8?B?TllIVXFwZUozS2g3dWQwYi92N2pzV0FsaWpVc0ZMOXF1cEtDM2Y5MDd1b2VP?=
 =?utf-8?B?OVdhUFVZMHl6VG9MRGEyYVB3R2h1UmxIcHpkUGluUTRCQjhhQlZPdmlVK3N4?=
 =?utf-8?B?SDJVcDM5K3VMd0c4eldNajdxZmZOcmxiVWJPRHF1TldqTTVweHIvcUVtS3JD?=
 =?utf-8?B?WXgzM0ZVN1R4eVBwbGN4dlBoc0R0bUh1NU40ZHVkQkxuYnRhUjhqZFlUVEVT?=
 =?utf-8?B?R2xmK1NkRW1DYVUwY1J4QkNwTXpDMERVY2d3bThCZG50d09FQ1VTeXgzdlM0?=
 =?utf-8?B?VE5uWURpYk9NTU9CdUkzSHNFNzdEbTdWdHdDQy9tYWN4a01nVW9ZUGNGWk9s?=
 =?utf-8?B?ZGhSSDVSbmpESC9Ld1dIZGNmdUNnaUI0UGxXVWRyaW9rUnpyRXBzamo1TW9Z?=
 =?utf-8?B?dng1c3p1R3J3eGw2a0kwSkFTR1Nmc3pmWlFKQzkzTlNldjN0N0ZpTzd4dWR3?=
 =?utf-8?B?WXJ5alBlUlIyZlBDNmxKL3JNZ3UwdDRBVHNPTDhhdThHMTdGK3RwNzdWcjJC?=
 =?utf-8?B?RXVEWUh0TXJMcnNzcHh3cmQvcnFHSjhJQW4vU3NkcitITXR2em5sbHpQdFBV?=
 =?utf-8?B?akxXL1B1MHQvR054V3k5OGJ6U0xnZDRibjN6OU1zd2xGeHR2NTFYakZlWnJ5?=
 =?utf-8?B?L0xhNWdvSVVrZWxudlV3cFN0eGpzSFRPWk1STXJ6cEh4WEdydm16ckdkWEhB?=
 =?utf-8?Q?xYvPPf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlpyUWZzUjBzbUN6OHNHQ29WL3BxTEl5T25MOTlYQUFxYzA1Qlhoam92bmVs?=
 =?utf-8?B?V2RuRExyRXVRZVhiUWJPMldSRHpRamxtRDZwbzA2aFdXRCsvL05jQ3hUVTls?=
 =?utf-8?B?ZDJ3andIWlAxVWJsR2VpcG52d2kxOHhkZ1pLMUZTci9GM2ViYnMvSmpMelUx?=
 =?utf-8?B?WU4veWpVeU5VOHllU1JSWVRtUGFnbW9mZUZabXJrclVOdXZlOHRTUS9nbVg4?=
 =?utf-8?B?eWV6cjVjdHo1R3FzQ3RsUFRNNEtkL3B0UmwwRy9EZFlJUGthU0VyNE9UaElI?=
 =?utf-8?B?Z2h6cXRINy9GVVI2S3NNdFpFbVNnbnAxUU1yVWhhMVphMEpTMUVxWDhuZUVG?=
 =?utf-8?B?aXZYNFM0bGU2WEw1OWxwdEFHYndpd1hzaitkTlFwYlhteXYxYUxXRGZkbXVO?=
 =?utf-8?B?SFFPVVVZbEVtRFppVlN2WFpXTGtOL0cxZ24xQlZLcWlsWWlsd0dGZE1KNW10?=
 =?utf-8?B?MDFkRGllU01ZTlJwM1RGN0F1N20yckxoTUlPVlp0dlVKazA3dTdaMHRhMTlV?=
 =?utf-8?B?WThaMWI5TkdoaDBhSGtlMVVhTmpSTWFyZE1pVFcwNUNzb0lEeFUrdHhBMnRj?=
 =?utf-8?B?UDBoZ0xoUzZhTTR2UENQd213MytjaDkyY24vYldrbkhQV1NNcnNaTE9kNXRZ?=
 =?utf-8?B?QjJsRkplNnJjQ1RyazJFckZ2UGhRUWljdmdNb1ZjejN1dHNUanZreFNEck1Z?=
 =?utf-8?B?TWZXdzVXb2VBcTFvbU9PQ3NtMGNQRUVKUkVhOERnS01Zbzc0K3pFYWlvUUpB?=
 =?utf-8?B?czIvL09jUEZLUGNkdk84ZUFiTlpKT0czbVlDWkYyZGEyUzZpSVc5VG9zNXBn?=
 =?utf-8?B?TzZlOE8xV2hFRVEwQzFZcXZNbVFZcmdQRmV5cFVKNHdUMjRHb1cyV3R1TUdS?=
 =?utf-8?B?ZlIrZHRXK3FzZGVHTTJNc0Zxc0FJTytNcTRVclR3QlBwSnlpcjhtcktQczRW?=
 =?utf-8?B?S1VKaHFEZnFVOTk1N25BdnpnbXAvSGhHZkc5NTRpdDc4SmY4UUdzTTIyZHJq?=
 =?utf-8?B?NDNybmJOQ1UrTW9WeHB4a0I2UXVzV1NpTndsaGZYTm1Ia25yNUhxci9QaThp?=
 =?utf-8?B?dTFKbWJVSUVaa3lvV0hScURteXpJbTVqWjZxZVdjd091SURYVnpRbWRJN09o?=
 =?utf-8?B?RlI1ODRCUkFPRzlRN0kyVXYyUjNneTJGUUZ5cXVTSkl4SVVVNllCZE04ek9z?=
 =?utf-8?B?V2F5UEFtL01kYjhJODJGVmhkRjhHSU5jVXRnTzFmenJJNE1MekRSWVdHRWxJ?=
 =?utf-8?B?RjJXc3FVSmo4QU50NC9qSTRKeFJwcW1wTmJMcmxnc1VLV0xydzFYVS9YREZP?=
 =?utf-8?B?V1FiakFDZmZMWDVoQjYxUG5xWHBaZW8wTjU1dWpEZ3E4TVpUcmdneEk0TEhq?=
 =?utf-8?B?TGk5R1JpMlJsa3ZvbGlHU3B0Y3NRNjdySTlGdXZUZ05CZGF6d2FKUXB2Ylc4?=
 =?utf-8?B?M0kxQ2pPTHV3UTVDMlRQWkY4bnFCKzhtRERqeUNOdWRDM2NTNTdLNWNmRmpO?=
 =?utf-8?B?RGpjVVFqcVl1S1hHVjRYS2kvWUxqVEU5OStLbnVlWDF4UmVpdGtqL3J3RXgw?=
 =?utf-8?B?dHc0aXA5SE9waGpDQnFBdWpBa00xbVhWL29zajRVTlpqR3A0WG1UNG0vNndp?=
 =?utf-8?B?K3VxaHZHUU9uSFRxZ0NQaUpNaWNRcjZEeFhNekF5Uy9iazFLYzZhR2xIcHpn?=
 =?utf-8?B?SGcrL01tUmtWQjBKZEJTUUR5c2tQU1BXb0JFbmlQYXpjRTc1MWdKZGxLZU40?=
 =?utf-8?B?aFczWWFadkFvOVltalcybWI5cjZnL1ZEZmxyZTlUWGZqVGhJQklYdEIvb0s2?=
 =?utf-8?B?OE1rTEhkNzVYSFAyQlI2NWxxeCtrOHpRU1V5azVFS0d3bS9FTUk5R1pMcDc2?=
 =?utf-8?B?R0ZOSGROTlF0bUxCMVZMeG1nVWNtcE9lV2FYa21WMUQzY0FyQ2ZwQm5TaEtR?=
 =?utf-8?B?M2cwY1YxaERzODdGenZjZUxXMk56L0tJMWdoWm9RKzVEYXkxemRIUkN4WWFP?=
 =?utf-8?B?c2daa1VKSi9QcVhnYjZPTkVkNXpGNFFZdE5MUFl0dnAvbVQ2K1ZEZE0xYjFX?=
 =?utf-8?B?c2N0RmJ5OCtKUmsyN1ZUT0RheG5vSUxoZTBzK1NPMWdkWmo0bUNCQlNjWkxJ?=
 =?utf-8?Q?msmc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eaa76b4-7df9-41e6-c53f-08de1c2b0bb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 05:20:33.8218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hyvWbG5VwGEafpGGqoDRYnJwTUIPYgarPHcqYUvg8KXosqL9Hl9ace2q24lKvhAZs07pTE/Srb9bE52hag3NFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7512
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAwNCBOb3ZlbWJlciAy
MDI1IDIxOjI2DQo+IFRvOiBTLCBTb3dtaXlhIDxzb3dtaXlhLnNAaW50ZWwuY29tPg0KPiBDYzog
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEIgUywgS2FydGhpayA8a2FydGhpay5iLnNA
aW50ZWwuY29tPjsNCj4gU2hhcm1hLCBTd2F0aTIgPHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10IHYxIDIvOF0gdGVzdHMva21zX3dyaXRlYmFjazog
VmFsaWRhdGUgc3VwcG9ydGVkDQo+IGZvcm1hdHMgbGliL2lndF9mYjogVmFsaWRhdGUgc3VwcG9y
dGVkIGZvcm1hdHMgZm9yIGNyYyBjYWxjdWxhdGlvbg0KPiANCj4gSGkgU293bWl5YSwNCj4gT24g
MjAyNS0xMS0wMyBhdCAxNjowODozNiArMDUzMCwgU293bWl5YSBTIHdyb3RlOg0KPiA+IEFkZCBs
b2dpYyB0byB2ZXJpZnkgdGhhdCBwcm92aWRlZCBmb3JtYXRzIGFyZSBzdXBwb3J0ZWQgYmVmb3Jl
DQo+ID4gcHJvY2VlZGluZyB3aXRoIHRlc3QgZXhlY3V0aW9uDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBTb3dtaXlhIFMgPHNvd21peWEuc0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGxpYi9p
Z3RfZmIuYyAgICAgICAgICB8ICA2ICsrKystLQ0KPiANCj4gT25lIG1vcmUgdGhpbmcsIGNvdWxk
IHlvdSBzcGxpdCB0aGlzIGxpYiBjaGFuZ2UgaW50byBzZXBhcmF0ZSBwYXRjaD8NCj4gDQo+IFJl
Z2FyZHMsDQo+IEthbWlsDQo+IA0KT2ssIGthbWlsDQpJIHdpbGwgZG8gaXQgaW4gc2VwYXJhdGUg
cGF0Y2guDQoNClJlZ2FyZHMsDQpTb3dtaXlhDQoNCj4gPiAgdGVzdHMva21zX3dyaXRlYmFjay5j
IHwgMTIgKysrKysrKysrKy0tDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9s
aWIvaWd0X2ZiLmMgaW5kZXggNjA4NTNiMGFmLi5lOTdiMzE4ODkNCj4gPiAxMDA2NDQNCj4gPiAt
LS0gYS9saWIvaWd0X2ZiLmMNCj4gPiArKysgYi9saWIvaWd0X2ZiLmMNCj4gPiBAQCAtNDk2MCw3
ICs0OTYwLDggQEAgaW50IGlndF9mYl9nZXRfZm52MWFfY3JjKHN0cnVjdCBpZ3RfZmIgKmZiLCBp
Z3RfY3JjX3QNCj4gKmNyYykNCj4gPiAgCWlmIChmYi0+bnVtX3BsYW5lcyAhPSAxKQ0KPiA+ICAJ
CXJldHVybiAtRUlOVkFMOw0KPiA+DQo+ID4gLQlpZiAoZmItPmRybV9mb3JtYXQgIT0gRFJNX0ZP
Uk1BVF9YUkdCODg4OCAmJiBmYi0+ZHJtX2Zvcm1hdCAhPQ0KPiBEUk1fRk9STUFUX1hSR0IyMTAx
MDEwKQ0KPiA+ICsJaWYgKGZiLT5kcm1fZm9ybWF0ICE9IERSTV9GT1JNQVRfWFJHQjg4ODggJiYg
ZmItPmRybV9mb3JtYXQgIT0NCj4gRFJNX0ZPUk1BVF9YUkdCMjEwMTAxMCAmJg0KPiA+ICsJICAg
IGZiLT5kcm1fZm9ybWF0ICE9IERSTV9GT1JNQVRfWEJHUjg4ODgpDQo+ID4gIAkJcmV0dXJuIC1F
SU5WQUw7DQo+ID4NCj4gPiAgCXB0ciA9IGlndF9mYl9tYXBfYnVmZmVyKGZiLT5mZCwgZmIpOyBA
QCAtNDk4Nyw3ICs0OTg4LDggQEAgaW50DQo+ID4gaWd0X2ZiX2dldF9mbnYxYV9jcmMoc3RydWN0
IGlndF9mYiAqZmIsIGlndF9jcmNfdCAqY3JjKQ0KPiA+ICAJCWZvciAoeCA9IDA7IHggPCBmYi0+
d2lkdGg7IHgrKykgew0KPiA+ICAJCQl1aW50MzJfdCBwaXhlbCA9IGxlMzJfdG9fY3B1KGxpbmVb
eF0pOw0KPiA+DQo+ID4gLQkJCWlmIChmYi0+ZHJtX2Zvcm1hdCA9PSBEUk1fRk9STUFUX1hSR0I4
ODg4KQ0KPiA+ICsJCQlpZiAoZmItPmRybV9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9YUkdCODg4OCB8
fA0KPiA+ICsJCQkgICAgZmItPmRybV9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9YQkdSODg4OCkNCj4g
PiAgCQkJCXBpeGVsICY9IDB4MDBmZmZmZmY7DQo+ID4gIAkJCWVsc2UgaWYgKGZiLT5kcm1fZm9y
bWF0ID09DQo+IERSTV9GT1JNQVRfWFJHQjIxMDEwMTApDQo+ID4gIAkJCQlwaXhlbCAmPSAweDNm
ZmZmZmZmOw0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfd3JpdGViYWNrLmMgYi90ZXN0cy9r
bXNfd3JpdGViYWNrLmMgaW5kZXgNCj4gPiBkZTBmNjdhNTguLjk1MjNjMjRiOCAxMDA2NDQNCj4g
PiAtLS0gYS90ZXN0cy9rbXNfd3JpdGViYWNrLmMNCj4gPiArKysgYi90ZXN0cy9rbXNfd3JpdGVi
YWNrLmMNCj4gPiBAQCAtMjk5LDcgKzI5OSwxMCBAQCBzdGF0aWMgdm9pZCBmaWxsX2ZiKGlndF9m
Yl90ICpmYiwgdWludDMyX3QgcGl4ZWwpDQo+ID4gIAl1aW50MzJfdCAqcHRyOw0KPiA+ICAJaW50
NjRfdCBwaXhlbF9jb3VudCwgaTsNCj4gPg0KPiA+IC0JaWd0X2Fzc2VydChmYi0+ZHJtX2Zvcm1h
dCA9PSBEUk1fRk9STUFUX1hSR0I4ODg4IHx8IGZiLQ0KPiA+ZHJtX2Zvcm1hdCA9PSBEUk1fRk9S
TUFUX1hSR0IyMTAxMDEwKTsNCj4gPiArCWlndF9hc3NlcnQoZmItPmRybV9mb3JtYXQgPT0gRFJN
X0ZPUk1BVF9YUkdCODg4OCB8fA0KPiA+ICsJCSAgIGZiLT5kcm1fZm9ybWF0ID09IERSTV9GT1JN
QVRfWFJHQjIxMDEwMTAgfHwNCj4gPiArCQkgICBmYi0+ZHJtX2Zvcm1hdCA9PSBEUk1fRk9STUFU
X1hCR1I4ODg4IHx8DQo+ID4gKwkJICAgZmItPmRybV9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9YQkdS
MjEwMTAxMCk7DQo+ID4NCj4gPiAgCXB0ciA9IGlndF9mYl9tYXBfYnVmZmVyKGZiLT5mZCwgZmIp
Ow0KPiA+ICAJaWd0X2Fzc2VydChwdHIpOw0KPiA+IEBAIC00MjAsNyArNDIzLDEyIEBAIHN0YXRp
YyB2b2lkIHdyaXRlYmFja19jaGVja19vdXRwdXQoaWd0X291dHB1dF90DQo+ID4gKm91dHB1dCwg
aWd0X3BsYW5lX3QgKnBsYW5lLCAgc3RhdGljIHZvaWQgZG9fc2luZ2xlX2NvbW1pdChpZ3Rfb3V0
cHV0X3QNCj4gKm91dHB1dCwgaWd0X3BsYW5lX3QgKnBsYW5lLCBpZ3RfZmJfdCAqaW5fZmIsDQo+
ID4gIAkJCSAgICAgIGlndF9mYl90ICpvdXRfZmIpDQo+ID4gIHsNCj4gPiAtCXVpbnQzMl90IGlu
X2ZiX2NvbG9yID0gMHhmZmZmMDAwMDsNCj4gPiArCXVpbnQzMl90IGluX2ZiX2NvbG9yOw0KPiA+
ICsNCj4gPiArCWlmIChkYXRhLmZvcm1hdCA9PSBEUk1fRk9STUFUX1hSR0I4ODg4IHx8IGRhdGEu
Zm9ybWF0ID09DQo+IERSTV9GT1JNQVRfWEJHUjg4ODgpDQo+ID4gKwkJaW5fZmJfY29sb3IgPSAw
eGZmZmYwMDAwOw0KPiA+ICsJZWxzZQ0KPiA+ICsJCWluX2ZiX2NvbG9yID0gMHgzZmYwMDAwMDsN
Cj4gPg0KPiA+ICAJZmlsbF9mYihpbl9mYiwgaW5fZmJfY29sb3IpOw0KPiA+DQo+ID4gLS0NCj4g
PiAyLjQzLjANCj4gPg0K
