Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB8FC30653
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 19:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E491310E990;
	Wed,  3 Jul 2024 19:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZaC9raZw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C222810E990
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 19:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720035241; x=1751571241;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=refcHpsDrAVole0pcBY/WAGaPsrOzbsdoVDdFtMjRoE=;
 b=ZaC9raZwwXNCJb2QHHTym218SGZ7unjeTU67cUfpKAjuvqTM26JyKwX3
 ETc9ypm5earc64tT0CFdREpXQ9dqocDvAqwE1OP6dOm/JOyK8sPSPy3wT
 v+r6jxEcwvmntflPFgtYQ0z9p+73+pQC/bMuxVztA/ZLQPW/k2e58Wn7/
 I9QZBkYGHDuR3qZ0f8RkozFT9J5bfPlseu2gqARMU/7xYV0N8P/6I8/4Q
 jTOLK27scHJo0P9IHf0Qic9mPQYQ02d1vlwsftReZ7BODcGKLrAMtJPeS
 +Xx7at5VjsjW5pszxBvjU8xzk8ZvPxGJfH6WHpuG7/tdNt955DpKADJed A==;
X-CSE-ConnectionGUID: 3zHiX+1FQSWe1ADQw/gM/w==
X-CSE-MsgGUID: 3BZUSSmMSeutDXnjVtHEUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="20191655"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="20191655"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 12:34:00 -0700
X-CSE-ConnectionGUID: M9BjjCNWTnOVJ9EOwTT25A==
X-CSE-MsgGUID: V2YrSjAzRXK7qpAeJCMtxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="50955386"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 12:34:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 12:34:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 12:33:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 12:33:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 12:33:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2e5L/YNNdTtaofeHISVOiHw3ph7UTknrr/tNk7UjyPiCADrF42nFqfQ/oYKUL45OH0v1YM4okW2LTyCiWsF4kAMyQFSfDWdwWfflEzxuNw/REjJSHU6P/POIpqKfAvWAyyk5FS+R/Tjqewd1MK6pJ5Q+ngyHFYjXqlvqJNjaWXdQRUZGkmCRd/o4Pb1KfldyMr5vTTH/EyWj0PXK6UFv8/TEXely2adew5iDwrH56fJy9K9MBIMCIsiw/c6t6P08KWWvRCtDBUFfAC1exhhT/AzXIryfreRveZnyiUeZpN4ZCXD5vGxIowXXA1rpajECWmnljBtQ6sOGdRb2NYhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=refcHpsDrAVole0pcBY/WAGaPsrOzbsdoVDdFtMjRoE=;
 b=hbNHiE1KdYyaMOtOBqWjOeIwLNjRQZUjnDYg5bh7CNVGagI88Gpbi7mtrmskP9fjr+zK68S2zsFyXjlbGE1PBVHq4W/BvEx8vdLvCoB4Lx31X0CaJpt+jFx0B49pOIvRWkBlLtzkM9w+R5M0UYWR1h0AawXAGO7LgqFR9vg9gqT35sBXm/ShnWX9fdKuEFAy1tfcScKM4VPKGxd1sF2xSXZZbToV2M3PSnClGhzxIFTyJFPqaHsfaljWkIansq6HcErzp77ilxOVlS9aKg0iSiEivPvPiPhmI3KG22X3HGgIHbwy6Skos7YulL/Rhi2mdw1C5gKrENtYk98LLYpqJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6601.namprd11.prod.outlook.com (2603:10b6:806:273::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.39; Wed, 3 Jul
 2024 19:33:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 19:33:56 +0000
Date: Wed, 3 Jul 2024 14:33:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v2 6/7] runner: Use dynamic vector for test argv
Message-ID: <lmeie2h2sn6vmbw54pc3f7ccuzhlyxycp3ua6immcnc2sqyvus@76gpcqr6r5nw>
References: <20240621195150.390462-1-gustavo.sousa@intel.com>
 <20240621195150.390462-9-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240621195150.390462-9-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW4PR04CA0233.namprd04.prod.outlook.com
 (2603:10b6:303:87::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: b8657a85-d249-48c5-c905-08dc9b97146d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9tcFLtdm4V1Qg8DWqIZ8HlQzmxE37ZuFsv5n1nd3A38Ub3Rvyh6+UTqqLMMQ?=
 =?us-ascii?Q?hkrTM4D4ullO3K7eBWw/KkE8Asw0GWdSs7Dt6OWvqk9Jt5RI8ZgOdcOgGv+e?=
 =?us-ascii?Q?0fJ8Ok0fA2C6kHnjYJArOBveQHGuactfFbY6/NcESrjSlhG4sb1/kdE493Kq?=
 =?us-ascii?Q?ZHe5PP9MDZ3KAN+wyzy/4rsNmv7hcQBf1PZO5c1Wq1dcgCKICp82Py8JRe0B?=
 =?us-ascii?Q?nj8RjVfY/60nqEyCIj5PBstACSM/Nw4Lcf/CvhwIoS1ZAImJELW4FfIxDHS1?=
 =?us-ascii?Q?yIE0kG5TYVt0ymHqtDt2pUeIANtsuV1/NixmlnddVa8oYzHJZTpBGLN2hdxx?=
 =?us-ascii?Q?WKZ/JEvFD5qitmta6UjKom90UjAvIJpAHx2d7e69s/W4ybz5r+Dd6wwK2NEL?=
 =?us-ascii?Q?mOhGaODxRpqZJ+OqhNrpaOgrDmTeXKSmr+CfWapli3G03kp6Ew5FQE4ADGgh?=
 =?us-ascii?Q?CriIz2xtIo2EVSYjtpW55zzPTLfvOrjsFvF9ow99UWCrAGoGc/02H99nI2Oa?=
 =?us-ascii?Q?bccpf+rAMI3VjYCZWwD/t2anHwiLx69zM1XbHfBYeK86yjjIFkhishk0YIbn?=
 =?us-ascii?Q?iEH4fmtogx03TXBFt4uuQYwDWhLZEBRkMGEUDoA7gc18MrTMWNFZPYmKj86S?=
 =?us-ascii?Q?q7rha1WPzQTVLBg+fGfoFRK3rsw19+dNzEqpKXdgKOhgog7BHjSdNeanrDie?=
 =?us-ascii?Q?uzgfUjF47g/QGR4Q2VIfkAt85J5sWGpFQEERJCfMnOxC/Fn6IWcsdzJzRnvT?=
 =?us-ascii?Q?X1MDSP4aX5bB09Lx32CLmm60sFsXAbjc7pVkGVUjQuCgWO4g9ROqKsqogSfg?=
 =?us-ascii?Q?mnKjpC6SEPVYh9Z2GT2veubW/MDQQQsMh0VkK0OFrvckSQmIEpmlarFyR+zB?=
 =?us-ascii?Q?jEELoaJdMMcVPYyoetLJzJgxduScS2UHPqg+m4TJAFAR7G+0joxjYdxfYS1n?=
 =?us-ascii?Q?EXkB6iBtN+g/TZDs9a0C7bMW09ohBjvoZSIIDGxqrpLuf6Sw5oW+hWPFfVpY?=
 =?us-ascii?Q?SUprd4wewro5HkFAthVVQB3oOfQ3KdPGxBCUaqjN3yKq/lKdcOypA6AnKl4m?=
 =?us-ascii?Q?t0C8KU4xCvViKVLDk2p8JlVPHh5abU2DWqBuNL+zKiLJW9xaKMsBgRlqAxCp?=
 =?us-ascii?Q?f4or/dqJh79ANp5H2S+haikHWoINUJqmhYB8Y/OnUZ2Mxm8ygiUrU2uZLmI9?=
 =?us-ascii?Q?rCbsrbaQX8FbHBbkWCpTaRivYLO/PE0W/HOmDx+VXwhBVfbqRZFLDKuSvb/q?=
 =?us-ascii?Q?4IKwyxOfOVtjNOUxzIOG0GNxdyN+36or9CD/jUbSpgCKzM5+8/vjp5vTSO5b?=
 =?us-ascii?Q?jmpX7moZ6QtG8CoeaR0H6+oetM9wtTOvdp3/Vgs7zayBfQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cXTEfE/WJWu9tjRNC+JwBr1vp7vhfLFi3lLJt2Lr9DrARvgS39ZAhQq+djK4?=
 =?us-ascii?Q?YTRN9uPfSHo7+J3bHiFxOvI379ZurErIaGoKYtGGVk4+c4BnGfs8oiJunUZS?=
 =?us-ascii?Q?uvcluW/NChgazOdLdvHXomfWtyWsdHBbs6rTEfkMNizrJJv543pDUdb1kU/b?=
 =?us-ascii?Q?oxgz8aNsDkItD9BsK/4SYRLGr/2PCghV+iZ38VpcREl5tpbldE/glIMg2UTi?=
 =?us-ascii?Q?nU6hCWGFJ45+oz6lTq40ou3Z0E3CVZV4RJjPHkTTy0CXqSxJ4hv0ZyRsiN5R?=
 =?us-ascii?Q?+ocYaWujolb6ycjjuacb9bql8rVBJxT0zgXKTipMnemPa0TZC1wLWp60f90H?=
 =?us-ascii?Q?cBjFAdO3cH/oVqo+9D6UqhY/5TCNmkRZOnr6T3YpKbsuLyLoSr1nlI/y51R3?=
 =?us-ascii?Q?xmLP03XTbSFw553LiXtfbmAFTqXWk04QnlMvuOYQVANG/dflhkxL+hZe+kmN?=
 =?us-ascii?Q?WZNWv37MuLzimyvz2Clq55XBzgzpuk4LKWn70lkaqQaGfl0erwt7Ri5jneWw?=
 =?us-ascii?Q?0odTc5/yh3bdeaJt1RwuvfNQo+WJukAZPzDuT2s9eSYDwuKPeERyWp5Lyt7s?=
 =?us-ascii?Q?lY4XQMmSljEwUeyH4V6Pn941/JY6kxsZM+B0+YXCKHfutWaAeDOT/UPNN1RR?=
 =?us-ascii?Q?3Wm/E2WMZl1TY2+5qU9KbZnC5PVpOyY+dvPPaQBRujciBhHOnnnvEDkbj5cg?=
 =?us-ascii?Q?J8imQHAc/SJyYCW2agalAJ4o2vL6HrYvh9+s+eVHEQuLAcorj9GdjuxQHlwn?=
 =?us-ascii?Q?ZmZhYUFHdHl/o7aY1/LpxvVRX26t8tkChcswWs5p9DaKXfwIm89OuZ2PQ5J8?=
 =?us-ascii?Q?dMpcNUHnh0TR6NmsVXiDpyqXIZDo7jF8cvq7MB4K4pRnIAeXybw8CZahMDTy?=
 =?us-ascii?Q?NOlRcbJJj5v3+44dzdYNp85R5PMOS0MxC0qA/TRKaJZ1+kuoXduJYmp+up38?=
 =?us-ascii?Q?VpioNlyRAxLvYoImfs5gbHM1U+3VR6qFkkLYC+YZwA99MlqGLZlzle0roBmN?=
 =?us-ascii?Q?1NuOx1GLirNO1oDKAsPDsuI1CWDjyWYAdb5H5Wj5CIRfdvtGYhL/HuV6hBUb?=
 =?us-ascii?Q?cyZ5z+hRDQ4m5ZG60nLI6lvwCKCrpO86IMqOP0Kp3uh9p4u6ThfVSs/+lm2P?=
 =?us-ascii?Q?JhxwbjcuE9Iswib449YcXH9qBkBRAs/wP97d/IsDnWuwGOaMtWtRIh3rpnhE?=
 =?us-ascii?Q?Sy8XYAihsfWZx+qrqciase+101dqBkc8wvkiRGqeJjervLuZJaJvrB5aNpaH?=
 =?us-ascii?Q?U0NgBICUj+zwOTzbgE8ebx5p3eMbxPLHD9x9/NenS3U6v5aLa3fNIiNw2dgU?=
 =?us-ascii?Q?WANkAKDRaUN7m3GAWNnXXLluUKNAYeQErefAr9sZit+PDPxThlxHJ7CoPxFJ?=
 =?us-ascii?Q?d30HNiOK1mAQ301//zKo5tSEmBt3ZatYpGPm8vieLcdhlami9GW3l4VpXDwC?=
 =?us-ascii?Q?9Zy+emhEQRlGxnYIFGM6J50ARCVRWV3TX0+/7qxUoG4rOjzlIyeOM3o4N/Xt?=
 =?us-ascii?Q?vaR0kak5V7O0XCVIN5TrdunmSGdEh8Dgl4KnKuEPpkBznEth8yXfn4N+PYvU?=
 =?us-ascii?Q?reoCGE5c/e8Ed6JoXvuWKZ2kcGi7uhVJCkXzoDpfmgnpw4U5n/6bBTicFf8b?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8657a85-d249-48c5-c905-08dc9b97146d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 19:33:56.5782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oF/VwWS5ahy6ju8QJAEnE7DeUI1DUZv7qwnGsNS1tGAAwqx5UVx9XiGFkW/YkmeBT5o9VdCzAm+15CDxZ2pZ/JCEKjNlz6UDBOirGfvl568=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6601
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

On Fri, Jun 21, 2024 at 04:51:51PM GMT, Gustavo Sousa wrote:
>With an upcoming update to allow multiple hook options, we need to allow
>for a dynamicly sized argument vector in execute_test_process(). Do that
>by using a struct igt_vec.

this is exactly what you said could be done in patch 2... should just go
straight to this solution then as it is more flexible to allow the rest
of this series

Lucas De Marchi
