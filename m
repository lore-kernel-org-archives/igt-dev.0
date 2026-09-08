Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF151C79F99
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 06:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7273510E08F;
	Tue,  8 Sep 2026 06:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="csSN5Pcb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F31410E9D8
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 06:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788848530; x=1820384530;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3uAXo/RpIiA5rlPSG7c/e2FWPIJ5xqe7XBu/3SHnxLk=;
 b=csSN5Pcb3b1R+VSmIGaatshwAER28O+3KcVNW/PeSLHdQKPnnRWy255u
 OP6udk0uFmiHDeNCNYJ83nUZfi84NM9VsuxI3M0yC8aqrFrpLH32K2KPd
 e0hFhHNM3Pzcq5OSqJR3p/NtCZnHwSsVLk6zYxlBd7cqijOREfcN8f/7b
 a2SyEFV/dOcI7dVv0vCDGix6POXCKXudzKOqvDUSFQlL5NJfK9plBdqve
 unLpzdxd7XyH6qMihmDIShfKJXwVk6wH1z0bNPA+uBV5SdAzJBgK3KkRp
 fqbrKqg4FhlIPPIfd6G0dL5PpWDKpRqVt16NFFFYwQ2b7Ed/8InkKnUM7 Q==;
X-CSE-ConnectionGUID: RTK8GbGnT0mp7ZSTyCwCtg==
X-CSE-MsgGUID: xF/UDqU9Sq6WNDjJVILKOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89085975"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89085975"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:22:10 -0700
X-CSE-ConnectionGUID: 4+U+FFnvTZybErOR8hoHPg==
X-CSE-MsgGUID: U1CgHCwASKmq3w30OBd8qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="272833129"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:22:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:22:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 23:22:09 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:22:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3ztTnb55CKpLUtGI8s9du+5/LyAfsazYVZmBrqAIeWs7mlrOG/JkxOhLwKJdQ3EQAl8f5DR1jMRiuFoXWxSZHiIssbBSO96Ij7mDcJdcqTFb2P7vVmDy7TBlsdACpQb4/bqEPuUVioDG4c2REv5DonwW1XOFzzd7/xLP1buoHEExnaPMcpttDorWKp+J1jeXbe5OSM9Ag4OFUSQZ0KUhyqkTY4ResPg+be8bWL7QduTqh65MOc9MAqCwyqRwzH5JfbOnu6zRpSMu4gI+VnyppqhbtAxFb4JkkCAO3NUVocncykHtoHyjQVjaKxLijFdgaYxgOYNOURXYGrPqOTu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkyKSNsdMt/6jF1J0bckZG3f8tvsTkznfZRjCB+s2L4=;
 b=ctX6YEZZmc/n6tcHRfm/KWTSd7HOnW/xN75Ft7cGHMvGfIcWJ5/+4VRWCPNUKgPxHByfilwApmY9vJ+b721u/h/5jFpuW4adKwoFWCG2UsO/kpBG3JWTOzqUe2j3xI0Xti8P28cr7Crg64aBfl5c9DPJxGX9HWSSHwnO3jUrzApIUNZvPHD3FpD9mF/N45jAYXpRxlzpo495cIflhlaaz9hJA101GYd/TDrJzz/IIBgREjv1hpG4m3FFrpIXFXVIkVY0dDvC5V/BaGhqv1UqX5uJYERk/xsdUOvGFFv0WNhbz60aAyZjuQ9QAoKEMSt7W869s+TaqS7Wu5AnUSwb6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB5799.namprd11.prod.outlook.com (2603:10b6:303:181::17)
 by IA3PR11MB767522.namprd11.prod.outlook.com (2603:10b6:208:626::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 06:22:04 +0000
Received: from MW4PR11MB5799.namprd11.prod.outlook.com
 ([fe80::1da2:d969:ee6a:5753]) by MW4PR11MB5799.namprd11.prod.outlook.com
 ([fe80::1da2:d969:ee6a:5753%6]) with mapi id 15.21.0382.012; Tue, 8 Sep 2026
 06:22:03 +0000
Message-ID: <80a13f55-eac9-48af-ae66-51bfb4dc23f5@intel.com>
Date: Tue, 8 Sep 2026 11:51:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/intel_pat: add intel_pat_has_wt()
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <zbigniew.kempczynski@intel.com>
References: <20260904085650.98553-1-sujaritha.sundaresan@intel.com>
 <20260904085650.98553-2-sujaritha.sundaresan@intel.com>
 <5deb564d-42cf-4cf1-acdc-d82f763481cf@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <5deb564d-42cf-4cf1-acdc-d82f763481cf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0153.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::8) To MW4PR11MB5799.namprd11.prod.outlook.com
 (2603:10b6:303:181::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5799:EE_|IA3PR11MB767522:EE_
X-MS-Office365-Filtering-Correlation-Id: 822eee62-36be-4dbc-9127-08df0d717f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WZvIEcXwntHC6mw2CfrvySEAlL80TJWyC76+Gjq+bQXInwEA4S0SO4Oz7E4TUr966+TgAz3KaIixJFFHovuCvXw2fk5uHRBxFb7SeWp1gWUuiC4do8RkJ8U1wKLKF1KEKEbAJUbYlOhy50zQ+IU0Iyeq8fis9D7KteJzH4wyLlSP3Hve407UoVVJolhMJEEmPc835w0MQsE0q29rTgkaZdrqFdBPAJKoDd4vadFwP+iQo56kN9QLZ20589zaUIIsqAnIoCS+UfQWgI9nqQAU5yqET+87MS9A/SqycyI5L8hUj/K3Yj6uKXtu1iWKW/kWLSKJFEUtw08xM13NZrmu9azC6j1cEcNSaaJJ+kFcpqWT9f8N9zZc4TBj5nNWVzRuxWB1BdWY0kx5M3wmUVCUF2FwYzLAIUhCFkAV01Dox1kdYx6O6nKcmnZ1yPvbv5VZld13CaaXYb3J2XeqS5Nk9F03/HAM8lrpw7Ye6SEwwYr7CL0WowVSu7q/LrsHGakhlGRopXHGOmXYNWHxRg/hsXlxosijW5mz4aupcynmkp5I4Q8uo/y/VRYubVEUDz1B4EcnsyogOdEajGg0BJBtpKOtVxr3Ex0v5QdwjGjSxcWXhu2wCtavXZ6MDmtH6iU6KZQuC8Yw9n9j17vVQzkjXr8or3JLrJo2uN7uxuZnYgo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5799.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXpLdStwc3dwYnVhNHRNN1N5cElYMXlKYlozbXNuTjhsUExLRWhMYWRSRXY2?=
 =?utf-8?B?eGw3Ync5SWlIUFVtTFhGenhJbHkzSm1hdjN6bHVpcWFiUUJNb09SQ3FyRWoz?=
 =?utf-8?B?VXNPVXhHYkVLOTVCZmFNbVdoY3VoblZRakNmNG1najhZTG0xSFFFTlUvRmM2?=
 =?utf-8?B?aTQxSTVtak4vNlhXN0RKeEpRZ2hxdm94VGkyQXo1NTBhVGxkajJQYVJNektN?=
 =?utf-8?B?VnJDZVQvRjRvV2laTUlBaXl2V2lKT0dDUkY3dFVwVk9LWXM5TjQxUXpZNWhr?=
 =?utf-8?B?OEl3N0hVbEIvbEZqeUJPYk5RS2o4S3U4U0toVUNPbllaQTF2MWlQZ2N6a3Bw?=
 =?utf-8?B?M0VNOExEYlhrdDJqaVpDZ0dzMFpwQVVEcmFreDdhQVVMcUVYeEpFaGNTazdl?=
 =?utf-8?B?TEpBUXBwb1c2MGo4a2M2dU1TSURDVERLS3U3SWZ3NGV3YU1XM0JOM1NaTFIx?=
 =?utf-8?B?Z1lUSHFYbVhpcmJpS2FEK0JPUVhNdTJ1VUFLbkpXTzF3S1l3dC9pcXZkd2F1?=
 =?utf-8?B?S0F1NUlnV1oxdUZVVEJsT1VXZmhwSUVoenp1THBiL2toamV2Mkh3THVPVXdW?=
 =?utf-8?B?NjZFTWc0UXRWamZpMExUMjJzeDJ2S0lITWlzbm5RYy9Oek83Mk1QcjZ2eU12?=
 =?utf-8?B?eVBTL0pRaldabWduRHNreEZ3dUJ2TFdJYXJTUnFBbjFkSnY1b3B2d0E5dVp1?=
 =?utf-8?B?MG1iUnpwamZJWXVMRWc2dTNLVGllYjd2dHZHcll5bTFWU2plMFNXKzdWRVA5?=
 =?utf-8?B?eU8wVHU5Y0QwZkhlTjgwQnVSaVlXWllIMUpTbVNuYWp5WXA4bGpqNVpVa1NR?=
 =?utf-8?B?ckduWGRkMC9IeXFxV0ZKaUJKQWFKbkZBd3M3Z09SUlRwVklQMTlYci9xdTcz?=
 =?utf-8?B?ZnN6bUJCTTRTekdqMUdMT3dPbk16UitxaEJtRGFYdUw0NksyZHpnWitxQzRh?=
 =?utf-8?B?cWRNbVRKekxQOEtOWVZXcHZFVHFYcENxUS9waDdiMFloT1N5QlBYdnQ2TzZY?=
 =?utf-8?B?aEpyWGV3MGxVeFgwc0phZVFyL1BocWU3TzVML0o2UFcyMmtCSGJ3OXVKZWxP?=
 =?utf-8?B?cDJXSi93blJLVlF3cmJQdWZ1WGUwR1dkMWcyTlhqbUhtdjNXUjRXMWd4M3Qy?=
 =?utf-8?B?d2JIQWlNU1Q3MElQaW5tU2k1K3Y2MWU2NHJQT0lVbkFML1NHZW5ZRU9wMzZZ?=
 =?utf-8?B?TGZBVDJIOWkvSWFiNTBPQ0s0OXdUanM4STltQkV1UWtrSllndGhRbXQzTXNY?=
 =?utf-8?B?TzN4U1J5NGRMcnY5aWkvcnJJN29tRGtoTTVHcVBYVmJrbGgyc01XUGhnRVBE?=
 =?utf-8?B?bVVlYlpmUFZVQTFLRitTQVBucHR2eHlJYXpQbGpnUlpiYzZmSUZHL2Q3RU9i?=
 =?utf-8?B?aFdlZWNEbHlRM013akpvSDY5VlFsajZVRXgzWUhjRWRObWxlNFRQRWtQUTBG?=
 =?utf-8?B?eVdmVXZmaVZhQkZMUXNJZXF5bnRKSnJZb09QMXdOdVJHbS9KbzhyRXNhc2Zp?=
 =?utf-8?B?TnVJcnJtdGxVQ05VakdMUlJiQWZuUmpoSWlPY204TDE5djVvK0lYY1krbG80?=
 =?utf-8?B?aGhQTzhTRlVRbExtRTlrWjlPdVdhcnljaE9YMGVzcWdZWkE4MnZlcDd0T2Rl?=
 =?utf-8?B?cG9Ic1FuUDlYeXdJaHNqbWlwVm8xMW14WCtObDJKU0xLS01wTnMvV0kyTnRm?=
 =?utf-8?B?cElxVllHKzNjK1lKTXIyRDZYc2FHVTMvbmxHUHNWcFZVUFdtZTdTSlNhUmIz?=
 =?utf-8?B?ZVBpd2xZQngwd1ROQUc4blRPeVVNc0k4Z1V3eC8wNnhwUlhWQXowWlZIVEJC?=
 =?utf-8?B?VzUrbEZjQlFXMThBak8rVGY3ZjNRUXhGNjFSS2YxdFh4bXBOWGFIMExXcFY1?=
 =?utf-8?B?dGlBU3gxMnZ4UFV4R1BJZzJ5eUlublIwK0lWOE5hV212Yk5GcWh2WVQ0Tld3?=
 =?utf-8?B?UnNaK1Nxd0JhRmo2Qlp2Q1JQUEZ1Zk4wNGFCa2tBcGxSd0kzMnVCRThlS0M1?=
 =?utf-8?B?WmZ3bzNVa3FqM05sNXlkWjdHdE9oQTFmWGFQbFFIWUtzQ0pPMmU4ZXdETHF0?=
 =?utf-8?B?TEFZYnhlUWtndzNlTXpBTmZJd2MvM2kwMDQyYmh5V0hSZzFQeVRCRXNiM1NH?=
 =?utf-8?B?QVI1L09qMmpGTFlYSis3Z0ZKbWM4NW8wbEhJUUNtSFdsVEY4bDhEbWRaRDVZ?=
 =?utf-8?B?SmF6N1ppVTZ1VjBHWXVibGdVR2l5REYrYi9CZUFyTmJpSktoSVdYd1JweFNw?=
 =?utf-8?B?TVVaci8ybVpBeUFrWGhYbkNjOFEwTHlDL2RCTHBNdS9TaUhFaytKYjUvVTBR?=
 =?utf-8?B?MGlFN1ZqZ09wYnZ0ajJpeGpNemYycWRFRm40emJ5SUU3Y1MvR3FTdHJmQmkv?=
 =?utf-8?Q?yuZA9znxMWTE8gwQ=3D?=
X-Exchange-RoutingPolicyChecked: tfAIu7To5cxAjUOjpMEV6jTiW+IPzM8cLumuKCNNT6390F2KfJslieWsqtHL+oR+kwtqkiSVxKCPbnJYpXdcBLDmFYinXvbIfo81OEfV4hoel4/s0PHvSQAy+acJ+LZZesQWtfMQ2Prm/FjtnvBvOh3MKtNKkBEWRX0kf4DjhBqprc1Bj8csS+aIJbQNPvOXFBr7NhlWIY7+SPBE1U/6u3MxqQ7zTNzECN8HSYVROpNvRg1f7C/FMWEVtIbjsvJXf64L3bnkQyMa10ASJIvG0gmhTgLVp/uGn5OiV6T6YK8LRNHwuUZp1EtexYC20zKuoE17zJ4wXQOeAXznWFZMnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 822eee62-36be-4dbc-9127-08df0d717f59
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5799.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 06:22:03.2187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHIOaUFBEa/RB6Ywhs6tVYDMfwZklSclgU/fqBWoi5SrJisU7Pu9J8qsbpDUj3qwecVh0oI46AGhbsyhvyMV4Gtz6B/lif0Q6QAyim6gy14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB767522
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


On 9/8/2026 11:39 AM, Hajda, Andrzej wrote:
> W dniu 4.09.2026 o 10:56, Sujaritha Sundaresan pisze:
>> Not every platform has a write-through entry in its PAT table. Where
>> there is none the KMD reports the UC index for XE_CACHE_WT, so a test
>> which asks for write-through quietly gets uncached instead. Spotting
>> that currently means enumerating IP versions in the test, which needs
>> touching again for every platform added.
>>
>> Add intel_pat_has_wt(), which answers the same question from the PAT
>> config itself: a WT index which aliases UC means there is no distinct
>> write-through entry to test. No functional change; the first user is
>> the next patch.
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   lib/intel_pat.c | 22 ++++++++++++++++++++++
>>   lib/intel_pat.h |  2 ++
>>   2 files changed, 24 insertions(+)
>>
>> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
>> index 2f35bb772..782201029 100644
>> --- a/lib/intel_pat.c
>> +++ b/lib/intel_pat.c
>> @@ -284,6 +284,28 @@ uint8_t intel_get_pat_idx_uc_comp(int fd)
>>       return pat.uc_comp;
>>   }
>>   +/**
>> + * intel_pat_has_wt - Check whether the platform has a write-through 
>> PAT index
>> + *
>> + * @fd: DRM device fd
>> + *
>> + * Platforms with no write-through entry in their PAT table report 
>> the UC
>> + * index for XE_CACHE_WT, so a WT index which aliases UC means there 
>> is no
>> + * write-through mode to exercise. Deriving this from the PAT config 
>> rather
>> + * than from a list of IP versions keeps it working for platforms added
>> + * later.
>> + *
>> + * Returns: true if the platform has a distinct write-through pat_index
>> + */
>> +bool intel_pat_has_wt(int fd)
>
> For getters convention is intel_get_pat_idx_*
> So maybe intel_has_pat_wt ?
> Up to you.
>
>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>
> Regards
> Andrzej

Thanks for the r-b. I will switch it to intel_has_pat_wt.

Regards,

Suja

>
>> +{
>> +    struct intel_pat_cache pat = {};
>> +
>> +    intel_get_pat_idx(fd, &pat);
>> +
>> +    return pat.wt != pat.uc;
>> +}
>> +
>>   uint8_t intel_get_pat_idx_wt(int fd)
>>   {
>>       struct intel_pat_cache pat = {};
>> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
>> index a31b60e86..824f8931e 100644
>> --- a/lib/intel_pat.h
>> +++ b/lib/intel_pat.h
>> @@ -37,6 +37,8 @@ uint8_t intel_get_pat_idx_wb(int fd);
>>     uint8_t intel_get_pat_idx_uc_comp(int fd);
>>   +bool intel_pat_has_wt(int fd);
>> +
>>   int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache 
>> *xe_pat_cache, int gt);
>>   int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache 
>> *xe_pat_cache, int gt);
>
