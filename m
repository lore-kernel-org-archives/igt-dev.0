Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFAFC369A2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 14:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18A310E60D;
	Mon, 14 Apr 2025 14:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrzfFR+O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF3310E5FA
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 14:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744642184; x=1776178184;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZB9JGgzf3fR0EBSIOS7Pxgs8kde14/STBPFGWAjd23M=;
 b=mrzfFR+OcBsdBDjcrFXr3Q9b6hlHfCRF45LdtresYsPvWNbxASgQ80sV
 6N7mHrY9ngpCDCAsQLpZwQ8s5IDzw+q2jylqsQ0ycK1Wtix2olfr7qy/U
 LYKQvHF9O9Pv1PaT3m9AUUlKETlNob7LWBgECHcW9zFrqeKTn7BC091aC
 rn8L6TFyjO5NgZUnbi0XA+YNb7adoquT2rOoQN9neb2VQMC7M9Ai7gwMW
 ioC1Yn3qGIZKhpdOHGCmE40Nw2j+M1suGuoS6MZVSB3N4oO1C+yVWLKwz
 nFCx73g8vZlJR8oqxN1aot/Jhz+FFdAlGvd3UbVaaMdCPWGVn+1+yp3h0 A==;
X-CSE-ConnectionGUID: r+0FNRZkQ/aCRT/vdou13w==
X-CSE-MsgGUID: J0a8KdxKRY+T2eV+k5k3tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57503220"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="57503220"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 07:49:44 -0700
X-CSE-ConnectionGUID: H82bxrxaRsSwRZ5Buot3VA==
X-CSE-MsgGUID: /vdEz0fUQ9+oyivlR9DABg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="167003827"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 07:49:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 07:49:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 07:49:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 07:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9eoqgk0slVIKcdLI/lt2gxoh2t9JwZp4lqHzSlWjABnIaCrVrjRkM/ioWBAN6Gul4fOs30j6nBVMVNlJcvcJCq7PeeCumGhtBjdg5oIbAolR/OuiemBCGY9eJi/4sbHiFWoUhSipqBAHiIHZJDMHT6385wUzBcOHosxCAADklPPZ0ZOvAC3lzcwl6wr3CqVsOimvvkseUMBGTmpj9bFI5AwwksQZFgIIfPYRik3nz9PU2hsfel6SgrURzbviH/zfcijC+Jcpof+P3/xbYpGyCJLbN6tgxBvepLw7L8SNOwHtMkySuUbZC8qk+JqojToNuddpw6pXXjyNITkNIsi8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAnDL+zlx9gXkd8eywFqLMbA5ViMSWNgl7AfcEJW1/o=;
 b=gGj2Gi8I3PKhwhCbbi0a5cOQRZ6gjtt05ykGOSjsntkRJODDWA4V6fSFy3xGaWVHGxHvFg1bFmHIHKNWJzFYcNBQR1IrUB9DmHQA1gOongZeMtG5fceo0clYJFh/uxeYgUu/D4yE7DCBeR5b2O6mpuf5q23ENvwu2uN4DY6AdT5DcE3GFZQavmHbU9znBHN+3TUrzWRZzqjw3twvHzaDC+LOkne6IVsUoYw+olGT6D4vNl5JhF31JiR3GuVN6bpmH9U9FbewEr/E3FDkcU9yJ8g7vGNChTUZjM2D0l91BFO8f2wuUvzAmK1zodAHvu2nSeC74SgM+A5tBo8/jKbVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 14:49:24 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 14:49:24 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject
 errors in xe_guc_* calls
Thread-Topic: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject
 errors in xe_guc_* calls
Thread-Index: AQHbrUi5bXq3Riyrs0yzNP+me2HE6bOjOWsA
Date: Mon, 14 Apr 2025 14:49:24 +0000
Message-ID: <CH0PR11MB54442A3E0DB6AB16D3B4952FE5B32@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250414143842.14981-1-satyanarayana.k.v.p@intel.com>
 <20250414143842.14981-3-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250414143842.14981-3-satyanarayana.k.v.p@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB5952:EE_
