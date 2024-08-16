Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF51AC52D7D
	for <igt-dev@archiver.kernel.org>; Fri, 16 Aug 2024 01:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7392889612;
	Fri, 16 Aug 2024 01:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WQokhOkY";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B75A89612
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Aug 2024 01:35:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6C7vJRBfjlpu4KOFSRubJLyBo2QFd+VjfH34n8Sw9k2HIGIsPNGMR19WQD+Z07qhb/5DzDPI1QpZUSvyLpSfb8w7V1QZRlOh/JKVItJrrbAbO2+/OPTGhll5aDi5WtiQLIYEh+7Ej8/AfrGwf/0JzbJCu9kEewhVfdaG63Bi1m11blQyKYyyWFi2jPvKkbDSVYcotLV/qy+0LX0WqKqjQ+IACXQ6uJFuRzEYDaE5HGQrpIJmrPW07s3LMYXX5siAx6VF0olsmzwXMGNk3FcnWqCv/B6zJYgje7UT6tRqHCN0u8on6Nt1vCoMwuaMHjSD/m0FkjwT/fnnlKjt8ps0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4i6Sd1x93b9K9gP05uXKg0QMIxWzxwoq81C/MlekSnM=;
 b=PlxK4XtrvF0lrEjiD7/1CEj0HZnDSPWf5099KA+AQmFJMXATAQmusDy1ieuebe532Y/7VnT4AKylNSJ6oi4cajS0394F9PICAKVd3OIlSR9pf1wVQRSyf5xlRVF6dGirleuAWwAssHFhbA9MnG3HaYE92CJu2I3hbNR+nKKFVbnGyk/I5sqyhvZW22GEtuDdRkh0BsAn00Imt2pNwD7MSdLAOyXMBy9BRS8qpaVAWv9mqlE5J/Ok7siOsIVCnwolLm/tS5rpSM8oXNvtisrJ1kiZ7KEVinYQ/7WohQ0EDK3kyBGP6S0PJ7A4jFJcWcTa+UBQ+ibVXlNZ0tMM+D3rUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4i6Sd1x93b9K9gP05uXKg0QMIxWzxwoq81C/MlekSnM=;
 b=WQokhOkYRvl6ta0M8E+GCBRxQUNgxWPjz3Q0Lzjw3VA6s7oMqpohcYWkV37k+yHnFGGw8FHCPoWhrP90UdeEJJjyGsmhDHYoPGE9cLx01hiDmHwACyQMRtGHhvdQR4G+CJ5aDZOam+antBPNNLUEkvwCOWu8PwXYYimgz93E7AA=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DS0PR12MB8367.namprd12.prod.outlook.com (2603:10b6:8:fd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 01:35:35 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%3]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 01:35:35 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: [PATCH] tests/amd_queue_reset: Refactor ring sequence for job
 submissions
Thread-Topic: [PATCH] tests/amd_queue_reset: Refactor ring sequence for job
 submissions
