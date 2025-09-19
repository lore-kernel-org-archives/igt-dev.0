Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F39CAC59A
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 13:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3B210EA03;
	Fri, 19 Sep 2025 13:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UihOnvxS";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551CC10EA03
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 13:34:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uq3Y/RRNceXPrG0N3I3b+xskL+F3XdI3/u0c79t/QoC27pxQ9/2uLCG01CAn796lSGxwSj96Q5I55bzWDkgM22SYz35a72HnU9MQmK1vz5HAKAtgeKPyQ2ul+exQK1sZfPc3vYieUQ8SXEHlup6G2NxCBT2D128UpkmT4ir5WsxF0kgfo2xDtQvWULb0jkMUWgFhU2zJ/R3gaCbxPBy5e3fdcMDtFjiNzo6LTfjShb7uxyKut3B6W5y/XT3luvJkoJ3zojZFVjdXatc+/mbkK0fo+9Oyfzldp227qnPtWLD8qH4414A3S2aEXNZXSSMi7cyATFA5EQx2hltaZzCWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFcHuO+yMpqWGbT6sEITQjIQb27Mcc68zO5ZjXC277M=;
 b=A6CGbBBXvgjVw0YmCDAGt7Jz8ksH8Rk3ORjtYxvSsqRNGOm3BDrZ5HXMeKuolEZszQ3r24GBgBi4mgd7BIIVSyBEDV87eQosgAbBaX6xTT8qOqPo1JgNblxrls6RCG/ujqvHEpacm9dSsT3q89v/ZznvTfOxDzTQY2DweraGbQnLUUgXQ0Mm6sIrS1DlMSSouQNB8OSFAZAd1wSu8hG3HeKDgr2X82X01rUJoAzHTdPmtfHERKoKl+NVWSzquFnWWP01aKX00zT8DMsSwIKB4RZ0zcR0SdaAclGHZKnsrFSbyrA3568jS2VdTF9ubMGQzWlH4z5bYfOiA88upclLiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFcHuO+yMpqWGbT6sEITQjIQb27Mcc68zO5ZjXC277M=;
 b=UihOnvxS/Q8U1UtwpTcKVxYzypdaRX1KJXJpxtGuBoM0q9ZXCWFf7hh/SekqYEuoVqGxefQFTjTy7lFsL78e1Jt5if4xZ5NthLj+XeBs1pEUDwAjhodxrkeYKFgdZgWOSVDWwYh3xq+rfhtrSEBE2am+7dnscos7K7xVfqGOknA=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by DS0PR12MB8765.namprd12.prod.outlook.com (2603:10b6:8:14e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.17; Fri, 19 Sep
 2025 13:33:59 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%7]) with mapi id 15.20.9137.016; Fri, 19 Sep 2025
 13:33:59 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Ho, Kenny"
 <Kenny.Ho@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhang,
 Jesse(Jie)" <Jesse.Zhang@amd.com>
