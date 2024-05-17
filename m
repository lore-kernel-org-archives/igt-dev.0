Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D445C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 14:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB0310EEF3;
	Fri, 17 May 2024 14:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vg5wyTc7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F47910EEF3
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715956776; x=1747492776;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FohST4co9X/wW/bSxifZdxA93zo/VaF7vQg7x4ekxjs=;
 b=Vg5wyTc7Nvz3kMd8nHGgdxwa+yJurrGmCTeDZFEQvif9nTJJSh+rCfiX
 X3Q/r+BfgHD5o44+e5xkSUxEVA25u0fxe0is54yKDXltmdOh2TCWhgwR8
 Uxb5MoMVkvtQnb94vqd+Y6KB5HKogCb5+PgCRqwb0hgvCStRMc9ddN8j6
 brVC0oPWd5GJ0fgJgx9txGs2mwyogXBYxgEGGZCuU+gspm65eqAJj/KwR
 dVfQR5pBvWwfFpF9SR37dIwjgXEJFZ71CNRsnkiLClqzFIfSPgFgYZeDW
 M52kazgkEEBkGvwjrTs+YnAFAmyS6FB8AdmMENBUoGa89nQt4OXQIfaem A==;
X-CSE-ConnectionGUID: 5vjpgcjcQ/uj23ULe5zchg==
X-CSE-MsgGUID: FP7MklphRpS3b99D4FKoCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="22744111"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="22744111"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 07:39:35 -0700
X-CSE-ConnectionGUID: EpGcjKkMQiy8Je84VeUorA==
X-CSE-MsgGUID: LPeO86w9QpyeMO3UkMHhWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="31899455"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 07:39:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 07:39:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 07:39:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 07:39:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifQVA/1d+gutACRNl8h0OdHzm4gCKa86hIRxsYM+5YlzjkFFtdPNRP48R1g+58/2tfh8PXuFZi+IqDqBDAzjGceY8nKUf9j0v0ZtH/bcLvFe/Pb3CS/WUaZxEkcXJBQCRyeM/7czHRhHOcs437kNDMamQA13JCSrZRKQJW5Z0rFQ1FcNVLLsgVqCltwR5PxYaCZfksHnQ4C6S8B2yHZUZvBXE7VDW1Dneow9n0npp93mZsWEs+II0xfOAafLIAPx577P06JjV1n7G4xayfhEUSXk8unMw1sSPnnikTr0QDCLaWnGlkDUwPZUhBtH6ydDZ3XErn8tnfr/xQqjRKaB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVW7t61k/ZMJ724AYn9IKwrJ95lhTRNhEXTw1o5MvKw=;
 b=dYzySwQIfY7nkiNmjWh9awZNYAvW81FK/+C9dgY9ps9M6QRooSfCVfJ9PQAcj+Bsy9xeJ/DZmUBWxog6bQM7b2WoM0Jhtb1uCFOgfOqb/Y0hv2azCOkVo8hVQAQqPyWYtpEOO0Um50udYPb+/BNFo9dxbLv6XIlKDDeJJGrDIIb72gThIfzP2B9fgT336GLjnUw1rXygrpUuHYThlhwr6FTvmiOpYy1IKuQdcZInrdcKIsBM15bhxayiGJf5Lg22cnEwcCkN71HlhtlWpbzf8ROINyjLIP/OzjqQ4TFBku64RWNRZrhd+9zrqRrKTvObAR+4REXyPNyhuryeR8oVjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH0PR11MB4888.namprd11.prod.outlook.com (2603:10b6:510:32::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 14:39:31 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7544.052; Fri, 17 May 2024
 14:39:31 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH i-g-t v3 03/10] tests/intel/xe_svm: Add SVM basic tests
 using malloc and mmap
Thread-Topic: [PATCH i-g-t v3 03/10] tests/intel/xe_svm: Add SVM basic tests
 using malloc and mmap
Thread-Index: AQHaqE/nq+qs3lygT0ai+shAKu37sLGbfHPA
Date: Fri, 17 May 2024 14:39:31 +0000
Message-ID: <SA1PR11MB69918B933EDEF45D617D2DD292EE2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
 <20240517114658.810283-4-krishnaiah.bommu@intel.com>
