Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A3F606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 06:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=Y+RzBGSP;
	dkim=pass (1024-bit key, unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-IMGTecCRM-onmicrosoft-com header.b=mfsIMTWL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744EB10E522;
	Thu, 12 Nov 2026 06:24:45 +0000 (UTC)
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8E610E522
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 06:23:40 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AC5PeGe1348225
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 06:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=W0cUIGCFi3V2uwLIDTDqSvyQY48hPqs3BXU0RnE8MXk=; b=Y+R
 zBGSPVT8m49W7l/OsDkn/S4kL5bAIV8dHbXSgwzJZxxLDP0Ym+9WAuY6dnLO08uJ
 RPzqFyVGwwfQF6QreuMCgqI283at52AjBWHl4HnUFc75SL1f30QdXZj2DoZoTWUF
 tccx+f/LVp3slsqihQdX/K7Cs5/N+UaLnHsk8wLgVUd4Cjq9fay7Wjz0vDrfN3yC
 xFbUiyh8uw1pInJc5ClQNtI/K9nzgJ34WVlOjahTQHKnCRsdB++13KshhrJhCGsO
 4DBZR1Nn8tVSF02thbjcK11EA2vuszyD642Qzx6T3iVRreuSdAGkQ90JADzqookX
 tpUwYlVWsh/jMJRt04Q==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazon11022104.outbound.protection.outlook.com [52.101.96.104])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hw4dug3ep-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT
 key_exchange=secp256r1)
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 06:23:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghmFW0Zdcn5PgZiy26WO6EoEeCrsCerYeEWSWcndcw96QTtn0cRmReS42Kby3NQUBshcWJushXB2SiOrta0XBUlq6CNWPE9a+wq7EKNOKDNq3f6Hkzmhhv3GzrmFWcF+Da+PJTB6mHedh3CoVJEpbySTeC8BwACUW6pwWFb35SAIAAffI8cYIUzIuopVG7LGceT3eHIbjC4csrfjX2B/h+eBCgib8fkz1r2FY6TEKMtsX1HHvCB/E1QwDYuGuR4efEEct+0NJWNokjXPitVhj581F8bC2rmdiFVhMrQeJ1rlKczfK0Ps2UUlsnbunnEEENZBQXBNhz2a4ZH+ZD6chA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0cUIGCFi3V2uwLIDTDqSvyQY48hPqs3BXU0RnE8MXk=;
 b=dhD03kQ1rg8DnQ4PfFbAd39LE02i7gW+3ut2EvuXZzLvdsNX5CFVNtAJmhhohcMe112HUgoACexLcTsRPnDWDtNzhKuEc7DEmyVckHfTFaOYu5KyHUZUMlM4T0TFE+wJ9Ew0YvOodc+3qO0R0uNpjzJSCVik4SKcnfmENto/MdO7JWtVDPEysq02GKx2OgsqE8tcZm3am0a8Zo8KDClnrQ28xojjVR7Nih0gO9ZoXxObz2bIK7bqoP+0LPeV4mho7SWOM9y+E6JcsPfcSypwl5WsB7BHwJlbiLC5Nljy2msO+AYqWuDwx/Hmguw3jaEF8q8fvVtJTPV4BdvQnn66SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0cUIGCFi3V2uwLIDTDqSvyQY48hPqs3BXU0RnE8MXk=;
 b=mfsIMTWL9y7e4n0jobmmzoF5258pmdxtImWFlESlOQ4hLK243KbYnGaoWGpARP1gAj76zZCNOK5xquGN9y9OFbnMLVFvkXgdzJp4wVOaeVhBDNhoI/pXHa0mBk/z2a8kNXO3z6nYFF66IqEqSxmb2x0DKCPrlArJ/mxbIF2UaQ4=
Received: from LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b5::14)
 by LO4P265MB6602.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 06:23:35 +0000
Received: from LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6b99:94f7:a14f:a722]) by LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6b99:94f7:a14f:a722%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 06:23:35 +0000
From: Brajesh Gupta <Brajesh.Gupta@imgtec.com>
To: Alessio Belle <Alessio.Belle@imgtec.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Luigi
 Santivetti <Luigi.Santivetti@imgtec.com>
