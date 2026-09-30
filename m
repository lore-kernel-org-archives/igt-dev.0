Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6286CCA5FA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 01:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F4110E16F;
	Wed, 30 Sep 2026 01:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3tU3PB6q";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010016.outbound.protection.outlook.com [52.101.85.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480DC10E16F
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 01:26:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaXp5wjosxXACcDXwwG6cHSTf81C+HOfPF4aDEwS5mQVZySAq4pYBtZFyCvfVL+FLGXQn6jmGO0nipSyo+N2f7w6DxKpZQ3U7Vs4CF4Hq9X9yD5O9i/7VanI1DSUtWS4hyr8Nw5NsoKlbySg7uLaFiwOY2WCw1ZWKDKvvSwklCPvngp2kjlz7YW25y0c+luVFEbIb2qh0u+spZxxOndMulHtPFGawNCKxDj5IP4NsjvfLULuQefit/mjugYu6NU7zMG0+P+Gkhh0KVQQa9suF8khBR3QtsQW9vSrTbBoQmfkCxGP3WfaJ4cr+zEV7ldQHcXdU4yPVz0QaxnFR1JiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyAbvt4GXlySQSr1iOU74SUYGKvh5rGCSlu6OhsddOE=;
 b=vHGhDpEUdkg2cPfV7Sis81PA+bZ1uAZfhNLBTkDpC8U29lf1B0/YDQUcIgWy24lCStlWvTthOjZAPv4gIFdnd544754nIKLlo1y+iF+qeZM9ehpKWVzF1N4ihy2aip3DqCmW5q8A+kLKT++CYaRtp1ZFMFNqMoSzi0GlUfGfaY2eNZy9Ws6A86vuL9IE7WM0HaKMidhRSpcHdNUWIKXDjR+n2ya9mBf3P7AgOGV+joumytILhAr5Brog8iTuPCLPofT2x1nMnDd5lAWFa8shjPxNlJLY00tgcbIrgCf8uwX7Sva7096+ClIp24ct8GlYrKPDQPAHSoVjkIjYXuTAVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyAbvt4GXlySQSr1iOU74SUYGKvh5rGCSlu6OhsddOE=;
 b=3tU3PB6qF0futCpNjUQNUtPIOvz79sYJWWZVm4vzwNtRBit5g7UTZ0/bz6QEgvlxL+BzLPn5lH99O0qVv5FexdPlsI8XbFiDbm4FYPMn4H3UEvAH7nR5WTLZiCEWgnmOGovZtRnH6wqiOsr0E5IUopcKIpLzNru9bnStMiECiI8=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by IA1PR12MB8405.namprd12.prod.outlook.com (2603:10b6:208:3d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 01:26:16 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%3]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 01:26:15 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Prosyak, 
 Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH i-g-t 1/2] tests/amdgpu: fix checkpatch errors in
 amd_fuzzing
Thread-Topic: [PATCH i-g-t 1/2] tests/amdgpu: fix checkpatch errors in
 amd_fuzzing
Thread-Index: AQHdT77gB0mXroyPKEW6gZWe1sFWerblWE6AgAD9CWM=
Date: Wed, 30 Sep 2026 01:26:15 +0000
Message-ID: <DM4PR12MB5152B00E40A0F70F1A5F66BEE38B2@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260929030131.3415475-1-Jesse.Zhang@amd.com>
 <20260929101841.siuqpxiubj7tcts4@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260929101841.siuqpxiubj7tcts4@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-09-30T01:26:14.745Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|IA1PR12MB8405:EE_
