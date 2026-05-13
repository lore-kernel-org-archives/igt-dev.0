Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE26CD37AC
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 17:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C539310EFAA;
	Wed, 13 May 2026 17:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRrjCXAz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD3810EFAA
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 17:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778694789; x=1810230789;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/hf5Ag4WPZ6fYlbuIJidxrrYEZ/+wfsiCLNEWTqO1as=;
 b=IRrjCXAzcyH7LB8b9npWEPv3pQKazPEQ6c9uDwTVE/6HaK28Dkme7Bga
 YYtnXSiUDie1Y/S/EbtckWxquSsmu6v0pVIS+pe9lPnW6CkNfwOLMAZ96
 DDi2nBXUBoi7v6/m1eCnUWY6MP27e0oO6+etXqJXzOWEuuSHawkJ4avbz
 Zhs+p+Xynx7/Eh4QjPMf9KiZ+w+r/EtUf4G4hmWAZePXm5k9JMXr6ue82
 k0PaLD8/Ye6D8nFgcqv2GA2kktWzy0CI+3aF1ZzFgirASRXJNS5WnDGjr
 ctrdbiIlRN+92YP5WI+BXvSxoKJnXc8AmLvF+LrIJg90XuSmNTwKX8NPS A==;
X-CSE-ConnectionGUID: tzPObENcQEWhieV/9oRqRQ==
X-CSE-MsgGUID: XyAejrh8SiuRVbRw7b0dJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="82197531"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="82197531"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 10:53:09 -0700
X-CSE-ConnectionGUID: W0VQU0omS7uRAbt+9o4GGw==
X-CSE-MsgGUID: mouD8qwcTV+Xe9b2nG51xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="231754586"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 10:53:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 10:53:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 10:53:08 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 10:53:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHBRP7YeAz7gOY4wkfrg97HVk06nE3JDvOmMKMPkc+i/1RI7VTg4yeNH6pmCZ61UjqsX2pIz0cy4WuidmC0/D2YlPeoCFmE5XLPOWVd6+O1Q1HEmTjkIKm7+SQDNP5Weq0XogM8Cg5hPsfvtmmpojo9fsZoJkzKB7HLGcjFy3JLvKT+KT9i1JRTyILOZu+E7mY0oh5aHXlP0GteHxdM6iOjnzIZp6Eex4Kz/SpPYMDOh/pybWmYeYOur+B0lCHbBk6b7yWhrjdkcBBgAi7PrQ5KFZ7UCsaGkRECuvpZvDVo/8oszKKDruOrBC9JcDB2O/n0+HGMAuj2zmfd4g71W2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFMwAvcjvEE6x5IFraMgcBzod74Ks8u9+Zt1K8TE6HQ=;
 b=JiiwuEi9jUPA7c2V8K5+/lL8kdzX4ShGvCu7KSo/BPVyKMNcmX/s9zm94FXkzWdwkelrTn185zn7cO258MupZHELe7zKT6uFNdOHda3AHyXJK81OrbvgcVQ/e09EyxE8kmT1FKehJeAXKmzSDXTi++wEqdSwfuJV26+gXA5ovKa0rbtFcKeZG5NxeygQxGT93VrUKDmuOPXcpymHrx9SRT0v88XJt1jPRosPsnrbymrfVF0hZurQqnxatxjU79r8fJPxJPRR4H/VW2LJw/Q+UJz10NnaCtD9g1S1nudBixiC5vNs0CzoLfUOm4yoC6uE6boMVOMvpFfwLZyAKlNWdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM3PPF529E923C8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 17:53:06 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 17:53:06 +0000
Date: Wed, 13 May 2026 10:53:04 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_oa: Fix checks for whitlisted oa
 registers
