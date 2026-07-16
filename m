Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD32C44515
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 18:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90ECA10E10A;
	Thu, 16 Jul 2026 18:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWySjDzQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E61010E10A
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 18:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784227710; x=1815763710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hWnkqBa5VopvDinU0Xh14p3PAnUq++Ckyap713drOqU=;
 b=ZWySjDzQEPmfXexmdY4y2jh3Mmvhwa96oOwHQwxry8imutNY4imbnj+N
 iuDuCjQRg5ecMsyLsXP3JSW/WC4B/s0UYLskfS0I7uszEpS2rhJvdz6Tr
 SxdknUwVWbEFSAW6IyFcyVTBjBUvG+39ez8r5m6FabtI8TGsGAZtRFgWL
 en1+f7pFT+672O6NyDPnwfZny0KlYgS7ISElW7RZmIeD1QerGE1hpe/OY
 w1o4V7v2u9umLU20F1GqhaMjT524CsKZ3U42u6krpn+ifCuSbf/75mqCZ
 HwhiIVbhQBRfqlhuSaPEY0DjhZmCfSfuJaL0eSxoadC+G5FADnTLs1xaK A==;
X-CSE-ConnectionGUID: Hih9X11xSOmVr9C6o1tqQw==
X-CSE-MsgGUID: OaTnyFRLRo+qjshKpmaPRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="95552432"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="95552432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 11:48:29 -0700
X-CSE-ConnectionGUID: cq352wy/S5WQjBxYJCwSVw==
X-CSE-MsgGUID: 38PaZkbmRmOVK82sgoc94w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="253934951"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 11:48:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 11:48:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 11:48:29 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 11:48:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFkngFAm5xZXJoSPM4oqlrfqvWk+dnnQbqLerSzca4haleKm00rjimOAKDusDixYJoVvJ72EkpZLxzoYBKKW70IOXnv2gIyRYMyXexGaJ0Zq12a285D8Ms/k8foFSrDEIPloB6EsQKMTOVLXYLPMKHHuhjJxB18KjeECugAZNOluqzDwhGPZ5SUTBTDbsUkPshzjMs2GrwProcu8Q9GRHZwN+6XpVG0YUmUtk1x3Ecx5l1REkFKNrsR51ksBVeRO+lbDYyxeeLj6BaSj9eemVsNjm2GHTFZQO6gGaW9CYxv5ogtMxsePRBEX/XmzdwSJ7rnyO0ZNmuiiZc81xCAAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sn+AI8s6Gy/2x7EEJkhusOX++0gLqyC3rtWMCA3ekT0=;
 b=oAWI5F3iJQgh0mSzoJAUD9lZcqbLZ38Td09PWyH2mbPEtHEz3QUKUNz7Ep9NBTCOcKNZJ7GOYdmPxs8YwaEWU4wqxuMP/ksys3ALXmnhMJcvoIT7SHebu4ZAbphdP1uUrAsWkGlZTimS4tpuoDOl5ac5CzRNV/tBXht7P3biCuSWkcIuGe0I9X3/puRrsKk3PUj+Ai7a06i5OK8NuUX+dc7nV6/e5taMRMsrkVOx4lZnNVsmzARoKuAOzfXNzCGdDwfHVygr/SMO0efo9oghqAPPXFkcJqnbBzJecxR+M45KBPpAdF3X6WqKYdWHId7gDM7uPB7fQrkZIVBc2j5wgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH7PR11MB7052.namprd11.prod.outlook.com (2603:10b6:510:20f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 18:48:24 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 18:48:23 +0000
Date: Thu, 16 Jul 2026 11:48:20 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t, v2] tests/intel/xe_exec_multi_queue: Check PXP is
 rejected on multi-queue
