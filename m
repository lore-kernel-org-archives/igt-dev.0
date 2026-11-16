Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FD2606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=ou+qRhzu;
	dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-IMGTecCRM-onmicrosoft-com header.b=bXY3NLCo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9062E10ED9F;
	Mon, 16 Nov 2026 09:55:41 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C928B10E1F9
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:52:41 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AG7wdON3599519
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=hpu+nYFaO/+p0+JcY9yiM6dWRd+NAWVrfUW7c5XpJoM=; b=ou+
 qRhzuKQVvO7ZUKMSU/mdO2jwKJNJ1gaasUxaWknrlMzw2fYHzCQ/WbgHHilnUjg/
 ZxxPONXRRKk/r0HuHSFBd9BMhRq3O3E24tOaOHYPDhUs5gsLIkPObvEkPiMwmBxc
 1WBXhiGzkk2DACNCOgXHj1sa/6/IqIGVTgNXfErLpLZ2A6XvD32E0VGbCEp1NhXQ
 3VNj2pL3H+CKLDskce2BFqbwp+sJLt+FBAERXjFYMs4RjnhE6E+s8duLynpKivHp
 Q0qd6bosAwI9kqdPqxhkXLXO/1nG7PqOfRsA1g7J/ochZJi8FFo18Qus6Xd3lw2I
 GUiCY/h5jqddMFV5/Gg==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021140.outbound.protection.outlook.com [52.101.95.140])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hxgky1e04-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT
 key_exchange=secp256r1)
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:52:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uV0o+asnio+gLmt17P9+3ODC3VLP/nk4rj+NLae5OWoLhhe26F8k7g6+G8fGZybcrTC39NpVIPHdiSMtEIwBzm5o1oHWL8eyII4n+Q280PvzOXmoym4C8lvWw2KP1h9Fcz48FFtKxlzB3UT4FBaLPOmEX0XtKA6RYO6Z1CMSwoS4afCQRdHYeUuT5uFJixw7CjFzob6BoqUA7ZUSBxhjT4Rg/2Nyauxw4WWD7cQIMXIH3zVlWXTot3lYXGwrQpECJo2EbwYmgYM543WAzgIliRGZYCzET6V28cmb3mJAjR32G0gDsnReTM7X5FoeqDhIUoxqXRLrkkGcTJySzRWnOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpu+nYFaO/+p0+JcY9yiM6dWRd+NAWVrfUW7c5XpJoM=;
 b=WIS/3TaSS+mKcADUMgRaRH+u07/qVO3LmbShaPFJ1NgYXvl9oawOVaTeMDsnkTR4n2YO51/s2CpUi40rroRnvKyf/QoiW2vxurnWQd5xxhRIBoK4WrnEPJjLkptYQKDFXc/Jrmh75yWvgMWwzUUHGona97qV1lhI6o0dWuTS/hYjbf+xsTdWdH6ijMhn/nxwRSNQlPyW/A5xyjUwnm7o3+4S6UFuHHtc5MSb/REHvcZZO/tmm5buYOhAbgmvB4gRSCrHD2rzvhBuBoTm+SVlr8k8DiuXH+g/17tWWQGdWLk9yhRXsevJFuBmmjozu16iSbJORN5+PMjgvf1c016zuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpu+nYFaO/+p0+JcY9yiM6dWRd+NAWVrfUW7c5XpJoM=;
 b=bXY3NLCo0UFdTEeroBXJj1hVoUVgECQjHUeV5m7fgWRItvYW03XLhhh5ocKhzN2k42l25SeWvhc++BbX7AYHhBINcE1r69+qX/EZBv3Wed7Phv49zYEubZajaYDEWkKA7YjYp/oJwj39KqZeu0FXJDJX6tI06Ec2e1B7Rzktx+g=
Received: from LO0P265MB7076.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ee::7)
 by CWLP265MB7211.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:52:35 +0000
Received: from LO0P265MB7076.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ee9:8c49:ba94:4237]) by LO0P265MB7076.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ee9:8c49:ba94:4237%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:52:35 +0000
From: Alessio Belle <Alessio.Belle@imgtec.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Brajesh
 Gupta <Brajesh.Gupta@imgtec.com>
CC: Luigi Santivetti <Luigi.Santivetti@imgtec.com>
Subject: Re: [PATCH i-g-t v3 0/2] imagination: Add Firmware information query
 test
