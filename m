Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD5CECE564
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 09:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0C410E75E;
	Tue, 10 Sep 2024 09:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTFNRwLb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3C110E75E
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725962361; x=1757498361;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sqY/50CSipH5JHGvZMRXn6t2nz/5SRfGYM83t9bN5FM=;
 b=PTFNRwLbuAZRQB4fXHigdIUB/GWxt4pz6G8qkuxa8jpoGkq2WK9shEcn
 6b2uuMjEouXtMXFrVUt8MONj7lSx1R3OJ4qv6zbrKM4Ezzhe/OQmbX1uF
 dK5iN28l/ks6MGBge8im9rEdAUkNppLRTpSw2v8mWApyx1ubHyowoYGF/
 cHvXkewORZwNjRCN1mJLbFGlWLAtRKSk02gCtvTLs/9AOAkOArlq7pSPQ
 zwrJZii8hQ/3OGTUiTvTiIuWN/aeocwxC4tFAgotBdExFYnDllU1JyRPw
 6OH3uIB/n4/8tFD6CuKBozraxNgXBm8o6zWcZh81mt4m0AfBt43nthZZT A==;
X-CSE-ConnectionGUID: MqQHhDhgSaajyQNNd1X/jA==
X-CSE-MsgGUID: qzpUsTHPRbGGEcI5fXwPRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24513424"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="24513424"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 02:59:21 -0700
X-CSE-ConnectionGUID: UThpkrZmSoK3afn4RROzSQ==
X-CSE-MsgGUID: bd8ZY2I+SlKlt6qijgvi0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="67224095"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 02:59:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 02:59:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 02:59:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 02:59:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKczMJ2di7ETx22KVgB4VkJvw7a2eHJpTJTgfyST0p4oZHtRr6qssT1zmisaIwkU4pEQ/m+R3aM560xCMUrH5kFJpFeylfVcbrisgUuiItYAvYu4Q3zkFNEwH6Piaz5e1Dy6KMZlKi+GjoGrxrRynwDPcjGMwxWto5GUAIFUw6kI8Re3kPhaWZeZIrlFWzHMNn4BKp+pv9Gvcd+lHggkY6t+RNsREdlxek4/yaWEUKKURDcJ2EbAKmgUws7wVzr36LRX1jRvwe/MdbRuYzapWIRzMli59y10DNGfjSYiioJGkEmBPprwIfWLHvl5Ue50B6WnUiJMD+kLRVLRzv4w7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7RcjB9IdOnkNbWIkAl7V0GrjI7qe4cztOvWGX7W/HY=;
 b=T3JWO20QmA9a/bHY5euYAtpAu8horeVdwSi5TXMTycXy6ajQJFo9uVH9YF+NQjMFNQl+hd7JK08qTLzD1L+Hmu3gY4hTIm6lNlGCtJ5149sGHKBi/6Ut54/o29Y6pragPUDNJNgi1Y9KfvW7fZXGKv3meIhBm1b2JdY0tC8x/g/nnPqh6QBZl3FBkjM2R1J0MhdRGcYYT/HP+OjENFReaN58dKZGFfq7WBq1URQZsPcdlla2xbXqrA74jFHza/zCgrJdcO8S/1LRYSsk6MHLmhCUUfK9GYCeAzgsrM9xb9T4bWnOoMfguo5KSb4rT1DM4o+jiOVVafegygV/YmaODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ2PR11MB8371.namprd11.prod.outlook.com (2603:10b6:a03:543::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Tue, 10 Sep
 2024 09:59:17 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 09:59:17 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 2/3] tests/kms_content_protection: Print correct
 output
Thread-Topic: [PATCH i-g-t 2/3] tests/kms_content_protection: Print correct
 output
Thread-Index: AQHbA2aLdlmlUzSlcEyQ5U+18Lc/PLJQyVyA
Date: Tue, 10 Sep 2024 09:59:17 +0000
Message-ID: <DM4PR11MB631203231E2AC3BC8E8EC39A909A2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240910094529.545064-1-suraj.kandpal@intel.com>
 <20240910094529.545064-3-suraj.kandpal@intel.com>