x-ms-office365-filtering-correlation-id: 21c53274-e84f-4f0a-9eb0-08dd7b638c66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?xv3Pw46/llh3Hjd0aTpipE1O03XpWqlKb50faPQ0/d0dPnfyF71itmvp9n?=
 =?iso-8859-2?Q?/+yzwtr58oBywLD7O3KJgeSMOrdeW09H5xAvo4pteZMfH0VJuQFWjTUPQi?=
 =?iso-8859-2?Q?OU/hI/8kvumR0p/+dg1IDidvxPVawIr1HhLJfY6cqHQY5rgU4gjG8/ypIy?=
 =?iso-8859-2?Q?Kk6/oSGXvJUoQpGlN4mnqdVTzfwVRMzTY9vAjjJQHh5Efr+y+b2AX3/Khv?=
 =?iso-8859-2?Q?uJb00eNpbpfW7gmXj05gsHzyNZPsmnzuk32VFpujMpZ2rtr/IZPgYZQHpq?=
 =?iso-8859-2?Q?LlgZxOSYIWKHe93XawkDbmgdV0jkfWPX/vuUpm6ButdpnYQ+ZnB7d0lPEA?=
 =?iso-8859-2?Q?FBFUIgIwB5NM0YUP4styut4Dc9roKlqWb2sP1t5+gh8yTHfPCzOMuz+Obe?=
 =?iso-8859-2?Q?e7oHMPIngx9T3s+ZoY7CjbfpyAYMBiq7miy3bB0/A9aFYX3ClEygGAPt0z?=
 =?iso-8859-2?Q?SqhyLfB0C6mvjpxbrDI6xDEZ2vSirjj8KkgVcCebfAAL6CLcQH2ZJE5Ey4?=
 =?iso-8859-2?Q?62MoAN4sIH9m9Cu/VHykVvQvH/1xfHXkAMTIxGve5K8l8MHOuyFuk7VthB?=
 =?iso-8859-2?Q?jR40RtuhlAczh96oo6HZUC9xyrKKiG9LvuZntV4d/aN6gX3HeyGgez7LHs?=
 =?iso-8859-2?Q?fk99SiTzk/j0NLFSRk5QtbVVdPdgiXjQBlyBMaVVmC3R45LNFrsZiTfp2G?=
 =?iso-8859-2?Q?AiER+YJdfCVaPTf7kGMxMMqq4AcWgXs0D0PUcbsLkyvo7CqpQi3Uj4w0W/?=
 =?iso-8859-2?Q?tfbuJne6NH7K5l6j+LF+Lktzcpn3LdqJ9rOsXGK/92EsWcKNNAGjKNSL8d?=
 =?iso-8859-2?Q?YXCJm7Njsh0PGRp8Iooqx3Q+ADGGmCNkNzUaE3HaBc4aM3GvcnWDihW4Qh?=
 =?iso-8859-2?Q?y5bUzxLhMq/6KJUcRaV2lkA/rBNHNua+0p0v/Fk/6RC0HpHLY47NlLy8DT?=
 =?iso-8859-2?Q?mUydva9mJBS0ue5ovIW7FJYI3D6j9ugtjMRD6a02qnZ6+6tajMytUzz0cD?=
 =?iso-8859-2?Q?1Yz582G9qN3dz3kf02T50ju36AwhfIcBAai3lOyuHuWecOuC+RDXSmqQGu?=
 =?iso-8859-2?Q?YYzs9cKJ9wEWE8n8LoWeDwOtAk/uufO/ihH8d2aa4GbmXkDOOKTxg9+Wjy?=
 =?iso-8859-2?Q?+3niIeRaTJhyDRuoTeyeLHG+tkkcv0nzQVUDwNIwShzWVRbwy+ik0w02AJ?=
 =?iso-8859-2?Q?vgUHc5pOu+5YlDqDm0r73VK5inF4lc1Zvj/3uiitURitGMRb1hntKSeifX?=
 =?iso-8859-2?Q?Al95WYxMcybfnJeUpqcTDo+fAfdas0TIHN+32SPCMN3jCyakQTLEEIO0Bx?=
 =?iso-8859-2?Q?75gyPLZyfbrSPKM7587apbUx6CNolyaZUavrpTapmRng3bXxULqfhRYCua?=
 =?iso-8859-2?Q?ZF2/F9f+IMfjqPaYnMwvqsji8oGVCfTaV5OQsOs74cRQK2lIACiDY2pMjn?=
 =?iso-8859-2?Q?NaibSlUdfkGaMyyLvO1JDuqj5ohfdqGu3a60Ho5M9SbtctRVSg79O1Dvzd?=
 =?iso-8859-2?Q?IP1pHR7qyzXVcx7xB69xXnZGtyUWxZIGkzFTzfQcnCmA2zEmVfJE5RWUxb?=
 =?iso-8859-2?Q?v/oSBuM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?9PtI3OJWQ+H6GHngGeEOyLvtw7+HiceP4fXzO7Iy1I4h2s5foXfvivKBP0?=
 =?iso-8859-2?Q?zRK1HVxM7bfUUqpXQjCCWaVQx3SpD75aPXQ61u83Rzq1ZROswNxM3kWW+3?=
 =?iso-8859-2?Q?ZYaiiQmCOmLyjvaXTQqW2ODRVJs85/CHtuxiNIhsBMYJsMuCNI2gpSrqsB?=
 =?iso-8859-2?Q?Y197AveHEdOMFfOlK9+9UYNpv95zrHz24aAvB7xVl1AQnq562jIzorbHZ7?=
 =?iso-8859-2?Q?7O7cdA3pUm70LW1mVmtcExgIj4iT3WPqfpip0EarcOM4VVCD+0G6bgj/L1?=
 =?iso-8859-2?Q?uruizURlAlT4uPVi7ApWJ4waowPg9u3ATiRUE+ktGgRLvNs+GIWX/P0BI1?=
 =?iso-8859-2?Q?8WtE5x+MrCjmXVZBhGRyAc5wGZ9+oEps8d17vMQ2bvOOMwZYlIR0q+ysn/?=
 =?iso-8859-2?Q?M2EfcQ0EoJIzHDro4D9DCL99h5YkB5rTssLwynCP1bcS9qmvEeqNIvpcU0?=
 =?iso-8859-2?Q?hhZHZGU4UDUf2MmzAtZ5rDl61o4guivudkg1ZsHU5/uBdxa1pD6x7tOr1N?=
 =?iso-8859-2?Q?Beiz+vgN0m0qwWzkVsxqt4M6IbWSXQmCqV5lIT+jwknl2cDQMQSCHFw0BR?=
 =?iso-8859-2?Q?Li7nOj+wgIyunSzf4wtqXIr4wnVaX3aYoeRPJ3lhn0JwBTC22jQaXFXMOe?=
 =?iso-8859-2?Q?ZYNdxpPkcEwOK4PsagTqYsgTmNPl1A1DO0Ltyr9y2l0cGQ6LieSpaAUk5e?=
 =?iso-8859-2?Q?1X2Hk/JXY5xnkal/e3blMl1ZyYOBc9RipiEH2+DOTMTddtvMtc1wEJ73Ul?=
 =?iso-8859-2?Q?8wnfpiHpZwK023wRTLIg3KqvHFdjx1nJqan7OeUQAX2byV4iEbtx1akpX6?=
 =?iso-8859-2?Q?22bQ8ERR+xVUm1bPygOIhwFM9agxVeyVSRvYMdHB2qgIBrUK5EGqv80ufY?=
 =?iso-8859-2?Q?8TrVd/aCI/mkHBXJNqdSq/yhAzY1H0pk5WMRLd4sHd/D6cyDRPIIgaW0as?=
 =?iso-8859-2?Q?TLhdNZ7TfgebaHki3X/zJ2SyVQai0acRv4GYQQxZRx+m19TaAEdUe8uLyP?=
 =?iso-8859-2?Q?cmfEB6/wAwKnVJNWOUBYMoa4UAtuW5q6b3w2GWzN44ahLRrgTP9yJUN4ED?=
 =?iso-8859-2?Q?EOpnj/T+1csxLAJycbhnScnbBaZDKd4IwYoN+VbUChkVFfL3SuNVrmOvsD?=
 =?iso-8859-2?Q?wWBipUobY/fvSQ/SpJEFUTYNM23ZoDKYJWO91ZySZvR/sMJH/JI9E84fto?=
 =?iso-8859-2?Q?zf/qYor0GxNOEM531rGcdafRDrpfuXduBdTyjLXpFi+dqNGtTzQPgtJqLV?=
 =?iso-8859-2?Q?q3rajqJTcgfzgBCFGjUkx2LzU3zcqTo4IFrlLQP5YMClXDOaMGzgcDEyma?=
 =?iso-8859-2?Q?Rv0aYQLDHAkh3HUqaP8DaxNrYUGwuQ/C592tfPnGk5EuLnD/jmMFmnyjTs?=
 =?iso-8859-2?Q?H2ph26lo+L4gaHRHl1TPQUjRfv0pXYDPwsRMLxc6KqJVXc4EOizmbz6gUs?=
 =?iso-8859-2?Q?+RMYOpwoQCoFOTADlAYx5dQlcA+dFRXkcFRIxJNrhtH0XLT8HxlyCORCnR?=
 =?iso-8859-2?Q?fKYw7P223ir0XFz2LFvSsNUd8qxtzyjYws0NljQm8fKnbDAAMGwQaBZO9J?=
 =?iso-8859-2?Q?mSCFV1vn7Qef7yn01vLuOkduuHw5pEfaSNmvpZo7YR08P4syH4G6xl+P3Q?=
 =?iso-8859-2?Q?JBsHFtms2ewUqk+Bjw6rBtZD8PEAmpSNUq?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c53274-e84f-4f0a-9eb0-08dd7b638c66
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 14:49:24.2372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9l/mmWlBJoVXFGA/TYiCdjzWRjY++5iddBK6cEVe12yAXz3/uT3782sRGItFp8d1DnBdtoIFwiBYEBJFuTGVj2K8d9mGFuVXIjZQiJgq8+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5952
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Satyanar=
ayana K V P
Sent: Monday, April 14, 2025 7:39 AM
To: igt-dev@lists.freedesktop.org
Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Wajdeczko, Michal=
 <Michal.Wajdeczko@intel.com>; Dugast, Francois <francois.dugast@intel.com>=
