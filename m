Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E6E109B47A
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 14:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAF210EA75;
	Tue, 31 Mar 2026 14:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYIByQOL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118CD10E901
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 14:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774967538; x=1806503538;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3vudHS0f7nUTL2nzfvfWLkodNBDdCWH5f3Me0rvlDeM=;
 b=jYIByQOL1t9xK99tcbaYfDXaPFm1S0XkSVcpb1eqiRrPFHAew9vPWnyn
 i8/vHRCVSxaommmpSNpUj2L/Q8c6O+vvZmeXe9bqqD9j5pA7mgolUMnBb
 Tzn1nJ1OUOGk9Ns4F/6QErVW+2dMDY5uHtb8Xgqk6Bzh7Wft5msIgIwk9
 VdNLldfD0GPgGSYgAkVRDMpoCmWkY92GiweOZwpaZrm8iFVsurVz0c9G3
 3aO3JNM+lubcl/HSALwXWwwmX8pT9B71c3kY3qZTTA9o0HYYuxIRAas1l
 8JlJXOnqiDM5vxih6eamcj7CbTH7UB139Hnbeke7aFC7WZAk9s8TL9UNM Q==;
X-CSE-ConnectionGUID: 4eoCB+laQfaXdAvIdkmDVA==
X-CSE-MsgGUID: T4QUEMESTW2+oUa2cB6rOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79841482"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="79841482"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:32:18 -0700
X-CSE-ConnectionGUID: Evqt3vWuQ/WNsY4OSxNZTw==
X-CSE-MsgGUID: jqwXk6ZVRhO7RkbtI2QHNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="221977222"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:32:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 07:32:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 07:32:16 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 07:32:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loltNop3CDs5Eas68qw8jpC6OcCwqa4mXyBAm25qzDFD8BzXnsIzdCl+qIDGNKPlEUPLItUYELAs9bnHlFAr0dehj58fj0Bsat4Wh8nhp51kPyocPk6/yUlTh4HcT9CZ4c5jaurAElxwfoZ2BK7Ww1+P1uNk+AT9PZtRRxhclHdpAR8dsK6NJ3eu5aO8hMN4RocCHujFJc4F3FP5hNsJtdWkUBuMdp1KxEUlmf734fT2JGfr+yinxmgQ3D0juyGASfri26UKrl/34QRoGegz/qG+AuwdYixU3cAgv9pcCYLhZ4Z9W0SrYXxtAA/LzSnHR3YHkSGQTRTzJUvCe2EB2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaA9wyMt3F4Ruks9wYz7nWe6Bp896a9r66Geu57mGfM=;
 b=S08XFs95qK+qJosio72gl+Re2WoZhEZzes8KyeYGs4zpgSRNBvrXPsdZYI6tpQSll9SO0XcIuOikxTYe0NXSm4iMnEV9RxtYWCyZ6lYL5j61qPiNVVtlcurtBo2r9l657dgbvLmfF/cA5w0OdZVFNZSGvqf2tj7zbDr6iZzuNAaWSIEDBe9SYr4SfaOuzlZ2g23Y/XrIM/wz4pa9VDfLfPyXhn7//xRr0nviYpxqRYvYw6/Vw2dz2b199SK2L/IlkBg4hQKWY7Iy8rHKTZpP1fodsx/Fkd+7Z8N8FxEUg+iCSbYMfGigfdm+s0gnb/0oXmJyW9afGX5jqNhy3kMaSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB6496.namprd11.prod.outlook.com (2603:10b6:8:c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 31 Mar
 2026 14:32:10 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%4]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 14:32:10 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
CC: "Gupta, Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>
Subject: RE: [PATCH v7 2/4] lib/xe/xe_ioctl: Add xe_vm_get_property helper
 function
Thread-Topic: [PATCH v7 2/4] lib/xe/xe_ioctl: Add xe_vm_get_property helper
 function
Thread-Index: AQHcvJ14WLt/M3MMeUmYIM6SUULGbLXIvOgQ
Date: Tue, 31 Mar 2026 14:32:10 +0000
Message-ID: <CH0PR11MB54440B5A7E4A790676942D0CE553A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20260325212208.85743-6-jonathan.cavitt@intel.com>
 <20260325212208.85743-8-jonathan.cavitt@intel.com>
