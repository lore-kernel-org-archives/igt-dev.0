Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7F8606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 05:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=et7X6F0F
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FCA10E2F6;
	Tue,  3 Nov 2026 05:25:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411A710E2F6
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 05:24:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A31eMtu1431337
 for <igt-dev@lists.freedesktop.org>; Tue, 3 Nov 2026 05:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/7dsFv6A7szRukZ5csPfnC5Y
 4/qBOJTE2HScoPTPe3I=; b=et7X6F0FDLCX7/fbUq0J5933sJnAWA8emXQzPhMc
 o/1q9e2ZkwAtDUMECP6iVvJCjWS+xHoaRtxj4qZV2zuGi9TvfHSZnhqC1Yfq2uoB
 bmKo/EmUHx868U5ezL0C9XmFuDAiAMReqsKf+QUgUyqHrQANpr26n2xxkIxxtQmH
 8WgVEZsmA1mBQdNmCMg+k6SAu0Zm2tBQGX5rgsVI4Va3KI91DKDHD0DIAnS719NS
 HLCoX1oh3E22UiPcdDndZmu/191en7FQXL1tQ/zi+M9NMhi24QLqg+E2CBHIj8Yh
 uPWE6Kkqvtc7U/fd23UXtB6VMhMZqHEIdHEkrQQ8TVZ54A==
