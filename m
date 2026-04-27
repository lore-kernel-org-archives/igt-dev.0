Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03648FF8850
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 05:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8425F10E199;
	Mon, 27 Apr 2026 05:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d0rZYsIk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDA910E199
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 05:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777266873; x=1808802873;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5h8OEyd7Gqq8JRlVkeV3+/IkCq3egBr/ca7lUs9XcNo=;
 b=d0rZYsIk9LwcNM2Sxrm3/SS3V50QKsBTX/O5BTKbH3+lHKL9oR6KEwFl
 7VUZTZhvHD0mF5oQCR8ZRJuoJe0AQ3BkDj3/M72xAkskCencpJw+yrYTj
 2uUZBX7PfCjt3Q27Tvtsz1VGEoac5HnWZtOjVRYdgkcvrh25A92ZTV+tz
 Lsg1MSX0zFMV0k067UFlusDHke59yRl/NNS0W6R0SLt/paBtytBWqP6B4
 Lf2QIhy1oXZaNfP1YcjZhZ3A2wvy/JmoALpP/hSvO1G5t7RY/4qjQXkcT
 HyIKs9p4clup11uVg0aKfgdPbbh8ps405LBNUp6LjNn/5lYv2hRt3CHiu A==;
X-CSE-ConnectionGUID: LFL6aCbjRYiMrSELv3inBA==
X-CSE-MsgGUID: 842PO4iaRRif+RrXuXC3eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="81754644"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="81754644"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:14:32 -0700
X-CSE-ConnectionGUID: FU93XeeIRSSMeDm9SHUijA==
X-CSE-MsgGUID: GzpIPlTsTgm12+qdDF6ifw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="230901393"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:14:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:14:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 26 Apr 2026 22:14:32 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:14:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQKEEkIGu5glWX3HMOhZEKsDbsFJSB1C2eYSGN8N79jN3CqOmuMmUmZyy4IBausJlPdtpqOfdugmTuC8pBYvVGV7eP8I8TchEI/FoBaDIoArymuaXKXIXj53cWAt17XJ8U8gcPwTpRV7D/0gDeQHx9Hcs44oAvhkizAWdxPuK+eZzwx45ArTVvGcKBso3Ddv+AKUezZv9GkNlIW1OkO8Z+eTOiirT7q9QhtlJ2vHt+8MhWdsjiKgG2jNjz040B55UhegSWovRGynrE9MAoMZ/DiBI/NEKaNnTpuH58BLw0ypaQpqaku0xn+xMUEUR0WbTZhlUBrUIJObRFR9JG3wtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXgGqMNnuSJAjdJ6c50I2OA90AxYW3nQMPw2rohiOec=;
 b=aOZRbmcvowYfuqS+QqCSh/xbONH20WnVysSbu5JMlgxgwoJcfBUTFZreTE3BrEzKo/FYDqtLAFZBjBHZ4Jwzk12FRU1yVxojRJqXdeuSL3TjgPC+tNha0JlzDLR+ek0GT2atx4wP86sUsruBHm+nPebIDfQjvHWQDA/6nzA0T2L3z2Urjx/HqqGE23+5qoPpGoBBjK9T66kxElrCgDTcdhgGSna2a/FtMV/Wc9c0AbR5s3GuGtxtGR07x0KlJqRDfFu0qKp13m3ii19Ty7iaBmXWI4AIwIKM5TMT2zgy5DE1SbCI6s5RTcUPAsTZxIggvd76MSKXrKZKo5WdGGcblA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Mon, 27 Apr
 2026 05:14:29 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 05:14:29 +0000
Message-ID: <77c540b6-691a-49c6-a530-a5f349d97c93@intel.com>
Date: Mon, 27 Apr 2026 10:44:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/8] tools/intel_vbt_defs: sync intel_vbt_defs.h
 with kernel commit 203c7904f2d8
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
 <20260422034335.2326098-5-ankit.k.nautiyal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260422034335.2326098-5-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::7) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH0PR11MB5249:EE_
