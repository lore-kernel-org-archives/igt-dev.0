Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D129E7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 05:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34E710E08F;
	Wed, 11 Dec 2024 05:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eO2GhzgX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818CB10E08F
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 05:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733894358; x=1765430358;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=LLBm4d4DvYewK8nOTxkLuJbQRgzpO/nC3M5pZmAxm+8=;
 b=eO2GhzgXJH2rTOWdL8AqTmaasUTapc7eeG1I3nq7bPmKo4sPzOcEu2Zg
 7H4ZNpcboqjFzOrr9bcJfaYpV5D2G3RehtSw6VVOAQaW5xaZy8pyXrFtU
 UUzNoJP2vUUJd5jl9+DTurm3STqAaTpw6GoySjRBDrWpXiu/xH1w+Gms5
 Vx4x1QdgQXANagEb2sFtvJAZPwpirpXkV5hsy9KaiYoc0Xw1OhTVqzZFY
 FWUMmcM96K4SflcorEr5npWuzF/KyEl/NR0sGYtTNwhb0o6GSTg9R6/EN
 F8oY2ZqSnUlgheE4W3grkysCvTZkuZyXw70EAHznnw1MXQK8wnu6hCZV9 w==;
X-CSE-ConnectionGUID: tOH5sk3qQp6SkGrKHR2dFw==
X-CSE-MsgGUID: sD9NMcd8Qg6YIP4XWypu1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45664911"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208,217";a="45664911"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 21:19:18 -0800
X-CSE-ConnectionGUID: /LtC1WeuTWOQjY66LW2uIA==
X-CSE-MsgGUID: QcKxNRESTvqUC/hPUgNL0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,217";a="100486045"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 21:19:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 21:19:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 21:19:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 21:19:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLkDfDgk6B/DkHsE/oWAmJh0RQ1QxySVEjAPKr557RR+/ZLsgRLkJybsbJMTz+TpznqkweULN3FT0ab7OT1driWi8Z7OVn4Ci7kf7xoP0oML78FnmKHN1zxIie0rSoCZeogkmJ6ITrBVvvo/KqcWGhrd215SZod40NMy9CY9AyHYR8AerjJBxvxGi83ZUvhS72yKCbQhBMvLIPvokFZz4NqGnZbyko3DIUSPAx65BLskwtVo1jdalMbebAPPBYioRliqjCHef5rOIZXAsQtZt+syiTdkh0Jfjs9qP5ZLiScJMHPWhWyU9C+cRn54vSGM/xBZWyue2y2qw1WTZozWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCAmWoNe5XEsUFl7AX5HPmvi20+0wFceq7Jkpn5GISw=;
 b=k1yaxnaYCg1yFw1anDOMJk028tIEuq3Wk05Lv18wSHSnUL3m926VeSvMtnSMiQ82RV2FPZ2gFrb3tHbrR4tneNDAym4h/JRW93cpAfqTJ2+7+FlMLC07ngsNjs1l5ObAeSIevR/NqtvkDyJER2M/4U/itu8LwxBxnfyR4Vf3n6HqlSRzaHtCRH0nijIX4s+azhE7AGpY3l8LDlYsYU3mEcRUECUxxOvneAOe3NCZ75vNAOhEdqJmRQmSoHAy6BpRoRyyh2eYbOgCmyD9fx29i7jXtFsuP067bPn73HsyWJCc4sZFUiVp+qarfsXnboj70+w48U26KKIKmA9KOCv8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 05:18:45 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%4]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 05:18:45 +0000
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v1 1/1] tests/kms_invalid_mode: Add ultrajoiner
 support to adjust_mode_clock_too_high
Thread-Topic: [PATCH i-g-t v1 1/1] tests/kms_invalid_mode: Add ultrajoiner
 support to adjust_mode_clock_too_high
Thread-Index: AQHbRU988feAiAs+CUy4Kz0ZsseSi7LURGQAgAxHrb4=
Date: Wed, 11 Dec 2024 05:18:45 +0000
Message-ID: <SN6PR11MB270439B309FA36D9C369CA19DB3E2@SN6PR11MB2704.namprd11.prod.outlook.com>
References: <20241203064401.366661-1-santhosh.reddy.guddati@intel.com>
 <20241203064401.366661-2-santhosh.reddy.guddati@intel.com>
 <PH7PR11MB605347E445B878169AF58BA7E7362@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB605347E445B878169AF58BA7E7362@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2704:EE_|CH3PR11MB8773:EE_
