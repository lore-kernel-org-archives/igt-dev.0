Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BF5E6BF0E
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 13:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417F910E05E;
	Fri, 30 Jan 2026 13:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="FYB5pVlT";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="SuWT7suk";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8612A10E05E
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 13:32:30 +0000 (UTC)
X-UUID: 1576e086fde011f0b7fc4fdb8733b2bc-20260130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=GgFVFwKE25Yftqj+pbxDUrLiWOls7D61MDe8cC9/E4w=; 
 b=FYB5pVlTnxhhGy/cv1piD5VH07jnEuMmhIqaqZo1rbu4/v+NzP/7gvbm4FAkWBYtmiZvcgyNmZXGG1EsNjJmZ+4vWYHyVhZlAoqC/7IMtNcUB1J9ojE7s1A3cz3J0lbBnCebSnnQY4HAwGx3/5do8VE4onYtl7gDdRIu5pPRRp4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:72df6816-f4ff-4032-bbee-930e2bcd150c, IP:0,
 U
 RL:0,TC:0,Content:9,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:9
X-CID-META: VersionHash:89c9d04, CLOUDID:729921e9-ef90-4382-9c6f-55f2a0689a6b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:4|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1576e086fde011f0b7fc4fdb8733b2bc-20260130
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1166169270; Fri, 30 Jan 2026 21:32:12 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 30 Jan 2026 21:32:11 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 30 Jan 2026 21:32:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCxdcQUhRqAIABx0KZksDtO7T7JgB0MWNgdqraDfq/fb4Qx9dDCoqe5s1F5w6y4XPqRdZg2AbKukpefS1ib/wAvjmqCHWHOGXTqJ33lT3OUtu1ffKLUhHPMCHwzyT730l9tNFttM3ECtmPhgZRAKO7hNY8ZJjr/L78MbH4eejRMQJm/fsHL7vqgLhlqVaO9RguKXel3BdovYyI4WnNUaVOZ73pP0NmSCLAL8j8z4HJ287rhTwdlzUgR/TvdRlznmNCGZYL4zm46H2AQayCL77uJJASQnk58ddzlaxhjiMVGpDLLlXqATSrpStlwYDrotJfAN3s+94z0jk6OXSLXUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ghomg8otG19G0wvZACS+IZFNNB4QlugavNn5qwAseGY=;
 b=Llo6RSxKqhuPPEZMPDoV1CyS7gcizWGa5rhCzZ816CB3IW7fXnC7jFuiq9z3r6SqHgZKQ+XwrEkVRNnYzo3AGiUuqjns4EychCM8Yk0+rNoJHO7jVTmEYL95ObUIy4/GmwqJo/718DERkZQEeGUI11bwvMHwgnJY7T4P4//2Ol9/yO6EwZPQeob3CwIngcbCzGontbb3j9kAUmbama0dvxrV3KZ70V1EkCvOEkRu4np1ca47FyZfhPqhOXw4c45H9yyjv5v08qfhOO08Cwt7zjxbxvEOBxEWxxsr+sr9Y6jx5gVQGRJSe3ZWFF/YBpo5zGz/PBsqHzZ2wZ6y4qoY6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ghomg8otG19G0wvZACS+IZFNNB4QlugavNn5qwAseGY=;
 b=SuWT7suk61SmaxktNJApFoZpexfB5lajliKbINqhrFmtoF91hdL7NzKH0Yya9CBJ8Op1Doi72yYHmd68FaUyEX8e02WGTFgdvNfQ0nGHrl+zYMcQWRxMDCOPBkIaGRVkJGUy4R1rZqkJ8m6jkQ/Tnn6dOsLuAQhhvl6+wFpKB30=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB8155.apcprd03.prod.outlook.com (2603:1096:101:17f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 13:32:05 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 13:32:05 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "bhanuprakash.modem@gmail.com"
 <bhanuprakash.modem@gmail.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "gildekel@google.com"
 <gildekel@google.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t 1/2] test/kms_color: Clamp CTM values to -2.0~2.0
 for MediaTek devices
Thread-Topic: [PATCH i-g-t 1/2] test/kms_color: Clamp CTM values to -2.0~2.0
 for MediaTek devices
Thread-Index: AQHckC/AlQjiKMuPCEWx24VxlIJLKLVpALOAgAG4kgA=
Date: Fri, 30 Jan 2026 13:32:05 +0000
Message-ID: <46faee5462bfcdc4e40fabaa6d9bc830fb2c51df.camel@mediatek.com>
References: <20260128082517.920321-1-jason-jh.lin@mediatek.com>
 <20260128082517.920321-2-jason-jh.lin@mediatek.com>
 <aXtBQd_hHu3OgCG6@intel.com>
