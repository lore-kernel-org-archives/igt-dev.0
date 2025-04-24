Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C85AC369CB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 01:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5391010E703;
	Thu, 24 Apr 2025 01:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e+oLGWEK";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9385010E703
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 01:19:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xsYK73TH3bqcAJOMSRrwYlBWIlOzikpE9M9AATvqKIYcjglIyTzGkrnlQQCE822CsD524mUSxUIBhMQ6sHx8CGnUEtkBBu612JfLjuBMpU3cbABYnADZkB/uNft53v6ad/QnAz/gnGPDbJBJmO4Yv+0BaQGGDWOpJn4UDKr9Dro4LUwQDFt10Y71UZ6Uz3P578dtUaKwU+lUKCCxidRqdzj7RHQs85PNjFxGb4yYekH9Fp99nPjwS7k4/uEP0x8PpkOU02fBwfcHDsstD3YlN1M6Anchgjd2H0nunC2xCIy5wqy17XM3CMnd88MFimGwMb1bfX7mhv+rVqEenOs0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akBBQrlLJJc90x32gHWHd0SfGCHrMWb/JntKCT/STUo=;
 b=fYHenRRNWxR8qSieYeaJS82qkuZ7rULqpul0HO2LO33qbq+xxs2nSfaE70CMYtj9v86nz6q8Gd72A2k+XfB9MIpB6QaYqGLbcMtG5blL+rUAk4qBiMEjFve2srDd9fQ/Yntz6i/wr2il+4CaYZrvrfoPJ+QMZQRPC337hiwD7m19QJv0mXPRKUrrOfm57iuhHvunLLf2qCZelGupabG5/Mh7G81fTIv86C044lfxLyqaaMMG5nTpc9K5KpEnP6znxGHZeJxVBijUA4sahVWWVyw/qlbSuuop9AqgIthjJ7aTwCIdo6p9JFsUoOYGc9q6CnA+7E7L20ULA48MMoHdUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akBBQrlLJJc90x32gHWHd0SfGCHrMWb/JntKCT/STUo=;
 b=e+oLGWEKOyWekiF8hBwpHuC+MHWfA/KVjeR3WY4vvlBd82fYCQYo8ZTYUYuYWuAjSKmY2aL+Y5J+O1PAxfJZ4iEu87M3TFEg4DqWn8aH2J6/tJTbU6LZ9tU66XuacmyqrWVksmKdESAbd8Xs2vLIugxrT+ERFov2zyEW6Ch3u9U=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by CY3PR12MB9703.namprd12.prod.outlook.com (2603:10b6:930:102::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 01:19:38 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 01:19:38 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
Subject: RE: [PATCH] lib/amdgpu: fix potential issue with bitwise AND operation
Thread-Topic: [PATCH] lib/amdgpu: fix potential issue with bitwise AND
 operation
Thread-Index: AQHbs+Jb/2Iu86auXUGaFi+WwyHUDLOyBhdw
Date: Thu, 24 Apr 2025 01:19:38 +0000
Message-ID: <DM4PR12MB5152F6A33808EA9C700847ACE3852@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20250422235740.131691-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250422235740.131691-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=fa3d47b6-a2a9-4a3c-985b-be10070da049;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-24T01:19:30Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|CY3PR12MB9703:EE_
x-ms-office365-filtering-correlation-id: d299b62e-22e4-4e6a-a2ae-08dd82ce14f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?S2VpYisrZGlCL005R09tRnFYczhENFg0dUhCUEdxbjlCWXB2anNuaGRRdTE5?=
 =?utf-8?B?UXNPZ1JGWTM2YkZzQlo3andqdWZ4eWxUUURWNVovRGRZRTk1VjN1dE9UMmlu?=
 =?utf-8?B?WWVtUEJFNm9zZUdhVkxPSit0djFZOHFiWkk4QzhOZ0JkQnAwV3dWVzljbE83?=
 =?utf-8?B?Z1JTN0VXSnY4ZUhVSnI1Z2lwS2ptU2dDRW4xNHQ4dXBmMDhNNjFqcDlsUnR6?=
 =?utf-8?B?aVVRNlZQZW1jenI4YkF3eWdMbmh3bVJOS1Z2YU40S2ZTTFBHRlN2UkNoMG5z?=
 =?utf-8?B?K05JNm9wcTQra2UvbVlZZGRRY3BueG0yM2R2K08yMnFieDM4THJpVzdqZlBi?=
 =?utf-8?B?eWZxVE5pa3BLV3VzaFFoY2pPbkVLeks0Uk5JeVhZQWc3MWdpc0EyazgwbnNa?=
 =?utf-8?B?QkcwSW1nZ05vOWF0dUZtaHJ3VlpFU1FVbG1sbGd2cG9Qb2tRd0I3eXZ1WEZu?=
 =?utf-8?B?MlFkMkcxb1NGR09DR0tTbWVjdVl2cmd2cGRJQWEyYko5TmRWQmo4dVVYVVFF?=
 =?utf-8?B?amJOdlY5d0d0UmJIUktLVUxmUE1GRUQ0SzMrYk5YS3R6T3d6MWJ2ZlJYUHo2?=
 =?utf-8?B?a1MwWVVWblJiUEpQL01PeGRPKzg3L1BaWTExUmdmTDlac01lWGMxNjJQM1VF?=
 =?utf-8?B?azQ3QUk4bGtsNTlRNE12eHkwQnpuQWdQWFJpVitIc0NFcVQ2L2F3eVM0alAr?=
 =?utf-8?B?L0FwbitTclhpVkV0NUtUdE9DWUoyREprMGQxRllnNWczZzF3WXJSVGhYUWhl?=
 =?utf-8?B?R1M2dXA0ZUJ0ZzdXaTllaXIxNUR4a2Qycndma0V0eTBURG0zZzNCK0twRkRY?=
 =?utf-8?B?dnVuajNqaXJ2dHlpOFo3UVNkSzBETzdSSHZNR1MwZExxWFViN05pZkVWMDNP?=
 =?utf-8?B?TVRCeFhYNHprZlg1YlRoc2prZkNEWHBybUdFckZxNFpyYXRobDRLWnp5d1dM?=
 =?utf-8?B?eERzbHhZa1lKdkc5aE9ENkdTM3dGN0VpQ1FZZEFSWVh4RWVldnhVRmtSVU9n?=
 =?utf-8?B?bkxrQzQxNXRhNTZ6VHdEZlBJQzV6YVNtVDdDUSs3Y3F4MGJsS1lTNExYWTF3?=
 =?utf-8?B?WFhHVVhISitScXVGbkR6UzZjOExDZHpSVm9NaUVLeG51Mmd6TWd6YnIzWGdN?=
 =?utf-8?B?K2NqQ09JVEt3RUJuc3FMU21OT0FkU0l4bXJrNkJ6ZWlrNXRjUXNRUnc1UmUz?=
 =?utf-8?B?QkFYWXc1bWtMK0krT2lUWnZhNmpIckFoTXR5dTYveC9iMGYveVp4bGJJbG05?=
 =?utf-8?B?NHNIV2UvZzh1T0JLRlcxQm0zb0NKc0NvdHlzSGV6bXkva2FkOXg5U2FPd05B?=
 =?utf-8?B?aG9ZUUQzalM5Sm9sYU9HMzkvYkMxMDFUYmlQRHNDdnEyRFpKNlluN1VmV3gw?=
 =?utf-8?B?dXQ1U0dlOUVlK1A2cEl4bWhYRXBYQnhzaUhibXFHVVRFQlIwYzYzck9xSEgy?=
 =?utf-8?B?WnM1Lzczb3h2WER4cDRwd0hNSmRVSVZxVCsyaXVneXh5bjQzM3k3V21SenYy?=
 =?utf-8?B?MUt0QmFBOHNNbEJoNHQrYjd0c1Fhc00xZmk2cER0S1VPZE9jZlFudTl1V2ZD?=
 =?utf-8?B?eGJibS9waUZaczczdDlyMUljOENtTGN1alVmQ0MxZFNTL0lIK3ljTklRSWhn?=
 =?utf-8?B?bWt3V0NyYU9nTE1nck8yeGEwLzhxM3BNZCs0K2g5aCtMQzRKRjBTQy9EQVI5?=
 =?utf-8?B?elhSVllkT1NvQVc4c0l3Uys5aE9WQkMwRFRPNlZIUVpWakFiWDJGYnZEQmM1?=
 =?utf-8?B?ZE5NMXI4a0hIcEVoNEtMWXFqYXo2OHJjOXEvRkxBbjVkUG1BWU9WM3hnNjA5?=
 =?utf-8?B?RHlJN21XdmtNcW8wNlBnTkJXSmRDQ0JCSmZQbHpjOVFxaGg4MUMvbmZuM2Zl?=
 =?utf-8?B?VHYxYktod1E3QUh5ZW1OVkJUOWUwSS9zbEg2b3J3QW1UWEtsclFGMklCOEkr?=
 =?utf-8?B?TjNwemJXaXpNTnpZSHcySjlFZDVCRG5TNjBxUWliY2M0SE5yQmpmSVZLNGcr?=
 =?utf-8?Q?dKzzLuBaiIDsotXJSALV6Mti8xrstI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDhRYWZHaEE0cVpnQVh1VkU1aVNLZUx6WFJIdEZvQ1MwUVM5d2VDTGxySkNw?=
 =?utf-8?B?R2xmNTFXOXRoQUpXalI3SkRsS1l6K3BYeEdnZXFydll5dEdMelFCZnNQRlY0?=
 =?utf-8?B?NDUxK0s0YzZybU9BSG1Xd2RTS1A3L0JqckNMaks4ZFRmelUxQkY0SlIza3My?=
 =?utf-8?B?TUN6S0Z6anZxT011T2FJSHJsSmx6aVNQYm9UbHNBeTZyYWttblhKakR5dy8r?=
 =?utf-8?B?dG5ITVZLSlFCZDZITU1ERmMrUDdHYURNY1lwWkhEOE1taWpjWSs5VERLdldh?=
 =?utf-8?B?R0UrN0F0MzNlT0NaU3NLOEZoUFdiWExBQmFNYUwxQWh3bUwyaGJ2MmZxaWxp?=
 =?utf-8?B?UkpuQTNKZEIzMjRzait3c3ZTVDlzbVlJaUlsd3ZQcUM4REIzVW5RaHFld0tS?=
 =?utf-8?B?b1FMT2o3c0haMkRWNmJJdXVqNUJoR3FQNkpNRi9ZT1B4R2VzcUpzdTdqdUFS?=
 =?utf-8?B?cDROa0x6TGpqa2IzYVV5WUFnVURwT3ljSTczOXF5WlkxS0hhclVlT3lWSGZ6?=
 =?utf-8?B?R25PbGpPRWN0SWRNWjZ3U3Frb0FjandPUkFaTk5zRXEweWUvUlpZQzloTm5C?=
 =?utf-8?B?N0UrK2lwK3ByZVN1NyswZ29HWnhjTmVjRmVoRUNuWkdrN05Ebk5STXBwd1pM?=
 =?utf-8?B?QzhrWGVQWXl0UmhVMyt5cFllWHN2WTdEMWVjQzBTMUlQaHF4WjFCRDdMMGtt?=
 =?utf-8?B?czh2Q3JJdXRlRGk2clN2T2VwQkdiOXp2dVlZaDFnSkFxVGlZVldaTHZGOFFZ?=
 =?utf-8?B?amxFK1hZQU1IMzR0b2IreWFtN2xiL0FpQklQNXJsRDA0OHhOdzBOK3lxSTFD?=
 =?utf-8?B?ZEtrT2t3VU90S0w5cmd5R0syWWZhL2Q5bUtIRkw3RFQvRUNmQ1MreW1YQkxO?=
 =?utf-8?B?U05JQzVpT1ZtQzNwa0JoRjhZaEtGbC9iSDhELzlPUFkvN3Jrd0h1YlBjZjFS?=
 =?utf-8?B?Ri9rb1d6dlJMenR4YzJsUkd0Z0ZUNGxvUmdpVU1ZaEIyZjc2QTFyRmVrN1J0?=
 =?utf-8?B?L0lQMXAwRFcrTHBPV2ppL1JaWVRENXg0QWp3N2h5TWpJRVFSNkZhdnR3Smty?=
 =?utf-8?B?Zll5Z1lrM1F4b29MT05XQ0thMzRWeTNEekNjVUhQeEd5eGNuZGhYUUN1WUJ0?=
 =?utf-8?B?QlhidXRDaXZWdE9oSytRczNuZ3NXbXhhTzBPQWcrb01LdmZWeWtJa0ZET1ZL?=
 =?utf-8?B?T3FRVllVNCthbzZENnZLNkl4dXF1Z1ExU1BvMjZRaDhXMU9xajJwT2RvNklj?=
 =?utf-8?B?U2JYNVNmRHFROUhZTlV0L3RUVmdvZDlIbW9oU2lpbDNTTG5sRVAxdkk3MERI?=
 =?utf-8?B?UFhCa1o3Y1Nxei9NbFdyWVFGYUx6dWJtQ2RyMnpFM0ZKUFhpaWEreWpjcHFY?=
 =?utf-8?B?ME02MmJ2VS9rQ0dyZHU5Q3ByL1kvR2dhUjRxV1BwcEk4aUJGQTRlUjRKaDBp?=
 =?utf-8?B?dHJZYmFKVGFiamhjVWtaUU1LVVFFNEpyeC9aMUp6OUkvMmliSzBiZWtTZkNw?=
 =?utf-8?B?WUQxbUtCZUhHYVd2ci9mczM2RktPVzlhbzJNTVFxL2ZhMERpNjZjd3JxYmZl?=
 =?utf-8?B?Q3g4dkttRzNualkybGNUOTIxd0grRitxQkFHVG5XUXd0R1d1WUxZQjBETXZD?=
 =?utf-8?B?UXBQMkoySWdESDhvRW1hbmRWTXMvTnNNOGlFb2NiVEVabExaNlJlK3NBU3RK?=
 =?utf-8?B?Y2NscHQ5NEpyQW4wTFhSN1hsWkJ6cnRWOTc3Z0l4Wi9weVcyc2h5VTI4aUtD?=
 =?utf-8?B?OVN4UmVGM2ZGakk4RkNRMVZGZElkd0QxN0lod1k2THpFNlhsYkdLcXY1NENt?=
 =?utf-8?B?REZzbUhuS3RZT0hOOG9oVXN0eWpXZVAzWWluTFRGTFU5THdtT2h0eXlLVjlL?=
 =?utf-8?B?YjZ1LzhGQ1Zidndhd0lpUmpzU0V0UGhLQjhsWms5MWxLdmdudnhrR0dNQ3Y2?=
 =?utf-8?B?QksyTElUdXlVUkVhYk9lK1VaWWNrdkFaV1VGdlNuOXNYL255bzBpcU16RUJw?=
 =?utf-8?B?QlE4YmhPMlhRRzBUWGsxU2RBN1BiVkpJL3FaYnd0Mjd1UnhwVlo3R0Z1dXpo?=
 =?utf-8?B?cyt5Q0JwaGdGMU5uRHlLd1IrL3NTU04xZlBJZ0JiNkZJQzFhM21PTXIxajRu?=
 =?utf-8?Q?MQk0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d299b62e-22e4-4e6a-a2ae-08dd82ce14f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 01:19:38.2876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L5eI7whWCTlTpDSJFcT9FFhwf7fu/PDv1sfKZLa9jQTFznQAkXzmq2qH9i865afv5oEC/z68lAc7uxVs2vAznQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9703
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KVGhpcyBwYXRjaCBpcyBSZXZpZXdlZC1ieTogIkplc3NlLnpoYW5nQGFtZC5jb20iDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiB2aXRhbHkucHJvc3lha0BhbWQuY29tIDx2
aXRhbHkucHJvc3lha0BhbWQuY29tPg0KU2VudDogV2VkbmVzZGF5LCBBcHJpbCAyMywgMjAyNSA3
OjU4IEFNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBQcm9zeWFrLCBW
aXRhbHkgPFZpdGFseS5Qcm9zeWFrQGFtZC5jb20+OyBaaGFuZywgSmVzc2UoSmllKSA8SmVzc2Uu
WmhhbmdAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gbGliL2FtZGdwdTogZml4IHBvdGVudGlh
bCBpc3N1ZSB3aXRoIGJpdHdpc2UgQU5EIG9wZXJhdGlvbg0KDQpGcm9tOiBWaXRhbHkgUHJvc3lh
ayA8dml0YWx5LnByb3N5YWtAYW1kLmNvbT4NCg0KVGhlIGF2YWlsYWJpbGl0eSBvZiByZXNldCBt
YXNrIG9wdGlvbnMgc2hvdWxkIGJlIHRlc3RlZCB1c2luZyBhIGJpdHdpc2UgQU5ELCBidXQgc2lu
Y2Ugd2XigJl2ZSBvbmx5IGV2ZXIgdXNlZCBhIHNpbmdsZSBvcHRpb24gcGVyIGNhbGwsIHRoaXMg
dHlwbyBkaWRu4oCZdCBtYW5pZmVzdCBhcyBhIGJ1Zy4NCkFsc28sIGltcHJvdmUgdGhlIGRlYnVn
IG1lc3NhZ2UgdG8gcHJvdmlkZSBtb3JlIGNsYXJpdHkgd2hlbiB0aGUgcmVxdWVzdGVkIHJlc2V0
IHR5cGUgaXMgbm90IHN1cHBvcnRlZCBieSB0aGUgZHJpdmVyIG9yIGZpcm13YXJlLg0KDQpDYzog
SmVzc2UgWmhhbmcgPGplc3NlLnpoYW5nQGFtZC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBWaXRhbHkg
UHJvc3lhayA8dml0YWx5LnByb3N5YWtAYW1kLmNvbT4NCi0tLQ0KIGxpYi9hbWRncHUvYW1kX2lw
X2Jsb2Nrcy5jIHwgOSArKysrKystLS0NCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvbGliL2FtZGdwdS9hbWRfaXBfYmxvY2tz
LmMgYi9saWIvYW1kZ3B1L2FtZF9pcF9ibG9ja3MuYyBpbmRleCA0ZWFmNjM5YjMuLmQ2NzY0MTk0
ZCAxMDA2NDQNCi0tLSBhL2xpYi9hbWRncHUvYW1kX2lwX2Jsb2Nrcy5jDQorKysgYi9saWIvYW1k
Z3B1L2FtZF9pcF9ibG9ja3MuYw0KQEAgLTEwMjIsNiArMTAyMiw3IEBAIGlzX3Jlc2V0X2VuYWJs
ZShlbnVtIGFtZF9pcF9ibG9ja190eXBlIGlwX3R5cGUsIHVpbnQzMl90IHJlc2V0X3R5cGUsIGNv
bnN0IHN0cnVjDQogICAgICAgIGNoYXIgY21kWzI1Nl07DQogICAgICAgIEZJTEUgKmZwOw0KICAg
ICAgICBjaGFyIGJ1ZmZlclsxMjhdOw0KKyAgICAgICBjaGFyIGJ1ZmZlcjJbMTI4XTsNCg0KICAg
ICAgICBjaGFyICp0b2tlbiwgKmJ1ZjsNCiAgICAgICAgY2hhciByZXNldF9tYXNrWzMyXTsNCkBA
IC0xMDQ3LDYgKzEwNDgsNyBAQCBpc19yZXNldF9lbmFibGUoZW51bSBhbWRfaXBfYmxvY2tfdHlw
ZSBpcF90eXBlLCB1aW50MzJfdCByZXNldF90eXBlLCBjb25zdCBzdHJ1Yw0KICAgICAgICBidWYg
PSBmZ2V0cyhidWZmZXIsIHNpemVvZihidWZmZXIpLTEsIGZwKTsNCg0KICAgICAgICBpZiAoYnVm
ICE9IE5VTEwpIHsNCisgICAgICAgICAgICAgICBzdHJjcHkoYnVmZmVyMiwgYnVmZmVyKTsNCiAg
ICAgICAgICAgICAgICB0b2tlbiA9IHN0cnRvayhidWYsICIgXG4iKTsNCiAgICAgICAgICAgICAg
ICB3aGlsZSAodG9rZW4gIT0gTlVMTCkgew0KICAgICAgICAgICAgICAgICAgICAgICAgZm9yIChp
ID0gMDsgcmVzZXRfYXJyW2ldLm5hbWUgIT0gTlVMTDsgaSsrKSB7IEBAIC0xMDYyLDExICsxMDY0
LDEyIEBAIGlzX3Jlc2V0X2VuYWJsZShlbnVtIGFtZF9pcF9ibG9ja190eXBlIGlwX3R5cGUsIHVp
bnQzMl90IHJlc2V0X3R5cGUsIGNvbnN0IHN0cnVjDQogICAgICAgICAgICAgICAgaWd0X2ttc2co
IioqKkZBSUxVUkUgZmdldHMgJXMgTElORSAlZCBGSUxFICVzXG4iLA0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBidWZmZXIsIF9fTElORV9fLCBfX0ZJTEVfXyk7DQogICAgICAgIH0N
Ci0gICAgICAgaWYgKG1hc2sgPT0gcmVzZXRfdHlwZSkNCisgICAgICAgaWYgKG1hc2sgJiByZXNl
dF90eXBlKQ0KICAgICAgICAgICAgICAgIGVuYWJsZSA9IHRydWU7DQogICAgICAgIGVsc2UNCi0g
ICAgICAgICAgICAgICBpZ3Rfa21zZygiKioqRkFJTFVSRSBtYXNrIGZvdW5kIDB4JXggcmVxdWVz
dGVkIDB4JXggb3BlcmF0aW9uIGlzIG5vdCBzdXBwb3J0ZWQgTElORSAlZCBGSUxFICVzXG4iLA0K
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXNrLCByZXNldF90eXBlLCBfX0xJTkVf
XywgX19GSUxFX18pOw0KKyAgICAgICAgICAgICAgIGlndF9rbXNnKCIqKipGQUlMVVJFIG1hc2sg
Zm91bmQgMHgleCglcykgcmVxdWVzdGVkIDB4JXggb3BlcmF0aW9uICVzIGlzIG5vdCBzdXBwb3J0
ZWQgTElORSAlZCBGSUxFICVzXG4iLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
YXNrLCBidWZmZXIyLCByZXNldF90eXBlLCBpcF90eXBlID09IEFNRF9JUF9HRlggPyAiR0ZYIjog
aXBfdHlwZSA9PSBBTURfSVBfQ09NUFVURSA/ICJDT01QVVRFIiA6ICJTRE1BIiwNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fTElORV9fLCBfX0ZJTEVf
Xyk7DQoNCiAgICAgICAgcGNsb3NlKGZwKTsNCg0KLS0NCjIuMzQuMQ0KDQo=
