Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE54CFD376
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 05:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539A710E521;
	Tue,  2 Dec 2025 05:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loocO+j4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B065010E520
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 05:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764653253; x=1796189253;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A6M2mLyap5Pe74ACi6K4UH+E7pO2hIFNW5D4E+E92Kg=;
 b=loocO+j4ns3yQjTvgyK0T0wb9VSad1eGDQhG5PEmmFfvTI4d0KAvtjMA
 /3gXa7LPdmuODHEXQzv0npd9dHl25kOGWUUYy7j++304ytDCmRx/y644z
 xOvBlWN6I3Kdx798GnCJmKhqYOxc4aPc6RPh3QdYHpA0ENAcfM71lLhDv
 db9NxDc2s1UHALeUn/koKJRo5YlbrCAv/VWzv1CAggs+/u4Bh0kg14wr0
 tT5EXvmsL2VORu1PReCYknqVVXMrBOUXh59NohgSvFhNRKkyCByWGqebW
 Ww/oRstbO5tBuG+8R5cOqGyJnRSQXDb9Bjwso3NG5fOC6CmuvdCge0+H3 A==;
X-CSE-ConnectionGUID: 5ddkarcQSMKuHtGX15LfDQ==
X-CSE-MsgGUID: T7ckGsteRSiTjKQPBDfmPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="69205148"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="69205148"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 21:27:33 -0800
X-CSE-ConnectionGUID: AKmgF4BvTQSFgsH3y5A9iQ==
X-CSE-MsgGUID: MjUiBvHKQ4Cu30QHqOIxqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="199399878"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 21:27:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 21:27:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 21:27:32 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 21:27:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWHHf+4T+exNmk49HfosdZeueD2d5gx7XPodkyHJxRRrtRNCmqbZOuDLukel6GpZAwadkSzsGXorAT+0Fv43JZf2CXkKjSRN3wJ2bYZEtRVMuGURTXycRpV+EsFZ1zQ9eS0/B4GGRv574BR1gFyDaic7Xh7hlK1npWCMr5/yXPFT1TprTdOE2pfIdnuPoNznXTQDoqLTWEagc6KFgzaBhFZ/nKe27DCwM47H7bh/9+DW4VILu6l8e3Z9O/ahQYboEIdRFYj7wRRSygYq+Byxowo0XIBFqul4hTb9e9iyuDxIpWKmsb40JrofL+ZEtEjCb87DiAGEf4KPDFjHK7WoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPZGskWafJpYl1XAcOBvm6kqxyd+ltyH9UTfg9Owos4=;
 b=fMCRvF7s8K5hh2E1WWQsAT5SxIM0aSVnJ4PuHkR4kPzxpO0ahKFzPZNRbnmBvG2f1op+NPO72U3IhEri/VEWDU0HMNnPYcEVx2DE0lvIpzJqLUfdwEwWgeNoNsknGVkGXzaVNVyybjlzxGFGX0KzpDaNw+To+lHyZF+3oSkLVWX/xj2dfS2nbUeEX5VHkZ5hfTvnJs1GjE40AwCuJub2UKrG+mXEUkbXw1FGo8SyUVv2qcArRj4FpcIX2nxopZ9rxKtGj+XVinOGYLwf3ThBVWO9hE62clUNFhIJcPF1E34gBf+N/6/CrHB/aJEx0qcmCQoBQURo6q+bOHlDzEgpTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by SJ0PR11MB6790.namprd11.prod.outlook.com (2603:10b6:a03:483::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 05:27:30 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 05:27:29 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH v2 04/19] tests/intel/xe_exec_multi_queue: Validate exec
 submissions
Thread-Topic: [PATCH v2 04/19] tests/intel/xe_exec_multi_queue: Validate exec
 submissions
