Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E890F606A329
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 09:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=R3PVm+ji;
	dkim=pass (1024-bit key, unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-IMGTecCRM-onmicrosoft-com header.b=cAIgf3mo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D94110ED5F;
	Mon, 16 Nov 2026 09:44:39 +0000 (UTC)
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94A710ED5A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:43:32 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AG7XBII3597227
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=beKwSMAV6uM38XhLTWpDQW7hI4SiqY3hrs4W0/1X2rA=; b=R3P
 Vm+jiCTYLbXJSjjV0hG4O/ufm3D1W3sagIxPuuSOMnL4JfuQyORlVyvQ1UaawnSB
 Zcp1djtFo4sLHFM1QMXHoqohRrOkfls0VWjOEVbfzblnvvwc6UgL5N7dGiSneHSb
 qBdJjeyujDVFY53hvLZdXm9xKZZmu8IyO91s5Ys/QX972YzyP3M/MnvmEJ8r5cAp
 WrkwavubiLqgG3k/3MyAaacXchO0Ss0t9YIryW5o8Rk1rvWdKW3HEcvlxmfOH5To
 gF3sphcjUnqf+g51T8g6B1lBGFQiJrychgyowy3kAAwvBfwZLX+KqoyhNk8YpK4X
 UF0nDCxZ/TfLuOX/2Sg==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazon11022082.outbound.protection.outlook.com [52.101.96.82])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hxests96h-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT
 key_exchange=secp256r1)
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:43:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9KMI1ORYjTOEVAFgJ5zwOBNX4/PKBDoS19nTTVo4KM2Yi4IyhytyIlVoh8PMu+/FkDcB0TYL+u7N2Qk9qkYxg5NbPA9487qzNe8UY1iTxB5M+GiszZaqgyVTP3aqYbhORKzQdbYIkz43kgmE8h8nt7rrMSJceNAgm8TmwqJIOReoC5IbLQtJ5sHhmEG1QanIjmZ7jfdJ740NHrmAlPJrd+qZUZ0L/Pyo3FCumS/SK6XN0q9wV9cKEFxjrVpDF3OgbO8KLsMJlHVIlR711aqCJzvd6IPodcQXx5r9pjB4fmUf2n9TWhEYAdUAiHuQhJKCpK8roKNikv8ZzyWIbg6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beKwSMAV6uM38XhLTWpDQW7hI4SiqY3hrs4W0/1X2rA=;
 b=JXaW0+5gCUjUusTT0PSjZjP9Ot8BqugPSIffuxa3h8t0eHg3zn+U7belDuri0/d4B0J0YUgL/mLHTnzjhd0Saa6s+tnH7jdGGmurS+loUVYIFvJiem9cb+rxM5FCWyUJ+spbU15x2sQlaoInqt35P9jAGlY5IlHxyknqQ5vXxuYIhkUCr9UmoVKpMPpkWVTOBrwjyTmlyeObB8WE9joIMhWRAZX8BfA/j4BvrDEagNqd/09PQHhY5mEShuobZixk5qg0nRtUi+P6b8Ju1nMxG509dSf4iQzWHLkb0m+xCv7it5i18HtnFxHho11MoG6Wgc13dz+hqwnmC174eL6J3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beKwSMAV6uM38XhLTWpDQW7hI4SiqY3hrs4W0/1X2rA=;
 b=cAIgf3moeCaGlQH/KtYP3FfiGwmObzsNsR3R3oII7qq+CRhweycoI4co/I1rrn5nt2xqzDafF/7N7hbJSRWGm3Z4/LP1/kMT88dn043GmXG7FVnMC5EApKcxgzJuo+qPmZdlyWrPhGTJeCSl8ID5mOKzwbXA20BcZ9c+xEocslg=
Received: from LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b5::14)
 by LO4P265MB6123.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:27a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:43:26 +0000
Received: from LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6b99:94f7:a14f:a722]) by LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6b99:94f7:a14f:a722%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:43:26 +0000
From: Brajesh Gupta <Brajesh.Gupta@imgtec.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Luigi
 Santivetti <Luigi.Santivetti@imgtec.com>
CC: Alessio Belle <Alessio.Belle@imgtec.com>
Subject: Re: [PATCH i-g-t v3 3/3] lib/igt_pvr: Pass DRM_PVR_BO_PM_FW_PROTECT
 flag for PM MList allocation
