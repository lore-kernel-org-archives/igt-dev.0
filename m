Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6EACFD2F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 11:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB82D10E632;
	Tue,  2 Dec 2025 11:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eWUWlOU+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4277710E63C
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 11:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764676301; x=1796212301;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3BQMpXGRK4F2/GAewha6WWjB9SfvEcKitn/JZzuaVUg=;
 b=eWUWlOU+b9Jd7qrt8LK3rm+1bJ6BNsf0sML5mktijGBWAnLtACoNmM2p
 YAdP9Ylk+TIWdk8U9fPL8coBFxkKKNv/UKGrKx5vZ73s867najcl22J3k
 zGzM6Eb5Cs+CI6mutZq60CKviSp1kwvYHfORDpC0V/gbRUKSLXmMSE0YM
 LyntDEInzdTA48IC900+OtbjhpqseSZLQJyW/20aQdbhZR+GciiESFE41
 uk6+LMWj82Iw3JUIF2HnUVsXsARAA00zNXSa8iKF0MLk4nI3SqMV7wnPe
 I1+ZlrKsQMPa5RXb9dDiMVApq5VSS85UOuPJxk6ZXRicnj3voS/EKny8N A==;
X-CSE-ConnectionGUID: 7Q+uXHb/RUe0zHNtkmy+hw==
X-CSE-MsgGUID: 7+C2P3fBSjWxXHL++t3kzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77325902"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="77325902"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 03:51:41 -0800
X-CSE-ConnectionGUID: BRsEcjYMQaazMz6Ce4PG2A==
X-CSE-MsgGUID: ExCbAZhVRZWoIWEMFMH95A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="194445106"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 03:51:41 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 03:51:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 03:51:40 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 03:51:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1tC8uIC38ejO+zWlfQe6hHDz5YHv3qaZzKZobPoayknlVvvVPP5rRi6ddzvf5R994AOIdjMVHmSGPepL5STLAKOfpoVs/CNwIxYmsQgNwq4VFzAkVinQ50cfOxYwwZQgANw/MPfksvxkYYKhWHgK7W1tAFsCinXaG4UmOm/lFr1RgEnkJddu2GvJBLDnJ3uwK5Gg1fxok6Uy5YX+9XYVefAHdp+e8qvZnZe/w7uYlTceut8tEgoBo0yfpAB/y70SjNP6z/hRRaPdLdK6005e0PZRmu9drz7vZL2U8OsRCiXYbimH9qj7ZBWU08DKadr2AhYZkhOTIGxwYqos0/SsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzMqzDKCg2XhHB6evV/UXW1KMr5D/OBTQL/jnhfoNeY=;
 b=HbJAdeKQd2wxLL8xcznXFsxHFcy/33t2bRmrS20ZV1fqHXu4QdTfuW72BIqZUKkECMsebduVfN5CphtOJgYAZ5EnJU4b8o9BfonO8tdWRrxsl5qKL9E/K6DsN311HNwtyrh8VJy9ZYwKOHCHm9TREQCShswvZPpduuTIq82hKSTl+bCeR++lfD5wI6u2ZTgwrKhMgANKO4iMaibrqnYREKxngRrBomObblLNfVG99p3YNXCahGNPFzSzqFxhZRZra6RmrDmOIMdUrHst83N+PjAV3BvrzQvC4/pWVx6eFbn9x2k9Xf15k9IShc2BezwHkGIMqJck2W9EIFhPrTnT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 11:51:38 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 11:51:38 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH v2 18/19] tests/intel/xe_exec_multi_queue: Keep group
 active in exec-sanity
Thread-Topic: [PATCH v2 18/19] tests/intel/xe_exec_multi_queue: Keep group
 active in exec-sanity
