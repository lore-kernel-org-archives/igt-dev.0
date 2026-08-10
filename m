Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998D1C5AD4E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 09:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA2210E73B;
	Mon, 10 Aug 2026 09:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="gV8qFYqu";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ZYT6tTv2";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0834010E759
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 09:04:10 +0000 (UTC)
X-UUID: 70d095a2949a11f1b1788b6acf885367-20260810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=DOeRZ35DMEBTICJ71dRJ4EoNAlirC0ClVn9yqki4VIE=; 
 b=gV8qFYquQh4PWOIRDnc1JFL7NbShawpcVWgzFrptg4dTimYkVzQfGnAFR6nmb1XAxt4SXRiGvIbpxEsgwWL4uz3qKNcQ4FoEPF3Yy4t65YhDY9Gx6fs2mOKC4XFgtSbPxH6FwZyj2Yry39pyfWBUv0S6LxenB5hLB4zN3fLjAsY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19, REQID:840c35da-311b-44bb-b402-3228291c9291, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:7db8b62, CLOUDID:43a0a4d3-4a5d-44a7-b5be-1eb58d778aa4,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
 Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
 1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 70d095a2949a11f1b1788b6acf885367-20260810
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 662986322; Mon, 10 Aug 2026 17:04:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 10 Aug 2026 17:04:05 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 10 Aug 2026 17:04:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWeaMltU0QQFbXklqc0q51Wk++jxgmForKYHwe+kTJnPB0G7SPRSUhNT6wcAqMo6t4xNFL9Uk55EN8DGkgdMG3qHYETW07StwowR36a3iQfyAPq75MXg4nxkXLsOGOo2WrrucRB3LORxYNKPX6Gn3iokRDe9Z9nwXN3ZC7v3QpSR2qeiQI5LtYL7qhGsmrE/060gia6OPUmjdVLIQJ85WtOO0glj8BuMa43Q2zVMEdANvfL4unehowvr17d178Az+jlrIG82ns7PTX+CEAvFBU3NUnCgrbnqnGkQIgrbKx/wKRHsAqvSDH4uGUH6WjyXdd1/SqqyYiDEn2RfaR8vSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOeRZ35DMEBTICJ71dRJ4EoNAlirC0ClVn9yqki4VIE=;
 b=pRgiHZ4p58Rgz/3ximffR44l8hD3sGBngnwFv0+t7quwZlORV01blPdP19+bCix95ZmUujR1ekVQoCb+FFTMkre+TBILz4GmQOi+7G0A9vkBghGNUTD6SAIPLoahyeHwPBgcMpkVrfS8rR43Bse+YGrIwe2ZEHfSaTbcErSIRcIAwBuUfy5K37K3D8hF6Z2+GRhPDWnBnyMFg2d3Il2vNjPXTSqxl6NxZcQIAD8je+HIf9WNTRarVz3Yk+Ew13nhvi0vjRDdFlbwcAIhtbsoChvhdrCjZ+de61V0YO8fAky6C9efYUbgqlr34BjIF61TVWhkAC4FFLpQhgQyioej6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOeRZ35DMEBTICJ71dRJ4EoNAlirC0ClVn9yqki4VIE=;
 b=ZYT6tTv2qIeOduaMkg3aZQAX2qxnHn/pYlJ1MpFDKb139MqedfzWY9I8esTRq71wFHKbFgPLhPwivoM9LSKjg5CNINa2NjZu6UuNvtnIX/D9ul9DzJbCxSMm3ddtL5NUVHfjwVH369DI2UuiLOf1saeM4FgqXLPBEZIgVUDFras=