In-Reply-To: <20260325212208.85743-8-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB6496:EE_
x-ms-office365-filtering-correlation-id: 7f393a7c-2f36-43b4-4c6e-08de8f324b4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: QIrkLGGz694kk1XP89mmfAhjotkRcTlYyZf7eo5MSYpw6XAP/X8fxos8xSm9ok9OWYMk3z66jezfB0mUfe2IriruUmKmhhiXRFnribyFNYDd6Z7yRq4TVxucZBrBPHNZniRlpsD3ujeYig99ibhzls/oiuCMw/1GAkirlQeb5fJ/mPDwdcTNE4kVzDN09SumdQb6OYxSkampjZ2ouxF/6F26e2vaevAf7Ksd54rrpbiQz8d1dz3yE6sf5K3kDJzMCQNcgSudlKX+/VtaE3f5+1gmZuU6CjALQVWbe9/yn+5J2sfOp5pOYRPiGJ/zsiXeK3PE3U0OK4M5KXO5/LJCpfVTw06G3BKWbpNNhkk+o7EfSE0kAoROVcpBsuyapzXCJt5Tduy9fgReRxhDpqOv5qkm5rsAmciZXcfadqNumHRyc0Vb+j+gmyRWVeTR7lcd25vt+IVxX06X4D3zjeba+lQEtW3wOIysVQ79swBl7VanXXavdMRs6aQymsa+AuKWphrb/gKRUGapBty6tKX2y1bNfKwXtTx/TkrOfM8NuXGLSOz/uFM9IS7WWxwzn9DDXpmRa3+oGobEi6eAjOWWnyEwsFRdbWmllS62FmSUz+79RIhbGMuIL57ctIQg9dlDurdig1kvNf4c1tcIn/sp9ifdQsuR7Gw2yM494uV5EYCP/sZEuvAXU3iGTb990ZmYjSMphBMOA1sGycPehAYni8SIEijuebo8JmmeZUGnePpHxkA3KGEKmAUTx34A02ab/BVUdhCkKdjAF80pg4FR5vG/SRH9WdcPuKS7OaCMtYE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(18002099003)(56012099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?msHLAX2PUmf6sz8WNcYnOvGSCj9A8Qf+fT9hs8KNRQyVRoU1zPGIT3ohzQQF?=
 =?us-ascii?Q?L9vXtKQJZiXnSq6/c0BX5QCTYbDJ6JgLLm+UbqsAxTWsvBS6nmYdCCtJDKzt?=
 =?us-ascii?Q?lBanBv2InwNc48ZJbHueOsNiv4m9L/qeQnCN7pDdkMR3XwNfaVUpkmEeRKha?=
 =?us-ascii?Q?l8Nfv5yNbhX50ZB8oZljMTvBpoAUyc0VYLqwCQoBGp8/dcTGBhl4DMMpP1z5?=
 =?us-ascii?Q?TMBEvsnu2MfFtuRBISNQfHp87xmM57cUCGr1FK4fUJ7Eoha3MvmQmvBcnko4?=
 =?us-ascii?Q?ekq4onWQPwHpUcDGe1YR3A9wwUnvvQDxakEB9nScRlcQij3mQg4YJUv6YMXr?=
 =?us-ascii?Q?/+U0O8kgOXqLfOY5J/CFooj5P5huUOEk6PIKbo2OjAwSS3ZovJj+7yvjoWGj?=
 =?us-ascii?Q?7ZoaW6mDyMtX/xoNxYVCWux/ei6fGoJUgcuf9BsDfY2VxIMV0/Yx6hHneJd9?=
 =?us-ascii?Q?DgRj0Ry+GPihf2XLI3ny5ljryVmh5NW57/1FGfcskpc8D6rxLmIqnUAhgR64?=
 =?us-ascii?Q?U1FIfETyGAUMVIh28jfZsBP2IwA04qqbWGRq8VrWsEn9B1aBdRHbvEaRZEEf?=
 =?us-ascii?Q?0DuLMZfy+/n6CajclzfPSqSUUsGKJRbfj4roKCENISAHw5TiFoqt/5dLdBj4?=
 =?us-ascii?Q?mYBqsMSnPLHLtQZOnh1aKLhUe0LHu97ATOkXnL01NADh32Bv5aqRKgINWHJV?=
 =?us-ascii?Q?Zai65PkqjSCpLQwFu08JC+sxQp8/OlMJDe34tRt1x4uj52qnvGQ3nrlY274r?=
 =?us-ascii?Q?k0FSVEUjxAYHgpjySvvPpsMvTM/jMWD582Kte2FY2rPk94o6Mt+28ll9+1Mg?=
 =?us-ascii?Q?IT6hQrCvVIuZ0Tuucn/V0P/o7qRKTQeIwHkb/2dlQEExZSAdjLLj2FbBQZiv?=
 =?us-ascii?Q?gvGSD269ikAGJcmdWZw3ek9dDBD4xazmR9OOw4+raXGwdvVw3+I2R21M6jB9?=
 =?us-ascii?Q?bYzsEy8Lol9T/bifYssVyzzDUbK10kWViBLscSBR+bPdJdYwmutN4zwuFYFv?=
 =?us-ascii?Q?6TrKK4gvpcxrJCxRMbRs+lvCFELqGEDEfnztNhgqj+JLCBYJ+FDrcSPYTcNd?=
 =?us-ascii?Q?mTpNTDteAQ0bTmtf+rwh4vjDU006XWOvWIHImQ0u6OLLE7oXJ2oM5WwOKEip?=
 =?us-ascii?Q?42AEGCX4B6+Xw3qyVay0blglFSn9KGs8v+KFSECBfCqPt5tpNioE4NDADowC?=
 =?us-ascii?Q?HN1R9aqhoI6Hogcbw8u9gquv0Rw1++KpyT5nPKV6HuBovxkt6LTmfqqbWL9r?=
 =?us-ascii?Q?DLuMRnGWmHnEFynLPRTgGw1vFdWmH+CaFVlEH/fJpxAhDgEtU8U024LjEhAY?=
 =?us-ascii?Q?ypD1DFWvYKS7ILqPgnF6ljWe/+6qLZN3BJ5aJ9C61q/YT216iPvdhzXTzVdJ?=
 =?us-ascii?Q?k48JkjvgF87gCWshk+GMs2HhkzLT9pIcqk9SiB3AREid6EIRCo9x8hOOfzDj?=
 =?us-ascii?Q?riU7xt11L0a1Otf1YUG+hL5Kzzzg+1fxy24hUzeKV5lFXr9FwodgEl1QC1l/?=
 =?us-ascii?Q?VLxzeFEcIfkXY72oCzEyuqJXXSGigLDEkSrQqZhhG61+Vvnyr8Bwiie74icv?=
 =?us-ascii?Q?5LE3O9QlaZY1svlhuFJfoX/SBW2wFW5XlP5uVhyJflaalWnnXVLQa0b45g9/?=
 =?us-ascii?Q?9G+LDmLQa6kOSG5g34AGbZnmsmyNNf4wbUbNSMh0a7VdNUdXveu59e+3q4vH?=
 =?us-ascii?Q?uXJWAA7PK2S+1iJwz+mjueN9aNEVIl15NcEGvygU787G55sjA22wtEPEuc2Q?=
 =?us-ascii?Q?GpmNSbJNpOGtSAq7HR65NfoigCt0YfSJuBK1hCxjgfunWZlAcIcKcXfw6ZX8?=
x-ms-exchange-antispam-messagedata-1: 6x0UBDOgXy0+gg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jRn90vcorGJ8MszgFC0mfiXZKJkuP7Pj+mhdSIVV8RpRymLr7VNXqzEONQnG+ky+lwW819fjZeMgFZ3C7IS+01D0YrDtya0OuZrZWElS7RlGH0vcHqAIaDK3oFavtgRwJDbBRzq2U9FLABOcDA3sVKSBitzhycg7ldaPzv+uVtnELTKIy69a52JIoA492CVE4bcPmNG5bEN53y5OJpI8YvEVp38RsVvAv1HSu4OQPDqTBDITywCl3CI/FvWfRsKsuy26eBeMIl8p2Kq/LAAlEvQUIaKzg/c4g4KnZDQ5LFbRA5ZN9ubTKapo2uOx3fZeqIvAo5NmefpLlsmK1D+69g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f393a7c-2f36-43b4-4c6e-08de8f324b4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 14:32:10.7682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ag1TsSmkBUsPLZPfimjsYIq+dnEv1CTu/RJezgMgwikKTMEsmuJ9gDbjkHzWG4YgeB4RrdQYB7ZtXOWxGJEpluntFCidIVHpSwkiwzBs984=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6496
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

Forwarding to Nishit Sharma for review.
-Jonathan Cavitt

-----Original Message-----
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Wednesday, March 25, 2026 2:22 PM
To: igt-dev@lists.freedesktop.org
Cc: Gupta, Saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; joonas.lahtinen@linux.in=
tel.com; Brost, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.=
zhang@intel.com>; Summers, Stuart <stuart.summers@intel.com>; Lin, Shuichen=
g <shuicheng.lin@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
Subject: [PATCH v7 2/4] lib/xe/xe_ioctl: Add xe_vm_get_property helper func=
tion
>=20
> Add a helper function, xe_vm_get_property, that calls the
> drm_xe_vm_get_property ioctl.  Since the ioctl behaves similarly to an
> xe_query in that it needs to be called once to get the size of the
> return data and again to save the data, the helper function takes the
> ioctl structure as a parameter.
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 5 +++++
>  lib/xe/xe_ioctl.h | 1 +
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index ea3f2fcaab..7a8444095f 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -332,6 +332,11 @@ void xe_vm_unbind_sync(int fd, uint32_t vm, uint64_t=
 offset,
>  	__xe_vm_bind_sync(fd, vm, 0, offset, addr, size, DRM_XE_VM_BIND_OP_UNMA=
P);
>  }
> =20
> +void xe_vm_get_property(int fd, uint32_t vm, struct drm_xe_vm_get_proper=
ty *query)
> +{
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, query), 0);
> +}
> +
>  void xe_vm_destroy(int fd, uint32_t vm)
>  {
>  	struct drm_xe_vm_destroy destroy =3D {
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index b62d259fda..4ac526a8ec 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -65,6 +65,7 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exe=
c_queue,
>  void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
>  			    uint32_t bo, struct drm_xe_sync *sync,
>  			    uint32_t num_syncs);
> +void xe_vm_get_property(int fd, uint32_t vm, struct drm_xe_vm_get_proper=
ty *query);
>  void xe_vm_destroy(int fd, uint32_t vm);
>  uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t pla=
cement,
>  			uint32_t flags, void *ext, uint32_t *handle);
> --=20
> 2.43.0
>=20
>=20