Subject: Re: [PATCH i-g-t v2 2/2] drm_uapi/imagination: Sync with drm-next
Thread-Topic: [PATCH i-g-t v2 2/2] drm_uapi/imagination: Sync with drm-next
Thread-Index: AQHdcZ38VDJjbC8l2EyCKkVMg3Sz6LcpIaoAgADXyIA=
Date: Thu, 12 Nov 2026 06:23:35 +0000
Message-ID: <ff1e6ea03523cf51c26e34fa0fdecccdedf0edb3.camel@imgtec.com>
References: <20261111-b4-fw_info-v2-0-4d771dde5775@imgtec.com>
 <20261111-b4-fw_info-v2-2-4d771dde5775@imgtec.com>
 <a35c6c309dcfae78680d38ba03803fbd8d89150e.camel@imgtec.com>
In-Reply-To: <a35c6c309dcfae78680d38ba03803fbd8d89150e.camel@imgtec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=imgtec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LOCP265MB8661:EE_|LO4P265MB6602:EE_
x-ms-office365-filtering-correlation-id: 1b41cea3-7f7b-4cc0-122e-08df40857b4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10070799003|18002099003|22082099003|261009223027099003|56012099006|10067099003|4143699003|261102123227099003|261022115727099003|261022105027099003|261028144727099003|261026140227099003|261021121427099003|38070700021;
x-microsoft-antispam-message-info: tf7rmP+hpV3qlXALPcC7PXy42dofW5e+6tKJGzwI+y4gYekC1Hwp5B7mpL+5yHhCDAAjm8jFXxmEdFJw67kREUHW3SVEqyqoHnnm74JxP1+KELlEu5VdPbJb99F7sR26gqpEaniLEHfaw3H14AAEaXjIJf3+rAl0D0BF3fJJ4a32jYQMTk16WhE3fe8iySBwT2nx+CI0S07e3gG53Omv6jcy8BBsNwIvTLi+4A4ro1tIQg+HORydSMEgGwnVuhKSkZipXNCsH5gp2dbZWz1RB5ptMpw967elMxKTu4+iz49WRnlvPN7ic1UmG4fShNe0eQc/XOwaH8kzaderrsph3t5b4cdpbV+Rv9QtyDhc62E1yvd115fxCzGW0HE2P3puRsXcPcxu8q8arxFcQkstqK0DeP1Lb8inZSZwzOjgcLoVHeeH8xUxDDUqWZ91whc2t5epcN+ycEyOPJK/goTfTkMpXyaXvZH58ZXy3lEVb2EnMCp+cWod2vuIDopR+i3fBFADIY0jZ+665zacjg/esDXmIO79D/GHOisXSLMA4NBU19bgIMDrXiustGFP9/gvAznupx8pZ2dul9kf3E41kVkheidlDx0i5Bpw1xEJCmekjdj6Nd6AN6uR2YeFXYa3VjYvyffwB4Y7LfxjZ53STtLll0xr3Psk7zJBRDOlL11LzfrkSWMeoLqde6GiBAmRHV2Io0d3xtg5xcZvtR/heEpvXk56lhZCYTJPBzT9XR0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10070799003)(18002099003)(22082099003)(261009223027099003)(56012099006)(10067099003)(4143699003)(261102123227099003)(261022115727099003)(261022105027099003)(261028144727099003)(261026140227099003)(261021121427099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnE2bFpFRkJ5MXdOam81SDl2U3RWQnRCWEovaTdWOFVhQ0c5OXcyU0dhYUpW?=
 =?utf-8?B?bUpiNEF0SEVSeWxJeWtjK25kZk5uK0pRbWZpZ3QrSUxxWThXZW5FekdhRkc2?=
 =?utf-8?B?QlVRVFFOUTh0aHFKMnIxUU9Jem40RTkza3VIZjV5QjNxN0hpWk5jUkNIZjlG?=
 =?utf-8?B?MUZMbmZtMFVSc095MnJrcHVkT2JwcjUwOFVUS3JReDVZa25IcVRIc2NITmd0?=
 =?utf-8?B?c2h0Q0phU2t1UktaTnUxYU9zNXh1NjFDUHVqNnNPbzB6UVVlbGh3WnJMMSt4?=
 =?utf-8?B?QmI5eFlmTDg5ZkI3bzVFalJJbFhPdjh3dUg4QmJwVEJMak1BS1V3SWNpUVBZ?=
 =?utf-8?B?OWdYaHduVHdnOFd0elF4VUZnN1RDSUY1TlBZeHJRWFZwNmdEVEo2eTBGUzJL?=
 =?utf-8?B?cS9ZOGdiaUNtem5mZTI4WUhNRitZYnlCb0tWaFBKRFdxcU5lUkJORWFGKzU2?=
 =?utf-8?B?Y0U3NThWNDkxQnJvL0FJOWNuUVQyNkJKV090SUsydG44RDB2SVYzQ3owUkZZ?=
 =?utf-8?B?N0c3NnRTQ1NZcUI4NGltQ0pvTFFYakJUaitVU0tkOXBab0JaWitTVzBNd1hL?=
 =?utf-8?B?ZTl3L2FXMk1pSXIzcy94MDlxUTRaUldrUVlTbktMeFBDRUNWamx1R00vV0tK?=
 =?utf-8?B?NDQwVGZqeVAzKzJ3bzI2dVZoTjY1KzVDQ0NxRmt3bmVPMEYrcFJSaVZjVThj?=
 =?utf-8?B?Y0RaMjVjZVl2RElHc0c5R2dwQmJObWFvR2FLanh1U2JXeGZpU3RHVWVJOERO?=
 =?utf-8?B?Q3F4NGJLVSs1bEMxd255QnVTbVV4RkU4cTlHVjdLTjc4T2pXTjdYYkl2MzND?=
 =?utf-8?B?NVpBLzVYRk5XU2xvM2lEVGFpUzYyZEdEeVRZVTZrVUwxZjd2RFhiejVxaElY?=
 =?utf-8?B?MldJaE82eE56WmxQWmFRcFVBbUhoYnQ1elpMSU4vSTFGVG8xdkh4ZjdSbXRX?=
 =?utf-8?B?SEpMeWd6aVdYcmtRMXgrcDNHM0g4ZDVqOEt6MDZIdFN5emtCdUM4Ykl5NzE5?=
 =?utf-8?B?SXY2VUwxdHcxM3RGWGZKSlF3U2U3RnB1QSt3eHAzTm5DY0Njd20vQkNiWFU4?=
 =?utf-8?B?OGdtb0NHbVg4MXlZb0c5NmRNejZKUFVhQS9qKzJFU3JRNVp6UUkzVFlEY1VX?=
 =?utf-8?B?WTRMcnluNDFGVE5FemxITGs1bmw0Umg3SFlSV0JTQW1MRVkrSnZWTXdGOWFQ?=
 =?utf-8?B?enNaclQzdEVLSzByVlZmU2pBTElOVitxRDd0R0xmLy8xQ0NsdlN1MGZoWEdF?=
 =?utf-8?B?WWY1ajVVaXhid0plU3FQYXN3NE9GblVqcGY1UTVPU1pyWG04MlA5T2VnMHEy?=
 =?utf-8?B?YkJDd1R3OHJPV0htZWUxV2JEc2hJbkZ0YnpDV2gxempQNWJjSktxSXpXSXgv?=
 =?utf-8?B?dWtMMjVrK3NReVB4NkY4V0FDb0NmYzZqSVZ6ZHRrT1ozdTN1d0JhdHRWK0ZW?=
 =?utf-8?B?YWJ4bmgwRFd5VTE4dTBOc3hyeUE4cFhHOVFsRFhQUm5Hdzk4ZUpYdmVvS1BU?=
 =?utf-8?B?QnN2TWN3T2lkejhJckcvKzFXSUgvMzVlTVdhaTFCTmloeUU3ZUNsMEQ5TEZZ?=
 =?utf-8?B?SU55WkxZUjBLTTZKUFVuQWtFNVdBUS9XQU9SUlE3Y2JSd3B1OEZaVGNQY29N?=
 =?utf-8?B?UEpKQlA3eUNHaWJQeld3MlhNUHM4SWhBNnpnbFNlSHljZnNQdWJqZnA3ZlhM?=
 =?utf-8?B?UklyYndMeVhOeHVjSU5nQ3VxY3FnVG9JMDZUbVo1WHd1WE1wMGNTRjVqN3NS?=
 =?utf-8?B?dWxCdk1YcVduY2ZRUWZ3NG9pdEVoV0gwVlVVZXdxS3FNbnQ2dU1ET0FUMjNa?=
 =?utf-8?B?ZUhQSzBicHR6b2U1VVoza3Q4RThLc3BCTGNwcVMzMlJiM3pXSnRTYXdoNElW?=
 =?utf-8?B?a3pvcnBVbFFGT3J6b2RrZVdwK0RyVFZpcFRnMkphTk5SWEVyc1JOYVU1ekVC?=
 =?utf-8?B?ckVXRlVTSElVWlVwOWNVN0pnTGU3YlJrTG5VbE5COTh5UG4rU3RqUFQrTk1Q?=
 =?utf-8?B?VHpaWUpjSEltTXFZTXN6WDNpNWtzUStVUHY3Wk5IY3MrK2lQN2dOT3RBV3h2?=
 =?utf-8?B?dC93eVBVVE1BZmtTVHQvbUlsYXFuNnVVTVZlSFYrUk5FQU9FK1F0QkFCMnlU?=
 =?utf-8?B?bjFYYzVUYzVveWg4RHpYR2tubEpaVDE1QXJyU0syWXhrcVdrbHRYWEg1VzR6?=
 =?utf-8?B?SnM0M3BCYUxpa3dlNWdoR3QyOUxoOGI5dWMyck1taXlmdUo2MFZkYlFNUW1s?=
 =?utf-8?B?WUlrMXJHM3psSUVrU1hYQ2t4NzZKdktuRmxxYUQyOGs1anRVSURONnNqZUpo?=
 =?utf-8?B?VEFMLzQxeCtzT2ZMY0JUOFZZd1kzd3FPQ0Nwa3pPYnROYUF6YUdxalpEZjVj?=
 =?utf-8?Q?wcEfdlrzwyqWbqAfCjPI1KdSgX91aH5Xj1AF8qidJmydH?=
x-ms-exchange-antispam-messagedata-1: DnSTpwEF33Ee52gElI5SfpYXdeTDFVSJD5M=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96CC17059BE9C34C8C9ACAF2B43F1411@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aR6nSqW10wPRLnRiV1Lm6J3XlCpHZPwQsVxG053wFoXkJFRQ8QhXZW+Le8OyPpxfLRKfipUPHVYbwhQ0b10tUTM/kj14wCiNuHVDekVzwgpYM0HFlO3asWuALRpFWZPEIUT+d+UISkFJkgCXtAM2JKa+GQljV9yz2irYxtkih3CNPvwzt1arpF7rmKbi2aJLoP//INkWJ8zD4+waApLijUwcT7a1H0uEsqJ5DI3oDiNF87mfFN0fQC7Wp7mYndmly9qnd+ppKDw6e836HUzYdndefem1A2pAnn202ZWRfB6C6OjCDnsDH1BnRQJr037uGIWvWW3VRveE6eS7BDWQzg==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b41cea3-7f7b-4cc0-122e-08df40857b4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 06:23:35.3345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AKlJKVu6gswvldB6TQNKFLCSpfVxN3GwpdMjg75wiwCaQ6RQ99CYD6gd4SxXK6NUL9FvMyrRp3nHO8HCnw75YNTchykOWmylm20On+yq3V4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6602
X-Authority-Analysis: v=2.4 cv=W9+txhWk c=1 sm=1 tr=0 ts=6af55b6a cx=c_pps
 a=QflrNnDcDr/p/Beeh5J+/g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22 a=r_1tXGB3AAAA:8
 a=OEO58_Ub4MiHRgeyhnsA:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: d475J-Pu3patldKNQ_rxjY66kzcxOVDG
X-Proofpoint-ORIG-GUID: d475J-Pu3patldKNQ_rxjY66kzcxOVDG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyNSBTYWx0ZWRfX/niyPV6FMW2D
 DcMEGiHzYoTCSc/mEHWWIBzdLOpl3pC9CrVW9NLOrr+DWl/IodweL3dm7YsET3kANBys0YGT/bd
 t+wT2bR+zcfO9lzF2K+SVfHSthGFHe0CP2RQ2PQd0pnLkmglSvadPdBw2qeZY/jZj9Ls6fMpNBb
 M1+P1zpWXbOejj52zwF05YRE1TbnRxUbBoYKOg5Lbn1dFnDcYIl9tsjt8D1cUwQabUKcu/T7o2A
 xp8bIFIO8dm1+RJ0wSHvYDqYL2/xN5+vVUNs40L2BvCPE6MNhdRZCeFKgIMvDZyzNChHEbUoXQV
 o/uXPxkToQRHIvrlj5afmA2XwgyMoPxI7dTsGsK3uHLhw60lN3hTRRALVp+zALG0WyIVRtkqTWv
 5nBTlVQAi9Fa5zw/TzdUaOAC5YyZbd635HCQ3QPBYwZqSx+ISo4HV1BRvxUdMoV1ai15XS45JxH
 3cobfXVxnnTagSc6I3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyNSBTYWx0ZWRfX2fzjfIDJMcPg
 Nqt/Dqk0RMXafc4fI4NceR2JJSi7oKH7I5cjspOUldQZvYgPQ2+BeBW8aF9cTU95skCbThuSH/U
 gfiJtrutqmJhs7LFnKCdhdyNAdPItbA=
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAyMDI2LTExLTExIGF0IDE3OjMxICswMDAwLCBBbGVzc2lvIEJlbGxlIHdyb3RlOg0K
SGkgQWxlc3NpbywNCj4gKioqIE5PVEU6IFRoaXMgaXMgYW4gaW50ZXJuYWwgZW1haWwgZnJvbSBJ
bWFnaW5hdGlvbiBUZWNobm9sb2dpZXMgKioqDQo+IA0KPiANCj4gDQo+IA0KPiBIaSBCcmFqZXNo
LA0KPiANCj4gT24gV2VkLCAyMDI2LTExLTExIGF0IDExOjAxICswNTMwLCBCcmFqZXNoIEd1cHRh
IHdyb3RlOg0KPiA+IFN5bmMgaW1hZ2luYXRpb24gZHJtLXVhcGkgaGVhZGVyIHdpdGgNCj4gPiBk
cm0tbmV4dCBjb21taXQgKCJkZTMwNzQwZGNjZDg4MmI4MTc3ZjI2MGU3ZDhlMjZhZDYwZjdjNjc3
IikNCj4gDQo+IFRoaXMgY291bGQvc2hvdWxkIHVzZSB0aGUgZm9ybWF0OiBjb21taXQgZGUzMDc0
MGRjY2Q4ICgiZHJtL2ltYWdpbmF0aW9uOiBTdXBwb3J0DQo+IGZvciBxdWVyeWluZyBGaXJtd2Fy
ZSBpbmZvcm1hdGlvbiIpLiBBbHNvIG5pdCwgcGVyaW9kIGF0IHRoZSBlbmQuDQo+IA0KSSBzYXcg
YXQgbGVhc3Qgb25lIGNvbW1pdCB1c2luZyB0aGlzIHN0eWxlIGluIElHVCByZXBvIHNvIHVzZWQg
dGhlIHNhbWUuIFdpbGwNCnVwZGF0ZSBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uIGFzIHN1Z2dlc3Rl
ZC4NCg0KPiBUaGlzIGNvbW1pdCBuZWVkcyB0byBjb21lIGZpcnN0IGluIHRoZSBzZXJpZXMsIGFz
IGEgcHJlcmVxdWlzaXRlIGZvciB0aGUgb3RoZXINCj4gb25lLg0KPiANCldpbGwgZml4IGl0IGlu
IG5leHQgdmVyc2lvbi4NCg0KVGhhbmtzLA0KQnJhamVzaA0KPiBUaGFua3MsDQo+IEFsZXNzaW8N
Cj4gDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQnJhamVzaCBHdXB0YSA8YnJhamVzaC5ndXB0
YUBpbWd0ZWMuY29tPg0KPiA+IC0tLQ0KPiA+ICBpbmNsdWRlL2RybS11YXBpL3B2cl9kcm0uaCB8
IDIxICsrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0
aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS11YXBpL3B2cl9kcm0u
aCBiL2luY2x1ZGUvZHJtLXVhcGkvcHZyX2RybS5oDQo+ID4gaW5kZXggY2NmNmMyMTEyLi4xMTc5
YzFlN2QgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0tdWFwaS9wdnJfZHJtLmgNCj4gPiAr
KysgYi9pbmNsdWRlL2RybS11YXBpL3B2cl9kcm0uaA0KPiA+IEBAIC00MzQsNiArNDM0LDIxIEBA
IHN0cnVjdCBkcm1fcHZyX2Rldl9xdWVyeV9zdGF0aWNfZGF0YV9hcmVhcyB7DQo+ID4gICAgICAg
c3RydWN0IGRybV9wdnJfb2JqX2FycmF5IHN0YXRpY19kYXRhX2FyZWFzOw0KPiA+ICB9Ow0KPiA+
IA0KPiA+ICsvKioNCj4gPiArICogc3RydWN0IGRybV9wdnJfZGV2X3F1ZXJ5X2Z3X2luZm8gLSBD
b250YWluZXIgdXNlZCB0byBmZXRjaCBpbmZvcm1hdGlvbg0KPiA+ICsgKiBhYm91dCB0aGUgR1BV
IEZpcm13YXJlIGxpa2UgaXRzIHZlcnNpb24uDQo+ID4gKyAqLw0KPiA+ICtzdHJ1Y3QgZHJtX3B2
cl9kZXZfcXVlcnlfZndfaW5mbyB7DQo+ID4gKyAgICAgLyoqIEBtYWpvcl92ZXJzaW9uOiBNYWpv
ciB2ZXJzaW9uIG9mIHRoZSBGaXJtd2FyZS4gKi8NCj4gPiArICAgICBfX3UxNiBtYWpvcl92ZXJz
aW9uOw0KPiA+ICsNCj4gPiArICAgICAvKiogQG1pbm9yX3ZlcnNpb246IE1pbm9yIHZlcnNpb24g
b2YgdGhlIEZpcm13YXJlLiAqLw0KPiA+ICsgICAgIF9fdTE2IG1pbm9yX3ZlcnNpb247DQo+ID4g
Kw0KPiA+ICsgICAgIC8qKiBAX3BhZGRpbmdfNDogUmVzZXJ2ZWQuIFRoaXMgZmllbGQgbXVzdCBi
ZSB6ZXJvZWQuICovDQo+ID4gKyAgICAgX191MzIgX3BhZGRpbmdfNDsNCj4gPiArfTsNCj4gPiAr
DQo+ID4gIC8qKg0KPiA+ICAgKiBlbnVtIGRybV9wdnJfZGV2X3F1ZXJ5IC0gRm9yIHVzZSB3aXRo
ICZkcm1fcHZyX2lvY3RsX2Rldl9xdWVyeV9hcmdzLnR5cGUgdG8NCj4gPiAgICogaW5kaWNhdGUg
dGhlIHR5cGUgb2YgdGhlIHJlY2VpdmluZyBjb250YWluZXIuDQo+ID4gQEAgLTQ3Niw2ICs0OTEs
MTIgQEAgZW51bSBkcm1fcHZyX2Rldl9xdWVyeSB7DQo+ID4gICAgICAgICogYSBwb2ludGVyIHRv
ICZzdHJ1Y3QgZHJtX3B2cl9kZXZfcXVlcnlfc3RhdGljX2RhdGFfYXJlYXMuDQo+ID4gICAgICAg
ICovDQo+ID4gICAgICAgRFJNX1BWUl9ERVZfUVVFUllfU1RBVElDX0RBVEFfQVJFQVNfR0VULA0K
PiA+ICsNCj4gPiArICAgICAvKioNCj4gPiArICAgICAgKiBARFJNX1BWUl9ERVZfUVVFUllfRldf
SU5GT19HRVQ6IFRoZSBkZXYgcXVlcnkgYXJncyBjb250YWluDQo+ID4gKyAgICAgICogYSBwb2lu
dGVyIHRvICZzdHJ1Y3QgZHJtX3B2cl9kZXZfcXVlcnlfZndfaW5mby4NCj4gPiArICAgICAgKi8N
Cj4gPiArICAgICBEUk1fUFZSX0RFVl9RVUVSWV9GV19JTkZPX0dFVCwNCj4gPiAgfTsNCj4gPiAN
Cj4gPiAgLyoqDQo+ID4gDQo+IA0KDQo=
