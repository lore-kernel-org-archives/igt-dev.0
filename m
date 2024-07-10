Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D913FC2BD09
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 00:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A62D10E5CC;
	Wed, 10 Jul 2024 00:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MC+AlBib";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E89810E5CC
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 00:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720572331; x=1752108331;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4wv8Dz7la7AhJP2nTqcfwtcHUKh+9ltPiZtzhjnuSaA=;
 b=MC+AlBibm7DILz9CIuaxdM9yQvOBr5HIsk71HdcEh+4pKTzPRobyFmx9
 rOGvgDF0enebMbQRgWcoLG5AfUgcOxymRLOBezdDtWNCUGATJtFKlezHj
 KV7YGxUCbSD/zeKIoC+1kd+HSwNlXOoNCjf+fnVS2i+VuEPefc1Hm98z1
 g6T9imMEdzGUvS4yTPjSFyIDQmMFPnL5aGneuz6WPhEYNG8gjMcFBUesf
 OMOQ7iizT6iQTGTCU86DdFbkupNawZAAQpdIIVO8/FAX9vbIwt6QtGHM+
 Kuguumej4SWbywjmD2E6s7r40dDohcSex4+lopthhGpAOdE7bDNXCi55T Q==;
X-CSE-ConnectionGUID: 3qC3kGSnSj2fspACVmLSaw==
X-CSE-MsgGUID: rYwYdZNUQraMOWFcAJgi4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="21737863"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="21737863"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 17:45:30 -0700
X-CSE-ConnectionGUID: o0Om3pLUTw+SqbeQm8TEcg==
X-CSE-MsgGUID: zC2LaNzKQhS+/J8wvVdRyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="78770863"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 17:45:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 17:45:29 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 17:45:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 17:45:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 17:45:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSrQMnrSJImTW+/Ds5CWI6iHFZqcVQfbxNaxDU8B51bWXStQuqByDxFX6u3T4jww8zP8KDN6Xz44GnrgBPi23vWlq/4ylI1BLzV69qsYFyzcfcL2F8QDRUtGuaGcPF7DIm+KVxmBx9Knfph5GbLx8EJnxu20hk0pFFYi8X7z+qxiIzxvTjY0XG2EJoNf4SmcuBs+TTOPkHzQ2haqGwS12+sUP2b0M4VpM8FWL5MaxO1+OFolD7mdf/jnNVPGR+kc8zVZYa1EsYvwmYr5js33EqDaEKEkAnkn21VHJyYLwfei0oTGIP6TFKPBY3Trf+JvO2AWVNu2eo5xOK3lU8HsEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBxitxGOmVU+bNWuo2VieGm5weonPOrGHSP6nPyy8FA=;
 b=FralFz87fSHquI9yq/0rwvRBkUth06Yqpm3rcvB/jZF13hV3hx8k2m60JJcveLaQI6j4egq+m+QdhqUPlKJWSEkYgCSbCvJUt2kLQlOeZ1xAqxRHKLxFyG8UbwSOm+k64ORH+UDfbf6zXCtWu7nLk2yFF8GjWsTwAFIWPdZQaCcagLYstNeRgMGayU98lNtj2+KaDLnEw+DXl1n3L7uiCbhUqFmrXzXzGTrAb3fT9oHlKBjgYjgLqJh0FKkevXD5BlhthSZQnnvsKV1dixocLtvxi8NqSgV/aQKi4z2MPgVBedZPmBVc/dcMfsQO3VTvMD62MzeWGM0DB0b4JH5HFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by DM6PR11MB4546.namprd11.prod.outlook.com (2603:10b6:5:2a7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 00:45:27 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f%5]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 00:45:26 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] xe_exec_reset: Wait for spin batches to start
