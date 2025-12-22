Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E01FE6780F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 17:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D853D10E3B7;
	Mon, 22 Dec 2025 17:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaEhyDEI";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FE010E3B7
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 17:45:43 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BMEChvM3287963
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 17:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:message-id:mime-version:subject:to; s=
 qcppdkim1; bh=eSEAnDrvNXvSIFbx44jtzbGde3g6pw5iZ16A2UL62s0=; b=Oa
 EhyDEIqemDhxEenXTDDCIyXz81iZzX2BSU0W4rod+XaTDgA0w0OOX+F6T/l7w7Cw
 v7SzswMLG/XTIR+QcnVhrqD2aC05jVBe+ZMYv0ca7HnM6ofq62Wx8iLFpX/3qYl3
 0l0y/BQLtRncYAqeckVZ/N76PJ38u+2BgXyijQk2mPf9wXTg9ds9v4Y0x34Ds7fG
 uktpBk3WB711loZxFh9KKUJuJq9LFxB/fQcRkihiZsYzwdnhkUW3toj2LYL1vmqW
 wnHPEJmtPtelJdUrBmlCFig2lLAYakS38ZtHnCe9eLoIbeiJwmGRVW52haT+pbq7
 E6VAqAxdzLsWzwWJAPvA==
Received: from bn1pr07cu003.outbound.protection.outlook.com
 (mail-bn1pr07cu00306.outbound.protection.outlook.com [40.93.12.6])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b702ta0s3-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 17:45:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZE3NK1QRl4mk05nwuQ2Fs1xFrMDTjS1oxQ0yyUM92hwBknZm6aa+JF3y28HyIao9jFnok1YfjMNF6HZqqB44E9pGcW3z7zJBvhWmsOCj0ik46u5SwtRPNr8JcYDb/pFTfk4350kV14WWfLtDqCG+g8QIvP5KU+LtTcoc+76pv2UXMwbXuhROPXpHgqVZcOWf7L45VofAQ5dJCC7bIdIJu06Tc969UYLjbD1K7cem5Qnq7Z1z80hLg0gOa8gN303STDylRqwdnlON8rSMRN8wD9f1/RR5l8Vt3ontX4ayt34USCipPcHwG3ARlx8X+TTeqq/5+m4Cq4PwV2LCpcTdHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSEAnDrvNXvSIFbx44jtzbGde3g6pw5iZ16A2UL62s0=;
 b=iHF9trYUpX89KtqDWmhBybewxsa0Kdj28ft9yE2PAQZgwt9w7Zupge7MxWLClSnsOGl9DlOjt5xno0IqIpF5+OD6IfzWSWHzZD1LufWl+OHh43Qi1SNIgiqs4HuCrIqk9MxEbVzh8E+bTHvGXD0bpyQ9bbtwtKoEeLDpqihcC7Vmcuf0jvrHFFiRXQS2vIwW/4+BoiLZ8Y342XfPwqnbn9EtX0kyj3vZJUe5r9ZNaZTE/v66QaoX+R+rwDQWyhFBZtIFA7hUvMRdzyI1xZCG+ax+eBFbiv9PnTR88hDWDWfAwubPQ7xYJSYec91kg8C6S+QoKOq/h8g/BQ28khgB/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SA6PR02MB10503.namprd02.prod.outlook.com
 (2603:10b6:806:407::18) by DS0PR02MB9618.namprd02.prod.outlook.com
 (2603:10b6:8:f4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 17:45:36 +0000
Received: from SA6PR02MB10503.namprd02.prod.outlook.com
 ([fe80::ffcb:499e:b7d4:3d95]) by SA6PR02MB10503.namprd02.prod.outlook.com
 ([fe80::ffcb:499e:b7d4:3d95%7]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 17:45:36 +0000
From: "Jitta Vignan (Temp)" <jvignan@qti.qualcomm.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Lakshmi Kalyani Lingam <llingam@qti.qualcomm.com>, Aditi Verma
 <aditiv@qti.qualcomm.com>, Maheswara Pappula <maheswa@qti.qualcomm.com>
Subject: Introduction and Intent to Contribute to IGT GPU Tools
Thread-Topic: Introduction and Intent to Contribute to IGT GPU Tools
Thread-Index: AdxzaiWdcHajmZKXQoesBoVcvngXng==
Date: Mon, 22 Dec 2025 17:45:36 +0000
Message-ID: <SA6PR02MB10503481252FC126F0AED2B8381B4A@SA6PR02MB10503.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA6PR02MB10503:EE_|DS0PR02MB9618:EE_
x-ms-office365-filtering-correlation-id: 80805aff-db59-4152-9346-08de4181e9c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|8096899003; 
x-microsoft-antispam-message-info: =?us-ascii?Q?O20jvMnI7g3lUf4ipwyFMOQAgQwTIBHMAEZGzy61Hwrpb/b606CjAeB2Yn8c?=
 =?us-ascii?Q?NRvoYziigKyKr/CR78zmwdubX9aB/vkA8JWk61luuZEfGUmG9P667+AjmT6e?=
 =?us-ascii?Q?qwdAoPz7A9vCp2Brj32RHYhximhV6JBTl1LpakAJkdkyn18ocylW9f7vfDYX?=
 =?us-ascii?Q?15Cns+fb33JVrK57l6Gm/OGQNq34J6AcvZxP3DqetZzlY6vIhYIvRRdYrqNf?=
 =?us-ascii?Q?ltWp4nUgzXvQDSXCNZdz4RNVJL1KolB+kzl3Bgt6cDv6yClkPZR7sNML8aTJ?=
 =?us-ascii?Q?4c3DVLVBkR8WULbJjvsPy5C+0l1AakVKdQg8iuVqJhXLTRVBD/X+UCmoABV7?=
 =?us-ascii?Q?AkZMR8dlz40hboj7xGSDLCCuyLgMtGuf3aHDjJ+e7ezMX6DVyBH7LAaNspX8?=
 =?us-ascii?Q?/KUG9PB2svYId2fOOw3gk9p/E3gXPpibbT2wDjxQa+Pd0Wq1xe47VE0bbBpe?=
 =?us-ascii?Q?jlRN+rap/eIG/cGeG69ip0J1Zp39s/+h/fskcP3GNAZsGoOA39wCaooGje8j?=
 =?us-ascii?Q?oaVsSsz/YyAUmokrZrKPEl3WSVtTlLEAP+C2rbt8CMrAspVNkKn8ndty/Wxj?=
 =?us-ascii?Q?lfHbbbPt8rurmxfal3VqAIpGdy6RPpiWYoNnrY5Yoqg3OdlJ4O4LnflK/dQU?=
 =?us-ascii?Q?2H2qXkjgBGmk0lebtI42QrMZrwIIQprmpuAWFcv0Nyt+6m2qZt/WU3YHe7tm?=
 =?us-ascii?Q?FDhg1dN506cRn8gpP1qFst5odj2KB9+7/BAghn0rHAlHmFJYSyWxL2Rscmej?=
 =?us-ascii?Q?4qxMoCN6/NlVwFaeLLWWaMZjfzJNqO8xjgy6cxVQHDYErkKdgFibnsjRBB8t?=
 =?us-ascii?Q?y+V2vs6MTqAG0CS4I+o1/rfMaK5VpGIgE/1r1RzfoUUZIAoI89e5i86QNNUX?=
 =?us-ascii?Q?xqiBZvj93P6ZUCFJf9xu3HQsXT+yRIJjq16eXWkE/nGGPkqMCU4ZDLrsX5/z?=
 =?us-ascii?Q?It1QwPU7U+/2o1uMbj5mn1Fi4HM73koROOquU57upCX3G91avAUunJ2VbFix?=
 =?us-ascii?Q?7Ny1y0x+GHY1GVwsl69tdUQXak+o4tuH45HXkZSxQ2uFgZ/BCr0pgO+m5Mib?=
 =?us-ascii?Q?1rwflI+m/R6hLVFfqt+WoWzx3kKfnqf7YBx/7ETfdmAbtQBQXyPVESjHRdOR?=
 =?us-ascii?Q?pv/B43ZAXYbezIte+fp6zesHqRjsfUM8ckeZ9Pwzxz1l/T/SHClm8ZMmAvkF?=
 =?us-ascii?Q?IayiHQj2NfRADenSX6hHDiFPw/y1EcEgUbzaRYY1vYY2F8L1asdGWDbcQ8M8?=
 =?us-ascii?Q?h8vC7E3uMv2ougNapo+iv952rSUmCU205x5y6jX4RaiMyoepnMnMLRaKsf4x?=
 =?us-ascii?Q?3pDkVZ4H+HDHCcxxPhlPSf/vgFprgy6QalB3AL05XIFm+ryYjr8icJRJQV/k?=
 =?us-ascii?Q?iKgOjEMcNzHQLSc3upgzRu/S0QohdNKdT+LOc8lmnaQlWMDo9PDs9qC8WqN0?=
 =?us-ascii?Q?OeKX5uhXZ/YdyVhij8s9exK5EykP6dd9PYjfxK7fCX+nmgVvJ3fG6U8p6AEN?=
 =?us-ascii?Q?iVyx5ldDDiXiwcXucDBDHm+cglhjFkOmM05B?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA6PR02MB10503.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(8096899003); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qiW9wu3MXNNAB9ZfFTXcun5mUaDW6QwxcY37O30+xYnSgOs3mSKaWVUJy8Ws?=
 =?us-ascii?Q?Lvw1ofy+4MehrADdQGHjYsag/dwGSMEXBDoBqOy+ygGgLsuG4CuW+gZn4Hj+?=
 =?us-ascii?Q?I1uOEzmAeVVuIT543EL6kY3aXoHG69FNOq6kPtz7TTiKmowJwZxR2oQMH6vn?=
 =?us-ascii?Q?hK5Zdedj7sSXzUYvEckIqflC3mqkFVYRsGC0Y970YSmSZ0v8kOgOWC9Qi2eX?=
 =?us-ascii?Q?+kZNdlXK8z6wv+Zo3NTfA60BD6SGO9X9CAaNJK8kmqrYiz+IDrBTtb+RNCOB?=
 =?us-ascii?Q?EznSx4UrNY7z7j37CV8upC4K0eehXtS6mK1KaxtUDbXCxTYMPMav8rPMZGLt?=
 =?us-ascii?Q?RxxA3aD9iXuQ3NnvXvDFGImKaDhpPHJli3kgDD27YFCU4BG9RqGngfMl/yKG?=
 =?us-ascii?Q?6KxE24AVB1hCJMsla2E9gD22DWJALiGmGc7irwI+tgT36vnhWDNV/vyxTTQv?=
 =?us-ascii?Q?pbHeAMWJMM4a7R9UaMW6Cn6Cr/OMAGQmutg3XjS0k5xubX4xKlcw6jjWqvWj?=
 =?us-ascii?Q?3Sy9Qz9wqTJSxHFlU09xRc/pdamd9uVxaHKlzIo9GoIpFWcYCeflPEHZkzhw?=
 =?us-ascii?Q?Hqs3U4ifd6UI98EB8i1lHx3QGrdXl9fcoeqOAEQYkJmPalVgyLlc7hgbwnFa?=
 =?us-ascii?Q?9q9ScF7/fFqfI7DpX5QRut0p7jjd5i/xN45aKA51C0RHz5ZSxjXzEj7NX2c9?=
 =?us-ascii?Q?WUooghzGXmOKNKhqJKgYqXH3A00b62z5xZXWRE1RQgDyq9wvaapELZnfhAwy?=
 =?us-ascii?Q?vZZ41P37zYd4gS+5rJFQlaw/9LnqdcgQFCyrqtdvVeBDHqI+xY8lkjoF5vsz?=
 =?us-ascii?Q?yFCFWIzu+kOwpz6v+FLD/rYTQNoMczDF3VHyr7aCslJ/d77yew2+PM77iEBD?=
 =?us-ascii?Q?f+UiLTCCDC/QiC1zzhWlsTAXq/57BSmn8/o3k2Cq+e3a6SfpHMg77llujIkJ?=
 =?us-ascii?Q?YU8FO5xc1DysFCl2ZBtauEypfhxC49i2M7I4TpkSVghS5Id72pV2MnBKmqYk?=
 =?us-ascii?Q?zz9cy0M3uket3BDgl01sFekTfIQorV9Pcghmhob+PSGIU0IvPQ0EnWgw+Kv9?=
 =?us-ascii?Q?9y1ZidcfSjgKLfNYZTpPoRk/o3JxgBaLyE0jxYw428R5r/tjlxjPFbfEf/Mm?=
 =?us-ascii?Q?wVY+hUwDdJ16/2RXefFWNnZhO9xQoh+JyaDRQiet57R6PxOGx0dlmmJxuxNy?=
 =?us-ascii?Q?pwq9+F/hP44XvmoFfnBN5d/yQJ0hhJJHbehsD2hHV23AjZePQ91A+sEan2vt?=
 =?us-ascii?Q?6PjsbxQdCpWLcbjXz3j1mhbjLCFcgnvfzfBGVYUg70Db8krnqfxFPFG1emkj?=
 =?us-ascii?Q?A/5tKoZnY6Yc8UFGzudEDvtoLS3q2yiwf+lDpyPUo6E+1YlQ0Jy57mpcsii5?=
 =?us-ascii?Q?ThT8yi5Z54J6qyLAswF9QJU86XdvYh8NfOvUoufRiJCK0zY3NAKsi7Zm5zXc?=
 =?us-ascii?Q?OFvgjWNd1j1swoxDu0ow+YKnNWtwUIuK+ORdplyGZjVLn2uRjZnpDR1NXZKs?=
 =?us-ascii?Q?Qk3ezRjbHiB0DBbEVPiabZ5ss8D3nt9ncTxdB0SYQHx7qgKalzF7THsH02ME?=
 =?us-ascii?Q?SdNVIWSPB6Xi8HFCldf5zMyUGpEnm4MD7QEMW4yd6nrp0EjBHdy9yqGQknvz?=
 =?us-ascii?Q?b1zvDjJr5ik6ibQLfPuNDho1oq9wv/6Yeb+UCh79RXnWPL6kgNFbMNfh29h2?=
 =?us-ascii?Q?sB2zAWElAbzLiIj7LYhCjn8pY5dHQtVmOkscyyLgd5zJRDxLw4yldYe3ylOG?=
 =?us-ascii?Q?4t3ygQZMjQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SA6PR02MB10503481252FC126F0AED2B8381B4ASA6PR02MB10503na_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ywpDpaqTIZnTzif7RWpp7zUOpU6AOvf+NrjEcxYjDMXR4USRdkbAVFy4xpDPnz9vYoeqUCuDTYCtOAVT3vOJvJOP2iGQVk0Ew/Ui0pnDAj+c5PyzqzINt/YvM/kOB2fnAEBzVfxiE01dNnavLKX1bKbSvhPCMabXLD1jgfqORuKgO+z1xG3IuRLG3t486WUaiGYTO2ZBtLJr37T2DmZ6H03FlaxBZlwNoTLtE7EPpqmBpOTrXO71+4lTDQ4Pg+uEswDBz7zdOsjeo+AuTnxZG/Ggp/KgKPKFRlZX7NNvCu9CfnUfU/wiOYh15HMNsjTUYciCMK6+QkPAvcLcabmxmXNZuIF1vNDHIuBnNgNfuWjJvwfohmEYe7wHmpWTMQq1CkyXhyWyhTjUkEO6abB4SUCZZW7sQTuOYxtaJe57+6lxG1lVmC2sDYFdtuTVxkAJFePT9kpTmbiTDnYKPCf+PF4ECNbdoJAe1Z4+eW6RdSUl2EWe3Bcuiun3fjZFp/11EfhQ4v+l3RnfXOKFHiRTOSEvfWcBN57/F+3QcpsloEgLMwnmnXK1SU/VBgokXYV6j3VtmIdCEvyxAGCsz3+aEHH0/9sli7k78MqeojjREQliGgRpJ50wTNfs3LXm/5yf
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA6PR02MB10503.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80805aff-db59-4152-9346-08de4181e9c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 17:45:36.1626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZlmoDlLQeFbDDdICS7If2QDXie0tRPLv0J23iXD6vWR0puv+heOy0EN5FI8gTCC3FNjwkVqlc+S7l3uihuAHqrsIE/cC7Vh4ajnH8jBHybU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9618
X-Authority-Analysis: v=2.4 cv=SIhPlevH c=1 sm=1 tr=0 ts=694983c7 cx=c_pps
 a=vyniI6In/5XBr/U1JZq+ag==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=2WCoXrTvrKHXFLBqH60A:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=9xMFS2YSa9Lxy3va:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: gRfAOam6iUAsRlGiJ8Ve8XcjrJuJlKdj
X-Proofpoint-GUID: gRfAOam6iUAsRlGiJ8Ve8XcjrJuJlKdj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE2MyBTYWx0ZWRfX5KzOdGblscuc
 nUm7lXUkGfzkMzpsCyObc84HTljart5S7euhVsWzoG3j2cvxBe1xREBc4IdNPua3ZgSZAZf8cAW
 WMaRm2eacCXpW7nqRRFnaHzj0pUxReP31KX65QC8zHgdYcB6rTBOaDeFYmq9vr9aTYsTpFksTak
 GyFpRAdlMlRu/uKc7kInAmvETU4b9BuIf0V4Y5pmq0UnkkxrVyazkQ7tSYPFDzNjTZ9TYeY3Gvr
 LMQkfan+5X1koVPzCXvR2ByC2Pr1X41LkLJfYKFVML80XMFvC50/W3UISV0ubB1/te2/HkplCn9
 0XFskJnhbJTj1NTyTQXmXmJRId4pTB2FvlrWcMB4+ga6JMvJ+4sf95Zq4fHSyeHwha8xiTcEFN/
 KxAjZgsp089CWU3gMCjb88ZY01GjXkRDIkAub4TMk59Eif18n7jhiwAEvLug68dZBwGtEZ+KH7r
 AF2WCHv34QHO/da/5pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
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

--_000_SA6PR02MB10503481252FC126F0AED2B8381B4ASA6PR02MB10503na_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Everyone,

I have subscribed to the mailing list and created an account on gitlab.free=
desktop.org. My intent is to start contributing to IGT GPU Tools, specifica=
lly by adding new test cases under `tests/msm` for Qualcomm chipsets. These=
 tests will focus on validating GPU driver behavior and kernel graphics int=
erfaces for MSM platforms.

I have reviewed the CONTRIBUTING.md guidelines and will follow:
- Kernel coding style.
- Proper use of IGT macros (`igt_subtest`, `igt_fixture`, `igt_assert`, etc=
.).
- Adding descriptive documentation using `igt_describe()`.
- Running `checkpatch.pl` before submission.
- Using `Signed-off-by` for all commits as per DCO.

Please let me know if there are any additional steps or recommendations bef=
ore I start submitting patches. I will ensure patches are formatted correct=
ly and sent via `git send-email` with the subject prefix `[PATCH i-g-t]`.

Looking forward to contributing and collaborating with the community.

Thanks,
~Vignan


--_000_SA6PR02MB10503481252FC126F0AED2B8381B4ASA6PR02MB10503na_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:Vijaya;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi Everyone,<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I have subscribed t=
o the mailing list and created an account on gitlab.freedesktop.org. My int=
ent is to start contributing to IGT GPU Tools, specifically by adding new t=
est cases under `tests/msm` for Qualcomm
 chipsets. These tests will focus on validating GPU driver behavior and ker=
nel graphics interfaces for MSM platforms.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I have reviewed the=
 CONTRIBUTING.md guidelines and will follow:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- Kernel coding sty=
le.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- Proper use of IGT=
 macros (`igt_subtest`, `igt_fixture`, `igt_assert`, etc.).<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- Adding descriptiv=
e documentation using `igt_describe()`.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- Running `checkpat=
ch.pl` before submission.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- Using `Signed-off=
-by` for all commits as per DCO.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Please let me know =
if there are any additional steps or recommendations before I start submitt=
ing patches. I will ensure patches are formatted correctly and sent via `gi=
t send-email` with the subject prefix
 `[PATCH i-g-t]`.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Looking forward to =
contributing and collaborating with the community.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Vijaya&quot;,serif"=
>Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Vijaya&quot;,serif"=
>~Vignan<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SA6PR02MB10503481252FC126F0AED2B8381B4ASA6PR02MB10503na_--
