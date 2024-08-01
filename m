Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33344C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 12:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD3510E935;
	Thu,  1 Aug 2024 12:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKME34J6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34AE810E935
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 12:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722514127; x=1754050127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qTorytqjrXWPlB7v4/oRLmGR/e2psT2JyOqZCMoxgvI=;
 b=cKME34J62UgAVWxh1H11smO3TC6/6kWA5dO4tA74opq06T9YgYHOXkmE
 fZ1wsoI9WsMlTGn6UOItIkbYKA+TNLsG7SIAymrjccWvPv2mrWnU0TneF
 GVmmnIpAa/XeqHhfHix3JDxyc8vAQ4fZnNnXAfEFiyqM2BY37P5XIdvp/
 r5NovFJ53gRAv9e+hxWsjshCWZIAL028a9xf4cQSMUVxbri/DVXTE+euG
 BsVun68Y0WPenJlM+Gsk471i/+xR9KXmNXBJBNtcqvx/JbDnS04x8tq/Z
 4EdSHzbjq9XPJjU1UhhF7KN0/c5hMbWD48HJ72mAbsekViTrEYfTFUp19 Q==;
X-CSE-ConnectionGUID: EP8ripRHSeWgvjI0fmHTGA==
X-CSE-MsgGUID: bNgRtu8dRxKBDuVkfhmThA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31859611"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="31859611"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:08:46 -0700
X-CSE-ConnectionGUID: 8LJCVOLiQgmv5tBdXPj5SA==
X-CSE-MsgGUID: ZQhAHx2rR+SRSzpsRUUxmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="92542460"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 05:08:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:08:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:08:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 05:08:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 05:08:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slmVANpxMEhu6LOnPpqIS7dLBm00UQQxw9e8p/BXAx49+Iy+2xg9kfednW8a9v7VxObvsxhGN7Y8Rmipywpb/kOMaLmcTvVCPCRefLqJmp4A9ba1TmpmI3xbDOAMP0Ev/T88daVwgIolXoH4DwvIGDO3W5PiN6jXqjVJ6yMSeshXE0NZyau28m4N+jxk9ZZD/iYXm0TFHLPr64zJmAn2Bgt2u796a2AtlXTkcpv8WL5eKP35tW8qhqzUwUQfD43sm3vqHwTLvSPEYyQ71ovo1oLZpwtU1xK6EKMpZWoYUiKrTv93vxwJVde8WLugQ+X+xL/Vfh6bm38IH8jEvb1vpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6M568mjhEoWvYzrtXREMw9Ht4/6wm9UwKxMiUg2YJQ=;
 b=YAbBsyvQQOy0KipB0e+A8M58l9fioVDIIPgs9Z4xuPotrF8IOJxv9nsfPLVvFU4wd78NVARBIqW4xx0yAuoqrdMU8oOPL/dNs2/lUO7Cr36LD3ssgJKVB4ku92XYi9l7fEOXAthJ7bBkhgrvM7ilXNO7TTeEDZXeBwzuGWtcfgll3DivPBIOuZT4EOsSxdgZiCMjv3my890538/WmDmeAWdbBfTw7BUfMZyVy3WhJKFRThbqfgEujQWn4fyOJh3Wa5MYdcBPwIvArwrWlDUbSh/PHPo7Hw/SExriOmfG3gtwsy59J5sJlsagAhilv5YSI9K+N2h263LMTyKQpZYoLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 IA1PR11MB7319.namprd11.prod.outlook.com (2603:10b6:208:425::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.23; Thu, 1 Aug 2024 12:08:42 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 12:08:42 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 15/66] tests/xe_eudebug: Race discovery against
 eudebug attach.
Thread-Topic: [PATCH i-g-t v2 15/66] tests/xe_eudebug: Race discovery against
 eudebug attach.
