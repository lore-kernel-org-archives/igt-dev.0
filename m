Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA09CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 18:08:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D01910E2D8;
	Mon, 10 Nov 2025 18:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8UKvLJA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7C810E2D8
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 18:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762798095; x=1794334095;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HaCr6JWHU3Ln9uJoOkYbe6X2JepI/rIobVmbT+T//xE=;
 b=F8UKvLJAnL0VkZ40QJJHga6wBoMJIlUI10daC+whxa9Z0VMiZUSnBFQO
 IJkLKpyaSdccNUZdbRdqoK8AcBTJdoqmu3XT6PmxcFEHNFcMj4ZCIfaNW
 uObQbzI3xk1DVl197W3GWzaW87w6lQiIJMEcdMX6zj4v28hl0rdAWwcC+
 irKduQIkurYkYDbYgA3vH4jP4OaurJHpsqXB8Gk1GR63mzHX3n7KSEG2O
 X374+GwmH5VW01soqHbbC1xcd+sziWfhrr8LMzM5+z7+o/8xa+C4hToQl
 OYeRNW43F74vrJ+IqlWBjXvdcDag7972S1P1pZRHkzTf0dtW5sXq8++x9 w==;
X-CSE-ConnectionGUID: J+kTdo+nSxK7WSfIGJfkzA==
X-CSE-MsgGUID: RCIqvRaeTEGx1zA5zmDQag==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64889020"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64889020"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:07:58 -0800
X-CSE-ConnectionGUID: Mm8nWgb0Sa60a+4jpKbMcw==
X-CSE-MsgGUID: ttj7fmhjQdCxl3HpA9ZapQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189179505"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:07:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 10:07:57 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 10:07:57 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 10:07:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUd6hcP1MOXXC6yan2mKAtxn8k31Bx0Ci/OA0VpYHiQDLUIB4B/9E/NC1TBuR9fEwuJkdPQlA6eNJU8VJKpe8yZDSvHtGpbkGywwZhcfNVNCFnXRSdGayUmYSNF9znyqTneBtXevUc9LUWTbsVE6u72grCGBQMHgX/jkvHjyrXd+XFgRlZCnZu3GTTf3nK3SQ0fIlfKzqd/Tojb6k7rYs/pLDmEuYhDD2m+i7AdP5h5R41hpqHbsbtSYiqr3xSs63tI62MjVcH07tgYEHoIH6s4motea1liabJKvYqXpMolsZZLnKoXHeObh4olSQ19smb1PsPXRnbEqA+DfrfGiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P35kcV9rbQC42XJR8HRVJA1nTVZt9KBeV69X3kL6NlE=;
 b=yE0udSg1z4fZl95cqRtUY+scRpd6ixLBLMRVnKo+bUGuIemlBciBxVlPzbuJ/lBzREHabKPeKa2HGIkXBlTDLvhHhsmJxzh7RyAq41mBGd5MWnRDiA5HhEJZYw/j4VVSFVG0tWOQWuQOgoH9HugKlpEN2hLOzdhSs6A3rGSwlQLrElokeRQ/dofPHMx62zXvMa7HXFyJEiLo4D5HWTURJwT5z6rlWWRFtxT/cMKadZLqP45STS6xtOmT/cqahYKItkLglsTBNWSqY88TR3CLxuUMe1UmNL4yY1QmPz0ltgX5XoSNgDaSfWZoUKUeCMiuosn+FTIEDB1gOdOAmVEshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by DM4PR11MB6501.namprd11.prod.outlook.com (2603:10b6:8:88::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Mon, 10 Nov 2025 18:07:54 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 18:07:54 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 18/18] tests/xe_exec_multi_queue: Keep group active in
 exec-sanity
Thread-Topic: [PATCH 18/18] tests/xe_exec_multi_queue: Keep group active in
 exec-sanity
