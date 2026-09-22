Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FBDC982FA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 11:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146EA10E6BD;
	Tue, 22 Sep 2026 11:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kbjCxllF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492AE10E6BD
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 11:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790077916; x=1821613916;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iZeBWkUVW838qCGa2brnSUXCzXOrDR3fzrb3cL8A/jY=;
 b=kbjCxllFQ/MSYGI+8vRjetSeTiw7I1S+lnJIVmv/vBFMtUbnu8RivJ1Z
 dC1coS+9ut8GqK+hYpoyDIllmWouPmukZ2Zcqim62/43HxCHi4hA0an7o
 UenGB83Gkk6k0CW0nAUmUYxyaOgcnay1BtdfN924Te/hGuvv9SFGoK3Hf
 Dd/cGd2JzZ/+mb1oz/fXqULxCukE3LtoKac9jrRIdDkKaJ25zEcQL0G7/
 sPhHHS1543fTcUFBVvHQ8aK7jp1q5cCsk2hSCsDGF5WD9o3k94JXDwR+F
 emQTq2SD5jnG2+uNU/uJ4Uo1SKyFfp06yyIDiZH3/J+fyRnLOvydVv3CW A==;
X-CSE-ConnectionGUID: /aNKgq0ESo2oRnUBTC1e3Q==
X-CSE-MsgGUID: byllNT2fQs6DPIBrNUY4jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101333169"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101333169"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:51:56 -0700
X-CSE-ConnectionGUID: Qr9w7ab6T26vZcSt9rkaZA==
X-CSE-MsgGUID: kF94TzYlQNuuEG1UAHoH/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4201586"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:51:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 04:51:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 04:51:55 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.62)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 04:51:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5mkJ3v30tElQ/Lb3T6D5bHfOp7PhyZn0fmwHlzIozXB/qmwsIjrh7a6B/Bfq0uXC3gBO1EF4R4rvH7Fj7kwXIJ2Iepd/X1up8xz+T1251BXv/cUEVa5e6ECmxBkZk2DoaKSinGO6M4y1Cyc4dDyBwK6tJucgHuITe2Swxo90YltyMutTfx+GC0n8ZqxI6e2b2LkBXHGCSRTTj+ILe4suReeA5L3ELXEIZOxyV4ovXbfKtPYVqsouwqj9Znl+iaN3W1WNA9ihg3Abth+XB46IWWKn/ev3zn0f7HUOWDSJhOgYu8wBnQrU2U7AFLu7Lle27vz+Qf1nU7g9VSdHfYfgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prP20NUcYOYn1LzDrkbZO83kKym5mcV0Z8lzo0ZEmus=;
 b=bWpD7EO4/hxGO6widsKNxKL2fNvY7jz5y7fSqIiJZYFEkJmcGus4/4PYTW11YS7kGTzritX/FWMsoGZ+6YTwfpC+Rz572RIRX4Xp3dcv1oEWBF43sCwZ10rkLVbm0RVSATGOcivOIJko+jSaSa7m+894EVds6TtsVbgiKtz/FAFDA2huojcYYuIbrEmYmwzNzSzZST0oYXFiEk2kiAASL3G+RoG1OrsC9C/g+NizLqUQOMTpd5oSEtOGMQJlVesXiNJSk5hFJBVF8dEkQi5SLLWrEiMxoveqBc4g2J3MHUQwzDr08p1KSNcNivwfwxfu3kUIKu+OEzpmAroKgvVnCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 11:51:51 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 11:51:51 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 03/13] tests/intel/kms_dp_link_training: Extract
 train_link_config()
Thread-Topic: [PATCH i-g-t 03/13] tests/intel/kms_dp_link_training: Extract
 train_link_config()
Thread-Index: AQHdRZPmj3OBUekWlUG0YHExUpBvcLbahIIQ
Date: Tue, 22 Sep 2026 11:51:51 +0000
Message-ID: <PH7PR11MB6796EAB923033BCC472C1689E5832@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
 <20260916044801.1279102-4-kunal1.joshi@intel.com>
