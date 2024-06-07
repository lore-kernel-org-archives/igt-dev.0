Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9678FC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 20:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C37310ECF8;
	Fri,  7 Jun 2024 20:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUhmRyqB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB7B10ECF8
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 20:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717793005; x=1749329005;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3HmdoEqvCbFM6CcjL1iTQCCc5cO+28BXtlGby+19UQM=;
 b=BUhmRyqBoZwfa1AXVaseRiESQBPlbFmYq0mvOL6hucVQoSq5Yn+77Avh
 stiRQVOOTxefzjjC8SZUbJS5WceTZh6iGRGCkICp7dl51rDoaiO/DI7zq
 4aS1fdf6RjRC9nljiQl4bIHN9FaqZRb9kHJ58yIi9ddK6GvURckhDMAEJ
 1JY+9ybPz2NnUtxGLuNk+FjPf1EeO0XyJeLjIgFgsJdbUrbMwC6HqNPD0
 VYWjPcBAgoUPVVY/dOmyPeMWpF4v2VmjHU9jannYNhOaZJ3X5FFOy1/zm
 wqOUaLQ61zpGBPiP+8YxvanArpZCgXbCoFUnmGMc859UNHSHDvMTTOe01 w==;
X-CSE-ConnectionGUID: 6N2rqzS2S8yomlrKFESRLg==
X-CSE-MsgGUID: +zD05FeHSCmizscrrOodfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14666506"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14666506"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:43:24 -0700
X-CSE-ConnectionGUID: S+N4vBY2TTqfFhCnmsz2DQ==
X-CSE-MsgGUID: +5pc0E+DTAqON7S1CRC5Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="42882467"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 13:43:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 13:43:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 13:43:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 13:43:23 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 13:43:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ldbwgp80wdZLxhyeEpTibxy49BxuTwm87pyGf1SrI8Aret5rkdRQkPG4JHy3bp0JbJ11uOnkIivXktOr0pQy0WBOm7rslyy0dKzC3XeoiqDZCqc/pI4FedwNu2pEjvhNUjYRr5WYW/UthMKepApjDEWYBAibrcwG+lT5JCcYrrqh8vbJRYvAJD+9TiWPUpkdUdE9rgArbjkYc2dVrfNXdwHL7uuFv3tWIF+1Z02dlv+bjbudfRJEN5unbIjhwive1kQx32PDmdD36sGf9j9dQNM/OgzmTdKQ4Kv438cPMDpl+kSpSeYnV46w7uq4/JoCmBY4DRcxUKmbrBPvERMXYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0e7rqFY898CgCmas+Eqa/U+OUnXrtyrMTEZW5t3+k8=;
 b=fTmQYm1LoQT3JfARxk5CbmV3ZQFoxDSryc1e44o06ybAjuWRMMZzy4yi9laEPsHEL79fLEV2pvpGBPMyICXUUKcCOaf+rhWl8dnQ5n5Y0S80KZreLQ4HX173mI+eYuiAnM5A9KOq/IZst5fpEgvWbwOBNXyA3uEMDO1Jtu+5O0UkffI8HVO4RLn+7IT5pIuhxY2qTpWXnjbzRM8NHAhO9oidyLv1i9FciLLcSKJTf5GggV7YZZ+fNMf9SNyih6g+jQr1vJuvpgIn1l21knJHgrSq91cZrDQaAx8mybYG05p3RS/xIfEwbjs3v5Lc26Gt/G8EJODaLy3g/3sqLhx3/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM6PR11MB4612.namprd11.prod.outlook.com (2603:10b6:5:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 20:43:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 20:43:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH i-g-t 3/4] tests/kms_dirtyfb: disable psr feature only if
 psr possible
Thread-Topic: [PATCH i-g-t 3/4] tests/kms_dirtyfb: disable psr feature only if
 psr possible
Thread-Index: AQHauOskDaBlbo+5q0y74XXOcn7TmbG8xLLQ
Date: Fri, 7 Jun 2024 20:43:21 +0000
Message-ID: <CH0PR11MB5444FD3F20D556BB10A6C626E5FB2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240607145732.285557-1-vinod.govindapillai@intel.com>
 <20240607145732.285557-4-vinod.govindapillai@intel.com>