In-Reply-To: <20240517114658.810283-4-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH0PR11MB4888:EE_
x-ms-office365-filtering-correlation-id: 0cb49335-707f-43f7-0a08-08dc767f299e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?HlkspeWVM52G5WTQjavy2Uy3cUCKVFcfCQtMXbLVMUDdhcMW7Qd16ZlNsh5Y?=
 =?us-ascii?Q?QfRsmYzei+Q5ah2HGyPWbkhnvAvoc2Rbm4jwlusUxWgZS/bOCRAfZUhS98I1?=
 =?us-ascii?Q?hZn7BbOaOPnb5lc/EKzblo5bARQ0YWPyTEOyDExPQCd2XJSV93HagGNzSCD8?=
 =?us-ascii?Q?5XMT9e1BXEv1bkZusddb4Le0EFGvOOmhXGt5PGIlD6Xv6BATyULZBr55X/Nm?=
 =?us-ascii?Q?s6pWFXjB2dirreTG5AUk696BH9V/szX2WdQqafopumIZQoCl8XfCtSCZHmuR?=
 =?us-ascii?Q?l1biJb3f+qgtOhM1+3eFDYbb6X5qIn9PL3wu+LiIld1/t3JxMOxOmzGIBC+N?=
 =?us-ascii?Q?VZqDdVMgnPyaBPtUwhdcJl0emiyPGwyyUHx6QYbFbWIX6xPzoM+U17DgEzwk?=
 =?us-ascii?Q?X7NWbRduTR46qb83MT3TiwxRHO610BAepKWl2aX7lGfkt11T8PDcSnFPb5iO?=
 =?us-ascii?Q?gFjsx5U6+/VWvFQOR7fqODBPv2eqeYcyGd/ECitkZbzZk3R9IyJuz6eqad3y?=
 =?us-ascii?Q?vj2F6LrCxu+0T6IJAVdKeTAV8ibjrCaiSzPf72VdqRrMAiQtZapjaXz7lqx7?=
 =?us-ascii?Q?ULGgENug/NqqhRFBlODxuIqw45DPtZn8ZTib//ES1eOcQJECyFQ4Ur6maViZ?=
 =?us-ascii?Q?ZS6XnDi4YV72LEIGssywV2esPisHHNxSRJjO/HkLA0u0tlEz6RjPNVhg5xDn?=
 =?us-ascii?Q?1ayj471Z+JU15RZbxkhZ7HFPYOVGRiGJ9JAfg4rc0Yap9bwFOtr5c1OM+FBB?=
 =?us-ascii?Q?pno57YxGGRjlipBMB69vSfu+LEJBXDNa7ugEGCen50BXK/fFHEDJmLIJ0agV?=
 =?us-ascii?Q?uc8ovCYd+PJUHAAsgB97ZggypGs7ITn7fFS9FbLaprUl/Wp04RGx4nTNfjE2?=
 =?us-ascii?Q?ebu7gc+V/PmETbZ5vaINLK5NSr7Gb2UFLBYUDZ0seFkIc7GtfqNHVBiiMEbZ?=
 =?us-ascii?Q?rZT0O6JIOGsiiUNd/kRcoQTqfr215S3f2vIO/09n5YPk19Ou0wH7INDVrb1g?=
 =?us-ascii?Q?Ny4dXTxltzrTsy4dIC1DwC+iy0yvrLnPvfYo/yBi8nPL6juD5cf7DRJP7wj5?=
 =?us-ascii?Q?PlTeaToYnzs06A1OvK0QZOx59HwiIVgcWuT+7vW/Xq950/IImjXM1GyNE+Ut?=
 =?us-ascii?Q?YZ+07uSfxHUoik+JeYRrHk1y+rcpKRZuWHkCrdPLSCVofvICoJv9/sdMwAks?=
 =?us-ascii?Q?nWvRmqUeU01hdpT9g9oyl411Lml9Cd85QQtRKEzn2bYoFXnoTOyhVoeub5bG?=
 =?us-ascii?Q?PX/zQTnysP/vGWkdmuF03A8rSVR+W5wZAocPxSYkrIiRtasWAohQ6yXcAF6g?=
 =?us-ascii?Q?JOIxeHGC2KLwVqb9HmWwfEjFfrXTvotZVYr+7QOvCwZSeg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CTvJcBcZNunzfEO+hx4+5epjBMRpjAuNxN3dbuHKPeAlht0CXlxSRPHaK2dC?=
 =?us-ascii?Q?yRCrGCAhQYIouhPX+6rSlobuzP76N/+1TUJsqUGbMIVhUmCjCqVev/VGj97a?=
 =?us-ascii?Q?izC40yqiTa02+POSwryJLLH4iYZP5Rp3Nbq94iy4pmwKbgzWGXb41nKZPoJ1?=
 =?us-ascii?Q?iI0w7smWU6ixrW4yYCBA2ot0IbE0gEgGpE6tSmtLhrHhMel8nwnplFpeuiXt?=
 =?us-ascii?Q?fb7Na4Jsn+MfK3Xm0eyg4pF3hl4CU2Cfwb509Tyj9XasqJR6IddO3KIXagRH?=
 =?us-ascii?Q?97dnVEPJfx/dPoHAtUqspDrWVeMGNRCySR74vcXinxwFXlWuV4JXKpcmPPNj?=
 =?us-ascii?Q?qdNPaqGgX1H3NtC5N1QiTe1NpFHrm1B573u9rjr/AVLh2qLTmAXh9RP9J776?=
 =?us-ascii?Q?2EVK4cX7x/TEZhUrxJfpDZeQ02QW6qcaO3b/OK+N0UNBS104sA+XFkS/utDW?=
 =?us-ascii?Q?euhNuLd56ml1/Ci3EI9J92t1xA5hvBKHneiWkH6X7jBSGnXsNVR7RvuXVl4k?=
 =?us-ascii?Q?fqCtbEt6DQuuVOkQrQVIqgAkBChAkYQYAXwMPMwNOtcKINL4VfM+kzRCdKaU?=
 =?us-ascii?Q?VlRaKvuMTq7jfsn5pR8Pa/iHKDieY3UOErWCACXI17+CM0EOHjPJrzf4w58r?=
 =?us-ascii?Q?ZsAHruqA6lU2YPEzKGT4zdyyq9U2SWFDPb9nB+FusghoGCAsLnmL9Ekg/DrK?=
 =?us-ascii?Q?vhGFYLQPx6PQXo/r8uOXl2a0QTGcVnWXW5291drXhKLfpOivw35dn9LDqNs6?=
 =?us-ascii?Q?M1Xde65DaOKWfdY4seB05Glp7bMLl6VAyqfsawEQoRaUk9Y638Wyh7StjPka?=
 =?us-ascii?Q?3P8mTVoLtOdHIc97vRvajOZtGZTcFyI4xPrn2iTdLesGVbvUZWWw7a34Ag+J?=
 =?us-ascii?Q?+/9IxrrKugRWr1wODkXkdjYn0TL7dA1NWhgH9DjJd2OgDZqxIzHh+CYTcIzG?=
 =?us-ascii?Q?lG0TuM0jhgD88/rfVCcBeSH99NtSrRNHSd2hV5huwzJeoWz0ADF5ObjQtMMR?=
 =?us-ascii?Q?3Z/KT1r/ORkTevpGrh1y1uwJUiIccjSnrL/IbS97rw1mb/IAQcUsB5Jb2KdE?=
 =?us-ascii?Q?TBVBAeTOZLXbu0PwRxsUA4rMocBYf2qAXkaLHyXMJAuYc8d3dFZWyFmUAun+?=
 =?us-ascii?Q?vbSH2K7kGQqkrvMMNzKiHY/tiLqOzfW28+ZGTJew9Hrkg7K49RzVi6q66YYb?=
 =?us-ascii?Q?uvr8fgGRxNrNA2oKDb8ntXf/Jvnx7/W0mDGehmHe5xyhvsRO35F/lPRtVJGZ?=
 =?us-ascii?Q?k5PU9hIHev9kO0eTdeFoNurTmwMZUzmaMdMyKL/B8JP61Z7lkN0ITrN4u9I9?=
 =?us-ascii?Q?ir+UtNEMPOrf0drkOmQVf8hm+D11EVfTm279sRMJu6Xl6dNwfSxl0yrdreQ2?=
 =?us-ascii?Q?qNesOt8m4WzVTj5X/dZSsD4d7usQoSNX2X1hPbIY0MY4/F9fDysF6d7VwBdq?=
 =?us-ascii?Q?UI9A4L/BHtzHmhaGzVdV7il12a/NWejZQgIYW4Ox8XnXfAXLccOYafKLKAMb?=
 =?us-ascii?Q?EOy9BzjtBzKDCfLXiXj+JjM+2U8oHoaobpgRK8TFJ1gh9P4r9QDB8YgEINcj?=
 =?us-ascii?Q?iz3+OVu42zDAdwGQzvz6k+ql71OCWFMa5yiB8pf/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb49335-707f-43f7-0a08-08dc767f299e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 14:39:31.0877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TxExC7Z1m8J0awGsOix43BRW/S00s9lyigh9dKiVaoKG0eNmfaUpBY49tphiuGapY3mMWKhon4f7XOOve8nf6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4888
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