In-Reply-To: <20260916044801.1279102-4-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|MN0PR11MB6110:EE_
x-ms-office365-filtering-correlation-id: df70a551-fe7b-43f4-d7b6-08df189fe3f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|3023799007|6133799003|5023799004|18002099003|22082099003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: 4kvk1EYaSHt7AfHUUH7K9Q3ex1o36ZnPKdB7tMN/pvMiiLiRpnUtm/JJitvt5x2hfj9FzX35M+SqxsMPNxBW02k0i1hU34g4MvbzzF2KulREUwQg6Qg8JmBFnD9VKo5oG6vTF8Crt34M5pYKAFQCG0FmDtJJcTnz9q+OMewEn81L0ppCk+TMTGp3dt0fO8M5RK8m3pdRhD5+LgkQSapsACqozXr99DfhX2Ww4tsDHZyqddFRs3ufSgA4R7/uhaCqpApsFfPk+AbKPFvOvhwTQjvV/8a5tOzz0R23OdeXJa3Ev8I7Pk4QUjTR4hpJvntyoDdK7tpammdiY9iMvp621BNH6ve7NPBkeikwzB4G0evWJfhKQhEkayspVRN0oRGJtSJbInmxtYiNOcvVnhuay49QvAQ/0OAlOX8I6W76bVGDVTbX1cqyzXMLKaEdGcNQeZ2iCB1oOxJv/iQYxKH2GsVFLsthtMCnObJzc48Ey3UoHB7Y90SSKgKC4995mXC2XwTR6ejx5SUXoLWUaVcKEfXG7Tu5uLKXt9pGUo2iHqek+08C3Y8IlOF2pMLxE42ZNvuDOPCw2HEFDaJ50MFnVgyhQGEDfeAFYNrTskXjVG+ftpY487XB2Vq+R95ouI7HW9USYCuC+NPBrygt86W1D9T4n/rhYMzTOU4tMAHS2eLgdoNMRpKd52gAk+lXy4E7oUkwZp9+RjeJZTHRE16ZuSBKINt1PfBsvMwWjnlAKus=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(3023799007)(6133799003)(5023799004)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m8z4G/C0gZLnVf+vBE+yxrslK758OqL5VwvB1Jex0mv5eecG8esrWG6luCFk?=
 =?us-ascii?Q?Ji0dG68RKD3ScPB1VnS4l3GdQOaA+0T+55BxjzCLC9/qqaBYt5/UvcU0YCE5?=
 =?us-ascii?Q?dxUiGaJvQLD31rM94VzXMVitm+2OEYbdaH/npCes30q+UsyHjHkGoXnlc/ni?=
 =?us-ascii?Q?sLV26GRmSPwnDFzMNqHDbHW0WJ+xQvOaKeNaVDJR9QFgwGPQrIv6O+WRVBIc?=
 =?us-ascii?Q?w9IizIK+Tl9LBnV5SkBRZz7/vv/py4zKgJAMMlqS8KOE/aDUn6BrZQ39tM9c?=
 =?us-ascii?Q?BO5bJaEwdHjH9VLdSEsmfge7Y9t/nKsksZ95ulcjeFuykks1ne7dKQ6SfR6J?=
 =?us-ascii?Q?v6qdKjVHzOtFEe6MQkJHmWCKPTp+5ZgsArVJFaFd1wT2cxappa0DqbSOwOvL?=
 =?us-ascii?Q?IdR9bo4lzIAZJxDMpUxhmPmGOxF6t3g4JuUzULeEQWwIfoZhWoMHsTA3KXUL?=
 =?us-ascii?Q?ejo+Y5PN589hOL9C2NY3IfFISfeTaCAv1qF3mBlNJJIZEOMPVwMzU9TOCFrG?=
 =?us-ascii?Q?W5XA1xgh1I1XFVYtOcW8R40N+MzwgLHK67QeA63Jcggbl2rt3KA1lMCFFXGM?=
 =?us-ascii?Q?CVzd/p7ow/WeYTkXg6mRnYkEMCsDmIR7fiHM0lEf75Nc2Udk0t9amVqnNRV9?=
 =?us-ascii?Q?bED6qFe+1g1q1ybUgZFEFzHGs7vlS0AywgplKXosCsJlhlW5BXqcnsuYCIdH?=
 =?us-ascii?Q?Ef3YFXjuhQsb4Bqo1MvJeTFs2AfDXBCXZJuKLYTGCuQCPbqpORnkn+f9ApTy?=
 =?us-ascii?Q?QRkLx5xMA3uWd4SOslCTbxTlPzxiQmQXNoZ6kmRv4FfeOOc9PzVaqMpdyuxo?=
 =?us-ascii?Q?3pAFyBjGBmmvaEs52erDOZdEmKkRc7xySBB9BLEJ7a3BayYcacn4jaDzvfsN?=
 =?us-ascii?Q?0FoF+nIrtkuxZGK6UebTtps0c5MrB8IUvQ7kBkqrNxwkbAtKnTbDe1DsflUP?=
 =?us-ascii?Q?651V/KXjM18/F6s1wyVS7eRlFdzdl1NwlBX9SwED6hRWCM9nSY+SZyTX4Fvn?=
 =?us-ascii?Q?BY5EkgdrE+oZBYbXaOsfqmq5HKl5lSZqHwpqqyrV0fdRkXjJg9ejwx3/QSBO?=
 =?us-ascii?Q?5nh9tTD9yj+GKPUgp34abrG1v8LuhmZUXfGjYSLrx8b8FJjDt4rQZGCvf873?=
 =?us-ascii?Q?CPK7sMy5Ck41ZJJmijOsWnzcmX+ol8+zT5uwFde34UxV/ziVHDuUGfVSdT/G?=
 =?us-ascii?Q?x/9irLzAR+XXtPeqdV+uZGrMb8A/kOf4e8ZQoA9Yv2o8+2bpT5LuRkblyu7c?=
 =?us-ascii?Q?dcD51xxJbxcDDsUJSm6LNCI/MnyVjHiBTwqcH/qK+lIjcoRc+8eim52V6W+n?=
 =?us-ascii?Q?TIy6H/uLVOBH+KSebZhdHtiT0CcwzMDmSWhegJQQLKIztXi8zhjGJEdzWBNP?=
 =?us-ascii?Q?q73g0CLIDumITMiADA4sRXPZCqAnkWWSzBlpKgSwUGok3xtFNYjiFJAeB9SV?=
 =?us-ascii?Q?66sq8cvYk6EIr1ZWi4Lfl9Xj7SkJs7sl6d9ASyJvAtFuFje3rGaOZbA7DU2m?=
 =?us-ascii?Q?OnNYkV5qzQtkthj/3f46MHuTdLWmBHxAbrrKvRBnWSuP0QSyLKtokcyUYfDb?=
 =?us-ascii?Q?xlHfuZXVv6drHaeCklkU1vAc/tm19IAXDxDSXSU/6ctk4s+Ko2LPzZF0JFXU?=
 =?us-ascii?Q?TjGKhiMQgWBvBpvl7Nx+OSHuOR0PeOcAc7KCMOphUtx+kZE6qfezGiS8Iugw?=
 =?us-ascii?Q?x41Ak6d1Ez0voQazCNXNoSvF2aThMmgV6gXp2lYNSCIRwQ//?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: G5PNqPGANBDIfjNy4SR3aViSljOxfPkn0+0T29IzkfXhEGySxDWPK+M7Mnn7lOul0ajhpwbTQAYyHl+018r+X+iVALrjUyL+imLL497Q6PrwSw2ZfOC0FA3FmsRNB6JqYe8LWjH/xdMSSYdKRFI2ecj8xmDald+xuvNXrH6qrKRDG0+iSvywQRjDT+JEQZFojJG2sWmBz5bCj8T4X9rrYOVkifvhFifmUmWhflA+EEGFBvUXq5gLqInJMvFZaQY9r8862Ye62LC6Rud9DBUr10XmDh/IrK5yzcGh7Leekt+cM3VgdXP1zffavOqgBnNn8qaH2zSg/so5IfJ+QF6PAA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df70a551-fe7b-43f4-d7b6-08df189fe3f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 11:51:51.2674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NI8BXLF4vXJ5bk8k00p9sY5+9Sc7Xh3DmtCj0+g08jsDtGLhp4mp2CmGHKPn66g8C6xId+NnDzyCvSy/vDMHRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
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

