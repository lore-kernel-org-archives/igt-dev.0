Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC583CA600A
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 14:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B7E10E5D5;
	Wed,  7 Oct 2026 14:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R9M3mjRo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8520810F636
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 14:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791384067; x=1822920067;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=UnNTgRQNhHU2nlW61teEzvR/PVD99Hykm9/MQqTw2ks=;
 b=R9M3mjRors+e1LXQpvKM74rgRFX5SJqvLxC0dXUJ9RgWxLc2orD9HvBc
 VS17FPK8+zdL3m0BF68pia0xoJKQ5gqiNfIEO/8tkYAUOjz0fgIxrdMZH
 19jVK3/utdToFO9oYMDSNBGS4JAde6WFFvPhsXxkbpzBV0JU2WP7SNTW7
 3BsKGcgI03mRzIttLxFhv7soe8aDd2b89OoyW8HRzqBu5tBFNJo9J383L
 QBxDwr0O7M3rV0gSV9tDEEezz/0iupyTyY6xmotKGKPnUycTCdnclCHJB
 XSr5mygpWwIJBM3JJXZdrQMiEuGuYdybRtUfUUCQFesW80PqObg0zdTJg Q==;
X-CSE-ConnectionGUID: 5GMSBUJASoqzAhk4nnO+iA==
X-CSE-MsgGUID: 6voU4YJRT8qUy38EXvW79A==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="44350"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208,217";a="44350"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 07:41:07 -0700
X-CSE-ConnectionGUID: fLB8ZicPSza+1df6XFiglQ==
X-CSE-MsgGUID: FT5g2xMwScWNM96HvSpypg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
 d="scan'208,217";a="281217264"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 07:41:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 07:41:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 07:41:06 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 07:41:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdFzozuq55ykAa4lilorgY9tephSlHuhHAY8US6jroEypJTYtVO7fqXNSA1WxvPMaQFRLQtrPLZBMg9ILN8SpORIkMGWsofJ0XlmOZNUo7TDauTRvmkPQVDr5/PQ9WlsRzD0A6TrSNd4YSRIuWK9ngdOc5n66ybtJBJ+klbrL0n0cUpUVFCinzM3OTFxiOiS+G4mtYLcqoozsSMWway7GGZFtZNrP2d6W3iAooX7vLCOz2SZ63EiGwSCi9sN5usTvO7e6xElsaFSqQQgddY0SswwynFUeNFsilOuk7nq2jGLdTgteUanR8VmAVSX3/bHilRYuEORhSePK1eKYfwP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2o+uogfbSDXJvRpMNCrmBzvSfznxfOi2QeCAjI1wCN4=;
 b=xIU7ECPTdpohTW3w7L2nnKe059cjqtW59Sz3SlPn9Ut8aOUxrxGsCSehAZYkJDBFbxb1Q3o4m454M1nblFry6ynBaWoxY7iQt7vbqIJTvCCZCWWOhvGrXmvBHyLUy/Li7eb1ZdgCjBzd/KTmlIrk2R51HJk4wJO3Sf772m//z2Pl1L+wlp6bvgoDgSAMncH23x/UGoQIXLuFxm6Ov5s8cJpkMY6FlPVS4rwVWQrw86vP7NMI6pcdAPHkCJL1fEraK+swEiAGQGnvaUc1154bwGgUAdoNcPIwaodQQDZYxTw4FTNZNVjyO7Gt9eg56CpNAy4ivqCDQsl/NGB6Yr1bMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 14:40:58 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 14:40:58 +0000
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Patil, Shivtej Eknath"
 <shivtej.eknath.patil@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>, "Balasubramanyam, Smitha"
 <smitha.balasubramanyam@intel.com>, "Ramadeva, Dwarakanath"
 <dwarakanath.ramadeva@intel.com>
Subject: Re: [PATCH v1] Revert "tests/intel/xe_pm: add coverage for
 xe_device_sysfs"
Thread-Topic: [PATCH v1] Revert "tests/intel/xe_pm: add coverage for
 xe_device_sysfs"
Thread-Index: AQHdVho+6KKlDL5YV0SnA3d0cTaEi7byGYAAgAANIxk=
Date: Wed, 7 Oct 2026 14:40:58 +0000
Message-ID: <CH0PR11MB52497593FB9C8FDAA873C1A3E5942@CH0PR11MB5249.namprd11.prod.outlook.com>
References: <20261007051044.6399-1-shivtej.eknath.patil@intel.com>
 <20261007135046.ga2yenstriqpbi3k@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20261007135046.ga2yenstriqpbi3k@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5249:EE_|LV3PR11MB8554:EE_
