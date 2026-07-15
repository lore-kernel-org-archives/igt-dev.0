Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59F3C44508
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 15:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A48A10E141;
	Wed, 15 Jul 2026 15:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="antnfrCU";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="pFmcHPE+";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B8210E141
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 15:14:52 +0000 (UTC)
X-UUID: ea037b3c805f11f18dc8c9802ae25ab1-20260715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=U650vXVoJ7dDTd4XFZsmF9ib1gcY92yBGhuIUxrQViM=; 
 b=antnfrCUPkRCszgIMBQDBk/wnnNyNALSl1Xia4yhj698R0ByL08u/2Qm7mnMRUOCaxQK/ZoRZxqiGYTjh0ajWjbjm1GqO6HEmNs+nE5lyfUgrEbs68GJ+LYUtfC9UfxUVCwCi6A8b4FYsuvCUxe9PrtrkBkijryGvnB+FjIocGA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:15e47844-ca68-487f-8dcc-2351ddb47951, IP:0,
 U
 RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:2
X-CID-META: VersionHash:d497b38, CLOUDID:a98bbb37-7759-43a9-ae06-f4df9d53bea1,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
 Content:4|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
 1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ea037b3c805f11f18dc8c9802ae25ab1-20260715
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 936026355; Wed, 15 Jul 2026 23:14:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 15 Jul 2026 23:14:44 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 15 Jul 2026 23:14:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZ9ftxNjfnCcQppRGcbC5CN0erQfka3odUV26Qw8j8TKxqjDlZ/vvbiSyqG5BIbkgciWmnbvcevD3VLS87Cs6HSVumN9aa5B0JS+RVTN0HdiMUs1jlDjZLtDYcvPV/P3MMorY/NgEs5wt2iCyAK+MjBuaK/1UtaEVHgeuiLOd/8U3aDtzKe+clWsslM/q1Jej9okkemHJLIiv3i8qHCBKll2KmdUeQnwa+c/dBMHWbO0J0Th2m//CrgsvY1hn0S1vJeOQbBX+ED1WIXBpP8/ABJDqwaEvlFEvTgrF3USIDvPeifjKeUOlnP9ojXXz3/mJgV54RolalnE91/ceCpj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U650vXVoJ7dDTd4XFZsmF9ib1gcY92yBGhuIUxrQViM=;
 b=nrqo6WtFsYBuaINbl7FAL+hHdIhqcOmoy+WjGWjpnkVZCyjPanDOQTIJ65DBodd7xv66WphVu301UoXnPB+wV44h4zqwRjDpYn9vwDYIkvyr/zsTH+C+9MnLtgX0+KA1WjAxGClHkm6gKuoSb60bZb3KG9rJ7bJVdT5olppwlaPnKKLgn5XWpo42dJAwMMNxPj47Wn+tGg91CRoI33rsuK3ocvlxogVM6JNZXTcOhKnN2KutLTUa9gMwSrZNg1D8r+YawUGZD6hv2shkJzMe5JtPOZepv2T8jYcj/dyhvJXu+n2hHqgx9uYQ5hX5XoAgp3CiHUXx4tjD+jfdDMkXNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U650vXVoJ7dDTd4XFZsmF9ib1gcY92yBGhuIUxrQViM=;
 b=pFmcHPE+jRcXIfJCEuy5ZKI54uEuBMM4y//d8iYc2wj/O+43wgrJ/ZTlK7iANhIoHcl37XOAfFqvEiyVtsmNMAXenWEuTsASzZIo2or1FFjWlbN2aQlqo5K5xB/64m7Cx+YPvjJ0T3/8boOMZkw3QFGxy7yH1TUf3a38FwWo4vs=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KUXPR03MB9884.apcprd03.prod.outlook.com (2603:1096:d10:82::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 15:14:41 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 15:14:41 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "santhosh.reddy.guddati@intel.com" <santhosh.reddy.guddati@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_content_protection: Skip MST outputs in
 SST-style tests
Thread-Topic: [PATCH i-g-t] tests/kms_content_protection: Skip MST outputs in
 SST-style tests
