Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D0DCCD193
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 11:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAEC10E3A1;
	Wed, 15 Oct 2025 11:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlNLG2eR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D140510E3A1
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 11:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760526706; x=1792062706;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BHA/SZCVHr3MjuiRIo+HcLBP4C8iBeVPFNuUWPP0o0I=;
 b=VlNLG2eRHRYD0bzwIQO3RNzitfe9SIA0FDZhHOAaSKL+ESKpu6P5rJq6
 mo0urFTiPy04MKboNe1F5vDQpVQYTNFd4y1qWPT+Oa0sx8vrG7TLW7GNn
 9wUENyM3Lr5ChAVwkiHNx15eBNx2DwQsm0nVrwCFDz+RLpSOsXLkEEUu1
 PsUJ4HsqhvBuwy/0XNOhlpU0LUzFTJzVHKFHGpoHUJjDa1bO0BvttIhB2
 2iOEtld6cJUi+ThIUr+mjD99QrxjkXHst68QhxS1PnbishMRlui4IxYBB
 K6VxBUzLoM4uQeyo8XEaUa+bb6trMfVeQgq6/PsBMQFGCpdrA/9gxeklw g==;
X-CSE-ConnectionGUID: FVWEeU5xSvutd1LrgqeOMQ==
X-CSE-MsgGUID: 5PEaaJ9US2yZYrrET3kVSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73377052"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="73377052"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 04:11:46 -0700
X-CSE-ConnectionGUID: Fcsu6YMWTm6kTkD5fkAoXw==
X-CSE-MsgGUID: 9bCFQLiwRUesevyBR6I1SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="213089386"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 04:11:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 04:11:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 04:11:46 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 04:11:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgFDiOqMN5h3AlIAKJrBzcX225j4wWq4H2FQnrBr8Y9ItEW7PkHiQ/wVLVAIdvsNgXJUp+BtzxM5Cf25N2gCfeeBpVs2Cie9oNrJNt6wGnrfRY5PnVAfNYOG3nlFSaHuIyktNM51heOqtuXz9oDCEDuFaBp6NF2wY0KjnMimxNqywNRCTYN6xL52IjslmwzjcuAxZVhfIIyu8xrOzvnv4FbJBSsdx2cnFkDgBcLVmsG3SRGfYNqLu/sZABG463JUTCjf6t7noIQ2wCcqA5kwWjbpfI1u5RTLynOl/jLA2HJ2kym1yi/ul0yAtL881WCwycwz+6CATmcp0+o0hDMP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7OXR8TLUJOOVm0dVxPAT9jzAQAMgTIsaudJiF19y74=;
 b=Fkj5ajEhsJhpsnCq6+nC2AWu7xceRKznx4i9eWp3tTQygfjA8Sx3IkPb1vDM6KMNaZxQXu9i+y6YEPNDbZcwkMTG6Byr8cjiDVGN2xcATa7yDHlCQuJvEDFxME33+7rLJDvgoIhKwy9FJZ7D2Guc9HbiTo+puELzLaoUMDcH6D4IWPUpy4WQSCq8G93hyrL3F1p+zd/azQv2cev+vVcEAbu6xonbXnTNkD3BxNlN+Yzih9H8w2E8mlkmedCvPEGLKMZVoDGWcYHNu5wdNyXn8NqlMCmqVjmcUnVPSA8SmOWVf+r58oBpHOn58ktTJIbnwRm0tTffLnFQHYtWKoTNIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 11:11:43 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%3]) with mapi id 15.20.9203.015; Wed, 15 Oct 2025
 11:11:43 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] tests/kms_cursor_legacy: Change debug mask
 to reduce log
Thread-Topic: [PATCH i-g-t v1 1/2] tests/kms_cursor_legacy: Change debug mask
 to reduce log
Thread-Index: AQHcPOF4FlyuIyQnxUC4R+TLnQZmn7TDBnzQ
Date: Wed, 15 Oct 2025 11:11:42 +0000
Message-ID: <PH7PR11MB6053CEBECB5A9C30557FAFB6E7E8A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20251014082330.2936489-1-sowmiya.s@intel.com>
 <20251014082330.2936489-2-sowmiya.s@intel.com>
