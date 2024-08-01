Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CC9C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 10:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC5310E8FC;
	Thu,  1 Aug 2024 10:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qVPb1CGd";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8374F10E8FC
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 10:47:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfy+NRLAwlXt7vkY/UTE8NjBCYgrOCvvGNwTjmkwxKgdHp/Z+6UAurjxodroU178NBzQViDcrmdcLDIan1QfzkwPN9AuK8pPanEykHFNoyuQ+0f/fH3U5ciVq1CmON8QUs9y0jb1MOE3Lsi7Q0CXEovj1n7UCgFPKdgai7NBwtindH/UBkVkV24D60C0Pd7Hk3jcGVdBLCXZWqjxP6vNlms0akzgZgW8JdVT19sp5RhdqoI8/UPeFhcHP002XRMHboYwG/mACVUwqz9BKQap19vqA1iOrZVuN1C4l4ISJYO7bbEdnyMGxx7QY8Kv+YWXgdoYf+VdeGcD/ZhIMD9MUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRgE9FUrgRPgP2A3caRLSJI7Po5qc4jYp3m5i/cXopU=;
 b=bWEZSI5tkpBt3C5fMp3esRkpoS5LWgs2Y8diyNLnyRctd5s80q++gfbooi7ta0ar4jQCnLcpYfAUwTdIPI4b+NecrKjxwGTjJlXzCcZmXwJf0zvP7N5uCp4zNKm8npXF93O5k+cv9ywGWX/HWY2DKjinC28Q+2FbXs9dg9anwA24ddI0YGw+xu4n18WRdMgrrtAK3ev486Z31cKD/7JoWfFDBUS66VkyVoIRCWN/HORyzZk2Qa/ONMHrx0mo9CMBC8C3+SMw8tImIBTowLO5i4nRy3jkIPfkr0/ERXaycnXVZjQx9MiTbTA88Xu8+QYrmOrKFWXQVj5bU1l98ngcnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRgE9FUrgRPgP2A3caRLSJI7Po5qc4jYp3m5i/cXopU=;
 b=qVPb1CGd0fPlNddjF2jAp2zpk+wAGZ+EOKfucbUuMLMMul8hAQDIhZ9qB2ydyK+pn7kXg2Y4Wj8obyG2sp46dEAuCQKcbcTk4WrFFG/NQ4e7f0i/l3L0YfJbjDZFXzA/V8JT8YjiCAWZ9kRNsH+wjte4MGOJLRLQBTPe4RU+ocs=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by MW6PR12MB8836.namprd12.prod.outlook.com (2603:10b6:303:241::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 10:47:31 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%3]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 10:47:31 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] tests/amdgpu: update bad length case
