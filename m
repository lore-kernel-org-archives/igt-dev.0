Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E38C43458
	for <igt-dev@archiver.kernel.org>; Wed,  1 Jul 2026 07:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BED10E2FF;
	Wed,  1 Jul 2026 07:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ieT0LGca";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FE010E2FF
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jul 2026 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782892194; x=1814428194;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jAeTp84mvQQtjNOUS/3WhCOWeMVDUvhO+6GOfw5hVvQ=;
 b=ieT0LGcam89yMvB8xKoFpNC7ssV1Krihx8bj6oL0FnlriO+20PBUAZ4q
 eZ5ZFVCn/x/UOfZvW/AoPOIIdKpd97S0+HKOjb0JPteNhiQ8pKr6bgElU
 v/CC/ETZ2CCvz633AwMRtbB2gduw/FoVh3LQopoaIiVt/kst84VNM+R+m
 wfBc+Ms4iKjImqRiyRsWs6g9rpHRX2XOXhEamH4x76Bf/wUEIDB/1CDyT
 Wd5T7kMlgTZm/Nswjl/AbHoS69LgwqV6AgYgOb1kVLtxIjgGhXVUy7g0i
 UUmvRb33u50KHlSG2W9Sf0Dn3NHR620DPNxwwOY1BY7IopzPWp0Osp2Gr A==;
X-CSE-ConnectionGUID: IuiVAxhYQbm0y8w91BOvoQ==
X-CSE-MsgGUID: RneQKXkOSm+mAxofkZ4SVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94998522"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="94998522"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 00:49:53 -0700
X-CSE-ConnectionGUID: uY1wg/zoTYGtzyCfd407BQ==
X-CSE-MsgGUID: J1ZY3juTQmWag9pZmljR0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="246140200"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 00:49:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 00:49:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 1 Jul 2026 00:49:52 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 00:49:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hf0gGYFZKrT+HMVZPV5H3XuJ/Lsk6V9MS/sSUjfp7qVBiCzYAz+RA8uIpJq53gBN2BnZtYBsW0vzxxgm/YQ60WIqa7RXyvCTz5IE0O9ky/416ssFb+i/YqkQEvN1SQkjx9qldgF7OIWyej4IAs2InD3MASHNeSU4NxGV0Ig0mmzI0FeF1FADitdTNoUAp2oAzRXF6VpY05ZnE/sJCH8WxdbH1qIdIsSE1TrnE5+kcxSK/AdbDJTxGUBiY9JW2sRYbtWGrqHQHM8kZQzZTLtKFPXjAuzoDBFbYdHcynBAjqxn1MNHbgr1g/NTwo4bGQbAix1u+xqY6vnL/IuKaO0jTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6U0W0TFEVQ69g4ob8wVXH49gVXyxEpKA69h0kZLZkUk=;
 b=ZFj4qsbbXReeAVRgFUyrdYSdeGbC6rPmL/NaOKd4V92H1Obz1fVf2+8HBbIIfphIfH0UuGwpRwihko1350aeGCCtfaGD1dJzeQ98OGG9rxK1C91zPOZp+Vex5YkMjtCcBrqC/Ww6flr5US1QaG1zc8t2nbvMN5CLCm5m94PofukV90UmmgMY1PI4PgGH2NPZvAxlBHn5/QhqyI7Sc/Lwh5CF5+qKm2pTdAGHokb1+peMxZVifa/0bzF3IesadbAWrlIn3jyuVCz/S6jwwmzHfJAFNz7o2uKmvuGLr9PJoAHL/xEwe6HUrCLU0wGjBSaGrZNTvaoUzW1LVBf/WzWXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by DSVPR11MB9577.namprd11.prod.outlook.com (2603:10b6:8:388::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 07:49:50 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%3]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 07:49:50 +0000
Date: Wed, 1 Jul 2026 09:49:42 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, <dwarakanath.ramadeva@intel.com>, Oak Zeng
 <oak.zeng@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_fault_mode: Revive atomic tests
