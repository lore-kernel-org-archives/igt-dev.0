Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17953C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 10:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0D010E3BF;
	Mon, 31 Mar 2025 10:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vk4r4B/O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1024A10E3D5
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743415350; x=1774951350;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Czn7Zmtjp0SNN+p2ZoU5146+Yxgb5X7FK3+aCdzhmgw=;
 b=Vk4r4B/OZ+hgsphYzIBIa4YhxS1GcFPz7nC+82osODbBTxcK8W6DvHd4
 VpZTIc1kSSgaMghYmxEc3cEhGaMHxWmBFKRTqsjEsK58y2yhH+OoGHcGG
 fU4P2HFUC8lzP90Vk4wxgtE7w0j2Quvxvc4CVT7RQqBt7xRqaIIh4wBpT
 REby06XKVWxpGvjRpCB20WowPaRLLtTp5KklKdA4jr1TqcZ1FPeKg/Qzd
 R/RB+kfHO9KM+ljeNGjGllS7EIUCEU9ZvlhhqL7kuBVSqUsh5/o81pNZS
 s4Z6XHsdixGq4os5yZ3I3MsmfdFxfdjhpRhNR/aKtDqCEsNGDfMtAg6Rh g==;
X-CSE-ConnectionGUID: wQ3QfHgOQ2yHww9TVSBDUw==
X-CSE-MsgGUID: Y8o31Ik9QjSYGyh/pS64mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="48481483"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="48481483"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:02:29 -0700
X-CSE-ConnectionGUID: YdBFA6o5QLqoxIag96zVhA==
X-CSE-MsgGUID: VqRcgtbVTAWwiBtmoOjFYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="126043881"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:02:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 03:02:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 03:02:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 03:02:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9XhVbrzkHqHM6bPHSDi0BUpORSz30jMJGa0V1SoKIqDoVcZEYfcSiqU0xArEcCcmRGIAgKQRYl9GO5f2svGAUKGT8ZzSJSPpVAeb3wMSt0AM7/i1WjdbXFJoOUXvHnExLvT2wvDVMoyNthbW9dWYYKkk0AE+5stBOyjOcGdX9k5K4WPXgrxtB/cClcRm+jtj2GoBHxm1AwYGKFCxife5RiKKfHy+IU7Tb+T7O4kLfpnJ3KQIG19lWKRLwCJpvNiy8TjKuch6DoyDXFckuGKPMMBEPI0rRjMI9GllYjFmoBwlUE3SJthaSL4zltwkHVNHOLnwVK7yDcZjFSCiE+GEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSvtbjBAFZ3YDztUClDQxeTR8R0l6cxrGH+dUYpG4Pw=;
 b=J86ZELx/Jlr9cd166T4U7GCw7N11qG2e/n8uD1Rp4cq6SgkstS9KLtl5kHNwDHykFBQ4UUyf9Bc50/vLVWL+W50eh2JOA4MWu4t3+WJNY2X+TN36nVRokNZb2YX6NlojrmhVBw1evRGbZWHjyHRCEeoqMUyyM4iihOnnx42tOOvniLjNUOaoklX+sEDR1OiWyw0oCMBci/SB0gnCyh9GDShHF3mdPT2zAyJ4P0dyNj5dkey7zo3SETeH24CKi/kfa3Yblm9PTYjsSQSjQ+OVkD4ndFq/5x6g71fD8ToEEY14gSpq3y7TYZmDhv3SnUySNTxT23PQ0rxZoklXBCWeDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by CH3PR11MB8154.namprd11.prod.outlook.com (2603:10b6:610:15f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Mon, 31 Mar
 2025 10:02:25 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%7]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 10:02:25 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Sokolowski, Jan" <jan.sokolowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sokolowski, Jan" <jan.sokolowski@intel.com>
Subject: RE: [PATCH i-g-t 1/1] tests/intel/xe_*: Add missing test documentation
Thread-Topic: [PATCH i-g-t 1/1] tests/intel/xe_*: Add missing test
 documentation