Thread-Index: AQHcWpr67QokVQeApUGhGRUoEv6WPrUN4vZw
Date: Tue, 2 Dec 2025 05:27:29 +0000
Message-ID: <BL3PR11MB5747F675E8D2D1787E63497DD0D8A@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-25-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-25-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|SJ0PR11MB6790:EE_
x-ms-office365-filtering-correlation-id: 4de00e42-dae8-4752-48da-08de31637c9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xCq6i4YwQ94x3hWxsyJTDYwIxNayViqUmvf8cYvYMzDnPMuv5ijwTdBSezLB?=
 =?us-ascii?Q?bBpewKDQfcAsWqfmLGRRB23pOBUDOsQCRaiIIqIToXibUDkkyeWC2KNDffZz?=
 =?us-ascii?Q?VT4fRNv+J5ci2mousgMNk7P+JRPzNLWjTDpTseSQ5x6qx+p/MC/jW3mot6gh?=
 =?us-ascii?Q?tYY3/EoPU02ofTFn1U6jdKIqy6A7PMBPhZk92G862vWMO8oWzcUIY+2NLIke?=
 =?us-ascii?Q?G5IkeAUxTeWiBfQC53b/SonJkijGEH53ll35Hc7jpWIPLUAPRaLJvzA0L7U8?=
 =?us-ascii?Q?gGOI70tQsOfifmBZsfqQ2QS9k4ows/UJTxSVKlxEWAgz+CoEcm1gt+B2Rn6a?=
 =?us-ascii?Q?dQdIiV0JbdQ5cu34wgamZDO3CQTRj7bfsrAM1X9BQjfUGEjmCwqw9IJQdvZN?=
 =?us-ascii?Q?Q+mlFzTRBt1n4f/ZR2/41U5bsaogchaRJDU7R3nuzuwpGjtwUCpq4nf2Vzte?=
 =?us-ascii?Q?3ey4GJEq3C3W9fJDNlSas1qNCYkGZ98j11LAvGbL1c3g7XAqoH6M4dczJiZw?=
 =?us-ascii?Q?Ad+oVx5T5NH9HfoZ06M28bD9ai64Kp2EhDa+wlw6ZARVl4Wh2oCr4VmIWMi2?=
 =?us-ascii?Q?AZmfrdAs+UMhiWSZJyf7Ji1alpKQeBtsP4jQ5aozxb5qwz69NpRG0YN8IQmT?=
 =?us-ascii?Q?JCmJyoWAWAPu68fAV0yDQSmLtLE6bZLi09+DI6vqyr1tOscKosiiZXfkO+u/?=
 =?us-ascii?Q?dOcfhyf7k/It1KpByPtEa3FxGOiLiB6Lshv9sd9OL5TZ3Hbnl+ZUjXnRyyhy?=
 =?us-ascii?Q?l/ZQ4hThr3sOWB8NaGBV3tn6xjXuKnYnub1RDyvxicSgXAI3vLS4c4P9gvhy?=
 =?us-ascii?Q?g51TqjzTsxGJ+kHF9JG+7K3ahI7PpiNFXcgm65i7KhcPHH16DBpQqrVIen0C?=
 =?us-ascii?Q?gchiHg+eiNVyGJT0gNJazmmyU5GBihgFqXBuJeBBrVW5tANIy5TGI5GCKshj?=
 =?us-ascii?Q?H97K0Naq26Aqbf2WOfm2xjL1YVgfGYj1z+pkItj8u3QckJSfSsMa5ovMqEqW?=
 =?us-ascii?Q?RDanVAV6PTD6vxIQcEmg+G/cc9QNXlIjDk1lj74Jy/2lByOLCaJ8rZLJc3ZB?=
 =?us-ascii?Q?oVpo6OobvqpdFRlFfAr8iI5XSkIAftL6N9P1B5ai/wle3neTZtwGwd7DjN9W?=
 =?us-ascii?Q?QJCKm64W0P0miPajOOnlwiJ9FW+Smwg/xe3JICz87bmNBY4+cxKWqkivthT1?=
 =?us-ascii?Q?Ht6hd0LHGcqP4nIHOdjllsr5cDvGcIbF/e+lgNF6z+UGeqWPN66X2dmo8RO/?=
 =?us-ascii?Q?OURnFEaCgxL3ZaoUoqkS3CLxx2P2Dt11F300GRGcYT87jCwETO/6jy4psbIH?=
 =?us-ascii?Q?JJwoXt9jRqkZEiI1IXmZ8EoPcnQQCkjBiFBH/nv+HqOikw8pkDQW0tM0EyRT?=
 =?us-ascii?Q?GNcRAgPcLfTkQboPvR7kftEF+AkdYqGrRfwVTh+Vlx766VozEjUCzv/GDaRv?=
 =?us-ascii?Q?n0k73flT5O6jo8on3whlbFO9zGaXpJtlDji02z2fR9Lv7Joly0ac8mE/EAeg?=
 =?us-ascii?Q?mK2p0pQwHgKBIoaAXm/Yhaea0zAZpsd83iBn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SLkaluF+TRcTNeokF8xWu2Vva4TBgUroTlFBoqt+0w+f2T++edmgV2UGJT6M?=
 =?us-ascii?Q?DB6txoJ/qHuQbh7/l+H3GWRnW8lUTWqAlXXwsYfQrPnmZNSZC+L/Qzu23A4t?=
 =?us-ascii?Q?RsxiZpyCupp/sp9+OqdbDWm1klA60bFYigNN4akukhrzyYbGVBwHTmiZWz2+?=
 =?us-ascii?Q?5fJ7lgCl/i+4bDsOhY9JkfLEpE+/ZnB8ImvFQNQE8vBlWtMUvbJyKwAGGQiu?=
 =?us-ascii?Q?JP/I5zOYL7j95g7ShZ+s7w3YZtu/EF0Bb183RqH7665tnxEkc5Hq2Oqsx+7q?=
 =?us-ascii?Q?Gce5k1bwNYDhRWk3aCDKwsey3dQEsNOEvxbw5big4dvrpLFKos5c7L/hqko6?=
 =?us-ascii?Q?8xTC1ovyLc5hn8E5EN7394RhnPtQ+6lg/mMwj/Y+s8Wo1lLvMfviEVJZBva2?=
 =?us-ascii?Q?csoCgQFQwJUwE7KB3qOBPIpd7CxtXFFnNMDZG7cJ7a2cYKlItK7kQ33viEdh?=
 =?us-ascii?Q?Zy0AV7l019xFpwN4lO4rafVUpDIgoT91OeS8ZV7aHvSuE/XWieu9RzDzHbCk?=
 =?us-ascii?Q?rBW3z/hgnyzR7KR7xPaqwdQRAVsyBEyPe4t6lMo0JS3jISp03dHV/5ubzh4T?=
 =?us-ascii?Q?cXebKkJjbhEO5F3aVmD/LabFandXy2Ci2gBu2QbJv03fGaexs5E1yjoTj/w8?=
 =?us-ascii?Q?xmDueZXKIm9sYfMNwkVoF71Y6/S1fmxmrhozgkaSZpqajaALN6um3jvF5Rx7?=
 =?us-ascii?Q?De5o1pZ0IK4+IOMa6hHNBojdUgsaoEJ2/FRiD9m08VKTf7u7oUTER4l8OR1U?=
 =?us-ascii?Q?qNehi1sgoEWH76wP/LF8IlqhQ7H+c4IK7rQQiim8DqFqXmHpoTovGVP+97Pf?=
 =?us-ascii?Q?7ZI3ZSiqXjww4aprVKZIhQX4my7HWxZn4347y/O94e+OPRBaRrHGqPQmkdqU?=
 =?us-ascii?Q?xyXSTMMeVuDUaYq4ezILgJPG5b/IdpAmw9V+O+ysr9LsfPdbzedOlz7yrutX?=
 =?us-ascii?Q?aSA8ZNxfgs0wqHcOYBWxx1WM0Alb/iKugFqq6KLw13hEnsbtF+hKZtMj2dnk?=
 =?us-ascii?Q?7d4wx7DvmT/yA1YkZEfWSg2njMNYnJCd/lbM2PyDA21rz8UBtIDi58s9F9CW?=
 =?us-ascii?Q?FxTUuRp9y1z3UnWISm9gbJDaDMAKvzbj9pLmQYftmMF076WHrjfHxTb8qtfN?=
 =?us-ascii?Q?8eB614jQ9oET08GESCjr09NRIDmAHeYW4VEOnLbKB8qrrvUCxQJwAuaj4gwz?=
 =?us-ascii?Q?uxlJrGGMrMYJe9ur7Ym8vJH130bhE7TkUa5V4+sEmISXCbEPHIgZSgsqTXy9?=
 =?us-ascii?Q?IekQFxuHP8ap4rDLfbCgWIPsiUWsglygruiaRcfzONCYdG1Xgwte3t5P1rnR?=
 =?us-ascii?Q?xQ6InJMSoBmK2cJUnKqstK3+SqI/6h32sRXZHcicYyrxa0Mi5SoAeMZS5d51?=
 =?us-ascii?Q?YtfE7VAw7rY4QXYOj2hP2geP3SL8DEMFbYhhE5VOok+ljOtbctdbLtwrNIeU?=
 =?us-ascii?Q?m7trrevzDNxdQNtlVUtHxhtk656nExruBTSr1KeWuyo6PGAigQCAgfeHT7FC?=
 =?us-ascii?Q?v4DCXD3ITdDOSfy9lfw4jSn0bqPD1AICg2+TMCO2d6ZTTSW6CfbIz43lxTib?=
 =?us-ascii?Q?68j9MT0XHqnV46LB2ADwYM+8usatGAOF69RO2GLQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de00e42-dae8-4752-48da-08de31637c9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 05:27:29.4869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2C0uzVQuDzFMBwtXJf+awuHJ3r1t71PeH9xCztwRB3W/MH4ulV7CsKyq5iiB+M6wUb9/4uoQkuuqFtoLR8bF/e2ASxlBMT9oB236ZiF6Bo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6790
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



