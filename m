Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3CBF531EA
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 06:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206E210E0B0;
	Tue, 14 Apr 2026 06:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="tELj8OJw";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="dsSy2Ijo";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943E010E10A
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 05:59:54 +0000 (UTC)
X-UUID: 25de026c37c711f19a16598d5ca7f8ec-20260414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=F6XpBUTGeq6QNQqqWAj1aCew3nWmV42nr+Ff2V5r+dw=; 
 b=tELj8OJwys1+R7MtJ1/XeJXcs+9ktEQ0CKXX1p0KqwMomWNNA23GmjAEU7qIi+GPAm5A5410qvGrsGGppmHV5Ob5RzODnafet8EETtR+msZL7OuoS6snZlS0OLCweIoiGUfM+4M7hIksFS5nDLyFAw2bcAz/XHRL4AiJRWv0nQY=;
X-CID-CACHE: Type:Local,Time:202604141337+08,HitQuantity:3
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:4eef5634-7b15-4e06-aca0-5ce313bb5d8e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:7559d5d5-060f-4ecc-9ee0-121eeeb4a682,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|110|111|817|836|865|888|898,TC:-
 5,Content:-10|-8|-5|14|51,EDM:10,IP:nil,URL:0,File:130,RT:-1,Bulk:nil,QS:n
 il,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
 0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 25de026c37c711f19a16598d5ca7f8ec-20260414
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1344168970; Tue, 14 Apr 2026 13:59:49 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 14 Apr 2026 13:59:48 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 14 Apr 2026 13:59:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7JifFRuNYoLGK5ZNacTkYouIXzEQoxTyHh4xAq9vfXHT3Ly4WHv1Yoftqtq7HvrwRKyB6rkDh6AAhZBRRd1VEVT5CXm2hGd+k4oz6dqNzQIzQsRw3MCsjHaDsSD/AQkdeiSnxE/IvNNcbHP8iLjUceoEUjEw1yUerdus/7rhupu9Y4Qw+VkGn+3RR1PmMXecom18HCwMrb6kLxwIxT/8e9gubUq0iy74n5ATzhoBcTdB5x4MGuOatwlEobah/HPU1UQlBfvz6yqknRWCIEG0aZKWG/QJoTmWRUQxbfq5p7bdTv0OwuBehcaFT6fDK5xAGJtPaaYyLi1ke0Kl77mXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6XpBUTGeq6QNQqqWAj1aCew3nWmV42nr+Ff2V5r+dw=;
 b=K7i5/W/WA/ZOnFbXq61ErLTRoKx7FzMhQ75Uk2j+of20zDLtYo40qS5dV78pRb33uFb2bdZ/ro/PCuGgvJtGB2muO4FPruebwcpUY3qONnu9V9jYlujK8UoMew9JxZGVeDXNVwst4EDiyDd0DPMPVTG2mOKsb9cWx9TdO/56JKlP7UbwQZtncuACgh+JD7YYU61EAVNmFCwIgFEjXYbgeC3tw25QmHxDE1JKjUp0cEeHxgwec2VrwOWnBUFfwxR7/FbO9KvuoEYE0GGScAp+l7kFvjb364fGlD3meCVaI6euEGbr0adqhtQJ/E2zyg0hb6WwQ15e1o8qv8ajALeiWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6XpBUTGeq6QNQqqWAj1aCew3nWmV42nr+Ff2V5r+dw=;
 b=dsSy2IjoE3wZ/eDgBqdxBxPSO777M64qih300y1DxPsaz+4iEY+bil8Diz94YUF/dM2qtFlI26ngjx5f7RC8wE1QU+LmerPWd/4Ko0oF9a7oKUDgFOvCWC9GWWlLnVYCZr9Ep1zAJ8qy45ZdeofQRMZ5DOOS7cVZVuokRE97bmY=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB8493.apcprd03.prod.outlook.com (2603:1096:820:13b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 05:59:45 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 05:59:45 +0000
From: =?iso-2022-jp?B?SmFzb24tSkggTGluICgbJEJOU2JPPk0bKEIp?=
 <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "bhanuprakash.modem@gmail.com"
 <bhanuprakash.modem@gmail.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "fshao@chromium.org" <fshao@chromium.org>
CC: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?iso-2022-jp?B?UGF1bC1wbCBDaGVuICgbJEJEREdwcEMbKEIp?=
 <Paul-pl.Chen@mediatek.com>, "markyacoub@chromium.org"
 <markyacoub@chromium.org>, =?iso-2022-jp?B?TmFuY3kgTGluICgbJEJOUzZVaiUbKEIp?=
 <Nancy.Lin@mediatek.com>,
 =?iso-2022-jp?B?U2luZ28gQ2hhbmcgKBskQkQlNj1UIhsoQik=?=
 <Singo.Chang@mediatek.com>, "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t v5 0/3] Optimize framebuffer management
Thread-Topic: [PATCH i-g-t v5 0/3] Optimize framebuffer management
Thread-Index: AQHcv/RzS1oTTSWog0iCMt0MNQtMWbXeJ98A
Date: Tue, 14 Apr 2026 05:59:45 +0000
Message-ID: <b6338e3bf73923a2aadfff523607316d2a159431.camel@mediatek.com>
References: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB8493:EE_
x-ms-office365-filtering-correlation-id: 9c86fd15-42d3-47c6-9212-08de99eb0781
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|6049299003|376014|18002099003|22082099003|4053099003|56012099003|38070700021;
x-microsoft-antispam-message-info: z2GMiEwTJ/bIcGF/uPREoaTbMOLt1clbkpnpFwgOigWVMXfdphE8i3N2kCc4OvS4ShNjckaUaY2jHfpqNyjLLkLEh5i314JeYkQ+9F9f6Slqg0KEIt1dHodpsyf3BwEO2Ue+Ln1d9LWhVWG83B/vB65GGpV8nGzquVqlVbaaacheskgSbgFjnJY0+NeCDNzBV5pVtzsHlt/l8W1lCJj2/LTfa7KLZ1VhZhH7tKaZPUELydTCmoiI5xgloA2EYvglT9eWuf9In56HVu0EiA5BFNQ4wbR/MQX8Vx8edjKuxJ1X8TZz2uS4vpa9h0KwnEBhCsX/7Ix5oTf4vHqwUe6q6N1SgqKZbN9FNqrYobNjgS7WqDbeL+gh8tQSsaWDW/amaErTd7z14VdQR0C7hZjTcXiA/8y7w43AGrK0Idz9OW3Uzr159cMUP0tQoJSvhr2FymCFO7+H6xz8Ytz8AxZTx4EUe6eRvZFs9tGsw3dtjuPv8ZeBxw2tpSQLR87RDS5S69hMc+T7NexOOvB8RmDMQGaOCDLpxU0UmsrzGi+V7w4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:ja; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(6049299003)(376014)(18002099003)(22082099003)(4053099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?Q0VYQVVFdnFrZi83UUxiRzF4Ny9wdTBMQitUM3lncUxHSFhTbVlBVzdF?=
 =?iso-2022-jp?B?R3B1TG9XM1picDgyRTBGYkQwRFBUT0FzUTJWZllzWW9wc2NXWXhPNExF?=
 =?iso-2022-jp?B?Y0EwRDJqYkNnRXd4U2VPTzdJM0ZGSU0wWS9hRUVac01KQ1d4TUNLUFVY?=
 =?iso-2022-jp?B?dUlpSkhSVjhsbXRSVG9wSGdXWTZreEpzZWZMTlJUb1NFMjJ1TS9tRER6?=
 =?iso-2022-jp?B?d3RjeklDZ0dteWRoVUYrU3UxZzI4NXZaSXluL3hORDVBRFVublpqRVhM?=
 =?iso-2022-jp?B?K1NCZGZGdEIrcFVlTHNlNVp4bVFNWitld1FiNmhZVlBvZ25DSXlVbU9M?=
 =?iso-2022-jp?B?UlRNREwxN0pHeUNHN1Vua0x5K1dKdnFCbHhrOEZoVkNpZnBuK1Y2MDRG?=
 =?iso-2022-jp?B?VFlURVhvdW9abGM1UXBuMzdVQUlBdXZ4ZnFiTVdQQXFHTkpMSzl1R3Bl?=
 =?iso-2022-jp?B?VnBQSWV1TnhERGRLdHVXN0FWdEs5QU1hRi9temNFQkJhLzJPa3Ara1Zt?=
 =?iso-2022-jp?B?MUlZa242SkFpcEw3QnYvZDlIaytZSkRvR3BGam1tVEt6V2NjR0l4VHIr?=
 =?iso-2022-jp?B?WXErWXV3elBpN3owNGRENXBIWDNaWEo2VWs3dTB2akNjOThJZGFVN3dV?=
 =?iso-2022-jp?B?WFVJN05rZ1lpaW5rMFh0cWFsekMwY1RueENhOXFFVW54SC9PQWhqVDZD?=
 =?iso-2022-jp?B?NGZ4L3RidzZhQzBhS3kydVlpWmMycEZiQWlENTYxOXJ6Z00xMGEzTDR0?=
 =?iso-2022-jp?B?cTE3eVhhbHY2d2VwSzJVNkYwSFA2TGdlQlVGVVpYUjMyWWxQbW1OMGZm?=
 =?iso-2022-jp?B?bDFZOUxSRUxJbzRiMEcxMnlpYTEzT0duOW8rdzArYk9EUXpLQWZQWS9i?=
 =?iso-2022-jp?B?eS9za3lqQnc5Q1BrU1FoS1NmYkdFT1phMmMwT1NlVTV5WWFpNUlUTUpF?=
 =?iso-2022-jp?B?anBWakhyUWxzdjloTEh4OTB4M01vMVZIMVM2VjJ2dEhmL1RhUm4ySHdj?=
 =?iso-2022-jp?B?cXFpeDFyam1HQVVGL1dpR0NMc3VCTGM0SWRBd1NCSW53WWpkL2JVTUVu?=
 =?iso-2022-jp?B?RDJwM1pqTzIreE9NdHgvZDZvL2NKV1BjUXBxNVIvc1dNTTdtQ1VuR1RE?=
 =?iso-2022-jp?B?TkJYeEtWYUJhZ3Z4VTBzeHpxSm9FVTF4d3h3bkFFbnR2dW9mL1dOWmFG?=
 =?iso-2022-jp?B?NkNFWXFrekE3c05oVzg4VVFVbnJJdzBVbUY0Z2tCdXBqaXlXU1U4Y2Va?=
 =?iso-2022-jp?B?MUhmLzJuTlFxY05ScU05Y1JidjJjblNMVk5IRXA3QlJPK3AvSzRQMGZk?=
 =?iso-2022-jp?B?cmtwRWRzcEpCc3Jjd1N3MWIyRFFuK1Y0R3NxaUtGUDdwenlQMkozZDdC?=
 =?iso-2022-jp?B?bnZTM2VPdi93Y2ZwUzZYaktVclREY3FDVzRHR0RpNVkyOHc2UmpmZ2R3?=
 =?iso-2022-jp?B?OXlCaC9xc2gyQktqVktCWVlkclZZeVB1UzdXQ3JyUSs3bk80Z3NsNGxv?=
 =?iso-2022-jp?B?Q0toY2gzWTg0WWNOMVp5SWRKQWJmTUMvbG1wNy80Vy8yQkllWU5KM3d3?=
 =?iso-2022-jp?B?THJ4WW1IeHRBbVVYRXBiZ2JCVHdtWHhFRUZxZzMyaUZJODI0SjdoYWZD?=
 =?iso-2022-jp?B?aHlXdURjc3N1Y1M4dkdSd2hlRFg2MUZmbG1YVVhVNWNZYVFidEVXczNG?=
 =?iso-2022-jp?B?RFl4N2ZrSjZ1SnNWTHVjL1VVZUtGL1BIOENtbXltaW9vdytqR3pHVmtj?=
 =?iso-2022-jp?B?dG9wR2xkMTlSQTdpWDFxMjM1RDRYVC9Wa3dXMk5WcFpMT290Mm1SblNn?=
 =?iso-2022-jp?B?R1dvdXJpbmVEbFdqWGJSelBadmZEeGJablpuOUxVcE9rczYxMXNCUlhF?=
 =?iso-2022-jp?B?SnZrcXlJQldPOGE5dlZmcjFNeHlXbm5mRC8zMWI4ZkJhb2p2K2VSSFEv?=
 =?iso-2022-jp?B?N1MrS3U5SEw5ekdIbXhmd1MySnh3cVVmOXZhNGloY1N4YWQ5OGpaZHRX?=
 =?iso-2022-jp?B?VzdzNFViRGNsNkhyS3Z3TW9HNGVMQ3l2N1c2cVVQYm9SNy9SRmcvMlhY?=
 =?iso-2022-jp?B?R3JrSlJOQmFaa3d3WUpzZ1Y2RHVnRWZ0bm1GS3RXMVJucWEwNVFacEhq?=
 =?iso-2022-jp?B?dWl1MU9DOGIvUnk4eG9XajBZYWU4MU1Jb0ROTVVoUDJHRTR1MU9nRVBq?=
 =?iso-2022-jp?B?TUFiWHlKdlFpalYwRDRNd3Zoc0E5YVlzd1lFajMwWDA0N2l5Um1pRldr?=
 =?iso-2022-jp?B?T0t4MGsybVpQTGZteVQycnc5eWhtdVFuT0xHL3hxVlhIZGYyUmhvblFk?=
 =?iso-2022-jp?B?YnpLOU1xK2t6cU5YNkRGR3VnQVI0WEJ1VmE4M2cyTGd1N2Y2dFd2clNL?=
 =?iso-2022-jp?B?a05NNHYzZ0RJVk9rbEVOek5GMExsV3hqRzczbE03Z2NKNnZtTDNCcW9w?=
 =?iso-2022-jp?B?VkhSLzZVWitGeE9mRU94TmJXblNPOU41Q3VnRTQ0cFBINURWS3ZjYlha?=
 =?iso-2022-jp?B?clZkWlJNbGhmdzEvRStQQk81OFRYUFp3SmhlaTNpZTYreDNVNHBReVIy?=
 =?iso-2022-jp?B?Tit1QlJqND0=?=
Content-Type: multipart/mixed;
 boundary="_002_b6338e3bf73923a2aadfff523607316d2a159431camelmediatekco_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QfHQIMU+WQybq0THtm6YEEdwaV6QzGvFUeSCrmIFm1oK0q3gfTj9kTznZfdi0y00fqw5GDxrTp4WT0zHcEvo/coJku55ljGa9bbV3KPv1Jt3ZcbVV9pq4JH2PzcRLCzDUVPz6quxpJbuzLQ/X+gC2ROSsLf63PTCtafAVThausdaZigaBYveYYUwyNJfm3/KDOuUbBmngd3yRBLPmBDRbElRVpyTZcbvE4Njj2kn38+4XU4ib2ad8id40QogMYpxmPVmi3VPwwAp3n8HiiTk+YdhXMz6mepS/CAwbzxWyDM2fhrBQdKd+YYhzDY0E7wIEIR0Ze5IScPFF6qqqqM5xw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c86fd15-42d3-47c6-9212-08de99eb0781
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 05:59:45.5464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: snysjgghSPObilnyEdC5bJXHSomEva/Mw0+6Kfs7cJZCYa7yCBejZWhwVZ3f+BEVETIOadU+yRf7pxNosFj92hoKjirXteSDGOuQqrUtJMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8493
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

--_002_b6338e3bf73923a2aadfff523607316d2a159431camelmediatekco_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable


--_002_b6338e3bf73923a2aadfff523607316d2a159431camelmediatekco_
Content-Type: text/markdown; name="ATT00001"
Content-Description: ATT00001
Content-Disposition: attachment; filename="ATT00001"; size=1809;
	creation-date="Tue, 14 Apr 2026 05:59:45 GMT";
	modification-date="Tue, 14 Apr 2026 05:59:45 GMT"
Content-ID: <3015A2780B145E4BA888A0208D3B6FF4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgS2FydGlrIGFuZCBKYW5pLA0KDQpDb3VsZCB5b3UgdGFrZSBhIGxvb2sgYXQgdGhpcyBzZXJp
ZXM/DQpJIHdvdWxkIGFwcHJlY2lhdGUgYW55IGNvbW1pdHMgb3Igc3VnZ2VzdGlvbnMgeW91IG1h
eSBoYXZlLg0KVGhhbmsgeW91IGZvciB5b3VyIHRpbWUuDQoNCkJlc3QgcmVnYXJkcywNCkphc29u
LUpIIExpbg0KDQpPbiBNb24sIDIwMjYtMDMtMzAgYXQgMTE6MjAgKzA4MDAsIEphc29uLUpIIExp
biB3cm90ZToNCg0KPiBSZWZhY3RvciBmcmFtZWJ1ZmZlciBtYW5hZ2VtZW50IHRvIGltcHJvdmUg
cmV1c2FiaWxpdHk6DQo+IC0gQ3JlYXRlIGZyYW1lYnVmZmVycyBvbmNlIHBlciBDUlRDIGF0IHRl
c3QgaW5pdGlhbGl6YXRpb24gdmlhDQo+IMKgIGNyZWF0ZV9mYnMoKSBhbmQgcmV1c2UgdGhlbSBh
Y3Jvc3MgYWxsIHN1YnRlc3RzDQo+IC0gQ2VudHJhbGl6ZSBjbGVhbnVwIGluIHJlbW92ZV9mYnMo
KSBjYWxsZWQgYXQgdGVzdCBmaXh0dXJlIGVuZA0KPiAtIFVzZSBwZXItQ1JUQyBmcmFtZWJ1ZmZl
ciBhcnJheSAoZGF0YS5mYnNbSUdUX01BWF9QSVBFU10pIGluZGV4ZWQNCj4gwqAgYnkgY3J0Yy0+
Y3J0Y19pbmRleCBpbnN0ZWFkIG9mIHNpbmdsZSBnbG9iYWwgZnJhbWVidWZmZXJzDQo+IA0KPiBF
YWNoIGZyYW1lYnVmZmVyIGlzIGNyZWF0ZWQgd2l0aCB0aGUgYWN0dWFsIHJlc29sdXRpb24gb2Yg
dGhlIGZpcnN0DQo+IG91dHB1dCB0aGF0IGNhbiBjb25uZWN0IHRvIHRoYXQgQ1JUQywgYXZvaWRp
bmcgYnVmZmVyIHNpemUgbWlzbWF0Y2gNCj4gaXNzdWVzIChlLmcuLCAzNTA0eDIxOTAgcGFuZWwg
aW5jb3JyZWN0bHkgdXNpbmcgMzg0MHgyMTYwIGJ1ZmZlcikuDQo+IA0KPiBGb3IgTVNUIHRlc3Rz
LCBtdWx0aXBsZSBvdXRwdXRzIHNoYXJlIGJhbmR3aWR0aCBhbmQgbWF5IHJlcXVpcmUgbW9kZQ0K
PiBvdmVycmlkZSB0byBmaXQgd2l0aGluIGJhbmR3aWR0aCBjb25zdHJhaW50cy4gV2hlbiBtb2Rl
IG92ZXJyaWRlDQo+IGNoYW5nZXMgdGhlIHJlc29sdXRpb24sIHByb3Blcmx5IGRldGFjaCBwbGFu
ZXMgYmVmb3JlIHJlbW92aW5nIHRoZQ0KPiBleGlzdGluZyBmcmFtZWJ1ZmZlcnMsIHRoZW4gcmVj
cmVhdGUgdGhlbSB3aXRoIHRoZSBuZXcgZGltZW5zaW9ucy4NCj4gDQo+IC0tLQ0KPiANCj4gQ2hh
bmdlIGluIHY1Og0KPiAxLlNwbGl0IHRoZSBjb21taXQgdjQgaW50byAzIGxvZ2ljYWwgcGF0Y2hl
cyBmb3IgZWFzaWVyIGJpc2VjdGluZw0KPiAyLlJlbW92ZSBvdXRwdXRfZ2V0X2RyaXZpbmdfY3J0
Y19hc3NlcnQoKSBoZWxwZXIgZnVuY3Rpb24gYW5kIHVzZQ0KPiBpZ3Rfb3V0cHV0X2dldF9kcml2
aW5nX2NydGMoKSBkaXJlY3RseSB3aXRob3V0IGFzc2VydGlvbnMNCj4gMy5SZW1vdmUgdGhlIHVu
bmVjZXNzYXJ5IENSVEMgaW5kZXggY2hlY2sgaW4gaWd0X21haW4oKQ0KPiANCj4gLS0tDQo+IA0K
PiBKYXNvbi1KSCBMaW4gKDMpOg0KPiDCoCB0ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uOiBB
ZGQgcGVyLUNSVEMgZnJhbWVidWZmZXIgaW5mcmFzdHJ1Y3R1cmUNCj4gwqAgdGVzdHMva21zX2Nv
bnRlbnRfcHJvdGVjdGlvbjogUGFzcyBjcnRjIHBhcmFtZXRlciBhbmQgdXNlIHBlci1DUlRDIEZC
cw0KPiDCoCB0ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uOiBBZGQgRkIgY2xlYW51cCBmb3Ig
TVNUIHRlc3RzDQo+IA0KPiDCoHRlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYyB8IDE2OCAr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTIx
IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQ0KPg0KDQoNCg0K

--_002_b6338e3bf73923a2aadfff523607316d2a159431camelmediatekco_--
