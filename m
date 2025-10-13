Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567B5CCD183
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 15:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7B410E49F;
	Mon, 13 Oct 2025 15:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="jlW/TrNt";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Ijmi10pZ";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F06510E493
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 15:25:58 +0000 (UTC)
X-UUID: e7616ad2a84811f0ae1e63ff8927bad3-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=MY2E9XilRP4l4QZsdX14vY2XdtPze6r0DN/+N8xMTYg=; 
 b=jlW/TrNtVm0N/yScBjlu1yjO/B4dw7qAnv5TQCCo/YEWR/63O/hhYUZJDCrxL7sdq5f9aryut0ghShkA5yQCj3qGxuoTmFBZs7ni7ZlZa3pw/jeP1a/CcNXqkg8eP23C5V/b53ReFmo79ywAAJfQR40ttPfUf5arX9NFMi75mA8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:2010779a-f327-444d-9c35-5c40fc694a0c, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:8d9d0151-c509-4cf3-8dc0-fcdaad49a6d3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:-10|4|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:
 nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
 C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e7616ad2a84811f0ae1e63ff8927bad3-20251013
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 69759785; Mon, 13 Oct 2025 23:25:52 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Oct 2025 23:25:48 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Mon, 13 Oct 2025 23:25:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDh9wkRZneOJX9gPLzYVeZFr59wHU5N0g9SJoaHKGVlrXaPLjOQSA5uLz+jLPpXxyg8oaareCBQRHeYosdKA28YLMT7W31iJs0sXjuxK29fP/kEY6ji3kXZM1WClPvyAbxlvQPqOZu6WttLejWkjN74jn6drd2B6cQ81pEMdsej8qEE4FvSNi0svsEZzBIXEID1qK4jFKIrODmqXeqJGORHv57qzwMicZYMPTZbPHrkw52rJ7Jr/apjZaJGXiajtDfpJYh3uAepBS8pz+CSCJ72Hawk2JfYr+jqFuyq4uSBME9nDYg2+lHh/76kzssEh/6Vwr1iYThAyiFqyrmrc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1dJ6pbr4BdfbA4Ofw1QNPwRM13VwWs1oOLPrHS88O4=;
 b=hnXr+ORyMr+UWKncKUvqY+mo9r2sJPfJh237NKzu9RAG58N8vdyCLdibi0l2llKYnnPwruCPiTBChCGP0kDGaiWFdrCfrXlshg9zwNfVlrodKP3Q/KadVuNFjKRsr6QhlN8mGXRi0Ml5QE5ATqXqpkYyYdSLDbpowJt/vNooYxKq6/LntWe2tpRYZMRBfDL0RwAtdcXRUCW3xiu1FaTzb+/YF3ltJl6UAPXNR7B/ZX82mvX0jf01h0AFYwHXvPxYvGZjlbDrUBzNLh5jYVmOrOJ6gSkjBS+ry0oIt5Fm47CNNu+JzjyrEhZ/6PB/4/mistuNM3W8wfeQRjsDxi/jXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1dJ6pbr4BdfbA4Ofw1QNPwRM13VwWs1oOLPrHS88O4=;
 b=Ijmi10pZGR2bdacJ7FPUclfR8aNUH79yUkyc2p9/I2/yq/FqFkVLM/wn3CpSwHn/Wfanq8GlUwGR2ECxo0gDovLD12TxBDz4ZGQq5cs/GBFAFo5dYrJsy40VnDVntP19lIANiPnOS23W06Y5NR3r5qxJQU7aUNE2QFzzAKuOsps=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB7673.apcprd03.prod.outlook.com (2603:1096:400:3ca::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 15:25:47 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 15:25:47 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>
CC: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t 6/6] lib/igt_edid: Fix monitor name parsing and trim
 EDID string padding
Thread-Topic: [PATCH i-g-t 6/6] lib/igt_edid: Fix monitor name parsing and
 trim EDID string padding
