Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAD8EA4FD8
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 15:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703E910E3B9;
	Mon, 23 Feb 2026 15:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlrfuBls";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870A810E3B9
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 15:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771860370; x=1803396370;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=yPN/CeFHbTA3er823yt+VCjwRe6QtQzi0St2k2r0mvk=;
 b=TlrfuBlsXPlMXAdvvPUVUyx5bRpSZe0x0ChW0ro521qy8rJmIrgQFqHy
 VAG4LyWQbG6moZGtB+E0RFB71t96T7xVQXMv5/0Ki8prXlSyIBEwdpsa2
 fv6kr1cfEyKqSKnkMsu2zVtJQlQpWqEcdLSdT2WhAdn5OHIQ8GtyVOgkP
 ZDULssRhNHDCIepgI5eKryiwLsZlDkWRK1BISg4ueZ+A9VDvwel+VgZS9
 LaCFv48d30UvwQjq71aFW64tspqO5n/N9DqMJC1l1af5UUGUanitRxuNZ
 PqlGpAgm/vdB21+6S0/L8m5yIV7rZISvG7GiCCslaa8WqyFYqqMs92ebJ w==;
X-CSE-ConnectionGUID: thLVXasxRFG61mo+dIfxQw==
X-CSE-MsgGUID: tBYXcbPKQTeyxOnCM9KPGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72922146"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208,217";a="72922146"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 07:26:09 -0800
X-CSE-ConnectionGUID: uPTVkv3kSMm8rybr4qSJbQ==
X-CSE-MsgGUID: 3b3H/B2CQym4/ZQSMX2yew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
 d="scan'208,217";a="219141077"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 07:26:09 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 07:26:09 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 07:26:09 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 07:26:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cD329pCNYx84y8uDuLjgU1q9vXSNpOBPWraUzgGgx4khHna2FEHW1c+NwjeU31qPz/GuFaEj2NLslEuqwIp9KL8xgrCbYMVg2HmBok8iAFXVraqWQOsBpkyT1bmAEAqJiaG0xhppGQzcbIeGoy5w2veyrdPwczko/nJwlo9zDAkvRbRzHCfO+h0T6OfwjiIuwdt7S8cwRM9gh9zqhYRYcRZTEhM69LhpSmqBG7nvuozYRTw2awExByXq9gwQFPyHSIbvEjPkDsFjynU/BZ3B1io4MZmmq0KP8YfNa6iNZ4hVegXjm6phlBywpfEwsG6VBTJiw7hABU+xFkvdwiMyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BMaKnpo9z2A7n4pJS5VyaN9sQXO1pFnIumi/EPYHyg=;
 b=tGdY6IaFrIu1w6BK29Kjje5+l7gWx0bbAl2qoHzp6h+tyKMWpqPZuAsKzJ14fyuxgYqHcQ4Lp2T4ZCd60lbiVNTE1epkLAsPLIQNSBZWaXNzGJUn7yFF3Sd6XfT+ZlpG9xXjiex1sCD4bAyIkLU+iwt3+TEJwbWLfmEL4ceHyFuObfLpc3IMdCFge2dgI4V8LrrjPCsOvx/LbChX7ufyMCqANyXHzC0j+BaQ1i9rQerH34NAItnnx4IsdpSC2ZkddCF5H4U7AsmESP39kJJQuPWKtRCqyz4CXfIHc6k24LZ7c+LDVH+3DQtlxlZNtwBqNPtPVyKoFJcctzt5Z24u8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 15:26:05 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 15:26:05 +0000
Content-Type: multipart/alternative;
 boundary="------------pL1fSCvSDasQI08gsAWPgUXE"
Message-ID: <3b3111f7-3b95-46b2-a513-433c6f5707b2@intel.com>
Date: Mon, 23 Feb 2026 20:55:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 3/4] tests/kms_flip: limit output pairs when
 testing suspend
Content-Language: en-GB
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260213084930.252273-1-michal.grzelak@intel.com>
 <20260213084930.252273-4-michal.grzelak@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260213084930.252273-4-michal.grzelak@intel.com>
