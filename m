Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4645C54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 11:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4665010E7BE;
	Mon, 25 Mar 2024 11:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jXOG3IBj";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B253410E7BE
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 11:30:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLy1NBLUhTLM8TDD9S5vrtZfZ7/OjLTOEAzfa/XFvQDIZAiw76bPbp0bQX5iLk0eBiw3H8O7MsxfHQEv38wL+W8bQ9PzkeKpscFljvuHrfNGxOwTxYAgrQ7tbRsLcMVY5GRbVQ4fzIXXL4lLAffEXQ39/01UyvpGefE+SzAu6QI+qz1m1kg4TdqcaCVjF9/+yNRlTOS5Z8UUlX6FRmZL/MFWg77hAExa1osfETlXeXY4EqkMBh7VCb1LRUIkorf8CN38r0jw0WjVtau7kSmLP2zojNxED5Hl/NAX3h/bNophP3LSRV/FL6mYHhVuoaRyNLakuNSwcM+Vmdi40MhAqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuYOfxri92TGj7oXdAwUqecXR2Vi0WdpZs7qrnqScHA=;
 b=Q+eSSKwH+qC3p6/j9xtKWfaDElh2hRLUBtp6hGYz0H312bN0oW1UwK8vdjy5ubRxvQczb6GpKxg5eMw1IoXnl4k/ujVd0Vl+qKv5wuR5VhD/JqZzRtUgLjhYtFAIad6P8sWYewks0pampW+uk3DmGdn53QEdY0XEhTql3yfQvU6ZL6q9JtGF6xGUQwa66lPrR/c0/P2MsqXOOz2tL//gfNjTwp8xsmVWZOcT7qi26TiG1MexxA/Ehdc2kxIiKoxuCl9N3aR7LdEMvHgCLHeWUUCCvKuPwiyVi0JL1lyzYmGlz169hFKHhuBG6oR2fk7lb8pQIMjwQRu6iTDLMdXLZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuYOfxri92TGj7oXdAwUqecXR2Vi0WdpZs7qrnqScHA=;
 b=jXOG3IBj3EnEQ73O47aBuVQB9A86oyhWkk3nCYczju8dwGW2rWlAK0C6d8TDenDN05yY7JwOXkLte8BrEkhZ5rSBkWaVPZx1K7XZFCBt1ysdccN1UmZcDK8xNTxnJ4HqoBtw9i0pSw7lWYb9vszUOW711xyHcdMVoJelEb1eR0g=
Received: from PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18)
 by SJ2PR12MB8012.namprd12.prod.outlook.com (2603:10b6:a03:4c7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 11:30:15 +0000
Received: from PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::dd5a:9555:315f:55e0]) by PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::dd5a:9555:315f:55e0%4]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 11:30:15 +0000
From: "Wu, Hersen" <hersenxs.wu@amd.com>
To: "Hung, Alex" <Alex.Hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
Subject: RE: [PATCH 3/3] tests/amdgpu/amd_dp_dsc: Check connector's dsc
 capability
Thread-Topic: [PATCH 3/3] tests/amdgpu/amd_dp_dsc: Check connector's dsc
 capability
Thread-Index: AQHae+HsIQxo/EF7kUOsmdOPAb55RbFIV9Kg
Date: Mon, 25 Mar 2024 11:30:15 +0000
Message-ID: <PH8PR12MB696275EC8E2F46057C6192DEFD362@PH8PR12MB6962.namprd12.prod.outlook.com>
References: <20240321224758.1531610-1-alex.hung@amd.com>
 <20240321224758.1531610-3-alex.hung@amd.com>
