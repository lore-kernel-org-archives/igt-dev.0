Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F89D10F5D
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 14:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2070C10E012;
	Wed, 26 Nov 2025 14:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="c9FQ/5CP";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="mG6Wvs23";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B396310E012
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 14:40:27 +0000 (UTC)
X-UUID: d627c2e8cad511f0b2bf0b349165d6e0-20251126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=iIqzLzDw3beYEb/WkwHdC6dqXo+i1dC1y39Rb9Hy7hQ=; 
 b=c9FQ/5CPf08Ynxxdt+mJ5X697BgoVIdxwKdch+4lVWzdReTXPasrI0lNp2Ur1cunduadaKi9PE9VrY5JOcgWTUxodGOeGfXPWfrD/mAu4JA4k/soW1osX9JnA3HzKjEjFvpxUb/V+PVW4+50VVQ/7PFz3sCGRlVUBFUTcowbB5Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:20b47ad9-7193-46a9-9dfb-df6fb272c229, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:21af1383-b6af-4b29-9981-6bf838f9504d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:4|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d627c2e8cad511f0b2bf0b349165d6e0-20251126
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 12083546; Wed, 26 Nov 2025 22:40:21 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 26 Nov 2025 22:40:20 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 26 Nov 2025 22:40:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/R4SDB54s9CuMw8AsoQ79R33jfQCTR4zIac7HejYLCHS3jcVXRSAaQZ8xK+Blg2fvnJJtNpyzHBlp6Abz1+91VztiZbFecDkbHoBp4TjrUQQ1dKu5tAZxx7dcoqP/rhvXpGqC+0eyi19u92oZYOKxK3nEnIOgjFtZUOexxruSnRtD5xZYN4iIw6Hmbf4m8NlLHge0TGzy0dJdHgp9BoqTOl/3SahrbmSEEC9ulk0fYgmpcyIJ9bgWyyx59A6R3HtiyUSlggWqsD6alUUfr0S5DX39t6T2B/DxrYod5JZigxzqETlI+oes2fdUSocGU8U24VkU69D5ecV0YteqgzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhiTqVoXlgXNyalM/KE707lFWnIOhfFlJ/EQpFMABkQ=;
 b=xt/CRf9DciEevgJhHwC4hWVRfked0EYSU+0Z3ZMUkX4dcQ/ijUiHgeOUAhvyLLq+JaztInaeuwk1Ivd0mzaktOPtQ95nb20qF4Z/CW1juBRcnW1cRNWbDB020bV0xdJKB2Iva2wA1dA5n3kvTLSPQcP7h3FPiMzRpUvOifN7wMQN0FoGV1oF43+U0L8l79K3iToJEQjVtkpPqqX1Z7ca9XxPx6BpAps0CeWlIBGWq/9drCSEx5TZMFPAIpfqH9lhKew6/PgvTSfQWYNoWdgsRXEphoE8RtN8eegM4yVn/03AMI3DlxILN8xm23jA7IGpUAuMiUaSMybOdEveSRcXmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhiTqVoXlgXNyalM/KE707lFWnIOhfFlJ/EQpFMABkQ=;
 b=mG6Wvs23Wz+qMXQD/N5/NOvLCvCOEPkhZiQZJwLSKfU8k2LoQVDCb/+Kzjs+svrY3lI0L2O5BsmhCP9RCLPAcSxPTZSoAWmLcv0e1sjt2gPLk+g+mH5RnfhKHFmEMqGFC7WmH5dwlnXxnKtYE3Y1F90zskC6t03XawOOz0+FosQ=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SE1PPF1EE48B57A.apcprd03.prod.outlook.com (2603:1096:108:1::849)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 26 Nov
 2025 14:40:16 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:40:15 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "chaitanya.kumar.borah@intel.com"
 <chaitanya.kumar.borah@intel.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>, "fshao@chromium.org"
 <fshao@chromium.org>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "uma.shankar@intel.com" <uma.shankar@intel.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_color: Always use atomic_commit for
 setting color properties
Thread-Topic: [PATCH i-g-t v2] tests/kms_color: Always use atomic_commit for
 setting color properties
Thread-Index: AQHcWrwpN/KPT+cJ40GqSvcarZXIpLT80/IAgAAOZACAAA4YgIAEdn0AgADudwCAAFkdgIAA98yAgAFpYwA=
Date: Wed, 26 Nov 2025 14:40:15 +0000
Message-ID: <c7855c8fb18d4cc622e77706ade501b4b9750b77.camel@mediatek.com>
References: <20251121075406.2006325-1-jason-jh.lin@mediatek.com>
 <aSApNt1PwpgrX5E9@intel.com>
 <0a2d25af2c0ba3c5bc26e445a46413c90a77a19e.camel@mediatek.com>
 <aSBBG2n64m65CWLR@intel.com>
 <cb616c5e6c96d838f9dc5dd9c9e7b8110e776cd4.camel@mediatek.com>
 <aSTHiBaIAqNuggbt@intel.com>
 <4beb7387818893db802d5ca90058336cd5059a3f.camel@mediatek.com>
 <aSXiJ0gKJuUMZ0Am@intel.com>
