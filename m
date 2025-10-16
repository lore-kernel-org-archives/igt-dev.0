Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8024CCD185
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 04:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B6C10E2C6;
	Thu, 16 Oct 2025 04:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="DiDsRntH";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="A3zR+qIg";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D76610E2C6
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 04:11:51 +0000 (UTC)
X-UUID: 3a0faa4caa4611f0ae1e63ff8927bad3-20251016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=svNn32vzM8ai+47m6nJFhHYlTwhBNW+PZNxygLHIVTs=; 
 b=DiDsRntHaNhWcQGccRz8ucBT8kdot/rqseK8VKP+jM2eZ6s2ViRioWurZF1aqYe6Ues2XZcJmXXoSAa02ypw3HCnCN6BgnW+hT73z0ul4ueAkFyHCrORIvVnqn9RDNRWXXmGfkJMJcDcsuIM9odS+qw2V08IrgHQkgKS0SDme6k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:e8f07d1d-9733-4859-9177-d0fe670f2b7e, IP:0,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-5
X-CID-META: VersionHash:a9d874c, CLOUDID:d8291d51-c509-4cf3-8dc0-fcdaad49a6d3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
 BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3a0faa4caa4611f0ae1e63ff8927bad3-20251016
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1095084771; Thu, 16 Oct 2025 12:11:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 16 Oct 2025 12:11:43 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 16 Oct 2025 12:11:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ehv/pcuUhXARgAt5Oj/SpaOpGMgSO8uYrNEI1Q3orU5jNBE7soRPJ1O6khJQuuDcG/ysXg9emL+L9DWv/aE/iTFyCPZtdAnioU182nqCK30kdOpKeclk1Sen2C+2X6SJUtnv8m+Ta79ERXiZkTEGI19vzzaWvEU1nH9ChbizbP8pwgNSlQFYQdMB9v1iT4jVrVbjhGV/64PLM/Toj5k0MSRwH2eB0wno/HbaO3bo2pqf/vnVN+sfeMZsN34/W1/0j50n2/Q5d+JXo669shS+/rOIHbWpH/7Z1zdp0Bicsl9mwI6YQ70WlcSYRv+wN7OJ7v83Y17C4G21ojdrlT0Ccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4P6kX0wQOLE/SxgZk03g7Mug9UDvgKznzoT2jtCWV0A=;
 b=R7iSUi1A6xqLn9nB9+H6OU3eGFRloLY6FIZJu5ptkn6lFlCZ5tDnFKmyOGl0N5yj/Y/B3mV6+kD1liExI1c2IMO4C95JI8X6iN1PL75/rnHSBZfTTeoI7L1BImbiw0I/sVWMDgdfgWsNOwf30BSMWR23j+NqkcJ8yV81tF4OzvFhgv5InkkNKbr43TxZ2JjRBQOyhN2BYYAEa9nmoKRbCT9Jae4l4pLWjxJ+uvY2D1Ete8kepYnT30gr77/eSvTL3GEQuNrS4wNsgMyA8JvsXzz41ACSvlapUTvfQfCoCoJtS3owDlJVZYYERRsr7jPEbJJYTl4iUbJybFIkOqC8eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4P6kX0wQOLE/SxgZk03g7Mug9UDvgKznzoT2jtCWV0A=;
 b=A3zR+qIgCCBwKCLCrcEoMqxRQA9eccmFFt2wEAnpDS7oxMBDaLm9ZyUvAde/nT5jgKYLy9rsglkInoZag1hMf7sY91vkvrwI55s0vQfUKbZgi2ukXyNf4RTsqG2+Uu2POFSW9zfIpiamxTKQqXyyi4++vmFo6e+rXUGFnulBH8I=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB7703.apcprd03.prod.outlook.com (2603:1096:101:132::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 04:11:38 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 04:11:38 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t 0/6] Add MediaTek devices support
