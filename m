Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74365C52D6F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Aug 2024 02:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF7F10E0DB;
	Wed,  7 Aug 2024 02:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H6ky0itq";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF48A10E0DB
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Aug 2024 02:09:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPQ+B3TuQni2pSCuEIbzYQDo6py5on3EiMy/c0pXVx50je39VjmCpNJRU0qPgRjxRVE4Pm3nguk4i7FWC7KyiL/8CIJ1uil37mQwxKu5VdxUrjsH/sdgWDNffZ0VPHkcj3fgnL28WFOKovlVdcpuSjKrspRm/pEY8wDHWVKyY2F5JsKK9jUiD4nyA0zaOUO9g2cVwFvvWC589oTxj9kYhhcBBoa/urXNuisZgV4gURc8fqZeoiCPmsd7kjcbETvkhjVzNYa6zHMzRtj4G8FIn5Peffg/4ubDOh32PaWFDW/pF1um42nqIRGZZTgE9kfEi+E6Xc71kUPOaCTWQygcqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUBSLe/C3fJNo+1N9xrKUh/s1KPJF9TVdXozHwHNSMY=;
 b=s+ljUrYvsUUvA9qT8DrvDunpK7OZb+ujq4T4CvQ594isnAg2uc6j61qrGbnXKvpglAhFLTMAXFxOvyvTXSu5liLJ9FizA5QdZXMOZv2TXDkN3Zow9AKbCLwqIpvebrk/mE04FiDW42UKH7yCVCRigA58rqMCeCAuUFpdX9mfMxDf35PypPLt05MZQNQMHG8RwHdgcUrXXiQ+KWSJAoEjGN6ictAfR5Sn5DN/Hu9vX+LJPrflLzS6FkflnKd44CmlGttEbh9Fpb1m+Xgp4CeRT64JSq0jugd48HCve9OPTH5BcTx/dY3pNJhmTM96e6pKllrgztXHs5+ihraXGBmPEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUBSLe/C3fJNo+1N9xrKUh/s1KPJF9TVdXozHwHNSMY=;
 b=H6ky0itquto1lKUS2lRO2ASpJ0n6YEAaiUy9hgK7OwNt3bdc5Wu4K6uHq088rNARugTZStW/uKEl8vkZDwqsQPC7gII0cjZaORKOQuAbX4nXrW66BxWjmkNX8LjLIrQUXTQJtuQhUAtJFx+jiqUTrf5h0KDrzuCww3gdd/krY0M=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by LV8PR12MB9230.namprd12.prod.outlook.com (2603:10b6:408:186::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 7 Aug
 2024 02:09:15 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%3]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 02:09:15 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: [PATCH] amdgpu/queue_reset_test: fix list-subtests command
 failure from script
Thread-Topic: [PATCH] amdgpu/queue_reset_test: fix list-subtests command
 failure from script