X-ClientProxiedBy: MA5P287CA0259.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::18) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|CO1PR11MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: d4549827-51c9-462a-ccba-08de72efdc1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDNDV0tVZkpnT1dKYmI0dkJBREczM3M2VTZPY0J3WXJBVS91ekIvS0x4R0RF?=
 =?utf-8?B?VXdIb0srNUdVZjR4OE5DREx3YW5pdVBBOEk3QVF5RWRSMDhheHdLeW5BbjFr?=
 =?utf-8?B?Q1lEbnA0UVExOUpvTUg5UU5MczZmT1hVS2dyTC9LWEdMbEpOb09yY3lZY3ZE?=
 =?utf-8?B?MktRSStYbjJDV3cvVk9LUXMzTFMxTUNhM0Q0ZkJpSG55ZUdianhhdGFNaWdo?=
 =?utf-8?B?QjdkRmcrODMzV0ZnNVhNNHlYaFBzTGZJazZaWjJaakw3cEVxTUhqK3Z4SE1w?=
 =?utf-8?B?dFlOU0k1Nk9UbUxFTlAzSkgyaUc0RlhVTUFoTjBUWnFWWTF6SnAzZGNPTEN1?=
 =?utf-8?B?YkhwaHd2ZEkxcVBRbU03VHVaYmxNUjRRQmZTd2kwcGJGMUwrQldKSmhHUmJr?=
 =?utf-8?B?YVFlM3FDTkVia1ZxdUxvcFpwOSswaTVtYk9vMlppUER1Ylk2TVlUT0R2Witn?=
 =?utf-8?B?Y3lNNkg0VnQwN2w4NXZObXpORFMzUDRXZUJlTDdCNTJBNFUrZllnckJvMGUx?=
 =?utf-8?B?NXlvRVd2TnhGc0pkK3BENG4vYVROTmtQU0Zya2k5cnlxS2E1ckZBdlBSUHJw?=
 =?utf-8?B?VllzL3VXMkhyUGx5SHdLNzR6SGFCeFAvK0FMOWg1NzNwMkJkdHpNVFhDKy8x?=
 =?utf-8?B?NmZUeHY4Sm1IcDNEa21rWlZHMHZhSkowQXJpd0hvazlxWGdHWmE4NG5oczEy?=
 =?utf-8?B?MEo2QzVCem91a3cxSXdXTlE4NU9YVjl6YzN4bGl6aVNsejhOZ3l6V2pDNS95?=
 =?utf-8?B?Z0dNMFRTOEdzMkdsNGdwZFNNdzRDL1h3MUUrR3NPQU9LTjQ1cHRORU5OVU9x?=
 =?utf-8?B?eDVRRGFBWFBWNTJHSjRrRmtjN0M0TnFuWGhHTWpLME93aGVydjhQQkZSTXIv?=
 =?utf-8?B?OXA1VnRVZWx4bVBrUXlXZldEbTIrc3FYSC9RcmtGQlZQejJhaDZ0cmNnWXV5?=
 =?utf-8?B?WFNzRzlzcUlXd290d3NpalphbkRTUXV2TkNOL2I4MFhhYjVnQUhoVTFZNWh6?=
 =?utf-8?B?T3FzQk1pMzJReTFPeitXbW9qRGJKQkpKK1BHNC94NjU3YllNY2hRaU9DVVIy?=
 =?utf-8?B?WjI1dXhVa2tOVyt0QzJHMll0LzErNlg0QUtXbmhaYXFsTFpXUDliRlgydGJr?=
 =?utf-8?B?N3JvNXlXb1prZXRQYlVueUFCcDlJdXZkb1RNTVljQ0NRRDdOalV1aTlxdUZ1?=
 =?utf-8?B?RXJHdUg1UUFUZzIyNENGUTA4SjFLbVNQcGVBZWJLNExhaXZ3aExmOWRqS3FP?=
 =?utf-8?B?c2FXME03S3lCTTBNU2dlUUJFQXd4SElQL1Y4YVZlcUNTd04yaDN0U2VmOUJV?=
 =?utf-8?B?c0UvUXgzbWRrc25UeS9VeVdUTW9CSDYxUGRYMHcvQlVyZThEWWxvcHlnRjUr?=
 =?utf-8?B?Zm5ocnlsWEY5cWliZXpqVndjek1Ca2ZKV090MU1kVm5HdTBNRDZiQ2YrYzVH?=
 =?utf-8?B?WmZDWE5GRUlhVWFWZVFhVit0cmVFU2twa285OXlSOW15cm05ZlhObmVKV3lH?=
 =?utf-8?B?UnppSzhoNFJ4UGNoNlVCaUgxWGJ0c0xmT0h6REFRVEZkMVNxQUtFNHhIKzIr?=
 =?utf-8?B?b09FYmpmTytvaDZqM2lxWlJDMThFWCtDSzl4MEovRkFKLzNDaVVFRmxlckpZ?=
 =?utf-8?B?ZjQ4Z0p1NCt0RCtJcFB6VnNBWEtIUWZqNlVXUEhsNDc5NWhxZWd4TXg3cjR5?=
 =?utf-8?B?ZWhRVGJZdFBRRW5FTUsvRVFLakY3YVVZLzQ3cmJhV1JmOS85SmNrM1hyTDdq?=
 =?utf-8?B?NWpIMjRzNVYzREZCeWhrWUU2R3VISDRZaUZmb2pxczRCNkZPb0U0TWJUV0t0?=
 =?utf-8?B?aG5vbVlJaE42VEhBcGM3cXd4TTJ2TzcrSTM1ZmVTV2UyYTBJUnNKVTRDdzNL?=
 =?utf-8?B?Y3RvZGlYQVhLV2JqaUI0NVVvaUV2dlZyNVNOOUtCWkFPRkRDRE1vajM5dElp?=
 =?utf-8?B?ZU1sMktNTVBjVGV4WTZyS0pTbnZ0cnc0dEJHREV3ZEt2S2laOElobC9ZSlkw?=
 =?utf-8?B?U2lDbEsrL1RPc2hTSnlvMHJSMjVlNndSOEJTQ0NrQWdUSlkrQkRNaXU2RE5m?=
 =?utf-8?B?VWFrZTM1dlhEUzhuWExKZ01Ca2NjbE1lZFJOZGs4SEpCRHhVMW1IWlRvcmtU?=
 =?utf-8?Q?EYMI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vy9lTkt5ZmpyZHZFb3p3akJkQk1NNHdtcXpuMDlISWRmby84QWtBZ1loUENk?=
 =?utf-8?B?L0M3bFBOZUMzYktBUzd1TDVIdzNDZFF4YVp5TnlueWc0Uml6c3dVcU1VYTNn?=
 =?utf-8?B?aS9QclJJd1JIbTExSUhkMGlFeFo4cnFJUHovTDd2aWhiOUNGNUlnYlo2bEJZ?=
 =?utf-8?B?dGhwOFcxN2tsUnc4eDhUc2E4ZmFiWnlOb21ObWc0TGdUSzlhQ3VnNWErNitt?=
 =?utf-8?B?NXNXdDZuOGErcWxtS25XQlFnWEVWdEdXU2NuSFdkWjhrMnFUdGRhQTRtNDc4?=
 =?utf-8?B?cFh2eXJ1NXNVNTVkSTV6dU01TVB4eVZyNUlmS21vNmtPRGJBc050QVFSNnYr?=
 =?utf-8?B?UUo1U0dXTW1kajJ6cUZGeUxhWW9ybGVnSVFyZnlSSzFDcVNPcmFnYXFZdm90?=
 =?utf-8?B?S05GSG0velFHQjN1OEtxZDRjNGg0c1FOQ0Vsb2VaME9tYXk2Njl4Nkl3OGNs?=
 =?utf-8?B?a09PaHQwRDFyYmVjMzRScnBBVXk0L2o3RW93cUwyd1JTaGNXZFVUS1JPbHBE?=
 =?utf-8?B?R1ZWVDArSTBuVmlYQ3dLaTVKd0N2VnF4bDJ4WDlaUU5HVGtiS2xSVUlMRnR5?=
 =?utf-8?B?MGR6SHhSMkU3YU0rWHRPYlMzUWxwNEJpYmUzTi9NVEUxdkUrMkVoSFJacGlr?=
 =?utf-8?B?RDliajJLZWRFbW1jai9pQ2N5STg4Y2ZQOEViOTFEVGU2b05hOHZWMTNRTlVL?=
 =?utf-8?B?akhGWFpjTWdNWDc2bjZEdEJjdnNjeUJ5VkM4TG9sYUhLWGZTeDNHNU91Zzc5?=
 =?utf-8?B?UVBZeHp1TGhiVGRMdDJLQU5EOXdyemNucnBZc1NhQmpJSjFYc3pDWjJwd0Rr?=
 =?utf-8?B?U0xuamNZSVBia3RubkFQMHlCWGdjNk93cWR4SDE0U0tjdXoyaTIzY3MweXJo?=
 =?utf-8?B?eDcwcXlUVENOajA1TVdicHZWRmNweGViSG43QVg1VHgvRW85UDN1N0xqRmFj?=
 =?utf-8?B?VWp5OEdXanhUQ2FpcEtNSW44dEs5dGowNllsdjQ1VjcrUVpEb1lvNzRMbytR?=
 =?utf-8?B?d2FGUTVsQTdpYzljMVpmUkh1UFdMQk9UT1lhaWZTcG83cXFoall3MzAzRW55?=
 =?utf-8?B?bUtvb2lSNVh5Y3JxRHI0Rko1V3ZmamdEWXYzczJrdGdUbGlXZ2RyRlA4THg2?=
 =?utf-8?B?YzFyaUJTUUtSd3BxL3d1akhXMnY5TGMwajZrREkveVg5L0Q4dUticWZLTFNJ?=
 =?utf-8?B?NEJKbllMcFU5WkM2ZE5mMm1sMmtDVGw0VDJYZld6cnRIOWZXSHRtOHIzeVR4?=
 =?utf-8?B?UElUdEFSUXNrSnZXWHVhSUhkLzVvVGVTVFRrT2E1M3pyRjVkZ05WeDg1QzFN?=
 =?utf-8?B?aloycTVuU01RL0VkUEExVFlTbFUzSHJSdnRzd3JiMzRQN2VpcHpNSDRseStp?=
 =?utf-8?B?YWo1cHp0NDRoeDArdEFpNE9UR3RKdnFTZ2VxZVhFWmFJckdiVWRSMkQyM0lo?=
 =?utf-8?B?QVFNQU40UnZ6eTBrNlJraC82VXlIWndpc3U3ZllUSEJVK1RmU0Exd29RdW91?=
 =?utf-8?B?bGFySUtCdTNjWWcvSnQzZ2lnTkNCbGlGWitKbGV1UnZiTzFwdmlRSU4vbXp3?=
 =?utf-8?B?N1RoVndZTmZ6TjRPaU9jc3g5WG52aW96QkNmcVUvUEJUaG9MQTFUOXVhS1lw?=
 =?utf-8?B?dGxPTldXTFZISGViOHg4UXBySFV1cHl6dnhRcnFzdXJnYnhKS1N3RlAvekJJ?=
 =?utf-8?B?RzdhcVNwaVNoZStXZEZuaFdwb3h0d0JIMlEwNU1rOFU2MHMrRFhYWU1KY3Z3?=
 =?utf-8?B?UjlhWndwa3JScFRGd0RHZmkrTTkzVmt0TmROTE9TdldxZ29IUTVDT1lJcTQ4?=
 =?utf-8?B?WWl0Z3JvY1V2RTVHWDdJUWJSeFhQZWwyamkrczIxTmxVN3JjL3RaMkcrTDBj?=
 =?utf-8?B?ZXZhWlpxa1dvN2ZzQ0RuN1JJMWtGMGwrY1NGZC95dFJFbi9iZWZjQVV3amFk?=
 =?utf-8?B?NjFZVGdHRW41eCtvVm9WK2NMcVdneXlCdCtaSkQra0ZkSlFicVI4cUZkb0Qv?=
 =?utf-8?B?dlAwQkloZlpnS2FhdDIrLzBSK2VsVGJMSHFBMmEySGsvUVMzSTRTS0tORWh5?=
 =?utf-8?B?dlMvVVNYNXlGVlJyQ1NZM0Vaa3BnWUpRTWg1OFhQdmdnY3FZYkZCV3JLek82?=
 =?utf-8?B?VXBUelVXdG5iU2JjOWtTb0xmc0xpMU5PZWcyUXhWVEY0NkJiVG45T3F4Ni8z?=
 =?utf-8?B?QWJVSy8zUGVQVkFVdFlwUHh5SW9QN24xeGVqNUd6ZFQ2aW1DckloNU4wVHFu?=
 =?utf-8?B?elNCRjA3RUM0anJyckcvM3NjUVlVbnpzbnVlN1dCTzYycE5RYlJkeUx5WHZv?=
 =?utf-8?B?VWR1Yk9QYkZhNklFaHN3b2NGT1RXODNKRXdXeGo3ejVZOVIrYTBmRXBjN1Fq?=
 =?utf-8?Q?52t1y8GHrhokPBmw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4549827-51c9-462a-ccba-08de72efdc1d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 15:26:05.2592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBERStmh5OZ7MTEahITGaUiOixB4UsfdbCgbgS+0qa1YLoDRS2EmXb8+gDcvyYxysi0LNr0MQ95MjzljnU2MpdpTA9BhezWMt8zJc+zVIlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
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

