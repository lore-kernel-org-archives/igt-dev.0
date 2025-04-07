Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7CFC3601A
	for <igt-dev@archiver.kernel.org>; Mon,  7 Apr 2025 05:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFE810E1C7;
	Mon,  7 Apr 2025 05:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCA0Q1tu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4742510E1C7
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Apr 2025 05:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744005477; x=1775541477;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=orBAJUIMxYMlUDTeDZm0vieH5hsQsPy60x7d7OXfeKM=;
 b=KCA0Q1tuRXQxbn3OKXcUHOiRr6O44mz7943nH8zfI3vM6GuHfgW9WwKz
 AyhWo5MSwTn0QwAfleECttVXq7sfMA9+VZeafuzcLhWdXVdNENvByjKLx
 X++6nHirqDVZ8UUMxUy5Fyz6QiwD8MXN8tWTRh+8Mpiye3OuvQvwf5Uxp
 WQNIjhX5Z73Y3DlSVu/8hbPujRrD8grEi4MCeuQhZusGhDlNjp7b9wA14
 koQH/rEZae2Ltisej4dI5xncLOp3mfjMelqeDlaW4YGF4i9ZnuQFDmdYC
 2BUm5NwxB9O5GeFtqmV1HT0u3dheOVWimN+rP6Xi8WT2CCaatcCe8N9xp A==;
X-CSE-ConnectionGUID: /SO+fc1iSJGlvWu1Mu/fzA==
X-CSE-MsgGUID: av01JGfiTM2LZi2Pq5yuOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45462243"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="45462243"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 22:57:56 -0700
X-CSE-ConnectionGUID: Fg4axtOcRaeKUuZEr8NTCQ==
X-CSE-MsgGUID: C5WjPQwRSViEszjZM19ixg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="133065958"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Apr 2025 22:57:55 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 6 Apr 2025 22:57:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 6 Apr 2025 22:57:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 22:57:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVfrm+u3Y/S8dJTojIm3jv8XG1WKHgm9KXmQUF3lk/irODKMr0/qtc1JHwQDrfvamrPaFjBKbQhZsUjEQbWL0bMveuBi1bijyDSPDL6IZfj6VGMmdIrLpRyQB6Mjg6DKKbhBvdy1mdouG2icUsgDW4LJXv4496s89DtNADx6ll2HtkXbr1oQAcDhAtE2kXgoLZopj4QuPrEzw2iqozguqLmryvRkecIfuhxXA7lAD1TUWWdVFEdKN64OBfiLGG/zFD8jXRwiQvhEHm4OdYxFf5t744r+lbyaVxtYiG9xRuzFKxQ8RhMOCRO2eLBl2ebk3Ozb8G/G31h4klaHZ46z3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ET5qfwberdLZ/40lNrpQXHgkdexDSSrRdUBMxRGz4QA=;
 b=bkOOlRKQlTVxufsF1qEiZWt3Iedhdw5STe8aGVQoGV6UxoAcO5Ytk5CN/xBB5N62SYwc0rKqShCbGyK+uA3wIILBtdQK275a4LXPW9H4yBXNsTIcDAghrbGCAYMn/a60yCxNI1O0xSuVLIw67h5Uxw1/8ZyaXucrJ5hvjrs5XsFJb+C7eX7FBQQAFrmYrN4spf/is0GTTRgpNMQhVG2rHCLOzodan5ubHyyRzE+QrAqkVwJ22jxhGs9inkdBi+i857hev51z/eDT9wVknBwd0Vo+lbGrnmVs3MKSOIIcAC4w6uuMtMyhKSuatf3uwWPE4vT3+wHemZLEXR/2wumFiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.45; Mon, 7 Apr
 2025 05:57:26 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 05:57:26 +0000
