Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C84FD5F77
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 05:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2215210E50E;
	Wed,  8 Apr 2026 05:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbXO/RAZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC7410E50E
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 05:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775627459; x=1807163459;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MC7WrxaW6zq7GuEa5uefWRyYV6xsvNP97strKnNUMvY=;
 b=dbXO/RAZ151omnPn3WH4aQ5LCdgzWDhv3GqWr6RZhRyq2jq5PpdwwFPW
 VqQxaPS188DNa4rMLLbHP+aqheRbGFvKsGp/EX4YFcc9TZ+k4TTMNchJN
 TgYHzF/xm9rpuy6qStm8RLNSrnS91XndM8DIgwPtUgRxnzVdhz6yRO/DO
 kFvIogDEImFAjAXP2nhlop1A6ORhlb56i543HYurt+/Iayc/1iFbi7SVg
 KubrSZw6+y4wgVL4sNS0DEBNf9Ju/IQGo3eOsX1IjqxY6BfbXsWNKEu3H
 aYGNL+xmR+xO/GnhrrygwokYZHrdANTCwmiS8UUffbcbhEvSCWGVba4RA w==;
X-CSE-ConnectionGUID: 3EqIqyuCTVWK7Us/iMiaXQ==
X-CSE-MsgGUID: 5fWf92Q+RV64WuajaaK8LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80461663"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="80461663"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 22:50:58 -0700
X-CSE-ConnectionGUID: Q74JpyXTRGiu2m1ERRhiog==
X-CSE-MsgGUID: ZHy3opaUQYmOsg8M+/4Vsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="225197278"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 22:50:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 22:50:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 22:50:56 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 22:50:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAswwzqHyjoiuEvJgl4YQ936X3FdXIS0IEa0L+11uGd+BTI+o4GlKHmtwHU1jFqTQmhAFM5kwwWdNhiJb3CoSIwd5PEFd6XnSSX5ncxl9dDv2XM70aV8a/4Phjsf2tFkjPa7VQlkanPnmwD6uLtxBvrut/yZcSgdf2+GFWqmguoBxZXVebl3lRbZH1nm8lJvuYOim5Z2YGwcM08vRB0CertbXv6ZLcXIE378RckIpMa943SlZHjHJUwsGEEU71jX18p6HiT24VsfUlSbBXmT7WQLls3rVvuqc8uZAYQmTdQjdVCr05yTgFiKh80z9HtKB/0SbkLySzUK6QiKSbNJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MC7WrxaW6zq7GuEa5uefWRyYV6xsvNP97strKnNUMvY=;
 b=hgxtU1fuD57lanpX++plYT7AbtXV0m/ZDWqo3UyBku+bW7BolZKA0iIq5bhTdP+9MVPT/mLsSe+MTIefhwKfUtUq/v4xatfYL1RtmIbEYavIigzYxsM1Udjd5GyZW7ohvjpYgzPVn9JCx8YXng55cWK31eytkis5+15E1WbhcLxA8txdVilK1Oa+fiqI1i2Q2VLshcSAXt0lM6D8S6fdl6kvS5nRXYiPpr/a/myieQLzP/rOSPHj5orWYlJiH1ueL3o8ErrpF1GmyFkZEFokD2o7ES7B+olJto9NWM5gmTCOsv/IPklxMD8VAuPBQ7HiE641S7LRyaaumKdu6rroeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SN7PR11MB7468.namprd11.prod.outlook.com (2603:10b6:806:329::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 8 Apr
 2026 05:50:50 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 05:50:49 +0000
Message-ID: <706b779f-0b7b-435a-928b-14222fe7c8bd@intel.com>
Date: Wed, 8 Apr 2026 11:20:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v10 1/5] tools: Rename tools/gputop to
 tools/gputop.src
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <kamil.konieczny@intel.com>, <vinay.belgaumkar@intel.com>
CC: <anshuman.gupta@intel.com>, <tvrtko.ursulin@igalia.com>,
 <tursulin@ursulin.net>, <lucas.de.marchi@gmail.com>