In-Reply-To: <aSXiJ0gKJuUMZ0Am@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SE1PPF1EE48B57A:EE_
x-ms-office365-filtering-correlation-id: ef4448fa-3548-4a70-3763-08de2cf9b6b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SUNrbEhwZEFDVTNxeXpOZ3dPQTFDWkJaR3pSVy9ha3JFZDRTVWdTU2dRbzg0?=
 =?utf-8?B?MTFBL2ZjUWE5UUUyM0h0b3NZS1hmdWswNzdTNGZkRXFGSC9EWUp3dTVBTnZ6?=
 =?utf-8?B?bE9jbW8vQzdFQXAxQUgyOEI5N214SW9ZVlJJR281aFQ4MG8xcnRwOHNweWxu?=
 =?utf-8?B?RGM0eTNHSlZCTllMejZuZGl1MlJxbzlQV3JuNUFhQnAyUUlRK0xmWDNNOWFv?=
 =?utf-8?B?emFoQml4K0lDcERqaC9JRUJlazZxSURhNmVJRW5MSGlrcFNVNEc4ZTJ6NHIx?=
 =?utf-8?B?NkkyMld4RDZIWkE0VVdrbVhneE1VRWVpaEJnei9TK3NxTUFkYXY3VE9zUFMw?=
 =?utf-8?B?YmNuUG1QUnJ4MFAyYi9CTm1PSk5ZTVcyT1NxbUt0cmgzQXp0Wi9VWVYxRzg4?=
 =?utf-8?B?SWluNHFKN2ttTnBpYWZ3ZWlFVjc0ME9EdVpkNzhra1J0MVJsSEtRZkNRRng5?=
 =?utf-8?B?aHNCeW4zaTVBUTk3Z0pyNjBJdHZtTk9DcUJDVVpqc3dRbk9pYldUKzFMaVh5?=
 =?utf-8?B?a1BvYjhFWm5LUVBFSm5wZUJNczVSc2FqTTRwWkhGaXE0amMvNW5rS2t3VlUy?=
 =?utf-8?B?KzdZYVZNVERidkpFWEFWa2x0VWtyZXVXQzZJUFBLTGo2OWFHaXJGN21SUUZB?=
 =?utf-8?B?Nlc3d1BRRkQvSE5pc1VXcGtVWlBReTlEditXN1ZWaXFLQjkvTXl1Nnc4ZEdY?=
 =?utf-8?B?TUJGWm9iZ2ZlQmd5WUVYT0NLNm1Ba2FUNGxEUG53KzlWM243SWhEQ29rMmFX?=
 =?utf-8?B?dExjTkpNTnQzUUxjSW1iQytIb1hhVmgxRzVQcHVoSEUvelltUzlDZ2ttejhV?=
 =?utf-8?B?RysrWllaQkhKL0MyWmFzbW5LaVVMbExqU0R6OC9IOTNFM2NXdndkRCtDampp?=
 =?utf-8?B?OStQRjMyQlRPZzJxVUlINUJPUzFNZ3Z1aG5tcW1oMFp5M3RJeFdNZ3RkKzZh?=
 =?utf-8?B?Y0poVlM3OURtdGtOTW9TaS9aVXQ3VEs3VVE4bmFyejdMNTN4ajBackIzODk4?=
 =?utf-8?B?T045OWR6Z1dXcGJ0RG42YU5LQUtYVFRxcVQ5TitoNEdGeExFdjUxYWlwNGJR?=
 =?utf-8?B?bUZBR3JwRXZjT05UOHlzUEVDd0RGbHd0Y0tyem9xMktwM2dTbW5hL05NWkVR?=
 =?utf-8?B?L2lVcDB1Qmd6UjhoZUFZRm92c3NXNjlGcWw0bTBGODNtSCt5akJZZ1MvY0VI?=
 =?utf-8?B?cElXcE0vQkpqTFBNdDVIWStDakJPM2E5L0M5VC96anM4VjFPMkZIdU9CV0ND?=
 =?utf-8?B?b0xiU09IZVR0c09vNHdyT0tQaFZaVlJVdjdyQXZFd1JVNVVpbUFFU1ZKYjhB?=
 =?utf-8?B?NzU2cWFOOWlzSGY5b2NUZFZmMW0yWHpoekErSFBMRU0rVHo3NlVQTXlNcjly?=
 =?utf-8?B?T2ZpYi9lY2NqMndBdmhhL2ZpaXNCaVdQVkhnb245cU1BMmYzajhaOVpZZmxs?=
 =?utf-8?B?YVZ1VEl3azZkdUxzMDFSK2dmWktBckdDTDFDWEtLZ2FEblE5RjdadENmdk51?=
 =?utf-8?B?bzI0dEhadjM2YlJlRWpoUmlGRkJOTGpBSE9QZDRFb2g3VlZad3JMcXdDWTAr?=
 =?utf-8?B?Y2x1YzhPd1N6ZUJNcEkrYld5c1htWkNGajc2YStXVjJhNDJ3eHowMitXdk5M?=
 =?utf-8?B?VC9QQ1hzTEhqY3JxK1d6ck4zcjlxRWp6WFdqWDRuMVdyUi8wdEpBb3ZBT2xR?=
 =?utf-8?B?M1ZUTTZnUjdSekduSkRwYTUvczlZMkY5SHl1Mkx6aERXT2p3RnlpLzFodDI2?=
 =?utf-8?B?aEdWdHlsREJuYzZ6c3d4S1ZXbVZwQlFtbFhhMnJmb3VJeG5kTnl0Mm4yeXZo?=
 =?utf-8?B?TUNBOGExeVhoRE43SEJRbkhLT1FFd1FJSVByaTVSYTZNSi84UVh3ZDQvTXRH?=
 =?utf-8?B?dVZrMVVjanJ0Y2F3YVVDSkwyOFVTQWVvZ2Yzc0JNZFJPQnpzbmJZb1RWc0cv?=
 =?utf-8?B?QTFVRVY2MWhpMGZtUlFuUW5yQTh4U05DWks1bVRwQWwxeXJuSUR1Nm81QUd0?=
 =?utf-8?B?VTR4Nmgvb2hnL0JxcWIyb2lOTkxySGY2VVVxck1YUGVCd0tqNXhjc0M4ZWZz?=
 =?utf-8?Q?uo1inw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXRKM0s4dkhhU2lRdHJNUXZPWTZJUUg5WnV2Q1JEWkpmMHVIeXJyNG5wMTQ3?=
 =?utf-8?B?eXJZZllpcmNpREY4WTREbTRTd0NCVkp0WkFJZzdtZ0hkbE1ibExESjRpMUpu?=
 =?utf-8?B?V2Nwek5JdTFsTWc0Q3ltMGs0a1JWZit3b1EzSkVraFV3OGtvVkVXM2xkYjBD?=
 =?utf-8?B?SnE3Yk1OeS9OL0FkVkRkSkpKc2lBdUNUa2xGdGpDZlJ4THp1SWRYRk5HSzVQ?=
 =?utf-8?B?L2VjOXBObFJuTFFvZmpaYjBvQkluMGdnV0p1Y0hHcmc2ZUV1ZjVKQzBxM1NZ?=
 =?utf-8?B?K1htYWoyY2s2eDVURTVUZUpoRVFxbFZuam1Qam4wdFBtRjN6V21LSExDdHox?=
 =?utf-8?B?M0p5R1ZGY1NySlBNZTM3dkQ4L1k1T3lUa1ZkSGJnNDBQSEZLa2VMRVg1V0hk?=
 =?utf-8?B?bFJwN2JRUTVyZFhVd3hyZGVHcjhETC9jamwxYVpXTkhqd05uOHNWL3BxYURk?=
 =?utf-8?B?b1FFMDg5QWdpcVJwNytaQWdYZHQyci9PNFRiaGQ0MHEwdzRWdjJ0a2d3a213?=
 =?utf-8?B?Y0x1VVJNWUFSVkl0em90OXBHK2FrNWtNZHQrYU45WkhFUEIxZExRcGdYNWlS?=
 =?utf-8?B?ZVJqcHVQM2VkUkV3aU84bnVtQy9mbFB5RHFOS0h5dzUvbUk2UVhCOGVjMVRl?=
 =?utf-8?B?cFg2T25weXBucUNFS3JlelF4UWI1RGlZWFpVTGEyWGVrdzNKWlRyeEM5RFpy?=
 =?utf-8?B?WlhjYjBkMHVoay9mbi9QS0U0TE10d2JSTmpGV3YzWWFuNURnQWFXakVSZkdy?=
 =?utf-8?B?MEhub3dEUlYrUHhqbzRrazcyYjZsK2xrSm5uTjYrQ1JXR2E5V0tkaXNBVFRT?=
 =?utf-8?B?clVWeXg4RWRoSFN0Q3VOZ1pLLysyQjJIZ2ovYklVNjVoc2pXWDQrVGk2NWVr?=
 =?utf-8?B?NFZOMHNodGxQdXAzSysyTFJOcWd4eS9pbStDV3JSclZGU09mTEtZU283dmd4?=
 =?utf-8?B?SkdOdTVLajZLSE5ibHZQcEFpK25tUHZ1NlFrVGNUQlhER2VVU0FqSDlVYzVD?=
 =?utf-8?B?OFBITGhzZUtEM25IVVIwbUZQd2sxV3F0Q00yZXluOExFQzAwTjIvc29VOHQz?=
 =?utf-8?B?TmQ3SzdPVXpkUkM2cDd6b0RJTnVwZHdYZDZEeG5nSWlOOWE2RzNzNDJYdkFy?=
 =?utf-8?B?Zzh5OTl1eXEvcGF5cWsxb0ZMZ2VjSm9QMVhjV0FrV0FUK1FpbFNubCtsZThJ?=
 =?utf-8?B?WGtnWWNnRGdUYnBpci80SGJFV3U4YWtQaEdEWEdXRVlRWU9PWGg1SHJTcm5a?=
 =?utf-8?B?YXRiTGloLysyMGk5R3ZaQnJVSGEybWdRQXR4U0ROTnJVY2hGcjlVSkdWNWxF?=
 =?utf-8?B?L3llNzh6OTUzYTl6YmVyNmFmc29OeitlL1MwQ1MxZ3FxUkhmM29BazhRSytU?=
 =?utf-8?B?d09hK3p4ZlAvOXg4TjR2ZG4zbklKakVIWkZlaFd4bm9lb0xvOW9OQ1ZHNUh2?=
 =?utf-8?B?S2s5V2hJWSs2MnFMTEtVUDhXZHZDNUZtMDloYmpwT3pVbXNHL2IwakVBVlQ3?=
 =?utf-8?B?cnh6ZThoQmNpQjFFMERySHQyelNCcnFzTXpncjgwMEFVVDRScEREay9abHZm?=
 =?utf-8?B?NU1XZ09jTU9JaWI4azBGQ3prMmZiN2RkU1hLcU5hRnljSTlEWFF5cjlvbGJp?=
 =?utf-8?B?dk1LdXJvL1R6MkhyaEM2OEE4TXA4aTlkT2NibkVLczdMUU8wN3c4UFlwV2ZR?=
 =?utf-8?B?REdwaGZabDJzaUU3Qm11a0orUktsMDh4MUpPWi9qczhHbkZYNnB3YW5UZUpo?=
 =?utf-8?B?UlhmbHB2VzBXdmcxRVczODAwcmNaaGxPcythNzRiWUtLVVp0NW9ZMndNTjBz?=
 =?utf-8?B?cVIrQVN0dTM5T2tuV25uVWRKclhCdkF4eTU0TmdYLzhyVFhHUE1oMzR4OE0x?=
 =?utf-8?B?T09rQ3MvU1c3NVI3cmJGYkMzdlhId2FLeE1DRGRnRytEaU1nK1l5RkV6a2NH?=
 =?utf-8?B?cnRIeklwNjQwQjI4K1JDREJ3aU5GK3B2Z05VSUVXNEIveTFMRlJoOEJsbHR4?=
 =?utf-8?B?TnNidm1wL3lGWWxsNFk0bnEzdi85b0VKUkMwT0lreC9qclE1MEw5V2JzYVR6?=
 =?utf-8?B?RTM4WjhkNTQ4RDRQTlJBN3FVWkNrdEh4R1Z0Z1VTVmo2eVFnd2hkQWRaV21N?=
 =?utf-8?B?YzlkV1dzZ1hmbnlkTkg3S0lHRUVWRmh0OEJQQUVtWnJ3c2pSMVNIZzMwS3NV?=
 =?utf-8?B?TkE9PQ==?=