Message-ID: <fc0b0607-4c98-4943-9a3d-cba2deb5021f@intel.com>
Date: Mon, 7 Apr 2025 11:27:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/2] lib/i915/fbc: update fbc support based on
 psr mode
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <jouni.hogander@intel.com>, <jeevan.b@intel.com>, <jani.saarinen@intel.com>
References: <20250327080358.559968-1-vinod.govindapillai@intel.com>
 <20250327080358.559968-3-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250327080358.559968-3-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|SA1PR11MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: ce5db324-f7be-47c1-30e8-08dd75991233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUU1T3daZE92emttZ2RZeGU0MDVQYkxJQ05UZHRwK1l2TGl1d29meGNaVW5B?=
 =?utf-8?B?MkxtZEErVHNFMUVZTGZaaHNDVmdEZEp3YmI5NjEweDNzdUNzQzRFMUkzUSs0?=
 =?utf-8?B?eHJiSHp1OXpTV2ViRmY3b3kveVVYdGpXWW9QU2Yybm1IMWlpZVo4MWM1dTZ2?=
 =?utf-8?B?ckhFaGw4WnA2M0dNcVBkalhGVTRyaDRWK3JTdk85RlVHU2lCMG5QdkpyVEd4?=
 =?utf-8?B?QVZrU2VaSmQwUWlIVVRsaDJlY0x3Q3lmUnA1cjBCMG9NUGtpdEFHclA0VUdU?=
 =?utf-8?B?OVhoZU9idEdRRXJmdzJsSFYzRDNmeVhxR2U4eFdwNEp4YSs4cDE0WXR0cWtR?=
 =?utf-8?B?U1FjQy9SSzh6RDVwK08xcEpPZkFTd3hsUXNETHpsek1hcERLYjJ4ZDFUajA3?=
 =?utf-8?B?aU9FU1pPODBKMmRHYlo0M2liNlVOTEZSaVFhWWJpZWwrWXQ0Vjd1LzlsTlg3?=
 =?utf-8?B?eWVZWUVIbnErU09ETUxhMjVSM2NzWFYrUTN5ZzlzWUV0K0R5SDBBeUhTRjRO?=
 =?utf-8?B?b3VjQVB6Sk9mK2hOMzhwMU1zdUNXTHFpYzRJQnVGK0JmTE1qTjVTa2pFenN6?=
 =?utf-8?B?cTYrbTIwMFIzbE9ydWtDUEZIOW5jcUhiOExhaVdXU0lrLzFGR1VGd2hmZFVZ?=
 =?utf-8?B?QVR6WG04clByd0czQ252cWZaSTJNS0tuMUJ4cDIvT245ajVFZGtDaFlCQ0lW?=
 =?utf-8?B?QzNQRldzSFZ1QmVjaXo0Y0c0UStXd08vbWV4NndyZTg5Ui96RFQzb3lhclVy?=
 =?utf-8?B?YnFreFg1WU9GeVJuNzFheDNrNys1OHJsVk9GajN3K0dqVHlLM21QQTZVU2hO?=
 =?utf-8?B?YWtrcVlmZld1cWc0K2lrWnFUbXNjYUFHNW0rU2Fwanp3SGpibHFEajQreVZC?=
 =?utf-8?B?VWhxODAxS1B5aVpBaTNleHJFWDJJb3NsaEg0NEQ1OFJBUFJ6azdYM0JaQms2?=
 =?utf-8?B?TFBvOHhxL2xSUWcwNWlicWhhWEYwZGRBdFlGbTlBYVlTZmh0SlFXWU9MS2lw?=
 =?utf-8?B?V3B0eEVPc2lTTURqUXFRV3duTmpBb04wd1hweG80VFdEdWl5aFVFWEc3K0g1?=
 =?utf-8?B?RllPYk00NU9CM21xUWZBNWpMZkVPdlVuQUsxR2pHa0tuaVVWQm1NYW1EUmJD?=
 =?utf-8?B?WkhmdGhiM1BhQi9RUGRLTmpqTUEzZUxqN1ZYS3Ewd1gxdlhnc1dUQXBoQU56?=
 =?utf-8?B?TGpCOUdhRXdXaENGUTBxT1BLRGRLcDJkd2ViakxvcXpUcEsvVHFFVUN4TXhk?=
 =?utf-8?B?ZzR6MGNjZnlMSUNnMEtYLytvN2xXWTY5bkMrVmZSRmEyM3lReXNRV3BjbHlt?=
 =?utf-8?B?TkhYaU03Z2tEY3o2ZmJMMjJGYzQwQ2FLR05wS2JaZnU3V0MyTm9OQTl5Si9i?=
 =?utf-8?B?NGJyL2l2aCtlSXJ5WllDall5ZjJqZDRpTjY1OVd5QlZDZ2IreFZLT05RRTA0?=
 =?utf-8?B?RkxCcGdQbVZPWXQ2OXBCY0JKeEdxOTB5NjRiOEdaa2l6N0EyNzRHcTdyWisr?=
 =?utf-8?B?WnJ6dWdlMlQ2Z1lhQXZLNjAweHkwUjErRERCdXNTUkxERmg0ZEpIQzNJQ2FB?=
 =?utf-8?B?d1J3TTUxOFJ3YkRjNzcyQnFwT1h6WGlndnNlcVJJdWtsODhFc1JXSjduUnJk?=
 =?utf-8?B?ajk3UG1wYUh4VllTaU9MYWhZVEtQSnhjYzQrbzVEM2tzYndOWDhGdEVOUWdt?=
 =?utf-8?B?OWd2KzBhYmtEL3Y0b3FnMW0za0RadmRSRWgrTng0cHlieGd4L1kwTHRyMmtH?=
 =?utf-8?B?Rk9yS2o0OStZZW81cnNaVGlJQWREdkw2NjQxcHNGVTVGZzNIdEt4ZlFjcm4z?=
 =?utf-8?B?cDRyQXFpR1dzaGs3eS9TTEZsR3BzTlZBVG5VYlhLQ3h6VVN1bVZpbUYrd3pa?=
 =?utf-8?Q?DRnYKpTArtMng?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVFTbEFFTkpGR1ppaVZXOEJYS2Y2aHhGdnlCaTZpQkcvVGhqcEVPY3BBTG1B?=
 =?utf-8?B?NWxHaHdKdlRxN3RSeUZiMy90WGhxMktNd3kwSzlPcmhBN09ZWVpMTG5RL3hz?=
 =?utf-8?B?Q3BkYzZDVkVBODV3Mk0xS3g4WkJQbjc5aG9tNGlrTUN5MDdId2dhc0xPOUMr?=
 =?utf-8?B?ZGxxTmx5akJNZzBaaXNaVHU4a29KdjRxVnVGZmZHMlhndzF4QWdaa29QdzI4?=
 =?utf-8?B?RDlIK0FyWHdJeVpFNENpSXFuem9VMGVrUHgwNk1VK2cxRzh1bDFnYkZHVXZO?=
 =?utf-8?B?NXRVdC9qSjE2ajJtem1vUmNPYURDZ1RFa3ZzQmNoL3RZNUlxb1Zoc2FIUCs3?=
 =?utf-8?B?QzF4SWV3b0R4VmRidk9wQU5xa2xsbkVBcHNNNlZhdDdtRkZveHFLcUtuckhr?=
 =?utf-8?B?L0JGYlBlUWtYNjB3Q0I0VDJVZThBUXYvcUt0V3NvQVNNQUdORWlWZ1g0T3lx?=
 =?utf-8?B?Q1ZRZ0RMTUtxQkRZNjY1OW94alF4LzBJOFdPZmhrT1RSanhSbFFZSGZ5Tmwy?=
 =?utf-8?B?cy82K1V1RTV6NU1Db2F2NzBCRDY4ZlIwL1BGMjh4OFFGeG1GaGxjaE5IdFF1?=
 =?utf-8?B?VEo1M3hEVGc5SGxZZTJMQUZQdlFQbkRpY1Q3YnQ5ZW9DenkyeURUenZTZkJr?=
 =?utf-8?B?WTR4MERtY21Eckw3UlFUR2ZUaVZOUUloTElqUERTQ01FL0dOU2dvZ3RwM1ZH?=
 =?utf-8?B?RkhQbk5HRHVEWHM1RDByNFQ1by81NjducjdwWHlPTEZqZTd4alZKaFpuUHdi?=
 =?utf-8?B?THdaU0FLWjRhMWlHNENrZXpRRTc2WFJ3NVFyNWxLMk9wMkRuN3laWEhqeXdS?=
 =?utf-8?B?L3FOQU1RSG5mWnVwTnZUQlBnQTdxRGUvU0E3ZVk0RmpUbzZDVGlpZkk2UkZn?=
 =?utf-8?B?dVZaR1pkaTJIbExKZ1dUeU9HM0VWT3k4cE80b0JNaVFnelNVVndwWTV6N2M0?=
 =?utf-8?B?aklhakxPeCtKeXk5RmFhajdXWUx5ZW5YRFNOK05KUGVpQStoSUxyZnRuM2F3?=
 =?utf-8?B?a0Y3UTJyZXExaGZtR1MvaDJ4ZVhodWhTYXVKcThZOFMwWTRvalJNN3pNbkVt?=
 =?utf-8?B?RXlPZUo0M1U0S3NFdzFrcVoxU29iSzAyamdtUHNBSEtUamQxZGFEa3VrNUps?=
 =?utf-8?B?bE8wd09nZmdsTDBMaXprajczQzZiUlBjZzVwbWU0TEJuYzMrN0E5QVBEaTBm?=
 =?utf-8?B?aFFGVW4zSEgzdDJrcjJGajdsM2g3TXIyOFNhbHUwcGRQL2hYNEp3NHFqRTFi?=
 =?utf-8?B?dFNhRmVPR29lcGxBS1Q4ajlDTDNqdzJmTHdRSnoxVXVjM1pjU1JiNTJGdVZF?=
 =?utf-8?B?KzdYS3VHTFdGdEVjc2djNDMyYzdhcURnNjFuVk4vRWxNR1V1cmMvMS9TdlFs?=
 =?utf-8?B?RGlLUHAzaitmWGdqNndEOWFUYXVPNUNNMTVzTG9lMDBWRERPeVREQUQ4RHBW?=
 =?utf-8?B?bjFSWkNLN292Mmt0ZnlMb0I3b1NDYjl5U0JSOXRSSzJOemZtNjFaNVdXcEFw?=
 =?utf-8?B?eElvcDI0T2NGbTNTdmhjQ3FIWVdnVkNISWJWQzlSOXJmRE4wWGFyWVlwWUdX?=
 =?utf-8?B?MzdYa3JreGJGYU1yUm5HYXBRaG42TzBsejc2a1R4ZjdMaDQ0TUIyZElFa1FK?=
 =?utf-8?B?TnJ2SWQxR21xUnRnbGJubzJiSm5qTlN3VmhHekExOXZZSVJQUWZqVGREOUdX?=
 =?utf-8?B?WjBwcGd3MmdpZHVQZk1pd2tmaWNjaTBoWCtkWFhnZ3BJZXQyTnpKbXpTVXBS?=
 =?utf-8?B?QVZoUHdXazduZnZhRWs2TW1RME9SZExQMHdpNWpnbW02OUt1ZnAxVTYvRXha?=
 =?utf-8?B?UXhLdzZ5UjArUVYxZDZVaGhMRldKUndHeU1EZ0FBY0Y1d3U0V0g0UXdpZnk0?=
 =?utf-8?B?TTQzUzEzMTJIRnBQZmZ2c25FYmR2Q0xHNnVuTW9Na2tHZkN3MFgrUG43alhR?=
 =?utf-8?B?Z25XdWJuNEJBWlpsY2YxVlJDbUppWG96dFFlckhJSDFRa2tVK1d1SmNPOTJC?=
 =?utf-8?B?cTI5RjlLOXQydVdVSzJ1QzN4YWRBUVdRL0VYS0lrZTdLMTgwZlNFSGhjS3Bq?=
 =?utf-8?B?L1V1eFJVbVlVS0FzMTVKaEtsWXVoeWdhSHNBTEhzMXROUVlESkcrUkxiN2l0?=
 =?utf-8?B?RUVlbUx3S2R3cXBqMklEYWpGR3lqQkw1aGpKVStwOHovalJkaWlLME5zbnAx?=
 =?utf-8?Q?rhV5a9SFXRAUdCpC1SfOpmw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5db324-f7be-47c1-30e8-08dd75991233
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 05:57:25.9977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LckrCtv57pKHKMlxkeeL3VDnik13/QyUGp3W+RduWnK1BPKAHYm8yZHLPFFmH/VUA2xsn32bdVtjw288aX9K1l1s84ocAN9CXRKoQYjfd1a3uoN1tLvS56YcfE0Ig+T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
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

