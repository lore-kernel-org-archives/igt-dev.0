Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B139C3DA7F
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 10:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F73910E8F3;
	Thu,  1 Aug 2024 10:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rU3ZWUT8";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CABE10E8F3
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 10:33:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbuYEZOJ616hyjjps3jtc8tv/BEb9mm3PXgnIqfFdVtZ9TOypcvyyyjjZoYbSxVJMhtRpHwLpW9sYqfcwjWW6k+q7iw9JqLNpvnDousyDKIUXwsIlAsngFktfJmDuTAoONp0Op33VIK5oQe5vlzJWhfKm50fEqYlMNM9w4DAYHZ8jx8Yxe4iN3xI+YlwA1lEx9lSSa13Ig01t0sYpvtKSE2WBIj8X/mTh5B95gmESiTOYVjR4ZfvmuUbZKnVT0zCnmwu7PbQq1/gmy8Zy9NjZS4IuomvGiLjG/dLtxzZ95yLy81+lDwy1Xf/9xgOLtYBsWChmYQOJpXEJzE8OdpWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRgE9FUrgRPgP2A3caRLSJI7Po5qc4jYp3m5i/cXopU=;
 b=sFeiMUDaI0+IqegZH2FMgdEucfu/JFd6+T2jF/TG3/EinfdZPYEFwACDdO9AAONnATulrAbAIqOqUijsMB4GzackMwrLKrSAzQ4+i7D7iETVS/mki5nTOrTUGVxDrLBELjcmNXIHLspKlQeARW8LxPD2vJQPGpghH/Sd6+5bTqTFER2NecGakSv81FKqShm4XAVUxTbQ/1gjhiM5ORMaZnn5GalqSMOELnW580mvTtSWkEk+a3Tpy7InLYMgjjrYpJAIB55Al/uaWDgpjD5BytMLMF/eKb6pmQtsH+r9xCbjsPqGyGLC6uqR+ANz7bAcvmVBcwIe5kLuJa9UBDeWPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRgE9FUrgRPgP2A3caRLSJI7Po5qc4jYp3m5i/cXopU=;
 b=rU3ZWUT8kWJw+dnN4zMGZDcfDOgMNG+6JxpOR8frF6lZvLqpNqXmlMgiay9+K2eAkh7YPYlaygH2dvGLCAKtkmI/R6wDyKbW2dYMoLYCx31iw7g7fwMnTfPwu1nQPoB43PFuELgRqjzfTUZDsxJTrNQglVC/cUnlS5eeWJIJrhQ=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by MW4PR12MB6900.namprd12.prod.outlook.com (2603:10b6:303:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 10:33:42 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%3]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 10:33:42 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] tests/amdgpu: update bad length case
