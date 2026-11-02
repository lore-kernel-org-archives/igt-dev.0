Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE43606A330
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=SzAaOBrT;
	dkim=pass (1024-bit key, unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-IMGTecCRM-onmicrosoft-com header.b=fm1jw6iy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BE810E625;
	Mon,  2 Nov 2026 12:49:29 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8375710E625
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 12:48:24 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A29CSLj4155906
 for <igt-dev@lists.freedesktop.org>; Mon, 2 Nov 2026 12:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=+YsjNdHXFAQoMZNElO8m9IpDl28wo4pX3FVS+YNOXdE=; b=SzA
 aOBrTKEucCjyDxnwrY8QssJc+bKPVyHwqRk5vx1UrC4fmS3cDhfToioAT9s3wWeA
 I5BJqUnRNeERdfK/4AwFdlV2MVDGfjnCems6SLwSHXeWZZlEhn3HY5XNUxJnnOR4
 m2qYkgSS/9pFX2DplSiOiCaz8rmHWjaDJKoH8cjM60tYgZFddJ+iaGQck/xNQDjT
 XfIV2gEwGKKzAzivN1UpfqWbwxfhbm+pHNxfTWoc0dbmNh3X4/6ppYmgvqdyl0Cq
 hp20dCxC+uja59QevjQy5AYllaqv5YDovkkkaGJTHUhUkC4+fHE/Y2OLBjTk1L5o
 +10GdbZ3AZJziBOZ0Sg==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021101.outbound.protection.outlook.com [52.101.95.101])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hn99whjvg-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 02 Nov 2026 12:48:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=romJlXEtzsY8eIuXoMu4AogE7VYYxdV3BMZt94K9WxurcG3r5SIaNQL/U103RhsjUeuTse6ioVG5tgp2NezEpr/ZGA277RTK8Wj6f7P9KEikOxkCx/JMaDcgZhCeL+h+ItR6J5jjlWY9bXjSYY/UAACJSYxFuKBNnZH4V/08Q2kD6x2ruPQOzr0l/ftUKE/ViYmShP/VSsDvVTe5GgDQ1dH1BEoseWpGYkg8EIm+lk7EXucmrXvkGCfZzH6LiXiTSJGsPZF1F5vj3OJucNv+XW0VPHw6g6hEDq9j87pL9IXnT9/CryEAJ31zSNdA8xj41pEc12/gyNPZX/1OCLIZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YsjNdHXFAQoMZNElO8m9IpDl28wo4pX3FVS+YNOXdE=;
 b=VJWllnyTTnemw3V5BJf84JgrRsqIOIEPVx9353U9XZF7HESxUJRyuNgq4vhTh9eWGNEE1iEh+lf4+nEyJEv4nz+JQTixcyDvncro3d3LcdpfFKpg/NeefzbtmH3sRaAiAlyarlZ4/oPuiGKD9nUtYCrpeffrhEaT40Cx3kNRwpB1grS+iDjgEKeD0dgWX7CIffKjAE++FdPorbxFjwOfhQTqdVpKmoQpNqn320hbZ/rA2AwK9YMG4P6WiM0set5dD/2dE8ituAC916BariuMXKj9dG6vtFDvPrxzJY1f66J+qjSICqXwl4UOYr2fugZdfJ0AkS3gH/e6C0Ffzbz/uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YsjNdHXFAQoMZNElO8m9IpDl28wo4pX3FVS+YNOXdE=;
 b=fm1jw6iymp2AFp6p5djp9c6rDWjclKYam6yHhGflpdGNwQxA9j64+b2dW6oICsh+ySGHsagsyzVUXnrciiYI+AJPFjSyfV5z3vpXDYW6vgv09XfYdXVyOlBXcsXc/17tpIM6uikgB99jojVWcyw/FENpt0K+R70SN5/IC/KWdZU=
Received: from LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b5::14)
 by LO0P265MB5143.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:283::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:48:19 +0000
Received: from LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6b99:94f7:a14f:a722]) by LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6b99:94f7:a14f:a722%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:48:19 +0000
From: Brajesh Gupta <Brajesh.Gupta@imgtec.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Luigi
 Santivetti <Luigi.Santivetti@imgtec.com>
CC: Alessio Belle <Alessio.Belle@imgtec.com>
Subject: Re: [PATCH i-g-t v2 0/3] imagination: Update allocation flags for
 buffers in submit job
