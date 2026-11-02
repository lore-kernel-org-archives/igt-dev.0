Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598C6606A324
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 05:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ii1lD+ec
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B4910E57E;
	Mon,  2 Nov 2026 05:10:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD5E10E4B5
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 05:09:42 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A23vHka3324618
 for <igt-dev@lists.freedesktop.org>; Mon, 2 Nov 2026 05:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0I8pBlw/TZKFhGT7iwAbEV9w
 Rz0Ho0x7BgmHmpLvZIo=; b=Ii1lD+ecIIZBVd9MqR5jC18iIl4NHhcDsLHK/KLw
 Hr8Vj4oOIz6L4wxear0W3+qxiAl0KnqIP2lKujuE2Vsy3FJLWkR8Xae/pF6M+btn
 gAMzcJuNLI9N8DDwiBhTQipt4tMG6MXbkx03r5XT2d+6KAnQiceSfULcvmeghLic
 UafkMKd2N6Yp6tVM1Pr1aqE0tLWUHve51rO+LQcM6exEXcqjwb5v2SCVScnErnNF
 FPAhI3WSvN6flrDWL2eGqdnv5MEDNMlCJ6SjhN2cw2D+rPapQfrcJ68tUC7oAFJZ
 8grb30fw/OIA4yCymVppqbJaAPS9LcHOstw39Ik0SDJ+3A==
