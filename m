Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5722C021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 16:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A0710E3EC;
	Tue, 18 Feb 2025 16:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Y3Le8GeG";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0916C10E3EC
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:14:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uryBDg8t3eE3mJSAeHbEBIJA0bpIFyU7aWUEftHiNXFIMF4t2aBYlNxvJRlWucM8LBhWhD6afkUzgQw3iuaazHLPOE4EAicIB337pnSWkS3PiaSaEPl68SUefWM6wG1Y6d5ID6TGooHukYtN7zchE/B4yJXPdM0fxjCqOp+uijNJgNmh5ynwWR/4Gmc1/nbW0XYTi6nkLvR5xHbpxGjN7MNIf6iL1SiJtBHhZJNjewpbPVGBgon/O8+wPmgC6lck620Slne5IvK1iHx4NXr7d3ZRepqKPwE7ZKYMOYHE5q4VfyUjAE0L/XDJrNxrkhTyGPOZx9ycjY8cxHJS99k+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAbmuKSi8p9z2Ib/m0tVXvggETnIGeZDNgvbzHUXTo4=;
 b=wKi+ukgoxoR/Nz8N/yAg9/22TceW6HlTST04FKL358JyV/ETnLDlmIXldWjOfXx7MnCOGrfjXmyDXYIHs5Avyq+Z4i6/C81Ks3UHZG0SZi6LsNx9lhZX1phfox7bRiwCzp6fsalKib3bIRK7nN2dhGhi41ewZvlgxkASEoYLq39tNqRsbkQ0L4lmIo06iQTtIRqNOwq9a11MUk0t+0pU2qhwAl8rats7sMPvOCXWTvMLBWLLPx+qenSLIGZUl8Y/wZdGivd19fNO8LVAwULDP4/dPG0HKzOAmqYSwljIx7ydCSf67eGBraMvEwGFRvdnPqV3TMN/kMO5Dfsk/l+t7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAbmuKSi8p9z2Ib/m0tVXvggETnIGeZDNgvbzHUXTo4=;
 b=Y3Le8GeGPfkCtUde/pjUVNXWIOf9onjmE+stb96lfHq1QlxWp/ZzvMrKa0sN2aL5/i3qQ8j7/4Oi5jfQxyOnACyh+KyBp47/r94Z87RAuCYXZJHa+f56FZZLB3qR3Qa8ECSryhmfy6szNRcAp57tSO3IAVwyWm3D2+eTYu+2FX8=