Hi @Joshi, Kunal1,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: 16 September 2026 10:18
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 03/13] tests/intel/kms_dp_link_training: Extract
> train_link_config()
>=20
> The force and retrain sequence is written inline in run_link_rate_test(),=
 which
> makes it impossible to run for more than one configuration.
>=20
> Extract it into train_link_config(), taking the configuration to train as=
 a struct
> i915_dp_link_config. Prep for training more than the maximum.
>=20
> While here, stop passing a drmModePropertyPtr to kmstest_get_property() i=
n
> assert_link_status_good(). That function returns whether it found the pro=
perty
> and allocates the out parameter on success; the existing call ignores the=
 return
> value, asserts on a possibly uninitialised value and leaks the property o=
n every
> call. Pass NULL and check the return. That also lets the SST and MST bran=
ches
> share one loop.
>=20
> The trailing UHBR assertion goes away with the move. It could not fire:
> the rate is asserted to equal the forced rate, and the forced rate was al=
ready
> classified as UHBR or not a few lines above.
>=20
> There should be no functional changes here.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/intel/kms_dp_link_training.c | 97 +++++++++++++++---------------
>  1 file changed, 48 insertions(+), 49 deletions(-)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index 2d5241246..595d78d98 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -72,9 +72,7 @@ static int check_condition_with_timeout(int drm_fd,
> igt_output_t *output,  static void assert_link_status_good(data_t *data, =
bool
> mst)  {
>  	igt_output_t *outputs[IGT_MAX_PIPES];
> -	uint32_t link_status_prop_id;
>  	uint64_t link_status_value;
> -	drmModePropertyPtr link_status_prop;
>  	int count =3D 0;
>  	int i;
>=20
> @@ -83,32 +81,54 @@ static void assert_link_status_good(data_t *data, boo=
l
> mst)
>  								 &data-
> >display, data->output,
>  								 outputs,
> &count) =3D=3D 0,
>  								 "Unable to
> find MST outputs\n");
> -
> -		for (i =3D 0; i < count; i++) {
> -			kmstest_get_property(data->drm_fd,
> -					     outputs[i]->config.connector-
> >connector_id,
> -					     DRM_MODE_OBJECT_CONNECTOR,
> -					     "link-status",
> -					     &link_status_prop_id,
> -					     &link_status_value,
> -					     &link_status_prop);
> -
> -			igt_assert_eq(link_status_value,
> -				      DRM_MODE_LINK_STATUS_GOOD);
> -		}
>  	} else {
> -		kmstest_get_property(data->drm_fd,
> -				     data->output->config.connector-
> >connector_id,
> -				     DRM_MODE_OBJECT_CONNECTOR,
> -				     "link-status",
> -				     &link_status_prop_id,
> -				     &link_status_value,
> -				     &link_status_prop);
> +		outputs[0] =3D data->output;
> +		count =3D 1;
> +	}
> +
> +	for (i =3D 0; i < count; i++) {
> +		igt_assert_f(kmstest_get_property(data->drm_fd,
> +						  outputs[i]->config.connector-
> >connector_id,
> +
> DRM_MODE_OBJECT_CONNECTOR,
> +						  "link-status", NULL,
> +						  &link_status_value, NULL),
> +			     "No link-status property on %s\n",
> +			     igt_output_name(outputs[i]));
>=20
>  		igt_assert_eq(link_status_value,
> DRM_MODE_LINK_STATUS_GOOD);
>  	}
>  }
>=20
> +/*
> + * train_link_config - Force one link configuration, re-establish the
> +link and
> + * check that the configuration took effect.
> + */
> +static void train_link_config(data_t *data, bool mst,
> +			      const struct i915_dp_link_config *config) {
> +	int current_link_rate;
> +	char rate_str[32];
> +	char lane_str[32];
> +
> +	snprintf(rate_str, sizeof(rate_str), "%d", config->link_rate);
> +	snprintf(lane_str, sizeof(lane_str), "%d", config->lane_count);
> +	igt_info("Training %s at %d lanes, rate %d\n",
> +		 igt_output_name(data->output), config->lane_count,
> +		 config->link_rate);
> +
> +	i915_dp_set_link_params(data->drm_fd, data->output, rate_str,
> lane_str);
> +	i915_dp_force_link_retrain(data->drm_fd, data->output,
> RETRAIN_COUNT);
> +	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data-
> >output,
> +
> i915_dp_get_pending_retrain,
> +						   1.0, 20.0), 0);
> +	assert_link_status_good(data, mst);
> +
> +	current_link_rate =3D i915_dp_get_current_link_rate(data->drm_fd,
> data->output);
> +	igt_info("Current link rate is %d\n", current_link_rate);
> +	igt_assert_f(current_link_rate =3D=3D config->link_rate,
> +		     "Link training did not succeed at the forced link rate.\n"); }
> +
>  /*
>   * setup_planes_fbs - Create solid-color FBs and attach them to the prim=
ary
> plane.
>   */
> @@ -188,12 +208,8 @@ static void do_modeset(data_t *data, bool mst)
>   */
>  static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)  {
> -	int max_link_rate;
> -	int max_lane_count;
> -	int current_link_rate;
> +	struct i915_dp_link_config config;
>  	bool is_uhbr_output;
> -	char rate_str[32];
> -	char lane_str[32];
>=20
>  	igt_display_reset(&data->display);
>  	i915_dp_reset_link_params(data->drm_fd, data->output); @@ -208,12
> +224,12 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uh=
br)
>=20
>  	/* FIXME : Driver may lie max link rate or max lane count */
>  	/* Read max_link_rate and max_lane_count */
> -	max_link_rate =3D i915_dp_get_max_link_rate(data->drm_fd, data-
> >output);
> -	max_lane_count =3D i915_dp_get_max_lane_count(data->drm_fd, data-
> >output);
> +	config.link_rate =3D i915_dp_get_max_link_rate(data->drm_fd, data-
> >output);
> +	config.lane_count =3D i915_dp_get_max_lane_count(data->drm_fd,
> +data->output);
>=20
>  	/* Check sink supports uhbr or not */
> -	is_uhbr_output =3D i915_dp_is_uhbr_rate(max_link_rate);
> -	if ((uhbr && !is_uhbr_output) || (!uhbr && is_uhbr_output)) {
> +	is_uhbr_output =3D i915_dp_is_uhbr_rate(config.link_rate);
> +	if (uhbr !=3D is_uhbr_output) {
>  		igt_info("Test expects %s, but output %s is %s.\n",
>  			 uhbr ? "UHBR" : "NON-UHBR",
>  			 data->output->name,
> @@ -222,26 +238,9 @@ static bool run_link_rate_test(data_t *data, bool ms=
t,
> bool uhbr)
>  		return false;
>  	}
>=20
> -	snprintf(rate_str, sizeof(rate_str), "%d", max_link_rate);
> -	snprintf(lane_str, sizeof(lane_str), "%d", max_lane_count);
> -	igt_info("Max link rate for %s is %s, lane count =3D %d\n",
> -		 data->output->name, rate_str, max_lane_count);
> -
>  	/* Force retrain at max link params */
> -	i915_dp_set_link_params(data->drm_fd, data->output, rate_str,
> lane_str);
> -	i915_dp_force_link_retrain(data->drm_fd, data->output,
> RETRAIN_COUNT);
> -	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data-
> >output,
> -
> i915_dp_get_pending_retrain,
> -						   1.0, 20.0), 0);
> -	assert_link_status_good(data, mst);
> +	train_link_config(data, mst, &config);
>=20
> -	current_link_rate =3D i915_dp_get_current_link_rate(data->drm_fd,
> data->output);
> -	igt_info("Current link rate is %d\n", current_link_rate);
> -	igt_assert_f(current_link_rate =3D=3D max_link_rate,
> -		     "Link training did not succeed at max link rate.\n");
> -	igt_assert_f(i915_dp_is_uhbr_rate(current_link_rate) =3D=3D
> is_uhbr_output,
> -		     is_uhbr_output ? "Link training didn't happen at uhbr rates"
> :
> -		     "Link training didn't happen at non-uhbr rates");
>  	igt_info("----------------------------------------------------\n");
>  	return true;
>  }
> --
> 2.25.1

