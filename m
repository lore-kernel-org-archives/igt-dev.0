Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55DFCD4F54
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 03:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D99510E064;
	Thu, 21 May 2026 03:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="SWJHHUmG";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rEG08HU5";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C98510F1BA
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 03:04:37 +0000 (UTC)
X-UUID: cafb4dba54c111f1a3561939bc42ff46-20260521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=5kbv2MnoFUAd/bd5y6wtwC1owpSP0FHcdfhFQXqX648=; 
 b=SWJHHUmGZNF6u0lpTAzxhP9/4X9W9TkMr0GKXlvQjbhjwrhRl/7fWc7QC9HAvrsyICL/okxZN0qRc8BfIOzkxv4+Bp2YOQnsJuW1fP2oB5RmbEYUN9kQGlUGpdxacHTH+ZWaHngRP42XxRh0KjAejF/zyLwJOcrcykhXmcLZMTs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:68955fae-52b2-417e-958c-45204fbaf03a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:9091e75, CLOUDID:9b8b101f-023f-4f87-9e9c-6c116c694fb3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cafb4dba54c111f1a3561939bc42ff46-20260521
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1351099941; Thu, 21 May 2026 11:04:33 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 21 May 2026 11:04:32 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 21 May 2026 11:04:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFpx6bD0vSdIj/7efT8DfDqWltOz7HVuLDBVXpSCqd15BGi2NOMnXgg735oP/Cubv5nyFrxEf3LKNSIVFFuf21hGegg7Bq/FRUDn62pYltSBE87XVFkhmi4C6DIVGC2wacfrBv6a7eV+nzoou1nsDFoEfN5/t8nx6PySJjtu/5cSakc4cu9rmFnfL5ZEOdH1Oe4arNLF0F5UeiV2q3DtXC60CAK1KyYRqhPElhQzAaTuNYxUG/unhcNMwLGFB2yFxA8meC1DkZt+7Qg5B7c+4UUKq1oaQd+coDvDxJzIcnbt9gfpkAEGsG24eZhqDZQ4brmGVRtudT8w2jW+XfaojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kbv2MnoFUAd/bd5y6wtwC1owpSP0FHcdfhFQXqX648=;
 b=AgDeM1ew2N2bT4QWLGq+1Hh7sO6OnnBAPUC1oWuHIu0m4qxarBHDFCfLyMJ9Q6t/f1H75kaMlGxsjczBwUi3MNvjMZUjrwq3sxUaB6300zSccw5yvw10ABx+min9BS0Dq7Xd0nc9wlMhciYpsEG/UZCAkjl/TskNJzaXsvPb7v7VJTPGwM76lyDGDrh/ZTye/fX9HmlldoARxQ1FuspM2qFmbxYbh2NBPgZqvV/7dxXwir/L6mTyROCPxJStuQOA3IgQQGkAC6z+rxOg3snSKRXa1AsIcD5Rdvmrsh4aFHE5EK+m4jtYNgET+Hg3Ok7pJSCl3F8ZpjLaj/oKW6l7Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kbv2MnoFUAd/bd5y6wtwC1owpSP0FHcdfhFQXqX648=;
 b=rEG08HU5nuYXHv1lPg5ymXQ6vqGDcgaHc+cVO0HJpNH3VOXpXZMk7FtAJpHDGqN7RJJx9n7vGoVhdLMooyQUE/TrHkvoN1brN19llYA4Vqk2WuAfQpg4q9i0xn50H6VDh06bO+R02P7PpMNdKngMPuvdvq/p4Nou9g94Pys1eiU=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYUPR03MB7178.apcprd03.prod.outlook.com (2603:1096:400:344::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Thu, 21 May
 2026 03:04:24 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0071.005; Thu, 21 May 2026
 03:04:24 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>, "fshao@chromium.org"
 <fshao@chromium.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: Add igt_disable_cpu_deep_sleep()
 to control CPU C-states
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_kms: Add igt_disable_cpu_deep_sleep()
 to control CPU C-states
Thread-Index: AQHc6CSFeY/lRZNLyU6LJ8RFMCqvkLYWq1+AgAAH/oCAAG8sgIAAqjsA
Date: Thu, 21 May 2026 03:04:24 +0000
Message-ID: <82b37b4876f23563f8bfc866d25d111dfb79beac.camel@mediatek.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-2-jason-jh.lin@mediatek.com>
 <20260520094837.g3d333dbkd5wntqc@kamilkon-DESK.igk.intel.com>
 <4e16a5e72e2201d71586851a9496a90ff8dbcd39.camel@mediatek.com>
 <20260520165507.loxmzhej3rvrg7p7@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260520165507.loxmzhej3rvrg7p7@kamilkon-DESK.igk.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYUPR03MB7178:EE_
x-ms-office365-filtering-correlation-id: 0c0a628e-a38d-4c0a-4256-08deb6e5a9d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020|38070700021|4143699003|11063799006|3023799007|22082099003|18002099003|56012099003|6133799003;
x-microsoft-antispam-message-info: CGnullBdLSlLbpjQJIOC6lHtRIX0Ou4HEdubR0fET4HxVxS9cFuxSJDlqJJ6dwjxLfpt2QiIrDjg0bKyiiV91TKtdLP4FIRlDeylSZjiqKqRg7uPdSbXCjHOH0I9pTODAo5Mr5ijr1PRlpvxBsvLVFmgukhmiJ7WMeK0eM3rfNXC8dPJa+bBqUSxGVP0WsWG0ayWNjFzfCsmPQ7yBPt845YUKmkMyPNyye34/pRQtp2jJ+vdy5zHiFz8n7zK1iBUoCND8MjxPEzuevIdT7Crn3DpcKCxl9yHDPjd//lp4CFzuNxnYr90qEIdxXn3C95H0pe7W7VLKzjMPxQTJDd9n8lNaBXgk1vtvJYA3kJ7C91sMbXj7hs4W/g6yD0B3sR7AXTVuyk5pJLNSV7i0t4n9aKrqCUFJFfWE9YXS+pUDYI2mzrTEi4vT2gh7fRlQcXZ5BDfqPppiYMAkJCo3JBR3BK7UT4iA+/34s8Q5UpCNbr2o8MRGoe2s5lJfu6wqFC60NXnP+rB+mDbwOKNe8b7iB7pCjMjshm85DrWTOGl0QNY/GMiuurbDImgwjuUbrNG+vCt93WSw3AAJvm8DcS2kxWNq/yew+PgfDyhT2NbGVeYk5kRt24jrZ55bwqDJPBLl/n9ZCKYLGlDtHIrmOTjY8Kv1RBQKHEUgzRFXgSRdrbg2YYxei5c2JxiyjLqHcG/oZ0dSgpo4vCuVFo9VN7GurPNKTS0ZgI2GvCQJkKY6QVhDNyb5QTs0GJ68uK/9J43lQ0z99UQunPNraW5bS/rqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700021)(4143699003)(11063799006)(3023799007)(22082099003)(18002099003)(56012099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVI0Ly9tWU9DRUFlNXFlU0daSWhmT04wOEVPamd1NjYveVFXZXhBd3hUNTJJ?=
 =?utf-8?B?bnpFZUowckF3cHlPRTVCeDhXbEJCOEMwTnF0MnlzZU1zOCtVK2g5d1BRZ3Bt?=
 =?utf-8?B?a09oTHlTZlIzbU5mU0M5UkZCN3paUVYrZ2ZzUkJpYXlZUi8wRVhVaGNHMGFJ?=
 =?utf-8?B?eWVBUDUxdXdkV2FZSW1ZaGc2SDdQdUdvRHdSVlViajRHeHZUa0ZtRUZEUktM?=
 =?utf-8?B?Nm96RnRCVUtqRkFvRnNVNmVNaUVmQndSc2ZIWXN6T3lRbXF2bVcyU05VOVlR?=
 =?utf-8?B?WTVwWmJPQlJlcUtLWFR3bzc0aG5qZlA0V2g3ZVA3RzZ2OU5aWjJkU2FnaSsr?=
 =?utf-8?B?empGNDFmQzBiYXkwNkRaR1FDeExNTDU5UXZvT1NWcjdCL1RVcWUxaHdjYndo?=
 =?utf-8?B?azRHTGJNNVFKRXRWRGg2bk9FWUI5SEt4OHg4eEJINkx3MS9vVlhGMS9ieEJF?=
 =?utf-8?B?eUR2TVNNRFBPK2o2Y2xOTnpsZlBXbmNzRURVM2dkVjNzd3N4UUQvaUJFRzBx?=
 =?utf-8?B?SG5YWHJRNVRrSVY0UGNFWFVKZlpnNjhhNlgvaVc2cEFrVGZ0ajkzMVNPSXpM?=
 =?utf-8?B?V1RYeW9XSTVLamVFTFN5WkJRc1UvZDNMMDV0d0RrZUpIL3NPejJuNWhTRWJw?=
 =?utf-8?B?bDVkQ25WNGtSVjd3RWR5VWM1MThvWVdqZkpVR0o2Q21zeHJrOTNGamZabmtt?=
 =?utf-8?B?MHJSSnh2emJyZ3FmT3lrQ1dpYXdjNkNvZ1hqTHlrOXF1V0s5WXphK1hnS1N4?=
 =?utf-8?B?SnhSRGU3SS9wam5kL2wwbVQ3eWlOTkJDOE5xUHpBRVpyR0RYdHAwdCtWZVY3?=
 =?utf-8?B?bmxCT05QR1I2OUlzRGtiNTlmWVZNNU8vQklGRGNpdGNUb2hSMk5JZDh0RmtL?=
 =?utf-8?B?MTJLOFBzR0lpbElRYWUraGNIZFJRN0l4QjNsNmhoL3pPRWJvSHIySUk0ZlM0?=
 =?utf-8?B?SzRUWXMzYW9xSHJWb2xhT1ZaN2h0Vi9nU2kvemU3UVZxS21UOSttMjVWRUNo?=
 =?utf-8?B?R2NKS2Q4QUViKzk1SE5FR0h1WlE5NVJidFpldUFlQTJIQitWS212TXRnVFE5?=
 =?utf-8?B?ZjR4SmNMYllzSHNvK25WOUhMY1Zna0VET2kvM3BzN0VWR0JMcUtkbUQ4YlAy?=
 =?utf-8?B?SjdEOXcvZHJ6MDN2MTl6SlNLcDBKcUNYTzJZTlZHYU9ENE10ejI2ZmdKZ1Ex?=
 =?utf-8?B?VDRIY1orNERhaldXSVhFMXNmL3lzTXBVTVEzdVI5WXgyK1YwaWp0eU9MVXI5?=
 =?utf-8?B?T2dZVXBaeFZPYTFpSkppVDM3TEtBOE1KVlE3Y0hCNmtEbjVmcVhZa1RNcVYx?=
 =?utf-8?B?OGVIQVhRQ25NbXpTd0pUNVo5TFJTa0kydk9UcEFYaGROREJhRkZtMWJWLysw?=
 =?utf-8?B?TEdGbXFDRDRhc2dYWlZRTWlDZjhVQ2tPQ0RHOFNxYjBiaGZaNXQ5MGlMQktu?=
 =?utf-8?B?ZzNtSGk4YS9zN2pWTi84SjhuVVU1SWR0MDZFY2RCUmpLWjVJUnI5ZHJaKzla?=
 =?utf-8?B?STIwUmdNUXNOVFd1NjJWVEpJY0k1cHBuTWQ4cU1FYnU1ZysvVFVKYlJFeTZW?=
 =?utf-8?B?ZUNaUE5GMEV0QXNWUnY2MHVPZDAyOFhaUVI5RkhiUG4rNU5wYkdiMGpaVWtF?=
 =?utf-8?B?SkMxVnhBQThlc2hNRUFtN1I2YVNrYlp3bUVjdm5wUnVEaG0yRlJsaGFIMUl0?=
 =?utf-8?B?aWd2Q1dQZTVMYVpQSlVBVUtLak5QQWdjK250ZWNDUHl2WjdRem9rMVFKMVdi?=
 =?utf-8?B?R0N0NG1leFZLR1ZKTHY5UEgrNSsyTDdQWmYzRzJNOGlORFJpUlBpZHhGb0Zv?=
 =?utf-8?B?eXh5alFyY2VRaE4zbGpxSUFuQUJuNEptczhzMFd1Q2VTZXllNEg4TzUzR1kx?=
 =?utf-8?B?dXFkaUt4L0VDMlRla2xBYndQVkVMd0R1blZYbktkZ054ZGFuTU9MNGdidWE5?=
 =?utf-8?B?bTFZUy9kRjlCQXBjMHA4bFo1azM1WHlNdVBFdGhWRmFvMVlLamJOdkQ1dndj?=
 =?utf-8?B?VUtIek5uSGdRTGtTcVl0em5TWHFYNnJWdG5CeEg2TlUvd0c0OTVGb1V3VXBW?=
 =?utf-8?B?SzhoN3VsOWJSM0Q1aGZPRnpFRXRYY3NpY3htQnpZWmh1SDFIS0JKUFRudkxJ?=
 =?utf-8?B?cHBZdnRnSHV4ZWZpck5GQ3hCeVFBdlVXZFQvNFJhVDF4NURVVzVrWkNSUktQ?=
 =?utf-8?B?VCtscUFPYk9sbEhWWldyQkVXNE1nbXgwc3RCNEhiWmV3RDZTSCtpa1k2MzZy?=
 =?utf-8?B?T09HL2lwL1l5WEtpZlZYZVpJQ0dvTnprMit4aTc3NzRLUlhvMjQ4eVhmZlMz?=
 =?utf-8?B?d1U0UFZ1REVRU21KRkk2a2ZzenRDOFFhSWtYLzJqMzFIYnRsWUNKamhPRGZ0?=
 =?utf-8?Q?XAvLKv337F/lXCYk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <55E5C4F62DFCD54AB79F159036577113@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TXd2r5Wsvrd1O4RuvkYY3lU9Vot3tJ1YLpjPwdOS4REA8wjrur0NV5pD/tsb3DJUVbDDQJpf7+bsseOf2i2dTmoZMA9mNgv9wygEUftk27knPkA7+C1m9N0jmp4BB25quuvW1u0TWo6Cq9L8Zv+K0i/AHtZJcS79A2KtJDKhiDd+Hat3XenZ/bNbqS/bELdM+MRvVxvryP1ATo4eK9x/7tbdQasQ69lfQQHL6jp2Th4JQ85dVa5Idn/Of8BEOTCdWtVKjjJvREKyRZlp4BWFV2aac7bAg9EzjydwMY3kcFg16cb2ErgvDoj4UOrrgRaavPasZNwukeOUUKYwtwmz/A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0a628e-a38d-4c0a-4256-08deb6e5a9d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 03:04:24.5932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kGv9Bkyd+wAsi6FV4UAphLdmMXKENmLT3UNMdvnRg0nq+ILhSUqqk7684Dlairyc5qN2fj/aUzD1kzWtUGAuBNPoDUJpk+++CrR9U+JsOgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7178
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

T24gV2VkLCAyMDI2LTA1LTIwIGF0IDE4OjU1ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIEphc29uLUpILA0KPiBPbiAyMDI2LTA1LTIwIGF0IDEwOjE3OjEzICswMDAwLCBKYXNv
bi1KSCBMaW4gKOael+edv+elpSkgd3JvdGU6DQo+ID4gW3NuaXBdDQo+ID4gDQo+ID4gPiA+IC0t
LSBhL2xpYi9pZ3Rfa21zLmMNCj4gPiA+ID4gKysrIGIvbGliL2lndF9rbXMuYw0KPiA+ID4gPiBA
QCAtNjc3Niw2ICs2Nzc2LDcyIEBAIGJvb2wNCj4gPiA+ID4gaWd0X2NoZWNrX291dHB1dF9icGNf
ZXF1YWwoaWd0X2NydGNfdA0KPiA+ID4gPiAqY3J0YywgaWd0X291dHB1dF90ICpvdXRwdXQsDQo+
ID4gPiA+IMKgCXJldHVybiAoY3VycmVudCA9PSBicGMpOw0KPiA+ID4gPiDCoH0NCj4gPiA+ID4g
wqANCj4gPiA+ID4gKy8qKg0KPiA+ID4gPiArICogaWd0X2Rpc2FibGVfY3B1X2RlZXBfc2xlZXA6
DQo+ID4gPiA+ICsgKiBAZmQ6IERSTSBkZXZpY2UgZmlsZSBkZXNjcmlwdG9yDQo+ID4gPiA+ICsg
KiBAZGlzYWJsZTogdHJ1ZSB0byBkaXNhYmxlIGRlZXAgc2xlZXAgc3RhdGVzLCBmYWxzZSB0bw0K
PiA+ID4gPiByZXN0b3JlDQo+ID4gPiA+IHRoZW0NCj4gPiA+ID4gKyAqDQo+ID4gPiA+ICsgKiBD
b250cm9scyBkZWVwIENQVSBpZGxlIHN0YXRlcyAoQy1zdGF0ZXMpIHRvIHByZXZlbnQgSVJRDQo+
ID4gPiA+IGxhdGVuY3kNCj4gPiA+ID4gc3Bpa2VzDQo+ID4gPiA+ICsgKiBkdXJpbmcgdmJsYW5r
IGV2ZW50cy4gVGhpcyBpcyBhIHN5c3RlbS13aWRlIG9wZXJhdGlvbiB0aGF0DQo+ID4gPiA+IGFm
ZmVjdHMgYWxsIENQVXMuDQo+ID4gPiA+ICsgKg0KPiA+ID4gPiArICogVGhpcyBpcyBhIGdlbmVy
YWwgQVBJIHRoYXQgdmVuZG9ycyBjYW4gZXh0ZW5kLiBDdXJyZW50bHk6DQo+ID4gPiA+ICsgKiAt
IE1lZGlhVGVrOiBEaXNhYmxlcy9lbmFibGVzIHN0YXRlMSBhbmQgZGVlcGVyIHN0YXRlcyBvbg0K
PiA+ID4gPiBhbGwNCj4gPiA+ID4gQ1BVcw0KPiA+ID4gPiArICoNCj4gPiA+ID4gKyAqIFdoZW4g
QGRpc2FibGUgaXMgdHJ1ZSwgZGlzYWJsZXMgZGVlcCBzbGVlcCB0byBlbnN1cmUgc3RhYmxlDQo+
ID4gPiA+IHZibGFuayB0aW1pbmcuDQo+ID4gPiA+ICsgKiBXaGVuIEBkaXNhYmxlIGlzIGZhbHNl
LCByZXN0b3JlcyBwb3dlci1zYXZpbmcgaWRsZSBzdGF0ZXMuDQo+ID4gPiA+ICsgKg0KPiA+ID4g
PiArICogUmV0dXJuczogdHJ1ZSBvbiBzdWNjZXNzLCBmYWxzZSBvbiBmYWlsdXJlDQo+ID4gPiA+
ICsgKi8NCj4gPiA+ID4gK2Jvb2wgaWd0X2Rpc2FibGVfY3B1X2RlZXBfc2xlZXAoaW50IGZkLCBi
b29sIGRpc2FibGUpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsJY2hhciBjcHVfcGF0aFsyNTZdOw0K
PiA+ID4gPiArCWNoYXIgc3RhdGVfcGF0aFs1MTJdOw0KPiA+ID4gPiArCWludCBjcHUsIHN0YXRl
Ow0KPiA+ID4gPiArCWludCBjb3VudCA9IDA7DQo+ID4gPiA+ICsJRklMRSAqZnA7DQo+ID4gPiA+
ICsJY29uc3QgY2hhciAqdmFsdWUgPSBkaXNhYmxlID8gIjEiIDogIjAiOw0KPiA+ID4gPiArCWNv
bnN0IGNoYXIgKmFjdGlvbiA9IGRpc2FibGUgPyAiRGlzYWJsZWQiIDoNCj4gPiA+ID4gIlJlc3Rv
cmVkIjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCS8qIE9ubHkgTWVkaWFUZWsgbmVlZHMgdGhpcyBj
dXJyZW50bHkgLSBvdGhlciB2ZW5kb3JzDQo+ID4gPiA+IGNhbg0KPiA+ID4gPiBleHRlbmQgaGVy
ZSAqLw0KPiA+ID4gPiArCWlmICghaXNfbXRrX2RldmljZShmZCkpDQo+ID4gPiA+ICsJCXJldHVy
biBmYWxzZTsNCj4gPiA+IA0KPiA+ID4gRG8gbm90IGRvIHRoaXMsIG1ha2UgaXQgYSBnZW5lcmFs
IGZ1bmN0aW9uIGZvciBldmVyeSB1c2VyLg0KPiA+ID4gQWxzbywgaW1obyB0aGlzIHNob3VsZCBi
ZSBpbiBhbm90aGVyIGxpYiwgbm90IGluIGlndF9rbXMuDQo+ID4gPiANCj4gPiANCj4gPiBIaSBL
YW1pbCwNCj4gPiANCj4gPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gPiANCj4gPiBGb3Ig
dGhlIGxpYiBwbGFjZW1lbnQsIHdvdWxkIGl0IGJlIGFwcHJvcHJpYXRlIHRvIG1vdmUgdGhpcyBp
bnRvDQo+ID4gbGliL2lndF9wbS5jPw0KPiANCj4gTG9va3MgYmV0dGVyLg0KPiANCj4gUmVnYXJk
cywNCj4gS2FtaWwNCj4gDQoNCkdvdCBpdCEgSSdsbCBtb3ZlIGl0IHRvIGxpYi9pZ3RfcG0uYyBh
bmQgc2VuZCB0aGUgbmV4dCB2ZXJzaW9uLg0KDQpUaGFua3MsDQpKYXNvbi1KSCBMaW4NCg0KPiA+
IA0KPiA+IEkgbm90aWNlZCB0aGF0IHRoZSBleGlzdGluZyBBUElzIGluIGlndF9wbSBkb24ndCB0
YWtlIGZkIGFzIGENCj4gPiBwYXJhbWV0ZXLCoGZvciBkZXZpY2UgaWRlbnRpZmljYXRpb24uIEZv
ciBjb25zaXN0ZW5jeSwgaWYgd2UgYWdyZWUNCj4gPiBvbg0KPiA+IG1vdmluZyB0byBpZ3RfcG0s
IEknbGwgYWxzbyBtb3ZlIHRoZSBpc19tdGtfZGV2aWNlKCkgY2hlY2sgdG8gdGhlDQo+ID4gY2Fs
bA0KPiA+IHNpdGUgYW5kIHJlbW92ZSBmZCBjaGVjayBmcm9tIHRoZSBmdW5jdGlvbi4NCj4gPiAN
Cj4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gSmFzb24tSkggTGluDQo+ID4gDQo+ID4gPiBSZWdhcmRz
LA0KPiA+ID4gS2FtaWwNCj4gPiANCg0K
