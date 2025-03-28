Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4914FC3600C
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 20:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A9510EAC2;
	Fri, 28 Mar 2025 20:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hPR51Rwg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A147D10EAC2
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 20:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743194686; x=1774730686;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7TYNcmWZckDPdczkkWRbZU2AnxJSpMK3EXtQd9cR1Ls=;
 b=hPR51RwgcaL9cigyL0kJyCOxp7agEoTJfN/5KQXhEJdSHQ92l/i72sbg
 kuRYwj7pa2iYaJFfuYp+5LncZCEnb6h1Uc8TR5r2cK4IQBclq/kfArP2D
 VRC8cnC7dLauSa/LqRQ4wOw6gsBXA3eJkSphveDXjKXTpk5lUsSbH8rEl
 8I8Oj/sArQeJpjlz5Y26DaXwPTXqbdmSiYXLBB3Hq9yUWtskA+T3MBt/8
 VChFgN+I2anMNIWSsFUAECF27R8tfODFhA0HHhhcAtrtSBC9oIULoeRhD
 5F6aGXuMg4Ks8V4sgrc7MblllwTqZyVDw2z8Eohl4/SsdYQU2ej5d1zFv w==;
X-CSE-ConnectionGUID: CUJrjq4eQr29v2MRWW6OfQ==
X-CSE-MsgGUID: EyZe7oeAQiyXLk75EK32Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44751709"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="44751709"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 13:44:45 -0700
X-CSE-ConnectionGUID: DUWWUT1KSRiphci32b0KbA==
X-CSE-MsgGUID: 3u+9iezPR3WxmyeQxuckZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="148718396"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 13:44:45 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 28 Mar 2025 13:44:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Mar 2025 13:44:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 13:44:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWklCkvkPdZtQEM5JEZF96K44/yY/cuUvwjeBAfJBOCuQgYsUMeWKMn1+Tg4NZtadeH43js8zU5CRS8arvdFEt7oPW5ylma4235XysE9N8OQRCN7ilVWeKTy/Qh8tiNUsrOejB1vt9l28MYM5w13wZKPsWSRiox3W9QV+vRoqguv6vmbTUvjvFDZ3nJyEpUnRtGFie10fFx9g1u/m9+c9vdmwOT+jexXoRQB4RyyxdfDE+GWbyj+Vswv0qjtKd+aF77YrlEz6Shx+ZkwOGZKvu8N930yO0MWbqE/lHFcbLui5tLlmsH7nPVgoNTWQmoFA39PWjKo516rjPrYRBQeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGYZaKPaHpVhCa5TAVA7Q1V0hdJ0s+4pGj1quqil5Ic=;
 b=tGhWjjam5bnWDX5jzWxRLJb13O25qqK57mBpZacNEZ/d0HM7Dlj/T3J4pkSR8ZqCJfNLGsaLRKq/FpheIZcU8lskOp6bdjQvT/AjDpGtEr6fSmkK9sNvkX69iirHJVyiU2myUdow3SHmvlUGCv4UcTHnGOeMtsz18i7RgOh5E15ooTq93S1/jUdyksm7Xo3tI5/HPRR6mWcwGCvc6R2LuTEHM+5ZxV/z1/tgRR4Rcg+7PtQ3ZUurUKwxz3eimEjqr/uooVGBbTtwneke7THhlF49BtIKZ8ROPB6YMxNPpu202s83LlauodPjTuhdIhbFcuYfbbwRMYE9Ggar+ve26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA0PR11MB7953.namprd11.prod.outlook.com (2603:10b6:208:40d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Fri, 28 Mar
 2025 20:44:35 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 20:44:35 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Zuo,
 Alex" <alex.zuo@intel.com>
Subject: RE: [i-g-t] tests/intel/xe_vm: Fix typos and clarify ENOBUFS error
Thread-Topic: [i-g-t] tests/intel/xe_vm: Fix typos and clarify ENOBUFS error
Thread-Index: AQHboBo8V7dcvzqYHEmjFcdB+mtnDbOJA+sQ
Date: Fri, 28 Mar 2025 20:44:35 +0000
Message-ID: <CH0PR11MB54440F24382BB7E38E763263E5A02@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250328194703.2763203-1-jagmeet.randhawa@intel.com>
In-Reply-To: <20250328194703.2763203-1-jagmeet.randhawa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA0PR11MB7953:EE_
x-ms-office365-filtering-correlation-id: 4ad51ead-c611-4ae0-cf7f-08dd6e3959aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?eN4Ukho8JymkGIe7vzx0aGgVtZ6ke/Sn4b4sUVku3zIYTVrhlHC6xQKQohmf?=
 =?us-ascii?Q?yUIdQhJOSmYIwYHfmwAXZEiVHmkcpNNtSqZtE0eWVi2KF8VwuOzgp3Z/zYUa?=
 =?us-ascii?Q?Y9hDmpVUq5RRb9Bmh6PkdnFCvAvNiHByfP2cb9NU4ialhLzLfNJy1AUgJ9e2?=
 =?us-ascii?Q?boRkQSSjQL2PLifnnWS3TACIOpuF1hHxrDC8dP7mJ4+fchi1Ko9Re471loPm?=
 =?us-ascii?Q?yjMBMQrUi8l/la/59Em0nQHuJuX9XpKcEvSz9hN5fV83lpWO/Hd+xX/cGe4H?=
 =?us-ascii?Q?F5imAVYoREFWTNYdJW6EfLxXUR5fmb7YPvVBSV7oQ6StIZ+Q25YLJASTbipz?=
 =?us-ascii?Q?77nH3P12S9z2yMTNxrW4qCqT/DO6VoKEWRTntwlpM0SKpV0B/AlCSQ7Sy5W3?=
 =?us-ascii?Q?+XCYNKeXjUaXN6zaO3bgF0tOIkb2cHfEoAAcA7OPNszR7pSHJ2lLKDwr9qqF?=
 =?us-ascii?Q?yhKBHqGQ4FbUezgJBDuuzFL7hZmFYWV/d93chQoiZSvTXUmlRlg1z7eBQzX4?=
 =?us-ascii?Q?ZiQL/YNeYIrLdLDQQnaMpwcLCmQPSeL367ndtq+Hz/PNkjHTtHzedOxwDd2b?=
 =?us-ascii?Q?8bO6oDtjdgzGzpgTDwhRsWvMLDq+sopOJ3Z7Go4zrjt4iMVMz9S40FDVvCha?=
 =?us-ascii?Q?XbpIq77M+ux+kGYYfm9dWk1G2aIREKaQ6ym6P51ZIgB2e+EX/jNhEn3M5vft?=
 =?us-ascii?Q?QRr/saLPhYHqd1Ed4IB2LZ+kRgsPUK1Dp8xSHgERVrxDV4pIBYZvafFsKVBK?=
 =?us-ascii?Q?Ez/KHty/1RuzvUaXI0/pqdZK5oKFj+46TmYGz/GqL8EGxhOQdhukMETd/FuO?=
 =?us-ascii?Q?q9SfN8ZdcVxO5yXWsFD3S3FZEf2DuPp4r9Cf+8oXGCkiOAyRR8f3Cc48CY0n?=
 =?us-ascii?Q?GZ3lghkiilF8lLWV9HBL4tyy8UT9h8QeKYqCrHdNUiJ4kwHUS9kdHd9jkrkZ?=
 =?us-ascii?Q?Tlyk5DQQOXsDXH42N5w5HbGswRFbr/scYnFysw/4kjVSubXatuzXx1lHzhzN?=
 =?us-ascii?Q?BMb4zoe0ngtM5nTElhMCpK05g51hbK/xUHlcuz1gNce6IwLM1RiyTsydeKvA?=
 =?us-ascii?Q?38hqXSIPY3ZDMrImCtetyPyzBRYZI7RL461jmYjo95KPttaab/CeNlRQos3r?=
 =?us-ascii?Q?IjaFs0GbSeE++MS1x6Tt1xvAicMaT9x9xq8bgAZp3z/PffO7YoHZGipcafKR?=
 =?us-ascii?Q?BhiP/Z4sIP71M7vUyxFXwGi2Nkzb46kL2TjqMt/MH+U2bPNrucvQjMZ05Adu?=
 =?us-ascii?Q?ujljPpr4WMNcqZa+UeiFEzNoigOUak1iHA7avdqSiJaA90s29BBfUIJ1GxU/?=
 =?us-ascii?Q?NWdfXoODcMrfPD1IrVv92yaeeqdlE6mKIyvAWHMB+X04wORagBOP8g/9on3r?=
 =?us-ascii?Q?pdyYbLAb3Ih3Q29eLfmmyESDyajdIbX7CO+rTfpYY8O6heHZU5/jINolKjA6?=
 =?us-ascii?Q?SWxXNTKs/CLM71CEnRhRTMhcnmEfDpAj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ufuj2r/+uZi9SUYobr/BjjsBYyIbWsPdIQVky2/jB8gnyFKdRPqaWCsG7P4o?=
 =?us-ascii?Q?GFyAPp4X3yDTmYntqaAgF4CUr0aG7qTsPzDLuSVfdo6/MKUfhW9oiqQ85mfX?=
 =?us-ascii?Q?HdEQjQ2R5rdxi5gMLtV4++HhFcr3EbzscrP6RogkoWDVnI9IC/yDQSIczPWC?=
 =?us-ascii?Q?mksGhbac9qbK9TVAvKleWC4VP5ZFYhSGNgAQsYRv0Ljk4AYTQNovgIt3ZSXt?=
 =?us-ascii?Q?EmpFkHbH+Mm4ZeV+HTy8iucF1yTYMOh6dZV3DHTw8cmodpWEj6+u6n6jmcoU?=
 =?us-ascii?Q?lnt1oiOHHO4mDQZqp0mD10bdUERUVi+3x6G/ym2+r6bHOJCuiTd9j31AvPyd?=
 =?us-ascii?Q?1oKAqq/NcLZpOBLTIungOcM0+PWSDa0010A9Yh6paA7fp6KNerisih0foHw2?=
 =?us-ascii?Q?x0Kg6Z0KSxSoDE9SIfWTRuVPuv4BDQk8zNTK9iA98mNBo/Ypu5L4m+7rOKn1?=
 =?us-ascii?Q?D2fkCVeLP3JT7m///w9mMHfqe03Eb5dKID93e2SBQLHjtG4CLMsm5EL3eOoe?=
 =?us-ascii?Q?3kTIi9qWZsjS/kVPngyIfBMkCQXgVEhklg5Z91uDFTF3t7R75KVkbi+ogr8D?=
 =?us-ascii?Q?gnRUY/Ios7J0xXxrsXGP6PZQ8pfnQWyOwwosnaGF3ZfFtS6shlWFWLsXP/o+?=
 =?us-ascii?Q?OqQztKVLb4zSCM36nzWk0Ugs31NZRQGdVWSFo+d5xpz3BpFUgu3y73cI8KhN?=
 =?us-ascii?Q?28iYxJefsYLAZEBqeGYKx2ZkHDOU0Lsli7PntUVFetoBWvNrPzcJ7yho7vNL?=
 =?us-ascii?Q?1Bsh+5LZ1jpY3jtPGCX43ZRMvogCtZMHrQManInrzq/2lDQ08PiI4bhLgx8+?=
 =?us-ascii?Q?hHvFVK8FOfLtjHUZ4Fk4sIGQaXxFybeZLvbCaDg4LTjvR4WtA1B7Wd0Khc/p?=
 =?us-ascii?Q?fluzKy8bxtJasUogr35mVfPg54KkECSMTy3KsBd0r4FYzHTB10AOP4rM6a1p?=
 =?us-ascii?Q?TCyIa5WioSGQyIHh4yfwVatGPS/qyWwMMJgX8sQiNe2jti+ckv63Yh5PRQNh?=
 =?us-ascii?Q?vPWBeBdb3Rc2jav8NRNPQWnrzZLyU1I/3V7izayYcWtBSQxieGatAQMt6eb4?=
 =?us-ascii?Q?lX1u1T01N5khLzyHJdxa1uQZgpSz0drmX6JOS7Dag8ow2qWewS10GKsXtAka?=
 =?us-ascii?Q?xvmdXPPTl4rM9aOk0/jR2BVl1RqaQz3zHgBFOydvDrd/BJzQCu1fJLqL7c4P?=
 =?us-ascii?Q?16K43ijpz1AkXeSnQHe0QqqzAYv2f4u7tPCfYQLg3aFWq2IzjzZbL2dU+GfV?=
 =?us-ascii?Q?k3BrY3IaGxbOGcL03peFBmORIpoWG43JvJ3xeFMPTTRpQQlLIfRO8luc5dN7?=
 =?us-ascii?Q?FjlSnlhdx0uh1t0SecjuyAUeS72FBFcu7NizSGahZTKnvTc0HzKaZ3McH9F9?=
 =?us-ascii?Q?mQTtMNj0YHDgGa0HgOhVz8P1vDdawt4z4NbNVWDZkzJdGE8A0Qx2n6qoKPpG?=
 =?us-ascii?Q?dxfoBITSNXGJGVC151x/5/ZyneqQOdyCCXoLMKpadHq/RLNRSQ9xaSAKyRzu?=
 =?us-ascii?Q?LHG738MxMv+nW5dfiZZw0ZyNUd8RjGg81HfjcyP8gvyOgCFXIh57CgArS8rB?=
 =?us-ascii?Q?TIDGsTwwN2a7vUVgv4bHOAL68uaw0NzN2WsZDhmj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad51ead-c611-4ae0-cf7f-08dd6e3959aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 20:44:35.2543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l3TICUMffNhzuSMK8gSYLmtE/6uDLGRf3QpDonwts4WO8H1zwwJgbMQGAvXwQfOTUaPL1AG1En/hIufy6PpBazx1+Izah1ENvavBuPojg34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7953
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
From: Randhawa, Jagmeet <jagmeet.randhawa@intel.com>=20
Sent: Friday, March 28, 2025 12:47 PM
Cc: igt-dev@lists.freedesktop.org; Cavitt, Jonathan <jonathan.cavitt@intel.=
com>; Zuo, Alex <alex.zuo@intel.com>; Randhawa, Jagmeet <jagmeet.randhawa@i=
ntel.com>
Subject: [i-g-t] tests/intel/xe_vm: Fix typos and clarify ENOBUFS error
>=20
> From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
>=20
> Correct typos and enhance clarity by specifying that the test
> uses oversized bind arrays to intentionally trigger the
> -ENOBUFs error
>=20
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

LGTM
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index fdf74c114..3aa07a1a6 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -880,7 +880,7 @@ static void xe_vm_bind_array_err(int fd, uint32_t vm,=
 uint32_t exec_queue,
>   *
>   * SUBTEST: bind-array-enobufs
>   * Functionality: bind exec_queues
> - * Description: Test bind array which too large are trigger -ENOBUFs err=
or
> + * Description: Test bind array that is deliberately oversized to intent=
ionally trigger an -ENOBUFs error
>   * Test category: functionality test
>   *
>   * SUBTEST: bind-array-exec_queue-twice
> --=20
> 2.34.1
>=20
>=20
