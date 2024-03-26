Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D57C54E67
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 18:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97FB10F1D8;
	Tue, 26 Mar 2024 18:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mw5qzY9t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967D210F1D8
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 18:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711478800; x=1743014800;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tscow2AT+npXP2CyFlN8Aq65d9K69xmHgqLHm23UMYg=;
 b=Mw5qzY9tSAk+dolrwOmP4EGmnT0I3bTsUkyRww6zhtwAORPKzCEQZYBq
 Jsa+sTDs06gM+dqdYU6e+4p3JReyuLaw62bU451n7uX0KfZz1OcXr907w
 uEoPd1f6WLNpEqpkbM+DMTFk4vvEqNqJh2jbdPP5XtD6dPiEa1RUZia06
 RF/P4vMPEmpdza1C+HMFL8yZVF3OH46TmjjiXbvvBzKRMdjaQ55e8SawD
 nztbSGj7UNKlSwSE+nCACKFEeQsD9NHvTCL+/YPn9tLPwBxisAggzW9wM
 FM/kiNLMe8dZ9u+dWA8/Cp4u5aih+pQNl4UZQLUxMNpOxBC7F7A3nzfZx Q==;
X-CSE-ConnectionGUID: QQcLFVr4Q8C+IlWQZtRaSw==
X-CSE-MsgGUID: trrKDX9HS7m2r32U9/DyMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6379743"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6379743"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 11:46:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20759163"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 11:46:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 11:46:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 11:46:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 11:46:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIEU6inAAzM46s6mkdHB3YSRIxiN+QgWjKOXcJ0/Pqdsq9XBjf/LVVo/RBTy55aUdX7godNVZIHMhrDR6H4oIgUNZTkb0lMGyYIlstr4EANqLLXh8AhuOQG7dY4eDL1BowYDdT05mJZq+OuysLZXNiBqoa1GK4LKYoIRd1RG8tqgYbQun4//K2at1zM8N+ibjRyRaMBKobRcP7ULor1odikBUVMSOgVdfifB0okNF2mQ7ga7nhtOZkXncNCadqnIhpB5KL3+C5WiyzO6xO33z74ZW13oQWDTfy19x9lCI4Rlyleyfakuy/ZqNw38dS6ueEzoQ9r3nCNKxTmna+YPjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uv/Ydsl1IoIpKQLHFaSUczzPWOqo+kSWHADmrY6iPY=;
 b=J4k+ExXmr7bVSygd/7RzJzW4zPjjcFvVvgDWAvRh43p49+qT5PZ7F5GN4P++jqCdllp1fTPF4vgRYvnZcVYqrxs4qX/HUOK3p8pvNmqnI3DAB2at/uNPPFSzz2NVmZ/iMB9udCSlQqHTl+4VmtSaW3XpfIUyRtg2kIOUgvc7/Z8KiusQ7mIVLqsaaOID90WC6sf+Jq41ayEpQgFKKJZNbEfCxZB47IzQHU9Tf0WPRHTpjCcDCtr6xm/GHPEGusRSM5tjAkP5xv+UuRlPst/Q3EHHj2Dgw3G4Mljru+9u3cXPxlEqp5SmA+gupqeqoRhlXal9qm1WtLq61digt42Cpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by IA0PR11MB7863.namprd11.prod.outlook.com (2603:10b6:208:40c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 18:46:34 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Tue, 26 Mar 2024
 18:46:34 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Cavitt, 
 Jonathan" <jonathan.cavitt@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_vm: Fix WB caching PAT index for
 coherency mode
Thread-Topic: [PATCH i-g-t] tests/intel/xe_vm: Fix WB caching PAT index for
 coherency mode
Thread-Index: AQHafvs17SL/u+gleUWi0de1KPPTcbFI+GEAgAFXlRA=
Date: Tue, 26 Mar 2024 18:46:34 +0000
Message-ID: <SA1PR11MB69916004963FDF5C1987A6B192352@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240325212700.127810-1-jagmeet.randhawa@intel.com>
 <20240325212700.127810-2-jagmeet.randhawa@intel.com>
In-Reply-To: <20240325212700.127810-2-jagmeet.randhawa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|IA0PR11MB7863:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aOEZBXQT4q5mHTwjNGJ9Yj6TY2bsHdX0wHTKLwJXLxC0QXkr/w/hZUl9vhifwLB2gK8tRPkfcKs6WCE7nZpyzfWhoCOaNC+KryCuUiZEpXyjF91SvtDF5WHFolXjdfjULfVVNn41VpIzN63t/xndWAzIL6Y6vaCpkfudYiw6jioiH771HXD3UX4J9RAayQ+Q9kC9PzrfWDj2s9mHnAp9DYqPVUO507bcCttBT5ksP7GAJt9HJGF+80i1sOnLVWY7MWuLDcDuMl+TfDtVl9elesrZXhHI10VYbiDttEBSx7CdxW908goeVLw+jDuVxoV0nYdnv37FAgOWiIZflNMZJIgCKCPJGi4RBEQA2schNGDGbhg/Tn3KINGbxUHvz00stVTg+YpOO+kKAwu5Oakf6g6QxRhGYDL6nNV5O043I+bl1yQa0GI21H56v4MthtBF8zxDd7nzsZvt19ojNUtzh8lqbUyzAA654Oh3xB5Te2/+CkHTFZkOvk3MZ5iHHt/ARcupnDMcZZfCddDjoX4XBnBdIb1/9rCDHAwp9Y8ZavwUY0Ht8EpO/cPqd9vNeHIy4pmK+XEz1MpWxetrSOjocPxVOu9mKGokrZRsuHahM3kGOwtor1k4JBfEGxfg+lSaRyY9rxpP2wm0gRbSkVdyganUrBqbl5v4c5QaSPM3VJI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mC91rwBQqUlS+q6JZ1k/5CE8mZre49qCTchDI783ZGw6hPCXNzGXbHbtdgN6?=
 =?us-ascii?Q?hJVklEYxZpHngNvd9J3M5pNy3L9dfzMrZjXbtPCZY4vuA4vtezDQmXbDL1fG?=
 =?us-ascii?Q?EZMYcRQC9Bsq+5sNmX6ZNUCQ+ofsuJXcWtGogRtJfGkFlUHbSxriBSrawshR?=
 =?us-ascii?Q?5T6oiIoy9VYvcU+imrOyuq7ZXLaVVgtFGDD/ftKAN7TI6zmus6DLNi7fvYZ3?=
 =?us-ascii?Q?AHOb60y0S2cCR00xSf2fqQK6VdZ4Ej99RbL7dj6nWXBg5dLX8tsJgR/dO4Fi?=
 =?us-ascii?Q?4PZWxuyufE8r4jEaZkSvtS359Jj7R7+bloqkakcF2Fv5l3bFD4Tnm6xflTfL?=
 =?us-ascii?Q?iBjsk3lNjgxA1Cnofsm9nHr20NIcToaaQIMneyubYQ32EzW0XgrfEO1GdPcl?=
 =?us-ascii?Q?EVZyCwyKTfjyvDaOWPFOfaxXjYABlyxVNtTRbtVsRt365Rn9y4NugVTzOD9A?=
 =?us-ascii?Q?zAO63FuQvdsKESJvzgecHK71SNCDzj1qaGDjwD+7lrbkGObwLBoPSJJ55KhI?=
 =?us-ascii?Q?rRYKsaqURQ6RBP8LQeMbytHuqSKAD3Y/zwbMlnrq0+k21GVvgHHD3c/Oumic?=
 =?us-ascii?Q?hdwwMzLNnZvh7U6r85/IcmzNkz+P7Qn5xJG0B6Cr6Xx17lic6Z1aF3J90p9p?=
 =?us-ascii?Q?uhRDKcTHNlRtblZoOkHaWgWRW1Ai/5dVyzRih0TimrV99eB9Rf+XEI/0j+l8?=
 =?us-ascii?Q?7/o3gJ+eXYOxGHa/RzVaYzsAHMfflTpUXgSxUCsvdB63ukAK4yC4UCNVDGqV?=
 =?us-ascii?Q?Q9vOfpzYbdic9LzoM57XK/M00Ma+5OtelfheYM2fcZJ+4pGIaNfHvfQCzef8?=
 =?us-ascii?Q?/IEg0CDTUgWtT3ZvsaUgfOOprRnE64Wm0FknGkhqrLhMeGnAguXmuFLhjVKx?=
 =?us-ascii?Q?+thfD6m7wMgIWKLu86JAv2PsKCQEFmpzmeagL1qZFvtYMDyC8EVW9Dh9NZIo?=
 =?us-ascii?Q?ix6mtge3KYhhzxlHJEKWaa2wxkguMqqm/JKoJYAf73OW496PXD9Kmwmdd1h2?=
 =?us-ascii?Q?dUA4xhaWg0hTxvTRdcRUE5zscPsYe0ugk3Kh/dessfXRxWtGVuGRTi92omFI?=
 =?us-ascii?Q?MeCOe1WygbbxvQaVMzcDwG1qAUiomXYoYglGdCXNWNaHIvNOG4tT5sOuOTAa?=
 =?us-ascii?Q?dviezKFXnArHpO64AlI2B6kpfE6Z6gzKk+tgHvgkCqAzZpSIoL5LywIy0Oqc?=
 =?us-ascii?Q?ujPo6CPWKuM+fqZPUYqHlI5YIdO9sf+BGiyct2FYqYEqcXpY4mNVDPM32Pr2?=
 =?us-ascii?Q?LUYJYVmSDg0rHTN7Wkzr9ukFoOn5I6UTidFWnz5pG33CQLBuzdKdZm1IADtB?=
 =?us-ascii?Q?qkjUC4TRHQvGkucFVlVHShAtq+SSrE5jfrRRe3JNDAFP37NDnBnrUapMh8Ts?=
 =?us-ascii?Q?fkQ+Y38pqf8W0sgQdzZpbYoIde/QwfH64VfFCU2XFmNYQOjCsyxUUGn/iZYf?=
 =?us-ascii?Q?R/DjkNVK0D1aunZNPCfr7juWdWbCujvuwFach0Vzml61bdvPraF3jrTTWX6Y?=
 =?us-ascii?Q?TQJtMVmAax1YmivoPU7ibo1ByLH+IV1UhahLNk/hxCY/hooScMCqNjPYaLFt?=
 =?us-ascii?Q?y7UQEMtMTXHNkiCtqIk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e666c48-db12-403d-1c94-08dc4dc50f7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 18:46:34.3181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nC/wDj/hTNdTloFRaKM0eoPT2Fq4HQ9sAAZ9cIVXC/Eg9w/XhfHt3va3rYLJZNkaWXpsv3PcrkMLHV8zIHFtZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7863
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

Hi Jagmeet,

> -----Original Message-----
> From: Randhawa, Jagmeet <jagmeet.randhawa@intel.com>
> Sent: Monday, March 25, 2024 5:27 PM
> Cc: igt-dev@lists.freedesktop.org; Zeng, Oak <oak.zeng@intel.com>; Cavitt=
,
> Jonathan <jonathan.cavitt@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>; kamil.konieczny@linux.intel.com; Randhawa,
> Jagmeet <jagmeet.randhawa@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_vm: Fix WB caching PAT index for co=
herency
> mode
>=20
> Resolve a coherency conflict by setting the
> correct PAT index for WB caching with
> intel_get_pat_idx_wb(fd), addressing the
> mismatch between the default "XE_COH_NONE"
> coherency mode and DRM_XE_GEM_CPU_CACHING_WB.

I feel the description here is still not very clear. Isn't a confliction b/=
t the default cpu caching_mode and default pat_index?

 Again, XE_COH_NONE is a xekmd *internal* concept, not part of xekmd uAPI. =
User can't set the XE_COH_NONE mode. I think this is determined by pat_inde=
x....

By looking at driver, I figured the only not allowed setting is: cpu_cachin=
g =3D=3D WB && a pat_index which indicates a XE_COH_NONE coherence mode...

So maybe something like: driver doesn't allow cpu_caching =3D=3D WB && a pa=
t_index which indicates a XE_COH_NONE coherence mode

The code looks good to me. So it is reviewed-by: Oak Zeng <oak.zeng@intel.c=
om>. Improve a little the description message if you want.


Oak


> This conflict occurs for VLK:54352.
>=20
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  tests/intel/xe_vm.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 7c061c497..1f458174d 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1789,6 +1789,7 @@ static void bind_flag_invalid(int fd)
>  	bind.bind.range =3D bo_size;
>  	bind.bind.addr =3D addr;
>  	bind.bind.op =3D DRM_XE_VM_BIND_OP_MAP;
> +	bind.bind.pat_index =3D intel_get_pat_idx_wb(fd);
>  	bind.num_syncs =3D 1;
>  	bind.syncs =3D (uintptr_t)sync;
>=20
> --
> 2.25.1