Content-ID: <F307BC029CC551438DE040970837043C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4448fa-3548-4a70-3763-08de2cf9b6b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 14:40:15.6834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sz974UiQExZJsnvZuxoABJSqeXBDNgNyrXvvwGy9VKoLzNBifH+k8KVSUz7WSmfCcjvzyb6qe1+k+LaY0VsBUIMs/Kn6w12cfWxgwC9Ua08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF1EE48B57A
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_232236198.420727744"
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

--__=_Part_Boundary_006_232236198.420727744
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

PiA+ID4gPiA+ID4gPiANCg0KW3NuaXBdDQoNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+IExvb2tp
bmcgaW50byBpZ3RfcGlwZV9jb21taXQoKSwgaXQgdXNlZA0KPiA+ID4gPiBkcm1Nb2RlT2JqZWN0
U2V0UHJvcGVydHkoKQ0KPiA+ID4gPiB0bw0KPiA+ID4gPiBzZXQgcHJvcGVydHkgdG8gRFJNIGFu
ZCBpdCB1c2VkIGlndF9wbGFuZV9jb21taXQoKSB0bw0KPiA+ID4gPiBzeW5jaHJvbml6ZQ0KPiA+
ID4gPiBhbGwNCj4gPiA+ID4gcGxhbmUgc3RhdGVzIGFuZCBvbmx5IHByaW1hcnkgcGxhbmUgd2ls
bCBjYWxsIGRybU1vZGVTZXRDcnRjKCkuDQo+ID4gPiA+IA0KPiA+ID4gPiBJdCB0aGluayB0aGUg
cmVhc29uIHdlIGRpZG4ndCBnZXQgdGhlIG5ldyBnYW1tYV9sdXQgaW4gY3J0Yw0KPiA+ID4gPiBz
dGF0ZQ0KPiA+ID4gPiBpcw0KPiA+ID4gPiB0YWh0IHNldF9nYW1tYSgpIHdpbGwgb25seSBjYWxs
IGlndF9waXBlX29ial9wcm9wX2NoYW5nZWQoKSB0bw0KPiA+ID4gPiB1cGRhdGUNCj4gPiA+ID4g
cGlwZV9vYmotPmNoYW5nZWQgZmxhZywgYnV0IG5vdCB1cGRhdGUgcGxhbmUtPmNoYW5nZWQgZmxh
Zy4NCj4gPiA+ID4gSW4gaWd0X3ByaW1hcnlfcGxhbmVfY29tbWl0X2xlZ2FjeSgpLCBpdCdsbCBy
ZXR1cm4gaWYgcHJpbWFyeS0NCj4gPiA+ID4gPiBjaGFuZ2VkDQo+ID4gPiA+IGZsYWcgaXMgbm90
IHNldC4NCj4gPiA+IA0KPiA+ID4gVGhlIExVVCBwcm9wZXJ0aWVzIGFyZSBzdXBwb3NlZCB0byBi
ZSBvbiB0aGUgQ1JUQy4gU28gdGhlIHBsYW5lDQo+ID4gPiBzdHVmZiBzaG91bGQgbm90IG1hdHRl
ciwgdW5sZXNzIHlvdSBkcml2ZXIgaXMgZG9pbmcgc29tZXRoaW5nDQo+ID4gPiBjb21wbGV0ZWx5
IG5vbi1zdGFuYWRhcmQuDQo+ID4gPiANCj4gPiANCj4gPiBZb3UncmUgcmlnaHQuIFBsYW5lIHN0
dWZmIHNob3VsZCBub3QgbWF0dGVyIHRvIENSVEMuDQo+ID4gDQo+ID4gU28gSSBtZWFucyBkcm1N
b2RlU2V0Q3J0YygpIHdvbid0IGJlIGNhbGxlZCBpZiBwbGFuZSBwcm9wZXJ0aWVzIGlzDQo+ID4g
bm90DQo+ID4gc2V0IGluIGlndF9wcmltYXJ5X3BsYW5lX2NvbW1pdF9sZWdhY3koKSBjdXJyZW50
bHkuDQo+ID4gDQo+ID4gSSB0aGluayB0aGlzIGxlZ2FjeSBmbG93IGxvZ2ljOg0KPiA+IHsNCj4g
PiANCj4gPiBpZiAoIWlndF9wbGFuZV9pc19wcm9wX2NoYW5nZWQocHJpbWFyeSwgSUdUX1BMQU5F
X0ZCX0lEKSkgJiYNCj4gPiDCoMKgwqAgIShwcmltYXJ5LT5jaGFuZ2VkICYgSUdUX1BMQU5FX0NP
T1JEX0NIQU5HRURfTUFTSykgJiYNCj4gPiDCoMKgwqAgIWlndF9waXBlX29ial9pc19wcm9wX2No
YW5nZWQocHJpbWFyeS0+cGlwZSwgSUdUX0NSVENfTU9ERV9JRCkpDQo+ID4gwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIDA7DQo+ID4gLi4uDQo+ID4gDQo+ID4gZHJtTW9kZVNldENydGMoKQ0KPiA+IA0K
PiA+IC4uLg0KPiA+IA0KPiA+IH0NCj4gPiBtYXkgYmxvY2sgTFVUIHByb3BlcnRpZXMgYmVpbmcg
c3luY2hyb25pemVkIGludG8gY3J0YyBzdGF0ZSB3aGVuIHdlDQo+ID4gb25seSBjYWxsZWQgc2V0
X2dhbW1hKCkgYW5kIG5vdCB1cGRhdGVkIGFueSBwbGFuZSBwcm9wZXJ0aWVzLg0KPiANCj4gVGhh
dCBkb2Vzbid0IGFmZmVjdCBDUlRDIHByb3BlcnRpZXMgYXBhcnQgZnJvbSB0aGUgbW9kZS4NCj4g
Rm9yIGFsbCBvdGhlciBDUlRDIHByb3BlcnRpZXMgZHJtTW9kZU9iamVjdFNldFByb3BlcnR5KCkN
Cj4gd2lsbCBiZSBjYWxsZWQgcmVnYXJkbGVzcyBieSBpZ3RfcGlwZV9jb21taXQoKS4NCj4gDQoN
Ck9rYXksIEkgY2hlY2tlZCB0aGF0IGRybV9tb2RlX29ial9zZXRfcHJvcGVydHlfaW9jdGwoKSBj
YWxsZWQgZnJvbQ0KZHJtTW9kZU9iamVjdFNldFByb3BlcnR5KCkgd2lsbCBzeW5jaHJvbml6ZSB0
aGUgQ1JUQyBwcm9wZXJ0aWVzLCBzdWNoDQphcywgZ2FtbV9sdXQgaW50byB0aGUgQ1JUQyBzdGF0
ZSBvZiBhdG9taWNfc3RhdGUuDQoNCk91ciBkcm0gZHJpdmVyIGhhcyBpbXBsZW1lbnRlZCBtb2Rl
X2NvbmZpZy5mdW5jcy0+YXRvbWljX2NvbW1pdCgpLCANCnNvIG1heWJlIHdlIGhhdmUgc29tZSBi
dWcgaW4gb3VyIGRyaXZlcnMgdGhhdCBjYXVzZSB0aGUgaXNzdWUgSQ0KZW5jb3VudGVyZWQsIHRo
ZSBvcmlnaW5hbCBJR1QgY29kZSBzaG91bGQgd29yayBmaW5lLg0KDQpJJ2xsIGNoZWNrIG91dCB0
aGlzIGxhdGVyIGFuZCBzZW5kIHRoZSB3cmFwcGVyIEFQSSBpZiBuZWVkZWQuDQpUaGFua3MgZm9y
IHRoZSBjb3JyZWN0aW9uIGFuZCBndWlkYW5jZS4NCg0KPiA+IA0KPiA+IEJ1dCBJJ20gbm90IHN1
cmUgdGhlIGxlZ2FjeSBmbG93IHdpbGwgdXBkYXRlIHRoZSBwcmltYXJ5IHBsYW5lDQo+ID4gcHJv
cGVydGllcyB3aGVuIENSVEMgcHJvcGVydGllcyBpcyBjaGFuZ2VkIGluIHNvbWUgd2hlcmUuDQo+
ID4gDQo+ID4gU28gSSB3b24ndCBtb2RpZnkgdGhpcyBsZWdhY3kgZmxvdyBsb2dpYywgYnV0IHdp
bGwgb25seSBhZGQgYQ0KPiA+IHdyYXBwZXINCj4gPiBBUEkgdGhhdCB5b3UgbWVudGlvbmVkIHRv
IGZpeCB0aGUgYXRvbWljIGZsb3cgb2Ygb3VyIGRyaXZlcnMuDQo+ID4gDQo+ID4gPiAtLQ0KPiA+
ID4gVmlsbGUgU3lyasOkbMOkDQo+ID4gPiBJbnRlbA0KPiA+IA0KPiA+IFJlZ2FyZHMsDQo+ID4g
SmFzb24tSkggTGluDQo+ID4gDQo+IA0KPiAtLQ0KPiBWaWxsZSBTeXJqw6Rsw6QNCj4gSW50ZWwN
Cg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0K

