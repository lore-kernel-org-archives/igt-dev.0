Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED56C6FD1F
	for <igt-dev@archiver.kernel.org>; Sun, 24 Mar 2024 18:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D6C10E303;
	Sun, 24 Mar 2024 18:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="paAWPxNy";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2072.outbound.protection.outlook.com [40.107.102.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8843310E303
 for <igt-dev@lists.freedesktop.org>; Sun, 24 Mar 2024 18:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doXxKPE0Jaatifd8W+Ns4VW0pu8a+XnjCU4eqDh9O+nUfXkuNwsf+7wJrBl3BqGmfERdNfX2qCnS1V9Q5ix11xHjBtcaIOH35x6/6qgFiCetTIYtAhB19//0IUd1k6Q9rh+0oye5kQVlFN4jKfBxJF5tkBSjSJq/pjF2b7Xym8LvwJsE7fgD/LHZdt1oobru7fJJpNjfZr5QFzKXSAhBFBTQjWhkkqxyMiA9INSvMRslP58UnithadoKadPMhQuRnlmAenMtrW2oC7JvXEZvcWwsI76ssn4V8p5S08NIQRPEzSgMd2lLs3dMnMr8yzDWDVjPrzmzd9ygmw3IGI2sDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qctjhc5p2Y7XN1dBXfO0stPZie3xjCRh4iwbnxApm7U=;
 b=BcQNNR2XiUyFh96udsEjPN8ulDEZlym9ZImaSIc2LHiBEHidZ3Z34hIOTX+BbidKduBM0aBx8uQhCekdOaKYmA1bgTnANwgmyg229ZoZNUi7bsetnJC83hOZe1mOGR5U7h9kJbZLBFiU3I19x6KELENg7aNvfWYiRRkLTLaxvbsEYRAJVUqAJK0VP/BDyBK3BGdwqGlMGoUaKlY2w1KktrCWgptah+b7uxU+kHfuA8WE9YMdK62kr4PD7YOiPZVE+Gs8QFMuYeywSBQEMRg7/bx0EXw7bMWdnTgu0ZlNN1mTBfUMiM4+1fB48aWixGVkINnHKnbrnnplKOCYb5U8cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qctjhc5p2Y7XN1dBXfO0stPZie3xjCRh4iwbnxApm7U=;
 b=paAWPxNyUXUym2/wlyMErEeSWkYwUw1OPsYAu5emNtubDOUlJnMBX8VUbAV674Mu8/zRh3WxA/qLj8Tp+tVzoHTqM0pw2vwpowNDu9DegR/2YFTtEgyrcosXIUU+OmTCWXDrRl9cxyY2tkDsf8RQqaGvLII6fP9TTFqHgUkaFIo=
Received: from PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18)
 by PH7PR12MB7818.namprd12.prod.outlook.com (2603:10b6:510:269::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Sun, 24 Mar
 2024 18:32:21 +0000
Received: from PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::dd5a:9555:315f:55e0]) by PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::dd5a:9555:315f:55e0%4]) with mapi id 15.20.7386.025; Sun, 24 Mar 2024
 18:32:21 +0000
