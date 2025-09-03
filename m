Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB65CA0FF2
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 14:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564B310E8A7;
	Wed,  3 Sep 2025 14:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYOU9iAF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32C110E8A7
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 14:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756909642; x=1788445642;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1uNUfb9RtY13Wr+wbQnzf/qRYXYkqcr313DXcqcAGzY=;
 b=SYOU9iAFKZnd/CRjokb5KUympCbiV0AvV4x1n22MpSiRAhkvZ7hbNNi6
 tQIuUg4e2dJvIMLY8+tD/met3MQaZlHQC4V7bkzY30x+BgvFPqYiMu9g1
 qYsTI2f4VHz3mxMn78qpwcvub3twyLUIu+RRESmCdzm6GUUJg1tUZxKNs
 HDtKJGCD0RGr2WAMVWuZ2ukOSlZJJpg2Uwq0vcgiRwk9HPV/RoDPPFhtm
 +0/yN847CDz9scqkXZQL2QLWFxQxFLyHb1c6ZcIlWL1DYHMPXPZQmHytf
 DnV3siZlxub6cLJCnHETg2vnlo09tmMznSt/SCW5kP7grRZGne+2dwKWm Q==;
X-CSE-ConnectionGUID: WDLgMvBFQ5GNsO5FQ+c4vg==
X-CSE-MsgGUID: AcgCJCKcR36mEOYWil4M9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59293821"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59293821"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 07:27:22 -0700
X-CSE-ConnectionGUID: OCuFwe8tQ4u4JVlXNFDj7w==
X-CSE-MsgGUID: UkrnmNY3RLeecPyI2kJhWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="176848433"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 07:27:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 07:27:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 07:27:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.66)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 07:27:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKqCotMuEfCZm607hz5Gs2yri7shXX9ayBpJvsiK3yhj3YvsBF/JCWsgCQm4pLqjYJZ64AH2vNSSxnh1fGZU/gRAEwLLDhoL/BXtMkYeqiDBkmwxyGo6chqCJk3QoTf7Jq3tke7s6Qa2F27547MKitHpheanwz8vyODaTkiwJr40Ul/dogFzIx/eigWb9vU6//0BLJxQiI6c+Y2UupZFlkfM7XIhdeTTISiFIDpEtM0Q6OC0QIhX6zLvmwoJSWYL9FbKxRBzLFwYy4bAGDrpmKy/hEv6BaMThxC0c9LGxKFuOVkac897+dCGFsVdu6gRX+uNC2fFNJapqa248W6+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mepjsaVohMc/G7sgeAvtXKEwtoMyDltmF4bveQ0QmZY=;
 b=Wsz4yuFZMD0Q5BzYrd0YW/S8Pvv7RC2Pg+fbdweVDZQdV8ZAMjUtvZAqcjVNZWLl0Isfn4bL4tWf3nUYLOkNVqk1r/rNnAlWJbBjZsyFkKFmRb96CKeMgO9/UpwMvQ/tlQMBedS49u5MMAdPXREHpQiEoo+pomLj3k2U1pII+ct1HOw0FGeoX5mNGqlj7vbHCiaPDS2j7UvQlwJrahrgSfrhQKZP8eVnIPc8FbDxGt1STTaSql0uWlk4IfDOWxBKWjey1NWDTeyJwJo3ZGN2XOXMOeMRZulG2kBa6LGJzMNbMyg8ErzWAZ0idTZFAsRhxJrgFVu3oSPo+WMdf5aTcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 14:27:17 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:27:16 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t v11 2/5] lib/xe: Add xe_vm_madvise ioctl support
Thread-Topic: [PATCH i-g-t v11 2/5] lib/xe: Add xe_vm_madvise ioctl support
Thread-Index: AQHcHNz+zJaJLj9alEiLZk5kjUPCIrSBg+QQ
Date: Wed, 3 Sep 2025 14:27:16 +0000
Message-ID: <BL1PR11MB5525CA024F3E551D660C1DA78401A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250903141339.1859497-1-nishit.sharma@intel.com>
 <20250903141339.1859497-3-nishit.sharma@intel.com>
