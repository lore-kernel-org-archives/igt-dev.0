Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1C2C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 09:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8A510E8DC;
	Thu,  1 Aug 2024 09:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xwYVwGy9";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C0710E8DC
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 09:51:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLVt6te+6JYbqzvQYppco0yYTwdFoGME/xi04DbzpVhO2evo9FV5jfWYpbYaMMEcSv0tjZpdqD08TBshW07g9LggDFeOdGatT51JhfhO+KFBf3YmPI/+WSmq0pTKjTjsgr3AerxgsHDNIMeEWWIAP9hhz5aXcB4Mmgf4MxOnDCWuIFNfWuXQwYcd3zNupXTpjMcPi4bcH1CT3bTrSEGQY5ls1fJWA9fo8aTNJJYmSft0BNrWZ69lN7MZsI6ucyjYDW7A1oHzqK79ETNT9Xu73qL2YRn3i4HVCQzNF0I/Wp4DNXVkGgcFEenHac2xzVGsPzFUPcljieAJAvmaLikwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1o5y8WsWUSwBIGZg7oAw4P3mmPahBcXVM1QyTGvxDw8=;
 b=Yj/DpOM56+ywgoO/vDCF54KK7EMEK3Ptw3wKbtICfTXURsEtuoNWWzxLChBE1FqkPCamSpZsmeuzDv/h5O/StrV7tzCKWJfj6ywNumjcXMEaUjjpJbOoBsg4JsrKPoh1Cgq5exhOeYtRzh9CHM4KCtvrsbmGpQJx5TSMlRwMSaFSEkO5fgvzLPM6JydE8IiA1GZXSmS1sugmZiRfs3paADZc/MkAcTIJbyJ9iwkLJKmoHgEV7KllSDDAdeew66JzqmizbVsasXu3uWdJQ8g7fCjbrXPpF4mGzUl2cDUEMYi5vO40ZiVgoOTSlq9qEDmf3heP/0/swSPK5OF85bt3Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1o5y8WsWUSwBIGZg7oAw4P3mmPahBcXVM1QyTGvxDw8=;
 b=xwYVwGy9aNHixcna2afIbw4fkybJso8R0D00uNYf03WTuCTYqUgloZNjVZxJxpPxlGz+OMUF4Srk1q0VgNitQE6cY+OGdj6UhCBGSy7xXPWK9lSBgzGb404jMbV4zdxa+0vWcGdvDQzQbXHRN0H9N3NXAfZlMqVfXmQhyQqEebU=
Received: from DS7PR12MB6005.namprd12.prod.outlook.com (2603:10b6:8:7c::17) by
 DM4PR12MB5724.namprd12.prod.outlook.com (2603:10b6:8:5f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.28; Thu, 1 Aug 2024 09:51:41 +0000
Received: from DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::4dc0:f34c:9e7e:ccb]) by DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::4dc0:f34c:9e7e:ccb%4]) with mapi id 15.20.7807.026; Thu, 1 Aug 2024
 09:51:40 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] tests/amdgpu: update bad length case
Thread-Topic: [PATCH] tests/amdgpu: update bad length case
Thread-Index: AQHa4+xx0zgAFX8GaEq5xRfXgWRdXrISEgOAgAAS2FA=
Date: Thu, 1 Aug 2024 09:51:40 +0000
Message-ID: <DS7PR12MB6005350742751EC02F29D3A2FBB22@DS7PR12MB6005.namprd12.prod.outlook.com>
References: <20240801082548.2496123-1-Prike.Liang@amd.com>
 <DM4PR12MB5152C489D1E7E771D44D24C6E3B22@DM4PR12MB5152.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB5152C489D1E7E771D44D24C6E3B22@DM4PR12MB5152.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=aa9aa2ae-34c1-451b-a736-3a933d0b4b02;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-01T08:29:25Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6005:EE_|DM4PR12MB5724:EE_