Thread-Index: AQHa4nZGzYN++j4DKE2+InEXo0B6O7ISUZbA
Date: Thu, 1 Aug 2024 12:08:41 +0000
Message-ID: <DS0PR11MB7264E3C09BCF4C8B136E1040D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-16-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-16-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|IA1PR11MB7319:EE_
x-ms-office365-filtering-correlation-id: 65dfa07e-3279-4984-c633-08dcb222af46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?PlxHxqYrvXTH81WeoXuuDR37ruFEyyvTH5P+jeCMb9fYP9BOlVHClea+GZIk?=
 =?us-ascii?Q?9h0heT9p0WTxC0TSlrLKEvGGrfbDmVJsRxt/SLZhrYyipuWlcAf7OjGhD9Jm?=
 =?us-ascii?Q?oaXGiHaCZCIewyRdvv6/75Mr/fwHeUsQ5vX+sKZ6wbMh0rKh1ra51leUuK/T?=
 =?us-ascii?Q?SKqi8xmId04PKw3CjwBrA3bPNJLDKf/8O00E5ZWrOF+bhkZyKlyAKXlirKHz?=
 =?us-ascii?Q?urzI+ibe/QanvXkYeo+YbR8FkESzbjY9P66d6So/iZgkfnFZSsr5FehK9MVD?=
 =?us-ascii?Q?SyrqKiCwNB03/4A0MDyXMmK+siVdRPcbOJ+ZEeVW6k4OPgfDA09ezFxrX8EI?=
 =?us-ascii?Q?VJJ65KW5gR0zf0JyvG28K0gC4ywcH94RFoqUveSIapd6wjjTeJjSXomiay5a?=
 =?us-ascii?Q?a+Rb9LByA6icUmUfmnInwTHXZfSt4lX1ttvfo+VgB8vjud7aZ2GT9erj/d+L?=
 =?us-ascii?Q?TdwtDnZaC2dD0KBAHTv0FyiFb/DB2XESqIN5UJs9/zQR/s/Q2MkQMhnE/S2w?=
 =?us-ascii?Q?JUAH+G9vhr0hnFeg7vSxmjL9Kv2Hl4Sj7eKoErMbg7CNYonilh1UTXFDOyRp?=
 =?us-ascii?Q?l84Z2p/o6ZmNsB9Eg+I4vqlYHTSoFV2EAL+PazgWOb8iYEfY/cp5Qb6MPvMk?=
 =?us-ascii?Q?5H7F1sHl2fUupDc29Ng/NaGRetTkEi05eQ1vPdmt9tTuJTxMw64W0nzR8GDV?=
 =?us-ascii?Q?48y4SsrH8Stggk8SqxMZTK1wRgm/Pqm76Bafk9sIdiS26ice5ffNLn2O/JfL?=
 =?us-ascii?Q?YHB2MQHBBIIovM5QzDzapYdsCPHsyOIuKYTo5vswiJDnTiblKUprbvMirTrY?=
 =?us-ascii?Q?HbwNsGly5VJXdj9sEsQyhAL6s4UObKPhbsjR3Ekztgzpviu7ElORk7qV+TW5?=
 =?us-ascii?Q?9ePGS+1dE6n9ppwxgH0p/G84GZQ7B7sJwHZJ+UbqoRtFvafYZyftDYgeyx7M?=
 =?us-ascii?Q?8e7Z1VziSeQmLEHnk6JbtLMPhI1BdSdYXtBUAgc6+UyEj9+q1MQCYOqS3atK?=
 =?us-ascii?Q?NLZIQOeauZ7EfBJ02+8dVLvT07eAoXp99VSXHWGB8aAYWSAUm/95jxrqZ2q4?=
 =?us-ascii?Q?WIOSvfpKtrICXvqau0SFNtPlhjIvDAOBZ6fBP9GPasdBh0MnlELVXP7DdB/t?=
 =?us-ascii?Q?5EBTrZ3QBSLRQeWsum2IVtQyQfFbZXtWOyCs5Twf1EO/iK9oAOIdQ5EazIhW?=
 =?us-ascii?Q?y6Ucmai51C0jXiKn+p7vvMowKx0d7jpSV/7ZnOik2pKDtU1wuft8tMfyJHgY?=
 =?us-ascii?Q?3GYMVWuqCS4dF7SksFNRnLtJS0qdBrh231LQYWDv9jT7n598EuVutUKUI6k9?=
 =?us-ascii?Q?rB6wTMSRoaeUUl7HEhvJ+3K8rBjL20iYbYq1Ir94hz06N4MAv+ahjd+EmO4q?=
 =?us-ascii?Q?ZJYXI9zOpA0VfmcELl/CMUQyhHhIuznfW++N+Hvj9X8VF4fW6A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2x01ItFTY3HiAS3Wi0xQ9sD5/C2Pifp3aG+T/wCzosiuK/PZav1mYkb62HGH?=
 =?us-ascii?Q?mNUkkh6Au+RymnZjSotuB99ZEmCEDNAEDMWACi2mFKFHlAr0Tqwv31htTPuV?=
 =?us-ascii?Q?YltsdtjKUhK04iK7GToAT+aezOMp/opgdI549pxSREr88GEA/wqFf+J7K73Q?=
 =?us-ascii?Q?uWQ0M5GL61eMODKIzZ1554o4QGBzrS2ClUiUW6qSHItuw5xm3f963Z4fcKXa?=
 =?us-ascii?Q?9pwk3Ad/VjJ6avhOSgkjKgIMv9Dpvxd9+Sv8UUWdA0fwkhVJbCEPdZCgbeKg?=
 =?us-ascii?Q?JaNd1jAg+ic6uKD1kTkluTFJVfXi0AoH0B08QoYMVKQH0S8ieJ6+LiTWf0tk?=
 =?us-ascii?Q?2DhwHkNL50gVWLeE3X6MzSJGis+Ep0epXwe7neF6fNcH4MQNtjeVil/siKWY?=
 =?us-ascii?Q?ybK01chkUmEVL21GkWchtL+4SAbI0mCP7sae2xNPluNd2jM6tlzfUveHo/sN?=
 =?us-ascii?Q?aiQNREQI6NnadpLsqdktPPQD0bZ8z1012PHyyBwmJfkkhjax5VxuZVfsacLM?=
 =?us-ascii?Q?EFOh9KTOgml6YfydR2YjjD85pJHB5keO1pgzJOo5QVhKHYw5XqnQ+VplPtUQ?=
 =?us-ascii?Q?GD26lOqfGaat3Xfsi4a5bl09r+o9ajojjlAOX3pswJmKwFUIuL1Lt2e/fxht?=
 =?us-ascii?Q?1Bkc8oMRWVb3EaXlydVk3PnCIAcQG8wVVBvnv4go2gzk4I8DL76xDLyF6rck?=
 =?us-ascii?Q?j6jYEqfEHDbwuigGvV9gfr/nceRxTm3+kaUzrsDa49FNFDH6CzdpUI9VmDzP?=
 =?us-ascii?Q?0gg72ti7sFQP4kWD6mwWPLMbS+TlqRNLQ2Sw/NUlsGA8JatKnQBR6vaPr1cY?=
 =?us-ascii?Q?Vkv+twB8JcpR01mSx7F3Y/WRjbZUmwDXDy0PAUZ2qAWnzZSN9AUFNG6fIohC?=
 =?us-ascii?Q?cGhbwD5IHeRMI7cEBJ6Xo8lAZGSfPQYn4OiUffaxVBKG9kerwATHan9MhCWr?=
 =?us-ascii?Q?SsZmvntBJidZKC1LEkdHVLvCngOT7TC6rXp0R5XstkXlbtKWRn85mgYG8HG9?=
 =?us-ascii?Q?GzSDjk4IXgtakk6KOJbJ/dvslDTJUpLuapSpu93Z2gd2SOJ2vRN3Dgi0Gqe6?=
 =?us-ascii?Q?RMpilUznVgPMboEaHv40/w+3MFUpzw5KiGem40np8muLHuvN8jSM6fZ/DZqM?=
 =?us-ascii?Q?At3IKxOLM50rmmxBYg3SXniQRzPd/I2MBCoVuBvHslcVi7M9Xnl/im4s89x0?=
 =?us-ascii?Q?gU4jWe9eOB7OF5bobtJ4NRTTJvSHI8s893U3gi3BQMTzUmv4/rQPzbiXUY83?=
 =?us-ascii?Q?qDvozefhjFf5yuQ+NRSZfr47l4eIDAMUOBvpnkC2ul2IIM15IT1vPJ9eouoS?=
 =?us-ascii?Q?KUXsEOW8dNgzxpx1U3MwVn/RzA7DQZCdb4BW7kp2KjYR8eR2ASdNucIPimTN?=
 =?us-ascii?Q?lQpyCQN17Y2e+CaCWtItiJaeneDmID0Hwd02JuRa3x8Rt0KxLIPDIhKHYNOQ?=
 =?us-ascii?Q?633kCp6+DbwJaBfthJmJMEx4YRFinz99aWUPJkUAt1LWJrA9H+SYtTOw5J9r?=
 =?us-ascii?Q?UMDgwnq1X2ubLql3mU9GRnKPxNRVww5Ewjk6MT5Cf71KMpewF4+Sk1S00GpW?=
 =?us-ascii?Q?6geJrsMJIAIZ5+ZWZqz6xUl2OS3Umo1mEpRH4T7btkMAEF/LJUHo/lqb7rdF?=
 =?us-ascii?Q?UzV45PKWtolGl/c9OeoYWhY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65dfa07e-3279-4984-c633-08dcb222af46
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 12:08:41.9014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WyIU4nrs9F7B/DOVaVptMrKWrI9H3BZbhMPTBbMWJpkXnzvxVixIJozlv6+WRQuYJrbCnWSJbJM0SXHd30yybZsyVZ3GJ8eAhP83ych9V/nws1P7yKsd4JYv7gn9b+r0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7319
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