; Laguna, Lukasz <lukasz.laguna@intel.com>; De Marchi, Lucas <lucas.demarch=
i@intel.com>
Subject: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject errors=
 in xe_guc_* calls
>=20
> Use the kernel fault injection infrastructure to test error handling
> of xe during driver probe when executing xe_guc_ct_send_recv() /
> xe_guc_mmio_send_recv() so that more code paths are tested, such as
> error handling and unwinding.
>=20
> All xe_init() kind of functions are called just once during driver probe,
> so it is sufficient to fail first/all calls to them. Driver communicates
> with the GuC multiple times, and the real failure can happen at different
> call, hence the need to inject failure in GuC communication functions,
> like guc_mmio_send() or guc_ct_send(), but it can't be just first call or
> all calls, but we need to be able to select specific iteration to fail.
>=20
> To address this problem, an optional input argument is introduced. If the
> argument is not set, an error will be injected in every possible function
> call starting from first up to the max number of iteration defined by
> INJECT_ITERATIONS, currently hardcoded as 100. If the input argument is
> set, an error can be injected at specific function call.
>=20
> Error can be injected using:
> igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
> igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Micha=B3 Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 75 +++++++++++++++++++++++++++++++-
>  1 file changed, 74 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index 44c42e83a..adcab2e4d 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -26,7 +26,9 @@
>  #define INJECT_ERRNO	-ENOMEM
>  #define BO_ADDR		0x1a0000
>  #define BO_SIZE		(1024*1024)
> +#define INJECT_ITERATIONS	100
> =20
> +int32_t inject_iters_raw;
>  struct fault_injection_params {
>  	/* @probability: Likelihood of failure injection, in percent. */
>  	uint32_t probability;
> @@ -233,6 +235,38 @@ inject_fault_probe(int fd, char pci_slot[], const ch=
ar function_name[])
>  	injection_list_remove(function_name);
>  }
> =20
> +/**
> + * SUBTEST: probe-fail-guc-%s
> + * Description: inject an error in the injectable function %arg[1] then =
reprobe driver
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_guc_mmio_send_recv:     Inject an error when calling xe_guc_mmio_=
send_recv
> + * @xe_guc_ct_send_recv:       Inject an error when calling xe_guc_ct_se=
nd_recv
> + */
> +static void probe_fail_guc(int fd, char pci_slot[], const char function_=
name[],
> +               struct fault_injection_params *fault_params)
> +{
> +	int iter_start =3D 0, iter_end =3D 0, iter =3D 0;
> +
> +	igt_assert(fault_params);
> +
> +	/* inject_iters_raw will have zero if unset / set to <=3D0 or malformed=
.
> +	   When set to > 0 it will have iteration number and will run single n-=
th
> +	   iteration only.
> +	*/
> +	iter =3D inject_iters_raw;
> +	iter_start =3D iter ? : 0;
> +	iter_end =3D iter ? iter + 1 : INJECT_ITERATIONS;
> +	igt_debug("Injecting error for %d - %d iterations\n", iter_start, iter_=
end);
> +	for (int i =3D iter_start; i < iter_end; i++) {
> +		fault_params->space =3D i;

Is "space" the correct parameter to set here?  From a cursory glance, I'd e=
xpect
you'd want to set the "interval" parameter instead.

> +		setup_injection_fault(fault_params);
> +		inject_fault_probe(fd, pci_slot, function_name);
> +		igt_kmod_unbind("xe", pci_slot);
> +	}
> +}
> +
>  /**
>   * SUBTEST: exec-queue-create-fail-%s
>   * Description: inject an error in function %arg[1] used in exec queue c=
reate IOCTL to make it fail
> @@ -407,10 +441,36 @@ oa_add_config_fail(int fd, int sysfs, int devid, co=
nst char function_name[])
>  	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONF=
IG, &config_id), 0);
>  }
> =20
> -igt_main
> +static int opt_handler(int opt, int opt_index, void *data)
> +{
> +	int in_param;
> +	switch (opt) {
> +	case 'I':
> +		/* Update to 0 if not exported / -ve value */
> +		in_param =3D atoi(optarg);