Thread-Index: AQHcO5vUYd19hZVoeUWEiG58oB2sqrS/uIkAgAA1vYCAAA0VAIAAOLgA
Date: Mon, 13 Oct 2025 15:25:47 +0000
Message-ID: <9227e09d8fa06288d62fc847f9d871c5308ec71f.camel@mediatek.com>
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <20251012171459.3773990-7-jason-jh.lin@mediatek.com>
 <1543d4867d6055090309f653da5e74c9097322ae@intel.com>
 <591ef478c27f82b9c62aa9d192fdfc7505be9b72.camel@mediatek.com>
 <fe5ec9d09f827cf00b1ce2d81fcc273805818d7e@intel.com>
In-Reply-To: <fe5ec9d09f827cf00b1ce2d81fcc273805818d7e@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB7673:EE_
x-ms-office365-filtering-correlation-id: 5e9ad7c8-1f22-4eaa-ad7a-08de0a6cc8ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?M3RibDBtT3IzZkJ6ZzJJUXF3ajVZWEhvZmNoQ29ORUN2b1g5YXF5c0gxQytB?=
 =?utf-8?B?WlhVTkU4MnV1OERqL1RlNlNNQTdGY3hTUGIrR0V4RG1yc1FFcG9JaWNqSmND?=
 =?utf-8?B?QVVzSW1yOWo3emU5WEdFYTJUQlR0d29DbVVEYmR5Q3ZmcUsxT0NrM09kQ29H?=
 =?utf-8?B?TXBwWjZSejRUem1KY1hKOWNQdCtrdHpwN25pZndXZHFqbndKYVdvZ0RlYjd3?=
 =?utf-8?B?NHdKeXhQOXVrcnJVRVJzOHhlWHhPejg2WnA0K0thK0U0R2xVMzZCdktlcnM2?=
 =?utf-8?B?RlNsRkpkdmVFY3YrMjd3YTBDdDF1TW1XeEFsMmZjQzkyMTRQcjdVdUxZdmpN?=
 =?utf-8?B?U1RnNWZ1dm1CT2NZSTNrTGlDVkUzeVFYckpHN2s5N1lhNk0wMXhHeVllWUQv?=
 =?utf-8?B?bHZyVG9vTHB4Z1RmSEFldnJyeXZ5QW5qVWcxTjRUUTFRZG15Z0xuQnVMQkpv?=
 =?utf-8?B?SGdITFlTTzdNM2pTZ01VOVVyUElzdko5Q3VRWEs4d29rc3V6RkE2cjVOTGtk?=
 =?utf-8?B?ajlGa0NUaVJpUElMa3pnNWtJc3ZBQUJ5bUFPVDBOWkZneGZxRW80eDYxVHZo?=
 =?utf-8?B?UDRjZTFIZGo5K3hURGhQLzVJR2xBTmZuTFpZZHVjcEl1L0o3SlpGb09lV2JW?=
 =?utf-8?B?b3BPN0VlNjNKUHVBREZTR3UrQWgvRForRGNOUVZHdUJnelpZT2c5WUtaMkdK?=
 =?utf-8?B?SjhTR3p6RzNmbGJ1eWFieWZ5alcxcFBvSlcyL1d4Q1QyRVJ3ZU1IQjJXbHFs?=
 =?utf-8?B?cWpXNS9hNm5OMnB2K0RnTEJ0OFZ6UisxaWdkaTdzTnNIRG94QmVLZ2tCVndO?=
 =?utf-8?B?aXZGczkvb3ZCZ2dHb3pWblYwdlh0cHhmaFB0SjEvYkdCY0NtZjhzanZ3WGF3?=
 =?utf-8?B?eFRMckhqVlJKV0hlZDhBb1ZxUnF6WmZpQ2FScm1zbUR1WTlmTTFxVEtMZzli?=
 =?utf-8?B?Uk4wd1k5c3hyNDBKcTFBSGtJZEJGYmUrV1NxVUg5VHBadTBUUlVLODJmZFQ3?=
 =?utf-8?B?OGh2UmUxd1NxMGtlaS9NZy9NTStMODEzNW5GclRBNnd1cUtwWXNsTEQySTYz?=
 =?utf-8?B?emZLZjRJaWxHM1pqVGFRd2Jyb0RsZytEdGRtSStRakdlZ2xRL1NOL3V6ZWEv?=
 =?utf-8?B?eXVUK1F0aXZFK25EdDRrazUzelpZNXVVU3IxWFovMEp2dXdrMlVMMVliaFRs?=
 =?utf-8?B?NVhlZng1YTFRMmZOd2FoSDIxamF5dm1WQkFSSEVMaFJZSmZoaUVJTUdMd1BX?=
 =?utf-8?B?Yk8vU2lnSUFsQ3E3RUh5VVBrNlR4bGFqWUp4dzFjYmhiQi9sNTBaWEtaYjJr?=
 =?utf-8?B?d2pZWXhLSW84RUh0NzZMUkQxVTN1azBzSnkvd2Z6cVlRSDM4dHJXT09rMjV6?=
 =?utf-8?B?V2xmOEo2VnJsS1lCZVAwdm5MREpBaHhyM2lxUlFNSHNZVSsvYzhPc1FKWHQ1?=
 =?utf-8?B?LzI1QlA0TVJqMVY3aUlOdnFLbkEvS2hzOFBGUXhoSWc4Q25TOFc4NmloaGxX?=
 =?utf-8?B?TkNhaDVwVkgwVVlZaW1XOStvZThkVmsrdGs4OThaeWFySnFrL0pqYzdtdWFk?=
 =?utf-8?B?RHh0Y3ZibU9yMFZUUlowYzBmTWV3N2syTTBkb3dDdFFjOXFPSmI3OTU5TElX?=
 =?utf-8?B?UnN1VVhXUjVER3V4MFkyL00yV0xSMkJ0K1lNOHpxYnJac0R4N3dTaHA3NDNI?=
 =?utf-8?B?NWFoUkU2S1YyaXVXTy95WGFqNEFUQ09BbzQzKzNIZWJlKzB4blJKcis4VEw3?=
 =?utf-8?B?bWJEUzhyK3E3TlNubExwcFdlRDByRGVwR25mRVM5VTFpSnpUdzVkNDRxalM2?=
 =?utf-8?B?ZzBkaSs2OUFvUWhMQ2hDeFdmRjhwNUlGT21LZU9oTWdsTmJVRFNRM0pjU3c2?=
 =?utf-8?B?a3JIWDFOMk9VSG9oT1ZudE9QY1dXUFY4NnRJOGZmZTgzWCttL0NHeEtEKzF5?=
 =?utf-8?B?RDU3UHhUU3VTYUpPckFubU9ETUVkK3VHS1VhbmU0eFNUOFB0QjJJajVMOWZQ?=
 =?utf-8?B?eWdHNEVnWk92L3lFaWtUQUN4aEJiU01HMHVLenRacmtEYzgvbnQzTHUvQStQ?=
 =?utf-8?Q?XeB1N0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1BlTDRlUHZuRWtETjlzUmYra3NlYXVPN0xzTjlvbGhEM0hHWkExWDBzWWVk?=
 =?utf-8?B?NHcySFB0KzA3R0huSFUwQXF2Uzk2MGJxb3M3SlVtR2o4QXFqR3JObm56UE1K?=
 =?utf-8?B?ZUlNcmhKSmdURmV0UFRrNzhVZWp3b3IwcVA0NjRpNU1UejU3Y2haVXhUMWtD?=
 =?utf-8?B?aTNKbFV1MktOL2pUSHhOQU5veW53UmlYRFZXMkZlaG1naVIvT1ErTnovQUVu?=
 =?utf-8?B?QjFTekVNNEQzSTFyLzNabStSTzQ2UUVqUU9tKytvanBjOUFiS3o3MjFlUHlE?=
 =?utf-8?B?amdCNUlXMmZuTXFmWThtYVJqVG03S2wzb0NhSWtNRmYrem5YNnhKQTN2YW1X?=
 =?utf-8?B?NUQ1WlMzYzNzSkRzQWR1dUpZSkFTVzNFZlJHQkovUTV3cjZ0c1lTaFBZRVJa?=
 =?utf-8?B?OGNGeUI1eVFUbWNkczQ1VFRhTEt4WEdmY0psSDUyZUxLTTd1UHg3disvd0pH?=
 =?utf-8?B?YTRxVVFSdy91WG9TblNsQmVIUWlXTGJHMlI0VGROelk1Rldiei9yNG1WRXVX?=
 =?utf-8?B?V2tqcTF3NlJtQ3RITjNIZDBqMmJjZHo4NnlRM3QxWjY4bHFVN1JpV2VuV0Ry?=
 =?utf-8?B?czE4Vjd5allMalBGQ0svZlJHVjc3QzJJK3BGb29NajcyNllRVTZpZElYUHVs?=
 =?utf-8?B?alJaQkxySU0vdWhMS3pSWTM0SmR4akJKN3hFbXNzczExemVlb2czRE41Tnkz?=
 =?utf-8?B?TTdSNEY1Rm5ZMktJWVBmUmhaQ29Vc3Y0Q2N0dnhzN3hDOUY1em1DWXFHTTM0?=
 =?utf-8?B?UkhwcVg3QWZuZEVHSWdXSjdTTGNXSUJmMTRGZ2xFVTRsV0ZoaVBXRGxIRzRp?=
 =?utf-8?B?MHBtM0VCQ3RhQ0hNZ2M2ejdZbEZYbFppcTVsdlRmYzkrcDNHTWkzQlNoUXg5?=
 =?utf-8?B?aGE5cDFCdkJOWFFCWnQydWgwRnN6b1pXQ29IQy8za09PUTdOejB2Z1RETWVJ?=
 =?utf-8?B?bXQxNWFMR250YjdzMFJJM0FSVUttL2pqWWdkOEo1Mm1nSXZZMjVtZXRpOHA2?=
 =?utf-8?B?c1JLOWF0RkZKMmZjTDI3WGNLeG5SeXllT253eGxHUHN3RVNFdlBDSnNma0tR?=
 =?utf-8?B?OTdtYlVld3BOSDdCOXBER2UzVXFKRnBJakNNM0Q4QnRGK1hNUFhFc2hqNXRp?=
 =?utf-8?B?SkNxalpJZnFYNFExSUVqOUtadnZNOXpVQ1VBdjR3U1plUG1pVzdUQ0JUK2NW?=
 =?utf-8?B?aDdEc1Y2QWMzYXNLUUNkVlFjcTk3QjZhbUNVb3U3eGwydzRtajZXQlhLVE12?=
 =?utf-8?B?SkNFNnlFdWc5cnorT0llZVRHc1Fpc2Y4ZTR4eU8zSy9OaVBMVlI5NmhrT1M3?=
 =?utf-8?B?SjBGS2VCMUx3Ujk3R3licmFFOEpyaVJmQmd4Vkw1SlVVbnZFVEVtSEl1NmNk?=
 =?utf-8?B?cUx2Y2J5ejR5ZTFHWGlBalN4K0RTSTB1ZDRMOUNOUDV2RUhMUFR0Q2lSeWFI?=
 =?utf-8?B?U2tzYkxlSTNpUFo2Y1p1OWJPQTlEYmdsaVhISXJXckdyTlVMd2ZhSFlSVmxC?=
 =?utf-8?B?RlRWN0QwNmhiSjFETFRkQ1BSSUJmZnI3d3Y3WGR0b3lucUw1ZjR1QXhoblBT?=
 =?utf-8?B?MWQ5UGxpUXdvckUrbzVaRHRLelBUMVdaSG03eFJFKy9sQVZ4SytMMFd4OEZz?=
 =?utf-8?B?Q25TQmJzSXNoR0VxNGYvOHdmVlNiK01lRmI0WkZ0a1dabjFYRjhCZ2JMemdQ?=
 =?utf-8?B?am55Nnh1a1pZMTR4YzBtWjk3WkhpdW9kQ3pzWk54blp1cmZLbkprZ1BPN1dj?=
 =?utf-8?B?bExpaW5LSGhrOUx5OUNJZDdmMFpMTDdPVjkwVmRDMkZ4cmhEczR4TUIrVERw?=
 =?utf-8?B?aHR5TzFvYkE4b3JZLys0Qi9GNjVWWlVkOUQwK0F4ZmczeG52NUIyU3E3Q0Vz?=
 =?utf-8?B?Zk1RZ3ZFd28vUGxMVS94NXAyaXJOLzcrNWxzSTdrYWRwU3Jic1RiSWlKT1lq?=
 =?utf-8?B?bnc1VFc4aFMvaldkRzg0RmMxWFdFdXBEaW9hckFJTFFOMHR3VW1tdytoMzBw?=
 =?utf-8?B?NkR2dCtNTk1DVy84VjJmdzdLdWMvYTBYUUY0ZXJMaGlFMmlZbzV6S2RYTmVG?=
 =?utf-8?B?My9SbkJ3RWFqM3l5RVFjbThxUUQ5YzJzM2oxVWQrbG4vOXB5QUFNN29QYSsv?=
 =?utf-8?B?b255MXY5Y0ZUMmdEbjBQVFdISmJ2L3VUeU1QSU9RSlo0QjlwZ0tNQURFeTFI?=
 =?utf-8?B?WWc9PQ==?=