Message-ID: <agS6gH2YNQcQi2wy@soc-5CG1426VCC.clients.intel.com>
References: <20260512162637.1014955-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260512162637.1014955-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:303:b9::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM3PPF529E923C8:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c3ca7f-e45e-43c2-2629-08deb1187c8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: ucm7cPInVAIs9IYHXmbGPfE2MH6QvA5+WrwV/eillDwvHuG63N40RLCm7FGk/O4DVoMOOvVrBfQqI/E7t4qGjZRGExabENArpPel+EiZ59uns03hKsPJsfm377xxeVGXLky4UCc1Ua61oCeBgxfdYAKjY88HtUW3EHjucp8RxPXRZiwRKHu0nvVnVjkxji+2eFsifXxMm8XwRr/EKOYJ07rPI+Gnbrqy2pl209WEELNUK0RA8LyYztavp0ecKnLUlJYveQ8/ghTMhlyCaSnKShT1Ey67oicYm5loXEquIRkSO8dND0J+aM/kcbOWdm5hhXiSfZnOFkpoVswmumPpjB68ITSxuvtSC5aawYGOTTgqZHTCfvTsMasZbySxNdnrL7KbeVAemeVmhJ6fZNDke7izjd3tE609jehasfwgpgsE8jRF2MdkGz9xuxEmDmiGK1egj2vM5UQHsvnF1MxJwV4QuKKA6QqHZ6w9psychBft0NbWwDmHZqBSSBeq8YkAez21phjkK4xqPOGbW41ABP/M1VneXhaJwR6uGXOfMOe1S6SsuJL3tu9qnmqbpwV6pi9HOSrU0FcChGx0U4myqv1JtSAoT7dfU37t0/1ZwNSL7WZltTRRLAgLPorAtilodP7mejTpiLmdLCjnspbuZzO39yjjJfmTfBgtt/UIjiDlRraSV+pH15PO0bMRzb2/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXVlWW1USWNIZmRDUUlwUUg4djlZaEhvWU5iYkFva0RzTGN0RU5TK05kUHor?=
 =?utf-8?B?djVTUXZYWkRQNHVmM3dmMmhLZVJLS2t2cVlCWDFXL1lrNG5FdTdYOE5hTXJY?=
 =?utf-8?B?OGorcnJGSlNsSzZDVWZUclpEcVZEMmVhRENXZHhHQlhYRTI4YjNodFFnNFpL?=
 =?utf-8?B?RTlrMHR5UWwwV28wVjhMZDlGUlhYTWlGanEvM2xYM0tzdmJhalY2Y2dtWFlK?=
 =?utf-8?B?N0JIWGxmQnVKdHdjN2xKckFTNUZrSC9BVXBocHhLODBHUVhlUjlaRkR5RnJi?=
 =?utf-8?B?ZzJhNjRDamNjTjQ0eXhjZ2tRQXFyOWJwSHlFcHV5bE16WTZDV2FLVk5vUjds?=
 =?utf-8?B?WElxTEVndnNTWjVabXBMMUhaQkNDUU1MVXRaWWgrZzNIamNKcWpMeGNwL0J6?=
 =?utf-8?B?TC8xWFZlRXQ3Q0oreWRML2h3empCb00zREQ3OVhIS3NhUzJDaGhGaGdRN01F?=
 =?utf-8?B?VThaVVJ0Y1Npbm5TZEtHQzBSUGxITFplVUJRQTVEVHMyQkNtdW1wVmN1K1dj?=
 =?utf-8?B?d3FUNXFpSnYyR2owZVBFNFFZYVJWZGkxck5uNysvSmFMM2lYVUV4YzFZRU0v?=
 =?utf-8?B?c3k5T1ZYZU4xOXNWUUNWNTdYR3ltQ3dlTGZrS3MwdUcwMThNMXlFb0UvUFYx?=
 =?utf-8?B?YWlLNzJzSktGREJ5V1hYaG1weVNtMDE1LzIvT1FDaUgwWG84cHEwNGp1L0hL?=
 =?utf-8?B?T1BlMG8vTllSa1RzMVBoSG43TzdZRzhLbTlZQ3RpS1FucER4UGJIMHZ3SWt2?=
 =?utf-8?B?WVgvNUxnWU5pS1ZxM2VNanRPY0I2TDVIb2ZWd2RLZW1IL2dSZlc3YkRpVFph?=
 =?utf-8?B?SG4vQ1dIUHp0SkU1VDRqNHBYQ0FPcm12b1JwcmovT3JmRDRvSllMNnRSOXMw?=
 =?utf-8?B?dUw3dW53cDdQZkxORWtrZGhmb2h4M1F5c0tIRDRhdDMvVjh6S2ZWQlVSdjd2?=
 =?utf-8?B?US9RRDBrUjhUS0VubjlQZ3FCVlh6anM2ZGVSaFhvQjlUNnpTUmlQRWFxVThF?=
 =?utf-8?B?aGYwMDU3VW5maExqa25kanhwQ0hnNzhUMWpUNVBnTmtuNUlZREZtL0l5NFBC?=
 =?utf-8?B?QkdseW92YXFRL0lXd3M1dGVUd0lQS0xOS2JTcmNib2wxVDdRMFRNVnpxTWtw?=
 =?utf-8?B?bUxYVEdIaVliTDJnZythYzh1YUlzeFZ5ODFIUnVyT3ZsM0gyc1I5QjFUNk5P?=
 =?utf-8?B?V0tLbVZxWHdzMm9WTEN1ZDBlR3RKWHY0ZjFjYlkvRmtXajZYYmMxNGVKd2xI?=
 =?utf-8?B?QzFEcVA5MXkwdm9BcEpmdUE0b2hLVCs5SkxQUCtySk03Q0NwT1JTSGx1ZXc4?=
 =?utf-8?B?S2tZaXFMMm0wNWhjOXlseFVURlpzSkU4MFlCYlhUUW9wbUlNQ3h5bzZFekc3?=
 =?utf-8?B?Tnp0Z1U1d1Jhd29oU0I2dXVYM3FLY0lLS09ySlI4UWVQMFZUNGZCcEprSlQx?=
 =?utf-8?B?QlhudGtmeEh2R1lHUFl5UlN0cG0xYm5Sa1pQQlZyL3JneTlHZSs2eVVzYitB?=
 =?utf-8?B?WmE5R0Y4QlAwaXBtUk51TXRLTWIwWmVYZmdYVlRFM2FZdXlRTTViWXZjcHlr?=
 =?utf-8?B?eHRMS0NsWW00dXdWMHI5Ny8zZmdkd0ZENkhNYmpTNjJqNFpTTHM5dGJWY0JG?=
 =?utf-8?B?MkkvelE4bzZ4Q29EODJUQURKN01Ed3ZjVW04dG9NV2l3NndXWXloT2k3dnRx?=
 =?utf-8?B?RzdZV0tFY1BMUVp0Nm1TeE1tOHNEck1CbWEzWjFXRjRCbHlKZ0o2RjVQTUh0?=
 =?utf-8?B?NGZzdWhWSFMxZmlyK2g4Rm5hR2FEUXArRGl0S3ZydTNTdHkrVTQ2MG95Yk5G?=
 =?utf-8?B?RThnY3JmcFRlMkIwQktDK1NPcjA5eUVWWVFLa2JhS21hMHlCdmlEZ2dBV0xL?=
 =?utf-8?B?cURVVFExS2hYSEFXTU5tN25WTUFEa1d0R1kxNDYyUmU2Y0dQeCtma3lLRUlt?=
 =?utf-8?B?UmJxUVVUb2w0cU10R0dMTXRXbXcxcjQrZnQxWXMxcGV2TXk5dlBJaWhDdVFC?=
 =?utf-8?B?aGtWelpudkZEdjFxOENMSnppKzBFRnJGL2tYMGpCQUIvOFpxa0VkWFFqSUJm?=
 =?utf-8?B?ZlErMWlrY2hXcmxGNlZrWTVhZFZQTStkcFc1eWMvSDVpdlhCUkRKblp0UkRz?=
 =?utf-8?B?NStCbzJLY0RtVHBtaGtTRkNncWhVd3BpM0lwdjMwZzQ5NUR2dXZsWXVFbWpK?=
 =?utf-8?B?dnVSOUZtKythVlM5anJZaTNVQlNWVWs0cmFUT09qeWhqamtVYUk3ZHJOU0h1?=
 =?utf-8?B?djd4TlJEWU1vUUMxSlRwNjkxOUt4V3V0YW55SHZYNG90M2lxZk5ISDJZcWs2?=
 =?utf-8?B?Uy83cStCcmUwZjB3V21hNzhTOWUrL2J2Nzl5R0lvZmY4KzlISjNNUWlrTnBG?=
 =?utf-8?Q?ItawD1cZfX5fnu3Uo7FyLJbT5ilmXlsM7R8+o?=