Thread-Index: AQHcSpVJ+cODJWdH30ewrB7Yd0UR57TsQgyA
Date: Mon, 10 Nov 2025 18:07:54 +0000
Message-ID: <BL3PR11MB57473AA0BE167BD7ECD0B86AD0CEA@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-19-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251031183555.1882721-19-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|DM4PR11MB6501:EE_
x-ms-office365-filtering-correlation-id: 04eec029-7f92-40fe-72be-08de20841236
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?9OWZlkllU0N/xO1F/hX+2jvc9fBJ5UZevpGCRVfOaoe8qP3kTvUNq7J9E8zU?=
 =?us-ascii?Q?uLmFc78kCELcxiKKtvmVeeFAtwmVv4vZBDWchdcOqEwvtljbXhtT+8s9bNcN?=
 =?us-ascii?Q?GRcLzjd7usygVTthkBshC9ZyuOJt4Dq9WZGCyDzbjuFRDtSLhJbir4ZhckM5?=
 =?us-ascii?Q?ozpDhrpjW4kim6654J6zuyQn/2DtfP6QZF24YeVcXtcz8MQyXyDwoNLy4kmn?=
 =?us-ascii?Q?UPXfnzG64tF8KOngndlpB/akQKtAAyVGWisA3Q8Ax7ESncQNpvQNR2X9T69N?=
 =?us-ascii?Q?9vJDJ970uhEraxftQJF1SAg1wANWhmYrD5njra9aSHBSrjJKIAdCwiY0IJOX?=
 =?us-ascii?Q?dI7BUDfINkGCmCONeiuMMXE9D6Uw/uhYpJikXxLohmNBMzfzfOBktCYX5WM9?=
 =?us-ascii?Q?sAY8liXu1agMW+m+4MT2/L1CeY72PIJBoeY/WbN90hr4tqEQSOrNgccfq8Ke?=
 =?us-ascii?Q?Z7iLysI8jh7miSOseuhZtoqXUrez8y+a3motSEsBQtaORfm2uwAAGVOuSpPa?=
 =?us-ascii?Q?9n3I3thHsT9+2gHhKfyeD9oDgsdCIZhkrjE+hcJoJC01vqckCSl7qbFb0vOC?=
 =?us-ascii?Q?APqDfdTV2I9LDDcGLAC1YE7ajyd4mAqcm0l7mzpD/1f0oG4cpUT4EZvGiNG7?=
 =?us-ascii?Q?G1PPdUGs71uHtCen5XHnBJwRKDqKOSJqTVeew+7JNfD914/W4LjYXdMlFeje?=
 =?us-ascii?Q?hzBPVNqy9ru1Us877mpx3Ov2YqFjvmv8Z9gB52J+JDG0dp65l9iZU3mhahsJ?=
 =?us-ascii?Q?pKDioezSDSRAOc7L4QZdaezFwj3ASB83T/luWdSN0d0dBX6HYviT5LpYaaUT?=
 =?us-ascii?Q?q7mOiWXUxFwj5q0+N64ASozm/KHtFR7rW/N5DmpPlZxZaxHBE424O5iWlq/s?=
 =?us-ascii?Q?Ew7Qz0qBdZSF1ujl1MLBnEKPbN9ybbovckteGBuW2OqFy9TbTDtDnvx5QgBP?=
 =?us-ascii?Q?jY6uEN2xbe6bkEnzCOxRARAGJ84VwuCfoMH4sP7hnkwJ9buht6MymaMeNgDS?=
 =?us-ascii?Q?WiTSVJSTeXSO6P9eOmFpKPQwms+EziL+MUCY5B90kgCtDk43RlbyQzxcH1C1?=
 =?us-ascii?Q?371yjc0+pXDCwoA/oe+4qkMJ3s0iwQAXAxnP8w1UuW++m0hN7TT2xLBlhdbR?=
 =?us-ascii?Q?Z7DdQahx5c4jn3IsZbzpo7AESL5xnScp8DyvrSiSPV9pflGLmz7yd+tVNqkz?=
 =?us-ascii?Q?qd3s2TFf19lcVguXz+qS6PIUu/wb3pyVPyqYDavQ4CdTQ5tdiNr/c3sY+rKr?=
 =?us-ascii?Q?0jvlV1I9QnyMwERKjZxdV+QyLPhGsojEryZL8lsfH+c5fT/9b/+oO3db2gzH?=
 =?us-ascii?Q?2g1TO+xOkTr0BdHfj7x5k5mc7RL+fv8dMxJP1SV3IT/bJzdvM7ne2GTovQof?=
 =?us-ascii?Q?tPcaQtUTfeWnTBI57PzBR8vUOKxCycGDHE54bXhXE/hHeirHuJ4V/Dly/Nzs?=
 =?us-ascii?Q?henYHbjQqMt6E9gDf/bEcBRy/RsaE4lhf2TzqoxRU/EM4CbSiRMnUUv297gy?=
 =?us-ascii?Q?CSXEmVluOT7fE8af/PfEJuChzRbnK/mixZPU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?okuJxY4s0D67YDc8EchzyqjPu3gNIlgul5/C4qyEjXlZnddQ9McL0sh1PkB0?=
 =?us-ascii?Q?sCYPNLMxujte3d8cSmd1a+GKyxfU95grSJwJY72PGUqnwoTWfMvr+nlaLP6l?=
 =?us-ascii?Q?ABmq5EYVV1kLi9wVcRUGKkuT3pI/yAdrx9hpVMqIWU7DrTp+3NirV9/DyNN4?=
 =?us-ascii?Q?NwdUQGlVb4GWwds2cxZnp4lBBz/l+VkwoxoxdJJ5f/Bl1D01lvjQIg7sdotV?=
 =?us-ascii?Q?ZivZXmjoDj0agrv1IzMuP9w57NCdCTm6yaHFNLsEMe2Y+K0Mv0Np9AzPSz1r?=
 =?us-ascii?Q?nO9vxaqsgGUh/GHFzu/6VDgx721K8akL0BL4WxSVdjMgbH3pDKJr6nMp72eV?=
 =?us-ascii?Q?0QuynGoEdzYGwgeVF2CMtnDC7cBMCyFsv7DnHGThgkVkdyacoS+GSNCYVNrD?=
 =?us-ascii?Q?cJuCGf+iKu2T1GBNtWU361MkydrP1r3mYm5WaRZwxPUmF/sHAjR/Ccvgrgg9?=
 =?us-ascii?Q?itFe3bhnw9W1O8Ck0khsHjcSJ6eUAv0aMjNY/NG8xpnSBsVVZkMzXc1yUq/v?=
 =?us-ascii?Q?FqWBe1XbxtY68xnhF92TxWQSmI9BREoPFW74eVOQr/mjfbwgxDPB3dmmHUWX?=
 =?us-ascii?Q?Ubb7pcRdYZ7YEXZ5Te1gnTC9/5IAMBivX8ufCnIniyyEFTpGkwlv9cXz15Xe?=
 =?us-ascii?Q?H15yKJXQPgE3UqVJOsZPdLQBxc5OnpPp2jvwI2OVVkHRpRe79Lkt7yLGqT7h?=
 =?us-ascii?Q?6KnsP8k/jAY/foVLTcHkIQtiMBN976SLIZCEvm+tc/BCugYCdx4Qo9z7aiQK?=
 =?us-ascii?Q?RhHXybHaZnyveKLKyVqC6oa+pWs5P1SrYF14944DeySbx7DIKh5Kew58tbNL?=
 =?us-ascii?Q?SV/4GH2pyz1b6dNkosQZxcHkzVPezxodDpb936RMVLXpDqKYeVvzlCwoMU1t?=
 =?us-ascii?Q?o3s37LDN65czWjfcNbfKpRqJsTmMuxskUgH8lGDBRWmgu0GdAIDAbLtGhsnD?=
 =?us-ascii?Q?lTdJxtHfMyxNlVVyqSnwadi31EF6XOqWVM9SwygZZ14YC27Dj9jZT+o1DXqS?=
 =?us-ascii?Q?e2tT7m5mkJg1pkNbglu8vy3cS2hmsDCI4neSTBMraicON9X3HjHOUwKKySq0?=
 =?us-ascii?Q?pQKTOzs3jQRcOc+XO8DqC1zaV/5iNiUO7bCLm4++n05Ltd17fgZaB/jJMa1q?=
 =?us-ascii?Q?yJbClerziRfAFToPN8X6k6v7Scat38VNX9qv6VflWOyU/1WqsmbO//Sin4Y0?=
 =?us-ascii?Q?Yk2mIwm/pUFhWp3WBI5PFPXQmok4vjkbaupZCBDgeXAcy8hCWf7Xa5f6bXi0?=
 =?us-ascii?Q?ek/soxeksmq4qAB39EY6UWehI8O6keoF0LWq17R5XEpiR9QSV8htDSh7CfNJ?=
 =?us-ascii?Q?8ldGUN9tF5Dk1Scp+4Q75ansL5PN5Y+GS26omWxXpUAL7qD4lA4wbYdvUgFA?=
 =?us-ascii?Q?9TcPx/EOjyV3qSkyxstoEV/62fVMX5o2D4l5fiead/Vxpk7RgSZF7jeIb+h9?=
 =?us-ascii?Q?9K6Yd6scsV76azyEPtRGpZPuCrIIk+UNnnhsC9VTDeJZGK8V4WniokFxMy29?=
 =?us-ascii?Q?x+3DrwKKKsFq5HpXpUxRQ5YDdXhc0hvTKsCYr6R7wLKHxmZngd2hcEFfiFTN?=
 =?us-ascii?Q?+GIv8GjrXAnlqZ2mThsUC6hNioh82J2iZCLfMEre?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04eec029-7f92-40fe-72be-08de20841236
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 18:07:54.6241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r0ab71wt1MYmCUoRWW6FM+HPj5TJ/1LXrafiIzPbgKdRynQcXVxmsj2lbgJSHDFAgOQed9bmCCRwQVhtL8GtdQRJr/RDFMLRCNcHGdfL0Lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6501
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

