Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF9AC369AB
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 08:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B860910E24C;
	Mon, 21 Apr 2025 08:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EVSXpki4";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF0610E24C
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Apr 2025 08:26:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qcew5RVxKsadr1HaLnjcPA4pcUduAvM/nxGkqBuSpJn9pkTv8G4kscTGSV+WryemW+LVefaAAg1vsOn+B/dL3n7onCLq+l8RPOEdRmdT8oqEgrMPVsQbSd3Wo/3MFrIA1xzS3yyydNwTqdCpfHLo1azJLeWbZbFbr2ZGb0gTjgtV280UTzUPs/3UcVa5y6poLXCy5MY+UXzGzJcifvdCwyw8EQys9+ATAWO/2KUq6DQ0SS/qDBhRTK6Tz2ZE8wsflGYyB1Isqwmz8nvS1JjZL03EmierJYEoRPn7hW9SCnruQQjNVE5L9UDAPQSGpTFvjlYSA3xNlvCPWeyed7guEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZ5xK/OjmoIeUQlgEPyTJXixC2Owpz5klR0fl9Phyrs=;
 b=uor/PsTqijr2geOuFemjS1yAyooLYyrRbz9Sh45erqr+o8j0TW/jmTQzaDoSq6DspMllq3n7bNfbOBFLno7+oKKDn4tpj/eTKBdWFMMCw+gXMZUrxEzt7bisW5hwZHiU7v7S8nLFwB8G9WvwtxrIRy9J6vr5Layu1Tw67AvjumNrEPLFLYN9evudaMYWBuqegNqos0ky8d4Os5/3w446qHqFRoul4iUTpUa4Td2LcUdNiOCkTOzwU9bHxC694TQmSiFoukvDA6tmLAb0LeadqHQuRDYZOkgebrHKb720sUvaGC3/OiTQZHsbQLkfyYDBPyKU6uKxgM99AJnBwVqxTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZ5xK/OjmoIeUQlgEPyTJXixC2Owpz5klR0fl9Phyrs=;
 b=EVSXpki4D925V0663Waa2XEjZh/cMWXV71Ph4EQeaYCEWv41tR51RjZAgaPL0U1LBh0cbD7+sVIdQ1Ne0RJNlaEAfyVT0iE/HqmvEARKswiNTcXljCBv5iS+qraZWuMsYdTTd85r7oBW8vlgPwWRdvJ8vSf27SuORd/vcD9pKis=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by SN7PR12MB7252.namprd12.prod.outlook.com (2603:10b6:806:2ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Mon, 21 Apr
 2025 08:26:56 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 08:26:56 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
Subject: RE: [PATCH] tests/amdgpu: add missing user queue destroy for cs_nops
Thread-Topic: [PATCH] tests/amdgpu: add missing user queue destroy for cs_nops
Thread-Index: AQHbspNSSvSVW1GchUqFN/q/PtFkRbOtxLQQgAAEWgA=
Date: Mon, 21 Apr 2025 08:26:55 +0000
Message-ID: <DM4PR12MB51522DADB8F6234870396EAEE3B82@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20250421075926.31094-1-sunil.khatri@amd.com>
 <BL1PR12MB5753986669F58748F26CE3F993B82@BL1PR12MB5753.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5753986669F58748F26CE3F993B82@BL1PR12MB5753.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=d33f4ac2-b584-47d7-84a8-75a195bdee33;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-21T08:11:04Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|SN7PR12MB7252:EE_
x-ms-office365-filtering-correlation-id: 7efa82a7-c355-4006-15b3-08dd80ae46fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?8FVV4UXxYoqdcwMpyjPd1OrNbNPZv8QsI7e2V1M8dypwSwzYoXvzOrfegbtz?=
 =?us-ascii?Q?mhJDvOBFK5fMAoxPceSKccgO+kYEupnQr3QzD+CSLKppuONr3lckAt8obEj9?=
 =?us-ascii?Q?WO55q+UiHz21QmM/GtlZJvcQiTDHcfTxpUktGV1yWCqxa1/v2RuTNVTxGd4/?=
 =?us-ascii?Q?dr5dRA/iGy8wnUT+l4Ic2/peH1DUUonLmJgfzgjCGwrnmO9ySQ53YBIKCw9G?=
 =?us-ascii?Q?K8CYLZkt9yX0e9rjNoDHvyhz+0RleEwOdeGMjZ/aWtMA+chBhOczwRBvjmko?=
 =?us-ascii?Q?L41HJvn6NlYrwM4llCyjb+74nk9z6R7eRZu4Oto031HIPX/0NXAzecYFYuyr?=
 =?us-ascii?Q?cnVVN1galQXEVGmU+47QryGtLNL0rOoFPQaBWgsUo0wS+5w69At7D8lqn3g6?=
 =?us-ascii?Q?vjqysA7iounIjfOT5nZXNC2/Oqhf7jf2roNYk66dPqikM6nb4tUoP5kI5QI4?=
 =?us-ascii?Q?Fhp0TC4Q1NQltVI5UxLp7c8BWDao7Kdb8fDsxiOYg6nWqIOORkS25qPNIEza?=
 =?us-ascii?Q?ZD5nOGSiZVcLGNySo6KWrN4s6IS9+DjobSmIxgIvmXksGaH7NvsHN98lEQQ3?=
 =?us-ascii?Q?hVLJ8fM6cIY0N4r2pOWsS2fnK4AXniiou5EDwva51+A84tM9UVaZYRpOCHXd?=
 =?us-ascii?Q?g1OGS+w2wOzl0y+CVxBVtHiferZ8NZRn79B+KGeDD8oQLLw3IASFHYr2dqHv?=
 =?us-ascii?Q?fpBbeDWMp7Pt0uijQrsBPYyKlpieFk8li0MYgQVa/tDWWOYPolY5WPWsTpsy?=
 =?us-ascii?Q?Ajyy6hi35SowDqJzHtwAQRHcjfDME172hBVFAjHpLpLsMpStyCsx6X8zf+AO?=
 =?us-ascii?Q?zX3n2B9oCnSPGrC5Jhu2XwfvbTGdnfu71qY2pL+0tabulKE0AlCspxTbY5tQ?=
 =?us-ascii?Q?yv3oq/KVCuHgEv2jKO9bfor0V56K2ZnrpXaRfUVq3/ixBFtWQcpM9SRzJUiX?=
 =?us-ascii?Q?SlxXOX+yrGt6wERtXIqJs6DG/NNsSVJv2MOiFTrmp5WKPt1gJJOjYtzIjPF9?=
 =?us-ascii?Q?3KwAn4pTVdd6MNqqVnRTWXvd91SYv7y5XJF38jHheXhbH6zkvSXvLoQsWULb?=
 =?us-ascii?Q?jwcual+fBLdHzmO8+gvEwzhEdWiXTW+YQj217g/oRzf3X5lhBdm0W+yTyxdK?=
 =?us-ascii?Q?kWX9oT4TsbIKJXxI1qlriQOCGIeVYR8aAY9EFRmvXceihh2qUvbXSaeqQHdS?=
 =?us-ascii?Q?c/T09a+kMacoz4bsRsSCLDEKUnqj8bsmKOsto/zRSqM2vl2S7q/QYrwDq6vs?=
 =?us-ascii?Q?MZ0crPsetzmQ6IJM0oen5PCY5ZCJSFrIf1Q5NY2GBxjFE8/+FV65BYfLius+?=
 =?us-ascii?Q?Ydc9cQ8qANMJrU1wl0WENtgzhlSjQM7pawPz5yU1wsgM3Zwx96TK3r5YrKBK?=
 =?us-ascii?Q?+nYemoP1GRfB8DLV50Po4ixf5vA2DxxdsHRoTMJvAGlrtXOogdGVieCQZY3v?=
 =?us-ascii?Q?GG0eiEgOj/xYsK0EmUJzE9vtzpGS73f6NDNDH8tXxoWXlcoFTB4TRn3h+BTo?=
 =?us-ascii?Q?l6uThrBD+uOT4qg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0GEB3aCqzJ//72sg1kUR6y3i9xDYARhaPGLiX6CkXulHkVtqyDbwPDI8Ratu?=
 =?us-ascii?Q?9OErFvQkHGcLDeVG02fua9ZvGgmYrzuIv3ZK4ER5uOJl4C+8EDRPm5XfgBso?=
 =?us-ascii?Q?0GdOYaTnH7YUCEsos/NTOmbBb6ppm/F5v4Ez4j23qg+HfyarEiULJkAMHK40?=
 =?us-ascii?Q?6uKiG6pdGTWalmuDiFyfn97ZB6Uh5BssyYhvlaEWlz0tTh+La9zunUkl7QuT?=
 =?us-ascii?Q?Zs2FoUCHu+RxUBWw5xfZGNeDafHJn2HHVu7pTcv1ONPOjWPiV6BUuGjlUD7D?=
 =?us-ascii?Q?vZt89x2fK1e0FySeWsxLdyxzyjmHFThRy6Xalopg6+Gd+q7MBcORRhmL7U+w?=
 =?us-ascii?Q?+Ve9XdX74miWxGPvFudqxs7jNIaHBdo7TmnsCp1pBVDMO3mCLt03FFC6tYBi?=
 =?us-ascii?Q?jyeCTs/KRq6YMW2b7vIH920wvhyopQ/8IEjBJDr0SHn0X1dXfX1EvlNa3nV8?=
 =?us-ascii?Q?NRLykXxmRGvM0Cd5gqI29ps/JEF1FFLgRTaty8ziDGtZkNCV4KzoA9xJ1seo?=
 =?us-ascii?Q?TMrzfW9hv36MPbH6DL4w1EWXGWMw2nQrxfgCMV+0i5qBmgFjhYisgiuR5Smq?=
 =?us-ascii?Q?JJU8M5FFkqStQeM+Ut+jG1MQw90AZRFcgOmktBdlrMpYabLPFhv553Q/OJf9?=
 =?us-ascii?Q?8Sgs0KJH1GWeNHEg3dyfoxBelh35UfyGYLt4IWoew2tyQF8In1exM4ViiA3i?=
 =?us-ascii?Q?0ZxdV02a28DVHUs56y5bbTjS+NBiVa8dcRdT7NvMpSPriIK4Tj04WewRIxYS?=
 =?us-ascii?Q?G1ZmgMgbnzAs6XXggbrrrcM5LlCM9q4iT+OIpi8CZA0p1kQo8QBTpA8d2Lsp?=
 =?us-ascii?Q?bOBKZorZHLxnQzC5lojMaVz5Jv0ZsYrUSj4xL7buScdeEdfkm3O1Li/qAm0t?=
 =?us-ascii?Q?Cx7Gv/JtsedZ9p6Yss7SOVHIEoMLfqdenRIVxA3wI88gsjV3VZQ3zCIDxGH8?=
 =?us-ascii?Q?e3n6G12f4hX4rN43jnUASPoYAdWuQYbtyxUgbmCkMpKUGtwbmu1mJXtuF+/a?=
 =?us-ascii?Q?Bm7CWnmr9ec/rOeEGRmclqSqXzimAgY35foAArsYAT8QE429iPtXnuXXuv1D?=
 =?us-ascii?Q?S3rpJHZ5EkGSfRz0oiNxw2oJZ/3U9de594Ora7VtrEYJWFIRVRCrZDmsooGl?=
 =?us-ascii?Q?bkpsMBrJzluWKdv4FrsnCvt07BXIEgYrcpw+838QmHnuZZTvL3VX7jqF6+dM?=
 =?us-ascii?Q?sm1Rb5OxQPrt+xCNe7uc3qsARcsji0FxK+JGyCd/YcA8gDh4BmsViJcCyqZO?=
 =?us-ascii?Q?N4m3RzMS4Jn9UzVh0k59C1QgYJJTnvvGaCn/CFMThr2TUJjAJdbXdN73PqVM?=
 =?us-ascii?Q?rDWzjIBxbX9BdfxImxQVq/yvg6p0lQWeju9PKJ0mfIdHRNZ44C57uFDhzvTb?=
 =?us-ascii?Q?qF72ACKHyzSYnIViB4aXM8dZ5uEXNEIpo6oueI3I6bQqROs8KVpaKpxcpRuE?=
 =?us-ascii?Q?AlkjL7ooaWoJ4DGRMkEK9PexdkFGW6iwpdz5w43gOt6WNj7zVaxcKJAdEHCI?=
 =?us-ascii?Q?NY5KP+ER5FaOpQsM65JoaG8hRYvYIu0R0uYEpPrIqqsLNrvCfGH//2FjjDAJ?=
 =?us-ascii?Q?OjfIMulIgjDDRzxL77E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efa82a7-c355-4006-15b3-08dd80ae46fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 08:26:55.9542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KSYXDHgfscN0FvPyaJFgxHx3FIz1+Fn+KA4VdxIGYLfpAWSmO+HcCEtUt+fKj6wDJq5tgV3N7curev0G+jawA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7252
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

This patch is Reviewed-by: "Jesse.zhang@amd.com"

-----Original Message-----
From: Khatri, Sunil <Sunil.Khatri@amd.com>
Sent: Monday, April 21, 2025 4:11 PM
To: Khatri, Sunil <Sunil.Khatri@amd.com>; igt-dev@lists.freedesktop.org; Pr=
osyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.=
com>
Subject: RE: [PATCH] tests/amdgpu: add missing user queue destroy for cs_no=
ps

[AMD Official Use Only - AMD Internal Distribution Only]

Adding jesse

-----Original Message-----
From: Sunil Khatri <sunil.khatri@amd.com>
Sent: Monday, April 21, 2025 1:29 PM
To: igt-dev@lists.freedesktop.org; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Khatri, Sunil <Sunil.Khatri@amd.com>
Subject: [PATCH] tests/amdgpu: add missing user queue destroy for cs_nops

user queues after completing the test case should destroy the user queues a=
nd do the necessary clean up. clean up was missing for cs_nops and that is =
added with the patch.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 tests/amdgpu/amd_cs_nop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c index 16=
7699328..67bb0419d 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -139,6 +139,9 @@ static void nop_cs(amdgpu_device_handle device,

        amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
                                 ib_result_mc_address, 4096);
+       if (user_queue)
+               amdgpu_user_queue_destroy(device, ring_context, ip_type);
+
        free(ring_context);
 }

--
2.43.0