X-MS-Office365-Filtering-Correlation-Id: 66849c49-b27e-45f5-91fc-08dea41bdb55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|42112799006|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: aOUf1UGTlfXe0cC+NtWVKVL5UjydbhxxNbZUIkLeRm6Mjo14AeU0W7C49x2MiNeBTevgFIVWi+2JbRlSTapx0yXcT/wR18Z0El4gYFPhVZ53v6AicNvHyxc94raF/ckjARYVD9N+VKp+mHiCbv8xzkXSVA7uBBLE5sJbyjlO965rWfpzTtFOuzRe5SdNdxBEYJwCayyeXR20e3gBNAkLqH00QmZrIlQhmVmHho30ZrPGNF82fWDCbnHoXaAz/+lifm1RMEIOdEI0SGunu8WDeYBud7sClKOIU01IaPuXK1o/z+aVkzeKHWym+DiaGjcF33Zx4NAmSx4yittLcJW7g6zx5n2eozeln41LnlueJiPAXfbEuuoxGqYUBD/cF/A43iPZOdzgcyoSP5lLSTiLgUCtwBIzbzrWYax+cTeEbDA7jjA6U7ieNY3xo6e6xecOeUINo0jzL8KqKPgDKsaL1yTZRaF1m3FgqlzKgyd13yaVFFx78w8OprNSgJgnJKHjf9uZP2p+h/Dm1S89gqR1kzdgtvkXQmv5Mrt0dX13i/KYE5artiOoNV8lJiJmenZm5u36PG9DSflKgy3QLCN6ApTOTLzzuZWzRlkZ9mx12U259OuiHlcHwLuplS/p/TFxOoIEmpJnl5YKnDMH2GKKfTavcwxq97SK8RGuixqczgC3NgnLyUT3xA/f4ZQd4rw37XCVFCJAGoNtGB1h5Nsvt4ww5A0OfRCqmxCSV2LmYeQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXRUOTQ0aktrSGliZ3A2a1Y4Y09uVk1nRGtEMEo1MllSVlA1dnZIQWd6Zml2?=
 =?utf-8?B?cDIwcHlrYWJtV0loZVVLSy9CL0ZwYXNCdHNPc3VGZW82eUlRKzAyZXg5NDVp?=
 =?utf-8?B?UzRtbW9sV2xEckRDR1NxcWVnMFB5SG5xSDhETDJ5VnBINjNRMDJBbWhYb096?=
 =?utf-8?B?ODBteEZweXdZQjRLLzI0bnlFZFlUcXFuYkhHVmF2U1Jua1MzUjdzVWkrdG9P?=
 =?utf-8?B?RE5PM0lTS0hHRHVyc2QybTdKcng5TkF5N0d4K0JXbWNqbVMzUzBKWU5vM0Nm?=
 =?utf-8?B?VFRRQVZxZ1cwZHNzSXZzOVdsWjFadVJQRlFNVGV0dVExT3FJVGF5cHorZGlC?=
 =?utf-8?B?dTQ0UUNIWFVjRGk5eGprVUk4OWF4Wk1ZZTRrU2NDeHdrenh1STRFTnl5bDI0?=
 =?utf-8?B?M3J5cnRxNGM5OGlxeWJzVW1tMUpmZVZvQ1hnOTdWOWo3TGVKUmoyZlZYZWtv?=
 =?utf-8?B?am9YZ3lGelVoZVVESUh1ZFV0cUk5eW1vSzJ2MU9yL21pVzFmcTlhZlZmZWMy?=
 =?utf-8?B?TzJLZUJoQXlqSXRQUEhHaVl6OUJzL0ZZdjFHUWR6NlRMdUJkREt1cVVsS0o1?=
 =?utf-8?B?LzVZOHFnTWdwbElqcWU4M0VrUVhqbHkxdlNkZEtTRlpLODYwZ1VQOU1nb2Zo?=
 =?utf-8?B?OThsaldkbDA1NUJ1VFBrblB6bDQ3bVFiRGtBSm1mMUFKWnptNlRPOE9ieDFL?=
 =?utf-8?B?clVKYUIyMk5Fam94Qi95UTI4TEI3K251VDVJcmt3VE04SThnbWxyTE9QZWFD?=
 =?utf-8?B?Y0VUbjE1bkVCR0pKajhDd21FbVVoRDMwQTRlaWw5akYvSGZHeHQrMHlwdzZM?=
 =?utf-8?B?ckJYRExVRDRIcU5LOHFoaEhFUmZYK3g1ZndaQzVleDFydUZ2K3FVUlFOMzdu?=
 =?utf-8?B?dGdwdWc2NWcvdDV3LzJmOElYWlpqM3JsejRSTlM3cWNyd1k2TmRJczFCNFdD?=
 =?utf-8?B?b012R05RTTdXamplVnV2WU9JWSs3MFl3QzlEZ1VZZUpLZmE4bDhsWVJKSmVT?=
 =?utf-8?B?Q0dxK29tLzl6ZGtFNHpWME5IVzVkc2JRaGY1SG1xZCtGM2gwQ0lNMy9KWW9y?=
 =?utf-8?B?UlZ2dHVWc2o3MjVnQzNVNXVvMWJ2RStKNzZaRkwxMDdwZWQ5K2M4ODVRWk0x?=
 =?utf-8?B?STNMVjBmSlpUR21LdDBBc2ErdEJHZTZVNlF4YXFIRktqM1NiY0tpMkRLSm9l?=
 =?utf-8?B?REliZHNobHRvM29jVTlaM3NDc01mcWxRTWJjZ295VFlZUmlXbC96VkVweCth?=
 =?utf-8?B?VWxLTTg0cGpiaURROFliZlBYSWlzMmhBVGpUS1J1SStuN2RLanBrZEZTNStt?=
 =?utf-8?B?eTJpRDBuWERtNWUrK0NjbHNGTktGajRvaUIvK1UyV0NHWnRXRjJySytPUUMv?=
 =?utf-8?B?NmdXYUlMa3pXTWowSk9kWVVDNjlIQndBdk5rUmxBanFXRVp6bWZpTGlhdEF1?=
 =?utf-8?B?SVlZZzlaMFV5YmdHWU9MUXZxOXBYanlzQjJMZDdrdUwzbm02djVEWWd6c0x5?=
 =?utf-8?B?NVpvNDN4cmp6REk4emdreEdWNkVnQlpsSHFGdXZUN0g2aWVQNk1JVUNKREtW?=
 =?utf-8?B?U1lYSkhQbi8zNkhTb1RXd0o2cC9IWlBHakdUV0ZOdEwxQndLdmxWRXdUdHlD?=
 =?utf-8?B?eFRqZ0ZaaHM0THlsSXNpYmphaURUY3FLeDdseVYybkYyYlBUMjhnZWZpVC9B?=
 =?utf-8?B?NEh0SUZ0ZVIwZklaWlRHU3BKZ3hoMnV3bFNxUUVvZXdudk9hQlpoNWZBL2I4?=
 =?utf-8?B?b05aNFN4UW52a00rd05TVFdIYWx5Y08vcHNiVXcxUWpWdUxpUkVaaDVQaEcx?=
 =?utf-8?B?cWR0YzU0SXBHNStHcE5iZUlwSkVYbG1GOU1OUmw0NG8zM3R4cXBKaTJVUjVj?=
 =?utf-8?B?Z0dnTkRGV1NLZkhwWlRJZDhYZGU2T3QxYWVIY1RydFRIZnNaMjY2M0FoK1lM?=
 =?utf-8?B?dGdTVW5mV2l1UEw5c0M5TGhTREFqTWJuRmF6UzJ5WXF4VGZsakREVWl3RDVH?=
 =?utf-8?B?bjNON216R2txQXFqamdyeExTcHNKZWpLVUZtVm5jVVFndEhycGViNmFxTktU?=
 =?utf-8?B?TFlOYzhVU0xNcE1ERTJ2elhtVERxUVVGU1dtYlFkZkVFRDVsYkpDRmVrYnV5?=
 =?utf-8?B?TlcyTDd6bks2TGd2dHB1TmNaeUlLNm11cEEzUmhudE5IaW5ZSUd1NTJ0Nkgw?=
 =?utf-8?B?aU5ZVkpFNExRL2crWlBwdktETzNaSFVDMTF3RmtNSm5yZkpJcDc5MkVRL25x?=
 =?utf-8?B?OUJ5R0xKYzd4R01PVkh1dVhJVzArdHJaSjRMOWxIR2FpcEVHd2V2ZFhtRWRD?=
 =?utf-8?B?T3JGNEc4RDRNVjM0SlR6NkNMdDJ2VStOTEVmQkptRUtqVUo4Q21DZz09?=
