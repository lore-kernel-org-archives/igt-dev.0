Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BD2C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 07:13:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB0210E193;
	Thu,  3 Apr 2025 07:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6IMiste";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA5510E193
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 07:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743664389; x=1775200389;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FmP07a2p55FnJ137CRw01Qp8gVk+gtB0CfCOOv+c9f4=;
 b=k6IMisteaM4VqnC7U3gm2DeOHxxYwbUvPBPW155cTcPqcCqyEty4b7w0
 TJgqcKm8NB8O93Q8Q/m+YqLW0jH+PwpLDXB3AHPvdFjZW71zwWoH1Dm9D
 7SU30kX9wlOIngroBuMTilRZEYTAhPypKao3tnn7efasfC0WA2oCG6BfB
 o4bYdsLzctj6wf5qOP909Odbf362WpB/NArcAXFMUfbYLcEI7CxrOfJrd
 d58Ia1Y0JQbDtVN2FkNWDEt9XzGNngF1WpzEeYn3vhX+G3T/OM8Ev7Gh8
 UUm7VpcHe/ySDLUms/KQkSFyrVU0dmKwZ5g3UUWjBFauC7huVG0mP1U0+ Q==;
X-CSE-ConnectionGUID: wUhcrihnQ9ymTJIw7QHAZg==
X-CSE-MsgGUID: hEN/vfVEQJSQ1+6hhW450w==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44966908"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44966908"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 00:13:09 -0700
X-CSE-ConnectionGUID: Y03xWNI4SSSXvaTVdAtQMg==
X-CSE-MsgGUID: jPVfd0jWRnS0YD/8dZeZmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="157879087"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 00:13:09 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 3 Apr 2025 00:13:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 3 Apr 2025 00:13:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 00:13:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7eQnZQKC56aszKDH+JBLTJPnwH91RwhANuuC3ICKc10zM/NG+sER7ZTsnzUKiGPtVaXXOcA++eHB3wgAIg4e/S26wy4yPbhZjc++nDeCpNXl63OiGS6XNXUcappT7tUAxGJURzXeueahM2UsJcD+JjJDZ1UAVvVvu/+NL5zVvRDSp8fc79bDJewXqZprhYVGy5XBW6B7ynNwWE9cmYfDq9tJPtPJ6D7dBDsT6K4sPO7BZ+luD+0DTfFYz24bLs4bCYeeoQNiRcikuE0glHcjX9cFqahrkT10jrbhDDARlj3lkbP435lwVPLzhJzxHJnSorgGGEL/1HK8nLkxD2MSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQvhpHAyBOaJJOiS3P23b72OKSMVcJtIqpWXGhhZIMM=;
 b=wpl+nsHfYur3cnFSllsSbjJ8fahR3EnTlXU6xC1WZ/nGdEfdDXShmqJdxhVYWFYC8Ax3ygKykR1ToluzkamWh/8h4EkcDxaqo2gwRZuqLlkf/xWMwCPxDxDs5gjSiFluxhD/9NEMISze1O6TLBgKL+3R0zDsGB9Yih3o6WPbLPzVBNnVHKDclff+8a57ScnBgcDvIJSwrjpDVlrZk1BITRP0deBJwgIBRq1/SWVxGbON9vhbF1mWT70RuVk9A8sfFD+ZLpl1XtQwuFkAVdFv+OpwWgYOOMKGHnMKAupnQRJr2TLTsfxXbkb8zvotml/TjaqvAWg0WpbVqddBWCNh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MW4PR11MB6811.namprd11.prod.outlook.com (2603:10b6:303:208::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 07:12:38 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 07:12:38 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Lankhorst, Maarten" <maarten.lankhorst@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_universal_plane: Fix fb count mismatch
Thread-Topic: [PATCH i-g-t] tests/kms_universal_plane: Fix fb count mismatch
Thread-Index: AQHbo8v3gK5Cbas1PkWWwIbR2r7q6LORhq2w
Date: Thu, 3 Apr 2025 07:12:38 +0000
Message-ID: <SJ1PR11MB61299231F80E0FC8755DEAA7B9AE2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250402123218.106520-1-nemesa.garg@intel.com>
In-Reply-To: <20250402123218.106520-1-nemesa.garg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|MW4PR11MB6811:EE_
x-ms-office365-filtering-correlation-id: 6564daa3-4672-4dc4-765b-08dd727eea6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aINkWUdTMEzjfn63GxQNcvsEa8EzyILV6ZIaDpKs5diyVv8CrG+qsIr3yTza?=
 =?us-ascii?Q?d0Z2H/tcAjwTrfLPyCos9ANabnx1M5PVdhlIm8u8HRznv8KV3Lc5uI86fqpo?=
 =?us-ascii?Q?ErT+e3FFk5k3wH5nb+Jb8KGuMMvG2Vrd5/cUEm/yYnDN0Lhax+ZDDgtISql3?=
 =?us-ascii?Q?BQaAyG8y5R+UstN9m0tBl+0v9r1Gd45JaaJG5JaoWXvTkmYJyxWugyVE1CEX?=
 =?us-ascii?Q?jUJjGLMmKcsrzAiFkhZzZBzzy2jExUION8bbwknwnh7LJCXZMIT2nH5Bhz94?=
 =?us-ascii?Q?y84b9C3nV4/Ch0zEJtRPNqJZZlQyJWySpQpQ5mVs1Q89ykCB0XzgDhDnvtgr?=
 =?us-ascii?Q?yHa5M2cbDc4M/JE727NnARqmMUHIKmaXhigzqW1Er6Avz4L4ZCXzDcjkXwKy?=
 =?us-ascii?Q?LvhgGYv2/F+88GYuwvw/k7CqPbXIzSR06Wp1dEvkJ+XWBt6Hb+wa+6osW0p3?=
 =?us-ascii?Q?4VgaODaLbqMK6Swy294y5TMKmE13ti9IvuWRXIfIGnVk3kFCs304r/vpT3xu?=
 =?us-ascii?Q?5tP3kiYoi91phNCqcIfqFNXd9pMMraA/NOhKetWlD7DSFTiotCgWNFrR35qo?=
 =?us-ascii?Q?bZATa/RxkZFAXIMI0df7pqP1PZgRgUbBjoJWgqR23vrzHGyzIivOFe1vX5H/?=
 =?us-ascii?Q?Kr+mpJh3VJvrxsFccXxoKe2vNyuUPFf+lO8SQ+Il3zyMY5QtRbm122tJMCgC?=
 =?us-ascii?Q?lWvb2HZU5QhXn8zLGozv1rPSjNJ4NiDoIXSDE+DKd6zgIOfoWentJbHpEps5?=
 =?us-ascii?Q?wYvISUR12x//uRUDCEkcbckVwBdZjB9U0K+eEeYLuH/w+BW9rlECbkY2S2Ox?=
 =?us-ascii?Q?roqx6QnFMbsYoEqRDjg3qYS1gnQQOguvJgCyD71rQ04Ogh3Ki7mz0BG5M10D?=
 =?us-ascii?Q?JaZd5oNJz20X7nUzWqXDjtHkAbcrJUn9IwTcBdhl7V5FQmzgH2Xx85a9K490?=
 =?us-ascii?Q?8/LJJI0M0vMg6AHm1LQdjmZuawlB6MqjCVZxLqVMTpIkHS2ozGZM/WyUXY2S?=
 =?us-ascii?Q?Rylzt58TcHF33gM1/Y62UZaPDS29vBgaDShAQGUvTIykvXIbKhtslR57DyyN?=
 =?us-ascii?Q?WyOCUcmcgnWdn1ScnIQT5jGePhk/PXl39fQXR0En0Y5TyQ+mfif++FldIkqv?=
 =?us-ascii?Q?WsRrJ2OEtScBFykaeEKINqeBhP9+j1jux3mIMHSNmeTwKHgf1mg/QCtPUksz?=
 =?us-ascii?Q?B2exNqGfAQvhLl6Wt3SmIOWxC+w70qKuWw0P/6InTXEN84xKAYuOD76zlYs8?=
 =?us-ascii?Q?REhVDB6eiYVbI0P/oKxcHQghNiDJlR8g6IYKeeZfKuHJTpv3JEI93HUSVYjf?=
 =?us-ascii?Q?D8NMIylPteS3DRC5UY5bVQtcDE+D6dkrq5GIsF1MtnSZol28hXNQFnHKynou?=
 =?us-ascii?Q?M4esL8SONQCbzXLMsP5yij0vKBqjUWRITqPNP07fHuz1SL8BV/i4or40sc32?=
 =?us-ascii?Q?mLTZBXuWR5rtTR2F5OLUQHxpVSPxZx4Y?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JE+KK5ouBjeRbq+vD5z/0HR+4/ev6ofHE7wNmPayCBddjgJ16OOuoZm+84KR?=
 =?us-ascii?Q?IxsP5F+raqdMCIqzfvh3+xoTWc3SnyFY8BCrFNAWCN4+0humPifynTuwcVsr?=
 =?us-ascii?Q?rSELxK+neMHiMiT9Xhqr3lkslmBYkpwprjAkolHhBpXkN/sNLs1Ibk5Mad78?=
 =?us-ascii?Q?h05fVFePF6xYh/5xu5/Oj6ZdBjCTByRzYt3sgGTsfEtonH+1oDBTOsUbtewX?=
 =?us-ascii?Q?8EPr0RsWxBm4UZsDbnxBmngfToVhx6t3P6GPJrpXIurqXHjwR7ndA50YJo/F?=
 =?us-ascii?Q?SmlBOeLYGtUyscmesK9SBp45WQ5OwPt589ham6lOHnHKZ3usHPU1kgNYUBAr?=
 =?us-ascii?Q?J/QbK6RR0mykaxlSwHjafBHYpBd2hm6AzGH7AE06PA162PoVsJNjghKyWEwy?=
 =?us-ascii?Q?R8NzUeX9Pnh0JDPFlOOqPj4AFEDyUq2uen/ipmXCrBP77Tg5AUQISG2PN6+q?=
 =?us-ascii?Q?uKDCo81xzXOKSpD215FnfLUvqJ3hAwZ9OhR3IC3owvjfZ04GZCdkda2w9vwl?=
 =?us-ascii?Q?gcHEmuda9ju301OSIJT94Pi6cvFhfVsLaJvOJWQU5M8Z1Vv3uykLTcfEersJ?=
 =?us-ascii?Q?/ZIdKqW0XsRYfSP6L5PWWqzZpn3lfjlUbRaHyYjVvSQ7CT5AZ343MTyr6PM7?=
 =?us-ascii?Q?OTXpsoMrfhigVSpT1Rf0jbXPT4p82AF5UXVqKdw+BvEJq+LMqignJHv/6Gop?=
 =?us-ascii?Q?aKbJhUfP/jBf74ZxsHd/hPKPfxRqgxnaghjm17f4NGhxnvfFg9Lh3i8ndP9J?=
 =?us-ascii?Q?IcrVGbukVGhdeXX0/P4p62A65GdKxHPBRPB5rfqwQKwJ6eqxB+NSbgRKSbn9?=
 =?us-ascii?Q?09xIIyRI+pI85+folVS3Ub/XuIAPzedKPIVQOF6Pj7/wH0f/FtvQ6eBHAkEA?=
 =?us-ascii?Q?QO5aeSmnBr3ohcLkK2VViS97iiFaOMkjQURSLZ7EEc3pivz9o0jkYtjUTd3Z?=
 =?us-ascii?Q?RT/gh7kkro9dnC+vPK4FK470EIChxZWedJ1+Hr9+dpeseVyEvt5X9N4tG/jU?=
 =?us-ascii?Q?32P1CN0tAFYh2YsW7Iqta1FwPlOzWmUaPLQv6NZyisjFifdIGP+RLiHNX5y3?=
 =?us-ascii?Q?2r/maZ+GLlwg84uztNycRGpJ7trOUOwa8qp2Om63tJcP9kQWRRZTPsBm6D8p?=
 =?us-ascii?Q?NRCvit7qbqpQ7EKso++cKiHseGfx44/yfY4Fi3sBwnWTAfxSUfE8yTx07AZT?=
 =?us-ascii?Q?ZvWrBRRqK7/niLhUhRC76kvLGCR+uhifR3T4W5KMV0FbJ8Pf3fTzYKWyq26/?=
 =?us-ascii?Q?uTf90JukCbH9b8zj0xFSVMzyXAZ6ioLztVc8L6xBITkyLJqgBB+svAmn5xPh?=
 =?us-ascii?Q?+EKGQKTjNT1FjvnPwy+t7SYWhpxlRQcOOODgBjG8pusreyMu3DChVzjCuOUJ?=
 =?us-ascii?Q?J07UNtqD/mgqSSGfFz1j1Qae4p/5+RXctAjvxgD8T/PkuRXgP+dqij9G7Cg4?=
 =?us-ascii?Q?i3OCdqPc2S1pbOO0qjcfMUmdqtYBliP7hLjud/7q9NFsSs5qSMctKdoO7VMG?=
 =?us-ascii?Q?SdPF/JzULkMdfUGrpPa9WqupR9Mx0ppS57ID1s91f+fDolF7BV6WftCBW8zT?=
 =?us-ascii?Q?cs/uHk+WykyVjQGvopMym78/yaxBy8rd0cgIk6MbuIrOvBMS8CZ4K9zGPTKP?=
 =?us-ascii?Q?0Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6564daa3-4672-4dc4-765b-08dd727eea6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 07:12:38.0474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: goagC77ysqBY8a04ogbzXWqB5JYaJFW361xHzDbZne7aAde/bQ9Qk8Yf05U8QltbN+qsNK2x73DN6bNiLYtAW9971z4CbE2J1kmEa2ljVSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6811
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
> From: Garg, Nemesa <nemesa.garg@intel.com>
> Sent: Wednesday, April 2, 2025 6:02 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Lankhorst, Maarten <maarten.lankhorst@intel.com>; Borah, Chaitanya
> Kumar <chaitanya.kumar.borah@intel.com>; Garg, Nemesa
> <nemesa.garg@intel.com>
> Subject: [PATCH i-g-t] tests/kms_universal_plane: Fix fb count mismatch
>=20
> There is a mismatch in the count of fb before start and end of the test. =
This is
> because cursor fbs still not removed and we are counting the fbs.
> Add a delay of 2 vblank before counting the fbs so that all cursors fbs g=
ets
> removed.

Commit message should also have the information mentioned in the comment.


>=20
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  tests/kms_universal_plane.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c in=
dex
> 8e0b4dda0..1a4e9489f 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -703,6 +703,15 @@ cursor_leak_test_pipe(data_t *data, enum pipe
> pipe, igt_output_t *output)
>  			    COMMIT_ATOMIC : COMMIT_LEGACY);
>  	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
>=20
> +	/* Since unpinning of cursor fb occurs during vblank in xe, we need
> +	 * to wait atleast 1 vblank for driver to remove cursor fb. We need
> +	 * 1 additional vblank because vbalnk event is scheduled before
> +	 * unpinning. Therefore 2 vblank to ensures that all cursor-related
> +	 * framebuffers can be removed before counting the framebuffer.
> +	 */

Typo: vblank, ensure
Nit: s/ Therefore 2 vblank/Therefore add 2 vblank wait/

> +	if (get_intel_driver(data->drm_fd) =3D=3D INTEL_DRIVER_XE)

We should perhaps use the more abstracted version of this - is_xe_device(da=
ta->drm_fd).

Regards

Chaitanya

> +		igt_wait_for_vblank_count(data->drm_fd,
> +data->display.pipes[pipe].crtc_offset, 2);
> +
>  	/* We should be back to the same framebuffer count as when we
> started */
>  	count2 =3D intel_gem_fb_count(data);
>=20
> --
> 2.25.1

