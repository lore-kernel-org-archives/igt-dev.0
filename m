Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BE2CD8CA8
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 05:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D1810F24D;
	Fri, 12 Jun 2026 05:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UP3mMLV4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE61710F24D
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 05:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781243850; x=1812779850;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6zu6+3A+E+NFhPvXe/uj6/KYTyqup8FDMEiVSgEv8h4=;
 b=UP3mMLV4gFcjYa3wZZipe4gDsvOCNChinofHdWkEoMwdJmnxv2U4cBpq
 di/yobgWZX4Nhlc0u564pzWPGykZbdmylW1mSUOrZmgFtlTXJveGKdvzi
 WpeXPeLnbQrTKO6RpiqGZfQAUo7boNUEqKYJJRHeJQU4YkE9xRA85swVX
 qSHJpg0JNEI0wtqrk59yH7WqJYIworfoD3SCIVKSv0vVqsgGgjtw3M/iW
 Yve9CuA6k6gg3QgBGGEWVRoULtqu/HZwPaKvEvyOvKcKiOnCn5/r2g3M7
 wkxurAHtiD3zPt63rHl/sKqmLNuEtC4YmdgkNJdo3QAPvElt0mVsWS5S7 w==;
X-CSE-ConnectionGUID: VRcq+jPXQGerM01Q5qOawg==
X-CSE-MsgGUID: 2VewaRyuRYGHLhb7zDEpPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82076705"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="82076705"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 22:57:30 -0700
X-CSE-ConnectionGUID: Hd77IxuxShu+Y6lekZgAjg==
X-CSE-MsgGUID: hoUDTbHCSoiabO80yLtZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="242601741"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 22:57:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 22:57:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 22:57:28 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 22:57:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEuP4NXdS8r4ZEt6a6K74GNoS/PMqQ0Is+AvL95/UJR3kKS0rX1OE+5hcJBxilCHZqoiZczov0FDhtgSMq+6yg/xcM5pYy+mvQ/QiDQ57OJ4gLvqz0iuARU3QfyY53VU8ObEW0g1aDY+QMqZKjQ9eDR1QOc4gio27ijp/7YeoDukL2Y5E8fCLPCi6AjVbSC4xm9Yh6Q2pvT2lVf6ESl3c5gxtk1oxktyIk4Xre5Oa+5f5V+vLQ0ip2ddmUyLWnZ2gCWo8rb/niUO19vgU0Oqoife5H6D79NHo3zWLTpXaJSzFrNRt7C3zR1LBFjGyh6/1BfStxiek2skQeqpFlZjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2FXC6hnD9Trq6yGE4uVpwWRSN8g7HPCB01hxukhhR8=;
 b=LJt7WWZlNU10vEdH1FXDkRthM9Z4sJb+GaR1ajQrjda8yleqkUrLNtLPzrysug9x7+TK+3dezmDKrBmOlq5f9JylWH1N0bBF3M9WTivYS5tYQhf9rPLcqqzcO7i6MDlqFhs2YHC+qa2p4Y9bvfOCKg9nEoazdJ4qdnG3iHBzy/Cs/2qmQ/b5tig+JBBifoDPdm626wL07h8gTF6JTXD+cUaQs6XRScOxwnVCmUDVWG5s6Qc7cmZgiNcJMzYfCQIOvaBMcGKVVKo/RnIcBQ+09t3rnCcTKCNoK08Zun3lhVNbNY7HZdvkA31DAx+c+KYpfyj2Fr+/pBoNZdCmjWf4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by LV0PR11MB9840.namprd11.prod.outlook.com (2603:10b6:408:383::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 05:57:27 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 05:57:26 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_reset: skip compression
 subtests early in main thread
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_reset: skip compression
 subtests early in main thread
Thread-Index: AQHc+gVnNkHVVZrrF0SRP5Yq0hYZjLY6bH6Q
Date: Fri, 12 Jun 2026 05:57:26 +0000
Message-ID: <CH3PR11MB84347DDDB4389EA041BE8DF68D182@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260612004911.2003505-1-shuicheng.lin@intel.com>
In-Reply-To: <20260612004911.2003505-1-shuicheng.lin@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|LV0PR11MB9840:EE_
x-ms-office365-filtering-correlation-id: aedd2d3d-a514-48e0-0a42-08dec8477b38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: DTSwyzvcbAP54uW+as/jG0+In3k86A9E1oFdcoYgabpyVxgoFO3cXpW7grN7mtMnFhl0Jn8yY+8VMHQFlZUYm/r3vYZYvHjHHmkUhm69VQ3ZB1VJALjY7Y2vdINvPaAAdM9T8PiZM9jSmLPBw+sO6lthWNuC+0ZIRQDZNmeu01VU2BAzH2CvJSVgM4XFw2PpA7Dm3r6mt1y8eCnzMNDEhdL3C6v5Q2yngmvZHBwzs55DL6JBlEOYrP38cxsOSA1CCnCJX2/fKVbLJNSMdyL6xeNUk50AQFEGDiGVfneY2gul4tAW87YtMJ6GK30hIsL+Z4t908Z1GtwK89HJelBFreCHOnIovFDP4K+u/ZZ7a/cqwZ0Cqc9F5pq6bMzbZPYEoWX+IVzeMCJ6tI7iQM7Uuzd5IowORRu/BgRj0vfhaBTnW0yjYycJXa++c1KRJodGvQ6NADm93AyNCY/tIanvJxeD49mxIwMimZRt+uP4XTYuTGMw7XRd2it/yXaHVB6uhTBtRSe2b13e7jujOPRcO5io4wA/3YTb0gO/aKJarjyq3NOyAe9jjS/G5SBsGpVc7snpy4hmKcfrlNIIdvY5Y9dvbeMLCabR6/i0xv88LRLrpbgWgSQYP+V9ObGD0e9OP/ZhBHdYesI+0elFgVqOmDwwZvzebZjHwySdHR3zHRbJiYSnZiTExwczXgG4Hhwl1IuRwJfiQrnoLqM8gH08+FpBjkMi4SH/LH3ev8gHYMwCSS7wmSrtX1Y+M+17cNeF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/8VZtIW2J3r+08z4Ny1vLAk6Z5lLqyGgzB7vAgyAHZfFm4i7vOZ6iHXNtnhV?=
 =?us-ascii?Q?RJhlF2OSbv9Amk35OeoMUkmK0SRWY2ofZsvXUum2uAg9GoFVMQWk2EBtmVzP?=
 =?us-ascii?Q?Rj4HHsb+PY5P7ILHOtM+YJDNTtCkkRnC+mnmaRe47ceyJ/+7gij1lpvMru2a?=
 =?us-ascii?Q?pFexoFCXPaZDGtcOysP45BTQMDrCJUWYl1+m2Yberk0KAvyRU1SfhaMbVWqU?=
 =?us-ascii?Q?/+9B/GNfhU9C3UH3BYRKrk7TzagC6Oqf92vO2Y2+VKx7OJB0ImuQzi3getQ4?=
 =?us-ascii?Q?4Y4DLqTkWsvM3EStTTOaztfW6IKm8G3pTdqamxt4SuGEOXYdmGWVPjaaVG+l?=
 =?us-ascii?Q?WzCbBjnZq32PvqCEIYVVqZiarx25ziNmVsc77DE9RQ9/3W5TPxxCQDDi6CTh?=
 =?us-ascii?Q?IQtP8o1ZpSKSsGiN1u0s4xmAbcdhoboq1/0AtqgcTHYlSlVIiLkZdgVmgiAy?=
 =?us-ascii?Q?6/ZfRLlMFid6EQ8DSOP/TAWo0o+rwX8ZoT3bidqU4+gL750GEbxsicThUmbk?=
 =?us-ascii?Q?BFsxyMT/l+2dfDWHWttPI0AYwJJ9fRxdRaYuiuHwrl6BJF78KWu11wKLChtk?=
 =?us-ascii?Q?3cbKdJCkNfEGuC74Yj+Ivr7G7O3NZbiG9sdRU4XI8oGRvm2OFN3iKMKHcIFU?=
 =?us-ascii?Q?pO46KneCWlfCwL38xic9ptoULHZyIYtFPYIYIcTgET0xSHan1Wm4QQqG0B0f?=
 =?us-ascii?Q?mDXX1Hb7gNkaJZmcSTVQqYNJ8kdveeRT7va99ksGLpbknLGJdiIIbrUKKa1u?=
 =?us-ascii?Q?FiuOmRv2PdN5kK0DD1uaopZTCFktA8BSTEVZhVV8FJQgSQM/CEF5xJAK3Xyh?=
 =?us-ascii?Q?C95rCs/NI5bgK392/bIS18basyTjKnZOgl07k2v2/ENKcTkkPQ+hJK0N/VPI?=
 =?us-ascii?Q?+NsEB/3CzqlBM+/oOTYR75lWcCP8fGAyt20jUGAN/TJmXIDHn3NGbkKfZPYO?=
 =?us-ascii?Q?DRtqAoxawgC9SBEWxKTLjsWcXY0H+iZd75jBf+/Q/KYd3rtJsWt7v2ygTVF/?=
 =?us-ascii?Q?boPF4SmGpzSMt/xDwlhyEaK5TUMXFjVOl4Zw9/LRrd7FtXdU5dGqztucFQQW?=
 =?us-ascii?Q?606Ao5lMJFsCW/KqsD60DxkiwqNF9X3YFQaKwXVn4zXc1QWYEdqTdqV6m62O?=
 =?us-ascii?Q?tvIpCGJxKO7uK1C/UQqII+c6iFf3moHmR3RoBChrkHgKfaCXz72Tf89BZdbe?=
 =?us-ascii?Q?4kldkB5tSIofcVI18flaMbhmtIZgLUkp4Z1IDkd6i6Czd1vj1dCaxom452De?=
 =?us-ascii?Q?6Ia7W6wHfLw10SalndApDM74B4iE0YeG4zRUwKfrybibKBYTbCsisp8Nz9Nz?=
 =?us-ascii?Q?SEdCUkh0WKPljozMjL3momF4nTmj3qHMQX+szNce9KM3QptK8WmIZJfDlX0w?=
 =?us-ascii?Q?xwaHi0xCgE4zJHvYP3/+48KtFWI1xTQrRzE3DQw4WnzXcoyi6C0aztEPmtE7?=
 =?us-ascii?Q?Srg1M1R6RYi2/pxtz2ctazazZKpAqZV8ih/qz8sIrPS9J/jl52OrGCxxAIGq?=
 =?us-ascii?Q?RsL+Ef88Y+Pic+kzVHmBIfdedGcyEWodlLJQx/pari8wuNEOFvtSAg1I/C3k?=
 =?us-ascii?Q?a2IRLU7X3waMGf4SkhXm/lJlyDStULV9L93fsmuBvOC0Ht/m+zHxWrf2a6PE?=
 =?us-ascii?Q?HdR7z65ycsazH3tV3EqKgjz1f906BNGwTRjBQtFsalXToLyOU48JCy4ofH5q?=
 =?us-ascii?Q?JJxYfYTJiy9AY10UDREIayk93BJ0EzLdqRzlumD4c7SOyunKO4ECI/AZUakR?=
 =?us-ascii?Q?KYo3SHakaA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qTqLVbE2eb04w6xPp0ZFMzS6ToBE0/yQcI1x09S6P3/ccYxToEUoiqkaJmfY3c5PHdL17tGewh6ixE6566s0O6tHqDOhxW+Kip6NRvmPBBrJ29cpj55bkpOleYOrdgdVAKxOpe7yTyWHMVUGwjXn9uRiOuxGInFhPIN0F38TYXmEPJO5cE3f6dodofFyHxsNiPwYuEKYUkumM+fz7THbJETtnBLKEHN6C0FFkWl1pLwCmYZDe4OemUSN+LoTI0uQOoIh2c+P6Az0AO8/OYhC+EClr+DeI7KkVGJUt/Yx4+4svfaBNESl2NASyn/KXcyrX81Yvy/WlVC9CXoi6CHs1A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aedd2d3d-a514-48e0-0a42-08dec8477b38
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 05:57:26.8385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HD2+m7PSBQLUQYRjqH/a9AKgrVGzBH6lOCBqC07jiuusy1FImq0Euws1SzU2sG3q4T+UFdSk1rQ5Bk5Abf7dSA4s1juq2RDMw45INT1TLQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9840
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
> Shuicheng Lin
> Sent: 12 June 2026 06:19 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_exec_reset: skip compression subtes=
ts
> early in main thread
>=20
> The long-spin-comp-reuse-many-preempt-threads subtest fails on platforms
> without FlatCCS support (e.g. CRI). When threads() spawns worker threads
> that call xe_legacy_test_mode() with the COMPRESSION flag, each worker
> reaches intel_get_pat_idx_uc_comp() which has igt_assert(HAS_FLATCCS()).
> That assertion fails on platforms without FlatCCS and the subtest is repo=
rted
> as a failure rather than a clean skip.
>=20
> Fix this by calling igt_require(HAS_FLATCCS()) from the main thread in
> threads() before spawning any pthreads. On platforms without FlatCCS, the
> subtest will be cleanly skipped. On platforms with FlatCCS, the check pas=
ses
> and execution continues normally.
>=20
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c in=
dex
> 20be33736..4639620ac 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -846,6 +846,9 @@ static void threads(int fd, int n_exec_queues, int
> n_execs, unsigned int flags)
>  	int n_engines =3D 0, i =3D 0;
>  	bool go =3D false;
>=20
> +	if (flags & COMPRESSION)
> +		igt_require(HAS_FLATCCS(intel_get_drm_devid(fd)));
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> +
>  	xe_for_each_engine(fd, hwe) {
>  		if (hwe->gt_id && (flags & GT0))
>  			continue;
> --
> 2.43.0