--__=_Part_Boundary_006_232236198.420727744
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0xvb2tpbmcmIzMyO2ludG8mIzMyO2lndF9w
aXBlX2NvbW1pdCgpLCYjMzI7aXQmIzMyO3VzZWQNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyO2RybU1vZGVPYmplY3RTZXRQcm9wZXJ0eSgpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
Z3Q7JiMzMjsmZ3Q7JiMzMjt0bw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7
c2V0JiMzMjtwcm9wZXJ0eSYjMzI7dG8mIzMyO0RSTSYjMzI7YW5kJiMzMjtpdCYjMzI7dXNlZCYj
MzI7aWd0X3BsYW5lX2NvbW1pdCgpJiMzMjt0bw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7c3luY2hyb25pemUNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
O2FsbA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7cGxhbmUmIzMyO3N0YXRl
cyYjMzI7YW5kJiMzMjtvbmx5JiMzMjtwcmltYXJ5JiMzMjtwbGFuZSYjMzI7d2lsbCYjMzI7Y2Fs
bCYjMzI7ZHJtTW9kZVNldENydGMoKS4NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsm
IzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7SXQmIzMyO3RoaW5rJiMz
Mjt0aGUmIzMyO3JlYXNvbiYjMzI7d2UmIzMyO2RpZG4mIzM5O3QmIzMyO2dldCYjMzI7dGhlJiMz
MjtuZXcmIzMyO2dhbW1hX2x1dCYjMzI7aW4mIzMyO2NydGMNCiZndDsmIzMyOyZndDsmIzMyOyZn
dDsmIzMyOyZndDsmIzMyO3N0YXRlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
Mjtpcw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7dGFodCYjMzI7c2V0X2dh
bW1hKCkmIzMyO3dpbGwmIzMyO29ubHkmIzMyO2NhbGwmIzMyO2lndF9waXBlX29ial9wcm9wX2No
YW5nZWQoKSYjMzI7dG8NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO3VwZGF0
ZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7cGlwZV9vYmotJmd0O2NoYW5n
ZWQmIzMyO2ZsYWcsJiMzMjtidXQmIzMyO25vdCYjMzI7dXBkYXRlJiMzMjtwbGFuZS0mZ3Q7Y2hh
bmdlZCYjMzI7ZmxhZy4NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0luJiMz
MjtpZ3RfcHJpbWFyeV9wbGFuZV9jb21taXRfbGVnYWN5KCksJiMzMjtpdCYjMzk7bGwmIzMyO3Jl
dHVybiYjMzI7aWYmIzMyO3ByaW1hcnktDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjtjaGFuZ2VkDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
MjtmbGFnJiMzMjtpcyYjMzI7bm90JiMzMjtzZXQuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
MjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO1RoZSYjMzI7TFVUJiMzMjtwcm9wZXJ0aWVz
JiMzMjthcmUmIzMyO3N1cHBvc2VkJiMzMjt0byYjMzI7YmUmIzMyO29uJiMzMjt0aGUmIzMyO0NS
VEMuJiMzMjtTbyYjMzI7dGhlJiMzMjtwbGFuZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7
c3R1ZmYmIzMyO3Nob3VsZCYjMzI7bm90JiMzMjttYXR0ZXIsJiMzMjt1bmxlc3MmIzMyO3lvdSYj
MzI7ZHJpdmVyJiMzMjtpcyYjMzI7ZG9pbmcmIzMyO3NvbWV0aGluZw0KJmd0OyYjMzI7Jmd0OyYj
MzI7Jmd0OyYjMzI7Y29tcGxldGVseSYjMzI7bm9uLXN0YW5hZGFyZC4NCiZndDsmIzMyOyZndDsm
IzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtZb3Um
IzM5O3JlJiMzMjtyaWdodC4mIzMyO1BsYW5lJiMzMjtzdHVmZiYjMzI7c2hvdWxkJiMzMjtub3Qm
IzMyO21hdHRlciYjMzI7dG8mIzMyO0NSVEMuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMy
OyZndDsmIzMyO1NvJiMzMjtJJiMzMjttZWFucyYjMzI7ZHJtTW9kZVNldENydGMoKSYjMzI7d29u
JiMzOTt0JiMzMjtiZSYjMzI7Y2FsbGVkJiMzMjtpZiYjMzI7cGxhbmUmIzMyO3Byb3BlcnRpZXMm
IzMyO2lzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtub3QNCiZndDsmIzMyOyZndDsmIzMyO3NldCYjMzI7
aW4mIzMyO2lndF9wcmltYXJ5X3BsYW5lX2NvbW1pdF9sZWdhY3koKSYjMzI7Y3VycmVudGx5Lg0K
Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtJJiMzMjt0aGluayYjMzI7dGhp
cyYjMzI7bGVnYWN5JiMzMjtmbG93JiMzMjtsb2dpYzoNCiZndDsmIzMyOyZndDsmIzMyO3sNCiZn
dDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7aWYmIzMyOyghaWd0X3BsYW5lX2lz
X3Byb3BfY2hhbmdlZChwcmltYXJ5LCYjMzI7SUdUX1BMQU5FX0ZCX0lEKSkmIzMyOyZhbXA7JmFt
cDsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7IShwcmltYXJ5LSZn
dDtjaGFuZ2VkJiMzMjsmYW1wOyYjMzI7SUdUX1BMQU5FX0NPT1JEX0NIQU5HRURfTUFTSykmIzMy
OyZhbXA7JmFtcDsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7IWln
dF9waXBlX29ial9pc19wcm9wX2NoYW5nZWQocHJpbWFyeS0mZ3Q7cGlwZSwmIzMyO0lHVF9DUlRD
X01PREVfSUQpKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMxNjA7JiMxNjA7JiMzMjtyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsuLi4N
CiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7ZHJtTW9kZVNldENydGMoKQ0K
Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsuLi4NCiZndDsmIzMyOyZndDsm
IzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7fQ0KJmd0OyYjMzI7Jmd0OyYjMzI7bWF5JiMzMjtibG9j
ayYjMzI7TFVUJiMzMjtwcm9wZXJ0aWVzJiMzMjtiZWluZyYjMzI7c3luY2hyb25pemVkJiMzMjtp
bnRvJiMzMjtjcnRjJiMzMjtzdGF0ZSYjMzI7d2hlbiYjMzI7d2UNCiZndDsmIzMyOyZndDsmIzMy
O29ubHkmIzMyO2NhbGxlZCYjMzI7c2V0X2dhbW1hKCkmIzMyO2FuZCYjMzI7bm90JiMzMjt1cGRh
dGVkJiMzMjthbnkmIzMyO3BsYW5lJiMzMjtwcm9wZXJ0aWVzLg0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjtUaGF0JiMzMjtkb2VzbiYjMzk7dCYjMzI7YWZmZWN0JiMzMjtDUlRDJiMzMjtwcm9wZXJ0aWVz
JiMzMjthcGFydCYjMzI7ZnJvbSYjMzI7dGhlJiMzMjttb2RlLg0KJmd0OyYjMzI7Rm9yJiMzMjth
bGwmIzMyO290aGVyJiMzMjtDUlRDJiMzMjtwcm9wZXJ0aWVzJiMzMjtkcm1Nb2RlT2JqZWN0U2V0
UHJvcGVydHkoKQ0KJmd0OyYjMzI7d2lsbCYjMzI7YmUmIzMyO2NhbGxlZCYjMzI7cmVnYXJkbGVz
cyYjMzI7YnkmIzMyO2lndF9waXBlX2NvbW1pdCgpLg0KJmd0OyYjMzI7DQoNCk9rYXksJiMzMjtJ
JiMzMjtjaGVja2VkJiMzMjt0aGF0JiMzMjtkcm1fbW9kZV9vYmpfc2V0X3Byb3BlcnR5X2lvY3Rs
KCkmIzMyO2NhbGxlZCYjMzI7ZnJvbQ0KZHJtTW9kZU9iamVjdFNldFByb3BlcnR5KCkmIzMyO3dp
bGwmIzMyO3N5bmNocm9uaXplJiMzMjt0aGUmIzMyO0NSVEMmIzMyO3Byb3BlcnRpZXMsJiMzMjtz
dWNoDQphcywmIzMyO2dhbW1fbHV0JiMzMjtpbnRvJiMzMjt0aGUmIzMyO0NSVEMmIzMyO3N0YXRl
JiMzMjtvZiYjMzI7YXRvbWljX3N0YXRlLg0KDQpPdXImIzMyO2RybSYjMzI7ZHJpdmVyJiMzMjto
YXMmIzMyO2ltcGxlbWVudGVkJiMzMjttb2RlX2NvbmZpZy5mdW5jcy0mZ3Q7YXRvbWljX2NvbW1p
dCgpLCYjMzI7DQpzbyYjMzI7bWF5YmUmIzMyO3dlJiMzMjtoYXZlJiMzMjtzb21lJiMzMjtidWcm
IzMyO2luJiMzMjtvdXImIzMyO2RyaXZlcnMmIzMyO3RoYXQmIzMyO2NhdXNlJiMzMjt0aGUmIzMy
O2lzc3VlJiMzMjtJDQplbmNvdW50ZXJlZCwmIzMyO3RoZSYjMzI7b3JpZ2luYWwmIzMyO0lHVCYj
MzI7Y29kZSYjMzI7c2hvdWxkJiMzMjt3b3JrJiMzMjtmaW5lLg0KDQpJJiMzOTtsbCYjMzI7Y2hl
Y2smIzMyO291dCYjMzI7dGhpcyYjMzI7bGF0ZXImIzMyO2FuZCYjMzI7c2VuZCYjMzI7dGhlJiMz
Mjt3cmFwcGVyJiMzMjtBUEkmIzMyO2lmJiMzMjtuZWVkZWQuDQpUaGFua3MmIzMyO2ZvciYjMzI7
dGhlJiMzMjtjb3JyZWN0aW9uJiMzMjthbmQmIzMyO2d1aWRhbmNlLg0KDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO0J1dCYjMzI7SSYjMzk7bSYjMzI7bm90JiMzMjtzdXJl
JiMzMjt0aGUmIzMyO2xlZ2FjeSYjMzI7ZmxvdyYjMzI7d2lsbCYjMzI7dXBkYXRlJiMzMjt0aGUm
IzMyO3ByaW1hcnkmIzMyO3BsYW5lDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtwcm9wZXJ0aWVzJiMzMjt3
aGVuJiMzMjtDUlRDJiMzMjtwcm9wZXJ0aWVzJiMzMjtpcyYjMzI7Y2hhbmdlZCYjMzI7aW4mIzMy
O3NvbWUmIzMyO3doZXJlLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtT
byYjMzI7SSYjMzI7d29uJiMzOTt0JiMzMjttb2RpZnkmIzMyO3RoaXMmIzMyO2xlZ2FjeSYjMzI7
ZmxvdyYjMzI7bG9naWMsJiMzMjtidXQmIzMyO3dpbGwmIzMyO29ubHkmIzMyO2FkZCYjMzI7YQ0K
Jmd0OyYjMzI7Jmd0OyYjMzI7d3JhcHBlcg0KJmd0OyYjMzI7Jmd0OyYjMzI7QVBJJiMzMjt0aGF0
JiMzMjt5b3UmIzMyO21lbnRpb25lZCYjMzI7dG8mIzMyO2ZpeCYjMzI7dGhlJiMzMjthdG9taWMm
IzMyO2Zsb3cmIzMyO29mJiMzMjtvdXImIzMyO2RyaXZlcnMuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsN
CiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOy0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
MjtWaWxsZSYjMzI7U3lyaiYjMjI4O2wmIzIyODsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
O0ludGVsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1JlZ2FyZHMsDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtKYXNvbi1KSCYjMzI7TGluDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7LS0NCiZndDsmIzMyO1ZpbGxlJiMzMjtTeXJqJiMyMjg7bCYjMjI4
Ow0KJmd0OyYjMzI7SW50ZWwNCg0KUmVnYXJkcywNCkphc29uLUpIJiMzMjtMaW4NCg0KPC9wcmU+
DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioq
KioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioq
Kg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNs
dWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5
LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIg
YXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8g
dGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRp
c3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWls
IChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMp
IGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJl
IG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0
aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5
IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBk
ZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkg
YXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBj
b250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwv
cHJlPjwhLS19LS0+

--__=_Part_Boundary_006_232236198.420727744--

