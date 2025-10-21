Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B05CCD1A5
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 07:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5302610E575;
	Tue, 21 Oct 2025 07:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="U3yoVLiG";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="wIsdutzN";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6445F10E575
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Oct 2025 07:33:07 +0000 (UTC)
X-UUID: 2b81c6d2ae5011f0b33aeb1e7f16c2b6-20251021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=xKc4Q6BS9vZcBdlJODqWyTpDL7zJzSOewhERcWu/SII=; 
 b=U3yoVLiGtZPT+B0D1DcGk64L4u+2mv/qBBkirs7F8BcocNmRYAi89bBrRjFwVYAfUL0BH88zB/9dxzq3kZYYXpEu6a4AMfaZyksMl+AKiuq+9TmGoHObCCFUvH3Nqs695eHgxUkEcLEdA9ktrkkc+zQzIBoCnbOVMLtmVvEhYCU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:ed47674b-daaf-471c-b899-57e0dc802d32, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:4fcb7086-2e17-44e4-a09c-1e463bf6bc47,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
 BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2b81c6d2ae5011f0b33aeb1e7f16c2b6-20251021
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1694402142; Tue, 21 Oct 2025 15:32:59 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 21 Oct 2025 15:32:58 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 21 Oct 2025 15:32:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PgTwsa/WvsKwafpYDROQyK3wWi6+j8UfTqztN332w2WRqi651veOZiIMqmCH0hlTv+xnt66zQgEUQvYozK8iVio9Z3wV0ceDDBCGciyEhhdpr9F/WDZZOKroGl/+6O6CVUMzRKRc79Ut+VianXprD7BJWAqFjtKy2mNz3LqmcpMmDAC9WWzTGIkK1yk6cfqaYF6NHfvMjntFiB2FPpgu26UcxDQwFUEKNS9akam9PJuh3BGZnk113ilvP8HEdUoBTPM53XG5ooLOTLhOqSLYyCAf1WASxqyw+CeMewF7/AHCq54VokPNCadWag+PRLy43NyfmO+sosa2SYNuy1fh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSRcwWywS7qCiOyiaPNWdH+3M+tQfCwzIVjM/HNC5w8=;
 b=peJWe7ji7fFoGzx1yANE7sVO+uIBpddfhHPSeR9wJdiwOLwdV5/uIsJCCinnQdNGy46yNKUkH3VvxTiiPJndiwUMch/HmL7PTa04Wjy3HtErktoPeQ37rBQnuYhOPXUcuzIzYzd4wfPfKOsige/C8FgGDCCqBdw4wKQXQf3n8I/YiWPIyXTF5yoZk5xaPn+gPYZSUQQ57EBHwSGYtj0/kNwmFLaisycVXiE4Dg6SNUU5jUEHrxPtCd75yNRPMp9vK/Mrrtl8vLOmIiHRa+sSUcMLO4YtLuakMCkDPsfXzyIG1v8K4cvJ0zrX6hEoRA29JRpA93i9kd97rOgGGbnppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSRcwWywS7qCiOyiaPNWdH+3M+tQfCwzIVjM/HNC5w8=;
 b=wIsdutzNgJN7ybNA3H9gLgcckmXj4Y3Z3NwNUTF4w2ETbfnWtWGYgy0I4NYyDNLW+6ABvgimIo2TyNQK4Z+jV7r6Rgxtj6R5c/ya6QLCFYFo1MnElq7Ht2sLGhpTGvw9m0C21nxUnTCe+xja5IXSXv0HWlIwV2AuAsuGzJanN6I=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB7347.apcprd03.prod.outlook.com (2603:1096:400:423::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 07:32:56 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 07:32:56 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "gildekel@google.com"
 <gildekel@google.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/6] tests/kms_plane: Add support for
 planar-settings on non-Intel devices
Thread-Topic: [PATCH i-g-t 2/6] tests/kms_plane: Add support for
 planar-settings on non-Intel devices
Thread-Index: AQHcO5vE3D5pJmYuI06ymkHSxNn+CbTK948AgAFLDoA=
Date: Tue, 21 Oct 2025 07:32:56 +0000
Message-ID: <28fb322c08b672ac9cbf9ff3ec27d6fc2751bba0.camel@mediatek.com>
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <20251012171459.3773990-3-jason-jh.lin@mediatek.com>
 <20251020114802.ut5syb2tgeukqaod@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251020114802.ut5syb2tgeukqaod@kamilkon-DESK.igk.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB7347:EE_
