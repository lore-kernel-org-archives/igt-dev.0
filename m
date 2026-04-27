Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846CCFF8850
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 05:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC1410E199;
	Mon, 27 Apr 2026 05:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VuAcwW2u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B2A10E199
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 05:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777266739; x=1808802739;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2nEWgasJk8ZdSdAmkVHHsUzvRC5piUqQDNQVLcHbWYo=;
 b=VuAcwW2uRwrS35/82P0zG8nj3YoUMG9peTVo5SBcajvCVPRXZxy/g6My
 QalGD69kNDOPBPYQmFidOTdiNzQRiilDrjoMJ/c1/UYo/645OBuiIuiKC
 iDG4qdK8MwPRUZ2G5rilMRD7KphqG5PRklj61YvUqN1Mr9B/abDt05GiB
 9PXl7NMdu7IwAAwhqR2HQL6jUjR1rumDblw+LWFMGcHn1B+K+u3VSxVmS
 7qcMyRrechFF1Gp3lhCZNv7yXRuQ6ax96S7JSl6066T7BknAAaxtvlUO3
 qIM8UCwJWL4hGRH3Cz+IGUlH+PS++D/4fr11w+htTTRZIKqPnCqGQ/Xwo A==;
X-CSE-ConnectionGUID: vI81VGNQSc65ZC2KUe1AwQ==
X-CSE-MsgGUID: 8GHjxm3jTPSCTujXA7hAVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78035631"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="78035631"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:12:18 -0700
X-CSE-ConnectionGUID: Ul03/l1bREWsS8mEIFIqGQ==
X-CSE-MsgGUID: ketjn4m+R7eSjvPkXrdYjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="237497804"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:12:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:12:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 26 Apr 2026 22:12:17 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:12:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hjgvh2VtTzzgmLFM6EQT6QMMzLr1EOn35KiUObi6hxXQXw3Ms4G5bnawQBwdUkpRCVUeF4v6rfBAhU27O9IKyEe1m30rJo6fom5SJ7mx9Veijg+mpviaAylQAlYdqdCc9ipPSLCdVF/xRcEjk5l4B/tD5OsIAOFcwOjgwNqMisT+5kIPhmY3ag/wgx2M9v65Xb3zzUICrfvWiwM03Vk53FwKi9p9VmFODH9PpbW7uo4eGreePCS3/fOLZji3SfjqF5nm09G2lvUTewN1iPUsHJKgddo7fKJvnwo+/k5VPdLgCPmGWrRh+Fr0ucHIcomJpmoK+KAuM89zRTmL0zw5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0jgUcC1w3xiZ2ZZtB/nKXIsqJEOyLRatcFsuq2qCcI=;
 b=BRal4wyyn2gykVDFe8zODBcnME97llowjVTt9ByzEfLiSNcWorc42ch6oSqnzC3FLRj8+kaPaTeBvFidjk5ZMIgEQ2+MQ93Aei/Nsj0OcNl50v8QgHwRg80woOFzh6fctGOIcHi+ug/8LGttyiFjx4kKfFLcM20+djsl2St97bYmgmcIOZx8VlznMUeNeaJFpd94KboE9fpB6sDuyX+XBTnquSgKtjc4Iv+eBKB1howhCtupNWiCWCF0d34lmZsEDOjQ/NRbGfoGmvgllgFf9rneP0OFcNpaQ9s871cS231k3IndsAsOAjojb4rx5ASvFSxcHXomceBHRq+b44Y2lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Mon, 27 Apr
 2026 05:12:15 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 05:12:15 +0000
Message-ID: <2b4011a2-02e2-462a-a39a-9c25d39f7b67@intel.com>
Date: Mon, 27 Apr 2026 10:42:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/8] tools/intel_vbt_defs: sync intel_vbt_defs.h
 with kernel commit 4d33c77cf2c3
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
 <20260422034335.2326098-4-ankit.k.nautiyal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260422034335.2326098-4-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::10) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH0PR11MB5249:EE_
