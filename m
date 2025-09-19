Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE681CAC59A
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 21:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7757310EA9A;
	Fri, 19 Sep 2025 21:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XkhkjBMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF8810EA9A
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 21:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758317356; x=1789853356;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OwJOlyNDtbyyd30q97K38fQGNYoH6CyLQ5wJ3WYfi00=;
 b=XkhkjBMS/lRq4QJgEDmICzic+IPgvAhlmWVTde3vyDxJ/7eJQKCrVjVI
 T1ALOiincPUEps7iPP1ygGv49OQ+m733QWLJmefPeuLRJbIJbHG26eVeM
 DCn11Ivs4do7RJh6kxjjcK9ZlCItiL03ijo9HLMCcxOo4JI8ARS0aVpIO
 opBfT7RvcDwSiEowNYY46ypQtUd81VN529tLrR58wIgnRwGEQQY4cxezO
 oJi4QiXCzsxSmzvgOr+sxrGzW8kyvDWCznajGEM7t1EFsq0VRQCb6Izp6
 SrwUZ9acd8Xltb49TJWY4od4pBXl0hU57SxgLNBfUraFpq9nVvSQmVjjY g==;
X-CSE-ConnectionGUID: kkIk7JbfRn2BaC2IGdgEPg==
X-CSE-MsgGUID: Goyk45QmQsewamIphaRU/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="71774772"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; d="scan'208";a="71774772"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 14:29:16 -0700
X-CSE-ConnectionGUID: 3cCeR5B/TbmFAzwT8ougPw==
X-CSE-MsgGUID: 0GZwZoBPQDCd7cNoCBWTFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; d="scan'208";a="176320542"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 14:29:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 14:29:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 19 Sep 2025 14:29:14 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 14:29:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2ONWEcLRccsmPf2fEQqDI2tRw6FEE7VFcl94oR6Jy9mUTyoaJcIE6BFkm5hhl+/xDIP41Khm5+hDnfbjLoCLcXCLx7labl6Ca0oFPSCBOeuCBeKIwvjCrg47e3fE6sp45Y2htUXqZCUEGyzlGVoBG0kp9TAwg8LnRG5ZW/BGxJ1S6YPnSygYXhi+7Ec5s1QTFvI+bPBqBaLZT9IR8brNpDct2RXbUh8tccFfj6qr01bbCIyHxhXxnY3zvThrb42TglTCpEpv7asj/SxWDReSiB2N9qjXtZO/KH6YoKQw+y4++7YdGJiQMVqktdKq1/+D+KWohkuDaWGJSbiKHbEBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPanf105j3hRYpU9zY+wlflmSQan3Wf5btFp7gPkS7k=;
 b=kRS8DvXx78v+teVFUbGJDhx8j++ZrsNOhHHEsOqzCwqOHfopS4HGPuvPK6AF/1XJLEzgYYQQtDMvt6Ozs/pswNkY/NEEJy8o7oCMtqpz35adKvq+FZhI43KSw9j1/Gd/iGEne3KUMOcMl5XDvBYtngdHA8boblq7Q04n0mmu3b/JAenAiofnswSaTcaVQszb8Mv7XCnvgDTAtN7FDQ2XKxS6lccow/ReAxfEL6uUuEIor8juZ2oDDY1bQfKtilpYt31E2/RYKdnH9dABgzyKR+tGLl+vL2ar/ug0cNG89jndrTYtYrW/0P42yBZJ///WsgVu4QqtHq7urxn1sMiflA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA4PR11MB9129.namprd11.prod.outlook.com (2603:10b6:208:55e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Fri, 19 Sep
 2025 21:29:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 21:29:10 +0000
Date: Fri, 19 Sep 2025 17:29:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_configfs: Check
 ctx_restore_post_bb
Message-ID: <aM3LI87WWOA-BCZY@intel.com>
References: <20250918-configfs-ctx-restore-v2-0-5df035e27e42@intel.com>
 <20250918-configfs-ctx-restore-v2-2-5df035e27e42@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250918-configfs-ctx-restore-v2-2-5df035e27e42@intel.com>
