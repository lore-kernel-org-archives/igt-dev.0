Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52C4C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 15:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4F510E5B4;
	Tue, 28 Jul 2026 15:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Sip4Y6RL";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="RKbpKY7u";
	dkim-atps=neutral
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E0210E5BC
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 15:45:17 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66SFDnpr2803572; Tue, 28 Jul 2026 16:45:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=zktfu5QGCWfVHvbmboWrPLG11Svxzm4aBuhdABTReCc=; b=Sip
 4Y6RLJoUr+ercEfyMuorF2j+iicdmiOa+fFIO0JJUnfcCpwAIXHp0owr+PSFaDEC
 mdldWqG+qiTppByslDvbhauzObePTO0s2RsrrvBgH4c8QLJ5wIXYt18wrulB0W0O
 5UOdDeMoYXdq5EtO+1ZuOLcBNQH6uQ4aeIa0/r3WzFQS2hmrDoxv+ZH6TPvPyaWI
 Z/omxqUteoXdlpLHez+p0ir5eObv+W8q0hMe8HijISsiMVFBKDqqVBmgVvftabqS
 YZg06SnA1hgHqnieldSkyq8liRZNPbAiAWB9YQMfMA/saz80jMtV1eo96B00q6oF
 4z5xDc64ghZZU6Ad4bw==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021075.outbound.protection.outlook.com [52.101.100.75])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4fptwu07pe-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2026 16:45:11 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKyMQLDKJx1TGX0Sy0r6M207EMaf4CsRJf4gqzDH+loaf5/yXZS30qjeaTfpOi+PYc40vD6v4MvDPNXzLW8Z5AbTxw58tkqiTWBgorzttIgp0u2znuM4O4BBgc6BD655XDde+KCwNytLh2gEeESW7xW6pUgX3zfJDTI1M0rytTypowAxBPl0ziOHpU/OjZly74bYYQfDNzhbH+3/I+Yd/dLpmudVfZQY2sDY715v1N3cZMg5p6778tq3Kdrjg/m1IeHKyssX3FTqECfq76mMIOEEOsnlC1iUi87AZKEM9EBOopCqVNI+QYtv5lW1ega3AxZkqyN3nxkkkNibcpu4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zktfu5QGCWfVHvbmboWrPLG11Svxzm4aBuhdABTReCc=;
 b=ZcPqFqu2zA5G+o7mILlLItZhEdKa/CZImnLlOSq4u7WJRQifVDblQlAnNS4WSwsCpdeN48mplbItUgF2qFQoS+uha4kuNhtt61vikB72Qyko01h9u/bxFA2bstKhV4MI9z7Pue0Y7ZlNNR56rw1qfVmJTkloBpVYBX8hkOv5Z6D47I98OV43qw1VfooebgOdcv7Oj9bqNTNj8GxgMetyK6TP82Bsjmg1X2NeTpPZhgzvTkmM1MMQakf6lZEjoWhNyzSCpxefr1h4FgWiHgdcNiOgy+JEmiv9AtohKOUEXKCVbw6bs2mnaCqORxZf9UcE6gVPj3EFTWBvu1yoTXKIZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zktfu5QGCWfVHvbmboWrPLG11Svxzm4aBuhdABTReCc=;
 b=RKbpKY7uSTLDokpWt8TSBfTvfa1+BKkGoPnwUka52xa+88HU56ZtEeuuUFqw/s6AAYCCN4/N0cDevfkOTft24dBvKG2Otxtcqfn2aFjf9AqV6Yc2E5lMSJwLq9lA+Z1l6Vq/hV1QC08tqcf1F9+O+wccaER6LfJC/pkPewgpakE=
Received: from CW1P265MB8667.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27e::15)
 by LO0P265MB5699.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:260::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 15:45:05 +0000
Received: from CW1P265MB8667.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d42c:82bf:d426:2147]) by CW1P265MB8667.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d42c:82bf:d426:2147%3]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 15:45:05 +0000
From: Brajesh Gupta <Brajesh.Gupta@imgtec.com>
To: Robert Mazur <Robert.Mazur@imgtec.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, Luigi Santivetti
 <Luigi.Santivetti@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 00/10] tests/imagination: Add initial test
 coverage for Imagination DRM driver