X-MS-Office365-Filtering-Correlation-Id: 890537d4-32b8-4184-ee2c-08dea41b89f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|42112799006|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VPl1dSV/2ZzU//KWbohQBGCU9tnC5Jqy8HDHS8ByTaY3K+HhRI8xwgQcDG2CHYp+Un2Ow35vzoDRwpTZJRh6n7Lgr2L3UhuwpfqUHHebMsHRBrRS3SQB1E3PiSRe2HtFGo4ZJyvOQe3rUSJZBvB7z132qPpS/4OYplRagWM58+BV2qGQQ0B/DbNIrLY6feHWhFNycTKTtvycve6oVjVa75dZd95cTnamOPK+W+3J2XLRHHaRixMTtwhRCdLaUA0z4C0V5v+QWaWBYhVnV22fx6aNsAKHzaluOWcnxCYmKyBh5cBud8JvkNY+e8YaJa/jvmxNgk/KCh+K6L5qZ1PnMXxw+iTbKAPK0i7jtoRWlhysY70h8RObZHYNoTBtvRX1RfWDDZJj5Ny27aYKirCmSG0yOVps7k25YXss3Jxh0puzOZz47FxWHZkonKRGM1KukNJoBZPqV7bCPRsT+ehGMbQptCdM4zzdJXA+ib6Ps1qB4pVQjs3XlsXbkPQk0co33NAVTaSNKRbAEPd+Ob1TRc53xZuSSZYKtD/8b18rEA6c+N9JO7NaQvC2W7NLTiZpn77m2IbO3wruW+9MWxxiXtGAJ5WFuKSJVAwYB0uunfEq6BAb9pkI8kd9NPlsUQkbePkOA3R+IkXSXQZV/r9EEcODMZw4sBdZWDWXO4DZal7i4qe0X+WesrM1MX8iaSPaIpdd2lsEk545VPO+FFs7daAxZU2Uln3lsbF+pmgKnDM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFFLYnFvZkw4QjE3ZWU1dncralp0c2JQK09RaFNhYTNBVmRqVmFQWUU2enZO?=
 =?utf-8?B?eTZieDB4QlpxRWdMNWluUDI1aWtwU1I0WndqZWFvMmdqZ1JOcWtOMnRLdWFN?=
 =?utf-8?B?VEVQdUVwZWxhbVlwUjFNSmNldXB3WU1ucFJzam9FSElwSDZyazBZWm12cXdx?=
 =?utf-8?B?cVpvdjAvVkVUcUJSelBSSThUNGJlVmZhVHoreC80ZW0vWFIrQU55S3ZucWFO?=
 =?utf-8?B?MWlqbjk5M3VWTzlOSDNJYndZNzdXc0dxQlRSNUR2OFdEZ1BwZVRLREdDeTZj?=
 =?utf-8?B?T0gxejVTM29EM09QRFArS2dhMW9Xd0NrWmJMcWtRS2tsdXVvMHIyVEFqRmdw?=
 =?utf-8?B?Yi9qa1VmUVZRNUpEVHNCRTdycTZ4Rm5VSDJJRVlZQ3FmOG52ZEdGbjRHK1hO?=
 =?utf-8?B?RGFaczNaRUlCWFBtaVZPUmlBc0lCT3FzMElqTWNTUmxicWhaN1FVL0dDU1lH?=
 =?utf-8?B?NXJ6bUdDb2Z1dXNEd0l4aEdqMlo5dHN6S21HODVwcXFHZUFoMXdIZEM5cUxx?=
 =?utf-8?B?bjhRSEFmZm1GTzBlTWgyVjNaTllQMGVQZDZaZTBBUG1odFpIbnFTRThDQ0Zh?=
 =?utf-8?B?dTE1TzRNM3N6d0RFUkI2UVpYZzRxajE3TTVLVTVxOVg4bVBVRkJ5TXNTQXc4?=
 =?utf-8?B?VnFDdDJ6dnhRMEJodWovbGlCMDFxY0xRNkVBRHNwWlR0L1lyZ2hDSDlWUEVZ?=
 =?utf-8?B?WnVQZmlzRUluYUE1bWQrcFp1MHpWOEpYRkJDanpObFBSZDBzbjM0ZmM0U2xw?=
 =?utf-8?B?YVVWTUM0SzU4K3hGN1JRblM5eFpKcEk0K2N0a2wvOFR1a0hvTGQxS1VUOS9H?=
 =?utf-8?B?SlU2bTI0OWlubnlTa2NodVVvL0RaNWQwL0FHMjBYdm1RSXlXSFZhSGNaZkd1?=
 =?utf-8?B?Yjd6Z1NRYTdWSDVTT1p1c09NVHBPcU51V2NYRmc3aFMwTlRVY0tVS1RqUkZM?=
 =?utf-8?B?ZGlGK3UwdkNZMnlFYW1WR2FsQzFGUVRiT2hqdEN0UmVGTXNaaENreWNsbnV3?=
 =?utf-8?B?ZjRtRlFvaXBaVHJ0K2l4OUZoUjJoTnVBc0JWQ0hYdXk4TW9tVmo5Q0tkMEZR?=
 =?utf-8?B?aGozOWxOZTRoM1l0WklibDhHSjhNeFpRbkhVZHVmQWc0TmhUbW0yRGhnTzNO?=
 =?utf-8?B?NTkzQUhFMllNUXZSZVo1QUFnbDZOWXZvZU52Z2ZBdDJRUzljYzlKZXh6eVlX?=
 =?utf-8?B?NXVJclg2TzhhR3hMcnNUdWM4cytMTEV2KzA3dnNwTk1FSVdpczhMazVoc0dU?=
 =?utf-8?B?Q2RiWlpVaVJ0d3NJc3J1MU9aZnVRMFNoV05OdWcwaXQ2K3BEckZkVmdLVnpt?=
 =?utf-8?B?VkFLZC9vdWRwczBwc0RxbzNIa2JZeVZvUjhIeUUxWjFMUWVPbldISzFPZnRG?=
 =?utf-8?B?dFVTODI2TzdWcFR2NHBQNC9HdHp1dEs2YnptT0VUWC9GdDdrUTlyTGZWOGdC?=
 =?utf-8?B?SDNub0txN0kvTUptTnBXamNmaEZLSk0vQTdwbXNVUVpQTjcxZVk4WVNPMGhY?=
 =?utf-8?B?SDRPSmM5T1BvbVJXdWR0RDc5UFNZb0VQVG8yNlBqUjAwVCtsRXdoYkVVSFVO?=
 =?utf-8?B?R2FOclRHKy9vMHY2SWRUT1hBOVZQZ0VKRE5BV25GNGxwOUpuUUs4bHEzQWg4?=
 =?utf-8?B?SHVTL1cyUHdJTmFyT2NVSElKbUovQTlsMTQ3amNYVGt5V3BsdDE5ZUs4NlNN?=
 =?utf-8?B?R21KYjJWQlc4USt4bW10UFI4dm5hT2Z4cGIzanRyeFNERkJxMFpGUk5Hb1p1?=
 =?utf-8?B?QUc1NUM5aVlEV2VpdWJSNVg4cnBhd2lJcGVKN2NuU0lTelZaWEExNENPVkhL?=
 =?utf-8?B?SnFCQThxaEhBU1NEODFKQ05iWm1rQzVsTEpKMGZxMlZ0Y3hPOFF5ZU82WUFh?=
 =?utf-8?B?RDBpWWpqeUYrY1lxM2lDaStJYkhGWHJqbUsxQzlBOTI1K3c4cmxtMmYyTmNh?=
 =?utf-8?B?MFZuNG9CRWxKQlBCK3YxYW1sSG5kK0Z4QVd1eVpza2pPVFJsUHZWY1dwdWll?=
 =?utf-8?B?L1JOYm5YQjdTNy9yNUFCVXlLbGNWZVJqK3lFRDNIbTJpWHVjNENRMWdYbUtW?=
 =?utf-8?B?WTMzTUUwQ0R2ZFRQM3NzRHhlUWxoNTBQSVNUeE5KeDArcVUxMWFkTC9PSTJw?=
 =?utf-8?B?L2dONHdWNzgxRERUSFViYjV5Mnhwa3V1Wk1HYjN1TXZVTVBGSE5oempUdXBE?=
 =?utf-8?B?bVlPa1BacTZIZm1ibEdIMUtOK2s0dENHRWZ0YWd5ek1IRTRiV1JxbTFRQXVH?=
 =?utf-8?B?dGNrSlVGK1dLbDNwSVVZZmZXUDdGeGd3QzJNWjNxOFdYSjN6T2k1eUxJWHpH?=
 =?utf-8?B?anJsTGlHQ29DK1I1L1BpVGNIanFZK1BTaTlheDR5RlNjTHd4MjVVUT09?=