References: <20260406060428.2734117-1-soham.purkait@intel.com>
 <20260406060428.2734117-2-soham.purkait@intel.com>
 <1c5675497486819dfd4190c421ae424a9af99df6@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <1c5675497486819dfd4190c421ae424a9af99df6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0033.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::16) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SN7PR11MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 037b1dc3-6ebb-4d1f-4e31-08de9532c948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: TLJi+neZFrFCMDk0abJ8hoAj04EDFQQH4VAsXymz1n0b8nIFGfapCFMsvE1lUt80yKcblVziysL7a7+2h2hd3B2j5tTkCI01Iljjyt1vvdJBrXPnD0suiArKuzdCUkH9cmo+QNY2UetW5QRO1s+WXniI7QexQcGD8yQT8AS9l3o3VhDp6thuG5Ji2HKaKkPFINx9uTaHsNzFWNJftyRECihs8t6mIn0iDWWRPyFoUiVD7CnMNf5R5WZ+pmWXKRNIj40TbM6wPCPGScAYQOZQfdllc0aRx2RYjkIq68+j8higjMpq+NMn9Q2B7L5egtLn7ETcmLsvTok34+HaBhZK20mXW+U8rJlR92DueFCXpWnTlLo8p/Vcnc0UpDr6E+6WzmhadilryFOUMF+fNLoj0i3WXiqwZQQA+IjYMfgmi+nITTvKnbcQcz9K35lneZZN/f0CgOBvEVgCyWhkCZrIQarSkD+7VF0sMhXVYtl+r25XXYtipGU421hjYwFYw79vHTlIHb7vBVRYbwX+pK3OpM4NQY0JANhNh2upVf5q5jhBdxxLJhNYsFQfHzv294/bjrGsKGN5XIljsx1Ao7mWotqu4UI+EH7/SYcTUf4gun/ON2fTEZYEDRjuI5Jovno/LaF6HGk9j8I8DOUAkxRxKN7GyGXb4XZE4UvSoGl0HnL3nCXg2atg6rPN831+dC3hU1QaTQLyXHbXZ9gtbNkSOiGYwsc6trvXXx+CqRYOLVc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHFVVFNOVXRRQWwwcHZrd09VaWp0Y21rck1SamNveWI2clc2a3VwVzkwZHpD?=
 =?utf-8?B?dnd0dW4vOXpiOFRqZ2Y1MjZmNTExdkoxV0tzZ1ZiRGJMNnRhakR3bGxUMEt1?=
 =?utf-8?B?OFdmM1hNQTU4ZHhTWVhZSXBRNm01WmtiUDNEakFNNEdVeXRoaGNOK1BOZ0dW?=
 =?utf-8?B?R2F0TVRLQzF0LytUaDdQcUJRUlUrSS9IYy8wK01scGdtcWpDZTFhaVhlMzMx?=
 =?utf-8?B?eG5mTlJRQ2RDUUtTV1BFSEYramF4cHlNK0VKRkRSR21HMVdKbWpVRktTSUUy?=
 =?utf-8?B?aUFEYzAyNXVqSXhVOFFrcmNFZEp2Q1ZGazE5VTV3Z25MSVhlZS9IbGlZN2VQ?=
 =?utf-8?B?TVJmV0krTXIxSEVoQ0NrblQwYWVWbjVUOTJON1g2SGhRKzdCenZpb0c0VGMx?=
 =?utf-8?B?bGNHRlVWLyt5aU9zaXBkMStvemI3Z29ZMnJwaFRlRi9EeVBjbU4zK1JKd3pM?=
 =?utf-8?B?Wi9FUW5PRTVPdDZ5YVo0L0lwT1lySUZ3aDRDcldpYlh1cEFOeXdDMGVPVTRE?=
 =?utf-8?B?aGgyTDRpMFp2MXlDNkhuVko4T1pINDFMOHlwNGZEV3U0RnB6TVFLUmF1bm4w?=
 =?utf-8?B?dU02b3FHcGJvc3NFSVBvRlk1VmVQMnUyOHRXMkVRM1pIM2NJYmsyRW81Wm43?=
 =?utf-8?B?c2M4QjhtUjZxZk5hOXpOa0t5YzBuRFB0YlBWOUdKUFJSbU9DdE9rWEsranNN?=
 =?utf-8?B?VEQ5dEtsemNvTk9tOXdBWDRyL1BxSUg3U1dSY041Z1VqWElhb2MxY1VJN1M4?=
 =?utf-8?B?b1FWRmtvb2JsMnQvNkc0ZFlaT3pOZVgzTllzTnlKaW9JM2R6WC9GaFhzK3h0?=
 =?utf-8?B?dFVrWVpWSHRhckxnYWdPNjUzTVl3TTNHREYydGVqQW9uTE00MjJCVi9RMlNx?=
 =?utf-8?B?YWJablJXZ0NnaXpkVlNkcXNGNmU5VFZuVUZCbi8rTDJFenRxd05EZ2JpNldo?=
 =?utf-8?B?YkkrV2lKUXBBRC9HUDZGL2wwMW0yTW9vbnFZWklYY2pJS1ZCTEIzNHYrbTBw?=
 =?utf-8?B?VFdPbG9LTjYyaDZsUWZkSHNPY1dEUkorS1pYdE9HbmxRQ3ppajI2aHVwa3ow?=
 =?utf-8?B?NTNPeDFzT09UNmhMYkhDME1VWnlPWUpRNjVGZWRJOGY2UllOQmkyVkVmUHNq?=
 =?utf-8?B?ZXVSdmJXb21VdnExc2s2UDI5QVRCWndYWkNIKzg4SzR2cU45NlA0L1NGYzd3?=
 =?utf-8?B?S2R6SGM2WG84NTdTOWN2VEVnYXUzQ2lHcVNvZGZUL3JHRTZXQ0RwZkQ1Qi9t?=
 =?utf-8?B?cXJEWmFCY1ZvRHM0V0dockdQQXFRSUVoOXU5RGU1ekZNbmx1a1dUeTBNR0Vl?=
 =?utf-8?B?MFoyaFd3RTZDMXd2SGluajRwdmJ4YXp5KzRiRnptcWYzVXRwWml3TTRZTm5J?=
 =?utf-8?B?WHYwdnNqT29KWUk2ekx4ZWJBMHNoOTF1ZFBYRVJjR2h5QWc1UDdmejl5UzlN?=
 =?utf-8?B?ZWpXbVJsc3NoWlNGcnFaZU1UREM1UHlxeTJ1dVJNZTVYbUVpSzMvVXB2WFFI?=
 =?utf-8?B?TnJtcHNxenNYYmhkTjBRWFZURDM1VVozcmEwK3B0ZW9RT05hVlFNcE9QcC9q?=
 =?utf-8?B?UDQ0bkJhbXRIUmZaVzRsOThDK0lJQkl4azk5MVQzUFRGcU82OHl5YS9aWFd6?=
 =?utf-8?B?YVQyM3VyalNPZTB6SkUvem1vSFhWQmRwejNWcUorTlVobnhqSmo0TVF6NTEy?=
 =?utf-8?B?WFdHRXVpUVNkWUFvK2E0cDdwUWplRWxIZnlGK0dNenJLVmRpZVlqOWtiNGZ1?=
 =?utf-8?B?c3BuUVJYQldLQVc0NUhmZ1B5bmV5UzFmdExDUlZtRTc2a0lYdXMyTU9GUGZs?=
 =?utf-8?B?NVQ3ak1hMk13R2FxQkRBclFiMkJ0cFJERmM3d2dJN3Brc0hJZmwvaXBRSWtE?=
 =?utf-8?B?eVFRazVMZkpPd1RuYlVwS3JDOXhCajM5WDgzcmk4UzU2U084T0t4QzRRejk4?=
 =?utf-8?B?aUlSNVNyVUkwdmpyWmtUMzlGZ0tXa3ZTOVNLWEgreEtRU3llc2p5U1NTMVZs?=
 =?utf-8?B?QU00YXBRNnFvb2hiNjRybkMzcVN5SzJGdE1SWG4zb1R1UWMzaDdmTFNLaENL?=
 =?utf-8?B?MmgyeG9Hd3dzYTZzVGxIeGlYNW9JWW5nOEM3cWloaFN2ZWpyY1l3OC9td2xs?=
 =?utf-8?B?emhMa2QvK1JPcG5meWN3NEFmWHFCejh5OEk5S0ZleWtENDR5UkhUcmc0VUZF?=
 =?utf-8?B?TmhrVkthTWxkc3haRUtWMnpYTDViUkVaUFFad2JXZFo5S1NYZ0tUYW5udVhS?=
 =?utf-8?B?RXdxelpvRE1RZ3FuSmxjeGZOZy9XVUdGN3JDOE8zN2Jtc2FmYlF0TmNaemdt?=
 =?utf-8?B?dEt6OW03a3RoTjFYY25yMWhBQi91cndMMmY2R2VxWCtXczMrUUlVSUROV2dr?=
 =?utf-8?Q?a3HewNQXnFCii7Ng=3D?=