> -----Original Message-----
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: Friday, May 17, 2024 7:47 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH i-g-t v3 03/10] tests/intel/xe_svm: Add SVM basic tests u=
sing
> malloc and mmap
>=20
> Adds subtests to verify the basic functionality of Shared Virtual Memory =
(SVM)
> in the xe driver. The tests ensure that memory allocated with malloc or m=
map
> can be correctly
> used for GPU command submission and data verification.
>=20
> Subtests:
> - svm-basic-malloc: Verifies SVM functionality using memory allocated wit=
h
> malloc.
> - svm-basic-mmap: Verifies SVM functionality using memory allocated with
> mmap.
>=20
> The verification is done by writing a specific value to the allocated mem=
ory via
> GPU and
> checking if the value is correctly stored.
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  include/drm-uapi/xe_drm.h |  1 +
>  tests/intel/xe_svm.c      | 52 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>=20
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 0b709b374..69c8792bb 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -973,6 +973,7 @@ struct drm_xe_vm_bind_op {
>  #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR	(1 << 4)

You introduced this flag but didn't use it.

Use it to perform the whole address space vm bind in th igt fixture.


>  	/** @flags: Bind flags */
>  	__u32 flags;
>=20
> diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
> index 6302af95b..741961529 100644
> --- a/tests/intel/xe_svm.c
> +++ b/tests/intel/xe_svm.c
> @@ -21,6 +21,12 @@
>   *
>   * SUBTEST: xe-basic
>   * Description: Basic test to verify store dword functionality using hel=
per
> functions
> + *
> + * SUBTEST: svm-basic-malloc
> + * Description: Verify SVM basic functionality using malloc.
> + *
> + * SUBTEST: svm-basic-mmap
> + * Description: Verify SVM basic functionality using mmap.
>   */
>=20
>  #include <fcntl.h>
> @@ -75,6 +81,44 @@ static void xe_basic(int fd, uint32_t vm, struct
> drm_xe_engine_class_instance *e
>  	xe_destroy_buffer(&dst_buf);
>  }
>=20
> +/**
> + * @brief Tests SVM functionality using malloc or mmap.
> + *
> + * This function tests the ability to use malloc or mmap allocated memor=
y
> + * for direct GPU command submission and data verification.
> + */
> +static void svm_basic(int fd, uint32_t vm, struct drm_xe_engine_class_in=
stance
> *eci, bool test_mmap)
> +{
> +	uint64_t gpu_va =3D 0x1a0000;
> +	size_t bo_size =3D xe_bb_size(fd, PAGE_ALIGN_UFENCE);
> +	uint32_t *dst;
> +
> +	struct xe_buffer cmd_buf =3D {
> +		.fd =3D fd,
> +		.gpu_addr =3D (void *)(uintptr_t)gpu_va,
> +		.vm =3D vm,
> +		.size =3D bo_size,
> +		.placement =3D vram_if_possible(fd, eci->gt_id),
> +		.flag =3D DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +	};
> +
> +	if (test_mmap)
> +		dst =3D mmap(NULL, 4, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
> +	else
> +		dst =3D aligned_alloc(xe_get_default_alignment(fd), 4);


Hmm, I currently assume system allocator should be able handle a allocation=
 of 4 bytes, even without an alignment. If not, it is a driver bug. Let's r=
emove the alignment for now.
> +
> +	xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst, 0xc0ffee, eci);

Maybe change the dst_va parameter of xe_create_cmdbuf to void *, and do a c=
ast inside xe_create_cmd_buf to cast the dst_va to uinit64_t. this way we d=
on't need to cast every time we call xe_create_cmdbuf.

Oak

> +	xe_submit_cmd(&cmd_buf);
> +
> +	igt_assert_eq(*dst, 0xc0ffee);
> +
> +	xe_destroy_cmdbuf(&cmd_buf);
> +	if (test_mmap)
> +		munmap(dst, 4);
> +	else
> +		free(dst);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -91,6 +135,14 @@ igt_main
>  		xe_for_each_engine(fd, hwe)
>  			xe_basic(fd, vm, hwe);
>=20
> +	igt_subtest_f("svm-basic-malloc")
> +		xe_for_each_engine(fd, hwe)
> +			svm_basic(fd, vm, hwe, false);
> +
> +	igt_subtest_f("svm-basic-mmap")
> +		xe_for_each_engine(fd, hwe)
> +			svm_basic(fd, vm, hwe, true);
> +
>  	igt_fixture {
>  		xe_vm_destroy(fd, vm);
>  		drm_close_driver(fd);
> --
> 2.25.1

