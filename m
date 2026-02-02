Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54034D172CC
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 05:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE76E10E103;
	Mon,  2 Feb 2026 05:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gh1JhutV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7631B10E103
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 05:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770008939; x=1801544939;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fp9KuKaVfeFPokHe4qUGfzwc0cZD9Yx7Pvfn34FWosk=;
 b=Gh1JhutVgXF7umGcLlXXn3X4VNelmji88b0FAEoKvzmo1BtsKwl0o/1C
 aMUjYcX9HJMkBvhqAK510KehWXXG3B7AuFvTDKd6H9h1xTxpGSGUMeJHR
 wG3iToCDiDydeFNwTvYTfPwwjrVpQb9bw5BgZFMBSrQwsD0eN+pFXniWv
 qrkSyTx8MOHDN+K6GPcopZ3270Uvg8iJPOQq3ObcMUy5vcSBKiaGuX4x8
 jGqawhcBPEYHDN20RVOF1qxTGeVQWqeBYGNtpuqVv/hlcj20Iw5psqUql
 k38gtf6xl8+5wUR/43O+v3DoNNXTEaJoLsfx3g7INalnvW9ayG9BZqu5z g==;
X-CSE-ConnectionGUID: +VwKgygMQnWj68Ne5b9Gnw==
X-CSE-MsgGUID: zrv0jggASn+ZDmCFtEc++Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="58745009"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="58745009"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 21:08:58 -0800
X-CSE-ConnectionGUID: D+DVS1WSQq2Ai9v+drFwkA==
X-CSE-MsgGUID: O7kad5t/SHCvDQd5zGXvQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209205375"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 21:08:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 21:08:57 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 1 Feb 2026 21:08:57 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 21:08:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0XGM7yuuZ+Q/VMZG9Mwrzwf3xI5vfAJoCrCXXmzX6Sj9Q+JCF2LDxpz1KqZvyEsZtlTtQuZ6juULVsAMlAd2QTyGLqmclExerdwEFDTpRzvJKIyNg+3cuMQmtjNUFqGXOw9HsjGzZihPEDaipP+E3YEnc/RmqoGzWc7inxzse+gBNDVIwCsxhKrxvLFT23o+T6CyJ+hlHgjnesETGZ4eFNcfymXgHcPhQhYGFIMo5PNmtd2FaAm3l1Q7yXHnVO1HP/duFJwBerdLYSHyDxOJEJQWRBiIXW1ZhI+PGpS97/r9VB0Qbgm50rnlBS+40P3Gj715+f86C9HmZjVzFeSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXWCk4/K7NFGyt9alhbSk6V+ontkmJBnJhv5NKAVbgs=;
 b=xGJLwScnCyNtuZkEI0PO83vgjT0NXbbODfoAh1g6udRibg8La8QMBrsixB41kIiEqyGOdCZfyrPIsv7MPOOXLvVPSteEaXtFZIpbyWPbpcYM7/pDnV4VPXsBGk+otGFhsvHXtaHNpCZhjV6D60tswO9Rm9wwjlmujbZX4CHyXyxLY7PnfNBMhmgC4UKfzC88lsUcHfUM+vS/PFY00gWTUN+bnMFdk1PZS51i6AM92j5xAVOUWHFQ0CTNK+jw1U0NEpAeGWeu9+PR4c5XIHbU57fzvt8rcOj7SHc1uokhfkPxDczb+HYshVE+KZVR3vfzXa9a6wANJr9UszsH+N1/SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by DS4PPF64C459891.namprd11.prod.outlook.com (2603:10b6:f:fc02::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 05:08:52 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%2]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 05:08:52 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
 invalid_fb parameter
Thread-Topic: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
 invalid_fb parameter
Thread-Index: AQHcj0MzgNJJB/6kHE2kGRyU5XzyvLVlroQAgAABSQCACTT0EA==
Date: Mon, 2 Feb 2026 05:08:52 +0000
Message-ID: <PH7PR11MB6796A4DD3F1643D9DF673F17E59AA@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
 <20260127043233.254107-8-sowmiya.s@intel.com>
 <DM3PPF208195D8D473384C8865D18E79369E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <DM3PPF208195D8D791E83C84958C85F3423E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D791E83C84958C85F3423E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|DS4PPF64C459891:EE_
