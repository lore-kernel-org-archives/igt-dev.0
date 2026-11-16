Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4615A606A322
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 20:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=j7/cpiOp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39F410E475;
	Mon, 16 Nov 2026 20:36:58 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012055.outbound.protection.outlook.com [52.101.53.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E63310F453
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 20:35:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Akibumf3rN0VlM8+dpty89G8o27G0OjFJ0rw6Af5tIQ8pNwGAhbYquBEOZ/bnmErM3OrCKVKM0AoAZ/8JrbT3P0PBjqLnMrHNDDQH4MSGC0FliAtKWXKevyoZckf/IBbC+KvvgLPKw+gtwB8eWCDRMxAlpFHv/RTndaLNRTEgn3TjFOMw1iLWN3RA6wW7fyF6YiukJUpBfLhlQtF1X34C+22AvzgQsLhvF5vx6r7lUJBcB1544d5HZr51XQ1pqXaL6yDOCRKxOHOD4EODD4makT2SdBVMHMZFZYVUXyD8aNO9r5IDv+k8bbqYDKy6mJRNU9epJAHyRhW3rGFcCoceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDyEIjTJrZDtmMoVuh4pN3RJQywf7i1I5eIy262ENKQ=;
 b=qEeOYmhL3QoXozI0/64nmS1k3UzLfpvKYERIteGauOusaSePA/nyrzS8pq4ndl8BlmtNtyYIBqi5zr3I2ZebFvFiyg+O6WH2QWPuPZWE4o65zAGSvQwH+uQ/9aw6XUfq75wZECGNtFFCoT9RgEYJ556ehkn8Pa81fhFbLixrh+1y6x3FpFSGOJVs8U6baiUo5Y+iEu3BUg2e4+xp768D2F7+aWtIgUFVolcLKJFr2iYklZkJyV/7ldjrz/cgz9Yrb4fOw5mcrp6SbVjCYJzqPJ5tyLiRDKuENL6I/ujNQM32HJJHCyRkIJVOpYAqur1aZv/LiAF3tq01DejXQFO6Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDyEIjTJrZDtmMoVuh4pN3RJQywf7i1I5eIy262ENKQ=;
 b=j7/cpiOpo5N2NYNwara+XBwT4/jjOsSsXccpH95HuvgNFhaMO7m87EpMcO/4nSEPTiB9jCZvbu9rh0FCh9dHmRHzF3oEcP4UyeVSyIud1cEuEOvlXCgePWTRuduU+ZxDp6N+9iMk0/9QtBa4rO6MxgefLFrWWSnHuuqi0BGcwLY=
Received: from BN9PR12MB5367.namprd12.prod.outlook.com (2603:10b6:408:104::11)
 by CH3PR12MB038898.namprd12.prod.outlook.com (2603:10b6:610:361::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 20:35:51 +0000
Received: from BN9PR12MB5367.namprd12.prod.outlook.com
 ([fe80::68ac:2185:bb07:ae24]) by BN9PR12MB5367.namprd12.prod.outlook.com
 ([fe80::68ac:2185:bb07:ae24%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:35:50 +0000
From: "Qi, Tony" <Haoming.Qi@amd.com>
To: "Hung, Alex" <Alex.Hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Wentland, Harry" <Harry.Wentland@amd.com>
Subject: Re: [PATCH 0/3] tests/kms_colorop: reduce test run time
Thread-Topic: [PATCH 0/3] tests/kms_colorop: reduce test run time
Thread-Index: AQHdc9zVYZfyXjqIiEaGqtrMq6I/QbcxHoBA
Date: Mon, 16 Nov 2026 20:35:50 +0000
Message-ID: <BN9PR12MB5367126A95639170EE18E6D7807C2@BN9PR12MB5367.namprd12.prod.outlook.com>
References: <20261114020614.830491-1-alex.hung@amd.com>
In-Reply-To: <20261114020614.830491-1-alex.hung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-11-16T20:35:50.079Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5367:EE_|CH3PR12MB038898:EE_
x-ms-office365-filtering-correlation-id: 867992f0-aac0-48c7-d677-08df442133e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|10067099003|11063799006|56012099006|261022075727099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|18002099003|22082099003|8096899003;
x-microsoft-antispam-message-info: 6G6iQJikiwb1gTna4m7QzYhZrLq8S6xZkElL+C8eaqJUbuGLjjKoB+OHpvTZyuEcbAQz636GOfaUoAAcEWKTPN8lLwxW6CsxJ5Z0WF0eImIjRbVG0q+dNajWsFQ+9aPZKK2+jxuD/LlXiVXx9c6p8xOrFat/zjtn05/WE7YHOVooMFqmSOycsnTdBycP1Z+HcQKvlis9sap7wJ8bW6eKBWXn0etwn8veKk+wMDrSU9vXR0101MGInLEVGGUriuDRCCwTUcYn2hD0j8fCNz8aZhCo6iUZhZMItr5CJaEbYipehpRxA2ReXW9E0bl1Rq93Vm4tBLzInOv580xbdbTmjeVJDhaCNMZ6dHVY6bp7evegSt9TI0EMen2wRpMJr5oWtPoSBZOoGMZY3aNCCYkkB5yCsfXq9D2+3Ph66JBr9JwGSQkK+Wdyghn9oYkiQRByxB2XQ7fR9ztzweAkhSt+vzvAX94L70f98nCMZHBd8RWeyYSa+m8vMs7xgXNBetpSZeYqvCVFhguKQiV1mxV0lx5WqygxBcdp9ML6PN0VGdJlx3oRpI2lrGBrxE6YLGSBoX7jG1jItxeLK28yhMvl3i9VTTPxYKQNC4rK1gci66oDeiLh7EBPXIKyWhtRkwJKcC5iSi/AlfCkR+KBB3szpAQrXk71nX7WLRmEUg476JomO0waRaHXuLVipQFj/N8mSLMTSBwCT1SeuJ1UhlytQHV3fEZSli8DyZ0oMDLZTvM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5367.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oG/prGE4ValKboOxWwyrUTHhMTqloozTk4inTZmel+kNlP33/g3gZdNPuqmK?=
 =?us-ascii?Q?6FRViz1c4dDqp+y/Y1ff0ZkU4meC3E5htImj2UWQ5fb0dmcTesLWbJOIX5Uv?=
 =?us-ascii?Q?gk4jNZF1lufIXb3uBQkKY4GGRv98Mw0VDG0Um8LzKO8IOatp2a03Ey1bzOQl?=
 =?us-ascii?Q?lOHmXIL3a8XpRJ3sYQeWKkU6c+gBTrZo0dnH5t17UQkYY+Ts/V+FtkPC+Nur?=
 =?us-ascii?Q?hkAk8XwbIPHxcO3CXywHhV0k5ghf1T1YKOc1I4p9K0/gPLQSxRpsjBzLKxRm?=
 =?us-ascii?Q?5ieOf+NNjlNKU1DA019RoTXTTgywi6PsUv7LPEnnaB6CXvsApXBDdW7xN6jF?=
 =?us-ascii?Q?D827ZB7Rud8aQmGYlywcXuPdbQHyB2xElhC2LIdtN4fjHen+aDhI3fl8Smif?=
 =?us-ascii?Q?VTmZCksWlh0DJM+td1UwmrvwTD7gqCRAC5alB5WhjDDLlLjBFmIXPWlLKDNO?=
 =?us-ascii?Q?zhfaL5Jq+Ntbcm8339FvfGoCcvbuqt2pzrM+X8bNSC/aKHkrZALlDqDK6TVH?=
 =?us-ascii?Q?igLO/N7nOdaOi8lWkr3rOUKu2sOebH0ZJukyIs/bPiOx6OX/btkXQwmjd5eq?=
 =?us-ascii?Q?KPVFTTpAwNhf3l0o/OTIDeMStzMFL84qzspvm02JI/KQ2kvq45rwDz0b9TIk?=
 =?us-ascii?Q?LcUTT6gpq7zYGMDrLD0g2G1QcdSiY6g4pL47nDZBVY6wqUH12i2fHV33DgEF?=
 =?us-ascii?Q?nI+dxiSoPhKf5MGoujmzgs0Yc91uRYouBWCuXWw1/bK3WF6A4BvPp+MU2Ok7?=
 =?us-ascii?Q?E5BBmbnMgT+O+m2SdNHP1/aeTPoEhoQVCbge6tujdgAZJgBV8d5xAWIvvR5R?=
 =?us-ascii?Q?dkfLfb46DuYxpoLD1jHojsyPg41yYKw1RWdpk1DKZWEKdireQfZ96DfUX/+w?=
 =?us-ascii?Q?XjTW3g0aYCHT0II61EuyPppWsS7ovAlixCYvVW6KTM1MzxgroPlqMZ7nTtQO?=
 =?us-ascii?Q?6gToK7o8EJwTcvabI+nTVb9p79D3dPHLzChKygT4Vco7tpFrGLeK5Bo8N8mI?=
 =?us-ascii?Q?HB34dSOXW9BqQyTMMnXI5/yZsQSSbWI6Rzshlc2eycWfpn/e5qzcHBXVZKZi?=
 =?us-ascii?Q?QZuPCXX5z3jwbAX8+Nmc01tlLuvXEUok6MPOgV+dDM28oe5UO3awVnBpcJY1?=
 =?us-ascii?Q?zXdM+GHoSQUKcxEQ7EM5UXSNaamd6ScytPSNU//BX7XVBTWueT9TSGF7ODN8?=
 =?us-ascii?Q?lVRSAxW75PHD0P0F0ZAEcGLJ8PypU+R+h2/l8QzV8JzKYYyd9Lfbx1KkEpup?=
 =?us-ascii?Q?vsm988aRChrr5wlJh+toPDhUVMsErPru2hImmY0fhswrnJ+0OEPLkSl0MQUF?=
 =?us-ascii?Q?TBqL3KJVv28E7+lD0cmYzesJxVp32vUBAhFMvCeA0TKQmSaEpSzHp7471HCz?=
 =?us-ascii?Q?/4G9b+vJ8Pj4aD73pZDofUvDKEIuUIjhUopoQARWq58agZxwMu0w0ClF+F8X?=
 =?us-ascii?Q?xAR0mwXeEmF8wnKa1jFlZF0OmjloUTG6pf7AATSN96GWgeOebbl/orUQr3VT?=
 =?us-ascii?Q?bboW2VuBBBoz4yFd7HQomQf670Wil1A2wDeAfJjLbtzBsbEI9drvvQMwzZBn?=
 =?us-ascii?Q?pQo2FptzeP+fSFTNZAyYcf2y3fl4dc5IHKqfu86B6J/9SSBhFzP8akw8s74v?=
 =?us-ascii?Q?PfWYoTZMJlrtA4ea1LrJQaH3CwWiWMBe1SNvWSyjVYGT+VrSeVgL4/WcrrJ3?=
 =?us-ascii?Q?yugg0EPiMxxBnL7XH/1/IQ2CRoE=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BN9PR12MB5367126A95639170EE18E6D7807C2BN9PR12MB5367namp_"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 867992f0-aac0-48c7-d677-08df442133e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 20:35:50.5032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VkwLTZ/FszfDrklGEjdx14hVXH4iW9RSFJzhqvKGUGEF28S07xobSjvNYKNoG7FW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB038898
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--_000_BN9PR12MB5367126A95639170EE18E6D7807C2BN9PR12MB5367namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

AMD General

Tested-by: Tony Qi <Haoming.Qi@amd.com>
________________________________
From: Hung, Alex <Alex.Hung@amd.com>
Sent: Friday, November 13, 2026 9:06 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Wentland=
, Harry <Harry.Wentland@amd.com>; Qi, Tony <Haoming.Qi@amd.com>
Cc: Hung, Alex <Alex.Hung@amd.com>
Subject: [PATCH 0/3] tests/kms_colorop: reduce test run time

kms_colorop spends most of its run time on setup and framebuffer
accesses rather than on the color pipeline checks themselves. This is
worst on hardware where CPU access to VRAM is slow, like DCN 3.0.

This series:
- skips subtests before touching any framebuffer when no color
  pipeline matches the requested colorops,
- sets up each subtest group on demand, so a process only pays for the
  groups whose subtests actually run,
- checks the writeback format list before creating probe framebuffers,
  and creates them once per connector instead of once per CRTC.

Run time of kms_colorop, before -> after:

  DCN 3.5: 0m11.116s -> 0m7.401s
  DCN 3.0: 3m32.316s -> 0m16.382s

Alex Hung (3):
  tests/kms_colorop: skip early when no pipeline fits
  tests/kms_colorop: set up subtest groups on demand
  tests/kms_colorop: check writeback formats first

 tests/kms_colorop.c | 324 ++++++++++++++++++++------------------------
 1 file changed, 150 insertions(+), 174 deletions(-)

--
2.53.0


--_000_BN9PR12MB5367126A95639170EE18E6D7807C2BN9PR12MB5367namp_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Tested-by: Tony Qi &lt;Haoming.Qi@amd.com&gt;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Hung, Alex &lt;Alex.H=
ung@amd.com&gt;<br>
<b>Sent:</b> Friday, November 13, 2026 9:06 PM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Qi, Tony &lt;Haoming.Q=
i@amd.com&gt;<br>
<b>Cc:</b> Hung, Alex &lt;Alex.Hung@amd.com&gt;<br>
<b>Subject:</b> [PATCH 0/3] tests/kms_colorop: reduce test run time</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">kms_colorop spends most of its run time on setup a=
nd framebuffer<br>
accesses rather than on the color pipeline checks themselves. This is<br>
worst on hardware where CPU access to VRAM is slow, like DCN 3.0.<br>
<br>
This series:<br>
- skips subtests before touching any framebuffer when no color<br>
&nbsp; pipeline matches the requested colorops,<br>
- sets up each subtest group on demand, so a process only pays for the<br>
&nbsp; groups whose subtests actually run,<br>
- checks the writeback format list before creating probe framebuffers,<br>
&nbsp; and creates them once per connector instead of once per CRTC.<br>
<br>
Run time of kms_colorop, before -&gt; after:<br>
<br>
&nbsp; DCN 3.5: 0m11.116s -&gt; 0m7.401s<br>
&nbsp; DCN 3.0: 3m32.316s -&gt; 0m16.382s<br>
<br>
Alex Hung (3):<br>
&nbsp; tests/kms_colorop: skip early when no pipeline fits<br>
&nbsp; tests/kms_colorop: set up subtest groups on demand<br>
&nbsp; tests/kms_colorop: check writeback formats first<br>
<br>
&nbsp;tests/kms_colorop.c | 324 ++++++++++++++++++++-----------------------=
-<br>
&nbsp;1 file changed, 150 insertions(+), 174 deletions(-)<br>
<br>
-- <br>
2.53.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN9PR12MB5367126A95639170EE18E6D7807C2BN9PR12MB5367namp_--