Thread-Topic: [PATCH i-g-t 0/6] Add MediaTek devices support
Thread-Index: AQHcO5vEqU++xiOk0ki3xS0l3FvR+rTELraA
Date: Thu, 16 Oct 2025 04:11:37 +0000
Message-ID: <1fe5cad9c4fe83c20cbc86135fab174d4055e0b4.camel@mediatek.com>
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB7703:EE_
x-ms-office365-filtering-correlation-id: 7d5cc502-be42-42d3-aa75-08de0c6a1a3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZVpBeGhFeU9VQzJzUjhxaitNb0tiRjVYNHdGRzdScTJLR2ptY2J1OS9lZVVx?=
 =?utf-8?B?OTRKNGdXU3J4RWd3SnNuK011NHVNSDE3VktYbUQ5VE93aUVJUlgyUFRORHYv?=
 =?utf-8?B?cjV3WmVscHVaeVpoZWpQa1FGdkZaK0JjSkhGY1dVeS9qdjhKZ09nMmVpWGZM?=
 =?utf-8?B?KzIzZ3VGUVVkcWZKTUU0aGJtSWFxOU4vL1ovUUNUMG1CQUhqOUh2ZnZDYmo0?=
 =?utf-8?B?VzFoNElnRUhSVWFma2pyMmZZQzE1dnphS25HalErZWJVOHg0RjJyaHd3QlBm?=
 =?utf-8?B?cmxLWHRTZlJuMnJoWkFCd2hFOElZNkFQdytCWGYySHVtdnd4aVg4dnVWcVAy?=
 =?utf-8?B?V3Vwd1RObm11TmJMVnRLa1BKRlpIc0JaUVQzU0JBa0N5NGh2dk1oK0p2YUYr?=
 =?utf-8?B?MG1IV2JqQTZLbzlTOWVsYWxJczJ5K3llVmhjaGgwKy81RjNFenQ2dTNqaGJM?=
 =?utf-8?B?UGFhcGRBalc1RDBpV0kzL3dnbXRrcFVyZzBuL2VLNFZxSTJnZndmMU5aRGFF?=
 =?utf-8?B?WEJCR1Jtek5mQzdtUXExZ2k2QlRiS2NLUExjSE1mT3VLR1I4SDlGVmhUMUUz?=
 =?utf-8?B?TmpnNURJTU5PeEh5Qnk5OHByVCswaXBsaURtajF3MUlON2wyVWo3K01PS2pq?=
 =?utf-8?B?NU53c3ZCajkzRHUrSG8xdDgyMGE2UDRtQU5oVnVmajFjc3RrZmJnZWdyK2xV?=
 =?utf-8?B?T29SbzllVVIraTgyUS8vcmNSTkcrT3FQM0FuQVZLdm8wT0tQVWtNcDBkemJ4?=
 =?utf-8?B?dnY5QkVOcTRub0QxNFZXMFc1ZktQaFBVbmtjcElwOFpjai9UQXpzb0hVNEpS?=
 =?utf-8?B?c1lvdC95VU5DS3ZRVlhRQzdsR3o4dE81MUxnOVpnTkVrN3BIU0IyZG1hR2tW?=
 =?utf-8?B?bXhEcXRzemZxb1E0NDJ4OHVVWG9WcWVKZnVBdlQyWlgzZ1FmOUtwSHcvUVVW?=
 =?utf-8?B?NnJpVGhmZ0JlanVrWXBlRzlUWWhTdzZhdEI3UldqQUpnM1RIaEQ1N0YxeFAx?=
 =?utf-8?B?cFJrU09LRXhxNWYzbUU2Rm1tVGJ4Mkx6c3lQV1N4dmIvUGQvZ0RISjBRMmFx?=
 =?utf-8?B?UThHUmF4bGhvMjVLQlVaTkhGOEYwQm9KZ2ExOXRIdWFBZnQ0M0w4a1lXckVy?=
 =?utf-8?B?dEZmYnk5WWtsUlpoa1FENWZhdmJ6RW14bkNKRXFuVXZPTC9vMVpielpKZVEx?=
 =?utf-8?B?YkozOWlZV3EyM0NRZ1J5TGFEYUtHa0NUeFdWeVVjZlFMb0xISjMxam80cEtT?=
 =?utf-8?B?NGFGWkhXa2IybVNKNHVWM3hDbFVGbk9WRWdHU1l2UWE1cW5paFJHMXJPYzlP?=
 =?utf-8?B?TnRJVHlsK0tKQVpvUlhrUWJYeERSWjJQT3hPODNxaGFEQVZxaUtGaXRrd2sz?=
 =?utf-8?B?dUhiejFoeWJ5RWJyQmxuL2x1bkNqSDUrYjFKRjlNTFZWZWVZaFVaeE00MXFD?=
 =?utf-8?B?cS9IOGxmUkpLK0k0L0tVV0Z5SmVjSnc3TzZlbE4xa21Ecjc0TGl2MUJjY1NF?=
 =?utf-8?B?SHNncy96Z25FWENMaURFWTl0US9qVHo5VCtRdVBkbXYzdTV3QWVoVEErQnMx?=
 =?utf-8?B?dkFRMGNTaHRHRXR0RGI5cWtWTGNiL25SMjBJamJ6MUxuLzhZbDkvVnZSODY3?=
 =?utf-8?B?Y281WGU4cXVJSmZEWjJPLzBxQUcrMUN2UVA2ak9zbTQ0NmF4Uk0rQlFoS3JQ?=
 =?utf-8?B?a0IyeUx1TlYxQ3hSeGhJbk1rUWZwV1RyeVhWNVdEUGhqcEVpa1BKMmQ4aHFF?=
 =?utf-8?B?TkNXV3FucG9FOUlXMzBNZUppdkUrdGtBNXZHZ3hEZW9uUXhiS2pFY2pZd1hB?=
 =?utf-8?B?RGtvcnNxYmNERVViMVJ2QWJMRWVaZzJVb2dQUzZtanlXS2xMenRvUm1iQzFG?=
 =?utf-8?B?L0tvTTFYdlZqeDU4cnRpeXFXcFAxU3RJbEVmVjM4cTJuVVZLTThxMERCaXBw?=
 =?utf-8?B?N3A1cUNMNmdWMCtMaWNDNGgxZmt0MVVwcDIyUkY1dTF2Q1lLTjlQSEF4Mi9J?=
 =?utf-8?B?czg2V1d4TWFtSHB0TituSnBKeVdtTC9BSHFua05wODhSWkh2YXdKaUoyMHJN?=
 =?utf-8?Q?+JnwPB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STFvR3lWMmhNNjBGbnB0bE9JVDE1SjZiV2wwem5tSGRJM1V4MDByTWVCWHR4?=
 =?utf-8?B?YkJ3clo4dERGa2dnZXJNTTNnYVYwT29oTnJ3dVRIcGZjaG1Fd0pCYk0xYlBR?=
 =?utf-8?B?WHBuS3VQcUpzNGp4U2tTb0hpVFBtc2R5WGNWRGZYRHJOL2ZUcmpIWHBUTHpu?=
 =?utf-8?B?ZEY4UktkQUpTcGN5dy9lTENNelA3djZmeUpwS05uV3NoSVVBbVlwbndhbHFx?=
 =?utf-8?B?RDc3Qy9aTG1neVBWUTRTRGZSNDRMSHAza1E3b2JOSWRaQVdvakg2K3dRSUhM?=
 =?utf-8?B?YXZybjJWRG84aVB5RHhFWTdMUnZSNGNWU2kyQ1d2RDFLSjhLejRyNkhLT3Bk?=
 =?utf-8?B?bEhSOVNnQVJLc0tjUXdSUzEvSHNodTJFRzJBL1BMVGRQWDdwREQxQjllczZJ?=
 =?utf-8?B?dWRrUy85a1pvS2xrZmk1TENVZWk0RWovOEk3emFNRUtrWGVHUVNFWmxrRzVZ?=
 =?utf-8?B?S1B0L0NHU241MVViZER3d3BrcUVpVEsvLzk4SUpSM1VvYTkrNG9Vd1kzZnoz?=
 =?utf-8?B?eDdHNHE1R2Y5WXBZRmczVTNpb1ViRkRVWlVNMHlKZWNjMFhNaE5IRmFaV3ZX?=
 =?utf-8?B?UlRsQzJQMnErb1pnN2EycEZNdFA1eVlvQjBMcncxV1JSZ3RQcU9XbkZ1YU1J?=
 =?utf-8?B?U2hiV29qTE8zVFhHR1Z1MTRVQVZHdmtEQ3JoMmFxcjV2RXFubXMwaDhLbmVI?=
 =?utf-8?B?Q0VqVlJ0SCt1YlBnR3pzM1VSUWl3QWtLbEsweHlydCtkckh0L1BONVRpR3dn?=
 =?utf-8?B?bldGVzNCR1A3aExJZEZhN01NKzJKZld6eWdFdk5jUGtjM2RKNE1aRmxhR2ps?=
 =?utf-8?B?MXIwRExhYnp6L2VzZ0hxTG9BRlhyRjc5akYxZ3hmQ1ZrelVCNENIKzNadlhW?=
 =?utf-8?B?Zi90c2lMN0VzN1RoTDFXL0xUL3p1clRkR29tZEIxRXppbGRNYy9rVDJHSDgz?=
 =?utf-8?B?akR1ZE53akVIS0FwRjN1bUdpU29ueSs1eXZPblBhb1BrWmhIWnVTL0VMc1pu?=
 =?utf-8?B?L21GMDBRb2JQSW1xTW1EMjUyeTBIbFJZQ1pZR2NOMFJpeWdmY0h3blJEQkU2?=
 =?utf-8?B?TFE1M2owV01DaW1hK05ySWxxS2JscUR1cFlicFEzMzMxMkZZQlRCY29TdVhJ?=
 =?utf-8?B?OUpMdHVpK2NpTERHME5PdFVOakpFcjhHUzVBeE9iNHBNbTZGOXd5d0dzb2FW?=
 =?utf-8?B?eTVuZ3AvVVhCWSs1a2VXNUlrRW0zczNGMTg0NEVBeW9uaWo5NlVvRFo4MDV0?=
 =?utf-8?B?bjlIZVZpQ0NjbXNoSGVsUFlxZ2tydVJVd0grNitRbUZCeXR0djR6VWVOa1o0?=
 =?utf-8?B?M0ZsTTVVY1p1WTVwckpuY09PdmRmSGFpM2E0L2gzNy9vUzNrZVQvMXE0Q2VN?=
 =?utf-8?B?bjdZZGMyVGZZRDFrY0FzK2xhZElHeEhBNVV4bnB0Skd6SnlLTks3NjZPUE9q?=
 =?utf-8?B?L1Q2MnhaN1pNMWkzRUNZUXh4R1FYZTdOYjFXbUNzNmg0TU9nLzRCOWdTTHcw?=
 =?utf-8?B?ZVUvT1VuS2xWSEk5MDg4U2gyOC9lK2V1bjI3SHM3MTFsRGZmN2J3UGdyTVBB?=
 =?utf-8?B?Y3daVkhjcVhkMjhUWDVXUkRrK2NYWUtjVHJ3bG9yZVdzemU4SXBPZzAwRy9J?=
 =?utf-8?B?T2VkVUl2U25nbEl3YXcvelc2cmVUbmpCMklEbVU5RDBqaTlzUHp5Rk5yNVFH?=
 =?utf-8?B?R0JjYmgvMGFOVmptRm43Q3pxZEprNEtTSDJOKzYwejlGeVpnTFJCQnU3eHpv?=
 =?utf-8?B?eW1SbTd0Z2xFbkhoSWhUaHVFNWRwWDBKZWFqZ01INk5RcFlUT3cvR2JiMXVo?=
 =?utf-8?B?ZDA4R29ZMjVxUlpCYVZabjB5OGZ0RzZxcTVpMkhaV3pVK3dRVkZPam1LSW1n?=
 =?utf-8?B?U2k5Qzg1c3VJSHlrMEFzZmtUZlZWN2lpWkh6aWlpWU5KeWF5VFJpbEpFT1pF?=
 =?utf-8?B?aFY3ZTIrejduVjRDME1SOUxCN3VDKzNqYlB0MkFDcVA1L1hPV2FDbDFsS1Vv?=
 =?utf-8?B?TlZlN05IMVc3Y05Bbk1CY0ZMb2x0eG1xLy9nQzdwam0vblM2b1dvYXN5SFgx?=
 =?utf-8?B?ZzQyYXovZjRYdFZrZi9KZlFFbnFUYVgrVEk2ZlZYeHVQa20xaVZBYnJVWmlN?=
 =?utf-8?B?TE9uV3Rwdnp3eW1hSmtsVC9HY1JGT1VjMzM5a2ozS05wbkM5VDJjRDJtRTJE?=
 =?utf-8?B?Y1E9PQ==?=
