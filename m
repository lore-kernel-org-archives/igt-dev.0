Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F89EE67803
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 17:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44EF10E3B7;
	Mon, 22 Dec 2025 17:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EflDU7KI";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADF710E3B7
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 17:49:00 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BMFkvgJ1356364
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 17:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=0xoWPa7tQgEzi99+f1udGR
 h27AR7T0cvnBWb5aT6E+E=; b=EflDU7KIVA5bxO+bIl1p/uRAcBx5KSd1lc4UU2
 7itFu9/3YkeJzNG8LkdB0JPLrjjCS4yY8oJ1RzXXnp78Lg2VBE+ZzQtlBl7zgiih
 8sEpydgoBE3tlUC/sIOxaRhpuiuk/pyqE8yCkXY4fDnkJ6VM//CzkhJJwguQn/FY
 HxwFaqUhysKezGv8yFDpwxCoHuah1nUQpxofFwf72WMMMEydOyYc36fb9/ufWhhk
 7Ukb9M6zupZIJq/95wSZOly72Aafl8NMlgRei3bORZuzRwSo3XzjMdZNmdic6CFr
 Tehyy2DhxJ0U5H+qRvTdwPHIIZfD6oiqrL8/MGyhztClWwEQ==
Received: from ds2pr08cu001.outbound.protection.outlook.com
 (mail-ds2pr08cu00102.outbound.protection.outlook.com [40.93.13.50])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc0a0m-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 17:48:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHBUTXMmxlagL8QxxPS/9Oo0cBzWmbuSMXe/p+YFEAhnr4R+PgXl/5grGPD9FXMxZrgcYZQSYyB27norbsiqzfDHePP9ABSFEH+yhGwSpAWEw8kw+adxYRpxxtBPflVcw5tjKywkt7tv0T1eFrudOsZ7cItNYtXMQQHx9ZQ3AOcz+W+wqB+nDBKwhBaRcHRbb49xw02Wa18TzqeLgRKuz9+fabJOIRZmRlrJ3z4pbl5KNQAB6xvTRzwgimqT9xMXo0fhyRIF2Hz7Pg+yi53XiJ63hhZFSK72s8uM/dJ6tKHXmhGNhsOctPzgIuBbEn3lbR2DR1BxRLmhgtL4SQyiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xoWPa7tQgEzi99+f1udGRh27AR7T0cvnBWb5aT6E+E=;
 b=fiHvBCv9IJXtdTVBBddKyXMX12gf7L3+uGoYJ8tYIU55HHkI7o4l2XWe0a34qBdYdJOAB5QghCIDkVWwRMTs8jhgIkz0HU1zPIV83Qv70PJucKKZGhCW1cuYsZmA7DQPSXGqAaLnjjCSLj7xRCkUezS76PoqT0yYw5+NpVg4OfRkln8rFDBOHfaYkcG1wi2G/qa0qXaR/6NnyhdxlbCxRl9VBgqHWuL1ZZukHhzq31uw51fWWRMAdujZmfbd047DDXHUh/wtj+QYvSgCimT1cZ/OoH+hMk6i1/3DkP6/D1y4IqMTgmY4TZZbgqVgIRbpuiGG3DgNLUn5Qy7xvj1xMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SA6PR02MB10503.namprd02.prod.outlook.com
 (2603:10b6:806:407::18) by DS0PR02MB9618.namprd02.prod.outlook.com
 (2603:10b6:8:f4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 17:48:55 +0000
Received: from SA6PR02MB10503.namprd02.prod.outlook.com
 ([fe80::ffcb:499e:b7d4:3d95]) by SA6PR02MB10503.namprd02.prod.outlook.com
 ([fe80::ffcb:499e:b7d4:3d95%7]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 17:48:55 +0000
From: "Jitta Vignan (Temp)" <jvignan@qti.qualcomm.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Lakshmi Kalyani Lingam <llingam@qti.qualcomm.com>, Aditi Verma
 <aditiv@qti.qualcomm.com>, Maheswara Pappula <maheswa@qti.qualcomm.com>
Subject: Recall: Introduction and Intent to Contribute to IGT GPU Tools
Thread-Topic: Introduction and Intent to Contribute to IGT GPU Tools
Thread-Index: AQHcc2s9oWFOggQOOE2GyoYjZ/v62w==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 22 Dec 2025 17:48:54 +0000
Message-ID: <SA6PR02MB105033AB69B61BA584BD8944981B4A@SA6PR02MB10503.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: SA6PR02MB10503:EE_|DS0PR02MB9618:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5d2afbd-33b4-41f9-74fc-08de41826046
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?Vz1OfI1cVIfVTSxZulaac5Tl0GMHhDcfuJBpp82jZjHACuzIqll6L30bcyR5?=
 =?us-ascii?Q?ya3tiOFy0O0/i6sziWU7+tHx9WEgwrhdVACzxo6nbQSgPavnzCWdxZiGownb?=
 =?us-ascii?Q?p/XwbD5YwgVPcB6MjCWNb5jBG07GwF2BKa3lwj80OZtCXyhrCN9UAytqHPBG?=
 =?us-ascii?Q?APJzy5WqB2jVvqT+VrC+AWQM4PBDK9xrmdnj20HYa/RSqjvhP7F4+wFDw64X?=
 =?us-ascii?Q?79K3PFBF8T4kPF44+rK6C2Zb0tCdBoBL2uUufyOcUBDtKkBmx8xD5rwb/7jx?=
 =?us-ascii?Q?XKEvwfSLUcn3pqC9q/Jm4ZhlbMUD2w63kGdh/cWU/7LJ10e+lgzDz8lzI3Jp?=
 =?us-ascii?Q?oIMlJ/x9HwDTX1sKjQE+C17yht9BajVr2NEa1QZq6Cqq8IRZ5czmdm21N46J?=
 =?us-ascii?Q?af+iArxioPm3kXVPiEuAICNL2J4zfFjG/KHpfvv7uxECGWdrqZzQrMC8Asxa?=
 =?us-ascii?Q?QTFPGYIUtHPZ0ty05zh5jRra9OrsVRvDGimXtRUfCsvQdnREB7dfWRMkeh+j?=
 =?us-ascii?Q?JBt9TAbY3fHvwWFzNF0k2MWU6OZFCAb/ESbQOQYZwuqUlD5R/1nn4zOYuaDY?=
 =?us-ascii?Q?c1AeQGvzeDGdo/cA8HghINLuR5cTWS/mKFPUzMn7cdgnyFWkCNzJnyK4M0D4?=
 =?us-ascii?Q?TmstOuLiCbJX3CD90i9b0hhMW0I1E1CfQ1xsedFwKFtL3mevlMjDsuvGjWXn?=
 =?us-ascii?Q?o8FyiCJ5Tm3VvN31puDrNczQAPc+T9Kwdy/VKYOqLJoUvaJYmgcAAMpyaRBy?=
 =?us-ascii?Q?PuaMOBSseej+KMHEp1kRFOq+pWyu0kmZZGum6C6H0MiRCijcjfWcyHKiORIy?=
 =?us-ascii?Q?RGp05YfBh3iV9KXXkHkgJ73Wyd17Z5zxAiihnRAsGDl3FHlE+gmFiZPaI61D?=
 =?us-ascii?Q?ldEvY65Fz/DzEbMt7xFk46pRvM8Coss7Uhkg4uTPCOinJgnzfk6+cDHlV/nu?=
 =?us-ascii?Q?thuyfzlmJoUp5WQYbTyXNyV1CmbNLTXkpXE8PHlmCzz3KJgY1rGJe4WG+nz9?=
 =?us-ascii?Q?XtlOTDKe7nXxJRoiKbmxxPRm3VbE9it1gExRB3pRJXS++RFJKoiXDjqcKemm?=
 =?us-ascii?Q?cNUFqkioJ5V1xSt0bVD2assOwB89GFYZY9UWM+06M8NMGt4hZvmsyNVQoW/0?=
 =?us-ascii?Q?gWlfzZKIGBQwDnpPZBlYzSH4/hd+znP6p+kR40oI8sYKtfVrVFRWv/eACZTb?=
 =?us-ascii?Q?dl9SOE47CE/9UFXQYEDpfW5fJPhj6Q6incqkq4SG2Q1fZBYXkm/uvwlEY1B7?=
 =?us-ascii?Q?eKoIwZVOSkjOTnRTpdYTcuKssHF/8WefQJ/y5KhVdSQDpKe0BdW9/ob+i68/?=
 =?us-ascii?Q?o6hhmB+5lxDSbZdxyVwX42lZzAZwAaF7EUtdxYjZavW4Yp/CeRPPQY8AYg/g?=
 =?us-ascii?Q?OnSpXKL5M6RbXzWiCPDCrxQG2YRUPSYExoJeMZuTuHucMl9nmjT3h4TFOmdO?=
 =?us-ascii?Q?pLXFqY7yvxFnvKftgS9qivcFpKMkDnePTNv0DAztdIUe5qj5QPjXuITjr+x6?=
 =?us-ascii?Q?E2lQPAn71xRZkS75/mVZkfG9Wj0pt8LewyFi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA6PR02MB10503.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mQPxW6WwcUJU1w3E8SXiF0SIPpRwMr3dpGfVs+lEYFkGpb8wOqSdQfBwBwFq?=
 =?us-ascii?Q?ddFXYMHh4RRIqq6IqBafTFeKyyZdn1EaXCqciugCcrxClp9JdFpsWBA4PDYT?=
 =?us-ascii?Q?+8Lq4/j0gr/YB+wwT/3wuYibAbKXDlCGYBm3BVR5pbuD2SkXj7fdItNPef7Q?=
 =?us-ascii?Q?GpcHmfloPN8JMrJXBu1zK1JYksDVLPmyujRiatN9zCzre+zLjcaKaO4EpAqX?=
 =?us-ascii?Q?n+5W6Pd2AfBAyrAvx+n5H8ebHLxTwN9aY+s6JYJmM2yrVWGRp6dw4xj9QIM1?=
 =?us-ascii?Q?v1a6vYQ5T0A7/tZ23iSJEWOZyKXjR9TDell6ut5Ew67epoJnjrndr8mzp+nd?=
 =?us-ascii?Q?l/o1oKT+9KJwdt3UP1pPVdRuMKYFj7L14Nz5FZg4+y76mboPhPtDGNCQ8Mct?=
 =?us-ascii?Q?mUsJUckchLOU5vxfUHy4h58QK8ibkztm6/01Obtl7M9IX4/KdV9OwrO8UvyN?=
 =?us-ascii?Q?rBQlBLObdGxWpCr+dEaGOxtCJ1fBUKkEZKLfTS3P55BKxvG8DyDJLojsq9s3?=
 =?us-ascii?Q?q6Q9mDvYY6Y9X5HR3awex4S08UYLfNlO23EnJykG6FYZMIAiU5+DsFMLNLg5?=
 =?us-ascii?Q?h4P0qWrWubRz8BqzCD+2Mt2pQIx7g5tPaZgC0nQWm2y+W8ZsBgmP3LwobM9x?=
 =?us-ascii?Q?FSjMYYwzVp9AwkZs4xtMERzyNKaRz0yDDTmaSh007udUntW7CIhJ6H7HmTNj?=
 =?us-ascii?Q?ZoJdQ0S5+qs5SF6YUMr0q40jnndKapb5ffZ9yXQhUgA1OPjHhCIAc/QD8HKI?=
 =?us-ascii?Q?RNOuclCrEkUETsQNAW/USMCU1JEJg/bog74LhnwDSLgvdc+1wNkqBxUs1P88?=
 =?us-ascii?Q?R/XbWclYl7K5Oyxwepu/LbF2Y0pDs3pgX4w9YNMQf0ENrCX5PfFdkWi2umfY?=
 =?us-ascii?Q?G4vGLefsJjPlAaEnOU5jn02B9YdEnh43CsgmSZKHkeb+SsUxslECLcIOEix1?=
 =?us-ascii?Q?9R6CiMN7XfxaP5U9VMudvHubGuW96uIZlBHVdYlE5arFwNCSSgLYltjvdf5E?=
 =?us-ascii?Q?hYTIiixOoIBNQ/W1ObV2K23cFMwmGu6hxajcnXnbcCuqBloNZeSM+UWkZpl6?=
 =?us-ascii?Q?a/LGdQ9o0TUcT0NbYJUV3GDg5RawcVm3c4zfZYs97TlzVOAQtpK1bqiIgUiS?=
 =?us-ascii?Q?jNsbRGzD9qCvZESWlsnOdo5NWIptWUgutXBrzCE+CVvnj42/+k7so/jU/6iw?=
 =?us-ascii?Q?bCiTu+tjI9z9w6QdFX1dnEWteBbulOKhj8nXKE2JlGpoCCmbZbDApjNSLx5V?=
 =?us-ascii?Q?JpojYK324pIs6sdSQIempLSbSGRmFN3MjKyTmRukKflfh/FOq/F0OmqFC7OK?=
 =?us-ascii?Q?gG4ECaO6q3xmw54aK6InNIe/GxX5YAqTsUwsYqFZ5m52/H9/1bYYeBUHrd4V?=
 =?us-ascii?Q?VeW+/BfQZoYls1xYjljUpHHBmQT8p9D8X4epWmgM8lfvb+AyJpPyy8CZRkIZ?=
 =?us-ascii?Q?5l9aAjdTgv5WHcZvMOPQQaVD7oR9i+s4qtQJEcn7M8oWAc+Ap/Nv9BaYST99?=
 =?us-ascii?Q?jD0ViMkDP0Vl8eLErMtp+hRbEeEmFxI5cuukblfGWPI5sjL0nwAHSyOFts0L?=
 =?us-ascii?Q?fEpy4+w18DfGORFUwQ8GQ1FHXe+ssWqyQelu4Vl/Jri3HAqM+t66eAMWceOk?=
 =?us-ascii?Q?epRbFNjNgRL6rKRmic9461HkCoNU15ws7AosqWZPu43U6giEBK6wMwbXdjy0?=
 =?us-ascii?Q?hPL45bhWFuBL716DljNXbYATnbHO8RV4u6Dj9VN7bJySIekj8X671/tDPkti?=
 =?us-ascii?Q?aV8CslWc7w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Op25yixfOWjlQ3RT5qSXrr5XWN8N+qdgOvjsCnHEn1F2+kEfcmzysvHKhSv1YuIRkyF+9upCfvlIsRk8PivhTmJreWwrSIR82ZaEhffAvGcvaVJS0GK4Q2GSO/Qs3/34LnTo9iP/++6HpblOn9BRnm0Gd22l41M+Caw+BI8n5FxP3dAwKf81nA78M8odsMVXV4+rqXvdMAeRPxlAEE/A2Ia2/tPT3/ne2mf6893iNdHBu9oaGGRkvHkZc/Tc7oJR6/CB3NzzzSmHztYtf6HX9b0lj+JDS9kV/V044Vuoq9slo9xTIXfdbxGfQ8M1yo6l7lEbkgtvm7gjPpLqDoKEEACXOen3vbGYXkdceWvwGbuhX/nBRQ23TRZW838o93OzRxUmin0lE7uHFn/lF6BUfBi9xebun3DYj9c7NaZ8Bm3D+LKCFxJkq1phQPgOiaEFuBskGPvUWv/rwJDKQ/GDA5xC9qov5a7+T0l63Z2/m6+uk9YP3QhwP3+hDQFuijsK7TxiHZO1xvp2js7LyKA8/AJwr+Kd8/aCFaO+7khpkc0MtDiRoqKBr+nBZtjxwB90x13N6wmAEN0FSlkYZq73d6R381D9Lmn+5xM8+4fEloJKK0+uYa8jqW8fwBksecF7
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA6PR02MB10503.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d2afbd-33b4-41f9-74fc-08de41826046
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 17:48:54.9369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ISigiFZqkz+O2m3iXXjhpk2Jviq241soWcfb7kclqrUh7g4X4TLGgeqV6IRS9Dwau3oBEVFrzaGix7z/sZXAZQ/ebwqNUlox63tNzehZjKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9618
X-Proofpoint-GUID: E4XITTFDR8yXda3d1F9FyzXcJwxj2fZd
X-Proofpoint-ORIG-GUID: E4XITTFDR8yXda3d1F9FyzXcJwxj2fZd
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=6949848b cx=c_pps
 a=ITiX5wGoaVWtfJBAqtKqhw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=qqhCTvBWDEbQIaO3uFkA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE2MyBTYWx0ZWRfX2Brqz4JNiZle
 cBS6S8QP9D+ji4w/CzyeXwh3FvnQORnUXIBWt0maFYnRqrTUj2E9Ud4i9ein8nTUS9H0FQfhMBS
 +rjaI3fma1HgjlAYC4iJEPwtY0YAYZFN6SPa/RC1w90aBBp2tBPDu2lnGPlASnEnYRJqcWZa4mD
 gjos7lXhbZvUR+HHy0kxU1a5ROKG+wAd9OV84swKWZsE4Q647PSkVEqXAGgyJ/A9ExMJ3x0xWO1
 sZeUSo+H0wRNcpIE4Wbw1ok4oBzaAOBF6fr0rTPE/ZphKt7VA42L/ApcTbrfqaKLeClYeTI321Y
 HQ38OAnAJYOlT0GD64aW44bkk79bN4Y5ndcx9qH/5HInJ7WxPdeI3fXtO/goP/9z4r3qOPDQSSG
 bFLS3OL1nhTVYizQCorERfz06K+1z1gMk2bjPe/mRG7Oxbics07JjZMaH01KkF57mX1CCJlFaxF
 pbH+hJ2G7AZqrnXL+2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220163
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

Jitta Vignan (Temp) would like to recall the message, "Introduction and Int=
ent to Contribute to IGT GPU Tools".=
