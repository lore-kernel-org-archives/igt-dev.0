Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559DEC44514
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 08:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B4810E41B;
	Fri, 17 Jul 2026 08:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="xZjrYxvN";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="JENFZP6u";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCA110F49C
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:14:42 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H7CaJs2902527
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:14:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=fEyIWJTZNU8vLFUKfwwban0tcBGFWuKtYywfqgTTi7Q=; b=xZj
 rYxvN2rv2+cpYhr0K1tNF0MOOrpXs+uXglzujaLRNGTyTXt8diIcTLMGpNCcAl6T
 nTMLdQbyWvBvnBx6kkykZKFHlvE2Jm169hXJw2EJXN9CCfIv75cdrHLv6q0GVwNJ
 tPpH0hQT9Vt1ujhyWSUFDqsJVSSYJ8y0aXq+ne74vFVmiSCBQuT9jVrqZbs014js
 HKbcQyFiDHQHOrV4UEptWBlmL7bjg5mejfl6p4iOvzW2rvV+9o/9G1HsQaLHyN4p
 ZmI+45+9jwd/14So5dCQfYZ0npE/ckJhDBn8r/bDUQqUgluCOTrk/z5PPBVzzQx5
 xUm+4BSL9p/ixORpCkA==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021116.outbound.protection.outlook.com [52.101.100.116])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnhk2-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:14:40 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sw1zrtgp9h3rJmxplVTyt0lFMOpJlKj0omJviUaHtDu8lQ5p7NdXgwMX3GqpDBtuRGfgaJPpyGtxAlxdvu95tgCpl6adIkhUIggqfu3ElyDkWCBGUiW4ez/YVO/hfDkMAFftTGGacqkJMcFzb1gFpKX9iz8ZJ8hde375ZNpw7a4BHLzVstuIFuxqA2pWgvsnp4E9I6OxBhrI/lGkuywQ+8rMVvvAIPMNqJF+qUd/2A+ihBrIIF9v8J2HZp65q8tDbvbFpPSYX8VTf5spxdqr2PGOHXHtBOLSChbodqOo+q1gN3alA/X55lgxEOOBRjwYjAUkkLUvuHAvVsAD4ltbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEyIWJTZNU8vLFUKfwwban0tcBGFWuKtYywfqgTTi7Q=;
 b=n4t4MdsOcmPLjppD59MRBQ5HCiSKHuz0BWNwf3AmHdqX0vJIVa84LGWF1y+fzWyxhNw+Eq3uNwIqEWBko6frF60WtLYtFzN8H8oJIgi82J+8PzYT2vo2j+ykuU79Ik+r5cXV4vzYQNsGaPctyXgMsFDBaEohXlM8jBoavyPe69AdhItHtaE9yipW+AXtmEPaFvogeISWJz5yvyoJN6CSjUJ0ZgmMFD2gXbOrPc4SDVX/BQ8U1Z291nTDAfCPluQfJPfIIlA8pfP3QgdI3B9yAUqYKLeRm5MSxLmg6l/mCkq5rJuIqeTmxdHTIIbEj6NH35DaTHLTXd41B0gdcElwYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEyIWJTZNU8vLFUKfwwban0tcBGFWuKtYywfqgTTi7Q=;
 b=JENFZP6uSNNM/JWJxXPxVi9zObp1B3HuELZ+DyhcnZx6Bxhq1hm5yLn9KC6yAPE5YEPiBK5uuflJLdBrNFijFCTSimKCCBe5kpBgzvJ1CLPdOzJaTu8mGz3h1E4NKKwmsb5gciASa64jIboKRmycLgSHfT+YrVbtChZH53lGM4k=
Received: from LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:222::6)
 by LO2P265MB4965.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:22c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 08:14:39 +0000
Received: from LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cc2d:a46c:188c:17c]) by LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cc2d:a46c:188c:17c%5]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 08:14:39 +0000
From: Robert Mazur <Robert.Mazur@imgtec.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Robert Mazur <Robert.Mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
Subject: [PATCH i-g-t 09/10] tests/imagination: Add DEV_QUERY quirks and
 enhancements tests