Hi Niranjana,

Please find my comments below,

>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Niranja=
na
>Vishwanathapura
>Sent: Saturday, November 1, 2025 12:06 AM
>To: igt-dev@lists.freedesktop.org
>Subject: [PATCH 18/18] tests/xe_exec_multi_queue: Keep group active in exe=
c-
>sanity
>
>In exec-sanity subtest, validate that job can be submitted on secondary qu=
eue
>after closing the primary queue if the user specifies the KEEP_ACTIVE flag=
 while
>creating the group.
>
>Signed-off-by: Niranjana Vishwanathapura
><niranjana.vishwanathapura@intel.com>
>---
> tests/intel/xe_exec_multi_queue.c | 26 +++++++++++++++++++++++---
> 1 file changed, 23 insertions(+), 3 deletions(-)
>
>diff --git a/tests/intel/xe_exec_multi_queue.c
>b/tests/intel/xe_exec_multi_queue.c
>index ee2b92293..bdd9851bb 100644
>--- a/tests/intel/xe_exec_multi_queue.c
>+++ b/tests/intel/xe_exec_multi_queue.c
>@@ -268,6 +268,7 @@ __test_exec_sanity(int fd, struct
>drm_xe_engine_class_instance *eci, unsigned in
> 	};
> 	uint64_t ext =3D to_user_pointer(&multi_queue);
> 	bool preempt_mode =3D flags & PREEMPT_MODE;
>+	bool keep_active =3D flags & KEEP_ACTIVE;
> 	int i;
>
> 	sync.flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
>@@ -279,9 +280,13 @@ __test_exec_sanity(int fd, struct
>drm_xe_engine_class_instance *eci, unsigned in
> 		sync.handle =3D syncobj_create(fd, 0);
> 	}
>
>-	vm =3D xe_vm_create(fd, preempt_mode ?
>DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>+	vm =3D xe_vm_create(fd, preempt_mode ?
>DRM_XE_VM_CREATE_FLAG_LR_MODE |
>+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
> 	bo_size =3D xe_bb_size(fd, sizeof(struct xe_spin));
>
>+	if (keep_active)
>+		multi_queue.value |=3D DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
>+
> 	for (i =3D 0; i < NUM_QUEUES; i++) {
> 		bo[i] =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>eci[0].gt_id),
>
>DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>@@ -328,14 +333,27 @@ __test_exec_sanity(int fd, struct
>drm_xe_engine_class_instance *eci, unsigned in
> 	/* Destroy primary queue */
> 	xe_exec_queue_destroy(fd, exec_queues[0]);
>
>-	/* Validate submission on secondary queues fail after destroying the
>primary */
>+	/* Validate submission on secondary queues after destroying the
>+primary */
> 	xe_spin_init_opts(spin[1], .addr =3D addr[1]);
> 	if (preempt_mode)
> 		sync.addr =3D addr[1] + (char *)&spin[1]->exec_sync - (char
>*)spin[1];
>
> 	exec.exec_queue_id =3D exec_queues[1];
> 	exec.address =3D addr[1];
>-	igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
>+
>+	if (keep_active) {
>+		xe_exec(fd, &exec);
>+		xe_spin_wait_started(spin[1]);
>+		xe_spin_end(spin[1]);
>+		if (preempt_mode) {
>+			xe_wait_ufence(fd, &spin[1]->exec_sync,
>USER_FENCE_VALUE, exec_queues[1], fence_timeout);
>+		} else {
>+			igt_assert(syncobj_wait(fd, &sync.handle, 1,
>INT64_MAX, 0, NULL));
>+			syncobj_reset(fd, &sync.handle, 1);
>+		}
Same as my previous comments, sync handling logic is duplicated in several =
places=20
we can move sync mechanism to a helper function.

>+	} else {
>+		igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
>+	}
>
> 	if (preempt_mode)
> 		sync.addr =3D to_user_pointer(&vm_sync); @@ -375,6 +393,8
>@@ test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci)  {
> 	__test_exec_sanity(fd, eci, 0);
> 	__test_exec_sanity(fd, eci, PREEMPT_MODE);
>+	__test_exec_sanity(fd, eci, KEEP_ACTIVE);
>+	__test_exec_sanity(fd, eci, PREEMPT_MODE | KEEP_ACTIVE);
Why not move them to a separate subtests ?=20

Rest of the code looks good to me.=20

--
Sai Gowtham Ch
> }
>
> static void
>--
>2.43.0

