Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995FACCFA18
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 07:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F38710E4F2;
	Tue, 11 Nov 2025 07:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NCmaO11N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BB310E138
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 07:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762847339; x=1794383339;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ivS3hj3V7s/2UPtQv5wz4+SHMLWPpqppt+zpCGXk6Dc=;
 b=NCmaO11Nafijj4wC8MaWBy2xRvCtOxXqJ3UdEgLEd6BN1WCyHWlrjlJA
 YwZbkO376NZQrDo9uGuDqmGo7Jhev2bGbc+aS5WZliCQb0VfFozEgCmGz
 Ie3wOyoGB9ORlJrNegX7h8UZndDmX4DWZyxFnMpuW95SyLwBZrTYjgIkg
 LpHHeX0W4CGmG0YfU/XYwC324ryG6iQX29PLNNAK5gHx2sl7rfr1exgJB
 pVw8Zc4+45W7j3m+YrRE5r3nwFDKkv6q3TCY6dgVTF+ntzGonz5Rq+qwH
 TKgX1fqybmmA4/b+gsyae4cL5QD+gXxdpCsazsaHW/Q+PjftBG1ZmqLvO g==;
X-CSE-ConnectionGUID: zOUZSz4SQSORNOdm4e5yeQ==
X-CSE-MsgGUID: kxvkrX7WSRmMEi5NEgwUCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82534927"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="82534927"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 23:48:57 -0800
X-CSE-ConnectionGUID: yx/JwFK/QVykejJ20EprZg==
X-CSE-MsgGUID: EIb94o4YS0e4xUV1Jd3d2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="212288696"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 23:48:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 23:48:56 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 23:48:56 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.51)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 23:48:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnWyxy3evHtyzSoJdfvCpAJ6M+aggXPWVhC+KAtguMio5BpoF/6orcEZd3JAb5sZQmjy31PuX1S0xX/bgC/tGjIguGFJ7vtxWQ8D1yfBCKMYmwGXbFSxkuoxDEd7pIgvyLHN0P1GVWk63qER9DzgjV05sxTPCUGLV8/Pk6GXTCIbSRaqxMhK3EQ40xGYsmU0cOmWItlysqLHD2vAC32H/4qswG951Y+TkBHbmLnrzSKJyWazG4KbBy2XrJwR46DmgZIRj2FiS+AypIelZDi909foCSzi3yRq31vCOM3mNBZ0xarFVxNwdep07ODBnXVBiVVPGv0pj+pviJBqc3Orkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFcbXDt+wVbf++NZKHhlkLXnWV4UHVS2NxyPBAm1knE=;
 b=fM+qq9ysCu5asdzs4Cwdj75OGiimDnUh7dnTrbnQS1NqnzgmQlWqfONDziGlC1qlx7muflyAB81ZInBzvgbRDO3Pk2I3eCbEaVaDIFIHjhDK4v89RBObykDdTEWidYB7Mq1+vhE0u2soZes2zJADkCH+9t2M9VwEtAG2uckyCGYP9/QcnhIF8lyn7j5nxBcSL+daqn0Tx8JGS+c6wnB/f7hCtwv6JdbpzKy3QvpamKRki/mFkAU6ad9FSzpJx5o/U1JErc5TevIxFetPwFQnfvKNFQLxPwrjz/DeTzo18JwrxqRIbuu23ysanYhr0jXgPlQJkY51ftO5HSHW4g6o2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DM4PR11MB6358.namprd11.prod.outlook.com (2603:10b6:8:b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 07:48:54 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 07:48:53 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 05/18] tests/xe_exec_multi_queue: Validate queue priority
 setting
Thread-Topic: [PATCH 05/18] tests/xe_exec_multi_queue: Validate queue priority
 setting