X-ClientProxiedBy: BY5PR20CA0031.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::44) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA4PR11MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: 043ceb17-7314-4016-65bd-08ddf7c39234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?apHrKrPa7Mq/dDMYGgsNRR4aUSninadVYlQxAlHE2XqvAR+s8F36Ma0szyHJ?=
 =?us-ascii?Q?nIstJZemOWlsL0Kq4inwes6K0JyA4brU6+hKvjrLctV9d6wGEUVupOEsoUQm?=
 =?us-ascii?Q?l4Ai7qVkrZnE1oxs1iqxSB5wOcSryOwIFxNI1sf0jmRmGNvXIQqh+ewKr+vK?=
 =?us-ascii?Q?fASZgQZj8vQyKtZXyT3eWOjyr4nQxV11WD2LKjCKvYJsG8yQmbZEIHGx6a90?=
 =?us-ascii?Q?vD6paVinbShoAI+50niq9VyAACvcHdo7LkgeRXWmeuRprag8ewx5gMvC61tp?=
 =?us-ascii?Q?JRWKjvRVFbxVRCk9R6LnBwec478vHlCnrPNMVI166Crkt/RhRRdMEmUyS6Wy?=
 =?us-ascii?Q?+mWUimuuT4Rd4KE16a+NbkGpM3xjj9f38VsRxQM1vN+/N1amTkmgahLvIYmX?=
 =?us-ascii?Q?xuEF3S10io0kw1FESKv9gxrN18bk9pEDGPh6XhGXxJdRgyWUzPrPzwSiAYoe?=
 =?us-ascii?Q?QV3Y+ekzDXsrMxlZCaiPgBMnk+h+suoH0OyMgs8N1wE5oaJjRDw8jj4Vuyw8?=
 =?us-ascii?Q?1A8RwVbU3islAy3pDR5kE9sRvrTT1vVVD/3WQUyy9K8s8uE1prSNrVZ/xLUW?=
 =?us-ascii?Q?Rx51L6ZbdZGzHexr1BI/p+g6vqUOxq39Y+FcEVg04ku3CcWEWmgSyrRDJ2Ob?=
 =?us-ascii?Q?SRoOWkC/LkXk7W5pxBdkcQ5C6cmOBL5gMeOHUyjfIZlZ/LwgNnwzi5uyeQl6?=
 =?us-ascii?Q?q151eE+bpGT0tnZ+pcvPEA+q/H3gDOCcM0AGwQ5Byw9JbQK3gFOpMYwEQlGe?=
 =?us-ascii?Q?RRhgimT4EX23Er3AqXc5Gkb+Mg6UUQ6lYXiS/JoWZ4sfNdVCVaWr2THpuGNm?=
 =?us-ascii?Q?KA2FBzx97MbKvbCsXdwFUu5l9QIq965sAcaNw5boKmERNaGM28QFepLtBIA8?=
 =?us-ascii?Q?pNPD7UhxXSfbPAIrE4y4Ax0TfwLQyk0abGjDofbo20Evv7W4Xn8RPpTQEBD0?=
 =?us-ascii?Q?RgxYSNQ/LCbgLkW4602CaTnPdG6Chha9mIG/baCZyOtDGlITRXQLNqFpS9hn?=
 =?us-ascii?Q?98OohsIxhj6H10trAjd/my/kg1OH23vNiZuakJvm3rcTXJczR8t3BbfJUreO?=
 =?us-ascii?Q?6w8SSiD2So30shM3SKP8Vck6wBgHQABSqmGjbF2Z1y2adVAzgKL43PuRs8ih?=
 =?us-ascii?Q?iIMbtbOAykYNLE7A+MeyqAaLiUcDaK3DFTTqHSiN3kUyabE922meNVnqrNZ4?=
 =?us-ascii?Q?dPeYutXjCw3V33YiQtmZs741uWDERz+6K8UA1W0E7N6JuKHqBeHrGDjgsXrJ?=
 =?us-ascii?Q?8aWeTXyC4vq/oqAt6QtHLixJVVDaCbjUK3tLmhNyk1L+1RaTxV0tAKXblMdA?=
 =?us-ascii?Q?IFH32csGbBh7dBtDAgUPbt/BaAYyC6GhhZmR6Q8QQoV1bjYdmZnCqHTEix7Q?=
 =?us-ascii?Q?YZWquDm+AnzBfoKl6RHkQ5fnzjF6A/bqqg1pqS7yI2wG0T6dQ0bxIQ3ZE5JD?=
 =?us-ascii?Q?gz3+xAAv1GQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NyEcOdz+FsG3x4857RpJ/wyu5D9lCqq6uEeyDH1cI0MxYjc88eK8JUIZIlkt?=
 =?us-ascii?Q?zwwstmjWOUEONZgzOqxRmAH2Zkti0QwcWZKo8sxN7MsgPktJhb7Xxf6Fviq2?=
 =?us-ascii?Q?Du+PFD/UdLoY8Mi6S4Rg5Z42ugbJaKhywyzeshvByN71nEEXFaZZ3dERPGxk?=
 =?us-ascii?Q?6eMOnXKv5p0NevyB/R3RCq7NyKFHriGOzdsr5TD/GdOtxFFg0lPcncRxbmzf?=
 =?us-ascii?Q?9u3uCUgNs5jTZikSeh7PKEnL+inFIXknyLavQjlu/GYCX0UBVkTiRuCFrPyS?=
 =?us-ascii?Q?ACpBkf3CPpSicMm0w3J5swzAEGZkHnvdCmZt1fWaXOXFynT6g06dM3B5d7Sc?=
 =?us-ascii?Q?ne2NN0RdwvpYOKxgCUQgUEwbMBAZDDBU9ltS8hrMobWoNNGEJhqumP5vkq/L?=
 =?us-ascii?Q?pOg5+SzcODvGFvkq49IgV5wYkcqK/vqfDQ8f/2SRu7tzfmg+sSirCIDifGGQ?=
 =?us-ascii?Q?BvCNYM8UpxSyfXnB/UWj5Ns73QphSnwMG96T8Ee9KZeo/kn3rYJFA0XGMppO?=
 =?us-ascii?Q?JP+KkWNTvMq+99iFrlQGfL9YFgzdvKAfTFLvRiq//n17G3966VenDiT/f+Jm?=
 =?us-ascii?Q?vSjAcjs+NUggIhj4142G7sn0PpyPr1zdGZZa/UQqxUbJFj1ZLKEguw0/lcNk?=
 =?us-ascii?Q?SJW2SaFyCmNt3urHrAqQNt9T0hec+JGTJbJ587ivX7N8QAIE6MkOwgOwwrdZ?=
 =?us-ascii?Q?hvavkl5Nq9iC90DjUSkBJLNAsjHRRcM8FzT3FYKZ9T5l/u+w8P9P4xykuG8L?=
 =?us-ascii?Q?xHeZICY/OptDpF5HpTHakKlGv+2hxUv3i8yubJTngI8R+C/+mbveEn1mr7Pb?=
 =?us-ascii?Q?WjPbuRqagQcRPl5n3kVEn5GMGcZvrLvXmrtbVqiejd3osK2vCAQu2wwlyhba?=
 =?us-ascii?Q?+cj6oCZbxFN9YDiTO9jh0ooVAKGLlq+otHSwdfyStWvhPMgAdyox0Wxkd/g3?=
 =?us-ascii?Q?2+iR9wgcjQEtQQN0kbajpGaVP/B9/mAMB36YG7PFR6GYOfVhFiJh14l7HirT?=
 =?us-ascii?Q?bhaP8QJWg7OS2jMiVsstLraSRhggoh1FDoQsuooQu94PW5qMOm0KJ+UV2eX5?=
 =?us-ascii?Q?ypYtWQ169RUu+4rsrjssl3ngb8eKJKPoUJ9hM6MbGxfSMMCQ09bDXHlXuPVb?=
 =?us-ascii?Q?BGfkfvo7qqc/uuYl3UA3uo/HbtIZeaNL/n7O3r1JV3ANYl7u9tn+3T2lIjF+?=
 =?us-ascii?Q?MKzofzWfZVt3M5R6u5n3wfmAZoJT19CidJmRd39LAIxd/tKp7d0u0IMWALvU?=
 =?us-ascii?Q?454diFZ+NHthPc54fuPvcOyL1F0SxiE6DP9QHi0+5GjThQnfZsk7x3Qf5O0V?=
 =?us-ascii?Q?neI8dzIkKI4tjIHhKv4cWY/PUHmgrHTpgxmQP/KR4eclZZIR5y9OEWC2LDyx?=
 =?us-ascii?Q?IoALAzp7X+pjAqTP/LkK8xBGhKjpjt9XCD38vzr9MN2vfq73gZzeQbdxmbwV?=
 =?us-ascii?Q?xlPzKqVS2dgQorIW5vj7ugkjYvZSJ+rAqVmOx2QVe69spg9u6YxywjtRoReC?=
 =?us-ascii?Q?+hOH/mLD0/03f3twIJnObP/gifvC33wmz3gpJYoP1gIUjgkDHkQUzopftcvs?=
 =?us-ascii?Q?mvlUl4UoE66fBKgnP94zXPOTjEr+TfHuaj5eDs2oX6kirEFjKdFlGgipCmfE?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 043ceb17-7314-4016-65bd-08ddf7c39234
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 21:29:10.2118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLX+7gDP5oQiaYwd+jm0dswFbfWS0pdQpUoKdPb0pBOIPNODyp8GLJZlXjmPFcrD5wIe33UeFC2X5Mx1f61JVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9129
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