Thread-Topic: [PATCH] xe_exec_reset: Wait for spin batches to start
Thread-Index: AQHa0irOVZ/s+LtMzUmyylKZ9PGXI7HvIHtA
Date: Wed, 10 Jul 2024 00:45:26 +0000
Message-ID: <BL3PR11MB63621DC2C81D22C5334F6F049AA42@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20240709180726.1033327-1-matthew.brost@intel.com>
In-Reply-To: <20240709180726.1033327-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|DM6PR11MB4546:EE_
x-ms-office365-filtering-correlation-id: a1893e83-9bd5-463f-80fe-08dca0799726
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?9ALThNxH5YGchULdI4rI0xAaEBHeM92Q+uD1N8eb8Sw52d07MA+q/VjEhTdt?=
 =?us-ascii?Q?u1sNOkBz5j99NzPM7TYgRPv8lHtjKjyiGL/tJYEAhPqS+6xPQNpZ3ZgvEybr?=
 =?us-ascii?Q?AT3hESSyA/za2cIh0WkjiSIDouyR1meKCNcICkv3l6klBK71zdjUkLoWBdsg?=
 =?us-ascii?Q?8Nl4amZxmw230dC3x8Rj3KdQjxEiLHGP1HboAWoRCUTPxMIfyXX9stRcLMBg?=
 =?us-ascii?Q?lW6U26CCLjUSBathG8HzY3bUm5+YKX2fjULVfBkmbZ872nZeDrsTpG78kjOs?=
 =?us-ascii?Q?yqd5xxan44fgIaGRFKTqbM9S11fHaSNJSf71BKOHGfiTh5i84MhwyNlYGXry?=
 =?us-ascii?Q?nyQCr2SVwtDx8KAMEn1QX6eHXgHDocI1Bq0+5kEI9vlaps9K+VZFaXYqbdxR?=
 =?us-ascii?Q?shiDkV461D/a4ijVMbgiAs3O3wn11tfP+XCaPogRTKWLS2imwMqdNYIy0CbC?=
 =?us-ascii?Q?qhYokI/Q2M+lMP+4ta0qD+G/hROgjaCBE2vtEIYCCVwSJBpTG/ML7F5N3r86?=
 =?us-ascii?Q?Hy2RPovw3xZQE8g2O2OKMNqDa9/KnN0ZmKSLNskJPGA8lXYfuFeQfH71XRr/?=
 =?us-ascii?Q?+mBAL86JKSoHFVmBOXvwJ3kUrT7vGXA1pKYNCsvIxqlkKweRlhm5RBdZrHxw?=
 =?us-ascii?Q?1a77vThEtuUbOMRcS567MuwYDTassq1+RGVtRnVkQcoYA5AFCXDxiPFg4EGB?=
 =?us-ascii?Q?rx+1y5tqwD7FOkJyP0EAJN5hmDXtLlAUCWkzrLYSXaf8aX9d+VddEMddpZfp?=
 =?us-ascii?Q?2zoH4OY8h74AjcxWQLLcL7WIJabLOZDfn+HqTgvGxHfq5CYVvkz4r5ybd627?=
 =?us-ascii?Q?xqnwMQEsL2Qp7ScZxrjTedK1zz4x1c6z6PIP7DVUs6BxC3HaPNEXep4vxdq7?=
 =?us-ascii?Q?DGxeDTvdRSo8JikdtTeC/xbrCrFdHq/mdGF4ZQbQvEL88nD5FzLLXnsRWBae?=
 =?us-ascii?Q?g5AJjsgvFEZFcjJKmHE66prlXNmZz3fCQfkI/Cifj+CB7Qg3CPoQDLOzd99J?=
 =?us-ascii?Q?U6VRdc7AAdV16AKUlShb1GTSESuiLAHajaUGQM7cg6dyOWddldjR+1f2tusB?=
 =?us-ascii?Q?TO71yuid6Z2BEPjQUeHe35L9J/np3q9GLIuiFXnSp6Zp4B00GMzOFWBnJhXi?=
 =?us-ascii?Q?UrMzrimSbvFZSMB771Z4zxvP/bX7Snd5tFEFwzpx8XU7RwHL5z7jKvkkXMCZ?=
 =?us-ascii?Q?VskB8tab23bDSBIhubbA8nS4mGH5epTYkWSflpMoHl8U7XSUrQlUw6Ky9/Nz?=
 =?us-ascii?Q?bPD0ekChWB8GbE71PZsHTcM9Y2pP0vnJBA55iGXQHt6vUd16uTLVCvr9AtTf?=
 =?us-ascii?Q?SbKDg/Zypj9UTIv51v5GFeaoUs5y+xkdzUa9UGvuZNesrZYzfdCI3h256l8N?=
 =?us-ascii?Q?jpBLD0ZxvU2i2p6L3ovRovD5j11om9JtANqBOlFxxLQCBJJ04Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NZ01cunRKbWQIt+0dEw6txlIVkxF/CwlTrYMydOioTSvAe3893D96K3CD4g0?=
 =?us-ascii?Q?8pYInOiaLdr8g6CbktBxBJURfN4RUEnJxDacP5pKnNafOx57jPEpHDnuj/0o?=
 =?us-ascii?Q?lTQtIyOeMZFtU709Jpem5jDbOTsseBrCTlkQ15Tc5+tq68OBYfrvhxw69Mlp?=
 =?us-ascii?Q?Gmw4zHAdtQms/73144BrUCWWmZCcNCQ/IhLW1o5zVNK2oEcBPProbO8evHeL?=
 =?us-ascii?Q?JbHjArFfNj1reeTRuQxI35rbZuCfGlSJM4d/KpebhQWv5+ObthTZgvP1Vt4A?=
 =?us-ascii?Q?n6cdk62b1Nlclf96wt6IWq8pukA7dyAtYaLoMuhyXfJ2HiFEsmdMuV/gaKTo?=
 =?us-ascii?Q?6AlUxaJ20GgpQddpl3F/yh/oapIHNjWr3RXYRvhb3MvqfTan1pq2YhGnxkLz?=
 =?us-ascii?Q?cgq6wPEPCdLYeNmfu5nspcBQN+hNzfx5VhBr8OENRoy5wKlKiRhoMoHT4c+R?=
 =?us-ascii?Q?H/42NWnTtZO6kiRvB0sQIsP/l8YW9MsvjFbbg773WuPSa+RAcSvsCf+F1Ify?=
 =?us-ascii?Q?EZz4ZCYDU44yIyeXxrOqfBZrfcFTMIBShvUoTRNMwmxl3UFwtckSEkIrA4Qf?=
 =?us-ascii?Q?PqEeLWCbqZzhvwKYWS/5mPnygKVEJDaLELoJcASjkxu3aodE79pw3Ey0YENV?=
 =?us-ascii?Q?CruFUrZkZ4/PaonJ9EERYhnik6WuCFv1EU89P+sXrCCfD5qtKWRHhVVOA80k?=
 =?us-ascii?Q?GMS4ncRo/faIqNtUyxNxzc7Ce21YI/dE6jdRVgyD4jnzfs40aV4w5EvvlmrV?=
 =?us-ascii?Q?Zp214jCHZrvKul/MDFbGPBtr4TWp2RlVht/bOQWIMvIF4yRoG/bPQahNI4rH?=
 =?us-ascii?Q?tkiL2dzGk62iIFMw4g0VHZdQiEwWU32OASYIrEysTeEkJoAtHLPDEEDW1EqG?=
 =?us-ascii?Q?XF64kXJSPfMZ+NN2urThd2LEPehSquwS+ut2zXLnLZufbGQrJ95KgAgNAC2S?=
 =?us-ascii?Q?ugxwajNdlJphTgdtGcEpglG3yIULcGgRPeGsq2Vzo1SvUG+MBeVsVlZ+yn8/?=
 =?us-ascii?Q?Utq/DP6a5OMkHVjKI/S8w1PoilIr/RKaH6PvDCFs7c/5d6PzJ9hzEfh+O3S0?=
 =?us-ascii?Q?5vbzmvQQXuPXzktTLRJENYc/jKXE4p4zPh/Nih49PSuCZxURWQXDXRZkriU7?=
 =?us-ascii?Q?1C8hGigKVVcrGXtMyPn3FGWL4RfXI9uAlhvsEY/R6WUvxBurR+gjCAumlqqp?=
 =?us-ascii?Q?6+Ayu4TFBpovzDbCSaJ1ZO2XYU2KujfMwDM4lLX25zG6SSncCJTrR4Ur699P?=
 =?us-ascii?Q?M1Hy1LBvr53rdMJT7h8TSPSN7CZ0wjghIpTPkgCie+O4yL9VelbnmYI8D8hJ?=
 =?us-ascii?Q?p+2poa9LvSH4zxYZyTt1QIR0HmF6jF4p9DN4vMj80aJOpId6462wtI3VXbkW?=
 =?us-ascii?Q?FXtb1Wnn+/bmVyp/vsj9QJ7sqwAClrPwSxNNHaAJ5GQKZaG+ITqcwvWH8S1G?=
 =?us-ascii?Q?BGDkUE26gE4uwOGlPZCrk3ctufSGTgMmJZr3/lEMLlRpsYN7KqoVTBZ29a2D?=
 =?us-ascii?Q?Hb+8dM/R+tYZMiHviARP2p4hh2T29DzAzKW76AKpMsDPKXceOr1sj0xCDch4?=
 =?us-ascii?Q?4IENdb4SSXYT4Ilx85I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1893e83-9bd5-463f-80fe-08dca0799726
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 00:45:26.6833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GgjOQ5w7G2qrm6+vHr+7+XzVs9XGpOKOCckc1BlcAFzPC9+HM9VXOm/alm6egUczG/AsPcK+krJbN/E/IQfH6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4546
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

> Ensure spin batches are running on hardware before triggering any type of=
 reset.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Fei Yang <fei.yang@intel.com>

> ---
>  tests/intel/xe_exec_reset.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c in=
dex 817b82cdef..dcb22f275f 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -236,6 +236,10 @@ test_balancer(int fd, int gt, int class, int n_exec_=
queues, int n_execs,
>               if (e !=3D i)
>                        syncobj_reset(fd, &syncobjs[e], 1);
>               xe_exec(fd, &exec);
> +
> +             if (i < bad_batches && !(flags & CAT_ERROR))
> +                     xe_spin_wait_started(&data[i].spin);
> +
>       }
>
>       if (flags & GT_RESET)
> @@ -380,6 +384,9 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_i=
nstance *eci,
>               if (e !=3D i)
>                        syncobj_reset(fd, &syncobjs[e], 1);
>               xe_exec(fd, &exec);
> +
> +             if (!i && !(flags & CAT_ERROR))
> +                     xe_spin_wait_started(&data[i].spin);
>       }
>
>       if (flags & GT_RESET)
> --
> 2.34.1
>
