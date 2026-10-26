Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DCA606A31F
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 19:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YjuQEga0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5035510E031;
	Mon, 26 Oct 2026 19:57:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F33A10E002;
 Mon, 26 Oct 2026 19:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793044589; x=1824580589;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3fu0zL4Oy8IjKsOrya2xk9X0wmn5/JV+O5A5vTE2gdg=;
 b=YjuQEga0sB0rmAmb80SFii6cMx9T5b3nzZylB919L5wy0PAgEW5f+wJ5
 AmJQR4lBYmYrkIzVVyMc81ZYfrS93iPxUxiB0z/zrQI75P+4ZfmTPZfeU
 o3FngBvz1jHdcmKRuh4cXl+oNuiCaT9aaGKBoY34ioMsX8CMAytrZDToS
 9eF1pA7oVN0WoBjyOICDIEJqceHWlxqpVgPJ4ulzNUWB/7niws3J81ae8
 bvw6wy583Sjq6lyuHUsI53bSqykwzeb9Bc/p8lgRSdR/j9jycD1oTFO6y
 eMl+2FXKizauOotHchNatYIoiNpH4Tpt5srgA5hPlKCk3L/Ti7EriUdi9 Q==;
X-CSE-ConnectionGUID: G80Fb04ETBSzsOgan/aHWA==
X-CSE-MsgGUID: 1Ofj8j33SXeN3l/YDhwW/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1615730"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1615730"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 12:56:28 -0700
X-CSE-ConnectionGUID: v9FzeJZ2RI+KtZtnBjHCeQ==
X-CSE-MsgGUID: NZBNK5tuQ+2eSPXS/xCfcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4711051"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 12:56:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 12:56:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 12:56:27 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 12:56:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgNnm3t5YXYCV09reuXOdhQRSYPZ9ggxVRKGarHbMRxEtySlbFOStrFbbliI+bC/VXwm7eddLBSodMCSH5dZcawv+MhIkSFXOKZG/E/m8+faW7XfF/fb5vGtXwihZ6hKMYZokXIlBbOOsZOYB8QL6Dr9Qle1OC712tsMpRKwc6AgWIi+Kv119Bt/J3NhKpuWIo8qAVYgrlKjZ0+UUkZo1os+O3druLhC8r301APUYBj6Jt3AkCxwHV4swoLcIq0XP/vY0si0V5QdbokdbDdIyLSkpIERUueli32UJqbC9CXhZdnmQRGUXLlxK3nC/3gnQrsX2tvaUkN1U3VM0UBCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zt8075mknQD6TJyQRPeyMP0TGhEDKTl8rTv8oMxTsyI=;
 b=jqjluwpp3UxZGjvk5uXcftmAwqUybkeSCsGlGa48BXd8tSAl/j0oOgNEsJP2JPJbz7m6A5O9BijtgtpeRIzoyiMiL5RIhtoGo+jr7Wrl3CpFH8oDOLU+/lJs04umswknCrtY1bcBPU4TWp+E7EqKLDvY6CwCEkrhSv6TFG/fXBqWD2HtElLFbY758DKrosto4KqmuBLpekty/gBy+8F6smpgD4KlO4y4km48AL3M4WiaF+y25bGcydqaVFnZg2Q0NOsRfA4PZ7R9/e2RT3o75sugpAQoQv3yGrX+wo5wSAMIP3CaSIl/YPZpsNl/0vXT+4dPHhP1ZX23oN942gR15A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by IA4PR11MB407954.namprd11.prod.outlook.com (2603:10b6:207:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 19:56:20 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 19:56:19 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97?= i915.CI.Full: failure for Implement
 Wa_14026539277 (rev3)
In-Reply-To: <179283348817.64995.5911054895816599662@221881a7231d>
References: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
 <179283348817.64995.5911054895816599662@221881a7231d>
Date: Mon, 26 Oct 2026 16:56:15 -0300
Message-ID: <87qzhc9qxs.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0359.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::34) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|IA4PR11MB407954:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c6ab16-0208-4071-2f39-08df339b33e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|22082099003|261026121527099003|18002099003|261026135527099003|261021121427099003|56012099006|11063799006|5023799004|4143699003|261009223027099003|261022115727099003|261022113327099003|261021130227099003|261021135927099003|261021133027099003|261022075727099003|261022105027099003|261021123027099003|261026140227099003|260925021911599003|260925022911599003|260925021311599003|261026130827099003;
X-Microsoft-Antispam-Message-Info: PZeq0bClNvAbolamut8+1n6xK9VvmUg1AVMxwEKLX0jjCuyV1tMxl+l0tMaNopZIX5T2CqEgBApnGJyutxlcT4SBHWiQydfly9qzsVKDN2DeGWlutSztV+EXqNCBMxllXCTiUZJZyhOuX62L2fMgF+jfNcUlnlNBGHhlaNjI5Z4jIOfc9QRW25/2aDMiKTss+riFCGZm1Iwcg5Tc/QLBQcZoCjqz1yvBSDxSzcKnhDezLh+VLUJ7ZZjbIQ/knDyj2vtx4lSpQTQkN7TLghgB3aJzN+nIUVUZB67SBa+w2GuNDcAp4a94sMK3m1Q73Q7rqfcH5+3bIDP+aNebCZo/daH6v6gqmilopEgCl5v4EKshy6zzrXQnWJ0EiDFj5baDyE48WlOkOmI/n1TW74eHJZo+s7kzsjfzj0+61G2yfc9QDnhNFm1UepgFrHw3Ph0vtZ5foRgrtmEpr0PObA2bpguUVF2SR25Jyaqtr3UZvypQPSiyQti2//+W2bYsyVPjBrJqGh/rldoCwnMafzboau+LsKvtozn02IVoHBaTU8QO5QIw5GTPCqNE5MrXbFxaVUVQHRbkddvBNxHj3bsQb3SmBi0OjFSoSxymr2MeRww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(261026121527099003)(18002099003)(261026135527099003)(261021121427099003)(56012099006)(11063799006)(5023799004)(4143699003)(261009223027099003)(261022115727099003)(261022113327099003)(261021130227099003)(261021135927099003)(261021133027099003)(261022075727099003)(261022105027099003)(261021123027099003)(261026140227099003)(260925021911599003)(260925022911599003)(260925021311599003)(261026130827099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?15dnjDF9dNYZMX0emibJ/tnkC8DjAE7ybJe4v0uhLcx8ObEu+KeWsy2Q9NBf?=
 =?us-ascii?Q?9jnFjrx48JNDRZVdPkm/GmAX/YWv4T8CpjoZpl3zmsIOpi40i2ne7CVs+xEN?=
 =?us-ascii?Q?K9jHB4KkN9/mB9LVQAwIxjpY5jQVyATZcOYkQkb/TxFd5YKQIVJDBIZbqBCM?=
 =?us-ascii?Q?DHx9bJQ08h9l1R7Ehk/gxYD5bj5YceeSllqWnM74eogzMV5JqEf7dlQ34quj?=
 =?us-ascii?Q?C8lTLB2P9UE8DDpRCALUYNSIrupMHcN8x7/BxruyeiPk1T63c3OJUyvusvMo?=
 =?us-ascii?Q?Mo+6hn86gHPOXuJM8hb3paNHUhUwPMZQqMTbBlOiKt/5UECzXeAVsRxvBExS?=
 =?us-ascii?Q?aN1btHgL3nKWTmQ0WijBH+MTnh9zcE67xyIP1WgWcOxuvzRI4miYtoJe3hQo?=
 =?us-ascii?Q?Snd4BJe+NAEgqHv/GhSTEJI0pxW//MY8fY8fPSw2fKwr5tOkkncC1ZUsETm6?=
 =?us-ascii?Q?TCYl+nm9CIoD1qajNRbBmWkNm7eW2XlIfOs/aUaUX+3ElmrperJ52aGC/bAP?=
 =?us-ascii?Q?LHAqNG3ogA/m3AXz2nV1iAuXsVxRLkYUVkCS9EhIm24AiZMody3Vuz1js5S9?=
 =?us-ascii?Q?Oefax4yDUemXRDERQx2TxoVA1cZEkWSQkXMvP8axcL5kkVrcfBJk1JOvP/rO?=
 =?us-ascii?Q?t/vC2V7H65YaZxKnSs9SmSFZli32HaeQyk5VHB3ONqzkzb+8Mq3xq91M7/qP?=
 =?us-ascii?Q?9i8wTo4LJxoDbtQi5Nt2uOXwC0QohUmwwHCyVQlCvZdv7Zc1VFFI8u/21hQe?=
 =?us-ascii?Q?ujK3LS5MWjsgFZuhhXFrONzuzbb+7Vaa4gYZ8c9LA2+Gmar55HPdpX+aNQZ0?=
 =?us-ascii?Q?akDGRLMHXTnngekTyVybpF2B8WMU4dwEF45sRvw4WUDITxN79fj3g1JvXDBy?=
 =?us-ascii?Q?X8GXDu/23HVBBH7CskR5omw7zZKHVZqNP8sEdLGB88H4Sa9ThaAG1E/b+uYw?=
 =?us-ascii?Q?1ZC0bwOCblN21qD9dRg6T9Bw4MGHgs6W+SvS5R+s4GNihsesYEmmiIX93Ihy?=
 =?us-ascii?Q?5SNCrgEoz1vEsl3eRhA4m4ts2trpR3K4+cSR6ke1wcx6/IxV7Z6/s3WbK5DP?=
 =?us-ascii?Q?F+rq2g8d2W9txyc+TC0YlRKCPJ41Nn8HShku6UVnhmsWrx0uJP7hBFUsn9P4?=
 =?us-ascii?Q?N2IakQLVeiLOToeRV1OnYcFoe4a1ZrmMye0RPJmXMMhWTHy5MZDsSGzKJzbY?=
 =?us-ascii?Q?8SffPd6QezbK2MuZem277gA/QrqY4dBh31AF8Sp954AsdEb1W5KIEUvXN96X?=
 =?us-ascii?Q?f4ovHp+sXrM20tvHAt3VuGemMPQFl7CW9DYoFma1++CKVs7IaJzgQ72ggXJz?=
 =?us-ascii?Q?JHxgkCggaO7O+J2+MADKq2tna0k1s1kJDupY12SSfW45euP00+AKx3fWlOhA?=
 =?us-ascii?Q?1lB/BTDw/9qDSSMvHn5MJi23NB7BoFopV3hmZJjHD/Eqbq43/fKc0pFdkpAl?=
 =?us-ascii?Q?elHMtmILgEBBh8FVhh7ANqaTXvuNXkPsdOo9V0/JnvjH2A4bJjKD1gh38HpF?=
 =?us-ascii?Q?zLtde3Bz0rTbkjYj84pJPEQw1VFzhgwyP46HT8MQZY18wPpwQ8XhneO08ehC?=
 =?us-ascii?Q?RjbxwQBAsha3IPWCrL/TgJdiyn9sC/DA2xcsaQqubU0HxdxbCQkzx/F/XXNA?=
 =?us-ascii?Q?F26lkK7Kj/Aavpbbqnedz4OQLRY11SDa75XBeu8Mxz4FiXO4naKVdFy3sxkg?=
 =?us-ascii?Q?+H/OfJISmzlb0GBpV4A1j9lhGT1PkomvrvBl1w8gAb5fOnuAMrnxzH/0jwjG?=
 =?us-ascii?Q?Xyi9Mgd3Qg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 4UbHhwwFxpBZzts9b+4g6Iui8bTIovKeD3zp+kN2S9uiObksWII1rXPBOyGRd7vVnNfMMc88vzx9iapkocXAC4dTWYHHD3l+a8aNBb2VD8najNAsdFN9jgEmlOtUirK7U2WxXhXXKcjMaomcbZ29FV+TPlih2CAPu6dGG+d/CZV9cc72CRF0YwzCRKYjp0Gu080uKu9D8tG+UGuOQPDzr9Qr63ttX+dkh7RjlpFGFp467drogDPFL+7JlIwTWlUD005znduczdE5GdV9/NCSggB+bRoqPL7fBoFBvjuulyoVj6YE0tvPbHLQHWxhSUV/kyoopcAbPBzFN1snQauhwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c6ab16-0208-4071-2f39-08df339b33e0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 19:56:19.4595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enLMSjMGV6DIhg+RftzWmnNli8XmUzey31Yyxd1leUoos8K+gvmh9ksSIj2n2H5tp6vaq2Wbh5XCR52otBT5Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB407954
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patchwork <patchwork@emeril.freedesktop.org> writes:

> == Series Details ==
>
> Series: Implement Wa_14026539277 (rev3)
> URL   : https://patchwork.freedesktop.org/series/170844/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from IGT_9162_full -> IGTPW_16044_full
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with IGTPW_16044_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_16044_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16044/index.html
>
> Participating hosts (10 -> 10)
> ------------------------------
>
>   No changes in participating hosts
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in IGTPW_16044_full:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@kms_busy@extended-modeset-hang-newfb:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16044/shard-tglu-8/igt@kms_busy@extended-modeset-hang-newfb.html
>

The changes in this series applies to xe and not i915.  This failure
seems unrelated to the series.

--
Gustavo Sousa