Thread-Index: AQHdB2pDeWEgjlWn4EaRKIo00hgO2LZmV2cAgAhzFAA=
Date: Wed, 15 Jul 2026 15:14:41 +0000
Message-ID: <96a7b371898c7363f886b2a80186ff5edeca1359.camel@mediatek.com>
References: <20260629015411.32130-1-jason-jh.lin@mediatek.com>
 <c67f184b-c93c-47b7-ad5a-a19a2a6078e4@intel.com>
In-Reply-To: <c67f184b-c93c-47b7-ad5a-a19a2a6078e4@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KUXPR03MB9884:EE_
x-ms-office365-filtering-correlation-id: 80eb4744-bab2-4227-bcb6-08dee283cb51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|3023799007|38070700021|4143699003|56012099006|5023799004|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: yFuARlet3iYkHjPp8KdqYEViSRpArFnVG53MzdhaJBkrFqFokvV9xfvBx6FaA8zZFO6bdnmsKVtb5IEv63GtPgkSeWxlTJy9olWm+k4XM5+fB4uDp6cZOMP1OMmf+uwZEy4gbMn+WI+iUzHIjWAGIb7m5lIxElD32ILcnLHlewW7d3ZLwQ4REASiWEmGZ+4FR7GoTZ/wTJju4LzpIQb9X+8pbUmBrGzvHX15jV87K5gkm0wC86AdFXpFpzzG+PL+jtyOjt4kbH1R5PcGXj355irwFLliGx0LxXZCDXUlqMtC18Cs+uF6K3olVqOTf1FhA90TUuK0U7UeEr8H8nqMXDCL9hhd+2fBbfD1x6CK/bCS+DHvYQxDfb82gwlwXj4VqSUA17KQrMDzSt9wWkXDt4xB+srTSEC6EPHJahpKCxss6+byOuuCKrcKDSbcVg5vG0Zw+aoThik0vpqMh9NcB2+TkgpcfNjCdzqleMQlHxhhtBQi5jNu+On67JeXxBWzFqjFSVOTSE8aFGatpqcB/qbtfm8hYZWF66JS5pQFSkeVicSCUiOPGkz50amXLa4xr8ve4Cl5xzO4xAEqTqzboiz+ZUAq/SdTHVSdLXUq9Jd5BuCcYDF55fk9gvJmOpk+xVcYHN5NQs/lTiTGN9c1B4w9agNeTx424yQsJPFbp1tmb0hRx/ZuTbf+52uJD7gNtwOgYbx9xxPEVWKrXy/EQkqJBXSFZwucx3+nxgFEd54=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(3023799007)(38070700021)(4143699003)(56012099006)(5023799004)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFF5emRwVjBVL2w0Y0N3eStuWnFOajRCUTNFNFZMYjUxODlnblJQRDI1b1lv?=
 =?utf-8?B?dEZDSEFrT2d3SURCRmh4Mk5SclFJQTF1TGlwWnJQa0ZDTXJTSTU5MFZXbXF3?=
 =?utf-8?B?TUFRNXB3ZWJsK0VXalJKa0g1Q0tBd1dzVWJja01MeHk1UGJvczRwNC9yZm40?=
 =?utf-8?B?Sy9lY0Noc2ZCcTJYV29CekI3TkNJK1g1NGRZUElZczhmWTlvbDBhWVcwc3lq?=
 =?utf-8?B?Ym1iSCt0YVYwc0lmTlRFQ05jYkZoSHpiMncwUWtoVUJ6dHZySDNwa0FxSTFC?=
 =?utf-8?B?d3NMMEJpVTc5VkhGKzZqOGFiUUIzS0prVU95SzNIRjZxU2NWNXRvVjN4ckRQ?=
 =?utf-8?B?T1V5dGxDY3VzekxMeWJMbHJrZE1KcWExdm91WnQrQkplbUE1aDhsRWJTMzl3?=
 =?utf-8?B?cDJLeUpOM0I3ZmRoYVcvNUpLTUM3VFZtK0hpTjBlODZhK2lYbHdGSmF2ZEYr?=
 =?utf-8?B?aXcyWi9VWEYrZUM4OWRmVWREcVRkTUlheHdkdHdIVElabU05MFNSeWVJSEtv?=
 =?utf-8?B?R1JoSzFvdXV4WE5KNkRhN0J1RnZ0WU9KM3Z6V1RidG5nODRONkZiWGlyVUtB?=
 =?utf-8?B?M3JSSzl1eWVhcEd3RHlEdVFqWHhsQmRvS1I2ZlBQdGxJbTlRdWRpSElDTzNV?=
 =?utf-8?B?K2hFcFdFUytJTEVUemtOT092YitnZm5aYzg3cStCNmRNaTdocXk1MjBUOEVE?=
 =?utf-8?B?Y054Vk84Z2hmVSt6dktldEJ4WEFsdUFyQjByU2orRHhKS09vbGZhSVo0K0NW?=
 =?utf-8?B?d3lVS3FpVEdXSDVoa3gveXArRFRwYjhmYy9BR3YvRDdlcVd0ZDM3MDRxRytN?=
 =?utf-8?B?b3NwZFJVeFJ4RFNGL2JxMms5YU91SmNoSnIybVNUWktaKzN3Nk1qcGxtbzFC?=
 =?utf-8?B?QUpINExVT0NPcVAxZGkraWp5TWQ1bi94TEtCb083d3l1cWQzWmMyUEhRaWRu?=
 =?utf-8?B?R1NkWGhVZU5ROUIySHpTWTk4c3ZobGR1TldLYUJ4akNJbE8rNU1LYXd3ZDBT?=
 =?utf-8?B?SWxDdDkvV0M0MkJ1VmhMZit3QkpXajlzdlVZT3owOVNDQU5pMHJHcStSMEly?=
 =?utf-8?B?NWJyWEV0UGp5OWM5WEF4RytRVUJXd2hpMlNsSzdjV2hsOGorVmk4eDVOc3FN?=
 =?utf-8?B?SzQvUUZWRXpMdDZsVk9UNUw3a0hDWkpUZ2JGTXRCOENpODhDMkd5VEFRQTlv?=
 =?utf-8?B?OXNueFhWUUVmUUFabTYrWWkva0taRTRFdUw5UC9LbU5lT25kQUxNWlJWbHhL?=
 =?utf-8?B?S3cxc08ybEcxTjhOOGdTTUNJMUhSR3piSmd0N3J2enYyTDNKTWJTV1VjM3hV?=
 =?utf-8?B?Tm5ic2l4MTFvZU9PbDZYaldRcWhWOW1iK2JaSjZsdFhPRWdCRXFPQWJPdWZB?=
 =?utf-8?B?NmFpQlZRem5HbHZRVmd4aDNHVlh5Nzg4Q2hlVVpFZkVxWEVSYk5OSHJEb0Nt?=
 =?utf-8?B?cjRydTlkTFIwT1dlMllLKzhNaWxrZGVvRjhlUHlieDFab0kyVkowWjh6WlJw?=
 =?utf-8?B?YjZUb2RpaklRNVlUQTJTam1PQjdLYUx2NHdDbEhta1I2dXQ2N0VDMGRkTmwr?=
 =?utf-8?B?VzhoU3U4QktNQWlhZEluV1dxWjFQUWk4N3hEMk43Q251VGNveTYrWWd1ZnNj?=
 =?utf-8?B?cDl5NHRZMXRvcDdVVGdHY2hVRUtnQjZ0bUpaNHRMRUtUR29mVnI3MUd1QWRr?=
 =?utf-8?B?elNsVXgzTzFYb0RMRXN1ajU5blFzVTE2WHlnYm5qZmJBVmYveHFLTk1aSUtE?=
 =?utf-8?B?cXdYckd1R2FnQTFzQ0UzZG5oWGcxRGVzTi9ZODlIU1N3d09nRk9kUWhDMFRI?=
 =?utf-8?B?eXZZWE4wK1ZlbFVPSlk5OVllenpwbVlNc0dYK2VldW1rKy94OE90SkVaV3pI?=
 =?utf-8?B?bmtWNVcrYnZZREIyeitJRzJsZE5PTkpBSUpjaCtOemg1RmRZYjhCZ1BIVTRx?=
 =?utf-8?B?VURySGRnL3p2d1RWZlh5OCtML2VkUUJILzI4S29waVppbktOWGI3eWo0RVRT?=
 =?utf-8?B?SkpndnB5MlFoS05pbEhrb1poRStIbGVaVHlDMFFidEVNYnV6ME1JaGtNM1hw?=
 =?utf-8?B?aVpqMG5rMTYzV2h5ZmkyTEkrVUxLMlRTL01ZQVBFdnl3OWRneXpKZ1BkZnRp?=
 =?utf-8?B?VFQ4UUJDeUl4YnZMdTlTZnZxaHhUelN2WUxEMW9pUnFQM0tCeFpJNkt0MGNX?=
 =?utf-8?B?MVl2b2NFcjkvRjBxMjRyTjlFbEZvMy9sZXNSY0NkamxlWC9TL2F4dFU3c0JE?=
 =?utf-8?B?NTVNVXdxTWozdUlWNWZMTk9meXM0RHVJWkp0ZE9RVHBFeHNQSDcrTU5adjJJ?=
 =?utf-8?B?REhveTlUSzJLbVJYYXV4NENCdml2V1lkSFdPa2swYUdJR0JqbUx6Y01NWFVU?=
 =?utf-8?Q?Wpmjsgpr9snRgk/A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D61503D6E9E1849BCD771C940194A5B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NPv6hsZJTsIfe9UCrQEfPPk5z+IZnAXSpRzF6Srh/Jj5g06CaFtVhT/BWWPoJMz6zDobKTh4hEaLonqbtSs8Beixrj9QcZfHl1na82i46zZY735FlrAnoVA7IO/JKeWuRjrEOIVMPWIssk1KK6BBakCrZdR1X1oPEMmtFO0Hsd8DeR3+LPXyj/8nb0LkcNfAH8lk45s/cVLs6j+UjuJjBUC/pygGKmxnke9SzdQV0VSIO4rm5E8RK7ATfnHHwxxf4IHYvHAnSeZBWk4k3dq8W1dQNgRrZ6HJwJVc99tbYDOhuItvIicPxj78+GvNSuwAiEnPhQ2vTXSRHZEn+QSWYg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80eb4744-bab2-4227-bcb6-08dee283cb51
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2026 15:14:41.2524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M4edKgTtHRShdJ3WZN/1vSHjdZW5CwYxE+beDTLCaV/kWzVmS0Jv4daSEkClt4lN2YYSfH14XQAKLTCJuSbnfdlhVD09UAckjvB8IjhlN1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB9884
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

