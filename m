Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229FEC982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 21:16:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04AB10E37B;
	Mon, 21 Sep 2026 21:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ma7BOVBr";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010069.outbound.protection.outlook.com [52.101.56.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2FE10E96A
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 21:16:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bahJrADU950vhIXaK5A8/w7FraunyEO/5ykIcGetZYLMI7fnDAOG7OZsI9+0Pl7hSBs3AidY6CNjTNSYyCheyb6tSGK0J50JXF85hyxzHa4AseCOF5fmH2yUp3AF02rqNSA18+f1ZXWTrXOagZKXaMG3s8Nkn+W6aFo1/XNcKNL0NdR3FaO47r1c22DcX2ljzMSIz6yRwM0s2xVIyCy+Vjx6qFJnm3Xy+BPftfnzIGVZvvh9oSX6fT2d5L0WEoz/V3GLZ++oGJFvwS92SunNxLaolopQO/xi8yDG2892DFgX4Sv8FVhZXIJ8ljF+rgFTH6CCe7xNiNvHjaPctpqhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uQbuZ3SToU55QZT42A+S4RnrxqOqIXqCzXNZeqmo8c=;
 b=gb2q3XVqeQMYIwTl77BjIIyUHUeMwlO5DpQQABiIK4HJL3MbpJ4YLOqUlRTCbycSjJg0T1M9++cykKNN2XJcCHVeERTzl4BIjE4CCWa5b5/3FdEyJPf/t43iikPMWBxNiS3Y/lc7wruhO098Ir+5CqGlgGl+so/2KNHihfT3XxQQE04hES5vXvy7K1tG07IIfaJLYn1vQMFhjHQ2ovvj57jFOReGv6/mH46hqhiE/CgJeYly+1Vkh2XgT/e12jmnZKtHebCM9btyQVcW4gp98m9kRRsmFkI80I2x3OGKjVRu2rXP5wT+GSuZYJEpE9x6MDH1wPatB19TNueq9wLSHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uQbuZ3SToU55QZT42A+S4RnrxqOqIXqCzXNZeqmo8c=;
 b=Ma7BOVBrxeJqV81rm26yZM8uL+Z1973Cb1vJYkteMx9szb+K7uNvQMUv0JCIOUwKRnjnYXu113dCNc5X+mSfH5srUVaxaDOayl1dFjee6+3nbEMtVondspanWUqkbgk4IiYvqJV6DZ3nvYVcox45EQ1Jc/iD3Hs7FIEbEgdXuFY=