Received: from co1pr07cu001.outbound.protection.outlook.com
 (mail-co1pr07cu00106.outbound.protection.outlook.com [40.93.10.94])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6nbxp-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 02 Nov 2026 05:09:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6mHw0KOy6BnuvEQEMvD104komKSFDWc4G7TOfcuLeS0G1+d5/eoZfgK4ewne3JsZBbdx/ZnAfVupMYb6BxVNQ68cVTPCOspRSGTlY0bn65C8dAuHvmPx1vKExbevNuR3kKoNdIAU+RMKyaknu1aqhK2hn2CrY+O3/sP8dtlIEIgtLACp9M2LAjkLkFuza/Oo+VSPiAVEFpzczeFzoaBBuW0v2jhTAHq4lfwnGc5t4NLWsRcgYuC/727T3wckpKprExwfJc/0ib2dabyjKmmMdSuWqEqa566iCHcXWpA/HCLXkzKbBWf2ieltpo3rHMgFbJ55/ozsuKbYWfxonFqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I8pBlw/TZKFhGT7iwAbEV9wRz0Ho0x7BgmHmpLvZIo=;
 b=p15XQy9neBChg6LxfPRE0QrED0YQTYElAd7BU4Qp7kecuY3CURw3WrQZX+lFmDGcAThvkxig/camn+i+CUIGKgKBW/dUjppRtLs/uoVnvdoHkt28wwR9dv92iDV5R2XnCcKX/8IoOtqrOVRO7AayeU33lRco4yB1VDBr/gI+FaPwESJEhQ7k11iRAqiHoWyGGxT8Rn96hcYrXz4+O7N4Lt6e1BZHS8lU2UnnMjru2l8ZvWdxauk1rrwnlQTkaiO98LQCrEOaSNNuMzmATuHRhBnrjmd9t4OgoRvIjCknfJBA3IE95VsD3i6ahSV/kdpGC4WY2pKXFB7AGkvLM5FOyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SA6PR02MB10503.namprd02.prod.outlook.com
 (2603:10b6:806:407::18) by SJ2PR02MB9977.namprd02.prod.outlook.com
 (2603:10b6:a03:560::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 05:09:35 +0000
Received: from SA6PR02MB10503.namprd02.prod.outlook.com
 ([fe80::c83e:3a80:93f6:2f9c]) by SA6PR02MB10503.namprd02.prod.outlook.com
 ([fe80::c83e:3a80:93f6:2f9c%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 05:09:35 +0000
From: "Jitta Vignan (Temp)" <jvignan@qti.qualcomm.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Sri Vidya Patrayani
 <spatraya@qti.qualcomm.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Robin
 Clark <robclark@qti.qualcomm.com>,
 Akhil P Oommen <akhilpo@qti.qualcomm.com>
Subject: Re: [PATCH i-g-t] tests/msm/msm_bo: Add memory advice tests
Thread-Topic: [PATCH i-g-t] tests/msm/msm_bo: Add memory advice tests
Thread-Index: AQHdaDTZDJuRNiUz/kyZg1hOZoqRArcV+yAAgAQ0jEw=
Date: Mon, 2 Nov 2026 05:09:35 +0000
Message-ID: <SA6PR02MB10503C6F59CA57855E97822D3816A2@SA6PR02MB10503.namprd02.prod.outlook.com>
References: <20261030060638.2849895-1-spatraya@qti.qualcomm.com>
 <20261030115700.gqeyuk33hjady7jf@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20261030115700.gqeyuk33hjady7jf@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA6PR02MB10503:EE_|SJ2PR02MB9977:EE_
x-ms-office365-filtering-correlation-id: b7ba4f47-db04-47ef-80d7-08df389f7ca0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|261021121427099003|4143699003|11063799006|56012099006|261009223027099003|261009223327099003|261009221227099003|261009220027099003|261009221727099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|10067099003|22082099003|18002099003|8096899003;
x-microsoft-antispam-message-info: AKMzbNuxplREfHlJgKwGO0x9uuA7hcROvlsXmNJpGKpYeZLUgTdhINcykEoxRe6w556Xki/ro9m7ntHmBZo5ryQobBLylMjiOEsQSJOOG5ujekpmYjUMgszIj51DFw5NOzCjrr/P/jiv0ExMtSzhovWGXUMuvN0eUD7i/fI0bj/9AcPfVX9P6AyEqh6SNlHAfgC39lMmXL49AQppZ19Qc3v4UR101u1Rh6UWne/uHQ0dUBDtsOhctH9lheqbRBFvgr5ZAdZPzbxSbT0k2/Rd8z8ixacxkobaGra0lSFn+nMIvjMDrXhkSUVQJpFnYWbWF8MZisYGFf4IjNGYsQmKTMvDJeJu4MRLBN8nC22AF/7okbiG/zwbFszeFN5W7Ddmm1ekDcPMclaC21DPgvvLLQk/2rMqnI9TeqyMBgnY/9OYFoHKn3Rz7t4ilcqk9NjLgYaw2Jj2tPuMQcfHvMW+z0jlwiFhulGdlCwGlk8X1TeVYFxppMNpJMScKqW5BW9TQ6ObAUwEMpVsNSZAYh2d6jmxsDMiGmPyoYuVpAXeBaFghfugLSEDp0QJOKHhO6DJWAdGh8E7UDWD7jcXd3HlGypF4JJezuu3YrJVLcfPJ21RN/YJnHgpqa7a8vE97dWRMynoLtnLw9qq+AaXb3OQBOzKCFYoM7526R3mOc3hArCZQRViCE/K+AlUtZwxr/qn1C+0zDVs2OhtTBmzAbsGdDqF9+YjBgngQlOf5G+RHCs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA6PR02MB10503.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(261021121427099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261009223327099003)(261009221227099003)(261009220027099003)(261009221727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?37o+oBMtZer62eUim5msWDUi9hIFbCSy5Ptk6YWGyGsWwhzAQhbmtxB33J?=
 =?iso-8859-1?Q?Pst3nOC5wogR9BKKcVjAGq7fR3Sb1sq3kftcPfHgPqhNXy2tiqpramiKR9?=
 =?iso-8859-1?Q?OLFl4BC7/4r2FspVHEsRMWKVUltDyX7xyd29xrrb+XeWR9qfK1DP/vUsWQ?=
 =?iso-8859-1?Q?P98Vb1Wmgrz+17n5R1bmG2G6n3XZ+VK5RgN+pW6YDIjDs10O5Q5jpCXTHt?=
 =?iso-8859-1?Q?lsWX7Kmlk+7Amg0ZZoZxPIJRrGIT6hLbCbyxdVlgYTHsPg0jYXuQhjlmII?=
 =?iso-8859-1?Q?PGHrMSlPa2F4dmP+tHqBXgoI9ehjOYo+X2E3HRfKkdzHmOSZWnz+OD+R6o?=
 =?iso-8859-1?Q?4/YGGmR2J0nsvb0n5hpmrb4l4ciAQvKOGHCtrlTt7v9h8FximBf6fiE6eU?=
 =?iso-8859-1?Q?ef741aCaMpUOKYPBQdgemU2WYwJ99kawgv9TQRk0pwi4infvZzY6N60qsp?=
 =?iso-8859-1?Q?2r1KdrddlnaTKDlhfNBI5Bp8aXdri98y4xjJzAwQoy9PhI48pw0olgThiP?=
 =?iso-8859-1?Q?tv4LIuf2lwXQqcoH3JpMdqB9LjBDTVbhBH72S9z01JHTQjiYQlL8RCs8++?=
 =?iso-8859-1?Q?IrjMI68WkQt1CWiMGRiz41qgy+aTZC27W+wSxRzCv1E0/9kmie8sOPkJDR?=
 =?iso-8859-1?Q?OMTsfCZ+8fbjFjI9ZBMeCKp4jeWHOpzqZQMtb3/WSFpxn/sYX5qqkEV2En?=
 =?iso-8859-1?Q?9vtVnEn/h8LI37DISc3YTU+qoy5LPrJhZvu3kQyCW80EMxdwWhcneh1ff8?=
 =?iso-8859-1?Q?3BGQFLxRk5KSEkWxsxt+RfhsanCZWRNwFHNsOCwQytVJhsLQXTMNe1yw3m?=
 =?iso-8859-1?Q?P/HUfc7qK4D28C1gKLCX04wHD6jC/p2bBuvi9nMRlHxKVOFkPMo3FWL1hV?=
 =?iso-8859-1?Q?rSPV+LPSOeNzny4Iw3N3biE6xsSRhR5sxg7sC87t01QfITkaeUx+jc7QAD?=
 =?iso-8859-1?Q?3aUSijPRRylqmHN21snM3S4StgBP/yg/Hb3ZBpFr2kBjwK1ZupPHmqv+lU?=
 =?iso-8859-1?Q?nLk9+uuBavyXtHRmO9wnX4Z+reLuYQxFtn2/TGmP+NJxGPS2L8P0tc+616?=
 =?iso-8859-1?Q?HLh7XcGSt93RWZaJAGRolYbfP8txJ5tqPzDAtpPhfC6rI2hPnnJZRx/W2s?=
 =?iso-8859-1?Q?/DUAM0BaAbPvjjAr0Y+XaMj0PdbHkp1bme4svoN9L+jTLqUsuMaLsuLMz1?=
 =?iso-8859-1?Q?0J3Fqj1+/Vua1o3zMC04FtTWHYbmJNmt/yXGI+E1DYB1v7Aaxa20aYQfow?=
 =?iso-8859-1?Q?bIv/mYFLPf7YDLlcgiD3x80L7tBqQgmV9tciQqkHW+hPeZXWLd4wdhbPCW?=
 =?iso-8859-1?Q?VX1kUr1GYh/JOVsxgtpPsh0V+3JI5rvwyfPzqGHRTQ1APPOFUV5kn12EmV?=
 =?iso-8859-1?Q?6ICcJOovjIW02+dAvvRN2oHIL3D9VWSXZ+LgqQPV1RdB0a6WFS5LEFngWh?=
 =?iso-8859-1?Q?aTHeIxBIb+QDoZNyLEY4Uk6RBmQcg8nr99/9VS0+yYegYBS2ZD3R6NoRY2?=
 =?iso-8859-1?Q?TIvvzJFS2eerQJNm9dnFD6iTAx57uaZrO/Q6HexH0XgpVPHiTNUaVqfWXm?=
 =?iso-8859-1?Q?gxBJyq4dsZI8bTNyMFOwq9rOWa9p13VLlXQAmd2GkoYr6rJnGjL4AAd/dk?=
 =?iso-8859-1?Q?5dLsOiYaHYWxkwWvGll3hXYxnviyZq6RsyUYa+jLnHfq46mI6IGqKphg7/?=
 =?iso-8859-1?Q?AWhlSgnY6Q+mMU9b4Z7lbhd+vDnKqfFiLY63LWHmRyxLB/XrXXAEQrBmRm?=
 =?iso-8859-1?Q?la+QLjb4xExNWteJjKPR0klGJy6ApyTUAUDkoftbietrn+89coK/Iqm/B4?=
 =?iso-8859-1?Q?gBbK7Fou9w=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SA6PR02MB10503C6F59CA57855E97822D3816A2SA6PR02MB10503na_"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jXKs7P4eL1oM8it8WNgtyhuA03VQaP11Mq3BIkHkch4d/QgR+XM6u9IqLOoU0waY+8920RSHGqhHP2C3bhGDTuPayCyCItnw/znPYSwnL5I9Jd7n+5+NSkZlCkfjdVv7TnypfUs12fCIbHdMQ05B2wHv0q5ca9PLowBP5QtI9QqXBKwf4EMmPc5mm3XR3CX4nqHLEgmzcGCRO1nHkrRR+5N/PxtU43Z+2/uoQ7sy6xJy1D/c3ufwYDCKLkAleC3OCLRla9r3vwUhxTts5V4yswe0LkVOSPlEh6xfwQxpgrzGLkoZl9DZ3/g9aKRCGp9WtZkRb2P10mxbtGEaG/fljg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: iCZEEUtaedateYO0PbSv4dd32cCYA2wPv30b0WsbVzyRO9a/AZIYz6v17c3xVX5DWetDAA8WtMMCCJrytywrIQrEkpaSzj8OcvJhxz6pCJK6QYNwj94x605qJUD7J3+na/gwIwykzmF7RSZYX8xm+Dw5yVqBO4dBSqkL7tfQyxLJGQSUQFFQPIP9NE6iJtuu4JT0Z4lsaeOXuFgv6rAwZvA2r3r1Cf3lJNyUIGtN3AYwz7xTcowWR6u6Sk4vfDL1fNExJcwd3VnN31C8Tar/3Ot00uI13JZXGXL95Dn6MAQQsXmv5txc4g6YYZnf3fR8DyUPxZuabpE6C7yfpM09WgXMhxrJBYQmFM9KFJdlva2EWnLagdphfGdqz5pCoMwQBw6odhHCyjhnMl6PElprM+v9sbYq2fy/w4Z74vnESmDs3ZUIXvZS0O9Wkp3jwZm4PUJqmqxHiRArAIixBL/IueunXUiGJ76AYsl+VA365tn4hty7YS2IaLJhYII57NprTmZgDrbzAz9Vu9HFmF6g4q7yACfHphSOwJo1JwpyUMkV2r+7k6EYNFFYA2VoXw7nd7jFhceAx26fHU/cYF8sYcr3h2OA7/4qT2+8BW6ekpoN9TrKlpEX+VMJV1oC5uof
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA6PR02MB10503.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ba4f47-db04-47ef-80d7-08df389f7ca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 05:09:35.1122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 10DofqBv4qHaYAHYs1qV/Vy4vwSpl+THh1sl6ZGcJBBaJXy5VSCUtwaDmO63EDpHBwIU+NsJjtlORZIprvUQoXPPtiizip2KU7vNCXXUlhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR02MB9977
X-Proofpoint-ORIG-GUID: VY3te6kdEbIK_8TMy7qb4Ypk25A36JnU
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae81b15 cx=c_pps
 a=53X/sozkCKOk7M927VV23w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=z36En_34AKj8SljwZPEA:9
 a=wPNLvfGTeEIA:10 a=GUy4ZUVHgbDHPE1LGpkA:9 a=zW1VUy9eUtG_zNvi:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: VY3te6kdEbIK_8TMy7qb4Ypk25A36JnU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyMCBTYWx0ZWRfX5bX9G7AEhtCN
 eI/HjRCKiC3WIrjLNxkFuHtgdhHX558JlHR7Qq1rOf/BLLsnIGqAG1kKYnJ66gOtuNsDdn+X4Wh
 okx/9SmSA0mAv8Z5sDNAWw2CSGib/Ds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyMCBTYWx0ZWRfX/P4RQSSlpKYE
 bEipr7lGcTTq5iM/wKgzTVbFfxHznz2sUJkIerN2nxizCnjPqIeWVusM19pPDUb0+EK2+8gmLFp
 RqWutd4mhsGrCDYG6WczX1ah7ZDtgJ/R1BcoxJSM7bof66MD/FTkY7bNC4+vfE1mPu4vWo2ViCp
 wAVtA8U+bSlIHtu++DxeKe6t4QhXOXx4X7h6MeP/ubsttbjUZ2D3avr+HGbUib7qYwYLAzHIFT6
 t54Q6PLdBXKOhuq8p940HY75NC5zqVfApowFNOpw5lab5Iw6vV3/4IH5zPkukMTV9HutIBrirx7
 GEJEdou8Dfso9UjILYmE3pv8CaJcktyQiioKpJQkA/GSqR8BvFBHeOzazsNJfZuKO279mIJQLPg
 LZbScI623gPnLThMX0mnQZ2fp3RLiCUHLECEaH5T2+kMV3im1H0Otc6e3dCeWHlFzkIxcOI5VD6
 RcAX11i8u33gy4gqpWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020020
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

--_000_SA6PR02MB10503C6F59CA57855E97822D3816A2SA6PR02MB10503na_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

I tested the MSM BO memory advice tests on the target MSM platform and the =
new madvise subtests passed successfully.

Tested-by: Jitta Vignan <jvignan@qti.qualcomm.com>


Regards,

Vignan

________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Friday, October 30, 2026 5:27 PM
To: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Jitta Vi=
gnan (Temp) <jvignan@qti.qualcomm.com>; Robin Clark <robclark@qti.qualcomm.=
com>; Akhil P Oommen <akhilpo@qti.qualcomm.com>
Subject: Re: [PATCH i-g-t] tests/msm/msm_bo: Add memory advice tests

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

Hi Sri,
On 2026-10-30 at 11:36:38 +0530, Sri Vidya Patrayani wrote:
> Add positive and negative coverage for MSM buffer object memory advice.
>
> Exercise WILLNEED and DONTNEED advice across write-combine, cached,
> mapped, large, and multiple buffer objects, including CPU access
> transitions.
>
> Verify invalid handles, invalid advice values, and advice requests
> after buffer release are rejected as expected.
>
> Signed-off-by: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>

I forgot to add an ask for devs on Cc: please provide a tested-by
and/or r-b to this patch, thanks in advance!


Regards,
Kamil

> ---
>  tests/msm/msm_bo.c | 238 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 238 insertions(+)
>
> diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
> index 3257697f5..906f801ef 100644
> --- a/tests/msm/msm_bo.c
> +++ b/tests/msm/msm_bo.c
> @@ -414,6 +414,244 @@ int igt_main()
>               igt_msm_bo_free(bo);
>       }
>
> +     /* Memory Advice Tests - Positive Cases */
> +     igt_describe("Set WILLNEED advice and verify that the buffer is ret=
ained");
> +     igt_subtest("bo-madvise-willneed") {
> +             struct drm_msm_gem_madvise req =3D { 0 };
> +             struct msm_bo *bo;
> +             int ret;
> +
> +             bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +             igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +             req.handle =3D bo->handle;
> +             req.madv =3D MSM_MADV_WILLNEED;
> +
> +             ret =3D igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req)=
;
> +             igt_assert_eq(ret, 0);
> +             igt_assert_eq(req.retained, 1);
> +
> +             igt_msm_bo_free(bo);
> +     }
> +
> +     igt_describe("Set DONTNEED advice on a buffer object");
> +     igt_subtest("bo-madvise-dontneed") {
> +             struct drm_msm_gem_madvise req =3D { 0 };
> +             struct msm_bo *bo;
> +             int ret;
> +
> +             bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +             igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +             req.handle =3D bo->handle;
> +             req.madv =3D MSM_MADV_DONTNEED;
> +
> +             ret =3D igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req)=
;
> +             igt_assert_eq(ret, 0);
> +
> +             igt_info("Buffer retained status after DONTNEED: %d\n", req=
.retained);
> +             igt_msm_bo_free(bo);
> +     }
> +
> +     igt_describe("Apply WILLNEED and DONTNEED advice to the same buffer=
");
> +     igt_subtest("bo-madvise-multiple-calls") {
> +             struct drm_msm_gem_madvise req =3D { 0 };
> +             struct msm_bo *bo;
> +             int ret;
> +
> +             bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +             igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +             req.handle =3D bo->handle;
> +             req.madv =3D MSM_MADV_WILLNEED;
> +             ret =3D igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req)=
;
> +             igt_assert_eq(ret, 0);
> +             igt_assert_eq(req.retained, 1);
> +
> +             req.madv =3D MSM_MADV_DONTNEED;
> +             ret =3D igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req)=
;
> +             igt_assert_eq(ret, 0);
> +
> +             igt_info("Buffer retained status after DONTNEED: %d\n", req=
.retained);
> +             igt_msm_bo_free(bo);
> +     }
> +
> +     igt_describe("Apply DONTNEED advice to a mapped buffer object");
> +     igt_subtest("bo-madvise-mapped-buffer") {
> +             struct drm_msm_gem_madvise req =3D { 0 };
> +             struct msm_bo *bo;
> +             void *map;
> +             int ret;
> +
> +             bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +             igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +             map =3D igt_msm_bo_map(bo);
> +             igt_assert_f(map, "Failed to map buffer object\n");
> +
> +             req.handle =3D bo->handle;
> +             req.madv =3D MSM_MADV_DONTNEED;
> +             ret =3D igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req)=
;
> +             igt_assert_eq(ret, 0);
> +
> +             igt_info("Mapped buffer retained status: %d\n", req.retaine=
d);
> +             igt_msm_bo_free(bo);
> +     }
> +
> +     igt_describe("Apply WILLNEED advice to a cached buffer object");
> +     igt_subtest("bo-madvise-cached-buffer") {
> +             struct drm_msm_gem_madvise req =3D { 0 };
> +             struct msm_bo *bo;
> +             int ret;
> +
> +             bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_CACH=
ED);
> +             igt_assert_f(bo, "Failed to allocate cached buffer object\n=
");
> +
> +             req.handle =3D bo->handle;
> +             req.madv =3D MSM_MADV_WILLNEED;
> +             ret =3D igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req)=
;
> +             igt_assert_eq(ret, 0);
> +             igt_assert_eq(req.retained, 1);
> +
> +             igt_msm_bo_free(bo);
> +     }
> +
> +     igt_describe("Apply DONTNEED advice to a large buffer object");
> +     igt_subtest("bo-madvise-large-buffer") {
> +             struct drm_msm_gem_madvise req =3D { 0 };
> +             const size_t large_size =3D 64 * 1024 * 1024;
> +             struct msm_bo *bo;
> +             int ret;
> +
> +             bo =3D igt_msm_bo_new(dev, large_size, MSM_BO_WC);
> +             igt_assert_f(bo, "Failed to allocate large buffer object\n"=
);
> +
> +             req.handle =3D bo->handle;
> +             req.madv =3D MSM_MADV_DONTNEED;
> +             ret =3D igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req)=
;
> +             igt_assert_eq(ret, 0);
> +
> +             igt_info("Large buffer retained status: %d\n", req.retained=
);
> +             igt_msm_bo_free(bo);
> +     }
> +
> +     igt_describe("Apply memory advice to multiple buffer objects");
> +     igt_subtest("bo-madvise-multiple-buffers") {
> +             struct drm_msm_gem_madvise req =3D { 0 };
> +             struct msm_bo *bo1, *bo2;
> +             int ret;
> +
> +             bo1 =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC)=
;
> +             bo2 =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 2, MSM_BO=
_CACHED);
> +             igt_assert_f(bo1 && bo2, "Failed to allocate buffer objects=
\n");
> +
> +             req.handle =3D bo1->handle;
> +             req.madv =3D MSM_MADV_WILLNEED;
> +             ret =3D igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req)=
;
> +             igt_assert_eq(ret, 0);
> +             igt_assert_eq(req.retained, 1);
> +
> +             req.handle =3D bo2->handle;
> +             req.madv =3D MSM_MADV_DONTNEED;
> +             ret =3D igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req)=
;
> +             igt_assert_eq(ret, 0);
> +
> +             igt_info("Second buffer retained status: %d\n", req.retaine=
d);
> +             igt_msm_bo_free(bo1);
> +             igt_msm_bo_free(bo2);
> +     }
> +
> +     igt_describe("Apply DONTNEED advice after balanced CPU access");
> +     igt_subtest("bo-madvise-after-cpu-prep") {
> +             struct drm_msm_gem_cpu_prep prep_req =3D { 0 };
> +             struct drm_msm_gem_cpu_fini fini_req =3D { 0 };
> +             struct drm_msm_gem_madvise madv_req =3D { 0 };
> +             struct msm_bo *bo;
> +             uint32_t *ptr;
> +             void *map;
> +             int ret;
> +
> +             bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +             igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +             map =3D igt_msm_bo_map(bo);
> +             igt_assert_f(map, "Failed to map buffer object\n");
> +             ptr =3D map;
> +
> +             prep_req.handle =3D bo->handle;
> +             prep_req.op =3D MSM_PREP_READ | MSM_PREP_WRITE | MSM_PREP_N=
OSYNC;
> +             ret =3D igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_CPU_PREP, &pre=
p_req);
> +             igt_assert_eq(ret, 0);
> +
> +             ptr[0] =3D 0xDEADBEEF;
> +
> +             fini_req.handle =3D bo->handle;
> +             ret =3D igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_CPU_FINI, &fin=
i_req);
> +             igt_assert_eq(ret, 0);
> +
> +             madv_req.handle =3D bo->handle;
> +             madv_req.madv =3D MSM_MADV_DONTNEED;
> +             ret =3D igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &madv=
_req);
> +             igt_assert_eq(ret, 0);
> +
> +             igt_info("Buffer retained status: %d\n", madv_req.retained)=
;
> +             igt_msm_bo_free(bo);
> +     }
> +
> +     /* Memory Advice Tests - Negative Cases */
> +     igt_describe("Reject memory advice for an invalid buffer handle");
> +     igt_subtest("bo-madvise-invalid-bo") {
> +             struct drm_msm_gem_madvise req =3D { 0 };
> +
> +             req.handle =3D 0xDEADBEEF;
> +             req.madv =3D MSM_MADV_WILLNEED;
> +
> +             do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req, ENOE=
NT);
> +     }
> +
> +     igt_describe("Reject memory advice for handle zero");
> +     igt_subtest("bo-madvise-zero-handle") {
> +             struct drm_msm_gem_madvise req =3D { 0 };
> +
> +             req.handle =3D 0;
> +             req.madv =3D MSM_MADV_WILLNEED;
> +
> +             do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req, ENOE=
NT);
> +     }
> +
> +     igt_describe("Reject an invalid memory advice value");
> +     igt_subtest("bo-madvise-invalid-advice") {
> +             struct drm_msm_gem_madvise req =3D { 0 };
> +             struct msm_bo *bo;
> +
> +             bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +             igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +             req.handle =3D bo->handle;
> +             req.madv =3D 0xDEADBEEF;
> +
> +             do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req, EINV=
AL);
> +             igt_msm_bo_free(bo);
> +     }
> +
> +     igt_describe("Reject memory advice after a buffer has been freed");
> +     igt_subtest("bo-madvise-after-free") {
> +             struct drm_msm_gem_madvise req =3D { 0 };
> +             struct msm_bo *bo;
> +             uint32_t handle;
> +
> +             bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +             igt_assert_f(bo, "Failed to allocate buffer object\n");
> +             handle =3D bo->handle;
> +
> +             igt_msm_bo_free(bo);
> +
> +             req.handle =3D handle;
> +             req.madv =3D MSM_MADV_WILLNEED;
> +
> +             do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req, ENOE=
NT);
> +     }
> +
>       igt_fixture() {
>               igt_msm_dev_close(dev);
>       }
> --
> 2.34.1
>