Message-ID: <akTGlmyYLVVaK_Fg@fdugast-desk>
References: <20260624062022.34659-2-gajendra.uttamchand@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260624062022.34659-2-gajendra.uttamchand@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU7PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::13) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|DSVPR11MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 5979adea-77c7-467d-2b0b-08ded7455451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 7QwyHDoVyTbpGOgWKh6zwYpHj+z3F9sknsBvHHsAz1kpJp9kj0ByXj+Ga6ARkzEnCd4KUHOr37ynM2uXA8Tt5ix25dk2wMMldPzTFD7f7+MEwI2tEjh/DkAQploYG3sk/mEgc4kizKACUtB7yIihyjTQxklEBKf5KR0QtxJ3e0Gu6qrt1NRKNjRdNHiLRw6IGegGgD0q1UyITz4ktKf21SmUi4SwNWcfTrV5mhodxs5pBVszJYHhfiZIU6tbdrd6ikn4efWrIy/7V8O28kLsXqQwTElyYIlarV9JKijz6Lgcv1DKUG2I/5uVaW7EeqQc7hsejMLd/W+Ll9ekc4VSzivNSRsN2iMNxHrSxLyPdipDxeL76ys/vccNEMQdI8qaXVVLkuugzGJnyFE8JSj9x8zS87LZBdshYJQbDK4AcUQojOdH79rXNp1uNBw7sZIIzAenM6AD7UvDgI3g8pHa97KpYGwPP4/UaAwslnAZpAxjpQe+BvlvFvKy0oo3sgnLOk145lTYsGGFKW1MeyhfBYxGvdY6sGTiZceDVgPtIMl5Kd98Crz8pssKHYFxGX6S1tpsCZHpa8F07ph5EISiBtA6tTEA92Q0+k2yxYxhyn06BB1/y0u/sIn3vscrC4mzxENcXYyL5u626Ri8XW6sENAaAqchTLPjar4tJY17/yk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l41TxL0sNLJ8FjU+ZuZXsSkC+SStAq9kW/eU1tK74T4TaQ7zZ+2WUTfwZ1eg?=
 =?us-ascii?Q?061CnKn8k22RVu2Ewp5MzNKeqyw7gvkuWs9Qx7wHuX2mXnKcjDMag1VRq36u?=
 =?us-ascii?Q?OmxdwMeTjJroGw+iTLSM2Eecnqw8/R8jCtF5q7b8XMGxZ2QliZtKcrYCT33o?=
 =?us-ascii?Q?E8pxCeMQafkPgJV84IadrFkc3QHbWMDhCvQHqNY5XJTdAjaypW+ho8ShBTTj?=
 =?us-ascii?Q?8KYpc+/uDs5Sxl2lo1oyfPqYopLYos4A06pGVgqE4BCMlDJSRLgYWmDd5FZs?=
 =?us-ascii?Q?Uo+tH5XiJ8xpT667tylNiyiZXGd4S6jrSd5U7W/FaVtiqSGB95D+pxBH5XDB?=
 =?us-ascii?Q?I3NgKZu1gDcPGTGxx5HSYi8llLXZHMa+9LtJF9EFRd8w9awayIP0YYA2hr5U?=
 =?us-ascii?Q?prdCAKbQpidJY0w/wXF3K2Kf0e/xCbJkfG/5A+mU3DnQeQlUutzYohShqj6C?=
 =?us-ascii?Q?s3iQqHmqVlGNyP6a2skpKQ+zZ687pfcG0qFKLwwVpdjTuNvNWIax6bqi62BY?=
 =?us-ascii?Q?Ij8gFdnfnEOoBgywXCuJiyudMOgCsRV2b7qzM+4ZtCn+9/l9YIiQPvwp6xSO?=
 =?us-ascii?Q?bAlMfhNKNxPKhlcrDMYxShoft3sOx7R7SlauBhFsEGl2161jS8EBNOLZ5cRZ?=
 =?us-ascii?Q?fn57oVKj8mSp1fkqcsnwQbN7QSwFTvj851K/rqBz4C2QUjFutpedZLtiWTZt?=
 =?us-ascii?Q?ajZlXc8C26r+Met/l+7lbzIp0dx5LQj6DnRyo6eNd8BWLG8m38nqER0qfut1?=
 =?us-ascii?Q?H+2z0ER3UVyxRaSzJWW1iXZxL2rYSuYOe7aj0OrffCQNvOI0VK3QxJJIr/EK?=
 =?us-ascii?Q?IKvtXYFna5A+WR3qiO+TTwYp4E5eMdJKWmlmHNP7FnBTgNnkKe/I1S0MQ4Wz?=
 =?us-ascii?Q?YZ8POPvX4z1gyyyHitToPshs3CrwzkAW6OOz8DQ5zASbgYXFQe6KJSjnzVww?=
 =?us-ascii?Q?MDuNBDeBpYkdSav/LN+lmML20d4sol1T7bd2htkp8z0g0m2idyngsWe5oMKo?=
 =?us-ascii?Q?Ka48VpQ1g2x0ch1QOwfbh4xBCDWjcC8FVLHRgShT6dII0o2icM35EIqdT48f?=
 =?us-ascii?Q?IMB5B/H1fwBL0w8EdYlHJCaRkIAjN02Ozchhg0K1fsAtTy95FRZPGl7rb8hH?=
 =?us-ascii?Q?Tib8f2TmcnR9K+XKsk/7uCEOys9gDv0afYbqPYjYVuoFbZf4Rzuwz0brG3KQ?=
 =?us-ascii?Q?LYPdtu3BTMRz6813sXPTNJx6sfHNStT4OGeOcyzINnpfEO8MNCzwCHBNE3AF?=
 =?us-ascii?Q?qID8oQO5k0fShmcxYE3YS4RYw9GVtdKSVc4xJRgvoiZtma66ovCGHB8OZGNS?=
 =?us-ascii?Q?Q0+9gDJEHl/VtZkiNvXU4Se47wKXCz4T12EmUubBLMb927Z8Tmitr/XvE7ON?=
 =?us-ascii?Q?ZLWJ+SmGzZHZCIC8E6jZybvzlT/Ii08zQa4Kr2n1+UcY5pPL2oUgRlwFA03z?=
 =?us-ascii?Q?RjL50TMlvzVE47yGew2ls2dJvKKiUKmu1SB5n7U8QSON+Hnp7slhugHazVM2?=
 =?us-ascii?Q?V5BReQkgCg654C4dTZ5jSi5YSXyDNpz4/YfQcyQaU9u/eE6zGBwxIg1pO28+?=
 =?us-ascii?Q?OT5z7SmpAfkaZoFJ6XRpDRtiZYgkTzOWh21Y4hK9R65Yn/DuUiBHJdhKrUDy?=
 =?us-ascii?Q?1m+W/MufTkSjO61KcmjKBKvTGnCKZ4W36Jellvgtq3SVKrpWOVAeArHbH3HI?=
 =?us-ascii?Q?VaTTNeyzb+8Y6Wmd0EZSqgqSlpIH96sT5uFf+lXg9eMwoS3+BPXask14/fE4?=
 =?us-ascii?Q?aHLKDdJwHueIW63sKORH/F6GQ5I2cYE=3D?=
