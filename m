Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC61CDB46F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 17:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC47B10E09A;
	Mon, 22 Jun 2026 17:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEvXcFO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6F710E09A
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 17:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782147872; x=1813683872;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dxOtRdhuFby4D58j0h7GmAkUGJ7eobTmBy8utRx+M7k=;
 b=ZEvXcFO483CoMejilUjowU0YPiUiOySm/XNMMQ3GjbjV7g4Qi7nJCMLR
 zwOCMu/8kZeQavwPdCUqhSagVucCqA3O0vrskmbWsm2R4SVGkfl/wuAFF
 Avv5Yx8NfY9WMn2XIf5kKqr0giFUDWFFZwd3LLRk9S1kGb12V4Q20DIZx
 C27W2wu5Xr4dWMSoVE2acdEZVWo1Pxfl0Y3DmUVHtWs3auNalyS65m2mh
 +/p6pR5aQh/nuwzl0H1rjrw+/+APHQ+o7RFPB1nQivXla/TmBvPP3RNxa
 t7Hm3djvXjbDvyx2Ft+BWSirphzUmh1Ntf16CCuGY4sbXl+Go/Y4qN49w w==;
X-CSE-ConnectionGUID: ow51yY3uRkC8cDY0W5wicg==
X-CSE-MsgGUID: Dgns7+GhQtONYMC1LsMK1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94001247"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="94001247"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 10:03:49 -0700
X-CSE-ConnectionGUID: pEF5MmR3R9mXYoC0LXTWng==
X-CSE-MsgGUID: PXPpRlZpRtKvzFZVSlT8Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="279466225"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 10:03:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 10:03:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 10:03:48 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 10:03:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=km9wxYw6EZ8z0pbUBcGKKtXJvP/q82cu+I6TmYcrix1ZBKfWkYGIu+AWitjUC+AOXlOneLdCJSM842NlhS4k/w4pNfPFwko5Jfb+P48ONyCezAkkMj0YlrNDeJPdsLlyQ+eCkQnvr9ULTK8FpGvmSQpGj4keJ3qYKe2+oNToCW/qCeuafolrCaCvJ4t+il7cN/hWvx2xMElwx2R/92vPtVMgo7+7gxB3ULjd6Y+uO36di9UwNKIPpU5EThTfaxyqMmry8B9RNbxnWbm3NitXpVE5DRnOewj0L+5D1A9lqx9whsW8x8usglQLxqoW39W36XG1AXmp4q84za+C4MEjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q80xj8AsVC0MmKxuksitpuX0S7xAxqug7rCPUGLhQ6w=;
 b=lTtfHDF+oSHDyP/53pAFsOolG5Cz1EXXFPkBptBQ5740jG5jKnTekeSyC9Bgj8oz/BaeMrI3Sk+tugS4NhjpGCt31vkh+WNU5H3abbWnW/YQXToVWP5gUfLYiamZgqcq/D7ktKxt3Q0KSfzDlZagpT8zfVKwW8GraBiq6urjUS+P1qcd7EWngXTIxfkh8ldYMmW3OC0MHzd+J/lhIMdC0YLFJMZBIZK9C8JGAKLizQmsCxBmaNLiVaAlAF/oJbvcaEnri6w/F1GviCvj4JrK99VpMyTBlawK4rt9KdQTxFRE3oKDgAuqiYA7/5nCeNgcGSwxox11PJVNXuYR2KfO4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by MW3PR11MB4667.namprd11.prod.outlook.com (2603:10b6:303:53::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 17:03:44 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5%5]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 17:03:44 +0000
From: "Yao, Jia" <jia.yao@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Wang, X" <x.wang@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe_pat: Add dynamic PAT index
 selection for pat-index-auto
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_pat: Add dynamic PAT index
 selection for pat-index-auto
Thread-Index: AQHc7hv53cQrBnEKM0+X5EhRqVgHz7ZK9O4g
Date: Mon, 22 Jun 2026 17:03:44 +0000
Message-ID: <PH8PR11MB80401D0D9F66FF36743393F1F4EF2@PH8PR11MB8040.namprd11.prod.outlook.com>
References: <20260527210052.161768-1-zongyao.bai@intel.com>
 <20260527210052.161768-3-zongyao.bai@intel.com>
