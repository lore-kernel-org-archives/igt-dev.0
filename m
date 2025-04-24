Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7316AC369D7
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 01:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2590B10E707;
	Thu, 24 Apr 2025 01:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o9e7p1s6";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E4D10E703
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 01:19:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wx/EPpOHDXURAdBpM1Q2CM71e8yUS2pfVtfPwKv4xwyHqPTtcnm2IMFDHRbRjuB24bstF2Wd7T9BK4DsY/cqt8ZCBA3OuGzNTQq1QHtJw3rVW9tpnPm7KM77FzEY+BAneefq+QhE4iUslQl0lLyUx34N6kR794ZD+1u6dX1JgiPX9khjSNPCChH/thvwyrVkEI3kwmUcmLDqpKUEHo1tqo/yU7HPK68zshKWNbXTHjwHdwI0NQGtx0r0oH/Ioi11XeER+ZZTgj7rCIAARah3Ggo/QMtYFQGCraGiX4Erp10DTGzKETqsTJ83G08iUg0MWaej2FJgHPeL3/PukH0hAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pC+FR47Ybd1qDnyY2X2KhesJLLDxKoMqlSeCW2JfbWA=;
 b=tTu5USKUYmLuOGVfbaD8q0ishExb19Y6zYYdbbOthI/YlEZHNDkQ96MRd/qvwd7mkPbAaCqnTilhHdfPeS+5rewPeLhZlUdhJarlzoPkSYE/VUJWjZmPdhrRyR+5o5sYkNhO39lNXAM83k+8msdTPslGWkrhBiZruFArceVAPWBkSbRlaNx43GOVLQVSyxl/A9Ta1f0KGKFrbMdtwFrB+Eka0vqyO4nwVuVWTYnrqlkADYN9joAc+acNeCQJLm2fhxteysx7yKONkZq6WZngK50gwdYxp/H3878veXNpPlmN7fAYXXaZ9oCISwTwlPSmgHRlgqnX7wI3lSPU8MpxJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pC+FR47Ybd1qDnyY2X2KhesJLLDxKoMqlSeCW2JfbWA=;
 b=o9e7p1s6jQ6ai+knJW5J1aRPcIJOIFefc5/0b8c8SpoEFA2eVmPWIBswFCUlYW6t7iE+APQzEi2fiuW2OjrsymQwyb6iX35ZAMXjy+E5l3tuioAdkjBTWrt+/VZ1OahGgu8K1SziWXVgGS2fRa2eRXIK+YiPZtkdltrlC0zmc8Q=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by CY3PR12MB9703.namprd12.prod.outlook.com (2603:10b6:930:102::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 01:19:43 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 01:19:43 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
Subject: RE: [PATCH] tests/amd_queue_reset: use the
 AMDGPU_RESET_TYPE_PER_QUEUE flag unconditionally
Thread-Topic: [PATCH] tests/amd_queue_reset: use the
 AMDGPU_RESET_TYPE_PER_QUEUE flag unconditionally
Thread-Index: AQHbs+Jc/pREE1nWz0e26HGe9Re3aLOyBiIw
Date: Thu, 24 Apr 2025 01:19:43 +0000
Message-ID: <DM4PR12MB51526B48C89B374074BC60C1E3852@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20250422235740.131691-1-vitaly.prosyak@amd.com>
 <20250422235740.131691-2-vitaly.prosyak@amd.com>
In-Reply-To: <20250422235740.131691-2-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=5be7f8ab-9cba-4e31-8637-99a021814905;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-24T01:19:39Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|CY3PR12MB9703:EE_
x-ms-office365-filtering-correlation-id: 6858e2f4-2dca-4d51-c296-08dd82ce17df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?u32bmnpI1Hmqv3Vf3OLotMvk+yG1oiuSVdHC6dACPSseUgJBOzrXlUrdwIpm?=
 =?us-ascii?Q?0Jp5fUyQek/4ErSlMkyiZ/1C19eOOIHKpwQIVb8CUjuo8nydkLoLgFClgWzN?=
 =?us-ascii?Q?fUlwKHUHKF06V6dKwRkujUXCWqyfFUhW/WObCS6wT9Mzx+VyNihgIT8733eO?=
 =?us-ascii?Q?rQV0o3dauz0pS3N/FdpjSs5XkqnScyPS9cMfD7bsCL96/SHu79JE31SaaxiH?=
 =?us-ascii?Q?WOZwrYUL9ZfnfZrFMzwV8nfXcWRwuEjVJQBLLYjbmoLizq/YohxQVAvPW9QZ?=
 =?us-ascii?Q?VqK6sPnkiLl/ojyOh+/y8Y0UiBIgHZFnE7D12oB0EjM2MvNeUssDKjoU22Z8?=
 =?us-ascii?Q?eg8LNoeavYZArwtxGp8MrHZ06Nct9d1TZ9q2YdfpYuohBPTfXfIB43YGSGyW?=
 =?us-ascii?Q?pAkho5hAofNQul1c4f0zkvJ2emBFDSqpU4taG7uArHnCAqchkp/j4FMrNt+0?=
 =?us-ascii?Q?0L4KoAxTfLDDqi2MgDXw+EJHR4wMdg2Qf17Xol5KT5Y/bcP/OmSJvWHmt6Fy?=
 =?us-ascii?Q?92Xd5CyGVOeR3GFD5W/crEIifWvFShwa/8QO+5RpL26djFaTmXtbWUD1dwd+?=
 =?us-ascii?Q?+erMaNufNnkS/0ThvyK05PxGk0VMcuaKfZ7lfj7on4moUngYOdORInmmZJD/?=
 =?us-ascii?Q?bBWKzF+wbN3R8wZjKxWnSmkbFWrLWQ7b2oybVPmfpLO7w7aQbyHI6j4HdTHe?=
 =?us-ascii?Q?9b4xRioAsuXu7mIegfFJEn45wv2N6/j7u79LGVkJo3TIkLMmTp9Tj7p6L0iL?=
 =?us-ascii?Q?7KN2BEITr0Li/OuHF+L9mztATcL8F73v6mbVgVIibbZThXYXR8zSohMPdhCx?=
 =?us-ascii?Q?4OG0PzHTwGexMmSXnCEFHPojQDvOjPPI/aswLOrKvRJDYL6bMDzj1XeUm241?=
 =?us-ascii?Q?1mSl+hqv1t/UZDrRJr7MCOGVD+4wUn6gRo8RPTfqC9WuaAcU8WSMMPnHYude?=
 =?us-ascii?Q?XO6g86iH4d3o18PewZHySGjAB4rNf/oEWifJvD3YV1q3XankZHVkl7pJJz1i?=
 =?us-ascii?Q?k5Gg5W/NtGnWpEABNRx9FygrfUMrYa2F4eDBVktwj06WuqSuvH6FVBmIcpq/?=
 =?us-ascii?Q?R7sRmCW7VAe4phSWHiTwHH3uLXjyFpat9Dhz68UAEiwKrC/UjBpn5pc+LszT?=
 =?us-ascii?Q?9JaKt3dbkVqEDLNggFvjqzFX+Jll7nMen6FVejGCYF58TtHlphqHIeJGTI7t?=
 =?us-ascii?Q?+mBrcGWd+nSldprvGp02Q3d2I58+l0nbACyRqH41EYEwkHGM9uRDV1QLrnSC?=
 =?us-ascii?Q?MqTxjIhlzl8vehHmQgz7UX+2Fm+mI0/2K1QctLFFpFUFvxVovpv7tUOZrVYi?=
 =?us-ascii?Q?qEa0eqpdQr0B5+kr3eST5ja63UxZJNQLGoPQGF1C0W9dNus5mkz/BaH23fSV?=
 =?us-ascii?Q?AeMXp9JajOqizTJSDphO5XlyaNUi40Ov2f/3xvP2ObUpLKJn7NUvgw1jrRuz?=
 =?us-ascii?Q?nCG9buVWTDrzztB6bHfCC5pvRs0Pm5SQyQMKhP5hNuKtuBDOkckJ/fAx6V1O?=
 =?us-ascii?Q?0YNCjRmLOxUp9zI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Vx+DU2MrD6oGehDwYykWbAcQYJliL/6mnPYOr3cXRHFXzSY8/U3n0Jd+U1vc?=
 =?us-ascii?Q?LK75XpbdUtghbIkbrOuCCqjrv9G6qet75DeMZUTHePBhI5rWbW6wTw2PBaRb?=
 =?us-ascii?Q?FkXXJiQP0D85lApSbDItb36/y8y1UPIdj53oroyXTCX36drXad+xB9/uDpa1?=
 =?us-ascii?Q?9ngwCLH5JAPnCNYS6aQcXvzFuy4jJm3Z6s4UL0CkFSfGSX4UPwYD5tdg8tP4?=
 =?us-ascii?Q?lvMIPNjOnHvUQvNBB5CiQMfk/o273/a2kKbvF4JgYWueKIXOEEs2aA6OwJVh?=
 =?us-ascii?Q?WFyvt+VcTPjJHMDuGZGZV8+1mIZmq/9p8bimaZ5utXb8EBwEDYr57VF+3t4a?=
 =?us-ascii?Q?6c6kHNptfDc5dOFG+fIbfqeDyLZo4GloPqZmUMv6TP9RGj5zh8FiQMPGtFMH?=
 =?us-ascii?Q?kwhuVXHWLnIYEJKaWRzEeevhQVmUUhL+ixUdmGG4utm1OJEsZA5n0cd9Kkef?=
 =?us-ascii?Q?BI06iHZyNGaoRnwhne5/lzxyQApie0u85PjZU0JlsEtKkybQEoXQRqssUu5Y?=
 =?us-ascii?Q?MKXPlPGC2P6YP7CWm2l0XTisRoQ0KGGbva7EH9bO7fyrN6gOmI9Z03KgEBpx?=
 =?us-ascii?Q?4Nm0Abogz1XXPMn5CJwhS9RZJRLCAXx8ZjWyVWLDCYvKtWRU5LM7O2bbwls9?=
 =?us-ascii?Q?sW4DGu5bPfYPkTi8Tlum6SKHOc+hjtkeU1QCS8welpHTYFonZLz17476Skh9?=
 =?us-ascii?Q?+2RXE2ipJKXNDhOFr0sIKMhJC06i8IjHwiXpCjqv4Qw9x2DCQ0C8CN1KSun+?=
 =?us-ascii?Q?R5k6DL/TXA2W6dPyu/FdXSGl72ymt6Z03ik0qQcmyMw/1bGqt4eTBWhQ3eEg?=
 =?us-ascii?Q?bzl+BrLYQQ8TtWQ9QjvOimVoc5QTfNQ64DQqCzEKJBgyJ62yIO/eYv5Hb8/a?=
 =?us-ascii?Q?Ver6lECo+oRAhPw+zZihYEssGu96lLTF4NhZ3Tf6wIBwv2RM7n7EC7wt6YcO?=
 =?us-ascii?Q?CIvS/LWXFBYufACB5jjZD2NtJdGkVyvhmiHFEIUABDBlNiTeXaLjIrVaqtqt?=
 =?us-ascii?Q?zzok07pORBZcOUgCjrKEfbhZ0UnRBv4+7HcfmVZFxSks2PDUPxI5+CDgeBnZ?=
 =?us-ascii?Q?ZPDFl0RfyYHZNQ3qnEwLVhd/cKARUvILXXKJDLTE5jvGSHoyhFLeagKofDXZ?=
 =?us-ascii?Q?H3gMHQZKvKXAeso2DBuKg4fCZ4nx4RoE16rJIJlvw4cUL6K6OntqnL+0d+/S?=
 =?us-ascii?Q?sGTJkWJsWUIoygHowlDkcbAKHzSIWPnBccvX9hbyRreFWDCYnFaZy5Ve+USu?=
 =?us-ascii?Q?WNwaCMoS61p7xBLZVumbQTnYNjekMuweXrunEhZpdR3ZwrixgxnrN0VXwfe9?=
 =?us-ascii?Q?s1ozW1r1vNM/NfEs9t6qAdwgk6AeGnufQjTvN0KFXNLeEGLUmJPcU0DpFDLX?=
 =?us-ascii?Q?Y6VfCtS4+0J4B9a7fEpMJfHu3MNVN9zovJxClllGo86V902fFRhsf8BnP9/X?=
 =?us-ascii?Q?w7o8+qK8Z52WLnFL34sMmp9jkMEVlEOkFCSe9wGmcj+GQAxk+w9KtLm3Jz94?=
 =?us-ascii?Q?FOyTJRrH5N5mrlFev5lEeyw3dyMPJJ1cdheTg+9xEqaj3QZ/dNgKKxzDG1XM?=
 =?us-ascii?Q?LUWn+JDjXubKjjeMsrc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6858e2f4-2dca-4d51-c296-08dd82ce17df
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 01:19:43.1340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vwcdbrxJ3SOV1xy6hazuFersow2xooN9wMr+wi9jZM9bcuZyzZWRo+8rwsVxHDOItoY0DVGqYFInrsD7KK25cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9703
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
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Wednesday, April 23, 2025 7:58 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhan=
g@amd.com>
Subject: [PATCH] tests/amd_queue_reset: use the AMDGPU_RESET_TYPE_PER_QUEUE=
 flag unconditionally

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

This flag is supported by both the amdgpu driver and the firmware in many A=
SIC's.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.=
c index a7aca4171..83dabf775 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1237,9 +1237,7 @@ igt_main
                        igt_describe("Stressful-and-multiple-cs-of-bad-and-=
good-length-operations-using-multiple-processes");
                        igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests=
[i] =3D=3D AMD_IP_COMPUTE ? "COMPUTE":
                                        ip_tests[i] =3D=3D AMD_IP_GFX ? "GF=
X" : "SDMA", it->name) {
-                               reset =3D (ip_tests[i] !=3D AMD_IP_DMA) && =
(it->test =3D=3D CMD_STREAM_EXEC_INVALID_PACKET_LENGTH) ?
-                                       AMDGPU_RESET_TYPE_PER_QUEUE : AMDGP=
U_RESET_TYPE_PER_PIPE;
-
+                               reset =3D AMDGPU_RESET_TYPE_PER_QUEUE;
                                if (arr_cap[ip_tests[i]] && is_reset_enable=
(ip_tests[i], reset, &pci) &&
                                                get_next_rings(&ring_id_goo=
d, &ring_id_bad, info[0].available_rings,
                                                info[i].available_rings, ip=
_background !=3D ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
--
2.34.1

