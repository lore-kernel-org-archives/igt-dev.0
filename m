Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E37CD8C8E
	for <igt-dev@archiver.kernel.org>; Sat,  6 Jun 2026 02:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA92112CD0;
	Sat,  6 Jun 2026 02:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fRO2NJM6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65D2112CD0
 for <igt-dev@lists.freedesktop.org>; Sat,  6 Jun 2026 02:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780713718; x=1812249718;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=gtyoHBp9CcFvhwbO/UXo2f6exEWa9O3k94U34volS3A=;
 b=fRO2NJM6yhtrJtQZ6hebDrjIDdWhIaHYvfOhHOWK1qJ9LPqnD7b89r6s
 HFqtt2fHypP9sZMMZyzrUsv3U5Fcu/XQH+A8A7CGvcPclZ39l9ZWvYDzM
 6aPfHLnD2tuMRku0pNnXhpg3wJc6dMjv4sx/j80pYJIRUun5fONoS+42K
 NIjaFGs3ipyUHs2Q1/Vj/6GTHOlAot2SOBq7OgBGzei2LtN9E7OtgXcuI
 VzZ4re7Pd3AJ4xLKN/Ig91m6h7O9NJrvPFgEDnVEjzfIgoaAMwbD5doml
 ANnAEuiRhGUwcuwL07UGMXu6f9TOwQvrXaS9mLYrESp6Kd7TYE780j9CE A==;