From: "Wu, Hersen" <hersenxs.wu@amd.com>
To: "Hung, Alex" <Alex.Hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
Subject: RE: [PATCH 1/3] tests/amdgpu/amd_dp_dsc: Correct code style problems
Thread-Topic: [PATCH 1/3] tests/amdgpu/amd_dp_dsc: Correct code style problems
Thread-Index: AQHae+HduynpW6LnekepLoqd+QqiXrFHO1pw
Date: Sun, 24 Mar 2024 18:32:21 +0000
Message-ID: <PH8PR12MB6962FD630F3C7CFC99C146DFFD372@PH8PR12MB6962.namprd12.prod.outlook.com>
References: <20240321224758.1531610-1-alex.hung@amd.com>
In-Reply-To: <20240321224758.1531610-1-alex.hung@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=7e993719-da17-47c2-905b-cc831f9c15f3;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-24T18:32:00Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB6962:EE_|PH7PR12MB7818:EE_
x-ms-office365-filtering-correlation-id: cf3231ce-ac9d-4a8a-e817-08dc4c30be2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 69gAim+3osg/s/69Raqm06NliAq3NSE/qgM2JoKwLm8MuxMh3b9o0uK0zYOaJ4Wm2KLdSHzZ8vHfZQg0acjIHnpKQWTaloQqYjMNMVR/oAbFjP1OjpIz4BIy8cYyvghiGb+miP+xTcutsXt7ta7TCtdBGPNigvxV7nioE0x0xSisXfGda+zmBZq3tsk3N1/FUMpo26ZWhqT2EloLc9MhTrJ7yaV3svoGOUwmUMmiFjzdfUdJwm30INVerZ1TsepNnfvirE/wXwHjdlheEzBItFAri3NjFMaTbN3garC8BmYeP9/DOjcLd0kQcZK/vLcx2rt8Sp6NMMX85zzCfV0ONHd8WYkDT9pWQHIFhRLY+lUaoY4scO1XFmBy1fPCghVloPAmrX3sa69CYiRVzenxPl4Yvz9w1YxZDYDDA9oZcTHIOXsr+TrlhXwE4aFYxkDN8SAlH4RcAXokEZa6HwxzK7j3xzze/LB8SD04+Mf/XCMKzVY81uUnQCTEmqIPucqeLWFRivmntMVj8/F/LMLcczWCskkO8jn9HrGsg2sLSh0WuUSD1dkb/A4F8+JKppkeS9VEKOH6JN5lTDGNudZV7PtViyhORM3ZDp8DqCTaYIcQwdtFeDgJvN+hl/hSuxDh5odbze2gvUkWmx8/kEpZsMvh7ZSkByFFw2Z7HBIhh1z8GlrO2mf1G72qvVPeGYY3y3ewzp7JnpjEn71Vt1Q2OFPCWKBfuDdXhO0bhhbj5T0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB6962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sixYYVyfgDXNPCmz/Rf8fyHhKphOVtjGIozSR1vaE3SUw59MS1iYrnnyuW3L?=
 =?us-ascii?Q?x8uYlAMCsOZefmsS03hXnp1BgHMfFf4ppZKYVNyY2qAqfc3YZhJl38pNtMvk?=
 =?us-ascii?Q?ZlDPSULtefKuxe8uCZTw1flwksd5WnsxSsYPzEq3o+KsKbfZXLYQruvzMIl/?=
 =?us-ascii?Q?hY/I5zH/O5LLL5ZgcH0muPYFadT8kIW/IvA5IvskZXFdxFrtReZvKOnGiMtB?=
 =?us-ascii?Q?+JqdBoBujaGIHCMYzQj3Zf62STPQjI4K7Jv0VNyv4AU+8xmUDtt18JbPXWDF?=
 =?us-ascii?Q?0hHbVIH/qzsxlQjKkktewYFf2IIgho63FrBEwUcNiUj7+h0UgL8PaM6Gk4dH?=
 =?us-ascii?Q?qyvBqryTFGAN+quyQpVjRCCoJBv+Y/ygn2DXz4rHTNKQDR871k/Gur9DrlUf?=
 =?us-ascii?Q?Zthddqcip1/X7nq62JalWV2e2rr1uCi3zFame9Qfd6BJwueuP3YQ/ARUO+t3?=
 =?us-ascii?Q?ILf27GFUAHMSBpwbnT5V7ZAzH6Zz9LK/2VX/V2WvE2K06eMHqejb8B6hbHX6?=
 =?us-ascii?Q?CP5LmVdpCb4q4qxGtWi4fxhAhaqzSMsSsdwE76M7hGK8CKcnL3teJT81YZNP?=
 =?us-ascii?Q?nSsA+1oifZ9oAuAJPky2Kx9MJsRSUA4g62d/tqqArwg7nvaTUflXpitoxfWT?=
 =?us-ascii?Q?QPgHBwb8nHksKXclPMqZcGXtJL+m8FcPUo++PGrGN2QokkHt/H56kEQLIQwJ?=
 =?us-ascii?Q?U1pLAT8BEsk6xiepVPoJTC0+vlTeSHYmH99tKiIvQ4g7RP0MUb5tBFHe/AmB?=
 =?us-ascii?Q?BDi52AoTop1hEECMNSNOonobTTt/ZX8JGH5IMRUYx6zY4jS61zit4vd3Jm/9?=
 =?us-ascii?Q?C7vU70batT9Vf2ttMZcvNHjd3T4S8VcFM08oejjNL9etTZ4sQHKXHPJeyfzx?=
 =?us-ascii?Q?SGsZIWHQlMEugvY83WwhMnwnnwLzxk0iDY2NVGSPgUv9EkJinHwfMcuN0v7o?=
 =?us-ascii?Q?Fqf8413ALbC1JJV9lPPhLNSmyUmxyMpqf8tSJQKbHpZ33WS+VBuuBZBgeH97?=
 =?us-ascii?Q?ecX3KZCmMQImMnIl2Ga/F4+4pIwMwg847HSyLe6WFPrmVIDbnHjtofa07jt3?=
 =?us-ascii?Q?3vYJ6Hr4m7P2hv1p94/O6seotzwbA257Pu3d1AF2rRnXfLsu+GcU6gYOc36U?=
 =?us-ascii?Q?HfUEkQFNjOJMdXC8Ix9NmC9pMgxv0zqEknML2G54AQkFpDxwykBCxUK0HItd?=
 =?us-ascii?Q?MCauukkdW/YWZA+7pfqsZK50AtCk5Gt8D3abhgFFA7rBx7yY346CN7aDXKmU?=
 =?us-ascii?Q?t+ngH7eh8SQGVHuLdzxdkQ4hA6nBHLtXG3+fphpxAjyYwfk1e5B/VZ7EqvXS?=
 =?us-ascii?Q?o6t/Xp02JN031Jl4f/KqqgUJd86RiVGyLVIaJKKrZRe1n5mQpSMx0l+9ZaJO?=
 =?us-ascii?Q?CY6dYcGjoGLzfQY7WDuUw0Ma96JyEqKKjF4Q147GDUEBIIioHdvJGGHn1Ysh?=
 =?us-ascii?Q?AI6c+1W7brrPS4VRvYRkSZMykiq6xWbwH5vBuF1/bbCq/aqOuimbGwDgh4hL?=
 =?us-ascii?Q?W7wH+ZL5gmn4ejPlOos/7qNzzYqcSBY+oc00EtSoSXWSKRXD2w7ER7RyAiHt?=
 =?us-ascii?Q?vBA7nh1y8jTUOMlsG4o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3231ce-ac9d-4a8a-e817-08dc4c30be2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2024 18:32:21.2141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3d5kaYIH24Igq3mRVSSA2V85zMBDh+O4dTenrG3QQICYPUAe3ds0newhPpp3EmazYWloY4q+xmfUW3sQdCG+dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7818
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
Subject: [PATCH 1/3] tests/amdgpu/amd_dp_dsc: Correct code style problems