Content-ID: <496288657AD9844196423582FE558140@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9ad7c8-1f22-4eaa-ad7a-08de0a6cc8ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 15:25:47.2453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCMxfWb1IIpnO+wgkPjxUr+nJ2yx+/CGlFWrJwc9MXXtAhSJlVhcG449zLoLmeiDqjoUyuo0JaHCJz7PWtCH4B4K9tGoAF3N6E6lW80f6qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7673
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1889082793.320267901"
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

--__=_Part_Boundary_005_1889082793.320267901
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

PiA+ID4gDQoNCltzbmlwXQ0KDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRz
ID0gJm5wLT5kYXRhLnN0cmluZzsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RybmNweShuYW1lLCBkcy0+c3RyLCBuYW1lX3NpemUgLSAxKTsNCj4gPiA+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBuYW1lW25hbWVfc2l6ZSAtIDFdID0gJ1wwJzsNCj4gPiA+ID4gKw0K
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIHJlbW92ZSB0aGUgcGFkZGluZyBz
cGFjZSBmcm9tIEVESUQgKi8NCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuID0g
c3RybGVuKGRzLT5zdHIpOw0KPiA+ID4gDQo+ID4gPiBJdCdzIG5vdCBOVUwgdGVybWluYXRlZC4N
Cj4gPiANCj4gPiBIaSBKYW5pLA0KPiA+IA0KPiA+IFRoYW5rcywgSSdsbCByb2xsYmFjayB0aGlz
IHBhcnQgYW5kIHNldCBuIHRvIG5hbWVfc2l6ZSAtIDENCj4gPiBkaXJlY3RseS4NCj4gPiANCj4g
PiBGdWxsIGNvZGU6DQo+ID4gDQo+ID4gZHMgPSAmbnAtPmRhdGEuc3RyaW5nOw0KPiA+IHN0cm5j
cHkobmFtZSwgZHMtPnN0ciwgbmFtZV9zaXplIC0gMSk7DQo+ID4gbmFtZVtuYW1lX3NpemUgLSAx
XSA9ICdcMCc7DQo+ID4gDQo+ID4gLyogcmVtb3ZlIHRoZSBwYWRkaW5nIHNwYWNlIGZyb20gRURJ
RCAqLw0KPiA+IG4gPSBuYW1lX3NpemU7DQo+ID4gDQo+ID4gd2hpbGUgKG4gPiAwICYmIGlzc3Bh
Y2UoKHVuc2lnbmVkIGNoYXIpbmFtZVtuIC0gMV0pKQ0KPiA+IMKgwqDCoMKgwqDCoMKgIG5hbWVb
LS1uXSA9ICdcMCc7DQo+IA0KPiBJTU8gc29tZXRoaW5nIGxpa2UgdGhpcyBpcyBvdmVyYWxsIHNo
b3J0ZXIgYW5kIGVhc2llciB0byB1bmRlcnN0YW5kLA0KPiBhcw0KPiB5b3UgaGF2ZSBib3RoIHRo
ZSBjaGVjayBhbmQgdGhlIG9wZXJhdGlvbiBvbiBuYW1lW25dIGluc3RlYWQgb2YNCj4gbmFtZVtu
IC0NCj4gMV0gdnMgbmFtZVstLW5dLg0KPiANCj4gwqDCoMKgwqDCoMKgwqAgZm9yIChzaXplX3Qg
biA9IG5hbWVfc2l6ZSAtIDE7IG4gPiAwICYmIGlzc3BhY2UobmFtZVtuXSk7IG4tLQ0KPiApDQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuYW1lW25dID0gJ1wwJzsNCj4gDQoNClRo
YW5rcyBmb3IgeW91ciBzaW1wbGlmaWNhdGlvbiwgaXQncyBpbmRlZWQgY2xlYXJlciBub3cuDQpJ
J2xsIGNoYW5nZSB0aGlzIGF0IHRoZSBuZXh0IHZlcnNpb24uIFRoYW5rcyENCg0KUmVnYXJkcywN
Ckphc29uLUpIIExpbg0KDQo+IEJSLA0KPiBKYW5pLg0K