X-CSE-ConnectionGUID: iYp2FBHdRG+r34MRILyemQ==
X-CSE-MsgGUID: KDu4p0mDTMW4vpBYcf8/Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="85434315"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208,217";a="85434315"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 19:41:57 -0700
X-CSE-ConnectionGUID: ZIZQs0szSfGkU1TmkCWV/g==
X-CSE-MsgGUID: r9lfA1lIQBidQENGhfbOOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
 d="scan'208,217";a="249939805"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 19:41:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 19:41:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 19:41:56 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 19:41:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TegFxJq4LwPoS9VV6Kc6iaBhAhAKH5rAiUowbrI5MnHivF/2A7ShNGPgj4NkJXYY9SORdbScLg3anObZUei/LUzbyftAwz0NdNi7q2tCNrTDZcNc5lI2Gb8fWLNdG79sD6y7tRhns2DERKvYzb0iqg6UWVXRzUZoGGaqHbkT7wNHYislMXCj55/yH/NYRnUhniHfuQ8yNocjgpJbd6J+pwX9Yyg6hOFrnQQpB093wn6YSNnvso5zUrvt9NMnEFA0x6WB4XvQZ1tujmtez8oZhO0murJu5k9ni1aGp7pjPNGzbGOc5XcXMyRG2UrUbyYLSGZGJD22Em1nqAvH8juUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOllTTwdg9krHwUo+10s3qulN0bhiUknaEPdplMuZtU=;
 b=YYh541Yis5oYxTFobGoCer3YeNSHtuGPYMYMF3QpRGXz2Drek8+h02+JIDIZf78oZtPdTX89z4Fm5ox9menT7Yexno69FN5y1eyCReZx1VN+MJllTiWHkVHtPYUyLxfoR4QIK4oWT6/7Wfo93/uw62g0wOT0jX4dP6Gwn6bxoN9RFvE/R2qXUA+B/GbfoZXrbhz5lfOR6lz8s55k9qPJu0iSeJV18IShqFSAJMzui3xTZiM/P5jHVLC192kJGSQaCkyy/hCxJ5SfOdVNgnoxOX6/5pgeDgYjHSKTIqmEN+AZVt4ySyr7vwCJTT7nUdyOTs6NHZ1aK4hOKCgfi6IkNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA1PR11MB8793.namprd11.prod.outlook.com (2603:10b6:806:46b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Sat, 6 Jun 2026
 02:41:53 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0092.007; Sat, 6 Jun 2026
 02:41:53 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Chauhan, Aditya" <aditya.chauhan@intel.com>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Girotra, Himanshu" <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_reset: suppress expected
 CGP_SYNC dmesg warning
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_reset: suppress expected
 CGP_SYNC dmesg warning
Thread-Index: AQHc9Nc2aTmQOHpKsEeRFJCYysB7pbYw0ed0
Date: Sat, 6 Jun 2026 02:41:53 +0000
Message-ID: <CH3PR11MB8434B36DE08959B967174BF08D1E2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260605103632.3297911-1-aditya.chauhan@intel.com>
In-Reply-To: <20260605103632.3297911-1-aditya.chauhan@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA1PR11MB8793:EE_
x-ms-office365-filtering-correlation-id: 951f97b1-4e08-4e65-0f4f-08dec3752b27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|22082099003|11063799006|56012099006|6133799003|18002099003|8096899003|38070700021;
x-microsoft-antispam-message-info: NYpPtVuWAtrxx0zchFns4oUFO0nRs+lqwT9lPXisnLz5ab+9bNLqb1plCS0TtSHsGNX28YGxL6i1IAt++DgP8x6EigUnXAPNlHe6wIeyyb0ASdFgloAQc5wktd/qjPo0y3DUeDF0qmv7Q8IeQMPsaoKx8JXhTP+7HZpTG7zzVhcLEXy4TILCUrPYUqetzpxEHSYoat5sgsIIgNNkwXmdI6MedFsL19509Ty9LZc8k6wI2bpoWgWGK8pQiKx8MCtsrQmR1sLrB40DXdT3QhFxK9v853wGcFMXBzv8+xUiGKzHETHJX1sJzvPOPg9z++IV3I00kmfLSRIok42m6x+JQsUfoeYXKqcxfBFVQjuozwCf03Cg0Hlc2yrx+yIvyw8fc791hvO+xWAVH55o+m1T2d7KHybR6uDKf8hdIrx3HBaL1AtDB8TXfXfazcldw4KJ5cWCdWscXh4yoRo96uqy8mHZMBiV0UTLUI99lqYNkYjvZL6FQCOopHJTGYnNLVmImYNYLK8lUvjsj2TUbVHkHCZLIoV+dRGnlTA6B6w/ib5TFnVbhRpCfheRi2qJtIHiDdtji5B1rLf8kLgrgz+diwBu1WcHYpvfdKtdIltQmdmpVWFwOg+LnJN5o1kByVabOwpymDmMKeQDzxI3mJYkAMHfpFDRE7EBAQshypTu93xOJzB7xwNMLC+P1k0N6lWB8UhTDMR9X9bmm7HTPPHBW9O2I53f9jH7PAAhw0DuRudBguYcJECr+aHLIzKr2iQW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(22082099003)(11063799006)(56012099006)(6133799003)(18002099003)(8096899003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iulAhiXWpIwRkIdaFXPK7K3r6aydq9lZn6iPJwtXPwWPTeeZrST6BX24/krd?=
 =?us-ascii?Q?c11HngGIUTwSGKsaNuIMmoxDe9ZnKY5TbxJ2FevKxoI2gFAwInMbKNlDy3Rb?=
 =?us-ascii?Q?s5VDtYUt/1aPfkiiTn2LnXQlgdI68unLtLgfUaZDqVbRKD8MH+Nf2Oqh2q39?=
 =?us-ascii?Q?fmISH74hipHnFliWOiWOuujPdgEI/38vY4Hvx33P9J1xy5Ni6kJz+QHZq+4c?=
 =?us-ascii?Q?YRALlLTAmKRYrZICb5APMFG6dQp+ZW9fEmqVbobVIHvMQ8e4RCjIsu5u6rZw?=
 =?us-ascii?Q?KpYcJrq0N2Y6PS6jZYF6cycREgXb1Btv5jHHaCPgDyS/cPVRLXlXL25YgKiS?=
 =?us-ascii?Q?EKD7WiHMj9L74rFmmRCspMHkzq3DE41/QVjmnLNIzhI0LTdAF8X+UZxJqsD8?=
 =?us-ascii?Q?j5njbcAUOuxUFnY0PpV5sTzNN2+r6K3Z2ZSd0+rJ2z2fVZa2Sk+X/0Q+ZQxN?=
 =?us-ascii?Q?NJ+VRHqVPuDE5xcIutOVf3nt6RFEMjbVU0pX/FpC25cOqilfg9tuingzilJx?=
 =?us-ascii?Q?1ixKMOiyXHMkIkInGmZH+ZbHRwtr4mNAPPXHh+bJ89tc9pQxBZXV7O1NH1KK?=
 =?us-ascii?Q?NjJghsWDX/7UF9imD0ajoWS//3aOlPl509IsmI5qwEMCHzL0/eB16IokrtQL?=
 =?us-ascii?Q?pYvnh4ny3AV92qXIoOKrv0uKfw1FZzT0cFn2JmEWYJ1KUNcL7C2Wl4PY5bZn?=
 =?us-ascii?Q?PW+rrxn6EYX8JC0o5aZruz0cwDk7wnO9q1sUZ+ku8iUp8vEuTLSuwj1dRH2o?=
 =?us-ascii?Q?U3PIj4gUiMRHtyNoklJdkKijql8zDT73EgOl0CvzkmqgEZLQnHTDXoF9L90T?=
 =?us-ascii?Q?9tNdeKf5wJflqC/Nd85OJqxGI5ZfaFI8PKFkzAEJO9GFicUvJNOY2CCw+Sq2?=
 =?us-ascii?Q?StI4Ilqjs1uAj3QtZFA9dp7YAosSJPPC99GcpB5hL8p65rI7x8Zt5Cw1t5eO?=
 =?us-ascii?Q?MIVqLX9L4VQ88+rIP6j3AAzoZFKDC/tG7iGkA5P/JnrgLmlhtb+W5xACijWF?=
 =?us-ascii?Q?n0uCmzp9OQobcemXwxmdoIZHz0VvimPZEj7YTjXhAp2fVIyAYLdC1w3rCQID?=
 =?us-ascii?Q?/V014/XW2lbQE4gAfWYLKakyDFYHdw/X4nWvnU+PM0bPLcH9GZECWE8Rjbce?=
 =?us-ascii?Q?sjhpX6/ijpbEq4E0TnlUz1zu3Hq7I7opYW5Vor7Tmlzom/CcyGLMcpm92BB6?=
 =?us-ascii?Q?BDXnuZhsXVp6d5JYe6TwZE/WpGldBzIrr9o4Ojw8+x9lmxu0QmRChdlF1y0X?=
 =?us-ascii?Q?ktm9gbG85ofgpt3Am1Xbz49G/QNr1OE7H2KH6qbjMFf7CxBhetFBO5hgzTcv?=
 =?us-ascii?Q?mI322IR8yhE0rMqn3PPXTpkCXnfHvZKR2RqcgQbKmMkS0hX43bjzMwKGg/kL?=
 =?us-ascii?Q?lNUzY1ybDtAmxxEirshwof9C3MczGUgveq+Ns8lVOq4qvLkD9SLynE0APoMk?=
 =?us-ascii?Q?iZ/SFvjDlFFYkMlu9qlzjVQ2BOfO1/7Vk6ExsrpQLOUd90m4fqRrXvHX0wRH?=
 =?us-ascii?Q?Q/TkNlSMTgDLWLmcgUKwwPh2pjzL4oou6dCpUmhgUjoN8uME/wcDhsg4bPtn?=
 =?us-ascii?Q?lv+djR7jxknO4yANJVzaWKKsvtDWEZy80y/FT8OiopDh/1B09VPfsb3MV9pd?=
 =?us-ascii?Q?KctzrjUWAEs5sxfRVwM2ool2BUHO/AXDgfKg69hvC6+5KV11FjbgL2D0g+tN?=
 =?us-ascii?Q?1qLMPFekwyoXoqXA9T8KWCi8oOfrrt7ooKK/+S9NFyCfjIQ7vkjnGxlcxRdS?=
 =?us-ascii?Q?d3sBPmbo7+t8ieQjtx+ubWGUn89m8gJO4e2BXPQYXJeD5KwFpAkF/QFVubRN?=
x-ms-exchange-antispam-messagedata-1: BMO3a/lk3Rzcfe7IwRFzZ25HSjbB9Ak5OG7OXTsD9xNShSYJYnoCckZB
Content-Type: multipart/alternative;
 boundary="_000_CH3PR11MB8434B36DE08959B967174BF08D1E2CH3PR11MB8434namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YSFudx2NMzEi1ntZm7T+zih46KGdgAiUpfqkgwg2cZESR3RI7yHMgQtWKswga0NdqC2x6tqUZ1igY+pP9QiXIvsV54dcXMIPlDE/a3OI1c+WW60nAnfIvm6ayWpyb4w7FrJ8aSUxCY1ycvRzsYZcJwfcSz6/12hEFKIWC/ryj1AEz9CxJYmaAgle60j1gbdQk4V1sWefQoJ5mHa2IhfV2Uhrp4Iq3kek4c5Dy36xRSQGrZjTociUXU2YaU/NIGlb2takSDQTa3DUbQpNMmD/F1WJ3Xp6p7u/UOoLJSk610+apWvmcyH5oyhrnfeiskgmALbFo/JTDK9kxNFRPZgQmw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951f97b1-4e08-4e65-0f4f-08dec3752b27
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2026 02:41:53.5414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vGpyVSyuOPd2FlCqNZYkBF7lpWW9vXxOIjsulX5CG/IL//HFPdl6iOobTXRDKVsi+hpO7wPktTsa2j4RrOYnD3w6BrhexH25xtcQFPgIcPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8793
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

--_000_CH3PR11MB8434B36DE08959B967174BF08D1E2CH3PR11MB8434namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Chauhan, Aditya <aditya.chauhan@intel.com>
Sent: Friday, June 5, 2026 4:06 PM
To: Gandi, Ramadevi <ramadevi.gandi@intel.com>; igt-dev@lists.freedesktop.o=
rg <igt-dev@lists.freedesktop.org>
Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Girotra, Himanshu <=
himanshu.girotra@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_reset: suppress expected CGP_SYN=
C dmesg warning

From: Aditya Chauhan <aditya.chauhan@intel.com>

When multi-queue GT reset is triggered, it causes the kernel to emit
"Wait for CGP_SYNC_DONE response failed!" at warn level, which is
expected behavior as  the test intentionally validates that CGP_SYNC
failures are recoverable during GT reset.

Suppress the warning using igt_emit_ignore_dmesg_regex() in the
multi-queue-gt-reset and cm-multi-queue-gt-reset subtests to prevent
false dmesg-warn verdicts from igt_runner.

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel/xe_exec_reset.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 89a47d236..dc1ae7e99 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -29,6 +29,11 @@
 #define SYNC_OBJ_SIGNALED       (0x1 << 0)
 #define LEGACY_MODE_ADDR        0x1a0000

+static void ignore_gt_reset_warnings_in_dmesg(void)
+{
+       igt_emit_ignore_dmesg_regex("Wait for CGP_SYNC_DONE response failed=
");
+}
+
 /**
  * SUBTEST: spin
  * Description: test spin
@@ -1104,6 +1109,7 @@ int igt_main()

         igt_subtest("multi-queue-gt-reset") {
                 igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=
=3D IP_VER(35, 0));
+               ignore_gt_reset_warnings_in_dmesg();
                 xe_for_each_multi_queue_engine(fd, hwe)
                         xe_legacy_test_mode(fd, hwe, 16, 16,
                                             GT_RESET | MULTI_QUEUE,
@@ -1165,6 +1171,7 @@ int igt_main()

         igt_subtest("cm-multi-queue-gt-reset") {
                 igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=
=3D IP_VER(35, 0));
+               ignore_gt_reset_warnings_in_dmesg();
                 xe_for_each_multi_queue_engine(fd, hwe)
                         test_compute_mode(fd, hwe, 16, 16,
                                           GT_RESET | MULTI_QUEUE);
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
--
2.34.1


--_000_CH3PR11MB8434B36DE08959B967174BF08D1E2CH3PR11MB8434namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div id=3D"ms-outlook-mobile-body-separator-line" data-applydefaultfontstyl=
es=3D"true" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system=
, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;" dir=3D"ltr">
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" id=
=3D"ms-outlook-mobile-signature" dir=3D"ltr">
</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"mail-editor-reference-message-container">
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif;"><b>From:</b>&nbsp;Chauhan, Aditya &lt;aditya.chauhan@intel.com=
&gt;<br>
<b>Sent:</b>&nbsp;Friday, June 5, 2026 4:06 PM<br>
<b>To:</b>&nbsp;Gandi, Ramadevi &lt;ramadevi.gandi@intel.com&gt;; igt-dev@l=
ists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt;<br>
<b>Cc:</b>&nbsp;Dandamudi, Priyanka &lt;priyanka.dandamudi@intel.com&gt;; G=
irotra, Himanshu &lt;himanshu.girotra@intel.com&gt;<br>
<b>Subject:</b>&nbsp;[PATCH i-g-t] tests/intel/xe_exec_reset: suppress expe=
cted CGP_SYNC dmesg warning</span>
<div style=3D"font-family: Calibri, sans-serif;">&nbsp;</div>
</div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<div class=3D"PlainText" style=3D"font-size: 11pt;">From: Aditya Chauhan &l=
t;aditya.chauhan@intel.com&gt;<br>
<br>
When multi-queue GT reset is triggered, it causes the kernel to emit<br>
&quot;Wait for CGP_SYNC_DONE response failed!&quot; at warn level, which is=
<br>
expected behavior as&nbsp; the test intentionally validates that CGP_SYNC<b=
r>
failures are recoverable during GT reset.<br>
<br>
Suppress the warning using igt_emit_ignore_dmesg_regex() in the<br>
multi-queue-gt-reset and cm-multi-queue-gt-reset subtests to prevent<br>
false dmesg-warn verdicts from igt_runner.<br>
<br>
Signed-off-by: Aditya Chauhan &lt;aditya.chauhan@intel.com&gt;<br>
---<br>
&nbsp;tests/intel/xe_exec_reset.c | 7 +++++++<br>
&nbsp;1 file changed, 7 insertions(+)<br>
<br>
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c<br>
index 89a47d236..dc1ae7e99 100644<br>
--- a/tests/intel/xe_exec_reset.c<br>
+++ b/tests/intel/xe_exec_reset.c<br>
@@ -29,6 +29,11 @@<br>
&nbsp;#define SYNC_OBJ_SIGNALED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (0x1 &l=
t;&lt; 0)<br>
&nbsp;#define LEGACY_MODE_ADDR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x=
1a0000<br>
&nbsp;<br>
+static void ignore_gt_reset_warnings_in_dmesg(void)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_emit_ignore_dmesg_regex(&quot;Wai=
t for CGP_SYNC_DONE response failed&quot;);<br>
+}<br>
+<br>
&nbsp;/**<br>
&nbsp; * SUBTEST: spin<br>
&nbsp; * Description: test spin<br>
@@ -1104,6 +1109,7 @@ int igt_main()<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;multi-qu=
eue-gt-reset&quot;) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_require(intel_graphics_ver(intel_get_drm_devid(fd=
)) &gt;=3D IP_VER(35, 0));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ignore_gt_reset_warnings_in_dmesg();<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; xe_for_each_multi_queue_engine(fd, hwe)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_le=
gacy_test_mode(fd, hwe, 16, 16,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GT_RESET | MULTI_QUEUE,<br>
@@ -1165,6 +1171,7 @@ int igt_main()<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;cm-multi=
-queue-gt-reset&quot;) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_require(intel_graphics_ver(intel_get_drm_devid(fd=
)) &gt;=3D IP_VER(35, 0));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ignore_gt_reset_warnings_in_dmesg();<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; xe_for_each_multi_queue_engine(fd, hwe)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_=
compute_mode(fd, hwe, 16, 16,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; GT_RESET | MULTI_QUEUE);</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">LGTM,</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">Reviewed-by: Priyanka D=
andamudi &lt;priyanka.dandamudi@intel.com&gt;<br>
--<br>
2.34.1<br>
<br>
</div>
</div>
</div>
</body>
</html>

--_000_CH3PR11MB8434B36DE08959B967174BF08D1E2CH3PR11MB8434namp_--
