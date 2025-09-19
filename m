Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7532CAC592
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 08:19:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4F010E22A;
	Fri, 19 Sep 2025 08:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8E3N4A2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E0A10E22A
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758269982; x=1789805982;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xkt23QwBPRDanCnMfqoUpYX36unMjrV8xJ+jP3KJowI=;
 b=W8E3N4A2YvuqoUFdhDObJUUS3y75pAB6brBb/J4CRtSg2Cz7t60KdojY
 bDNZT/7J6fIP+cCCx72cz7u+aWZHK5be3L5Xv6Qk2a45dgKKDdjV12Jn4
 WsqGO4iF2bWgSLwQZ9G8L/5Sf43Yotw2UKs95wTJSDudvBKZzwCqbbAqA
 J01NcsdffZEOLsyME/kg3fzA+SnR8N3v2LZfzHNCuNRMOXvzudbFA4VwZ
 9z46x6wo3VipxO5Nbp8eZSISP9bwmKrmA7/SVcZPe8egpiWHfxamLs9DU
 KXLR1l8BsTwljOU6WyhvHF82DnDZKblG/dCLC06xKkPdk9WmAZhZAbYpM w==;
X-CSE-ConnectionGUID: apkxXET6Q02bzXuJwsSr2w==
X-CSE-MsgGUID: /Fj7mJIzRYuQWJyYUwoZFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="83213880"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="83213880"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 01:19:42 -0700
X-CSE-ConnectionGUID: JiFOSIorT/aUZOls87jnWg==
X-CSE-MsgGUID: VdkU0g9pSj+S9FwTTV56Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="180032052"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 01:19:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 01:19:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 19 Sep 2025 01:19:41 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 01:19:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AS2On2TlWy9G2i7fuKxWQ8jMS0LB0tXiJXvHryOE33/2kkk0GwweMIaPCzBzNlvLxxm61ovcS1aShAOEMe9L0YxB1zsaTMu//g36xtD9D12jYlt7oj3B12G0qN0dzs0kN/Z/we8pw0VbWCbgHkhv0VrYv++b51e1FsMYeubW4RviAHoeNdTe5jAg+XkbSDF7ZMq/BXvz5XaG6mTvtA3ztN0hGzi5j4u5s1Nh03VzO74y9BM16+85bGa+gD6NgAe48mxVYtSBW2u5xL0THKCp8bT8/qdA5+EUyDrqRQeJhyd6s3Vn2oHccI0TkV5onrIP8nTKGnqTKTofASE2zmacXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5m/eUS1ZTghqTYH/w4xTydmjE2cZmUh6TIzdq2dDdk=;
 b=uFAhiDE9f5Q8tsBYfU/5Knl98lavIt2sfm024x0kEU8x2vUQ0CWhdIbizXefsfjPWGb0cUB4D6O8cU67TDndDuHxg1LiVjWmWo+s0BZhh/wHK7S56EisS4Es4dufdpFTUnPWr+8BG4If+gbu75Zck1PWmnu2fWiNDR2pdVDx06Ej10hqhACL1QzyUG0CWZ4cM2pql3QKvrg9We2C8VwNo3W/GYPSXR8bdwtNSF/uvsGaFECKdX12++Lr7011QsKXCsinAFeXgBtpC71kpZVpbCHcN/M47o3U37eGibJc9sYIvZlVQ8R/YZGZl1vABqShURa9TRdsYgtSc5hxLr9IFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS0PR11MB7288.namprd11.prod.outlook.com (2603:10b6:8:13b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 08:19:37 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 08:19:37 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Thomas, Sobin"
 <sobin.thomas@intel.com>
Subject: RE: [PATCH v6 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Thread-Topic: [PATCH v6 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Thread-Index: AQHcJ7t0GdySym8kv0CGh3evV4Q/9LSaK+EQ
Date: Fri, 19 Sep 2025 08:19:37 +0000
Message-ID: <CH3PR11MB84340AE3825F7ABDF2E7555C8D11A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250917101105.236457-1-sobin.thomas@intel.com>
 <20250917101105.236457-2-sobin.thomas@intel.com>
In-Reply-To: <20250917101105.236457-2-sobin.thomas@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS0PR11MB7288:EE_
x-ms-office365-filtering-correlation-id: 413a671d-44d8-4251-fdd5-08ddf7554610
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?vC4e770Ne4hYmskhxuDzdHVt4pt8pGM07ERfSXDCZ9+eeCbnUkvbSLEdQG0E?=
 =?us-ascii?Q?CjrLX4jNTJXFovMmOXgEic1pRPthGx9uOEkWXrul1NLaTmq7Htg+3iTgLmST?=
 =?us-ascii?Q?4zmbmreMeNowpBT4WQdbslO3Kd4WLKC9DptI4YPssvZkDTSbBSEMTZ+8FV9D?=
 =?us-ascii?Q?5x1aFYms6VxK2YfJt0hBEEH441K5ZOQTkccuS4kw0bt6MFb2+FEhNZodUClX?=
 =?us-ascii?Q?hTHfI/Z6135NA2xu07smg6itlefh0iDO6wOa65Iz4ihdj1WWpM0mVbuCQtPw?=
 =?us-ascii?Q?aPQgDyiYnbgvluYwF2pBoyy4Ogqwe9rdcs8XBtceCORfwffgRGwbVKmAD9pU?=
 =?us-ascii?Q?iAOndYNLtZV0toGSaknx+PVAnvsrZZFbv+38coeTOWich7P+PFg+7tDjq4nv?=
 =?us-ascii?Q?FGXJ1V18lKrodzTbHqyZ9TNUFljBOxy9lhO//u2iFxzLCK1V8z6dW3al1fx6?=
 =?us-ascii?Q?sGIt9LDxrpgB9QYM7P9Geh2v/Fop0SkyOD7bMkzmKP9G8OC9jMeNW79aa8Op?=
 =?us-ascii?Q?t7vldJ0jTwOxy59XfV45HWbQASGtFGlNyJNSpVY2AXJlxNTmDUFwqBoJ9P5R?=
 =?us-ascii?Q?A7UvIkW7oLYVYPV8MdPveuTSmTMYgHZafUzPXYb5zJflFDM1R5/f86TW/bhL?=
 =?us-ascii?Q?lwM5LC5jf/Rsyhg09nIEkxVRoYEE1XTBtxTnYPfyfwbeLKpYVvnWtS8wOZFB?=
 =?us-ascii?Q?UtkSypKnD3NKNbwG5oxkwdIzxAKRke3tQtTKZXsBSsi1c8fJEVnZYbGwCC39?=
 =?us-ascii?Q?6MXfNNLMZUs77mwzaiYY8TQ42JuLSfEGNX6aOzkSI9Uh5nWZnboDJPNOf2c3?=
 =?us-ascii?Q?ViO7yQ6d5iG4YU63Mns1KNcxIKxlg/qNwBQsz8s5+M8rBpn4VnyIETld5+Yd?=
 =?us-ascii?Q?OGGeeu4VEYYjB4jUBs1ZXx1otQrYADXPbObiH8qm6Z+kk/ZexovbqLPENib/?=
 =?us-ascii?Q?Lwxv5k+lC/wRGGsDLmlIEKiuDd+3CvruIUCtkZE7k1LQMtm9ZB7j6vaWmRJS?=
 =?us-ascii?Q?sr6Ljj5VF5ugJctUL92wJqR2r8wEMuDwUXg7RdoP9y6UI2gU+bFYFwvISvke?=
 =?us-ascii?Q?rplHfS+b9dNbKeAFHDumhrpizosT7M07N/eQFnwGmpgo6dIsFVQNossieg0q?=
 =?us-ascii?Q?Biji/o4/Ce0Mw7CCEPCfTLaAnoCwg/mCFEgL7nt52SwNuAQSqNZsvwnzevVY?=
 =?us-ascii?Q?EES4ar5BwF7xoHmTOmcaEdwYoLT/8pHxWxSsEs3DEDGLjFInCOwWRWYS4sR7?=
 =?us-ascii?Q?E20k6Nicb2yVDTK/XR5Oq0y3fNYDaUT7jjdoLRDVAKv2SAw8fw4oDm0RQUnz?=
 =?us-ascii?Q?/IVBO1OvDtkiC2K7BvCfO0DnxN7r9mPqOqtoNF1XrWVkD/nX2C0G89XWyE5p?=
 =?us-ascii?Q?A61WlZQMGAZlDpMR00YQg/IxLXjhiqEA3W4eYP1YdlBDcnDQt9TJQUb5Pa6e?=
 =?us-ascii?Q?AYveJVn0p/9tgKt6+Rm9WyEl3qnpECMSLPkRAIlMAzmetnYnzfSYzOvwkwfT?=
 =?us-ascii?Q?J2h3C7mNZK/8PYY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0h3HvTDN+unGLpKb61mXP+HC7hAHMunEhSpsv19J1Uju9hjqTd9emJJPvCzx?=
 =?us-ascii?Q?uaZlVPwMABTwD44X/8wHpBO96r1XFP1T3bKJlwZHOIPWsD8nE9eTUsAc0dmj?=
 =?us-ascii?Q?6MLURNC06u3qoRNuc9U1h/Z4rgLbsNlwtJb+X31Fabyb/7uTzseWt20hyqTx?=
 =?us-ascii?Q?EVLGM/3znOnws4os9dbNu6ryDqauPBPRBwPvwNwjdinEdumkONAeZm81TYo1?=
 =?us-ascii?Q?S5FcmoouJoXqYt6lNPDKwM39YG2sTloPuuzBw+JyrKFrqDyEbsXYYkv8Inil?=
 =?us-ascii?Q?tjKwI2QLGzhYhuhBsd4tjYetdLsET//QWDRk6hXw1puBCEAzrSyJDnHTVlDS?=
 =?us-ascii?Q?XY66wLXKXz3r4IuJWzrqlSsD1RCbzIz5ybI7mMr6ycgchfkChW4lwzMBQWWP?=
 =?us-ascii?Q?Qq6iuwPV+By9/vaDNPpPPNw/wgTIONweyfZmuTVjgk9z9J1JRsiHN58qg5Ag?=
 =?us-ascii?Q?A+0gYKHzyfvxpcdq2aMPRnIwERD/S7q9T60/lurD+RRvdFUO9WtNtWCvnK19?=
 =?us-ascii?Q?tcocRfNiOxifvJj3IfRUXzoqRwQRPvtcZsRSyV0tl/C0l7cNlAeVZNmfb42h?=
 =?us-ascii?Q?Iv9132Gi20vTiv6LC8VKwJgCLyUPXqtp3BMj2REIprBLYic5/zbJV3Roqisf?=
 =?us-ascii?Q?DHANf1dSdOzqvDOXNAwzICpqbWhYrq0zr0P1YDm2oXn2+Ofe5psX1HYbHCv1?=
 =?us-ascii?Q?FXtqeZ4P/RfBMA+zqylS01Q3ebLH3ImH+Pmsepms8L8nN7K00FjK07X9npjg?=
 =?us-ascii?Q?WVt5l4qc5qimHMRJLIQ8rLyF9dYOGe6Jj/qUwIiIqvgsuR+hQsEC8r3jM0/M?=
 =?us-ascii?Q?sMGUC17AIcjdPRRtJxSKJY8ZUIFa0NINaL+TPZFs2eDpeE3RFoXAJJ2cWicQ?=
 =?us-ascii?Q?bC0ALOMsIddzrepWRQiSeWr8NJqGTpYC6J3FTansBghA51Zxu6TdofVzbsz4?=
 =?us-ascii?Q?kEMu7w5Y+Dk99Z1+Wgp/UEGdtz+ejmxUL69Jcuzae8/Ebbcw3wO3f1LWll+6?=
 =?us-ascii?Q?KfuwIPmnqygNFI3ZyX0BHgglhEjQCkU3ikN2aGpCH4rglCvxRv1Jp2rH8Ir5?=
 =?us-ascii?Q?01CkpYpnNsUwvm0LSC4BWpPyvjMmqllqXezEsLZx5QcvHCwtifSa760bI2gU?=
 =?us-ascii?Q?6bsjBb9eFwpUSMGNzJCaPBNQ+3Z3DUKr9/K8H8Rl8pqulEA0En8qFICAIDVF?=
 =?us-ascii?Q?Hugd3S9L3McPTDSn5/6Eez6Di5alwyYKpJHs3qVJ15A1s51yqIQvHmHxu7n7?=
 =?us-ascii?Q?jEKIM9zs6J77wuxi3ca2+yZPBlYGyP8aKmYBsAdRbNuxQWUgq9OEaviSy4jX?=
 =?us-ascii?Q?dvD7Ri0L4+5Hc4NkVj805w6OwTYv4rAGRTjhIkUKljot0N7SxKMHEu6ZR9jh?=
 =?us-ascii?Q?S6W6/A8/1z5hOREZNHNYbAhDuB2x9I7Vb3K4gZ1hmArugFRepNn/NJ24PUYw?=
 =?us-ascii?Q?Xi2zyJGcLb2XmQ+tvKzlINCnP7iFBKz251kR2QZBR9MNLWUmdu2iPAH37w4B?=
 =?us-ascii?Q?X2h9zKvyOicwD/kbLumA95CAsolk92dsiucytLJ9+tOypeNx7uWTrN+vhh/B?=
 =?us-ascii?Q?8tM4himta+LCVSxNjkyT71cPERSQ8q+4zJJCc0Bz5a3t+Yd1tXmUwa/5Kira?=
 =?us-ascii?Q?ZpBQM2mE//CXcQZM4acK2GLn6gM8XTMwpPLAuDFtm7n2v2HJYVOQ+yhYceX4?=
 =?us-ascii?Q?SEOxsQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 413a671d-44d8-4251-fdd5-08ddf7554610
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 08:19:37.6194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yj/v/9mCwdkbC9Gbe9Ayp7XSnzEWrWsxJKHmFh2O+Syo5x/zyWEOB7Zothz1XEh49qin1kvV9+9CEfjuaM/qvdEPxZvpjJpWRVs5DHAVZiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7288
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sobin
> Thomas
> Sent: 17 September 2025 03:41 PM
> To: igt-dev@lists.freedesktop.org; Konieczny, Kamil
> <kamil.konieczny@intel.com>
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Thomas,
> Sobin <sobin.thomas@intel.com>
> Subject: [PATCH v6 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute
> preemption check
>=20
> On platforms (like PVC) that do not support walker mid-thread preemption,
> running tests in forked threads can lead to inconsistent states due to ig=
t_skip
> being called mid-execution. Made changes to perform kernel preemption
> check at the beginning of each subtests.
> If the GPU version does not support the required features, the test is sk=
ipped
> gracefully, ensuring consistent behavior across different platforms.
>=20
> TODO: Add the kernel for PVC
>=20
> v2: Fixed review comments to move the compatibility check
>     into the igt_fixture. [Priyanka]
>=20
> v3: Added check for thread group preemption and WMTP.
>     Added enum flags for preemption type as per review . [Zbigniew]
>=20
> v4: Added check for preempt inside __run_intel_compute_kernel_preempt
>     Refactored the code.  [priyanka]
>=20
> v5: Refactor for finding the kernel and out of bound check. [Zbigniew]
>=20
> v6: Added NULL Check for kernel. [Zbigniew]
>=20
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  lib/intel_compute.c              | 104 ++++++++++++++++++++++++-------
>  lib/intel_compute.h              |   7 +++
>  tests/intel/xe_compute_preempt.c |   6 ++
>  3 files changed, 95 insertions(+), 22 deletions(-)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c index
> 147dd2916..93f56b1b0 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1921,14 +1921,33 @@ static const struct {
>  	},
>  };
>=20
> +static const struct intel_compute_kernels
> +		*intel_compute_find_kernel(const struct
> intel_compute_kernels  *kernels,
> +		unsigned int ip_ver)
> +{
> +	if (!kernels) {
> +		igt_debug("%s: kernel_list is NULL\n", __func__);
> +		return NULL;
> +	}
> +
> +	while (kernels->kernel) {
> +		if (ip_ver =3D=3D kernels->ip_ver)
> +			return kernels;
> +		kernels++;
> +	}
> +	igt_info("%s: No Match found for ip_ver=3D%u\n", __func__, ip_ver);
Here instead of info just debug can be added.
> +
> +	return NULL;
> +}
> +
>  static bool __run_intel_compute_kernel(int fd,
>  				       struct drm_xe_engine_class_instance
> *eci,
>  				       struct user_execenv *user,
>  				       enum execenv_alloc_prefs alloc_prefs)  {
>  	unsigned int ip_ver =3D intel_graphics_ver(intel_get_drm_devid(fd));
> -	unsigned int batch;
> -	const struct intel_compute_kernels *kernels =3D
> intel_compute_square_kernels;
> +	int batch;
> +	const struct intel_compute_kernels *kernel_entries =3D
> +intel_compute_square_kernels, *kernels;
>  	enum intel_driver driver =3D get_intel_driver(fd);
>  	const unsigned char *kernel;
>  	unsigned int kernel_size;
> @@ -1954,12 +1973,8 @@ static bool __run_intel_compute_kernel(int fd,
>  		kernel =3D user->kernel;
>  		kernel_size =3D user->kernel_size;
>  	} else {
> -		while (kernels->kernel) {
> -			if (ip_ver =3D=3D kernels->ip_ver)
> -				break;
> -			kernels++;
> -		}
> -		if (!kernels->kernel)
> +		kernels =3D intel_compute_find_kernel(kernel_entries, ip_ver);
> +		if (!kernel || !kernels->kernel)
>  			return false;
>  		kernel =3D kernels->kernel;
>  		kernel_size =3D kernels->size;
> @@ -2193,24 +2208,46 @@ static const struct {
>  			     bool threadgroup_preemption,
>  			     enum execenv_alloc_prefs alloc_prefs);
>  	uint32_t compat;
> +	enum xe_compute_preempt_type preempt_type;
>  } intel_compute_preempt_batches[] =3D {
>  	{
>  		.ip_ver =3D IP_VER(20, 01),
>  		.compute_exec =3D xe2lpg_compute_preempt_exec,
>  		.compat =3D COMPAT_DRIVER_XE,
> +		.preempt_type =3D PREEMPT_WMTP,
>  	},
>  	{
>  		.ip_ver =3D IP_VER(20, 04),
>  		.compute_exec =3D xe2lpg_compute_preempt_exec,
>  		.compat =3D COMPAT_DRIVER_XE,
> +		.preempt_type =3D PREEMPT_WMTP,
>  	},
>  	{
>  		.ip_ver =3D IP_VER(30, 00),
>  		.compute_exec =3D xe2lpg_compute_preempt_exec,
>  		.compat =3D COMPAT_DRIVER_XE,
> -	},
> +		.preempt_type =3D PREEMPT_WMTP,
> +	}
>  };
>=20
> +static int find_preempt_batch(unsigned int ip_ver) {
> +	for (int batch =3D 0; batch <
> ARRAY_SIZE(intel_compute_preempt_batches); batch++)
> +		if (ip_ver =3D=3D intel_compute_preempt_batches[batch].ip_ver)
> +			return batch;
> +	return -1;
> +}
> +
> +static bool is_preemptable(int batch, enum xe_compute_preempt_type
> +required_preempt) {
> +	if (required_preempt &&
> +	    !(intel_compute_preempt_batches[batch].preempt_type &
> required_preempt)) {
> +		igt_info("Preemption not supported\n");
> +		return false;
> +	}
> +	return true;
> +}
> +
>  static bool __run_intel_compute_kernel_preempt(int fd,
>  		struct drm_xe_engine_class_instance *eci,
>  		bool threadgroup_preemption,
> @@ -2218,15 +2255,12 @@ static bool
> __run_intel_compute_kernel_preempt(int fd,  {
>  	unsigned int ip_ver =3D intel_graphics_ver(intel_get_drm_devid(fd));
>  	unsigned int batch;
> -	const struct intel_compute_kernels *kernels =3D
> intel_compute_square_kernels;
> +	const struct intel_compute_kernels *kernel_entries =3D
> +intel_compute_square_kernels, *kernels;
>  	enum intel_driver driver =3D get_intel_driver(fd);
> +	int required_preempt =3D threadgroup_preemption ? PREEMPT_TGP :
> +PREEMPT_WMTP;
>=20
> -	for (batch =3D 0; batch < ARRAY_SIZE(intel_compute_preempt_batches);
> batch++)
> -		if (ip_ver =3D=3D intel_compute_preempt_batches[batch].ip_ver)
> -			break;
> -
> -
> -	if (batch =3D=3D ARRAY_SIZE(intel_compute_preempt_batches)) {
> +	batch =3D find_preempt_batch(ip_ver);
> +	if (batch < 0) {
>  		igt_debug("GPU version 0x%x not supported\n", ip_ver);
>  		return false;
>  	}
> @@ -2238,14 +2272,16 @@ static bool
> __run_intel_compute_kernel_preempt(int fd,
>  		return false;
>  	}
>=20
> -	while (kernels->kernel) {
> -		if (ip_ver =3D=3D kernels->ip_ver)
> -			break;
> -		kernels++;
> -	}
> +	if (!is_preemptable(batch, required_preempt))
> +		return false;
>=20
> +	kernels =3D intel_compute_find_kernel(kernel_entries, ip_ver);
> +	if (!kernels) {
> +		igt_debug("No Matching kernel found for ip_ver=3D%u",
> ip_ver);
This debug info whether null or not matching is already present in the comp=
ute find kernel method, again no need to use this print. This entire if con=
dition can be removed and add it in the below if condition like added  in _=
_run_intel_compute_kernel if (!kernel || !kernels->kernel)
> +		return false;
> +	}
>  	if (!kernels->kernel || !kernels->sip_kernel || !kernels->long_kernel)
> -		return 0;
> +		return false;
>=20
>  	intel_compute_preempt_batches[batch].compute_exec(fd, kernels-
> >long_kernel,
>  							  kernels-
> >long_kernel_size,
> @@ -2260,6 +2296,30 @@ static bool
> __run_intel_compute_kernel_preempt(int fd,
>=20
>  	return true;
>  }
> +
> +/**
> + * check_kernel_preempt- Checks ip version to confirm if  provided
> + * preempt type is supported.
> + * @fd: file descriptor of the opened DRM Xe device
> + * @required_preempt: Preemption type ( WMTP/TGP)
> + *
> + * Returns true on success, false otherwise.
> + */
> +bool check_kernel_preempt(int fd, enum xe_compute_preempt_type
> +required_preempt) {
> +	unsigned int ip_ver =3D intel_graphics_ver(intel_get_drm_devid(fd));
> +	unsigned int batch =3D find_preempt_batch(ip_ver);
> +
> +	if (batch < 0) {
> +		igt_debug("GPU version 0x%x not supported\n", ip_ver);
> +		return false;
> +	}
> +	if (!is_preemptable(batch, required_preempt))
> +		return false;
> +
> +	return true;
> +}
> +
>  /**
>   * run_intel_compute_kernel_preempt - runs compute kernels to
>   * exercise preemption scenario.
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h index
> 412791d07..b70cd7185 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -71,6 +71,11 @@ enum execenv_alloc_prefs {
>  	EXECENV_PREF_VRAM_IF_POSSIBLE,
>  };
>=20
> +enum xe_compute_preempt_type {
> +	PREEMPT_TGP  =3D 1 << 0,    /* ThreadGroup Preemption */
> +	PREEMPT_WMTP  =3D 1 << 1,  /* Walker Mid Thread Preemption */ };
> +
>  extern const struct intel_compute_kernels intel_compute_square_kernels[]=
;
>=20
>  bool run_intel_compute_kernel(int fd, struct user_execenv *user, @@ -81,=
4
> +86,6 @@ bool xe_run_intel_compute_kernel_on_engine(int fd, struct
> drm_xe_engine_class_in  bool run_intel_compute_kernel_preempt(int fd,
> struct drm_xe_engine_class_instance *eci,
>  				      bool threadgroup_preemption,
>  				      enum execenv_alloc_prefs alloc_prefs);
> +
> +bool check_kernel_preempt(int fd, enum xe_compute_preempt_type
> +required_preempt);
>  #endif	/* INTEL_COMPUTE_H */
> diff --git a/tests/intel/xe_compute_preempt.c
> b/tests/intel/xe_compute_preempt.c
> index c9b194869..a4c0bc59b 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -76,6 +76,7 @@ igt_main
>  	}
>=20
>  	igt_subtest_with_dynamic("compute-preempt") {
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -86,6 +87,7 @@ igt_main
>  	}
>=20
>  	igt_subtest_with_dynamic("compute-preempt-many") {
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -112,6 +114,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-all-ram") {
>  		igt_require(swap_mb > CONTEXT_MB * 10);
>=20
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -138,6 +141,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-vram") {
>  		igt_require(xe_has_vram(xe));
>=20
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -164,6 +168,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-vram-evict") {
>  		igt_require(xe_has_vram(xe));
>=20
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -188,6 +193,7 @@ igt_main
>  	}
>=20
>  	igt_subtest_with_dynamic("compute-threadgroup-preempt") {
> +		igt_require(check_kernel_preempt(xe, PREEMPT_TGP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> --
> 2.34.1