x-ms-office365-filtering-correlation-id: fc696cc7-3de7-4f46-8010-08de10740d82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Z2NlT1g3K0pZQzF4Q3U0VXhCVkZnbWlGTm1DMTI2eENXd1EwSVQvOHlNWkhZ?=
 =?utf-8?B?T2tCWFM2Q0xKZkdwN3g5UEk4SHAyNzBnZ3lNY3NxS3lMbTNsRHlVUmRaT0N2?=
 =?utf-8?B?SkJJcTBwQTRSWXA5Z3VkSEptQStUSXBpVzgwVEc1UVlnQXhET0plU25EdUlV?=
 =?utf-8?B?eXVpQkZNS28xUUFFczk3YUR6M05NSW1kOGQwRmhiVkpIZ3N4RmhPc2RkU2Nq?=
 =?utf-8?B?QzY2aHMwTGp5ZXIreENzbnd1cFNWNkt0aWFqbDhHazZINVY2SDVjZWpQQi9n?=
 =?utf-8?B?NU1xb2VpbC9PVXc4YmFLQW9zVjY1ckloVUM4UU1vRHZRZHROV0swSjBSeXkx?=
 =?utf-8?B?Nk0ycmY3NGNDd3NBcUltY2xpM2l6Wk5nV3J6KzU0OEV3akozU2dwRUlhd1JK?=
 =?utf-8?B?QmpycEtjOWtnejZyWi9DZ2p2RG1GWUFWN0tpYjVPcXAxTmxuN2xEKzJDd1NC?=
 =?utf-8?B?YUJCL1R4K2ZTaXNQMTBrSDNjQXppc2hJaGxWbDBNL0paK3hRRDRNMlZMamRZ?=
 =?utf-8?B?MzdyNmdBTFVnVTc0L0JzbDk5aUs0OTdzUlFROHdxVnVZTGdFVnNaRTdNdnRN?=
 =?utf-8?B?NUw2UWl4dWRnTlIzY3dDVi9rRmg1d3dWTHdLNk1jMjc5MThxSW9jV3FmdlNX?=
 =?utf-8?B?cENUTzd6ZmN0N093bXg2MklId2kzbUFDRk1tT1VFYjBPZlhYdE5FaU1VZm5M?=
 =?utf-8?B?RkFoQU9Ed3YzSno3bUdYcUx3VEVnU0RGWWpzaVkxOTBFd09WWVBIM2tHNTVT?=
 =?utf-8?B?TUluY3VlQXBuNjVDeU9CTVp4QWFGT1JBZXhYb3c3ODR0c09tbTM0R0ZuVW9C?=
 =?utf-8?B?Q3ByU1VncnEzVXNmWTJJUzVsRkNxYzRPS29xUzZoTWpmejBMQkVJa0xkVFFZ?=
 =?utf-8?B?VW9MTVF0ckFxeXZvTFY1VUtKdFRKa05IRTFaSTlwZElNdXEyZXVMSDYwRmx1?=
 =?utf-8?B?b1dYS0lFa1o0UDRkWWV1SDVZcDdvcUg3SVM0MlRieGtjbDNaRjZIU3NYNjF6?=
 =?utf-8?B?VnNyN2NpWTNHL001UXdXejYzMk05cWxOSVg4WTJySDJPSGZvb3VHbmdoeitK?=
 =?utf-8?B?V3RJdkl6S2lrdU00bUVPY01MdlZiYnllc20xQ2lhNGpNUGNaQ3VPbml2RGRT?=
 =?utf-8?B?YVFKa0syTDBhTnpKZU9rdHlrUytwN0VZOStPMDlEN2h6RjhleVEzaVQ5VXBa?=
 =?utf-8?B?OFc1L2krRUJyM1FRTmlVYlF3K01hanJnK2MwZGNBRHRxeWRGSnVQazVGTWhZ?=
 =?utf-8?B?SmxvOUZ2YnRrT1Q1aVZZdmh5RUlHVFZhcjJERUo4TzRjeGZVUGJrOSsrNDBJ?=
 =?utf-8?B?Q1lxdXBOb1QvKytiRi9taE1nbHkwVmlKcmVJQmd4RVk1MFFud2FhREhUcmE0?=
 =?utf-8?B?TTJZbHIzY3BwNGIzczY5RWMvNGFpRlA3YnpTRjNIODNJeHU2Y25wTEkrSGI3?=
 =?utf-8?B?TUkzK2k5L2xFdWQwbEVLaUlMWUxaSzJrejZiMEJObTFHSjZwczl0ZzM1N3hl?=
 =?utf-8?B?cW5VT0gzTjRZZVVCeTF3Z3R0L3I3dEplVUpZeVViMjI3NlplKy9yWGZqVWo4?=
 =?utf-8?B?WUhwNXlIREZSQU16QUhEM1JENUxvbC9LZFMzekMyUFE3cUpKRUV2SHhEYkF0?=
 =?utf-8?B?b1EwcFF0NXc4bkRZUDRpVWQvQlh4OHJpOWk3QUFHUDA3cVRKM0VnTHdCdW9C?=
 =?utf-8?B?SUczVlN1eVVuUkZrSlNxYkxrNEZIQi95OUIraTFVWENYTFBaeEtlTCtlOWhW?=
 =?utf-8?B?TGkrUEM5VTJSemVpV1ZnSXdjaWU3djkxSzFhNENPMEw4djU0K3BzNmM1NUVF?=
 =?utf-8?B?aEFEU2hXeEpZNHZ2VmxVUVppTThhL2oyajBGREdDNnpSM0RDaWVFVXNlNGZo?=
 =?utf-8?B?OTYrdWhtTWdzOTgxdnpHYzJCeitJREFsR0V5WUxMKytmWVhmSWNSU1RsSlVx?=
 =?utf-8?B?dVpiaDhmRGFzckxmY29RQVpYNExGME1KUUlhcmhDQVNyYkRRZk9XZ0RkT2xU?=
 =?utf-8?B?QXJESC9MQWNVbHZ3RGpMQU1OTWNlVEhQSUVHdE9zb2hURkQwN09DbDhpamlz?=
 =?utf-8?Q?23uEt1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OThhTXRkQUx5U3Fkb003OWFEZ3poUXhPWW9jNWdUUW5hQnJtZ0NHbTlSU1lO?=
 =?utf-8?B?a0MwaUFMNkJ4aGc5aXJURmVmZ0EvdU9zc1ZoQ21XUFNDbWNaSmVJbWJLZzBN?=
 =?utf-8?B?cWN0UFZuT3BhdmhUQXh5a1VHVGNCQ05HeEY3UDBxWGo2NHZWV1JPaStvdndy?=
 =?utf-8?B?cTBzTk53Z1lJMnRIZkZOeHdRcWk3QklMbWQzZVlqSFZLUGJaZEF2VHEzZjNs?=
 =?utf-8?B?bmR2N0hzUFBCOXdPRFBWSU9QbHpjRnptUEordmlIQVMxb1RlYVAzWlBaRUxW?=
 =?utf-8?B?SmhkZUlIVkpoZStDQ0FpSHVGR2puWnl2NTkxcTNLeWhyL3NFcStXd3lGQk9v?=
 =?utf-8?B?bU13QnQwdkRQQUdIL0M3ZXVBQ1gwVDd3b0RpbzhaSHB2ZTNGeEhFR0JSSjI1?=
 =?utf-8?B?M0lUVWk5bzFrbGdnUVkweXJCZm9DUDJpNDJucUxzcVFxWDFYakVSYWpwZHM2?=
 =?utf-8?B?Mk4zaG9FMjhrbEhBMk56M1JRZEQ2TTB1dVFubldwOEdoSE1TUVNvSm9xNzU1?=
 =?utf-8?B?dEVhL2JXeXk5bXRoNzlXanBGQlBWeHJPQkhlemxYRmJvcE9hNmpDYnoyQjZx?=
 =?utf-8?B?VHltU2RIZzk1dVlrVDhIbHB3RnpBbzJwcEZjUFduZkhZV29DYmJudnM4MWtW?=
 =?utf-8?B?NzU2QUZOMlVBQ3A2aXZKZWg5S0JIRXN3UTBRQ0V4czUvcVBRMDhPakgxYkxU?=
 =?utf-8?B?ZVpMWmE4cFNyZzVjQWZrWUJCUVVEYWc1WTlrZm4rT1NJbzZqdDMyek94cWdW?=
 =?utf-8?B?NGlDSWF2K296UmZyRzhXTCswK29GelNJU1YwdDk1WWhlVmlhWVh3NmY5WVor?=
 =?utf-8?B?NExJMjhmZlhOQW1ZMGQ3a2JaV0VjTklGODJtVUN1YSt5QmszVk1DeWtuTW9C?=
 =?utf-8?B?WDIyTkVhckhUUUxvL2krM21RbnNXbjdwK1ExVDFodjRjaitJaXZTVVNpUjhE?=
 =?utf-8?B?V1pMTTlBMjFQaysray9jcFoxV2ZjM0FKQ0wvSVl5bmpvTW5ERVBoempqOGcv?=
 =?utf-8?B?S1dkNVJhS2MxTDZ1Ykdmb284a0dKamI5ZEw1S2ZHaEtTbDI5TFQrWEVkQmd2?=
 =?utf-8?B?SFl1OFJjVkw3dm5WV2NUMkJaTUYySUN4UXkzSytLMGovaGNGUTZQb0w2S0g5?=
 =?utf-8?B?TnI1czhGL216ZGUzU0Q2Z1RzQU9mYVVtZ0dHZHo0RytWWjBsZ1Z4clFtL3Nj?=
 =?utf-8?B?Z2d4QWpMZWk5dk9CVm85S05SK05QelZtVVlHdnh2U0hidVJBZG02QTdvNmN4?=
 =?utf-8?B?VjRsYmlzeEY3SzIrUUMyZ2VSR1NrbjJYYVJsTStjaHRmR2piVFdYQktNN2h6?=
 =?utf-8?B?ajdPZE4yZXBsNFM5Ym9jVUlVNG8vaHlXUVNSeHRrZXlJMngwZE5YamN2TStE?=
 =?utf-8?B?WkpKMmJuT2lrd0V1RkwzM0d4RmlKMmlYbjMrVmU0WGdieVZ5Y1RrQ25tMjhu?=
 =?utf-8?B?V2dRYm9xaDBaZFB4WDIzd0tUZkhKQnl3YlhpdDFXQ3paTW84M0JwL1BFK0Rk?=
 =?utf-8?B?Z09kWHR2TkJ4WjhvMytrSW13ZXlYN0tEaVNOdTdETENCUDN5cEtQRS84Wktq?=
 =?utf-8?B?c3IrOTFXR3QwRVdRZHB0anlFY05yeVhYWVFyMmZGeVlXMEFIdUFiWWtLY1pL?=
 =?utf-8?B?RkliZXRkZjduVytOTHFlSXZXeTdzcnhkZGVGRi9Ha0hvME1GdXJ1ZHphdkt6?=
 =?utf-8?B?TVMwcnlabUNRbnhvYk5rcFpaV0l4R2VvTi9BUm1CZ1FEMXhjVGovUHR6aHVD?=
 =?utf-8?B?VDh5SWJuVGpGMTZOelZvYzVaRGwxNkt2U1pVbGNjcEgwWmVUYUFsYjRXd0Nw?=
 =?utf-8?B?anpKeGw3TjRkaTRsQnU1WTNiKzZaSmhJWENwRGhEeTMvOEFBMHhFaWc5bHda?=
 =?utf-8?B?RUx5T3JZUkkrQm0xN1ZmYVl6ZzAvMk9pMlorcXZOWEF6cVBNbWJOQkVxWDBP?=
 =?utf-8?B?SWpLakwyU3MwY2pnNkNrbTdjZ3YyL3YvVjEyRDRwZURiemNDTzMyVGIxcGM5?=
 =?utf-8?B?cTFqaWZQV0dVUldqNmFLUXhOQitvNmtURWRPWHNYdk1RdVRQdFM1Ti8zQjV6?=
 =?utf-8?B?VWQ0Rk1jYjdSOHNkcUtNaDZvYXpQY2puWVlIYnlBZEs0NWUvSGdCZnUxa290?=
 =?utf-8?B?MWlpeFlnVG9mQVR0cDFXQTFyY0xTdGZYcHNTT2tBYjVpTGtQbFJhVms3YUJ6?=
 =?utf-8?B?NVE9PQ==?=
