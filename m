Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C28C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 14:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DA510E648;
	Wed, 31 Jul 2024 14:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSKC9w4c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC2810E648
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 14:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722437974; x=1753973974;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iiDQR4D4WFy1AhyP91Sg6D8D+ObssFr8dUAYKEhrsFM=;
 b=SSKC9w4cpzN8VvaB9gAxqRDXg+ZhICSr4J4K/QSUWGO1nSS4gKra1GS5
 YjCETt3NSohfA8SDpys7GzZQMH/e2KxBw8jxXvPHZ6M6QOUO6XCDsG2vb
 cfnhnDItpQFgaxBa2DvHTderJk5FL9rUXw1DQUjLJe27PmRtOFOZV/ONf
 ffc4k4K9bjATW9/KX4Fu1Yp3OJCqM4KWn++WqZMBAgpdYiGmubnmPUP5s
 VlLZmPz3wVHk+hx2IcjvFiOoq0cXK+12UD3VMJ/KNmYHi++lHawKu11Pk
 AT61zVWrS3beDKSL0nszc4jzLRJUEPdARluXH/fjSirNVcp9cysKxGK84 Q==;
X-CSE-ConnectionGUID: 1gMev4rPQ/mOtWiGbySjEw==
X-CSE-MsgGUID: cyZ//buaR3yyywhNle8dow==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="23240221"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="23240221"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:59:33 -0700
X-CSE-ConnectionGUID: P7xZ/K3mQMispzb9e4XxIw==
X-CSE-MsgGUID: pc1LRiDJSXOHycURx2ruFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54682917"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 07:59:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 07:59:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 07:59:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 07:59:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 07:59:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKIJLu++nNSzpIxIGTC2yYKztn7At70dTHc49Ydlhl2mtbKy/CBpk0eeGVd24vFhMRBzgQaLk6sW07ZcjTeFTgtN3SWiXi8s4MPG1eJFpCMjf5/aVkpDLwg2OmVPKGyEzpc3PT3wHnfKSbc0siqo7Iafb2H3G6PM8yQrCErmmPhYT9HXqvapyYmx09CRq+wLyhLtDzYZMtu690WG7QcVtFa7oVrXAge7JOZA8jo03BMFA/w+kR1DgaBmLGMZVabmc3Wa6d+GVHmDma7URl7J2SB1FbKyb67GjWh1AEiXLI0FI6HbQUy1s4gofblI4pRh5x3WvJee1Re5TGglLZ3FCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaEXnkDkXYPEi80uk/nDhiIjZkxqLoQvqGMQeSsQBSc=;
 b=wfDt3jt2MtGwV/l0JhrFhc6k4fJ5qqpHe6kMXIjecoDrkQXW6WT+ZN/H+TnhTJ5KLb7m4uOqddNTia6l2TbME2Cc8tbykoZqysueSfziimgZ9AComsEKf8oehIOoEa15o662WA5KFyzNJpgLQ4i0bgSr9fmym+niTDaEWe/0i+lb3LDiE9F0s8v57R2g4XqdJV5CLZJrqIKVYS696bhe2H0PEpc+c52vP/5FyHoAV5XF2SAMChiKkROfsDKjyGrkwkUOIVK3vrSmQFs6y6YhyeAa/0LQubeFzfAqCaPrTscyoXqQ4JU9Z93LaGt+h8f+Ys1IdwI3dVyn9TDNvsFg5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ2PR11MB7597.namprd11.prod.outlook.com (2603:10b6:a03:4c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 14:59:29 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 14:59:29 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Manna, Animesh" <animesh.manna@intel.com>,
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH i-g-t 1/3] tests/intel/xe_drm_fdinfo: Add
 basic-engine-utilization test
Thread-Topic: [PATCH i-g-t 1/3] tests/intel/xe_drm_fdinfo: Add
 basic-engine-utilization test
Thread-Index: AQHa41lO3XQRFGpuBkuR2M+X/ZLPkrIQ7a4Q
Date: Wed, 31 Jul 2024 14:59:29 +0000
Message-ID: <DM4PR11MB631206B17AC8A1622E4B548090B12@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240731150252.2951870-1-jeevan.b@intel.com>
 <20240731150252.2951870-2-jeevan.b@intel.com>