Use "indent -linux" to fix code styles such as idententation and spaces.
Some manual fixes were also applied for consistency.

There are no funtional changes.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/amdgpu/amd_dp_dsc.c | 154 +++++++++++++++++---------------------
 1 file changed, 68 insertions(+), 86 deletions(-)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c index e7=
82ce84a..f2da98259 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -66,11 +66,8 @@ static void test_init(data_t *data)
        for_each_pipe(display, i) {
                data->pipe_id[i] =3D PIPE_A + i;
                data->pipe[i] =3D &data->display.pipes[data->pipe_id[i]];
-               data->primary[i] =3D igt_pipe_get_plane_type(
-                               data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
-               data->pipe_crc[i] =3D
-                               igt_pipe_crc_new(data->fd, data->pipe_id[i]=
,
-                                                IGT_PIPE_CRC_SOURCE_AUTO);
+               data->primary[i] =3D igt_pipe_get_plane_type(data->pipe[i],=
 DRM_PLANE_TYPE_PRIMARY);
+               data->pipe_crc[i] =3D igt_pipe_crc_new(data->fd, data->pipe=
_id[i],
+IGT_PIPE_CRC_SOURCE_AUTO);
        }

        for (i =3D 0, n =3D 0; i < display->n_outputs && n < display->n_pip=
es; ++i) { @@ -79,19 +76,16 @@ static void test_init(data_t *data)

                /* Only allow physically connected displays for the tests. =
*/
                if (!igt_output_is_connected(output))
-                               continue;
+                       continue;

-               /* Ensure that outpus are DP, DSC & FEC capable*/
-               if (!(is_dp_fec_supported(data->fd, output->name) &&
-                       is_dp_dsc_supported(data->fd, output->name)))
+               /* Ensure that outpus are DP, DSC & FEC capable */
+               if (!(is_dp_fec_supported(data->fd, output->name) &&
+is_dp_dsc_supported(data->fd, output->name)))
                        continue;

-               if (output->config.connector->connector_type !=3D
-                       DRM_MODE_CONNECTOR_DisplayPort)
+               if (output->config.connector->connector_type !=3D
+DRM_MODE_CONNECTOR_DisplayPort)
                        continue;

-               igt_assert(kmstest_get_connector_default_mode(
-                               data->fd, output->config.connector, &data->=
mode[n]));
+               igt_assert(kmstest_get_connector_default_mode(data->fd,
+output->config.connector, &data->mode[n]));

                n +=3D 1;
        }
@@ -117,11 +111,11 @@ static void test_dsc_enable(data_t *data)
                        continue;

                igt_create_pattern_fb(data->fd,
-                                       data->mode[i].hdisplay,
-                                       data->mode[i].vdisplay,
-                                       DRM_FORMAT_XRGB8888,
-                                       0,
-                                       &ref_fb);
+                                     data->mode[i].hdisplay,
+                                     data->mode[i].vdisplay,
+                                     DRM_FORMAT_XRGB8888,
+                                     0,
+                                     &ref_fb);
                igt_output_set_pipe(output, data->pipe_id[i]);
                igt_plane_set_fb(data->primary[i], &ref_fb);
                igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MO=
