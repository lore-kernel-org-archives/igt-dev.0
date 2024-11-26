Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA21D66B86
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 23:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352D610E0CC;
	Tue, 26 Nov 2024 23:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPhsktRc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BEE10E0CC
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 23:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732663309; x=1764199309;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lUTsAKYsaI/kbk4/YCq25o+ABA/SDKR12gQouV3EEpQ=;
 b=JPhsktRcy0VYTCfYPAE4P4Nyd9ehO3QYuPhTJEY56mj7fpTNAJKrrr5G
 CkctrYx5g764t6Z5vBzksFuwsTJLE7sHjcIq1qi9aC19LVxUavMWk893Q
 0JfbJht2A4Kl9IAMkqJZV//wzsN88jHrEmyA5BO8TzlIsz6stiyuyUfzj
 Qh/G/gPdEuycpZ4jvq3kRpj/n3zhlj8cC5A08HV7niFDza28w7MLIzHz6
 9zaIiFQIvd/um/KfSsX7W2AfCwG+WG5XtLDfDWUn2158NQK3NeOcnO5iy
 2eyaJCQkgwFfez/fBeyLRV4rHxYXbisITho/zJiKlNMqrGc06JYEWdGr/ g==;
X-CSE-ConnectionGUID: vXbEVgBPQumyW07BG/vpwA==
X-CSE-MsgGUID: au7f9PNFRga0QcmXRr/EGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="55349291"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="55349291"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 15:21:49 -0800
X-CSE-ConnectionGUID: vjeiGF0eRkmbNyFhGdinOw==
X-CSE-MsgGUID: dEeeJTmBQIWik9QEePXJzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="96502914"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 15:21:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 15:21:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 15:21:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 15:21:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGNqQKKZP8e5nzcFVm7sVbiJIZNeU2ADH1gT8fUyg+Qv6IKpGsBjMyk0+YzkQiaFUOSR3DQfTqTm9dUOjfp1jmXUv6eAOVTJX+ZySWK6Q03nM2y/gE11aLpcgzae7z+GoxZya8V88Kp1d5NN/8sjMu8Oint9yZUOB7eYatnxdTlRwIFfpreWn/j5eAqPQPlGmFvmbiZWk9sQ491vdftQH1tmgep2UFZ0a+wIRDvVv6eANjlY78NfxKn3d2fDCVumt5tGC0Q7J1iK6ANN83wcOHZ3UAfispRNvgq2R5pdFXvmwZ/y6acRZherx9KmlaLDc4LsaW2UeUN4bXdgs2oDpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYO1z+rP1gWZjveC8baJKQjJyhNtzlK5VoQMuN2UIAw=;
 b=kHkQpzYch1unOXzhIZuzHzwKsKz9KmOAL20N90R7UocY2SdCqQHm4aUfwHkm6HPACauJGxhx+FLabZJm8i1DZ1+nAQhO2T1S2PDDT4R0zZk6dtRok7vRUQqF11ynEMXJLWgt7klJ/NA2yXflMdD77xzW/iYVWpxXZcOZ+sku5JY9Rag72AhlcPzfgbLi5UYm2dbOq5mKw6b7HzfnJ9CSbjoJxMXsFM+bmAedm9M5+hax54CW4LZBIFFb+ivj7dLtMC2wxXxwZTXiIYKdLyRXCsB4fkwz9B5AFfoWAckSEY2yxb8QE2XltwS5jwAnQCpXgoxBHxZZKUOkamsDQ7mMdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 26 Nov
 2024 23:21:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 23:21:40 +0000
Date: Tue, 26 Nov 2024 15:21:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?=
 =?utf-8?Q?re_for_tests=2Fintel=2Fkms=5Fbig=5Ffb=3A_Inte?= =?utf-8?Q?l?=
 display version 20 onwards doesn't do hflip with tile4 (rev2)
