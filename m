Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A26ACD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 15:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D15610E174;
	Wed, 27 May 2026 15:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="hyqo1Skg";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FOXJs3kr";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA4810E174
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 15:49:46 +0000 (UTC)
X-UUID: ad1fd76259e311f1b1788b6acf885367-20260527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=4lIgvn8M9PdUm0GeLKrRCwHI+Jcxg4b+X6OvmK5xsmU=; 
 b=hyqo1SkgT1JSjFkNj9xeoGuGWhm23yAB+mVr9H0WOmzljW2uJAFOzBy+7HHsYq0kkuJnYVnXawv44g4Zg35P3GarQi/+PRRUC3rnXKttU0sypEZVie+YhKzQYFh/gwExj8dfDLWFSFdYm/57KpN3ky//4RS3QZf1ZE4zB6IGSUA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15, REQID:72b4227b-684b-4e6d-945d-5555f6433880, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e276073, CLOUDID:b019459b-add6-4d9a-86b9-b3237838d50d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ad1fd76259e311f1b1788b6acf885367-20260527
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1345347502; Wed, 27 May 2026 23:49:42 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 27 May 2026 23:49:40 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 27 May 2026 23:49:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvoSHLZKxp2VckzZNmrzDf5B8YmWPZPnBAfenqhjYwGEx9YPsB4r/ar1DKJPTf/K2HsbITCofVp7Yl7OriO841oMHqda/NTPKEW9zngWqdqgZhKzXskv94uxVyfJKYobPZ0AGE1Hfa+iWCYS/JT21Tu+DfpufUjHe7Cnd1GbbDgNcEqZdiSSYlk3oJT6xyylxdbA/AAeKUsnPYeWZ804b1fqi2M0sscHa4PV6k5NiUoHzgrUZugXCpukwu/kQY7TYGoJHbJs8GX+elbmIy28mSLmwESIEqZPp6OXmOLFEIuVTQUJKpnY1+mwjLmwQAMOpLbFFIGLm+Ci37oeDjul/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lIgvn8M9PdUm0GeLKrRCwHI+Jcxg4b+X6OvmK5xsmU=;
 b=gt2O/YmB/ovgM+VNIDRt4tNhSutabHjOcY+Ymd2BRHfWmvBDUKL8s7ipgQBCmish03gGruQnO5Nw07SsH6k6+jyMiiOZhYIR5aYoGe49PCzV9ax2sibolNEAPzdGjfTFzPWMaSGY8b3JIoy97n3r/lYMHBU7muybCcyE46YSauBuCbCsYgAcwVMfF4yxjsW6KJiVFZkvXMRydK0aeWXwkk9Qj7RIlcjZsDhg1JxzP6Kk1NiFXVhY4Pq5dRu7WOKl4vyd8Gg9/jzcnxauzm8W7CDdtmSLsCwguYFtn7ybue3xB2FgpbrzIKahtAppxj8WyHbxrTjHh585m5/Oq0l6rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lIgvn8M9PdUm0GeLKrRCwHI+Jcxg4b+X6OvmK5xsmU=;
 b=FOXJs3kr8eHSXwahoEnhBuTB/66zw8lDyVPIYBZ5Zpjqttrgp23rAaJowhxRn9MojViMBb0o0F4Ijusxi8A/VRu88u53MkZbel5X4YcWCl3vEaV5uJdGMwdMYCE2IMvw0Zdmxk+lSsWGpMZAWoURr30mfZlmRRhGXrwELnAZXFU=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB8228.apcprd03.prod.outlook.com (2603:1096:101:1b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 15:49:37 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 15:49:36 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "markyacoub@google.com" <markyacoub@google.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "gildekel@google.com"
 <gildekel@google.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "navaremanasi@google.com" <navaremanasi@google.com>
Subject: Re: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Thread-Topic: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Thread-Index: AQHc6CSPGBSfXb3UvEKHnz7wd/zZw7YW7uCAgADdDgCAAH/sgIABEb0AgAD/xQCAAMWgAIADm4iAgANSCIA=
Date: Wed, 27 May 2026 15:49:36 +0000
Message-ID: <fbd04831464f5b15708f88b24cdf95350f01f60f.camel@mediatek.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
 <ag28FVTooBC6Yly3@intel.com>
 <53284b68be0216eab50946da686968691fa59a56.camel@mediatek.com>
 <ag7g07pHLWgPViVh@intel.com>
 <988bcdc233564b398a87190cb40489d43ed3922c.camel@mediatek.com>
 <ahCdAq03EHvn3zu9@intel.com>
 <af89358195f2780dd882f339db7198e48543fb50.camel@mediatek.com>
 <CAC0gqY5ggHL8DM4qNHfpvx5Kc+_oZ63ogjU8k5fkaWfGeZ+SRw@mail.gmail.com>
In-Reply-To: <CAC0gqY5ggHL8DM4qNHfpvx5Kc+_oZ63ogjU8k5fkaWfGeZ+SRw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB8228:EE_
x-ms-office365-filtering-correlation-id: 0166ca43-00e0-42a1-e9cb-08debc078e16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|56012099006|4143699003|11063799006|3023799007|5023799004|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: Yqo1WGLz9fCiinXxRSgrLrg5LwBD71sG3rvXYmOI+vnWaOTegPmdpwtGZRxYyUkOpYFD/0MByHeJaqu9M25OhQc7sjFgigOLXO/hiGAhUtzFhVwHT17VKQGCjdOn9ULMwVKM/7b2fTYQqZOYroHL3XA2nA20q6NAWXoOKzoikglCDaW9tyvSgmd4DtrmqHHFPxFLsDe6395XIx0du1qc0viN/ArQaeSEsJjS8XJM5x22R1qmdCnp4EIIiRD3DNLgcZLrs3Nf/h0Rx5lwTJJUaGGFIMCSpUiN62KDm+MS86rAnBYp8pwZW/a+tfpRSBkxBvFIpGX4WOKfSfJlSspCvdjg9HvLaN4G8YJKDzrTaKEFAXmyPh1u4eDyVWJfhAsxK5qPo1whBJSMNQ5wOS6VeifMvY3EC/N8+jeHhybgMyFxGtW7G5uID90SXdcB0swrxEtHtmwZ18k+CFqqOp4Rxha+TzJZaA2CnEKLUVkS6IpKsNt8EdOKFEWQ9mxeZfdMdez4vbevpFqXr1t2gMIZskzv1LH3Kg/VVYtDQT/mMa4d0irQiRmfeH0KTDKVWF3EVxlpTj8Esby7h0N+rvS60u6khIU+hDV3v8IW8YEooyqh5WiOLR2aLWdrxLuknUZ4BzC/QEz9SxLTM4jbyAU+Zf5QcPOYpU5Vx26zlhCQ9iwJWr2USOH11jsyQDMnlzDOz9RBW2nJS9KX4c/Jf7OKmkHjUa7Clz9HDuiKb57vwhnUGmGKSPG4yIVuuCFjxPH3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(3023799007)(5023799004)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTZ5UTc5L1BtWm1oS25tQ2tlanFWYy9CVVZnazl4K2NKWEMvVnJ6Q1lVWjRQ?=
 =?utf-8?B?bGUvN0ZaMzRXM1JUUGc1YmswYjQzTk9JYndaL2hmNE1SQXk2VUFqdW9LUkg1?=
 =?utf-8?B?bmlENHg1SnJickpYdGE0ODcrNUlsZXhvSzJlQmhoUnBiaEhKNVl5N0JNV1Ji?=
 =?utf-8?B?Rm03bXJwNi9uWnNydHRPb1ZaZEhQbkUxMUZjSElFNHQxaTk5WHZFN3U1dENl?=
 =?utf-8?B?b3VWa2RlTVFyanZQbkpMSDl0Y05XNEw0WjVKMlBTaHZxUVBiV2IzYmU3TURs?=
 =?utf-8?B?M1FkWGhXOTAySE5rdndQRTR3VXpDS0ZTS01YVlZ3cjg5S0tLTGExMUlXTVNk?=
 =?utf-8?B?YlpmYlZkUjVNUk8yZjhFU1MwVk1oaUpOam9sUExsNkNoeE5uRWQ5bG5uUWZv?=
 =?utf-8?B?WWpwLy9sZnhOdFNJKzl5YWpkWHlEUWdMU2FmeUxXR252Z1ZFSmtqTCt3NVNN?=
 =?utf-8?B?RTB1MFNITjlJTUl2VDZLRXJkRFhRZ0pxS1EvZ0QydTcwUjFiMEdhblUySVNF?=
 =?utf-8?B?K2VLZ2xMTlVaWEtnc2d1a2VSZFBpeHVBTzdnQ1dUdjd3cXBoMElhNnBIVk1N?=
 =?utf-8?B?M28zenpqVHVRUFNWQnhRQ2RnaDRJd1NrdFgrSUVRaWJzUklwMjNLam9LTGc5?=
 =?utf-8?B?aXh1c0NWMUovTzJVcFhudXNTcW1nbzVpRjB4QWxOS1gyMjh5SWp2MzBBTHNP?=
 =?utf-8?B?RHpSd2cvRnQ1cHpLVVVUWkZYQmFnYURZUThldkphTTcrbE4ySzNUUkZQbTV0?=
 =?utf-8?B?QnNjZVlzeTFNZWxLV05Nem10dkxlN2RlTy9uYUtkQXlDNjlDSU93b2ZGbjVQ?=
 =?utf-8?B?cFlDVElpSWVhWjBUQThOUmk0VGdzQXdsMTh2ZmxOUERpMndJejJmVTdFdzJE?=
 =?utf-8?B?bHlwWUtWSmJkT29HYkxYdUNaYXpiRmtreGdrU2wxSU44TDB1OHh0R0ZZaUJY?=
 =?utf-8?B?TWNweXJYMU1mdGg1cXk2UjUzTVpqNUw1QlIvekFqVnF4WXFHMTA3ek05djhF?=
 =?utf-8?B?dUVKUktEQ3ZVbVBrMlV6REhDZ2lJRlN0YWV6MW5ZSUFJQ1A3U05zMDVodHJ0?=
 =?utf-8?B?ZS9wOVAzZXNiSkgxWWxiQ0xVQkRISlJzM0FqRnJqallvdnA1eURWK2g2eE40?=
 =?utf-8?B?SjlCTjAwZ1cySXVpZU9wRTNhejhzYmZmazgwWjVlUHNCQytna01OVWlneko2?=
 =?utf-8?B?TmV4c0dxbEF6RGthVURZUkQzSHA2QnFaSk5YcmdjVDdEQkV6L243RFBJa3NX?=
 =?utf-8?B?RXhYYW9VdFBYQnRkcXU5ak45T052a2NERlBvQ3FrV3FkSkxXYlUvOG9sb1Ux?=
 =?utf-8?B?djlJWm9sMVhucW1PK2dXcGptVEM2RkU2ZC9tMlFGVnB3TXlzSzE1OXdUZVpC?=
 =?utf-8?B?a1JsN0h6OEh0ZWs4YXVZK2pQNXY4akVFZDVFTEY3KzU5ZFVRUUEwVDJscjBP?=
 =?utf-8?B?aTkwVnhtQ1hiU1l6OFE5TGIrNTVDcDR1YkxDWWpsVGJIT2NOK1Q4U2hEOUNv?=
 =?utf-8?B?cUcwQjI0L2RGT2YxQjZmMG10TGx3N3ZVeit1L2JGOGZMYkpUd0RmS1NEaHJD?=
 =?utf-8?B?dHNzOWZqR1JOVitrT0xVWENmQTdCcGk1TU5vdklUTDNyanFydkcxdEF4Z0FB?=
 =?utf-8?B?MVVrSkVzLy96ZE5XcHdHekJuaEFSM29iT3NFVVFCcmIrWG03Uk4zRzNnWW01?=
 =?utf-8?B?clBacUNBbHJvMGRsWE9mT3BsL2tlRFo2Q0NaMVVjNzZSckxwbkR3NHRtQ2Rh?=
 =?utf-8?B?a0JMT1RKdnl1Y0t0dmRhNktVMHNYUitrMFpxS0h3QUcrUmNMRHFET01PM3Uv?=
 =?utf-8?B?bTRmckh6WHMxSUVhYnp2L3R5cjRxS3l2ZWtNZVFPM1BSTHhrZFlNemFTYzdX?=
 =?utf-8?B?NHJDTS9TVmhzNWtDZlJhNjVEQjhlM1EzYVhwWTJMai9WdHRJOWdjelJwYU12?=
 =?utf-8?B?QXNXUkNnajlZVzUvWkFWeWphQXI4K091a0hQRVhMNEdSTE5YVG5HSVd2ay9a?=
 =?utf-8?B?MXNuTjc1eVBvU0NJelJuMmk5RGtabE1tVmFscGIvRnlVL3pwWXVyM2gwWU9l?=
 =?utf-8?B?aXBJRmFWbXBGS1JPdXVwVGVEVnRWOXdMSVo1WEZJdzFraGwxNWx6RWRDOXVD?=
 =?utf-8?B?NzlmV2JvbGsrcE92RzBlcDE4cHFnNFNacUVQYUxESzkwRGQ1ODBjcFF5R25D?=
 =?utf-8?B?UXpJY0E3M1E2S3Zwa1lHQ0k3Vm5DQXFKQVMxYjFFaVBvU3Q4aU5kRkZPYUlP?=
 =?utf-8?B?M3YwdmVmbmRBRzMwZ0RHaDJqK09zVEFFSDk5OEY5N2RURzFKZ3dsSFJJenFW?=
 =?utf-8?B?VVcrL2hMZHhna1U3dTBkVGk2akwvbGlXbjJ2ZkFHRDdFemNZbVczcHdKbThw?=
 =?utf-8?Q?YO99641Hn4ItHOQc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9D0F960E0B60047AB589190517E803B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qSagJSSnW4sxLxrNA/i+TnJIWl/r6hJ2JFcIftqbxi8dCfGyKeKwv9ai6du0HekdKBESHuIDEiO0tu8MMYMs/6WwBOa9wQpp7mPMgYMSIjb/Fues8U5B6eQN+SEJzuiDoYDHbKNur5A7sS3WUImlixpFgx4V5u8trGWh1bymsAm75JWTUosbVW+US/zyO92RueDjp9egn8Nq210ZPUiVWPnULg0Na+ud84VeM8qgpynDsH0wjByP0/xMHr7vBP14M9MDU8u7QscEJhl0gFWYeTXUBUwlQ44f1738ulCv2E7eiKyaPIwmc1B5VXQVaqspRepYmoPWy4FvGzjEvjfTzA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0166ca43-00e0-42a1-e9cb-08debc078e16
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 15:49:36.7454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x1eP9DG1lvtvRJPNi9u3YgJ6EpJTkm99mafxiFhwmrwL6rWxtafGklPsaA7DLZOA3WH/iFx5MoWK7xbz/rSyR+kVxoTvRqCLlCB4vqDJOJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8228
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

T24gTW9uLCAyMDI2LTA1LTI1IGF0IDA5OjA3IC0wNDAwLCBNYXJrIFlhY291YiB3cm90ZToNCj4g
DQo+IA0KPiBPbiBTYXQsIE1heSAyMywgMjAyNiBhdCAyOjAy4oCvQU0gSmFzb24tSkggTGluICjm
npfnnb/npaUpDQo+IDxKYXNvbi1KSC5MaW5AbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPiA+IA0K
PiA+IFtzbmlwXQ0KPiA+IA0KPiA+ID4gPiBIaSBWaWxsZSwNCj4gPiA+ID4gDQo+ID4gPiA+IFRo
YW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrLg0KPiA+ID4gPiANCj4gPiA+ID4gWW91J3JlIHJpZ2h0
IC0gdGhlIHBhdGNoIHdhcyBwdXJlbHkgdG8gcGFzcyBJR1QgdGVzdHMsIG5vdCB0bw0KPiA+ID4g
PiBmaXggYQ0KPiA+ID4gPiByZWFsIHByb2JsZW0gKGFsdGhvdWdoIHdlIGhhdmVuJ3QgZW5jb3Vu
dGVyZWQgYW55IGlzc3VlIHdpdGhpbg0KPiA+ID4gPiByYW5kb21seSB+MjAwdXMgaml0dGVyIG9u
IG91ciBjdXJyZW50IHBsYXRmb3JtKS4NCj4gPiA+ID4gDQo+ID4gPiA+IEkndmUgaW52ZXN0aWdh
dGVkIHRoZSByZWFsLXdvcmxkIGltcGFjdCBvZiB0aGlzIH4yMDB1cw0KPiA+ID4gPiB0aW1lc3Rh
bXANCj4gPiA+ID4gaml0dGVyLiBJbiBvdXIgY3VycmVudCBBbmRyb2lkIFN1cmZhY2VGbGluZ2Vy
IGltcGxlbWVudGF0aW9uLA0KPiA+ID4gPiByZWFsLXdvcmxkIHVzYWdlIGlzIHN0YWJsZSB3aXRo
IENQVSBkZWVwIHNsZWVwIGVuYWJsZWQuDQo+ID4gPiA+IEl0IHNlZW1zIHRoaXMgaXNzdWUgb25s
eSBhcHBlYXJzIGluIElHVCBzaW5nbGUtQ1JUQyB0ZXN0aW5nDQo+ID4gPiA+IHdoZXJlDQo+ID4g
PiA+IENQVQ0KPiA+ID4gPiBlbnRlcnMgZGVlcCBzbGVlcCBkdXJpbmcgaWRsZSBwZXJpb2RzIGJl
dHdlZW4gZnJhbWVzLg0KPiA+ID4gPiBUaGVyZWZvcmUsIHdlIHByZWZlciBub3QgdG8gZGlzYWJs
ZSBDUFUgZGVlcCBzbGVlcCBzeXN0ZW0td2lkZQ0KPiA+ID4gPiBpbg0KPiA+ID4gPiBrZXJuZWwg
ZHVlIHRvIHBvd2VyIGNvbnN1bXB0aW9uIGNvbmNlcm5zLg0KPiA+ID4gPiANCj4gPiA+ID4gSG93
ZXZlciwgSSdkIGxpa2UgdG8gdW5kZXJzdGFuZCBob3cgdGhlIDEtc2NhbmxpbmUgc3RhbmRhcmQg
d2FzDQo+ID4gPiA+IG9yaWdpbmFsbHkgZGVmaW5lZCBmb3IgdGhpcyB0ZXN0LiBEbyByZWFsLXdv
cmxkIHVzZSBjYXNlcw0KPiA+ID4gPiBhY3R1YWxseQ0KPiA+ID4gPiByZXF1aXJlIHRoaXMgbGV2
ZWwgb2YgcHJlY2lzaW9uPw0KPiA+ID4gDQo+ID4gPiBJIGRvbid0IGhhdmUgc3BlY2lmaWMgZXhh
bXBsZXMsIGJ1dCBwZW9wbGUgY2FyZWQgYWJvdXQgcHJlY2lzaW9uDQo+ID4gPiBlbm91Z2ggdG8g
YWRkIHRoZSB3aG9sZSB0aW1lc3RhbXAgY29ycmVjdGlvbiB0aGluZ3kgaW50byB0aGUNCj4gPiA+
IGtlcm5lbC4NCj4gPiA+IEFuZCBpbiBpOTE1IHdlIGFsc28gc29tZXRpbWVzIHVzZSB0aGUgdGlt
ZXN0YW1wcyB0byBjb29rIHVwIGENCj4gPiA+IGZyYW1lDQo+ID4gPiBjb3VudGVyICh3aGVuIHRo
ZSBoYXJkd2FyZSBsYWNrcyBvbmUpIGFuZCBJIHdvdWxkbid0IHdhbnQgdG8gZG8NCj4gPiA+IHRo
YXQNCj4gPiA+IHdpdGhvdXQgYWRqdXN0aW5nIHRoZSB0aW1lc3RhbXBzIGJhc2VkIG9uIHRoZSBz
Y2Fub3V0IHBvc2l0aW9uLg0KPiA+ID4gDQo+ID4gPiBBbnl3YXlzLCBzaW5jZSB0aGlzIGlzIHVz
dWFsbHkgaW1wbGVtZW50ZWQgdmlhIGEgc2NhbmxpbmUgY291bnRlcg0KPiA+ID4gKHNvbWV0aW1l
cyBldmVuIGEgcGl4ZWwgY291bnRlcikgdGhhdCdzIHRoZSBraW5kIG9mIGFjY3VyYWN5IG9uZQ0K
PiA+ID4gd291bGQgZXhwZWN0IHRvIGdldCwgYW5kIHNvIHRoYXQncyB3aGF0IG9uZSB0ZXN0cyBm
b3IgdG8gbWFrZQ0KPiA+ID4gc3VyZQ0KPiA+ID4gaXQncyB3b3JraW5nIGNvcnJlY3RseS4NCj4g
PiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gTm90IGFsbCBwbGF0Zm9ybXMgc3VwcG9ydCBvciBpbXBs
ZW1lbnQgZ2V0X3NjYW5vdXRfcG9zaXRpb24oKSAtDQo+ID4gPiA+IGNvdWxkIHRoZSBzdGFuZGFy
ZCBiZSByZWxheGVkIGZvciBzdWNoIHBsYXRmb3Jtcz8NCj4gPiA+IA0KPiA+ID4gSWYgeW91IGRv
bid0IGltcGxlbWVudCBhY2N1cmF0ZSB0aW1lc3RhbXBzIHRoZW4gdGhlIHRlc3QgaXMNCj4gPiA+
IGV4cGVjdGVkIHRvIGZhaWwuIEkgc2VlIG5vdGhpbmcgd3JvbmcgaW4gdGhhdC4NCj4gPiA+IA0K
PiA+ID4gUmVsYXhpbmcgdGhlIHRlc3QgZG9lc24ndCBtYWtlIHNlbnNlIHRvIG1lIGJlY2F1c2Ug
dGhlbiBpdCBjYW4NCj4gPiA+IG5vIGxvbmdlciB0ZWxsIHlvdSB3aGV0aGVyIHlvdXIgdGltZXN0
YW1wcyBhcmUgYWNjdXJhdGUgb3Igbm90Lg0KPiA+ID4gQWx0aG91Z2ggSSBndWVzcyB5b3UgY291
bGQgaGF2ZSBhbm90aGVyIHNpbWlsYXIgdGVzdCB0aGF0DQo+ID4gPiBtYWtlcyBzdXJlIHRoYXQg
dGhlIHRpbWVzdGFtcHMgYXJlIGF0IGxlYXN0IHNvbWV3aGF0IHNhbmUsDQo+ID4gPiBldmVuIGlm
IG5vdCB2ZXJ5IGFjY3VyYXRlLg0KPiA+ID4gDQo+ID4gDQo+ID4gSGkgVmlsbGUsDQo+ID4gDQo+
ID4gSSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQsIGFuZCBJIGFncmVlIHRoYXQgaW1wbGVtZW50aW5n
DQo+ID4gZ2V0X3NjYW5vdXRfcG9zaXRpb24oKSBpcyB0aGUgcHJvcGVyIGxvbmctdGVybSBmaXgu
DQo+ID4gDQo+ID4gSG93ZXZlciwgSSdkIGxpa2UgdG8gZXhwbGFpbiBvdXIgcmVhc29uaW5nIGZv
ciB0aGlzIHBhdGNoLg0KPiA+IFRoZSBwdXJwb3NlIG9mIHRoaXMgdGVzdCBpcyB0byB2ZXJpZnkg
dGhlIGFjY3VyYWN5IG9mIHRoZSBrZXJuZWwNCj4gPiB2YmxhbmsNCj4gPiB0aW1lc3RhbXAgaXRz
ZWxmLiBXZSBoYXZlIGlkZW50aWZpZWQgdGhhdCBkaXNhYmxpbmcgQ1BVIGlkbGUNCj4gPiBlbGlt
aW5hdGVzDQo+ID4gdGhlIGppdHRlciBhbmQgdGhlIHRlc3QgcGFzc2VzLCB3aGljaCBjb25maXJt
cyB0aGF0IG91ciB0aW1lc3RhbXANCj4gPiBpbXBsZW1lbnRhdGlvbiBpcyBjb3JyZWN0IC0gdGhl
IH4yMDB1cyBqaXR0ZXIgaXMgY2F1c2VkIGJ5IENQVSBpZGxlDQo+ID4gd2FrZXVwIGxhdGVuY3kg
YXMgYW4gZXh0ZXJuYWwgaW50ZXJmZXJlbmNlLCBub3QgYnkgdGhlIHRpbWVzdGFtcA0KPiA+IG1l
Y2hhbmlzbSBpdHNlbGYuDQo+ID4gDQo+ID4gVGhlcmVmb3JlLCBiZWZvcmUgd2UgY29tcGxldGUg
dGhlIGdldF9zY2Fub3V0X3Bvc2l0aW9uKCkNCj4gPiBpbXBsZW1lbnRhdGlvbiwgd2UgYmVsaWV2
ZSB0aGlzIHBhdGNoIHN0aWxsIGhhcyB2YWx1ZSAtIGl0IGFsbG93cw0KPiA+IHRoZQ0KPiA+IHRl
c3QgdG8gZWZmZWN0aXZlbHkgdmVyaWZ5IG91ciB0aW1lc3RhbXAgYWNjdXJhY3kgYnkgcmVtb3Zp
bmcgdGhlDQo+ID4gZXh0ZXJuYWwgQ1BVIGlkbGUgaW50ZXJmZXJlbmNlLCB3aGlsZSBhbHNvIHBy
ZXZlbnRpbmcgb3RoZXINCj4gPiBwb3RlbnRpYWwNCj4gPiBpc3N1ZXMgZnJvbSBhZmZlY3Rpbmcg
dGltZXN0YW1wIHByZWNpc2lvbiBvbiBNZWRpYVRlayBwbGF0Zm9ybXMuDQo+ID4gDQo+IA0KPiBo
ZXJlIGlzIG15IDJjOsKgDQo+IEFzIHRoaXMgdGVzdCB1bmNvdmVyZWQgYW5vdGhlciBidWcgKGV4
dGVybmFsIENQVSBJZGxlIGludGVyZmVyZW5jZSksDQo+IGl0IE1VU1Qgbm90IGJlIHJlbW92ZWQu
IE90aGVyd2lzZSwgd2UgaGlkZSBhIGJ1ZywgZXZlbiBpZiBpdCB3YXNuJ3QNCj4gdGhlIGludGVu
ZGVkIHRlc3QuDQo+IFRoZXJlZm9yZSwgaWYgeW91IGRlY2lkZSB3aXRoIFZpbGxlIHRoYXQgdGhl
cmUgaXMgdmFsdWUgaW4geW91cg0KPiB3b3JrYXJvdW5kLCBpdCBtdXN0IGJlIEFOT1RIRVIgdGVz
dC4NCj4gVGVzdCMxIHNob3dzIHRoYXQgeW91IGhhdmUgYW4gYWNjdXJhdGUgdGltZXN0YW1wIHdp
dGhvdXQgaW50ZXJmZXJlbmNlDQo+ICh0aGlzIHNoYWxsIHBhc3MgZm9yIE1USykNCj4gYW5vdGhl
ciB0ZXN0IHNob3dpbmcgdGhhdCBDUFUgaWRsZW5lc3Mgd2l0aCB0aHJvdyBvZmYgdGhlIGFjY3Vy
YWN5IG9mDQo+IHRoZSB0aW1lc3RhbXAgKHdpbGwgZmFpbCkNCj4gVGhpcyB3aWxsIGdpdmUgeW91
IDIgcmVzdWx0czogYWNjdXJhdGUgdGltZXN0YW1wcyB0aGF0IGRldmlhdGVzDQo+IHNvbWV0aW1l
LiBJdCdzIHVwIHRvIHlvdSBhbmQgdGhlIHBsYXRmb3JtIG93bmVyIHRvIGRlY2lkZSBpZiB0aGlz
IGlzDQo+IGFuIGFjY2VwdGFibGUgYmVoYXZpb3IuwqANCj4gQnV0LCB3ZSBzaGFsbCBub3QgY2hh
bmdlIGEgdGVzdCB0byBoaWRlIGEgYnVnLg0KPiANCj4gLU1hcmsNCj4gPiANCg0KSGkgVmlsbGUg
YW5kIE1hcmssDQoNClRoYW5rIHlvdSBib3RoIGZvciB0aGUgdmFsdWFibGUgZmVlZGJhY2suDQpJ
IGludmVzdGlnYXRlZCBpbXBsZW1lbnRpbmcgZ2V0X3NjYW5vdXRfcG9zaXRpb24oKSBvbiBNZWRp
YVRlaywgYW5kIEkNCmZvdW5kIGEgaGFyZHdhcmUgbGltaXRhdGlvbiB0aGF0IHByZXZlbnRzIHVz
IGZyb20gYWNoaWV2aW5nIGFjY3VyYXRlDQp2YmxhbmsgdGltZXN0YW1wcyBvbiBEU0kuDQpVbmxp
a2UgSW50ZWwsIHdoaWNoIHR5cGljYWxseSBoYXMgYW4gb3V0cHV0LXNpZGUgc2NhbmxpbmUgY291
bnRlciB0aGF0DQp0cmFja3MgdGhlIHJlYWwgcGFuZWwgc2Nhbm91dCBwb3NpdGlvbiBhY3Jvc3Mg
dGhlIGZ1bGwgZnJhbWUgKGluY2x1ZGluZw0KYmxhbmtpbmcpLCBvdXIgRFNJIHByb3ZpZGVzIGFu
IGlucHV0LXNpZGUgbGluZSBjb3VudGVyLiBJdCBvbmx5IGVmbGVjdHMNCnRoZSBEU0kgaW5wdXQg
cHJvY2Vzc2luZyBwb3NpdGlvbiBkdXJpbmcgdGhlIGFjdGl2ZSByZWdpb24sIGFuZCBpdA0KYmVj
b21lcyBub24taW5mb3JtYXRpdmUgZHVyaW5nIHZibGFuayAob2Z0ZW4gcmVhZGluZyBhcyAwKSwg
c28gd2UNCmNhbm5vdCBkZXRlcm1pbmUgdGhlIGV4YWN0IHNjYW5saW5lIHBvc2l0aW9uIHdpdGhp
biB0aGUgdmJsYW5rDQppbnRlcnZhbC4NCg0KQSBzaW1wbGlmaWVkIGRpYWdyYW0gb2YgdGhlIGRp
ZmZlcmVuY2U6DQoNCkRJU1AgLT4gRFNJIC0+IFBhbmVsDQogICAgIHwgICAgICB8DQogICAgIHwg
ICAgICArLS0gSW50ZWwgc2NhbmxpbmUgY291bnRlciAoT1VUUFVUIHNpZGUpDQogICAgIHwgICAg
ICBlLmcuIFBJUEVEU0wNCiAgICAgfCAgICAgIC0gQ291bnRzIHRoZSByZWFsIHBhbmVsIHNjYW5v
dXQgcG9zaXRpb24NCiAgICAgfCAgICAgIC0gQ292ZXJzIGFjdGl2ZSArIHZibGFuayAoMCB+IHZ0
b3RhbC0xKQ0KICAgICB8ICAgICAgLSBTdGlsbCBtZWFuaW5nZnVsIGR1cmluZyB2YmxhbmsNCiAg
ICAgfA0KICAgICArLS0gTWVkaWFUZWsgRFNJIGxpbmUgY291bnRlciAoSU5QVVQgc2lkZSkNCiAg
ICAgZS5nLiBEU0lfSU5QVVRfREVCVUcNCiAgICAgLSBDb3VudHMgRFNJIGlucHV0IHByb2Nlc3Np
bmcgcG9zaXRpb24NCiAgICAgLSBPbmx5IGNvdmVycyBhY3RpdmUgcmVnaW9uICgwIH4gdmRpc3Bs
YXktMSkNCiAgICAgLSBEdXJpbmcgdmJsYW5rIHRoZXJlIGlzIG5vIGlucHV0IGRhdGEsIHNvIHRo
ZQ0KICAgICAgIGNvdW50ZXIgbWF5IHN0b3AvcmVzZXQgYW5kIHJldHVybiBhcyAwDQogICAgIC0g
VGhlcmVmb3JlIGl0IGNhbm5vdCBpbmRpY2F0ZSB0aGUgZXhhY3QgcG9zaXRpb24NCiAgICAgICB3
aXRoaW4gdGhlIHZibGFuayBpbnRlcnZhbCAodmRpc3BsYXkgfiB2dG90YWwtMSkNCg0KSSBhdHRl
bXB0ZWQgYSBnZXRfc2Nhbm91dF9wb3NpdGlvbigpIGJhc2VkIGFwcHJvYWNoLCBidXQgZHVlIHRv
IHRoZQ0KYWJvdmUgbGltaXRhdGlvbiwgdGhlIDEtc2NhbmxpbmUgYWNjdXJhY3kgcmVxdWlyZW1l
bnQgY2Fubm90IGJlIG1ldCBvbg0KRFNJIChJIGdvdCArLTE0MCB+IDI4MHVzIGppdHRlcnMpLiBB
cyBhIHJlc3VsdCwgdGhpcyB0ZXN0IGNhbm5vdCBwYXNzDQpvbiBNVEsgRFNJIHVubGVzcyB3ZSBl
bGltaW5hdGUgQ1BVIGlkbGUgd2FrZXVwIGxhdGVuY3kgZWZmZWN0cy4NCg0KUmVnYXJkaW5nIE1h
cmsncyBzdWdnZXN0aW9uIHRvIHNwbGl0IGludG8gMiB0ZXN0czoNCkluIG91ciBjYXNlLCBhIOKA
nFRlc3QgIzLigJ0gdGhhdCBleHBlY3RzIGFjY3VyYXRlIHRpbWVzdGFtcHMgd2l0aCBDUFUgaWRs
ZQ0KZW5hYmxlZCB3b3VsZCBlZmZlY3RpdmVseSBiZSBhIHBlcm1hbmVudCBmYWlsIChvciB3b3Vs
ZCBoYXZlIHRvIGJlDQpza2lwcGVkKSBvbiBEU0kgZHVlIHRvIHRoZSBoYXJkd2FyZSBjb3VudGVy
IGxpbWl0YXRpb24uDQpUaGVyZWZvcmUsIEkgYmVsaWV2ZSBrZWVwaW5nIGEgc2luZ2xlIHRlc3Qg
d2l0aCBhIGNsZWFyIGNvbW1lbnQgb24gdGhlDQpsaW1pdGF0aW9uIGFuZCB0aGUgZGlzYWJsaW5n
IENQVSBpZGxlIHdvcmthcm91bmQgaXMgbW9yZSBwcmFjdGljYWwuDQoNCkdpdmVuIHRoaXMgaGFy
ZHdhcmUgbGltaXRhdGlvbiBvbiBEU0ksIHdvdWxkIHlvdSBjb25zaWRlciB0aGUNCndvcmthcm91
bmQganVzdGlmaWVkIGZvciBNVEsgRFNJIHBsYXRmb3Jtcz8gT3IgZG8geW91IGhhdmUgYW55DQpz
dWdnZXN0aW9ucy9pZGVhcyBvbiBob3cgd2UgY291bGQgYXZvaWQgb3IgbWl0aWdhdGUgdGhpcyBs
aW1pdGF0aW9uDQphbmTCoHN0aWxsIHByb3ZpZGUgYWNjdXJhdGUgdGltZXN0YW1wcz8NCg0KQmVz
dCBSZWdhcmRzLA0KSmFzb24tSkggTGluDQo=
