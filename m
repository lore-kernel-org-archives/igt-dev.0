Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0261D0D178
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 22:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0FD10E662;
	Wed,  7 Jan 2026 22:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DsGgNLG8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB4410E667
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 22:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767825978; x=1799361978;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dn49vwwhBG8hW9VwWyDWEgjoS2SqSbnxRWBfaQgy2Gw=;
 b=DsGgNLG8hOh7NHuZyEdg0agvPsV1yOdkmTVbdJ+8bdPPSy7ggeWlVSTY
 hVbO5LGklLSM/SSxbRQrInZUtAwLlEqD/9mvIPwF/qKp4rxmJl6JE0avY
 +aaT6lwXYuKUiNSixF3huWOaudJhmEa/09lkGqTiMYnWOzM3wne+/zBc1
 d8kaZps3luruhhtm4aFSiPI/B0ADT0NI9wDhouk7MAgnjSD6T0vFNyrN4
 G67wqqa5DCsCPL0oWxqGaT7XeYcDKFDSY3ggW2tKLl0un9rT96d1bp2xv
 v4rxKG7aSASsEv2zy8YWKRdquYllLAutkLNNEp8UZ/8NmD0HfGS9yzJVt Q==;
X-CSE-ConnectionGUID: HVUOCFGHTwuMCF7u6dbiyw==
X-CSE-MsgGUID: Zd3bB9+TRAGFEMVf1WWb5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69116582"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="69116582"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 14:46:17 -0800
X-CSE-ConnectionGUID: PW2oryGxS/S4aJpAdGtuQQ==
X-CSE-MsgGUID: hLlqOC/FSqCADcqstxCuAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="207889830"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 14:46:17 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 14:46:16 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 14:46:16 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 14:46:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SD+sNW0/KvOjxgOChyzCD9DVaU8cKeEqd+G5s/7ET7nbmSwXd5Jt5y2HE1rpfb40kwXdtahhqyHBANHFgW0yNWxsV9/zR311HUNa+lU9htW6YZD7THjX8OnaS9sIK4QtODVGZRytmX03F1yZveMVqRgLHSMzzR6bwnoK1Vwgm1M2naIXajlZpdV/Zb94slcUf0DpcmwxTZXvJ87FNTwG+bQ6vNe8x1bJo86U7xz3P3yTsvRpMfYh37rU2n0ZsPPE/6O+tq2VY0u8hMEPaCEb5I6HNI+DVTXBsodWcIK3Fu0tjUoaWZzNdEHI845ifJdy4Ln065kexpbNXd623ZjW+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHAhqknzl9ttaWSiUAaxbl+mg/th+He3NbvPI8YEk2k=;
 b=vQln61f0F3el6nQkqI0P4+e3Zvy2iR47GWr8RWJoS9fw1SAPvjzrYtmd4xbKXYeIsNTQnz9Dda9fCR8L7AKmM24mBPr6ZTLe7RN+Q9uLENu6yuhiMiLZXWLfd4q4l3F3HVOIoaDljQg+9g/CIjQZG2EbXG/CCpZulegoJ9K0aeTe+U9ozjXKRdI6p1xBsiGq7srbqqrs5aZrPACI2g7TxZn87IilQwMG+/eYtmPoQcN1WXXkrw8q7nDKEa/dHVbgoQBcpg8Nlr3hC+DzUU347vLT0lP380vXWyDYKa8ksuIuTCdC0f+5RRM5TY0ckvexYLzt+OHB4AiMwCxcVSgCow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7338.namprd11.prod.outlook.com (2603:10b6:930:9e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Wed, 7 Jan
 2026 22:46:13 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 22:46:13 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [i-g-t] tests/intel/xe_ccs: split block-multicopy into 3
 submissions
Thread-Topic: [i-g-t] tests/intel/xe_ccs: split block-multicopy into 3
 submissions
Thread-Index: AQHcgA36DKD9fLq4ckyFRqvGs8I9R7VHTdRg
Date: Wed, 7 Jan 2026 22:46:13 +0000
Message-ID: <CH0PR11MB5444AC97A0B86588FC474B84E584A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <e2bd6e36919fb6d43e182f17eac21195d1d31e4e.1767814525.git.jagmeet.randhawa@intel.com>
In-Reply-To: <e2bd6e36919fb6d43e182f17eac21195d1d31e4e.1767814525.git.jagmeet.randhawa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7338:EE_
x-ms-office365-filtering-correlation-id: 39c81046-cde4-48f1-1dfc-08de4e3e8f50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?jgdl34cscPlm/Bgr0BMxfjXNlLwoEKiVka6UIX4Blpjpi37AKFMKZ04o5elE?=
 =?us-ascii?Q?fAEhU8eUNefoxgGi+G9AwOud4Rp8QyEIv0Z45jFspEevZkTzXe4lkCG3XKKP?=
 =?us-ascii?Q?HIZus+avIyZs7bIO89Cden6d+jm1fWACvxSh61HuN0upmrYPQ+26kYbbeEsW?=
 =?us-ascii?Q?dHzm9fzbtFFNFQT3sz0kh0duTY/2tCVV9dmboQNHq/ichPMqSmisEWGEX/ly?=
 =?us-ascii?Q?H13GfDzbE9v0n6+MKrxTANRBdnVlHEFB9h79DkWYsbzKLaSCf9twQ/86XknG?=
 =?us-ascii?Q?KI7/HtsC47R09iMtliCdtVJsz7AxmhgZLgUgnGYDD07Uxpmx9ZxzahUmxJM9?=
 =?us-ascii?Q?5BegJAwDDNCMnEYoMEPYrrgBMiISsBRXqnYIrHnYmhMSiP2YK6naTtl2sW47?=
 =?us-ascii?Q?oh8Hq0TlOkEgJCYfKap83dTxHhaig/pf2ud8zfxHhETnnoQG+nXctuCgHDq5?=
 =?us-ascii?Q?/wBrWsiXvazrZHQZs59XtKh/stlzPhAYdT1XoAIRTT5oCVe6Z4fMTQu2NFXg?=
 =?us-ascii?Q?qOPl/2E7oU4NbViGpRJZvZ9QqLAr2g6tFdFAVl9uNfrcpj7QoY1H0KfQVIdn?=
 =?us-ascii?Q?WbyInvLSTevAqsBh+IG/RdnoOyf2kVQ2hdlfjMPQYnz585RraHoDSsKldVkc?=
 =?us-ascii?Q?CADPxBeRmVeq97E125YVZ3672p7ZV/AsDuTchzJLhhv3sPyiuBB1ABUd04nS?=
 =?us-ascii?Q?quaZO0PYvIYUE7EZT3iMo+Kol3wq/I4NlUXVBhkOhaLGxijRp/M5ER0Fg2Rf?=
 =?us-ascii?Q?g9iuXGQP7EaZfvm7efHEbvTe7GIfi+fdJWY0OWB0jACrIdu79zNDEmBHdJUq?=
 =?us-ascii?Q?OQ3e90cPTaYM+gZNJMV4Zt45XhGRVMrmdJD/5Khpud/rboVTGpFEBZR7FXUz?=
 =?us-ascii?Q?xsaAmhDmeWnMP+2kC6BBTFkbPLEYmQcdcfDNe2NEQ5Aau19YqYUFKk80nzVM?=
 =?us-ascii?Q?aO1hO0JzrEatCiya6WS8wKg2iHcuv00u7DVGrR5PIkZsn/r+il3jG8Ff/VT6?=
 =?us-ascii?Q?Wme22CFka5MFIM4AaAm83MLmGIA2TNewxmFqwfCAbOZTo97CA+4Q6Kj4ERwD?=
 =?us-ascii?Q?/QWCz7BpOx11+sHQLkk96EbrOT3BP91x9UNoItYAM5qky14BWJ7VMnLhPK8m?=
 =?us-ascii?Q?mv8LfXZyvoc6afNhl+30A3ahe+KR9yccsevoQtfscrIXna4//uDLjbLcFqDe?=
 =?us-ascii?Q?ljFWcb2/dmzBhHt+LqIq7tICO102wdKOmkpr/fBIt3l20RaC2t1GSV7120UO?=
 =?us-ascii?Q?PrL44AoAhu/6/ffl50budk1a6IveU2g7ZAzA2eiHUNAYt8PF7yYBeQeH20/j?=
 =?us-ascii?Q?fkrRnHsAqDob2upLZVLwg5YK3SsSh5oEHvPmj7EOYPOeeMyLFuaZ09PsY7BX?=
 =?us-ascii?Q?t3BeAKcchcqJspnrOXSEvrXD2yGFouSt8xrOLOxeUvBDTjFt/m2NojzvDMQM?=
 =?us-ascii?Q?RHRlM1rbzC3FiGl/Eb1QgperTneon0Qjixm5MOWUzAbD6SczYFrtSSkV0mww?=
 =?us-ascii?Q?qtV+4lYKla5nQ6ckZWOR/z01Ka0KKhSToUAu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0rHcZmW9SFH9yrL02vEFY8vGpxAe9RArqwo50kC/r7QsiWeLJ5X1pRpFHBQ2?=
 =?us-ascii?Q?+BkDu/vpzTKrt4jbOe2Mh3oKiDV+VDVfIzpEsK6byX5wK4T+nDaoK9xmR3Ux?=
 =?us-ascii?Q?CXuaCz/smvAekiQLwwtBhbHN75BIVm8b46af6B5UdNyHaFob7YMofdx4liZQ?=
 =?us-ascii?Q?yz/HoLy5Nj0dzqnlBkci4oaLUpBvJY/WPkTmakUhZr5717lXr1xFSfqWBDPK?=
 =?us-ascii?Q?YQwBRztBjohBPM279ysXYBrUAMFeT9koZVTBocCy7Yi3AI9gmT10lUg6D9G4?=
 =?us-ascii?Q?Wj94aIi9rJQPZ2OBCElWxZ5tPHlwmvy1z+SnRvmnrFaA8MAhAY1993E+Ji/C?=
 =?us-ascii?Q?YkOJIEHB7ttKWgLDZbkI1SXkpu5CUguo60L3TJtbwyCCm2vGEYKUlfGG7QOl?=
 =?us-ascii?Q?kDQt/dXI2HiwGgvl278rKDZExJSKF5fY6bgWn6dVIuj7y+fgYhytRc2kTowg?=
 =?us-ascii?Q?2VESCMt5MjKIGJ/2PR3RF6ooosgFnCv+GYibG5U1NKWmQB148PzPIoOUJbTL?=
 =?us-ascii?Q?f1S4EKklbQTofNzpRHzgOFoDobtdlbsQQz9Vc8iQrU9Sp1HGL6NDLtfQUkZ1?=
 =?us-ascii?Q?NeA/LxtTRk/kNMGHEdd4gV/btVMPFchiKqWYXgps5fOWFKrwxBDBSoHTtYVt?=
 =?us-ascii?Q?YPFJccwgdNZncnAJBE9h9r0FPcYHBZgLfEjCjHde9ZaL3wDxoMIcM1a7A5JB?=
 =?us-ascii?Q?SCJ508jfstRWdh2+Yow74wY7cYp3NIkoGAsstiXwKRC/9ciQSiR0ftp27rir?=
 =?us-ascii?Q?8zA+GSCuF+6Pfvu6KxwcAGBHZePnykuRYxZWTwh8nGKFulnqDSiaSq/Ko4sL?=
 =?us-ascii?Q?2dxlf6rOycMdlyO8tZTiRE6WIywqsbbT5fd1Y05nqLGOzq3ukJJ8sKELTD4/?=
 =?us-ascii?Q?vyJ50rg50dslgwiapZZhy3V5jrDF0sPFSdP4m0XWwrNLnEGXU+/caqUCOJRO?=
 =?us-ascii?Q?HDXNXrTEOW9fZiAKqstLlbmrkz6fWMCIxfgvDCAabrVyqyONZqoxEzLYrBUN?=
 =?us-ascii?Q?joVUmYlHcTYWAVQLzSEDNEAhGv6b3F3+G5XNXGbYcL0DfrhyWXDDe0GAEN0R?=
 =?us-ascii?Q?ih0DeYrJSL+bsHZy7DCV/YJfr1rDeqyKeUrMkwiuJ3U4+CSXT+GRsdVDEoZ/?=
 =?us-ascii?Q?QzLTxr/lk8X/qMFwHLJXMMLLGWkfFs3O6zTe+027koawgJHFBY5o/siyopLB?=
 =?us-ascii?Q?fPzfMImzXYr0M5OZa5hFAhDolMicSgsFuZrDuzVRbva3VEWYair/RWo7/Qqa?=
 =?us-ascii?Q?sRkzbVCZ+m8YXlHkiufoUOaPiH+omMoYVpARrgJjaqqnmVJopzIIFKcBLl96?=
 =?us-ascii?Q?7IPlfNFtHtGf1eIR4IA04H2bqU0A1eiLAHG6fp4XPCX91pvjLV+NwuHKdY3S?=
 =?us-ascii?Q?dZEv6vfkU975G8MZY5zIZjH7JNXuySu1KOwpdhdErBTnPblt8KRst9pa8qyn?=
 =?us-ascii?Q?Xt8J83dIKfdxtnSc3ofxhIp6WAPr+KnQGHKLBjEu3tEuKWChBngG3kJdeV70?=
 =?us-ascii?Q?HmES/SSPdkA1XOSFRF1jOJgEgB3lubPY9RCOdNuWXJg0Mv918ERdTJeHP05H?=
 =?us-ascii?Q?woVWjFDq+oMcbz3FzgJgkMG1LfmtOHXHkniF932/tOElsY1S/7TTViLGosDn?=
 =?us-ascii?Q?4fRtS1ikbv7FvsFhyyLZF+hgPBwpONR61NMLvvcxE3I0maGHrecvSPF4U9PT?=
 =?us-ascii?Q?kWO1eN8dlHSt4xNDqKHKWkzth0hA52OWu3ACGqXX5VmvMCNmLLmJhx/5iTeI?=
 =?us-ascii?Q?KaBw/jj2CFBtSuV76OdB3JulvmyPEIcRMFD6+uOxCbjPz0nCbTiVdYcNN40F?=
x-ms-exchange-antispam-messagedata-1: qqSsshORYgVhyw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c81046-cde4-48f1-1dfc-08de4e3e8f50
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 22:46:13.1747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBP26u/cVHqPEYRfXWuErv8qpaZbslP9bQkDy9Hnhid/0vFcKlec1btUkNxKTLa1xYXzmfQ0Ti3j2pX+mVhcGT/oeZ2cEWWsAt4QyiD4D24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7338
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
From: Randhawa, Jagmeet <jagmeet.randhawa@intel.com>=20
Sent: Wednesday, January 7, 2026 11:43 AM
Cc: igt-dev@lists.freedesktop.org; Cavitt, Jonathan <jonathan.cavitt@intel.=
com>; Roper, Matthew D <matthew.d.roper@intel.com>; Randhawa, Jagmeet <jagm=
eet.randhawa@intel.com>
Subject: [i-g-t] tests/intel/xe_ccs: split block-multicopy into 3 submissio=
ns
>=20
> Split the block multicopy test into separate batch buffer
> submissions. Submitting multiple block copies within a
> single submission can  result in incorrect ordering between
> stages. Run each copy as it's own submission then wait for
> completion between stages to ensure proper sequencing
> to prevent the read-after-write hazards.

s/can  result/can result (there are two spaces here)
s/it's/its
s/to prevent the/and prevent possible

But those are just minor grammatical issues that can be fixed at
merge time, so you probably don't need to spin a new revision
just for these small fixes.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

-Jonathan Cavitt

>=20
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  tests/intel/xe_ccs.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index a21922ee5..33dde0c1f 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -281,8 +281,6 @@ static int blt_block_copy3(int xe,
>  	struct blt_copy_data blt0;
>  	struct blt_block_copy_data_ext ext0;
>  	uint64_t bb_offset, alignment;
> -	uint64_t bb_pos =3D 0;
> -	int ret;
> =20
>  	igt_assert_f(ahnd, "block-copy3 supports softpin only\n");
>  	igt_assert_f(blt3, "block-copy3 requires data to do blit\n");
> @@ -303,7 +301,9 @@ static int blt_block_copy3(int xe,
>  	blt0.print_bb =3D blt3->print_bb;
>  	ext0.src =3D ext3->src;
>  	ext0.dst =3D ext3->mid;
> -	bb_pos =3D emit_blt_block_copy(xe, ahnd, &blt0, &ext0, bb_pos, false);
> +	emit_blt_block_copy(xe, ahnd, &blt0, &ext0, 0, true);
> +	intel_ctx_xe_exec(ctx, ahnd, bb_offset);
> +	intel_ctx_xe_sync((intel_ctx_t *)ctx, true);
> =20
>  	/* Second blit mid -> dst */
>  	blt_copy_init(xe, &blt0);
> @@ -314,7 +314,9 @@ static int blt_block_copy3(int xe,
>  	blt0.print_bb =3D blt3->print_bb;
>  	ext0.src =3D ext3->mid;
>  	ext0.dst =3D ext3->dst;
> -	bb_pos =3D emit_blt_block_copy(xe, ahnd, &blt0, &ext0, bb_pos, false);
> +	emit_blt_block_copy(xe, ahnd, &blt0, &ext0, 0, true);
> +	intel_ctx_xe_exec(ctx, ahnd, bb_offset);
> +	intel_ctx_xe_sync((intel_ctx_t *)ctx, true);
> =20
>  	/* Third blit dst -> final */
>  	blt_copy_init(xe, &blt0);
> @@ -325,11 +327,11 @@ static int blt_block_copy3(int xe,
>  	blt0.print_bb =3D blt3->print_bb;
>  	ext0.src =3D ext3->dst;
>  	ext0.dst =3D ext3->final;
> -	bb_pos =3D emit_blt_block_copy(xe, ahnd, &blt0, &ext0, bb_pos, true);
> +	emit_blt_block_copy(xe, ahnd, &blt0, &ext0, 0, true);
> =20
>  	intel_ctx_xe_exec(ctx, ahnd, bb_offset);
> =20
> -	return ret;
> +	return 0;
>  }
> =20
>  #define CHECK_MIN_WIDTH 2
> --=20
> 2.52.0
>=20
>=20
