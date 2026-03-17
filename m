Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F820FD8741
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 11:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B4110E5D0;
	Tue, 17 Mar 2026 11:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="mfroBZ05";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="F8YCts/N";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F1410E4CE
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 11:20:31 +0000 (UTC)
X-UUID: 4cd6f19c21f311f1a39cd589f645bc18-20260317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Wl/3cOR8hx6QOgaDdUJLpOFCSey5F8/F1XKpRcopUcY=; 
 b=mfroBZ05RYl1YTYDFuFjyT2/AcGIK4vXNQBjTE6OxjwRfeDy0ZVYVvnDdwjm/o4I/awjs0jY4sw8p+eK8ZW0r6M4bbKQoxcR2s2uJw5l/eCfI8B7Pg2RpGmBiP+nkn7BX2X2T6bm1lxfp8OJgwxS2wKFqVNneT4X9aby41HoGO4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:33e8d6b4-ef93-4397-aef9-0af2585d5fc6, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:d92ad2d4-060f-4ecc-9ee0-121eeeb4a682,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4cd6f19c21f311f1a39cd589f645bc18-20260317
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2034183459; Tue, 17 Mar 2026 19:20:27 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Mar 2026 19:20:26 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Mar 2026 19:20:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1CZ8vEI0hGhagOItvLDsp1GGbyxvbA9ri1LODtKWn1EPKYPQA8MI/Dw+I555XP0CKPfYMnWne3i5DcvLnHOaCgT55OBK8qcKqFAi39c7TuWsr82OCYJFuIsv7ui3mOFcCZWzZqkYW78+Tmif3tnSaL0ap86hC9CEDLq5cLcN+hU06K8tRKjjDOdHUx0YNL+AcOpWf7804uvB7T9/AbY/qgxr2WFALQIQq+uT/FAgx0eLs+OQtVHsyT5e0cCKpX6AeoVo6yyheApjA8wGuT2J2k804LPxPnaE0jO48OJ39y1dSm87NDkdc5/emZtc8b+o67741BFmIHdmepRt94POQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wl/3cOR8hx6QOgaDdUJLpOFCSey5F8/F1XKpRcopUcY=;
 b=ERRphXjyh7I9sXFBWs1PiOOPTMBQNlWnHBzrzHMy4/bOROQwPC+U46Lzz+ZAY5GP9anuE9xbSol6oXl7NfvFJpYJt2tU0hxHXk3K8HxQHVJcUDXHuq+t3GYZ9BkZrYbQ3c5X7/Y0DRMQXdUwC+NfznWPZLLpQfaW6FH7MvdHAgcJOoZfrLUbhPPls8cil/wq9YEPp41RyYOeQ447xxxmaXShWBdUeDs10DaPuHTt7dDfGOsYJzmzULAmtapMs6BVLfGl93VLS1cufjI/s7RUK5hDgAn9/UJpz9H5jBxmREMjhZTRtUdnyKeK98BRkcMXKK2TUNcA3SrI6+EAEKqeYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wl/3cOR8hx6QOgaDdUJLpOFCSey5F8/F1XKpRcopUcY=;
 b=F8YCts/N+GRyxMM/3UCDvyMG+u6qkHSicce1ZgdCRL3M007n1ecwte06aDrDEYX8SCfaJWLjoYe/OEt3ao+DotpE4WchSeUni6rDsC1+7EouraR4OmkA3fCcczJlnmMy7JeYSi5itA8sDAwREhDamKNMEB6N292fUh8VjVYbN6s=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by PS1PPFE34507454.apcprd03.prod.outlook.com (2603:1096:308::2ee)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 11:20:22 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9700.025; Tue, 17 Mar 2026
 11:20:22 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "fshao@chromium.org" <fshao@chromium.org>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "gildekel@google.com" <gildekel@google.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t v2] tests/kms_content_protection: Optimize
 framebuffer management
Thread-Topic: [PATCH i-g-t v2] tests/kms_content_protection: Optimize
 framebuffer management
