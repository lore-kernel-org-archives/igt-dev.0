Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B36FD6B07E
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 15:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71D110E118;
	Thu, 29 Jan 2026 15:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXM2+49T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838CF10E118
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 15:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769702289; x=1801238289;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BossLH4WZRIxzdK+ZFsj9He669SXWt1wJKSeY09CKQE=;
 b=fXM2+49TPbJl7MZ3JmpkYQvkDQP7MSAcwoqrzmKWETRe9mZDx8JwRFH7
 qEKWYEXVCzIGb37u+rr9/RTvSfVbjOLpZ5LvHsuo74TxuH3y6bsvGdNck
 VH4xUF6qO+liIH7YdaPmYs6DmxFPs+T/pmAOZNw7fve6kO0bEx04ntDgb
 EjHD91hu5yFVBmylHqDAipeKzLYbNPuzrKtU778hfVgMDLngvEo8jr16D
 86o8LeHFO0dOVJuAbOSqCySCuk4eH4CzoFjuShSf5Rg3UZAE7JwoDaxu4
 hTA0wkfPJiDi4moxJ6s0bSXVrwtpA4LxaV/36Z2OSsr+Lrt8w+/JgZF/L Q==;
X-CSE-ConnectionGUID: vhkq03h2SSGPiDOgs7nLEQ==
X-CSE-MsgGUID: 1+BkbWxOSIKr24evt3qB/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70918626"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70918626"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 07:58:09 -0800
X-CSE-ConnectionGUID: HcaXFtk0QN6Cv5Ev3gVfZQ==
X-CSE-MsgGUID: ZTxyi9wlTiCh1tZ5tAUWIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208618920"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 07:58:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 07:58:05 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 07:58:05 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 07:58:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdROMJFokJFIyW6xI0+cErwKnmv+hgRdR3A0Bu9vLwfXyzZ5MF5OvGsTZ9QZILIDWqCrnLmgS8s0YllNARgVss0Bh2UCw5fYr0MFW2KasY/fpo+HnBEispNEnTgYFhkDcBxW0kY4uEnT/Bt0yXKcyOtxXo778I0iP9YAnZfBJKuP0bDSQZpL/1m1vJxYPZV3cWTygyQQczhXphcTi5mbtX79pqXpDoelvdqeddrwHsyGsIzcK1GGD/DpJcRzoLMIe9AxjPhExiYWnI+gpLiTCNooLgSipjdWaECr4syYaR7WAaI/hWZTJ9jD8/EkBXQKBwjve/rbd9JxAsubC7/DXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4srvO4UiBjt8tyn6IDPod8TOoYGZsOJjOzq0fPH4cFg=;
 b=rBFb9meu87QUAP96S2KhnmR25IWF5aC4FPFzp/i5lTHb3uDVLQDOPo/TFqEsy7MI9fKK/ievuLiUfWhWnGtOaHD/Q1NY8kA+2lXLvZYOAIFjpxt5kRN00jQFK1uW/bSwuveMUCbug1VYT+8b4w1sCMtimTuw7m0iACLwiR7069XquBdkqV3mDfKPDjzKDxHL87mBRJ+wNhnW/8LrAWjwabovh/ztrHFwfafjUMlK5wJyf4JTUuVPNTK7MlqyanKzWUlVY6bXiYeKw6+xrJtnPv4ls2pJ+kb38ei/cwNuxCxfEz6+Bn89Ben2+8MKaBNCDiwxxeefu2IJx6jaEoNokQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by SA2PR11MB5065.namprd11.prod.outlook.com (2603:10b6:806:115::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 15:58:02 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%5]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 15:58:02 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to
 common library
Thread-Topic: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to
 common library