Thread-Index: AQHcWpr5NuRJOEo4JEahNPS4rsvAK7UOTehQ
Date: Tue, 2 Dec 2025 11:51:38 +0000
Message-ID: <BL3PR11MB57478A52509AECB0052E544FD0D8A@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-39-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-39-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|MN2PR11MB4663:EE_
x-ms-office365-filtering-correlation-id: 92354414-cced-48cf-101e-08de319926ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rRZ7NJH7c+6EuCwxW9P6ASoGw231oqfQpPYdYQVd+0IkbQ8v61HI6i31YnIl?=
 =?us-ascii?Q?4fOqzMRzohe2OGjBgD5wDt7chxCaN8Md3ZANd/9YLJ65kfbh8mNBOLpA61UQ?=
 =?us-ascii?Q?S3gnjstdRoAcawW+ymc76Iot10axfqY+HdoxyaZILtYbTSzTUHjjZfod5j/7?=
 =?us-ascii?Q?aZbOded8QUyUop7mKJ8IWEZ8qELIimkbcQr4zgUs+Rp9RWpInZT+E7bPlLaR?=
 =?us-ascii?Q?vh3woBvrMQA5ZyKBeRTvWtshdd9NKrPCF7aJE5iHN6qvwP6mr9jGoBJ7loUz?=
 =?us-ascii?Q?c7P6P2v4Al5Q+/vBaEK0qjkpNxPYSagJVkXMJ7M2yAC+e8q1pKJ6ZisslD4i?=
 =?us-ascii?Q?cdmjnFLgfOS2f9547554FYuEnWN0jt5z7Yma+zqEvakIuVVPvsKPcG7BJc5z?=
 =?us-ascii?Q?c74S6Tl/Gg+P8fy4d4RG9oTX5wUQl33GZ+OCNDXJAPJaFumfqoDhrT4stfKQ?=
 =?us-ascii?Q?H1n9iEtwXN+Shq2MK2fpGfPZEM4yb6SQEuWi8gROn84zbQFaygFPZR3KSV3a?=
 =?us-ascii?Q?rHXM0iuoOogkAeEipM+FtxhXjaeSARdDeIixrymAjc4/Q/Fu/dTloyW0I2cy?=
 =?us-ascii?Q?ARj4Wm+ibLpVDyV3aRGdc2XId//YUjz3aS9VNy7Hyn9GJKKAcsabP/iltE9C?=
 =?us-ascii?Q?o4/cksSLV+AAwAX5dROmAaVXaA97bd9JarSXwrVsOWtrIjEnKU4KeC6UyLNU?=
 =?us-ascii?Q?0+Z3BB/rfyKoJu4/brVeCwnQEl/z/ptvhhpJUASsH9tNNEp4z2rWpzzXHydy?=
 =?us-ascii?Q?lmuqJzW+AD0SQo+xZ5Lqcxg+bxwSSdZERAlvZEU/WWMijIqZ7xgYwO91bvwV?=
 =?us-ascii?Q?rme1J2CTkwlfNul8BNiNSb1V1N1NPgMSEKr8w0ur3xd1VqXU0z6n3p/nyn/8?=
 =?us-ascii?Q?K8cq6dAqCIZnDPrnsnIE5wGuA8sCb1ZG4+4LA7ZE45IfRIRLwkF4eGM3Hrqu?=
 =?us-ascii?Q?z+Og2ZvDQWAFgWiIiqDwJSUy8EyQiaa+jJB9N3kgyzrHd6gXhKlJKUXpdcfT?=
 =?us-ascii?Q?ZylkO4tkTT0EEygbRQnYpkoAbh/Y5d2/a8XRsRPSzONG7jxjtVepnQ+HQN5s?=
 =?us-ascii?Q?gNkaUiJAGhaOqsG12ntAwLN7mIBrNjd9Vs0b0pktn1O6vey7X0gPZq4v86J4?=
 =?us-ascii?Q?BxoZiZQfUKkGyACeysk3JjzhHuZTfJJdskTTuYWTVP/c+dARegNVNnQgWrqh?=
 =?us-ascii?Q?9p5IbqlnsEX4DFJvPWzX53pfXUgUigDdF/tT+7vJ7j1vyiFqXmYUfB/ZRXwq?=
 =?us-ascii?Q?DYqEZ1a+qbEOzD3Scd2vHmISVUJiWWrRVw5jBpKWWQn2x7kYMxz3WU87Yp7A?=
 =?us-ascii?Q?CrehmZh18xsdfDM+wOXptybeQjiTQb/XQB+DHMBdvhiOizHkmEqRI28FL2qc?=
 =?us-ascii?Q?XhklIUdLO3DYn28VS34ZUS5oPgRvEZ9PR3pvz/N/QVNEboFGJMrn/JQgZoGr?=
 =?us-ascii?Q?zf3Vzo4tWjFitZDWK6z5dpn255P8S5MMnQIyiczjHrceyzOsSMrUvlsEjyv+?=
 =?us-ascii?Q?V0OxFFi7bueZJbyOElk5GRPxcQtWeECY/UUt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0IThdGDxewatFBxFd7NWHzDFB75nzSrLBl6r5nEM3egQ6Am8C4bD/XVYY5Sy?=
 =?us-ascii?Q?MJtI+/lUv9SIcIn+jw7rCaJPW1DV5h1z5c0uY+ONXz1MD+6xVRC2BCJSmGtZ?=
 =?us-ascii?Q?SJKMOVsI6ThTQQzmbIZkBfV+ZnmNlnYdeuvOf46PC8YVVPvWa4FVOnzD+B7O?=
 =?us-ascii?Q?pzQRjW4vXhUEeK6FkoWzHiWSOMcD3kghFd4Ef2gVwqw9pIsWAf3gvatDKXCm?=
 =?us-ascii?Q?SozFmSn0suRhcqmfr6UytQ2BzlV+/6XpJeoS3ab4zamipx/KBhrZ14T7jQxs?=
 =?us-ascii?Q?ORQL7smYUhHtIIgLlNcmC/KfJ7CfBu3sNdTUHvb0q6gl3CYnwTliD9ljDPbe?=
 =?us-ascii?Q?w7f+4ohxgcN/WcSmmhbGmtcMqqIicLxI64pfaaLcyUm0tkT9oXbVlcMGC+Vh?=
 =?us-ascii?Q?CCbtlTSxm9PzjlC9U8BW67YCeLf2DoEwj3AxiywkOLqQh5HfVvaFR0wzSCs6?=
 =?us-ascii?Q?cpo7eVhfRK5Gphag/OnSw08oa8r3GH5YnCKyX60hqitSqwLCfwOxO8OnEcuL?=
 =?us-ascii?Q?+pqnSdbVESeOwTkd5jCcN4XyIs0KvdDEnNAwmUZJoT4XFdVudcAhVvDKa+IT?=
 =?us-ascii?Q?xZCZaK0nga5eUJKeMkRtjuSwlR9dLNJVNEFBSp2sqDvvHXinBCB1mIuVOs4f?=
 =?us-ascii?Q?wmrCH3qWSrBDBTBJ3rZDT3n9scxgPyPQrSVxbu6WHQIA9HE1g+zXwpGXG6o/?=
 =?us-ascii?Q?xo3Xa6+9bFS0PvlsLkuSpZfhxzsPbIbPXJCxh96dzSB7JZWjCR4f+HzXDWe+?=
 =?us-ascii?Q?0CenAQ5QvBTqOfLMiUrZAnCOxdLrSSaesLO2dcGsk4SGI5wtV7XM74KmtqwV?=
 =?us-ascii?Q?93ptcPmZbrN94B9cNJ9kUUru9lJSVa7pJWckrf5jLU7Kk6kaIGkSdHDxPun7?=
 =?us-ascii?Q?Y6gEYs9Aqg5J1dI5mTkAhYP7tipSK/NaL8l9qhoSv/SayFa+QQImcgbiSfuR?=
 =?us-ascii?Q?IMuyQbXC0Wt8B90+AFWdft7RjMDbuzg/w6h7R1YGIrF4Ra1Jf0JsRcbf8C1z?=
 =?us-ascii?Q?8CEELrFf3J2Wz8wNr3fuL23g9AVtl3DF1FxHm4+wBw6e6oeHcLmokUBZw4Wu?=
 =?us-ascii?Q?QANih/edXK7L6VIcT1GfkozT5e5AMAqqAeEJ/xzn+bE+547dEWklsa+AydQL?=
 =?us-ascii?Q?rXEfOcTufe6EuyhWxU2TDRxpIgzR8sweLo4wexM03cV8Cv6j0W1tLEE6f6Tv?=
 =?us-ascii?Q?sioptipTg/B+zZfmPX/16iZ2u6DniTPuSRfyjbwUeCpB4s9Wv+4m84O6OnAr?=
 =?us-ascii?Q?Egkmh6vow9/kxQ6R4g1zu+z409rCGyyrK7E6XM6k5vZiJ+p/bDPi83Srj7eN?=
 =?us-ascii?Q?Vai6faRjjhrtOftZc+dwxhRHOT8VtTOZp9+XGC8x/wwaTJE/wqcZ0yLFejvw?=
 =?us-ascii?Q?ob+Br+WbgzM8feGqO0/WJbzDA6C560CM4OcLmNwNxJVte3Os8dhKx94esgoW?=
 =?us-ascii?Q?wEr4ekd8Hdgw9cgH3oroU5+h/anqEK6zpTyqptTG9htO5D9AX5Ix3JWH6f9r?=
 =?us-ascii?Q?9NfirohJuATIMUiapDA3p4d3Y1s1Xb6cmqvvsEa0WGepKsa/2DZX8cXNeF5l?=
 =?us-ascii?Q?ftW/QfHiXwUch3iO60+fCfzw/9qgNGgcjvOGH/Lw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92354414-cced-48cf-101e-08de319926ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 11:51:38.1212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yNJqZjSdcDmoM9enoPKy/VxmvcBKSHvDtPoZKvOQopjaJi4ASwwuX/8CCQPqmce7vulYWBylEj4dvkbCxDXN3/HyXYjCDdSLnr9Vc4Q92Q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
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
>Sent: Friday, November 21, 2025 9:28 AM
>To: igt-dev@lists.freedesktop.org
>Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Dandamudi, Priyanka
><priyanka.dandamudi@intel.com>; kamil.konieczny@linux.intel.com
>Subject: [PATCH v2 18/19] tests/intel/xe_exec_multi_queue: Keep group acti=
ve in
>exec-sanity
>
>In exec-sanity subtest, validate that job can be submitted on secondary qu=
eue after
>closing the primary queue if the user specifies the KEEP_ACTIVE flag while=
 creating