Thread-Topic: [PATCH i-g-t v5 00/10] tests/imagination: Add initial test
 coverage for Imagination DRM driver
Thread-Index: AQHdHmFowaSgLgU2h0yl+ct2dUOGpLaDEz0A
Date: Tue, 28 Jul 2026 15:45:05 +0000
Message-ID: <91eac37f1e1a31cac4ac6d6c856f89555af93785.camel@imgtec.com>
References: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
In-Reply-To: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CW1P265MB8667:EE_|LO0P265MB5699:EE_
x-ms-office365-filtering-correlation-id: 67f3c142-b3e0-48f7-d6b9-08deecbf3204
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|23010399003|1800799024|38070700021|6133799003|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: nXEiQK6roB2W1e4QUhmdUc515yyyDeJDvftOnGQICiE2nNmwa2M4XjjePkRQeSQLY8HByQmBmPT/975aDokiJAUOFjR+fV4T9SkVwqsChl1SNAU4zQS/w6D3JQ2aQhjGOzrh3BeXFYvGVEokOg1f03MdK3EOIOnIqVzPNavv1oWq9G11CVxoZuQupquNeWqxifuJW2UYley7WCMM+vhGa3YkL+yRkbWVu292es0C8/aS4aP4IJFnbTkoWBf1IeufCpK9MHwNCmJu2ZIvSjWePL4UgbOaCq0fwJNugH2bDevsvqITJSAOpeAnDUMMYxfq9z54rZlkG65m6eVukWc//GUA6N/sokAdiVOB0yObo/XW1BXc4tdJhGyAzPqTdY7Z0S6XfV3mnjX3c80RJbyFUBMGQeEoJ/4i5yPFwsQurHxK/x561g7xYyi8TZbfFMjYumMwMkqAPgjVgpFDCfOGtFpyHWzU9uNkXELOA1eHLmH3CTo/D+xml2Dys9dSFW/ecfj6IE7oHDFYK7/1Z+a71FOzRm8eMkFZlYEjAMJpx30Cpg6D25mSmKSzJySF/2tBtyut7/0IiCx9SeI1xdFp+4VnTWqVRSMRGEfI4x+6QCQzWM5moxza4krPBfVzMGGaeqGdb8+V4JNkJtlbX+vY1OlzUSCLocbkaSCEXVa2Ta7wHg52nuQl+vC9Cgx4n3lfOE6vsPTQ5OkYUUaNI4V5LHxzzEkrFSpLiE4i3hdlEII=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CW1P265MB8667.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(23010399003)(1800799024)(38070700021)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEhDbitjM1VQMDRwSmZnbXRvNTFCN0pzbGg5WEhqZ3NpRVBmMk12UkRlYzBl?=
 =?utf-8?B?OElxdzVDVGU1Y1Bkd3AwdHRTZFAraU1DeTMxNzl5WThXU1ZCWnM3a1ZYcm1w?=
 =?utf-8?B?WER6bEcrRzlHLzVSSFJoREJYY0lBOXk4SnhmRG9zaWgvQW1WZnZwQ25hWTM0?=
 =?utf-8?B?WHVaT3hhZXM5enZNRjE1ajRoam44WCt5WUdwM2ZpaWtFa1BrQWwvdC9ORjRG?=
 =?utf-8?B?MkZadVUyekFpWG1MK1EySlJiUU1wRklwYW5pbFBMSm5sdXRESitMSlhyTUYz?=
 =?utf-8?B?SUExcGV6WTI3TDZpa3ZVb0sreGlaN3pobWczUG5UWjlYRW9xbzN3QVN2eDVN?=
 =?utf-8?B?SCtoYzZ6VzBNbVJNRUMxS3NTc082TmQ3Z3VWMitlVkkyQ09BOTRBSHNzQkd6?=
 =?utf-8?B?Q1JtalVHYkl1UHZ3NDQ5TkYxMnNiMGp1QWpXN3k0SnRxUWdKNGNCSDRpMm1n?=
 =?utf-8?B?WSs4YmlFS2k4NjlSaGFoSmd6TmxTVjRjbEZRcUhDV1pER0xUVXNoNzFiM0pr?=
 =?utf-8?B?YXJuSStzQmpHeWdvdllERCtiaFR0ZG1VbXJ5Z2JWeFZyVGZxL01teVBjSHNn?=
 =?utf-8?B?bERBMWZUUElrdi91STV5ZmltK2ZXS21qc0ZDTEIyQ2EwV0x1S3MwV3VpM0J4?=
 =?utf-8?B?cFhrWnpkdk5zQnF5M2hIZU5qZTk2UGJpTVFFbUhhcURCSFFFbUd3cVlnQ21C?=
 =?utf-8?B?aldwM0FyNVIycTRPZ1I4dno1SjQ0OGh5emIzSzBPTmd0TkRaVHBNdjF2M0xR?=
 =?utf-8?B?UG4zMlowSmJ5dWl0bHZTVEVxcTB4QWxLbUh1b1BNMi9JUUtxWXZmT0dqVVRP?=
 =?utf-8?B?WDBSbG9RT0JmWlVNR25aUFU5ZVArRVFUQTFva2Y5TmZqczVLTjk5M3NnOHRa?=
 =?utf-8?B?TWJqbE5vbkRuaWlIbE5Cdno0RDE0Qng5bkdGRkdDMTNReVZtS3AvaU90dUVC?=
 =?utf-8?B?UVZBZmE0K3dpaFhjcGdlSkxjTVhzclhYMmdDODRsazBER2VDNElZYzhMWkQz?=
 =?utf-8?B?M21ZSkY3blZCbE16Vm1CNjk2UUJDNldGR0Y0aWhuVDFrQnZOaXp1eWx6Tmp4?=
 =?utf-8?B?NVkxcU9mMHBPdC9vNTRGa3M1Q2R3UFE4UGhVYUF3WUdla1U2QVR2eTV3cEZS?=
 =?utf-8?B?TjY1RUo4WFkzUGNwdWhHYmJUUlZWdGx1UHpSRHhSaTlpUFFJLzZsWkh6RU5o?=
 =?utf-8?B?L2FmOTYwUGJXcVNSMDFKRURReW14UXlHL2ZBcE5yeEhOWnU5MXVxbXdtODhl?=
 =?utf-8?B?ZVpyM1YwcGFmTWZyK0FaYkY0QmlJRktjUEJETGlnSFNDcWMwalFHeVhqamhC?=
 =?utf-8?B?SWp5RjRYRW4weVhCOFROeEFJeEJkZjhYdzA4VVhkak1PRUNuckpxRnZEZG1t?=
 =?utf-8?B?Z21PclF2QXpOakxNL2VPM00xTkdTRkFndlVJM2ZodjVweTZzV2w0UGhCazA0?=
 =?utf-8?B?MGxucWlUZDRoL2p1YWhBVWxJQ1owQWV3L0NpV2o5WnEyR3prblpXMTRaK2ti?=
 =?utf-8?B?SUlMR3VhWkJHM1RJOUF5MGE1bko3ZFA3YzZ0UCtGQUw0Qk5iaExjT0YxRjZP?=
 =?utf-8?B?TG1RYmhoZlE0ZElIdUczblYyUlJ6Rm41dlpadmpqWWJpYzNFWTVrSSswL09r?=
 =?utf-8?B?bE1vMlRSVnB0d0JJMi9rdEhCYVd4TzRtSWc3SFR1YlZZL0tmdHdqRGxwazlL?=
 =?utf-8?B?dGU2WlZmNVZaRTRGbCs3akZUSFUrZUM3SlExa21MeTZjVXBTZ2x5S2ZxaEps?=
 =?utf-8?B?SzlkNGZSbWNyTjIwUTU3dzZXYjFSTXNZSGZlaDJnQUx3VXBVbHhlblFQNXZl?=
 =?utf-8?B?WjRQOVhzQThqTEpnVHpQaWNLYXhhZ1J5em5OdjdHQldsNHhpRTJablF2QWFy?=
 =?utf-8?B?QXJldW14UGIxRmpJd1VkaG9WMWZmQ1hkb255dE1MdGw5eFEydzNQSjdqOERL?=
 =?utf-8?B?ditrRVp2c05nNFJ3V2djYWJHZWpXVmtXUXRLTjdETklSRlEzeWdCc0c4NXBX?=
 =?utf-8?B?Z3Jqa2pQRWIzVFlhQ2hqM1pPS1RPVFN4bmo5UFkySktGcGp4R0o5cVhxUUV5?=
 =?utf-8?B?SlpQc3RQbTR6ajdPQ2E0SDIyVEl2aG8xaDNoOHYzeEFPWUVUeEFHYm1zZmNs?=
 =?utf-8?B?YTRkeDVEeCtMb1M5ZUozV1lzVURqSW9uTW9NMnhVMGVRdzB3cktGVEhHRXVL?=
 =?utf-8?B?S0hMU3F1ZzBLdVFFNzBqS0ZieEFGWWduR0F1QnU3c3NRNDVlNzExamlJeTho?=
 =?utf-8?B?UFh3ZDl5YjdKVG8wcFFwU1hDSEVNK3VQVmNXYVNwaXc4b2ZyU1pIeVVneHpx?=
 =?utf-8?B?eG5KMTZBZmJjdm9BSXlVMlhtSUpiTndyR3RMSEhrTEZaMXl1NmYyVkVCS2Q0?=
 =?utf-8?Q?UzRp8W7MOwVWjLpqFJcMUkwh8e1E1vv1LS0a1D5C6Ixen?=
