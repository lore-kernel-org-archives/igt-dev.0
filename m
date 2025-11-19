Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7E6CF2570
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 05:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACD710E578;
	Wed, 19 Nov 2025 05:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Sx+pfZid";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="wA8v2J/l";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FF210E578
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 05:41:03 +0000 (UTC)
X-UUID: 5238bab2c50a11f0b33aeb1e7f16c2b6-20251119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=4K4AzMXcHPFA64Z5wvuytB8w1A171cMoa1wI6iZkszs=; 
 b=Sx+pfZid73rc4KTWyKuOO6Y0h04Oa4Z93KuuK5NlXjKOyaYPaLbVfYeLJLBX2tn6fP+ZN1zjIU1mYQqxnXEnbvw+MuoDNm6BjtcERf9iRlwCUzn9k3ICZpU8rr+apdtKRiD1c2NwkpBAYiaMRI9Gj2v8tBC1+oI6sn/yIjE6gaI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:1de98422-8431-4d35-aaba-b7e12710f800, IP:0,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-5
X-CID-META: VersionHash:a9d874c, CLOUDID:d9960e58-17e4-43d2-bf73-55337eed999a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5238bab2c50a11f0b33aeb1e7f16c2b6-20251119
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2099024859; Wed, 19 Nov 2025 13:40:56 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 19 Nov 2025 13:40:55 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 19 Nov 2025 13:40:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LN6OEt+TD19CFJ3YXRe8jBBr1/kXZkG4xouE2wTnrEAymImoMxi+Cjauh7hoKwFsWm/D5XZtQUioXOEspPUQjdEhKQ9BWlv7AaeoAw8BLbtnvjV09WpyrP/aPuHYuxJJroEyitDIVftUh0nvjQE7UhLzPFM4mbm50uWzlbfPF5s6hpX8CiwOXSt1Im/PIxkhjea0qxhP7Sy4MFkTgSS2R1A2Spjv9wzjWOya3okbyaDJNvyUqcshMn/ioWU97YRJc1optO97zW2v8ESbscloBR1xxtSB/N+wX1Y/FHS0O28igp9tH6iAqG5/rRrnGMVxs/R07fF4BmBOR+BaZfaoTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6b7jpQtWwwGy40v8bgvypKUvo1l31KkRC9FQYp/ucg=;
 b=XnMSBKRdr4ayIezEEQ86VPQS25uj5USeE/FrrI9aXEYcFabJAhXoa44hcOLEEnG/dHcSLJNB3/co1cn9GlS8goX863SkuXE9HB0In0D/pqs4xRmISZ5mhVv6VwV3RepaRxKS3jXH1tw+ak3cXwV3oQ7x8/XwKYBM4YP8d9vAeG05D620QCFIU/SwqJ5T2+xYFxMBmFIf98f7VXx2Kc3eJoLCEj8Yas28szsOF3Pc7qnW3CyrJOg6z7Opp2bdYAVrjXHjeaO4BJ3v/o+on5J03Ldq8670V8Aqcgw06ynPlAd6P2kb9cGnhlzzjAYoeFVjjK6vVJMM/qt5MVrGJcth3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6b7jpQtWwwGy40v8bgvypKUvo1l31KkRC9FQYp/ucg=;
 b=wA8v2J/l6QtUJwCzvHOqu3C4hyg4LbhytGK4HchsLnFf1ykYX+TfDMlvNPuLkmZbuS7AY0hACXS7CKX33XuY4jZk3n6Myu3C2jabJUFUArRUp1/ZUJE6cyXS31akiW2v1mdZ97bW/0ndXKG4eqr7Y2Ow1HrWI09jQ4zUu6ponQ8=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KU2PPFAB9D6435A.apcprd03.prod.outlook.com (2603:1096:d18::41e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 05:40:53 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 05:40:53 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "uma.shankar@intel.com"
 <uma.shankar@intel.com>, "bhanuprakash.modem@gmail.com"
 <bhanuprakash.modem@gmail.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "chaitanya.kumar.borah@intel.com"
 <chaitanya.kumar.borah@intel.com>, "fshao@chromium.org" <fshao@chromium.org>
CC: "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t] test/kms_color: Select atomic commit if display is
 configured atomic
Thread-Topic: [PATCH i-g-t] test/kms_color: Select atomic commit if display is
 configured atomic
Thread-Index: AQHcVLPWl6rXj6Y01kOinf9KOUqSfbT2efiAgAMKwgA=
Date: Wed, 19 Nov 2025 05:40:52 +0000
Message-ID: <bec4d69eef79a06f4b4b7beba153d28084cb27fe.camel@mediatek.com>
References: <20251113153851.2428277-1-jason-jh.lin@mediatek.com>
 <a5dab740-690f-4cb6-ad5f-d6f916716ab2@intel.com>
In-Reply-To: <a5dab740-690f-4cb6-ad5f-d6f916716ab2@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KU2PPFAB9D6435A:EE_
x-ms-office365-filtering-correlation-id: f0047605-6b93-4979-1502-08de272e3421
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?LzZnTkU0QkxSaGFmK2d6cnVFaFJPSFFBZ0JRNklOQm1oOFBjRkY1WU9yWGhB?=
 =?utf-8?B?SG0rNnVRNGljL2RPcXl4NnJWRHg1SmJoclJHc2xCN3dQeWJPVzBNVWZRUjdK?=
 =?utf-8?B?SlJEbi9DQmdMcmFVaEc4OHNaQWQ3K0xiZHJtMmc4YkJaeG05SEtIOE9UbVdI?=
 =?utf-8?B?akNIajhJRkM0a3h6M3NvYnB3cmtZNko5eUtVbFNnZFhnTEFISTlDbjZndVVo?=
 =?utf-8?B?V1pRYW9kMlcwMWxyMWtTSW9LWTZIbGJVdVd4b01EY0RWelp3WCsyUHlOdVRq?=
 =?utf-8?B?UlRKNGo0QWtQSm02RUtOSkF6KzFDWHFSd1lEVk5Mbm9XNGVBOXlJMDBsZmI3?=
 =?utf-8?B?V2RaZ09RUC8wQ01oQ2NrUy9SZVVrcFpuZVNORWRtVHJYdTZFUk9ma1d5WmJh?=
 =?utf-8?B?SlBMWFgySmx1VEhHV1RKU0xaeEh1MVk3NUYzUWlCelNqWUdtRlZlQmlOZFNt?=
 =?utf-8?B?bndXTGphb05vYnlVWEVIazA5Z3czTVNJRG1vZGV1blJNNmVodE5UMVhoOGFP?=
 =?utf-8?B?cTJNRzJ6azRHMExyYVMyeDlqcUp6SXdidHU5bjF1S2lUZUw5SW9lQzRoNkNv?=
 =?utf-8?B?QnUvakptWUMzdFk5dVl4L291YTNNQ1d4NDJ3NjhPQm1FWkh1V0Z5STZuamJK?=
 =?utf-8?B?RFFRWlFQZjVjUzNGMG9Ba0VVbENIWWFmR1VoL0FrUUFzTVlxUlZ5TUlRTXp3?=
 =?utf-8?B?bFdEQkRwTlJhZHN3VkwydDBUN2hiUmc1NXQ3QmZSandSZklCNk1TUkpvSHgz?=
 =?utf-8?B?NEgwVGtzeElOZE1ybFJ5TTk0NGtvamdLUUltZXVBWmlXaUsrcEFwMFBMNGVR?=
 =?utf-8?B?TjArTHl4a2NQSjNuRTlGU1RqQkpUNnpwUmExbEp4Snp5SmljWDY0bFBOYmpw?=
 =?utf-8?B?WGxvTnNwR2w5cTRsbVBvbUNvc2xyOHFJWDdQM1Q4Y3dvbjJQU1F5eXZSdG4r?=
 =?utf-8?B?RVoxaDhrcG9CV3JSMmJPYVJqZkNTTFlFL0prVGpKOVE5Y09GOEd2K3hrVWps?=
 =?utf-8?B?Um9QR0JMRDNPMHJYS3NwNUNSaFIwNTI5b280K2lpc04vUWpGOEtkRzZselNC?=
 =?utf-8?B?N01Rc25lRzZWYVM1M3NmTnVwWGYwUWlpcUxUTGVsLzIxT2ZIRmpIQzF6emln?=
 =?utf-8?B?SjkwYlpjbmgwNDZkMFpwQUxoM1dlM2hjV0lwb0EwaDUySFZjQnNYZTBTcTRk?=
 =?utf-8?B?RWU1TWJBMm1MbWxqTzVOdkhUM2ZqZ0tnTzVDdFhndlhwZHlmbGJwTkkxMGYx?=
 =?utf-8?B?aTlKa2xvbDF2NjNBS2lOTEZKTjFOcDJVVU9udGVqbFJxSm82a3VjaWJ2QnpQ?=
 =?utf-8?B?Mkk0Wnd6Qi9JaXNGb3VZYzN5d2poVUJuc2dFd21ZYWV0Y1JvcHc1Ujlvdlh5?=
 =?utf-8?B?QVRIcGlXb1JsQVluS0VSWXpKSUtPbzZ4WUp0YmpqZE9HYmRXd3ErZFJPbTVT?=
 =?utf-8?B?V0lXYlc0YnpPSllSZGIxbmNQU3daWlFhOVY3cUI5OS90QVpuWHRWSjR5NHVO?=
 =?utf-8?B?aWVpSWt1TXZ1UlNPb2FqU2NBcTRXYnVJanpvbmxjazFiQmVBdkRkQzV3dGpw?=
 =?utf-8?B?NldOZ2NZM0tySHQ3T2JrNTUyZURXNFp3UmYxSEVjeUtENC9tY0tRY09QZW1r?=
 =?utf-8?B?WWhTWERFR2g5TngremgwMGVSYndoYVp1aGgwNHJQY1FZYzgrZTdlTWNZM0Ji?=
 =?utf-8?B?eldxU1dXMW1TN1BsRThlKzVTNFQxb0YxYjdod3FOM3ZmYk5tbkp4RGRtNStQ?=
 =?utf-8?B?WGR0b3QybjhrTUJSakZRY2hVQXBoVzR6emJZbjFDOXZja1hpNWk1TllPbmZ0?=
 =?utf-8?B?T04vWFB3a2ozQUVnMGJ4OUF5RjFWL0ZIbHhWN2xXYmFXTDlqV3lMWmhnQWNP?=
 =?utf-8?B?R3VMMnN2S2ZDZ2xYUXZvYjRLcUp3MkNLQUxEdTNMUURQNlUxYjdoUmpGNXdS?=
 =?utf-8?B?UjJXUU9yTnNZcHIrRGd0OG5BZW5UYURnSTdSNDFsdWllODZtWmlXR0wrSm1U?=
 =?utf-8?B?ZXZrN2FqYW5BPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVNoNWZXS0JZaDQ5N2JkY0lZc1Aycjd6MHVRd2FXNEZwVTBzT01hckRYL2xi?=
 =?utf-8?B?Ti81NTZHMlFPM1lTRWphV2FPZlc4ZE44R0JlaTArZGxGZlhOSTBpbEtCZlha?=
 =?utf-8?B?SEJjeldyZlg0ZE1NSVVGOXllNnNFM1UwTjRuV0JCVHNpMnVHZXVUck05QkY2?=
 =?utf-8?B?V1lkTENtN2Fxcko2U0I5MEtiRlRMZFBrNm5VODBETWFRUGx3N0xrQ1JUZlU5?=
 =?utf-8?B?amY0T3JoTGRWTXdjeXlYOEFqSjlRSTFEei9BZGdKRDRqcGVmL2pKZVJVeEpv?=
 =?utf-8?B?bzl4VmRpWGZlVEcwY21DczRVODZ4eGpMeVd2RmNsT3VVRVJ2d3NUa0tqNkFD?=
 =?utf-8?B?c2FzOWtyNHVJS1poYTBXNkF3U25xQ2NtMlpPK3M5dzd1aWYyc1ljclByc3o4?=
 =?utf-8?B?dVpJdzk1MTRLVkw0SmdTOVVpUWJaQVlIZXVJamtUTFNHOGZjT0J1VVVGWFps?=
 =?utf-8?B?aWhjcjA5Vk5xVWl5bTlPOUFxdWxwZXZaYWJQbEJ4R3BDU3pSb000aUJIaElS?=
 =?utf-8?B?NGxyRU1EUDFLT1lXNGY5eU8yQ0dGQm0zQXFOY0hXQjNPV2JSMDBGeVloYUVG?=
 =?utf-8?B?ZVgvem0zekFJOW5jVExqbUtpcFRrb2lPdXVvZ1NMSWJ4cmErZk5yZTlQd3BD?=
 =?utf-8?B?RjZrcTAyaDBCQVhRZjdaVWNPSDNZSGtSRzRpMFQrWnJTRElld2tYZnFhcEFm?=
 =?utf-8?B?VW5sbWFnYWUzbEpkaExjdzZYb3Q3bE1tVUVsYTdST3hOSzVoNEo2dTFrU3E0?=
 =?utf-8?B?VURJRFNsZmpIVHQ4RXNlaVdVS2dEajZXVTR0R2lpZis4R1liWWVlVHZ3Tk8x?=
 =?utf-8?B?T2JjZ0lOVEl0ZlVXczNwT2dORDI3QkJQMUViZ1Y5bUdveXpGWkpUeDMyVFlZ?=
 =?utf-8?B?SzJXYnZyRUZCaDhSQU5WVWFhL0JzeUtWa1hBVFBzbDJPckg5MU1vbGFGeklH?=
 =?utf-8?B?bk9uRFdtTDR5azczUGk1QlNhY0RsSzFpdkRrMFRMWDB1cjExVTZlenlqVFRv?=
 =?utf-8?B?REZVak82VklJOHZBVGpmdFRYSklBK1JNczM0T2NhRXh4NjZkVVU0TTJEZEQ4?=
 =?utf-8?B?NDFqSXA0NElIdDJBS3I4R1gxaW9wOVdPckNtejdzNnlENC81MlZhMVZIeUxD?=
 =?utf-8?B?dkkxZ1J2alQ2dGxSd1FiQnR1d3VQMXE0RGRVcW5xeE1UMWtBUWlac3JBK2hL?=
 =?utf-8?B?TWczS3ZjUUpjZFFCcElWUUgrY3JtcGRqcmwva2I0T2dEeThMbXFWejRCcEU0?=
 =?utf-8?B?ZmN2SzI2T3pZL1c1aktTWFhscCtyU28yYkFQWjlFK1Q0RHpOREJwRWk4MlZy?=
 =?utf-8?B?N2JMelZVejdtaU5BT2VIalJnTDc3OUlhYWgxQVFYRndwamxDTEwwV1A4YWdk?=
 =?utf-8?B?TEcwV3NCcFYrd1hCb3E1cGhWaWRlNW94Z3F2YmhxWHcvNWRFcUluRFdqUFhF?=
 =?utf-8?B?MWtCM3JFRHpnOU1UdzJGRi9zR3NrdDVvL1JqWFdUc1IwZnRNd3Juai92aUM2?=
 =?utf-8?B?MUNuTC9rU0xmaEdZbXptc3VRYWdaU2tSMEwwd0wzcExBaEl2RUl4dlU5SUty?=
 =?utf-8?B?VEM0dzdrOWFUOGROa3Q5L3I5MjVDc2Y3MlgwaWFOSWRsY3luWGlOaDRxR1gz?=
 =?utf-8?B?eWpLYzJLdG5rVnBhMHRJWmVxYWdJVnVNNWRVOGx3MnpPOXN6bHpSOVJpZ21Q?=
 =?utf-8?B?Sks3WW9kOTAwMlpQc0ZGbkZJL1BJdmZYZi9Wb3B4QmMxOHJqU09uOXZCYUV0?=
 =?utf-8?B?blFKQzArcnZtMXFLM0dBM05vSVVQY1Y1MnFPaFBjN2NNQ2llbi9vRmd4QVFv?=
 =?utf-8?B?RlRpZk1KcmhDYUtQOXpXaVdhYmlKellSUFB1L0lSWjdYYStjc25UU3NaVWRs?=
 =?utf-8?B?OHhaTjhVMDIxODhnVHhMR2dPWC83UHNzL3VWT1liSjZXTGhHemZiVEp3L2Vq?=
 =?utf-8?B?cjdTWG1rVy9pSkRPWmt5THgwYjFnQS8xV0FZZlEzSG1Iekc0RVAxdXR1VzBM?=
 =?utf-8?B?cWJzWXVDRE00RHNZN0l2RS9HK0RUckRIeTBjSmtYNWYzczlKZWlpbEF0d1VT?=
 =?utf-8?B?TDJ1NTlwcmFFeGltN2FCbWQ0RFU3ZHJwd3BTeWxUQnJjMGlDVHVXVFNsanhW?=
 =?utf-8?B?Qjd5cFR0VlVnaGVzSXVFQWFZUkNVcXNDSDFiWFhSN0dnQVQwVmVpWG45bmRM?=
 =?utf-8?B?akE9PQ==?=
Content-ID: <E214F92535CF2A4BA969C7FFA6551C23@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0047605-6b93-4979-1502-08de272e3421
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 05:40:52.9726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +OCa2MPkTL+BAngvV9o5n8PMI5MnvvJSPH4OkCtWAtmTrngKu6UkeLk2WGLagQ8LijnQxGPFLbPWpodIDmHTAuySr8feIImkB8gQY0ipzto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPFAB9D6435A
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1438138337.1872073046"
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

--__=_Part_Boundary_008_1438138337.1872073046
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgU2hhcm1hLA0KDQpUaGFua3MgZm9yIHRoZSByZXBseSBhbmQgdGhlIHJlZmVyZW5jZS4NCg0K
SSB3aWxsIHVzZToNCmlndF9kaXNwbGF5X2NvbW1pdF9hdG9taWMoZGlzcGxheSwgRFJNX01PREVf
QVRPTUlDX0FMTE9XX01PREVTRVQsIDApOw0KaW5zdGVhZCBhbGwgb2YgdGhlc2UgbW9kaWZpY2F0
aW9uIGFuZCBzZW5kIHRoZSBuZXh0IHZlcnNpb24uDQoNClJlZ2FyZHMsDQpKYXNvbi1KSCBMaW4N
Cg0KT24gTW9uLCAyMDI1LTExLTE3IGF0IDEyOjQzICswNTMwLCBTaGFybWEsIFN3YXRpMiB3cm90
ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3Ig
dGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSGkgTGluLA0KPiANCj4gTG9uZyBiYWNrIGkgaGFkIGZs
b2F0ZWQgc2ltaWxhciBwYXRjaA0KPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
cGF0Y2gvMjU0NzUyLz9zZXJpZXM9NTA1MzkmcmV2PTENCj4gd2hpY2ggd2FzIGV2ZW50dWFsbHkg
Km5vdCogbWVyZ2VkLg0KPiBPbiB0aGF0IHBhdGNoIEkgaGFkIGdvdCBmZWVkYmFjayB0byBzd2l0
Y2ggdG8gYXRvbWljIHNpbmNlIHRoZXJlJ3Mgbm8NCj4gdXBzdHJlYW0gZHJpdmVyIHN1cHBvcnRp
bmcgY29sb3IgbWFuYWdlbWVudCBwcm9wcyB0aGF0IGRvZXNuJ3QNCj4gc3VwcG9ydA0KPiBhdG9t
aWMuDQo+IA0KPiBAY2hhaXRhbnlhIEB1bWEgYW55IGZlZWRiYWNrIG9uIHRoaXM/DQo+IA0KPiAN
Cj4gT24gMTMtMTEtMjAyNSAwOTowOCBwbSwgSmFzb24tSkggTGluIHdyb3RlOg0KPiA+IFVwZGF0
ZSB0aGUgdGVzdCB0byBzZWxlY3QgY29tbWl0IHR5cGUgYmFzZWQgb24gZGlzcGxheQ0KPiA+IGNv
bmZpZ3VyYXRpb246DQo+ID4gdXNlIGF0b21pYyBjb21taXQgaWYgdGhlIGRpc3BsYXkgaXMgY29u
ZmlndXJlZCBmb3IgYXRvbWljLA0KPiA+IG90aGVyd2lzZQ0KPiA+IHVzZSBsZWdhY3kgY29tbWl0
Lg0KPiA+IA0KPiA+IFdoZW4gYSBkcml2ZXIgbWFrZXMgdXNlIG9mIGdhbW1hX2x1dCwgZGVnYW1t
YV9sdXQsIG9yIGN0bQ0KPiA+IHByb3BlcnRpZXMNCj4gPiBmcm9tIGNydGMgc3RhdGUsIHRoZXNl
IHByb3BlcnRpZXMgYXJlIGFwcGxpZWQgb25seSB3aXRoIGF0b21pYw0KPiA+IGNvbW1pdC4NCj4g
PiBUaGlzIGNoYW5nZSBlbnN1cmVzIGFsbCByZWxldmFudCBwcm9wZXJ0aWVzIGFyZSBwcm9wZXJs
eQ0KPiA+IHN5bmNocm9uaXplZA0KPiA+IHRvIGNydGMgc3RhdGUgZHVyaW5nIHRlc3RpbmcuDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0
ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IMKgIHRlc3RzL2ttc19jb2xvci5jIHwgNDcgKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gLS0tLS0NCj4gPiDCoCAxIGZp
bGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jb2xvci5jIGIvdGVzdHMva21zX2NvbG9yLmMNCj4gPiBp
bmRleCBjNDI0MDgzYjdmZDQuLjA1MjBjMmIzYmJiZCAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9r
bXNfY29sb3IuYw0KPiA+ICsrKyBiL3Rlc3RzL2ttc19jb2xvci5jDQo+ID4gQEAgLTEyNSwxMiAr
MTI1LDEyIEBAIHN0YXRpYyBib29sIHRlc3RfcGlwZV9kZWdhbW1hKGRhdGFfdCAqZGF0YSwNCj4g
PiDCoMKgwqDCoMKgIGRpc2FibGVfY3RtKHByaW1hcnktPnBpcGUpOw0KPiA+IMKgwqDCoMKgwqAg
ZGlzYWJsZV9nYW1tYShwcmltYXJ5LT5waXBlKTsNCj4gPiDCoMKgwqDCoMKgIHNldF9kZWdhbW1h
KGRhdGEsIHByaW1hcnktPnBpcGUsIGRlZ2FtbWFfbGluZWFyKTsNCj4gPiAtwqDCoMKgwqAgaWd0
X2Rpc3BsYXlfY29tbWl0KCZkYXRhLT5kaXNwbGF5KTsNCj4gPiArwqDCoMKgwqAgaWd0X2Rpc3Bs
YXlfY29tbWl0MihkaXNwbGF5LCBkaXNwbGF5LT5pc19hdG9taWMgPw0KPiA+IENPTU1JVF9BVE9N
SUMgOiBDT01NSVRfTEVHQUNZKTsNCj4gPiANCj4gPiDCoMKgwqDCoMKgIC8qIERyYXcgc29saWQg
Y29sb3JzIHdpdGggbGluZWFyIGRlZ2FtbWEgdHJhbnNmb3JtYXRpb24uICovDQo+ID4gwqDCoMKg
wqDCoCBwYWludF9yZWN0YW5nbGVzKGRhdGEsIG1vZGUsIHJlZF9ncmVlbl9ibHVlLCAmZmIpOw0K
PiA+IMKgwqDCoMKgwqAgaWd0X3BsYW5lX3NldF9mYihwcmltYXJ5LCAmZmIpOw0KPiA+IC3CoMKg
wqDCoCBpZ3RfZGlzcGxheV9jb21taXQoJmRhdGEtPmRpc3BsYXkpOw0KPiA+ICvCoMKgwqDCoCBp
Z3RfZGlzcGxheV9jb21taXQyKGRpc3BsYXksIGRpc3BsYXktPmlzX2F0b21pYyA/DQo+ID4gQ09N
TUlUX0FUT01JQyA6IENPTU1JVF9MRUdBQ1kpOw0KPiA+IMKgwqDCoMKgwqAgaWd0X3dhaXRfZm9y
X3ZibGFuayhkYXRhLT5kcm1fZmQsDQo+ID4gDQpbc25pcF0NCg0K

--__=_Part_Boundary_008_1438138337.1872073046
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO1NoYXJtYSwNCg0KVGhhbmtzJiMzMjtmb3Im
IzMyO3RoZSYjMzI7cmVwbHkmIzMyO2FuZCYjMzI7dGhlJiMzMjtyZWZlcmVuY2UuDQoNCkkmIzMy
O3dpbGwmIzMyO3VzZToNCmlndF9kaXNwbGF5X2NvbW1pdF9hdG9taWMoZGlzcGxheSwmIzMyO0RS
TV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VULCYjMzI7MCk7DQppbnN0ZWFkJiMzMjthbGwmIzMy
O29mJiMzMjt0aGVzZSYjMzI7bW9kaWZpY2F0aW9uJiMzMjthbmQmIzMyO3NlbmQmIzMyO3RoZSYj
MzI7bmV4dCYjMzI7dmVyc2lvbi4NCg0KUmVnYXJkcywNCkphc29uLUpIJiMzMjtMaW4NCg0KT24m
IzMyO01vbiwmIzMyOzIwMjUtMTEtMTcmIzMyO2F0JiMzMjsxMjo0MyYjMzI7KzA1MzAsJiMzMjtT
aGFybWEsJiMzMjtTd2F0aTImIzMyO3dyb3RlOg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5h
bCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMy
O2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMz
Mjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMy
O3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtIaSYjMzI7
TGluLA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtMb25nJiMzMjtiYWNrJiMzMjtpJiMzMjtoYWQmIzMy
O2Zsb2F0ZWQmIzMyO3NpbWlsYXImIzMyO3BhdGNoDQomZ3Q7JiMzMjtodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMjU0NzUyLyYjNjM7c2VyaWVzPTUwNTM5JmFtcDtyZXY9
MQ0KJmd0OyYjMzI7d2hpY2gmIzMyO3dhcyYjMzI7ZXZlbnR1YWxseSYjMzI7Km5vdComIzMyO21l
cmdlZC4NCiZndDsmIzMyO09uJiMzMjt0aGF0JiMzMjtwYXRjaCYjMzI7SSYjMzI7aGFkJiMzMjtn
b3QmIzMyO2ZlZWRiYWNrJiMzMjt0byYjMzI7c3dpdGNoJiMzMjt0byYjMzI7YXRvbWljJiMzMjtz
aW5jZSYjMzI7dGhlcmUmIzM5O3MmIzMyO25vDQomZ3Q7JiMzMjt1cHN0cmVhbSYjMzI7ZHJpdmVy
JiMzMjtzdXBwb3J0aW5nJiMzMjtjb2xvciYjMzI7bWFuYWdlbWVudCYjMzI7cHJvcHMmIzMyO3Ro
YXQmIzMyO2RvZXNuJiMzOTt0DQomZ3Q7JiMzMjtzdXBwb3J0DQomZ3Q7JiMzMjthdG9taWMuDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0BjaGFpdGFueWEmIzMyO0B1bWEmIzMyO2FueSYjMzI7ZmVlZGJh
Y2smIzMyO29uJiMzMjt0aGlzJiM2MzsNCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtP
biYjMzI7MTMtMTEtMjAyNSYjMzI7MDk6MDgmIzMyO3BtLCYjMzI7SmFzb24tSkgmIzMyO0xpbiYj
MzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtVcGRhdGUmIzMyO3RoZSYjMzI7dGVzdCYjMzI7
dG8mIzMyO3NlbGVjdCYjMzI7Y29tbWl0JiMzMjt0eXBlJiMzMjtiYXNlZCYjMzI7b24mIzMyO2Rp
c3BsYXkNCiZndDsmIzMyOyZndDsmIzMyO2NvbmZpZ3VyYXRpb246DQomZ3Q7JiMzMjsmZ3Q7JiMz
Mjt1c2UmIzMyO2F0b21pYyYjMzI7Y29tbWl0JiMzMjtpZiYjMzI7dGhlJiMzMjtkaXNwbGF5JiMz
MjtpcyYjMzI7Y29uZmlndXJlZCYjMzI7Zm9yJiMzMjthdG9taWMsDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtvdGhlcndpc2UNCiZndDsmIzMyOyZndDsmIzMyO3VzZSYjMzI7bGVnYWN5JiMzMjtjb21taXQu
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1doZW4mIzMyO2EmIzMyO2Ry
aXZlciYjMzI7bWFrZXMmIzMyO3VzZSYjMzI7b2YmIzMyO2dhbW1hX2x1dCwmIzMyO2RlZ2FtbWFf
bHV0LCYjMzI7b3ImIzMyO2N0bQ0KJmd0OyYjMzI7Jmd0OyYjMzI7cHJvcGVydGllcw0KJmd0OyYj
MzI7Jmd0OyYjMzI7ZnJvbSYjMzI7Y3J0YyYjMzI7c3RhdGUsJiMzMjt0aGVzZSYjMzI7cHJvcGVy
dGllcyYjMzI7YXJlJiMzMjthcHBsaWVkJiMzMjtvbmx5JiMzMjt3aXRoJiMzMjthdG9taWMNCiZn
dDsmIzMyOyZndDsmIzMyO2NvbW1pdC4NCiZndDsmIzMyOyZndDsmIzMyO1RoaXMmIzMyO2NoYW5n
ZSYjMzI7ZW5zdXJlcyYjMzI7YWxsJiMzMjtyZWxldmFudCYjMzI7cHJvcGVydGllcyYjMzI7YXJl
JiMzMjtwcm9wZXJseQ0KJmd0OyYjMzI7Jmd0OyYjMzI7c3luY2hyb25pemVkDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjt0byYjMzI7Y3J0YyYjMzI7c3RhdGUmIzMyO2R1cmluZyYjMzI7dGVzdGluZy4NCiZn
dDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0ph
c29uLUpIJiMzMjtMaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0
OyYjMzI7Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzMyO3Rlc3RzL2tt
c19jb2xvci5jJiMzMjt8JiMzMjs0NyYjMzI7KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
JiMxNjA7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MjQmIzMyO2luc2VydGlvbnMo
KyksJiMzMjsyMyYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMy
OyZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL3Rlc3RzL2ttc19jb2xvci5jJiMzMjtiL3Rl
c3RzL2ttc19jb2xvci5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpbmRleCYjMzI7YzQyNDA4M2I3ZmQ0
Li4wNTIwYzJiM2JiYmQmIzMyOzEwMDY0NA0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tJiMzMjthL3Rl
c3RzL2ttc19jb2xvci5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrKysmIzMyO2IvdGVzdHMva21zX2Nv
bG9yLmMNCiZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstMTI1LDEyJiMzMjsrMTI1LDEyJiMzMjtA
QCYjMzI7c3RhdGljJiMzMjtib29sJiMzMjt0ZXN0X3BpcGVfZGVnYW1tYShkYXRhX3QmIzMyOypk
YXRhLA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMz
MjtkaXNhYmxlX2N0bShwcmltYXJ5LSZndDtwaXBlKTsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7ZGlzYWJsZV9nYW1tYShwcmltYXJ5LSZndDtw
aXBlKTsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MzI7c2V0X2RlZ2FtbWEoZGF0YSwmIzMyO3ByaW1hcnktJmd0O3BpcGUsJiMzMjtkZWdhbW1hX2xp
bmVhcik7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtp
Z3RfZGlzcGxheV9jb21taXQoJmFtcDtkYXRhLSZndDtkaXNwbGF5KTsNCiZndDsmIzMyOyZndDsm
IzMyOysmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO2lndF9kaXNwbGF5X2NvbW1pdDIoZGlz
cGxheSwmIzMyO2Rpc3BsYXktJmd0O2lzX2F0b21pYyYjMzI7JiM2MzsNCiZndDsmIzMyOyZndDsm
IzMyO0NPTU1JVF9BVE9NSUMmIzMyOzomIzMyO0NPTU1JVF9MRUdBQ1kpOw0KJmd0OyYjMzI7Jmd0
OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzMyOy8qJiMzMjtEcmF3JiMzMjtzb2xpZCYjMzI7Y29sb3JzJiMzMjt3aXRoJiMzMjtsaW5lYXIm
IzMyO2RlZ2FtbWEmIzMyO3RyYW5zZm9ybWF0aW9uLiYjMzI7Ki8NCiZndDsmIzMyOyZndDsmIzMy
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7cGFpbnRfcmVjdGFuZ2xlcyhkYXRh
LCYjMzI7bW9kZSwmIzMyO3JlZF9ncmVlbl9ibHVlLCYjMzI7JmFtcDtmYik7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO2lndF9wbGFuZV9zZXRf
ZmIocHJpbWFyeSwmIzMyOyZhbXA7ZmIpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7LSYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMzI7aWd0X2Rpc3BsYXlfY29tbWl0KCZhbXA7ZGF0YS0mZ3Q7ZGlzcGxh
eSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtpZ3Rf
ZGlzcGxheV9jb21taXQyKGRpc3BsYXksJiMzMjtkaXNwbGF5LSZndDtpc19hdG9taWMmIzMyOyYj
NjM7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtDT01NSVRfQVRPTUlDJiMzMjs6JiMzMjtDT01NSVRfTEVH
QUNZKTsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MzI7aWd0X3dhaXRfZm9yX3ZibGFuayhkYXRhLSZndDtkcm1fZmQsDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsNCltzbmlwXQ0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0t
PjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3Rp
Y2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0
aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBj
b25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1w
dCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0
byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkg
dXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBv
ciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5
IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSAN
CmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhp
cyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSBy
ZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwg
YW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90
aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_008_1438138337.1872073046--

