Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164E9C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7741B10F951;
	Fri,  3 Jul 2026 21:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="boOXGVVj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E292110F950
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783114037; x=1814650037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f5VMyKwnDR73lLOpgdbwPeLOMm2Oh85N+MLDBGDk8fY=;
 b=boOXGVVj2OFe2c31x6hatKXPe4WTfx5+OXRo4NzpJHSVEKqITyRg5VX1
 N8VC/V1EmQ+IJ6147zSoC3BMDwttWG0lB5aXrlWdtkjt16sNy3rT5wj1q
 OKOcSk9H27qQ7Aue/O9G8nrM1G16mXNhwMUe0NjR5d4oHODMsDmwxTuxo
 YdLZrKDZ1sm3O8t60Kx9LJUUvTNckUyiq2aSkAnaBiGohZ514AmvwEf3z
 AmpObgXGHCg8dd7MyPFYvX7xd3FuF0bbkkGr/AF/IY+6AR1ILFYOqLt5x
 qC7+SkFKmcFo82zVkFsgyVCCY39QoM0ts1plMcdmBEyZJrXyqUcXSfeVk A==;
X-CSE-ConnectionGUID: V1jmy3NEStW5uQEgYqpIUw==
X-CSE-MsgGUID: yCNEoexATrSl1uL8YL4IbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83911267"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83911267"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:27:16 -0700
X-CSE-ConnectionGUID: l4TbNGXhRgO4GHTeUC9otw==
X-CSE-MsgGUID: 2eclbhcAQgS7dQolT6v6Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="246814770"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:27:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:27:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:27:16 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUpd+9rQdEBYC9PCK/c9pgISaeAVQO3HUDcxhrA9jKADWLS6kZ1cgx96QP42jBNpaDdNvc0r55rucUomjjJf8uqL3TPiKiHO6z79+ALmM4OWkXBiBzl8DkAb1d9bhe06VepIDHUkh/KqD+szAJJ5jI5Ij814aOM0gW0BvhtFtG9tYgov1BGz3Pv57dMV2HozWvzCu+1UK/DN1IWOsbZ5u6+1MzH+a3BRn1Pse8Y2JX0++Q2jVeQXxxeqVl7g5UrVWJZFb4n8BwgTmVxrVAkKU7JayS7upHi1Ma3op/gmEnjX4VCyRw/glFXdetTdMrbDNkTxqYYh2RwG5vSb/sl4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=racmTIIcZmeQ1RX9NYAvkL1qRJfrw29xsNi4PjNfvdw=;
 b=KRg+eaO+k6Lidtbo6TK71PSnaGyVW8w1GyYX5Yo+2cRKi26uXwxyufobpppoNiHg4sxJ+AdEsRp9GQpj+tICG4QTQY1lydwf2mG2YwRau9BMaO3XDiiFrp0feOOMArOEEb3eckp6MVeP9l/BfY2PFwpmS0BxL9NBTqVm1ZCZJsFNloonmigkPsWmGy4k46oDeNetsV7/uXkiv3V92dIVIBXH/gIs9oumzKTDlopbTpSBqHIxO35wwExTX61T38PSBkumOeupWMbYyqlblzQuOYrxKBEmTw0n5HM4wZ7XBzJhRssuAqrunSNopRAyfikT+lc3B8gAVaNB9llVDyUDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH3PPFC80959CE8.namprd11.prod.outlook.com (2603:10b6:518:1::d4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 21:27:09 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:27:09 +0000
Date: Fri, 3 Jul 2026 23:27:03 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v2 00/31] tools: remove unnecessary shared library
Message-ID: <xllcbjny7xtg4soantxfnvkwge6mubs262kcl6enzupora2qs5@7c2e54itjf4o>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <cover.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU2PR04CA0157.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::12) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH3PPFC80959CE8:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c41a76-67fd-433a-1233-08ded949d6c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|23010399003|366016|11063799006|3023799007|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: dpADRpCEnW7wBqKumr5DL1BDgLqZ7A8u11+qPIEakvI1qhWlWnpG7EbJ56f5WfXPzOK3PMcZHZd/Vzgsouoejuye0jSPgOYYOWO44YuzoiZVLJtx0UMPYhj0W/GUBLfKovchhS4XfvHlqiXB2ROCEKJhCwZiSSBYWHeIKxOfBkfwSzF/u3FFvQJZSPHNZXxiA3969cDLpdQ6yaqTaHktgvy/fpF3KmzicC7ntTmliwRmUMZ35yffYMSCCo8WhzU5igyLbUpgen+wPhSvWYzSb6DR1gJuLBNPBj91LluyeBTEFqBiBTnul3V+s9vjorsq7MA8BreqiC44xQ9++odOhg4IGqBhyczs4Ka+gIG7USBF6tCUp67jcryuE3RBVYusTtaM29RgiQ5jPwRFHIlV89MvT6DisqJteKOqTKxPjlBdkv/I8xXhQc2BT/kva4Yj8CbE87E04e9nZPmBur0AlqXaprQpZ2Cgcmz6M6M+ZX/32ZBCGkPcuLR5tJt2VoXVeWigrbLEa3dx2i5J+jT78VYw6yoJ1uJpNo23eOCQnhEZoKNDaOzOsK3nj/XkRVcKfHn2VqKnPgUo5vsMYSgOWGDHe0ELpvn3KcKa6CSWMdk85XlXDM9qmZ1j5ccj2/oL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(11063799006)(3023799007)(56012099006)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nnk1ZHBEOHRqekFJclBtYWFTNUJrQ2JRanMvOGdXRmQ3SlVhR2JITmJnNEVZ?=
 =?utf-8?B?U3ZuUmw2d3JGKzh6Y2pkdU5mSUlVUWordHBPcTczQnl5ai9SaVFPMHdFOTU2?=
 =?utf-8?B?NTZnWklUZEZubndNK01sdWNvb3pyUUFDWkwrSnlLWWZ5eUhuVUl2bVZQMzcz?=
 =?utf-8?B?RkVrZjliMDhIOXNKVElzRlBGYWhSOFh1M2k1R3NwUW5qN3puQk91VE9DMmpJ?=
 =?utf-8?B?aDRZQk4vei9YMnc0RHVIMUt3TXZTNFdzVlVBeW1yOFN6SGdVSGE5YnBjMXVy?=
 =?utf-8?B?WHFTK0RNNm83ajFkVGdJdmNGVHZJc1N6dDhsNyticUVhZnBDNzhoSWhWckVw?=
 =?utf-8?B?VENkVnBabVA5b0JOOHhrbWJJeGlvV2dBRW14ZEtJclk4UGUyTGdTbmwzWTU5?=
 =?utf-8?B?VGs0YTRrTG9NcXN6dkdkOUxLR0VORWZVL1Zuc2lOMHd2c0wwMTlxMnY4ZTZj?=
 =?utf-8?B?NE1aTk9FSExqamF6R0pMSEwvL0Rxc1FLSnhMZ1hKL21rQnZMSzlRa1g3c2dE?=
 =?utf-8?B?ZE5SMm1adXFyZEJ6OXB3MGpGUjVJSERHc1ZpWWxhTTY4VWNmN0UvUnBtdXo3?=
 =?utf-8?B?ZWZJUmxJYkpyNEJIb1IvbTJNREVRQnZ0a24vRzk0U2huNkxqQ0d2RktNZTVV?=
 =?utf-8?B?Z2tuRzM2WCtVcFNUaUVjNXFyRHFEQTRwUFJlQ0puSmVtN1JUWVR6UkVaWUJj?=
 =?utf-8?B?RVg5VlNnSmFRNWhaZlBjb2xKM2VLSUF1TVZFbkwwU1FoSFY3NDBZVzB2SnBl?=
 =?utf-8?B?SEo4UVFPS2o5RmRqS0U3em8xbUJlZnY5VmxNOS9VdzkyL0VheGU2MUZWSTFh?=
 =?utf-8?B?QVR6Vnlhb01ncjhyK3Nnb0NCTi9yc0tiTWJFTjljY1ZYWDBqd1ZXNG9MRTdu?=
 =?utf-8?B?REVUR3Fwem5iQUFtQWQyQjFIYUMzSDhtVXRNb1RweThsM21KeUtOZVh5WG9M?=
 =?utf-8?B?aDlab3lSNDFVekVSSkZ1MlBRTzFmU2Noa0l2bURHV0hNcmhMajdXcGlDMlpN?=
 =?utf-8?B?YVpOc0t3c2JZZm1QNDVGbW1wcWYrVWw2K3RpSDkycUlaKzVhREpuYVZDcVVZ?=
 =?utf-8?B?bklNZzJJRStTYkNhUDduS01qdzRmeWM3cURpTGVqL2Y4U3I4Z2NYL1NxTmc0?=
 =?utf-8?B?UFFHZE5URzFSRWNLTGRKYTVKekFpRnZxamlweHdLV2p2cFViL3RkQ3NQaTRP?=
 =?utf-8?B?UGppVGtmYW1UNTFKN2ppUTVvcmoreFBjODNmK3hyRjlTc0FxeWg2dmRyMjZx?=
 =?utf-8?B?MnFrWjd3MVUxZVZ3ZGZmNkhxQ0lSa1ZiYlpUeDh2M3NYNHlqQkdWT1hyMzVh?=
 =?utf-8?B?a3UwR3MzbUQydU90OHpaU1A0RjgvUW9OMCtxbWVmaTRRQUhiZGRXeCtoNFNn?=
 =?utf-8?B?cUk2dEhwNk1WR0JEOVViK3dBRW1MZkZYNURLQTVBanBjcXJTbkFKdk5lNlh4?=
 =?utf-8?B?RG82U2VIRzc1Rmh2aGNROXNRTndyYkYrWW9LWVUyZTlCaE53M0JMdG9aUng3?=
 =?utf-8?B?Vnd0QmlCckVpSGlaY2tHM1pNMkcwTmpoYmF0cXBOd1A4dEFHM3hXWnVjT0NJ?=
 =?utf-8?B?MGM2Nm55QThTMjUzeDY1ditwSWhyaU9QSWx0NHpJc0ZEenRiejd6WnB6MU9r?=
 =?utf-8?B?elZscVRudGJiMGdRcUtweXNmUDNUbUR3V25YL0VnZnVrb0x6eUNjbVJ3Sk9l?=
 =?utf-8?B?OTJ5YU1iZHJhbkdpOXdxdzZxSWV3MU1ubGJuV2RSTHcxcThMZGFkWElGZFFs?=
 =?utf-8?B?QkR5QStXUmVCc2YzQkxTZW1XWVYxSHZ0NzVqTDMzQnZ1YVBvNEhVdlNHR3ht?=
 =?utf-8?B?dkZsQWdBTk1pQ0k3MzVpWU56RUhiU3hlY3BWdXlQcnVxUDVNcUNzaDA2Rkla?=
 =?utf-8?B?MmttemxGOHh4b1BnVmsrUldETTh2ZERtZldYMWRZTlJDZGFlOEpiMHovOWlW?=
 =?utf-8?B?dHZWVy9kQzFvb0htWENIdlhuTlhySSs5eW9SMU5vU3Jmd0hRaXA5c21ueEty?=
 =?utf-8?B?RUtpazZoYVN4bklhZzRlMEpUR0cwU214Vk1qdjR5YXRkUHdjWHhpMWxSSFcx?=
 =?utf-8?B?djRzbmtmSnBGQzQzZkJxZklyVTloUVJUZlRkaC9zV1NSWmtFR2xkaEdIV1BJ?=
 =?utf-8?B?QXd2VTU3bkdUYytmY1djeXkvajVIRjA2REZHcEZLY2s4elpva2E5MmYvWEhu?=
 =?utf-8?B?SlhuWVZPeGlsOEcyTkQyRWtTRUM0NEhnN2k4NHUxaldMTFF6L3ZBUnd4UDZh?=
 =?utf-8?B?VU9BNnVJR0FLRFFvZCtWZXR0NlhaWDlETk93MFg2NEVKaVl0VHV6YjFDOUll?=
 =?utf-8?B?Q1dVQ3U0RW1zdFhvMGFlMTkrOEJCNm1lZ084dXhqeW9vZnlJOG5FWTNDQ0Fw?=
 =?utf-8?Q?ERmmQ1rmBcim3hLHmK0XUiubjOn7LjW4xqCbzXVjlw3y0?=