Received: from DM6PR12MB4481.namprd12.prod.outlook.com (2603:10b6:5:2af::11)
 by SJ0PR12MB8168.namprd12.prod.outlook.com (2603:10b6:a03:4e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 16:13:57 +0000
Received: from DM6PR12MB4481.namprd12.prod.outlook.com
 ([fe80::2f5a:1dde:a3d6:942f]) by DM6PR12MB4481.namprd12.prod.outlook.com
 ([fe80::2f5a:1dde:a3d6:942f%5]) with mapi id 15.20.8466.013; Tue, 18 Feb 2025
 16:13:57 +0000
From: "Zhang, George" <George.Zhang@amd.com>
To: "Chung, ChiaHsuan (Tom)" <ChiaHsuan.Chung@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Hung, Alex" <Alex.Hung@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "Chung, ChiaHsuan (Tom)" <ChiaHsuan.Chung@amd.com>
Subject: RE: [PATCH i-g-t, v3] tests/amdgpu/amd_abm: Disable the ABM after test
Thread-Topic: [PATCH i-g-t,v3] tests/amdgpu/amd_abm: Disable the ABM after test
Thread-Index: AQHbgfT/uPRSYa83ckeqBveB4lrRkrNNPCVA
Date: Tue, 18 Feb 2025 16:13:57 +0000
Message-ID: <DM6PR12MB448175BBB64D23112C72402294FA2@DM6PR12MB4481.namprd12.prod.outlook.com>
References: <20250218110514.8856-1-chiahsuan.chung@amd.com>
In-Reply-To: <20250218110514.8856-1-chiahsuan.chung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=df2f659a-5e76-4c29-879d-aaec01599e4e;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-02-18T16:13:44Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4481:EE_|SJ0PR12MB8168:EE_
x-ms-office365-filtering-correlation-id: af1fd496-8a39-430d-919b-08dd50373f69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2DjunyCncstL8dm7r3FtluVYkeFz+sB69C1aRllnARJyrdNNDuElGlupZR9n?=
 =?us-ascii?Q?TljGcq5YswvbTDc7jda0KdPG1DQRQzag8VCrvR+kwTcr5cJo3qhanItHxlrs?=
 =?us-ascii?Q?PPLNRAZt2sA9K+UQUgHDWMtcrLfkQDwrZpKSB1qgL0gPuHP2mOC+3c+LHhGH?=
 =?us-ascii?Q?UYHF8cznYt6a8MLLeVHdzNOHAt2P9cHY80gChYYM01HMyyxKUI2AtxCWfj9N?=
 =?us-ascii?Q?XpXK2y+x7CX7+lADjfsof8VJWFP/IgsI2whIbiYFHgZt1nUjHzw34MKl49qG?=
 =?us-ascii?Q?8jTkCF5Xh8WmNvBOWcWJ7piJ5bZMUXcp3bHGrnNMrgM7eqN2y8fvrELpbbw1?=
 =?us-ascii?Q?ksEm/W4zeHY3BAn2PN1XGAUnWuqdA5GC0WESE65Uydjyu3vrQnmrVTMtdjlJ?=
 =?us-ascii?Q?OI6lz0CqOP1JAg5fYv/v7K6ZnBy3yi6spdG8Fc9UwajPoiiQhYAkRNnIvBiZ?=
 =?us-ascii?Q?ReEusF73KMxgjrFCcwlNmfni6hdSNkwrzkYt22d1iQyfoCNsQtDhwK3fZ6My?=
 =?us-ascii?Q?U02DxEegnuYvNkjjB/grfHLM0yA14LcBfRNWe/d1XfXvebIljBN1cnYb/PUL?=
 =?us-ascii?Q?HDNK6J6lCZexpkuWQiLJ4or+h2zPlQvRBLIdQ62n8HOLsq4lbClrp09jtk7g?=
 =?us-ascii?Q?2WWnJevi2oS4Qsd+WROIumMR6VRoTV+NM4SrCA5AK8trXioDXCzifYvBkezm?=
 =?us-ascii?Q?CJEhdpPM7EKCoXbX0LbkoB6fzVUpJhsrM5RLWzMg0I9wT7t2vFG/iti3r0nK?=
 =?us-ascii?Q?O1Xh3j4D6aa5l1/3tVNwRrTadoTs0D1o4JmPpI4p1fBWEJWGvN2/J10TPLmW?=
 =?us-ascii?Q?/YCpgu4vbEzBaoc7GqUuE6bDgZSHteRebBKrtJ2T8dvzQUy2/vXlMmKH0sEE?=
 =?us-ascii?Q?EW3pgKCPidirZsstPznLoobp7A/UzQtAT5l4DrMQUwePTc2bgEcXLthT0+X7?=
 =?us-ascii?Q?rbfoTvio9y2iN0XmRTNY9EkNOj31hGHGJEHNbpVbcCFALEyr1bNWp3LrAqw6?=
 =?us-ascii?Q?Q+6nz3RE/yo+4Ui4gzI86kpFc+aOG3NtfxP7VrYJrPMfNGDdFHW14qIeV50p?=
 =?us-ascii?Q?Rz4sCVo7E+tfQaTKtlwhUVbH77n0y4zVEz+SXiHjpsls9E/Ymu33J1cGqyDB?=
 =?us-ascii?Q?FFQNcaCRIppJF8xTPeqXmSKhagqH1OsUghHXsmGcpgQDtl66D8K4XXbp2nP7?=
 =?us-ascii?Q?olt0TpI81TX/E8DOHrVTMvPioguG+eGFRBkyIl6XrvdmZYlIBvVDhqkmT7Eu?=
 =?us-ascii?Q?6sNX+wx/lSvMjBkkG35QXn0g3vFVdrZm0s9bJFafyaFqwfzIiNQNpwBULLNC?=
 =?us-ascii?Q?WsU1KAfp/GT1vTyp9rq1AFIixTe4Bn/IIRI0Q2Jhfj5ksAKlimjzizzKfFkT?=
 =?us-ascii?Q?tadIy222Qfw6YO2sz6LrIwQNU4epA79fFE/vGSaEohnJhIg0dVJR1Fjil9r3?=
 =?us-ascii?Q?vlNHKuqpUPL7H7AeIybTu5QlRljBr1s5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0QHqAaENrLmT1wSClFKr5vk5BnF+iT8TvvUJS8gcHvmhbdzHYrEpqfYa6yYq?=
 =?us-ascii?Q?zN1k7m2ronDBjyh1dTICSw9wuUaUmUVJBTOLEXRntcT+pquHRM3DpvGNssrV?=
 =?us-ascii?Q?a1HkDFNMuPWw26Fq4fXcIlnkOT00kizYgLAmfLat/GGXQOtHwWS09ZqKtuW5?=
 =?us-ascii?Q?B/sW1SDLIqNXMzKTkwoscuxNjPKe7lOMg8LmmlNnzcsohQKX3LLJ5iKtjp5I?=
 =?us-ascii?Q?POwxY+yTqERxP3S4xuiBlOwy9XbT/jg0zMsULNr9xLg/lAgjpKTK6CDZO/5W?=
 =?us-ascii?Q?v216mYIuJxHvhROuNTkKZA3xNWhgfz4E/6NB6Skl6ira9+1W+I34zTRo/8qT?=
 =?us-ascii?Q?SxQxTdDpNb2p+OT6WKSeGifqDt8w1i0IJtiUHXdF5wC5XI/TvP3edbOh7hLb?=
 =?us-ascii?Q?i0uj4hd/+M5fnx9kKUTLAs1bL073TErj48/RzlgJHEsII5ftr5/SpnSmxCcj?=
 =?us-ascii?Q?2hidhiRTneMxZHeg+LtddLCCdoT9ChFZ0pPteK0jwvcRth32sk34hQraYm9M?=
 =?us-ascii?Q?6CLJw7O1NlnsiQl65nx834wR1FW6C37MSmjNnBup3lRg2cqJj0jQFLBWxmVD?=
 =?us-ascii?Q?AEoZIo8hQZ65wIJdi+8u7TO0N+2G/gg5wd+zjZ8iEoqUBHLpvN2pn2emuWEQ?=
 =?us-ascii?Q?4sIFfnUgjiRnHhhAfmpz7Rdqn1AN3O1mUZFUbVo63KvC0c2gNDv/IvV70tvn?=
 =?us-ascii?Q?/flrzabNnX0wCZbmyBu9wEQouM1cUqYnBh8Ehx2/cDhrww1hxnrQyrsMOAAM?=
 =?us-ascii?Q?vZ0ypg/v46uWqFooWwEMTxbbcc3LBZC/fk5YxQA7EuVRv58LA3QXPYkOC1oJ?=
 =?us-ascii?Q?3Ae8oKYDfoS3YMNWYby7fgBZyANLipuKqj1UJWun7tfumv8rjzNPbU7TRDNq?=
 =?us-ascii?Q?BZ+hV/DwNFyhsiFBItOUdWND+5f8o649zW/9izKRFDiy0r1vlJTFcTpNdbol?=
 =?us-ascii?Q?ABH3UZ3GbqWpV2jgLkabAU2o0zV3YMlxLyfUPLkjITUFI7scIekrlv1mNbRe?=
 =?us-ascii?Q?50Yo9hf3V9TN5zv4lwVa734C6/9hiv7ZQ/8HYUK92+1ly4CsNHGzIbmBTiPW?=
 =?us-ascii?Q?7tAzCoe+sg0Sz+T4wZ+6S06GaQ/zQ7FcFjxn2EDYBSoND6zpUbxYPoci5nD4?=
 =?us-ascii?Q?orAbsL8Lwbhc2M82QhK9yb0hkjFAUe8s4hcz1WMjfeI23moi5juNPvVi8XDW?=
 =?us-ascii?Q?AFHtf+bebG5NTnHnCuYGMJ7RvVVdw2To7VCxue8wQGINpdDIriXs5NKAebwN?=
 =?us-ascii?Q?c2lXb/3DCU2zRQCT9qTMR8NwE28w+vVUGouEAdR+KVDB8pqtGVlkSFCQ7Bi7?=
 =?us-ascii?Q?qjDUfxihs8qFsbInDMjMpfAnfps0EutNG8CiBt2tqyj5NVLhyhyMVyZmI9Vu?=
 =?us-ascii?Q?/b9YkVifneL96ahSL3pVjzWLmxHVg678gVSuhYZ9+vfzvVuIoXM9t/GMgnaI?=
 =?us-ascii?Q?QwBQM75xJ+Agvujbt/Xwn3Jlo9eoGxltVn3xPjadCjfdjBWhEoIIRCCLvx/R?=
 =?us-ascii?Q?KorBE0KMdnFvWoyBbDOz5w1BKVDN06CTQ/1ZfkBJ1r9xXkeokEDmtLQzxzbM?=
 =?us-ascii?Q?Fu4qkAn7UAmAUZNVByc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af1fd496-8a39-430d-919b-08dd50373f69
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 16:13:57.3362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yCFvkWbCjAQDBeAXG4+hOYNp/MVdquf09HH5wchd+Te0HURiy0eMhHKGMXV6w20DVW9HpDdEe1jzrardH6XJ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8168
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

[Public]

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Tom Ch=
ung
> Sent: Tuesday, February 18, 2025 6:05 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Hung, Alex <Alex.Hung@amd.com>; Li, Sun peng (Leo)
> <Sunpeng.Li@amd.com>; Chung, ChiaHsuan (Tom)
> <ChiaHsuan.Chung@amd.com>
> Subject: [PATCH i-g-t,v3] tests/amdgpu/amd_abm: Disable the ABM after tes=
t
>
> [Why]
> After running the ABM IGT test, It may cause some other IGT test failed b=
ecause of
> the ABM is still enabled.
>
> [How]
> Disable the ABM after running the test.
>

Tested-by: George Zhang <george.zhang@amd.com>

> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
> v3: Fix the conflict
>
>  tests/amdgpu/amd_abm.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c index
> e196b6ebc..8f7f489ad 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -49,6 +49,8 @@ typedef struct data {
>       igt_fb_t ref_fb;
>  } data_t;
>
> +static void set_abm_level(data_t *data, igt_output_t *output, int
> +level);
> +
>  /* Common test setup. */
>  static void test_init(data_t *data)
>  {
> @@ -101,6 +103,15 @@ static void test_init(data_t *data)  static void
> test_fini(data_t *data)  {
>       igt_display_t *display =3D &data->display;
> +     igt_output_t *output;
> +     enum pipe pipe;
> +
> +     /* Disable ABM before exit test */
> +     for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +             if (output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
> +                     continue;
> +             set_abm_level(data, output, 0);
> +     }
>
>       igt_display_reset(display);
>       igt_display_commit_atomic(display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> --
> 2.43.0