x-ms-office365-filtering-correlation-id: 3a4bf18c-f42c-47eb-f534-08dcb20f8b10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?4qHfKCVWdw5uI5/f1YG/3VyuZXFyyvMQh0zDx2GwHdXq+L3RMt90ORIzHtpu?=
 =?us-ascii?Q?kdQ5rEl+R9/ABtOKE8QCaCnGFL8KX+8w0wkWJ0bvEq0Pu1ecQPOQl1X/Ih80?=
 =?us-ascii?Q?2ldE9Ux0W1do8QVGXLitRH7FSIHk0HUOWo+RflkuuP2oBpFESqWDmeDysL+O?=
 =?us-ascii?Q?B+WKxZm7OdxcJE2yTDDeBT1UfJ5pH7dCkLhbcnQbshArNlcJP6xdc/1yWTgT?=
 =?us-ascii?Q?UzIQZ6rSEDdoqgGktDR8bvQwYOJOMR/9u5SVPnyxO08Ev1e1IQR3Hp2aCl/1?=
 =?us-ascii?Q?b1vq4ArWaZQrKsBnvaezq/XT07WAQZAzL+HOKmlKNZqX7FMzusPezYlknCWr?=
 =?us-ascii?Q?1Tm+XG1qFoUPSiPMSAhmo0wA44GWcnEjFs/Ufqfd/gBne5fvoDoxE5ZTr78W?=
 =?us-ascii?Q?fo1qjy/Q6icqaiMHgBU0AUEPihAPuyHa4Bd4WlYTq1yIRB5Gp0XLsMTS7Qle?=
 =?us-ascii?Q?OR0Vuw0CI3UicUoTQwyL5HULSCoT1u+XSspfeS/651yvnG/i7JopguoQAJj0?=
 =?us-ascii?Q?E9aqRUtGfC1wUyAiBfKCHxH9oTY1qAgiy78OnQu8pyju3jhUjs+AUIR8YaPA?=
 =?us-ascii?Q?bkQj+5UMH/lEF4fCGabT5dkyHT44s0oCdE5/KGg50yWsqkKaGDhjx/uRro56?=
 =?us-ascii?Q?m9HWv7rwkUSgyiWbsZdQjRYHpRxHzGNzqtIci4rLKAya6SrMrtL+xxENU/70?=
 =?us-ascii?Q?11gCDdV1gH3oXz/hEfepJHRDHfe5novTWX4JV99qaEmtcFceR4VQnvGB5hot?=
 =?us-ascii?Q?Mvld1tyWaBnFPlahhWPcO4rP7PTIHUjElIiVrJ2ewKajCCT3Mo3YO/1q9bd/?=
 =?us-ascii?Q?kMsMQGrRvesZYFbhjWsqnUOEk1iLE7dwav70zQtmSXxxKUe9xMecJUhjWLDU?=
 =?us-ascii?Q?ZKyM2p0C4CD1EfMam9jS4KQav53yy5imUHpCZNLgQkhA7R/Uv8Yvkwp91di2?=
 =?us-ascii?Q?xSNCjr0ykqdbR2T59HPefBN+z/ZegcVL0lzAibVVm6/H4XPav4fumn/OYYec?=
 =?us-ascii?Q?Lny9SqfeKpXQH6FmzqxEtehIH16O/LJqNFdAsohsZbZSJ0m96hWT5rCzJ551?=
 =?us-ascii?Q?QIkcxvwimGtn6VFOmgnAJ6tu3uQlMHEALtoHpZfKl7LFn3wWMEMa417BojFj?=
 =?us-ascii?Q?ZiXGz7hUm1i9CN1/XCsF25rk7w/5bsugZs1AohLYzjoWXqH/Nvn851h65lD3?=
 =?us-ascii?Q?O1zQYe8w0HDJjycfDPVwWkJjHZxpTgb3XAdepy8vk2+Y4FOlpCticD+aUSPm?=
 =?us-ascii?Q?DpF56V+T8/ocQJcPklUBnhzRR/3Zz8MD6bEJM9Tjk1yMk3WWioRI1PomBwZ1?=
 =?us-ascii?Q?FqfaVkKPpdGsV4vC4J1Z8A+QNrMs8KztZElj5tQBYAzvaSr066YqtBk6X1wi?=
 =?us-ascii?Q?v6CLYLYzDK3Fu7I3Hp7E/007XoG3RumYoRkcXu8I4WnOZ4AscA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6005.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Cc6ojI8tOqvjGxWNi88CurCPJwbUTXfJk/+M7GPCTFmPf86P/fz1eWsZgwrN?=
 =?us-ascii?Q?aiFjprd3q0pMOAjIU4XlBbXSaZt5e+1j/4v39N565PcDhpYMDdbOmg76JQJW?=
 =?us-ascii?Q?ptpZ96JhrPz8loOc+dkjJQOMMvgtsm75EwFNFuFaW7ciUeLPbhaKdjQ8c9w4?=
 =?us-ascii?Q?0EOq+1/OM325EOwin60rLwX4E3W1Kgbzs+sGauqUB4KRI+BKS4zcS3o0XkAg?=
 =?us-ascii?Q?7TEpbcVnOo/sG8NT95+h6UCVqBPEroc9+c18Q0KTDAPqPsU8ThYNwTcLTPHx?=
 =?us-ascii?Q?OBkbeQuphzXh0Za6cQzgA+TnkX3pXUDy1h7HdZaRfc/QHjJ7QkPcNdIJogN2?=
 =?us-ascii?Q?jvZHNi3EZM5BwtPUxG2/rBhNVAwpWGy/KTl57MMiCPnfqxzznqwJZTQkfaAB?=
 =?us-ascii?Q?5QjJJxy3/s7eoZRt9UvU1IAhdqSlyvF1EYdKa0KOuBl8hXYnAR79VdGAJy7v?=
 =?us-ascii?Q?q7p7FEcEWvmoWm/MAZp9bSeqsK9jjl+P7gw2A5UBtJ4UNKI5S7rTpaiG5c08?=
 =?us-ascii?Q?mj+ycQtrL3c5pbNmF6MpTEsTpzSu8ECPOwB6F8dfxgDsojKj3wJom/4XgYpZ?=
 =?us-ascii?Q?qQznjEfLOXZb+fGMRoYL4gZ89zf+AiZV8AvB1PkkqO8aZ0hDBcDBGAV4VfpK?=
 =?us-ascii?Q?9hy1e0lccAio2XxpEQifO16Y+z5MKvAWIzqO2c89aQk1+fRkW7m13Q6z6aNi?=
 =?us-ascii?Q?uusyombsTe72Dg2U0ulvfuDv+SelJdYLqWBbM1AGQyCpmuGgovY7ISO4q+GR?=
 =?us-ascii?Q?uyP33TtqAUKBChD/yzwKabnEiqSJ+zeNkntD+5As+CCOYkA5AfTH1j/TubwB?=
 =?us-ascii?Q?oQt3Cd1Z9b5pnpkCrlK7qkPmjNhRmMbEfdBc856+mdAPrjLMJGIlpQw9mCji?=
 =?us-ascii?Q?JRpPfNJTXgr/4GLuBmRdz31lKxQ1gyrVi/24PeR6E4e5JI6aOJyGVtiAHAP7?=
 =?us-ascii?Q?QlY0F2z3fVS7yqW0zEdUcVk3KCgOnX0WFIvQId2iq/QfKlNJ4ZdwIOyTJfBQ?=
 =?us-ascii?Q?HQ1nK4wfvq2JKFb5sVDdTSG8l+09zRcnwMzi0FMB3CbUzgosSn5DjJclOXtc?=
 =?us-ascii?Q?zBVDiVdUFulXLF9s8guXvIwM1eIIth9/ivS7UArphKD824vwGoRmqt6fVEGw?=
 =?us-ascii?Q?Mvv6gRZC2O5x+lfcHrzPpZl1yUlzDRBRGSFMOS2oKg8dhBD/4B/Rd6I3H5Kk?=
 =?us-ascii?Q?OtY47f3uWSj4ekRfckdVVkEd+1lQmJ4aLN5ipKP3oXLkcdZ/VPw1hECcRVR0?=
 =?us-ascii?Q?vi6fEb3BZ/zZA+s2E6yILvtm4mJ0MKDidFMkOs1KMkbC54A0N2VbVEfXCahW?=
 =?us-ascii?Q?PTCq+3pBE0nFl8GPeYBrB9JzwE6kb54/xHcOz1+J/u6hJFelm2xK5FrKMiqk?=
 =?us-ascii?Q?gAPPMD0vLafwjy/DoNCbth0sRgBxyHnrDQJMbggeWH2OGRQzpcg3HSFgHfl+?=
 =?us-ascii?Q?NZnO7tp9C38883LUZuZWMbfIUSVDiETaG8O/q1OwhmSBP8rRT6A34N68kaIb?=
 =?us-ascii?Q?yLsToI0XgylZhQSQHJ1KasORGUUWmNFwBE3xHphGmI07jdKc94eUhkF66zul?=
 =?us-ascii?Q?+6vDdMpwekTomUfa5oE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4bf18c-f42c-47eb-f534-08dcb20f8b10
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 09:51:40.6854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CSAVj+fpndLEkNl4XuZSZqfhkDqnGtxX4UUYDAK6e78jyQv/txJVjld0+mh+jKj0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5724
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