I'm assuming that the below igt_main_args is a wrapper that calls getopt, b=
ecause otherwise
I don't think optarg will be set here.

> +		if (!in_param || in_param <=3D 0 || in_param > INJECT_ITERATIONS)
> +			inject_iters_raw =3D 0;
> +		else
> +			inject_iters_raw =3D in_param;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =3D
> +	"  -I\tIf set, an error will be injected at specific function call.\n\
> +	If not set, an error will be injected in every possible function call\
> +	starting from first up to 100."
> +	;

NIT:
Semicolon after string should be placed in line with the quotation mark, no=
t on a newline:
"""
const char *help_str =3D
	"  -I\tIf set, an error will be injected at specific function call.\n\
	If not set, an error will be injected in every possible function call\
	starting from first up to 100.";
"""
-Jonathan Cavitt

> +
> +igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>  {
>  	int fd, sysfs;
>  	struct drm_xe_engine_class_instance *hwe;
> +	struct fault_injection_params fault_params;
>  	static uint32_t devid;
>  	char pci_slot[NAME_MAX];
>  	const struct section {
> @@ -469,6 +529,12 @@ igt_main
>  		{ }
>  	};
> =20
> +	const struct section guc_fail_functions[] =3D {
> +		{ "xe_guc_mmio_send_recv" },
> +		{ "xe_guc_ct_send_recv" },
> +		{ }
> +	};
> +
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
>  		fd =3D drm_open_driver(DRIVER_XE);
> @@ -511,6 +577,13 @@ igt_main
>  		igt_subtest_f("inject-fault-probe-function-%s", s->name)
>  			inject_fault_probe(fd, pci_slot, s->name);
> =20
> +	for (const struct section *s =3D guc_fail_functions; s->name; s++)
> +		igt_subtest_f("probe-fail-guc-%s", s->name) {
> +			memcpy(&fault_params, &default_fault_params,
> +					sizeof(struct fault_injection_params));
> +			probe_fail_guc(fd, pci_slot, s->name, &fault_params);
> +		}
> +
>  	igt_fixture {
>  		close(sysfs);
>  		drm_close_driver(fd);
> --=20
> 2.43.0
>=20
>=20
