Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D331CA0EDC
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 04:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD92810E208;
	Thu, 14 Aug 2025 04:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+NO87/P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1961F10E208
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 04:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755146198; x=1786682198;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DIq3yqrxJjXywnbd+jxppN+ry3jG88IypGlMU1bI/JM=;
 b=h+NO87/Pxp4ihvaaWIdv8bb0vGEmlN5RH3W4vBByyoKk0CKTnquwEHsE
 wgFwo3XQ5x2p0XtKDh5VreKaoCphW1r5qKRf0qET0UHjofsV24dB916Cp
 5CoLLWmpKjsZpU9MpuxSuVv5wDI9mGFVqAezrxBHfpaCEwjASmiWtpfzS
 UE1wQSRVldhyH8PQqVJ5bJPQCZ24gtt0U08fhbH77ckgWA+/0Idi1w6De
 WPeUA6t/fltqEQaQKNI6nNYXL8dmXIZL4bOrNbOxUvQiDQGseWqciwuB6
 fb09l9Wpf+Je/+Tult0UkzVrljJTCDPLGxr5SgXe+x1ZteXA5AOSYmTfc A==;
X-CSE-ConnectionGUID: g04095IKRMKC9MhGEhLp6A==
X-CSE-MsgGUID: h+SsSn+9TW+8w5rJTj70hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61075699"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="61075699"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 21:36:37 -0700
X-CSE-ConnectionGUID: ihnIS9NEQ1qY/L+9J5OJGw==
X-CSE-MsgGUID: uyF5VxNfSw+fSicWqtpmig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166301428"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 21:36:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 21:36:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 21:36:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.49)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 21:36:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+3Z1voZiYUrX1vPdTHfQwBcGbpkp0fkQLaMREpRfgOZhberIdF1ebhmFuwmZnjwhRCZMWWd7cqang4IPYOLiiegwFRVWmA9BpRpDV2sdEA2fZ0aW8LqeGxFkKFU8LoTnZXtgZ82Couv6PuA0x1Lf/+83K0+yKR5B6nai8QeWhdlZyx+OaCX85lj7t4eLPZ5c8NVVRjFyk13hWdj8bO5rQA9EwT+BQcljVmZedEhZ/u9Bi/6KZud1EAlJOrn9bSWOmSYBV9eeZeiXvB3QARTPVq+7psWnAr4G4/kg5qOlf9O38pFa4R2rOEpZFb6ZMhv34P30/2I4wPalNW1MvGNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xls5XXY71T835K3HPO4JIVDcHpT8YVvn8+xJj5i+PgE=;
 b=mwcc+TiJ51LoTh6yg4AbUvaqtMaACxhgTOi5A395tojlm/FMTlT4u3d8mb2rwG2DpMi9wCIDUoTRrBMwEBUQ+0FE6FC9eOjos+fcqa7oZ7seOpmKI8Cg0dY+yfX0sqTVOVtS3diIKKilyobvg81E5YHGxZ+0UsjvCMVmOj8cvaYuj8sRBOoempckrzUDUeM0JNBYrS8C/WDLVbFSiU4SQVnrdFsu2PZd6Uo5M+FTAolk8QqgLZ1YH7pNUo8YplTRRZFCj20SpUqKoaaF9apuJxNBNlJX2kuygFoiqQqt89gJSHb6mosf+T7vEHa9WkOt4KkOC/elvkOMeAiwMTzvmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Thu, 14 Aug
 2025 04:36:34 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 04:36:34 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Bai, Zongyao" <zongyao.bai@intel.com>
Subject: RE: [PATCH] tests/intel/xe_exec_balancer: use xe_wait_ufence to
 replace sleep action
Thread-Topic: [PATCH] tests/intel/xe_exec_balancer: use xe_wait_ufence to
 replace sleep action
Thread-Index: AQHb81yj6dh0szDkmU2x5cEn+hTp6rRgQ7MwgAF/XWA=
Date: Thu, 14 Aug 2025 04:36:34 +0000
Message-ID: <CH3PR11MB8434E28C8A6B6611BEAB5E088D35A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250712184126.378709-1-zongyao.bai@intel.com>
 <CH3PR11MB8434490F972AF758DF78E02D8D2AA@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434490F972AF758DF78E02D8D2AA@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS0PR11MB7192:EE_
