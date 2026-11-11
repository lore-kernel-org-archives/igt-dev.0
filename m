Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ECB606A33E
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 17:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=Np494qsa;
	dkim=pass (1024-bit key, unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-IMGTecCRM-onmicrosoft-com header.b=Nq+iqJFF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753F110E456;
	Wed, 11 Nov 2026 17:32:27 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB8410FC4C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 17:31:19 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6ABDdw6u3764926
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 17:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=ZJzActY9pxNvF6WWIHsl5d4lDvxdjGpGm1lh/eff2YI=; b=Np4
 94qsabI31nyiM+WYtHVaRvpwttUlFePdly2gAkcabYf+5IQPPrpgAyG09G8ODsfi
 RKo9mF2qMMC2wKew6TtmknA45iSP+5vqi5NaO2ulYDZdgJIGodHpl+9sRZHa4kN6
 F3CkAhBWO7Nf+aNsmFl+qWEaaMsCiXCn6tMKxXgeeWnCKEzkUd/T3Y5x+OyEH8tH
 4Q9pUxkSRXXvCZJtZQDNsw+l22FFVpuJOrP6yv05TTRMBVbKYchN7LWjlDaPMfAz
 u/151Y5AX+NDO+7LkPzciXW+a5s6Q2XBcbeTW6E19Nk50Rvqtq+iUyO3yRmp0yzD
 v5tV8AtYXMMfv5142ow==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020075.outbound.protection.outlook.com [52.101.196.75])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hsvxx3g0m-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT
 key_exchange=secp256r1)
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 17:31:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gviysIXrCwj4QvwgW0RHGrsxMXC5Ebx6elrWY1ZGLLaQIqjX3fJ4BnkL8+IjjD1ArtlJK75NeSfjH5RQmsMlJ05sufWN27A/JASQ0nTIzinHleknsU8CudBX9BBlpl9dZXtX9IY4f6LgsCosG6oYfD0QHsduhiwjqt0AOWMQqM72PUqQOcgjZo6kE0FD4j/4SG0lhP55/6vI5E4eIs0ZsQV9z3QUztLTl6+EG4YevIg85+Kq6A1udZDnZ2zE0sz/lTX9LVXxsytG3Yta65uybA0w78OeFkqTWYJ+Ky0ctlNnwSuL6JijbeFtIaWZHaqDUjmpw+kPbOUo1DXjJWLwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJzActY9pxNvF6WWIHsl5d4lDvxdjGpGm1lh/eff2YI=;
 b=VGMbVzhYCJT6j9+esTgTq9FuMNZqcsll55U2Z15UxO9EWQfBij8waoKLfI+YhGiMeib3rDhR9hIYLag5P3dcEHHUdyRgvQVujFw3XXuWibLukJ4VLo1Jp/dFVMQWj4GRrfqcqvb5sCew1kN9UajnM5naVqrXgL+SyZkZXswZMuds6Q4vkzxg8hjvL3nBqhusWdDSlqB1y08zFQWnnooCIy/KhJgEHaA2GovxURvd57uU2n6UqeO3KqI57HGqce/RSw5IYTMczxRx1u7zHd1gKcGwTfBvvVAzHshaCO1H3h6DYoVJtmCfztDe48jhcFrc9hPOIAfObv413jRjpDM73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJzActY9pxNvF6WWIHsl5d4lDvxdjGpGm1lh/eff2YI=;
 b=Nq+iqJFF2gYVjNY/Q4WeuJi7R+4/CUSwCF7lGTh4uxPm7LLqY84N/0PlDvRTFirRc5/IGZhVyETsCXOKzDcyN14Bmc7QJzJX0+MRYaZ0jihE6IcDKBoeUN5Sw6bj+sLHYG0pWFLYVHs6f1HRWUl/Y1VVjkvN/wKmuIb2dqZ8By4=
Received: from LO0P265MB7076.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ee::7)
 by LNXP265MB199063.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:353::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 17:31:15 +0000
