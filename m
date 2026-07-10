Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFC5C44506
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 07:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9327310E13A;
	Fri, 10 Jul 2026 07:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="oU1ZBFbH";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="o+Zh6Cmm";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B26810F7E6
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 07:21:05 +0000 (UTC)
X-UUID: e6a8f1807c2f11f18dc8c9802ae25ab1-20260710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=I+NWD0mfhIfuVqzzVDWuPoeCK05djAvCuZo2LPLN92o=; 
 b=oU1ZBFbHkM9p3i6Em80bKdp2rXUIjwVjJa6Fe4xBJ+83YyXFNFD7qbfbPwWKpfUHQLbkiinA+NMVerUC1mtNddkptK+BEcSRqmXEdDgbeM8WMw17aAhZgFYwKywYU5vUIs+Mx4A/zyozrweOEICfWpjBwwhyg/EQRycK+RcMBO8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:992da7e0-66c2-44fd-8be6-d4afccb68790, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:d497b38, CLOUDID:9906f418-ab14-4403-9336-76696324c5a8,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
 :-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:80|1,File:130,RT:0,Bulk:nil,
 QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,
 ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e6a8f1807c2f11f18dc8c9802ae25ab1-20260710
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1358806162; Fri, 10 Jul 2026 15:21:00 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 10 Jul 2026 15:20:58 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 10 Jul 2026 15:20:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUt4At6jBaeZhJn83zvu+gO5a19vUc+/qqQjiOF9VCUYC449hdfzhdqy4/5JuyR5r4Y3Gb4MpuaXvzxXpG+Shko35kYrhO7pt56wCUxZGfn473AvJzlSx9MjXgQ7+nP9V+xnJJ7cUyjAV2R38IjCZd1K1Mnaf6pA28yu4wr6YqFU/9uE1a/qLPyFEQSUGY3BjZVM+yrixr3xYBCmjdakIgZwKH0FxDUAD06LrWeL/YRFH0JBDrVuXW9Jv8um3QHP/nYBVi90udU3BimPX1h6Lf++gD+9Ku4wpKIR2PcT1IvGLFxMLdyh2+2/czQA1DJ4+OiZFNUjqH/ZDApYkeVAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+NWD0mfhIfuVqzzVDWuPoeCK05djAvCuZo2LPLN92o=;
 b=W5hxZpq1lw1LK7amVq6VgOcv30LdahvJm6WkuTFXPZFUwguH3wazFz6X7vhcHeArNE734+02V2a47QC9fvgBYN1TNK6nFVZzWnBkBFeZpsRGMFhAS+pR588PuuNfhuJFtbiwQzatyA9mpTOyZdNQ2CuzbJquMfWglg1Yx2vG8gyJ3NLZdXx1BQTuUtLdsdzJ2aHm8NjwSm6aldZDlz+xEQy295fZWS8nA017RCxKhSA7AJ9q0Z/i8Xt3iH9BcWim6T/GIh+m17SzsnC+4a4brV/0hpP7xzs0I/yHk3Rqp5duS0+JfnENrtyAxLHi2c7BKbJQc5X+4xNgfqeMMAkvWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+NWD0mfhIfuVqzzVDWuPoeCK05djAvCuZo2LPLN92o=;
 b=o+Zh6CmmGkzqjG9ycR4FjVmoH2TcwPq9aAQYP7QE3Ru1nkX7pzuTDF0MvY7e31F4k5MAx4+M+xIXxxmhRERnFezirIGI812xV3YStYNZ4pgSWqD1/Zj24MsED+F3my6QYe3J4XOTNH8fhKS3EeBqC/pTjURkXB6OjmxJqMUQ3Ws=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by PUZPR03MB7254.apcprd03.prod.outlook.com (2603:1096:301:102::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 07:20:54 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 07:20:53 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "suresh.kumar.kurmi@intel.com" <suresh.kumar.kurmi@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "gildekel@google.com"
 <gildekel@google.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>, "fshao@chromium.org"
 <fshao@chromium.org>
Subject: Re: [PATCH i-g-t v2] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
Thread-Topic: [PATCH i-g-t v2] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
Thread-Index: AQHdAVV9F5AhXflWfEiY7iw5xcNBxbZkT9hggACGdACAABQmgIAA2EuAgACz3wA=
Date: Fri, 10 Jul 2026 07:20:53 +0000
Message-ID: <dd0fa20c95b8e0b66eb5a4f0cdde4fa44516e5d6.camel@mediatek.com>
References: <20260621081043.598388-1-jason-jh.lin@mediatek.com>
 <520d7fe2b1ef01d81cbb9cba7ca79e5cbd15922c.camel@mediatek.com>
 <CAMNLLoTHYoE3AiFeTaCj14ktcvuMjR0LoewUnmR+AXpoEoxpZw@mail.gmail.com>
 <bd0165e7-d245-4780-ae78-691589bc808a@intel.com>
 <e6b4e5b8b39eae29a2749d15e1d13a34b7d24b04.camel@mediatek.com>
 <667d2cc5-a7ab-4c2c-9218-e50e01001b9c@intel.com>
In-Reply-To: <667d2cc5-a7ab-4c2c-9218-e50e01001b9c@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|PUZPR03MB7254:EE_
x-ms-office365-filtering-correlation-id: f955e0fd-3211-44f1-6382-08dede53c725
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|23010399003|366016|1800799024|4143699003|6133799003|4133799003|22082099003|18002099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: quErSkjyg2nFlxvzcf6KXC7wkdiEutm7hYa/ilaDi4yo9H8mq6+XiNMi90Er5dr0SaRY0/Ysf+Qh/QjWpbXc5NxcI72Yqkhni0lvbPochbnYp91zMWFPXgd4qJcRsCuwf70ukJJsSTlZ6uFe1BZlg0G8NoYu/u8dGiY2PZ8a64Wvw3deZmc/5zaMMC3I0qkOu2ob40NG0IFkq57qjpU35RBnazNAqX1tklQFC14BgH0ah3unf/6ck5D/1z0tWGH8AaB5y7XhVExW6zF4JRkI4OdXNpYvqH8quZumGdX0tY9gCmRA/JtZEeLeOeeQf4Lsco686GGEK7G16RnF18KmrD1nNpOHjqTVWWJy6yS2ncEREKo5LSvE8RICP/SZoqftDy/rlzu59KJTWwX7b6OQq7l6h4bt/1+QjFUeNnJNUpdgUl5/s+aTQr8GsFUffwuD7esACOfaxB4avCL+JgExZGFe6V67JkpOm6+CveHyeHqztAvZ0vF1t5hMApS4ADbRDTwZnpXWtowQqWoHsT9aLKKqLG7eSIs4TSaoZ6jF2k7SA8Hdb2iZAox391XcjwxAgcXtVecwRwj8DEGMRN27UX4XjrCGrFSGmZWwZf/i7W8/835XlehwTS5F+IgfbAv3p11SnX47sb4/Kpdchb653QJH8BT3zO1lVU1btE5pYAs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(4143699003)(6133799003)(4133799003)(22082099003)(18002099003)(56012099006)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tno3aWR2Nm00bmZMK0tIelpVYW1nSUhXUFExVFNORS9XSjUxRzFLZHdjMmRO?=
 =?utf-8?B?T3FkWFRkOU9QeGY1YmtQMWg1aXNTTHh2b3NZNHFyTjVjMWo3UkxOSWVwUk1O?=
 =?utf-8?B?QmV1bWVYb2hvN1dCaW0xV2g4RlJwRmpFZDF5UzR3TzJaU3hlMHpGN1d5bkVa?=
 =?utf-8?B?WXN6Zjk1WEF0VHVVNDg4SFZodlRxQ0t2YzlMRkpzditDZXM2Z21yV2lxalJ3?=
 =?utf-8?B?WHdSUzNxNVV5aDhnU3FZUGhYa24wS2tJL3prT1RFSmlSYUR0N2lNR1E2Sjd3?=
 =?utf-8?B?SFh1eGJ1SkFkaVhWUm92aytrMmNCdUZueVZqaGxkazRtQnhGUURYTUVldmRq?=
 =?utf-8?B?dldpWlRnNGs0V2IrdUdBZ0FtZ3dqaFpIbERYamcxcTJ3djlNRTl0VkRGSzl6?=
 =?utf-8?B?MnBYVzJVcFBTZC9yeFdDN3lzSG5VQXZzZk83REpQcWR0blRacmRUS3V3UU9O?=
 =?utf-8?B?eDZqWVM1UENCQWdFUlIrQXZGNFBON24xWENWYzcwNHQwOEtjeU84RlViQkZN?=
 =?utf-8?B?L29lbTRodFplNk1HRE9CNHc4ZldQZWZzRm5FclUybkRJSGl5RkFQWThlVWx2?=
 =?utf-8?B?RnUvZ2QxOVN3UEJJU0RVa0pZaTZmazcxVFhGT2QxM1JBQ2JzOTZ1eDkzL2gx?=
 =?utf-8?B?SC8rSk04L1ZOT2ZRbGFweG80OEpDU1hsOThvWkYrRDVCRU5TOXVGY1JhZzV1?=
 =?utf-8?B?RUpHclBpbTRLVUoveStKbzhsZkdGRGtYZGtXZlFMOGRQYjBnc3lWTDRLL2Rv?=
 =?utf-8?B?TE8vVUtXdmx3RlQ5SVRkSXVHeEtEMDk2eUNrTGdSZ053TzBOQk1RdHNSNkhH?=
 =?utf-8?B?TitBdE9wN1dQenN3UVR6NkdTUGt5UzZobnUxNG4xNWdBWWpML2VYWDZjVGR3?=
 =?utf-8?B?TEtvYkRIekh4ZHJLVG14OXZZelZzS2I4dWJ4cldWMk53SG5oWEE4emh0Ny9a?=
 =?utf-8?B?T1c5MGJnaTlxSmMrQzBua2c1S0tFTDZEK0V1SkowMmxFTldEcERIdzc3WFJL?=
 =?utf-8?B?QWNobWlQU281Z28rSHpocXZoMzM4cmVTOVVZeHFoMGJKTkNSdEdoSVpEWng1?=
 =?utf-8?B?cDBjR0JLMkY3RU1LMDZiNnM2R0pUdnVraFRTREVOZ3I3OFYzbHdkMEl1bklW?=
 =?utf-8?B?WWE2QmsrMWNNRU1WN0JERDlLYXVTbmtnYnYyUUlEOG5RNVhWbWxHVTUvQk1p?=
 =?utf-8?B?YWNFQ3g4UEovUTdXcnVjaEdtQmdnZm5XN01aNXNHQWxOZ29WeFFlUTJ3TnJO?=
 =?utf-8?B?SUdNaUxkVGY5N2hHR1JWdk81czJRYzFKOUd1VmpRcll3MWYvRklndWJIb3JT?=
 =?utf-8?B?eFFMNnQ0NjRVbHo1NDMrcXlONTJpcXRiSE5MNzhNY21ldUdBRzlvUkJmcVk5?=
 =?utf-8?B?MXh1QlRiR0RmbW9PTlhsNTd2NDd2STFRRFhKdytBQXFyS0tjZVNZSVZ0RUdy?=
 =?utf-8?B?M1EyRGpEaFdic2ZQUHdKcGFxK0gzMjl2cjUwWkRHaFJ5MW1yUU16Mmkycnk0?=
 =?utf-8?B?cnZEd2xjanBFcWVONFhNR000RXZiZlZsMGlLOHh2VkpRS3pKanN6Zk9UQXpV?=
 =?utf-8?B?TlZNT3lzNG90QzRLZ1lheFFEYjVTVXNLSU40aDFHQk9Ea3VhSkNkd1hBTzdS?=
 =?utf-8?B?T1Y5cFNYekhrSlgvY296UUhhbjJySFh3dHdqemlrYnRpa0RySVBKc2lrTGFr?=
 =?utf-8?B?N3lCdWVCNGwwSk5QeUZ6S21ZUUs5QkFNMFlITXVOWXdMSTBSRGwyZXVXMjF3?=
 =?utf-8?B?UjNmR1lPb2ZhbkhlRG1qR2FiaUNtaFlEcmtBVDhsN29pQkV4cktBMjJKNGFN?=
 =?utf-8?B?VU1YSDU0eS9JYkxRcEsrWk56L2Fvek9FbGRmS1dQanRSZmY5TzFjL2d6ellL?=
 =?utf-8?B?VGw3NDQ5MXo0YTZPb2N2SHFDVTE4VkZwamo0ODVlSTNuekFGTit2c2R1ZHMy?=
 =?utf-8?B?bW1US2lCNEVMdmdSS0QxRHZVamMxTlUzUEVuV3JrNzNkVDJWMTFiS0hJOU1o?=
 =?utf-8?B?K0xsVERtVERtZXp0ZUMrWXduK01IbEx5UjFidDFXZ2d4Wi9ESzdiMThZTDRO?=
 =?utf-8?B?R1BCd3VRK29ocjU5MURzWkU3Ni93Tno1VG5YNjc4RU9DcXYyMnpyZHN5bE5F?=
 =?utf-8?B?MmNZbFQzQ05jWWFVeE5HSHlGbGh0enpacDk3Z0V2enFkUVZ3UyswTEJpNy9k?=
 =?utf-8?B?T2hxRWhpRnFnS2RWSk9DbHVpbDRNVGc5K2RiMGdJbGY1RjBJZklGVWIxNWJt?=
 =?utf-8?B?cEdScnA4V1FGajdrNm16QmpucUwxUWdMRjFPQWwyTUN5WjJLRVQwbVpzWGtY?=
 =?utf-8?B?VDBrRm1vYnBWVDBlUk9JWlFtTTd3K3FHSjB1RnVyWitWZitLSm0vaU4rVHVB?=
 =?utf-8?Q?/llVTevf/W+N0//E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5BB72A1496A974E927DF15B37D60825@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TgRDhNg0pop/ECJOg6f9Rk469ynouDRf/1o4jlkHVOwFOrAQ5oFnT5x2ndAUaTVCJ/9n4CYxdCmLjyF5DxE/h62FwdctFqqqZl3DGeNQYB4il6EXMszeaIv4/C132vN+DUvtVVoJ4yow642yhxgeOla/3NYTrJZVoVhhKQoof/UoDD41juiJpB9FnZ34TVrabe24KYnmefvx2zjZO71axHl81jHMLFUbUNN1KQM2lFrFx6SBf5rxtFZRGfFdq2z9yq5Vzzo1vL66aNstG7FKmFYlcxu1WMwwAZC5mFWLO7b8RkY+/4nEdE4HLuBsOrrYIFYOOz7RYWJXOpBuuhyp2w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f955e0fd-3211-44f1-6382-08dede53c725
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 07:20:53.7317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wDEcRS6FMcGrJlF1UEx0KuVzvBimUkie6pkI2vgB9J+iBjKJOM+cscFDKkifoC+v+1v3OaDkHVLdwqt6+h6hJRewIl9Rsq/7A7OKJ8RGcPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7254
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

T24gRnJpLCAyMDI2LTA3LTEwIGF0IDAyOjA3ICswNTMwLCBTaGFybWEsIFN3YXRpMiB3cm90ZToN
Cj4gDQo+IE9uIDA5LTA3LTIwMjYgMDE6MTIgcG0sIEphc29uLUpIIExpbiAo5p6X552/56WlKSB3
cm90ZToNCj4gPiBPbiBUaHUsIDIwMjYtMDctMDkgYXQgMTI6MDAgKzA1MzAsIFNoYXJtYSwgU3dh
dGkyIHdyb3RlOg0KPiA+ID4gwqAgDQo+ID4gPiBIaSBKYXNvbiwNCj4gPiA+IMKgIA0KPiA+ID4g
UmV2Mg0KPiA+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTY2OTIzLypyZXYyX187SXchIUNUUk5LQTl3TWcwQVJi
dyFqSkRMSzdwRzBadXhtR0QxMzZEZFpqV3pSUGYxTFpVdWM2WllvZ3RQZGk4bHlkajU3ZTdyRzNL
LUI1LTFTSmFtN1REd1ZuNks3QkRGYm92YzQ3OFNYbF9IWmsxUCQNCj4gPiA+IMKgIGkgc2VlIElH
VA0KPiA+ID4gYnVpbGQgZmFpbHVyZSwNCj4gPiA+IMKgIA0KPiA+ID4gY2FuIHlvdSBwbGVhc2Ug
Y2hlY2s/DQo+ID4gPiDCoCANCj4gPiBIaSBTd2F0aSwNCj4gPiANCj4gPiBCZWNhdXNlIHRoZSBz
ZXJpZXMNCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNjg3NTlfXzshIUNUUk5LQTl3TWcwQVJidyFqSkRMSzdw
RzBadXhtR0QxMzZEZFpqV3pSUGYxTFpVdWM2WllvZ3RQZGk4bHlkajU3ZTdyRzNLLUI1LTFTSmFt
N1REd1ZuNks3QkRGYm92YzQ3OFNYdXgxdy0xbSQNCj4gPiDCoA0KPiA+IGhhdmVuJ3QgbGFuZGVk
IGF0IHRoYXQgdGltZS4NCj4gPiBJIGhhdmUgY29uZmlybWVkIHRoaXMgcGF0Y2ggaGFzIG5vIGNv
bmZsaWN0cyBpbiB0aGUgbGF0ZXN0DQo+ID4gY29kZWJhc2UuDQo+ID4gDQo+ID4gSSByZXNlbmQg
aXQgYWdhaW4sIGJ1dCBpdCBzZWVtcyBbaS1nLXQgdjIgUkVTRU5EXSB3aWxsIG5vdCB0cmlnZ2Vy
DQo+ID4gYQ0KPiA+IG5ldyBidWlsZC4gU28gSSBzZW50IGEgW2ktZy10IHYzXSwgcGxlYXNlIGhl
bHAgY2hlY2sgaXQuDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTY2OTIzLypyZXYzX187SXchIUNUUk5LQTl3
TWcwQVJidyFqSkRMSzdwRzBadXhtR0QxMzZEZFpqV3pSUGYxTFpVdWM2WllvZ3RQZGk4bHlkajU3
ZTdyRzNLLUI1LTFTSmFtN1REd1ZuNks3QkRGYm92YzQ3OFNYbHF0eGF4YiQNCj4gPiDCoA0KPiA+
IA0KPiA+IFRoYW5rcyENCj4gPiANCj4gPiBSZWdhcmRzLA0KPiA+IEphc2Rvbi1KSCBMaW4NCj4g
DQo+IEhpIEphc29uLA0KPiANCj4gUGF0Y2ggTEdUTQ0KPiANCj4gUmV2aWV3ZWQtYnk6IFN3YXRp
IFNoYXJtYSA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+DQo+IA0KPiBQbGVhc2Ugd2FpdCBmb3Ig
Q0kgcmVzdWx0cyBiZWZvcmUgbWVyZ2UuDQoNClRoYXQncyBncmVhdCwgdGhhbmsgeW91IGZvciB5
b3VyIHJldmlldyENCg0KDQpSZWdhcmRzLA0KSmFzb24tSkggTGluDQo=