In-Reply-To: <20250903141339.1859497-3-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SJ0PR11MB4976:EE_
x-ms-office365-filtering-correlation-id: 921805f3-e78d-45d4-bfa8-08ddeaf5fbbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gxSGy7vlMBuJ/s/ZUQ8vmoupmpWsrRp89mR807EPqWpQ6d0okh4JGGRTXSbm?=
 =?us-ascii?Q?DSlLSuz3mbT6FavsWAl5lxQkuC8xLb5TEydE+ZYkhwl7sBJOrX/BeL9zV3WL?=
 =?us-ascii?Q?WBBEuuTvj66CEogoP+McdHj8tkftsuApjv698kdOwRqFfRkCK+bXLTHK8dFh?=
 =?us-ascii?Q?jjxTiy3aTRomhnV+gpPOk3l/m/Bf7j0KFV50vRXGQUpdYjwxdGJXyxijb0Br?=
 =?us-ascii?Q?vZyphuu21ZB8loPfXckOXPTxNqIrcMjM//5YLMIyHrA9qWo+lyQB3knrXOBJ?=
 =?us-ascii?Q?sSuQGQ5iL7f0kYgf02sJcVmUgKf5MTEn+dh3y+TdG2+0L5lG/meAELTMFBV0?=
 =?us-ascii?Q?VeX6keduRJ2g6eU4BIONSQlOB/c/AWPLqWTJJyIe8cXikXkv0lpCuuWAmzvr?=
 =?us-ascii?Q?4khcPDONwINc9ByaIVh1gOv8dNSTahQLsE/T5ewaPaBAZYhISC89XpWAZoJ7?=
 =?us-ascii?Q?NOnJksTlw1ZjobyOJFWn09Xzlutb2iyja6YBCeVbSHUeRHBJEMKFQZnqhCV+?=
 =?us-ascii?Q?zf7tiP2pSskp+SR8qg9kdl8ynYkzzKHbuYG08v8xevB7T97IJSSCWfenxMuI?=
 =?us-ascii?Q?PWz1FF5vQ4UgQC3dpofslOdsp3GqfEdOnZOnFSfld0sTuvcf1ffUZhL2rPP7?=
 =?us-ascii?Q?ZhEGP0kdhJB6Bp9Y2KG4n0p8l86R4mr+zF3N1yfRwj+KOXiL6ntyPGu9CQ0N?=
 =?us-ascii?Q?pX0qnrgVwU7X/r/NIwQ6ZCEt98guZBFE/VypMxs8DqxnQqfWTqpdBxi7cCoE?=
 =?us-ascii?Q?4anK3/4bhWBvdzxO0bKcJ3TXF0zj0foqotjOi4Ofq75MmJM6p75wk5+rHieG?=
 =?us-ascii?Q?KGy/9SAYe2oJ8ZHnFUYiDUrpxOAYQGrAZyoie7WYTVRzuRVY0BigDJsC2+Qz?=
 =?us-ascii?Q?cKSrCBQ9kZINkC0jKCL7o0DTkoDDS83NN9Sggw8anyoNCd/dfn4aU0E9dv8f?=
 =?us-ascii?Q?JPzDbZ5nJ3Da8fk8Y3l5DeB1h5+6MjLCqYmeqXjp71urIJDVm5IhFV75EGTX?=
 =?us-ascii?Q?t3wEEfKuUs3d9Ouqsv73t0uxbAX6XxaKrxJcyV6ez1IououKOwEzVDx27Mhi?=
 =?us-ascii?Q?IT4FabNB15LWUZhejucuBxeKYGRxSIHZ9XBCWqGRFLUNjZxe0Ek450kk/ghz?=
 =?us-ascii?Q?rrK0YdCLHQa6xV9Y/2SCz75Flz7pQR21ZOmD39vgEEIrW12vEWMnxIfAlK7m?=
 =?us-ascii?Q?RLOIZNXChExxJslPodHvBSIy6QQGCGcArBpCvMn8CJ+TA45zaIEkBRIUbov3?=
 =?us-ascii?Q?9DoF5vHkGdJaRrwwC9Alo5u794d+ZzasymbtmzvxWVwEoG4Jtw4BHcr/jeNg?=
 =?us-ascii?Q?uaT66HAigO74elLy6ysNBJClprNz0jIB4726c8l5tVAVYYWPqkwAsRDw7yJD?=
 =?us-ascii?Q?20mn25kBfaXvXNiciszj3ul1STeElVgcv6WKqPEjIa0JWBKfMyq8uDoi/7jz?=
 =?us-ascii?Q?KQmEFSP4GZAzN+b65ITd5Xp5af5k4pjhWpU9ap6Ugf7McRutulj/sA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CfP6j3v+dRkZP4v42uB4NhS4MjBr+JU58E3k5WxxZ+Lq20LdhNsyfQWR6uwo?=
 =?us-ascii?Q?kq547wbShFV1Z6fa9WTVlUEtpH+LeicNgUS3OqexJgFI5GhtbcBtL/fPDcEB?=
 =?us-ascii?Q?LT/xDKkTA53hhR0q8AVhbBwIBTjkNOWPo5HJwPZiT5iJ84NnOEOV4Wi35bvW?=
 =?us-ascii?Q?Qn5Ec9/Fv1UoxBJrKu9bQJni5ELGZVAPlHCOxLzq5O7fXJrkLlNfpPPgy5rS?=
 =?us-ascii?Q?aZTzWKPIC19y3YPdztupwXdGl5GFdCUuABPKy+ZE5dPzGDL9f6wQA6vVNVXw?=
 =?us-ascii?Q?exSY0qSHQOXzEItLQT9pzqkIR4trTl5lhIfRvLtghTOZHZPy5FlkLASZYNjW?=
 =?us-ascii?Q?l03gSa3RlSu0GJolBx58cFd/sIRmq5FraZhhpzzA3/9YUas++veX0xfWliS/?=
 =?us-ascii?Q?JLlgsJj4efZgwwiqVDHCwWdVA9EvbNb15gwDiaSermq2sPFuh2HmqjtVxqJs?=
 =?us-ascii?Q?8uqm6uVyjpm46zlih0Kb/GY29U8s5oRgfz/ZR/joGGARoQeZ12Ms8jG1WHmI?=
 =?us-ascii?Q?mL+QfcErcBdq4/dXPvL/zqg1BpeX9R2oV5+hSsR6iZH4YAAif2HV3PyKs/BG?=
 =?us-ascii?Q?J8nasiNJq1cG6WdxMOlDN5K+c21gsdvHKzoKGqD2fDOnwS1N6k1hor28Wg0X?=
 =?us-ascii?Q?tOUPSZj5XHeai3gzZ1cchGLxnhRu9CZpnpUmLLwRb8UuxO18emK5Xhx+7Ngi?=
 =?us-ascii?Q?EoJwu3NPhIN/UYVTRCu0n23UMJAmqSoTT1GRcAdDyuvglAQynTjTaKFP4I+7?=
 =?us-ascii?Q?+gi0h5AzV50q3rCBSHuYbCKr6NXHH76oDDHMXC84knY7HN+3NSThHOEjVtPe?=
 =?us-ascii?Q?bkO2vMp7d3cHrPURRvzIAKiOAJC8NhF9pKOCTxb8g5buw/MPXOWnB3FnYX5D?=
 =?us-ascii?Q?+NyWikQoi8B4TzLGrhQtkw1pnSOAlI1a1EzBUYYwH1xD6XuZEDrbLMRW2rmy?=
 =?us-ascii?Q?nXvBOGZLtjYik9HAwoJwwItgQazPM9uK+hCcwvDTZIs0Y081lF/Dq3JJqmZr?=
 =?us-ascii?Q?0TeHwc40T3djlzA5kTqVId/nod+P0XqqwrB+Q3UC8bQS1KCS1SIZvTg8pewa?=
 =?us-ascii?Q?qat97hl6eIqtVZnYBn3jMIIDOnGrxlL1Zp+8QMTtSpTRqFLj1MxgM0yPfE4U?=
 =?us-ascii?Q?X0WojBRoG2OQZv/q3WCuEvhgQA/oQjgwZO2OSZ1NYZJjJUziAwDnM28xm6T5?=
 =?us-ascii?Q?as+ivz6HeYXI9NHK+dNCX8HlDM/KwJHBxjhC9IIJHpQ+U7UgaZ2tQHWHgTAO?=
 =?us-ascii?Q?18wf9JSAN2ZRgn5Ps8QxHvJksY+ao2fO13qLmZbo5VBWwzfI74eUedEVPZef?=
 =?us-ascii?Q?8WrWXsi4JTawZOTeTVrlmT7X+97W7KG0qRhGgk2SPDBy4We2C8xR6x/c5mhl?=
 =?us-ascii?Q?8JPfJYvXJDMv7WHFt5Ea665D4Oamyw/R62W/ut/bNZZOqYZ01pxY09v1IlWO?=
 =?us-ascii?Q?wScmRTWVYHZvYl+L6oeB/RBcOO1MnmmHRCijUVXPHWwSXViMYjO+7rk5PA99?=
 =?us-ascii?Q?1JhHNorwex6j+0uCiL4tdrptF9vabkJJFyF47WGMmVsiYaEvZ9io7aS4uUeN?=
 =?us-ascii?Q?7n1DMvQjdsHAyKQpPRRFXy3KmsGSfsRK7TPH6je8auxAKqirEK3jLHtAneoS?=
 =?us-ascii?Q?vw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 921805f3-e78d-45d4-bfa8-08ddeaf5fbbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:27:16.7468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tXBTABmM/HK4XXaBDhPxRxIZhXF9SQ830xeKX7+HgT96jXWqLa2bgouhBa4JRnoO6jnHBqTcpzpPsMEVGm9ohYPyxHe0iMBAnzU8k0XA6Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Wednesday, September 3, 2025 7:44 PM