X-Exchange-RoutingPolicyChecked: qr58QTJIA7fE212UQv6wOLfehfuRHQgXv/tTYQbTA53NdgYaJyQbK5LU/31h32KhWpemji26Cp6i1SppyYTzH9HJAiSo09EtuemNRUU7CIypj/nzsT+KxXFgYZJFGoSJ296FyLT/dpYZSlwSyAFoJ0XXcjwd5ThFw5BkvQ9U652KN5ghFrD1pSpCYSwcSKfBv7ylJxPGMqH2eas5krMx9ioTtkNIAPdB0T0hdhUapsy5WgpBDZAB/ao58zt2RWGBjQAbd+lt/nt6osdlNRt+y9Pq8TLNU940kajBK2ja2Pl86KJHruuDw4J42KFH9bl54fjNh5XvGtTLTpq2hhUhJw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5979adea-77c7-467d-2b0b-08ded7455451
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 07:49:50.1898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+rywQirHhWOqH3K7Mjnebh62PsyNS0SBNsx2MCWtDBO28LdHPUV6lZbMon0GvNteZHJxeoEU7BkFbVdn7wRWIq4UbScthK0PBnqCIIPz5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9577
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

On Wed, Jun 24, 2026 at 06:20:23AM +0000, Gajendra Uttamchand wrote:
> From: Oak Zeng <oak.zeng@intel.com>
> 
> This partially reverts "drm-uapi/xe: Kill VM_MADVISE IOCTL and the atomic tests" (
> commit 3557bb1215d5d57a4fbad50537272e96f37d71ce on upstream).