Thread-Index: AQHctRwLD4a7Qv2cTUydO+Pm8eJdY7WydhcAgAAfxoA=
Date: Tue, 17 Mar 2026 11:20:22 +0000
Message-ID: <b7c277bfc5167ed5943a9fdea3072abca271987e.camel@mediatek.com>
References: <20260316080735.2128881-1-jason-jh.lin@mediatek.com>
 <CAC=S1nj0Xwd4jnX1mx-093u4_thggWbqX0sDt0ntpOP+wJz-Xg@mail.gmail.com>
In-Reply-To: <CAC=S1nj0Xwd4jnX1mx-093u4_thggWbqX0sDt0ntpOP+wJz-Xg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|PS1PPFE34507454:EE_
x-ms-office365-filtering-correlation-id: f1aaa9ad-69aa-4a31-e009-08de84172dd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: QMtxxnfMV8lL3UaWi471qpafvvThFL8Q+KAFDxkY7XgzBXCcXWUKVPVeQYHWhWlMncv76MlbFCuOWwW7BknY3EZS1CJBgGTooplfJJblKILdyy34czzx/kBXd+WsvX+SbJHIgQIWj2/YhO9MAW9tfh31oc42zauIDzXkIjedWtu0jwynJAcGCJSQs78UV1DaO2cbm1bthypS/IzrfBYQljww7NTNQOLu+PwTT55C2ypF8TRV7u7qULy9jCxkOBPymjuGB25bUQvaQUMXoJzfmG5XG3jaJx29b+3dl3RT1cj9+MqwEHFkzVDNxemop7qHvg+MlVDEG0GLYrhOQqSbDyry1x6ivvn1eALSR5j2dzcU++1P7AThP5RBLGHBdaldX18aYoWePj1wl10/lsAotjrFTzbiCsKNqBZHr+AjInl1olVUvOmAg4J3XsEiIVPLqzt9GErOg4wU60oWGOCIEEF4XNsatg/t9Ti24vAcS9MhSzvEoDBuElVcZQVIimwB3UTp3gohxg4tw+IyXnzP0dXFLHB/DO3Xh214h6WbzI4Ungz3/WVrQT11cPbpgCDBpY2LD2x8dlZJD6GmsDkycG311i7PpDcLI/6pSXT3dgn4H+EbrnkbklNeJD2GL64MdE8zHB/ir1/Ccs82BGs/VTEQLr7DYfr/l1OVqslf856bsaGTOxlLOtGrPjQ9V4zmJKStrPgK2pyzC+Bd+ETwwrYsrp2DFX0/1XAPFVlt7h/Xw5DTt9E2HvKYo7/Tza3KVH66S7VRDOOdMoSdtEPYhhGrGnWHo+vwnSDLcOebus0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXpEYWxMK1c1ZHFkdnF4WHp1NlZWUVY0ODdpUWNieEdvODFMaHFlbU4rODhl?=
 =?utf-8?B?ZGZRMWtRSWdWU0p5WUxjNk5SZ3BkcCtMVlgxTDNHYWFKWHNyU3RRdG5LY28r?=
 =?utf-8?B?UlRESm4vNlhBTFV1RWxsMHFIMVJyZkZJVFdUTGZmMmUxYXFRV1dIeStXdEk4?=
 =?utf-8?B?NHBPZkljSzdFZzFhRzdZSGFmVXNRNzVFOG80NUU1ZE1IY0NDTEpuSXRQTitY?=
 =?utf-8?B?WWRoRDdGamUwTlRwMEw2NEdJTVMrN1FGK201eGpqd0xXRVFjYzRHcnQ0aklY?=
 =?utf-8?B?Z3pmMCtIeDd0RTZlcnN2cGVlSnpzRk55MWdjdkdHOG5ycVc3cW5yRysxSGZ5?=
 =?utf-8?B?bWJycDFSQmwxaENMS1lOd3Joc2tLckRuQzB3b1A4Y0FqZmpPaHpvekJEL3E5?=
 =?utf-8?B?ZFBscVFZNC9lTmdoL0dqem15RFl1UVFLR1l5eERuT1g1enAxQTNoYmhNV0J3?=
 =?utf-8?B?N1NoRng2dkhRckJwSU9Kck9IeFJITkg2T1IzTDNIR1g0VDRsSFBaMjhmN1U1?=
 =?utf-8?B?M25RZFN3VVlJSVVXRVl1MkNnWG15dytFdDdpSCtQdDhDN2YvSS9tcG5SY0J0?=
 =?utf-8?B?VWo1ckhxRzlaK0pzZlduUWtHN0kzemI2VTZ3UTJ1RVgxNGh2dGhXQS9pNUZO?=
 =?utf-8?B?eG95OGxtMTQyaGJBS2NXSmo0Q29nSzBlQVRuOE1yL0NYNnZ4QlA0U0JUWkJi?=
 =?utf-8?B?WEVESDlEVnlJUzVmNmRKVEJUdUtGRXJSRlBnK3NmVVZ6UlU3eUg0Znc0WDln?=
 =?utf-8?B?a29iRmh1eWhHMDVJL3pnTzJtcXpCTDVtZ2VxYU1WUkphSlo4TE0rTXNwR1ZF?=
 =?utf-8?B?ZEhOVHFXZnlzSmJRT0pyMzlZaUIwUWJEQkFETTBIMVAvS3hrRGNNOEhuYUhz?=
 =?utf-8?B?UnNoYkNhSm1qbnFmTmtZOG11NCtDT1NidGljYU1UbTJ0ZGsxL1VMUkl5UjRW?=
 =?utf-8?B?c2VMbDE4UTFaMjA1NzkydGdZcENvSEFYUjVwaXVsOS9oZEJPeVVuQUp6R2ZL?=
 =?utf-8?B?Tyt4S3JhcUZ1bmE4eWJuUWdDVEJBWjVlQWVvTHd0a1hjYVVkQm13L0VyRmh4?=
 =?utf-8?B?ZUpoYmdmNmRuOFN3SDVHeXZRaUZFcjhVby9QNEpicGJmUHJNY3NReXZWMmR2?=
 =?utf-8?B?TVY5N0JrUGtJVTRrU3dFREJPNFhoWU9JTTQrOHhMTjdpY1UzMDJ3SndhZ3U0?=
 =?utf-8?B?MzV5dVBPUTRhT2wyeVJVU0F1OXhwRHhFa01LbGR5M1U1UjExSFBlZzdjRjJ1?=
 =?utf-8?B?WUlUY25NcFhSRi9PZm83dFM1MlVNMUdjY2xyZS9nMFJTanZRUGNqc2NWaXpC?=
 =?utf-8?B?eXpmOGo0NzFKRnBJeW5LU3E0QzZ5ZjNjUWE3V2FpV0NMV2N3U1FqV0w1aXM2?=
 =?utf-8?B?Ky9LV0dGVFpxcDcycHFid00vaFdmdWpRckdPU0F3bTVQZStYeE9qVFF5WnJh?=
 =?utf-8?B?Vys0Vm1CSlNuRk12WEVqd3FQT3VZZVNZZnI2dnhFZU9zNW1XWHVsbG9aSWRi?=
 =?utf-8?B?bHJOMGJHMU5paUE3TlZST0VrTEM4cjJrYXF6VDY0RmhBSENmMFVPWFMzM3dH?=
 =?utf-8?B?OHovcTVWWG02cGdtTjZwVGZQMjVzRm53UG9MNUZKRWRRQnIxNDA4Qng0OXpa?=
 =?utf-8?B?N2pxNjl4akdKdWVRcTVIOUhOYzdZUloxNEhnL2xEYk4yaXJuNmdWT3ltMzJu?=
 =?utf-8?B?Z1B6VjJZRDhMUVZzd0JQd1VKV3haZWw0TFFSU2ZzSDQ1QWRnd0s0SEw2TGNi?=
 =?utf-8?B?Z3VHNmZvWlgwaWxOYmxzbUVndFlQZW1ock9hYzExcGtKSzNuTVUrYWZzNmtR?=
 =?utf-8?B?TldkUmxza0RNOG8zL1RsV1hZVXBTaEthQnJCdnJyUmh1TVc4T3VQSlFVaEtO?=
 =?utf-8?B?N2o4a0w2Qjl3UU5wSWQxVFRBQkYrOStkZjhrTURicytIWWw1MWdCeXc5Zmhl?=
 =?utf-8?B?cGI1Wm5xUnRJOU1NM2hJbVArbUhOK3ZiMHllSnV2MEJNRHAyVHBCSFVRblB0?=
 =?utf-8?B?RVBvQVlWZlVYNmpvbEJ1RFJ5SHJKN0EyL3BNUmRNbURqenhmL09IakNkT1BT?=
 =?utf-8?B?eFZaNFdNcXdXZEVqMjFFQ1UxYjQ4WGI0UjZ5L1pUT0txT1BzRGVMRnJyL1Nz?=
 =?utf-8?B?cE4zU0pwWDh0cnlrUWZlL2NVRnpsRWh6WDZIdmJ0MWhQM3pRWXlXM3pGT2xo?=
 =?utf-8?B?RU03VVdGOFBvYVJDdU9XOEdEQmJXcVVwak5scnlOdTVVd0czeUdnR1lldlcw?=
 =?utf-8?B?OEorZEZFR3ErbnlVN04wOTFKSkxjamhTNXNLTVd1amoxcWdmMVloL3pYdlY1?=
 =?utf-8?B?OWRMRDVkbWgzc0tSSWVzWE4rN3d6ZHJ2SkRJaGhBWXh4KzNaOTV5Z2hlQWl6?=
 =?utf-8?Q?1DAdSeH+b9n+k/rc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C73AA99C856A34F856C7E50FC5A5219@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fJuJGbHJo9IJ1GcVG7lKkraFmEDcWIAPvufqbZco3lrRFG1jR6ekyEfnisDZ0700qpHrbhRulkXfW+9WT8z3xipK4RH69l5+CElZ0Uane4SWrHV1STgi/zPfSAJlDJo/WD6cSJK/5kq1DcZ7TfIwl/dBA1fGhllxy1eL/sJpfd1hFA+YOXfiArf/D9Los0lYQpArpanz+j8lRhJEeAhsRUXZ6TFroLDzu/WzufcmhlTxXcHSX6YLng71G1H6i7kdeF43czWpcxc1EdKMVAJG1rzoVWqfFY7jkxXKUjsChiz/VdCS/elj6g8WPccG6KsgynLnbL+F6O9AN98geCxSMg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1aaa9ad-69aa-4a31-e009-08de84172dd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 11:20:22.0711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PeP+30UXe2e1AdJI+5WlQj3K71Ly/sRVUNgbxnMdsUT872X9meRKZKA8DKMGWsnqg+0bN2oUj/ZpTqwaHV80ZJiyFp8V8vFerviZm6dGYiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPFE34507454
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