In-Reply-To: <20240607145732.285557-4-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM6PR11MB4612:EE_
x-ms-office365-filtering-correlation-id: 9c4a7b04-33b1-49c5-75a9-08dc8732782a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?uvwjQTteGH0/qf3xiJQygWhifjU6gOZQzDQY50eETSD9seaXMom2mrlAbSv7?=
 =?us-ascii?Q?qe6kXky6r46feyuxfiUJDCmqBx2XHmlm9haCGRRjbDNLptMg6j3mIrBaXpxe?=
 =?us-ascii?Q?UrLMXOMLjShbRLKn0hRWwjmv9QsABucHrK5f4WUb0DNIAizsS8TEaypGk7q+?=
 =?us-ascii?Q?AtTkCEYGXeYL4BA86YBQ7CCkt2zhnEywC/m99ns2mbUpNn1Vc/7c7+7Yungo?=
 =?us-ascii?Q?GJ7rYCI7YZCnvQMMsujNHfkbkAkEYvb+fITBRAfmJRptsZ0Y5gcpRZe8rfZz?=
 =?us-ascii?Q?WNud+EwjmzDCItAFMA9Q5XKUWsz5AI/84I72PMXkvWM7VNoc9h9ZPL6g1Pil?=
 =?us-ascii?Q?+RMSHKYso21hp1t8DJhiduCl85Rs245jhmDXFpfA97tBXN0XIxAa2rBWZ+9k?=
 =?us-ascii?Q?ufIGcegyj/9K9L2TUe9i37c8+vtkFQlyOXs07gBwRxTdMNy6t3P0cJjXP583?=
 =?us-ascii?Q?QIO6CtrPkSMNetFlsAa/B9egBLiKbVas5bKvGKxwkiP1j8U7B04QAQnHB6oW?=
 =?us-ascii?Q?/wETEcEjKUiQQYBLDX6acRU4B5JNiqe+WJJ6uJmcyz6j3ay2P9Q2FoPqy0Vb?=
 =?us-ascii?Q?/Ck/Zu23uasctsgafGcYtffRdln1KQ2RdFo/tNKXvU8W/g4YJjdaPHIC+5hw?=
 =?us-ascii?Q?G5n5Db+KhBC554EAIiQEpDEAzV6d1hhEpsBiXEitWFnx7FdZk21B9xWrm0dJ?=
 =?us-ascii?Q?teZHEox40ixQ37wNONNclOA3OCsbPsm43ueArBbB2hM0QemrPm3T1lADfEP5?=
 =?us-ascii?Q?VOqJHv8rxM1ttB3w/6IwY9bSSDBTwU4PbEYjJGzxTaihOKGkIb+PDwc5GRqI?=
 =?us-ascii?Q?n8mnTM161jhMD2BBjI56rhEdaPEe7RkQBk2lRbcMZJIUJgwrrJABDuNe+txj?=
 =?us-ascii?Q?j33k1enpoeO/bL2X/lL3XLKtqNJv1fdO4XnjnmY4kaMBNbMlqcLhVA9S328L?=
 =?us-ascii?Q?xmFk/hjd+q1VGtE1AU2jcm8jpx2lmFr97tpDsVYmj3lywHcEM5BpV+2aw+ns?=
 =?us-ascii?Q?c6vbjSgl9f67RVWxZ5RQDU+kqNkxveN3g0Y1ooY3aJzgW2agFmF4hThMoCMm?=
 =?us-ascii?Q?fqa5f7ydvNZhglpVeucv1s527w4naae00gdwvzYGzXWRTgALlvQUwgs3Xzoz?=
 =?us-ascii?Q?xndztKGDGTS7czrURI2PoPxd3lHLtNGKkgDakXZtB4UCb2nuG4p7A2S+W+X8?=
 =?us-ascii?Q?3UQvLa8V6/tGGlFUgTxNTWBgB69GRnCb0ve9XjWlb9Ei2xy9jR2NUpZ3Fsxs?=
 =?us-ascii?Q?wpVH4wct6wlGeWKjP34XYaCsgmXxXe79Fo5q9Xc0is1q9wMk00MQJw9Y1h/H?=
 =?us-ascii?Q?stZ/v614J3f27v4cisrzeUQNbT182lBB/8uEoQPo3xPm0+1yejAlIbsZ7R8q?=
 =?us-ascii?Q?TKWvoSg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tUoglYQzBD1aJ4V2VlL/yl6xa2wJM9g6jaGqKjS6XMgclCS62FfxTQQNamwJ?=
 =?us-ascii?Q?xMIL7vx04xGoBjc5X/++tEno9OA6Uujox0QjPUXccANwgfeSo6gsaHmfQzhM?=
 =?us-ascii?Q?/v3UPe6D9otsp+CYZWlVqDXFitck/zRpBNEz6HipUD+gLeiHp4sbAXrykh9l?=
 =?us-ascii?Q?/AaKRu8vm4an5UMGZwPRP3C0TtmQPKjS7UHgSb1sM87Qeaw2B35OdJB4ya+T?=
 =?us-ascii?Q?CHu8+KORcX/NmRU8Ez5kmK3fWv9qc893ydsA3jUuz+1o59KO+tSrNDMkHvTR?=
 =?us-ascii?Q?cWAxNgZOwkSG9PQYr3dBeVKQxArxrSW5ia3B90KLOL7wEj5h6MAttO1y53kN?=
 =?us-ascii?Q?2FtQ4Nzuob5Rq6Zce4z6V389JNcrY7yIu8yhpFp/gMWA+wT0SLvSPIiKyMvr?=
 =?us-ascii?Q?nA8KxwagKtJIBDqa+5bU5QjyR8j5bttJLXC40316aIDGSYgRJAndAH63DQjf?=
 =?us-ascii?Q?09nJjgrma5VCLO5bRRMmsI6Ry1NSFLD4jLGGJekOuqPp61tWRLTEfVwfP+X4?=
 =?us-ascii?Q?2Pgz3ZndEJjF40KGDGza0LRjb2AnPv1dCSRoNjAi9CxkZPP9r1b+D0M4V1G7?=
 =?us-ascii?Q?e/RSmlVGWbzeyJiIzHtAq1hVJGU4SR7sPNkehU7vx+LdOVncIEtnxB61QczV?=
 =?us-ascii?Q?jx+bXrMRFSPWJwkD0xdkufr+9OEMO5L4UlkuqZX2SKzmRlpUoOSa4f2v1OjT?=
 =?us-ascii?Q?eilZHLh3pAQ7EafYcSKViUjTko7G/ypRtFI2XbWEP+lroYSyITTxS6Xy7IQ1?=
 =?us-ascii?Q?WBfGjjeaBkl51yzU8NjAVu+QvPTofjDr95B4fLPdGYqXVafLmii3Pxuz8i9r?=
 =?us-ascii?Q?dOLfekoakiopLRY7ri6FsWVokcP5jaZASzpn2zI4BZ8Q2F/dfP13h1WCeBsf?=
 =?us-ascii?Q?w5rQ/xxts3UwqGL452U6nCXH0qL4M0ktNUZOAlf1w48PNXw70rT5E8f+/Kz2?=
 =?us-ascii?Q?+5YuWkGmwLBCg9VeHhB8+ChZKeGgM0TwTjw0oq8vLJ8SJFB5nL2GyFJ/PZHC?=
 =?us-ascii?Q?D3+YWXYZzIbOesKwOOb8pHA/qcwb7JaqF3LEzVMYBRWXwmnrYEMhBhnGxOjl?=
 =?us-ascii?Q?vIL+zP0KvA52VLsquiH/JAu1swZ8c6M7cqHkRiS9v3WnvPITTaazDOwVEcuR?=
 =?us-ascii?Q?+hhsGLb80G6Es3Gd5gA8nVfXpIkltfv1omA+rRQ16MKmF17nPOZb2zgYynS1?=
 =?us-ascii?Q?57YwIJOAViQOJCtgn9EKaFqzvwaCavX3N8JiCSeTc0ptUWuGMm1R368Mlpck?=
 =?us-ascii?Q?P9FUHancq8MztSk/dxziPsNGL+35p9nCAdqvKhcYJ853iK2Oon2oGdbeZ2rP?=
 =?us-ascii?Q?J1r/5POprP2nGlfa9HbCjHcLRgNT3klbyXKB9DH2lJbgs5XDBLwd/Gcku4mI?=
 =?us-ascii?Q?YgVH/V9CYYClVr+WIHw9A5yAAkWBvb3aXFmXUcyuuzzPUuYykRvQAVQZEdmv?=
 =?us-ascii?Q?YKElo67W9Ibdbt62xibxZTzHqCe4sCL0qB6K96dek5l0R8DMn3k7UKdhIlNM?=
 =?us-ascii?Q?flElhXVahNDoJ+9v91BJ+GpZRx5lUDc8J3qbsVUItvZ0NQxgnVR9xEPLdzfp?=
 =?us-ascii?Q?adHSpHrReOomIstbyI0PCyPF3GnmKcvuH4K5IOvP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4a7b04-33b1-49c5-75a9-08dc8732782a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 20:43:21.3364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YLReAI/kwX9UlDiTcfl2ruX/LXKZmlyPMG0PjXHv7J/m2gDCuYfYg6yNL/7cA9q4gtoj2gcTqjezBsugOhnr8CGcZI13SB65Kp1aWW7pfKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4612
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vinod Go=
vindapillai
Sent: Friday, June 7, 2024 7:58 AM
To: igt-dev@lists.freedesktop.org
Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; Heikkila, Juha-pe=
kka <juha-pekka.heikkila@intel.com>; Hogander, Jouni <jouni.hogander@intel.=
com>
Subject: [PATCH i-g-t 3/4] tests/kms_dirtyfb: disable psr feature only if p=
sr possible
>=20
> When kms_dirtyfb tests are executed on cases where PSR is not
> possible the tests are getting skipped. This is because igt_skip
> is use in psr_set function. So avoid calling the psr_disable if
> not necessary.
>=20
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/kms_dirtyfb.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 6121599ec..2a32fab56 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -169,7 +169,10 @@ static void check_feature(data_t *data)
>  static void disable_features(data_t *data)
>  {
>  	intel_fbc_disable(data->drm_fd);
> -	psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> +
> +	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL))
> +		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> +
>  	intel_drrs_disable(data->drm_fd, data->pipe);
>  }
> =20
> --=20
> 2.34.1
>=20
>=20
