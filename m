Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9F4CFA749
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 05:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578F710E278;
	Fri,  4 Oct 2024 05:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3NyyX4A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EB310E278
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 05:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728019184; x=1759555184;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=yYo0+G/xvrTEahpNsFnMhQjQ6KwRmMDO1ybp1fJV2V4=;
 b=M3NyyX4AflHXJBrQwYymaYVTtgN/0B99dvu9LiyowCycIgcX1K/Q0lId
 lBuLBiHQLxrdrbMgM0TTD4K7d2/bm7sdo+3pN+p70z5EyuFG5vSFOql9f
 4opNllnwuU/6j30hedBMrkCfRtD0KKcOI+0Kyd1sQVx600z2pmxyyWoLN
 +gwi4u7/Bb/D7lHzbwALR6aWLn0uLFfoXZAr4tzevCowdzBplxtb2HxaU
 XkvPtfRU3fthM6Ujmjc6nYm8IVYpP76O2dzgUeqh4fCbTePleMd4fyoFy
 BgzWeay8/p6wN2ms0GwhHPMkZi8QDc/wU6i2c8lUC539ekr8dl17MSB6Y w==;
X-CSE-ConnectionGUID: +vmdbupTQ92v0brnXejdlQ==
X-CSE-MsgGUID: JOZa2hW2QsWNQ/R2dM1WEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="14853563"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208,217";a="14853563"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 22:19:43 -0700
X-CSE-ConnectionGUID: WrWkqspNQTGMreMRZxV2QQ==
X-CSE-MsgGUID: YxDPmZkxTiCobOmoPY1nQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208,217";a="79021899"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 22:19:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 22:19:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 22:19:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 22:19:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiNvg9EqTZknJXB5vWEZegQKirMp210QcvA99xvX3Jhb7QM3RZ2Hu0yIJo1B1b0E3eMBuL/DNWKbBzbIqUwa/SeKlr1PJRd+pd3iYTD6Mayaw2QWvD2y+rD2eoEN/U5KyIYI9VHjxZS/7jImIA3CNkCUTG/7JHlAZ7TmP5/HGBDNgQWMoC2/UMHoNjfRbamIFq880Hs32bezgyZYOkDfX5ADUFEpeL0JZIJS/LafMBHXM99beNTJjw1co1P/5l3sL0IHUbNfrB2ENn8Vb87ND4PC0gX42apa5X5/Ef5kM/9RK8Ob3uKZwfl+f/h8VYwWMu2VEIQ164Y0ifi9f5RmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0O6+A77pZIDQ1tTT1oBWRy2u/oG6LdY608eTAIqzHg=;
 b=mMy3FrTmg3rtXET50QNzcjfhAA6+JleSB+PVTCnh4nMnMj2CgOq0yfX2Deuj6+Wwe+9vg2u9kw192QLRWPiyXYukFag5dD67q6vUfuqiFxACexdCQ1AWedkBUyJSD2cxKGYStJw/Rff+llgnyuD8kf1vzZYWvoEpPv+geCWWSyezO6Ooz6dc15iUnJR9AoHJpBj0MT+xReCv7hk4yenRVYJLaPzXoaeDtoEhwJq+UEhSZA7V1u/2rpNOdxObl4uV4MK0KhdZ8//sFZns7deAfpvtz8+lfSuqrtnAy3q85hTXqskB7o/GDc5uLvaYBgW97WrgFQ33LtMO6XHKGXiEtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by MW4PR11MB6981.namprd11.prod.outlook.com (2603:10b6:303:229::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 05:19:39 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 05:19:39 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Topic: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Index: AQHbFNtF8WL1idnY80qJByEWkXMYLbJ2EExr
Date: Fri, 4 Oct 2024 05:19:39 +0000
Message-ID: <SN7PR11MB67502B2A0379DF1010B689D5E3722@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241002145503.910536-1-santhosh.reddy.guddati@intel.com>
 <20241002145503.910536-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241002145503.910536-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|MW4PR11MB6981:EE_