Thread-Index: AQHcj1cTEGA4JesRbEOSOrp7u+FHDbVpTvKg
Date: Thu, 29 Jan 2026 15:58:01 +0000
Message-ID: <MN0PR11MB6034689ECA61B11F1A21959C819EA@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260127063432.183096-1-jeevan.b@intel.com>
In-Reply-To: <20260127063432.183096-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|SA2PR11MB5065:EE_
x-ms-office365-filtering-correlation-id: c33222b9-22fa-475f-e670-08de5f4f2e8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nXKxqiHKA1Hp1nEu18D9uLOy/6D6b+x/QyP85Q8NXy1uCRH4ZN/m8+5lKfCc?=
 =?us-ascii?Q?ixcz7NfT3kQBi5J+clF0WZce7d3TsRV36T00E7aMrlITAcShXw40Eum5+mi2?=
 =?us-ascii?Q?lbxjRzMbAwOJxdQ4BOuiuYdC3wIB/UhttxhnwLLjsBQrWLFJIGv47hvKVH3Y?=
 =?us-ascii?Q?CeZFMpt6MqOuUd0SAH1SOabnzpWZLH4tezMVBXkzxDSxMoeHJIhzzIXqVlo5?=
 =?us-ascii?Q?J1Oj7Op6uBrdtlOnp8WeMoHXhx01UuM6BrDQZhIMqjbc2MvbAZeqygJM8Zad?=
 =?us-ascii?Q?4fL51MOJBYt4FCwXWaBCl9uved3J4KY1htn8aPjoo8KDVfyx+ZEjjjV+PIdu?=
 =?us-ascii?Q?PH4EGPOrqp3LkEr4ALyoSzF+cCGjqyKlXw+JaDBKLPq6LtEQeMrxmC6OONJJ?=
 =?us-ascii?Q?7uMsFNpJmgjgR9M8saIBKEs4xfqd6VKmT1MiYjXGzXCSTcqI60tQyMr5U4Mv?=
 =?us-ascii?Q?ifbaFZnbheDCYTIScWtwuQ+wgRYQqsgDHQOTgSjL9zb1dpMF5k4vHI8TBilP?=
 =?us-ascii?Q?DP4XxOmISN4o1yj/Pct1OTY2s7gWzDI2qeovtVN2YxTUSxPYItoC5jSqRr3Q?=
 =?us-ascii?Q?yaIuauhc3UZgP833TBLInOMMud9oj9Q58vFG3aeIAaTbzCe3/EbZU5N8azBg?=
 =?us-ascii?Q?x/0qVQmIulpDMKL/0oYbN39r594uc/fRwxsMlR7zhJbV1dCgzrUu50U8bt+u?=
 =?us-ascii?Q?y4hnpWr6T6jOHVEvU1PS/ywhKpjFH6FIBqSVvuvdnECGPX7rceL2xn2G20zG?=
 =?us-ascii?Q?sb71G/v+MXBqU2F7ztrGDARwifXwWToS1cQUQnAIpJPysyvSRqGyrNBWW9qg?=
 =?us-ascii?Q?+qLIxttCx1ZwN95lryEbZmH0sa4/la6qvQuO8m8HALUggGAa0eDJelnQ55OW?=
 =?us-ascii?Q?MkC7WK4UfEuQDjy0OhZ1DHwx1yZ+B04jhBaSZYJSH8vCgiS9ELsGRG34IPXe?=
 =?us-ascii?Q?Noy2+CQkXLn2XBsuWK7gJjILAZK8WF5qoI2nufNgj6t8kBzaHfsHDSpPNEta?=
 =?us-ascii?Q?+0x/ydymT6q/KUM3gQu5qYtBVTf/z7pGjL/dY+YtRIoyEfYr4/PWE5C6lmhv?=
 =?us-ascii?Q?JRUjrwUxG1WTRprE1O/ONYd21KX25D2fBSJue28pPc0X+iVUfO/NhQOzaGxO?=
 =?us-ascii?Q?3YCM+Jf3nWHGWT2m54AO+uK0oKdlOPEoD5kkaV4VedkafGh5wpUxdkv8if9R?=
 =?us-ascii?Q?/r6vVnezNNIMxir/K7slgJx1n1PXBJ3o7LyAZ/cZY549UKAeZNnyj9Urq5Az?=
 =?us-ascii?Q?RDXxKOgAlABJzdQ0FX0Tlx6YChxZ4i6zZJkGVV4IuMjSAyqMrIKvcaxv4SgL?=
 =?us-ascii?Q?iV+0hicqFChI7PGxWRsnc/FdFrZFwxeOnh9xFHyNsiB9iXWnMk+uZkFkq/n0?=
 =?us-ascii?Q?r/rVqNzQq9VYZG85JZ0es3bwE5AinOEDyZm8MTPcCVo1vWkh6IY691pIoOqR?=
 =?us-ascii?Q?iFRx7FzSljUz59/V6wNse4WHm95EJOgsLRtmWmqKHjy/3cN5RoS1YctyYrk4?=
 =?us-ascii?Q?r8BR4U1tUa8xz+cfeAzQfgh0bmBCxsfYTmZ7IWoPnyB4Q0ZEN2Ob+IaswYYR?=
 =?us-ascii?Q?qQJQuHFIggr5I/NBs+Pm3H3a1L8lM93z5SFX946lkNXuShguUIk04fwZUwv7?=
 =?us-ascii?Q?8+LMRkXwkyXxfgfdukrP0Ag=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RMaJTXMved4MXxHsJRvd34phxUIeT39mdvEP8AMtwnbmT4ue3l5k0y6B36eh?=
 =?us-ascii?Q?rhGS+HCihuE/FuO57DTQWcrK+2vC06254+F19Z1ez4S+4x+NxPvvL3Q01/Gl?=
 =?us-ascii?Q?MVEmk9Drf0UeEylDmp4NPS+4KvXZS6c299A044Wx2CTYrOdIGlwNVAGatgEj?=
 =?us-ascii?Q?tAxYc/QVjhegFcYk93uPqvhmZ2YAlZ+HpBMquORPQR4nTVYHkKBv1YtHM9H+?=
 =?us-ascii?Q?40PblghhR9Hc/sZ9fVc4RT5TymQRngREpiRvtdP8q7C7cciZfQ6eSK+kNgMM?=
 =?us-ascii?Q?Jwqw/LUp7Xphvpgp5Naxt7K442xpkYZ8BUj5eoIajN4jJB5XaxIFva5ZPCLR?=
 =?us-ascii?Q?4wmirUCvhVchxMhT9UIJ3udz84ld/lXvZOWBGOc9jjvONylKT8kR67ZjruYK?=
 =?us-ascii?Q?4/Mc7/g+i3mqOal1gh9vGGS2i/jCPJ3uQWtL0f+q8aAd54P7FCZzmBRN8f1X?=
 =?us-ascii?Q?ufx5ISDnY+MDb1h7TaNjinvpgT1qEfw8mZVxy8Bfo37G+lKdH6YJ3k4Okpw2?=
 =?us-ascii?Q?ppBkuWdjq5y82yVV3YpoKjcIj7L4Mej5nqD03i1rr8SZMrtEEDkYAFImBg2l?=
 =?us-ascii?Q?Xcf+mW6Y4eHUIuRd51GP7jW4YkHdXb1RoivVwIq+CkYLiMlnuenVyg5U4xZG?=
 =?us-ascii?Q?6LvQeid7ChJYfj8egngb88QGcvWIX+4ZGIRmDg3Oa9uVPG40ZTS7iZ+brQgX?=
 =?us-ascii?Q?wdSMHA4IRDLahXHI6nAViIUSbHm8hAowNHrq0L/Tq6os3/DteehbnvauoA9x?=
 =?us-ascii?Q?CY6eWQV+MgSWhZyXYLxxhNnkKrzb5M7OfwvV8GUE2wD+B9XOOlQ/ijQep75O?=
 =?us-ascii?Q?kRddleOYCuq5/hpI6b3yapFToekcH3otFCOCh9BkDwGOjJq5mhJ4MPhQLyAT?=
 =?us-ascii?Q?jesh8ErnG+B9/EywEg+0IGjLqWC/jIqn5ClD7DEVZKlpYpmO8NzJRCLC1XQR?=
 =?us-ascii?Q?XxDe0jRYCCfDd9HamB+eBoyWsKw4Ekzhn0E55mQCzOyF12/6C/yTRKFxBCWd?=
 =?us-ascii?Q?sibmAwxO0UHiyE/xXwFfAOWnsBGmhhB7U0msULHcelVZS9W049R709/pVFVM?=
 =?us-ascii?Q?Pu9Omby8jIepFy3rPreK6x+vR2/X67iRPDhxf0WuGY7YKg1d8XPPiFe9MzzA?=
 =?us-ascii?Q?UfkIdrKJILAdmDdkwn3x3FLca/YMTiXrGa0WFN7RcII+znnrC7IYgRnCkGa8?=
 =?us-ascii?Q?jWvdX+a7SO4WdhdgcXh0puTcKVsd8GN/h6x5BhxzB6JHXl+/Iw/sgihPWUpL?=
 =?us-ascii?Q?1jPr0sXHLYe5RHvkV1BQg2oeLWaGd4KOstktU89K/70j6mZZsTfEnA01dDmj?=
 =?us-ascii?Q?PA8hlCl1/vx8BTn/eXyifIRQ7vP7Zf83e7ReGsNWnHftFn5FlrjLYHrmuGjY?=
 =?us-ascii?Q?ZHQp2a0U6y8GCtXqGRj0Qq6dENgBWBMRMTfH3bWDLZJHpJ6mMVyVRsEkfkM7?=
 =?us-ascii?Q?e3+H77KT5SvQVLcFz02qu6xIOkiUdu+d08Ipbg2eEwXF8fMy6bDitrc2hTs8?=
 =?us-ascii?Q?pehtYt2ueTEjmGzG4/5/5OcxlSOFfeGPJEIrz+o6huhvMdL66stsYHCq46Ap?=
 =?us-ascii?Q?W7IxVqk3Qqxhhi4Q/iRb6f28jKbo7oDoqzNITOBeGdxHERE6SrKuzNxYoGoF?=
 =?us-ascii?Q?+K2N2BusXI/g93dJaMhmygiT/Xboy3F2wAHIb+Qy9vlHXsYK1SH2nuFKdwhB?=
 =?us-ascii?Q?uiHqdxpPXccCoNKj6POQ3r17RCsjV+VJKHe/M2p62S0Os+rUwFZ+QYo6lVK4?=
 =?us-ascii?Q?kKVxESjoHACdelOV5OmH56dlc8KC8Ee3hL3W+18n4dDwn857eJ5TG1lydleT?=