x-ms-office365-filtering-correlation-id: 98e76a56-8fbb-4dc5-8329-08df1e91d247
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|11063799006|56012099006|4143699003|8096899003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: Yj2lH5yPVvJ3rvVrZAgjqirqt2pAmZIYjA1k+ZDp5/Yy43PgQMWA13mG/5AmvvVzQcGp8uvkBv6zqvZEP/S14ziIBVO2uBGo82Bmvnbo0irbbcPYXNTw//8Ni+gTRPMgjpqvbASePZ0Y9EAxRkXuiMn7W/47IMQI/hLVFE8IG6/ZM6W/DOVqNoMUAuTkYw5QZVl9L6eM9V+8XAOHRuL92v6KXh4cYASAoSTT7wrhro4GQKK3RFiMdSilI5nSA4jy2UUPvSt2jkpflongfbV0i5K4QkyjPoGXMgubLfFLDJnc4LU4oO6smU6IO9nfdQFP9tIDILywxS0szZpU2+ET75vghY5N9pmsmUS79IH5cP+EknU0AP98P8/kegTE2lVc5ANbxrY6+ybhZKt6XEJ6bzMQwzJp14tqeEsb/WMG3nd1PB9h1bP8hmJI0RCv5+p5siDcf8AwtcTfX8lMb1jpfkvm51vgZGTzoVbzm4goy/1Xbx0Y0OKrxUti5Omkf+FDo+aDtFHkne/GA6SR+E3XQihgg/SF+r4eh2YHpnWcWROsX8QZJNmDdsUCGyh6kh+10Jks+R3vjjrgFjDwF521B25qFF5eeXX+zAMxCo04r+E2Q65gLK3tvvjWmDiBOySusVho7kF0fpXxhwMvzu0KafPiaSRCtL/BrzKw6Bz8hHkJbqJ2V35MOF5RGHSr6spbUQXQxtvYs0J6UrZtkKd4pE8CmBnUEEVtE3DLV/bTOso=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(8096899003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aBAV1cikierXx3DphNYazMu3ynLuJdHstprrMbk0H8dmamagNbb3ziSt+rxX?=
 =?us-ascii?Q?VbGxo8mVKPEmSo5T5ryZ+rIO2ha0/m7WyyyW/i3PCMl9WJtAThzGGlhnai3V?=
 =?us-ascii?Q?OgIUoyIIXggj8b3ogZkS36yozYWqkaG9fEMqcyd1lJZ9cHNXdB0skgITHo/+?=
 =?us-ascii?Q?mKbtWLBNVb0/39gM/P8cp3D+AcSPFft8vzS/5gLhGeAGWtp+edPnuSnfaP6J?=
 =?us-ascii?Q?wF5Jx7QVB/JQSuM1kWUKLaTE90MAEXfB2RiSbZfXzXdj2ACsjAghTrjc6poP?=
 =?us-ascii?Q?yOeKWKgkuxJoA3N5vreUqSiKC9odjs+Ot9q0qYyWT2WBk0Ey9KwJ6uc/h15W?=
 =?us-ascii?Q?1ghDeWWI7Z7vZOrosf1WfhhBjNvnYyrhapVgx9g851wCu5umhvvD3HryGSP8?=
 =?us-ascii?Q?duiwbFAtOhcvG2Toe3h7qOfXVT4LMfLCxx/fve2W7uZ0L9sJ4+uLDp3d74l1?=
 =?us-ascii?Q?azecgKocyFCSpEjqxBTMly0r6XYSTdMWOsGeGErcK4P8zvkUgJrvPaoIS5Q0?=
 =?us-ascii?Q?wp3qRAfrc9y+oBOXnRaaDyZbQuwe4RN4LdN2SsLwnUo9PYsL2b6/35moDShI?=
 =?us-ascii?Q?6a/3ekJEZrLzEJnOf8awtf1Xbt/VsER/5ffjxsCnMbnZS+KSmKMZO0klbJPz?=
 =?us-ascii?Q?QxaKG42iilY57MBy3eFfofU2KQM8nnkPxArVahSCAdjBtr/Y7o4HbRPwXtlh?=
 =?us-ascii?Q?08EFXOWDOPXgx9NfRBYqDGTEl9OszZHJBSdUoohZwl4QW2ylTUgKMMEMps+9?=
 =?us-ascii?Q?xiITNdWaixQTOXhsq6NC/b6UHvzGryoQICWO8KZuuMRobxhVWswZsAyYSNft?=
 =?us-ascii?Q?R2piUxdHmh4X1mIRNWxtvGpLM/EhHfX439iF97R2rBjE4rM9o9ygS4eMcpXW?=
 =?us-ascii?Q?DIbgiHW5EYg0G9tzOWDrivuARfkSbxJzIgPJ914PFsb+IuPy7sWcUKLXNQLZ?=
 =?us-ascii?Q?wmFXkglftBJJkO1D76Kk0wOKKqk8+KzxRsv4ti4JEDjvBdjHSS/W3ReyDcB0?=
 =?us-ascii?Q?wfLWyWxdAZUl9ofWcmGFjnFEbsSpVqGiX6dwxtp20wjOwKSZNGV/rL2mDRhF?=
 =?us-ascii?Q?C3Xgtpva4mwjruMeQyNTdD1D9esesVMPWoMCJLRex1twWfGeKzAu2KMX+rL7?=
 =?us-ascii?Q?DrvwdITJyiVaVslPEyXFRAmcY21VSl5drg724WcjbKdXUxjn8/rD34wdqnFj?=
 =?us-ascii?Q?sTJO80eupMdZrGCYQ1KQgdESI+WnrLebtdnzcxXIY/4elfuFvZBsCH5DyDhL?=
 =?us-ascii?Q?4H1vN+Je5HmsxuwjbiHt7US4VWQXP0d1u3wJ95iAdhAdECIlXiT/hcD2hopI?=
 =?us-ascii?Q?RLCBySWS4vSuZQpyAa/IoOfLv2mxjlohaNCyJFO/r8V5jJpNCAJfKU3HiB8c?=
 =?us-ascii?Q?1pA6kuXAaSBwv3eJU6avBxY2fGXGaDO11gcbbO5HYAFTpb9Fpim4i29xtcTa?=
 =?us-ascii?Q?bib/iy/YAOdXCHCS0R9dqwPbeMececNdqpIgfwsw4WBH+BjITGD9Jn/wcbMp?=
 =?us-ascii?Q?WjURDBafzUqjqkFQDAMYXBnDfWtEzOlkD+3bhfs2ZefxOkbNCMlVHIijnO3H?=
 =?us-ascii?Q?IEm1iT7MgaIcUg7WCi59nrxo8ssORsIXCpK2cCZDpsF5uz9Jn8DzOO5Xkg8A?=
 =?us-ascii?Q?D1DAEQQcEDvrVEdmKhcd+2cPUBsnASqXZpQrrbN5mbhJLVzoqzdFDPqv+cIQ?=
 =?us-ascii?Q?O25c1WtKZvj1jc1MrC+8DHvrYwE0o9GBVu19eWZUmR8M0TKyD5gpvq+3AARz?=
 =?us-ascii?Q?CGqUPevgWQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB5152B00E40A0F70F1A5F66BEE38B2DM4PR12MB5152namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e76a56-8fbb-4dc5-8329-08df1e91d247
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 01:26:15.6815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xil4gdqC6n2whd7QHm6UXVpvPe5lRSHoiL5D3H+PxG/WGblmw9IjNtzxMEzBSUo8aDMMVa8EN5iA2y2/BQkFaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8405
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

