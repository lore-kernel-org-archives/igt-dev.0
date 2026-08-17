Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22756C5B572
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 12:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D7C89D56;
	Mon, 17 Aug 2026 12:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBKVU0jL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B397710E799
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786970730; x=1818506730;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L7d3tTbgrxGzrly1C+FUDgthpbVav+nYWk7XUUShamI=;
 b=lBKVU0jLcgYhefh1nA6eNWSNVpCtz9lPSJ6HmlRsqbfimqfTZAM7ofV3
 UhVb5nsbnf8wlHLtIGkIfP0Z7I6vaeQSdj6p4X2Bs1vEylL7WTko/Po7E
 QbcSIkXFmieSK8MsWds0V+Si2PxXEWz8k+Ge6VoqBsOJzIScbjnkTeckN
 ftNc5I0RQuDaMhJnWcmAJkNaoMicIoi17Y/rdIetLF1m/6lPZqb2D9A68
 Tj9cDba60hFrA9MBiEyRxS4gWPYsvkE889vbJrz0tabbsn9AXi+ZbeZQQ
 HFvkiu1eD7i2W8TD/g0byfbCQzVbyTGdEmSEIWa+DjWG6D3CO66EFs+aS A==;
X-CSE-ConnectionGUID: zfLx1SzRQCqFY2ILomI3Cg==
X-CSE-MsgGUID: 14HfxC6lRR6J6nqr9p8qbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87568945"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="87568945"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 05:45:23 -0700
X-CSE-ConnectionGUID: chzlR8Q7RN2yd6IfIbhYxw==
X-CSE-MsgGUID: VDs3DBSJSYqx2f7XOm41HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="268406372"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 05:45:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 05:45:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 05:45:21 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 05:45:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLy7Fqq5t9LncyEM1tSJP2mjq6x6eRJSzL4AMbCWKHt4k0w+YEYUL4oE8G8kEEwWP2Ra99xunxvtq7ave33zUmPFYNqEktkTvPGRLUxPlQ5h/5iTCD5xTPo+CL9YPGGhEoPm0zl0kdB4b6HjVTIx3IEKn+upz2/7HXnAVfLw2umbgcntYoxOlYVzqfAVdHAW3o6DajcUniyL72dXHeAhJGTs+w0bHWRggXKZmqnj3g8aqjyoy1L9Fme6TYSShUHBaVM6Djo/bKdaWK3hZsh+2nAon+JhQeHbF7WX0dAYnXMVQLytEEwslhc7EcKv0x7UAO5PirXTGXnF47bK9xk9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hW0X+47z38tp3LdpuQlJUar1sYpXA930dxATS/bkFE=;
 b=jwApeNBDz4o/4lGVYB/DxgLvd2Lujhz6AXr/NOssUP3jtEiHj7b8aeY6MXRQ8uyXHBKHFFkRiGSNlS7X+l3tO6OREeAW7/AV5d7j5lagWeBxsu9LyAHExd59YeoUJ+2s3V3WyVpqOEcQiBDlJeSvV5+RBMzeQdo/40+zDAFgvdQLWmk4KnhFoK/FdRzn0ZIUxfcwjR9GWdNrdToI+Xl5YVZLsXcanycu6Y0cdf87fxgkObReIJL6yuZCKYJcE0a8mkbaGEA3Wo3BTbTnE8/kuzIwfg1nQJvnUu6UyntuTgoZfwKv6RsruXOImb168NTjSYu5v37xrsyURpG+4Gcb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5564.namprd11.prod.outlook.com (2603:10b6:610:d7::18)
 by CY8PR11MB7172.namprd11.prod.outlook.com (2603:10b6:930:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 12:45:18 +0000
Received: from CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb]) by CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb%3]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 12:45:18 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Chauhan, Aditya" <aditya.chauhan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Update Core Blocklists for LNL,PTL.NVL
Thread-Topic: [PATCH i-g-t] intel-ci: Update Core Blocklists for LNL,PTL.NVL
Thread-Index: AQHdLjbE9K7Tn3Boq0yoA3SxP7MkwraiKNyw
Date: Mon, 17 Aug 2026 12:45:18 +0000
Message-ID: <CH0PR11MB5564F5BDD9676AD6B0AF2E4B98A72@CH0PR11MB5564.namprd11.prod.outlook.com>
References: <20260817105411.1695841-1-aditya.chauhan@intel.com>
In-Reply-To: <20260817105411.1695841-1-aditya.chauhan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5564:EE_|CY8PR11MB7172:EE_
x-ms-office365-filtering-correlation-id: 87b8f36a-ceed-4314-2314-08defc5d64b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|3023799007|38070700021|5023799004|11063799006|10067099003;
x-microsoft-antispam-message-info: cuGiM28JXpCaRc90Gra6/1Lx/bUpBekWZNwljMkt/Xr0GAv2ZHbLSV4DrwDkuSQL72SErjor/SjFFD2sgyZ07jxUsfn+VlYRdwADA9fCn8AGQfe0YcOJ4gGj9iL9lbPq3Npy89vw3oJms+2e3ius6aInCJ+4wySl5SV4eukykY7PiS3w2i06Dev2sTKGzdzuVwMx0fYgvAC/D0x6WNQ0AWc+IZzvXTisILAXZAYnriRkLveTLGEb8y/+UlKZ/p+Y1EKqxM7QR0fBud7yY8OL7ktHUsndhVCRyrZ2lZko1v+ufGOY6gX0X31WZfGnWT73MtLGmMNdLF70fDzRHbZDgevk/Nuw8uAMvnEVETmxJP82TFzX761tSHbw+QVa4zyppbJ8SQOZBWMnakQKHAnfZ64CJnbCBYymav1WmUstdsYJIDFpEJaDKv4YSmxMombSFqIu1W5dm2DnXi5VfiNXSNQyn1uCVwAeSq3xKO4Ife0QWX/2VRrRNWvXZLVypFq8derg9BVHJ6GwJst1RmmND6C08gLhQVMLs1tHrRBYf5ESnqu5IrczP1RgFXsuQSsDWuaeQ44ALz1dsiMEaCg654h0AwrIVyrTuwnL1P2OyK3ZcU8Q9ds6dZx0U1MhIG4ducGpRtsLcqmKkxKoCdjdUXT1qiLVcujXey9We6o9wTbBvM5nXsCZdh+zBasbV+JnT4qSJlKVyvC2DyYCuJ9jYwxURTxW4zI5ZOHf5a8JaLI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5564.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(38070700021)(5023799004)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WsHd4nHj1tawOP/5zhK4hO+wPC13IhnxYktu7pRdREZ2MXVZIuVuC6RNEBzo?=
 =?us-ascii?Q?VpuemNW+DOEPma+SBwukBbFCmrgA6FDHO2Ml4kgYDxvRJfoEINGoDRIrG2sQ?=
 =?us-ascii?Q?UGHgeT7LDDVcD9GQc3jnB4Ens8AVRoR07VtICniNfgsVLMkdUM4Qc/EPc0dh?=
 =?us-ascii?Q?RRBhXFIIoIJqg5jukoxVOhhWbQ227bDuCoXhurlqN9GIBglwli0JWTGiRGPt?=
 =?us-ascii?Q?clE8LCNoYvCnvMFGB5N40ilwmpIEKGcBEtr9n+8JEgLtmVkAwTwqGgKc4y9Y?=
 =?us-ascii?Q?Hc9BgxSlWTAJ0UxUEuF1eVYrnFSpnAvVnifhURuPlvWnKggVgAO/+CbsxGB8?=
 =?us-ascii?Q?/hWAxpSw4uYQVkkRHu+S8KDiQx0NnwSjbX0MigSLCs9j62q7AIqzaZUXfWY5?=
 =?us-ascii?Q?uDHGhs96bWP7ndeFZIyvWq300rxIVtvWCwpUjFdviBVFTovmtsYYiVgdRcd4?=
 =?us-ascii?Q?lFADEMtxHQEvDp+piuWzZtzQk1GV+wcxOvElz+PEh1XFZy3tC5OvEVyp09AA?=
 =?us-ascii?Q?zVPiWnYJbEfm+4DihaEVV6ZtYe0ZqpH9aCg8K51wSaiZN7rEUKiR3Mt5I6SJ?=
 =?us-ascii?Q?FU1s4fj/4tyWMPA+uj0T9cadLHiSYOOoHG+dIhsktC9Ynw+a7nNKdSWe6JOm?=
 =?us-ascii?Q?Rg+8Oaukigs9HrcNX5OUUItwUOvRift7eGaJd3tNAnjCyG+XmR+jlOjsilfu?=
 =?us-ascii?Q?O0itSoD9l8Mc4mP6zyqCOT/bARnXdYaEQJx94K+At+YnDoQqs5rLw/VEK3OC?=
 =?us-ascii?Q?mE6XCrdUvD644bmbf4R7MWutpnNGFZyFVuXxvlChy1ATOPhImwkH5o6P5sVt?=
 =?us-ascii?Q?Nlg1EK9JmSR5S03xKnmU1uvlOcQMDD2zN1oRHdd4Ajsr6Du1JZOgoj7xufNQ?=
 =?us-ascii?Q?cup/qJW05O/MNwao7WHxRhLWKpgWlEze0riKr27qbB9vhOZP+i+eD9ujfeun?=
 =?us-ascii?Q?4ZTVNLhF5vZPtTWWSoG3sPAzJ1PyHH76umrTHWBlvRrGv86fpnWyqbFkg5Hp?=
 =?us-ascii?Q?f0/B9oI0o3cZ8oyB4CDdfMiomKvyyK1nFFRlYqxd9TJy2sXCzeJlWuPITuUw?=
 =?us-ascii?Q?vsiV/Is5Fv6ERrpRtH5GYXWxk9F49dhUlk2RHZgRj5j0RV2DIX0AII6AEXhH?=
 =?us-ascii?Q?kC5hBhzd0ho6yRqDIunwdoUKMm5j33Ms0RkB0UkQQyQITq2gh73pmEUutK/A?=
 =?us-ascii?Q?paBLvDJx35Oq/qLlMN7kr1uZKJuBgv2XPI36lK5u0djX5hoOKUynqM+Q5IhT?=
 =?us-ascii?Q?LOepi3h0qtyJ0PlPDEENqrib6ES/NuQRj9ofI23rBXd5piOfZnUvjqKdURav?=
 =?us-ascii?Q?IUvARePn0P1XwWIOLDtAQc157QHkup7zWADQ3qOcblSEOsgdyea2aDbeYIrO?=
 =?us-ascii?Q?mrGq8X43Wz5/HbmwBlurkzoDfcYcojukZzm6o1wdbLkxS7lrADu0C2RxnELw?=
 =?us-ascii?Q?H/068ZvxVosTZzQDAwV6SAMqKEiGJLLKQ92okS31ZO9MrW3UB93rcubiz+md?=
 =?us-ascii?Q?C8IFlnBm+/Dp5mwkVN+z+fHsNAQgTqXV0vexzANv8iNQwdI7SdV4fFwPPYu3?=
 =?us-ascii?Q?zIJ6AmP3Jm2nsmExZEzGVJ9zx6BegO2qmAhSNxuvwWPFNKtGg69TQlren4/o?=
 =?us-ascii?Q?qPI27A/smJckU2g1VAb4CZScB2urwa0WpZENwV36iVfOSF3Ux2mLtnq2nJtO?=
 =?us-ascii?Q?DoiejS2HnaaxT9FYZHUDr4pjSpMi6/12HZRhTn6D3+Jr3v/DUPuQipaog5ig?=
 =?us-ascii?Q?AarSwl5BC2vFwWZfiEiwSiluECwXJ5kOCKcCi9vKXQquNqoLQqqaC/ehsu48?=