x-ms-office365-filtering-correlation-id: 9c8cb6d6-2273-4a7d-febf-08dd19a34901
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?vNcjC6CsmrxoadqS8IEMlWx98+icXEYKkQZBGLd+o8Gli4qLjPXPLnI7nv?=
 =?iso-8859-1?Q?z9Lyby483gt6v49Q8/mpmvF2Z1kfFUNAk2t2nFpC5dnqfrIKmq14xTrfWk?=
 =?iso-8859-1?Q?yUXp1P9cgnKdqags2QQbG3jA8fzdY69ghAmZRmwAq8ac50eehtF8dBgbMi?=
 =?iso-8859-1?Q?RmbLt68QwDN9SEKx81G2rm9XtmwD9Xi1ZduEzkBOPMqvUAa4wwff/7caXF?=
 =?iso-8859-1?Q?b3BbRbSSt4J8/4rTthxtEb67lHk0Y/PHE9VBEWH07AEld117nVOtjafgV+?=
 =?iso-8859-1?Q?nrw20N7mUut07Ymh+xBW4KHZQ6Ado/Sr86QldlvCtKfVrJo2wlgOlN2TTV?=
 =?iso-8859-1?Q?9F++TA3X54oaJu9L+/EKzKrDagDaqx2pQC9+HP2O54kzdU+eDT0D1LIIce?=
 =?iso-8859-1?Q?vbS50eGVBkxYoBXKQwKwodmjjycfWTsn5ZBjm/QBQaoagxnoMN7La1/uxh?=
 =?iso-8859-1?Q?A9gYeSBmTucsyrd0ok9wUNpm2wvL2CHpEvnKtBdIO8vYpjClgLy5mCPDtA?=
 =?iso-8859-1?Q?u0r3JHTLhPg5XoSy3QL+oTvR6MU5cLK7M1+B831XHjPYryU6dsnJKNPEIE?=
 =?iso-8859-1?Q?oNmxzkTZaxUoWPO+JDbTtUpXJ91v+5N9LjYe9Khb52AWF1b4m4J/Ih1+5Q?=
 =?iso-8859-1?Q?uettyke5ThFgsnAuGEPqLwo7pwHaXBOERNbD3WgWOng50arosXXP7b0D0k?=
 =?iso-8859-1?Q?rDYMOA/QoSHDfq42+hMGDescz9gXHD0+eZ8d0Esua4XpYGXzr1D9VDCBVU?=
 =?iso-8859-1?Q?51fxm2kgun3yJ6s62NdwZDbTW5qr9Cfw6tvBH02JinQyvp87kZpydUNuES?=
 =?iso-8859-1?Q?clzVwTx2XBncJcRiZjs8ZnD/apuOuoyI5KJIsnAQYy3SyZEkK/+Fh8++0v?=
 =?iso-8859-1?Q?Qs4RlLIh/Wkp4ETf23trIF389K7PSsRobXcY3YyKc9gkgXRSkU6Td0P50e?=
 =?iso-8859-1?Q?svid9O+zbbhVWNpsMLm3Sf/zwMyGvYTYOG2z9A1AT5GCx32JhVKYCFf3hk?=
 =?iso-8859-1?Q?Q8ni+JQmNPKgUt2YxjGWceK1zGOG1WoXTMLzNteKAftaWR+Dwt/H8VbkR2?=
 =?iso-8859-1?Q?pio2lMORYXz4fs/O8Ejo4qw9O0+jyjqN+JU9WT6JQVLViw59GKJuVWdcy+?=
 =?iso-8859-1?Q?zK5N1cy2afQUSh9WfdVCjr5B2vmuYRJnbolZCd//5b/HH7tWFFayc6c+bb?=
 =?iso-8859-1?Q?Iqpnhtvtta9KctA0ju/HLl64yq3IDDd4RlVrRCj1ghsFyuP359BzLL7Ui8?=
 =?iso-8859-1?Q?0+vl6+Wp6JzsQMxksbXMeevKXQ0G/iMc0+EalxvTMQFh3wXvvD3w8ouYok?=
 =?iso-8859-1?Q?GT+V3KD8YzJcabq0/b/x0kDAXPrd7mW4YYBXYzgnKhYQZmDP96/Gq8ZO9Z?=
 =?iso-8859-1?Q?J8XqDFld3dN31mcWDQuPxLEExf6hDx+jHq9ML8AQdp7eqEYTnUeBAADHpC?=
 =?iso-8859-1?Q?kAZPklXqUECahbnrgRZPN+kTjSioTYVJAO1HJA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QoAmgfIPi5rtrlTsP08950C2HQu7TL/MU4UpfVtq+i0Ulqm4/eNzFE/Ayo?=
 =?iso-8859-1?Q?tVVKlsPpBo0KqzKSZAmA+itU0tDBZRVCAlAU42ubLMpwQn+HHSqDBKGgds?=
 =?iso-8859-1?Q?7+A9Yll6EZhhoV6USWMVkQ25+YnDxS9x8pQBjSDVp0z7/cGONfVZjLOHeI?=
 =?iso-8859-1?Q?BUt/+ZDQM8tcd6VZNdtF8KwFpilnTjvgW/a1217phs1CN4ZNaHisXpXGmM?=
 =?iso-8859-1?Q?1pDJyZ+AuwnzzjkO5GHaJSGgL4gmrjDPwHzWezhKMGsGHVH8KQqVYdZeER?=
 =?iso-8859-1?Q?gmDko3isecVG7o/c7DkAO52h5Zu+Fbtobhrf4qGRXii/NLtcGWBS+hjtSc?=
 =?iso-8859-1?Q?neJ5oijyDKsyixGuyOvzU5nH72oe92AHA+3mvA0WGgD6+9lEwcZ0GeWpTI?=
 =?iso-8859-1?Q?C4OsEUagzcZ9nd94GGNhztqAGVPZJ6+oyFj/6eZ0Upofwh5E0ljjYXcT95?=
 =?iso-8859-1?Q?6JClj9jIzq5111FDdsRoFQ3Jt8vaG4XK+QsfIlS0ID4Ce6vexq2RXTpDpb?=
 =?iso-8859-1?Q?27n9x9AKDsfvbqGilyiFup6fBY4K9UUaSkmjPBRuHacAmESSfrbs8AVKxI?=
 =?iso-8859-1?Q?32ZfX9AnWsIbabMMIPmMSrtXGFVyeptWfXHYdpSIf7n+uU81ubiyAvEtnG?=
 =?iso-8859-1?Q?zZ7igiWog6TpWIg33Md05OZvXp8YZxleAf3kQgzi6VF08w4xqUu2uMUqqC?=
 =?iso-8859-1?Q?fZPUkvRiR+WR9l2Q8E7D2+/b2G2sO1lDtTLGU1AnY1mBVBg1nQvSAQbNFn?=
 =?iso-8859-1?Q?hGCBUcJKU279XPDZX6TJiz5VJCVQWpUq4WkaGDQ+VCD9fumFv8dLUjPosL?=
 =?iso-8859-1?Q?ZUkYKLJZKdI1CVg87EUs+PPOPKn9Ge/TkwL/m1s9tySRkfLyel9m0Rl3gO?=
 =?iso-8859-1?Q?8zHoXSjqeyO1K14oroyOFjK3altQpNqXXUmgNH5BO63tcfJkkMErbX8+OD?=
 =?iso-8859-1?Q?Ty8yn8oeLs6q672acdpHlGNCCBnJBO7aZ6EqPjLDn+NecEAQV2ZpzDk38h?=
 =?iso-8859-1?Q?4YXihfz2FDerbJ+NEYEkQGNeFPdPvX71UN8EJ/hSv9I+nCB/bBBY16aq3b?=
 =?iso-8859-1?Q?9IesrtkcEn2h5M/Do+8/Ajt3Sx2MRIxQy6MReqe1f0QpqwUBzGh9cd6oZj?=
 =?iso-8859-1?Q?zWPH6HDeYVCC20I3kXlZ6/ntVdtz6HskEVo/sT9sqZx75OvhgYXc7/6Hqn?=
 =?iso-8859-1?Q?eUK4VXYnepNp8LaKinMxumv72Nhuj5/PH6RPmgS1tU9Bz5M+43eRNdTGxC?=
 =?iso-8859-1?Q?SEyRoAYV25eMLqTaravUKAgCJ/3bTPSmZtOZRmv9t8JQqNNBqrJtRfsCO+?=
 =?iso-8859-1?Q?4gra5J1oaE8JB1by8qkQfKxkogupbq7TIZ89wLRwLqoENY5GFzGH9AdLfA?=
 =?iso-8859-1?Q?HXBkCCmQw7XzlHnfvTet79cKwhP3bMu98yvAlItZnuDXv1scejuiQxpwP/?=
 =?iso-8859-1?Q?eAqKmJRZyuwmW93/Nitvjr+GUHbhLO3dbGk8O/pTCbX6THOoUhvx+tol1C?=
 =?iso-8859-1?Q?dMflk92w3xntjBQmnVHf0HRKwEj6eQfXULbAWVmoqohPOWzPk8GyT4HSVm?=
 =?iso-8859-1?Q?YkLCuiJLcETPx2kqD40LDAMVHKBcLqdiHFZGqLVgDOaAvCXf4+QxBOGn8e?=
 =?iso-8859-1?Q?tMMjn7AQmWhW25yzvwqB6+5vG8CRIn0FrPtRwDHWTvle328anythIf3g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR11MB270439B309FA36D9C369CA19DB3E2SN6PR11MB2704namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8cb6d6-2273-4a7d-febf-08dd19a34901
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 05:18:45.1180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DpnJqFUwxdkurYSb28bhU1RjeG8VtdbRHBDcVNLgxLCNJqHuD578WTD5MGPKjGvYbPK19N+BqCMCcthh7mQp+B+HcMjVUPB76/rnC4AK746v17rZsUm+4raP1aGZlH3e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8773
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