X-Exchange-RoutingPolicyChecked: kkRFoTxZa/+7Urj7Xv+aI8OsCxc5B/1DMzCae6Dzgm31RxKeO1MAWH38ohVYqhFAS5D1JVA4sFrJJxDKXISXw95dVYR5GoiZnhBnoVU8Kj8BfShhh0s2undK8Htzj34VoXFgFuoFsZ5FWC+LCDO6llKiCPQkPlUVf+ScaNA9EXvsZC5/IBWcEz+tv1tKgdjc5KlzRp/z6/wWc5mW3PoWPMRKRUQ8RkjzXPf2wArmHP8ccn3waqgIMMsZT5uyy6vc0Y9glI22qZNn4TEZPRGNtpwpsi7mBLAqs5KxfIGGjGw38j7KWqu+FOcf1oSWPMKShZhG00FmSEMXzFEKn5w+mw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 66849c49-b27e-45f5-91fc-08dea41bdb55
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 05:14:28.9445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAOORgA8NFhJxGHGkS/048xOFo2KDuVwU0kjGvSlqQPVY2rAVp5wO8fOrmUcCExGOlXvr9DtjP89RQfGlQlCmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5249
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


On 4/22/2026 9:13 AM, Ankit Nautiyal wrote:
> Synchronize intel_vbt_defs.h with kernel commit:
>
> 203c7904f2d8 ("drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc")
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tools/intel_vbt_defs.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> index 70e31520c560..57fda5824c9c 100644
> --- a/tools/intel_vbt_defs.h
> +++ b/tools/intel_vbt_defs.h
> @@ -554,7 +554,8 @@ struct child_device_config {
>   	u8 dvo_function;
>   	u8 dp_usb_type_c:1;					/* 195+ */
>   	u8 tbt:1;						/* 209+ */
> -	u8 flags2_reserved:2;					/* 195+ */
> +	u8 dedicated_external:1;				/* 264+ */
> +	u8 dyn_port_over_tc:1;					/* 264+ */
>   	u8 dp_port_trace_length:4;				/* 209+ */
>   	u8 dp_gpio_index;					/* 195+ */
>   	u16 dp_gpio_pin_num;					/* 195+ */
