Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFEDC44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 08:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D6110F49C;
	Fri, 17 Jul 2026 08:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="sGweuo2o";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="cDIzrh3a";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87CC10F49C
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:13:13 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H6bwJB2840233
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:13:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=ukjrVxi2dWXuVxz4MC7c5IoQJSY8ytDjI8XZKlRe5sE=; b=sGw
 euo2oFYDzwec+OJLXolrwSMuSQjv9vEOoKgNOTZPIF9b4a+J9ywKsrMqcZ5rLbr4
 l5KVnEhPiU9AErphmIEugXU0dcpiL2wJKpNd73AEqlBPriy5iNH1qQPtJOExi6I2
 rXNS8jhxS2GukQIERsq5pncH68jW9BGaFUUf4Xg4CzaiDCV6yd3bdTDJPb5ZofYD
 E6cZRBeQvsXH8IXNulYA1TXirKq6W0uzv6ykSLUUQgEdVgMAr0KodiqytGL81xlJ
 1sO6BNQSIxaZ3odGqYhRUeOfXl5WYuTnjAvIWp8li6bfmIiM3joQI62EQ98UWeQw
 RAanaZk1Qf8no1ipFQA==
Received: from cwxp265cu010.outbound.protection.outlook.com
 (mail-ukwestazon11022127.outbound.protection.outlook.com [52.101.101.127])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnhhy-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:13:11 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpL1+Y7+TWg0Y0UjMmHaB4ZSkeoZNXghmTzFp9K9Yt4Xo0+RA8nkMecztahmns3gkAkVW5HX1vl6AErna6QXGktcdMftba+cXmPj1rxAbHn3SNHPC41ALuU8M4V8S2JJvtMQ0QI5/JJnN/w70T5kq1PANFCBqYvOqQdg9y9pUCe8qFLn1tvcM7o6dt5myZJdr4s22k7D/A97HVySAkeqi3gyk14gyvx5P26GbJiRCYRHVGQs5GxrdWcL9+O3YKiMO8a8eLqvmpa0wwKiLrxqqqNhYh7MSfbX2kV64NjivwdQnadUsUQTOj3c0bbB/mbdE5d3iV19zGyIRoZpVT/1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukjrVxi2dWXuVxz4MC7c5IoQJSY8ytDjI8XZKlRe5sE=;
 b=LGNEYYOz1KTzjh6c3Ya9eUoVhqesQSZLPbq0xo5fllbpf00LCMQSlgTufXdrF1B4F2VDo0oBw61mpCeGXp8tYwnvN5hx99lhZN/yOh/VAYPSZ0Ddh2jCRZBA31ktZJ7PE5CMY6lPboNeiILIinyjixGOMsMeIGjqmi0jEl3pnW18Z3jDpA3qyTNEOvrUDQyp6yq1erOSL06U+B7FHypo9KosAHM2q2KPEkQK1Gq3i7Hxw3fVAa+69EUfmvSyHFNe2K5a+LDzjmUADwOMcALF4Uwb7cgDOfSoqg7TWlbKvpt3Eaw7ob/5WcPhjhOFoBCkGIfk8wEWsENMJY04zc0wRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukjrVxi2dWXuVxz4MC7c5IoQJSY8ytDjI8XZKlRe5sE=;
 b=cDIzrh3a3nR6vqoSgOe+SHq2bEqr0EgLH56siIhfdTGN/TvDB+Xy15JdKCYVcqSX/Gj+rL1pF1HycpvFa1VYTNitH4X2iGgkd8FbAppoUKNytpVSim+6og9YYqPbg7GGCIcQHXVI+m+vNRd9WPSHYYYpXP3C/H1n8O2G9n2yne8=
Received: from LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:222::6)
 by LOAP265MB8557.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.24; Fri, 17 Jul
 2026 08:13:10 +0000