Thread-Index: AQHa73nYLcnc4DScsk+O6vI4EIrOCLIpGi2Q
Date: Fri, 16 Aug 2024 01:35:35 +0000
Message-ID: <DM4PR12MB51528AEACC70E7A2C8438E0CE3812@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240816011534.532384-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240816011534.532384-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=b9575c5d-713a-41b1-a9aa-6d758d743e3b;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-16T01:35:24Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|DS0PR12MB8367:EE_
x-ms-office365-filtering-correlation-id: d3e5d1fb-5d99-40d4-d3d5-08dcbd93b9de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3sRutn8OchsD7Lnoac4CN91k2N5EUlUMiBKpjGk+nJSwd509HJD6ZBex7SrO?=
 =?us-ascii?Q?M2n6J8mFaBo6wnnPeX+Eg3fhlTX8d0j2fY/qkUqTnQx9GnsqgGo87WTblItc?=
 =?us-ascii?Q?ARuQUSY4zAAfNYI2vR8B6JDl/tP1TVHNRFsJL2SpP3XivRBw4DLoi0ynVGQS?=
 =?us-ascii?Q?KhTDMGg4IuQGXixFQJIPk3yo+z2dajIhIBXUYR5vd6qGkVu8eUan6+0DsQ2U?=
 =?us-ascii?Q?uigmYNl08f+U6TAbUJj/T0Nt3vvRHJUCAUSQtxqvCINhyOzDwmznXpPoXaF+?=
 =?us-ascii?Q?HhXxNpDaG665XZn9sLCw2kFMXEak2eFngJYIhhS8C8jLXIUmCEdFiVwLiVTh?=
 =?us-ascii?Q?jEtEJ18cBt3eIvNpr/73ADKedS8sJHYUhtwTIH2Pn5ZNxM5BWq7ONuFHTTxs?=
 =?us-ascii?Q?F4mZnHJqRf1X67ODEqK4LTXK0SjAnXJXD73KyWWZ7zo2L5v7nqTM4fXAiuUi?=
 =?us-ascii?Q?DrPxd9lGZZYuFmLwi4O6/Q6c5IaVFBdy4n8XaAGvVVzXaTaTF1B6mgVLrI3F?=
 =?us-ascii?Q?v65w5eOdnFjN+qBJ0WWrFAVkfS88As7Kg7NDRKJfeqLJWN8oopaCiZRBzg3O?=
 =?us-ascii?Q?mQVgCG8BudH0f2ds/joloVNHnAqXvRqEWVvrzGhhp6+V3c3a51E3tO5jcmbK?=
 =?us-ascii?Q?RCZ3edrDVDIQ6eeilnr0G+s8OBv2wTlZZy6vCMzDNeSheXa5cuC3kZqFstX6?=
 =?us-ascii?Q?7NA1amBtyDjfb6ZhhK4JyoP4jJhF+sZceaa+Q4ywbIxGa7bxH/OY/jsi6oy7?=
 =?us-ascii?Q?gtcRHxRJAvVdAILd+JtoJKkWLsXjyMqCZuY1k4dH0Q9rvkyFwNnKl/eO/ubI?=
 =?us-ascii?Q?OaZezjNOXqbOF55rF8DKwqn8h76AjcujgrABeCCu8fcE7/tPAy6bWvqfk5Kn?=
 =?us-ascii?Q?IdfFszFOESTFIJuVHyJPujCxSUAEbWVo3HM0r0j43wv0wq2fC3RpOeiYggsB?=
 =?us-ascii?Q?x41Dnr/NO0kyxv4d7VCIQVAq9mSm3cE+wf6riV58JSUE4BMRlXeXsa/Z/dPD?=
 =?us-ascii?Q?8zDU/6+YZMkF4y/1ESC3vDWZzhbpDvEh3zFLfIRieWkX1s+HJW0nDrFSSZkK?=
 =?us-ascii?Q?RQBdJ7Mmd5CC/0+bDBn8aki5k2kUK3c+0ZaeqaA7VtCy9NZ+MeGrMOPPbZIg?=
 =?us-ascii?Q?1cd1VTGI+6ILEfp4ha1xrctJQA/VDSldQnXJcmAMW6Yh6JXzic5OMe1FbIOJ?=
 =?us-ascii?Q?y2+j6lv0+ZEczJb6gAEdfGK6QMHMl+V8quXXMPWFC9c+N/VQk2qIAE47RrsB?=
 =?us-ascii?Q?PO37tDx9vWfKipCtlOIoV/2pLiq/RztuE59klLw75IVuBuEg6CqTWWHx5/5F?=
 =?us-ascii?Q?wNHmb4RHsZ1tX2/jhzJFimd2jUVP/Su55IfWCId6AY39oRhpkybuSWH9MlA4?=
 =?us-ascii?Q?LjhGYmPA3XKmhJfwcOBdIB8FQK46OlEXXbG+9/mPj1U6GIDEFA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s4wETEsomXGvPiHqhZ0XcrjaZQYTWEhvKopRQwoWueIGWLZOcc4vY7khOb/A?=
 =?us-ascii?Q?rXcpkHOTHg8yrP8ws1oQgfTqE7fR9EUOjZZ4dErUNxmn2s73QOljb0+VLHQK?=
 =?us-ascii?Q?C37gH/rgvsuIKX6cVMhSulhlaABANkxcrPk7RTndAyIb4nA96hWywhFwQwk+?=
 =?us-ascii?Q?HbCTSRYOMgA4Y3whU0hw3T9A880T+CFGZ01Dr4IunxyjGpyrDJA6IoOPFz2w?=
 =?us-ascii?Q?3Jflbv1ffT7W7ZY5P9hzXmNSiBO94fqut+E89vao7zmXfP+zh0ez45Yek591?=
 =?us-ascii?Q?dU5rI8WGFSCUNs+xTtx5wnPcQc5u8Zz581mxpREsNaaB7+VzKqB2M4w9eOZq?=
 =?us-ascii?Q?zYfQoB9fmv5iJ60rB2KmLOjvGBndyqmarktPV/M5L+fEXIgig5Rje2SzJBTC?=
 =?us-ascii?Q?UVV4mYPt89iONp0vj1XLxcEFOqxJnxHJXSz9Isxt2LkMilxJvTKJSg9YMiOy?=
 =?us-ascii?Q?E8eW1jaVDipZwqF7w5213m6Flc0I7LXAR6EqKLmesCfRVF3vbNLO1Rk7PpOX?=
 =?us-ascii?Q?+SdossRP3tjzdjXTtGHWcZg5yMq6tnzOQARyBRSE2FOkfnQaHoI0HPnUpwZh?=
 =?us-ascii?Q?JxpLXlaIgwR+Lj9dNPBI+A34HNlAeA7yvTADwJJW29lnurjzuh28dNwxo1d1?=
 =?us-ascii?Q?M4QqsHekf6nDYUp2XfdsY0yXTSS0WWRujMGXUPgfpSrpVrcTv49D1IXxwGEc?=
 =?us-ascii?Q?ODyNsohZwtgkM2cQr3eCxCHTsh+dttQiGZhNLzCJu2lA7vg5+mF+ok5OAOhz?=
 =?us-ascii?Q?Ugay19hes+pmZbRwfZjZ5pEtESlRVRZbPz1FFY00ECqlTFQQTCt6Rpak4+Bj?=
 =?us-ascii?Q?kZR3p1MkyavoRcKQbV/A0cpAPzhvcua+E99vqUjwDd1Xr3OxNqCWBVXZdSjw?=
 =?us-ascii?Q?2fhLirZ5fmiReph65j/vX0ypgwW4Y1jT8YrepGh6Z7eufCdlJx2pMf84MhBp?=
 =?us-ascii?Q?zGlH10WY0vnnRcVcheTq8D9WKrYHSdUula42qOvL3cEN/Wkz3VpXMU8OHAxk?=
 =?us-ascii?Q?8btj4fHiNoTDdJ3SUFksJ+5EVu5VZK1DEjmnPHWlThrTPbCAq5MFqlDCb+cZ?=
 =?us-ascii?Q?EW+xcVK/TdB5ox+qQuqHa0tLEot/U4vFrpclrXdCGkReU6FW5sd9TrGNQUDT?=
 =?us-ascii?Q?rdlyERttRqkFsxL2Dm+VGW05VHBAW3qRMJNQo39Jz/tFKhZhPwpG2nVxl49O?=
 =?us-ascii?Q?T7tiT/GtBm8x1iVyv+yeOGGcf7gKOua9GurcisGfTiFj+fi+XgXVpGxYJHRr?=
 =?us-ascii?Q?BxCUu7NEtkX6IdUdXLxJPM8s9CMrynZ7EFtU/dNeGdAp6HAxu8BfMyH6k1b5?=
 =?us-ascii?Q?/65yVcg7Ktk+YyMKdwXENqVqRXVfRjq4C1+pBhv9HgwFnb9mxd3dyPrcnVra?=
 =?us-ascii?Q?IhAr6qWgIyIgAb36WuoRZ1l5nPUg9ctDBDQJSlrLaBr58kKeI2vn3Gdfax7W?=
 =?us-ascii?Q?EEKwZIySQ3+4pYY+2CR3Wx5jCste/Hsa2Zvy3kgj0J00swLgzvaaqCcF2Pac?=
 =?us-ascii?Q?YV5wFuoT6mQ5XGYJgt/Itjjgw6fTOceG2AfngWry92khFdUl9niuSVAm1sWr?=
 =?us-ascii?Q?NaD5AtEYbXK0P1u2fUw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e5d1fb-5d99-40d4-d3d5-08dcbd93b9de
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 01:35:35.5853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Ns6TTSnvWhw9huFpjmsyB9M/3TgNP3tzs32enXzrlwDJMw7j3tBi78nafNsNCwMgzBrxODp+ubCPsI/HuCCmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8367
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