x-ms-office365-filtering-correlation-id: 6b061451-71f8-43e5-bdf2-08df24810044
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|11063799006|5023799004|8096899003|18002099003|22082099003|6133799003|4143699003|38070700021;
x-microsoft-antispam-message-info: A3P+aWgGsYr/+V5fAot5jr+KUELDhLfYAPG+2200D0WG+CW9UYBzj9ylQRBJLk5UFPNTmqbNsGp7V5QrUs4BAhXMG7bcvd3kXpqWKJDwIvoavdBaAqs9cOc+bYv5Y/W3f03RfR8YpV+1qqMQOmtEu4kwxolUSKwNuzu+XrVFqlOk1zmYeUvqHUdwdRSD69SDr5nYW9LnYl+Bja8wPImAZcyUOXmHHGTJP4uKnHWCk1O2nT+6WFsRaFSd3Nev+zasjhoJh+hFd4V75/gmAartUgB4/G2TNbubN5zPp7drAtORIhSpfRznGASZeGhT1I6nyDuXd28JRN/bIu09TUNTMcr8M3NOQuhESJGWgNn5vOqP7wpMszosMXiUe1knfG8nN63leR731YJDxNby//xkwt7FhotfUq9bPfyU0m+X/TJfQubev0Ci3898F/NZVy7tQXAG6RfrqNsC6eICGHToNqrb56roWcuwGIsBsmjyKfIh4Bv6HIGDxcy2kVbWH5DWgiRpXfXnmsKMTXAhCMbvsfmboa6xqDhPoX0YjO+ulrNlkcqlkh/aF+iitfg39ZUNQcY0yPBK+Xjcr0kO4bx26STMzR2bPmb+wZ44WGZu8EJpnRAUl0AooCKNx4mIKWSRj4qAtJTH/OQ+gotUqOqgAYAjcwBwGZXl7RpYfWAfj9BrGo80Ua6gS2hxkKSrQ+acLx23eoS+ESfivmFaQgTsq+0COyH60gYNVxJJBdjtG3Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(5023799004)(8096899003)(18002099003)(22082099003)(6133799003)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jhR87QianOG7Q43sgxGa3utb1mNihESPjmPjh1Z6EBi4fYiO86H03AQemw?=
 =?iso-8859-1?Q?jJL2IXr5IZUK10RgjWU4OXBMeAYIqHrLxxghnciDOXX+SY3s7iLdeLHJTy?=
 =?iso-8859-1?Q?8fNMednIZ4BqtMQ01zKYmPafvzcRzuq3pJOfLy7jiTA3M9DFWAN5gV8Ukg?=
 =?iso-8859-1?Q?S6NsaANnhx4zsFaa98NNFB+IizuRK01+yrWVeFkrBA8BdZwCyaq0t3gjzu?=
 =?iso-8859-1?Q?GBOBnvOFyzHJk70UodtKdBxV5EJ1GQh/jzcp/WWrkvBo9tyN7X/IhyusMd?=
 =?iso-8859-1?Q?gko4d1egwYs3PtSP1znAyJVlU4PXD+yBAgARki1DUvcB/8HbK0scWmr/Ok?=
 =?iso-8859-1?Q?v/7dFlzUroF7AavwnQmcM6so+UpveWV31JAh8ziIrk2c1k/Vr+MIMfNDTC?=
 =?iso-8859-1?Q?9VqKkV8XJxL9S/UFs4dR2Pxzrlk8VMvHQJcNJOnvilpF3yhFsxSoZ8KGff?=
 =?iso-8859-1?Q?WXFEkD0HvSojHyZscZm/icGt7IuTvu+5LvYBI4kWpBZN3Dntonwhz7Zia1?=
 =?iso-8859-1?Q?eSNENAHg8b3XedB+LkdD2ICZeB+q4dJ+cF6e0UFBLnTr57HmfEPJCNNLCk?=
 =?iso-8859-1?Q?gbcwAJg4I0YPJMJ3AuY8T8a3nderTjWmzU+ExPZBTWfjpOqxcdL0DmOKhy?=
 =?iso-8859-1?Q?QaEC1BAzUt3RrJNMvzZQjTIuHMduyUv18UKczg58Gq2cfgYINTLLTGjYd8?=
 =?iso-8859-1?Q?kCIAXs7oNX5uTl6p0lHYoRQnI/tERZETytKb67LUzgmL05SFZuVr3e8prn?=
 =?iso-8859-1?Q?rUhwwlWwyNBRVTdxC7XQ/mUPeSXu31gk99yTHQ5abiYmL9ULPOpQecJdIa?=
 =?iso-8859-1?Q?WmmutYNkeS1DD3HQgedSgZ5VlX6SLp/aFyhl/PLj+y0zZFeG9alSZjIlzB?=
 =?iso-8859-1?Q?105L1M5/2wqHAC1BJ6gNMZcBaM2KoK61YRggP7/8TA5cmuV7VJtmnDjOo5?=
 =?iso-8859-1?Q?nPqwhdVPAK8XWY1pwxh2MvMMsp6D8IyUVuxF8/vuXe/ig6eogUdiIU5FfO?=
 =?iso-8859-1?Q?QMBBQClnLfCmq03+X85KZNra6VZrjVICMtd4GBpiolMlqRnFceVrragFqi?=
 =?iso-8859-1?Q?FqJgHgCTC81sYj2j29crwCQm3M0r4wYSuxNB1Hx+QTTXLSXOvG5IeaoBHQ?=
 =?iso-8859-1?Q?K4YpyYTyZNuXL0e7eAfT1cyMaRrrNbJvdy5EiQ8MQlr0nwRBKfejFpD2N/?=
 =?iso-8859-1?Q?Qtz2g16LRKCAHTR6T72MK6pQjvXWB9ygrm8jmw2Do2EAq9SCp3pJI/KiVX?=
 =?iso-8859-1?Q?iJ2IXR/uXOmBqmPoH9waqkSGQSNq5EzggEXOBe6gk/esQ976H7XKaq5IBs?=
 =?iso-8859-1?Q?cLLdOOhhVvqhQ/QJE2g5t19iEOnuxxlpF5te+k9b9GoL9rkKn6QM5SIDOE?=
 =?iso-8859-1?Q?gsjzVjw6e88vBWlA7O+2ZUxnsDAti50xpC1unj5Yj+GxRz7Xejs2CYd5in?=
 =?iso-8859-1?Q?7m4NLhQioAX1H0iUy5iV3frc6gkLLG6wHtQi5r0wgCx04PnOLtoNOAtrDY?=
 =?iso-8859-1?Q?soUGA2QR0VnknYkYymzzIh3Udhz2cNk4ALi94Rcd3RrPTt+6y7RJdl0jK2?=
 =?iso-8859-1?Q?MK3j47unME3jTq5it2+mcbCJmJK7tJ/Sgf+tr+WVeEEfkMaHP2GxNhC+c1?=
 =?iso-8859-1?Q?NG7yYYV6VsZAi+X1+pzwnaOeB3/0vAOuX5oJQGXJxdmUPgYPV61fzAzc26?=
 =?iso-8859-1?Q?ZZSICXxw1USFkWsgjv56b64E7Eo70PMZN0vVhKYU+CN/LFg8/1tadQQBw/?=
 =?iso-8859-1?Q?J1s1RNBlPkkxeNcABZZKMpubePETMP1J0FecByVdyI74rcM5edKOfjmdZN?=
 =?iso-8859-1?Q?6ASA2VGfZQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB52497593FB9C8FDAA873C1A3E5942CH0PR11MB5249namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: f1gCZiEJ12kynEDUbTF+YEbW+XolnZI2O9axN8vx0RFO1eA9GTR1CdHn1Db0MxkL0QiJtFUykmd4kC7JNY9/dlGirpphDxgFt+0SpAH6+/b/uY+v0Q2U1nNptJ384si/kvdu/WWT/QUh3M4s+mjCgUlMM83txVTalQQQjQG07RTdM8TBZKZoceipg/q+MovjSCNwPg8u8SOtz5fNF9YcE5pY2o9xaY+TjcxaE12DDhObNT+huFXRPPQppmW9eyhU40PwsqNCLxOus3uk5wqxOr6b+e6NW8c/2Jpuo+pNmrPRfr8CAlbddCjYpKvF12pbFfi3y4ZvF7xY/n/t3E7d/w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b061451-71f8-43e5-bdf2-08df24810044
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 14:40:58.3309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LOKuPdPNI7lURwDbwPx/Vl5wMl+rafDEZOO/vuMBEj2o1XiK4UA3VC/UgHPVcfwSpoPC2ZS4YtSNa9viG06+8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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

