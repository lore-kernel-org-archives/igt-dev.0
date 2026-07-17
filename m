Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4610C44514
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 08:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9F110F49C;
	Fri, 17 Jul 2026 08:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="r0RJ5HVq";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="iV65/69t";
	dkim-atps=neutral
X-Greylist: delayed 1304 seconds by postgrey-1.36 at gabe;
 Fri, 17 Jul 2026 08:10:56 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FD110F4A4
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:10:56 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H6bwJ82840233
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:10:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=ukjrVxi2dWXuVxz4MC7c5IoQJSY8ytDjI8XZKlRe5sE=; b=r0R
 J5HVq3JdmoVs9vFxIiUdQrZNe53GRvH0T1RQPCkUNBiKas61/geHkyzUsvt3c/+N
 T919gQM2f1J5xGX8JrFEt4d2dAgIXHSvemIKbEXoAgmNt6EGeJhbh/J9XfE/MEYR
 QXbdJmWIjY8ta7pvG3M98YWcWgBzJCM8Fkd/dX9aabdgUMVVhgE7Mw/5v4Uu9fpO
 2xlih3osCQFDYW680+NVedH2ryT+wsU+GDs/yM4YUCbvnlZvWrq0SZEMsNbKtYb2
 evjQZFwfHT5lRhxy2KmBLC9+kGJC4+46e8iEvCG8eJeSn9UUOdBJuPsQUOJfejm+
 wFc6PS+itHeTMrKYLBg==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021090.outbound.protection.outlook.com [52.101.100.90])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnhgk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:10:54 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7vNGdI+ypMZ+H6Yg+VTq9RnWNW7JSsAkJ7O+TulKiTeDmVY9UFxZt16pPEVKXMNi0V9a3TN1PMs0yvhcmeM/PkxvVwm378AT+cnBx5XsmWs3d7V7MtUxu5GbaLyZcYIiPshYlRHVefz0j3pj3L3PXuIr1KmzbWRwIt+eu6w8AQPwmGbocxhBUArJ7zyJSXnSZTeroRHAO1TXgyx01oqMpLt6l1rRC+QmL3/hZj8BP2fuz8i52oODaigMwzGq9BnxInLYrdvBx08OM0qlkfdshlstOoCDbI+XVcR05wMCesgTPeNigi2SfnMKg/oPBuqOvHidpNs5wlQgnRTbFcAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukjrVxi2dWXuVxz4MC7c5IoQJSY8ytDjI8XZKlRe5sE=;
 b=F6SB15jLHw8rptqKB9YE4DDm528NcqBm26WqAtc0GAgoV8uqkMFvMHonAaC/tfp9U5z8nneg7WKOm3luWRU22SA6Tz+gYrSE9KmajDHFKZ16JyfdSfy9h+InZH1QFQIXOGYX2cxfQ/WYCV82lVsfacI75BJQPWR/zUTOeWMw6CR3Tbv02HvMKayuxoepJSOUAUJedzuIyninolJEjyYGxiWmaNx8En0nBZEYwS/AlawpGNHlUB0ikVlPnUxkEAc9PjfBAUpUwl549ThJYX41uQJT2H0tBDTVLfynV2P6BdQygYCPkuc4OaeUi2FzerrBGYmR86pLkj4DYTo8OVXspg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukjrVxi2dWXuVxz4MC7c5IoQJSY8ytDjI8XZKlRe5sE=;
 b=iV65/69tu9+1wfgPTKYji3Eo6SsTY2urJWdNfEQ1V/+O+BUwP2lPiEH8oz1Zt3S3kxo2qFk3oYCQf5QzH/at3ubePL92OAxxrxxccmspNoMZFtV4Gl/s9gD7axcVWlhyol4XrCISc0ER+aOkd8rzufKooTtgemQAbhFfH4LDiKA=
Received: from LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:222::6)
 by LOAP265MB8557.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.24; Fri, 17 Jul
 2026 08:10:49 +0000