Thread-Topic: [PATCH i-g-t v2 0/3] imagination: Update allocation flags for
 buffers in submit job
Thread-Index: AQHdZ6HR1sBgVZUO6kakQROsK757CbcUwLQAgAYA5gA=
Date: Mon, 2 Nov 2026 12:48:19 +0000
Message-ID: <1cf559f11650ecdd299b150d77148dbd70b93368.camel@imgtec.com>
References: <20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com>
 <b62f13bd6feaf945cd7d0b3ce5c8ff11a40550d5.camel@imgtec.com>
In-Reply-To: <b62f13bd6feaf945cd7d0b3ce5c8ff11a40550d5.camel@imgtec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=imgtec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LOCP265MB8661:EE_|LO0P265MB5143:EE_
x-ms-office365-filtering-correlation-id: e0f80bd4-c61f-4d27-820a-08df38df9288
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|23010399003|366016|38070700021|260925021311599003|260925022911599003|260925021911599003|4143699003|5023799004|56012099006|261009223027099003|261028144727099003|261021123027099003|261021121427099003|261022115727099003|261022105027099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: GUH4N/Lx6kNHWaFi72JUJt9oxYIJiHmS7O2bavCTJAAtnuaRf5UuyZ0/RT3/InwkXXq1dG1LIefPT7vwxa/+ZRo/1vmCWmYn9s2nA22g9Limceqf09QKLwoLPoLGeQTkYVnh23ZJMvf1Rq5Lr1k6JhKAC1eS5RUnnCnhxro7VEsoqzsUidd0JSx7n0+0H5p0VjEXZ4gUdGwsDc0SPt6wfWwq25E6xPIOycDUFRS5nYNnC1TRQJzInUcfdKCcjAQGWwHDN8C6pFwjuaz6E4b7FTHToo5nYOcqY0EYxtLU3bfP6KGYtDezfeowIBwGg/6nIe+Vrfpo/5A9+975V2VUecNlzhsZyclxXnFddKnP4wOhywqxplnMv0GCZnSo0ufmb2YCq2KkMzvVdE1afL8O8esk723WVO46jg5BzeSTnEznFdxQbZiuXPHvgPtCxS8atRDOckZYRYFFS1LSvYrSPnLGxnjpbRNwOmpfIe+N/XxUv6aNDXtUUpTG4ec5Etez/vPmwxLybKb2ZYiyFewfwdlwbFZqHVl6AxpH9g2ngW1W+cC4Jw9u+L36ZLVhr0/fpFUW4EF1Z7J3wiquQ1lwly4kMrus7sI6z97IUHjN3RV3F43XkIngFtqmZsx8zAmcsI+/7VDFMsWyKRMHHDfpqXBTm+Xvlo2sKuke49A997WkisWNcC8+naVhQFfsXnXe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(23010399003)(366016)(38070700021)(260925021311599003)(260925022911599003)(260925021911599003)(4143699003)(5023799004)(56012099006)(261009223027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022115727099003)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZS81T1ZSaVhMSFl2WGlLZ2xKWmwyWS9wQllpWTRodmNPWm94c3o3bzlVTFU1?=
 =?utf-8?B?NTBQREhOL0toK1VoSFVmamxBWS9YclNmNWU4TWxQYUY1WlA1c3RJRUZVMDQw?=
 =?utf-8?B?amkxVExUbXNyMjIyc2J4YSsxZlJ5YWo3d2c1L2JReStPNUhUbitXRnBDVjB4?=
 =?utf-8?B?UytaMjFVSjI1Y3lQaDVyRS9DVVBZcHJ5YWxaR0RnSGhsaHpKQVFWa2Qzb2dE?=
 =?utf-8?B?bHpmMVB2eHdLLzdmUnFPNGs0cGMwTHNEMFBaMjRrY1BNaVl1VHFHYlJtYVZD?=
 =?utf-8?B?ZDRpeEk5dFNPOUVsTkpub0NmMll0ditQNFFLUm9mWGd6L3BibXhwOFRTR21H?=
 =?utf-8?B?Q3gvcis2TUo2U3piNVNWdTFxY0cxbjZjZXpWL2Z4SkJnR3lKc2VGSXQvUGtt?=
 =?utf-8?B?OEtmb3pXaXRCK0RmS3liRkR6M3Jsc0lueVVSZUQwZ28xa1NHM0M0bm9pRTE3?=
 =?utf-8?B?YXFnNW9TcnlscDl6eXNEQlNlUGJjZW5Rd2R3TTh0TEl2OHhseHVFOXJBM1Js?=
 =?utf-8?B?SGY4OVp1azBtTnYrUDBNYWRiZGt4TVZmYU1IYm1xL3JhSCttaDVyNExVTkRE?=
 =?utf-8?B?aU4vZFliRER1LzIydldCM1VDVGdremdyRzFydVp2aHhkeXBNL2pDOUdvOHZQ?=
 =?utf-8?B?TkJjK2tpbEFvVm8wQ3cwbkVya2dpK1V2SjBrckZUUk1zYnE3K1F3TS9aWXdx?=
 =?utf-8?B?WUFpSXBjUjZOWnpHeVlSdnFDUHZWMGw1UkJMYmdUdURHZUg3dDNDOFFudks2?=
 =?utf-8?B?K2JENXBQRkpLVGNsUFU1S3M0QWlYMWxsYWpHN09OWHRnaVl5WDUwblpESFpG?=
 =?utf-8?B?THY1YVUzcEFQT0xqcTJWb1Z0TG1lU1NzcFRJU3M3bTBKeEZuTldIZlhTTERk?=
 =?utf-8?B?NHp6SXc2NzM5cE5hK3hRYThqdC9HT1N6L0dSOWV0Q01TY09LSkUyS0NUSmIy?=
 =?utf-8?B?L2Z4OW5DTHBoUDdsYWYzNU51N0hnMDRETXB0RE1LVVBZVjZHUWJEaTVNa3R4?=
 =?utf-8?B?ZjRzZmJNYUw5SzltYitXUjhJeXJOeVVoRGVucW9rSDNtNi9ORXRYbFFTcCtl?=
 =?utf-8?B?WDkyMkREVno0MVUxY0IrMnVuZmlqL05jaldMaXk3ODNjUThGSVV2TURxZ0po?=
 =?utf-8?B?bHVCT2hRRkFNK1Awdzl0VWc5aVNlem5MS0NGUFhWR2pCWi9GZEdUb3VwY1Jx?=
 =?utf-8?B?aE5NOTZtc2xFMXZjdnZwRnFQWEdPampvcHpzTEMzZWV1cmIyVkw5S05JbHdQ?=
 =?utf-8?B?VU0xU0FydlNzeGMrSlg2bkpsdlJlTFUvS2YxbVh1dE1JZ3o4eFI0QUFCS0d2?=
 =?utf-8?B?ZFZneVJsakRIeU5vMzRYT3QvYVhmNTVCUGx2T0VQNXZDV1orZVlQQUpsY205?=
 =?utf-8?B?ZTQyWm51NktDdDVPWGt0UnBCMGlvQk1wN3RzRzREVzZrdHNBWUZqUlNRaVpx?=
 =?utf-8?B?L2NmbnVoUFZsZEF4K2NsekJ0NEFrUkxvUlZ5djNMdzJOUksrVWdrMkEzWHRR?=
 =?utf-8?B?Y3JZMU13My91SytsUUpJL0FMeExVN0g4a2pING1pR3ZpenRSdW9qMjV2L083?=
 =?utf-8?B?dUNKR01KWnJycGptekR4d3dFc3JDZUhwZzhpbzNtbDc1YzJhZjFaZEpOQUk1?=
 =?utf-8?B?OEl4TE1tcVgvZldIdjFQZkpmeDcvMWNKZEJsdTR1NlczaXprbUsrMzE0WnFy?=
 =?utf-8?B?MHRCWm9CVUFORVZ1eEpxYk5qN2RKakFMWmpaVU5leHBPQU5yOVloUFF0WVo5?=
 =?utf-8?B?UXI0Nk9Xc3ppU2VKeUQ3c1lvejU1Mzk2cWNJd1c0SVdLb1NGTW96ZDlzTHAx?=
 =?utf-8?B?Y2g2OXZtZEg4ZUt5Rm8ycWh6ZUN1Z055VG5GRUlqOUJHVC9HT3ZtR0FoRkZN?=
 =?utf-8?B?SS81bUF4QVROQ3JOQnYyRUZ3OU9tWWR5U1hPelROeDcwb3orK24xNlp6T3pH?=
 =?utf-8?B?Tm95cExoK2xZdmZvZ0Z1WFE4N1RUWWhKL0E0WHBqMktVcWdoanpTcmVHY1JD?=
 =?utf-8?B?NzBycUZJSVVjOGF0Q042MW9qQTFXUHRSVjExK1BhajBWWFAydVl4OU1LeVZS?=
 =?utf-8?B?d2hpT3FhL3Q2ejlkMCtlR2lsY1o1ZTFxSGYwVnNHR2dNMnprc1paVkFWWVJx?=
 =?utf-8?B?Ry9RSEdxbHJvaE1ieE4vempEOUdWTS9tMGxPS0E1cnVVdW1wUkpES1lEdktY?=
 =?utf-8?B?M09XcHE4NTJoZTF3VGVYdnpxUU5TUlNid1dldTVpV1dib1JTRnNkNGZsbFpX?=
 =?utf-8?B?aVNvd1NwL0tMeXprMktWaGt6bVpyVzZkc1UyYW5xbmlEU3BOenBKemlSSWl1?=
 =?utf-8?B?dlpNVUZJak9Pb2R2Wkx6QnQ3UG56blYvbDh6RlN3ZmJXQ3llUW42cSt6UkdN?=
 =?utf-8?Q?MNT3VrFmsrWHbyftyKUGBJg0ZxYfMPgO3cc5Vmj1ZGnPy?=
