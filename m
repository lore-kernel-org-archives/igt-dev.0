Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBBFC5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 13:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3812A10E1FE;
	Mon, 26 Aug 2024 13:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KfvaiTHy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA73710E1FE
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 13:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724677446; x=1756213446;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lRwclWsl1NsRxTfk+DmACK9NeRCMKtAuNP+QJPJ/8d8=;
 b=KfvaiTHyzAZhZvO4AIrHJ8f2xR1YjfTDT0AgoaX2wk/eHsA3X7o+T4CB
 3h63wb+odrbMNqlRdliEubCPyTzQu0qJHy1TJs5uJPmsgK3iDG6unU9DY
 bDtukhnb9btzzWzd+BVnCnIIDRJHd31Bq80kJVe7GD+ZBxFJy6jVumXRK
 65pRJzR4XiSQzZt451O/MSV9wdKMYwe5fcHta7BLU0w/yy+YImU8Vn4fI
 H25bZTE5Gy70uMk+9i/v8xYBoab/+vxaQ+0m5JENz29qM4q7WlLWlJm98
 tkVrLGi1BOO6USUJaWQLYgud7mF6TyoeWwJoNxO1juVzC1wtCAOgMAoxd Q==;
X-CSE-ConnectionGUID: 8A9Y/xgnQH2fsPeaYNtFxg==
X-CSE-MsgGUID: onGD6mrlTvSrSSZXcr/t+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="34472680"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="34472680"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 06:04:06 -0700
X-CSE-ConnectionGUID: 0G1EC1bgRtKAJfW13W/Fsw==
X-CSE-MsgGUID: HbiF3IMzTj6dEj7ZJSgZ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="62809915"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 06:04:05 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 06:04:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 06:04:05 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 06:04:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDvyE78KOSSALZ0wYkSeKWC8m/d1pOk1lL57y8K33L14AkSW9d6WoG1Dnu2efp4MATkcQeBI08kMPy4criN2YMn3x1WFsV7uPke85guX+sSmI7XhF5i9lOyLhzvCp/08PpNNBZD/6hFZZo3UiIYGlH9uSqE3fKHy4Hw9XFh6AdL6TBKh7V3iZuLFuqYUMLNX0Q277tcMKpH2nkyo/+0Ka0fwpku39dw3XFklvbZDDte6aXMMQEO5X1OVpndJ0Z+m4zQxttEqd5xXh0pCQHBCwLtgr2eCHCfYxpmwoFrz0DWlYguOpHKbkkfHSN8JaMBR1QpNmvlz4C/DrX6/br5LVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4aVB4PY3a9qfN/cMyu6nH7SYrKlqvSA1m1an/HK7E4=;
 b=S6hWXopWNIm7TSDxDLp8DIi03n+KqHB5B3vQYk4zPFY7Rm7mcjzymVDfQRZ9GyX0yl9pVc6thb912yepETd2MLzs9ye3x12bNmSfnoBmG75ei6HfwH/TuipKuEpNx1DKNOr/C/fstJTqdpqhDmK7IHg9xaVhJjc59tTa9PUPo7A2amQY8Vmb33jDoFl5WQVJfGbVtVbLyNBe9NVzg2P3OKv+SRUdW+UujMMYkKjXOyBwcnOQXahq1lus+keCaiX/fmiwXTzw1zsPsObAOfAHZgyqg/vwwLWKa5BScPnvGcdlTgvkW/aTP1zIDuIIBjh9E0Ee7f7AM3gcjQ+ktjvpTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7373.namprd11.prod.outlook.com (2603:10b6:8:103::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 13:03:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 13:03:53 +0000
Date: Mon, 26 Aug 2024 08:03:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Extend mercy to the
 upper end
Message-ID: <l5azearoyrpalz4dfqsclsv4eueezfhfxiq6uzbrs7jx3dwfoc@zknvp34c22ga>
References: <20240824212437.1167757-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240824212437.1167757-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:303:8d::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 43bfb29f-d373-4fa9-c873-08dcc5cf88fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UHbif569pgO/+hSjyAzxU1KdEGmnp5q3ETmaAqVUm1jO0x/o9Zhby4z4tltO?=
 =?us-ascii?Q?CzdRIIg1a3WZNuynLhdYluV/vMnu7NYSxVUoNaRdCu23S5TojX0stkZdXvXp?=
 =?us-ascii?Q?vPiR1hAT0pJkIZpB+k40C5O/iGs4iSMUG3w2tV7F/fEqeNpsnHPrghXBjU3V?=
 =?us-ascii?Q?6SO06fY4634ojhBRmZXSw86Af/vELAb33fw5rwV2Y2Q74vfTgsMzB5fCDpvT?=
 =?us-ascii?Q?Z6lIPYVL/IcVakg4ccpj9u3kRSO8274Tprr4WgOjSm88bZpj9WXp8PAvy/GT?=
 =?us-ascii?Q?VTA+hkJl97DfuOWuMs6dCw7qO0OM1Ib3o5m1sXaIKQas0O4RYq+tz32AZQkR?=
 =?us-ascii?Q?tmWZx1HBJ47t/emN5WQl7u/GdIIo4qXPwCB9dqoxNkRoChO4Z7xmuE1KxUnh?=
 =?us-ascii?Q?ltwppWbIX22JSEPHmXJyIt6AT/A+gL64+fmAAtdv8VpLWRrDxNMQQ5hiDgmv?=
 =?us-ascii?Q?UdFgcjnpNCKWz31Cmsnvxn9hJIWTKaU87fdtMECiEFZ5FyNm52SCQrl+rMbl?=
 =?us-ascii?Q?uBoHOVKlUzmr+Oq33lWL8In9ukeaTirzvHdI/gUfSkecwrg7SGwEBYXYTpPC?=
 =?us-ascii?Q?JZNL09ZslMngfldJiic9fYnwf5z2WrXOzdeV46XTwG2iu7CEegk/zVazXjpp?=
 =?us-ascii?Q?cemjz6IEDEpVPOryDciiviGGvYTot6MIAHtG2qPCmf6/q+yA+K5TNOQo1XmO?=
 =?us-ascii?Q?WhmxoGOhsHRdkVgbUoW/Aw/rZ+1XBCiKlw06ueXIX/0Pa6/rEjTNDDrCHAer?=
 =?us-ascii?Q?PE2nsThFwucdX1rJprEbRqPK4KuWrismvMOIoV62d+JbLc2bGwoN0x4txFyc?=
 =?us-ascii?Q?l4rgkvhXojlqZjJUR1cMCfBOTG3b+PWB0oTZtZthHdO1bsZ30YdiXoR/kAVt?=
 =?us-ascii?Q?kR1HhSKvDhBYRh/QbDehVbzQ0zw9HBx1UGpYRE9i1/Lm0FklrjtoTcM7ZFNK?=
 =?us-ascii?Q?PLjO8c6BGhFMH1BhTRKfKOmvlZwUObU7TP+W27SrAhIfQQONwsufTsUtn3wR?=
 =?us-ascii?Q?etsURwk/faZG7gztw5GKVU/DE03lDJ0F4dBPPD2/qiDyxWaHzjCpDvIEVImy?=
 =?us-ascii?Q?+LsnhYY0Xl34OwQxTYA3BKt724bn+ZtQLPoMZepoWRbtFtGEM+r5Y97vPDdW?=
 =?us-ascii?Q?hkS1UG2pJWHJ3sxUKEy8G3warB9ztPOFlHdWutAX2htsOnOFXqATDkkgQTGs?=
 =?us-ascii?Q?PjFkk/BRjrZ6JcngyGyKsaPK2V2PZL8vJFqryNSG83eaA7fN+GfzX3nVSubi?=
 =?us-ascii?Q?bzX9tLFjkWyOZJH7OdQjMcyZk0GnUZfR6mAKrzB3WVTPtO2N+M6pLZ9HLCw6?=
 =?us-ascii?Q?FU94dF66w87tIpuAgV0rMI+XDrBSEERmhhcJ98lOmSsYuA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wZ7XJbP4Uk+dzyBlatjJcKbcT9K03MFU52MV8V7JAz+ZHRGiCFHycHZ/FPqy?=
 =?us-ascii?Q?juRk4G9QAloiK1CzqhN9jWKz18byv2Etbl4G+cPwRup3JSzh8kEeFXhc8kA7?=
 =?us-ascii?Q?UBYWNBMrUvB7VtHboR6U+FkNJSwxaTI49fCvjO+Q1iS2PTHoXgGRni0EJLUe?=
 =?us-ascii?Q?eUwhyBTzfn8v2gim9Z471d4SPD1IlCAy78sDaSUUw3f8xodUw807uc/88wA5?=
 =?us-ascii?Q?dzWPTUzTOxHvcWWHRKFYwlp7wOCBCMglnnJdLGIhPQb7iWIdcvDXNJzp1bck?=
 =?us-ascii?Q?OqA9SfvRVHeekojWKDNAnK+HlCFwBae1bopqFvS90fbALxND9FcTlmxuPWmp?=
 =?us-ascii?Q?9AocOWQMOzqMOXV07i66c0SlwC4STHvQSCNuoFVFwR+oEBNsx5RIzEGc6Gwk?=
 =?us-ascii?Q?UTC6CJiRjaL3NWuEes4OwIShfFljaK0YGf0rsOqbiYadrlhOi064930IaK1Q?=
 =?us-ascii?Q?t6ikQ2WKwAN/vsFNKn1Ac+ujZQY1WbfbohH7hQcF5ATxojhBDSHhhhrMznwl?=
 =?us-ascii?Q?5I08m+6d1hXiuO2Slk9dkI4woY26McmSAZV/y2wA+wVc8muwmGrfHNS2GsAS?=
 =?us-ascii?Q?/8y4wMu8rdkNL7qy6byXt95t9v5z0mmHKo5n+BHvVUzG2lVq76bCNqfUNm6a?=
 =?us-ascii?Q?yWAFQ397A88vk1h7pKFWMSbeTwJ5TU845MYhpfZQoGIWfIAY31uyM2BUf+kQ?=
 =?us-ascii?Q?6Gp2qlKbMHbA/NaLmlZDrDPhreUvNNDIm+xf5dThLCV0Rzt8Nmu00IijPDgn?=
 =?us-ascii?Q?5stBDV/YmnLTWUSnB5OtabKq+uW8E0iFuk+d0NAmRmMwkwKkM6ImM7eFyJIE?=
 =?us-ascii?Q?9bDeLVDs2V54j/ZQitNqnbzUZcHavrHJOn85ld9tMbOXtBVy5JJhnwv7vrRj?=
 =?us-ascii?Q?oL/SeQb+8v3DvyrtIMEBgxPAqvzkU0hOBV9iIRrRcIeewOt/0UFtobxsxq23?=
 =?us-ascii?Q?mf4idHVWfqMOlJEU1gQsSoIzPXPsFh8kGu/xW3r147UhlJs59yNaUn4ZKeOP?=
 =?us-ascii?Q?z0oV726l7+P8ccZVn2pp/DT38VnpEBhJRDMPjR1T+hcsiaAdrRVO8mmB6DFR?=
 =?us-ascii?Q?aI4ixpMWu4ChBFE2Iq+evnQ0ENhM8DQ4j5Vm9fhciX26enNHFyIutxFkMxo4?=
 =?us-ascii?Q?rOAuhOEWZB26+lQAWdrmR/EoL4IBCL1V9b+TlFeV3OuVWfT91TxhuCkEZmpO?=
 =?us-ascii?Q?Ay4oGVwmotgOqIzTygJny0b2/XiQwcOScJuWDD36rMQU9i6PHf+pur5ZpPqE?=
 =?us-ascii?Q?93EHeXYMmqnX8b9O8fDa9iRpNdlBX6lWWK4mKztAtqfOF31VvqmHAKjWNc3q?=
 =?us-ascii?Q?XRoP2VhM5WjDaI8hV9ARtbEO4KQAHqTR7g5228bQTMxhH+s0eJ9tC37CnR1C?=
 =?us-ascii?Q?RyXWFIKoUW3yMjIttCFAS5z1x7ElOht5vw+TFzmGI20HGvrwzDZyuzvv38Dp?=
 =?us-ascii?Q?I/jb+rPUIzXVXUfDA/cLl1aliZ9/X3tbTZ5AnM0aquOYQU46ivAc4PDmSfKK?=
 =?us-ascii?Q?tY3pkJH1uWEbHceYBRNZlwWIvqJ++eF009jwtlL8FF7Z40TsZJmXJ9KnHlvP?=
 =?us-ascii?Q?UDwDeWvK0iEp92WqGKGvvgrqhGmOmUgPj5WOuRmlKJiNIXuaJpgpf3GAQGOz?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bfb29f-d373-4fa9-c873-08dcc5cf88fc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 13:03:52.9661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYuRtPUHDx9TQxqaAbGXPsyjV5UrWw2dc1nLJp80ERd5P12ONR31M5Rg64wQjnviFfWvDPqvm/rC6e5WUp5fpfrtdC9Yu3vsmxUymeqCNWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7373
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

On Sat, Aug 24, 2024 at 02:24:37PM GMT, Lucas De Marchi wrote:
>When we are processing the fdinfo of each client, the gpu time is read
>first, and then later all the exec queues are accumulated. It's thus
>possible that the total gpu time is smaller than the time reported in
>the exec queues. A preemption in the middle of second sample would
>exaggerate the problem:
>				  total_cycles	      cycles
>	s1: read gpu time		|
>	s1: read exec queues times	|		*
>					|		*
>	..				|		*
>					|		*
>	s2: read gpu time		|		*
>	-> prempted					*


on a second thought, this reasoning seems wrong... because we do
call spin_sync_end() before s2. So delta for exec queue time
shouldn't be larger than the the one for gpu time (since in s1 we
got the gpu timestamp before).... need to check if the sync end is
actually doing its job, or if there's something else going on.
I couldn't actually reproduce this > 100% on my end.

Lucas De Marchi
