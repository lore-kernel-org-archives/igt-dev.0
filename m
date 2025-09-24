Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57424CAC5B3
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 09:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F230910E6C7;
	Wed, 24 Sep 2025 09:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Veo4/sPv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AA310E6C7
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 09:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758705750; x=1790241750;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=75tuLTBZaz2RMeEmDTSZoDU007KkcUOBVZleD1KmyKk=;
 b=Veo4/sPvWGmZ97dMamRvuuyDS5XZIbgLCpV9CShKyluJe4FvdDLiJG0A
 XnzuhiO/4Gmgh9O0OQk4iceXJZuB36yNlP31tS6XZ1LsL6ALSa6eB4nc6
 6vi2YfN5NL/T3cNupxLeE/tLd4D5KWP+6eh7xKbENxLuYMJQoU3cpVHGy
 ttZlezLcb2F2SF6GwZeocg0HLEOtEshrYE01ebTEYGws77nssbehYpzx1
 RvlEz88NTNCYusyhZrqXICMhU1zbFwrQIRa5RJF8oVKy6KTvN+uPB6h2l
 OEKtMlZi3bhkMvDGhBQCqURa4XJPA8qjgUlMZOloPuChhS1Rnx7nbT8nh g==;
X-CSE-ConnectionGUID: 6dj7PvZKT1WZHZqe5LzIRQ==
X-CSE-MsgGUID: GefPXiboR2qLV73oNRRL4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63623909"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="63623909"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 02:22:29 -0700
X-CSE-ConnectionGUID: YyA3fL01Qse5w/iZid25Bg==
X-CSE-MsgGUID: 0xWGFGJVTwud1bs+QQC/tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="181003660"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 02:22:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 02:22:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 02:22:27 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 02:22:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjOiio79FVS8tEHnLNwanMLzzHhHwRoiyA+h0CLGBq9GN+EEphUMtBrl3H1uzy53Gzz001iEgS9efCFOGsV5F6Y7C3x8CGNugRZQYnYzftmLvb/CCgFQTZW2uOhf9xrBRLCDFmvqFP5tkZaBZB6ji5/vywvuiwpltHVCigsFwhNJOOBqAmrZcZW4ZZ7vSxsaKJ1PHjlwzAZuszdgYen+B5iPcjNGzoFEPFq1m6hHttolhsfv4geOEtzMCI3KDCOHpT4yiyyi/BlD1el9MX3MCxbZ2vRiNDR09yUufsztVzTrBzVJSKOpXehXFS7zvg92f3wUSy1Z97KSL1Tj3LseOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7a0M16/LV7sZ89RfLZRLOUyDWpN2s58WJ79GJrNqLI=;
 b=pZPwVT93d6UyY/TaZDpgmzl/7cWl5sDvuKoNDLdhwCRmRiqDXUlcET4tdh52q1Apl5c418HCOLdscPF0SQ/70vtR1xoJ3Nhae23LCfYV9MBUd3ZnEoZKizP7KSXbIXhO7jzvElbz8FvbUSTiXgSrlTsD5avGoKi8pvltdX0Xoz3Go6MfFh2UUB70n9zuTP8k4ANHgHk0TaL/Xh87zGV6zhZEM9Ey7GW7nWbamKUC+zsGIbvAPRqVbkrZujLpmfMuF2chICO5qPfgyycZkvOHY1Rgn7F15qoE9dvnbVs0XbeXrR6H9Li4sBDq7jEvrEXXGxcmVx1/k65wR4atiKwDaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV3PR11MB8578.namprd11.prod.outlook.com (2603:10b6:408:1b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 09:22:19 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 09:22:19 +0000
Message-ID: <4a68e301-0b87-4834-a0f3-0450fa0cdf27@intel.com>
Date: Wed, 24 Sep 2025 14:52:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v4,1/3] tests/intel/xe_survivability: Add new
 xe_survivability test for i2c adapter
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20250912122541.2238004-5-sk.anirban@intel.com>
 <20250912122541.2238004-6-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250912122541.2238004-6-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::35) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV3PR11MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: 4588c713-08f8-4f39-8b5d-08ddfb4bdc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkNOeHA4UEorSjZPK2Q4MG93Mmo3Wk8zVjMwQkJTWitTRWFNeGpoZmd2bXJs?=
 =?utf-8?B?c2FnRytieWlnS0l3alpnZDFMbUpYUTFVVVYxS3lIdU1TVmRHVDBhalJpelJp?=
 =?utf-8?B?dFRKelkzWUxNNkxRUFFidVVtNG1yOEtEY1FsTzhJU3U5UTZ5N2dWaHhudmEr?=
 =?utf-8?B?SEVDV2lQcDhYYm9yR2VLdXMzS2dLaTVqQjU5R0wxVE5Cbmo4eTZQVGhOWi9k?=
 =?utf-8?B?Wk1CaG93NVFiREZpOVhCSGo1aC9uNEN3Ri9JcTVhaU14N1VyOURLbEp0M2Mv?=
 =?utf-8?B?VWVBL25nY09TVEZlVVlLU2hsOFlmUW1VcG9iOE51aTFTMmlRNXpRVXg1b2VF?=
 =?utf-8?B?WXlQeUVhVjJQU0E5YnhtNDVoaVNOVmhOYm9odmZLbHJHN0g5ZVpYM0JTdUNS?=
 =?utf-8?B?NjNTcU1DZXhRaXFtQ1ZNMXBsTG1ISDI5K2FvNUNkbFp3Q285R0hmN2dnYVdF?=
 =?utf-8?B?aHhnTHZQcGpFRmtjOXJqRFcwVE9TbTBKZnhwQy9CZVZHdU00NGhFeTU0OVpD?=
 =?utf-8?B?em9Kc2xDTkd6U1Jlb0VtUXF3Mzdhby9Hd1V0OEx0cVUxYnBQS05BU3NNc0tO?=
 =?utf-8?B?VWY0V0dEVnRZUnQxWS9NRXZ4Q2FkU0VYUnV1eFA1SXVCd3FOVHQ1VUtSNERH?=
 =?utf-8?B?Zm1aZzdtSjlhdTliRjdwb3hUd3MyMVpYbkRMY3VNdWE5c2JvNUtxcWJjM3hu?=
 =?utf-8?B?YjJFKy9MbzRwbzdoL0JyMTJRQm01WitFeFk1Zm43bEFlV2Q3VG45dS9CY05R?=
 =?utf-8?B?UTFXVVc1T1N5NUZZaEhkVHR5OGxLVS9EMytpZFE5NktTV2ZqNUlLM3l2bmVI?=
 =?utf-8?B?RlU0ZHZMWEVKZW54ODdmM1ZSMjZlSnhyZU5TdWkvOW04a1RCSHpjQzlvVGkw?=
 =?utf-8?B?a0VDaVNOaW5LMi96WjY2SmcvMlJ4aE5XQ1RzZmRHTWp5TCtRYVRLQVZkLzNs?=
 =?utf-8?B?YyszcUUvRGxsamNON2dGNjJab1lrRUppRjVmQjA4UGZiRnk2UHlmdlNLcDVn?=
 =?utf-8?B?KzJqQW9nSTJDNkpCK21kbCtQU0x2VklQTVdWZlhvdUw5SUdGcE5IWVlPeHRN?=
 =?utf-8?B?c0pGblVlSXUvLysyUFo4WVo0bjBuZE1iWjRxdkhBdEJtMFUrOG9KeVhDQytW?=
 =?utf-8?B?dkh0MmZmUHl5T2RzZU9GYWYzWlJpOFIxYTBUR2ordnNjYjQwSXZXdVZrcllE?=
 =?utf-8?B?Q3J6YlVvTnNXZWJ2V2NIakV0NGE1ejBjV3FST0NCRDhENjBEVTJPQ1QrVFJl?=
 =?utf-8?B?UHZzZEs0VDVuajFlVEtWR2I2eklRa05sTGJRSE0zM3NGNjBVQk8zU1NSZDJn?=
 =?utf-8?B?QzFTQ2FrQVpubzFzZGgzUER5N1U3SFM2cjIvaFpKM3dDRDlsUVgvZE1wUU5z?=
 =?utf-8?B?dkhjU25NanZKNFlKcmxVanJvU0ZaZTJlTVNiT0tPQTY5NCtHbUs1QWRFNEcy?=
 =?utf-8?B?V0VTMUFoLzNvZjNZTmRvellSZzBFQVFmYjVESSsxV1kvSGF0MkZoUFZLN1Bx?=
 =?utf-8?B?SmIyZ1BOMWZKbzBzb2EwSHJvTmlqcC9Yb1hPaWcxWkhSYWVVTzBRNmJiTWNR?=
 =?utf-8?B?ZDZXVWtyL2w1eXc1MHE4QjJ4K0kxbXNqbStsZW5WemxsUFJMU3VVZnQ1L0U5?=
 =?utf-8?B?cWIzMk1veXJESXNvWlBnd0VERUpOL2ttclEyVytOeFplWERlTlp4V3BEK3Rx?=
 =?utf-8?B?MjE3UStRNGFuMnhrVTNpL2FmTm9MZzBFaFN3eENodkN5TURDR2ZSbVdkb3Fu?=
 =?utf-8?B?eS9nSnRpelE2MzQzejVKTklUMlU0bEtjdW1DSUhZcjZzR096Z0hTUXBWamt6?=
 =?utf-8?B?V0ZZN214MEZDSVQyeHVjemlwR1NOQ2Q5ZW1IWWQ2ME4yczE5UEhWd2szZGRF?=
 =?utf-8?B?Wmo2cVZXL096cHhBSVo4dHhNWmxkeG9nL3BTeUNGdUk3eWppR1NzcTF2UWZY?=
 =?utf-8?Q?WkKh0Ktv8ss=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QldYV2pTUlNrYUdNWFNybGVnbFFMWVZyWVpjVDkyY2RJQk40dWNQN1NNYmlm?=
 =?utf-8?B?ZE02bWFLc2wyWWFhcjdmSHZMNzJ0d1VNV1BQQmtjOFowME5qc3FyT1pQSkMx?=
 =?utf-8?B?NWFKZllkbFFwZTd3cFVHZVlxUnMyYXpIVUM0MVFFTk5semZKMXlEV2ZyWVND?=
 =?utf-8?B?ZExxeUNmRHljaVpPVGROUkRzK2V6NFJUMDh6cm1FMks2Mm95Z1hvYTVBSHB5?=
 =?utf-8?B?STZwOGZtcGZZZm50SWRSdTJweGhxd2UxbzZNREZwK1RKUG0zWExSQlJIdjVk?=
 =?utf-8?B?ZDZTelNTNFVTOGo1ZFZ1bDU0WlNqaXRlSXBVU3VnbkJBcGw2Y3FIQzFhMi9y?=
 =?utf-8?B?UE0rOFo0aGVLdllRekZmVXJqUms5N3dKQlNYTEtrc0tYVm9qUm5iYklWc1hs?=
 =?utf-8?B?bUZad2pieWZXZWVUeGFnaUVHVnRlKzJZV3pJZUk4RXFzT09NWVV4SjdpT2tp?=
 =?utf-8?B?dHRGSTQ0aXZhNDRScmhIVWlGV0ZESS84MzlpVHFXQWk3dGRZbFJ3a0xhZURB?=
 =?utf-8?B?UlR5L25TVTg1VEduRTJJZ1hQak9iY0dkQnlWVlB0RWJEYVZ1S1VIczRpRXI5?=
 =?utf-8?B?RkQzMFBvZFdNdlBnM0hadjNZRUs1a2g2VDNjcWdFb1BZbWhITmozc3BmcVFk?=
 =?utf-8?B?VGlES2NzbmZKUU9WQlJjc05qeTFLRy9wNVBtU0l5a0FxR2t3TzE5RGp5NVdv?=
 =?utf-8?B?MDNFUnRrWjA3MjVSUXgyb09odjdtQjFhaWsyNnJCKzJvWWN4OU8weTRnVUhx?=
 =?utf-8?B?R1BDalJIcENoblRQRUpKUjhVMDJQNmZFd1ZPZEdtaVRtSGZBM3VCMHE3Y2U1?=
 =?utf-8?B?UFg5TFlZOFd1d2dWNyt2RlpDR1NjWCt2bStPWUVKNHI0dHZONjVURmdJQnpa?=
 =?utf-8?B?eWlIdVpBa01vdVI5V0tlZnozTm5vbUlpbTRNYytDcGhRYXZjUmZhUExwRXVi?=
 =?utf-8?B?UldsMTZ0N1oyV3hhbUhiOGlIMS9PaXA1dGVzbTZkUXFyMTNpYmpzL1dLRkZU?=
 =?utf-8?B?N2NSc0NRMjFucTNZMTZ3Z3Z1SmhRWFVWNzd5UVd4NFRhMUh4WmoyY0ZuZzUr?=
 =?utf-8?B?OGd2bGlUNFkrMTdFbGhTejlwSFYwSHpud3pyUS9WY0ova05ma285ZE0ybkpD?=
 =?utf-8?B?TjN5LzZjYVRVZk1yWHppdzBBRVFiZTg2K2JiOHBseklhZC9HRGhSS3VraU5a?=
 =?utf-8?B?enhlSnpoUlNoWTBuZ1h1U1VWcVk2MWpPOVorQ2JldFNDcy9LblRtbkM3N2gw?=
 =?utf-8?B?Sjh6SHBIQ2FScWxXaFE2bUZONFUxUFdDZUtleHJBc0FiZzQwMk5zL2tqMEZ5?=
 =?utf-8?B?NEFVZ1IzL3BLemxCVUc4ZTFobXRjdXFYa2U1UHBEVkZkeUgwVUc5aDZlejUv?=
 =?utf-8?B?YXR4Y2lHT1VmbndlNmtiVVZnbStxRVd0dis0Q2ZtRWszQktRdEo3eXpueUtZ?=
 =?utf-8?B?c2dCQUVaSUpTb3F3eXo0T2Zya0MvNTNoVk13YlBtYzQrQXBpVk9VMVlyK2hH?=
 =?utf-8?B?YjF3aWE0OE1Ea0Jad3Y5K2tMOUZZcVB1U1dUeW9BUFlGdE9CZG5oSGcxS2wy?=
 =?utf-8?B?cHZPbkw0MGNNWWh6L3JzVnNKaHFyUkY2clRvUHVSREc3a2dsUEhTMVFSeGdQ?=
 =?utf-8?B?RlYxM291Zy9keUJ1aGJ6b3REZk1nclcxWXl2ZGdJczYrTiswUENsUExWdU80?=
 =?utf-8?B?eGxaNEhFNTlBL2ZlaEh0b2t2M0FwaVd1VlI5SUlDSW5rZzdrWVhycE12NVJ1?=
 =?utf-8?B?NUdsQ3VGdFo1Y2ZUNnpnNUQ2TkhqdmN4ckRtd1NmbnJnRWlZK0pVVmhiKzZa?=
 =?utf-8?B?QVdmYXJFd0M3ZmI1M2ZISlZEcE9UVFJteHJ2bzQ1dEFVWXIwYVRicmk2UEFr?=
 =?utf-8?B?eHZQMFFlSEpkUXMxMnN6dDFseDBYMVpPTWxYbjVVcDZnS0hSVUVKQk9KMEdR?=
 =?utf-8?B?NHZ5QTVBVTZtOHZRSDlCRVVlbjZ3RXB2TEZNMU82b2hrY3lUUEJDbnhUazZH?=
 =?utf-8?B?SDF6UEFidWNLYnZUTHl6QWQ5L0kyeVR5Z2t2Yzloby9uSHBVZUlvQTRUZFpY?=
 =?utf-8?B?R2NPUklPREVUdGZzQ1JWQkdDbjFIcWphMFdlOWNLdDdQQlR2OXNnRk85R1d3?=
 =?utf-8?Q?pQ+dSGG7iEOojqSFb8Xb85baO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4588c713-08f8-4f39-8b5d-08ddfb4bdc21
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 09:22:19.4742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqQPZCb+N7QIPS7fuF5AD7r7uEiJk7WX7ZKObhZsSmFhlu5g3nVHHGWWzEF1w0g0zUfh0+DnPEAJVJhgDJX/pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8578
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