--_000_CH0PR11MB52497593FB9C8FDAA873C1A3E5942CH0PR11MB5249namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Wednesday, October 07, 2026 7:20 PM
To: Patil, Shivtej Eknath <shivtej.eknath.patil@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Konieczn=
y, Kamil <kamil.konieczny@intel.com>; Sharma, Nishit <nishit.sharma@intel.c=
om>; Balasubramanyam, Smitha <smitha.balasubramanyam@intel.com>; Poosa, Kar=
thik <karthik.poosa@intel.com>; Ramadeva, Dwarakanath <dwarakanath.ramadeva=
@intel.com>
Subject: Re: [PATCH v1] Revert "tests/intel/xe_pm: add coverage for xe_devi=
ce_sysfs"

Hi Shivtej,
On 2026-10-07 at 05:10:44 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
>
> The added subtests exercise sysfs interfaces exposed by
> xe_device_sysfs.c. Subsequent discussion identified that
> these checks are better suited for a dedicated xe_sysfs
> test rather than xe_pm.

Yes, the added tests need not be part of xe_pm as they only check sysfs exi=
stence rather and than any pm related execution.
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com><mailto:karthik.poosa@i=
ntel.com>

Please do not cite original commit message, above should be
removed.

>
> Revert the xe_pm coverage for now. The sysfs coverage will
> be revisited and reintroduced in a more appropriate test.
>
> This reverts commit 92dd3081aa8de197a5dc37b9799526a0de183c8f.
>
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