Hi Vinod,

On 27-03-2025 13:33, Vinod Govindapillai wrote:
> Combination of fbc and psr modes (psr1, psr2 and pr) depends on
> display version. Consolidate this fbc combination check into
> one place and update the relevent tests to use this consolidated
> function
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   lib/i915/intel_fbc.c      | 47 ++++++++++++++++++++++++++++++---------
>   lib/i915/intel_fbc.h      |  4 +++-
>   tests/intel/kms_psr.c     | 10 ++++++---
>   tests/intel/kms_psr2_sf.c |  9 +++++---
>   4 files changed, 52 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index 3971e4920..a8ded0a59 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -6,6 +6,7 @@
>   #include <fcntl.h>
>   
>   #include "igt.h"
> +#include "igt_psr.h"
>   
>   #include "intel_fbc.h"
>   
> @@ -156,22 +157,46 @@ bool intel_fbc_plane_size_supported(int fd, uint32_t width, uint32_t height)
>   }
>   
>   /**
> - * intel_fbc_psr_combo_supported
> + * intel_fbc_supported_for_psr_mode
>    *
> - * @fd: fd of the device
> + * @disp_ver: Display version
> + * @mode: psr mode
>    *
> - * FBC PSR combination support depends on the display version.
> + * FBC and PSR1/PSR2/PR combination support depends on the display version.
>    *
>    * Returns:
> - * true if FBC and PSR can be enabled together in a platform
> + * true if FBC and the given PSR mode can be enabled together in a platform
>    */
> -bool intel_fbc_psr_combo_supported(int device)
> +bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode)
>   {
> -	int ver = intel_display_ver(intel_get_drm_devid(device));
> -
> -	/* In Xe3 FBC PSR combo not supported because of FBC dirty rect */
> -	if (ver >= 20 && ver < 30)
> -		return true;
> +	bool fbc_supported = true;
> +
> +	switch(mode) {
> +	case PSR_MODE_1:
> +		/* TODO: Update this to exclude MTL C0 onwards from this list */
> +		if (disp_ver >= 12 && disp_ver <= 14)
> +			fbc_supported = false;
> +		break;
> +	case PSR_MODE_2:
> +	case PSR_MODE_2_SEL_FETCH:
> +	case PSR_MODE_2_ET:
> +	case PR_MODE_SEL_FETCH:
> +	case PR_MODE_SEL_FETCH_ET:
> +		/*
> +		 * FBC is not supported if PSR2 is enabled in display version 12 to 14.

Shouldn't we check the display version here?

Thanks,
Santhosh

> +		 * According to the xe2lpd+ requirements, display driver need to
> +		 * implement a selection logic between FBC and PSR2/Panel Replay selective
> +		 * update based on dirty region threshold. Until that is implemented,
> +		 * keep FBC disabled if PSR2/PR selective update is on.
> +		 *
> +		 * TODO: Update this based on the selection logic in the driver
> +		 */
> +		fbc_supported = false;
> +		break;
> +	case PR_MODE:
> +	default:
> +		break;
> +	}
>   
> -	return false;
> +	return fbc_supported;
>   }
> diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
> index 0abd18478..fcafe6049 100644
> --- a/lib/i915/intel_fbc.h
> +++ b/lib/i915/intel_fbc.h
> @@ -11,11 +11,13 @@
>   #define intel_fbc_enable(device) igt_set_module_param_int(device, "enable_fbc", 1)
>   #define intel_fbc_disable(device) igt_set_module_param_int(device, "enable_fbc", 0)
>   
> +enum psr_mode;
> +
>   bool intel_fbc_supported_on_chipset(int device, enum pipe pipe);
>   bool intel_fbc_wait_until_enabled(int device, enum pipe pipe);
>   bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level);
>   void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height);
>   bool intel_fbc_plane_size_supported(int device, uint32_t width, uint32_t height);
> -bool intel_fbc_psr_combo_supported(int device);
> +bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode);
>   
>   #endif
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index a83d90194..1fdb565fa 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -781,6 +781,8 @@ igt_main
>   	int modes[] = {PSR_MODE_1, PSR_MODE_2, PR_MODE};
>   	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
>   	igt_output_t *output;
> +	bool fbc_chipset_support;
> +	int disp_ver;
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> @@ -790,15 +792,17 @@ igt_main
>   		data.bops = buf_ops_create(data.drm_fd);
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_require_f(output_supports_psr(&data), "Sink does not support PSR/PSR2/PR\n");
> -		if (intel_fbc_supported_on_chipset(data.drm_fd, pipe) &&
> -		    intel_fbc_psr_combo_supported(data.drm_fd))
> -			data.fbc_flag = true;
> +		disp_ver = intel_display_ver(data.devid);
> +		fbc_chipset_support = intel_fbc_supported_on_chipset(data.drm_fd, pipe);
>   	}
>   
>   	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
>   		data.op_fbc_mode = fbc_status[y];
>   		for (z = 0; z < ARRAY_SIZE(modes); z++) {
>   			data.op_psr_mode = modes[z];
> +			data.fbc_flag = fbc_chipset_support &&
> +					intel_fbc_supported_for_psr_mode(disp_ver,
> +									 data.op_psr_mode);
>   
>   			igt_describe("Basic check for psr if it is detecting changes made "
>   				     "in planes");
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index 4c9847692..68842b020 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -1190,6 +1190,8 @@ igt_main
>   		"pr-"
>   	};
>   	int psr_status[] = {PSR_MODE_2, PR_MODE_SEL_FETCH};
> +	bool fbc_chipset_support;
> +	int disp_ver;
>   
>   	igt_fixture {
>   		drmModeResPtr res;
> @@ -1200,9 +1202,8 @@ igt_main
>   
>   		display_init(&data);
>   
> -		if (intel_fbc_supported_on_chipset(data.drm_fd, data.pipe) &&
> -		    intel_fbc_psr_combo_supported(data.drm_fd))
> -			data.fbc_flag = true;
> +		disp_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
> +		fbc_chipset_support = intel_fbc_supported_on_chipset(data.drm_fd, data.pipe);
>   
>   		data.damage_area_count = MAX_DAMAGE_AREAS;
>   		data.primary_format = DRM_FORMAT_XRGB8888;
> @@ -1240,6 +1241,8 @@ igt_main
>   
>   			data.op_fbc_mode = fbc_status[y];
>   			data.psr_mode = psr_status[z];
> +			data.fbc_flag = fbc_chipset_support &&
> +					intel_fbc_supported_for_psr_mode(disp_ver, data.psr_mode);
>   
>   			/* Verify primary plane selective fetch */
>   			igt_describe("Test that selective fetch works on primary plane");