x-ms-office365-filtering-correlation-id: d7498112-5d5c-447f-d3bc-08dce4342519
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rwccH9S9eKKktXNr3Uw/V35Ft67XDOaN052v3zZVPvpDK84FFNGfRc8NuG47?=
 =?us-ascii?Q?wp4orEgG4xMlCu5XP5Q5TTt6aNqtYTwLkPOpWoJKYKoBTfQJkh1BhroxkimM?=
 =?us-ascii?Q?CoTEO/0TMjTOEBqkTi6PIAmxBN4zqmepLrcGZm7nuc+crk1SxSdc2X3RU+hR?=
 =?us-ascii?Q?KPiSydFtgH9y/GtjwxiofOUKNlWX3teZawkbbns31IrJQ1TpkXZ5RJmbpsSx?=
 =?us-ascii?Q?sGIr8K0Zc/Y7RFrpTtKEcFTvYQYwZSMYAG+d6T19VjML/yXuXFF804SDxz9B?=
 =?us-ascii?Q?eunvgZ/2UITDfTPifYThE9jDEdauEDpgJzlaSHWxjUUzQgDjlP7PiyUErYIO?=
 =?us-ascii?Q?LFxbvIJdgNZycqc+HsJEsquGQrPuAQ1PUovXP8yqUnKLCxv35b7IRHdjIYEb?=
 =?us-ascii?Q?xEnJogP3122f4VCCXo2OY9ITkLjZu/nppfeUyU6O9BMKPG7mxoKf08CV15e1?=
 =?us-ascii?Q?84/YgR/lookwIgqMMYIx9sDqUzGPLZvDb7JoPGnWENzW4W8YsIyKq280S7Ym?=
 =?us-ascii?Q?i4bQa0bpYB5dTOMIy4p1vOZbhKWeQKAxlEo6MhYyDNu79kgSddMwLAdQo72i?=
 =?us-ascii?Q?CadCeGVSst5mIDbi8E3cBBqi1+VAax+fN/F4AD16yaldxItBjohPkaKnCur5?=
 =?us-ascii?Q?UYYRwk8LrXn7lMqfDggwof9erhEWNilkMMMuYMjZAas+h8dcj26T5SwjV8dS?=
 =?us-ascii?Q?onR5SJdM/y8ySGyWJIXJnn1e3m9yvlUDsHUYVp6C0+bvzLGb9jNjxdpNj9EC?=
 =?us-ascii?Q?3LfY0bCBLMAu9s1Opg7KUnR8+bwMXZVwFTlh5qi5Bj31bJxXz7iWhqzqTDl2?=
 =?us-ascii?Q?U2guWh8+HYE71Gbd760fk7oZYAfPIGGlANjizhgm2IQhIyijcRWPenQca0kD?=
 =?us-ascii?Q?p6Jfo0VZGJJlSxiC9fLXab1NoQTMIp66ZfyTimyYrYnEM/XVCFWQvB/LBREN?=
 =?us-ascii?Q?W13WeMMGMEXW9V1NA7hUKQm9vTULswYso9Ln2X13J4jL6F/N+n6SrgjOaIOZ?=
 =?us-ascii?Q?/5U++JpiSC3taEk43OOnDSPa2mnhl6Js/Lft6W5Mu3DXLsz8BIE/Np04VKT4?=
 =?us-ascii?Q?ksGf5M8hqOXxNpPwAcmpZ1Gpz9u7Fag5pFk4Pmn8mUMFXk41DZHARDqjJrp9?=
 =?us-ascii?Q?UI2WtuKgQydZzkoGpuukqfoHgaoLTJ5voNI3yZtMXH+O/99HE+LMHVwMWsur?=
 =?us-ascii?Q?L9vnwjoGmtDUfgyeUsIIPmiy1X4DdGir+czq5pI3IGWGZSAbV1N01TC18ENh?=
 =?us-ascii?Q?u3aeyI6eE8fyP3cxmRZMTsMbCbv4BXrAQYorirxXqsYmZVix0THSXN3Fm3IY?=
 =?us-ascii?Q?DLlacG3B4kml+tUnABqvoMWvPYWO33kG1KykrxZWlwyyvg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xFjUw7Scxy6SkvAJ85DmrGDyLxtoVd5bcFFxPxhRMlXl4v7u+CaalVoVr6oi?=
 =?us-ascii?Q?qQpZ+KKls2wOct3eDsJJ6GgyX4jdx4Vp1xwsKay0S2u57LDM6E8bpAchyZcs?=
 =?us-ascii?Q?TjrLnSIbLmYSyfaeJc4MgRIkUKQbD7J+kH4Is0IYreFFD70d9YSDiR28X8TL?=
 =?us-ascii?Q?diz2PNfmLGI6TZf29n1535q2VrCURknggWce8G/t6mpdFBfiBtDzBdmtz91s?=
 =?us-ascii?Q?tmnyG5QXOevG1ufqBcqJ9lvkn4Tu7U8RfieL5kNPDHQb9u/jpj+hzrHZshYJ?=
 =?us-ascii?Q?foYeu8e3FSoZAdcUHBSeXAXR0Gg1kzeVbhAYFIDhPoNnJG9wttL3CRpiTNv1?=
 =?us-ascii?Q?cu+WR/bfPPhaqLalcLp6BS6RUXryx3UIoJ+7IAe2k7lNX2mafJZVIRIIVMOn?=
 =?us-ascii?Q?szyXBfiYLGD30BTpMMbnx/tfvDNYx3RgM+WGoE/UZ7b1hemGV1pC6Ii/Ly8j?=
 =?us-ascii?Q?PieWTAMxkEz1hRbRmlTk4iJeBF3HSsTRItnTfB3Xz9s258W4/mNZtlviY8SC?=
 =?us-ascii?Q?oVNKTzleiX6K/xlYpPHkFo2/sJQAu4B79C8ppAUBcZws/oNsedEhB2YNRZw2?=
 =?us-ascii?Q?nMy7W9M5Jjgys8GBZT63yZL9ItQAzsuy+AF9tpNHalkyLUdkX/HByr/657d+?=
 =?us-ascii?Q?SEKPwvR0q7fypYlEXawqlJKQqkzLDTrPIlcbgYlIkqqDE1k0tLGBnk6Jq0Xh?=
 =?us-ascii?Q?G0Nm03lXWbKrp6fUU33zhfiSbEixkD39/xlfesXnzgvfiy1arXUl3RJm6sJk?=
 =?us-ascii?Q?Xnx/HGrobTUzSRXK0vmI/tZjxs3zHgYg1OfJ0QmjqPvT1lxIaD+Fh8iRKY5s?=
 =?us-ascii?Q?kjAJpC7oQdsD5Jb+x1rO8Wucw7piYHXJ6rGMmE1VXQVOKtXzgwjsF88U9LQv?=
 =?us-ascii?Q?OLh/y1bfqGCbS22ZUdtyOzz/jnlVjVrvHBK9IzaPH7y14nrdkJGNPWUekTtY?=
 =?us-ascii?Q?z5WlEMGDu0I27WhIZfYLiGNVHAOzzqvHIu2FWiLvRTXuwtmLZNeBWTkTp7Mu?=
 =?us-ascii?Q?jFRjvfIYMXExvIQFwnbyhxUvUuwv2NDcSrlWrN7vgmARQPgtqxq6j0LKHKHf?=
 =?us-ascii?Q?0sBpTdGoSP5qAHEu39mMzhJvN/e9Q5LvFepUrB0QToCD2cGfthkanhrFw2oE?=
 =?us-ascii?Q?OlIDbSeQd5bWbe5EJL/bBs8RMs+KJDT0EjK7cAh0Nn5J4IwbOMZ2NsoCBrQA?=
 =?us-ascii?Q?IbD4qAoxXtCUBDZfsidRqe6T8Q12HNzyI+X9iPelrcE4tSFVy7VCf0zbUSgz?=
 =?us-ascii?Q?pQQfc/s3F2kKk25L4r7kQDZpm7KHVpWjC4RKsdJW2nXQvmBAY7fFKsy0pEs1?=
 =?us-ascii?Q?jiFCI5dRo2WfAlX03W0vWhKTCiVYRRdu0N7LH7C1hSMKhORUvBLCbM6R/m7Z?=
 =?us-ascii?Q?cg+iu+G6YBrnMFP8OmRDdUMtTr9ahlnONTYFFvftpx69bAx5ewkxP9PoqgmB?=
 =?us-ascii?Q?iQ7YQhPJsrTk10l5+8tIqMkgggqfnf1lBNmQBRXjtI3FCS47HTeV3WYLs6Lm?=
 =?us-ascii?Q?TM+J5h5cYv9lqxFwCXWLP+tvwgmbXaFBtC0j1xsEkvxJdbc+MvZGxJ2udciy?=
 =?us-ascii?Q?+N8H85lhXVrLnRuae0wE2sO/xj6VqJ8lc15NVpb7Fo2mCgWLV/JJwRGcZiJw?=
 =?us-ascii?Q?aA=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN7PR11MB67502B2A0379DF1010B689D5E3722SN7PR11MB6750namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7498112-5d5c-447f-d3bc-08dce4342519
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 05:19:39.1160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b545FzYdiiNHsSlNT6fifnzlx3pMDUoLorBkMc4KXScjR88gdfLf9ZtMNhey+50WbCv85mm4g+jdeXE8yu1hEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6981
X-OriginatorOrg: intel.com
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