Content-ID: <CC284E312BE0BA40BC412D0F1A932480@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc696cc7-3de7-4f46-8010-08de10740d82
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 07:32:56.1605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CLPnIhmMmjGPcPOwDWeQhzSwXLACasGQ7Xb4wC4Ymu8muqrc781dkaV1JWUn/UHha0yI9GOgG/zbkJqpzBjvMjd1U/DNLCz1B7CmZ9cSJaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7347
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1866539162.763459421"
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

--__=_Part_Boundary_009_1866539162.763459421
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTEwLTIwIGF0IDEzOjQ4ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IEhpIEphc29uLUpILA0KPiBPbiAyMDI1LTEwLTEzIGF0IDAx
OjEzOjEyICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+ID4gQWRkIGFuIGlzX2ludGVsX2Rl
dmljZSgpIGNoZWNrIGJlZm9yZSBpbnZva2luZyBJbnRlbC1zcGVjaWZpYw0KPiA+IHJlcXVpcmVt
ZW50cyBpbiB0aGUgcGxhbmFyLXNldHRpbmdzIHRlc3QuDQo+ID4gVGhpcyBhbGxvd3MgdGhlIHRl
c3QgdG8gcnVuIG9uIG5vbi1JbnRlbCBkZXZpY2VzIGJ5IHNraXBwaW5nDQo+ID4gSW50ZWwtb25s
eSBwaXhlbCBmb3JtYXQgc2V0dGluZ3MgY2hlY2tzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IEphc29uLUpIIExpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEkgbWVyZ2Vk
IHlvdXIgcGF0Y2hlcyAyLDMsNCBzbyBubyBuZWVkIGZvciByZXNlbmRpbmcgdGhlbQ0KPiBpbiB0
aGlzIHNlcmllcy4NCj4gDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQoNClRoYW5rcyBmb3IgeW91ciBi
aWcgaGVscCENCkknbGwgc2VuZCB0aGUgbmV4dCB2ZXJzaW9uIGZvciBwYXRjaCAxLCA1KHNlcGFy
YXRlZCksIDYgc29vbi4NCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0KDQo+IA0KPiA+IC0tLQ0K
PiA+IMKgdGVzdHMva21zX3BsYW5lLmMgfCA4ICsrKysrLS0tDQo+ID4gwqAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS90ZXN0cy9rbXNfcGxhbmUuYyBiL3Rlc3RzL2ttc19wbGFuZS5jDQo+ID4gaW5kZXggZjdiNjcy
YzdhMDFlLi44ZGFjNDFiMjRiMzMgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMva21zX3BsYW5lLmMN
Cj4gPiArKysgYi90ZXN0cy9rbXNfcGxhbmUuYw0KPiA+IEBAIC0xMjU2LDkgKzEyNTYsMTEgQEAg
c3RhdGljIHZvaWQgdGVzdF9wbGFuYXJfc2V0dGluZ3MoZGF0YV90DQo+ID4gKmRhdGEpDQo+ID4g
wqDCoMKgwqDCoMKgICogY2hhbmdlZCB0byBpZiguLikNCj4gPiDCoMKgwqDCoMKgwqAgKi8NCj4g
PiDCoMKgwqDCoMKgIGlndF9yZXF1aXJlX2YoZGF0YS0+ZGlzcGxheS5pc19hdG9taWMsICJBdG9t
aWMgbW9kZS1zZXQgbm90DQo+ID4gc3VwcG9ydGVkXG4iKTsNCj4gPiAtwqDCoMKgwqAgaWd0X3Jl
cXVpcmVfaW50ZWwoZGF0YS0+ZHJtX2ZkKTsNCj4gPiAtwqDCoMKgwqAgZGV2aWQgPSBpbnRlbF9n
ZXRfZHJtX2RldmlkKGRhdGEtPmRybV9mZCk7DQo+ID4gLcKgwqDCoMKgIGlndF9yZXF1aXJlKGlu
dGVsX2Rpc3BsYXlfdmVyKGRldmlkKSA+PSA5KTsNCj4gPiArwqDCoMKgwqAgaWYgKGlzX2ludGVs
X2RldmljZShkYXRhLT5kcm1fZmQpKSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
Z3RfcmVxdWlyZV9pbnRlbChkYXRhLT5kcm1fZmQpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZGV2aWQgPSBpbnRlbF9nZXRfZHJtX2RldmlkKGRhdGEtPmRybV9mZCk7DQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZ3RfcmVxdWlyZShpbnRlbF9kaXNwbGF5X3ZlcihkZXZp
ZCkgPj0gOSk7DQo+ID4gK8KgwqDCoMKgIH0NCj4gPiANCj4gPiDCoMKgwqDCoMKgIG91dHB1dCA9
IGlndF9nZXRfc2luZ2xlX291dHB1dF9mb3JfcGlwZSgmZGF0YS0+ZGlzcGxheSwNCj4gPiBwaXBl
KTsNCj4gPiDCoMKgwqDCoMKgIGlndF9yZXF1aXJlKG91dHB1dCk7DQo+ID4gLS0NCj4gPiAyLjQz
LjANCj4gPiANCg0K