x-ms-exchange-antispam-messagedata-1: DVGAgzQ35MbNnPvCzvTQxsBXSJYHf4uyU3Y=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5BD41C38EE6C44A8EADAE34B5FFA925@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JmwicNi5hcxS9DOoJOWOaCVMM+Xi3HZEe6MkU8Fc0UodWRXnmgActVvp3TL/RdFj8Lr6rNaR30SfqXvV8cWXBd8Gk3xkOkEHf0NiIWcPy921Lw+DdFWoFx07G+oAmCDQiqLbT7wKmpLtQBu8kySId2Zun5PUe6FLRQiHeot7hlpQi0itLtP5cf88RBmWI7zRLn0Sr0g6K/IIUYiYHdp+rHJul39bMSpvYa2kO0ZZtMkcsyRyKYYnvi+ahXpPrW26x2aSdiycFRz1t6yHbnV1XT6wxxcsUp663xiN2/Y6oeYFLjJCJEzb/ljsQYDthZLzoCnpnOkmuo+CT3k7b3KIRQ==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f80bd4-c61f-4d27-820a-08df38df9288
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 12:48:19.6927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M+vqwEaenGPZCpMWAnUwzeCq+HKSLhS/Z7bwwikz5K74esOsZ+sBzO5w+uDM2GOjpU1t0CKOGBto6KcG/v/aZN0aA80mPApganzjseozphg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5143
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX2xlihysevc1j
 pr9GPim+9bpcXG9iHqSi3dLsIQOj6BP1yUASASM5yTzcHVzu70/jb45FiDDRBZQSDJy4dRfgY2G
 hVrVjKSjPx8LHyrVdnSOuWYNsMA3FobtNIGeriIkYdy+yc5Q66dhftewD+x/0r06KsO++PDDpDz
 F3rAU61LKmBsUaZ6FRhwCr6by3pG9r0uHEg9YvMR+gZngFuS3K4ZmaHoMzo9riAzVKKfJwLAjvh
 BrpB00hzAuCf213kwYQm0UhPU9HfqV126gqd/FaQvPO699iGm4jZxqL3u6wxAMOE/rLql0a8Dhi
 8QYlqL0+H+WNHFUUfjYnx1PJfy/FcywtW8+TXSVbVajLWIznr540FMTXXdabFbSFkOOCjA3QTqs
 er3IR26Zzf9xrxxWo2SM4Ar23pE1z4Ez/Z9DuERg6z00Zjxcsv92RiigKN8B68zzJDPWx9tae14
 0mMIb2CFz2lfT82a7mQ==