--_000_DM4PR12MB5152B00E40A0F70F1A5F66BEE38B2DM4PR12MB5152namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

AMD General

Thanks  Kamil,  You are correct and I will  fix the subject.

Thanks
Jesse
________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Tuesday, September 29, 2026 6:18 PM
To: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Prosyak,=
 Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander.Deucher@amd=
.com>; Koenig, Christian <Christian.Koenig@amd.com>
Subject: Re: [PATCH i-g-t 1/2] tests/amdgpu: fix checkpatch errors in amd_f=
uzzing

Hi Jesse,
On 2026-09-29 at 11:00:46 +0800, Jesse Zhang wrote:

please do not mension a tool in subject, rather write what you did,
for example:

[PATCH i-g-t 1/2] tests/amdgpu/amd_fuzzing: fix codestyle

Regards,
Kamil

> Fix all checkpatch ERROR-level issues in amd_fuzzing.c:
> - CODE_INDENT: use tabs for igt_assert_f() continuation-line indentation
> - OPEN_BRACE: put the if-statement opening brace on the same line
>
> No functional change.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  tests/amdgpu/amd_fuzzing.c | 103 ++++++++++++++++++-------------------
>  1 file changed, 51 insertions(+), 52 deletions(-)
>
> diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
> index 36dd5d388..bcd3d66e0 100644
> --- a/tests/amdgpu/amd_fuzzing.c
> +++ b/tests/amdgpu/amd_fuzzing.c
> @@ -291,8 +291,8 @@ run_drm_ioctl_field_cases(int fd, const char *ioctl_n=
ame, unsigned long request,
>                errno =3D 0;
>                ret =3D drmIoctl(fd, request, buf);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     ioctl_name, cases[i].case_name, buf);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          ioctl_name, cases[i].case_name, buf);
>        }
>
>        free(buf);
> @@ -452,8 +452,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_devi=
ce_handle amdgpu_dev)
>                {
>                        int ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST,=
 &base);
