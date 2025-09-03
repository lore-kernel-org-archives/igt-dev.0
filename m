Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3BFCA0FF2
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 10:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CBE10E738;
	Wed,  3 Sep 2025 10:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLZEMLvr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CBF10E738
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 10:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756896298; x=1788432298;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=v8QVCyPdzEhJi0mJ+Q9kITamA8+cwHXbwcq9LvogE6w=;
 b=SLZEMLvrzyAIvtEeRBNJ4C0bu0rpbmJt9T0xPvwAo5Veg4hjgSazcH/w
 tQq/1ZEjmnBvLNhB7GR82zclIZ7Pd3w51RbiYjkDIlmXpu168CTnL79Yf
 MG84OVaD0U13InqCCH+yO/40qim14dAcXnv6GoHIqLSglYGtXpBCyQKeV
 Th2jPBJuxh6eIKJHjiq2Cu5BUIzheSRJ/iGYZF1dWLJkS0Sl0Bc1KbL8F
 VlhxPmJtZmcEfUNX4vNikg7HZY1vhVGRnsMEbQ4hiuKgqzKs2KBh870L1
 a/Iff9ecbW/k03J1JqO6/JSZEYb2cjuDJuOoK5huUmA9mtjaU30kdHwah g==;
X-CSE-ConnectionGUID: erw1STGwS8a18rwBwOvRhg==
X-CSE-MsgGUID: H1B529TkQIuwN5vd/hwbaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70303999"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="70303999"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 03:44:57 -0700
X-CSE-ConnectionGUID: PGzEJEwcQbO2uWVUJnMHzQ==
X-CSE-MsgGUID: vdTSlQBgQ0qbnewhgy38Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="195183412"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 03:44:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 03:44:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 03:44:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 03:44:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmyG3R16BPhGEYJ2Ug1eFFCkp0SIcQmeyFtNiUkB1rj2C5rZ7cRhwtz9JPnFOL2NVTE5E61Io2626poua4FVMTVol0CKz+cTcpDdu9Dy7sfKaVlc0o13UKeA5ib1rvjmVghuL44NHWAYuKvh1skW2DfhDMKNFNRRYaADKF/ILtJyny1DMRdqlSCOsyO4Me+rwEpIN409Kw2R+NCpksznyBoi34rseTzBeuBX6658dhT8sTmuiY17p8cLrkhTrNRDxJ2saRg9+C6R7QXCKQ5OUjvD6SzNRROPYhxfDHG1vdJKsfUzcadJR709Caull0ChzKV14NHsfEYeEcKF+/ngkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SieQ4aMU7DdZI361QBqJGND25+NH1djorJUGKfMljUA=;
 b=SUv+Fz9nPHI/Rv8vLJWt7DuSawVW/GfDR6jZxy1lh6JboK1h3CuDjHbowMkpMIte9+N9QQH9ARdVLUoh+dcHwwoXtepAhJxcVIknBVBAnkVUc1ljQcdL6Q3Wmw1Aqzt8sVk/MkZucJWiDLj8zPvnk01yyLTg8c2PhNPH99FMh1itsc3k7OsAd3k3NKkuUb/YhrRltRwPICIC9qyNN6xY2ue6duKcPOPcap/p386a3C7cYxnyACk4GkKW2auhacwuzV9FhQCxJx5w91ZeRZDUmIF7cimX/enFhdIiAE5eIqginfQon0Be7Rou9ksLnHXgvXu57oOyDQQa1Gh12PDbsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by BL1PR11MB5270.namprd11.prod.outlook.com (2603:10b6:208:313::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Wed, 3 Sep
 2025 10:44:49 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 10:44:49 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t v9 3/5] lib/xe: Add Helper to get memory attributes
Thread-Topic: [PATCH i-g-t v9 3/5] lib/xe: Add Helper to get memory attributes
Thread-Index: AQHcHL7ECW/zxQ5DVkiy/VwjuEwvu7SBRf9A
Date: Wed, 3 Sep 2025 10:44:49 +0000
Message-ID: <BL1PR11MB5525EFF33FED5ECABA096C4C8401A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250903103716.1780404-1-nishit.sharma@intel.com>
 <20250903103716.1780404-4-nishit.sharma@intel.com>