Received: from LO0P265MB7076.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ee9:8c49:ba94:4237]) by LO0P265MB7076.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ee9:8c49:ba94:4237%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 17:31:14 +0000
From: Alessio Belle <Alessio.Belle@imgtec.com>
To: Brajesh Gupta <Brajesh.Gupta@imgtec.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Luigi
 Santivetti <Luigi.Santivetti@imgtec.com>
Subject: Re: [PATCH i-g-t v2 2/2] drm_uapi/imagination: Sync with drm-next
Thread-Topic: [PATCH i-g-t v2 2/2] drm_uapi/imagination: Sync with drm-next
Thread-Index: AQHdcZ38eU8sQpvkm0i7M3DZn42Gs7cpIaoA
Date: Wed, 11 Nov 2026 17:31:14 +0000
Message-ID: <a35c6c309dcfae78680d38ba03803fbd8d89150e.camel@imgtec.com>
References: <20261111-b4-fw_info-v2-0-4d771dde5775@imgtec.com>
 <20261111-b4-fw_info-v2-2-4d771dde5775@imgtec.com>
In-Reply-To: <20261111-b4-fw_info-v2-2-4d771dde5775@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=imgtec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB7076:EE_|LNXP265MB199063:EE_
x-ms-office365-filtering-correlation-id: 1494b74d-872e-4780-78a8-08df40199637
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|4143699003|261026140227099003|261102123227099003|261022105027099003|56012099006|261021121427099003|261022115727099003|261009223027099003|10067099003|38070700021|261028144727099003;
x-microsoft-antispam-message-info: Ibf3KD7lAdsaTayjew8zmcsR/j/H/V5A4q6Be3A30L6jG8WN33cZZkfXHLT3T1aM9crPwAqrRTkTIc2iu5zSm8JRgYSB283okO8/mydNZeIyU7doUeIc2NL94aB1bVpCIkC5MtX0RhorB6dvMQvL5HsYRv3XPNanG7q+vKzNxfyKmaJK0QnYUkxu93PmhyqmkQ9Lyur2ExLSCw2vew5mjdFhUMCoYXYhHHYe15Aw+KrU0jpAF8vkUL20lwERNeH79Sfr0jNvwCoJuitsZ57F+hwvps507oWirOM4Eu4HbhvCSU4b+6BWH1fgvYjkOpCLjvK0tyVRDXwIeD57ZzxZohRlLqrW8ELjMucpQJaXiD2RchBRVhBqfz43uQV4AaQrhfBJlbZ9/nrLFATKs4Nm/XqPIsGpya/l2ZH+coASWyokZo+SK2wIX8eckMz0TA+AopCChfVz44pkq5CTQFt8En0OSzDuS5Bf1ChReNv2REA9TxEIr161mMDOj8b3uWL6T/lLb0SSjXmGdD1lAaCI7NI0KDfK9Z55u5zzEDnuEO/ijzkyZAq4hwCak3/tc6qriIt84lrQcb8ILdfMDr12qvEUw2YRB6cJlV0LfN7RzifzAqiaFPSmsxZUNezPpffEbL+eBieGXVB2t1034lXiUDsX28jJuJGll7G/A9L/ed2tK5FcLqSwHUbWNeTJjw7GCFi1NE+JMoW4n7ZyFfxFATC4fes1CQ1/ZD0hCNHd9mU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB7076.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(261026140227099003)(261102123227099003)(261022105027099003)(56012099006)(261021121427099003)(261022115727099003)(261009223027099003)(10067099003)(38070700021)(261028144727099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0w5WlV1ZFgzbTh0MURUd01oVkVLYXZLakNnK21jR3Z3OEFmUENiS3YzSHZ5?=
 =?utf-8?B?dFU3QWZpY0Y1UHF4MS83V3lkb1FPV3hVbVRCL2xscUZHM09hM0FKRTY4SVV0?=
 =?utf-8?B?M1F3dDFSYTJRMCthMHpoZzdTN3BJZmhaM1EwUG9JV1B4UUlKTndyZUVDalJQ?=
 =?utf-8?B?SDcrcW1UZk9jNjBrRjZRSktEdTFUMmg3QXlIVEI5enVRcHE0a05qL2E2UERI?=
 =?utf-8?B?M3NHRTNlR1d6bE5OclZPOU5hQlp1cml0R3laWSttZzI4VjViVXBJN3pvRk96?=
 =?utf-8?B?eGR2UjE0aXJ2ODFWQXE3RTZCdEU0QTUyakQ0a0UvWHNINk42S0tLKzJpUXFw?=
 =?utf-8?B?VXRoZVRyU0wxN3BESEQ3TjN3SGZBL3YwVUNmMUpERU5CZ3RxbktuSlVrbGh3?=
 =?utf-8?B?VGp0ZGlLZXNkeU4rdFE5Z3ZyQUhPNW1kS2hQY2liM0ZOZjhUVXJuNk1RQlh3?=
 =?utf-8?B?MEdOYloyaEw2ZmFOdGVuSnNGRWdnYmR6M0dTUlR0aEJ6NFI3Rm83NkRuTkly?=
 =?utf-8?B?WTZBYTN4REw2WVluVUVKNHdjcXNjNTJCMmtwa0ZrbjRBTUNscXhsNFIrYlpw?=
 =?utf-8?B?bVVNR0Z5eUxZSEVCTVN2UzBJMWVnWktKMGZyMEFEYmdmZDNTU1ZlTFV6N1F3?=
 =?utf-8?B?U2xQUXpmNEhVa1FYMGFTandyY3U0VlcwVzhpVFB5Q3N3Mk9RSkFqanNmVWVT?=
 =?utf-8?B?TVRGVktMK3RuVnRYcVo1ajRRUitiTHdja0tuV3BwN2VDUXo5ZEJ4Z1pZOG92?=
 =?utf-8?B?NTgzVU94dDRqMHM5V0RnQnZEYXB0VEtiTnZ1a0hVRVhicXB3UjJ4anI1M2hv?=
 =?utf-8?B?QzIvTkE1aW80V2Y5M0Rrb1YyaVpRMmxtUlpDK1M3ZGcvajkxMXR4c0pFUlFy?=
 =?utf-8?B?WmdWNHRIWXUzVjVUb3NrSkk0aHRNWGVUQnFBSDNTS1pONHhmenFxMFlLa01J?=
 =?utf-8?B?MDM0Z1QwQy90cnV4dHRUTGw5Z3pIUzZzWmdxWVRSMFpJUmt3VWV1NitWQ3c0?=
 =?utf-8?B?eGxRSVZtdlNxNmRIc01TRlNVeThWbVlxVEVnaGJxaGd5UXZzUGZzZWxUSWF6?=
 =?utf-8?B?dk5qYTY3RWlSYkFVclo1cVRocVdCSkl4TmQyVHVzUDBnY1l6UThkbHJVYk5u?=
 =?utf-8?B?ek9rajFaUGVMRXN2QkdLOEd4QjVVTlhmRm1CWGV5S2QxWlFEaFJDRENGWlVS?=
 =?utf-8?B?MWs0SDJaQW0vcllMNWhXbDJObUlGZy9FUzQwNmM4NHkwS1JwSUE4NTloUjBD?=
 =?utf-8?B?dWpzaG04ZGlVMlZkNDNDRDlEN1lCYXRwOC9DUWw4LzlCc0pDbnk5SGJndDQ0?=
 =?utf-8?B?VHFiOVV2ckhOaXgvS2M1TFZLN3VmRVoxRnBpR1RBM1BwM09oMXRzaW0vb2Rm?=
 =?utf-8?B?OTVPZTZsYTNXSGllcXVDRjc3Vm1BS2JzWGkrZ3RrMGVmSTRJNFNBRlNXSmRw?=
 =?utf-8?B?aVpnYncwZUtRK3JIam80aTlkVnFUeHJWQ0o1aWdwMjk1ZVllNGVRUHJHMFBC?=
 =?utf-8?B?ODdSeXhtTG5RMFM3RGJ6WXlYbDFZM2dOZURyMERxQmZ4ZzA2UDdSRXlhTFBX?=
 =?utf-8?B?QnhyamJERWYyL2xrMDE0VFhLRytJcFNYbUhNUlRRUXh3K3ZLUTI5VWFwaEJa?=
 =?utf-8?B?bFFFRWpabmlWRXI4T1lIMytwWEJYbVVwb3JEbmFRRnZtalZ6c2hMditydS82?=
 =?utf-8?B?VTdBYzMzWExUK2s4MkQxUFUwYjh4WFBuMVFoYVBEaTdndU1iQ0JGNTBURXZo?=
 =?utf-8?B?UjVxRi9mN1M1RWRCMWFJNUduYjMwak1PQ3JhVjN0cXEvSGdwSGwycDNmNVFX?=
 =?utf-8?B?bHpBS3FlT2ZOYUx1bklhTVJNbTVpWnlWQTBiTWk1YTZoZmFwMkM3azJhb3Nt?=
 =?utf-8?B?L1RWV1VvZXF2bTlsNmlWbmk1SDFvaWZJRXV3QXllZW85THM2dVk3OWxkQjhZ?=
 =?utf-8?B?Zkp5NlBHUXllc3I3S2RRN3J5a0Fub1ZoMy9JUDNKRWZ6bXlJQ3l2a01UTkM0?=
 =?utf-8?B?UnJEYlFBejU4NUNIcWlibXJyekFqdlBNSlkwdjErbmY5elpRelB5UW1OaWNw?=
 =?utf-8?B?MXZTUmxBTXJXaElzZHNhY05OazJ3Uk5yNTY2UXRtZk5EdCtIaUkwYTJpeHlN?=
 =?utf-8?B?UzJiNGwwZXFYSDI4ZWl2NTkzMlREd2puLzRITS91ckFsZi9LQ3RmUDdZT2ND?=
 =?utf-8?B?WVNwK2tyNmQzMzRRdS9oaGZSRWtVM2ZPRndOUG1MNE9tTzV1ellib2FTVkVx?=
 =?utf-8?B?RjZMUW42Qzh0dE5VZ1Blc05xeGhsUjVxT1FlK01yZ1lxZWtwRGNPV05TTEV3?=
 =?utf-8?B?aTJrcjduOTgzL0V5QnkzdXNVa1FkUG1sSXdwb2pMc0tRTjFTcE9rRlVDZmpX?=
 =?utf-8?Q?8Zz84rHBF1MeMlz0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C884D30515A75548957D337EF02A394A@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MhpUdahIDgSk8GWPXwELX0yUK3wH/51vFd28ojZmxWiDvV4D0F4VluNS7Uijj/vDGHKtONA/ZzkFYC6nMNRWqP/iaUq9AyJqXCoAuLxXUqIY/DUSEZuys6EQf2nTA7GDDkC/z4/aIc+rtVdpGhMCvuBg6vU83IfZi1gHlauZaP8TOMRJO/Vq1C8SmKupxAelGh7hnZEFCf0Azly0Hmscg5VKkI8iPh2ty3gkmPK/ccxMMuadKCC2UrZdwkH6aAsVJLjBrEhWZKtBJCoaC3fTAZlsQ7sq8ZkmwIel5Aw1Xsm9gak75ONR3lBkJYlShvpXgE7lEK90hC2fcYpPBi7Awg==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB7076.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1494b74d-872e-4780-78a8-08df40199637
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 17:31:14.8196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0FcMjDPSUau1h149GZvvn6S7QhOhL5UgGo5PwdLr+bSepZaJ/f1UzhWWAZY4wYafWN7vmAQEU7LSuXsHTX0GDyjCOayxE4po2d/eFfZV6us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB199063
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfX/KyAbRzsGhWt
 KwUz2m6k+4ylDLpOoEInwMn2nVkwBcrWzl6DWNpWMPSC9pryA1bUf9RwUeumM1WDpK6Ls75SF8/
 At+EsV8OBeAKv3HTtl+Pl2w/dfS9ptw=
X-Proofpoint-ORIG-GUID: DF8yGpG9fYM8Dax9S1LDIYX4Gq04vRdP
X-Authority-Analysis: v=2.4 cv=H+JOUOYi c=1 sm=1 tr=0 ts=6af4a665 cx=c_pps
 a=vmQjI8VvDBZ713WXavw2+A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22 a=r_1tXGB3AAAA:8
 a=Owaha31PLAKAO9AjCKgA:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfX71VmKC/iKnQC
 tacUTcGKL+lx6ITOFmyF/S+vCaTba1DHv+Rk2EDs105qGy7PWVCqQt+3Lmz8xj2T3aM95kSvFJk
 sLlYfLpqILzv8Ctmp/2ILYN9fskEHGKyWFGNaZuhEWwJh279h3uj7wyHugaE20RCYgTNGLv72WH
 zPyo7+ytQAuv9baWf8fru38pOdrkzqT5B8KwNuj0fe2Por4iNjFqAbH5S4DLbBhkjUp2o8OCyuE
 78sSfZeIo6XidMj9GkD9XoL2aKOkAFZI/33pxvBQ1V9xXyj/Yr6xK8aGQtDDZ1IJKdj+IjEGA3T
 26w+0Eh5MZuQxA1dxRn+vrzKOV+9MXgsiaMF67LPdGwNgF55CYA5rOg4YhNAtwrG0RAstYaufNa
 M4tkGJB1joFAx0touvYUBlZW951JDReP3LthG3YuvGO/SnlbTjB8HzqO2JmD7isjOOp4JRzGUJd
 QNnJPbSZwkRn9MJLKyQ==
X-Proofpoint-GUID: DF8yGpG9fYM8Dax9S1LDIYX4Gq04vRdP
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

SGkgQnJhamVzaCwNCg0KT24gV2VkLCAyMDI2LTExLTExIGF0IDExOjAxICswNTMwLCBCcmFqZXNo
IEd1cHRhIHdyb3RlOg0KPiBTeW5jIGltYWdpbmF0aW9uIGRybS11YXBpIGhlYWRlciB3aXRoDQo+
IGRybS1uZXh0IGNvbW1pdCAoImRlMzA3NDBkY2NkODgyYjgxNzdmMjYwZTdkOGUyNmFkNjBmN2M2
NzciKQ0KDQpUaGlzIGNvdWxkL3Nob3VsZCB1c2UgdGhlIGZvcm1hdDogY29tbWl0IGRlMzA3NDBk
Y2NkOCAoImRybS9pbWFnaW5hdGlvbjogU3VwcG9ydA0KZm9yIHF1ZXJ5aW5nIEZpcm13YXJlIGlu
Zm9ybWF0aW9uIikuIEFsc28gbml0LCBwZXJpb2QgYXQgdGhlIGVuZC4NCg0KVGhpcyBjb21taXQg
bmVlZHMgdG8gY29tZSBmaXJzdCBpbiB0aGUgc2VyaWVzLCBhcyBhIHByZXJlcXVpc2l0ZSBmb3Ig
dGhlIG90aGVyDQpvbmUuDQoNClRoYW5rcywNCkFsZXNzaW8NCg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQnJhamVzaCBHdXB0YSA8YnJhamVzaC5ndXB0YUBpbWd0ZWMuY29tPg0KPiAtLS0NCj4gIGlu
Y2x1ZGUvZHJtLXVhcGkvcHZyX2RybS5oIHwgMjEgKysrKysrKysrKysrKysrKysrKysrDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtLXVhcGkvcHZyX2RybS5oIGIvaW5jbHVkZS9kcm0tdWFwaS9wdnJfZHJtLmgNCj4gaW5k
ZXggY2NmNmMyMTEyLi4xMTc5YzFlN2QgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtLXVhcGkv
cHZyX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtLXVhcGkvcHZyX2RybS5oDQo+IEBAIC00MzQs
NiArNDM0LDIxIEBAIHN0cnVjdCBkcm1fcHZyX2Rldl9xdWVyeV9zdGF0aWNfZGF0YV9hcmVhcyB7
DQo+ICAJc3RydWN0IGRybV9wdnJfb2JqX2FycmF5IHN0YXRpY19kYXRhX2FyZWFzOw0KPiAgfTsN
Cj4gIA0KPiArLyoqDQo+ICsgKiBzdHJ1Y3QgZHJtX3B2cl9kZXZfcXVlcnlfZndfaW5mbyAtIENv
bnRhaW5lciB1c2VkIHRvIGZldGNoIGluZm9ybWF0aW9uDQo+ICsgKiBhYm91dCB0aGUgR1BVIEZp
cm13YXJlIGxpa2UgaXRzIHZlcnNpb24uDQo+ICsgKi8NCj4gK3N0cnVjdCBkcm1fcHZyX2Rldl9x
dWVyeV9md19pbmZvIHsNCj4gKwkvKiogQG1ham9yX3ZlcnNpb246IE1ham9yIHZlcnNpb24gb2Yg
dGhlIEZpcm13YXJlLiAqLw0KPiArCV9fdTE2IG1ham9yX3ZlcnNpb247DQo+ICsNCj4gKwkvKiog
QG1pbm9yX3ZlcnNpb246IE1pbm9yIHZlcnNpb24gb2YgdGhlIEZpcm13YXJlLiAqLw0KPiArCV9f
dTE2IG1pbm9yX3ZlcnNpb247DQo+ICsNCj4gKwkvKiogQF9wYWRkaW5nXzQ6IFJlc2VydmVkLiBU
aGlzIGZpZWxkIG11c3QgYmUgemVyb2VkLiAqLw0KPiArCV9fdTMyIF9wYWRkaW5nXzQ7DQo+ICt9
Ow0KPiArDQo+ICAvKioNCj4gICAqIGVudW0gZHJtX3B2cl9kZXZfcXVlcnkgLSBGb3IgdXNlIHdp
dGggJmRybV9wdnJfaW9jdGxfZGV2X3F1ZXJ5X2FyZ3MudHlwZSB0bw0KPiAgICogaW5kaWNhdGUg
dGhlIHR5cGUgb2YgdGhlIHJlY2VpdmluZyBjb250YWluZXIuDQo+IEBAIC00NzYsNiArNDkxLDEy
IEBAIGVudW0gZHJtX3B2cl9kZXZfcXVlcnkgew0KPiAgCSAqIGEgcG9pbnRlciB0byAmc3RydWN0
IGRybV9wdnJfZGV2X3F1ZXJ5X3N0YXRpY19kYXRhX2FyZWFzLg0KPiAgCSAqLw0KPiAgCURSTV9Q
VlJfREVWX1FVRVJZX1NUQVRJQ19EQVRBX0FSRUFTX0dFVCwNCj4gKw0KPiArCS8qKg0KPiArCSAq
IEBEUk1fUFZSX0RFVl9RVUVSWV9GV19JTkZPX0dFVDogVGhlIGRldiBxdWVyeSBhcmdzIGNvbnRh
aW4NCj4gKwkgKiBhIHBvaW50ZXIgdG8gJnN0cnVjdCBkcm1fcHZyX2Rldl9xdWVyeV9md19pbmZv
Lg0KPiArCSAqLw0KPiArCURSTV9QVlJfREVWX1FVRVJZX0ZXX0lORk9fR0VULA0KPiAgfTsNCj4g
IA0KPiAgLyoqDQo+IA0KDQo=