In-Reply-To: <20251014082330.2936489-2-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DS0PR11MB7766:EE_
x-ms-office365-filtering-correlation-id: c528233e-a609-4f8f-ab73-08de0bdb9f44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?S6qicnt6lLMA46ThCYbCsVJqv4I6DONsDy8wDbEU3qvotUkHV1WAcJz9hl76?=
 =?us-ascii?Q?y5yMiVZpL/pP8PKU/DmSv1bRC8Ck1xEEXtlT5UcS/vfT5OUml2W6nEnJcHKR?=
 =?us-ascii?Q?dvs4Y5S4lbMYpHgD8N3FjgN3ijUTMXeMntot0MEZPagqhJpO8U9gf5ezQr9U?=
 =?us-ascii?Q?uWdrhEFPGHajJ8SpSAbYYdRmJJb90mXeToVoax9D+kRParkahVzBynMyempW?=
 =?us-ascii?Q?yfln19PS9OSo/sidfh8yxThCqAtBru0xiVYvMp0wjILeckj6VpfoTMuSY6Zj?=
 =?us-ascii?Q?i88vNdbhwAhl9Q8Eg0X/yheDWEyAtDVJHMpvmkXnclaUnMMKdo0N9lUWhmEv?=
 =?us-ascii?Q?J628URzJtaSK9Mz/qeF2v/27kVstewZsTpgQhsz0qgIiDrKfWtyRRpX5NW1e?=
 =?us-ascii?Q?dYeBKUbKmQ+BhwuW4c4GTk/bXtZQVnu8B+m/QJDTAPgh/d0+h3cSnJZc9v8a?=
 =?us-ascii?Q?Wf9Rh98Pv66j5ytxDh+wADPhcrBahd5WpRyVezNay2lt7fLCzRTjC+pmxAiV?=
 =?us-ascii?Q?8xZ+rWbRM0WcBMPZkNKtxA1fL1vdEa+SaXAmX1zIm2zjEuWC7pkI8hto9t6X?=
 =?us-ascii?Q?ktcldodVWNSdNFtnJjo6sKeTrc+2YzVTlyXB/soiYwOgGzNGgnHZ1OCECI5U?=
 =?us-ascii?Q?LKhCY5B9881OWa0D1UcHbJr+dJeScJfLtD2oUxBFK1ONsh8ZjLs+k1atbUQq?=
 =?us-ascii?Q?QNZ4otgdUCVsCSQi5IRhyj4ahu/3Bnt+Lyvqn5gb1Fm79bvI3RewSKjTAf4h?=
 =?us-ascii?Q?qk0A6yE0OrJkCQbk/ishHN9foPE/for6bCnce2ihYVmUP2NPp98RPMe7WEkR?=
 =?us-ascii?Q?tjqkQz6iJmWhN4yUU6K6lnx5Zop9oB33KLuXEVZgQs5ZBNfU5YSRyO+T48gL?=
 =?us-ascii?Q?CwNZ0TkaodHv0mGilmq3+eyxTi3icguza7LvT9upFMUipYKn/AIqKCJl2fs9?=
 =?us-ascii?Q?Qo6zqxzh2rFqRniWtkVARkfzzyXRrZ6jKdwkbXhIHNTmJcH/RDs0PPbl1oIJ?=
 =?us-ascii?Q?D226KdbFwPRGv11ZiV9OI6KG+PitIof4HIyqLMBTSXBjx1lchPmz56Obr3ge?=
 =?us-ascii?Q?T+Y/2AhldBuHzZpLM0LAOsDnwElsNKzo0ayD98T3d4kjjuaURAaLWLB0z3Yg?=
 =?us-ascii?Q?Bg9y4Y7TGOS184wVEOs+QnOisiAiM8LRkizML75DPnUWohL90NUIt47qx8GP?=
 =?us-ascii?Q?WXanSgOaNfKVtoNTXcEja2TtdxzE3ST64JB1l9NBa0mDdYfT2qEtO8ZZg423?=
 =?us-ascii?Q?SWffAb+Q7mNqYZJ8lSz4CRy1zkL6VGP2f/nOoNMXT2GdXA2RGBCOnTs2Gh9o?=
 =?us-ascii?Q?0LztngNoTWwqWyQKkR3J/TyNTWYFIY/Pisym6S9WmdhLO7xkKfvU6NU50S2W?=
 =?us-ascii?Q?hM3ZyJBJeY+Z+G6Axhl0odu2eXOeA4u8KsfV5yJOZd2fCWZ2ucplQru6XrAU?=
 =?us-ascii?Q?wU3wmR3AEUr+xYWZtugy0Bz2Mmhg+8yGYVsD42MdAZKKiA+p8V6uplo6+UF9?=
 =?us-ascii?Q?hT7NQn75rELb8zVFGzO8fh+X1UrS0EL6AJBZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xKFxrsarwo5gAwPCJDfp3jxqxb6HKQxphFR1zZdEI9lGPHVFghuAjaqdzaGl?=
 =?us-ascii?Q?OZxuWX1ajh4tfUoX+BakVfkUeMdCq15GyaTia5iDfOp0PEHS6hYqh2jsMrtI?=
 =?us-ascii?Q?wJwK4eg+ev06jtMxQ+cZpnZaruJhPCkCZOi4QdQxfNjEUHcNRuoKRcsESAKJ?=
 =?us-ascii?Q?P2K2zWpKGUrr2FTyaSxJMPQVLb6cZNxo0rabH/mCnklChnBXLzGBagcR/otW?=
 =?us-ascii?Q?MeTnoDL0cjFctuXvAYc5pIoWud+nxXVnxBscOcwh4XBJvDcncSUK9rHVuGRx?=
 =?us-ascii?Q?0/t3BSdJIIshq+7F/GQEUVPDQPR27ClMupFtPsLTjCrOJ1FuEoRrHhItivnt?=
 =?us-ascii?Q?Ge9sVHS26n3sw4NpKaFoUfscCvWuNnV1W457nsQ6S2wzHlr9OPTrRwcBtMiR?=
 =?us-ascii?Q?UXl25oLN4uF+eDAVmYLHXezFsOA0QBh2LxxSnRPymAe482wpvy6kcJsd/jvI?=
 =?us-ascii?Q?Yw/0p7Rw00L2eFBLUkEWItqpsLxDc2GPdqYVCHanEeZYOz+OTdevbq5vnOLe?=
 =?us-ascii?Q?/PXN3KJz0l2ZzrNfRv67UjbTrruintIr7Ospdtms3ctdTuTReCIo4UlsfXb8?=
 =?us-ascii?Q?vpmUlAfWhdHmnkO4J4A4qrxyuMiNY3BhAsr68tQHA6iC5DTVVrU0A26evBln?=
 =?us-ascii?Q?unBrqM+bDEmq4gRmEPAWFjQSjZQGg1rPY1LildXM+TpjEVbzedqxhb6fNjLM?=
 =?us-ascii?Q?WGlXfgBWBMVy58uBs/0mXQtvN2hfp0yqs3xcn9Pll+1SCvWdJE7TggS9SJOj?=
 =?us-ascii?Q?eClHq5vbh6fo2R5W0z7zLybxGIyuPoBa2sYPsuplj8SXUvVDlzKsAKr2nG/D?=
 =?us-ascii?Q?49Kvr1hfLJ7UOy+/PQiljVJKSn8NZ5J0RqL+AhuCYoORiAZZS+DA9w7VBi1d?=
 =?us-ascii?Q?Fuaj1i57vacs6lo6SppLTk/G/j8WkufNe1M4T76n054XhAh9vzNWUt2qSwrY?=
 =?us-ascii?Q?vwBXxC5LpQNRCSQxwrtCd5fwP/6HIphcIyyRepBB2MbJHaM2IxIyyB/RpDOX?=
 =?us-ascii?Q?iPPcj5YBupdyBYHUd46i4cxaJC8eBkTJuZ/DWVE3YN8Ziy120xoTT4UJ/n41?=
 =?us-ascii?Q?Jt6iYLxTOfzcqtxIRnPBf1gnq/tXSypVRYLL60WzFS1rlwvEsWXINzPU/f2N?=
 =?us-ascii?Q?K3qgbLYDR0pOxtu1K7MeKQNPcvsDNDLn2qSZPHaUraI8VrldFChs48urSZni?=
 =?us-ascii?Q?5NVMzYZcfQfE/bsxhZd+14ygvfXNSOeFFBYSDpQzE05xHEJP+DdxnDp5fX89?=
 =?us-ascii?Q?NotyxFueJxjv7glnSkKS37dcGfGY6NJ0Qqfh2x3MuYKEqpt6SL4gbF7kPg4c?=
 =?us-ascii?Q?833ZihusLxVEEYmbaFuWNMcTLMXePEVKO6KQyheM3+rRxU4Tspkhs9tYNdNr?=
 =?us-ascii?Q?T+WaNGn7tLSSNHxyhKmNdQUIsYiaS7k6e2dKER/cHvrQjHJwCrrccl0+5WMS?=
 =?us-ascii?Q?AmYVRXuGyHxtVDnE5YW/gLg0VFkwfrigozcG5MxunLnPkXe/2V5ALz+j7ydF?=
 =?us-ascii?Q?VXbyh6pvS6JYvhgWrKG6nRbbv7HGW+62RW7pbYeBkJIQE1oFH92SxvYTcDqC?=
 =?us-ascii?Q?WEqgg/+xIsiggJ/gT9/yKlmkf7cwYuHDrB6ruQ9K?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c528233e-a609-4f8f-ab73-08de0bdb9f44
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 11:11:43.0399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lDobnbNqItO5L/GZhg31gE5dSHMkVfZL6IZ3DgxiROSBLsydSgQhns5GQDfhH0RCENeoVxT0OI2VOFTbJL1jxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7766
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