Thread-Index: AQHa6G16YKoWwh/ohk+eGsyDFX1o3rIbDIbQ
Date: Wed, 7 Aug 2024 02:09:15 +0000
Message-ID: <DM4PR12MB5152148E47F52F283A7C40C6E3B82@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240807015929.426551-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240807015929.426551-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=a3bd90c9-f3ef-4299-9abc-b6f1c360420f;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-07T02:08:26Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|LV8PR12MB9230:EE_
x-ms-office365-filtering-correlation-id: 550f3354-a96f-4e7c-eb4e-08dcb685f02f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?OsDcWeCV2xq8DPDeGdJXadQkxWsaKgvvmCo5p5wns/gX+OZiAweiU7Qvq9FQ?=
 =?us-ascii?Q?MhKG6+yALCqBV56xL+dFVlc3mrqhPe33TJ8QF+sU2UXNSRjCom/GuO4Il2PR?=
 =?us-ascii?Q?pxd/E/5qPIT5R+k3unGbl6i4GF0ZrtoZRaj1qK2bET3xxSidCEzEjiHxUVsb?=
 =?us-ascii?Q?+7FUDfKli4syV/ail8clh6sVw5B5tfAUPvwg1ZiMGdyD93p2TdTp4/nbHKHM?=
 =?us-ascii?Q?U8qHxP5+kf17WZM3ZKIFB2w0y5Ipmlj1+RyQ/ArO3APlH+lTaKHVNGjjBm3G?=
 =?us-ascii?Q?753aHVNaSha1RPtNa6VQtlALO1QJp2VSKzYOowl42C5ymqF7aLdNcVkUPxRG?=
 =?us-ascii?Q?qvUelDNmwsRvZBhtZbldtrk15aPoc4xPVJ6fhuy42qJVrH5TjRg2poMFIRnb?=
 =?us-ascii?Q?H+K9uToEy/TKbEC96v3qYu4EOKdZZTRlgCJe1KRZFsUXk0LBKFo/fBoauFFv?=
 =?us-ascii?Q?w6cRL8uDO1dY2SWyccsM6UW7yj/DlPeIilUfMPaeWeCy4gp56c/onXgrt0iD?=
 =?us-ascii?Q?4O9ueLXPbmYBYipBEUewqjmGZ+tKe06oBRimL/0o2H3MrgerAYu/bcn6tood?=
 =?us-ascii?Q?AVhKVliGgV5WtPS9lvdwGvZDBq2RppeP3ZiBfir03x0paAMmlcgCUHPhwXxr?=
 =?us-ascii?Q?9sekiGVnVcaaUJ11yv1HgEolSIwvR6/AdS2eZA6tpk3gIKCthgSv8xb/o5Xv?=
 =?us-ascii?Q?6KRFGHc5fhl9oxWAIbpB5AoPwd2J79CCdztxHubwsueGFP2CQW7lkQnR7aCw?=
 =?us-ascii?Q?oSG0uVkQDaPJH0rstTuoXwriAU7F1t5DzxRHfINqq+pZYJSGT/H5bqvSE7pW?=
 =?us-ascii?Q?FFFW1kf61d+1Dbfo9g4ce5YE9nZt5LTyt7PzsImbcuK8LtJ9lgCVHiebevLS?=
 =?us-ascii?Q?QSQhPn2GGBMr/pA3c6LwnYs3OMhTMGmrUHef4yRkukRHdEq6IlfcE+Fnid1F?=
 =?us-ascii?Q?H6b6J5CPOe3660+brLb+y51p+xdsVeKk/5y1nr8KM80lWZEX6iGqkSt9QUl9?=
 =?us-ascii?Q?LkW/tz7W5DuxoSimBVUxE9ce6KHZr0fIb2gAQ//O5awUATfrmowhw1fXPucu?=
 =?us-ascii?Q?yg1j6xfHi2lKRHOcPixFEIQ181N48xIDjj5o7A5CmN20ADgZyY47Rn0bhtm0?=
 =?us-ascii?Q?Z2lOYYu3sD7RqDl6PE0HQ9GYbBZqIVRVeqGFDhHSg0JCXUoxZvO/ReSaXWAv?=
 =?us-ascii?Q?t3Qnw65o2GoXfrSarhnn7OTHOJIR3C1bHoEJKIgaZBwXGfy8RHFC2Qr5XTXf?=
 =?us-ascii?Q?JY/OO4kL6GfCb8ibd7BaqTiMEZXsDn9B/EwmwFQc1cWD31nSPLLygOez1BC5?=
 =?us-ascii?Q?dB7b7CL0hxoiOTAyGBZcivr+nN+4SFmYpfFDpJkxmpkV1AZbpe/uLCQxgzpW?=
 =?us-ascii?Q?X5S6vkYHrMXo5QIXtHC2LjQ+1bpUdXRs1qegJFTaYR4w0DiIpg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AvFecvJ6x7akeGWqlwu2e5iWMA44v3jvu3Wy0SehVe9KDigzFOe1BRIFiWIh?=
 =?us-ascii?Q?16YqLKCPCxEfLK8HthHXtwsNz9qe3uunrPvXcmvA93lUyvajjtWDA4FAXkDs?=
 =?us-ascii?Q?3FndBrsFx0xjpOHhI8d6hqmBWYk9SuHMkIO8ms4mTC30JXHyC7kpRb9p6uBd?=
 =?us-ascii?Q?lbAvZHNTz/JlsBA9njfffxSvVW5FMpvT8R+ui1m4uH+3C5b3IThmDVBRQ0sg?=
 =?us-ascii?Q?JqHcuQd8Zk7F3vxrFqrDxFkowYNYILAmgvU60P3LOM9jSJ7mf2SVwlPEGFf9?=
 =?us-ascii?Q?B7t0GAh44DjDYRCW482pdd8Uv05J9b01IAqPSsvlNCzLDLInTvNg4xyLhEZ3?=
 =?us-ascii?Q?xFgyjm1j4Tnz2E/a6bZYc8Y/MZmirsm4p3P/Ur3ierspGkyUl5JiQECwrsmV?=
 =?us-ascii?Q?FiKr4ZZ/5sPbE94dkrEYONkClwOB+DP8buqoIxhn05QaTm2TmD8uDNkpPoYL?=
 =?us-ascii?Q?xlkcBo8w12evG3H9a+VboOBTUGqsqt8hqPWC58ZOBGw+fLqu24dAYPcMsRsm?=
 =?us-ascii?Q?2KYpmfu1Wqs/9JgLYwc5HWS/8MucekUTOn2l9bVbVpiDcanTyIiEaz1+/N1K?=
 =?us-ascii?Q?WnWMYxbJ7QXgiVqyjtPosUorEm1bd8OcELDE480yIDTMyVXi36ONTgabDrf5?=
 =?us-ascii?Q?7XIo/6iLtnQqzTq+YNgQ19h7FmFNZDR36nOj66OCTPaSHsXrIZDYPkox5pCt?=
 =?us-ascii?Q?R1dR32ujKWaqnLtrz/EopRRcpUOQ2V/NQSoFrCttYICv/4ALPVynJtifbMMR?=
 =?us-ascii?Q?09KdHshGVC54sb71epDjbjhPKzuN2B7aZqUlU1PmNAx6uW1Cg9PPJ5gnK46b?=
 =?us-ascii?Q?3IgAhKJeC7Jiqu1JxYC1ysBCgwo2tvIP9q7j1vye3Bo3ACm4GGt6xedhIS8V?=
 =?us-ascii?Q?24HBnXstnIj85/MDBAAHQaBRdIRR6DBenzK79/iHLTwUXda2KhO1jcI/pZDk?=
 =?us-ascii?Q?XyOH8zsCTPhczGa/WFu+CTXJ97ISgDtn3blSANrBxuQQgGv7zgGoSU7BKqbJ?=
 =?us-ascii?Q?viitTwUgEnMjx9X+rf4GDmUg7SiyzQLth47TPsj1/2rUUraGQntyNTroROVC?=
 =?us-ascii?Q?7mf4jtQHHLdJPh0pOb0liZ4wnqtc8+U3/K9tXmykkJowReltx6W05auipbqu?=
 =?us-ascii?Q?jJjQyHcVq+R/bj4vRyER60hxCBIm+uGizBQEEZ9YXCbe8afbtY1fhN/Zj23H?=
 =?us-ascii?Q?3F37aggHfGtddAMl/Kt+n+zNgDtpLFm+hJj0vNYiqdf2pOnPfHUsqdG8PW47?=
 =?us-ascii?Q?ajBsYfeCaLELNIAJJaIaPIS5Mrk/nDTIHAwRIJzxfLN9bxpyDB8t0PrL4EuK?=
 =?us-ascii?Q?iksjdF/ChdJ9G8SfsVfxbFc/WMyxEYF1gZ8MDRq1IOxTeDqzO4lune3Rzt1z?=
 =?us-ascii?Q?GyoZLpNGErgaSh1pX5nana6NT1AQJCpBajf7+Egxgxk20qrQLU7/CnpH+U1E?=
 =?us-ascii?Q?FbOT+uS1mjHc8kT8hyn71BJxOLqWTMEstCnzFgDLaKuoWmLKBfi8Ww0fw6ep?=
 =?us-ascii?Q?NiS7yorwOeAQItjg7i/j/QQMcgbohlAZGuDd87liCpGGpKVRrAuePvzUu8he?=
 =?us-ascii?Q?nvt2ROPsekIkVAh8WEc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550f3354-a96f-4e7c-eb4e-08dcb685f02f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 02:09:15.6017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ca5HxbmjBHvUJCu53eQxPN8gZ7w7l0spgxs6ccJOk70gW+T0NJR4wGTiagMjMjq2hczk3EI1Uj6VUQVtACap9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9230
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