Received: from ds2pr08cu001.outbound.protection.outlook.com
 (mail-ds2pr08cu00100.outbound.protection.outlook.com [40.93.13.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq08722fr-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Nov 2026 05:24:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHnFqFxLSNXjYTm9hz5sCTEnSfV0wWInAitQiAtirp4UfT0Zx/Nk8aWHA9SVu1tYQdldsteIuAUCaIce7Ao4TrFXuyWayIjJ26KkPcZ41d0iIppqxSGefrxgbFKE3p7q52tAFF3fkcWMICfC9bt4IY7oecgv9T1arDIQ6yMlKrfvCu31gQk7Mm/U1KCRxvpUHIhKW8nwEP5XW51DnnEYQtlhs1vEfPcRxnqXRjZlgj7naLTv9jBPCakwuVqvwXkTb3I+GcnTUbYuT278qTiegZqNc+6NxBYNbd53dz7Lay1U2w176PwXclhqlJUKR5xsbp/JDtbWpwvMQ0mIzeYHaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7dsFv6A7szRukZ5csPfnC5Y4/qBOJTE2HScoPTPe3I=;
 b=svIxNe7ukYIjSZnWDMD4SaBKKqpiWVk12C23vYY2sLPNS/0+FzGy2YA7VRsHhMMF0AVvMUeiX7kAD8LZFLcWxJZedOjiAnazwvGmbAn6r217g/ePLLwJ8DgPED+BsHjDY7RdbQsOkrVh+96i/EOYhDkTHRYype4CPRNQ9hc/joE+e7+mgMDUD30ZRO00OZXtrBmWpVtJ3iRKeKxQFAQRrCLQYYbZ4pMEd4mndMMPGTeyT4mmlvJUh4MSCrLM262oXhx1Mvlj624tSFBj4vylBHMyoFR3X8bkxFuqyLsT4EwqDVAg8YSdtqcnHS5g5uvuO1uI1lYut1cnycp4QSBd0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SN6SPR01MB0160.namprd02.prod.outlook.com (2603:10b6:805:e0::16)
 by PH0PR02MB11608.namprd02.prod.outlook.com (2603:10b6:510:3be::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 05:24:28 +0000
Received: from SN6SPR01MB0160.namprd02.prod.outlook.com
 ([fe80::ed9:b2ef:c824:8bf4]) by SN6SPR01MB0160.namprd02.prod.outlook.com
 ([fe80::ed9:b2ef:c824:8bf4%4]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 05:24:27 +0000
From: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jitta Vignan (Temp)"
 <jvignan@qti.qualcomm.com>
CC: Akhil P Oommen <akhilpo@qti.qualcomm.com>, Robin Clark
 <robclark@qti.qualcomm.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] tests/msm/msm_bo: Add buffer mapping tests
Thread-Topic: [PATCH i-g-t 1/2] tests/msm/msm_bo: Add buffer mapping tests
Thread-Index: AQHdaGWQzkqdHsOfq06OurrBKeysN7cbwLaAgAAUrqA=
Date: Tue, 3 Nov 2026 05:24:27 +0000
Message-ID: <SN6SPR01MB0160F38143FAF3486017FC6AEF692@SN6SPR01MB0160.namprd02.prod.outlook.com>
References: <20261029165553.1108121-1-jvignan@qti.qualcomm.com>
 <20261029165553.1108121-2-jvignan@qti.qualcomm.com>
 <20261030115415.ymsqqrolk3uvtqsy@kamilkon-DESK.igk.intel.com>
 <SA6PR02MB10503834F3F01BED24DA3D4FA81692@SA6PR02MB10503.namprd02.prod.outlook.com>
In-Reply-To: <SA6PR02MB10503834F3F01BED24DA3D4FA81692@SA6PR02MB10503.namprd02.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6SPR01MB0160:EE_|PH0PR02MB11608:EE_
x-ms-office365-filtering-correlation-id: f11c1b59-163b-4701-923b-08df396abb04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|38070700021|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261102123227099003|261022105027099003|261021121427099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|8096899003;
x-microsoft-antispam-message-info: DbnBuoV8lG7OlJirh+mKzCoUhmxv+6Y4B79d1d9wqbhtYBr51mjF5H7ao/f60vaCmDriFEh5Pve9TshjNRQ3iMIzvy17fuxxNmdJUnXsvRyYyYIdF0JI1IjtAsH1K1wDnveb5/J7wp2QtxsJIZdmNWuQhLMw0B7I31L6sC4wsbrUjRweMP9jHJCNe+hf7B0HcT4bUBowLIU/IPPDtu17Sv1x+4uQT4slbka0CYyvwZcrERRl624bJ1AldCNP3VmwU4s00RP3hQpld49sD2zsYqG0IMXOW/EHzc2sjMvhp1QZKWQUhD+69oVb/QzOXMk652GChCAEPzAGiSuaA3Wqy4Gn5M/YOxcqxgXHdJY0lmHvimA1FVP+sne/ZEus/EkmlM4UqLXKUo62vZdfglSHZroC/VwTVlcohvDqTD2KlFY/1DSIJUM/nQKVWX0ZzipVdK/bsPpYVlAZCBdvJwYfq2j3avfDpCkZ3zkVkZMVDXVQhlvj28f4owUV4ISZO6J0nnYf/gkbbeEkojgafQKroff/wt+H2FtsxnOVEsg3u7wXiZ9v7TUvYot9KZ9+efz9yZaGm0LOwzAtGU0Dkdy4JhE/Icwnmxd+y0TzXcjvXpVsgxueA+AMlG+eRlGOXWKq0c0VDB5DE1LHCwSigjtrQwTVZNoo9TYtXsQxdrL88vFmuHQHnWpB73p5yIHseq/FDu6bkpPkI5aU2uQtuhascye1Kre6fN99XKP54qRIpzU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6SPR01MB0160.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jjTbLO+3HZdrTtKntfp8+t0T7FCaQsAISbOYG0wBLkNchru0SrUKmvFAOMxm?=
 =?us-ascii?Q?GEvmbWIKgzsIgNOP5mWWg+eFAx/HsfNKAzHCEyrJJKBJkkiHk9NzTG5mY8Je?=
 =?us-ascii?Q?h/imA7k0Efx1LS2Nr8ivud8AHJ6nPWjEgVVjr7BlxB7hyjeJC/TB/BOY+Yn0?=
 =?us-ascii?Q?b/+VCgfGfbTQwqUYzSQlloP3YQRimA92jHIh3EdkloFw6ac51W1y81mevyQ/?=
 =?us-ascii?Q?J9H+rR0xHH1OVSui0ainvwDk6ZWL9OyQFuToIpul1r0ANbUGQmNm/BP41Kq5?=
 =?us-ascii?Q?fkRvYVyl6nRDr81+RNSa3gt2fYiSzZypn3i3BTFcErNhm9X7QqJNgvZLamU2?=
 =?us-ascii?Q?ZMeFrb8K1xARTwWRqkw7rN7ifDwU5tejd4wJGRDGpq7Hy8pq/I8bschEK0Q3?=
 =?us-ascii?Q?lr4HcmcO9JRyvmc/xGB1du4pe57WvVGhtyldBpslD3b1bx+VYmI/J6w6AG1v?=
 =?us-ascii?Q?qVTWXYACxvcBVt2Pr/4tBYMrzMV33Q1Fks6Z9gIy4gJYglLMj9qEhNDBQdkV?=
 =?us-ascii?Q?JirDzL7enoB24KgOzdmHhehvyOTcqC2hoAIRDXb1B25IIf16Dyqp6XocuwUF?=
 =?us-ascii?Q?Hd3BI897pK29srwgLJY5YDIHVoK4YRawp7mp5CyoQ4aqMG3xkkPILvSajvxA?=
 =?us-ascii?Q?d01lzW4W6/BucJxNYY8wRZBvL/MOoZelcDk/rmVOrf0RTpa754oXlV0UFHYx?=
 =?us-ascii?Q?9Ns8owIdhoabb38mhLGZiiDYw3YojJsTroOxy/QuUU1DcJ/qDSVb0uUhAPBs?=
 =?us-ascii?Q?fwp8LimsD58SOwHuLJ6ua/7Av8hX+GCFc9QZY7err78jeSw08J8O5LRQ53IE?=
 =?us-ascii?Q?OWbGTtxuupKT2w4N3AVBrDm9DwF86yIiPEdFcPCDKsQcnShIjuqnsxLPtC1E?=
 =?us-ascii?Q?v5J+fH6UrhZUWY3yA9E/U2/2ViXNMMNTjeUbVNyVu/xEIadezsaONZa7NOBH?=
 =?us-ascii?Q?4J2pv9xS7a97AqJL2uOtvHzj7HRWHmHaN/pWOGZMKKqJR8ZbNSJynowuVhQd?=
 =?us-ascii?Q?uW9rWaxS2n8c+KuckhFu/puIcOUhwqeNr0lmQ6xPEo4bhOWJnvcakWRuev6t?=
 =?us-ascii?Q?WimKF3MjY3LBZhlyhdl5xuD5Edaq3pQ5RdpDyvePtkonYyKQgcqzrO/GLha4?=
 =?us-ascii?Q?NOK84I8+oyTQ/3U7Y1TWXjmC5ulc92ZOeS3LEkM/2jwezTq3Nq494W249KKY?=
 =?us-ascii?Q?yK2pg9llQgnkEWNuK7geaQ2DbYzAzzUgCBm9bmqUmhXT19Q+7pJE/sLBR22V?=
 =?us-ascii?Q?qKqVPRXqRv+pQ3672bCRwagso6ygWUKY7RzKS3Ori3/bNURRNftMGdlLAMJc?=
 =?us-ascii?Q?rk69PS1VQDq2jR13Nq2gzCO6vHXmxbSpKIn7ct36VXFFmi0D8dr7CytLfKzy?=
 =?us-ascii?Q?HETkYwWaooAUTLeWpw9/76aJhG4BCiYum+2MXU+afSWGaU4fVUet50CDyX36?=
 =?us-ascii?Q?Zx6phg6/UAU1EQ9sgjeDT3TBubx9T8sNCdNipxaNz7vCGErpcn95Iec99C1c?=
 =?us-ascii?Q?IwrawhgrRiO6BMTHAjiHgZTtS03E/WoCRFW3Syzhoe5Jnu1mwPwNGd/RpeqM?=
 =?us-ascii?Q?kM6LsRjp7C2oNiambNt8bCYPcp6ubAX3SuGGsRwSvLZoI6bU2IkFD0sA65BU?=
 =?us-ascii?Q?E5FURKGSpckNiUJTpd+P+dv/eBmxyngwGg4VsofEZwU7/UY5RQTfdD33TUG9?=
 =?us-ascii?Q?VK8ZOY+cVS6oaEdXfU1Yr33yGwQl2E/WLGr5iwvA1od2DnuQZ+dBUp3FQY1t?=
 =?us-ascii?Q?fMKljvWm7w=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6SPR01MB0160F38143FAF3486017FC6AEF692SN6SPR01MB0160na_"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: m8/uB7gvuorzfaBk8j7yZO70oAjshgwRwB88xhZeqcrLsrvHVpZr72JfIjZYUlEIy3Ph8SyDGa8CuppXK0A/lwd3qZmj41UB4CmKt/buYbuLEByP/6TLbBtr1REU6PYL4UxulZXdbgUrZ5bi/IFHgOJwYx8jTKQZKXoQ1wNRBb7vfra/5EjLtQZQRJcVcBkWgfzDhsTnSWBS13CqB8bd37Lp60TIPDs4T1rxR/gZJxEwk5SqasGvqOZn13jW7+NbJf3FgkJPURv1ihvgcB5bZqKKDZ/k0VnPx5kIpcRhluA1yKTRi8OWhoBmw1P66Cl49obwuSekLzlpF9RiwJRXHQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: uHDFOm7fzGmjGl8qZtO9MfrODEGm/XyMkT4xw7NIljOjSJkcqNxHtd18gI0bfJzOMdeMB1LZpEokvhhjSUx/c/TjlRfPueZshXOemi8XjEDjJePzx4hkG055wUmuK5ARMv5u7RKNXQScWfIAqykYoSjQGTQoe0Y/iEWO4TjXHQadBCBt6Valnvc+ygE1bdmFqFL/UmASscKfXZWuXuwW8b5rnBiQZbCPh6jN4Xuob9Bz65VUo5UNvtWb+wNSpki51cS4QFDaK5EU6yDKdADiiqMbkIUn1VwRbPSTYIilmAeavAIRQ8Ilokh49kbzPBsw8Vw2Towsi1AJdnS9cfODcxMvc5bZwmQ5BKYRSRqum/9PG34MzpM6t58L4jyHTV0jr2paKVMxwD+J4guDKAI07YfIeFaCDTGuwMm0i5NR/IXeTiCZcoRcIOVIWDv7rMAc7tcJoayElsJTlX/2pr0NXqs2xEAOcKiw5N+dWuchZLV/gtGeVeHRsRS4QtTk2D9bXDKg4gwA9C8voGyAQa60iDwhw5RghQQq+jYukTfgNmBvjjp0Ce0HN7aW/NYV1Wxo5SEZyoXZmCwwKKWft5b1ZvcanMGFfsuZufWLcHnFaK9aQa5Qr/N0LH1PiwqwLeMX
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6SPR01MB0160.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11c1b59-163b-4701-923b-08df396abb04
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 05:24:27.5992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rhNm/57tZcWsoCs7JQizYC4SDRu8XTGQxgXR+/+wAn6BXccJJ6P3C0VaJCkcx+omfMTflj7Wm/luIOUeSV10/rnLFq2nYDmQgKAAtAtcyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB11608
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMSBTYWx0ZWRfX+iilPoqztGBE
 7tiNOt8hQTL1mgfZP8S7v7w0L/hr85PR7FTmqZf95ENPKSmJRFujelQHhFKYEx9gYlKfNFOwIBN
 PbbFgqgE/QSeAzD3+mUguqqIF7SUs+4=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9700f cx=c_pps
 a=K3WqU0CFElt1sixC1y5dJg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=ZVn1oFXEz0b_1gWOf0kA:9
 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=yP20C6LDehO0jder:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMSBTYWx0ZWRfX8OWpUopc8C9Y
 E+ywDBm0UVGL7w657HNccNVIZLeosXsjxHnNfNaDRUKcVzo4szY4hKQvKNQkRNxjsfUUa7ZGez7
 AgxGFaeWXNFIraZwUsNFuzGfaGgeJGpmuJGx59JQMItJpXr10Y9J0UfupMuPNDVrKDGwTbVwRwL
 ktxKD/8qgSeT9n8uu378HwZ/cmrO933SAdotfUjYf+cl6RyCT5XEZRzJyfj1SSmqjUAodDT+tl5
 7HpLhFxeBzz0QBOSNWspV3mDE9dDC7gkiDZHdNMyLdHs3P3bG7iT+vjWbvXzReO2bXmaWYZObcR
 i+ca5NhcCFT1wg4Rc3JpI6tGzdSKBi84hUEZAkrDJKrf37qs/IZp8ON2IPlf4NCVeXhC69dhPMC
 N0d685FlzD/NenhgkfRc2kIohhr5XDZlcVu7PDzG4W5UkpOIDvI/ZsXuMMokKsCqgpiWE9M5E4x
 dbnhnLRbmRF4ENJuKZg==
X-Proofpoint-ORIG-GUID: VerIsT5MkBY__yAmMqJumKzYwCL67DwG
X-Proofpoint-GUID: VerIsT5MkBY__yAmMqJumKzYwCL67DwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030021
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--_000_SN6SPR01MB0160F38143FAF3486017FC6AEF692SN6SPR01MB0160na_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

I tested the MSM BO buffer mapping tests on the target MSM platform and the=
 new buffer mapping subtests passed successfully.

Tested-by: Sri Vidya Patrayani <spatraya@qti.qualcomm.com<mailto:spatraya@q=
ti.qualcomm.com>>


Regards,
Vidya


From: Jitta Vignan (Temp) <jvignan@qti.qualcomm.com>
Sent: 03 November 2026 09:37
To: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>
Subject: Re: [PATCH i-g-t 1/2] tests/msm/msm_bo: Add buffer mapping tests

++
________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com<mailto:kamil.koniecz=
ny@linux.intel.com>>
Sent: Friday, October 30, 2026 5:24 PM
To: Jitta Vignan (Temp) <jvignan@qti.qualcomm.com<mailto:jvignan@qti.qualco=
mm.com>>
Cc: igt-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org> <ig=
t-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org>>; Robin C=
lark <robclark@qti.qualcomm.com<mailto:robclark@qti.qualcomm.com>>; Akhil P=
 Oommen <akhilpo@qti.qualcomm.com<mailto:akhilpo@qti.qualcomm.com>>
Subject: Re: [PATCH i-g-t 1/2] tests/msm/msm_bo: Add buffer mapping tests

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

Hi Jitta,
On 2026-10-29 at 22:25:52 +0530, Jitta Vignan wrote:
> Add coverage for MSM buffer object mapping operations.
>
> Exercise cached and write-combine mappings, repeated mappings,
> unmap/remap behavior, different buffer sizes, CPU preparation,
> mapping alignment, protection flags, large and partial mappings,
> and invalid mapping requests.
>
> Verify mapped buffer contents where applicable and check that invalid
> mapping operations are rejected as expected.
>
> Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com<mailto:jvignan@qti.=
qualcomm.com>>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com<mailto:kamil.kon=
ieczny@linux.intel.com>>

Regards,
Kamil

> ---
>  tests/msm/msm_bo.c | 420 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 420 insertions(+)
>
> diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
> index 3257697f5..295c7b0d3 100644
> --- a/tests/msm/msm_bo.c
> +++ b/tests/msm/msm_bo.c
> @@ -414,6 +414,426 @@ int igt_main()
>               igt_msm_bo_free(bo);
>       }
>
> +     /* Buffer Mapping Tests - Positive Cases */
> +     igt_describe("Basic mapping with read/write test");
> +     igt_subtest("bo-map-basic") {
[cut]

--_000_SN6SPR01MB0160F38143FAF3486017FC6AEF692SN6SPR01MB0160na_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
p.elementtoproof, li.elementtoproof, div.elementtoproof
	{mso-style-name:elementtoproof;
	margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">Hi Kamil,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">I tested the MSM BO buffer mapping test=
s on the target MSM platform and the new buffer mapping subtests passed suc=
cessfully.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">Tested-by: Sri Vidya Patrayani &lt;<a h=
ref=3D"mailto:spatraya@qti.qualcomm.com">spatraya@qti.qualcomm.com</a>&gt;<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"elementtoproof" style=3D"line-height:15.0pt"><span style=3D"fon=
t-family:&quot;Calibri&quot;,sans-serif;color:black">Regards,</span><span s=
tyle=3D"font-family:&quot;Calibri&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Vidya<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Jitta Vignan (Temp) &lt;jvignan@qti.qualcomm.com&gt;
<br>
<b>Sent:</b> 03 November 2026 09:37<br>
<b>To:</b> Sri Vidya Patrayani &lt;spatraya@qti.qualcomm.com&gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t 1/2] tests/msm/msm_bo: Add buffer mapping =
tests<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:black">++<o:p>=
</o:p></span></p>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"1" width=3D"98%" align=3D"center">
</div>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif;color:black">From:</span></b><span style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:black"> Kamil Konieczny &lt;</span><a href=3D"ma=
ilto:kamil.konieczny@linux.intel.com"><span style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif">kamil.konieczny@linux.intel.com</span></a><span style=
=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">&gt;<br>
<b>Sent:</b> Friday, October 30, 2026 5:24 PM<br>
<b>To:</b> Jitta Vignan (Temp) &lt;</span><a href=3D"mailto:jvignan@qti.qua=
lcomm.com"><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">jvign=
an@qti.qualcomm.com</span></a><span style=3D"font-family:&quot;Calibri&quot=
;,sans-serif;color:black">&gt;<br>
<b>Cc:</b> </span><a href=3D"mailto:igt-dev@lists.freedesktop.org"><span st=
yle=3D"font-family:&quot;Calibri&quot;,sans-serif">igt-dev@lists.freedeskto=
p.org</span></a><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;c=
olor:black"> &lt;</span><a href=3D"mailto:igt-dev@lists.freedesktop.org"><s=
pan style=3D"font-family:&quot;Calibri&quot;,sans-serif">igt-dev@lists.free=
desktop.org</span></a><span style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;color:black">&gt;;
 Robin Clark &lt;</span><a href=3D"mailto:robclark@qti.qualcomm.com"><span =
style=3D"font-family:&quot;Calibri&quot;,sans-serif">robclark@qti.qualcomm.=
com</span></a><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;col=
or:black">&gt;; Akhil P Oommen &lt;</span><a href=3D"mailto:akhilpo@qti.qua=
lcomm.com"><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">akhil=
po@qti.qualcomm.com</span></a><span style=3D"font-family:&quot;Calibri&quot=
;,sans-serif;color:black">&gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t 1/2] tests/msm/msm_bo: Add buffer mapping =
tests <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">WARNING: This email=
 originated from outside of Qualcomm. Please be wary of any links or attach=
ments, and do not enable macros.<br>
<br>
Hi Jitta,<br>
On 2026-10-29 at 22:25:52 +0530, Jitta Vignan wrote:<br>
&gt; Add coverage for MSM buffer object mapping operations.<br>
&gt;<br>
&gt; Exercise cached and write-combine mappings, repeated mappings,<br>
&gt; unmap/remap behavior, different buffer sizes, CPU preparation,<br>
&gt; mapping alignment, protection flags, large and partial mappings,<br>
&gt; and invalid mapping requests.<br>
&gt;<br>
&gt; Verify mapped buffer contents where applicable and check that invalid<=
br>
&gt; mapping operations are rejected as expected.<br>
&gt;<br>
&gt; Signed-off-by: Jitta Vignan &lt;</span><a href=3D"mailto:jvignan@qti.q=
ualcomm.com"><span style=3D"font-size:11.0pt">jvignan@qti.qualcomm.com</spa=
n></a><span style=3D"font-size:11.0pt">&gt;<br>
LGTM<br>
Acked-by: Kamil Konieczny &lt;</span><a href=3D"mailto:kamil.konieczny@linu=
x.intel.com"><span style=3D"font-size:11.0pt">kamil.konieczny@linux.intel.c=
om</span></a><span style=3D"font-size:11.0pt">&gt;<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; ---<br>
&gt;&nbsp; tests/msm/msm_bo.c | 420 +++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;&nbsp; 1 file changed, 420 insertions(+)<br>
&gt;<br>
&gt; diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c<br>
&gt; index 3257697f5..295c7b0d3 100644<br>
&gt; --- a/tests/msm/msm_bo.c<br>
&gt; +++ b/tests/msm/msm_bo.c<br>
&gt; @@ -414,6 +414,426 @@ int igt_main()<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; igt_msm_bo_free(bo);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Buffer Mapping Tests - Positive Cases */<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Basic mapping with read/w=
rite test&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-map-basic&quot;) {<br>
[cut]<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_SN6SPR01MB0160F38143FAF3486017FC6AEF692SN6SPR01MB0160na_--