Thread-Topic: [PATCH i-g-t v3 3/3] lib/igt_pvr: Pass DRM_PVR_BO_PM_FW_PROTECT
 flag for PM MList allocation
Thread-Index: AQHdcZngUD9WNuk4DUGH6RJLRRsdErcsF6AAgARjA4A=
Date: Mon, 16 Nov 2026 09:43:26 +0000
Message-ID: <8a66c53e84fab1ffb037815f060316ea18510a3d.camel@imgtec.com>
References: <20261111-b4-render_update-v3-0-979dcf01ff43@imgtec.com>
 <20261111-b4-render_update-v3-3-979dcf01ff43@imgtec.com>
 <90b2f69fea302fe0c698ac0eaabec03ddbaa37de.camel@imgtec.com>
In-Reply-To: <90b2f69fea302fe0c698ac0eaabec03ddbaa37de.camel@imgtec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=imgtec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LOCP265MB8661:EE_|LO4P265MB6123:EE_
x-ms-office365-filtering-correlation-id: 473ebb64-c90b-40eb-cacd-08df43c61060
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|4143699003|56012099006|261102123227099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261022115727099003|38070700021|10067099003;
x-microsoft-antispam-message-info: 3uSemLqpq8xhoN6kv/9UP8xuBzG+7h2nf6yfc4RaJH6pawhnKFuTbx4XZzvv4DCTgnDVIG1hEIyfol6khaeZdL1hPshsho7rwxMTbjhBgYSYswLE6Pk4eWywSDI4LGNUft1+emoTKO3xbrb/VL0Vn6c0NyoAxNmeKwGrv5pKuufHbqfyPvDI53dcY1SKLo5OI7d0GvdWqbEjsBjm61alkyzKcwh+sFwq05zvZEl/v1/mGNhTlD8ebHgi8uO5Gz/iybFXck4cL4cMnNr5r0B/+zbBU1HAPilRPnHR4woB0SfcyBO3KGy59s4Uu28ts2Hi+LcoNswtENboBAGWXWZfhuNUkAiD/WsMvTTnaThQR41n2riKDgL3t10Ll2i83o7KOijUmSswB/Nw6wWykQsxMpbu/BbwI78fxVjg6CF0+6kSOFOmkt97O553sZuOxMoy5Z6NVkG2nDkHAfAAxMmp6wlC1BTv8X/BaRU48XbMerJAqZUevKYUY3aBLgblYlyS92isFl1IMAnMEQuH1FdLtsGnYVTl4wluRISc9P2Gvkc+XnrEEV9XiXnnE84tNdlrV8g5EEOPxw1p8M6lxHbbMuucC8blACvhQdYpP6YtPjqZhFF/3nD4BYuddThXzGB8vuy52xhlrF0R33Tt3bJBlpAEgECidM4B56Mgo7R6mpqF/bAIaA0HDiCpJcIUyN6aLMDmytVnkmsNobFvhkMYVVMrAKfwvYZbzQAlt/yM2L0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(4143699003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022115727099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGNoaHRmV1lEczhKZ1V4Z2crYlZ6T1pxNVIxVjlvVW8xVkJwU0pDb2ptWkV5?=
 =?utf-8?B?YWIzaUtreGE2UHBEUmwyMlNMd3RKdldlMGFHTnVnQTFNZ1BDRHdPT01vQ1BV?=
 =?utf-8?B?ZUhQbUg5T2l5L0l4ZXh0OWJOanJCU1E4TWRnWEV2Q0c3THFkZ1dJWGUwenJL?=
 =?utf-8?B?elcxWnpoY2xyKzNmZVB4cHJERHh5bithUnljVm1XTzdTcC92Q1lRdXErWW4y?=
 =?utf-8?B?R3FTMkRjRlJ1R3ZHQlozRTU5VkNwY1hVbVdIZ3Y3UnJNd3ZrT3psUjFuaG9o?=
 =?utf-8?B?RU5sbU5kVWZoeE8yT0RtVERmMElBQkYwRE5mczAzRnN4SVQ0MUtLc0Roc0xH?=
 =?utf-8?B?Z2JzOEhjbmV2QzFNRFdMc0ZBNzNzZExoR204TCtNZUJTZjFmV0c3RUdIMTR3?=
 =?utf-8?B?bzVTZHl3L2w5dkxoQzNYMS82S1dSTnpoMUpoQVR3OWpnejlJTWFZNXJ0dFdE?=
 =?utf-8?B?UGJPL2owQWZjT1ZGS3pwY2JzRVJtZlAvaFp2TVN5a1dQaUs3MmgvT3M4SGVm?=
 =?utf-8?B?SjRBeThLWk84SUxHMFZWQ3JUdVhBVkd5VnNNYWxwQmluTmx6Y25uWVJPV25L?=
 =?utf-8?B?Z2QrUTNuUXNWdnRJKy9XY1c1cngySXlYM0RtYmQ2R1B0V01XbFdMZ0tYSXRu?=
 =?utf-8?B?VThWNFJobzVPYVdoT0NkcGRoU2VKNnR6Umw4eWZBY0p5aEJpNXk2bE1idkpQ?=
 =?utf-8?B?RHRNZGN3a0FEVXVGcXIwS0VJYjE1ZkJYWGJvbUl0WE9yQ2tFWnlJRDZlMXFB?=
 =?utf-8?B?QW8wWnoyVUhjWGNuZ3dIdHl2dEpzUDdXT2Y5T2txcTRidU9ib2Z2VDdyZXBv?=
 =?utf-8?B?L0lFSFc2WXh2QjY4blNjQnhKVkd4SkdsRkpBbzFwNytkcDVFTFNpUjlEUVp2?=
 =?utf-8?B?dEs5OUhQNUZzZk1nZU90VFYzK2FTbVY5MzNVeTg5TkdQTVhSYVVBdkI0WXZo?=
 =?utf-8?B?SlB1NHBYWVU4NkN2K3JqV0JyMHU4UkZYeXlTSnFxSlJSektmVUt0WkorUDJr?=
 =?utf-8?B?NW0yZmlEbmprVFpQTWoyNkEybzZGMFk2b3V0bDV0TzhuZkYyaW1ObHluSDcy?=
 =?utf-8?B?K2pxOVNQV1FnQlRYenJLd01oZFQwNWlRdXVnaC9yNGJkcnQ3SklYV0EzUWJt?=
 =?utf-8?B?a3RSZUNsWitVZUM0RHNyMjUzcDVLQTRJTU4wZVVTVmdkeVcwdWJCVlhITHJ2?=
 =?utf-8?B?UmJyaW8wU2N1VitRTjlWZFRac2dNYzNJbFNwVmExaVlMNGdUUmptM3pVTFRP?=
 =?utf-8?B?bVpiVkg4Ri9rRmJOenh1Z1ljNTh4enYvTFQ1ZHlWQlRYSXA1VWFhRVNzcVRj?=
 =?utf-8?B?amZVWVFsNHFncGNKdDdxam5QUXRXcmpicDRwNVAzK290bWVYcUVkdGtTSmFl?=
 =?utf-8?B?amhGUUY5UnNhVCtyMHlmWlZKMUpUaHUrYlVSaGY0SlFBRmpvSXZRY29RSTFu?=
 =?utf-8?B?VXNaeUd5ZGZDZXJMWitOZU9UYWt3My9ra3l4dmZ5dEpSQ1pabmFMNXZHZWVn?=
 =?utf-8?B?V1A3T09CczUveVkrU1hTeGZGZXZSS3B1Q2JOSGMrdGt3ejJROFpyVkZIZzVh?=
 =?utf-8?B?MUpoTEZMK2VaOW5DTUh4aXVMOCtLUHQ2QWp2ekJLamxuWHdTSTZuSFlCTVZE?=
 =?utf-8?B?a0NIYTdjRlhVR2FsTyttZmVHazA3NEZYV2tZdURQRWIrcktaendpYlYyVnlZ?=
 =?utf-8?B?VkhySm1WbGdmRTl6WmNSZXhvOTlBZEhzeEorS0c1czNJaUMrd0NPQXVrQzFC?=
 =?utf-8?B?OHo2bmFTK2dUMnBvMU5PbEVDcytvRjk5aGhHTGkzUzlHOHpZMXV0QnV1U1J1?=
 =?utf-8?B?VXQzR1M5Y2VUMnM5YnV0MXBCMDRMRGM0V1RvUXZtYUh3RHhWWVdaem1tUEN4?=
 =?utf-8?B?SzZSZzl2YkVKdE5FR1ZYc1RZb1NGTS9nNnZoNVZOc0ZsQmE4c1g2S1VvU2tS?=
 =?utf-8?B?YXRyTXVwNHZCSEhoanVkenoweDUwNXVKSnlWU2NiNk5OQkFqa3Y1cm1vcm9n?=
 =?utf-8?B?Z3VhSktsT0VzUDhXK2ZZc24yWEc5M2JJZ0VkNWFUQll2QngvaGxEYUZBWXdD?=
 =?utf-8?B?cHZ4Y28wZVZVOG9NOGxVSTRNOU0rbW0vZVJiYmZ2T0trM1lHODVZdHk4VlV0?=
 =?utf-8?B?eXpNb204aXN4ZGlFSHgyWGZ6SjFPNHdVS28yVSs1RXZoVTRWdXFJQ2VaRU9R?=
 =?utf-8?B?QmxFS2JPVW9iRWFlL2FscnFhajdaUlhUNlN4cDJuVHJnTGs4KzNpWjF2YWJx?=
 =?utf-8?B?eVU4RkJjRDdHaXlhd3dCNzZSb3ljNVRXWjNTMTBmU2dYUTFwaDd4UDI3Rk5i?=
 =?utf-8?B?MkJRMUNJWTBaNEl2UnorcHBoVVpWNFp1b1JKRTV1LytPZ2djcE9TNEo2V2VO?=
 =?utf-8?Q?/F4BpapaQPjC+wRo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCC064C8820A7F42832CDA9AB1E529C2@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: I8CunCwhOQ1DdnLOPkRxbBbpHpiLG7hh3L6JXIRFoEdYaYA3eLSItkH2kqboEeOwOoyyMFdkipbsjUj5WAIwOQ2H24w9y3xKULvhuMZgGni5Sk5tDGHclnj+vF4M7y2rx0HH7+TmIeAvuoj1rJ0iPqZWNHLTofr7oEUvLRV8xUndIQPqz8hmxmfBLGySeXuPQCjg1UcLG3RX0jhIVP+oG9m5aRUuH5L60Hbp7QaReujv71xJvmbakqkshkPV1ZyPDrGadyGhft0xnXSj+zj8eZUMQHrbu0eeLVVkB3wdyDvtfqyaJtnSDXn/AHvvvpdOQxiNW/xIGlxaaEFsQyG56w==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 473ebb64-c90b-40eb-cacd-08df43c61060
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 09:43:26.6273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 69uGgzkMr7K4cX+Uvi0HMiqBMRvEqjvGfXCx4zeDZ89QdYqK4Vwuv3bdzZiyCR+IWjzt7flDrX7lgdBzAvyjNHhqSpy1sNc3Vw+1/Yim4Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6123
X-Proofpoint-GUID: Simkl5SenuUVFKGwij8TdoEDB_aEwVaA
X-Proofpoint-ORIG-GUID: Simkl5SenuUVFKGwij8TdoEDB_aEwVaA
X-Authority-Analysis: v=2.4 cv=O8OsLx9W c=1 sm=1 tr=0 ts=6afad042 cx=c_pps
 a=6eHug5I58oh/VdKcXlksUA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22 a=r_1tXGB3AAAA:8
 a=lZuVaghL4Ml4_GvKc7IA:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzOCBTYWx0ZWRfX3LZaUbzsUGqG
 eGzBzPKtvIDq3YQ7RrJlQgWSPM7wv5nK6DkuWuCpl6+tO31lQmQepkD6/HzxIgo5Wfs4SZ7X8nj
 rw4PoMIgUOjt5HGnkasxCDvlkSXnGdKl6DHctqKYHz/TZkmkOq41x8QDw2SRNe5vYJqN0GMYnlR
 tOcpvGolr9v6AF8Li/2gMpG+URN2huWo39KSMhh2aP1gO5+l5FbN58L6R5wPYXbhFlecp1XS9Mq
 3b0VDHxq880Ltrunp6UW3Wgn+oEys0Bd/yz3tLEXqsHkiUgbac/02yIAtEMZl0+5AjAj4oH9hB/
 JH6pQL48LHzRvJz3rusdSQBiaovA5Rp/Lpjv3jmV7BR9LcDXoCt5aK//4NbrkbeCeUcvhxhrbWw
 yUVqAd5lgyQno4FaCkYl0AjPMaiy7EI+JOLhRQ7SgTGCXfbQGLvLNl0uFBfOrJZzsWnPLWnltOm
 7OfzqbiFnDOBsIT6pXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzOCBTYWx0ZWRfX7KUFdMQGXi3J
 N+KRn7zuna8JU7uJQOG6VrmIeXfRt/baldT5ieUMmHqoyctZTgpL51l6NpO52nKYMFEA5k/9ijW
 IYbVvVBip5FL0FTyhPDEDutoENmb+MA=
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

T24gRnJpLCAyMDI2LTExLTEzIGF0IDE0OjQzICswMDAwLCBMdWlnaSBTYW50aXZldHRpIHdyb3Rl
Og0KSGkgTHVpZ2ksDQo+ICoqKiBOT1RFOiBUaGlzIGlzIGFuIGludGVybmFsIGVtYWlsIGZyb20g
SW1hZ2luYXRpb24gVGVjaG5vbG9naWVzICoqKg0KPiANCj4gDQo+IA0KPiANCj4gSGkgQnJhamVz
aCwNCj4gDQo+IGRpZCB5b3UgbWVhbiB0byBkcm9wIHRoaXMgcGF0Y2ggaW4gdjM/DQo+IA0KTXkg
YmFkLiBXaWxsIGRyb3AgaXQgbmV4dCB2ZXJzaW9uLg0KDQpUaGFua3MsDQpCcmFqZXNoDQo+IE9u
IFdlZCwgMjAyNi0xMS0xMSBhdCAxMDozMiArMDUzMCwgQnJhamVzaCBHdXB0YSB3cm90ZToNCj4g
PiBQYXNzIERSTV9QVlJfQk9fUE1fRldfUFJPVEVDVCBmbGFnIGZvciBQTSBNTGlzdCBhbGxvY2F0
aW9uIHRvIGluZGljYXRlDQo+ID4gb25seSBQTS9GVyBhbGxvd2VkIHRvIGFjY2VzcyB0aGUgbWVt
b3J5Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEJyYWplc2ggR3VwdGEgPGJyYWplc2guZ3Vw
dGFAaW1ndGVjLmNvbT4NCj4gPiAtLS0NCj4gPiAgbGliL2lndF9wdnIuYyB8IDMgKystDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wdnIuYyBiL2xpYi9pZ3RfcHZyLmMNCj4gPiBpbmRleCA5
ZTg4YjJlNDEuLjM2ODQ2ZDdkNiAxMDA2NDQNCj4gPiAtLS0gYS9saWIvaWd0X3B2ci5jDQo+ID4g
KysrIGIvbGliL2lndF9wdnIuYw0KPiA+IEBAIC04NDIsNyArODQyLDggQEAgc3RhdGljIHZvaWQg
aWd0X3B2cl9jcmVhdGVfaHdydF9ydF9kYXRhX2FyZ3MoaW50IGZkLCB1aW50MzJfdCB2bV9jdHgs
DQo+ID4gIHsNCj4gPiAgICAgICBydF9kYXRhX2FyZ3MtPnBtX21saXN0X2Rldl9hZGRyID0NCj4g
PiAgICAgICAgICAgICAgIGlndF9wdnJfZ2V0X2dwdV9hZGRyKGlndF9wdnJfYWxsb2NhdGVfZ2Vu
ZXJhbChmZCwgdm1fY3R4LCBQT1dFUlZSX0dQVV9QQUdFX1NJWkUsDQo+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX1BWUl9C
T19CWVBBU1NfREVWSUNFX0NBQ0hFKSk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX1BWUl9CT19CWVBBU1NfREVWSUNF
X0NBQ0hFIHwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBEUk1fUFZSX0JPX1BNX0ZXX1BST1RFQ1QpKTsNCj4gPiAgICAgICBy
dF9kYXRhX2FyZ3MtPm1hY3JvdGlsZV9hcnJheV9kZXZfYWRkciA9DQo+ID4gICAgICAgICAgICAg
ICBpZ3RfcHZyX2dldF9ncHVfYWRkcihpZ3RfcHZyX2FsbG9jYXRlX2dlbmVyYWwoZmQsIHZtX2N0
eCwgUE9XRVJWUl9HUFVfUEFHRV9TSVpFLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9QVlJfQk9fQllQQVNTX0RFVklD
RV9DQUNIRSkpOw0KPiA+IA0KPiANCg0K