this patch look good to me
Reviewed-by:Jesse Zhang <jesse.zhang@amd.com>

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Wednesday, August 7, 2024 9:59 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Kamil Konieczny <kamil.koniec=
zny@linux.intel.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koeni=
g, Christian <Christian.Koenig@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd=
.com>
Subject: [PATCH] amdgpu/queue_reset_test: fix list-subtests command failure=
 from script

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

If run command: ninja -C build test then the following is occured:
the process amd_queue_reset is terminated with error code 134 (assert), i f=
ound this editing script in igt-command_line.sh The following is the result=
 of execution:

393/427 testcase check amdgpu/amd_queue_reset                   FAIL       =
      0.23s   exit status 1
>>> UBSAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summary=3D1:=
print
>>> _stacktrace=3D1 MALLOC_PERTURB_=3D255
ASAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summary=3D1
/home/vprosyak/src/igt-gpu-tools/tests/igt_command_line.sh amdgpu/amd_queue=
_reset

stdout:
tests/amdgpu/amd_queue_reset:
  Checking invalid option handling...
  Checking valid option handling...
  Checking subtest enumeration...
    test does not exit with 0 or 79 with --list-subtests!
    test does exits with 134
FAIL: tests/amdgpu/amd_queue_reset
stderr:
skipping is allowed only in fixtures, subtests or igt_simple_main please re=
fer to lib/igt_core documentation
amd_queue_reset: ../lib/igt_core.c:441: internal_assert: Assertion `0' fail=
ed.
Received signal SIGABRT.
Stack trace:
Aborted (core dumped).

To fix the issue move the shared memory creation into igt_fixture block.

v2: Fix formatting errors.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 63 ++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.=
c index 04366c0bf..9ea0a1f24 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -754,6 +754,7 @@ is_background_parameter_found(int argc, char **argv)  }

 #define RUNSUBTEST     "--run-subtest"
+
 static bool
 is_run_subtest_parameter_found(int argc, char **argv)  { @@ -769,6 +770,7 =
@@ is_run_subtest_parameter_found(int argc, char **argv)
        return ret;
 }

+
 static bool
 add_background_parameter(int *pargc, char **argv)  { @@ -801,9 +803,9 @@ l=
aunch_background_process(int argc, char **argv, char *path, pid_t *ppid, in=
t sh
        int status;
        posix_spawn_file_actions_t action;

-       for(int i =3D 0; i < argc; i++) {
+       for (int i =3D 0; i < argc; i++) {
                /* The background process only runs when a queue reset is a=
ctually triggered. */
-               if(strstr(argv[i], "list-subtests") !=3D NULL)
+               if (strstr(argv[i], "list-subtests") !=3D NULL)
                        return 0;
        }
        posix_spawn_file_actions_init(&action);
@@ -907,30 +909,30 @@ igt_main

        int const_num_of_tests;

-       posix_spawn_file_actions_init(&action);
-
-       if (!get_command_line(cmdline, &argc, &argv, &path))
-               igt_fail(IGT_EXIT_FAILURE);
-
-       if (is_run_subtest_parameter_found(argc, argv))
-               const_num_of_tests =3D 1;
-       else
-               const_num_of_tests =3D ARRAY_SIZE(arr_err);
-
-       if (!is_background_parameter_found(argc, argv)) {
-               add_background_parameter(&argc, argv);
-               fd_shm =3D shared_mem_create(&sh_mem);
-               igt_require(fd_shm !=3D -1);
-               launch_background_process(argc, argv, path, &pid_background=
, fd_shm);
-               process =3D PROCESS_TEST;
-       } else {
-               process =3D PROCESS_BACKGROUND;
-       }
-
        igt_fixture {
                uint32_t major, minor;
                int err;

+               posix_spawn_file_actions_init(&action);
+
+               if (!get_command_line(cmdline, &argc, &argv, &path))
+                       igt_fail(IGT_EXIT_FAILURE);
+
+               if (is_run_subtest_parameter_found(argc, argv))
+                       const_num_of_tests =3D 1;
+               else
+                       const_num_of_tests =3D ARRAY_SIZE(arr_err);
+
+               if (!is_background_parameter_found(argc, argv)) {
+                       add_background_parameter(&argc, argv);
+                       fd_shm =3D shared_mem_create(&sh_mem);
+                       igt_require(fd_shm !=3D -1);
+                       launch_background_process(argc, argv, path, &pid_ba=
ckground, fd_shm);
+                       process =3D PROCESS_TEST;
+               } else {
+                       process =3D PROCESS_BACKGROUND;
+               }
+
                fd =3D drm_open_driver(DRIVER_AMDGPU);

                err =3D amdgpu_device_initialize(fd, &major, &minor, &devic=
e); @@ -964,7 +966,7 @@ igt_main
        igt_describe("Stressful-and-multiple-cs-of-bad and good length-oper=
ations-using-multiple-processes");
        igt_subtest("amdgpu-compute-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH")=
 {
                if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.a=
vailable_rings, &ring_id_good, &ring_id_bad)) {
-                               set_next_test_to_run(sh_mem, CMD_STREAM_EXE=
C_INVALID_PACKET_LENGTH,
+                       set_next_test_to_run(sh_mem, CMD_STREAM_EXEC_INVALI=
D_PACKET_LENGTH,
                                                ip_background, ip_test, rin=
g_id_good, ring_id_bad);
                }
        }
@@ -972,7 +974,7 @@ igt_main
        igt_describe("Stressful-and-multiple-cs-of-bad and good opcode-oper=
ations-using-multiple-processes");
        igt_subtest("amdgpu-compute-CMD_STREAM_EXEC_INVALID_OPCODE") {
                if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.a=
vailable_rings, &ring_id_good, &ring_id_bad)) {
-                               set_next_test_to_run(sh_mem, CMD_STREAM_EXE=
C_INVALID_OPCODE,
+                       set_next_test_to_run(sh_mem, CMD_STREAM_EXEC_INVALI=
D_OPCODE,
                                                ip_background, ip_test, rin=
g_id_good, ring_id_bad);
                }
        }
@@ -997,11 +999,11 @@ igt_main
         *      }
         */

+       //amdgpu_ring_soft_recovery
        igt_describe("Stressful-and-multiple-cs-of-bad and good shader-oper=
ations-using-multiple-processes");
-       igt_subtest("Handful-by-soft-recovery-amdgpu-compute-BACKEND_SE_GC_=
SHADER_INVALID_PROGRAM_ADDR") {
+
+igt_subtest("Handful-by-soft-recovery-amdgpu-compute-BACKEND_SE_GC_SHAD
+ER_INVALID_PROGRAM_ADDR") {
                if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.a=
vailable_rings, &ring_id_good, &ring_id_bad)) {
-                               //amdgpu_ring_soft_recovery
-                               set_next_test_to_run(sh_mem, BACKEND_SE_GC_=
SHADER_INVALID_PROGRAM_ADDR,
+                       set_next_test_to_run(sh_mem,
+BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
                                                ip_background, ip_test, rin=
g_id_good, ring_id_bad);
                }
        }
@@ -1009,7 +1011,7 @@ igt_main
        igt_describe("Stressful-and-multiple-cs-of-bad and good shader-oper=
ations-using-multiple-processes");
        igt_subtest("amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SE=
TTING") {
                if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.a=
vailable_rings, &ring_id_good, &ring_id_bad)) {
-                               set_next_test_to_run(sh_mem, BACKEND_SE_GC_=
SHADER_INVALID_PROGRAM_SETTING,
+                       set_next_test_to_run(sh_mem,
+BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,
                                                ip_background, ip_test, rin=
g_id_good, ring_id_bad);
                }
        }
@@ -1017,7 +1019,7 @@ igt_main
        igt_describe("Stressful-and-multiple-cs-of-bad and good shader-oper=
ations-using-multiple-processes");
        igt_subtest("amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_USER_DATA"=
) {
                if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.a=
vailable_rings, &ring_id_good, &ring_id_bad)) {
-                               set_next_test_to_run(sh_mem, BACKEND_SE_GC_=
SHADER_INVALID_USER_DATA,
+                       set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_I=
NVALID_USER_DATA,
                                                ip_background, ip_test, rin=
g_id_good, ring_id_bad);
                }
        }
@@ -1033,6 +1035,7 @@ igt_main
                drm_close_driver(fd);
                shared_mem_destroy(sh_mem, fd_shm, true);
                posix_spawn_file_actions_destroy(&action);
+
+               free_command_line(argc, argv, path);
        }
-       free_command_line(argc, argv, path);
 }
--
2.25.1