Message-ID: <20241126232137.GJ4891@mdroper-desk1.amr.corp.intel.com>
References: <20241122053400.1931176-1-pranay.samala@intel.com>
 <173231511735.1857669.13486925803990190023@b555e5b46a47>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173231511735.1857669.13486925803990190023@b555e5b46a47>
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b844f2-d734-458d-0f1c-08dd0e711477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ff/gF3adSEBKtMHEJjlW3K/Vkn1oo6p9N1wMVAMj6gpSrFdCkxL7yXOfj7eB?=
 =?us-ascii?Q?S1kqLrqr7kyw8JmGCWtZ0QfzNIVh20U/DVm1ijBt9mVv1RnkbjzFhh3cysjM?=
 =?us-ascii?Q?PbHAcaVMbtH5zKAyCKnDNxq5DMBXn0obe2KppvJ1eRTNL8y33S2yTtbfQJi7?=
 =?us-ascii?Q?jn4jnG0oplS/V8PNyq06Yx2KP0IRC45ZOYBko2XF57G8POuzUcFq2PJoBdBV?=
 =?us-ascii?Q?mwT6i+wgmPxuXkBuN8kmvnQxqhjvJGhx6fYj4I1vmuz07BvRwbKoMOC++nWo?=
 =?us-ascii?Q?KHzFWb3qPlEWU6M6WoKZi+N4U2RXPOiwsd1+/FQWBRP3KKI4D4YuvSq8If/t?=
 =?us-ascii?Q?Nzf7bn7l95MnEwvg0WCMHlKnR8DOk9cIc2Tx+SUGto2NoBqPTYNswQ6er1Ck?=
 =?us-ascii?Q?qQf+0I8045Nc6Xg1kyx8vfEe565bP8S2uefJJmLWXBMbmL20m9oxqUkc3LXh?=
 =?us-ascii?Q?wD6YvEst8fSzqsKsI8+7JunUrbIu2ER6q79XMShcjSacPCq9GpdzAKyfUuc0?=
 =?us-ascii?Q?dGZpopReN+pzhBmz0K5LKUEwYb39BZ1h9UGLD0An8Om9htS6WPicNv/b0A97?=
 =?us-ascii?Q?diyV1XRSeilxTwy6tfgR50PXUMhZQp0UrizW3Z18FsAE0PAfOJHpXeQ1G8YZ?=
 =?us-ascii?Q?eWJFPhlWYWNkEIcHoYO+9abaYxjOoIvNvLCjw6yOgBY0ElY8RllBWzXirAUC?=
 =?us-ascii?Q?kzoFglmXz7t8FHEaxPzAQH0Q4QPj4DEOZMGf0iFI35PesFTIqVqupm9Pzaps?=
 =?us-ascii?Q?Dlxj2Ej6EFbeCnh8PDfvp3StDW44CKn9ZaY1zWHfJ1vrLBDQXPkygC6WHLrw?=
 =?us-ascii?Q?H7k5h1ebVbZNCh/N+lutuzQtBjDcNRyYvJIKnsYrGT42HJRNe4ZJkH7NSNbJ?=
 =?us-ascii?Q?HT4CcolHHZcfA4x1X83v0Tssny2wSgHhwSHb/PXV2dZ3f9AF8nEUXZrC8bkV?=
 =?us-ascii?Q?b8PIJco7CnafC+kg/59dD6b29KiHcFkGupAPeuTMQ34rA+eeVZ/VG5THMJdf?=
 =?us-ascii?Q?yRsf9BFpVU96pJiHc7WfCEFvo2/7KqJrcdIJlNVZzIPCNlDyvJGprkyNwXcR?=
 =?us-ascii?Q?E3UVzIuQX9GZ/zUGF2wGymZMStpqiw580FIzvWQC/FA2MaUxciHX3uBddQPG?=
 =?us-ascii?Q?h14tMKrgH/dtf5NgLItpUP7jjBMbg+dwoOqw7zhroNmu63IXhBriKCza0fv4?=
 =?us-ascii?Q?NkRcXu2bfgg2M1me6rSdjScoexehCg69+qL3+YXc2MebJHuyQlhe5Sjl+mPO?=
 =?us-ascii?Q?YXj14Cd0U2DXWTvPqAkZSzSFT4Mnyv6Rl6NTkSnV86TXMoriMHXiekVX+raz?=
 =?us-ascii?Q?LJk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zLjufVFxIx0ba9HChKwEvdNMgou9b+TwrCnA+4G+7kZgtjHoey4rgkqjLyeh?=
 =?us-ascii?Q?3LCihD9CzQRkm8amnHfaZL7JbIvPQruXyRuER5VG3K73gp3WgrT428nhW03A?=
 =?us-ascii?Q?tuItgvJ4BFRhgMjDCLzCPAl/4QmB0BCeVC61Cb0CfNwvAFt+XpFQVCBrhTcV?=
 =?us-ascii?Q?MQSEjd8FBO1uhivwUuEyhRXMogjd3VtBe5m5TL3yYVCDaNtIiJfX7ZtvD59C?=
 =?us-ascii?Q?UEL9tcyEYtQVmA2knFfrHlN1022oGv132hvFNCMMhfzpKrkka+aZjxEot35Y?=
 =?us-ascii?Q?PM7xEXC/xEodd58K2ZHibsDvgfnKAjD1hZcbRXjbKzl8IEzvp9yGPr/S2oKH?=
 =?us-ascii?Q?UKvb3H9Q28Tp18eFsY0jR6YQiOhFmcYpx/FsNms/A61gvBkdBx1RiPYDjRSI?=
 =?us-ascii?Q?nN9AQ1RlzXVgphKFx4co+eJakM9JcyF6s+nekknJkHoOeJ6v5y3VATb2Qs+Z?=
 =?us-ascii?Q?mjVLHODrYMElO57RrksJ1xb/Wi0ISdZ0Grws9EXU0Ew9ynSfQ0LaxiysCtly?=
 =?us-ascii?Q?L6/1u+eGkm0vHNAo3nY6qr2esgavJzLvlb+wvnDUKCiizslgo2zMKUlcY+dJ?=
 =?us-ascii?Q?mhC7bYCgqsJVZZQrh+2tEpo0fmQ/T6DBNBTz7+5vKiI2yU9m48y1IjeqRhy6?=
 =?us-ascii?Q?mHSZWEcZUyWG3+oxPpVSUrpKr1WruASbiRCCkNZskCjntNd2AxthmQEErGA3?=
 =?us-ascii?Q?myDhcXteaGAhu9BAjYCHG+TF+p3coJrMiMxz7VvgzeeIV6ZL22ykHNIkDt7u?=
 =?us-ascii?Q?EMMAfaIgDQiXcMjKoWHAIMyN5/g1PKvdL8XzLqPpJ+Knrf3IFNUctplpXsSO?=
 =?us-ascii?Q?kJWQ9DxoC2CMHjr2j1/g4utu3PwfEnFvuDYvG8v1xVGXVa0hpQRCm+5BgunX?=
 =?us-ascii?Q?k1MUywLn59BVJOjd88PlzOyOgrDn/icwhd9iZx4N8GD3wpaCRjU7jkJ/Aazy?=
 =?us-ascii?Q?SqVGJIxWSj/5a7eICKfQOLtlzKpVdLYJ/REE43iL4n4fNlnDvPanxmm4rhbA?=
 =?us-ascii?Q?mcYfVlAjQpi8pv5T/XKgwFeby9bTXFpSSQfIK+G+TJ2c/fcAhHlwP1lyfzF4?=
 =?us-ascii?Q?C4T/gLtGEG5r5J9wb2wNGHTloxDumsU/AkvgZB0kk02KVng1Ty+6FoN/5mIq?=
 =?us-ascii?Q?uYZNZ7ULmD9FO4WW2KrACuyMsym0U+/E9QScFrobfUC7tQCpF///oTR0SfT1?=
 =?us-ascii?Q?dlLRTWDREPWUZkh3PMasd+6Qh49tlYJlWUSup1r1kbql/qyzyxSxno8rdJmE?=
 =?us-ascii?Q?MXoBp9Lgg0IQGSRIW3ygEHz3VcK+O3oIDC4gny471wDbdaIWjryrzqZ3ZZot?=
 =?us-ascii?Q?PVUxmbK9YMvEuXULzzAOdvPsR0NkHbKRBBx5hulVyw2gAju0/UsChaoUecUg?=
 =?us-ascii?Q?Kt4YVc7HgSI5DizB5QpyvyD6NeN5f89782k9kN9XsVoT7sZX/tAlMmlPS7kp?=
 =?us-ascii?Q?YVuRoGh282gDWft8k7IdcmX9p2botZAKlks/5u6dhFax9o8rZhKKmxd+E6VD?=
 =?us-ascii?Q?EOjk1Js8jTv/QVSJB0NpCbTkUYx69Iub0CoQbNs3YLlEzuuyIFLcPaHpSzh7?=
 =?us-ascii?Q?47FPs4eCqlcTshhpgABWqKtNJucI1EJsmKOt7l0VkKii/iTKsbff2UXEkBAu?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b844f2-d734-458d-0f1c-08dd0e711477
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 23:21:39.9401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Gmj763G52Mn4DPRBx9MY0c5pky4bER5U12/DcivT4jeEvyGJe3f5kJDtiNcAzDYgQw/k3TknrfaD2IBAnA96ebjTSilwL/U6LThhq3qxEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6940
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