x-ms-exchange-antispam-messagedata-1: 2pnsfaG8LNHRmg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c33222b9-22fa-475f-e670-08de5f4f2e8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 15:58:02.0072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ekqTghSj5NB93+68YQSk4yjEwJihT3TJt9CKlp9giWYbLe2fpiFBXFKmRA1De67OiC7t6kP9lVMsBccMtHWZCjQ9tH+iPccd/z+8i96ApcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5065
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

Hi Jeevan ,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan=
 B
> Sent: 27 January 2026 12:05
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to com=
mon
> library
>=20
> Move DC counter utility functions from tests/intel/kms_pm_dc.c to lib/igt=
_pm.c
> for reuse across other tests.
>=20
> v2: Add 'igt_' prefix before all functions. (Thasleem)
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/igt_pm.c            | 169 ++++++++++++++++++++++++++++++++++++++++
>  lib/igt_pm.h            |  15 ++++
>  tests/intel/kms_pm_dc.c | 167 ++++++---------------------------------
>  3 files changed, 207 insertions(+), 144 deletions(-)
>=20
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c index 1ffcdcef3..cc82e2134 10064=
4
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1543,3 +1543,172 @@ void igt_pm_dpms_toggle(igt_output_t *output)
>  				   DRM_MODE_DPMS_ON);
>=20
> 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE))
> ;
>  }
> +
> +/**
> + * igt_get_dc_counter:
> + * @dc_data: String containing DC counter data in format
> + *
> + * Returns the counter value as uint32_t  */ uint32_t
> +igt_get_dc_counter(char *dc_data) {
> +	char *e;
> +	long ret;
> +	char *s =3D strchr(dc_data, ':');
> +
> +	igt_assert(s);
> +	s++;
> +	ret =3D strtol(s, &e, 10);
> +	igt_assert(((ret !=3D LONG_MIN && ret !=3D LONG_MAX) || errno !=3D
> ERANGE) &&
> +		   e > s && *e =3D=3D '\n' && ret >=3D 0);
> +	return ret;
> +}
> +
> +/**
> + * igt_support_dc6:
> + * @debugfs_fd: DRM file descriptor
> + *
> + * Returns true if DC6 is supported.
> + */
> +bool igt_support_dc6(int debugfs_fd)
> +{
> +	char buf[4096];
> +
> +	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
> +				buf, sizeof(buf));
> +	return strstr(buf, "DC5 -> DC6 count"); }
> +
> +/**
> + * igt_get_dc6_counter:Locate DC6 counter string in debugfs buffer
> + * @buf: Buffer containing i915_dmc_info debugfs output
> + *
> + * Searches for DC6 counter information in the DMC info buffer.
> + */
> +char *igt_get_dc6_counter(const char *buf) {
> +	char *str;
> +
> +	str =3D strstr(buf, "DC5 -> DC6 count");
> +	if (!str)
> +		str =3D strstr(buf, "DC5 -> DC6 allowed count");
> +
> +	return str;
> +}
> +
> +/**
> + * igt_read_dc_counter:
> + * @debugfs_fd: DRM file descriptor
> + * @dc_flag: DC state flag (CHECK_DC5, CHECK_DC6, or CHECK_DC3CO)
> + *
> + * Returns current counter value for the specified DC state  */
> +uint32_t igt_read_dc_counter(uint32_t debugfs_fd, int dc_flag) {

Prefer int  instead of uint32_t for debugfs_fd  to match igt_debugfs_simple=
_read() parameter type=20

Regards ,
Bilal

> +	char buf[4096];
> +	char *str;
> +
> +	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf,
> +sizeof(buf));
> +
> +	if (dc_flag & CHECK_DC5) {
> +		str =3D strstr(buf, "DC3 -> DC5 count");
> +		igt_assert_f(str, "DC5 counter is not available\n");
> +	} else if (dc_flag & CHECK_DC6) {
> +		str =3D igt_get_dc6_counter(buf);
> +		igt_assert_f(str, "No DC6 counter available\n");
> +	} else if (dc_flag & CHECK_DC3CO) {
> +		str =3D strstr(buf, "DC3CO count");
> +		igt_assert_f(str, "DC3CO counter is not available\n");
> +	} else {
> +		igt_assert(!"reached");
> +		str =3D NULL;
> +	}
> +
> +	return igt_get_dc_counter(str);
> +}
> +
> +/**
> + * igt_dc_state_wait_entrytry:
> + * @debugfs_fd: DRM file descriptor
> + * @dc_flag: DC state flag
> + * @prev_dc_count: Previous counter value to compare against
> + *
> + * Returns true if DC state entry detected within timeout, false
> +otherwise  */ bool igt_dc_state_wait_entrytry(int debugfs_fd, int
> +dc_flag, int prev_dc_count) {
> +	return igt_wait(igt_read_dc_counter(debugfs_fd, dc_flag) >
> +			prev_dc_count, 3000, 100);
> +}
> +
> +/**
> + * igt_dc_state_namee:
> + * @dc_flag: DC state flag
> + *
> + * Converts DC state flag constants to readable string names  */ const
> +char *igt_dc_state_namee(int dc_flag) {
> +	if (dc_flag & CHECK_DC3CO)
> +		return "DC3CO";
> +	else if (dc_flag & CHECK_DC5)
> +		return "DC5";
> +	else
> +		return "DC6";
> +}
> +
> +/**
> + * igt_require_dc_counter:
> + * @debugfs_fd: File descriptor for the debugfs
> + * @dc_flag: DC counter type to check (CHECK_DC3CO, CHECK_DC5,
> + * or CHECK_DC6)
> + *
> + * Skips the current test if the requested DC counter is not available
> + * on the system.
> + */
> +void igt_require_dc_counter(int debugfs_fd, int dc_flag) {
> +	char *str;
> +	char buf[4096];
> +
> +	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
> +				buf, sizeof(buf));
> +
> +	switch (dc_flag) {
> +	case CHECK_DC3CO:
> +		igt_skip_on_f(!strstr(buf, "DC3CO count"),
> +			      "DC3CO counter is not available\n");
> +		break;
> +	case CHECK_DC5:
> +		igt_skip_on_f(!strstr(buf, "DC3 -> DC5 count"),
> +			      "DC5 counter is not available\n");
> +		break;
> +	case CHECK_DC6:
> +		str =3D igt_get_dc6_counter(buf);
> +		igt_skip_on_f(!str, "No DC6 counter available\n");
> +		break;
> +	default:
> +		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
> +	}
> +}
> +
> +/**
> + * igt_read_pkgc_counter:
> + * @debugfs_root_fd: File descriptor for the debugfs
> + *
> + * Returns PC10 counter value.
> + */
> +unsigned int igt_read_pkgc_counter(int debugfs_root_fd) {
> +	char buf[4096];
> +	char *str;
> +	int len;
> +
> +	len =3D igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf,
> sizeof(buf) - 1);
> +	igt_skip_on_f(len < 0, "PKGC state file not found\n");
> +	buf[len] =3D '\0';
> +	str =3D strstr(buf, "Package C10");
> +	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
> +
> +	return igt_get_dc_counter(str);
> +}
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h index e931e51af..1930b3255 10064=
4
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -29,6 +29,13 @@
>=20
>  #include "igt_kms.h"
>=20
> +#define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
> +
> +/* DC State Flags */
> +#define CHECK_DC5       (1 << 0)
> +#define CHECK_DC6       (1 << 1)
> +#define CHECK_DC3CO     (1 << 2)
> +
>  void igt_pm_enable_audio_runtime_pm(void);
>  void igt_pm_enable_sata_link_power_management(void);
>  void igt_pm_restore_sata_link_power_management(void);
> @@ -99,5 +106,13 @@ int igt_pm_get_runtime_usage(struct pci_device
> *pci_dev);  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bo=
ol val);
> bool igt_has_pci_pm_capability(struct pci_device *pci_dev);  void
> igt_pm_dpms_toggle(igt_output_t *output);
> +uint32_t igt_get_dc_counter(char *dc_data); bool igt_support_dc6(int
> +debugfs_fd); char *igt_get_dc6_counter(const char *buf); uint32_t
> +igt_read_dc_counter(uint32_t debugfs_fd, int dc_flag); bool
> +igt_dc_state_wait_entrytry(int debugfs_fd, int dc_flag, int
> +prev_dc_count); const char *igt_dc_state_namee(int dc_flag); void
> +igt_require_dc_counter(int debugfs_fd, int dc_flag); unsigned int
> +igt_read_pkgc_counter(int debugfs_root_fd);
>=20
>  #endif /* IGT_PM_H */
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 4babf1341..81e11c41d 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -79,15 +79,9 @@
>   * Description: This test validates display engine entry to DC5 state wh=
ile PSR is
> active on Pipe B
>   */
>=20
> -/* DC State Flags */
> -#define CHECK_DC5	(1 << 0)
> -#define CHECK_DC6	(1 << 1)
> -#define CHECK_DC3CO	(1 << 2)
> -
>  #define PWR_DOMAIN_INFO "i915_power_domain_info"
>  #define RPM_STATUS "i915_runtime_pm_status"
>  #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
> -#define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
>  #define KMS_POLL_DISABLE 0
>  #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid)
> || intel_display_ver(devid) >=3D 14))  #define SEC 1 @@ -116,7 +110,6 @@ =
typedef
> struct {
>  	bool runtime_suspend_disabled;
>  } data_t;
>=20
> -static bool dc_state_wait_entry(int drm_fd, int dc_flag, int prev_dc_cou=
nt);
> static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_=
count);
>=20
>  static void set_output_on_pipe_b(data_t *data) @@ -262,81 +255,17 @@ sta=
tic
> void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
>  	paint_rectangles(data, data->mode, fb_color, fb);  }
>=20
> -static uint32_t get_dc_counter(char *dc_data) -{
> -	char *e;
> -	long ret;
> -	char *s =3D strchr(dc_data, ':');
> -
> -	igt_assert(s);
> -	s++;
> -	ret =3D strtol(s, &e, 10);
> -	igt_assert(((ret !=3D LONG_MIN && ret !=3D LONG_MAX) || errno !=3D
> ERANGE) && e > s && *e =3D=3D '\n' && ret >=3D 0);
> -	return ret;
> -}
> -
> -static char *get_dc6_counter(const char *buf) -{
> -	char *str;
> -
> -	str =3D strstr(buf, "DC5 -> DC6 count");
> -	if (!str)
> -		str =3D strstr(buf, "DC5 -> DC6 allowed count");
> -
> -	return str;
> -}
> -
> -static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag) -{
> -	char buf[4096];
> -	char *str;
> -
> -	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf, sizeof(buf));
> -
> -	if (dc_flag & CHECK_DC5) {
> -		str =3D strstr(buf, "DC3 -> DC5 count");
> -		igt_assert_f(str, "DC5 counter is not available\n");
> -	} else if (dc_flag & CHECK_DC6) {
> -		str =3D get_dc6_counter(buf);
> -		igt_assert_f(str, "No DC6 counter available\n");
> -	} else if (dc_flag & CHECK_DC3CO) {
> -		str =3D strstr(buf, "DC3CO count");
> -		igt_assert_f(str, "DC3CO counter is not available\n");
> -	} else {
> -		igt_assert(!"reached");
> -		str =3D NULL;
> -	}
> -
> -	return get_dc_counter(str);
> -}
> -
> -static bool dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc=
_count) -{
> -	return igt_wait(read_dc_counter(debugfs_fd, dc_flag) >
> -			prev_dc_count, 3000, 100);
> -}
> -
> -static const char *dc_state_name(int dc_flag) -{
> -	if (dc_flag & CHECK_DC3CO)
> -		return "DC3CO";
> -	else if (dc_flag & CHECK_DC5)
> -		return "DC5";
> -	else
> -		return "DC6";
> -}
> -
>  static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc=
_count)
> {
> -	igt_assert_f(dc_state_wait_entry(data->debugfs_fd, dc_flag,
> prev_dc_count),
> -		     "%s state is not achieved\n%s:\n%s\n",
> dc_state_name(dc_flag), PWR_DOMAIN_INFO,
> +	igt_assert_f(igt_dc_state_wait_entrytry(data->debugfs_fd, dc_flag,
> prev_dc_count),
> +		     "%s state is not achieved\n%s:\n%s\n",
> +igt_dc_state_namee(dc_flag), PWR_DOMAIN_INFO,
>  		     data->debugfs_dump =3D igt_sysfs_get(data->debugfs_fd,
> PWR_DOMAIN_INFO));  }
>=20
>  static void check_dc_counter_negative(data_t *data, int dc_flag, uint32_=
t
> prev_dc_count)  {
> -	igt_assert_f(!dc_state_wait_entry(data->debugfs_fd, dc_flag,
> prev_dc_count),
> -		     "%s state is achieved\n%s:\n%s\n", dc_state_name(dc_flag),
> PWR_DOMAIN_INFO,
> +	igt_assert_f(!igt_dc_state_wait_entrytry(data->debugfs_fd, dc_flag,
> prev_dc_count),
> +		     "%s state is achieved\n%s:\n%s\n",
> igt_dc_state_namee(dc_flag),
> +PWR_DOMAIN_INFO,
>  		     data->debugfs_dump =3D igt_sysfs_get(data->debugfs_fd,
> PWR_DOMAIN_INFO));  }
>=20
> @@ -368,7 +297,7 @@ static void
> check_dc3co_with_videoplayback_like_load(data_t *data)
>  	primary =3D igt_output_get_plane_type(data->output,
>  					    DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, NULL);
> -	dc3co_prev_cnt =3D read_dc_counter(data->debugfs_fd, CHECK_DC3CO);
> +	dc3co_prev_cnt =3D igt_read_dc_counter(data->debugfs_fd,
> CHECK_DC3CO);
>=20
>  	/* Calculate delay to generate idle frame in usec*/
>  	delay =3D 1.5 * ((1000 * 1000) / data->mode->vrefresh); @@ -383,36
> +312,10 @@ static void check_dc3co_with_videoplayback_like_load(data_t
> *data)
>  		usleep(delay);
>  	}
>=20
> -	igt_require_f(dc_state_wait_entry(data->debugfs_fd,
> +	igt_require_f(igt_dc_state_wait_entrytry(data->debugfs_fd,
>  		      CHECK_DC3CO, dc3co_prev_cnt), "dc3co-vpb-simulation not
> enabled\n");  }
>=20
> -static void require_dc_counter(int debugfs_fd, int dc_flag) -{
> -	char *str;
> -	char buf[4096];
> -
> -	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
> -				buf, sizeof(buf));
> -
> -	switch (dc_flag) {
> -	case CHECK_DC3CO:
> -		igt_skip_on_f(!strstr(buf, "DC3CO count"),
> -			      "DC3CO counter is not available\n");
> -		break;
> -	case CHECK_DC5:
> -		igt_skip_on_f(!strstr(buf, "DC3 -> DC5 count"),
> -			      "DC5 counter is not available\n");
> -		break;
> -	case CHECK_DC6:
> -		str =3D get_dc6_counter(buf);
> -		igt_skip_on_f(!str, "No DC6 counter available\n");
> -		break;
> -	default:
> -		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
> -	}
> -}
> -
>  static void setup_dc3co(data_t *data)
>  {
>  	data->op_psr_mode =3D PSR_MODE_2;
> @@ -423,7 +326,7 @@ static void setup_dc3co(data_t *data)
>=20
>  static void test_dc3co_vpb_simulation(data_t *data)  {
> -	require_dc_counter(data->debugfs_fd, CHECK_DC3CO);
> +	igt_require_dc_counter(data->debugfs_fd, CHECK_DC3CO);
>  	setup_output(data);
>  	setup_dc3co(data);
>  	setup_videoplayback(data);
> @@ -435,8 +338,8 @@ static void test_dc5_retention_flops(data_t *data, in=
t
> dc_flag)  {
>  	uint32_t dc_counter_before_psr;
>=20
> -	require_dc_counter(data->debugfs_fd, dc_flag);
> -	dc_counter_before_psr =3D read_dc_counter(data->debugfs_fd, dc_flag);
> +	igt_require_dc_counter(data->debugfs_fd, dc_flag);
> +	dc_counter_before_psr =3D igt_read_dc_counter(data->debugfs_fd,
> +dc_flag);
>  	set_output_on_pipe_b(data);
>  	setup_primary(data);
>  	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode,
> NULL)); @@ -448,8 +351,8 @@ static void test_dc_state_psr(data_t *data, i=
nt
> dc_flag)  {
>  	uint32_t dc_counter_before_psr;
>=20
> -	require_dc_counter(data->debugfs_fd, dc_flag);
> -	dc_counter_before_psr =3D read_dc_counter(data->debugfs_fd, dc_flag);
> +	igt_require_dc_counter(data->debugfs_fd, dc_flag);
> +	dc_counter_before_psr =3D igt_read_dc_counter(data->debugfs_fd,
> +dc_flag);
>  	setup_output(data);
>  	setup_primary(data);
>  	igt_require(!psr_disabled_check(data->debugfs_fd));
> @@ -512,9 +415,9 @@ static void test_dc_state_dpms(data_t *data, int dc_f=
lag)
> {
>  	uint32_t dc_counter;
>=20
> -	require_dc_counter(data->debugfs_fd, dc_flag);
> +	igt_require_dc_counter(data->debugfs_fd, dc_flag);
>  	setup_dc_dpms(data);
> -	dc_counter =3D read_dc_counter(data->debugfs_fd, dc_flag);
> +	dc_counter =3D igt_read_dc_counter(data->debugfs_fd, dc_flag);
>  	dpms_off(data);
>  	check_dc_counter(data, dc_flag, dc_counter);
>  	dpms_on(data);
> @@ -525,23 +428,14 @@ static void test_dc_state_dpms_negative(data_t *dat=
a,
> int dc_flag)  {
>  	uint32_t dc_counter;
>=20
> -	require_dc_counter(data->debugfs_fd, dc_flag);
> +	igt_require_dc_counter(data->debugfs_fd, dc_flag);
>  	setup_dc_dpms(data);
> -	dc_counter =3D read_dc_counter(data->debugfs_fd, dc_flag);
> +	dc_counter =3D igt_read_dc_counter(data->debugfs_fd, dc_flag);
>  	dpms_on(data);
>  	check_dc_counter_negative(data, dc_flag, dc_counter);
>  	cleanup_dc_dpms(data);
>  }
>=20
> -static bool support_dc6(int debugfs_fd) -{
> -	char buf[4096];
> -
> -	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
> -				buf, sizeof(buf));
> -	return strstr(buf, "DC5 -> DC6 count");
> -}
> -
>  static uint64_t read_runtime_suspended_time(int drm_fd)  {
>  	struct pci_device *i915;
> @@ -564,7 +458,7 @@ static bool dc9_wait_entry(data_t *data, int dc_targe=
t,
> int prev_dc, uint64_t pr
>  	 */
>  	return igt_wait((read_runtime_suspended_time(data->drm_fd) >
> prev_rpm) &&
>  			(!DC9_RESETS_DC_COUNTERS(data->devid) ||
> -			(read_dc_counter(data->debugfs_fd, dc_target) <
> prev_dc)), msecs, 1000);
> +			(igt_read_dc_counter(data->debugfs_fd, dc_target) <
> prev_dc)),
> +msecs, 1000);
>  }
>=20
>  static void check_dc9(data_t *data, int dc_target, int prev_dc, int prev=
_rpm) @@
> -584,12 +478,12 @@ static void setup_dc9_dpms(data_t *data, int dc_target=
)
>  	__igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
>  	close(sysfs_fd);
>  	if (DC9_RESETS_DC_COUNTERS(data->devid)) {
> -		prev_dc =3D read_dc_counter(data->debugfs_fd, dc_target);
> +		prev_dc =3D igt_read_dc_counter(data->debugfs_fd, dc_target);
>  		setup_dc_dpms(data);
>  		dpms_off(data);
> -		igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd,
> dc_target) >
> +		igt_skip_on_f(!(igt_wait(igt_read_dc_counter(data->debugfs_fd,
> +dc_target) >
>  				prev_dc, 3000, 100)), "Unable to enters shallow
> DC states\n");
> -		prev_dc =3D read_dc_counter(data->debugfs_fd, dc_target);
> +		prev_dc =3D igt_read_dc_counter(data->debugfs_fd, dc_target);
>  		dpms_on(data);
>  		cleanup_dc_dpms(data);
>  	}
> @@ -603,8 +497,8 @@ static void test_dc9_dpms(data_t *data)  {
>  	int dc_target;
>=20
> -	require_dc_counter(data->debugfs_fd, CHECK_DC5);
> -	dc_target =3D support_dc6(data->debugfs_fd) ? CHECK_DC6 : CHECK_DC5;
> +	igt_require_dc_counter(data->debugfs_fd, CHECK_DC5);
> +	dc_target =3D igt_support_dc6(data->debugfs_fd) ? CHECK_DC6 :
> CHECK_DC5;
>  	setup_dc9_dpms(data, dc_target);
>  }
>=20
> @@ -623,21 +517,6 @@ static int has_panels_without_dc_support(igt_display=
_t
> *display)
>  	return external_panel;
>  }
>=20
> -static unsigned int read_pkgc_counter(int debugfs_root_fd) -{
> -	char buf[4096];
> -	char *str;
> -	int len;
> -
> -	len =3D igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf,
> sizeof(buf) - 1);
> -	igt_skip_on_f(len < 0, "PKGC state file not found\n");
> -	buf[len] =3D '\0';
> -	str =3D strstr(buf, "Package C10");
> -	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
> -
> -	return get_dc_counter(str);
> -}
> -
>  static void test_deep_pkgc_state(data_t *data)  {
>  	unsigned int pre_val =3D 0, cur_val =3D 0; @@ -701,7 +580,7 @@ static v=
oid
> test_deep_pkgc_state(data_t *data)
>  	igt_display_commit(&data->display);
>  	/* Wait for the vblank to sync the frame time */
>  	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe), 1);
> -	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
> +	pre_val =3D igt_read_pkgc_counter(data->debugfs_root_fd);
>  	/* Add a half-frame delay to ensure the flip occurs when the frame is
> active. */
>  	usleep(delay * 0.5);
>=20
> @@ -710,7 +589,7 @@ static void test_deep_pkgc_state(data_t *data)
>  		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
>  		igt_display_commit(&data->display);
>=20
> -		igt_wait((cur_val =3D read_pkgc_counter(data->debugfs_root_fd))
> > pre_val,
> +		igt_wait((cur_val =3D igt_read_pkgc_counter(data-
> >debugfs_root_fd)) >
> +pre_val,
>  						      (delay * 2), (5 * MSEC));
>  		if (cur_val > pre_val) {
>  			pkgc_flag =3D true;
> --
> 2.43.0