>-----Original Message-----
>From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>Sent: Friday, November 21, 2025 9:27 AM
>To: igt-dev@lists.freedesktop.org
>Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Dandamudi, Priyanka
><priyanka.dandamudi@intel.com>; kamil.konieczny@linux.intel.com
>Subject: [PATCH v2 04/19] tests/intel/xe_exec_multi_queue: Validate exec
>submissions
>
>Validate multi queue feature with different queue group size and with exec=
buf
>submissions.
>
>v2: Use BASE_ADDRESS macro for address (Sai)
>
>Signed-off-by: Niranjana Vishwanathapura
><niranjana.vishwanathapura@intel.com>
Looks good to me.
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>---
> tests/intel/xe_exec_multi_queue.c | 199 ++++++++++++++++++++++++++++++
> 1 file changed, 199 insertions(+)
>
>diff --git a/tests/intel/xe_exec_multi_queue.c
>b/tests/intel/xe_exec_multi_queue.c
>index 03b920dc8..977b4e7a0 100644
>--- a/tests/intel/xe_exec_multi_queue.c
>+++ b/tests/intel/xe_exec_multi_queue.c
>@@ -13,16 +13,21 @@
>
> #include "igt.h"
> #include "xe_drm.h"
>+#include "lib/igt_syncobj.h"
>
> #include "xe/xe_ioctl.h"
> #include "xe/xe_query.h"
>
> #define MAX_N_EXEC_QUEUES	64
>
>+#define USERPTR			(0x1 << 0)
>+
> #define MAX_INSTANCE 9
>
> #define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
>
>+#define BASE_ADDRESS	0x1a0000
>+
> static void
> __test_sanity(int fd, int gt, int class)  { @@ -144,8 +149,175 @@ test_sa=
nity(int
>fd, int gt, int class)
> 	__test_sanity(fd, gt, class);
> }
>
>+static void
>+test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int
>num_placement,
>+		 int n_exec_queues, int n_execs, unsigned int flags) {
>+	struct drm_xe_sync sync[2] =3D {
>+		{ .flags =3D DRM_XE_SYNC_TYPE_SYNCOBJ |
>DRM_XE_SYNC_FLAG_SIGNAL, },
>+		{ .flags =3D DRM_XE_SYNC_TYPE_SYNCOBJ |
>DRM_XE_SYNC_FLAG_SIGNAL, },
>+	};
>+
>+	struct drm_xe_exec exec =3D {
>+		.num_batch_buffer =3D 1,
>+		.num_syncs =3D 2,
>+		.syncs =3D to_user_pointer(sync),
>+	};
>+	uint32_t vm;
>+	uint64_t addr =3D BASE_ADDRESS;
>+	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>+	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
>+	uint32_t bind_syncobj;
>+	size_t bo_size;
>+	uint32_t bo =3D 0;
>+	struct {
>+		uint32_t batch[16];
>+		uint64_t pad;
>+		uint32_t data;
>+	} *data;
>+	int i, b;
>+
>+	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
>+	vm =3D xe_vm_create(fd, 0, 0);
>+	bo_size =3D xe_bb_size(fd, sizeof(*data) * n_execs);
>+
>+	if (flags & USERPTR) {
>+		data =3D aligned_alloc(xe_get_default_alignment(fd), bo_size);
>+		igt_assert(data);
>+
>+		memset(data, 0, bo_size);
>+	} else {
>+		bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>eci[0].gt_id),
>+
>DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>+		data =3D xe_bo_map(fd, bo, bo_size);
>+	}
>+
>+	for (i =3D 0; i < n_exec_queues; i++) {
>+		struct drm_xe_ext_set_property multi_queue =3D {
>+			.base.name =3D
>DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+			.property =3D
>DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+		};
>+		uint64_t ext =3D to_user_pointer(&multi_queue);
>+
>+		multi_queue.value =3D i ? exec_queues[0] :
>DRM_XE_MULTI_GROUP_CREATE;
>+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1,
>num_placement, eci,
>+						     ext, &exec_queues[i]), 0);
>+
>+		syncobjs[i] =3D syncobj_create(fd, 0);
>+	};
>+
>+	bind_syncobj =3D syncobj_create(fd, 0);
>+	sync[0].handle =3D bind_syncobj;
>+	if (bo)
>+		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>+	else
>+		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data),
>+					 addr, bo_size, sync, 1);
>+
>+	for (i =3D 0; i < n_execs; i++) {
>+		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
>+		uint64_t batch_addr =3D addr + batch_offset;
>+		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
>+		uint64_t sdi_addr =3D addr + sdi_offset;
>+		int e =3D i % n_exec_queues;
>+
>+		b =3D 0;
>+		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
>+		data[i].batch[b++] =3D sdi_addr;
>+		data[i].batch[b++] =3D sdi_addr >> 32;
>+		data[i].batch[b++] =3D 0xc0ffee;
>+		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
>+		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
>+
>+		sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
>+		sync[0].handle =3D bind_syncobj;
>+		sync[1].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
>+		sync[1].handle =3D syncobjs[e];
>+
>+		exec.exec_queue_id =3D exec_queues[e];
>+		exec.address =3D batch_addr;
>+		if (e !=3D i)
>+			syncobj_reset(fd, &syncobjs[e], 1);
>+
>+		xe_exec(fd, &exec);
>+	}
>+
>+	for (i =3D 0; i < n_exec_queues && i < n_execs; i++)
>+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>NULL));
>+
>+	igt_assert(syncobj_wait(fd, &bind_syncobj, 1, INT64_MAX, 0, NULL));
>+	sync[0].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
>+	syncobj_reset(fd, &sync[0].handle, 1);
>+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1,	INT64_MAX, 0, NULL));
>+
>+	for (i =3D 0; i < n_execs; i++)
>+		igt_assert_eq(data[i].data, 0xc0ffee);
>+
>+	for (i =3D 0; i < n_exec_queues; i++) {
>+		syncobj_destroy(fd, syncobjs[i]);
>+		xe_exec_queue_destroy(fd, exec_queues[i]);
>+	}
>+
>+	if (bo) {
>+		munmap(data, bo_size);
>+		gem_close(fd, bo);
>+	} else {
>+		free(data);
>+	}
>+
>+	syncobj_destroy(fd, bind_syncobj);
>+	xe_vm_destroy(fd, vm);
>+}
>+
>+/**
>+ * SUBTEST: one-queue-%s
>+ * Description: Run %arg[1] test with one exec queue
>+ * Test category: functionality test
>+ *
>+ * SUBTEST: two-queues-%s
>+ * Description: Run %arg[1] test with two exec queues
>+ * Test category: functionality test
>+ *
>+ * SUBTEST: many-queues-%s
>+ * Description: Run %arg[1] test with many exec queues
>+ * Test category: stress test
>+ *
>+ * SUBTEST: max-queues-%s
>+ * Description: Run %arg[1] test with max exec queues
>+ * Test category: stress test
>+ *
>+ * SUBTEST: many-execs-%s
>+ * Description: Run %arg[1] test with many exec submissions per exec
>+queue
>+ * Test category: functionality test
>+ *
>+ * SUBTEST: few-execs-%s
>+ * Description: Run %arg[1] test with exec submissions only on few exec
>+queues
>+ * Test category: functionality test
>+ *
>+ * arg[1]:
>+ *
>+ * @basic:					basic
>+ * @userptr:					userptr
>+ */
>+static void
>+test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_place=
ment,
>+	  int n_exec_queues, int n_execs, unsigned int flags) {
>+	test_legacy_mode(fd, eci, num_placement, n_exec_queues, n_execs,
>+flags); }
>+
> igt_main
> {
>+	struct drm_xe_engine_class_instance *hwe;
>+	const struct section {
>+		const char *name;
>+		unsigned int flags;
>+	} sections[] =3D {
>+		{ "basic", 0 },
>+		{ "userptr", USERPTR },
>+		{ NULL },
>+	};
> 	int fd, gt, class;
>
> 	igt_fixture {
>@@ -158,6 +330,33 @@ igt_main
> 			xe_for_each_multi_queue_engine_class(class)
> 				test_sanity(fd, gt, class);
>
>+	for (const struct section *s =3D sections; s->name; s++) {
>+		igt_subtest_f("one-queue-%s", s->name)
>+			xe_for_each_multi_queue_engine(fd, hwe)
>+				test_exec(fd, hwe, 1, 1, 1, s->flags);
>+
>+		igt_subtest_f("two-queues-%s", s->name)
>+			xe_for_each_multi_queue_engine(fd, hwe)
>+				test_exec(fd, hwe, 1, 2, 2, s->flags);
>+
>+		igt_subtest_f("many-queues-%s", s->name)
>+			xe_for_each_multi_queue_engine(fd, hwe)
>+				test_exec(fd, hwe, 1, 16, 16, s->flags);
>+
>+		igt_subtest_f("max-queues-%s", s->name)
>+			xe_for_each_multi_queue_engine(fd, hwe)
>+				test_exec(fd, hwe, 1, MAX_N_EXEC_QUEUES,
>+					  MAX_N_EXEC_QUEUES, s->flags);
>+
>+		igt_subtest_f("many-execs-%s", s->name)
>+			xe_for_each_multi_queue_engine(fd, hwe)
>+				test_exec(fd, hwe, 1, 16, 64, s->flags);
>+
>+		igt_subtest_f("few-execs-%s", s->name)
>+			xe_for_each_multi_queue_engine(fd, hwe)
>+				test_exec(fd, hwe, 1, 16, 8, s->flags);
>+	}
>+
> 	igt_fixture
> 		drm_close_driver(fd);
> }
>--
>2.43.0