--_000_SN6PR11MB270439B309FA36D9C369CA19DB3E2SN6PR11MB2704namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Pranay,

________________________________
From: Samala, Pranay <pranay.samala@intel.com>
Sent: Tuesday, December 3, 2024 3:11 PM
To: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; igt-dev@lis=
ts.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: B S, Karthik <karthik.b.s@intel.com>; Reddy Guddati, Santhosh <santhosh=
.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v1 1/1] tests/kms_invalid_mode: Add ultrajoiner s=
upport to adjust_mode_clock_too_high

Hi Santosh,

No need of cover-letter for one patch series

Thank you, I understand that for a single patch, a cover letter seems to be=
 not necessary. I included it here assuming new patches would be added. I w=
ill consider removing the cover letter for future patch series.

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Santho=
sh
> Reddy Guddati
> Sent: Tuesday, December 3, 2024 12:14 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v1 1/1] tests/kms_invalid_mode: Add ultrajoiner sup=
port to
> adjust_mode_clock_too_high
>
> Check ultrajoiner support on the output and adjust `max_dotclock` accordi=
ngly.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_invalid_mode.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c index
> 4fd644594..5f13efddb 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -34,6 +34,7 @@
>   */
>
>  #include "igt.h"
> +#include "xe/xe_query.h"
>  #include <limits.h>
>  #include <stdbool.h>
>
> @@ -99,6 +100,28 @@ can_bigjoiner(data_t *data)
>        return false;
>  }
>
> +static bool
> +can_ultrajoiner(data_t *data)
> +{
> +     bool ultra_joiner_supported =3D false;
> +     bool is_dgfx;
> +     int display_ver;
> +
> +     is_dgfx =3D is_xe_device(data->drm_fd) ? xe_has_vram(data->drm_fd) =
:
> +                                            gem_has_lmem(data->drm_fd);
> +     display_ver =3D intel_display_ver(intel_get_drm_devid(data->drm_fd)=
);
> +
> +     if ((is_dgfx && display_ver =3D=3D 14) || (display_ver > 14))

No need of parentheses around 'display_ver > 14'
> +             ultra_joiner_supported =3D true;
> +
> +     if (ultra_joiner_supported) {
> +             igt_debug("Platform supports ultrajoiner\n");
> +             return true;
> +     }
> +
> +     return false;
> +}
> +
>  static bool
>  adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)  { @@
> -128,6 +151,12 @@ adjust_mode_clock_too_high(data_t *data,
> drmModeModeInfoPtr mode)
>                max_dotclock *=3D 2;
>        }
>
> +     if (can_ultrajoiner(data)) {
> +             igt_info("Platform supports ultrajoiner with %s\n",
> +                              data->output->name);

Alignment should match open parenthesis

Regards,
Pranay Samala
> +             max_dotclock *=3D 4;
> +     }
> +
>        mode->clock =3D max_dotclock + 1;
>
>        return true;
> --
> 2.34.1


