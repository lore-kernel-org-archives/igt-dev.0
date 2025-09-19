Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD6ECAC59A
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 20:56:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0EC10EA97;
	Fri, 19 Sep 2025 20:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZrmssGMH";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012011.outbound.protection.outlook.com
 [40.93.195.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE07D10EA97
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 20:56:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2fVA51/NOuyOk3DQetA3YrlnbElu8r5+2YLjCIhu9aB3Jjfn+c8lrmGQsFWgD+WHmDqoimRFd4bazVQUzhSC7334XkQWl1VF3Jml9YDUvIUVYRT7SgfhDY8p5/T/EW6+jPBPZGDTaQJI9j11SR1KFUusUHYPMyWRz1Kx1v7dAMiUQhSFeh8Y9jsrPNeTz102LAk81uRSIvZT4bJ747674uboNuz9GqCYOBUk5ewr8OvNtyH9IttZ3mIYm60hDVfCFdRl9vbaqWpm0efShhpE22M+7EeV3EIBmcDoaGwUp6bNRc4nzGbFz97rSfgOOfFL4tz1yVdRBXCcip8u2cyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkV2kH/iYOQx0YqgbcLk2Y0rhBR3b9tJIp/fh17xeyQ=;
 b=PbfqWgMK9sumVVj5uJMS5SMo01b/up+pqOP8tcwGPq5YAyeRCaSJVoz0E/TmCWGagv18OCotG/2/pfmpuHt+HFfPWJtd1uCxA6xUQREboXUR3ORCCJH+uhPzkiBxxZTutc1TG7wzxyZye5R/3GM1el+hLlHL2aQt0eeTGpAlLyLtbFuj30ssvNaRU2K1Q+LWrUt9Uwp+xic5qds6yKuAYeE6qw8xsxxXG5Um5p4IDyHAEHQgorPDc7Zg1VuTPGXNd98Kh9rFXzNutWY7pb/CfbKG9STfMovcHzy/PxxLWD0GbDyHoPcOG8ZYjKZh8laQDtN+9ykF/1B5kAOJuf+26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkV2kH/iYOQx0YqgbcLk2Y0rhBR3b9tJIp/fh17xeyQ=;
 b=ZrmssGMHa/0s7UGncfaApRmoYHGCr3Cg102Pv9X/d4OQxGIwaorSO9Ull/+SeKhwB2S/4AIT4tAruyB6MpiEcWCSMmuLMSCxkGYLEdgjOuTe3aBBicgL5Zlcf1KMQg2Zkr772pE55xrqFpGiU6Ws6X6xvGdxOiPM817cMAeDiy4=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by LV3PR12MB9117.namprd12.prod.outlook.com (2603:10b6:408:195::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 20:55:59 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%7]) with mapi id 15.20.9137.016; Fri, 19 Sep 2025
 20:55:59 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Liu, Leo" <Leo.Liu@amd.com>, 
 "Ho, Kenny" <Kenny.Ho@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
Subject: RE: [PATCH] lib/amdgpu: Temporarily skip VCN ENC/DEC tests for RX
 7600 until proper fix
Thread-Topic: [PATCH] lib/amdgpu: Temporarily skip VCN ENC/DEC tests for RX
 7600 until proper fix