--__=_Part_Boundary_005_1889082793.320267901
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQoNCltz
bmlwXQ0KDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsm
IzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzE2MDsmIzMyO2RzJiMzMjs9JiMzMjsmYW1wO25wLSZndDtkYXRhLnN0cmluZzsNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7
c3RybmNweShuYW1lLCYjMzI7ZHMtJmd0O3N0ciwmIzMyO25hbWVfc2l6ZSYjMzI7LSYjMzI7MSk7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjstJiMxNjA7JiMxNjA7JiMxNjA7
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMz
MjtuYW1lW25hbWVfc2l6ZSYjMzI7LSYjMzI7MV0mIzMyOz0mIzMyOyYjMzk7JiM5MjswJiMzOTs7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjsvKiYjMzI7cmVtb3ZlJiMz
Mjt0aGUmIzMyO3BhZGRpbmcmIzMyO3NwYWNlJiMzMjtmcm9tJiMzMjtFRElEJiMzMjsqLw0KJmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7biYj
MzI7PSYjMzI7c3RybGVuKGRzLSZndDtzdHIpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtJdCYjMzk7cyYjMzI7bm90JiMzMjtOVUwmIzMy
O3Rlcm1pbmF0ZWQuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO0hpJiMz
MjtKYW5pLA0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGFua3MsJiMz
MjtJJiMzOTtsbCYjMzI7cm9sbGJhY2smIzMyO3RoaXMmIzMyO3BhcnQmIzMyO2FuZCYjMzI7c2V0
JiMzMjtuJiMzMjt0byYjMzI7bmFtZV9zaXplJiMzMjstJiMzMjsxDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtkaXJlY3RseS4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7RnVsbCYj
MzI7Y29kZToNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7ZHMmIzMyOz0m
IzMyOyZhbXA7bnAtJmd0O2RhdGEuc3RyaW5nOw0KJmd0OyYjMzI7Jmd0OyYjMzI7c3RybmNweShu
YW1lLCYjMzI7ZHMtJmd0O3N0ciwmIzMyO25hbWVfc2l6ZSYjMzI7LSYjMzI7MSk7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjtuYW1lW25hbWVfc2l6ZSYjMzI7LSYjMzI7MV0mIzMyOz0mIzMyOyYjMzk7JiM5
MjswJiMzOTs7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOy8qJiMzMjty
ZW1vdmUmIzMyO3RoZSYjMzI7cGFkZGluZyYjMzI7c3BhY2UmIzMyO2Zyb20mIzMyO0VESUQmIzMy
OyovDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtuJiMzMjs9JiMzMjtuYW1lX3NpemU7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO3doaWxlJiMzMjsobiYjMzI7Jmd0OyYjMzI7MCYj
MzI7JmFtcDsmYW1wOyYjMzI7aXNzcGFjZSgodW5zaWduZWQmIzMyO2NoYXIpbmFtZVtuJiMzMjst
JiMzMjsxXSkpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzMyO25hbWVbLS1uXSYjMzI7PSYjMzI7JiMzOTsmIzkyOzAmIzM5OzsN
CiZndDsmIzMyOw0KJmd0OyYjMzI7SU1PJiMzMjtzb21ldGhpbmcmIzMyO2xpa2UmIzMyO3RoaXMm
IzMyO2lzJiMzMjtvdmVyYWxsJiMzMjtzaG9ydGVyJiMzMjthbmQmIzMyO2Vhc2llciYjMzI7dG8m
IzMyO3VuZGVyc3RhbmQsDQomZ3Q7JiMzMjthcw0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjti
b3RoJiMzMjt0aGUmIzMyO2NoZWNrJiMzMjthbmQmIzMyO3RoZSYjMzI7b3BlcmF0aW9uJiMzMjtv
biYjMzI7bmFtZVtuXSYjMzI7aW5zdGVhZCYjMzI7b2YNCiZndDsmIzMyO25hbWVbbiYjMzI7LQ0K
Jmd0OyYjMzI7MV0mIzMyO3ZzJiMzMjtuYW1lWy0tbl0uDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7Zm9yJiMzMjsoc2l6
ZV90JiMzMjtuJiMzMjs9JiMzMjtuYW1lX3NpemUmIzMyOy0mIzMyOzE7JiMzMjtuJiMzMjsmZ3Q7
JiMzMjswJiMzMjsmYW1wOyZhbXA7JiMzMjtpc3NwYWNlKG5hbWVbbl0pOyYjMzI7bi0tDQomZ3Q7
JiMzMjspDQomZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO25h
bWVbbl0mIzMyOz0mIzMyOyYjMzk7JiM5MjswJiMzOTs7DQomZ3Q7JiMzMjsNCg0KVGhhbmtzJiMz
Mjtmb3ImIzMyO3lvdXImIzMyO3NpbXBsaWZpY2F0aW9uLCYjMzI7aXQmIzM5O3MmIzMyO2luZGVl
ZCYjMzI7Y2xlYXJlciYjMzI7bm93Lg0KSSYjMzk7bGwmIzMyO2NoYW5nZSYjMzI7dGhpcyYjMzI7
YXQmIzMyO3RoZSYjMzI7bmV4dCYjMzI7dmVyc2lvbi4mIzMyO1RoYW5rcyENCg0KUmVnYXJkcywN
Ckphc29uLUpIJiMzMjtMaW4NCg0KJmd0OyYjMzI7QlIsDQomZ3Q7JiMzMjtKYW5pLg0KDQo8L3By
ZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioq
KioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioqKioqKioq
KioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAo
aW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmll
dGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVu
ZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5
IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwg
DQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVu
dChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91
IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZl
DQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ug
bm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1h
aWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGlu
ZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3Nl
IHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlv
dSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_005_1889082793.320267901--