Please explain why.

> 
> We revive the atomic tests on igt with fixes
>     use xe_bb_size
>     calculate wait bo size separately
>     wait fences for none WAIT_ATOMIC cases.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 159 +++++++++++++++++++++++++++++++
>  1 file changed, 159 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 4649c67de..df836158a 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -36,6 +36,7 @@
>  #define INVALID_VA	(0x1 << 8)
>  #define ENABLE_SCRATCH  (0x1 << 9)
>  #define MULTI_QUEUE	(0x1 << 10)
> +#define WAIT_ATOMIC	(0x1 << 11)
> 
>  /**
>   * SUBTEST: invalid-va
> @@ -438,6 +439,148 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		close(map_fd);
>  }
> 
> +#define   MI_ATOMIC_INLINE_DATA         (1 << 18)
> +#define   MI_ATOMIC_ADD                 (0x7 << 8)

Since the original code was removed, those have been defined elsewhere,
use existing definitions instead.

> +
> +/**
> + * SUBTEST: atomic-once
> + * Description: Run atomic fault mode test only once
> + * Test category: functionality test
> + *
> + * SUBTEST: atomic-once-wait
> + * Description: Run atomic wait fault mode test once
> + * Test category: functionality test
> + *
> + * SUBTEST: atomic-many
> + * Description: Run atomic fault mode test many times
> + * Description: atomic many
> + * Test category: functionality test
> + *
> + * SUBTEST: atomic-many-wait
> + * Description: Run atomic wait fault mode test many times
> + * Test category: functionality test
> + *
> + */
> +static void
> +test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
> +	    int n_atomic, unsigned int flags)
> +{
> +	uint32_t vm;
> +	uint64_t addr = 0x1a0000, addr_wait;
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +	          .timeline_value = USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	uint32_t exec_queue;
> +	size_t bo_size, bo_wait_size;
> +	uint32_t bo, bo_wait;
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint64_t vm_sync;
> +		uint64_t exec_sync;

Those vm_sync and exec_sync are unused.

> +		uint32_t data;
> +	} *data;
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint64_t vm_sync;
> +		uint64_t exec_sync;
> +		uint32_t data;
> +	} *wait;
> +	uint32_t *ptr;
> +	int i, b, wait_idx = 0;
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	bo_size = sizeof(*data) * n_atomic;
> +	bo_size = xe_bb_size(fd, bo_size);
> +	bo_wait_size = sizeof(*wait) * (n_atomic > 4 ? n_atomic : 4);
> +	bo_wait_size = xe_bb_size(fd, bo_wait_size);
> +	addr_wait = addr + bo_size;
> +
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			  all_memory_regions(fd),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	bo_wait = xe_bo_create(fd, vm, bo_wait_size,
> +			       vram_if_possible(fd, eci->gt_id),
> +			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	data = xe_bo_map(fd, bo, bo_size);
> +	wait = xe_bo_map(fd, bo_wait, bo_wait_size);
> +	ptr = &data[0].data;
> +	memset(data, 0, bo_size);
> +	memset(wait, 0, bo_wait_size);
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +
> +#define ONE_SEC 1000000000

Similarly, NSEC_PER_SEC is available already and used for other
occurrences of xe_wait_ufence() in this file, not visible in this
patch. Please use NSEC_PER_SEC.

> +	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, 0,
> +		       ONE_SEC);
> +
> +	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
> +	xe_vm_bind_async(fd, vm, 0, bo_wait, 0, addr_wait, bo_wait_size, sync, 1);
> +	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, 0,
> +		       ONE_SEC);
> +
> +	for (i = 0; i < n_atomic; i++) {
> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr = addr + batch_offset;
> +		uint64_t sdi_offset = (char *)&data[0].data - (char *)data;
> +		uint64_t sdi_addr = addr + sdi_offset;
> +
> +		b = 0;
> +		data[i].batch[b++] = MI_ATOMIC | MI_ATOMIC_INC;
> +		data[i].batch[b++] = sdi_addr;
> +		data[i].batch[b++] = sdi_addr >> 32;
> +		data[i].batch[b++] = MI_BATCH_BUFFER_END;

Nit: add an assert like in other places where batch is built:

    igt_assert(b <= ARRAY_SIZE(data[i].batch));

Francois

> +
> +		sync[0].addr = addr_wait +
> +			(char *)&wait[i].exec_sync - (char *)wait;
> +
> +		exec.exec_queue_id = exec_queue;
> +		exec.address = batch_addr;
> +		xe_exec(fd, &exec);
> +
> +		if (flags & WAIT_ATOMIC)
> +			xe_wait_ufence(fd, &wait[i].exec_sync, USER_FENCE_VALUE,
> +				       exec_queue, ONE_SEC);
> +		__atomic_add_fetch(ptr, 1, __ATOMIC_SEQ_CST);
> +	}
> +
> +	if (!(flags & WAIT_ATOMIC)) {
> +		for (i = 0; i < n_atomic; i++) {
> +			xe_wait_ufence(fd, &wait[i].exec_sync, USER_FENCE_VALUE,
> +					exec_queue, ONE_SEC);
> +		}
> +	}
> +	igt_assert(*ptr == n_atomic * 2);
> +
> +	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> +	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, 0,
> +		       ONE_SEC);
> +
> +	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr_wait, bo_wait_size, sync, 1);
> +	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, 0,
> +		       ONE_SEC);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	munmap(data, bo_size);
> +	munmap(wait, bo_wait_size);
> +	gem_close(fd, bo);
> +	gem_close(fd, bo_wait);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  static void
>  test_exec_main(int fd, int n_exec_queues, int n_execs, unsigned int flags)
>  {
> @@ -589,6 +732,22 @@ int igt_main()
>  		xe_for_each_engine(fd, hwe)
>  			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH | INVALID_VA);
> 
> +	igt_subtest("atomic-once")
> +		xe_for_each_engine(fd, hwe)
> +			test_atomic(fd, hwe, 1, 0);
> +
> +	igt_subtest("atomic-once-wait")
> +		xe_for_each_engine(fd, hwe)
> +			test_atomic(fd, hwe, 1, WAIT_ATOMIC);
> +
> +	igt_subtest("atomic-many")
> +		xe_for_each_engine(fd, hwe)
> +			test_atomic(fd, hwe, 8, 0);
> +
> +	igt_subtest("atomic-many-wait")
> +		xe_for_each_engine(fd, hwe)
> +			test_atomic(fd, hwe, 8, WAIT_ATOMIC);
> +
>  	igt_fixture() {
>  		drm_close_driver(fd);
>  	}
> --
> 2.43.0
> 