x-ms-exchange-antispam-messagedata-1: GiwDi60Jpnxlag==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PnTFP4Psjf0k/IcPt5nfqkaC0Gg7gMf1ydvCKr3+Ue/UVGzHAGmza2JVC4BjN3Zetfh/5fGh+9+UkifaP7mYiVuZ2Hm52QKLYynCXsMwMkZge1+zG+yJgEVmr1vGXP0NownYPc7fwbXGnS4dE6YTbmC+wpcA3rPV20011F2EkIx2Nt3Zh5AoPzSYA2WnONdSM5gMe21diEcosLySmoQbvq6fUbEhRr0vp9vVzzCzw0bur+dy/ScNnOue+FVBUhebMIIMMnwCmSfebs6A2E/PBiyIvyoPfk/cJoUOXgXmznrW4a3eIjDPhrmmam/vO3hvay8trcgC9YUAqMUfTZP2Yg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b8f36a-ceed-4314-2314-08defc5d64b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 12:45:18.4642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RZEL2WmBJKIywzEYUcw+qBAeXubh2O4LXB9i63ytZrgFSLgi3LZCliXilmdgSkXjwx8WaipjXbKUNU4pf6AQh7cPE0TzPEcN2zBXb5Y6GX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7172
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

Hi Aditya ,