Thread-Topic: [PATCH] tests/amdgpu: update bad length case
Thread-Index: AQHa4/kAPg+OoEFJtkOQxuTvauBpeLISN7nw
Date: Thu, 1 Aug 2024 10:47:31 +0000
Message-ID: <DM4PR12MB5152008F7FAE1F7F8D1A4774E3B22@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240801095540.2517506-1-Prike.Liang@amd.com>
In-Reply-To: <20240801095540.2517506-1-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=8dff7b47-bcb3-45e0-9e04-fb64d951e7a0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-01T10:44:50Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|MW6PR12MB8836:EE_
x-ms-office365-filtering-correlation-id: 0421af4a-452a-4af0-139d-08dcb217583e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?PX/7hO6If7HFO5Wm0W248LCUsUnFK0d750q/lizxxWA7IUMxbFJWSLMrB2QF?=
 =?us-ascii?Q?x396bysT8V0U6o1X/T3qdwgGH7RkNoaC3TnBEa+HJocDvNlPCPalnUMJRq6T?=
 =?us-ascii?Q?cTFpxZdvzzBSuNid/ZkQq27Mm7b7/TVEFMKLxpRGYa21KQc84bBjsDTwdW6T?=
 =?us-ascii?Q?lKqBtVxhD9RTvurguje3gJ0y7eUoamW8bjWIlZPwbAXdXUZ9LhxLVN2EOoOM?=
 =?us-ascii?Q?BIOM4scXl5CQpNCGH6YHD8lCMEeLNegYJcNx247Ypz+4GZo2jgG68pN6LmzN?=
 =?us-ascii?Q?aiKPN4XP94PRxpWVNlPBNkcuEizjzoZHilgB3gfFA7TYKNGiQQeP3yuYWhJ7?=
 =?us-ascii?Q?C07WRgRUNGxGceqOKSbakZ1wvUSHuoscQbniG1Rx6rRdrbr3i7yK8AKPeMoU?=
 =?us-ascii?Q?GVQfewvryTSD0f5B+iIWhd8pQKxNaFa7dTJUjNPTCp+i5nxWlATG7AZByxkY?=
 =?us-ascii?Q?x9qLa/L/5kj2f47xYVHOlvKQfg/Drjqj5HInr2D7m+pKHcPaGpnpMvRCJ+K9?=
 =?us-ascii?Q?H2KIHG0IXmo3BVrmCYBwDXvJAMJCkjNX9dUa/yv2pR1ZGMdkPF0BZP2qTPoT?=
 =?us-ascii?Q?UmbHxGkgZj0J68kkWheR8sz87/oJTrR0+6+80KFRKoUAGMpc5pdxSt5EqVVL?=
 =?us-ascii?Q?b+0BIgqPX/votojqFA5AA59FBfR/JKQ73YF+qIciJYokytay4Eg+uUmzBXDt?=
 =?us-ascii?Q?77yfhkLxHUEf/GwVHZdu/Wb1XPRZO6s+rk0NIW6g6vtxqONnsrE6j3SwFDW2?=
 =?us-ascii?Q?wM86Y/B0SipQ9uEd1WeIVGxnxrFEYyOisAZm+ZhPE/55KG6xVxRStSnxdQ40?=
 =?us-ascii?Q?3xcUWfm2ZiG55AwwGAr66hZiCLyHyD4k7JvJu3BypEz5d7fS3LldIW8Fuyrk?=
 =?us-ascii?Q?kbpa+tCrmA6IqbJ5UnrbuFTJiUZjywDHMSEJze0S1TQhgt8nBNrCDbFqoCZ6?=
 =?us-ascii?Q?B/tvmgvgOTt4e2hCVkfM0u4gHQPwI6M66WVsGLn+04hPFJNlfe052F0S01rh?=
 =?us-ascii?Q?riduP1o+LFdrCcfXHuFybM7rdn9GIkwObYqzZ6k5UJwDWKscBrwWl7VX/7WA?=
 =?us-ascii?Q?orSxLnlWOe8Tvvjf6yMx9lWQz0dbYOzvQ0mpF05GRjVNb4MOxLPSeZA5rGCd?=
 =?us-ascii?Q?keGg8A64arxnQTSbCMwYQvXQARd6oiDv/5O1iPFpJdD7nYQ13yi/XfVuairZ?=
 =?us-ascii?Q?lAyf5L8zgNr2AA3HVZbc1sfz3VZ4AEZq6SxVNDycCdf6I9U6OG4yV0P8sQ6T?=
 =?us-ascii?Q?AbZNWEaINbI37v4DQsEEp9z6iQhUDIjYQnXkWLVXcqQGKqwWEbcME57iZyCi?=
 =?us-ascii?Q?YL+4upWhtFaNd+27YTsEriqFg39pt97xdHq0s+h+V7FHShVvYt4k1LOayc1l?=
 =?us-ascii?Q?oMFUu72C923C5ijmNhCk268VYhqUKkXcBXlk9XKMB4u7+Qs6mg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7hshSF9o2m+3XgXVOcN8VGI9zkHdmfJYA8g7paDEuvCR+lBtSkiIWyB+c9sR?=
 =?us-ascii?Q?RRc8/3V1xkfyp4+wyTWjHYOxeiug7muyWFuzxc1t5iaHcogE7w+qasOH+PUY?=
 =?us-ascii?Q?tePlS2V9w9jXnMiGMVOZz2SA/eXLTtbTkYP96TKs2jvhbf/qxeXu9I1Cs0lV?=
 =?us-ascii?Q?PaxKpYJmZh2Yx3WbnGEDlamXl+pzMT1zj4a7TQUa/i2oX3D8iVEZgDlmsbzw?=
 =?us-ascii?Q?8i6DEd4khGlQnTo75Pl0ayiVUt8695aIC1Y1r/TFSZ/lsJWrspv48Nd+YnMo?=
 =?us-ascii?Q?2ZFGA4vOXJyizDDC6QRBguTyoiiW+NHZxsmyQZwQdvUj+4Ok9f5nlXoQT2Lo?=
 =?us-ascii?Q?QhVFhEwoNadmwyhsmFbRWwFBZDXgdFnBJPqXtUISVrybDDQE3E5LIVM1O/LB?=
 =?us-ascii?Q?Nr7Nr/k+6j91LyDTYUprLzNyx+8n/CWTWBtAQXM8kxLXigcwZhyyQE5ePq/y?=
 =?us-ascii?Q?AEWShsikhdMoKqRgy2nl06cx7+V2tVB8zt5T7kNieqkebwzCV33Ttu5Dl3Mz?=
 =?us-ascii?Q?falzy6bCZo7ZIzvibSndELEyqQ1tkTIaf2SWZxDNf5JvUwYkg1ETl7PsqmKv?=
 =?us-ascii?Q?FZWvSB2gqkWHx1cT/IND6KFYA00WnCYDI5lRfx6PqjzNltZLrKDa14DHekxA?=
 =?us-ascii?Q?8U58sFatyhT5kQFfJxu/TWvqThtb+XlrNBdDgJhAAeFAYbUKYYV/j3IRiSNQ?=
 =?us-ascii?Q?1o2CdXJf20ArbFFp5rLv+7oNpUQh11ZUKtGaDKcC7r/8acldi7OXqj8Nv+T9?=
 =?us-ascii?Q?pewPhhNe4vU9X1rYfqgw3HFdDn8LwV3v8i/EJjGYS/wjWQr9GRd6rRy6PD9m?=
 =?us-ascii?Q?i49WhkgzplKXwWIK9wI59zSHyEe+RHSaSURbMSm/UxaeS7bkIfFZ2JeWsUhc?=
 =?us-ascii?Q?Z2DJYzxVwU/tPdRRddXf+cnzFDIbP7lvYCk0dzj0JrRk5sH6vcqdhB7VR/HZ?=
 =?us-ascii?Q?3sP/pSCem1D1SEy5OEwBd7MU6ZijYiJDX8LlLh1M1U87yStyUJhPOTOFyfBY?=
 =?us-ascii?Q?QNk8qinUJgpGvcl1Wt0wSsNKxB6s/srlunKtRaNrC1bJXpaYzbUyAvpkzo1f?=
 =?us-ascii?Q?apEHTyBQS8PjtroFMcn/Ug78xA6U7bil+ofI8YyPAmVauXiAbHnqtQ0hTl7j?=
 =?us-ascii?Q?mCuPj/rLPZvA28ZhsVkFant34TXtqCzi4sEGpLrA0JJ1jn773a1uhTl7/6fD?=
 =?us-ascii?Q?Apx63wMx+Ce1RkhWT0MvDCMYb8n4KHBkMNZGCN/zMf1NxFpKIIhXxGvCUjMA?=
 =?us-ascii?Q?of93YxkQvIfnasJUd6zeu0xP+DXg6S3l2AxPlnVJUbjmnhSAoDW8grNuIjJZ?=
 =?us-ascii?Q?6Frd+uOQPY/DnPDc6HRmZIxUdWhyGwyVqghvGuJnaNFDfLuuUL0842/cHCdp?=
 =?us-ascii?Q?TI10uKQN6Y6lz1jtNTqsHp2jV+ULC3IG2qOm6Nqm2IzL2XkQgCs2i9ZBUksJ?=
 =?us-ascii?Q?vB9hvHSiMsUh458ZrlGmcvgo0V661w0/yzKNL71mYcSjaSUsCkQAzSwJH25q?=
 =?us-ascii?Q?K5H1WZo6FIVJYlP0tiCkXkKPyvKy+yZ5c+v2PkfenI1PhbfEPIWcv1P0FCKt?=
 =?us-ascii?Q?yRJsnNEEl9YmCu29fFI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0421af4a-452a-4af0-139d-08dcb217583e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 10:47:31.3986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6H4mJ7PVJDCoIDNMPGlh8Z2zJS4kCzJ5X9qlN3x2Dc+U5Yzln6SiRWrFLlgkUST1CpcVyC9+GNfntPUzDwIWBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8836
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

