Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A25CAC59A
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 17:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940E610E24D;
	Fri, 19 Sep 2025 17:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b3r0maY4";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013022.outbound.protection.outlook.com
 [40.107.201.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4952F10E24D
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 17:10:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQjbBTC5cqjHRtWKa0OUU3l+oTJynhT99/PTT+Mx3Z7yLbGwL9u+y4jrYP0dJp5FmLeNJCilD56J2oUgWrtSN5sPu7Pfg+Gx6j5wETpZFDXk9QCnGZRAOMSf2vTgoZg+9u8VsWtIBH2S0BrFLnAHgMXzFp3E5sQ9Dfira94Kr5A/IBEJTzidmlhvoDdlS1OjnDmAI6RFDl/27+AM+ffIV/xykYNa+XOVjx1SXs/n7W3NHmgiZfggVJkSrTdLnipg0XVeS+BYEPMYaBSjnNGmIF2hZ2DPtz6l+j8qQta9yyceoQv3el70naBYjiHnD7HPfiSVqtFJYvWHLO4NXgqyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7Xeqna4hp9zZu29DHAgu08T/lAlQ+xs3EqW0GNMsbY=;
 b=fZ0dMy8iqzPiis8gwGqsXyOpYVzHE5Bq6PIVlaGPw1ft1UyKjJ0xBQuxlXUJtsL4eLKr67tQrwnMBv+w6aOLCpu3NWVSKYSep68rORVwEKp4yBZS7hQGegKyHxLGbBvGV1iZyV4TF9ddTfqV1KRVrwIgVmhNKu5mxQx0OWTt5V+fxjFy4U6cu6eIXtx0XUD2s2hlJcMAmFhAiKAnZO3eI8I6dBqP/iUF3u07Ahd+7mqZgw4ZyGWQEV5rsqMI/T/BZhjxCXPOS/sgNri8/+nfmDsnbF+lQHIY75u/0jTlmm+U7gzlNbt0GAmRlX4zaf95WIEoRPuiAkXZ7f+TkDjgEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7Xeqna4hp9zZu29DHAgu08T/lAlQ+xs3EqW0GNMsbY=;
 b=b3r0maY4tT/SWhpU7AGGFPC7ZoZBxEGI2fVmd/uq6U/NZSjLck1+ll2R4tPz4rHN55HDsjAtDiBX+mXpEe6Y5dvOTRUpQhTSOboHXqG+egqqzFpHcJUj3rrH+4L55mb2egok8AgqDGAhzOxSPpUw4n5sP+kYsOc9k3mq3sRtYcA=
Received: from DM8PR12MB5399.namprd12.prod.outlook.com (2603:10b6:8:34::5) by
 DM4PR12MB6567.namprd12.prod.outlook.com (2603:10b6:8:8e::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.16; Fri, 19 Sep 2025 17:10:24 +0000
Received: from DM8PR12MB5399.namprd12.prod.outlook.com
 ([fe80::fddf:5872:b8e2:9563]) by DM8PR12MB5399.namprd12.prod.outlook.com
 ([fe80::fddf:5872:b8e2:9563%3]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 17:10:23 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Ho, Kenny"
 <Kenny.Ho@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Zhang, Jesse(Jie)"
 <Jesse.Zhang@amd.com>
Subject: RE: [PATCH] lib/amdgpu: Temporarily skip VCN ENC/DEC tests for RX
 7600 until proper fix
Thread-Topic: [PATCH] lib/amdgpu: Temporarily skip VCN ENC/DEC tests for RX
 7600 until proper fix
Thread-Index: AQHcKYZDZ9E+LUKitEyvSC6maSoiubSavVAA
Date: Fri, 19 Sep 2025 17:10:23 +0000
Message-ID: <DM8PR12MB5399AFF80F8739C6CA244AD0E511A@DM8PR12MB5399.namprd12.prod.outlook.com>
References: <20250919165538.70152-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250919165538.70152-1-vitaly.prosyak@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-09-19T17:09:38.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5399:EE_|DM4PR12MB6567:EE_
x-ms-office365-filtering-correlation-id: 33515d62-e697-4d3e-7b00-08ddf79f6bc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|42112799006|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?OSP+0uSNEGWeJaiQmkMDqK8S/UJe4xiSrQdxjBXKa2EFXTx7OT4ilXtxho?=
 =?iso-8859-1?Q?nfSzP03S6+WneGgeh5ptOsIJqX7AFJmN1ibuxAV7QKQILgPyon3Iv/ybTl?=
 =?iso-8859-1?Q?81ncggZ7DzGlu23qRlxeVCd0uMpyALAPbHcj2PvcTk5shhw5Lv2j73VQh6?=
 =?iso-8859-1?Q?LFUpLaBno5PNb3PfOsMuI8HIeeq8m/QMmZDitOMI10B53ip+wiVB+eCS7x?=
 =?iso-8859-1?Q?1j48yG3fM9bLkUu9SbSM19Qf3+7+SS/Ur7Il80xHME1WSDEczqfd7kwzwh?=
 =?iso-8859-1?Q?Pbd7yLmIq0ZDvJXGAGYQVn/lr+yg13i+3Ky4MpjdVffps1apA3SG0Rg0D+?=
 =?iso-8859-1?Q?36nLbdxnkWDcLY8Ph92wA686eBEycoTnCQzl3jUflhYpJTl/4T8wOXtdU2?=
 =?iso-8859-1?Q?wh+aLW8i2D4m8hJ24M9BNebNIut1bzRxz+a3uFiYXSHHfPLPgCcsJlLiZZ?=
 =?iso-8859-1?Q?U12eWR5pVkYqk5aeIdUKv3IrsC8BLOCOJfQtTEXMf/gdKisPfX/50g75sJ?=
 =?iso-8859-1?Q?dUa/JFy84YDBhgd1/yHXi4WGTe3an+Y5DH/VM79pRScKL5VaKaX6Fg3fcN?=
 =?iso-8859-1?Q?rp46ZjTBFk8i1INXtjs8NIUDWOdYFSyMepXz0ZfDnrrB6Gm+D/Yo/vjItN?=
 =?iso-8859-1?Q?KA96scbOljU2vj8l0apprqDHao4PMuS1+xgi1d/elqKRIVr6nmqd9A3Em0?=
 =?iso-8859-1?Q?0wx84FppW8ERvGxkgw/H0h6SFNruEajK5K1masykD062fRT1aUNNKXIK9w?=
 =?iso-8859-1?Q?fDajwUcEP00Qk4XzYkeiVeutSLEtY/9BN1KYrL5MeQzlqVX4meer0mVdyD?=
 =?iso-8859-1?Q?1faaKTFmy+OIt5pNqutDzYxG/epOOgeyuFPaYuZ6Mhlo1rGsoPgfDfyrjQ?=
 =?iso-8859-1?Q?h5mAwCDajTGHuuszn3vYFaML0+YEocRAJatr1n4D1S/7OeJA/KbDdc7Nk1?=
 =?iso-8859-1?Q?QpoKCkh1PuPXdoo3Bwo1875z4KyHD184MR3GcojR/DoyIulkcl8hGn/E3C?=
 =?iso-8859-1?Q?fEYorNo0PKHKK+ekNXUfxHyVoSxPtkPGlB/1NEGVfsQY5ogKrDYyLn+u9S?=
 =?iso-8859-1?Q?jAQAPd6/mWAKrW0OTOrO0YZramiT/EUq/oR5sAWKsoyMTGTJVW0D9JH1Sy?=
 =?iso-8859-1?Q?ni3clbfbDmluc3oRSqnWoE9zhob2KYDGzzYfqmEekhsOTnXfdXxT+Bb3fN?=
 =?iso-8859-1?Q?1m8wPLG59nWwHSwQm+Olvk1o7SlXKQLKIUf9PrzskAGAVSziwZJwJKbnOl?=
 =?iso-8859-1?Q?AYhMS6Pov7w62kjYD6JNUa2ldC9q30i9D6qGT9gB5QmBVnfG77Th1wyiFt?=
 =?iso-8859-1?Q?6dG/BDu5uYijzJooXzCFIkmT/emIVuaUH6KhOQjfJvHyc5BfuLxF1vH9iI?=
 =?iso-8859-1?Q?HgLiIrrI52VpCxmfAvXeOMONF7MZhs/ZL5i+sILvuKiLWvQjnuOoJss+r8?=
 =?iso-8859-1?Q?J4UvCKuIcIA0cvDhSQUup2oJ3nmEGG8B0NPqNjrnx/cUaDwPIc3piCwZnW?=
 =?iso-8859-1?Q?gPf/6n/TH44EebeNeuMCHf/LGFEtQ/cpqzgH25JvGiqw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5399.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ESsCBi+e5CqB5MagsFUFStYwwttsTxhviY40eRy8nwDbdAdPTOkwGBfXHt?=
 =?iso-8859-1?Q?X0QuQ/uOEBLi/ydp+8dGC2KWf7C7BW8q5288dk1A9rmpEgGp2I9z5kUovS?=
 =?iso-8859-1?Q?Kqm0NEvKwrADC1TARATgUPNwvH/o1fPvhuMT2dZr+cu6pH8cIqLP1YFOfo?=
 =?iso-8859-1?Q?OAuqdEnSYbS2RaA627qccYAI6Z/jTgVaxO+qmOM1cCmzSzydf4JdI8Xycx?=
 =?iso-8859-1?Q?GnSwZQTCOhmU4KoHWScIEp4uTlf7DrzkaM0/sUgeJikgUq6sAGWfsKjwTI?=
 =?iso-8859-1?Q?pytpSF9Cx6U6cmRWCT/lM/4vAshrmt3mYW21Tm8YoSM/SgrK3aTbD/UC0I?=
 =?iso-8859-1?Q?l/xviVr8P+dbEz939qJBNaGfIUSyWTUj/vk0oP1YW5W0S5tAX8c8c7jUdj?=
 =?iso-8859-1?Q?Cr+rp4vRsJW4eVVNiVUWoBewPcp/Ki3lcOzlm8YziuaVjx8FvH3ISL+55Y?=
 =?iso-8859-1?Q?q5VKes4EkL6LiSJMD8nMkTKG0ytzjtz0zqxgRbJRvax6WagrGbbmCfG5FG?=
 =?iso-8859-1?Q?ntcSBpmmdW8Y/9H6LQuIhoxR52zzFkQEwlW8n9oyXmroVJVK1q3rtPraVA?=
 =?iso-8859-1?Q?uckJLra67SRO4VrB7ZqPhQdXUHLOcx+WPEfIrhF3b0R68vKW5wW3y9JAmC?=
 =?iso-8859-1?Q?Ur67/gVSb37opLWS9vxvzYwrz7IstH2ewWHRIF+Z98lGsNRaB7FWH8HXQK?=
 =?iso-8859-1?Q?mZprfhuLC1ADLtQ4ylbVrcyUvpuBVNtzJ/KNhLFsw+aiEbKT9eus2l7nv/?=
 =?iso-8859-1?Q?FcJMHaoZear5wPKNM6rS7KHpA9X0u6GuEWSynGKHARhwDg6chJL9+MD0Vq?=
 =?iso-8859-1?Q?lJWBNI4HggHT91e3BICnpuHzhfrZz7N3CZtqvr2BY4a2jgK92zGEU5Li/U?=
 =?iso-8859-1?Q?PCrvRX8eK45z4YEGfljgKDpDEJ49bCBxpHL98L2izrt9sj+BdvphGmXoyf?=
 =?iso-8859-1?Q?xvk7MrrMGjcLhbxnAnb+o7rBzGLZDeC0YJpW4eOW7+9rQ3kccRLVW/NIci?=
 =?iso-8859-1?Q?lOyfix7nJqwNrsdGk7dazwgrW3ciNEksWWDX2hW0EXPgQgGamvsaQkPnIE?=
 =?iso-8859-1?Q?kmWSKkARISPNO1bZj8kk28VJ7Pc693lt8JfWdYckQsUPc0JAcENXrPC2M9?=
 =?iso-8859-1?Q?84X+XqSINHTAJ4KvxMjzTLqxUwferko2hYuMo/g8Nv4ZcbzPu9lyHZmkr9?=
 =?iso-8859-1?Q?ox/Kj/gWzCsfjN/bBLJRFU6jz87uufxSPhy7G5da6vJmZK4iJxUpsIcs2b?=
 =?iso-8859-1?Q?PVetK+J9UD5Ju5tgn62Tkot/cqtJV92RVTjfClGT6TrQYdmKVNQyMlRpIR?=
 =?iso-8859-1?Q?8effwL7NQ6XgZmOTHgtqpLs3lb9XA3nQz/2RjCxK15cBDZMT/X0OU/rrXw?=
 =?iso-8859-1?Q?rQKt9JL09uNLWR9uQiN3Rvs+Ra5Jj8IbU7qvuIXvGy6f3KrZ4tVfchfcqb?=
 =?iso-8859-1?Q?hr8Jnjyz0AEQd3Hwl/2Sw1AZkTAY42bslzhDad7JF6hAYo21+MQlYMwsub?=
 =?iso-8859-1?Q?SXUZ1sOmx2GokZI+ubSq5aH3WoZVk/3aBw3FRC258ruMZrE/5M3ShMqP5q?=
 =?iso-8859-1?Q?56gnr/4Q8iWeofBQNs55iRuxUwPvYw+sYlRBomwtzQHgn0nPgqm44hYAi5?=
 =?iso-8859-1?Q?uP8uQtDj5G8tk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33515d62-e697-4d3e-7b00-08ddf79f6bc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 17:10:23.6125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AhIsx74AVKRyP8KbDt3O/R0JODsHfQ8tMAOxpOGbPGR+1RJsl1y3HQtCd1TsOH4M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6567
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

[AMD Official Use Only - AMD Internal Distribution Only]

Acked-by: Leo Liu <leo.liu@amd.com>

> -----Original Message-----
> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> Sent: September 19, 2025 12:56 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Liu, Leo
> <Leo.Liu@amd.com>; Ho, Kenny <Kenny.Ho@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Zhang, Jesse(Jie)
> <Jesse.Zhang@amd.com>
> Subject: [PATCH] lib/amdgpu: Temporarily skip VCN ENC/DEC tests for RX
> 7600 until proper fix
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> v2: Fix comment to GFX12 (Alex)
>
> Cc: Leo Liu <leo.liu@amd.com>
> Cc: Kenny Ho <kenny.ho@amd.com>
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_vcn_shared.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c
> index 3888ec112..61075d8db 100644
> --- a/lib/amdgpu/amd_vcn_shared.c
> +++ b/lib/amdgpu/amd_vcn_shared.c
> @@ -59,6 +59,13 @@ is_vcn_tests_enable(amdgpu_device_handle
> device_handle, struct mmd_shared_contex
>               context->vcn_reg_index =3D 2;
>       }
>
> +     /* Skip VCN tests on Radeon RX 7600  (GFX12, chip_id =3D 0x51,
> family_id =3D 152) asic_id=3D 7550*/
> +     if (context->family_id =3D=3D 152 && context->chip_id =3D=3D 0x51 &=
&
> context->asic_id =3D=3D 0x7550 ) {
> +             igt_info("Skipping VCN tests on RX 7600 (family_id =3D 152,
> chip_id =3D 0x51, asic_id =3D 0x7550)\n");
> +             return false;
> +     }
> +
> +
>       return true;
>  }
>
> @@ -188,4 +195,4 @@ vcn_dec_cmd(struct mmd_shared_context
> *shared_context,
>       default:
>               igt_info("Not Supported!\n");
>       }
> -}
> \ No newline at end of file
> +}
> --
> 2.34.1