Message-ID: <alkndK_XLh5TKlem@nvishwa1-desk>
References: <a5d7b699ffcbd7b590f824f67a7ca162eb59bf37.1783969453.git.jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <a5d7b699ffcbd7b590f824f67a7ca162eb59bf37.1783969453.git.jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0220.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::15) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH7PR11MB7052:EE_
X-MS-Office365-Filtering-Correlation-Id: d1622487-d1c0-4a9b-d94e-08dee36ad072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 7Lk+iENwe5jmIh3yB/0A9NOIyDkn/e6pJhRORtfe6ogJIMK1aw/16RVUHd0A9YMPSoc5EK/h7E1xg4EZ/baiH+t2/1Puh48o558cWVDfJdxXiv5QeORfhP2yXE286HlE1/5WAxgHMMBgwNLHZg0uufRUt9GqfU2PFiInajJ/sc67yxX0KBaa2zEKnBmt65Kr+IV3abGBB7f5TPoXxYCVz57R5NnkmN6QbmKY7rfWvKda8+5x58Ah9em/4KTs7kky+ZCArOysQQEEzNAnx25QK+4AYJOnVaSztJSc/jbg5hfhSE9ysNqaDuXv4VCC20jM1XXY/lH2YmS2rvWMXqHdbQ/4zWPHAMLIQ2G1bq01IffzJQTNpVbI1na0N+CI2RyaKih1JlhpXafBJycz81/0uZRXS9LPrWAjzlrhRZMNVrr6FkVABINM8IDdvoXMQhvTqhnj2EsKl5+v3HUWAFyvW7s8gECtgLA3U8trTUB+H+eMKHT1ziJtzr3OlNI+3R/hSY5HqPMZrMDtTLC8Zs6osGvN3bAaBgyJqm9zufhelBxFeSUsBIE3JkYnxs8H/+rh5fT/lOPit6T5YKIdQp6Fy+3Zo0ZkWiUcOVdbiS7wcjJzJVzkiEn5PhZsfHG2620H1y8IkudtMeT+uXy3LoIlmp+7u7pmhZ9D6F7k7+G2G7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MjXSI843ycIiCq6z0UxDr/TAtnTlIz+LlCGitikWtkbIVEb7M0BdJOB7xwX0?=
 =?us-ascii?Q?i27FU+CpcXu1LAOj3Ww4aG4pzmu07FXkS/1FNkjCkLdeTkJy/LTfKdjGvH8g?=
 =?us-ascii?Q?mj1YqR10TbgHbHfuoZ8sXcLMY6MW4/boDNv8LnKLeeJVzV1MpqFHo6KmYOK/?=
 =?us-ascii?Q?7s2AdkdPM2g1EDICXSazbhB150SRBkXlrQMqONSlhyNOxJeqclUacP++vKtd?=
 =?us-ascii?Q?1AG462qgu/aYfjdqOKm6btGvor8NunFJokfKDNXcKpXwFa/W5X5TqIGAVNgY?=
 =?us-ascii?Q?4lRm0xAY446aPMNCMKkCmDp0FN8rXAnDyi5TFZUi77YBUcfk01PjP9aAi8bY?=
 =?us-ascii?Q?VSHCMUEOaifN1pUDAytpXvX6FMS46MCKP7WAVmr78+Lf5PnXwWMFN3FxoT8F?=
 =?us-ascii?Q?F2ZutK3VXZlO3y3EWDBrLTsl8/QXiiTj9UQu9j9Tw9MMdIdh150WiCDeGja2?=
 =?us-ascii?Q?FolpUArVZBDbX/4lmdfo3XJkjpr74F1NWB9uKLXfzBpb8EdCSopM4QKUHe7n?=
 =?us-ascii?Q?mvR8vHkxrfDXdzEyrGv6+ChjRNnW8GsI+ELNTZaGkx2TEbbOrZcZOMsjiuQJ?=
 =?us-ascii?Q?qr5PiVUqD9oy+oqySg8qyjnFafmaKqEMXEAktiPGkwYEFo0fEiFkdbTbGeou?=
 =?us-ascii?Q?6PAmzEsP8liWs3/JRwYgjJcRr00h/wPcQWMBPMwo/C5d/a7LEpUqB+rIC/NR?=
 =?us-ascii?Q?dvdDp/tylOQvjw/TsaSQrffmZaXi9qVEkW4e0g7LssfH5onRdcPl7EMYzhXy?=
 =?us-ascii?Q?uFCpDggXx6KdyVf+FGYa4WZdz7TpqX7iJPYBi/Q3qfWqu60cmkGn+tdOkGlf?=
 =?us-ascii?Q?5pVj6ydD5xw1L9vhsQz1NzunQYY9fEvrL3S1XsQREzyK+9TuV6jy4YRZvzgC?=
 =?us-ascii?Q?NLoKNtTgZa+48gJ5Q1CvXYJ3ujxn9x5zFmAhggcwLBmKKldDmM2pwQ8mzc36?=
 =?us-ascii?Q?/sQijhQNYLSVkHuif02TnmhBfpdO3bWNF38x+k8iSJtQ66cBVrxduTXR3Obe?=
 =?us-ascii?Q?k9hIcZT5p4ENXFa2xdnRqeCRPDNMKCxHEcifbHPbhxlDNe6zEueo1Suox0bU?=
 =?us-ascii?Q?XSTOIxnlQhNlLXBo9PgGsuVb2B5Xl2dSVshJuBOiN3Q1PLF9PL0+gQaIa7Oh?=
 =?us-ascii?Q?SenIP3uu/FyuU6lAeVXsLvzh2Pl+zF0uGImq51V2lmKjAgRfwmI9PJxG/YYq?=
 =?us-ascii?Q?ABfoBO8FvcBj5O/xkRJ8N5Hp1AMi2+FoykZADeSjlFhxUU1QxrW5qQzHH/fs?=
 =?us-ascii?Q?Jlt1WG0KRW1YqUWnpcIM/+cBVAme5CJpGsNGOLpqLQHCRtagszmE0lwQHDww?=
 =?us-ascii?Q?tG8WB2ANcq92OyrVtmGtzNj0LFhEnlyfyrBLiK/nUcWA2G6WSoJ3DoBcBkyq?=
 =?us-ascii?Q?y00BgMa+KYXCfDm4yQV6FcRyoJFyckp258nup2svkkhIkEh3TyfNh6V+rH2+?=
 =?us-ascii?Q?XDUzZNgVkDPRB4PhiWAhvx8hLKFYWVvqnIvRdHv/owe7waMZ6/mO2q68Uc0c?=
 =?us-ascii?Q?VXvemr1T68SE6rWYYYtLsXeeBQBaMHJdxlSYTRvPrUzO7Ud+BZ4ZcdaXG0Ai?=
 =?us-ascii?Q?uyIHwKLNo1aS3gUqlUj3NvI7MJTUwExd4hZrbzScYEPmi1YdephrCkPzQPg2?=
 =?us-ascii?Q?H4E0C9YoE00Vqh9NvT47ebjM8OdbLAPbbFq6PnuEY43bGB1GxqbJZkWpgCNy?=
 =?us-ascii?Q?k46P2YPFY9MzTnkOCbMljp42HKV9rpe69ymfCTw9O+5ng/p8DOb6Y5QD4RiH?=
 =?us-ascii?Q?JGnkgVgvz3dra66SXv7ZjPAqbQZB+B+l8zoaxS+mqlNNxKVej0RG?=
