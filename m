Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B46B606A333
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 22:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qIFlzQzy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE80112098;
	Wed, 18 Nov 2026 22:25:20 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011014.outbound.protection.outlook.com [52.101.52.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC65112099
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 22:24:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvVPUhlhtWCfDxh7Xr7i/pBYYum8pGuDX5im5jIqrxUB4Zik5BjI7vCehjF43Lni7iEzXKpNi76n3Ou65E0eO46+gIKxonYeBhzaM/E75jBJlwAQuzNUAuFPcjU6QFqew0fxWI3GLTXFV1oWOOeU5pjYnijjQsmOlgfJdzJgCw5d7Vn/FJInsrq3IkWCHr3sbwnIXD03Pf+pzZuWLjSCxKab723D7GcbzXTUyICh0hxplJhFnI6pGTKBmw9d0R3n2ERvFrKb6xh6by1so+nyp57Y1JpzYgNKOSfohqHpFb6rCaG2bCyY+LOGmkaW/ayzZ2ZhBBhZODc9Gxn946G3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=legXMbl071NYDOsl6ZzGU5qyemZcQwfuQAENUFauYEs=;
 b=u8jESrFFad0D/5QaKmubhULQTA6N8CKGygymr7TTBf24ag7UyaFtzM+Tq+cmov9m9GypdsDoXoF5ijEHU2+oQsgkWi23GqZfGrX8tTxRg+l4rC0wKxjZuWQffmLIUjbKt1OJ8RGPAjvilgCRIe1TGLkkaQYhtShQxyZoqt4sbmAZuBojkNw5HoikFyXlCwjVGqUPjbMbqlq6C30rbaD5RjX+wL/NSjIjOypEXMErdKV9YHxS6yCpSx8cUSrSMRSk1VPqUlsdJ4J5QkZaVjaUOYZ+cPqnWkymHDcAa1UEZ+Wu8L8RmyF4Nlff8uDuCN0PlvFg1qb9znhn4szv+KCSMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=legXMbl071NYDOsl6ZzGU5qyemZcQwfuQAENUFauYEs=;
 b=qIFlzQzyvKo2ChJqd2RUxtwgPsAitnvlYQ/cv/lczmcQY2e1cPMxguUdtFtXLemdhjFQk5jLorfRhaVgwiaS+edblODlUVBc/5nTdw1Zu3CLmpTeXdU7caabNjJQUD7xaIcV0cdy3Vu6eZ4ZxwsNdRR1uIAFuV8FDUljAW3kNbc=
Received: from BL1PR12MB5364.namprd12.prod.outlook.com (2603:10b6:208:314::18)
 by DS4PR12MB9817.namprd12.prod.outlook.com (2603:10b6:8:2ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 22:24:14 +0000
Received: from BL1PR12MB5364.namprd12.prod.outlook.com
 ([fe80::805e:8185:7751:bc0f]) by BL1PR12MB5364.namprd12.prod.outlook.com
 ([fe80::805e:8185:7751:bc0f%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 22:24:14 +0000
From: "Qi, Tony" <Haoming.Qi@amd.com>
To: "Hung, Alex" <Alex.Hung@amd.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Wentland, Harry" <Harry.Wentland@amd.com>
Subject: Re: [PATCH v2 0/3] tests/kms_colorop: reduce test run time
Thread-Topic: [PATCH v2 0/3] tests/kms_colorop: reduce test run time
Thread-Index: AQHddh561ykYX29Zikq5AnVsglbsAbc0ZpgH
Date: Wed, 18 Nov 2026 22:24:14 +0000
Message-ID: <BL1PR12MB5364837341F838D7E046AB0C807A2@BL1PR12MB5364.namprd12.prod.outlook.com>
References: <20261116230048.2020931-1-alex.hung@amd.com>
In-Reply-To: <20261116230048.2020931-1-alex.hung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-11-18T22:24:14.094Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5364:EE_|DS4PR12MB9817:EE_
x-ms-office365-filtering-correlation-id: 35d9f1dc-fa80-47e6-6a2f-08df45c2ad88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|8096899003|11063799006|56012099006|261102123227099003|10067099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|38070700021|261021123027099003|261022075727099003;
x-microsoft-antispam-message-info: eyE8vL9HjQ7DH4cIa+WVYowZ4HB57WGLrpFFuVv09iId9uNRe8HjQPpz0HjFytvMr7mx4CrEEHWVA0PYK5LDYohGYKHJ+jNliQgWnJ3lkhXdZz5hdeev9w8W6/RvZY6RCuHMCbdhpD2VisCZ4SKfhN/mVSDBoBmiboQT+3Nz0VH3AkW7Ue/IpBH8xDGcjfNn/rKl5DeBdh3tQIfKUNc1Cg7P9Khxp7zDINe+ijYAtWK2b6DL5/dTFvyHR591PPcBshd9nJJpD1Ml1SFUxtQ4tueJFjCsatIt40344M4Z4zeNzrAtGoCTGeVKgrJB1kCA+lI+M2Utwp9HVHBDxhoBCZ/xht35WOpR4v5j4vO/ZSj6W/xe/J//3dKoLIYpvXMV2NykJOMlL2JD23UQWFX+5DLBqqBoJ1+4CH65L/aOIB1ggB3UKBkN19JRsKKxOzXHRfhL7Xi0m5/cSF9FVXsP6w+sTgOATJDs7sHVPqXHSnSv7QBmHx5FSlmAcaVEp9PF47BgK6izA5XS3vAvDgU+JS1sE8lJDn38EVjOerjV3xmKmGXL7cK6ossQUvlRw6rKjxMOKPQYJ8ZKx1qqhaFTd/btp1V0UXuVPZXb6pYUx4/6HDrUA+tlVE2qmxfNguAd1hczyv166tBagMlJ5RGNnnOL72u2NS6Fqx6tuMzdrPuTmwkf3owWppshfxnZ2PMcP0iK4SQqv2d3/U0Ynp/ghbPBCUcOSDsYeSY/lG/BRzA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5364.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(8096899003)(11063799006)(56012099006)(261102123227099003)(10067099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(38070700021)(261021123027099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PORN2W0cRvXmEHYHBB/f9H142+b963odX/ozHyixOmL24Q9Zjz8mfsdk/Xwf?=
 =?us-ascii?Q?8urZPEU+IIy3kvSKzX/Ur+xi0tIkt0+7qazHtsUIba5J5S+VPtYOZr+ToQn5?=
 =?us-ascii?Q?+yOY95pKCdeDQAqaHIB8eD/11KTE1yNlUVkq2u/qaKJ0mPvd+lZOaTScm7L7?=
 =?us-ascii?Q?aHnZuW9ZYdYz29/719VP/u9kgikxwz61kliaK6XK7pu9fitRTyuwrfMoqAkC?=
 =?us-ascii?Q?7zspO3cKGnwDyqTx3x8X6aaooxLznOYkeJ886nLgtmgPvdGr5lc6RL2E2Pif?=
 =?us-ascii?Q?IbtEqlKxI1JNAwPmohxijEGIi2mvLFEckgybJztNOSRs6llCmCmqkDly4FiQ?=
 =?us-ascii?Q?fxZFKeNlXuZa72QRLi2T4FfMVK8tvjCX/KNQLHCyLXYueV79ZjUoH96V6GQb?=
 =?us-ascii?Q?U/s2zkLNH35tePSPpbvfx7OoqJu0tjyTfWs1MyIywH1LvcKde77JIEkDaDAk?=
 =?us-ascii?Q?ErwsTKALS7oIFTUeiU71trQLw6zT1197SglVfHliJgJv71qQQKj2gl6NCdJC?=
 =?us-ascii?Q?U6pbUpi+DyCYuO7PG//384puAw4FOiIQZxMvOzTZiKD3mWkTGHlMvQWS5BQY?=
 =?us-ascii?Q?UUCzTr811BBfGMKVS1Sk0YA8dV6FFc2Ul0nfF49IVyr9vNugzNGwWc+Tov1C?=
 =?us-ascii?Q?+y+0TysEl/F2gr855lL8pEzGh2pGkYvvoHIXBulOvKn+y2hTcRDXexq+jkil?=
 =?us-ascii?Q?AYmuvCzlR+DVyc9ncXONCIjA9F9OhcVwSaaWUNm80BHT5kYtml8tvr+SYTLV?=
 =?us-ascii?Q?Z+y/drYFR3MkBMNcfJVDRJEDBaF5t3LyWWRO2GhJYqqlKr1IlgkszX2kiK3i?=
 =?us-ascii?Q?JtzC2Ltlcj/DoG6b4clAd0XwGjBSi3ODUPXIn+4KolMZEk2+MFA57579MEgq?=
 =?us-ascii?Q?/X35Kh4i7mBzB1dptjPVtF8/yLZdROp4ALsl16PW2CXoz4P4oUiyZgcaB2PL?=
 =?us-ascii?Q?pFQmgVDk+13RsjVRZXYvgQBLPPYa39FyfGSNTgDOaxrF/U1J1m+Epb99/ykm?=
 =?us-ascii?Q?wJfaXDANdXTQkKDnjSp9jPTfvHaLAGFfMsg3KV3xgTG+5x5+Pa0DbFmEnQPH?=
 =?us-ascii?Q?WCiTpwQB8s1FXjIGWFwhpaZXY6eDDdAqrXXIDfobmvqPjSJIRwHTFiKXyWwm?=
 =?us-ascii?Q?Dkg+L7Bo4HhCaiyROvCPddVTVSsg9WvLCXGb+FrLOG7pxYX3ubj6SPGfUSrv?=
 =?us-ascii?Q?DTwSnuc6A4Uswj48ZG/4+5oqL0tdXPHHCxx2hqH8sgh+HOVIXZsLtXqILoVQ?=
 =?us-ascii?Q?cAT6fSQ4LnIjgtyg3sb6Y8CWjXoyvbp+KsMMYGc8HLc0vGsazU5wdNzeLy5M?=
 =?us-ascii?Q?YfjL8Bdwu7VIgGxepGKQkWd6uP21vIKOScxOGljlAawL1pSO+WHKLM7vzV3B?=
 =?us-ascii?Q?2QxccWGQDWQBdp8x/GbMODwbIMJivLkfzDOCPAGa5pN3Qm3CKvA/rIPT4vI0?=
 =?us-ascii?Q?e2PtY0BjJsEGd2KOdWz5NT10rUySon7vDLd1AEDpDejp30bfsRgOGIvKBF3+?=
 =?us-ascii?Q?4mHNiEKdctBn1VPp+vbfZoTwIU4XG3bGm0OLNn8jCjHLOAtH5cgqVMhdRiJ9?=
 =?us-ascii?Q?pSzFxIMuopLBbpOoAZQkXRIuZi45cPRvZcxCSr1athww3Agzb07h2oBxKg5X?=
 =?us-ascii?Q?j+dbAI5/3urD5gD9QOQyyBweVc548j3TpyH0fUOwjqPX/Xl8Lw/978yPx4rL?=
 =?us-ascii?Q?efj5LtOkbalwJZxm+iVEp2klZfg=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB5364837341F838D7E046AB0C807A2BL1PR12MB5364namp_"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5364.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d9f1dc-fa80-47e6-6a2f-08df45c2ad88
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 22:24:14.6476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: teUYn34IjNJtPeesHMiYYFgLTIRvZ6DBYyh3h74VjDxRP39Kdo70xfBpr5z9CnjZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9817
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

--_000_BL1PR12MB5364837341F838D7E046AB0C807A2BL1PR12MB5364namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

AMD General

Tested-by: Tony Qi <Haoming.Qi@amd.com>
________________________________
From: Hung, Alex <Alex.Hung@amd.com>
Sent: Monday, November 16, 2026 6:00 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Wentland=
, Harry <Harry.Wentland@amd.com>; Qi, Tony <Haoming.Qi@amd.com>
Cc: Hung, Alex <Alex.Hung@amd.com>
Subject: [PATCH v2 0/3] tests/kms_colorop: reduce test run time

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

Changes in v2:
- 2/3: Keep each colorop_group in static storage, as igt_subtest_f()
  returns through siglongjmp (Harry)
- 3/3: Create the probe fbs only after a primary plane supports the
  input format, so unsupported formats skip instead of failing, and
  clear the CRTC and writeback state after each probe (Harry)

Alex Hung (3):
  tests/kms_colorop: skip early when no pipeline fits
  tests/kms_colorop: set up subtest groups on demand
  tests/kms_colorop: check writeback formats first

 tests/kms_colorop.c | 349 ++++++++++++++++++++++----------------------
 1 file changed, 171 insertions(+), 178 deletions(-)

--
2.53.0


--_000_BL1PR12MB5364837341F838D7E046AB0C807A2BL1PR12MB5364namp_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 16px; c=
olor: rgb(0, 0, 0);">
<span class=3D"spanWithBackgroundColor" style=3D"background-color: rgb(255,=
 255, 255);">Tested-by: Tony Qi &lt;Haoming.Qi@amd.com&gt;</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Hung, Alex &lt;Alex.H=
ung@amd.com&gt;<br>
<b>Sent:</b> Monday, November 16, 2026 6:00 PM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Qi, Tony &lt;Haoming.Q=
i@amd.com&gt;<br>
<b>Cc:</b> Hung, Alex &lt;Alex.Hung@amd.com&gt;<br>
<b>Subject:</b> [PATCH v2 0/3] tests/kms_colorop: reduce test run time</fon=
t>
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
Changes in v2:<br>
- 2/3: Keep each colorop_group in static storage, as igt_subtest_f()<br>
&nbsp; returns through siglongjmp (Harry)<br>
- 3/3: Create the probe fbs only after a primary plane supports the<br>
&nbsp; input format, so unsupported formats skip instead of failing, and<br=
>
&nbsp; clear the CRTC and writeback state after each probe (Harry)<br>
<br>
Alex Hung (3):<br>
&nbsp; tests/kms_colorop: skip early when no pipeline fits<br>
&nbsp; tests/kms_colorop: set up subtest groups on demand<br>
&nbsp; tests/kms_colorop: check writeback formats first<br>
<br>
&nbsp;tests/kms_colorop.c | 349 ++++++++++++++++++++++---------------------=
-<br>
&nbsp;1 file changed, 171 insertions(+), 178 deletions(-)<br>
<br>
-- <br>
2.53.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BL1PR12MB5364837341F838D7E046AB0C807A2BL1PR12MB5364namp_--