DESET, 0); @@ -144,11 +138,11 @@ static void test_dsc_enable(data_t *data)
                igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORC=
E_OFF);

                igt_plane_set_fb(data->primary[i], &ref_fb);
-               igt_display_commit_atomic(display,DRM_MODE_ATOMIC_ALLOW_MOD=
ESET, NULL);
+               igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MO=
DESET,
+NULL);

                dsc_after =3D igt_amd_read_dsc_clock_status(data->fd, outpu=
t->name);

-               /* Revert DSC back to automatic mechanism by disabling stat=
e overwrites*/
+               /* Revert DSC back to automatic mechanism by disabling stat=
e
+overwrites */
                igt_plane_set_fb(data->primary[i], &ref_fb);

                igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTO=
MATIC); @@ -167,12 +161,12 @@ static void test_dsc_enable(data_t *data)  }

 static bool update_slice_height(data_t *data, int v_addressable,
-                                         int *num_slices, igt_output_t *ou=
tput, int conn_idx, igt_fb_t ref_fb)
+                               int *num_slices, igt_output_t * output, int=
 conn_idx, igt_fb_t
+ref_fb)
 {
        int i;
        bool pass =3D true;

-       for(i =3D 0; i < NUM_SLICE_SLOTS; i++) {
+       for (i =3D 0; i < NUM_SLICE_SLOTS; i++) {
                int act_slice_height;
                int slice_height =3D v_addressable / num_slices[i] + (v_add=
ressable % num_slices[i]);

@@ -201,12 +195,12 @@ static bool update_slice_height(data_t *data, int v_a=
ddressable,  }

 static bool update_slice_width(data_t *data, int h_addressable,
-                                         int *num_slices, igt_output_t *ou=
tput, int conn_idx, igt_fb_t ref_fb)
+                              int *num_slices, igt_output_t * output, int =
conn_idx,
+igt_fb_t ref_fb)
 {
        int i;
        bool pass =3D true;

-       for(i =3D 0; i < NUM_SLICE_SLOTS; i++) {
+       for (i =3D 0; i < NUM_SLICE_SLOTS; i++) {
                int act_slice_width;
                int slice_width =3D h_addressable / num_slices[i] + (h_addr=
essable % num_slices[i]);

@@ -240,9 +234,9 @@ static void test_dsc_slice_dimensions_change(data_t *da=
ta)
        igt_output_t *output;
        igt_display_t *display =3D &data->display;
        igt_fb_t ref_fb;
-       int num_slices [] =3D { 1, 2, 4, 8 };
+       int num_slices[] =3D { 1, 2, 4, 8 };
        int h_addressable, v_addressable;
-       bool ret_slice_height=3D false, ret_slice_width =3D false;
+       bool ret_slice_height =3D false, ret_slice_width =3D false;
        int i, test_conn_cnt =3D 0;

        test_init(data);
@@ -255,11 +249,11 @@ static void test_dsc_slice_dimensions_change(data_t *=
data)
                        continue;

                igt_create_pattern_fb(data->fd,
-                                       data->mode[i].hdisplay,
-                                       data->mode[i].vdisplay,
-                                       DRM_FORMAT_XRGB8888,
-                                       0,
-                                       &ref_fb);
+                                     data->mode[i].hdisplay,
+                                     data->mode[i].vdisplay,
+                                     DRM_FORMAT_XRGB8888,
+                                     0,
+                                     &ref_fb);
                igt_output_set_pipe(output, data->pipe_id[i]);
                igt_plane_set_fb(data->primary[i], &ref_fb);
                igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MO=
DESET, 0); @@ -296,7 +290,7 @@ static void test_dsc_slice_dimensions_change=
(data_t *data)

                dsc_after =3D igt_amd_read_dsc_clock_status(data->fd, outpu=
t->name);

-               /* Revert DSC back to automatic mechanism by disabling stat=
e overwrites*/
+               /* Revert DSC back to automatic mechanism by disabling stat=
e
+overwrites */
                igt_plane_set_fb(data->primary[i], &ref_fb);

                igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTO=
MATIC); @@ -321,43 +315,41 @@ static void test_dsc_link_settings(data_t *da=
ta)
        igt_output_t *output;
        igt_fb_t ref_fb[MAX_PIPES];
        igt_crc_t ref_crc[MAX_PIPES], new_crc[MAX_PIPES];
-    int lane_count[4], link_rate[4], link_spread[4];
+       int lane_count[4], link_rate[4], link_spread[4];
        igt_display_t *display =3D &data->display;
        int i, lc, lr;
-    bool dsc_on;
-       const enum dc_lane_count lane_count_vals[] =3D
-       {
+       bool dsc_on;
+       const enum dc_lane_count lane_count_vals[] =3D {
                LANE_COUNT_TWO,
                LANE_COUNT_FOUR
        };
-       const enum dc_link_rate link_rate_vals[] =3D
-       {
+       const enum dc_link_rate link_rate_vals[] =3D {
                LINK_RATE_LOW,
                LINK_RATE_HIGH,
                LINK_RATE_HIGH2,
                LINK_RATE_HIGH3
        };

-    test_init(data);
+       test_init(data);

-    /* Setup all outputs */
+       /* Setup all outputs */
        for_each_pipe(&data->display, i) {
                output =3D data->output[i];
                if (!output || !igt_output_is_connected(output))
                        continue;

-        igt_create_pattern_fb(data->fd,
-                    data->mode[i].hdisplay,
-                    data->mode[i].vdisplay,
-                    DRM_FORMAT_XRGB8888,
-                    0,
-                    &ref_fb[i]);
+               igt_create_pattern_fb(data->fd,
+                                     data->mode[i].hdisplay,
+                                     data->mode[i].vdisplay,
+                                     DRM_FORMAT_XRGB8888,
+                                     0,
+                                     &ref_fb[i]);
                igt_output_set_pipe(output, data->pipe_id[i]);
                igt_plane_set_fb(data->primary[i], &ref_fb[i]);
        }
        igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0=
);

-    /* Collect reference CRCs */
+       /* Collect reference CRCs */
        for_each_pipe(&data->display, i) {
                output =3D data->output[i];
                if (!output || !igt_output_is_connected(output)) @@ -376,11=
 +368,10 @@ static void test_dsc_link_settings(data_t *data)

                                /* Write lower link settings */
                                igt_info("Applying lane count: %d, link rat=
e 0x%02x, on default training\n",
-                                               lane_count_vals[lc], link_r=
ate_vals[lr]);
+                                        lane_count_vals[lc], link_rate_val=
s[lr]);
                                igt_amd_write_link_settings(data->fd, outpu=
t->name,
-                                                       lane_count_vals[lc]=
,
-                                                       link_rate_vals[lr],
-                                                       LINK_TRAINING_DEFAU=
LT);
+                                                           lane_count_vals=
[lc],
+                                                           link_rate_vals[=
lr], LINK_TRAINING_DEFAULT);
                                usleep(500 * MSEC_PER_SEC);
                        }

@@ -393,10 +384,7 @@ static void test_dsc_link_settings(data_t *data)
                                        continue;

                                /* Verify lower link settings */
-                               igt_amd_read_link_settings(data->fd, output=
->name,
-                                                       lane_count,
-                                                       link_rate,
-                                                       link_spread);
+                               igt_amd_read_link_settings(data->fd, output=
->name, lane_count,
+link_rate, link_spread);

                                igt_assert_f(lane_count[0] =3D=3D lane_coun=
t_vals[lc], "Lowering lane count settings failed\n");
                                igt_assert_f(link_rate[0] =3D=3D link_rate_=
vals[lr], "Lowering link rate settings failed\n"); @@ -404,10 +392,8 @@ sta=
tic void test_dsc_link_settings(data_t *data)
                                /* Log current mode and DSC status */
                                dsc_on =3D igt_amd_read_dsc_clock_status(da=
ta->fd, output->name) =3D=3D 1;
                                igt_info("Current mode is: %dx%d @%dHz -- D=
SC is: %s\n",
-                                                       data->mode[i].hdisp=
lay,
-                                                       data->mode[i].vdisp=
lay,
-                                                       data->mode[i].vrefr=
esh,
-                                                       dsc_on ? "ON" : "OF=
F");
+                                        data->mode[i].hdisplay,
+                                        data->mode[i].vdisplay, data->mode=
[i].vrefresh, dsc_on ? "ON" :
+"OFF");

                                igt_pipe_crc_collect_crc(data->pipe_crc[i],=
 &new_crc[i]);
                                igt_assert_crc_equal(&ref_crc[i], &new_crc[=
i]); @@ -423,7 +409,7 @@ static void test_dsc_link_settings(data_t *data)
                igt_remove_fb(data->fd, &ref_fb[i]);
        }