>                        igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_number.huge=
", &base);
> +                                  "%s unexpectedly succeeded for %s (arg=
=3D%p)\n",
> +                                  "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.b=
o_number.huge", &base);
>                }
>
>                /* bo_info_size cannot be zero. */
> @@ -466,8 +466,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_devi=
ce_handle amdgpu_dev)
>                {
>                        int ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST,=
 &base);
>                        igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_info_size.z=
ero", &base);
> +                                  "%s unexpectedly succeeded for %s (arg=
=3D%p)\n",
> +                                  "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.b=
o_info_size.zero", &base);
>                }
>
>                /* DESTROY should not require bo_info payload fields for a=
 valid handle. */
> @@ -747,8 +747,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_devi=
ce_handle amdgpu_dev)
>                {
>                        int ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FEN=
CES, &base);
>                        igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_=
count.zero", &base);
> +                                  "%s unexpectedly succeeded for %s (arg=
=3D%p)\n",
> +                                  "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_=
fences.fence_count.zero", &base);
>                }
>
>                /* fence_count=3D0 must be rejected regardless of wait_all=
 selector. */
> @@ -758,8 +758,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_devi=
ce_handle amdgpu_dev)
>                {
>                        int ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FEN=
CES, &base);
>                        igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_=
count.zero_wait_all", &base);
> +                                  "%s unexpectedly succeeded for %s (arg=
=3D%p)\n",
> +                                  "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_=
fences.fence_count.zero_wait_all", &base);
>                }
>
>                /* Non-zero fence_count with NULL fences pointer must faul=
t copy-from-user. */
> @@ -770,8 +770,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_devi=
ce_handle amdgpu_dev)
>                {
>                        int ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FEN=
CES, &base);
>                        igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fences=
.nonzero_count_null", &base);
> +                                  "%s unexpectedly succeeded for %s (arg=
=3D%p)\n",
> +                                  "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_=
fences.fences.nonzero_count_null", &base);
>                }
>        }
>
> @@ -924,24 +924,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_de=
vice_handle amdgpu_dev)
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.sync=
obj_handles.zero_count_nonnull", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal=
.syncobj_handles.zero_count_nonnull", &arg);
>
>                memset(&arg, 0, sizeof(arg));
>                arg.bo_read_handles =3D 0x1;
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_r=
ead_handles.zero_count_nonnull", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal=
.bo_read_handles.zero_count_nonnull", &arg);
>
>                memset(&arg, 0, sizeof(arg));
>                arg.bo_write_handles =3D 0x1;
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_w=
rite_handles.zero_count_nonnull", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal=
.bo_write_handles.zero_count_nonnull", &arg);
>
>                /* non-zero count + NULL user pointer must fail in copy-fr=
om-user path */
>                memset(&arg, 0, sizeof(arg));
> @@ -949,24 +949,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_de=
vice_handle amdgpu_dev)
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.sync=
obj_handles.nonzero_count_null", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal=
.syncobj_handles.nonzero_count_null", &arg);
>
>                memset(&arg, 0, sizeof(arg));
>                arg.num_bo_read_handles =3D 1;
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_r=
ead_handles.nonzero_count_null", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal=
.bo_read_handles.nonzero_count_null", &arg);
>
>                memset(&arg, 0, sizeof(arg));
>                arg.num_bo_write_handles =3D 1;
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_w=
rite_handles.nonzero_count_null", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal=
.bo_write_handles.nonzero_count_null", &arg);
>
>                /* queue lookup path: invalid queue_id with no dependency =
arrays */
>                memset(&arg, 0, sizeof(arg));
> @@ -974,8 +974,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_devi=
ce_handle amdgpu_dev)
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.queu=
e_id.invalid_empty", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal=
.queue_id.invalid_empty", &arg);
>        }
>
>        /*
> @@ -997,8 +997,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_devi=
ce_handle amdgpu_dev)
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_=
handles.zero_count_nonnull", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syn=
cobj_handles.zero_count_nonnull", &arg);
>
>                /* syncobj_timeline_handles: non-NULL + zero timeline coun=
t */
>                memset(&arg, 0, sizeof(arg));
> @@ -1006,8 +1006,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_de=
vice_handle amdgpu_dev)
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline=
_handles.zero_count_nonnull", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.tim=
eline_handles.zero_count_nonnull", &arg);
>
>                /* syncobj_timeline_points: non-NULL + zero timeline count=
 */