Received: from SETPR03MB10564.apcprd03.prod.outlook.com (2603:1096:101:316::7)
 by OSQPR03MB8624.apcprd03.prod.outlook.com (2603:1096:604:291::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 09:04:01 +0000
Received: from SETPR03MB10564.apcprd03.prod.outlook.com
 ([fe80::9b45:ef7d:a5fa:c791]) by SETPR03MB10564.apcprd03.prod.outlook.com
 ([fe80::9b45:ef7d:a5fa:c791%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 09:04:00 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "karthik.b.s@intel.com"
 <karthik.b.s@intel.com>, "swati2.sharma@intel.com" <swati2.sharma@intel.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "navaremanasi@google.com"
 <navaremanasi@google.com>, =?utf-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?=
 <Lancelot.Wu@mediatek.com>, "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t] tests/kms_plane: Relax CRC frame sequence validation
Thread-Topic: [PATCH i-g-t] tests/kms_plane: Relax CRC frame sequence
 validation
Thread-Index: AQHc9u5/Sglem/ehfEGYeXzI5POuu7aXGcWAgABGuoA=
Date: Mon, 10 Aug 2026 09:04:00 +0000
Message-ID: <6d22bbf472104a0af3ba0d2cf4471e8ccf2e6c6b.camel@mediatek.com>
References: <20260608022810.48438-1-jason-jh.lin@mediatek.com>
 <ee03b60f-4f8a-46aa-a6ae-04cc72bcf2a0@intel.com>
In-Reply-To: <ee03b60f-4f8a-46aa-a6ae-04cc72bcf2a0@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SETPR03MB10564:EE_|OSQPR03MB8624:EE_
x-ms-office365-filtering-correlation-id: 0917bf82-c44b-4869-bba5-08def6be5183
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003|38070700021|6133799003;
x-microsoft-antispam-message-info: DgGlYFTDtLNbLxy4g3KbK0VHAZ2TOTUBdoZisx1nBrP4ykb/vPys9UPyAEbh3M4Y40NBAc4PJbnv2m9av0DDRxOWU3Qz2cy6hCf2n4HApX2Cfg/VpIFNFmmwLvZArch9b1Q1tKx/XXL9e0bvQ7pFTBL242Xnxw2wPA2GnvC22SzmnBlQmUZB3g2UHreoUkV4v7i5VIhQQ1lKB1j2jsDFhShx/UZbr9YSRqfhJU1/MuofLJUCTxZX+lcdVmyY8JbSgYBbl0GO2kZRCKfRx96Jc5JStBaGLz0c1yLNDErS3txaajLzmVtFmNQOeZ8GCYTi33qs6cS5yFCFKcxJ8HVwskIXkbWOPMb4BxT1kdVP8xbB+0dFN51xbXuSbf4UnbOp/MSkRY0vu2Jba+fOxSMSeSAHPEjQuHD0U/cCFTkDQmL0iQhWLzfqyLu1GuAlXwZvA28KD+LDFht3NXqhGfFa+LX+uhY5EUR2kxrhayvcis08BWQ1QNo32HX0HrsMdnjmUTrVfhGgWTr8WbJiDQ7GHG+yclaCXu5eMaBnfRu+qQtF1FMHaJfDRleFG83uJIGIHmdzgdFzL2Oy9iUArSva4ohFCeWAHJaOvNTFf3dI4DI5qDKnAyg/EzCa6xOKSzjpLyX+WHl6yZR8TX0M6QHrdDH7yEPJo7tul8LafX73R2SN5Xv6SSuF9+L+onwgVDvIrGlt0WalBScj1Pat6dVT4+LqbpYjfc6wsV1DZ/LdjEI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SETPR03MB10564.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003)(38070700021)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2ZlNmozUmErS1pTYTdseEpINHVPeUg2M20wcStzakgrdXY5Z3h5cFZyNnRo?=
 =?utf-8?B?VlNQajVMeTdyZStzWmV3MjdEUTEyOXlQNTlCSW9UUkIvdGhEMERidWQzUXhs?=
 =?utf-8?B?SjB2elVqK0t2cDRBblVac0ZUYU53USt2amxnVVV4aWhzK0xXdTEwM0E4WmRO?=
 =?utf-8?B?QUw1SG5uOWRvbTBSTnJhc0lRTFdubEFKVERyR3BkSVg2aWZ4ZXlFeUYxSnRi?=
 =?utf-8?B?Q0Z6REtPczUyMUdsNlR0RlpMUS9KQnVuTnFEMUdmNEJ4UjlmVzhXWDlZbnl6?=
 =?utf-8?B?c1VNY2tvUEVpaGt6TERPRXM1TXdWV0E0c0JBanpPVk51RFhNRU5vbFlxVEtO?=
 =?utf-8?B?WmprY3RvM0ZEcDY4SVdWb3RiY0FUOHNNd2ZGQkp2eUFoeUFuY2pqMHJTb0JU?=
 =?utf-8?B?dnFlcEgxMGo3dG02UHFHNk9ZajRsaVlmZmk4c0NRbU15VnpYa3JwWGt4bUlN?=
 =?utf-8?B?MGhISzBIZXZueGN5OTJXZGpMMzhmR0ZjMXh2dmRGeWRWd0p6blY1KzJ0U1M0?=
 =?utf-8?B?WnBBZnhjYWhSRk1vdk5TRjgrU0tBdWZyR1dtdFRZTUYxcS9nWDJzVXQyQnpv?=
 =?utf-8?B?N1pCakhwUlJPa3AxaFpwSHorVENxNVRzVTd1Umk1ZlRubUJDUW5wOFRJcjNH?=
 =?utf-8?B?VlkxeXBQRnMrQTBmTThTQ1o1cUt4ZDJaL2t6VDNNa0l1SnZ6a2tOUHV0Ykl2?=
 =?utf-8?B?MVFYQVpDYlJoYkltNGJpYlRyWGY3VzN2R1dUMG1zS0RFZGx1d1YyQUlaV1E3?=
 =?utf-8?B?OG5FUHZvR0NJQWtxTjZHNWdtQWVVN28zdVNJL09IeFE0Vy9iYmRzM3BUb3R5?=
 =?utf-8?B?cUFkMkRqc1lVWEVpRUVzeUJ2eTR2UW9jZTZKM3F6WFBCK1NkT0RkWTNkTGxG?=
 =?utf-8?B?amQ2UlFWV0g3V0RmWk1BVU1nZDVxb3laUm5aRHVPMm4zb21aOWhmUVNBc1Vw?=
 =?utf-8?B?Q0pvdFovZXZlYVQzOEQvbFR3cThXMHpQWTFJWEpjU2k3eFdBaGhOcGN0OWVJ?=
 =?utf-8?B?YXhieVI3YlZpZVBQZm1aeEZFSmZDVjRPYm9VZytwSCs1RS8vSDZ0VkNqeTlX?=
 =?utf-8?B?MUx3WlJ1ck9reEpnZ1NaNjJsVGhsWWlwWWRvUytVb25NblRiWGg3ZHFqZzc5?=
 =?utf-8?B?NStjUUdWL3lJZEZYVWM3UHZ6TU4xckNUc3Z4ckVzdGVSWFF0SGlEam8yRHU5?=
 =?utf-8?B?ZHhzMFkxbk50OEpLSzZCRC9mQnJwSTdFSjhQSmJhUmFUeWkwcjFlNE4vM1J0?=
 =?utf-8?B?eVpxOWcrL3hId2JnK3doYko0cE1BRmV5ZkROTFI2bEpCVzFsaTRsK0Nib0tp?=
 =?utf-8?B?WnpMdE1jSGRVcERlZjFCK0h6cUtndTlFNEkzY3J5N2RBRWFZeFFxdDNqRXhq?=
 =?utf-8?B?STA0SG5CSW41RzR6WlM2WWEyZlNVZExBRGh0dWl0MUVhRWVsZDdwVEtKbWcx?=
 =?utf-8?B?TTdyNTNZTC9ZaVZ1c1dHNnU0N3FMZ20rK2Z3R3BpWXlyNVl5ZUpDTURWdEpR?=
 =?utf-8?B?bnRTTi84d0thZmxSU2s1OWJ3MmtZMW54bEtBbWY4aEFZZG5kSmIwY3RzMlFu?=
 =?utf-8?B?SFdnOXlkeU0vbWN6NjFZZzhST3VIMVQ3NE5kV2hIYUhGRjFNQllnZEduL3JV?=
 =?utf-8?B?ZjFZaVlUeTZRYTF2UHJ2Wm1zMkx3RlAxNGwyN3padHd1RzJNbGExQkIrQitv?=
 =?utf-8?B?ZEFaZFJBekUwQndLMGZRbDQ3VFNSYitzdTA5eHV6VHNvZFUwTENGbWp3SVhv?=
 =?utf-8?B?aUNyUVlnYzMwZlBKQW5uUVo1eVhQTkMyQVIzUjlCVnNHbkhQdjdDS0ViTW53?=
 =?utf-8?B?b0hidWkxYTIyNVBuMkxuS0I0SnlZVzhUbTZ0d1pHV0tsZ09OUHlTSkdKVlV6?=
 =?utf-8?B?dkF4U1FsVmh1NE1ENnBtTWZDNWFNdHdKZkQ5aFZlS1o2OEI1U1JxY1g2Z1hl?=
 =?utf-8?B?SGV6RnhtS244SDFXTnBsVTdYMVBTYmdFckhmMHd5VkZrUUdrWWgwamRsZnlu?=
 =?utf-8?B?WWYrMkM3WUx4N0FOcFNzcDlyZnlpclV2NGZMbHJ2TUtleEppRGdXMzgySlhY?=
 =?utf-8?B?WTVkUnBsYkc3Zi9xbGRRc2w4eDRmTWZiR0ovV1E5T2IrWUZOQWEvU1RqVUxv?=
 =?utf-8?B?SDlqQzVIQm5kbERnaTRtQ2d3V1JXME8yUGxWdkx2TVliLzd1c1pUMVE5eXNJ?=
 =?utf-8?B?YVhRcmJDcklvSWFRVldmV05DSnRXTnJKR1JkUmpBZFpjMW4rKzJKdEREOHFw?=
 =?utf-8?B?YlBsS0FEQ283aDA3TUFnUnc4VHZKdjlBMkJHWUdQWXdZK2hUS2wySHBZWkFG?=
 =?utf-8?B?OEFSL3FGV2R1MzZxR3Bxb2dnUk1OM0Q4RFNVZ0NFdTFNdFkzclk2YkZhdnlT?=
 =?utf-8?Q?7VzObLZ3NTZ6Ue44=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D59286694FE4E34AA004992CC6452A67@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QrytlSxmvF4WP3g75hw1kT08W8DZn9DCb1Cvb1bdvVLKLSmhFxVrn0uj9EERnJe4DhJ/FjpOXef+DxwOJQbMlILJcTGBn8qKObrMqxNVlJkpvXUQgN1l4U2lz0KxOJuQdyd0cc14b3wd8IKH7xWvA/fc8dXqzMy+L4SIAlPRhYWH8wKbIBU7uNr1mObFf20ajozyZP/MsyE9GDEG4MHOp+JdgTKLdJVKFCHHHq7hnHpwKqJGUX3GU0+XPsXtnV77M0b/xXFafvrNljiDNjkQ2+v5yWYxrunPVvNsnBPA50XvVRVVnDHtHIyYBz02LF5PzvcbvFQBx809VwCz1L2arw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SETPR03MB10564.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0917bf82-c44b-4869-bba5-08def6be5183
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 09:04:00.4397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lAixdobwoWxgDDWL1ZztBVhAEvpohHVNGTChEaz7tJ2yhP08PiJtV8QBQpaJTiDlWKGpacqpKndl5Fh7CUT+O7cCxCWIbMKe0+LQRCyl2q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8624
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

T24gTW9uLCAyMDI2LTA4LTEwIGF0IDEwOjIwICswNTMwLCBLYXJ0aGlrIEIgUyB3cm90ZToNCj4g
SGkgSmFzb24tSkgsDQo+IA0KPiBPbiA2LzgvMjAyNiA3OjU3IEFNLCBKYXNvbi1KSCBMaW4gd3Jv
dGU6DQo+ID4gVGhlIGNhcHR1cmVfY3JjKCkgZnVuY3Rpb24gdmFsaWRhdGVzIHRoYXQgdGhlIENS
QyBmcmFtZSBzZXF1ZW5jZQ0KPiA+IHJldHVybmVkIGJ5IGlndF9waXBlX2NyY19nZXRfZm9yX2Zy
YW1lKCkgbWF0Y2hlcyB0aGUgZXhwZWN0ZWQNCj4gPiB2YWx1ZS4NCj4gPiBUaGUgY3VycmVudCBj
aGVjayB1c2VzIGV4YWN0IGVxdWFsaXR5ICghPSksIGhvd2V2ZXIgdGhlIGxpYnJhcnkNCj4gPiBm
dW5jdGlvbiBpZ3RfcGlwZV9jcmNfZ2V0X2Zvcl9mcmFtZSgpIHVzZXMgPj0gY29tcGFyaXNvbg0K
PiA+IGludGVybmFsbHk6DQo+ID4gDQo+ID4gwqDCoMKgwqAgZG8gew0KPiA+IMKgwqDCoMKgwqDC
oMKgwqAgcmVhZF9vbmVfY3JjKHBpcGVfY3JjLCBjcmMpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqAg
Li4uDQo+ID4gwqDCoMKgwqAgfSB3aGlsZSAoaWd0X3ZibGFua19iZWZvcmUoY3JjLT5mcmFtZSwg
dmJsYW5rKSk7DQo+ID4gDQo+ID4gVGhlIGZ1bmN0aW9uIGxvb3BzIHdoaWxlIGNyYy0+ZnJhbWUg
PCB2YmxhbmssIHJldHVybmluZyB0aGUgZmlyc3QNCj4gPiBDUkMgd2hlcmUgY3JjLT5mcmFtZSA+
PSBleHBlY3RlZCwgbm90IG5lY2Vzc2FyaWx5IGFuIGV4YWN0IG1hdGNoLg0KPiA+IA0KPiA+IFRo
aXMgc3RyaWN0IHZhbGlkYXRpb24gY2FuIGNhdXNlIHRlc3QgZmFpbHVyZXMgb24gZHJpdmVycyB0
aGF0DQo+ID4gcmVwb3J0IENSQyBlbnRyaWVzIHdpdGggZnJhbWUgc2VxdWVuY2VzIGxhcmdlciB0
aGFuIGV4cGVjdGVkLiBUaGlzDQo+ID4gaGFwcGVucyB3aGVuIGRyaXZlcnMgdXNlIGludGVybmFs
IHF1ZXVpbmcgbWVjaGFuaXNtcyB0byBlbnN1cmUgQ1JDDQo+ID4gdmFsdWVzIGFyZSBjb3JyZWN0
bHkgY29ycmVsYXRlZCB3aXRoIHRoZWlyIGNvcnJlc3BvbmRpbmcgZnJhbWVzLg0KPiA+IA0KPiA+
IEV4YW1wbGUgd2l0aG91dCBpbnRlcm5hbCBxdWV1ZSAoY29udGludW91cyBDUkMgcmVwb3J0aW5n
KToNCj4gPiDCoMKgIC0gRHJpdmVyIGdlbmVyYXRlcyBDUkMgZW50cmllcyBjb250aW51b3VzbHkg
ZXZlcnkgZnJhbWUNCj4gPiDCoMKgIC0gRnJhbWUgc2VxdWVuY2UgaW5jcmVtZW50cyBzZXF1ZW50
aWFsbHkNCj4gPiDCoMKgIC0gVGVzdCBmaW5kcyBleGFjdCBtYXRjaGVzIGZvciBhbGwgZXhwZWN0
ZWQgZnJhbWVzIOKGkiBQQVNTDQo+ID4gDQo+ID4gRXhhbXBsZSB3aXRoIGludGVybmFsIHF1ZXVl
IChwZXItY29tbWl0IENSQyByZXBvcnRpbmcpOg0KPiA+IMKgwqAgLSBEcml2ZXIgcXVldWVzIENS
QyBhbmQgcmVwb3J0cyB3aXRoIGN1cnJlbnQgZnJhbWUgc2VxdWVuY2UNCj4gPiDCoMKgIC0gRHVl
IHRvIHF1ZXVlIHByb2Nlc3NpbmcgZGVsYXksIHJlcG9ydGVkIHNlcXVlbmNlID4gZXhwZWN0ZWQN
Cj4gPiDCoMKgIC0gRm9yIHRoZSBsYXN0IENSQywgdGVzdCBhZGRzICsxIHRvIGV4cGVjdGVkIChw
ZXIgSUdUIGxvZ2ljKQ0KPiA+IMKgwqAgLSBMaWJyYXJ5J3MgPj0gY29tcGFyaXNvbiByZXR1cm5z
IHZhbGlkIENSQw0KPiA+IMKgwqAgLSBjYXB0dXJlX2NyYydzICE9IGNoZWNrIGZhaWxzIG9uIGxh
c3QgZnJhbWUg4oaSIEZBSUwNCj4gPiANCj4gPiBSZWxheCB0aGUgdmFsaWRhdGlvbiB0byB1c2Ug
PCBjb21wYXJpc29uIGluc3RlYWQgb2YgIT0sIHdoaWNoOg0KPiA+IDEuIEFsaWducyB3aXRoIGln
dF9waXBlX2NyY19nZXRfZm9yX2ZyYW1lKCkgaW50ZXJuYWwgYmVoYXZpb3INCj4gPiAyLiBBY2Nl
cHRzIENSQyBlbnRyaWVzIHdpdGggZnJhbWUgPj0gZXhwZWN0ZWQgKHZhbGlkIGNhc2VzKQ0KPiA+
IDMuIFN0aWxsIGNhdGNoZXMgcmVhbCBlcnJvcnMgd2hlcmUgZnJhbWUgPCBleHBlY3RlZCwgaW5k
aWNhdGluZw0KPiA+IMKgwqDCoCBDUkMgYnVmZmVyIG92ZXJmbG93IG9yIHN0YWxlIGRhdGENCj4g
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRl
ay5jb20+DQo+ID4gLS0tDQo+ID4gwqAgdGVzdHMva21zX3BsYW5lLmMgfCA4ICsrKysrKy0tDQo+
ID4gwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4g
PiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3BsYW5lLmMgYi90ZXN0cy9rbXNfcGxhbmUu
Yw0KPiA+IGluZGV4IGYyMTAwNjc4NGJmYy4uNTQ4NTA2MjkwYzliIDEwMDY0NA0KPiA+IC0tLSBh
L3Rlc3RzL2ttc19wbGFuZS5jDQo+ID4gKysrIGIvdGVzdHMva21zX3BsYW5lLmMNCj4gPiBAQCAt
NzY2LDkgKzc2NiwxMyBAQCBzdGF0aWMgdm9pZCBjYXB0dXJlX2NyYyhkYXRhX3QgKmRhdGEsIHVu
c2lnbmVkDQo+ID4gaW50IHZibGFuaywgaWd0X2NyY190ICpjcmMpDQo+ID4gwqAgew0KPiA+IMKg
wqAJaWd0X3BpcGVfY3JjX2dldF9mb3JfZnJhbWUoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5waXBlX2Ny
YywNCj4gPiB2YmxhbmssIGNyYyk7DQo+ID4gwqAgDQo+ID4gKwkvKg0KPiA+ICsJICogaWd0X3Bp
cGVfY3JjX2dldF9mb3JfZnJhbWUgdXNlcyA+PSBjb21wYXJpc29uLCBzbyB3ZQ0KPiA+IGNoZWNr
IHRoZSBzYW1lLg0KPiA+ICsJICogR2V0dGluZyBhIGZyYW1lIDwgZXhwZWN0ZWQgaW5kaWNhdGVz
IENSQyBidWZmZXINCj4gPiBvdmVyZmxvdyBvciB0aW1pbmcgaXNzdWUuDQo+ID4gKwkgKi8NCj4g
PiDCoMKgCWlndF9mYWlsX29uX2YoIWlndF9za2lwX2NyY19jb21wYXJlICYmDQo+ID4gIWlndF9y
dW5faW5fc2ltdWxhdGlvbigpICYmDQo+ID4gLQkJwqDCoMKgwqDCoCBjcmMtPmhhc192YWxpZF9m
cmFtZSAmJiBjcmMtPmZyYW1lICE9DQo+ID4gdmJsYW5rLA0KPiA+IC0JCcKgwqDCoMKgwqAgIkdv
dCBDUkMgZm9yIHRoZSB3cm9uZyBmcmFtZSAoZ290ICV1LA0KPiA+IGV4cGVjdGVkICV1KS4gQ1JD
IGJ1ZmZlciBvdmVyZmxvdz9cbiIsDQo+ID4gKwkJwqDCoMKgwqDCoCBjcmMtPmhhc192YWxpZF9m
cmFtZSAmJiBjcmMtPmZyYW1lIDwgdmJsYW5rLA0KPiANCj4gQWdyZWUgb24gdGhlIGNvbmNlcHQs
IGJ1dCB3aXRoIHRoYXQgdGhlbiBpc24ndCB0aGlzIGNoZWNrIGl0c2VsZiANCj4gcmVkdW5kYW50
IGFzIHRoaXMgaGFzIGJlZW4gdGFrZW4gY2FyZSBvZiBhbHJlYWR5IGluIHRoZSANCj4gJ2lndF9w
aXBlX2NyY19nZXRfZm9yX2ZyYW1lJz8NCj4gDQo+IHN0YXRpYyBpbmxpbmUgYm9vbCBpZ3RfdmJs
YW5rX2JlZm9yZSh1aW50MzJfdCBhLCB1aW50MzJfdCBiKQ0KPiB7DQo+IMKgwqAgwqAgwqAgwqAg
cmV0dXJuIGlndF92YmxhbmtfYWZ0ZXIoYiwgYSk7DQo+IH0NCj4gDQoNCkhpIEthcnRoaWssDQoN
CllvdSdyZSByaWdodC4gU2luY2UgaWd0X3BpcGVfY3JjX2dldF9mb3JfZnJhbWUoKSBpbnRlcm5h
bGx5IGxvb3BzDQp3aXRoIGlndF92YmxhbmtfYmVmb3JlKGNyYy0+ZnJhbWUsIHZibGFuayksIGl0
IGFscmVhZHkgZ3VhcmFudGVlcw0KY3JjLT5mcmFtZSA+PSB2YmxhbmsgdXBvbiByZXR1cm4uIFRo
ZSA8IHZibGFuayBjaGVjayBpbiBjYXB0dXJlX2NyYygpDQp3b3VsZCBuZXZlciB0cmlnZ2VyIHVu
ZGVyIG5vcm1hbCBjb25kaXRpb25zLCBtYWtpbmcgaXQgcmVkdW5kYW50Lg0KDQpJJ3ZlIHJlbW92
ZWQgdGhlIGVudGlyZSBmcmFtZSBzZXF1ZW5jZSB2YWxpZGF0aW9uIGluIGNhcHR1cmVfY3JjKCkN
CmFuZCB3aWxsIHJlbHkgb24gdGhlIGxpYnJhcnkncyBleGlzdGluZyBndWFyYW50ZWUuIFdpbGwg
dXBkYXRlIHRoZQ0KcGF0Y2ggYWNjb3JkaW5nbHkuDQoNClRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhp
cy4NCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0KDQoNCj4gUmVnYXJkcywNCj4gS2FydGhpay5C
LlMNCj4gPiArCQnCoMKgwqDCoMKgICJHb3QgQ1JDIGZvciB0aGUgd3JvbmcgZnJhbWUgKGdvdCAl
dSwNCj4gPiBleHBlY3RlZCA+PSAldSkuIENSQyBidWZmZXIgb3ZlcmZsb3c/XG4iLA0KPiA+IMKg
wqAJCcKgwqDCoMKgwqAgY3JjLT5mcmFtZSwgdmJsYW5rKTsNCj4gPiDCoCB9DQo+ID4gwqAgDQoN
Cg==