Thread-Index: AQHcSpYSfGauBvc6q0mWaO2cqn0nNrTtKBDg
Date: Tue, 11 Nov 2025 07:48:53 +0000
Message-ID: <CH3PR11MB843486FA9DE31AE5BFD3F8198DCFA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-6-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251031183555.1882721-6-niranjana.vishwanathapura@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DM4PR11MB6358:EE_
x-ms-office365-filtering-correlation-id: 422c64d3-77cd-442f-8111-08de20f6c306
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?JPGS419xCnFdQo0tKfhlC3CVZJpEzjdZEgnI996SkGX59Wi4wLf2TyBbxDVx?=
 =?us-ascii?Q?IZorvIiyjt2Ehj2F5jKS+T+qa2d3MBBW4hvLoV4dn9XAi3s74TSIHRkXlMj/?=
 =?us-ascii?Q?3wL0us4qanqXpd6swdwJP6vIUcLZKtz+DF/LgKGBFNhJgssKctwNIwh7FNPe?=
 =?us-ascii?Q?tHD4CJCHqavnd8Ba4py7Cf1uxX5k+5J1/3H2nb0sv4rCEZynsAtRW8D0Lpmt?=
 =?us-ascii?Q?N2/B2Dbx0U2H/1uoFWN2iAlZtPsj8Y4qZ3rm5WOko4EPEgtwUwBBwx6VAocf?=
 =?us-ascii?Q?9DLVtB8V51U2gbJLBdXG+QGwzcoArlck+UvRvfND9fEWxLDa/Xma22ZNFLab?=
 =?us-ascii?Q?2B65JbakVG4XrLGnEx2ylRoarQ5ZPL06srWPb9Y5V+sm3zOd7uh9TL8z8Jy6?=
 =?us-ascii?Q?73cJRQRwEz42YEwbPH9vD7Fr2wa81PcF50nQbuPhS4NJxgaH3VwJ0Xi9mAny?=
 =?us-ascii?Q?tIl0NH/D3C+oebThmLvoShYzNXbMLpmhjfB5tw+kY5CyX3MjQHpSK7y6/FhC?=
 =?us-ascii?Q?KMW0v3RSe2dqNF6IspYhSDD3v5ZskJj25Up1dpdIsjHwIyD0JaEmCBYMc4PU?=
 =?us-ascii?Q?B0jTMNr5Lrq7wldTW3BmU558DMt8r+DfSM2fSl9q4tkZ6eJ21y1YCjAw7gGB?=
 =?us-ascii?Q?DFMs2yOTXAi+50VPQw5oLegl6FSzhPr3l7a4yix3tgqgt7plZ3GERjmmoDWN?=
 =?us-ascii?Q?YI1qcq8peZ51/DmR0d4qAYyW0KwlE6f4SyPFn6KqLzWbL1STG8bg9+TfzUtt?=
 =?us-ascii?Q?Cpc6zuHFpaqXAzUp1e5w7hhLH57KaYIL/8XJb/IonFznZssm+kjmU8CgDqyD?=
 =?us-ascii?Q?ByQgmKrs1O84QLZDZvz+xTreG4nF7pZ9V6WgEJVa07C2mXwZ37eq/Q8Aw9RB?=
 =?us-ascii?Q?uMgSMdzoVW3oGKTWd4NFzlnN2/8B/z8ALX8XanQ0DJWTk5ceKdCpVu8RYkhT?=
 =?us-ascii?Q?8d6b8inY5uR49xg1vcS4TBLNbzWhi9CfS1zHQoADdDM03D779icDv+0J7Bc/?=
 =?us-ascii?Q?F6BjXD+qL3znHVR5Q/QleAY4Uknb1+6W0dVvhuNuhS2SPFMA02RIMqLWPsVL?=
 =?us-ascii?Q?m0uJY1GjFKI9hFDor1uTZ1jV8/mkDTlgtmMFm5Tei26La6hQ9KsYA1ih66Nh?=
 =?us-ascii?Q?iY5to+7eWWkBXUf6pf0Jvj41sWxYNDJ+Cpfmu1wvZlcJPj0UVnVhScWxMKix?=
 =?us-ascii?Q?/qFZMM6rHaQd21uTXhJlxq03/j44A0t0lO7MpZ2EzqA8IoG9Ts7mWIrqKZab?=
 =?us-ascii?Q?xpvoOo+VTBHWRrbOv9ICWQ1WqhCGf0ouglh6qYBh/HT3RGpjhT353YjFzvWN?=
 =?us-ascii?Q?aEH+Nejjjpoe8VMW5l/AsR0nVbS0BIhlJQd8QJATLawC23PkiE8km+2jrN3W?=
 =?us-ascii?Q?XuWdf1ZD6BHVKKK7Uol6Qvhlq1roT9nwFO5Mh9OpgQUIvMA/8tubNeAA9r3a?=
 =?us-ascii?Q?NXKyTyhZS6510An2C5t7td3S0fkdnQoZQkw0NZ6hjZbTz7jlYTRKeho1Frti?=
 =?us-ascii?Q?vKXiiONiA4UhEGua/pGpSiXFfe03cB1Ek0Ur?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k/zcfVgb9fq76asnnnUvsjw5+yfinv5V9acu/2FMi2HYfgA7q5N42o7AhmEi?=
 =?us-ascii?Q?aeDUKCuGh3DfJTx6fuDFNeCJKh9S/9PDI7Lx3SsF7Vi/jSz4kA4F5/rRcdaG?=
 =?us-ascii?Q?b9fsINAiIMj2E9A4wBNR1rc9/gxiwDLEWrmRT2ipLvL1iGtXhdldbTnkXDvv?=
 =?us-ascii?Q?IxohRnIPtFzK//CcJqWlQcqj6u7qK2/praKHiua6COr+OBbu4ezDPPP25lna?=
 =?us-ascii?Q?YQduVBTzfLLwcQFQGYss8iaRyFDSaI7owUicA64ECtPbfYdgq6Diq/8y3cwX?=
 =?us-ascii?Q?qbNquvj0m1dE2ONCOB+YPxz3rYulZ2XNv/FA64bvr259vTrb3hGqdKCIRHew?=
 =?us-ascii?Q?VZQC2yPc8bl7g9HgEL8FJ4IIVL5/UnBvzVdG8AAV4R4kBFUETigeOg5oYU5T?=
 =?us-ascii?Q?F89IXdSgejDLURjSL/4SmUAHUqEsfkiAOPIM3RFKoSIlngs3Ef5Jm70uemKD?=
 =?us-ascii?Q?Aprk94zqld1Vau63MEXR31g1wO9TBh2WEETiWeldpC7aKPPZhJ8z3fNZKIol?=
 =?us-ascii?Q?9K7gf4sJv0htoqbngCNbupf5stLFIEzt7z70wb8zOE7Ur97DLpQ4DGQfcrfm?=
 =?us-ascii?Q?QAbyH7ZTvnm2509MoMKusMiN5uVcLIKSQt25M7hqb549xmr0DjKeJMooNKdn?=
 =?us-ascii?Q?T9K45UaPtDV+rfycKV93RA+5wX36OwD6ry9SI69oGGvICPZuzLZpK/fw3bnc?=
 =?us-ascii?Q?nrZdWFvt3vSPTkhb0hCBXq+7bz/8FzlTm6SEwM6ud3NXVaW3To/g3mwTIDpb?=
 =?us-ascii?Q?9GN6k18Hftj7cTIRY+fKfyBPhbAImkq1v2BdU3Jfm0FrED09tfaVtZEfPNZR?=
 =?us-ascii?Q?a8dY0fhO3Ctv+t137UYucdYR3iyB/qLPV70kXpxcIwWtfGeasx6L/bMVFGM4?=
 =?us-ascii?Q?JJ99kbWnBihhtLuqimx05aZJyeq6g0UzZJE7cOtPDzjIOL+9Nn+l1a3zXa7p?=
 =?us-ascii?Q?0FOx73VkZzF8JlpvNYVjOwDeH2L7SXizjYtif3gScsHXL6EeVGO/T3TiNPE9?=
 =?us-ascii?Q?Il+Hz/ZUT3dap5q8X84DC3iH29o1po6i2mJrEldJrq4JTkLfsO1s0Gq8Zo1v?=
 =?us-ascii?Q?bkwvi7LPCalHqnkweX0b0Ic92EIfWZopW99jFgXBQPhGBVmPTlOWx9ZwUH0v?=
 =?us-ascii?Q?P7OB73Ul/GwKRt6yAj8aXU+/e0ifhmQdGuH0KvcyT8AV1JyfN6gu3ZElUe1A?=
 =?us-ascii?Q?9OWKcmyBvB70eC3HxJC4LQuHZleTOxHjxTMcBvmiqXCYjMWLjx6ENiaktG0g?=
 =?us-ascii?Q?h5VTWMQb67/MZGhwZ5CaNRJ01E4zCbhipVGRmfwjc+VPsDh7BQvlHwUBCZLR?=
 =?us-ascii?Q?Q6eqA3l9OE8j5NOJIy9AKw7slBjpxOlAie7o6U3GklCA0m7nwm9ph3xM5jgm?=
 =?us-ascii?Q?QnBnNFCXbN4l7ev0V+YVVWAq+mzBef/UmqR6JnjPcg1wFXQtZjux0o1VPz1+?=
 =?us-ascii?Q?O+plnTjK90wbidzRngoAREFgHAFX6aLm6NYsuZ9OQIj8lxEJ5yhe/pfdpCFS?=
 =?us-ascii?Q?nUujfCSsGKbJ8IQtgo0FMSQ38I63qZu8KWTgZU+mOWTEZP8lp5Dq3ZcFStvG?=
 =?us-ascii?Q?HAl0R28+Qf3Wx4tEjHMGts4MKFaO2IcY4sDF2G4In590JU5s+8ptV4B9mAov?=
 =?us-ascii?Q?wdAPn1bSxwknUQUznbqpTAv9tPrqWnNIX9UPotEAURyIE97okEnYCfp2l8nD?=
 =?us-ascii?Q?igb6rA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422c64d3-77cd-442f-8111-08de20f6c306
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 07:48:53.9073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zD0CVc3na2/JMYaw65VL5Sn+pzDog+bdgnDzQ22CWDiovJmdipVIK/JpL2zKLWjcuq8855ut2wU1LILht035kd/ail9L/WZ6HADzi2Ve420=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6358
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Niranjana Vishwanathapura
> Sent: 01 November 2025 12:06 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH 05/18] tests/xe_exec_multi_queue: Validate queue priority
> setting
>=20
> Validate setting priority of queues within the multi queue group.
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  tests/intel/xe_exec_multi_queue.c | 65
> +++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_multi_queue.c
> b/tests/intel/xe_exec_multi_queue.c
> index de2aae8f2..6c5ff54ec 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -18,9 +18,13 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>=20
> +#define XE_EXEC_QUEUE_PRIORITY_NORMAL	1
> +#define XE_EXEC_QUEUE_PRIORITY_HIGH	2
> +
>  #define MAX_N_EXEC_QUEUES	64
>=20
>  #define USERPTR			(0x1 << 0)
> +#define PRIORITY		(0x1 << 1)
>=20
>  #define MAX_INSTANCE 9
>=20
> @@ -35,6 +39,15 @@ __test_sanity(int fd, int gt, int class)
>  		.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>  		.value =3D DRM_XE_MULTI_GROUP_CREATE,
>  	};
> +	struct drm_xe_ext_set_property mq_priority =3D {
> +		.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> +	};
> +	struct drm_xe_ext_set_property priority =3D {
> +		.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> +		.value =3D XE_EXEC_QUEUE_PRIORITY_NORMAL,
> +	};
>  	uint64_t invalid_flag =3D 0, ext =3D to_user_pointer(&multi_queue);
>  	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
>  	struct drm_xe_engine_class_instance *hwe; @@ -75,6 +88,11 @@
> __test_sanity(int fd, int gt, int class)
>  	multi_queue.base.next_extension =3D to_user_pointer(&multi_queue);
>  	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -
> EINVAL);
>=20
> +	/* Setting other queue properties are valid for Q0 */
> +	multi_queue.base.next_extension =3D to_user_pointer(&priority);
> +	exec_queues[0] =3D xe_exec_queue_create(fd, vm, eci, ext);
> +	xe_exec_queue_destroy(fd, exec_queues[0]);
> +
>  	/* Adding queues to group after primary is destroyed is invalid */
>  	multi_queue.base.next_extension =3D 0;
>  	exec_queues[0] =3D xe_exec_queue_create(fd, vm, eci, ext); @@ -103,6
> +121,11 @@ __test_sanity(int fd, int gt, int class)
>  	if (n > 1)
>  		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, n, eci, ext,
> &val), -EINVAL);
>=20
> +	/* Setting properties (other than MULTI_QUEUE_PRIORITY) is invalid
> for secondary queues */
> +	multi_queue.base.next_extension =3D to_user_pointer(&priority);
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val),
> +-EINVAL);
> +
> +	multi_queue.base.next_extension =3D 0;
>  	for (i =3D 1; i < MAX_N_EXEC_QUEUES; i++)
>  		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, ext);
>=20
> @@ -133,6 +156,37 @@ __test_sanity(int fd, int gt, int class)
>  			xe_exec_queue_destroy(fd, exec_queues[i]);
>  	}
>=20
> +	/* MQ priority is not valid for regular queues */
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
> +					     to_user_pointer(&mq_priority),
> &val), -EINVAL);
> +
> +	/* MQ priority validation */
> +	multi_queue.value =3D DRM_XE_MULTI_GROUP_CREATE;
> +	multi_queue.base.next_extension =3D to_user_pointer(&mq_priority);
> +	mq_priority.value =3D XE_EXEC_QUEUE_PRIORITY_MAX;
Why is it that XE_EXEC_QUEUE_PRIORITY_MAX creating error, if that is the ca=
se anything beyond HIGH should throw error.
Naming MAX is not making sense as MAX mean until that value it should be va=
lid as per my understanding.
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val),
> +-EINVAL);
> +
> +	mq_priority.value =3D XE_EXEC_QUEUE_PRIORITY_HIGH;
> +	exec_queues[0] =3D xe_exec_queue_create(fd, vm, eci, ext);
> +	multi_queue.value =3D exec_queues[0];
> +	exec_queues[1] =3D xe_exec_queue_create(fd, vm, eci, ext);
> +	xe_exec_queue_destroy(fd, exec_queues[1]);
> +	xe_exec_queue_destroy(fd, exec_queues[0]);
> +
> +	igt_fork(child, 1) {
> +		igt_drop_root();
> +
> +		/* Tests MULTI_QUEUE_PRIORITY property by dropping root
> permissions */
> +		multi_queue.value =3D DRM_XE_MULTI_GROUP_CREATE;
> +		mq_priority.value =3D XE_EXEC_QUEUE_PRIORITY_HIGH;
> +		exec_queues[0] =3D xe_exec_queue_create(fd, vm, eci, ext);
> +		multi_queue.value =3D exec_queues[0];
> +		exec_queues[1] =3D xe_exec_queue_create(fd, vm, eci, ext);
> +		xe_exec_queue_destroy(fd, exec_queues[1]);
> +		xe_exec_queue_destroy(fd, exec_queues[0]);
> +	}
> +	igt_waitchildren();
> +
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> @@ -195,8 +249,17 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_place
>  			.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>  			.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>  		};
> +		struct drm_xe_ext_set_property mq_priority =3D {
> +			.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +			.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> +		};
>  		uint64_t ext =3D to_user_pointer(&multi_queue);
>=20
> +		if (flags & PRIORITY) {
> +			multi_queue.base.next_extension =3D
> to_user_pointer(&mq_priority);
> +			mq_priority.value =3D
> XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
> +		}
> +
>  		multi_queue.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
>  		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1,
> num_placement, eci,
>  						     ext, &exec_queues[i]), 0);
> @@ -297,6 +360,7 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_place
>   *
>   * @basic:					basic
>   * @userptr:					userptr
> + * @priority:					priority
>   */
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci, int
> num_placement, @@ -314,6 +378,7 @@ igt_main
>  	} sections[] =3D {
>  		{ "basic", 0 },
>  		{ "userptr", USERPTR },
> +		{ "priority", PRIORITY },
>  		{ NULL },
>  	};
>  	int fd, gt, class;
> --
> 2.43.0

