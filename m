Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536C0E77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 23:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E38410E972;
	Fri,  3 Jan 2025 23:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auOJ8meV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BBC10E972
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 23:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735947229; x=1767483229;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jy7P40SoeI/uXMpcnQzSXyjo++JMIscrCVQLiRxo6hE=;
 b=auOJ8meVuBkN1I0PSRTVoXZFltGD5bHOde84KVKj8J8VlN7Wt4SvZvjR
 kaiqtCUKlmD5xDcXeTXEi8ONQODY5lgMs7fLXlJiTKzWIpntBO55/XoSV
 VLgwemqXZuJ/RPEmIVJ4pr6sOx+yu3tWcbdh1h0FtyXb/hz6r6G0t1LMk
 wwY7RhCI0nvWoZz/P26jyqvNaStJE514apbiBje69kXG6UmL00X8wvNco
 kLBD2rzvfb1/peMKnT0ARL/7H83QtbQK2X4l7zyeO67mvwfkIATRK4l73
 kvK3eEeUnOcsl5yRChefywPgILC5EZl33WycCTdwCHud/2rff6S9vB4H3 g==;
X-CSE-ConnectionGUID: CFJrCOg5SCqVLfBvXXHHdA==
X-CSE-MsgGUID: x+U7g7pqSnOnHWqhPf3rtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="61567195"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; d="scan'208";a="61567195"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 15:33:48 -0800
X-CSE-ConnectionGUID: Q3xTH1fCTiqZlU8HizKx4g==
X-CSE-MsgGUID: YPpzUSTLQDeooyJgds4q2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132824256"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2025 15:33:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 3 Jan 2025 15:33:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 3 Jan 2025 15:33:47 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 3 Jan 2025 15:33:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ce4mybCrbNFuDUeTWJCAl6OCgGz4xyj7z4/ptv3q4b7jMbHKBM+tMRzV+sjk9Tr+DQWpMEF2+T2X8ysLLOn4HErBWTbcvVvv0z2hgbbc/vM3ZqBm7GfbNIQo3eyai6PKJ+vRs9GJ/pB5CZtXVpNga7hZUDMrSEByGMvDg/ijYuERYjf/kSY+uJF5yI8Roa1ev7iXCEGg1mE3pqG9ernEBDh4EiDSUy48MBFdx+BX8mr+pyszVARxFV29qgokHQK19snOp8sDmXag2lF6oLPGyLFv4Wu1hEVYR1WEvi73SZMvtaiLQf6CVQo4haOIbK/N4QG3zUeSsqUvKI2nLZHfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wbdx7Oj5reca/XYV23mdDceCWO2hvomFpH6kyV3+qtE=;
 b=Xcy9hwfAOrM06nsZdECM6IltQgS6zUCj3zPiawE4qSO6IzxrHVebiBMnMkv/haBRuyZ/B/EfoVj8wjxPHUCarm+AHWlbUvHpdefN+/QeEzQ2sH1qx+RzUEpbFyW53gV8TyIVurdITa6wkFAlZq9IufHIX+hD068AzMIcxmONAAkLxACTqTUGudZdKbv0vpu1wFAYMB6qp1Xpa9SVk4p6wwE1zpSmMaLE0b5Sp8UBaa0V/vtYFZs3GMnIjdQc8e/GFRGw9rOTntkOMomdB1aV2TVuC8I3CPZw0TSZpsYBHrX8PrIyod9YT5IhmRlNwF2tvRztZ0ogOeLM5iD6HYkpeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by CYYPR11MB8329.namprd11.prod.outlook.com (2603:10b6:930:c7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Fri, 3 Jan
 2025 23:33:28 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%4]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 23:33:27 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_aux.c: since procps-ng 4.0.5, PIDS_VAL()
 takes 3 arguments, not 4
Thread-Topic: [PATCH i-g-t] lib/igt_aux.c: since procps-ng 4.0.5, PIDS_VAL()
 takes 3 arguments, not 4