X-Exchange-RoutingPolicyChecked: l8k0ERaIP6UXMHEpa+auLVbBf2yF7luwYiw8j9smMn+wGePngz0icP8NIB1gzhFLv1yZZ3Rzitu+AhhnI9OJPLLWSF2xNvRixiYNPG/YGpPmhGRqkNrfChacCSPuedVx0WJrY37wPaZv2rKrPBLjCy2jl9n7JErjdtRXW6QXBgg+pFfEPHQYVhf7v95iHOXEXu3bCdt/KYSZe3Ix3yjV6waHfxAOuvYBqQBneLDfkV7JViTluhEbuOujSXFpHGHZqrS6yXpC9x7+ePCmTb108EkdFTbP8yHnZjxX1LIy5fphbFfukGpQ/C82gaoCqXcgTaTaS6oMoTARgt7kdZWMGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d1622487-d1c0-4a9b-d94e-08dee36ad072
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 18:48:23.8568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nU1SBhaenlRCWEIcn3+IgU8fiwhHVPMoweRb5r/mgPQXn1WS3kZQdyay9sTgHPAGE9jx/RpXG5HGS4nQMrODvJt3tpvlxA5xq85S3FT2gbdqdMVmn6yIPeiey1pI3t4D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7052
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

On Tue, Jul 14, 2026 at 03:05:37AM +0800, Jagmeet Randhawa wrote:
>HWDRM is the only supported PXP type and is display related, so it
>cannot be combined with a multi-queue exec queue group. Extend the
>sanity subtest to create a multi-queue exec queue with the PXP HWDRM
>property chained and verify the kernel rejects the combination.
>
>When PXP is supported the combination must fail with -EINVAL; when
>PXP is unsupported the PXP extension fails first with -ENODEV.
>The expected error is selected based on xe_wait_for_pxp_init(),
>so the test passes on platforms with and without PXP.
>

Require 'v2: <changes done in v2>' tag.
I think it is fine for now.

>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>---
> tests/intel/xe_exec_multi_queue.c | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
>
>diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
>index 9b41f87c7..6aa1fd5e4 100644
>--- a/tests/intel/xe_exec_multi_queue.c
>+++ b/tests/intel/xe_exec_multi_queue.c
>@@ -65,6 +65,11 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
> 		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> 		.value = XE_EXEC_QUEUE_PRIORITY_NORMAL,
> 	};
>+	struct drm_xe_ext_set_property pxp_hwdrm = {
>+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE,
>+		.value = DRM_XE_PXP_TYPE_HWDRM,
>+	};
> 	struct drm_xe_engine_class_instance vm_bind_eci = {
> 		.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
> 	};
>@@ -119,6 +124,18 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
> 	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
> 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
>
>+	/*
>+	 * HWDRM is the only supported PXP type and is display-related, so it
>+	 * cannot be combined with multi-queue. When PXP is supported the combo
>+	 * must be rejected with -EINVAL; when unsupported the PXP extension
>+	 * fails first with -ENODEV.
>+	 */

NIT...Missing some commas.

'When PXP is supported, the combo must be...'
and
'when unsupported, the PXP extension...'

Also, when PXP is not supported, I don't think it will always return -ENODEV.
It depends on the order of the extensions (with new change in KMD patch).
more below....

>+	multi_queue.base.next_extension = to_user_pointer(&pxp_hwdrm);
>+	if (xe_wait_for_pxp_init(fd) == 0)
>+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
>+	else
>+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -ENODEV);
>+

With KMD patch update, given order of properties is multi-queue first followed by pxp,
doesn't it should always return -EINVAL? We should get -ENODEV only wehen the order of
properties is PXP followed by multi-queue. Right?

Niranjana

> 	/* Setting other queue properties are valid for Q0 */
> 	multi_queue.base.next_extension = to_user_pointer(&priority);
> 	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
>-- 
>2.53.0
>
