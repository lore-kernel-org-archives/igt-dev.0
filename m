Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3D2CD5BAF
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 05:43:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA7E10E05F;
	Fri, 22 May 2026 05:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="uS8rihK8";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ei2amBPN";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971E110E05F
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 05:42:50 +0000 (UTC)
X-UUID: f04e2190559e11f1b5a00d44d12bea5a-20260522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=lJmTHprE4l+tpjBSLq43sxtr3VSJr15gdUvxrdu0I/c=; 
 b=uS8rihK8wOQtoPRjf0ZO0cz3EEKcsMR/FLfwee+hnXvLBDn5yWXTBHaOmki+qsGMU+KgveHAIkpIkrsRWCHvhHTnIza9vHiPhVvHkL1EBWiTENYBfwuZMHsrsCRZrgcLy5bV2n4Slj8t7dkk/9xX/P9QbFJPzyj6yUpPHD773pk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:9b719eb8-c769-44df-a27b-9390683a9abd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:9091e75, CLOUDID:8e864446-e650-4d81-a877-d298d8f44b5d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f04e2190559e11f1b5a00d44d12bea5a-20260522
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1551425758; Fri, 22 May 2026 13:27:35 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 22 May 2026 13:27:33 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 22 May 2026 13:27:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guW9CS2LMRAxjFHopYKOHqwLmJ7BYfccT24CjTLxWxTDKnzYGLwVxc8JJLpTKJ4m+8p/vkmJ8drIhqEo4yQ8JdCcUDk+DJ8mDdWCRsDsQWgcITWGnENnwrXm/CtnLFkEvuFdK/7oe80X2G3nxZdUaP/Bx5RL/CFpea98aONI+hWQcrVBJygz1lLBQSQ24Jb6mvnLdlp/qrghMKSOSD4i+fg49szbfAhEs+Vs5r2gVPDxBAWFvu7TeD/uXinX5y6JAKb8Bvl3QzZOnf5BYzXiti2vDSo1tbyGjT/Yeq5Y25p5y4NPhvWC8Ie/6NySL6eevOxDTr5tuQhtrJ25rEgYlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJmTHprE4l+tpjBSLq43sxtr3VSJr15gdUvxrdu0I/c=;
 b=e+I/i+tWYGekkMTDV9/chmk64XP7aNl7eFbX8CUddua65VaUYbcKbe0KAcWhEyUNVyoqSav3yOZClIW3xcL2IirIYkVHqx2vYMFpzuIfDpXVFj1Dba4NjyQcEUVZIfM7oalgeagUBoQSK2VHEckjU+2ah959gae3LDWo0MeHufYUbt6OGKI4zPDI8hzLPcbVn+OVfWLeIYiG4Aj2tlS/CuGadtxc8ma8B2ANQ1Vj0Xig86sMhx8dfZX3d/2kSV4Xv6sU0SpLLdu8FPGNDIkUdaGJWx/cmlWUXyFpAwRC+rynRz2YITkaLt+PHqUfIqVDlaQpicepUSWu+lt/ZJ3BPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJmTHprE4l+tpjBSLq43sxtr3VSJr15gdUvxrdu0I/c=;
 b=ei2amBPNf8mHKbsDXYzFfO9Svftt2QUAJ/xY/x31Yo+yUvvUnQ6Q7xMrm4aTb8dEYGI+958cD5ocq2FWJSVESqq6Ou501GIhjP7NfYdnl3RU2SCr6NXTc2TPXA8p38JmFC9dEp4f6iAjSOUr6YOmcYl9vDt/+NFVFOyMePp4OuE=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7260.apcprd03.prod.outlook.com (2603:1096:820:9c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.7; Fri, 22 May 2026
 05:27:30 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0071.005; Fri, 22 May 2026
 05:27:30 +0000
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
Thread-Index: AQHc6CSPGBSfXb3UvEKHnz7wd/zZw7YW7uCAgADdDgCAAH/sgIABEb0AgAApfIA=
Date: Fri, 22 May 2026 05:27:30 +0000
Message-ID: <c099c49e08fe86007b53597c2bfa86a0f8ef3f08.camel@mediatek.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
 <ag28FVTooBC6Yly3@intel.com>
 <53284b68be0216eab50946da686968691fa59a56.camel@mediatek.com>
 <ag7g07pHLWgPViVh@intel.com>
 <988bcdc233564b398a87190cb40489d43ed3922c.camel@mediatek.com>
In-Reply-To: <988bcdc233564b398a87190cb40489d43ed3922c.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7260:EE_
x-ms-office365-filtering-correlation-id: 153cf321-5d14-4f51-05e6-08deb7c2d1e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700021|56012099003|22082099003|18002099003|4143699003|11063799006|6133799003;
x-microsoft-antispam-message-info: 3I0F5krrJEIMdnv7aYKNQqr1C598npCWWWYQusNIsYSN6DoMFcYlfGvKMpxWFkzClHV2evRAN0HEqu0EdQKnS5EnobgNp7U+cUylhoVwQhfKJ9fw2VahLVuxyuwtHS5uRTt+ajhlE9TP9qfAFfLxcadEvAsII6PwUb9Vsx3ElE2NxD8vG7zoaz7/76RJTxxzYB7mlwkTQv23V7TJ14xsxJLn0veCjmIo6/7wCdNOk77H3PC8Tiv638CAOS9XwEhaBw0cv6rOGqjfVRDZ8+FIDRjZUkhKFH0regw5GZUHiSOZaOUMIxbxRNX9g5tvTxwhH+Fse7xD1L2t+OS3wnc7xIVqi8Xqm0nMb83ItAwf2sP60a3HE5yToTk7CPPyn+k/sxgCUyMOVZEN2ZyGFVwxTRDrhqX7kzFJQ29lDenVPdl6X7pxuPFo0jVvQ0iFZAQheP1T+piWq7WmQicWJi7WU3AYEFOyGB9bLop++UCAyDbl+54M7T/tfk0gkKR4kR4QkSePW7Z/PZ9wbeQSESx1FlpZMGC9jTSNRFXeVZPxTPmFbriOwWA8GCC9CZeormcHyliH2cwB29uEG2lymNwBx2k7agIlfeHOPepJVJp2378L19FDdDAM1g/+P/edZINmv+BcZFDJovO4pwVPnzEJyURlUz8dBgI+ilj2YwAjUIh79PhJqDSfgwHEPhSMndkw45st6Bv5tC8CxmDswbH+zWqiTWvK2anhEjFBM9O3tTyieEPwVE/mmflXqCrZbTru
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(56012099003)(22082099003)(18002099003)(4143699003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWJpZW5JdFkzTE00TmR6WE80ZHpBTzVGWVZabjNxNDErdWpvUTN4b2JnRlZi?=
 =?utf-8?B?M3NkZE9yemR0bFlVUGVGZXRUZGM3VXhmU2R4bkFabDBrYitPSGdBeS9pOVRZ?=
 =?utf-8?B?YWp3UGRlS3lLQ2FidlBjRER4REppU2lWclB0K1dTNlZUQys4Uk1aaVJjNnRa?=
 =?utf-8?B?S1hTSGlLa1BHb1pxaVc2RWhxS2pyNmVUd3FWQ3poUm5ROFFiV2VRNUt2dUI4?=
 =?utf-8?B?dURYY2NkcXNmc25WMDlkYXlubzlmTVh5RDlZV1hXRk4xc0RJYkVFMzlxdEhu?=
 =?utf-8?B?Tk00TDc0b0VCT2JpNWZYWWZwYzd0ZWY5cUhjS08wVnlqeGlBN2Z2Rm1Qdm9x?=
 =?utf-8?B?TmtyYXozVUF2RUtWV0poR1JnOUp3Wm9HSHJUUllBRllYUXJEdW1IOURSL0Mx?=
 =?utf-8?B?SVpUMkxOdEY5VGNoNHZOc0V2M1lYbVRCdUZMNmhIRldwWUloQU5Sa1hTcVpl?=
 =?utf-8?B?MVZLWWZ4MmNrUy9JanJjT2tCTjFSQVYyaFo0QnhSMzE4L2xYMHFmQU1LRm1N?=
 =?utf-8?B?MVBFNGQrM3MvSVlCKzlaSDhhak9GamdtY2NiUTFmZ3FMUTV1a1N6VVE0TnlI?=
 =?utf-8?B?VE1lUjlZL3FpYWYvNnI2eUdVQ0lIUHdUSFJ4NXY3bEhEOUJweG9qajVpamQ5?=
 =?utf-8?B?QnlkTFNvRGdPWEtiVUlKd3ZaZEtCRnRCbVJJekVYeGVrL1pFclVIcFJPSm9B?=
 =?utf-8?B?aGdMSTVrOThaMUZvaURMYnZqamc0UFB1RXVnV0RjL05qdktaQmh3bnZRNk5W?=
 =?utf-8?B?aVRjZWwwTjVSL0tGeXp0MFdKRjlqMXdzOXJCbnFzWm1CVzk0N3Y4d2NWeSs0?=
 =?utf-8?B?WU1STitNKzFiendaeW4rbjhFYXNlQzd2cVhuQ2VaSVJlNlBjSWNaUmt4TXJE?=
 =?utf-8?B?ekRjcUNZYmg5cGZKcEZYbkF4VWk4VE1tNE5BTi9vdjJHUHM1MDd0dGVZbzZq?=
 =?utf-8?B?TnBDdDYzYmhadnVVODZsendxeHBRYUJ1Q2lEMlZlZisvcEhRamZBNkMrbVRo?=
 =?utf-8?B?cWhLV0lJakprbDdsbUxuUzArUmNoOVhtSUlvc3dHVWVhdFoycllaSjBmandY?=
 =?utf-8?B?QjcvUDB0djVNZ2UrcE53ZXVoMmYwdnhwYzFQVzM2R3k1ekRGKzFWc2QyRG5S?=
 =?utf-8?B?NVZXZ3JMUEx2QmJ5eXR4Z0dJV3BtOW94WVk5ZStkODNBblA4dHRJRFNVd0pt?=
 =?utf-8?B?clRpbGxrVmpGRHk4NU5VRkYwaTJYRHlnVXNiTDNYYS9VUUhEMlBpYmovaDRw?=
 =?utf-8?B?em1jTlFkQkh6RDBwbWZJUWJQektITE1yMDIwdmplWVNMQXF4aSsvdWR3Wm1p?=
 =?utf-8?B?UU9aQ2MrUXg2emJ1YXFsWU9Wa0hhY2FvdUF4Nk1nZDZkSFpKV2hneVVVSjFL?=
 =?utf-8?B?QWk0ck1FVk5tTUtsV0t5RUErYW5GN1JGYVVJdEYzUEJoZFJWbWtFUWZiYmlu?=
 =?utf-8?B?OUt4ZDVGbnlyeWUzWUduNXdYL2t2bWJHS1NqaDgzRW44dWpwZFhvZTNUUVBr?=
 =?utf-8?B?SWI1YmFkNGhxc2ZycUdQdGE3TzYwOFF0WWJsYjQ3V2gyY0t5dWptK1dXT3RN?=
 =?utf-8?B?Y3hOMGw1WUQvNnZKZ0FXVFFuRjFDbDJ5NVBtMkZ6OXNOL3psR0wyQ21LaGFm?=
 =?utf-8?B?WnppZ2ltYUIzemhCOCt1d0FwZ29JcEJ5U09UNVk3d3k5YmdyakUyVzJOSWJz?=
 =?utf-8?B?UXNjcy9RQWw0YSs0S3pRNkVPSHhRVWVkVWZwVElCQjZabllFbzgwbDFSWXFO?=
 =?utf-8?B?YURzTlVTRWJjRVhIRlF3UFJPQm50ckNPTE9QaUFIMEN4UUJkSkpRSnArbnpP?=
 =?utf-8?B?cnh4N1ZMMjFmYlk0WDFVSUp5YmlkUFVsbXFxblIwak9iZnVzWjR5a1lGcDBN?=
 =?utf-8?B?UXFJVzA3MWhzQWs3L3pnS3hFV1lrdFk1TS9VTVh1TFZLVklhRFZlYXdsZ1lZ?=
 =?utf-8?B?MEVSRDEvQzV1cDBiaWFjaC84MEZrYkNONHdscm0wdlYyc0JSdCtuUXQ5Yzls?=
 =?utf-8?B?cy9ab2VYbDZ5b0U0L24vbEhXZmhIbStDVVBJZFpSM3M1Ry9SNWdBS2VySko1?=
 =?utf-8?B?emEzRjNNRUdiT2hLY2pibU9VRm5kT3RLZ0E3eHA1WnRXL2krak45dGVwWGw4?=
 =?utf-8?B?ZU9ZTlN2ZXhFbzF5VDdNZ2RIMGxWSFVwc1BOVnczV2c3SnVLYkJ6NUZZQjc1?=
 =?utf-8?B?d1lza0wrejA2SkYrMzdCRnEyblBqYWI3Wm5tUFlaVllGMWdmdkloVXhFczVI?=
 =?utf-8?B?dFVpRHJLUXo1bUVwOW02YVdCbFhkYmJVY3dyc0c4QTRBS0ZaaW5IQVEwQkg2?=
 =?utf-8?B?YWljdjkyRGVnbm9wTVZmL0M1NW1GN1ZvWjIxKzNVQWNvSUpSV2gvUVNxRExK?=
 =?utf-8?Q?k/IYNx0igzuObWmQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3DB0985DF838B46B107B599746EE591@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sBCvdlUzFbZ3ysZbXcnKC3t7Hh9ObY8hTvGn3QcictbxZiA7WRdECbuETPbOQi/ImHqP4/EIfcABNtb6YiN1o3HsanRZzFZrNsIniqq5qyyLB+PTOVoqvk/H9kazxJwVmqayeIWzZDRIN16bOQIkKpRTqFvxQBM7ifeH94p9XFPeFNsfExcnl2PlsJfAWYTgpURIYO84rI8ov9XQ1bniM61OFLw+R4PZm2W8cKgFwtwDWXjHOsI7/QEyreu/A+qCBy/jKqhOUauFTgXXvjT9hY53WpBGEJ1nRu2ovJ+Rh0RVD5FE3yKVumifeqN5ViGSflUS8yaEb4yx4zAtX0IEzQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153cf321-5d14-4f51-05e6-08deb7c2d1e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 05:27:30.5945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aPOnyqixMgVBNkaItAteW1I2bWkRXY2+nmTsVHPFsEVg+WhkwFcNEGbJwgo8MzHT03TPwaMGgtH+IOlM/g37i7ByGqGR9g3HtzXHab7zfzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7260
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

T24gRnJpLCAyMDI2LTA1LTIyIGF0IDEwOjU5ICswODAwLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+
IE9uIFRodSwgMjAyNi0wNS0yMSBhdCAxMzozOSArMDMwMCwgVmlsbGUgU3lyasOkbMOkIHdyb3Rl
Og0KPiA+IE9uIFRodSwgTWF5IDIxLCAyMDI2IGF0IDAzOjAxOjI1QU0gKzAwMDAsIEphc29uLUpI
IExpbiAo5p6X552/56WlKSB3cm90ZToNCj4gPiA+IE9uIFdlZCwgMjAyNi0wNS0yMCBhdCAxNjo1
MCArMDMwMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOg0KPiA+ID4gPiBPbiBXZWQsIE1heSAyMCwg
MjAyNiBhdCAwMjo0NjoyNlBNICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+ID4gPiA+ID4g
VXNlIGlndF9kaXNhYmxlX2NwdV9kZWVwX3NsZWVwKCkgdG8gcHJldmVudCBDUFUgd2FrZXVwDQo+
ID4gPiA+ID4gbGF0ZW5jeQ0KPiA+ID4gPiA+IHRoYXQNCj4gPiA+ID4gPiBhZmZlY3RzIHZibGFu
ayB0aW1lc3RhbXAgYWNxdWlzaXRpb24uDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhpcyBhZGRy
ZXNzZXMgdmJsYW5rIHRpbWluZyBzdGFiaWxpdHkgaXNzdWVzIG9uIE1lZGlhVGVrDQo+ID4gPiA+
ID4gcGxhdGZvcm1zDQo+ID4gPiA+ID4gd2hlcmUgQ1BVIGVudGVyaW5nIGlkbGUgc3RhdGVzIGNh
biBjYXVzZSB+MjAwdXMgdGltZXN0YW1wDQo+ID4gPiA+ID4gaml0dGVyDQo+ID4gPiA+ID4gYW5k
DQo+ID4gPiA+ID4gdGVzdCBmYWlsdXJlcy4NCj4gPiA+ID4gDQo+ID4gPiA+IENhbid0IHlvdSBm
aXggdGhlIGtlcm5lbCB0byBnZW5lcmF0ZSBhY2N1cmF0ZSB0aW1lc3RhbXBzPw0KPiA+ID4gPiAN
Cj4gPiA+IA0KPiA+ID4gSGkgVmlsbGUsDQo+ID4gPiANCj4gPiA+IFRoYW5rcyBmb3IgdGhlIGZl
ZWRiYWNrLg0KPiA+ID4gDQo+ID4gPiBDdXJyZW50bHksIHRoZSBrZXJuZWwgdGltZXN0YW1wIGl0
c2VsZiBpcyBhY2N1cmF0ZS4gVGhlIGlzc3VlIGlzDQo+ID4gPiB0aGF0DQo+ID4gPiBldmVuIHRo
b3VnaCB0aGUgdmJsYW5rIElSUSBmaXJlcyBhY2N1cmF0ZWx5LCB0aGUgdGltZXN0YW1wDQo+ID4g
PiBjYXB0dXJlZA0KPiA+ID4gYnkNCj4gPiA+IERSTSBjb3JlIHZpYSBrdGltZV9nZXQoKSBpbiBk
cm1fY3J0Y19nZXRfbGFzdF92Ymx0aW1lc3RhbXAoKQ0KPiA+ID4gY2Fubm90DQo+ID4gPiBhdm9p
ZCB0aGUgZGVsYXkocmFuZG9tbHkgfjIwMHVzKSBpbnRyb2R1Y2VkIGJ5IHRoZSBDUFUgaWRsZSBl
eGl0DQo+ID4gPiBzZXF1ZW5jZSBiZWZvcmUgdGhlIElSUSBoYW5kbGVyIGNhbiBhY3R1YWxseSBl
eGVjdXRlLg0KPiA+ID4gDQo+ID4gPiBBZnRlciBsb29raW5nIGludG8gdGhpcyBmdXJ0aGVyLCBJ
IHJlZmVyZW5jZWQgaG93IEludGVsIGhhbmRsZXMNCj4gPiA+IHZibGFuaw0KPiA+ID4gdGltZXN0
YW1wcyBhbmQgbm90aWNlZCB0aGV5IHVzZQ0KPiA+ID4gZHJtX2NydGNfdmJsYW5rX2hlbHBlcl9n
ZXRfdmJsYW5rX3RpbWVzdGFtcCgpIHRvZ2V0aGVyIHdpdGgNCj4gPiA+IGdldF9zY2Fub3V0X3Bv
c2l0aW9uKCkgdG8gY2FsY3VsYXRlIGFjY3VyYXRlIHRpbWVzdGFtcHMgYnkNCj4gPiA+IGNvbXBl
bnNhdGluZw0KPiA+ID4gZm9yIElSUSBoYW5kbGluZyBkZWxheXMuIFBsZWFzZSBjb3JyZWN0IG1l
IGlmIEknbSB3cm9uZyA6KQ0KPiA+ID4gDQo+ID4gPiBIb3dldmVyLCB0aGlzIGFwcHJvYWNoIHJl
cXVpcmVzIHRoZSBoYXJkd2FyZSB0byBwcm92aWRlIHNjYW5saW5lDQo+ID4gPiBwb3NpdGlvbiBp
bmZvcm1hdGlvbi4gT24gTWVkaWFUZWsgcGxhdGZvcm1zLCB0aGlzIGhhcyBub3QgYmVlbg0KPiA+
ID4gZnVsbHkNCj4gPiA+IHZhbGlkYXRlZCB5ZXQsIHNvIGRpc2FibGluZyBDUFUgZGVlcCBpZGxl
IHN0YXRlcyBzZWVtcyB0byBiZSB0aGUNCj4gPiA+IG1vc3QNCj4gPiA+IGFwcHJvcHJpYXRlIHNv
bHV0aW9uIGZvciBub3cuDQo+ID4gDQo+ID4gVGhlbiB5b3Ugc2hvdWxkIHByb2JhYmx5IGRvIHRo
YXQgaW4gdGhlIGtlcm5lbCwgb3Igbm90IGF0IGFsbC4gSQ0KPiA+IGRvbid0DQo+ID4gdGhpbmsg
YWRkaW5nIGhhY2tzIHRvIG1ha2UgdGVzdHMgcGFzcyBtYWtlcyBhbnkgc2Vuc2UgYmVjYXVzZSB0
aGVuDQo+ID4gd2hhdA0KPiA+IHlvdSBhcmUgdGVzdGluZyBkb2Vzbid0IG1hdGNoIGFueSByZWFs
IHdvcmxkIHVzZSBzY2VuYXJpbyBhdCBhbGwuDQo+ID4gU28gYWxsIHlvdSBhcmUgZG9pbmcgaXMg
c3dlZXBpbmcgdGhlIHByb2JsZW0gdW5kZXIgdGhlIGNhcnBldA0KPiA+IGR1cmluZyANCj4gPiB0
ZXN0aW5nLCBidXQgdGhlIHByb2JsZW0gc3RpbGwgcmVtYWlucyBhbmQgd2lsbCBzdGlsbCBiZSBo
aXQgZHVyaW5nDQo+ID4gYWN0dWFsIHVzZS4NCj4gPiANCj4gDQo+IEhpIFZpbGxlLA0KPiANCj4g
VGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2suDQo+IA0KPiBZb3UncmUgcmlnaHQgLSB0aGUgcGF0
Y2ggd2FzIHB1cmVseSB0byBwYXNzIElHVCB0ZXN0cywgbm90IHRvIGZpeCBhDQo+IHJlYWwgcHJv
YmxlbSAoYWx0aG91Z2ggd2UgaGF2ZW4ndCBlbmNvdW50ZXJlZCBhbnkgaXNzdWUgd2l0aGluDQo+
IHJhbmRvbWx5IH4yMDB1cyBqaXR0ZXIgb24gb3VyIGN1cnJlbnQgcGxhdGZvcm0pLg0KPiANCj4g
SSd2ZSBpbnZlc3RpZ2F0ZWQgdGhlIHJlYWwtd29ybGQgaW1wYWN0IG9mIHRoaXMgfjIwMHVzIHRp
bWVzdGFtcA0KPiBqaXR0ZXIuIEluIG91ciBjdXJyZW50IEFuZHJvaWQgU3VyZmFjZUZsaW5nZXIg
aW1wbGVtZW50YXRpb24sDQo+IHJlYWwtd29ybGQgdXNhZ2UgaXMgc3RhYmxlIHdpdGggQ1BVIGRl
ZXAgc2xlZXAgZW5hYmxlZC4NCj4gSXQgc2VlbXMgdGhpcyBpc3N1ZSBvbmx5IGFwcGVhcnMgaW4g
SUdUIHNpbmdsZS1DUlRDIHRlc3Rpbmcgd2hlcmUgQ1BVDQo+IGVudGVycyBkZWVwIHNsZWVwIGR1
cmluZyBpZGxlIHBlcmlvZHMgYmV0d2VlbiBmcmFtZXMuDQo+IFRoZXJlZm9yZSwgd2UgcHJlZmVy
IG5vdCB0byBkaXNhYmxlIENQVSBkZWVwIHNsZWVwIHN5c3RlbS13aWRlIGluDQo+IGtlcm5lbCBk
dWUgdG8gcG93ZXIgY29uc3VtcHRpb24gY29uY2VybnMuDQo+IA0KPiBIb3dldmVyLCBJJ2QgbGlr
ZSB0byB1bmRlcnN0YW5kIGhvdyB0aGUgMS1zY2FubGluZSBzdGFuZGFyZCB3YXMNCj4gb3JpZ2lu
YWxseSBkZWZpbmVkIGZvciB0aGlzIHRlc3QuIERvIHJlYWwtd29ybGQgdXNlIGNhc2VzIGFjdHVh
bGx5DQo+IHJlcXVpcmUgdGhpcyBsZXZlbCBvZiBwcmVjaXNpb24/DQo+IA0KPiBOb3QgYWxsIHBs
YXRmb3JtcyBzdXBwb3J0IG9yIGltcGxlbWVudCBnZXRfc2Nhbm91dF9wb3NpdGlvbigpIC0NCj4g
Y291bGQgdGhlIHN0YW5kYXJkIGJlIHJlbGF4ZWQgZm9yIHN1Y2ggcGxhdGZvcm1zPw0KPiANCg0K
SSdkIGFsc28gbGlrZSB0byByYWlzZSBhbm90aGVyIHBvaW50IHJlZ2FyZGluZyB0aGUgdGVzdCBk
ZXNpZ24sDQphbmQgSSdkIGFwcHJlY2lhdGUgeW91ciB0aG91Z2h0cyBvbiB0aGlzLg0KDQpXYXMg
dGhlIDEtc2NhbmxpbmUgdG9sZXJhbmNlIGRlZmluZWQgd2l0aCB0aGUgYXNzdW1wdGlvbiB0aGF0
IENQVSBpZGxlDQp3b3VsZCBub3QgYmUgYWN0aXZlPyBJJ20gY3VyaW91cyB3aGV0aGVyIENQVSBp
ZGxlIHdhcyB0YWtlbiBpbnRvDQphY2NvdW50IHdoZW4gdGhpcyBzdGFuZGFyZCB3YXMgb3JpZ2lu
YWxseSBkZWZpbmVkLCBzaW5jZSBub3QgYWxsDQpwbGF0Zm9ybXMgaGF2ZSBDUFUgaWRsZSBkaXNh
YmxlZCBieSBkZWZhdWx0Lg0KDQpJZiB0aGUgdGVzdCB3YXMgZGVzaWduZWQgd2l0aG91dCBjb25z
aWRlcmluZyBDUFUgaWRsZSBhcyBhIHZhcmlhYmxlLA0KdGhlbiB0aGUgfjIwMHVzIHdha2V1cCBs
YXRlbmN5IGludHJvZHVjZWQgYnkgQ1BVIGlkbGUgZXhpdCB3b3VsZA0KYWxyZWFkeSBleGNlZWQg
dGhlIDEtc2NhbmxpbmUgdG9sZXJhbmNlICh+Ny0xNXVzKSwgd2hpY2ggY291bGQgbWFrZSB0aGUN
CnRlc3QgaW5oZXJlbnRseSB1bnN0YWJsZSBvbiBzdWNoIHBsYXRmb3Jtcy4gSW4gdGhhdCBjYXNl
LCB3b3VsZCBpdCBiZQ0KcmVhc29uYWJsZSB0byBoYW5kbGUgdGhpcyB3aXRoaW4gdGhlIHRlc3Qg
aXRzZWxmIChlLmcuLCBkaXNhYmxpbmcgQ1BVDQpkZWVwIHNsZWVwKT8NCg0KT24gdGhlIG90aGVy
IGhhbmQsIGlmIENQVSBpZGxlIHdhcyBhbHJlYWR5IGNvbnNpZGVyZWQsIGNvdWxkIHlvdSBoZWxw
DQp1cyB1bmRlcnN0YW5kIGhvdyBvdGhlciBwbGF0Zm9ybXMgbWVldCB0aGlzIHJlcXVpcmVtZW50
IHVuZGVyIHN1Y2gNCmNvbmRpdGlvbnM/DQoNCldlJ2QgbG92ZSB0byBoZWFyIHlvdXIgdGhvdWdo
dHMgb24gdGhlIGJlc3Qgd2F5IGZvcndhcmQuDQoNCkJlc3QgcmVnYXJkcywNCkphc29uLUpIIExp
bg0KDQo+IEJlc3QgcmVnYXJkcywNCj4gSmFzb24tSkggTGluDQoNCg==