X-Proofpoint-ORIG-GUID: jwbeo1WaAMzzvFiRHKk7hNTNp2l3jG_a
X-Proofpoint-GUID: jwbeo1WaAMzzvFiRHKk7hNTNp2l3jG_a
X-Authority-Analysis: v=2.4 cv=BZlNQbt2 c=1 sm=1 tr=0 ts=6ae88696 cx=c_pps
 a=XH/GPGqRV+FfVwuXMtJBIQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22 a=bC-a23v3AAAA:8
 a=r_1tXGB3AAAA:8 a=U-_lSbvNB8fP4bz5bm4A:9 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX9EBRxDfJrRNt
 HS+ajFcYFDeRkCj1xAkbGewKM8f3KBKi+CBG09n1C2q3EIc5TpXLfByPmu8nVuj0LQrVUHpHDAR
 Qml6l3XDW4LSL4w2PnIeeeoeHsi1E1w=
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

T24gVGh1LCAyMDI2LTEwLTI5IGF0IDE3OjA3ICswMDAwLCBMdWlnaSBTYW50aXZldHRpIHdyb3Rl
Og0KSGkgTHVpZ2ksDQo+ICoqKiBOT1RFOiBUaGlzIGlzIGFuIGludGVybmFsIGVtYWlsIGZyb20g
SW1hZ2luYXRpb24gVGVjaG5vbG9naWVzICoqKg0KPiANCj4gDQo+IA0KPiANCj4gSGkgQnJhamVz
aCwNCj4gDQo+IE9uIFRodSwgMjAyNi0xMC0yOSBhdCAxODowMyArMDUzMCwgQnJhamVzaCBHdXB0
YSB3cm90ZToNCj4gPiBVcGRhdGUgQk8gYWxsb2NhdGlvbiBmbGFncyB0byBtYXRjaCBleHBlY3Rh
dGlvbjoNCj4gDQo+IFNvcnJ5LCB3aGF0IHdvdWxkIHRob3NlIGV4cGVjdGF0aW9ucyBiZSB3aXRo
IHJlc3BlY3QgdG8gdXBzdHJlYW0/DQpJIHdhcyByZWZlcnJpbmcgdG8gZ2VuZXJpYyBleHBlY3Rh
dGlvbnM6DQotIElmIGEgQk8gZG9lc24ndCBuZWVkIGFjY2VzcyBmcm9tIHRoZSBob3N0LCB0aGVu
IGRvbid0IHBhc3MgdGhlIGZsYWcgQ1BVX0FDQ0VTUw0KZmxhZy4gSXQgZ2l2ZXMgb3B0aW9ucyB0
byBkcml2ZXIgdG8gYWRqdXN0IHRoaW5ncyB3aGVuIHJlcXVpcmVkLg0KLSBGb3IgRFJNX1BWUl9C
T19QTV9GV19QUk9URUNUIGZsYWcsIGp1c3QgZm9sbG93aW5nIGd1aWRhbmNlIHRvIHBhc3MgdGhp
cyBmbGFnDQpmb3IgYW55IEJPIHdoaWNoIGJlIGFjY2Vzc2VkIGJ5IGVpdGhlciBQYXJhbWV0ZXIg
TWFuYWdlciBhbmQvb3IgRmlybXdhcmUuIFVwZGF0ZQ0KaXMgdG8gcGFzcyB0aGUgZmxhZyBmb3Ig
TUxpc3QgaW4gdGhlIHNhbWUgd2F5IGl0IHdhcyBwYXNzZWQgZm9yIEZyZWUgTGlzdA0KYWxsb2Nh
dGlvbi4NCj4gDQo+IEkgdGFrZSBJR1QgaGFzIGFsd2F5cyBiZWVuIGJyb2tlbiwgYnV0IG5vdGhp
bmcgaGFzIHJlYWxseSBjaGFuZ2VkIHJlY2VudGx5IHdpdGgNCj4gcmVnYXJkIHRvIFBNL0ZXIHBy
b3RlY3Q/IQ0KTm90aGluZyBpcyBicm9rZW4gYXQgdGhpcyBwb2ludCBhbmQgcHZyX3N1Ym1pdF90
ZXN0IHRlc3QgaXMgcGFzc2luZy4NCj4gDQo+IFBlcmhhcHMgaXQncyB3b3J0aCBhZGRpbmcgYSBk
ZXNjcmlwdGlvbiBvZiB3aGF0IG1ha2VzIChvciBkb2Vzbid0KSB0aGUgZmxhZw0KPiBuZWVkZWQg
aW4gcGF0Y2ggWzMvM10gY29tbWl0IG1lc3NhZ2UsIGVzcGVjaWFsbHkgYXMgd2UgZXhwZWN0IHRv
IGV4dGVuZCB0aGUNCj4gaGVhcHMgaW4gdGhlIGZ1dHVyZSBJIGNhbiBzZWUgaG93IGVhc3kgaXMg
dG8gZ2VuZXJhdGUgY29uZnVzaW9uIGFyb3VuZCB0aGlzDQo+IGFyZWEuIEknZCBzdWdnZXN0IHRv
IGRlc2NyaWJlIHJhdGhlciBwcmVjaXNlbHkgd2hhdCBpdCBpcyB0aGF0IHJlcXVpcmVzIHRoZSBu
ZXcNCj4gZmxhZyBzbyB3ZSBrZWVwIGdvb2QgcmVjb3Jkcy4NCj4gDQpJIHRoaW5rIGl0IHdpbGwg
YmV0dGVyIHRvIGhvbGQgb24gcGF0Y2hbM10gY2hhbmdlIHRpbGwga2VybmVsIGRyaXZlciBhZGRz
DQpzdXBwb3J0IGZvciBQTV9GV19QUk9URUNUIGZsYWcuDQoNClRoYW5rcywNCkJyYWplc2gNCj4g
VGhhbmsgeW91IQ0KPiANCj4gPiAtIFJlbW92ZSB0aGUgQ1BVX0FDQ0VTUyBmbGFnIGZyb20gQk9z
IHRoYXQgYXJlIG5vdCBob3N0LWFjY2Vzc2VkLg0KPiA+IC0gVXNlIERSTV9QVlJfQk9fUE1fRldf
UFJPVEVDVCBmb3IgTUxpc3QgYWxsb2NhdGlvbnMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
QnJhamVzaCBHdXB0YSA8YnJhamVzaC5ndXB0YUBpbWd0ZWMuY29tPg0KPiA+IC0tLQ0KPiA+IENo
YW5nZXMgaW4gdjI6DQo+ID4gLSBVcGRhdGUgYXMgcGVyIEthbWlsJ3MgZmVlZGJhY2suDQo+ID4g
LSBVcGRhdGVkIGRlc2NyaXB0aW9uIHRvIG1hcCBjb21taXRzIGFyZSBzcGVjaWZpYyB0byBJbWFn
aW5hdGlvbi4NCj4gPiAtIFNwaWx0IGxpYi9pZ3QgY2hhbmdlIHRvIHR3bzogSW50ZXJmYWNlIHVw
ZGF0ZSBhbmQgZmxhZ3MgdXBkYXRlLg0KPiA+IC0gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaC5t
c2dpZC5saW5rLzIwMjYxMDI5LWI0LXJlbmRlcl91cGRhdGUtdjEtMC00YTkyZWMyMTBkNmFAaW1n
dGVjLmNvbQ0KPiA+IA0KPiA+IC0tLQ0KPiA+IEJyYWplc2ggR3VwdGEgKDMpOg0KPiA+ICAgICAg
IGxpYi9pZ3RfcHZyOiBVcGRhdGUgZ2VuZXJhbCBoZWFwIGFsbG9jYXRpb24gaW50ZXJmYWNlIHRv
IHBhc3MgZmxhZ3MNCj4gPiAgICAgICBpbWFnaW5hdGlvbjogU2tpcCBDUFUgYWNjZXNzIGZsYWcg
Zm9yIGEgZmV3IFJlbmRlciByZWxhdGVkIGFsbG9jYXRpb25zDQo+ID4gICAgICAgbGliL2lndF9w
dnI6IFBhc3MgRFJNX1BWUl9CT19QTV9GV19QUk9URUNUIGZsYWcgZm9yIFBNIE1MaXN0IGFsbG9j
YXRpb24NCj4gPiANCj4gPiAgbGliL2lndF9wdnIuYyAgICAgICAgICAgICAgICAgICAgICAgfCAz
MyArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0NCj4gPiAgbGliL2lndF9wdnIuaCAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMyArKy0NCj4gPiAgdGVzdHMvaW1hZ2luYXRpb24vcHZy
X3N1Ym1pdF9qb2JzLmMgfCAxMyArKysrKysrKysrLS0tDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwg
MzEgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pDQo+ID4gLS0tDQo+ID4gYmFzZS1jb21t
aXQ6IGZjNzVkNmQ3ZmZjYjc5ZThhMzMxNmU4MGM3MDg1NDYwNTY4YTc2NzANCj4gPiBjaGFuZ2Ut
aWQ6IDIwMjYxMDI5LWI0LXJlbmRlcl91cGRhdGUtNzlkMGNmNzBlYjBlDQo+ID4gDQo+ID4gQmVz
dCByZWdhcmRzLA0KPiA+IC0tDQo+ID4gQnJhamVzaCBHdXB0YSA8YnJhamVzaC5ndXB0YUBpbWd0
ZWMuY29tPg0KPiA+IA0KPiANCg0K