In-Reply-To: <20240731150252.2951870-2-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ2PR11MB7597:EE_
x-ms-office365-filtering-correlation-id: 12092cfc-bc83-4c79-6416-08dcb17160b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?v8+cpikHyD1lXt2qIxMirFkv9XAuGfb6DWq3bvob1NXmTqT201Jcvg1O1+OY?=
 =?us-ascii?Q?BcqeqYVTQBPArJ9bDaMP096guLJcw0Ok45vgrEw8gwLi376vRb4nVz7zH068?=
 =?us-ascii?Q?cBmCigQJLOLGtGS9/NtUoF401Axpm9jm1WsHQ0P475zpgH/pKqU4AzUiBm1I?=
 =?us-ascii?Q?qicIioX91jybXH8A1PWpyC7QJIbZ+eNh2FHdUyEFWexyvFV27R673FuN3nGW?=
 =?us-ascii?Q?ZD0QK7d96pjRXtIqE0Rw/9q4EyAAiBwBFxK49oiGJAsRdzl0NW84+QTeSL//?=
 =?us-ascii?Q?R0Ln7ERDkrT00sm/XUtE7BB/CyOA0C7HJHhTSwIeE6F5v5CKO1fatekMoKf9?=
 =?us-ascii?Q?XUk692Wo6k2l5sOwxBVO7TCqI/Q1jah6bx4EjWtC4GYY1VgDQ3ZaSGcCTEbP?=
 =?us-ascii?Q?jTJB01TUfKfythB9kfpKyHqsu51xj8Hm8Y5yEcysTTYGwE50JgarUWrxkTLd?=
 =?us-ascii?Q?CDbmoiJvWacOBjiuFNkDQcCB60VXo55B2Q4IFL2Gv5hmyLq/i2uzo4h4jTKZ?=
 =?us-ascii?Q?iS3pzdshhklWOHWjppipYL5GOjftAABm/8Acjq34iRW2WVW0w+8gBpMbfSON?=
 =?us-ascii?Q?Wu9cF5tJR5/K1QqZP5mjG5D/V9bDh/aAa8/9CyfqOorxXyMFySLi/8kYBEKN?=
 =?us-ascii?Q?FsoQWxDnh2f9F3MMGKkcimFvxve9NdDCYNw6+x2Nlxrc2iFOQjQPB09O8Y+Z?=
 =?us-ascii?Q?7zbsQWJca6YAGK5rCJRWcRjBOSNGniiogdtGCq2Bi1V45bx4A8msk46BmSvd?=
 =?us-ascii?Q?zD/93QtR3u9mJQ2YOfBaCGDXPDND58ZUIyZeGL3wMAmgQUxrC8LaUNmeM9iG?=
 =?us-ascii?Q?yNDhEQOommFtcwCfvDZLGo9aydh8cFn5L/AyZdFTx6/IX/khYl2pQONwyoxM?=
 =?us-ascii?Q?O+83b0FBz823qf9d2XvPsqlDyf1/PaA9ihe7ZZRpUMnGaphEEc7soSiz8XTX?=
 =?us-ascii?Q?uGOJoHPuvbZu9fEGC9xTwEvw8P1tBXHQy85/W9RPMb+0qnwf9qXLd0gth5N0?=
 =?us-ascii?Q?fB5dtpDEqN+ZXTyXwoVbHaaN41Y69jNdHC3/lTK8jFjIS+yvCc41jjhJcm2X?=
 =?us-ascii?Q?g4dJJy/yXxJIt6Ba+YD/vFB06qqX5mI5jQBtAzvg5QE9iO4KGov+UGOirmgj?=
 =?us-ascii?Q?uatnwZ87sxtPzRJ4v+UrERfl9/c8x2shQ5ImXuOuLZ3vNoDfKwYd2anvUc5B?=
 =?us-ascii?Q?42XxQYf5l/qY5d9F3FJ/rlL3f9IyfIjc1lv1cbqy/bk3f/uSk+XZWzJ1ZmFW?=
 =?us-ascii?Q?9q5P3DQE7IBe0T+C/RAC9DFozKBKZ+BKkB8XNhKgS8ziZmTcDOpJlbE6lgLA?=
 =?us-ascii?Q?ujIdfmhFvut8P+j8bphLsljL8a62M4Bka3CTSjneze1TIrE+zr/pe2rkJqU0?=
 =?us-ascii?Q?4mp+RTA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?appEV358ScvNADUMyPZgc7WGhUw4qLdrBvy12DZ7aLKSUEjGj6SoJLSfo46R?=
 =?us-ascii?Q?UWqzPRSW9/xWvM/5uRoHwRDBW3DpKw1s39k3SMQZsUfAlcpFYIEB6a5gxnuL?=
 =?us-ascii?Q?RTKcy1uzV8T8A39de4Z7L6ugoRVDOvvhQxyy6EUMVEPbY1XsN0ZrTAo1DXwM?=
 =?us-ascii?Q?gt12dz1oFkzTkM2TOZgYkSkFyFWB5Mb0of/EsWZrZYGPQFgrOJrDMshP+K6s?=
 =?us-ascii?Q?LW3GOipOFbQyELxM0v1Cv2jbfW3Yc8TkFzaWG0HrJvFTMQhP+YjYnwkTIpRN?=
 =?us-ascii?Q?cSiShvcKOlOzlmbcGV89KxpTWz1fndhJlxgIWz7PpV6nrCd6fnjSRCB0pd42?=
 =?us-ascii?Q?teErTMdSO30lZg2xFfliMQ7Kb1EBG33IwkKV6lMA/Qny2Ks7dvdi3i1SnHZe?=
 =?us-ascii?Q?hUrUU0X9EDhn0HILIG+NQIeN+nANWRquT0nwaKnLhiIbwI5GAPdUJS1/6Iha?=
 =?us-ascii?Q?oOv/pUzeNtDAdv/Lm3POOXtqMpLzKQfN25NTEp5eu2dea3mXcQwo0TfqWSQe?=
 =?us-ascii?Q?ulYZHMRTiSHfVxSpJjdzvtRjsHbg8GxOvGHzqQXyq7OTXF+ec2RviKkbI6N0?=
 =?us-ascii?Q?BddW4bCTfKu53nEgfdCfg8g34ljh80TC446Tqh3Jzj7lIgnlII9JWJ1KMtXS?=
 =?us-ascii?Q?H5cINq+jnV8u0r9NMEusWKvaA3bJANuQ/o8YBb9WWzzz1XquJdn5cAzhsWmQ?=
 =?us-ascii?Q?zZtganKSwDxwaWuCSFD6AG/jI2OVo64gkwO+KizraEsQcynNQJw7rlCK1hSI?=
 =?us-ascii?Q?pOijgdjCpgUBDVJwRjDcnJsmwyDpucLXeRP22O0gsLot1EbCBOsGepgfk/pQ?=
 =?us-ascii?Q?riKAcFa9RH16MYJRbT+2zpNGWWIID5CosQF84L8dgUwed3xDwyKbrbOQ4KEP?=
 =?us-ascii?Q?NKQ7iLzl9MMgriOnSXKuIK6jzRP+a3kX7SSGM6oT6bbtXMQ6396y01J4uxtd?=
 =?us-ascii?Q?HzBZGiM/20bMc6bFx+/WNBzCt6GhpB/xfD3yFYTgxEUmFmhH2B78/8aV/ddq?=
 =?us-ascii?Q?HoGd7GXxLszzJTpI8UN3dwQ4DfUBdGaAFFpQJAzjd0QXPSZFcLHlMNVtoDcL?=
 =?us-ascii?Q?885lKLzxuIY2GkH9an6hg9QTZNwpcXBF96fgLTIvGHG4ZI+crzOy2RBx9ryY?=
 =?us-ascii?Q?EhOvFo3ANXCgzG7gFKTeRTqe0KK82IrsR1DVtfgye/nn1a1w13Fb7TFJNnBD?=
 =?us-ascii?Q?4MAvfouv3VIlOKwoKY2MkXKspGD1emPBKtHjYwjIt875ASMIJ6KBUcwTBFIw?=
 =?us-ascii?Q?TsLfIj4eX3CPHch4Pcsmhg+evYSzbQeUorW2gdE+DTc29p9mnTCxlg/jAbn1?=
 =?us-ascii?Q?Y48Ad+OudhOuCn9Vlo5VWht3LL2109jXopKG9ox+vHvBNGOVeJRO5/cNF4oJ?=
 =?us-ascii?Q?VjAsEHIg3gqNwZCe6HvRa897t0bDjucZmj9ekyoZDJgaVdaX23zZ7jKMRfWn?=
 =?us-ascii?Q?/MI9xDURDY4zz4FTVNY0mfNX2dbGvGYgPxrf8k7ALz+TWpdS3WLlpyKuuCH5?=
 =?us-ascii?Q?gnUrnw0qbY+h/gVLNbBQtFQGV5yg6859zE7WDBKISLEEWCcg7omYuK4lFG4+?=
 =?us-ascii?Q?V1ReLnjqa62vXjeZLXc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12092cfc-bc83-4c79-6416-08dcb17160b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 14:59:29.1174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WdkO7YeLZlq3cHjS/8YJctPQCRZRBLTJSD/3ZPQWwHzfzzdSfQkSBmoUXj/4BfUOdHBh9cE1rP1g1tB9nHGw5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7597
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