Thread-Index: AQHbnW8JspVEj7V3HU+llPHgWf5aFrONCb+Q
Date: Mon, 31 Mar 2025 10:02:24 +0000
Message-ID: <IA1PR11MB6097C5392480C4AE04828A6986AD2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20250325101544.178430-1-jan.sokolowski@intel.com>
In-Reply-To: <20250325101544.178430-1-jan.sokolowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|CH3PR11MB8154:EE_
x-ms-office365-filtering-correlation-id: a25ed74c-148f-4499-5472-08dd703b230d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?yV5CkAJKJmbzsd1RvS9eTj3ak82Uei5LXvqj1rKi2l/ldurwzuOysagi9cdL?=
 =?us-ascii?Q?2sFXj3mz9GMu9mUB8KhSPSJMMlJLsr/tD8j7gSinbc5ZsvtbUWwh0P3G7TfC?=
 =?us-ascii?Q?DlfLYhVGNT39JEaX6FICWQEAXagrc+20eVVVfNuWDZ1kccwRAc/4jTq3z/62?=
 =?us-ascii?Q?LG1hKB5CO8nBBynFIUlmqvBswiFY0GYE3HBIkIJgk17b4aNv18/CphWABvxA?=
 =?us-ascii?Q?fE7BMUaSMPWcJPuL7pjfb6qHS2TW6lBxxMQzNQxzopyyyDUbimhQq7c3hVJe?=
 =?us-ascii?Q?Da/xVQEwRIIdqpk3BolHFbFiL+EvIn61GvRX8z11F3CuAjHmEMpeyqQJ/UoR?=
 =?us-ascii?Q?2WSPDVtXIbJqevOxcGAtj0RkgFtfR+dZlfNsRSXDD0Oi1b9QZmcKSKqD974N?=
 =?us-ascii?Q?Pzr9wgbCsI0ovE2v2gdyWWi9xYW+S8aP/PGa+6uritceJc8arf0Z/3FI3v9S?=
 =?us-ascii?Q?hhwc7fTOjvOCMELthO55w9Js8t1qxLoEOeU4O3ceu3jInbOm9irrY2LKYN5h?=
 =?us-ascii?Q?3LyBqyGR699zNpIVn8GyLvMiS5z9P7NpcGmkIvE3Rj1aEVFxbOSKlhxtIY8p?=
 =?us-ascii?Q?FG2iM3Wpngo5EGR9JMPRxUOLieyTSLS9pJB2rG8WWydqlP4dHsxExwpiIQUJ?=
 =?us-ascii?Q?Hv1igdmkXt7DjojadYyepoKMR/sk8xtDXYB+UJV26lt4aMCkoDyG6RDz9thm?=
 =?us-ascii?Q?kCv8P+6AxC62KrX1+UoCZW+jGiYQRkwm1lLSFc53fjA5Wg10PVcOZHWQ4CnL?=
 =?us-ascii?Q?sq9ALTJjQRmXoYQ665V+7Fs662v6uBJynIX3rgqTjjOijWPmzZnsTEAyvvZj?=
 =?us-ascii?Q?d6jMBWiEs5jwqh2B+Wps2Ib+XPKzxXM2p3ms0z/bh/MNCnwX96dIRkvyPdy4?=
 =?us-ascii?Q?EnlttEoOOAMYkW/+5b58oz051QFY8iEqNS6MsD6F9CjDLfkgqKNrhni7wh88?=
 =?us-ascii?Q?cue+reU8UKlkiSalE1O8+aEFoHHFJobwtEKG1+KaU9r1vTFRZV8NQEicxPkJ?=
 =?us-ascii?Q?5qp3l978GSjjy3lHBcQmHzJSTfo9JZ9UDY+23JRzE3Bc6SqdQCIaDr77oePK?=
 =?us-ascii?Q?0qGqwiBIGaWz8t5a4VI/zbASA6xNP5GHplWRhWQhet/q7Q09ixyKLgiTLd2q?=
 =?us-ascii?Q?kkkSP1KFXEV+gyg3jNinCriWNzyPkPZchmU8jFnDD1Bi6Yl2/IKQcxvrpZkw?=
 =?us-ascii?Q?lfDuVkLhhFst9kcMau2cOi6I0INwQN2bWNayVvzgCJGG1BAtsDV6FhpGD+tb?=
 =?us-ascii?Q?2/oAw7ZGIv22Ge6+duHR8SxgJDq16X3yrPRrBV8PD8kTHitimERYf56f9CZo?=
 =?us-ascii?Q?h4bBgGkDFO+VCZDLffJ+s2pUC7GownzXFdVjlmtmwbLjsEI59yNKQ7A9vi40?=
 =?us-ascii?Q?kLrOvLEwiYQK0kCBfV6W1k/hX++hxNI7l5NM034ltc5Vhb/cwW034M8PzV27?=
 =?us-ascii?Q?GRPkzuaJ194R1YaTL/hmrxxCZeiHXlxu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tc9c52V+kCT0y4gIlJWmTKdBtz3svlLEiFDUIgtAm6G8kPL/Y+yGN8qXep8D?=
 =?us-ascii?Q?15Hax4MjRbOpfISVtq+rTxgS12VfyJ4gx1ID0z/p58XK2WWNXbq+0tBOITOn?=
 =?us-ascii?Q?44zX43tBZdZjTDKP4e/6mqWZzzmRmNJlNOH9bQrlYDiVzCqNpAmECQLLfU6h?=
 =?us-ascii?Q?nw/psqg/tkAW7J45PsgPzhL5mJuOi2alKREiBU8NlO+JhnDM3BKNrtCJp5Up?=
 =?us-ascii?Q?kJbsJEeZl8FmjZkVjS3pshNI0atPUSwNaGq3yl7Z5Menyhu8vvQSmUsx0rA7?=
 =?us-ascii?Q?RWOxULiMyEKPtiKFb6CrzvWr6ucJhp/QIwqGLmQ8dnGMqiheOA84/sL5oxte?=
 =?us-ascii?Q?PJc7pkGdPDqFEYjZgmY4IKOVN1q//n3j7noi76BLFwOHRlwAHgL+So8o6O4O?=
 =?us-ascii?Q?9jCATCzYqm4Qo1phcbj0Kh2//JeJznVk/TUTXePHRnRw1K2XWSFeLmJwU0cN?=
 =?us-ascii?Q?N8AzHc3JuW/KRIN8KIpRCjtm6vHebyJBjc6/pL2IJeeEAT8q+y43Jqsp94Gh?=
 =?us-ascii?Q?cHPOXkisz2qN3TK9dX5Ai6KUpP+b5SXRiXBB77wjJEgQ29F9/t5LCjBNf6Lf?=
 =?us-ascii?Q?21bjXqbjUVolG9rsoIlO4M3wzKSCFzPuptsKimPOw+wyYmlWFilGaOGs1KJ/?=
 =?us-ascii?Q?hrkfjqS6Rvq6znvjexMVP01KNiJ4WIsoswDvZozRI8V9NYbqMFmBA7KZgsEL?=
 =?us-ascii?Q?WY2UYM8R3nYG8OliWAeM5xCrURQxkitVI344y+yBGRJBSBCw3/FI7OWzpOql?=
 =?us-ascii?Q?yEhqx51ZfVINMsdIhtRGNIKjcEpUwXaclZNrUoDhleeYwhgG/8J0YiH4bI/7?=
 =?us-ascii?Q?T0yqTf71w+2dpMt0f8XNrAVAsr2DwoAoWyPeAG9d1lIi67K9R/F1FnqpnpZF?=
 =?us-ascii?Q?AsB/5dIiUBhT7g3hJPo0H75zxPBhtxfl3dt1KSv4ji19UbwPyGPZ2pX8HDtj?=
 =?us-ascii?Q?MCwzcEDddqef/fXMttH1erf5J8bkxjgkPY5kOp5jUSpjDsDutW7R30nl7bsS?=
 =?us-ascii?Q?ybGX7DeWK2Q4quJf6hIs4zApW0H3rSk5uuOmruxki+GtLyUVG37+YJCdyVS8?=
 =?us-ascii?Q?zxHLKiSIHvFIi8bcF474/wK9S2XcZgw21rfre4BXaBOysDpMl66RmtRIPPuw?=
 =?us-ascii?Q?oOTWHCVjndAIAvKB0wIyezV1r5gntz58D4A2WW5rO39rpiZYQrWU2Hei0z5H?=
 =?us-ascii?Q?7K+gNmpKSvfMiRNrZno0XAWijQkCOriusoY6u+53/SfBfoK8USTKB/JCbTOS?=
 =?us-ascii?Q?rx1ZH/Kv21W3f9bX+LGv+iXVjKhxqupF5v9ov6A4fnOJFuaoENNt+SqPtTCp?=
 =?us-ascii?Q?WrtaOtjF3+hbPKnRKGNxy74Zy4boCrJvmJMTPVA1vAn5fscSRVuu1liDDrQC?=
 =?us-ascii?Q?wSGG9gDavsFjZchxixV/J9obiyPWPltqpngEHimecL4JssSgtStj2NuhiIxQ?=
 =?us-ascii?Q?wEzPL9hFfxQpVpItqVq9CxDA9GcmonPsfPYi9G3+ALhYa7oQex0UFHOos6/8?=
 =?us-ascii?Q?Dtn8MSGfaHCAvcXcc5jd02rX+QAkj/bafa9Yy6uSZNep3iloJreoM0lpqThK?=
 =?us-ascii?Q?J68xfkB64toushaYj/7X/dgFkcCfnoNBBjjBtOq4BzlIoTawbLrcZk7VbvPa?=
 =?us-ascii?Q?4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a25ed74c-148f-4499-5472-08dd703b230d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 10:02:24.9888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7aVXCx4I3DAkRWDWo7UCrNwNZ17rv0gF9I21Vgv573hkyileEV3Zl8Ksta1oD2bMcFYELpkEWFxGJteHa7gpLC14q7pP8ef82qIyVXYpI8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8154
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