Received: from LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cc2d:a46c:188c:17c]) by LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cc2d:a46c:188c:17c%5]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 08:13:10 +0000
From: Robert Mazur <Robert.Mazur@imgtec.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Robert Mazur <Robert.Mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
Subject: [PATCH i-g-t 03/10] tests/imagination: Add DEV_QUERY tests
Thread-Topic: [PATCH i-g-t 03/10] tests/imagination: Add DEV_QUERY tests
Thread-Index: AQHdFcQb6dCsUtxFIkWbrgx8o99row==
Date: Fri, 17 Jul 2026 08:13:10 +0000
Message-ID: <089fded08af8485fac532da2d8d0882520260717-test-imagination-add-support-v1-3-2f02f9cc3b53@imgtec.com>
References: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
Accept-Language: en-150, pl-PL, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB4797:EE_|LOAP265MB8557:EE_
x-ms-office365-filtering-correlation-id: c8a8747d-7bef-43ca-1a78-08dee3db3daf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: DvA/zSZqBY3+8Z7bCaARi8DJwT12YeRQ0wgr/5mu5CDFXXbwcegQKL/fdRmSPucreH6gqw7cMWyDSIVFKuv3HZ8EZd4sJvOcsNhp8qdWhxlZMX9CbDycymeg9onaHViuK2ZXRdIkY2Gt+CbHmeEE3w18hdT20N+Fmlk6/tybfnNbT6GT3360FLDlS2B1VosLpuVGqyu/OR39MT+nj03OwJkpAvB0HOF/zQgK0lWklyFraO/JbOts/yy+gqJIeOBMTAemdMnPgWfMrc9u/sXa6Eop3VUcLs9LWP7vbRg+EbCtUj/iYB34JDoBFM8pfNs3Yioh1juhgLXu4dsHL9rZk1c20ARDRhvkcv27DNNfEtjdPA+zeXz0f1kg3wHEYptXIHrem4aP2iXjzTpXLv27KtoP0EfMCNmdvxYoY9x/4hez1skiFJlRSWY9Yjb+Y7ClRbCk5wPPsMqxaWzV3EieruzkCPu2b8NnGZAOWqXeaMpimFeMpi242lMhckSvhsdZe3oJG5H+nAmF2jdlxyuiZ5n9iKhUXrr5gSe/nrmHnQWU2GLR7qcCjl2HMPBe0CN2ddf3JGYitbTE+SLVF/NQl+eXTPRbHD+zVQkdwn0APt0qxyO46TEseyMwchu3qrMQwpCQNaSBwcHlyItFnB5xjyJmEluKMCkkQXGrZnUxMOKwaFr/Y8MzfwsjSK0jb5Pck4LrxdoTAUAhXnSvQWvAFJoOVpADt6AJCO8Wdke6lPw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(38070700021)(10067099003)(56012099006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E5tys319XPbukzxIplAZikkr8SCVViIxH19d4Jfe+6kr0GztY5DRDQTchV2F?=
 =?us-ascii?Q?KzAJQYzGGLSmcf2iDOcimTPAvRWxwnlJYi2ad0xUrEy4PPjUSxTNbTo0kRNU?=
 =?us-ascii?Q?+y7quvhYqoQJbUcXLdD2ML/QdZJiK1epJFF/FRCVPkwAS8EFSSKgsgyx/j5r?=
 =?us-ascii?Q?R6mjejcrHuCKYpw8qpR1mr/LVGgXXUucOwvZC2ycnBw9a26yD11fXZs3fFN5?=
 =?us-ascii?Q?rKQ1ndHjBUSdi1dxnKDf0tEyFXyHT3BhsDBpGKmYM2kZq04yJ7k51YLjQ+r9?=
 =?us-ascii?Q?PyfwhSAJhXtyUkwIHIMfzHE9cRg4XhMrALk1THijWnV07FJVhDXVpJRolkha?=
 =?us-ascii?Q?svgg2LMgS/WnzM9/vxTCphPYpFvgycTWCEXmNzfNb4FP+PLvOewp9hku3dZt?=
 =?us-ascii?Q?JcPvFMMWroAlZ0UdW0y/DhnsrdMzovzZx+CrjfNHdoaAnWgW1L2tb2EC+Gp+?=
 =?us-ascii?Q?+UhpTbMz/aQBbYs/woD15YpW+4+fpQXo+OnhRH3/48316zLbbpVDycUFI4CR?=
 =?us-ascii?Q?N698HntKawZd10wwqB8xD8MKEVcL8a6gXsxnbS9nyc0jNIBFLPZI33selypb?=
 =?us-ascii?Q?SDV4ADYDNlDrgI0vyqO+jlLvmUjXoYIHikhOo/Ywgol7UIwLWjpK2noOiQZd?=
 =?us-ascii?Q?43EyYLepdW4nKVs4aECt0mdHkYvqIAj0gGZCWoaob+X+jd3X2XPYxByctAB0?=
 =?us-ascii?Q?PonuuiohGfBu7iNZ7dqLc+UCMkDpY9kCJjNV8YCl0lN9cqUzfiEMhFydziic?=
 =?us-ascii?Q?izaARoHnJgPhzHAqV+9fGyEUfwaJajG69DJVYjId63Or0ktBGd4ojwQu3ExS?=
 =?us-ascii?Q?G6/UpxvXtz+mFw2Wrw/ZI1yintQekXYwOYsb60xkNDAJR/yk0vLP+rtdLvsP?=
 =?us-ascii?Q?M5y8IamJWwIP3Nc3r3aPPPhBfln/dlL2YJTImTA24c/Tlt1uGhVBfvF2O2pw?=
 =?us-ascii?Q?7sb5I5R1rwg8hOPypLxGXa/rwhgnHFxqO0by/MakK9iLPJ/3WRAoKlIwyvyt?=
 =?us-ascii?Q?PjVe654aYC6zfgy8fWKxQdg25CO6aax/BylY/07tUxiYifFdcepLI8xkki+C?=
 =?us-ascii?Q?gBuSxC+1bsQlne6JY69+r8NHejriHLKvgoYEWMwYJfn2SMFeTkkuvhGjGMo2?=
 =?us-ascii?Q?OB3Y9QZ7GdJZKIYVAXiCxFC9w7DzJe+l/0bpELr1agXD90Vui2nmvFiMWIMe?=
 =?us-ascii?Q?Kkv9wrf0cihhV1XtM1L5dW1PZwAOgpnzmen3rpm0xu2OHMUFhpW4zVwNmxrn?=
 =?us-ascii?Q?TP5rGiaE1yS+wdr3/oDSO1xW6O/yVPkw+2vA3BcgLfMS/BMzECcczPks+MlN?=
 =?us-ascii?Q?PhURn3HQwhdwVk+BBCBPL9OJldyRskwhuxJ8FzWBheRuqtGq6yXJNona2P66?=
 =?us-ascii?Q?6lk9gKmBBrAe6O4xbDmBjoiKrAJAX19FVpW+WV2BZuTV/NBj1xihjxK8+HQd?=
 =?us-ascii?Q?GoKxzIC7L2FJ7IgeMKrW9VEDn9AqmsrJ2I6lWjppVNOKfxd3hcZmJy5qTNqZ?=
 =?us-ascii?Q?DAKF+wX58pxu4nDFNQ8Puxckmxtaamm5CwDKOxH51oDt3XgVO6MqOifLA1X+?=
 =?us-ascii?Q?o1xOCpbtRV4cUs7KbbrbcTvNze86vYMzXn5bhUtOu9YFzjTcBG+6Xh3h6n4j?=
 =?us-ascii?Q?Q9VvF1u8qtQgkRCkLohI6Nv8wE706gRWCzwxZskCSaV8haGOP7wz9vBZ9WJQ?=
 =?us-ascii?Q?70nXJkjCbS3JhUtChd11gApM/mu2hquNZUThm40KU2OQonJ2SZg5xtjpoHGY?=
 =?us-ascii?Q?qc3yreRXfA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <18E4FA672F2F7246A3F85C1444B9FD8D@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MM6m89a6dSaAeC2Z1v1qQhyzObif+bqH49owsMzPdxtS9k7cjGVGzd42ibp9oMlL715fw+Scm5VTIvgJ4GJhb0g7pnhDuFYPZPEI+SUDuBB8NljJw1O6fZVayqVQvHlDkUKcgtd+RGizXFIYlGr5nZsddVL+fMhwv17Y++ZLkZNnGQCL6O/g7wIpmANLWnFOn3h/GpSOZM0EHJweXrrFcyelg/rsVOnC2G27D8AaPN/QFDfJ6/DXfvblwX7NjIo2xBvc9etorRhmEcpkUt5winlljY0KDvLIi0MxNktmjEKz58w8QKrEpCxW2qPQn9haZqwaAifsIdCPle72dKB3Bg==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a8747d-7bef-43ca-1a78-08dee3db3daf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 08:13:10.5158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BLSMw2+DmqE1LTmp2DWmnRYCSk20RmzEyFCBbODOAh9xX5KVEWzMMdoKIL9ONgPY8kfOwONrrikveethP0tMbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB8557
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4MCBTYWx0ZWRfX9icySDcUzuKs
 40M2kMmWQFsiyne2o4vzKdTTxyhi56UVUiv5G3tXeJNDbUpO78DVfh6EMOvGinYUpQb+CyfoQFm
 7SKAcM7UQVu2cr9YLNE5PnISPsV65FtW2tPcLAuUsbUdCVwzvGxQdLpBGwpyiTbWOLOLW6lLY9T
 OeNP4DFxq9wcwedPfw/dKS4sEhOKWf4cfsdb19N8sYZBDGOJB6D8AhSjFogt1rljSm6fLCi1GGL
 YLoO2i/4BOJIpuvP58LKeVNR3oHuIQ/fCy850V4xtjvTPEGCGWjlFUf+RsQjFlDkSlbH0+JZkop
 WjhJf9lMtkAz7Sr7cs5qHmlL8yWGOs88gMRrjNx2koklhdKP38JE+mJ5Aw+XP9+KjIn9TZD6d5e
 OsTGbfhTlJtjWsZaDw6068ynvjSSNwCqlK3LQrnzkuOqs6UMeHwVhu3YiBMWHp/oezTB1Y0ChIC
 /fBWnZkHyrEudufzREg==
X-Proofpoint-ORIG-GUID: WUJyBqQmjrDXOwk4uyFZWgOSgQnp6AGa
X-Proofpoint-GUID: WUJyBqQmjrDXOwk4uyFZWgOSgQnp6AGa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4MCBTYWx0ZWRfXzksfbTw4L3kg
 02AdV0U7HZmJEOI2+nMLKxLbPQqbVHLv2GuneSz8PJD1O436Hjo/EMf9sOV45kp1S+hcsUmJsto
 FXaSqHoJNiVLdLAg+fZzyWu2wcq51o8=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59e417 cx=c_pps
 a=gvJNE4SjnlA2l7VySTIb2A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22 a=r_1tXGB3AAAA:8
 a=5dTYAPD5xSfmRx3JF_cA:9 a=CjuIK1q_8ugA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

From: Donald Robson <donald.robson@imgtec.com>=0A=
=0A=
Add subtests exercising DRM_IOCTL_PVR_DEV_QUERY: invalid type,=0A=
successful query of all types, and undersized buffer error paths.=0A=
=0A=
Signed-off-by: Donald Robson <donald.robson@imgtec.com>=0A=
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>=0A=
---=0A=
 lib/igt_pvr.c                     | 19 ++++++++=0A=
 lib/igt_pvr.h                     |  4 ++=0A=
 tests/imagination/meson.build     |  3 +-=0A=
 tests/imagination/pvr_dev_query.c | 99 +++++++++++++++++++++++++++++++++++=
++++=0A=
 4 files changed, 124 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c=0A=
index 957d459b1..a729618d0 100644=0A=
--- a/lib/igt_pvr.c=0A=
+++ b/lib/igt_pvr.c=0A=
@@ -54,3 +54,22 @@ off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t =
handle)=0A=
 =0A=
 	return (off_t)arg.offset;=0A=
 }=0A=
