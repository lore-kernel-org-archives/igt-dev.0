Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEFFCD5BD1
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 03:04:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A9A10F808;
	Fri, 29 May 2026 03:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Oxw0Zn+N";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="GLiMkBxt";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B7710F806
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 03:04:02 +0000 (UTC)
X-UUID: 083437f65b0b11f1b1788b6acf885367-20260529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ilTGkKK6LzQw+/nC2tM7iLTQbGn/OJJJcWNP+tR4Q7M=; 
 b=Oxw0Zn+NlzYAh8KtTbnvD7BKWVYvjwOeq+ggGqaW7Zw6k6KdOjX99ydHnM5jB22txInZ8BGYZ1t2rEzZR3h7IM3hm8JG5iV8SZWaa0+LHUAzsVubIP/voPJqj6hYzb+wVymwjYJlJvSvvtIrEacJ39l4J87DwKJAATvUuka1VLk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15, REQID:582d7ca2-7d40-4786-9bb7-f5d572d535e6, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e276073, CLOUDID:916eac29-e8a1-4a7a-b7bf-8090b1a3a1bf,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 083437f65b0b11f1b1788b6acf885367-20260529
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1706423100; Fri, 29 May 2026 11:03:56 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 29 May 2026 11:03:55 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 29 May 2026 11:03:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hc8u+ZSOXuisI+ivliPPUjEMkGIKhte2Ee9RhrbTnbmIaUHaqAcyAdxZiwuCJK24mKj+aBOfOkawFIUfNRBg3t4FfSwCaCnrSz3yxbtgHl7fO1OjHp5aXZjpULXZbT1K/vekxmuzX9CyIY9UlX80fIv7eGDy8lh37T3JJcknmcAgoGIeXCiUX8IC5AuyId/lfh1uuAqB0TVs8zLkqux/vooNZHj6FXJXwfNK98nzmJKHCJHa8Z51bCzwGYgN8QaGnQLnDIiz2EsDpCJ7WuGdD5tHJ8wIwELGuA9mAq3ulXB/cs6NdfQ/u1BNkhZNlVWr0EUBXjGf8mg0xXM5CSWb4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilTGkKK6LzQw+/nC2tM7iLTQbGn/OJJJcWNP+tR4Q7M=;
 b=J9Gv43xfQzXBuz5JpWBp3+J+Xnhcowf87e8cfkr4UHbUELgRrNyYrM1dyLrPVQW9GgX5PPqBEkHy1nfzic89JKAVIRIl7UecpuyundSxzNX8rQAcVewqCMqgNtcPBijUP4nf9Icf1R/Sct8bp6vwPueOeY0Le3kz3M7EYYcHZDJQxi8I5H69isUTm+ZB7yAhwF9DuJFQ1vvKqEPDwO2HKd1G+isucRMD1sa+kct/3qMwudcgFY7bJrQEMvaMkAxS5PD0UH5psXYByliOTQvUSh63+bf0qe7aZaSyrnj5YVcdcdW1Mi9nlQHfLm7nazcFG5Jva/2OkctNsbY+39siPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilTGkKK6LzQw+/nC2tM7iLTQbGn/OJJJcWNP+tR4Q7M=;
 b=GLiMkBxtL8VTUFUY81VeAQkaUBQ6lAJG8ONS3UDYfqCXu0753l+zlqD84VPHC1GfbqVTRoD8OMUWX4jz6pNJGBJdMoEOnIHpfeLfdX2X9cce/yCbDiXlriIC2VHCwzN0Ga7J4GM6pbqVd6a+zC2YpOvjKNRXfRzTmtUeWUmnQiQ=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7312.apcprd03.prod.outlook.com (2603:1096:820:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.5; Fri, 29 May 2026
 03:03:51 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 03:03:50 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "gildekel@google.com"
 <gildekel@google.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "markyacoub@google.com" <markyacoub@google.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "markyacoub@chromium.org"
 <markyacoub@chromium.org>, "navaremanasi@google.com"
 <navaremanasi@google.com>
Subject: Re: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Thread-Topic: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Thread-Index: AQHc6CSPGBSfXb3UvEKHnz7wd/zZw7YW7uCAgADdDgCAAH/sgIABEb0AgAD/xQCAAMWgAIADm4iAgANSCICAACQmAIACKo+A
Date: Fri, 29 May 2026 03:03:50 +0000
Message-ID: <6610b71708ebb28b97cc7a4e227b135f51c2201c.camel@mediatek.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
 <ag28FVTooBC6Yly3@intel.com>
 <53284b68be0216eab50946da686968691fa59a56.camel@mediatek.com>
 <ag7g07pHLWgPViVh@intel.com>
 <988bcdc233564b398a87190cb40489d43ed3922c.camel@mediatek.com>
 <ahCdAq03EHvn3zu9@intel.com>
 <af89358195f2780dd882f339db7198e48543fb50.camel@mediatek.com>
 <CAC0gqY5ggHL8DM4qNHfpvx5Kc+_oZ63ogjU8k5fkaWfGeZ+SRw@mail.gmail.com>
 <fbd04831464f5b15708f88b24cdf95350f01f60f.camel@mediatek.com>
 <ahcw4mAM-zaqbg6V@intel.com>
In-Reply-To: <ahcw4mAM-zaqbg6V@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7312:EE_
x-ms-office365-filtering-correlation-id: 7018d8f9-f2b1-4e0c-2669-08debd2ee8c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021|22082099003|4143699003|56012099006|3023799007|5023799004|11063799006|18002099003;
x-microsoft-antispam-message-info: LQ/abFU7mOOD31QiUXWXsQSVQoRxBJYEfu+1fcwjLraestnl5dSZQ06uWCT8znsG1bHRJIAUZx1qfAvCXeK1kPyPbCihfLD0mkFu9zb3pnHKJn1utgIN50ma6J9zkid2MkteE9MSz8xrf0hPxhnBxWUUCv3AE3skjbAuTJYL7dC8GHzLPZByBYz5Ntc3YXRAQdwNJm/N2SFZgjMZFAKGPZa8tWS0Yf5ROT5y2p3uRbrsDJlhMVmyyvTNFdGCubhMXkockyddxWkLA+MbwmDGtco0Yl1Ux5l+MWX8MdOA76hegXdiMl+JwApTqCcb4lcr2xtiJEXvgVzdbz5PcavzRL22IoUX5sg0t1z+Wz1iDG5secxOZFixAWVZhhzEtpU0/CT0nXqAIwGNLmQhsqxvmJ0CBluu8brftwWouf1Qbl0amcI7LICR6aGP/bwIolP6Xzyk5RrVJ+UA9A6OUg9uqXdP0NPV9jSqIvMfjgphdsubstDhV+ckxAv37bDJcyn0rtw3oA5MGjSkuCo9nS4jZ2oxrbSxmSUBM3brlWNGw6Ka2S4yRqRZRIYiauUm1/6S95nUZ0PCcXZCitETXwTNJtyKlAmY+BH17k3b6eyuMHyltqmRoQmQIMTQtNKeaGgKyiydXdgmbh+Z9sdm0GMdZ3dZ4oyzmw/QrXWbTCUhsoOpmSLvGyDc5ADWAGpPltYd2eWmpSgmNsFN1jCQrWa57AflS08PDxmIx0J0YrtgpGeEwnq/eDCIE52SEL6oN/G3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(22082099003)(4143699003)(56012099006)(3023799007)(5023799004)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2ZEY1lid1JmcnE2QWtxcExpeCtGdW5xUW9Sc0Qxck1DNjNzM3pzb0hjNlIx?=
 =?utf-8?B?dk9aTGtnSi8wWHF3Qk05NzNaVkxqd2UvVnFIbGkzTmJwM2QzbnBEdnFaUUND?=
 =?utf-8?B?a3hSTUVPMjlZWFE5Mk9jRnlxMU9TRFZvbHJuN3YwWEV0SC9PQ04xSHZrN014?=
 =?utf-8?B?RzNkQVdMT3p6NWdIQWs3SDB3MzN2RDJpS2taTDlPUllLc0tXNXFkY3ZlRFBo?=
 =?utf-8?B?bWxYMEZYdnFCY0pyclBrK3N0d1JkOHFBcGJ4WTRNTXBvV0habThkZE9WSmdM?=
 =?utf-8?B?V2o2aXBBOTRVVkp6dXBjTXRxQjNZWG5OYi9ZL1ZpV3FSbmY2a1F3Z2RUR3Vo?=
 =?utf-8?B?aHNjaW5tQmhkZHArbzR5WHFFWExQK2Y5bkZQUlRqcE8va3F3OS9mdE5ZSi92?=
 =?utf-8?B?TGlKbnpiTG1MK09SVTJxTENvdzR1V2szWWhTQWNWSlkxVzhnSmFZQko2L2Nw?=
 =?utf-8?B?RGwxTW84UXN6RExDTmpNSnlPUjNERy9PWUQ3VWZhLy8vMnk3Tk50cWhyQ3Ev?=
 =?utf-8?B?MHp4QnZ6clBPMXRFeVIxK1JKNXdRb282bXBVSlErQkhyRmdDSkc1KytRQkRK?=
 =?utf-8?B?dyt3UitscU9MSFkrRk1rc0taSHN6d1NuT01yM0lHVlV3eWE3KzcxbE4yQ05m?=
 =?utf-8?B?ckZaL3BYdzBLdkRRbDIvQmtWa3c5MlV4Q04wUXFoakh0ZGExaDFLTnJDNG14?=
 =?utf-8?B?UnpLeE1BRG9IUDVQNWV3TSswSVJpK3ZOQUNCSjI4SlBXUzRoNGgrcTJRKy8v?=
 =?utf-8?B?MHNpOFoxYkZlSSt1Ky85Zmk4Q1JndjZZY1N1ZDFnV2U1Rk5wakozM2pueFBl?=
 =?utf-8?B?cTcreGFSbVZ0N1g5Tkh5SFJwc3hsa3JwSVY5SlhJSVRqOW55aWZMWGc0UGNa?=
 =?utf-8?B?UlcxR2ZLaThnRDl6RTF5WFhOM3pYNEQrdzhZNlZFVVY3TG5NamVub2xsai9F?=
 =?utf-8?B?ZzJTR1ZRcjkwdTlkUXZTN05SZ3FqYmQ0UnlwWU14TkpIOWEvYml2cUdTMy8y?=
 =?utf-8?B?czR3aXlIT0NKblo0cmFpNmphNXcraFBNK2FsZGR1NjhhMHg0RmRtVkdDaEtK?=
 =?utf-8?B?cmR5anJGZDMzWXcwUFJybFhGRkd0clI2Q2ZzUTllUXlRMjFiRjh1cmo4bFda?=
 =?utf-8?B?aEhKWDZFR3BRU2tyV1NCYm95bFN1YXRhMU55eWl3Q3l0Nkp3RUJBTWVFUnBh?=
 =?utf-8?B?WnA1RHlhZktsVnJrK09zNklNb2NoaW1EeHZmU2Z0bXF6Qi9Hdzl6UXlrekVD?=
 =?utf-8?B?L2hQQmpHdE1UZEpMNTRrMG5uQWpNc3NKM2lKeGkwb1VIR290WHVUNGZvNWRQ?=
 =?utf-8?B?ZHBpL3hUaFlXVGg3azdqbUk3Nk1aWjl5b0NVL2V4eDl6RXNyMkpjMVhlaHB2?=
 =?utf-8?B?Q1lOMmFOYlBGNlZIbVVFWFNUaXZVbFY4dGh6NUJEUzZRMG00QUVjdXdjY082?=
 =?utf-8?B?T2Eyd01JL2JyRlJRcFBaVm5RcjBtL0NLMUdnS1dzcEhoT0JkOGR5cWFjeDJO?=
 =?utf-8?B?UDFKQkJFYWJyeDdVaTVDcndQQ0czaGV0N0YxaTNSZWtYQ1dWaXRmUGNIT1g3?=
 =?utf-8?B?NkdiOHMyWnk3SDdBYWNMWFJZZk8veEdhOXBidC9XUEVFM3hFWEg1VGZlZXlE?=
 =?utf-8?B?cC9RS0FQdy9rOHRsbzVKV1lSTmlhV29QOHdJZDZTdm5TMXk4QitpMTFVMDdG?=
 =?utf-8?B?U1FFb1BXay9QVW9iSlJOWjdEbG56enI4Tm1aYXppNnRRc0tsSW9tM3h3ekxF?=
 =?utf-8?B?eTgzaEFoeElsNm9rTWdaWTBTblVOQ1lvMldDYWY5dk1vMVZYQXNRaVpCUERi?=
 =?utf-8?B?VWk2MVFFU0U2Tmo3L2dRUHZ6UlpDMlV3bnZYT251MENIbkNldlJaVVMwTFg5?=
 =?utf-8?B?OTQ4WDhIS3BMQ0wyNWhNU2tBY0ZmajNhdlAxWlBmMnVYK1AwdFVVYWp0ZlE1?=
 =?utf-8?B?UXpNTTVFSWZmQzdvMXJjR1BNMVZlU25XOUtydksxeHlMMVhzeWNRYnVZVjcx?=
 =?utf-8?B?anRJVkoyMFZqUFBFNXNJVjQyb2NLaUJzZlFBdzdCNzVvZUUxdnF0V0FPQW1Y?=
 =?utf-8?B?OCtVZlVIOW55VmdDTmp6MWFWUDJocnhxakpLTzl4R1JkakhBenMxR3Q2VWpx?=
 =?utf-8?B?ekR4VnBVek14Sk9hMEEwVmdVTHFiTHpKclBKZWlqTCtXVzU5Y0s1dmpLQk0z?=
 =?utf-8?B?aWxVSjBRZU9mektaR090dnpuUHRMa09ieTZ0TXZXb0Z4NTdrL0RRRzZMOWRv?=
 =?utf-8?B?dmd0ZW5nYVVZME82THI0VDl1THlvelFucUdnc1Q1K0RYSUJjU1ZUTDhHNXNH?=
 =?utf-8?B?bjFCTUdyek8rTXFCK24xV29mTWFYbmtPK2lRVlVnNzN1TUhyWmtHb0NwOFBI?=
 =?utf-8?Q?UIIPCjkvGM71b96o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B57CEF3C98ADF4CBB299EFB2EF3764A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Mx5Z3O6NimIhmLCNtR9RLMhZ+ajsw343KgxLmXj4FrcdbWILsWT9ArQNHPsbdpQBZPAns1bAnJ5K8BljfwWIeSfgwEB2WjarQwdZgPeZ3ZPI9B/pqztTN0aHE+cy3xw1+tnDHVg5cQzkNBZvXmbuh07Nl8JgbOmqLw3pwxIDQDn1PWOew0nFShr821o7MhkjRXcMDpJWRy446LFZg02xXAl79/ANOM7ngPCXje3IyGneuysR8lTWLhWsR0IqcbSpqnL2kGZyjIZbeL4UQRpU4TKxlenQq4DUlMmn3ooRmXxz5cNO93clit+ulVVxjD4RG62lCDcRW5w+3hWT8nKP2g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7018d8f9-f2b1-4e0c-2669-08debd2ee8c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 03:03:50.3785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDykLAg+yrN/b/l9g4vTXW2LjhNbPGlL04Pik7F3ZaLinaVNmwwWxmLQrHF+IB1I89Nsdsf/45sPcfpQNpWMPx56Wc4g/sgg1N9INTm0hoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7312
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

T24gV2VkLCAyMDI2LTA1LTI3IGF0IDIwOjU4ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFdlZCwgTWF5IDI3LCAyMDI2IGF0IDAzOjQ5OjM2UE0gKzAwMDAsIEphc29uLUpIIExp
biAo5p6X552/56WlKSB3cm90ZToNCj4gPiBPbiBNb24sIDIwMjYtMDUtMjUgYXQgMDk6MDcgLTA0
MDAsIE1hcmsgWWFjb3ViIHdyb3RlOg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IE9uIFNhdCwgTWF5
IDIzLCAyMDI2IGF0IDI6MDLigK9BTSBKYXNvbi1KSCBMaW4gKOael+edv+elpSkNCj4gPiA+IDxK
YXNvbi1KSC5MaW5AbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPiA+ID4gPiANCj4gPiA+ID4gW3Nu
aXBdDQo+ID4gPiA+IA0KPiA+ID4gPiA+ID4gSGkgVmlsbGUsDQo+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+IFRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiBZb3UncmUgcmlnaHQgLSB0aGUgcGF0Y2ggd2FzIHB1cmVseSB0byBwYXNzIElHVCB0ZXN0
cywgbm90DQo+ID4gPiA+ID4gPiB0bw0KPiA+ID4gPiA+ID4gZml4IGENCj4gPiA+ID4gPiA+IHJl
YWwgcHJvYmxlbSAoYWx0aG91Z2ggd2UgaGF2ZW4ndCBlbmNvdW50ZXJlZCBhbnkgaXNzdWUNCj4g
PiA+ID4gPiA+IHdpdGhpbg0KPiA+ID4gPiA+ID4gcmFuZG9tbHkgfjIwMHVzIGppdHRlciBvbiBv
dXIgY3VycmVudCBwbGF0Zm9ybSkuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEkndmUgaW52
ZXN0aWdhdGVkIHRoZSByZWFsLXdvcmxkIGltcGFjdCBvZiB0aGlzIH4yMDB1cw0KPiA+ID4gPiA+
ID4gdGltZXN0YW1wDQo+ID4gPiA+ID4gPiBqaXR0ZXIuIEluIG91ciBjdXJyZW50IEFuZHJvaWQg
U3VyZmFjZUZsaW5nZXINCj4gPiA+ID4gPiA+IGltcGxlbWVudGF0aW9uLA0KPiA+ID4gPiA+ID4g
cmVhbC13b3JsZCB1c2FnZSBpcyBzdGFibGUgd2l0aCBDUFUgZGVlcCBzbGVlcCBlbmFibGVkLg0K
PiA+ID4gPiA+ID4gSXQgc2VlbXMgdGhpcyBpc3N1ZSBvbmx5IGFwcGVhcnMgaW4gSUdUIHNpbmds
ZS1DUlRDIHRlc3RpbmcNCj4gPiA+ID4gPiA+IHdoZXJlDQo+ID4gPiA+ID4gPiBDUFUNCj4gPiA+
ID4gPiA+IGVudGVycyBkZWVwIHNsZWVwIGR1cmluZyBpZGxlIHBlcmlvZHMgYmV0d2VlbiBmcmFt
ZXMuDQo+ID4gPiA+ID4gPiBUaGVyZWZvcmUsIHdlIHByZWZlciBub3QgdG8gZGlzYWJsZSBDUFUg
ZGVlcCBzbGVlcCBzeXN0ZW0tDQo+ID4gPiA+ID4gPiB3aWRlDQo+ID4gPiA+ID4gPiBpbg0KPiA+
ID4gPiA+ID4ga2VybmVsIGR1ZSB0byBwb3dlciBjb25zdW1wdGlvbiBjb25jZXJucy4NCj4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gSG93ZXZlciwgSSdkIGxpa2UgdG8gdW5kZXJzdGFuZCBob3cg
dGhlIDEtc2NhbmxpbmUgc3RhbmRhcmQNCj4gPiA+ID4gPiA+IHdhcw0KPiA+ID4gPiA+ID4gb3Jp
Z2luYWxseSBkZWZpbmVkIGZvciB0aGlzIHRlc3QuIERvIHJlYWwtd29ybGQgdXNlIGNhc2VzDQo+
ID4gPiA+ID4gPiBhY3R1YWxseQ0KPiA+ID4gPiA+ID4gcmVxdWlyZSB0aGlzIGxldmVsIG9mIHBy
ZWNpc2lvbj8NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJIGRvbid0IGhhdmUgc3BlY2lmaWMgZXhh
bXBsZXMsIGJ1dCBwZW9wbGUgY2FyZWQgYWJvdXQNCj4gPiA+ID4gPiBwcmVjaXNpb24NCj4gPiA+
ID4gPiBlbm91Z2ggdG8gYWRkIHRoZSB3aG9sZSB0aW1lc3RhbXAgY29ycmVjdGlvbiB0aGluZ3kg
aW50byB0aGUNCj4gPiA+ID4gPiBrZXJuZWwuDQo+ID4gPiA+ID4gQW5kIGluIGk5MTUgd2UgYWxz
byBzb21ldGltZXMgdXNlIHRoZSB0aW1lc3RhbXBzIHRvIGNvb2sgdXAgYQ0KPiA+ID4gPiA+IGZy
YW1lDQo+ID4gPiA+ID4gY291bnRlciAod2hlbiB0aGUgaGFyZHdhcmUgbGFja3Mgb25lKSBhbmQg
SSB3b3VsZG4ndCB3YW50IHRvDQo+ID4gPiA+ID4gZG8NCj4gPiA+ID4gPiB0aGF0DQo+ID4gPiA+
ID4gd2l0aG91dCBhZGp1c3RpbmcgdGhlIHRpbWVzdGFtcHMgYmFzZWQgb24gdGhlIHNjYW5vdXQN
Cj4gPiA+ID4gPiBwb3NpdGlvbi4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBBbnl3YXlzLCBzaW5j
ZSB0aGlzIGlzIHVzdWFsbHkgaW1wbGVtZW50ZWQgdmlhIGEgc2NhbmxpbmUNCj4gPiA+ID4gPiBj
b3VudGVyDQo+ID4gPiA+ID4gKHNvbWV0aW1lcyBldmVuIGEgcGl4ZWwgY291bnRlcikgdGhhdCdz
IHRoZSBraW5kIG9mIGFjY3VyYWN5DQo+ID4gPiA+ID4gb25lDQo+ID4gPiA+ID4gd291bGQgZXhw
ZWN0IHRvIGdldCwgYW5kIHNvIHRoYXQncyB3aGF0IG9uZSB0ZXN0cyBmb3IgdG8gbWFrZQ0KPiA+
ID4gPiA+IHN1cmUNCj4gPiA+ID4gPiBpdCdzIHdvcmtpbmcgY29ycmVjdGx5Lg0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBOb3QgYWxsIHBsYXRmb3JtcyBzdXBwb3J0IG9y
IGltcGxlbWVudA0KPiA+ID4gPiA+ID4gZ2V0X3NjYW5vdXRfcG9zaXRpb24oKSAtDQo+ID4gPiA+
ID4gPiBjb3VsZCB0aGUgc3RhbmRhcmQgYmUgcmVsYXhlZCBmb3Igc3VjaCBwbGF0Zm9ybXM/DQo+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gSWYgeW91IGRvbid0IGltcGxlbWVudCBhY2N1cmF0ZSB0aW1l
c3RhbXBzIHRoZW4gdGhlIHRlc3QgaXMNCj4gPiA+ID4gPiBleHBlY3RlZCB0byBmYWlsLiBJIHNl
ZSBub3RoaW5nIHdyb25nIGluIHRoYXQuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gUmVsYXhpbmcg
dGhlIHRlc3QgZG9lc24ndCBtYWtlIHNlbnNlIHRvIG1lIGJlY2F1c2UgdGhlbiBpdA0KPiA+ID4g
PiA+IGNhbg0KPiA+ID4gPiA+IG5vIGxvbmdlciB0ZWxsIHlvdSB3aGV0aGVyIHlvdXIgdGltZXN0
YW1wcyBhcmUgYWNjdXJhdGUgb3INCj4gPiA+ID4gPiBub3QuDQo+ID4gPiA+ID4gQWx0aG91Z2gg
SSBndWVzcyB5b3UgY291bGQgaGF2ZSBhbm90aGVyIHNpbWlsYXIgdGVzdCB0aGF0DQo+ID4gPiA+
ID4gbWFrZXMgc3VyZSB0aGF0IHRoZSB0aW1lc3RhbXBzIGFyZSBhdCBsZWFzdCBzb21ld2hhdCBz
YW5lLA0KPiA+ID4gPiA+IGV2ZW4gaWYgbm90IHZlcnkgYWNjdXJhdGUuDQo+ID4gPiA+ID4gDQo+
ID4gPiA+IA0KPiA+ID4gPiBIaSBWaWxsZSwNCj4gPiA+ID4gDQo+ID4gPiA+IEkgdW5kZXJzdGFu
ZCB5b3VyIHBvaW50LCBhbmQgSSBhZ3JlZSB0aGF0IGltcGxlbWVudGluZw0KPiA+ID4gPiBnZXRf
c2Nhbm91dF9wb3NpdGlvbigpIGlzIHRoZSBwcm9wZXIgbG9uZy10ZXJtIGZpeC4NCj4gPiA+ID4g
DQo+ID4gPiA+IEhvd2V2ZXIsIEknZCBsaWtlIHRvIGV4cGxhaW4gb3VyIHJlYXNvbmluZyBmb3Ig
dGhpcyBwYXRjaC4NCj4gPiA+ID4gVGhlIHB1cnBvc2Ugb2YgdGhpcyB0ZXN0IGlzIHRvIHZlcmlm
eSB0aGUgYWNjdXJhY3kgb2YgdGhlDQo+ID4gPiA+IGtlcm5lbA0KPiA+ID4gPiB2YmxhbmsNCj4g
PiA+ID4gdGltZXN0YW1wIGl0c2VsZi4gV2UgaGF2ZSBpZGVudGlmaWVkIHRoYXQgZGlzYWJsaW5n
IENQVSBpZGxlDQo+ID4gPiA+IGVsaW1pbmF0ZXMNCj4gPiA+ID4gdGhlIGppdHRlciBhbmQgdGhl
IHRlc3QgcGFzc2VzLCB3aGljaCBjb25maXJtcyB0aGF0IG91cg0KPiA+ID4gPiB0aW1lc3RhbXAN
Cj4gPiA+ID4gaW1wbGVtZW50YXRpb24gaXMgY29ycmVjdCAtIHRoZSB+MjAwdXMgaml0dGVyIGlz
IGNhdXNlZCBieSBDUFUNCj4gPiA+ID4gaWRsZQ0KPiA+ID4gPiB3YWtldXAgbGF0ZW5jeSBhcyBh
biBleHRlcm5hbCBpbnRlcmZlcmVuY2UsIG5vdCBieSB0aGUNCj4gPiA+ID4gdGltZXN0YW1wDQo+
ID4gPiA+IG1lY2hhbmlzbSBpdHNlbGYuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGVyZWZvcmUsIGJl
Zm9yZSB3ZSBjb21wbGV0ZSB0aGUgZ2V0X3NjYW5vdXRfcG9zaXRpb24oKQ0KPiA+ID4gPiBpbXBs
ZW1lbnRhdGlvbiwgd2UgYmVsaWV2ZSB0aGlzIHBhdGNoIHN0aWxsIGhhcyB2YWx1ZSAtIGl0DQo+
ID4gPiA+IGFsbG93cw0KPiA+ID4gPiB0aGUNCj4gPiA+ID4gdGVzdCB0byBlZmZlY3RpdmVseSB2
ZXJpZnkgb3VyIHRpbWVzdGFtcCBhY2N1cmFjeSBieSByZW1vdmluZw0KPiA+ID4gPiB0aGUNCj4g
PiA+ID4gZXh0ZXJuYWwgQ1BVIGlkbGUgaW50ZXJmZXJlbmNlLCB3aGlsZSBhbHNvIHByZXZlbnRp
bmcgb3RoZXINCj4gPiA+ID4gcG90ZW50aWFsDQo+ID4gPiA+IGlzc3VlcyBmcm9tIGFmZmVjdGlu
ZyB0aW1lc3RhbXAgcHJlY2lzaW9uIG9uIE1lZGlhVGVrDQo+ID4gPiA+IHBsYXRmb3Jtcy4NCj4g
PiA+ID4gDQo+ID4gPiANCj4gPiA+IGhlcmUgaXMgbXkgMmM6wqANCj4gPiA+IEFzIHRoaXMgdGVz
dCB1bmNvdmVyZWQgYW5vdGhlciBidWcgKGV4dGVybmFsIENQVSBJZGxlDQo+ID4gPiBpbnRlcmZl
cmVuY2UpLA0KPiA+ID4gaXQgTVVTVCBub3QgYmUgcmVtb3ZlZC4gT3RoZXJ3aXNlLCB3ZSBoaWRl
IGEgYnVnLCBldmVuIGlmIGl0DQo+ID4gPiB3YXNuJ3QNCj4gPiA+IHRoZSBpbnRlbmRlZCB0ZXN0
Lg0KPiA+ID4gVGhlcmVmb3JlLCBpZiB5b3UgZGVjaWRlIHdpdGggVmlsbGUgdGhhdCB0aGVyZSBp
cyB2YWx1ZSBpbiB5b3VyDQo+ID4gPiB3b3JrYXJvdW5kLCBpdCBtdXN0IGJlIEFOT1RIRVIgdGVz
dC4NCj4gPiA+IFRlc3QjMSBzaG93cyB0aGF0IHlvdSBoYXZlIGFuIGFjY3VyYXRlIHRpbWVzdGFt
cCB3aXRob3V0DQo+ID4gPiBpbnRlcmZlcmVuY2UNCj4gPiA+ICh0aGlzIHNoYWxsIHBhc3MgZm9y
IE1USykNCj4gPiA+IGFub3RoZXIgdGVzdCBzaG93aW5nIHRoYXQgQ1BVIGlkbGVuZXNzIHdpdGgg
dGhyb3cgb2ZmIHRoZQ0KPiA+ID4gYWNjdXJhY3kgb2YNCj4gPiA+IHRoZSB0aW1lc3RhbXAgKHdp
bGwgZmFpbCkNCj4gPiA+IFRoaXMgd2lsbCBnaXZlIHlvdSAyIHJlc3VsdHM6IGFjY3VyYXRlIHRp
bWVzdGFtcHMgdGhhdCBkZXZpYXRlcw0KPiA+ID4gc29tZXRpbWUuIEl0J3MgdXAgdG8geW91IGFu
ZCB0aGUgcGxhdGZvcm0gb3duZXIgdG8gZGVjaWRlIGlmIHRoaXMNCj4gPiA+IGlzDQo+ID4gPiBh
biBhY2NlcHRhYmxlIGJlaGF2aW9yLsKgDQo+ID4gPiBCdXQsIHdlIHNoYWxsIG5vdCBjaGFuZ2Ug
YSB0ZXN0IHRvIGhpZGUgYSBidWcuDQo+ID4gPiANCj4gPiA+IC1NYXJrDQo+ID4gPiA+IA0KPiA+
IA0KPiA+IEhpIFZpbGxlIGFuZCBNYXJrLA0KPiA+IA0KPiA+IFRoYW5rIHlvdSBib3RoIGZvciB0
aGUgdmFsdWFibGUgZmVlZGJhY2suDQo+ID4gSSBpbnZlc3RpZ2F0ZWQgaW1wbGVtZW50aW5nIGdl
dF9zY2Fub3V0X3Bvc2l0aW9uKCkgb24gTWVkaWFUZWssIGFuZA0KPiA+IEkNCj4gPiBmb3VuZCBh
IGhhcmR3YXJlIGxpbWl0YXRpb24gdGhhdCBwcmV2ZW50cyB1cyBmcm9tIGFjaGlldmluZw0KPiA+
IGFjY3VyYXRlDQo+ID4gdmJsYW5rIHRpbWVzdGFtcHMgb24gRFNJLg0KPiA+IFVubGlrZSBJbnRl
bCwgd2hpY2ggdHlwaWNhbGx5IGhhcyBhbiBvdXRwdXQtc2lkZSBzY2FubGluZSBjb3VudGVyDQo+
ID4gdGhhdA0KPiA+IHRyYWNrcyB0aGUgcmVhbCBwYW5lbCBzY2Fub3V0IHBvc2l0aW9uIGFjcm9z
cyB0aGUgZnVsbCBmcmFtZQ0KPiA+IChpbmNsdWRpbmcNCj4gPiBibGFua2luZyksIG91ciBEU0kg
cHJvdmlkZXMgYW4gaW5wdXQtc2lkZSBsaW5lIGNvdW50ZXIuIEl0IG9ubHkNCj4gPiBlZmxlY3Rz
DQo+ID4gdGhlIERTSSBpbnB1dCBwcm9jZXNzaW5nIHBvc2l0aW9uIGR1cmluZyB0aGUgYWN0aXZl
IHJlZ2lvbiwgYW5kIGl0DQo+ID4gYmVjb21lcyBub24taW5mb3JtYXRpdmUgZHVyaW5nIHZibGFu
ayAob2Z0ZW4gcmVhZGluZyBhcyAwKSwgc28gd2UNCj4gPiBjYW5ub3QgZGV0ZXJtaW5lIHRoZSBl
eGFjdCBzY2FubGluZSBwb3NpdGlvbiB3aXRoaW4gdGhlIHZibGFuaw0KPiA+IGludGVydmFsLg0K
PiA+IA0KPiA+IEEgc2ltcGxpZmllZCBkaWFncmFtIG9mIHRoZSBkaWZmZXJlbmNlOg0KPiA+IA0K
PiA+IERJU1AgLT4gRFNJIC0+IFBhbmVsDQo+ID4gwqDCoMKgwqAgfMKgwqDCoMKgwqAgfA0KPiA+
IMKgwqDCoMKgIHzCoMKgwqDCoMKgICstLSBJbnRlbCBzY2FubGluZSBjb3VudGVyIChPVVRQVVQg
c2lkZSkNCj4gPiDCoMKgwqDCoCB8wqDCoMKgwqDCoCBlLmcuIFBJUEVEU0wNCj4gPiDCoMKgwqDC
oCB8wqDCoMKgwqDCoCAtIENvdW50cyB0aGUgcmVhbCBwYW5lbCBzY2Fub3V0IHBvc2l0aW9uDQo+
ID4gwqDCoMKgwqAgfMKgwqDCoMKgwqAgLSBDb3ZlcnMgYWN0aXZlICsgdmJsYW5rICgwIH4gdnRv
dGFsLTEpDQo+ID4gwqDCoMKgwqAgfMKgwqDCoMKgwqAgLSBTdGlsbCBtZWFuaW5nZnVsIGR1cmlu
ZyB2YmxhbmsNCj4gPiDCoMKgwqDCoCB8DQo+ID4gwqDCoMKgwqAgKy0tIE1lZGlhVGVrIERTSSBs
aW5lIGNvdW50ZXIgKElOUFVUIHNpZGUpDQo+ID4gwqDCoMKgwqAgZS5nLiBEU0lfSU5QVVRfREVC
VUcNCj4gPiDCoMKgwqDCoCAtIENvdW50cyBEU0kgaW5wdXQgcHJvY2Vzc2luZyBwb3NpdGlvbg0K
PiA+IMKgwqDCoMKgIC0gT25seSBjb3ZlcnMgYWN0aXZlIHJlZ2lvbiAoMCB+IHZkaXNwbGF5LTEp
DQo+ID4gwqDCoMKgwqAgLSBEdXJpbmcgdmJsYW5rIHRoZXJlIGlzIG5vIGlucHV0IGRhdGEsIHNv
IHRoZQ0KPiA+IMKgwqDCoMKgwqDCoCBjb3VudGVyIG1heSBzdG9wL3Jlc2V0IGFuZCByZXR1cm4g
YXMgMA0KPiA+IMKgwqDCoMKgIC0gVGhlcmVmb3JlIGl0IGNhbm5vdCBpbmRpY2F0ZSB0aGUgZXhh
Y3QgcG9zaXRpb24NCj4gPiDCoMKgwqDCoMKgwqAgd2l0aGluIHRoZSB2YmxhbmsgaW50ZXJ2YWwg
KHZkaXNwbGF5IH4gdnRvdGFsLTEpDQo+ID4gDQo+ID4gSSBhdHRlbXB0ZWQgYSBnZXRfc2Nhbm91
dF9wb3NpdGlvbigpIGJhc2VkIGFwcHJvYWNoLCBidXQgZHVlIHRvIHRoZQ0KPiA+IGFib3ZlIGxp
bWl0YXRpb24sIHRoZSAxLXNjYW5saW5lIGFjY3VyYWN5IHJlcXVpcmVtZW50IGNhbm5vdCBiZSBt
ZXQNCj4gPiBvbg0KPiA+IERTSSAoSSBnb3QgKy0xNDAgfiAyODB1cyBqaXR0ZXJzKS4gQXMgYSBy
ZXN1bHQsIHRoaXMgdGVzdCBjYW5ub3QNCj4gPiBwYXNzDQo+ID4gb24gTVRLIERTSSB1bmxlc3Mg
d2UgZWxpbWluYXRlIENQVSBpZGxlIHdha2V1cCBsYXRlbmN5IGVmZmVjdHMuDQo+ID4gDQo+ID4g
UmVnYXJkaW5nIE1hcmsncyBzdWdnZXN0aW9uIHRvIHNwbGl0IGludG8gMiB0ZXN0czoNCj4gPiBJ
biBvdXIgY2FzZSwgYSDigJxUZXN0ICMy4oCdIHRoYXQgZXhwZWN0cyBhY2N1cmF0ZSB0aW1lc3Rh
bXBzIHdpdGggQ1BVDQo+ID4gaWRsZQ0KPiA+IGVuYWJsZWQgd291bGQgZWZmZWN0aXZlbHkgYmUg
YSBwZXJtYW5lbnQgZmFpbCAob3Igd291bGQgaGF2ZSB0byBiZQ0KPiA+IHNraXBwZWQpIG9uIERT
SSBkdWUgdG8gdGhlIGhhcmR3YXJlIGNvdW50ZXIgbGltaXRhdGlvbi4NCj4gPiBUaGVyZWZvcmUs
IEkgYmVsaWV2ZSBrZWVwaW5nIGEgc2luZ2xlIHRlc3Qgd2l0aCBhIGNsZWFyIGNvbW1lbnQgb24N
Cj4gPiB0aGUNCj4gPiBsaW1pdGF0aW9uIGFuZCB0aGUgZGlzYWJsaW5nIENQVSBpZGxlIHdvcmth
cm91bmQgaXMgbW9yZSBwcmFjdGljYWwuDQo+ID4gDQo+ID4gR2l2ZW4gdGhpcyBoYXJkd2FyZSBs
aW1pdGF0aW9uIG9uIERTSSwgd291bGQgeW91IGNvbnNpZGVyIHRoZQ0KPiA+IHdvcmthcm91bmQg
anVzdGlmaWVkIGZvciBNVEsgRFNJIHBsYXRmb3Jtcz8gT3IgZG8geW91IGhhdmUgYW55DQo+ID4g
c3VnZ2VzdGlvbnMvaWRlYXMgb24gaG93IHdlIGNvdWxkIGF2b2lkIG9yIG1pdGlnYXRlIHRoaXMg
bGltaXRhdGlvbg0KPiA+IGFuZMKgc3RpbGwgcHJvdmlkZSBhY2N1cmF0ZSB0aW1lc3RhbXBzPw0K
PiANCj4gSWYgeW91ciBoYXJkd2FyZSBjYW4ndCBwYXNzIHRoZSBhY2N1cmF0ZSB0aW1lc3RhbXAg
dGVzdA0KPiB0aGVuIGp1c3QgbGV0IGl0IGZhaWwuDQo+IA0KDQpIaSBWaWxsZSwNCg0KVW5kZXJz
dG9vZCwgdGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4NCg0KSSB0aGluayB0aGF0IHRoZSBw
dXJwb3NlIGFuZCBjb3JyZWN0bmVzcyBvZiB0aGlzIHRlc3QgYXJlIG5vdCBpbsKgDQpxdWVzdGlv
biBhbnltb3JlLg0KDQpCYXNlZCBvbiBvdXIgYW5hbHlzaXMgYW5kIHRoZSBEU0kgaGFyZHdhcmUg
bGltaXRhdGlvbiwgSSdsbCBmb2xsb3cgdXANCmludGVybmFsbHkgdG8gZGVjaWRlIHdoZXRoZXIg
d2Ugc2hvdWxkIHdhaXZlIHRoaXMgdGVzdCBvciBzaW1wbHnCoA0KbGVhdmXCoGl0IGZhaWxpbmcs
IGFzIHlvdSBzdWdnZXN0ZWQuDQoNClRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZSBhbmQgdGhlIGlu
c2lnaHRmdWwgZmVlZGJhY2suDQoNCkJlc3QgcmVnYXJkcywNCkphc29uLUpIIExpbg0K