PS. Reading of sysfs nodes should be covered by core_sysfs,
if not core test should be fixed.

> ---
>  tests/intel/xe_pm.c | 176 ++++++++------------------------------------
>  1 file changed, 31 insertions(+), 145 deletions(-)
>
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 9a70b1645..543f46f5b 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -111,9 +111,34 @@ static bool runtime_usage_available(struct pci_devic=
e *pci)
>        return access(name, F_OK) =3D=3D 0;
>  }
>
> -static bool sysfs_exists(int sysfs_fd, const char *path)
> +static uint64_t get_vram_d3cold_threshold(int sysfs)
>  {
> -     return !faccessat(sysfs_fd, path, R_OK, 0);
> +     uint64_t threshold;
> +     char path[64];
> +     int ret;
> +
> +     sprintf(path, "device/vram_d3cold_threshold");
> +     igt_require_f(!faccessat(sysfs, path, R_OK, 0), "vram_d3cold_thresh=
old is not present\n");
> +
> +     ret =3D igt_sysfs_scanf(sysfs, path, "%"PRIu64"", &threshold);
> +     igt_assert_lt(0, ret);
> +
> +     return threshold;
> +}
> +
> +static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
> +{
> +     char path[64];
> +     int ret;
> +
> +     sprintf(path, "device/vram_d3cold_threshold");
> +
> +     if (!faccessat(sysfs, path, R_OK | W_OK, 0))
> +             ret =3D igt_sysfs_printf(sysfs, path, "%"PRIu64"", threshol=
d);
> +     else
> +             igt_warn("vram_d3cold_threshold is not present\n");
> +
> +     igt_assert_lt(0, ret);
>  }
>
>  static void vram_d3cold_threshold_restore(int sig)
> @@ -123,7 +148,7 @@ static void vram_d3cold_threshold_restore(int sig)
>        fd =3D drm_open_driver_master(DRIVER_XE);
>        sysfs_fd =3D igt_sysfs_open(fd);
>
> -     igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
> +     set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
>
>        close(sysfs_fd);
>        close(fd);
> @@ -595,48 +620,6 @@ test_exec(device_t device, int n_exec_queues, int n_=
execs,
>        active_threads =3D 0;
>  }
>
> -/**
> - * SUBTEST: vram-d3cold-threshold-show
> - * Description:
> - *      Validate reading of vram_d3cold_threshold sysfs entry.
> - * Functionality: pm-d3cold
> - */
> -
> -/**
> - * SUBTEST: vram-d3cold-threshold-store
> - * Description:
> - *      Validate writing and reading back vram_d3cold_threshold sysfs en=
try.
> - * Functionality: pm-d3cold
> - */
> -
> -/**
> - * SUBTEST: lb-fan-control-version-show
> - * Description:
> - *      Validate reading lb_fan_control_version sysfs entry.
> - * Functionality: pm-sysfs
> - */
> -
> -/**
> - * SUBTEST: lb-voltage-regulator-version-show
> - * Description:
> - *      Validate reading lb_voltage_regulator_version sysfs entry.
> - * Functionality: pm-sysfs
> - */
> -
> -/**
> - * SUBTEST: auto-link-downgrade-capable-show
> - * Description:
> - *      Validate reading auto_link_downgrade_capable sysfs entry.
> - * Functionality: pm-sysfs
> - */
> -
> -/**
> - * SUBTEST: auto-link-downgrade-status-show
> - * Description:
> - *      Validate reading auto_link_downgrade_status sysfs entry.
> - * Functionality: pm-sysfs
> - */
> -
>  /**
>   * SUBTEST: vram-d3cold-threshold
>   * Functionality: pm - d3cold
> @@ -687,7 +670,7 @@ static void test_vram_d3cold_threshold(device_t devic=
e, int sysfs_fd)
>        map =3D xe_bo_map(device.fd_xe, bo, SIZE);
>        memset(map, 0, SIZE);
>        munmap(map, SIZE);
> -     igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, threshold);
> +     set_vram_d3cold_threshold(sysfs_fd, threshold);
>
>        /* Setup D3Cold but card should be in D3hot */
>        igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
> @@ -1099,7 +1082,7 @@ int igt_main()
>                }
>
>                igt_describe_f("Validate mmap memory mappings with vram re=
gion,"
> -                            "when device along with parent bridge in %s"=
, d->name);
> +                          "when device along with parent bridge in %s", =
d->name);
>                igt_subtest_f("%s-mmap-vram", d->name) {
>                        int delay_ms;
>
> @@ -1133,108 +1116,11 @@ int igt_main()
>                     "if vram used > vram threshold");
>        igt_subtest("vram-d3cold-threshold") {
>                igt_require_f(has_runtime_pm, "Runtime PM not available\n"=
);
> -             orig_threshold =3D igt_sysfs_get_vram_d3cold_threshold(sysf=
s_fd);
> +             orig_threshold =3D get_vram_d3cold_threshold(sysfs_fd);
>                igt_install_exit_handler(vram_d3cold_threshold_restore);
>                test_vram_d3cold_threshold(device, sysfs_fd);
>        }
>
> -     igt_subtest("vram-d3cold-threshold-show") {
> -             uint64_t threshold;
> -
> -             igt_require(sysfs_exists(sysfs_fd,
> -                                      "device/vram_d3cold_threshold"));
> -
> -             threshold =3D igt_sysfs_get_vram_d3cold_threshold(sysfs_fd)=
;
> -
> -             igt_info("threshold=3D%" PRIu64 "\n", threshold);
> -     }
> -
> -     igt_subtest("vram-d3cold-threshold-store") {
> -             uint64_t old_val;
> -             uint64_t new_val;
> -
> -             igt_require(sysfs_exists(sysfs_fd,
> -                                      "device/vram_d3cold_threshold"));
> -             old_val =3D igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
> -             /*
> -              * Ensure the original threshold is restored even if
> -              * an assertion fails later in the test.
> -              */
> -             orig_threshold =3D old_val;
> -             igt_install_exit_handler(vram_d3cold_threshold_restore);
> -             igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val + 1);
> -             new_val =3D igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
> -             igt_assert_eq(new_val, old_val + 1);
> -             /* restore */
> -             igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val);
> -             igt_info("old=3D%" PRIu64 " new=3D%" PRIu64 "\n",
> -                      old_val, new_val);
> -     }
> -
> -     igt_subtest("lb-fan-control-version-show") {
> -             char version[64];
> -             int ret;
> -
> -             igt_require(sysfs_exists(sysfs_fd,
> -                                      "device/lb_fan_control_version"));
> -
> -             ret =3D igt_sysfs_scanf(sysfs_fd,
> -                                   "device/lb_fan_control_version",
> -                                   "%63s", version);
> -
> -             igt_assert(ret > 0);
> -
> -             igt_info("lb-fan-control-version=3D%s\n", version);
> -     }
> -
> -     igt_subtest("lb-voltage-regulator-version-show") {
> -             char version[64] =3D {};
> -             int ret;
> -
> -             igt_require(sysfs_exists(sysfs_fd,
> -                                      "device/lb_voltage_regulator_versi=
on"));
> -
> -             ret =3D igt_sysfs_scanf(sysfs_fd,
> -                                   "device/lb_voltage_regulator_version"=
,
> -                                   "%63s", version);
> -             igt_debug("ret=3D%d errno=3D%d\n", ret, errno);
> -
> -             igt_assert(ret > 0);
> -             igt_info("lb-voltage-regulator-version=3D%s\n", version);
> -     }
> -
> -     igt_subtest("auto-link-downgrade-capable-show") {
> -             int val;
> -             int ret;
> -
> -             igt_require(sysfs_exists(sysfs_fd,
> -                                      "device/auto_link_downgrade_capabl=
e"));
> -
> -             ret =3D igt_sysfs_scanf(sysfs_fd,
> -                                   "device/auto_link_downgrade_capable",
> -                                   "%d", &val);
> -
> -             igt_assert(ret > 0);
> -             igt_info("auto-link-downgrade-capable=3D%d\n", val);
> -             igt_assert(val =3D=3D 0 || val =3D=3D 1);
> -     }
> -
> -     igt_subtest("auto-link-downgrade-status-show") {
> -             int val;
> -             int ret;
> -
> -             igt_require(sysfs_exists(sysfs_fd,
> -                                      "device/auto_link_downgrade_status=
"));
> -
> -             ret =3D igt_sysfs_scanf(sysfs_fd,
> -                                   "device/auto_link_downgrade_status",
> -                                   "%d", &val);
> -
> -             igt_assert(ret > 0);
> -             igt_info("auto-link-downgrade-status=3D%d\n", val);
> -             igt_assert(val =3D=3D 0 || val =3D=3D 1);
> -     }
> -
>        igt_fixture() {
>                close(sysfs_fd);
>                igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_all=
owed);
> --
> 2.43.0
>

--_000_CH0PR11MB52497593FB9C8FDAA873C1A3E5942CH0PR11MB5249namp_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<br>
<b>Sent:</b> Wednesday, October 07, 2026 7:20 PM<br>
<b>To:</b> Patil, Shivtej Eknath &lt;shivtej.eknath.patil@intel.com&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; Konieczny, Kamil &lt;kamil.konieczny@intel.com&gt;; Sharma, Nishit &lt=
;nishit.sharma@intel.com&gt;; Balasubramanyam, Smitha &lt;smitha.balasubram=
anyam@intel.com&gt;; Poosa, Karthik &lt;karthik.poosa@intel.com&gt;;
 Ramadeva, Dwarakanath &lt;dwarakanath.ramadeva@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH v1] Revert &quot;tests/intel/xe_pm: add coverage=
 for xe_device_sysfs&quot;
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">Hi Shivtej,<br>
On 2026-10-07 at 05:10:44 +0000, shivtej.eknath.patil@intel.com wrote:<br>
&gt; From: Shivtej Patil &lt;shivtej.eknath.patil@intel.com&gt;<br>
&gt;<br>
&gt; The added subtests exercise sysfs interfaces exposed by<br>
&gt; xe_device_sysfs.c. Subsequent discussion identified that<br>
&gt; these checks are better suited for a dedicated xe_sysfs<br>
&gt; test rather than xe_pm.</div>
<div style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Yes, the added tes=
ts need not be part of xe_pm as they only check sysfs existence rather and =
than any pm related execution.</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont,=
 Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 15px;">
<span style=3D"font-size: 11pt;"></span><span class=3D"spanWithBackgroundCo=
lor" style=3D"color: rgb(36, 36, 36); background-color: rgb(255, 255, 255);=
">Reviewed-by: Karthik Poosa
</span><span class=3D"spanWithBackgroundColor" style=3D"color: rgb(0, 0, 0)=
; background-color: rgb(255, 255, 255);"><a href=3D"mailto:karthik.poosa@in=
tel.com" id=3D"OWAefb4e6ab-cd46-0287-4217-e14588dd3f61" class=3D"x_moz-txt-=
link-rfc2396E OWAAutoLink" title=3D"mailto:karthik.poosa@intel.com" data-li=
nkindex=3D"1" style=3D"margin: 0px; background-color: rgb(255, 255, 255); t=
ext-align: left;">&lt;karthik.poosa@intel.com&gt;</a></span></div>
<div style=3D"font-size: 11pt;"><br>
Please do not cite original commit message, above should be<br>
removed.<br>
<br>
&gt; &nbsp;<br>
&gt; Revert the xe_pm coverage for now. The sysfs coverage will<br>
&gt; be revisited and reintroduced in a more appropriate test.<br>
&gt;<br>
&gt; This reverts commit 92dd3081aa8de197a5dc37b9799526a0de183c8f.<br>
&gt;<br>
&gt; Signed-off-by: Shivtej Patil &lt;shivtej.eknath.patil@intel.com&gt;<br=
>
<br>
LGTM<br>
Reviewed-by: Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<br>
<br>
Regards,<br>
Kamil<br>
<br>
PS. Reading of sysfs nodes should be covered by core_sysfs,<br>
if not core test should be fixed.<br>
<br>
&gt; ---<br>
&gt;&nbsp; tests/intel/xe_pm.c | 176 ++++++++------------------------------=
------<br>
&gt;&nbsp; 1 file changed, 31 insertions(+), 145 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c<br>
&gt; index 9a70b1645..543f46f5b 100644<br>
&gt; --- a/tests/intel/xe_pm.c<br>
&gt; +++ b/tests/intel/xe_pm.c<br>
&gt; @@ -111,9 +111,34 @@ static bool runtime_usage_available(struct pci_de=
vice *pci)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return access(name, F_OK) =
=3D=3D 0;<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; -static bool sysfs_exists(int sysfs_fd, const char *path)<br>
&gt; +static uint64_t get_vram_d3cold_threshold(int sysfs)<br>
&gt;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; return !faccessat(sysfs_fd, path, R_OK, 0);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint64_t threshold;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char path[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sprintf(path, &quot;device/vram_d3cold_thres=
hold&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_require_f(!faccessat(sysfs, path, R_OK, =
0), &quot;vram_d3cold_threshold is not present\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_sysfs_scanf(sysfs, path, &quot;%=
&quot;PRIu64&quot;&quot;, &amp;threshold);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_lt(0, ret);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return threshold;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)<=
br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char path[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sprintf(path, &quot;device/vram_d3cold_thres=
hold&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!faccessat(sysfs, path, R_OK | W_OK, 0))=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_sysfs_printf(sysfs, path, &quot;%&quot;PRIu64&quot;&quot;, =
threshold);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_warn(&quot;vram_d3cold_threshold is not present\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_lt(0, ret);<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp; static void vram_d3cold_threshold_restore(int sig)<br>
&gt; @@ -123,7 +148,7 @@ static void vram_d3cold_threshold_restore(int sig)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D drm_open_driver_maste=
r(DRIVER_XE);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysfs_fd =3D igt_sysfs_open(=
fd);<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_sysfs_set_vram_d3cold_threshold(sysfs_fd=
, orig_threshold);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; set_vram_d3cold_threshold(sysfs_fd, orig_thr=
eshold);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(sysfs_fd);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&gt; @@ -595,48 +620,6 @@ test_exec(device_t device, int n_exec_queues, int=
 n_execs,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active_threads =3D 0;<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; -/**<br>
&gt; - * SUBTEST: vram-d3cold-threshold-show<br>
&gt; - * Description:<br>
&gt; - *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Validate reading of vram_d3cold_thre=
shold sysfs entry.<br>
&gt; - * Functionality: pm-d3cold<br>
&gt; - */<br>
&gt; -<br>
&gt; -/**<br>
&gt; - * SUBTEST: vram-d3cold-threshold-store<br>
&gt; - * Description:<br>
&gt; - *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Validate writing and reading back vr=
am_d3cold_threshold sysfs entry.<br>
&gt; - * Functionality: pm-d3cold<br>
&gt; - */<br>
&gt; -<br>
&gt; -/**<br>
&gt; - * SUBTEST: lb-fan-control-version-show<br>
&gt; - * Description:<br>
&gt; - *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Validate reading lb_fan_control_vers=
ion sysfs entry.<br>
&gt; - * Functionality: pm-sysfs<br>
&gt; - */<br>
&gt; -<br>
&gt; -/**<br>
&gt; - * SUBTEST: lb-voltage-regulator-version-show<br>
&gt; - * Description:<br>
&gt; - *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Validate reading lb_voltage_regulato=
r_version sysfs entry.<br>
&gt; - * Functionality: pm-sysfs<br>
&gt; - */<br>
&gt; -<br>
&gt; -/**<br>
&gt; - * SUBTEST: auto-link-downgrade-capable-show<br>
&gt; - * Description:<br>
&gt; - *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Validate reading auto_link_downgrade=
_capable sysfs entry.<br>
&gt; - * Functionality: pm-sysfs<br>
&gt; - */<br>
&gt; -<br>
&gt; -/**<br>
&gt; - * SUBTEST: auto-link-downgrade-status-show<br>
&gt; - * Description:<br>
&gt; - *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Validate reading auto_link_downgrade=
_status sysfs entry.<br>
&gt; - * Functionality: pm-sysfs<br>
&gt; - */<br>
&gt; -<br>
&gt;&nbsp; /**<br>
&gt;&nbsp;&nbsp; * SUBTEST: vram-d3cold-threshold<br>
&gt;&nbsp;&nbsp; * Functionality: pm - d3cold<br>
&gt; @@ -687,7 +670,7 @@ static void test_vram_d3cold_threshold(device_t de=
vice, int sysfs_fd)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map =3D xe_bo_map(device.fd_=
xe, bo, SIZE);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(map, 0, SIZE);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; munmap(map, SIZE);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_sysfs_set_vram_d3cold_threshold(sysfs_fd=
, threshold);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; set_vram_d3cold_threshold(sysfs_fd, threshol=
d);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Setup D3Cold but card sho=
uld be in D3hot */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(setup_d3(device, =
IGT_ACPI_D3Cold));<br>
&gt; @@ -1099,7 +1082,7 @@ int igt_main()<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_describe_f(&quot;Validate mmap memory mappings with=
 vram region,&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &quot;when device along with parent bridge in %s&quot;, =
d-&gt;name);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;when device along with parent bridge in %s&quot;, d-&gt;name);=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_subtest_f(&quot;%s-mmap-vram&quot;, d-&gt;name) {<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int del=
ay_ms;<br>
&gt;&nbsp;<br>
&gt; @@ -1133,108 +1116,11 @@ int igt_main()<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;if vram used &gt; v=
ram threshold&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;vram-d3col=
d-threshold&quot;) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_require_f(has_runtime_pm, &quot;Runtime PM not avai=
lable\n&quot;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; orig_threshold =3D igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; orig_threshold =3D get_vram_d3cold_threshold(sysfs_fd);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_install_exit_handler(vram_d3cold_threshold_restore)=
;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; test_vram_d3cold_threshold(device, sysfs_fd);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;vram-d3cold-threshold-show=
&quot;) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint64_t threshold;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(sysfs_exists(sysfs_fd,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;device/vram_d3cold_threshold&quot;));<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; threshold =3D igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;threshold=3D%&quot; PRIu64 &quot;\n&quot;, threshold);<b=
r>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;vram-d3cold-threshold-stor=
e&quot;) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint64_t old_val;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint64_t new_val;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(sysfs_exists(sysfs_fd,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;device/vram_d3cold_threshold&quot;));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; old_val =3D igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /*<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * Ensure the original threshold is restored even if<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * an assertion fails later in the test.<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; orig_threshold =3D old_val;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_install_exit_handler(vram_d3cold_threshold_restore);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val + 1);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; new_val =3D igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(new_val, old_val + 1);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* restore */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;old=3D%&quot; PRIu64 &quot; new=3D%&quot; PRIu64 &quot;\=
n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_val, new_val)=
;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;lb-fan-control-version-sho=
w&quot;) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char version[64];<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(sysfs_exists(sysfs_fd,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;device/lb_fan_control_version&quot;));<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_sysfs_scanf(sysfs_fd,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;device/l=
b_fan_control_version&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%63s&quo=
t;, version);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(ret &gt; 0);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;lb-fan-control-version=3D%s\n&quot;, version);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;lb-voltage-regulator-versi=
on-show&quot;) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char version[64] =3D {};<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(sysfs_exists(sysfs_fd,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;device/lb_voltage_regulator_version&quot;));<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_sysfs_scanf(sysfs_fd,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;device/l=
b_voltage_regulator_version&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%63s&quo=
t;, version);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_debug(&quot;ret=3D%d errno=3D%d\n&quot;, ret, errno);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(ret &gt; 0);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;lb-voltage-regulator-version=3D%s\n&quot;, version);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;auto-link-downgrade-capabl=
e-show&quot;) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int val;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(sysfs_exists(sysfs_fd,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;device/auto_link_downgrade_capable&quot;));<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_sysfs_scanf(sysfs_fd,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;device/a=
uto_link_downgrade_capable&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%d&quot;=
, &amp;val);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(ret &gt; 0);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;auto-link-downgrade-capable=3D%d\n&quot;, val);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(val =3D=3D 0 || val =3D=3D 1);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;auto-link-downgrade-status=
-show&quot;) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int val;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(sysfs_exists(sysfs_fd,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;device/auto_link_downgrade_status&quot;));<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D igt_sysfs_scanf(sysfs_fd,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;device/a=
uto_link_downgrade_status&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%d&quot;=
, &amp;val);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(ret &gt; 0);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;auto-link-downgrade-status=3D%d\n&quot;, val);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(val =3D=3D 0 || val =3D=3D 1);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; close(sysfs_fd);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_=
allowed);<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</div>
</body>
</html>

--_000_CH0PR11MB52497593FB9C8FDAA873C1A3E5942CH0PR11MB5249namp_--