--_000_SA6PR02MB10503C6F59CA57855E97822D3816A2SA6PR02MB10503na_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Kamil,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I tested the MSM BO memory advice tests on the target MSM platform and the =
new madvise subtests passed successfully.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Tested-by: Jitta Vignan &lt;jvignan@qti.qualcomm.com&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" class=3D"elementToProof">
<p class=3D"elementToProof" style=3D"line-height: 20px; margin: 0in;"><span=
 style=3D"font-family: &quot;Palatino Linotype&quot;, &quot;Book Antiqua&qu=
ot;, Palatino, serif; font-size: 12pt; color: rgb(0, 0, 0);">Regards,</span=
></p>
<div class=3D"elementToProof" style=3D"font-family: &quot;Palatino Linotype=
&quot;, &quot;Book Antiqua&quot;, Palatino, serif; font-size: 12pt; color: =
rgb(0, 0, 0);">
Vignan</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin: 0in; font=
-family: &quot;Segoe UI&quot;; font-size: 8pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt;"><br>
</span></div>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<br>
<b>Sent:</b> Friday, October 30, 2026 5:27 PM<br>
<b>To:</b> Sri Vidya Patrayani &lt;spatraya@qti.qualcomm.com&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; Jitta Vignan (Temp) &lt;jvignan@qti.qualcomm.com&gt;; Robin Clark &lt;=
robclark@qti.qualcomm.com&gt;; Akhil P Oommen &lt;akhilpo@qti.qualcomm.com&=
gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t] tests/msm/msm_bo: Add memory advice tests=
 </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">WARNING: This email originated from outside=
 of Qualcomm. Please be wary of any links or attachments, and do not enable=
 macros.<br>
