Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25614C87FCB
	for <igt-dev@archiver.kernel.org>; Tue, 12 Aug 2025 15:07:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC6210E03C;
	Tue, 12 Aug 2025 15:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eM2xPb/j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348B010E03C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Aug 2025 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755011271; x=1786547271;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YqRiXucilid2GyBmYElCYTPsagDKJwdUGUiBWw3uJ/o=;
 b=eM2xPb/jOmqI3sTQ6/RbNKKK6DHIKqgroVoHORiZkhOEsdHAmtIPqJMk
 Wl2Nl948S1vpePg+TNYnoC8HyEDF/OyLX3uMOrMSfvYO17Tl3vlrnEa4A
 oZxe39XZ1ewRWzYvDWYg7tR8cubDtHn8knr90523nPSrAqiSsYTw1YUNu
 IP5baAJ0ZQ3Z9GYL+4xp+B2lbcG9B/ItUAnmWqbF0DA7NbfhueUN55Wv9
 Z3DLnSs0Bg+1iTFzH2g8RIHBYqRGHVkjol+2SyNwy9GkWsrsrkJmNt1kA
 6qjt2uVaOe+3OB5nWZgiJZnbFJUY7xMwisXWJnqli5MUnzUaJbpwOvfIX w==;
X-CSE-ConnectionGUID: i2jZTtMHQM6eSyEw4VH15Q==
X-CSE-MsgGUID: Tvio3YolTuSVVvvRZxF06g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56499735"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="56499735"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 08:07:51 -0700
X-CSE-ConnectionGUID: HeCpipRiReyak8Ws7fN7lw==
X-CSE-MsgGUID: 4qQkIN+zQcmJnvlQLgG/hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165853658"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 08:07:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 08:07:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 12 Aug 2025 08:07:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 08:07:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/r9son6R8FWei36fANMjL3JJG8w9z2HCOIg3uKa/Bd8izFB+sNuw/kDMMyIsfPIohsS4rT+uFU1A0cgAXnZ9V4YvwfzZ3My0F+HIGJ4vJ351MqGLd2SxwcsY4mtg7hJFc970eK3MKZ5wtnHC1OsTgRjWJSLh5T+FafVywei32o46+Op+iAn/P4i4f1Na6ubfzN4IdzgshAhEeLUQn4PApypTe9C6QiFN2rjQJtUgki4ZlYXk0zWTvsf5tjrRC2ydo4vCa4CFyLUrC821zqliXBb05gKn66v+1w0II33+dF2y4V7VnySjJKy5LjsU0BE9OnJ63FAu4kgefeWr6BY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0eWSNTspzHhF45QdaSQMce8VL5LBJ6zHEy17Ffz1Z14=;
 b=TYAtqA6ZqeE6b8KrDDocvM/hqURNMRz7YjTmF9RlY6/guTS+KofI45XrEW28LZxrWzcmWcl7kY+wk2JniUudsubQnwNE6ojfd/xp6hVckZqAHs5WAoWgfNAphUCeGZwevNIP3c7GYATwlQ3lv5KoKhCDD23qiXXOOdmTWzh+mpttaw7tGw/7uUrjIlIPFt47/oXpcNFvJScUi2cs073BnxfPUGKwrjhGbXLZQk5rAU4NQ/she2ooQ4UQn3YWEwiBUWFclC77t0Qc3s4djCZBnSCaIdjZLHQ6Vj9D2cKxJHCmeb/MTUeAR+/dXpfCaqyKmHAmXcKHUv6eVyb9DKCnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB8784.namprd11.prod.outlook.com (2603:10b6:8:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 15:07:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.9009.021; Tue, 12 Aug 2025
 15:07:46 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Anirban, Sk" <sk.anirban@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Anirban, Sk" <sk.anirban@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] tests/intel/xe_exec_reset: Replace hardcoded sleep with
 GT C6 polling
Thread-Topic: [PATCH] tests/intel/xe_exec_reset: Replace hardcoded sleep with
 GT C6 polling