In-Reply-To: <20240910094529.545064-3-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ2PR11MB8371:EE_
x-ms-office365-filtering-correlation-id: a1d1be9f-4650-43e2-cc3e-08dcd17f3bf4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?usZP2LR59vY9ayROTo0j60blSAb0L7Z7Ptv0/goh4kEJqIGH3Mn16jt0WWwW?=
 =?us-ascii?Q?YDAZYZGnViBbChEbn56COm6D3J3JHsMRRI/0QSocguy5vqzNpBsELr7RHkKL?=
 =?us-ascii?Q?uZuNE4tFvKdJxnBHJjbHcpj3s83Ksf5XhFro3F5g6Zcy4UTmy4olj4wA3mrP?=
 =?us-ascii?Q?IaU7/jYiWznI9LjyUgSVsfhopyzDyb7dKhzRqF+1TeK6aYStiLsyS7pAAFEC?=
 =?us-ascii?Q?bg+hDlwSFe907O1qofQi7hAGd2qgDpsjIpzs7z6fnfoloLPYVaF9zZV7Z+N1?=
 =?us-ascii?Q?EcCIoUG3JXSKn2YsliS1MRuQaHu3tuyRoXSjXxS8oupnv8e+nQmapL8iNhq4?=
 =?us-ascii?Q?+dr8ZSbR57ywBw8oJSbWhHrU9LJNxd4kiMDqpNeBhnpyU6xJn0ArFd8yLcYu?=
 =?us-ascii?Q?PFuhi1VR8HniDkQiMUg9aO4avxq8ypMyEAh74HmXSFYEryiS2S90G2fi9Uj2?=
 =?us-ascii?Q?JDuu+G31CdfWiMOSSkZng3Tre1WvgigZJw+KML1IPH0Ow5tsOEQhx+e2vxU1?=
 =?us-ascii?Q?l4sTxiOh4C9zdcTeUlkLDcOL/NcQHzis5RhzFhUXc3cyfh0hJX/ieyV598o5?=
 =?us-ascii?Q?vLiRvLOzTHn/hQrj+0BLQxF3dY7JQfOEquWplrdkGcNTzR03fRUfDHroa3uE?=
 =?us-ascii?Q?a6DldHoSTOw8Y9+N3Rj+TwibOJ8khb+EHjx382FaN25iSIDMjU89r0fJrV7q?=
 =?us-ascii?Q?x0aNkISkLDIC8/BkQ7OkD/jYnOLsEVG6yrXf0+0fVWAs6ME9FqhGZ1elwxrc?=
 =?us-ascii?Q?OFqzgKZw3A5fAbpdsHZvyz4No0Fu7P8DDmpO+UtT6sZ0l+0RY/PgZX2JLYZJ?=
 =?us-ascii?Q?cx/pCOZH9OnKHZuf9z8qQzeMlHudsNi59iJLirXYX0X7Oysuqo4PezE0z5O5?=
 =?us-ascii?Q?L2X17cLeQDLplt/m6k4galOMgR4qekMLrmM1o/CgRvVMQqkfO8RyfdxwHC2x?=
 =?us-ascii?Q?VV7Y6MUvHnmHR8vAyuavPVIsV7ECMzRY6VDL0Sz0Q0NHcyZtg0aIl6TrwayJ?=
 =?us-ascii?Q?aRKaH/ufOSfeBGuHxzBl8rSSPEfzDPsSem8hgEvbMecjgTP5kaichR0zTrMc?=
 =?us-ascii?Q?oSi/YFN+f0mwhcY3S/GiU/V6RgwDBKj8gWh3GSSatEC9/J+rArTm/N3left0?=
 =?us-ascii?Q?0i3gZ8QNBPGogDGbEQMrFEldXn5Jk2JjMwsUuB4nvIK6jhXslLUIZ6LqcpP5?=
 =?us-ascii?Q?VIwpwqtJuubLLEIJBzXgm6Dut7XL2ktKv4ok5z9iZZWd5SiopOSeSGoVN4I8?=
 =?us-ascii?Q?FnqPDqMJLdfY+cF0PoWySPk/wznntDPEwREwC4rD9h9YEPEOpE+oFrWC0PMj?=
 =?us-ascii?Q?+sGrTUs4JTzAkhg+yOngaKCSVvMNwDjbbYM5fM3mgSEm8b5RyOYdToRylzT5?=
 =?us-ascii?Q?H7GhRMOYm4m9CvoFKwg7XkkueYHw413i2H90Uqr+eNU51tMLUA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w+J6CyKvoe0fGkmeV1KyBWuMcZjncbrc4OhoBUetdicF+k/LQul9kpchQVOt?=
 =?us-ascii?Q?kZrG9eGfedRSjrk4jfF50oZfJ2f1RK0+mEXbCGw7ngpP7e+n254XB34AAerf?=
 =?us-ascii?Q?dsE264D0JcJ+EWG8tRHx7JGEPjzE/SNEWP+5YQGTNdcc5Ib0EqEQam2zuCpW?=
 =?us-ascii?Q?q91qG4X5ANBQzVVaFMSli2BVXXI8k7X0f26eWG+5UhGzMQFeCUTvIZ/j5A1I?=
 =?us-ascii?Q?wcpv2948PWxOyOLVvEziG8tdzpvwxoG6ZNVndLIKrEpGw1u819t9eOcuS8VI?=
 =?us-ascii?Q?T33J99jB5t2fgrGlPsmi0hx5GvIl5NHBO+ZARQKUACe2yxLEK4jUuH9eF4X0?=
 =?us-ascii?Q?WTCp+kbs7jiB+2dQvnDrNPdQ1EmPoeV2yMVUeJPuIaQ1eTVuD1J76V+2K1KV?=
 =?us-ascii?Q?v1U3DEHWS0J/M8kxyeDo7N/7U5uOTul0BV6c9/GA0OyQ9iqO95daRjzp5zyk?=
 =?us-ascii?Q?13NPX9OPPtbjeOrzRsRrmC4pG7H2luQEm+rDiBFRi7gliIXDEx+DrzlJGPWe?=
 =?us-ascii?Q?FOurLxEpo936OJdXvPuBaoe3k+KAQCHXPZQYQ/FHuXcepjM1QCXjJO10M6Va?=
 =?us-ascii?Q?9RyMDOl73StG+IaTlxMrGdTWAP1+lzAA/lHvXLuJSkCiSXbx+pLCw7/HZtr3?=
 =?us-ascii?Q?1OGVdMPS67yn3NfIoYzB+hITEQd1DKqWok6D0exZcu7kNcxrXccmgd+OByyB?=
 =?us-ascii?Q?w8bn39kk3WEk1cUsZ5hNevloXz4E4VScUamlXtnrkOFJtgQEEZtrfhw/BQeu?=
 =?us-ascii?Q?wXQN3YLyTIW4NMqGCxju0bjpyUmaj2HFODq+oXRjvxFFgdRyW4MebI17922U?=
 =?us-ascii?Q?x/i1RPABb2B8EowUJhsAxISaLI/nANxh0ljiMf0CnQ/9GpNJ2nWyCUiqMaiC?=
 =?us-ascii?Q?FaCeDYIWWHummUeMAy8TDX7LBY0QtaoxzNZ0O1VE1YftPZRN1dLZXJcLw8p9?=
 =?us-ascii?Q?GCzsoWESvCLSoLG8itt19xihAcKo93RiVeEGsHSxxdeS0cD1PYRamymsQvVB?=
 =?us-ascii?Q?hq3scxgMK5mqEKl7wnGIwnYkl9WSoOnzEHzFyri6h0brJod9DgEV6U54mFWy?=
 =?us-ascii?Q?IhS0mrKo26H5mADfiK0NxYA33RTtts+puy/fc5QBs91yis3Bhahzv402EK4d?=
 =?us-ascii?Q?UepbARgiY/VLkHrefy9S3Av4rPJyE6NA5NR1y+cU+6pIC1rAChpceMK83/AB?=
 =?us-ascii?Q?iakaV8/bJw810NWs2UJ2J03YmdLvK1SXepI+qohvaGCf9j1SmMdveJ9bUnCg?=
 =?us-ascii?Q?fDamNxiJLJ5m8m9mTv0Yv9zBkSD1FXWlwTHjmGl7aheQtiQ/0TMiDQFc4F/U?=
 =?us-ascii?Q?GPXLhSdWnuW3mdkGmTtXhIFuO0ttwlWwdRxI0RC/78ITzuBKmeP1jLIveQdL?=
 =?us-ascii?Q?qfRtsnad+tZaaykz6EGcSNBOfUnzHComaYm/LjIr88LjIn3V4F9jtcYfSlfa?=
 =?us-ascii?Q?NBlglXK8hWB+RTyxG66/gzUieyFxJCP2V/7SUmCIYEE5cQyDljF81C+tCf5p?=
 =?us-ascii?Q?sl5QUSm2Sn4hFHRSRHmgsMEtVgG/HsCEQnkmGh84+a2KG8R8FAlYi+oQaoqW?=
 =?us-ascii?Q?04wi5RO1i3Kw3m/uIfE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d1be9f-4650-43e2-cc3e-08dcd17f3bf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 09:59:17.6541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CdWLciLHIj9PtRxvAlZq52+PH0V5QhsFwxtnqAPocSTPfIFt2I5DnlSxoFB3p7eUqaS608Q9oU7ebdLNarhbaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8371
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

LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Tuesday, September 10, 2024 3:15 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t 2/3] tests/kms_content_protection: Print correct
> output
>=20
> We should be printing the output we are waiting for which is first_output
> rather than printing the 0th output.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  tests/kms_content_protection.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_content_protection.c
> b/tests/kms_content_protection.c index cad8811ea..c3771fad8 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -653,7 +653,8 @@ static void test_cp_lic_on_mst(igt_output_t
> *mst_outputs[], int valid_outputs, i
>=20
>  	/* Only wait for the first output, this optimizes the test execution
> time */
>  	ret =3D wait_for_prop_value(mst_outputs[first_output], CP_DESIRED,
> LIC_PERIOD_MSEC);
> -	igt_assert_f(!ret, "Content Protection LIC Failed on %s\n",
> mst_outputs[0]->name);
> +	igt_assert_f(!ret, "Content Protection LIC Failed on %s\n",
> +		     mst_outputs[first_output]->name);
>=20
>  	for (count =3D first_output + 1; count < valid_outputs; count++) {
>  		val =3D igt_output_get_prop(mst_outputs[count],
> IGT_CONNECTOR_CONTENT_PROTECTION);
> --
> 2.43.2

