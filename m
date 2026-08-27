Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D922C61DB9
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 18:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84DA10E09F;
	Thu, 27 Aug 2026 18:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N3okVMTt";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013005.outbound.protection.outlook.com
 [40.93.196.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5D310E09F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 18:17:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIpJbOcsSZVldgEVQ6yzn3fXFoPq1VoUMkk2NztrSPFOBs8fmG0hmr/vpVX9I6MX41bO9PvVPtH96R6z0fBNtWY8BziHrfzIEAyv2qnlWquZAo2qxu4w9TtmhjuSCftoNZuxVaETaLO0Kt+93rTDBMnVtuSGj2YPARzNHZ3d3MhsHr67GeUdla5kabGQVs+Tr0OEVO+2A09BgCOBlLF53QBA7qARE2uDuj5G+DNKIsMd1L6XofWUoTozlS2c8Lpd34TU1mU7y5glZcrsYKGVh7jDd+D0Zk8uzVUpJBjpGMb2PUozQn0pit3qsClnc8JUkurbqiEaB0G2KzLWalBvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXnUbHP7HAAjCYHaJXteQgnnmu39tCKFnMfV5XoTNuk=;
 b=DtZ7Z/Jt9NuYlQIqISNOIqV45wDSnUo4FJPtDWYNcvLWR+9KUn22VnOAubEoYdsvdThijPdvX7SR/BnAmRDlhJxKjb1tQbeHQ4tghIr8P0ymcuwxxbDQ4O8m/XDW3azQRGo6DmSmoW5WcG1bp9fHcQ0rt9Y7Sdt78Lns4G81rJO50rn1vxwth33Qlpx8t2M+MlMGir6bhysj8phF2AU/FPIdrWr9/TKuacfuyhCm5/3UmXbtznICxpbcaWKriTwx/RC8wkDnWIsw8wABIc3ur7VcC/U+t3HDsXy1ms88F8zCdjV4nA+SCHLH8c+sF4PsJmg5usrtl/HMdrY0/tIEKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXnUbHP7HAAjCYHaJXteQgnnmu39tCKFnMfV5XoTNuk=;
 b=N3okVMTteEJBuVl9AfRJgNjMtlFOCZxgqemBpJ4ctZnKHv0Okyzzki/xzQMVT180lnljmx30Puam+QzHLVuBXluDg4EEw7ZkyNF2JPOAnO94G7mnV8F+8EW1aSlobUMosjGlAi0XS7K0wTmQ+MHH6xyeIj+Cd0xuSaEJkTaeCLg=
Received: from SJ0PR12MB6855.namprd12.prod.outlook.com (2603:10b6:a03:47e::6)
 by PH0PR12MB5646.namprd12.prod.outlook.com (2603:10b6:510:143::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 18:17:04 +0000
Received: from SJ0PR12MB6855.namprd12.prod.outlook.com
 ([fe80::2025:d896:f168:1675]) by SJ0PR12MB6855.namprd12.prod.outlook.com
 ([fe80::2025:d896:f168:1675%4]) with mapi id 15.21.0315.014; Thu, 27 Aug 2026
 18:17:04 +0000
From: "Strawbridge, Michael" <Michael.Strawbridge@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
Subject: Re: [PATCH v1 1/2] tests/amdgpu: initialize platform filtering for
 amd_basic
Thread-Topic: [PATCH v1 1/2] tests/amdgpu: initialize platform filtering for
 amd_basic
Thread-Index: AQHdNk2h/Eu7XneFfkmwmXklm/u8LLayM7mD
Date: Thu, 27 Aug 2026 18:17:04 +0000
Message-ID: <SJ0PR12MB6855D3E882FBA4B9C1FC703DE8AD2@SJ0PR12MB6855.namprd12.prod.outlook.com>
References: <cover.1787853061.git.vitaly.prosyak@amd.com>
 <4d147ef0cf3d8b5337654212cb568b8fba81cd99.1787853061.git.vitaly.prosyak@amd.com>
In-Reply-To: <4d147ef0cf3d8b5337654212cb568b8fba81cd99.1787853061.git.vitaly.prosyak@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-27T18:17:03.793Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6855:EE_|PH0PR12MB5646:EE_
x-ms-office365-filtering-correlation-id: dda8a3d3-d4f6-4f33-dc50-08df046765c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|38070700021|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|8096899003;
x-microsoft-antispam-message-info: jDMWsyzdlHK/AJcbGcp0re+BMZaR+tf+xhEXkPFYbMPGXW4P5mpH30Y+X8vcwzThlUZhQnU3vhvd32pnRMGzsI+Vhq8L0rv1e3crZhWyGesBW0bSniiKkmmpgj+HCRU7W8Z0NcLgqpV/jHNkITtm/DBTqHCG4p+FPNGEUSQpNqjp02CYzjTcoQPuko2GCawCD9NYc6btPO2Aw9BJnc09VMxXu42DvpAO+kwZfw+P/z2pPWnxfVPJLqIpcoCiKdQYfxeNODTFaWKc61BHAD57kqaX3vRxo46PkdVm2m7n9vVMH/8hpue6XmV6qanrk4MCBYssnezwqqB/o2tPnnSjNn7xQfDUco14wlkIJR0sDZvZO4ty+BVuWJZ70bvyv6eFfRoz9C8kB3df9omQTi7vRiYHtSsMEq7iuCMoGp6gUkzqXGy8lHu5ZCH21AZ9C/WfrgcB82+IGDKr7RVaFqq03Rfmpvw4WLyi/X8YH0WK3ae/5/7bq7cKW1fVuwTB8OOphlAXcO/wTBXUhKLAZLDLB4ZiFVbOx9aak8/TK5zcAdkfJEEpQHSEfXewtt4CEMtx4+ohZrcjWfh+NZuaPpJD6tjnklvHcqjSbpOqLU1v4DUBUaUALoLSJGRaNDmUdtv3sjv8hX+mVPOaIYcCSLnm7l1COzLtfjBciwZpB2PWzjn1dIUZ5ygD/CyT1+F8v6eDvF76aMJru+MsTt7I0xvBQd9Ob0daApJRqeh4OWY3VBo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6855.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P2Bk+l2a+OKKFzE6/d7R9XEXi3YjAP0WhjenypXBzJNYvQjHPqx5tHk2m8/0?=
 =?us-ascii?Q?EcgL0bzB9mqt8Z4jgmskMTT88p0nvZsMU4TAX/dw5H3ldzFM0cKvRNq+xLmb?=
 =?us-ascii?Q?vx0uJROEweFRe37q09aESQdEKE2KcBX9PX1xiH9zjoGikUt2lMS8srK8vbSG?=
 =?us-ascii?Q?SgyZeA8KXAhRpiIC10jXIgZl6ovmVpx5RryM+Uud/eCzHbvkQAL0MQXW03kF?=
 =?us-ascii?Q?qplI0A4Hkzxhho4Qx/DlJnN4LGgvWneUNvZMwNv9qDFGsC35uZtvNZQpVtYx?=
 =?us-ascii?Q?YtTgr3mpixgI9Mjq1cVQ3HC1wMuuQs9avIu2gO3209WrSy0VABOaIezE159Q?=
 =?us-ascii?Q?WJy+wymVhaA5vdZY9PAGXxN7ulKLKRPbD5VgyajV4LwKsp3wKvewVxvCihhd?=
 =?us-ascii?Q?2U58LgPXnlCNFECNSRMIys3K/GLdy8rnrGfD160b+I8AO8KAju3VhZop7bES?=
 =?us-ascii?Q?iFdSD3IMT9bZvBspbGqoxXMVhyouJqERSFsbTXgueEYmYI7azCjc9Nw/WEgV?=
 =?us-ascii?Q?LBjEJZ2dFg+cJCZNVkxG+YO5hnTJ8w/edCAS2ywjt+Z3SSaPRJSGb7ZNXrF+?=
 =?us-ascii?Q?DfsGcsoW96apalioNqPV7zrOeR4mCj/sHUod219OZKeih61G7jkTx6rfigdF?=
 =?us-ascii?Q?2JYA1MsTpX46xboeyHmG7zDepuESoY0RNKmbNAhUu6uFv5K2K9MmDzbMWIUk?=
 =?us-ascii?Q?vP5newz4WtdYV70BXuTn6wwqsfqyMo6P3mt8vuV/21LVwq6zg5uLCQmijgdZ?=
 =?us-ascii?Q?CY+a3W2okN6GUyB37tovzb/r306w8Nwyghh0u6lUBklLBTWz1VY9rSxXY7So?=
 =?us-ascii?Q?+swsKcS4rIJ0U4DnmQCwafo4mdAYeO/frM5P5emdA45BAd1LUcRVbBEsYFrR?=
 =?us-ascii?Q?pCvNcpVTPQzeo/WGn5mAfxpnDXe+E36ZWnfXNv7+wJ1O0pQU+8hh2Gt51cTT?=
 =?us-ascii?Q?yI/eoIXLr1MgpbT4MzY2haKWyLkgkXc/9k4V1ROCDYMUwkOcwVYvq5BW3tvq?=
 =?us-ascii?Q?iOmW8o4oVT4g40giJmlBltUbF3C+1fqH9+vDDcp2M/SQMOCuqP2CJDNPRHBg?=
 =?us-ascii?Q?tATg7KnGgQBi/YYpjn/BqFxE3RFwKqFo6djbPmi35afSmPS+PfLV+mSVIZkP?=
 =?us-ascii?Q?VTRrAXYYnPtW3Fa0JrZ90GGnwAIjj0grxMF10Lu13aNLtahkkBpAI6GuBwz4?=
 =?us-ascii?Q?RwCWPI9rMSopcJxeiacLaNKgPM+XrrYmpIg2WJt4dwsWb47WTWsD583C6mB/?=
 =?us-ascii?Q?FGsVxj3HSaj6ghKMdLLZDcXZP1iSviQd3lwG+vurhoQ0W7OgKwPDiORjt0K6?=
 =?us-ascii?Q?rpQ1Xbqn+zAMs63DfA7fq4OLQGPINg9x/pKERmUSX+9g15GV0mUB6OieGVtx?=
 =?us-ascii?Q?MHbFehZgRzolgUM2LxX1kzYaygOfeXTT+QMjU3MU3hkyhuGHQBFuhh4bTiTO?=
 =?us-ascii?Q?+pqX1yfF/WtDmf6GPliJ7YxLv6ziBuy2q77R7N5af0dewzmvDUWRoh5U5d4/?=
 =?us-ascii?Q?GT20wpkMLahnAazYJDYL4SalLN9fS1+l4FJmGdcN7Ht1Lf3fiaXpsZAUIumi?=
 =?us-ascii?Q?inuJWDciYVMKPuyEMwrH4M7e0L9lUiix7b/y1kO7KeaE+C7FiBaG7W4V/Eyh?=
 =?us-ascii?Q?hAmJTddpMD9BK9OI5KMDh+lfwOkbdSmuvoRGAEepeTIZgI67LsDHgb4FSwtm?=
 =?us-ascii?Q?oxOnM+8bNtfZYCMl/OtsqzCexmu2FuYykhT4V4+sgvxW9g2y?=
Content-Type: multipart/alternative;
 boundary="_000_SJ0PR12MB6855D3E882FBA4B9C1FC703DE8AD2SJ0PR12MB6855namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6855.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda8a3d3-d4f6-4f33-dc50-08df046765c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 18:17:04.4620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mJZTgBudrG1s3g5kq3rh3r68l7VrUKCfMDgEiRrljIeWXyd0P1JryzSuTPzEFEN6UFwGjJPdED+7ZCJJ/p3xCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5646
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

--_000_SJ0PR12MB6855D3E882FBA4B9C1FC703DE8AD2SJ0PR12MB6855namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

AMD General

Hi Vitaly,

Feel free to add:
Reviewed-by: Michael Strawbridge <michael.strawbridge@amd.com>
________________________________
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: 27 August 2026 1:57 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhan=
g@amd.com>; Strawbridge, Michael <Michael.Strawbridge@amd.com>
Subject: [PATCH v1 1/2] tests/amdgpu: initialize platform filtering for amd=
_basic

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

The tests for user queues are always enable and not depend of
env AMDGPU_ENABLE_USERQTEST=3D1

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 84a6d8618..59ec3880f 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -19,6 +19,7 @@
 #include "lib/amdgpu/compute_utils/amd_dispatch.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
 #include "lib/amdgpu/amd_utils.h"
+#include "lib//amdgpu/amd_platform.h"

 #define BUFFER_SIZE (8 * 1024)

@@ -858,9 +859,8 @@ int igt_main()
         bool userq_arr_cap[AMD_IP_MAX] =3D {0};
         bool enable_test =3D false;
 #ifdef AMDGPU_USERQ_ENABLED
-       const char *env =3D getenv("AMDGPU_ENABLE_USERQTEST");

-       enable_test =3D env && atoi(env);
+       enable_test =3D true;
 #endif

         igt_fixture() {
@@ -884,6 +884,7 @@ int igt_main()
                 igt_assert_eq(r, 0);
                 asic_rings_readness(device, 1, arr_cap);
                 asic_userq_readiness(device, userq_arr_cap);
+               amd_platform_filter_init(&gpu_info);
         }
         igt_describe("Check-alloc-free-VRAM-visible-non-visible-GART-write=
-combined-cached");
         igt_subtest("memory-alloc")
--
2.54.0


--_000_SJ0PR12MB6855D3E882FBA4B9C1FC703DE8AD2SJ0PR12MB6855namp_
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
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
Hi Vitaly,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
Feel free to add:</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
Reviewed-by:&nbsp;Michael&nbsp;Strawbridge&nbsp;&lt;michael.strawbridge@amd=
.com&gt;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> vitaly.prosyak@amd.co=
m &lt;vitaly.prosyak@amd.com&gt;<br>
<b>Sent:</b> 27 August 2026 1:57 PM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Prosyak, Vitaly &lt;Vitaly.Prosyak@amd.com&gt;; Zhang, Jesse(Jie=
) &lt;Jesse.Zhang@amd.com&gt;; Strawbridge, Michael &lt;Michael.Strawbridge=
@amd.com&gt;<br>
<b>Subject:</b> [PATCH v1 1/2] tests/amdgpu: initialize platform filtering =
for amd_basic</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt=
;<br>
<br>
The tests for user queues are always enable and not depend of<br>
env AMDGPU_ENABLE_USERQTEST=3D1<br>
<br>
Cc: Jesse Zhang &lt;jesse.zhang@amd.com&gt;<br>
Cc: Michael Strawbridge &lt;michael.strawbridge@amd.com&gt;<br>
Signed-off-by: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;<br>
Reviewed-by: Jesse Zhang &lt;jesse.zhang@amd.com&gt;<br>
---<br>
&nbsp;tests/amdgpu/amd_basic.c | 5 +++--<br>
&nbsp;1 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c<br>
index 84a6d8618..59ec3880f 100644<br>
--- a/tests/amdgpu/amd_basic.c<br>
+++ b/tests/amdgpu/amd_basic.c<br>
@@ -19,6 +19,7 @@<br>
&nbsp;#include &quot;lib/amdgpu/compute_utils/amd_dispatch.h&quot;<br>
&nbsp;#include &quot;lib/amdgpu/amdgpu_asic_addr.h&quot;<br>
&nbsp;#include &quot;lib/amdgpu/amd_utils.h&quot;<br>
+#include &quot;lib//amdgpu/amd_platform.h&quot;<br>
&nbsp;<br>
&nbsp;#define BUFFER_SIZE (8 * 1024)<br>
&nbsp;<br>
@@ -858,9 +859,8 @@ int igt_main()<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool userq_arr_cap[AMD_IP_=
MAX] =3D {0};<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool enable_test =3D false=
;<br>
&nbsp;#ifdef AMDGPU_USERQ_ENABLED<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *env =3D getenv(&quot;AMDG=
PU_ENABLE_USERQTEST&quot;);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enable_test =3D env &amp;&amp; atoi(e=
nv);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enable_test =3D true;<br>
&nbsp;#endif<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
@@ -884,6 +884,7 @@ int igt_main()<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; asic_rings_readness(device, 1, arr_cap);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; asic_userq_readiness(device, userq_arr_cap);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; amd_platform_filter_init(&amp;gpu_info);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Check-a=
lloc-free-VRAM-visible-non-visible-GART-write-combined-cached&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;memory-a=
lloc&quot;)<br>
-- <br>
2.54.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ0PR12MB6855D3E882FBA4B9C1FC703DE8AD2SJ0PR12MB6855namp_--