> To: igt-dev@lists.freedesktop.org; Gurram, Pravalika
> <pravalika.gurram@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t v11 2/5] lib/xe: Add xe_vm_madvise ioctl support
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> xe_vm_madvise() defined which issues madvise ioctl DRM_IOCTL_XE_MADVISE
> for VM region advising the driver about expected usage or memory policy f=
or
> specified address range. MADVISE ioctl requires pointer to drm_xe_madvise
> structure as one of the inputs. Depending upon type of madvise operation =
like
> Atomic, Preferred LOC or PAT required members of drm_xe_madvise structure
> are initialized and passed in MADVISE ioctl.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  5 ++++-
>  2 files changed, 61 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index 1e95af409..5608c=
8780
> 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -585,3 +585,60 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint6=
4_t
> value,
>  	igt_assert_eq(__xe_wait_ufence(fd, addr, value, exec_queue,
> &timeout), 0);
>  	return timeout;
>  }
> +
> +int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> +		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy) {
> +	struct drm_xe_madvise madvise =3D {
> +		.type =3D type,
> +		.extensions =3D ext,
> +		.vm_id =3D vm,
> +		.start =3D addr,
> +		.range =3D range,
> +	};
> +
> +	switch (type) {
> +	case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
> +		madvise.atomic.val =3D op_val;
> +		break;
> +	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
> +		madvise.preferred_mem_loc.devmem_fd =3D op_val;
> +		madvise.preferred_mem_loc.migration_policy =3D policy;
> +		igt_debug("madvise.preferred_mem_loc.devmem_fd =3D %d\n",
> +			  madvise.preferred_mem_loc.devmem_fd);
> +		break;
> +	case DRM_XE_MEM_RANGE_ATTR_PAT:
> +		madvise.pat_index.val =3D op_val;
> +		break;
> +	default:
> +		igt_warn("Unknown attribute\n");
> +		return -EINVAL;
> +	}
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise))
> +		return -errno;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_vm_madvise:
> + * @fd: xe device fd
> + * @vm: vm_id of the virtual range
> + * @addr: start of the virtual address range
> + * @range: size of the virtual address range
> + * @ext: Pointer to the first extension struct, if any
> + * @type: type of attribute
> + * @op_val: fd/atomic value/pat index, depending upon type of operation
> + * @policy: Page migration policy
> + *
> + * Function initializes different members of struct drm_xe_madvise and
> +calls
> + * MADVISE IOCTL .
> + *
> + * Asserts in case of error returned by DRM_IOCTL_XE_MADVISE.
> + */
> +void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> +		  uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy) {
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val,
> +policy), 0); }
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index 6302d1a7d..8e13f=
fe65
> 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -99,5 +99,8 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t
> value,
>  		     uint32_t exec_queue, int64_t *timeout);  int64_t
> xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		       uint32_t exec_queue, int64_t timeout);
> -
> +int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> uint64_t ext,
> +		    uint32_t type, uint32_t op_val, uint16_t policy); void
> +xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64=
_t
> ext,
> +		  uint32_t type, uint32_t op_val, uint16_t policy);
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
>  #endif /* XE_IOCTL_H */
> --
> 2.43.0