In-Reply-To: <20240321224758.1531610-3-alex.hung@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=ff535031-ba1f-4a1c-88ea-2b2343751a2b;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-25T11:30:09Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB6962:EE_|SJ2PR12MB8012:EE_
x-ms-office365-filtering-correlation-id: 2cabf694-93d8-4ac6-dbf0-08dc4cbef133
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K1hp8xVYVzBwjzT9H6CJcwCmPFb5fzytaN2UjmhHC6dxg7R9E+9BkHkTTCkVTPB/27PKIM0mVAxRf1nKB0Uds/n+NNoXBKtdaRy+LN3G0Q+g4dD4HBqjpBqgpgm+Se/Z9i1BS/AyJf7Xana2NR9UM0nDH5wPqACXVrC/UA2k3SpBbw9J0fo/tUSW1exBdt8C6N0fbXe8CLVzMlHl8/CQa1yJKY3epu79sbWW6Ch5SW9v8nYS5Cf+yci2s4mb9lr3bDo5p1NovOqZjSy6RSD3WpM8L07JCNPysszpmGnDHQdUEZlntvJAlzCTkD2cjfERoWhsFDUIMF+GBDga7Wp3Tr/4XdLWnOvQRxtcpcMb6wNk3ntWkl7YmPjsWb66V0zQfPp4+7aDzWFERn/bL39C6mUwNm9sHq5tmcL73TKVpJgJd8XBVPQEpqggojT/LJIq/j/dB7Hd+cTGLa0FSzrP2L8VXKfw4GgJ3jTiYuyEQMOzGISBygau8Pfr5r3tQ/hOUUPw6vEagG0N8DNPzejWvjtfcJcBdjfTD0ENhrcHGR+7IQLcou45B9HTU0ErcNEHvgRXcNoLqePyDPTVBBFmiXOmgZs3qAbO+9WsEB6UMJ+XtXtOuGkZsyiYA0YIUBmMYOkrHUvLSbHlxftwGo7fO0wwZW/BSoW1Y/afONP1CXDKXxNa708rFR7tqRiO/+nmLejrhFurYx6sH7fuQO/9mA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB6962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NAy8pJgGmq0LOCdBB5992+FH2Y3XyMQWfwpEYd6zUsQyqDQpEwOda5MRCF3K?=
 =?us-ascii?Q?TA3cy2Z3YJeb4p1k3ZRoFIF81v8cZYKEs69r6A1lJ+bXJQ+LpeL7XzpKio11?=
 =?us-ascii?Q?t7LYzKrcM2Fh4xkNKG4PluZe96HK5d8vPkOfaXoYs6/yU5GhzXZxQ7J+ABn5?=
 =?us-ascii?Q?NdLmsWHzYSzykU1UyD7hIvjLMsJU8/SHPfvpnksCWfJ90pz9N3ZXvkqOON2A?=
 =?us-ascii?Q?ySrq9RGDrQLOAjsBld11HPS53qXeTo/Gq5+SGzpfGceSQevwUitoJinG2tbz?=
 =?us-ascii?Q?c0vJKRUY9lJnqDED2QcsqtEMz/PgwgaPvgi/c7KZQS9q1FZIiKKX2c4qKOAd?=
 =?us-ascii?Q?98zBL3J/UoinxILH4L9eR86s4sOzf/CT3nfa6WIj1Y3TqsvhfVXJf+NYYVHa?=
 =?us-ascii?Q?qJZZatacIGFKIue7PFzQF3gmRZAwNyVxRn0swCTyU1ksUTzbfz633gCAlq0i?=
 =?us-ascii?Q?YqHh0fmerKJEu/3BBxnUPWyMN7As31I3X4soFXeOCNbI0hUuQCZLQqaSwS/T?=
 =?us-ascii?Q?c/MRTmoQP8dDciCtrf4m0vTOpBkie8ild+tAzajZLE7iqFPCROLDuIjjp1yD?=
 =?us-ascii?Q?omBsiD472icurmkY8Kjd96mXWvYqBglSQVai6lNXI6RMcznfEyTnaKe46Ula?=
 =?us-ascii?Q?cXro75Fx8auwoBDXrj5FqNYZ1io746YJCT30mCat/gDcXZoe3S+CEoxw7fCy?=
 =?us-ascii?Q?n52UEpbEsaRp5kMCal53977UZ3v3Fg3dS9sctAU6NuuZibPjVj1CclJaNkcj?=
 =?us-ascii?Q?56MTNq/NhceKNG8hLpC+a8vcq8xcvju+YiHES2qavfblZjQW5tUmSA+BWlXc?=
 =?us-ascii?Q?kWeCk4PS9Sh80QFOKdYBH0kGY3NnEcSdQPGC46P2OZJuIFUUzKA9C0n70uln?=
 =?us-ascii?Q?4YQLvBvUbpSLXwVDBBwYqv9ctaEnUhy2OOteNdockTNo+Po77KxhJ3fGA6no?=
 =?us-ascii?Q?ETjSYPnATq7rGcsi8zhPVB+jQwEgT2UNaHV9Jv4SSlYR4r1U2KbmY7P7UfFb?=
 =?us-ascii?Q?JgFMYMOFGvJHrk2lQXxcoASEsk4CHKhQhMVLu8vW3A0wjDsLeptG/E4Yeqch?=
 =?us-ascii?Q?a4/zj2BnEIQ//NbD5wpUWT/m0FyBuZW8Kxlcq4O2fFfkg4o+78BXmI+7D6Rf?=
 =?us-ascii?Q?bnTbLWeZe+C74otYmlhUOdMh394IiFdNrYZETYn83JPEv6v0xqIAsGuQ0dBt?=
 =?us-ascii?Q?NlRBsJfCJcWR+wQ3DDVc18dL9zpglRZUNKrl0Y1PJlOqfpIiKSV+IPokBm1L?=
 =?us-ascii?Q?WHA9Ug6HitJeUBxZ9IV72cLSvCUfDMOnVlqSpzDk56vS3I2e3PduiJTihWJv?=
 =?us-ascii?Q?8hJCRnicz2m5CFVhcINVNyUqtzo1mKAQbxzB9GCtg/feo4EMfIhZER4+bBX2?=
 =?us-ascii?Q?9vxGV/fxVlE0pz+NUxOw4GfwVYsNicFZgTF8ZDObU2ZDpq+l8ncKuNBsjKys?=
 =?us-ascii?Q?COWVL1UGkNbvz0iapS6co+sQ8xgyGqMOz/6YsIHyQjve47xWACr2r9XkadeB?=
 =?us-ascii?Q?pViTsqL9x2IIS905v50yn1S/i68a9oOxu9GnxXm6HLIjvrckNfdvKnTg837c?=
 =?us-ascii?Q?SjCIJHWqPo8eXjdb1GY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cabf694-93d8-4ac6-dbf0-08dc4cbef133
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 11:30:15.3867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5bnX7XPnBhFADOTpZGjbTT2C1M4lB9CvyOnM0xE5IXJJHEsj32Y0V5oJxn6V6T/pL5Un4kly3UMSFwyD59dIDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8012
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

