Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347CBE67803
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 17:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF04A10E3B7;
	Mon, 22 Dec 2025 17:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwEsFKTq";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D64510E3B7
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 17:47:10 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BMECAxx1569012
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 17:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=0xoWPa7tQgEzi99+f1udGR
 h27AR7T0cvnBWb5aT6E+E=; b=VwEsFKTq04WfIO8AL3d0KsNUlmsmSZ5U3+i/d2
 XG7NzyvMMxz5iTPQrmu2hu0q0ermV5VHZiLDqY+LxIPikuhUOH1TSq2ADTmCRdnc
 1PNcL+seAI5n+G/AJ8kE1dUxa8XuJJP0Y7s6aryvxEyab9LwkHNAQpO4lo9aByZu
 Uy2nGMqarZ8tD1kHxL63/ZsZlO7ssV5DmdiKkWFKIPA8TtjK+y8W7BM03l5ipqQ+
 wSPAcoyKhhoweAkPxSMOXUDNlkXPrGqQrVGCHvtlr6bs0AD9tLWrCS3s8eNN2/DL
 Wi+Z75GDGcc95cGkQxnTllPdylJX25anaWDLx7aqi7Zv6NXQ==
Received: from sj0pr08cu001.outbound.protection.outlook.com
 (mail-sj0pr08cu00107.outbound.protection.outlook.com [40.93.1.79])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy0pee-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 17:47:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOxd6EQnUBcxzk9cR9lOydjtNn1gqqSFN9x0lQ01V14/unbHA5kGFAVmNUr3NBtpOIQ4CJyHRjT/p8+lWuTz2/U9Y5eYdHy0tN6KBpdwLQTg8z34UMeKzuvfhS75TWlr52U0EJIgj5Y2KsNMQDbrg22M1PSkUKbw0jn8w3zl2hCRoHPvofRCCPgU302aO+9mQiybXwVTtRVgLtKcEssh9MYA85PTY0MczGFM/LqiA6m423HZpYYsUP+AcgdTEtEw/gtVYQRyLxgaTwvDJcGJIr9Ef42otCGFk3tvJn9QdGvAmgBZvWZFDF7cbNZqiXKXQAH8YBhKEWX0xbk/SaKjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xoWPa7tQgEzi99+f1udGRh27AR7T0cvnBWb5aT6E+E=;
 b=Ul7CFlazm+3l/damTx7mWo/69AADTxC6LLYgLMtXFlzaewVOy0mtaFg4Ubvid5mw4aV/YR5vfNKWonmyQl8X08A7vWhFFJkLT5iLhy2ltQKWKzBIsOAd8S1x7JreIubaw3gB6LaBzDO1VFJCtnokzlTvN6sP7lDXCzftPlduikG5FcDI6UJVNJVXyXRrus3w2HN60gjgzykxrDbNtfLU49C/vqSZe8y3H1EB4giWkOASbHnaXg/79Omgb3M8dN3hmipS5NfgrgB3rwJaZSwb0uD8KATiXNBS7PP1dSKSaCp2WKKvBAUHH+XVY+ZACx0Go02sT/u8iMbn81ci5C7RIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SA6PR02MB10503.namprd02.prod.outlook.com
 (2603:10b6:806:407::18) by DS0PR02MB9618.namprd02.prod.outlook.com
 (2603:10b6:8:f4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 17:47:06 +0000
Received: from SA6PR02MB10503.namprd02.prod.outlook.com
 ([fe80::ffcb:499e:b7d4:3d95]) by SA6PR02MB10503.namprd02.prod.outlook.com
 ([fe80::ffcb:499e:b7d4:3d95%7]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 17:47:06 +0000
From: "Jitta Vignan (Temp)" <jvignan@qti.qualcomm.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Lakshmi Kalyani Lingam <llingam@qti.qualcomm.com>, Aditi Verma
 <aditiv@qti.qualcomm.com>, Maheswara Pappula <maheswa@qti.qualcomm.com>
Subject: Recall: Introduction and Intent to Contribute to IGT GPU Tools
Thread-Topic: Introduction and Intent to Contribute to IGT GPU Tools
Thread-Index: AQHcc2r942fksX906U6S4hVmCp6DdQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 22 Dec 2025 17:47:06 +0000
Message-ID: <SA6PR02MB105032A677D29CCFE0EA54EAF81B4A@SA6PR02MB10503.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: SA6PR02MB10503:EE_|DS0PR02MB9618:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5265b45c-7571-456c-922e-08de41821f9e
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?UTPDTUbvM91k5IoMw4aNq7l44wyfwtQHfY3BFx4rPBXrt2gBff5LB6gfx8Wp?=
 =?us-ascii?Q?a8wsk0Jg/95Sq/pfESI1bhqlsq8QzoSZ9TbVnlwnFwy0T8X/0u9rjv1GszQE?=
 =?us-ascii?Q?rhTlGJyPPT3MmxXHoN7Z4AhysvAMqYhJCn5iej9sfalqT7voOe7cRBhoTGPC?=
 =?us-ascii?Q?uEuJyvdFEelYDv+woOFt5j8gQK5wvU5kR6MmWUvY3ScprsdJFMVmkZoNEF7S?=
 =?us-ascii?Q?OcyXg6GRx9L50mb2KJIGr5tKWlXTpfFIZaQSeUxB27f8xMMHYHYOWaocsZZi?=
 =?us-ascii?Q?cHFC4yiElh+vfxFJmD6KjMNYRdLVYVQFXcelFh9HORO/rsZX2eljK6JeTOGI?=
 =?us-ascii?Q?6y7qI2fWJyF49nemjVG+5sbsGAjsViGsCWAeMqmZmswenFBjgtR4WFUL7ig7?=
 =?us-ascii?Q?Its08cp44GmCjID4DxnUTNHDdRC3DKCkFkYDVyAFiEIJwcKkj/XRoUAgbpEJ?=
 =?us-ascii?Q?NEfeCNJLtPtXNvEXqEVdUN1NJw+4XM4hWiDgZmbQ0x8T6KqR3vpgZVckNFRP?=
 =?us-ascii?Q?5P/F1SnoujmM3vIZ+PXpxcXBFiuoWLONVPtMnJ9BIgYHW+VVdVGoaolcqGpc?=
 =?us-ascii?Q?PHcq52kB/53q7FlqGVTmzi5XglhYqVux9k0lQcElNC6w4oBTsem5OcvV7JIq?=
 =?us-ascii?Q?DAxEP3ctD/hheioHXvFceL1izKDANt9t56OWFWKvBbUARE8Ztz3g3oBONMbF?=
 =?us-ascii?Q?eBkNcEVsw4/O4ifGVWVGOvO8u7MBTncmmUb118QS680ZQpvzdap70lM3M/zW?=
 =?us-ascii?Q?4yKaPIms4GjY44FBltZPoLwmAo8x7WwET2MDH7rdbHQDUHaQG8VjnEmAzFHp?=
 =?us-ascii?Q?YmfjISqTgl9X8h4w2TfSSCVGnMdOtVq3CxofxcRxmKFA0ZKc8lEzzemJeJpl?=
 =?us-ascii?Q?1voTkMXjQ/2a3LCzzykJiHU31f0JN6FC4N1xq6pMV1pUF8gxwhnueHMPuKSD?=
 =?us-ascii?Q?Gy0J1V+n5lFxQOhK7B3EclTYs80//KcWLB6lotgArhxZM9YuIxvJB3CpSduN?=
 =?us-ascii?Q?URc4N5Bv/BI6s0+/vlGz4KXjFXgQ5LRMWmz9btglRTj/NqUkB6yvyDVbwqUN?=
 =?us-ascii?Q?52z4xrreyMnCKrkXWwbH6YNpydWnQs17Dn243Xhz4zsUNaPVcBnJ7J5XK3vf?=
 =?us-ascii?Q?3PFurxC2EuZ4Pl+WnV2uQYmNlhuBlwVwTObfVitPIzNvL0S2QAwYPGmzxDNd?=
 =?us-ascii?Q?P3r/BBZW1k+gOvaywvAHvT85yv8Kk7QzubNIkzZX6QsAJRwry5/F/rfnegaj?=
 =?us-ascii?Q?mM8s4vWhpQX7AX85LAlpSKbV73HsoaOhi9TsdM5BvXQGThuX9nErAh/olPQr?=
 =?us-ascii?Q?Yvabg3T0MM8BTqdZBBxjuwo23OKymtd8doH1XcFNFU0EernZOOM2ryjvPqIy?=
 =?us-ascii?Q?OsEyBzrTlE/ANf7KoE163hYDIvpe9WM2qT7HqtSL59bxEra+cqxAWJ0pCv9t?=
 =?us-ascii?Q?0S6vsFT/TVrbiX5HwWXgkh0bbkKMKOqZfiYisjn7Vofrmd7nEVm3ERD+o4ms?=
 =?us-ascii?Q?ooiuaYKtbgjqC6451HkRwo0z6KYXTcfU6uOy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA6PR02MB10503.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?in/LMaHtZWGDHF4czqI6QbOHUvzG5tySuPJ8uzdlPB1eXM0PC3zovsILfyMd?=
 =?us-ascii?Q?XwOwGPoc8QPzQu2jAzmcedM29oINy+mkM9RPvLnIvOI3D3WTaGbX036+x9k4?=
 =?us-ascii?Q?GNSWQu5MGmxWHmkOl9cbrdCXJb/hhQ4YmYVGHuZ7QDTEUNXlpAXXI5U29YgK?=
 =?us-ascii?Q?IhdanLS1ML+5ojrTUHKtdnOx7zhXitpTEEm0z72mi7+VYBjqrp4jyXzn4d0X?=
 =?us-ascii?Q?awYnOPs39/CT2UitRvl2EH61gMmy3YxacQP2iM1hdpMhOSBzN8p1CutG35jt?=
 =?us-ascii?Q?+oYYMdLfFGBQwHalq23M3LAGxGLmZZbD8kod+GBFu87VkZPs89qUYXXNqR6m?=
 =?us-ascii?Q?BLVuW9tgXs259ke0s/8fxpCHuAzdS/ntuGjRsx8ttoH4F0bAfxzkqOALF93V?=
 =?us-ascii?Q?xC3wAFGuPVFqVUgQEPTPEFT/oxH2rW/TKwo8P3jVblyLK33i5yrSvZhu/Ly+?=
 =?us-ascii?Q?0OcxdBHQB5YBI0RarWsO7WHYwEEg+whm65eiBnISREUGMAR8uEOrQAJ0dix7?=
 =?us-ascii?Q?jiuFG+36753DH0s4YSryD4KxyrBn/YsQ6F48Wml9vJIw/DpGbY7tvgXpicGh?=
 =?us-ascii?Q?5P3StJEum7x5U6DiEJ2lnCOCL2a3L/Vbs2o8MT2EibtVkpXX5XgZ8V+OjNvX?=
 =?us-ascii?Q?O0SKlKJzMRuwBlZYqDyGkpfygVdeDf16epRsl/U4ZJ0PLRWj4fFCacEeu+68?=
 =?us-ascii?Q?Yqw+8j9CqiD8rrrWLQHgRF1AxtYFww2OzbztIqQisShjxi6KHvlxyaAwVBxT?=
 =?us-ascii?Q?zORhFrLJ07XB4CyOq5iDxOZBp9VQVpwBPpQsnH645GeoKN9FacG5kb39bpTJ?=
 =?us-ascii?Q?A1ctMKEyFgfxsNueZo5AvSmzqZ6ZbFfqTr2Xrrbigj+CJbhJXzDtAq23vh0A?=
 =?us-ascii?Q?UdRhqJ8TDb0PBrLWWbwbWJWoTIRkw8B6PppxlgPxiA4MH609qmMhfJ9zex8H?=
 =?us-ascii?Q?4Q816v1FxhLWuA6ouzugBVOaUOMAom4eQEqGfTCV9u8M2zZwu7hs8VPpK4+M?=
 =?us-ascii?Q?BnoDx8gPiQONgW6/LFOAppggusEL4GM0fpV70uHR7+azBE79Qw3PHpPcIipU?=
 =?us-ascii?Q?a+m0mJ3pbNlr37YjL4dlM1WDrb/N0QB3/p7u6hC5Z+LYVAqgm5yw0AheWiJw?=
 =?us-ascii?Q?DpgdcThu87jGFdyH02c1k1kS3D90rjq8X/03vH8MeQzU5Iv5G6yxzN9dxh/t?=
 =?us-ascii?Q?7x6r48p3CqWdO0Hy9wJ9slaOeDUSi3CEltLZIMpmGFjAebGM0hobJoAiTW3U?=
 =?us-ascii?Q?O1hjL3Bogz6WgvSTfuaz9aQoIBgNaiVCvhBlBHq96RU5fg9XCCHMQOhAFbNM?=
 =?us-ascii?Q?npedFTJDvs5U4/ml+HHPQEhDsnZJtxC45ziKMZ7v7fWBkllvUXN4R0Bwi7u2?=
 =?us-ascii?Q?p/80/FIiT/ld8T99Wy6mZHfTJLCYrN/BLC1vxkoW4aSGDtpGq2H9pI5W/y6W?=
 =?us-ascii?Q?nZZMBcYaqkNXdvA/PHbGIo6DVmtPx6maQuxt27nwvLQ6VH9x/V23avhcOcJI?=
 =?us-ascii?Q?QOQ9kDFhom3RN0f2+1uecSuOy2WjKRNd1TsC9T5RH4KbHrGonnD4iTTSXTMO?=
 =?us-ascii?Q?RppmQ5TK+Z2V7ck9QRhkgshHvqPefDUAtdRSFukZ6V+Mu7O40FzLk6EyNwV8?=
 =?us-ascii?Q?dHL3nqUxRmWQZ5OeHHrreSPj9VhWvvSDkX+8qkYZBIJfPELwnZPfOBqeJ2Yi?=
 =?us-ascii?Q?5tyD2qAd5Vp14tmYUyFzM1YTH6uvYzjfM8TLQVL5HtVZseLzNMFqXEPiSq9u?=
 =?us-ascii?Q?6Yj6nhVnOQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: zddx7DzY123ESHYkSMCiasetHbGYYf70qhBGC9cxToiGvzzYlk6a4QL9xiHCMAQCtjy4oCfBa+KzZI9ey1wM26VNQpFS4zs51Jx9tsA9klqLYrR5JLYSsTGYq3O/5/lvGg586oMgtniZBz+NXuAdLt2ApAstJ2xfKz0amfiLJ7BjQSvzQFBCfVQTk0jMIWF8Avn9VoRulwm4toeMkc1namnAF9k9AS+qLRlRoT7weHmJLG2k4wH/1EoTCO4ge+I+E65aHDnpjmm1YMxt7HGb5RvAcJPLsJmSN4et4X4pk/0X0Q/Xc/DbFjUenUbNcTQOWa9cpWARwZeCIFo0X2fe765mkJQTlh6lOsSfYNagml87mLcedMuDiliE/FBjOjCknlXhXwy0HvAbDt30YeXqfxcDYyyGCC6KfT9Fljlr5ZU4Gl64xCfiD/o9sZKQH+EZbTI9imkVFaCWiAwy922zUqkQoPCRaLcc0/4u0SAjycOf9uCan3/mIj612P5crut5P6acFRsv5Dqa9mLEHVrcxpK3bvywpV4Nh1FaViL6hdN1CdhYpnUCpcEGcBmD51ta6A21fd+41iPx7bdu/PY4qEnDRNrUrDu2+Uhngj60wt3Gpdy//RbcLgrmPlpY3L+/
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA6PR02MB10503.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5265b45c-7571-456c-922e-08de41821f9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 17:47:06.4983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4B9kTQ5SV6b6tjCyJfVYDYOQ3gKevn81p91STi8Z6vuo95qvgvDqaoeN/pg5L/hP1LYpWC6ardldISoYXo/k+cyqqOxUnhHyGNpmZaewYms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9618
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE2MyBTYWx0ZWRfX74ZZ6VUmzlQ6
 7k2mZkZihCNZDBcmGgKcVP4tSeKFwIj3x5+vsCOtccf1Ifguj4/JA/1Qhi+SV59aaHBPNXweg6x
 CeJz0vbwpVnFDnIbXkL13/3WzU5+phRaKsybIEC/eNStYTBuaXUExU9BVuipC0WG139bTWVUA3Q
 lUIZfFKiwK+qua91e32LwmxzMw7/WvMjGdk0g6kq2HQvOgBnl6795oc8N15j23OknzLvMHQGLIb
 hRPg+gfi+0LyOhFWwwTT46sxCWtaQqjGcJ9TA/hfeO3PECjuaeo1aDeMwl7QSN9iYsNglOk452M
 vZkuYauJZDpmCzgO/U7whfA8yziPUohflAktTy301Y3d0VAhB5oOF/J8WNE7NIlOgv91wFEdCAY
 Qw04AMp3bumfIL6BrNOqkQ2WqijcbULOJbr0wd04rF3KqgVRpPPzQo9hniFg7RqvP+9UGEYe/YC
 imaHVpnuRhrJazQvY+g==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=6949841d cx=c_pps
 a=OYTBATO8h6EMnG+Ds1NGug==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=qqhCTvBWDEbQIaO3uFkA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: -Bjdm_uOOF9XVw5hj9XFUtyn9Lm-aKW0
X-Proofpoint-GUID: -Bjdm_uOOF9XVw5hj9XFUtyn9Lm-aKW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220163
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