-    test_fini(data);
+       test_fini(data);
 }

 static void test_dsc_bpc(data_t *data)
@@ -433,10 +419,10 @@ static void test_dsc_bpc(data_t *data)
        igt_crc_t test_crc;
        igt_display_t *display =3D &data->display;
        int i, bpc, max_supported_bpc[MAX_PIPES];
-    bool dsc_on;
-       const int bpc_vals[] =3D {12, 10, 8};
+       bool dsc_on;
+       const int bpc_vals[] =3D { 12, 10, 8 };

-    test_init(data);
+       test_init(data);

        /* Find max supported bpc */
        for_each_pipe(&data->display, i) {
@@ -447,7 +433,7 @@ static void test_dsc_bpc(data_t *data)
                max_supported_bpc[i] =3D igt_get_output_max_bpc(data->fd, o=
utput->name);
        }

-    /* Setup all outputs */
+       /* Setup all outputs */
        for (bpc =3D 0; bpc < ARRAY_SIZE(bpc_vals); bpc++) {
                igt_info("Testing bpc =3D %d\n", bpc_vals[bpc]);

@@ -463,11 +449,11 @@ static void test_dsc_bpc(data_t *data)
                        igt_info("Setting bpc =3D %d\n", bpc_vals[bpc]);
                        igt_output_set_prop_value(output, IGT_CONNECTOR_MAX=
_BPC, bpc_vals[bpc]);
                        igt_create_pattern_fb(data->fd,
-                                               data->mode[i].hdisplay,
-                                               data->mode[i].vdisplay,
-                                               DRM_FORMAT_XRGB8888,
-                                               0,
-                                               &ref_fb[i]);
+                                             data->mode[i].hdisplay,
+                                             data->mode[i].vdisplay,
+                                             DRM_FORMAT_XRGB8888,
+                                             0,
+                                             &ref_fb[i]);
                        igt_output_set_pipe(output, data->pipe_id[i]);
                        igt_plane_set_fb(data->primary[i], &ref_fb[i]);
                }