On Thu, Sep 18, 2025 at 09:50:21PM -0700, Lucas De Marchi wrote:
> Add sanity checks for some bb written to ctx_restore_post_bb and
> ctx_restore_mid_bb. For invalid values, it validates the xe configfs
> implementation correctly rejects them. For valid values, it checks the
> values are written correctly and that later when we driver binds that
> the HW register contains the expected value.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/xe_configfs.c | 177 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 177 insertions(+)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 794c76132..7a7a7edf4 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -26,6 +26,31 @@
>  static char bus_addr[NAME_MAX];
>  static struct pci_device *pci_dev;
>  
> +static bool check_registers(const uint32_t reg[], const uint32_t val[],
> +			    size_t max)
> +{
> +	struct intel_mmio_data mmio_data = { };
> +	bool ret = false;
> +
> +	intel_register_access_init(&mmio_data, pci_dev, 0);
> +
> +	for (int i = 0; i < max && reg[i]; i++) {
> +		uint32_t v = intel_register_read(&mmio_data, reg[i]);
> +

easier than I had imagined...
Thanks

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +		if (v != val[i]) {
> +			igt_debug("Expecting [%x]=%x but found %x\n",
> +				  reg[i], val[i], v);
> +			goto out;
> +		}
> +	}
> +
> +	ret = true;
> +
> +out:
> +	intel_register_access_fini(&mmio_data);
> +	return ret;
> +}
> +
>  static void restore(int sig)
>  {
>  	int configfs_fd;
> @@ -124,6 +149,142 @@ static void test_engines_allowed(int configfs_device_fd)
>  	}
>  }
>  
> +/**
> + * SUBTEST: ctx-restore-post-bb-invalid
> + * Description: Validate ctx_restore_post_bb attribute for invalid values
> + *
> + * SUBTEST: ctx-restore-mid-bb-invalid
> + * Description: Validate ctx_restore_mid_bb attribute for invalid values
> + */
> +static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
> +{
> +	static const struct value {
> +		const char *test;
> +		const char *in;
> +	} values[] = {
> +		{ .test = "invalid-engine",
> +		  .in = "foobar cmd 11000001 4F100 DEADBEEF",
> +		},
> +		{ .test = "invalid-type",
> +		  .in = "rcs 11000001 4F100 DEADBEEF",
> +		},
> +		{ .test = "invalid-number",
> +		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
> +		},
> +		{ .test = "invalid-number",
> +		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
> +		},
> +		{ .test = "invalid-reg-addr-only",
> +		  .in = "rcs reg 4F100",
> +		},
> +	};
> +	char buf[4096] = { };
> +	char file[64] = { };
> +
> +	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
> +	igt_sysfs_set(configfs_device_fd, "ctx_restore_post_bb", "");
> +
> +	/*
> +	 * These only test if command parsing is correct,
> +	 * so just make sure there's no device bound
> +	 */
> +	igt_kmod_unbind("xe", bus_addr);
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
> +		const struct value *v = &values[i];
> +
> +		igt_info("Test %s\n", v->test);
> +		igt_debug("bb '%s'\n", v->in);
> +		igt_assert(!igt_sysfs_set(configfs_device_fd, file, v->in));
> +		igt_assert(igt_sysfs_read(configfs_device_fd, file, buf,
> +					  sizeof(buf) - 1));
> +		if (strcmp(buf, "")) {
> +			igt_debug("Expecting empty bb, but found '%s'\n", buf);
> +			igt_fail(IGT_EXIT_FAILURE);
> +		}
> +	}
> +}
> +
> +/**
> + * SUBTEST: ctx-restore-post-bb
> + * Description: Validate ctx_restore_post_bb attribute
> + *
> + * SUBTEST: ctx-restore-mid-bb
> + * Description: Validate ctx_restore_mid_bb attribute
> + */
> +static void test_ctx_restore(int configfs_device_fd, const char *type)
> +{
> +	static const struct value {
> +		const char *test;
> +		const char *in;
> +		const char *out;
> +		uint32_t reg[4];
> +		uint32_t reg_val[4];
> +	} values[] = {
> +		/*
> +		 * values for the registers just keep incrementing on different
> +		 * tests to avoid having tests passing just because the
> +		 * previous execution set a specific value in the HW
> +		 */
> +		{ .test = "cmd-single",
> +		  .in = "rcs cmd 11000001 4F100 DEA0BEE0",
> +		  .out = "rcs: 11000001 0004f100 dea0bee0\n",
> +		  .reg = { 0x4f100 },
> +		  .reg_val = { 0xdea0bee0 },
> +		},
> +		{ .test = "cmd-single-multi-values",
> +		  .in = "rcs cmd 11000003 4F100 DEA1BEE1 4F104 DEA2BEE2",
> +		  .out = "rcs: 11000003 0004f100 dea1bee1 0004f104 dea2bee2\n",
> +		  .reg = { 0x4f100, 0x4f104 },
> +		  .reg_val = { 0xdea1bee1, 0xdea2bee2 },
> +		},
> +		{ .test = "cmd-multi",
> +		  .in = "rcs cmd 11000001 4F100 DEA3BEE3\n"
> +			"rcs cmd 11000001 4F104 DEA4BEE4",
> +		  .out = "rcs: 11000001 0004f100 dea3bee3 11000001 0004f104 dea4bee4\n",
> +		  .reg = { 0x4f100, 0x4f104 },
> +		  .reg_val = { 0xdea3bee3, 0xdea4bee4 },
> +		},
> +		{ .test = "reg-single",
> +		  .in = "rcs reg 4F100 DEA5BEE5",
> +		  .out = "rcs: 11000001 0004f100 dea5bee5\n",
> +		  .reg = { 0x4f100 },
> +		  .reg_val = { 0xdea5bee5 },
> +		},
> +		{ .test = "reg-multi",
> +		  .in = "rcs reg 4F100 DEA6BEE6\n"
> +			"rcs reg 4F104 DEA7BEE7",
> +		  .out = "rcs: 11000001 0004f100 dea6bee6 11000001 0004f104 dea7bee7\n",
> +		  .reg = { 0x4f100, 0x4f104 },
> +		  .reg_val = { 0xdea6bee6, 0xdea7bee7 },
> +		},
> +	};
> +	char buf[4096] = { };
> +	char file[64] = { };
> +
> +	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
> +		const struct value *v = &values[i];
> +
> +		igt_kmod_unbind("xe", bus_addr);
> +
> +		igt_info("Test %s\n", v->test);
> +		igt_debug("bb '%s'\n", v->in);
> +		igt_assert(igt_sysfs_set(configfs_device_fd, file, v->in));
> +
> +		igt_assert(igt_sysfs_read(configfs_device_fd, file, buf,
> +					  sizeof(buf) - 1));
> +		if (strcmp(v->out, buf)) {
> +			igt_debug("Expecting '%s' but found '%s'\n", v->out, buf);
> +			igt_fail(IGT_EXIT_FAILURE);
> +		}
> +
> +		igt_kmod_bind("xe", bus_addr);
> +		igt_assert(check_registers(v->reg, v->reg_val, sizeof(v->reg)));
> +	}
> +}
> +
>  static void set_bus_addr(int fd)
>  {
>  	pci_dev = igt_device_get_pci_device(fd);
> @@ -176,6 +337,22 @@ igt_main
>  	igt_subtest("engines-allowed")
>  		test_engines_allowed(configfs_device_fd);
>  
> +	igt_describe("Validate ctx_restore_post_bb with invalid options");
> +	igt_subtest("ctx-restore-post-bb-invalid")
> +		test_ctx_restore_invalid(configfs_device_fd, "post");
> +
> +	igt_describe("Validate ctx_restore_post_bb");
> +	igt_subtest("ctx-restore-post-bb")
> +		test_ctx_restore(configfs_device_fd, "post");
> +
> +	igt_describe("Validate ctx_restore_mid_bb with invalid options");
> +	igt_subtest("ctx-restore-mid-bb-invalid")
> +		test_ctx_restore_invalid(configfs_device_fd, "mid");
> +
> +	igt_describe("Validate ctx_restore_mid_bb");
> +	igt_subtest("ctx-restore-mid-bb")
> +		test_ctx_restore(configfs_device_fd, "mid");
> +
>  	igt_fixture {
>  		close(configfs_device_fd);
>  		close(configfs_fd);
> 
> -- 
> 2.50.1
> 