--_000_SN7PR11MB67502B2A0379DF1010B689D5E3722SN7PR11MB6750namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
Sent: Wednesday, October 2, 2024 8:26:33 pm
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Samala, Pranay <pranay.samala@intel.com>; Kandpal, Suraj <suraj.kandpal=
@intel.com>; Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation i=
n HDR mode

Add subtest for backlight control on hdr enabled edp panels
by changing brightness via sysfs.

v2: adjust brightness range, refactor and restore brightness (Pranay)

v3: reuse functions, add flags to avoid duplicate code (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_hdr.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f123c6b36..0f07e770b 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -64,6 +64,10 @@
  * Description: Tests static toggle with suspend
  * Functionality: colorspace, static_hdr, suspend
  *
+ * SUBTEST: brightness-with-hdr
+ * Description: Tests brightness with HDR
+ * Functionality: colorspace, static_hdr
+ *
  * SUBTEST: static-%s
  * Description: Tests %arg[1].
  * Functionality: colorspace, static_hdr
@@ -81,6 +85,8 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bp=
c switch");
 #define HDR_STATIC_METADATA_BLOCK       0x06
 #define USE_EXTENDED_TAG                0x07

+#define INTEL_BACKLIGHT_PATH "/sys/class/backlight/intel_backlight"
+
 /* DRM HDR definitions. Not in the UAPI header, unfortunately. */
 enum hdmi_metadata_type {
         HDMI_STATIC_METADATA_TYPE1 =3D 0,
@@ -100,6 +106,7 @@ enum {
         TEST_SWAP =3D 1 << 3,
         TEST_INVALID_METADATA_SIZES =3D 1 << 4,
         TEST_INVALID_HDR =3D 1 << 5,
+       TEST_BRIGHTNESS =3D 1 << 6,
 };

 /* BPC connector state. */
@@ -448,6 +455,72 @@ static void fill_hdr_output_metadata_st2048(struct hdr=
_output_metadata *meta)
         meta->hdmi_metadata_type1.max_cll =3D 500;   /* 500 nits */
 }

+/* TODO: Move adjust_brightness to lib/igt_sysfs to reuse in other tests. =
*/
+static void adjust_brightness(data_t *data, uint32_t flags)
+{
+       char brightness_path[1024];
+       int brightness_fd;
+       char brightness_value[64];
+       int current_brightness;
+       int max_brightness;
+       int read_brightness;
+       int fd, i;
+
+       /* Get max brightness */
+       snprintf(brightness_path, sizeof(brightness_path),
+                "%s/%s", INTEL_BACKLIGHT_PATH, "max_brightness");
+       fd =3D open(brightness_path, O_RDONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0=
);
+
+       max_brightness =3D atoi(brightness_value);
+
+       close(fd);
+
+       /* Get current brightness */
+       snprintf(brightness_path, sizeof(brightness_path),
+                "%s/%s", INTEL_BACKLIGHT_PATH, "brightness");
+       fd =3D open(brightness_path, O_RDONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0=
);
+
+       current_brightness =3D atoi(brightness_value);
+
+       close(fd);
+
+       for (i =3D 0; i <=3D max_brightness; i +=3D 50) {
+               fd =3D open(brightness_path, O_WRONLY);
+               igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_p=
ath);
+
+               snprintf(brightness_value, sizeof(brightness_value), "%d", =
i);
+               igt_assert(write(fd, brightness_value, strlen(brightness_va=
lue)) > 0);
+
+               close(fd);
+
+               /* Verify brightness adjustment */
+               fd =3D open(brightness_path, O_RDONLY);
+               igt_assert(fd >=3D 0);
+
+               igt_assert(read(fd, brightness_value, sizeof(brightness_val=
ue)) > 0);
+
+               read_brightness =3D atoi(brightness_value);
+
+               igt_assert_eq(read_brightness, i);
+
+               close(fd);
+       }
+
+       fd =3D open(brightness_path, O_WRONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       snprintf(brightness_value, sizeof(brightness_value), "%d", current_=
brightness);
+       igt_assert(write(brightness_fd, brightness_value, strlen(brightness=
_value)) > 0);
+
+       close(fd);
+}
+
 static void test_static_toggle(data_t *data, enum pipe pipe,
                                igt_output_t *output,
                                uint32_t flags)
@@ -483,6 +556,9 @@ static void test_static_toggle(data_t *data, enum pipe =
pipe,
                 igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown=
 EOTF [0-9]+\""), 0);
                 goto cleanup;
         }