>                memset(&arg, 0, sizeof(arg));
> @@ -1015,8 +1015,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_de=
vice_handle amdgpu_dev)
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline=
_points.zero_count_nonnull", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.tim=
eline_points.zero_count_nonnull", &arg);
>
>                /* bo_read_handles: non-NULL + zero count */
>                memset(&arg, 0, sizeof(arg));
> @@ -1024,8 +1024,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_de=
vice_handle amdgpu_dev)
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_=
handles.zero_count_nonnull", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_=
read_handles.zero_count_nonnull", &arg);
>
>                /* bo_write_handles: non-NULL + zero count */
>                memset(&arg, 0, sizeof(arg));
> @@ -1033,8 +1033,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_de=
vice_handle amdgpu_dev)
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write=
_handles.zero_count_nonnull", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_=
write_handles.zero_count_nonnull", &arg);
>
>                /* out_fences: non-NULL + zero fence count */
>                memset(&arg, 0, sizeof(arg));
> @@ -1042,8 +1042,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_de=
vice_handle amdgpu_dev)
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.out_fenc=
es.zero_count_nonnull", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.out=
_fences.zero_count_nonnull", &arg);
>
>                /* non-zero count + NULL user pointer must fail in copy-fr=
om-user path */
>                memset(&arg, 0, sizeof(arg));
> @@ -1051,16 +1051,16 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_=
device_handle amdgpu_dev)
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_=
handles.nonzero_count_null", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syn=
cobj_handles.nonzero_count_null", &arg);
>
>                memset(&arg, 0, sizeof(arg));
>                arg.num_syncobj_timeline_handles =3D 1;
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline=
_handles.nonzero_count_null", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.tim=
eline_handles.nonzero_count_null", &arg);
>
>                memset(&arg, 0, sizeof(arg));
>                arg.num_syncobj_timeline_handles =3D 1;
> @@ -1068,24 +1068,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_=
device_handle amdgpu_dev)
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline=
_points.nonzero_count_null", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.tim=
eline_points.nonzero_count_null", &arg);
>
>                memset(&arg, 0, sizeof(arg));
>                arg.num_bo_read_handles =3D 1;
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_=
handles.nonzero_count_null", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_=
read_handles.nonzero_count_null", &arg);
>
>                memset(&arg, 0, sizeof(arg));
>                arg.num_bo_write_handles =3D 1;
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write=
_handles.nonzero_count_null", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_=
write_handles.nonzero_count_null", &arg);
>
>                /* wait queue lookup path: invalid waitq_id when out_fence=
s requested */
>                memset(&arg, 0, sizeof(arg));
> @@ -1095,8 +1095,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_de=
vice_handle amdgpu_dev)
>                errno =3D 0;
>                ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>                igt_assert_f(ret !=3D 0,
> -                     "%s unexpectedly succeeded for %s (arg=3D%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.waitq_id=
.invalid_out_fences", &arg);
> +                          "%s unexpectedly succeeded for %s (arg=3D%p)\n=
",
> +                          "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.wai=
tq_id.invalid_out_fences", &arg);
>        }
>        /*
>         * USERQ_WAIT timeline points are 64-bit in UAPI.  Verify that the
> @@ -2209,8 +2209,7 @@ amd_test_try_create_userq(int fd, amdgpu_device_han=
dle amdgpu_dev, uint32_t ip_t
>
>        (void)fd;
>
> -     if (!amdgpu_dev || !userq)
> -     {
> +     if (!amdgpu_dev || !userq) {
>                igt_info("userq create failed: invalid args dev=3D%p userq=
=3D%p ip=3D%u\n",
>                         amdgpu_dev, userq, ip_type);
>                return false;
> --
> 2.50.1
>

--_000_DM4PR12MB5152B00E40A0F70F1A5F66BEE38B2DM4PR12MB5152namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div>
<div style=3D"font-family: Calibri; text-align: left; color: rgb(0, 0, 255)=
; margin-left: 5pt; font-size: 10pt;">
AMD General</div>
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks&nbsp; Kamil,&nbsp; You are correct and I will&nbsp; fix the subject.=
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Jesse</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kamil Konieczny &lt;k=
amil.konieczny@linux.intel.com&gt;<br>
<b>Sent:</b> Tuesday, September 29, 2026 6:18 PM<br>
<b>To:</b> Zhang, Jesse(Jie) &lt;Jesse.Zhang@amd.com&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; Prosyak, Vitaly &lt;Vitaly.Prosyak@amd.com&gt;; Deucher, Alexander &lt=
;Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.=
com&gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t 1/2] tests/amdgpu: fix checkpatch errors i=
n amd_fuzzing</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Jesse,<br>
On 2026-09-29 at 11:00:46 +0800, Jesse Zhang wrote:<br>
<br>
please do not mension a tool in subject, rather write what you did,<br>
for example:<br>
<br>
[PATCH i-g-t 1/2] tests/amdgpu/amd_fuzzing: fix codestyle<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; Fix all checkpatch ERROR-level issues in amd_fuzzing.c:<br>
&gt; - CODE_INDENT: use tabs for igt_assert_f() continuation-line indentati=
on<br>
&gt; - OPEN_BRACE: put the if-statement opening brace on the same line<br>
&gt; <br>
&gt; No functional change.<br>
&gt; <br>
&gt; Signed-off-by: Jesse Zhang &lt;Jesse.Zhang@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/amdgpu/amd_fuzzing.c | 103 ++++++++++++++++++-------------=
------<br>
&gt;&nbsp; 1 file changed, 51 insertions(+), 52 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c<b=
r>
&gt; index 36dd5d388..bcd3d66e0 100644<br>
&gt; --- a/tests/amdgpu/amd_fuzzing.c<br>
&gt; +++ b/tests/amdgpu/amd_fuzzing.c<br>
&gt; @@ -291,8 +291,8 @@ run_drm_ioctl_field_cases(int fd, const char *ioct=
l_name, unsigned long request,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, request, buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ioctl_name, cases[i].ca=
se_name, buf);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; ioctl_name, cases[i].case_name, buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(buf);<br>
&gt; @@ -452,8 +452,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_d=
evice_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret=
 =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &amp;base);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_ass=
ert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
BO_LIST&quot;, &quot;bo_list.bo_number.huge&quot;, &amp;base);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedl=
y succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDG=
PU_BO_LIST&quot;, &quot;bo_list.bo_number.huge&quot;, &amp;base);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* bo_info_size cannot be zero. */<br>
&gt; @@ -466,8 +466,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_d=
evice_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret=
 =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &amp;base);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_ass=