This patch look good for me,
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Friday, August 16, 2024 9:16 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhan=
g@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christi=
an <Christian.Koenig@amd.com>
Subject: [PATCH] tests/amd_queue_reset: Refactor ring sequence for job subm=
issions

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

This refactoring includes the following changes:
- For each declared error, submit the appropriate good job to ring 0
  and the bad job to ring 1 for COMPUTE IP.
- After a successful queue_reset on ring 1, submit a good job to ring 1
  to validate successful queue/pipe recovery, then submit a bad job to
  ring 2, and repeat the process.
- For cases with a single ring, such as GFX, submit a bad packet or
  shader to GFX. Simultaneously, submit good jobs to a different IP,
  like COMPUTE, from another background process.

These changes ensure a more structured and reliable approach to testing que=
ue resets and validating the recovery process using next step.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 95 +++++++++++++++++++++++++---------
 1 file changed, 70 insertions(+), 25 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.=
c index 6819892e0..d8dccda65 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -290,6 +290,7 @@ static void set_next_test_to_run(struct shmbuf *sh_mem,=
 unsigned int error,
        bool is_dispatch;

        is_dispatch_shader_test(error, error_str, &is_dispatch);
+
        get_ip_type(ip_good, ip_good_str);
        get_ip_type(ip_bad, ip_bad_str);

@@ -852,35 +853,74 @@ free_contexts(amdgpu_device_handle device, amdgpu_con=
text_handle *p_contexts,  }

 static bool
-get_next_rings(unsigned int ring_begin, struct drm_amdgpu_info_hw_ip info[=
],
-               unsigned int *good_job_ring, unsigned int *bad_job_ring,  u=
nsigned int order)
+adjust_begin_index(unsigned int *ring_begin, unsigned int
+available_good_rings)
 {
-       unsigned int ring_id;
+       unsigned int ring_id =3D *ring_begin;
+
+       if (!((1 << ring_id) & available_good_rings)) {
+               *ring_begin =3D 0;
+               return true;
+       }
+       return false;
+}
+
+static bool
+allow_same_ring_id(bool are_rings_of_differant_ip, unsigned int
+ring_id_bad, unsigned int ring_id_good) {
+       if (are_rings_of_differant_ip =3D=3D true)
+               return true;
+
+       return ring_id_bad !=3D ring_id_good;
+}
+
+static bool
+get_next_rings(unsigned int *ring_begin_good, unsigned int *ring_begin_bad=
,
+                       unsigned int available_good_rings, unsigned int ava=
ilable_bad_rings,
+                       bool are_rings_of_differant_ip, unsigned int *good_=
job_ring,
+                       unsigned int *bad_job_ring)
+{
+       unsigned int ring_id_good, ring_id_bad;
+
+       for (ring_id_good =3D *ring_begin_good; ring_id_good < 32; ring_id_=
good++) {
+               if ((1 << ring_id_good) & available_good_rings) {
+                       *good_job_ring =3D ring_id_good;
+
+                       for (ring_id_bad =3D *ring_begin_bad; ring_id_bad <=
 32; ring_id_bad++) {
+                               if ((1 << ring_id_bad) & available_bad_ring=
s &&
+                                       allow_same_ring_id(are_rings_of_dif=
ferant_ip, ring_id_bad, ring_id_good)) {
+                                       *bad_job_ring =3D ring_id_bad;
+
+                                       // Update the starting points for t=
he next call
+                                       *ring_begin_good =3D ring_id_good +=
 1;
+                                       *ring_begin_bad =3D ring_id_bad + 1=
;
+
+                                       if (adjust_begin_index(ring_begin_b=
ad, available_bad_rings))
+                                               *ring_begin_good +=3D 1;
+
+                                       adjust_begin_index(ring_begin_good,=
 available_good_rings);

-       /* Check good job ring is available. By default good job run on com=
pute ring */
-       for (ring_id =3D ring_begin; (1 << ring_id) & info[0].available_rin=
gs; ring_id++) {
-               if ((1 << *good_job_ring) & info[0].available_rings) {
-                       *good_job_ring =3D ring_id;
-                       /* check bad job ring is available */
-                       for (ring_id =3D ring_begin; (1 << ring_id) & info[=
order].available_rings; ring_id++) {
-                               /* if order is 0, bad job run on compute ri=
ng,
-                                * It should skip good ring and find next r=
ing to run bad job.
-                                */
-                               if (!order)
-                                       *bad_job_ring =3D *good_job_ring + =
1;
-                               else
-                                       *bad_job_ring =3D ring_id;
-                               if ((1 << *bad_job_ring) & info[order].avai=
lable_rings) {
                                        return true;
                                }
                        }

+                       // Reset ring_begin_bad for the next good ring
+                       *ring_begin_bad =3D 0;
                }
        }

        return false;
 }

+static void
+reset_rings_numbers(unsigned int *ring_id_good, unsigned int *ring_id_bad,
+                                               unsigned int *ring_id_job_g=
ood, unsigned int *ring_id_job_bad) {
+       *ring_id_good =3D 0;
+       *ring_id_bad =3D 0;
+       *ring_id_job_good =3D 0;
+       *ring_id_job_bad =3D 0;
+}
+
 igt_main
 {
        char cmdline[2048];
@@ -901,8 +941,10 @@ igt_main

        int r;
        bool arr_cap[AMD_IP_MAX] =3D {0};
-       unsigned int ring_id_good =3D 0;
-       unsigned int ring_id_bad =3D 1;
+       unsigned int ring_id_good;
+       unsigned int ring_id_bad;
+       unsigned int ring_id_job_good;
+       unsigned int ring_id_job_bad;

        enum amd_ip_block_type ip_tests[2] =3D {AMD_IP_COMPUTE/*keep first*=
/, AMD_IP_GFX};
        enum amd_ip_block_type ip_background =3D AMD_IP_COMPUTE; @@ -926,7 =
+968,7 @@ igt_main
                        //      "Stressful-and-multiple-cs-of-bad and good =
reg-operations-using-multiple-processes"},
                        {BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, "BACKEN=
D_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
                                "Stressful-and-multiple-cs-of-bad and good =
shader-operations-using-multiple-processes"},
-                       //TODO  KGQ cannot revocer by queue reset, it maybe=
 need a fw bugfix on naiv31
+                       //TODO  KGQ cannot recover by queue reset, it maybe=
 need a fw bugfix
+on naiv31
                        //{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BA=
CKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
                        //      "Stressful-and-multiple-cs-of-bad and good =
shader-operations-using-multiple-processes"},
                        {BACKEND_SE_GC_SHADER_INVALID_USER_DATA, "BACKEND_S=
E_GC_SHADER_INVALID_USER_DATA",
@@ -996,12 +1038,15 @@ igt_main
        }

        for (int i =3D 0; i < ARRAY_SIZE(ip_tests); i++) {
+               reset_rings_numbers(&ring_id_good, &ring_id_bad, &ring_id_j=
ob_good,
+&ring_id_job_bad);
                for (struct dynamic_test *it =3D &arr_err[0]; it->name; it+=
+) {
-                       igt_describe("Stressful-and-multiple-cs-of-bad and =
good length-operations-using-multiple-processes");
-                       igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests=
[i] =3D=3D AMD_IP_COMPUTE ? "COMPUTE":"GRAFIX", it->name) {
-                               if (arr_cap[ip_tests[i]] && get_next_rings(=
ring_id_good, info, &ring_id_good, &ring_id_bad, i)) {
-                                       igt_dynamic_f("amdgpu-%s-ring-good-=
%d-bad-%d-%s", it->name,ring_id_good, ring_id_bad, ip_tests[i] =3D=3D AMD_I=
P_COMPUTE ? "COMPUTE":"GRAFIX")
-                                       set_next_test_to_run(sh_mem, it->te=
st, ip_background, ip_tests[i], ring_id_good, ring_id_bad);
+                       igt_describe("Stressful-and-multiple-cs-of-bad-and-=
good-length-operations-using-multiple-processes");
+                       igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests=
[i] =3D=3D AMD_IP_COMPUTE ? "COMPUTE":"GFX", it->name) {
+                               if (arr_cap[ip_tests[i]] && get_next_rings(=
&ring_id_good, &ring_id_bad, info[0].available_rings,
+                                               info[i].available_rings, ip=
_background !=3D ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
+                                       igt_dynamic_f("amdgpu-%s-ring-good-=
%d-bad-%d-%s", it->name, ring_id_job_good, ring_id_job_bad,
+                                                       ip_tests[i] =3D=3D =
AMD_IP_COMPUTE ? "COMPUTE":"GFX")
+                                       set_next_test_to_run(sh_mem, it->te=
st, ip_background, ip_tests[i],
+ring_id_job_good, ring_id_job_bad);
                                }
                        }
                }
--
2.25.1