Add missing Mega features, Sub-categories and Functionality tags to various=
 eu debug tests.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 tests/intel/xe_eudebug.c          | 77 ++++++++++++++++++++++++++++---
 tests/intel/xe_eudebug_online.c   | 42 +++++++++++++++++
 tests/intel/xe_eudebug_sriov.c    |  6 +++
 tests/intel/xe_exec_sip_eudebug.c | 12 +++++
 4 files changed, 130 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index 7687=
0805c..bf9178a67 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -28,6 +28,8 @@
=20
 /**
  * SUBTEST: sysfs-toggle
+ * Sub-category: EUdebug framework
+ * Functionality: enable
  * Description:
  *	Exercise the debugger enable/disable sysfs toggle logic
  */
@@ -542,6 +544,8 @@ static int __debug_connect(int fd, int *debugfd, struct=
 drm_xe_eudebug_connect *
=20
 /**
  * SUBTEST: basic-connect
+ * Sub-category: EUdebug framework
+ * Functionality: attach
  * Description:
  *	Exercise XE_EUDEBUG_CONNECT ioctl with passing
  *	valid and invalid params.
@@ -622,6 +626,8 @@ static void switch_user(__uid_t uid, __gid_t gid)
=20
 /**
  * SUBTEST: connect-user
+ * Sub-category: EUdebug framework
+ * Functionality: attach
  * Description:
  *	Verify unprivileged XE_EUDEBUG_CONNECT ioctl.
  *	Check:
@@ -758,6 +764,8 @@ static void test_connect_user(int fd)
=20
 /**
  * SUBTEST: basic-close
+ * Sub-category: EUdebug framework
+ * Functionality: attach
  * Description:
  *	Test whether eudebug can be reattached after closure.
  */
@@ -786,6 +794,8 @@ static void test_close(int fd)
=20
 /**
  * SUBTEST: basic-read-event
+ * Sub-category: EUdebug framework
+ * Functionality: events
  * Description:
  *	Synchronously exercise eu debugger event polling and reading.
  */
@@ -881,50 +891,69 @@ static void test_read_event(int fd)
=20
 /**
  * SUBTEST: basic-client
+ * Sub-category: EUdebug framework
+ * Functionality: attach
  * Description:
  *	Attach the debugger to process which opens and closes xe drm client.
  *
  * SUBTEST: basic-client-th
+ * Sub-category: EUdebug framework
+ * Functionality: attach
  * Description:
  *	Create client basic resources (vms) in multiple threads
  *
  * SUBTEST: multiple-sessions
+ * Sub-category: EUdebug framework
+ * Functionality: multisessions
  * Description:
  *	Simultaneously attach many debuggers to many processes.
  *	Each process opens and closes xe drm client and creates few resources.
  *
- * SUBTEST: basic-%s
+ * SUBTEST: basic-exec-queues
+ * Sub-category: EUdebug framework
+ * Functionality: exec queues events

[Kasia] Please check if test igt@xe_eudebug@basic-exec-queues-enable has do=
cumentation as I do not see it in this patch:
Sub-category: EUdebug framework
Functionality: exec queues events


  * Description:
- *	Attach the debugger to process which creates and destroys a few %arg[1]=
.
+ *	Attach the debugger to process which creates and destroys a few exec-qu=
eues.
+ *
+ * SUBTEST: basic-vms
+ * Sub-category: EUdebug framework
+ * Functionality: VM events
+ * Description:
+ *	Attach the debugger to process which creates and destroys a few vms.
  *
  * SUBTEST: basic-vm-bind
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Attach the debugger to a process that performs synchronous vm bind
  *	and vm unbind.
  *
  * SUBTEST: basic-vm-bind-vm-destroy
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Attach the debugger to a process that performs vm bind, and destroys
  *	the vm without unbinding. Make sure that we don't get unbind events.
  *
  * SUBTEST: basic-vm-bind-extended
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Attach the debugger to a process that performs bind, bind array, rebind=
,
  *	partial unbind, unbind and unbind all operations.
  *
  * SUBTEST: multigpu-basic-client
+ * Sub-category: EUdebug framework
+ * Functionality: attach multiGPU
  * Description:
  *	Attach the debugger to process which opens and closes xe drm client on =
all Xe devices.
  *
  * SUBTEST: multigpu-basic-client-many
+ * Sub-category: EUdebug framework
+ * Functionality: attach multiGPU
  * Description:
  *	Simultaneously attach many debuggers to many processes on all Xe device=
s.
  *	Each process opens and closes xe drm client and creates few resources.
- *
- * arg[1]:
- *
- * @vms: vms
- * @exec-queues: exec queues
  */
=20
 static void test_basic_sessions(int fd, unsigned int flags, int count, boo=
l match_opposite) @@ -951,22 +980,30 @@ static void test_basic_sessions(int=
 fd, unsigned int flags, int count, bool matc
=20
 /**
  * SUBTEST: basic-vm-bind-discovery
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Attach the debugger to a process that performs vm-bind before attaching
  *	and check if the discovery process reports it.
  *
  * SUBTEST: basic-vm-bind-metadata-discovery
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event


[Kasia] Please change functionality:
s/Functionality: VM bind even/ Functionality: VM bind metadata/

  * Description:
  *	Attach the debugger to a process that performs vm-bind with metadata at=
tached
  *	before attaching and check if the discovery process reports it.
  *
  * SUBTEST: basic-vm-bind-vm-destroy-discovery
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Attach the debugger to a process that performs vm bind, and destroys
  *	the vm without unbinding before attaching. Make sure that we don't get
  *	any bind/unbind and vm create/destroy events.
  *
  * SUBTEST: basic-vm-bind-extended-discovery
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Attach the debugger to a process that performs bind, bind array, rebind=
,
  *	partial unbind, and unbind all operations before attaching. Ensure that
@@ -1077,6 +1114,8 @@ static void run_discovery_client(struct xe_eudebug_cl=
ient *c)
=20
 /**
  * SUBTEST: discovery-%s
+ * Sub-category: EUdebug framework
+ * Functionality: event discovery
  * Description: Race discovery against %arg[1] and the debugger dettach.
  *
  * arg[1]:
@@ -1562,12 +1601,16 @@ static void vm_trigger(struct xe_eudebug_debugger *=
d,
=20
 /**
  * SUBTEST: basic-vm-access
+ * Sub-category: EUdebug framework
+ * Functionality: VM access
  * Description:
  *      Exercise XE_EUDEBUG_VM_OPEN with pread and pwrite into the
  *      vm fd, concerning many different offsets inside the vm,
  *      and many virtual addresses of the vm_bound object.
  *
  * SUBTEST: basic-vm-access-userptr
+ * Sub-category: EUdebug framework
+ * Functionality: VM access
  * Description:
  *      Exercise XE_EUDEBUG_VM_OPEN with pread and pwrite into the
  *      vm fd, concerning many different offsets inside the vm,
@@ -1713,11 +1756,15 @@ static void vm_trigger_access_parameters(struct xe_=
eudebug_debugger *d,
=20
 /**
  * SUBTEST: basic-vm-access-parameters
+ * Sub-category: EUdebug framework
+ * Functionality: VM access
  * Description:
  *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
  *      with bo backing storage.
  *
  * SUBTEST: basic-vm-access-parameters-userptr
+ * Sub-category: EUdebug framework
+ * Functionality: VM access
  * Description:
  *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
  *      with userptr backing storage.
@@ -1845,6 +1892,8 @@ static void metadata_read_on_vm_bind_trigger(struct x=
e_eudebug_debugger *d,
=20
 /**
  * SUBTEST: read-metadata
+ * Sub-category: EUdebug framework
+ * Functionality: metadata
  * Description:
  *      Exercise DRM_XE_EUDEBUG_IOCTL_READ_METADATA and debug metadata cre=
ate|destroy events.
  */
@@ -1857,6 +1906,8 @@ static void test_metadata_read(int fd, unsigned int f=
lags, int num_clients)
=20
 /**
  * SUBTEST: attach-debug-metadata
+ * Sub-category: EUdebug framework
+ * Functionality: metadata
  * Description:
  *      Read debug metadata when vm_bind has it attached.
  */
@@ -2073,19 +2124,27 @@ static int wait_for_ufence_events(struct ufence_pri=
v *priv, int timeout_ms)
=20
 /**
  * SUBTEST: basic-vm-bind-ufence
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *      Give user fence in application and check if ufence ack works
  *
  * SUBTEST: basic-vm-bind-ufence-delay-ack
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Give user fence in application and check if delayed ufence ack works
  *
  * SUBTEST: basic-vm-bind-ufence-reconnect
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Give user fence in application, hold it, drop the debugger connection a=
nd check if anything
  *	breaks. Expect that held acks are released when connection is dropped.
  *
  * SUBTEST: basic-vm-bind-ufence-sigint-client
+ * Sub-category: EUdebug framework
+ * Functionality: SIGINT
  * Description:
  *	Give user fence in application, hold it, send SIGINT to client and chec=
k if anything breaks.
  */
@@ -2395,6 +2454,8 @@ static void vm_bind_clear_ack_trigger(struct xe_eudeb=
ug_debugger *d,
=20
 /**
  * SUBTEST: vm-bind-clear
+ * Sub-category: EUdebug framework
+ * Functionality: memory access
  * Description:
  *      Check that fresh buffers we vm_bind into the ppGTT are always clea=
r.
  */
@@ -2610,6 +2671,8 @@ static void vma_ufence_trigger(struct xe_eudebug_debu=
gger *d,
=20
 /**
  * SUBTEST: vma-ufence
+ * Sub-category: EUdebug framework
+ * Functionality: check ufence blocking
  * Description:
  *      Intercept vm bind after receiving ufence event, then access target=
 vm and write to it.
  *      Then check on client side if the write was successful.
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_onlin=
e.c index 84ba748c1..c4409f8a5 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1430,21 +1430,29 @@ static void pagefault_trigger(struct xe_eudebug_deb=
ugger *d,
=20
 /**
  * SUBTEST: basic-breakpoint
+ * Sub-category: EUdebug online
+ * Functionality: EU attention event
  * Description:
  *	Check whether KMD sends attention events
  *	for workload in debug mode stopped on breakpoint.
  *
  * SUBTEST: breakpoint-not-in-debug-mode
+ * Sub-category: EUdebug online
+ * Functionality: EU attention event
  * Description:
  *	Check whether KMD resets the GPU when it spots an attention
  *	coming from workload not in debug mode.
  *
  * SUBTEST: stopped-thread
+ * Sub-category: EUdebug online
+ * Functionality: EU attention event
  * Description:
  *	Hits breakpoint on runalone workload and
  *	reads attention for fixed time.
  *
  * SUBTEST: resume-%s
+ * Sub-category: EUdebug online
+ * Functionality: EU control
  * Description:
  *	Resumes stopped on a breakpoint workload
  *	with granularity of %arg[1].

[Kasia] Please change Description of resume-* test cases to something like:
Workload stopped on breakpoint is resumed with granularity of %arg[1] threa=
d


@@ -1479,6 +1487,8 @@ static void test_basic_online(int fd, struct drm_xe_e=
ngine_class_instance *hwe,
=20
 /**
  * SUBTEST: set-breakpoint
+ * Sub-category: EUdebug online
+ * Functionality: dynamic breakpoint
  * Description:
  *	Checks for attention after setting a dynamic breakpoint in the ufence e=
vent.
  */
@@ -1603,11 +1613,15 @@ static void test_set_breakpoint_online_sigint_debug=
ger(int fd,
=20
[Kasia] Meantime new breakpoint test was added with SIGINT igt@xe_eudebug_o=
nline@set-breakpoint-sigint-debugger
Please add documentation for it as well:
Sub-category: EUdebug online
Functionality: SIGINT

The rest looks ok.
Kasia

 /**
  * SUBTEST: pagefault-read
+ * Sub-category: EUdebug online
+ * Functionality: page faults
  * Description:
  *     Check whether KMD sends pagefault event for workload in debug mode =
that
  *     triggers a read pagefault.
  *
  * SUBTEST: pagefault-write
+ * Sub-category: EUdebug online
+ * Functionality: page faults
  * Description:
  *     Check whether KMD sends pagefault event for workload in debug mode =
that
  *     triggers a write pagefault.
@@ -1646,6 +1660,8 @@ static void test_pagefault_online(int fd, struct drm_=
xe_engine_class_instance *h
=20
 /**
  * SUBTEST: preempt-breakpoint
+ * Sub-category: EUdebug online
+ * Functionality: EUdebug preemption timeout
  * Description:
  *	Verify that eu debugger disables preemption timeout to
  *	prevent reset of workload stopped on breakpoint.
@@ -1691,6 +1707,8 @@ static void test_preemption(int fd, struct drm_xe_eng=
ine_class_instance *hwe)
=20
 /**
  * SUBTEST: reset-with-attention
+ * Sub-category: EUdebug online
+ * Functionality: EUdebug preemption timeout
  * Description:
  *	Check whether GPU is usable after resetting with attention raised
  *	(stopped on breakpoint) by running the same workload again.
@@ -1728,12 +1746,16 @@ static void test_reset_with_attention_online(int fd=
, struct drm_xe_engine_class_
=20
 /**
  * SUBTEST: interrupt-all
+ * Sub-category: EUdebug online
+ * Functionality: EU control
  * Description:
  *	Schedules EU workload which should last about a few seconds, then
  *	interrupts all threads, checks whether attention event came, and
  *	resumes stopped threads back.
  *
  * SUBTEST: interrupt-all-set-breakpoint
+ * Sub-category: EUdebug online
+ * Functionality: dynamic breakpoint
  * Description:
  *	Schedules EU workload which should last about a few seconds, then
  *	interrupts all threads, once attention event come it sets breakpoint on
@@ -1815,12 +1837,16 @@ static void reset_debugger_log(struct xe_eudebug_de=
bugger *d)
=20
 /**
  * SUBTEST: interrupt-other-debuggable
+ * Sub-category: EUdebug online
+ * Functionality: EU control
  * Description:
  *	Schedules EU workload in runalone mode with never ending loop, while
  *	it is not under debug, tries to interrupt all threads using the differe=
nt
  *	client attached to debugger.
  *
  * SUBTEST: interrupt-other
+ * Sub-category: EUdebug online
+ * Functionality: EU control
  * Description:
  *	Schedules EU workload with a never ending loop and, while it is not
  *	configured for debugging, tries to interrupt all threads using the clie=
nt
@@ -1909,6 +1935,8 @@ static void test_interrupt_other(int fd, struct drm_x=
e_engine_class_instance *hw
=20
 /**
  * SUBTEST: tdctl-parameters
+ * Sub-category: EUdebug online
+ * Functionality: EU control
  * Description:
  *	Schedules EU workload which should last about a few seconds, then
  *	checks negative scenarios of EU_THREADS ioctl usage, interrupts all thr=
eads,
@@ -2061,6 +2089,8 @@ static void eu_attention_debugger_detach_trigger(stru=
ct xe_eudebug_debugger *d,
=20
 /**
  * SUBTEST: interrupt-reconnect
+ * Sub-category: EUdebug online
+ * Functionality: reopen connection
  * Description:
  *	Schedules EU workload which should last about a few seconds,
  *	interrupts all threads and detaches debugger when attention is
@@ -2134,12 +2164,16 @@ static void test_interrupt_reconnect(int fd, struct=
 drm_xe_engine_class_instance
=20
 /**
  * SUBTEST: single-step
+ * Sub-category: EUdebug online
+ * Functionality: EU control
  * Description:
  *	Schedules EU workload with 16 nops after breakpoint, then single-steps
  *	through the shader, advances all threads each step, checking if all
  *	threads advanced every step.
  *
  * SUBTEST: single-step-one
+ * Sub-category: EUdebug online
+ * Functionality: EU control
  * Description:
  *	Schedules EU workload with 16 nops after breakpoint, then single-steps
  *	through the shader, advances one thread each step, checking if one
@@ -2191,6 +2225,8 @@ static void eu_attention_debugger_ndetach_trigger(str=
uct xe_eudebug_debugger *d,
=20
 /**
  * SUBTEST: debugger-reopen
+ * Sub-category: EUdebug online
+ * Functionality: reopen connection
  * Description:
  *	Check whether the debugger is able to reopen the connection and
  *	capture the events of already running client.
@@ -2221,6 +2257,8 @@ static void test_debugger_reopen(int fd, struct drm_x=
e_engine_class_instance *hw
=20
 /**
  * SUBTEST: writes-caching-%s-bb-%s-target-%s
+ * Sub-category: EUdebug online
+ * Functionality: cache coherency
  * Description:
  *	Write incrementing values to 2-page-long target surface, poisoning the =
data one breakpoint
  *	before each write instruction and restoring it when the poisoned instru=
ction breakpoint
@@ -2346,12 +2384,16 @@ static uint64_t timespecs_diff_us(struct timespec *=
ts1, struct timespec *ts2)
=20
 /**
  * SUBTEST: breakpoint-many-sessions-single-tile
+ * Sub-category: EUdebug online
+ * Functionality: multisession
  * Description:
  *	Schedules EU workload with preinstalled breakpoint on every compute eng=
ine
  *	available on the tile. Checks if the contexts hit breakpoint in sequenc=
e
  *	and resumes them.
  *
  * SUBTEST: breakpoint-many-sessions-tiles
+ * Sub-category: EUdebug online
+ * Functionality: multisession multiTile
  * Description:
  *	Schedules EU workload with preinstalled breakpoint on selected compute
  *      engines, with one per tile. Checks if each context hit breakpoint =
and
diff --git a/tests/intel/xe_eudebug_sriov.c b/tests/intel/xe_eudebug_sriov.=
c index eb13981bc..4f20a3e49 100644
--- a/tests/intel/xe_eudebug_sriov.c
+++ b/tests/intel/xe_eudebug_sriov.c
@@ -37,6 +37,9 @@ static bool has_vf_enable_eudebug_attr(int fd, unsigned i=
nt vf_num)
=20
 /**
  * SUBTEST: deny-eudebug
+ * Mega feature: EUdebug
+ * Sub-category: EUdebug framework
+ * Functionality: EU debug and SR-IOV
  * Description:
  *	Check that eudebug toggle is not available for VFs, and that enabling
  *	eudebug with VFs enabled is not permitted.
@@ -74,6 +77,9 @@ static void test_deny_eudebug(int fd)
=20
 /**
  * SUBTEST: deny-sriov
+ * Mega feature: EUdebug
+ * Sub-category: EUdebug framework
+ * Functionality: EU debug and SR-IOV
  * Description:
  *	Check that VFs cannot be enabled when eudebug is enabled.
  */
diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eu=
debug.c
index c317112b4..e5b8ba418 100644
--- a/tests/intel/xe_exec_sip_eudebug.c
+++ b/tests/intel/xe_exec_sip_eudebug.c
@@ -217,22 +217,34 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_eng=
ine_class_instance *eci)
=20
 /**
  * SUBTEST: wait-writesip-nodebug
+ * Sub-category: EUdebug HW
+ * Functionality: EU debugger SIP interaction
  * Description: verify that we don't enter SIP after wait with debugging d=
isabled.
  *
  * SUBTEST: breakpoint-writesip-nodebug
+ * Sub-category: EUdebug HW
+ * Functionality: EU debugger SIP interaction
  * Description: verify that we don't enter SIP after hitting breakpoint in=
 shader
  *		when debugging is disabled.
  *
  * SUBTEST: breakpoint-writesip
+ * Sub-category: EUdebug HW
+ * Functionality: EU debugger SIP interaction
  * Description: Test that we enter SIP after hitting breakpoint in shader.
  *
  * SUBTEST: breakpoint-writesip-twice
+ * Sub-category: EUdebug HW
+ * Functionality: EU debugger SIP interaction
  * Description: Test twice that we enter SIP after hitting breakpoint in s=
hader.
  *
  * SUBTEST: breakpoint-waitsip
+ * Sub-category: EUdebug HW
+ * Functionality: EU debugger SIP interaction
  * Description: Test that we reset after seeing the attention without the =
debugger.
  *
  * SUBTEST: breakpoint-waitsip-heavy
+ * Sub-category: EUdebug HW
+ * Functionality: EU debugger SIP interaction
  * Description:
  *	Test that we reset after seeing the attention from heavy SIP, that rese=
mbles
  *	the production one, without the debugger.
--
2.34.1