Thread-Topic: [PATCH i-g-t 09/10] tests/imagination: Add DEV_QUERY quirks and
 enhancements tests
Thread-Index: AQHdFcRQBWR/sg3tj0uCiyD9grNvXg==
Date: Fri, 17 Jul 2026 08:14:39 +0000
Message-ID: <5eee32de81024033b63b62ecdb1bb2b120260717-test-imagination-add-support-v1-9-2f02f9cc3b53@imgtec.com>
References: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
Accept-Language: en-150, pl-PL, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB4797:EE_|LO2P265MB4965:EE_
x-ms-office365-filtering-correlation-id: db6ecdc3-69d2-4dc6-e527-08dee3db7280
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: m/5Oe9vpcE6Q81Hzop+mIH2cS2qJ3WGrwTbpLQVix3jVxfTCXoxUb/xZmLhYkWqDLQH2XTQaG+LS3wBEhaefJZcte1JoFuXQ5pslHriH4gwu62MnkCxMOhdEIS3l7D+Q9ZuRbi/9ZP58Hzzfvr3fi+CL17u118f64Ac8b/NU0Wk3ozghpL8ZRSB+zP4cNTApn1qYWvEdLJTc0j22OfaXQWlawUFAg8O30kuGhBn+rnSON+k/iswW+Z4ieB/n/USt8w2sleuqUNDkdrgi+GfyqNS9jCyCoRVy65JaB++uJTK4HxadasjVr0bzJImFsi1qglRvWVSYp4DaiYAvXGuXw+LSTj9SgsU+4vPFLFoshQGrMuPgb58krCh4j4aj81xPFm9yY/hXURbIcQBdlZ1imhGKoGcP6NiImEh7xiQ2sBJKtTQZPi8V3ydDx2kHpK51zGnDhAi3G44hiqY8fDE4w69BtBN9SpECUqpALyej/iHKowkbKPK0v3F8K0MQeKMXcm4Ezv2aPa7zJgKvTbki7ZWWWjsU0LfgCl4obmSIIf1todeDRcslX1Qw42aaCjnwzepvlgpzIukxDWT63LKrSGnzogqougGzAl2s1PNuU/yjfRvu7THpfazCsnimHvCB57P6k7gxIm2hLgx5puPKA9IsYQIUDQk0dEiKj17+vIyzrk/RbVv7Hx+ElPzM0U79HTBYgBXJAUhJizhL1NrhNxDz/mD9iiMEK3rtXwzz9Ig=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(38070700021)(10067099003)(56012099006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j7av82gWnf+b5rmWHkrpyDGQlUPDLGNPx2KC3GktCXJsbONsZ5UQaOGyCOhY?=
 =?us-ascii?Q?oJa7suM8yhD1p6ZUlVo4G8oQSO9vg3e0igekib1ToAtbW2/KPqGky6letZ/e?=
 =?us-ascii?Q?uI7kdUeNYo61EGatUHpD2X3pND+eOaxvHzl6qxBrKl/3c/5T3ENDzWJnt9qe?=
 =?us-ascii?Q?BVP6mNt5y/v6eOD0NEi4QE/JGqOccvStQVE85i+Y2tWN+17f78VeIXYa/fMi?=
 =?us-ascii?Q?A55DIXfCWtEt5r9QRWZGeq6HlRz36lhqD1AdUyNgsFP1MQjOi/jhSJC4JmWQ?=
 =?us-ascii?Q?CisABvr5kpaV95GjWrDp8cKxrc1/Yl42WAH065g/F4rub7EWIvjfu/Dcz2ss?=
 =?us-ascii?Q?R+gG1Lg9gp4Cr/V2w9mDO7tIztnqm4YoKkH5ygAg1avI2fLWd/vsol0pTq3d?=
 =?us-ascii?Q?x6nTS1fwoZDFddtrkjyQTRhooMMxyaCnYtdiCNuPQfyyW6ffLd8tDFI/PkJs?=
 =?us-ascii?Q?eGcIN352vkoCaXt/MWqTBTU6Dc6W4Uz2Np5xa+G1swg8WDtxqQfKlI/LEoDu?=
 =?us-ascii?Q?wE5XiZhWLOQRmtxShwdKN1HWmARR7POX9yZQFdWtN6ibMNUydRXOIjpz5pqj?=
 =?us-ascii?Q?vOcLsOw4jvqNdx2VdU7EJf9sTLWnr7iZh3s0rr9YI0HSvS425U6cRn37y5L7?=
 =?us-ascii?Q?e7yvLrSb8rChThbYbyvz5WZZzCm+OUC5iZE3UVPBPxk7Auzy+CNTnp1zzrzJ?=
 =?us-ascii?Q?MkL11YfusmLjB7n4+ewemPxzBeEBCI+uwFNSti4gnKpbVmFoQfEGT9EJsaJ/?=
 =?us-ascii?Q?4PhI3zvn5F6zyOEzzwEhahYKxINH2cUhpLsuqfNOpeuR+aHoVITemyfn8XHh?=
 =?us-ascii?Q?UQHYp7LTOFDwJ210z9sy7gNr7setrvv7eU7981Ny6sIN/kqE471wIlHMmL+V?=
 =?us-ascii?Q?qAPn8eDwp6IHwB9aPbyYyZdRdcldxyMGUxey/VuznxOU08XMTAOTeLqIPal8?=
 =?us-ascii?Q?CD/qmFwnUWHsWHdLbzlbw7+v+fAklYULwLJrTpeX4exKPrDsPqnXFz77fP5D?=
 =?us-ascii?Q?QQGiYpKo2EQRoFL8LLXpPGGQgdVgp+bDKJlXQpZDHfrVMYdlkRHpIog/6LYl?=
 =?us-ascii?Q?PpR+OILcLB5KqSB2AWTQ8f36bkv3BY4roM+kK2sr2qbM67wfmSs/oVWDT+5t?=
 =?us-ascii?Q?Sj0R2HgOVGslnyYOZq/7cIEFaUY1PD3N27QhAU63gClS7HOTmOy2ritq5uaz?=
 =?us-ascii?Q?ci1qkiF+/LUJ2prPONWTkzIdQYHiLHi65g7gw0seVjQVsSWaOL8u0Qn04wJS?=
 =?us-ascii?Q?NSk39YERoV98ux4KH+E3OQPi6QM8dORmZ4cwRhumCoNjwWiA8PFHLCsAKyLF?=
 =?us-ascii?Q?j6wrGrqM6JtQsoTvbxbDYgoS23V4CPGs+3FX9C6HH/54c15ffLCcRIkxBbno?=
 =?us-ascii?Q?TefUZby53V67X73KWDZ9wETrG6/BHG1AFJB5zrDxrd9+yZRpVYThpFRBkSfc?=
 =?us-ascii?Q?P9uQOrdbwViPJ1U/zbwFNTQ3DC431b3mUIGVVoeowPvr3XYlW/YpNqJIOZ1t?=
 =?us-ascii?Q?TmRAHIkNgRQ739Ds/U4E2+Km8h4xZXOTDiQLxDlS8v96qhr1r2sPWrLC8hc7?=
 =?us-ascii?Q?3Rv3dyGyRRTUVd8oJWK5bSz2uBsV1toWY33gcfTeCiZDUFUXPb4HEJiOel97?=
 =?us-ascii?Q?bW1KxEDHU8qQXW+rGt9ou86bfKbUbjmkB2Jkjhv5mXOmlK9b0Tk12badMmDu?=
 =?us-ascii?Q?GjGYj5EgqWDIiZ06yZj5+nw/4vNCKeGmrmfOfmbSNxQHITcC/cMf6T39dlYX?=
 =?us-ascii?Q?DXAspWqEuA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1B0B0D6B5B54D342BB38AA71C42E278E@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gPwuRqxbQqggXvZRLt9BVlza89esQSuPzLDdRwySb7BS+bgA9SBHa2L5MeBnJTI8TFqSmyorXckI1e2sd62kDyLejJrIND8FJ7bzqraxpvcERVmBvMlx8rUTd9si8/yBuxhMMDkl9WUlymB8WWgBlwL5was3MHYCTeCsS+KllU8tWV3+qCs8NtwsYrux7lDuqlpNWZW6hRLuZufeqdjl/aDxWxNXoiGrq59IfjQ4k7vdBvhxzlzcgJwEJ5Uj3keQGLJweDUFP8VoNRnbdLltyyBwq8XANTx4/XqD/C3Vs4kpGgxA3VvLfCaRdiSas5CifbLnId5IZJ+mGWH2fRSs3A==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: db6ecdc3-69d2-4dc6-e527-08dee3db7280
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 08:14:39.1561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Xu+RnkKlL3F+VFchAQEgLpSInhharwFok8OJNcMTBr0UyzRYp97xzAVMenwwD7dRjpVyVpgQjqFyr5bMKWS2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB4965
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4MCBTYWx0ZWRfX4eI+s0C8BMSz
 GsF4QdTuEltyQM66YdyzsPVrsDZhrcKxzdT8DigSMnjeUZ5lFgY4IZ9Mc1hzgELO5hKPkXKVzy/
 Qaty+cSusN+BRNEuvw6yLiw7pDzxe5e3hhB99W3cZHv1PwRdFs6AkBZa7OYl5+LLhCfYX7Q2ify
 VGqkk76xuFlw1FYC4l4mFXlTsb9qeqBlkN/cY8crJVXSLseOvi0T3dqBfDd9bekzEeqYq44EBY4
 eD/vxtb2RUQPdLZ3NrypgflN9nGIFEfgFTegMp+k2nDuyi+NJ5PF7tFtKVpbR5w7xC+Gju/ZBaE
 dKY0ES3Wf8bCJs3PEn4pdxe2K1aydzi7CHVaBQIXtL99bb+eFR/f81HUZA4oLmRY/MNbWAjeCyl
 S071qwZcP/SW/1i9C+HCDOQjzoh5Cp1w0+7FEECR9FItXDGgnadkqdSQxl1ulSH14iyBoSuiDc5
 hS3+IXLYefKuMjw0Vtg==
X-Proofpoint-ORIG-GUID: 8ZHVfKHssjqRkaVwdPsEqRpPOROUqoKc
X-Proofpoint-GUID: 8ZHVfKHssjqRkaVwdPsEqRpPOROUqoKc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4MCBTYWx0ZWRfX4gdPJgjJ4pKt
 YALMJpqFu6q5j3bSwRyjvqCYZONGuylJXhPtws/a/aZC4XD/Eb4tBoe7pM0c5JkVkITgWeElK7r
 aUOcEtBR8g0YEpqykDI3AyVHO97XxNU=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59e471 cx=c_pps
 a=OYGNFe+k9HfrWicz33hAaQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22 a=r_1tXGB3AAAA:8
 a=EtmrXVZ7CjpRo9WCTJAA:9 a=CjuIK1q_8ugA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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
Add subtests for DEV_QUERY quirks and enhancements: array copy=0A=
and invalid padding error paths.=0A=
=0A=
Signed-off-by: Donald Robson <donald.robson@imgtec.com>=0A=
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>=0A=
---=0A=
 tests/imagination/meson.build               |   1 +=0A=
 tests/imagination/pvr_quirks_enhancements.c | 112 ++++++++++++++++++++++++=
++++=0A=
 2 files changed, 113 insertions(+)=0A=
=0A=
diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build=
=0A=
index 69ef0a8c6..dc08a5d8b 100644=0A=
--- a/tests/imagination/meson.build=0A=
+++ b/tests/imagination/meson.build=0A=
@@ -4,6 +4,7 @@ pvr_progs =3D [ 'pvr_dev_query',=0A=
 	      'pvr_gpu_info',=0A=
 	      'pvr_heap_info',=0A=
 	      'pvr_hwrt',=0A=
+	      'pvr_quirks_enhancements',=0A=
 	      'pvr_vm_context',=0A=
 	    ]=0A=
 =0A=
diff --git a/tests/imagination/pvr_quirks_enhancements.c b/tests/imaginatio=
n/pvr_quirks_enhancements.c=0A=
new file mode 100644=0A=
index 000000000..876fed407=0A=
--- /dev/null=0A=
+++ b/tests/imagination/pvr_quirks_enhancements.c=0A=
@@ -0,0 +1,112 @@=0A=
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
+#include <stdbool.h>=0A=
+#include <stdint.h>=0A=
+=0A=
+int igt_main()=0A=
+{=0A=
+	int fd;=0A=
+=0A=
+	igt_fixture()=0A=
+	{=0A=
+		fd =3D drm_open_driver(DRIVER_POWERVR);=0A=
+	}=0A=
+=0A=
+	igt_describe("Test copying enhancements from the kernel");=0A=
+	igt_subtest("enhancements-array-copy")=0A=
+	{=0A=
+		struct drm_pvr_dev_query_enhancements enhancements_get =3D {0};=0A=
+		uint32_t *enhancements;=0A=
+=0A=
+		/* Enhancements. */=0A=
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,=0A=
+					sizeof(enhancements_get),=0A=
+					&enhancements_get, 0);=0A=
+		/*=0A=
+		 * Supplementary check - alloc one extra space as a watermark=0A=
+		 * to check the copy does not overflow.  We only need to check=0A=
+		 * this once for the whole UAPI, as a macro is used to do this.=0A=
+		 */=0A=
+		enhancements =3D calloc(enhancements_get.count + 1,=0A=
+				      sizeof(*enhancements));=0A=
+		igt_assert(enhancements);=0A=
+=0A=
+		/* Set watermark. */=0A=
+		enhancements[enhancements_get.count] =3D 0xABCDEFAB;=0A=
+=0A=
+		enhancements_get.enhancements =3D (uint64_t)enhancements;=0A=
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,=0A=
+					sizeof(enhancements_get),=0A=
+					&enhancements_get, 0);=0A=
+=0A=
+		for (int i =3D 0; i < enhancements_get.count; i++)=0A=
+			igt_assert_neq(enhancements[i], 0);=0A=
+=0A=
+		/* Check the watermark is intact. */=0A=
+		igt_assert_eq(enhancements[enhancements_get.count], 0xABCDEFAB);=0A=
+	}=0A=
+=0A=
+	igt_describe("Test copying quirks from the kernel");=0A=
+	igt_subtest("quirks-array-copy")=0A=
+	{=0A=
+		struct drm_pvr_dev_query_quirks quirks_get =3D {0};=0A=
+		uint32_t *quirks;=0A=
+=0A=
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_QUIRKS_GET,=0A=
+					sizeof(quirks_get), &quirks_get, 0);=0A=
+		quirks =3D calloc(quirks_get.count, sizeof(*quirks));=0A=
+		igt_assert(quirks);=0A=
+=0A=
+		quirks_get.quirks =3D (uint64_t)quirks;=0A=
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_QUIRKS_GET,=0A=
+					sizeof(quirks_get),=0A=
+					&quirks_get, 0);=0A=
+=0A=
+		for (int i =3D 0; i < quirks_get.count; i++)=0A=
+			igt_assert_neq(quirks[i], 0);=0A=
+=0A=
+		igt_assert_lte(quirks_get.musthave_count, quirks_get.count);=0A=
+	}=0A=
+=0A=
+	igt_describe("Test enhancements query with invalid padding");=0A=
+	igt_subtest("enhancements-bad-padding")=0A=
+	{=0A=
+		struct drm_pvr_dev_query_enhancements enhancements_get =3D {=0A=
+			._padding_a =3D 1,=0A=
+		};=0A=
+=0A=
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,=0A=
+					sizeof(enhancements_get),=0A=
+					&enhancements_get, EINVAL);=0A=
+=0A=
+		enhancements_get._padding_a =3D 0;=0A=
+		enhancements_get._padding_c =3D 1;=0A=
+=0A=
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,=0A=
+					sizeof(enhancements_get),=0A=
+					&enhancements_get, EINVAL);=0A=
+	}=0A=
+=0A=
+	igt_describe("Test quirks query with invalid padding");=0A=
+	igt_subtest("quirks-bad-padding")=0A=
+	{=0A=
+		struct drm_pvr_dev_query_quirks quirks_get =3D {=0A=
+			._padding_c =3D 1,=0A=
+		};=0A=
+=0A=
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_QUIRKS_GET,=0A=
+					sizeof(quirks_get), &quirks_get, EINVAL);=0A=
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
