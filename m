Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFAACD5BAF
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 02:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FDB10E52C;
	Fri, 22 May 2026 02:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="eeaisUvZ";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="KgH9tP3l";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55ACD10E52C
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 02:59:12 +0000 (UTC)
X-UUID: 31b1d8ee558a11f1a3561939bc42ff46-20260522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=RJ0yeG60bD+QufFHNshpmwKKJnrb+s7WIWjHa8Tkcys=; 
 b=eeaisUvZfBCBEicVqd98QuYIXSZlirWb+wm3tTNig/m08ryQ99Wb2ZNCz1yEPaebWX4OSkY9nBsFMSiiBZLE2FqEvUF8BOH5UlRV1KyzwddFvQCO7XqIxHwgzg0hO9mnw+J4/ItzfWRG2fba6Ltb4cgaQrkQgFWowczqTqSh2nc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:ea70dd90-6a7e-4ab0-a9fb-68f7255154ea, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:9091e75, CLOUDID:9a8b4246-e650-4d81-a877-d298d8f44b5d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 31b1d8ee558a11f1a3561939bc42ff46-20260522
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1100757313; Fri, 22 May 2026 10:59:05 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 22 May 2026 10:59:04 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 22 May 2026 10:59:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFg1GrrT/dv+53Yk4udetHo9YdEgSIF5Va/dlP5qF6v1eqH07tWI8+jwsv7ZBwJ3Ke/mbiOuyfBbMNZuubbyA4eiO0EivOLuIPh+mow4ZJ65l02+2ruJiT4seyIDYVxeaQbuob5qoeqId2GH5e6ppw+eOy5MUHaSd0vCVnOwPsRKsIdaagEiO+jzSUmcEkU0h/kLfuGu7Y2HbND67cVYKPtp/vlhuZVLh9Yj8QBncswpcfiLXHhcFRaEkmIGZsmAAb8IfTX7JUne3suXai4HDpYCbMl5iREUa6tGG/jK8ZoiZb2KfzWnIpSjgi21SOzPsKP+qxfumDkTnrFzAinz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ0yeG60bD+QufFHNshpmwKKJnrb+s7WIWjHa8Tkcys=;
 b=Zq00Yo+C7UXwV6owfa1Sn4qaddgjIJUmpjQTj3tSEuFudgqimruS4BgbbUahtlbPNcBG4CvyRhMiVWYC8IxNXAlNvNPQkSRDgAkpcd8MTixe9QUIr81liCWh8WIK6evBLT3fawRB7AXm5TRteNB/bD5mmd0upWGTLXdcpe41EsYJpgbQwnSVleqTwepMNY2zjZVxfbrBrH3I1e6vLrxvfAcGzI65f4KP3XtbvScTrVSAJpYP1NP5zrQwbOTolIQGakqImlEXCbrwAV3wZQHaCuC5GzMZdTzHqDNLSEsaNANfJ4MsF/sAur6MHqYuHfGZMODIfz8oDuvI5ewsaQ75UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ0yeG60bD+QufFHNshpmwKKJnrb+s7WIWjHa8Tkcys=;
 b=KgH9tP3l5J1NOuavB/obHzohFp7Qmibq5L8AUVUjOAsn3IxRbrbkshfKdZfIE2cHpa3azXQvsytQit9F7wooQiw1TjMeGxF8lKR1W6Q7+BmOayXGspoaZC+p3HwuqH+vr5aAZWi8fKl1JY4peX5C5Zxb6E+H9OgHGFuvfiQ/8r8=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB7182.apcprd03.prod.outlook.com (2603:1096:400:339::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.7; Fri, 22 May 2026
 02:59:01 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0071.005; Fri, 22 May 2026
 02:59:00 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "navaremanasi@google.com" <navaremanasi@google.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>, "karthik.b.s@intel.com"
 <karthik.b.s@intel.com>, "swati2.sharma@intel.com" <swati2.sharma@intel.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "fshao@chromium.org"
 <fshao@chromium.org>, "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Thread-Topic: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Thread-Index: AQHc6CSPGBSfXb3UvEKHnz7wd/zZw7YW7uCAgADdDgCAAH/sgIABEb0A
Date: Fri, 22 May 2026 02:59:00 +0000
Message-ID: <988bcdc233564b398a87190cb40489d43ed3922c.camel@mediatek.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
 <ag28FVTooBC6Yly3@intel.com>
 <53284b68be0216eab50946da686968691fa59a56.camel@mediatek.com>
 <ag7g07pHLWgPViVh@intel.com>
In-Reply-To: <ag7g07pHLWgPViVh@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB7182:EE_
x-ms-office365-filtering-correlation-id: b3ced63e-e9a0-45f8-e33c-08deb7ae133b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|6133799003|38070700021|22082099003|56012099003|18002099003|11063799006|4143699003;
x-microsoft-antispam-message-info: CjaYPCOPNw93UDyg09FhieHxZohM7oY+MDlPF8chmMWAjiZXYePdJiQAeJbUyziSJlrNE+9/v4wAmwMYa6E1Zivig08M/SZ3sBsCgbAq24V0uZy+i3hTTfmQCDLQaO58nrU92mK6tIxV7BrFaRnf2/eyFHDoq9cHneynzkgoY0S6VKeA0ddNP+F9zB1nDuqNfAvbCmPcNOPvyxsbByOTs1EhJXQcC4aXW8o7v57IVm+HfaqKRm+iBKtpGzTDywCf9GauNg43UNSLwb9UtHkwJiytlY/PXNx4whcFvD7FIJRCAiBTgDCM9ahJIioYQV4otW40DjM92UgaOF0eTC/eCZhvbgVEX4yMigPYag6F9UTkxRkoSzuKGPO9/YDy7CzqG77n5vLjl6BOZWIt/GewHhBlsXv5dYpdyOmf+UunTMoNUx4GWR3T7ZrblPqhw4w8NKeeMTWWalYywMe24WcYeGgi5PcxrE3N0dQ8aA2fd7nHBXB7vhCjVCv/OYxmAildgFhk0QPStfmasiQ+IREevoyC+GUeMKp2EKP7ysuZUBw4i6hikCZtSsaf518nIyorXxx65iQk0OqYr2klluJPB8gODK6Bo0jJfb2JTv2DDHJcG5LrUBFS58pjE8ybA0/RnXXgJgVgKa81QJRFKazGVoVDfnEiIZrZdruapq3q57C/ZZIrmHW1EGlPTS9nAOc63ZWlKZLDEtUBd6LKORgaOASVJHzWjD64pyAQbyUjncN44dqtj2RffnQQqbeTnXuc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(6133799003)(38070700021)(22082099003)(56012099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkJCT3MzdXhWMTdBZTg0eVE2a0Zma0dyTEZaWllGaEcvRUxZazZ4eFcyZllG?=
 =?utf-8?B?d3VqUkxwb0ttcXBKY3RLaHFnSndRTWVqSnBkeGxhUzh5OVBsT2tvZTJHeWZ6?=
 =?utf-8?B?R0JyNXhXK3F0QUs0dHFtNGxJb2s5ekptMVpBNUFZZ2o4VzZ1N3FMdTA5aDI2?=
 =?utf-8?B?WWRFRCtKNmx2ZG9vaHZidWtCMWRaVXo2OFN1WkRvM0p0TXdrTFVmUzR0ZXJv?=
 =?utf-8?B?SXpKVDJyb1NNUzdVUjlMY0Q5QkhqSGNYcVlKUi84RzlMV3FqYXFXS3Y2WmZm?=
 =?utf-8?B?bGJKdHAyVDBLYnhoRklKbWRRbDVlME1uSm9BRHRpb21TSVZCVmdDdWxvOXJt?=
 =?utf-8?B?dzNWQ1E1QWJVbXB4T3VNdzJuT0hBNW1lbURKcTIzOGtqd1UweHVrUzRMa0tC?=
 =?utf-8?B?VDAzYmQ4NU4yZ0ZYV2F2dDVnR2pJZzZQQnppcUxOdDVoS3gvRmVCY1VSWkdK?=
 =?utf-8?B?V0NqbkNPRmJsbC9WaC9DWHQvYkFPb0h2SUtKUVlRQ2I1Zk16UklicmJVK2lX?=
 =?utf-8?B?KzZsSnVFUHNDM0RYMFdMUnhzc2wzQ25JRC90TmdQTzkvM21NczE2L1JyczlR?=
 =?utf-8?B?eGtCVVowWWVkZXoxOWtaNEZyb0hDNHlYbEtscXl0VzFzZUw2YlJxSEtIQldw?=
 =?utf-8?B?RjQzd3ptNDhUUEhzN3NGNFpJZk12WE4xRlVWTDJjQTZseUNLaWd5QTlacUYx?=
 =?utf-8?B?VXdKcDlPbDNhR283c2c4N0lJSUdLcEV6dG9tVlBQMTlwUVZXcHBGblRzZXVR?=
 =?utf-8?B?VlNONzRxLzFpSjlxY1J2aDN4YktXbUFEbENodU0vQ3FLVUU5d01UMXJUZlJr?=
 =?utf-8?B?QlNGbmtjOG92NTJaa1Z2bkRvTXJZSGNGZjR2dlBUWTE2THRTdG9IbmpwR3hP?=
 =?utf-8?B?aHJKMTNxc0tZanVHRG9DNVdnZGYySEE5OEpOWmYzVjlydWhTS0M3VU1UbGhs?=
 =?utf-8?B?bXZsOEM4NGxCRkgvVnNjNWw4ZWpMcmVKUVJLOFlOWmNubWhoVGJRTHRVS2pZ?=
 =?utf-8?B?dmpJQkdZVUp6V2h1R0lTeHd4dkZPYjdkcDhGd3V3TVNEeC9yZ2V6cnlJTGNM?=
 =?utf-8?B?UG5BbHZ4RXJJV2ZRQVphN2lQMU9EcHZxb3V0STRHdmhPZUxTcU9PU1ErVGRk?=
 =?utf-8?B?QXFBREFoYmtvNEh4WXFCeFdSUGdQL2VNUmpSRUR2dEdRaGVyelhSamN3L1dK?=
 =?utf-8?B?TXY0ZlJxS2g4NW5nVm1nQUxrZmJRWGNTVUxvbWJFMC9UMEJkTVd0ZjRKVTZ1?=
 =?utf-8?B?RXovRVAzcXJSRHhmTzZ2cnhEMWlyc21MWjVEZkRONU0vb1JNUU8wMWErVTYr?=
 =?utf-8?B?cFlNODA4Z2VOeTRuZHNZRDh6Tkt3WVJRN1A4azVkVEdaZ3l4RXFqNGRXZHhk?=
 =?utf-8?B?MStzOUFlOTlpa2hCVHptTjVsK0x3bUNGVmQwYmxFMm4wZHk4aUs5L2FCeWxG?=
 =?utf-8?B?cmJCazB5Nmp2SThFTHBRbXo1NU5KVXRSV1Fad3d4d05BOTVoN0VidWg0bTBi?=
 =?utf-8?B?L0VBVzJSRW9TQ3ZKWCtEM3FnZVBVcTdlVDBIVXlrUlVUb1lYSHVtMDVFOU0x?=
 =?utf-8?B?NWNQbWZOT3N4QkdZOWRVV3VQTHAzcWU2Y1BJdGovaEY2Y2lFa0VoRlkvaWN1?=
 =?utf-8?B?MHdUUms1SWdLa1dMZW9hOWxKdkdLTkZCNkJtekUrNFlxUEk0ZWN4cUc1R3M2?=
 =?utf-8?B?Q21sL3dla3k0YUpGY28raWRETXlhSzhnSkY4cXpCdXZ2TEo4aVI1UXJrUERE?=
 =?utf-8?B?bmFEM1VwZ2oraDBHaDlSWTljV0djMVREM25FdEtJTlF5eFdDMzNrRWdoMThW?=
 =?utf-8?B?RmRPVkxXdjhCaE1Jam04TzZVVndRYzRpOXJqemoyT3IzV3EzajhUQkg0RElT?=
 =?utf-8?B?NUhwSVo3WW9WQnVkaXcvdklGWWhkaEtPdUVMQXBhcWFrRTlNeGlpT3doT3Zq?=
 =?utf-8?B?QW44NW5JVmJFanJWUm5xdnFvc2cxa09xSHRzL1pLd1Jvbnd0cUhxdXErZnlp?=
 =?utf-8?B?WU9mdUpjZjBGb1VHOFRBUEkxSVVPYVA0VlZoVG1GNTF5ZFNZVVc4eUt1NzZ3?=
 =?utf-8?B?aFhpZXFQb3A2bm1JN3BRdlhVUzVQL1daUGNBRURQSjhHYWsrZTdHZGxkb2Er?=
 =?utf-8?B?dGIxK2trSFhqQk5JUDV3bkJ4K3VXMHpHR3NPeEREZjVybnFNMjYvWlc5TUtu?=
 =?utf-8?B?YVowWmxVWllObUpJOWNCZnViQUVZWXdkY3M5REIrSVpwTWduMXd0NTBHalhK?=
 =?utf-8?B?b0lHY2pMQk55ZXVvVXdBWWdQTmxuclpET21lRFFqVW5Rc1Fad1lWNzdHRzNT?=
 =?utf-8?B?QnpReStFdklWVHZEcVhjaEpZSC8wZDA1MjV1clN1eElaUHZkY1FQK051Y0tO?=
 =?utf-8?Q?Vi8Z/HkQVvZdPgY8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <670F263C3A02BC4A99E0789362560B6D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: osNfSPJ2NDddJsyHz8+kig4MuB/OiJ6bn8elDGMd9XEkY+PsspYXPG1Z4G7uaZeQzy+ZKyLtcZNher9+Vr67apPnebpZG4TMOkHI3xqx2enbATQFFEA9EcLD485X7PboGUN9kZ4mVzOFPv20APs99QBVymW1bdeSin8sIyjkIqJMb+Kk/YPD9ak9qtol+kJDimJQ8ODhhl8/0X/k35+QfHs8J0nDIrc80314Ijr1sngox6bso5kY4SY/50tBVUzr4pbJBdJfL5CN7JCgka84FJMZV3DtSGNuLO1l3Fh6MegsnoHNGUTcESX+KbZALKMxPCvvic0qyeiXSRuPKYAMzQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ced63e-e9a0-45f8-e33c-08deb7ae133b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 02:59:00.7454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h6Bq+GdqTa8AeV4c+lYd3onO7+KTNMjVS3TUSGCRYD/nETJvFw6BS7C5llfOmPfA9/o+GCft3+d4PiyiuR0YeyuEemkPx+7u0f/qvsgXRiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7182
X-MTK: N
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

T24gVGh1LCAyMDI2LTA1LTIxIGF0IDEzOjM5ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFRodSwgTWF5IDIxLCAyMDI2IGF0IDAzOjAxOjI1QU0gKzAwMDAsIEphc29uLUpIIExp
biAo5p6X552/56WlKSB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMjYtMDUtMjAgYXQgMTY6NTAgKzAz
MDAsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToNCj4gPiA+IE9uIFdlZCwgTWF5IDIwLCAyMDI2IGF0
IDAyOjQ2OjI2UE0gKzA4MDAsIEphc29uLUpIIExpbiB3cm90ZToNCj4gPiA+ID4gVXNlIGlndF9k
aXNhYmxlX2NwdV9kZWVwX3NsZWVwKCkgdG8gcHJldmVudCBDUFUgd2FrZXVwIGxhdGVuY3kNCj4g
PiA+ID4gdGhhdA0KPiA+ID4gPiBhZmZlY3RzIHZibGFuayB0aW1lc3RhbXAgYWNxdWlzaXRpb24u
DQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlzIGFkZHJlc3NlcyB2YmxhbmsgdGltaW5nIHN0YWJpbGl0
eSBpc3N1ZXMgb24gTWVkaWFUZWsNCj4gPiA+ID4gcGxhdGZvcm1zDQo+ID4gPiA+IHdoZXJlIENQ
VSBlbnRlcmluZyBpZGxlIHN0YXRlcyBjYW4gY2F1c2UgfjIwMHVzIHRpbWVzdGFtcA0KPiA+ID4g
PiBqaXR0ZXINCj4gPiA+ID4gYW5kDQo+ID4gPiA+IHRlc3QgZmFpbHVyZXMuDQo+ID4gPiANCj4g
PiA+IENhbid0IHlvdSBmaXggdGhlIGtlcm5lbCB0byBnZW5lcmF0ZSBhY2N1cmF0ZSB0aW1lc3Rh
bXBzPw0KPiA+ID4gDQo+ID4gDQo+ID4gSGkgVmlsbGUsDQo+ID4gDQo+ID4gVGhhbmtzIGZvciB0
aGUgZmVlZGJhY2suDQo+ID4gDQo+ID4gQ3VycmVudGx5LCB0aGUga2VybmVsIHRpbWVzdGFtcCBp
dHNlbGYgaXMgYWNjdXJhdGUuIFRoZSBpc3N1ZSBpcw0KPiA+IHRoYXQNCj4gPiBldmVuIHRob3Vn
aCB0aGUgdmJsYW5rIElSUSBmaXJlcyBhY2N1cmF0ZWx5LCB0aGUgdGltZXN0YW1wIGNhcHR1cmVk
DQo+ID4gYnkNCj4gPiBEUk0gY29yZSB2aWEga3RpbWVfZ2V0KCkgaW4gZHJtX2NydGNfZ2V0X2xh
c3RfdmJsdGltZXN0YW1wKCkgY2Fubm90DQo+ID4gYXZvaWQgdGhlIGRlbGF5KHJhbmRvbWx5IH4y
MDB1cykgaW50cm9kdWNlZCBieSB0aGUgQ1BVIGlkbGUgZXhpdA0KPiA+IHNlcXVlbmNlIGJlZm9y
ZSB0aGUgSVJRIGhhbmRsZXIgY2FuIGFjdHVhbGx5IGV4ZWN1dGUuDQo+ID4gDQo+ID4gQWZ0ZXIg
bG9va2luZyBpbnRvIHRoaXMgZnVydGhlciwgSSByZWZlcmVuY2VkIGhvdyBJbnRlbCBoYW5kbGVz
DQo+ID4gdmJsYW5rDQo+ID4gdGltZXN0YW1wcyBhbmQgbm90aWNlZCB0aGV5IHVzZQ0KPiA+IGRy
bV9jcnRjX3ZibGFua19oZWxwZXJfZ2V0X3ZibGFua190aW1lc3RhbXAoKSB0b2dldGhlciB3aXRo
DQo+ID4gZ2V0X3NjYW5vdXRfcG9zaXRpb24oKSB0byBjYWxjdWxhdGUgYWNjdXJhdGUgdGltZXN0
YW1wcyBieQ0KPiA+IGNvbXBlbnNhdGluZw0KPiA+IGZvciBJUlEgaGFuZGxpbmcgZGVsYXlzLiBQ
bGVhc2UgY29ycmVjdCBtZSBpZiBJJ20gd3JvbmcgOikNCj4gPiANCj4gPiBIb3dldmVyLCB0aGlz
IGFwcHJvYWNoIHJlcXVpcmVzIHRoZSBoYXJkd2FyZSB0byBwcm92aWRlIHNjYW5saW5lDQo+ID4g
cG9zaXRpb24gaW5mb3JtYXRpb24uIE9uIE1lZGlhVGVrIHBsYXRmb3JtcywgdGhpcyBoYXMgbm90
IGJlZW4NCj4gPiBmdWxseQ0KPiA+IHZhbGlkYXRlZCB5ZXQsIHNvIGRpc2FibGluZyBDUFUgZGVl
cCBpZGxlIHN0YXRlcyBzZWVtcyB0byBiZSB0aGUNCj4gPiBtb3N0DQo+ID4gYXBwcm9wcmlhdGUg
c29sdXRpb24gZm9yIG5vdy4NCj4gDQo+IFRoZW4geW91IHNob3VsZCBwcm9iYWJseSBkbyB0aGF0
IGluIHRoZSBrZXJuZWwsIG9yIG5vdCBhdCBhbGwuIEkNCj4gZG9uJ3QNCj4gdGhpbmsgYWRkaW5n
IGhhY2tzIHRvIG1ha2UgdGVzdHMgcGFzcyBtYWtlcyBhbnkgc2Vuc2UgYmVjYXVzZSB0aGVuDQo+
IHdoYXQNCj4geW91IGFyZSB0ZXN0aW5nIGRvZXNuJ3QgbWF0Y2ggYW55IHJlYWwgd29ybGQgdXNl
IHNjZW5hcmlvIGF0IGFsbC4NCj4gU28gYWxsIHlvdSBhcmUgZG9pbmcgaXMgc3dlZXBpbmcgdGhl
IHByb2JsZW0gdW5kZXIgdGhlIGNhcnBldCBkdXJpbmcgDQo+IHRlc3RpbmcsIGJ1dCB0aGUgcHJv
YmxlbSBzdGlsbCByZW1haW5zIGFuZCB3aWxsIHN0aWxsIGJlIGhpdCBkdXJpbmcNCj4gYWN0dWFs
IHVzZS4NCj4gDQoNCkhpIFZpbGxlLA0KDQpUaGFuayB5b3UgZm9yIHRoZSBmZWVkYmFjay4NCg0K
WW91J3JlIHJpZ2h0IC0gdGhlIHBhdGNoIHdhcyBwdXJlbHkgdG8gcGFzcyBJR1QgdGVzdHMsIG5v
dCB0byBmaXggYQ0KcmVhbCBwcm9ibGVtIChhbHRob3VnaCB3ZSBoYXZlbid0IGVuY291bnRlcmVk
IGFueSBpc3N1ZSB3aXRoaW4NCnJhbmRvbWx5IH4yMDB1cyBqaXR0ZXIgb24gb3VyIGN1cnJlbnQg
cGxhdGZvcm0pLg0KDQpJJ3ZlIGludmVzdGlnYXRlZCB0aGUgcmVhbC13b3JsZCBpbXBhY3Qgb2Yg
dGhpcyB+MjAwdXMgdGltZXN0YW1wDQpqaXR0ZXIuIEluIG91ciBjdXJyZW50IEFuZHJvaWQgU3Vy
ZmFjZUZsaW5nZXIgaW1wbGVtZW50YXRpb24sDQpyZWFsLXdvcmxkIHVzYWdlIGlzIHN0YWJsZSB3
aXRoIENQVSBkZWVwIHNsZWVwIGVuYWJsZWQuDQpJdCBzZWVtcyB0aGlzIGlzc3VlIG9ubHkgYXBw
ZWFycyBpbiBJR1Qgc2luZ2xlLUNSVEMgdGVzdGluZyB3aGVyZSBDUFUNCmVudGVycyBkZWVwIHNs
ZWVwIGR1cmluZyBpZGxlIHBlcmlvZHMgYmV0d2VlbiBmcmFtZXMuDQpUaGVyZWZvcmUsIHdlIHBy
ZWZlciBub3QgdG8gZGlzYWJsZSBDUFUgZGVlcCBzbGVlcCBzeXN0ZW0td2lkZSBpbg0Ka2VybmVs
IGR1ZSB0byBwb3dlciBjb25zdW1wdGlvbiBjb25jZXJucy4NCg0KSG93ZXZlciwgSSdkIGxpa2Ug
dG8gdW5kZXJzdGFuZCBob3cgdGhlIDEtc2NhbmxpbmUgc3RhbmRhcmQgd2FzDQpvcmlnaW5hbGx5
IGRlZmluZWQgZm9yIHRoaXMgdGVzdC4gRG8gcmVhbC13b3JsZCB1c2UgY2FzZXMgYWN0dWFsbHkN
CnJlcXVpcmUgdGhpcyBsZXZlbCBvZiBwcmVjaXNpb24/DQoNCk5vdCBhbGwgcGxhdGZvcm1zIHN1
cHBvcnQgb3IgaW1wbGVtZW50IGdldF9zY2Fub3V0X3Bvc2l0aW9uKCkgLQ0KY291bGQgdGhlIHN0
YW5kYXJkIGJlIHJlbGF4ZWQgZm9yIHN1Y2ggcGxhdGZvcm1zPw0KDQpCZXN0IHJlZ2FyZHMsDQpK
YXNvbi1KSCBMaW4NCg==