Thread-Topic: [PATCH] tests/amdgpu: update bad length case
Thread-Index: AQHa4/kAPg+OoEFJtkOQxuTvauBpeLISMyvw
Date: Thu, 1 Aug 2024 10:33:41 +0000
Message-ID: <DM4PR12MB5152BA72346DF61660AE5ED8E3B22@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240801095540.2517506-1-Prike.Liang@amd.com>
In-Reply-To: <20240801095540.2517506-1-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=14d1a874-49a0-4963-86de-d59aa22f4446;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-01T10:28:31Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|MW4PR12MB6900:EE_
x-ms-office365-filtering-correlation-id: 404a7b0b-d284-4ae3-fcc8-08dcb21569de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?m1zxPLnotCn3Ezi9GtXgscmMiHOzKKkC9GmX0Q2yJ1C8XuBKdLSKQzAIbF4n?=
 =?us-ascii?Q?hj3TpYXeySsRu5+Ulg/lv+/83JPOHYeb9xeYTW1Y6uSFgWZ36ieI8/gaaZnU?=
 =?us-ascii?Q?U2d4o+u5x5lU3F7ii8zmDmVa/6Ps9fNVd4EOQD7MLBl7AerpNQUk2MGUqocs?=
 =?us-ascii?Q?rmEcL+ToUAhHYK9P/l8eGuBGA73I6TJTapmhtPEIDNfNBIBsio70klfKLwHr?=
 =?us-ascii?Q?alNO5xHq9Ttg3Pcdk5O/VbTp4a8MHz1KdWmZwmsV1fuL2IXvW2URSg8XB019?=
 =?us-ascii?Q?YPRYVYhNJLshtbaY0I8hmjTtbWumML+yX1hXec0tyetnG+aztdeTIBpW5kYI?=
 =?us-ascii?Q?R095Ri0Scp5wdzWwNV69q5fUW3fU6QgSovgPeh/MmIS7xIcAe2UjgL4pYWJ+?=
 =?us-ascii?Q?pQD2oCXX2Fczbim8eJCD3UPDuuMllXdZpgJiUBZscuzW8qskrPBSlwDxoD8l?=
 =?us-ascii?Q?81Y2tcVF7wja/nvIFAXUZ9nDYm0jO09a0BNylkAdmBB/z8Puq3crp1WCldGU?=
 =?us-ascii?Q?+tsZ9ihz08FbNCBSvP/Ln0e1H8+L/89wGnebkBo8HM198tun7qqAbpECVJnT?=
 =?us-ascii?Q?rPro9j2/pNWktlFD7X1aEtTyvRMU6GGscmMlDVWsHAJkiyRszx6zY+s7IdmI?=
 =?us-ascii?Q?oEGAyffiDmP9nXhuSjrJR+W4g4+7rA5lktr1cYDVu5F3w4g0ddv08bw9hkEA?=
 =?us-ascii?Q?nuE2M4lIltS0CLH5nX+BM3wJfNwYfTjcXGxfChx8u/bibr2ody2Sr5HSM9qN?=
 =?us-ascii?Q?3/WronvM7D5BrOxMrFG4VWDZ3MLc33Ixwwu9uw9g2+Y+c7hulk9//8gSPBcG?=
 =?us-ascii?Q?5DyMlRuqf+XLjQdRN1H8JCN1N9GcXIia9EQvBWpJ4yvaT8/jaYTGMahWnLPU?=
 =?us-ascii?Q?ToBOzaFR3QR9ol6qlaof29sVcGZMAWON46RANAZZRadjBxbjuYtUsUMbPPXV?=
 =?us-ascii?Q?srtQ+bel/EDqpehl2lvq/YFvbFQv1Sv7M8SHGQ0CTZD00wsIDe+kpkPzpA0W?=
 =?us-ascii?Q?jXLz082yZK89Bus3bSMgz6k1fvD0dG2khkL9PLXM2FenhtEm+7zhxBTpusIt?=
 =?us-ascii?Q?wiADK4g9TGMbr+Wg3R4ZJnYQe/PSVFK6YyrgGIMZ68DL9LBF6RFpFWR7WL8W?=
 =?us-ascii?Q?BxsYKHTwDQ0FkNMzkaSl7EC/Wud6mS0Nh0B3LujQlvdivsvH8jlWnL6KO4XK?=
 =?us-ascii?Q?TKzs8LKT6XAixvKw9cTfaJ8jpYKXEj7VD/NArhLNe7rhAKdf5QqjB8W3hDv9?=
 =?us-ascii?Q?7McfOajuHK0QI4qTgpgxYmuDS8m8tq3XBDAeiobHaIEPOHUTHFvSbKmGVcIq?=
 =?us-ascii?Q?olC5/4TRGSUl2LW2RgvnEywZxbAlLJKw1+WKuwbi7DQ+S79q2o9OItzBWxM+?=
 =?us-ascii?Q?sqYVRLr5HEKDJngioWifhAUtp/KKhHTLUo6KCxCGOR5Uref9Bg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ji8UlZXUYoQrRxqsXFkNk3CIUJ9fPUJn4wql87Pf9BuS/MwmsAucu8bgXlVZ?=
 =?us-ascii?Q?Q6wwSjyLML0lQUpqw0EFXqehiIzFewRpya52BCDbeCXE8vTKDjzyhaJ16PZd?=
 =?us-ascii?Q?nN8Sio+jt+cAAY4QRMoN3ENkkqOzq6LROnAsltMEByyI5jU5l+2lD7aAnGvT?=
 =?us-ascii?Q?sRHjddc5z1/iEqCsl6vKbQSBet8N5BevkT9rk7GjXG2WZzzF6JUjdbULnFAM?=
 =?us-ascii?Q?b/vQgyuctTTfi6z5m35w3bplXtPLj+gkEHR534ssR+JcdMgGNsSCFYVfIS5Q?=
 =?us-ascii?Q?RzM6f+qlpRZFNS1XTyv3xRo3dp5P9tBeoO8ZKpdg0/gyMXZAYO+zDratyx98?=
 =?us-ascii?Q?gH/0XwIm70uAD6pHSKgiCXbcyFBe7UGvv/u5QrTn8t7Jywzg16UrOeJe2Z5X?=
 =?us-ascii?Q?nDi8gbhMGj2jczeR0EGXtMlOHMY94TGsh/cM2mXdElxsm9T1/I6R2GSIT84F?=
 =?us-ascii?Q?eR18khizynGfvs9leOy0tpgx7jNjhOEEQw82VL4E9QDNsmhbb8J6SPoYlKlv?=
 =?us-ascii?Q?PvjpTFsvdsqDoDkQNR0Gn9vLDN0A9wJdcSClRfSRprdvjBiW6J0elXMZ9Xk3?=
 =?us-ascii?Q?1ImFFIUK3gDBeq+jGToYSydzzheJtp7214Y4uLxWySWGph12eiIrWfSnmECA?=
 =?us-ascii?Q?18JSuBJoZtFYqO+lWv0ewj0bh3RAD7CGtM2lDWpUViebr0PP84GuuVqn9ZnZ?=
 =?us-ascii?Q?vG6YzkS/bNUXUtf2F++1ixFeF/CIZ1kBLXJbmSuxZYBq6eb1ZHevlhTSM/YU?=
 =?us-ascii?Q?vQSdyE3l16Ruu8OagFYzy0Vt4fVM93a0nh7sL1FaM4qABm7j9QaBmY5ANixb?=
 =?us-ascii?Q?zUZbohTSnHXMu1ijGMyhkozlF9OQsHF2DjsJYMQZmYb8dxcJrTmBSmkPeUF9?=
 =?us-ascii?Q?a2DzJ5pXk5KGuWSSabp9Fgh4SRYfJpsjDOwRaSwuSwfA9cjLhakTTcx2crpR?=
 =?us-ascii?Q?H7AMHNx30S1HU///nRTQ+uls0e2w5T/LR38jVACqq72mFuXHvlDGvtKTD0rU?=
 =?us-ascii?Q?vhUWjDg2+H+Vo8qdUCuy16oiQL5aJWnbBnnVgKKoCmzcV5ODC9Hw42YDF7Ty?=
 =?us-ascii?Q?IA9Babwgo2s/FDdNzPrjFk6bVNBrciWTJlVUtEsjFMty6aPXeSSHe7GAfqUo?=
 =?us-ascii?Q?NqhPTmH+6i5ekgEb5T+e3vxni/jysIWM/BNFhU3fP1Lb1hurqak1bp6U6EtT?=
 =?us-ascii?Q?eNnihfyyFTzgngV7+qaIhumouxtvwSLx4KDALfBURFY1HpD5gjZOPRe60xu7?=
 =?us-ascii?Q?fF67uIAq0x3in/xbxFe5UxApQTvorbv6Y8dYXuklwZM0WwD/3JD00tRBxqUH?=
 =?us-ascii?Q?CSfVowNZ1Z8K/XH115p1ysmMXgo7LwM0LN3BTxwWUtiRBTsCaNElgTXA5WSy?=
 =?us-ascii?Q?tJJoCF9ZeY7LP1rNIDwEnICCYqJ9y396zlAiLQtCVx7D/StdKKE1zWhv0bot?=
 =?us-ascii?Q?CARkbTY1ujnqThYXT3hr/O8pXMDTN9Y+7nSv+ZhKqeUlIC9fsem//Mt44hg0?=
 =?us-ascii?Q?h4DL2QlL/5s+NchXAo9voAVpvDCIZvWkW9hoeRN2bSy8aTHFDpJOrfY3FSjC?=
 =?us-ascii?Q?idJ5NPiP+LLhTq6bK3M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404a7b0b-d284-4ae3-fcc8-08dcb21569de
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 10:33:41.9689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 71jVqU353qEA4IE8v9xkhL/StSG7uajnDCmUTFk0VXP/78m/UFqei/uCiVbGReNb4HwoY/o4MJEFSzbl4U131g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6900
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