Please ignore. Floated by mistake.=20

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan=
 B
> Sent: Wednesday, July 31, 2024 8:33 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; Manna, Animesh <animesh.manna@intel.com>;
> Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; De Marchi,
> Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH i-g-t 1/3] tests/intel/xe_drm_fdinfo: Add basic-engine-ut=
ilization
> test
>=20
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>=20
> Add the basic test for engine utilization.
>=20
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Link: https://lore.kernel.org/r/20240703002532.3156277-3-
> umesh.nerlige.ramappa@intel.com
> ---
>  tests/intel/xe_drm_fdinfo.c | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c in=
dex
> f0aa23e2f..2f9661a0b 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -14,17 +14,20 @@
>  #include "xe/xe_spin.h"
>  /**
>   * TEST: xe drm fdinfo
> - * Description: Read and verify drm client memory consumption using fdin=
fo
> + * Description: Read and verify drm client memory consumption and
> + engine utilization using fdinfo
>   * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: driver
> - * Functionality: Per client memory statistics
> + * Functionality: Per client memory and engine utilization statistics
>   * Feature: SMI, core
>   * Test category: SysMan
>   *
>   * SUBTEST: basic-memory
>   * Description: Check if basic fdinfo content is present for memory
>   *
> + * SUBTEST: basic-engine-utilization
> + * Description: Check if basic fdinfo content is present for engine
> + utilization
> + *
>   * SUBTEST: drm-total-resident
>   * Description: Create and compare total and resident memory consumption=
 by
> client
>   *
> @@ -35,10 +38,18 @@
>   * Description: Create and compare active memory consumption by client
>   */
>=20
> -IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption
> using fdinfo");
> +IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and
> +engine utilization using fdinfo");
>=20
>  #define BO_SIZE (65536)
>=20
> +static const char *engine_map[] =3D {
> +	"rcs",
> +	"bcs",
> +	"vcs",
> +	"vecs",
> +	"ccs",
> +};
> +
>  /* Subtests */
>  static void test_active(int fd, struct drm_xe_engine *engine)  { @@ -287=
,6
> +298,18 @@ static void basic_memory(int xe)
>  	}
>  }
>=20
> +static void basic_engine_utilization(int xe) {
> +	struct drm_client_fdinfo info =3D { };
> +	unsigned int ret;
> +
> +	ret =3D igt_parse_drm_fdinfo(xe, &info, engine_map,
> +				   ARRAY_SIZE(engine_map), NULL, 0);
> +	igt_assert_f(ret !=3D 0, "failed with err:%d\n", errno);
> +	igt_assert(!strcmp(info.driver, "xe"));
> +	igt_require(info.num_engines);
> +}
> +
>  igt_main
>  {
>  	int xe;
> @@ -303,6 +326,10 @@ igt_main
>  	igt_subtest("basic-memory")
>  		basic_memory(xe);
>=20
> +	igt_describe("Check if basic fdinfo content is present for engine
> utilization");
> +	igt_subtest("basic-engine-utilization")
> +		basic_engine_utilization(xe);
> +
>  	igt_describe("Create and compare total and resident memory
> consumption by client");
>  	igt_subtest("drm-total-resident")
>  		test_total_resident(xe);
> --
> 2.25.1