Reviewed-by: Hersen Wu <Hersenxs.Wu@amd.com>

-----Original Message-----
From: Hung, Alex <Alex.Hung@amd.com>
Sent: Thursday, March 21, 2024 6:48 PM
To: igt-dev@lists.freedesktop.org
Cc: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Wentland, Harry <Harry.We=
ntland@amd.com>; Wu, Hersen <hersenxs.wu@amd.com>; Hung, Alex <Alex.Hung@am=
d.com>
Subject: [PATCH 3/3] tests/amdgpu/amd_dp_dsc: Check connector's dsc capabil=
ity

test_init() only sets data->mode when an output is DSC capable. As a result=
, it is necessary to check it before running each subtest.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/amdgpu/amd_dp_dsc.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c index f2=
da98259..64f1565f4 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -93,6 +93,15 @@ static void test_init(data_t *data)
        igt_display_reset(display);
 }

+static bool is_dsc_capable(drmModeModeInfo *mode) {
+       /* mode is not set in test_init() if it is dsc capable */
+       if (mode->hdisplay =3D=3D 0 || mode->vdisplay =3D=3D 0)
+               return false;
+
+       return true;
+}
+
 static void test_dsc_enable(data_t *data)  {
        bool dsc_on, dsc_after, dsc_before;
@@ -107,7 +116,7 @@ static void test_dsc_enable(data_t *data)
        for_each_pipe(&data->display, i) {
                /* Setup the output */
                output =3D data->output[i];
-               if (!output || !igt_output_is_connected(output))
+               if (!output || !igt_output_is_connected(output) ||
+!is_dsc_capable(&data->mode[i]))
                        continue;

                igt_create_pattern_fb(data->fd,
@@ -245,7 +254,7 @@ static void test_dsc_slice_dimensions_change(data_t *da=
ta)
        for_each_pipe(&data->display, i) {
                /* Setup the output */
                output =3D data->output[i];
-               if (!output || !igt_output_is_connected(output))
+               if (!output || !igt_output_is_connected(output) ||
+!is_dsc_capable(&data->mode[i]))
                        continue;

                igt_create_pattern_fb(data->fd,
@@ -335,7 +344,7 @@ static void test_dsc_link_settings(data_t *data)
        /* Setup all outputs */
        for_each_pipe(&data->display, i) {
                output =3D data->output[i];
-               if (!output || !igt_output_is_connected(output))
+               if (!output || !igt_output_is_connected(output) ||
+!is_dsc_capable(&data->mode[i]))
                        continue;

                igt_create_pattern_fb(data->fd,
@@ -352,7 +361,7 @@ static void test_dsc_link_settings(data_t *data)
        /* Collect reference CRCs */
        for_each_pipe(&data->display, i) {
                output =3D data->output[i];
-               if (!output || !igt_output_is_connected(output))
+               if (!output || !igt_output_is_connected(output) ||
+!is_dsc_capable(&data->mode[i]))
                        continue;

                igt_pipe_crc_collect_crc(data->pipe_crc[i], &ref_crc[i]); @=
@ -363,7 +372,7 @@ static void test_dsc_link_settings(data_t *data)
                        /* Write new link_settings */
                        for_each_pipe(&data->display, i) {
                                output =3D data->output[i];
-                               if (!output || !igt_output_is_connected(out=
put))
+                               if (!output || !igt_output_is_connected(out=
put) ||
+!is_dsc_capable(&data->mode[i]))
                                        continue;

                                /* Write lower link settings */
@@ -380,7 +389,7 @@ static void test_dsc_link_settings(data_t *data)

                        for_each_pipe(&data->display, i) {
                                output =3D data->output[i];
-                               if (!output || !igt_output_is_connected(out=
put))
+                               if (!output || !igt_output_is_connected(out=
put) ||
+!is_dsc_capable(&data->mode[i]))
                                        continue;

                                /* Verify lower link settings */
@@ -404,8 +413,9 @@ static void test_dsc_link_settings(data_t *data)
        /* Cleanup all fbs */
        for_each_pipe(&data->display, i) {
                output =3D data->output[i];
-               if (!output || !igt_output_is_connected(output))
+               if (!output || !igt_output_is_connected(output) ||
+!is_dsc_capable(&data->mode[i]))
                        continue;
+
                igt_remove_fb(data->fd, &ref_fb[i]);
        }

--
2.34.1