X-Exchange-RoutingPolicyChecked: TKzvZrQWgtQaxGP6nkr1cD8Heee4fzCysGM+y8Qk24+YsBFqgTp2A43rrqkvbq8CC+FUmmKdSjlehPl5xzdqid4dFpZYFmT0aJaoTCR5oIvk4GBQuUG9tROYHfdeVnivGqVWIDKwwF+8m7OnJam1eJwbDE5QIUBj+HtXEXnK8fqhmMsM96IMzlUvsXw10zf2Lcz2H/E69bXR/AD8uoXHd/2XDiihAKhwDyhOR/1JwO2jvZ1WkBxXCbKfLp6LJajmLNpQEmUBeeAeVDKH9bTKx4ctNCpT/NxoFU+R27L6ujjkvG8XBpCsjewukG0LbVA3GQ3MSP68gh4vt8vF8rDXCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 037b1dc3-6ebb-4d1f-4e31-08de9532c948
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 05:50:49.5381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNmThSQbd3y+mrdblc6Af1X+B+AgluN6TeMbng+kzVdGKzQ8GpqyzBxsu2FmegyExWzvKi4gXqrDRnLOfzxTMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7468
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

Hi Jani,

On 07-04-2026 13:15, Jani Nikula wrote:
> On Mon, 06 Apr 2026, Soham Purkait <soham.purkait@intel.com> wrote:
>> The GPUTOP source directory is renamed to gputop.src
>> under tools/ path.
> Why? The #1 question the commit message should answer.

Sure I'll mention the reason for this rename.

Thanks & Regards,
Soham

>
