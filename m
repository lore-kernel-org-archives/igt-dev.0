Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386B7C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 13:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94AE10FD5D;
	Wed,  8 May 2024 13:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZVp/81S9";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093E710FD5D
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 13:07:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SR9wd6ccwLaehZN+ZHmFT54lCM0q8t0z2STBDP34V5gmK5scgkJ63litTKh0qxzWbJxqMAdNPoX4L3P5LrGmwuU9rqNgAQPH0e+nSfGODfagYooMJ+FGTRSe//CUwnQArlrM2mqXTDYtbJ0G35pF6BIFuAq5DRH40FNSB8WoATDj6NwALpZL8sNQ49UirUwnSMubeJAKt6T/Vr063aRoulLOoYZizUqe67gYMG2L+jUNm5KEq5NsepfIriPYyaCGiNOnPWMoGT2kbyhCPgNw0Fx3B5zAk2UZ14rZTzWrHYt+IHysXcI0NAWlGSMXi5OFvEUOUNztszwwmKvVYbDveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/kubJjHO7kbw59XbrkzN8VAcNhqEhtqYpjHmAPjnwE=;
 b=gTnQIqYD72OYNKqio8YXjYsxxumVVz7UyJXrhHCCxBXg+U9h+TZ8cDplCVigxldS5wOh9vwc8syKGDM5BcV5YLOMeyuQE39h0sq3U5o1Wixql7dksSWUnF9UuvE8l7RqA6omkz4s8kdjyDLEvn9mYn50aHXK+pqbFA8LHy9gFFaEpcn9k0vC45simoc8HawV/92s4whpyyCXsf2hRy6WyAXJvWQGYWOY7/MaIRzdV8ueK7D1+b5PywIgidFydcC6wbBhMOzLNZwo0ZCIufTq90sy3HcOFFhtHZ1P0xGeOt+8hQLNF5A0KmfYw/A3r8L7B9ejLQv3fmQBBjhVlF6q0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/kubJjHO7kbw59XbrkzN8VAcNhqEhtqYpjHmAPjnwE=;
 b=ZVp/81S9KTCzRW4FQ+S5yOI7UMbMfeSgI9R5ZOl+4fY6Rkm8p2HhuAbXqsFblhXNNRNNEFMEthiIJu86cJcXbo4AiR0ueLxY/gnKSWYicK1LZwxWxfkTbqIOLLk0BdRRSxEVdV4fnV5HWsrH2HmaL0NGWADDLd8cTkyfZEuUDUU=