--------------pL1fSCvSDasQI08gsAWPgUXE
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 13-02-2026 02:19 pm, Michał Grzelak wrote:
> Currently 2x- subtests can still exceed timeout, even with limited
> number of pipes used. It can be seen when number of outputs is greater
> than 3.
>
> Default to testing at max 3 pairs of outputs. Add a commandline
> parameter enabling suspend testing on all possible output pairs. Add a
> LIMIT_PAIR macro which controls maximum number of output pairs to test.
>
> Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>
> ---
>   tests/kms_flip.c | 41 ++++++++++++++++++++++++++++++-----------
>   1 file changed, 30 insertions(+), 11 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index d09813f02..1c8495ef1 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -263,11 +263,14 @@
>   #define RUN_TEST		1
>   #define RUN_PAIR		2
>   
> +#define PAIR_LIMIT 		3
> +
>   #ifndef DRM_CAP_TIMESTAMP_MONOTONIC
>   #define DRM_CAP_TIMESTAMP_MONOTONIC 6
>   #endif
>   
>   static bool all_crtcs = false;
> +static bool all_pairs = false;
>   
>   drmModeRes *resources;
>   int drm_fd;
> @@ -1904,6 +1907,7 @@ static void run_pair(int duration, int flags)
>   {
>   	struct test_output o;
>   	int i, j, m, n, modes = 0;
> +	int pair_count = 0;
>   
>   	/* No tiling support in XE. */
>   	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
> @@ -1966,6 +1970,16 @@ static void run_pair(int duration, int flags)
>   				for (m = n + 1; m < resources->count_crtcs; m++) {
>   					int crtc_idxs[2];
>   
> +					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
> +					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_crtcs &&
> +					    ((n != 0 && n != resources->count_crtcs) ||

-->looks like needed to crrect n boundary check from count_crtcs to  
count_crtcs-1 to match loop range, plese check it..

> +					    m != resources->count_crtcs - 1))
> +						continue;
> +
> +					/* Limit number of suspend tests */
> +					if ((flags & TEST_SUSPEND) && !all_pairs && pair_count >= PAIR_LIMIT)
> +						continue;
-->we are already reaching pair limit can't we return here, instead 
continue?
> +
>   					memset(&o, 0, sizeof(o));
>   					o.count = 2;
>   					o._connector[0] = resources->connectors[i];
> @@ -1977,16 +1991,17 @@ static void run_pair(int duration, int flags)
>   					crtc_idxs[0] = n;
>   					crtc_idxs[1] = m;
>   
> -					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
> -					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_crtcs &&
> -					    ((n != 0 && n != resources->count_crtcs) ||

-->looks like needed to crrect n boundary check from count_crtcs 
to count_crtcs-1 to match loop range, plese check it..

> -					    m != resources->count_crtcs - 1))
> -						continue;
> +					connector_find_compatible_mode(n, m, &o);
>   
> -					run_test_on_crtc_set(&o, crtc_idxs,
> -							     RUN_PAIR,
> -							     resources->count_crtcs,
> -							     duration);
> +					if (o.mode_valid) {
> +						run_test_on_crtc_set(&o, crtc_idxs,
> +								     RUN_PAIR,
> +								     resources->count_crtcs,
> +								     duration);
> +						pair_count++;
> +					} else {
> +						free_test_output(&o);
> +					}