In-Reply-To: <20250903103716.1780404-4-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|BL1PR11MB5270:EE_
x-ms-office365-filtering-correlation-id: 2a89e43e-eb08-4b6a-4c7b-08ddead6e81b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?fvwgPpu827YlLjtv1j2hNuZMduZQ/Y6OjMDfXOHqCh8qN0mKKirbkm2tz9bb?=
 =?us-ascii?Q?i/1u4YFN/Iq4HPcsn48SdV6UhYfBxNs2dDhLlxTLJLeu2j/e2DgK+wvNN1Es?=
 =?us-ascii?Q?yIBJj42zzXOn1h1KoAvS2asgtCZh4XAz0D71mguquS914v1YQLaZ0PHQtO+0?=
 =?us-ascii?Q?cs886qG7oIOM0BbSUfmtFAJP0A9PD2ATDcEPPvtB46p4R4qecrboJ0AwFHr3?=
 =?us-ascii?Q?BCAf+XoVTe6CJjjcZ3h4+pJjK7P9/V4hLpJ36egHzcI+V7OFUNFQQa0tTcVj?=
 =?us-ascii?Q?iQvt0m4ggtF1ne1woeUb/IeXixBPlE6TtfdBt/9BbQhAxLqbNj3Ga+5fTims?=
 =?us-ascii?Q?7NtqtXjX0PxGrAyDAmZQsBKh9ckl0LboueCBX0I3U1sPx1gzOTdd3X0Jvtwz?=
 =?us-ascii?Q?QLvSrIcHaUGNfHeDfK/AzEHMJJuDs3gnV0auAOeUkUdJrMT+KMLZ1EN58+6u?=
 =?us-ascii?Q?QSlOZjU+4RVM4w4rJvwCh/UOQ1fGguY+MyI8wFJHre/xfBjwh9baZaf1znse?=
 =?us-ascii?Q?/bzSKKzL5TNq6mrUidDwkU6WZ64VxQzKWGJZvwgEX6Fsm4k6lMRAzlAm+sNZ?=
 =?us-ascii?Q?NRvozmzJRDlaKwcc0tjGQLWOuT3ao/xpT3+aMszL3C5glrRMQ1+wnifgL9Rt?=
 =?us-ascii?Q?lbBJ0Zdn7OkbtLml8ENV6cn9ShUEjag35gxYNvS4QbDgmn9y/rnuUxeOUeaH?=
 =?us-ascii?Q?bfg3G/cQU+vxqe0/YIMIS2tXx3qaOMz7x49MYMQ0l2+2q5nZqgB+wr94KZdW?=
 =?us-ascii?Q?209FTw0kJlHNCyt/wBjmURdu7TbFhwUDBTdQ3+O78fQUbYCYuN3y5n8keDfN?=
 =?us-ascii?Q?OIAf2EQGwlJsvPZ7XRf9AqaA8ctPNEYqiM8ZabiZqSnBL/OI55EexrgT0Yks?=
 =?us-ascii?Q?SV/7kSLSsJSKntuveNolfQ24CuXX74EwLbQFTbVQRLY5aWTSXl5WHHGzwTYq?=
 =?us-ascii?Q?UyjGadGejBKCdY5LtQ5Pq/iA5fxU6qC24y/zG7EDWzgNWo/FMK3SaIniOIP0?=
 =?us-ascii?Q?R/cgapmqUm/Al2SEcBexzwJ4n/OC+a0Q/3o2/E40MmfrT1TnTH+UdUn88t57?=
 =?us-ascii?Q?LHs7Ct+T01L7S9Om1RnAbekVfpvMH33NXvzLcntmmoQ/+wpfiFg5QmoPAjy3?=
 =?us-ascii?Q?oGqUFaJ4ennuVwbrwEHSVw4B7A9L10KUIUo++8JBrzdYXIDE5SvoWj5SXzGo?=
 =?us-ascii?Q?/CbKMcuYNVbtI/nAI9g2ioalyoYPfFTD0o2OqJSSgdSuCZ447cyVA+DOsMmt?=
 =?us-ascii?Q?MgDiQ5l5TFKOFFUzuzyKotI/r40IwgHu6Zr4J++ef5WCM5E6x/yiErkRrr2O?=
 =?us-ascii?Q?3XqNtVctTxKeh9E4Kro7OPzgaWYogEeueZrnzw0ZQOjCRqLm38WeXc3Xqrfr?=
 =?us-ascii?Q?N/VqGtXE1r67/VprKeX85vO3WE0RNyBJfAiVbH9f+5KjsjzZmOqNSWJ1OMNb?=
 =?us-ascii?Q?NuL8tEyPHrfugGrEckEpl8oColRBVS0hfOfNy1IIhUNw5obgjC6TXLkA4nkj?=
 =?us-ascii?Q?tbMBkGv8qOvAorg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D4/6UkbdL286ixXMMYp8e1r0pK6uYUfZlqxDvqndwtjj3nOJbWoqBR0nqhP7?=
 =?us-ascii?Q?G1XZ98UXeZZhp1xkWYfXyq/OvLL/Oe/iqGSvA6gU6Wow+W4RFMlSQEtPkeMw?=
 =?us-ascii?Q?kakUS6GTXf7P7I5K8Jb6WoGC6hslOMyqZ1c1XRKYS2jyyh+0PkwxZA5ioL/D?=
 =?us-ascii?Q?gVFql0KMkWE4EDo8gGAD8ICVAZoZE1C5mRdKllBoZOFJdEsH6oSw6buKdHpS?=
 =?us-ascii?Q?xB5A8Hdjbvgi1c7z1aoyirwMeLbAiZjTPxBoF4WJn4Wf04U5kQytyKmJUCNG?=
 =?us-ascii?Q?FRUv4AlOfMc9rY2SpGx6mX1OcxB5ZqBMwlvDRkVsRTVyTYbfQueYgchFBIOA?=
 =?us-ascii?Q?kgpQsJ01gndT1nndhWMj2sb0BI4q6+4NkQod1oKNfED9c5B+iY/naxlHIuoz?=
 =?us-ascii?Q?MDGaxYYggFLtEbUH+A57+OmnUizqoYiq8q8YG3rbKYH3C2j3RjRj4p5T81Rn?=
 =?us-ascii?Q?RrHGqheYX6hEigFHdrWDDoYwBKNlaWnUVIN2877aEQ4OgHV22ywtrDhTQCrs?=
 =?us-ascii?Q?QuZJpl+n4LgM6x4qCcntvrYS/WB5bq1bTyDH+Y29i522NXfW83W+7w9VL4NJ?=
 =?us-ascii?Q?u9iUsfurBnlK4i3BK90TgF26HndOGKeFVhqDixKFPB3y9BHFlWELrxYzWaN2?=
 =?us-ascii?Q?TuNp3gdlq04m28uRwe0AK2tqIkfhiYAzZzVRBzv2q+reY7Y4nr8yrcD5lJuf?=
 =?us-ascii?Q?xTdra/qnxIUHXk4rSbb+PsVY7D6jY1RxZYyhsfAkWbNzjXYBwgtS7/Taoehv?=
 =?us-ascii?Q?CHo5MxPF/9H6GI5JuULMv+aOHPvirHJFmHmF2yUPr6hraG1kSlR7xuwRu9FM?=
 =?us-ascii?Q?FKPswt4y460U3j0OyiV7fVei8RZydtJtPScbLjJlkn9B4TKeTABpyCU9AUIL?=
 =?us-ascii?Q?JWNEP2/vrEitV0vFlnxrr2su0aPIV92ELegOHTLzNP4QaO1dFPjg8xkvp+Nu?=
 =?us-ascii?Q?P87Xt6CeI4/ujmNvMx7AS9DvHfQdUYWDu3++naHFmfVk1S8W/9YOnPY68XjC?=
 =?us-ascii?Q?YVsgageivg/ocN7f4va1YkrxyVKDthvbvmSu3Gf/HF7l3Kt1iiQ4qfX4xtdf?=
 =?us-ascii?Q?Ab2L4Fop/BiWbZjAuJWh96+vNu48Z9IoKmwbSdG5Lxi6YL2RmavarSCTVwLE?=
 =?us-ascii?Q?SztkVE3yny2f35TaRiIu9mdhhASc0wVR19CFFMc1jj4JHJ7S+OIMCdZI3a1p?=
 =?us-ascii?Q?gG0Spyb5MgN0MJDZzwQ/YHt0Ep2sq3uOwsMaqkrqrKI/+3LhqrU6KKnBgq0V?=
 =?us-ascii?Q?uJnfDFqPRPtYjF/Ds4Y9t+V71V9SvPMNsTVDX0mqtBkBYRhSvV9Z418ML03Y?=
 =?us-ascii?Q?xVF2i3uupgjZuSReEn7Aa64JB3fsoM1wZAIODwfoqSMNznPrr8JKVbhFJVGT?=
 =?us-ascii?Q?kP/sA4hiwUuHcvoSdEiUC2O5y3srN2q7e/SciEHqYNq8dAxsL02SEp6Co5Z+?=
 =?us-ascii?Q?icBxyFQ40E4IHOXvUGT8apMt4S7xVQNRidKzF1MWMOouNzyVIAs+Pcg7H1np?=
 =?us-ascii?Q?bmrrCD5c0wu6+e9Ll+7ZCEzEntO2um5f0niwgzF8/uJGW3c5wzo6cX3vHLL0?=
 =?us-ascii?Q?e9mJm4cdjasj2OZ+bsg9XyiVUTOHlo5J8OsrGzUxGpFUaZ/QUn+38BevqP09?=
 =?us-ascii?Q?wQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a89e43e-eb08-4b6a-4c7b-08ddead6e81b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 10:44:49.4220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hugg5yOydVe3qUSidlpZuLzp+qqh+7YTXP18/1M6Cp+u8SEish+sWWkBobV+9dYUKNrpyIo5TZ3G/elVjH4zncfD/SkP9mcEIJMYoCTLaRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5270
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