+       if (flags & TEST_BRIGHTNESS)
+               adjust_brightness(data, flags);
+
         igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);

         /* Verify that the CRC are equal after DPMS or suspend. */
@@ -685,7 +761,8 @@ static void test_hdr(data_t *data, uint32_t flags)

                         igt_dynamic_f("pipe-%s-%s",
                                       kmstest_pipe_name(pipe), output->nam=
e) {
-                               if (flags & (TEST_NONE | TEST_DPMS | TEST_S=
USPEND | TEST_INVALID_HDR))
+                               if (flags & (TEST_NONE | TEST_DPMS | TEST_S=
USPEND |
+                                            TEST_INVALID_HDR | TEST_BRIGHT=
NESS))
                                         test_static_toggle(data, pipe, out=
put, flags);
                                 if (flags & TEST_SWAP)
                                         test_static_swap(data, pipe, outpu=
t);
@@ -734,6 +811,10 @@ igt_main
         igt_subtest_with_dynamic("static-toggle-suspend")
                 test_hdr(&data, TEST_SUSPEND);

+       igt_describe("Tests brightness while entering and exiting HDR mode"=
);
+       igt_subtest_with_dynamic("brightness-with-hdr")
+               test_hdr(&data, TEST_BRIGHTNESS);
+
         igt_describe("Tests swapping static HDR metadata");
         igt_subtest_with_dynamic("static-swap")
                 test_hdr(&data, TEST_SWAP);
--
2.34.1



--_000_SN7PR11MB67502B2A0379DF1010B689D5E3722SN7PR11MB6750namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto">
<div id=3D"divRplyFwdMsg" style=3D"font-size: 11pt;" dir=3D"auto">
<div dir=3D"auto">
<div dir=3D"auto"><span><strong>From:</strong> Reddy Guddati, Santhosh &lt;=
santhosh.reddy.guddati@intel.com&gt;<br>
</span></div>
<div dir=3D"auto"><strong style=3D"font-size:11pt">Sent:</strong><span styl=
e=3D"font-size:11pt"> Wednesday, October 2, 2024 8:26:33 pm</span><br style=
=3D"font-size:11pt">
</div>
<div dir=3D"auto"><strong style=3D"font-size:11pt">To:</strong><span style=
=3D"font-size:11pt"> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freede=
sktop.org&gt;</span><br style=3D"font-size:11pt">
</div>
<div dir=3D"auto"><strong style=3D"font-size:11pt">Cc:</strong><span style=
=3D"font-size:11pt"> Samala, Pranay &lt;pranay.samala@intel.com&gt;; Kandpa=
l, Suraj &lt;suraj.kandpal@intel.com&gt;; Reddy Guddati, Santhosh &lt;santh=
osh.reddy.guddati@intel.com&gt;</span><br style=3D"font-size:11pt">
</div>
<div dir=3D"auto"><strong style=3D"font-size:11pt">Subject:</strong><span s=
tyle=3D"font-size:11pt"> [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightnes=
s manipulation in HDR mode</span><br style=3D"font-size:11pt">
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><span>Add subtest for backlight control on hdr enabled ed=
p panels</span><br>
</div>
<div dir=3D"auto"><span>by changing brightness via sysfs.</span><br>
</div>
<div dir=3D"auto"><span></span><br>
</div>
<div dir=3D"auto"><span>v2: adjust brightness range, refactor and restore b=
rightness (Pranay)</span><br>
</div>
<div dir=3D"auto"><span></span><span></span><br>
</div>
<div dir=3D"auto"><span>v3: reuse functions, add flags to avoid duplicate c=
ode (Suraj)</span><br>
</div>
<div dir=3D"auto"><span></span><br>
</div>
<div dir=3D"auto"><span>Signed-off-by: Santhosh Reddy Guddati &lt;santhosh.=
reddy.guddati@intel.com&gt;</span><br>
</div>
<div dir=3D"auto"><span>---</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;tests/kms_hdr.c | 83 ++++++++++++++++++++++++=
++++++++++++++++++++++++-</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;1 file changed, 82 insertions(+), 1 deletion(=
-)</span><br>
</div>
<div dir=3D"auto"><span></span><br>
</div>
<div dir=3D"auto"><span>diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c</spa=
n><br>
</div>
<div dir=3D"auto"><span>index f123c6b36..0f07e770b 100644</span><br>
</div>
<div dir=3D"auto"><span>--- a/tests/kms_hdr.c</span><br>
</div>
<div dir=3D"auto"><span>+++ b/tests/kms_hdr.c</span><br>
</div>
<div dir=3D"auto"><span>@@ -64,6 +64,10 @@</span><br>
</div>
<div dir=3D"auto"><span>&nbsp; * Description: Tests static toggle with susp=
end</span><br>
</div>
<div dir=3D"auto"><span>&nbsp; * Functionality: colorspace, static_hdr, sus=
pend</span><br>
</div>
<div dir=3D"auto"><span>&nbsp; *</span><br>
</div>
<div dir=3D"auto"><span>+ * SUBTEST: brightness-with-hdr</span><br>
</div>
<div dir=3D"auto"><span>+ * Description: Tests brightness with HDR</span><b=
r>
</div>
<div dir=3D"auto"><span>+ * Functionality: colorspace, static_hdr</span><br=
>
</div>
<div dir=3D"auto"><span>+ *</span><br>
</div>
<div dir=3D"auto"><span>&nbsp; * SUBTEST: static-%s</span><br>
</div>
<div dir=3D"auto"><span>&nbsp; * Description: Tests %arg[1].</span><br>
</div>
<div dir=3D"auto"><span>&nbsp; * Functionality: colorspace, static_hdr</spa=
n><br>
</div>
<div dir=3D"auto"><span>@@ -81,6 +85,8 @@ IGT_TEST_DESCRIPTION(&quot;Test H=
DR metadata interfaces and bpc switch&quot;);</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;#define HDR_STATIC_METADATA_BLOCK&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 0x06</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;#define USE_EXTENDED_TAG&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x07<=
/span><br>
</div>
<div dir=3D"auto"><span>&nbsp;</span><br>
</div>
<div dir=3D"auto"><span>+#define INTEL_BACKLIGHT_PATH &quot;/sys/class/back=
light/intel_backlight&quot;</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;/* DRM HDR definitions. Not in the UAPI heade=
r, unfortunately. */</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;enum hdmi_metadata_type {</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HD=
MI_STATIC_METADATA_TYPE1 =3D 0,</span><br>
</div>
<div dir=3D"auto"><span>@@ -100,6 +106,7 @@ enum {</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TE=
ST_SWAP =3D 1 &lt;&lt; 3,</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TE=
ST_INVALID_METADATA_SIZES =3D 1 &lt;&lt; 4,</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TE=
ST_INVALID_HDR =3D 1 &lt;&lt; 5,</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_BRIGHTNE=
SS =3D 1 &lt;&lt; 6,</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;};</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;/* BPC connector state. */</span><br>
</div>
<div dir=3D"auto"><span>@@ -448,6 +455,72 @@ static void fill_hdr_output_me=
tadata_st2048(struct hdr_output_metadata *meta)</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; me=
ta-&gt;hdmi_metadata_type1.max_cll =3D 500;&nbsp;&nbsp; /* 500 nits */</spa=
n><br>
</div>
<div dir=3D"auto"><span>&nbsp;}</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;</span><br>
</div>
<div dir=3D"auto"><span>+/* TODO: Move adjust_brightness to lib/igt_sysfs t=
o reuse in other tests. */</span><br>
</div>
<div dir=3D"auto"><span>+static void adjust_brightness(data_t *data, uint32=
_t flags)</span><br>
</div>
<div dir=3D"auto"><span>+{</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char brightne=
ss_path[1024];</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int brightnes=
s_fd;</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char brightne=
ss_value[64];</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int current_b=
rightness;</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int max_brigh=
tness;</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int read_brig=
htness;</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd, i;</s=
pan><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get max br=
ightness */</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brig=
htness_path, sizeof(brightness_path),</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s/%s&quot;, INTEL_BACKLIGHT=
_PATH, &quot;max_brightness&quot;);</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(b=
rightness_path, O_RDONLY);</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(=
fd &gt;=3D 0, &quot;Failed to open %s\n&quot;, brightness_path);</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(re=
ad(fd, brightness_value, sizeof(brightness_value)) &gt; 0);</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_brightnes=
s =3D atoi(brightness_value);</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);</s=
pan><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get curren=
t brightness */</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brig=
htness_path, sizeof(brightness_path),</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s/%s&quot;, INTEL_BACKLIGHT=
_PATH, &quot;brightness&quot;);</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(b=
rightness_path, O_RDONLY);</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(=
fd &gt;=3D 0, &quot;Failed to open %s\n&quot;, brightness_path);</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(re=
ad(fd, brightness_value, sizeof(brightness_value)) &gt; 0);</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_brigh=
tness =3D atoi(brightness_value);</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);</s=
pan><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0;=
 i &lt;=3D max_brightness; i +=3D 50) {</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_WRONLY);<=