Hi Anirban

On 9/12/2025 5:55 PM, Sk Anirban wrote:
> Add i2c adapter presence check in survivability mode to ensure
> the Add-In Management Controller (AMC) can receive firmware updates
> when the device is in survivability mode.
> 
> v2: Create new file for test (Riana)
> v3: Update subject, description, nitpick (Kamil)
>      Use drm_close_driver() (Kamil)
> v4: Update test details (Riana)
>      Align with xe_configfs (Riana)
>      Create separate function for sysfs (Riana)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_survivability.c | 167 +++++++++++++++++++++++++++++++++
>   tests/meson.build              |   1 +
>   2 files changed, 168 insertions(+)
>   create mode 100644 tests/intel/xe_survivability.c
> 
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> new file mode 100644
> index 000000000..72bc9e0a2
> --- /dev/null
> +++ b/tests/intel/xe_survivability.c
> @@ -0,0 +1,167 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +
> +#include "igt.h"
> +#include "igt_configfs.h"
> +#include "igt_device.h"
> +#include "igt_fs.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: Comprehensive survivability mode testing
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: Telemetry
> + * Functionality: survivability mode
> + * Description: Validate survivability mode functionality
> + * Test category: Functional tests
> + *
> + * SUBTEST: i2c-functionality
> + * Description: Validate i2c adapter functionality in survivability mode
> + */
> +
> +static char bus_addr[NAME_MAX];
> +
> +static int check_survivability_mode_sysfs(void)
> +{
> +	char path[PATH_MAX];
> +	int fd;
> +
> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> +	fd = open(path, O_RDONLY);
> +	if (fd >= 0)
> +		close(fd);
> +

Shouldn't use the fd after close. Make it return bool instead

> +	return fd;
> +}
> +
> +static int find_i2c_adapter(struct pci_device *pci_xe)
> +{
> +	char device_path[PATH_MAX];
> +	struct dirent *dirent;
> +	int i2c_adapter = -1;
> +	DIR *device_dir;
> +	int ret;
> +
> +	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
> +
> +	snprintf(device_path, sizeof(device_path), "/sys/bus/pci/devices/%s/%s.%hu", bus_addr,
> +		 "i2c_designware", (pci_xe->bus << 8) | (pci_xe->dev));
> +	device_dir = opendir(device_path);
> +
> +	if (!device_dir)
> +		return -1;
> +
> +	while ((dirent = readdir(device_dir))) {
> +		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
> +			ret = sscanf(dirent->d_name, "i2c-%d", &i2c_adapter);
> +			igt_assert_f(ret == 1, "Failed to parse i2c adapter number");
> +			closedir(device_dir);
> +			return i2c_adapter;
> +		}
> +	}
> +
> +	closedir(device_dir);
> +	return i2c_adapter;
> +}
> +
> +static void restore(int sig)
> +{
> +	int configfs_fd;
> +
> +	igt_kmod_unbind("xe", bus_addr);
> +
> +	configfs_fd = igt_configfs_open("xe");
> +	if (configfs_fd >= 0)
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +	close(configfs_fd);
> +
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +static void set_survivability_mode(int configfs_device_fd, bool value)
> +{
> +	igt_kmod_unbind("xe", bus_addr);
> +	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +static void test_i2c_functionality(int configfs_device_fd, struct pci_device *pci_xe)
> +{
> +	int i2c_adapter_before = 1, i2c_adapter_after;
> +	int fd;
> +
> +	/* Check i2c adapter before survivability mode */
> +	i2c_adapter_before = find_i2c_adapter(pci_xe);

We don't need a before check here
> +
> +	/* Enable survivability mode */
> +	set_survivability_mode(configfs_device_fd, true);
> +
> +	/* check presence of survivability mode sysfs */
> +	fd = check_survivability_mode_sysfs();
> +	igt_assert_f(fd >= 0, "Survivability mode not set\n");

move the assert in the function
> +	close(fd);
> +

fd is already closed in above function. Duplicate close

> +	/* Check i2c adapter after survivability mode */
> +	i2c_adapter_after = find_i2c_adapter(pci_xe);

You can add a assert here
> +	if (i2c_adapter_before >= 0) {
> +		igt_assert_f(i2c_adapter_after >= 0,
> +			     "i2c not initialized\n");
> +	}
> +}
> +
> +static int create_device_configfs_group(int configfs_fd)
> +{
> +	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> +	int configfs_device_fd;
> +
> +	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
> +	igt_assert(configfs_device_fd);
> +
> +	return configfs_device_fd;
> +}
> +
> +static void set_bus_addr(int fd)
> +{
> +	struct pci_device *pci_dev;
> +
> +	pci_dev = igt_device_get_pci_device(fd);
> +	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +}
> +
> +igt_main
> +{
> +	int fd, configfs_fd, configfs_device_fd;
> +	struct pci_device *pci_xe;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		pci_xe = igt_device_get_pci_device(fd);
> +		set_bus_addr(fd);
> +		configfs_fd = igt_configfs_open("xe");
> +		igt_require(configfs_fd != -1);
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));

Move this to the top of the fixture

Thanks
Riana
> +		igt_install_exit_handler(restore);
> +	}
> +
> +	igt_describe("Validate i2c adapter functionality in survivability mode");
> +	igt_subtest("i2c-functionality") {
> +		test_i2c_functionality(configfs_device_fd, pci_xe);
> +	}
> +
> +	igt_fixture {
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +		close(configfs_device_fd);
> +		close(configfs_fd);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index a7b9375ed..1d0f1700b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -329,6 +329,7 @@ intel_xe_progs = [
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
>   	'xe_sriov_scheduling',
> +	'xe_survivability',
>   	'xe_sysfs_defaults',
>   	'xe_sysfs_preempt_timeout',
>   	'xe_sysfs_scheduler',