ert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
BO_LIST&quot;, &quot;bo_list.bo_info_size.zero&quot;, &amp;base);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedl=
y succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDG=
PU_BO_LIST&quot;, &quot;bo_list.bo_info_size.zero&quot;, &amp;base);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* DESTROY should not require bo_info payload fields fo=
r a valid handle. */<br>
&gt; @@ -747,8 +747,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_d=
evice_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret=
 =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &amp;base);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_ass=
ert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
WAIT_FENCES&quot;, &quot;wait_fences.fence_count.zero&quot;, &amp;base);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedl=
y succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDG=
PU_WAIT_FENCES&quot;, &quot;wait_fences.fence_count.zero&quot;, &amp;base);=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* fence_count=3D0 must be rejected regardless of wait_=
all selector. */<br>
&gt; @@ -758,8 +758,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_d=
evice_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret=
 =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &amp;base);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_ass=
ert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
WAIT_FENCES&quot;, &quot;wait_fences.fence_count.zero_wait_all&quot;, &amp;=
base);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedl=
y succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDG=
PU_WAIT_FENCES&quot;, &quot;wait_fences.fence_count.zero_wait_all&quot;, &a=
mp;base);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* Non-zero fence_count with NULL fences pointer must f=
ault copy-from-user. */<br>
&gt; @@ -770,8 +770,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_d=
evice_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret=
 =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &amp;base);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_ass=