x-ms-exchange-antispam-messagedata-1: M/+wS8BKdRjypFzL1gAvTqyXD5tAfbfMn5g=
Content-Type: text/plain; charset="utf-8"
Content-ID: <565CC3EC011436459B34C716B2AFC3CF@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bqTlJ89zbn9OnRfaAoZaK6JlX+q+HxKFfzFTAJiWLr8ZmVggg0I6u5vlAkEd4EHI8u0opt7DLCB/xbc9veq7tGMeiwqcBsD81pVHdNbVkp7RsKA0ug24Tzx9GSFpYPVuTR3fwLbbCb3YLBbyrPVbx7UoqC40IWEWfrprOhGh/o9tNKZqgUsahorbq1aOEQEfcA68spls1dxmQ8XfMfXEAW+/3bFXYYbCxHi6WPDGrGhkYioF/EyI18vUr1EiVEu3ERVlBBwiE2SU8nvOTFuRRc14KD5CeYRc4PgTdywEUK6hMUD05TGpbKHaXF9F11FMc+hn9tf0CY6LZRjPD9l+Mw==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8667.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f3c142-b3e0-48f7-d6b9-08deecbf3204
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 15:45:05.4889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: njXt6S5ws5mb+S3zaNBbLgv11nnCYFuwTAhgsuIBb6ACGBFqYrKGZIx6tmMcR5kKXF5hZsPgC27WIx2lq80uAk3A1vWVjJwY1MiDpu98Vgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5699
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEzOSBTYWx0ZWRfXzcoxBH3oe4ez
 qz61Modd6hZjAQYURGtheST9pRJIN+TuZuj0s4sF+wZChq5nYsuAzFgPqHwdgf+azDRzYdqH251
 Zeskj7E0iZ+27m1snusqCvQYU8BCzDMw8m0ZTJSRWxFSDcrfnkApCGjdyGlx1DYUZB9XRj8Qnbi
 ApIFYz9LfyrE/uho6fSz3ReLb1uLGEH6HUpnGooLix96EvnJHDPtONd5IFx1x7gtFKK9kE0BAYH
 EYeXtoi+z4rrOPqomkjB6ajzx1TcXtER1CRlCXjRb9X/qDg0k6KCUJCX9fR53vr6V2ihfCMQmU9
 3jaQCJVTbVyNz+OdTPVyNaH1NUW6252qjwO+HUoeTC+bpAyKLnI0clkvYTccfCy0BxD1Se+rLqi
 o7UVrUjfDj8EAP2segzJ0hgz0LUKPA==