--__=_Part_Boundary_009_1866539162.763459421
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMTAtMjAmIzMyO2F0
JiMzMjsxMzo0OCYjMzI7KzAyMDAsJiMzMjtLYW1pbCYjMzI7S29uaWVjem55JiMzMjt3cm90ZToN
CiZndDsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2Um
IzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0
dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYj
MzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsN
CiZndDsmIzMyOw0KJmd0OyYjMzI7SGkmIzMyO0phc29uLUpILA0KJmd0OyYjMzI7T24mIzMyOzIw
MjUtMTAtMTMmIzMyO2F0JiMzMjswMToxMzoxMiYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSCYjMzI7
TGluJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO0FkZCYjMzI7YW4mIzMyO2lzX2ludGVs
X2RldmljZSgpJiMzMjtjaGVjayYjMzI7YmVmb3JlJiMzMjtpbnZva2luZyYjMzI7SW50ZWwtc3Bl
Y2lmaWMNCiZndDsmIzMyOyZndDsmIzMyO3JlcXVpcmVtZW50cyYjMzI7aW4mIzMyO3RoZSYjMzI7
cGxhbmFyLXNldHRpbmdzJiMzMjt0ZXN0Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7VGhpcyYjMzI7YWxs
b3dzJiMzMjt0aGUmIzMyO3Rlc3QmIzMyO3RvJiMzMjtydW4mIzMyO29uJiMzMjtub24tSW50ZWwm
IzMyO2RldmljZXMmIzMyO2J5JiMzMjtza2lwcGluZw0KJmd0OyYjMzI7Jmd0OyYjMzI7SW50ZWwt
b25seSYjMzI7cGl4ZWwmIzMyO2Zvcm1hdCYjMzI7c2V0dGluZ3MmIzMyO2NoZWNrcy4NCiZndDsm
IzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0phc29u
LUpIJiMzMjtMaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtJJiMzMjttZXJnZWQmIzMyO3lvdXImIzMyO3BhdGNoZXMmIzMyOzIsMyw0
JiMzMjtzbyYjMzI7bm8mIzMyO25lZWQmIzMyO2ZvciYjMzI7cmVzZW5kaW5nJiMzMjt0aGVtDQom
Z3Q7JiMzMjtpbiYjMzI7dGhpcyYjMzI7c2VyaWVzLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZWdh
cmRzLA0KJmd0OyYjMzI7S2FtaWwNCg0KVGhhbmtzJiMzMjtmb3ImIzMyO3lvdXImIzMyO2JpZyYj
MzI7aGVscCENCkkmIzM5O2xsJiMzMjtzZW5kJiMzMjt0aGUmIzMyO25leHQmIzMyO3ZlcnNpb24m
IzMyO2ZvciYjMzI7cGF0Y2gmIzMyOzEsJiMzMjs1KHNlcGFyYXRlZCksJiMzMjs2JiMzMjtzb29u
Lg0KDQpSZWdhcmRzLA0KSmFzb24tSkgmIzMyO0xpbg0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZn
dDsmIzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7dGVzdHMva21zX3BsYW5lLmMmIzMy
O3wmIzMyOzgmIzMyOysrKysrLS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsxJiMzMjtmaWxl
JiMzMjtjaGFuZ2VkLCYjMzI7NSYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzMmIzMyO2RlbGV0aW9u
cygtKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdp
dCYjMzI7YS90ZXN0cy9rbXNfcGxhbmUuYyYjMzI7Yi90ZXN0cy9rbXNfcGxhbmUuYw0KJmd0OyYj
MzI7Jmd0OyYjMzI7aW5kZXgmIzMyO2Y3YjY3MmM3YTAxZS4uOGRhYzQxYjI0YjMzJiMzMjsxMDA2
NDQNCiZndDsmIzMyOyZndDsmIzMyOy0tLSYjMzI7YS90ZXN0cy9rbXNfcGxhbmUuYw0KJmd0OyYj
MzI7Jmd0OyYjMzI7KysrJiMzMjtiL3Rlc3RzL2ttc19wbGFuZS5jDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtAQCYjMzI7LTEyNTYsOSYjMzI7KzEyNTYsMTEmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO3ZvaWQm
IzMyO3Rlc3RfcGxhbmFyX3NldHRpbmdzKGRhdGFfdA0KJmd0OyYjMzI7Jmd0OyYjMzI7KmRhdGEp
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzMyOyomIzMyO2NoYW5nZWQmIzMyO3RvJiMzMjtpZiguLikNCiZndDsmIzMyOyZndDsmIzMyOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7Ki8NCiZndDsmIzMyOyZndDsm
IzMyOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7aWd0X3JlcXVpcmVfZihkYXRh
LSZndDtkaXNwbGF5LmlzX2F0b21pYywmIzMyOyZxdW90O0F0b21pYyYjMzI7bW9kZS1zZXQmIzMy
O25vdA0KJmd0OyYjMzI7Jmd0OyYjMzI7c3VwcG9ydGVkJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMy
OyZndDsmIzMyOy0mIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO2lndF9yZXF1aXJlX2ludGVs
KGRhdGEtJmd0O2RybV9mZCk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstJiMxNjA7JiMxNjA7JiMxNjA7
JiMxNjA7JiMzMjtkZXZpZCYjMzI7PSYjMzI7aW50ZWxfZ2V0X2RybV9kZXZpZChkYXRhLSZndDtk
cm1fZmQpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7LSYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7
aWd0X3JlcXVpcmUoaW50ZWxfZGlzcGxheV92ZXIoZGV2aWQpJiMzMjsmZ3Q7PSYjMzI7OSk7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtpZiYjMzI7KGlz
X2ludGVsX2RldmljZShkYXRhLSZndDtkcm1fZmQpKSYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7
KyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMzI7aWd0X3JlcXVpcmVfaW50ZWwoZGF0YS0mZ3Q7ZHJtX2ZkKTsN
CiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO2RldmlkJiMzMjs9JiMzMjtp
bnRlbF9nZXRfZHJtX2RldmlkKGRhdGEtJmd0O2RybV9mZCk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsr
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMxNjA7JiMxNjA7JiMzMjtpZ3RfcmVxdWlyZShpbnRlbF9kaXNwbGF5X3ZlcihkZXZpZCkm
IzMyOyZndDs9JiMzMjs5KTsNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsm
IzE2MDsmIzMyO30NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtvdXRwdXQmIzMyOz0mIzMyO2lndF9nZXRfc2lu
Z2xlX291dHB1dF9mb3JfcGlwZSgmYW1wO2RhdGEtJmd0O2Rpc3BsYXksDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtwaXBlKTsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MTYwOyYjMzI7aWd0X3JlcXVpcmUob3V0cHV0KTsNCiZndDsmIzMyOyZndDsmIzMyOy0tDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsyLjQzLjANCiZndDsmIzMyOyZndDsmIzMyOw0KDQoNCjwvcHJlPg0KPC9w
PjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioq
IE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0K
VGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRp
bmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBw
cml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBw
bGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhl
IGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3Ry
aWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChp
bmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5v
dCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRo
YXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRl
bGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBh
dHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNv
bnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9w
cmU+PCEtLX0tLT4=

--__=_Part_Boundary_009_1866539162.763459421--