X-MS-Exchange-AntiSpam-MessageData-1: wewK7Wtyh3neRpNlbI57JYgAHru2wWeiJ6Q=
X-Exchange-RoutingPolicyChecked: el8zaLK0t6wPnMF2EiQ23qITsXugJg2JSLEJvZkIhCiRTo0jxEooizhSt5t9iCgVTuamvRjJK+PADEhXND4288r5JQKUtCEWHV0n0LOfEGMjfyDem5tFunzS/lPT30jYi0ojHoij/WecmNvebMiE27fNyBO+ga0tdjmwpvErHTXVX1JtXPVdln3h1uOXwIakIJMt957of83iwApqZaEwyzVXD4LZN0uRygT2AgZrpWLi2nXf31HcueQ91ewfuZ9L7znMN9MJInwLsLMh6kJ+SEzrZ3O0GfFm1mcK9zHfUwv2LThonXoXljGI5GVKUVmApuWCibRKTNphL9CLMAvBJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c41a76-67fd-433a-1233-08ded949d6c9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:27:09.3605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llKI1w2jY9tqvNWwSm02I4u96QB9UA6wUmg4dgiWyJgma+Mvbc1TsZSyjykhVuymSdYAReMtuZEZfyIVB2dKJdnMsdnxlABdsj8IzmT6WtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFC80959CE8
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

Hi Sebastian,

On 2026-07-03 at 16:28:34 GMT, Sebastian Brzezinka wrote:
> This issue was raised by the community back in 2019: 
> https://bugs.freedesktop.org/show_bug.cgi?id=110249
> 
> Standalone tools linked libigt.so as a side effect, pulling in cairo,
> pixman and libX11 even without framebuffer use.
> 
> Following intel_gpu_top's approach, each tool now links only the static
> sub-libraries it needs. Five new ones are introduced:
> 
> lib_igt_tools_stub, lib_igt_drm_stub, lib_igt_halffloat,
> lib_i915_decode, lib_igt_reg_tools.
> 
> igt_load_igtrc() is moved to igt_device_scan.c so lsgpu can use
> lib_igt_device_scan without pulling in libigt.so.
> 
> All 20 tools: 35 shared libs -> 3-8.

Also, maybe it's worth copying an example ld output here for one of the
tools, just to paint a better picture of how this series is improving
the linking process.

Thanks
Krzysztof