Subject: RE: [PATCH] lib/amdgpu: temp skip vcn enc/dec test for RX 7600
Thread-Topic: [PATCH] lib/amdgpu: temp skip vcn enc/dec test for RX 7600
Thread-Index: AQHcKRlBMsEH8S/0O0u4Q0FtxVxEibSagX7g
Date: Fri, 19 Sep 2025 13:33:59 +0000
Message-ID: <BL1PR12MB514413007FAC97E33A0ABD62F711A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250919035528.76006-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250919035528.76006-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-19T13:32:37.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|DS0PR12MB8765:EE_
x-ms-office365-filtering-correlation-id: 6894dbc2-1011-43f4-8c86-08ddf7813082
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?QTRLN1Q5Wmk4YmpEMFZSb0JRSkVOaVdCdnUrUG9FVDNYSXpVajNmQVc0cXBz?=
 =?utf-8?B?WmorQ3R4aHdlck9SSjRiTEtsRk5Iem11NENSOUl5cWdKY3RWeHFqZVJKYU1Z?=
 =?utf-8?B?am9KZFFJdGt1MzFPak1QVUxzcGR0c05Ja3Z4OExlSy9hUWNsc1JQY0xxdGhR?=
 =?utf-8?B?bTE5TG53RXBoTlRzZjB2SlYxQVdTNUpzcWhBd3FYZlBXUS9NRXZtRUVFeW9k?=
 =?utf-8?B?Y1dTbExLNWNjK2JJaThiNmtsMDl5azUyYWxSblBnb1F4UUw5dkZTaWFDK2V4?=
 =?utf-8?B?WHhyWXk5Mk4wZHYwaFBTVWZQd0NDZzltTkl5ck05aDlUTFVQRFVJTWtIT29a?=
 =?utf-8?B?dHRQamV2SWYyYXhEWGJISEtPSzN3U3IyTXRGWnJJWVlMb0Urc2tNVi9xMFdE?=
 =?utf-8?B?Y3R3S2VWMldzL3c4L2xUakNzRmJScXJPRTIveVB5N1pBc3ZsWjJCNTBQTnRF?=
 =?utf-8?B?ZE14b1JqWHVDekx2dlV4SzZ4SVdzbjNXc2w4Nmg5L1ZVLzg1S01IZFZjcFda?=
 =?utf-8?B?WUJCaFNkUEo1TmJSQUx6bDBTeUMzL0s0SGdaSW1xSW1OejZrem5jcFJmMlp5?=
 =?utf-8?B?M05FSmFadHJPMHlzbmtQMHhMQ29YWEFlTzQ4bEFSZW8wQVBES1Vvc1YvaTJt?=
 =?utf-8?B?UlpqU1poUmhhTTJLaHFRT1lPazU3eTZWQktNdllhbWh0R0Z0QkR1bjhFNXJ6?=
 =?utf-8?B?MVFMUG1UVG5MZnJ1L1ZNemNaSXZJd1ZNdjhMM09JTVFSRURBTGU1VlFoWFlH?=
 =?utf-8?B?YnRmWlNpT1hlb1ZGTFJBTVczZWtzcWpVeXI0UmZPbVAxK3V6WUJXV0ZUWjZW?=
 =?utf-8?B?UnI4YmluRXIxZXl1cGRoU2llWHd4dVZ4SXpJZUhZNktjMzAxU3k3YXpkZXFS?=
 =?utf-8?B?K3g1cDA1RGtTN3g4MVRYM0VDaFR4SHFnT3hLeUU2TXJyODJxRHZwcklRbkRE?=
 =?utf-8?B?cm8zY0VNbVFiazNxaHRadmdVeWNQS0tlelJHVzg0TmZnY0l1b0Vxb0R4RFpr?=
 =?utf-8?B?VmJ1Y2k1N3lxUFlaV2FwNmNleGpHeDJ4bTRkQWpFdXlDN0Z0THRlN25CdFJI?=
 =?utf-8?B?STdVdWN5aEgyTm15Qk5xUnRNcVJYZjMrbDhuSjVGU1NidXNyMGJ5bFhxNHNx?=
 =?utf-8?B?Nk1SZ3lHMHJyTENkOTdIZ0dyNkN4N2FLZGdMM3BOVGphWFdOekxveFVHNnlB?=
 =?utf-8?B?UU9ZbXlPRG44RjFvQWlxRE4yT2UzQ3JkS1pRK1VIbVBNcnpRNE9EUHd1QWxD?=
 =?utf-8?B?Y0N4a2VCbHRkRW85RjFaQXZjM1FJNC9GbVdaOTdJdlJTZzNkMy9JeUsySWdD?=
 =?utf-8?B?cnBmQ1hlMEViejRwb0ZTSGVxSEtlcFk4Y21YK0pNUUVXRStLVHNkUmhuRWVr?=
 =?utf-8?B?ZnRoMTFsMXpSZ0pjN1h5QnpWYWNoSjFWOGNXSEtVRzErZUVsVFNVM2tuT1F4?=
 =?utf-8?B?clVBZ0NiOHFGaDNvQ2hVbHV3THVERDdzK2ttQ3dnVjcycDVRYUpxTlVxSFhh?=
 =?utf-8?B?ZzIydEVyeG9nMUxKT2RVSzc2SXRtUWdnSnJVQkpCU0s2MjZFVEVPc2RsRG1Z?=
 =?utf-8?B?eUpPeklHMys0WU9ObDFqQ1duM0hVem9jTzc3SENGWkoybDdFRldlUmFiMGY5?=
 =?utf-8?B?L1dIMVFNM2xxV3FSZkZyS2xCVkVLaVhOMHdCY2tDclpiRHNzNzNiMmpTMG9I?=
 =?utf-8?B?TXpPbDBCTVlHaTVRa2dLcm5iaHk1VEZDTjcwN3RIV0t4d0xIUzhZcUM5dWVZ?=
 =?utf-8?B?VG4wemlOOWZGdU01L0N2Zm5YeFluKzA2UDB3K0RTbkVxVk9iTUlYaG9xSDRr?=
 =?utf-8?B?cCswdi9tZ2g5WWZBYUxxdkxrVEI1TTRWbjRuUzA1VVR5eEZLSWdwWHJGU0Zi?=
 =?utf-8?B?Y0dSLzJoZFpPbEROTzBuWVBSNmxsSWxlRkN2aGRXU3dKMXpHMVdPbjg1a0hm?=
 =?utf-8?B?Q2UzclNRaHcvcDA2cWNDR0cwb1U1aEc4ZnY0TXZRenlsSVcwVFpJUCs2c29z?=
 =?utf-8?B?aTVLMXFVUnRnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzNSMTl0a0ZBVmZ1OEtoK0tkWnJkL0cxczdkeDV3eUZ0cElxKzMvTzBhT3F6?=
 =?utf-8?B?U2ducmJKbzY5Q0NjQWJ2TVNSb0t3ZENIMXZ2YWM2Tm4vbHFrNmhpSWU1U3Nv?=
 =?utf-8?B?akwzZ0VlVENzWXJCMUx1WUcvc3ZjQ1E4VHJGOWp5YUhFL3VKUnlxOXhjVGh1?=
 =?utf-8?B?UVFEa29zWE1sYU9PalNVK1piMHdWdjA1dGRJUUpJenFCNHQ3SG93LzUvdWVB?=
 =?utf-8?B?b21UU0hGWXFoTGttemtJRmpVemZSOUpyOHNtWHFzbE4xT2N5OW02NTZ5RTJo?=
 =?utf-8?B?M1cyaERPVjNnaktYMWh4Q0RWVzY3MHo3QVZ2cVlGRW5mdk9JSkIzUVhnVHBs?=
 =?utf-8?B?Q2RkM0FrRXNNQmxMbFhzajZUbzlXRjlnWTY3alpnOFNMdW5QSlVWbTNMbk0y?=
 =?utf-8?B?TUFFbUFiNW82aXhwalRMRzloRzFnWGRJZUUxRW8zTTZHOGtBT0ZMTmx1SlZy?=
 =?utf-8?B?VERwT25EbXdBVTJCVDlrK0dyajZuanpERkpFQXJEYzJzVlVHY0IycnUrQmJB?=
 =?utf-8?B?V2NlWnl5L3F3ejdQT3h3UWhiOHg4Tmk1U3creWFhd0gwWWhVMnl6QkVwbHJj?=
 =?utf-8?B?ZllzMEFOVjVTWlJvbGVmNnFRSzhJMnlrT3V3ektYVUE2WmkwUFYyMVdkUGRX?=
 =?utf-8?B?WE1MVE1CSkJnL3dHdDJuUDRRaGN3b0ZMM3JPc09Zc0VhbXZKTnpWNW82d0o2?=
 =?utf-8?B?MU83b0Q4K0dyUTEveTNnSjZVTG5tSS8yNi9xWWxOSmhXNW1ZTThxUmVEbnhi?=
 =?utf-8?B?NFU5ODlIeHE0ZkVsVTRqOTcydzJKYVBtQTRwYW9ZNFNySyt2UXhMSWszanlM?=
 =?utf-8?B?YW9GblB6cm9zYk1QUDdjRUV2VUIzcU90WlN0VUxyRnoyZ0I2bStjenRwbTRm?=
 =?utf-8?B?bDhwYm45VHYxZFpwRUYyNWJFbjlRSGVpa2FiRk02NjNFcHQydkRBaE1sWmpN?=
 =?utf-8?B?YjczcnVzWS82d1ZRVmFQQzBFYlFqTEoyUEFmSUs4ejV1MEg4Z2JpKytHdm9r?=
 =?utf-8?B?bzJDVU9KeTUvMVpNQjJZTTRYOHpKbjlTUWNYdjhmZkpXd3pDREtWbG4xbmt2?=
 =?utf-8?B?SlMvZGFUcmcrSmZZaFJPMktOL0Z0Y2l2dGZQRCtpVmozRDV0V3BKK212UGJQ?=
 =?utf-8?B?UFJCTEU3SGFiQ2FkVzBsNVgyNEUrYzRua1o2eUErVlY1T3Jkejh5YzEwclhO?=
 =?utf-8?B?aTNxK0k1TC82YzNFdUNHTERHNWJObkVEVU9tVmw1Zm1iMFlHYnRKUVJveHZU?=
 =?utf-8?B?UUJ5N3VibnRMUS9Cci83VUVLMFQ0QWpIb2dsWkdyY0ZnUmdkb3dGN2g0dzlE?=
 =?utf-8?B?T1NiZ0J1Z2RldE1SalRkYlEzUVg0bU44UjdsVlA5QkQ4QWp6UlpENzdueXhD?=
 =?utf-8?B?bVkxQ0pZYkIveFNvL3AxTnFFUDlpd2hNejIrRjBOUGJGbHBqbU56bFlZUWVw?=
 =?utf-8?B?b3V5RXYyaGFUL2hNOGgvSmViS3ErVTBMOXVCclJKWUNoUlRCeElEb0ZHQUlt?=
 =?utf-8?B?bVpCSzVEajViNktocXlWKy9US1hwSER4L2p3NkVQbjZhamhEK3QzUzJRVHlK?=
 =?utf-8?B?VUVOVHlDUys5VnZLWXdhUlVJb3lybW12UzVLT25TdTMxcVVWUlo1clpNRmha?=
 =?utf-8?B?NWEyc2pzNGRhZTBxQ3pFWmJVQm1tWTZaa1lsTWp3NUM3OVBRd1RFdHdVei9J?=
 =?utf-8?B?dFJEMmt4a3JDeVQzNDEydGtkanBwdWk2dFJhT1l5L0g2M2JGYmErQUtMcEVY?=
 =?utf-8?B?d2g3SjZ0Tm1QSUxRdVltVHNYcjQ5THNqdW9laHhFc1BaMXZ3UWMxUkRzaWhh?=
 =?utf-8?B?Z0dES2NDMDNCOGNGRk9EUkhObE9PT082RkJFdjBnMi9KWlByUy9SODJzdzlG?=
 =?utf-8?B?TDVmRnkrS29LRk5OeFRkOUlaQ2UxOXdDOEIvZnRqcFVmQnFlMjQzalFFV3Yv?=
 =?utf-8?B?aTNHVFhvdVZwRDUvTHh3ZE5KZ094UkoxcHFCZ3VWSy90UWxmQmlsWDRNR0Q5?=
 =?utf-8?B?cWlrR2NNUjZlVnRqTmNxbHk0L0NDaTZ6cHVnVS9HME9VbzdWc0VhaFFLLzl3?=
 =?utf-8?B?UU9aMm9ibG8vVFJrYzVXWHJtMHBPRUQ2NVNMd0RFdTJpRU81MWhZUWhMQTlh?=
 =?utf-8?Q?jqn0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6894dbc2-1011-43f4-8c86-08ddf7813082
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 13:33:59.2996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0KkIsG6rkT9lKUcYf+/leBmWIbPV3putQ6DO3J5oqBy9AfmuFenCsLh/hqJAJQp/Q7+JM4ZJ+Ed2wrmYfOtWyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8765
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiB2aXRhbHku
cHJvc3lha0BhbWQuY29tIDx2aXRhbHkucHJvc3lha0BhbWQuY29tPg0KPiBTZW50OiBUaHVyc2Rh
eSwgU2VwdGVtYmVyIDE4LCAyMDI1IDExOjU1IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogUHJvc3lhaywgVml0YWx5IDxWaXRhbHkuUHJvc3lha0BhbWQuY29t
PjsgSG8sIEtlbm55DQo+IDxLZW5ueS5Ib0BhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENo
cmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47DQo+IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVy
LkRldWNoZXJAYW1kLmNvbT47IFpoYW5nLCBKZXNzZShKaWUpDQo+IDxKZXNzZS5aaGFuZ0BhbWQu
Y29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGxpYi9hbWRncHU6IHRlbXAgc2tpcCB2Y24gZW5jL2Rl
YyB0ZXN0IGZvciBSWCA3NjAwDQo+DQo+IEZyb206IFZpdGFseSBQcm9zeWFrIDx2aXRhbHkucHJv
c3lha0BhbWQuY29tPg0KDQpXaHkgaXMgdGhpcyBkaXNhYmxlZD8NCg0KPg0KPiBDYzogS2Vubnkg
SG8gPGtlbm55LmhvQGFtZC5jb20+DQo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+DQo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+DQo+IENjOiBKZXNzZSBaaGFuZyA8amVzc2UuemhhbmdAYW1kLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogVml0YWx5IFByb3N5YWsgPHZpdGFseS5wcm9zeWFrQGFtZC5jb20+DQo+IC0tLQ0K
PiAgbGliL2FtZGdwdS9hbWRfdmNuX3NoYXJlZC5jIHwgOSArKysrKysrKy0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBh
L2xpYi9hbWRncHUvYW1kX3Zjbl9zaGFyZWQuYyBiL2xpYi9hbWRncHUvYW1kX3Zjbl9zaGFyZWQu
YyBpbmRleA0KPiAzODg4ZWMxMTIuLjU0YzczMTcwNyAxMDA2NDQNCj4gLS0tIGEvbGliL2FtZGdw
dS9hbWRfdmNuX3NoYXJlZC5jDQo+ICsrKyBiL2xpYi9hbWRncHUvYW1kX3Zjbl9zaGFyZWQuYw0K
PiBAQCAtNTksNiArNTksMTMgQEAgaXNfdmNuX3Rlc3RzX2VuYWJsZShhbWRncHVfZGV2aWNlX2hh
bmRsZQ0KPiBkZXZpY2VfaGFuZGxlLCBzdHJ1Y3QgbW1kX3NoYXJlZF9jb250ZXgNCj4gICAgICAg
ICAgICAgICBjb250ZXh0LT52Y25fcmVnX2luZGV4ID0gMjsNCj4gICAgICAgfQ0KPg0KPiArICAg
ICAvKiBTa2lwIFZDTiB0ZXN0cyBvbiBSYWRlb24gUlggNzYwMCAgKEdGWDExLjAuNCwgY2hpcF9p
ZCA9IDB4NTEsDQo+IGZhbWlseV9pZCA9IDE1MikgYXNpY19pZD0gNzU1MCovDQo+ICsgICAgIGlm
IChjb250ZXh0LT5mYW1pbHlfaWQgPT0gMTUyICYmIGNvbnRleHQtPmNoaXBfaWQgPT0gMHg1MSAm
JiBjb250ZXh0LQ0KPiA+YXNpY19pZCA9PSAweDc1NTAgKSB7DQo+ICsgICAgICAgICAgICAgaWd0
X2luZm8oIlNraXBwaW5nIFZDTiB0ZXN0cyBvbiBOYXZpNDggKGZhbWlseV9pZD0xNTIsDQo+IGNo
aXBfaWQ9MHg1MSwgYXNpY19pZD0weDc1NTApXG4iKTsNCg0KSSB0aGluayB0aGUgY29tbWVudCBo
ZXJlIGlzIHdyb25nLiAgTmF2aTQ4IGlzIGdmeCAxMi4gIFRoaXMgd291bGQgYmUgYSBuYXZpM3gg
Y2hpcC4NCg0KQWxleA0KDQo+ICsgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiArICAgICB9
DQo+ICsNCj4gKw0KPiAgICAgICByZXR1cm4gdHJ1ZTsNCj4gIH0NCj4NCj4gQEAgLTE4OCw0ICsx
OTUsNCBAQCB2Y25fZGVjX2NtZChzdHJ1Y3QgbW1kX3NoYXJlZF9jb250ZXh0DQo+ICpzaGFyZWRf
Y29udGV4dCwNCj4gICAgICAgZGVmYXVsdDoNCj4gICAgICAgICAgICAgICBpZ3RfaW5mbygiTm90
IFN1cHBvcnRlZCFcbiIpOw0KPiAgICAgICB9DQo+IC19DQo+IFwgTm8gbmV3bGluZSBhdCBlbmQg
b2YgZmlsZQ0KPiArfQ0KPiAtLQ0KPiAyLjM0LjENCg0K