On Fri, Nov 22, 2024 at 10:38:37PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/kms_big_fb: Intel display version 20 onwards doesn't do hflip with tile4 (rev2)
> URL   : https://patchwork.freedesktop.org/series/141478/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8121_full -> XEIGTPW_12170_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12170_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12170_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12170_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

Skipping now as expected.  The other failures below are unrelated to
this change.

Applied to master.  Thanks for the patch and review.


Matt

> 
>   * igt@kms_color@deep-color:
>     - shard-bmg:          [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_color@deep-color.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_color@deep-color.html
> 
>   * igt@kms_color@deep-color@pipe-d-dp-2-gamma:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_color@deep-color@pipe-d-dp-2-gamma.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-bmg:          [PASS][5] -> [FAIL][6] +1 other test fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_compute_preempt@compute-preempt-many.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
>     - shard-lnl:          [PASS][7] -> [FAIL][8] +2 other tests fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-8/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
>     - shard-bmg:          [PASS][9] -> [DMESG-WARN][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - shard-bmg:          [INCOMPLETE][11] ([Intel XE#3468]) -> [INCOMPLETE][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@core_hotunplug@unbind-rebind.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@core_hotunplug@unplug-rescan:
>     - shard-bmg:          [DMESG-WARN][13] ([Intel XE#3468]) -> [INCOMPLETE][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@core_hotunplug@unplug-rescan.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@core_hotunplug@unplug-rescan.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          [FAIL][15] ([Intel XE#3162]) -> [SKIP][16] +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][17] ([Intel XE#1130]) -> [DMESG-WARN][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
>     - shard-bmg:          [DMESG-WARN][19] ([Intel XE#3371] / [Intel XE#3515]) -> [DMESG-WARN][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_module_load@reload:
>     - shard-bmg:          [DMESG-WARN][21] ([Intel XE#3467]) -> [DMESG-WARN][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_module_load@reload.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_module_load@reload.html
> 
>   * igt@xe_wedged@wedged-mode-toggle:
>     - shard-bmg:          [DMESG-WARN][23] ([Intel XE#3468]) -> [DMESG-WARN][24]
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_wedged@wedged-mode-toggle.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12170_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_getclient:
>     - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#2423])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@core_getclient.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@core_getclient.html
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#1885]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@core_hotunplug@hotreplug-lateclose.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@core_setmaster@master-drop-set-shared-fd:
>     - shard-dg2-set2:     [PASS][29] -> [SKIP][30] ([Intel XE#3453])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@core_setmaster@master-drop-set-shared-fd.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
> 
>   * igt@core_setmaster@master-drop-set-user:
>     - shard-dg2-set2:     [PASS][31] -> [FAIL][32] ([Intel XE#3339])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html
> 
>   * igt@fbdev@info:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#2134])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@fbdev@info.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>     - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#2423] / [i915#2575]) +125 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2327])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1407])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-bmg:          [PASS][38] -> [INCOMPLETE][39] ([Intel XE#3225])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-180.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1124])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1124]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1124]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#2314] / [Intel XE#2894])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#367])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#787]) +132 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2887])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#2887])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2652] / [Intel XE#787]) +4 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [PASS][54] -> [INCOMPLETE][55] ([Intel XE#2692] / [Intel XE#3468])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][56] -> [INCOMPLETE][57] ([Intel XE#3468])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#314]) +3 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#373]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#373])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2252]) +3 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html
> 
>   * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3:
>     - shard-bmg:          [PASS][62] -> [DMESG-WARN][63] ([Intel XE#877]) +3 other tests dmesg-warn
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2390])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#307])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-8/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#1178])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_content_protection@legacy@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][67] ([Intel XE#1178])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_content_protection@srm@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][68] ([Intel XE#1188])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_content_protection@uevent@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#2321])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2321])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#308])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-64x21:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2320]) +3 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_cursor_crc@cursor-random-64x21.html
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1424])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-6/igt@kms_cursor_crc@cursor-random-64x21.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256:
>     - shard-bmg:          [PASS][74] -> [DMESG-FAIL][75] ([Intel XE#3468]) +3 other tests dmesg-fail
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x256.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x256.html
> 
>   * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1:
>     - shard-lnl:          [PASS][76] -> [FAIL][77] ([Intel XE#2577]) +1 other test fail
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-5/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#2423] / [i915#2575]) +13 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#2291]) +4 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#309]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#2425])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#2244])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-5/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#2136]) +10 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [PASS][86] -> [SKIP][87] ([Intel XE#2373])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][88] -> [DMESG-WARN][89] ([Intel XE#3468]) +85 other tests dmesg-warn
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-bmg:          [PASS][90] -> [SKIP][91] ([Intel XE#2316]) +3 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip@blocking-wf_vblank:
>     - shard-lnl:          [PASS][92] -> [FAIL][93] ([Intel XE#3149] / [Intel XE#886])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-wf_vblank-interruptible:
>     - shard-lnl:          [PASS][94] -> [FAIL][95] ([Intel XE#886]) +2 other tests fail
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-8/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#455]) +7 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#651]) +1 other test skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#651]) +1 other test skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
>     - shard-dg2-set2:     [PASS][99] -> [SKIP][100] ([Intel XE#2136]) +40 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2312]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [FAIL][102] ([Intel XE#2333]) +2 other tests fail
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#656]) +2 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2311]) +4 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#653]) +3 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2313])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2934])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2927])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2486])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
>     - shard-dg2-set2:     [PASS][110] -> [INCOMPLETE][111] ([Intel XE#1727]) +1 other test incomplete
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][112] ([Intel XE#2566] / [Intel XE#3468])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][113] ([Intel XE#3468]) +12 other tests dmesg-warn
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
> 
>   * igt@kms_plane_multiple@tiling-x@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][114] ([Intel XE#1727])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_plane_multiple@tiling-x@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][115] ([Intel XE#361])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2763]) +2 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html
> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-lnl:          [PASS][118] -> [FAIL][119] ([Intel XE#718])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2392])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_rpm@cursor-dpms:
>     - shard-dg2-set2:     [PASS][121] -> [DMESG-WARN][122] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_pm_rpm@cursor-dpms.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_pm_rpm@cursor-dpms.html
>     - shard-bmg:          [PASS][123] -> [INCOMPLETE][124] ([Intel XE#1727] / [Intel XE#3468])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_pm_rpm@cursor-dpms.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@kms_pm_rpm@cursor-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-dg2-set2:     [PASS][125] -> [ABORT][126] ([Intel XE#3468]) +1 other test abort
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-bmg:          [PASS][127] -> [DMESG-WARN][128] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@universal-planes:
>     - shard-dg2-set2:     [PASS][129] -> [SKIP][130] ([Intel XE#2446]) +2 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_pm_rpm@universal-planes.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_pm_rpm@universal-planes.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#2893]) +1 other test skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#1489]) +2 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr2-cursor-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@kms_psr@psr2-cursor-blt.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#3414]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#3414]) +1 other test skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2413])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-none.html
>     - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#2413] / [Intel XE#374])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-8/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#374]) +2 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-8/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][140] ([Intel XE#3468]) +1 other test dmesg-warn
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][141] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-lnl:          [PASS][142] -> [FAIL][143] ([Intel XE#1522]) +1 other test fail
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-6/igt@kms_vrr@max-min.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-4/igt@kms_vrr@max-min.html
> 
>   * igt@xe_drm_fdinfo@utilization-others-full-load:
>     - shard-lnl:          [PASS][144] -> [FAIL][145] ([Intel XE#3512])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-5/igt@xe_drm_fdinfo@utilization-others-full-load.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-2/igt@xe_drm_fdinfo@utilization-others-full-load.html
> 
>   * igt@xe_eudebug@basic-read-event:
>     - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2905]) +2 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_eudebug@basic-read-event.html
> 
>   * igt@xe_eudebug@multigpu-basic-client-many:
>     - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#2905]) +2 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-4/igt@xe_eudebug@multigpu-basic-client-many.html
> 
>   * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#2905]) +1 other test skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][149] -> [TIMEOUT][150] ([Intel XE#1473] / [Intel XE#2472])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
>     - shard-dg2-set2:     [PASS][151] -> [TIMEOUT][152] ([Intel XE#1473])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#688]) +1 other test skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-7/igt@xe_evict@evict-small-cm.html
> 
>   * igt@xe_exec_balancer@once-parallel-userptr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#1130]) +19 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@xe_exec_balancer@once-parallel-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
>     - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2322]) +1 other test skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> 
>   * igt@xe_exec_basic@twice-userptr:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][156] ([Intel XE#1727])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@xe_exec_basic@twice-userptr.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-invalid-fault:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#288])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html
> 
>   * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
>     - shard-lnl:          [PASS][158] -> [DMESG-WARN][159] ([Intel XE#3371])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-3/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
>     - shard-bmg:          [PASS][160] -> [DMESG-FAIL][161] ([Intel XE#3371])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
>     - shard-bmg:          [PASS][162] -> [DMESG-WARN][163] ([Intel XE#3343] / [Intel XE#3468])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
>     - shard-dg2-set2:     [PASS][164] -> [DMESG-WARN][165] ([Intel XE#3467])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
>     - shard-bmg:          NOTRUN -> [DMESG-FAIL][166] ([Intel XE#3467])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][167] ([Intel XE#3467])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - shard-dg2-set2:     [PASS][168] -> [SKIP][169] ([Intel XE#2229]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-bmg:          [PASS][170] -> [SKIP][171] ([Intel XE#1192])
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_mmap@vram:
>     - shard-dg2-set2:     [PASS][172] -> [DMESG-WARN][173] ([Intel XE#1727]) +1 other test dmesg-warn
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_mmap@vram.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@xe_mmap@vram.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-bmg:          [PASS][174] -> [DMESG-WARN][175] ([Intel XE#3467]) +2 other tests dmesg-warn
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_module_load@many-reload.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@xe_module_load@many-reload.html
>     - shard-dg2-set2:     [PASS][176] -> [FAIL][177] ([Intel XE#3546])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_module_load@many-reload.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_oa@syncs-ufence-wait-cfg:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#3573])
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg.html
> 
>   * igt@xe_oa@unprivileged-single-ctx-counters:
>     - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#2248])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@xe_oa@unprivileged-single-ctx-counters.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-dg2-set2:     [PASS][180] -> [SKIP][181] ([Intel XE#1130]) +218 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-bmg:          [PASS][182] -> [DMESG-WARN][183] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_pm@s3-basic-exec.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-exec-after:
>     - shard-bmg:          [PASS][184] -> [DMESG-WARN][185] ([Intel XE#3468] / [Intel XE#569])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_pm@s3-exec-after.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_pm@s3-exec-after.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt1:
>     - shard-bmg:          [PASS][186] -> [DMESG-FAIL][187] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-fail
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze@gt1.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#3342])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-7/igt@xe_sriov_flr@flr-vf1-clear.html
>     - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#3342])
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_getstats:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#2423]) -> [PASS][191]
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@core_getstats.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@core_getstats.html
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-lnl:          [DMESG-WARN][192] -> [PASS][193]
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-3/igt@core_hotunplug@hotrebind-lateclose.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-2/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@fbdev@nullptr:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#2134]) -> [PASS][195] +1 other test pass
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@fbdev@nullptr.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@fbdev@nullptr.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-bmg:          [FAIL][196] ([Intel XE#827]) -> [PASS][197]
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-bmg:          [DMESG-WARN][198] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][199]
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-bmg:          [SKIP][200] ([Intel XE#2291]) -> [PASS][201] +4 other tests pass
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-bmg:          [SKIP][202] ([Intel XE#3009]) -> [PASS][203]
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_dp_aux_dev.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-bmg:          [SKIP][204] ([Intel XE#3070]) -> [PASS][205]
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-bmg:          [SKIP][206] ([Intel XE#2316]) -> [PASS][207] +6 other tests pass
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][208] ([Intel XE#3486]) -> [PASS][209]
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@busy-flip:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#2423] / [i915#2575]) -> [PASS][211] +90 other tests pass
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_flip@busy-flip.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_flip@busy-flip.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][212] ([Intel XE#886]) -> [PASS][213] +1 other test pass
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#2136]) -> [PASS][215] +26 other tests pass
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][217] +13 other tests pass
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
>     - shard-bmg:          [INCOMPLETE][218] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][219] +3 other tests pass
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
> 
>   * igt@kms_force_connector_basic@force-edid:
>     - shard-dg2-set2:     [DMESG-WARN][220] ([Intel XE#1727]) -> [PASS][221]
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_force_connector_basic@force-edid.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_force_connector_basic@force-edid.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#2351]) -> [PASS][223]
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
>     - shard-dg2-set2:     [INCOMPLETE][224] ([Intel XE#1727]) -> [PASS][225]
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256:
>     - shard-bmg:          [DMESG-FAIL][226] -> [PASS][227]
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
>     - shard-bmg:          [DMESG-FAIL][228] ([Intel XE#3468]) -> [PASS][229] +12 other tests pass
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-bmg:          [SKIP][230] ([Intel XE#2571]) -> [PASS][231]
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [FAIL][232] ([Intel XE#1430]) -> [PASS][233]
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@legacy-planes:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#2446]) -> [PASS][235]
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pm_rpm@legacy-planes.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_pm_rpm@legacy-planes.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms@plane-59:
>     - shard-lnl:          [DMESG-WARN][236] ([Intel XE#3184]) -> [PASS][237] +1 other test pass
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-bmg:          [DMESG-WARN][238] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][239]
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_sequence@get-busy:
>     - shard-bmg:          [DMESG-WARN][240] ([Intel XE#3468]) -> [PASS][241] +38 other tests pass
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_sequence@get-busy.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_sequence@get-busy.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-3:
>     - shard-bmg:          [FAIL][242] ([Intel XE#3559]) -> [PASS][243] +4 other tests pass
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-bmg:          [SKIP][244] ([Intel XE#1435]) -> [PASS][245]
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-bmg:          [INCOMPLETE][246] ([Intel XE#1727]) -> [PASS][247]
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_exec_balancer@twice-virtual-basic:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#1130]) -> [PASS][249] +160 other tests pass
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@xe_exec_balancer@twice-virtual-basic.html
> 
>   * igt@xe_exercise_blt@fast-copy:
>     - shard-bmg:          [INCOMPLETE][250] -> [PASS][251]
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_exercise_blt@fast-copy.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@xe_exercise_blt@fast-copy.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
>     - shard-bmg:          [DMESG-WARN][252] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][253] +2 other tests pass
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
>     - shard-bmg:          [DMESG-WARN][254] ([Intel XE#3521]) -> [PASS][255]
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [TIMEOUT][256] ([Intel XE#2961] / [Intel XE#3191]) -> [PASS][257] +1 other test pass
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_module_load@reload-no-display:
>     - shard-bmg:          [DMESG-WARN][258] ([Intel XE#3467]) -> [PASS][259]
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_module_load@reload-no-display.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_module_load@reload-no-display.html
> 
>   * igt@xe_oa@oa-regs-whitelisted:
>     - shard-lnl:          [FAIL][260] ([Intel XE#2514]) -> [PASS][261]
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html
>     - shard-bmg:          [FAIL][262] ([Intel XE#2514]) -> [PASS][263]
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-bmg:          [DMESG-WARN][264] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [PASS][265]
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_pm@s3-vm-bind-prefetch.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-lnl:          [ABORT][266] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][267]
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-2/igt@xe_pm@s4-basic.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-lnl-4/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-dg2-set2:     [DMESG-WARN][268] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [PASS][269]
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_pm@s4-mocs.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@xe_pm@s4-mocs.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-dg2-set2:     [DMESG-WARN][270] ([Intel XE#3468]) -> [SKIP][271] ([Intel XE#1885])
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@core_hotunplug@hotrebind-lateclose.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@kms_addfb_basic@bad-pitch-256:
>     - shard-dg2-set2:     [SKIP][272] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][273] ([Intel XE#1727])
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_addfb_basic@bad-pitch-256.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_addfb_basic@bad-pitch-256.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     [SKIP][274] ([Intel XE#2423] / [i915#2575]) -> [SKIP][275] ([Intel XE#873])
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][276] ([Intel XE#316]) -> [SKIP][277] ([Intel XE#2136] / [Intel XE#2351])
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][278] ([Intel XE#2136]) -> [SKIP][279] ([Intel XE#316]) +3 other tests skip
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][280] ([Intel XE#316]) -> [SKIP][281] ([Intel XE#2136]) +4 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][282] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][283] ([Intel XE#316]) +3 other tests skip
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][284] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][285] ([Intel XE#1124]) +7 other tests skip
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][286] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][287] ([Intel XE#619])
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][288] ([Intel XE#607]) -> [SKIP][289] ([Intel XE#2136] / [Intel XE#2351])
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][290] ([Intel XE#1124]) -> [SKIP][291] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][292] ([Intel XE#619]) -> [SKIP][293] ([Intel XE#2136] / [Intel XE#2351])
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][294] ([Intel XE#607]) -> [SKIP][295] ([Intel XE#2136])
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][296] ([Intel XE#2136]) -> [SKIP][297] ([Intel XE#1124]) +2 other tests skip
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][298] ([Intel XE#1124]) -> [SKIP][299] ([Intel XE#2136]) +9 other tests skip
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][300] ([Intel XE#2423] / [i915#2575]) -> [SKIP][301] ([Intel XE#367]) +2 other tests skip
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][302] ([Intel XE#2191]) -> [SKIP][303] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][304] ([Intel XE#2423] / [i915#2575]) -> [SKIP][305] ([Intel XE#2191]) +2 other tests skip
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][306] ([Intel XE#367]) -> [SKIP][307] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][308] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][309] ([Intel XE#2136]) +12 other tests skip
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][310] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][311] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][312] ([Intel XE#2136]) -> [SKIP][313] ([Intel XE#2907]) +1 other test skip
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][314] ([Intel XE#3442]) -> [SKIP][315] ([Intel XE#2136])
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][316] ([Intel XE#2136]) -> [SKIP][317] ([Intel XE#3442])
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [FAIL][318] ([Intel XE#616]) -> [SKIP][319] ([Intel XE#2136])
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
>     - shard-dg2-set2:     [SKIP][320] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][321] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][322] ([Intel XE#2907]) -> [SKIP][323] ([Intel XE#2136]) +1 other test skip
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][324] ([Intel XE#2136]) -> [SKIP][325] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     [SKIP][326] ([Intel XE#2423] / [i915#2575]) -> [SKIP][327] ([Intel XE#306]) +1 other test skip
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     [SKIP][328] ([Intel XE#306]) -> [SKIP][329] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_chamelium_color@degamma.html
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-dg2-set2:     [SKIP][330] ([Intel XE#373]) -> [SKIP][331] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - shard-dg2-set2:     [SKIP][332] ([Intel XE#2423] / [i915#2575]) -> [SKIP][333] ([Intel XE#373]) +6 other tests skip
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-fast.html
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          [FAIL][334] ([Intel XE#1178]) -> [SKIP][335] ([Intel XE#2341])
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_content_protection@atomic.html
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_content_protection@atomic.html
>     - shard-dg2-set2:     [FAIL][336] ([Intel XE#1178]) -> [SKIP][337] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_content_protection@atomic.html
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][338] ([Intel XE#2423] / [i915#2575]) -> [SKIP][339] ([Intel XE#307]) +1 other test skip
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2-set2:     [SKIP][340] ([Intel XE#2423] / [i915#2575]) -> [FAIL][341] ([Intel XE#1178])
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_content_protection@legacy.html
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          [SKIP][342] ([Intel XE#2341]) -> [FAIL][343] ([Intel XE#1178])
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_content_protection@srm.html
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          [SKIP][344] ([Intel XE#2341]) -> [FAIL][345] ([Intel XE#1188])
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_content_protection@uevent.html
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     [SKIP][346] ([Intel XE#2423] / [i915#2575]) -> [SKIP][347] ([Intel XE#308]) +1 other test skip
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg2-set2:     [SKIP][348] ([Intel XE#308]) -> [SKIP][349] ([Intel XE#2423] / [i915#2575])
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg2-set2:     [SKIP][350] ([Intel XE#323]) -> [SKIP][351] ([Intel XE#2423] / [i915#2575])
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-bmg:          [DMESG-WARN][352] -> [SKIP][353] ([Intel XE#2291])
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][354] ([Intel XE#2423] / [i915#2575]) -> [SKIP][355] ([Intel XE#323]) +2 other tests skip
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][356] ([Intel XE#776]) -> [SKIP][357] ([Intel XE#2136])
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][358] ([Intel XE#701]) -> [SKIP][359] ([Intel XE#2423] / [i915#2575])
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_feature_discovery@chamelium.html
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][360] ([Intel XE#1135]) -> [SKIP][361] ([Intel XE#2423] / [i915#2575])
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_feature_discovery@psr1.html
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][362] ([Intel XE#2423] / [i915#2575]) -> [SKIP][363] ([Intel XE#1135])
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_feature_discovery@psr2.html
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][364] ([Intel XE#3321] / [Intel XE#3487]) -> [DMESG-WARN][365] ([Intel XE#3468]) +1 other test dmesg-warn
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][366] ([Intel XE#2882]) -> [DMESG-WARN][367] ([Intel XE#3468]) +2 other tests dmesg-warn
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-dg2-set2:     [DMESG-WARN][368] ([Intel XE#1727]) -> [SKIP][369] ([Intel XE#2136])
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
>     - shard-dg2-set2:     [INCOMPLETE][370] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][371] ([Intel XE#2136] / [Intel XE#2351])
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>     - shard-dg2-set2:     [SKIP][372] ([Intel XE#2136]) -> [SKIP][373] ([Intel XE#455]) +5 other tests skip
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>     - shard-dg2-set2:     [SKIP][374] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][375] ([Intel XE#455]) +2 other tests skip
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][376] ([Intel XE#455]) -> [SKIP][377] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][378] ([Intel XE#455]) -> [SKIP][379] ([Intel XE#2136]) +5 other tests skip
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-dg2-set2:     [SKIP][380] ([Intel XE#2423] / [i915#2575]) -> [SKIP][381] ([i915#5274])
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][382] ([Intel XE#2311]) -> [SKIP][383] ([Intel XE#2312]) +18 other tests skip
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][384] ([Intel XE#2312]) -> [SKIP][385] ([Intel XE#2311]) +15 other tests skip
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][386] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][387] ([Intel XE#651]) +11 other tests skip
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][388] ([Intel XE#2312]) -> [FAIL][389] ([Intel XE#2333]) +7 other tests fail
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [DMESG-FAIL][390] ([Intel XE#3468]) -> [SKIP][391] ([Intel XE#2312])
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [FAIL][392] ([Intel XE#2333]) -> [DMESG-FAIL][393] ([Intel XE#3468]) +5 other tests dmesg-fail
>    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [DMESG-FAIL][394] ([Intel XE#3468]) -> [FAIL][395] ([Intel XE#2333]) +4 other tests fail
>    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-bmg:          [FAIL][396] ([Intel XE#2333]) -> [SKIP][397] ([Intel XE#2312]) +8 other tests skip
>    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][398] ([Intel XE#2136]) -> [SKIP][399] ([Intel XE#651]) +17 other tests skip
>    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
>    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-dg2-set2:     [SKIP][400] ([Intel XE#651]) -> [SKIP][401] ([Intel XE#2136]) +25 other tests skip
>    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
>    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][402] ([Intel XE#651]) -> [SKIP][403] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
>    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
>    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][404] ([Intel XE#653]) -> [SKIP][405] ([Intel XE#2136]) +30 other tests skip
>    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>     - shard-dg2-set2:     [SKIP][406] ([Intel XE#653]) -> [SKIP][407] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
>    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>    [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-bmg:          [FAIL][408] ([Intel XE#2333]) -> [INCOMPLETE][409] ([Intel XE#1727] / [Intel XE#2050] / [Intel XE#3468])
>    [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
>    [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:
>     - shard-bmg:          [FAIL][410] ([Intel XE#2333]) -> [INCOMPLETE][411] ([Intel XE#1727] / [Intel XE#3468])
>    [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html
>    [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     [SKIP][412] ([Intel XE#2136]) -> [SKIP][413] ([Intel XE#1158])
>    [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][414] ([Intel XE#2312]) -> [SKIP][415] ([Intel XE#2313]) +14 other tests skip
>    [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][416] ([Intel XE#2136]) -> [SKIP][417] ([Intel XE#653]) +18 other tests skip
>    [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
>    [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][418] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][419] ([Intel XE#653]) +15 other tests skip
>    [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][420] ([Intel XE#2313]) -> [SKIP][421] ([Intel XE#2312]) +20 other tests skip
>    [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>    [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][422] ([Intel XE#2423] / [i915#2575]) -> [SKIP][423] ([Intel XE#605])
>    [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
>    [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-dg2-set2:     [SKIP][424] ([Intel XE#2423] / [i915#2575]) -> [SKIP][425] ([Intel XE#455]) +8 other tests skip
>    [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_hdr@brightness-with-hdr.html
>    [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_hdr@brightness-with-hdr.html
>     - shard-bmg:          [SKIP][426] ([Intel XE#3544]) -> [SKIP][427] ([Intel XE#3374] / [Intel XE#3544])
>    [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
>    [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-dg2-set2:     [SKIP][428] ([Intel XE#346]) -> [SKIP][429] ([Intel XE#2136]) +1 other test skip
>    [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html
>    [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-dg2-set2:     [SKIP][430] ([Intel XE#2136]) -> [SKIP][431] ([Intel XE#2925]) +1 other test skip
>    [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html
>    [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_plane_cursor@overlay:
>     - shard-dg2-set2:     [FAIL][432] ([Intel XE#616]) -> [SKIP][433] ([Intel XE#2423] / [i915#2575])
>    [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_plane_cursor@overlay.html
>    [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_plane_cursor@overlay.html
> 
>   * igt@kms_plane_multiple@tiling-x:
>     - shard-dg2-set2:     [SKIP][434] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][435] ([Intel XE#1727])
>    [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_plane_multiple@tiling-x.html
>    [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_plane_multiple@tiling-x.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2-set2:     [SKIP][436] ([Intel XE#2423] / [i915#2575]) -> [FAIL][437] ([Intel XE#361])
>    [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html
>    [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][438] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][439] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
>    [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
>    [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-dg2-set2:     [SKIP][440] ([Intel XE#870]) -> [SKIP][441] ([Intel XE#2136])
>    [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html
>    [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     [SKIP][442] ([Intel XE#2136]) -> [SKIP][443] ([Intel XE#870])
>    [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html
>    [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     [SKIP][444] ([Intel XE#908]) -> [SKIP][445] ([Intel XE#2136] / [Intel XE#2351])
>    [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html
>    [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html
>     - shard-bmg:          [FAIL][446] ([Intel XE#1430]) -> [DMESG-FAIL][447] ([Intel XE#3468])
>    [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html
>    [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][448] ([Intel XE#1129]) -> [SKIP][449] ([Intel XE#2136] / [Intel XE#2351])
>    [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html
>    [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-dg2-set2:     [SKIP][450] ([Intel XE#2446]) -> [DMESG-WARN][451] ([Intel XE#1727] / [Intel XE#3468])
>    [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-dg2-set2:     [ABORT][452] ([Intel XE#3468]) -> [SKIP][453] ([Intel XE#2446])
>    [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html
>    [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][454] ([Intel XE#2136]) -> [SKIP][455] ([Intel XE#1489]) +7 other tests skip
>    [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
>    [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][456] ([Intel XE#1489]) -> [SKIP][457] ([Intel XE#2136]) +7 other tests skip
>    [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
>    [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     [SKIP][458] ([Intel XE#2136]) -> [SKIP][459] ([Intel XE#1122]) +2 other tests skip
>    [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html
>    [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     [SKIP][460] ([Intel XE#1122]) -> [SKIP][461] ([Intel XE#2136])
>    [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html
>    [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr-sprite-render:
>     - shard-dg2-set2:     [SKIP][462] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][463] ([Intel XE#2136]) +16 other tests skip
>    [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html
>    [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][464] ([Intel XE#2136]) -> [SKIP][465] ([Intel XE#2850] / [Intel XE#929]) +15 other tests skip
>    [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-dg2-set2:     [SKIP][466] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][467] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
>    [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_psr@pr-primary-page-flip.html
>    [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_psr@pr-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][468] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][469] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
>    [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_psr@pr-sprite-plane-onoff.html
>    [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_psr@pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][470] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][471] ([Intel XE#2351]) +1 other test skip
>    [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_psr@psr-sprite-plane-onoff.html
>    [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-dg2-set2:     [SKIP][472] ([Intel XE#3414]) -> [SKIP][473] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
>    [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html
>    [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][474] ([Intel XE#1127]) -> [SKIP][475] ([Intel XE#2423] / [i915#2575])
>    [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][476] ([Intel XE#2423] / [i915#2575]) -> [SKIP][477] ([Intel XE#3414]) +4 other tests skip
>    [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][478] ([Intel XE#2423] / [i915#2575]) -> [SKIP][479] ([Intel XE#1127])
>    [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][480] ([Intel XE#2426]) -> [FAIL][481] ([Intel XE#1729])
>    [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
>    [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][482] ([Intel XE#2423] / [i915#2575]) -> [SKIP][483] ([Intel XE#362])
>    [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     [SKIP][484] ([Intel XE#2423] / [i915#2575]) -> [SKIP][485] ([Intel XE#330])
>    [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
>    [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm:
>     - shard-dg2-set2:     [DMESG-WARN][486] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][487] ([Intel XE#2423] / [i915#2575])
>    [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-rpm.html
>    [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-rpm.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-dg2-set2:     [SKIP][488] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][489] ([Intel XE#1727] / [Intel XE#3468])
>    [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html
>    [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     [SKIP][490] ([Intel XE#455]) -> [SKIP][491] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
>    [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_vrr@flip-dpms.html
>    [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][492] ([Intel XE#756]) -> [SKIP][493] ([Intel XE#2423] / [i915#2575])
>    [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>    [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-dg2-set2:     [SKIP][494] ([Intel XE#2423] / [i915#2575]) -> [SKIP][495] ([Intel XE#756])
>    [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html
>    [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][496] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][497] ([Intel XE#1130])
>    [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html
>    [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     [SKIP][498] ([Intel XE#1123]) -> [SKIP][499] ([Intel XE#1130])
>    [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html
>    [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][500] ([Intel XE#1130]) -> [SKIP][501] ([Intel XE#1123])
>    [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>    [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][502] ([Intel XE#1130]) -> [SKIP][503] ([Intel XE#1126])
>    [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
>    [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_eudebug@basic-close:
>     - shard-dg2-set2:     [SKIP][504] ([Intel XE#2905]) -> [SKIP][505] ([Intel XE#1130]) +12 other tests skip
>    [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_eudebug@basic-close.html
>    [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@xe_eudebug@basic-close.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-bmg:          [FAIL][506] ([Intel XE#2364]) -> [DMESG-FAIL][507] ([Intel XE#3468])
>    [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>     - shard-dg2-set2:     [FAIL][508] ([Intel XE#1600]) -> [SKIP][509] ([Intel XE#1130])
>    [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     [SKIP][510] ([Intel XE#1130]) -> [TIMEOUT][511] ([Intel XE#1473])
>    [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>    [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>     - shard-dg2-set2:     [SKIP][512] ([Intel XE#288]) -> [SKIP][513] ([Intel XE#1130]) +33 other tests skip
>    [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
>    [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][514] ([Intel XE#1130]) -> [SKIP][515] ([Intel XE#288]) +30 other tests skip
>    [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>    [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>     - shard-dg2-set2:     [SKIP][516] ([Intel XE#2360]) -> [SKIP][517] ([Intel XE#1130])
>    [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
>    [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
> 
>   * igt@xe_exec_sip_eudebug@breakpoint-writesip:
>     - shard-dg2-set2:     [SKIP][518] ([Intel XE#1130]) -> [SKIP][519] ([Intel XE#2905]) +12 other tests skip
>    [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
>    [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
> 
>   * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
>     - shard-dg2-set2:     [SKIP][520] ([Intel XE#1130]) -> [DMESG-FAIL][521] ([Intel XE#3371])
>    [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
>    [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
>     - shard-dg2-set2:     [DMESG-WARN][522] ([Intel XE#1727] / [Intel XE#3343]) -> [DMESG-WARN][523] ([Intel XE#3343])
>    [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
>    [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
>     - shard-bmg:          [DMESG-WARN][524] ([Intel XE#3343]) -> [DMESG-WARN][525] ([Intel XE#3343] / [Intel XE#3468])
>    [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>    [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
>     - shard-dg2-set2:     [DMESG-WARN][526] ([Intel XE#3467]) -> [SKIP][527] ([Intel XE#1130]) +1 other test skip
>    [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
>    [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
>     - shard-bmg:          [FAIL][528] ([Intel XE#3499]) -> [DMESG-FAIL][529] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-fail
>    [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
>    [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
>     - shard-bmg:          [DMESG-WARN][530] ([Intel XE#3467]) -> [DMESG-WARN][531] ([Intel XE#3467] / [Intel XE#3468])
>    [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
>    [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
>     - shard-dg2-set2:     [SKIP][532] ([Intel XE#1130]) -> [DMESG-WARN][533] ([Intel XE#3467]) +2 other tests dmesg-warn
>    [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
>    [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][534] ([Intel XE#1130]) -> [SKIP][535] ([Intel XE#255])
>    [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_huc_copy@huc_copy.html
>    [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-463/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-bmg:          [SKIP][536] ([Intel XE#1192]) -> [SKIP][537] ([Intel XE#2833])
>    [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
>    [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][538] ([Intel XE#512]) -> [SKIP][539] ([Intel XE#1130])
>    [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_mmap@small-bar.html
>    [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_module_load@reload-no-display:
>     - shard-dg2-set2:     [DMESG-WARN][540] ([Intel XE#3467]) -> [FAIL][541] ([Intel XE#3546])
>    [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_module_load@reload-no-display.html
>    [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@xe_module_load@reload-no-display.html
> 
>   * igt@xe_oa@invalid-create-userspace-config:
>     - shard-dg2-set2:     [SKIP][542] ([Intel XE#1130]) -> [SKIP][543] ([Intel XE#3573]) +10 other tests skip
>    [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_oa@invalid-create-userspace-config.html
>    [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@xe_oa@invalid-create-userspace-config.html
> 
>   * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>     - shard-dg2-set2:     [SKIP][544] ([Intel XE#3573]) -> [SKIP][545] ([Intel XE#1130]) +11 other tests skip
>    [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
>    [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][546] ([Intel XE#1337]) -> [SKIP][547] ([Intel XE#1130])
>    [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html
>    [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-dg2-set2:     [SKIP][548] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][549] ([Intel XE#1130])
>    [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_pm@d3cold-basic.html
>    [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-dg2-set2:     [SKIP][550] ([Intel XE#1130]) -> [SKIP][551] ([Intel XE#2284])
>    [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
>    [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pm@d3hot-mmap-vram:
>     - shard-dg2-set2:     [DMESG-WARN][552] ([Intel XE#3468]) -> [SKIP][553] ([Intel XE#1130])
>    [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_pm@d3hot-mmap-vram.html
>    [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@xe_pm@d3hot-mmap-vram.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [SKIP][554] ([Intel XE#1130]) -> [DMESG-WARN][555] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
>    [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
>    [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-dg2-set2:     [DMESG-WARN][556] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][557] ([Intel XE#1130])
>    [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-436/igt@xe_pm@s3-mocs.html
>    [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-bmg:          [DMESG-WARN][558] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [DMESG-WARN][559] ([Intel XE#3468] / [Intel XE#569])
>    [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@xe_pm@s3-vm-bind-unbind-all.html
>    [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-dg2-set2:     [SKIP][560] ([Intel XE#1130]) -> [DMESG-WARN][561] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
>    [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_pm@s4-basic.html
>    [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-435/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_query@multigpu-query-oa-units:
>     - shard-dg2-set2:     [SKIP][562] ([Intel XE#1130]) -> [SKIP][563] ([Intel XE#944]) +3 other tests skip
>    [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html
>    [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-dg2-set2:     [SKIP][564] ([Intel XE#944]) -> [SKIP][565] ([Intel XE#1130]) +2 other tests skip
>    [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_query@multigpu-query-topology.html
>    [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-dg2-set2:     [SKIP][566] ([Intel XE#1130]) -> [SKIP][567] ([Intel XE#3342])
>    [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html
>    [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   * igt@xe_tlb@basic-tlb:
>     - shard-dg2-set2:     [FAIL][568] ([Intel XE#2922]) -> [SKIP][569] ([Intel XE#1130])
>    [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-463/igt@xe_tlb@basic-tlb.html
>    [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@xe_tlb@basic-tlb.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-dg2-set2:     [DMESG-WARN][570] ([Intel XE#2919]) -> [SKIP][571] ([Intel XE#1130])
>    [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-433/igt@xe_wedged@basic-wedged.html
>    [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-434/igt@xe_wedged@basic-wedged.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-bmg:          [ABORT][572] ([Intel XE#3421]) -> [ABORT][573] ([Intel XE#3421] / [Intel XE#3521])
>    [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html
>    [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   * igt@xe_wedged@wedged-mode-toggle:
>     - shard-dg2-set2:     [SKIP][574] ([Intel XE#1130]) -> [ABORT][575] ([Intel XE#3075] / [Intel XE#3084])
>    [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
>    [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html
> 
>   
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
>   [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
>   [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
>   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>   [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
>   [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
>   [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
>   [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162
>   [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
>   [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
>   [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
>   [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
>   [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
>   [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
>   [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
>   [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
>   [Intel XE#3512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3512
>   [Intel XE#3515]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515
>   [Intel XE#3521]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
>   [Intel XE#3559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3559
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8121 -> IGTPW_12170
>   * Linux: xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380 -> xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199
> 
>   IGTPW_12170: 12170
>   IGT_8121: 8121
>   xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380: e46649e7764a9f6868ccbcba7b8b23b413303380
>   xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199: bb17c42521f57b592e9ad49daca1f9f9045d3199
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12170/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