Thread-Topic: [PATCH i-g-t v3 0/2] imagination: Add Firmware information query
 test
Thread-Index: AQHdcm5v0/4HQa5WW0Swkuvb0wqVMbcwe4sA
Date: Mon, 16 Nov 2026 09:52:35 +0000
Message-ID: <6e468be4f273bb6f1de4d219fa1577d299881355.camel@imgtec.com>
References: <20261112-b4-fw_info-v3-0-70d20bd7bc28@imgtec.com>
In-Reply-To: <20261112-b4-fw_info-v3-0-70d20bd7bc28@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=imgtec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB7076:EE_|CWLP265MB7211:EE_
x-ms-office365-filtering-correlation-id: e2e4c05c-7c15-45e2-c51d-08df43c75785
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003|56012099006|261102123227099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261022115727099003|38070700021|10067099003;
x-microsoft-antispam-message-info: Vb1duP8y7s40g6WAkUSGQidwTFwcEXL4uuawIjAYlrRrmSMqc9dRWGPM8sqFpy+iA9rmDoIzxDUv7whLbuaZiuDl47ZkyflLNmAvJTpEN3VQ0KxQknpy+4KvyvMrNPZADN5NmU1biEc0dUbdmiwEz6ynDiereS1nFbic5n640Mh9AvOzCEcORXQGZWY3qIVzmWIc1+kbgn1K5UUIn4lTW0U+81Xfhybt5hSm37TcJTMKgiyTDzNImEBUMtPsBnRxEda2lbX6CKEpxNv+qZVvjUla8y9znywr8QWTew2aqxR8jxOeZkRRgvcQ3q0+x/qcrJOaz8GVYD7MFogzjTs6m0Y620ngWRQuxa50Fz8+IBVbZw1rZc5OdFLI5WzLAVBSpkmC9Q6Kn+LY9azPUCa3578JUHwMvDu0Si8XYfnfUNDR067yCfObvaVwlqlKLi6hbTZqvJDaSEe/Pz3pG8o4HrxLmLVz2lAS+HsoS0f7ZTW9KNnTjXDYg6L8E8/W7a5J6tzWh4ts8IFyRxLCJZz69M6aYTZR7tKNILylpw2n1/LMXUz75tuGMoJNxrb3hu8WW3bV8Z/rl9lCjTN4Hjz8y47VekQ3ouB1wvmNx+NmeE1RKrf/Yqk1EqNGfnoVzKb9DHexKAnaerQj/hL2dMWugCZBKoWeaZgQzju3Kl1IDGw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB7076.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022115727099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTBTTTRqaDBKK3VpOGtDRDRmeUdubGc0eEJtdGpEeDRHL0pndlE2VnV0NkFl?=
 =?utf-8?B?T3ovTEF2ZzJDTEU5Yk1CSXVmaUtyQ2I5WFJGMC9LZ29yb3Q4K3ZKMmJ3WUpt?=
 =?utf-8?B?ZHplQldMSkVObkZuYzIxRUJUbjBGWGxlMjhETkhlbGN2amxraElXU0NiaFZx?=
 =?utf-8?B?bGtha2R0YllNb1BMaDY4YTllRHoyYUttV2M4RkgzVkpkUUIrQkZHQmNnaHBV?=
 =?utf-8?B?dE1kSTlTNEV1Q0xKNE9SSkd0NXp3VFNqOC9hUjdjeVh2NXdxUW1NQlV6bDMz?=
 =?utf-8?B?WFA2cEt2NzFFUWJHbTRJTFdta0Zzak1IUTFDVHc1ajk3NnJ6M3lJNlo0VTlt?=
 =?utf-8?B?Q3dNd3FNS09rVktaSUNmRHNLTXZiUFplMDVzYytSVGkzSW5jM3ZPRGFzdEZu?=
 =?utf-8?B?TjdFMkUxRWtXN1FRSVpOY0dVU294RlRsY2ZQcEdlbzA4RFc5a3Q5ZXVXQ25y?=
 =?utf-8?B?MWFrbU9hQjVKdEZ6S2ZqRUc1OVZWT2M0ZnF0SGhyRU8yMGdIOFdySmxLcW1m?=
 =?utf-8?B?c24vb09URmFzZ1JkOVhkVUhZZWFzSGNHbWI3V2ZPTHhmTVVmRFQyQjF5YXc0?=
 =?utf-8?B?V3VMczVPK1lpQjJTRk9ZUk9NNzRiOVlpcER4dHNSRm9sSzdJLzlQZ29pbDht?=
 =?utf-8?B?YUtuY3luQzBnbjhqNEh3cUY0MEt3TkFZU01kVHRGVGRiam9LQ1RNNXpzaVFW?=
 =?utf-8?B?akRwNEZwdXRkQTNFSlFuYmlhcVpvZTFTaU9NcFB1YWFpOGtjSlpSaU9QMEpB?=
 =?utf-8?B?NjlRTnd4cldRQ25vNy9XK1FlUEJobk9HWndoWjFWNDJvQm5mYlJNbEVPSVRk?=
 =?utf-8?B?RzFoWHJTaWpSVG1PNkQrNW1maktUTWpVRklPa2VDblZHUldoWHpBL2xFcTBs?=
 =?utf-8?B?bUh3ayt1bkJtWXl3bFlJUnpVTDJiQlhMRWNPTDhzaEJ2MGs1cWpXUTQxYnNK?=
 =?utf-8?B?UE56bTZNRDdldTZqVk1QUUp3RWRGRFdvbFpHMldaNXVJYlJ5cmYxVWFTby9S?=
 =?utf-8?B?aVRCMGxGUkl3dWVoZkwxTERLUHppZEJqZjhkbnFqOXM2VjFnNDltRlBmREJS?=
 =?utf-8?B?MldSdGZ0ZEFPOFN5dUNXcGZMQkhDWkYvZ2VQbDY1ekpSeXNqVnJ4WDhlZTQ4?=
 =?utf-8?B?Mllkcnp4MmxPUlJqZGIyckVwYVo5K1lNNmZsK2ZmbmV0Z05ydVZwdVZyQ3Jr?=
 =?utf-8?B?U1VXREg5MWxSZW1YMloxWXZkdG9vWmtmMGNxUWxOK3RuMzdtVUxKVWp0dDdl?=
 =?utf-8?B?b0N4U2t5dWp2TjViMWFya2p4OVk5QXp5eURZSytSQ2JubVBidHBsQlZLbkZy?=
 =?utf-8?B?Mm5laWJiSjdwWDdGMVF6U1FGeEhta2poaVlsSXVyRkw0YWdBMk9sNGtteUtH?=
 =?utf-8?B?dUNteUNXOXhzS2RvcHF5cU15MVFhbEgwZDNtelV0VXJrQTNlekJkcE1yRzNn?=
 =?utf-8?B?cmZ1T0EvUXpuSC9MeDhsalZ3YzFDcTAyVjM4TWxjZ3ZBNDhrN3NTMk1keklO?=
 =?utf-8?B?ZTlLeU4xZ2VnNlVGNnoxcWRxdmZtaTVlT0RkcHRZYmd5eDE2RFM1UTVUQWlu?=
 =?utf-8?B?Nkw3ekFpWWgrWUZoYzRtRUNUVjRRTEhIdXArdFZMblArK1VpcVJqOEp0M0JS?=
 =?utf-8?B?L0RNa0tBTGJnOVNuSFRkL0tKU0dwL2cxalN6aU1Wa2dqQzNOeXpUbUN3QUZZ?=
 =?utf-8?B?SzR3ckNOV21qN2pSRUFuaHUzdEFlczVwV1EzVDkvRXA3dk9qNGZXdmhIY1NT?=
 =?utf-8?B?WXgvTmcvTmNpYzNlNmVKUGREbXFzd2xoeElUbVF5VVBLaEhxMDJaQU9xK1c5?=
 =?utf-8?B?WDlTUFk4ZGQ2Rzlkek9EdzV5WUtTOHd0VDVOZTBaNDJTc1lRL2syd1A1dzMw?=
 =?utf-8?B?VGFmOUc5ZlM0MnlhRStsbWZid1IwY1Zmb3BhZ0ZSQzdITW9GRE80cXBzN2kr?=
 =?utf-8?B?bDY5YlhWQkJLaFJsallHMmdYR2RzVFBoaGdhdExmK2hVa2poUjNHeTBpbVZX?=
 =?utf-8?B?cW9CTFAreWwrbVk0eWcyOCtXcllCYTNQZEtFMm1SR0tNM1lMZTV2TmRNb1pq?=
 =?utf-8?B?VlhMSEtrckFnK0JUTEhab0xnRDdUV1FITlJJYUNOcmJtSE9BbnVnNEtLSWI3?=
 =?utf-8?B?MkV5L2phOXJKY1g1eHZzN3VsVHc3RTYyVXduWVA2TlhZdFp6YUROL0x0QW90?=
 =?utf-8?B?MmsxLzYxZWRQQlZORFNoc1l0VTFiaHorZEpGTlhOLzJWQ2ljcWZtemlzM1Jq?=
 =?utf-8?B?K1VtWmZaYy9BSm5HNjZNNFFrOTZNMkVXdkZYUEdPV0IwdE9HU08yZklKZXVD?=
 =?utf-8?B?QXYrMHBBSVVCZ3FycWN0YjY1L2pUbE5rRk1mdnd1d2V4aVE3T05rVzNHRVNU?=
 =?utf-8?Q?h8QXISgMp/yzf3lM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80E27CA2C4BCB442B3C91766CC62401D@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ETCqd5/jycbcqWn3BZK+7AX7m/7Jln4px2XV7qcvJhiOStjLcsGw8BRureQdZTr1tV6g/PUFWth09vRMjs535j+YKMPYIOi88PGlUGSCytSQYJ0i31lg+RZpHUkpU743OpOdc2CUWr+7mNS21gEfD21xGSIyQJs0l7M/SiOxT77YieSbwe3+kNDNgb+3492z+vA/7L3NaFSbS1dUpCC9RqNMDU1PWMYru3wXYdhvMxJPlmeYRs7RLYjANxT9IMB/LABdjyYmz0Zdbl/OOtCqWX4flMqcjc5VK8ctUUfFN0t0DUQwvJMhOrZEbBvt0nCciaAR9wBHP2pL5zrDFmcg/A==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB7076.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e4c05c-7c15-45e2-c51d-08df43c75785
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 09:52:35.5806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ykvcHPY9nynRZMLZd68Tya9tyzX69VAU64ZZdCTAj09hFEkRaupXyKBb0tdUsGWjZ9Fy2E8+XGlFlIZfFrWaL7YPF+CXgw1sI2jaa+neuJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7211
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzOSBTYWx0ZWRfX8GpzVW1JU9iG
 5Yxi05hXD7SUAysgRMP/kpOz6bkAs8Mw47fFXgBUtNUNErgwH4Vvo8dyX6JxQ/kHxBzlwEuqLBJ
 2n9bFExC0a4VXeymFobu9mbcjb8snQuZXCpwf1ggeiizlvwJV8h7fJD+ftFeaTu9kJ7H9JC3xYc
 UqmYcsD6xdlWP/GiUvdu0RhidZggEVLkIzyCR+wKNEuUlBtkTtU5jhAp0pXloTbsH/djyFdeMMm
 4KPtxvkG6dJWBLjQdJ6+HZPcyOczn5YK0FQ6/QETt7m/VgWkfGgpGa6LdAh9othjJgkC8l2+Dal
 8ThlvHiqGVaS4yULs7Gk1Jz1yA3o5LUsN9/LBP4QU63k925IyQxys59ObtvjGY1UUfQfgzJoTwM
 P7FjY6ZynjxVKV6Lqh6u8nxNAzApJXN6TvuBbWgIe9gKGogv23ZqcMrEK4IY54zwLy/ef9JGyfd
 BYso23AYP6H3MBhF1EQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzOSBTYWx0ZWRfX7s7pI0tmFksZ
 DlGBxRvV166eHAtWizrYTYWjwYMV2tVRNSTg+t2mOCg8uETbD7LJHYFu+bFyZ0zWfdfAZveL87n
 Kl5NJ1DP7KCWfFrihDFqYRv5BOJTIrQ=