Comment below.

Thanks,
Dominik Karol

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 15/66] tests/xe_eudebug: Race discovery against
> eudebug attach.
>=20
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>=20
> Validate eu debug resource discovery in a pretty cruel way.
> Add subtests:
>=20
> 1) discovery-race - spawns N client proccesses, which create
>    N+N*N resources each, then it creates M debugger
>    threads competing for an access to the client proccess. After
>    successful attach, with probability of 0.5 read and assert
>    discovered resources, immediately detach otherwise.
>=20
> 2) discovery-empty[|-clients] - same as 1#, but destroy
>    resources in flight (explicetly or by closing the client).

Typo: explicitly

>    Expect the last discovery not sending any events.
>=20
> Currently N =3D 4, M =3D 3.
>=20
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 254
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 254 insertions(+)
>=20
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index
> 7c1c21a33..d97e7914e 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -282,6 +282,251 @@ static void test_basic_sessions(int fd, unsigned in=
t
> flags, int count)
>  		xe_eudebug_session_destroy(s[i]);
>  }
>=20
> +#define RESOURCE_COUNT 16
> +#define PRIMARY_THREAD			(1 << 0)
> +#define DISCOVERY_CLOSE_CLIENT		(1 << 1)
> +#define DISCOVERY_DESTROY_RESOURCES	(1 << 2)
> +static void run_discovery_client(struct xe_eudebug_client *c) {
> +	int fd[RESOURCE_COUNT], i;
> +	bool skip_sleep =3D c->flags & (DISCOVERY_DESTROY_RESOURCES |
> +DISCOVERY_CLOSE_CLIENT);
> +
> +	srand(getpid());
> +
> +	for (i =3D 0; i < RESOURCE_COUNT; i++) {
> +		fd[i] =3D xe_eudebug_client_open_driver(c);
> +
> +		/*
> +		 * Give the debugger a break in event stream after every
> +		 * other client, that allows to read discovery and dettach in
> quiet.
> +		 */
> +		if (random() % 2 =3D=3D 0 && !skip_sleep)
> +			sleep(1);
> +
> +		for (int j =3D 0; j < RESOURCE_COUNT; j++) {
> +			uint32_t vm =3D xe_eudebug_client_vm_create(c, fd[i],
> 0, 0);
> +
> +			if (c->flags & DISCOVERY_DESTROY_RESOURCES)
> +				xe_eudebug_client_vm_destroy(c, fd[i], vm);
> +		}
> +
> +		if (c->flags & DISCOVERY_CLOSE_CLIENT)
> +			xe_eudebug_client_close_driver(c, fd[i]);
> +	}
> +}
> +
> +/**
> + * SUBTEST: discovery-%s
> + * Description: Race discovery against %arg[1] and the debugger dettach.
> + *
> + * arg[1]:
> + *
> + * @race:		resources creation
> + * @empty:		resources destruction
> + * @empty-clients:	client closure
> + */
> +static void *discovery_race_thread(void *data) {
> +	struct {
> +		uint64_t client_handle;
> +		int vm_count;
> +	} clients[RESOURCE_COUNT];
> +	struct xe_eudebug_session *s =3D data;
> +	int expected =3D RESOURCE_COUNT * (1 + RESOURCE_COUNT);
> +	const int tries =3D 100;
> +	bool done =3D false;
> +	int ret =3D 0;
> +
> +	for (int try =3D 0; try < tries && !done; try++) {
> +
> +		ret =3D xe_eudebug_debugger_attach(s->d, s->c);
> +
> +		if (ret =3D=3D -EBUSY) {
> +			usleep(100000);
> +			continue;
> +		}
> +
> +		igt_assert_eq(ret, 0);
> +
> +		if (random() % 2) {
> +			struct drm_xe_eudebug_event *e =3D NULL;
> +			int i =3D -1;
> +
> +			xe_eudebug_debugger_start_worker(s->d);
> +			sleep(1);
> +			xe_eudebug_debugger_stop_worker(s->d, 1);
> +			igt_debug("Resources discovered: %lu\n", s->d-
> >event_count);
> +
> +			xe_eudebug_for_each_event(e, s->d->log) {
> +				if (e->type =3D=3D
> DRM_XE_EUDEBUG_EVENT_OPEN) {
> +					struct drm_xe_eudebug_event_client
> *eo =3D (void *)e;
> +
> +					if (i >=3D 0) {
> +
> 	igt_assert_eq(clients[i].vm_count,
> +
> RESOURCE_COUNT);
> +					}
> +
> +					igt_assert(++i < RESOURCE_COUNT);
> +					clients[i].client_handle =3D eo-
> >client_handle;
> +					clients[i].vm_count =3D 0;
> +				}
> +
> +				if (e->type =3D=3D
> DRM_XE_EUDEBUG_EVENT_VM)
> +					clients[i].vm_count++;
> +			};
> +
> +			igt_assert_lte(0, i);
> +
> +			for (int j =3D 0; j < i; j++)
> +				for (int k =3D 0; k < i; k++) {
> +					if (k =3D=3D j)
> +						continue;
> +
> +
> 	igt_assert_neq(clients[j].client_handle,
> +						       clients[k].client_handle);
> +				}
> +
> +			if (s->d->event_count >=3D expected)
> +				done =3D true;
> +		}
> +
> +		xe_eudebug_debugger_dettach(s->d);
> +		s->d->log->head =3D 0;
> +		s->d->event_count =3D 0;
> +	}
> +
> +	/* Primary thread must read everything */
> +	if (s->flags & PRIMARY_THREAD) {
> +		while ((ret =3D xe_eudebug_debugger_attach(s->d, s->c)) =3D=3D -
> EBUSY)
> +			usleep(100000);
> +
> +		igt_assert_eq(ret, 0);
> +
> +		xe_eudebug_debugger_start_worker(s->d);
> +		xe_eudebug_client_wait_done(s->c);
> +
> +		if (READ_ONCE(s->d->event_count) !=3D expected)
> +			sleep(5);
> +
> +		xe_eudebug_debugger_stop_worker(s->d, 1);
> +		xe_eudebug_debugger_dettach(s->d);
> +	}
> +
> +	return NULL;
> +}
> +
> +static void test_race_discovery(int fd, unsigned int flags, int
> +clients) {
> +	const int debuggers_per_client =3D 3;
> +	int count =3D clients * debuggers_per_client;
> +	struct xe_eudebug_session *sessions, *s;
> +	struct xe_eudebug_client *c;
> +	pthread_t *threads;
> +	int i, j;
> +
> +	sessions =3D calloc(count, sizeof(*sessions));
> +	threads =3D calloc(count, sizeof(*threads));
> +
> +	for (i =3D 0; i < clients; i++) {
> +		c =3D xe_eudebug_client_create(fd, run_discovery_client, flags,
> NULL);
> +		for (j =3D 0; j < debuggers_per_client; j++) {
> +			s =3D &sessions[i * debuggers_per_client + j];
> +			s->c =3D c;
> +			s->d =3D xe_eudebug_debugger_create(fd, flags, NULL);
> +			s->flags =3D flags | (!j ? PRIMARY_THREAD : 0);
> +		}
> +	}
> +
> +	for (i =3D 0; i < count; i++) {
> +		if (sessions[i].flags & PRIMARY_THREAD)
> +			xe_eudebug_client_start(sessions[i].c);
> +
> +		pthread_create(&threads[i], NULL, discovery_race_thread,
> &sessions[i]);
> +	}
> +
> +	for (i =3D 0; i < count; i++)
> +		pthread_join(threads[i], NULL);
> +
> +	for (i =3D count - 1; i > 0; i--) {
> +		if (sessions[i].flags & PRIMARY_THREAD) {
> +			igt_assert_eq(sessions[i].c->seqno-1, sessions[i].d-
> >event_count);
> +
> +			xe_eudebug_event_log_compare(sessions[0].d->log,
> +						     sessions[i].d->log, 0);
> +
> +			xe_eudebug_client_destroy(sessions[i].c);
> +		}
> +		xe_eudebug_debugger_destroy(sessions[i].d);
> +	}
> +}
> +
> +static void *attach_dettach_thread(void *data) {
> +	struct xe_eudebug_session *s =3D data;
> +	const int tries =3D 100;
> +	int ret =3D 0;
> +
> +	for (int try =3D 0; try < tries; try++) {
> +
> +		ret =3D xe_eudebug_debugger_attach(s->d, s->c);
> +
> +		if (ret =3D=3D -EBUSY) {
> +			usleep(100000);
> +			continue;
> +		}
> +
> +		igt_assert_eq(ret, 0);
> +
> +		if (random() % 2 =3D=3D 0) {
> +			xe_eudebug_debugger_start_worker(s->d);
> +			xe_eudebug_debugger_stop_worker(s->d, 1);
> +		}
> +
> +		xe_eudebug_debugger_dettach(s->d);
> +		s->d->log->head =3D 0;
> +		s->d->event_count =3D 0;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void test_empty_discovery(int fd, unsigned int flags, int
> +clients) {
> +	struct xe_eudebug_session **s;
> +	pthread_t *threads;
> +	int i, expected =3D flags & DISCOVERY_CLOSE_CLIENT ? 0 :
> RESOURCE_COUNT;
> +
> +	igt_assert(flags & (DISCOVERY_DESTROY_RESOURCES |
> +DISCOVERY_CLOSE_CLIENT));
> +
> +	s =3D calloc(clients, sizeof(struct xe_eudebug_session *));
> +	threads =3D calloc(clients, sizeof(*threads));
> +
> +	for (i =3D 0; i < clients; i++)
> +		s[i] =3D xe_eudebug_session_create(fd, run_discovery_client,
> flags,
> +NULL);
> +
> +	for (i =3D 0; i < clients; i++) {
> +		xe_eudebug_client_start(s[i]->c);
> +
> +		pthread_create(&threads[i], NULL, attach_dettach_thread,
> s[i]);
> +	}
> +
> +	for (i =3D 0; i < clients; i++)
> +		pthread_join(threads[i], NULL);
> +
> +	for (i =3D 0; i < clients; i++) {
> +		xe_eudebug_client_wait_done(s[i]->c);
> +		igt_assert_eq(xe_eudebug_debugger_attach(s[i]->d, s[i]->c),
> 0);
> +
> +		xe_eudebug_debugger_start_worker(s[i]->d);
> +		xe_eudebug_debugger_stop_worker(s[i]->d, 5);
> +		xe_eudebug_debugger_dettach(s[i]->d);
> +
> +		igt_assert_eq(s[i]->d->event_count, expected);
> +
> +		xe_eudebug_session_destroy(s[i]);
> +	}
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -308,6 +553,15 @@ igt_main
>  	igt_subtest("basic-vms")
>  		test_basic_sessions(fd, CREATE_VMS, 1);
>=20
> +	igt_subtest("discovery-race")
> +		test_race_discovery(fd, 0, 4);
> +
> +	igt_subtest("discovery-empty")
> +		test_empty_discovery(fd, DISCOVERY_CLOSE_CLIENT, 16);
> +
> +	igt_subtest("discovery-empty-clients")
> +		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES,
> 16);
> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
> --
> 2.34.1