@@ -488,16 +474,15 @@ static void test_dsc_bpc(data_t *data)

                        /* Check current bpc */
                        igt_info("Verifying display %s has correct bpc\n", =
output->name);
-                       igt_assert_output_bpc_equal(data->fd, data->pipe_id=
[i],
-                                                   output->name, bpc_vals[=
bpc]);
+                       igt_assert_output_bpc_equal(data->fd, data->pipe_id=
[i],
+output->name, bpc_vals[bpc]);

                        /* Log current mode and DSC status */
                        dsc_on =3D igt_amd_read_dsc_clock_status(data->fd, =
output->name) =3D=3D 1;
                        igt_info("Current mode is: %dx%d @%dHz -- DSC is: %=
s\n",
-                                               data->mode[i].hdisplay,
-                                               data->mode[i].vdisplay,
-                                               data->mode[i].vrefresh,
-                                               dsc_on ? "ON" : "OFF");
+                                data->mode[i].hdisplay,
+                                data->mode[i].vdisplay,
+                                data->mode[i].vrefresh,
+                                dsc_on ? "ON" : "OFF");
                }

                /* Cleanup all fbs */
@@ -513,17 +498,15 @@ static void test_dsc_bpc(data_t *data)
                }
        }

-    test_fini(data);
+       test_fini(data);
 }