T24gVHVlLCAyMDI2LTAzLTE3IGF0IDE3OjI2ICswODAwLCBGZWkgU2hhbyB3cm90ZToNCj4gT24g
TW9uLCBNYXIgMTYsIDIwMjYgYXQgNDowN+KAr1BNIEphc29uLUpIIExpbg0KPiA8amFzb24tamgu
bGluQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gUmVmYWN0b3IgZnJhbWVidWZmZXIg
bWFuYWdlbWVudCB0byBpbXByb3ZlIHJldXNhYmlsaXR5Og0KPiA+IC0gQ3JlYXRlIGZyYW1lYnVm
ZmVycyBvbmNlIHBlciBwaXBlIGF0IHRlc3QgaW5pdGlhbGl6YXRpb24gdmlhDQo+ID4gwqAgY3Jl
YXRlX2ZicygpIGFuZCByZXVzZSB0aGVtIGFjcm9zcyBhbGwgc3VidGVzdHMNCj4gPiAtIENlbnRy
YWxpemUgY2xlYW51cCBpbiByZW1vdmVfZmJzKCkgY2FsbGVkIGF0IHRlc3QgZml4dHVyZSBlbmQN
Cj4gPiAtIFVzZSBwZXItcGlwZSBmcmFtZWJ1ZmZlciBhcnJheSAoZGF0YS5mYnNbSUdUX01BWF9Q
SVBFU10pIGluc3RlYWQNCj4gPiDCoCBvZiBzaW5nbGUgZ2xvYmFsIGZyYW1lYnVmZmVycw0KPiA+
IA0KPiA+IEVhY2ggZnJhbWVidWZmZXIgaXMgY3JlYXRlZCB3aXRoIHRoZSBhY3R1YWwgcmVzb2x1
dGlvbiBvZiB0aGUgZmlyc3QNCj4gPiBvdXRwdXQgdGhhdCBjYW4gY29ubmVjdCB0byB0aGF0IHBp
cGUsIGF2b2lkaW5nIGJ1ZmZlciBzaXplIG1pc21hdGNoDQo+ID4gaXNzdWVzIChlLmcuLCAzNTA0
eDIxOTAgcGFuZWwgaW5jb3JyZWN0bHkgdXNpbmcgMzg0MHgyMTYwIGJ1ZmZlcikuDQo+ID4gDQo+
ID4gRm9yIE1TVCB0ZXN0cywgbXVsdGlwbGUgb3V0cHV0cyBzaGFyZSBiYW5kd2lkdGggYW5kIG1h
eSByZXF1aXJlDQo+ID4gbW9kZQ0KPiA+IG92ZXJyaWRlIHRvIGZpdCB3aXRoaW4gYmFuZHdpZHRo
IGNvbnN0cmFpbnRzLiBXaGVuIG1vZGUgb3ZlcnJpZGUNCj4gPiBjaGFuZ2VzIHRoZSByZXNvbHV0
aW9uLCBwcm9wZXJseSBkZXRhY2ggcGxhbmVzIGJlZm9yZSByZW1vdmluZyB0aGUNCj4gPiBleGlz
dGluZyBmcmFtZWJ1ZmZlcnMsIHRoZW4gcmVjcmVhdGUgdGhlbSB3aXRoIHRoZSBuZXcgZGltZW5z
aW9ucy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSCBMaW4gPGphc29uLWpoLmxp
bkBtZWRpYXRlay5jb20+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBLYXJ0aGlrIEIuUyA8a2FydGhpay5i
LnNAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlv
bi5jIHwgMTk4ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tDQo+ID4gLS0tLQ0KPiA+IMKg
MSBmaWxlIGNoYW5nZWQsIDE1MCBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5jDQo+ID4gYi90
ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMNCj4gPiBpbmRleCBmMzVjOWZhNzNhNTcuLjZi
NDI4N2I0MTY2OCAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9u
LmMNCj4gPiArKysgYi90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMNCj4gPiBAQCAtMTA3
LDEwICsxMDcsMTUgQEANCj4gPiANCj4gPiDCoElHVF9URVNUX0RFU0NSSVBUSU9OKCJUZXN0IGNv
bnRlbnQgcHJvdGVjdGlvbiAoSERDUCkiKTsNCj4gPiANCj4gPiArc3RydWN0IGhkY3BfdGVzdF9m
YnMgew0KPiA+ICvCoMKgwqDCoMKgwqAgc3RydWN0IGlndF9mYiByZWQ7DQo+ID4gK8KgwqDCoMKg
wqDCoCBzdHJ1Y3QgaWd0X2ZiIGdyZWVuOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiDCoHN0cnVjdCBk
YXRhIHsNCj4gPiDCoMKgwqDCoMKgwqDCoCBpbnQgZHJtX2ZkOw0KPiA+IMKgwqDCoMKgwqDCoMKg
IGlndF9kaXNwbGF5X3QgZGlzcGxheTsNCj4gPiAtwqDCoMKgwqDCoMKgIHN0cnVjdCBpZ3RfZmIg
cmVkLCBncmVlbjsNCj4gPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBoZGNwX3Rlc3RfZmJzIGZic1tJ
R1RfTUFYX1BJUEVTXTsNCj4gPiDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgY3BfdGVzdHM7
DQo+ID4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IHVkZXZfbW9uaXRvciAqdWV2ZW50X21vbml0b3I7
DQo+ID4gwqDCoMKgwqDCoMKgwqAgYm9vbCBpc19mb3JjZV9oZGNwMTQ7DQo+ID4gQEAgLTI1Nyw3
ICsyNjIsNyBAQCBjb21taXRfZGlzcGxheV9hbmRfd2FpdF9mb3JfZmxpcChlbnVtDQo+ID4gaWd0
X2NvbW1pdF9zdHlsZSBjb21taXRfc3R5bGUpDQo+ID4gwqDCoMKgwqDCoMKgwqAgfQ0KPiA+IMKg
fQ0KPiA+IA0KPiA+IC1zdGF0aWMgdm9pZCBtb2Rlc2V0X3dpdGhfZmIoaWd0X291dHB1dF90ICpv
dXRwdXQsDQo+ID4gK3N0YXRpYyB2b2lkIG1vZGVzZXRfd2l0aF9mYihjb25zdCBlbnVtIHBpcGUg
cGlwZSwgaWd0X291dHB1dF90DQo+ID4gKm91dHB1dCwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bSBpZ3RfY29tbWl0X3N0eWxl
IGNvbW1pdF9zdHlsZSkNCj4gDQo+IEFsaWduIHRoZSBwYXJhbWV0ZXIgb3JkZXIgd2l0aCBvdGhl
ciBtb2RpZmljYXRpb25zIGZvciBjb25zaXN0ZW5jeQ0KPiAoaS5lLiBvdXRwdXQsIHBpcGUsIGNv
bW1pdF9zdHlsZSwgLi4uKQ0KDQpUaGFua3MhIFRoaXMgd291bGQgYmUgbW9yZSBjb25zaXN0ZW50
Lg0KSSdsbCB1cGRhdGUgcGlwZSB0byBjcnRjIGFuZCBhbGlnbiB0aGUgb3JkZXIgbGlrZToNCihv
dXRwdXQsIGNydGMsIGNvbW1pdF9zdHlsZSwgLi4uKQ0KDQo+IA0KPiA+IMKgew0KPiA+IMKgwqDC
oMKgwqDCoMKgIGlndF9kaXNwbGF5X3QgKmRpc3BsYXkgPSAmZGF0YS5kaXNwbGF5Ow0KPiANCj4g
PHNuaXA+DQo+IA0KPiA+IEBAIC0zMTQsMTMgKzMyMCwxNSBAQCBzdGF0aWMgdm9pZCB0ZXN0X21z
dF9jcF9kaXNhYmxlKGlndF9vdXRwdXRfdA0KPiA+ICpoZGNwX21zdF9vdXRwdXRbXSwNCj4gPiDC
oHsNCj4gPiDCoMKgwqDCoMKgwqDCoCBpZ3RfZGlzcGxheV90ICpkaXNwbGF5ID0gJmRhdGEuZGlz
cGxheTsNCj4gPiDCoMKgwqDCoMKgwqDCoCBpZ3RfcGxhbmVfdCAqcHJpbWFyeTsNCj4gPiArwqDC
oMKgwqDCoMKgIGlndF9jcnRjX3QgKmNydGM7DQo+ID4gwqDCoMKgwqDCoMKgwqAgYm9vbCByZXQ7
DQo+ID4gwqDCoMKgwqDCoMKgwqAgaW50IGNvdW50Ow0KPiA+IMKgwqDCoMKgwqDCoMKgIHU2NCB2
YWw7DQo+ID4gDQo+ID4gwqDCoMKgwqDCoMKgwqAgZm9yIChjb3VudCA9IDA7IGNvdW50IDwgdmFs
aWRfb3V0cHV0czsgY291bnQrKykgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNydGMgPQ0KPiA+IGlndF9vdXRwdXRfZ2V0X2RyaXZpbmdfY3J0YyhoZGNwX21zdF9vdXRwdXRb
Y291bnRdKTsNCj4gDQo+IEl0J3MgYmV0dGVyIHRvIGhhdmUgYSBmb2xsb3dpbmcgYGlndF9hc3Nl
cnQoY3J0Yyk7YCBvciBhIGJyYW5jaCB0bw0KPiBoYW5kbGUgdGhlIE5VTEwgY2FzZS4NCj4gVGhl
IHNhbWUgYXBwbGllcyB0byBvdGhlciBgaWd0X291dHB1dF9nZXRfZHJpdmluZ19jcnRjKClgIHVz
YWdlcy4NCj4gT3B0aW9uYWw6IGNvbnNpZGVyIGludHJvZHVjaW5nIGFub3RoZXIgc3RhdGljIGhl
bHBlciBpZiBpdCdzIGENCj4gcmVwZWF0ZWQgcGF0dGVybi4NCg0KT0ssIEknbGwgYWRkIHRoZSBl
cnJvciBoYW5kaW5nLg0KDQo+IA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBw
cmltYXJ5ID0NCj4gPiBpZ3Rfb3V0cHV0X2dldF9wbGFuZV90eXBlKGhkY3BfbXN0X291dHB1dFtj
b3VudF0sDQo+ID4gRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSk7DQo+ID4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWd0X3BsYW5lX3NldF9mYihwcmltYXJ5LCAmZGF0YS5yZWQpOw0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlndF9wbGFuZV9zZXRfZmIocHJpbWFyeSwg
JmRhdGEuZmJzW2NydGMtDQo+ID4gPnBpcGVdLnJlZCk7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlndF9vdXRwdXRfc2V0X3Byb3BfdmFsdWUoaGRjcF9tc3Rfb3V0cHV0W2Nv
dW50XSwNCj4gPiBJR1RfQ09OTkVDVE9SX0NPTlRFTlRfUFJPVEVDVElPTiwNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIENQX1VOREVTSVJFRCk7DQo+ID4gwqDCoMKgwqDCoMKgwqAgfQ0K
PiANCj4gPHNuaXA+DQo+IA0KPiA+IEBAIC01NzcsMjEgKzU4NiwyNCBAQCBzdGF0aWMgYm9vbCBz
aW5rX2hkY3AyX2NhcGFibGUoaWd0X291dHB1dF90DQo+ID4gKm91dHB1dCkNCj4gPiDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gc3Ryc3RyKGJ1ZiwgIkhEQ1AyLjIiKTsNCj4gPiDCoH0NCj4gPiANCj4g
PiAtc3RhdGljIHZvaWQgcHJlcGFyZV9tb2Rlc2V0X29uX21zdF9vdXRwdXQoaWd0X291dHB1dF90
ICpvdXRwdXQsDQo+ID4gYm9vbCBpc19lbmFibGVkKQ0KPiA+ICtzdGF0aWMgdm9pZCBwcmVwYXJl
X21vZGVzZXRfb25fbXN0X291dHB1dChpZ3Rfb3V0cHV0X3QgKm91dHB1dCwNCj4gPiBpbnQgcGlw
ZSwgYm9vbCBpc19lbmFibGVkKQ0KPiANCj4gWW91IG1lYW4gYGVudW0gcGlwZSBwaXBlYD8NCj4g
DQoNClllcywgYnV0IEknbGwgYXZvaWQgdXNpbmcgdGhlIGBlbnVtIHBpcGVgIGluIHRoZSBmdXR1
cmUuIFRoYW5rcyENCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0K