/span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Failed =
to open %s\n&quot;, brightness_path);</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_value, sizeof(bright=
ness_value), &quot;%d&quot;, i);</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(write(fd, brightness_value, s=
trlen(brightness_value)) &gt; 0);</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Verify brightness adjustment */</span=
><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_RDONLY);<=
/span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(fd &gt;=3D 0);</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(read(fd, brightness_value, si=
zeof(brightness_value)) &gt; 0);</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read_brightness =3D atoi(brightness_valu=
e);</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(read_brightness, i);</span=
><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(b=
rightness_path, O_WRONLY);</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(=
fd &gt;=3D 0, &quot;Failed to open %s\n&quot;, brightness_path);</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brig=
htness_value, sizeof(brightness_value), &quot;%d&quot;, current_brightness)=
;</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(wr=
ite(brightness_fd, brightness_value, strlen(brightness_value)) &gt; 0);</sp=
an><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);</s=
pan><br>
</div>
<div dir=3D"auto"><span>+}</span><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;static void test_static_toggle(data_t *data, =
enum pipe pipe,</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *=
output,</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t flags=
)</span><br>
</div>
<div dir=3D"auto"><span>@@ -483,6 +556,9 @@ static void test_static_toggle(=
data_t *data, enum pipe pipe,</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(system(&quot;dm=
esg|tail -n 1000|grep -E \&quot;Unknown EOTF [0-9]+\&quot;&quot;), 0);</spa=
n><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto cleanup;</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
/span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &am=
p; TEST_BRIGHTNESS)</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adjust_brightness(data, flags);</span><b=
r>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_assert_output_bpc_equal(data-&gt;fd, pipe, output-&gt;name, 10);</span><b=
r>
</div>
<div dir=3D"auto"><span>&nbsp;</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*=
 Verify that the CRC are equal after DPMS or suspend. */</span><br>