X-Proofpoint-GUID: 9--9r4IYBAayhdXVMUaEoAyWv_Gj-gen
X-Proofpoint-ORIG-GUID: 9--9r4IYBAayhdXVMUaEoAyWv_Gj-gen
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEzOSBTYWx0ZWRfX7Jw8qVKw3p8h
 6xGiQayumGQuZEqQY3rs5YnnpJnYn5ok3SbMHJ3IlU4XH37QlzNt1ML/vU4yAiK/8SZbXpdMVO+
 fHD/M7B0lQJrvAVZ5SnQpCcCiJptBBM=
X-Authority-Analysis: v=2.4 cv=KtF9H2WN c=1 sm=1 tr=0 ts=6a68ce87 cx=c_pps
 a=EdwMp9gruEUstxkzpltQuQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=hPRnIGH483lk0uwOpk8A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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

T24gVHVlLCAyMDI2LTA3LTI4IGF0IDA5OjE4ICswMjAwLCBSb2JlcnQgTWF6dXIgd3JvdGU6DQpI
aSBSb2JlcnQsDQo+ICoqKiBOT1RFOiBUaGlzIGlzIGFuIGludGVybmFsIGVtYWlsIGZyb20gSW1h
Z2luYXRpb24gVGVjaG5vbG9naWVzICoqKg0KPiANCj4gDQo+IA0KPiANCj4gVGhpcyBzZXJpZXMg
aW50cm9kdWNlcyBhIG5ldyBJbWFnaW5hdGlvbi1zcGVjaWZpYw0KPiBzZXQgb2YgdGVzdHMgY292
ZXJpbmcgY29yZSBkcml2ZXIgZnVuY3Rpb25hbGl0eSBleHBvc2VkIHRocm91Z2ggR0VNIGFuZA0K
PiBJT0NUTCBpbnRlcmZhY2VzLiBUaGUgdGVzdHMgZm9jdXMgb24gdmFsaWRhdGluZyB1c2Vyc3Bh
Y2UtdmlzaWJsZSBBUElzLg0KPiANCj4gVGhlIHNlcmllcyBpbmNsdWRlczoNCj4gDQo+ICAgLSBJ
bWFnaW5hdGlvbiB0ZXN0IGZyYW1ld29yaw0KPiAgIC0gR0VNIG1tYXAgY292ZXJhZ2UNCj4gICAt
IERFVl9RVUVSWSBBUEkgdmFsaWRhdGlvbg0KPiAgIC0gR1BVIElEIHZlcmlmaWNhdGlvbg0KPiAg
IC0gSGVhcCBpbmZvcm1hdGlvbiB0ZXN0cw0KPiAgIC0gU3RhdGljIGRhdGEgYXJlYSB0ZXN0cw0K
PiAgIC0gVk0gY29udGV4dCB0ZXN0cw0KPiAgIC0gRnJlZSBsaXN0IGNyZWF0aW9uIHRlc3RzDQo+
ICAgLSBIV1JUIGNyZWF0aW9uIHRlc3RzDQo+ICAgLSBSdW50aW1lIGluZm9ybWF0aW9uIHRlc3Rz
DQo+ICAgLSBRdWlya3MgYW5kIGVuaGFuY2VtZW50cyBxdWVyeSB0ZXN0cw0KPiANCj4gVGhpcyBl
c3RhYmxpc2hlcyB0aGUgZm91bmRhdGlvbiBmb3IgZnV0dXJlIEltYWdpbmF0aW9uIGRyaXZlciB0
ZXN0aW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IE1henVyIDxyb2JlcnQubWF6dXJA
aW1ndGVjLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjU6DQo+IC0gUmVzZW50IGR1ZSB0byBt
YWlsIHNlcnZlciBpc3N1ZXMuDQo+IC0gTGluayB0byB2NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI2MDcyNy10ZXN0LWltYWdpbmF0aW9uLWFkZC1zdXBwb3J0LXY0LTAtYTNkYmUwMzgy
NDM3QGltZ3RlYy5jb20NCj4gDQo+IENoYW5nZXMgaW4gdjQ6DQo+IC0gQWRkZWQgQWNrZWQtYnkg
dGFncyBmcm9tIEthbWlsIEtvbmllY3pueS4NCj4gLSBTd2l0Y2hlZCBERVZfUVVFUlkgaGVscGVy
IHRvIHVzZSB0b191c2VyX3BvaW50ZXIoKSBpbnN0ZWFkIG9mIGEgZGlyZWN0IHVpbnQ2NF90IHBv
aW50ZXIgY2FzdC4NCj4gLSBGaXhlZCB1c2Vyc3BhY2UgZXJybm8gaW5jbHVkZSBpbiBWTV9DT05U
RVhUIHRlc3RzLg0KPiAtIFNpbXBsaWZpZWQgaGVscGVyIGZ1bmN0aW9uIG5hbWluZyBhbmQgbW92
ZWQgZmlyc3QgcGFyYW1ldGVyIHRvIHRoZSBzYW1lIGxpbmUgaW4gZnJlZSBsaXN0IGFuZCBIV1JU
IHRlc3RzLg0KPiAtIEZpeGVkIGZvcm1hdHRpbmcgYW5kIGtlcm5lbC1kb2Mgc3R5bGUgaXNzdWVz
ICh3aGl0ZXNwYWNlIGFuZCBjb21tZW50cykuDQo+IC0gSW1wcm92ZWQgY29tbWl0IG1lc3NhZ2Ug
d29yZGluZyBpbiBERVZfUVVFUlktcmVsYXRlZCB0ZXN0cy4NCj4gLSBSZW1vdmVkIGFuIGV4dHJh
IGJsYW5rIGxpbmUgaW4gcnVudGltZV9pbmZvIHRlc3RzLg0KPiAtIExpbmsgdG8gdjM6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA3MTctdGVzdC1pbWFnaW5hdGlvbi1hZGQtc3VwcG9y
dC12My0wLWNlNjlmOWFkMzMwY0BpbWd0ZWMuY29tDQo+IA0KPiBDaGFuZ2VzIGluIHYzOg0KPiAt
IEFkZGVkIGRlc2NyaXB0aW9ucyBmb3IgdGhlIGxpYnJhcnkgZnVuY3Rpb25zLg0KPiAtIE1vdmVk
IHN5c3RlbSBoZWFkZXJzIHRvIHRoZSB0b3Agb2YgdGhlIGluY2x1ZGUgbGlzdC4NCj4gLSBTd2l0
Y2hlZCB0byBkcm1fZHJpdmVyX2Nsb3NlKCkuDQo+IC0gRml4ZWQgZm9ybWF0dGluZyBpc3N1ZXMu
DQo+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDcxNy10ZXN0
LWltYWdpbmF0aW9uLWFkZC1zdXBwb3J0LXYyLTAtZTFiZjQxNWFkY2VlQGltZ3RlYy5jb20NCj4g
DQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gRml4IHRocmVhZGluZyBpc3N1ZQ0KPiAtIExpbmsgdG8g
djE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA3MTctdGVzdC1pbWFnaW5hdGlvbi1h
ZGQtc3VwcG9ydC12MS0wLTJmMDJmOWNjM2I1M0BpbWd0ZWMuY29tDQo+IA0KPiAtLS0NCj4gRG9u
YWxkIFJvYnNvbiAoNSk6DQo+ICAgICAgIHRlc3RzL2ltYWdpbmF0aW9uOiBBZGQgREVWX1FVRVJZ
IHRlc3RzDQo+ICAgICAgIHRlc3RzL2ltYWdpbmF0aW9uOiBBZGQgREVWX1FVRVJZIHN0YXRpYyBk
YXRhIGFyZWEgdGVzdHMNCj4gICAgICAgdGVzdHMvaW1hZ2luYXRpb246IEFkZCBWTV9DT05URVhU
IHRlc3RzDQo+ICAgICAgIHRlc3RzL2ltYWdpbmF0aW9uOiBBZGQgREVWX1FVRVJZIHF1aXJrcyBh
bmQgZW5oYW5jZW1lbnRzIHRlc3RzDQo+ICAgICAgIHRlc3RzL2ltYWdpbmF0aW9uOiBBZGQgREVW
X1FVRVJZIHJ1bnRpbWVfaW5mbyB0ZXN0cw0KPiANCj4gRnJhbmsgQmlubnMgKDEpOg0KPiAgICAg
ICB0ZXN0cy9pbWFnaW5hdGlvbjogQWRkIEdQVSBJRCB0ZXN0DQo+IA0KPiBNYXR0IENvc3RlciAo
Mik6DQo+ICAgICAgIHRlc3RzL2ltYWdpbmF0aW9uOiBBZGQgZnJhbWV3b3JrIGZvciBJbWFnaW5h
dGlvbiB0ZXN0cw0KPiAgICAgICB0ZXN0cy9pbWFnaW5hdGlvbjogQWRkIEdFTSBtbWFwIHRlc3Rz
DQo+IA0KPiBTYXJhaCBXYWxrZXIgKDIpOg0KPiAgICAgICB0ZXN0cy9pbWFnaW5hdGlvbjogQWRk
IERFVl9RVUVSWSBoZWFwIGluZm8gdGVzdHMNCj4gICAgICAgdGVzdHMvaW1hZ2luYXRpb246IEFk
ZCB0ZXN0cyBmb3IgZnJlZSBsaXN0IGFuZCBod3J0IGNyZWF0aW9uIGlvY3Rscw0KPiANCj4gIGRv
Y3MvcGxhdGZvcm1zLm1kICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgbGli
L2RybXRlc3QuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMSArDQo+ICBsaWIv
ZHJtdGVzdC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICsNCj4gIGxpYi9p
Z3RfcHZyLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAzMzUgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgbGliL2lndF9wdnIuaCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA0MCArKysrDQo+ICBsaWIvbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAxICsNCj4gIG1lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDggKw0KPiAgdGVzdHMvaW1hZ2luYXRpb24vbWVzb24uYnVpbGQgICAgICAg
ICAgICAgICB8ICAyMSArKw0KPiAgdGVzdHMvaW1hZ2luYXRpb24vcHZyX2Rldl9xdWVyeS5jICAg
ICAgICAgICB8ICA5OSArKysrKysrKw0KPiAgdGVzdHMvaW1hZ2luYXRpb24vcHZyX2ZyZWVfbGlz
dC5jICAgICAgICAgICB8IDIxNiArKysrKysrKysrKysrKysrKysNCj4gIHRlc3RzL2ltYWdpbmF0
aW9uL3B2cl9nZW0uYyAgICAgICAgICAgICAgICAgfCAxMTAgKysrKysrKysrDQo+ICB0ZXN0cy9p
bWFnaW5hdGlvbi9wdnJfZ3B1X2luZm8uYyAgICAgICAgICAgIHwgIDU0ICsrKysrDQo+ICB0ZXN0
cy9pbWFnaW5hdGlvbi9wdnJfaGVhcF9pbmZvLmMgICAgICAgICAgIHwgMTY5ICsrKysrKysrKysr
KysrDQo+ICB0ZXN0cy9pbWFnaW5hdGlvbi9wdnJfaHdydC5jICAgICAgICAgICAgICAgIHwgMTY2
ICsrKysrKysrKysrKysrDQo+ICB0ZXN0cy9pbWFnaW5hdGlvbi9wdnJfcXVpcmtzX2VuaGFuY2Vt
ZW50cy5jIHwgMTEyICsrKysrKysrKysNCj4gIHRlc3RzL2ltYWdpbmF0aW9uL3B2cl9ydW50aW1l
X2luZm8uYyAgICAgICAgfCAgMzEgKysrDQo+ICB0ZXN0cy9pbWFnaW5hdGlvbi9wdnJfdm1fY29u
dGV4dC5jICAgICAgICAgIHwgIDc4ICsrKysrKysNCj4gIHRlc3RzL21lc29uLmJ1aWxkICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KPiAgMTggZmlsZXMgY2hhbmdlZCwgMTQ1NyBp
bnNlcnRpb25zKCspDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogMWU5MTJmYTE0M2EzNWM0MjM4YTFm
YmNmOTQ0NDMxNzVkOGNlMWQ2MA0KPiBjaGFuZ2UtaWQ6IDIwMjYwNzE3LXRlc3QtaW1hZ2luYXRp
b24tYWRkLXN1cHBvcnQtNWMyYTllODRmYWRiDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IC0tDQo+
IFJvYmVydCBNYXp1ciA8cm9iZXJ0Lm1henVyQGltZ3RlYy5jb20+DQo+IA0KRm9yIHRoZSB3aG9s
ZSBzZXJpZXM6DQpUZXN0ZWQtYnk6IEJyYWplc2ggR3VwdGEgPGJyYWplc2guZ3VwdGFAaW1ndGVj
LmNvbT4NCg0KVGhhbmtzLA0KQnJhamVzaA0K