Received: from BN9PR12MB5367.namprd12.prod.outlook.com (2603:10b6:408:104::11)
 by SA3PR12MB8440.namprd12.prod.outlook.com (2603:10b6:806:2f8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 21:16:04 +0000
Received: from BN9PR12MB5367.namprd12.prod.outlook.com
 ([fe80::68ac:2185:bb07:ae24]) by BN9PR12MB5367.namprd12.prod.outlook.com
 ([fe80::68ac:2185:bb07:ae24%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 21:16:04 +0000
From: "Qi, Tony" <Haoming.Qi@amd.com>
To: "Hung, Alex" <Alex.Hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/amdgpu/amd_cursor_overlay: include fcntl.h for ARM
Thread-Topic: [PATCH] tests/amdgpu/amd_cursor_overlay: include fcntl.h for ARM
Thread-Index: AQHdSg365SIthuYcpEisMx5yFi00fbbZiKJQ
Date: Mon, 21 Sep 2026 21:16:04 +0000
Message-ID: <BN9PR12MB5367BAAE6932AF0D0EC5701880842@BN9PR12MB5367.namprd12.prod.outlook.com>
References: <20260921211052.789426-1-alex.hung@amd.com>
In-Reply-To: <20260921211052.789426-1-alex.hung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-09-21T21:16:03.749Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5367:EE_|SA3PR12MB8440:EE_
x-ms-office365-filtering-correlation-id: 2a57f37f-14b5-4336-1894-08df18258b76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|56012099006|8096899003|22082099003|18002099003|11063799006|38070700021;
x-microsoft-antispam-message-info: hDM6AIUSwvzXcQe9eeQLYmPV3wvaNeKJ9FhF0zIKn390R6knpAjrsfrh2tkaSxF4H11yQ+Z8vpprlkj/204SAal08JUn9/1+o4+DJnbFrCxMF/4RSsBnSLkFoNcIKJj/FFMQgKSe2TBVzfigSa2MDEmk95gTnkXTqNWXEU8qIuFqFXyGsyW6pYTdhRGcX+J9dfDAaV3WPPiS1wWW3QwiFkauJ7WhiiSBw/CewaBSnGiBYtCnh0BoMrli7fLtqmJoOVQQH3ENxpqjFzlq1WwdkZ0WjR5Q6FI3JIpAodx83l6jJ+3nHXDvM1pkqVR6/DLirnvDtrMoOEc+gEXTtBsmQLrb5jnM4H04Ci9VoqdB4e+4+aMAYgWyt2EcJmjdlYhn3dPUHBzyHgX3vjg2Nrlt1KGAg0vAFJI39BZph/UEM5eaF6laxc1rBfNoGaCUHFXz2MTyJB3HvnE2EqIzjKIcToMxrrfGLl8mVQGEfJyJXrMMpSeuLfeNXyNA/je3MLupOntpmNNOGG8zG7qKTsXPTxwl8NwRe8wfjUX+pMgxfvDZ9Mo8EZiYpXQpmkif/vvr7qxmnEFXgqAS6tBGmpfUYLV7b2OaNsXrzxfRlW+FOmbzwm1qMEpL5V7I6hxVqVoXu67YU/J/tTn3WHoWKk3BtkvWOssIJqcg/18GvmWJlQgY0ViZU2I1cINn2fsTyvD6j3QXeNEQRBWM6c+NM22ZNYC25NrPS5nKF7iAgUt8fmQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5367.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(8096899003)(22082099003)(18002099003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pfOx9q8cUm9Ihu/9lWEI5P/B0Fm3kuvFQ4+U0ID55PGXqcyA8FyLWeyyrMeH?=
 =?us-ascii?Q?JikCywzdfXb2/LXaQygXI1AvVKGg4xgK7qWnDHFupFdsfnHljhFxLNYJW6Sw?=
 =?us-ascii?Q?+lOUTkqw3fK75mtVDX4ZjqCcg5Ee3U+fwh4JgUJVbaZ+ljDAPu/ChyyeuL6M?=
 =?us-ascii?Q?3XzRWkppXZkqEDJ7Ze8mP2w9S13P+d1zDxgHEXEkparHEAbs/Xf56CeEKVyf?=
 =?us-ascii?Q?YgN2KNolYW/GS8KFWqvQFI6a4967qie3yZqJqO5R+JW38fuhgWIbND13j3xv?=
 =?us-ascii?Q?XVGK9gbXL+SL9FcKLZvdU63vYYhzxUXZlLzUhx4LE51bGrqAB8Lb6nG/Nyt5?=
 =?us-ascii?Q?gS285dVU6KUKHUeNXv/bjfDXTn5YiiomEVS3WxSCSKi+bx529oTuZ1NzM2+p?=
 =?us-ascii?Q?psW6BtI0Lgd6q916scPJco4zJxTYlE7jdq2lEJawIz02khqcWraBHFZAy4aD?=
 =?us-ascii?Q?v29N3mWp3EVhizOUKnauNA9Ok6EFvFjtvFlff/+ZNyDEv4Fexm0bmJPliI9m?=
 =?us-ascii?Q?9QdPl9G6PnHtrwjfNO3E2RjLQK+8+Ge2citUKJurxU/taPk1WUudAgBIR3Qc?=
 =?us-ascii?Q?wvU6iZ0gjiSigUBBgya79K5BWzBNRSs5To7QOyvW7OwnMaRURbcKOP4TT9os?=
 =?us-ascii?Q?B75crl0hPppBHtgyc7AjBXgD2GR2na0pGT7dRCL5MSiyItaohbMK5GftAwPw?=
 =?us-ascii?Q?oMMKv7IGfldY9E4yHcndW3NWPVxccX3B5VERVBcdVRaC6XHaYPF9UWswI682?=
 =?us-ascii?Q?vzAoW1lluKio1FpKSgwPUhEB27ZyWAnI4NlwOe0CqlGK796x49foLhIRdxuZ?=
 =?us-ascii?Q?ZwiWhhJZ0F7apR1qXYQfDj4KsA+l3w/HrhgAfVkkE22etVRb/RURvjohUtqf?=
 =?us-ascii?Q?8UQkwO7Z0CG8yCRdkCrMQRcLq1o+mLYWM034zVJ/v7TkKVEq3adZeYCAll1U?=
 =?us-ascii?Q?lihS3n2pEm6HOvHJ4iFK67q2cCqTDxUGkUunJ2MxUO+KVm4y/J19MfUBiSTW?=
 =?us-ascii?Q?oNzv9HVzaKY/1CSAQJNYXYF5sUSAGftrmNeUXGyoVWw7ykm4wr+powYI19Lr?=
 =?us-ascii?Q?berlWa5ATBWO7H6AxEyn3+ZTAcbV9HwQaaBwxIfX1+W3VYbJGFXuoF+LxOpJ?=
 =?us-ascii?Q?aInSJli+/VjQpN8yOJfd1OhQisxrUTuh7NW+k1a9tKrVBc4o4O8Xik+0gykD?=
 =?us-ascii?Q?h9imXHw2RqhN16kNQYqZpxmMAN5RK14yLcbFGqCSXflrNVLJA86vVDmM2oUI?=
 =?us-ascii?Q?W0OBJWD05tFVrZJ8CiwDxCyju1tSgpbjWZ1f9PZHU1JmIdXR7X+gfN8WjGeO?=
 =?us-ascii?Q?GjysicFMXqFDNrP2plvIY5WxLDE+6ZJJY0mATO03ggI+3eWNWIV0cq3wPBUy?=
 =?us-ascii?Q?1IXXj1pvrNIuSCHPptVHfjpK4t6PBcF4kpNsdIgPskJVDPYttqAOPSmqTXvu?=
 =?us-ascii?Q?xPriG86kZqEBstyfp+jpM/O5bdi9qwMJ7beF/dnjj+qrzzI5jmZ8nhgFWr5M?=
 =?us-ascii?Q?Lr36Pi5tm4YlTLUcFTciuzY5+VrIUIQQ4QNLoM4ZcddJ6c9Wuz0b5WpVySfY?=
 =?us-ascii?Q?ue9pGOlRIbcds5guh9ae5VXItaCNeG5WZHMAklLyqah/0z6jCSyHCbrLZJgv?=
 =?us-ascii?Q?D0W2+vjryUGDMCIjAuJ1ccVtnV/03XT4oYd41RYBsSg/f/quynP3B9Z7PwXU?=
 =?us-ascii?Q?r+fyP8RsRbxkdARRNXzrQpeq2jM=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BN9PR12MB5367BAAE6932AF0D0EC5701880842BN9PR12MB5367namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a57f37f-14b5-4336-1894-08df18258b76
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 21:16:04.1669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+sb9+vmxLDc8QML0wB6WoWFpN4lR9h3xQHiJkwegk/OVJgbmYQDjjCtZnDcwztt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8440
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

--_000_BN9PR12MB5367BAAE6932AF0D0EC5701880842BN9PR12MB5367namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

AMD General

Reviewed-by: Tony Qi <Haoming.Qi@amd.com>
________________________________
From: Hung, Alex <Alex.Hung@amd.com>
Sent: Monday, September 21, 2026 5:10 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Qi, Tony <Haoming.Qi@amd.com>; Hung, Alex <Alex.Hung@amd.com>
Subject: [PATCH] tests/amdgpu/amd_cursor_overlay: include fcntl.h for ARM

O_RDONLY is used in get_max_downscale_src_width()
but fcntl.h is never included. On arm64 and armhf the
macro is not pulled in transitively, so the build fails
with "'O_RDONLY' undeclared".

Include <fcntl.h> explicitly so the definition is available on all
architectures.

Fixes: 520aba273f39 ("tests/amdgpu/amd_cursor_overlay: skip scaling subtest=
s unsupported by hardware")
Cc: Tony Qi <Haoming.Qi@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/amdgpu/amd_cursor_overlay.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_ov=
erlay.c
index 166f9b928..7af48d74a 100644
--- a/tests/amdgpu/amd_cursor_overlay.c
+++ b/tests/amdgpu/amd_cursor_overlay.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: MIT
 // Copyright 2025 Advanced Micro Devices, Inc.

+#include <fcntl.h>
+
 #include "igt.h"
 #include "igt_kms.h"
 #include "amdgpu_drm.h"
--
2.43.0


--_000_BN9PR12MB5367BAAE6932AF0D0EC5701880842BN9PR12MB5367namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: black;">
Reviewed-by: Tony Qi &lt;Haoming.Qi@amd.com&gt;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Hung, Alex &lt;Alex.H=
ung@amd.com&gt;<br>
<b>Sent:</b> Monday, September 21, 2026 5:10 PM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Qi, Tony &lt;Haoming.Qi@amd.com&gt;; Hung, Alex &lt;Alex.Hung@am=
d.com&gt;<br>
<b>Subject:</b> [PATCH] tests/amdgpu/amd_cursor_overlay: include fcntl.h fo=
r ARM</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">O_RDONLY is used in get_max_downscale_src_width()<=
br>
but fcntl.h is never included. On arm64 and armhf the<br>
macro is not pulled in transitively, so the build fails<br>
with &quot;'O_RDONLY' undeclared&quot;.<br>
<br>
Include &lt;fcntl.h&gt; explicitly so the definition is available on all<br=
>
architectures.<br>
<br>
Fixes: 520aba273f39 (&quot;tests/amdgpu/amd_cursor_overlay: skip scaling su=
btests unsupported by hardware&quot;)<br>
Cc: Tony Qi &lt;Haoming.Qi@amd.com&gt;<br>
Signed-off-by: Alex Hung &lt;alex.hung@amd.com&gt;<br>
---<br>
&nbsp;tests/amdgpu/amd_cursor_overlay.c | 2 ++<br>
&nbsp;1 file changed, 2 insertions(+)<br>
<br>
diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_ov=
erlay.c<br>
index 166f9b928..7af48d74a 100644<br>
--- a/tests/amdgpu/amd_cursor_overlay.c<br>
+++ b/tests/amdgpu/amd_cursor_overlay.c<br>
@@ -1,6 +1,8 @@<br>
&nbsp;// SPDX-License-Identifier: MIT<br>
&nbsp;// Copyright 2025 Advanced Micro Devices, Inc.<br>
&nbsp;<br>
+#include &lt;fcntl.h&gt;<br>
+<br>
&nbsp;#include &quot;igt.h&quot;<br>
&nbsp;#include &quot;igt_kms.h&quot;<br>
&nbsp;#include &quot;amdgpu_drm.h&quot;<br>
-- <br>
2.43.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN9PR12MB5367BAAE6932AF0D0EC5701880842BN9PR12MB5367namp_--