Thread-Index: AQHcKYZDfQ9bYZE4D0+pmH+9B6Bi1rSa+7PA
Date: Fri, 19 Sep 2025 20:55:59 +0000
Message-ID: <BL1PR12MB5144BBDD90431995DCF16A4CF711A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250919165538.70152-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250919165538.70152-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-19T20:53:03.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|LV3PR12MB9117:EE_
x-ms-office365-filtering-correlation-id: 8c0da88b-d55f-4200-3741-08ddf7beef9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?R3RnRVB6aEZ4czVFS2tJVDZlK3V3dCtGVFRtazQ2YWliRXgrOFJneU5rWFZ6?=
 =?utf-8?B?QTJ2SXUrdk1aVnJuTTU1b09lOSt0cUtYdFQ1QzdRWk1QNElnaFBaSGIwTEdw?=
 =?utf-8?B?a0t0blpFNTY3QlJDYTlqbTcwTDV5Rzl4bmhJQlJxSVVKM1hHaXQzb3FVc2Yz?=
 =?utf-8?B?d3lUSCt6V0h4bVZvYTA4d095dVRmeXZjY1pWbHIxbm44c1ZKNWZDWmRyUCtn?=
 =?utf-8?B?a0VxeTVpVXVINHlMS3JWSXdxc29GbTZHNUtRTjEzbWpFSUtxN2liZ3F0R1Ax?=
 =?utf-8?B?QkJCUGt5OHgyNk1vajdmQU5tcUNvbmkxdmRyV1NpTjBzWGh2VzRHY0xsVWRM?=
 =?utf-8?B?cjU1bWJ4ZVFXaFVHMHU4TXFlb0xoak9WOUtYemlDZ01FS1BuTlhkeTBTT0Rj?=
 =?utf-8?B?MVRvZEFZUUZsRktNTnNaZHkvK2toZXZmOG51dURKMmlaODJWWTFMT1lZakZ6?=
 =?utf-8?B?Y2NrU3lSY003U3BHZWZQNFBPb3ozTDFWRnZySHJ4TzRxV2wzdXhDQ3Qyc1lP?=
 =?utf-8?B?TmpKa0FZV1l3NXlrUm5Sc3U1cjhucjBaRHFTay9QUVVMZDhTRXUzSDVzVlYx?=
 =?utf-8?B?MWJQTkt3NEJ0ci85N1FXaVgvdDFabi9BVExZYVYyWG5uSTQ0TjNTWFowOFpB?=
 =?utf-8?B?dFJxSG1CRDFaYzRkSUlKbm9pbUNmeDhyWjJiZWU5ZlY2OTBjYjdVZFhrMDNz?=
 =?utf-8?B?ZVR2NGNBRDZpa2Q2RzVrTkYyRUlpb0VIU29EcTNnYkxEV3BhMmtQSWlNdWVK?=
 =?utf-8?B?T0gwM05xalpXbmxFaEFJTDVGeHJVQzUrV1FLY0pJRjZXeVhMSXIvbGlVMkRJ?=
 =?utf-8?B?VVNEMkdPd1d3MzVnR2ZNeStzNEJ0STZTS3ZmdUhVaTArVGp5czdvQlRsV2hX?=
 =?utf-8?B?b0JRT2xySUEvNENSaGtGUThXaGJqOS9IOUw5d0pYK2J1TDhma2Zrenl0WVVs?=
 =?utf-8?B?QkZvVk5CZkhyRVplWjh5NEtSbGN3cUc1QmJ1UXl1aUJJLzBEKy9GTldlMnMx?=
 =?utf-8?B?d2F6eERvdUFDVkZGcFJaMnU1VE8vOHBleVpHQTUvcnduU05IZ1dUWDhpbDVK?=
 =?utf-8?B?NnhtSUE4bm51Ym40YWdDK1FkQzFSdkgzMGJCSkQ1dWZRUjdjZ1hvTlJjTEhx?=
 =?utf-8?B?ZXF0VUFMZHZCeThteEYwK3NpQy8wNVJWdHlvb1FxYXJPMVRhTUw4YVlFMnBR?=
 =?utf-8?B?RW56UWJCN3dpSnhPUWRGN0EvOWg0clI2ZEl6WDVQWFV6Z0tnY3dsV2NuT0JF?=
 =?utf-8?B?aEdPNGVkeVpYbDREcEpDRExrK2tsYnMvVG9SSzlvZHkyTVBYYU16eXlPOVQ1?=
 =?utf-8?B?eXhHV2h5QnVhckpsc0xwcFhVSHBVeXRKeEVkcFV1eTBISkhtUkdZOUZXYTZQ?=
 =?utf-8?B?TXdCN3RqRVU0WXoybTJsRUxld1ErMmp5SWtkYzdzVzN3a2lIcE4wYU14dnV3?=
 =?utf-8?B?OUQ5RFlxd1hzNmVEUmJMMkY0aCt2RGlUM0RWQUdiNVNoMUNhQWFSYWZ1eHJW?=
 =?utf-8?B?eW42dm1HTkFvUjJwQWM0Qno2YjkrWlduZjRGcXJnU0I3WDU0NUQxOEhMS2Rp?=
 =?utf-8?B?NGd1Nm5Sck5UcGdsYTY3ajVOVnErY0RXRmdoeEtmSGQwNk9TVHJFZTdKaEY2?=
 =?utf-8?B?Vk1mVUNINitOMk9hMnVhdGkvaWlSSm8xcG05RlVlRE9UWlpVRFR6K1BlTmJ2?=
 =?utf-8?B?bElIUU1ocE1NS3BGLzRCekVid0trMmpwTEJRSGVkSVIvemdxUjBTb05Ub0t5?=
 =?utf-8?B?cDBGWDl6NFUvWlRaaWxCbkxrN0I0dkZlbFRma01ZU2hVSW5NVHpLQTNEeTJQ?=
 =?utf-8?B?TWtIL3g4LzB6ODFyaU1mR3ZWTDF1Q3M5ODNSRmpyVTd4YVc3UStPQVRDcGlp?=
 =?utf-8?B?d3dZUWVWTmlwbzlDTUp5ZkkveDN5VFliU2ZYWUNIOCs3VlNMenYzR0w0L0E4?=
 =?utf-8?B?MFY1eWtlVjJFUjFtalZGN0dWTHZXTG16cWRTOGduQ1FwV2wveHV1a2dYOXpC?=
 =?utf-8?B?cUVDdDcwMUpnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGFGNG96ZUZZMkdiNHdYMHR5WlRFNzNRSGNJUWJlWlNoQWtVT1NKQlhHYkVp?=
 =?utf-8?B?MCswQ2VxandYdCtkOVF6aWlNOEpUUHBpRnhtTndZcWpOTnlNWVBIN01ucEh0?=
 =?utf-8?B?UHhodWJzUG5pSXZHcVBkVU0wZFNnNmlSL0hkeVNGV21aSXJPUHd0UFNuV2FV?=
 =?utf-8?B?djdkbnRUTVAvRFlSMzd6WVRVUjViUldobklFbUp3TS85ZWFIeUZYQzlzNFJ0?=
 =?utf-8?B?Rm5yMUpCaVRXVnlvbkdPVVBUZWJ5M0FkeFpCZkYxclRYK3FYMWNMQ29BYnVJ?=
 =?utf-8?B?aTd0bzJPMzJreFhWNkkwK3RpR2FEd29aVVhzNklxbTl4NHNlTEpXYmppVG05?=
 =?utf-8?B?Rjg3aHQyalh6NUt1cXFNbVpaQXVaR1M1OS9kZkxBSmhwa2JiNWVoeHdNSG9s?=
 =?utf-8?B?TFQ0YVZQVlpjZDBoOS9HbXZHczU2MzNWS2xGZnc3Qk45S2p6cU1rMDFmNDNN?=
 =?utf-8?B?ZGNlQkFJOWNEdlplOWdHczZleGQvMFBRQWJIaWQ5bmJSTlJsZDcvM1pBSk1T?=
 =?utf-8?B?cjdTWUhhRzI1T3V4R0FZWUl3aUMzRmlDSXVUK1d3dUxJVERHcEJoVHN6RlND?=
 =?utf-8?B?M3JZMnB0NDc4cDNkTUhqaXlSeCtJNVhIVUk5aWhHVi9XZWtFYTBCckRBdGZY?=
 =?utf-8?B?aDNHYlFSTXJrWEVzbi9uVHc2SnkyNmZNUzZsUExLVDJ4RTJVbUI0OVB6UjQy?=
 =?utf-8?B?Nk85NFlvZEV2SWkxVTkwVGM2Q3ZBbjhDKzFHK2FLYlR6SWF2TlpQUmJTU3h6?=
 =?utf-8?B?bU9CZEFISzArTWFlc2o1dmNZZTZtWUdkWlpBMEpQWGxqTGZWS1NqNlVvcmkw?=
 =?utf-8?B?QVVUd2U1N1ppRDZkSTZXRUhScFZPYjdEbjI4Z3RFSnc5N00ydm1jS0N3Rm1L?=
 =?utf-8?B?dzFxZlJSRUVBbTFvV1RENGxhMWlWY3prMkUxd2ZQRVB2SnQzdGFGNjNZNmpU?=
 =?utf-8?B?dlR3TytoQmk3dFpEanlrcWR6T2hRY0JrYm94R2JpNkprTDRVQzF4VEs2cFlT?=
 =?utf-8?B?b1RrdmpzOEgrWGFaQjZFVUI3Q2thbnV6MGZkRWU3bnZRZjI0cjM2djNZcVR6?=
 =?utf-8?B?NVZNaFh6RVFIU1BsQ014YjVhWG1JVFZLNi9YQXJFSkdmSzAwVkNENWdSRDNk?=
 =?utf-8?B?RERWRWZPSW9ZQi9nN2JFUU9jN2FkRWFYcTZyb1p4QWlRNU1CYll5QUtTVVor?=
 =?utf-8?B?aFdpa0FDaDd3QzJQS2VHT1BwQjhiaWtRL2d5MkMwTlJVc0RHbUNMbDdrdUV2?=
 =?utf-8?B?UUpwNkZaQXVrc1haVUxLODUzMi9ZTzJSYlhTQlhOOWJ1eDNIdXd0M1J3emxM?=
 =?utf-8?B?cTZ1UlplOHNSaEJ1MFptbExtOHR0SE5EV29XZHNGRG1LZlFpL05vK2JMU2gw?=
 =?utf-8?B?bSszRktjazZDWmp5WWN0REYyQ0xpM0l2RExOS0swUjE1RHltZlVORFZkVlVh?=
 =?utf-8?B?T0JXYS9hODZVKy80VktOYlZIK0ViNlc3b0hZM3A1bWM2RWtBOEpIYnlPbDRv?=
 =?utf-8?B?bXdYUEhDbjFBWEFKOGxvQ2pqYTdOU0l6OVlCcU9JV3RUenBQVmtPbG82SmFo?=
 =?utf-8?B?RStQdjV2amp4bmJ5QjBDd2dUNjhyVVZjVHJzZENrVTB5V0ZJMTE3Z21hU2ZF?=
 =?utf-8?B?OXVlUzF1RDZCSFZLMGQzSGVWeU9SWlJ0bDc1VjBtRWxuYmdleUlRNWNGVlRn?=
 =?utf-8?B?OEVKRTZCalViTi8yNkwvb3pqZXYzeGRqclloMXRlbDl2MW1xbWFkS251NjdG?=
 =?utf-8?B?UVhUK2VlcTBVa3pCRkhYNlRNbG1nN0s5TC9YbW1BRlRSWU4rQ2tyR1V3WVcy?=
 =?utf-8?B?cUpqa1VUZ2JCU09QSWdPVXIzQ3l1L0piS1RGOXJ1KzE5c29WUEVyK1BDUnZj?=
 =?utf-8?B?NVBvdXVjN2xwNXZIOXJxcWt3cWt1bjFUTjhXUkQ2ejIwVjNtdjg2aEliR1A2?=
 =?utf-8?B?MVl6dUZyUFhzU2NoNWdUUytNTVZmOVpJOWJ3T3RxWTQ4ZzB2SDJJMTg5YWRl?=
 =?utf-8?B?K1JhRVBJaGpMR21kbjlSMmpPZzMvaWNra2l2L25wczA0a1VJdjIvRVpQWkpV?=
 =?utf-8?B?T0k3dW5ERXgzejdqVllndFNxQ09TQXQ4S042TUYweUdQTlZiMURjTm15TUgy?=
 =?utf-8?Q?SDs4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0da88b-d55f-4200-3741-08ddf7beef9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 20:55:59.1791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KrWUq/9RxLcnLBQJIYwPf5xPxpORiOuBkcJj5frRWfRo50MR4e5rObJFsY9XhXquKIRdMOie2cNZCwLwLBmt/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9117
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
cHJvc3lha0BhbWQuY29tIDx2aXRhbHkucHJvc3lha0BhbWQuY29tPg0KPiBTZW50OiBGcmlkYXks
IFNlcHRlbWJlciAxOSwgMjAyNSAxMjo1NiBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gQ2M6IFByb3N5YWssIFZpdGFseSA8Vml0YWx5LlByb3N5YWtAYW1kLmNvbT47
IExpdSwgTGVvIDxMZW8uTGl1QGFtZC5jb20+Ow0KPiBIbywgS2VubnkgPEtlbm55LkhvQGFtZC5j
b20+OyBLb2VuaWcsIENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgRGV1
Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgWmhhbmcsIEpl
c3NlKEppZSkgPEplc3NlLlpoYW5nQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gbGliL2Ft
ZGdwdTogVGVtcG9yYXJpbHkgc2tpcCBWQ04gRU5DL0RFQyB0ZXN0cyBmb3IgUlggNzYwMA0KPiB1
bnRpbCBwcm9wZXIgZml4DQo+DQo+IEZyb206IFZpdGFseSBQcm9zeWFrIDx2aXRhbHkucHJvc3lh
a0BhbWQuY29tPg0KPg0KPiB2MjogRml4IGNvbW1lbnQgdG8gR0ZYMTIgKEFsZXgpDQo+DQo+IENj
OiBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+DQo+IENjOiBLZW5ueSBIbyA8a2VubnkuaG9AYW1k
LmNvbT4NCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4N
Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6IEpl
c3NlIFpoYW5nIDxqZXNzZS56aGFuZ0BhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBWaXRhbHkg
UHJvc3lhayA8dml0YWx5LnByb3N5YWtAYW1kLmNvbT4NCj4gLS0tDQo+ICBsaWIvYW1kZ3B1L2Ft
ZF92Y25fc2hhcmVkLmMgfCA5ICsrKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbGliL2FtZGdwdS9hbWRf
dmNuX3NoYXJlZC5jIGIvbGliL2FtZGdwdS9hbWRfdmNuX3NoYXJlZC5jIGluZGV4DQo+IDM4ODhl
YzExMi4uNjEwNzVkOGRiIDEwMDY0NA0KPiAtLS0gYS9saWIvYW1kZ3B1L2FtZF92Y25fc2hhcmVk
LmMNCj4gKysrIGIvbGliL2FtZGdwdS9hbWRfdmNuX3NoYXJlZC5jDQo+IEBAIC01OSw2ICs1OSwx
MyBAQCBpc192Y25fdGVzdHNfZW5hYmxlKGFtZGdwdV9kZXZpY2VfaGFuZGxlDQo+IGRldmljZV9o
YW5kbGUsIHN0cnVjdCBtbWRfc2hhcmVkX2NvbnRleA0KPiAgICAgICAgICAgICAgIGNvbnRleHQt
PnZjbl9yZWdfaW5kZXggPSAyOw0KPiAgICAgICB9DQo+DQo+ICsgICAgIC8qIFNraXAgVkNOIHRl
c3RzIG9uIFJhZGVvbiBSWCA3NjAwICAoR0ZYMTIsIGNoaXBfaWQgPSAweDUxLCBmYW1pbHlfaWQg
PQ0KPiAxNTIpIGFzaWNfaWQ9IDc1NTAqLw0KPiArICAgICBpZiAoY29udGV4dC0+ZmFtaWx5X2lk
ID09IDE1MiAmJiBjb250ZXh0LT5jaGlwX2lkID09IDB4NTEgJiYgY29udGV4dC0NCj4gPmFzaWNf
aWQgPT0gMHg3NTUwICkgew0KPiArICAgICAgICAgICAgIGlndF9pbmZvKCJTa2lwcGluZyBWQ04g
dGVzdHMgb24gUlggNzYwMCAoZmFtaWx5X2lkID0gMTUyLCBjaGlwX2lkID0NCj4gMHg1MSwgYXNp
Y19pZCA9IDB4NzU1MClcbiIpOw0KDQpOb3Qgc3VyZSB3aGVyZSB5b3UgYXJlIGdldHRpbmcgdGhl
IFJYNzYwMCBmcm9tLCBidXQgYWxsIG9mIHRoZSBHRlgxMiBib2FyZHMgYXJlIDkwMDAgc2VyaWVz
LiAgVGhpcyBib2FyZCBpcyBhIFJYIDkwNzAuDQoNCkFsZXgNCg0KPiArICAgICAgICAgICAgIHJl
dHVybiBmYWxzZTsNCj4gKyAgICAgfQ0KPiArDQo+ICsNCj4gICAgICAgcmV0dXJuIHRydWU7DQo+
ICB9DQo+DQo+IEBAIC0xODgsNCArMTk1LDQgQEAgdmNuX2RlY19jbWQoc3RydWN0IG1tZF9zaGFy
ZWRfY29udGV4dA0KPiAqc2hhcmVkX2NvbnRleHQsDQo+ICAgICAgIGRlZmF1bHQ6DQo+ICAgICAg
ICAgICAgICAgaWd0X2luZm8oIk5vdCBTdXBwb3J0ZWQhXG4iKTsNCj4gICAgICAgfQ0KPiAtfQ0K
PiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUNCj4gK30NCj4gLS0NCj4gMi4zNC4xDQoNCg==