I just find when the header length has extra more than 4dword can trigger p=
ipe reset which may because need halt all the 4 queues then will be fallbac=
k to pipe reset. Meanwhile, to decrease a the test time and I will send a n=
ew patch for handling this.

Thanks,
Prike

> -----Original Message-----
> From: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
> Sent: Thursday, August 1, 2024 4:30 PM
> To: Liang, Prike <Prike.Liang@amd.com>; igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Liang, Prike <Prike.Liang@amd.com>
> Subject: RE: [PATCH] tests/amdgpu: update bad length case
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> This patch looks good to me.
>
> Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>
>
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Prike
> Liang
> Sent: Thursday, August 1, 2024 4:26 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Liang, Prike <Prike.Liang@amd.com>
> Subject: [PATCH] tests/amdgpu: update bad length case
>
> In the bad length case, when the header length is bigger than packet stre=
am
> length then CPFW will pending on the stream data and raise a CP halt erro=
r
> which requires do the pipe reset. As to the orignal case of header length=
 is
> smaller than PM4 stream length then the PM4 stream data may will create a
> bad opcode error which only requires the queue reset. So for testing the =
pipe
> reset need to update the header length bigger than the PM4 stream data
> length.
>
> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c inde=
x
> f675b97dd..edfd16e76 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -201,7 +201,7 @@ gfx_ring_bad_write_linear(const struct
> amdgpu_ip_funcs *func,
>         if (cmd_error =3D=3D CMD_STREAM_EXEC_INVALID_OPCODE)
>                 ring_context->pm4[i++] =3D PACKET3(0xf2, 2 +  ring_contex=
t-
> >write_length);
>         else if (cmd_error =3D=3D CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
> -               ring_context->pm4[i++] =3D PACKET3(PACKET3_WRITE_DATA,
> (ring_context->write_length - 2));
> +               ring_context->pm4[i++] =3D PACKET3(PACKET3_WRITE_DATA,
> +(ring_context->write_length + 4));
>         else
>                 ring_context->pm4[i++] =3D PACKET3(PACKET3_WRITE_DATA, 2 =
+
> ring_context->write_length);
>
> --
> 2.34.1
>