X-Exchange-RoutingPolicyChecked: kyx2wSfwPiMV64ca28fSJxxW/pHQHwLvb4/1vONcW7SeXrXhHCoGYqzdOcpbftY6KfaYf/NzjOTYY8JUWpTe/6EvKzYvTXOfkMdfvgAMJBfJ/itOk9/d2keKR9iWjiBPuxEpIfsSTJm3Ahq7pJdzbiBmJhMpJoKoS+DzW+tfWN6+UFCl39wwTygBB1Kp7rONRXJoWw6yKlEkfJCdLr1AkCPBKyQZCIepEAdpaS97F5ELrjgGZPb3zgqlyr/w95/Ftxc05DLJeDr0l8hAOiTCV89E9ajINgWzfjGDAHBBTWnPRZWeuPmwB18O7LLpk6/KnF+htxx1Xn7xAY0SPZZVZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c3ca7f-e45e-43c2-2629-08deb1187c8b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 17:53:06.2125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2WGWehkcHOiucHDJyslmbR8m0kJzc4nKMkQX58yXedBi4mlB7kRH9HdsIxvC6N8HS3V0U5ENNdmJDx8Aqcyt9b7GzzP18nN+NNwAjlicSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF529E923C8
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

On Tue, May 12, 2026 at 09:26:37AM -0700, Ashutosh Dixit wrote:
>OASTATUS register is not used by UMD's and the plan is to discontinue
>whitelisting that in the kernel. Also, UMD's use MMIOTRIGGER, TAILPTR and
>OABUFFER registers, which are in SW whitlists in the kernel. So check that
>the latter 3 registers are whitelisted and remove the check for OASTATUS.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> tests/intel/xe_oa.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 56d818d860..a50eb12da9 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -3833,12 +3833,14 @@ test_whitelisted_registers_userspace_config(void)
> 	xe_oa_remove_config(drm_fd, config_id);
> }
>
>-#define OAG_OASTATUS (0xdafc)
> #define OAG_MMIOTRIGGER (0xdb1c)
>+#define OAG_OATAILPTR (0xdb04)
>+#define OAG_OABUFFER (0xdb08)
>
> static const uint32_t oa_wl[] = {
> 	OAG_MMIOTRIGGER,
>-	OAG_OASTATUS,
>+	OAG_OATAILPTR,
>+	OAG_OABUFFER,

It depends on what you plan to do in the KMD implementation.

(1) If you want to consume only one NONPRIV slot for whitelisting all 
the relevant OA regs (for the mmap use case), then I would set it to 
OAG_OASTATUS and then you would choose to whitelist 4 regs. Essentially 
it would be STATUS, HEAD, TAIL, OABUFFER.

(2) If not, then you are looking at using up 2 slots to support just the 
TAILPTR and OABUFFER because you would need to do them separately.

I am inclined to doing (1). Thoughts?

MMIOTRIGGER is in a separate space and is already allowed in HW for most 
platforms, so that's fine however you want to do it.

Regards,
Umesh

> };
>
> static const uint32_t nonpriv_slot_offsets[] = {
>-- 
>2.54.0
>