> -----Original Message-----
> From: Chauhan, Aditya <aditya.chauhan@intel.com>
> Sent: 17 August 2026 16:24
> To: igt-dev@lists.freedesktop.org
> Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Girotra, Himanshu
> <himanshu.girotra@intel.com>
> Subject: [PATCH i-g-t] intel-ci: Update Core Blocklists for LNL,PTL.NVL

Change LGTM , minor nit commit title needs to slightly changed . There is a=
 typo.

with this=20
Reviewed-by: Himanshu Girotra <himanshu.girotra@intel.com>


>=20
> From: Aditya Chauhan <aditya.chauhan@intel.com>
>=20
> Update core blocklists for NVL,PTL,LNL by including vram dependent tests,
> d3cold tests, s3 tests, mgpu tests
>=20
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>  tests/intel-ci/xe.lnl.core.blocklist.txt | 15 +++++++++++++++  tests/int=
el-
> ci/xe.nvl.core.blocklist.txt | 20 ++++++++++++++++++++  tests/intel-
> ci/xe.ptl.core.blocklist.txt | 10 ++++++++++
>  3 files changed, 45 insertions(+)
>=20
> diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-
> ci/xe.lnl.core.blocklist.txt
> index f921ca3a4..c1d2f425c 100644
> --- a/tests/intel-ci/xe.lnl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
> @@ -28,6 +28,15 @@ igt@xe_pm@d3hot-mmap-vram
> igt@xe_sysfs_tile@physical_vram_size_bytes
>  igt@xe_vm@out-of-memory
>  igt@xe_compute_preempt@compute-preempt-many-vram.*
> +igt@xe_vm@overcommit.*
> +igt@xe_madvise@atomic.*
> +igt@xe_pm_residency@aspm_link_residency
> +###############################################################
> ###
> +# Valid skip as VM_BIND decompression and the compressed PAT # index
> +variants (wt / uc-comp) require VRAM
> +###############################################################
> ###
> +igt@xe_ccs@vm-bind.*
> +igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-(wt|uc-comp)-(si
> +ngle|multi)-vma
>=20
> ################################################################
> ##
>  # No d3cold support for LNL
>=20
> ################################################################
> ##
> @@ -43,6 +52,11 @@ igt@xe_pm_residency@cpg-basic
> ################################################################
> ##
>  igt@intel_hwmon@.*
>=20
> ################################################################
> ##
> +# Survivability mode is a discrete-only feature
> +###############################################################
> ###
> +igt@xe_configfs@survivability-mode
> +igt@xe_survivability@.*
> +###############################################################
> ###
>  # Expected Skip for xe2+ paltforms
>=20
> ################################################################
> ##
>  igt@xe_media_fill@media-fill
> @@ -57,6 +71,7 @@ igt@xe_pat@pat-index-xe3p-xpc  # Expected skip on
> integrated platforms
> ################################################################
> ##
>  igt@.*@.*multigpu.*
> +igt@xe_multigpu_svm@.*
>  igt@xe_peer2peer@.*
>  #######################################################
>  # Expected behavior - CCS mode enabled only for platforms diff --git
> a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.b=
locklist.txt
> index b36921519..2f64bfd0d 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -21,6 +21,16 @@ igt@xe_eudebug_online@writes-caching-(?!sram-bb-
> sram-target-sram).*
>  igt@xe_compute_preempt@.*vram.*
>  igt@xe_sriov_vram@.*
>  igt@xe_vm@out-of-memory
> +igt@xe_vm@overcommit.*
> +igt@xe_madvise@atomic.*
> +###############################################################
> ###
> +# Valid skip: Flat CCS / device-memory compression is tied to #
> +dedicated VRAM. NVL has no VRAM, so compressed-surface bind and # the
> +compressed PAT index variants (wt / uc-comp) are not # applicable, and
> +neither are device/global atomics on VRAM.
> +###############################################################
> ###
> +igt@xe_ccs@vm-bind.*
> +igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-(wt|uc-comp)-(si
> +ngle|multi)-vma
>=20
> ################################################################
> ##
>  # Valid skip: PAT index tests targeting older/different platforms  # The=
se PAT
> (Page Attribute Table) index subtests validate @@ -63,6 +73,7 @@
> igt@xe_huc_copy@huc_copy
>  igt@xe_exec_balancer@.*
>  igt@xe_oa@oa-tlb-invalidate
>  igt@xe_pxp@.*
> +igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
>=20
> ################################################################
> ##
>  # Valid skip: test applicable only for i2c capable systems
> ################################################################
> ##
> @@ -71,6 +82,7 @@ igt@xe_pm@d3hot-i2c
>  # Valid skip: multigpu/multitile tests are not supported on NVL
> ################################################################
> ##
>  igt@.*@.*multigpu.*
> +igt@xe_multigpu_svm@.*
>  igt@xe_peer2peer@.*
>  igt@.*@.*tiles
>=20
> ################################################################
> ##
> @@ -80,6 +92,14 @@ igt@intel_hwmon@.*
>  igt@xe_mmap@pci-membarrier.*
>  igt@xe_configfs@survivability-mode
>  igt@xe_survivability@.*
> +igt@xe_pm@.*d3cold.*
> +igt@xe_pm_residency@aspm_link_residency
> +###############################################################
> ###
> +# Valid skip: S3 (deep) suspend is not supported on NVL
> +###############################################################
> ###
> +igt@xe_gt_freq@freq_suspend
> +igt@xe_pm@s3.*
> +igt@xe_pm_residency@cpg-basic
>=20
> ################################################################
> ##
>  # Valid skip: EU debugger and SIP (System Interrupt Protocol)  # support=
 is