Thread-Index: AQHcBjD9YN4SOhIEV0OCES74pgyE7rRfIajw
Date: Tue, 12 Aug 2025 15:07:46 +0000
Message-ID: <CH0PR11MB54444F074FB832019D6F0D11E52BA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250805174429.3755351-2-sk.anirban@intel.com>
In-Reply-To: <20250805174429.3755351-2-sk.anirban@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB8784:EE_
x-ms-office365-filtering-correlation-id: 3645a2c3-082e-4a84-105a-08ddd9b1feba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?IkjQp69p6C98s5LgBuT3kT8FnaHMWyNDr88uEWXnwW2moZEypOPf0sMrP4rV?=
 =?us-ascii?Q?xxcpJqS/luNLwLEuUCmzFJ8sjKMj8Kr1GBY4YwAMprB9gQD06M/MBOe1avMz?=
 =?us-ascii?Q?n8VZ9G23o7knJ47XsnRO5PRorArVI6LS1aKTVvAvj5qR5qGyL97xxoyoJ6sW?=
 =?us-ascii?Q?SNs4i1QcVM1EgYx1wypKVnYTaYimXi9JOV4wQ4G7/b7FBGfqNjvxOhHSBkQd?=
 =?us-ascii?Q?G3/q3/A/4Gj7eErTh0jEP5VtFOT/k+Rv7m2qOdb+i8FW0l7AGSTYGBhGTyTp?=
 =?us-ascii?Q?yWdhx5MYYv1U4X4EECYCfBW88M3j9AnzSN7fKcUgGGM8G5vHgMwpMEZL8kUT?=
 =?us-ascii?Q?EaI+WsJaIIn7LvNCcz+l3sSmuO9o/n+QmblWwXGvPYIxBq+RMbGyCGwIiIvN?=
 =?us-ascii?Q?RBqam49OOaBjHhS3LCKD1rOP7JXp4uAg85du7Ce4YjDtC+N29TYGHXZOwtcW?=
 =?us-ascii?Q?GGtIEMd2PwsAlTqZXHKjh5/cV6++FUJtA94RDgLGEutNsHfkda6WGSuEUvzs?=
 =?us-ascii?Q?gWCHn1vB3/t2r5HSlt+7iuNpDr0tG9MxlyrwNCY9VHszK43EMRiNczphbBnI?=
 =?us-ascii?Q?cRsOOO8PTy0Ck46esmYSlyTUSs0qHDejkXXXZ0Kl8Qpqu+frmfR5Kg6jaiWT?=
 =?us-ascii?Q?HsEHE3v/jRxUFtBJVjYLPf3SDZ+IIGYqQDTi7TJZxuQcfrWl7hciYhNasJuA?=
 =?us-ascii?Q?4HJ5uyZgfWKDBxvxASbtgqgfQoqt9sIqkx15ERpX6aIAZwUgdNd74bc8DQ25?=
 =?us-ascii?Q?8HtmJXC8UMYci7PPm1/a4SC3ie4pjizZCDNF8vQU4lTI7E110n8EGgTDxYED?=
 =?us-ascii?Q?+sIBgNEc0hdgtRcYAxxPJU8XpPn3uNqJhQm8+0mwTZPjR8Xz64EtrgZ26sxE?=
 =?us-ascii?Q?v78Yg+cUJnDmPvMWnVTaygfAb1V2L3pXqGJIsZWeT42uPhr8KJODLcppozRP?=
 =?us-ascii?Q?c2FPB6FtD2FrnFlhVCU5s0diPTIOlqFe9iyVaMspbMVyy6IjQRvHQzxaK+Zw?=
 =?us-ascii?Q?BmC+3zEGH0FqJ15m8Zq/tgdVykaZrO9Ek5gv5NODx18pCz8BvrhPdQrg9U8X?=
 =?us-ascii?Q?PbuIRcOpyVW/Jy4iPpQF9OYC6zIvT3Kuc/VR20QTrr8GZtOY3PbZVjCRN92A?=
 =?us-ascii?Q?prL2xZza2dqtQfe2/z+n1WNOCx+BMhNPyHheXF6tV4n1Vrem0JZmlxOr130n?=
 =?us-ascii?Q?VlKjhZ/XeVr0+9YQtzByaoRljjr1SsUo5w0Stxtm1xeS4AigYFHwcjcO05vk?=
 =?us-ascii?Q?+j79ohJi+Ryx4MHRXrWZaiCbYAElxi4LVXnhR/T6MKlKQMVtyJ/KUodJXV6W?=
 =?us-ascii?Q?8KpEbMNDRLAjW/DQoArOYZrLHmIZn/+6vqRkNPDZovWKuXZ3eNS0PCHoRcIj?=
 =?us-ascii?Q?yQrugc5hWduRKgn2wN/BI6TAShFMca5oRDI9RMOSa2PtfNxq/J2SQGYLqeNG?=
 =?us-ascii?Q?BXE+AO8GbRXZcY8TnR2XYU5TdZzuaPVkTbF1h3w/Cz4fAx5o1f0T7bMc+KmB?=
 =?us-ascii?Q?s8by3Wo188jKiVE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2CLrwA401LbhE0ffZY0aFZJuUlkr5sJDN5zmeOtyKiwb4F65mGb5DP7LFwZ8?=
 =?us-ascii?Q?OFVMolcRJZTUHYG2SjDcAVPOse3dp4+KJbWURq2lhHpb3WVqLDcpvVBJ6uJs?=
 =?us-ascii?Q?bDXOy5I20GbcLNZOs4A4NlYvbZdCObJgAEd6ZneKkAutDMBLekIenNtCnC3U?=
 =?us-ascii?Q?eFFyXDb5M4l623IW8w93z/usYkp0O4L2Us6DqN79T8QoRPUmafNCGcFo2LAm?=
 =?us-ascii?Q?cO3+l5q4a1KwSL2tfsSnTHAcycMvifusHBbmZZztifg2T7Naq3QEFNljlzfU?=
 =?us-ascii?Q?bSmGwfXMaOILZDOfeVEGesR/Z3BdLSpxiwJBrHzA73Euj7/VHBk7WhKGkvPr?=
 =?us-ascii?Q?OWUhjy/avyd/gKElWMWr3NFB0sCFvvvkWid84DWfUyqONzbEOQQWXPwnFDJW?=
 =?us-ascii?Q?rOi0tqTI2CBaz156HSe0qRbYY40PL+0rjQBjFeL0kWIcxFOef0VSy5vfnyJ/?=
 =?us-ascii?Q?D48nF6z5TDbnmd4NSjlsCJAdtt54ziHL3YeKY7bBKsxdwRMcdw9p4ePvwo7G?=
 =?us-ascii?Q?+J2GZsM3Sulv4Z+6DjMhudM0aC4+8SfE6zzdtxMOOaAIcLlhWbQ0o0PKPYe0?=
 =?us-ascii?Q?EDpoLCGVTgDQEIWTmzVMZGes7KlG4emmRBq5dvsBUtbrKLH9kM0wDPxxjx0W?=
 =?us-ascii?Q?jJpy9Sap19T9Ku/5/cpr4fhM1Kdcb0Munjz3E1nyeTwNBr4wQs5jSqnrgpfT?=
 =?us-ascii?Q?3lKl/LGYEhmspZsivYymVAvrTE4v1pvOUplumbG++8lDjt7puOKLNAgHh3ug?=
 =?us-ascii?Q?4PFtMaRtx1VS/4KjuLFILm7aPFoJY5bBC/x6PYOrsEtsSF8juNwl/rp7WvtG?=
 =?us-ascii?Q?MS2vxuTjkKrAylySdEr4Yr7Xg6QEkC3DfcQbgmRHgB6lU85tQXjSI0SU4Xo/?=
 =?us-ascii?Q?r59l8G7B8d07haby2rTs3RYxjsDI8GR7hfXnzvZo9ZqPCvBZ92yvzSt0g/fp?=
 =?us-ascii?Q?gR3c9TdpuBZJx2+e0N5Xwwx2Pf91NKMwskt4Iq6yFLvXXo/hk3M6kbwtAfbY?=
 =?us-ascii?Q?mq7MHnYKY5JXQ8+fww3xFsX3wYA1mCWHDGBizUg3t/1fVna+GwqgxV3FwNVC?=
 =?us-ascii?Q?OWdw1SmcNcVsPxP/6wqmPxcQzuUsMHcp5CQ1Vf++0RVWwtw62eGcn0U4pTy5?=
 =?us-ascii?Q?prRZD7zeBFHZS2i3DUB2T0HoWzyUFCTiXuv0WeaP9VrQPS2k+P7ne4zVM6Lw?=
 =?us-ascii?Q?SDR8FGB8YRXxXeVaYdzQEUMeGJMp+eOB8JyJDUGfrl3r/WSLBd6hFlJ3b7Dd?=
 =?us-ascii?Q?SPPGb2cNgdbQ4LuYBfmX4N6Eh8WUxVcRSQu4ikx8Tz0by7/9wQAMFW1XfQ6O?=
 =?us-ascii?Q?3bkdO8bcs1v3siU7I0Yle9OuXzqXsgpq7lvgMqi6QWTLkJqOv0mnz6dFP4zf?=
 =?us-ascii?Q?ToOsJn15suCCTk+CB8cQlN+rTWOYZhUBSbNOgSPQ1cAPt35uDSXoh6fvAYhf?=
 =?us-ascii?Q?iUXy5dfaEZK5++U18CV9Sp8tt8DSnvL0Vnt4lWsg2dTeautTK4QXWbyk/M7y?=
 =?us-ascii?Q?oXZ6e1XjCmGxIt/a/nmUsws8l2+WQ5zJDwvvpavE/jUimiYC4k9V2el/idAx?=
 =?us-ascii?Q?y8u1UQyvFi/Jl36jbuK++2OyGbHDndO1NCY9l9K4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3645a2c3-082e-4a84-105a-08ddd9b1feba
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 15:07:46.2198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fgb9beU9yvN/mBZpZAaC2pledcsJw314s+EafyoeeEw4bJ36MfGDKpADwyxATWhv0Yoi+cnVEnLptDR1qAIySDLmJHdIaBYv7qhjlg0/4yM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8784
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sk Anirb=
an
Sent: Tuesday, August 5, 2025 10:45 AM
To: igt-dev@lists.freedesktop.org
Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Tauro, Riana <riana.tauro@i=
ntel.com>; Nilawar, Badal <badal.nilawar@intel.com>; Brost, Matthew <matthe=
w.brost@intel.com>; Anirban, Sk <sk.anirban@intel.com>
Subject: [PATCH] tests/intel/xe_exec_reset: Replace hardcoded sleep with GT=
 C6 polling
>=20
> Replace insufficient sleep with extended GT C6 polling to ensure proper
> power state transitions to RC6 and prevent subsequent RC6 test failures.
>=20
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 7ae53c679..0c9503c7e 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -421,9 +421,12 @@ test_compute_mode(int fd, struct drm_xe_engine_class=
_instance *eci,
>  			for (i =3D 0; i < n_exec_queues; i++)
>  				xe_exec_queue_destroy(fd, exec_queues[i]);
>  		}
> +
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, eci->gt_id), 1000, 10),
> +			     "GT %d failed to enter C6\n", eci->gt_id);

I talked about this privately, but this igt_assert_f is causing a failure o=
n CI testing.
I wonder if this is because of missing test coverage, or if this is an unex=
pected failure?

But beyond that, I think this change also needs to be copied over to test_b=
alancer()
(once it's not failing on CI, that is).
-Jonathan Cavitt

> +
>  		drm_close_driver(fd);
> -		/* FIXME: wait for idle */
> -		usleep(150000);
> +
>  		return;
>  	}
> =20
> --=20
> 2.43.0
>=20
>=20
