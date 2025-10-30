Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED4DCCF9F0
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 14:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FD310E1EC;
	Thu, 30 Oct 2025 14:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbrX1ofv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850CB10E1EC
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 14:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761832871; x=1793368871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8nmt09lTZq2qw+4Qd2FdSb4I2pUIkGzKNiiV/+okuNw=;
 b=IbrX1ofvz0Ido/tLNGXBQcn+hKiVIrgacB1bhVEgQh9N3FofCfdUpHJi
 LfU2rh++QjI+LHjPGRIRwcqbNrEj99+rGoP7IuZ58qmMp+nv5BqITFygS
 nAjwjVHPxqSe+FMLQqKqHu2yFrgO1SvsHC2L5BAxdtP70RVJ+RGhlVosd
 rBofv3u4j4YO1XXmHcV0ArysaGy6uH+BqvQJPz5vTrisZ3YMbNkn2c50Y
 6uTQ9yvvzWd8fZJA/9essi/O1W56juf+DZ0Cxxhxz2ZXBL3t6pUlDOKBi
 erBYzGPZ3DROMbsaIDHniAlzdE6Sm1uEy/TJrX9hDIaCGKX60H+cFi+/N A==;
X-CSE-ConnectionGUID: /ra5c9aBTjuRGCCNOeUWVg==
X-CSE-MsgGUID: uKy1wx43SVSwA9nvluk78g==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64123767"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="64123767"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:01:10 -0700
X-CSE-ConnectionGUID: r2PoSWDWTgKYpoZlKX7zYg==
X-CSE-MsgGUID: GRTWTCSbToWSXtdu2jXeGQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:01:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 07:01:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 07:01:09 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 07:01:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atSwM3ZmGLRd2rrMfmIeX2eNZZUN107GvMsH225ZI4YR7NfRQQhi3ijlVB3y6+R5Vqh8lKxo7gqQT/1h5Xp2e8AVqMPzD/Euiv6HsmVAUkh6j4VfwbD61dCpgG0yGlkb0oo7Vo37tEmDkcgZJUExXBIQuneq5br6g7obXfZZDDzuTRyTmfCuL2XpUJir/JRdvvqEZnTZE3IsLlN3Tc0fG6Ptt/ftdQj9Wx5+Yu7A0IVyIt1O63hG+n6bfIfGzUPFRN5vqQ3lUc8XVFwKLYLQyFyr8BejrMS6oT36L43gch1ULETNIh7KvY1W3HV+toP8hcT/JmXC0/DPtVcmFCQfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcSwmjthEwlLlE9XPDgK38t/L78CkOKFoJBgkxI7iew=;
 b=KZhQf52ari7I6Rrwi8AxTdFfnwPrZIK9nqfW2Kf7mSh8+tnJs/oI5R3jxdgFyYZAWbg1GY2z+vcMH9T1FFZm3rXAa0Dcki5AkC8bZ2xdP4EpufkBuVzT7igNSoV01UWwa7nF4Ori+rhk0SD8slYHbxH9j6nVHMmdJHWlUvEPxP2oCMxJ9VCyRFrgYUAayjJS9r9hoxaCPjml2B5P8xUm5XY86hi0s0DHlXltZmj1cFo4mcuhPfnH+vH/jds8GeJ7w76sVWm9Mb4W18mqIWBdcgnmVPloJ6XzovmENLgLkVvL9VOQFHYC2gq9vfyKtYqrLxLexFU4VpnkXF1W396rCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4608.namprd11.prod.outlook.com (2603:10b6:806:94::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 30 Oct
 2025 14:00:56 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 14:00:55 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_configfs: Test invalid engine
 with valid class
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/xe_configfs: Test invalid engine
 with valid class
Thread-Index: AQHcSR+ZYkU9Bsaw1kC8/0jyyM3rKbTauLiQ
Date: Thu, 30 Oct 2025 14:00:55 +0000
Message-ID: <CH0PR11MB5444C2441226F95A7A5627E6E5FBA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251029215947.3580744-3-lucas.demarchi@intel.com>
In-Reply-To: <20251029215947.3580744-3-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4608:EE_
x-ms-office365-filtering-correlation-id: 3287cf8b-a2f4-46cd-e291-08de17bcbef3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qY2eVEzIvoYlnCK9hBM0PCosiQM1JCp+ItbJs8yVmRWy1w0qZ3vIvch6OJJ3?=
 =?us-ascii?Q?vO8Ewu3kU8mLoX2P4OpYed2oGZHL/NVfOwod/4H1XeJVloV8nTkkzcVrLlkQ?=
 =?us-ascii?Q?AeZETsrsCMr/uPvnN5vcGX/lqQOq7uJ0fc1MbWvZH2RWGxFey1j/MkP3VKuV?=
 =?us-ascii?Q?92+n5AtBR8AKwH1qx6hC2IRpNhALajh3a8Yvfd+c7oTRm8Pm4t6mvpMdMB/F?=
 =?us-ascii?Q?9hzwKEXlXfs8Il2/0ObQBOAs5zquLDoJQ9zjGa0pnJ1BBOPWjxG9Ft1lM4PG?=
 =?us-ascii?Q?6smAe8fb8MfKdiJA5wMXaPQAtHlMQp2rMaqK6756DCKSEtDqM5QD7Y0I+6+7?=
 =?us-ascii?Q?apPKcsXXPqHRu8qOzak/7G/hOvw1DAfrcsWQQBn2eM74PaCFIyjK8OoQ4qtw?=
 =?us-ascii?Q?T5RLykkjrRwmYShkrKP4RLtzrXP/XzRat5AKu18QdYsKV11OPlgU3DPgQK8d?=
 =?us-ascii?Q?38u3iiD867M/Sbgkr5uc4sYuYAalkU0EoBlmrxKkykMF26Yj88JojESquuZR?=
 =?us-ascii?Q?OjxXhQ2nbIXYSNtFLxZVYSz7bSpRQ97C6QpUy9/QViVyj3d6ZLQM2h58UTDQ?=
 =?us-ascii?Q?ijqBaK4aU8NshBP/l3bbL4OMvj8sr0VInB/oar1F5GZChY1vXcIAmjzX1e6U?=
 =?us-ascii?Q?4L9xvmkWFhnAJLtgazLW6+y1ZiRbXBTc7craR2RNjLG4Q4qA+Evs1RF9TeT9?=
 =?us-ascii?Q?A+eezW4BmyOkFD8eOTnoyrg+xRxxu1UIxVG1tjUeV7owwXSqrkQaKGpaEQBP?=
 =?us-ascii?Q?Tf11+3e8GRCUn7kU1t2CCnEMs+KGXu2h+9BnBDiREdj54rG6B5OqJjVuLcup?=
 =?us-ascii?Q?LJuzT8QfjY1pRwkgpgCds60uonwXC/jbEMWjVSzQKq6sHDm+jo9KutmsHcr4?=
 =?us-ascii?Q?f7+8lcgSVec+4fhzwr3JaEsgQlXDzXY2ss/C24j4O8XMq6FRw9fwjcBFOBDd?=
 =?us-ascii?Q?K2X8m1r9hydCfxWqM3A7Qr+wQiD5cCldOUFqflXgjtKqfNLFPcGRvVMyyQjB?=
 =?us-ascii?Q?BhxbRpBaaKh8pYS44tvC1HRQnp8U4Ze8fDwN/q6JAgLRKnEiN9vgkUPI5pd4?=
 =?us-ascii?Q?xEgsNAyvCmOhuXeg0LT0EBW85KDly0m7jsqmaRlcp4uHbomhJ6voc+1KkSIU?=
 =?us-ascii?Q?Xg2GhEc2a+5h5f06Uv4n9dlymJkOjtzrUr6XQwRL4WZsx8wQB5hTk/CvSzGP?=
 =?us-ascii?Q?s3XF9CbMrwEv0esNeCsN5I4ZGoguNo7OqUy+qsAOh51RzO5wXXifD+ut95Ty?=
 =?us-ascii?Q?7783JDB+53CpiNcVfWEFte6OvnRwSBNL0qMcQRObPChw1GbN4NEylcbzja9U?=
 =?us-ascii?Q?rpkJ4HNjOpM5PNA+O6BoUUyjpNpOawLu6TXXdUOWttSpvtc+cjDQKzyzLEYm?=
 =?us-ascii?Q?8et+YrQ9NFNk47r2gpkcm8xhDVkSv8/W1rReDxP4Am91l+jcQR/yWMDbGxpT?=
 =?us-ascii?Q?T0MMbsAy7jUq87mZYhhtw0jmJUJ87nqEwzlhAb0m7fiRrVdkA48P3MgmSlMz?=
 =?us-ascii?Q?Sk0iSboIZgqj84xKxOUQq4IXqLDN7Q1i5X47?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ht+48WsD9NH3FMRq/GKJCE0eeeDiKp7E0/XHIfK+jNjCwNT48YbQ1S7To6VU?=
 =?us-ascii?Q?ScbGd9U1Gr1FRuUxLXbMfFAQ4EvMYWl3MDtCKKHX6gbcPnQFff7gT0bEZtKx?=
 =?us-ascii?Q?KMbtmjopYt7nyu7tJtSww93ydus8cYXFa02FiTGK7SZUQS6VwhvWELCd0Ne+?=
 =?us-ascii?Q?CkHoAMeYgXnojuZkWFRMLDLlEGEOIGfJr559haFVQXhv7tRER/Fa7asjHgDT?=
 =?us-ascii?Q?BuN+DTQB3iSxn4fLwiCD9wy0plYm84buencdmidwDRKKKpY+doOCbnxGgc2F?=
 =?us-ascii?Q?GSjU1ga3E10dlOUso+eueBj/Mlf25zfowrnAwS6RZaW9Xz1diTXgby+88Idt?=
 =?us-ascii?Q?Eq+KIclZiA8ErGHficfRrAaKi8rV4EeGJkw4+kJoIKtyE0ovsywGGGYX5OWF?=
 =?us-ascii?Q?A2oUFx0nJbWFUhurLs4vvvxgou9yAI41tWsbVkprDBn11t4as9S7ZOsCgGE8?=
 =?us-ascii?Q?Ry0E4dtXlIuld9WJqXwwab1//Nn+57EGyzHvsOUF3n5EmcZT6/IKaEWOWxYf?=
 =?us-ascii?Q?RYr9QjFFGKlJKrpWHqC2qV+5Xb/UdRF2clC741m3LfwjIjUw4UyB0qIBYjv8?=
 =?us-ascii?Q?nEO6g49sqMHCZgdtje/MoivNDRy1+nsk8GFuh/ErEElow9Or4wSDWtAGJRhn?=
 =?us-ascii?Q?Y4sCjgQFKMswjY99ZXUvgcf/LAd2O7J5hEU1Zv3Svg2Fj8nxAAP54Wk7s+uk?=
 =?us-ascii?Q?UgLzEEfFlOP14xGahJFA6RPzJBUKnQdrCuYfIbGZDw6InqQ2zItVW2JiNazV?=
 =?us-ascii?Q?S3QSXxLSOKWbPehpANQ61iTr5f/n1KCOPMWh/iyi4RttkvcpV2J6wzEbGE70?=
 =?us-ascii?Q?JK6JOXlqGIGDUbFdgrH5eVpjGdTvGNe33XrbxRGxfYbOQ60wRFrn6H4D6kYe?=
 =?us-ascii?Q?uvwdLNCoAGbxG2xhVC3CQRNlN4x7lztwLqCE0qy+8botVnQ2HNXi0Kop8n08?=
 =?us-ascii?Q?ZbhSpLI70fzyhLvgdi5dAlr9l12VjK+MMG0VWTKJQpMUxKPoMgI7USPYzmF0?=
 =?us-ascii?Q?yh2vbggHM3Xaf1aJNCP6wEAVPosx6b1Yr2W6qc/+TjVMj1Wh7DD+IYIylisQ?=
 =?us-ascii?Q?gE6+n7DZ67kuuEE24h4cE+Otm521cbx3eFn3pRdVdMmYF1Ed3vV9zWfmGKxx?=
 =?us-ascii?Q?FKfVxU75wILNy4EC3LSMxevFYPaO1fq2He8Tgfg/9EjdqpxKv0SYYB7qp8XE?=
 =?us-ascii?Q?ltFmIZjhfScaWvGRnyprIRgAsxQZ/wC4uU9IyEVvvy3VrFlgMS5bMV3Y6cWD?=
 =?us-ascii?Q?2rbvpvvd5h4jkk1s1tUGzyAzi3NuHPc1agmiOc6vycKDrvWoOuT5f2P2mwXP?=
 =?us-ascii?Q?hDmxxb+9sBXa/C0Fnp72yCDeEEpzw/h7PKKnQzQel8FVLsBONsruiHagomdu?=
 =?us-ascii?Q?H7Teq4rkjVz9/33FCFQC7JhpQaOlXCpwsKtjtpeiqB3lXfo4N8RSYhuNKqvv?=
 =?us-ascii?Q?z9pu1Qmzo/nsl52KpFu93/RGtDJ16jGUGX3ycSywkHJBpl0ZIxTddBBSmGJC?=
 =?us-ascii?Q?lCHQStxjkKj+HMoy4umhpZJvCzZVDAhqP8pA5yVTCKF/ecmAMo+ATSVHTuoq?=
 =?us-ascii?Q?sdPm1AqbkTJPhT46DHWnvaHk6ux+KVhZs8sHXMmL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3287cf8b-a2f4-46cd-e291-08de17bcbef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 14:00:55.7487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZsdKUlWXXC2uXvktcPpGPq6F8+BOjfxBbREKeqO8I7cMejYVt8ObGCBmyMGQX3K5UPgLUtAW1MTCRl0Tz+rg6occPpd92yNJuCr12DOk1tQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4608
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
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Wednesday, October 29, 2025 3:00 PM
To: igt-dev@lists.freedesktop.org
Cc: Tauro, Riana <riana.tauro@intel.com>; De Marchi, Lucas <lucas.demarchi@=
intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_configfs: Test invalid engine wit=
h valid class
>=20
> ctx_restore_* expects only the engine class. Pass in an invalid engine
> with a valid engine class to make sure it's correctly handled in the
> kernel.
>=20
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_configfs.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 7a7a7edf4..ecba69dbd 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -177,6 +177,9 @@ static void test_ctx_restore_invalid(int configfs_dev=
ice_fd, const char *type)
>  		{ .test =3D "invalid-reg-addr-only",
>  		  .in =3D "rcs reg 4F100",
>  		},
> +		{ .test =3D "invalid-engine-instance",
> +		  .in =3D "rcs0 reg 4F100 DEADBEEF",
> +		},
>  	};
>  	char buf[4096] =3D { };
>  	char file[64] =3D { };
> --=20
> 2.51.0
>=20
>=20