x-ms-office365-filtering-correlation-id: 0a8d2dbc-77d8-400d-3dd9-08de6219286f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lGfpJ5ERAMN3w8QVYg6JZfridcbn+K0FlrXg38ZRksOmwv9a4DqHUgT3r90Q?=
 =?us-ascii?Q?azGYlr/oFZ7AzpeZ3Bs05qwgW/3IKlYSiqZf9AhdtKDwjnUPJ/5R9izL8IpH?=
 =?us-ascii?Q?Y2wPQGJsY1M6scvA3zO5sctkXrvcXC60N6+Hu8/OOZiIjdm0XvdMNWE66OEc?=
 =?us-ascii?Q?F4TRyk5znRY+jMUrWu6OU5pG2elTU7Dr3zOOr02vwt7khcMnMQ8pNefDlssL?=
 =?us-ascii?Q?6UYi0WRKDk3fhDPSMT1ow5qDQ3VGKFQSS1V6ZAbwgteo/hIYBYxcTX/7oeMK?=
 =?us-ascii?Q?uZrSmuG1DV1zbB8gFhRGFT3jMgyYkDj1Yy8MN7r0PKOT3FQY5/bjL9FRjuKJ?=
 =?us-ascii?Q?+IGb5VX5P1Pwd9VSybPNadgGnmUoFnlHIY9DfE7e5aC52ylb1I5uEhgoDaeg?=
 =?us-ascii?Q?Mss/AoNACTRU1LN49E6ExgLtOS+AlnWOTtPIOTwl4TL7hXdpsS7oX3ODzk9v?=
 =?us-ascii?Q?I2IMJWkiwOyZ6KZqRZsZzREcoIIjMzE4jZlXR+Y+Ugq+5890JQWJX1mVwt2e?=
 =?us-ascii?Q?Xq95Q0ibL6BMk0OqxXpFpzCi4G74Ym3m8aXrKEfc+wxgeWCv4olswnDkEjan?=
 =?us-ascii?Q?Xm+AzGDIAWgTz1fi3KS6yl1jQNxYB+LCXmiLxrfv79REXkZ2bhN3UL3qWGuF?=
 =?us-ascii?Q?moKAkEI608/6qj2wG6bzZ2G4rL+tDYeJtO/c6VYX7kiGRTETFCbggkaNGH7I?=
 =?us-ascii?Q?nm7tNscVQKi+BHc2tfbfH27JiUto0I71sYHfdLWyUwg1nCtLj/9UAVGp3RTd?=
 =?us-ascii?Q?yVKoBdQ8M+TijRIKS4g5EAcSNq2UMl1/zCM+T4rODpYr5hhdW3R1OdcxMTlE?=
 =?us-ascii?Q?GZW/wWDTSoDSVPTST9lbpULJU+ed8/wtjw/5XdkkteD03QGaode7PjFX+UgI?=
 =?us-ascii?Q?DDbwZ50NeNrGp6sOXmQqBoMo8y85ZF2vdhW3n370Mn7U99gxlXuDeqnkb7LD?=
 =?us-ascii?Q?ih5ggiVfLytvquDhmlMTyBhcr5TIfU5lwJEh8Qo+4VdBTSrA0wcwB+P7x0cl?=
 =?us-ascii?Q?VB7htWvoE/Lxw6Tylts6Ui2AlkQppLPXXw73J0LUNYdnZzentRhHt+PgAC9m?=
 =?us-ascii?Q?2qGopLYevN2h461/uXWsBPW6K8KkLcZuZE3POI8w5/KwQqt5jN/j6IsklXra?=
 =?us-ascii?Q?RSf9MwFI6YxD+DDOatPQjke9QKieR+5bu+cfiEdG4axJYemhC29i5V3cf79e?=
 =?us-ascii?Q?KTG4O7qzCKd+EUFJPlPaM/vVCc7cTfH/Dr6M6nTi1iuDQpjpCF05RK8xHh1U?=
 =?us-ascii?Q?g1LGS33850aSkvRwOsxHogQ87eRoaN80PpIK2HIc5XWLDXseUQ7d76Rlbqu4?=
 =?us-ascii?Q?2UTn0gk/f4ZF0KR1HMZ7CKVpTCVAluGgHNVlvrCGJgSDT0M3smoX2AqiHuM3?=
 =?us-ascii?Q?YyV7LcGvFqRCmVk7FEofEc46QDkkHZLbemVzBLmd9dnFnYOMZ7uYqMjcSSf2?=
 =?us-ascii?Q?8dy893cdsblIgGw4pIyk6VyxzX/lbgLmmtNDxNRvom4Bkwef/bvlFXeOCeKQ?=
 =?us-ascii?Q?V6vOU4QaOkyedUcpdfTzdoKOeYUgMgCepa8BITcNszmCAQdePLwMztuYdYsm?=
 =?us-ascii?Q?ukFjA+D4WwSuG/efZapc5AX1sMmMUtN9Wb9pPxuW+NrR6+ugiDnUcp7rzkxW?=
 =?us-ascii?Q?dGQ+zp3V68vRL0MY2K/EPVA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xB7K9rIiYytYZ1DcB6EoOA2EegUjqGprbT0DVL5IwYASchYW2VBO8ISYpgTU?=
 =?us-ascii?Q?788WAiaBLWetFgI7kPdEr4Goc+Nhi4vwdtjVIlGGcTYtDTb8ITwMZtPX6N6a?=
 =?us-ascii?Q?xNL22IzlOR3xw3rscggq2FP4adKB34q67rsGNZxWaxJ0zuuafbrJxpIuRPfo?=
 =?us-ascii?Q?N7+mIQX1sOU7IKfYJZJXdZIcepI8O1febj5YQu36ZXThHsFgcIgfq3waTl6h?=
 =?us-ascii?Q?oBQcinS7ZXph7twTnlvnhUgILUMWUAjw6uwYNhcSF1BSJS7Ve1ejc7igqOQY?=
 =?us-ascii?Q?YLwFw5JT36PhYX10JxGF8zU8SXBdzkkaa+GfIRo3oXMRvLF0+xh++cgdQakv?=
 =?us-ascii?Q?g/u3YiuBNhJQIXGCs8sipTlWdh2GNTruq9cmCBIIrborgR4xkYP8VjaVY0jR?=
 =?us-ascii?Q?9alfgid+OUehtou0yZKylck/5o0y+45UtWgvLUR5U2DSxYLr+QU8XPkrk79B?=
 =?us-ascii?Q?C7Rv4DA/6Iff0OJ7fx2BOcg2d2ZGn4pADlH4djGDPuLoSggiXw0gRk3wsPcs?=
 =?us-ascii?Q?8THcK2vSvind7+MhdiKK8Xkt34P/Fzrea1WlUIxFCa59X+lNtXtQItlHPphw?=
 =?us-ascii?Q?roA5ianEUT4rm2L7nPmWsERwfzhOu2PjI+rILykjC8kPrBE2OKdWGCo37/tY?=
 =?us-ascii?Q?Js6Eqg0El5SXCOwItzxy457Z7Baf8EE0MeHqAW5LBe55u/G01EKoyIebm2z1?=
 =?us-ascii?Q?iP7iiZYjfSEQ+6adYT/accR85MPRFhalOAHTzZrlvWGqB+TRNCDnrZxGnqAo?=
 =?us-ascii?Q?GOk11Veuw+ujyxPFf3s0PGYXH+rF+VtAd8MViVJ2qAHvRX8i9ZEIeTXE0yfs?=
 =?us-ascii?Q?zlg498Q6Cm9afeaOicdBpr8k5L9rhyIJld+IEzvpTK6T8U7CWfDJMX3gCcLo?=
 =?us-ascii?Q?bZS2GIiwCjqe1wpQR9Jy/k8l7BxDgXhL9VhXgrJikruMPJJf64rDyIDG2zex?=
 =?us-ascii?Q?91o8yTXhZBDJmIO7OAzy7HAuLZriG6PK/qFm75AhUpjQ9/8F4RFhessIYfAn?=
 =?us-ascii?Q?VXCUMv8lVItTnHdUD2wwuknBkvBaXiWI11rPKbUyR71Ow5dpQDOyQQ3BQzqm?=
 =?us-ascii?Q?oNYA9Tz+PkOHC/9jCpvQmVud8Ufru/xaqY3nl7qHk8o6ILOQqQtGVqVKV0fQ?=
 =?us-ascii?Q?9rw3Oz4GsFOMOcq8AWTRruuDbBZAR/7g4ng5bkC54VJgM7Wqw0cro/6NrL14?=
 =?us-ascii?Q?1qYE9wKLx5fAMDtmUBgyeTjct1m+BedkNtYIFaJGIIWqQUOB4KIScf95dGcE?=
 =?us-ascii?Q?u3QbMdsJ0WTFcyHh2H7eCfsmISBGgw+VQWqD5WPBnQAkvLZgJJTnyByXNnWU?=
 =?us-ascii?Q?qyPV26/bRMylsT3/dx0eTMB+cqUR0DjuOmrQi5ZZ4fKXrviYK3XuAvMUBk6U?=
 =?us-ascii?Q?u4jnY+cl75iiwNnpw/cFM5WAw2L7+ECZjXQhOFqKPzPMOYez3fWRXf47iRRN?=
 =?us-ascii?Q?DkIU7vRa7G741VOUx9alWTdHc33Ufqssct+FxTzw2/gI2dOAHm8GX6Mq/7JK?=
 =?us-ascii?Q?4I9JPjcRuAU7RXRCYnVAXHK/Bp/toYXeZrWxxFp0uaemccONpUV8ZPccv7xl?=
 =?us-ascii?Q?HgEKfoerpEdlaA26D8YiQwo/NCAfUZ9l5iJiBbVHl2MVLwtmcJGJHoQKLQde?=
 =?us-ascii?Q?D1Co7OBDxkxkGUooT7U7TNmNkNkfsOTcRoHkElTbAX46FqnUwUbxfCcV1N14?=
 =?us-ascii?Q?83jrdFqJwt7acIHBmCNRPmmoFJBCZaJue6YWmNeaS19jzujM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8d2dbc-77d8-400d-3dd9-08de6219286f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 05:08:52.4833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 97IybxqG7OaagZnEafWqutQmsNFEJPVvqv8ZMRgQJtrKuNbFMnwpJ0nzVcJsOcol7lcyym3bpHPmP8E5e/m6pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF64C459891
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