x-ms-office365-filtering-correlation-id: cdd427e6-5d70-4e66-8a72-08dddaec2660
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?+Il3nnJsh8t2ARLGKZEUsnG8xb7h4nkJk86aQ2iO2bD3fovW6XMm/1xUoCyP?=
 =?us-ascii?Q?l8wf2ObO/szaQOLk112W0ubabzPRIOgS1AAgXRSNdRYnBg/mz59zFqfpll5w?=
 =?us-ascii?Q?XqtKVJ1eUx4GqCKjBuLxIIujhJWmZbPs9SPrxclUplwr1FzK6jj0/an7hrbR?=
 =?us-ascii?Q?rt/W/p86JHfHsiE5KSID0Jfbk/hSEvn8pM9qvSjbJ4CoBWLhtcnMJ52kOLK+?=
 =?us-ascii?Q?2gBpVeeuLmDJasLcKY70rU2mDneJpLG1WP42VV2HDUYINnSdhJEFN+ls2Ego?=
 =?us-ascii?Q?uB4HAh6Ptdcv+ObS8npF2SycyEujf+H/3ez6AOkdhZyL8PpR5CV4TewskiGf?=
 =?us-ascii?Q?FyI/MiVVtCDuvHkYFh9uqvI/1YEm0AZ4rL5VR8CdP8gMe0rTL/71Gw/FbYyL?=
 =?us-ascii?Q?JqtSiRFBWhVzkmwI2vCsfypv5lo9Bn+4ThpOVkqbXsAa1Zghb379DJU6K3yu?=
 =?us-ascii?Q?4sgkgTnyOIQ5BeKvafeW9DiVh+6g697pXMWvPsSC5eC/qle/1zdi8Rejjnrl?=
 =?us-ascii?Q?4SEaMttblW5z4GfSldtPxu2btCjakRMn9HSsefnkx0TaUUJ1wWCoHfiSNWMA?=
 =?us-ascii?Q?wSDkHatYER67zLB1dcp+6RmDVZ6P2bi582BR/RkVnQd0Wrwg4xY8D2zvCdR2?=
 =?us-ascii?Q?AfDW8ecJhxkl5699y7AXDriMl2tDHsPIC2PSa8/Kfd1S7IPXZgdDJ5pllWCt?=
 =?us-ascii?Q?mXMAp5JhSay+yHzcYhnbWUd+eHr6oDFLKbaIjzSHso6Bee5g6Yn95g36Cm/p?=
 =?us-ascii?Q?2Ri1j+ncrZ+UGu2jGXg0iTDFWBkCO+5sv5iaxj2GssOeXoB3Ut9RSUixsLLm?=
 =?us-ascii?Q?Qyg654SDoTpf5Hr61WjtRejWYKOg46pfTKGkrZeOWE6nm75URBI6mn0BziC+?=
 =?us-ascii?Q?F4oqtX2j05JqE77vGo8UgU4ErirufphAuJK6TfrzBs61EwYMBltrd04eI/UM?=
 =?us-ascii?Q?adSQ9xZtwpcg9vouWBFPSFKpIF04TuvtczlD6yrpG68JccCIpZ2dUT49HDV8?=
 =?us-ascii?Q?eJvuzs2w7BKr2F4xBHwD3bIr2Y592d95XcPKDxXwTqCdvvDRIzqMh/G2ExZN?=
 =?us-ascii?Q?BFjcToNlwsNBtwd+uvZhUv9WfI7PAsAHParPSq5IvHM6cnEcZtY0vZ1O1uZh?=
 =?us-ascii?Q?CZIy89vqoD+bkA43ZHSC25A+9LgGHHKb8zqbuxrSykrMKjIr2ByyLa4yhoru?=
 =?us-ascii?Q?B7krYUXE1PFoWaWP9p5f6L79Yhz1c3vJexr2Y0HReYv/e5KJJ3HdJkpG/6kQ?=
 =?us-ascii?Q?Oo1KAlosYZ4gBzpdJhTZvqqRFyYrhhw4gI99zpZOQHvgXKxQ+G8vWzPH6PqB?=
 =?us-ascii?Q?Lv/HfagecsfHhW/OiXgiY/R4Bptif/HHQbls3Wfbw7mn1GXa3x+Ig3tmysR0?=
 =?us-ascii?Q?2XCdl8uehYMfd2sAbnJoZts0R5B5ZnMBSxjAwBYcbAc60Pzbj2Imi1NV9BGJ?=
 =?us-ascii?Q?GjN1TnazSBfAfzXnj6wdS4phg3F2xeRS+BCW2IegmUyYkgcMgubdxg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tTngbpqCq5McgHiAnY8TvnbFVYn3zbZIiFgNcGY2OsUzgHA/oxh1w4B3uNtd?=
 =?us-ascii?Q?cZ5/CZqOXB2ncPN9Ui2GF6UPwvoDlqYm0aWxQ75dZpgP7amkDvJ5cR4Wf4tJ?=
 =?us-ascii?Q?yWv3hqWySBgcLnsUYFD7pSbb25cPsptFPEnoTLqZS7TBH11L7T3/eGdnIzj2?=
 =?us-ascii?Q?22R+tShj1Cu78CWB94kFYNCIFVL6Gi7DNajWPraFQfBig9ieSdF3lOPN207D?=
 =?us-ascii?Q?qJ5Qsyuf5SGyXRxFTgOdSDdGkmrYG5bW4/rYj+qjqgMRPW4bnceYQ1sI19/n?=
 =?us-ascii?Q?mVKpkdovNS1R7l6jTRRx98jZi8ioyoeAuBw9Jd1Q4sqXhDKbzd1jtNbSlqGl?=
 =?us-ascii?Q?HaSbQHyaZXg3OMQ+MegbZDTE7KnrypfTBi4Yefi/tGa0zoWH5AtFpSHgQSu6?=
 =?us-ascii?Q?gXIpXWboyt2bY5QPP33wurEIJ61Auq7J8IW3+6aerDM1qRIezmPJ/8n8EaeM?=
 =?us-ascii?Q?L/m6l6JoM8CGTKRgUP3h33F3xkEoUKDYEcy99Rcphb5naZO7qjqrYTr1C8Jk?=
 =?us-ascii?Q?/XEfkMbyQZGmjUT+NdRfbKoic8Q42YFMgEg29MsSWXEKBgbAroW7dnZV6Vhw?=
 =?us-ascii?Q?LIrM0mxFF1mugy0kE+Z47JIu3v7W57PKo+RlRqS+CrjRzZD1FXQ4KcMXCIeI?=
 =?us-ascii?Q?yIW/uPE6hf2Y/raIvJaGIwQjgvbFT21dZLjwG+A69MRXxaiGXxy0FeFQlyjA?=
 =?us-ascii?Q?DL9jOJzo0tskauillDmZ8oxcOmqOOLmW8mrfJNtpJmuYoJluKVVjRCbvL4QL?=
 =?us-ascii?Q?UyQlMKthHgf+otJ8gJGUNcIQLVACKBJHL5NXe43qYrYqQZ64z7Yp1EerPW5r?=
 =?us-ascii?Q?3nD2tsmhYABrqOHhTnIMu80QQwbI6Zt9mTiHzRDdRUSZGLtatdAYkBmZILIE?=
 =?us-ascii?Q?rzp+MuRZzoD/Z7oY71eIWmS/2FengtA74RebhZC42La8tzAsqm7S7uSSexfm?=
 =?us-ascii?Q?0C66OcP7ALut93kt92BEv/mTSThgxsfOlPJwGMFiSpIMaSCe2oxTcyNIc4ws?=
 =?us-ascii?Q?r1BFOKiiRdWL8T7/ggzeBOj1mM4/MclKJ/KcYURbiMyvEJN5j6aToXGvtDaB?=
 =?us-ascii?Q?hhFnKBxy3rgg+ajI89iGHwpjefy+OcW1MRc7rOvh0aS0mizpSguQZpTOsG2U?=
 =?us-ascii?Q?JM1K9s/EV2ctLcT2+H+gnoaQvJjPLoZurMSYaZ2sZXDo1f+37TUXwnQ706Tq?=
 =?us-ascii?Q?bOEKzo4jUVOJC7BOifTitEUwAh3AHNfOjVMShz5dwcKdulgZ9bjdahmUxlJS?=
 =?us-ascii?Q?5EnR9cme62ez0VOd+rGtywd6ZYwXDrhNnjjNBFH3OOccQuvqNsCkbNvXgreh?=
 =?us-ascii?Q?tU8H7FtIyrjQtNzaT+IOn0DuCFDlBXhrrRDkRzjOnP06i+f8AyL9JM7n+LQz?=
 =?us-ascii?Q?N/IY8Z1rvqbvO7p4mdTXphZjcN0vaelQs/MvdA1g1mxEaDWxkVjJS4l/bAkD?=
 =?us-ascii?Q?WCGShu9wALj+TjHWatm0XGMwRpxA91B85AsapOdTKDkOZUwBrrZT68jRqNxL?=
 =?us-ascii?Q?BcH9S6MQmfcGmnE4Dl4jNIE5W8BedJ1RRclZzrH8liDrNzCKT8hTvcHYuZ5j?=
 =?us-ascii?Q?TiufkxfGrA2LrdbtUia6984B1nphopEdqeqgrHauO6TYA2heAPVCgaiQlD7P?=
 =?us-ascii?Q?yg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd427e6-5d70-4e66-8a72-08dddaec2660
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 04:36:34.7302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LmbKYhfoLZ2A15Hoo82Fnv6YlJPJkpCdEXnnPPTDAwh5Tf09rbZbfxyvBplMNkq9QUVwUIKYiMBYB9h7OdnswZit6IkCKMZyQAZ+gQAWU+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7192
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
> From: Dandamudi, Priyanka
> Sent: 13 August 2025 11:15 AM
> To: Zongyao Bai <zongyao.bai@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Bai, Zongyao <zongyao.bai@intel.com>
> Subject: RE: [PATCH] tests/intel/xe_exec_balancer: use xe_wait_ufence to
> replace sleep action
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Zongyao Bai
> > Sent: 13 July 2025 12:11 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Bai, Zongyao <zongyao.bai@intel.com>
> > Subject: [PATCH] tests/intel/xe_exec_balancer: use xe_wait_ufence to
> > replace sleep action
> >
> >     In the test_cm() function, for cases with the INVALIDATE flag,
> >     use sleep 0.25 seconds to allow all tasks to complete their jobs.
> >     However, this time is sometimes insufficient.
> >
> >     In this patch, xe_wait_ufence (referred to as "fence" for short)
> > actions are added
> >     for the second half of n_execs tasks in INVALIDATE-RACE scenarios.
> >     The changes are as follows:
> >         When flags hit nothing: =3D> No change
> >              -- all n_exec tasks operate with a fence.
> >         When flags include INVALIDATE but do not include RACE: =3D> No =
change
> >              -- the last n_exec task operates with a fence.
> >         When flags include both INVALIDATE and RACE =3D> New in this pa=
tch
> >              -- n_execs/2 + 1 tasks operate with a fence.
> >              -- at least the last n_exec task operates with a fence
> >     Furthermore, modify the xe_wait_ufence timeout value from 1s to
> > INT64_MAX.
> >     It helps avoid the fence timetout error.
> >
> >     With the above changes, all n_exec tasks operate with a fence,
> >     allowing us to remove the sleep part.
> >
> > Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> > ---
> >  tests/intel/xe_exec_balancer.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/tests/intel/xe_exec_balancer.c
> > b/tests/intel/xe_exec_balancer.c index 1747e207c..8b397038a 100644
> > --- a/tests/intel/xe_exec_balancer.c
> > +++ b/tests/intel/xe_exec_balancer.c
> > @@ -527,14 +527,17 @@ test_cm(int fd, int gt, int class, int
> > n_exec_queues, int n_execs,
> >  		}
> >  	}
> >
> > -	j =3D flags & INVALIDATE && n_execs ? n_execs - 1 : 0;
> > +	/* Wait for all execs to complete, and the xe_wait_ufence need to be
> > run at least once. */
> > +	if (flags & INVALIDATE && n_execs) {
> > +		j =3D flags & RACE ? (n_execs/2 + 1) : n_execs-1;
> > +		if (j >=3D n_execs)
> > +			j =3D n_execs - 1;
> > +	} else {
> > +		j =3D 0;
> > +	}
> j never goes beyond n_execs, maximum it will be equal to n_execs (example
> n_execs =3D 2). So, in that case it can be modified to this format j =3D =
flags &
> INVALIDATE && n_execs ? (!(flags & RACE) ? n_execs - 1 : min(n_execs / 2 =
+ 1,
> n_execs - 1)) : 0;
>=20
> >  	for (i =3D j; i < n_execs; i++)
> >  		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> > -			       exec_queues[i % n_exec_queues],
> > NSEC_PER_SEC);
> > -
> > -	/* Wait for all execs to complete */
> > -	if (flags & INVALIDATE)
> > -		usleep(250000);
> > +			       exec_queues[i % n_exec_queues], INT64_MAX);
> >
> >  	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> >  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> > --
> > 2.43.0