Hi Prike,

-----Original Message-----
From: Liang, Prike <Prike.Liang@amd.com>
Sent: Thursday, August 1, 2024 5:56 PM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhan=
g@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Liang, Prike <P=
rike.Liang@amd.com>
Subject: [PATCH] tests/amdgpu: update bad length case

In the bad length case, when the header length has more than 4dwords than p=
acket stream length then CPFW will pending on the stream data and raise a C=
P halt error which requires do the pipe reset. As to the orignal case of he=
ader length is smaller than PM4 stream length then the PM4 stream data may =
will create a bad opcode error which only requires the queue reset. So for =
testing the pipe reset need to update the header length bigger than the PM4=
 stream data length.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c index =
f675b97dd..503b68431 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -189,7 +189,7 @@ gfx_ring_bad_write_linear(const struct amdgpu_ip_funcs =
*func,
                      const struct amdgpu_ring_context *ring_context,
                      uint32_t *pm4_dw, unsigned int cmd_error)  {
-       uint32_t i, j;
+       uint32_t i, j, stream_length;

        i =3D 0;
        j =3D 0;
@@ -198,6 +198,11 @@ gfx_ring_bad_write_linear(const struct amdgpu_ip_funcs=
 *func,
          * But the range applies to all asics.
          * 0xcb-0xcf, 0xd2-0xef, 0xf1-0xfb
          */
+       if (cmd_error =3D=3D CMD_STREAM_EXEC_INVALID_OPCODE)
[Zhang, Jesse(Jie)