In-Reply-To: <aXtBQd_hHu3OgCG6@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB8155:EE_
x-ms-office365-filtering-correlation-id: 7f3e3bd1-4272-40f4-14f1-08de6003f572
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?cDJzNmVBT1ZHbTYyV1Y3S3NnN3pqbllIZVFRWHU2YVY2RzNHWHFEUU10NCto?=
 =?utf-8?B?blVjNVFmNCtVU2JyRnNBSHY5dTlOM3lRN3AzaUtEbDNVQjMxZUc2T1c0SUVu?=
 =?utf-8?B?UUxNbDZTNnM5UldlenJBNUZhZ01PZm9iMk1OZjdHSFl6NVRpeVM2T1QzQ0ZH?=
 =?utf-8?B?di8vRnIrSHJXRGR4U1g2eG9zZDFwR3FIUmNCSXpmTHdySEN6TzVyUCswNFRI?=
 =?utf-8?B?N2JlaWMxQUoydVZhOEFpMW1lVDZ2RHJ6NDdONTdDY1E3dWNLa280OE05dVBv?=
 =?utf-8?B?S0FYd3dWeVVzVHlyenFhOHVHREREblZiZXVrUGwzOTJCVXp0MlFjb2xZYWo0?=
 =?utf-8?B?WHkvOVdEQ0k0azNCSERycytmR1pLQVlYYUhOWTdiVnF5Qm1HVDlrTndwRWZC?=
 =?utf-8?B?VXBpeHpRQVhkZVlGZ1REeEluUVQyd2VtOFlWM3RVSjJKY29OR3cxNElEQzNL?=
 =?utf-8?B?KzdXUS85WjV5S2luZDhhVmtqWUt5R1NXWUNsVXlVcTZJY1gzVmh5TTNHanA1?=
 =?utf-8?B?WCtTMlJRV05qa20xODlKSWUzb2NYdzFrclRmYSsrZ1JadEYveE52Q2tmeW4y?=
 =?utf-8?B?VG5FRUdZdWcxRG5YR1NkZkdXR0haaW1rWkhhSXY5cFVsY1M1c01HU1NqNWtD?=
 =?utf-8?B?b3ppNjZUY0N4cnpjOFJvU0ROeDlpRmRXQmlHMTBNRk40eWpHdGNCM3Q2QmZi?=
 =?utf-8?B?MmRtdFE0VTV2NUxMZ092U0dyY1NacG44c3dHZDNPd3k5NzVNTHdXc0tVQk9T?=
 =?utf-8?B?QmxtdzAvU0VkLzBQbmFJRlg2NTFoR0lzOHF5ZkNDSTNNekZJQjBWZE5LZmFQ?=
 =?utf-8?B?VFY1L3R1dFRrcDJTdkk2eEZiL2NOblduZCtQamJFekRlbU9xK2VFMisyNktr?=
 =?utf-8?B?ODczS3B3aVVLVHFaM0ZmVHY1L1pkR3paYmFXYmJob2hXRzJERjUrN3hIeDlO?=
 =?utf-8?B?LytVUlJsUXRSemZtbkR3TWNpc2Z2eldUeHIrUzcyejB1MzZHT2hWMUdXZmJL?=
 =?utf-8?B?WDdrZGpHN25EUTJIWjgralJ6T29xbW42UFhYbFlLUWFuTVI1cndka1MwYVNO?=
 =?utf-8?B?Q1VNbC81N25GR0h4a0Y2Q2dzQU03QUNUQUFaZnBwZHF2eGVZcXdTRGtKT0xH?=
 =?utf-8?B?MnQrQ3FPNW1HV0VIOVZEeVd1ejFYTldPMXNlU3pVNHFrNTgyT2NCUjh6NE9s?=
 =?utf-8?B?Mm02b0Y4YzdDc0oxZW5ObWZlTW52UFNHMk9Da1p2amdJekZhQkZhYVBRM2pr?=
 =?utf-8?B?Tk84VGJ5UFJVanhKMkdDb1R3a0dRSnBCSFNoWnZ3c2k5cHFKSVNiSkZjL0VB?=
 =?utf-8?B?cVZ3b0hJTGhUWTQwQlpCWVBvTFczTnl4VTcxV09nOWlWenN5eHlhZjhMQ2Vz?=
 =?utf-8?B?dklKaGhqd1hjZjdSNm5ML00xd0g4N1JGWStRRHpWRU9Ra2NFYnpmVmptOUFE?=
 =?utf-8?B?cExYTXM4Y2VKbTVlUXZEZmc2d2hTRDQyR1g3dXZEOTF0YVdsQkxFc0NxWnoy?=
 =?utf-8?B?QUZySnF1dXdqYUR0NEhzRVRKREVlNzFtZDVHb0pRcmFSMWdpUDBLOGJpSnNo?=
 =?utf-8?B?c0Rza1BhbFZHRWhyQW9pbW03T0pzdmJVaENraTFWTzhsWjFkeVVjVEdyaTZ2?=
 =?utf-8?B?OVNrOTNsZWlWeGZ4OGgyL0xFS3c2amgrOE1xTVZHWExLeXNDM0tWb1R1aDNm?=
 =?utf-8?B?ZmRyenkrYkFOdityTHp0QTNLRjBkSURyTTlJSUdnU0M5RUgxUjczWHJKeWpI?=
 =?utf-8?B?QWFhWk83OG1HclRsN2lyY1paUXRXcWFNc0ZOTllwQ0IzRS8xQ2JaL1NyZzdQ?=
 =?utf-8?B?NDN6MlR4YlkvWGtCcGJEUnJMUmN4OGZaeWJEZW40RWVhTm5DUVczSCttVk90?=
 =?utf-8?B?NGZja0pHTllMR2ZwY3d5Y1BZakNTbWFya3BOS2NGNnNoOUliZFFaOGsxWFRq?=
 =?utf-8?B?Q0tBamdBcTlXNnJacFN0WnFhRGtrODFYOXFtUWVSN1ZLWnlkSDhFTTR0eUNu?=
 =?utf-8?B?ZU16eS9HVVN2SkNBZENWdGJGNTFSNjRRd0M1NUl1d05KRGdZejJRS2w5M2Jn?=
 =?utf-8?B?ZFF5OFIzRXJSV1Vyb3NwdS9laTF4TEIveDdtZGV6SzE3andxak1Lc21tMVA0?=
 =?utf-8?B?UGpLWHl6OFk0R05sNGhTQ29YbFNDQURETldndXpkUGlkcVM1QXdyY01jVW43?=
 =?utf-8?Q?fnXQGqiYHD5+LmURRxgH1MU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjN1Ym9ZSFJqWWxqOWVjTGk2UDh3clpwOEtGK3JHTTRrSEdpMm1GSXlmVi9q?=
 =?utf-8?B?V2dHMGhFWW5RdFpVSGQ4UlhYVjlxQnlicXNiMEdGRmp6aTY0YTZHVkRYWUV1?=
 =?utf-8?B?ekhtYzhKZUxhdDJmT1g3WEtZQzlCUm45aGxtNTV0ZU5ZcGp2NzhJeHV2WEtv?=
 =?utf-8?B?STVydmhGWXE1SC9zV1UrTDJoMTExeUFINGJ3K3hkdlVpNUJjOUo3bnJTNWhT?=
 =?utf-8?B?VjFodTNpWHdYUzNMMWwvY0IxcDM3RFF2RzBsU1dxb0czTWgzTTIwaU1EaVlz?=
 =?utf-8?B?TmtPNS9MOFhpWEFxZ05pZ0tjTXNObHZuYXorSWNTbUp0Wmh0dzhUMys1eXhV?=
 =?utf-8?B?cGdvY0xDbnVMWGlueUcvay9ETmFtdUZGNzZrWFg2YkZWR1I3ZFZReERqS3Ew?=
 =?utf-8?B?Yy8yems0UVlaTG0vVC9WS2ppMzFHUmlVdkNVcHBLK1QvZ2tPbGQ0bXVsVG9G?=
 =?utf-8?B?Y2EvMnhiT2lUbUxKMGtyM0dHMFhwdE5PaE5Jb1F0dDNEaXA0d3VLYnhJWDF5?=
 =?utf-8?B?b1FqeEpyMlV1MjIzSGlULzlDMGNqOWdUY2J0YmY3OWRmcnZ3SGdZbDZKMVhG?=
 =?utf-8?B?RVB0MGRCZEtLNk9oQjZPWE5vMFExcjE5Vmc4UGhtd09GSURpUEFidUFTeVl0?=
 =?utf-8?B?MFdVMXkxM2dYR21EcGFiMnExWjdMckduWmNHK0Y5THIrb1FWdnpySnBHanFM?=
 =?utf-8?B?aHorVm02bTF3c2NPVndPNmlEbElscXBpc1phSEtxcERiVlV1Y2tKQnBMVHlq?=
 =?utf-8?B?VnR2ZVhzbnVhYmFNMFFVS25wMHVURDUzSlJSdVRDZUt4eXAwL0d5emtrbUVE?=
 =?utf-8?B?eVAvVWFVRlJHYUpqS0h3Ry9NUFRRakpvL3NVaUoxVWp3cDN4R3JLcDlSYXdK?=
 =?utf-8?B?ZlZPUW1UOVlsK3JMQ3RrMEY0UFk5enhIdDJ6cFR3cjNOK3V5c3I5Z3RFQXA0?=
 =?utf-8?B?NEFrQnUvMGF1MXZqOWpSTDVLdXJidFFENmRsZ3pMWDBaQ3BJTHZhbVRSTnM5?=
 =?utf-8?B?M2hJSS9ROFA0WUkvWGlCZHJUYWVvNHBUYk55MWdDeE5RN2dNQUtHR1NmN0F4?=
 =?utf-8?B?ZFRXbzNwMER4ZFpXTDNiR0NGbkdzalRyekFmU3N5VDRJUGZOdlJuOE1NUGpP?=
 =?utf-8?B?UmZXQmZaKzg0UkkrRGFSVjdLdnpLcHhMRkMxTk9MM2R3N2VuR2JtNk1jdFNw?=
 =?utf-8?B?OHN6OTcydlExT3hUQTlmY3lGU0orRkdHemhJczFodTNGNk4rWW8xY0V6YWk5?=
 =?utf-8?B?SkFSYU5Nbnl3ZkVjOWYyYTNMU0Y1dGprbnJzVEVvQVBMWTlnR2xpVTZHUGww?=
 =?utf-8?B?UmY3ZFpoT0FHV3EyaDlweHdlaGVmZ1ZkckY2YlcwM2xPMjlLbzMzNGxoNWQ4?=
 =?utf-8?B?akU2WmRUMG5LaSttbTg2SHRIaFltODZ3Si94ZkdEYzJVeXk0a0NqMjI1Q1M2?=
 =?utf-8?B?ZStRbWN5aytlWExkbE5DUzV0eDFhKzZCelJDUlBnWDFkUnEvRHVUb0t4azdy?=
 =?utf-8?B?RjRRbmhZcGlUSzdXcFRuamhRejJkZTE2dGZXWnJJV2hMaTlZWDdYd281NnRT?=
 =?utf-8?B?US9Ca1VQeEFoR0RBVndleVRBVmRzUUtXcUJ0UnRCRjR3NEtsVkthbHhCMEVX?=
 =?utf-8?B?RTJvQjhmVjZ3VG00SkdsaGhXa3NZaHNJamF2dDBUZmYwYjJnaWZrbU40UUxN?=
 =?utf-8?B?d2ZvZUF0RlA0K3pkZWpZWU96MW1mT3VFV2pvWFRMZlRWay9zZnVOb0dsdTJL?=
 =?utf-8?B?U2hoV3MwT0xyZ1gvRXVPMkJZcWxRdFFNYWF5Yk9SVmVQaUVtY3JqUWxqWVdU?=
 =?utf-8?B?ZDRMbUN6bDYwWnNpa2F3emVQUUM2K3VnNy9rVGlsOGI5a2V3SnNQSkhhT25Y?=
 =?utf-8?B?aXBIM3AwNURRL3hnZXVoSUFZS0ZFSzRaNE9SV0gyUzIwbXZna1JTV3g5Qkgw?=
 =?utf-8?B?cTNJdDBaSDJjTGJUUnovRmtLeEx5QWtxc1hyOENoUk5UMnZYUkloVWdQbG83?=
 =?utf-8?B?SDdFc0JTYzg4NFllTHJKTDdKQTVtTVNCSldydHdIcGFSK01oM0JXTmlOREhp?=
 =?utf-8?B?c0JUNkwxVng3SVFEUjF2QkJob3NBM1ZUdFB2YVRJTm1Uemg5VXNpczBhVFlE?=
 =?utf-8?B?NkRyczFKOEozU1hoZHE3RlZMeVF3ZG83OWpOUmEybmVyTUVYamt2bk5UZHZK?=
 =?utf-8?B?UG1UekgyZVA1QU9pSWkyL2tuVm9PT0RtQVBTdWh6dXVUZElBbmhSWlhiWmpM?=
 =?utf-8?B?R1lDeWdtQ2lCdWFVVHFRQTdTZEJwV1Q0TVZYdVZGOHljaHN1Y0RoM3RJQXRx?=
 =?utf-8?B?SmFNYUw2eWJkSkFkRzJoVC82azBDNitSYVFIYTMvTS9iOU1iZUVDdTdPd2lI?=
 =?utf-8?Q?0KkDtT5JD3q+nUe8=3D?=