Content-ID: <E855B089196AE94AB7EB467BB3B8CA8D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5cc502-be42-42d3-aa75-08de0c6a1a3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 04:11:37.9412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yP0aSgTstl0S+Ad5JezJprkwGmhbjVGbA80WmQ1IV7BYGgD8yIUROTw+1kxozuUdVrjlC30pMEmGux1o1cN4aGvgNc3qcpn/mn6X2p1gFnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7703
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1740998050.1043561355"
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

--__=_Part_Boundary_007_1740998050.1043561355
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2FtaWwsIEp1aGEtUGVra2EsIEJoYW51cHJha2FzaCwNCg0KQ291bGQgeW91IHBsZWFzZSB0
YWtlIGEgbW9tZW50IHRvIHJldmlldyB0aGlzIHNlcmllcz8NCllvdXIgZ3VpZGFuY2Ugd2lsbCBi
ZSB2ZXJ5IHZhbHVhYmxlLiBUaGFua3MhDQoNClJlZ2FyZHMsDQpKYXNvbi1KSCBMaW4NCg0KT24g
TW9uLCAyMDI1LTEwLTEzIGF0IDAxOjEzICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+IFRo
aXMgcGF0Y2ggc2VyaWVzIGlzIGFpbWVkIGF0IGV4dGVuZGluZyBJR1QgR1BVIFRvb2xzIHN1cHBv
cnQgZm9yDQo+IE1lZGlhVGVrIGRldmljZXMuIFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBhcmUgaW5j
bHVkZWQ6DQo+IA0KPiAtIFZhcmlvdXMgdGVzdCBjYXNlIGltcHJvdmVtZW50cyB0byBhbGxvdyBl
eGVjdXRpb24gb24gTWVkaWFUZWsgU29Dcw0KPiAtIE1lZGlhVGVrLXNwZWNpZmljIGhhbmRsaW5n
IGZvciBkZWJ1Z2ZzLCBzdXNwZW5kIHRlc3RzLCBhbmQgcGl4ZWwNCj4gZm9ybWF0DQo+IMKgIHJl
cXVpcmVtZW50cw0KPiAtIEltcHJvdmVtZW50cyB0byBFRElEIHBhcnNpbmcgYW5kIGNvbnRlbnQg
cHJvdGVjdGlvbiBsb2dpYyBmb3INCj4gYmV0dGVyDQo+IMKgIGNyb3NzLXBsYXRmb3JtIGNvbXBh
dGliaWxpdHkNCj4gDQo+IEphc29uLUpIIExpbiAoNik6DQo+IMKgIHRlc3RzL2ttc19oZHI6IFVz
ZSBvcmlnaW5hbCA1MTJ4NTEyIGZiIHNpemUgb24gZGV2aWNlcyB3aXRob3V0DQo+IHNjYWxlcg0K
PiDCoCB0ZXN0cy9rbXNfcGxhbmU6IEFkZCBzdXBwb3J0IGZvciBwbGFuYXItc2V0dGluZ3Mgb24g
bm9uLUludGVsDQo+IGRldmljZXMNCj4gwqAgdGVzdHMva21zX3BpcGVfY3JjX2Jhc2ljOiBVc2Ug
U1VTUEVORF9URVNUX0RFVklDRVMgZm9yIE1lZGlhVGVrDQo+IMKgwqDCoCBkZXZpY2VzDQo+IMKg
IGxpYi9pZ3Rfa21zOiBBZGQgc3VwcG9ydCBmb3IgbXRrX2N1cnJlbnRfYnBjIGRlYnVnZnMgaW4g
YnBjLXN3aXRjaA0KPiDCoMKgwqAgdGVzdA0KPiDCoCB0ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0
aW9uOiBBZGQgTWVkaWFUZWsgZGV2aWNlIHN1cHBvcnQNCj4gwqAgbGliL2lndF9lZGlkOiBGaXgg
bW9uaXRvciBuYW1lIHBhcnNpbmcgYW5kIHRyaW0gRURJRCBzdHJpbmcgcGFkZGluZw0KPiANCj4g
wqBsaWIvaWd0X2VkaWQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTMgKysr
KysrKysrKy0tLQ0KPiDCoGxpYi9pZ3Rfa21zLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCAyICsrDQo+IMKgdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5jIHwgMTEg
KysrKysrKysrKysNCj4gwqB0ZXN0cy9rbXNfaGRyLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDYgKysrKystDQo+IMKgdGVzdHMva21zX3BpcGVfY3JjX2Jhc2ljLmPCoMKgwqDC
oCB8wqAgOCArKysrKysrLQ0KPiDCoHRlc3RzL2ttc19wbGFuZS5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDggKysrKystLS0NCj4gwqA2IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KDQo=