--_000_SN6PR11MB270439B309FA36D9C369CA19DB3E2SN6PR11MB2704namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Pranay,</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Samala=
, Pranay &lt;pranay.samala@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, December 3, 2024 3:11 PM<br>
<b>To:</b>&nbsp;Reddy Guddati, Santhosh &lt;santhosh.reddy.guddati@intel.co=
m&gt;; igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt;<=
br>
<b>Cc:</b>&nbsp;B S, Karthik &lt;karthik.b.s@intel.com&gt;; Reddy Guddati, =
Santhosh &lt;santhosh.reddy.guddati@intel.com&gt;<br>
<b>Subject:</b>&nbsp;RE: [PATCH i-g-t v1 1/1] tests/kms_invalid_mode: Add u=
ltrajoiner support to adjust_mode_clock_too_high</span>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Hi Santosh,<br>
<br>
No need of cover-letter for one patch series</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Thank you, I under=
stand that for a single patch, a cover letter seems to be not necessary. I =
included it here assuming new patches would be added. I will consider remov=
ing the cover letter for future patch
 series.<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: igt-dev &lt;igt-dev-bounces@lists.freedesktop.org&gt; On Behalf =
Of Santhosh<br>
&gt; Reddy Guddati<br>
&gt; Sent: Tuesday, December 3, 2024 12:14 PM<br>
&gt; To: igt-dev@lists.freedesktop.org<br>
&gt; Cc: B S, Karthik &lt;karthik.b.s@intel.com&gt;; Reddy Guddati, Santhos=
h<br>
&gt; &lt;santhosh.reddy.guddati@intel.com&gt;<br>
&gt; Subject: [PATCH i-g-t v1 1/1] tests/kms_invalid_mode: Add ultrajoiner =
support to<br>
&gt; adjust_mode_clock_too_high<br>
&gt;<br>
&gt; Check ultrajoiner support on the output and adjust `max_dotclock` acco=
rdingly.<br>
&gt;<br>
&gt; Signed-off-by: Santhosh Reddy Guddati &lt;santhosh.reddy.guddati@intel=
.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/kms_invalid_mode.c | 29 +++++++++++++++++++++++++++++<br>
&gt;&nbsp; 1 file changed, 29 insertions(+)<br>
&gt;<br>
&gt; diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c index=
<br>
&gt; 4fd644594..5f13efddb 100644<br>
&gt; --- a/tests/kms_invalid_mode.c<br>
&gt; +++ b/tests/kms_invalid_mode.c<br>
&gt; @@ -34,6 +34,7 @@<br>
&gt;&nbsp;&nbsp; */<br>
&gt;<br>
&gt;&nbsp; #include &quot;igt.h&quot;<br>
&gt; +#include &quot;xe/xe_query.h&quot;<br>
&gt;&nbsp; #include &lt;limits.h&gt;<br>
&gt;&nbsp; #include &lt;stdbool.h&gt;<br>
&gt;<br>
&gt; @@ -99,6 +100,28 @@ can_bigjoiner(data_t *data)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt; +static bool<br>
&gt; +can_ultrajoiner(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool ultra_joiner_supported =3D false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool is_dgfx;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int display_ver;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; is_dgfx =3D is_xe_device(data-&gt;drm_fd) ? =
xe_has_vram(data-&gt;drm_fd) :<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gem_has_lmem(data-&gt;drm_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; display_ver =3D intel_display_ver(intel_get_=
drm_devid(data-&gt;drm_fd));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if ((is_dgfx &amp;&amp; display_ver =3D=3D 1=
4) || (display_ver &gt; 14))<br>
<br>
No need of parentheses around 'display_ver &gt; 14'<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ultra_joiner_supported =3D true;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ultra_joiner_supported) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_debug(&quot;Platform supports ultrajoiner\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return true;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static bool<br>
&gt;&nbsp; adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode=
)&nbsp; { @@<br>
&gt; -128,6 +151,12 @@ adjust_mode_clock_too_high(data_t *data,<br>
&gt; drmModeModeInfoPtr mode)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; max_dotclock *=3D 2;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (can_ultrajoiner(data)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Platform supports ultrajoiner with %s\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;output-&gt;name);<br>
<br>
Alignment should match open parenthesis<br>
<br>
Regards,<br>
Pranay Samala<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; max_dotclock *=3D 4;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode-&gt;clock =3D max_dotcl=
ock + 1;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
&gt; --<br>
&gt; 2.34.1<br>
<br>
</div>
</body>
</html>

--_000_SN6PR11MB270439B309FA36D9C369CA19DB3E2SN6PR11MB2704namp_--