--> this could be bettetr, plz check  --> if(!o.mod*) { 
free_test_output(&o); return; }

-->run_test_on_crtc_set(xx);
--> pair_count++;

>   				}
>   			}
>   		}
> @@ -2044,6 +2059,9 @@ static int opt_handler(int opt, int opt_index, void *data)
>   		case 'e':
>   			all_crtcs = true;
>   			break;
> +		case 'p':
> +			all_pairs = true;
> +			break;
>   		default:
>   			return IGT_OPT_HANDLER_ERROR;
>   	}
> @@ -2052,9 +2070,10 @@ static int opt_handler(int opt, int opt_index, void *data)
>   }
>   
>   const char *help_str =
> -	"  -e \tRun on all CRTCs. (By default subtests will run on two CRTCs)\n";
> +	"  -e \tRun on all CRTCs. (By default subtests will run on two CRTCs)\n"
> +	"  -p \tRun on all output pairs. (By default 2x-* suspend subtests will run on 3 pairs)\n";
>   
> -int igt_main_args("e", NULL, help_str, opt_handler, NULL)
> +int igt_main_args("ep", NULL, help_str, opt_handler, NULL)
>   {
>   	struct {
>   		int duration;
--------------pL1fSCvSDasQI08gsAWPgUXE
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13-02-2026 02:19 pm, Michał Grzelak
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260213084930.252273-4-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">Currently 2x- subtests can still exceed timeout, even with limited
number of pipes used. It can be seen when number of outputs is greater
than 3.

Default to testing at max 3 pairs of outputs. Add a commandline
parameter enabling suspend testing on all possible output pairs. Add a
LIMIT_PAIR macro which controls maximum number of output pairs to test.

Signed-off-by: Michał Grzelak <a class="moz-txt-link-rfc2396E" href="mailto:michal.grzelak@intel.com">&lt;michal.grzelak@intel.com&gt;</a>
---
 tests/kms_flip.c | 41 ++++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index d09813f02..1c8495ef1 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -263,11 +263,14 @@
 #define RUN_TEST		1
 #define RUN_PAIR		2
 
+#define PAIR_LIMIT 		3
+
 #ifndef DRM_CAP_TIMESTAMP_MONOTONIC
 #define DRM_CAP_TIMESTAMP_MONOTONIC 6
 #endif
 
 static bool all_crtcs = false;
+static bool all_pairs = false;
 
 drmModeRes *resources;
 int drm_fd;
@@ -1904,6 +1907,7 @@ static void run_pair(int duration, int flags)
 {
 	struct test_output o;
 	int i, j, m, n, modes = 0;
+	int pair_count = 0;
 
 	/* No tiling support in XE. */
 	if (is_xe_device(drm_fd) &amp;&amp; flags &amp; TEST_FENCE_STRESS)
@@ -1966,6 +1970,16 @@ static void run_pair(int duration, int flags)
 				for (m = n + 1; m &lt; resources-&gt;count_crtcs; m++) {
 					int crtc_idxs[2];
 
+					/* Limit the execution to 2 CRTCs (first &amp; last) for hang and suspend tests */
+					if (((flags &amp; TEST_HANG) || (flags &amp; TEST_SUSPEND)) &amp;&amp; !all_crtcs &amp;&amp;
+					    ((n != 0 &amp;&amp; n != resources-&gt;count_crtcs) ||</pre>
    </blockquote>
    <p class="MsoPlainText">--&gt;looks like needed to crrect n boundary
      check from
      count_crtcs to&nbsp; count_crtcs-1 to match loop range, plese check
      it..</p>
    <blockquote type="cite" cite="mid:20260213084930.252273-4-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+					    m != resources-&gt;count_crtcs - 1))
+						continue;
+
+					/* Limit number of suspend tests */
+					if ((flags &amp; TEST_SUSPEND) &amp;&amp; !all_pairs &amp;&amp; pair_count &gt;= PAIR_LIMIT)
+						continue;</pre>
    </blockquote>
    --&gt;we are already reaching pair limit can't we return here,
    instead continue?
    <blockquote type="cite" cite="mid:20260213084930.252273-4-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 					memset(&amp;o, 0, sizeof(o));
 					o.count = 2;
 					o._connector[0] = resources-&gt;connectors[i];
@@ -1977,16 +1991,17 @@ static void run_pair(int duration, int flags)
 					crtc_idxs[0] = n;
 					crtc_idxs[1] = m;
 
-					/* Limit the execution to 2 CRTCs (first &amp; last) for hang and suspend tests */
-					if (((flags &amp; TEST_HANG) || (flags &amp; TEST_SUSPEND)) &amp;&amp; !all_crtcs &amp;&amp;
-					    ((n != 0 &amp;&amp; n != resources-&gt;count_crtcs) ||</pre>
    </blockquote>
    <p class="MsoPlainText">--&gt;looks like needed to crrect n boundary
      check from
      count_crtcs to&nbsp;count_crtcs-1 to match loop range, plese check it..</p>
    <blockquote type="cite" cite="mid:20260213084930.252273-4-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
-					    m != resources-&gt;count_crtcs - 1))
-						continue;
+					connector_find_compatible_mode(n, m, &amp;o);
 
-					run_test_on_crtc_set(&amp;o, crtc_idxs,
-							     RUN_PAIR,
-							     resources-&gt;count_crtcs,
-							     duration);
+					if (o.mode_valid) {
+						run_test_on_crtc_set(&amp;o, crtc_idxs,
+								     RUN_PAIR,
+								     resources-&gt;count_crtcs,
+								     duration);
+						pair_count++;
+					} else {
+						free_test_output(&amp;o);
+					}</pre>
    </blockquote>
    <p>--&gt; this could be bettetr, plz check&nbsp; --&gt; if(!o.mod*) {&nbsp;&nbsp;<span style="white-space: pre-wrap">free_test_output(&amp;o); return; }</span><br style="white-space: pre-wrap;"></p>
    <pre wrap="" class="moz-quote-pre">--&gt;run_test_on_crtc_set(xx); 
--&gt; pair_count++;
</pre>
    <blockquote type="cite" cite="mid:20260213084930.252273-4-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
 				}
 			}
 		}
@@ -2044,6 +2059,9 @@ static int opt_handler(int opt, int opt_index, void *data)
 		case 'e':
 			all_crtcs = true;
 			break;
+		case 'p':
+			all_pairs = true;
+			break;
 		default:
 			return IGT_OPT_HANDLER_ERROR;
 	}
@@ -2052,9 +2070,10 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 const char *help_str =
-	&quot;  -e \tRun on all CRTCs. (By default subtests will run on two CRTCs)\n&quot;;
+	&quot;  -e \tRun on all CRTCs. (By default subtests will run on two CRTCs)\n&quot;
+	&quot;  -p \tRun on all output pairs. (By default 2x-* suspend subtests will run on 3 pairs)\n&quot;;
 
-int igt_main_args(&quot;e&quot;, NULL, help_str, opt_handler, NULL)
+int igt_main_args(&quot;ep&quot;, NULL, help_str, opt_handler, NULL)
 {
 	struct {
 		int duration;
</pre>
    </blockquote>
  </body>
</html>

--------------pL1fSCvSDasQI08gsAWPgUXE--