ert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
WAIT_FENCES&quot;, &quot;wait_fences.fences.nonzero_count_null&quot;, &amp;=
base);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedl=
y succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDG=
PU_WAIT_FENCES&quot;, &quot;wait_fences.fences.nonzero_count_null&quot;, &a=
mp;base);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; @@ -924,24 +924,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu=
_device_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &am=
p;arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_SIGNAL&quot;, &quot;userq_signal.syncobj_handles.zero_count_nonnull&q=
uot;, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_SIGNAL&quot;, &quot;userq_signal.syncob=
j_handles.zero_count_nonnull&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; arg.bo_read_handles =3D 0x1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &am=
p;arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_SIGNAL&quot;, &quot;userq_signal.bo_read_handles.zero_count_nonnull&q=
uot;, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_SIGNAL&quot;, &quot;userq_signal.bo_rea=
d_handles.zero_count_nonnull&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; arg.bo_write_handles =3D 0x1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &am=
p;arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_SIGNAL&quot;, &quot;userq_signal.bo_write_handles.zero_count_nonnull&=
quot;, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_SIGNAL&quot;, &quot;userq_signal.bo_wri=
te_handles.zero_count_nonnull&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* non-zero count + NULL user pointer must fail in copy=
-from-user path */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt; @@ -949,24 +949,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu=
_device_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &am=
p;arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_SIGNAL&quot;, &quot;userq_signal.syncobj_handles.nonzero_count_null&q=
uot;, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_SIGNAL&quot;, &quot;userq_signal.syncob=
j_handles.nonzero_count_null&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; arg.num_bo_read_handles =3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &am=
p;arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_SIGNAL&quot;, &quot;userq_signal.bo_read_handles.nonzero_count_null&q=
uot;, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_SIGNAL&quot;, &quot;userq_signal.bo_rea=
d_handles.nonzero_count_null&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; arg.num_bo_write_handles =3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &am=
p;arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_SIGNAL&quot;, &quot;userq_signal.bo_write_handles.nonzero_count_null&=
quot;, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_SIGNAL&quot;, &quot;userq_signal.bo_wri=
te_handles.nonzero_count_null&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* queue lookup path: invalid queue_id with no dependen=
cy arrays */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt; @@ -974,8 +974,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_d=
evice_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &am=
p;arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_SIGNAL&quot;, &quot;userq_signal.queue_id.invalid_empty&quot;, &amp;a=
rg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_SIGNAL&quot;, &quot;userq_signal.queue_=
id.invalid_empty&quot;, &amp;arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; @@ -997,8 +997,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_d=
evice_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &amp;=
arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_WAIT&quot;, &quot;userq_wait.syncobj_handles.zero_count_nonnull&quot;=
, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_WAIT&quot;, &quot;userq_wait.syncobj_ha=
ndles.zero_count_nonnull&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* syncobj_timeline_handles: non-NULL + zero timeline c=
ount */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt; @@ -1006,8 +1006,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu=
_device_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &amp;=
arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_WAIT&quot;, &quot;userq_wait.timeline_handles.zero_count_nonnull&quot=
;, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_WAIT&quot;, &quot;userq_wait.timeline_h=
andles.zero_count_nonnull&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* syncobj_timeline_points: non-NULL + zero timeline co=
unt */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt; @@ -1015,8 +1015,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu=
_device_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &amp;=
arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_WAIT&quot;, &quot;userq_wait.timeline_points.zero_count_nonnull&quot;=
, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_WAIT&quot;, &quot;userq_wait.timeline_p=
oints.zero_count_nonnull&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* bo_read_handles: non-NULL + zero count */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt; @@ -1024,8 +1024,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu=
_device_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &amp;=
arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_WAIT&quot;, &quot;userq_wait.bo_read_handles.zero_count_nonnull&quot;=
, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_WAIT&quot;, &quot;userq_wait.bo_read_ha=
ndles.zero_count_nonnull&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* bo_write_handles: non-NULL + zero count */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt; @@ -1033,8 +1033,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu=
_device_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &amp;=
arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_WAIT&quot;, &quot;userq_wait.bo_write_handles.zero_count_nonnull&quot=
;, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_WAIT&quot;, &quot;userq_wait.bo_write_h=
andles.zero_count_nonnull&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* out_fences: non-NULL + zero fence count */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt; @@ -1042,8 +1042,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu=
_device_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &amp;=
arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_WAIT&quot;, &quot;userq_wait.out_fences.zero_count_nonnull&quot;, &am=
p;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_WAIT&quot;, &quot;userq_wait.out_fences=
.zero_count_nonnull&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* non-zero count + NULL user pointer must fail in copy=
-from-user path */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt; @@ -1051,16 +1051,16 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdg=
pu_device_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &amp;=
arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_WAIT&quot;, &quot;userq_wait.syncobj_handles.nonzero_count_null&quot;=
, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_WAIT&quot;, &quot;userq_wait.syncobj_ha=
ndles.nonzero_count_null&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; arg.num_syncobj_timeline_handles =3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &amp;=
arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_WAIT&quot;, &quot;userq_wait.timeline_handles.nonzero_count_null&quot=
;, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_WAIT&quot;, &quot;userq_wait.timeline_h=
andles.nonzero_count_null&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; arg.num_syncobj_timeline_handles =3D 1;<br>
&gt; @@ -1068,24 +1068,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdg=
pu_device_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &amp;=
arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_WAIT&quot;, &quot;userq_wait.timeline_points.nonzero_count_null&quot;=
, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_WAIT&quot;, &quot;userq_wait.timeline_p=
oints.nonzero_count_null&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; arg.num_bo_read_handles =3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &amp;=
arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_WAIT&quot;, &quot;userq_wait.bo_read_handles.nonzero_count_null&quot;=
, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_WAIT&quot;, &quot;userq_wait.bo_read_ha=
ndles.nonzero_count_null&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; arg.num_bo_write_handles =3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &amp;=
arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_WAIT&quot;, &quot;userq_wait.bo_write_handles.nonzero_count_null&quot=
;, &amp;arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_WAIT&quot;, &quot;userq_wait.bo_write_h=
andles.nonzero_count_null&quot;, &amp;arg);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* wait queue lookup path: invalid waitq_id when out_fe=
nces requested */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; memset(&amp;arg, 0, sizeof(arg));<br>
&gt; @@ -1095,8 +1095,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu=
_device_handle amdgpu_dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; errno =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &amp;=
arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s unexpectedly s=
ucceeded for %s (arg=3D%p)\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DRM_IOCTL_AMDGPU_=
USERQ_WAIT&quot;, &quot;userq_wait.waitq_id.invalid_out_fences&quot;, &amp;=
arg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;%s unexpectedly succeeded for %s (arg=3D%p)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;DRM_IOCTL_AMDGPU_USERQ_WAIT&quot;, &quot;userq_wait.waitq_id.i=
nvalid_out_fences&quot;, &amp;arg);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * USERQ_WAIT timeline =
points are 64-bit in UAPI.&nbsp; Verify that the<br>
&gt; @@ -2209,8 +2209,7 @@ amd_test_try_create_userq(int fd, amdgpu_device_=
handle amdgpu_dev, uint32_t ip_t<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (void)fd;<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_dev || !userq)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_dev || !userq) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_info(&quot;userq create failed: invalid args dev=3D=
%p userq=3D%p ip=3D%u\n&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_dev, userq, ip_type);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return false;<br>
&gt; -- <br>
&gt; 2.50.1<br>
&gt; <br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR12MB5152B00E40A0F70F1A5F66BEE38B2DM4PR12MB5152namp_--