X-Proofpoint-ORIG-GUID: kCHmfKGYB01HTFZhFQmg5Vz69LmDbkNu
X-Proofpoint-GUID: kCHmfKGYB01HTFZhFQmg5Vz69LmDbkNu
X-Authority-Analysis: v=2.4 cv=TbsDJhQh c=1 sm=1 tr=0 ts=6afad267 cx=c_pps
 a=c57zojfn/sHdeyOhpem9jw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22 a=e5mUnYsNAAAA:8
 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=f0LPRkRXM42ZLDC8CJIA:9 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=FO4_E8m0qiDe52t0p3_H:22 a=t8nPyN_e6usw4ciXM-Pk:22
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

T24gVGh1LCAyMDI2LTExLTEyIGF0IDExOjUzICswNTMwLCBCcmFqZXNoIEd1cHRhIHdyb3RlOg0K
PiBBZGQgdGVzdCBmb3IgbmV3IEZpcm13YXJlIGluZm9ybWF0aW9uIHF1ZXJ5IHN1YnR5cGUgYWRk
ZWQgdG8gREVWX1FVRVJZDQo+IHVuZGVyIHVwc3RyZWFtIHJldmlldyBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE3NjgwMC8uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBC
cmFqZXNoIEd1cHRhIDxicmFqZXNoLmd1cHRhQGltZ3RlYy5jb20+DQoNCkZvciB0aGUgc2VyaWVz
LA0KDQpSZXZpZXdlZC1ieTogQWxlc3NpbyBCZWxsZSA8YWxlc3Npby5iZWxsZUBpbWd0ZWMuY29t
Pg0KDQpUaGFua3MsDQpBbGVzc2lvDQoNCj4gLS0tDQo+IENoYW5nZXMgaW4gdjM6DQo+IC0gVXBk
YXRlZCBhcyBwZXIgaW5wdXRzIGZyb20gQWxlc3Npby4NCj4gLSBDaGFuZ2UgY29tbWl0IG9yZGVy
IHRvIGhhdmUgVUFQSSB1cGRhdGUgZm9sbG93ZWQgYnkgdGVzdCB1c2luZyBuZXcgaGVhZGVyLg0K
PiAtIFVwZGF0ZWQgVVBBSSBoZWFkZXIgY29tbWl0IGRlc2NyaXB0aW9uLg0KPiAtIExpbmsgdG8g
djI6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MTExMS1iNC1md19pbmZvLXYyLTAtNGQ3
NzFkZGU1Nzc1QGltZ3RlYy5jb20NCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gTW92ZWQgdGhl
IHRlc3QgYW5kIFVBUEkgaGVhZGVyIHVwZGF0ZSBpbnRvIGRpZmZlcmVudCBjb21taXRzIGFzIHN1
Z2dlc3RlZCBieSBLYW1pbC4NCj4gLSBVQVBJIGhlYWRlciBwYXRjaCBkZXNjcmlwdGlvbiB1cGRh
dGVkIHdpdGggcmVsZXZhbnQgZHJtLW5leHQgY29tbWl0IElELg0KPiAtIExpbmsgdG8gdjE6IGh0
dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MTAyOS1iNC1md19pbmZvLXYxLTEtMGViM2MwOTY5
YTdmQGltZ3RlYy5jb20NCj4gDQo+IC0tLQ0KPiBCcmFqZXNoIEd1cHRhICgyKToNCj4gICAgICAg
ZHJtX3VhcGkvaW1hZ2luYXRpb246IFN5bmMgd2l0aCBkcm0tbmV4dA0KPiAgICAgICB0ZXN0cy9p
bWFnaW5hdGlvbjogQWRkIHF1ZXJ5IEZpcm13YXJlIGluZm9ybWF0aW9uIHRlc3QNCj4gDQo+ICBp
bmNsdWRlL2RybS11YXBpL3B2cl9kcm0uaCAgICAgICAgfCAyMSArKysrKysrKysrKysrKysrKysr
KysNCj4gIHRlc3RzL2ltYWdpbmF0aW9uL3B2cl9kZXZfcXVlcnkuYyB8IDI4ICsrKysrKysrKysr
KysrKysrKysrKysrKystLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4gLS0tDQo+IGJhc2UtY29tbWl0OiBmYzc1ZDZkN2ZmY2I3OWU4YTMz
MTZlODBjNzA4NTQ2MDU2OGE3NjcwDQo+IGNoYW5nZS1pZDogMjAyNjEwMjktYjQtZndfaW5mby0y
NjlhNzQxMTYzNzQNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0gIA0KPiBCcmFqZXNoIEd1cHRh
IDxicmFqZXNoLmd1cHRhQGltZ3RlYy5jb20+DQo+IA0KDQo=