Hi Suraj,

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 27 January 2026 14:00
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
> invalid_fb parameter
>=20
> > Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
> > invalid_fb parameter
> >
> > > Subject: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
> > > invalid_fb parameter
> > >
> > > Remove the invalid_fb/output_fb parameter since it is not used
> > > anywhere in the test. Reuse the fixture's input_fb for both 8-bit
> > > and 10-bit formats to simplify the setup.
> > >
> > > v7: Remove invalid_fb in a separate patch as per review (Suraj)
> > >
> > > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > > ---
> > >  tests/kms_writeback.c | 12 ++----------
> > >  1 file changed, 2 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > > 58118b8da..8d5bf5294 100644
> > > --- a/tests/kms_writeback.c
> > > +++ b/tests/kms_writeback.c
> > > @@ -297,7 +297,7 @@ static void test_invalid_parameters(igt_output_t
> > > *output, igt_fb_t *valid_fb, ig
> > >  	}
> > >  }
> > >
> > > -static void writeback_fb_id(igt_output_t *output, igt_fb_t
> > > *valid_fb, igt_fb_t
> > > *invalid_fb)
> > > +static void writeback_fb_id(igt_output_t *output, igt_fb_t
> > > +*valid_fb)
> > >  {
> > >
> > >  	int ret;
> > > @@ -706,19 +706,11 @@ int igt_main_args("b:c:f:dl", long_options,
> > > help_str, opt_handler, NULL)
> > >  			    (!strstr(igt_format_str(test_format), "BGR")))
> > >  				continue;
> > >  			igt_dynamic_f("writeback-fb-id-%s",
> > > igt_format_str(test_format)) {
> > > -				igt_fb_t output_fb;
> > > -
> > > -				fb_id =3D igt_create_fb(display.drm_fd,
> > > mode.hdisplay, mode.vdisplay,
> > > -
> > > get_default_fb_format(&display, bpc),
> > > -						      igt_fb_mod_to_tiling(0),
> > > -						      &output_fb);
> > > -
> >
> > Why delete these lines this patch is simply supposed to remove the
> > param invalid_fb since no one uses this All these deletions go in the
> > next patch
>=20
> Actually not the next patch but the previous patch and this patch need to
> move before the 6th patch
>=20
Before 6th patch we have 2 subtests for writeback-fb-id, so refactor the te=
st and then removing the invalid_fb seems to be an ideal way.=20

> Regards,
> Suraj Kandpal
>=20
> >
> > Regards,
> > Suraj Kandpal
> >
> > >  				igt_skip_on(data.dump_check ||
> > > data.list_modes);
> > >  				igt_skip_on_f(!(data.supported_colors & (1 <<
> > i)),
> > >  					      "DRM_FORMAT_%s is not
> > > supported\n",
> > >  					      igt_format_str(test_format));
> > > -				writeback_fb_id(output, &input_fb,
> > > &output_fb);
> > > -				igt_remove_fb(display.drm_fd, &output_fb);
> > > +				writeback_fb_id(output, (bpc =3D=3D 8) ?
> > > &input_fb : &input_fb_10bit);
> > >  			}
> > >  		}
> > >  	}
> > > --
> > > 2.43.0