> not yet available in the kernel for NVL. These tests diff --git a/tests/i=
ntel-
> ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
> index dc094e7e8..2574c0cc9 100644
> --- a/tests/intel-ci/xe.ptl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
> @@ -22,6 +22,15 @@ igt@xe_pm@d3hot-mmap-vram
>  igt@xe_compute_preempt@.*vram.*
>  igt@xe_vm@out-of-memory
>  igt@xe_evict.*
> +igt@xe_vm@overcommit.*
> +igt@xe_madvise@atomic.*
> +igt@xe_pm_residency@aspm_link_residency
> +###############################################################
> ###
> +# Expected skip as VM_BIND decompression and the compressed PAT #
> index
> +variants (wt / uc-comp) require device-local memory
> +###############################################################
> ###
> +igt@xe_ccs@vm-bind.*
> +igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-(wt|uc-comp)-(si
> +ngle|multi)-vma
>=20
> ################################################################
> ##
>  # No d3cold support for HW as of now
>=20
> ################################################################
> ##
> @@ -48,6 +57,7 @@ igt@xe_configfs@survivability-mode
>=20
> ################################################################
> ##
>  igt@intel_hwmon@.*
>  igt@.*@.*multigpu.*
> +igt@xe_multigpu_svm@.*
>  igt@xe_peer2peer@.*
>  igt@xe_mmap@pci-membarrier.*
>  igt@xe_pm@d3hot-i2c
> --
> 2.34.1