Thread-Index: AQHbXi6jHNPgksnQ7UG1meD0YlIejLMFqOvQ
Date: Fri, 3 Jan 2025 23:33:27 +0000
Message-ID: <BL1PR11MB5445B391A20BFCB58D2EE8D7E5152@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20250103222628.4069004-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20250103222628.4069004-1-thomas.petazzoni@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|CYYPR11MB8329:EE_
x-ms-office365-filtering-correlation-id: 22ece213-3972-43c6-dfa9-08dd2c4f067a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7055299003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1X2hkNqHTKIw04CNC1bVqVYWFqJx3KQYHZkmFa8rupIfSTz2ZDoIUpKvawSg?=
 =?us-ascii?Q?I8XT9PDlxyfmw/LCpw5U48l/CHJYTX1kaJPDyjFMyXqlsp3Acf9V331mgzw2?=
 =?us-ascii?Q?JdCarvS/GJChb7Nvx+gSHd4sgPlMy3ZZW1Q8KTzJ/pGWptzTtCi2kGwzIbYL?=
 =?us-ascii?Q?Bsbs+9+1Gj68PocaMf5yLxqXvRqUf8FfC5vJOLbAbtQFgf8bamS+5dfwQ5Ah?=
 =?us-ascii?Q?T9mtkQxoZixjzADQaKlH9Nhu+VCK17WEsxl6OkCCQr1gk79BiDdcMhLNIJ9A?=
 =?us-ascii?Q?mXk6DYZAE2qzHiOJ8w2vdlOD9KnHiaOCGJrQPU6DEObfWObVIByeQw8JPO1u?=
 =?us-ascii?Q?a6y/xuWZpIc1j0e04t6+Iv1V4vYaOU38lH6LtrCskFluPWdcbogHMEkz7mt+?=
 =?us-ascii?Q?pb4w0XLi81aHuF/GoZgaG/HTYfG7HPhs6+B2dflvFKQX+zsM6xaFr7/ysLGp?=
 =?us-ascii?Q?KWiRzuiMYvxMbB9zzXIgJY5CLllAyn03TRDSdCnlPofHrMuADaMIFELRIIgj?=
 =?us-ascii?Q?N6CsmejOpWSYXw+kquGojnL3k/ptxnHPSO7Y9B5lQKPRYP8+uSNR5u3F2Yzm?=
 =?us-ascii?Q?po2269mn+mNdmbO72iND63kLGYXmb9ZXU/XiKUg67Ay087nisBa61gO0YeE8?=
 =?us-ascii?Q?ggGSx4fmpcWM/sIMsWs6/u8Cv5D22IHSnZ8TC0Txe5CWLCMwGvZijwg/OE6H?=
 =?us-ascii?Q?c/LN2nzK09Um/0j6uqqMjPxM7tbd4PXAKKnNt7bFNzvvbGhBwHMeasJX+LUV?=
 =?us-ascii?Q?HFIk1tFALnd7uQ1x6eWrgCVGMNuEZZsb2+ClGnEVpptwkt0YgSTDnuFd9YTf?=
 =?us-ascii?Q?p97ia/OG3vBuJE8Ky4BxAOu3LvZ+a6+5UUleDR1Ab3TpwLl4X2d3LARp++mM?=
 =?us-ascii?Q?Z0i+jEEVgt4N6j7GthOiXIsdn96gKgGmOZQK2zWD90Pw0QjbCAKQGa7aZKd4?=
 =?us-ascii?Q?ApU+RMx2utiXXInMuynRpHgllbm171hzPX7Gyf85mP/iJ92Qu/x9OuUy1CV/?=
 =?us-ascii?Q?PlTIj6WvIi+j3XQ64VErak4FHJBACFJpw/6UEKV+7Y1PhLvsK/h4b0F0IFc1?=
 =?us-ascii?Q?+rZqXjfsK4H+upYGcEHcSwScjNpJIeT7AaPv1SkRYwXpenh+8YLCtdJz55To?=
 =?us-ascii?Q?5Eo1qspTJtj1UodAJtpvzisuPS4tMViCaiIR0C21SOcSQCRv7Ibv/+GgDBJW?=
 =?us-ascii?Q?QVsnq1mm1Bw/cOSeJIg851cl94gKfr1YHA+7a8Bs8cPEZcAQceEEWnoi8b+u?=
 =?us-ascii?Q?5YgWjeb2PtjkQaAFqirHVw4QYy5YhHXaV6pg9rrohSXzFn9yCnmvctcxBQFH?=
 =?us-ascii?Q?dM64VEarlWt77YEosRb3duCKQj/SHkWCv1rvsDgzrQuxRVjSbtbVM1Y2Kndi?=
 =?us-ascii?Q?7J5rA2h61WqwYp1uHQAYzhT/6L9QyC5kLA54DkXMWXwt47qT1MnnnIFHFOOd?=
 =?us-ascii?Q?53ofZMvblYKQlDNtYd9UdChpUKTkhn0wtNu7uVjh3AOmaDdHDWekokr2P1oP?=
 =?us-ascii?Q?dQS2XBzT3VN3Cq0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7055299003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4IUY8voDatAPnP4a0CdCtR2MKqyembozqhIQGdY0Axqb1Zz3mIisvDD/ofma?=
 =?us-ascii?Q?qW7krUN6ErpMZgaHnuQMvsBqoeqOyjmo9AQcZTByDrjvPlNz3hNUOgtbJOB4?=
 =?us-ascii?Q?n8SNBwxmWGztlfK5y+gMUFasTZMez+mJGIwJAGO+5yc9rOycklDFJOe/bEsf?=
 =?us-ascii?Q?2mfSn38yDVsVTMYRgPe0EOKiaJPO/a6r+qxKj8tEJ+lTdpVNXIZ79SJv9eJ4?=
 =?us-ascii?Q?u9c1Fi1SfOabbvM3KcmD7F+6i/ilcJl9A/CCUKyhm3h/1I5J80DwScitS4NW?=
 =?us-ascii?Q?zi0sjU0S8W/txlaUYZSy88NKscNHzw7MEMh4xSjMGXxhbF/q8Snzqk1BNncr?=
 =?us-ascii?Q?rIak+EFZ2lvNslOrEHbxE8gDD8WXyRgbPHahclJtkwUSWukefgP0qs3P8fer?=
 =?us-ascii?Q?1VoRp0hGPxD251QTA7vsFl5XnxaAyc1Yll0qE7naf20pAegkhle5OpfMrtvg?=
 =?us-ascii?Q?D3M3+PuzQuSykBjbk43uOzuqUMKp+xhz3vRu/JGXe/ev0YRSYzEcINt6aLZa?=
 =?us-ascii?Q?6NgH8ub8OzXf7qhu8CCpU8ruE77BEL47ii4cyyYlRdEXyT5TLly9Epqf0W25?=
 =?us-ascii?Q?gjbpg84DtmaQfXINHr8QL3Ct+GJNvNiYNaDPhmTk/avHnttJp6qn7sPX9Acu?=
 =?us-ascii?Q?IwoPE8ZyjbLnOURlswweiDXK6F6zZgUaGdLSKbh7SglWFOAjocFFF5EYGWU8?=
 =?us-ascii?Q?E06Gz66a275aBIVTuK/PvvGOVg9QKU7VYMk+GUDXwGu2yfHpZsJ12xuCrRzM?=
 =?us-ascii?Q?dCe9SiJ+3D8NiXoPuvokYwMIxRv6zeTme9fa1PsBu+coaop9JUe9oS+Na6XF?=
 =?us-ascii?Q?+KLWnFd8UPTjuGWBAhzyFpozm63J4wYgaTCNCymyfGfz3YghFtRnUiCJTWnP?=
 =?us-ascii?Q?2RkDZXMhj9NqmJzgLG+nqjJKPXP3/XsN45jhp3xLEmhFphD1DmrNgO41mSkc?=
 =?us-ascii?Q?GJ+JFzWcE1pqUiOOF1NXhOXIWcDD/JqsGzWo/G0Xikfb/ERMPJcnvVPYeIFl?=
 =?us-ascii?Q?MNYdaKsg2S0hQFqaH22a3Ioj8jlw787YDIy9+g8OP6hhvCLunSlHdteA2tAK?=
 =?us-ascii?Q?4rPdpqvhdLVMT0g0xfsNd0AXXCh+ZcejX5x9MV58seL8SfqVamSt+cKfUcbb?=
 =?us-ascii?Q?ji7rnx3bawO9DJd2wlwX3jYEZ3mnV5MrdNuBNPSCzJdF2/x5UQSUcTW9RX9O?=
 =?us-ascii?Q?ib0AFgjOLUkZMPllGts//by9kDhP3/fvUlUW9pipxo6/Y5fVT3C/qINR7ybq?=
 =?us-ascii?Q?R0ETY2hlkn7/1/cOaV3i6ozrHNV+AWLqGggsvt7blWmyz27fEx7AnL54FnmG?=
 =?us-ascii?Q?5rRw4TGdlaTb0wz5vXnP62gLM7+LtJUSrxgosNefKP32STpStkVzYaUQXTqK?=
 =?us-ascii?Q?y0/yX0VbVOPrRiGQTdI/LdbJaUZtQAV4/FzDhbDUhM6WpaJyzTvJ/0RhFZI0?=
 =?us-ascii?Q?FOGpE3SG/waVRhGt/9XzlU7Vai5JpYgq54B7rTgufImnfW4RFtbP+yIqQzED?=
 =?us-ascii?Q?zYooimSbCWf1w1mvdB2ii6scMsSTuXsdhWGkODIrHJqQXWweg79qqqRNAkXS?=
 =?us-ascii?Q?nyIfVaORTTI2H+L2am3Rw42OCkRbyuV84ozDYIqt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ece213-3972-43c6-dfa9-08dd2c4f067a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2025 23:33:27.8689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4HJgO3TJgZHSmTtBeksZ28Ps8hU+4elfC1NA/ba7/QAVHxjNzwAvMgX2kLPOU5RrRo84x4E/esqTGaCTdixDo2TCg4HpwfkXZzMeab4dHS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8329
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Thomas P=
etazzoni
Sent: Friday, January 3, 2025 2:26 PM
To: igt-dev@lists.freedesktop.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH i-g-t] lib/igt_aux.c: since procps-ng 4.0.5, PIDS_VAL() tak=
es 3 arguments, not 4
>=20
> Unfortunately, the API of procps-ng has changed between procps-ng
> 4.0.4 and procps-ng 4.0.5, with the PIDS_VAL() macro changing in
> upstream commit
> https://gitlab.com/procps-ng/procps/-/commit/967fdcfb06e20aad0f31073474cb=
94545c9bdea5.
>=20
> This API breakage has been reported upstream as of
> https://gitlab.com/procps-ng/procps/-/issues/366, but in the mean
> time, the build of igt-gpu-tools breaks with:
>=20
> ../lib/igt_aux.c:1358:78: error: macro "PIDS_VAL" passed 4 arguments, but=
 takes just 3