Content-ID: <AC7BDBF163A25B449F725FFB9509D089@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3e3bd1-4272-40f4-14f1-08de6003f572
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 13:32:05.2024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kGiP6PWr/yGu0vweEGtOHhRawOdoby4fEiP/EpefqSUx/Gww3DIXCaoKqx0KSHlTCox56D1x4ntgEbjVCI87o8jQyA0in+y7rptBkRUsz3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8155
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_998540381.1801951709"
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

--__=_Part_Boundary_003_998540381.1801951709
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI2LTAxLTI5IGF0IDEzOjE1ICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFdlZCwgSmFuIDI4LCAyMDI2IGF0IDA0OjI0OjQyUE0gKzA4MDAsIEphc29uLUpIIExp
biB3cm90ZToNCj4gPiBVc2UgY2xhbXAgdG8gcmVzdHJpY3QgQ1RNIG1hdHJpeCB2YWx1ZXMgdG8g
dGhlIC0yLjAgdG8gMi4wIHJhbmdlDQo+ID4gZm9yDQo+ID4gTWVkaWFUZWsgZGV2aWNlcywgZW5z
dXJpbmcgdGVzdHMgZG8gbm90IGV4Y2VlZCBoYXJkd2FyZSBsaW1pdHMuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiA+
IC0tLQ0KPiA+IMKgdGVzdHMva21zX2NvbG9yLmMgfCAxOSArKysrKysrKysrKysrKysrKy0tDQo+
ID4gwqAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4g
PiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2NvbG9yLmMgYi90ZXN0cy9rbXNfY29sb3Iu
Yw0KPiA+IGluZGV4IGIyY2E2OTc1ZDZhNS4uYzZjZDM1ZDc0YTJmIDEwMDY0NA0KPiA+IC0tLSBh
L3Rlc3RzL2ttc19jb2xvci5jDQo+ID4gKysrIGIvdGVzdHMva21zX2NvbG9yLmMNCj4gPiBAQCAt
NzYsNiArNzYsOCBAQA0KPiA+IMKgICogQGdhbW1hLWx1dDrCoMKgwqDCoMKgwqDCoMKgwqAgR2Ft
bWEgTFVUDQo+ID4gwqAgKi8NCj4gPiDCoA0KPiA+ICsjZGVmaW5lIENUTV9TSVpFCQkoOSkNCj4g
PiArDQo+ID4gwqBJR1RfVEVTVF9ERVNDUklQVElPTigiVGVzdCBDb2xvciBGZWF0dXJlcyBhdCBQ
aXBlIGxldmVsIik7DQo+ID4gwqANCj4gPiDCoHN0YXRpYyBib29sIHRlc3RfcGlwZV9kZWdhbW1h
KGRhdGFfdCAqZGF0YSwNCj4gPiBAQCAtMTAyNSw3ICsxMDI3LDcgQEAgcnVuX3Rlc3RzX2Zvcl9w
aXBlKGRhdGFfdCAqZGF0YSkNCj4gPiDCoAkJY29uc3QgY2hhciAqbmFtZTsNCj4gPiDCoAkJaW50
IGl0ZXI7DQo+ID4gwqAJCWNvbnN0IGNvbG9yX3QgKmZiX2NvbG9yczsNCj4gPiAtCQlkb3VibGUg
Y3RtWzldOw0KPiA+ICsJCWRvdWJsZSBjdG1bQ1RNX1NJWkVdOw0KPiA+IMKgCQljb25zdCBjaGFy
ICpkZXNjOw0KPiA+IMKgCX0gY3RtX3Rlc3RzW10gPSB7DQo+ID4gwqAJCXsgLm5hbWUgPSAiY3Rt
LXJlZC10by1ibHVlIiwNCj4gPiBAQCAtMTEyOCw2ICsxMTMwLDE5IEBAIHJ1bl90ZXN0c19mb3Jf
cGlwZShkYXRhX3QgKmRhdGEpDQo+ID4gwqAJfQ0KPiA+IMKgDQo+ID4gwqAJZm9yIChpID0gMDsg
aSA8IEFSUkFZX1NJWkUoY3RtX3Rlc3RzKTsgaSsrKSB7DQo+ID4gKwkJZG91YmxlIGZpeGVkX2N0
bVtDVE1fU0laRV07DQo+ID4gKwkJY29uc3QgZG91YmxlICpjdG1fcHRyID0gY3RtX3Rlc3RzW2ld
LmN0bTsNCj4gPiArDQo+ID4gKwkJLyogVGhlIHZhbGlkIHZhbHVlIG9mIE1lZGlhVGVrIGNvbG9y
IG1hdHJpeCByYW5nZQ0KPiA+IGlzIC0yLjAgfiAyLjAgKi8NCj4gPiArCQlpZiAoaXNfbXRrX2Rl
dmljZShkYXRhLT5kcm1fZmQpKSB7DQo+ID4gKwkJCWludCBqOw0KPiA+ICsNCj4gPiArCQkJZm9y
IChqID0gMDsgaiA8IENUTV9TSVpFOyBqKyspDQo+ID4gKwkJCQlmaXhlZF9jdG1bal0gPQ0KPiA+
IGNsYW1wKGN0bV90ZXN0c1tpXS5jdG1bal0sIC0yLjAsIDIuMCk7DQo+ID4gKw0KPiA+ICsJCQlj
dG1fcHRyID0gZml4ZWRfY3RtOw0KPiA+ICsJCX0NCj4gDQo+IFRoZSBrZXJuZWwgaXMgc3VwcG9z
ZWQgdG8gY2xhbXAgdGhpcy4NCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3cyENCg0KVGhlIHJlYXNv
biBJIGFkZGVkIHRoZSBjbGFtcCBpbiBoZXJlIGlzIHRoYXQsIHdpdGhvdXQgaXQsIElHVCB3aWxs
DQpnZW5lcmF0ZSBhIHJlZmVyZW5jZSBmcmFtZWJ1ZmZlciB1c2luZyBDVE09MTAwLjAgb24gdGhl
IENQVSBzaWRlLCB0aGVuDQpzZW5kIENUTTEuMCB0byBrZXJuZWwuDQpJR1Qgd2lsbCBnZW5lcmF0
ZSBhbm90aGVyIGZyYW1lYnVmZmVyIHVzaW5nIENUTT0xLjAsIHRoZW4gc2VuZA0KQ1RNPTEwMC4w
IHRvIHRoZSBrZXJuZWwuDQoNClRoZSBrZXJuZWwgd2lsbCBjbGFtcCB0aGUgQ1RNIGZyb20gMTAw
LjAgdG8gMi4wIGR1ZSB0byBoYXJkd2FyZSBsaW1pdHMsDQpzbyB0aGUgaGFyZHdhcmUgb3V0cHV0
IHdpbGwgbm90IG1hdGNoIHRoZSBDUFUtZ2VuZXJhdGVkIHJlZmVyZW5jZSwNCnJlc3VsdGluZyBp
biBhIENSQyBtaXNtYXRjaCBhbmQgYSB0ZXN0IGZhaWx1cmUuDQoNClRoZXJlZm9yZSwgSSB0aGlu
ayBJIG5lZWQgdG8gY2xhbXAgQ1RNIGZyb20gMTAwLjAgdG8gMi4wIGJlZm9yZSBJR1QNCmdlbmVy
YXRpbmcgYSByZWZlcmVuY2UgZnJhbWVidWZmZXIgb24gQ1BVIHNpZGUuDQoNClJlZ2FyZHMsDQpK
YXNvbi1KSCBMaW4NCg==