T24gRnJpLCAyMDI2LTA3LTEwIGF0IDExOjQyICswNTMwLCBSZWRkeSBHdWRkYXRpLCBTYW50aG9z
aCB3cm90ZToNCj4gSGkgSmFzb24sDQo+IA0KPiBPbiAyOS0wNi0yMDI2IDA3OjIzLCBKYXNvbi1K
SCBMaW4gd3JvdGU6DQo+ID4gTVNUIChNdWx0aS1TdHJlYW0gVHJhbnNwb3J0KSBvdXRwdXRzIHJl
cXVpcmUgdG9wb2xvZ3ktd2lkZSBIRENQDQo+ID4gYXV0aGVudGljYXRpb24gd2hpY2ggaXMgaGFu
ZGxlZCBieSBkZWRpY2F0ZWQgZHAtbXN0LSogc3VidGVzdHMuDQo+ID4gUnVubmluZyBTU1Qtc3R5
bGUgdGVzdHMgb24gTVNUIG91dHB1dHMgY2FuIGNhdXNlIGlzc3VlcyBiZWNhdXNlOg0KPiA+IA0K
PiA+IDEuIE1TVCBIRENQIGF1dGhlbnRpY2F0aW9uIGludm9sdmVzIHRoZSBlbnRpcmUgdG9wb2xv
Z3kgKGh1YiArDQo+ID4gbW9uaXRvcnMpDQo+ID4gMi4gUGVyLWNvbm5lY3RvciBIRENQIHN0YXRl
IG1hbmFnZW1lbnQgZGlmZmVycyBmcm9tIFNTVA0KPiA+IDMuIFRoZSBkcC1tc3QtbGljLXR5cGUt
MC8xIHN1YnRlc3RzIGFyZSBzcGVjaWZpY2FsbHkgZGVzaWduZWQgdG8NCj4gPiB0ZXN0DQo+ID4g
wqDCoMKgIE1TVCBIRENQIHNjZW5hcmlvcw0KPiA+IA0KPiA+IFNraXAgTVNUIG91dHB1dHMgaW4g
Z2V0X2hkY3Bfb3V0cHV0cygpIHdoZW4gcnVubmluZyBub24tTVNUDQo+ID4gc3VidGVzdHMNCj4g
PiB0byBlbnN1cmUgcHJvcGVyIHRlc3QgaXNvbGF0aW9uLg0KPiANCg0KSGkgUmVkZHksDQoNClNv
cnJ5IGZvciB0aGUgbGF0ZSByZXBseS4gSSBkb24ndCBrbm93IHdoeSBJIGxvc3QgeW91ciByZXBs
eSBtYWlsLvCfmKvvuI8NCg0KPiBJTUhPLCBJIGRvbnQgdGhpbmsgd2Ugc2hvdWxkIHNraXAgYWxs
IE1TVCBvdXRwdXRzIGluDQo+IHRoZSBTU1Qtc3R5bGUgdGVzdHMgLSB0aGlzIHJlbW92ZXMgYSBs
b3Qgb2YgY292ZXJhZ2UuIE5BQ0sgZm9yIG5vdw0KPiANCj4gWW91IHdpbGwgc2VlIGEgbG90IG9m
IHNraXBzIGFmdGVyIHRoaXMgYW55IG1zdCBzZXR1cCB3aWxsIG5vdCBydW4gDQo+IGluZGl2aWR1
YWwgdGVzdCBvbiB0aG9zZSBtb25pdG9ycy4gV2Ugd2FudCB0byB0ZXN0IGluZGl2aWR1YWwNCj4g
ZGlzcGxheXMgDQo+IGV2ZW4gdGhvdWdoIHRoZXkgYXJlIGNvbm5lY3RlZCBpbiBNU1QuDQo+IA0K
PiBUaGUgdGVzdHMgKGxlZ2FjeSwgdHlwZTEsIGxpYywgdWV2ZW50LCBzcm0sIG1laS1pbnRlcmZh
Y2UpIHdpbGwgc2tpcCANCj4gZXZlbiBpZiBhIHNpbmdsZSBtb25pdG9yIGlzIGNvbm5lY3RlZCB0
aHJvdWdoIGEgTVNUIGh1YiB0aGVyZWJ5IGENCj4gc2luZ2xlIA0KPiBNU1QgZGlzcGxheSB3b3Vs
ZCB0aGVuIGdldCBubyBIRENQIGNvdmVyYWdlIGF0IGFsbC4NCj4gDQo+IFBsZWFzZSBsZXQgbWUg
a25vdyB5b3VyIHRob3VnaHRzLg0KDQpJIHRoaW5rIGEgc2luZ2xlIG1vbml0b3IgaXMgY29ubmVj
dGVkIHRocm91Z2ggYSBNU1QgaHViIG1ha2Ugc2Vuc2UuDQpCdXQgaW4gTVRLIHBsYXRmb3JtIHdo
aWNoIHN1cHBvcnRzIE1TVCwgZXZlbiBpZiBvbmUgbW9uaXRvciBjb25uZWN0ZWQNCnRvIGEgTVNU
IGh1YiwgaXQnbGwgZ290IHRvIHRoZSBNU1QgZmxvdyBhbmQgbWFrZSB0aGUgSERDUCBhdXRoIGZh
aWwuDQoNCkJ1dCB3ZSBmb3VuZCBhIEhEQ1AgaXNzdWUgaW4gTVNUIG1vZGUgcmVjZW50bHkuIFdl
J2xsIGNvbmZpcm0gaWYgd2UNCnN0aWxsIG5lZWQgdGhpcyBza2lwIHBhdGNoIGFmdGVyIHdlIGZp
eCB0aGUgaXNzdWUgYW5kIGxldCB5b3Uga25vdy4NCg0KVGhhbmtzIHlvdSBmb3IgeW91ciByZXZp
ZXcuDQoNClJlZ2FyZHMsDQpKYXNvbi1KSCBMaW4NCg0KPiANCj4gVGhhbmtzLA0KPiBTYW50aG9z
aA0KPiANCj4gDQo=