>=20
> We fix this by detecting the version of the libproc2 library, and
> adjusting accordingly how PIDS_VAL() gets used.
>=20
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  lib/igt_aux.c | 7 +++++++
>  meson.build   | 3 +++
>  2 files changed, 10 insertions(+)
>=20
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 3407cc4f2..f5bf48da6 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -1358,10 +1358,17 @@ static bool get_process_ids(struct igt_process *p=
rcs)
>  	prcs->comm =3D NULL;
>  	prcs->stack =3D procps_pids_get(prcs->info, PIDS_FETCH_TASKS_ONLY);
>  	if (prcs->stack) {
> +#if defined(HAVE_LIBPROC2_POST_4_0_5_API)

"HAVE_LIBPROC2_POST_4_0_5_API" works as a name for this new tag,
though I wonder if "HAVE_LIBPROC2_NO_INFO" would also work?

I don't see any other granular version checks in the meson build file (at
least, I don't see any that aren't strict version requirements for certain
dependencies), so AFAICT this type of tag is fairly novel.  So whatever
name we end up choosing may end up inadvertently becoming a=20
standard naming convention for future tags like this one.

... Well, assuming I haven't just missed where the standard is already=20
set, which is fairly likely all things considered.

But again, the current name works, so I won't block on this decision.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +		prcs->tid =3D PIDS_VAL(EU_PID, s_int, prcs->stack);
> +		prcs->euid =3D PIDS_VAL(EU_EUID, s_int, prcs->stack);
> +		prcs->egid =3D PIDS_VAL(EU_EGID, s_int, prcs->stack);
> +		prcs->comm =3D PIDS_VAL(EU_CMD, str, prcs->stack);
> +#else
>  		prcs->tid =3D PIDS_VAL(EU_PID, s_int, prcs->stack, prcs->info);
>  		prcs->euid =3D PIDS_VAL(EU_EUID, s_int, prcs->stack, prcs->info);
>  		prcs->egid =3D PIDS_VAL(EU_EGID, s_int, prcs->stack, prcs->info);
>  		prcs->comm =3D PIDS_VAL(EU_CMD, str, prcs->stack, prcs->info);
> +#endif
>  	}
>  #endif
>  	return prcs->tid !=3D 0;
> diff --git a/meson.build b/meson.build
> index 8b2a2a64a..f3e645c4d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -139,6 +139,9 @@ if libprocps.found()
>    config.set('HAVE_LIBPROCPS', 1)
>  elif libproc2.found()
>    config.set('HAVE_LIBPROC2', 1)
> +  if libproc2.version().version_compare('>=3D 4.0.5')
> +    config.set('HAVE_LIBPROC2_POST_4_0_5_API', 1)
> +  endif
>  else
>    error('Either libprocps or libproc2 is required')
>  endif
> --=20
> 2.47.1
>=20
>=20
