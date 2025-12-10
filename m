Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C71D3C521
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 03:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9468C10E651;
	Wed, 10 Dec 2025 03:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ACriHzwR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A2110E657
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 03:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765336418; x=1796872418;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RSxcFg4nlFYWVYK+oW6TYfa52ZxmPcLsibIzpi0FNwQ=;
 b=ACriHzwRFnvcuy/PdNkywNwJTqenwoYBI8rCxMdlctbiviQXXZd8r50B
 6E+ZY/phm/xGaGZ7KTwXN+RLklVDDuBjQ+QO6tRH3mo/X+7qInC1VWwGx
 w3MZmd5XGWTW/vppR0mk8S2LHvLmTaLN+A8MIWGIRUsH8C7j/IMPp8DGw
 5ltKeqvpuDN8vPZQMvJxrCebS8dloZWofcQPPjiNarnzsm5270GQr9QQI
 a8bbRLiAPqJkysUJECD5A6CUgr9sy3MlgqW7EHhKIFf3S9Bdcm+V3SoFu
 oLAoBu+fIaYIkQf7QK/77ohxyE9v3yG3SriA4uxaB1MYEwZcNW7Zevatk Q==;
X-CSE-ConnectionGUID: tWCqOaP8SvGTPoG9uzgMqg==
X-CSE-MsgGUID: 2lnT9Yw8QOKiDsSQf0GeHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67378821"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="67378821"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:13:38 -0800
X-CSE-ConnectionGUID: Kr/BSc+ESAifcPPKD/cGyQ==
X-CSE-MsgGUID: IoeJwf97QkGBvDIgvcvobA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="200557434"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:13:38 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 19:13:37 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 19:13:37 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 19:13:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2xpWzfk3+cSGEyOk+CiYkiwB9ObU2yzf7rH3eKBUpRySSGsZq6NEfJWl7fUxTbT5Qlq4tpRAwLhul8PQT8QZYYaJxXIdxTDbyi9e5QbLvALvRuhQWASCKQUJ9JY1A3QujC/tlDbUTZHi4SR2GAB8cfh9QDB5hEHPCtVF2DturwpzeCYWfHbr6dQDCe39xRzCIpH6Lp4GnZ7tnWGgh/Cn9/EabAEu1rvdIUiB8DOf9nPUF5n/P98X2lWRypSd+qzWL791BgviCzz+ZF3xF+GeiUuipv0Ne7NnZnB2LZJ1+lN/3ECNzwU45J76gPUz2gskvE1sOi4jCkQy32BzFpHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1MlwLsdctgnOAurtFtkj1JRSenSp5awvdaIpB1cBcc=;
 b=BhKO9sASEHmmChNv8SxyEhgiMxEpKwkDz/F5pKcadzC2/jGunztJRYupTZ3J7miZLDaZRlauP/klRVhbJBQMaAztGcVGQLlMMIogbz0AJPzgcU19tgFcdY8OdoCEqw65Jm32CMvBP8Rq+g9XbuGZ05Pulbgr4xfZ1y/mWfmPknClfcogoZuiwBX8ikl/SEn3JRSoPa67H/snJH0svrXI2K8fML7XZ4HM0jNiIczh/VNSroPvxn+tBVivVYzYH4MpbCyqi81Q6IQpTpEalzRTNhJUJN7MmlLdS+jiBYN4Esxazejux9OytWQBFAeWpJafGfNPjS1dwU9+7D/+np2cpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CO1PR11MB4963.namprd11.prod.outlook.com (2603:10b6:303:91::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.8; Wed, 10 Dec 2025 03:13:34 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 03:13:34 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v3 1/2] lib/igt_chamelium: add get_port() helper and
 CONNECTOR_TEST macro
Thread-Topic: [PATCH i-g-t v3 1/2] lib/igt_chamelium: add get_port() helper
 and CONNECTOR_TEST macro
Thread-Index: AQHcaSAQOSUBQPUNUEi3LBnxo/wUA7UaMi8g
Date: Wed, 10 Dec 2025 03:13:34 +0000
Message-ID: <DM4PR11MB6312BA561BB26F59F81AB0DB90A0A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251209152359.907648-1-mohammed.bilal@intel.com>
 <20251209152359.907648-2-mohammed.bilal@intel.com>