> -----Original Message-----
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Wednesday, September 3, 2025 4:07 PM
> To: igt-dev@lists.freedesktop.org; Gurram, Pravalika
> <pravalika.gurram@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t v9 3/5] lib/xe: Add Helper to get memory attributes
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> xe_vm_print_mem_attr_values_in_range() function added which calls
> QUERY_MEM_RANGES_ATTRS ioctl to get different memory attributes from
> KMD and then prints memory attributes returned by KMD for different acces=
s
> policies like atomic access, preferred loc and pat index.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  4 +++
>  2 files changed, 96 insertions(+)
>=20
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index 5608c8780..28b7d=
5bec
> 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -57,6 +57,98 @@ uint64_t xe_bb_size(int fd, uint64_t reqsize)
>  	             xe_get_default_alignment(fd));  }
>=20
> +int xe_vm_number_vmas_in_range(int fd, struct
> +drm_xe_vm_query_mem_range_attr *vmas_attr) {
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS,
> vmas_attr))
> +		return -errno;
> +	return 0;
> +}
> +
> +int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr
> *vmas_attr,
> +		    struct drm_xe_mem_range_attr *mem_attr) {
> +	if (!mem_attr)
> +		return -EINVAL;
> +
> +	vmas_attr->vector_of_mem_attr =3D (uintptr_t)mem_attr;
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS,
> vmas_attr))
> +		return -errno;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_vm_print_mem_attr_values_in_range:
> + * @fd: xe device fd
> + * @vm: vm_id of the virtual range
> + * @start: start of the virtual address range
> + * @range: size of the virtual address range
> + *
> + * Calls QUERY_MEM_RANGES_ATTRS ioctl to get memory attributes for
> +different
> + * memory ranges from KMD. prints memory attributes as returned by KMD
> +for
> + * atomic, prefrred loc and pat index types.
> + *
> + * Returns 0 for success or error for failure  */
> +
> +int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t
> +start, uint64_t range) {
> +
> +	void *ptr_start, *ptr;
> +	int err;
> +	struct drm_xe_vm_query_mem_range_attr query =3D {
> +		.vm_id =3D vm,
> +		.start =3D start,
> +		.range =3D range,
> +		.num_mem_ranges =3D 0,
> +		.sizeof_mem_range_attr =3D 0,
> +		.vector_of_mem_attr =3D (uintptr_t)NULL,
> +	};
> +
> +	igt_debug("mem_attr_values_in_range called start =3D %"PRIu64"\n range
> =3D %"PRIu64"\n",
> +		  start, range);
> +
> +	err  =3D xe_vm_number_vmas_in_range(fd, &query);
> +	if (err || !query.num_mem_ranges || !query.sizeof_mem_range_attr) {
> +		igt_warn("ioctl failed for xe_vm_number_vmas_in_range\n");
> +		igt_debug("vmas_in_range err =3D %d query.num_mem_ranges =3D
> %u query.sizeof_mem_range_attr=3D%lld\n",
> +			 err, query.num_mem_ranges,
> query.sizeof_mem_range_attr);
> +		return err;
> +	}
> +
> +	/* Allocate buffer for the memory region attributes */
> +	ptr =3D malloc(query.num_mem_ranges * query.sizeof_mem_range_attr);
> +	ptr_start =3D ptr;
> +
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	err =3D xe_vm_vma_attrs(fd, &query, ptr);
> +	if (err) {
> +		igt_warn("ioctl failed for vma_attrs err =3D %d\n", err);
> +		return err;
> +	}
> +
> +	/* Iterate over the returned memory region attributes */
> +	for (unsigned int i =3D 0; i < query.num_mem_ranges; ++i) {
> +		struct drm_xe_mem_range_attr *mem_attrs =3D (struct
> +drm_xe_mem_range_attr *)ptr;
> +
> +		igt_debug("vma_id =3D %d\nvma_start =3D 0x%016llx\nvma_end =3D
> 0x%016llx\n"
> +				"vma:atomic =3D %d\nvma:pat_index =3D
> %d\nvma:preferred_loc_region =3D %d\n"
> +				"vma:preferred_loc_devmem_fd =3D %d\n\n\n",
> i, mem_attrs->start,
> +				mem_attrs->end,
> +				mem_attrs->atomic.val, mem_attrs-
> >pat_index.val,
> +				mem_attrs-
> >preferred_mem_loc.migration_policy,
> +				mem_attrs->preferred_mem_loc.devmem_fd);
> +
> +		ptr +=3D query.sizeof_mem_range_attr;
> +	}
> +
> +	free(ptr_start);
> +	return 0;
> +}
> +
>  uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)  {
>  	struct drm_xe_vm_create create =3D {
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index 8e13ffe65..14245=
eeec
> 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -103,4 +103,8 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t add=
r,
> uint64_t range, uint64_t
>  		    uint32_t type, uint32_t op_val, uint16_t policy);  void
> xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_=
t ext,
>  		  uint32_t type, uint32_t op_val, uint16_t policy);
> +int xe_vm_number_vmas_in_range(int fd, struct
> +drm_xe_vm_query_mem_range_attr *vmas_attr); int xe_vm_vma_attrs(int fd,
> struct drm_xe_vm_query_mem_range_attr *vmas_attr,
> +		    struct drm_xe_mem_range_attr *mem_attr); int
> +xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t
> +start, uint64_t range);
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
>  #endif /* XE_IOCTL_H */
> --
> 2.43.0