</div>
<div dir=3D"auto"><span>@@ -685,7 +761,8 @@ static void test_hdr(data_t *da=
ta, uint32_t flags)</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; igt_dynamic_f(&quot;pipe-%s-%s&quot;,</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_pipe_name(pipe), output-&gt;name) {</sp=
an><br>
</div>
<div dir=3D"auto"><span>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; (TE=
ST_NONE | TEST_DPMS | TEST_SUSPEND | TEST_INVALID_HDR))</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; (TE=
ST_NONE | TEST_DPMS | TEST_SUSPEND |</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_HDR=
 | TEST_BRIGHTNESS))</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_static_toggle(data, pipe, outp=
ut, flags);</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flag=
s &amp; TEST_SWAP)</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_static_swap(data, pipe, output=
);</span><br>
</div>
<div dir=3D"auto"><span>@@ -734,6 +811,10 @@ igt_main</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_subtest_with_dynamic(&quot;static-toggle-suspend&quot;)</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_hdr(&amp;data, TEST_SUSP=
END);</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(=
&quot;Tests brightness while entering and exiting HDR mode&quot;);</span><b=
r>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_w=
ith_dynamic(&quot;brightness-with-hdr&quot;)</span><br>
</div>
<div dir=3D"auto"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_hdr(&amp;data, TEST_BRIGHTNESS);</s=
pan><br>
</div>
<div dir=3D"auto"><span>+</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_describe(&quot;Tests swapping static HDR metadata&quot;);</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_subtest_with_dynamic(&quot;static-swap&quot;)</span><br>
</div>
<div dir=3D"auto"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_hdr(&amp;data, TEST_SWAP=
);</span><br>
</div>
<div dir=3D"auto"><span>-- </span><br>
</div>
<div dir=3D"auto"><span>2.34.1</span><br>
</div>
</div>
</div>
</div>
<div dir=3D"auto">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --></div>
<div dir=3D"auto"><font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText" dir=3D"auto"><br>
</div>
</span></font><br>
</div>
</body>
</html>

--_000_SN7PR11MB67502B2A0379DF1010B689D5E3722SN7PR11MB6750namp_--