<br>
Hi Sri,<br>
On 2026-10-30 at 11:36:38 +0530, Sri Vidya Patrayani wrote:<br>
&gt; Add positive and negative coverage for MSM buffer object memory advice=
.<br>
&gt;<br>
&gt; Exercise WILLNEED and DONTNEED advice across write-combine, cached,<br=
>
&gt; mapped, large, and multiple buffer objects, including CPU access<br>
&gt; transitions.<br>
&gt;<br>
&gt; Verify invalid handles, invalid advice values, and advice requests<br>
&gt; after buffer release are rejected as expected.<br>
&gt;<br>
&gt; Signed-off-by: Sri Vidya Patrayani &lt;spatraya@qti.qualcomm.com&gt;<b=
r>
<br>
I forgot to add an ask for devs on Cc: please provide a tested-by<br>
and/or r-b to this patch, thanks in advance!<br>
<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; ---<br>
&gt;&nbsp; tests/msm/msm_bo.c | 238 +++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;&nbsp; 1 file changed, 238 insertions(+)<br>
&gt;<br>
&gt; diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c<br>
&gt; index 3257697f5..906f801ef 100644<br>
&gt; --- a/tests/msm/msm_bo.c<br>
&gt; +++ b/tests/msm/msm_bo.c<br>
&gt; @@ -414,6 +414,244 @@ int igt_main()<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; igt_msm_bo_free(bo);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Memory Advice Tests - Positive Cases */<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Set WILLNEED advice and v=
erify that the buffer is retained&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-madvise-willneed&quot;)=
 {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_madvise req =3D { 0 };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(bo, &quot;Failed to allocate buffer object\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.handle =3D bo-&gt;handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.madv =3D MSM_MADV_WILLNEED;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_ioctl(dev-&gt;fd, DRM_IOCTL_MSM_GEM_MADVISE, &amp;req);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(ret, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(req.retained, 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Set DONTNEED advice on a =
buffer object&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-madvise-dontneed&quot;)=
 {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_madvise req =3D { 0 };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(bo, &quot;Failed to allocate buffer object\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.handle =3D bo-&gt;handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.madv =3D MSM_MADV_DONTNEED;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_ioctl(dev-&gt;fd, DRM_IOCTL_MSM_GEM_MADVISE, &amp;req);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(ret, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Buffer retained status after DONTNEED: %d\n&quot;, req.r=
etained);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Apply WILLNEED and DONTNE=
ED advice to the same buffer&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-madvise-multiple-calls&=
quot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_madvise req =3D { 0 };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(bo, &quot;Failed to allocate buffer object\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.handle =3D bo-&gt;handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.madv =3D MSM_MADV_WILLNEED;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_ioctl(dev-&gt;fd, DRM_IOCTL_MSM_GEM_MADVISE, &amp;req);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(ret, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(req.retained, 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.madv =3D MSM_MADV_DONTNEED;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_ioctl(dev-&gt;fd, DRM_IOCTL_MSM_GEM_MADVISE, &amp;req);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(ret, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Buffer retained status after DONTNEED: %d\n&quot;, req.r=
etained);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Apply DONTNEED advice to =
a mapped buffer object&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-madvise-mapped-buffer&q=
uot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_madvise req =3D { 0 };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; void *map;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(bo, &quot;Failed to allocate buffer object\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; map =3D igt_msm_bo_map(bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(map, &quot;Failed to map buffer object\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.handle =3D bo-&gt;handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.madv =3D MSM_MADV_DONTNEED;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_ioctl(dev-&gt;fd, DRM_IOCTL_MSM_GEM_MADVISE, &amp;req);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(ret, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Mapped buffer retained status: %d\n&quot;, req.retained)=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Apply WILLNEED advice to =
a cached buffer object&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-madvise-cached-buffer&q=
uot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_madvise req =3D { 0 };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_CACHED);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(bo, &quot;Failed to allocate cached buffer object\n&quot;)=
;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.handle =3D bo-&gt;handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.madv =3D MSM_MADV_WILLNEED;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_ioctl(dev-&gt;fd, DRM_IOCTL_MSM_GEM_MADVISE, &amp;req);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(ret, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(req.retained, 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Apply DONTNEED advice to =
a large buffer object&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-madvise-large-buffer&qu=
ot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_madvise req =3D { 0 };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; const size_t large_size =3D 64 * 1024 * 1024;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo =3D igt_msm_bo_new(dev, large_size, MSM_BO_WC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(bo, &quot;Failed to allocate large buffer object\n&quot;);=
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.handle =3D bo-&gt;handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.madv =3D MSM_MADV_DONTNEED;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_ioctl(dev-&gt;fd, DRM_IOCTL_MSM_GEM_MADVISE, &amp;req);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(ret, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Large buffer retained status: %d\n&quot;, req.retained);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Apply memory advice to mu=
ltiple buffer objects&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-madvise-multiple-buffer=
s&quot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_madvise req =3D { 0 };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo1, *bo2;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo1 =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo2 =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 2, MSM_BO_CACHED);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(bo1 &amp;&amp; bo2, &quot;Failed to allocate buffer object=
s\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.handle =3D bo1-&gt;handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.madv =3D MSM_MADV_WILLNEED;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_ioctl(dev-&gt;fd, DRM_IOCTL_MSM_GEM_MADVISE, &amp;req);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(ret, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(req.retained, 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.handle =3D bo2-&gt;handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.madv =3D MSM_MADV_DONTNEED;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_ioctl(dev-&gt;fd, DRM_IOCTL_MSM_GEM_MADVISE, &amp;req);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(ret, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Second buffer retained status: %d\n&quot;, req.retained)=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo2);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Apply DONTNEED advice aft=
er balanced CPU access&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-madvise-after-cpu-prep&=
quot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_cpu_prep prep_req =3D { 0 };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_cpu_fini fini_req =3D { 0 };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_madvise madv_req =3D { 0 };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint32_t *ptr;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; void *map;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(bo, &quot;Failed to allocate buffer object\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; map =3D igt_msm_bo_map(bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(map, &quot;Failed to map buffer object\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ptr =3D map;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; prep_req.handle =3D bo-&gt;handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; prep_req.op =3D MSM_PREP_READ | MSM_PREP_WRITE | MSM_PREP_NOSYNC;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_ioctl(dev-&gt;fd, DRM_IOCTL_MSM_GEM_CPU_PREP, &amp;prep_req=
);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(ret, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ptr[0] =3D 0xDEADBEEF;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fini_req.handle =3D bo-&gt;handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_ioctl(dev-&gt;fd, DRM_IOCTL_MSM_GEM_CPU_FINI, &amp;fini_req=
);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(ret, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; madv_req.handle =3D bo-&gt;handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; madv_req.madv =3D MSM_MADV_DONTNEED;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_ioctl(dev-&gt;fd, DRM_IOCTL_MSM_GEM_MADVISE, &amp;madv_req)=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(ret, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Buffer retained status: %d\n&quot;, madv_req.retained);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Memory Advice Tests - Negative Cases */<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Reject memory advice for =
an invalid buffer handle&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-madvise-invalid-bo&quot=
;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_madvise req =3D { 0 };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.handle =3D 0xDEADBEEF;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.madv =3D MSM_MADV_WILLNEED;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; do_ioctl_err(dev-&gt;fd, DRM_IOCTL_MSM_GEM_MADVISE, &amp;req, ENOENT);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Reject memory advice for =
handle zero&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-madvise-zero-handle&quo=
t;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_madvise req =3D { 0 };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.handle =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.madv =3D MSM_MADV_WILLNEED;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; do_ioctl_err(dev-&gt;fd, DRM_IOCTL_MSM_GEM_MADVISE, &amp;req, ENOENT);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Reject an invalid memory =
advice value&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-madvise-invalid-advice&=
quot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_madvise req =3D { 0 };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo =3D igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(bo, &quot;Failed to allocate buffer object\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.handle =3D bo-&gt;handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.madv =3D 0xDEADBEEF;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; do_ioctl_err(dev-&gt;fd, DRM_IOCTL_MSM_GEM_MADVISE, &amp;req, EINVAL);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_msm_bo_free(bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Reject memory advice afte=
r a buffer has been freed&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;bo-madvise-after-free&quot=
;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_msm_gem_madvise req =3D { 0 };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct msm_bo *bo;<br>
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
sp; req.handle =3D handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; req.madv =3D MSM_MADV_WILLNEED;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; do_ioctl_err(dev-&gt;fd, DRM_IOCTL_MSM_GEM_MADVISE, &amp;req, ENOENT);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; igt_msm_dev_close(dev);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
</div>
</body>
</html>

--_000_SA6PR02MB10503C6F59CA57855E97822D3816A2SA6PR02MB10503na_--