Received: from LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cc2d:a46c:188c:17c]) by LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cc2d:a46c:188c:17c%5]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 08:10:49 +0000
From: Robert Mazur <Robert.Mazur@imgtec.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Robert Mazur <Robert.Mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
Subject: [PATCH i-g-t 03/10] tests/imagination: Add DEV_QUERY tests
Thread-Topic: [PATCH i-g-t 03/10] tests/imagination: Add DEV_QUERY tests
Thread-Index: AQHdFcPHcwQ0Kb7ZD0iK998E3nE5mw==
Date: Fri, 17 Jul 2026 08:10:49 +0000
Message-ID: <20fe397d034344e689b54a8a20d33ec920260717-test-imagination-add-support-v1-3-2f02f9cc3b53@imgtec.com>
References: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
Accept-Language: en-150, pl-PL, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB4797:EE_|LOAP265MB8557:EE_
x-ms-office365-filtering-correlation-id: a792d7c6-5cb7-430f-0a31-08dee3dae997
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: 3GiGNcS+PtK7w/AMRGBeZ4M/rWBRMHPf4ZuJP4J9QWL3EjOe5iesSknQrWEUyaN1fPy2IHrzKoSvgbGYV/bOFM8t3kRdK0X5qQjIkdH6Xe3bwv2nxTlmYWAEmA0CLWX4entD0bt2tK3VJlgeEKqZfEHb+gCA4E/PQNOyGAOrHfEzEyMEXaJOqEq0bwvrrRFYg1ctWvxUsJt/JRyvlqB/tlI1cqP9OZr+meNUO4jLtADlqSTrSBZjE3jyunE888jV+vGOrRp/L+eEaaQ09wjaaGELwN6AwOOWFZN7XE7qG85x2JBu/swF8xff6b1gn8OcM+cCYktaZNwOLMkVFJ+LSBa8JajXtcz7/Ts/j6Mf1VescGfIC879TVmFl/Zzd7VhwBAx43/Gj4a80jhkGMezRRi6lmpYN1p5FurOFO0CnOJmOKiCQAu2YCkiL7ZOAPZu0q1wLRz8+oMeKoyiK2oduT+gcoN2+XwPqSX9sxdlXrmkbEc8NpYs2TDKK5EBnvA6NVe9wSH9Fulh0gT9If0QPX2wII/wJJUpMxKg3EpD3XjEC4ldReaHoJeSCJ39tUbD9njwqzKgUCYE3eVUuuGXnwnz6hjqJvJlBGF/kkDmuOcIf4BcRVLgCskMwJkPrk0pOkwxCQHdfJDqPlVJwPTWmy1nkW+3/PoQ0oTrmjSscfEOonnTfzYuzGrUdwnbZ27x2swNS802eB0J+fcgvPkz7FtuFHlCiVax9nS1sAewlHY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(38070700021)(10067099003)(56012099006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j8GFBh3VchfuCDIX8QczLadUxSAYxJKRI94cM+auk48GNecOTtfp4unPQNSV?=
 =?us-ascii?Q?1qJw58pglfIzxvyxS6h52sNgfQTqEaMvTkpzEV//2DBbcGZvT0DoCMQb5Jhc?=
 =?us-ascii?Q?mgVVvPo48oQY2Lc13bJEsLrfXyznziiJ9yIchaPvbwwrmeGprDx+BXoEVGD8?=
 =?us-ascii?Q?+U6EyCR+mk8A73xpMcjsSRxkh4NjkzOMF62RDDnSDBMpTbOp7P9/6l1NMAu2?=
 =?us-ascii?Q?jde6YGDFj5elNYxkqodneF/Km77lmGy1RNaXc54W1bc3kM8p3mFiuagHm38F?=
 =?us-ascii?Q?3G6PK15hNmXla2lqLSuPYadoSNDAAIYtMX4/7CWRaMs6JSP4mTH1EDrvhguQ?=
 =?us-ascii?Q?YWDUh1KXoZJEayKqV4foA6rgwIC1XTomIvJYdAvtQBOYARRAG74SJde2hkQe?=
 =?us-ascii?Q?Bl6Vkw5nPVQ/QCmet5k4ypwrzysW6bQUeWqohG5CdT3yFMXhNaYsZAhf5eEH?=
 =?us-ascii?Q?lgS4xqXcjnuWVUhMjNg8kNBxmXiZhkuKddelaGy4ergA9lwG4q0ll1yYU9fe?=
 =?us-ascii?Q?d14ExeDCLbPIMtlQuNTq2EoQd1xe0O3NbpzEuroyslO4tbMU7u5bhYg9m9ET?=
 =?us-ascii?Q?btF/O7CXzHtpTbvv4MJk/XEvc9pXxLf4/k2YF2wVDFOkfaSBjKXPkg8I5XdU?=
 =?us-ascii?Q?a0acwrW+FJzbhn7ls/0pmvLsKc4fqgvMq40GcfH1Fve9hICLiPjf7M5PV55H?=
 =?us-ascii?Q?g5CJz6NGsjK/K3c73A9Z1M/NlDxmhriLG0Ev6TXXXXNFMXuiT2gRxm54RCq5?=
 =?us-ascii?Q?GoTr6YDgmseK5LgxGwMivYDjwxvbDAHTZyTp8kjCZ3gyRQoLzXTEba3kvc95?=
 =?us-ascii?Q?cvlTpGmgmK95QYLEG4oSkuy+xMnfhuCls25krXM7VlRmtBSVydf478ZSnP3F?=
 =?us-ascii?Q?g8m61ABvpYc10ZdA5i74BRFvdvI1s6V762vih5ookaNOzF/q/zKa2RgkQNro?=
 =?us-ascii?Q?Gqis2oDzyFQX9cfZwZkXa9F/chrZlj9u6k2xW5YhTSKPgJSrCcCCpG3KqlNN?=
 =?us-ascii?Q?Jn149xMe3LYRiMDeI5VPUAGIoXe+S41sL5f6/4XD/gjQjtug8eVvOTs3tWwC?=
 =?us-ascii?Q?P7uz7YhS1SqrvygHgggHJBb5bv4lbSKZsBPYvUKu+8tC/trzw/SwN9GxJy3y?=
 =?us-ascii?Q?+TebCzvv1vohQaRjALJO4kT9MyX6t7oRXEV0LWFyRJCSGRtHuBorN3wVxOgL?=
 =?us-ascii?Q?qyklHA3ezmuBQDDGnSDtZGpriL7MeGV/30h8a8U1ch95nMN8Rl7FYjLz2VFE?=
 =?us-ascii?Q?eWC0EaPXoJDS8SYdcg7kJqPs5yh/gckvtDatp5dt1HSjtWz5XHT/QSnIrOM/?=
 =?us-ascii?Q?fLZG2adjC9/CRTtLPXDbtotGCxWfK39O8fRP/M40dGBYyzLMZyhgQUHHK684?=
 =?us-ascii?Q?zMGMJPLbTj/CXjxtb2Lu4onV9c8jhBAHEuhecguxau7V7gQgcgMBPtOjgqXc?=
 =?us-ascii?Q?exBfQkNybVpn4mAYWfxuzZsxwHpmYsC/s/Wmagmx3PgEGDvfH5mArgnWGvTw?=
 =?us-ascii?Q?zZ43RRBynj6SXcfbAd8WUrtEUk2p9DWZw4QDZhnNF6Ppy9C4VEdvxtq8CFFV?=
 =?us-ascii?Q?FsTGVYpYxSqh5DabU8bItgfBFe9jYbUpmhZhYcyP2qm52HdxPWarbN9aW9Kc?=
 =?us-ascii?Q?YvhfNmGL2cbEhxATCHH7wsPm3unZdbzOftyYIHdBz2lXdXHHiKd19TOAMCSU?=
 =?us-ascii?Q?QTnj99o4eb0GPOAkBf9MpOyqjYei493GarMbsQx66ds9coLoT48Xi84wqAfy?=
 =?us-ascii?Q?aOzmiCZeUg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <18E4FA672F2F7246A3F85C1444B9FD8D@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kiqhkWKLD6YzDT17u3cm0NP0EE5cSTdktJqXE3LaQX5hN7qFqBlt4oLhnrWXDXx4iC0cXCP/QrRWDnlmg1YGDZgwTk+FqcXy7qxGrkv7t7i3uSFZohv4BUQu/gsMcpYaBjg3iD5bkY1x8/jUEb4nU2cVGunR6hvq9CfquVXcJfdmQhgLNZTrtdLONwxvA88F5aBdGA0gYLvF0Kpq0J6sHrJw9Mh4Khf3sxx08qZvNf2KBsPdArbiExo6Zstzz9D3/qe7Ll3OZ0NSo7vxc9Ny+nAT/E8RP5M/6bJ3UPLM/kur36m6kAiqhq23EFTKNU91BfLZWmzP2UIJPf4XVqEIoQ==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a792d7c6-5cb7-430f-0a31-08dee3dae997
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 08:10:49.4135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0+lUBxgroPp3JJpnN64b0baYn1bDq7/M27bXYXnuNYXye3Fkl9PZn6fdNGQiBLT2lWB6q222QZzfUjXmavVYPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB8557
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3OSBTYWx0ZWRfX4Ac1aF5sEh3n
 uHAughRPLV2N/TnuCyzKXgHZ8FpZF/QpY3p5rsoznc0UybD44G7fKKoD7n8POUGufHhBRoOCGNE
 TZMcqufflJOO+l3JK98L1OGrRuP5EcO8yB7sF7Uv8IF6CZcsrQ0L3pPll0r8KQTE87vlhoMZioj
 WuTo7gnUz1SfOYiHNNhMP0VLMel+0Wo2HJxz1AAcA2RYQwYDZuZR11TRDYj8dI00cwrgW30ZVIC
 vT0Ov8FJ7eig6tuUHbnKgFsZ1FUWD9Yt0pMrBQUYZsSxFhUyJGwsPGTSmsqSR8X+8IDYlhNmm61
 +zSZFd96TUbhYzT/mUBSH2tlCXMRwLIhFl27nbGXfhIWIUp3PMouEEOJvlqXe720HMUNHgXIIoE
 fxtVV11kA4EpxdPTkosxNW4t175o+JH+g3VuhhkMOdrm3XRunTeihsFqOpw7bLYS2FKWuEoAF/z
 zP2dzSENJP5GSQTpddw==
X-Proofpoint-ORIG-GUID: rxr8CMptzZ4lK4yfbURyC3JpxRfEuRYN
X-Proofpoint-GUID: rxr8CMptzZ4lK4yfbURyC3JpxRfEuRYN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3OSBTYWx0ZWRfXx5FNDZPmWW/U
 84wOGVnlQh0QTRf8gcstnp+Y4pnAOOjx92HWb1+2K5t6XersFvOY5pRu0JpaBZxzcILaFSMGovG
 6Md67uDKC+ugtziaVU7+t744gprklaY=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59e38e cx=c_pps
 a=SjiCKwEl3a0GHs7CYKW/Dg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
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