Received: from DM8PR12MB5399.namprd12.prod.outlook.com (2603:10b6:8:34::5) by
 DS0PR12MB8786.namprd12.prod.outlook.com (2603:10b6:8:149::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.46; Wed, 8 May 2024 13:07:06 +0000
Received: from DM8PR12MB5399.namprd12.prod.outlook.com
 ([fe80::fddf:5872:b8e2:9563]) by DM8PR12MB5399.namprd12.prod.outlook.com
 ([fe80::fddf:5872:b8e2:9563%4]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 13:07:06 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Zhang, Boyuan"
 <Boyuan.Zhang@amd.com>, "Dong, Ruijing" <Ruijing.Dong@amd.com>, "Strawbridge, 
 Michael" <Michael.Strawbridge@amd.com>
Subject: RE: [PATCH 1/2] tests/amdgpu/vce_enc: rename file
Thread-Topic: [PATCH 1/2] tests/amdgpu/vce_enc: rename file
Thread-Index: AQHaoL8IhNmyQvfYGEeJM8cxOnvfhbGNTxdw
Date: Wed, 8 May 2024 13:07:06 +0000
Message-ID: <DM8PR12MB5399819C5FDADA2EA5CCD4AFE5E52@DM8PR12MB5399.namprd12.prod.outlook.com>
References: <20240507204205.217882-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240507204205.217882-1-vitaly.prosyak@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=f4d09248-551a-4b5a-8eaf-f498415f2268;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-05-08T13:04:42Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5399:EE_|DS0PR12MB8786:EE_
x-ms-office365-filtering-correlation-id: 8a53aed0-c8b9-4797-b842-08dc6f5fc32b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?RRUURdhcJ2YcFUUKQd99gXaJIUDL/wOabVfdZz3ckZp6NDhUpTd1scPc66u3?=
 =?us-ascii?Q?Auw7LfNqdOIE7sLal7HIEstWvv187iMDwSeTyT9EWlOzycV7/SFIAy+rwRC5?=
 =?us-ascii?Q?2JUl+Ixq6u8y3f8HYuWGbfRKQPVGsqEpZpqp7SqBedjQx/jSED4TO20d5UUG?=
 =?us-ascii?Q?3FoSsifxJDT+h8bLenNyLK4BwJA7sn/pSo0UgZwnAoRwnO7gLfIrEXJBYKhq?=
 =?us-ascii?Q?64e2rXQ1m9rME45gVMwxU3NZWh2frRW8nBXUSG2AX9w51l1zuOd7HER6w0iU?=
 =?us-ascii?Q?kfbsGli2b5K0JFX/cEjhybG3KflhjKZqrClT+hgrXpY+JS86bRDATwdrNxTI?=
 =?us-ascii?Q?lWkDtmTrzSZ5U0ahjaR91bfWlbVvqiU0MzDTDM391DxfRvTw0+eqU2SwNcu3?=
 =?us-ascii?Q?AHeQU99W745RAF3K2Sgl47fF6JCguxRpr9K3Zbxy3Dg2piCACQ3cT7OjpGKb?=
 =?us-ascii?Q?8YtVn4HHLXSl5LBLTVhHMwQaIwbyrpSoaLgLzo7lp9OX8Q7SOkuYo6/Byas4?=
 =?us-ascii?Q?u+A710tXzKwJWiVcw36cn67RZ1fZi72RtgDXW0vU9n+8RgITKKbz6djf7wSW?=
 =?us-ascii?Q?hIU1RT3c5lqWV4P0BdoxKmXIfaAs4C+NVN6SXvRC/+Twq7A1ICIbvQV96vBz?=
 =?us-ascii?Q?ySjoA/AzaEFK4Su7YZ+zpe8u/x0xrRG76FeXuyvedLbf3oG2Mmjx1qGlYJ9K?=
 =?us-ascii?Q?SbFWx29LT3L45jJUOCfP/QYMVqnN9Gu8VrpmT5BYu+oTKHKP0BbE9D1QYN77?=
 =?us-ascii?Q?E+g5QQI5ACsK7EwEdX91Wa0kET9eoWMpJsf23J53ymwnZELb5TJGe5RHrdxf?=
 =?us-ascii?Q?6iYzYvGaqHvk02tAjHeVTQydtD65xPrtT7z05+C2MI6q+HQPM+6SlU6EEU9V?=
 =?us-ascii?Q?CWuHhk+ifcLXq/E9S2g6dznquKKhq7N1HnxA0mdEEmZwXhjZN8QZhM0gHT7I?=
 =?us-ascii?Q?L+ePxUzgj25Z+7wE6h89x6T1NmQlSjIyZJtpuMkGZYd4UYLlFAVy6I/NxUdy?=
 =?us-ascii?Q?5bRbmqmqiw8dMZJqb/PwGr47ebF+54+ThHCSyqNfuwQRd7z3zz4jYuKJjEKK?=
 =?us-ascii?Q?iwJG3i++jMB4vmPKiNLAPJ4NbEEt1QO47mN+mysCTSraRp8bLUGF3RCJbmcC?=
 =?us-ascii?Q?dmsO3vfX4nsmZMllRpdEltMC3cSefFeWzXlzvS81Q/T0XSN2eQNXlQ8mi2sL?=
 =?us-ascii?Q?S4YGll+IyNPy8yWgIIYAWaCGuCVfqaK/IUt9TNYuYexeHlOGiu3xUZESA5PF?=
 =?us-ascii?Q?+uNlJY/gI+DqyO0zu/Ce4mYw0WWE4XH2JXg38iMxWmaEqmeKPfQ2fA5rP7+N?=
 =?us-ascii?Q?4dymp5I4jKUslkp+WmDY23Bz+nL5k5UNP3Ecoq0kXRTDPA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5399.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?439WZtEeAP6II3XwJJ0xRHb3z0RzLbazYpwcazw1Unx3d5zWALaCEF0aVTeY?=
 =?us-ascii?Q?1UztOfCeFyIlMAjXqPpMtpXjPObFTNlDMu1c5iDBjFSYOwQDdtFAqGQq/hKw?=
 =?us-ascii?Q?RYNlxAvsM7XEsxU1T8JkhPK1psR/TTsaZWOwdOxt+akexRJrRpbNELonkGwz?=
 =?us-ascii?Q?5zSwxd2ywh9Tt8XbnF1SSbvNZ26ShIcygspJUJ+PSqfnVm9hQeKAkftvLDJO?=
 =?us-ascii?Q?TKR4LAlPVsGq9MSj7oQ7zswtR5MTWelyRs5PkN73rrebFA3Ssq4t7JFpsRaK?=
 =?us-ascii?Q?+13z4pX/RgxMHIQ+TXGSNTkTzgN5Lp5qHzvCgdJ4RIQ+vX47t2s5yjMnhN4A?=
 =?us-ascii?Q?tytfnxEVo9Zl2TksjxSAs14vD2Nshjuf0XGv67fCA2Sd/c8V0260A+XEN68z?=
 =?us-ascii?Q?goEgidlarPvp3Mc64q4lHcmr2umtE6DMuxONOonp0qprGkruanxx64xwceVy?=
 =?us-ascii?Q?0K/A3ujaGYUTnpKymWyAxlj4WCcqDeCYJ9f1rrXOZx/MveiS/n1LTEWn/PiF?=
 =?us-ascii?Q?U4tFX87onuxIiduxhZYDXExZeXY9r3OrX1PJZuzDMNIM056k46NsQ30vgmFQ?=
 =?us-ascii?Q?qrRQpJ3UTbtl6sAp9tf+6UE5AviJldraJn6fJdym+nloLQbgwHsXt6gqA6VE?=
 =?us-ascii?Q?gUPtiKoZt+5nwheWtr3ecrVOlsyn0VUsIVfXZ6hN7vkDAgnVheI4z1soVV/d?=
 =?us-ascii?Q?PFQexD3yHlf+QSzRhf6Xaav8ueHTb3DZXSICdMkQrHMU8yKY0/+aVXUSzPwM?=
 =?us-ascii?Q?qSzhdpPGJnUwQ4PqA464e+b/Dw9h/Hj7yunTn3BW4hs20VzjfuLUW/gwdxeW?=
 =?us-ascii?Q?v2buRt8Vw01ZW9Bb+hnJkzhWeEuRenx0+3e7BZ0pGnO9iGSNhmuUfQALJjnV?=
 =?us-ascii?Q?kF4hKa1W81N2tFhl0SgUFngN+e/OMb7eb8McAAaXwWj/sSf9jLdjxkWy8CHD?=
 =?us-ascii?Q?si5juke6NHC0DhYl/s8AzgmkrFKNczW1mJIgGUVxL7mpaevl6ZjUrzF3db1J?=
 =?us-ascii?Q?gu93zO5F9M3XnPZ9yeQmIeAQFULJrKcRVHAUdEtTFH0bvxIhWUxTYCyaE6mQ?=
 =?us-ascii?Q?kPWdmTZaFXZK44reZq+oQYJY/0e3RtbfEyiCTZmulpgEdWpku56bw/XdI7H7?=
 =?us-ascii?Q?x5YlW/1b4O8BncgXY0zb9LuJ4T7oOtXcZDFO75cVOqzO8UItwOLN9zOcxCut?=
 =?us-ascii?Q?4VIDadOI8Lgvne+42/9iXo7Ar0fEIie8o6bGuDkZaLjSzfat0S0IhWQYdgc3?=
 =?us-ascii?Q?3gL71mdRThK5oAdgL2/rCpciEL2cka8AS0N/b0Ta2eigHhEc3FhNpsDIm8AS?=
 =?us-ascii?Q?Zkf2vc6o9y6nqb2Cp1V6GoctaJbkTIgtqMUKgWbdRQMZ5ffOQ6yNDA43cPGW?=
 =?us-ascii?Q?uE4+ITu3S9oXTrAgNB7Ul3bWXOPLqtjrfrWxMlfq5f1BTcfKReIDy5ERItYx?=
 =?us-ascii?Q?9MSmWs6r7Jd2d2FADv8YKRgzjHQPJgIV05i4OsMHVAggIoynm25JdJFWgNWc?=
 =?us-ascii?Q?D8svtbkf9cC8LcNl4tf9ZW7ba4b1FNz0Jf7gjBJ3flKnAiLs2cBKIdYI2Wv8?=
 =?us-ascii?Q?Mh8sdcZGfQru1F53cAA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a53aed0-c8b9-4797-b842-08dc6f5fc32b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2024 13:07:06.6476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cseLT5cL2NLWThBUoTJwj3HR1asWn3vBP22b4sTEIYD+fdPxp/MPXvKoSv0e0qwo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8786
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

[AMD Official Use Only - General]

The series is:
Reviewed-by: Leo Liu <leo.liu@amd.com>

> -----Original Message-----
> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> Sent: Tuesday, May 7, 2024 4:42 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Liu, Leo <Leo.Liu@amd.com>;
> Zhang, Boyuan <Boyuan.Zhang@amd.com>; Dong, Ruijing
> <Ruijing.Dong@amd.com>; Strawbridge, Michael
> <Michael.Strawbridge@amd.com>
> Subject: [PATCH 1/2] tests/amdgpu/vce_enc: rename file
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> It was a typo , now rename amd_vce_dec.c to amd_vce_enc.c
>
> Cc: Leo Liu <leo.liu@amd.com>
> Cc: Boyuan Zhang <boyuan.zhang@amd.com>
> Cc: Ruijing Dong <ruijing.dong@amd.com>
> Cc: Michael Strawbridge <michael.strawbridge@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/{amd_vce_dec.c =3D> amd_vce_enc.c} | 0
>  tests/amdgpu/meson.build                      | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)  rename
> tests/amdgpu/{amd_vce_dec.c =3D> amd_vce_enc.c} (100%)
>
> diff --git a/tests/amdgpu/amd_vce_dec.c b/tests/amdgpu/amd_vce_enc.c
> similarity index 100% rename from tests/amdgpu/amd_vce_dec.c rename to
> tests/amdgpu/amd_vce_enc.c diff --git a/tests/amdgpu/meson.build
> b/tests/amdgpu/meson.build index d7152a356..3982a665f 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -33,7 +33,7 @@ if libdrm_amdgpu.found()
>                         'amd_security',
>                         'amd_uvd_dec',
>                         'amd_uvd_enc',
> -                       'amd_vce_dec',
> +                       'amd_vce_enc',
>                         'amd_vcn',
>                         'amd_vm',
>                         'amd_vrr_range',
> --
> 2.25.1