Hi Sowmiya,

> -----Original Message-----
> From: S, Sowmiya <sowmiya.s@intel.com>
> Sent: Tuesday, October 14, 2025 1:53 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v1 1/2] tests/kms_cursor_legacy: Change debug mask =
to
> reduce log
>=20
> Set log level to low for subtests that fail due to disk limit exceeded
Imho, The message conveys the intent but could be more concise, e.g.,
"Reduce log level for subtests failing due to disk limit exceeded errors."

>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_cursor_legacy.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c index
> ed1c77d55..3eafc0e30 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -2061,6 +2061,7 @@ igt_main
>=20
>  		for (i =3D 0; i <=3D flip_test_last; i++) {
>  			int j;
> +			int flag =3D 0;
Imho, the current use of flag works as intended, but replacing it with=20
a bool type would improve code clarity and express intent more clearly.
>=20
>  			igt_subtest_f("cursor-vs-flip-%s", modes[i])
>  				cursor_vs_flip(&display, i, 50);
> @@ -2069,9 +2070,22 @@ igt_main
>  				flip_vs_cursor(&display, i, 150);
>=20
>  			for (j =3D 0; j < ARRAY_SIZE(tests); j++) {
> -				igt_subtest_f("%s-%s", tests[j].name, modes[i])
> +				igt_subtest_f("%s-%s", tests[j].name, modes[i])
> {
> +					if (strstr(tests[j].name, "flipA") &&
And what about flipB subtests?
Aren't those hitting disk usage limit issue?

> +					    strstr(modes[i], "atomic-transitions")
> &&
> +
> 	igt_get_connected_output_count(&display) > 2) {
> +						flag =3D 1;
> +
> 	update_debug_mask_if_ci(DRM_UT_DRIVER);
> +					}
> +
>  					flip(&display, tests[j].cursor_pipe,
>  					     tests[j].flip_pipe, tests[j].timeout, i);
> +
> +					if (flag =3D=3D 1) {
> +
> 	update_debug_mask_if_ci(DRM_UT_KMS);
> +						flag =3D 0;
The disk limit exceed issue is only on CI machine and executions are done v=
ia igt_runner.=20
So even if you update debug log here, it will anyhow call exit handler afte=
r the end of subtest.   =20
I don't think it's necessary to update the DRM debug mask again.
Correct me if I am wrong.

Regards,
Pranay
> +					}
> +				}
>  			}
>  		}
>  	}
> --
> 2.43.0