>the group.
>
>Signed-off-by: Niranjana Vishwanathapura
><niranjana.vishwanathapura@intel.com>
>---
> tests/intel/xe_exec_multi_queue.c | 26 +++++++++++++++++++++++---
> 1 file changed, 23 insertions(+), 3 deletions(-)
>
>diff --git a/tests/intel/xe_exec_multi_queue.c
>b/tests/intel/xe_exec_multi_queue.c
>index 288ef9ed8..1449fa94e 100644
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
>@@ -329,14 +334,27 @@ __test_exec_sanity(int fd, struct
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
>+			igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX,
>0, NULL));
>+			syncobj_reset(fd, &sync.handle, 1);
>+		}
>+	} else {
>+		igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
>+	}
>
> 	if (preempt_mode)
> 		sync.addr =3D to_user_pointer(&vm_sync); @@ -376,6 +394,8 @@
>test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci)  {
> 	__test_exec_sanity(fd, eci, 0);
> 	__test_exec_sanity(fd, eci, PREEMPT_MODE);
>+	__test_exec_sanity(fd, eci, KEEP_ACTIVE);
>+	__test_exec_sanity(fd, eci, PREEMPT_MODE | KEEP_ACTIVE);
> }
LGTM
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>
> static void
>--
>2.43.0