--__=_Part_Boundary_007_1740998050.1043561355
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0thbWlsLCYjMzI7SnVoYS1QZWtrYSwmIzMy
O0JoYW51cHJha2FzaCwNCg0KQ291bGQmIzMyO3lvdSYjMzI7cGxlYXNlJiMzMjt0YWtlJiMzMjth
JiMzMjttb21lbnQmIzMyO3RvJiMzMjtyZXZpZXcmIzMyO3RoaXMmIzMyO3NlcmllcyYjNjM7DQpZ
b3VyJiMzMjtndWlkYW5jZSYjMzI7d2lsbCYjMzI7YmUmIzMyO3ZlcnkmIzMyO3ZhbHVhYmxlLiYj
MzI7VGhhbmtzIQ0KDQpSZWdhcmRzLA0KSmFzb24tSkgmIzMyO0xpbg0KDQpPbiYjMzI7TW9uLCYj
MzI7MjAyNS0xMC0xMyYjMzI7YXQmIzMyOzAxOjEzJiMzMjsrMDgwMCwmIzMyO0phc29uLUpIJiMz
MjtMaW4mIzMyO3dyb3RlOg0KJmd0OyYjMzI7VGhpcyYjMzI7cGF0Y2gmIzMyO3NlcmllcyYjMzI7
aXMmIzMyO2FpbWVkJiMzMjthdCYjMzI7ZXh0ZW5kaW5nJiMzMjtJR1QmIzMyO0dQVSYjMzI7VG9v
bHMmIzMyO3N1cHBvcnQmIzMyO2Zvcg0KJmd0OyYjMzI7TWVkaWFUZWsmIzMyO2RldmljZXMuJiMz
MjtUaGUmIzMyO2ZvbGxvd2luZyYjMzI7Y2hhbmdlcyYjMzI7YXJlJiMzMjtpbmNsdWRlZDoNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7LSYjMzI7VmFyaW91cyYjMzI7dGVzdCYjMzI7Y2FzZSYjMzI7aW1w
cm92ZW1lbnRzJiMzMjt0byYjMzI7YWxsb3cmIzMyO2V4ZWN1dGlvbiYjMzI7b24mIzMyO01lZGlh
VGVrJiMzMjtTb0NzDQomZ3Q7JiMzMjstJiMzMjtNZWRpYVRlay1zcGVjaWZpYyYjMzI7aGFuZGxp
bmcmIzMyO2ZvciYjMzI7ZGVidWdmcywmIzMyO3N1c3BlbmQmIzMyO3Rlc3RzLCYjMzI7YW5kJiMz
MjtwaXhlbA0KJmd0OyYjMzI7Zm9ybWF0DQomZ3Q7JiMzMjsmIzE2MDsmIzMyO3JlcXVpcmVtZW50
cw0KJmd0OyYjMzI7LSYjMzI7SW1wcm92ZW1lbnRzJiMzMjt0byYjMzI7RURJRCYjMzI7cGFyc2lu
ZyYjMzI7YW5kJiMzMjtjb250ZW50JiMzMjtwcm90ZWN0aW9uJiMzMjtsb2dpYyYjMzI7Zm9yDQom
Z3Q7JiMzMjtiZXR0ZXINCiZndDsmIzMyOyYjMTYwOyYjMzI7Y3Jvc3MtcGxhdGZvcm0mIzMyO2Nv
bXBhdGliaWxpdHkNCiZndDsmIzMyOw0KJmd0OyYjMzI7SmFzb24tSkgmIzMyO0xpbiYjMzI7KDYp
Og0KJmd0OyYjMzI7JiMxNjA7JiMzMjt0ZXN0cy9rbXNfaGRyOiYjMzI7VXNlJiMzMjtvcmlnaW5h
bCYjMzI7NTEyeDUxMiYjMzI7ZmImIzMyO3NpemUmIzMyO29uJiMzMjtkZXZpY2VzJiMzMjt3aXRo
b3V0DQomZ3Q7JiMzMjtzY2FsZXINCiZndDsmIzMyOyYjMTYwOyYjMzI7dGVzdHMva21zX3BsYW5l
OiYjMzI7QWRkJiMzMjtzdXBwb3J0JiMzMjtmb3ImIzMyO3BsYW5hci1zZXR0aW5ncyYjMzI7b24m
IzMyO25vbi1JbnRlbA0KJmd0OyYjMzI7ZGV2aWNlcw0KJmd0OyYjMzI7JiMxNjA7JiMzMjt0ZXN0
cy9rbXNfcGlwZV9jcmNfYmFzaWM6JiMzMjtVc2UmIzMyO1NVU1BFTkRfVEVTVF9ERVZJQ0VTJiMz
Mjtmb3ImIzMyO01lZGlhVGVrDQomZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO2Rldmlj
ZXMNCiZndDsmIzMyOyYjMTYwOyYjMzI7bGliL2lndF9rbXM6JiMzMjtBZGQmIzMyO3N1cHBvcnQm
IzMyO2ZvciYjMzI7bXRrX2N1cnJlbnRfYnBjJiMzMjtkZWJ1Z2ZzJiMzMjtpbiYjMzI7YnBjLXN3
aXRjaA0KJmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjt0ZXN0DQomZ3Q7JiMzMjsmIzE2
MDsmIzMyO3Rlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb246JiMzMjtBZGQmIzMyO01lZGlhVGVr
JiMzMjtkZXZpY2UmIzMyO3N1cHBvcnQNCiZndDsmIzMyOyYjMTYwOyYjMzI7bGliL2lndF9lZGlk
OiYjMzI7Rml4JiMzMjttb25pdG9yJiMzMjtuYW1lJiMzMjtwYXJzaW5nJiMzMjthbmQmIzMyO3Ry
aW0mIzMyO0VESUQmIzMyO3N0cmluZyYjMzI7cGFkZGluZw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsm
IzE2MDtsaWIvaWd0X2VkaWQuYyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMzI7fCYjMzI7MTMmIzMyOysrKysrKysrKystLS0NCiZndDsmIzMyOyYjMTYwO2xpYi9pZ3Rf
a21zLmMmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO3wm
IzE2MDsmIzMyOzImIzMyOysrDQomZ3Q7JiMzMjsmIzE2MDt0ZXN0cy9rbXNfY29udGVudF9wcm90
ZWN0aW9uLmMmIzMyO3wmIzMyOzExJiMzMjsrKysrKysrKysrKw0KJmd0OyYjMzI7JiMxNjA7dGVz
dHMva21zX2hkci5jJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjt8JiMxNjA7
JiMzMjs2JiMzMjsrKysrKy0NCiZndDsmIzMyOyYjMTYwO3Rlc3RzL2ttc19waXBlX2NyY19iYXNp
Yy5jJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjt8JiMxNjA7JiMzMjs4JiMzMjsrKysrKysr
LQ0KJmd0OyYjMzI7JiMxNjA7dGVzdHMva21zX3BsYW5lLmMmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzMyO3wmIzE2MDsmIzMyOzgmIzMyOysrKysrLS0tDQomZ3Q7JiMzMjsmIzE2MDs2JiMzMjtmaWxl
cyYjMzI7Y2hhbmdlZCwmIzMyOzQwJiMzMjtpbnNlcnRpb25zKCspLCYjMzI7OCYjMzI7ZGVsZXRp
b25zKC0pDQomZ3Q7JiMzMjsNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBl
OnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxp
dHkgTm90aWNlDQogKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWlu
ZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBt
YXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNl
DQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50
ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChz
KS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRh
aW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1l
bnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFu
ZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50
IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRo
aXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVs
eSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVz
IG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBz
eXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRv
IGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_007_1740998050.1043561355--