+=0A=
+struct drm_pvr_ioctl_dev_query_args=0A=
+igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size=
,=0A=
+			void *pointer, int expect_err)=0A=
+{=0A=
+	struct drm_pvr_ioctl_dev_query_args args =3D {=0A=
+		.type =3D type,=0A=
+		.size =3D size,=0A=
+		.pointer =3D (uint64_t)pointer,=0A=
+	};=0A=
+=0A=
+	if (expect_err)=0A=
+		do_ioctl_err(fd, DRM_IOCTL_PVR_DEV_QUERY, &args, expect_err);=0A=
+	else=0A=
+		do_ioctl(fd, DRM_IOCTL_PVR_DEV_QUERY, &args);=0A=
+=0A=
+	return args;=0A=
+}=0A=
+=0A=
diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h=0A=
index 33d826077..e949772e4 100644=0A=
--- a/lib/igt_pvr.h=0A=
+++ b/lib/igt_pvr.h=0A=
@@ -14,4 +14,8 @@=0A=
 uint32_t igt_pvr_ioctl_create_bo(int fd, size_t *size);=0A=
 off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle);=0A=
 =0A=
+struct drm_pvr_ioctl_dev_query_args=0A=
+igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size=
,=0A=
+			void *pointer, int expect_err);=0A=
+=0A=
 #endif /* IGT_PVR_H */=0A=
diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build=
=0A=
index 65b90c39f..62930da2b 100644=0A=
--- a/tests/imagination/meson.build=0A=
+++ b/tests/imagination/meson.build=0A=
@@ -1,4 +1,5 @@=0A=
-pvr_progs =3D [ 'pvr_gem',=0A=
+pvr_progs =3D [ 'pvr_dev_query',=0A=
+	      'pvr_gem',=0A=
 	    ]=0A=
 =0A=
 pvr_deps =3D test_deps=0A=
diff --git a/tests/imagination/pvr_dev_query.c b/tests/imagination/pvr_dev_=
query.c=0A=
new file mode 100644=0A=
index 000000000..cda2b73cc=0A=
--- /dev/null=0A=
+++ b/tests/imagination/pvr_dev_query.c=0A=
@@ -0,0 +1,99 @@=0A=
+// SPDX-License-Identifier: GPL-2.0 or MIT=0A=
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */=
=0A=
+=0A=
+#include "igt.h"=0A=
+#include "igt_pvr.h"=0A=
+=0A=
+#include "pvr_drm.h"=0A=
+=0A=
+#include <errno.h>=0A=
+#include <stdint.h>=0A=
+#include <unistd.h>=0A=
+=0A=
+int igt_main()=0A=
+{=0A=
+	const enum drm_pvr_dev_query types[] =3D {=0A=
+		DRM_PVR_DEV_QUERY_GPU_INFO_GET,=0A=
+		DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET,=0A=
+		DRM_PVR_DEV_QUERY_QUIRKS_GET,=0A=
+		DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,=0A=
+		DRM_PVR_DEV_QUERY_HEAP_INFO_GET,=0A=
+		DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,=0A=
+	};=0A=
+=0A=
+	const uint64_t sizes[] =3D {=0A=
+		[DRM_PVR_DEV_QUERY_GPU_INFO_GET] =3D=0A=
+			sizeof(struct drm_pvr_dev_query_gpu_info),=0A=
+		[DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET] =3D=0A=
+			sizeof(struct drm_pvr_dev_query_runtime_info),=0A=
+		[DRM_PVR_DEV_QUERY_QUIRKS_GET] =3D=0A=
+			sizeof(struct drm_pvr_dev_query_quirks),=0A=
+		[DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET] =3D=0A=
+			sizeof(struct drm_pvr_dev_query_enhancements),=0A=
+		[DRM_PVR_DEV_QUERY_HEAP_INFO_GET] =3D=0A=
+			sizeof(struct drm_pvr_dev_query_heap_info),=0A=
+		[DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET] =3D=0A=
+			sizeof(struct drm_pvr_dev_query_static_data_areas),=0A=
+	};=0A=
+=0A=
+	struct drm_pvr_dev_query_gpu_info gpu_info =3D {0};=0A=
+	struct drm_pvr_dev_query_runtime_info runtime_info =3D {0};=0A=
+	struct drm_pvr_dev_query_quirks quirks =3D {0};=0A=
+	struct drm_pvr_dev_query_enhancements enhancements =3D {0};=0A=
+	struct drm_pvr_dev_query_heap_info heap_info =3D {0};=0A=
+	struct drm_pvr_dev_query_static_data_areas static_data_areas =3D {0};=0A=
+=0A=
+	void *const containers[] =3D {=0A=
+		[DRM_PVR_DEV_QUERY_GPU_INFO_GET] =3D &gpu_info,=0A=
+		[DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET] =3D &runtime_info,=0A=
+		[DRM_PVR_DEV_QUERY_QUIRKS_GET] =3D &quirks,=0A=
+		[DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET] =3D &enhancements,=0A=
+		[DRM_PVR_DEV_QUERY_HEAP_INFO_GET] =3D &heap_info,=0A=
+		[DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET] =3D &static_data_areas,=0A=
+	};=0A=
+=0A=
+	int fd;=0A=
+=0A=
+	static_assert(ARRAY_SIZE(types) =3D=3D ARRAY_SIZE(sizes));=0A=
+	static_assert(ARRAY_SIZE(types) =3D=3D ARRAY_SIZE(containers));=0A=
+=0A=
+	igt_fixture()=0A=
+	{=0A=
+		fd =3D drm_open_driver(DRIVER_POWERVR);=0A=
+=0A=
+		for (int i =3D 0; i < ARRAY_SIZE(types); i++)=0A=
+			memset(containers[i], 0, sizes[i]);=0A=
+	}=0A=
+=0A=
+	igt_describe("Test invalid dev query");=0A=
+	igt_subtest("dev-query-invalid") {=0A=
+		igt_pvr_ioctl_dev_query(fd, (enum drm_pvr_dev_query)-1, 0, NULL,=0A=
+					EINVAL);=0A=
+	}=0A=
+=0A=
+	igt_describe("Test valid dev query");=0A=
+	igt_subtest("dev-query-success-all") {=0A=
+		for (int i =3D 0; i < ARRAY_SIZE(types); i++) {=0A=
+			struct drm_pvr_ioctl_dev_query_args args =3D=0A=
+				igt_pvr_ioctl_dev_query(fd, types[i], 0, NULL, 0);=0A=
+=0A=
+			igt_assert(args.size);=0A=
+			igt_assert(args.size <=3D sizes[i]);=0A=
+=0A=
+			igt_pvr_ioctl_dev_query(fd, types[i], args.size, containers[i], 0);=0A=
+		}=0A=
+	}=0A=
+=0A=
+	igt_describe("Test dev query with too small size");=0A=
+	igt_subtest("dev-query-fail-too-small") {=0A=
+		for (int i =3D 0; i < ARRAY_SIZE(types); i++) {=0A=
+			igt_pvr_ioctl_dev_query(fd, types[i], 0, containers[i], EINVAL);=0A=
+			igt_pvr_ioctl_dev_query(fd, types[i], 1, containers[i],	EINVAL);=0A=
+		}=0A=
+	}=0A=
+=0A=
+	igt_fixture()=0A=
+	{=0A=
+		close(fd);=0A=
+	}=0A=
+}=0A=
=0A=
-- =0A=
2.43.0=0A=
=0A=
