Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F70F606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 05:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FI71K99L
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A7F10E2F6;
	Tue,  3 Nov 2026 05:27:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F9410E2F6
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 05:26:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A33holM1141665
 for <igt-dev@lists.freedesktop.org>; Tue, 3 Nov 2026 05:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=62+0Cx2JJNCFqWQ3bx6cffbC
 vkdDh2p1aYAUDLB1fE8=; b=FI71K99LWP+e+HOXDl1gOxUlP/ImB4tYBqysLNDj
 OPoT/HdJ/ZDVQxPRZAWG3jRSgjDh8crOLofIcn36X4SJFQY7gvRzZe30myVFEhwT
 XCF2NCTaPT/Ex/iSBXR9QXXZGzHix0But4Mr8PsCdqrAlcLaUMXFxJEgtcEQJQRq
 BRA9IUDgzp6FIrXG+oMICsNhXXJA9bxitBpYU6tXvJ1MJ5UqiNqfLFv3AMUzWiCN
 gB/UPre3Biov5o8WEUQMYA641zgcThozvJVu8t5mcnYX2owR2owvduP9EZCntFJ8
 /rQZpIVBhaQszHUfkVVF8eVNfuAHt0MXDpOlXdqZLbCx5A==
Received: from ds2pr08cu001.outbound.protection.outlook.com
 (mail-ds2pr08cu00107.outbound.protection.outlook.com [40.93.13.55])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycrb8j-2
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Nov 2026 05:26:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwzuREJOTk0rP6ujgB2xpBo6zQhr28dqA3WCjXY1rkKZ/r6K+24Qld9d/bZ9ndVIUhpINKRDWBV4+DkoKFRBgcgP3LJONebzZcx5gCExI+fx/oHPoQ+0fTghcom37Ycvn+4/h7Q9umXZEkOgnlNdpL3lfvG5avXPtVxtLm54my7hqsUMybNQG6kuUswBa3rDBC3b7VpG4iFtUDyJJfQ/66sMz7rS3L8SuyuNbV9yQz03KcMR1cbGkCMzgaC+EimBxIAcG1jsYmRc06IpGDk3gRExBFQp/mOoKpgYWb3tGp++S5Z/7dZVifoBOmSQg9jiIs06sp2AWAyJbqAuWp59jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62+0Cx2JJNCFqWQ3bx6cffbCvkdDh2p1aYAUDLB1fE8=;
 b=y+EXpa/BLcdjkqKeup+8sYQDvo53A9bgHRgdeZypXozSW5bzovHx+VewUF2CXCcbReGazrrJXjufyZ215x4Gu2xLR28atN08NPiz893C3q5IleQKT8SIIIFFUrPdGpYaD5pf1PlY1CWfRE+djuCn9DvIDLchE2C9RLVvuYioKkvpP3LjF7hFiLLVGlTZ27AVQIV2bJG2FjjiQKC2lTlImEJPO07PJnGf/9cX2FjDKl6yyDckOjPUZ1XhO3YwH/lUfMQ+XiLYbqTc0VlzR4cuwTxwYJxc7cQNbdqvveXmOogvISDGiX2zO+CJRmxk0zo+H12VNBmTFOhdNq1ceb47EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SN6SPR01MB0160.namprd02.prod.outlook.com (2603:10b6:805:e0::16)
 by PH0PR02MB11608.namprd02.prod.outlook.com (2603:10b6:510:3be::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 05:26:12 +0000
Received: from SN6SPR01MB0160.namprd02.prod.outlook.com
 ([fe80::ed9:b2ef:c824:8bf4]) by SN6SPR01MB0160.namprd02.prod.outlook.com
 ([fe80::ed9:b2ef:c824:8bf4%4]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 05:26:12 +0000
From: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jitta Vignan (Temp)"
 <jvignan@qti.qualcomm.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Akhil P
 Oommen <akhilpo@qti.qualcomm.com>, Robin Clark <robclark@qti.qualcomm.com>
Subject: RE: [PATCH i-g-t 2/2] tests/msm/msm_bo: Add buffer free tests
Thread-Topic: [PATCH i-g-t 2/2] tests/msm/msm_bo: Add buffer free tests
Thread-Index: AQHdaGWtR/NQXfoFpkSxEIPr/B1y5rcbwNCAgAAVl7A=
Date: Tue, 3 Nov 2026 05:26:12 +0000
Message-ID: <SN6SPR01MB0160F127CF211A0917545944EF692@SN6SPR01MB0160.namprd02.prod.outlook.com>
References: <20261029165553.1108121-1-jvignan@qti.qualcomm.com>
 <20261029165553.1108121-3-jvignan@qti.qualcomm.com>
 <20261030115506.2x4pq5t7v63li4xp@kamilkon-DESK.igk.intel.com>
 <SA6PR02MB10503B4B7870BD0BDF6A46CC081692@SA6PR02MB10503.namprd02.prod.outlook.com>
In-Reply-To: <SA6PR02MB10503B4B7870BD0BDF6A46CC081692@SA6PR02MB10503.namprd02.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6SPR01MB0160:EE_|PH0PR02MB11608:EE_
x-ms-office365-filtering-correlation-id: 1318b66e-c8c0-450f-646e-08df396af9b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|38070700021|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261102123227099003|261022105027099003|261021121427099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|8096899003;
x-microsoft-antispam-message-info: Hwp8qQHr3EZUS+HOoc+oT0tfCwgzmRdSgFjOGoH+zQuvZnTxL/ZC1OKm78JQo7OeO6Ruo+zhHEMHZkyTFQNlAt7WHXgGhEZj2oL/eSgUnwEQsOoikCAkH+o1niSUyfg2pptJdVRaO3R5d3QhacqXm2NQqjs2QAiBkjFZ9ZDQLD0ywyHlNinqXmoOZZLyzNanNbp0RYK8Hrz0bq5YSrlPkdSCemGuOw0VbD1LuNV5xg/HTMbIlYskY8W8r9iVgbonKJ81Sksd+DwE1Y9W8a6Q/K341U6LW6rzGERD1+a8Z0fjqq4so3LMRJUXRAfeVntsX56LWvBXf0B6/51WLcG7GAQikW1xZiQXdp0YUD08a/ZF9oTQJEeR+Lx19oznzkexVx8Jed8AVXlQXQJ3JcxxMr0MG0XA4mz8dBCrReRepiOg8GXWWveYYh7b22jNRg4u4OWsdDik7r905mMOTYFuH4dqnhCIOotnUIaBLPVFTrrQFnHoEsipUNMx6ddKh9Ebs520fBwcB0by2v6nJ3xmF4FjUok0B1Xw71lZsw1J7zmoDez9qqD0QtdMIAvrljTTMzTkojZj06IZnYn3CFBffK3H9ZptTBQUbZ0hG/TvzsL0ZtKV7hJ81d3Mw9G2s4KLF84z9bLbB/5HD3j8TPBmodHDjGgzVotAoiXrcaRbroSzWWBXLymwSAG2GuGXiw9K2M/36T0RzWVWmgzScmCtI16uX5fiRA/81WctICGfX0Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6SPR01MB0160.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nNX53mZLXauSvc+ogG3Za3NtPDkxDlBK5FLutNnF+o4tRp2jdtOxYQ856uMD?=
 =?us-ascii?Q?nIPffcqHOILY5IT4HTE/TOi5ISbIWcgtjNk9yyhQIb7LXGy1OE/VMMqV42fa?=
 =?us-ascii?Q?TOmpJFdgno3NA3Wa4M1fjw7co5kiW4xJmBuYaByA6MnLb1jztZ6Dlt3GaT5n?=
 =?us-ascii?Q?CXV+yYF/fmw0GD2/EbcWJ3GL5g/52QoP0mfXeX0XSe+aDKFfk1tiQhcyUDCb?=
 =?us-ascii?Q?+ELDQs4nQpIAKtyGBZHeIfBNyt0tZkwmJc64AFl+ltEPR4Gb4wlVrL3ZFqJi?=
 =?us-ascii?Q?HGEYo7WGi0iYob7HAFMw279NmIPmTG5BzzLqJhLIb0nTxbzW8jMtb39RCu9Z?=
 =?us-ascii?Q?wbuRfFyMhi4NGN7jtnDeabmlKQPI1EY5bDEQ/zwbYjASB5nZSGw3XXmNv6MA?=
 =?us-ascii?Q?KDOlE0oZoK5Z/v8p/Tv70mF4nRxBOMnvIcG5bPX5jc8mnWjOSAhNIffuThE8?=
 =?us-ascii?Q?gtLLuaOyVTKVeSgUTmT7WCW/NPtiHtQAmXqwOUMPaFrfEyi10+kQVVhl43fp?=
 =?us-ascii?Q?HPdGiMuF2HNyyiwEUhn5Vj733oNNPVL0LES0EOJ0gNKaIO3PUqOMRir9pYCK?=
 =?us-ascii?Q?mZxgQMY6GWa6hnGME89jufiz56lem+31MGZ4M/n0/TyHOzqfdJ/J49kf1tgL?=
 =?us-ascii?Q?wqGCKwiNsD+HCSiD86zAuwZ21OcLWsmjmhjYDDHr/T5CyckybUAlvmGT999M?=
 =?us-ascii?Q?HVafhWgHtn50iINwyT2dqLilFV6HjTnDYNHspIjzktI9pP8wnt6mJojpRRg9?=
 =?us-ascii?Q?ukKWT7CyKLvLZFpzqqfeeSxKA1hpMMcjzigqQMJccj32L9qWK1yRufQuqald?=
 =?us-ascii?Q?W+psYgXs2/W9lg0bf4sBntBcjUOoF8yll41MymGTdaZ7JNuPpz0wAuJoVpZh?=
 =?us-ascii?Q?KR5Yow4x9KPdRsDBN05MEbi4Mj7zCuMoIFlWPITW8+uoRvmL2iFjTWoCf48V?=
 =?us-ascii?Q?kL5m5LOTie7WqtPzqfQsZt7aPL23Ge/dbY6YmtcusxuZTEyFG6sjklyueOvN?=
 =?us-ascii?Q?yxH4R10/t0nwObUvaBB7SWKytpWH9ZQJ0i6rTPcOSyeC8NN76lHLD8hMGKGu?=
 =?us-ascii?Q?CG+BRlskMSIgZgsweTpBqPYiRVh5btdSp1MCi8fCbfmW1b8zuVXfU9NCRP+K?=
 =?us-ascii?Q?8fpl3tEc0uYxGvYpMTaD4Xawn7E4dpyWOeLx9CwbLkHb2RlQ0Bxyki5TIf0/?=
 =?us-ascii?Q?PBdmCu9HayLcZHOMNLSdwX2cui6rRzdzwFJkmxGaJ1N89bHc3NWWUA9x1yDM?=
 =?us-ascii?Q?vJvMp1dYTz5zK7v8P0a1S4mcFocvbZnKgLkH0wkVIYpg8+lrvncQ0fVhgODj?=
 =?us-ascii?Q?MxRXPocs5SNrsX+c2qg1pTHosCf05h3KP9hPeX8TEM7P6c+Iib3DUThZ1c7/?=
 =?us-ascii?Q?6xmMaRhHjdgDBQMm36mAi1Kxyl4/B/LjK+evPsz1MoLp1u1xDaQhUGJFCL81?=
 =?us-ascii?Q?3wd1LDKI1l81Za4fO7qvoxtrihWljGhnuqOtiFejm0zi1b/09hxSbendTVv4?=
 =?us-ascii?Q?RVvVcnr8OtCZdpu8FuRlJSJ9qUDmgZc9DwXnWu/IyQrKhW0sdxOJNlyPoskL?=
 =?us-ascii?Q?9Icjz+h86VSxu6zxZVWwtni4xkiYJjI0yLutAj7u3PCy8M3/ARfvlueRF2o8?=
 =?us-ascii?Q?CE2dArtmHhgZP7ko14pw7vX0JExFgl6YqWsoNuFGSMkExe+RUlajkZpJDQtv?=
 =?us-ascii?Q?ULxNmne4DkQrmAu2fy52MHoiw0QWY+pMhscMElUDQXWPMeVVLRndDX0Lr4c8?=
 =?us-ascii?Q?+cF1idop6g=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6SPR01MB0160F127CF211A0917545944EF692SN6SPR01MB0160na_"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: giO9S6vdRbemVXPotGIIGAK4LMdZfkdTA1jwUDnMWeQrP2nU2VdQASk1NYMWz+7Vk3Rpvard4OYVwr59WUdnr0bVe/htzk5/WsLUKyE6/Lo5OC/iEaxavOVq+KtgG4eThylu18Gfg6BUfMwZ+i+rMgIkaYuBTAnoDQC3c/nG6518OBW2zWYWJyCzeaPVGDQGSPzUAGkuz/7O+K1uixrSmMEU0/nemKuN1tMhjAlXkBRyQNPTPZM+hI014SiTZ+wkGT+HmLjavSXTHppVFoVTMONX1SwoB5wdUs5CyR2R0aLGPUplT0w8sdbeLKJ6avp0Oa3RlCNY54+NsRZNumpVgg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: L0bUDavNIyVga4hwA2hAGpHzcBVAZMOKxqyREzoUb3HJ/OXyM1SWGUjGxbd/9EoNupJCQt052cJedDPrBRG7axrVtyme3LPYkAt0UwTg0C5GK63IpoXU0iytiRVgpEw5DJCDHuYl4zFYxF7UWnQMWkK9CcPqoezAPCV2AgwBATNheuNvlUNpCrjWXcrmgkInAi4nahlJxnMOiR8I6WmK/2xnixxrkOBfmQGYFqT4wDFyIWDMFykrbDzfdnPrVLbGJxlyWbYKjTeSa95+Z0nPbLvuHS7tKTH1uUFobimwjPqMea2SC72BFj8sm7m5i6F3XrKF5wQ7cp6hdSxVHxnTgRRVxhwZvWzeJykE1Mqk8gzPzJ8FmjEK5EsjUBDnTANZnnjCFgdmekJ1Tr/VgAlXqSEuc/XGxk7hDQSX9sujRdHv2QpZQBCaZP4eSvwOlMNZGFcJbwAF3fRq9XJYtFSoChnZLIzhgOfinNyoo8BRvs7o2jt7qrwTQVmeWJIjD+LGfrfz7lMxAxK7oZBenF4mf51NNShD8/DLi4QGEJ+EqGloloupHko/o4G7x9b6htksJc1NuS44q9aeiSBJaeQUj+klpIiWAd8X/65298BHxyDqO6bqEGKrszx/PIZBcGr1
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6SPR01MB0160.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1318b66e-c8c0-450f-646e-08df396af9b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 05:26:12.8055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R9odNQW84t0ZvBgj4Vl1Bom7X1zo0CcBA0NqbxZATu5LQQTxM41WmqBnJ3HR5MVQhV5O57ePLVN6pFX4GSxLosokymBJ3ZZvBT2f2QkfMNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB11608
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae97077 cx=c_pps
 a=vkEPmp//vMHCVjW2JM8fXA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=bXoCVvWqAAAA:8
 a=2tFdcc46_1IGqfrk4eAA:9 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8
 a=SSmOFEACAAAA:8 a=gizWHbJlPpfIVZBEHWUA:9 a=39_nCoNyyiwLD8Bq:21
 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=xWGLF9RxxNN1Vkn1tT4a:22
X-Proofpoint-ORIG-GUID: V-f_b1wO_BJCDqLxmJwUDPST52A0Tx8A
X-Proofpoint-GUID: V-f_b1wO_BJCDqLxmJwUDPST52A0Tx8A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMSBTYWx0ZWRfX4OtoMXbbIPod
 sRdXqnBTp26/aoWSyRPbWgbsu7tygYp4K998Mio4T7EXe8b5w6iWL718Xij4RS3eej7pdTmoWpD
 zlznroiAlO7o2ddPdsFytdMLkWGUtkMmCNn5GVuBnMlW84NWEdnx7ewYMUcNLAKBwOGKz0NIGgJ
 8HPTBDDqU7XiO10Zn2N+adkBiMCoUpv+5MuNqHf/LY7GrxUoE+vpSDLvBEQUNCTRaCttsAOPD+a
 WJGC/3mQEzDMCPCHgkNF+BU1aL3IAto0iaP2VZsu4eqhPj9dZ3D4JalUbr7Hs+wOOf4rEB9talO
 JCHqnQsL7bHDMFffEV80Xdcj5rlR97tu8ZiZDZqFU3dpj3iZb8T9c9AKEK+dYyBPvWfs4t61krp
 NE9pP6m8WHw7C6N6nLT6FhxO6MLJmovZKpc8mugjeZwRUadwtK+VclLRCUh8Qt8CjKxhIiDNYVd
 XutYc0ZV19vhS2SeBSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMSBTYWx0ZWRfX3/DeoeYOX+ym
 FrsGkXQbj4YofZinarZUAPWuyA+S5zcvTW7T0c5TOYFOxI0UxMM+2P410hpSvS4lB8dyk1iqdx9
 BXQw3AZe5N0wjj5uyqIZ0/1VqGD7Zrg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030021
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

--_000_SN6SPR01MB0160F127CF211A0917545944EF692SN6SPR01MB0160na_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

I tested the MSM BO buffer free tests on the target MSM platform and the ne=
w buffer free subtests passed successfully.

Tested-by: Sri Vidya Patrayani <spatraya@qti.qualcomm.com<mailto:spatraya@q=
ti.qualcomm.com>>


Regards,
Vidya

From: Jitta Vignan (Temp) <jvignan@qti.qualcomm.com>
Sent: 03 November 2026 09:37
To: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>
Subject: Re: [PATCH i-g-t 2/2] tests/msm/msm_bo: Add buffer free tests

++

________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com<mailto:kamil.koniecz=
ny@linux.intel.com>>
Sent: Friday, October 30, 2026 5:25 PM
To: Jitta Vignan (Temp) <jvignan@qti.qualcomm.com<mailto:jvignan@qti.qualco=
mm.com>>
Cc: igt-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org> <ig=
t-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org>>; Robin C=
lark <robclark@qti.qualcomm.com<mailto:robclark@qti.qualcomm.com>>; Akhil P=
 Oommen <akhilpo@qti.qualcomm.com<mailto:akhilpo@qti.qualcomm.com>>
Subject: Re: [PATCH i-g-t 2/2] tests/msm/msm_bo: Add buffer free tests

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

Hi Jitta,
On 2026-10-29 at 22:25:53 +0530, Jitta Vignan wrote:
> Add positive and negative coverage for freeing MSM buffer objects.
>
> Exercise single and multiple buffer cleanup, large buffer cleanup,
> repeated allocation and free operations, invalid and zero handles,
> double-free attempts, and queries made after a buffer has been freed.
>
> Verify that released buffer handles can no longer be queried through
> the MSM GEM info interface.
>
> Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com<mailto:jvignan@qti.=
qualcomm.com>>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com<mailto:kamil.kon=
ieczny@linux.intel.com>>

Regards,
Kamil

PS. could someone from Cc provide tested-by or r-b? Thanks!

> ---
>  tests/msm/msm_bo.c | 150 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 150 insertions(+)
>
> diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
> index 295c7b0d3..f76e78e73 100644
> --- a/tests/msm/msm_bo.c
> +++ b/tests/msm/msm_bo.c
> @@ -834,6 +834,156 @@ int igt_main()
>               igt_msm_bo_free(bo);
>       }
>
> +     /* Buffer Free Tests - Positive Cases */
> +     igt_describe("Free single buffer object");
> +     igt_subtest("bo-free-single") {
> +             struct msm_bo *bo;
> +             struct drm_msm_gem_info req =3D { 0 };
> +             uint32_t handle;
> +
> +             bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +             igt_assert_f(bo, "Failed to allocate buffer object\n");
> +             handle =3D bo->handle;
> +
> +             igt_msm_bo_free(bo);
> +
> +             /* Verify the handle is actually gone */
> +             req.handle =3D handle;
> +             req.info =3D MSM_INFO_GET_IOVA;
> +             do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, ENOENT)=
;
> +
> +             igt_info("Successfully freed single buffer object (handle %=
u)\n", handle);
> +     }
> +
> +     igt_describe("Free multiple buffer objects");
> +     igt_subtest("bo-free-multiple") {
> +             struct msm_bo *bo1, *bo2, *bo3;
> +             uint32_t handle1, handle2, handle3;
> +
> +             /* Allocate multiple buffers */
> +             bo1 =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC)=
;
> +             bo2 =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 2, MSM_BO=
_CACHED);
> +             bo3 =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 4, MSM_BO=
_WC);
> +
> +             igt_assert_f(bo1 && bo2 && bo3, "Failed to allocate buffer =
objects\n");
> +
> +             handle1 =3D bo1->handle;
> +             handle2 =3D bo2->handle;
> +             handle3 =3D bo3->handle;
> +
> +             /* Free all buffers */
> +             igt_msm_bo_free(bo1);
> +             igt_msm_bo_free(bo2);
> +             igt_msm_bo_free(bo3);
> +
> +             igt_info("Successfully freed multiple buffer objects (handl=
es %u, %u, %u)\n",
> +                      handle1, handle2, handle3);
> +     }
> +
> +     igt_describe("Free large buffer object");
> +     igt_subtest("bo-free-large") {
> +             struct msm_bo *bo;
> +             size_t large_size =3D 64 * 1024 * 1024; /* 64MB */
> +             uint32_t handle;
> +
> +             bo =3D igt_msm_bo_new(dev, large_size, MSM_BO_WC);
> +             igt_assert_f(bo, "Failed to allocate large buffer (64MB)\n"=
);
> +             handle =3D bo->handle;
> +
> +             igt_msm_bo_free(bo);
> +
> +             igt_info("Successfully freed large buffer (64MB, handle %u)=
\n", handle);
> +     }
> +
> +     igt_describe("Allocate and free buffers in sequence");
> +     igt_subtest("bo-free-sequence") {
> +             const int num_iterations =3D 10;
> +
> +             for (int i =3D 0; i < num_iterations; i++) {
> +                     struct msm_bo *bo;
> +                     uint32_t handle;
> +
> +                     bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM=
_BO_WC);
> +                     igt_assert_f(bo, "Failed to allocate buffer in iter=
ation %d\n", i);
> +                     handle =3D bo->handle;
> +
> +                     igt_msm_bo_free(bo);
> +
> +                     igt_debug("Iteration %d: allocated and freed handle=
 %u\n", i, handle);
> +             }
> +
> +             igt_info("Successfully completed %d allocate/free cycles\n"=
, num_iterations);
> +     }
> +
> +     /* Buffer Free Tests - Negative Cases */
> +     igt_describe("Free invalid handle (expects EINVAL)");
> +     igt_subtest("bo-free-invalid") {
> +             struct drm_gem_close close_req =3D { 0 };
> +
> +             close_req.handle =3D 0xDEADBEEF;
> +
> +             do_ioctl_err(dev->fd, DRM_IOCTL_GEM_CLOSE, &close_req, EINV=
AL);
> +
> +             igt_info("Correctly rejected freeing invalid handle with EI=
NVAL\n");
> +     }
> +
> +     igt_describe("Free same handle twice (expects EINVAL)");
> +     igt_subtest("bo-double-free") {
> +             struct msm_bo *bo;
> +             struct drm_gem_close close_req =3D { 0 };
> +
> +             bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +             igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +             close_req.handle =3D bo->handle;
> +
> +             /*
> +              * Free it once using gem_close and free bo struct manually
> +              * (bypassing igt_msm_bo_free to test double-free behavior)
> +              */
> +             gem_close(dev->fd, bo->handle);
> +             free(bo);
> +
> +             /* Try to free it again - should fail */
> +             do_ioctl_err(dev->fd, DRM_IOCTL_GEM_CLOSE, &close_req, EINV=
AL);
> +
> +             igt_info("Correctly rejected double-free with EINVAL\n");
> +     }
> +
> +     igt_describe("Free handle zero (expects EINVAL)");
> +     igt_subtest("bo-free-zero-handle") {
> +             struct drm_gem_close close_req =3D { 0 };
> +
> +             close_req.handle =3D 0;
> +
> +             do_ioctl_err(dev->fd, DRM_IOCTL_GEM_CLOSE, &close_req, EINV=
AL);
> +
> +             igt_info("Correctly rejected freeing handle 0 with EINVAL\n=
");
> +     }
> +
> +     igt_describe("Query offset and IOVA of a freed buffer (expects ENOE=
NT)");
> +     igt_subtest("bo-use-after-free") {
> +             struct msm_bo *bo;
> +             struct drm_msm_gem_info req =3D { 0 };
> +             uint32_t handle;
> +
> +             bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +             igt_assert_f(bo, "Failed to allocate buffer object\n");
> +             handle =3D bo->handle;
> +
> +             igt_msm_bo_free(bo);
> +
> +             /* Both info queries on the freed handle must fail */
> +             req.handle =3D handle;
> +             req.info =3D MSM_INFO_GET_IOVA;
> +             do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, ENOENT)=
;
> +
> +             req.info =3D MSM_INFO_GET_OFFSET;
> +             do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, ENOENT)=
;
> +
> +             igt_info("Correctly rejected use-after-free with ENOENT\n")=
;
> +     }
> +
>       igt_fixture() {
>               igt_msm_dev_close(dev);
>       }
> --
> 2.34.1
>

--_000_SN6SPR01MB0160F127CF211A0917545944EF692SN6SPR01MB0160na_
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
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
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
libri&quot;,sans-serif;color:black">I tested the MSM BO buffer free tests o=
n the target MSM platform and the new buffer free subtests passed successfu=
lly.<o:p></o:p></span></p>
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
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Jitta Vignan (Temp) &lt;jvignan@qti.qualcomm.com&gt;
<br>
<b>Sent:</b> 03 November 2026 09:37<br>
<b>To:</b> Sri Vidya Patrayani &lt;spatraya@qti.qualcomm.com&gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t 2/2] tests/msm/msm_bo: Add buffer free tes=
ts<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">++</span><span style=3D"font-size:8.0pt;font-family:&quo=
t;Segoe UI&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"1" width=3D"98%" align=3D"center">
</div>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif;color:black">From:</span></b><span style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:black"> Kamil Konieczny &lt;</span><a href=3D"ma=
ilto:kamil.konieczny@linux.intel.com"><span style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif">kamil.konieczny@linux.intel.com</span></a><span style=
=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">&gt;<br>
<b>Sent:</b> Friday, October 30, 2026 5:25 PM<br>
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
<b>Subject:</b> Re: [PATCH i-g-t 2/2] tests/msm/msm_bo: Add buffer free tes=
ts <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">WARNING: This email=
 originated from outside of Qualcomm. Please be wary of any links or attach=
ments, and do not enable macros.<br>
<br>
Hi Jitta,<br>
On 2026-10-29 at 22:25:53 +0530, Jitta Vignan wrote:<br>
&gt; Add positive and negative coverage for freeing MSM buffer objects.<br>
&gt;<br>
&gt; Exercise single and multiple buffer cleanup, large buffer cleanup,<br>
&gt; repeated allocation and free operations, invalid and zero handles,<br>
&gt; double-free attempts, and queries made after a buffer has been freed.<=
br>
&gt;<br>
&gt; Verify that released buffer handles can no longer be queried through<b=
r>
&gt; the MSM GEM info interface.<br>
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
PS. could someone from Cc provide tested-by or r-b? Thanks!<br>
<br>
&gt; ---<br>
&gt;&nbsp; tests/msm/msm_bo.c | 150 +++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;&nbsp; 1 file changed, 150 insertions(+)<br>
&gt;<br>
&gt; diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c<br>
&gt; index 295c7b0d3..f76e78e73 100644<br>
&gt; --- a/tests/msm/msm_bo.c<br>
&gt; +++ b/tests/msm/msm_bo.c<br>
&gt; @@ -834,6 +834,156 @@ int igt_main()<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; igt_msm_bo_free(bo);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Buffer Free Tests - Positive Cases */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Free single buffer object=
&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-free-single&quot;) {<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_info req =3D { 0 };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint32_t handle;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(bo, &quot;Failed to allocate buffer object\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; handle =3D bo-&gt;handle;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Verify the handle is actually gone */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.handle =3D handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.info =3D MSM_INFO_GET_IOVA;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; do_ioctl_err(dev-&gt;fd, DRM_IOCTL_MSM_GEM_INFO, &amp;req, ENOENT);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Successfully freed single buffer object (handle %u)\n&qu=
ot;, handle);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Free multiple buffer obje=
cts&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-free-multiple&quot;) {<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo1, *bo2, *bo3;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint32_t handle1, handle2, handle3;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Allocate multiple buffers */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo1 =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo2 =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 2, MSM_BO_CACHED);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo3 =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 4, MSM_BO_WC);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(bo1 &amp;&amp; bo2 &amp;&amp; bo3, &quot;Failed to allocat=
e buffer objects\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; handle1 =3D bo1-&gt;handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; handle2 =3D bo2-&gt;handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; handle3 =3D bo3-&gt;handle;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Free all buffers */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo2);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo3);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Successfully freed multiple buffer objects (handles %u, =
%u, %u)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handle1, handle2,=
 handle3);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Free large buffer object&=
quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-free-large&quot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; size_t large_size =3D 64 * 1024 * 1024; /* 64MB */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint32_t handle;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo =3D igt_msm_bo_new(dev, large_size, MSM_BO_WC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(bo, &quot;Failed to allocate large buffer (64MB)\n&quot;);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; handle =3D bo-&gt;handle;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Successfully freed large buffer (64MB, handle %u)\n&quot=
;, handle);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Allocate and free buffers=
 in sequence&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-free-sequence&quot;) {<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; const int num_iterations =3D 10;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; for (int i =3D 0; i &lt; num_iterations; i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct msm_bo *bo;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t handle;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo =3D igt_msm_bo_new(d=
ev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(bo, &quot;=
Failed to allocate buffer in iteration %d\n&quot;, i);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handle =3D bo-&gt;handl=
e;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_msm_bo_free(bo);<br=
>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Iterati=
on %d: allocated and freed handle %u\n&quot;, i, handle);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Successfully completed %d allocate/free cycles\n&quot;, =
num_iterations);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Buffer Free Tests - Negative Cases */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Free invalid handle (expe=
cts EINVAL)&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-free-invalid&quot;) {<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_gem_close close_req =3D { 0 };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close_req.handle =3D 0xDEADBEEF;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; do_ioctl_err(dev-&gt;fd, DRM_IOCTL_GEM_CLOSE, &amp;close_req, EINVAL);<=
br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Correctly rejected freeing invalid handle with EINVAL\n&=
quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Free same handle twice (e=
xpects EINVAL)&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-double-free&quot;) {<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_gem_close close_req =3D { 0 };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(bo, &quot;Failed to allocate buffer object\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close_req.handle =3D bo-&gt;handle;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * Free it once using gem_close and free bo struct manually<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * (bypassing igt_msm_bo_free to test double-free behavior)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; gem_close(dev-&gt;fd, bo-&gt;handle);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; free(bo);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Try to free it again - should fail */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; do_ioctl_err(dev-&gt;fd, DRM_IOCTL_GEM_CLOSE, &amp;close_req, EINVAL);<=
br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Correctly rejected double-free with EINVAL\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Free handle zero (expects=
 EINVAL)&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-free-zero-handle&quot;)=
 {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_gem_close close_req =3D { 0 };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close_req.handle =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; do_ioctl_err(dev-&gt;fd, DRM_IOCTL_GEM_CLOSE, &amp;close_req, EINVAL);<=
br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Correctly rejected freeing handle 0 with EINVAL\n&quot;)=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Query offset and IOVA of =
a freed buffer (expects ENOENT)&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-use-after-free&quot;) {=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_info req =3D { 0 };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint32_t handle;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(bo, &quot;Failed to allocate buffer object\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; handle =3D bo-&gt;handle;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Both info queries on the freed handle must fail */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.handle =3D handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.info =3D MSM_INFO_GET_IOVA;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; do_ioctl_err(dev-&gt;fd, DRM_IOCTL_MSM_GEM_INFO, &amp;req, ENOENT);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.info =3D MSM_INFO_GET_OFFSET;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; do_ioctl_err(dev-&gt;fd, DRM_IOCTL_MSM_GEM_INFO, &amp;req, ENOENT);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Correctly rejected use-after-free with ENOENT\n&quot;);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; igt_msm_dev_close(dev);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_SN6SPR01MB0160F127CF211A0917545944EF692SN6SPR01MB0160na_--