-igt_main
-{
+igt_main {
        data_t data =3D { 0 };

        igt_skip_on_simulation();

-       igt_fixture
-       {
+       igt_fixture {
                data.fd =3D drm_open_driver_master(DRIVER_ANY);

                igt_display_require(&data.display, data.fd); @@ -536,22 +51=
9,21 @@ igt_main

        igt_describe("Forces DSC on/off & ensures it is reset properly");
        igt_subtest("dsc-enable-basic")
-                   test_dsc_enable(&data);
+           test_dsc_enable(&data);

        igt_describe("Tests various DSC slice dimensions");
        igt_subtest("dsc-slice-dimensions-change")
-                   test_dsc_slice_dimensions_change(&data);
+           test_dsc_slice_dimensions_change(&data);

        igt_describe("Tests various combinations of link_rate + lane_count =
and logs if DSC enabled/disabled");
        igt_subtest("dsc-link-settings")
-                   test_dsc_link_settings(&data);
+           test_dsc_link_settings(&data);

        igt_describe("Tests different bpc settings and logs if DSC is enabl=
ed/disabled");
        igt_subtest("dsc-bpc")
-                       test_dsc_bpc(&data);
+           test_dsc_bpc(&data);

-       igt_fixture
-       {
+       igt_fixture {
                igt_reset_connectors();
                igt_display_fini(&data.display);
        }
--
2.34.1