X-Exchange-RoutingPolicyChecked: jvNshmfFHF0JfjvgalWnkZ5AEAxRfGgtuOts//3A3ATkHb4BabrLJWLb+WPCEHWtm5sL9OElPz52vIgc7vaf+qopyWNpZqYLGepQAu7E1UGmYY1w/FB/pDx5elhssYkzvKxPW2y89HUEFDyBZ1X1pZwo2TJde+/XsPNp/VQi9HZWV5EBrwVyXap0CvDWcR5OkUkAmnZIKDbONZkIaKHAGk8h7RBd24vV4oeNmFB4h7kdesEvJEEpHhHHLZrTz6QsJLKzyAvhccOhb3OOlpYtakR9V7PjRrJqNqzdk7aWfsVLpSjkevddFDsodqnQXjuA1qWasJI3OZjDmaPLTg4JLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 890537d4-32b8-4184-ee2c-08dea41b89f0
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 05:12:14.9980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xV13j7DE5cSPG6zUSQ4v0YSb4n0nUFYOLcIvfHkZGbxZH3CTs1aSaOA95XtqeVvooZjEq+RpJYrC/BDI6kQqEA==
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
> 4d33c77cf2c3 ("drm/i915/vbt: Add eDP Data rate overrride field in VBT")
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tools/intel_vbt_defs.h | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> index 6612d3a4ec49..70e31520c560 100644
> --- a/tools/intel_vbt_defs.h
> +++ b/tools/intel_vbt_defs.h
> @@ -437,6 +437,22 @@ enum vbt_gmbus_ddi {
>   #define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR13P5	6
>   #define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR20	7
>   
> +/* EDP link rate 263+ */
> +#define BDB_263_VBT_EDP_LINK_RATE_1_62		BIT_U32(0)
> +#define BDB_263_VBT_EDP_LINK_RATE_2_16		BIT_U32(1)
> +#define BDB_263_VBT_EDP_LINK_RATE_2_43		BIT_U32(2)
> +#define BDB_263_VBT_EDP_LINK_RATE_2_7		BIT_U32(3)
> +#define BDB_263_VBT_EDP_LINK_RATE_3_24		BIT_U32(4)
> +#define BDB_263_VBT_EDP_LINK_RATE_4_32		BIT_U32(5)
> +#define BDB_263_VBT_EDP_LINK_RATE_5_4		BIT_U32(6)
> +#define BDB_263_VBT_EDP_LINK_RATE_6_75		BIT_U32(7)
> +#define BDB_263_VBT_EDP_LINK_RATE_8_1		BIT_U32(8)
> +#define BDB_263_VBT_EDP_LINK_RATE_10		BIT_U32(9)
> +#define BDB_263_VBT_EDP_LINK_RATE_13_5		BIT_U32(10)
> +#define BDB_263_VBT_EDP_LINK_RATE_20		BIT_U32(11)
> +#define BDB_263_VBT_EDP_NUM_RATES		12
> +#define BDB_263_VBT_EDP_RATES_MASK		GENMASK(BDB_263_VBT_EDP_NUM_RATES - 1, 0)
> +
>   /*
>    * The child device config, aka the display device data structure, provides a
>    * description of a port and its configuration on the platform.
> @@ -547,6 +563,8 @@ struct child_device_config {
>   	u8 dp_max_link_rate:3;					/* 216+ */
>   	u8 dp_max_link_rate_reserved:5;				/* 216+ */
>   	u8 efp_index;						/* 256+ */
> +	u32 edp_data_rate_override:12;				/* 263+ */
> +	u32 edp_data_rate_override_reserved:20;			/* 263+ */
>   } __packed;
>   
>   struct bdb_general_definitions {