In-Reply-To: <20251209152359.907648-2-mohammed.bilal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CO1PR11MB4963:EE_
x-ms-office365-filtering-correlation-id: 71a58d4d-fc5f-4276-93df-08de379a1aa9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?i+YMDVjeOy1q6ICelHjpE/CElgTIQZzsm8/hqzLW680aF50Vo8dhWsaRsZBT?=
 =?us-ascii?Q?v873Lmh7qWU9cIjoJ+YIJ4UA2a1PUNIqoHeO5s9jGlpZY7nYV4B1Xza/IqsN?=
 =?us-ascii?Q?emZ8PYHzBCK0kpVdL6U0oD0pACiVhgSpDQnk72oatpqDBJ54eDmQ07KTzNBz?=
 =?us-ascii?Q?XnTCrDoOjalFlxkvOAAyJU2fWvD+pjTFEClcrDQNc7eD9ss0A2nm8RdoH2Zs?=
 =?us-ascii?Q?OBdIOCNLBgsFtImLsUGfZRa97bkbXAcm3+OsHDp8m3xUN2v48UfDb/RXU+t5?=
 =?us-ascii?Q?WskV1jZgWwYVu4la3mYqAcm5dJOE4XUS1NJ64dWDs4gb9pbmiaYPde/Qdit/?=
 =?us-ascii?Q?cGjlr80J7/WVNb59WG9yioAsH+4IfS20QHE4ghggRB2vzUjSoIrlgNwHarZp?=
 =?us-ascii?Q?zURfW/zlDxL0zRSPDqKwAuqo+d1hTRGne7MrChNlbvETwCoTgFTrAB0I/aTA?=
 =?us-ascii?Q?9CnT9jxnRTQc33S9lcijFQe+UGjyYOKflEbgW0L39sIX/gn4CAXKGD0F0elk?=
 =?us-ascii?Q?CBzBRHRlZdCrfBA4ljjRwnr7nv6E+5xAohIONDwek1T8HFn6HQOvcyPjNGHJ?=
 =?us-ascii?Q?8e0zqk3S+GPYTwzmFa+ROWG7j/7MIhnWMZM9sqbtKxV3oDSeESlvE1+RfmXo?=
 =?us-ascii?Q?swS4wGWCAmtojVVWCili1mDEhGZSCMbBVg2T8keBd+yUelhCZmHRSi4B6Yuf?=
 =?us-ascii?Q?xDDn3cACp/WgtnMjVVfdEElEJ4q3SZGeBYF5qggPPuBKl91Q14h3Vd+uuL0z?=
 =?us-ascii?Q?sovRV5/OtjPW41CnkhYUh4pXPvRfa6k0VXfQdcmNTTu8frmfff7OWvVn+crp?=
 =?us-ascii?Q?tKUr8gem9bNqYARQCf3l9TUj6sRV+Z/nu4KQDINtCBBNPjdQxmDeFzGtOdPM?=
 =?us-ascii?Q?n1EJ4H31WQCP1r4+BTWXxniPu1W7xO8tpVknlPpXoD9A1w+UVsiagDnnzKRu?=
 =?us-ascii?Q?c//L5N0w2F69lQ8WtWLL0THVrqBa/5bbwqml33ZEKX6gabgjYUfrxT/mNApi?=
 =?us-ascii?Q?0dm1PX5hsnmbMoFzXHKYHuW6C19zD1VTaYmOh/WRnJDxYRSEUjg9cWjWx7Aq?=
 =?us-ascii?Q?3a55tbfe7ZSgiVQtu5fE73JGd5CCVGIGr54CSXUX3uZU88IYdCMVoLKGq1fj?=
 =?us-ascii?Q?cJZzdm1yFVeJslRQYktUzWH38rwI/sWKpnvvOdvLfUqQLMPGfG6VBmfoLi/x?=
 =?us-ascii?Q?Cd7eeisef5QfxHXL5dozPDRitw7Ga1A8h79JXO1YWg/dEIEFf+THPvvweLum?=
 =?us-ascii?Q?thW6nL+5vGyb5wuhSx6pWBGEK5z7/0dLrIxl1zRJYtZ7rQSXzJ0ZYlGAQYOy?=
 =?us-ascii?Q?4zDsD3bJ3hKPty0WXqK3V1ITY1nBF62k7lRqWxokZf/T6EMsuX7V+svAphHe?=
 =?us-ascii?Q?OesbltZDu0VCFcMy57J8ssMq3KaqRosLaY+rJvZ1mhuQhTJpC4thq678oI6k?=
 =?us-ascii?Q?C6imUdTLCMQCQ2pN8n/V+gnmp10JksBlAutPRY2CSBRwAjYaojf4jmyWSWWC?=
 =?us-ascii?Q?NtkwkX5UjIuhalMh3O7NbjqmToebcUidIDKD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9o8D5skkOVoneVdAW++Iw4ljtK8AcBtAMSrF5kA3dYt5Bs5kDWLTdy1P8WBQ?=
 =?us-ascii?Q?NK7E5+4Zz8MFZ3Ni37O7iUYxzCRrituPtb4JzgSXHSgoVQFuqwu78iHMNLfQ?=
 =?us-ascii?Q?3urqh0FqspAYP03EfIouhiFr67WTx21K8bZGbpbLv7Lk5MxJY+mdkBg/NBkC?=
 =?us-ascii?Q?x+Rafcceoj1jhlCjUPGxTJJKJxb4u4Nd9EjqS3BOGvivnB3cn5jmpNNxB4SX?=
 =?us-ascii?Q?4zg0AaGUijOdCtBs/tV1dyz8UM4WNfA56UBIBgVEw3G7Zina+8Crm4AB3TKo?=
 =?us-ascii?Q?Pq9SOqq6jCFb9iXUDkg7EMQvgjc7xRRRsn3SIs69MkgIwbymXa8c3zw44JVy?=
 =?us-ascii?Q?8PgjwKb/VE49//lJ8nN0uRnAnVBRIF6osxyUi8+lGGD5I1zimUMEkIDmuo6Y?=
 =?us-ascii?Q?r6VGxInR3hAvntEEWqagA21jd8SfkF65fgMpskjMmNuFYaowpb9c5BIlHLvJ?=
 =?us-ascii?Q?xLjwoZCUghG+qbhF/Lsd3CdOkLLaWONKqkSagWkg1+8tRuUwYiy+WhjkkLoI?=
 =?us-ascii?Q?KzvPCVd1unIUFVjTOnY2Wu97YQaf614GyJL+kFx7BOdMQoKVPRZrDPyPRBlq?=
 =?us-ascii?Q?PxjoEPJXiBPdBWNeWp+8+RZ3BNvqcvE7Ty9N5WwdJV0HXY6VUp7LV4wJUKUN?=
 =?us-ascii?Q?qlOG823OY80gLgXUkXtyWGRv+EyuO6VT44e+p5S9wiVhoL2XKh9uzNdv9vC+?=
 =?us-ascii?Q?V2SuL6JvFHe9pvibKNWrIeubrQl7SnJIEUpbGyZtdRKLFHpNzA8w4WRQDnwN?=
 =?us-ascii?Q?vxBvSL1KUPgEm3j6WmjUIBmxiSdlHSQ8fMyhZQ2yx+/DJcLZpJ+0GwLREUUm?=
 =?us-ascii?Q?qF1YMOO3X0fpc5HMpTGJ7Qh65ODUeIZAOt3B2B5K9g10Tyz/RMMYq5+9URnA?=
 =?us-ascii?Q?47esTXp0RiBMz4LCszRFJ1VxBuTNCr85pMmV4hQpbmoPfbMjHZF0THG6ZJAc?=
 =?us-ascii?Q?h8lL88GEbJUZYmMeh7WIivRJmA2Z+VvE/VzvWsslJWT/VNl4GFVVfJ/RlKNn?=
 =?us-ascii?Q?RS/rhl6gNIFysP8qskEr5aJl3f3x2vlTGaFcYJpj7pfVdUmX3fn4AH4VdeEA?=
 =?us-ascii?Q?X5cKnyMjqZxhcc9tpddoKNNm3IHt6lDan9jXvb3tjJUwUq2wMGhCNudoSkar?=
 =?us-ascii?Q?Vo2NxTueOfkMHuqoGab49f+uMNuFqwi81SwwqcJ1GJqy2q9M7qwlYwYIQwnb?=
 =?us-ascii?Q?OcMLPN2sSKum203Wa2PsaC9SdNjOwmA3qWVAjQg/cV5eKvL5hJGmyZz6+ElA?=
 =?us-ascii?Q?KlGzgpCL08ceIRbdXH8T9mYEKxuRk6pMnUyIXgnfbjkoFRWovbWbStqzY6Pf?=
 =?us-ascii?Q?ECwMaq26Ig6FniPyGwP2cuYkJVE/g8WHwFA04IewgcAGcWQoMc92qOwxZVbj?=
 =?us-ascii?Q?zcJvMT62h/Ql887u3JkszVWlgevvgnE/HL7W6pepTaNwqDgq8YAnMCMmL3FP?=
 =?us-ascii?Q?C57pC42TtaiJxzz5YnTRqiLnyUAMs/1L0cYpu1FP1+f5EElAtnNoDv2LxqsH?=
 =?us-ascii?Q?PjPx6KYcUyD5oX8TEtUUSGOjY5X7AwINQ8VdUeEtA+cTEKsFSfAAGefGpPgb?=
 =?us-ascii?Q?O2cqEHTzZ3F3xCx/9Jk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a58d4d-fc5f-4276-93df-08de379a1aa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 03:13:34.4436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UzpGYrv98uloxLRGQqmAEd96rQglSrzWmY2B/2sBVtFQnaHhUZnr4SY+0Qp9rYLcx4bCaMo2O0KZ2/Wsvki0xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4963
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
> From: Bilal, Mohammed <mohammed.bilal@intel.com>
> Sent: Tuesday, December 9, 2025 8:54 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com=
>;
> Lattannavar, Sameer <sameer.lattannavar@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Bilal, Mohammed <mohammed.bilal@intel.com>
> Subject: [PATCH i-g-t v3 1/2] lib/igt_chamelium: add get_port() helper an=
d
> CONNECTOR_TEST macro
>=20
> Add a get_port() helper to return the first matching connector type, and
> introduce a CONNECTOR_TEST() macro to simplify connector lookup and skip
> subtests cleanly when the requested connector is unavailable.
>=20
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  lib/igt_chamelium.c | 10 ++++++++++
>  lib/igt_chamelium.h | 18 ++++++++++++++++++
>  2 files changed, 28 insertions(+)
>=20
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c index
> cb240a7df..782b34ebe 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -3260,6 +3260,16 @@ bool
> chamelium_wait_all_configured_ports_connected(struct chamelium
> *chamelium,
>  	return wait_for_connected_state(drm_fd, connectors,
> connectors_count);  }
>=20
> +struct chamelium_port *
> +get_port(struct chamelium_port **ports, int port_count, int

Function name is too generic, it should be like igt_chamelium_get_port/cham=
elium_get_port=20
Also make sure to fix indentation for function.=20
Consider making it static if only used within the file.=20

> +connector_type) {
> +	for (int i =3D 0; i < port_count; i++) {
> +		if (chamelium_port_get_type(ports[i]) =3D=3D connector_type)
> +			return ports[i];
> +	}
> +	return NULL;
> +}
> +
>  igt_constructor {
>  	/* Frame dumps can be large, so we need to be able to handle very
> large
>  	 * responses
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h index
> b5d13ddc8..07ef2b61f 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -274,4 +274,22 @@ bool chamelium_plug_all(struct chamelium
> *chamelium);  bool chamelium_wait_all_configured_ports_connected(struct
> chamelium *chamelium,
>  						   int drm_fd);
>=20
> +/* Helper to get first matching connector type */ struct chamelium_port
> +* get_port(struct chamelium_port **ports, int port_count, int
> +connector_type);
> +
> +/* Generic connector test macro usable by all chamelium tests */
> +#define CONNECTOR_TEST(name, connector_type, test_fn, ...)              =
      \
> +	do {                                                                   =
\
> +		igt_subtest(name) {                                            \
> +			struct chamelium_port *port =3D                          \
> +			       get_port(data.ports, data.port_count,         \
> +
> 	DRM_MODE_CONNECTOR_##connector_type); \
> +			if (!port)                                              \
> +				igt_skip(#connector_type                           \
> +					 " connector not available\n");         \
> +				test_fn(&data, port, ##__VA_ARGS__);
> \
> +					 }                                              \
> +	} while (0)
> +
Fix formatting its not clean=20
Also consider adding documentation for both the function and macro.=20

>  #endif /* IGT_CHAMELIUM_H */
> --
> 2.48.1