--__=_Part_Boundary_003_998540381.1801951709
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjYtMDEtMjkmIzMyO2F0
JiMzMjsxMzoxNSYjMzI7KzAyMDAsJiMzMjtWaWxsZSYjMzI7U3lyaiYjMjI4O2wmIzIyODsmIzMy
O3dyb3RlOg0KJmd0OyYjMzI7T24mIzMyO1dlZCwmIzMyO0phbiYjMzI7MjgsJiMzMjsyMDI2JiMz
MjthdCYjMzI7MDQ6MjQ6NDJQTSYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjt3
cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO1VzZSYjMzI7Y2xhbXAmIzMyO3RvJiMzMjtyZXN0cmlj
dCYjMzI7Q1RNJiMzMjttYXRyaXgmIzMyO3ZhbHVlcyYjMzI7dG8mIzMyO3RoZSYjMzI7LTIuMCYj
MzI7dG8mIzMyOzIuMCYjMzI7cmFuZ2UNCiZndDsmIzMyOyZndDsmIzMyO2Zvcg0KJmd0OyYjMzI7
Jmd0OyYjMzI7TWVkaWFUZWsmIzMyO2RldmljZXMsJiMzMjtlbnN1cmluZyYjMzI7dGVzdHMmIzMy
O2RvJiMzMjtub3QmIzMyO2V4Y2VlZCYjMzI7aGFyZHdhcmUmIzMyO2xpbWl0cy4NCiZndDsmIzMy
OyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0phc29uLUpI
JiMzMjtMaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7
Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDt0ZXN0cy9rbXNfY29sb3IuYyYj
MzI7fCYjMzI7MTkmIzMyOysrKysrKysrKysrKysrKysrLS0NCiZndDsmIzMyOyZndDsmIzMyOyYj
MTYwOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsxNyYjMzI7aW5zZXJ0aW9ucygrKSwmIzMy
OzImIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtkaWZmJiMzMjstLWdpdCYjMzI7YS90ZXN0cy9rbXNfY29sb3IuYyYjMzI7Yi90ZXN0cy9rbXNf
Y29sb3IuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgmIzMyO2IyY2E2OTc1ZDZhNS4uYzZjZDM1
ZDc0YTJmJiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsmIzMyOy0tLSYjMzI7YS90ZXN0cy9rbXNf
Y29sb3IuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7KysrJiMzMjtiL3Rlc3RzL2ttc19jb2xvci5jDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtAQCYjMzI7LTc2LDYmIzMyOys3Niw4JiMzMjtAQA0KJmd0OyYjMzI7
Jmd0OyYjMzI7JiMxNjA7JiMzMjsqJiMzMjtAZ2FtbWEtbHV0OiYjMTYwOyYjMTYwOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7R2FtbWEmIzMyO0xVVA0KJmd0
OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMzMjsqLw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsrI2RlZmluZSYjMzI7Q1RNX1NJWkUoOSkNCiZndDsmIzMyOyZndDsm
IzMyOysNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwO0lHVF9URVNUX0RFU0NSSVBUSU9OKCZxdW90
O1Rlc3QmIzMyO0NvbG9yJiMzMjtGZWF0dXJlcyYjMzI7YXQmIzMyO1BpcGUmIzMyO2xldmVsJnF1
b3Q7KTsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7
c3RhdGljJiMzMjtib29sJiMzMjt0ZXN0X3BpcGVfZGVnYW1tYShkYXRhX3QmIzMyOypkYXRhLA0K
Jmd0OyYjMzI7Jmd0OyYjMzI7QEAmIzMyOy0xMDI1LDcmIzMyOysxMDI3LDcmIzMyO0BAJiMzMjty
dW5fdGVzdHNfZm9yX3BpcGUoZGF0YV90JiMzMjsqZGF0YSkNCiZndDsmIzMyOyZndDsmIzMyOyYj
MTYwO2NvbnN0JiMzMjtjaGFyJiMzMjsqbmFtZTsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwO2lu
dCYjMzI7aXRlcjsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwO2NvbnN0JiMzMjtjb2xvcl90JiMz
MjsqZmJfY29sb3JzOw0KJmd0OyYjMzI7Jmd0OyYjMzI7LWRvdWJsZSYjMzI7Y3RtWzldOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7K2RvdWJsZSYjMzI7Y3RtW0NUTV9TSVpFXTsNCiZndDsmIzMyOyZndDsm
IzMyOyYjMTYwO2NvbnN0JiMzMjtjaGFyJiMzMjsqZGVzYzsNCiZndDsmIzMyOyZndDsmIzMyOyYj
MTYwO30mIzMyO2N0bV90ZXN0c1tdJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2
MDt7JiMzMjsubmFtZSYjMzI7PSYjMzI7JnF1b3Q7Y3RtLXJlZC10by1ibHVlJnF1b3Q7LA0KJmd0
OyYjMzI7Jmd0OyYjMzI7QEAmIzMyOy0xMTI4LDYmIzMyOysxMTMwLDE5JiMzMjtAQCYjMzI7cnVu
X3Rlc3RzX2Zvcl9waXBlKGRhdGFfdCYjMzI7KmRhdGEpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2
MDt9DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwO2Zv
ciYjMzI7KGkmIzMyOz0mIzMyOzA7JiMzMjtpJiMzMjsmbHQ7JiMzMjtBUlJBWV9TSVpFKGN0bV90
ZXN0cyk7JiMzMjtpKyspJiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrZG91YmxlJiMzMjtmaXhl
ZF9jdG1bQ1RNX1NJWkVdOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2NvbnN0JiMzMjtkb3VibGUmIzMy
OypjdG1fcHRyJiMzMjs9JiMzMjtjdG1fdGVzdHNbaV0uY3RtOw0KJmd0OyYjMzI7Jmd0OyYjMzI7
Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7Ky8qJiMzMjtUaGUmIzMyO3ZhbGlkJiMzMjt2YWx1ZSYjMzI7
b2YmIzMyO01lZGlhVGVrJiMzMjtjb2xvciYjMzI7bWF0cml4JiMzMjtyYW5nZQ0KJmd0OyYjMzI7
Jmd0OyYjMzI7aXMmIzMyOy0yLjAmIzMyOyYjMTI2OyYjMzI7Mi4wJiMzMjsqLw0KJmd0OyYjMzI7
Jmd0OyYjMzI7K2lmJiMzMjsoaXNfbXRrX2RldmljZShkYXRhLSZndDtkcm1fZmQpKSYjMzI7ew0K
Jmd0OyYjMzI7Jmd0OyYjMzI7K2ludCYjMzI7ajsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsm
IzMyOyZndDsmIzMyOytmb3ImIzMyOyhqJiMzMjs9JiMzMjswOyYjMzI7aiYjMzI7Jmx0OyYjMzI7
Q1RNX1NJWkU7JiMzMjtqKyspDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrZml4ZWRfY3RtW2pdJiMzMjs9
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtjbGFtcChjdG1fdGVzdHNbaV0uY3RtW2pdLCYjMzI7LTIuMCwm
IzMyOzIuMCk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrY3RtX3B0
ciYjMzI7PSYjMzI7Zml4ZWRfY3RtOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K30NCiZndDsmIzMyOw0K
Jmd0OyYjMzI7VGhlJiMzMjtrZXJuZWwmIzMyO2lzJiMzMjtzdXBwb3NlZCYjMzI7dG8mIzMyO2Ns
YW1wJiMzMjt0aGlzLg0KDQpUaGFua3MmIzMyO2ZvciYjMzI7dGhlJiMzMjtyZXZpZXdzIQ0KDQpU
aGUmIzMyO3JlYXNvbiYjMzI7SSYjMzI7YWRkZWQmIzMyO3RoZSYjMzI7Y2xhbXAmIzMyO2luJiMz
MjtoZXJlJiMzMjtpcyYjMzI7dGhhdCwmIzMyO3dpdGhvdXQmIzMyO2l0LCYjMzI7SUdUJiMzMjt3
aWxsDQpnZW5lcmF0ZSYjMzI7YSYjMzI7cmVmZXJlbmNlJiMzMjtmcmFtZWJ1ZmZlciYjMzI7dXNp
bmcmIzMyO0NUTT0xMDAuMCYjMzI7b24mIzMyO3RoZSYjMzI7Q1BVJiMzMjtzaWRlLCYjMzI7dGhl
bg0Kc2VuZCYjMzI7Q1RNMS4wJiMzMjt0byYjMzI7a2VybmVsLg0KSUdUJiMzMjt3aWxsJiMzMjtn
ZW5lcmF0ZSYjMzI7YW5vdGhlciYjMzI7ZnJhbWVidWZmZXImIzMyO3VzaW5nJiMzMjtDVE09MS4w
LCYjMzI7dGhlbiYjMzI7c2VuZA0KQ1RNPTEwMC4wJiMzMjt0byYjMzI7dGhlJiMzMjtrZXJuZWwu
DQoNClRoZSYjMzI7a2VybmVsJiMzMjt3aWxsJiMzMjtjbGFtcCYjMzI7dGhlJiMzMjtDVE0mIzMy
O2Zyb20mIzMyOzEwMC4wJiMzMjt0byYjMzI7Mi4wJiMzMjtkdWUmIzMyO3RvJiMzMjtoYXJkd2Fy
ZSYjMzI7bGltaXRzLA0Kc28mIzMyO3RoZSYjMzI7aGFyZHdhcmUmIzMyO291dHB1dCYjMzI7d2ls
bCYjMzI7bm90JiMzMjttYXRjaCYjMzI7dGhlJiMzMjtDUFUtZ2VuZXJhdGVkJiMzMjtyZWZlcmVu
Y2UsDQpyZXN1bHRpbmcmIzMyO2luJiMzMjthJiMzMjtDUkMmIzMyO21pc21hdGNoJiMzMjthbmQm
IzMyO2EmIzMyO3Rlc3QmIzMyO2ZhaWx1cmUuDQoNClRoZXJlZm9yZSwmIzMyO0kmIzMyO3RoaW5r
JiMzMjtJJiMzMjtuZWVkJiMzMjt0byYjMzI7Y2xhbXAmIzMyO0NUTSYjMzI7ZnJvbSYjMzI7MTAw
LjAmIzMyO3RvJiMzMjsyLjAmIzMyO2JlZm9yZSYjMzI7SUdUDQpnZW5lcmF0aW5nJiMzMjthJiMz
MjtyZWZlcmVuY2UmIzMyO2ZyYW1lYnVmZmVyJiMzMjtvbiYjMzI7Q1BVJiMzMjtzaWRlLg0KDQpS
ZWdhcmRzLA0KSmFzb24tSkgmIzMyO0xpbg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwh
LS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRl
bnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29u
dGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50
cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVy
d2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlz
IGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGll
bnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywg
cmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRh
Y2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRl
ZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lw
aWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQg
dGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0
ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3Bp
ZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3Vy
IHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwg
dG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_003_998540381.1801951709--