In-Reply-To: <20260527210052.161768-3-zongyao.bai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8040:EE_|MW3PR11MB4667:EE_
x-ms-office365-filtering-correlation-id: 8c74fb76-ccbd-4975-5bf7-08ded08037e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|366016|376014|23010399003|10070799003|1800799024|22082099003|18002099003|38070700021|11063799006|4143699003|56012099006|10086099003|6133799003|3023799007;
x-microsoft-antispam-message-info: RWDSz/UxRyA2AMlU9d3StUTwfKHGvocKwPkncjh4BtToIqcPe2LSsXyU3J5awqBLQ2g7/dmytmeyiP8V4E3YFQOKXEQZI4mwk2CihnUr6J5z9l+9cvTvbIv18Hp+r3T81ch/Q2ueqV2TyLSCEci9P3Jd/RLtxNA9Ll00vyAKDJ/EAsAhFKCLRr8vrM6wlMSvpt3jAYHhXetaNrAloEg5KnmXWi9fea86iaRpUPEuHWZI9vB5ZTmeZDPbaGD3xGm0ko2/tcR+x2cbq3pNsHSdQWDnswHXc795e8k3QTcg6KD58sMUbi9uc8Z56p3miKsqnByT8bjd/lAYljqVOqR5wWKl8NfWtUFQEWw/XcSztbWZ9H0ypz7lRrjO32tAt5vX9Ie/Cd1qSW8xSLtYbbSV/dUGxzitJTjG0SuipAOb4JucKaw84c2qDVwB5IJ0HccKsHWfbnlg+iD13u5tBA0mso/jHnGLIle7Ew7l0zts5iCSiMOK1naECHYRrk6q5e75PiKJfylkaoeWiDCzGxX6TWG4R/W42znHsMcp2vTm7dYdR23EHwoJDhMKkfB0Bb1EIIvu6SJvR0rjGXHl7yPO7cx621jwVBQftAkfNGy0F2im/yNOpVLb5Mecf9EkvI0THD+tCBA/7ZndKT4VzmUfUIpcl5GAmIKTHYoceOHzw8IC8YVWQTBPT99FeHNKtfZ5tcIEaHIRicmy8K7uT6kwV3tP92WwNWQEH8SCLHTIW2k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(376014)(23010399003)(10070799003)(1800799024)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(56012099006)(10086099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J1piwPqxr+c8RAuRZbjpXsuHz0pqUzG7y1dIC96GgAwA7mvY0kqJsYbRnTWx?=
 =?us-ascii?Q?GyVMbne/3GNhY5yXyVCjsuv64G3TJsJeCpaK3cvrsVONWy5C5MoSZu5vSVvy?=
 =?us-ascii?Q?766kISjmulmeUIGowYUWGj00xSNqROxOaqf3UjHzbywIczEodqwiecdA+Izj?=
 =?us-ascii?Q?xWJZDGqI/7Eoc9PjfkaYy4xJ1XrSDG816jbB/KuFN9xK+wVb99himB2foIFL?=
 =?us-ascii?Q?prCy3PDV/vWnLMafHUv1HVRJY7ZC6seZRbpY1FYRcPixAOPqhYBfttxzzD49?=
 =?us-ascii?Q?eXKDVmBQJCbvBe0VP64g4yOdQogppjLgFMIOrpbTACsZBX4uSiKYTIFjm8pp?=
 =?us-ascii?Q?EaTqDNPBKiR7JBnIvyD54kgTbIRQUTj875l96byaHzbtfzH6yqzDvV66pPsv?=
 =?us-ascii?Q?k39LYcgSwn2JIH8cx1SLkwxZKyVsgCQxFaaQxPHtKl7Vb+AcyN8Uf5aNMFGF?=
 =?us-ascii?Q?+Lpiqeu8vhPjMv1IiLu0wXTzKA32FKcMcrQ1NngqYPZrvWk0+Czd3karkjA+?=
 =?us-ascii?Q?Ck4yuWNy3DgWpdCOYd3JhLa9km2ICsjeXIrq19NxDReEj9z9efw+q2Ft6omu?=
 =?us-ascii?Q?xCaXxhV8VOungqe8DJ2GxxG2p4C8CMCU/1HLM/iVsEdqHMzfndYZ3tMKC6K+?=
 =?us-ascii?Q?BDZA+T4SGCHZFEquVsLLhzfcfzLzqqMflvD2hxi/WrT4KG0H9vJ6OqCNZiz0?=
 =?us-ascii?Q?G7yJV5UUrbivUL7+7uLwwSEkYeyMd+avrzYQorjnZ6vWgTIsLlOEZVTu59us?=
 =?us-ascii?Q?E1zPnTVcqeiOREtJMvS/DdI6aDJsb2fCv2KbHGyToiMUJSL7VletvztJFu3g?=
 =?us-ascii?Q?fdrGPc4WJLMKWcip2YjuQL1Ipwkpo8W5gcokaxfRv8mKSH/Ski/kFEolvXmv?=
 =?us-ascii?Q?KN87BcizmZZZsWuUs1cGnvZXwuL4duWPSLmEbKQJXzLCorVgFR877nJWr2e1?=
 =?us-ascii?Q?QMnm78PAJ1YpZ7OC4AFbEG/+BVNdadMVh4hwx4GQHEiEMohTkIDB0ysXnqOL?=
 =?us-ascii?Q?iKvAPStWYL11Ut/jPf3GKCBw5XdXMvbZhsclDCrpWGDEFF9yOLc/eeNQQlLF?=
 =?us-ascii?Q?QDEDiMoEYOnkhL02MvPIh+zePmsISPiieAOGqIOuXHPpZQJpBFwZ1jEz2L1o?=
 =?us-ascii?Q?i6FNEhfkDMw1vMoC1LFwXcfk2nLE6xxnNNdPa+gWYR8bNkLy+GDwIdMbMC/U?=
 =?us-ascii?Q?tSrFygfxvixpkcvgSu8kNdVVSpFXekjDPjepG+cc+hlv1E0pcFLwUsjWj9Uj?=
 =?us-ascii?Q?EZ+WalYdGxRZj1h9eNzzfo54RjdUmB9b05Vcmj1TtugVMlYWcT2Fp4nn9Tua?=
 =?us-ascii?Q?wec5w2i09Lf/dRxqE2e2oFKY0H0QOYr1JLQ3CtRVQLWA29ECBKWIPGJEJgAO?=
 =?us-ascii?Q?1o1Jgk1AvfcWuSn9h21QIe3BDQGr30lZpjrYm/634eeHKT+/U62CxA51L7Bx?=
 =?us-ascii?Q?wkN1UaIDuCFRocAsJHWzu5kcT95dSHBSsf6XkXR87uplC4kzGMeP0KDfJGe5?=
 =?us-ascii?Q?VPiTkK0C2XTbTiNhOcysSHZMd4O6lcj3ER30pCIHF9kpU/w32rckO4/8sdRk?=
 =?us-ascii?Q?yWofPOn5t6ObRxDkTomslJKbFNowRddo7nNBLjlh9m3fcb3mWhDRVaFBZFK9?=
 =?us-ascii?Q?fCif6yurwiO7+5hWhQPLpcSp+slrFAqVdb6Pn+Fdij1ZTERagg1lbXl9RNYV?=
 =?us-ascii?Q?3bZ4QY2HlixoHj0bMhxsepe/99x13P4XFORjw8yAkOTY5Zokbkd69UNOrH+R?=
 =?us-ascii?Q?eWwNuPJFkgR0FJNEDJqJUoWhf/MaRFN/lpSqwuWWhbLQO3h+rIpZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cB1sSSwHXk8nNWdOsTL8Lky36iPN3r+oKmeNos/4vCqVXf+a1FY59DxCGZ/C/XbS1CkP3rrbl86dGZ9us0syTqYsXlGAmz0AXRp8neNErb5QDPU9wZeZ7ye0u0fAUb1PCUbw4qOk+F8vWs7RithHS3c3rZcMCtr60hYbzYI/IOWqJu2vPHfb8vDScEgiB2hP2eA8TeZ1H5NXmjdYX+SeKDBAMPiZVCOYoujMisS+GLkupCMPG0DzJvMyEGh+mIqMVhDtGlSVtwRQnykKf4lA6z7Ymh5sxWNEPEIJFfOjUsfMERTEzDHlHgQxPsHYn06DtrYPMQtZDHuAUKCLZcpjBA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c74fb76-ccbd-4975-5bf7-08ded08037e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 17:03:44.4878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lOC1G8biZ8Yg29blGTmF/mNYa21jEbhzkCydABR7XD7Lbg1XSydjrISxr9geL3RkCrL8GMKWAZ4YMZlbwXfM+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4667
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

LGTM
Reviewed-by:  Jia Yao <jia.yao@intel.com>

> -----Original Message-----
> From: Bai, Zongyao <zongyao.bai@intel.com>
> Sent: Wednesday, May 27, 2026 2:01 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Yao, Jia <jia.yao@intel.com>; Wang, X <x.wang@intel.com>;
> kamil.konieczny@linux.intel.com; Bai, Zongyao <zongyao.bai@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/xe_pat: Add dynamic PAT index sele=
ction
> for pat-index-auto
>=20
> Introduce the `pat-index-auto` dynamic subtest to iteratively test PAT in=
dices
> based on the hardware configuration, improving test coverage beyond
> hardcoded arrays.
>=20
> Build the test mode set by:
>     selecting a small common set first (WT, coherent, non-coherent)
>     adding all remaining valid entries (shuffled)
>=20
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  tests/intel/xe_pat.c | 159
> ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 158 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index
> 79f9a87aa..cff40d6b6 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -35,6 +35,7 @@
>=20
>  #define XE_COH_NONE          1
>  #define XE_COH_AT_LEAST_1WAY 2
> +#define PAT_NAME_MAX_LEN     64
>=20
>  /*
>   * PAT index 18: XA (eXclusive Access) + UC (Uncached).
> @@ -113,6 +114,7 @@ static void userptr_coh_none(int fd)
>=20
>  #define L3_CACHE_POLICY_WB	0
>  #define L3_CACHE_POLICY_XD	1
> +#define L3_CACHE_POLICY_XA	2
>  #define L3_CACHE_POLICY_UC	3
>=20
>  #define L4_CACHE_POLICY_WB	0
> @@ -448,7 +450,7 @@ static void xe2_blt_decompress_dst(int fd,
>  	memcpy(&blt->src, &blt->dst, sizeof(blt->dst));
>  	blt_set_object(&blt->dst, alias_handle, size, 0,
>  		       intel_get_uc_mocs_index(fd),
> -		       intel_get_pat_idx_uc(fd), /* compression disabled */
> +		       intel_get_pat_idx_wb(fd), /* compression disabled */
>  		       T_LINEAR, 0, 0);
>  	blt_fast_copy(fd, ctx, NULL, ahnd, blt);
>  	memcpy(&blt->dst, &blt->src, sizeof(blt->dst)); @@ -1345,6
> +1347,146 @@ const struct pat_index_entry bmg_g21_pat_index_modes[] =3D
> {
>  	{ NULL, 27, false, "c2-2way",     XE_COH_AT_LEAST_1WAY       },
>  };
>=20
> +static void add_pat_mode(struct pat_index_entry *modes_arr, int idx,
> +			 uint32_t pat, bool has_comp_en, int pat_idx, bool
> cpu_wc) {
> +	modes_arr[idx].get_pat_index =3D NULL;
> +	modes_arr[idx].pat_index =3D pat_idx;
> +	modes_arr[idx].compressed =3D has_comp_en && !!(pat &
> XE2_COMP_EN);
> +	modes_arr[idx].name =3D NULL;
> +	modes_arr[idx].coh_mode =3D REG_FIELD_GET(XE2_COH_MODE,
> pat) >=3D COH_MODE_1WAY ?
> +				  XE_COH_AT_LEAST_1WAY : XE_COH_NONE;
> +	modes_arr[idx].force_cpu_wc =3D cpu_wc;
> +}
> +
> +/*
> + * Build pat_index_modes[] test table dynamically from hardware PAT tabl=
e:
> + * 1. Read PAT entries from hardware
> + * 2. Pick common modes first (WT, Coherent, Non-coherent)
> + * 3. Pick random modes (shuffled remaining entries)
> + * 4. Return the modes array and count through output parameters  */
> +static int init_pat_index_modes(int fd, struct pat_index_entry **modes)
> +{
> +	const int TEST_COMMON_MODE_MAX =3D 4;
> +
> +	/* Static storage for results - persists after function returns */
> +	static struct pat_index_entry
> pat_index_modes[XE_PAT_MAX_ENTRIES * 2];
> +	static struct intel_pat_cache pat_sw_config;
> +	static char name_storage[XE_PAT_MAX_ENTRIES *
> 2][PAT_NAME_MAX_LEN];
> +
> +	int n_entries;
> +	bool has_comp_en;
> +
> +	int test_cnt =3D igt_run_in_simulation() ? 5 : 16;
> +	struct pat_index_entry
> common_modes[TEST_COMMON_MODE_MAX];
> +	struct pat_index_entry random_modes[XE_PAT_MAX_ENTRIES * 2];
> +	struct pat_index_entry tmp;
> +	int n_common =3D 0;
> +	int n_random =3D 0;
> +	int n_picked =3D 0;
> +	int i, j;
> +
> +	bool ensure_picked_wt =3D true;
> +	bool ensure_picked_coh =3D true;
> +	bool ensure_picked_noncoh =3D true;
> +
> +	/* Fetch PAT config from hardware */
> +	n_entries =3D xe_fetch_pat_sw_config(fd, &pat_sw_config);
> +	has_comp_en =3D HAS_FLATCCS(intel_get_drm_devid(fd));
> +
> +	igt_assert(n_entries > 0);
> +
> +	/* Step 1: Split entries into common_modes and random_modes */
> +	for (i =3D 0; i < n_entries; i++) {
> +		uint32_t pat =3D pat_sw_config.entries[i].pat;
> +		uint8_t pat_clos =3D REG_FIELD_GET(XE2_L3_CLOS, pat);
> +		uint8_t l3_policy =3D REG_FIELD_GET(XE2_L3_POLICY, pat);
> +		uint8_t l4_policy =3D REG_FIELD_GET(XE2_L4_POLICY, pat);
> +		uint8_t coh_mode =3D REG_FIELD_GET(XE2_COH_MODE, pat);
> +
> +		if (pat_sw_config.entries[i].rsvd)
> +			continue;
> +
> +		/* Common pat index type 1: WT mode (l3=3Dxd, l4=3Dwt, coh=3D0)
> */
> +		if (ensure_picked_wt &&
> +		    pat_clos =3D=3D 0 &&
> +		    l3_policy =3D=3D L3_CACHE_POLICY_XD &&
> +		    l4_policy =3D=3D L4_CACHE_POLICY_WT &&
> +		    coh_mode =3D=3D 0) {
> +			add_pat_mode(common_modes, n_common, pat,
> has_comp_en, i, false);
> +			n_common++;
> +			ensure_picked_wt =3D false;
> +			continue;
> +		}
> +		/* Common pat index type 2: Coherent mode (l3=3Dwb, l4=3Duc,
> coh>=3D1way) */
> +		if (ensure_picked_coh &&
> +		    pat_clos =3D=3D 0 &&
> +		    l3_policy =3D=3D L3_CACHE_POLICY_WB &&
> +		    l4_policy =3D=3D L4_CACHE_POLICY_UC &&
> +		    coh_mode >=3D COH_MODE_1WAY) {
> +			add_pat_mode(common_modes, n_common, pat,
> has_comp_en, i, false);
> +			n_common++;
> +			add_pat_mode(common_modes, n_common, pat,
> has_comp_en, i, true);
> +			n_common++;
> +			ensure_picked_coh =3D false;
> +			continue;
> +		}
> +		/* Common pat index type 3: Non-coherent mode (l3=3Duc,
> l4=3Duc, coh=3D0) */
> +		if (ensure_picked_noncoh &&
> +		    pat_clos =3D=3D 0 &&
> +		    l3_policy =3D=3D L3_CACHE_POLICY_UC &&
> +		    l4_policy =3D=3D L4_CACHE_POLICY_UC &&
> +		    coh_mode =3D=3D 0) {
> +			add_pat_mode(common_modes, n_common, pat,
> has_comp_en, i, false);
> +			n_common++;
> +			ensure_picked_noncoh =3D false;
> +			continue;
> +		}
> +
> +		/* Add to random_modes */
> +		add_pat_mode(random_modes, n_random, pat,
> has_comp_en, i, false);
> +		n_random++;
> +		if (coh_mode >=3D COH_MODE_1WAY) {
> +			add_pat_mode(random_modes, n_random, pat,
> has_comp_en, i, true);
> +			n_random++;
> +		}
> +	}
> +	igt_assert(n_common + n_random > 0);
> +
> +	/* Step 2: Fisher-Yates shuffle on random_modes */
> +	for (i =3D n_random - 1; i > 0; i--) {
> +		j =3D random() % (i + 1);
> +		tmp =3D random_modes[i];
> +		random_modes[i] =3D random_modes[j];
> +		random_modes[j] =3D tmp;
> +	}
> +
> +	/* Step 3: Merge common_modes and random_modes into
> pat_index_modes (up to test_cnt) */
> +	for (i =3D 0; i < n_common && n_picked < test_cnt; i++)
> +		pat_index_modes[n_picked++] =3D common_modes[i];
> +	for (i =3D 0; i < n_random && n_picked < test_cnt; i++)
> +		pat_index_modes[n_picked++] =3D random_modes[i];
> +
> +	/* Step 4: Assign simple numeric names and print debug info */
> +	for (i =3D 0; i < n_picked; i++) {
> +		snprintf(name_storage[i], PAT_NAME_MAX_LEN,
> "PAT_INDEX_%u%s",
> +			 pat_index_modes[i].pat_index,
> +			 pat_index_modes[i].force_cpu_wc ? "-
> force_cpu_wc" : "");
> +
> +		pat_index_modes[i].name =3D name_storage[i];
> +
> +		igt_debug("  [%d] idx=3D%2u comp=3D%d coh=3D%u cpu_wc=3D%d
> name=3D%s%s\n",
> +			  i, pat_index_modes[i].pat_index,
> pat_index_modes[i].compressed,
> +			  pat_index_modes[i].coh_mode,
> pat_index_modes[i].force_cpu_wc,
> +			  pat_index_modes[i].name,
> +			  (i < n_common) ? " (common)" : " (random)");
> +	}
> +
> +	*modes =3D pat_index_modes;
> +	return n_picked;
> +}
> +
>  const struct pat_index_entry xe3p_lpg_coherency_pat_index_modes[] =3D {
>  	{ NULL, 18, false, "xa-l3-uc",	 XE_COH_NONE          },
>  	{ NULL, 19, false, "xa-l3-1way", XE_COH_AT_LEAST_1WAY }, @@ -
> 1414,6 +1556,12 @@ static uint32_t create_object(int fd, int r, int size,
> uint16_t coh_mode,
>   * Description: Check some of the xe2 pat_index modes.
>   */
>=20
> +/**
> + * SUBTEST: pat-index-auto
> + * Test category: functionality test
> + * Description: Dynamically generate and test PAT index modes from platf=
orm
> PAT configuration.
> + */
> +
>  /**
>   * SUBTEST: xa-app-transient-media-off
>   * Test category: functionality test
> @@ -2275,6 +2423,15 @@ int igt_main_args("V", NULL, help_str,
> opt_handler, NULL)
>=20
> ARRAY_SIZE(xe2_pat_index_modes));
>  	}
>=20
> +	igt_subtest_with_dynamic("pat-index-auto") {
> +		struct pat_index_entry *modes;
> +		int n_modes;
> +
> +		igt_require(intel_graphics_ver(dev_id) >=3D IP_VER(20, 0));
> +		n_modes =3D init_pat_index_modes(fd, &modes);
> +		subtest_pat_index_modes_with_regions(fd, modes,
> n_modes);
> +	}
> +
>  	igt_subtest("display-vs-wb-transient")
>  		display_vs_wb_transient(fd);
>=20
> --
> 2.43.0

